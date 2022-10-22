unit GLReval;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Wwdbigrd,
  IQMS.WebVcl.Hpick,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniDBEdit,
  uniCheckBox,
  uniPanel,
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
  uniLabel, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TSGCargo = class
    ID:Real;
    OldRate:Real;
    NewRate:Real;
    constructor Create( AID, AOldRate, ANewRate:Real );
end;


type
  TFrmAcctReval = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnCancel: TUniButton;
    btnPost: TUniButton;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    navAcct: TUniDBNavigator;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    gridAcct: TIQUniGridControl;
    SrcAcct: TDataSource;
    QryAcct: TFDQuery;
    dbFX: TUniDBLookupComboBox;
    dbOffSet: TUniDBLookupComboBox;
    tblGLAcctFx: TFDTable;
    tblGLAcctOffset: TFDTable;
    tblGLAcctFxID: TBCDField;
    tblGLAcctFxACCT: TStringField;
    tblGLAcctFxDESCRIP: TStringField;
    tblGLAcctFxTYPE: TStringField;
    tblGLAcctFxGL_SUBACCT_TYPE_ID: TBCDField;
    tblGLAcctFxECODE: TStringField;
    tblGLAcctFxEID: TBCDField;
    tblGLAcctFxEDATE_TIME: TDateTimeField;
    tblGLAcctFxECOPY: TStringField;
    tblGLAcctFxOLD_SPOT_RATE: TFMTBCDField;
    tblGLAcctFxNEW_SPOT_RATE: TFMTBCDField;
    tblGLAcctFxFX_ACCT_ID: TBCDField;
    tblGLAcctFxFX_OFFSET_ACCT_ID: TBCDField;
    tblGLAcctOffsetID: TBCDField;
    tblGLAcctOffsetACCT: TStringField;
    tblGLAcctOffsetDESCRIP: TStringField;
    tblGLAcctOffsetTYPE: TStringField;
    tblGLAcctOffsetGL_SUBACCT_TYPE_ID: TBCDField;
    tblGLAcctOffsetECODE: TStringField;
    tblGLAcctOffsetEID: TBCDField;
    tblGLAcctOffsetEDATE_TIME: TDateTimeField;
    tblGLAcctOffsetECOPY: TStringField;
    tblGLAcctOffsetOLD_SPOT_RATE: TFMTBCDField;
    tblGLAcctOffsetNEW_SPOT_RATE: TFMTBCDField;
    tblGLAcctOffsetFX_ACCT_ID: TBCDField;
    tblGLAcctOffsetFX_OFFSET_ACCT_ID: TBCDField;
    QryAcctID: TBCDField;
    QryAcctACCT: TStringField;
    QryAcctFX_ACCT_ID: TBCDField;
    QryAcctFX_OFFSET_ACCT_ID: TBCDField;
    QryAcctFX_Acct: TStringField;
    QryAcctFX_offset_Acct: TStringField;
    tblGlAcctFx2: TFDTable;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TBCDField;
    StringField5: TStringField;
    FloatField3: TBCDField;
    DateTimeField1: TDateTimeField;
    StringField6: TStringField;
    FloatField4: TFMTBCDField;
    FloatField5: TFMTBCDField;
    FloatField6: TBCDField;
    FloatField7: TBCDField;
    QryAcctYTD_BAL: TFMTBCDField;
    PKCurrency: TIQWebHPick;
    sbCurr: TUniSpeedButton;
    PKCurrencyID: TBCDField;
    PKCurrencyCURR_CODE: TStringField;
    PKCurrencyDESCRIP: TStringField;
    PKCurrencySPOT_RATE: TFMTBCDField;
    PKCurrencyGLVALUE: TStringField;
    N1: TUniMenuItem;
    Prepare1: TUniMenuItem;
    Post1: TUniMenuItem;
    N2: TUniMenuItem;
    ChangeCurrency1: TUniMenuItem;
    QryPeriod: TFDQuery;
    SrcPeriod: TDataSource;
    N3: TUniMenuItem;
    EditOldRate1: TUniMenuItem;
    tblGLAcctOffsetMAJORTYPE: TStringField;
    tblGLAcctFxMAJORTYPE: TStringField;
    tblGlAcctFx2MAJORTYPE: TStringField;
    Options1: TUniMenuItem;
    SettleTransactionsatHistoricalExchangeRate1: TUniMenuItem;
    Contents1: TUniMenuItem;
    QryAcctFX_GAIN_ACCT_ID: TBCDField;
    tblGLAcctGain: TFDTable;
    FloatField8: TBCDField;
    StringField4: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField9: TBCDField;
    StringField9: TStringField;
    FloatField10: TBCDField;
    DateTimeField2: TDateTimeField;
    StringField10: TStringField;
    FloatField11: TFMTBCDField;
    FloatField12: TFMTBCDField;
    FloatField13: TBCDField;
    FloatField14: TBCDField;
    StringField11: TStringField;
    QryAcctFx_Gain_Acct: TStringField;
    dbGain: TUniDBLookupComboBox;
    QryGlAcctFX: TFDQuery;
    QryGlAcctFXACCT: TStringField;
    QryGlAcctFXDESCRIP: TStringField;
    QryGlAcctFXID: TBCDField;
    QryGlAcctOffset: TFDQuery;
    QryGlAcctOffsetACCT: TStringField;
    QryGlAcctOffsetDESCRIP: TStringField;
    QryGlAcctOffsetID: TBCDField;
    QryGlAcctGain: TFDQuery;
    QryGlAcctGainACCT: TStringField;
    QryGlAcctGainDESCRIP: TStringField;
    QryGlAcctGainID: TBCDField;
    QryGlAcctFXEPLANT_ID: TBCDField;
    QryGlAcctOffsetEPLANT_ID: TBCDField;
    QryGlAcctGainEPLANT_ID: TBCDField;
    PKAcctEPLANT_ID: TBCDField;
    QryAcctOLDRATE: TFMTBCDField;
    QryAcctNEWRATE: TFMTBCDField;
    SR: TIQWebSecurityRegister;
    PKCurrencyNATIVE_CURR: TStringField;
    QryAcctMAJORTYPE: TStringField;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label9: TUniLabel;
    DBEditPeriod: TUniDBEdit;
    SBPeriod: TUniSpeedButton;
    CbReval: TUniCheckBox;
    btnPrepare: TUniBitBtn;
    IQSearch1: TIQUniGridControl;
    SrcGTT: TDataSource;
    QryGTT: TFDQuery;
    QryGTTID: TBCDField;
    QryGTTBATCH_ID: TBCDField;
    QryGTTGLACCT_ID: TBCDField;
    QryGTTDEBIT: TBCDField;
    QryGTTCREDIT: TBCDField;
    QryGTTOLD_RATE: TFMTBCDField;
    QryGTTLAST_REVALUE_RATE: TFMTBCDField;
    QryGTTORIG_INVOICE_RATE: TFMTBCDField;
    QryGTTAPINVOICE_ID: TBCDField;
    QryGTTARINVOICE_ID: TBCDField;
    QryGTTACCT: TStringField;
    QryGTTACCT_DESCRIP: TStringField;
    QryGTTAR_INVOICE_NO: TStringField;
    QryGTTAP_INVOICE_NO: TStringField;
    QryGTTINVOICE_NO: TStringField;
    QryGTTNEW_RATE: TFMTBCDField;
    PopupMenu1: TUniPopupMenu;
    JumptoARInvoice1: TUniMenuItem;
    JumptoAPInvoice1: TUniMenuItem;
    QryAcctACCT_DESCRIP: TStringField;
    QryAcctFX_ACCT_DESCRIP: TStringField;
    QryAcctLOSS_ACCT_DESCRIP: TStringField;
    QryAcctGAIN_ACCT_DESCRIP: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryAcctAfterInsert(DataSet: TDataSet);
    procedure QryAcctBeforePost(DataSet: TDataSet);
    procedure QryAcctUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryAcctAfterPost(DataSet: TDataSet);
    procedure QryAcctOldRateChange(Sender: TField);
    procedure sbCurrClick(Sender: TObject);
    procedure QryAcctBeforeDelete(DataSet: TDataSet);
    procedure DoPrepare(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure SBPeriodClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure SrcAcctStateChange(Sender: TObject);
    procedure EditOldRate1Click(Sender: TObject);
    procedure tblGLAcctFxFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure QryAcctBeforeScroll(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure SettleTransactionsatHistoricalExchangeRate1Click(
      Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure dbFXCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CbRevalClick(Sender: TObject);
    procedure QryGTTBeforeOpen(DataSet: TDataSet);
    procedure QryGTTAfterOpen(DataSet: TDataSet);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure JumptoARInvoice1Click(Sender: TObject);
    procedure JumptoAPInvoice1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOldRate:Real;
    FNewRate:Real;
    FModOldRate:Real;
    FModNewRate:Real;
    FStart:Integer;
    FLength:Integer;
    FSql:String;
    FPKSql:String;
    FPlug:String;
//    FGLPeriodHint:TNotifyEvent;
    FGLBatchDate:TDateTime;
    FGLBatchId_Id:Real;
    FCurrency:String;
    FCurrency_id:Real;
    FCurrCode:String;
    FCallUpdate:Boolean;
    FBatchId:Real;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;
                            var HintInfo: THintInfo );

//    procedure DisplayHint(Sender: TObject);
    procedure UpdateGLAcct( DataSet: TDataSet );
    procedure DeleteGLAcct;
    procedure ResetQry;
    procedure GetPlugValues;
    procedure CheckForExistingRecord(AID:Real);
    procedure ClearSG;
    procedure AssignSGValues;
    procedure AssignPeriod;
    procedure PostAccounts;
    procedure AssignExchangeRates;
    function  GetNumber(AStr:String):Real;
    procedure PopulateAPAR;
    procedure ProcessBasedOnTranLevelDetail;
    procedure PrintAfterPostReport(AGLBatchId_Id:Real);
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
    procedure UpdateFooter(Sender: TObject);
  public
    { Public declarations }
  end;

procedure DoAccuntRevaluation;

implementation
{$R *.DFM}
uses
  { TODO -oathite -cWebConvert : Depend on apview
  apview, }
  gl_rscstr,
  IQMS.Common.Period,
  IQMS.Common.AccountingShare,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.InputQuery,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils;
  { TODO -oathite -cWebConvert : Depend on iview
  iview; }

procedure DoAccuntRevaluation;
begin
  TFrmAcctReval.Create(UniApplication).Show;
end;

constructor TSGCargo.Create( AID, AOldRate, ANewRate:Real );
begin
  ID:= AID;
  OldRate:=AOldRate;
  NewRate:=ANewRate;
end;

procedure TFrmAcctReval.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAcctReval.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    ClearSG;
    IQRegFormWrite( self, [self, gridAcct, Panel1]);
  finally
    Action := caFree;
//    Application.OnHint := FGLPeriodHint;
    Application.OnShowHint:= NIL;
  end;
end;

procedure TFrmAcctReval.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
    if HintControl = DBEditPeriod then with QryPeriod do
      HintStr := Format('Start Date: %s End Date: %s',
                       [FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
                        FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
end;


//procedure TFrmAcctReval.DisplayHint(Sender: TObject);
//begin
//  with QryPeriod do
//  DBEditPeriod.Hint := Format('Start Date: %s End Date: %s',
//                       [FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
//                        FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
//end;


procedure TFrmAcctReval.QryAcctAfterInsert(DataSet: TDataSet);
var
  AID:Real;
begin
  try
    QryAcct.FieldByName('ACCT').Readonly := False;
    with PkAcct do
    begin
      if Trim(FPKSql) <> '' then
      begin
        Sql.Clear;
        Sql.Add(Format(FPKSql + ' and substr(acct, %d, %d) = ''%s''', [FStart, FLength, FPlug]));
      end;
      if Execute then
      begin
        AID := GetValue('ID');
        CheckForExistingRecord(AID);
        if not(QryAcct.State in [dsEdit, dsInsert]) then QryAcct.Edit;
        QryAcct.FieldByName('ID').asFloat := AID;
        QryAcct.FieldByName('ACCT').asString := GetValue('ACCT');
      end
      else QryAcct.CheckBrowseMode;
    end;
  finally
    QryAcct.FieldByName('ACCT').Readonly := True;
  end;
end;

procedure TFrmAcctReval.CheckForExistingRecord(AID:Real);
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(QryAcct.Sql.Text);
    ParamByName('aDate').DataType := ftDateTime;
    ParamByName('aDate').Value := QryPeriod.FieldByName('end_date').asDateTime;
    Open;
    if Locate('ID', AID, []) then
    begin
      QryAcct.CheckBrowseMode;
      raise Exception.Create(Format('Account %s already assigned', [FieldByName('ACCT').asString]));
    end;
  finally
    Free;
  end;
end;


procedure TFrmAcctReval.QryAcctBeforePost(DataSet: TDataSet);
var
  AFxAcct:String;
begin
  with QryAcct do
  begin
    if FieldByName('fx_acct_id').asFloat = 0 then
      raise Exception.Create('FX Account cannot be blank');
    if (FieldByName('fx_offset_acct_id').asFloat = 0) then
      raise Exception.Create('Loss Account must have a value');
    if FieldByName('newrate').asFloat = 0 then
      raise Exception.Create('New Rate cannot be blank');
    if not CbReval.checked then
      if FieldByName('oldrate').asFloat = 0 then
        raise Exception.Create('Old Rate cannot be blank');

    AFxAcct := SelectValueFmtAsString('select acct from glacct where id = %f', [QryAcctFX_ACCT_ID.asFloat]);


//    if Copy(FieldByName('FX_Acct').asString, FStart, FLength) <> FPlug then
    if Copy(AFxAcct, FStart, FLength) <> FPlug then
      raise Exception.Create('Base Account and FX Account are of different currencies');

    FOldRate := FieldByName('oldrate').asFloat;
    FNewRate := FieldByName('newrate').asFloat;


    if FieldByName('fx_gain_acct_id').asFloat = 0 then
     FieldByName('fx_gain_acct_id').asFloat := FieldByName('fx_offset_acct_id').asFloat;

  end;
end;

procedure TFrmAcctReval.PopulateAPAR;
begin

//    Sql.Text := StrTran(Sql.Text, ':ADate', Format('To_Date(''%s'', ''MM/DD/RRRR'')', [FormatDateTime('mm/dd/yyyy', QryPeriod.FieldByName('end_date').asDateTime)])  );



  ExecuteCommandFmt('begin ' +
            '  for v in (select arinvoice_id from v_cashrec_detail_arinvoice v, glperiods p, currency c ' +
            ' where Trunc(left_to_apply * 100) <> 0 and currency_id = c.id and c.curr_code = ''%s''  ' +
            ' and v.glacct_id_ar = %f ' +
            ' and v.glperiods_id_ar = p.id and p.end_date <= To_Date(''%s'', ''MM/DD/RRRR'') ) ' +
            '  loop ' +
            '    update arinvoice set fx_revalue_rate = %.6f where id = v.arinvoice_id; ' +
            '    commit; ' +
            '  end loop; ' +
            'end;', [FCurrCode,
                     QryAcctID.asFloat,
                     FormatDateTime('mm/dd/yyyy', QryPeriod.FieldByName('end_date').asDateTime),
                     QryAcctNewRate.asFloat]);



  ExecuteCommandFmt('begin ' +
            '  for v in (select v.id from V_APINVOICE_CHEQUE v, apinvoice a, glperiods p, currency c ' +
            ' where Trunc(v.amount_to_pay * 100) <> 0 and v.currency_id = c.id and c.curr_code = ''%s'' ' +
            ' and v.glacct_id_ap = %f ' +
            ' and a.id = v.id and a.glperiods_id_ap = p.id ' +
            ' and p.end_date <= To_Date(''%s'', ''MM/DD/RRRR'') ) ' +
            '  loop ' +
            '    update apinvoice set fx_revalue_rate = %.6f where id = v.id; ' +
            '    commit; ' +
            '  end loop; ' +
            'end;',
            [FCurrCode,
             QryAcctID.asFloat,
             FormatDateTime('mm/dd/yyyy', QryPeriod.FieldByName('end_date').asDateTime),
             QryAcctNewRate.asFloat]);

end;

procedure TFrmAcctReval.QryAcctUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  with ASender do
    case ARequest of
      arUpdate: UpdateGLAcct( ASender );
      arInsert: UpdateGLAcct( ASender );
      //ukDelete: DeleteGLAcct;
    end;
  AAction := eaApplied;
end;

procedure TFrmAcctReval.UpdateGLAcct( DataSet: TDataSet );
begin
  with DataSet do
  begin
    ExecuteCommandFmt('update glacct set fx_acct_id = %f, ' +
                               'fx_offset_acct_id = %f, ' +
                               'fx_gain_acct_id = %f ' +
                               'where id = %f',
                               [DataSet.FieldByName('fx_acct_id').asFloat,
                                DataSet.FieldByName('fx_offset_acct_id').asFloat,
                                DataSet.FieldByName('fx_gain_acct_id').asFloat,
                                DataSet.FieldByName('id').asFloat]);

    ExecuteCommandFmt('update glacct set new_spot_rate = %.6f, ' +
                               'old_spot_rate = %.6f ' +
                               'where id = %f',
                               [QryAcctNEWRATE.asFloat,
                                QryAcctOLDRATE.asFloat,
                                DataSet.FieldByName('fx_acct_id').asFloat]);


//    ExecuteCommandFmt('update glacct set new_spot_rate = %s, ' +
//                               'old_spot_rate = %s ' +
//                               'where id = %f',
//                               [FloatToStr(FNewRate),
//                                FloatToStr(FOldRate),
//                                FieldByName('fx_acct_id').asFloat]);

    //RunSql('update glacct set new_spot_rate = 1.712345, ' +
    //                           'old_spot_rate = 1.23 ' +
    //                           'where id = 20');


  end;
end;

procedure TFrmAcctReval.QryAcctBeforeDelete(DataSet: TDataSet);
begin
  with QryAcct do
    ExecuteCommandFmt('update glacct set fx_acct_id = '''', ' +
                               'fx_offset_acct_id = '''', ' +
                               'fx_gain_acct_id = '''' ' +
                               'where id = %f',
                               [FieldByName('id').asFloat]);
end;



procedure TFrmAcctReval.DeleteGLAcct;
begin
//  with QryAcct do
//    ExecuteCommandFmt('update glacct set fx_acct_id = '''', ' +
//                               'fx_offset_acct_id = '''' ' +
//                               'where id = %f',
//                               [FieldByName('id').asFloat]);
end;


procedure TFrmAcctReval.QryAcctAfterPost(DataSet: TDataSet);
var
  AId:Real;
  ABeforeScroll:TDataSetNotifyEvent;
begin
  try
//    ABeforeScroll := QryAcct.BeforeScroll;
//    QryAcct.BeforeScroll := nil;
    try
      QryAcct.connection.ApplyUpdates([ QryAcct ]);
//      QryAcct.Database.ApplyUpdates([ QryAcct ]);
//      AId := QryAcct.FieldByName('ID').asFloat;
//      tblGlAcctFx2.Refresh;
//      gridAcct.Unselectall;
//      QryAcct.Close;
//      QryAcct.Open;
//      QryAcct.Locate('ID', AID, []);
//      gridAcct.SelectRecord;
    except on E:Exception do
      begin
        Application.ShowException(E);
        QryAcct.Close;
        QryAcct.Open;
        System.SysUtils.ABORT;

//        CancelUpdates;
      end;
    end;
  finally
    FCallUpdate := False;
//    QryAcct.BeforeScroll := ABeforeScroll;
  end;

end;

procedure TFrmAcctReval.QryAcctOldRateChange(Sender: TField);
begin
//  FCallUpdate := True;
//  FModOldRate := QryAcct.FieldByName('OldRate').asFloat;
//  FModNewRate := QryAcct.FieldByName('NewRate').asFloat;
end;

procedure TFrmAcctReval.sbCurrClick(Sender: TObject);
begin
  with PkCurrency do
  begin
    if Execute then
    begin
      FPlug := GetValue('GLVALUE');
      ResetQry;
      FCurrency := Trim(GetValue('DESCRIP'));
      FCurrency_Id := GetValue('ID');
      FCurrCode    := SelectValueFmtAsString('select curr_code from currency where id = %f', [FCurrency_Id]);
      self.Caption := Format('Account Revaluation (Currency: %s)', [FCurrency]);
    end
    else Abort;
  end;
end;

procedure TFrmAcctReval.ResetQry;
begin
  with QryAcct do
  begin
    Close;
    Sql.Clear;
    Sql.Add(Format(FSql + ' and substr(g.acct, %d, %d) = ''%s'' ', [FStart, FLength, FPlug]));
//    Sql.Text := StrTran(Sql.Text, ':ADate', Format('To_Date(''%s'', ''MM/DD/RRRR'')', [FormatDateTime('mm/dd/yyyy', QryPeriod.FieldByName('end_date').asDateTime)])  );
    ParamByName('aDate').Value := QryPeriod.FieldByName('end_date').asDateTime;
    Open;
  end;
end;

procedure TFrmAcctReval.GetPlugValues;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add('select group_start, group_length from glacct_def where group_name = (select FX_SEGMENT_NAME from iqsys)');
    Open;
    FStart  := FieldByName('group_start').asInteger;
    FLength := FieldByName('group_length').asInteger;
  finally
    Free;
  end;
end;

procedure TFrmAcctReval.DoPrepare(Sender: TObject);
begin
  QryAcct.CheckBrowseMode;
  if QryAcct.eof and QryAcct.bof then
    raise Exception.Create('Nothing to prepare');
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedList'
  if GridAcct.SelectedList.Count = 0 then
    raise Exception.Create('Nothing selected, cannot prepare');        }
  AssignSGValues;
  Prepare1.Enabled := False;
  btnPrepare.Enabled   := False;
  sbCurr.Enabled   := False;
//  ChangeCurrency1.Enabled := False;
  Post1.Enabled    := True;
  btnPost.Enabled  := True;
end;

procedure TFrmAcctReval.btnCancelClick(Sender: TObject);
begin
  ClearSG;
//  ChangeCurrency1.Enabled := True;
  sbCurr.Enabled   := True;
  Prepare1.Enabled := True;
  btnPrepare.Enabled   := True;
  Post1.Enabled    := False;
  btnPost.Enabled  := False;
end;

procedure TFrmAcctReval.ClearSG;
var
  i:Integer;
begin
  ExecuteCommandFmt('delete from GTT_GL_REVALUE where batch_id = %f', [FBatchId]);
  QryGTT.Close;
  QryGTT.Open;
end;

procedure TFrmAcctReval.AssignSGValues;
var
  Amount:Real;
  i:integer;
begin
  ClearSG;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedList',  'SelectedList.item' }
  (*
  with gridAcct,gridAcct.datasource.dataset do
    for i:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[i]);
      if cbReval.checked then
        ProcessBasedOnTranLevelDetail
      else
      begin
        Amount := (FieldByName('NewRate').asFloat - FieldByName('OldRate').asFloat) * FieldByName('YTD_BAL').asFloat;
        if not ((QryAcctMAJORTYPE.asString = 'ASSET') or (QryAcctMAJORTYPE.asString = 'EXPENSE')  or (QryAcctMAJORTYPE.asString = 'LIABILITY')) then
//        if not ((QryAcctMAJORTYPE.asString = 'ASSET') or (QryAcctMAJORTYPE.asString = 'EXPENSE')) then
          Amount := Amount * (-1);
        if Amount <> 0 then
        begin
           ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                                '   glacct_id,             ' +
                                                '   debit,                 ' +
                                                '   credit,                ' +
                                                '   old_rate,              ' +
                                                '   new_rate)              ' +
                                        ' select %f,       ' +
                                        '        %f,       ' +
                                        '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                        '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                        '        %.6f,                             ' +
                                        '        %.6f                              ' +
                                        '  from dual',
                                        [FBatchId,
                                         FieldByName('fx_acct_id').asFloat,
                                         Amount, Amount,
                                         Amount, Amount,
                                         FieldByName('oldrate').asFloat,
                                         FieldByName('newrate').asFloat]);
          if Amount > 0 then
            ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                                 '   glacct_id,             ' +
                                                 '   debit,                 ' +
                                                 '   credit,                ' +
                                                 '   old_rate,              ' +
                                                 '   new_rate)              ' +
                                         ' select %f,       ' +
                                         '        %f,       ' +
                                         '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                         '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                         '        %.6f,                             ' +
                                         '        %.6f                              ' +
                                         '  from dual',
                                         [FBatchId,
                                          FieldByName('fx_gain_acct_id').asFloat,
                                          Amount, Amount,
                                          Amount, Amount,
                                          FieldByName('oldrate').asFloat,
                                          FieldByName('newrate').asFloat])
          else
            ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                                 '   glacct_id,             ' +
                                                 '   debit,                 ' +
                                                 '   credit,                ' +
                                                 '   old_rate,              ' +
                                                 '   new_rate)              ' +
                                         ' select %f,       ' +
                                         '        %f,       ' +
                                         '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                         '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                         '        %.6f,                             ' +
                                         '        %.6f                              ' +
                                         '  from dual',
                                         [FBatchId,
                                          FieldByName('fx_offset_acct_id').asFloat,
                                          Amount, Amount,
                                          Amount, Amount,
                                          FieldByName('oldrate').asFloat,
                                          FieldByName('newrate').asFloat]);
        end;
      end;
    end;   *)
  QryGTT.Close;
  QryGTT.Open;
