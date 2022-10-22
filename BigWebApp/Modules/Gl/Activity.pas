unit Activity;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  ActDrill,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.Time,
  Vcl.Wwdatsrc,
  IQMS.Common.StringUtils,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniRadioButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniDateTimePicker,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, IQMS.WebVcl.Strings, uniComboBox, uniDBComboBox;


type
  TFrmActivity = class(TUniForm)
    MainMenu1: TUniMainMenu;
    Options1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel9: TUniPanel;
    SBLookUp: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    SBDrillDown: TUniSpeedButton;
    Splitter1: TUniSplitter;
    LookupAccount1: TUniMenuItem;
    SrcGLAcct: TDataSource;
    TblGlAcct: TFDTable;
    TblGlAcctID: TBCDField;
    TblGlAcctACCT: TStringField;
    TblGlAcctDESCRIP: TStringField;
    TblGlAcctGL_SUBACCT_TYPE_ID: TBCDField;
    QryPeriod: TFDQuery;
    SrcQry: TDataSource;
    QryPeriodPERIOD: TBCDField;
    QryPeriodGLYEAR_ID: TBCDField;
    QryPeriodGLACCT_ID: TBCDField;
    QryPeriodPERIOD_ID: TBCDField;
    QryDate: TFDQuery;
    QryDatePERIOD: TBCDField;
    QryDateGLYEAR_ID: TBCDField;
    QryDateGLACCT_ID: TBCDField;
    QryDatePERIOD_ID: TBCDField;
    TblGlAcctnFromDate: TDateField;
    TblGlAcctnToDate: TDateField;
    TblGlAccountPeriodSummary: TFDTable;
    TblGlAccountPeriodSummaryGLPERIODS_ID: TBCDField;
    TblGlAccountPeriodSummaryGLACCT_ID: TBCDField;
    TblGlYear: TFDTable;
    QryPeriodGlYear_Descrip: TStringField;
    TblGlYearID: TBCDField;
    TblGlYearDESCRIP: TStringField;
    TblGlYearSTART_DATE: TDateTimeField;
    TblGlYearEND_DATE: TDateTimeField;
    QryPeriodTOTAL_CREDIT: TBCDField;
    QryPeriodTOTAL_DEBIT: TBCDField;
    QryDateTOTAL_CREDIT: TFMTBCDField;
    QryDateTOTAL_DEBIT: TFMTBCDField;
    QryDateGlYear_Descrip: TStringField;
    SrcGlYear: TDataSource;
    TblGlAcctnGlYearId: TFloatField;
    QryDateBalance: TFloatField;
    QryDateBeginning: TFloatField;
    PopupMenu1: TUniPopupMenu;
    DrillDown1: TUniMenuItem;
    TblGlPeriods: TFDTable;
    TblGlPeriodsID: TBCDField;
    TblGlPeriodsGLYEAR_ID: TBCDField;
    TblGlPeriodsPERIOD: TBCDField;
    TblGlPeriodsSTART_DATE: TDateTimeField;
    TblGlPeriodsEND_DATE: TDateTimeField;
    TblGlPeriodsSTATUS: TStringField;
    QryBatchId: TFDQuery;
    QryBatchIdGLYEAR_ID: TBCDField;
    QryBatchIdGLACCT_ID: TBCDField;
    QryBatchIdPERIOD_ID: TBCDField;
    QryBatchIdBATCH_ID: TBCDField;
    QryBatchIdTOTAL_CREDIT: TFMTBCDField;
    QryBatchIdTOTAL_DEBIT: TFMTBCDField;
    QryBatchIdBALANCE: TFMTBCDField;
    TblGlBatchId: TFDTable;
    SrcTblBatchId: TDataSource;
    DrillDown2: TUniMenuItem;
    QryBatchOld: TFDQuery;
    SrcTblBatch: TDataSource;
    QryBatchOldDEBIT: TBCDField;
    QryBatchOldCREDIT: TBCDField;
    IQAbout1: TIQWebAbout;
    PkGLAcct: TIQWebHPick;
    PkGLAcctACCT: TStringField;
    PkGLAcctDESCRIP: TStringField;
    PkGLAcctID: TBCDField;
    TblGlAcctnFromBatchDate: TDateField;
    TblGlAcctnToBatchDate: TDateField;
    QryPeriodnFromBatchDate: TDateField;
    QryPeriodnToBatchDate: TDateField;
    QryDatenFromBatchDate: TDateField;
    QryDatenToBatchDate: TDateField;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    QryBatchIdOnHand: TFloatField;
    QryPeriodTOTAL: TBCDField;
    QryDateTOTAL: TFMTBCDField;
    NavMain: TUniDBNavigator;
    ShowCriteria1: TUniMenuItem;
    ShowCriteria2: TUniMenuItem;
    TblGlAccountPeriodSummaryPERIOD_DEBIT: TBCDField;
    TblGlAccountPeriodSummaryPERIOD_CREDIT: TBCDField;
    TblGlAccountPeriodSummaryPERIOD_BALANCE: TBCDField;
    QryBatchOldGLBATCHID_ID: TBCDField;
    QryBatchOldTableName: TStringField;
    QryBatchOldHEADER_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    IQRepDef1: TIQWebRepDef;
    SrcWholeBatch: TDataSource;
    QryWholeBatch: TFDQuery;
    QryWholeBatchDEBIT: TBCDField;
    QryWholeBatchCREDIT: TBCDField;
    QryWholeBatchGLBATCHID_ID: TBCDField;
    QryWholeBatchHEADER_ID: TBCDField;
    QryWholeBatchACCT: TStringField;
    QryWholeBatchBATCHNUMBER: TBCDField;
    QryWholeBatchSOURCE: TStringField;
    PkGLAcctTYPE: TStringField;
    TblGlAcctTYPE: TStringField;
    TblGlAcctMAJORTYPE: TStringField;
    QryPeriodBEGINNING: TFMTBCDField;
    QryPeriodBALANCE: TFMTBCDField;
    QryBatchIdBATCH_DATE: TDateTimeField;
    Contents1: TUniMenuItem;
    QryWholeBatchDESCRIP: TStringField;
    QryBatchOldDESCRIP: TStringField;
    QryYtdBeginnig: TFDQuery;
    QryBatchOldREFERENCE: TStringField;
    QryWholeBatchREFERENCE: TStringField;
    QryBatchOldREF_CODE: TStringField;
    QryWholeBatchREF_CODE: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    PageControl1: TUniPageControl;
    TabGrid: TUniTabSheet;
    DBGridAccounts: TUniDBGrid;
    TabForm: TUniTabSheet;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    DBGridPeriods: TUniDBGrid;
    IQTiming1: TIQWebTiming;
    Debug1: TUniMenuItem;
    Show1: TUniMenuItem;
    Clear1: TUniMenuItem;
    PopupMenu2: TUniPopupMenu;
    CalculateYearbeginningbalance1: TUniMenuItem;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    BtnApply: TUniButton;
    Label6: TUniLabel;
    edAccount: TUniEdit;
    edDescrip: TUniEdit;
    QryPeriodBUDGETED: TFMTBCDField;
    QryDateBUDGETED: TFMTBCDField;
    TblGlAcctEPLANT_ID: TBCDField;
    PkGLAcctEPLANT_ID: TBCDField;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    N2: TUniMenuItem;
    BudgetInfo1: TUniMenuItem;
    QryBatchOldID2: TBCDField;
    QryWholeBatchNUM_OF_SUPP_DOCS: TBCDField;
    QryBatchIdUSERID: TStringField;
    QryBatchIdBATCHNUMBER: TBCDField;
    QryBatchIdSOURCE: TStringField;
    Bevel1: TUniPanel;
    PnlFilter: TUniPanel;
    Splitter3: TUniSplitter;
    PnlFilterLeft: TUniPanel;
    PnlFilterLeftClient: TUniPanel;
    DBLookupComboBoxGlYear: TUniDBLookupComboBox;
    Label5: TUniLabel;
    RBPeriod: TUniRadioButton;
    RBDate: TUniRadioButton;
    EditFromDate: TUniDateTimePicker;
    EditToDate: TUniDateTimePicker;
    Label1: TUniLabel;
    Label2: TUniLabel;
    PnlFormView: TUniPanel;
    Splitter4: TUniSplitter;
    PnlFormViewLeft: TUniPanel;
    PnlFormViewClient: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label7: TUniLabel;
    DBEditAccount: TUniDBEdit;
    DBEditDescript: TUniDBEdit;
    DBEplantID: TUniDBEdit;
    QryBatchOldCost_Source: TStringField;
    QryBatchOldCOST_OBJECT_ID: TBCDField;
    QryBatchOldCOST_OBJECT_SOURCE: TStringField;
    QryDateNoact: TFDQuery;
    StringField1: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    DateField1: TDateField;
    DateField2: TDateField;
    QryDateNoactPERIOD: TBCDField;
    QryDateNoactTOTAL_CREDIT: TFMTBCDField;
    QryDateNoactTOTAL_DEBIT: TFMTBCDField;
    QryDateNoactTOTAL: TFMTBCDField;
    QryDateNoactBUDGETED: TFMTBCDField;
    QryWholeBatchACCT_DESCRIP: TStringField;
    QryBatchIdRunningTotal: TFloatField;
    QryPeriodTOTAL_STAT_VALUE: TFMTBCDField;
    QryDateTOTAL_STAT_VALUE: TFMTBCDField;
    QryBatchOldSTAT_VALUE: TFMTBCDField;
    QryDateCumm_stat_Value: TFloatField;
    QryPeriodCumm_stat_Value: TFloatField;
    QryBatch: TFDQuery;
    QryBatchDESCRIP: TStringField;
    QryBatchDEBIT: TBCDField;
    QryBatchCREDIT: TBCDField;
    QryBatchSTAT_VALUE: TFMTBCDField;
    QryBatchGLBATCHID_ID: TBCDField;
    QryBatchHEADER_ID: TBCDField;
    QryBatchREFERENCE: TStringField;
    QryBatchREF_CODE: TStringField;
    QryBatchCOST_OBJECT_ID: TBCDField;
    QryBatchCOST_OBJECT_SOURCE: TStringField;
    QryBatchID2: TBCDField;
    QryBatchTableName: TStringField;
    QryBatchCOST_SOURCE: TStringField;
    QryPeriodREPCUR_PERIOD_DEBIT: TBCDField;
    QryPeriodREPCUR_PERIOD_CREDIT: TBCDField;
    QryDateREPCUR_PERIOD_DEBIT: TFMTBCDField;
    QryDateREPCUR_PERIOD_CREDIT: TFMTBCDField;
    QryDateNoactREPCUR_PERIOD_DEBIT: TFMTBCDField;
    QryDateNoactREPCUR_PERIOD_CREDIT: TFMTBCDField;
    QryDateNoactGLYEAR_ID: TBCDField;
    QryDateNoactGLACCT_ID: TFMTBCDField;
    QryDateNoactPERIOD_ID: TBCDField;
    procedure SBGridViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridAccountsEnter(Sender: TObject);
    procedure DBGridPeriodsEnter(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure TblGlAcctCalcFields(DataSet: TDataSet);
    procedure QryPeriodCalcFields(DataSet: TDataSet);
    procedure QryDateCalcFields(DataSet: TDataSet);
    procedure DrillDown1Click(Sender: TObject);
    procedure SrcQryDataChange(Sender: TObject; Field: TField);
    procedure SrcTblBatchIdDataChange(Sender: TObject; Field: TField);
    procedure Reset_Button_Grid_FrmDrillDown(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure LookupAccount1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RBDateClick(Sender: TObject);
    procedure RBPeriodClick(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure QryBatchIdCalcFields(DataSet: TDataSet);
    procedure ShowCriteria1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBLookupComboBoxGlYearCloseUp(Sender: TObject);
    procedure TblGlAcctAfterScroll(DataSet: TDataSet);
    procedure DBGridAccountsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryPeriodBeforeOpen(DataSet: TDataSet);
    procedure QryPeriodAfterOpen(DataSet: TDataSet);
    procedure Show1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure CalculateYearbeginningbalance1Click(Sender: TObject);
    procedure TblGlAcctBeforeOpen(DataSet: TDataSet);
    procedure PkGLAcctBeforeOpen(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure BudgetInfo1Click(Sender: TObject);
    procedure TblGlYearFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure QryDateNoactCalcFields(DataSet: TDataSet);
    procedure QryBatchBeforeOpen(DataSet: TDataSet);
    procedure QryBatchIdAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    HMsg:TPanelMesg;
    procedure DisableEnableEdits(lState:Boolean);
    procedure DisableEnableGrid(lState:Boolean);
    procedure OpenQryDate;
    procedure OpenQryPeriod;
    procedure GetBeginningBalancePeriod(nPeriodId, nYearId, nAcctId:Real);
    procedure GetBeginningBalanceDate(nPeriodId, nYearId, nAcctId:Real);
    procedure GetBeginningBalanceDateNoAct(nPeriodId, nYearId, nAcctId:Real);
    procedure GetBeginningBalanceBatch(nBatchId, nPeriodId, nYearId, nAcctId:Real);
    procedure CloseDrillDown;
    procedure OpenDrillDown;
    procedure OpenQryDateNoact;
    function  GetPrivBal:Real;
  public
    { Public declarations }
    BegBal:Real;
    PrevBal:Real;
    BegBatchBal:Real;
    BegBatchBal2:Real;
    PrevBatchBal:Real;
    PrevBatchBal2:Real;
    nGlAcctId:Real;
    nGlYearId:Real;
    fDrillDown : TFrmActDrillDown;
    procedure DoActivityAcct(AID:Real);
    procedure DoActivity;
  end;

procedure DoActivity;
procedure DoActivityAcct(AID:Real);
implementation

{$R *.DFM}

uses
  glbudinf,
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  IQSecIns,   }
  MainModule;

procedure DoActivity;
var
  frm : TFrmActivity;
begin
  frm := TFrmActivity.Create(UniApplication);
  frm.DoActivity;
  frm.Show;
//  with TFrmActivity.Create(AOwner) do
//  try
//    ShowModal
//  finally
//    Free;
//  end;
end;

procedure DoActivityAcct(AID:Real);
var
  LFrmActivity : TFrmActivity;
begin
  LFrmActivity := TFrmActivity.Create(UniApplication);
  LFrmActivity.DoActivityAcct(AID);
  LFrmActivity.Show;
end;


procedure TFrmActivity.DoActivity;
var
  i:integer;
begin
  BegBal  := 0;
  PrevBal := 0;
  BegBatchBal  := 0;
  BegBatchBal2  := 0;
  PrevBatchBal  := 0;
  PrevBatchBal2 := 0;

  for i := 0 to DBGridPeriods.Columns.Count - 1 do
  begin
    if DBGridPeriods.Columns[I].FieldName = 'REPCUR_PERIOD_CREDIT' then
      DBGridPeriods.Columns[I].visible := false;
    if DBGridPeriods.Columns[I].FieldName = 'REPCUR_PERIOD_DEBIT' then
      DBGridPeriods.Columns[I].visible := false;
  end;

  if SelectValueAsString('select report_curr from eplant where id = misc.geteplantid') <> '' then
  begin
    for i := 0 to DBGridPeriods.Columns.Count - 1 do
    begin
      if DBGridPeriods.Columns[I].FieldName = 'REPCUR_PERIOD_CREDIT' then
        DBGridPeriods.Columns[I].visible := true;
      if DBGridPeriods.Columns[I].FieldName = 'REPCUR_PERIOD_DEBIT' then
        DBGridPeriods.Columns[I].visible := true;
    end;
  end;

  IQSetTablesActive( TRUE, self );
end;

procedure TFrmActivity.DoActivityAcct( AID:Real );
begin
  DoActivity;
  TblGlAcct.Locate('ID', AID, []);
  BtnApplyClick(nil);
end;


procedure TFrmActivity.SBGridViewClick(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    DBGridAccounts.DataSource:= NIL;
    PageControl1.ActivePage := TabForm;
  end
  else
  begin
    DBGridAccounts.DataSource:= SrcGlAcct;
    PageControl1.ActivePage := TabGrid;
  end;

end;

procedure TFrmActivity.FormCreate(Sender: TObject);
begin
  DisableEnableEdits(False);
  DisableEnableGrid(False);
//  EditFromDate.Text := DateToStr(Date);
//  EditToDate.Text := DateToStr(Date);

  EditFromDate.DateTime := Date;
  EditToDate.DateTime   := Date;

  DBLookUpComboBoxGlYear.KeyValue := SelectValueAsFloat('select glyear_id from iqsys');
  TblGlPeriods.Open;
  { TODO -oathite -cWebConvert : Incompatible types: 'TForm' and 'TFrmActivity'
  IQMS.Common.Controls.CenterForm(Self); }
  IQRegFormRead( self, [ self, DBGridAccounts, DBGridPeriods,
   Panel4, Panel2, PnlFilter, PnlFilterLeft, PnlFormViewLeft, Panel1 ]);
  DBGridPeriods.Cursor:= crDrill;
end;

procedure TFrmActivity.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGridAccounts, DBGridPeriods,
   Panel4, Panel2, PnlFilter, PnlFilterLeft, PnlFormViewLeft, Panel1 ]);
  Action := caFree;
end;


procedure TFrmActivity.DBGridAccountsEnter(Sender: TObject);
begin
  NavMain.DataSource := SrcGlAcct;
end;

procedure TFrmActivity.DBGridPeriodsEnter(Sender: TObject);
begin
  NavMain.DataSource := SrcQry;
end;

procedure TFrmActivity.DisableEnableEdits(lState:Boolean);
begin
  if lState then
  begin
    EditFromDate.Enabled := lState;
    EditFromDate.Color   := clWindow;
    EditToDate.Enabled   := lState;
    EditToDate.Color     := clWindow;
  end
  else
  begin
    EditFromDate.Enabled := lState;
    EditFromDate.Color   := clBtnFace;
    EditToDate.Enabled   := lState;
    EditToDate.Color     := clBtnFace;
  end;
end;


procedure TFrmActivity.BtnApplyClick(Sender: TObject);
var
  ActiveYear:Boolean;
  AGlyear, AGlAcct:Real;
begin
  edAccount.Text := TblGlAcct.FieldByName('ACCT').asString;
  edDescrip.Text := TblGlAcct.FieldByName('DESCRIP').asString;

  AGlyear := DBLookUpComboBoxGlYear.KeyValue;
  AGlAcct := TblGlAcct.FieldByName('ID').asFloat;
  ActiveYear := SelectValueFmtAsFloat('select count(*) from c_glacct_ytd where glyear_id = %f and glacct_id = %f', [AGlyear, AGlAcct]) <> 0;

//  ActiveYear := SelectValueFmtAsFloat('select gl_misc.IsActiveForThisYear(%f, %f) from dual', [AGlyear, AGlAcct]) = 1;

  if rbPeriod.Checked then
  begin
    if ActiveYear then
    begin
      OpenQryPeriod;
      SrcQry.DataSet := QryPeriod;
    end
    else
    begin
      OpenQryDateNoact;
      SrcQry.DataSet := QryDateNoact;
    end;
//    GroupBox1.Caption := ' Group Activity By Period ';
  end
  else
  begin
    if ActiveYear then
    begin
      OpenQryDate;
      SrcQry.DataSet := QryDate;
    end
    else
    begin
      OpenQryDateNoact;
      SrcQry.DataSet := QryDateNoact;
    end;
//    GroupBox1.Caption := ' Group Activity By Date ';
  end;
  DisableEnableGrid(True);
  BtnApply.Enabled := False;
end;

procedure TFrmActivity.OpenQryDate;
var
  AperiodId, AGlyear:Real;
  AStartDate, AEndDate:TDateTime;
begin
//  IqTiming1.Start('OpenQryDate');
  with QryDate do
  begin
    Close;
//    ParamByName('nFromDate').Value := StrToDate(EditFromDate.Text);
//    ParamByName('nToDate').Value := StrToDate(EditToDate.Text);

    ParamByName('nFromDate').Value := Trunc(EditFromDate.DateTime);
    ParamByName('nToDate').Value := Trunc(EditToDate.DateTime);

    ParamByName('nGlYearId1').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId2').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId3').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId4').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId5').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId6').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId7').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId8').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlAcctId1').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId2').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId3').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId4').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId5').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId6').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    Open;

