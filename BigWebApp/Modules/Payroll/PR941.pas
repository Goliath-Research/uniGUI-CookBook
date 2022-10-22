unit PR941;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.DBGrids,
  Mask,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel;

type
  TFrmPR941 = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    gridHeader: TUniDBGrid;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    navHeader: TUniDBNavigator;
    DBNavigator2: TUniDBNavigator;
    SBSearchPurch: TUniSpeedButton;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N2: TUniMenuItem;
    Search1: TUniMenuItem;
    SrcHeader: TDataSource;
    tblHeader: TFDTable;
    SrcDetail: TDataSource;
    tblDetail: TFDTable;
    PK941: TIQWebHPick;
    tblHeaderID: TBCDField;
    tblHeaderPR941_YEAR: TDateTimeField;
    tblHeaderPR941_QTR: TBCDField;
    tblHeaderDESCRIP: TStringField;
    tblDetailID: TBCDField;
    tblDetailPR941_HEADER_ID: TBCDField;
    tblDetailFIELD_1: TFMTBCDField;
    tblDetailFIELD_2: TFMTBCDField;
    tblDetailFIELD_3: TFMTBCDField;
    tblDetailFIELD_4: TFMTBCDField;
    tblDetailFIELD_5: TFMTBCDField;
    tblDetailFIELD_6A: TFMTBCDField;
    tblDetailFIELD_6B: TFMTBCDField;
    tblDetailFIELD_6C: TFMTBCDField;
    tblDetailFIELD_6D: TFMTBCDField;
    tblDetailFIELD_7A: TFMTBCDField;
    tblDetailFIELD_7B: TFMTBCDField;
    tblDetailFIELD_8: TFMTBCDField;
    tblDetailFIELD_9: TFMTBCDField;
    tblDetailFIELD_10: TFMTBCDField;
    tblDetailFIELD_11: TFMTBCDField;
    tblDetailFIELD_12: TFMTBCDField;
    tblDetailFIELD_13: TFMTBCDField;
    tblDetailFIELD_14: TFMTBCDField;
    tblDetailFIELD_16: TFMTBCDField;
    tblDetailFIELD_17A: TFMTBCDField;
    tblDetailFIELD_17B: TFMTBCDField;
    tblDetailFIELD_17C: TFMTBCDField;
    tblDetailFIELD_17D: TFMTBCDField;
    PK941PR941_YEAR: TFloatField;
    PK941PR941_QTR: TBCDField;
    PK941DESCRIP: TStringField;
    PK941ID: TBCDField;
    PK941YEAR: TStringField;
    PKQtrs: TIQWebHPick;
    PKQtrsQUARTER: TFMTBCDField;
    PKQtrsTHIS_YEAR: TDateTimeField;
    PKQtrsYEAR: TStringField;
    tblDetailFIELD_15: TFMTBCDField;
    tblHeaderPR941_YEAR_STRING: TStringField;
    PopupMenu1: TUniPopupMenu;
    Breakdownbymonth1: TUniMenuItem;
    PopupMenu2: TUniPopupMenu;
    MenuItem1: TUniMenuItem;
    PopupMenu3: TUniPopupMenu;
    MenuItem2: TUniMenuItem;
    Qry17a: TFDQuery;
    Qry17b: TFDQuery;
    Qry17c: TFDQuery;
    Src17a: TDataSource;
    Src17b: TDataSource;
    Src17c: TDataSource;
    Qry17aCHECK_DATE: TDateTimeField;
    Qry17aTOTAL: TFMTBCDField;
    Qry17bCHECK_DATE: TDateTimeField;
    Qry17bTOTAL: TFMTBCDField;
    Qry17cCHECK_DATE: TDateTimeField;
    Qry17cTOTAL: TFMTBCDField;
    Contents1: TUniMenuItem;
    PKQtrsEin: TIQWebHPick;
    FloatField1: TFMTBCDField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    PKQtrsEinEIN_ID: TBCDField;
    PKQtrsEinFED_TAX_ID: TStringField;
    tblHeaderEIN_ID: TBCDField;
    QryEin: TFDQuery;
    tblHeaderEin: TStringField;
    tblHeaderFedTaxId: TStringField;
    SR: TIQWebSecurityRegister;
    tblDetailCOBRA_AMOUNT: TBCDField;
    tblDetailCOBRA_NUM: TBCDField;
    tblDetailEXEMPT_NUM_QTR_FIRST: TBCDField;
    tblDetailEXEMPT_NUM_QTR: TBCDField;
    tblDetailEXEMPT_WAGES: TBCDField;
    tblDetailEXEMPT_TAX: TBCDField;
    tblDetailEXEMPT_MARCH_NUM: TBCDField;
    tblDetailEXEMPT_MARCH_WAGES: TBCDField;
    tblDetailEXEMPT_MARCH_TAX: TBCDField;
    GroupBox2: TUniGroupBox;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label15: TUniLabel;
    Label16: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    Label19: TUniLabel;
    Label20: TUniLabel;
    Label21: TUniLabel;
    Label25: TUniLabel;
    Label26: TUniLabel;
    db14: TUniDBEdit;
    db11: TUniDBEdit;
    db12: TUniDBEdit;
    db13: TUniDBEdit;
    db15: TUniDBEdit;
    db16: TUniDBEdit;
    db17a: TUniDBEdit;
    db17b: TUniDBEdit;
    db17c: TUniDBEdit;
    db17d: TUniDBEdit;
    DBCobraAmt: TUniDBEdit;
    DBCobraNum: TUniDBEdit;
    GroupBox3: TUniGroupBox;
    Label7: TUniLabel;
    Label23: TUniLabel;
    Label28: TUniLabel;
    Label29: TUniLabel;
    Label30: TUniLabel;
    Label31: TUniLabel;
    Label32: TUniLabel;
    dbExmNumQtrFst: TUniDBEdit;
    dbExmNumQtr: TUniDBEdit;
    dbExemptWages: TUniDBEdit;
    dbExemptTax: TUniDBEdit;
    dbExemptMarchNum: TUniDBEdit;
    dbExemptMarchWages: TUniDBEdit;
    dbExemptMarchTax: TUniDBEdit;
    Calculate: TUniButton;
    tblDetailTotalTaxBefAdj: TFloatField;
    GroupBox1: TUniGroupBox;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label22: TUniLabel;
    Label24: TUniLabel;
    Label27: TUniLabel;
    Label1: TUniLabel;
    db1: TUniDBEdit;
    db2: TUniDBEdit;
    db3: TUniDBEdit;
    db4: TUniDBEdit;
    db5: TUniDBEdit;
    db6a: TUniDBEdit;
    db6b: TUniDBEdit;
    db7a: TUniDBEdit;
    db7b: TUniDBEdit;
    db9: TUniDBEdit;
    db8: TUniDBEdit;
    dbTotalTaxBefAdj: TUniDBEdit;
    tblDetailMCARE2_TAXABLE: TBCDField;
    tblDetailMCARE2_TAX: TBCDField;
    Label11: TUniLabel;
    Label33: TUniLabel;
    DBTier2Wages: TUniDBEdit;
    DBTier2WagesTax: TUniDBEdit;
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblDetailBeforePost(DataSet: TDataSet);
    procedure tblDetailBeforeInsert(DataSet: TDataSet);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure tblHeaderAfterInsert(DataSet: TDataSet);
    procedure tblDetailNewRecord(DataSet: TDataSet);
    procedure sbRecalcClick(Sender: TObject);
    procedure tblHeaderBeforePost(DataSet: TDataSet);
    procedure Breakdownbymonth1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tblHeaderCalcFields(DataSet: TDataSet);
    procedure tblDetailCalcFields(DataSet: TDataSet);
    procedure CalculateClick(Sender: TObject);
    procedure tblHeaderAfterScroll(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FState:TDataSetState;
    FUseEid     :Boolean;
//    FField15    :Real;
  public
    { Public declarations }
  end;

procedure DoPR941;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  PR941tax,
  IQMS.Common.HelpHook,
  Pr941yr,
  IQMS.Common.Numbers,
  IQMS.Common.NLS;
{$R *.DFM}

procedure DoPR941;
var
  LFrmPR941 : TFrmPR941;
begin
  LFrmPR941 := TFrmPR941.Create(UniGUIApplication.UniApplication);
  LFrmPR941.Show;
end;

procedure TFrmPR941.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmPR941.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmPR941.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPR941.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPR941.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel1, gridHeader]);
end;

