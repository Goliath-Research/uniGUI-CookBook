unit IQMS_HttpServices_TLB;

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
// File generated on 6/29/2012 10:11:00 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\P4\IQWin\IQMS.HttpServices.tlb (1)
// LIBID: {F33C840D-3A52-47CF-B4CB-1442193CDBCD}
// LCID: 0
// Helpfile:
// HelpString: EnterpriseIQ HTTP Services library
// DepndLst:
// (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
// Error creating palette bitmap of (THttpServices) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties
// which return objects that may need to be explicitly created via a function
// call prior to any access via the property. These items have been disabled
// in order to prevent accidental use from within the object inspector. You
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively
// removing them from the $IFDEF blocks. However, such items must still be
// programmatically created via a method of the appropriate CoClass before
// they can be used.
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses
  Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL,
  Variants;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
// Type Libraries     : LIBID_xxxx
// CoClasses          : CLASS_xxxx
// DISPInterfaces     : DIID_xxxx
// Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  IQMS_HttpServicesMajorVersion = 12;
  IQMS_HttpServicesMinorVersion = 0;
  LIBID_IQMS_HttpServices: TGUID = '{F33C840D-3A52-47CF-B4CB-1442193CDBCD}';
  IID_IHttpServices: TGUID = '{3D6D82CE-E8A1-429C-A793-D9631F0B8F17}';
  CLASS_HttpServices: TGUID = '{BA2F34F8-B52F-46FA-99ED-BA584AF4C92A}';

  // *********************************************************************//
  // Declaration of Enumerations defined in Type Library
  // *********************************************************************//
  // Constants for enum ContentTypes
type
  ContentTypes = TOleEnum;

const
  ContentTypes_XML = $00000000;
  ContentTypes_HTMLForm = $00000001;
  ContentTypes_JSon = $00000002;

type
  // *********************************************************************//
  // Forward declaration of types defined in TypeLibrary
  // *********************************************************************//
  IHttpServices = interface;
  IHttpServicesDisp = dispinterface;
  // *********************************************************************//
  // Declaration of CoClasses defined in Type Library
  // (NOTE: Here we map each CoClass to its Default Interface)
  // *********************************************************************//
  HttpServices = IHttpServices;

  // *********************************************************************//
  // Interface: IHttpServices
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {3D6D82CE-E8A1-429C-A793-D9631F0B8F17}
  // *********************************************************************//
  IHttpServices = interface(IDispatch)
    ['{3D6D82CE-E8A1-429C-A793-D9631F0B8F17}']
    function Execute(const url: WideString; port: Integer; timeOut: Integer;
      const contentType: ContentTypes; const userAgent: WideString;
      const request: WideString; out response: WideString): WordBool; safecall;
    function ExecuteThroughFirewall(const url: WideString; port: Integer;
      timeOut: Integer; const contentType: ContentTypes;
      const userAgent: WideString; const firewallHost: WideString;
      firewallPort: Integer; const firewallDomain: WideString;
      const firewallUserName: WideString; const firewallPassword: WideString;
      const request: WideString; out response: WideString): WordBool; safecall;
  end;

  // *********************************************************************//
  // DispIntf:  IHttpServicesDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {3D6D82CE-E8A1-429C-A793-D9631F0B8F17}
  // *********************************************************************//
  IHttpServicesDisp = dispinterface
    ['{3D6D82CE-E8A1-429C-A793-D9631F0B8F17}']
    function Execute(const url: WideString; port: Integer; timeOut: Integer;
      const contentType: ContentTypes; const userAgent: WideString;
      const request: WideString; out response: WideString): WordBool; dispid 1;
    function ExecuteThroughFirewall(const url: WideString; port: Integer;
      timeOut: Integer; const contentType: ContentTypes;
      const userAgent: WideString; const firewallHost: WideString;
      firewallPort: Integer; const firewallDomain: WideString;
      const firewallUserName: WideString; const firewallPassword: WideString;
      const request: WideString; out response: WideString): WordBool; dispid 2;
  end;

  // *********************************************************************//
  // The Class CoHttpServices provides a Create and CreateRemote method to
  // create instances of the default interface IHttpServices exposed by
  // the CoClass HttpServices. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoHttpServices = class
    class function Create: IHttpServices;
    class function CreateRemote(const MachineName: string): IHttpServices;
  end;


  // *********************************************************************//
  // OLE Server Proxy class declaration
  // Server Object    : THttpServices
  // Help String      :
  // Default Interface: IHttpServices
  // Def. Intf. DISP? : No
  // Event   Interface:
  // TypeFlags        : (2) CanCreate
  // *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}

  THttpServicesProperties = class;
{$ENDIF}

  THttpServices = class(TOleServer)
    private
      FIntf: IHttpServices;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
      FProps: THttpServicesProperties;
      function GetServerProperties: THttpServicesProperties;
{$ENDIF}
      function GetDefaultInterface: IHttpServices;
    protected
      procedure InitServerData; override;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Connect; override;
      procedure ConnectTo(svrIntf: IHttpServices);
      procedure Disconnect; override;
      function Execute(const url: WideString; port: Integer; timeOut: Integer;
        const contentType: ContentTypes; const userAgent: WideString;
        const request: WideString; out response: WideString): WordBool;
      function ExecuteThroughFirewall(const url: WideString; port: Integer;
        timeOut: Integer; const contentType: ContentTypes;
        const userAgent: WideString; const firewallHost: WideString;
        firewallPort: Integer; const firewallDomain: WideString;
        const firewallUserName: WideString; const firewallPassword: WideString;
        const request: WideString; out response: WideString): WordBool;
      property DefaultInterface: IHttpServices read GetDefaultInterface;
    published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
      property Server: THttpServicesProperties read GetServerProperties;
{$ENDIF}
  end;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}

  // *********************************************************************//
  // OLE Server Properties Proxy Class
  // Server Object    : THttpServices
  // (This object is used by the IDE's Property Inspector to allow editing
  // of the properties of this server)
  // *********************************************************************//
  THttpServicesProperties = class(TPersistent)
    private
      FServer: THttpServices;
      function GetDefaultInterface: IHttpServices;
      constructor Create(AServer: THttpServices);
    protected
    public
      property DefaultInterface: IHttpServices read GetDefaultInterface;
    published
  end;
{$ENDIF}