//    if eof and bof then
//    begin
//      Close;
//      AGlyear := DBLookUpComboBoxGlYear.KeyValue;
//      AStartDate := SelectValueFmtAsFloat('select start_date from glyear where id = %f', [AGlyear]);
//      AEndDate := SelectValueFmtAsFloat('select end_date from glyear where id = %f', [AGlyear]);
//      EditFromDate.Date := Trunc(AStartDate);
//      EditToDate.Date   := Trunc(AEndDate);
//      BtnApplyClick(nil);
//    end
//    else
//    begin
      AperiodId := SelectValueAsFloat('select id from glperiods where Trunc(sysdate) between start_date and end_date and GL.CheckGLYearEplant(id) = 1');
      Locate('PERIOD_ID', AperiodId, []);
//    end;
  end;
//  IqTiming1.Stop('OpenQryDate');
end;

procedure TFrmActivity.OpenQryDateNoact;
var
  AperiodId:Real;
begin
  with QryDateNoact do
  begin
    Close;
    ParamByName('nGlYearId1').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId2').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId3').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlAcctId1').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId2').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId3').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    Open;

    AperiodId := SelectValueAsFloat('select id from glperiods where Trunc(sysdate) between start_date and end_date and GL.CheckGLYearEplant(id) = 1');

    Locate('PERIOD_ID', AperiodId, []);
  end;
