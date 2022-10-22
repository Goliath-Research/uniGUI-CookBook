unit pm_quickadd_labor_filter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Wwdatsrc,
  MainModule,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniComboBox, uniDBComboBox;

type
  { TPMQuickAddLaborFilter }
  TPMQuickAddLaborFilter = packed record
    WorkOrderID: Integer;
    WorkOrderDate: TDateTime;
    WorkOrderDetailID: Integer;
    WorkOrderTaskNo: string;
    WorkOrderTaskDescription: string;
    EmployeeID: Integer;
    EmployeeNo: string;
    EmployeeName: string;
    DetailNumber: string;
    Hours: Real;
    ChargeRate: Real end;

    { TFrmPMQuickAddLaborFilter }
    TFrmPMQuickAddLaborFilter = class(TUniForm)Panel1: TUniPanel;
    PnlButtons: TUniPanel;
    gbFilter: TUniGroupBox;
    SrcWorkOrder: TDataSource;
    SrcEmployee: TDataSource;
    SrcTask: TDataSource;
    QryWorkOrder: TFDQuery;
    QryEmployee: TFDQuery;
    QryTask: TFDQuery;
    Panel3: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblWorkOrderNo: TUniLabel;
    lblToolingTaskNo: TUniLabel;
    lblEmployeeNo: TUniLabel;
    lblDetail: TUniLabel;
    lblHours: TUniLabel;
    lblChargeRate: TUniLabel;
    cmbWorkOrder: TUniDBLookupComboBox;
    cmbTask: TUniDBLookupComboBox;
    cmbEmployee: TUniDBLookupComboBox;
    edtDetailNo: TUniEdit;
    edtHours: TUniEdit;
    edtChargeRate: TUniEdit;
    PnlResetButton: TUniPanel;
    Panel5: TUniPanel;
    btnReset: TUniBitBtn;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    QryWorkOrderWORKORDERNO: TStringField;
    QryWorkOrderWO_DATE: TDateTimeField;
    QryWorkOrderCLASS: TStringField;
    QryTaskTASKNO: TStringField;
    QryTaskDESCRIP: TStringField;
    QryEmployeeEMPNO: TStringField;
    QryEmployeeNAME: TStringField;
    QryWorkOrderID: TFMTBCDField;
    QryTaskPMWO_DTL_ID: TFMTBCDField;
    QryEmployeeID: TFMTBCDField;
    QryEmployeeCHARGE_RATE: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnResetClick(Sender: TObject);
    procedure cmbEmployeeChange(Sender: TObject);
    procedure edtChargeRateChange(Sender: TObject);
    procedure edtHoursChange(Sender: TObject);
    procedure QryTaskBeforeOpen(DataSet: TDataSet);
    procedure cmbTaskBeforeDropDown(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    private
      { Private declarations }
      FFilter: TPMQuickAddLaborFilter;
      procedure AssignFilter(ASource: TPMQuickAddLaborFilter;
        var ATarget: TPMQuickAddLaborFilter);
      procedure UpdateFilter;
      procedure SetSelected(const AWorkOrderID, APmWoDtlID, APrEmpID: Integer);
    procedure SetFilter(const Value: TPMQuickAddLaborFilter);
    public
      { Public declarations }
      property Filter : TPMQuickAddLaborFilter write SetFilter;
  end;

function DoPMLaborQuickAddFilter(var AFilter: TPMQuickAddLaborFilter): Boolean;

procedure ClearFilter(var AFilter: TPMQuickAddLaborFilter);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

function DoPMLaborQuickAddFilter(var AFilter: TPMQuickAddLaborFilter): Boolean;
var
  LFrmPMQuickAddLaborFilter : TFrmPMQuickAddLaborFilter;
begin
  LFrmPMQuickAddLaborFilter := TFrmPMQuickAddLaborFilter.Create(UniGUIApplication.UniApplication);
  LFrmPMQuickAddLaborFilter.Filter := AFilter;
  Result := LFrmPMQuickAddLaborFilter.ShowModal = mrOk;
  if Result then
    begin
      LFrmPMQuickAddLaborFilter.UpdateFilter;
      LFrmPMQuickAddLaborFilter.AssignFilter(LFrmPMQuickAddLaborFilter.FFilter, AFilter);
    end;
end;

procedure ClearFilter(var AFilter: TPMQuickAddLaborFilter);
begin
  AFilter.WorkOrderID := 0;
  AFilter.WorkOrderDate := Date();
  AFilter.WorkOrderDetailID := 0;
  AFilter.WorkOrderTaskNo := '';
  AFilter.WorkOrderTaskDescription := '';
  AFilter.EmployeeID := 0;
  AFilter.EmployeeNo := '';
  AFilter.EmployeeName := '';
  AFilter.DetailNumber := '';
  AFilter.Hours := 0;
  AFilter.ChargeRate := 0;
end;

procedure TFrmPMQuickAddLaborFilter.FormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmPMQuickAddLaborFilter.QryTaskBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', QryWorkOrderID.AsLargeInt);
end;

procedure TFrmPMQuickAddLaborFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmPMQuickAddLaborFilter.AssignFilter
  (ASource: TPMQuickAddLaborFilter; var ATarget: TPMQuickAddLaborFilter);
begin
  ATarget.WorkOrderID := ASource.WorkOrderID;
  ATarget.WorkOrderDate := ASource.WorkOrderDate;
  ATarget.WorkOrderDetailID := ASource.WorkOrderDetailID;
  ATarget.WorkOrderTaskNo := ASource.WorkOrderTaskNo;
  ATarget.WorkOrderTaskDescription := ASource.WorkOrderTaskDescription;
  ATarget.EmployeeID := ASource.EmployeeID;
  ATarget.EmployeeNo := ASource.EmployeeNo;
  ATarget.EmployeeName := ASource.EmployeeName;
  ATarget.DetailNumber := ASource.DetailNumber;
  ATarget.Hours := ASource.Hours;
  ATarget.ChargeRate := ASource.ChargeRate;
end;

procedure TFrmPMQuickAddLaborFilter.btnResetClick(Sender: TObject);
begin
  SetSelected(0, 0, 0);
  edtHours.Text := '';
  edtDetailNo.Clear;
  edtChargeRate.Text := '0';
end;

procedure TFrmPMQuickAddLaborFilter.SetFilter(
  const Value: TPMQuickAddLaborFilter);
begin
  FFilter := Value;
end;

procedure TFrmPMQuickAddLaborFilter.SetSelected(const AWorkOrderID, APmWoDtlID,
  APrEmpID: Integer);
begin
  if not QryWorkOrder.Active then
    ReOpen(QryWorkOrder);
  QryWorkOrder.Locate('ID', AWorkOrderID, []);
{ TODO -oGPatil -cWebConvert : TUniDBLookUpComboBox does not contain lookupvalue
  cmbWorkOrder.LookupValue := QryWorkOrderID.AsString;
  cmbWorkOrder.Text := QryWorkOrderWORKORDERNO.AsString;

  ReOpen(QryTask);
  QryTask.Locate('PMWO_DTL_ID', APmWoDtlID, []);
  cmbTask.LookupValue := QryTaskPMWO_DTL_ID.AsString;
  cmbTask.Text := QryTaskTASKNO.AsString;

  if not QryEmployee.Active then
    ReOpen(QryEmployee);
  QryEmployee.Locate('ID', APrEmpID, []);
  cmbEmployee.LookupValue := QryEmployeeID.AsString;   }
  cmbEmployee.Text := QryEmployeeEMPNO.AsString;

end;

procedure TFrmPMQuickAddLaborFilter.UniFormShow(Sender: TObject);
begin
  AssignFilter(FFilter, FFilter);
  IQSetTablesActive(True, Self);
  SetSelected(FFilter.WorkOrderID, FFilter.WorkOrderDetailID,
    FFilter.EmployeeID);
  edtDetailNo.Text := FFilter.DetailNumber;
  edtHours.Text := FloatToStr(FFilter.Hours);
  edtChargeRate.Text := FloatToStr(FFilter.ChargeRate)
end;

procedure TFrmPMQuickAddLaborFilter.UpdateFilter;
begin
  FFilter.WorkOrderID := QryWorkOrderID.AsLargeInt;
  FFilter.WorkOrderDate := QryWorkOrderWO_DATE.AsDateTime;
  FFilter.WorkOrderDetailID := QryTaskPMWO_DTL_ID.AsLargeInt;
  FFilter.WorkOrderTaskNo := QryTaskTASKNO.AsString;
  FFilter.WorkOrderTaskDescription := QryTaskDESCRIP.AsString;
  FFilter.EmployeeID := QryEmployeeID.AsLargeInt;
  FFilter.EmployeeNo := QryEmployeeEMPNO.AsString;
  FFilter.EmployeeName := QryEmployeeNAME.AsString;
  FFilter.DetailNumber := edtDetailNo.Text;
  FFilter.Hours := IQMS.Common.Numbers.StoF(edtHours.Text);
  FFilter.ChargeRate := IQMS.Common.Numbers.StoF(edtChargeRate.Text);
end;

procedure TFrmPMQuickAddLaborFilter.cmbEmployeeChange(Sender: TObject);
begin
  edtChargeRate.Text := FloatToStr(QryEmployeeCHARGE_RATE.AsFloat);
end;

procedure TFrmPMQuickAddLaborFilter.cmbTaskBeforeDropDown(Sender: TObject);
begin
  ReOpen(QryTask);
end;

procedure TFrmPMQuickAddLaborFilter.edtChargeRateChange(Sender: TObject);
begin
  if Trim(edtChargeRate.Text) > '' then
    try
      StrToFloat(edtChargeRate.Text);
    except
      edtChargeRate.Clear;
    end;
end;

procedure TFrmPMQuickAddLaborFilter.edtHoursChange(Sender: TObject);
begin
  if Trim(edtHours.Text) > '' then
    try
      StrToFloat(edtHours.Text);
    except
      edtHours.Clear;
    end;
end;

end.
