unit IQMS.Common.DotNetCOMShared;

(* ***                       Dot-Net DCOM Shared Methods                    ***

   This unit contains shared methods for interacting with .Net applications
   using DCOM.  You must know the DLL name and the Namespace to use these
   methods.

   Example 1:

     with TDotNetApplication.Create(NIL) do
     try
        DLL := 'IQProcessFlow';
        Namespace := 'IQMS.Controls.IQProcessFlowEngine';
        if Connect then
           Server.SomeAction();
     finally
        Free;
     end;

   Example 2:

     procedure TForm1.MyMethod();
     var
        o: Variant;
     begin
       try
         // create the instance
         CheckCreateDNetCOM('IQProcessFlow', // The DLL name
                            'IQMS.Controls.IQProcessFlowEngine', // The Namespace
                            o); // The object

         // login, if necessary
         if not DNET_ConnectToDataBase( oDNET, AAlias, APassword ) then
            begin
              IQError('Unable to establish connection to the remote ' +
               'database. Ensure remote instance is started, check DB alias, ' +
               'password and try again');
              Exit;
            end;

         // interact with the instance
         o.SomeAction();

       finally
         // free the instance
         CheckFreeDNetCOM(o);
       end;
     end;


*)


interface

uses
  Winapi.Windows, Vcl.Forms, System.Classes, System.Variants, System.SysUtils, Vcl.StdCtrls,
  IQMS.Common.DotNetCOMInterOp, IQMS.Common.DotNetCOMInteropConst;

type
  { TWebIQDotNetApplication }
  TWebIQDotNetApplication = class(TComponent)
  private
    {Private declarations}
    FDLL: String;
    FNamespace: String;
    FServer: Variant;
    FConnected: Boolean;
    procedure SetConnected(const Value: Boolean);
    procedure Disconnect;
    function GetConnected: Boolean;
  protected
    {Protected declarations}
    function UserName: String;
    function Password: String;
    function Alias: String;
    function EPlantID: Integer;
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    constructor CreateEx(AOwner: TComponent; ADLL: String; ANamespace: String);
    destructor Destroy; override;
    function Connect: Boolean;
    function Connect3_5: Boolean;
  published
    {Published declarations}
    property DLL: String read FDLL write FDLL;
    property Namespace: String read FNamespace write FNamespace;
    property Server: Variant read FServer write FServer;
    property Connected: Boolean read GetConnected write SetConnected;
  end;

  { TDNetCRM }
  TDNetCRM = class(TWebIQDotNetApplication)
  public
    class function GlobalContextPrompt: Boolean;
  end;

//  { TDNetCRMActivity }
//  TDNetCRMActivity = class(TDotNetApplication)
//  public
//    class procedure Show(const ACRMActivityID: Real);
//  end;

  { TDNetCRMCalendar }
  TDNetCRMCalendar = class(TWebIQDotNetApplication)
  public
    class procedure Show;
    class procedure ShowScheduleCoordinator;
  end;

  { TDNetProcessFlow }
  TDNetProcessFlow = class(TWebIQDotNetApplication)
  public
    class procedure Show(const AFileName: String);
  end;

  { TDNetPlantLayout }
  TDNetPlantLayout = class(TWebIQDotNetApplication)
  public
    class procedure Show;
  end;

  { TDNetProcessFlow }
  TDNetProcMonSPCImport = class(TWebIQDotNetApplication)
  public
    class procedure Show;
  end;

  { TDNetEMailUtils }
  TErrorReportMethod = (rmShow, rmLog, rmNone);
  TDNetEMailUtils = class(TWebIQDotNetApplication)
  private
  public
    class procedure Show(ASenderDisplay, ASenderEMail, ARecipient, ACopy, ABlindCopy, ASubject, ABody, AAttachments: String; AHtml: Boolean);
    class function Send(ASenderDisplay, ASenderEMail, ARecipient, ACopy, ABlindCopy, ASubject, ABody, AAttachments: String; AHtml: Boolean): Boolean;
    class function SendSMTP(ASenderEMail, ARecipient, ACopy, ABlindCopy, ASubject, ABody, AAttachments: String; AHtml: Boolean): Boolean;
    class function SendSMTPEx(ASenderEMail, ARecipient, ACopy, ABlindCopy,
      ASubject, ABody, AAttachments: String; AHtml: Boolean;
      AErrorReportMethod: TErrorReportMethod; ALogFileName: String): Boolean;
    class function SendCRMMassMailItem(ASenderEMail, ARecipient, ACopy, ABlindCopy,
      ASubject, ABody, AAttachments: String; AHtml: Boolean;
      ACRMMailingRecipientID: Integer): Boolean;
    class function CanShowHTMLEMail(): Boolean;
  end;

  { TDNetProcessFlow }
  TDNetApplicationManager = class(TWebIQDotNetApplication)
  public
    class procedure ShowDialog;
  end;

  { TXMLSignature }
  TXMLSignature = class(TWebIQDotNetApplication)
  public
    class function SignXML(const AFileName: string): Boolean;
    class function VerifyXML(const AFileName: string): Boolean;
  end;

