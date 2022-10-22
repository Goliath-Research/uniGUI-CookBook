unit jc_posted_trans;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  vcl.Wwdbdatetimepicker,
  Data.DB,
  MainModule,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  TFrmJobCostPostedTrans = class(TUniForm)
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel25: TUniPanel;
    Bevel3: TUniPanel;
    Panel26: TUniPanel;
    btnApplyActCost: TUniButton;
    Panel1: TUniPanel;
    Label15: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label16: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    Panel24: TUniPanel;
    Label20: TUniLabel;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    wwDBComboDlgItemNo: TUniEdit;
    dateFrom: TUniDBDateTimePicker;
    dateTo: TUniDBDateTimePicker;
    comboTransType: TUniDBComboBox;
    wwDBComboDlgAcct: TUniEdit;
    edBatch: TUniEdit;
    PkArinvt: TIQWebHPick;
    PkArinvtID: TBCDField;
    StringField8: TStringField;
    StringField9: TStringField;
    PkArinvtREV: TStringField;
    StringField10: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtARCUSTO_ID: TBCDField;
    PkArinvtCUSTNO: TStringField;
    PkArinvtCOMPANY: TStringField;
    PkArinvtPK_HIDE: TStringField;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PkAcctEPLANT_ID: TBCDField;
    PkAcctPK_HIDE: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SrcTrans: TDataSource;
    QryTrans: TFDQuery;
    QryTransGLBATCHID_ID: TBCDField;
    QryTransFROM_DATE: TDateTimeField;
    QryTransTO_DATE: TDateTimeField;
    QryTransCREATED_DATE: TDateTimeField;
    QryTransCLASS: TStringField;
    QryTransITEMNO: TStringField;
    QryTransREV: TStringField;
    QryTransDESCRIP: TStringField;
    QryTransQTY: TFMTBCDField;
    QryTransPOSTED: TStringField;
    QryTransBATCHNUMBER: TBCDField;
    QryTransFISCALYR: TStringField;
    QryTransPERIOD: TBCDField;
    QryTransBATCH_DATE: TDateTimeField;
    SrcTransDtl: TDataSource;
    QryTransDtl: TFDQuery;
    QryTransC_TRANS_DRILL_ID: TBCDField;
    QryTransDtlACCT: TStringField;
    QryTransDtlACCT_DESCRIP: TStringField;
    QryTransDtlDEBIT: TBCDField;
    QryTransDtlCREDIT: TBCDField;
    QryTransDtlCOST_ELEMENT: TStringField;
    Panel5: TUniPanel;
    Splitter3: TUniSplitter;
    IQSearch2: TIQUniGridControl;
    SrcTransChild: TDataSource;
    QryTransChild: TFDQuery;
    BCDField1: TBCDField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FMTBCDField1: TFMTBCDField;
    StringField5: TStringField;
    BCDField2: TBCDField;
    StringField6: TStringField;
    BCDField3: TBCDField;
    DateTimeField4: TDateTimeField;
    BCDField4: TBCDField;
    QryTransChildARINVT_ID: TBCDField;
    QryTransARINVT_ID: TBCDField;
    Panel6: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Panel7: TUniPanel;
    Splitter4: TUniSplitter;
    IQSearch3: TIQUniGridControl;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    QryTransTRANSLOG_ID: TBCDField;
    PopupMenu1: TUniPopupMenu;
    JumpToTranslog1: TUniMenuItem;
    JumpToGLBatch1: TUniMenuItem;
    Contents1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlgItemNoCustomDlg(Sender: TObject);
    procedure wwDBComboDlgItemNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgAcctCustomDlg(Sender: TObject);
    procedure wwDBComboDlgAcctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnApplyActCostClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryTransBeforeOpen(DataSet: TDataSet);
    procedure QryTransDtlBeforeOpen(DataSet: TDataSet);
    procedure QryTransAfterScroll(DataSet: TDataSet);
    procedure QryTransChildBeforeOpen(DataSet: TDataSet);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure QryTransChildAfterScroll(DataSet: TDataSet);
    procedure JumpToTranslog1Click(Sender: TObject);
    procedure JumpToGLBatch1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FArinvt_ID: Real;
    FGLAcct_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
    function GetTransType: string;
    procedure SetGLAcct_ID(const Value: Real);
    procedure Validate;
    function GetBatch: Real;
    procedure SetBatch(const Value: Real);
    { Private declarations }
    property Arinvt_ID: Real read FArinvt_ID write SetArinvt_ID;
    property TransType: string read GetTransType;
    property GLAcct_ID: Real read FGLAcct_ID write SetGLAcct_ID;
    property Batch: Real read GetBatch write SetBatch;
  protected
    procedure UpdateFooter(Sender: TObject);
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  TrDtTrTp,
  TransLog,
  { TODO -oathite -cWebConvert : Depends on Batview
  batview, }
  IQMS.Common.HelpHook;

