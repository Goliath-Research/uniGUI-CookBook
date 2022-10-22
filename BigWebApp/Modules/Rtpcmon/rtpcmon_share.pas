unit rtpcmon_share;

interface

type
  TCapabInfoCargo = class
     Name,
     DefaultUOM:String;
     constructor Create( AName, ADefaultUOM:String );
  end;

  TDeviceInfoCargo = class
     Name:String;
     DeviceInitiatesConnection,
     DeviceIsAlwaysConnected,
     SupportsProdMonitoring:Boolean;
     constructor Create( AName:String;
                         ADeviceInitiatesConnection,
                         ADeviceIsAlwaysConnected,
                         ASupportsProdMonitoring:Boolean );
  end;

  procedure DoProcPCMonGauges(AWorkCenterID:Real);

const
  C_Pluggins_Namespace = 'IQMS.RTProcMon.%s.QueryCapabilities';

implementation

uses
  System.SysUtils,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DotNetCOMShared,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule;
  //IQMS.PlantLayout;

{ TCapabInfoCargo }

constructor TCapabInfoCargo.Create(AName, ADefaultUOM: String);
begin
  Name      := AName;
  DefaultUOM:= ADefaultUOM;
end;

{ TDeviceInfoCargo }

constructor TDeviceInfoCargo.Create
 (AName: String;
  ADeviceInitiatesConnection,
  ADeviceIsAlwaysConnected,
  ASupportsProdMonitoring: Boolean );
begin
  Name                     := AName;
  DeviceInitiatesConnection:= ADeviceInitiatesConnection;
  DeviceIsAlwaysConnected  := ADeviceIsAlwaysConnected;
  SupportsProdMonitoring   := ASupportsProdMonitoring;
end;

procedure DoProcPCMonGauges(AWorkCenterID:Real);
//var
//   AUserName, APassword, AAlias: String;
begin
  if (AWorkCenterID = 0) then
    Exit;

//  AUserName := UpperCase(SecurityManager.UserName);
//  APassword := UpperCase(IQMS.Common.Miscellaneous.IQGetPassword);
//  AAlias    := UpperCase(IQMS.Common.Miscellaneous.IQGetServerName);

  { TODO -omugdha -cWEBIQ : Dependancy on parameter
  TPlantLayout.DoOpenPCMonGaugesDialog(Trunc(AWorkCenterID));  }

//  with TDotNetApplication.CreateEx(NIL, IQMS.Common.DotNetCOMShared.dllPlantLayout, IQMS.Common.DotNetCOMShared.namespacePlantLayout) do // declared in IQMS.Common.DotNetCOMShared.pas
//  try
//    if Connect then
//      Server.OpenPCMonGaugesDialog(AUserName, APassword, AAlias, AWorkCenterID);
//  finally
//     Free;
//  end;
end;

end.
