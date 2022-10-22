unit IQMS.Common.WatchDogShare;

interface

uses
  System.Classes, Winapi.Windows, System.SysUtils, FireDAC.Stan.Error;

function AssignRTServerInstanceID: Boolean;
procedure NotifyWatchDog( AEvent, AValue: Integer ); {call DCom}
procedure RTServerWatchDog( AErrMesg:  string );     {call DCom}
function IsFatalException( E: Exception ): Boolean;
function AdjustTextOnOracleNetworkRelatedError( E: Exception ): string;
function GetWDEventString( AEvent: Integer ): string;
function GetWDValueString( AValue: Integer ): string;

const
  {event}
  WD_ENABLE_COM_PORT = 1;
  WD_EDIT_PROPERTIES = 2;

  {value}
  WD_FALSE = 0;
  WD_TRUE  = 1;
  WD_TRUE_AND_FORCE_STAY = 2;

type
   ENonFatalException = Exception;
   EFatalMonitorException = Exception;

var
  Restarted_By_WD     : Boolean;
  RTServerInstanceID  : string;
  RTServerAttemptCount: Integer = 1;
  FatalErrCount       : Integer = 0;

implementation

uses
  DBXCommon,
  IQMS.Common.CheckPoint,
  IQMS.Common.COMServerShare,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  RT_WD_TLB,
  System.Math,
  System.Variants,
  Vcl.Forms;

var
  DCOM_WDPortMonitor: IRTServRestart = NIL;
  DCOM_WDProperties : IRTServRestart = NIL;

{Internal function - install WD_RT if was not installed yet}
function CheckInstallServer( AServerName: string ): Boolean;
var
  WD : IRTServRestart;
  ART_WD_Register: string;
begin
  Result:= FALSE;
  ART_WD_Register:= '';
  IQRegStringScalarRead( Application, 'RT_WD_Register', ART_WD_Register );

  //Check for timestamp of when RT_WD was successfully registered before, exit and return true if it exists
  Result:= ART_WD_Register > '';
  if Result then
     EXIT(True);

  //EIQ-8151 IQAlert Fails to Launch as Non-Administrator - AMB 08-10-15
  try
    WD:= CoRTServRestart.Create;
    WD:= nil;
    Result:= TRUE;
  except on E1 : Exception do
    try
      Result:= FALSE;
      Result:= IQInstallServer( AServerName );     {IQComSrvShr.pas}
    except on E2 : Exception do
      raise Exception.CreateFmt('Failed to initialize WatchDog!  '+
                                'The following errors occurred during '+
                                'WD_Share.CheckInstallServer method: '+
                                #13#13+
                                'E1 Exception: %s'+
                                #13#13+
                                'E2 Exception: %s', [ E1.Message,
                                                      E2.Message ]);
    end;
  end;

  if Result then
  //Create timestamp in registry to remember if/when RT_WD was registered
    IQRegStringScalarWrite( Application, 'RT_WD_Register', DateTimeToStr( Now ));
end;

{Check who started the app and assign InstanceID}
function AssignRTServerInstanceID: Boolean;
var
  I: Integer;
begin
  Result:= TRUE;

  { Who started RTServer }
  Restarted_By_WD:= FALSE;
  for I:= 1 to ParamCount do
    if UpperCase( ParamStr( I )) = '_RESTARTED_BY_WD_' then
    begin
       Restarted_By_WD:= TRUE;
       BREAK;
    end;

  if Restarted_By_WD then
  begin
    {Get Instance ID}
    IQRegStringScalarRead ( Application, 'RTServerInstanceID', RTServerInstanceID );

    {Increment Attempt counter}
    IQRegIntegerScalarRead ( Application, 'RTServerAttemptCount', RTServerAttemptCount );
    Inc( RTServerAttemptCount );
    IQRegIntegerScalarWrite( Application, 'RTServerAttemptCount', RTServerAttemptCount );
  end;

  if not Restarted_By_WD or (RTServerInstanceID = '') then
  begin
    // EIQ-8227 Server should be already installed
    Result:= CheckInstallServer( 'RT_WD' );
    Randomize;
    RTServerInstanceID:= Format('%s - %s - %s', [ ExtractFileName( Application.ExeName ), FormatDateTime('MM-DD-YYYY - hh:nn:ss', Now), IntToStr( Random( 100000000  ))] );
    IQRegStringScalarWrite ( Application, 'RTServerInstanceID', RTServerInstanceID );
    RTServerAttemptCount:= 1;
    IQRegIntegerScalarWrite( Application, 'RTServerAttemptCount', RTServerAttemptCount );
  end;
end;


{ When Exception is raised - call DCOM }
procedure RTServerWatchDog( AErrMesg:  string );
var
  I    : Integer;
  S    : string;
  AhWin: DWord;
