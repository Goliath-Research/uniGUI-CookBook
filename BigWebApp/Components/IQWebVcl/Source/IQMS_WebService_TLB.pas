unit IQMS_WebService_TLB;

// ************************************************************************ //
//WARNING
//-------
//The types declared in this file were generated from data read from a
//Type Library. If this type library is explicitly or indirectly (via
//another type library referring to this type library) re-imported, or the
//'Refresh' command of the Type Library Editor activated while editing the
//Type Library, the contents of this file will be regenerated and all
//manual modifications will be lost.
// ************************************************************************ //

//$Rev: 52393 $
//File generated on 3/11/2016 11:53:42 AM from Type Library described below.

// ************************************************************************  //
//Type Lib: C:\P4\delphi\iqwin\IQMSWebService.tlb (1)
//LIBID: {E9315994-87C0-4841-B262-A6161777E85B}
//LCID: 0
//Helpfile:
//HelpString:
//DepndLst:
//(1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//(2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
//SYS_KIND: SYS_WIN32
//Errors:
//Error creating palette bitmap of (TWebService) : Server mscoree.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} //Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses
  Winapi.Windows, mscorlib_TLB, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics,
  Vcl.OleServer, Winapi.ActiveX;

// *********************************************************************//
//GUIDS declared in the TypeLibrary. Following prefixes are used:
//Type Libraries     : LIBID_xxxx
//CoClasses          : CLASS_xxxx
//DISPInterfaces     : DIID_xxxx
//Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  //TypeLibrary Major and minor versions
  IQMS_WebServiceMajorVersion = 1;
  IQMS_WebServiceMinorVersion = 0;

  LIBID_IQMS_WebService: TGUID = '{E9315994-87C0-4841-B262-A6161777E85B}';

  IID_IWebService: TGUID = '{32F399F1-D6BA-4EA1-8A78-46759EC82333}';
  CLASS_WebService: TGUID = '{27A1B1C8-A6CE-471E-B703-F50F08531716}';

  // *********************************************************************//
  //Declaration of Enumerations defined in Type Library
  // *********************************************************************//
  //Constants for enum ContentTypes
type
  ContentTypes = TOleEnum;

const
  ContentTypes_XML = $00000000;
  ContentTypes_HTMLForm = $00000001;
  ContentTypes_JSon = $00000002;

