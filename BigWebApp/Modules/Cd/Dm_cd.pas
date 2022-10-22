unit DM_CD;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
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
  FireDAC.DApt;

type
  TCD_DM = class(TDataModule)
    SrcPrePostCtrl: TDataSource;
    TblPrePostCtrl: TFDTable;
    SrcPrePost: TDataSource;
    TblPrePost: TFDTable;
    TblPrePostCtrlID: TBCDField;
    TblPrePostCtrlGLPERIODS_ID: TBCDField;
    TblPrePostCtrlCHECK_DATE: TDateTimeField;
    TblPrePostCtrlBANKINFO_DTL_ID: TBCDField;
    TblPrePostID: TBCDField;
    TblPrePostCDPREPOST_CONTROL_ID: TBCDField;
    TblPrePostCHECK_NO: TBCDField;
    TblPrePostVENDOR_ID: TBCDField;
    TblPrePostARCUSTO_ID: TBCDField;
    TblPrePostEMPLOYEE_ID: TBCDField;
    TblPrePostMISC_PAYTO: TStringField;
    TblPrePostMISC_ADDR1: TStringField;
    TblPrePostMISC_ADDR2: TStringField;
    TblPrePostMISC_CITY: TStringField;
    TblPrePostMISC_STATE: TStringField;
    TblPrePostMISC_ZIP: TStringField;
    TblPrePostCHECK_TYPE: TStringField;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    TblGlAcct: TFDTable;
    TblGlPeriods: TFDTable;
    TblPrePostCtrlGlPeriod: TStringField;
    TblPrePostCtrlStart_Date: TDateField;
    TblPrePostCtrlEnd_Date: TDateField;
    TblBankInfoDtl: TFDTable;
    TblPrePostCtrlBankAcct: TStringField;
    PkBank: TIQWebHPick;
    TblBankInfoDtlBANKINFO_ID: TBCDField;
    TblBankInfoDtlACCOUNT_NUMBER: TStringField;
    TblBankInfoDtlDESCRIPTION: TStringField;
    TblBankInfoDtlID: TBCDField;
    TblBankInfoDtlGLACCT_ID_CASH: TBCDField;
    TblBankInfoDtlLAST_CHECKNO: TBCDField;
    PkBankID: TBCDField;
    PkBankACCOUNT_NUMBER: TStringField;
    PkBankDESCRIPTION: TStringField;
    PkBankLAST_CHECKNO: TBCDField;
    TblVendor: TFDTable;
    TblPrePostVendor: TStringField;
    TblPrePostVAddr1: TStringField;
    TblPrePostVAddr2: TStringField;
    TblPrePostVCity: TStringField;
    TblPrePostVState: TStringField;
    TblPrePostVZip: TStringField;
    SrcQryprepostCheck: TDataSource;
    QryPrePostCheck: TFDQuery;
    QryPrePostCheckCDPREPOST_ID: TBCDField;
    QryPrePostCheckAMOUNT_PAID: TFMTBCDField;
    QryPrePostCheckDISCOUNT_TAKEN: TFMTBCDField;
    TblPrePostDisc_taken: TFloatField;
    TblPrePostCheck_Amount: TFloatField;
    TblPrePostVCityStateZip: TStringField;
    TblArCusto: TFDTable;
    TblPrePostCustomer: TStringField;
    TblPrePostCAddr1: TStringField;
    TblPrePostCAddr2: TStringField;
    TblPrePostCCity: TStringField;
    TblPrePostCState: TStringField;
    TblPrePostCZip: TStringField;
    TblPrePostCcityStateZip: TStringField;
    TblPrePostPRINT: TStringField;
    TblPrePostCtrlOUTLOOK_DATE: TDateTimeField;
    SrcCtrlTotal: TDataSource;
    QryCtrlTotal: TFDQuery;
    QryCtrlTotalCDPREPOST_CONTROL_ID: TBCDField;
    QryCtrlTotalTOTAL_INV: TFMTBCDField;
    QryCtrlTotalTOTAL_PAID: TFMTBCDField;
    QryCtrlTotalTOTAL_DISCOUNT: TFMTBCDField;
    QryCtrlTotalINV_AMOUNT_PAID: TFMTBCDField;
    QryCtrlTotalINV_BALANCE: TFMTBCDField;
    PkBatch: TIQWebHPick;
    PkBatchID: TBCDField;
    PkBatchCHECK_DATE: TDateTimeField;
    PkBatchOUTLOOK_DATE: TDateTimeField;
    SrcPrePostPr: TDataSource;
    SrcPrePostDtl: TDataSource;
    wwGLAcct: TFDTable;
    TblPrePostCtrlGlAcct_Id_Cash: TFloatField;
    PkBankACCT: TStringField;
    PkBankDESCRIP: TStringField;
    TblPrePostCtrlGlAcct: TStringField;
    QryPrePostPr: TFDQuery;
    QryPrePostPrID: TBCDField;
    QryPrePostPrCDPREPOST_CONTROL_ID: TBCDField;
    QryPrePostPrPRINT: TStringField;
    QryPrePostPrCHECK_TYPE: TStringField;
    TblPrePostREMIT_TO_ID: TBCDField;
    QryRemitto: TFDQuery;
    QryRemittoID: TBCDField;
    QryRemittoVENDOR_ID: TBCDField;
    QryRemittoATTN: TStringField;
    QryRemittoADDR1: TStringField;
    QryRemittoADDR2: TStringField;
    QryRemittoADDR3: TStringField;
    QryRemittoCITY: TStringField;
    QryRemittoSTATE: TStringField;
    QryRemittoZIP: TStringField;
    QryRemittoCURRENCY_ID: TStringField;
    QryRemittoPHONE_NUMBER: TStringField;
    QryRemittoFAX_NUMBER: TStringField;
    QryRemittoPRIME_CONTACT: TStringField;
    QryRemittoCOUNTRY: TStringField;
    TblPrePostRemitto2: TStringField;
    PkAcctTYPE: TStringField;
    TblPrePostCtrlBATCH_TYPE: TStringField;
    TblPrePostCtrlCURRENCY_ID: TBCDField;
    tblCurrency: TFDTable;
    tblCurrency2: TFDTable;
    TblPrePostCtrlCurrency: TStringField;
    PkAllInv: TIQWebHPick;
    PkAllInvID: TBCDField;
    PkAllInvVENDOR_ID: TBCDField;
    PkAllInvON_HOLD: TStringField;
    PkAllInvINVOICE_NO: TStringField;
    PkAllInvINVOICE_AMOUNT: TBCDField;
    PkAllInvTERMS_ID: TBCDField;
    PkAllInvINVOICE_DATE: TDateTimeField;
    PkAllInvDUE_DATE: TDateTimeField;
    PkAllInvDISCOUNT_DAYS: TFMTBCDField;
    PkAllInvDISCOUNT: TFMTBCDField;
    PkAllInvAMOUNT_PAID: TFMTBCDField;
    PkAllInvDISCOUNT_TAKEN: TFMTBCDField;
    PkAllInvAMOUNT_TO_PAY: TFMTBCDField;
    PkAllInvCURRENT_DISCOUNT: TFMTBCDField;
    PkAllInvREMIT_TO_ID: TBCDField;
    PkAllInvREMIT_TO_ATTN: TStringField;
    PkAllInvDISC_DATE: TDateTimeField;
    PkAllInvCURR_CODE: TStringField;
    PkAllInvCURRENCY_DESCRIP: TStringField;
    PkAllInvCOMPANY: TStringField;
    QryPrePostPrMISC_PAYTO: TStringField;
    PKCDPrepost: TIQWebHPick;
    PKCDPrepostID: TBCDField;
    PKCDPrepostCHECK_NO: TFMTBCDField;
    PKCDPrepostVENDOR_ID: TBCDField;
    PKCDPrepostPAYEE: TStringField;
    PKCDPrepostADDR1: TStringField;
    PKCDPrepostADDR2: TStringField;
    PKCDPrepostCITY: TStringField;
    PKCDPrepostSTATE: TStringField;
    PKCDPrepostZIP: TStringField;
    QryPrePostPrAMOUNT_PAID: TFMTBCDField;
    wwQryGLAcct: TFDQuery;
    wwQryGLAcctACCT: TStringField;
    wwQryGLAcctDESCRIP: TStringField;
    wwQryGLAcctTYPE: TStringField;
    wwQryGLAcctID: TBCDField;
    wwQryGLAcctGL_SUBACCT_TYPE_ID: TBCDField;
    wwQryGLAcctMAJORTYPE: TStringField;
    wwQryGLAcctECODE: TStringField;
    wwQryGLAcctEID: TBCDField;
    wwQryGLAcctEDATE_TIME: TDateTimeField;
    wwQryGLAcctECOPY: TStringField;
    wwQryGLAcctOLD_SPOT_RATE: TFMTBCDField;
    wwQryGLAcctNEW_SPOT_RATE: TFMTBCDField;
    wwQryGLAcctFX_ACCT_ID: TBCDField;
    wwQryGLAcctFX_OFFSET_ACCT_ID: TBCDField;
    wwQryGLAcctEEXCLUDE: TStringField;
    QryPrepostDtl: TFDQuery;
    USPrepostDtl: TFDUpdateSQL;
    QryPrepostDtlID: TBCDField;
    QryPrepostDtlCDPREPOST_ID: TBCDField;
    QryPrepostDtlAMOUNT_PAID: TBCDField;
    QryPrepostDtlAPINVOICE_ID: TBCDField;
    QryPrepostDtlAP_DISCOUNT_TAKEN: TBCDField;
    QryPrepostDtlGLACCT_ID_AP_DISC: TBCDField;
    QryPrepostDtlGLACCT_ID_MISC_EXPENSE: TBCDField;
    QryPrepostDtlINVOICE_NO: TStringField;
    QryPrepostDtlAMOUNT_TO_PAY: TFMTBCDField;
    QryPrepostDtlDUE_DATE: TDateTimeField;
    QryPrepostDtlDISC_DATE: TDateTimeField;
    QryPrepostDtlCURRENT_DISCOUNT: TFMTBCDField;
    QryPrepostDtlAcctMisc: TStringField;
    QryPrepostDtlAcctDisc: TStringField;
    TblPrePostVendorNo: TStringField;
    QryPrePostPrCOMPREMITTO: TStringField;
    QryPrePostPrCHECK_AMOUNT: TFMTBCDField;
    QryPrePostPrORDER_SEQ: TBCDField;
    TblPrePostEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    PKCDPrepostEPLANT_ID: TBCDField;
    wwQryGLAcctEPLANT_ID: TBCDField;
    TblPrePostCtrlEPLANT_ID: TBCDField;
    TblPrePostCtrlEPlant_Name: TStringField;
    QryPrepostDtlREF_NO: TStringField;
    QryPrepost: TFDQuery;
    QryPrepostID: TBCDField;
    QryPrepostCDPREPOST_CONTROL_ID: TBCDField;
    QryPrepostCHECK_NO: TBCDField;
    QryPrepostVENDOR_ID: TBCDField;
    QryPrepostARCUSTO_ID: TBCDField;
    QryPrepostEMPLOYEE_ID: TBCDField;
    QryPrepostMISC_PAYTO: TStringField;
    QryPrepostMISC_ADDR1: TStringField;
    QryPrepostMISC_ADDR2: TStringField;
    QryPrepostMISC_CITY: TStringField;
    QryPrepostMISC_STATE: TStringField;
    QryPrepostMISC_ZIP: TStringField;
    QryPrepostCHECK_TYPE: TStringField;
    QryPrepostPRINT: TStringField;
    QryPrepostREMIT_TO_ID: TBCDField;
    QryPrepostEPLANT_ID: TBCDField;
    QryPrepostVENDOR: TStringField;
    QryPrepostVADDR1: TStringField;
    QryPrepostVADDR2: TStringField;
    QryPrepostVCITY: TStringField;
    QryPrepostVSTATE: TStringField;
    QryPrepostVZIP: TStringField;
    QryPrepostVENDORNO: TStringField;
    QryPrepostDISC_TAKEN: TFMTBCDField;
    QryPrepostCHECK_AMOUNT: TFMTBCDField;
    QryPrepostCUSTOMER: TStringField;
    QryPrepostCADDR1: TStringField;
    QryPrepostCADDR2: TStringField;
    QryPrepostCCITY: TStringField;
    QryPrepostCSTATE: TStringField;
    QryPrepostCZIP: TStringField;
    QryPrepostVCityStateZip: TStringField;
    QryPrepostCcityStateZip: TStringField;
    QryPrepostPayTo: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    QryPrepostREMITTO: TStringField;
    TblPrePostCtrlEFT: TStringField;
    QryPrepostCURRENCY_ID: TBCDField;
    QryPrepostEXCHANGE_RATE: TFMTBCDField;
    QryPrepostCURR_CODE: TStringField;
    QryPrepostCURR_DESCRIP: TStringField;
    TblCurremcy2: TFDTable;
    TblPrePostCtrlSpotRate: TFloatField;
    QryPrepostSPOTRATE: TFMTBCDField;
    QryCtrlTotalTOTAL_INV_EX: TFMTBCDField;
    QryCtrlTotalTOTAL_PAID_EX: TFMTBCDField;
    QryCtrlTotalTOTAL_DISCOUNT_EX: TFMTBCDField;
    QryCtrlTotalINV_AMOUNT_PAID_EX: TFMTBCDField;
    QryCtrlTotalINV_BALANCE_EX: TFMTBCDField;
    QryPrePostPrAMOUNT_PAID_EX: TFMTBCDField;
    QryPrePostPrCHECK_AMOUNT_EX: TFMTBCDField;
    QryPrepostCHECK_AMOUNT_EX: TFMTBCDField;
    QryPrepostDtlAMOUNT_PAID_EX: TFMTBCDField;
    QryPrepostDtlAP_DISCOUNT_TAKEN_EX: TFMTBCDField;
    QryPrepostDtlAMOUNT_TO_PAY_EX: TFMTBCDField;
    QryPrepostDtlCURRENT_DISCOUNT_EX: TFMTBCDField;
    TblBankInfoDtlGLACCT_ID_SUSPENSE: TBCDField;
    TblBankInfoDtlEFT: TStringField;
    TblPrePostCtrlGlAcctIdSusp: TFloatField;
    TblPrePostCtrlGlacctSusp: TStringField;
    TblPrePostCtrlGlAcctAbs: TStringField;
    tblCurrencyID: TBCDField;
    tblCurrencyCURR_CODE: TStringField;
    tblCurrencyDESCRIP: TStringField;
    tblCurrencyGLVALUE: TStringField;
    tblCurrencySPOT_RATE: TFMTBCDField;
    tblCurrencyCURR_SYMBOL: TStringField;
    tblCurrencyECODE: TStringField;
    tblCurrencyEID: TBCDField;
    tblCurrencyEDATE_TIME: TDateTimeField;
    tblCurrencyECOPY: TStringField;
    tblCurrencyNATIVE_CURR: TStringField;
    tblCurrency2ID: TBCDField;
    tblCurrency2CURR_CODE: TStringField;
    tblCurrency2DESCRIP: TStringField;
    tblCurrency2GLVALUE: TStringField;
    tblCurrency2SPOT_RATE: TFMTBCDField;
    tblCurrency2CURR_SYMBOL: TStringField;
    tblCurrency2ECODE: TStringField;
    tblCurrency2EID: TBCDField;
    tblCurrency2EDATE_TIME: TDateTimeField;
    tblCurrency2ECOPY: TStringField;
    tblCurrency2NATIVE_CURR: TStringField;
    QryCurrency: TFDQuery;
    QryCurrencyDESCRIP: TStringField;
    QryCurrencySPOT_RATE: TFMTBCDField;
    QryCurrencyCURR_CODE: TStringField;
    QryCurrencyGLVALUE: TStringField;
    QryCurrencyCURR_SYMBOL: TStringField;
    QryCurrencyNATIVE_CURR: TStringField;
    QryCurrencyID: TBCDField;
    QryCurrencyECODE: TStringField;
    QryCurrencyEID: TBCDField;
    QryCurrencyEDATE_TIME: TDateTimeField;
    QryCurrencyECOPY: TStringField;
    QryCurrency2: TFDQuery;
    StringField1: TStringField;
    FloatField1: TFMTBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField2: TBCDField;
    StringField6: TStringField;
    FloatField3: TBCDField;
    DateTimeField1: TDateTimeField;
    StringField7: TStringField;
    TblPrePostCtrlAP_REMITTANCE_TYPE: TStringField;
    PkBankEPLANT_ID: TBCDField;
    PkQCurr: TIQWebHPick;
    PkQCurrCURR_CODE: TStringField;
    QryPrepostCOMMENT1: TStringField;
    QryPrepostDtlON_ACCT: TStringField;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    PkVendorCOMPANY: TStringField;
    PkVendorCITY: TStringField;
    PkVendorSTATE: TStringField;
    PkVendorZIP: TStringField;
    PkVendorID: TBCDField;
    PkVendorADDR1: TStringField;
    PkVendorADDR2: TStringField;
    PkVendorADDR3: TStringField;
    PkVendorPK_HIDE: TStringField;
    PkVendorCUSER1: TStringField;
    QryPrepostDtlCUSER1: TStringField;
    QryPrepostDtlCUSER2: TStringField;
    QryPrepostDtlCUSER3: TStringField;
    TblPrePostCtrlINTL_PAY_TYPE: TStringField;
    QryINTL_Pay_type: TFDQuery;
    QryINTL_Pay_typeINTL_PAY_TYPE: TStringField;
    QryPrepostDtlAcctMiscDesc: TStringField;
    QryPrepostDtlAcctDiscDesc: TStringField;
    wwQryGLAcctDisc: TFDQuery;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField4: TBCDField;
    FloatField5: TBCDField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField6: TBCDField;
    DateTimeField2: TDateTimeField;
    StringField13: TStringField;
    FloatField7: TFMTBCDField;
    FloatField8: TFMTBCDField;
    FloatField9: TBCDField;
    FloatField10: TBCDField;
    StringField14: TStringField;
    FloatField11: TBCDField;
    PkAcctEPLANT_ID: TBCDField;
    QryBankAcount: TFDQuery;
    QryBankAcountID: TBCDField;
    QryBankAcountACCOUNT_NUMBER: TStringField;
    QryBankAcountDESCRIPTION: TStringField;
    QryBankAcountLAST_CHECKNO: TBCDField;
    QryBankAcountEPLANT_ID: TBCDField;
    QryBankAcountACCT: TStringField;
    QryBankAcountDESCRIP: TStringField;
    PkBatchBANK_ACCOUNT: TStringField;
    PkBatchGL_ACCOUNT: TStringField;
    PkBatchGL_PERIOD: TBCDField;
    PkBatchSTART_DATE: TDateTimeField;
    PkBatchEND_DATE: TDateTimeField;
    PkBatchCURRENCY: TStringField;
    PkBatchEFT: TStringField;
    PkBatchREMITTANCE_TYPE: TStringField;
    PkBatchEPLANT_ID: TBCDField;
    QryPrePostPrCHECK_NO: TStringField;
    QryPrePostPrREMIT_TO_CD_CHECK_REPNAME: TStringField;
    QryPrePostPrVENDOR_CD_CHECK_REPNAME: TStringField;
    QryPrePostPrVENDORNO: TStringField;
    ViewApInvoiceCheck: TFDQuery;
    ViewCdPrepostCheck: TFDQuery;
    procedure TblPrePostCtrlBeforeDelete(DataSet: TDataSet);
    procedure QryPrePostPrCalcFields(DataSet: TDataSet);
    procedure PKCDPrepostBeforeOpen(DataSet: TDataSet);
    procedure QryPrepostDtlAfterDelete(DataSet: TDataSet);
    procedure QryPrepostDtlBeforeEdit(DataSet: TDataSet);
    procedure QryPrepostDtlBeforePost(DataSet: TDataSet);
    procedure QryPrepostDtlBeforeDelete(DataSet: TDataSet);
    procedure QryPrepostAfterDelete(DataSet: TDataSet);
    procedure QryPrepostBeforeDelete(DataSet: TDataSet);
    procedure QryPrepostBeforeEdit(DataSet: TDataSet);
    procedure QryPrepostBeforeOpen(DataSet: TDataSet);
    procedure QryPrepostCalcFields(DataSet: TDataSet);
    procedure QryPrepostBeforeScroll(DataSet: TDataSet);
    procedure TblPrePostCtrlBeforeScroll(DataSet: TDataSet);
    procedure QryPrepostAfterPost(DataSet: TDataSet);
    procedure TblPrePostCtrlCalcFields(DataSet: TDataSet);
    procedure tblCurrencyBeforeOpen(DataSet: TDataSet);
    procedure tblCurrency2BeforeOpen(DataSet: TDataSet);
    procedure QryPrepostDtlBeforeOpen(DataSet: TDataSet);
    procedure QryPrepostDtlCalcFields(DataSet: TDataSet);
    procedure TblPrePostCtrlAP_REMITTANCE_TYPEValidate(Sender: TField);
  private
    { Private declarations }
    FDiscount:Real;
    procedure PostVoidChecks;
    procedure PostVoidCheck(nId:Real);
    procedure RememberNextId;
  public
    { Public declarations }
    FId:Real;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  CD_Main,
  IQMS.Common.NLS,
  cd_rscstr,
  CDConfAmount;