end;


procedure TFrmAcctReval.ProcessBasedOnTranLevelDetail;
var
  AQry:TFDQuery;
  AOldRate:Real;
//  AOldRate2:Real;
  Amount:Real;
  Alast_revalue_rate, Aorig_invoice_rate:Real;
  ANewRate:Real;
begin
  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select arinvoice_id as id, left_to_apply from v_cashrec_detail_arinvoice v, glperiods p, currency c  ' +
                     ' where Trunc(left_to_apply * 100) <> 0 and currency_id = c.id and c.curr_code = ''%s''  ' +
                     ' and v.glacct_id_ar = %f ' +
                     ' and v.glperiods_id_ar = p.id and p.end_date <= To_Date(''%s'', ''MM/DD/RRRR'')',
                    [FCurrCode,
                     QryAcctID.asFloat,
                     FormatDateTime('mm/dd/yyyy', QryPeriod.FieldByName('end_date').asDateTime)]));
     Open;
     while not eof do
     begin
       AOldRate := SelectValueFmtAsFloat('select NVL(fx_revalue_rate, fx_rate) from arinvoice where id = %f', [FieldByName('id').asFloat]);

       Amount := (QryAcctNewRate.asFloat - AOldRate) * FieldByName('left_to_apply').asFloat;
       if not ((QryAcctMAJORTYPE.asString = 'ASSET') or (QryAcctMAJORTYPE.asString = 'EXPENSE')) then
         Amount := Amount * (-1);
