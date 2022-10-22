unit IQMS.Common.DotNetInteropInterfacedObject;

interface

uses
   System.SysUtils, System.Variants,
  IQMS.Common.DotNetInteropServer;

type
  TDNetInteropInterfacedObject = class(TInterfacedObject)
  strict private
    FLibraryFileName: string;
    FLibraryComType: string;
    FLibraryInterfaceName: string;
    FDNetInteropServer: IDNetInteropServer;
    FFactory: Variant;
    FInvoker: Variant;
    FCW: Word;
    procedure CheckInteropServerProvided;
    function GetNetInteropServer: IDNetInteropServer;
    function GetFactory: Variant;
    function GetInvoker: Variant;
  protected
    /// <summary> Assign required library property values.  Must be assigned
    /// by descendent class.
    /// </summary>
    procedure AssignLibrary(
      const ALibraryFileName: string;
      const ALibraryComType: string;
      const ALibraryInterfaceName: string);

    /// <summary> Establish a connection, creating the required objects.
    /// This is required before attempting to perform any actions using
    /// the Factory or Invoker.
    /// </summary>
    procedure CreateServerObjects;

    /// <summary> Frees server objects created; however, this does not need
    /// to be called directly, unless it is required, because objects are
    /// freed when the interface falls out of scope.
    /// </summary>
    procedure FreeServerObjects;

    procedure EnableFPUExceptions;
    procedure DisableFPUExceptions;

    property DNetInteropServer: IDNetInteropServer read GetNetInteropServer;
    property Factory: Variant read GetFactory;
    property Invoker: Variant read GetInvoker;
  public
    /// <summary> Descendent class must override the constructor and
    /// call AssignLibrary() to assign the required DCOM connections.
    /// </summary>
    constructor Create(ADNetInteropServer: IDNetInteropServer); virtual;
    destructor Destroy; override;

    property LibraryFileName: string read FLibraryFileName;
    property LibraryComType: string read FLibraryComType;
    property LibraryInterfaceName: string read FLibraryInterfaceName;
  end;

implementation

{ TDNetComInterfacedObject }

constructor TDNetInteropInterfacedObject.Create(ADNetInteropServer: IDNetInteropServer);
begin
  FDNetInteropServer := ADNetInteropServer;
  CheckInteropServerProvided;
end;

destructor TDNetInteropInterfacedObject.Destroy;
begin
  FreeServerObjects;
  inherited Destroy;
end;

procedure TDNetInteropInterfacedObject.DisableFPUExceptions;
begin
  if not VarIsNull(DNetInteropServer) and not VarIsClear(DNetInteropServer) then
  begin
    DNetInteropServer.EnableFPUExceptions(False, FCW);
  end;
end;

procedure TDNetInteropInterfacedObject.EnableFPUExceptions;
begin
  if not VarIsNull(DNetInteropServer) and not VarIsClear(DNetInteropServer) then
  begin
    DNetInteropServer.EnableFPUExceptions(True, FCW);
  end;
end;

procedure TDNetInteropInterfacedObject.AssignLibrary(const ALibraryFileName, ALibraryComType,
  ALibraryInterfaceName: string);
begin
  FLibraryFileName := ALibraryFileName;
  FLibraryComType := ALibraryComType;
  FLibraryInterfaceName := ALibraryInterfaceName;
end;

procedure TDNetInteropInterfacedObject.CheckInteropServerProvided;
begin
  if not Assigned(FDNetInteropServer) then
    raise Exception.Create(
      'Application Error: IDNetInterop not provided.');
end;

procedure TDNetInteropInterfacedObject.CreateServerObjects;
begin
  DisableFPUExceptions;
  try
    FDNetInteropServer.ConnectFactory(
      LibraryFileName,
      LibraryComType,
      FFactory,
      False);

    FDNetInteropServer.ConnectInvoker(
      FFactory,
      LibraryFileName,
      LibraryComType,
      LibraryInterfaceName,
      FInvoker,
      False);
  finally
    EnableFPUExceptions;
  end;
end;

procedure TDNetInteropInterfacedObject.FreeServerObjects;
begin
  if Assigned(FDNetInteropServer) then
  begin
    try
      FDNetInteropServer.Disconnect(FInvoker);
    finally
      FInvoker := Unassigned;
    end;
    try
      FDNetInteropServer.Disconnect(FFactory);
    finally
      FFactory := Unassigned;
    end;
  end;
end;

function TDNetInteropInterfacedObject.GetFactory: Variant;
begin
  Result := FFactory;
end;

function TDNetInteropInterfacedObject.GetInvoker: Variant;
begin
  Result := FInvoker;
end;

function TDNetInteropInterfacedObject.GetNetInteropServer: IDNetInteropServer;
begin
  Result := FDNetInteropServer;
end;

end.