procedure TCD_DM.TblPrePostCtrlBeforeDelete(DataSet: TDataSet);
var
  nChecks:Integer;
  AStr:String;
begin
  nChecks  := Trunc(SelectValueFmtAsFloat('select Count(id) from cdprepost ' +
                              'where print = ''Y'' and NVL(check_no, 0) <> 0 and NVL(check_type, ''*'') <> ''NONGL'' ' +
                              'and cdprepost_control_id = %f',
                              [TblPrePostCtrl.FieldByName('ID').asFloat]));

   {cTXT0000001 = 'One check in this group was printed and will be void if ' +
    'deleted.  Proceed with deletion?';
   cTXT0000002 = '%d checks in this group were printed and will be void if ' +
    'deleted.  Proceed with deletion?';}
  if nChecks = 1 then
    AStr := cd_rscstr.cTXT0000001
  else if nChecks > 1 then
    AStr := Format(cd_rscstr.cTXT0000002, [nChecks]);

  if nChecks > 0 then
  begin
    if not IQConfirmYN(AStr) then Abort;
    PostVoidChecks;
  end;
end;

procedure TCD_DM.PostVoidChecks;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select id from cdprepost ' +
                   'where print = ''Y'' and NVL(check_no, 0) <> 0 ' +
                   'and cdprepost_control_id = %f',
                              [TblPrePostCtrl.FieldByName('ID').asFloat]));
    Open;
    while not eof do
    begin
      PostVoidCheck(FieldByName('ID').asFloat);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TCD_DM.PostVoidCheck(nId:Real);