//       AOldRate2 := QryAcctOLDRATE.asFloat;
       ANewRate  := QryAcctNEWRATE.asFloat;

       if Amount <> 0 then
       begin
         ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                              '   glacct_id,             ' +
                                              '   debit,                 ' +
                                              '   credit,                ' +
                                              '   old_rate,              ' +
                                              '   new_rate,              ' +
                                              '   last_revalue_rate,     ' +
                                              '   orig_invoice_rate,     ' +
                                              '   arinvoice_id)          ' +
                                      ' select %f,       ' +
                                      '        %f,       ' +
                                      '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                      '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                      '        %.6f,                             ' +
                                      '        %.6f,                             ' +
                                      '        FX_REVALUE_RATE,                  ' +
                                      '        FX_RATE,                          ' +
                                      '        id                                ' +
                                      '  from arinvoice where id = %f',
                                      [FBatchId,
                                       QryAcctfx_acct_id.asFloat,
                                       Amount, Amount,
                                       Amount, Amount,
                                       AOldRate,
                                       ANewRate,
                                       FieldByName('id').asFloat]);

         if Amount > 0 then
           ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                                '   glacct_id,             ' +
                                                '   debit,                 ' +
                                                '   credit,                ' +
                                                '   old_rate,              ' +
                                                '   new_rate,              ' +
                                                '   last_revalue_rate,     ' +
                                                '   orig_invoice_rate,     ' +
                                                '   arinvoice_id)          ' +
                                        ' select %f,       ' +
                                        '        %f,       ' +
                                        '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                        '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                        '        %.6f,                             ' +
                                        '        %.6f,                             ' +
                                        '        FX_REVALUE_RATE,                  ' +
                                        '        FX_RATE,                          ' +
                                        '        id                                ' +
                                        '  from arinvoice where id = %f',
                                        [FBatchId,
                                         QryAcctfx_gain_acct_id.asFloat,
                                         Amount, Amount,
                                         Amount, Amount,
                                         AOldRate,
                                         ANewRate,
                                         FieldByName('id').asFloat])
        else
           ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                                '   glacct_id,             ' +
                                                '   debit,                 ' +
                                                '   credit,                ' +
                                                '   old_rate,              ' +
                                                '   new_rate,              ' +
                                                '   last_revalue_rate,     ' +
                                                '   orig_invoice_rate,     ' +
                                                '   arinvoice_id)          ' +
                                        ' select %f,       ' +
                                        '        %f,       ' +
                                        '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                        '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                        '        %.6f,                             ' +
                                        '        %.6f,                             ' +
                                        '        FX_REVALUE_RATE,                  ' +
                                        '        FX_RATE,                          ' +
                                        '        id                                ' +
                                        '  from arinvoice where id = %f',
                                        [FBatchId,
                                         QryAcctfx_offset_acct_id.asFloat,
                                         Amount, Amount,
                                         Amount, Amount,
                                         AOldRate,
                                         ANewRate,
                                         FieldByName('id').asFloat]);

       end;


       Next;
     end;
  finally
    free;
  end;

  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select v.id, amount_to_pay as left_to_apply from V_APINVOICE_CHEQUE v, apinvoice a, glperiods p, currency c ' +
                     ' where Trunc(v.amount_to_pay * 100) <> 0 and v.currency_id = c.id and c.curr_code = ''%s'' ' +
                     ' and v.glacct_id_ap = %f ' +
                     ' and a.id = v.id and a.glperiods_id_ap = p.id ' +
                     ' and p.end_date <= To_Date(''%s'', ''MM/DD/RRRR'') ',
                    [FCurrCode,
                     QryAcctID.asFloat,
                     FormatDateTime('mm/dd/yyyy', QryPeriod.FieldByName('end_date').asDateTime)]));
     Open;
     while not eof do
     begin
       AOldRate := SelectValueFmtAsFloat('select NVL(fx_revalue_rate, fx_rate) from apinvoice where id = %f', [FieldByName('id').asFloat]);

       Amount := (QryAcctNewRate.asFloat - AOldRate) * FieldByName('left_to_apply').asFloat;
       if not ((QryAcctMAJORTYPE.asString = 'ASSET') or (QryAcctMAJORTYPE.asString = 'EXPENSE')) then
         Amount := Amount * (-1);

