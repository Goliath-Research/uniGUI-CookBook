unit IQMS.Common.COMShellBase;

interface

uses
  System.Win.ComObj, Winapi.Windows, UNIGUIForm;

type
  TIQShellBase = class(TAutoObject)
  private
    FServer_ID: string;
    FCheckingIsSomeFormVisible: Boolean;
    FAbortJump: Boolean;
  protected
    { Protected declarations }
    function GetMandatoryParams( APacket: OleVariant; var AUserName,
     APassword, AAlias, AEplant_ID: string ): Boolean;
    procedure Execute(APacket: OleVariant); safecall;
    function ExecuteCommand( APacket: OleVariant ):string; safecall;
    procedure LaunchSecurityInspector; safecall;
    procedure CloseSecurityInspector; safecall;
    function SomeFormVisible: Integer; safecall;
    function Get_Server_ID: WideString; safecall;
    procedure Set_Server_ID(const Value: WideString); safecall;
    procedure EnsureLocalStartInFolder( AUserName: string );
    procedure InitializeCOMExe(APacket: OleVariant; ARequestingFreePass: Boolean = FALSE );
    procedure EnsureMatchingUserCredentials(APacket: OleVariant; ARequestingFreePass: Boolean);
  public
    procedure OnExecute( APacket: OleVariant ); virtual; abstract;
  end;

implementation

uses
     {needs to be linked in}
     {*UG_rem_AE*}
     IQMS.Common.CheckPoint,
     IQMS.Common.COMServer,
     IQMS.Common.COMServerShare,
     Vcl.Forms,
     IQMS.Common.Controls,
     System.SysUtils,
     Vcl.FileCtrl,
     IQMS.Common.Dialogs,
     IQMS.Common.ResStrings,
     IQMS.Common.COMShare,
     {*UG_rem_AE*}
     //DB_DM,
     IQMS.WebVcl.SecurityManager,
     IQMS.Common.PanelMsg,
     IQMS.Common.ApplicationSet,
     IQMS.Common.Miscellaneous,
     IQMS.Common.fileUtils,
//     IQMS.Common.Login,
     IQMS.Common.Screen;
//     IQSecIns,

{ Parameters passing in APacket:
  0 - User Name
  1 - Password
  2 - Alias
  3 and on - the rest
}

procedure dbg(s:String);
begin
  TFrmCheckPointList.add( FileNameNoExt(application.ExeName) + ' '+ s);
end;

procedure TIQShellBase.InitializeCOMExe(APacket: OleVariant; ARequestingFreePass: Boolean = FALSE );
begin
  {*UG_rem_AE*}
  AppType:= atCom;        {IQAppSet.pas. AppType is used in the IQMisc to check if invoked localy}

  EnsureLocalStartInFolder( Com_GetUserName( APacket ));

  FAbortJump := false;
  EnsureMatchingUserCredentials( APacket, ARequestingFreePass );

  {*UG_rem_AE*}
  AssignApplicationSettings( Application );      { IQAppSet.pas }
end;


procedure TIQShellBase.EnsureMatchingUserCredentials( APacket: OleVariant; ARequestingFreePass: Boolean );
var
  {*UG_rem_AE*}
  hMsg: TPanelMesg;
  AEplantChanged: Boolean;
  ALoginForm: TUniForm;
  {*UG_rem_AE*}
//  ALogin: TLogin;
begin
//  {*UG_rem_AE*}
//  hMsg:= hPleaseWait(IQMS.Common.ResStrings.cTXT0000078 {'Executing.  Please wait...'} );
//  try
//    ALoginForm := FindFormByClass('TLogin');
//    if Assigned(ALoginForm) then
//       ALogin := ALoginForm as TLogin;
//    if (Assigned(ALogin)) then
//      begin
////        ALogin.UserName := Com_GetUserName(APacket);
////        ALogin.Password := Com_GetPassword(APacket);
////        ALogin.ServerName := Com_GetAliasName(APacket);
////        ALogin.bbtnOKClick(nil);
////        TDB_DataModule.MissedJump := APacket;
//        FAbortJump := true;
//      end
//    else
//    begin
////      CheckExistingCredentials( Com_GetUserName(APacket), Com_GetPassword(APacket), Com_GetAliasName(APacket)); { DB_DM, IQComSrvShr }
////      CheckDBModuleCreated( Com_GetUserName(APacket), Com_GetPassword(APacket), Com_GetAliasName(APacket), ARequestingFreePass ); { DB_DM, IQComSrvShr }
//
//      if (SecurityManager <> nil)  then
//      begin
//        AEplantChanged:= SecurityManager.EPlant_ID <> Com_GetEPlant_ID( APacket);
//        if AEplantChanged then
//        begin
////           CloseAllFormsExcept( Application.MainForm );
//           hMsg:= nil;
//           SecurityManager.EPlant_ID:= Com_GetEPlant_ID( APacket );
//        end;
//      end;
//    end;
//  finally
//    if Assigned(hMsg) then
//       hMsg.Free;
//  end;
end;

procedure TIQShellBase.Execute(APacket: OleVariant);
begin
  InitializeCOMExe( APacket );

  if not FAbortJump then
    begin
      OnExecute( APacket );   {Must be implemented}

      {Send new window to the front}
      // Application.BringToFront;
      ForceForegroundWindowB( Application.Handle );
    end;
end;

function TIQShellBase.ExecuteCommand(APacket: OleVariant): string;
var
  ParamArr: array of Variant;
  ACommand: string;
