unit JcProcCostLotSum;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Menus,
  IQMS.WebVcl.About,
  Buttons,
  DB,
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
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, uniDateTimePicker;

type
  TFrmProc_cost_lot_sum = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnPrint: TUniButton;
    BtnCancel: TUniButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    PopulateCompositeTable1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    dbFrom: TUniDateTimePicker;
    dbTo: TUniDateTimePicker;
    GroupBox1: TUniGroupBox;
    rbAll: TUniRadioButton;
    RbOne: TUniRadioButton;
    Edit1: TUniEdit;
    SBCust: TUniSpeedButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    PkCustomer: TIQWebHPick;
    PkCustomerARCUSTO_ID: TBCDField;
    PkCustomerCUSTNO: TStringField;
    PkCustomerCOMPANY: TStringField;
    PkCustomerADDR1: TStringField;
    PkCustomerADDR2: TStringField;
    PkCustomerCITY: TStringField;
    PkCustomerSTATE: TStringField;
    PkCustomerZIP: TStringField;
    PkCustomerCUST_GROUP: TStringField;
    PkCustomerPK_HIDE: TStringField;
    Bevel1: TUniPanel;
    procedure BtnCancelClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure rbAllClick(Sender: TObject);
    procedure RbOneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBCustClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure PopulateCompositeTable1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArcusto_ID:Real;
    FLotCostDays: Real;
    procedure PopulateCompositeTable;
    procedure Set_ALotCostDays(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(ALotCostDays: Real );
    property ALotCostDays: Real write Set_ALotCostDays;
  end;

implementation

{$R *.dfm}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  jc_rscstr,
  PanelMsg,
  IQMS.Common.Dialogs,
  IQMS.Common.Print,
  IQMS.Common.NLS;

class procedure TFrmProc_cost_lot_sum.DoShowModal( ALotCostDays: Real );
var
  LFrm: TFrmProc_cost_lot_sum;
begin
   LFrm:= Self.Create(UniGuiApplication.UniApplication);
   LFrm.ALotCostDays:= ALotCostDays;
   LFrm.ShowModal;
end;

procedure TFrmProc_cost_lot_sum.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProc_cost_lot_sum.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmProc_cost_lot_sum.rbAllClick(Sender: TObject);
begin
  RbOne.Checked := false;
  Edit1.Text := '';
  SBCust.Enabled := false;
  FArcusto_ID := 0;
end;

procedure TFrmProc_cost_lot_sum.RbOneClick(Sender: TObject);
begin
  rbAll.Checked := false;
  SBCust.Enabled := true;
end;

procedure TFrmProc_cost_lot_sum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  IQRegDateTimeScalarWrite( self, 'from_date', dbFrom.DateTime );
  IQRegDateTimeScalarWrite( self, 'to_date', dbTo.DateTime );
end;

procedure TFrmProc_cost_lot_sum.SBCustClick(Sender: TObject);
begin
  with PkCustomer do
  if execute then
  begin
    FArcusto_ID := GetValue('ARCUSTO_ID');
    Edit1.text := GetValue('COMPANY');
  end;
end;

procedure TFrmProc_cost_lot_sum.Set_ALotCostDays(const Value: Real);
begin
  FLotCostDays:= Value;
end;

procedure TFrmProc_cost_lot_sum.UniFormShow(Sender: TObject);
var
  ADate: TDateTime;
begin
  IQRegFormRead( self, [self]);
  rbAll.Checked := true;

  if IQRegDateTimeScalarRead( self, 'from_date', ADate ) then
     dbFrom.DateTime:= ADate
  else
     dbFrom.DateTime:= Date;

  if IQRegDateTimeScalarRead( self, 'to_date', ADate ) then
     dbTo.DateTime:= ADate
  else
     dbTo.DateTime:= Date;

  rbAllClick(nil);
end;

procedure TFrmProc_cost_lot_sum.btnPrintClick(Sender: TObject);
var
  SelectionList:TStringList;
begin
  if not IqConfirmYN(jc_rscstr.cTXT0000013) then    // 'This option populates composite table(s) and prints the report. Do you wish to continue?'
     EXIT;

  PopulateCompositeTable;

  try
    SelectionList := TStringList.Create;
    SelectionList.Add(Format('{C_PROCESS_COST_LOT_SUM.USERID} = ''%s''', [SecurityManager.UserName + '_LOT_SUM']));
    PrintDefaultReport( self, 'PROC_COST_BY_LOT_REPORT', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;

  Close;
end;

procedure TFrmProc_cost_lot_sum.PopulateCompositeTable1Click(Sender: TObject);
begin
  if not IqConfirmYN(jc_rscstr.cTXT0000009) then exit;  // 'Do you wish to populate composite table(s)?';

  PopulateCompositeTable;
end;

procedure TFrmProc_cost_lot_sum.PopulateCompositeTable;
var
  h: TPanelMesg;
begin
  if RbOne.Checked and (FArcusto_ID = 0) then
    raise exception.Create(jc_rscstr.cTXT0000012);

  h:= hPleaseWait('');
  try
    h.Mesg:= jc_rscstr.cTXT0000010;
    ExecuteCommandFmt('begin PROC_COST_LOT_SUM.populate_c_proc_cost_lot_sum(%f, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''), %f); end;',
              [ FArcusto_ID,
                FormatDateTime('mm/dd/yyyy', dbFrom.DateTime),
                FormatDateTime('mm/dd/yyyy', dbTo.DateTime),
                FLotCostDays] );
  finally
    h.Free;
  end;
end;


end.