//       AOldRate2 := QryAcctOLDRATE.asFloat;
       ANewRate  := QryAcctNEWRATE.asFloat;
       if Amount <> 0 then
       begin
         ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                              '   glacct_id,             ' +
                                              '   debit,                 ' +
                                              '   credit,                ' +
                                              '   old_rate,              ' +
                                              '   new_rate,              ' +
                                              '   last_revalue_rate,     ' +
                                              '   orig_invoice_rate,     ' +
                                              '   apinvoice_id)          ' +
                                      ' select %f,       ' +
                                      '        %f,       ' +
                                      '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                      '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                      '        %.6f,                             ' +
                                      '        %.6f,                             ' +
                                      '        FX_REVALUE_RATE,                  ' +
                                      '        FX_RATE,                          ' +
                                      '        id                                ' +
                                      '  from apinvoice where id = %f',
                                      [FBatchId,
                                       QryAcctfx_acct_id.asFloat,
                                       Amount, Amount,
                                       Amount, Amount,
                                       AOldRate,
                                       ANewRate,
                                       FieldByName('id').asFloat]);
         if Amount > 0 then
           ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                                '   glacct_id,             ' +
                                                '   debit,                 ' +
                                                '   credit,                ' +
                                                '   old_rate,              ' +
                                                '   new_rate,              ' +
                                                '   last_revalue_rate,     ' +
                                                '   orig_invoice_rate,     ' +
                                                '   apinvoice_id)          ' +
                                        ' select %f,       ' +
                                        '        %f,       ' +
                                        '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                        '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                        '        %.6f,                             ' +
                                        '        %.6f,                             ' +
                                        '        FX_REVALUE_RATE,                  ' +
                                        '        FX_RATE,                          ' +
                                        '        id                                ' +
                                        '  from apinvoice where id = %f',
                                        [FBatchId,
                                         QryAcctfx_gain_acct_id.asFloat,
                                         Amount, Amount,
                                         Amount, Amount,
                                         AOldRate,
                                         ANewRate,
                                         FieldByName('id').asFloat])
         else
           ExecuteCommandFmt('insert into GTT_GL_REVALUE  (batch_id,               ' +
                                                '   glacct_id,             ' +
                                                '   debit,                 ' +
                                                '   credit,                ' +
                                                '   old_rate,              ' +
                                                '   new_rate,              ' +
                                                '   last_revalue_rate,     ' +
                                                '   orig_invoice_rate,     ' +
                                                '   apinvoice_id)          ' +
                                        ' select %f,       ' +
                                        '        %f,       ' +
                                        '        decode(sign(%f), -1, Abs(%f), 0), ' +
                                        '        decode(sign(%f), -1, 0, Abs(%f)), ' +
                                        '        %.6f,                             ' +
                                        '        %.6f,                             ' +
                                        '        FX_REVALUE_RATE,                  ' +
                                        '        FX_RATE,                          ' +
                                        '        id                                ' +
                                        '  from apinvoice where id = %f',
                                        [FBatchId,
                                         QryAcctfx_offset_acct_id.asFloat,
                                         Amount, Amount,
                                         Amount, Amount,
                                         AOldRate,
                                         ANewRate,
                                         FieldByName('id').asFloat]);

       end;


       Next;
     end;
  finally
    free;
  end;