procedure TFrmPR941.tblDetailBeforePost(DataSet: TDataSet);
begin
  FState := TblDetail.State;
  with TFDTable(DataSet) do
    if MasterSource <> nil then
      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
        raise Exception.Create('Parent record not found, cannot post');
  IQAssignIDBeforePost(DataSet); {in IQlib}
  sbRecalcClick(nil);
end;

procedure TFrmPR941.tblHeaderBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmPR941.tblDetailBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
//  FField15 := tblDetailFIELD_15.asFloat;
end;

procedure TFrmPR941.SBSearchPurchClick(Sender: TObject);
begin
  if PK941.Execute then
    tblHeader.Locate('ID', PK941.GetValue('ID'), []);
end;

procedure TFrmPR941.tblHeaderAfterInsert(DataSet: TDataSet);
var
  APk:TIQWebHPick;
  AEinId:Real;
  AUseFed:Boolean;
  AYear, AQuarter:Integer;
begin
  tblHeader.Cancel;

  if SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2') = 'Y' then
    AUseFed := True
//    APk := PKQtrsEin
  else
    AUseFed := False;
//    APk := PKQtrs;

//  FUseEid := (APk = PKQtrsEin);
  FUseEid := AUseFed;

  if Get941Year(AUseFed, AYear, AQuarter, AEinId) then {in Pr941yr.pas}
  try
    tblHeader.AfterInsert := nil;
    tblHeader.AfterScroll := nil;
    tblHeader.Insert;
    tblHeader.FieldByName('PR941_YEAR').asDateTime      := SelectValueFmtAsFloat('select to_date(''1/1/%s'', ''MM/DD/RRRR'') from dual', [IntToStr(AYear)]);