end;


procedure TFrmActivity.OpenQryPeriod;
var
  AperiodId:Real;
begin
//  IqTiming1.Start('OpenQryPeriod');
  with QryPeriod do
  begin
    Close;
    ParamByName('nGlYearId1').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId2').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId3').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId4').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId5').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId6').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId7').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId8').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId9').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlYearId10').Value := DBLookUpComboBoxGlYear.KeyValue;
    ParamByName('nGlAcctId1').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId2').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId3').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId4').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    ParamByName('nGlAcctId5').Value :=  TblGlAcct.FieldByName('ID').asFloat;
    Open;
    AperiodId := SelectValueAsFloat('select id from glperiods where Trunc(sysdate) between start_date and end_date and GL.CheckGLYearEplant(id) = 1');
    Locate('PERIOD_ID', AperiodId, []);
  end;
//  IqTiming1.Stop('OpenQryPeriod');
end;

procedure TFrmActivity.TblGlAcctCalcFields(DataSet: TDataSet);
begin
  {Values to fool the QryPeriod and QryBatchId when initializing}
  with TblGlAcct do
  begin
    FieldByName('nFromDate').AsDateTime      := SelectValueAsFloat('select to_date(''01/01/1900'', ''MM/DD/RRRR'') from dual');
    FieldByName('nToDate').AsDateTime        := SelectValueAsFloat('select to_date(''01/01/4000'', ''MM/DD/RRRR'') from dual');
    FieldByName('nFromBatchDate').AsDateTime := SelectValueAsFloat('select to_date(''01/01/1900'', ''MM/DD/RRRR'') from dual');
    FieldByName('nToBatchDate').AsDateTime   := SelectValueAsFloat('select to_date(''01/01/4000'', ''MM/DD/RRRR'') from dual');
