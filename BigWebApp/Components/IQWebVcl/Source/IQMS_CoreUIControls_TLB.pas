unit IQMS_CoreUIControls_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 34747 $
// File generated on 6/22/2012 2:36:49 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\P4\IQWIN\IQMS.CoreUIControls.tlb (1)
// LIBID: {3D3E21AD-2E7E-4C57-B95E-91D064F14711}
// LCID: 0
// Helpfile: 
// HelpString: 
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  LIBID_IQMS_CoreUIControls: TGUID = '{3D3E21AD-2E7E-4C57-B95E-91D064F14711}';
  IID_ICoreUIControls: TGUID = '{3F380A00-9276-4459-A02A-183DD755456A}';
  CLASS_CoreUIControlsInterface: TGUID = '{777C773A-3732-4DFC-8148-0F4D5C0A0F52}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// Constants for enum EMailClientType
type
  EMailClientType = TOleEnum;
const
  EMailClientType_Default = $00000000;
  EMailClientType_Windows = $00000001;
  EMailClientType_Outlook = $00000002;
  EMailClientType_LotusNotes = $00000003;
  EMailClientType_GroupWise = $00000004;

// Constants for enum ContentType
type
  ContentType = TOleEnum;
const
  ContentType_Text = $00000000;
  ContentType_HTML = $00000001;

// Constants for enum SendMethod
type
  SendMethod = TOleEnum;
const
  SendMethod_SendNow = $00000000;
  SendMethod_ShowEditor = $00000001;

// Constants for enum ErrorReportMethod
type
  ErrorReportMethod = TOleEnum;
const
  ErrorReportMethod_Show = $00000000;
  ErrorReportMethod_Log = $00000001;
  ErrorReportMethod_None = $00000002;

type
// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  ICoreUIControls = interface;
  ICoreUIControlsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  CoreUIControlsInterface = ICoreUIControls;

// *********************************************************************//
// Interface: ICoreUIControls
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3F380A00-9276-4459-A02A-183DD755456A}
// *********************************************************************//
  ICoreUIControls = interface(IDispatch)
    ['{3F380A00-9276-4459-A02A-183DD755456A}']
    function ShowMail(const userName: WideString; const password: WideString; 
                      const alias: WideString; eplantID: Int64; const SenderName: WideString; 
                      const senderEMail: WideString; const Recipient: WideString; 
                      const Copy: WideString; const BlindCopy: WideString; 
                      const Subject: WideString; const Body: WideString; 
                      const attachments: WideString; html: WordBool): WordBool; safecall;
    function SendMail(const userName: WideString; const password: WideString; 
                      const alias: WideString; eplantID: Int64; const SenderName: WideString; 
                      const senderEMail: WideString; const Recipient: WideString; 
                      const Copy: WideString; const BlindCopy: WideString; 
                      const Subject: WideString; const Body: WideString; 
                      const attachments: WideString; html: WordBool): WordBool; safecall;
    function SendEmailSMTP(const userName: WideString; const password: WideString; 
                           const alias: WideString; eplantID: Int64; const sender: WideString; 
                           const Recipient: WideString; const Copy: WideString; 
                           const BlindCopy: WideString; const Subject: WideString; 
                           const Body: WideString; const FileName: WideString; isBodyHtml: WordBool): WordBool; safecall;
    function SendEmailSMTPEx(const userName: WideString; const password: WideString; 
                             const alias: WideString; eplantID: Int64; const sender: WideString; 
                             const Recipient: WideString; const Copy: WideString; 
                             const BlindCopy: WideString; const Subject: WideString; 
                             const Body: WideString; const FileName: WideString; 
                             isBodyHtml: WordBool; ErrorReportMethod: ErrorReportMethod;
                             const logFileName: WideString): WordBool; safecall;
    function SystemClientSupportsHTMLBodyText(const userName: WideString;
                                              const password: WideString; const alias: WideString; 
                                              eplantID: Int64): WordBool; safecall;
    function SignXML(const userName: WideString;
                     const password: WideString;
                     const alias: WideString;
                     const fileName: WideString): WordBool; safecall;
    function VerifyXML(const userName: WideString;
                       const password: WideString;
                       const alias: WideString;
                       const fileName: WideString): WordBool; safecall;
    function SendEmailSMTPAsync(const userName: WideString; const password: WideString;
                             const alias: WideString; eplantID: Int64; const sender: WideString;
                             const Recipient: WideString; const Copy: WideString;
                             const BlindCopy: WideString; const Subject: WideString;
                             const Body: WideString; const FileName: WideString;
                             isBodyHtml: WordBool; ErrorReportMethod: ErrorReportMethod;
                             const logFileName: WideString; const token: Int64;
                             const crmMassMailing: Boolean): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  ICoreUIControlsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3F380A00-9276-4459-A02A-183DD755456A}