var
  nChequeId:Real;
begin
   nChequeId  := GetNextID('CHEQUE');

  ExecuteCommand(IQFormat('insert into cheque ' +
         '(check_no, ' +
         'vendor_id, ' +
         'arcusto_id, ' +

         'employee_id, ' +
         'misc_payto, ' +
         'misc_addr1, ' +
         'misc_addr2, ' +
         'misc_city, ' +
         'misc_state, ' +
         'misc_zip, ' +
         'check_type, ' +
         'void_reason, ' +
         'check_status, ' +
         'check_date, ' +
         'bankinfo_dtl_id, ' +
         'glperiods_id_cd, ' +
         'id) ' +
         'select ' +
         'check_no, ' +
         'vendor_id, ' +
         'arcusto_id, ' +
         'employee_id, ' +
         'misc_payto, ' +
         'misc_addr1, ' +
         'misc_addr2, ' +
         'misc_city, ' +
         'misc_state, ' +
         'misc_zip, ' +
         'check_type, ' +
         '''DELETE CHECK'', ' +
         '''VOID'', ' +
         'To_Date(''%s'', ''MM/DD/RRRR''), ' +
         '%f, ' +
         '%f, ' +
         '%f ' +
         'from cdprepost where id = %f',
         [FormatDateTime('mm/dd/yyyy', TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime),
          TblPrePostCtrl.FieldByName('bankinfo_dtl_id').asFloat,
          TblPrePostCtrl.FieldByName('glperiods_id').asFloat,
          nChequeId,
          nId]));

  ExecuteCommand(IQFormat('insert into cheque_detail ' +
         '(amount_paid, ' +
         'apinvoice_id, ' +
         'ap_discount_taken, ' +
         'glacct_id_ap_disc, ' +
         'glacct_id_misc_expense, ' +
         'cheque_id) ' +
         'select ' +
         'amount_paid, ' +
         'apinvoice_id, ' +
         'ap_discount_taken, ' +
         'glacct_id_ap_disc, ' +
         'glacct_id_misc_expense, ' +
         '%f ' +
         'from cdprepost_detail where cdprepost_id = %f',
         [nChequeId, nId]));