end;

procedure TFrmAcctReval.AssignPeriod;
var
  AId:Real;
begin
  AId := SelectValueAsFloat('select id from glperiods where trunc(sysdate) between start_date and end_date and GL.CheckGLYearEplant(id) = 1');
  if (AId <> 0) then
     begin
       if not QryPeriod.Active then QryPeriod.Open;
       QryPeriod.Locate('ID', AId, []);
     end;
end;

procedure TFrmAcctReval.SBPeriodClick(Sender: TObject);
var
  AId:Real;
begin
  AId := DoFindPeriod;
  if AId <> 0 then
  begin
    if not QryPeriod.Active then QryPeriod.Open;
    QryPeriod.Locate('ID', AId, []);
    ResetQry;
  end;

end;

procedure TFrmAcctReval.btnPostClick(Sender: TObject);
var
  cDate:String;
  DBase:TFDCustomConnection;
  i:Integer;
begin
  CheckForOpenPeriod('gl_status', QryPeriod.FieldByName('ID').asFloat);  {in IQMS.Common.AccountingShare.pas}
  cDate := DateToStr(Date);
  if IQInputQuery('GL Batch Date', 'Please enter GL Batch Date', cDate, '!99/99/0000;1; ') then    {IQMS.Common.InputQuery.pas}
  begin
    FGLBatchDate := StrToDate(cDate);
    try
      DBase := FDManager.FindConnection('IQFD');
      DBase.StartTransaction;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedList',  'SelectedList.item'
      with gridAcct,gridAcct.datasource.dataset do
      for i:= 0 to SelectedList.Count-1 do
      begin
        GotoBookmark(SelectedList.items[i]);
        PopulateAPAR;
      end;
      }
      FGLBatchId_Id  := GetNextID('GLBATCHID');

      PostAccounts;
      AssignExchangeRates;

      DBase.Commit;

      if IqConfirmYN('Posting completed.  Print the After Post report?') then
        PrintAfterPostReport(FGLBatchId_Id);
      btnCancelClick(nil);
    finally
      if DBase.InTransaction then
        DBase.RollBack;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmAcctReval.PrintAfterPostReport(AGLBatchId_Id:Real);