//    FieldByName('nFromDate').AsDateTime      := StrToDate('01/01/1900');
//    FieldByName('nToDate').AsDateTime        := StrToDate('01/01/4000');
//    FieldByName('nFromBatchDate').asDateTime := StrToDate('01/01/1900');
//    FieldByName('nToBatchDate').asDateTime   := StrToDate('01/01/4000');
    FieldByName('nGlYearId').AsFloat         := 0;
  end;
end;

procedure TFrmActivity.TblGlYearFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
begin
  Accept := SelectValueFmtAsFloat('select misc.eplant_filter_include_nulls(eplant_id) from glyear where id = %f', [TblGlYearID.asFloat]) = 1;
end;

procedure TFrmActivity.DisableEnableGrid(lState:Boolean);
begin
  if lState then
  begin
    DbGridPeriods.DataSource := SrcQry;
    DbGridPeriods.Color := clWindow;
    DbGridPeriods.Enabled := True;
    SBDrillDown.Enabled := True;
    DrillDown2.Enabled := True;
  end
  else
  begin
    DbGridPeriods.DataSource := NIL;
    DbGridPeriods.Color := clBtnFace;
    DbGridPeriods.Enabled := False;
    SBDrillDown.Enabled := False;
    DrillDown2.Enabled := False;
  end;