procedure register;

resourcestring
  dtlServerPage = 'ActiveX';
  dtlOcxPage = 'ActiveX';

implementation

uses
  ComObj;

class function CoHttpServices.Create: IHttpServices;
begin
  Result := CreateComObject(CLASS_HttpServices) as IHttpServices;
end;

class function CoHttpServices.CreateRemote(const MachineName: string)
  : IHttpServices;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HttpServices)
    as IHttpServices;
end;

procedure THttpServices.InitServerData;
const
  CServerData: TServerData = (ClassID: '{BA2F34F8-B52F-46FA-99ED-BA584AF4C92A}';
    IntfIID: '{3D6D82CE-E8A1-429C-A793-D9631F0B8F17}'; EventIID: '';
    LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THttpServices.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
    begin
      punk := GetServer;
      FIntf := punk as IHttpServices;
    end;
end;

procedure THttpServices.ConnectTo(svrIntf: IHttpServices);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THttpServices.Disconnect;
begin
  if FIntf <> nil then
    begin
      FIntf := nil;
    end;
end;

function THttpServices.GetDefaultInterface: IHttpServices;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor THttpServices.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THttpServicesProperties.Create(Self);
{$ENDIF}
end;

destructor THttpServices.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}

function THttpServices.GetServerProperties: THttpServicesProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function THttpServices.Execute(const url: WideString; port: Integer;
  timeOut: Integer; const contentType: ContentTypes;
  const userAgent: WideString; const request: WideString;
  out response: WideString): WordBool;
begin
  Result := DefaultInterface.Execute(url, port, timeOut, contentType,
    userAgent, request, response);
end;

function THttpServices.ExecuteThroughFirewall(const url: WideString;
  port: Integer; timeOut: Integer; const contentType: ContentTypes;
  const userAgent: WideString; const firewallHost: WideString;
  firewallPort: Integer; const firewallDomain: WideString;
  const firewallUserName: WideString; const firewallPassword: WideString;
  const request: WideString; out response: WideString): WordBool;
begin
  Result := DefaultInterface.ExecuteThroughFirewall(url, port, timeOut,
    contentType, userAgent, firewallHost, firewallPort, firewallDomain,
    firewallUserName, firewallPassword, request, response);
end;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}

constructor THttpServicesProperties.Create(AServer: THttpServices);
begin
  inherited Create;
  FServer := AServer;
end;

function THttpServicesProperties.GetDefaultInterface: IHttpServices;
begin
  Result := FServer.DefaultInterface;
end;
{$ENDIF}

procedure register;
begin
  RegisterComponents(dtlServerPage, [THttpServices]);
end;

end.