var
  cServerName, cUID, cPassword:String;
  SelectionList:TStringList;
begin

  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList, IQFormat('{GLBATCHID.ID} = %f', [AGLBatchId_Id]));
    PrintDefaultReport( self, 'GJ_AFTERPOST_REPORT', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;

  Screen.Cursor := crDefault;
end;

procedure TFrmAcctReval.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;


procedure TFrmAcctReval.PostAccounts;
var
  ABatchNumber:Real;
  i:Integer;
begin
  ABatchNumber   := GetNextSequenceNumber('S_FX');
  ExecuteCommand(IQFormat('insert into glbatchid ' +
                '(id, ' +
                'batchnumber, ' +
                'source, ' +
                'tablename, ' +
                'glperiods_id, ' +
                'userid, ' +
                'system_date, ' +
                'batch_date) ' +
                'values ' +
                '(%f, ' +
                '%f, ' +
                '''FX'', ' +
                '''GLACCT'', ' +
                '%f, ' +
                '''%s'', ' +
                'To_Date(''%s'', ''MM/DD/RRRR''), ' +
                'To_Date(''%s'', ''MM/DD/RRRR''))',
                [FGlBatchId_Id,
                 ABatchNumber,
                 QryPeriod.FieldByName('ID').asFloat,
                 SecurityManager.UserName,
                 FormatDateTime('mm/dd/yyyy', Date),
                 FormatDateTime('mm/dd/yyyy', FGLBatchDate)]));

  QryGTT.First;
  while not QryGTT.Eof do
  begin
    ExecuteCommand(IQFormat('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'values ( ' +
                  '%f, ' +
                  '%f, ' +
                  '%f, ' +
                  '%f, ' +
                  '''%s'')',
                  [FGlBatchId_Id,
                   QryGTTGLACCT_ID.asFloat,
                   QryGTTDEBIT.asFloat,
                   QryGTTCREDIT.asFloat,
                   Format('Old Rate: %f, New Rate: %f (%s)',
                          [QryGTTOLD_RATE.asFloat,
                           QryGTTNEW_RATE.asFloat,
                           FCurrency])
                   ]));
    QryGTT.Next;
  end;

