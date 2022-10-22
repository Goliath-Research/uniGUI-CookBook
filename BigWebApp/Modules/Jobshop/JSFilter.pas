unit JSFilter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
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
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniSpinEdit, uniComboBox, uniDBComboBox;

type
  TFrmJSFilter = class(TUniForm)
    Panel2: TUniPanel;
    gbFilter: TUniGroupBox;
    lblWorkOrderNo: TUniLabel;
    lblToolingTaskNo: TUniLabel;
    lblEmployeeNo: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    cmbJobShopRfq: TUniDBLookupComboBox;
    cmbEmployee: TUniDBLookupComboBox;
    edtDetailNo: TUniEdit;
    edtChargeRate: TUniEdit;
    QryEmployee: TFDQuery;
    QryEmployeeEMPNO: TStringField;
    QryEmployeeNAME: TStringField;
    QryEmployeeID: TFMTBCDField;
    QryEmployeeFIRST_NAME: TStringField;
    QryEmployeeLAST_NAME: TStringField;
    QryEmployeeCHARGE_RATE: TFMTBCDField;
    QtyJobShopRfq: TFDQuery;
    QtyJobShopRfqPROJECTNO: TStringField;
    QtyJobShopRfqDESCRIP: TStringField;
    QtyJobShopRfqID: TFMTBCDField;
    sbtnTask: TUniSpeedButton;
    PkJobShopTask: TIQWebHPick;
    PkJobShopTaskID: TBCDField;
    PkJobShopTaskPROJECTNO: TStringField;
    PkJobShopTaskPROJECT_DESCRIP: TStringField;
    PkJobShopTaskCUSTNO: TStringField;
    PkJobShopTaskCOMPANY: TStringField;
    PkJobShopTaskITEMNO: TStringField;
    PkJobShopTaskDESCRIP: TStringField;
    PkJobShopTaskREV: TStringField;
    PkJobShopTaskMFGNO: TStringField;
    PkJobShopTaskCNTR_TYPE: TStringField;
    PkJobShopTaskMFG_TYPE: TStringField;
    PkJobShopTaskMAIN_ARINVT_ID: TBCDField;
    PkJobShopTaskMAIN_STANDARD_ID: TBCDField;
    PkJobShopTaskTASK_ARINVT_ID: TBCDField;
    PkJobShopTaskTASK_STANDARD_ID: TBCDField;
    edTask: TUniEdit;
    Panel1: TUniPanel;
    btnCancel: TUniBitBtn;
    btnOK: TUniBitBtn;
    btnReset: TUniBitBtn;
    edtHours: TUniSpinEdit;
    ds_JobShopRfq: TDataSource;
    ds_Employee: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnResetClick(Sender: TObject);
    procedure cmbEmployeeChange(Sender: TObject);
    procedure edtChargeRateChange(Sender: TObject);
    procedure PkJobShopTaskBeforeOpen(DataSet: TDataSet);
    procedure sbtnTaskClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FTaskId: Real;
    FJobShopRfqID: Real;
    FPrEmpID : Real;
    FDetailNo: String;
    FHours: Integer;
    FChargeRate: Real;
    procedure SetTaskId(const Value: Real);
    procedure SetJobShopRfqID(const Value: Real);
  public
    { Public declarations }
    property TaskId: Real write SetTaskId;
    property JobShopRfqID: Real write SetJobShopRfqID;
  end;

  function DoJSLaborQuickAddFilter( var AJobShopRfqID, AJobShopTaskID, APrEmpID : Real; var ADetailNo: String; var AHours: Integer; var AChargeRate: Real ): Boolean;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  jobshop_rscstr;

{$R *.DFM}

function DoJSLaborQuickAddFilter( var AJobShopRfqID, AJobShopTaskID, APrEmpID : Real; var ADetailNo: String; var AHours: Integer; var AChargeRate: Real ): Boolean;
var
  frm: TFrmJSFilter;
begin
  frm := TFrmJSFilter.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    FTaskId := AJobShopTaskID;
    FJobShopRfqID := AJobShopRfqID;
    FPrEmpID := APrEmpID;
    FDetailNo:= ADetailNo;
    FHours:= AHours;
    FChargeRate:= AChargeRate;

    if ShowModal = mrOk then
    begin
      AJobShopRfqID    := Nz( QtyJobShopRfqID.AsFloat, 0 );
      AJobShopTaskID   := Nz( FTaskID,      0 );
      APrEmpID         := Nz( QryEmployeeID.AsFloat,  0 );
      ADetailNo        := edtDetailNo.Text;
      AHours           := edtHours.Value;
      AChargeRate      := StrToFloat( Nz( Trim( edtChargeRate.Text ),'0' ));
      Result := TRUE;
    end
    else Result := FALSE;
  end;

end;

