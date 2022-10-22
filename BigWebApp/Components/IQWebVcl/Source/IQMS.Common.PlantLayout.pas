unit IQMS.Common.PlantLayout;

interface

uses
     IQMS.Common.PlantLayoutServer,
     IQMS.Common.DotNetInteropServer,
     IQMS.Common.DotNetInteropInterfacedObject;

type
  TPlantLayout = class(TDNetInteropInterfacedObject, IPlantLayoutServer)
  public
    constructor Create(ADNetInteropServer: IDNetInteropServer); override;
    procedure Show;
    procedure OpenPCMonGaugesDialog(const AWorkCenterID: Int64);

    class procedure ShowPlantLayout; static;
    class procedure DoOpenPCMonGaugesDialog(const AWorkCenterID: Int64); static;
  end;

implementation

uses
  IQMS.Common.DotNetInterop;

{ TPlantLayout }

constructor TPlantLayout.Create(ADNetInteropServer: IDNetInteropServer);
begin
  inherited Create(ADNetInteropServer);
  AssignLibrary(
    'PlantLayoutLib',
    'IQMS.PlantLayout.IQInterface',
    'IQInterface');
end;

class procedure TPlantLayout.ShowPlantLayout;
var
  APlantLayout: IPlantLayoutServer;
  ADNetInteropServer: IDNetInteropServer;
begin
  ADNetInteropServer := TDNetInterop.Create;
  APlantLayout := TPlantLayout.Create(ADNetInteropServer);
  APlantLayout.Show();
end;

class procedure TPlantLayout.DoOpenPCMonGaugesDialog(const AWorkCenterID: Int64);
var
  APlantLayout: IPlantLayoutServer;
  ADNetInteropServer: IDNetInteropServer;
begin
  ADNetInteropServer := TDNetInterop.Create;
  APlantLayout := TPlantLayout.Create(ADNetInteropServer);
  APlantLayout.OpenPCMonGaugesDialog(AWorkCenterID);
end;

procedure TPlantLayout.OpenPCMonGaugesDialog(const AWorkCenterID: Int64);
begin
  CreateServerObjects;

  DisableFPUExceptions;
  try
    DNetInteropServer.InvokeActionEx(
      Invoker,
      'OpenPCMonGaugesDialog',
      [AWorkCenterID]);
  finally
    EnableFPUExceptions;
  end;

  FreeServerObjects;
end;

procedure TPlantLayout.Show;
begin
  CreateServerObjects;

  DisableFPUExceptions;
  try
    DNetInteropServer.InvokeAction(
      Invoker,
      'Show');
  finally
    EnableFPUExceptions;
  end;

  FreeServerObjects;
end;

end.