end;

procedure TFrmAcctReval.AssignExchangeRates;
begin
  with QryAcct do
  begin
    First;
    while not eof do
    begin
      ExecuteCommandFmt('update glacct set old_spot_rate = new_spot_rate where id = %f', [FieldByName('fx_acct_id').asFloat]);
      Next;
    end;
    Close;
    Open;
  end;
end;

function TFrmAcctReval.GetNumber(AStr:String):Real;
var
  i:Integer;
  AResult:String;
  ATmp:String;
  ADecimal, AGroup:Integer;
begin
  AResult := AStr;

  if Pos('-', AResult) <> 0 then
  begin
    AResult := Copy(AResult, Pos('-', AResult), Length(AResult));
  end
  else
  begin
    for i := 1 to Length(AStr) do
    if Pos(AStr[i], '0123456789') <> 0 then
    begin
      AResult := Copy(AResult, i, Length(AResult));
      break;
    end;
  end;

  AResult := StrTran(aResult, FormatSettings.ThousandSeparator, '');

  ATmp := AResult;

  AResult := '';

  for i := 1 to Length(ATmp) do
    if ((Ord(ATmp[i]) >= 48) and (Ord(ATmp[i]) <= 57)) or (Ord(ATmp[i]) = 45) or
       (Ord(ATmp[i]) = Ord(FormatSettings.DecimalSeparator)) or (Ord(ATmp[i]) = Ord(FormatSettings.ThousandSeparator)) then
      AResult := AResult + ATmp[i];



  if AResult = '' then aResult := '0';


//  APosPeriod := Pos('.', AResult);
//  APosComma  := Pos(',', AResult);

//  if (APosPeriod <> 0) and (APosComma <> 0) then
//  begin
//    if APosPeriod < APosComma then
//      AResult := StrTran(AResult, '.', '')
//    else
//      AResult := StrTran(AResult, ',', '');
//  end;

  Result := StrToFloat(AResult);
end;

procedure TFrmAcctReval.SrcAcctStateChange(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'Options'
  if QryAcct.State in [dsBrowse] then
    gridAcct.Options := gridAcct.Options + [wwDBiGrd.dgMultiSelect]
  else
    gridAcct.Options := gridAcct.Options - [wwDBiGrd.dgMultiSelect];

  if QryAcct.State in [dsInsert] then
      QryAcct.FieldByName('OldRate').ReadOnly := False
  else
      QryAcct.FieldByName('OldRate').ReadOnly := (not EditOldRate1.Checked);  }