{ TFrmJobCostPostedTrans }
class procedure TFrmJobCostPostedTrans.DoShow;
begin
  self.Create(uniGUIApplication.UniApplication).Show;
end;

procedure TFrmJobCostPostedTrans.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmJobCostPostedTrans.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmJobCostPostedTrans.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmGEN{CHM}, iqhtmGEN{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmJobCostPostedTrans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, comboTransType, Panel5, Panel7 ]);
  IQRegDateTimeScalarWrite( self, 'FromDate', dateFrom.DateTime );
  IQRegDateTimeScalarWrite( self, 'ToDate', dateTo.DateTime );
  IQRegFloatScalarWrite( self, 'glacct_id', GLAcct_ID );
  IQRegFloatScalarWrite( self, 'arinvt_id', Arinvt_ID );
  IQRegFloatScalarWrite( self, 'batch', Batch );
end;

function TFrmJobCostPostedTrans.GetTransType: string;
var
  S: string;
begin
  if comboTransType.ItemIndex = -1 then
     EXIT ('');
  S:= GetToken( comboTransType.Items[ comboTransType.ItemIndex ], #9, 2 );  {IQMS.Common.StringUtils.pas}
  Result:= TFrmTranDates.TransTypeDescriptionToText( S );  // TrDtTrTp.pas
end;

procedure TFrmJobCostPostedTrans.QryTransBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('from_date').asDateTime:= dateFrom.DateTime;
    ParamByName('to_date').asDateTime  := dateTo.DateTime;
    ParamByName('trans_type').asString := TransType;
//    ParamByName('acct_id').asFloat     := GLAcct_ID;
    ParamByName('arinvt_id').asFloat   := Arinvt_ID;
    ParamByName('batch').asFloat       := Batch;
  end;
end;

procedure TFrmJobCostPostedTrans.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
  wwDBComboDlgItemNo.Text:= SelectValueByID('itemno', 'arinvt', FArinvt_ID);
end;

function TFrmJobCostPostedTrans.GetBatch: Real;
begin
  Result:= 0;
  if edBatch.Text > '' then
     Result:= StrToFloat( edBatch.Text );
end;

procedure TFrmJobCostPostedTrans.SetBatch(const Value: Real);
begin
  if Value = 0 then
    edBatch.Text:= ''
  else
    edBatch.Text:= FloatToStr( Value );
end;

procedure TFrmJobCostPostedTrans.SetGLAcct_ID(const Value: Real);
begin
  FGLAcct_ID := Value;
  wwDBComboDlgAcct.Text:= SelectValueByID('acct', 'glacct', FGLAcct_ID);
end;

procedure TFrmJobCostPostedTrans.wwDBComboDlgAcctCustomDlg(Sender: TObject);
begin
  with PkAcct do
    if Execute then
       GLAcct_ID:= GetValue('id')
end;

procedure TFrmJobCostPostedTrans.wwDBComboDlgAcctKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Delete then
  begin
    GLAcct_ID:= 0;
    TUniEdit(Sender).Text:= '';
    Key:= 0;
  end;
end;

procedure TFrmJobCostPostedTrans.wwDBComboDlgItemNoCustomDlg(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
       Arinvt_ID:= GetValue('ID');
end;

procedure TFrmJobCostPostedTrans.wwDBComboDlgItemNoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Delete then
  begin
    Arinvt_ID:= 0;
    TUniEdit(Sender).Text:= '';
    Key:= 0;
  end;
end;

procedure TFrmJobCostPostedTrans.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmJobCostPostedTrans.btnApplyActCostClick(Sender: TObject);
begin
  Validate;
  QryTrans.Close;
  QryTrans.Open;
  QryTransDtl.Close;
  QryTransDtl.Open;
  QryTransChild.Close;
  QryTransChild.Open;
end;

procedure TFrmJobCostPostedTrans.Validate;
begin
   IQAssert( TransType > '', 'Trans Type must be specified - operation aborted');
   IQAssert( dateFrom.DateTime > 0, '''From Date'' must be specified - operation aborted');
   IQAssert( dateTo.DateTime > 0, '''To Date'' must be specified - operation aborted');
   IQAssert( dateTo.DateTime >= dateFrom.DateTime, '''From Date'' cannot be greater than ''To Date'' - operation aborted');
end;

procedure TFrmJobCostPostedTrans.QryTransDtlBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('aacct_id').asFloat     := GLAcct_ID;
    ParamByName('ac_trans_drill_id').asFloat   := QryTransC_TRANS_DRILL_ID.asFloat;
  end;
end;

procedure TFrmJobCostPostedTrans.QryTransAfterScroll(DataSet: TDataSet);
begin
  QryTransDtl.Close;
  QryTransDtl.Open;
  QryTransChild.Close;
  QryTransChild.Open;
  UpdateFooter(nil);
end;

procedure TFrmJobCostPostedTrans.QryTransChildBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('from_date').asDateTime:= dateFrom.DateTime;
    ParamByName('to_date').asDateTime  := dateTo.DateTime;
    ParamByName('trans_type').asString := TransType;
//    ParamByName('acct_id').asFloat     := GLAcct_ID;
    ParamByName('arinvt_id').asFloat   := Arinvt_ID;
    ParamByName('batch').asFloat       := Batch;
    if QryTransARINVT_ID.asFloat = 0 then
      ParamByName('aParentArinvtId').asFloat := -10
    else
      ParamByName('aParentArinvtId').asFloat := QryTransARINVT_ID.asFloat;
  end;

end;


procedure TFrmJobCostPostedTrans.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmJobCostPostedTrans.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmJobCostPostedTrans.QryTransChildAfterScroll(DataSet: TDataSet);
begin
  QryTransDtl.Close;
  QryTransDtl.Open;
  UpdateFooter(nil);
end;

procedure TFrmJobCostPostedTrans.UniFormCreate(Sender: TObject);
var
  dValue: TDateTime;
  nValue: Real;
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'OnUpdateFooter'
  IQSearch2.DBGrid.OnUpdateFooter := UpdateFooter; }

  IQRegFormRead(self, [ self, comboTransType, Panel5, Panel7 ]);
  if IQRegDateTimeScalarRead( self, 'FromDate', dValue) then
     dateFrom.DateTime:= dValue;
  if IQRegDateTimeScalarRead( self, 'ToDate', dValue) then
     dateTo.DateTime:= dValue;
  if IQRegFloatScalarRead( self, 'glacct_id', nValue) then
     GLAcct_ID:= nValue;
  if IQRegFloatScalarRead( self, 'arinvt_id', nValue) then
     Arinvt_ID:= nValue;
  if IQRegFloatScalarRead( self, 'batch', nValue) then
     Batch:= nValue;

end;

procedure TFrmJobCostPostedTrans.UpdateFooter(Sender: TObject);
var
  ACredit, ADebit:Real;
begin
  ACredit := SelectValueFmtAsFloat('select sum(a.credit) ' +
                       '   from c_trans_drill_acct a,                      ' +
                       '        glacct g                                   ' +
                       '  where a.c_trans_drill_id = %f    ' +
                       '    and a.glacct_id = g.id(+)                      ' +
                       '    and (%f = 0                             ' +
                       '         or                                        ' +
                       '         a.glacct_id = %f) ', [QryTransC_TRANS_DRILL_ID.asFloat, GLAcct_ID, GLAcct_ID]);

  ADebit := SelectValueFmtAsFloat('select sum(a.debit) ' +
                       '   from c_trans_drill_acct a,                      ' +
                       '        glacct g                                   ' +
                       '  where a.c_trans_drill_id = %f    ' +
                       '    and a.glacct_id = g.id(+)                      ' +
                       '    and (%f = 0                             ' +
                       '         or                                        ' +
                       '         a.glacct_id = %f) ', [QryTransC_TRANS_DRILL_ID.asFloat, GLAcct_ID, GLAcct_ID]);

  { TODO -oathite -cWebConvert : Undeclared identifier: 'ColumnByName'
  IqSearch2.DBGrid.ColumnByName('CREDIT').FooterValue := Format('%m', [ACredit]);
  IqSearch2.DBGrid.ColumnByName('DEBIT').FooterValue :=  Format('%m', [ADebit]); }
end;

procedure TFrmJobCostPostedTrans.JumpToGLBatch1Click(Sender: TObject);
begin
  (* TODO -oathite -cWebConvert : Depends on Batview
  if SelectValueFmtAsFloat('select id from glbatchid where id = %f', [QryTransGLBATCHID_ID.asFloat]) <> 0 then
    DOViewBatchAllSources(QryTransGLBATCHID_ID.asFloat);  {batview.pas}  *)
end;

procedure TFrmJobCostPostedTrans.JumpToTranslog1Click(Sender: TObject);
begin
  DoTransactionLog( QryTransARINVT_ID.AsFloat); {TransLog.pas}
end;

end.