end;

procedure TFrmActivity.QryPeriodCalcFields(DataSet: TDataSet);
begin
  with QryPeriod do
  begin
    {Values to fool the QryBatchId when initializing}
    FieldByName('nFromBatchDate').AsDateTime := SelectValueAsFloat('select to_date(''01/01/1900'', ''MM/DD/RRRR'') from dual');
    FieldByName('nToBatchDate').asDateTime   := SelectValueAsFloat('select to_date(''01/01/4000'', ''MM/DD/RRRR'') from dual');
    QryPeriodCumm_stat_Value.asFloat := SelectValueFmtAsFloat('select sum(NVL(d.stat_value, 0)) ' +
                                               '   from glbatch d,               ' +
                                               '        glbatchid h,             ' +
                                               '        glperiods p              ' +
                                               '  where d.glbatchid_id = h.id    ' +
                                               '    and h.glperiods_id = p.id    ' +
                                               '    and d.glacct_id = %f          ' +
                                               '    and p.glyear_id = %f          ' +
                                               '    and p.id <= %f                ',
                                               [QryPeriodGLACCT_ID.asFloat,
                                                QryPeriodGLYEAR_ID.asFloat,
                                                QryPeriodPERIOD_ID.asFloat]);
//    FieldByName('nFromBatchDate').asDateTime := StrToDate('01/01/1900');
//    FieldByName('nToBatchDate').asDateTime := StrToDate('01/01/4000');

//    GetBeginningBalancePeriod( FieldByName('PERIOD_ID').asFloat,
//                               FieldByName('GLYEAR_ID').asFloat,
//                               FieldByName('GLACCT_ID').asFloat );
//    FieldByName('Balance').asFloat := FieldByName('Total').asFloat + BegBal;
//    FieldByName('Beginning').asFloat := BegBal;
//    PrevBal := FieldByName('Balance').asFloat;
  end;

end;

procedure TFrmActivity.GetBeginningBalancePeriod(nPeriodId, nYearId, nAcctId:Real);
begin
  if nPeriodId = SelectValueAsFloat(IQFormat('select min(period_id) ' +
                             'from v_glperiods_batch ' +
                             'where glyear_id = %f ' +
                             'and glacct_id = %f', [nYearId, nAcctId]))
    then BegBal := SelectValueAsFloat(IQFormat('select (NVL(begdr, 0) - NVL(begcr, 0)) ' +
                                 'from glacct_fy ' +
                                 'where glyear_id = %f ' +
                                 'and glacct_id = %f', [nYearId, nAcctId]))
    else BegBal := PrevBal;

end;

procedure TFrmActivity.QryDateCalcFields(DataSet: TDataSet);
begin
  with TFDQuery(Dataset) do
  begin
    {Values to fool the QryBatchId when initializing}
//    FieldByName('nFromBatchDate').asDateTime := StrToDate(EditFromDate.Text);
//    FieldByName('nToBatchDate').asDateTime   := StrToDate(EditToDate.Text);

    QryDateCumm_stat_Value.asFloat := SelectValueFmtAsFloat('select sum(NVL(d.stat_value, 0)) ' +
                                               '   from glbatch d,               ' +
                                               '        glbatchid h,             ' +
                                               '        glperiods p              ' +
                                               '  where d.glbatchid_id = h.id    ' +
                                               '    and h.glperiods_id = p.id    ' +
                                               '    and d.glacct_id = %f          ' +
                                               '    and p.glyear_id = %f          ' +
                                               '    and p.id <= %f                ',
                                               [QryDateGLACCT_ID.asFloat,
                                                QryDateGLYEAR_ID.asFloat,
                                                QryDatePERIOD_ID.asFloat]);


    FieldByName('nFromBatchDate').asDateTime := EditFromDate.DateTime;
    FieldByName('nToBatchDate').asDateTime   := EditToDate.DateTime;


    GetBeginningBalanceDate( FieldByName('PERIOD_ID').asFloat,
                               FieldByName('GLYEAR_ID').asFloat,
                               FieldByName('GLACCT_ID').asFloat );
    FieldByName('Balance').asFloat := FieldByName('Total').asFloat + BegBal;
    FieldByName('Beginning').asFloat := BegBal;

    if FieldByName('Beginning').asFloat = 0 then
      FieldByName('Beginning').asFloat :=
        SelectValueFmtAsFloat('select gl_misc.GetBegBal(%f, %f) from dual', [TFDQuery(Dataset).FieldByName('GLYEAR_ID').asFloat, TFDQuery(Dataset).FieldByName('GLACCT_ID').asFloat]);

    PrevBal := FieldByName('Balance').asFloat;
  end;

end;

procedure TFrmActivity.QryDateNoactCalcFields(DataSet: TDataSet);
begin
  with TFDQuery(Dataset) do
  begin
    {Values to fool the QryBatchId when initializing}
//    FieldByName('nFromBatchDate').asDateTime := StrToDate(EditFromDate.Text);
//    FieldByName('nToBatchDate').asDateTime   := StrToDate(EditToDate.Text);

    FieldByName('nFromBatchDate').asDateTime := EditFromDate.DateTime;
    FieldByName('nToBatchDate').asDateTime   := EditToDate.DateTime;


    GetBeginningBalanceDateNoact( FieldByName('PERIOD_ID').asFloat,
                                  FieldByName('GLYEAR_ID').asFloat,
                                  FieldByName('GLACCT_ID').asFloat );
    FieldByName('Balance').asFloat := FieldByName('Total').asFloat + BegBal;
    FieldByName('Beginning').asFloat := BegBal;

//    if FieldByName('Beginning').asFloat = 0 then
//      FieldByName('Beginning').asFloat :=
//        SelectValueFmtAsFloat('select gl_misc.GetBegBal(%f, %f) from dual', [TFDQuery(Dataset).FieldByName('GLYEAR_ID').asFloat, TFDQuery(Dataset).FieldByName('GLACCT_ID').asFloat]);

    PrevBal := FieldByName('Balance').asFloat;
  end;

