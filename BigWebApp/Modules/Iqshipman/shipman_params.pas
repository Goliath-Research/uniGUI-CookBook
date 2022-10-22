unit shipman_params;

{ Shipping Manager Params object - inherits from TCustomParams
  located in unit, iqvertical_param.pas }

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IQMS.Common.Registry,
  IQMS.Common.VerticalParam,
  FireDAC.Phys,
  MainModule;

type
  TCarrierOptions = class(TIQWebCustomParams)
  private
    { Private declarations }
    FCarrierID: Real;
    procedure DoBeforeGetValues;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ACarrierID: Real);
  published
    { Published declarations }
    property CarrierID: Real read FCarrierID write FCarrierID;

    //property DatabaseName;
    property TableName;
    property MasterField;
    property MasterFieldValue;

    property Options;
    property OnSetValue;
    property OnGetValues;
    property OnBeforeGetValues;
    property WriteImmediate;

  end;

  TUPSVersionCtrl = class(TIQWebCustomParams)
  private
    { Private declarations }
    procedure DoBeforeGetValues;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
  published
    { Published declarations }
    // property DatabaseName;
    property TableName;
    //property MasterField;
    //property MasterFieldValue;

    property Options;
    property OnSetValue;
    property OnGetValues;
    property OnBeforeGetValues;
    property WriteImmediate;

end;


implementation

uses
  IQMS.Common.DataLib,
  shipman_share,
  IQMS.Common.Dialogs;

{ TCarrierOptions }

constructor TCarrierOptions.Create(AOwner: TComponent; ACarrierID: Real);
begin
  inherited Create(AOwner);
  FCarrierID := ACarrierID;
  // Connection := MainModule.FDConnection;
  TableName := 'FREIGHT_CARRIER_OPTION';
  MasterField := 'CARRIER_ID';
  MasterFieldValue := FloatToStr(ACarrierID);
  OnBeforeGetValues := DoBeforeGetValues;
  Refresh;
end;

procedure TCarrierOptions.DoBeforeGetValues;
begin
  if CarrierID > 0 then
     ExecuteCommandFmt( 'BEGIN IQMS.SHIPMAN.CHECK_CARRIER_OPTIONS_CREATED( %.0f ); END;',
       [ CarrierID ] );
end;

{ TUPSVersionCtrl }

constructor TUPSVersionCtrl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Connection := MainModule.FDConnection;
  TableName := 'UPS_VERSION';
  OnBeforeGetValues := DoBeforeGetValues;
  Refresh;
end;

procedure TUPSVersionCtrl.DoBeforeGetValues;
begin
  CheckUPSVersionControlCreated;  // shipman_share.pas
end;

end.
