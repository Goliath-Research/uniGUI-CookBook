unit IQMS.Common.COMServerShare;

interface

uses
    Winapi.Windows, System.SysUtils, System.Variants;

type
  TRedirectCOMCargo = class  // used when we redirect calls to a DCOM via IQWin32
    ServerName: string;
    Params: array of Variant;
    constructor Create(AServerName: string; AParams: array of Variant);
  end;

  // Create an array (of type Variant) containing the parameters that are
  // required for all DCOM calls.  These methods are called by all DCOM
  // units to initialize the array containing mandatory parameters.
  function GetMandatoryArray: Variant;
  function GetMandatoryArrayEx(const AAddLen: Integer; var AOffSet: Integer; const AIsDNet: Boolean = false): Variant;
  // Return specific parameters from the packet
  function Com_GetUserName(APacket: OleVariant): string;
  function Com_GetPassword(APacket: OleVariant): string;
  function Com_GetAliasName(APacket: OleVariant): string;
  function Com_GetEPlant_ID(APacket: OleVariant): string;

  function IQInstallServer(AServerName: string): Boolean;
  function IQServerExeUpToDate(AServerName: string):Boolean;

const
  // This constant indicates the High array value of the required
  // parameters plus two.  If the required parameters change, then this value
  // must also change.  It is used in the other DCOM units for evaluating
  // and building optional params.
  constOffset = 5;  // = High(AParams) + 2

implementation

uses
    IQMS.Common.Dialogs,
    IQMS.Common.Registry,
    IQMS.Common.ResStrings,
    IQMS.Common.Update,
    IQMS.Common.COMServer,
    IQMS.Common.Miscellaneous,
    IQMS.WebVcl.SecurityManager,
    IQMS.Common.PanelMsg;

function GetMandatoryArray: Variant;
var
   AOffSet: Integer;
begin
  Result := GetMandatoryArrayEx(0, AOffSet, false);
end;

function GetMandatoryArrayEx(const AAddLen: Integer; var AOffSet: Integer; const AIsDNet: Boolean = false): Variant;
var
   ALen: Integer;
begin

  // Set internal offset.  This indicates how many mandatory parameters
  // are in the array, or put another way, it equals High(AParams) + 1.
  AOffSet := constOffset - 1;

  // If we need to increase the array size by some value, then we set that
  // here.  The ALen variable is the actual length of the new array we
  // pass to this function.  The additional array elements will be populated
  // by the calling method.  This is useful if we need to build an array
  // containing the required parameters, but also need to add some optional
  // directives.
  ALen := (AOffSet - 1) + AAddLen;

  // Create the array as a Variant array.  Each element in the array may
  // contain a different data type (string, integer, float, etc.).
  Result := VarArrayCreate([0, ALen], varVariant);

  // Assign required parameters based on the log-in information.
  // The SecurityManager object must already exist by this point.  If not,
  // then we have not logged into the database yet.

  if (SecurityManager <> nil) then
     begin
       Result[0]:= SecurityManager.UserName;
       Result[1]:= SecurityManager.Password;
       if (AIsDNet) then
         Result[2]:= IQGetServerName
       else
         Result[2]:= SecurityManager.ServerName;
       Result[3]:= SecurityManager.EPlant_ID;
     end;
end;

function Com_GetUserName(APacket: OleVariant): string;
begin
  Result:= APacket[0];
end;

function Com_GetPassword(APacket: OleVariant): string;
begin
  Result:= APacket[1];
end;

function Com_GetAliasName(APacket: OleVariant): string;
begin
  Result:= APacket[2];
end;

function Com_GetEPlant_ID(APacket: OleVariant): string;
begin
  Result:= APacket[3];
end;

function IQInstallServer(AServerName: string): Boolean;
var
  AErrCode : Integer;
begin
  Result:= FALSE;
  try
    if not IQServerExeUpToDate(AServerName) then
       ABORT;

    // Make sure we have rights to write to HKEY_CLASSES_ROOT.
    // If not, then inform user.
    // IQMS.Common.ResourceStrings.cTXT0000333 = 'Windows security restrictions have
    // prohibited this module from launching. Please have your Administrator
    // launch this module one time to make it available'

    IQAssert(CanWriteToRoot(HKEY_CLASSES_ROOT), IQMS.Common.ResStrings.cTXT0000333);

    AErrCode:= ExecuteProgramExA('"' + IQGetLocalHomePath + AServerName + '.exe"  /regserver');  {IQMisc}
    if AErrCode <> 0 then
       // 'Unable to install OLE Automation Server ''%s''. Error Code = %d'
       raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000083,
        [AServerName, AErrCode]);

    Result:= True;
    Sleep(3000);  // 12-01-2014 prevent Unknown ProgID error popping 1st time after the dcom gets registered
  except
    on E: EAbort    do;
    on E: Exception do IQError(E.Message);
  end;
end;

function IQServerExeUpToDate(AServerName: string):Boolean;
var
  AFileNameLocal : string;
  AFileNameMaster: string;
  AFileNameLocalConfig : string;
  AFileNameMasterConfig: string;
  hMsg           : TPanelMesg;
begin
  Result:= FALSE;
  hMsg  := NIL;
  try
    AFileNameLocal := IQGetLocalHomePath  + AServerName + '.exe';
    AFileNameMaster:= IQGetMasterHomePath + AServerName + '.exe';
    AFileNameLocalConfig := AFileNameLocal + '.config';
    AFileNameMasterConfig:= AFileNameMaster + '.config';

    // copy exe
    if not FileExists(AFileNameLocal)
      or not IQExeUpToDate(ExtractFileName(AFileNameLocal))
        then
    begin
       if not FileExists(AFileNameMaster) then
          // 'Unable to find master file %s to create a local copy of ''%s'' '
          raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000084,
           [AFileNameMaster, AServerName]);

       if not IQComSrvList.HidePleaseWaitMessage then
          // 'Copying %s from master directory.  Please wait...'
          hMsg:= hPleaseWait(Format(IQMS.Common.ResStrings.cTXT0000085,
           [AServerName]));

       try
         if not CopyFile(PChar(AFileNameMaster), PChar(AFileNameLocal), FALSE) then
            // 'Unable to copy %s to %s. Error Code: %d'
            raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000065,
             [AFileNameMaster, AFileNameLocal, GetLastError]);

         if FileExists(AFileNameMasterConfig) then
           if not CopyFile(PChar(AFileNameMasterConfig), PChar(AFileNameLocalConfig), FALSE) then
              // 'Unable to copy %s to %s. Error Code: %d'
              raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000065,
               [AFileNameMasterConfig, AFileNameLocalConfig, GetLastError]);
       finally
         if Assigned(hMsg) then
            hMsg.Free;
       end;
    end;

    if not FileExists(AFileNameLocal) then
       // 'Unable to find the file, %s, to invoke or register the OLE Automation Server, %s'
       raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000086,
        [AFileNameLocal, AServerName]);

    Result:= TRUE;

  except on E: Exception do
    if not IQComSrvList.HidePleaseWaitMessage then
       IQError(E.Message)
    else
       raise;
  end;
end;

{ TRedirectCOMCargo }
constructor TRedirectCOMCargo.Create(AServerName: string; AParams: array of Variant);
var
  I: Integer;
begin
  ServerName:= AServerName;
  Params:= VarArrayCreate([0, High(AParams)], varVariant);
  for I:= 0 to High(AParams) do
    Params[I]:= AParams[I];
end;

end.
