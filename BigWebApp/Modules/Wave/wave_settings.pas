unit wave_settings;

interface

uses
  System.SysUtils,
  System.Variants;


type
  { TWaveSettings }
  TWaveSettings = class(TObject)
  private const
    // Registry Path for all settings
    CURRENT_USER_SETTINGS = '\Software\IQMS\IQWin32\Iqwin32.exe\_Permanent\Wave\Settings';
    REG_PRINT_PICK_TICKET = 'Print Pick Ticket';
    REG_PRINT_SHIPPING_LABELS = 'Print Shipping Labels';
    REG_EVALUATE_REQUEST_DATE = 'Evaluate Request Date';
    REG_SALES_ORDER_RELEASE_SCOPE = 'Sales Order Release Scope';
    REG_POPULATE_PENDING_TRANSACTIONS = 'Populate Pending Trans';
  private
    function GetEvaluateRequestDate: Boolean;
    function GetPrintPickTicket: Boolean;
    function GetPrintShippingLabels: Boolean;
    function GetSalesOrderReleaseScope: Real;
    procedure SetEvaluateRequestDate(const Value: Boolean);
    procedure SetPrintPickTicket(const Value: Boolean);
    procedure SetPrintShippingLabels(const Value: Boolean);
    procedure SetSalesOrderReleaseScope(const Value: Real);
    function GetPopulatePendingTransactions: Boolean;
    procedure SetPopulatePendingTransactions(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property PrintPickTicket: Boolean read GetPrintPickTicket write SetPrintPickTicket;
    property PrintShippingLabels: Boolean read GetPrintShippingLabels write SetPrintShippingLabels;
    property EvaluateRequestDate: Boolean read GetEvaluateRequestDate write SetEvaluateRequestDate;
    property SalesOrderReleaseScope: Real read GetSalesOrderReleaseScope write SetSalesOrderReleaseScope;
    property PopulatePendingTransactions: Boolean read GetPopulatePendingTransactions write SetPopulatePendingTransactions;
  end;

//procedure CheckWaveSettingsCreated; // to be called before accessing settings
//
//var
//  WaveSettings: TWaveSettings;

implementation

uses
  IQMS.Common.RegSet;

//procedure CheckWaveSettingsCreated; // to be called before accessing settings
//begin
//  if not Assigned(WaveSettings) then
//    WaveSettings := TWaveSettings.Create;
//end;

{ TWaveSettings }

function TWaveSettings.GetPopulatePendingTransactions: Boolean;
begin
  Result:= IQMS.Common.RegSet.ReadSetting_Bool(CURRENT_USER_SETTINGS, 
    REG_POPULATE_PENDING_TRANSACTIONS);
end;

function TWaveSettings.GetPrintPickTicket: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool(CURRENT_USER_SETTINGS,
    REG_PRINT_PICK_TICKET, False);
end;

procedure TWaveSettings.SetPopulatePendingTransactions(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(CURRENT_USER_SETTINGS, REG_POPULATE_PENDING_TRANSACTIONS,
    Value);
end;          

procedure TWaveSettings.SetPrintPickTicket(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(CURRENT_USER_SETTINGS, REG_PRINT_PICK_TICKET,
    Value);
end;

function TWaveSettings.GetPrintShippingLabels: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool(CURRENT_USER_SETTINGS,
    REG_PRINT_SHIPPING_LABELS, False);
end;

procedure TWaveSettings.SetPrintShippingLabels(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(CURRENT_USER_SETTINGS, REG_PRINT_SHIPPING_LABELS,
    Value);
end;

function TWaveSettings.GetEvaluateRequestDate: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool(CURRENT_USER_SETTINGS,
    REG_EVALUATE_REQUEST_DATE, False);
end;

procedure TWaveSettings.SetEvaluateRequestDate(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(CURRENT_USER_SETTINGS, REG_EVALUATE_REQUEST_DATE,
    Value);
end;

function TWaveSettings.GetSalesOrderReleaseScope: Real;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Float(CURRENT_USER_SETTINGS,
    REG_SALES_ORDER_RELEASE_SCOPE, 0);
end;

procedure TWaveSettings.SetSalesOrderReleaseScope(const Value: Real);
begin
  IQMS.Common.RegSet.WriteSetting_Float(CURRENT_USER_SETTINGS,
    REG_SALES_ORDER_RELEASE_SCOPE, Value);
end;

end.