end;

procedure TFrmActivity.GetBeginningBalanceDateNoAct(nPeriodId, nYearId, nAcctId:Real);
var
  APrevYearId, APrevPeriodId:Real;
begin
  APrevPeriodId := SelectValueFmtAsFloat('select gl_misc.GetPrevYearEndPeriod_Id(%f) from dual', [nYearId]);
  AprevYearId := SelectValueFmtAsFloat('select glyear_id from glperiods where id = %f', [APrevPeriodId]);
  if SelectValueFmtAsString('select type from v_glacct where id = %f', [nAcctId]) = 'RETAINED EARNINGS' then
  begin
    BegBal := SelectValueFmtAsFloat('select year_beginning_balance from v_glacct_ybb_intrim where glacct_id = %f and glyear_id = %f', [nAcctId, nYearId]);
  end
  else
  begin
    BegBal := SelectValueFmtAsFloat('select period_end_balance from v_glacct_re where glperiods_id = %f and glacct_id = %f', [APrevPeriodId, nAcctId]);
    if (BegBal = 0) and (AprevYearId = nYearId) then
      BegBal :=  SelectValueFmtAsFloat('select gl_misc.GetBegBal(%f, %f) from dual', [nYearId, nAcctId]);

  end;

end;

procedure TFrmActivity.GetBeginningBalanceDate(nPeriodId, nYearId, nAcctId:Real);
begin

  if nPeriodId = SelectValueAsFloat(IQFormat('select min(period_id) ' +
                             'from v_glperiods_batch ' +
                             'where glyear_id = %f ' +
                             'and glacct_id = %f ' +
                             'and batch_date between To_Date(''%s'', ''MM/DD/RRRR'') and To_Date(''%s'', ''MM/DD/RRRR'')',
                             [nYearId, nAcctId,
                              FormatDateTime('mm/dd/yyyy', EditFromDate.DateTime),
                              FormatDateTime('mm/dd/yyyy', EditToDate.DateTime)]))
   then BegBal := SelectValueFmtAsFloat('select period_beginning_balance from v_glacct_re where glperiods_id = %f and glacct_id = %f', [nPeriodId, nAcctId])

{
    then BegBal := SelectValueAsFloat(IQFormat('select Sum(NVL(batch_debit, 0) - NVL(batch_credit, 0)) ' +
                                 'from v_glperiods_batch ' +
                                 'where glyear_id = %f ' +
                                 'and glacct_id = %f ' +
                                 'and batch_date < To_Date(''%s'', ''MM/DD/RRRR'') ',
                                 [nYearId,
                                  nAcctId,
                                  FormatDateTime('mm/dd/yyyy', EditFromDate.Date)])) +
                   SelectValueAsFloat(IQFormat('select (NVL(begdr, 0) - NVL(begcr, 0)) ' +
                                 'from glacct_fy ' +
                                 'where glyear_id = %f ' +
                                 'and glacct_id = %f', [nYearId, nAcctId]))

}
    else BegBal := PrevBal;
end;


procedure TFrmActivity.DrillDown1Click(Sender: TObject);
begin
  if DrillDown1.Checked
  then
    CloseDrillDown
  else
    OpenDrillDown;
end;

procedure TFrmActivity.SrcQryDataChange(Sender: TObject; Field: TField);
var
 cStartDate, cEndDate, cPeriod:string;
begin
  with TblGlPeriods do
    if not (State in [dsInactive]) then
    begin
      FindKey([SrcQry.DataSet.FieldByName('PERIOD_ID').asFloat]);
      cStartDate := DateToStr(FieldByName('START_DATE').AsDateTime);
      cEndDate   := DateToStr(FieldByName('END_DATE').AsDateTime);
    end;
  cPeriod :=  IntToStr(SrcQry.DataSet.FieldByName('PERIOD').asInteger);
  { TODO -oathite -cWebConvert : Depends on Actdrill
  if fDrillDown <> nil then
  begin
    fDrillDown.Caption := Format('Period: %s, From %s To %s', [cPeriod, cStartDate, cEndDate]);
    fDrillDown.LblAccount.Caption := 'Tr. summary for account: ' + TblGlAcct.FieldByName('ACCT').AsString;
  end;   }
end;

procedure TFrmActivity.SrcTblBatchIdDataChange(Sender: TObject;
  Field: TField);
begin
  { TODO -oathite -cWebConvert : Depends on Actdrill
  if fDrillDown <> nil then
    fDrillDown.LblBatch.Caption := 'Details for Batch#: ' + QryBatchId.FieldByName('BATCHNUMBER').AsString;  }
end;

procedure TFrmActivity.CloseDrillDown;
begin
  { TODO -oathite -cWebConvert : Depends on Actdrill
  if fDrillDown <> nil then
    fDrillDown.Close; }
//  fDrillDown := nil;
  NavMain.DataSource := SrcGlAcct;
  DrillDown1.Checked := False;
  DrillDown2.Checked := False;
end;

procedure TFrmActivity.OpenDrillDown;
begin
  { TODO -oathite -cWebConvert : Depends on Actdrill
  if DBGridPeriods.Enabled then
  begin
    fDrillDown := TFrmActDrillDown.Create(self);
    SrcQryDataChange(nil, nil);
    PrevBatchBal2 := 0;
    SrcTblBatchIdDataChange(nil, nil);
    fDrillDown.Show;
    DrillDown1.Checked := True;
    DrillDown2.Checked := True;
  end;  }
end;

procedure TFrmActivity.Reset_Button_Grid_FrmDrillDown(Sender: TObject);
begin
  NavMain.DataSource := SrcGlAcct;
  edAccount.Text := '';
  edDescrip.Text := '';
  DisableEnableGrid(False);
  BtnApply.Enabled := True;
  if DrillDown1.Checked then CloseDrillDown;
end;


procedure TFrmActivity.About1Click(Sender: TObject);
begin
 IqAbout1.Execute;
end;

procedure TFrmActivity.LookupAccount1Click(Sender: TObject);
begin
  with PkGLAcct do if Execute then
    TblGLAcct.Locate('ID', GetValue('ID'), [] );

end;