const
  { DLL and Namespace declarations }

  // CRM
  dllCRM = 'CRM';
  namespaceCRM = 'IQMS.CRM.IQShell';

  // CRM Calendar
  dllCRMCalendar = 'CRMCalendarLib';
  namespaceCRMCalendar = 'IQMS.CRMCalendar.IQShell';

  // Process Flow
  dllProcessFlow = 'IQMS.ProcessFlow';
  namespaceProcessFlow = 'IQMS.ProcessFlow.IQProcessFlowEngine';

  // Process Monitor
  dllProcMonCmdLib = 'IQRTIOCmdLib';
  namespaceProcMonCmdLib = 'IQMS.RTProcMon.IQRTIOCmdLibInterface';

  // Plant Layout
   dllPlantLayout = 'PlantLayoutLib';
  //namespacePlantLayout = 'IQMS.PlantLayout.PlantLayoutInterface';
   namespacePlantLayout = 'IQMS.PlantLayout.IQShell';

  // Process Monitor SPC Import
  dllSPCImportProcMon = 'ImportProcMon';
  namespaceSPCImportProcMon = 'IQMS.ImportProcMon.SPCImportInterface';

  // E-Mail
  dllCoreUIControls = 'IQMS.CoreUIControls';
  namespaceCoreUIControls = 'IQMS.CoreUIControls.CoreUIControlsInterface';

  // ApplicationManager
  dllAppMan = 'IQMS.AppMan';
  namespaceAppMan = 'IQMS.AppMan.IQShell';

{DNET object create/free}
function CheckCreateDNetCOM(const DLL: String; const Namespace: String;
  var ADotNetObject: Variant; AVersion:String = IQMS.Common.DotNetCOMInteropConst.DNetCurrentVersion ): Boolean;
procedure CheckFreeDNetCOM( var ADotNetObject: Variant );

{Wrappers to DNET}
{connect to the server using connect string and password}
function DNET_ConnectToDataBase( ADotNetObject: Variant; AConnectString,
  APassword: string ): Boolean;

{update blob from file. ASourceFileName includes path+name. ATargetFileName is just a file name for doc_repository.filename}
function DNET_LoadFromFile( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  ASourceFileName: string; ATargetFileName: string ): Boolean;

{dump blob to file. ATargetFileName includes path+name}
function DNET_SaveToFile( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  ATargetFileName: string ): Boolean;

{create new record in doc_repository and update blob from file. ASourceFileName includes path+name. ATargetFileName is just a file name for doc_repository.filename}
function DNET_AppendFromFile( ADotNetObject: Variant;  ADoc_Library_ID,
  AExternal_Doc_ID: Real; var ATraget_Doc_Repository_ID: Real;
  ASourceFileName: string; ATargetFileName: string ): Boolean;

{duplicate doc_repository record and return new record doc_repository.id}
function DNET_Copy( ADotNetObject: Variant; ASource_Doc_Repository_ID: Real;
  ATargetFileName: string; var ATarget_Doc_Repository_ID: Real ): Boolean;

{update doc_repository.filename}
function DNET_UpdateFileName( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  AFileName: string ): Boolean;

{update hist field}
function DNET_UpdateHistFlag( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  AValue: string ): Boolean;

{delete doc_repository record}
function DNET_Delete( ADotNetObject: Variant;
  ADoc_Repository_ID: Real ): Boolean;

{check if .net is connected to the database}
function DNET_IsConnected( ADotNetObject: Variant ): Boolean;

