unit IQMS.Common.DotNetInterop;

interface

uses
  System.SysUtils, System.Win.ComObj, System.Variants, IQMS.Common.DotNetInteropServer,
  IQMS.Common.DotNetCOMInteropConst;

type
  TDNetInterop = class(TInterfacedObject, IDNetInteropServer)
  strict private
    FDNetFrameWorkVersion: string;
    FAuthenticationPassword: string;
    FAuthenticationUserName: string;
    FAuthenticationServer: string;
    FAuthenticationEPlantID: Int64;
    procedure CheckDllFileExists(const AFileName: string);
  private
    function CreateParamListAsVariant(const AParams: array of Variant): Variant;
  public
    constructor Create;

    procedure EnableFPUExceptions(const AEnabled: Boolean; var CW: Word);

    procedure Connect(
      const ADNetDLLName: string;
      const ADNetComType: string;
      var AServer: Variant);

    procedure ConnectFactory(
      const ADNetDLLName: string;
      const ADNetComType: string;
      var AServer: Variant;
      const AHandleFPUExceptions: Boolean = True);

    procedure ConnectInvoker(
      const ADNetFactory: Variant; // created in CreateDNetCOM_Factory
      const AInvokerDLL: string;
      const AInvokerComType: string;
      const AInvokerParam: string;
      var ADNetInvoker: Variant;
      AHandleFPUExceptions: Boolean = True);

    procedure InvokeAction(
      const AServer: Variant;
      const AActionName: string);

    procedure InvokeActionEx(
      const AServer: Variant;
      const AActionName: string;
      const AParams: array of Variant);

    function InvokeFunction(
      const AServer: Variant;
      const AActionName: string): Variant;

    function InvokeFunctionEx(
      const AServer: Variant;
      const AActionName: string;
      const AParams: array of Variant): Variant;

    procedure Disconnect(AServer: Variant);

    property DNetFrameWorkVersion: string read FDNetFrameWorkVersion write FDNetFrameWorkVersion;
    property AuthenticationUserName: string read FAuthenticationUserName
      write FAuthenticationUserName;
    property AuthenticationPassword: string read FAuthenticationPassword
      write FAuthenticationPassword;
    property AuthenticationServer: string read FAuthenticationServer write FAuthenticationServer;
    property AuthenticationEPlantID: Int64 read FAuthenticationEPlantID
      write FAuthenticationEPlantID;
  end;

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.DotNetRegister,
  IQMS.Common.StringUtils;

{ TDNetInterop }

constructor TDNetInterop.Create;
begin
  inherited Create;

  if (SecurityManager <> nil) then
  begin
    AuthenticationUserName := SecurityManager.UserName;
    AuthenticationPassword := SecurityManager.Password;
    AuthenticationServer := SecurityManager.ServerName;
    AuthenticationEPlantID := SecurityManager.EPlant_ID_AsInteger;
  end;
end;

procedure TDNetInterop.Connect(const ADNetDLLName, ADNetComType: string; var AServer: Variant);
var
  ATimes: Integer;
begin
  ATimes := 1;

  repeat
    try
      // Launch. Register first if needed
      AServer := CreateOleObject(ADNetComType);
      BREAK;
    except
      on E: Exception do
      begin
        if ATimes >= 2 then
          raise;
        if not IQRegAssemblyForCom(
          ADNetDLLName,
          DNetFrameWorkVersion,
          ExtractFilePath(ADNetDLLName)) then
          ABORT;
      end;
    end;

    Inc(ATimes);
  until FALSE;
end;

procedure TDNetInterop.ConnectFactory(
  const ADNetDLLName: string;
  const ADNetComType: string;
  var AServer: Variant;
  const AHandleFPUExceptions: Boolean);
var
  CW: Word;
  ATimes: Integer;
  AOverrideLocalHomePath: string;
begin
  AOverrideLocalHomePath := ExtractFilePath(ADNetDLLName);

  if AHandleFPUExceptions then
    EnableFPUExceptions(FALSE, CW);
  try
    ATimes := 1;
    repeat
      try
        Connect(
          DNetFactoryDLL,
          DNetFactoryCOMType,
          AServer);

        if not string.IsNullOrWhiteSpace(AuthenticationServer) then
        begin
          AServer.Authenticate(AuthenticationServer,
            AuthenticationUserName,
            CharXOR(AuthenticationPassword),
            AuthenticationEPlantID);
        end
        else
          raise Exception.Create(
            'Application Error:  Authentication data must be assigned.');

        BREAK;
      except
        on E: Exception do
        begin
          if ATimes >= 2 then
            raise;
          if (not IQRegAssemblyForCom(
            DNetFactoryDLL,
            DNetFactoryCOMType,
            ExtractFilePath(ADNetDLLName)))
            and
            (not IQRegAssemblyForCom(
            ADNetDLLName,
            DNetCurrentVersion,
            ExtractFilePath(ADNetDLLName))) then
            ABORT;
        end;
      end;
      Inc(ATimes);
    until FALSE;
  finally
    begin
      if AHandleFPUExceptions then
        EnableFPUExceptions(True, CW);
    end;
  end;