end;



procedure TCD_DM.QryPrePostPrCalcFields(DataSet: TDataSet);
begin
//  with QryPrePostPr do
//    if Trim(FieldByName('RemitTo').asString) = '' then
//      FieldByName('CompRemitTo').asString := FieldByName('MISC_PAYTO').asString
//    else
//      FieldByName('CompRemitTo').asString := FieldByName('RemitTo').asString;
end;

procedure TCD_DM.PKCDPrepostBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', TblPrePostCtrl.FieldByName('ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := TblPrePostCtrl.FieldByName('ID').asFloat;
  IQAssignEPlantFilter( DataSet );  {pas}
  Dataset.Filtered := True;
end;

procedure TCD_DM.QryPrepostDtlAfterDelete(DataSet: TDataSet);
var
  AId:Real;
begin
  TFrmCD(Owner).OnAcct.Checked := false;
{
  try
    QryPrepostDtl.DataBase.ApplyUpdates( [ QryPrepostDtl ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryPrepostDtl.Close;
      QryPrepostDtl.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
  AId := QryPrePostDtlID.asFloat;
  QryPrepostDtl.Close;
  QryPrepostDtl.Open;
  QryPrePostDTL.Locate('ID', AId, []);


  if (QryPrepostDtlON_ACCT.asString = 'Y')
    and (QryPrepostCURRENCY_ID.asFloat = 0)
    and ( SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'N' )
    and ( SelectValueAsFloat('select currency_id from iqsys where rownum < 2') <> 0 ) then
  begin
    ExecuteCommandFmt('update cdprepost set currency_id = %f where id = %f',
         [SelectValueAsFloat('select currency_id from iqsys where rownum < 2'), QryPrepostID.asFloat]);

    AId := QryPrePostID.asFloat;
    QryPrePost.AfterPost(nil);
    QryPrePost.Close;
    QryPrePost.Open;
    QryPrePost.Locate('ID', AId, []);
  end;

  ViewCDPrepostCheck.Close;
  ViewCDPrepostCheck.Open;

end;

procedure TCD_DM.QryPrepostDtlBeforeEdit(DataSet: TDataSet);
var
  APrepostId:Real;
begin
  if QryPrePost.State in [dsInsert] then
  begin
    AprepostId := GetNextID('CDPREPOST');
    QryPrePostID.AsFloat := AprepostId;
    FDiscount := QryPrepostDtlAP_DISCOUNT_TAKEN.AsFloat;
    QryPrepost.CheckBrowseMode;
    QryPrepost.Locate('ID', AprepostId, []);
  end
  else
  begin
    FDiscount := QryPrepostDtlAP_DISCOUNT_TAKEN.AsFloat;
    QryPrepost.CheckBrowseMode;
  end;
//  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TCD_DM.QryPrepostDtlBeforePost(DataSet: TDataSet);
var
  AConfirm:Integer;
begin
  with TFDTable(DataSet) do
    if MasterSource <> nil then
      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
         // 'Parent record not found.  Please assign a parent record.'
         raise Exception.Create(cd_rscstr.cTXT0000003);

  if TFrmCD(Owner).OnAcct.Checked  and (QryPrepostDtlAP_DISCOUNT_TAKEN.asFloat <> 0) then
    raise Exception.Create('Discounts not allowed for On Acct. or Misc entries.');
//  if (DM.QryCrPrePostDetail.FieldByName('ONACCT').asString = 'Y') and (DM.QryCrPrePostDetail.FieldByName('DISCOUNT_APPLIED').asFloat <> 0) then
//    raise Exception.Create('Discounts not allowed for On Acct. or Misc entries.');


  if (QryPrepostDtlAMOUNT_PAID.asFloat > QryPrepostDtlAMOUNT_TO_PAY.asFloat) and
     (QryPrepostDtlAPINVOICE_ID.asFloat <> 0) and
     ((QryPrepostDtlAMOUNT_PAID.asFloat - QryPrepostDtlAMOUNT_TO_PAY.asFloat) > 0.00999999) then
  begin
    (* TODO -ombaral -cWEBIQ : Dependency
    AConfirm := IQDialogChkEx( TCheckAmountPaid, cd_rscstr.cTXT0000084, 'CD_ConfirmAmountPaid' );
    *)
    if AConfirm <> 1 then
      raise Exception.Create(cd_rscstr.cTXT0000085);
  end;

  if (QryPrePostPRINT.asString = 'Y') and (QryPrePostCHECK_NO.asString  <> '') and
       (QryPrepost.FieldByName('CHECK_TYPE').asString <> 'NONGL') then
     // 'Cannot add or modify invoices of a printed check.'
     raise Exception.Create(cd_rscstr.cTXT0000004);

  with QryPrepostDtl do
  begin
    if (FieldByName('GLACCT_ID_AP_DISC').asFloat = 0) and
       (FieldByName('APINVOICE_ID').asFloat <> 0) and
       (FieldByName('AP_DISCOUNT_TAKEN').asFloat <> 0) then
       // 'An expense account must be assigned to the discount.'
       raise Exception.Create(cd_rscstr.cTXT0000005);

    if (FieldByName('GLACCT_ID_MISC_EXPENSE').asFloat = 0) and
       (FieldByName('APINVOICE_ID').asFloat = 0) and
       (QryPrepost.FieldByName('CHECK_TYPE').asString <> 'NONGL') then
       // 'An expense account must be assigned to the miscellaneous disbursement.'
       raise Exception.Create(cd_rscstr.cTXT0000006);

//    if (FieldByName('GLACCT_ID_AP_DISC').asFloat <> 0) and (SelectValueAsString('select multicurrency from iqsys') = 'Y') then
//      AssignMC_GLACCT_ID_AP_DISC;
  end;

  if (not TFrmCD(Owner).OnAcct.Checked) and  (QryPrepostDtlON_ACCT.asString <> 'Y') then
  begin
    QryPrepostDtlON_ACCT.ReadOnly := false;
    QryPrepostDtlON_ACCT.asString := 'N';
    QryPrepostDtlON_ACCT.ReadOnly := true;
  end;
end;

procedure TCD_DM.QryPrepostDtlBeforeDelete(DataSet: TDataSet);
begin
  if (QryPrePostPRINT.asString = 'Y') and (QryPrePostCHECK_NO.asString  <> '') and
       (QryPrepost.FieldByName('CHECK_TYPE').asString <> 'NONGL') then
     // 'Cannot delete invoices from a printed check.'
    raise Exception.Create(cd_rscstr.cTXT0000007);
end;

procedure TCD_DM.QryPrepostAfterDelete(DataSet: TDataSet);
begin
{
  try
    QryPrepost.DataBase.ApplyUpdates( [ QryPrepost ]);
    TblPrePostCtrl.Refresh;
//    QryCtrlTotal.Close;
//    QryCtrlTotal.Open;
  except on E:Exception do
    begin
      Application.ShowException(E);
      System.SysUtils.ABORT;
    end;
  end;
}
  QryPrepost.Locate('ID', FId, []);
end;

procedure TCD_DM.QryPrepostBeforeDelete(DataSet: TDataSet);
begin
  RememberNextId;
  QryPrepostDtl.Cancel;
  with QryPrepost do
    if (FieldByName('PRINT').asString = 'Y') and
       (FieldByName('CHECK_NO').asInteger <> 0) and
       (QryPrepost.FieldByName('CHECK_TYPE').asString <> 'NONGL') then
       //'Cannot delete.  Vendor has printed checks.'
      raise Exception.Create(cd_rscstr.cTXT0000008);
end;

procedure TCD_DM.RememberNextId;
var
  AMove:Integer;
begin
  with QryPrepost do
  try
    DisableControls;
    BeforeScroll := nil;
    Next;
    AMove := 1;
    if eof then
    begin
      Prior;
      AMove := -1;
      if Bof then
      begin
        Next;
        AMove := 0;
      end;
    end;
    FId := QryPrepostID.asFloat;
    if AMove = 1 then Prior
    else if AMove = -1 then Next;
  finally
    EnableControls;
    BeforeScroll := QryPrepostBeforeScroll;
  end;
end;

procedure TCD_DM.QryPrepostBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TCD_DM.QryPrepostBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TCD_DM.QryPrepostCalcFields(DataSet: TDataSet);
begin
  with QryPrePost do
  begin
    if FieldByName('VENDOR_ID').asFloat <> 0 then
    begin
      FieldByName('VCityStateZip').asString :=
       ConcatCityStateZip(FieldByName('VCity').asString,
                                FieldByName('VState').asString,
                                FieldByName('VZip').asString);
      FieldByName('PayTo').asString := FieldByName('Vendor').asString;
    end
    else if FieldByName('ARCUSTO_ID').asFloat <> 0 then
    begin
      FieldByName('CCityStateZip').asString :=
       ConcatCityStateZip(FieldByName('CCity').asString,
                                FieldByName('CState').asString,
                                FieldByName('CZip').asString);
      FieldByName('PayTo').asString := FieldByName('Customer').asString;
    end
    else FieldByName('PayTo').asString := FieldByName('Misc_PayTo').asString;

  end;
end;

procedure TCD_DM.QryPrepostBeforeScroll(DataSet: TDataSet);
begin
//  if (QryPrePostDtl.state in [dsEdit]) and (QryPrePostPRINT.asString = 'Y') and (QryPrePostCHECK_NO.asString  <> '') then
//    raise Exception.Create('Cannot add or modify invoices of a printed check.');
  QryPrePostDtl.CheckBrowseMode;
end;

procedure TCD_DM.TblPrePostCtrlBeforeScroll(DataSet: TDataSet);
begin
  QryPrePostDtl.CheckBrowseMode;
end;

procedure TCD_DM.QryPrepostAfterPost(DataSet: TDataSet);
begin
//  try
//    QryPrepost.DataBase.ApplyUpdates( [ QryPrepost ]);
    TblPrePostCtrl.Refresh;
    if (TFrmCD(Owner).FPrepostId <> 0) and  (QryPrepost.State = dsBrowse) then
      QryPrepost.Locate('ID', TFrmCD(Owner).FPrepostId, []);

//  except on E:Exception do
//    begin
//      Application.ShowException(E);
//      System.SysUtils.ABORT;
//    end;
//  end;
end;

procedure TCD_DM.TblPrePostCtrlCalcFields(DataSet: TDataSet);
var
  AGlAcct:String;
begin
  if TblPrePostCtrlEFT.asString = 'Y' then
    AGlAcct := SelectValueFmtAsString('select a.acct from BANKINFO_DTL d, glacct a where d.id = %f and d.GLACCT_ID_SUSPENSE = a.id', [TblPrePostCtrlBANKINFO_DTL_ID.asFloat])
  else
    AGlAcct := SelectValueFmtAsString('select a.acct from BANKINFO_DTL d, glacct a where d.id = %f and d.GLACCT_ID_CASH = a.id', [TblPrePostCtrlBANKINFO_DTL_ID.asFloat]);
  TblPrePostCtrlGlAcctAbs.asString := AGlAcct;
  if TblPrePostCtrlGlAcctAbs.asString = '' then
  begin
    AGlAcct := SelectValueFmtAsString('select a.acct from BANKINFO_DTL d, glacct a where d.id = %f and d.GLACCT_ID_CASH = a.id', [TblPrePostCtrlBANKINFO_DTL_ID.asFloat]);
    TblPrePostCtrlGlAcctAbs.asString := AGlAcct;
  end;

end;

procedure TCD_DM.tblCurrencyBeforeOpen(DataSet: TDataSet);
begin
//  IQAssignNativeCurrencyFilter(DataSet);
end;

procedure TCD_DM.tblCurrency2BeforeOpen(DataSet: TDataSet);
begin
  IQAssignNativeCurrencyFilter(DataSet);
end;

procedure TCD_DM.QryPrepostDtlBeforeOpen(DataSet: TDataSet);
var
  AStr:String;
begin
  AStr := SelectValueAsString('select user_text from userdef where parent_name = ''FrmAp'' and component_name = ''IQUserDefLabel1''');
  if AStr <> '' then
    QryPrepostDtlCUSER1.DisplayLabel := AStr;

  AStr := SelectValueAsString('select user_text from userdef where parent_name = ''FrmAp'' and component_name = ''IQUserDefLabel2''');
  if AStr <> '' then
    QryPrepostDtlCUSER2.DisplayLabel := AStr;

  AStr := SelectValueAsString('select user_text from userdef where parent_name = ''FrmAp'' and component_name = ''IQUserDefLabel3''');
  if AStr <> '' then
    QryPrepostDtlCUSER3.DisplayLabel := AStr;


end;

procedure TCD_DM.QryPrepostDtlCalcFields(DataSet: TDataSet);
begin
  QryPrepostDtlAcctMiscDesc.asString := SelectValueFmtAsString('select descrip from glacct where id = %f', [QryPrepostDtlGLACCT_ID_MISC_EXPENSE.asFloat]);
  QryPrepostDtlAcctDiscDesc.asString := SelectValueFmtAsString('select descrip from glacct where id = %f', [QryPrepostDtlGLACCT_ID_AP_DISC.asFloat]);
  QryPrepostDtlAcctMisc.asString := SelectValueFmtAsString('select acct from glacct where id = %f', [QryPrepostDtlGLACCT_ID_MISC_EXPENSE.asFloat]);
end;                                               

procedure TCD_DM.TblPrePostCtrlAP_REMITTANCE_TYPEValidate(Sender: TField);
var
  ACount:Integer;
begin
  ACount := Trunc(SelectValueFmtAsFloat('select count(id) from cdprepost where cdprepost_control_id = %f',
                  [TblPrePostCtrlID.asFloat]));
//  if ACount <> 0 then Abort;
  if ACount <> 0 then
     // 'This group has details.  Cannot edit Remittance Type.'
    raise Exception.Create(cd_rscstr.cTXT0000043);
end;

end.