// *********************************************************************//
  ICoreUIControlsDisp = dispinterface
    ['{3F380A00-9276-4459-A02A-183DD755456A}']
    function ShowMail(const userName: WideString; const password: WideString; 
                      const alias: WideString; eplantID: {??Int64}OleVariant; 
                      const SenderName: WideString; const senderEMail: WideString; 
                      const Recipient: WideString; const Copy: WideString; 
                      const BlindCopy: WideString; const Subject: WideString; 
                      const Body: WideString; const attachments: WideString; html: WordBool): WordBool; dispid 1;
    function SendMail(const userName: WideString; const password: WideString; 
                      const alias: WideString; eplantID: {??Int64}OleVariant; 
                      const SenderName: WideString; const senderEMail: WideString; 
                      const Recipient: WideString; const Copy: WideString; 
                      const BlindCopy: WideString; const Subject: WideString; 
                      const Body: WideString; const attachments: WideString; html: WordBool): WordBool; dispid 2;
    function SendEmailSMTP(const userName: WideString; const password: WideString; 
                           const alias: WideString; eplantID: {??Int64}OleVariant; 
                           const sender: WideString; const Recipient: WideString; 
                           const Copy: WideString; const BlindCopy: WideString; 
                           const Subject: WideString; const Body: WideString; 
                           const FileName: WideString; isBodyHtml: WordBool): WordBool; dispid 3;
    function SendEmailSMTPEx(const userName: WideString; const password: WideString;
                             const alias: WideString; eplantID: {??Int64}OleVariant; 
                             const sender: WideString; const Recipient: WideString; 
                             const Copy: WideString; const BlindCopy: WideString; 
                             const Subject: WideString; const Body: WideString; 
                             const FileName: WideString; isBodyHtml: WordBool; 
                             ErrorReportMethod: ErrorReportMethod; const logFileName: WideString): WordBool; dispid 4;
    function SystemClientSupportsHTMLBodyText(const userName: WideString;
                                              const password: WideString; const alias: WideString;
                                              eplantID: {??Int64}OleVariant): WordBool; dispid 5;
    function SignXML(const userName: WideString; const password: WideString;
                     const alias: WideString; const fileName: WideString): WordBool; dispid 6;
    function VerifyXML(const userName: WideString; const password: WideString;
                     const alias: WideString; const fileName: WideString): WordBool; dispid 7;
    function SendEmailSMTPAsync(const userName: WideString; const password: WideString;
                             const alias: WideString; eplantID: Int64; const sender: WideString;
                             const Recipient: WideString; const Copy: WideString;
                             const BlindCopy: WideString; const Subject: WideString;
                             const Body: WideString; const FileName: WideString;
                             isBodyHtml: WordBool; ErrorReportMethod: ErrorReportMethod;
                             const logFileName: WideString; const token: Int64;
                             const crmMassMailing: WordBool): WordBool; dispid 8;
  end;

// *********************************************************************//
// The Class CoCoreUIControlsInterface provides a Create and CreateRemote method to          
// create instances of the default interface ICoreUIControls exposed by              
// the CoClass CoreUIControlsInterface. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCoreUIControlsInterface = class
    class function Create: ICoreUIControls;
    class function CreateRemote(const MachineName: string): ICoreUIControls;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCoreUIControlsInterface
