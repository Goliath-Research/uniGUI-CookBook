unit inv_main;

interface

Uses
  Data.DB,
  MainModule,
  DM_AR,
  DBCtrls,
 // DropBtn,
  FireDAC.Comp.Client, 
  FireDAC.Comp.DataSet, 
  FireDAC.DApt, 
  FireDAC.DApt.Intf, 
  FireDAC.DatS, 
  FireDAC.Phys, 
  FireDAC.Phys.Intf, 
  FireDAC.Stan.Async, 
  FireDAC.Stan.Error, 
  FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, 
  FireDAC.Stan.Param, 
 // Iqhpick,
 // IQMS.WebVcl.Hpick,
  System.Classes, 
  System.SysUtils, 
  System.Variants, 
//  Vcl.Buttons,
//  Vcl.Controls,
//  Vcl.DBGrids,
//  Vcl.Grids,
//  Vcl.Dialogs,
//  Vcl.Forms,
  Vcl.Graphics,
//  Vcl.Menus,
//  Vcl.Wwdatsrc,
//  Vcl.wwdbedit,
//  Vcl.Wwdbgrid,
//  Vcl.Wwdbigrd,
//  Vcl.Wwdotdot,
//  Winapi.Windows,
//  wwdblook,
//  wwriched,
//  vcl.Wwdbdatetimepicker,
 // IQUsrLbl,
  uniGUIBaseClasses, 
  uniGUIClasses, 
//  uniTabSheet,
  uniSplitter, 
  uniButton, 
  uniBitBtn, 
  uniSpeedButton,
  uniPanel, 
  uniPageControl, 
  uniMainMenu, 
  uniLabel, 
  uniGroupBox, 
  uniGUITypes, 
  uniGUIAbstractClasses, 
  uniGUIForm,
  uniGUIApplication, 
  uniEdit, 
  uniDBNavigator, 
  uniMemo, 
  uniDBMemo, 
  uniMultiItem, 
  uniListBox, 
  uniDBLookupComboBox, 
  uniBasicGrid, 
  uniDBGrid, 
  uniDBEdit, 
  uniCheckBox, 
  uniDBCheckBox, IQMS.WebVcl.HPick, uniDateTimePicker, uniDBDateTimePicker,
  IQMS.WebVcl.UserDefinedLabel, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame, Vcl.ExtCtrls, IQMS.WebVcl.DropDownButton,
  Vcl.Menus, Vcl.Forms, Vcl.Controls, vcl.wwdbgrid, uniToolBar, uniImageList;

const fPkAllInvSql = 'Select distinct a.glperiods_id_ar, ' +
                     'p.period, ' +
                     'p.start_date, ' +
                     'p.end_date ' +
                     'from arprepost a, ' +
                     'glperiods p ' +
                     'where a.glperiods_id_ar = p.id ';

type
  TPostingState = ( psNone, psInsert, psEdit, psDelete );

  TFrmInvoice = class(TUniFrame)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    Delete1: TUniMenuItem;
    Search1: TUniMenuItem;
    N2: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    N4: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    About1: TUniMenuItem;
    Options1: TUniMenuItem;
    Freight1: TUniMenuItem;
    PostInvoice1: TUniMenuItem;
    N1: TUniMenuItem;
    ViewPostedInvoices1: TUniMenuItem;
    SrcArPrePost: TDataSource;
    QryOrd: TFDQuery;
    QryOrdITEMNO: TStringField;
    QryOrdCUSTNO: TStringField;
    QryOrdQTYSHIPPED: TBCDField;
    QryOrdTOTAL_QTY_ORD: TBCDField;
    QryOrdUNIT_PRICE: TFMTBCDField;
    QryOrdTAX_CODE_ID: TBCDField;
    QryOrdARINVT_ID: TBCDField;
    QryOrdMISC_ITEM: TStringField;
    QryOrdTax: TFloatField;
    QryOrdORD_DETAIL_ID: TBCDField;
    QryOrdSHIPMENT_DTL_ID: TBCDField;
    QryOrdBACKORDER_QTY: TBCDField;
    QryOrdCOMM_PCT: TBCDField;
    QryOrdCLASS: TStringField;
    QryOrdREV: TStringField;
    QryOrdSALESPEOPLE_ID: TBCDField;
    QryOrdACCT_ID_SALES: TFMTBCDField;
    QryOrdCUMM_SHIPPED: TBCDField;
    QryOrdINVOICE_QTY: TFMTBCDField;
    QryShip: TFDQuery;
    QryShipITEMNO: TStringField;
    QryShipCUSTNO: TStringField;
    QryShipQTYSHIPPED: TBCDField;
    QryShipTOTAL_QTY_ORD: TBCDField;
    QryShipUNIT_PRICE: TFMTBCDField;
    QryShipTAX_CODE_ID: TBCDField;
    QryShipARINVT_ID: TBCDField;
    QryShipMISC_ITEM: TStringField;
    QryShipTax: TFloatField;
    QryShipORD_DETAIL_ID: TBCDField;
    QryShipSHIPMENT_DTL_ID: TBCDField;
    QryShipBACKORDER_QTY: TBCDField;
    QryShipCOMM_PCT: TBCDField;
    QryShipCLASS: TStringField;
    QryShipREV: TStringField;
    QryShipSALESPEOPLE_ID: TBCDField;
    QryShipACCT_ID_SALES: TFMTBCDField;
    QryShipCUMM_SHIPPED: TBCDField;
    QryShipINVOICE_QTY: TFMTBCDField;
    SrcQryOrd: TDataSource;
    PkCustomer: TIQWebHPick;
    PkCustomerARCUSTO_ID: TBCDField;
    PkCustomerCUSTNO: TStringField;
    PkCustomerCOMPANY: TStringField;
    PkCustomerADDR1: TStringField;
    PkCustomerADDR2: TStringField;
    PkCustomerCITY: TStringField;
    PkCustomerSTATE: TStringField;
    PkCustomerZIP: TStringField;
    PkArPrePost: TIQWebHPick;
    PkArPrePostID: TBCDField;
    PkArPrePostINVOICE_NO: TStringField;
    PkArPrePostINVOICE_DATE: TDateTimeField;
    PkArPrePostDUE_DATE: TDateTimeField;
    PkArPrePostCUSTNO: TStringField;
    PkArPrePostCOMPANY: TStringField;
    PkArPrePostATTN: TStringField;
    PkArPrePostSTART_DATE: TDateTimeField;
    PkArPrePostEND_DATE: TDateTimeField;
    PkArPrePostACCT: TStringField;
    ViewArPrepostDetailTotals: TFDQuery;
    SrcViewArPrePostDetailTotals: TDataSource;
    QryOrdINVOICED_QTY: TFMTBCDField;
    QryShipINVOICED_QTY: TBCDField;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PostAllInvoices1: TUniMenuItem;
    PkAllInvoices: TIQWebHPick;
    PkAllInvoicesGLPERIODS_ID_AR: TBCDField;
    PkAllInvoicesPERIOD: TBCDField;
    PkAllInvoicesSTART_DATE: TDateTimeField;
    PkAllInvoicesEND_DATE: TDateTimeField;
    Status1: TUniMenuItem;
    Terms1: TUniMenuItem;
    TaxCodes1: TUniMenuItem;
    SrcArPrePostDetail: TDataSource;
    wwTblSalesPeople: TFDTable;
    QryShipSHIPDATE: TDateTimeField;
    QryOrdSHIPDATE: TDateTimeField;
    ViewVoidedInvoices1: TUniMenuItem;
    QryShipSHIPPEDSOFAR: TFMTBCDField;
    QryOrdSHIPPEDSOFAR: TFMTBCDField;
    ViewCreditMemos1: TUniMenuItem;
    QryShipDESCRIP: TStringField;
    QryOrdDESCRIP: TStringField;
    N6: TUniMenuItem;
    InvoiceReport1: TUniMenuItem;
    N7: TUniMenuItem;
    Contents1: TUniMenuItem;
    QryOrdPENDING_INVOICED_QTY: TFMTBCDField;
    PkAcctTYPE: TStringField;
    QryInsArinvoice: TFDQuery;
    QryInsArinvoice_detail: TFDQuery;
    QryOrder: TFDQuery;
    SrcQryShip: TDataSource;
    QryOrdAR_INVOICED_QTY: TBCDField;
    QryShipAR_INVOICED_QTY: TFMTBCDField;
    BrowseGLBatches1: TUniMenuItem;
    N10: TUniMenuItem;
    ExternalExefile1: TUniMenuItem;
    N11: TUniMenuItem;
    N5: TUniMenuItem;
    QryCurrency: TFDQuery;
    tblInvCode: TFDTable;
    N12: TUniMenuItem;
    InvoiceCodes1: TUniMenuItem;
    TblComm: TFDTable;
    TblCommID: TBCDField;
    TblCommSALESPEOPLE_ID: TBCDField;
    TblCommCOMMISSION_PERCENT: TFMTBCDField;
    TblCommFirstName: TStringField;
    TblCommLastName: TStringField;
    TblCommSalesCode: TStringField;
    SrcComm: TDataSource;
    TblSales: TFDTable;
    TblSalesFIRST_NAME: TStringField;
    TblSalesLAST_NAME: TStringField;
    TblSalesID: TBCDField;
    TblSalesEMPLOYEE_ID: TBCDField;
    TblSalesSALES_CODE: TStringField;
    TblSalesVENDOR_ID: TBCDField;
    TblCommARPREPOST_DETAIL_ID: TBCDField;
    QryOrdORDERS_ID: TBCDField;
    QryOrdPONO: TStringField;
    SrcComments: TDataSource;
    QryComments: TFDQuery;
    QryCommentsSHIPMENT_DTL_ID: TBCDField;
    QryCommentsORDER_DTL_COMMENT: TStringField;
    QryCommentsSHIPMENT_DTL_COMMENT: TStringField;
    Debug1: TUniMenuItem;
    Show1: TUniMenuItem;
    Clear1: TUniMenuItem;
    QryShipAR_ORD_INVOICED_QTY: TFMTBCDField;
    QryShipPENDING_QTY: TFMTBCDField;
    QryShipTOTAL_QTY_INVOICED: TFMTBCDField;
    QryShipLEFT_TO_INVOICE: TFMTBCDField;
    wwMemo: TwwMemoDialog;
    N14: TUniMenuItem;
    AutoInvoice1: TUniMenuItem;
    wwQryGLAcct: TFDQuery;
    wwQryTax: TFDQuery;
    wwQryFreight: TFDQuery;
    wwQryCurrency: TFDQuery;
    wwQryTaxID: TBCDField;
    wwQryTaxTAX_CODE: TStringField;
    wwQryTaxTAX_CODE_DESC: TStringField;
    wwQryTaxTAX_RATE: TFMTBCDField;
    wwQryFreightID: TBCDField;
    wwQryFreightDESCRIP: TStringField;
    wwQryFreightGLACCT_ID_FREIGHT: TBCDField;
    wwQryFreightSCAC_IATA_CODE: TStringField;
    wwQryFreightCODE_QUALIFIER: TStringField;
    wwQryFreightTRANSPORT_CODE: TStringField;
    wwQryFreightECODE: TStringField;
    wwQryFreightEID: TBCDField;
    wwQryFreightEDATE_TIME: TDateTimeField;
    wwQryFreightECOPY: TStringField;
    wwQryCurrencyID: TBCDField;
    wwQryCurrencyCURR_CODE: TStringField;
    wwQryCurrencyDESCRIP: TStringField;
    wwQryCurrencyGLVALUE: TStringField;
    wwQryCurrencySPOT_RATE: TFMTBCDField;
    wwQryCurrencyCURR_SYMBOL: TStringField;
    wwQryCurrencyECODE: TStringField;
    wwQryCurrencyEID: TBCDField;
    wwQryCurrencyEDATE_TIME: TDateTimeField;
    wwQryCurrencyECOPY: TStringField;
    QryShipPRICE_PER_1000YN: TStringField;
    QryOrdPRICE_PER_1000YN: TStringField;
    SrcQryOrder: TDataSource;
    QryOrderPONO: TStringField;
    QryOrderORDERNO: TStringField;
    N17: TUniMenuItem;
    PostallforindividualUserID1: TUniMenuItem;
    PostallforallUsersID1: TUniMenuItem;
    PkArPrePostEPLANT_ID: TBCDField;
    PkArPrePostPRIOR_ENTRY: TStringField;
    QryOrdEPLANT_ID: TBCDField;
    PKCustomer2: TIQWebHPick;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    PKCustomer2EPLANT_ID: TBCDField;
    PkAcctEPLANT_ID: TBCDField;
    QryShipment: TFDQuery;
    SrcShipment: TDataSource;
    QryARPrepostDetail: TFDQuery;
    QryARPrepostDetailID: TBCDField;
    QryARPrepostDetailARPREPOST_ID: TBCDField;
    QryARPrepostDetailORD_DETAIL_ID: TBCDField;
    QryARPrepostDetailINVOICE_QTY: TBCDField;
    QryARPrepostDetailUNIT_PRICE: TFMTBCDField;
    QryARPrepostDetailGLACCT_ID_SALES: TBCDField;
    QryARPrepostDetailTAX_CODE_ID: TBCDField;
    QryARPrepostDetailSALESPEOPLE_ID: TBCDField;
    QryARPrepostDetailCOMM_PCNT: TBCDField;
    QryARPrepostDetailFREIGHT_ID: TBCDField;
    QryARPrepostDetailSHIPMENT_DTL_ID: TBCDField;
    QryARPrepostDetailFREIGHT_PRICE: TBCDField;
    QryARPrepostDetailARINVT_ID: TBCDField;
    QryARPrepostDetailMISC_COMMENT: TStringField;
    QryARPrepostDetailREF_CODE_ID: TBCDField;
    QryARPrepostDetailREFERENCE: TStringField;
    QryARPrepostDetailPRICE_PER_1000: TFMTBCDField;
    QryARPrepostDetailPRICE_PER_1000_YN: TStringField;
    QryARPrepostDetailFROM_ORDER: TStringField;
    QryARPrepostDetailCOST_OBJECT_ID: TBCDField;
    QryARPrepostDetailCOST_OBJECT_SOURCE: TStringField;
    QryARPrepostDetailMISC_PO: TStringField;
    QryARPrepostDetailEPLANT_ID: TBCDField;
    QryARPrepostDetailTAX_CODE: TStringField;
    QryARPrepostDetailTAX_RATE: TFMTBCDField;
    QryARPrepostDetailGLACCT: TStringField;
    QryARPrepostDetailFREIGHT_COMP: TStringField;
    QryARPrepostDetailREFCODE: TStringField;
    QryARPrepostDetailREFCODE_CODE: TStringField;
    QryARPrepostDetailITEMNO: TStringField;
    QryARPrepostDetailREV: TStringField;
    QryARPrepostDetailCLASS: TStringField;
    QryARPrepostDetailTERMSID: TFMTBCDField;
    QryARPrepostDetailORDARINVTID: TFMTBCDField;
    QryARPrepostDetailARINVTDESCRIP: TStringField;
    QryARPrepostDetailARINVTITEMNO: TStringField;
    QryARPrepostDetailARINVTCLASS: TStringField;
    QryARPrepostDetailARINVTREV: TStringField;
    QryARPrepostDetailDISPITEMNO: TStringField;
    QryARPrepostDetailDISPREV: TStringField;
    QryARPrepostDetailDISPCLASS: TStringField;
    QryARPrepostDetailTOTAL_BEFORE_TAX: TFMTBCDField;
    QryARPrepostDetailTOTAL_AFTER_TAX: TFMTBCDField;
    QryARPrepostDetailABSARINVTID: TFMTBCDField;
    QryARPrepostDetailSalesPerson: TStringField;
    QryARPrepostDetailCOST_SOURCE: TStringField;
    QryARPrepostDetailCommPrcnt: TFloatField;
    QryARPrepostDetailTotalComm: TFloatField;
    QryArPrePost: TFDQuery;
    QryArPrePostID: TBCDField;
    QryArPrePostGLPERIODS_ID_AR: TBCDField;
    QryArPrePostARCUSTO_ID: TBCDField;
    QryArPrePostBILL_TO_ID: TBCDField;
    QryArPrePostINVOICE_NO: TStringField;
    QryArPrePostINVOICE_DATE: TDateTimeField;
    QryArPrePostTERMS_ID: TBCDField;
    QryArPrePostDUE_DATE: TDateTimeField;
    QryArPrePostGLACCT_ID_AR: TBCDField;
    QryArPrePostPRIOR_ENTRY: TStringField;
    QryArPrePostON_HOLD: TStringField;
    QryArPrePostINV_PREFIX: TStringField;
    QryArPrePostCURRENCY_ID: TBCDField;
    QryArPrePostGLACCT_ID_FX: TBCDField;
    QryArPrePostFROM_ORDER: TStringField;
    QryArPrePostARINVOICE_ID: TBCDField;
    QryArPrePostUSERID: TStringField;
    QryArPrePostEPLANT_ID: TBCDField;
    QryArPrePostCTRL_EPLANT_ID: TBCDField;
    QryArPrePostTERMS: TStringField;
    QryArPrePostTERMDAYS: TBCDField;
    QryArPrePostTERMSBASEDON: TStringField;
    QryArPrePostARACCT: TStringField;
    QryArPrePostPERIOD: TBCDField;
    QryArPrePostSTART_DATE: TDateTimeField;
    QryArPrePostEND_DATE: TDateTimeField;
    QryArPrePostCOMPANY: TStringField;
    QryArPrePostCUSTNO: TStringField;
    QryArPrePostFXACCT: TStringField;
    QryArPrePostCURRENCYCODE: TStringField;
    QryArPrePostEPLANT_NAME: TStringField;
    QryArPrePostBILLTOCOMP: TStringField;
    PkAllAcct: TIQWebHPick;
    FloatField2: TBCDField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField3: TBCDField;
    QryRefCode: TFDQuery;
    PkTooling: TIQWebHPick;
    PkToolingWORKORDERNO: TStringField;
    PkToolingRFQ: TStringField;
    PkToolingPROJECT: TStringField;
    PkToolingBUYERID: TStringField;
    PkToolingCUSTNO: TStringField;
    PkToolingCOMPANY: TStringField;
    PkToolingTOOL_RFQ_ID: TBCDField;
    PendingEdis1: TUniMenuItem;
    QryBillTo: TFDQuery;
    QryBillToATTN: TStringField;
    QryBillToADDR1: TStringField;
    QryBillToADDR2: TStringField;
    QryBillToCITY: TStringField;
    QryBillToSTATE: TStringField;
    QryGlAcct: TFDQuery;
    QryGlAcctACCT: TStringField;
    QryGlAcctDESCRIP: TStringField;
    QryGlAcctEPLANT_ID: TBCDField;
    QryGlAcctID: TBCDField;
    QryShipDESCRIPTION: TStringField;
    QryOrdDESCRIPTION: TStringField;
    Rangeofinvoices1: TUniMenuItem;
    QryARPrepostDetailRMA_DETAIL_ID: TBCDField;
    Customercarryover1: TUniMenuItem;
    QryVMI: TFDQuery;
    StringField11: TStringField;
    FloatField5: TFMTBCDField;
    DateTimeField1: TDateTimeField;
    FloatField6: TFMTBCDField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField7: TBCDField;
    FloatField8: TFMTBCDField;
    FloatField9: TBCDField;
    FloatField10: TBCDField;
    StringField14: TStringField;
    FloatField11: TFloatField;
    FloatField12: TBCDField;
    FloatField13: TBCDField;
    FloatField14: TBCDField;
    FloatField15: TBCDField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField16: TBCDField;
    FloatField17: TFMTBCDField;
    FloatField19: TFMTBCDField;
    FloatField20: TBCDField;
    StringField17: TStringField;
    FloatField21: TFMTBCDField;
    StringField18: TStringField;
    FloatField22: TFMTBCDField;
    FloatField23: TFMTBCDField;
    FloatField24: TFMTBCDField;
    StringField19: TStringField;
    FloatField25: TBCDField;
    StringField20: TStringField;
    SrcVMI: TDataSource;
    PkCustomerCUST_GROUP: TStringField;
    PKCustomer2CUST_GROUP: TStringField;
    MultiselectDetail1: TUniMenuItem;
    wwQryGLAcctID: TBCDField;
    wwQryGLAcctEPLANT_ID: TBCDField;
    wwQryGLAcctACCT: TStringField;
    wwQryGLAcctDESCRIP: TStringField;
    QryOrdVMI: TStringField;
    QryShipVMI: TStringField;
    PkCustomerPK_HIDE: TStringField;
    SrcDtlAcct: TDataSource;
    TblDtlAcct: TFDTable;
    wwQryGLAcctDtlSales: TFDQuery;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField18: TBCDField;
    FloatField26: TBCDField;
    TblDtlAcctID: TBCDField;
    TblDtlAcctARPREPOST_DETAIL_ID: TBCDField;
    TblDtlAcctGLACCT_ID: TBCDField;
    TblDtlAcctPERCENTAGE: TFMTBCDField;
    TblDtlAcctAcct: TStringField;
    UpdateSQL3: TFDUpdateSQL;
    QryShipORDERNO: TStringField;
    QryOrdORDERNO: TStringField;
    QryShipPACKSLIPNO: TStringField;
    QryOrdPACKSLIPNO: TStringField;
    wwQryCurrencyNATIVE_CURR: TStringField;
    QryARPrepostDetailVMI_REFERENCE: TStringField;
    QryArPrePostARCUSTO_CREDIT_CARD_ID: TBCDField;
    N20: TUniMenuItem;
    AttachedCreditCard1: TUniMenuItem;
    QryBillToCOUNTRY: TStringField;
    QryArPrePostDAY_OF_MONTH: TBCDField;
    QryArPrePostEND_OF_MONTH: TStringField;
    PkFreight: TIQWebHPick;
    PkFreightID: TBCDField;
    PkFreightDESCRIP: TStringField;
    PkFreightSCAC_IATA_CODE: TStringField;
    PkFreightCODE_QUALIFIER: TStringField;
    PkFreightTRANSPORT_CODE: TStringField;
    PkFreightEQUIP_OWNERS_CODE: TStringField;
    PkRefCode: TIQWebHPick;
    PkRefCodeCATEGORY_ID: TBCDField;
    PkRefCodeCATEGORY_DESCRIP: TStringField;
    PkRefCodeEPLANT_ID: TBCDField;
    PkRefCodeREF_CODE_ID: TBCDField;
    PkRefCodeREF_CODE_DESCRIP: TStringField;
    PkRefCodeREF_CODE: TStringField;
    QryARPrepostDetailNO_POST_STD_COST: TStringField;
    ProcCommod: TFDStoredProc;
    ChargeCreditCard1: TUniMenuItem;
    N22: TUniMenuItem;
    QryArPrePostNUM_OF_SUPP_DOCS: TBCDField;
    QryARPrepostDetailDESCRIPTION: TStringField;
    QryARPrepostDetailDISPDESCRIP: TStringField;
    PCMain: TUniPageControl;
    TabInv: TUniTabSheet;
    TabDoc: TUniTabSheet;
    PnlBottom: TUniPanel;
    Panel10: TUniPanel;
    PageControl2: TUniPageControl;
    TabSheet1: TUniTabSheet;
    DBMemoNotes: TUniDBMemo;
    TabSheet2: TUniTabSheet;
    DBMemo1: TUniDBMemo;
    TabSheet3: TUniTabSheet;
    DBMemo2: TUniDBMemo;
    TabPOOrderNo: TUniTabSheet;
    Label12: TUniLabel;
    Label15: TUniLabel;
    Label17: TUniLabel;
    dbPoNo: TUniDBEdit;
    dbOrderrNo: TUniDBEdit;
    DBPackSlipno: TUniDBEdit;
    PnlTotals: TUniPanel;
    PnlForeignCurrency: TUniPanel;
    btnCurrency2: TUniSpeedButton;
    Panel8: TUniPanel;
    PnlTotalsLabels: TUniPanel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label11: TUniLabel;
    SBTaxBreakdown: TUniSpeedButton;
    PnlTotalsDBEdit: TUniPanel;
    DBSubTotal: TUniDBEdit;
    DBTax: TUniDBEdit;
    DBFreight: TUniDBEdit;
    DBTotal: TUniDBEdit;
    Panel3: TUniPanel;
    PnlDetail: TUniPanel;
    Bevel1: TUniPanel;
    PnlToolbarDetail: TUniPanel;
    sbComm: TUniSpeedButton;
    SBPO: TUniSpeedButton;
    btnCurrency1: TUniSpeedButton;
    CBMisc: TUniCheckBox;
    Panel1: TUniPanel;
    PnlGridDetail: TUniPanel;
    GridInvoiceDetail: TIQUniGridControl;
    PnlTop: TUniPanel;
    cbCustComm: TUniCheckBox;
    QryArPrePostCUSER1: TStringField;
    QryArPrePostCUSER2: TStringField;
    QryArPrePostCUSER3: TStringField;
    PkArPrePostCUSER1: TStringField;
    PkArPrePostCUSER2: TStringField;
    PkArPrePostCUSER3: TStringField;
    PkArPrePostINV_PREFIX: TStringField;
    TblDtlAcctAmount: TFloatField;
    PkArPrePostPONO: TStringField;
    PkArPrePostORD_DETAIL_ID: TBCDField;
    CustomerPickListDate1: TUniMenuItem;
    QryARPrepostDetailGLACCT_DESCRIP: TStringField;
    TblDtlAcctdescrip: TStringField;
    QryARPrepostDetailARINVTDESCRIP2: TStringField;
    QryShipDESCRIP2: TStringField;
    QryVMIDESCRIP2: TStringField;
    QryOrdDESCRIP2: TStringField;
    QryArPrePostNOTES: TStringField;
    BuildUnitPriceAccountSplit1: TUniMenuItem;
    TblDtlAcctSPLIT_AMOUNT: TFMTBCDField;
    SrcDtlAcctSplit: TDataSource;
    TblDtlAcctSplit: TFDTable;
    FloatField27: TFMTBCDField;
    TblDtlAcctSplitAcct: TStringField;
    TblDtlAcctSplitDescrip: TStringField;
    FloatField29: TFMTBCDField;
    FloatField30: TBCDField;
    FloatField31: TBCDField;
    FloatField32: TBCDField;
    QryARPrepostDetailGLACCT_ID_FREIGHT: TBCDField;
    QryARPrepostDetailGL_FR_ACCT: TStringField;
    wwQryGLAcct_Freight: TFDQuery;
    wwQryGLAcct_FreightID: TBCDField;
    wwQryGLAcct_FreightEPLANT_ID: TBCDField;
    wwQryGLAcct_FreightACCT: TStringField;
    wwQryGLAcct_FreightDESCRIP: TStringField;
    QryARPrepostDetailSHIPMENT_DTL_ID2: TBCDField;
    tblInvCodeINV_PREFIX: TStringField;
    tblInvCodeDESCRIP: TStringField;
    tblInvCodeID: TBCDField;
    QryInvCode: TFDQuery;
    QryInvCodeINV_PREFIX: TStringField;
    QryInvCodeDESCRIP: TStringField;
    QryInvCodeID: TBCDField;
    QryShipSHIPMENTS_ID: TBCDField;
    PkFreightPK_HIDE: TStringField;
    QryArPrePostDO_NOT_EMAIL_UPON_POST: TStringField;
    TblCommAMOUNT: TBCDField;
    QryOrderAPono: TStringField;
    QryShipPHANTOM: TStringField;
    QryShipPHANTOM_CHILD: TStringField;
    QryShipPHANTOM_ITEMNO: TStringField;
    QryOrdPHANTOM: TStringField;
    QryOrdPHANTOM_CHILD: TStringField;
    QryOrdPHANTOM_ITEMNO: TStringField;
    QryVMIPHANTOM: TStringField;
    QryVMIPHANTOM_CHILD: TStringField;
    QryVMIPHANTOM_ITEMNO: TStringField;
    QryARPrepostDetailPHANTOM: TStringField;
    PkFreightEPLANT_ID: TBCDField;
    QryOrdPHANTOM_ON_SO: TStringField;
    QryShipPHANTOM_ON_SO: TStringField;
    QryVMIPHANTOM_ON_SO: TStringField;
    QryARPrepostDetailPHANTOM_ON_SO: TStringField;
    PkGlAcct: TIQWebHPick;
    PkGlAcctID: TBCDField;
    PkGlAcctACCT: TStringField;
    PkGlAcctDESCRIP: TStringField;
    PkGlAcctTYPE: TStringField;
    PkGlAcctEPLANT_ID: TBCDField;
    QryARPrepostDetailFREIGHT_REV_AMOUNT: TBCDField;
    QryARPrepostDetailFREIGHT_REV_PCNT: TBCDField;
    QryARPrepostDetailACCT_ID_FREIGHT_REV: TBCDField;
    QryARPrepostDetailGL_FR_ACCT_REV: TStringField;
    PC1: TUniPageControl;
    TabGeneral: TUniTabSheet;
    PageControl1: TUniPageControl;
    TabGrid: TUniTabSheet;
    GridInvoice: TUniDBGrid;
    TabForm: TUniTabSheet;
    PnlHeader: TUniPanel;
    PnlHeader01: TUniPanel;
    PnlHeaderLeft01: TUniPanel;
    Label14: TUniLabel;
    Label5: TUniLabel;
    Label1: TUniLabel;
    Label16: TUniLabel;
    Labelsupdoc: TUniLabel;
    Panel19: TUniPanel;
    DBEditInvoice: TUniDBEdit;
    DBEditCustNo: TUniDBEdit;
    dbWWBillTo: TUniDBLookupComboBox;
    dbeUserId: TUniDBEdit;
    DBSuppDocs: TUniDBEdit;
    DBUser1: TUniDBEdit;
    DBUser2: TUniDBEdit;
    DBUser3: TUniDBEdit;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    PnlHeader02: TUniPanel;
    PnlHeaderLeft02: TUniPanel;
    Label13: TUniLabel;
    Label2: TUniLabel;
    Label4: TUniLabel;
    Label3: TUniLabel;
    Panel17: TUniPanel;
    dbPrefix: TUniDBLookupComboBox;
    DBEditInvDate: TUniDBDateTimePicker;
    DBTerms: TUniDBLookupComboBox;
    DBEditDueDate1: TUniDBDateTimePicker;
    PnlHeader03: TUniPanel;
    PnlHeaderLeft03: TUniPanel;
    LblCurrency: TUniLabel;
    Label10: TUniLabel;
    Label9: TUniLabel;
    lblEPlant: TUniLabel;
    Panel15: TUniPanel;
    SBAccount: TUniSpeedButton;
    SBPeriod: TUniSpeedButton;
    DBacct: TUniDBEdit;
    DBEditPeriod: TUniDBEdit;
    dbePlant: TUniDBEdit;
    cbCurrency2: TUniDBEdit;
    GroupBox1: TUniGroupBox;
    DBMemo3: TUniDBMemo;
    QryARPrepostDetailFOB: TStringField;
    QryOrdPRICE_PER_1000: TFMTBCDField;
    QryShipPRICE_PER_1000: TFMTBCDField;
    QryVMIPRICE_PER_1000: TFMTBCDField;
    QryARPrepostDetailORIG_FREIGHT_PRICE: TBCDField;
    TblSalesMIDDLE_NAME: TStringField;
    TblCommMIDDLE_NAME: TStringField;
    QryARPrepostDetailUNIT: TStringField;
    QryARPrepostDetailSHIP_TO_ID: TBCDField;
    QryARPrepostDetailMISC_ORDERS_ID: TBCDField;
    QryARPrepostDetailORDERNO: TStringField;
    DBMiscorderno: TUniDBEdit;
    Label18: TUniLabel;
    PkTaxCode: TIQWebHPick;
    PkTaxCodeTAX_CODE: TStringField;
    PkTaxCodeTAX_CODE_DESC: TStringField;
    PkTaxCodeTOT_TAX_RATE: TFMTBCDField;
    PkTaxCodeID: TBCDField;
    QryVMIREF_NUMBER: TStringField;
    QryArPrePostINFO_AR: TStringField;
    QryARPrepostDetailDISCOUNT: TBCDField;
    QryARPrepostDetailLIST_UNIT_PRICE: TFMTBCDField;
    QryShipVMI_FGMULTI_ID: TBCDField;
    ViewArPrepostDetailTotalsARPREPOST_ID: TBCDField;
    ViewArPrepostDetailTotalsTOTAL_BEFORE_TAX: TFMTBCDField;
    ViewArPrepostDetailTotalsTOTAL_AFTER_TAX: TFMTBCDField;
    ViewArPrepostDetailTotalsNET_TAX: TFMTBCDField;
    ViewArPrepostDetailTotalsFREIGHT: TFMTBCDField;
    ViewArPrepostDetailTotalsTOTAL: TFMTBCDField;
    QryBillToID: TBCDField;
    UpdateSQL2: TFDUpdateSQL;
    PkArPrePostUSERID: TStringField;
    QryArPrePostECODE: TStringField;
    FDUpdateSQL1: TFDUpdateSQL;
    QryARPrepostDetailPHANTOM_ORD_DETAIL_ID: TBCDField;
    QryARPrepostDetailPHANTOM_DTL_MODIFIED: TStringField;
    SBCalcTax: TUniSpeedButton;
    QryVMIQTYSHIPPED: TFMTBCDField;
    QryVMIVMI_CONSUMPTION_ID: TFMTBCDField;
    QryShipEPLANT_ID: TFMTBCDField;
    pnlToolBarMain: TUniPanel;
    SBSearch: TUniSpeedButton;
    SBToggle: TUniSpeedButton;
    SBSaveAll: TUniSpeedButton;
    SBSave: TUniSpeedButton;
    SBView: TUniSpeedButton;
    SbViewVoided: TUniSpeedButton;
    sbPendingEdi: TUniSpeedButton;
    SBPrint: TUniSpeedButton;
    SBScan: TUniSpeedButton;
    sbtnAttachCreditCard: TUniSpeedButton;
    sbtnCreditCardCharge: TUniSpeedButton;
    SBCarryOver: TUniSpeedButton;
    Nav: TUniDBNavigator;
    ImageListNavTree: TUniNativeImageList;
    FlowPanel1: TUniPanel;
    DBOnHold: TUniDBCheckBox;
    DBDoNotEmailUponPost: TUniDBCheckBox;
    UniSplitter1: TUniSplitter;
    UniSplitter2: TUniSplitter;
    UniSplitter3: TUniSplitter;
    UniSplitter5: TUniSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBToggleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InvoiceItems1Click(Sender: TObject);
    procedure SBPeriodClick(Sender: TObject);
    procedure Freight1Click(Sender: TObject);
    procedure GridInvoiceDetailDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure PostInvoice1Click(Sender: TObject);
    procedure SBViewClick(Sender: TObject);
    procedure SBSaveClick(Sender: TObject);

    procedure SrcArPrePostDataChange(Sender: TObject; Field: TField);

    procedure QryShipCalcFields(DataSet: TDataSet);
    procedure SBAcctClick(Sender: TObject);
    procedure SBSaveAllClick(Sender: TObject);
    procedure Status1Click(Sender: TObject);
    procedure Terms1Click(Sender: TObject);
    procedure TaxCodes1Click(Sender: TObject);
    procedure SalesAcct1Click(Sender: TObject);
//    procedure GridInvoiceDetailCalcCellColors(Sender: TObject;
//      Field: TField; State: TGridDrawState; Highlight: Boolean;
//      AFont: TFont; ABrush: TBrush);
    procedure SbViewVoidedClick(Sender: TObject);
    procedure GridInvoiceDetailDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure ViewCreditMemos1Click(Sender: TObject);
    procedure SBPrintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure DBEditInvDateExit(Sender: TObject);
    procedure CustomerDocs2Click(Sender: TObject);
    procedure BrowseGLBatches1Click(Sender: TObject);
//    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoPackingSlip1Click(Sender: TObject);
    procedure JumptoSalesOrders1Click(Sender: TObject);
    procedure ExternalExefile1Click(Sender: TObject);
    procedure SrcArPrePostDetailDataChange(Sender: TObject; Field: TField);
    procedure btnCurrency1Click(Sender: TObject);
    procedure btnCurrency2Click(Sender: TObject);
    procedure SrcViewArPrePostDetailTotalsDataChange(Sender: TObject;
      Field: TField);
    procedure GridInvoiceEditButtonClick(Sender: TObject);
    procedure InvoiceCodes1Click(Sender: TObject);
    procedure AddAmortization1Click(Sender: TObject);
    procedure Commissions1Click(Sender: TObject);
    procedure TblCommAfterPost(DataSet: TDataSet);
    procedure editCommEnter(Sender: TObject);
    procedure SrcCommentsDataChange(Sender: TObject; Field: TField);
    procedure QryShipBeforeOpen(DataSet: TDataSet);
    procedure QryShipAfterOpen(DataSet: TDataSet);
    procedure QryOrdBeforeOpen(DataSet: TDataSet);
    procedure QryOrdAfterOpen(DataSet: TDataSet);
    procedure AutoInvoice1Click(Sender: TObject);
    procedure GridInvoiceDetailDblClick(Sender: TObject);
    procedure DBEditInvDateEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PostallforindividualUserID1Click(Sender: TObject);
    procedure PostallforallUsersID1Click(Sender: TObject);
    procedure PKCustomer2BeforeOpen(DataSet: TDataSet);
    procedure PkAcctBeforeOpen(DataSet: TDataSet);
    procedure QryARPrepostDetailCalcFields(DataSet: TDataSet);
//    procedure QryARPrepostDetailUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure QryARPrepostDetailAfterPost(DataSet: TDataSet);
    procedure wwTaxCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwGlAcctCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwFreightCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure QryARPrepostDetailNewRecord(DataSet: TDataSet);
    procedure QryARPrepostDetailBeforeDelete(DataSet: TDataSet);
    procedure QryARPrepostDetailBeforeEdit(DataSet: TDataSet);
    procedure QryARPrepostDetailAfterScroll(DataSet: TDataSet);
    procedure NavItwmsBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QryARPrepostDetailBeforePost(DataSet: TDataSet);
    procedure QryARPrepostDetailBeforeInsert(DataSet: TDataSet);
//    procedure QryArPrePostUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure QryArPrePostBeforeDelete(DataSet: TDataSet);
    procedure QryArPrePostAfterInsert(DataSet: TDataSet);
    procedure QryArPrePostBeforeOpen(DataSet: TDataSet);
    procedure QryArPrePostBeforePost(DataSet: TDataSet);
    procedure QryArPrePostTERMS_IDChange(Sender: TField);
    procedure QryArPrePostINVOICE_DATEChange(Sender: TField);
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure PkArPrePostBeforeOpen(DataSet: TDataSet);
    procedure QryArPrePostAfterScroll(DataSet: TDataSet);
    procedure SBPOClick(Sender: TObject);
    procedure PendingEdis1Click(Sender: TObject);
    procedure dbWWBillToDropDown(Sender: TObject);
    procedure dbWWBillToCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwDBGlAcctCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure QryGlAcctBeforeOpen(DataSet: TDataSet);
    procedure QryArPrePostBeforeCancel(DataSet: TDataSet);
    procedure Customercarryover1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure MultiselectDetail1Click(Sender: TObject);
    procedure wwTaxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddSurcharge1Click(Sender: TObject);
    procedure TblDtlAcctBeforeEdit(DataSet: TDataSet);
    procedure TblDtlAcctBeforePost(DataSet: TDataSet);
    procedure SalesAccountsSplit1Click(Sender: TObject);
    procedure wwQryCurrencyBeforeOpen(DataSet: TDataSet);
    procedure DoAttachedCreditCards(Sender: TObject);
    procedure RepairInformation1Click(Sender: TObject);
    procedure cbCurrencyCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure EditBillTo1Click(Sender: TObject);
    procedure wwFreight2CustomDlg(Sender: TObject);
    procedure wwwRefCodeDlgCustomDlg(Sender: TObject);
    procedure ChargeCreditCard1Click(Sender: TObject);

    procedure SBTaxBreakdownClick(Sender: TObject);
    procedure TaxBreakdown1Click(Sender: TObject);
    procedure wwGlAcctDropDown(Sender: TObject);
    procedure SBScanClick(Sender: TObject);
    procedure CBMiscClick(Sender: TObject);
    procedure DefineLabelText2Click(Sender: TObject);
    procedure TblDtlAcctCalcFields(DataSet: TDataSet);
    procedure CustomerPickListDate1Click(Sender: TObject);
    procedure BuildUnitPriceAccountSplit1Click(Sender: TObject);
    procedure BuildUnitPriceAccountsplit2Click(Sender: TObject);
    procedure QryARPrepostDetailDISPDESCRIPValidate(Sender: TField);
    procedure PrintInvoice1Click(Sender: TObject);
    procedure Printrangeofinvoices1Click(Sender: TObject);
    procedure DDBPrintClick(Sender: TObject);
    procedure wwGlAcct_FreightDropDown(Sender: TObject);
    procedure wwGlAcct_FreightCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure ChangeInvoice1Click(Sender: TObject);
    procedure QryARPrepostDetailFREIGHT_PRICESetText(Sender: TField;
      const Text: String);
    procedure tblInvCodeBeforePost(DataSet: TDataSet);
    procedure QryOrderCalcFields(DataSet: TDataSet);
    procedure QryARPrepostDetailAfterDelete(DataSet: TDataSet);
    procedure TblCommBeforeEdit(DataSet: TDataSet);
    procedure AssignAcctviaPickList1Click(Sender: TObject);
    procedure wwGlAcct_Freight_RevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure EditFreightRevenueAmount1Click(Sender: TObject);
    procedure Freightrevenue1Click(Sender: TObject);
    procedure wwTaxCustomDlg(Sender: TObject);
    procedure QryArPrePostAfterPost(DataSet: TDataSet);
    procedure QryArPrePostAfterDelete(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QryARPrepostDetailINVOICE_QTYChange(Sender: TField);
    procedure QryARPrepostDetailAfterCancel(DataSet: TDataSet);
    procedure SBCalcTaxClick(Sender: TObject);
    procedure ViewPostedInvoices1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
//    function  ProcessAcctSplit(Amount:Real):Real;
  private
    { Private declarations }
    InvoiceNumber:String;
//    OriginalInvoiceNumber:Integer;
    //MaxId:Real;
    //GLPeriodHint:TNotifyEvent;
    fPrior :String;
    fMaxTaxId:Real;
    fMaxCogsId:Real;
    fGLBatchDate:TDateTime;
    fArInvoiceId:Real;
    fInset:Boolean;
    GlPeriodId:Real;
    FGLBatchId_Id:Real;
    FMultiCurrency:Boolean;
    FStdCostPosting:Boolean;
    FXRate:Real;
    FChangeDueDate :Boolean;

    FPostQry:TFDQuery;
    FHelpConst:Integer;
    FDetailId:Real;
    FHeaderId:Real;
    FDeletedOrd_Detail_ID: Int64;
    FIsDeletedOrdDetailPhantom: Boolean;
    FRefreshQryArPrepost :Boolean;
    FStringList:TStringList;
    FOldInvoiceNo:String;
    FCustomerId:Real;

    FMultiSelect : Boolean;
    FDetailsExists:Boolean;
    FWarningRaised:Boolean;
    FPostingAll:Boolean;

    FLockModule: string;
    FLockHandle: string;
    FDoNotShow:Boolean;

    FDetailSaleseAcctId:Real;
    FDetailSaleseAcct:String;
    FQryArPrePostState:TDataSetState;

    FDetailSaleseAcctId_FR:Real;
    FDetailSaleseAcct_FR:String;
    FQryArPrePostState_FR:TDataSetState;


    FCustPickListDate:TDateTime;
    FAssigningCostSource:boolean;
    FUnitPrice, FInvoiceQty, FFreightPrice:Real;
    FPostingState: TPostingState;  // oe_misc.pas
    FTblCommCOMMISSION_PERCENT:Real;
    FAllowCIAChanges:boolean;
    FRecalcTax: Boolean;
    FTotalQtyChanged: Boolean;

//    procedure UpdateArcustoHighBalance;
    procedure PopulateCOGStable;
    procedure AddItemToAList(StringList:TStringList; nOrdDetailId:Real);
    procedure AssignDueDate;
    procedure CloseInvoiceItems;
    procedure OpenInvoiceItems;
    procedure GetInvoiceNumber;
    function GetNewInvoiceNumber(EplantId:Real):String;
    //function  GetMaxId:Real;
    procedure CheckDBEditInvoice;
    procedure SelectCustomerScope;
    procedure GetCustomer;
    procedure UpdateSrcQryBillTo;
    procedure AssignDefaults;
    procedure CheckFrmInvoiceItemsCaption;
    function  CheckForSameItem(Source:TObject):Boolean;
    procedure PostCurrentInvoice;
    procedure InsertGlbatchId(nGLBatchId_Id:Real);
    procedure InsertGlbatch(nGLBatchId_Id:Real);
    procedure InsertArInvoice(nGlBatchId_Id:Real);
    procedure InsertARCommissions(nGLBatchId_Id:Real);
    procedure InsertArInvoiceDetail;
    function  GetTax(Id:Real):Real;
    procedure InsertItems(nGLBatchId_Id:Real);
    function  InsertItemsFX1(nGLBatchId_Id:Real):Boolean;
    function  InsertItemsFX2(nGLBatchId_Id:Real):Boolean;
    function  ProcessFXQry(AQry:TFDQuery; nGLBatchId_Id:Real):Boolean;
    function  CheckFXAccounts(AQry:TFDQuery):Boolean;
    function  InsertTaxesFX(nGLBatchId_Id:Real):Boolean;
    procedure InsertTaxes(nGLBatchId_Id:Real);
    procedure InsertFreight(nGLBatchId_Id:Real);
    function  InsertFreightFX(nGLBatchId_Id:Real):Boolean;

    procedure InsertBatchTotal(nGLBatchId_Id, nSum:Real);
    procedure PostAllInvoices;
    procedure CheckTerms;
    procedure GetGlAcct;
    procedure CostOfGoodsSold( nGLBatchId_Id : Real );
    procedure InsertStdCostRecord( nGLBatchId_Id : Real );
    procedure InsertStdCostElements( nGLBatchId_Id : Real );
    //procedure DisplayHint(Sender: TObject);
    procedure PrintAfterPostReport(nGLBatchId_Id:Real);
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
    function  GetfreightId(nId:Real):Real;
    function  GetfreightId2(nId:Real):Real;
    procedure InsertArinvtInfo(ArinvtId, nId, nOrdDetailId, nShipmentDtlId:Real);
    procedure RunExternalExe;
    procedure CheckMultiCurrency;
    procedure PostMCMessage;
    procedure CheckCurrencyRate;
    procedure CheckViewCurrencyRate;
    procedure ReplaceGLACCT_ID_AR_with_MC_Account(NId:Real);
//    procedure AssignMCAccount(AID:Real; AField:TField);
    procedure FindRootAccount(AID:Real; AField:TField; AEplantId:Real);
    procedure CheckFXAcct;
    procedure AssignCommissions;
    procedure InsertCommissions(nId, nPrepostId:Real);
    procedure CheckCommissions;
    procedure CheckPageControl(ADataSet:TDataset);
    procedure DisplayMemoDlg;
//    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
//    procedure UpdateQryArPrepostDtl;
//    procedure InsertQryArPrepostDtl;
//    procedure DeleteQryArPrepostDtl;
//    procedure UpdateQryArPrepost;
//    procedure InsertQryArPrepost;
//    procedure DeleteQryArPrepost;
    procedure ReopenQryArPrePost;
    procedure ReopenQryArPrePostDetail(ID:Real = 0);
    procedure GetCostObjectInfo(AOrddetailId:Real; var ACostObjectId: Real; var ACostObjectSource:String);

//    procedure SetPageControlCaptions;

    procedure EnableMultiSelect( AEnabled: Boolean );
    function  GetBillToId(AId:Real):Real;
    function  GetAccId(AId:Real):Real;
    procedure CheckCreditMemo;

    procedure AcquireLock;
    procedure ReleaseLock;
    procedure InsertRMACommissions(ArPrepostDetailID, AOldOrdDetailId:Real);

    function GetAcctCurrencyId(AcctId:Real):Real;
    procedure VerifyEPlantSequence;
    function AdjustPurchasedItem(aAcctId, AEPLANT_ID, ARINVT_ID:Real):Real;
    procedure DoAutoEmail(AReportName: string; ASelectionList: TStringList);
    procedure DoAutoEmailAfterPost(AReportName: string; ASelectionList: TStringList; AId:Real);
    procedure EmailInvoice(AId:Real);
    procedure SetFocustToFirstEditableField;
    procedure RevaluateUnitPrice(arprepost_detail_id:Real);
    procedure AssignDiscountToUnitPrice( ADiscount: Real);
    procedure AssignPriceToDiscount( APrice: Real);
    procedure UpdateCashInAdvanceGlAccounts(a_ord_detail_id, arprepost_id:Real);
    procedure UpdateCashInAdvanceGlAccounts2(arprepost_id:Real; ADataSet:TDataSet; a_ord_detail_id:Real);
    procedure CheckCashInAdv;
    procedure CheckARIndivUser;

    function IsCIA :boolean;
    procedure InsertRMAArPrePostDetail(AMiscOrdersId,
                                      nShipmentDtlId,
                                      nOrderDtlId,
                                      nArinvtId,
                                      nUnitPrice,
                                      AQty:Real;
                                      nEPlantId,
                                      nRmaDtlId : Real;
                                      AIsMiscCharge, bRestock:Boolean;
                                      ADispoType :String);
    procedure InsertMultiRMAArPrePostDetail(AMiscOrdersId,
                                      nShipmentDtlId,
                                      nOrderDtlId,
                                      AQty:Real;
                                      nEPlantId,
                                      nRmaDtlId : Real;
                                      AIsMiscCharge, bRestock:Boolean;
                                      ADispoType :String;
                                      AOwner:TUniForm);
    procedure GetTaxes(AFinalize: Boolean = false);
    procedure BatchGetTax(ABatchId: Real);
    function CheckTaxCalculated: Boolean;
    procedure DeletePhantomOrderDetailComponents(AOrd_Detail_ID: Int64);
    procedure CheckSetPhantomOrderDetailModified;
    function GetIncludePhantomComponents(AARPrepostDetailID: Int64): Boolean;
    function GetPhantomKitPriceBasedOnComponents(
      AARPrepostDetailID: Int64): Boolean;
    function GetPhantomKitPriceBasedOnComponentsArinvt(
      AArinvtID: Int64): Boolean;
    procedure SyncPhantomOrderDetailComponents; overload;
    procedure SyncPhantomOrderDetailComponents(AARPrepostDetailID: Int64); overload;
    procedure SetTaxButton;
    procedure DoUnAssignCostSource(var AHandled: Boolean);
  public
    //IQTiming1: TIQTiming;
    DM: TAR_DM;
    { Public declarations }
    Selection:Integer;
    ArCustoId:Real;
 //   constructor CreateMultipleRMA(AOwner:TComponent; bRestock:Boolean);
    constructor Create(AOwner: TComponent; cType:String); virtual;
    constructor CreateJump(AOwner:TComponent; nId:Real);
//    constructor CreateRMA(AOwner: TComponent; nArcustoId, nQty,
//                          nOrderDtlId, nShipmentDtlId,
//                          nArinvtId, nRmaDtlId, nUnitPrice:Real; cRMANO:String; bRestock:Boolean; ASuffix, ADispoType:String); virtual;

    constructor CreateFinancingCharge(AOwner:TComponent; AArcustoId, ATermsId, ACurrencyId, AAmount:Real);
 //   constructor CreateOE(AOwner: TComponent; nArcustoId, nOrdersId, nTermsId, nCurrencyId:Real); virtual;
    constructor CreatePackslip(AOwner: TComponent; nArcustoId, nShipmentsId:Real);

    procedure AppendCustomerSuppliedMaterial;
    procedure ProcessAcceptRecord(Source:TObject);
    procedure StartUp( AOwner:TComponent; cType:String; nId:Real );
    procedure InsertCommodity(ARINVT_ID, ADtlId:Real);
    procedure Insert_Deduct_from_Invoice_Total(ADtlId:Real);
    procedure ProcessSACDiscounts(aArprepost_detail_id:Real);
    procedure ProcessSACDiscounts2(aArprepost_id:Real);
  end;

procedure DoFinanceCharge(AOwner: TComponent; AArcustoId, ATermsId, ACurrencyId, AAmount:Real);
procedure DoInvoiceJump(nId:Real);
procedure DoInvoice(cType:String);
procedure DoMultiInvoiceFromRMA(AOwner:TComponent; bRestock:Boolean);
procedure DoInvoiceFromRMA(nArcustoId, nQty, nOrderDtlId,
                           nShipmentDtlId, nArinvtId, nRmaDtlId,
                           nUnitPrice:Real; cRMANO:String; bRestock:Boolean; ASuffix, ADispoType:String);

procedure DoInvoiceFromOE(AOwner: TComponent; nArcustoId, nOrdersId, nTermsId, nCurrencyId:Real);
procedure DoInvoiceFromPackSlip(AOwner: TComponent; nArcustoId, nShipmentsId:Real);

const
(*Copied from oe_rscstr.pas for demo purposes and to limit used units*)
  cTXT0000001 = 'Item #';
  cTXT0000002 = 'Description';
  cTXT0000003 = 'Class';
  cTXT0000004 = 'Revision';
  cTXT0000005 = 'Cannot find selected Sales Order among current or archived Orders [Order Detail ID: %.0f]';
  cTXT0000006 = 'Updating blanket quantity ...';
  cTXT0000007 = 'Appending Releases ...';
  cTXT0000008 = 'Creating Sales Order...';
  cTXT0000009 = 'Creating Sales Order:'#13'Adding requested item.';
  cTXT0000010 = 'Creating Sales Order:'#13'Updating ...';
  cTXT0000011 = 'Tax Components:';
  cTXT0000012 = 'Calculate aggregated pricing based on Product Code';
  cTXT0000013 = 'Calculate aggregated pricing based on Tier Discount';
  cTXT0000014 = 'Attached credit card: %s';
  cTXT0000015 = 'None';
  cTXT0000016 = 'Warehouse/Division: %s';
  cTXT0000017 = 'N/A';
  cTXT0000018 = 'Customer Status Exception Authorization:'#13#13'%s';
  cTXT0000019 = 'Sales Order Information';
  cTXT0000020 = 'Sales Order Documents';
  cTXT0000021 = 'Do you wish to create an invoice?';
  cTXT0000022 = 'Add or edit miscellaneous item';
  cTXT0000023 = 'Select an Inventory item';
  cTXT0000024 = 'Select an AKA Inventory item';
  cTXT0000025 = 'Edit Cumulative Quantity (currently off).'#13'Click to turn on.';
  cTXT0000026 = 'Edit Cumulative Quantity (currently on).'#13'Click to turn off.';
  cTXT0000027 = 'Request Date';
  cTXT0000028 = 'Please enter Request Date';
  cTXT0000029 = 'Invalid date';
  cTXT0000030 = 'Update %s column title';
  cTXT0000031 = 'Releases with known Ship Dates are hidden.'#13'Click to show.';
  cTXT0000032 = 'Hide releases with known Ship Dates.';
  cTXT0000033 = 'Updating Releases.  Please wait.';
  cTXT0000034 = 'Shipping Partner information is unavailable for %s';
  cTXT0000035 = 'A Transaction 855 has already been created for this Sales Order. Do you wish to create another one?';
  cTXT0000036 = 'Checking availability.  Please wait.';
  cTXT0000037 = 'Cannot create pick ticket.'#13 +
    'Either there are no outstanding releases available for the shipment, Ship To address is not assigned, Item is on Ship Hold'+
    ' or a pick ticket already exists for these releases.';
  cTXT0000038 = 'The release quantity, %f, does not conform to the container (multiples of) release quantity, %f,' +
    ' for Inventory item, %s.'#13'Would you like to change it to the suggested quantity of, %f?';
  cTXT0000039 = 'Missing Purchase Order number.  Cannot group Sales Orders by Customer Purchase Order.';
  cTXT0000040 = 'No system-generated Work Orders found.';
  cTXT0000041 = 'Aggregate pricing has already been calculated for this Sales Order.  Override it?';
  cTXT0000042 = 'Calculate aggregate pricing?';
  cTXT0000043 = 'An aggregate discount has already been calculated for this Sales Order.  Override it?';
  cTXT0000044 = 'Calculate the aggregate discount?';
  cTXT0000045 = 'Update sales price based on the selected release quantity?';
  cTXT0000046 = 'Update unit price for selected item?';
  cTXT0000047 = 'Update unit price for all Sales Order items?';
  cTXT0000048 = 'Total on Order for %s is %.0f.';
  cTXT0000049 = 'The Customer has already been charged for the full amount of this order. Continue?';
  cTXT0000050 = 'The Customer has already been overcharged for this order.  Continue?.';
  cTXT0000051 = 'An invoice has already been charged for this Sales Order.  Continue?';
  cTXT0000052 = 'Default Division: %s';
  cTXT0000053 = 'N/A';
  cTXT0000054 = 'Updating Sales Order:'#13'Adding item %s...';
  cTXT0000055 = 'Intercompany Order';
  cTXT0000056 = 'Update the linked Service Labor Meeting in CRM?';
  cTXT0000057 = 'CRM Service Labor Meetings are linked to this Sales Order.  Cannot delete.';
  cTXT0000058 = 'Accessing Sales Orders.  Please wait.';
  cTXT0000059 = 'Outsource Order';
  cTXT0000060 = 'Compressing tables.  Please wait...';
  cTXT0000061 = 'Do you want to modify commissions on all detail items?';
  cTXT0000062 = 'Error updating records.';
  cTXT0000063 = 'Accessing Archived Sales Orders. Please wait.';
  cTXT0000064 = 'This customer is over the credit limit. Continue?';
  cTXT0000065 = 'This customer is over the credit limit.';
  cTXT0000066 = 'Sales Order Extended Note';
  cTXT0000067 = 'Release shipped in full.  Continue?';
  cTXT0000068 = 'Release shipped in full.  Cannot delete.';
  cTXT0000069 = 'Delete selected record(s)?';
  cTXT0000070 = 'Cannot convert pending order.';
  cTXT0000071 = 'Do you wish to convert to Sales Orders?';
  cTXT0000072 = 'Processing.  Please wait...';
  cTXT0000073 = 'Do you wish to send acknowledgment e-mail(s)?';
  cTXT0000074 = 'Web Order Ref # %s';
  cTXT0000075 = 'Creating report (%s).  Please wait...';
  cTXT0000076 = 'Web Order Reference number, %s, was processed successfully on %s';
  cTXT0000077 = 'Web Order Acknowledgment';
  cTXT0000078 = 'Web Sales Order Processing';
  cTXT0000079 = 'Web Sales Order Processing (%s)';
  cTXT0000080 = 'C.O.D.';
  cTXT0000081 = 'Prepaid';
  cTXT0000082 = 'On Account';
  cTXT0000083 = 'Credit Card';
  cTXT0000084 = 'Sales Order for %s (Customer # %s)';
  cTXT0000085 = 'PO # %s is already assigned to the selected customer. Proceed?';
  cTXT0000086 = 'PO # %s is already assigned to the selected customer - operation aborted.';
  cTXT0000087 = 'A Shipping address has not been assigned to the Sales Order.';
  cTXT0000088 = 'Sales Order Deleted';
  cTXT0000089 = 'Sales Order Archived and Deleted';
  cTXT0000090 = 'Module: Sales Orders, Sales Order #: %s, Action: %s';
  cTXT0000091 = 'Please enter an item description.';
  cTXT0000092 = 'Item %s has a setup charge of %s';
  cTXT0000093 = 'Total:  %m'      ;
  cTXT0000094 = 'Current:  %m'    ;
  cTXT0000095 = 'Credit Limit: %m';
  cTXT0000096 = 'Open to buy: %m' ;
  cTXT0000097 = 'The blanket quantity has changed. Update the unit price?';
  cTXT0000098 = 'Please create an order line item before trying to add releases.';
  cTXT0000099 = 'The release you are editing has been shipped in full. Shipment History ' +
      'information will NOT be updated with your changes. To affect shipment ' +
      'information, changes must be made to the release prior to packing slip generation.'#13#13 +
      'Do you want to cancel the changes?';
  cTXT0000100 = 'The total release quantity for item, %s, is greater than the blanket quantity.';
  cTXT0000101 = 'Please enter a release quantity.';
  cTXT0000102 = 'The release quantity must be greater than 0.';
  cTXT0000103 = 'Sales Order Item Information';
  cTXT0000104 = 'Parent record not found.  Cannot post.';
  cTXT0000105 = 'The total commission is greater than 100%.  Cannot post.';
  cTXT0000106 = 'Misc. Item'; // Miscellaneous Item
  cTXT0000107 = 'The order line is linked to a pick ticket with assigned inventory locations (PT# %.0f) - operation aborted.';
  cTXT0000108 = 'GL Account requires entry of a Cost Source.';
  cTXT0000109 = 'The order line is linked to a pick ticket (PT# %.0f) - operation aborted.';
  cTXT0000110 = 'Please enter Orders#';
  cTXT0000111 = 'Sales Order Cloned.';
  cTXT0000112 = 'Total on Sales order:  %m' ;
  cTXT0000113 = 'Customer Status was changed to %s';
  cTXT0000114 = 'Clear the Campaign Code?';
  cTXT0000115 = 'Sales Order %s for %s (Customer # %s)';
  cTXT0000116 = 'Freight Quote# %s';
  cTXT0000117 = 'Are you sure you want to mark all items ''On Hold''?';
  cTXT0000118 = 'Are you sure you want to unmark all items as being ''On Hold''?';
  cTXT0000119 = 'Release partially shipped.  Continue?';
  cTXT0000120 = 'Release partially shipped.  Cannot delete.';
  cTXT0000121 = 'Get freight estimate from Web service';
  cTXT0000122 = 'Would you like shipping rate and class to be calculated based on user assigned values?';
  cTXT0000123 = 'Would you like shipping rate and class to be calculated for you?';
  cTXT0000124 = 'Finished calculating shipping rate and class.';
  cTXT0000125 = 'BOL information is unavailable.';
  cTXT0000126 = 'This option calculates shipping rate and class for each item based on user assigned values.  Please confirm to continue.';
  cTXT0000127 = 'This option calculates default shipping rate and class for each item - please confirm to continue.';
  cTXT0000128 = 'Finished calculating shipping rates and classes for all items.';
  cTXT0000129 = 'One or more items had no BOL information available.';
  cTXT0000130 = 'Calculated Freight Quote #%s.';
  cTXT0000131 = 'Order detail line is marked ''Drop-Ship'' - operation is not supported.';
  cTXT0000132 = 'Unarchive the selected Sales Orders?';
  cTXT0000133 = 'Are you sure you want to hide this line item with existing backlog?';
  cTXT0000134 = 'Ship To Address has changed to a different tax code or salesperson.  Update order details to new tax code or salesperson?';
  cTXT0000135 = 'The quantity, %f, does not conform to the container (multiples of) quantity, %f,' +
    ' for Inventory item, %s.'#13'Would you like to change it to the suggested quantity of, %f?';
  cTXT0000136 = 'Calculate aggregated pricing based on AKA/Product Code';
  cTXT0000137 = 'Do you wish to update the Date for every sales order line item with the Delivery Date?';
  cTXT0000138 = 'This option is not available on a Misc. or Non-Material Item';
  cTXT0000139 = 'A Transaction 865 has already been created for this Sales Order. Do you wish to create another one?';
  cTXT0000140 = 'Cannot toggle Expedited to ''Y'' for a shipped in full release.';
  cTXT0000141 = 'The Must Ship Date + Std Lead Days is equal to or greater than the Promise Date';
  cTXT0000142 = 'Please enter a description.';
  cTXT0000143 = 'Campaign codes assigned to detail items will be cleared.  ' +
   'Do you wish to continue?';
  cTXT0000144 = 'Miscellaneous item description required.';
  cTXT0000145 = 'Cannot delete a shipped item.';
  cTXT0000146 = 'The requested date and/or promised date occurs in the past.'#13#13'Are you sure you want to continue?';
  cTXT0000147 = 'Item# %s: '#13#13;
  cTXT0000148 = 'The release quantity, %f, is less than the Minimum Selling ' +
    'quantity, %f, for Inventory Item, %s.  Would you like to change it to ' +
    'the Minimum Selling quantity of, %f?';
  cTXT0000149 = 'The selected quantity (%f %s) is less than the minimum ' +
      'quantity (%f %s) in the Quantity/Price breaks table (%s).  Do you ' +
      'want to continue?';
  cTXT0000150 = 'Are you sure you want to delete and/or archive the Auto ' +
    'MRP Sales Order # %s';
  cTXT0000151 = 'Customer Bill To Status Exception Authorization:'#13#13'%s';
  cTXT0000152 = 'Would you like to recalculate CTP?';
  cTXT0000153 = 'Ship In Full CTP date is undefined';
  cTXT0000154 = 'Assign all promise dates Ship In Full CTP date?';
  cTXT0000155 = 'Assign line item CTP to the Sales Order?';
  cTXT0000156 = 'Manual Outsource Order';

  cTXT0000157 = 'Sales order pricing has expired. Inventory Default Standard ' +
    'Item Price will be used instead. Continue?';
  cTXT0000158 = 'Cannot change Ship Hold for CIA customer';
  cTXT0000159 = 'The quantity, %f, is less than the Minimum Selling ' +
    'quantity, %f, for Inventory Item, %s.  Would you like to change it to ' +
    'the Minimum Selling quantity of, %f?';
  cTXT0000160 = 'Outsource details for OE# %s, Item# %s';
  cTXT0000161 = 'Multiselect is unavailable for miscellaneous items.  ' +
    'Please use the "insert" button.';
  cTXT0000162 = 'Please select an Inventory item.';
  cTXT0000163 = 'Sales Order PO number has changed. Update Order Detail PO Info?';
  cTXT0000164 = 'AKA Revision';
  cTXT0000165 = 'AKA Description';
  cTXT0000166 = 'AKA Item #';
  cTXT0000167 = 'AKA Extended Description';
  cTXT0000168 = 'Ship To has changed, taxes will need to be recalculated.';
  cTXT0000169 = 'Changes have been made since taxes were last calculated. Recalculate now?';
  cTXT0000170 = 'Direct modification of phantom component is not allowed.  Operation aborted.';
  cTXT0000171 = 'An invoice exists against this CIA Order.  Cannot modify or delete.';
  cTXT0000172 = 'C.O.D.';
  cTXT0000173 = 'Prepaid';
  cTXT0000174 = 'On Account';
  cTXT0000175 = 'Credit Card';
  cTXT0000176 = 'A shipment exists against this CIA Order.  Cannot modify or delete.';
  cTXT0000177 = 'A cash receipt exists against this CIA Order.  Cannot modify or delete.';
  cTXT0000178 = 'This order contains ship-to addresses on the release level. A single pickticket '+
                'cannot be created for multiple ship-to addresses.';
  cTXT0000180 = 'Please select a customer.';
  cTXT0000181 = 'Please select a PO';
  cTXT0000182 = 'Please assign a Vendor.';
  cTXT0000183 = 'Please select one or more Sales Orders.';
  cTXT0000184 = 'Child of BOGO Item, cannot edit';

var
  FrmInvoice: TFrmInvoice;

implementation
{$R *.DFM}
uses
//  APConf2,
//  aptax,
//  ArAcSplt,
//  ARMiscItem,
//  ArPrepTax,
//  ARPrintConf,
//  ArShare,
//  ArTerms,
//  avalara,
//  BatView,
//  ChangeInvoiceNo,
//  ConfCommChange,
//  CStat,
//  CustDocs,
//  DateDlg,
//  edbadord,
//  EDIConst,
//  EditBill,
//  EditBTo,
//  IFreight,
//  InvCode,
//  IPeriod,
//  IqAccShr,
//  IQAttachedDocumentsCoordinator,
//  iqcc,
//  iqcc_utils,
//  IQComExe,
//  iqctrl,
//  IqCursor,
//  IQMS.Dates,
//  IqErrDlg,
//  IQHelpHk,
//  IqInQry,
  IQMS.Common.DataLib,
//  IqLocks,
//  IqMesg,
//  IqMisc,
//  IQNLS,
  IQMS.Common.Numbers,
//  IqPrint,
//  IqRegFrm,
//  IQSecIns,
//  IqSecMan,
  IQMS.Common.Sequence, (*todo - replace with IQMS.Common.OracleSequences*)
  IQMS.Common.StringUtils,
//  IQMS.Common.Strings,
//  IqUsrMsg,
//  ISelCust,
//  IV_Void,
//  IView,
//  JumpDispatcher,
//  MCARDet,
//  MCARTot,
//  MCFrmBas,
//  McShare,
//  Oe_hist,
//  oe_main,
//  OEComm,
//  oe_rscstr,
//  Plnt_Bas,
//  Prn_Doc,
//  Prn_Share,
//  PrnArPre,
//  PrnARPost,
//  PsMaint,
//  qc_docmaint,
//  RepInfo,
//  Rma_Const,
//  Rma_Main,
//  SetPlant,
  System.Math
//  TaxMain,
//  Terms,
//  UnitPriceAcctSplit,
//  wDateDlg;
;

procedure TFrmInvoice.UniFrameCreate(Sender: TObject);
begin
  StartUp(Self.Owner, '', 0);
  IQSetTablesActive(True, self);
  // FormCreate //

  // CenterForm( Self ); // iqctrl.pas; center form before applying reg settings
//  IQRegFormRead(self, [self, GridInvoiceDetail,
//    PnlHeader01, PnlHeader02, PnlHeader03,
//    PnlHeaderLeft01, PnlHeaderLeft02, PnlHeaderLeft03,
//    PnlTotalsLabels, PnlTotals, Panel2, Panel4, PnlTop]); // IQRegFrm

  FMultiSelect := false; // initialize
//  IQRegBooleanScalarRead(self, 'FMultiSelect', FMultiSelect);
  MultiselectDetail1.Checked := FMultiSelect;
  EnableMultiSelect(MultiselectDetail1.Checked);
  // enforce grid multiselect based on checked state

  // Adjust page Vcl.Controls to parent panels
//  AdjustPageControlToParent(PageControl1); // iqctrl
  PageControl2.ActivePageIndex := 0;
  // 'Accessing Accounts Receivable Invoices.  Please wait.';
  IQSetTablesActiveEx(True, DM, cTXT0000087);
//  iqctrl.ResizeCheckBoxes(self, PnlToolbarMain);
//  iqctrl.ResizeCheckBoxes(self, PnlToolbarDetail);


end;

procedure TFrmInvoice.UniFrameDestroy(Sender: TObject);
begin
//
end;

procedure CheckDefaultAccounts;
begin
  if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_fg'') from dual') = 0 then
    raise Exception.Create('Default FG account value not assigned, please assign System Parameters');

  if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_ar'') from dual') = 0 then
    raise Exception.Create('Default AR account value not assigned, please assign System Parameters');

  if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_sales'') from dual') = 0 then
    raise Exception.Create('Default Sales account value not assigned, please assign System Parameters');

  if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_cogs'') from dual') = 0 then
    raise Exception.Create('Default Cost of Goods account value not assigned, please assign System Parameters');

  if SelectValueAsFloat(Format('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
      [FormatDateTime('mm/dd/yyyy', Date)])) = 0 then
    raise Exception.Create('Current G/L period not available, please assign');

  if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
  begin
    if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_fx'') from dual') = 0 then
    raise Exception.Create('Default Foreign Exchange account value not assigned, please assign System Parameters');

    if SelectValueAsString('select group_name from glacct_def where group_name = ' +
                '(select FX_SEGMENT_NAME from iqsys)') = '' then
     raise Exception.Create('G/L Account Structure Foreign Currency Segment Name not assigned.'#13 +
                             'Please assign System Parameters')
  end;

  if SelectValueAsString('select NVL(use_accrued_comm, ''N'') from iqsys where rownum < 2') = 'Y' then
  if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_accrue_comm'') from dual') = 0 then
    raise Exception.Create('Default Accrued Commissions account value not assigned, please assign System Parameters');


end;

procedure DoInvoice(cType:String);
begin
  CheckDefaultAccounts;
  TFrmInvoice.Create(Application, cType).Show;
end;

procedure DoInvoiceJump(nId:Real);
begin
  CheckDefaultAccounts;
  TFrmInvoice.CreateJump(Application, nId).Show;
end;

procedure DoMultiInvoiceFromRMA(AOwner:TComponent; bRestock:Boolean);
begin
  CheckDefaultAccounts;
{  with TFrmInvoice.CreateMultipleRMA(AOwner, bRestock) do
  try
    if not FDoNotShow then
      ShowModal;
  finally
    Free;
  end; }
end;

procedure DoInvoiceFromRMA(nArcustoId, nQty, nOrderDtlId,
                           nShipmentDtlId, nArinvtId,
                           nRmaDtlId, nUnitPrice:Real; cRMANO:String; bRestock:Boolean; ASuffix, ADispoType:String);
begin
  CheckDefaultAccounts;
 { with  TFrmInvoice.CreateRMA(Application, nArcustoId,
                         nQty, nOrderDtlId, nShipmentDtlId,
                         nArinvtId, nRmaDtlId, nUnitPrice, cRMANO, bRestock, ASuffix, ADispoType) do
  try
    ShowModal;
  finally
    Free;
  end;
  }
end;

procedure DoFinanceCharge(AOwner: TComponent; AArcustoId, ATermsId, ACurrencyId, AAmount:Real);
begin
  CheckDefaultAccounts;
  with  TFrmInvoice.CreateFinancingCharge(AOwner, AArcustoId, ATermsId, ACurrencyId, AAmount) do
  try
//    ShowModal;
  finally
    Free;
  end;
end;


procedure DoInvoiceFromOE(AOwner: TComponent; nArcustoId, nOrdersId, nTermsId, nCurrencyId:Real);
begin
  CheckDefaultAccounts;
{  with  TFrmInvoice.CreateOE(AOwner, nArcustoId, nOrdersId, nTermsId, nCurrencyId) do
  try
    ShowModal;
  finally
    Free;
  end;    }
end;

procedure DoInvoiceFromPackSlip(AOwner: TComponent; nArcustoId, nShipmentsId:Real);
begin
  CheckDefaultAccounts;
  with  TFrmInvoice.CreatePackslip(AOwner, nArcustoId, nShipmentsId) do
  try
//    ShowModal;
  finally
    Free;
  end;
end;


constructor TFrmInvoice.CreateFinancingCharge(AOwner: TComponent; AArcustoId, ATermsId, ACurrencyId, AAmount:Real);
var
  nAcctId, nFreightId, nShipmentDtlId, nBillToID, nEPlantId:Real;
  nId, AId:Real;
  APer1000:String;
  ACount, ATotal:Integer;
begin
//  try
//    StartUp(AOwner, 'AR', 0);
//    fInset:= True;
//    nId := GetNextID('ARPREPOST');
//
//    if SecurityManager.EPlant_ID = 'NULL' then
//      nEPlantId := 0
//    else
//      nEPlantId := '1';
//
//    InvoiceNumber := GetNewInvoiceNumber(nEPlantId);
//
//    nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(ar_glacct_id, ''acct_id_ar'', %f ) from arcusto where id = %f',
//                       [nEPlantId, AArcustoId]);
//
//    if nAcctId = 0 then
//      nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_ar'', %f) from dual', [nEPlantId]);
//
//
//    ExecuteCommandFmt(
//    'insert into arprepost (id,                                                                          ' +
//    '                       invoice_date,                                                                ' +
//    '                       INVOICE_NO,                                                                  ' +
//    '                       TERMS_ID,                                                                    ' +
//    '                       ON_HOLD,                                                                     ' +
//    '                       PRIOR_ENTRY,                                                                 ' +
//    '                       ARCUSTO_ID,                                                                  ' +
//    '                       CURRENCY_ID,                                                                 ' +
//    '                       BILL_TO_ID,                                                                  ' +
//    '                       GLPERIODS_ID_AR,                                                             ' +
//    '                       GLACCT_ID_AR,                                                                ' +
//    '                       ctrl_eplant_id,                                                              ' +
//    '                       notes,                                                                       ' +
//    '                       exclude_from_fin_charge,                                                     ' +
//    '                       userid,                                                                      ' +
//    '                       INV_PREFIX)                                                                  ' +
//    '                select %f,                                                                          ' +
//    '                       To_Date(''%s'', ''MM/DD/RRRR''),                                             ' +
//    '                       ''%s'',                                                                      ' +
//    '                       Decode(%f, 0.00, '''', %f),                                                  ' +
//    '                       ''N'',                                                                       ' +
//    '                       ''N'',                                                                       ' +
//    '                       Decode(%f, 0.00, '''', %f),                                                  ' +
//    '                       Decode(%f, 0.00, '''', %f),                                                  ' +
//    '                       b.id,                                                                        ' +
//    '                       p.id,                                                                        ' +
//    '                       Decode(%f, 0, null, %f),                                                     ' +
//    '                       Decode(%f, 0, null, %f),                                                     ' +
//    '                       ''Finance Charge Invoice'',                                                  ' +
//    '                       ''Y'',                                                                       ' +
//    '                       ''%s'',                                                                       ' +
//    '                       a.ecode                                                                      ' +
//    '                  from (select min(id) as id from bill_to where arcusto_id = %f and NVL(pk_hide, ''N'') = ''N'') b,                 ' +
//    '                       (select min(id) as id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1) p,   ' +
//    '                       (select ecode from iqsys) a                                ',
//                            [nId,
//                             FormatDateTime('mm/dd/yyyy', Date),
//                             InvoiceNumber,
//                             ATermsId,
//                             ATermsId,
//                             AArcustoId,
//                             AArcustoId,
//                             ACurrencyId,
//                             ACurrencyId,
//                             nAcctId,
//                             nAcctId,
//                             nEplantId,
//                             nEplantId,
//                             SecurityManager.UserName,
//                             AArcustoId,
//                             FormatDateTime('mm/dd/yyyy', Date)]);
//
//
//    nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(ACCT_ID_FINANCE, ''acct_id_sales'', %f ) from iqsys2',  [nEPlantId]);
//
////    nAcctId := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_sales'') from dual');
//
//    ExecuteCommandFmt('insert into arprepost_detail ' +
//              '(arprepost_id, ' +
//              'GLACCT_ID_SALES, ' +
//              'unit_price, ' +
//              'invoice_qty, ' +
//              'misc_comment, ' +
//              'eplant_id ) ' +
//              'values (%f, ' +
//              '%f, ' +
//              '%f, ' +
//              '1, ' +
//              '''Finance Charge'', ' +
//              'decode(%f, 0, null, %f))',
//              [nId, nAcctId, AAmount, nEplantId, nEplantId]);
//
//    ReopenQryArPrePost;
//    ReopenQryArPrePostDetail;
//
//    QryArPrepost.Close; QryArPrepost.Open;
//    QryArPrePost.Locate('ID', nId, []);
//    AssignEPlantCurrency(QryArPrePost, QryArPrePostCURRENCY_ID, 'ARCUSTO', QryArPrePostARCUSTO_ID.asFloat);
//    QryArPrepost.Post;
//
//
//    CheckCurrencyRate;
//    ReplaceGLACCT_ID_AR_with_MC_Account(QryArPrePost.FieldByName('CURRENCY_ID').asFloat);
//    with QryArPrePost do
//    begin
//      if not(State in [dsInsert, dsEdit]) then Edit;
//      AssignDueDate;
//      CheckBrowseMode;
//    end;
//    ReopenQryArPrePost;
//    ExecuteCommandFmt('update arcusto set LAST_FINANCE_CHARGE_DATE = Trunc(sysdate) where id = %f', [AArcustoId]);
//  finally
//  end;
//  QryArPrePost.Edit;
//  with DbEditInvoice do
//  begin
//    ReadOnly := False;
//    Color := clWindow;
//  end;
end;


constructor TFrmInvoice.CreatePackslip(AOwner: TComponent; nArcustoId, nShipmentsId:Real);
var
  nAcctId, nFreightId, nShipmentDtlId, nBillToID, nEPlantId, nTermsId, nCurrencyId:Real;
  ABillToId, AShipToId:Real;
  nId, AId:Real;
  APer1000:String;
  ACount, ATotal:Integer;
  ARmaDtlId, ASalesRmaAcctId:Real;
  AccId:Real;
  Arinvtid:Real;
  AFreightGlAcctId:Real;
begin
//  try
//    FAllowCIAChanges := true;
//    StartUp(AOwner, 'AR', 0);
////    IqTiming1.Start('CreateOE');
//    fInset:= True;
//
//    with TFDStoredProc.Create(nil) do
//    try
//      Connection := db_dm.FDConnection;
//      StoredProcName:= 'IQMS.AR.CREATE_INVOICE_FROM_PACKSLIP';
//      Prepare;
//      ParamByName('p_shipments_id').ParamType:= ptInput;
//      ParamByName('p_shipments_id').Value:= Trunc(nShipmentsId);
//      ParamByName('p_new_arprepost_id').ParamType:= ptOutput;
//      ExecProc;
//      nId  := Params.ParamByName( 'p_new_arprepost_id' ).AsLargeInt;
//
// //     with Params.CreateParam( ftFloat, 'p_shipments_id', ptInput ) do
// //       AsFloat := Trunc(nShipmentsId);
// //     Params.CreateParam( ftFloat, 'p_new_arprepost_id', ptOutput );
// //     Prepare;
// //     ExecProc;
// //     nId  := Params.ParamByName( 'p_new_arprepost_id' ).AsLargeInt;
//    finally
//      Free;
//    end;

(*
    nId := GetNextID('ARPREPOST');
    nEPlantId := SelectValueFmtAsFloat('select eplant_id from shipments where id = %f', [nShipmentsId]);

    InvoiceNumber := GetNewInvoiceNumber(nEPlantId);

    AccId := 0;
//    AccId := SelectValueFmtAsFloat('select arcusto_credit_card_id from shipments where id = %f', [nOrdersId]);

    ABillToId := SelectValueFmtAsFloat('select bill_to_id from shipments where id = %f', [nShipmentsId]);
    if ABillToId = 0 then
      ABillToId := SelectValueFmtAsFloat('select id from bill_to where arcusto_id = %f and NVL(default_bill_to, ''N'')  = ''Y''', [nArcustoId]);
    if ABillToId = 0 then
      ABillToId := SelectValueFmtAsFloat('select min(id) from bill_to where arcusto_id = %f', [nArcustoId]);
    AShipToId := SelectValueFmtAsFloat('select ship_to_id from shipments where id = %f', [nShipmentsId]);

    nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(ar_glacct_id, ''acct_id_ar'', %f ) from arcusto where id = %f',
                       [nEPlantId, nArcustoId]);

    if nAcctId = 0 then
      nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_ar'', %f) from dual', [nEPlantId]);

    nTermsId := SelectValueFmtAsFloat('select terms_id from c_ship_hist where shipments_id = %f', [nShipmentsId]);
    nCurrencyId := SelectValueFmtAsFloat('select currency_id from c_ship_hist where shipments_id = %f', [nShipmentsId]);

    ExecuteCommandFmt(
    'insert into arprepost (id,                                                                          ' +
    '                       arcusto_credit_card_id,                                                      ' +
    '                       invoice_date,                                                                ' +
    '                       INVOICE_NO,                                                                  ' +
    '                       TERMS_ID,                                                                    ' +
    '                       ON_HOLD,                                                                     ' +
    '                       PRIOR_ENTRY,                                                                 ' +
    '                       ARCUSTO_ID,                                                                  ' +
    '                       CURRENCY_ID,                                                                 ' +
    '                       BILL_TO_ID,                                                                  ' +
    '                       GLPERIODS_ID_AR,                                                             ' +
    '                       GLACCT_ID_AR,                                                                ' +
    '                       ctrl_eplant_id,                                                              ' +
    '                       USERID,                                                                     ' +
    '                       INV_PREFIX)                                                                  ' +
    '                select %f,                                                                          ' +
    '                       Decode(%f, 0, null, %f),                                                     ' +
    '                       To_Date(''%s'', ''MM/DD/RRRR''),                                             ' +
    '                       ''%s'',                                                                      ' +
    '                       Decode(%f, 0.00, '''', %f),                                                  ' +
    '                       ''N'',                                                                       ' +
    '                       ''N'',                                                                       ' +
    '                       Decode(%f, 0.00, '''', %f),                                                  ' +
    '                       Decode(%f, 0.00, '''', %f),                                                  ' +
    '                       Decode(%f, 0, null, %f),                                                     ' +
    '                       p.id,                                                                        ' +
    '                       Decode(%f, 0, null, %f),                                                     ' +
    '                       Decode(%f, 0, null, %f),                                                     ' +
    '                       ''%s'',                                                                      ' +
    '                       a.ecode                                                                      ' +
    '                  from (select min(id) as id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1) p,   ' +
    '                       (select ecode from iqsys) a                                ',
                            [nId,
                             AccId,
                             AccId,
                             FormatDateTime('mm/dd/yyyy', Date),
                             InvoiceNumber,
                             nTermsId,
                             nTermsId,
                             nArcustoId,
                             nArcustoId,
                             nCurrencyId,
                             nCurrencyId,
                             ABillToId,
                             ABillToId,
                             nAcctId,
                             nAcctId,
                             nEplantId,
                             nEplantId,
                             SecurityManager.UserName,
                             FormatDateTime('mm/dd/yyyy', Date),
                             nEplantId]);


    nAcctId := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_sales'') from dual');

    HMsg.Mesg := cTXT0000006; // 'Inserting detail records...'


//     if  SelectValueFmtAsFloat('select count(id) ' +
//                  'from ord_detail where orders_id = %f ' +
//                   'and id in (select NVL(ord_detail_id, 0) from arprepost_detail)', [nOrdersId]) <> 0
//     then IQConfirm(cTXT0000097);


    AFreightGlAcctId := 0;
    nFreightId := GetfreightId2(nShipmentsId);
    if nFreightId <> 0 then
    begin
       AFreightGlAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(glacct_id_freight, ''acct_id_shipping'', %f) from freight where id = %f',
        [nEPlantId, nFreightId]);
    end;


    ExecuteCommandFmt('insert into arprepost_detail ' +
              '(arprepost_id, ' +
              'GLACCT_ID_SALES, ' +
//              'freight_price, ' +
              'ord_detail_id, ' +
              'shipment_dtl_id, ' +
              'unit_price, ' +
              'invoice_qty, ' +
              'comm_pcnt, ' +
              'salespeople_id, ' +
              'tax_code_id, ' +
              'eplant_id,    ' +
              'misc_comment, ' +
              'cost_object_id, ' +
              'ref_code_id, ' +
              'rma_detail_id, ' +
              'PONO_FROM_SO, ' +
              'freight_id, ' +
              'GLACCT_ID_FREIGHT, ' +
              'FREIGHT_PRICE, ' +
              'cost_object_source ) ' +
              'select %f, ' +
              'NVL(v.glacct_id, %f), ' +
//              '0, ' +
              'd.order_dtl_id, ' +
              'd.id, ' +
              'NVL(v.unit_price, (select NVL(min(unit_price), 0) from c_ship_hist where shipment_dtl_id = d.id)), ' +
              'd.qtyshipped, ' +
//              'Decode(NVL(od.cumm_shipped, 0), 0, d.qtyshipped, od.cumm_shipped), ' +
              'v.comm_pct, ' +
              'v.salespeople_id, ' +
              'v.tax_code_id, ' +
              'o.eplant_id, ' +
              'NVL(v.comment1, d.cmtline), ' +
              'v.cost_object_id, ' +
              'v.ref_code_id, ' +
              'v.rma_detail_id, ' +
              'v.pono, ' +
              'decode(%f, 0, null, %f), ' +
              'decode(%f, 0, null, %f), ' +
              'o.AUTO_FREIGHT_PRICE, ' +
              'v.cost_object_source ' +
              'from shipment_dtl d, shipments o, V_ORD_COMB_ALL v  ' +
              'where d.shipments_id = %f ' +
              'and d.shipments_id = o.id ' +
              'and d.order_dtl_id = v.ord_detail_id(+) ' +
              'and d.id not in (select NVL(shipment_dtl_id, 0) from arprepost_detail) ' +
              'and d.id not in (select NVL(shipment_dtl_id, 0) from arinvoice_detail) ' +
              ' and NVL(d.PHANTOM_ORD_DETAIL_ID, 0) = 0 ',
              [nId, nAcctId,
               nFreightId, nFreightId,
               AFreightGlAcctId, AFreightGlAcctId,
               nShipmentsId]);

    ExecuteCommandFmt('begin ar.AdjustFreightPrice(%f); end;', [nId]);

*)
    ReopenQryArPrePost;
    ReopenQryArPrePostDetail;

    QryArPrepost.Close; QryArPrepost.Open;
    QryArPrePost.Locate('ID', nId, []);

    CheckCurrencyRate;
    ReplaceGLACCT_ID_AR_with_MC_Account(QryArPrePost.FieldByName('CURRENCY_ID').asFloat);
    with QryArPrePost do
    begin
      if not(State in [dsInsert, dsEdit]) then Edit;
      AssignDueDate;
      CheckBrowseMode;
    end;
    ReopenQryArPrePost;

    dbWWBillToDropDown(nil);
 //   dbWWBillTo.Text := SelectValueFmtAsString('select attn from bill_to where id = %f', [ABillToId]);
(*
    ACount := 0;
    ATotal := Trunc(SelectValueFmtAsFloat('select count(id) from arprepost_detail where arprepost_id = %f', [nId]));

    with QryArPrePostDetail do
    begin
      First;
      while not eof do
      begin
        Inc(ACount);
        HMsg.Mesg := Format(cTXT0000008 {'Updating record %d of %d'}, [ACount, ATotal]);
        AssignCommissions;
        APer1000 := SelectValueFmtAsString('select price_per_1000 from aka where arinvt_id = %f and arcusto_id = %f ' +
                                 ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
                              [FieldByName('Ordarinvtid').asFloat,
                               QryArPrepost.FieldByName('arcusto_id').asFloat,
                               QryArPrepost.FieldByName('arcusto_id').asFloat,
                               AShipToId]);

        if APer1000 = '' then
          APer1000 := SelectValueFmtAsString('select price_per_1000 from arinvt where id = %f',
                                [FieldByName('Ordarinvtid').asFloat]);



//        Edit;

        ExecuteCommandFmt('update arprepost_detail set PRICE_PER_1000_YN = ''%s'' where id = %f',
                   [APer1000, QryARPrepostDetailID.asFloat]);


       Arinvtid := SelectValueFmtAsFloat('select arinvt_id from ord_detail where id = %f',
                              [QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat]);





       if SelectValueFmtAsString('select NVL(sample, ''N'') from ord_detail where id = %f', [QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat]) = 'N' then
         ExecuteCommandFmt('insert into ARPREPOST_DETAIL_SALES (ARPREPOST_DETAIL_ID, glacct_id, percentage) ' +
                  ' select %f, glacct_id, percentage from arinvt_sales_split where arinvt_id = %f',
                  [QryArPrePostDetail.FieldByName('ID').asFloat, Arinvtid]);



//        FieldByName('PRICE_PER_1000_YN').asString := APer1000;

        if APer1000 = 'Y' then
          ExecuteCommandFmt('update arprepost_detail set PRICE_PER_1000 = %.6f where id = %f',
                     [SelectValueFmtAsFloat('select price_per_1000 from ord_detail where id = %f', [QryARPrepostDetailORD_DETAIL_ID.asFloat]), QryARPrepostDetailID.asFloat]);
//          ExecuteCommandFmt('update arprepost_detail set PRICE_PER_1000 = %.6f where id = %f',
//                     [QryARPrepostDetailUNIT_PRICE.asFloat * 1000, QryARPrepostDetailID.asFloat]);
//          QryARPrepostDetailPRICE_PER_1000.asFloat := QryARPrepostDetailUNIT_PRICE.asFloat * 1000;



        ARmaDtlId := SelectValueFmtAsFloat('select rma_detail_id from ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
        if ARmaDtlId = 0 then
          ARmaDtlId := SelectValueFmtAsFloat('select rma_detail_id from hist_ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);


        ASalesRmaAcctId := 0;
        if ARmaDtlId <> 0 then
          ASalesRmaAcctId := SelectValueFmtAsFloat('select f.glacct_id_sales_rma from failure_code f, rma_detail r where r.failure_code_id = f.id and r.id = %f', [ARmaDtlId]);


        if ASalesRmaAcctId = 0 then
        begin
          nAcctId := SelectValueFmtAsFloat('select oe_misc2.Get_ord_detail_glacct_id(%f) from dual', [FieldByName('ORD_DETAIL_ID').asFloat]);

//          nAcctId := SelectValueFmtAsFloat('select glacct_id from ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);

          if nAcctId = 0 then
          begin
            nAcctId := SelectValueFmtAsFloat('select g.acct_id_sales ' +
                                 'from arinvt a, arinvt_group g, ' +
                                 'ord_detail d ' +
                                 'where d.arinvt_id = a.id and a.arinvt_group_id = g.id ' +
                                 'and d.id = %f',
                                 [FieldByName('ORD_DETAIL_ID').asFloat]);


            if nAcctId = 0 then
              nAcctId := SelectValueFmtAsFloat('select acct_id_sales ' +
                                   'from arinvt a, ' +
                                   'ord_detail d ' +
                                   'where d.arinvt_id = a.id ' +
                                   'and d.id = %f',
                                   [FieldByName('ORD_DETAIL_ID').asFloat]);
            if nAcctId = 0
              then nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_sales'', %f) from dual',
                                        [FieldByName('EPLANT_ID').asFloat]);
            if nAcctId <> 0 then
              ExecuteCommandFmt('update arprepost_detail set GLACCT_ID_SALES = %f where id = %f',
                         [nAcctId, QryARPrepostDetailID.asFloat]);
          end;

        end;


        nShipmentDtlId := SelectValueFmtAsFloat('select Max(id) from ' +
                                    'shipment_dtl ' +
                                    'where order_dtl_id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
        if nShipmentDtlId <> 0 then
          ExecuteCommandFmt('update arprepost_detail set SHIPMENT_DTL_ID = %f where id = %f',
                     [nShipmentDtlId, QryARPrepostDetailID.asFloat]);
//          FieldByName('SHIPMENT_DTL_ID').asFloat := nShipmentDtlId;

//        Post;

       InsertCommodity(Arinvtid, QryArPrePostDetail.FieldByName('ID').asFloat);
       Insert_Deduct_from_Invoice_Total(QryArPrePostDetail.FieldByName('ID').asFloat);


        Next;
      end;
      Close; Open;
      First;
    end;
*)
//
//  finally
//    FAllowCIAChanges := false;
//  end;
//  if not IsCIA then
//    QryArPrePost.Edit
//  else
//    ExecuteCommandFmt('update arprepost set cia_invoice = ''Y'' where id = %f',  [QryArPrePostID.asFloat]);
//  with DbEditInvoice do
//  begin
//    ReadOnly := False;
//    Color := clWindow;
//  end;
////  IqTiming1.Stop('CreateOE');
end;


procedure TFrmInvoice.AssignCommissions;
begin
  ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, SALESPEOPLE_ID, COMMISSION_PERCENT, amount) ' +
            'select %f, salespeople_id, COMMISSION_PERCENT, NVL(COMMISSION_PERCENT, 0) * %.6f/100 from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f',
            [QryArPrePostDetail.FieldByName('ID').asFloat,
             QryARPrepostDetail.FieldByName('UNIT_PRICE').asFloat * QryARPrepostDetail.FieldByName('INVOICE_QTY').asFloat,
             QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat]);
  ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, SALESPEOPLE_ID, COMMISSION_PERCENT, amount) ' +
            'select %f, salespeople_id, COMMISSION_PERCENT, NVL(COMMISSION_PERCENT, 0) * %.6f/100 from HIST_ORD_DETAIL_COMM where ORD_DETAIL_ID = %f',
            [QryArPrePostDetail.FieldByName('ID').asFloat,
             QryARPrepostDetail.FieldByName('UNIT_PRICE').asFloat * QryARPrepostDetail.FieldByName('INVOICE_QTY').asFloat,
            QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat]);


//  ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, SALESPEOPLE_ID, COMMISSION_PERCENT) ' +
//            'select %f, salespeople_id, COMMISSION_PERCENT from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f',
//            [TblArPrePostDetail.FieldByName('ID').asFloat, TblArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat]);
//  ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, SALESPEOPLE_ID, COMMISSION_PERCENT) ' +
//            'select %f, salespeople_id, COMMISSION_PERCENT from HIST_ORD_DETAIL_COMM where ORD_DETAIL_ID = %f',
//            [TblArPrePostDetail.FieldByName('ID').asFloat, TblArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat]);
  TblComm.Refresh;
end;

constructor TFrmInvoice.Create( AOwner:TComponent; cType:String );
begin
  StartUp(AOwner, cType, 0);
  IQSetTablesActive(True, self);
end;

constructor TFrmInvoice.CreateJump(AOwner:TComponent; nId:Real);
var
  cType:String;
begin
  cType := SelectValueFmtAsString('select PRIOR_ENTRY from arprepost where id = %f', [nId]);
  if cType = 'Y' then cType := 'PRIOR'
  else cType := 'AR';
  StartUp(AOwner, cType, nId);
end;


procedure TFrmInvoice.StartUp( AOwner:TComponent; cType:String; nId:Real );
var
  AType:Integer;
//  AForm:TForm;
begin
//  AForm:= FindFormByClassName( 'TFrmInvoice' );
//  if Assigned( AForm ) then
//  begin
//    if (AForm.WindowState = wsMinimized) then
//      AForm.WindowState := wsNormal;
//    AForm.BringToFront;
//    Abort;
//  end;

  FDetailSaleseAcctId := 0;


  if cType = 'PRIOR' then
  begin
    fPrior := 'Y';
    FHelpConst := 999939;
  end
  else
  begin
    fPrior := 'N';
    if cType = 'AR_RMA' then
       FHelpConst := 1000853
    else
       FHelpConst := 1003709;
//       FHelpConst := 1013915;
  end;

  HelpContext := FHelpConst;

  DM:= TAR_DM.Create(self);
//  inherited Create( AOwner );
//  DM.Name:= '';
//  IqTiming1.Start('Open');

  cbCustComm.Visible := False;

  PCMain.ActivePage := TabInv;

  if FPrior = 'Y' then
  begin
    SBCarryOver.Visible := True;
    CustomerCarryOver1.Visible := True;
    Caption := Caption + ' ' + cTXT0000012 {(Prior Entries)'};
    CBMisc.Visible := False;
//    with TblARPrePostDetail do
    with QryARPrePostDetail do
    begin
      FieldByName('description').visible := false;
      FieldByName('misc_comment').visible := false;
      FieldByName('itemno').visible := false;
      FieldByName('rev').visible := false;
      FieldByName('class').visible := false;
      FieldByName('comm_pcnt').visible := false;
      FieldByName('tax_code').visible := false;
      FieldByName('tax_rate').visible := false;
      FieldByName('salesperson').visible := false;
      FieldByName('total_before_tax').visible := false;
      FieldByName('total_after_tax').visible := false;
      FieldByName('freight_comp').visible := false;
      FieldByName('freight_price').visible := false;
      //FieldByName('pono').visible := false;
      //FieldByName('orderno').visible := false;
    end;
  end
  else
  begin
    SBCarryOver.Visible := False;
    CustomerCarryOver1.Visible := False;
  end;

//  IQSetTablesActiveTimeIt( True, self, IQTiming1);
//  iqTiming1.Start('Open');
  // 'Accessing Accounts Receivable Invoices.  Please wait.';
  IQSetTablesActiveEx( TRUE, self, cTXT0000087 );
//  iqTiming1.Stop('Open');

  if nId <> 0 then
  begin
    ReopenQryArPrePost;
    QryARPrePost.Locate('ID', nId, []);
//    TblARPrePost.Refresh;
  end;

  PageControl1.ActivePage := TabForm;
  //GLPeriodHint := Application.OnHint;
  //Application.OnHint := DisplayHint;
//  GridInvoiceDetail.Cursor := crJump;
//  DBEditCustNo.Cursor := crJump;

  FMultiCurrency := SelectValueAsString('select multicurrency from iqsys') = 'Y';
  CheckMultiCurrency;

  FStdCostPosting := SelectValueAsString('select std_cost_posting from iqsys') = 'Y';
//  with sbComm do
//  begin
//    Parent     := editComm;
//    Height     := TStringGrid(GridInvoiceDetail).DefaultRowHeight;
//    Width      := Height;
//  end;

  FCustPickListDate := Date - 90;
  if False then //not IQRegDateTimeScalarRead( self, 'AR_CUSTOMER_PICKLIST_DATE', FCustPickListDate ) then
  begin
    FCustPickListDate := Date - 90;
//    IQRegDateTimeScalarWrite( self, 'AR_CUSTOMER_PICKLIST_DATE', FCustPickListDate )
  end;

  CustomerPickListDate1.Caption := Format('Customer pick list Date (%s)', [FormatDateTime('mm/dd/yyyy', FCustPickListDate)]);


  AType := 0;

  if False then // IQRegIntegerScalarRead( self, 'AR_CUSTOMER_CARRYOVER', AType ) then
  begin
    Customercarryover1.Checked := AType = 1;
    SBCarryOver.Down         := AType = 1;
  end
  else
  begin
    Customercarryover1.Checked := True;
    SBCarryOver.Down         := True;
//    IQRegIntegerScalarWrite( self, 'AR_CUSTOMER_CARRYOVER', 1);
  end;

  AType := 0;

  if False then //IQRegIntegerScalarRead( self, 'AR_USERID', AType ) then
  begin
    if AType = 0 then
      PostallforindividualUserID1.Checked := True
    else
      PostallforallUsersID1.Checked := True;
  end
  else
  begin
    PostallforindividualUserID1.Checked := True;
//    IQRegIntegerScalarWrite( self, 'AR_USERID', 0);
  end;

  BuildUnitPriceAccountSplit1.Checked := SelectValueAsString('select NVL(AR_UNIT_PRICE_ACC_SPLIT, ''N'') from iqsys2 where rownum < 2') = 'Y';


//  IqTiming1.Stop('Open');
  FCustomerId := QryArPrePost.FieldByName('ARCUSTO_ID').asFloat;
 /// dbWWBillTo.text := QryArPrePostBILLTOCOMP.asString;

//  CbDoNotAutoEmail.Visible := (SelectValueAsString('select NVL(AUTOEMAILARBATCHPOST, ''N'') from iqsys2 where rownum < 2') = 'Y') and (SR.Visible[ 'CBDONOTAUTOEMAIL' ]);

  SetTaxButton;
end;

procedure TFrmInvoice.CheckMultiCurrency;
begin
  LblCurrency.Visible        := FMultiCurrency;
  cbCurrency2.Visible         := FMultiCurrency;
  btnCurrency1.Visible       := FMultiCurrency;
  btnCurrency2.Visible       := FMultiCurrency;
  Labelsupdoc.Visible := FMultiCurrency;
  DBSuppDocs.Visible := FMultiCurrency;


  try
    QryArPrePostDetail.AfterScroll := nil;
    QryArPrePost.FieldByName('FXAcct').Visible := FMultiCurrency;
  finally
    QryArPrePostDetail.AfterScroll := QryArPrePostDetailAfterScroll;
  end;
end;

procedure TFrmInvoice.FormCreate(Sender: TObject);
begin
  // CenterForm( Self ); // iqctrl.pas; center form before applying reg settings
//  IQRegFormRead(self, [self, GridInvoiceDetail,
//    PnlHeader01, PnlHeader02, PnlHeader03,
//    PnlHeaderLeft01, PnlHeaderLeft02, PnlHeaderLeft03,
//    PnlTotalsLabels, PnlTotals, Panel2, Panel4, PnlTop]); // IQRegFrm

  FMultiSelect := false; // initialize
//  IQRegBooleanScalarRead(self, 'FMultiSelect', FMultiSelect);
  MultiselectDetail1.Checked := FMultiSelect;
  EnableMultiSelect(MultiselectDetail1.Checked);
  // enforce grid multiselect based on checked state

  // Adjust page Vcl.Controls to parent panels
//  AdjustPageControlToParent(PageControl1); // iqctrl
  PageControl2.ActivePageIndex := 0;
  // 'Accessing Accounts Receivable Invoices.  Please wait.';
  IQSetTablesActiveEx(True, DM, cTXT0000087);
//  iqctrl.ResizeCheckBoxes(self, PnlToolbarMain);
//  iqctrl.ResizeCheckBoxes(self, PnlToolbarDetail);

end;

procedure TFrmInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action:= caFree;
    //IQSetTablesActive( FALSE, self );
    //IQSetTablesActive( FALSE, DM );
    if QryArPrePost.State in [dsInsert] then
    begin
      QryArPrePost.Cancel;
    end;

//    RestoreForm( Self ); // ictrl.pas; restore form before saving settings
//    IQRegFormWrite( self, [ self, GridInvoiceDetail,
//                            PnlHeader01, PnlHeader02, PnlHeader03,
//                            PnlHeaderLeft01, PnlHeaderLeft02, PnlHeaderLeft03,
//                            PnlTotalsLabels, PnlTotals, Panel2, Panel4, PnlTop ]);
//    IQRegBooleanScalarWrite( Self, 'FMultiSelect', MultiselectDetail1.Checked );
  finally
    Application.OnShowHint:= NIL;
  end;
end;

procedure TFrmInvoice.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := CheckTaxCalculated;
end;

procedure TFrmInvoice.FormActivate(Sender: TObject);
begin
//  Application.OnShowHint:= DoOnShowHint;
//  if fPrior = 'Y' then
//    IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} )  {IQHelpHk.pas}
//  else
//    IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} )  {IQHelpHk.pas}
end;

procedure TFrmInvoice.SBToggleClick(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridInvoice.DataSource:= NIL;
    PageControl1.ActivePage := TabForm;
  end
  else
  begin
    GridInvoice.DataSource  := SrcARPrePost;
    PageControl1.ActivePage := TabGrid;
  end;
end;

procedure TFrmInvoice.InvoiceItems1Click(Sender: TObject);
begin
  CheckCashInAdv;
  OpenInvoiceItems;
end;

procedure TFrmInvoice.CloseInvoiceItems;
begin
    QryShip.Close;
    QryOrd.Close;
    QryVmi.Close;
end;

procedure TFrmInvoice.DoUnAssignCostSource(var AHandled: Boolean);
begin
  AHandled := True;
end;

procedure TFrmInvoice.OpenInvoiceItems;
begin
//  IqTiming1.Start('OpenInvoiceItems');
  QryArPrePost.CheckBrowseMode;
  if QryArPrePost.FieldByName('ID').asFloat = 0 then
    raise Exception.Create(cTXT0000013 {'Invoice header missing'});
//  QryShip.Open;
//  QryOrd.Open;
end;

function TFrmInvoice.GetNewInvoiceNumber(EplantId:Real):String;
var
  AName, ASql, AInv:String;
begin
  AName := GetEPlantSequenceName( '1' (*FloatToStr(EPlantId)*), 'AR',  'S_INVOICE'); {IqSeq.pas}

  if EPlantId = 0 then
    ASql := 'select count(id) from arinvoice where eplant_id is null'
  else
    ASql := Format('select count(id) from arinvoice where eplant_id = %f', [EPlantId]);

  repeat
    Result := IntToStr(Trunc(GetNextSequenceNumber(AName)));
    IQAppend_EPlant_Suffix( FloatToStr(EPlantID), Result );
  until SelectValueFmtAsFloat(ASql + ' and invoice_no = ''%s''', [Result]) = 0;

end;

procedure TFrmInvoice.GetInvoiceNumber;
begin
  //MaxId := GetMaxId;
  repeat
    InvoiceNumber := IntToStr(Trunc(GetNextSequenceNumber('S_INVOICE')));
  until SelectValueFmtAsFloat('select count(id) from arinvoice where invoice_no = ''%s'' and misc.eplant_filter(eplant_id) = 1' , [InvoiceNumber]) = 0;
  QryArPrePost.FieldByName('INVOICE_NO').asString := InvoiceNumber;
end;


procedure TFrmInvoice.GridInvoiceDetailDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i:Integer;
  AId:Real;
  ATermsId:Integer;
  Amount:Real;
begin

//    IqTiming1.Start('DragDrop item(s) from the PS list');

  FDetailsExists :=  not (QryArPrePostDetail.eof and QryArPrePostDetail.bof);
  FWarningRaised := False;

  try
    FRefreshQryArPrepost := False;
    QryArPrePostDetail.AfterPost := nil;
    FStringList := TStringList.Create;
{    with TIQUniGridControl(Source), TFDQuery(TIQUniGridControl(Source).DataSource.DataSet) do
    begin
      for I:= 0 to SelectedList.Count - 1 do
      begin
        GotoBookmark(SelectedList.items[i]);
        ProcessAcceptRecord(Source);
      end;
      if SelectedList.Count = 0 then
      begin
//        IqTiming1.Start('ProcessAcceptRecord(Source)');
        ProcessAcceptRecord(Source);
//        IqTiming1.Stop('ProcessAcceptRecord(Source)');
      end;
}
      if (FStringList.Count = 1) and (QryArPrepost.FieldByname('TERMS_ID').asFloat = 0) then
          ExecuteCommandFmt('update arprepost set terms_id = %d where id = %f',
                    [LongInt(FStringList.Objects[0]), QryArPrepost.FieldByname('ID').asFloat])
      else if FStringList.Count > 0 then
      begin
        ATermsId := 0;
//        if DoGetArPrepostTermsId(FStringList, ATermsId, QryArPrepost.FieldByname('ID').asFloat) then {in ARTerms.pas}
//        try
//          QryArPrePost.Edit;
//          ExecuteCommandFmt('update arprepost set terms_id = %d where id = %f',
//                    [ATermsId, QryArPrepost.FieldByname('ID').asFloat]);
//          QryArPrePostTERMS_ID.asFloat := ATermsId;
//        finally
//          QryArPrePost.Post;
//        end;
      end;
//      IqTiming1.Start('TblArPrePost.Refresh');
//      if FRefreshQryArPrepost then
        ReopenQryArPrePost;
//      IqTiming1.Stop('TblArPrePost.Refresh');
//      IqTiming1.Start('Reopen(QryArPrePostDetail)');
      ReopenQryArPrePostDetail;
//      IqTiming1.Stop('Reopen(QryArPrePostDetail)');
//      IqTiming1.Start('TblComm.Refresh');
      TblComm.Refresh;
//      IqTiming1.Stop('TblComm.Refresh');
//      IqTiming1.Start('CheckTerms');
      CheckTerms;
//      IqTiming1.Stop('CheckTerms');
//    end;
  finally
//    IqTiming1.Start('finally');
    FStringList.Free;

    QryArPrePostDetail.AfterPost := QryArPrePostDetailAfterPost;



//    if QryArPrePostDetail.Eof and QryArPrePostDetail.Bof then
//    begin
//      ExecuteCommandFmt('update arprepost set ctrl_eplant_id = null, ' +
//                'glacct_id_ar = plugins.get_glacct_id_with_eplant_id(''acct_id_ar'', %f) where id = %f',
//                [QryArPrePost.FIeldByName('EPLANT_ID').asFloat, QryArPrePost.FieldByname('ID').asFloat]);
//      ReopenQryArPrePost;
//    end;


//    TwwdbGrid(Source).UnSelectAll;
    CBMisc.Checked := False;
    ViewArPrepostDetailTotals.Refresh;
    SetFocustToFirstEditableField;
//    IqTiming1.Stop('finally');
  end;
//    IqTiming1.Stop('DragDrop item(s) from the PS list');
end;

procedure TFrmInvoice.SetFocustToFirstEditableField;
var
  i:integer;
begin
  with GridInvoiceDetail do
 // begin
 ///   for i := 0 to FieldCount - 1 do
 ///     if Pos(Fields[i].FieldName,
///             'INVOICE_QTY/UNIT_PRICE/PRICE_PER_1000/COMM_PCNT/TAX_CODE/SALESPERSON' +
 ///            '/GLACCT/FREIGHT_COMP/MISC_COMMENT/REFERENCE/REFCODE/MISC_PO/FREIGHT_PRICE') <> 0
 //     then
      begin
  //      SetActiveField(Fields[i].FieldName);
        SetFocus;
        Exit;
      end;
 // end;
end;

{
function TFrmInvoice.ProcessAcctSplit(Amount:Real):Real;
var
  FDetailId:Real;
begin
  QryARPrepostDetail.CheckBrowseMode;
  FDetailId := GetNextID('ARPREPOST_DETAIL');
  Result := FDetailId;
  ExecuteCommandFmt(
  'insert into arprepost_detail (arprepost_id,                                                             ' +
  '                              id,                                                                       ' +
  '                              glacct_id_sales,                                                          ' +
  '                              invoice_qty,                                                              ' +
  '                              unit_price,                                                                ' +
  '                              misc_comment)                                                             ' +
  '                       values (%f,                                                                      ' +
  '                               %f,                                                                      ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                1, %f, ''%s'')                                                              ',
  [QryArPrePostID.asFloat,
   FDetailId,
   FTemplate.TblGlTemplateDetailGLACCT_ID.asFloat,
   FTemplate.TblGlTemplateDetailGLACCT_ID.asFloat,
   Amount,  StrTran(FTemplate.TblGlTemplateDetailDESCRIP.asString, '''', '''''') ]);
end;
}

procedure TFrmInvoice.AddItemToAList(StringList:TStringList; nOrdDetailId:Real);
var
  AId:Integer;
  ATerms:String;
  i:Integer;
begin
//  if nOrdDetailId = 0 then Exit;
//  with TFDQuery.Create(self) do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select t.id, t.description from terms t, orders o, ord_detail d ' +
//                   'where d.orders_id = o.id and d.id = %f and o.terms_id = t.id',
//                   [nOrdDetailId]));
//    Open;
//    if Eof and Bof then Exit;
//    AId    := FieldByName('ID').asInteger;
//    ATerms := FieldByName('DESCRIPTION').asString;
//  finally
//    Free;
//  end;
//
//  if AId = QryArPrePost.FieldByName('TERMS_ID').asFloat then Exit;
//  for i := 0 to StringList.Count - 1 do
//    if StringList.Objects[i] = Pointer(AId) then Exit;
//
//  StringList.Add(ATerms);
//  {instead of using an object to store the ID, we are putting the ID in the pointer to an object of the TStrings}
//  StringList.Objects[StringList.Count - 1] := Pointer(AId);
end;

function TFrmInvoice.GetBillToId(AId:Real):Real;
begin
  Result := SelectValueFmtAsFloat('select bill_to_id from orders o, ord_detail d where d.orders_id = o.id and d.id = %f', [AId]);
  if Result = 0 then
    Result := SelectValueFmtAsFloat('select bill_to_id from hist_orders o, hist_ord_detail d where d.orders_id = o.id and d.id = %f', [AId]);
end;

function TFrmInvoice.GetAccId(AId:Real):Real;
begin
  Result := SelectValueFmtAsFloat('select arcusto_credit_card_id from orders o, ord_detail d where d.orders_id = o.id and d.id = %f', [AId]);
  if Result = 0 then
    Result := SelectValueFmtAsFloat('select arcusto_credit_card_id from hist_orders o, hist_ord_detail d where d.orders_id = o.id and d.id = %f', [AId]);
end;

procedure TFrmInvoice.ProcessAcceptRecord(Source:TObject);
var
  nAcctId, nFreightId, AId:Real;
  ACostObjectId:Real;
  ACostObjectSource:String;
  ABillToId:Real;
  AVmiRef:String;
  ARefCodeId:Real;
  ARmaDtlId:real;
  ASalesRmaAcctId:Real;
  AccId, AccId2:Real;
  AComment1:String;
  AFreightPrice:Real;
  AOrdersId:Real;
  AFreightGlAcctId:Real;
  APono:String;
  AVMIConsumptionID: Int64;
  AQty:Real;
  aInvoiceQty:Real;
begin
  try
    QryArPrePostDetail.OnNewRecord := nil;
//    TblArPrePostDetail.OnNewRecord := nil;
    if (UpperCase(TIQUniGridControl(Source).DataSource.DataSet.Name) <> 'QRYVMI') and CheckForSameItem(Source) then
    begin
    //  if (TIQUniGridControl(Source).SelectedList.Count = 0) then
     //   raise Exception.Create(Format( cTXT0000014 {'Item %s already exists on the invoice'},
     //         [TIQUniGridControl(Source).DataSource.DataSet.FieldByName('DESCRIPTION').asString]))
     // else Exit;
    end;
    with TIQUniGridControl(Source).DataSource.DataSet do
    begin
//      if (QryArPrepost.FieldByName('CTRL_EPLANT_ID').asFloat = 0) and (FieldByName('EPLANT_ID').asFloat <> 0) then
//      begin
//        QryArPrepost.Edit;
//        QryArPrepost.FieldByName('ctrl_eplant_id').AsFloat := FieldByName('EPLANT_ID').asFloat;
//        QryArPrepost.FieldByName('GLACCT_ID_AR').AsFloat :=
//          SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_ar'', %f) from dual',
//          [FieldByName('EPLANT_ID').asFloat]);
//        QryArPrepost.Post;
//      end;
      APono := '';
      AOrdersId := SelectValueFmtAsFloat('select orders_id from ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
      APono := SelectValueFmtAsString('select pono from orders where id = %f', [AOrdersId]);
      if AOrdersId = 0 then
      begin
        AOrdersId := SelectValueFmtAsFloat('select orders_id from hist_ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
        APono := SelectValueFmtAsString('select pono from orders where id = %f', [AOrdersId]);
      end;
{
      // Update CREDIT_CARD_TRANS with the invoice number
      // 02/16/2010 Update only if arprepost_id is NULL.  Requested by
      //  Olivia, approved by Karen. (Byron)
      // 03/31/2010 Added "WHERE" line to check for invoice_no.  When the
      // invoice is posted, the arprepost_id is cleared, which can cause
      // problems when the settlement amount is adjusted.
      // Reported by Olivia (Byron).
      ExecuteCommandFmt('UPDATE credit_card_trans '#13 +
                'SET arprepost_id = %.0f, invoice_no = ''%s'' '#13 +
                'WHERE orders_id = %.0f AND '#13 +
                '      arprepost_id IS NULL AND'#13 +
                '      invoice_no IS NULL',
                [QryArPrepostID.AsFloat,
                 StrTran(QryArPrePostINVOICE_NO.AsString, '''', ''''''),
//                 QryArPrePostINVOICE_NO.AsString,
                 AOrdersId]);

      AccId := GetAccId(FieldByName('ORD_DETAIL_ID').asFloat);
      if AccId <> 0 then
      begin
        AccId2 := SelectValueFmtAsFloat('select arcusto_credit_card_id from arprepost where id = %f', [QryArPrepost.FieldByName('ID').asFloat]);
        if (AccId2 <> 0) and (AccId2 <> AccId) then
          raise exception.create('Multiple credit cards can not be combined on the same invoice');

        ExecuteCommandFmt('update arprepost set arcusto_credit_card_id = %f where id = %f',
                 [AccId,
                  QryArPrepost.FieldByName('ID').asFloat]);

      end;
}

      ABillToId := GetBillToId(FieldByName('ORD_DETAIL_ID').asFloat);
      if ABillToId = 0 then
        raise Exception.Create(cTXT0000099);

  //    if ABillToId <> QryArPrepost.FieldByName('BILL_TO_ID').asFloat then
  //    begin
  //      if FDetailsExists then
  //      begin
{          if TIQUniGridControl(Source).SelectedList.Count < 2 then
          begin
            {The Invoice billing information differs from the billing information you selected.
             Do you want to change the Invoice billing address? }
{            if True then // IqConfirmYN(cTXT0000015) then
            begin
              if ABillToId <> 0 then
                ExecuteCommandFmt('update arprepost set bill_to_id = %f where id = %f',
                       [ABillToId,
                       QryArPrepost.FieldByName('ID').asFloat]);
              FRefreshQryArPrepost := True;
            end;
          end
          else
          begin
            if not FWarningRaised then
            begin
              FWarningRaised := True;
              {The Invoice billing information differs from the billing information you selected.
               Do you want to change the Invoice billing address? }
 {             if True then //IqConfirmYN(cTXT0000015) then
              begin
                if ABillToId <> 0 then
                  ExecuteCommandFmt('update arprepost set bill_to_id = %f where id = %f',
                         [ABillToId,
                         QryArPrepost.FieldByName('ID').asFloat]);
                FRefreshQryArPrepost := True;
              end;
            end;
          end;
        end
        else
        begin
          if TIQUniGridControl(Source).SelectedList.Count < 2 then
          begin
            if ABillToId <> 0 then
              ExecuteCommandFmt('update arprepost set bill_to_id = %f where id = %f',
                      [ABillToId,
                       QryArPrepost.FieldByName('ID').asFloat]);
            FRefreshQryArPrepost := True;
          end
          else
          begin
            if not FWarningRaised then
            begin
              FWarningRaised := True;
              {The Invoice billing information differs from the billing information you selected.
               Do you want to change the Invoice billing address? }
{              if True then //IqConfirmYN(cTXT0000015) then
              begin
                if ABillToId <> 0 then
                  ExecuteCommandFmt('update arprepost set bill_to_id = %f where id = %f',
                         [ABillToId,
                         QryArPrepost.FieldByName('ID').asFloat]);
                FRefreshQryArPrepost := True;
              end;
            end;
          end;
        end;
      end;
      }

//      if (QryArPrepost.FieldByName('CTRL_EPLANT_ID').asFloat = 0) and (FieldByName('EPLANT_ID').asFloat <> 0) then
//      begin
//        ExecuteCommandFmt('update arprepost set ctrl_eplant_id = %f, ' +
//                  'GLACCT_ID_AR = plugins.get_glacct_id_with_eplant_id(''acct_id_ar'', %f) where id = %f',
//                  [FieldByName('EPLANT_ID').asFloat,
//                   FieldByName('EPLANT_ID').asFloat,
//                   QryArPrepost.FieldByName('ID').asFloat]);
//        FRefreshQryArPrepost := True;
//      end;

     AVMIConsumptionID := 0;
     if (UpperCase(TIQUniGridControl(Source).DataSource.DataSet.Name) = 'QRYVMI') then
     begin
       AVMIConsumptionID := QryVMIVMI_CONSUMPTION_ID.AsLargeInt;
       aQty := SelectValueFmtAsFloat('select vmi_misc.GetLeftToInvoice(%f,%f, %f) from dual',
               [QryVMI.FieldByName('ORD_DETAIL_ID').AsFloat,
                QryVMI.FieldByName('SHIPMENT_DTL_ID').AsFloat,
                QryVMIVMI_CONSUMPTION_ID.asFloat]);

        aInvoiceQty := SelectValueFmtAsFloat('select v.invoice_qty from v_shipments_short v ' +
                                 '  where v.invoice_qty > 0                     ' +
                                 '    and NVL(v.to_invoice, ''Y'') = ''Y''      ' +
                                 '    and v.arcusto_id = %f                     ' +
                                 '    and v.vmi = ''Y''                           ' +
                                 '   and v.shipment_dtl_id = %f',
                                 [QryArPrepostARCUSTO_ID.AsFloat,
                                  QryVMI.FieldByName('SHIPMENT_DTL_ID').AsFloat]);


//       AQty              := QryVMI.FieldByName('LEFT_TO_INVOICE').AsFloat;
     end
     else
     begin
       AQty        := TIQUniGridControl(Source).DataSource.DataSet.FieldByName('QTYSHIPPED').asFloat;
       aInvoiceQty := TIQUniGridControl(Source).DataSource.DataSet.FieldByName('INVOICE_QTY').asFloat;
     end;


     ExecuteCommandFmt('begin ar.Populate_arprepost_detail(%f, %f, %f, %.6f, %.6f, %.6f, %.6f, %f, %f, %.6f, ''%s'', %.6f, %d, %f, %f, %f); end;',
                       [ QryArPrepostID.AsFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('SHIPMENT_DTL_ID').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('ORD_DETAIL_ID').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('UNIT_PRICE').asFloat,
                         AQty,
                         aInvoiceQty,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('AR_INVOICED_QTY').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('TAX_CODE_ID').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('SALESPEOPLE_ID').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('COMM_PCT').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('PRICE_PER_1000YN').asString,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('PRICE_PER_1000').asFloat,
                         AVMIConsumptionID,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('EPLANT_ID').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('ARINVT_ID').asFloat,
                         TIQUniGridControl(Source).DataSource.DataSet.FieldByName('ACCT_ID_SALES').asFloat]);

{
     with TFDStoredProc.Create(nil) do
     try
       Connection := db_dm.FDConnection;
       StoredProcName := 'IQMS.AR.ADD_DETAILS_FOR_SHIPMENT';
       Prepare;
       Params[0].Value := QryArPrepostID.AsLargeInt;
       Params[1].Value := TwwdbGrid(Source).DataSource.DataSet.FieldByName('ORD_DETAIL_ID').AsLargeInt;
       Params[2].Value := Trunc(ABillToId);
       Params[3].Value := AVMIConsumptionID;
       Execute;
     finally
       Free;
     end;

}

{
      nFreightId := GetfreightId(FieldByName('SHIPMENT_DTL_ID').asFloat);


      nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(g.acct_id_sales, ''acct_id_sales'', g.eplant_id) ' +
                           'from arinvt a, arinvt_group g ' +
                           'where a.arinvt_group_id = g.id ' +
                           'and a.id = %f', [FieldByName('ARINVT_ID').asFloat]);

      if nAcctId = 0 then
        nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_sales'', %f) from dual',
                             [FieldByName('EPLANT_ID').asFloat]);

      nAcctId := AdjustPurchasedItem(nAcctId, FieldByName('EPLANT_ID').asFloat, FieldByName('ARINVT_ID').asFloat);
      GetCostObjectInfo(FieldByName('ORD_DETAIL_ID').asFloat, ACostObjectId, ACostObjectSource);
      ARefCodeId := SelectValueFmtAsFloat('select ref_code_id from ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
      if ARefCodeId = 0 then
        ARefCodeId := SelectValueFmtAsFloat('select ref_code_id from hist_ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);

      ARmaDtlId := SelectValueFmtAsFloat('select rma_detail_id from ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
      if ARmaDtlId = 0 then
        ARmaDtlId := SelectValueFmtAsFloat('select rma_detail_id from hist_ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);


      ASalesRmaAcctId := 0;
      if ARmaDtlId <> 0 then
        ASalesRmaAcctId := SelectValueFmtAsFloat('select f.glacct_id_sales_rma from failure_code f, rma_detail r where r.failure_code_id = f.id and r.id = %f', [ARmaDtlId]);


      AComment1 := SelectValueFmtAsString('select comment1 from ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
      if AComment1 = '' then
        AComment1 := SelectValueFmtAsString('select comment1 from hist_ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);

      AComment1 := StrTran(AComment1, #13#10, #10);


      AFreightPrice := SelectValueFmtAsFloat('select s.auto_freight_price from shipments s, shipment_dtl d ' +
                                 ' where d.id = %f and d.shipments_id = s.id ' +
                                 ' and not exists (select id from arprepost_detail where freight_price is not null ' +
                                                   ' and shipment_dtl_id in (select id from shipment_dtl where shipments_id = (select shipments_id from shipment_dtl where id = %f)))'
                                 , [FieldByName('SHIPMENT_DTL_ID').asFloat, FieldByName('SHIPMENT_DTL_ID').asFloat]);

//      AFreightPrice := 0;


      AId := GetNextID('ARPREPOST_DETAIL');
      ExecuteCommandFmt('insert into arprepost_detail (id,               ' +
                                              'freight_id,       ' +
                                              'GLACCT_ID_FREIGHT, ' +
                                              'freight_price,    ' +
                                              'arprepost_id,     ' +
                                              'shipment_dtl_id,  ' +
                                              'ord_detail_id,    ' +
                                              'unit_price,       ' +
                                              'invoice_qty,      ' +
                                              'tax_code_id,      ' +
                                              'salespeople_id,   ' +
                                              'comm_pcnt,        ' +
                                              'price_per_1000_YN, ' +
                                              'price_per_1000, ' +
                                              'glacct_id_sales, ' +
                                              'eplant_id,       ' +
                                              'cost_object_id,  ' +
                                              'ref_code_id,  ' +
                                              'cost_object_source,   ' +
                                              'misc_comment,   ' +
                                              'PONO_From_SO,   ' +
                                              'rma_detail_id )   ' +
                                       'values (                  ' +
                                               '%f,                                             ' +
                                               'Decode(%f, 0, null, %f),                        ' +
                                               'Decode(%f, 0, null, %f),                        ' +
                                               '%.6f,                                           ' +
                                               '%f,                                             ' +
                                               'Decode(%f, 0, null, %f),                        ' +
                                               'Decode(%f, 0, null, %f),                        ' +
                                               '%.7f,                                           ' +
                                               'Decode(%.6f, 0, %.6f, %.6f),                          ' +
                                               'Decode(%f, 0, null, %f),                        ' +
                                               'Decode(%f, 0, null, %f),                        ' +
                                               '%f,                                             ' +
                                               '''%s'',                                         ' +
                                               'Decode(''%s'', ''Y'', %.6f, 0),    ' +
                                               'decode(%f, 0, Decode(%f, 0, Decode(%f, 0, null, %f), %f), %f), ' +
                                               '%f ,                                           ' +
                                               'Decode(%f, 0, null, %f),                       ' +
                                               'Decode(%f, 0, null, %f),                       ' +
                                               '''%s'',                                        ' +
                                               '''%s'',                                        ' +
                                               '''%s'',                                        ' +
                                               'Decode(%f, 0, null, %f))                       ',
                                       [AId,
                                        nFreightId,
                                        nFreightId,
                                        AFreightGlAcctId,
                                        AFreightGlAcctId,
                                        AFreightPrice,
                                        QryArPrePost.FieldByName('ID').asFloat,
                                        FieldByName('SHIPMENT_DTL_ID').asFloat,
                                        FieldByName('SHIPMENT_DTL_ID').asFloat,
                                        FieldByName('ORD_DETAIL_ID').asFloat,
                                        FieldByName('ORD_DETAIL_ID').asFloat,
                                        FieldByName('UNIT_PRICE').asFloat,
                                        FieldByName('QTYSHIPPED').asFloat,
                                        FieldByName('INVOICE_QTY').asFloat,
                                        FieldByName('QTYSHIPPED').asFloat - FieldByName('AR_INVOICED_QTY').asFloat,
                                        FieldByName('TAX_CODE_ID').asFloat,
                                        FieldByName('TAX_CODE_ID').asFloat,
                                        FieldByName('SALESPEOPLE_ID').asFloat,
                                        FieldByName('SALESPEOPLE_ID').asFloat,
                                        FieldByName('COMM_PCT').asFloat,
                                        FieldByName('PRICE_PER_1000YN').asString,
                                        FieldByName('PRICE_PER_1000YN').asString,
                                        FieldByName('PRICE_PER_1000').asFloat,
                                        ASalesRmaAcctId,
                                        FieldByName('ACCT_ID_SALES').asFloat,
                                        nAcctId,
                                        nAcctId,
                                        FieldByName('ACCT_ID_SALES').asFloat,
                                        ASalesRmaAcctId,
                                        FieldByName('EPLANT_ID').asFloat,
                                        ACostObjectId,
                                        ACostObjectId,
                                        ARefCodeId,
                                        ARefCodeId,
                                        ACostObjectSource,
                                        StrTran(StrTran(AComment1, '"',  ''''''), '''', ''''''),
                                        StrTran(APono, '''', ''''''),
                                        ARmaDtlId,
                                        ARmaDtlId] );

      ProcessSACDiscounts(AId);

      if FieldByName('EPLANT_ID').asFloat <> 0 then
        ExecuteCommandFmt('update arprepost_detail set glacct_id_sales = plugins.get_glacct_no_name(glacct_id_sales, %f) where id = %f',
                  [FieldByName('EPLANT_ID').asFloat, aId] );

      RevaluateUnitPrice(aId);

      if FieldByName('SHIPMENT_DTL_ID').asFloat <> 0 then
      begin
        AVmiRef := SelectValueFmtAsString('select VMI_REFERENCE from c_ship_hist where shipment_dtl_id = %f', [FieldByName('SHIPMENT_DTL_ID').asFloat]);
        if AVmiRef <> '' then
          ExecuteCommandFmt('update arprepost_detail set VMI_REFERENCE = ''%s'' where id = %f', [AVmiRef, AId]);
      end;

      if (UpperCase(TwwdbGrid(Source).DataSource.DataSet.Name) = 'QRYVMI') and (QryVMIVMI_CONSUMPTION_ID.asFloat <> 0) then
          ExecuteCommandFmt('update arprepost_detail set VMI_CONSUMPTION_ID = %f where id = %f', [QryVMIVMI_CONSUMPTION_ID.asFloat, AId]);



      ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, SALESPEOPLE_ID, COMMISSION_PERCENT, amount) ' +
              'select %f, salespeople_id, COMMISSION_PERCENT, NVL(COMMISSION_PERCENT, 0) * %.6f/100 from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f',
              [AId,
               FieldByName('UNIT_PRICE').asFloat * FieldByName('INVOICE_QTY').asFloat,
              FieldByName('ORD_DETAIL_ID').asFloat]);
      ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, SALESPEOPLE_ID, COMMISSION_PERCENT, amount) ' +
              'select %f, salespeople_id, COMMISSION_PERCENT, NVL(COMMISSION_PERCENT, 0) * %.6f/100 from HIST_ORD_DETAIL_COMM where ORD_DETAIL_ID = %f',
              [AId,
               FieldByName('UNIT_PRICE').asFloat * FieldByName('INVOICE_QTY').asFloat,
              FieldByName('ORD_DETAIL_ID').asFloat]);

      InsertCommodity(FieldByName('ARINVT_ID').asFloat, AID);
      Insert_Deduct_from_Invoice_Total(AID);

      if SelectValueFmtAsString('select NVL(sample, ''N'') from ord_detail where id = %f', [SelectValueFmtAsFloat('select ORD_DETAIL_ID from arprepost_detail where id = %f', [AId])]) = 'N' then
        ExecuteCommandFmt('insert into ARPREPOST_DETAIL_SALES (ARPREPOST_DETAIL_ID, percentage, glacct_id) ' +
                'select %f, percentage, glacct_id from arinvt_sales_split where ARINVT_ID = %f',
                [AId, FieldByName('ARINVT_ID').asFloat]);
}
      AddItemToAList(FStringList, FieldByName('ORD_DETAIL_ID').asFloat);
//      UpdateCashInAdvanceGlAccounts2(QryArPrePost.FieldByName('ID').asFloat, TwwdbGrid(Source).DataSource.DataSet, FieldByName('ORD_DETAIL_ID').asFloat);
    end;
  finally
    QryArPrePostDetail.OnNewRecord     := QryArPrePostDetailNewRecord;
//    TblArPrePostDetail.OnNewRecord     := TblArPrePostDetailNewRecord;
  end;
end;

function TFrmInvoice.AdjustPurchasedItem(aAcctId, AEPLANT_ID, ARINVT_ID:Real):Real;
var
  ASalesAcctId:Real;
begin
  // 04/11/2016 Moved to package function
  Result := SelectValueFmtAsInt64(
    'SELECT iqms.ar.adjust_purchased_item(%d, %d, %d, %d) FROM DUAL',
    [Trunc(aAcctId),
     Trunc(ARINVT_ID),
     QryArPrePostCURRENCY_ID.AsLargeInt,
     Trunc(AEPLANT_ID)]);
{
  result := aAcctId;
  if SelectValueFmtAsFloat('select standard_id from arinvt where id = %f', [ARINVT_ID]) = 0 then
  begin
// Per Nancys Email Jul 8 2008 RE: A/R invoicing on purchased items

    ASalesAcctId := SelectValueFmtAsFloat('select g.acct_id_sales ' +
                         'from arinvt a, arinvt_group g ' +
                         'where a.arinvt_group_id = g.id ' +
                         'and a.id = %f', [ARINVT_ID]);

    if ASalesAcctId = 0 then
      ASalesAcctId := SelectValueFmtAsFloat('select acct_id_sales from arinvt where id = %f', [ARINVT_ID]);
    if ASalesAcctId <> 0 then
      result :=  SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(plugins.IQ_Plug_Currency(%f, %f), ''acct_id_fg'', %f) from dual',
                           [ASalesAcctId, QryArPrePostCURRENCY_ID.asFloat, AEPLANT_ID])
    else
      result :=  SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(plugins.IQ_Plug_Currency(%f, %f), ''acct_id_fg'', %f) from dual',
                           [result, QryArPrePostCURRENCY_ID.asFloat, AEPLANT_ID]);

//    result := SelectValueFmtAsFloat('select decode(NVL(e.glacct_id, 0), 0, plugins.get_glacct_id_with_ep_gl(plugins.get_glacct_id(''acct_id_fg'', null, null, %f), ''acct_id_fg'', %f), ' +
//                        '  plugins.get_glacct_id_with_ep_gl(plugins.IQ_Plug_Currency(e.glacct_id, %f), ''acct_id_fg'', %f)) ' +
//                        ' from arinvt_elements a, elements e where a.arinvt_id = %f and a.elements_id = e.id ' +
//                        ' and NVL(a.default_cost_element, ''N'') = ''Y'' ',
//                        [QryArPrePostCURRENCY_ID.asFloat,
//                         AEPLANT_ID,
//                         QryArPrePostCURRENCY_ID.asFloat,
//                         AEPLANT_ID,
//                         ARINVT_ID]);
    if result = 0 then
      result := SelectValueFmtAsFloat('select min(decode(NVL(e.glacct_id, 0), 0, plugins.get_glacct_id_with_ep_gl(plugins.get_glacct_id(''acct_id_fg'', null, null, %f), ''acct_id_fg'', %f), ' +
                          '  plugins.get_glacct_id_with_ep_gl(plugins.IQ_Plug_Currency(e.glacct_id, %f), ''acct_id_fg'', %f))) ' +
                          ' from arinvt_elements a, elements e where a.arinvt_id = %f and a.elements_id = e.id',
                          [QryArPrePostCURRENCY_ID.asFloat,
                           AEPLANT_ID,
                           QryArPrePostCURRENCY_ID.asFloat,
                           AEPLANT_ID,
                           ARINVT_ID]);
    if result = 0 then
      result := aAcctId;
  end;
}
end;


procedure TFrmInvoice.Insert_Deduct_from_Invoice_Total(ADtlId:Real);
var
  AShipToId:Real;
  AFob:String;
  ADED_FROM_INV_TOT:String;
  Aauto_freight_price :Real;
  AId:Real;
  AShipmentDtlId:Real;
  ArprepostId:Real;
  AShipmentsId:Real;
begin
  ExecuteCommandFmt('BEGIN iqms.ar.insert_deduct_invoice_total(%.0f); END;',
    [ADtlId]);
(*
  AFob := SelectValueFmtAsString('select  fob from shipments where id = ' +
                         ' (select shipments_id from shipment_dtl where id = ' +
                         ' (select shipment_dtl_id from arprepost_detail where id = %f))', [ADtlId]);

  if AFob = '' then
    AFob := SelectValueFmtAsString('select fob from orders where id = ' +
                           ' (select orders_id from ord_detail where id = ' +
                           ' (select ord_detail_id from arprepost_detail where id = %f))', [ADtlId]);

  if AFob = '' then
    AFob := SelectValueFmtAsString('select fob from hist_orders where id = ' +
                           ' (select orders_id from hist_ord_detail where id = ' +
                           ' (select ord_detail_id from arprepost_detail where id = %f))', [ADtlId]);


  ADED_FROM_INV_TOT := SelectValueFmtAsString('select NVL(DED_FROM_INV_TOT, ''N'') from fob where descrip = ''%s''', [StrTran(AFob, '''', '''''')]);

  if ADED_FROM_INV_TOT <> 'Y' then exit;

  Aauto_freight_price := SelectValueFmtAsFloat('select  NVL(auto_freight_price, 0) from shipments where id = ' +
                           ' (select shipments_id from shipment_dtl where id = ' +
                           ' (select shipment_dtl_id from arprepost_detail where id = %f))', [ADtlId]);

  AShipmentDtlId := SelectValueFmtAsFloat('select shipment_dtl_id from arprepost_detail where id = %f', [ADtlId]);
  ArprepostId := SelectValueFmtAsFloat('select arprepost_id from arprepost_detail where id = %f', [ADtlId]);


  AShipmentsId := SelectValueFmtAsFloat('select shipments_id from shipment_dtl where id = %f', [AShipmentDtlId]);

  if SelectValueFmtAsString('select NVL(FREIGHT_AUTODED_APPLIED, ''N'') from shipments where id = %f', [AShipmentsId]) = 'Y' then exit;

  if SelectValueFmtAsFloat('select d.id from arprepost_detail d, shipment_dtl s ' +
               ' where d.misc_comment = ''Offset Freight Amount'' ' +
               ' and s.shipments_id = %f and arprepost_id = %f and d.shipment_dtl_id = s.id', [AShipmentsId, ArprepostId]) <> 0  then exit;

  if Aauto_freight_price = 0 then exit;



  AId := GetNextID('ARPREPOST_DETAIL');


  ExecuteCommandFmt('insert into arprepost_detail (id,                              ' +
                                        '   arprepost_id,                   ' +
                                        '   invoice_qty,                    ' +
                                        '   unit_price,                     ' +
                                        '   glacct_id_sales,                ' +
//                                        '   shipment_dtl_id,                ' +
                                        '   salespeople_id,                 ' +
                                        '   comm_pcnt,                      ' +
                                        '   misc_comment, SHIPMENTS_AUTODED_ID)         ' +
                        '       select %f,                                  ' +
                        '               d.arprepost_id,                       ' +
                        '               1,                                  ' +
                        '               %.6f,                               ' +
                        '               plugins.get_glacct_id_with_ep_gl(f.glacct_id_freight, ''acct_id_sales'', d.eplant_id ), ' +
//                        '               d.shipment_dtl_id,                  ' +
                        '               d.salespeople_id,                     ' +
                        '               comm_pcnt,                          ' +
                        '               ''Offset Freight Amount'', %f       ' +
                        '    from arprepost_detail d, freight f where d.id = %f ' +
                        ' and d.freight_id = f.id  ' , [AId, (Aauto_freight_price * (-1)),  AShipmentsId, ADtlId]);

  ExecuteCommandFmt('update arprepost_detail set SHIPMENTS_AUTODED_ID = %f where id = %f', [AShipmentsId, AId]);
  ExecuteCommandFmt('update shipments set FREIGHT_AUTODED_APPLIED = ''Y'' where id = %f', [AShipmentsId]);


  ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, ' +
            '                  SALESPEOPLE_ID,                 ' +
            '                  COMMISSION_PERCENT, amount)             ' +
            '            select %f,                          ' +
            '                   SALESPEOPLE_ID,                ' +
            '                   COMMISSION_PERCENT, NVL(COMMISSION_PERCENT, 0) * %.6f/100 ' +
            '              from ARPREPOST_COMM                 ' +
            '             where ARPREPOST_DETAIL_ID = %f', [AId, (Aauto_freight_price * (-1)), ADtlId]);
*)
end;


procedure TFrmInvoice.InsertCommodity(ARINVT_ID, ADtlId:Real);
var
  AAkaCommodId, AkaId, AId, AQty:Real;
  AHdrId:Real;
  AIqsysAcctId:Real;
  AEplantId:Real;
  AShipToId:Real;
  AShipDtlId:Real;
  AProc:String;
begin
  ExecuteCommandFmt(
  'BEGIN iqms.ar.insert_commodity(%.0f, %.0f); END;',
  [ADtlId, ARINVT_ID]);
(*
  AShipToId := SelectValueFmtAsFloat('select ship_to_id from orders where id = ' +
                         ' (select orders_id from ord_detail where id = ' +
                         ' (select ord_detail_id from arprepost_detail where id = %f))', [ADtlId]);

  if AShipToId = 0 then
    AShipToId := SelectValueFmtAsFloat('select ship_to_id from hist_orders where id = ' +
                           ' (select orders_id from hist_ord_detail where id = ' +
                           ' (select ord_detail_id from arprepost_detail where id = %f))', [ADtlId]);

  if AShipToId = 0 then
    AShipToId := SelectValueFmtAsFloat('select ship_to_id from shipments where id = ' +
                           ' (select shipments_id from shipment_dtl where id = ' +
                           ' (select shipment_dtl_id from arprepost_detail where id = %f))', [ADtlId]);

  if AShipToId <> 0 then
  begin
    AkaId := SelectValueFmtAsFloat('select id from aka where arcusto_id = %f and arinvt_id = %f and ship_to_id = %f',
                        [QryArPrePostARCUSTO_ID.asFloat, ARINVT_ID, AShipToId]);
    if AkaId = 0 then
      AkaId := SelectValueFmtAsFloat('select id from aka where arcusto_id = %f and arinvt_id = %f', [QryArPrePostARCUSTO_ID.asFloat, ARINVT_ID]);
  end
  else
    AkaId := SelectValueFmtAsFloat('select id from aka where arcusto_id = %f and arinvt_id = %f', [QryArPrePostARCUSTO_ID.asFloat, ARINVT_ID]);
  if AkaId = 0 then Exit;



  AHdrId      := SelectValueFmtAsFloat('select arprepost_id from arprepost_detail where id = %f', [ADtlId]);
  AShipDtlId  := SelectValueFmtAsFloat('select shipment_dtl_id from arprepost_detail where id = %f', [ADtlId]);



  ExecuteCommandFmt('begin iq_arinvoice.InsertCommodity( %f, %f, %f, %f); end;',
            [AHdrId,
             ARINVT_ID,
             ADtlId,
             AShipDtlId]);

  Exit;


  AProc := SelectValueFmtAsString('select c.procedure_to_run from aka_commod a, commodities c ' +
                     ' where a.commodities_id = c.id and aka_id = %f', [AkaId]);


  if AProc = '' then
    AProc := 'AMOUNT_SUR_RATE';



  if AProc = '' then
  begin

    AQty := SelectValueFmtAsFloat('select invoice_qty from arprepost_detail where id = %f', [ADtlId]);
    AIqsysAcctId := SelectValueAsFloat('select acct_id_sales from iqsys where rownum < 2');


      if SecurityManager.EPlant_ID = 'NULL' then
        AEPlantId := 0
      else
        AEPlantId := '1';

    with TFDQuery.Create(self) do
    try
      Connection := db_dm.FDConnection;
      Sql.Add(Format('select NVL(a.amount, 0) * NVL(c.sur_rate, 0) as amount, ' +
                       ' c.descrip, c.glacct_id, NVL(c.propagate_comm, ''N'') as propagate ' +
                       ' from aka_commod a, commodities c ' +
                       ' where a.commodities_id = c.id and aka_id = %f', [AkaId]));
      Open;
      while not eof do
      begin
        AId := GetNextID('ARPREPOST_DETAIL');
        ExecuteCommandFmt('insert into arprepost_detail (id,                ' +
                                                'arprepost_id,      ' +
                                                'unit_price,        ' +
                                                'invoice_qty,       ' +
                                                'price_per_1000_YN, ' +
                                                'price_per_1000,    ' +
                                                'misc_comment,      ' +
                                                'glacct_id_sales )  ' +
                                         'values (                  ' +
                                                 '%f,                      ' +
                                                 '%f,                      ' +
                                                 '%.6f,                    ' +
                                                 '1,                       ' +
                                                 '''N'',                   ' +
                                                 '%.6f * 1000,             ' +
                                                 '''%s'',                  ' +
                                                 'plugins.get_glacct_id_with_ep_gl(decode(%f, 0, %f, %f), ''acct_id_ar'', %f ) )  ',
                                         [AId,
                                          QryArPrePostID.asFloat,
                                          AQty * FieldByName('amount').asFloat,
                                          AQty * FieldByName('amount').asFloat,
                                          FieldByName('descrip').asString,
                                          FieldByName('glacct_id').asFloat,
                                          AIqsysAcctId,
                                          FieldByName('glacct_id').asFloat,
                                          AEPlantId] );

        if FieldByName('propagate').asstring = 'Y' then
        ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, ' +
                  '                  SALESPEOPLE_ID,                 ' +
                  '                  COMMISSION_PERCENT, amount)             ' +
                  '            select %f,                          ' +
                  '                   SALESPEOPLE_ID,                ' +
                  '                   COMMISSION_PERCENT, NVL(COMMISSION_PERCENT, 0) * %.6f/100             ' +
                  '              from ARPREPOST_COMM                 ' +
                  '             where ARPREPOST_DETAIL_ID = %f', [AId, AQty * FieldByName('amount').asFloat, ADtlId]);

        next;
      end;
    finally
      free;
    end;
  end
  else
  begin

    with ProcCommod do
    begin
      StoredProcName := UpperCase(Format('IQMS.IQ_COMMODITY.%s', [AProc]));
      Params.Clear;
      Params.Add;
      Params.Add;
      Params.Add;
      Params.Add;
      Params[0].Name      := 'v_arcusto_id';
      Params[0].DataType  := ftFloat;
      Params[0].ParamType := ptInput;
      Params[0].asFloat   := QryArPrePostARCUSTO_ID.asFloat;

      Params[1].Name      := 'v_arinvt_id';
      Params[1].DataType  := ftFloat;
      Params[1].ParamType := ptInput;
      Params[1].asFloat   := ARINVT_ID;

      Params[2].Name      := 'v_arpprepost_detail_id';
      Params[2].DataType  := ftFloat;
      Params[2].ParamType := ptInput;
      Params[2].asFloat   := ADtlId;

      Params[3].Name      := 'v_aka_id';
      Params[3].DataType  := ftFloat;
      Params[3].ParamType := ptInput;
      Params[3].asFloat   := AkaId;

//     ParamByName('v_arcusto_id').Value := QryArPrePostARCUSTO_ID.asFloat;
//     ParamByName('v_arinvt_id').Value := ARINVT_ID;
//     ParamByName('v_arpprepost_detail_id').Value := ADtlId;
//     ParamByName('v_aka_id').Value := AkaId;
      Prepare;
      ExecProc;
    end;

  end;
*)
end;

procedure TFrmInvoice.GetCostObjectInfo(AOrddetailId:Real; var ACostObjectId: Real; var ACostObjectSource:String);
begin
//  ACostObjectId := 0;
//  ACostObjectSource := '';
//  if AOrdDetailId = 0 then Exit;
//  with TFDQuery.Create(self) do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select cost_object_id, cost_object_source from ord_detail where id = %f',
//                  [AOrdDetailId]));
//    Open;
//    if eof and bof then
//    begin
//      Sql.Clear;
//      Sql.Add(Format('select cost_object_id, cost_object_source from hist_ord_detail where id = %f',
//                    [AOrdDetailId]));
//      Open;
//      if eof and bof then Exit;
//    end;
//    ACostObjectId     := FieldByname('cost_object_id').asFloat;
//    ACostObjectSource := FieldByname('cost_object_source').asString;
//  finally
//    Free;
//  end;
end;

function TFrmInvoice.GetfreightId(nId:Real):Real;
var
  cFreight:String;
begin
  cFreight := SelectValueFmtAsString('select s.freight_descrip from ' +
                           'shipments s, shipment_dtl d ' +
                           'where d.id = %f and d.shipments_id = s.id', [nId]);
  Result   := SelectValueFmtAsFloat('select id from freight where Replace(descrip, '''''''', '''') = ''%s''', [StrTran(cFreight, '''', '')]);
end;

function TFrmInvoice.GetfreightId2(nId:Real):Real;
var
  cFreight:String;
  aId:Real;
begin
  Result := SelectValueFmtAsFloat('select s.freight_id from shipments s where s.id = %f', [nId]);
  if Result = 0 then
  begin
    cFreight := SelectValueFmtAsString('select s.freight_descrip from shipments s where s.id = %f', [nId]);
    Result   := SelectValueFmtAsFloat('select id from freight where Replace(descrip, '''''''', '''') = ''%s''', [StrTran(cFreight, '''', '')]);
  end;
end;

procedure TFrmInvoice.GetGlAcct;
begin
//  with TblArPrePostDetail do
  with QryArPrePostDetail do
    if PkAcct.Execute then
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('GLACCT_ID_SALES').asFloat := PkAcct.GetValue('ID');
    end
    else
    begin
      Cancel;
      raise Exception.Create(cTXT0000016); // 'Please enter a GL Account.'
    end;
end;

procedure TFrmInvoice.CheckTerms;
begin
// if (TblArPrePost.FieldByName('TERMS_ID').asFloat = 0) and
//    (TblArPrePostDetail.FieldByName('TERMSID').asFloat <> 0)

 if (QryArPrePost.FieldByName('TERMS_ID').asFloat = 0) and
    (QryArPrePostDetail.FieldByName('TERMSID').asFloat <> 0)
    then with QryArPrePost do
    begin
      if not(State in [dsEdit, dsInsert]) then Edit;
      FieldByName('TERMS_ID').asFloat :=
           QryArPrePostDetail.FieldByName('TERMSID').asFloat;

//      FieldByName('TERMS_ID').asFloat :=
//           TblArPrePostDetail.FieldByName('TERMSID').asFloat;
      Post;
    end;
end;


procedure TFrmInvoice.SrcArPrePostDataChange(Sender: TObject; Field: TField);
begin
  if FQryArPrePostState in [dsEdit, dsInsert, dsInactive] then
  begin
    FDetailSaleseAcctId := wwQryGLAcctID.asFloat;
    FDetailSaleseAcct   := wwQryGLAcctACCT.asString;
    FQryArPrePostState := dsBrowse;
  end;

  if FQryArPrePostState_FR in [dsEdit, dsInsert, dsInactive] then
  begin
    FDetailSaleseAcctId_FR := wwQryGLAcct_FreightID.asFloat;
    FDetailSaleseAcct_FR   := wwQryGLAcct_FreightACCT.asString;
    FQryArPrePostState_FR := dsBrowse;
  end;


  ViewCreditMemos1.Visible := SelectValueFmtAsFloat('select arprepost_id ' +
                                      'from rma_credits ' +
                                      'where arprepost_id = %f',
                                      [QryArPrePost.FieldByName('ID').asFloat]) <> 0;
  CheckDBEditInvoice;

  //UpdateSrcQryBillTo;

  CheckFrmInvoiceItemsCaption;
  PostMCMessage;
end;

procedure TFrmInvoice.CheckDBEditInvoice;
begin
  if fPrior = 'N' then
    with DbEditInvoice do
    begin
      ReadOnly := not (QryArPrePost.State in [dsInsert]);
      if ReadOnly then Color := clBtnFace else Color := clWindow;
    end;
end;

procedure TFrmInvoice.UpdateSrcQryBillTo;
begin
  //with DM.QryBillTo do
  //begin
  //  Close;
  //  Params[0].asFloat := TblArPrePost.FieldByName('ARCUSTO_ID').asFloat;
  //  Open;
  //end;
end;


procedure TFrmInvoice.SelectCustomerScope;
begin
//  IqTiming1.Start('Bring Up Customer selection form');
//  if fPrior = 'N' then Selection := DoSelectCustomer(self) else Selection := 3;
////  IqTiming1.Stop('DoSelectCustomer');
//  if Selection < 0 then
//  begin
//    QryArPrePost.Cancel;
//    raise Exception.Create(cTXT0000017 ); // 'No selection was made'
//  end;
//  GetCustomer;
//  PopupARInfo(QryArPrePost.FieldByName('ARCUSTO_ID').AsFloat); {in Po_Share.pas}

end;

procedure TFrmInvoice.GetCustomer;
var
  cSql, AEplantIDStr:String;
  AEplantId:Real;
begin
  cSql := 'select distinct v.arcusto_id, v.custno, v.company, v.addr1, v.addr2, v.city, v.state, v.zip, v.eplant_id, v.cust_group from ';

  if Selection = 0 then
     cSql:= cSql + 'c_ship_hist v,                                                    ' +
                    '     ship_to s,                                                    ' +
                    '     c_arinvoice_ship_sum a                                        ' +
                    ' where NVL(v.pending_invoiced_qty, 0) < NVL(decode(v.vmi_fgmulti_id, null, NVl(v.qtyshipped, 0),                    ' +
                    '              decode(NVL(s.vmi_invoice_on_ship, ''N''), ''N'', v.vmi_consumed, NVl(v.qtyshipped, 0))) -   ' +
                    '               NVL(v.invoiced_qty, 0) - NVL(v.pending_invoiced_qty, 0), 0)                                ' +


//                    ' where NVL(v.pending_invoiced_qty, 0) < NVL(v.invoice_qty, 0)      ' +
                    ' and v.qtyshipped > NVL(a.invoiced_qty, 0) - (select NVL(sum(invoice_qty), 0) from arinvoice_detail where shipment_dtl_id = v.shipment_dtl_id and rma_detail_id is not null) ' +
                    ' and NVL(v.to_invoice, ''Y'') = ''Y''                              ' +
                    ' and v.ship_to_id = s.id(+)                                        ' +
                    Format(' and v.shipdate >= To_Date(''%s'', ''MM/DD/RRRR'') ', [FormatDateTime('mm/dd/yyyy', FCustPickListDate)]) +
                    ' and ((v.vmi_fgmulti_id is null) or (v.vmi_fgmulti_id is not null and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'')) ' +
                    ' and v.shipment_dtl_id = a.shipment_dtl_id(+)                      ' +
                    ' -- HPICK_EMPTY_DATASET_FILTER_START                                     ' +
                    ' -- This is used in order to speed up FieldDefs.Update inside HPickFrm   ' +
                    ' -- when building TFields objects                                        ' +
                    '  and 1 < 0                                                              ' +
                    ' -- HPICK_EMPTY_DATASET_FILTER_END                                       '


   else if Selection = 1 then
     cSql := cSql + 'v_ord_ord_short v where ' +
                                             'decode (NVL(cumm_shipped, 0), 0, ' +
                                             'NVL(total_qty_ord, 0) - NVL(invoiced_qty, 0) + (select NVL(sum(invoice_qty), 0) from arinvoice_detail where ord_detail_id = v.ord_detail_id and rma_detail_id is not null), ' +
                                             'NVL(cumm_shipped, 0) - NVL(invoiced_qty, 0) + (select NVL(sum(invoice_qty), 0) from arinvoice_detail where ord_detail_id = v.ord_detail_id and rma_detail_id is not null)) <> 0 and arcusto_id is not null'

  else if Selection = 2 then
     cSql:= cSql + 'v_c_ship_hist v,                                               ' +
                    '     ship_to s,                                               ' +
                    '     c_arinvoice_ship_sum a                                   ' +
                    ' where NVL(v.pending_invoiced_qty, 0) < NVL(v.invoice_qty, 0) ' +
                    ' and v.qtyshipped > NVL(a.invoiced_qty, 0)                    ' +
                    ' and NVL(v.to_invoice, ''Y'') = ''Y''                         ' +
                    ' and v.ship_to_id = s.id(+)                                   ' +
                    ' and v.vmi = ''Y''                                            ' +
//                    ' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''N''               ' +
                    ' and v.shipment_dtl_id = a.shipment_dtl_id(+)                 ' +
                    ' and vmi_misc.VmiExists(v.shipment_dtl_id) = 1                '



//                    ' and v.shipment_dtl_id in  (select v.shipment_dtl_id            ' +
//                                                   ' from vmi_consumption v          ' +
//                                                   ' where v.id not in (select NVL(vmi_consumption_id, 0) from arprepost_detail) ' +
//                                                   '  and NVL(v.qty, 0) > (select NVL(sum(NVL(invoice_qty, 0)), 0) from arinvoice_detail where vmi_consumption_id = v.id) )'


   else if Selection = 3 then
     cSql := 'select id as arcusto_id, custno, company, addr1, addr2, city, state, zip, cust_group from v_arcusto';






  if Selection < 3 then
  with PkCustomer2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add(cSql);
  end;

  if Selection > 2 then
  begin
    if (FCustomerId <> 0) and CustomerCarryOver1.Checked and CustomerCarryOver1.Visible then
    begin
      QryArPrePost.FieldByName('ARCUSTO_ID').AsFloat := FCustomerId;
      if True then
      begin
        if '1' (*SecurityManager.EPlant_ID*) <> 'NULL' then
        begin
          QryArPrePost.FieldByName('EPLANT_ID').AsFloat := StrToFloat('1');
          QryArPrePost.FieldByName('CTRL_EPLANT_ID').AsFloat := StrToFloat('1');
        end
        else
        begin
          AEPlantIDStr:= '1'; //SecurityManager.EPlant_ID;
//          if DoPickEPlant( AEPlantIDStr ) and (AEPlantIDStr <> 'NULL') then
//          begin
             QryArPrePost.FieldByName('EPLANT_ID').AsFloat := StrToFloat('1');
             QryArPrePost.FieldByName('CTRL_EPLANT_ID').AsFloat := StrToFloat('1');
//          end;
        end;
      end;
    end
    else
    with PkCustomer do
    begin
      if Execute
      then
      begin
        QryArPrePost.FieldByName('ARCUSTO_ID').AsFloat := GetValue('ARCUSTO_ID');
        FCustomerId := QryArPrePost.FieldByName('ARCUSTO_ID').AsFloat;
        if True then
        begin
          if '1' (*SecurityManager.EPlant_ID*) <> 'NULL' then
          begin
            QryArPrePost.FieldByName('EPLANT_ID').AsFloat := StrToFloat('1');
            QryArPrePost.FieldByName('CTRL_EPLANT_ID').AsFloat := StrToFloat('1');
          end
          else
          begin
            AEPlantIDStr:= '1'; //SecurityManager.EPlant_ID;
//            if DoPickEPlant( AEPlantIDStr ) and (AEPlantIDStr <> 'NULL') then
//            begin
              QryArPrePost.FieldByName('EPLANT_ID').AsFloat := StrToFloat('1');
              QryArPrePost.FieldByName('CTRL_EPLANT_ID').AsFloat := StrToFloat('1');
//            end;
          end;
        end;
      end
      else
      begin
        QryArPrePost.Cancel;
        raise Exception.Create(cTXT0000018); // 'No customer selected'
      end;
    end
  end
  else

    with PkCustomer2 do
    begin
      if Execute then
      begin
       QryArPrePost.FieldByName('ARCUSTO_ID').AsFloat := GetValue('ARCUSTO_ID');
       AEplantId := GetValue('EPLANT_ID');
       if AEplantId <> 0 then
       begin
         QryArPrePost.FieldByName('EPLANT_ID').AsFloat := AEplantId;
         QryArPrePost.FieldByName('CTRL_EPLANT_ID').AsFloat := AEplantId;
       end;
      end
    else
    begin
      QryArPrePost.Cancel;
      raise Exception.Create(cTXT0000018); // 'No customer selected'
    end;
  end
end;



procedure TFrmInvoice.SBPeriodClick(Sender: TObject);
var
  Id:Real;
  AQry:TFDQuery;
begin
//  with QryArPrePost do
//  begin
//    Id := DoFindPeriod(self);
//    if Id <> 0 then
//    begin
//      if not (State in [dsEdit, dsInsert]) then Edit;
//      FieldByName('GLPERIODS_ID_AR').asFloat := Id;
//      AQry := TFDQuery.Create(self);
//      try
//        AQry.Connection := db_dm.FDConnection;
//        AQry.Sql.Add(Format('select period, start_date, end_date from glperiods where id = %f', [Id]));
//        AQry.Open;
//        DBEditPeriod.Text := AQry.FieldByName('PERIOD').asString;
//        if AQry.FieldByName('START_DATE').asdatetime <> 0 then
//          FieldByName('START_DATE').asdatetime :=  AQry.FieldByName('START_DATE').asdatetime;
//        if AQry.FieldByName('END_DATE').asdatetime <> 0 then
//          FieldByName('END_DATE').asdatetime :=  AQry.FieldByName('END_DATE').asdatetime;
//      finally
//        AQry.Free;
//      end;
////      DBEditPeriod.Text := SelectValueFmtAsString('select period from glperiods where id = %f', [Id]);
//      CheckCurrencyRate;
//    end;
//  end;
end;

procedure TFrmInvoice.Freight1Click(Sender: TObject);
begin
//  DoEditFreight(self);
//  ReopenQryArPrePostDetail;
//
////  TblArPrePostDetail.Refresh;
////  wwTblFreight.Refresh;
//  wwQryFreight.Close; wwQryFreight.Open;
end;

procedure TFrmInvoice.AssignDefaults;
var
  AQry:TFDQuery;
  nAcctId:Real;
  nTermsId:Real;
  nCurrencyId:Real;
  nBillToId:Real;
  nGlPeriodsID:Real;
begin
  with QryArPrePost do
  try
    SrcArPrePost.OnDataChange := nil;
    FieldByName('INVOICE_DATE').asDateTime:= Date;
    FieldByName('ON_HOLD').asString       := 'N';
    FieldByName('INV_PREFIX').asString    := SelectValueAsString('select ecode from iqsys');

    nBillToId:= SelectValueFmtAsFloat('select min(id) from bill_to where arcusto_id = %f ' +
                          'and NVL(default_bill_to, ''N'') = ''Y'' and NVL(pk_hide, ''N'') = ''N''', [FieldByName('ARCUSTO_ID').asFloat]);
    if nBillToId = 0 then
      nBillToId:= SelectValueFmtAsFloat('select min(id) from bill_to where arcusto_id = %f and NVL(pk_hide, ''N'') = ''N''', [FieldByName('ARCUSTO_ID').asFloat]);
    DBEditCustNo.Text := SelectValueFmtAsString('select custno from arcusto where id = %f', [FieldByName('ARCUSTO_ID').asFloat]);
    FieldByName('CUSTNO').asString := DBEditCustNo.Text;
    if nBillToId <> 0 then
    begin
 //    dbWWBillTo.Text := SelectValueFmtAsString('select attn from bill_to where id = %f', [nBillToId]);
//     DBEditBiillTo.Text := SelectValueFmtAsString('select attn from bill_to where id = %f', [nBillToId]);
//     FieldByName('BILLTOCOMP').asString := DBEditBiillTo.Text;
     FieldByName('BILLTOCOMP').asString := dbWWBillTo.Text;
     FieldByName('BILL_TO_ID').asFloat := nBillToId;
    end;

//    AQry := TFDQuery.Create(self);
//    try
//      AQry.Connection := db_dm.FDConnection;
//      AQry.Sql.Add(Format('select id, start_date, end_date, period ' +
//                     'from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
//                     [FormatDateTime('mm/dd/yyyy', FieldByName('INVOICE_DATE').asDateTime)]));
//      AQry.Open;
//      nGlPeriodsID := AQry.FieldByName('ID').asFloat;
//      if AQry.FieldByName('START_DATE').asdatetime <> 0 then
//        FieldByName('START_DATE').asdatetime :=  AQry.FieldByName('START_DATE').asdatetime;
//      if AQry.FieldByName('END_DATE').asdatetime <> 0 then
//        FieldByName('END_DATE').asdatetime :=  AQry.FieldByName('END_DATE').asdatetime;
//      DBEditPeriod.Text := AQry.FieldByName('PERIOD').asString;
//      FieldByName('period').asString  := DBEditPeriod.Text;
//    finally
//      AQry.Free;
//    end;
//    nGlPeriodsID := SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date',
//                              [FormatDateTime('mm/dd/yyyy', FieldByName('INVOICE_DATE').asDateTime)]);
    if nGlPeriodsID <> 0 then FieldByName('GLPERIODS_ID_AR').asFloat:= nGlPeriodsID;

    nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(ar_glacct_id, ''acct_id_ar'', %f ) from arcusto where id = %f',
                       [FieldByName('EPLANT_ID').asFloat, QryArPrePostARCUSTO_ID.asFloat]);

    if nAcctId = 0 then
      nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_ar'', %f) from dual',
                           [FieldByName('EPLANT_ID').asFloat]);



    dbePlant.Text := SelectValueFmtAsString('select  ''['' || ID || '']  '' || name from eplant where id = %f',
                         [FieldByName('EPLANT_ID').asFloat]);

    FieldByName('EPlant_Name').asString  := dbePlant.Text;

    if nAcctId <> 0 then
    begin
      FieldByName('GLACCT_ID_AR').asFloat  := nAcctId;
//      wwDBGlAcct.Text := SelectValueFmtAsString('select acct from glacct where id = %f', [nAcctId]);
//      FieldByName('ArAcct').asString  := wwDBGlAcct.Text;
      FieldByName('ArAcct').asString  := SelectValueFmtAsString('select acct from glacct where id = %f', [nAcctId]);
    end;

    nTermsId := SelectValueFmtAsFloat('select terms_id from arcusto where id = %f', [FieldByName('ARCUSTO_ID').asFloat]);


//    AQry := TFDQuery.Create(self);
//    try
//      AQry.Connection := db_dm.FDConnection;
//      AQry.Sql.Add(Format('select t.id, t.days, NVL(t.based_on, ''I'') as based_on ' +
//                     'from terms t, arcusto a where a.terms_id = t.id and a.id = %f',
//                     [FieldByName('ARCUSTO_ID').asFloat]));
//      AQry.Open;
//      if not (AQry.eof and AQry.bof) then
//      begin
//        FieldByName('TERMDAYS').asInteger    := Aqry.FieldByName('DAYS').asInteger;
//        FieldByName('TERMSBASEDON').asString := Aqry.FieldByName('BASED_ON').asString;
//        FieldByName('TERMS_ID').asFloat      := Aqry.FieldByName('id').asFloat;
//      end;
//    finally
//      AQry.Free;
//    end;

//    AssignEPlantCurrency(QryArPrePost, QryArPrePostCURRENCY_ID, 'ARCUSTO', QryArPrePostARCUSTO_ID.asFloat);
//    nCurrencyId := SelectValueFmtAsFloat('select currency_id from arcusto where id = %f', [FieldByName('ARCUSTO_ID').asFloat]);

//    if nCurrencyId  = 0 then
//      nCurrencyId  := GetEplantNativeCurrencyId; {in McShare.pas}

//    if nCurrencyId <> 0 then FieldByName('CURRENCY_ID').asFloat := nCurrencyId;

    CheckCurrencyRate;
    ReplaceGLACCT_ID_AR_with_MC_Account(FieldByName('CURRENCY_ID').asFloat);
    FieldByName('ArAcct').asString  := SelectValueFmtAsString('select acct from glacct where id = %f', [FieldByName('GLACCT_ID_AR').asFloat]);
  finally
    SrcArPrePost.OnDataChange := SrcArPrePostDataChange;
    SrcArPrePostDataChange(nil, nil);
  end;
end;

procedure TFrmInvoice.CheckFrmInvoiceItemsCaption;
begin
end;


procedure TFrmInvoice.GridInvoiceDetailDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 //
end;

function TFrmInvoice.CheckForSameItem(Source:TObject):Boolean;
var
  Id:Real;
  nGridId:Real;
begin
  Result := False;
  nGridId := TIQUniGridControl(Source).DataSource.DataSet.FieldByName('shipment_dtl_id').asFloat;
  Id := SelectValueAsFloat(Format('select shipment_dtl_id from arprepost_detail ' +
                      'where arprepost_id = %f and shipment_dtl_id = %f',
                      [QryArPrePost.FieldByName('ID').asFloat,
                       nGridId]));
  if Id <> 0 then Result := True;
end;

procedure TFrmInvoice.PrinterSetup1Click(Sender: TObject);
begin
//  PrinterSetupDialog1.Execute;
end;

procedure TFrmInvoice.New1Click(Sender: TObject);
begin
  QryArPrePost.CheckBrowseMode;
  QryArPrePost.Insert;
end;

procedure TFrmInvoice.Delete1Click(Sender: TObject);
begin
  QryArPrePost.CheckBrowseMode;
 // Nav.BtnClick(nbDelete);
//  QryArPrePost.Delete;
end;

procedure TFrmInvoice.Exit1Click(Sender: TObject);
begin
//  Close;
end;

procedure TFrmInvoice.SBSearchClick(Sender: TObject);
begin
//  if not CheckTaxCalculated then
//    EXIT;
//  with PkArPrepost do
//    if Execute then QryArPrePost.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmInvoice.PostInvoice1Click(Sender: TObject);
begin
  SBSave.Click;
end;

procedure TFrmInvoice.SBViewClick(Sender: TObject);
begin
//  if InvoiceItems1.Checked  then CloseInvoiceItems;
//  DoJumpToInvoice(self, 0);
////  DoViewInvoices(self, 0);
end;

procedure TFrmInvoice.SBSaveClick(Sender: TObject);
var
  cDate:String;
  ADate:TDateTime;
begin
//  FPostingAll := False;
//  CheckCurrencyRate;
//  QryArPrePost.CheckBrowseMode;
//  QryArPrePostDetail.CheckBrowseMode;
////  TblArPrePostDetail.CheckBrowseMode;
//  CheckFXAcct;
//
//  if SelectValueFmtAsFloat('select count(d.id) from arprepost_detail d, glacct g where d.arprepost_id = %f ' +
//                     'and d.GLACCT_ID_SALES = g.id and NVL(g.COST_SOURCE_RQD, ''N'') = ''Y'' and RTrim(d.COST_OBJECT_SOURCE) is null',
//     [QryArPrePost.FieldByName('ID').asFloat]) <> 0 then
//         raise exception.create(cTXT0000093);
//
//
//  if SelectValueAsFloat(Format('select count(id) from arprepost_detail where arprepost_id = %f',
//     [QryArPrePost.FieldByName('ID').asFloat])) = 0 then
//     raise Exception.Create(cTXT0000019); // 'There are no details on the invoice.  Cannot post.'
//
//  if SelectValueAsFloat(Format('select count(id) from arprepost_detail where arprepost_id = %f and NVL(GLACCT_ID_SALES, 0) = 0',
//     [QryArPrePost.FieldByName('ID').asFloat])) <> 0 then
//     // 'A Sales Account is missing on one of the detail records.  Cannot post.'
//     raise Exception.Create(cTXT0000020);
//
//  if SelectValueAsString('select nvl(tax_code_required, ''N'') from iqsys where rownum < 2') = 'Y' then
//    if SelectValueAsFloat(Format('select count(d.id) from arprepost_detail d, arprepost a ' +
//                       ' where d.arprepost_id = a.id and d.tax_code_id is null and a.id = %f and NVL(a.prior_entry, ''N'') = ''N''',
//     [QryArPrePost.FieldByName('ID').asFloat])) <> 0 then
//     raise Exception.Create(cTXT0000021); // 'A Tax Code is missing on one of the detail records'
//
//
////  if SelectValueAsFloat(Format('select count(id) from arinvoice where invoice_no = ''%s''',
////     [TblArPrePost.FieldByName('INVOICE_NO').asString])) <> 0 then
////     raise Exception.Create('Invoice number exists in posted invoices, cannot post');
//
//
//  if QryArPrePost.FieldByName('ON_HOLD').asString = 'Y' then
//    raise Exception.Create(cTXT0000022 {'Invoice is on hold.  Cannot post.'});
//
//  GlPeriodId := QryArPrePost.FieldByName('GLPERIODS_ID_AR').asFloat;
//  CheckForOpenPeriod('ar_status', GlPeriodId);  {in IqAcct.pas}
//
//  if fPrior = 'N' then
//  begin
//    cDate := DateToStr(Date);
//    ADate := Date;
////    if IQInputQuery('G/L Batch Date', 'Please Enter G/L Batch Date', cDate, '!99/99/0000;1; ') then    {IqInQry.pas}
//    //if GetDateDialog( ADate, 'Batch Date:') then   {in DateDlg.pas}
//    if GetWWDateDialog( cTXT0000030 {'GL Batch Date'},
//      cTXT0000051 {'Please select a batch date:'}, ADate) then
//    begin
//      CheckPostDate(ADate, QryArPrePostGLPERIODS_ID_AR.asFloat, 'AR_CHECK_POST_DATE' ); {ArShare.pas}
//      cDate := DateToStr(ADate);
//      fGLBatchDate := ADate;
//
////      fGLBatchDate := StrToDate(cDate);
//      PostCurrentInvoice;
//      RunExternalExe;
//    end;
//  end
//  else if IqConfirmYN(cTXT0000023 {'Post current invoice?'}) then
//    PostCurrentInvoice;
//  ReopenQryArPrePost;
end;

procedure TFrmInvoice.CheckFXAcct;
begin
  if FMultiCurrency and (FXRate <> 1) then
    if QryArPrePost.FieldByName('GLACCT_ID_FX').asFloat = 0 then
      raise Exception.Create(cTXT0000024); // 'Please select a Foreign Currency account.'
end;

{
procedure TFrmInvoice.PostCurrentInvoice;
var
  DBase:TFDConnection;
  nGLBatchId_Id:Real;
begin
  try
    FPostQry := TFDQuery.Create(self);
    FPostQry.Connection := db_dm.FDConnection;

    FPostQry.Sql.Add(Format('select a.id,                ' +
                           'a.glacct_id_fx,              ' +
                           'a.glacct_id_ar,              ' +
                           'a.glperiods_id_ar,           ' +
                           'a.invoice_no,                ' +
                           'a.currency_id,               ' +
                           'a.arcusto_id,                ' +
                           'c.company,                   ' +
                           'c.custno                     ' +
                      'from arprepost a,                 ' +
                      '     arcusto c                    ' +
                     'where a.id = %f                    ' +
                     '  and a.arcusto_id = c.id(+)       ',
                     [QryArPrePost.FieldByName('ID').asFloat]));


//    FPostQry.Sql.Add(Format('select id,             ' +
//                            '        glacct_id_fx,  ' +
//                            '        glacct_id_ar,  ' +
//                            '        glperiods_id_ar, ' +
//                            '        invoice_no,    ' +
//                            '        currency_id    ' +
//                            '   from arprepost      ' +
//                            '  where id = %f        ', [QryArPrePost.FieldByName('ID').asFloat]));
    FPostQry.Open;

    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    nGLBatchId_Id  := GetNextID('GLBATCHID');
    FGLBatchId_Id  := nGLBatchId_Id;
    fArInvoiceId   := GetNextID('ARINVOICE');
    if fPrior = 'N' then InsertGlbatchId(nGLBatchId_Id);
    if fPrior = 'N' then InsertGlbatch(nGLBatchId_Id);
    InsertArInvoice(nGLBatchId_Id);
    InsertArInvoiceDetail;
    if FStdCostPosting then CostOfGoodsSold( nGLBatchId_Id );
//    UpdateArcustoHighBalance;

    ExecuteCommandFmt('delete from arprepost where id = %f', [QryArPrePost.FieldByName('ID').asFloat]);
//    QryArPrePost.Delete;
    DBase.Commit;
    ExecuteCommandFmt('begin intercomp.update_glbatch(%f); end;', [nGLBatchId_Id]);
    if FPrior = 'N' then
    begin
    if IqConfirmYN('Invoice Posted, Do you wish to print the AfterPost report?')
      then  PrintAfterPostReport(nGLBatchId_Id);
    end
    else
      IqConfirm('Invoice Posted');
  finally
    FPostQry.Free;
    if DBase.InTransaction then
    begin
      DBase.RollBack;
      ShowMessage('Invoice was not posted');
    end;
    Screen.Cursor := crDefault;
  end;
end;

}


procedure TFrmInvoice.PostCurrentInvoice;
var
  AMulti:String;
  AStd:String;
  aGLBatchId_Id:Real;
begin
//haserau
end;

procedure TFrmInvoice.EmailInvoice(AId:Real);
var
  SelectionList:TStringList;
  AReport:String;
  ABillToId, Arcustoid:Real;
  AQry:TFDQuery;
  ArinvoiceId:Real;
begin
//  if SelectValueAsString('select NVL(AUTOEMAILARBATCHPOST, ''N'') from iqsys2') = 'N' then exit;
//
//  AQry := TFDQuery.Create(nil);
//
//  try
//    AQry.Connection := db_dm.FDConnection;
//    AQry.Sql.Add(Format('select distinct header_id from glbatch where glbatchid_id = %f ', [AId]));
//    AQry.Open;
//    while not AQry.Eof do
//    begin
//      ArinvoiceId := AQry.FieldByName('header_id').asFloat;
//      try
//        SelectionList := TStringList.Create;
//        SetCriteriaExpression( SelectionList,  Format('{ARINVOICE.ID} = %f', [ArinvoiceId]));
//
//        ABillToId := SelectValueFmtAsFloat('select bill_to_id from arinvoice where id = %f', [ArinvoiceId]);
//        Arcustoid := SelectValueFmtAsFloat('select arcusto_id from arinvoice where id = %f', [ArinvoiceId]);
//
//        AReport:= TFrmPrintDocsCustom.GetReportNameEx( 'POSTED_INVOICE_REPORT',
//                                                        [ 'bill_to', ABillToId,
//                                                          'arcusto', Arcustoid ]);
//
//        if Empty( AReport ) then
//           // 'No default report assigned in System Parameters. Please assign default report.'
//         raise Exception.Create(cTXT0000040);
//
//          DoAutoEmailAfterPost(AReport, SelectionList, ArinvoiceId);
//
//
//          ExecuteCommandFmt('update arinvoice set print_count = NVL(print_count,0) + 1, ' +
//                    '                     print_last_user = ''%s'',             ' +
//                    '                     print_last_date = to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS'') '+
//                    '        where ID = %f',
//                    [ SecurityManager.UserName,
//                      FormatDateTime('mm/dd/yyyy hh:nn:ss', Now ),
//                      ArinvoiceId ]);
//      finally
//        SelectionList.Free;
//      end;
//
//
//
//      AQry.Next;
//    end;
//
//  finally
//    AQry.Free;
//  end;

end;


procedure TFrmInvoice.CheckCurrencyRate;
var
  nID:Real;
begin
  FXRate:= 1;
  EXIT;
//
//  if not FMultiCurrency then
//  begin
//    FXRate := 1;
//    Exit;
//  end;
//
//  with QryARPrepost do
//  begin
//    nId := FieldByName('CURRENCY_ID').asFloat;
//    if nId = 0 then
//      nId := GetEplantNativeCurrencyId; {in McShare.pas}
////    if nId = 0 then nId := SelectValueAsFloat('select currency_id from iqsys');
//    if nId = 0 then raise Exception.Create(cTXT0000024 {'Please select a Foreign Currency account.'});
//    FXrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
//                         [nId, FieldByName('GLPERIODS_ID_AR').asFloat]);
//    if FXRate = 0 then
//      FXrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [nId]);
//  end;

end;

procedure TFrmInvoice.CheckViewCurrencyRate;
var
  nID:Real;
begin
      FXRate := 1;
    Exit;
//  if not FMultiCurrency then
//  begin
//    FXRate := 1;
//    Exit;
//  end;
//
//  with FPostQry do
//  begin
//    nId := FieldByName('CURRENCY_ID').asFloat;
//    if nId = 0 then
//      nId := GetEplantNativeCurrencyId; {in McShare.pas}
////    if nId = 0 then nId := SelectValueAsFloat('select currency_id from iqsys');
//    if nId = 0 then raise Exception.Create(cTXT0000024 {'Please select a Foreign Currency account.'});
//    FXrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
//                         [nId, FieldByName('GLPERIODS_ID_AR').asFloat]);
//    if FXRate = 0 then
//      FXrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [nId]);
//  end;

end;



procedure TFrmInvoice.ReplaceGLACCT_ID_AR_with_MC_Account(nId:Real);
begin
//  // NOTE:  This can be handled by iqms.ar.assign_mc_gl_acounts
//
//  if not FMultiCurrency then Exit;
//  with QryARPrepost do
//  begin
//    if not (State in [dsEdit, dsInsert]) then Edit;
////    if FieldByName('GLACCT_ID_FX').asFloat = 0 then
////    begin
////      FieldByName('GLACCT_ID_FX').asFloat :=
////        SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''ACCT_ID_FX'', %f) from dual',
////        [FIeldByName('EPLANT_ID').asFloat]);
////    end;
//    AssignMCAccount(nId, FieldByName('GLACCT_ID_AR'));
//    FindRootAccount(nId, FieldByName('GLACCT_ID_FX'), FIeldByName('EPLANT_ID').asFloat);
//  end;
end;


procedure TFrmInvoice.FindRootAccount(AID:Real; AField:TField; AEplantId:Real);
var
  nId:Real;
begin
//  // NOTE:  This can be handled by iqms.ar.assign_mc_gl_acount_root
//
//  nId := GetFXAccountID(QryArPrepost.FieldByName('GLACCT_ID_AR').asFloat);
//  nId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''ACCT_ID_FX'', %f) from dual', [nId, AEplantId]);
//  if nId <> 0 then
//  begin
//    AField.asFloat := nId;
//    AssignMCAccount(AID, AField);
//  end;
end;


//procedure TFrmInvoice.AssignMCAccount(AID:Real; AField:TField);
//var
//  AGLValue:String;
//  AGLAcct, aNewGLAcct:String;
//  I, nStart, nLength:Integer;
//  nID:Real;
//begin
//  AGLValue := SelectValueFmtAsString('select glvalue from currency where id = %f', [AId]);
//  AGLAcct := SelectValueFmtAsString('select acct from glacct where id = %f', [AField.asFloat]);
//  aNewGLAcct := AGLAcct;
//  nStart  := Trunc(SelectValueAsFloat('select group_start from glacct_def where group_name = ' +
//                       '(select FX_SEGMENT_NAME from iqsys)'));
//  nLength  := Trunc(SelectValueAsFloat('select group_length from glacct_def where group_name = ' +
//                       '(select FX_SEGMENT_NAME from iqsys)'));
//  if Length(aNewGLAcct) < (nStart + nLength - 1) then
//    ANewGLAcct := AGLAcct
//  else
//  begin
//    try
//      for I:= nStart to (nStart + nLength - 1) do
//        ANewGLAcct[ I ] := AGLValue[ I - nStart + 1 ];
//    except
//      ANewGLAcct := AGLAcct;
//    end;
//  end;
//  nID := SelectValueFmtAsFloat('select id from glacct where acct = ''%s''', [ANewGLAcct]);
//  if nID = 0 then
//  begin
//    nID := AField.asFloat;
//  end;
//  AField.asFloat := nID;
//end;



{function StuffAccount(AID:Real, Acct:String):String;
var
  ASeg:String;
  AStart, ALen:Integer;
begin
  Astrart :=
end;}


procedure TFrmInvoice.CostOfGoodsSold( nGLBatchId_Id : Real );
var
  AStr2:String;
  Difference, AId:Real;
begin
  InsertStdCostRecord( nGLBatchId_Id );
  InsertStdCostElements( nGLBatchId_Id );

  Difference := SelectValueAsFloat(Format('select sum(debit) - sum(credit) from glbatch where glbatchid_id = %f ' +
                              'and header_id = %f', [nGLBatchId_Id, fArInvoiceId]));

  if (Abs(Difference) - 0.01) > 0.001 then
    // 'The batch is out of balance. There is a problem with the cost of goods sold.'
    raise exception.Create(cTXT0000028);


  if Difference <> 0 then
  begin
    if SelectValueAsFloat(Format('select debit from glbatch where id = %f', [fMaxCogsId])) <> 0 then
    begin
      Difference := Difference * (-1);
      ExecuteCommand(Format('update glbatch set debit = debit + %f where id = %f', [Difference, fMaxCogsId]));
    end
    else ExecuteCommand(Format('update glbatch set credit = credit + %f where id = %f', [Difference, fMaxCogsId]));
  end;

end;

procedure TFrmInvoice.InsertStdCostRecord( nGLBatchId_Id : Real );
var
  nTotalCost:Real;
  AStr:String;
  AStr2:String;
  aCount0, aCount1, aCount2: Real;
begin
  if FPostingAll then
    AStr2 := 'v_arprepost_cogs_a2 d '
  else
    AStr2 := 'v_arprepost_cogs_a d ';

  try
    ACount0 := SelectValueFmtAsFloat('select count(id) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]);

    AStr :=Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'd.glacct, ' +
                  'decode(sign(d.std_total_elements) , -1, ' +
                  'Abs(d.std_total_elements), 0 ), ' +
                  'decode(sign(d.std_total_elements), -1, ' +
                  '0, Abs(d.std_total_elements) ), ' +
                  '''INV# %s INVENTORY CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' ' +
                  'from ' +
                   AStr2 +
                  'where d.arprepost_id = %f and d.no_post_std_cost = ''N'' ' +
                 ' and d.arinvt_id in (select arinvt_id ' +
                         '  from (select arinvt_id,      ' +
                          '              count(elements_id) as cnt  ' +
                          '         from arinvt_elements            ' +
                          '        group by arinvt_id)              ' +
                          '        where cnt > 1)                   ',

                  [nGlBatchId_Id,
                   fArinvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);
     ExecuteCommand(AStr);

     ACount1 := SelectValueFmtAsFloat('select count(id) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]);


    AStr :=Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'decode(NVL(e.acct_id_recv_dispo_inv, 0), 0, plugins.get_glacct_id_with_ep_gl(plugins.get_glacct_id(''acct_id_fg'', null, null, a.currency_id), ''acct_id_fg'', a.eplant_id), ' +
                  ' plugins.get_glacct_id_with_ep_gl(plugins.IQ_Plug_Currency(e.acct_id_recv_dispo_inv, a.currency_id), ''acct_id_fg'', a.eplant_id)), ' +
                  'decode(sign(d.invoice_qty * NVL(c.uom_factor, 1) * ae.std_cost) , -1, ' +
                  'Abs(d.invoice_qty * NVL(c.uom_factor, 1) * ae.std_cost), 0 ), ' +
                  'decode(sign(d.invoice_qty * NVL(c.uom_factor, 1) * ae.std_cost), -1, ' +
                  '0, Abs(d.invoice_qty * NVL(c.uom_factor, 1) * ae.std_cost) ), ' +
                  '''INV# %s INVENTORY CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' ' +
                  'from ' +
                   AStr2 + ',  ' +
                 ' arprepost a, ' +
                 ' arinvt_elements ae, ' +
                 ' elements e,         ' +
                 ' c_ord_detail c      ' +
                  'where d.arprepost_id = %f and d.no_post_std_cost = ''N'' ' +

                 ' and a.id = d.arprepost_id  ' +
                 ' and c.arinvt_id = ae.arinvt_id ' +
                 ' and ae.elements_id = e.id  ' +
                 ' and d.ord_detail_id = c.ord_detail_id ' +


                 ' and d.arinvt_id in (select arinvt_id ' +
                         '  from (select arinvt_id,      ' +
                          '              count(elements_id) as cnt  ' +
                          '         from arinvt_elements            ' +
                          '        group by arinvt_id)              ' +
                          '        where cnt = 1)                   ',

                  [nGlBatchId_Id,
                   fArinvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);
     ExecuteCommand(AStr);
     ACount2 := SelectValueFmtAsFloat('select count(id) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]);

     if (ACount1 = ACount2) and (aCount0 = aCount1) then
     begin
      AStr :=Format('insert into glbatch ' +
                    '(glbatchid_id, ' +
                    'header_id, ' +
                    'glacct_id, ' +
                    'debit, ' +
                    'credit, ' +
                    'descrip) ' +
                    'select ' +
                    '%f, ' +
                    '%f, ' +
                    'd.glacct, ' +
                    'decode(sign(d.std_total_elements) , -1, ' +
                    'Abs(d.std_total_elements), 0 ), ' +
                    'decode(sign(d.std_total_elements), -1, ' +
                    '0, Abs(d.std_total_elements) ), ' +
                    '''INV# %s INVENTORY CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' ' +
                    'from ' +
                     AStr2 +
                    'where d.arprepost_id = %f and d.no_post_std_cost = ''N'' ' +
                   ' and d.arinvt_id in (select arinvt_id ' +
                           '  from (select arinvt_id,      ' +
                            '              count(elements_id) as cnt  ' +
                            '         from arinvt_elements            ' +
                            '        group by arinvt_id)              ' +
                            '        where cnt > 0)                   ',

                    [nGlBatchId_Id,
                     fArinvoiceId,
                     FPostQry.FieldByName('INVOICE_NO').asString,
                     StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                     StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                     FPostQry.FieldByName('ID').asFloat]);
       ExecuteCommand(AStr);


     end;


    AStr :=Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'plugins.get_glacct_id_with_ep_gl(NVL(f.glacct_id_finished, 0), ''acct_id_fg'', d.eplant_id), ' +
                  'decode(sign(sum(t.act_cost)), -1, abs(sum(t.act_cost)), 0), ' +
                  'decode(sign(sum(t.act_cost)), -1, 0, abs(sum(t.act_cost))), ' +
                  '''INV# %s R/FINISHED CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' ' +
                  'from arprepost_detail d,                ' +
                  '     ord_detail o,                      ' +
                  '     rma_detail r,                      ' +
                  '     failure_code f,                    ' +
                  '     translog t                         ' +
                 'where d.ord_detail_id = o.id             ' +
                 '  and o.rma_detail_id = r.id             ' +
                 '  and r.failure_code_id = f.id           ' +
                 '  and t.rma_detail_id = r.id             ' +
                 '  and t.act_cost <> 0                    ' +
                 '  and d.arprepost_id = %f                ' +
                 '  and NVL(d.no_post_std_cost, ''N'') = ''N'' ' +
                 '  and t.trans_type = ''REPAIR FINISHED'' ' +
                 'group by plugins.get_glacct_id_with_ep_gl(NVL(f.glacct_id_finished, 0), ''acct_id_fg'', d.eplant_id) ',
                  [nGlBatchId_Id,
                   fArinvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);
     ExecuteCommand(AStr);
     fMaxCogsId     := SelectValueAsFloat(Format('select max(id) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]));
  except
    on E:Exception do
      raise Exception.CreateFmt('Error Posting to GLBATCH while executing ''InsertStdCostRecord'' procedure. %s String %s',
                        [ E.Message, AStr ]);
  end;
end;


procedure TFrmInvoice.InsertStdCostElements( nGLBatchId_Id : Real );
var
  AStr:String;
begin
  try
    AStr :=Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'plugins.get_glacct_id_with_ep_gl(NVL(d.glacct_id, 0), ''acct_id_cogs'', d.eplant_id), ' +
                  'decode(sign(d.std_total_cost) , -1, ' +
                  '0, Abs(d.std_total_cost)), ' +
                  'decode(sign(d.std_total_cost), -1, ' +
                  'Abs(d.std_total_cost), 0 ), ' +
                  '''INV# %s COGS CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' ' +
                  'from ' +
                  'v_arprepost_cogs_elements_a d ' +
                  'where d.arprepost_id = %f and d.no_post_std_cost = ''N'' ',
                  [nGlBatchId_Id,
                   fArInvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);
    ExecuteCommand(AStr);


    AStr :=Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'plugins.get_glacct_id_with_ep_gl(NVL(f.glacct_id_labor_COGS, 0), ''acct_id_cogs'', d.eplant_id), ' +
                  'decode(sign(sum(t.act_cost)), -1, 0, abs(sum(t.act_cost))), ' +
                  'decode(sign(sum(t.act_cost)), -1, abs(sum(t.act_cost)), 0), ' +
                  '''INV# %s R/LABOR CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' ' +
                  'from arprepost_detail d,                ' +
                  '     ord_detail o,                      ' +
                  '     rma_detail r,                      ' +
                  '     failure_code f,                    ' +
                  '     translog t                         ' +
                 'where d.ord_detail_id = o.id             ' +
                 '  and o.rma_detail_id = r.id             ' +
                 '  and r.failure_code_id = f.id           ' +
                 '  and t.rma_detail_id = r.id             ' +
                 '  and NVL(d.no_post_std_cost, ''N'') = ''N'' ' +
                 '  and t.act_cost <> 0                    ' +
                 '  and d.arprepost_id = %f                ' +
                 '  and t.trans_type = ''LABOR'' ' +
                 'group by plugins.get_glacct_id_with_ep_gl(NVL(f.glacct_id_labor_COGS, 0), ''acct_id_cogs'', d.eplant_id) ',
                  [nGlBatchId_Id,
                   fArinvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);

     ExecuteCommand(AStr);

    AStr :=Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'plugins.get_glacct_id_with_ep_gl(NVL(f.glacct_id_comp_cogs, 0), ''acct_id_cogs'', d.eplant_id), ' +
                  'decode(sign(sum(t.std_cost * t.trans_quan)), -1, 0, abs(sum(t.std_cost * t.trans_quan))), ' +
                  'decode(sign(sum(t.std_cost * t.trans_quan)), -1, abs(sum(t.std_cost * t.trans_quan)), 0), ' +
                  '''INV# %s R/REPAIR CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' ' +
                  'from arprepost_detail d,                ' +
                  '     ord_detail o,                      ' +
                  '     rma_detail r,                      ' +
                  '     failure_code f,                    ' +
                  '     translog t                         ' +
                 'where d.ord_detail_id = o.id             ' +
                 '  and o.rma_detail_id = r.id             ' +
                 '  and r.failure_code_id = f.id           ' +
                 '  and t.rma_detail_id = r.id             ' +
                 '  and t.std_cost <> 0                    ' +
                 '  and NVL(d.no_post_std_cost, ''N'') = ''N'' ' +
                 '  and d.arprepost_id = %f                ' +
                 '  and t.trans_type = ''REPAIR'' ' +
                 'group by plugins.get_glacct_id_with_ep_gl(NVL(f.glacct_id_comp_cogs, 0), ''acct_id_cogs'', d.eplant_id) ',
                  [nGlBatchId_Id,
                   fArinvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);

     ExecuteCommand(AStr);


  except
    on E:Exception do
      raise Exception.CreateFmt('Error Posting to GLBATCH while executing ''InsertStdCostElements'' procedure. %s Str %s',
                         [ E.Message, AStr ]);                  {in IqErrDlg.pas}
  end;
end;



procedure TFrmInvoice.InsertGlbatchId(nGLBatchId_Id:Real);
var
  nBatchnumber:Real;
  AStr:String;
begin
  try
    nBatchNumber   := GetNextSequenceNumber('S_AR_INVOICE');
    AStr := Format('insert into glbatchid ' +
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
                  '''AR'', ' +
                  '''ARINVOICE_DETAIL'', ' +
                  '%f, ' +
                  '''%s'', ' +
                  'To_Date(''%s'', ''MM/DD/RRRR''), ' +
                  'To_Date(''%s'', ''MM/DD/RRRR''))',
                  [nGlBatchId_Id,
                   nBatchNumber,
                   GlPeriodId,
                   'IQMS', //SecurityManager.UserName,
                   FormatDateTime('mm/dd/yyyy', Date),
                   FormatDateTime('mm/dd/yyyy', fGLBatchDate)]);
     ExecuteCommand(AStr);
  except
    on E:Exception do
      raise Exception.CreateFmt('Error Posting to GLBATCHID while executing ''InsertGlbatchId'' .Procedure %s Str %s',
                         [ E.Message, AStr ]);
  end;

//    TblGlBatchId.FieldByName('USERID').asString     := SecurityManager.UserId;
end;

procedure TFrmInvoice.InsertGlbatch(nGLBatchId_Id:Real);
var
  nSum, Difference:Real;
begin
  InsertItems(nGLBatchId_Id);
  Insertfreight(nGLBatchId_Id);
  InsertTaxes(nGLBatchId_Id);
  InsertARCommissions(nGLBatchId_Id);
  nSum := SelectValueAsFloat(Format('select total from v_arprepost_detail_total where arprepost_id = %f',
                        [FPostQry.FieldByName('ID').asFloat]));
  InsertBatchTotal(nGLBatchId_Id, nSum);
  Difference := SelectValueAsFloat(Format('select sum(debit) - sum(credit) from glbatch where glbatchid_id = %f ' +
                              'and header_id = %f', [nGLBatchId_Id, fArInvoiceId]));
  if FMultiCurrency and (FXRate <> 1) then
  begin
    Difference := Difference * (-1);
    if Abs(Difference) > 0.00000000001 then
      ExecuteCommandFmt('insert into glbatch ' +
                    '(glbatchid_id, ' +
                    'header_id, ' +
                    'glacct_id, ' +
                    'debit, ' +
                    'credit, ' +
                    'descrip) ' +
                    'values ' +
                    '(%f, ' +
                    '%f, ' +
                    '%f, ' +
                    'decode(sign(%f), -1, 0, Abs(%f)), ' +
                    'decode(sign(%f), -1, Abs(%f), 0), ' +
                    '''INV# %s AR EX. OFFSET (%.6f) CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'')',
//                    '''INVOICE_NO %s AR, EXCHANGE OFFSET (%.6f)'')',
                    [nGlBatchId_Id,
                     fArInvoiceId,
                     FPostQry.FieldByName('GLACCT_ID_FX').asFloat,
                     Difference,
                     Difference,
                     Difference,
                     Difference,
                     FPostQry.FieldByName('INVOICE_NO').asString,
                     FxRate,
                     StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                     StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', '''''')]);
  end
  else
  begin
    if Difference <> 0 then
    begin
      if SelectValueAsFloat(Format('select debit from glbatch where id = %f', [fMaxTaxId])) <> 0 then
      begin
        Difference := Difference * (-1);
        ExecuteCommand(Format('update glbatch set debit = debit + %f where id = %f', [Difference, fMaxTaxId]));    // for fMaxTaxId see Line# 1092
      end
      else ExecuteCommand(Format('update glbatch set credit = credit + %f where id = %f', [Difference, fMaxTaxId]));
    end;
  end;
end;

function TFrmInvoice.GetAcctCurrencyId(AcctId:Real):Real;
var
  AGlValue:String;
  ASegment:String;
begin
  try
   ASegment := SelectValueAsString('select FX_SEGMENT_NAME from iqsys');
   AGlValue := SelectValueFmtAsString('select %s from v_glacct where id = %f', [ASegment, AcctId]);
   Result   := SelectValueFmtAsFloat('select id from currency where glvalue = ''%s''', [AGlValue]);
  except
    Result := -1;
  end;
end;

function TFrmInvoice.ProcessFXQry(AQry:TFDQuery; nGLBatchId_Id:Real):Boolean;
var
  AStr:String;
  ACurrencyId:Real;
  AFxAccountId:Real;
  Amount:Real;
  Amount2:Real;
begin
  Result := False;

  with AQry do
  try
    Open;
    while not eof do
    begin
      Amount  := AQry.FieldByName('amount').asFloat;
      Amount2 := AQry.FieldByName('amount2').asFloat;

      ACurrencyId := GetAcctCurrencyId(FieldByName('glacct_id_sales').asFloat);
      if ACurrencyId <> FPostQry.FieldByName('CURRENCY_ID').asFloat then
      begin
        AFxAccountId := FPostQry.FieldByName('GLACCT_ID_FX').asFloat;
        Amount2 := Amount2 - Amount;
        Amount := 0;
//        AFxAccountId := 0
      end
      else
        AFxAccountId := SelectValueFmtAsFloat('select fx_acct_id from glacct where id = %f', [FieldByName('glacct_id_sales').asFloat]);

      if AFxAccountId <> 0 then
      begin
        Result := True;

        AStr := Format('insert into glbatch ' +
                      '(glbatchid_id, ' +
                      'header_id, ' +
                      'glacct_id, ' +
                      'debit, ' +
                      'credit, ' +
                      'descrip, ' +
                      'ref_code_id, ' +
                      'reference, ' +
                      'ref_code_descrip, ' +
                      'ref_code_category, ' +
                      'ref_code) ' +
                      'values( ' +
                      '%f, ' +
                      '%f, ' +
                      '%f, ' +
                      'decode(sign(%f), -1, Abs(%f), 0 ), ' +
                      'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                      '''%s'', ' +
                      'decode(%f, 0, null, %f),' +
                      '''%s'', ' +
                      '''%s'', ' +
                      '''%s'', ' +
                      '''%s'')',
                      [nGlBatchId_Id,
                       fArInvoiceId,
                       FieldByName('glacct_id_sales').asFloat,
                       amount2,
                       amount2,
                       amount2,
                       amount2,
                       StrTran(AQry.FieldByName('descrip').asString, '''', ''''''),
                       AQry.FieldByName('ref_code_id').asFloat,
                       AQry.FieldByName('ref_code_id').asFloat,
                       AQry.FieldByName('reference').asString,
                       AQry.FieldByName('ref_code_descrip').asString,
                       AQry.FieldByName('ref_code_category').asString,
                       AQry.FieldByName('ref_code').asString]);


        ExecuteCommand(AStr);



        AStr := Format('insert into glbatch ' +
                      '(glbatchid_id, ' +
                      'header_id, ' +
                      'glacct_id, ' +
                      'credit, ' +
                      'debit, ' +
                      'descrip, ' +
                      'ref_code_id, ' +
                      'reference, ' +
                      'ref_code_descrip, ' +
                      'ref_code_category, ' +
                      'ref_code) ' +
                      'values( ' +
                      '%f, ' +
                      '%f, ' +
                      '%f, ' +
                      'decode(sign(%f), -1, Abs(%f), 0 ), ' +
                      'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                      '''%s'', ' +
                      'decode(%f, 0, null, %f),' +
                      '''%s'', ' +
                      '''%s'', ' +
                      '''%s'', ' +
                      '''%s'')',
                      [nGlBatchId_Id,
                       fArInvoiceId,
                       AFxAccountId,
                       amount,
                       amount,
                       amount,
                       amount,
                       StrTran(AQry.FieldByName('descrip').asString, '''', ''''''),
                       AQry.FieldByName('ref_code_id').asFloat,
                       AQry.FieldByName('ref_code_id').asFloat,
                       AQry.FieldByName('reference').asString,
                       AQry.FieldByName('ref_code_descrip').asString,
                       AQry.FieldByName('ref_code_category').asString,
                       AQry.FieldByName('ref_code').asString]);
        if Amount <> 0 then
          ExecuteCommand(AStr);
      end;
      next;
    end;
  except
    on E:Exception do
      raise Exception.CreateFmt('Error Posting to GLBATCH while executing ''ProcessFXQry'' procedure %s Str %s',
                         [ E.Message, AStr ]);
  end;
end;

function TFrmInvoice.CheckFXAccounts(AQry:TFDQuery):Boolean;
var
  ACurrencyId:Real;
  AFxAccountId:Real;
begin
  with AQry do
  begin
    open;
    if eof and bof then
    begin
      Result := True;
      Exit;
    end;

    while not eof do
    begin
      ACurrencyId := GetAcctCurrencyId(FieldByName('glacct_id_sales').asFloat);
      if ACurrencyId <> FPostQry.FieldByName('CURRENCY_ID').asFloat then
        AFxAccountId := 0
      else
      begin
        AFxAccountId := SelectValueFmtAsFloat('select fx_acct_id from glacct where id = %f', [FieldByName('glacct_id_sales').asFloat]);
        Result := True;
      end;
      if AFxAccountId = 0 then
      begin
        Result := False;
        Exit;
      end;
      next;
    end;
  end;
end;


function TFrmInvoice.InsertItemsFX1(nGLBatchId_Id:Real):Boolean;
var
  AQry:TFDQuery;
begin
//  Result := True;
//
//  if not FMultiCurrency then
//  begin
//    Result := false;
//    Exit;
//  end;
//
//{
//  Result := false;
//  AQry := TFDQuery.Create(self);
//  with AQry do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select d.glacct_id_sales ' +
//                'from arprepost_detail d ' +
//                'where d.arprepost_id = %f ' +
//                ' and not exists (select 1 from arprepost_detail_sales where arprepost_detail_id = d.id) ',
//                [FPostQry.FieldByName('ID').asFloat]));
//
//    Result := CheckFXAccounts(AQry);
//    if not Result then Exit;
//  finally
//    free;
//  end;
//
//  AQry := TFDQuery.Create(self);
//  with AQry do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select sd.glacct_id as glacct_id_sales ' +
//                'from ' +
//                'arprepost_detail d, ' +
//                'arprepost_detail_sales sd ' +
//                'where d.arprepost_id = %f ' +
//                ' and sd.arprepost_detail_id = d.id ',
//                [FPostQry.FieldByName('ID').asFloat]));
//    Result := CheckFXAccounts(AQry);
//    if not Result then Exit;
//  finally
//    free;
//  end;
//
//}
//
//
//  AQry := TFDQuery.Create(self);
//  with AQry do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select ' +
//                'd.glacct_id_sales, ' +
//                ' d.invoice_qty * d.unit_price - d.invoice_qty * d.unit_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar) as amount, ' +
//                ' d.invoice_qty * d.unit_price as amount2, ' +
////                ' d.invoice_qty * d.unit_price - d.invoice_qty * d.unit_price * REF_GL.IQ_GetFXRate(%f, d.glacct_id_sales, %.6f) as amount, ' +
//                '''INV# %s CUST# %s ['' || SubStr(''%s'', 1, 15) || ''] FX'' as descrip, ' +
//                'd.ref_code_id, ' +
//                'd.reference, ' +
//                'r.descrip as ref_code_descrip, ' +
//                'c.descrip as ref_code_category, ' +
//                'r.ref_code ' +
//                'from ' +
//                ' arprepost a, ' +
//                'arprepost_detail d, ' +
//                'ref_code r, ' +
//                'rc_category c ' +
//                'where d.arprepost_id = %f ' +
//                'and d.arprepost_id = a.id ' +
//                'and d.ref_code_id = r.id(+) ' +
//                ' and not exists (select 1 from arprepost_detail_sales where arprepost_detail_id = d.id) ' +
//                'and r.rc_category_id = c.id(+)',
//                [FPostQry.FieldByName('INVOICE_NO').asString,
//                 StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
//                 StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
//                 FPostQry.FieldByName('ID').asFloat]));
//    Result := ProcessFXQry(AQry, nGLBatchId_Id);
//  finally
//    free;
//  end;


end;

function TFrmInvoice.InsertItemsFX2(nGLBatchId_Id:Real):Boolean;
var
  AQry:TFDQuery;
begin
//  Result := True;
//
//  if not FMultiCurrency then
//  begin
//    Result := false;
//    Exit;
//  end;
//
//  AQry := TFDQuery.Create(self);
//  with AQry do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select ' +
//                ' sd.glacct_id as glacct_id_sales, ' +
//                ' (d.invoice_qty * d.unit_price - d.invoice_qty * d.unit_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar)) * sd.percentage/100 as amount, ' +
//                ' d.invoice_qty * d.unit_price * sd.percentage/100 as amount2, ' +
//                '''INV# %s CUST# %s ['' || SubStr(''%s'', 1, 15) || ''] FX'' as descrip, ' +
//                'd.ref_code_id, ' +
//                'd.reference, ' +
//                'r.descrip as ref_code_descrip, ' +
//                'c.descrip as ref_code_category, ' +
//                'r.ref_code ' +
//                'from ' +
//                'arprepost a, ' +
//                'arprepost_detail d, ' +
//                'ref_code r, ' +
//                'arprepost_detail_sales sd, ' +
//                'rc_category c ' +
//                'where d.arprepost_id = %f ' +
//                'and d.ref_code_id = r.id(+) ' +
//                'and d.arprepost_id = a.id ' +
//                ' and sd.arprepost_detail_id = d.id ' +
//                'and r.rc_category_id = c.id(+)',
//                [FPostQry.FieldByName('INVOICE_NO').asString,
//                 StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
//                 StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
//                 FPostQry.FieldByName('ID').asFloat]));
//    Result := ProcessFXQry(AQry, nGLBatchId_Id);
//  finally
//    free;
//  end;
end;



procedure TFrmInvoice.InsertItems(nGLBatchId_Id:Real);
var
  AStr:String;
begin

  try
    if  not InsertItemsFX1(nGLBatchId_Id) then
    begin
    AStr := Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip, ' +
                  'ref_code_id, ' +
                  'reference, ' +
                  'ref_code_descrip, ' +
                  'ref_code_category, ' +
                  'ref_code) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'd.glacct_id_sales, ' +
                  'decode(sign( d.invoice_qty * d.unit_price ) , -1, ' +
                  'Abs(d.invoice_qty * d.unit_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar) ), 0 ), ' +
                  'decode(sign( d.invoice_qty * d.unit_price), -1, ' +
                  '0, Abs(d.invoice_qty * d.unit_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar) ) ), ' +
                  '''INV# %s CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'', ' +
                  'd.ref_code_id, ' +
                  'd.reference, ' +
                  'r.descrip, ' +
                  'c.descrip, ' +
                  'r.ref_code ' +
                  'from ' +
                  'arprepost_detail d, ' +
                  'arprepost a, ' +
                  'ref_code r, ' +
                  'rc_category c ' +
                  'where d.arprepost_id = %f ' +
                  'and d.arprepost_id = a.id ' +
                  'and d.ref_code_id = r.id(+) ' +
                  ' and not exists (select 1 from arprepost_detail_sales where arprepost_detail_id = d.id) ' +
                  'and r.rc_category_id = c.id(+)',
                  [nGlBatchId_Id,
                   fArInvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);
    ExecuteCommand(AStr);
    end;

    if  not InsertItemsFX2(nGLBatchId_Id) then
    begin
    AStr := Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip, ' +
                  'ref_code_id, ' +
                  'reference, ' +
                  'ref_code_descrip, ' +
                  'ref_code_category, ' +
                  'ref_code) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'sd.glacct_id, ' +
                  'decode(sign( d.invoice_qty * d.unit_price ) , -1, ' +
                  'Abs(d.invoice_qty * d.unit_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar) * sd.percentage/100), 0 ), ' +
                  'decode(sign( d.invoice_qty * d.unit_price), -1, ' +
                  '0, Abs(d.invoice_qty * d.unit_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar) * sd.percentage/100) ), ' +
                  '''INV# %s CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'', ' +
                  'd.ref_code_id, ' +
                  'd.reference, ' +
                  'r.descrip, ' +
                  'c.descrip, ' +
                  'r.ref_code ' +
                  'from ' +
                  'arprepost a, ' +
                  'arprepost_detail d, ' +
                  'arprepost_detail_sales sd, ' +
                  'ref_code r, ' +
                  'rc_category c ' +
                  'where d.arprepost_id = %f ' +
                  'and d.arprepost_id = a.id ' +
                  'and d.ref_code_id = r.id(+) ' +
                  ' and sd.arprepost_detail_id = d.id ' +
                  'and r.rc_category_id = c.id(+)',
                  [nGlBatchId_Id,
                   fArInvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);
    ExecuteCommand(AStr);
    end;
  except
    on E:Exception do
      raise Exception.CreateFmt('Error Posting to GLBATCH while executing ''InsertItems'' procedure %s Str %s',
                         [E.Message, AStr]);
  end;
end;


function TFrmInvoice.InsertFreightFX(nGLBatchId_Id:Real):Boolean;
var
  AStr:String;
  AQry:TFDQuery;
begin
//  Result := False;
//
//  if not FMultiCurrency then
//  begin
//    Result := false;
//    Exit;
//  end;
//
//{
//  AQry := TFDQuery.Create(self);
//  with AQry do
//  try
//    Connection := db_dm.FDConnection;
//      Sql.Add(Format('select ' +
//                  'plugins.get_glacct_id_with_ep_gl(f.glacct_id_freight, ''acct_id_sales'', d.eplant_id ) as glacct_id_sales ' +
//                  'from ' +
//                  'arprepost_detail d, ' +
//                  'freight f ' +
//                  'where NVL(d.freight_price, 0) <> 0 ' +
//                  'and f.id = d.freight_id ' +
//                  'and d.arprepost_id = %f ',
//                  [FPostQry.FieldByName('ID').asFloat]));
//    Result := CheckFXAccounts(AQry);
//    if not Result then Exit;
//  finally
//    free;
//  end;
//
//}
//
//  try
//    AQry := TFDQuery.Create(self);
//    with AQry do
//    try
//      Connection := db_dm.FDConnection;
//      Sql.Add(Format('select ' +
//                  'plugins.get_glacct_id_with_ep_gl(f.glacct_id_freight, ''acct_id_sales'', d.eplant_id ) as glacct_id_sales, ' +
//                  ' d.freight_price - d.freight_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar) as amount, ' +
//                  ' d.freight_price as amount2, ' +
//                  '''INV# %s FREIGHT CUST# %s ['' || SubStr(''%s'', 1, 15) || ''] FX'' as descrip, ' +
//                  'd.ref_code_id, ' +
//                  'd.reference, ' +
//                  'r.descrip as ref_code_descrip, ' +
//                  'c.descrip as ref_code_category, ' +
//                  'r.ref_code ' +
//                  'from ' +
//                  'arprepost_detail d, ' +
//                  'arprepost a, ' +
//                  'ref_code r, ' +
//                  'rc_category c, ' +
//                  'freight f ' +
//                  'where NVL(d.freight_price, 0) <> 0 ' +
//                  'and f.id = d.freight_id ' +
//                  'and d.arprepost_id = %f ' +
//                  'and d.arprepost_id = a.id ' +
//                  'and d.ref_code_id = r.id(+) ' +
//                  'and r.rc_category_id = c.id(+)',
//                  [FPostQry.FieldByName('INVOICE_NO').asString,
//                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
//                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
//                   FPostQry.FieldByName('ID').asFloat]));
//      AStr := AQry.Sql.Text;
//      Result := ProcessFXQry(AQry, nGLBatchId_Id);
//    finally
//      free;
//    end;
//
//  except
//    on E:Exception do
//      ShowIqErrorMessage('Error Posting to GLBATCH while executing ''InsertFreightFX'' procedure',
//                         E.Message, AStr);
//  end;
end;


procedure TFrmInvoice.InsertFreight(nGLBatchId_Id:Real);
var
  AStr:String;
  AQry:TFDQuery;
begin
  if InsertFreightFX(nGLBatchId_Id) then
    Exit;

  try
    AStr := Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip, ' +
                  'ref_code_id, ' +
                  'reference, ' +
                  'ref_code_descrip, ' +
                  'ref_code_category, ' +
                  'ref_code) ' +
                  'select ' +
                  '%f, ' +
                  '%f, ' +
                  'plugins.get_glacct_id_with_ep_gl(f.glacct_id_freight, ''acct_id_sales'', d.eplant_id ), ' +
                  'decode(sign( d.freight_price ), -1, ' +
                  'Abs(d.freight_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar)), 0 ), ' +
                  'decode(sign( d.freight_price ), -1, ' +
                  '0, Abs(d.freight_price * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar)) ), ' +
                  '''INV# %s FREIGHT CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'', ' +
                  'd.ref_code_id, ' +
                  'd.reference, ' +
                  'r.descrip, ' +
                  'c.descrip, ' +
                  'r.ref_code ' +
                  'from ' +
                  'arprepost_detail d, ' +
                  'arprepost a, ' +
                  'ref_code r, ' +
                  'rc_category c, ' +
                  'freight f ' +
                  'where NVL(d.freight_price, 0) <> 0 ' +
                  'and f.id = d.freight_id ' +
                  'and d.arprepost_id = %f ' +
                  'and d.arprepost_id = a.id ' +
                  'and d.ref_code_id = r.id(+) ' +
                  'and r.rc_category_id = c.id(+)',
                  [nGlBatchId_Id,
                   fArInvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);
    ExecuteCommand(AStr);
  except
    on E:Exception do
      raise Exception.CreateFmt('Error Posting to GLBATCH while executing ''InsertFreight'' procedure %s Str %s',
                         [ E.Message, AStr ]);
  end;
end;

procedure TFrmInvoice.InsertARCommissions(nGLBatchId_Id:Real);
var
  AQry:TFDQuery;
  ADebitAcctId, ACreditAcctId:Real;
  AEplantId:Real;
  AVendorId:Real;
  AExchangeRate:Real;
  ACommissions:Real;
  ASalesCode:String;
  AStr:String;
begin
//  if SelectValueAsString('select NVL(use_accrued_comm, ''N'') from iqsys where rownum < 2') = 'N' then exit;
//  AQry := TFDQuery.Create(self);
//  with AQry do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select c.salespeople_id, ' +
//                   'Sum(d.invoice_qty * d.unit_price * NVL(c.commission_percent, 0)/100) as commissions ' +
//                   'from ARPREPOST_COMM c, arprepost_detail d ' +
//                   'where c.arprepost_detail_id = d.id and d.arprepost_id = %f group by c.salespeople_id',
//                   [FPostQry.FieldByName('ID').asFloat]));
//    Open;
//    if eof and bof then exit;
//    while not eof do
//    begin
//      ADebitAcctId := SelectValueFmtAsFloat('select NVL(glacct_id_exp, 0) from salespeople where id = %f', [FieldByName('salespeople_id').asFloat]);
//      if ADebitAcctId = 0 then
//      begin
//        AVendorId    := SelectValueFmtAsFloat('select vendor_id from salespeople where id = %f', [FieldByName('salespeople_id').asFloat]);
//        ADebitAcctId := SelectValueFmtAsFloat('select NVL(glacct_id_exp, 0) from vendor where id = %f', [AVendorId]);
//      end;
//      ASalesCode   := SelectValueFmtAsString('select sales_code from salespeople where id = %f', [FieldByName('salespeople_id').asFloat]);
//      if ADebitAcctId = 0 then ADebitAcctId := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_cogs'') from dual');
//
//      ACreditAcctId := SelectValueFmtAsFloat('select acct_id_accrue_comm from salespeople where id = %f', [FieldByName('salespeople_id').asFloat]);
//      if ACreditAcctId = 0 then
//        ACreditAcctId := SelectValueAsFloat('select acct_id_accrue_comm from iqsys where rownum < 2');
//
//
//      if True then
//      begin
//        if SecurityManager.EPlant_ID <> 'NULL' then
//        begin
//          AEplantId := '1';
//          ADebitAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(%f, %f) from dual',  [ADebitAcctId, AEplantId]);
//          ACreditAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(%f, %f) from dual', [ACreditAcctId, AEplantId]);
//        end;
//      end;
//
//      AExchangeRate := SelectValueFmtAsFloat('select REF_GL.IQ_GetFXRate(%f, %f, %.6f) from dual',
//                                 [FPostQry.FieldByName('CURRENCY_ID').asFloat, ACreditAcctId, FxRate]);
//
//
//      ACommissions := FieldByName('commissions').asFloat * AExchangeRate;
//
//
//      try
//        AStr := Format('insert into glbatch ' +
//                      '(glbatchid_id, ' +
//                      'header_id, ' +
//                      'glacct_id, ' +
//                      'debit, ' +
//                      'credit, ' +
//                      'descrip) ' +
//                      'values( ' +
//                      '%f, ' +
//                      '%f, ' +
//                      '%f, ' +
//                      'decode(sign( %f ), 1, Abs(%f), 0 ), ' +
//                      'decode(sign( %f ), 1, 0, Abs(%f) ), ' +
//                      '''INV# %s ACCR COMM SALES CODE: %s '')',
//                      [nGlBatchId_Id,
//                       fArInvoiceId,
//                       ADebitAcctId,
//                       ACommissions,
//                       ACommissions,
//                       ACommissions,
//                       ACommissions,
//                       FPostQry.FieldByName('INVOICE_NO').asString,
//                       ASalesCode]);
//        ExecuteCommand(AStr);
//
//        AStr := Format('insert into glbatch ' +
//                      '(glbatchid_id, ' +
//                      'header_id, ' +
//                      'glacct_id, ' +
//                      'debit, ' +
//                      'credit, ' +
//                      'descrip) ' +
//                      'values( ' +
//                      '%f, ' +
//                      '%f, ' +
//                      '%f, ' +
//                      'decode(sign( %f ), 1, 0, Abs(%f) ), ' +
//                      'decode(sign( %f ), 1, Abs(%f), 0 ), ' +
//                      '''INV# %s OFFSET ACCR COMM SALES CODE: %s '')',
//                      [nGlBatchId_Id,
//                       fArInvoiceId,
//                       ACreditAcctId,
//                       ACommissions,
//                       ACommissions,
//                       ACommissions,
//                       ACommissions,
//                       FPostQry.FieldByName('INVOICE_NO').asString,
//                       ASalesCode]);
//        ExecuteCommand(AStr);
//
//      except
//        on E:Exception do
//          ShowIqErrorMessage('Error Posting to GLBATCH while executing ''InsertARCommissions'' procedure',
//                             E.Message, AStr);
//      end;
//      Next;
//    end;
//  finally
//    Free;
//  end;
end;

function TFrmInvoice.InsertTaxesFX(nGLBatchId_Id:Real):Boolean;
var
  AStr:String;
  AQry:TFDQuery;
begin
//  Result := False;
//
//  if not FMultiCurrency then
//  begin
//    Result := false;
//    Exit;
//  end;
//
//{
//  AQry := TFDQuery.Create(self);
//  with AQry do
//  try
//    Connection := db_dm.FDConnection;
//      Sql.Add(Format('select ' +
//              'plugins.get_glacct_id_with_ep_gl(e.glacct_id, ''acct_id_salestax'', d.eplant_id ) as glacct_id_sales ' +
//              'from ' +
//              'arprepost_detail d, ' +
//              'tax_code_link t, ' +
//              'tax_elements e ' +
//              'where NVL(d.tax_code_id, 0) <> 0 ' +
//              'and t.tax_codes_id = d.tax_code_id ' +
//              'and t.tax_elements_id = e.id ' +
//              'and d.arprepost_id = %f ',
//              [FPostQry.FieldByName('ID').asFloat]));
//    Result := CheckFXAccounts(AQry);
//    if not Result then Exit;
//  finally
//    free;
//  end;
//
//}
//
//  try
//
//    AQry := TFDQuery.Create(self);
//    with AQry do
//    try
//      Connection := db_dm.FDConnection;
//      Sql.Add(Format('select ' +
//              'plugins.get_glacct_id_with_ep_gl(e.glacct_id, ''acct_id_salestax'', d.eplant_id ) as glacct_id_sales, ' +
//              'd.invoice_qty * d.unit_price * NVL(e.tax_rate, 0)/100 - Round(d.invoice_qty * d.unit_price, 2) * NVL(e.tax_rate, 0)/100 * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar) as amount, ' +
//              'Round(d.invoice_qty * d.unit_price * NVL(e.tax_rate, 0)/100 , 2) as amount2, ' +
//              '''INV# %s SALES TAX CUST# %s ['' || SubStr(''%s'', 1, 15) || ''] FX'' as descrip, ' +
//              'd.ref_code_id as ref_code_id, ' +
//              'd.reference as reference, ' +
//              'r.descrip as ref_code_descrip, ' +
//              'c.descrip as ref_code_category, ' +
//              'r.ref_code as ref_code ' +
//              'from ' +
//              ' arprepost a, ' +
//              'arprepost_detail d, ' +
//              'ref_code r, ' +
//              'rc_category c, ' +
//              'tax_code_link t, ' +
//              'tax_elements e ' +
//              'where NVL(d.tax_code_id, 0) <> 0 ' +
//              'and d.arprepost_id = a.id ' +
//              'and t.tax_codes_id = d.tax_code_id ' +
//              'and t.tax_elements_id = e.id ' +
//              'and d.arprepost_id = %f ' +
//              'and d.ref_code_id = r.id(+) ' +
//              'and r.rc_category_id = c.id(+) ' +
//              'order by d.id, e.id',
//              [FPostQry.FieldByName('INVOICE_NO').asString,
//               StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
//               StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
//               FPostQry.FieldByName('ID').asFloat]));
//
//      AStr := AQry.Sql.Text;
//      Result := ProcessFXQry(AQry, nGLBatchId_Id);
//    finally
//      free;
//    end;
//
//    fMaxTaxId     := SelectValueAsFloat(Format('select max(id) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]));
//
//  except
//    on E:Exception do
//      ShowIqErrorMessage('Error Posting to GLBATCH while executing ''InsertTaxesFX'' procedure',
//                         E.Message, AStr);
//  end;



end;


procedure TFrmInvoice.InsertTaxes(nGLBatchId_Id:Real);
var
  AStr:String;
begin
  if InsertTaxesFX(nGLBatchId_Id) then
    Exit;


  try
    AStr := Format('begin ' +
              'for v in ( ' +
              'select ' +
              '%f as glbatchid_id, ' +
              '%f as header_id, ' +
              'plugins.get_glacct_id_with_ep_gl(e.glacct_id, ''acct_id_salestax'', d.eplant_id ) as glacct_id, ' +
              'decode(sign( d.invoice_qty * d.unit_price * NVL(e.tax_rate, 0)/100 ), -1, ' +
              'Abs(Round(d.invoice_qty * d.unit_price, 2) * NVL(e.tax_rate, 0)/100 * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar)), 0 ) as debit, ' +
              'decode(sign( d.invoice_qty * d.unit_price * NVL(e.tax_rate, 0)/100 ), -1, 0, ' +
              'Abs(Round(d.invoice_qty * d.unit_price, 2) * NVL(e.tax_rate, 0)/100 * MULTICURRENCY.IQ_GETFXRATE(a.currency_id, a.glperiods_id_ar))) as credit, ' +
              '''INV# %s SALES TAX CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'' as descrip, ' +
              'd.ref_code_id as ref_code_id, ' +
              'd.reference as reference, ' +
              'r.descrip as ref_code_descrip, ' +
              'c.descrip as ref_code_category, ' +
              'r.ref_code as ref_code ' +
              'from ' +
              ' arprepost a, ' +
              'arprepost_detail d, ' +
              'ref_code r, ' +
              'rc_category c, ' +
              'tax_code_link t, ' +
              'tax_elements e ' +
              'where NVL(d.tax_code_id, 0) <> 0 ' +
              'and d.arprepost_id = a.id ' +
              'and t.tax_codes_id = d.tax_code_id ' +
              'and t.tax_elements_id = e.id ' +
              'and d.arprepost_id = %f ' +
              'and d.ref_code_id = r.id(+) ' +
              'and r.rc_category_id = c.id(+) ' +
              'order by d.id, e.id )' +
              'loop ' +
              'insert into glbatch ' +
                            '(glbatchid_id, ' +
                            'header_id, ' +
                            'glacct_id, ' +
                            'debit, ' +
                            'credit, ' +
                            'descrip, ' +
                            'ref_code_id, ' +
                            'reference, ' +
                            'ref_code_descrip, ' +
                            'ref_code_category, ' +
                            'ref_code) ' +
                      'values ' +
                            '(v.glbatchid_id, ' +
                            'v.header_id, ' +
                            'v.glacct_id, ' +
                            'v.debit, ' +
                            'v.credit, ' +
                            'v.descrip, ' +
                            'v.ref_code_id, ' +
                            'v.reference, ' +
                            'v.ref_code_descrip, ' +
                            'v.ref_code_category, ' +
                            'v.ref_code); ' +
                  'end loop; ' +
                  'end;',
                  [nGlBatchId_Id,
                   fArInvoiceId,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', ''''''),
                   FPostQry.FieldByName('ID').asFloat]);

    ExecuteCommand(AStr);

//    ExecuteCommand(Format('insert into glbatch ' +
//                  '(glbatchid_id, ' +
//                  'header_id, ' +
//                  'glacct_id, ' +
//                  'debit, ' +
//                  'credit, ' +
//                  'descrip, ' +
//                  'ref_code_id, ' +
//                  'reference, ' +
//                  'ref_code_descrip, ' +
//                  'ref_code_category, ' +
//                  'ref_code) ' +
//                  'select ' +
//                  '%f, ' +
//                  '%f, ' +
//                  'NVL(e.glacct_id, 0), ' +
//                  'decode(sign( d.invoice_qty * d.unit_price * NVL(e.tax_rate, 0)/100 ), -1, ' +
//                  'Abs(Round(d.invoice_qty * d.unit_price, 2) * NVL(e.tax_rate, 0)/100 * REF_GL.IQ_GetFXRate(%f, e.glacct_id, %.6f)), 0 ), ' +
//                  'decode(sign( d.invoice_qty * d.unit_price * NVL(e.tax_rate, 0)/100 ), -1, 0, ' +
//                  'Abs(Round(d.invoice_qty * d.unit_price, 2) * NVL(e.tax_rate, 0)/100 * REF_GL.IQ_GetFXRate(%f, e.glacct_id, %.6f))), ' +
//                  '''INVOICE_NO %s SALES TAX'', ' +
//                  'd.ref_code_id, ' +
//                  'd.reference, ' +
//                  'r.descrip, ' +
//                  'c.descrip, ' +
//                  'r.ref_code ' +
//                  'from ' +
//                  'arprepost_detail d, ' +
//                  'ref_code r, ' +
//                  'rc_category c, ' +
//                  'tax_code_link t, ' +
//                  'tax_elements e ' +
//                  'where NVL(d.tax_code_id, 0) <> 0 ' +
//                  'and t.tax_codes_id = d.tax_code_id ' +
//                  'and t.tax_elements_id = e.id ' +
//                  'and d.arprepost_id = %f ' +
//                  'and d.ref_code_id = r.id(+) ' +
//                  'and r.rc_category_id = c.id(+) ' +
//                  'order by d.id, e.id',
//                  [nGlBatchId_Id,
//                   fArInvoiceId,
//                   FPostQry.FieldByName('CURRENCY_ID').asFloat,
//                   FxRate,
//                   FPostQry.FieldByName('CURRENCY_ID').asFloat,
//                   FxRate,
//                   FPostQry.FieldByName('INVOICE_NO').asString,
//                   FPostQry.FieldByName('ID').asFloat]));

    fMaxTaxId     := SelectValueAsFloat(Format('select max(id) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]));

  except
    on E:Exception do
     {in IqErrDlg.pas}
      raise Exception.CreateFmt('Error Posting to GLBATCH while executing ''InsertTaxes'' procedure %s S %s',
                        [ E.Message, AStr ]);
  end;
end;

procedure TFrmInvoice.InsertBatchTotal(nGLBatchId_Id, nSum:Real);
var
  AStr:String;
begin
  try
    AStr := Format('insert into glbatch ' +
                  '(glbatchid_id, ' +
                  'header_id, ' +
                  'glacct_id, ' +
                  'debit, ' +
                  'credit, ' +
                  'descrip) ' +
                  'values ' +
                  '(%f, ' +
                  '%f, ' +
                  '%f, ' +
                  'decode(sign(%f), -1, 0, Abs(%f)), ' +
                  'decode(sign(%f), -1, Abs(%f), 0), ' +
                  '''INV# %s AR CUST# %s ['' || SubStr(''%s'', 1, 15) || '']'')',
//                  '''INVOICE_NO %s AR'')',
                  [nGlBatchId_Id,
                   fArInvoiceId,
                   FPostQry.FieldByName('GLACCT_ID_AR').asFloat,
                   nSum,
                   nSum,
                   nSum,
                   nSum,
                   FPostQry.FieldByName('INVOICE_NO').asString,
                   StrTran(FPostQry.FieldByName('CUSTNO').asString, '''', ''''''),
                   StrTran(Copy(FPostQry.FieldByName('COMPANY').asString, 1, 15), '''', '''''')]);
    ExecuteCommand(AStr);
  except
    on E:Exception do
       {in IqErrDlg.pas}
      raise Exception.CreateFmt('Error Posting to GLBATCH while executing ''InsertBatchTotal'' procedure %s Str %s',
                         [E.Message, AStr]);
  end;

end;

procedure TFrmInvoice.InsertArInvoice(nGlBatchId_Id:Real);
var
  AStr:String;
begin
  AStr := 'Executing QryInsArInvoice';
  try
    with QryInsArInvoice do
    begin
      Close;
      ParamByName('nArPrePost_Id').Value := FPostQry.FieldByName('ID').asFloat;
      ParamByName('nGlBatchId_Id').Value := nGlBatchId_Id;
      ParamByName('nId').Value := fArInvoiceId;
      ParamByName('nFxRate').Value := FXRate;
//      Prepare;
      ExecSql;
    end;
    AStr := Format('update rma_credits ' +
              'set arinvoice_id = %f, ' +
              'arprepost_id = null ' +
              'where arprepost_id = %f', [fArInvoiceId,
                                          FPostQry.FieldByName('ID').asFloat]);
    ExecuteCommand(AStr);
  except
    on E:Exception do
      raise Exception.CreateFmt('Error Posting to ARINVOICE while executing ''InsertArInvoice'' procedure %s Str %s',
                         [ E.Message, AStr ]);
  end;

end;

procedure TFrmInvoice.InsertArInvoiceDetail;
var
  nId:Real;
  AID:Real;
  AStr:String;
//  ACommissionPosted:Boolean;
begin
////  ACommissionPosted := False;
//  try
//    with TFDQuery.Create(self) do
//    try
//      AStr := 'Executing QryInsArInvoice_Detail';
//      Connection := db_dm.FDConnection;
//      Sql.Add(Format('select id, po_detail_id, po_receipts_id, invoice_qty from arprepost_detail where arprepost_id = %f', [FPostQry.FieldByName('ID').asFloat]));
//      Open;
//      while not eof do
//      begin
//        AId := GetNextID('ARINVOICE_DETAIL');
//
//        QryInsArInvoice_Detail.Close;
//        QryInsArInvoice_Detail.ParamByName('nArPrepostDtl_Id').Value := FieldByName('ID').asFloat;
//        QryInsArInvoice_Detail.ParamByName('nArInvoiceDtl_Id').Value := AID;
//        QryInsArInvoice_Detail.ParamByName('nArInvoice_Id').Value := fArInvoiceId;
////        QryInsArInvoice_Detail.Prepare;
//        QryInsArInvoice_Detail.ExecSql;
//
//
//        ExecuteCommandFmt('insert into arinvoice_detail_sales (arinvoice_detail_id, glacct_id, percentage, acct) ' +
//                  'select %f, a.glacct_id, a.percentage, g.acct from arprepost_detail_sales a, glacct g ' +
//                  'where a.arprepost_detail_id = %f and a.glacct_id = g.id',
//                  [AID, FieldByName('ID').asFloat]);
//
//        if FieldByName('PO_DETAIL_ID').asFloat <> 0 then
//        begin
//          ExecuteCommandFmt('insert into arinvoice_credited (arinvoice_detail_id, po_detail_id, invoice_qty) ' +
//                    'values (%f, %f, %f)', [AId,
//                                            FieldByName('PO_DETAIL_ID').asFloat,
//                                            FieldByName('INVOICE_QTY').asFloat]);
//        end;
//
////        if SelectValueAsString('select NVL(sp_one_line_per_inv, ''N'') from iqsys where rownum < 2') = 'Y' then
////        begin
////          if not ACommissionPosted then
////            InsertCommissions(AID, FieldByName('ID').asFloat);
////          ACommissionPosted := True;
////        end
////        else
////          InsertCommissions(AID, FieldByName('ID').asFloat);
//
//        InsertCommissions(AID, FieldByName('ID').asFloat);
//
//        Next;
//      end;
//    finally
//      Free;
//    end;
//
//    with TFDQuery.Create(self) do
//    try
//      Connection := db_dm.FDConnection;
//      Sql.Add(Format('select arinvt_id, id, tax_code_id, ord_detail_id, shipment_dtl_id ' +
//                     'from arinvoice_detail where arinvoice_id = %f', [fArInvoiceId]));
//      Open;
//      while not eof do
//      begin
//        AStr :=Format('insert into ARINVOICE_DETAIL_TAXES (arinvoice_detail_id, ' +
//                                                       'tax_elements_descrip, ' +
//                                                       'tax_elements_tax_rate, ' +
//                                                       'tax_elements_glacct_id) ' +
//                                   'select %f, ' +
//                                          'e.descrip, ' +
//                                          'e.tax_rate, ' +
//                                          'e.glacct_id ' +
//                                    'from tax_elements e, tax_code_link l ' +
//                                    'where e.id = l.tax_elements_id ' +
//                                    'and l.tax_codes_id = %f',
//                                    [FieldByName('ID').AsFloat,
//                                     FieldByName('TAX_CODE_ID').AsFloat]);
//        ExecuteCommand(AStr);
//        InsertArinvtInfo(FieldByName('ARINVT_ID').asFloat,
//                         FieldByName('ID').asFloat,
//                         FieldByName('ORD_DETAIL_ID').asFloat,
//                         FieldByName('SHIPMENT_DTL_ID').asFloat);
//        Next;
//      end;
//    finally
//      Free;
//    end;
//  except
//    on E:Exception do
//      ShowIqErrorMessage('Error Posting to ARINVOICE_DETAIL while executing ''InsertArInvoiceDetail'' procedure',
//                         E.Message, AStr);
//  end;
end;

procedure TFrmInvoice.InsertCommissions(nId, nPrepostId:Real);
begin
//  if SelectValueAsString('select NVL(sp_one_line_per_inv, ''N'') from iqsys where rownum < 2') = 'Y' then
//  begin
//    with TFDQuery.Create(self) do
//    try
//      Connection := db_dm.FDConnection;
//      Sql.Add(Format('select sum(c.commission_percent) as commission_percent, ' +
//                              'c.salespeople_id ' +
//                            'from ARPREPOST_COMM c, ARPREPOST_DETAIL d ' +
//                            'where c.ARPREPOST_DETAIL_ID = d.id ' +
//                              ' and d.id = %f ' +
//                              ' group by c.salespeople_id', [nPrepostId]));
//      Open;
//      while not eof do
//      begin
//        ExecuteCommandFmt('insert into ARINVOICE_COMM ' +
//                              '(ARINVOICE_DETAIL_ID, ' +
//                              'salespeople_id, ' +
//                              'commission_percent, ' +
//                              'closed) ' +
//                           'values( %f, ' +
//                                  '%f, ' +
//                                  '%.6f, ' +
//                                  '''N'' )',
//                            [nId,
//                             FieldByName('salespeople_id').asFloat,
//                             FieldByName('commission_percent').asFloat]);
//        Next;
//      end;
//    finally
//      free;
//    end;
//  end
//  else
    ExecuteCommandFmt('insert into ARINVOICE_COMM ' +
                          '(ARINVOICE_DETAIL_ID, ' +
                          'salespeople_id, ' +
                          'commission_percent, ' +
                          'closed, amount) ' +
                       'select %f, ' +
                              'c.salespeople_id, ' +
                              'c.commission_percent, ' +
                              '''N'', amount ' +
                            'from ARPREPOST_COMM c, SALESPEOPLE s ' +
                            'where c.ARPREPOST_DETAIL_ID = %f ' +
                              'and c.salespeople_id = s.id', [nId, nPrepostId]);
end;

procedure TFrmInvoice.InsertArinvtInfo(ArinvtId, nId, nOrdDetailId, nShipmentDtlId:Real);
var
  nArinvtId, nArcustoId, nStd_Cost, AShipToId:Real;
begin
//  nArinvtId := SelectValueFmtAsFloat('select arinvt_id from ord_detail where id = %f', [nOrdDetailId]);
//  if nArinvtId = 0 then
//    nArinvtId := SelectValueFmtAsFloat('select arinvt_id from ord_detail where id = ' +
//                           ('(select order_dtl_id from shipment_dtl where id = %f)'), [nShipmentDtlId]);
//  if nArinvtId = 0 then
//     nArinvtId := ArinvtId;
//  if nArinvtId = 0 then
//  begin
//    if SelectValueFmtAsFloat('select id from hist_ord_detail where id = %f', [nOrdDetailId]) <> 0 then
//    begin
//      with TFDQuery.Create(self) do
//      try
//        Connection := db_dm.FDConnection;
//        Sql.Add(Format('select arinvt_id, arinvt_itemno, arinvt_class, arinvt_rev, arinvt_descrip, arinvt_descrip2, arinvt_std_cost ' +
//                       'from hist_ord_detail where id = %f', [nOrdDetailId]));
//        Open;
//        nArinvtId := FieldByName('Arinvt_Id').asFloat;
//        ExecuteCommandFmt('update arinvoice_detail set arinvt_itemno = ''%s'', ' +
//                                               'arinvt_class = ''%s'', ' +
//                                               'arinvt_rev = ''%s'', ' +
//                                               'arinvt_descrip = ''%s'', ' +
//                                               'arinvt_descrip2 = ''%s'', ' +
//                                               'std_cost = %.6f ' +
//                                               'where id = %f',
//                                               [StrTran(FieldByName('arinvt_itemno').asString, '''', ''''''),
//                                                StrTran(FieldByName('arinvt_class').asString, '''', ''''''),
//                                                StrTran(FieldByName('arinvt_rev').asString, '''', ''''''),
//                                                StrTran(StrTran(FieldByName('arinvt_descrip').asString, '''', ''''''), ':', ''),
//                                                StrTran(StrTran(FieldByName('arinvt_descrip2').asString, '''', ''''''), ':', ''),
//                                                FieldByName('arinvt_std_cost').asFloat,
//                                                nId]);
//      finally
//        Free;
//      end;
//    end
//  end
//  else
//  begin
//    with TFDQuery.Create(self) do
//    try
//      Connection := db_dm.FDConnection;
//      Sql.Add(Format('select itemno, class, rev, descrip, descrip2, std_cost from arinvt where id = %f', [nArinvtId]));
//      Open;
//      ExecuteCommandFmt('update arinvoice_detail set arinvt_itemno = ''%s'', ' +
//                                             'arinvt_class = ''%s'', ' +
//                                             'arinvt_rev = ''%s'', ' +
//                                             'arinvt_descrip = ''%s'', ' +
//                                             'arinvt_descrip2 = ''%s'', ' +
//                                             'std_cost = %.6f ' +
//                                             'where id = %f',
//                                             [StrTran(FieldByName('itemno').asString, '''', ''''''),
//                                              StrTran(FieldByName('class').asString, '''', ''''''),
//                                              StrTran(FieldByName('rev').asString, '''', ''''''),
//                                              StrTran(StrTran(FieldByName('descrip').asString, '''', ''''''), ':', ''),
//                                              StrTran(StrTran(FieldByName('descrip2').asString, '''', ''''''), ':', ''),
//                                              FieldByName('std_cost').asFloat,
//                                              nId]);
//    finally
//      Free;
//    end;
//  end;
//  if nArinvtId <> 0 then
//  begin
//    nArcustoId := SelectValueFmtAsFloat('select a.arcusto_id from arinvoice a, arinvoice_detail d ' +
//                            'where a.id = d.arinvoice_id and d.id = %f', [nId]);
//    with TFDQuery.Create(self) do
//    try
//      Connection := db_dm.FDConnection;
//      AShipToId := SelectValueFmtAsFloat('select ship_to_id from orders o, ord_detail d where d.orders_id = o.id and d.id = %f', [nOrdDetailId]);
//      if AShipToId = 0 then
//        AShipToId := SelectValueFmtAsFloat('select ship_to_id from hist_orders o, hist_ord_detail d where d.orders_id = o.id and d.id = %f', [nOrdDetailId]);
//
//
//      Sql.Add(Format('select cust_itemno, cust_descrip from aka where arcusto_id = %f and arinvt_id = %f ' +
//                       ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
//                     [nArcustoId, nArinvtId, nArcustoId, AShipToId]));
//      Open;
//      if not eof and bof then
//        ExecuteCommandFmt('update arinvoice_detail set cust_itemno = ''%s'', ' +
//                                               'cust_descrip = ''%s'' ' +
//                                               'where id = %f',
//                                               [StrTran(FieldByName('cust_itemno').asString, '''', ''''''),
//                                                StrTran(FieldByName('cust_descrip').asString, '''', ''''''),
//                                                nId]);
//    finally
//      Free;
//    end;
//  end;
end;

procedure TFrmInvoice.QryARPrepostDetailCalcFields(DataSet: TDataSet);
var
  ACount:Real;
  AComm:Real;
begin
//  IqTiming1.Start('CheckCommissions');
  with QryARPrepostDetail do
  begin
    ACount := SelectValueFmtAsFloat('select count(id) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f',
                        [FieldByName('ID').asFloat]);
//    AComm := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f',
//                        [FieldByName('ID').asFloat]);
//    FieldByName('CommPrcnt').asFloat := AComm;
//    FieldByName('TotalComm').asFloat := AComm * FieldByName('UNIT_PRICE').asFloat *
//                                                FieldByName('INVOICE_QTY').asFloat/100;

    AComm := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f',
                        [FieldByName('ID').asFloat]);
//    FieldByName('CommPrcnt').asFloat := AComm;
    QryARPrepostDetailTotalComm.asFloat := SelectValueFmtAsFloat('select sum(amount) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f',
                        [FieldByName('ID').asFloat]);

    if QryARPrepostDetailUNIT_PRICE.asFloat * QryARPrepostDetailINVOICE_QTY.asFloat <> 0 then
       QryARPrepostDetailCommPrcnt.asFloat := 100 * QryARPrepostDetailTotalComm.asFloat/( QryARPrepostDetailUNIT_PRICE.asFloat * QryARPrepostDetailINVOICE_QTY.asFloat )
    else
       QryARPrepostDetailCommPrcnt.asFloat := 0;

    if Abs(Acomm - QryARPrepostDetailCommPrcnt.asFloat) < 0.0001 then
      QryARPrepostDetailCommPrcnt.asFloat := Acomm;

 ///   QryARPrepostDetailCommPrcnt.asFloat := Round(QryARPrepostDetailCommPrcnt.asFloat, 3);

//    FieldByName('CommPrcnt').asFloat := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f',
//                        [FieldByName('ID').asFloat]);


    if ACount = 1 then
      FieldByName('SalesPerson').asString := SelectValueFmtAsString('select substrB( iqstring.Concat3W( First_Name, Middle_Name, Last_Name), 1, 255) from salespeople where id = ' +
                        '(select salespeople_id from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f)',
                        [FieldByName('ID').asFloat])
    else if ACount > 1 then
      FieldByName('SalesPerson').asString := 'SPLIT'
    else
      FieldByName('SalesPerson').asString := '';
  end;

  QryARPrepostDetailFOB.asString := SelectValueFmtAsString('select o.fob  from shipments o, shipment_dtl d ' +
                                                   ' where d.id = %f and d.shipments_id = o.id', [QryARPrepostDetailSHIPMENT_DTL_ID.asFloat]);

  if QryARPrepostDetailFOB.asString = '' then
    QryARPrepostDetailFOB.asString := SelectValueFmtAsString('select o.fob  from orders o, ord_detail d ' +
                                                 ' where d.id = %f and d.orders_id = o.id', [QryARPrepostDetailORD_DETAIL_ID.asFloat]);
  if QryARPrepostDetailFOB.asString = '' then
    QryARPrepostDetailFOB.asString := SelectValueFmtAsString('select o.fob  from hist_orders o, hist_ord_detail d ' +
                                                   ' where d.id = %f and d.orders_id = o.id', [QryARPrepostDetailORD_DETAIL_ID.asFloat]);

//  IqTiming1.Stop('CalcFields');
end;


procedure TFrmInvoice.CheckCommissions;
var
  ACount:Real;
  AComm:Real;
begin
//  IqTiming1.Start('CheckCommissions');
//  with TblARPrepostDetail do
  with QryARPrepostDetail do
  begin
    ACount := SelectValueFmtAsFloat('select count(id) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f',
                        [FieldByName('ID').asFloat]);
    AComm := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    FieldByName('CommPrcnt').asFloat := AComm;
//    FieldByName('TotalComm').asFloat := AComm * FieldByName('UNIT_PRICE').asFloat *
//                                                FieldByName('INVOICE_QTY').asFloat/100;
    FieldByName('TotalComm').asFloat := SelectValueFmtAsFloat('select sum(amount) from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    if ACount = 1 then
      FieldByName('SalesPerson').asString := SelectValueFmtAsString('select first_name from salespeople where id = ' +
                        '(select salespeople_id from ARPREPOST_COMM where ARPREPOST_DETAIL_ID = %f)',
                        [FieldByName('ID').asFloat])
    else if ACount > 1 then
      FieldByName('SalesPerson').asString := 'SPLIT'
    else
      FieldByName('SalesPerson').asString := '';
  end;
//  IqTiming1.Stop('CheckCommissions');
end;


procedure TFrmInvoice.QryShipCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
//    FieldByName('DESCRIPTION').asString := Trim(FieldByName('MISC_ITEM').asString) +
//                                           Trim(FieldByName('DESCRIP').asString);
    FieldByName('TAX').asFloat := GetTax(FieldByName('TAX_CODE_ID').asFloat);
  end;

end;

function TFrmInvoice.GetTax(Id:Real):Real;
begin
  Result := SelectValueAsFloat(Format('select tax_rate ' +
                          'from v_tax_codes ' +
                          'where id = %f', [Id]));
end;


procedure TFrmInvoice.SBAcctClick(Sender: TObject);
begin
  with QryArPrePost do
    if PkAcct.Execute then
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('GLACCT_ID_AR').asFloat := PkAcct.GetValue('ID');
      QryArPrePostARACCT.asString := PkAcct.GetValue('ACCT');

      FindRootAccount(QryArPrePost.FieldByName('GLACCT_ID_AR').asFloat, QryArPrePost.FieldByName('GLACCT_ID_FX'), QryArPrePost.FIeldByName('EPLANT_ID').asFloat);
      QryArPrePost.FieldByName('FXAcct').asString := SelectValueFmtAsString('select acct from glacct where id = %f',
            [QryArPrePost.FieldByName('GLACCT_ID_FX').asFloat]);

//      wwDBGlAcct.Text   := PkAcct.GetValue('ACCT');
    end;
end;

procedure TFrmInvoice.SBCalcTaxClick(Sender: TObject);
begin
  GetTaxes;
end;

procedure TFrmInvoice.SBSaveAllClick(Sender: TObject);
var
  cDate:String;
  AId:Real;
  ADate:TDateTime;
begin
//  FPostingAll := True;
////  IqTiming1.Start('CheckCurrencyRate');
//  CheckCurrencyRate;
////  IqTiming1.Stop('CheckCurrencyRate');
////  IqTiming1.Start('QryArPrePost.CheckBrowseMode');
//  QryArPrePost.CheckBrowseMode;
////  IqTiming1.Stop('QryArPrePost.CheckBrowseMode');
////  IqTiming1.Start('QryArPrePostDetail.CheckBrowseMode');
//  QryArPrePostDetail.CheckBrowseMode;
////  IqTiming1.Stop('QryArPrePostDetail.CheckBrowseMode');
////  TblArPrePostDetail.CheckBrowseMode;
////  IqTiming1.Start('CheckFXAcct');
//  CheckFXAcct;
////  IqTiming1.Stop('CheckFXAcct');
//  if SelectValueAsFloat('select count(id) from arprepost ') = 0 then
//     raise Exception.Create(cTXT0000029); // 'There is nothing to post.'
//
//  AID := SelectValueAsFloat('select Min(arprepost_id) from arprepost_detail where NVL(GLACCT_ID_SALES, 0) = 0');
//  if AID <> 0 then
//  begin
//    QryArPrePost.Locate('ID', AID, []);
//    // 'A Sales Account is missing on one of the detail records.  Cannot post.'
//    raise Exception.Create(cTXT0000020);
//  end;
//
//  if InvoiceItems1.Checked  then CloseInvoiceItems;
//
//  if fPrior = 'N' then
//  begin
//    cDate := DateToStr(Date);
//    ADate := Date;
////    if IQInputQuery('G/L Batch Date', 'Please Enter G/L Batch Date', cDate, '!99/99/0000;1; ') then    {IqInQry.pas}
//    //if GetDateDialog( ADate, cTXT0000030 {'Batch Date'}) then   {in DateDlg.pas}
//    if GetWWDateDialog( cTXT0000030 {'GL Batch Date'},
//      cTXT0000051 {'Please select a batch date:'}, ADate) then
//    begin
//      cDate := DateToStr(ADate);
//      fGLBatchDate := ADate;
//
////      fGLBatchDate := StrToDate(cDate);
//      PostAllInvoices;
//    end;
//  end
//  else if IqConfirmYN(cTXT0000031 {'Post the current batch?'}) then PostAllInvoices;
//  if fPrior = 'N' then RunExternalExe;
end;

procedure TFrmInvoice.PopulateCOGStable;
begin
  ExecuteCommandFmt('delete from C_TEMP_COGS_ELEMS_SUM where userid = ''%s''', ['IQMS']);
  ExecuteCommandFmt('insert into C_TEMP_COGS_ELEMS_SUM (ARPREPOST_DETAIL_ID, SUM_STD_TOTAL, userid) ' +
            'select ARPREPOST_DETAIL_ID, SUM_STD_TOTAL, ''%s'' from v_arprepost_cogs_elements_sum', ['IQMS']);
end;

{
procedure TFrmInvoice.PostAllInvoices;
var
  nOnHold:Integer;
  DBase:TFDConnection;
  nGLBatchId_Id, AId:Real;
  cMessage, cMessage2:String;
  AList:TStringList;
  i:integer;
  RB: TFDRollbackManager;
  AStr:String;
begin
  nOnHold := 0;
  with PkAllInvoices do
  begin
    Sql.Clear;
    if PostallforindividualUserID1.Checked then
      Sql.Add(fPkAllInvSql + Format(' and a.prior_entry = ''%s'' ' +
                                    '  and NVL(a.on_hold, ''N'') = ''N'' ' +
                                    ' and userid = ''%s'' and misc.eplant_filter(a.eplant_id) = 1', [fPrior, SecurityManager.UserName]))
    else
      Sql.Add(fPkAllInvSql + Format(' and a.prior_entry = ''%s'' ' +
                                    '  and NVL(a.on_hold, ''N'') = ''N'' and misc.eplant_filter(a.eplant_id) = 1', [fPrior]));
    if not Execute then Exit;
    GlPeriodId := GetValue('GLPERIODS_ID_AR');
    CheckForOpenPeriod('ar_status', GlPeriodId);
  end;

  if FStdCostPosting then PopulateCOGStable;

  FLockModule:= IQMS_AR_POST_ALL + '-' + SecurityManager.UserName;
  AcquireLock;
  FPostQry := TFDQuery.Create(self);
  RB:= TFDRollbackManager.Create( 'RB_AR');
  AStr := '';
  if SelectValueAsString('select nvl(tax_code_required, ''N'') from iqsys where rownum < 2') = 'Y' then
    AStr := ' where tax_code_id is not null' ;

  with FPostQry do
  try
    try
      AList := TStringList.Create;
      Connection := db_dm.FDConnection;
      if PostallforindividualUserID1.Checked then
        Sql.Add(Format('select a.id,                                                 ' +
                       '        a.glacct_id_fx,                                      ' +
                       '        a.glacct_id_ar,                                      ' +
                       '        a.glperiods_id_ar,                                   ' +
                       '        a.invoice_no,                                        ' +
                       '        a.currency_id,                                        ' +
                       '        c.custno,                                        ' +
                       '        c.company                                        ' +
                       '   from arprepost a, arcusto c                               ' +
                       '  where a.glperiods_id_ar = %f                               ' +
                       '    and a.arcusto_id = c.id(+)                               ' +
                       '    and a.prior_entry = ''%s''                               ' +
                       '    and NVL(a.ON_HOLD, ''N'') <> ''Y''                       ' +
                       '    and a.userid = ''%s''                                    ' +
                       '    and not exists (select 1 from arinvoice where invoice_no = a.invoice_no) ' +
                       '    and a.id in (select arprepost_id from arprepost_detail %s) and misc.eplant_filter(a.eplant_id) = 1 ',
                       [GlPeriodId, fPrior, SecurityManager.UserName, AStr]))
      else
        Sql.Add(Format('select a.id,                                                 ' +
                       '        a.glacct_id_fx,                                      ' +
                       '        a.glacct_id_ar,                                      ' +
                       '        a.glperiods_id_ar,                                   ' +
                       '        a.invoice_no,                                        ' +
                       '        a.currency_id,                                       ' +
                       '        c.custno,                                        ' +
                       '        c.company                                        ' +
                       '   from arprepost a, arcusto c                                         ' +
                       '  where a.glperiods_id_ar = %f                               ' +
                       '    and a.arcusto_id = c.id(+)                             ' +
                       '    and a.prior_entry = ''%s''                               ' +
                       '    and NVL(a.ON_HOLD, ''N'') <> ''Y''                       ' +
                       '    and not exists (select 1 from arinvoice where invoice_no = a.invoice_no) ' +
                       '    and a.id in (select arprepost_id from arprepost_detail %s) and misc.eplant_filter(a.eplant_id) = 1',
                       [GlPeriodId, fPrior, AStr]));

      Open;
      DBase := FDManager.FindConnection('IQFD');
      DBase.StartTransaction;
      RB.Associate;
      nGLBatchId_Id  := GetNextID('GLBATCHID');
      FGLBatchId_Id  := nGLBatchId_Id;
      if fPrior = 'N' then InsertGlbatchId(nGLBatchId_Id);
      nOnHold := Trunc(SelectValueFmtAsFloat('select count(id)                                           ' +
                                 '   from arprepost                                          ' +
                                 '  where glperiods_id_ar = %f                               ' +
                                 '    and prior_entry = ''%s''                               ' +
                                 '    and NVL(ON_HOLD, ''N'') = ''Y''                        ' +
                                 '    and invoice_no not in (select invoice_no               ' +
                                 '                             from arinvoice)               ' +
                                 '    and id in (select arprepost_id from arprepost_detail) and misc.eplant_filter(eplant_id) = 1',
                                 [GlPeriodId, fPrior]));

      HMsg:= hPleaseWait('Processing...');
      while not eof do
      begin
        HMsg.Mesg := Format('Processing Invoice# %s, please wait...', [FieldByName('INVOICE_NO').asString]);
        CheckViewCurrencyRate;

        fArInvoiceId   := GetNextID('ARINVOICE');
        if fPrior = 'N' then InsertGlbatch(nGLBatchId_Id);
        InsertArInvoice(nGLBatchId_Id);
        InsertArInvoiceDetail;
        if FStdCostPosting then CostOfGoodsSold( nGLBatchId_Id );
        AList.Add(FieldByName('ID').AsString);
        next;
      end;

      for i := 0 to Alist.Count - 1 do
        ExecuteCommandFmt('delete from ARPREPOST where id = %s', [Alist[i]]);
      try
        ExecuteCommandFmt('begin intercomp.update_glbatch(%f); end;', [nGLBatchId_Id]);
      except
      end;

      ReopenQryArPrePost;
      DBase.Commit;
      if FPrior = 'N' then
        cMessage2 := 'Do you wish to print the AfterPost report?'
      else
        cMessage2 := '';

      if nOnHold = 0 then cMessage := 'Batch Posted' + cMessage2;
      if nOnHold = 1 then cMessage := 'Batch Posted, (One Invoice was on Hold, it was not processed).' + #13 + cMessage2;
      if nOnHold > 1 then cMessage := Format('Batch Posted, (%d Invoices were on Hold, they were not processed).' + #13 +
                                             cMessage2, [nOnHold]);
      if FPrior = 'N' then
      begin
        if IqConfirmYN(cMessage) then PrintAfterPostReport(nGLBatchId_Id);
      end
      else
        IqConfirm(cMessage);
    finally
      HMsg.Free;
      Alist.Free;
      Free;
      if DBase.InTransaction then
      begin
        DBase.RollBack;
        ShowMessage('Invoice was not posted');
      end;
      RB.Free;
      Screen.Cursor := crDefault;
    end;
  finally
    ReleaseLock;
  end;
end;

}

procedure TFrmInvoice.PostAllInvoices;
var
  nOnHold:Integer;
  aGLBatchId_Id, AId:Real;
  cMessage, cMessage2:String;
  i:integer;
//  RB: TFDRollbackManager;
  AStr:String;
  AMulti, AStd, AAllUsers:String;
begin
//  nOnHold := 0;
//  with PkAllInvoices do
//  begin
//    Sql.Clear;
//    if PostallforindividualUserID1.Checked then
//      Sql.Add(fPkAllInvSql + Format(' and a.prior_entry = ''%s'' ' +
//                                    '  and NVL(a.on_hold, ''N'') = ''N'' ' +
//                                    ' and userid = ''%s'' and misc.eplant_filter(a.eplant_id) = 1', [fPrior, SecurityManager.UserName]))
//    else
//      Sql.Add(fPkAllInvSql + Format(' and a.prior_entry = ''%s'' ' +
//                                    '  and NVL(a.on_hold, ''N'') = ''N'' and misc.eplant_filter(a.eplant_id) = 1', [fPrior]));
//    if not Execute then Exit;
//    GlPeriodId := GetValue('GLPERIODS_ID_AR');
//    CheckForOpenPeriod('ar_status', GlPeriodId);  {in IqAcct.pas}
//  end;
//
//  if FStdCostPosting then PopulateCOGStable;
//
//  FLockModule:= IQMS_AR_POST_ALL + '-' + SecurityManager.UserName;
//  AcquireLock;
//  FPostQry := TFDQuery.Create(self);
////  RB:= TFDRollbackManager.Create( 'RB_AR');
//  AStr := '';
//  if SelectValueAsString('select nvl(tax_code_required, ''N'') from iqsys where rownum < 2') = 'Y' then
//    AStr := ' where tax_code_id is not null' ;
//
//  try
////    RB.Associate;
//    db_dm.FDConnection.StartTransaction;
//    try
//
//      if FMultiCurrency then
//        AMulti := 'Y'
//      else
//        AMulti := 'N';
//
//      if FStdCostPosting then
//        AStd := 'Y'
//      else
//        AStd := 'N';
//
//      if PostallforindividualUserID1.Checked then
//        AAllUsers := 'Y'
//      else
//        AAllUsers := 'N';
//
//    VerifyEPlantSequence;
//    ExecuteCommandFmt('begin iq_ar_post.PostAllInvoices(  ''%s'', ' +
//                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), ' +
//                                                  ' %f, ' +
//                                                  ' ''%s'', ' +
//                                                  ' %.6f, ' +
//                                                  ' ''%s'', ' +
//                                                  ' ''%s''); end;',
//                                                  [FPrior,
//                                                   FormatDateTime('mm/dd/yyyy', fGLBatchDate),
//                                                   GlPeriodId,
//                                                   AMulti,
//                                                   FXRate,
//                                                   AStd,
//                                                   AAllUsers]);
//
//
//
//      ReopenQryArPrePost;
//      db_dm.FDConnection.Commit;
////      if FPrior = 'N' then
////        cMessage2 := 'Print the After Post report?'
////      else
////        cMessage2 := '';
//
////      nOnHold := 0;
//
////      if nOnHold = 0 then cMessage := 'Batch Posted' + cMessage2;
////      if nOnHold = 1 then cMessage := 'Batch Posted, (One Invoice was on Hold, it was not processed).' + #13 + cMessage2;
////      if nOnHold > 1 then cMessage := Format('Batch Posted, (%d Invoices were on Hold, they were not processed).' + #13 +
////                                             cMessage2, [nOnHold]);
//
//     cMessage := 'Batch Posted. Print the After Post report?';
//
//     aGLBatchId_Id := SelectValueAsFloat('select iq_ar_post.GetGlBatchId_Id from dual');
//     BatchGetTax(aGLBatchId_Id);
//     EmailInvoice(aGLBatchId_Id);
//
//
//      if FPrior = 'N' then
//      begin
//        aGLBatchId_Id := SelectValueAsFloat('select iq_ar_post.GetGlBatchId_Id from dual');
//        if IqConfirmYN(cMessage) then PrintAfterPostReport(aGLBatchId_Id);
//      end
//      else
//      begin
//        cMessage := 'Invoice Posted.';
//        IqConfirm(cMessage);
//      end;
//    finally
//      if db_dm.FDConnection.InTransaction then
//      begin
//        db_dm.FDConnection.RollBack;
//        ShowMessage(cTXT0000035 {'The Invoice was not posted.'});
//      end;
//      Screen.Cursor := crDefault;
//    end;
//  finally
////    RB.Free;
//    ReleaseLock;
//  end;
end;




procedure TFrmInvoice.AcquireLock;
begin
//  if not DB_DataModule.AcquireIQLock( FLockHandle, FLockModule, IQLOCK_EXCLUSIVE ) then
//    raise Exception.Create(Format(cTXT0000036 {'Unable to acquire lock (%s)'}, [FLockModule]));
end;

procedure TFrmInvoice.ReleaseLock;
begin
//  DB_DataModule.IQUnLock( FLockHandle );
end;

procedure TFrmInvoice.Print1Click(Sender: TObject);
begin
//removed for demo
end;

procedure TFrmInvoice.PrintAfterPostReport(nGLBatchId_Id:Real);
var
  cServerName, cUID, cPassword:String;
  SelectionList:TStringList;
begin
//
//  try
//    SelectionList := TStringList.Create;
//    SetCriteriaExpression( SelectionList, Format('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
//    PrintDefaultReport( self, 'ar_afterpost_report', SelectionList );  {in IqPrint.pas}
//  finally
//    SelectionList.Free;
//  end;
//
////  cServername := IQGetServerName( 'IQ' );
////  cUID        := IQGetUID( 'IQ' );
////  cPassword   := IQGetPassword( 'IQ' );
////  with Crpe1 do
////  begin
////    ReportName:= IQGetReportsPath + SelectValueAsString('select ar_afterpost_report from iqsys');
////    if not FileExists(ReportName) then raise Exception.CreateFmt('Report %s not found, please assign system parameters', [ ReportName ]);
////    Connect:= Format('DSN = %s; UID = %s; PWD = %s; DSQ = ',
////              [cServername, cUID, cPassword ]);
////    SetCriteriaExpression( SelectionFormula,  Format('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
////    Execute;
////  end;
//
//  Screen.Cursor := crDefault;
end;

procedure TFrmInvoice.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;

procedure TFrmInvoice.Status1Click(Sender: TObject);
begin
//   DoCustStat(self, QryArPrePost.FieldByName('ARCUSTO_ID').asFloat);
end;

procedure TFrmInvoice.DBEditInvDateEnter(Sender: TObject);
begin
  FChangeDueDate := True;
end;

procedure TFrmInvoice.DBEditInvDateExit(Sender: TObject);
begin
  AssignDueDate;
end;

procedure TFrmInvoice.AssignDueDate;
var
  YY, MM, DD: word;
  ABadDate:Boolean;
  AStatementDay:Real;
  AStatementDte:TDateTime;
  AInvoiceDay:Real;
  Asuccess:boolean;
begin
  with QryArPrePost do
  try
    if not (State in [dsEdit, dsInsert]) then Edit;

    if FieldByName('TermsBasedOn').asString = 'C' then
    begin
      AStatementDay := SelectValueFmtAsFloat('select statement_date from arcusto where id = %f', [FieldByName('ARCUSTO_ID').asFloat]);
      if AStatementDay <> 0 then
      begin

        AInvoiceDay := SelectValueFmtAsFloat('select to_number(to_char(To_Date(''%s'', ''MM/DD/RRRR''), ''DD'')) from dual', [FormatDateTime('mm/dd/yyyy', FieldByName('INVOICE_DATE').asDateTime)]);

        DecodeDate( FieldByName('INVOICE_DATE').asDateTime, YY, MM, DD );

        if AInvoiceDay > AStatementDay then
        begin
          MM := MM + 1;
          if MM > 12 then
          begin
            MM := 1;
            YY := YY + 1;
          end;
        end;

        Asuccess := false;
        while not Asuccess do
        begin
          try
            FieldByName('DUE_DATE').asDateTime := EncodeDate( YY, MM, Trunc(AStatementDay)) + FieldByName('TERMDAYS').asInteger;
            Asuccess := true;
          except
            AStatementDay := AStatementDay - 1;
            if AStatementDay < 1 then
              raise exception.Create(cTXT0000090);
          end;
        end;


      end
      else
      begin
        FieldByName('DUE_DATE').asDateTime :=  FieldByName('INVOICE_DATE').asDateTime + FieldByName('TERMDAYS').asInteger;
      end;
    end
    else if FieldByName('TermsBasedOn').asString = 'I' then
    begin
      if (FieldByName('INVOICE_DATE').asDateTime <> 0)
//        and (FieldByName('TERMDAYS').asInteger <> 0)
         and (State in [dsEdit, dsInsert]) then
          FieldByName('DUE_DATE').asDateTime :=
          FieldByName('INVOICE_DATE').asDateTime +
          FieldByName('TERMDAYS').asInteger
    end
    else if FieldByName('TermsBasedOn').asString = 'S' then
      FieldByName('DUE_DATE').asDateTime := Now + 30;
//      GetTermsBasedOnDate('ARCUSTO',
//      FieldByName('ARCUSTO_ID').asFloat,
//      FieldByName('TERMS_ID').asFloat,
//      FieldByName('INVOICE_DATE').asDateTime);  {in IQMS.Dates.pas}

    if FieldByName('DAY_OF_MONTH').asInteger > 0 then
    begin
      DecodeDate( FieldByName('DUE_DATE').asDateTime, YY, MM, DD );

      if FieldByName('END_OF_MONTH').asString = 'Y' then
      begin
        FieldByName('DUE_DATE').asDateTime := Now + 30; //IQEoM(FieldByName('DUE_DATE').asDateTime);
        DecodeDate( FieldByName('DUE_DATE').asDateTime, YY, MM, DD );
      end;

      if FieldByName('DAY_OF_MONTH').asInteger < DD then
      begin
        DD := FieldByName('DAY_OF_MONTH').asInteger;
        Inc(MM);
        if MM > 12 then
        begin
          MM := 1;
          Inc(YY);
        end;
        FieldByName('DUE_DATE').asDateTime := EncodeDate( YY, MM, DD);
      end
      else if FieldByName('DAY_OF_MONTH').asInteger > DD then
      begin
        DD := FieldByName('DAY_OF_MONTH').asInteger;
        ABadDate := True;
        while ABadDate do
        try
          FieldByName('DUE_DATE').asDateTime := EncodeDate( YY, MM, DD);
          ABadDate := False;
        except
          Dec(DD);
        end;
      end;
    end
    else
    if FieldByName('END_OF_MONTH').asString = 'Y' then
      FieldByName('DUE_DATE').asDateTime := Now + 30; //IQEoM(FieldByName('DUE_DATE').asDateTime);






  finally
    FChangeDueDate := False;
  end;



//  with TblArPrePost do
//  try
//    if (FieldByName('INVOICE_DATE').asDateTime <> 0) and
//       (FieldByName('TERMDAYS').asInteger <> 0) and (State in [dsEdit, dsInsert]) then
//        FieldByName('DUE_DATE').asDateTime :=
//        FieldByName('INVOICE_DATE').asDateTime +
//        FieldByName('TERMDAYS').asInteger;
//  finally
//    FChangeDueDate := False;
//  end;
end;

procedure TFrmInvoice.Terms1Click(Sender: TObject);
begin
//  DoTerms( self, DM.TblTerms );   {Terms.pas}
end;

procedure TFrmInvoice.TaxCodes1Click(Sender: TObject);
begin
//  DoTaxCode(self);  {TaxMain.pas}
//  DM.TblTaxCodes.Refresh;
//  //wwTblTax.Refresh;
////  wwTblTax.Close;
////  wwTblTax.Open;
//  wwQryTax.Close; wwQryTax.Open;
//  DM.ViewTaxCodes.Close;
//  DM.ViewTaxCodes.Open;
//  ReopenQryArPrePostDetail;
////  TblARPrepostDetail.Refresh;
end;

procedure TFrmInvoice.SalesAcct1Click(Sender: TObject);
begin
  CheckCashInAdv;
//  with TblArPrePostDetail do
  with QryArPrePostDetail do
    if PkAllAcct.Execute then
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('GLACCT_ID_SALES').asFloat := PkAllAcct.GetValue('ID');
      FieldByName('GLACCT').asString         := PkAllAcct.GetValue('ACCT');
    end;
end;
(*
procedure TFrmInvoice.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
var
  A: Variant;
begin
  with HintInfo do
  begin
    if HintControl = DBEditPeriod then
       HintStr := Format(cTXT0000037 {'Start Date: %s'#13'End Date: %s'}, [QryArPrePostSTART_DATE.asString, QryArPrePostEND_DATE.asString ])

////    else if HintControl = DBEditARAcct then
//    else if HintControl = wwDBGlAcct then
////       HintStr := DBEditARAcct.Text
//       HintStr := wwDBGlAcct.Text

    else if HintControl = DBEditCustNo then
       with DM.TblArCusto do
       begin
         Locate('ID', QryARPrepost.FieldByName('ARCUSTO_ID').asFloat, []);
         HintStr := FieldByName('Company').asString + #13 +
                    FieldByName('addr1').asString + #13 +
                    FieldByName('addr2').asString + #13 +
                    FieldByName('addr3').asString + #13 +
                    FieldByName('City').asString + ' ' +
                    FieldByName('State').asString + ' ' +
                    FieldByName('Zip').asString + ' ' + FieldByName('Country').asString;
       end

//    else if HintControl = DBEditBiillTo then
    else if HintControl = dbWWBillTo then
      begin
         A:= SelectValueArrayFmt('select Attn, addr1, addr2, addr3, City, State, Zip, Country from bill_to where id = %f', [ QryARPrepostBILL_TO_ID.asFloat ]);
         if VarArrayDimCount( A ) > 0 then
            HintStr := A[ 0 ] + #13 +
                       A[ 1 ] + #13 +
                       A[ 2 ] + #13 +
                       A[ 3 ] + #13 +
                       A[ 4 ] + ' ' +
                       A[ 5 ] + ' ' +
                       A[ 6 ]  + ' ' + A[ 7 ];
      end;
  end;
end;
*)
{
procedure TFrmInvoice.GridInvoiceDetailCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if (GridInvoiceDetail.DataSource.DataSet.FieldByName('PHANTOM').asString = 'Y') and (GridInvoiceDetail.DataSource.DataSet.FieldByName('PHANTOM_ON_SO').asString = 'Y')  then
    AFont.Style := [fsBold];

  if (UpperCase(Field.FieldName) = 'INVOICE_QTY') or
     (UpperCase(Field.FieldName) = 'UNIT_PRICE') or
     (UpperCase(Field.FieldName) = 'PRICE_PER_1000') or
     (UpperCase(Field.FieldName) = 'COMM_PCNT') or
     (UpperCase(Field.FieldName) = 'TAX_CODE') or
     (UpperCase(Field.FieldName) = 'SALESPERSON') or
     (UpperCase(Field.FieldName) = 'GLACCT') or
     (UpperCase(Field.FieldName) = 'GLACCT_RMA') or
     (UpperCase(Field.FieldName) = 'FREIGHT_COMP') or
     (UpperCase(Field.FieldName) = 'MISC_COMMENT') or
     (UpperCase(Field.FieldName) = 'REFERENCE') or
     (UpperCase(Field.FieldName) = 'REFCODE') or
     (UpperCase(Field.FieldName) = 'MISC_PO') or
     (UpperCase(Field.FieldName) = 'GL_FR_ACCT') or
     (UpperCase(Field.FieldName) = 'FREIGHT_REV_AMOUNT') or
     (UpperCase(Field.FieldName) = 'FREIGHT_REV_PCNT') or
     (UpperCase(Field.FieldName) = 'GL_FR_ACCT_REV') or
     (UpperCase(Field.FieldName) = 'DISCOUNT') or
     (UpperCase(Field.FieldName) = 'FREIGHT_PRICE')
  then if (not Highlight) then ABrush.Color := clWindow;

  if (SelectValueFmtAsFloat('select count(*) from arprepost_detail_sales where arprepost_detail_id = %f', [QryARPrepostDetailID.asFloat]) <> 0) and
     (UpperCase(Field.FieldName) = 'GLACCT')
  then if (not Highlight) then ABrush.Color := clAqua;


end;
}
procedure TFrmInvoice.SbViewVoidedClick(Sender: TObject);
begin
//  DoViewVoidInvoices(self, 0, '');
end;


procedure TFrmInvoice.ViewCreditMemos1Click(Sender: TObject);
begin
//  DoViewRMA(self, SelectValueFmtAsFloat('select rma_detail_id ' +
//                            'from rma_credits ' +
//                            'where arprepost_id = %f',
//                            [QryArPrePost.FieldByName('ID').asFloat]));    {in Rma_View.pas}

//  DoViewRMA(self, QryArPrePostDetailRMA_DETAIL_ID.asFloat);    {in Rma_View.pas}

  // Com_Exec( 'IQRMA', [ Rma_Const.RMA_VIEW_RMA, QryArPrePostDetailRMA_DETAIL_ID.asFloat ]);    {Rma_Const, IQComExe.pas}
//  JumpDispatcher.DoCOMJump( 'IQRMA', [ Rma_Const.RMA_VIEW_RMA, QryArPrePostDetailRMA_DETAIL_ID.asFloat ]);  // JumpDispatcher.pas
end;

procedure TFrmInvoice.ViewPostedInvoices1Click(Sender: TObject);
begin
//rmoved
end;

procedure TFrmInvoice.SBPrintClick(Sender: TObject);
var
  SelectionList:TStringList;
  A            : Variant;
  ACopies      : Integer;
  ACollated    : Boolean;
  AReport      : string;
  AConfirm:Integer;
  AStartPage, AStopPage: Integer;
begin
//  try
//    SelectionList := TStringList.Create;
//    SetCriteriaExpression( SelectionList,  Format('{ARPREPOST.ID} = %f', [QryArPrePost.FieldByName('ID').asFloat]));
//
//    A:= SelectValueArrayFmt('select print_count, print_last_user, print_last_date from arprepost where id = %f', [ QryArPrePost.FieldByName('ID').asFloat ]);
//    if VarArrayDimCount( A ) = 0 then
//       raise Exception.CreateFmt(cTXT0000038 {'Application Error:  Cannot find invoice [ID = %.0f].'}, [ QryArPrePost.FieldByName('ID').asFloat ]);
//
//    if (A[ 0 ] <> 0) then
//    begin
//     AConfirm := True;
////     IQDialogChkEx( TFrmPrintConf,
////                                Format(cTXT0000039, [DtoF(A[ 0 ]), DateTimeToStr(A[ 2 ]), A[ 1 ] ]),
////                                'AR_ConfirmPrint' );
//    end
//    else
//    AConfirm := 1;
//
//
////    if (A[ 0 ] = 0) or not
//       // 'This invoice has been printed %.0f time(s)'#13#13'Last printed on %s by %s'#13#13'Abort printing?'
//
//
//
//
////       IQWarningYN(Format(cTXT0000039,
////                          [DtoF(A[ 0 ]), DateTimeToStr(A[ 2 ]), A[ 1 ] ])) then
//    if AConfirm = 1 then
//    begin
//      if not AssignPrinterSettings( self, 'INVOICE_REPORT', ACopies, ACollated, AStartPage, AStopPage ) then
//         EXIT;
//
//      // AReport:= SelectValueAsString('select INVOICE_REPORT from iqsys');
//      AReport:= TFrmPrintDocsCustom.GetReportNameEx( 'INVOICE_REPORT',
//                                                    [ 'bill_to', QryArPrePost.FieldByName('bill_to_id').asFloat,
//                                                      'arcusto', QryArPrePost.FieldByName('arcusto_id').asFloat ]);
//
//      if Empty( AReport ) then
//         // 'No default report assigned in System Parameters. Please assign default report.'
//         raise Exception.Create(cTXT0000040);
//
//
////       PrintDefaultReport( self, 'INVOICE_REPORT', SelectionList );  {in IqPrint.pas}
//
//      PrintDefaultReportExA( AReport, SelectionList, ACopies, ACollated, AStartPage, AStopPage );
//      DoAutoEmail(AReport, SelectionList);
//
//
//      ExecuteCommandFmt('update arprepost set print_count = NVL(print_count,0) + 1, ' +
//                '                     print_last_user = ''%s'',             ' +
//                '                     print_last_date = to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS'') '+
//                '        where ID = %f',
//                [ SecurityManager.UserName,
//                  FormatDateTime('mm/dd/yyyy hh:nn:ss', Now ),
//                  QryArPrePost.FieldByName('ID').asFloat ]);
//    end;
//  finally
//    SelectionList.Free;
//  end;
end;

procedure TFrmInvoice.DoAutoEmailAfterPost(AReportName: string; ASelectionList: TStringList; AId:Real);
var
  AArcusto_ID: Real;
  ABill_To_ID: Real;
  Ainvoice_no: String;
  ABody      : string;
  AList      : TStringList;
  I          : Integer;
  ACustNo    : string;
  APOs       : string;
  ADonotEmail:String;
  AShip_To_ID : Real;
  AExternalDocsList: TStringList;
begin
//  ADonotEmail := SelectValueFmtAsString('select NVL(DO_NOT_EMAIL_UPON_POST, ''N'') from arinvoice where id = %f', [AId]);
//  if ADonotEmail = 'Y' then exit;
//// reverted as per Olivia Sep 26 2012 SER# 03187 - AR Invoice - Option to override the Auto Eform Setup and do not auto email
////  ADonotEmail := SelectValueFmtAsString('select NVL(DO_NOT_AUTO_EMAIL, ''N'') from arinvoice where id = %f', [AId]);
////  if ADonotEmail = 'Y' then exit;
//  ABill_To_ID := SelectValueFmtAsFloat('select bill_to_id from arinvoice where id = %f', [AId]);
//  AArcusto_ID := SelectValueFmtAsFloat('select arcusto_id from arinvoice where id = %f', [AId]);
//  Ainvoice_no := SelectValueFmtAsString('select invoice_no from arinvoice where id = %f', [AId]);
//  ACustNo     :=  SelectValueFmtAsString('select custno from arcusto where id = %f', [AArcusto_ID]);
//  APOs:= '';
//  AShip_To_ID := SelectValueFmtAsFloat('select o.ship_to_id from orders o, ord_detail d where d.orders_id = o.id and d.id in ' +
//                                                 ' (select ord_detail_id from arinvoice_detail where arinvoice_id = %.0f) ', [ AId ]);
//
//
//  AList:= TStringList.Create;
//  try
//    LoadColumnValueIntoStringList( AList, Format('select distinct o.pono from orders o, ord_detail d where d.orders_id = o.id and d.id in ' +
//                                                 ' (select ord_detail_id from arinvoice_detail where arinvoice_id = %.0f) ', [  AId ]));
//    for I:= 0 to AList.Count - 1 do
//    begin
//       if I > 0 then
//          APOs:= APOs + ', ';
//       APOs:= APOs + AList[ I ]
//    end;
//  finally
//    AList.Free;
//  end;
//
//  if APOs > '' then
//     // cTXT0000100 = 'Invoice # %s for your PO # %s';
//     ABody:= Format(cTXT0000100, [Ainvoice_no, APOs])
//  else
//     // cTXT0000101 = 'Invoice # %s';
//     ABody:= Format(cTXT0000101, [Ainvoice_no]);
//
//  AExternalDocsList := TStringList.Create;
//  try
//    // 04/13/2016 Auto EForm external document list:
//    // Get the external document list through the "posted" print dialog
//    // because by this point the invoice has been posted.
//    TFrmPrintDocsARPost.GetExternalDocsList(
//      Self,
//      Ainvoice_no,
//      Ainvoice_no,
//      {var} AExternalDocsList);
//
//    // cTXT0000102 = 'Invoice # %s %s';
//  TAutoEForm.Create( 'INVOICE',
//                     AArcusto_ID,
//                     AShip_To_ID,
//                     ABill_To_ID,
//                     AReportName,
//                     ASelectionList,
//                      Format(cTXT0000102, [Ainvoice_no, ACustNo]),
//                     ABody,
//                     'ARINVOICE',
//                      AId,
//                      AExternalDocsList).Execute;   {Prn_Share.pas}
//  finally
//    FreeAndNil(AExternalDocsList);
//end;
end;


procedure TFrmInvoice.DoAutoEmail(AReportName: string; ASelectionList: TStringList);
var
  AArcusto_ID: Real;
  ABill_To_ID: Real;
  Ainvoice_no: String;
  ABody      : string;
  AList      : TStringList;
  I          : Integer;
  ACustNo    : string;
  APOs       : string;
begin
//  if SelectValueAsString('select NVL(AUTOEMAILARBATCHPOST, ''N'') from iqsys2') = 'Y' then exit;
//  {AUTO_EFORM}
//  AArcusto_ID:= SelectValueByID('arcusto_id', 'arprepost', QryArPrePost.FieldByName('ID').asFloat);
//  ABill_To_ID:= SelectValueByID('bill_to_id', 'arprepost', QryArPrePost.FieldByName('ID').asFloat);
//  Ainvoice_no:= SelectValueByID('invoice_no', 'arprepost', QryArPrePost.FieldByName('ID').asFloat);
//  ACustNo    := QryArPrePostCUSTNO.asString;
//  APOs:= '';
//
//  AList:= TStringList.Create;
//  try
//    LoadColumnValueIntoStringList( AList, Format('select distinct o.pono from orders o, ord_detail d where d.orders_id = o.id and d.id in ' +
//                                                 ' (select ord_detail_id from arprepost_detail where arprepost_id = %.0f) ', [  QryArPrePost.FieldByName('ID').asFloat ]));
//    for I:= 0 to AList.Count - 1 do
//    begin
//       if I > 0 then
//          APOs:= APOs + ', ';
//       APOs:= APOs + AList[ I ]
//    end;
//  finally
//    AList.Free;
//  end;
//
//  if APOs > '' then
//     ABody:= Format('Invoice# %s for your PO# %s', [ Ainvoice_no, APOs ])
//  else
//     ABody:= Format('Invoice# %s', [ Ainvoice_no ]);
//
//
//  TAutoEForm.Create( 'INVOICE',
//                     AArcusto_ID,
//                     0,
//                     ABill_To_ID,
//                     AReportName,
//                     ASelectionList,
//                     Format('Invoice# %s %s', [ Ainvoice_no, ACustNo ]),
//                     ABody,
//                     'ARPREPOST',
//                     QryArPrePost.FieldByName('ID').asFloat).Execute;   {Prn_Share.pas}
end;


procedure TFrmInvoice.Contents1Click(Sender: TObject);
begin
//  Application.HelpContext(23);
//  IQHelp.HelpContext( FHelpConst );
end;

procedure TFrmInvoice.CustomerDocs2Click(Sender: TObject);
begin
//  CheckCashInAdv;
//  DoCustomerDocs( self, SrcArPrePost, 'ARCUSTO_ID');  {CustDocs.pas}
end;

procedure TFrmInvoice.BrowseGLBatches1Click(Sender: TObject);
begin
//  DOViewBatch('AR');  {in BatView.pas in GL}
end;

procedure TFrmInvoice.JumptoPackingSlip1Click(Sender: TObject);
begin
////  with TblARPrepostDetail do
//  with QryARPrepostDetail do
//    if FieldByName('SHIPMENT_DTL_ID').asFloat <> 0 then
//     DoJumptoPackingSlipMaintenance(FieldByName('SHIPMENT_DTL_ID').asFloat)   {in PsMaint.pas}
//    else
//      ShowMessage(cTXT0000041 {'No Packing Slip is associated with this item.'});
end;

procedure TFrmInvoice.JumptoSalesOrders1Click(Sender: TObject);
var
  nId:Real;
begin
////  with TblARPrepostDetail do
//  with QryARPrepostDetail do
//    if FieldByName('ORD_DETAIL_ID').asFloat <> 0 then
//    begin
//       nId := SelectValueFmtAsFloat('select id from ord_detail where id = %f', [FieldByName('ORD_DETAIL_ID').asFloat]);
//       if nId <> 0 then
//         DoIQJumpOrderDetail(self, nId)   {in oe_main.pas}
//        else
//         DoIQJumpHistOrderDetail(self, FieldByName('ORD_DETAIL_ID').asFloat)   {in oe_hist.pas}
//
//    end
//    else ShowMessage(cTXT0000042 {'No Sales Order is associated with this item.'});
end;

procedure TFrmInvoice.ExternalExefile1Click(Sender: TObject);
begin
//  with OpenDialog1 do
//  begin
//    FileName := SelectValueAsString('select external_exe_file from iqsys');
//    if Execute then
//      ExecuteCommandFmt('update iqsys set external_exe_file = ''%s''', [FileName]);
//  end;
end;

procedure TFrmInvoice.RunExternalExe;
//var
//  AExe:String;
//  StartUpInfo: TStartUpInfo;
//  ProcessInfo: TProcessInformation;
//  Success    : LongBool;
//  CommandLine, IQMSpassword: string;
begin
//  AExe := SelectValueAsString('select external_exe_file from iqsys');
//  if AExe = '' then Exit;
//
//  IQMSpassword := CharXOR(SelectValueAsString( 'select IQMS_LOG from iqms.iqorder2' ));
//
//{  FillChar( StartUpInfo, SizeOf(TStartUpInfo), 0 );
//  with StartupInfo do
//  begin
//    cb := SizeOf(TStartupInfo);
//    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
//    wShowWindow := sw_SHOWNORMAL;
//  end;}
//
//  CommandLine := Format('%s %d %s', [AExe, Trunc(FGlBatchId_Id), IQMSpassword]);
//  MutexAppRun(CommandLine, 'CRELLIN');
//
//{  Success := CreateProcess( nil,
//                            PChar(CommandLine),
//                            nil,
//                            nil,
//                            False,
//                            NORMAL_PRIORITY_CLASS,
//                            nil,
//                            nil,
//                            StartupInfo,
//                            ProcessInfo);
//  if not Success then
//    raise Exception.Create(Format('Error Executing %s'#13+
//                                  'Error Code: %d', [ AExe, GetLastError]));
end;

procedure TFrmInvoice.SrcArPrePostDetailDataChange(Sender: TObject;
  Field: TField);
begin
//  IqTiming1.Start('SrcArPrePostDetailDataChange');
//  if (Sender = SrcArPrePostDetail) then
//    QryARPrepostDetail.FieldByName('INVOICE_QTY').ReadOnly := QryARPrepostDetail.FieldByName('FROM_ORDER').asString = 'Y';
  if (Sender = SrcArPrePostDetail) and (QryARPrepostDetail.State in [dsEdit, dsInsert])
     and ((Field = QryARPrepostDetailPRICE_PER_1000) or (Field = QryARPrepostDetailUNIT_PRICE) or (Field = QryARPrepostDetailDISCOUNT)) then
  try
    SrcArPrePostDetail.OnDataChange := nil;
    if Field = QryARPrepostDetailPRICE_PER_1000 then
      QryARPrepostDetailUNIT_PRICE.asFloat := QryARPrepostDetailPRICE_PER_1000.asFloat / 1000
    else if Field = QryARPrepostDetailUNIT_PRICE then
    begin
      QryARPrepostDetailPRICE_PER_1000.asFloat := QryARPrepostDetailUNIT_PRICE.asFloat * 1000;
      AssignPriceToDiscount(QryARPrepostDetailUNIT_PRICE.asFloat);
    end
    else if Field = QryARPrepostDetailDISCOUNT then
      AssignDiscountToUnitPrice(QryARPrepostDetailDISCOUNT.asFloat);


  finally
    SrcArPrePostDetail.OnDataChange := SrcArPrePostDetailDataChange;
  end;
  PostMCMessage;
//  IqTiming1.Stop('SrcArPrePostDetailDataChange');
end;

procedure TFrmInvoice.btnCurrency1Click(Sender: TObject);
begin
//  DOMCFormDisplay(self,
//                 QryArPrePost.FieldByName('CURRENCY_ID').asFloat,
//                 QryARPrepostDetail,
//                 TFrmMCFormBasicClass( TFrmMCARDetails )); {in MCFrmBas.pas}
end;

procedure TFrmInvoice.btnCurrency2Click(Sender: TObject);
begin
//  DOMCFormDisplay(self,
//                 QryArPrePost.FieldByName('CURRENCY_ID').asFloat,
//                 ViewArPrepostDetailTotals,
//                 TFrmMCFormBasicClass( TFrmMCARTotals )); {in MCFrmBas.pas}
end;

procedure TFrmInvoice.PostMCMessage;
var
  nId:Integer;
begin
//  nId := QryArPrePost.FieldByName('currency_id').asInteger;
//  if nId = 0 then
//    nId := Trunc(GetEplantNativeCurrencyId); {in McShare.pas}
//
////  if nId = 0 then nId := Trunc(SelectValueAsFloat('select currency_id from iqsys'));
////  PostMessage( Application.MainForm.Handle, iq_MCRefreshDataSets, nId, 0 );
end;

procedure TFrmInvoice.SrcViewArPrePostDetailTotalsDataChange(
  Sender: TObject; Field: TField);
begin
  PostMCMessage;
end;

procedure TFrmInvoice.GridInvoiceEditButtonClick(Sender: TObject);
var
  v_date:TDateTime;
begin
{  if GridInvoice.SelectedField = QryArPrePostINVOICE_DATE then
  begin
    with QryArPrePost do
    begin
      v_date := QryArPrePostINVOICE_DATE.asDateTime;
      if GetDateDialog( v_date, 'Select Date') then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        QryArPrePostINVOICE_DATE.asDateTime := v_date;
      end;
    end;
  end
  else  if GridInvoice.SelectedField = QryArPrePostPERIOD then
  begin
    SBPeriodClick(nil);
  end
  else
  begin
    with QryArPrePost do
      if PkAcct.Execute then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        FieldByName('GLACCT_ID_FX').asFloat := PkAcct.GetValue('ID');
      end;
  end;
  }
end;

procedure TFrmInvoice.InvoiceCodes1Click(Sender: TObject);
begin
//  DoInvoiceCode(self, tblInvCode, QryInvCode);   {in InvCode.pas}
end;

procedure TFrmInvoice.AddAmortization1Click(Sender: TObject);
var
  ID: Real;
begin
  CheckCashInAdv;
//  with TblArPrePostDetail do
  with QryArPrePostDetail do
  try
    OnNewRecord:= NIL;
    Append;
    FieldByName('INVOICE_QTY').asInteger  := 1;
    FieldByName('ORD_DETAIL_ID').asFloat  := 0;
    FieldByName('misc_comment').asString  := cTXT0000043; // 'AMORTIZATION'

    ID:= SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_amort'', %f) from dual',
                   [FieldByName('EPLANT_ID').asFloat]);
    if ID > 0 then
      FieldByName('GLACCT_ID_SALES').asFloat:= ID
    else
      {'A default Amortization GL Account has not assigned in the system parameters.
      No account has been assigned to this amortization item.'}
      ShowMessage(cTXT0000044);
  finally
    OnNewRecord:= QryArPrePostDetailNewRecord;
//    OnNewRecord:= TblArPrePostDetailNewRecord;
  end;
end;

procedure TFrmInvoice.Commissions1Click(Sender: TObject);
begin
//  CheckCashInAdv;
//  QryARPrepostDetail.CheckBrowseMode;
//  CheckCreditMemo;
//  DoOECommissionSplit(self);   {in OEComm.pas}
end;

procedure TFrmInvoice.TblCommAfterPost(DataSet: TDataSet);
begin
  if FTblCommCOMMISSION_PERCENT <> TblCommCOMMISSION_PERCENT.asFloat then
  begin
    ExecuteCommandFmt('update arprepost_comm set amount = commission_percent * %.6f * %.6f/100 where id = %f',
              [QryARPrepostDetailUNIT_PRICE.asFloat, QryARPrepostDetailINVOICE_QTY.asFloat, TblCommID.asFloat]);
    FTblCommCOMMISSION_PERCENT := TblCommCOMMISSION_PERCENT.asFloat;
  end;

  ReopenQryArPrePostDetail;
//  TblARPrepostDetail.Refresh;
end;

procedure TFrmInvoice.TblCommBeforeEdit(DataSet: TDataSet);
begin
  FTblCommCOMMISSION_PERCENT := TblCommCOMMISSION_PERCENT.asFloat;
end;

procedure TFrmInvoice.editCommEnter(Sender: TObject);
begin
//  sbComm.Left:= editComm.Width - sbComm.Height
end;

procedure TFrmInvoice.CheckPageControl(ADataSet:TDataset);
begin
//  SetPageControlCaptions;

 // if ADataSet.State in [dsBrowse] then
//    SetPageControlCaptions(PageControl2);
end;


procedure TFrmInvoice.SrcCommentsDataChange(Sender: TObject;
  Field: TField);
begin
  CheckPageControl(QryComments);
end;

procedure TFrmInvoice.QryShipBeforeOpen(DataSet: TDataSet);
begin
  if QryArPrepost.FieldByName('EPLANT_ID').asFloat <> 0 then
    IQAssignEPlantFilterParam( DataSet, FloatToStr(QryArPrepost.FieldByName('EPLANT_ID').asFloat), True )// SecurityManager.EPlant_Include_Nulls )
  else
    IQAssignEPlantFilter( DataSet );  {pas}
//  HMsg:= hPleaseWait( 'Opening Shipments Query, please wait...' );
//  IqTiming1.Start('QryShip');
end;

procedure TFrmInvoice.QryShipAfterOpen(DataSet: TDataSet);
begin
//  IqTiming1.Stop('QryShip');
//  HMsg.Free;
end;

procedure TFrmInvoice.QryOrdBeforeOpen(DataSet: TDataSet);
begin
  if QryArPrepost.FieldByName('EPLANT_ID').asFloat <> 0 then
    IQAssignEPlantFilterParam( DataSet, FloatToStr(QryArPrepost.FieldByName('EPLANT_ID').asFloat), True )//SecurityManager.EPlant_Include_Nulls )
  else
    IQAssignEPlantFilter( DataSet );  {pas}
//  HMsg:= hPleaseWait( 'Opening Orders Query, please wait...' );
//  IqTiming1.Start('QryOrd');
end;


procedure TFrmInvoice.QryOrdAfterOpen(DataSet: TDataSet);
begin
//  IqTiming1.Stop('QryOrd');
//  HMsg.Free;
end;

procedure TFrmInvoice.AutoInvoice1Click(Sender: TObject);
var
  AId:Real;
  ADate:TDateTime;
  AEplant:String;
begin
////  if not IqConfirmYN('Do you wish to Auto Invoice?') then Exit;
//  aDate := Date;
//  if not GetWWDateDialog( cTXT0000045 {'AutoInvoice Date'},
//   cTXT0000046 {'Select a maximum AutoInvoice date.'}, ADate ) then Exit;   {in wDateDlg.pas}
//
//    if SecurityManager.EPlant_ID = 'NULL' then
//      AEplant :=  cTXT0000048 // 'No Eplant'
//    else
//      AEplant := Format( cTXT0000049 {'Eplant %s'}, [SecurityManager.EPlant_ID]);
//
//    VerifyEPlantSequence;
//
//    ExecuteCommandFmt( 'Insert into EventLog( event_time, userid, text, class) values ( sysdate, ''%s'', ''%s'', ''%s'' )',
//               [SecurityManager.UserName, AEplant, 'AUTOINVOICING' ]);
//
//    ExecuteCommandFmt('begin IQ_ARINVOICE.IQ_AutoInvoice(To_Date(''%s'', ''MM/DD/RRRR'')); end;',
//              [FormatDateTime('mm/dd/yyyy', ADate)]);
//
//  ReopenQryArPrePost;
//  QryBillTo.Close;
//  QryBillTo.Open;
//  Application.ProcessMessages;
//  NavBeforeAction(nil, nbRefresh);
////  TblArPrepost.Refresh;
//  IqConfirm( cTXT0000052 {'Auto Invoicing complete'});
end;

procedure TFrmInvoice.VerifyEPlantSequence;
var
  AName:String;
  nEplantId:Real;
begin
//  if SecurityManager.EPlant_ID = 'NULL' then
//    nEPlantId := 0
//  else
//    nEPlantId := '1';
//
//  AName := GetEPlantSequenceName( FloatToStr(nEPlantId), 'AR',  'S_INVOICE'); {IqSeq.pas}
//
//  if SelectValueFmtAsFloat('select 1 from all_sequences where sequence_owner = ''IQMS'' and sequence_name = ''%s''', [ AName ]) = 0 then
//  try
//    IQLockSemaphor( IQLockHandle, 'IQMS-'+AName );
//    ExecuteCommandFmt('create sequence %s start with 1 NoCache NoCycle', [ AName ]);
//  finally
//    IQReleaseSemaphor( IQLockHandle );
//  end;
end;

procedure TFrmInvoice.GridInvoiceDetailDblClick(Sender: TObject);
var
  AField : TField;
begin
//  if TblARPrepostDetail.eof and TblARPrepostDetail.bof then Exit;
//  AField  := GridInvoiceDetail.GetActiveField;
//  if not (AField = TblARPrepostDetail.FieldByName('MISC_COMMENT')) then Exit;
//  DisplayMemoDlg;

  if QryARPrepostDetail.eof and QryARPrepostDetail.bof then Exit;
 /// AField  := GridInvoiceDetail.GetActiveField;
  if not (AField = QryARPrepostDetail.FieldByName('MISC_COMMENT')) then Exit;
  CheckCreditMemo;
  DisplayMemoDlg;

end;

procedure TFrmInvoice.DisplayMemoDlg;
//var
//  memoDlg: TwwMemoDialog;
begin
//  DoARMiscItem(self); {ARMiscItem.pas}



//  memoDlg := TwwMemoDialog.create(self);
//  try
//     memoDlg.dataSource:= SrcArPrePostDetail;
//     memoDlg.dataField:= 'MISC_COMMENT';
//     memoDlg.MemoAttributes:= GridInvoiceDetail.MemoAttributes;
//     memoDlg.Caption:= cTXT0000053; // 'Miscellaneous Description';
//     memoDlg.Font:= GridInvoiceDetail.font;
//     memoDlg.DlgLeft:= -1; { leave as default size }
//     if memoDlg.execute then
//       QryARPrepostDetail.CheckBrowseMode
//     else
//       QryARPrepostDetail.Cancel;
//  finally
//     memoDlg.free;
//  end;
//  SetFocustToFirstEditableField;
end;

procedure TFrmInvoice.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmInvoice.PageControl2Change(Sender: TObject);
begin
  if PageControl2.ActivePage.TabIndex = 3 then
  begin
    QryOrder.Open;
    QryShipment.Open;
  end
  else
  begin
    QryOrder.Close;
    QryShipment.Close;
  end;

  if (PageControl2.ActivePage.TabIndex = 1) or (PageControl2.ActivePage.TabIndex = 2) then
    QryComments.Open
  else
    QryComments.Close;

end;

procedure TFrmInvoice.PostallforindividualUserID1Click(Sender: TObject);
begin
//  PostallforindividualUserID1.Checked := True;
//  IQRegIntegerScalarWrite( self, 'AR_USERID', 0);
end;

procedure TFrmInvoice.PostallforallUsersID1Click(Sender: TObject);
begin
  PostallforallUsersID1.Checked := True;
//  IQRegIntegerScalarWrite( self, 'AR_USERID', 1);
end;

procedure TFrmInvoice.PKCustomer2BeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmInvoice.PkAcctBeforeOpen(DataSet: TDataSet);
begin
  if QryArPrepost.FieldByname('EPLANT_ID').asFloat <> 0 then
    IQAssignEPlantFilterParam( DataSet,
                               FloatToStr(QryArPrepost.FieldByname('EPLANT_ID').asFloat),
                               True) //SecurityManager.EPlant_Include_Nulls)
  else
  IQAssignEPlantFilter( DataSet );  {pas}

end;

//procedure TFrmInvoice.QryARPrepostDetailUpdateRecord(DataSet: TDataSet;
//  UpdateKind: TFDPhysUpdateRequest; var UpdateAction: TFDErrorAction);
//begin
//  with DataSet do
//    case UpdateKind of
//      arUpdate: UpdateQryArPrepostDtl;
//      arInsert: InsertQryArPrepostDtl;
//      arDelete: DeleteQryArPrepostDtl;
//    end;
//  AAction := eaApplied;
//end;
//
//procedure TFrmInvoice.UpdateQryArPrepostDtl;
//begin
////  IqTiming1.Start('UpdateQryArPrepostDtl');
//  with QryARPrepostDetail do
//  ExecuteCommandFmt('update arprepost_detail set ' +
//                    'misc_comment      = ''%s'', ' +
//                    'invoice_qty       = decode(%f, 0, '''', %f), ' +
//                    'unit_price        = decode(%.6f, 0, '''', %.6f), ' +
//                    'tax_code_id       = decode(%f, 0, '''', %f), ' +
//                    'glacct_id_sales   = decode(%f, 0, '''', %f), ' +
//                    'freight_id        = decode(%f, 0, '''', %f), ' +
//                    'freight_price     = decode(%f, 0, '''', %f), ' +
//                    'ref_code_id       = decode(%f, 0, '''', %f), ' +
//                    'price_per_1000    = decode(%f, 0, '''', %f), ' +
//                    'ord_detail_id     = decode(%f, 0, '''', %f), ' +
//                    'salespeople_id    = decode(%f, 0, '''', %f), ' +
//                    'shipment_dtl_id   = decode(%f, 0, '''', %f), ' +
//                    'arinvt_id         = decode(%f, 0, '''', %f), ' +
//                    'eplant_id         = decode(%f, 0, '''', %f), ' +
//                    'from_order        = NVL(''%s'', ''N''),      ' +
//                    'cost_object_id    = decode(%f, 0, '''', %f), ' +
//                    'cost_object_source = ''%s'',  ' +
//                    'price_per_1000_YN = NVL(''%s'', ''N''), ' +
//                    'reference         = ''%s'', ' +
//                    'misc_po           = ''%s'' ' +
//                    'where id = %f',
//                    [FieldByname('misc_comment').asString,
//                     FieldByname('invoice_qty').asFloat, FieldByname('invoice_qty').asFloat,
//                     FieldByname('unit_price').asFloat, FieldByname('unit_price').asFloat,
//                     FieldByname('tax_code_id').asFloat, FieldByname('tax_code_id').asFloat,
//                     FieldByname('glacct_id_sales').asFloat, FieldByname('glacct_id_sales').asFloat,
//                     FieldByname('freight_id').asFloat, FieldByname('freight_id').asFloat,
//                     FieldByname('freight_price').asFloat, FieldByname('freight_price').asFloat,
//                     FieldByname('ref_code_id').asFloat, FieldByname('ref_code_id').asFloat,
//                     FieldByname('price_per_1000').asFloat, FieldByname('price_per_1000').asFloat,
//                     FieldByname('ord_detail_id').asFloat,      FieldByname('ord_detail_id').asFloat,
//                     FieldByname('salespeople_id').asFloat,     FieldByname('salespeople_id').asFloat,
//                     FieldByname('shipment_dtl_id').asFloat,    FieldByname('shipment_dtl_id').asFloat,
//                     FieldByname('arinvt_id').asFloat,          FieldByname('arinvt_id').asFloat,
//                     FieldByname('eplant_id').asFloat,          FieldByname('eplant_id').asFloat,
//                     FieldByname('from_order').asString,
//                     FieldByname('cost_object_id').asFloat,     FieldByname('cost_object_id').asFloat,
//                     FieldByname('cost_object_source').asString,
//                     FieldByname('price_per_1000_YN').asString,
//                     FieldByname('reference').asString,
//                     FieldByname('misc_po').asString,
//                     FieldByname('id').asFloat]);
////  IqTiming1.Stop('UpdateQryArPrepostDtl');
//end;
//
//procedure TFrmInvoice.InsertQryArPrepostDtl;
//var
//  AId:Real;
//begin
//  AId := QryARPrepostDetail.FieldByname('ID').asFloat;
//  if AId = 0 then
//    AId := GetNextID('ARPREPOST_DETAIL');
//  with QryARPrepostDetail do
//  ExecuteCommandFmt('insert into arprepost_detail ( ' +
//                    'arprepost_id      , ' +
//                    'id                , ' +
//                    'misc_comment      , ' +
//                    'invoice_qty       , ' +
//                    'unit_price        , ' +
//                    'tax_code_id       , ' +
//                    'glacct_id_sales   , ' +
//                    'freight_id        , ' +
//                    'freight_price     , ' +
//                    'ref_code_id       , ' +
//                    'price_per_1000    , ' +
//                    'ord_detail_id,       ' +
//                    'salespeople_id,      ' +
//                    'shipment_dtl_id,     ' +
//                    'arinvt_id,           ' +
//                    'eplant_id,           ' +
//                    'from_order,          ' +
//                    'cost_object_id,      ' +
//                    'cost_object_source,  ' +
//                    'price_per_1000_YN , ' +
//                    'reference         , ' +
//                    'misc_po          )  ' +
//                    'values           (  ' +
//                    '%f,                 ' +
//                    '%f,                 ' +
//                    '''%s'',             ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%.6f, 0, '''', %.6f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    'NVL(''%s'', ''N''), ' +
//                    'decode(%f, 0, '''', %f), ' +
//                    '''%s''                 , ' +
//                    'NVL(''%s'', ''N'')     , ' +
//                    '''%s''                 , ' +
//                    '''%s'') ',
//                    [QryArPrepost.FieldByname('id').asFloat,
//                     AId,
//                     FieldByname('misc_comment').asString,
//                     FieldByname('invoice_qty').asFloat, FieldByname('invoice_qty').asFloat,
//                     FieldByname('unit_price').asFloat, FieldByname('unit_price').asFloat,
//                     FieldByname('tax_code_id').asFloat, FieldByname('tax_code_id').asFloat,
//                     FieldByname('glacct_id_sales').asFloat, FieldByname('glacct_id_sales').asFloat,
//                     FieldByname('freight_id').asFloat, FieldByname('freight_id').asFloat,
//                     FieldByname('freight_price').asFloat, FieldByname('freight_price').asFloat,
//                     FieldByname('ref_code_id').asFloat, FieldByname('ref_code_id').asFloat,
//                     FieldByname('price_per_1000').asFloat, FieldByname('price_per_1000').asFloat,
//                     FieldByname('ord_detail_id').asFloat,      FieldByname('ord_detail_id').asFloat,
//                     FieldByname('salespeople_id').asFloat,     FieldByname('salespeople_id').asFloat,
//                     FieldByname('shipment_dtl_id').asFloat,    FieldByname('shipment_dtl_id').asFloat,
//                     FieldByname('arinvt_id').asFloat,          FieldByname('arinvt_id').asFloat,
//                     FieldByname('eplant_id').asFloat,          FieldByname('eplant_id').asFloat,
//                     FieldByname('from_order').asString,
//                     FieldByname('cost_object_id').asFloat,     FieldByname('cost_object_id').asFloat,
//                     FieldByname('cost_object_source').asString,
//                     FieldByname('price_per_1000_YN').asString,
//                     FieldByname('reference').asString,
//                     FieldByname('misc_po').asString]);
//end;

//procedure TFrmInvoice.DeleteQryArPrepostDtl;
//begin
//  ExecuteCommandFmt('delete from arprepost_detail where id = %f',
//    [FDetailId]);
//end;

procedure TFrmInvoice.DeletePhantomOrderDetailComponents( AOrd_Detail_ID: Int64);
begin
  ExecuteCommandFmt('begin ar_phantom.delete_child_details(%d); end;', [ AOrd_Detail_ID ]);
end;

procedure TFrmInvoice.QryARPrepostDetailAfterCancel(DataSet: TDataSet);
begin
  FTotalQtyChanged := False;
end;

procedure TFrmInvoice.QryARPrepostDetailAfterDelete(DataSet: TDataSet);
var
  AId:Real;
  ACommId, APrcnt, ACount, APrcntPortion, AMinId, ASum, APrcnt2, AMinId2:Real;
begin
//  cbCustComm.visible := false;
//  try
//    if CBMisc.Checked and cbCustComm.Checked then
//    begin
//       ACommId := SelectValueFmtAsFloat('select NVL(commissions_id, -100000000) from arcusto where id = %f', [QryArPrePostARCUSTO_ID.asFloat]);
//       APrcnt := SelectValueFmtAsFloat('select NVL(comm_pcnt, -100000000) from arcusto where id = %f', [QryArPrePostARCUSTO_ID.asFloat]);
//       if (ACommId <> -100000000) and (APrcnt <> -100000000) then
//       begin
//         ExecuteCommandFmt('insert into arprepost_comm (arprepost_detail_id, salespeople_id, commission_percent) ' +
//                   ' select %f, salespeople_id, commission_percent from commissions_detail where commissions_id = %f',
//                   [QryARPrepostDetailID.asFloat, ACommId]);
//
//
////         ACount := SelectValueFmtAsFloat('select count(id) from arprepost_comm where arprepost_detail_id = %f', [QryARPrepostDetailID.asFloat]);
////         APrcntPortion := APrcnt/ACount;
//         with TFDQuery.Create(nil) do
//         try
//           Connection := db_dm.FDConnection;
//           Sql.Add(Format('select id from arprepost_comm where arprepost_detail_id = %f order by id', [QryARPrepostDetailID.asFloat]));
//           Open;
//           AMinId := FieldByName('id').asfloat;
////           while not eof do
////           begin
////             ExecuteCommandFmt('update arprepost_comm set commission_percent = %.6f where id = %f', [APrcntPortion, FieldByName('ID').asFloat]);
////             next;
////           end;
//         finally
//           free;
//         end;
//
//         ASum := SelectValueFmtAsFloat('select sum(commission_percent) from arprepost_comm where arprepost_detail_id = %f', [QryARPrepostDetailID.asFloat]);
//         if ASum > APrcnt then
//         begin
//           ExecuteCommandFmt('begin ar.ReducePrepostComm(%f, %.6f); end;', [QryARPrepostDetailID.asFloat, APrcnt]);
//{
//           APrcntPortion := ASum - APrcnt;
//           while APrcntPortion > 0 do
//           begin
//             AMinId2 := SelectValueFmtAsFloat('select min(id) from arprepost_comm where arprepost_detail_id = %f and commission_percent <= %.6f', [QryARPrepostDetailID.asFloat, APrcntPortion]);
//             if AMinId2 <> 0 then
//             begin
//               APrcnt2 :=  SelectValueFmtAsFloat('select commission_percent from arprepost_comm where id = %f', [AMinId2]);
//               ExecuteCommandFmt(' delete from arprepost_comm where id = %f', [AMinId2]);
//               APrcntPortion := APrcntPortion - APrcnt2;
//             end
//             else
//             begin
//               AMinId2 := SelectValueFmtAsFloat('select min(id) from arprepost_comm where arprepost_detail_id = %f', [QryARPrepostDetailID.asFloat]);
//               ExecuteCommandFmt('update arprepost_comm set commission_percent = commission_percent - %.6f where id = %f', [APrcntPortion, AMinId]);
//               APrcntPortion := 0;
//             end;
//           end;
//}
//         end
//         else if ASum < APrcnt then
//         begin
//           APrcntPortion := APrcnt - ASum;
//           ExecuteCommandFmt('update arprepost_comm set commission_percent = commission_percent + %.6f where id = %f', [APrcntPortion, AMinId]);
//         end;
//
//       end;
//    end;
//
//    // 04/12/2016 Delete phantom children
//    if FIsDeletedOrdDetailPhantom then
//      DeletePhantomOrderDetailComponents(FDeletedOrd_Detail_ID);
//    FDeletedOrd_Detail_ID := 0;
//    FIsDeletedOrdDetailPhantom := False;
//
//    ReopenQryArPrePostDetail;
////    if QryArPrePostDetail.Eof and QryArPrePostDetail.Bof then
////    begin
////      ExecuteCommandFmt('update arprepost set ctrl_eplant_id = null, ' +
////                'glacct_id_ar = plugins.get_glacct_id_with_eplant_id(''acct_id_ar'', %f) where id = %f',
////                [QryArPrePost.FIeldByName('EPLANT_ID').asFloat, QryArPrePost.FieldByname('ID').asFloat]);
////      ReopenQryArPrePost;
////    end;
//    try
//      QryOrd.DisableControls;
//      QryShip.DisableControls;
//      CBMisc.Checked := False;
//      cbCustComm.Checked := False;
//      ViewArPrepostDetailTotals.Refresh;
//    finally
//      QryOrd.EnableControls;
//      QryShip.EnableControls;
//    end;
//  except on E:Exception do
//    with QryARPrepostDetail do
//    begin
//      CancelUpdates;
//      raise;
//    end;
//  end;
end;

procedure TFrmInvoice.QryARPrepostDetailAfterPost(DataSet: TDataSet);
var
  AId:Real;
  ACommId, APrcnt, ACount, APrcntPortion, AMinId, ASum, APrcnt2, AMinId2:Real;
begin
//removed for demo
end;

procedure TFrmInvoice.wwTaxCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    QryARPrepostDetail.FieldByname('tax_code_id').asFloat :=
      LookupTable.FieldByname('id').asFloat;
    QryARPrepostDetailTAX_CODE.AsString :=  LookupTable.FieldByname('TAX_CODE').asString;
//    wwTax.Text :=  LookupTable.FieldByname('TAX_CODE').asString;
  end;

end;

procedure TFrmInvoice.wwGlAcctCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    if FDetailSaleseAcctId <> 0 then
    begin
      QryARPrepostDetail.FieldByname('glacct_id_sales').asFloat := FDetailSaleseAcctId;
      QryARPrepostDetailGLACCT.AsString := FDetailSaleseAcct;
      QryARPrepostDetail.FieldByName('GLACCT_DESCRIP').asString :=
        SelectValueFmtAsString('select descrip from glacct where id = %f', [FDetailSaleseAcctId]);
    //  wwGlAcct.Text := FDetailSaleseAcct;
    end
    else
    begin
      QryARPrepostDetail.FieldByname('glacct_id_sales').asFloat :=
      LookupTable.FieldByname('id').asFloat;
      QryARPrepostDetailGLACCT.AsString :=  LookupTable.FieldByname('acct').asString;
      QryARPrepostDetail.FieldByName('GLACCT_DESCRIP').asString :=
        SelectValueFmtAsString('select descrip from glacct where id = %f', [LookupTable.FieldByname('id').asFloat]);
    //  wwGlAcct.Text :=  LookupTable.FieldByname('acct').asString;
    end;
  end;
end;

procedure TFrmInvoice.wwFreightCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
//  if modified then
//  begin
//    QryARPrepostDetail.FieldByname('freight_id').asFloat :=
//      LookupTable.FieldByname('id').asFloat;
//    QryARPrepostDetailFREIGHT_COMP.AsString :=  LookupTable.FieldByname('DESCRIP').asString;
//    wwFreight.Text :=  LookupTable.FieldByname('DESCRIP').asString;
//
//  end;
end;

procedure TFrmInvoice.QryARPrepostDetailNewRecord(DataSet: TDataSet);
var
  ATaxCodeId:Real;
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  if (fPrior = 'Y') or (CBMisc.Checked) then
  begin
    QryArPrePostDetail.FieldByName('INVOICE_QTY').asInteger := 1;

    if QryArPrepost.FIeldByName('EPLANT_ID').asFloat = 0 then
    begin
      if CBMisc.Checked then
        QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_extchg'') from dual')
      else
        QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_sales'') from dual');
    end
    else
    begin
      QryArPrePostDetail.FieldByName('EPLANT_ID').asFloat := QryArPrepost.FIeldByName('EPLANT_ID').asFloat;
      if CBMisc.Checked then
        QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat :=
          SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_extchg'', %f) from dual',
          [QryArPrepost.FIeldByName('EPLANT_ID').asFloat])
      else
        QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat :=
          SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_sales'', %f) from dual',
          [QryArPrepost.FIeldByName('EPLANT_ID').asFloat]);
    end;

//    if (SelectValueFmtAsString('select NVL(COST_SOURCE_RQD, ''N'') from glacct where id = %f', [QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat]) = 'Y') then
//      QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').Clear;


    QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat := 0;
//    if CBMisc.Checked and wwRE.Showing = False then wwRE.Execute;
//    if CBMisc.Checked and (Trim(TblArPrePostDetail.FieldByName('MISC_COMMENT').asString) = '') then Vcl.wwMemo.Execute;
    if CBMisc.Checked  then
    begin
      ATaxCodeId := SelectValueFmtAsFloat('select tax_codes_id from arcusto where id = %f', [QryArPrePostARCUSTO_ID.asFloat]);
      if ATaxCodeId <> 0 then
        QryARPrepostDetailTAX_CODE_ID.asFloat := ATaxCodeId;
      QryArPrePostDetail.FieldByName('ID').asFloat := GetNextID('ARPREPOST_DETAIL');
//      GridInvoiceDetail.SetActiveField('MISC_COMMENT');
      DisplayMemoDlg;
    end;
  end
  else
  begin
    QryArPrePostDetail.Cancel;
  end;

end;

procedure TFrmInvoice.QryARPrepostDetailBeforeDelete(DataSet: TDataSet);
begin
  CheckCashInAdv;
  CheckARIndivUser;
  if QryArPrePostARINVOICE_ID.asFloat <> 0 then
  raise exception.create('Cannot delete a Credit Memo detail.');
  FDetailId := QryArPrepostDetail.FieldByname('id').AsLargeInt;
  FDeletedOrd_Detail_ID := QryARPrepostDetailORD_DETAIL_ID.AsLargeInt;
  FIsDeletedOrdDetailPhantom := QryARPrepostDetailPHANTOM.AsString = 'Y';
  FPostingState:= psDelete;
  FTotalQtyChanged := False;
end;

procedure TFrmInvoice.QryARPrepostDetailBeforeEdit(DataSet: TDataSet);
begin
//  CheckCreditMemo;
  CheckCashInAdv;
  CheckARIndivUser;
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  FUnitPrice := QryARPrepostDetailUNIT_PRICE.asFloat;
  FInvoiceQty := QryARPrepostDetailINVOICE_QTY.asFloat;
  FFreightPrice := QryARPrepostDetailFREIGHT_PRICE.AsFloat;
  FTotalQtyChanged := False;
end;


procedure TFrmInvoice.QryARPrepostDetailAfterScroll(DataSet: TDataSet);
begin
  CheckPageControl(QryArPrePostDetail);
  if QryArPrepost.FieldByname('EPLANT_ID').asFloat <> 0 then
  begin
    wwQryGLAcct.Close;
    AssignQueryParamValue(wwQryGLAcct, 'ADummy', 0);
    AssignQueryParamValue(wwQryGLAcct, 'AID', QryArPrepost.FieldByname('EPLANT_ID').AsLargeInt);
    wwQryGLAcct.Open;

    wwQryGLAcct_Freight.Close;
    AssignQueryParamValue(wwQryGLAcct_Freight, 'ADummy', 0);
    AssignQueryParamValue(wwQryGLAcct_Freight, 'AID', QryArPrepost.FieldByname('EPLANT_ID').AsLargeInt);
    wwQryGLAcct_Freight.Open;


    wwQryGLAcctDtlSales.Close;
    AssignQueryParamValue(wwQryGLAcctDtlSales, 'ADummy', 0);
    AssignQueryParamValue(wwQryGLAcctDtlSales, 'AID', QryArPrepost.FieldByname('EPLANT_ID').AsLargeInt);
    wwQryGLAcctDtlSales.Open;
  end
  else
  begin
    wwQryGLAcct.Close;
    AssignQueryParamValue(wwQryGLAcct, 'ADummy', 1);
    wwQryGLAcct.Open;

    wwQryGLAcct_Freight.Close;
    AssignQueryParamValue(wwQryGLAcct_Freight, 'ADummy', 1);
    wwQryGLAcct_Freight.Open;


    wwQryGLAcctDtlSales.Close;
    AssignQueryParamValue(wwQryGLAcctDtlSales, 'ADummy', 1);
    wwQryGLAcctDtlSales.Open;
  end
end;

procedure TFrmInvoice.NavItwmsBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    ReopenQryArPrePostDetail;
    Abort;
  end;
end;

procedure TFrmInvoice.QryARPrepostDetailBeforePost(DataSet: TDataSet);
begin
  with QryArPrePostDetail do
  begin

    case DataSet.State of
      dsInsert: FPostingState:= psInsert;
      dsEdit  : FPostingState:= psEdit;
    else
      FPostingState:= psNone;
    end;

    if not FAssigningCostSource then
    try
      if QryARPrepostDetailGLACCT_ID_SALES.AsFloat <> 0 then
        if (SelectValueFmtAsString('select NVL(COST_SOURCE_RQD, ''N'') from glacct where id = %f', [QryARPrepostDetailGLACCT_ID_SALES.AsFloat]) = 'Y') and (QryARPrepostDetailCOST_OBJECT_SOURCE.asString  = '') then
           raise exception.create(cTXT0000093);
    finally
      FAssigningCostSource := false;
    end;
    FAssigningCostSource := false;


//    if (QryArPrePost.FieldByName('ARINVOICE_ID').asFloat <> 0) and
//       (FieldByName('INVOICE_QTY').asFloat <> 1) then
//      raise exception.Create(cTXT0000055); // 'For a Credit Memo, the Invoice quantity must be 1.'

    if (FieldByName('FREIGHT_PRICE').asFloat <> 0) and (FieldByName('FREIGHT_ID').asFloat = 0) then
      raise Exception.Create(cTXT0000056); // 'Please select a Freight company.'

    if FieldByName('FREIGHT_ID').asFloat <> 0 then
      if  QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat = 0 then
//      if SelectValueAsFloat(Format('select glacct_id_freight from freight where id = %f', [FieldByName('FREIGHT_ID').asFloat])) = 0 then
      raise Exception.Create(cTXT0000057); // 'Please assign a GL account to the freight company.'

    if QryARPrepostDetail.FieldByname('ID').asFloat = 0 then
      QryARPrepostDetail.FieldByname('ID').asFloat := GetNextID('ARPREPOST_DETAIL');


    if (FieldByName('FREIGHT_PRICE').asFloat <> 0)
       and (SelectValueFmtAsFloat('select orig_freight_price from arprepost_detail where id = %f', [QryARPrepostDetail.FieldByname('ID').asFloat]) = 0) then
       ExecuteCommandFmt('update arprepost_detail set orig_freight_price = %f where id = %f',
       [FieldByName('FREIGHT_PRICE').asFloat,
        QryARPrepostDetail.FieldByname('ID').asFloat]);

    if QryARPrepostDetail.FieldByname('ARPREPOST_ID').asFloat = 0 then
      QryARPrepostDetail.FieldByname('ARPREPOST_ID').asFloat := QryArPrepost.FieldByname('id').asFloat;

    if QryARPrepostDetail.FieldByname('ARPREPOST_ID').asFloat = 0 then
      QryARPrepostDetail.FieldByname('ARPREPOST_ID').asFloat := QryArPrepost.FieldByname('id').asFloat;

  end;

end;

procedure TFrmInvoice.QryARPrepostDetailBeforeInsert(DataSet: TDataSet);
begin
   if (QryArPrePost.FieldByName('ARINVOICE_ID').asFloat <> 0) then
      raise exception.Create(cTXT0000058); // 'Only one detail record is allowed in a Credit Memo.'

  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  FUnitPrice := 0;
  FInvoiceQty := 0;
  FFreightPrice := 0;

end;

//procedure TFrmInvoice.QryArPrePostUpdateRecord(DataSet: TDataSet;
//  UpdateKind: TFDPhysUpdateRequest; var UpdateAction: TFDErrorAction);
//begin
//  with DataSet do
//    case UpdateKind of
//      arUpdate: UpdateQryArPrepost;
//      arInsert: InsertQryArPrepost;
//      arDelete: DeleteQryArPrepost;
//    end;
//  AAction := eaApplied;
//end;

//procedure TFrmInvoice.UpdateQryArPrepost;
//begin
//  with QryArPrepost do
//  ExecuteCommandFmt('update arprepost set ' +
//            'glperiods_id_ar = decode(%f, 0, '''', %f)        , ' +
//            'arcusto_id      = decode(%f, 0, '''', %f)        , ' +
//            'bill_to_id      = decode(%f, 0, '''', %f)        , ' +
//            'terms_id        = decode(%f, 0, '''', %f)        , ' +
//            'glacct_id_ar    = decode(%f, 0, '''', %f)        , ' +
//            'currency_id     = decode(%f, 0, '''', %f)        , ' +
//            'arinvoice_id    = decode(%f, 0, '''', %f)        , ' +
//            'eplant_id       = decode(%f, 0, '''', %f)        , ' +
//            'ctrl_eplant_id  = decode(%f, 0, '''', %f)        , ' +
//            'glacct_id_fx    = decode(%f, 0, '''', %f)        , ' +
//            'invoice_no      = ''%s''                         , ' +
//            'invoice_date    = To_date(''%s'', ''MM/DD/RRRR''), ' +
//            'due_date        = To_date(''%s'', ''MM/DD/RRRR''), ' +
//            'notes           = ''%s''                         , ' +
//            'prior_entry     = NVL(''%s'', ''N'')             , ' +
//            'on_hold         = NVL(''%s'', ''N'')             , ' +
//            'ecode           = ''%s''                         , ' +
//            'inv_prefix      = ''%s''                         , ' +
//            'from_order      = NVL(''%s'', ''N'')             , ' +
//            'userid          = ''%s'' '                           +
//            'where id = %f',
//            [FieldByName('glperiods_id_ar').asFloat,      FieldByName('glperiods_id_ar').asFloat,
//             FieldByName('arcusto_id').asFloat,           FieldByName('arcusto_id').asFloat,
//             FieldByName('bill_to_id').asFloat,           FieldByName('bill_to_id').asFloat,
//             FieldByName('terms_id').asFloat,             FieldByName('terms_id').asFloat,
//             FieldByName('glacct_id_ar').asFloat,         FieldByName('glacct_id_ar').asFloat,
//             FieldByName('currency_id').asFloat,          FieldByName('currency_id').asFloat,
//             FieldByName('arinvoice_id').asFloat,         FieldByName('arinvoice_id').asFloat,
//             FieldByName('eplant_id').asFloat,            FieldByName('eplant_id').asFloat,
//             FieldByName('ctrl_eplant_id').asFloat,       FieldByName('ctrl_eplant_id').asFloat,
//             FieldByName('glacct_id_fx').asFloat,         FieldByName('glacct_id_fx').asFloat,
//             FieldByName('invoice_no').asString,
//             FormatDateTime('mm/dd/yyyy', FieldByName('invoice_date').asDateTime),
//             FormatDateTime('mm/dd/yyyy', FieldByName('due_date').asDateTime),
//             FieldByName('notes').asString,
//             FieldByName('prior_entry').asString,
//             FieldByName('on_hold').asString,
//             FieldByName('ecode').asString,
//             FieldByName('inv_prefix').asString,
//             FieldByName('from_order').asString,
//             FieldByName('userid').asString,
//             FieldByName('id').asFloat]);
//end;
//
//procedure TFrmInvoice.InsertQryArPrepost;
//begin
//  with QryArPrepost do
//  ExecuteCommandFmt(' insert into arprepost ( ' +
//                          'id              , ' +
//                          'glperiods_id_ar , ' +
//                          'arcusto_id      , ' +
//                          'bill_to_id      , ' +
//                          'terms_id        , ' +
//                          'glacct_id_ar    , ' +
//                          'currency_id     , ' +
//                          'arinvoice_id    , ' +
//                          'eplant_id       , ' +
//                          'ctrl_eplant_id  , ' +
//                          'glacct_id_fx    , ' +
//                          'invoice_no      , ' +
//                          'invoice_date    , ' +
//                          'due_date        , ' +
//                          'notes           , ' +
//                          'prior_entry     , ' +
//                          'on_hold         , ' +
//                          'ecode           , ' +
//                          'inv_prefix      , ' +
//                          'from_order      , ' +
//                          'userid          ) ' +
//                          'values         (  ' +
//                          '%f,               ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          'decode(%f, 0, '''', %f), ' +
//                          '''%s'',                  ' +
//                          'To_date(''%s'', ''MM/DD/RRRR''), ' +
//                          'To_date(''%s'', ''MM/DD/RRRR''), ' +
//                          '''%s'',                  ' +
//                          'NVL(''%s'', ''N''),      ' +
//                          'NVL(''%s'', ''N''),      ' +
//                          '''%s'',                  ' +
//                          '''%s'',                  ' +
//                          'NVL(''%s'', ''N''),      ' +
//                          '''%s'')',
//            [FieldByName('id').asFloat,
//             FieldByName('glperiods_id_ar').asFloat,      FieldByName('glperiods_id_ar').asFloat,
//             FieldByName('arcusto_id').asFloat,           FieldByName('arcusto_id').asFloat,
//             FieldByName('bill_to_id').asFloat,           FieldByName('bill_to_id').asFloat,
//             FieldByName('terms_id').asFloat,             FieldByName('terms_id').asFloat,
//             FieldByName('glacct_id_ar').asFloat,         FieldByName('glacct_id_ar').asFloat,
//             FieldByName('currency_id').asFloat,          FieldByName('currency_id').asFloat,
//             FieldByName('arinvoice_id').asFloat,         FieldByName('arinvoice_id').asFloat,
//             FieldByName('eplant_id').asFloat,            FieldByName('eplant_id').asFloat,
//             FieldByName('ctrl_eplant_id').asFloat,       FieldByName('ctrl_eplant_id').asFloat,
//             FieldByName('glacct_id_fx').asFloat,         FieldByName('glacct_id_fx').asFloat,
//             FieldByName('invoice_no').asString,
//             FormatDateTime('mm/dd/yyyy', FieldByName('invoice_date').asDateTime),
//             FormatDateTime('mm/dd/yyyy', FieldByName('due_date').asDateTime),
//             FieldByName('notes').asString,
//             FieldByName('prior_entry').asString,
//             FieldByName('on_hold').asString,
//             FieldByName('ecode').asString,
//             FieldByName('inv_prefix').asString,
//             FieldByName('from_order').asString,
//             FieldByName('userid').asString]);
//end;

//procedure TFrmInvoice.DeleteQryArPrepost;
//begin
//  ExecuteCommandFmt('delete from arprepost where id = %f',
//    [FHeaderId]);
//end;

procedure TFrmInvoice.QryArPrePostBeforeDelete(DataSet: TDataSet);
begin
//  if Avalara.AvalaraEnabled(QryArPrepostEPLANT_ID.AsFloat) then
//    begin
//      with TAvalaraGetTax.Create(self) do
//        try
//          DeleteTax('ARPREPOST', QryArPrepostID.AsFloat);
//        finally
//          Free;
//        end;
//    end;
//  Record_Skipped_Seq('AR', 'ARPREPOST', 'INVOICE_NO', QryArPrepost.FieldByName('INVOICE_NO').asString, QryArPrepost.FieldByName('INVOICE_NO').asString, SKIP_SEQ_DELETE);
  FHeaderId := QryArPrepost.FieldByname('id').asFloat;
end;

procedure TFrmInvoice.QryArPrePostAfterInsert(DataSet: TDataSet);
begin
  SelectCustomerScope;
  AssignDefaults;
  FCustomerId := QryArPrePost.FieldByName('ARCUSTO_ID').asFloat;
  if fPrior = 'N' then
  begin
    QryArPrePost.FieldByName('INVOICE_NO').asString := GetNewInvoiceNumber(QryArPrePost.FieldByName('EPLANT_ID').asFloat);
    FOldInvoiceNo := QryArPrePost.FieldByName('INVOICE_NO').asString;
  end;
end;

procedure TFrmInvoice.QryArPrePostBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}

  with DataSet do
  begin
    if Filter > '' then
      Filter := Format('(%s) and ', [Filter]) + Format('PRIOR_ENTRY = ''%s''', [fPrior])
    else
      Filter := Format('PRIOR_ENTRY = ''%s''', [fPrior]);
    Filtered := True;
  end;
end;

procedure TFrmInvoice.QryArPrePostBeforePost(DataSet: TDataSet);
var
  ASql, ASql2, AStr:String;
  AConfirm:Integer;
  AQry:TFDQuery;
  ADontShow:Boolean;
  AType:Integer;
begin
////  IqTiming1.Start('QryArPrePostBeforePost');
//  CheckCashInAdv;
//  try
//    with QryARPrePost do
//    begin
//      if FieldByName('EPLANT_ID').asFloat = 0 then
//      begin
//        ASql := 'select count(id) from arinvoice where eplant_id is null';
//        ASql2 := 'select id from arprepost where eplant_id is null';
//      end
//      else
//      begin
//        ASql := Format('select count(id) from arinvoice where eplant_id = %f', [FieldByName('EPLANT_ID').asFloat]);
//        ASql2 := Format('select id from arprepost where eplant_id = %f', [FieldByName('EPLANT_ID').asFloat]);
//      end;
//
////        if SelectValueFmtAsFloat(ASql + ' and invoice_no = ''%s''', [FieldByName('INVOICE_NO').asString]) <> 0 then
////          raise Exception.Create('Invoice number exists in posted invoices, please change it');
//
////      if FMultiCurrency and (FieldByName('CURRENCY_ID').asFloat = 0) then
////        FieldByName('CURRENCY_ID').asFloat := SelectValueAsFloat('select currency_id from iqsys');
//
//      if FMultiCurrency and (FieldByName('CURRENCY_ID').asFloat = 0) then
//        FieldByName('CURRENCY_ID').asFloat := GetEplantNativeCurrencyId; {in McShare.pas}
//
//      if FieldByName('USERID').AsString = '' then
//        FieldByName('USERID').AsString        := SecurityManager.UserName;
//
//      if not DBEditInvoice.ReadOnly then
//      begin
//        if State in [dsEdit, dsInsert] then
//
//
//        if ((SelectValueFmtAsFloat(ASql + ' and upper(RTrim(LTrim(invoice_no))) = upper(''%s'')', [StrTran(Trim(FieldbyName('invoice_no').asstring), '''', '''''')]) <>  0)  or
//           (SelectValueFmtAsFloat(ASql2 + ' and upper(RTrim(LTrim(invoice_no))) = upper(''%s'') and id <> %f',
//                         [StrTran(Trim(FieldbyName('invoice_no').asstring), '''', ''''''), FieldByName('id').asfloat]) <> 0 ))  and
//                         not fInset  then
//        raise Exception.Create(Format(cTXT0000059, // 'Invoice# %s already exists'
//                               [Trim(FieldByName('INVOICE_NO').asstring)]));
//        if FOldInvoiceNo <> FieldByName('INVOICE_NO').asstring then
//          Record_Skipped_Seq('AR', 'ARPREPOST', 'INVOICE_NO', FOldInvoiceNo, StrTran(Trim(FieldbyName('invoice_no').asstring), '''', ''''''), SKIP_SEQ_CHANGE);
//      end;
//
//      if (FieldByName('INVOICE_DATE').asDateTime > FieldByName('END_DATE').asDateTime) or
//         (FieldByName('INVOICE_DATE').asDateTime < FieldByName('Start_DATE').asDateTime) then
//      begin
////        if IqConfirmYN(Format('The Invoice date (%s) does not fall within the Period dates (%s - %s)' + #13 +
////                              'Do you wish to change the invoice date?',
////                              [FormatDateTime('dd/mmm/yy', FieldByName('INVOICE_DATE').asDateTime),
////                               FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
////                               FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)])) then Abort;
//
//        // 'The Invoice date (%s) does not fall within the Period dates (%s - %s)'
//        AStr := Format(cTXT0000060,
//                       [FormatDateTime('dd/mmm/yy', FieldByName('INVOICE_DATE').asDateTime),
//                        FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
//                        FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
////        AConfirm := APConfirmDateChange(AStr);  {in APConf.pas}
//
//          AConfirm:= True;
////        AConfirm := True; IQDialogChkEx( TFrmApArConf, AStr, 'AR_ConfirmDateChange' );
//
////        if IQRegIntegerScalarRead( self, 'AR_ConfirmDateChange', AType ) then
////        begin
////          if AType = 0 then
////          begin
////            AConfirm := APConfirmDateChange(AStr, ADontShow);  {in APConf.pas}
////            if ADontShow then
////              IQRegIntegerScalarWrite( self, 'AR_ConfirmDateChange', 1);
////          end
////          else
////            AConfirm := 0;
////        end
////        else
////        begin
////            AConfirm := APConfirmDateChange(AStr, ADontShow);  {in APConf.pas}
////            if ADontShow then
////              IQRegIntegerScalarWrite( self, 'AR_ConfirmDateChange', 1);
////        end;
//
//
//        if AConfirm = 1 then
//        begin
//
//          AQry := TFDQuery.Create(self);
//          try
//            AQry.Connection := db_dm.FDConnection;
//            Aqry.Sql.Add(Format('select id, period, start_date, end_date from glperiods where ' +
//                                 'To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
//                                 [FormatDateTime('mm/dd/yyyy', FieldByName('INVOICE_DATE').asDateTime)]));
//            AQry.Open;
//            if not AQry.Eof then
//            begin
//              FieldByName('GLPERIODS_ID_AR').asFloat := AQry.FieldByName('id').asFloat;
//              FieldByName('start_date').asDateTime   := AQry.FieldByName('start_date').asDateTime;
//              FieldByName('end_date').asDateTime     := AQry.FieldByName('end_date').asDateTime;
//              FieldByName('period').asstring         := AQry.FieldByName('period').asString;
//            end;
//          finally
//            AQry.Free;
//          end;
//        end
//        else if AConfirm = 2 then
//        begin
//          if PageControl1.ActivePage = TabForm then
//            DBEditInvDate.SetFocus;
//          Abort;
//        end;
//      end;
//
//
//
//      fInset:= False;
//
//
//      if FieldByName('DUE_DATE').asDateTime = 0
//        then FieldByName('DUE_DATE').asDateTime :=
//             FieldByName('INVOICE_DATE').asDateTime;
//      FieldByName('PRIOR_ENTRY').asString := fPrior;
//
//
//    end;
//    if FChangeDueDate then AssignDueDate;
//
//    if QryARPrePost.FieldByName('ID').asBCD = 0 then
//      QryARPrePost.FieldByName('ID').Value := GetNextID('ARPREPOST');
//
//
//  finally
//    Screen.Cursor := crDefault;
//  end;
//  IqTiming1.Stop('QryArPrePostBeforePost');
end;

procedure TFrmInvoice.QryArPrePostTERMS_IDChange(Sender: TField);
begin
//  with TFDQuery.Create(self) do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(Format('select t.days, NVL(t.based_on, ''I'') as based_on, t.end_of_month, t.day_of_month ' +
//                   'from terms t where t.id = %f',
//                   [QryArPrePostTERMS_ID.asFloat]));
//    Open;
//    if not (eof and bof) then
//    begin
//      QryArPrePost.FieldByName('TERMDAYS').asInteger    := FieldByName('DAYS').asInteger;
//      QryArPrePost.FieldByName('TERMSBASEDON').asString := FieldByName('BASED_ON').asString;
//      QryArPrePost.FieldByName('END_OF_MONTH').asString  := FieldByName('END_OF_MONTH').asString;
//      QryArPrePost.FieldByName('DAY_OF_MONTH').asInteger := FieldByName('DAY_OF_MONTH').asInteger;
//    end;
//  finally
//    Free;
//  end;
//  AssignDueDate;
end;

procedure TFrmInvoice.QryArPrePostINVOICE_DATEChange(Sender: TField);
//var
//  AQry:TFDQuery;
begin

//  AQry := TFDQuery.Create(self);
//  try
//    AQry.Connection := db_dm.FDConnection;
//    Aqry.Sql.Add(Format('select id, period, start_date, end_date from glperiods where ' +
//                         'To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date',
//                         [FormatDateTime('mm/dd/yyyy', QryARPrePost.FieldByName('INVOICE_DATE').asDateTime)]));
//    AQry.Open;
//    if not AQry.Eof then
//    begin
//      QryARPrePost.FieldByName('GLPERIODS_ID_AR').asFloat := AQry.FieldByName('id').asFloat;
//      QryARPrePost.FieldByName('start_date').asDateTime   := AQry.FieldByName('start_date').asDateTime;
//      QryARPrePost.FieldByName('end_date').asDateTime     := AQry.FieldByName('end_date').asDateTime;
//      QryARPrePost.FieldByName('period').asstring         := AQry.FieldByName('period').asString;
//    end;
//  finally
//    AQry.Free;
//  end;



//  with QryARPrePost do
//  begin
//    FieldByName('GLPERIODS_ID_AR').asFloat :=
//      SelectValueAsFloat(Format('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date',
//        [FormatDateTime('mm/dd/yyyy', FieldByName('INVOICE_DATE').asDateTime)]));
//  end;
end;

procedure TFrmInvoice.NavBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  CloseInvoiceItems;
  if Button = nbRefresh then
  begin
    ReopenQryArPrePost;
    Abort;
  end;
  if (Button in [nbFirst, nbPrior, nbNext, nbLast]) then
    if not CheckTaxCalculated then
      System.SysUtils.Abort;
end;

procedure TFrmInvoice.ReopenQryArPrePost;
var
  AID:Real;
begin
  try
    begin
      QryShip.Close;
      QryOrd.Close;
      QryVmi.Close;
    end;

    QryArPrepostDetail.DataSource := nil;
    QryShip.DataSource := nil;
    QryOrd.DataSource := nil;
    ViewArPrepostDetailTotals.MasterSource := nil;
    AID := QryArPrepost.FieldByName('ID').asFloat;
//    IqTiming1.Start('Reopen(QryArPrepost)');
//    IqTiming1.Start('QryArPrepost.close');
    QryArPrepost.close;
//    IqTiming1.Stop('QryArPrepost.close');
//    IqTiming1.Start('QryArPrepost.open');
    QryArPrepost.open;
//    IqTiming1.Stop('QryArPrepost.open');
    QryArPrepost.DisableControls;
//    Reopen(QryArPrepost);
//    IqTiming1.Stop('Reopen(QryArPrepost)');
//    IqTiming1.Start('Locate');
    QryArPrepost.Locate('ID', AID, []);
    dbWWBillToDropDown(nil);
    QryBillTo.Locate('ID', QryArprepostBILL_TO_ID.asFloat, []);
//    dbWWBillTo.text := QryBillToATTN.AsString;

//    IqTiming1.Stop('Locate');
  finally
    QryArPrepost.EnableControls;
//    IqTiming1.Start('QryArPrepostDetail.DataSource := SrcArPrePost');
    QryArPrepostDetail.DataSource        := SrcArPrePost;
//    IqTiming1.Stop('QryArPrepostDetail.DataSource := SrcArPrePost');
//    IqTiming1.Start('QryShip.DataSource');
    QryShip.DataSource                   := SrcArPrePost;
    QryOrd.DataSource                    := SrcArPrePost;

//    IqTiming1.Stop('QryShip.DataSource');
//    IqTiming1.Start('QryOrd.DataSource');
//    IqTiming1.Stop('QryOrd.DataSource');
//    IqTiming1.Start('ViewArPrepostDetailTotals.MasterSource');
    ViewArPrepostDetailTotals.MasterSource := SrcArPrePost;
//    IqTiming1.Stop('ViewArPrepostDetailTotals.MasterSource');
  end;
end;


procedure TFrmInvoice.ReopenQryArPrePostDetail(ID:Real = 0);
var
  AID:Real;
begin
//  IqTiming1.Start('Reopen(QryArPrepostDetail)');
  try
//    IqTiming1.Start('QryArPrePostDetail.DisableControls');
    QryArPrePostDetail.DisableControls;
//    IqTiming1.Stop('QryArPrePostDetail.DisableControls');
//    IqTiming1.Start('QryComments.DataSource');
    QryComments.DataSource := nil;
    QryShipment.DataSource := nil;
    QryOrder.DataSource := nil;
    TblComm.MasterSource := nil;
//    IqTiming1.Stop('QryComments.DataSource');
    if ID <> 0 then
      AID := ID
    else
      AID := QryArPrepostDetail.FieldByName('ID').asFloat;
    QryArPrepostDetail.close;
//    IqTiming1.Start('QryArPrepostDetail.open');
    QryArPrepostDetail.open;
//    IqTiming1.Stop('QryArPrepostDetail.open');
//    IqTiming1.Start('QryArPrepostDetail.Locate');
    QryArPrepostDetail.Locate('ID', AID, []);
//    IqTiming1.Stop('QryArPrepostDetail.Locate');
  finally
//    IqTiming1.Start('QryComments.DataSource');
    QryComments.DataSource        := SrcArPrePostDetail;
//    IqTiming1.Stop('QryComments.DataSource');
//    IqTiming1.Start('QryShipment.DataSource');
    QryShipment.DataSource        := SrcArPrePostDetail;
//    IqTiming1.Stop('QryShipment.DataSource');
//    IqTiming1.Start('QryOrder.DataSource');
    QryOrder.DataSource           := SrcArPrePostDetail;
//    IqTiming1.Stop('QryOrder.DataSource');
//    IqTiming1.Start('TblComm.MasterSource');
    TblComm.MasterSource          := SrcArPrePostDetail;
//    IqTiming1.Stop('TblComm.MasterSource');
//    IqTiming1.Start('QryArPrePostDetail.EnableControls');
    QryArPrePostDetail.EnableControls;
//    IqTiming1.Stop('QryArPrePostDetail.EnableControls');
  end;
//  IqTiming1.Stop('Reopen(QryArPrepostDetail)');
end;



procedure TFrmInvoice.PkArPrePostBeforeOpen(DataSet: TDataSet);
begin
//  if QryArPrepost.FieldByname('EPLANT_ID').asFloat <> 0 then
//    IQAssignEPlantFilterParam( DataSet,
//                               FloatToStr(QryArPrepost.FieldByname('EPLANT_ID').asFloat),
//                               SecurityManager.EPlant_Include_Nulls)
//  else
//  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmInvoice.QryArPrePostAfterScroll(DataSet: TDataSet);
begin
  if SelectValueFmtAsFloat('select arcusto_id from po where arcusto_id = %f', [QryArPrePostARCUSTO_ID.asfloat]) <> 0 then
  begin
    if SelectValueFmtAsFloat('select arcusto_id from V_ARINVOICE_CREDIT where arcusto_id = %f and qty_to_credit > 0', [QryArPrePostARCUSTO_ID.asfloat]) <> 0 then
    begin
      SBPO.Enabled := True;
      SBPO.Hint    := cTXT0000061; // 'Customer supplied material.  Available to credit.';
    end
    else
    begin
      SBPO.Enabled := False;
      SBPO.Hint    := cTXT0000062; // 'No Customer supplied material available to credit';
    end;
  end
  else
  begin
   SBPO.Enabled := False;
   SBPO.Hint    := cTXT0000062; // 'No Customer supplied material available to credit';
  end;
//  dbWWBillTo.text := QryArPrePostBILLTOCOMP.asString;
  FRecalcTax := False;
end;

procedure TFrmInvoice.SBPOClick(Sender: TObject);
begin
  QryArPrePost.CheckBrowseMode;

end;

procedure TFrmInvoice.AppendCustomerSuppliedMaterial;
var
  i :Integer;
  AId, AGlAcctId, AcctIdHolding :Real;
  ATaxCodeId:Real;
  ATaxable:String;
begin
//removed for demo
end;


procedure TFrmInvoice.PendingEdis1Click(Sender: TObject);
begin
////  DoEdiPending('810');  {in EdiPnd.pas}
//  Com_Exec( 'IQEDI', [ SHOW_EDI_PEND, '810', 0, 0, 0 ]);    {EDIConst, IQComExe.pas}
end;

procedure TFrmInvoice.dbWWBillToDropDown(Sender: TObject);
begin
  QryBillTo.Close;
  QryBillTo.ParamByName('nId').Value :=
    QryARPrepost.FieldByName('ARCUSTO_ID').asFloat;
  QryBillTo.Open;
end;

procedure TFrmInvoice.dbWWBillToCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    if not (QryARPrePost.State in [dsEdit, dsInsert]) then QryARPrePost.Edit;
    QryARPrePost.FieldByName('BILL_TO_ID').asFloat :=
    LookupTable.FieldByname('ID').asFloat;
  end;

end;

procedure TFrmInvoice.wwDBGlAcctCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if not (QryARPrePost.State in [dsEdit, dsInsert]) then QryARPrePost.Edit;
  QryARPrePost.FieldByName('ARACCT').asString :=
   LookupTable.FieldByname('ACCT').asString;
end;

procedure TFrmInvoice.QryGlAcctBeforeOpen(DataSet: TDataSet);
begin
//  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmInvoice.QryArPrePostBeforeCancel(DataSet: TDataSet);
begin
  if (QryArPrePost.State in [dsInsert]) then
//    Record_Skipped_Seq('AR', 'ARPREPOST', 'INVOICE_NO', FOldInvoiceNo, '', SKIP_SEQ_CANCEL);
end;

procedure TFrmInvoice.Customercarryover1Click(Sender: TObject);
begin
//  if Customercarryover1.Checked then
//  begin
//    IQRegIntegerScalarWrite( self, 'AR_CUSTOMER_CARRYOVER', 0);
//    Customercarryover1.Checked := False;
//    SBCarryOver.Down := False;
//  end
//  else
//  begin
//    IQRegIntegerScalarWrite( self, 'AR_CUSTOMER_CARRYOVER', 1);
//    Customercarryover1.Checked := True;
//    SBCarryOver.Down := True;
//  end;
end;

procedure TFrmInvoice.Options1Click(Sender: TObject);
begin
  // MultiselectDetail1.Checked :=  ( dgMultiSelect in GridInvoiceDetail.Options );
end;

procedure TFrmInvoice.MultiselectDetail1Click(Sender: TObject);
begin
  MultiselectDetail1.Checked:= not MultiselectDetail1.Checked;
  EnableMultiSelect( MultiselectDetail1.Checked );
end;

procedure TFrmInvoice.EnableMultiSelect(AEnabled: Boolean);
var
  I: Integer;
begin
  with GridInvoiceDetail do
     if not AEnabled then
        begin
     //     Options:= Options - [ dgMultiSelect ];
     //     UnselectAll;
        end
     else
    ///    Options:= Options + [ dgMultiSelect ];
end;

procedure TFrmInvoice.wwTaxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if Key = VK_DELETE then
//  with QryARPrepostDetail do
//  begin
//    Edit;
//    FieldByName('TAX_CODE_ID').Clear;
//    FieldByName('TAX_CODE').Clear;
//    QryARPrepostDetailTAX_RATE.Readonly := false;
//    QryARPrepostDetailTAX_RATE.Clear;
//    QryARPrepostDetailTAX_RATE.Readonly := true;
//    Key:= 0;
//  end;
end;

procedure TFrmInvoice.AddSurcharge1Click(Sender: TObject);
var
  AStr:String;
  ASurcharge:Real;
  AId, AAcctId, AEPlantId:Real;
begin
  CheckCashInAdv;
  QryArPrePost.CheckBrowseMode;
  QryARPrepostDetail.CheckBrowseMode;
  if QryArPrePostID.asFloat = 0 then
    raise exception.Create(cTXT0000013 {'Invoice header missing'});
  // removed call to iqinputqury
  if True then
  begin
    ASurcharge := 10; // 10.5 / 100; //subbed value input from iqinputqry
    ASurcharge  := ASurcharge * ViewArPrepostDetailTotalsTOTAL_BEFORE_TAX.AsFloat;
    AAcctId := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_sales'') from dual');

    if '1' = 'NULL' then
      AEPlantId := 0
    else
      AEPlantId := StrToFloat('1');

    AID := GetNextID('ARPREPOST_DETAIL');
    ExecuteCommandFmt('insert into arprepost_detail ' +
              '(id, ' +
              'arprepost_id, ' +
              'GLACCT_ID_SALES, ' +
              'unit_price, ' +
              'invoice_qty, ' +
              'misc_comment, ' +
              'eplant_id ) ' +
              'values (%f, ' +
              '%f, ' +
              'decode(%f, 0, null, %f), ' +
              '%f, ' +
              '1, ' +
              '''%s'', ' +
              'decode(%f, 0, null, %f))',
              [AId,
               QryArPrePostID.asFloat,
               AAcctId, AAcctId,
               ASurcharge,
               FixStr(cTXT0000063),
               AEplantId, AEplantId]);

    ReopenQryArPrePostDetail(AID);
    ViewArPrepostDetailTotals.Refresh;


  end;
end;

procedure TFrmInvoice.TblDtlAcctBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmInvoice.TblDtlAcctBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmInvoice.SalesAccountsSplit1Click(Sender: TObject);
begin
  CheckCashInAdv;
  if QryARPrepostDetailID.asFloat = 0 then Exit;
  if (SelectValueFmtAsFloat('select count(*) from arprepost_detail_sales where arprepost_detail_id = %f', [QryARPrepostDetailID.asFloat]) = 0) and
     (QryARPrepostDetailGLACCT_ID_SALES.asFloat <> 0) then
  begin
    ExecuteCommandFmt('insert into arprepost_detail_sales (glacct_id, percentage, arprepost_detail_id) values (%f, 100, %f)',
              [QryARPrepostDetailGLACCT_ID_SALES.asFloat, QryARPrepostDetailID.asFloat]);
  end;
  TblDtlAcct.Close;
  TblDtlAcct.Open;

//  DoSalesAccountsSplit(self); {in ArAcSplt.pas}
end;

procedure TFrmInvoice.wwQryCurrencyBeforeOpen(DataSet: TDataSet);
begin
  IQAssignNativeCurrencyFilter(DataSet);
end;

procedure TFrmInvoice.InsertRMACommissions(ArPrepostDetailID, AOldOrdDetailId:Real);
var
  ACount:Real;
  Amount:Real;
begin
  ACount := SelectValueFmtAsFloat('select count(id) from ORD_DETAIL_COMMISSIONS where ord_detail_id = %f', [AOldOrdDetailId]);
  Amount := SelectValueFmtAsFloat('select NVL(UNIT_PRICE, 0) * NVL(INVOICE_QTY, 0) from arprepost_detail where id = %f', [ArPrepostDetailID]);
  if ACount <> 0 then
  begin
    ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, salespeople_id, commission_percent, amount) ' +
              'select %f, salespeople_id, commission_percent, NVL(commission_percent, 0) * %.6f/100 from ORD_DETAIL_COMMISSIONS where ord_detail_id = %f',
              [ArPrepostDetailID, Amount, AOldOrdDetailId]);
    Exit;
  end;
  ExecuteCommandFmt('insert into ARPREPOST_COMM (ARPREPOST_DETAIL_ID, salespeople_id, commission_percent, amount) ' +
            'select %f, salespeople_id, commission_percent, NVL(commission_percent, 0) * %.6f/100 from HIST_ORD_DETAIL_COMM where ord_detail_id = %f',
            [ArPrepostDetailID, Amount, AOldOrdDetailId]);

end;

procedure TFrmInvoice.RepairInformation1Click(Sender: TObject);
begin
//  if QryARPrepostDetailRMA_DETAIL_ID.asFloat <> 0 then
//    DoShowRepairInfo(QryARPrepostDetailRMA_DETAIL_ID.asFloat, self);  {in RepInfo.pas}
end;

procedure TFrmInvoice.cbCurrencyCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
var
  AGlacct:String;
begin
  if modified then
  begin
    if not (QryArPrePost.State in [dsEdit, dsInsert]) then QryArPrePost.Edit;
    ReplaceGLACCT_ID_AR_with_MC_Account(QryArPrePostCURRENCY_ID.asFloat);
    AGlacct := SelectValueFmtAsString('select acct from glacct where id = %f', [QryArPrePostGLACCT_ID_AR.asFloat]);
    QryArPrePostARACCT.asString := AGlacct;
  end;
end;

procedure TFrmInvoice.EditBillTo1Click(Sender: TObject);
var
  nId:Real;
begin
//  with QryArPrePost do
//  begin
//    nId := DoEditBillToShipTo(TFrmEditBillTo, FieldByName('ARCUSTO_ID').AsFloat);
//    if (nId <> 0) and (nId <> FieldByName('BILL_TO_ID').AsFloat) then
//    begin
//      QryBillTo.Close;
//      QryBillTo.Open;
//      if not (State in [dsEdit, dsInsert]) then Edit;
//      FieldByName('BILL_TO_ID').AsFloat  := nId;
//      dbWWBillTo.Text := SelectValueFmtAsString('select attn from bill_to where id = %f', [nId]);
////      DBEditBiillTo.Text := SelectValueFmtAsString('select attn from bill_to where id = %f', [nId]);
//    end;
//  end;

end;

procedure TFrmInvoice.wwFreight2CustomDlg(Sender: TObject);
var
  AFreightGlAcctId:Real;
begin
   with PkFreight do
   if Execute then
   begin

//    QryARPrepostDetail.FieldByname('freight_id').asFloat :=
//      LookupTable.FieldByname('id').asFloat;
//    QryARPrepostDetailFREIGHT_COMP.AsString :=  LookupTable.FieldByname('DESCRIP').asString;
//    wwFreight.Text :=  LookupTable.FieldByname('DESCRIP').asString;

     if not (QryARPrepostDetail.State in [dsInsert, dsEdit]) then QryARPrepostDetail.Edit;
     QryARPrepostDetailFREIGHT_ID.asFloat := GetValue('ID');
     AFreightGlAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(glacct_id_freight, ''acct_id_shipping'', %f) from freight where id = %f',
       [QryARPrepostDetailEPLANT_ID.asFloat, QryARPrepostDetailFREIGHT_ID.asFloat]);
     if AFreightGlAcctId <> 0 then
       QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat := AFreightGlAcctId;
//     wwFreight2.Text :=  GetValue('DESCRIP');
   end;
end;

procedure TFrmInvoice.wwwRefCodeDlgCustomDlg(Sender: TObject);
begin
  CheckCashInAdv;
  with PkRefCode do
  if Execute then
  begin
    if not(QryARPrepostDetail.State in [dsInsert, dsEdit]) then QryARPrepostDetail.Edit;
    QryARPrepostDetail.FieldByname('ref_code_id').asFloat :=  GetValue('ref_code_id');
    QryARPrepostDetailREFCODE.AsString := GetValue('REF_CODE_DESCRIP');
  end;

end;

procedure TFrmInvoice.DoAttachedCreditCards(Sender: TObject);
begin
//  if (QryArPrePost.State in [dsEdit, dsInsert]) then
//     QryArPrePost.Post;
//  iqcc.CC_AttachCreditCard(TChargePostingSource.csARPrepost,
//    QryArPrePostID.AsFloat, QryArPrePostARCUSTO_ID.AsFloat);
end;

procedure TFrmInvoice.ChargeCreditCard1Click(Sender: TObject);
begin
//  if (QryArPrePost.State in [dsEdit, dsInsert]) then
//     QryArPrePost.Post;
//  iqcc.CC_DoCustCharge(TChargePostingSource.csARPrepost,
//    QryArPrePostID.AsInteger);
end;

procedure TFrmInvoice.SBTaxBreakdownClick(Sender: TObject);
begin
//  DoARTaxBreakDown(self, 0, QryArPrePostID.asFloat); {in ArPrepTax.pas}
  ReOpen(ViewArPrepostDetailTotals);
  RefreshDatasetById(QryARPrepost);
  RefreshDatasetById(QryARPrepostDetail);
end;

procedure TFrmInvoice.TaxBreakdown1Click(Sender: TObject);
begin
  CheckCashInAdv;
//  DoArTax(self);
//  DoARTaxBreakDown(self, QryARPrepostDetailID.asFloat, 0); {in ArPrepTax.pas}
end;

procedure TFrmInvoice.wwGlAcctDropDown(Sender: TObject);
begin
//  QryArPrePost.CheckbrowseMode;
  FDetailSaleseAcctId := 0;
  FQryArPrePostState := QryArPrePost.State;

end;

procedure TFrmInvoice.SBScanClick(Sender: TObject);
var
  A: Variant;
begin
//remmed for demo
end;

procedure TFrmInvoice.CBMiscClick(Sender: TObject);
var
  ACommId, APrcnt:Real;
begin
  if CBMisc.Checked then
  begin
    ACommId := SelectValueFmtAsFloat('select NVL(commissions_id, -100000000) from arcusto where id = %f', [QryArPrePostARCUSTO_ID.asFloat]);
    APrcnt := SelectValueFmtAsFloat('select NVL(comm_pcnt, -100000000) from arcusto where id = %f', [QryArPrePostARCUSTO_ID.asFloat]);
    cbCustComm.Visible := (ACommId <> -100000000) and (APrcnt <> -100000000);
  end;
end;

procedure TFrmInvoice.DefineLabelText2Click(Sender: TObject);
begin
//  (popmEditUserLabel.PopupComponent as TIQUserDefLabel).Execute;
end;

procedure TFrmInvoice.TblDtlAcctCalcFields(DataSet: TDataSet);
begin
  TblDtlAcctAmount.asFloat := SimpleRoundTo((QryARPrepostDetailTOTAL_BEFORE_TAX.asFloat * TblDtlAcctPERCENTAGE.asFloat/100), -2);
end;

procedure TFrmInvoice.CustomerPickListDate1Click(Sender: TObject);
var
  ADate:TDateTime;
begin
//  ADate := FCustPickListDate;
//  if not GetWWDateDialog( cTXT0000091,  cTXT0000092, ADate) then exit;
//
//  FCustPickListDate := ADate;
////  IQRegDateTimeScalarWrite( self, 'AR_CUSTOMER_PICKLIST_DATE', FCustPickListDate );
//
//  CustomerPickListDate1.Caption := Format('Customer pick list Date (%s)', [FormatDateTime('mm/dd/yyyy', FCustPickListDate)]);
end;

procedure TFrmInvoice.BuildUnitPriceAccountSplit1Click(Sender: TObject);
begin
  if BuildUnitPriceAccountSplit1.Checked then
  begin
    ExecuteCommand('update iqsys2 set AR_UNIT_PRICE_ACC_SPLIT = ''N''');
    BuildUnitPriceAccountSplit1.Checked := false;
end;
end;

procedure TFrmInvoice.BuildUnitPriceAccountsplit2Click(Sender: TObject);
begin
//  CheckCashInAdv;
//  QryARPrepostDetail.CheckBrowseMode;
//  if QryARPrepostDetailUNIT_PRICE.asFloat = 0 then
//    raise exception.create(cTXT0000095);
//
//  DoUnitPriceAmountSplit(self, QryARPrepostDetailUNIT_PRICE.asFloat); {UnitPriceAcctSplit.pas}
end;

procedure TFrmInvoice.QryARPrepostDetailDISPDESCRIPValidate(Sender: TField);
begin
  CheckCreditMemo;
end;

procedure TFrmInvoice.CheckCreditMemo;
begin
   if (QryArPrePost.FieldByName('ARINVOICE_ID').asFloat <> 0) then
      raise exception.Create(cTXT0000054 {'Credit Memos may not be edited'});
end;


procedure TFrmInvoice.PrintInvoice1Click(Sender: TObject);
var
  AFrom, ATo:String;
begin
//  IQRegIntegerScalarWrite( self, 'AR_PRINT_INVOICE', 1);
//  IQRegIntegerScalarWrite( self, 'AR_PRINT_RANGE_INVOICE', 0);
//  QryArPrePost.CheckBrowseMode;
//  AFrom := QryArPrePostINVOICE_NO.asString;
//  ATo   := QryArPrePostINVOICE_NO.asString;
//  DoPrintArPrepost( AFrom, ATo );  {in PrnArPre.pas}
end;

procedure TFrmInvoice.Printrangeofinvoices1Click(Sender: TObject);
var
  AFrom, ATo:String;
begin
//  IQRegIntegerScalarWrite( self, 'AR_PRINT_RANGE_INVOICE', 1);
//  IQRegIntegerScalarWrite( self, 'AR_PRINT_INVOICE', 0);
//  QryArPrePost.CheckBrowseMode;
//  AFrom := SelectValueAsString('select min(invoice_no) from arprepost where prior_entry = ''N'' and misc.eplant_filter(eplant_id) = 1');
//  ATo   := SelectValueAsString('select max(invoice_no) from arprepost where prior_entry = ''N'' and misc.eplant_filter(eplant_id) = 1');
//  DoPrintArPrepost( AFrom, ATo );  {in PrnArPre.pas}
end;

procedure TFrmInvoice.DDBPrintClick(Sender: TObject);
var
  AType:Integer;
begin
  AType := 0;

  if False then //IQRegIntegerScalarRead( self, 'AR_PRINT_INVOICE', AType ) then
  begin
    if AType = 1 then
      PrintInvoice1Click(nil)
    else
      Printrangeofinvoices1Click(nil);
  end
  else
    Printrangeofinvoices1Click(nil);
end;

procedure TFrmInvoice.wwGlAcct_FreightDropDown(Sender: TObject);
begin
  CheckCreditMemo;
  FDetailSaleseAcctId_FR := 0;
  FQryArPrePostState_FR := QryArPrePost.State;
end;


procedure TFrmInvoice.wwGlAcct_FreightCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    if FDetailSaleseAcctId_FR <> 0 then
    begin
      QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat := FDetailSaleseAcctId_FR;
      QryARPrepostDetailGL_FR_ACCT.AsString := FDetailSaleseAcct;
    //  wwGlAcct_Freight.Text := FDetailSaleseAcct_FR;
    end
    else
    begin
      QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat :=
      LookupTable.FieldByname('id').asFloat;
      QryARPrepostDetail.FieldByName('GL_FR_ACCT').asString :=  LookupTable.FieldByname('acct').asString;
   //   wwGlAcct_Freight.Text :=  LookupTable.FieldByname('acct').asString;
    end;
  end;
end;

procedure TFrmInvoice.ChangeInvoice1Click(Sender: TObject);
var
  Aid:Real;
  AOldInvNo:String;
begin
  QryArPrePost.CheckBrowseMode;
//  if QryArPrePostID.asFloat > 0 then
//    if DoChangeInvoiceNo(self, QryArPrePostID.asFloat) then
//    begin
//      AId := QryArPrePostID.asFloat;
//      AOldInvNo := QryArPrepost.FieldByName('INVOICE_NO').asString;
//
//
//      QryArPrePost.Close;
//      QryArPrePost.Open;
//      QryArPrePost.Locate('ID', AId, []);
//      Record_Skipped_Seq('AR', 'ARPREPOST', 'INVOICE_NO', AOldInvNo, QryArPrepost.FieldByName('INVOICE_NO').asString, SKIP_SEQ_DELETE);
//
//    end;

end;

procedure TFrmInvoice.QryARPrepostDetailFREIGHT_PRICESetText(Sender: TField; const Text: String);
begin
  if Text = '' then
    Sender.value := 0
  else
    Sender.value := StrToFloat(Text);
end;

procedure TFrmInvoice.QryARPrepostDetailINVOICE_QTYChange(Sender: TField);
begin
  FTotalQtyChanged := True;
end;

procedure TFrmInvoice.tblInvCodeBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmInvoice.QryOrderCalcFields(DataSet: TDataSet);
begin
  if SelectValueAsString('select NVL(USE_HIST_PONO, ''N'') from iqsys2') = 'Y' then
    QryOrderAPono.asString := SelectValueFmtAsString('select PONO_FROM_SO from arprepost_detail where id = %f', [QryARPrepostDetailID.asFloat])
  else
    QryOrderAPono.asString := QryOrderPONO.asString;

end;

procedure TFrmInvoice.AssignAcctviaPickList1Click(Sender: TObject);
begin
  CheckCashInAdv;
{  with GridInvoiceDetail.DataSource.DataSet do
    if GridInvoiceDetail.SelectedField = QryARPrepostDetailGLACCT then
    begin
      if PKGlAcct.Execute then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        QryARPrepostDetail.FieldByname('glacct_id_sales').asFloat :=  PKGlAcct.GetValue('ID');
        QryARPrepostDetailGLACCT.AsString                         :=  PKGlAcct.GetValue('ACCT');
        QryARPrepostDetail.FieldByName('GLACCT_DESCRIP').asString :=  PKGlAcct.GetValue('DESCRIP');

      end;
    end
    else if GridInvoiceDetail.SelectedField = QryARPrepostDetailGL_FR_ACCT then
    begin
      if PkGlAcct.Execute then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat           := PKGlAcct.GetValue('ID');
        QryARPrepostDetail.FieldByName('GL_FR_ACCT').asString := PKGlAcct.GetValue('ACCT');
      end;
    end
    else if GridInvoiceDetail.SelectedField = QryARPrepostDetailGL_FR_ACCT_REV then
    begin
      if PkGlAcct.Execute then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        QryARPrepostDetailACCT_ID_FREIGHT_REV.asFloat           := PKGlAcct.GetValue('ID');
        QryARPrepostDetail.FieldByName('GL_FR_ACCT_REV').asString := PKGlAcct.GetValue('ACCT');
      end;
    end;
    }
end;


procedure TFrmInvoice.wwGlAcct_Freight_RevCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    QryARPrepostDetailACCT_ID_FREIGHT_REV.asFloat :=  LookupTable.FieldByname('id').asFloat;
    QryARPrepostDetail.FieldByName('GL_FR_ACCT_REV').asString :=  LookupTable.FieldByname('acct').asString;
//    wwQryGLAcct_Freight.Text :=  LookupTable.FieldByname('acct').asString;
  end;

end;


procedure TFrmInvoice.EditFreightRevenueAmount1Click(Sender: TObject);
var
  S:String;
  AOrigPrice:Real;
begin
  CheckCashInAdv;
  with QryArPrePostDetail do
  try
     S:= FloatToStr( QryARPrepostDetailFREIGHT_REV_AMOUNT.asFloat );
     if ( Trim( S ) <> '' ) then
     begin
       if not (State in [dsEdit, dsInsert]) then Edit;
       QryARPrepostDetailFREIGHT_REV_PCNT.Readonly := false;
       QryARPrepostDetailFREIGHT_REV_AMOUNT.Readonly := false;
       QryARPrepostDetailFREIGHT_REV_AMOUNT.asFloat := StrToFloat( S );
       AOrigPrice := SelectValueFmtAsFloat('select orig_freight_price from arprepost_detail where id = %f', [QryARPrepostDetailID.asFloat]);
       QryARPrepostDetailFREIGHT_PRICE.asFloat := AOrigPrice + QryARPrepostDetailFREIGHT_REV_AMOUNT.asFloat;
       if AOrigPrice > 0 then
         QryARPrepostDetailFREIGHT_REV_PCNT.asFloat := 100 * QryARPrepostDetailFREIGHT_REV_AMOUNT.asFloat/AOrigPrice;
     end;
  finally
    QryARPrepostDetailFREIGHT_REV_AMOUNT.Readonly := true;
    QryARPrepostDetailFREIGHT_REV_PCNT.Readonly := true;
  end;
end;

procedure TFrmInvoice.Freightrevenue1Click(Sender: TObject);
var
  S:String;
  AOrigPrice:Real;
begin
  CheckCashInAdv;
  with QryArPrePostDetail do
  try
     S:= FloatToStr( QryARPrepostDetailFREIGHT_REV_PCNT.asFloat );
     if ( Trim( S ) <> '' ) then
     begin
       if not (State in [dsEdit, dsInsert]) then Edit;
       QryARPrepostDetailFREIGHT_REV_PCNT.Readonly := false;
       QryARPrepostDetailFREIGHT_REV_AMOUNT.Readonly := false;
       QryARPrepostDetailFREIGHT_REV_PCNT.asFloat := StrToFloat( S );
       AOrigPrice := SelectValueFmtAsFloat('select orig_freight_price from arprepost_detail where id = %f', [QryARPrepostDetailID.asFloat]);
       QryARPrepostDetailFREIGHT_REV_AMOUNT.asFloat := AOrigPrice * QryARPrepostDetailFREIGHT_REV_PCNT.asFloat/100;
       QryARPrepostDetailFREIGHT_PRICE.asFloat := AOrigPrice + QryARPrepostDetailFREIGHT_REV_AMOUNT.asFloat;
     end;
  finally
    QryARPrepostDetailFREIGHT_REV_AMOUNT.Readonly := true;
       QryARPrepostDetailFREIGHT_REV_PCNT.Readonly := true;
  end;
end;

procedure TFrmInvoice.RevaluateUnitPrice(arprepost_detail_id:Real);
begin
  ExecuteCommandFmt('begin ar.RevaluateUnitPrice(%f); end;', [arprepost_detail_id]);
end;

procedure TFrmInvoice.wwTaxCustomDlg(Sender: TObject);
var
  aId:Real;
  aTaxCode:String;
begin
  CheckCashInAdv;
  with PkTaxCode do
    if Execute then
    begin
      aId := GetValue('ID');
      aTaxCode := GetValue('TAX_CODE');
      if not (QryARPrepostDetail.State in [dsEdit, dsInsert]) then QryARPrepostDetail.Edit;
      QryARPrepostDetailtax_code_id.asFloat := aId;
      QryARPrepostDetailTAX_CODE.AsString := aTaxCode ;
//      wwTax.Text :=  LookupTable.FieldByname('TAX_CODE').asString;
    end;
end;


procedure TFrmInvoice.AssignDiscountToUnitPrice( ADiscount: Real);
var
  ADataChange: TDataChangeEvent;
  APrice:Real;
  ADataSourceInFocus: TDataSource;
begin
  with SrcArPrePostDetail do
  try
    ADataChange := OnDataChange;
    OnDataChange:= NIL;
    APrice:= DataSet.FieldByName('List_Unit_Price').asFloat;
//    if APrice = 0 then
//    begin
//      APrice := DataSet.FieldByName('UNIT_PRICE').asFloat;
//      ForceValue(DataSet.FieldByName('List_Unit_Price'), APrice);
//    end;

    if not DataSet.FieldByName('UNIT_PRICE').ReadOnly then
       DataSet.FieldByName('UNIT_PRICE').asFloat:= APrice * (1 - ADiscount / 100 );
    if not DataSet.FieldByName('PRICE_PER_1000').ReadOnly then
       DataSet.FieldByName('PRICE_PER_1000').asFloat:= DataSet.FieldByName('UNIT_PRICE').asFloat * 1000;

  finally
    OnDataChange:= ADataChange;
  end;
end;

procedure TFrmInvoice.AssignPriceToDiscount( APrice: Real);
begin
  if QryARPrepostDetail.FieldByName('List_Unit_Price').asFloat <> 0 then
    QryARPrepostDetail.FieldByName('DISCOUNT').asFloat :=  Round(( 1 - APrice / QryARPrepostDetail.FieldByName('List_Unit_Price').asFloat  ) * 100 * 100) / 100;
end;

procedure TFrmInvoice.UpdateCashInAdvanceGlAccounts(a_ord_detail_id, arprepost_id:Real);
var
  acct_id_cust_on_acct:Real;
//  arcusto_id:Real;
  aEplantId:Real;
  aorders_id, aTermsId:Real;
  afreight_price, aId: real;
begin
//  arcusto_id := SelectValueFmtAsFloat('select arcusto_id from arprepost where id = %f', [arprepost_id]);
  aEplantId  := SelectValueFmtAsFloat('select eplant_id from arprepost where id = %f', [arprepost_id]);
  aOrders_id :=  SelectValueFmtAsFloat('select orders_id from ord_detail where id = %f', [a_ord_detail_id]);
  if aOrders_id = 0 then
    aOrders_id :=  SelectValueFmtAsFloat('select orders_id from hist_ord_detail where id = %f', [a_ord_detail_id]);

  aTermsId :=  SelectValueFmtAsFloat('select terms_id from orders where id = %f', [aOrders_id]);
  if aTermsId = 0 then
    aTermsId :=  SelectValueFmtAsFloat('select terms_id from hist_orders where id = %f', [aOrders_id]);

  if SelectValueFmtAsString('select NVL(cash_in_advance, ''N'') from terms where id = %f', [aTermsId]) = 'Y' then
  begin
    afreight_price := SelectValueFmtAsFloat('select freight_charge from orders where id = %f', [aOrders_id]);

    acct_id_cust_on_acct  := SelectValueAsFloat('select acct_id_cust_on_acct from iqsys2 where rownum < 2');
    if acct_id_cust_on_acct <> 0 then
    begin
      acct_id_cust_on_acct := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_sales'', %f ) from dual',
                              [acct_id_cust_on_acct, aEplantId]);

      ExecuteCommandFmt('delete from arprepost_detail_sales ' +
                ' where arprepost_detail_id in (select id from arprepost_detail where arprepost_id = %f)', [arprepost_id]);
      ExecuteCommandFmt('update arprepost_detail set GLACCT_ID_SALES = %f where arprepost_id = %f', [acct_id_cust_on_acct, arprepost_id]);

      if afreight_price <> 0 then
      begin
        aid := SelectValueFmtAsFloat('select min(id) from arprepost_detail where arprepost_id = %f', [arprepost_id]);
        ExecuteCommandFmt('update arprepost_detail set GLACCT_ID_FREIGHT = %f, freight_price = %.6f where id = %f',
          [acct_id_cust_on_acct, afreight_price, aId]);
      end;

    end;
  end;
end;

procedure TFrmInvoice.UpdateCashInAdvanceGlAccounts2(arprepost_id:Real; ADataSet:TDataSet; a_ord_detail_id:Real);
var
  acct_id_cust_on_acct:Real;
  arcusto_id:Real;
  aEplantId:Real;
  aorders_id, aTermsId:Real;
begin
  if UpperCase(ADataSet.Name) <> 'QRYSHIP' then exit;

  ExecuteCommandFmt(
    'BEGIN iqms.ar.set_cia_glacct2(%d, ds.ord_detail_id); END;',
    [Trunc(arprepost_id), Trunc(a_ord_detail_id)]);
{
//  arcusto_id := SelectValueFmtAsFloat('select arcusto_id from arprepost where id = %f', [arprepost_id]);
  aEplantId  := SelectValueFmtAsFloat('select eplant_id from arprepost where id = %f', [arprepost_id]);
  aOrders_id :=  SelectValueFmtAsFloat('select orders_id from ord_detail where id = %f', [a_ord_detail_id]);
  if aOrders_id = 0 then
    aOrders_id :=  SelectValueFmtAsFloat('select orders_id from hist_ord_detail where id = %f', [a_ord_detail_id]);

  aTermsId :=  SelectValueFmtAsFloat('select terms_id from orders where id = %f', [aOrders_id]);
  if aTermsId = 0 then
    aTermsId :=  SelectValueFmtAsFloat('select terms_id from hist_orders where id = %f', [aOrders_id]);

  if SelectValueFmtAsString('select NVL(cash_in_advance, ''N'') from terms where id = %f', [aTermsId]) = 'Y' then
  begin
    ExecuteCommandFmt('update arprepost set cia_invoice = ''Y'' where id = %f', [arprepost_id]);

    acct_id_cust_on_acct  := SelectValueAsFloat('select acct_id_cust_on_acct from iqsys2 where rownum < 2');
    if acct_id_cust_on_acct <> 0 then
    begin
      acct_id_cust_on_acct := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_sales'', %f ) from dual',
                              [acct_id_cust_on_acct, aEplantId]);
      ExecuteCommandFmt('update arprepost set glacct_id_ar = %f where id = %f', [acct_id_cust_on_acct, arprepost_id]);
    end;

  end;
}
end;

procedure TFrmInvoice.CheckCashInAdv;
begin
  if FAllowCIAChanges then exit;
  if IsCIA then
    raise exception.Create('Invoice Terms are Cash in Advance - cannot be edited');
end;

procedure TFrmInvoice.CheckSetPhantomOrderDetailModified;
begin
  if QryARPrepostDetailPHANTOM_ORD_DETAIL_ID.AsLargeInt > 0 then
    ExecuteCommandFmt(
      'UPDATE arprepost_detail                      '#13 +
      '   SET phantom_dtl_modified = ''Y''          '#13 +
      ' WHERE ord_detail_id = %d                    ',
      [QryARPrepostDetailPHANTOM_ORD_DETAIL_ID.AsLargeInt]);
end;

function TFrmInvoice.GetIncludePhantomComponents(AARPrepostDetailID: Int64): Boolean;  // overloaded
begin
  Result:= SelectValueFmtAsInteger(
    'SELECT 1                                         '#13 +
    '  FROM arinvt a, arprepost_detail d              '#13 +
    ' WHERE d.id = %d AND                             '#13 +
    '       d.arinvt_id = a.id AND                    '#13 +
    '       a.phantom_components_on_so = ''Y'' AND    '#13 +
    '       a.phantom = ''Y''                         ',
    [ AARPrepostDetailID ]) = 1;
end;

function TFrmInvoice.GetPhantomKitPriceBasedOnComponentsArinvt(
  AArinvtID: Int64): Boolean;
begin
  Result:= SelectValueFmtAsInteger(
   'SELECT 1                                                '#13 +
   '  FROM arinvt                                           '#13 +
   ' WHERE id = %d AND                                      '#13 +
   '       NVL(phantom, ''N'') = ''Y'' AND                  '#13 +
   '       NVL(phantom_components_on_so, ''N'') = ''Y'' AND '#13 +
   '       NVL(phantom_kit_use_comp_price, ''N'') = ''Y''   ',
   [AArinvtID]) = 1;
end;

function TFrmInvoice.GetPhantomKitPriceBasedOnComponents(
  AARPrepostDetailID: Int64): Boolean;
begin
  Result:= SelectValueFmtAsInteger(
   'SELECT 1                                                    '#13 +
   '  FROM arprepost_detail a, arinvt b                         '#13 +
   ' WHERE a.id = %d AND                                        '#13 +
   '       b.id = a.arinvt_id AND                               '#13 +
   '       NVL(b.phantom, ''N'') = ''Y'' AND                    '#13 +
   '       NVL(b.phantom_components_on_so, ''N'') = ''Y'' AND   '#13 +
   '       NVL(b.phantom_kit_use_comp_price, ''N'') = ''Y''     ',
   [AARPrepostDetailID]) = 1;
end;

procedure TFrmInvoice.SyncPhantomOrderDetailComponents;     // overloaded!
var
  AARPrepostDetailID, AOrdDetailID: Int64;
begin
//  // TODO:  For 2016 +, please place most or all of this processing on the
//  // back end.  This involves the TInventoryItemPricing class used in
//  // AssignUnitPriceEx(), but without the prompts.
//  AARPrepostDetailID := QryARPrepostDetailID.AsLargeInt;
//  AOrdDetailID := QryARPrepostDetailORD_DETAIL_ID.AsLargeInt;
//  if GetIncludePhantomComponents(AARPrepostDetailID) then
//  begin
//    SyncPhantomOrderDetailComponents(AARPrepostDetailID);  // call overloaded method below
//    RefreshDataSetByID(QryARPrepostDetail);
//    QryARPrepostDetail.DisableControls;
//    try
//      with TFDQuery.Create(nil) do
//      try
//        Connection := db_dm.FDConnection;
//        SQL.Add('  SELECT id,');
//        SQL.Add('         invoice_qty');
//        SQL.Add('    FROM arprepost_detail');
//        SQL.Add(Format('   WHERE arprepost_id = %d AND',[QryArPrePostID.AsLargeInt]));
//        SQL.Add(Format('         phantom_ord_detail_id = %d AND',[AOrdDetailID]));
//        SQL.Add('         arinvt_id IS NOT NULL');
//        SQL.Add('ORDER BY id');
//        Open;
//        while not Eof do
//          begin
//            QryARPrepostDetail.Locate('ID', Fields[0].AsLargeInt, []);
//            QryARPrepostDetail.Edit;
//            QryARPrepostDetail.Post;
//            RevaluateUnitPrice(Fields[0].AsLargeInt);
//            Next;
//          end;
//      finally
//        Free;
//      end;
//      QryARPrepostDetail.Close;
//      QryARPrepostDetail.Open;
//      QryARPrepostDetail.Locate('ID', AARPrepostDetailID, []);
//    finally
//      QryARPrepostDetail.EnableControls;
//    end;
//  end;
end;

procedure TFrmInvoice.SyncPhantomOrderDetailComponents(AARPrepostDetailID: Int64);  // overloaded!
begin
  if GetIncludePhantomComponents( AARPrepostDetailID ) then
    ExecuteCommandFmt('begin ar_phantom.sync_phantom_detail(%d); end;',
      [AARPrepostDetailID]);
end;

function TFrmInvoice.IsCIA;
begin
  if QryArPrePost.State in [dsInsert] then
    result := false
  else
    result := SelectValueFmtAsString('select NVL(cash_in_advance, ''N'') from terms where id = %f', [QryArPrePostTERMS_ID.asFloat]) = 'Y';

end;


procedure TFrmInvoice.InsertRMAArPrePostDetail(AMiscOrdersId,
                           nShipmentDtlId,
                           nOrderDtlId,
                           nArinvtId,
                           nUnitPrice,
                           AQty:Real;
                           nEPlantId,
                           nRmaDtlId : Real;
                           AIsMiscCharge, bRestock:Boolean;
                           ADispoType :String);
var
  nAcctId, nFreightId, nCurrencyId:Real;
  ATaxCodeId:Real;
  AShipmentDtlId:Real;
  AQry:TFDQuery;
  AFreightGlAcctId:Real;
begin
  with QryArPrePostDetail do
  try
    OnNewRecord     := nil;
    Insert;
    //QryARPrepostDetailIS_CREDIT_MEMO.asString := 'Y';
    nFreightId := GetfreightId(nShipmentDtlId);

    if AMiscOrdersId <> 0 then
      QryARPrepostDetailMISC_ORDERS_ID.asFloat := AMiscOrdersId;

    if ADispoType = 'SCRAP' then
    begin
      QryARPrepostDetailNO_POST_STD_COST.Readonly := False;
      QryARPrepostDetailNO_POST_STD_COST.asString := 'Y';
      QryARPrepostDetailNO_POST_STD_COST.Readonly := True;
    end;

//    if nFreightId <> 0 then FieldByName('FREIGHT_ID').asFloat := nFreightId;

    if nFreightId <> 0 then
    begin
       QryArPrePostDetail.FieldByName('FREIGHT_ID').asFloat := nFreightId;
       AFreightGlAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(glacct_id_freight, ''acct_id_shipping'', %f) from freight where id = %f',
         [nEPlantId, nFreightId]);
       if AFreightGlAcctId <> 0 then
         QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat := AFreightGlAcctId;
    end;



    FieldByName('FREIGHT_PRICE').asFloat                  := 0;
    FieldByName('ARPREPOST_ID').asFloat                   := QryArPrePost.FieldByName('ID').asFloat;
    if nShipmentDtlId <> 0 then
    begin
      FieldByName('SHIPMENT_DTL_ID').asFloat                := nShipmentDtlId;
      FieldByName('SHIPMENT_DTL_ID2').asFloat                := nShipmentDtlId;
    end
    else
    begin
      AShipmentDtlId := SelectValueFmtAsFloat('select SHIPMENT_DTL_ID from rma_detail where id = %f', [nRmaDtlId]);
      if AShipmentDtlId <> 0 then
        FieldByName('SHIPMENT_DTL_ID2').asFloat                :=  AShipmentDtlId;
    end;
    if nOrderDtlId <> 0 then
      FieldByName('ORD_DETAIL_ID').asFloat                  := nOrderDtlId;

    if AIsMiscCharge then
      QryArPrePostDetail.FieldByName('MISC_COMMENT').asString := 'Misc. Charge';

    if not AIsMiscCharge then
    begin
      if nArinvtId <> 0 then
        FieldByName('ARINVT_ID').asFloat                      := nArinvtId;

      ATaxCodeId := SelectValueFmtAsFloat('select tax_code_id from ord_detail where id = %f', [nOrderDtlId]);
      if ATaxCodeId = 0 then
        ATaxCodeId := SelectValueFmtAsFloat('select tax_code_id from hist_ord_detail where id = %f', [nOrderDtlId]);

      if ATaxCodeId = 0 then
        ATaxCodeId := SelectValueFmtAsFloat('select d.tax_code_id from ord_detail d, shipment_dtl s ' +
                                ' where s.id = %f and s.order_dtl_id = d.id', [nShipmentDtlId]);

      if ATaxCodeId = 0 then
        ATaxCodeId := SelectValueFmtAsFloat('select d.tax_code_id from hist_ord_detail d, shipment_dtl s ' +
                                ' where s.id = %f and s.order_dtl_id = d.id', [nShipmentDtlId]);

      if ATaxCodeId = 0 then
        ATaxCodeId := SelectValueFmtAsFloat('select tax_codes_id from arcusto where id = %f', [QryArPrePostARCUSTO_ID.asFloat]);


      if ATaxCodeId <> 0 then
        FieldByName('TAX_CODE_ID').asFloat := ATaxCodeId;

    end;


    QryArPrePostDetail.FieldByName('UNIT_PRICE').asFloat  := nUnitPrice;
    QryArPrePostDetail.FieldByName('INVOICE_QTY').asFloat := aQty;
    QryArPrePostDetail.FieldByName('RMA_DETAIL_ID').asFloat := nRmaDtlId ;

//    TblArPrePostDetail.FieldByName('UNIT_PRICE').asFloat  := nUnitPrice;
//    TblArPrePostDetail.FieldByName('INVOICE_QTY').asFloat := nQty;

    if nEPlantId <> 0 then
      FieldByName('EPLANT_ID').asFloat := nEPlantId;

    nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_rma_cr_memo'', %f) from dual', [nEPlantId]);

    if nAcctId = 0 then
      nAcctId := SelectValueFmtAsFloat('select glacct_id from ord_detail where id = %f', [nOrderDtlId]);

    if nAcctId = 0 then
      nAcctId := SelectValueFmtAsFloat('select g.acct_id_sales ' +
                           'from arinvt a, arinvt_group g ' +
                           'where a.arinvt_group_id = g.id ' +
                           'and a.id = %f', [nArinvtId]);


    if nAcctId = 0 then
      nAcctId := SelectValueFmtAsFloat('select acct_id_sales from arinvt where id = %f', [nArinvtId]);
    if nAcctId = 0
      then nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_sales'', %f) from dual', [nEPlantId]);
    if nAcctId <> 0
      then QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := nAcctId;
//      then TblArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := nAcctId;

    FieldByName('ID').asFloat := GetNextID('ARPREPOST_DETAIL');

//    IQAssignIDBeforePost(TblArPrePostDetail); {in IQlib}
    if nAcctId = 0 then GetGlAcct;
    nAcctId := FieldByName('GLACCT_ID_SALES').asFloat;
    Post;
    InsertCommodity(nArinvtId, QryArPrePostDetail.FieldByName('ID').asFloat);
    Insert_Deduct_from_Invoice_Total(QryArPrePostDetail.FieldByName('ID').asFloat);

    if SelectValueFmtAsString('select NVL(sample, ''N'') from ord_detail where id = %f', [QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat]) = 'N' then
      ExecuteCommandFmt('insert into ARPREPOST_DETAIL_SALES (ARPREPOST_DETAIL_ID, glacct_id, percentage) ' +
                ' select %f, glacct_id, percentage from arinvt_sales_split where arinvt_id = %f',
                [QryArPrePostDetail.FieldByName('ID').asFloat, nArinvtId]);


    if nOrderDtlId <> 0 then
      InsertRMACommissions(QryArPrePostDetail.FieldByName('ID').asFloat, nOrderDtlId);


//    if bRestock and (ADispoType <> 'SCRAP') then
    if bRestock then
    begin
      Insert;
      //QryARPrepostDetailIS_CREDIT_MEMO.asString := 'Y';
      nFreightId := GetfreightId(nShipmentDtlId);
//      if nFreightId <> 0 then FieldByName('FREIGHT_ID').asFloat := nFreightId;
      if nFreightId <> 0 then
      begin
         QryArPrePostDetail.FieldByName('FREIGHT_ID').asFloat := nFreightId;
         AFreightGlAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(glacct_id_freight, ''acct_id_shipping'', %f) from freight where id = %f',
           [nEPlantId, nFreightId]);
         if AFreightGlAcctId <> 0 then
           QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat := AFreightGlAcctId;
      end;




      FieldByName('FREIGHT_PRICE').asFloat                  := 0;
      FieldByName('ARPREPOST_ID').asFloat                   := QryArPrePost.FieldByName('ID').asFloat;
      if nEPlantId <> 0 then
        FieldByName('EPLANT_ID').asFloat := nEPlantId;
//      FieldByName('SHIPMENT_DTL_ID').asFloat                := nShipmentDtlId;
//      FieldByName('ORD_DETAIL_ID').asFloat                  := nOrderDtlId;
//      FieldByName('ARINVT_ID').asFloat                      := nArinvtId;

      QryArPrePostDetail.FieldByName('UNIT_PRICE').asFloat  := nUnitPrice * SelectValueAsFloat('select RESTOCK from iqsys')/100;
      QryArPrePostDetail.FieldByName('INVOICE_QTY').asFloat := (-1) * aQty;
      QryArPrePostDetail.FieldByName('MISC_COMMENT').asString := 'Restocking charge';


//      TblArPrePostDetail.FieldByName('UNIT_PRICE').asFloat  := nUnitPrice * SelectValueAsFloat('select RESTOCK from iqsys')/100;
//      TblArPrePostDetail.FieldByName('INVOICE_QTY').asFloat := (-1) * nQty;
//      TblArPrePostDetail.FieldByName('MISC_COMMENT').asString := 'Restocking charge';

      nAcctId := SelectValueFmtAsFloat('select g.acct_id_sales ' +
                           'from arinvt a, arinvt_group g ' +
                           'where a.arinvt_group_id = g.id ' +
                           'and a.id = %f', [nArinvtId]);


      if nAcctId = 0 then
        nAcctId := SelectValueFmtAsFloat('select acct_id_sales from arinvt where id = %f', [nArinvtId]);
      if nAcctId = 0
        then nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_sales'', %f) from dual', [nEPlantId]);
      if nAcctId <> 0
        then QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := nAcctId;
//        then TblArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := nAcctId;

      FieldByName('ID').asFloat := GetNextID('ARPREPOST_DETAIL');

//      IQAssignIDBeforePost(TblArPrePostDetail); {in IQlib}
      if nAcctId = 0 then GetGlAcct;
      Post;
    end;
    ExecuteCommandFmt('insert into rma_credits ' +
              '(rma_detail_id, arprepost_id) ' +
              'values (%f, %f)', [nRmaDtlId, QryArPrePost.FieldByName('ID').asFloat]);
    ViewCreditMemos1.Visible := True;

  finally
    OnNewRecord     := QryArPrePostDetailNewRecord;
    ReopenQryArPrePostDetail;
  end;

end;

procedure TFrmInvoice.InsertMultiRMAArPrePostDetail(AMiscOrdersId,
                                  nShipmentDtlId,
                                  nOrderDtlId,
                                  AQty:Real;
                                  nEPlantId,
                                  nRmaDtlId : Real;
                                  AIsMiscCharge, bRestock:Boolean;
                                  ADispoType :String;
                                  AOwner:TUniForm);
var
  nAcctId, nFreightId, nCurrencyId:Real;
  ATaxCodeId:Real;
  AShipmentDtlId:Real;
  AQry:TFDQuery;
  AFreightGlAcctId, aUnitPrice, aarinvtid:Real;
begin
//  with QryArPrePostDetail do
//  try
////    OnNewRecord     := nil;
//    AShipmentDtlId := nShipmentDtlId;
//
//    QryArPrePostDetail.Insert;
//    //QryARPrepostDetailIS_CREDIT_MEMO.asString := 'Y';
//    if AMiscOrdersId <> 0 then
//      QryARPrepostDetailMISC_ORDERS_ID.asFloat := AMiscOrdersId;
//
//    if AIsMiscCharge then
//      QryArPrePostDetail.FieldByName('MISC_COMMENT').asString := 'Misc. Charge';
//
//
//    nFreightId := GetfreightId(AShipmentDtlId);
//    if nFreightId <> 0 then
//    begin
//       QryArPrePostDetail.FieldByName('FREIGHT_ID').asFloat := nFreightId;
//       AFreightGlAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(glacct_id_freight, ''acct_id_shipping'', %f) from freight where id = %f',
//         [nEPlantId, nFreightId]);
//       if AFreightGlAcctId <> 0 then
//         QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat := AFreightGlAcctId;
//    end;
//
//
//    if ADispoType = 'SCRAP' then
//    begin
//      QryARPrepostDetailNO_POST_STD_COST.Readonly := False;
//      QryARPrepostDetailNO_POST_STD_COST.asString := 'Y';
//      QryARPrepostDetailNO_POST_STD_COST.Readonly := True;
//    end;
//
//    QryArPrePostDetail.FieldByName('FREIGHT_PRICE').asFloat := 0;
//    QryArPrePostDetail.FieldByName('ARPREPOST_ID').asFloat  := QryArPrePost.FieldByName('ID').asFloat;
//    if AShipmentDtlId <> 0 then
//    begin
//      QryArPrePostDetail.FieldByName('SHIPMENT_DTL_ID').asFloat := AShipmentDtlId;
//      QryArPrePostDetail.FieldByName('SHIPMENT_DTL_ID2').asFloat := AShipmentDtlId;
//    end;
//    if nOrderDtlId <> 0 then
//      QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat := nOrderDtlId;
//
//    ATaxCodeId := SelectValueFmtAsFloat('select tax_code_id from ord_detail where id = %f', [nOrderDtlId]);
//    if ATaxCodeId = 0 then
//      ATaxCodeId := SelectValueFmtAsFloat('select tax_code_id from hist_ord_detail where id = %f', [nOrderDtlId]);
//
//    if ATaxCodeId = 0 then
//      ATaxCodeId := SelectValueFmtAsFloat('select d.tax_code_id from ord_detail d, shipment_dtl s ' +
//                              ' where s.id = %f and s.order_dtl_id = d.id', [AShipmentDtlId]);
//
//    if ATaxCodeId = 0 then
//      ATaxCodeId := SelectValueFmtAsFloat('select d.tax_code_id from hist_ord_detail d, shipment_dtl s ' +
//                              ' where s.id = %f and s.order_dtl_id = d.id', [AShipmentDtlId]);
//
//
//    if ATaxCodeId = 0 then
//      ATaxCodeId := SelectValueFmtAsFloat('select tax_codes_id from arcusto where id = %f', [QryArPrePostARCUSTO_ID.asFloat]);
//
//
//    if ATaxCodeId <> 0 then
//      QryArPrePostDetail.FieldByName('TAX_CODE_ID').asFloat := ATaxCodeId;
//
//    if TFrmRma(AOwner).DM.TblRmaDtlMISC_CHARGE.asString <> 'Y' then
//      aArinvtId := TFrmRma(AOwner).GetArinvtId
//    else
//      QryArPrePostDetail.FieldByName('MISC_COMMENT').asString := 'Misc. Charge';
//
//    if aArinvtId <> 0 then
//      QryArPrePostDetail.FieldByName('ARINVT_ID').asFloat := aArinvtId;
//
//
//    AUnitPrice := TFrmRma(AOwner).GetUnitPrice;
//    QryArPrePostDetail.FieldByName('UNIT_PRICE').asFloat := aUnitPrice;
//
//    QryArPrePostDetail.FieldByName('INVOICE_QTY').asFloat := AQty;
//
//    if nEPlantId <> 0 then
//      QryArPrePostDetail.FieldByName('EPLANT_ID').asFloat := nEPlantId;
//
//    nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_rma_cr_memo'', %f) from dual', [nEPlantId]);
//
//    if nAcctId = 0 then
//      nAcctId := SelectValueFmtAsFloat('select glacct_id from ord_detail where id = %f', [nOrderDtlId]);
//
//
//    if nAcctId = 0 then
//      nAcctId := SelectValueFmtAsFloat('select g.acct_id_sales ' +
//                           'from arinvt a, arinvt_group g, ' +
//                           'ord_detail d ' +
//                           'where d.arinvt_id = a.id and a.arinvt_group_id = g.id ' +
//                           'and d.id = %f',
//                           [nOrderDtlId]);
//
//    if nAcctId = 0 then
//      nAcctId := SelectValueFmtAsFloat('select acct_id_sales from arinvt where id = %f', [AArinvtId]);
//
//    if nAcctId = 0
//      then nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_sales'', %f) from dual', [nEPlantId]);
//    if nAcctId <> 0
//      then QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := nAcctId;
//
//    QryArPrePostDetail.FieldByName('ID').asFloat := GetNextID('ARPREPOST_DETAIL');
//
//    QryArPrePostDetail.FieldByName('RMA_DETAIL_ID').asFloat := TFrmRma(AOwner).DM.TblRmaDtl.FieldByName('ID').AsFloat;
//    if AShipmentDtlId = 0 then
//    begin
//      if TFrmRma(AOwner).DM.TblRmaDtl.FieldByName('SHIPMENT_DTL_ID').AsFloat  <> 0 then
//        QryArPrePostDetail.FieldByName('SHIPMENT_DTL_ID').asFloat := TFrmRma(AOwner).DM.TblRmaDtl.FieldByName('SHIPMENT_DTL_ID').AsFloat;
//    end;
//
//
//    if nAcctId = 0 then GetGlAcct;
//    nAcctId := QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat;
//    QryArPrePostDetail.Post;
//    InsertCommodity(AArinvtId, QryArPrePostDetail.FieldByName('ID').asFloat);
//    Insert_Deduct_from_Invoice_Total(QryArPrePostDetail.FieldByName('ID').asFloat);
//
//    if nOrderDtlId <> 0 then
//      InsertRMACommissions(QryArPrePostDetail.FieldByName('ID').asFloat, nOrderDtlId);
//
//    if TFrmRma(AOwner).DM.TblRmaDtlMISC_CHARGE.asString <> 'Y' then
////    if bRestock and (ADispoType <> 'SCRAP') then
//    if bRestock then
//    try
////      QryARPrepostDetail.BeforeInsert := nil;
//
//      QryArPrePostDetail.Insert;
//      //QryARPrepostDetailIS_CREDIT_MEMO.asString := 'Y';
//      nFreightId := GetfreightId(AShipmentDtlId);
//
//      if nFreightId <> 0 then
//      begin
//         QryArPrePostDetail.FieldByName('FREIGHT_ID').asFloat := nFreightId;
//         AFreightGlAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(glacct_id_freight, ''acct_id_shipping'', %f) from freight where id = %f',
//           [nEPlantId, nFreightId]);
//         if AFreightGlAcctId <> 0 then
//           QryARPrepostDetailGLACCT_ID_FREIGHT.asFloat := AFreightGlAcctId;
//      end;
//
//
//
//      QryArPrePostDetail.FieldByName('FREIGHT_PRICE').asFloat := 0;
//      QryArPrePostDetail.FieldByName('ARPREPOST_ID').asFloat  := QryArPrePost.FieldByName('ID').asFloat;
//      if nOrderDtlId <> 0 then
//        QryArPrePostDetail.FieldByName('ORD_DETAIL_ID').asFloat := nOrderDtlId;
//
//      QryArPrePostDetail.FieldByName('UNIT_PRICE').asFloat  := AUnitPrice * SelectValueAsFloat('select RESTOCK from iqsys')/100;
//      QryArPrePostDetail.FieldByName('INVOICE_QTY').asFloat := (-1) * AQty;
//      QryArPrePostDetail.FieldByName('MISC_COMMENT').asString := 'Restocking charge';
//
//      nAcctId := SelectValueFmtAsFloat('select g.acct_id_sales ' +
//                           'from arinvt a, arinvt_group g ' +
//                           'where a.arinvt_group_id = g.id ' +
//                           'and a.id = %f', [AArinvtId]);
//
//
//      if nAcctId = 0 then
//        nAcctId := SelectValueFmtAsFloat('select acct_id_sales from arinvt where id = %f', [AArinvtId]);
//      if nAcctId = 0
//        then nAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_sales'', %f) from dual', [nEPlantId]);
//      if nAcctId <> 0
//        then QryArPrePostDetail.FieldByName('GLACCT_ID_SALES').asFloat := nAcctId;
//
//      QryArPrePostDetail.FieldByName('ID').asFloat := GetNextID('ARPREPOST_DETAIL');
//
//      if nAcctId = 0 then GetGlAcct;
//      QryArPrePostDetail.Post;
//    finally
////      QryARPrepostDetail.BeforeInsert := QryARPrepostDetailBeforeInsert;
//  end;
//
//  finally
////    OnNewRecord     := QryArPrePostDetailNewRecord;
////    ReopenQryArPrePostDetail;
//end;



end;


procedure TFrmInvoice.ProcessSACDiscounts(aArprepost_detail_id:Real);
begin
  ExecuteCommandFmt('begin EDI_SAC_DISCOUNTS.InsertSACDiscounts(%f); end;', [aArprepost_detail_id]);
end;

procedure TFrmInvoice.ProcessSACDiscounts2(aArprepost_id:Real);
begin
  ExecuteCommandFmt('begin EDI_SAC_DISCOUNTS.InsertSACDiscounts2(%f); end;', [aArprepost_id]);
end;


procedure TFrmInvoice.GetTaxes(AFinalize: Boolean = false);
var
  ATaxCodesId: Real;
begin
//  if Avalara.AvalaraEnabled(QryArPrepostEPLANT_ID.AsFloat) then
//    begin
//    try
//      with TAvalaraGetTax.Create(self) do
//        try
//          begin
//            GetTax('ARPREPOST', QryArPrepostID.AsFloat, AFinalize);
//
//            ReOpen(ViewArPrepostDetailTotals);
//            SetTaxButton;
//          end;
//        finally
//          Free;
//        end;
//      finally
//      end;
//    end;
end;

procedure TFrmInvoice.BatchGetTax(ABatchId: Real);
var
  ATaxCodesId: Real;
begin
//  if Avalara.AvalaraEnabled(QryArPrepostEPLANT_ID.AsFloat) then
//    begin
//    try
//      with TAvalaraGetTax.Create(self) do
//        try
//          BatchGetTax(ABatchId);
//        finally
//          Free;
//        end;
//      finally
//      end;
//    end;
end;

function TFrmInvoice.CheckTaxCalculated: Boolean;
var
  APromptResult: TModalResult;
begin
//  Result := true;
//  if FRecalcTax and Avalara.AvalaraEnabled(QryArPrepostEPLANT_ID.AsFloat) then
//    if (SelectValueFmtAsString('select nvl(tax_calculated, ''N'') from arprepost where id = %.0f', [QryArPrepostID.AsFloat]) = 'N') then
//      begin
//        // Changes have been made since taxes were last calculated. Recalculate now?
//        APromptResult := iqmesg.IQConfirmEx (oe_rscstr.cTXT0000169, [mbYes, mbNo, mbCancel]);
//        if (APromptResult in [mrYes, mrCancel]) then
//            Result := false;
//        if (APromptResult = mrYes) then
//          begin
//            GetTaxes;
//            ReOpen(ViewArPrepostDetailTotals);
//            RefreshDatasetById(QryARPrepost);
//            RefreshDatasetById(QryARPrepostDetail);
//          end;
//      end;
end;

procedure TFrmInvoice.SetTaxButton;
begin
//  SBTaxBreakdown.Visible := (not Avalara.AvalaraEnabled(QryArPrepostEPLANT_ID.AsFloat)) or
//   (SelectValueFmtAsString('select nvl(tax_calculated, ''N'') from arprepost where id = %.0f', [QryArPrepostID.AsFloat]) = 'Y');
//  SBCalcTax.Visible := not SBTaxBreakdown.Visible;
end;

procedure TFrmInvoice.CheckARIndivUser;
begin
  ExecuteCommandFmt('begin ar.CheckARIndivUser(%f); end;', [QryArPrepostDetail.FieldByname('id').asFloat]);
end;


procedure TFrmInvoice.QryArPrePostAfterPost(DataSet: TDataSet);
begin
//  QryArPrePost.ApplyUpdates(0);
  FRecalcTax := true;
end;

procedure TFrmInvoice.QryArPrePostAfterDelete(DataSet: TDataSet);
begin
//  QryArPrePost.ApplyUpdates(0);
  QryArPrePost.Close;
  QryArPrePost.Open;
end;



end.