//    tblHeader.FieldByName('PR941_YEAR').asDateTime      := StrToDateTime('1/1/' + IntToStr(AYear));
    tblHeader.FieldByName('PR941_QTR').asInteger        := AQuarter;
    tblHeader.FieldByName('PR941_YEAR_STRING').asString := IntToStr(AYear);
    if AUseFed then
      tblHeader.FieldByName('EIN_ID').asFloat := AEinId;

    tblHeader.Post;
    tblDetail.Insert;
  finally
    tblHeader.AfterInsert := tblHeaderAfterInsert;
    tblHeader.AfterScroll := tblHeaderAfterScroll;
  end;



//  if APK.Execute then
//  try
//    tblHeader.AfterInsert := nil;
//    tblHeader.Insert;
//    tblHeader.FieldByName('PR941_YEAR').asDateTime      := APK.GetValue('THIS_YEAR');
//    tblHeader.FieldByName('PR941_QTR').asInteger        := APK.GetValue('QUARTER');
//    tblHeader.FieldByName('PR941_YEAR_STRING').asString := APK.GetValue('YEAR');
//    if APk = PKQtrsEin then
//    begin
//      AEinId := APk.GetValue('EIN_ID');
//      tblHeader.FieldByName('EIN_ID').asFloat := AEinId;
//    end;
//
//    tblHeader.Post;
//    tblDetail.Insert;
//  finally;
//    tblHeader.AfterInsert := tblHeaderAfterInsert;
//  end;
end;

procedure TFrmPR941.tblDetailNewRecord(DataSet: TDataSet);
var
  AView:String;
  Atotalpay:Real;
  Atotaldeductions:Real;
  Afield_3 :Real;
  Afield_1 :Real;
  Afield_6a:Real;
  Afield_7a:Real;
  Afield_12:Real;
  AQry:TFDQuery;
  AQry2:TFDQuery;
  AEmpl_Total:Real;
  AEmpl_McareTotal:Real;
  AEin:Real;
  AThreshold, AOver, AEmpGrossToTax, AmountToReport, ARate2, AmountOver:Real;
begin
  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;

    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
    begin
//      AView := Format(' ( select q.quarter,                                                                  ' +
//                      '           q.this_year,                                                               ' +
//                      '           p.totalpay,                                                                ' +
//                      '           d.totaldeductions,                                                         ' +
//                      '           NVL(p.totalpay, 0) - NVL(d.totaldeductions, 0) as field_2,                 ' +
//                      '           fwt.totalfwt as field_3,                                                   ' +
//                      '           PAYROLL.IQ_GetNumberOfEmployeesInQTR(q.quarter, q.this_year) as field_1,   ' +
//                      '           f.grosstotax as field_6a,                                                  ' +
//                      '           m.grosstotax as field_7a,                                                  ' +
//                      '           eic.totaleic as field_12                                                   ' +
//                      '      from v_emp_distinct_quarter_ein q,                                              ' +
//                      '           v_emp_totpay_by_qtr p,                                                     ' +
//                      '           v_emp_totdeduct_by_qtr_no_fwt d,                                           ' +
//                      '           v_emp_gross_tax_mcare m,                                                   ' +
//                      '           v_emp_gross_tax_fica f,                                                    ' +
//                      '           v_emp_total_fwt fwt,                                                       ' +
//                      '           v_emp_total_eic eic                                                        ' +
//                      '     where p.quarter(+) = q.quarter                                                   ' +
//                      '       and p.this_year(+) = q.this_year                                               ' +
//                      '       and d.quarter(+) = q.quarter                                                   ' +
//                      '       and d.this_year(+) = q.this_year                                               ' +
//                      '       and m.quarter(+) = q.quarter                                                   ' +
//                      '       and m.this_year(+) = q.this_year                                               ' +
//                      '       and f.quarter(+) = q.quarter                                                   ' +
//                      '       and f.this_year(+) = q.this_year                                               ' +
//                      '       and fwt.quarter(+) = q.quarter                                                 ' +
//                      '       and fwt.this_year(+) = q.this_year                                             ' +
//                      '       and eic.quarter(+) = q.quarter                                                 ' +
//                      '       and eic.this_year(+) = q.this_year                                             ' +
//                      '       and q.ein_id = %f ) ', [tblHeaderEIN_ID.asFloat])
      Atotalpay        := SelectValueFmtAsFloat('select  sum(NVL(p.payrate, 0)) from PR_CHECK_PAYTYPE p, v_emp_hist_check h ' +
                                    'where p.pr_check_hist_id = h.id and h.quarter(+) = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' ' +
                                    'and h.ein_id = %f',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                     tblHeaderEIN_ID.asFloat]);
      Atotaldeductions := SelectValueFmtAsFloat('select sum(NVL(amount, 0) + NVL(back_ded_amount, 0)) from PR_CHECK_DEDUCTIONS d, v_emp_hist_check h ' +
                                    'where d.pr_check_hist_id = h.id and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' ' +
                                    'and NVL(d.pr_deduction_id, 0) in (select pr_deduction_id from pr_deduction_tax_exempt e, pr_tax t ' +
                                    'where e.pr_tax_id = t.id and t.tax_code = ''FWT'') ' +
                                    'and h.ein_id = %f',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                     tblHeaderEIN_ID.asFloat]);
      Afield_3         := SelectValueFmtAsFloat('select sum(NVL(d.amount, 0)) from PR_CHECK_TAX d, v_emp_hist_check h ' +
                                    'where d.pr_check_hist_id(+) = h.id and h.quarter(+) = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' ' +
                                    'and d.tax_code = ''FWT'' ' +
                                    'and h.ein_id = %f',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                     tblHeaderEIN_ID.asFloat]);
      Afield_1         := SelectValueFmtAsFloat('select PAYROLL.IQ_GetNumberOfEmployeesInQTR(%d, to_date(''01/01/%s'', ''MM/DD/RRRR'')) from dual',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger, tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      Afield_6a        := SelectValueFmtAsFloat('select  sum(NVL(grosstotax, 0)) from PR_CHECK_TAX d, v_emp_hist_check h where d.pr_check_hist_id(+) = h.id ' +
                                    'and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''FICA'' ' +
                                    'and h.ein_id = %f',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                     tblHeaderEIN_ID.asFloat]);
      Afield_7a        := SelectValueFmtAsFloat('select sum(NVL(grosstotax, 0)) from PR_CHECK_TAX d, v_emp_hist_check h where d.pr_check_hist_id(+) = h.id ' +
                                    'and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''MCARE'' ' +
                                    'and h.ein_id = %f',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                     tblHeaderEIN_ID.asFloat]);
      Afield_12        := SelectValueFmtAsFloat('select sum((-1) * NVL(d.amount, 0)) from PR_CHECK_TAX d, v_emp_hist_check h ' +
                                   'where d.pr_check_hist_id(+) = h.id ' +
                                    'and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''EIC'' ' +
                                    'and h.ein_id = %f',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                     tblHeaderEIN_ID.asFloat]);
    end
    else
    begin