// Help String      : 
// Default Interface: ICoreUIControls
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCoreUIControlsInterfaceProperties= class;
{$ENDIF}
  TCoreUIControlsInterface = class(TOleServer)
  private
    FIntf: ICoreUIControls;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TCoreUIControlsInterfaceProperties;
    function GetServerProperties: TCoreUIControlsInterfaceProperties;
{$ENDIF}
    function GetDefaultInterface: ICoreUIControls;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICoreUIControls);
    procedure Disconnect; override;
    function ShowMail(const userName: WideString; const password: WideString; 
                      const alias: WideString; eplantID: Int64; const SenderName: WideString; 
                      const senderEMail: WideString; const Recipient: WideString; 
                      const Copy: WideString; const BlindCopy: WideString; 
                      const Subject: WideString; const Body: WideString; 
                      const attachments: WideString; html: WordBool): WordBool;
    function SendMail(const userName: WideString; const password: WideString; 
                      const alias: WideString; eplantID: Int64; const SenderName: WideString; 
                      const senderEMail: WideString; const Recipient: WideString; 
                      const Copy: WideString; const BlindCopy: WideString; 
                      const Subject: WideString; const Body: WideString; 
                      const attachments: WideString; html: WordBool): WordBool;
    function SendEmailSMTP(const userName: WideString; const password: WideString; 
                           const alias: WideString; eplantID: Int64; const sender: WideString; 
                           const Recipient: WideString; const Copy: WideString; 
                           const BlindCopy: WideString; const Subject: WideString; 
                           const Body: WideString; const FileName: WideString; isBodyHtml: WordBool): WordBool;
    function SendEmailSMTPEx(const userName: WideString; const password: WideString;
                             const alias: WideString; eplantID: Int64; const sender: WideString; 
                             const Recipient: WideString; const Copy: WideString; 
                             const BlindCopy: WideString; const Subject: WideString; 
                             const Body: WideString; const FileName: WideString; 
                             isBodyHtml: WordBool; ErrorReportMethod: ErrorReportMethod; 
                             const logFileName: WideString): WordBool;
    function SystemClientSupportsHTMLBodyText(const userName: WideString;
                                              const password: WideString; const alias: WideString;
                                              eplantID: Int64): WordBool;
    function SignXML(const userName: WideString;
                     const password: WideString;
                     const alias: WideString;
                     const fileName: WideString): WordBool;
    function VerifyXML(const userName: WideString;
                       const password: WideString;
                       const alias: WideString;
                       const fileName: WideString): WordBool;
    function SendEmailSMTPAsync(const userName: WideString; const password: WideString;
                             const alias: WideString; eplantID: Int64; const sender: WideString;
                             const Recipient: WideString; const Copy: WideString;
                             const BlindCopy: WideString; const Subject: WideString;
                             const Body: WideString; const FileName: WideString;
                             isBodyHtml: WordBool; ErrorReportMethod: ErrorReportMethod;
                             const logFileName: WideString; const token: Int64;
                             const crmMassMailing: WordBool): WordBool;
    property DefaultInterface: ICoreUIControls read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCoreUIControlsInterfaceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCoreUIControlsInterface
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCoreUIControlsInterfaceProperties = class(TPersistent)
  private
    FServer:    TCoreUIControlsInterface;
    function    GetDefaultInterface: ICoreUIControls;
    constructor Create(AServer: TCoreUIControlsInterface);
  protected
  public
    property DefaultInterface: ICoreUIControls read GetDefaultInterface;
  published
  end;
{$ENDIF}

implementation

uses ComObj;

class function CoCoreUIControlsInterface.Create: ICoreUIControls;
begin
  Result := CreateComObject(CLASS_CoreUIControlsInterface) as ICoreUIControls;
end;

class function CoCoreUIControlsInterface.CreateRemote(const MachineName: string): ICoreUIControls;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CoreUIControlsInterface) as ICoreUIControls;
end;

procedure TCoreUIControlsInterface.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{777C773A-3732-4DFC-8148-0F4D5C0A0F52}';
    IntfIID:   '{3F380A00-9276-4459-A02A-183DD755456A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCoreUIControlsInterface.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICoreUIControls;
  end;
end;

procedure TCoreUIControlsInterface.ConnectTo(svrIntf: ICoreUIControls);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCoreUIControlsInterface.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCoreUIControlsInterface.GetDefaultInterface: ICoreUIControls;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TCoreUIControlsInterface.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCoreUIControlsInterfaceProperties.Create(Self);
{$ENDIF}
end;

destructor TCoreUIControlsInterface.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCoreUIControlsInterface.GetServerProperties: TCoreUIControlsInterfaceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TCoreUIControlsInterface.ShowMail(const userName: WideString; const password: WideString;
                                           const alias: WideString; eplantID: Int64;
                                           const SenderName: WideString;
                                           const senderEMail: WideString;
                                           const Recipient: WideString; const Copy: WideString;
                                           const BlindCopy: WideString; const Subject: WideString;
                                           const Body: WideString; const attachments: WideString;
                                           html: WordBool): WordBool;