type

  // *********************************************************************//
  //Forward declaration of types defined in TypeLibrary
  // *********************************************************************//
  IWebService = interface;
  IWebServiceDisp = dispinterface;

  // *********************************************************************//
  //Declaration of CoClasses defined in Type Library
  //(NOTE: Here we map each CoClass to its Default Interface)
  // *********************************************************************//
  WebService = IWebService;

  // *********************************************************************//
  //Interface: IWebService
  //Flags:     (4416) Dual OleAutomation Dispatchable
  //GUID:      {32F399F1-D6BA-4EA1-8A78-46759EC82333}
  // *********************************************************************//
  IWebService = interface(IDispatch)
    ['{32F399F1-D6BA-4EA1-8A78-46759EC82333}']
    function Execute(const url: WideString; port: Integer; timeOut: Integer;
      contentType: ContentTypes; const userAgent: WideString;
      const request: WideString; out response: WideString): WordBool; safecall;
    function ExecuteThroughFirewall(const url: WideString; port: Integer; timeOut: Integer;
      contentType: ContentTypes; const userAgent: WideString;
      const firewallHost: WideString; firewallPort: Integer;
      const firewallDomain: WideString;
      const firewallUserName: WideString;
      const firewallPassword: WideString; const request: WideString;
      out response: WideString): WordBool; safecall;
  end;

  // *********************************************************************//
  //DispIntf:  IWebServiceDisp
  //Flags:     (4416) Dual OleAutomation Dispatchable
  //GUID:      {32F399F1-D6BA-4EA1-8A78-46759EC82333}
  // *********************************************************************//
  IWebServiceDisp = dispinterface
    ['{32F399F1-D6BA-4EA1-8A78-46759EC82333}']
    function Execute(const url: WideString; port: Integer; timeOut: Integer;
      contentType: ContentTypes; const userAgent: WideString;
      const request: WideString; out response: WideString): WordBool; dispid 1;
    function ExecuteThroughFirewall(const url: WideString; port: Integer; timeOut: Integer;
      contentType: ContentTypes; const userAgent: WideString;
      const firewallHost: WideString; firewallPort: Integer;
      const firewallDomain: WideString;
      const firewallUserName: WideString;
      const firewallPassword: WideString; const request: WideString;
      out response: WideString): WordBool; dispid 2;
  end;

  // *********************************************************************//
  //The Class CoWebService provides a Create and CreateRemote method to
  //create instances of the default interface IWebService exposed by
  //the CoClass WebService. The functions are intended to be used by
  //clients wishing to automate the CoClass objects exposed by the
  //server of this typelibrary.
  // *********************************************************************//
  CoWebService = class
    class function Create: IWebService;
    class function CreateRemote(const MachineName: string): IWebService;
  end;

  // *********************************************************************//
  //OLE Server Proxy class declaration
  //Server Object    : TWebService
  //Help String      :
  //Default Interface: IWebService
  //Def. Intf. DISP? : No
  //Event   Interface:
  //TypeFlags        : (2) CanCreate
  // *********************************************************************//
  TWebService = class(TOleServer)
  private
    FIntf: IWebService;
    function GetDefaultInterface: IWebService;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IWebService);
    procedure Disconnect; override;
    function Execute(const url: WideString; port: Integer; timeOut: Integer;
      contentType: ContentTypes; const userAgent: WideString;
      const request: WideString; out response: WideString): WordBool;
    function ExecuteThroughFirewall(const url: WideString; port: Integer; timeOut: Integer;
      contentType: ContentTypes; const userAgent: WideString;
      const firewallHost: WideString; firewallPort: Integer;
      const firewallDomain: WideString;
      const firewallUserName: WideString;
      const firewallPassword: WideString; const request: WideString;
      out response: WideString): WordBool;
    property DefaultInterface: IWebService read GetDefaultInterface;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses
  System.Win.ComObj;

class function CoWebService.Create: IWebService;
begin
  Result := CreateComObject(CLASS_WebService) as IWebService;
end;

class function CoWebService.CreateRemote(const MachineName: string): IWebService;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WebService) as IWebService;
end;

procedure TWebService.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{27A1B1C8-A6CE-471E-B703-F50F08531716}';
    IntfIID: '{32F399F1-D6BA-4EA1-8A78-46759EC82333}';
    EventIID: '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TWebService.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    FIntf := punk as IWebService;
  end;
end;

procedure TWebService.ConnectTo(svrIntf: IWebService);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TWebService.Disconnect;
begin
  if FIntf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TWebService.GetDefaultInterface: IWebService;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TWebService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TWebService.Destroy;
begin
  inherited Destroy;
end;

function TWebService.Execute(const url: WideString; port: Integer; timeOut: Integer;
  contentType: ContentTypes; const userAgent: WideString;
  const request: WideString; out response: WideString): WordBool;
begin
  Result := DefaultInterface.Execute(url, port, timeOut, contentType, userAgent, request, response);
end;

function TWebService.ExecuteThroughFirewall(const url: WideString; port: Integer; timeOut: Integer;
  contentType: ContentTypes; const userAgent: WideString;
  const firewallHost: WideString; firewallPort: Integer;
  const firewallDomain: WideString;
  const firewallUserName: WideString;
  const firewallPassword: WideString;
  const request: WideString; out response: WideString): WordBool;
begin
  Result := DefaultInterface.ExecuteThroughFirewall(url, port, timeOut, contentType, userAgent,
    firewallHost, firewallPort, firewallDomain,
    firewallUserName, firewallPassword, request,
    response);
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TWebService]);
end;

end.