//      AView := ' v_emp_941_report ';

      Atotalpay        := SelectValueFmtAsFloat('select  sum(NVL(p.payrate, 0)) from PR_CHECK_PAYTYPE p, v_emp_hist_check h ' +
                                    'where p.pr_check_hist_id = h.id and h.quarter(+) = %d and To_Char(h.this_year, ''YYYY'') = ''%s''',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      Atotaldeductions := SelectValueFmtAsFloat('select sum(NVL(amount, 0) + NVL(back_ded_amount, 0)) from PR_CHECK_DEDUCTIONS d, v_emp_hist_check h ' +
                                    'where d.pr_check_hist_id = h.id and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' ' +
                                    'and NVL(d.pr_deduction_id, 0) in (select pr_deduction_id from pr_deduction_tax_exempt e, pr_tax t ' +
                                    'where e.pr_tax_id = t.id and t.tax_code = ''FWT'')',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      Afield_3         := SelectValueFmtAsFloat('select sum(NVL(d.amount, 0)) from PR_CHECK_TAX d, v_emp_hist_check h ' +
                                    'where d.pr_check_hist_id(+) = h.id and h.quarter(+) = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' ' +
                                    'and d.tax_code = ''FWT''',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      Afield_1         := SelectValueFmtAsFloat('select PAYROLL.IQ_GetNumberOfEmployeesInQTR(%d, to_date(''01/01/%s'', ''MM/DD/RRRR'')) from dual',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger, tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      Afield_6a        := SelectValueFmtAsFloat('select  sum(NVL(grosstotax, 0)) from PR_CHECK_TAX d, v_emp_hist_check h where d.pr_check_hist_id(+) = h.id ' +
                                    'and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''FICA''',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      Afield_7a        := SelectValueFmtAsFloat('select sum(NVL(grosstotax, 0)) from PR_CHECK_TAX d, v_emp_hist_check h where d.pr_check_hist_id(+) = h.id ' +
                                    'and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''MCARE''',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      Afield_12        := SelectValueFmtAsFloat('select sum((-1) * NVL(d.amount, 0)) from PR_CHECK_TAX d, v_emp_hist_check h ' +
                                   'where d.pr_check_hist_id(+) = h.id ' +
                                    'and h.quarter = %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''EIC''',
                                    [tblHeader.FieldByName('PR941_QTR').asInteger,
                                     tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
    end;






//    Sql.Add(Format('select v.field_2, ' +
//                          'v.field_3, ' +
//                          'v.field_1, ' +
//                          'v.field_12, ' +
//                          'v.field_6a, ' +
//                          'v.field_7a from %s v ' +
//                          'where v.quarter = %d and To_Char(v.this_year, ''YYYY'') = ''%s''',
//                          [AView, tblHeader.FieldByName('PR941_QTR').asInteger,
//                           tblHeader.FieldByName('PR941_YEAR_STRING').asString]));
//    Open;
//    if eof and bof then
//    begin
//      tblDetail.Cancel;
//      Exit;
//    end;


    tblDetail.FieldByName('field_2').asFloat   :=
      SelectValueFmtAsFloat('select PAYROLL.IQ_Get_v_emp_941_report_field2(%d, to_date(''01/01/%s'', ''MM/DD/RRRR''), %f) from dual',
                                                  [tblHeader.FieldByName('PR941_QTR').asInteger,
                                                   tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                                   tblHeaderEIN_ID.asFloat]);
//    tblDetail.FieldByName('field_2').asFloat   := Atotalpay - Atotaldeductions;
    tblDetail.FieldByName('field_3').asFloat   := Afield_3;
    tblDetail.FieldByName('field_1').asInteger := Trunc(Afield_1);
    tblDetail.FieldByName('field_6a').asFloat  := Afield_6a;
    tblDetail.FieldByName('field_7a').asFloat  := Afield_7a;
    tblDetail.FieldByName('field_12').asFloat  := Afield_12;


    tblDetailMCARE2_TAXABLE.asFloat := 0;
    tblDetailMCARE2_TAX.asFloat := 0;
    AOver := 0;

    if (tblHeader.FieldByName('PR941_YEAR_STRING').asInteger > 2012) then
    begin
      AmountToReport := SelectValueFmtAsFloat('select pr_irs.GetMCare2TaxableAmount(''%s'', %f, %d, ''%s'') from dual',
                                 [sIIf( FUseEid, 'Y', 'N' ),
                                  tblHeaderEIN_ID.asFloat,
                                  tblHeader.FieldByName('PR941_QTR').asInteger,
                                  tblHeader.FieldByName('PR941_YEAR_STRING').asString]);
      tblDetailMCARE2_TAXABLE.asFloat := AmountToReport;
      ARate2 := SelectValueFmtAsFloat('select pr_irs.GetMcareTier2_Rate(%d) from dual', [tblHeader.FieldByName('PR941_YEAR_STRING').asInteger]);
      tblDetailMCARE2_TAX.asFloat := tblDetailMCARE2_TAXABLE.asFloat * ARate2;
    end;


{
    if (tblHeader.FieldByName('PR941_YEAR_STRING').asInteger > 2012) then
    begin

      AThreshold := SelectValueFmtAsFloat('select pr_irs.GetMcareTier2_Threshold(%d) from dual', [tblHeader.FieldByName('PR941_YEAR_STRING').asInteger]);
      AQry2 := TFDQuery.Create(nil);
      try
        AQry2.Connection := MainModule.FDConnection;
        if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
          AQry2.Sql.Add(IqFormat('select sum(NVL(d.grosstotax, 0)) as grosstotax, h.pr_emp_id ' +
                                 ' from PR_CHECK_TAX d, v_emp_hist_check h where d.pr_check_hist_id(+) = h.id ' +
                                      'and h.quarter <= %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''MCARE'' and h.ein_id = %f ' +
                                      ' group by h.pr_emp_id',
                                      [tblHeader.FieldByName('PR941_QTR').asInteger,
                                       tblHeader.FieldByName('PR941_YEAR_STRING').asString,
                                       tblHeaderEIN_ID.asFloat]))
        else
          AQry2.Sql.Add(IqFormat('select sum(NVL(d.grosstotax, 0)) as grosstotax, h.pr_emp_id ' +
                                 ' from PR_CHECK_TAX d, v_emp_hist_check h where d.pr_check_hist_id(+) = h.id ' +
                                      'and h.quarter <= %d and To_Char(h.this_year, ''YYYY'') = ''%s'' and d.tax_code = ''MCARE'' ' +
                                      ' group by h.pr_emp_id',
                                      [tblHeader.FieldByName('PR941_QTR').asInteger,
                                       tblHeader.FieldByName('PR941_YEAR_STRING').asString]));
        AQry2.Open;
        if not (AQry2.eof and AQry2.bof) then
        while not AQry2.eof do
        begin
          AEmpGrossToTax := AQry2.FieldByName('grosstotax').asFloat;
          if AEmpGrossToTax > AThreshold then
          begin
            AmountOver := AEmpGrossToTax - AThreshold;
            if AEmpGrossToTax < AmountOver then



            AOver := AOver + (AEmpGrossToTax - AThreshold);
          end;
          AQry2.Next;
        end;
      finally
        AQry2.Free;
      end;

      if AOver <= Afield_7a then
        AmountToReport := AOver
      else
        AmountToReport := Afield_7a;

      tblDetailMCARE2_TAXABLE.asFloat := AmountToReport;
      ARate2 := SelectValueFmtAsFloat('select pr_irs.GetMcareTier2_Rate(%d) from dual', [tblHeader.FieldByName('PR941_YEAR_STRING').asInteger]);
      tblDetailMCARE2_TAX.asFloat := tblDetailMCARE2_TAXABLE.asFloat * ARate2;
    end;

}

//    tblDetail.FieldByName('field_2').asFloat  := FieldByName('field_2').asFloat  ;
//    tblDetail.FieldByName('field_3').asFloat  := FieldByName('field_3').asFloat  ;
//    tblDetail.FieldByName('field_1').asInteger  := FieldByName('field_1').asInteger  ;
//    tblDetail.FieldByName('field_6a').asFloat := FieldByName('field_6a').asFloat ;
//    tblDetail.FieldByName('field_7a').asFloat := FieldByName('field_7a').asFloat ;
//    tblDetail.FieldByName('field_12').asFloat := FieldByName('field_12').asFloat ;
    Close;
    Sql.Clear;

    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
    begin
      AEin := tblHeaderEIN_ID.asFloat;
      AView := IQFormat(' ( select distinct c.check_date,                                                                           ' +
                      '     To_Number(To_Char(Trunc(c.check_date), ''YYYY'')) as this_year,                                       ' +
                      '     To_Number(To_Char(Trunc(c.check_date), ''MM'')) as this_month,                                        ' +
                      '     Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 1, 1,                                         ' +
                      '       Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 2, 1,                                       ' +
                      '         Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 3, 1,                                     ' +
                      '           Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 4, 2,                                   ' +
                      '             Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 5, 2,                                 ' +
                      '               Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 6, 2,                               ' +
                      '                 Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 7, 3,                             ' +
                      '                   Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 8, 3,                           ' +
                      '                     Decode(to_number(to_char(Trunc(c.check_date), ''MM'')), 9, 3, 4))))))))) as quarter,  ' +
                      '     NVL(mcare.totalmcare, 0) as totalmcare,                                                               ' +
                      '     NVL(fica.totalfica, 0) as totalfica,                                                                  ' +
                      '     NVL(eic.totaleic, 0) as totaleic,                                                                     ' +
                      '     NVL(fwt.totalfwt, 0) as totalfwt                                                                      ' +
                      ' from cheque c,                                                                                            ' +
                      '     pr_check_hist h,                                                                                      ' +
                      '     (select amount as totalmcare,                                                                         ' +
                      '             check_date                                                                                    ' +
                      '        from C_PR_CHECK_TAX_941                                                                            ' +
                      '       where tax_code = ''MCARE'' and ein_id = %f ) mcare,                                                                          ' +
                      '     (select amount as totalfica,                                                                          ' +
                      '             check_date                                                                                    ' +
                      '        from C_PR_CHECK_TAX_941                                                                            ' +
                      '       where  tax_code = ''FICA'' and ein_id = %f ) fica,                                                  ' +
                      '     (select amount as totaleic,                                                                           ' +
                      '             check_date                                                                                    ' +
                      '        from C_PR_CHECK_TAX_941                                                                            ' +
                      '       where tax_code = ''EIC'' and ein_id = %f ) eic,                                                                     ' +
                      '     (select amount as totalfwt,                                                                           ' +
                      '             check_date                                                                                    ' +
                      '        from C_PR_CHECK_TAX_941                                                                            ' +
                      '       where tax_code = ''FWT'' and ein_id = %f ) fwt                                                                      ' +

//                      '     (select sum(NVL(d.amount, 0)) as totalmcare,                                                          ' +
//                      '             c.check_date                                                                                  ' +
//                      '        from PR_CHECK_TAX d,                                                                               ' +
//                      '             pr_check_hist h,                                                                              ' +
//                      '             cheque c                                                                                      ' +
//                      '       where d.pr_check_hist_id(+) = h.id                                                                  ' +
//                      '         and h.cheque_id = c.id                                                                            ' +
//                      '         and d.tax_code = ''MCARE''                                                                        ' +
//                      '         and NVL(c.check_status, '' '') <> ''VOID''                                                        ' +
//                      '       group by c.check_date) mcare,                                                                       ' +
//                      '     (select sum(NVL(d.amount, 0)) as totalfica,                                                           ' +
//                      '             c.check_date                                                                                  ' +
//                      '        from PR_CHECK_TAX d,                                                                               ' +
//                      '             pr_check_hist h,                                                                              ' +
//                      '             cheque c                                                                                      ' +
//                      '       where d.pr_check_hist_id(+) = h.id                                                                  ' +
//                      '         and h.cheque_id = c.id                                                                            ' +
//                      '         and d.tax_code = ''FICA''                                                                         ' +
//                      '         and NVL(c.check_status, '' '') <> ''VOID''                                                          ' +
//                      '       group by c.check_date) fica,                                                                        ' +
//                      '     (select sum(NVL(d.amount, 0)) as totaleic,                                                            ' +
//                      '             c.check_date                                                                                  ' +
//                      '        from PR_CHECK_TAX d,                                                                               ' +
//                      '             pr_check_hist h,                                                                              ' +
//                      '             cheque c                                                                                      ' +
//                      '       where d.pr_check_hist_id(+) = h.id                                                                  ' +
//                      '         and h.cheque_id = c.id                                                                            ' +
//                      '         and d.tax_code = ''EIC''                                                                          ' +
//                      '         and NVL(c.check_status, '' '') <> ''VOID''                                                        ' +
//                      '       group by c.check_date) eic,                                                                         ' +
//                      '     (select sum(NVL(d.amount, 0)) as totalfwt,                                                            ' +
//                      '             c.check_date                                                                                  ' +
//                      '        from PR_CHECK_TAX d,                                                                               ' +
//                      '             pr_check_hist h,                                                                              ' +
//                      '             cheque c                                                                                      ' +
//                      '       where d.pr_check_hist_id(+) = h.id                                                                  ' +
//                      '         and h.cheque_id = c.id                                                                            ' +
//                      '         and d.tax_code = ''FWT''                                                                          ' +
//                      '         and NVL(c.check_status, '' '') <> ''VOID''                                                        ' +
//                      '       group by c.check_date) fwt                                                                          ' +
                      ' where h.cheque_id = c.id                                                                                  ' +
                      '    and mcare.check_date(+) = c.check_date                                                                 ' +
                      '    and fica.check_date(+) = c.check_date                                                                  ' +
                      '    and eic.check_date(+) = c.check_date                                                                   ' +
                      '    and fwt.check_date(+) = c.check_date                                                                   ' +
                      '    and h.ein_id = %f                                                                                      ' +
                      '    and NVL(c.check_status, '' '') <> ''VOID''  ) ',
                      [tblHeaderEIN_ID.asFloat,
                       tblHeaderEIN_ID.asFloat,
                       tblHeaderEIN_ID.asFloat,
                       tblHeaderEIN_ID.asFloat,
                       tblHeaderEIN_ID.asFloat]);
    end
    else
    begin
      AEin := -1;
      AView := ' v_emp_941_taxes ';
    end;



//    Sql.Add(Format('select v.this_month, ' +
//                   '       sum(v.totalfwt + v.totaleic + 2 * v.totalmcare + 2 * v.totalfica) as total ' +
//                  ' from %s v ' +
//                   'where v.quarter = %d    ' +
//                   '  and v.this_year = %d  ' +
//                   ' group by v.this_month',
//                   [AView, tblHeader.FieldByName('PR941_QTR').asInteger,
//                    tblHeader.FieldByName('PR941_YEAR_STRING').asInteger]));

    Sql.Add(Format('select v.this_month, ' +
                   '       sum(v.totalfwt + v.totaleic + v.totalmcare + v.totalfica) as total ' +
//                   '       sum(v.totalfwt + v.totaleic + 2 * v.totalmcare + v.totalfica) as total ' +
                   ' from %s v ' +
                   'where v.quarter = %d    ' +
                   '  and v.this_year = %d  ' +
                   ' group by v.this_month',
                   [AView, tblHeader.FieldByName('PR941_QTR').asInteger,
                    tblHeader.FieldByName('PR941_YEAR_STRING').asInteger]));

    Open;
    if eof and bof then Exit;
    while not eof do
    begin
      AEmpl_Total := SelectValueFmtAsFloat('select pr_irs.GetEmployerFICAERTax(%d, %d, %d, %f) from dual',
                     [FieldByName('this_month').asInteger,
                      tblHeader.FieldByName('PR941_QTR').asInteger,
                      tblHeader.FieldByName('PR941_YEAR_STRING').asInteger,
                      AEin]);

      AEmpl_McareTotal := SelectValueFmtAsFloat('select pr_irs.GetEmployerMCARE_ERtax(%d, %d, %d, %f) from dual',
                     [FieldByName('this_month').asInteger,
                      tblHeader.FieldByName('PR941_QTR').asInteger,
                      tblHeader.FieldByName('PR941_YEAR_STRING').asInteger,
                      AEin]);


      if      FieldByName('this_month').asInteger in [1, 4, 7, 10] then
        tblDetail.FieldByName('field_17a').asFloat := FieldByName('total').asFloat + AEmpl_Total + AEmpl_McareTotal
      else if FieldByName('this_month').asInteger in [2, 5, 8, 11] then
        tblDetail.FieldByName('field_17b').asFloat := FieldByName('total').asFloat + AEmpl_Total + AEmpl_McareTotal
      else if FieldByName('this_month').asInteger in [3, 6, 9, 12] then
        tblDetail.FieldByName('field_17c').asFloat := FieldByName('total').asFloat + AEmpl_Total + AEmpl_McareTotal;


      Next;
    end;
    tblDetail.FieldByName('field_17d').asFloat := tblDetail.FieldByName('field_17a').asFloat +
                                                  tblDetail.FieldByName('field_17b').asFloat +
                                                  tblDetail.FieldByName('field_17c').asFloat;

  finally
    Free;
  end;
end;

procedure TFrmPR941.sbRecalcClick(Sender: TObject);
var
  ANum:Real;
  ADiff:Real;
begin
  with TblDetail do
  begin
    if FieldByName('ID').asFloat = 0 then Exit;
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName('field_5').asFloat := FieldByName('field_3').asFloat + FieldByName('field_4').asFloat;
//    ANum := SelectValueFmtAsFloat('select Round(%f * 0.062, 2) from dual', [FieldByName('field_6a').asFloat]) * 2;
//    FieldByName('field_6b').asFloat := ANum;
//    ANum := SelectValueFmtAsFloat('select Round(%f * 0.062, 2) from dual', [FieldByName('field_6c').asFloat]) * 2;
//    FieldByName('field_6d').asFloat := ANum;
//    ANum := SelectValueFmtAsFloat('select Round(%f * 0.0145, 2) from dual', [FieldByName('field_7a').asFloat]) * 2;
//    FieldByName('field_7b').asFloat := ANum;

//    FieldByName('field_6b').asFloat := FieldByName('field_6a').asFloat * 0.124;
//    FieldByName('field_6d').asFloat := FieldByName('field_6c').asFloat * 0.124;
//    FieldByName('field_7b').asFloat := FieldByName('field_7a').asFloat * 0.029;

    FieldByName('field_6b').asFloat := IQRound(FieldByName('field_6a').asFloat * SelectValueFmtAsFloat('select pr_irs.GetFicaTaxrate(%s) from dual', [tblHeaderPR941_YEAR_STRING.asString]), 2);
    FieldByName('field_6d').asFloat := IQRound(FieldByName('field_6c').asFloat * SelectValueFmtAsFloat('select pr_irs.GetFicaTaxrate(%s) from dual', [tblHeaderPR941_YEAR_STRING.asString]), 2);
    FieldByName('field_7b').asFloat := IQRound(FieldByName('field_7a').asFloat * SelectValueFmtAsFloat('select pr_irs.GetMCareTaxrate(%s) from dual', [tblHeaderPR941_YEAR_STRING.asString]), 2);


    FieldByName('field_8').asFloat := FieldByName('field_6b').asFloat +
                                      FieldByName('field_6d').asFloat +
                                      FieldByName('MCARE2_TAX').asFloat +
                                      FieldByName('field_7b').asFloat;

    if (FState in [DsInsert]) or (Sender <> nil) then
      FieldByName('field_9').asFloat :=  FieldByName('field_17d').asFloat -
                                         (FieldByName('field_8').asFloat +
                                          FieldByName('field_5').asFloat -
//                                          FieldByName('field_10').asFloat -
                                          FieldByName('field_12').asFloat);
    FieldByName('field_10').asFloat := FieldByName('field_8').asFloat + FieldByName('field_9').asFloat;
    FieldByName('field_11').asFloat := FieldByName('field_5').asFloat + FieldByName('field_10').asFloat - tblDetailEXEMPT_TAX.asFloat;
    FieldByName('field_13').asFloat := FieldByName('field_11').asFloat - FieldByName('field_12').asFloat;
    FieldByName('field_15').asFloat := FieldByName('field_13').asFloat - FieldByName('field_14').asFloat - FieldByName('COBRA_AMOUNT').asFloat;
    FieldByName('field_16').asFloat := 0;
    if FieldByName('field_15').asFloat < 0 then
    begin
      FieldByName('field_16').asFloat := Abs(FieldByName('field_15').asFloat);
      FieldByName('field_15').asFloat := 0;
    end;

    if Sender = nil then
    begin
      ADiff := FieldByName('field_13').asFloat - FieldByName('field_17d').asFloat;
//      ADiff := FieldByName('field_15').asFloat - FieldByName('field_17d').asFloat;
      FieldByName('field_17a').asFloat := FieldByName('field_17a').asFloat + ADiff;
//      FieldByName('field_17d').asFloat := FieldByName('field_13').asFloat;

      FieldByName('field_17d').asFloat := tblDetail.FieldByName('field_17a').asFloat +
                                                  tblDetail.FieldByName('field_17b').asFloat +
                                                  tblDetail.FieldByName('field_17c').asFloat;

    end;

  end;
end;

procedure TFrmPR941.Breakdownbymonth1Click(Sender: TObject);
begin
  if not Qry17a.Active then
    Qry17a.Open;
  DoDisc941DetailTaxes(Src17a);  {in PR941tax.pas}
end;

procedure TFrmPR941.MenuItem1Click(Sender: TObject);
begin
  if not Qry17b.Active then
    Qry17b.Open;
  DoDisc941DetailTaxes(Src17b);  {in PR941tax.pas}
end;

procedure TFrmPR941.MenuItem2Click(Sender: TObject);
begin
  if not Qry17c.Active then
    Qry17c.Open;
  DoDisc941DetailTaxes(Src17c);  {in PR941tax.pas}
end;

procedure TFrmPR941.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1004535 );
//  IQHelp.HelpContext( 13983 );
end;

procedure TFrmPR941.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_TX{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPR941.tblHeaderCalcFields(DataSet: TDataSet);
begin
  if (SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2') = 'Y') and  (tblHeaderEIN_ID.asFloat <> 0) then
    tblHeaderFedTaxId.asString := tblHeaderEin.asString
  else
    tblHeaderFedTaxId.asString := SelectValueAsString('select fed_id from iqsys where rownum < 2');
end;

procedure TFrmPR941.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, Panel1, gridHeader]);
end;

procedure TFrmPR941.tblDetailCalcFields(DataSet: TDataSet);
begin
  tblDetailTotalTaxBefAdj.asFloat :=  tblDetailFIELD_8.asFloat + tblDetailFIELD_5.asFloat - tblDetailEXEMPT_TAX.asFloat;
end;

procedure TFrmPR941.CalculateClick(Sender: TObject);
var
  Aid:Real;
begin
  if tblDetail.State in ([dsEdit, dsInsert]) then tblDetail.Post;
//  tblDetail.CheckBrowseMode;
  if tblDetailID.asFloat <> 0 then
  begin
    Aid := tblDetailID.asFloat;
    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
      ExecuteCommandFmt('begin PR_IRS.Update_Hire_Act(%f, 1); end;', [tblDetailID.asFloat])
    else
      ExecuteCommandFmt('begin PR_IRS.Update_Hire_Act(%f, 0); end;', [tblDetailID.asFloat]);
    tblDetail.Close;
    tblDetail.Open;
    tblDetail.Locate('ID', Aid, []);
  end;
end;

procedure TFrmPR941.tblHeaderAfterScroll(DataSet: TDataSet);
begin
  if tblHeaderPR941_YEAR_STRING.asString <> '' then
    GroupBox3.Visible := (StrToFloat(tblHeaderPR941_YEAR_STRING.asString) < 2012)
end;

end.