begin
  Result:= '';
  ParamArr:= APacket;
  if High(ParamArr) < IQMS.Common.COMServerShare.constOffset then
     EXIT;

  ACommand := APacket[IQMS.Common.COMServerShare.constOffset-1];

  // Check Circular DCOM references
  if ACommand = EXEC_COM_CMD_CHECK_CIRCULAR_REF then
     begin
       if IQComSrvList.ServerByName(APacket[IQMS.Common.COMServerShare.constOffset], // Target Server Name
                                    IQINTF_NAME ) > -1 then
          begin
            Result:= 'Y';
            Exit;
          end;

       if IQComSrvList.CheckCircularReferences then
          begin
            Result:= 'Y';
            Exit;
          end;
     end;

  if ACommand = EXEC_FREE_LICENSE_PASS then
     begin
       // Initialize the DCOM executable, passing True for the "free pass"
       // parameter. This method will set the AppType to atCom, and then
       // log the user in.
       // InitializeCOMExe(APacket, True);
       {*UG_rem_AE*}
//       if (ComServer.StartMode <> smStandalone) then
//          InitializeCOMExe(APacket, True)
//       else
//          EnsureMatchingUserCredentials(APacket, True);
       Result := 'Y';
     end;

  // Redirect COM call through IQWIN32
  // else if (ACommand = EXEC_REDIRECT_THROUGH_IQWIN32) and (UpperCase(FileNameNoExt(Application.ExeName)) = 'IQWIN32') then
  // 04-17-2009 - transferred to IQWIn32_Com.pas
end;

function TIQShellBase.GetMandatoryParams( APacket: OleVariant; var AUserName,
 APassword, AAlias, AEplant_ID: string ): Boolean;
var
  ParamArr: array of Variant;
begin
  ParamArr:= APacket;
  Result:= High(ParamArr) >= IQMS.Common.COMServerShare.constOffset;
  AUserName := Com_GetUserName( APacket );
  APassword := Com_GetPassword( APacket );
  AAlias    := Com_GetAliasName( APacket );
  AEplant_ID:= Com_GetEPlant_ID( APacket );
end;

procedure TIQShellBase.LaunchSecurityInspector;
begin
  {*UG_rem_AE*}
//  CreateSecurityInspector;  {IQSecIns}
end;

procedure TIQShellBase.CloseSecurityInspector;
begin
  {*UG_rem_AE*}
//  if Assigned(SecurityInspector) then
//     with SecurityInspector do
//     begin
//       DoFormClose;
//       Release;
//     end;
end;

function TIQShellBase.SomeFormVisible: Integer;
begin
  {When we land here other application is trying to figure out if it needs to get rid of the reference to this server.
   If this server was launched as standalone then we can get rid of the reference on the client (caller) side because this application (server) will stay on}
   {*UG_rem_AE*}
//  if ComServer.StartMode = smStandalone then
//  begin
//    Result:= 0;
//    EXIT;
//  end;

  case Screen.FormCount of
    0: Result:= 0;

    1: begin
         Result:= 0;
         // 09-28-2011 prevent circular reference such as when IQwin32 calls IQQC and IQQC jumps to inventory
         if not FCheckingIsSomeFormVisible then
         try
           FCheckingIsSomeFormVisible:= TRUE;
           if Assigned(IQComSrvList) and (IQComSrvList.CountVisible > 0) then  // IQComSrv.pas
              Result:= 1;
         finally
           FCheckingIsSomeFormVisible:= FALSE;
         end;
       end;
    // 2: begin
    //      {Main form + Open Security Inspector do not count - effectively there are no visible forms}
//          if Assigned(SecurityInspector) then
//             Result:= 0
//          else
//             Result:= 1;
//          if Assigned(IQComSrvList) and (IQComSrvList.CountVisible > 0) then  // IQComSrv.pas
//            Result:= 1;
//        end;
  else
       Result:= 1;
  end;
end;

function TIQShellBase.Get_Server_ID: WideString;
begin
  if FServer_ID = '' then
     FServer_ID:= IntToStr(Application.Handle);
  Result:= FServer_ID;
end;

procedure TIQShellBase.Set_Server_ID(const Value: WideString);
begin
  FServer_ID:= Value;
end;

procedure TIQShellBase.EnsureLocalStartInFolder( AUserName: string );
var
  ALocalPath: string;
  ALocalHome: string;

  function IQIncludeTrailingBackslash(S: string): string;
  begin
    if Length( S ) = 0 then
    begin
       Result:= '\';
       EXIT;
    end;

    if S[ Length(S) ] = '\' then
    begin
       Result:= S;
       EXIT;
    end;

    Result:= S + '\';
  end;

begin
  {*UG_rem_AE*}
  ALocalHome:= IQGetLocalHomePath;
  ALocalPath:= ALocalHome;

  {Incorporate user name in the StartIn dir name}
  if AUserName <> '' then
     ALocalPath:= IQIncludeTrailingBackslash( ALocalPath ) + AUserName;

  {Check if dir exists - if not - default to local home}
  if not DirectoryExists( ALocalPath ) then
     ALocalPath:= ALocalHome;

  {Switch dir}
  if not SetCurrentDir( ALocalPath ) then
     // 'Unable to change directory to %s. ErrCode = %d.'#13#13'Program execution will continue in %s.'
     IQWarning(Format( IQMS.Common.ResStrings.cTXT0000079, [ ALocalPath, GetLastError, GetCurrentDir ]));
end;

end.