end;

procedure TFrmAcctReval.EditOldRate1Click(Sender: TObject);
begin
  with QryAcct do
    if FieldByName('OldRate').ReadOnly then
    begin
      FieldByName('OldRate').ReadOnly := False;
      EditOldRate1.Checked := True;
    end
    else
    begin
      FieldByName('OldRate').ReadOnly := True;
      EditOldRate1.Checked := False;
    end
end;

procedure TFrmAcctReval.tblGLAcctFxFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := Copy(tblGLAcctFx.FieldByName('ACCT').asString, FStart, FLength) = FPlug;
end;

procedure TFrmAcctReval.QryAcctBeforeScroll(DataSet: TDataSet);
var
  AUpdateAction :TFDErrorAction;
begin
{
  if FCallUpdate then
  begin
//  with QryAcct do
//  try
//    if State in [dsInsert, dsEdit] then Post;
//    QryAcctBeforePost(QryAcct);
    FOldRate := FModOldRate;
    FNewRate := FModNewRate;
//    AUpdateAction:= eaFail;
//    QryAcctUpdateRecord(QryAcct, arUpdate, AUpdateAction);
//    QryAcctAfterPost(QryAcct);
//  finally
    FCallUpdate := False;
  end;

  }
end;

procedure TFrmAcctReval.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmAcctReval.SettleTransactionsatHistoricalExchangeRate1Click( Sender: TObject);
begin
  if SettleTransactionsatHistoricalExchangeRate1.Checked then
  begin
    ExecuteCommand('update iqsys set hist_ex_rate  = ''N''');
    SettleTransactionsatHistoricalExchangeRate1.Checked := False;
  end
  else
  begin
    ExecuteCommand('update iqsys set hist_ex_rate  = ''Y''');
    SettleTransactionsatHistoricalExchangeRate1.Checked := True;
  end;

end;

procedure TFrmAcctReval.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAcctReval.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1103652 );
end;

procedure TFrmAcctReval.dbFXCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  QryAcctFX_Acct.asString := SelectValueFmtAsString('select acct from glacct where id = %f', [QryAcctFX_ACCT_ID.asFloat]);
end;

procedure TFrmAcctReval.CbRevalClick(Sender: TObject);
begin
  if CbReval.Checked then
    ExecuteCommand('update iqsys set TRANS_LELEL_REVAL = ''Y''')
  else
    ExecuteCommand('update iqsys set TRANS_LELEL_REVAL = ''N''');
end;

procedure TFrmAcctReval.QryGTTAfterOpen(DataSet: TDataSet);
begin
  UpdateFooter(nil);
end;

procedure TFrmAcctReval.QryGTTBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ABatchId').Value := FBatchId;
end;

procedure TFrmAcctReval.UniFormCreate(Sender: TObject);
begin
  
  IQSetTablesActiveEx( True, self, gl_rscstr.cTXT0000046 {'Accessing database.  Please wait.'});
  { TODO -oathite -cWebConvert : Incompatible types: 'TForm' and 'TFrmAcctReval'
  IQMS.Common.Controls.CenterForm(Self); }
  IQRegFormRead( self, [self, gridAcct, Panel1]);
  QryAcct.FieldByName('OldRate').ReadOnly := True;

  SettleTransactionsatHistoricalExchangeRate1.Checked := SelectValueAsString('select NVL(hist_ex_rate, ''N'') from iqsys where rownum < 2') = 'Y';
  CbReval.Checked := SelectValueAsString('select NVL(TRANS_LELEL_REVAL, ''N'') from iqsys where rownum < 2') = 'Y';
  { TODO -oathite -cWebConvert : undeclare identifier
  IQSearch1.DBGrid.OnUpdateFooter := UpdateFooter;    }
end;

procedure TFrmAcctReval.UniFormShow(Sender: TObject);
begin
  AssignPeriod;
//  FGLPeriodHint := Application.OnHint;
//  Application.OnHint := DisplayHint;
  btnPost.Enabled  := False;
  Post1.Enabled    := False;
  GetPlugValues;
  FSql   := QryAcct.Sql.Text;
  FPKSql := PKAcct.Sql.Text;
  try
    sbCurrClick(NIL) ;      // activate search speed button
  except on E:EAbort do
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
  end;
  FBatchId := SelectValueAsFloat('select S_GTT_GL_REVALUE_BATCH.NextVal from dual');
end;

procedure TFrmAcctReval.UpdateFooter(Sender: TObject);
var
  ACredit, ADebit:Real;
begin
  ACredit := SelectValueFmtAsFloat('select sum(NVL(credit, 0)) ' +
                          '  from GTT_GL_REVALUE    ' +
                          ' where batch_id = %f', [FBatchId]);

  ADebit := SelectValueFmtAsFloat('select sum(NVL(debit, 0)) ' +
                          '  from GTT_GL_REVALUE    ' +
                          ' where batch_id = %f', [FBatchId]);

  { TODO -oathite -cWebConvert : Undeclared identifier: 'ColumnByName'
  IqSearch1.DBGrid.ColumnByName('CREDIT').FooterValue := Format('%m', [ACredit]);
  IqSearch1.DBGrid.ColumnByName('DEBIT').FooterValue := Format('%m', [ADebit]);  }
end;

procedure TFrmAcctReval.PopupMenu1Popup(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'MenuEnabled'
  IqSearch1.MenuEnabled(JumptoARInvoice1, QryGTTARINVOICE_ID.asFloat <> 0);
  IqSearch1.MenuEnabled(JumptoAPInvoice1, QryGTTAPINVOICE_ID.asFloat <> 0); }
end;

procedure TFrmAcctReval.JumptoAPInvoice1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on apview
  DoJumptoAPPosted(QryGTTAPINVOICE_ID.asFloat); {apview.pas}
end;

procedure TFrmAcctReval.JumptoARInvoice1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on IView
  DoJumpToInvoice(self, QryGTTARINVOICE_ID.asFloat); {iview.pas}
end;



end.