procedure TFrmActivity.RBDateClick(Sender: TObject);
begin
  Reset_Button_Grid_FrmDrillDown(nil);
  DisableEnableEdits(True);
end;

procedure TFrmActivity.RBPeriodClick(Sender: TObject);
begin
  Reset_Button_Grid_FrmDrillDown(nil);
  DisableEnableEdits(False);
end;

procedure TFrmActivity.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmActivity.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmActivity.QryBatchIdCalcFields(DataSet: TDataSet);
var
  AOrder:String;
  AOnHand:Real;
begin
  { TODO -oathite -cWebConvert : Depends on Actdrill
  with QryBatchId do
  if fDrillDown <> nil then
  begin
//    GetBeginningBalanceBatch(  FieldByName('BATCH_ID').asFloat,
//                               FieldByName('PERIOD_ID').asFloat,
//                               FieldByName('GLYEAR_ID').asFloat,
//                               FieldByName('GLACCT_ID').asFloat );


  BegBatchBal := SrcQry.DataSet.FieldByName('Beginning').AsFloat;
  FieldByName('OnHand').asFloat :=
    SelectValueFmtAsFloat('select sum(Balance) as batch_balance                                            ' +
              '  from (select glyear_id,                                                       ' +
              '              glacct_id,                                                        ' +
              '              period_id,                                                        ' +
              '              batch_id,                                                         ' +
              '              batch_date,                                                       ' +
              '              Sum(NVL(batch_credit, 0)) as Total_Credit,                        ' +
              '              Sum(NVL(batch_debit, 0)) as Total_Debit,                          ' +
              '              Sum(NVL(batch_debit, 0)) - Sum(NVL(batch_credit, 0)) as Balance   ' +
              '         from v_glperiods_batch                                                 ' +
              '       where period_id = %f                                                     ' +
              '          and glacct_id = %f                                                    ' +
              '          and glyear_id = %f                                                    ' +
              '          and batch_id <= %f                                                    ' +
              '        group by glyear_id,                                                     ' +
              '                period_id,                                                      ' +
              '                period,                                                         ' +
              '                glacct_id,                                                      ' +
              '                batch_id,                                                       ' +
              '                batch_date)                                                     ',
              [FieldByName('PERIOD_ID').asFloat,
               FieldByName('GLACCT_ID').asFloat,
               FieldByName('GLYEAR_ID').asFloat,
               FieldByName('BATCH_ID').asFloat]) + BegBatchBal;

  if PrevBatchBal2 = 0 then
  begin
    AOnHand :=
      SelectValueFmtAsFloat('select sum(Balance) as batch_balance                                            ' +
                '  from (select sum(NVL(batch_debit, 0)) - Sum(NVL(batch_credit, 0)) as Balance   ' +
                '         from v_glperiods_batch                                                 ' +
                '       where period_id = %f                                                     ' +
                '          and glacct_id = %f                                                    ' +
                '          and glyear_id = %f                                                    ' +
                '          and batch_date <= To_Date(''%s'', ''MM/DD/RRRR''))                    ',
                [FieldByName('PERIOD_ID').asFloat,
                 FieldByName('GLACCT_ID').asFloat,
                 FieldByName('GLYEAR_ID').asFloat,
                 FormatDateTime('mm/dd/yyyy', FieldByName('BATCH_DATE').asDateTime)]);

//    QryBatchId.FieldByName('RunningTotal').asFloat := AOnHand;
    QryBatchId.FieldByName('RunningTotal').asFloat := QryBatchIdBALANCE.asFloat;
  end
  else
//    QryBatchId.FieldByName('RunningTotal').asFloat := PrevBatchBal2 + QryBatchIdBALANCE.asFloat;
    QryBatchId.FieldByName('RunningTotal').asFloat :=  GetPrivBal + QryBatchIdBALANCE.asFloat;

  PrevBatchBal2 := QryBatchId.FieldByName('RunningTotal').asFloat;



//    FieldByName('OnHand').asFloat := FieldByName('BALANCE').asFloat + BegBatchBal;
    PrevBatchBal := FieldByName('OnHand').asFloat;
  end; }
end;

procedure TFrmActivity.GetBeginningBalanceBatch(nBatchId, nPeriodId, nYearId, nAcctId:Real);
begin
  if RBPeriod.Checked then
  begin
    if nBatchId = SelectValueAsFloat(IQFormat('select min(batch_id) ' +
                               'from v_glperiods_batch ' +
                               'where glyear_id = %f ' +
                               'and glacct_id = %f ' +
                               'and period_id = %f '
                               , [nYearId,
                               nAcctId,
                               nPeriodId]))
      then BegBatchBal := SrcQry.DataSet.FieldByName('Beginning').AsFloat
      else BegBatchBal := PrevBatchBal;
  end
  else
  begin
    if nBatchId = SelectValueAsFloat(IQFormat('select min(batch_id) ' +
                               'from v_glperiods_batch ' +
                               'where glyear_id = %f ' +
                               'and glacct_id = %f ' +
                               'and period_id = %f ' +
                               'and batch_date between To_Date(''%s'', ''MM/DD/RRRR'') and To_Date(''%s'', ''MM/DD/RRRR'') '
                               , [nYearId,
                               nAcctId,
                               nPeriodId,
                               FormatDateTime('mm/dd/yyyy', SrcQry.DataSet.FieldByName('nFromBatchDate').AsDateTime),
                               FormatDateTime('mm/dd/yyyy', SrcQry.DataSet.FieldByName('nToBatchDate').AsDateTime)]))
      then BegBatchBal := SrcQry.DataSet.FieldByName('Beginning').AsFloat
      else BegBatchBal := PrevBatchBal;
  end;

end;


procedure TFrmActivity.ShowCriteria1Click(Sender: TObject);
begin
  ShowCriteria1.Checked:= not ShowCriteria1.Checked;
  ShowCriteria2.Checked:= ShowCriteria1.Checked;
//  GroupBox1.Visible    := ShowCriteria1.Checked;
end;

procedure TFrmActivity.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  EnsureSecurityInspectorOnTopOf( self ); }
end;

procedure TFrmActivity.Contents1Click(Sender: TObject);
begin
//  Application.HelpContext(50);
  IQHelp.HelpContext( 1041913 );
end;