procedure TFrmJSFilter.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( Self, [ Self ] ); {IQMS.Common.RegFrm.pas}
end;

procedure TFrmJSFilter.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );

  QtyJobShopRfq.Locate( 'ID',    FJobShopRfqID,      [] );
//  cmbJobShopRfq.LookupValue := QtyJobShopRfqPROJECTNO.AsString;
//  cmbJobShopRfq.Text        := QtyJobShopRfqPROJECTNO.AsString;


   edTask.Text := SelectValueFmtAsString('select s.route_seq || ''-'' || s.mfgno || '': '' || s.descrip ' +
                                         '   from jobshop_rfq q,                                        ' +
                                         '        jobshop_task t,                                       ' +
                                         '        arinvt a,                                             ' +
                                         '        arcusto c,                                            ' +
                                         '        standard s                                            ' +
                                         '  where q.id = t.jobshop_rfq_id                               ' +
                                         '    and t.arinvt_id = a.id(+)                                 ' +
                                         '    and t.standard_id = s.id(+)                               ' +
                                         '    and q.arcusto_id = c.id(+)                                ' +
                                         '    and t.id = %f',
                                             [FTaskId]);

  QryEmployee.Locate(  'ID',    FPrEmpID,        [] );
//  cmbEmployee.LookupValue  := QryEmployeeEMPNO.AsString;
//  cmbEmployee.Text         := QryEmployeeEMPNO.AsString;

  edtDetailNo.Text         := FDetailNo;
  edtHours.Value           := FHours;
  edtChargeRate.Text       := FloatToStr( FChargeRate );

end;

procedure TFrmJSFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self ] ); {IQMS.Common.RegFrm.pas}
end;

procedure TFrmJSFilter.btnResetClick(Sender: TObject);
begin
  QtyJobShopRfq.Locate( 'ID',    0,      [] );
//  cmbJobShopRfq.LookupValue := QtyJobShopRfqPROJECTNO.AsString;
//  cmbJobShopRfq.Text        := QtyJobShopRfqPROJECTNO.AsString;

  edTask.Text := '';
  FTaskId := 0;

  QryEmployee.Locate(  'ID',    0,        [] );
//  cmbEmployee.LookupValue  := QryEmployeeEMPNO.AsString;
//  cmbEmployee.Text         := QryEmployeeEMPNO.AsString;

  edtDetailNo.Clear;
  edtChargeRate.Text := '0';
  edtHours.Value := 0;
end;

procedure TFrmJSFilter.cmbEmployeeChange(Sender: TObject);
begin
  edtChargeRate.Text := FloatToStr( QryEmployeeCHARGE_RATE.AsFloat );
end;

procedure TFrmJSFilter.edtChargeRateChange(Sender: TObject);
begin
  if Trim( edtChargeRate.Text ) > '' then
  try
     StrToFloat( edtChargeRate.Text );
  except
     edtChargeRate.Clear;
  end;
end;

procedure TFrmJSFilter.PkJobShopTaskBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName( 'ID' ).AsFloat := QtyJobShopRfqID.AsFloat;
  AssignQueryParamValue(DataSet, 'id', QtyJobShopRfqID.AsFloat );

  PkJobShopTask.Title := Format(jobshop_rscstr.cTXT0000046 {'Select Task for Project # %s'}, [QtyJobShopRfqPROJECTNO.asString]);
end;

procedure TFrmJSFilter.sbtnTaskClick(Sender: TObject);
var
  AId:Real;
begin
  if QtyJobShopRfqPROJECTNO.asString <> jobshop_rscstr.cTXT0000047 {'"Not Filtered"'} then
  begin
    with PkJobShopTask do
    if Execute then
    begin
     AId := GetValue('ID');
     edTask.Text := SelectValueFmtAsString('select s.route_seq || ''-'' || s.mfgno || '': '' || s.descrip ' +
                                               '   from jobshop_rfq q,                                    ' +
                                               '        jobshop_task t,                                   ' +
                                               '        arinvt a,                                         ' +
                                               '        arcusto c,                                        ' +
                                               '        standard s                                        ' +
                                               '  where q.id = t.jobshop_rfq_id                           ' +
                                               '    and t.arinvt_id = a.id(+)                             ' +
                                               '    and t.standard_id = s.id(+)                           ' +
                                               '    and q.arcusto_id = c.id(+)                            ' +
                                               '    and t.id = %f',
                                               [AId]);

      FTaskId := GetValue('ID');
    end;
  end
  else
     raise Exception.Create(jobshop_rscstr.cTXT0000048 {'Please select a Project# before choosing a task.'} );

end;

procedure TFrmJSFilter.SetJobShopRfqID(const Value: Real);
begin
  FJobShopRfqID := Value;
end;

procedure TFrmJSFilter.SetTaskId(const Value: Real);
begin
  FTaskId := Value;
end;


end.