end;

procedure TDNetInterop.CheckDllFileExists(const AFileName: string);
var
  APath: string;
  ADLLFileName: string;
begin
  APath := ExtractFilePath(AFileName);

  if not string.IsNullOrWhiteSpace(APath) then
  begin
    ADLLFileName := ChangeFileExt(AFileName, '.dll');
  end
  else
  begin
    ADLLFileName := ChangeFileExt(IQGetLocalHomePath + AFileName, '.dll');
  end;

  if not FileExists(ADLLFileName) then
    raise Exception.CreateFmt('Required DLL not found, %s', [ADLLFileName]);
end;

procedure TDNetInterop.ConnectInvoker(
  const ADNetFactory: Variant;
  const AInvokerDLL,
  AInvokerComType,
  AInvokerParam: string;
  var ADNetInvoker: Variant;
  AHandleFPUExceptions: Boolean);
var
  CW: Word;
  ATimes: Integer;
begin
  CheckDllFileExists(AInvokerDLL);

  if AHandleFPUExceptions then
    EnableFPUExceptions(FALSE, CW);

  try
    ATimes := 1;
    repeat
      try
        ADNetInvoker := ADNetFactory.NewInvoker(
          Format('%s.dll', [AInvokerDLL]),
          AInvokerComType,
          AInvokerParam);
        ADNetInvoker.Init;
        BREAK;
      except
        on E: Exception do
        begin
          if ATimes >= 2 then
            raise;
          if (not IQRegAssemblyForCom(DNetFactoryDLL, DNetCurrentVersion,
            ExtractFilePath(AInvokerDLL)))
            and
            (not IQRegAssemblyForCom(AInvokerDLL, DNetCurrentVersion, ExtractFilePath(AInvokerDLL)))
          then
            ABORT;
        end;
      end;
      Inc(ATimes);
    until FALSE;
  finally
    if AHandleFPUExceptions then
      EnableFPUExceptions(True, CW);
  end;
end;

procedure TDNetInterop.EnableFPUExceptions(const AEnabled: Boolean; var CW: Word);
begin
  if not AEnabled then
  begin
    // If accessing .NET via com call we need to disable FPU exceptions b/c win32 attempts to track
    // the address in memory of a .NET object. }
    CW := Get8087CW; // the current value of the floating-point unit control word.
    // This control word controls the precision of floating point calculations,
    // the rounding mode, and whether certain floating-point operations trigger exceptions.
    // See Intel's processor documentation for details.

    // Disable FPU exceptions
    Set8087CW($133F);
  end
  else
  begin
    Set8087CW(CW);
  end;
end;

procedure TDNetInterop.InvokeAction(const AServer: Variant; const AActionName: string);
begin
  if not VarIsNull(AServer) then
  begin
    AServer.InvokeAction(
      AActionName);
  end;
end;

procedure TDNetInterop.InvokeActionEx(
  const AServer: Variant;
  const AActionName: string;
  const AParams: array of Variant);
var
  AArgs: Variant;
begin
  if not VarIsNull(AServer) then
  begin
    // Convert Array to Variant that can be passed thru COM
    AArgs := CreateParamListAsVariant(AParams);
    try
      AServer.InvokeActionEx(
        AActionName,
        AArgs);
    finally
      AArgs := Unassigned;
    end;
  end;
end;

function TDNetInterop.InvokeFunction(const AServer: Variant; const AActionName: string): Variant;
begin
  if not VarIsNull(AServer) then
  begin
    AServer.InvokeFunction(
      AActionName);
  end;
end;

function TDNetInterop.InvokeFunctionEx(
  const AServer: Variant;
  const AActionName: string;
  const AParams: array of Variant): Variant;
var
  AArgs: Variant;
begin
  if not VarIsNull(AServer) then
  begin
    // Convert Array to Variant that can be passed thru COM
    AArgs := CreateParamListAsVariant(AParams);
    try
      Result := AServer.InvokeFunctionEx(
        AActionName,
        AArgs);
    finally
      AArgs := Unassigned;
    end;
  end;
end;

function TDNetInterop.CreateParamListAsVariant(const AParams: array of Variant): Variant;
var
  i: Integer;
begin
  // Convert an array of parameters into a single Variant
  // which can be passed through COM. Values need to be assigned
  // to elements of the array before calling this method
  Result := VarArrayCreate([0, high(AParams)], varVariant);
  for i := 0 to high(AParams) do
    Result[i] := AParams[i];
end;

procedure TDNetInterop.Disconnect(AServer: Variant);
begin
  if not VarIsEmpty(AServer) then
  begin
    varClear(AServer);
  end;
end;

end.