begin
  MessageBeep( 0 );

  {Fatal Count policy:
   Count = 1: Call WD
   Count = 2: Display Error on the screen
   Other = 3: Exit }

  FatalErrCount:= Min( FatalErrCount + 1, 3 );

  if FatalErrCount > 1 then
  begin
    if FatalErrCount = 2 then
    begin
      IQWarning( IQMS.Common.ResStrings.cTXT0000252 {'Error:'} + #13 + AErrMesg );
      Application.Terminate;
    end;
    EXIT;
  end;

  S:= ParamStr( 0 );
  for I:= 1 to ParamCount do S:= S + ' ' + ParamStr( I );

  if Assigned(Application.MainForm) then
     AhWin:= Application.MainForm.Handle
  else
     AhWin:= 0;

  with CoRTServRestart.Create do
    Execute( VarArrayOf([ RTServerInstanceID,       // RTServID
                          AhWin,                    // hWin     RTServerWin.Handle
                          GetCurrentProcessID,      // ProcID
                          S,                        // CommandLine
                          AErrMesg,                 // ErrorMesg
                          RTServerAttemptCount ])); // AttemptCount
end;


function GetWDEventString( AEvent: Integer ): string;
begin
  Result:= 'WD_EDIT_PROPERTIES';

  if AEvent = 1 then
    Result:= 'WD_ENABLE_COM_PORT';
end;


function GetWDValueString( AValue: Integer ): string;
begin
  Result:= 'WD_FALSE';

  if AValue = 1 then
    Result:= 'WD_TRUE';

  if AValue = 2 then
    Result:= 'WD_TRUE_AND_FORCE_STAY';
end;


{When RTServer is restarted we want to notify WD to stop collecting cycles}
procedure NotifyWatchDog( AEvent, AValue: Integer );
var
  AServer    : IRTServRestart;
  ARecovering: Boolean;

  procedure AssignServer( var PublicDCOMServerReference: IRTServRestart );
  begin
    if not Assigned( PublicDCOMServerReference ) then
       PublicDCOMServerReference:= CoRTServRestart.Create;
    AServer:= PublicDCOMServerReference;
  end;

begin
  // Byron:  Do not internationalize message text.  Reserved for developer use.
  try TFrmCheckPointList.Add( Format('Notifying WD: Event ID = %d (%s), value = %d (%s)',
                              [ AEvent, GetWDEventString(AEvent), AValue, GetWDValueString(AValue) ])); except {no matter what happens do not error out} end;

  {Assign DCOM and execute Notify with recovering mechanism built in}
  ARecovering:= FALSE;
  repeat
     {Keep track of different handles}
     case AEvent of
       WD_ENABLE_COM_PORT: AssignServer( DCOM_WDPortMonitor );
       WD_EDIT_PROPERTIES: AssignServer( DCOM_WDProperties  );
     end;

     {notify}
     try
       AServer.Notify( VarArrayOf([ AEvent, AValue ]));
       BREAK;
     except
       if ARecovering then
          raise;
       DCOM_WDPortMonitor:= NIL;
       DCOM_WDProperties := NIL;
       ARecovering:= TRUE;
     end;
  until FALSE;

  {To keep the screen on or not. When assigning NIL - the DCOM will decrease RefCount and will be gone}
  case AEvent of
    WD_ENABLE_COM_PORT: if AValue = WD_FALSE then
                           DCOM_WDPortMonitor:= NIL;
    WD_EDIT_PROPERTIES: DCOM_WDProperties:= NIL;
  end;
end;


function IsFatalException( E: Exception ): Boolean;
begin
  Result:= FALSE;

  {Delphi Errors}
  if StrInList( E.ClassName, [ 'EStringListError' ]) then
  begin
    Result:= TRUE;
    EXIT;
  end;

  {Oracle}
  if E is EFDDBEngineException then with E as EFDDBEngineException do with Errors[ ErrorCount - 1 ] do
  begin
    Result:= (ErrorCode = 3114 ) or {Not Connected to Oracle}
             (ErrorCode = 3113 ) or {End of File on Communication Channel}
             (ErrorCode = 12560) or {TNS:protocol adapter error}
             (ErrorCode = 530  ) or {TNS:protocol adapter error}
             (ErrorCode = 12547);   {TNS:lost contact}
    EXIT;
  end;

  {Oracle}
  Result:= (Occurances('ORA-03114',E.Message) > 0) or     {Not Connected to Oracle}
     (Occurances('ORA-03113',E.Message) > 0) or     {End of File on Communication Channel}
     (Occurances('ORA-12560',E.Message) > 0) or    {TNS:protocol adapter error}
     (Occurances('ORA-00530',E.Message) > 0) or      {TNS:protocol adapter error}
     (Occurances('ORA-12547',E.Message) > 0);  {TNS:lost contact}
end;


function IsNetworkCausedOracleError( E: Exception ): Boolean;
begin
  Result:= FALSE;

  {Oracle caused by network failure}
  if E is EFDDBEngineException then with E as EFDDBEngineException do with Errors[ ErrorCount - 1 ] do
  begin
    Result:= (ErrorCode = 3114 ) or {Not Connected to Oracle}
             (ErrorCode = 3113 ) or {End of File on Communication Channel}
             (ErrorCode = 12560) or {TNS:protocol adapter error}
             (ErrorCode = 530  ) or {TNS:protocol adapter error}
             (ErrorCode = 12547);   {TNS:lost contact}
    EXIT;
  end
end;


function AdjustTextOnOracleNetworkRelatedError( E: Exception ): string;
begin
  Result:= E.Message;

  if IsNetworkCausedOracleError( E ) then
     Result:= Format('A network interruption was detected which caused the following Oracle error to occur: %s. '+
                     'Please review your network configuration for the cause.', [ E.Message ]);
end;


end.