begin
  Result := DefaultInterface.ShowMail(userName, password, alias, eplantID, SenderName, senderEMail,
                                      Recipient, Copy, BlindCopy, Subject, Body, attachments, html);
end;

function TCoreUIControlsInterface.SendMail(const userName: WideString; const password: WideString;
                                           const alias: WideString; eplantID: Int64;
                                           const SenderName: WideString;
                                           const senderEMail: WideString;
                                           const Recipient: WideString; const Copy: WideString;
                                           const BlindCopy: WideString; const Subject: WideString;
                                           const Body: WideString; const attachments: WideString;
                                           html: WordBool): WordBool;
begin
  Result := DefaultInterface.SendMail(userName, password, alias, eplantID, SenderName, senderEMail,
                                      Recipient, Copy, BlindCopy, Subject, Body, attachments, html);
end;

function TCoreUIControlsInterface.SendEmailSMTP(const userName: WideString;
                                                const password: WideString;
                                                const alias: WideString; eplantID: Int64;
                                                const sender: WideString;
                                                const Recipient: WideString;
                                                const Copy: WideString;
                                                const BlindCopy: WideString;
                                                const Subject: WideString; const Body: WideString;
                                                const FileName: WideString; isBodyHtml: WordBool): WordBool;
begin
  Result := DefaultInterface.SendEmailSMTP(userName, password, alias, eplantID, sender, Recipient,
                                           Copy, BlindCopy, Subject, Body, FileName, isBodyHtml);
end;

function TCoreUIControlsInterface.SendEmailSMTPEx(const userName: WideString;
                                                  const password: WideString;
                                                  const alias: WideString; eplantID: Int64;
                                                  const sender: WideString;
                                                  const Recipient: WideString;
                                                  const Copy: WideString;
                                                  const BlindCopy: WideString;
                                                  const Subject: WideString;
                                                  const Body: WideString;
                                                  const FileName: WideString; isBodyHtml: WordBool;
                                                  ErrorReportMethod: ErrorReportMethod;
                                                  const logFileName: WideString): WordBool;
begin
  Result := DefaultInterface.SendEmailSMTPEx(userName, password, alias, eplantID, sender,
                                             Recipient, Copy, BlindCopy, Subject, Body, FileName,
                                             isBodyHtml, ErrorReportMethod, logFileName);
end;

function TCoreUIControlsInterface.SendEmailSMTPAsync(const userName: WideString;
                                                     const password: WideString;
                                                     const alias: WideString; eplantID: Int64;
                                                     const sender: WideString;
                                                     const Recipient: WideString;
                                                     const Copy: WideString;
                                                     const BlindCopy: WideString;
                                                     const Subject: WideString;
                                                     const Body: WideString;
                                                     const FileName: WideString; isBodyHtml: WordBool;
                                                     ErrorReportMethod: ErrorReportMethod;
                                                     const logFileName: WideString;
                                                     const token: Int64;
                                                     const crmMassMailing: WordBool): WordBool;
begin
  Result := DefaultInterface.SendEmailSMTPAsync(userName, password, alias, eplantID, sender,
                                                Recipient, Copy, BlindCopy, Subject, Body, FileName,
                                                isBodyHtml, ErrorReportMethod, logFileName,
                                                token, crmMassMailing);
end;


function TCoreUIControlsInterface.SystemClientSupportsHTMLBodyText(const userName: WideString;
                                                                   const password: WideString;
                                                                   const alias: WideString;
                                                                   eplantID: Int64): WordBool;
begin
  Result := DefaultInterface.SystemClientSupportsHTMLBodyText(userName, password, alias, eplantID);
end;

function TCoreUIControlsInterface.SignXML(const userName: WideString;
                                          const password: WideString;
                                          const alias: WideString;
                                          const fileName: WideString): WordBool;
begin
  Result := DefaultInterface.SignXML(userName, password, alias, fileName);
end;

function TCoreUIControlsInterface.VerifyXML(const userName: WideString;
                                            const password: WideString;
                                            const alias: WideString;
                                            const fileName: WideString): WordBool;
begin
  Result := DefaultInterface.VerifyXML(userName, password, alias, fileName);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCoreUIControlsInterfaceProperties.Create(AServer: TCoreUIControlsInterface);
begin
  inherited Create;
  FServer := AServer;
end;

function TCoreUIControlsInterfaceProperties.GetDefaultInterface: ICoreUIControls;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

end.