{get version #}
//function DNET_GetVersion( ADotNetObject: Variant ): string;

{build index}
function DNET_BuildIndex( ADotNetObject: Variant; ADoc_Library_ID: Real;
  AIndexPath: string ): Boolean;

{delete all records associated with external_doc_id}
function DNET_Delete_Document_Revisions( ADotNetObject: Variant;
  AExternal_Doc_ID: Real ): Boolean;


implementation

uses
    IQMS.Common.ApplicationSet,
    IQMS.Common.Dates,
    IQMS.Common.DotNetRegister,
    IQMS.Common.FileUtils,
    IQMS.Common.Miscellaneous,
    IQMS.WebVcl.SecurityManager,
    IQMS.Common.StringUtils,
    IQMS.Common.CheckPoint;

var
  CW: Word;

{$REGION 'Internal methods'}

procedure dbg(s:String);
begin
   TFrmCheckPointList.add( FileNameNoExt(application.ExeName) + ' '+ s);
end;

procedure handleError(E: Exception);
begin
 (*UG_rem_AMB*)
  if not IgnoreCOMRaisedEAbort(E) then
    begin
      dbg(E.Message);
      // If console mode, re-raise exception

      if IsConsole or IsCGI then
        raise ExceptClass(E.ClassType).Create(E.Message)
      else
        // Otherwise, display message box
        Application.ShowException(E);
    end;
end;

{$ENDREGION 'Internal methods'}

{------------------------------------------------------------------------------}
{creation of the dnet object}
function CheckCreateDNetCOM(const DLL: String; const Namespace: String;
 var ADotNetObject: Variant; AVersion:String): Boolean;
var
   DLL_Name: String;
begin
  Result:= TRUE;

  // DLL_Name  := iqfile.FileNameNoExt(DLL);
  // 03-05-2009 passed dll name must NOT contain ext .dll
  DLL_Name:= DLL;

  if VarIsEmpty( ADotNetObject ) then
  try
    DisableFPUExceptions( CW );
    try
      IQMS.Common.DotNetCOMInterOp.CreateDNetCOM( ADotNetObject, DLL_Name, Namespace, AVersion );
    except on E: Exception do
      begin
        Result:= FALSE;
        handleError(E);
//        if IsConsole then
//          raise;
//        Application.ShowException(E);
      end;
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;

procedure CheckFreeDNetCOM( var ADotNetObject: Variant );
begin
  if not VarIsEmpty( ADotNetObject ) then
  try
    DisableFPUExceptions( CW );
    FreeDNetObject_Ex( ADotNetObject );
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;

function DNET_ConnectToDataBase( ADotNetObject: Variant; AConnectString,
  APassword: string ): Boolean;
begin
  Result:= FALSE;
  DisableFPUExceptions( CW );
  try
    try
      ADotNetObject.ConnectToDataBase( AConnectString, APassword );
      Result:= ADotNetObject.IsConnected;
    except on E: Exception do
      begin
        Result:= FALSE;
        handleError(E);
//        if IsConsole then
//          raise;
//        Application.ShowException(E);
      end;
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


{------------------------------------------------------------------------------}
{wrappers}
function DNET_LoadFromFile( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  ASourceFileName {full path and name}: string;
  ATargetFileName: string ): Boolean;
begin
  Result:= FALSE;
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.LoadFromFile( ADoc_Repository_ID, ASourceFileName,
        ATargetFileName );
      Result:= TRUE;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


function DNET_SaveToFile( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  ATargetFileName: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then  EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.SaveToFile( ADoc_Repository_ID, ATargetFileName );
      Result:= TRUE;
    except on E: Exception do
      begin
        handleError(E);
//        if IsConsole then
//          raise;
//        Application.ShowException(E);
      end;
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;

function DNET_AppendFromFile( ADotNetObject: Variant;  ADoc_Library_ID,
  AExternal_Doc_ID: Real; var ATraget_Doc_Repository_ID: Real;
  ASourceFileName: string; ATargetFileName: string ): Boolean;
var
  AID: integer;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then  EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      AID:= ADotNetObject.AppendFromFile( ADoc_Library_ID, AExternal_Doc_ID,
        ASourceFileName, ATargetFileName );
      ATraget_Doc_Repository_ID:= AID;
      Result:= AID > 0;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


function DNET_Copy( ADotNetObject: Variant; ASource_Doc_Repository_ID: Real;
  ATargetFileName: string; var ATarget_Doc_Repository_ID: Real ): Boolean;
var
  AID: integer;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then  EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      AID:= ADotNetObject.Copy( ASource_Doc_Repository_ID, ATargetFileName );
      ATarget_Doc_Repository_ID:= AID;
      Result:= AID > 0;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


function DNET_UpdateFileName( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  AFileName: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.UpdateFileName( ADoc_Repository_ID, AFileName );
      Result:= TRUE;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


function DNET_UpdateHistFlag( ADotNetObject: Variant; ADoc_Repository_ID: Real;
  AValue: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      Result:= ADotNetObject.UpdateHistFlag( ADoc_Repository_ID, AValue );
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


function DNET_Delete( ADotNetObject: Variant;
  ADoc_Repository_ID: Real ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.Delete( ADoc_Repository_ID );
      Result:= TRUE;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


function DNET_IsConnected( ADotNetObject: Variant ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;

  DisableFPUExceptions( CW );
  try
    try
      if ADotNetObject.IsConnected then
         Result:= TRUE;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


{function DNET_GetVersion( ADotNetObject: Variant ): string;
begin
  Result:= 'N/A';
  if VarIsEmpty( ADotNetObject ) then EXIT;

  DisableFPUExceptions( CW );
  try
    try
      if ADotNetObject.IsConnected then
         Result:= ADotNetObject.GetVersion;
    except on E: Exception do
      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;}


function DNET_BuildIndex( ADotNetObject: Variant; ADoc_Library_ID: Real;
  AIndexPath: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.BuildIndex( ADoc_Library_ID, AIndexPath );
      Result:= TRUE;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;


function DNET_Delete_Document_Revisions( ADotNetObject: Variant;
  AExternal_Doc_ID: Real ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.DeleteDocumentRevisions( AExternal_Doc_ID );
      Result:= TRUE;
    except on E: Exception do
      handleError(E);
//      Application.ShowException(E);
    end;
  finally
    IQMS.Common.DotNetCOMInterOp.RestoreFPU( CW );
  end;
end;

{ TWebIQDotNetApplication }

constructor TWebIQDotNetApplication.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Disable FPU
  DisableFPUExceptions( CW );
end;

constructor TWebIQDotNetApplication.CreateEx(AOwner: TComponent; ADLL,
  ANamespace: String);
begin
  Create(AOwner); // see above
  DLL := ADLL;
  Namespace := ANamespace;
end;

destructor TWebIQDotNetApplication.Destroy;
begin
  dbg('TDotNetApplication.Destroy');
  // free the instance
  Disconnect;

  // 09/21/2011 Restore FPU; this is disabled on the constructor
  RestoreFPU(CW);

  inherited Destroy;
  dbg('TDotNetApplication.Destroy end');
end;

function TWebIQDotNetApplication.Connect: Boolean;
begin
  Result := False;

  if (DLL = '') or (Namespace = '') then Exit;

  // create the instance
  try
    IQMS.Common.DotNetCOMInterOp.CreateDNetCOM( FServer, DLL, Namespace, IQMS.Common.DotNetCOMInterOpConst.DNetCurrentVersion );
    Result := True;
  except on E: Exception do
    begin
      handleError(E);
//      if not (E is EAbort) then
//         Application.ShowException(E);
    end;
  end;

  FConnected := Result;
end;

function TWebIQDotNetApplication.Connect3_5: Boolean;
begin
  Result := False;

  if (DLL = '') or (Namespace = '') then Exit;

  // create the instance
  try
    IQMS.Common.DotNetCOMInterOp.CreateDNetCOM( FServer, DLL, Namespace, IQMS.Common.DotNetCOMInterOpConst.DNetVersion3_5 );
  except on E: Exception do
    begin
      handleError(E);
//      Application.ShowException(E);
    end;
  end;

  FConnected := Result;
end;

procedure TWebIQDotNetApplication.Disconnect;
begin
  dbg('TDotNetApplication.Destroy Disconnect');
  try
    DisposeAndFreeDNetObject_Ex( FServer );
  except on E:Exception do
    dbg('TDotNetApplication.Destroy DisposeAndFreeDNetObject_Ex Error - ' + E.Message );
  end;
  if not VarIsEmpty( FServer ) then
    FreeDNetObject_Ex( FServer );
  FServer :=  System.Variants.Unassigned;
  FConnected := False;
  dbg('TDotNetApplication.Destroy Disconnect end');
end;

function TWebIQDotNetApplication.GetConnected: Boolean;
begin
  Result := FConnected;
end;

procedure TWebIQDotNetApplication.SetConnected(const Value: Boolean);
begin
  if Value then
     Connect
  else
     Disconnect;
end;

function TWebIQDotNetApplication.UserName: String;
begin
  // Pass the user login name
  (*UG_rem_AMB*)
  if (SecurityManager <> nil) then
    Result := UpperCase(SecurityManager.UserName);

  if (IsConsole) and (IsCGI) then
    Result := IQGetUID; //Required for sending from WMS/WebDirect EIQ-109 SER 3761
end;

function TWebIQDotNetApplication.Password: String;
begin
  // Pass the user login password
  (*UG_rem_AMB*)
  if (SecurityManager <> nil) then
    Result := SecurityManager.Password;

  if (IsConsole) and (IsCGI) then
   Result := IQGetPassword; //Required for sending from WMS/WebDirect EIQ-109 SER 3761
end;

function TWebIQDotNetApplication.Alias: String;
begin
  // Pass the Oracle alias name.
  (*UG_rem_AMB*)
  Result := IQGetServerName;
end;

function TWebIQDotNetApplication.EPlantID: Integer;
begin
  (*UG_rem_AMB*)
  if (SecurityManager <> nil) then
     Result := Trunc(SecurityManager.EPlant_ID_AsFloat)
  else
     Result := 0;
end;

{ TDNetCRM }

class function TDNetCRM.GlobalContextPrompt: Boolean;
begin
  Result := False;
  with Self.CreateEx(Application, dllCRM, namespaceCRM) do
  try
     if Connect and not VarIsEmpty(Server) then
        Result := Server.GlobalContextPrompt(UserName, Password, Alias, EPlantID);
  finally
     Free;
  end;
end;

{ TDNetCRMActivity }

//class procedure TDNetCRMActivity.Show(const ACRMActivityID: Real);
//begin
//  with Self.CreateEx(Application, dllCRM, namespaceCRM) do
//  try
//     if Connect and not VarIsEmpty(Server) then
//        Server.ShowCRMActivity(UserName, Password, Alias, EPlantID,
//                               ACRMActivityID);
//  finally
//     Free;
//  end;
//end;

{ TDNetCRMCalendar }

class procedure TDNetCRMCalendar.Show;
begin
  with Self.CreateEx(Application, dllCRMCalendar, namespaceCRMCalendar) do
  try
     if Connect and not VarIsEmpty(Server) then
        Server.LaunchCRMCalendar(UserName, Password, Alias, EPlantID);
  finally
     //Free;
  end;
end;

class procedure TDNetCRMCalendar.ShowScheduleCoordinator;
begin
  with Self.CreateEx(Application, dllCRMCalendar, namespaceCRMCalendar) do
  try
     if Connect and not VarIsEmpty(Server) then
        //public void LaunchCRMScheduleCoordinator(string userName, string password, string alias, Int64 eplantID,
        //    DateTime start, string userList)
        (*UG_rem_AMB*)
        Server.LaunchCRMScheduleCoordinator(UserName, Password, Alias,
         EPlantID, IQOracleAdjustedDateTime, SecurityManager.UserName);
  finally
     Free;
  end;
end;

{ TDNetProcessFlow }

class procedure TDNetProcessFlow.Show(const AFileName: String);
begin
  with Self.CreateEx(Application, dllProcessFlow, namespaceProcessFlow) do
  try
     if Connect and not VarIsEmpty(Server) then
        Server.OpenProcessFlowDialog(AFileName);
  finally
     Free;
  end;
end;

{ TDNetPlantLayout }

class procedure TDNetPlantLayout.Show;
begin
  with Self.CreateEx(Application, dllPlantLayout, namespacePlantLayout) do
  try
     if Connect and not VarIsEmpty(Server) then
        Server.OpenPlantLayoutDialog(UserName, Password, Alias, EPlantID);
  finally
     Free;
  end;
end;

{ TDNetProcMonSPCImport }

class procedure TDNetProcMonSPCImport.Show;
begin
  with Self.CreateEx(Application, dllSPCImportProcMon, namespaceSPCImportProcMon) do
  try
     if Connect and not VarIsEmpty(Server) then
        Server.LaunchProcMonImport(UserName, Password, Alias, EPlantID);
  finally
     Free;
  end;
end;

{ TDNetEMailUtils }

class function TDNetEMailUtils.CanShowHTMLEMail: Boolean;
begin
  try
    with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
    try
       if Connect and not VarIsEmpty(Server) then
          begin
            Result := Server.SystemClientSupportsHTMLBodyText(UserName, Password, Alias, EPlantID);
          end;
    finally
       Free;
    end;
  except on E: Exception do
    handleError(E);
  end;
end;

class function TDNetEMailUtils.Send(ASenderDisplay, ASenderEMail, ARecipient,
  ACopy, ABlindCopy, ASubject, ABody, AAttachments: String;
  AHtml: Boolean): Boolean;
begin
  with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
  try
     if Connect and not VarIsEmpty(Server) then
        try
          Result := Server.SendMail(UserName, Password, Alias, EPlantID,
            ASenderDisplay, ASenderEMail, ARecipient, ACopy, ABlindCopy,
            ASubject, ABody, AAttachments, AHtml);
        except on E:Exception do
          handleError(E);
        end;
  finally
     Free;
  end;
end;

class function TDNetEMailUtils.SendSMTP(ASenderEMail, ARecipient, ACopy, ABlindCopy,
  ASubject, ABody, AAttachments: String; AHtml: Boolean): Boolean;
begin
  with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
  try
     if Connect and not VarIsEmpty(Server) then
        try
           {
           public bool SendEmailSMTP(string userName, string password, string alias, Int64 eplantID,
               string recipient, string copy, string blindCopy,
               string subject, string body, string filename, bool isBodyHtml)
           }
           Result := Server.SendEmailSMTP(UserName, Password, Alias, EPlantID,
               ASenderEMail, ARecipient, ACopy, ABlindCopy,
               ASubject, ABody, AAttachments, AHtml);
        except on E:Exception do
          handleError(E);
        end;
  finally
     Free;
  end;
end;

class function TDNetEMailUtils.SendSMTPEx(ASenderEMail, ARecipient, ACopy,
  ABlindCopy, ASubject, ABody, AAttachments: String; AHtml: Boolean;
  AErrorReportMethod: TErrorReportMethod; ALogFileName: String): Boolean;
begin
  with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
  try
     if Connect and not VarIsEmpty(Server) then
        try
           Result := Server.SendEmailSMTPEx(UserName, Password, Alias, EPlantID,
               ASenderEMail, ARecipient, ACopy, ABlindCopy,
               ASubject, ABody, AAttachments, AHtml, Ord(AErrorReportMethod),
               ALogFileName);
        except on E:Exception do
          handleError(E);
        end;
  finally
     Free;
  end;
end;

class function TDNetEMailUtils.SendCRMMassMailItem(ASenderEMail, ARecipient,
  ACopy, ABlindCopy, ASubject, ABody, AAttachments: String; AHtml: Boolean;
  ACRMMailingRecipientID: Integer): Boolean;
begin
  with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
  try
     if Connect and not VarIsEmpty(Server) then
        try
           Result := Server.SendEmailSMTPAsync(UserName, Password, Alias, EPlantID,
               ASenderEMail, ARecipient, ACopy, ABlindCopy,
               ASubject, ABody, AAttachments, AHtml, 1, '',
               ACRMMailingRecipientID, True);
        except on E:Exception do
          handleError(E);
        end;
  finally
     Free;
  end;
end;


class procedure TDNetEMailUtils.Show(ASenderDisplay, ASenderEMail, ARecipient, ACopy, ABlindCopy, ASubject, ABody, AAttachments: String; AHtml: Boolean);
begin
  with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
  try
     if Connect and not VarIsEmpty(Server) then
        try
          Server.ShowMail(UserName, Password, Alias, EPlantID,
            ASenderDisplay, ASenderEMail, ARecipient, ACopy, ABlindCopy,
            ASubject, ABody, AAttachments, AHtml);
        except on E:Exception do
          handleError(E);
        end;
  finally
     Free;
  end;
end;

{ TDNetApplicationManager }

class procedure TDNetApplicationManager.ShowDialog;
begin
  with Self.CreateEx(Application, dllAppMan, namespaceAppMan) do
  try
     if Connect and not VarIsEmpty(Server) then
     try
       Server.ShowDialog( UserName, Password, Alias, EPlantID );
     except on E:Exception do
       handleError(E);
     end;
  finally
    Free;
  end;
end;

{ TXMLSignature }

class function TXMLSignature.SignXML(const AFileName: string): Boolean;
begin
  Result := False;
  with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
  try
     if Connect and not VarIsEmpty(Server) then
        try
          Result := Server.SignXML(UserName, Password, Alias, AFileName);
        except on E:Exception do
          handleError(E);
        end;
  finally
     Free;
  end;
end;

class function TXMLSignature.VerifyXML(const AFileName: string): Boolean;
begin
  Result := False;
  with Self.CreateEx(Application, dllCoreUIControls, namespaceCoreUIControls) do
  try
     if Connect and not VarIsEmpty(Server) then
        try
          Result := Server.VerifyXML(UserName, Password, Alias, AFileName);
        except on E:Exception do
          handleError(E);
        end;
  finally
     Free;
  end;
end;

end.