procedure TFrmActivity.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmActivity.DBLookupComboBoxGlYearCloseUp(Sender: TObject);
begin
  TblGlAcct.Refresh;
end;

procedure TFrmActivity.TblGlAcctAfterScroll(DataSet: TDataSet);
begin
//  DisableEnableGrid(False);
  BtnApply.Enabled := True;
end;

procedure TFrmActivity.DBGridAccountsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if BtnApply.Enabled and (Key = VK_RETURN) then BtnApplyClick(nil);
end;

procedure TFrmActivity.QryPeriodBeforeOpen(DataSet: TDataSet);
begin
  HMsg:= hPleaseWait( 'Opening Query, please wait...' );
end;

procedure TFrmActivity.QryPeriodAfterOpen(DataSet: TDataSet);
begin
  HMsg.Free;
end;

procedure TFrmActivity.Show1Click(Sender: TObject);
begin
//  IQTiming1.Display;
end;

procedure TFrmActivity.Clear1Click(Sender: TObject);
begin
//  IQTiming1.Clear;
end;

procedure TFrmActivity.CalculateYearbeginningbalance1Click(
  Sender: TObject);
var
  AYbb, AId:Real;
begin
  try
    HMsg:= hPleaseWait( 'Calculating...' );
    AID := DBLookUpComboBoxGlYear.KeyValue;
    AYbb :=  SelectValueFmtAsFloat('select ytd_beginning from v_glacct_all_ybb where glyear_id = %f and glacct_id = %f',
           [AID, TblGlAcct.FieldByName('ID').asFloat]);
  finally
    HMsg.Free;
  end;
    IqConfirm(Format('YBB: %m', [AYbb]));
end;

procedure TFrmActivity.TblGlAcctBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmActivity.PkGLAcctBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmActivity.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmActivity.BudgetInfo1Click(Sender: TObject);
begin
    ShowBudgetInfo(DBGridPeriods.DataSource.DataSet.FieldByName('PERIOD_ID').asFloat,
                   DBGridPeriods.DataSource.DataSet.FieldByName('GLYEAR_ID').asFloat,
                   DBGridPeriods.DataSource.DataSet.FieldByName('GLACCT_ID').asFloat);    {in glbudinf.pas}
end;

function TFrmActivity.GetPrivBal:Real;
var
  aQry:TFDQuery;
  aOrderBy:String;
  I:integer;
begin
  I:= Pos( 'ORDER BY ', UpperCase( QryBatchId.SQL.Text ));
  if I > 0 then
    aOrderBy := Copy( UpperCase( QryBatchId.SQL.Text ), I + 9, Length(UpperCase( QryBatchId.SQL.Text )));

  aOrderBy := Trim(aOrderBy);
  aOrderBy := StrTran(StrTran(aOrderBy, #13, ' '), #10, ' ');

  aQry := TFDQuery.Create(nil);
  try
    aQry.Connection := UniMainModule.FDConnection1;

    aQry.Sql.Add(IqFormat('select glyear_id,       ' +
                          '       glacct_id,       ' +
                          '       period_id,       ' +
                          '       batch_id,        ' +
                          '       batch_date,      ' +
                          '       userid,          ' +
                          '       batchnumber,     ' +
                          '       source,          ' +
                          '       Sum(NVL(batch_credit, 0)) as Total_Credit,   ' +
                          '       Sum(NVL(batch_debit, 0)) as Total_Debit,     ' +
                          '       Sum(NVL(batch_debit, 0)) - Sum(NVL(batch_credit, 0)) as Balance ' +
                          '  from v_glperiods_batch                                               ' +
                          'where period_id = %f                                           ' +
                          '   and glacct_id = %f                                          ' +
                          '   and glyear_id = %f                                          ' +
                          '   and batch_date between To_Date(''%s'', ''MM/DD/RRRR'') and To_Date(''%s'', ''MM/DD/RRRR'')            ' +
                          ' group by glyear_id,                                                   ' +
                          '         period_id,                                                    ' +
                          '         period,                                                       ' +
                          '         glacct_id,                                                    ' +
                          '         batch_id,                                                     ' +
                          '         batch_date,                                                   ' +
                          '         userid,                                                       ' +
                          '         batchnumber,                                                  ' +
                          '         source                                                        ',
                          [QryBatchId.FieldByName('PERIOD_ID').asFloat,
                           QryBatchId.FieldByName('GLACCT_ID').asFloat,
                           QryBatchId.FieldByName('GLYEAR_ID').asFloat,
                           FormatDateTime('mm/dd/yyyy', QryBatchId.DataSource.DataSet.FieldByName('nFromBatchDate').asDateTime),
                           FormatDateTime('mm/dd/yyyy', QryBatchId.DataSource.DataSet.FieldByName('nToBatchDate').asDateTime)]));
    if Trim(aOrderBy) <> '' then
      aQry.Sql.Add(' Order by ' + aOrderBy);

    aQry.Open;
    Result := 0;
    while not aQry.Eof do
    begin
      if    (aQry.FieldByName('batch_id').asFloat = QryBatchIdBATCH_ID.asFloat)
        and (aQry.FieldByName('batch_date').asDateTime = QryBatchIdbatch_date.asDateTime)
        and (aQry.FieldByName('userid').asString = QryBatchIduserid.asString)
        and (aQry.FieldByName('source').asString = QryBatchIdsource.asString)
        and (aQry.FieldByName('Total_Credit').asFloat = QryBatchIdTotal_Credit.asFloat)
        and (aQry.FieldByName('Total_Debit').asFloat = QryBatchIdTotal_Debit.asFloat) then
        exit;
      Result := Result + aQry.FieldByName('balance').asFloat;
      aQry.Next;
    end;
  finally
    aQry.Free;
  end;
end;

procedure TFrmActivity.QryBatchBeforeOpen(DataSet: TDataSet);
begin
  QryBatch.ParamByName('aBATCH_ID').Value := QryBatchIdBATCH_ID.asFloat;
  QryBatch.ParamByName('aGLACCT_ID').Value := QryBatchIdGLACCT_ID.asFloat;
end;

procedure TFrmActivity.QryBatchIdAfterScroll(DataSet: TDataSet);
begin
  QryBatch.Close;
  QryBatch.Open;
end;

end.
