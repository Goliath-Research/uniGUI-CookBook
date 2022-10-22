unit demo_salesorders_dm;

interface

Uses
  MainModule,
  Winapi.Windows, 
  Winapi.Messages, 
  System.SysUtils, 
  System.Classes, 
  Vcl.Graphics, 
  Vcl.Controls,
  Vcl.Forms, 
  Vcl.Dialogs,
  Data.DB,
//  Vcl.Wwdatsrc,
  System.Variants,
  oe_misc,
  FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.DataCoordinator,
//  Iqhpick,
  IQMS.WebVcl.HPick;

type
  TReleaseCargo = class
     ID               : Real;
     Quan             : Real;
     Cum_Quan          : Real;
     Promise_Date     : TDateTime;
     Seq              : Real;
     Ship_Date        : TDateTime;
     Shipped_Quan     : Real;
     constructor Create( AID, AQuan, ACum_Quan, ASeq: Real; APromise_Date, AShip_Date: TDateTime );
  end;

  TShipDateContent = ( sdcDoesNotMatter, sdcShipDateIsNull, sdcShipDateIsNotNull );

  TOE_DM = class( TDataModule )
    SrcOrders: TDataSource;
    TblOrders: TFDQuery;
    tblOrd_detail: TFDTable;
    SrcOrd_Detail: TDataSource;
    tblOrd_detailID: TBCDField;
    tblOrd_detailORDERS_ID: TBCDField;
    tblOrd_detailARINVT_ID: TBCDField;
    tblOrd_detailORD_DET_SEQNO: TBCDField;
    tblOrd_detailTOTAL_QTY_ORD: TBCDField;
    tblOrd_detailCUMM_SHIPPED: TBCDField;
    tblOrd_detailTAX_CODE_ID: TBCDField;
    tblOrd_detailMISC_ITEM: TStringField;
    TblOrd_detailUNIT_PRICE: TFMTBCDField;
    SrcReleases: TDataSource;
    TblOrdersID: TBCDField;
    TblOrdersORDERNO: TStringField;
    TblOrdersPONO: TStringField;
    TblOrdersARCUSTO_ID: TBCDField;
    TblOrdersORD_DATE: TDateTimeField;
    TblOrdersORD_BY: TStringField;
    TblOrdersDATE_TAKEN: TDateTimeField;
    TblOrdersBILL_TO_ID: TBCDField;
    TblOrdersSHIP_TO_ID: TBCDField;
    TblOrdersCUSER1: TStringField;
    TblOrdersCUSER2: TStringField;
    TblOrdersCUSER3: TStringField;
    TblOrdersCUSER5: TStringField;
    TblOrdersCUSER6: TStringField;
    TblOrdersTIMESTAMP: TDateTimeField;
    SrcBill_To: TDataSource;
    TblBill_to: TFDTable;
    SrcShip_To: TDataSource;
    TblShip_To: TFDTable;
    tblOrd_detailONHOLD: TStringField;
    tblOrd_detailItemNumber: TStringField;
    tblOrd_detailDescription: TStringField;
    TblShip_ToID: TBCDField;
    TblShip_ToARCUSTO_ID: TBCDField;
    TblShip_ToATTN: TStringField;
    TblShip_ToADDR1: TStringField;
    TblShip_ToADDR2: TStringField;
    TblShip_ToADDR3: TStringField;
    TblShip_ToCITY: TStringField;
    TblShip_ToSTATE: TStringField;
    TblShip_ToCOUNTRY: TStringField;
    TblShip_ToZIP: TStringField;
    TblShip_ToSHIP_TIME: TBCDField;
    TblShip_ToPHONE_NUMBER: TStringField;
    TblShip_ToFAX: TStringField;
    TblShip_ToPRIME_CONTACT: TStringField;
    TblBill_toID: TBCDField;
    TblBill_toARCUSTO_ID: TBCDField;
    TblBill_toATTN: TStringField;
    TblBill_toADDR1: TStringField;
    TblBill_toADDR2: TStringField;
    TblBill_toADDR3: TStringField;
    TblBill_toCITY: TStringField;
    TblBill_toSTATE: TStringField;
    TblBill_toCOUNTRY: TStringField;
    TblBill_toZIP: TStringField;
    TblBill_toPHONE_NUMBER: TStringField;
    TblBill_toFAX: TStringField;
    TblBill_toPRIME_CONTACT: TStringField;
    SrcQryBillTo2: TDataSource;
    SrcQryShipTo2: TDataSource;
    QryBillTo: TFDQuery;
    QryShipTo: TFDQuery;
    tblOrd_detailDisp_Descript: TStringField;
    tblOrd_detailArinvtClass: TStringField;
    QryBillToID: TBCDField;
    QryBillToATTN: TStringField;
    QryShipToID: TBCDField;
    QryShipToATTN: TStringField;
    TblOrdersCUSTNO: TStringField;
    TblBill_toEXT: TStringField;
    TblShip_ToEXT: TStringField;
    tblOrd_detailLookupItemNumber: TStringField;
    procArchiveOrder: TFDStoredProc;
    TblBill_toCityStateZip: TStringField;
    TblShip_ToCityStateZip: TStringField;
    TblOrdersFOB: TStringField;
    TblOrdersCHANGEUSER_ID: TStringField;
    TblOrdersTERMS_ID: TBCDField;
    TblShip_ToTAX_CODE_ID: TBCDField;
    TblOrdersCOMPANY: TStringField;
    QryBillToARCUSTO_ID: TBCDField;
    QryBillToADDR1: TStringField;
    QryBillToADDR2: TStringField;
    QryBillToADDR3: TStringField;
    QryBillToCITY: TStringField;
    QryBillToSTATE: TStringField;
    QryBillToCOUNTRY: TStringField;
    QryBillToZIP: TStringField;
    QryBillToPHONE_NUMBER: TStringField;
    QryBillToEXT: TStringField;
    QryBillToFAX: TStringField;
    QryBillToPRIME_CONTACT: TStringField;
    QryShipToARCUSTO_ID: TBCDField;
    QryShipToADDR1: TStringField;
    QryShipToADDR2: TStringField;
    QryShipToADDR3: TStringField;
    QryShipToCITY: TStringField;
    QryShipToSTATE: TStringField;
    QryShipToCOUNTRY: TStringField;
    QryShipToZIP: TStringField;
    QryShipToSHIP_TIME: TBCDField;
    QryShipToTAX_CODE_ID: TBCDField;
    QryShipToPHONE_NUMBER: TStringField;
    QryShipToEXT: TStringField;
    QryShipToFAX: TStringField;
    QryShipToPRIME_CONTACT: TStringField;
    tblOrd_detailBackLog: TFloatField;
    tblOrd_detailSALESPEOPLE_ID: TBCDField;
    TblOrdersFREIGHT_ID: TBCDField;
    TblFreight: TFDTable;
    TblOrdersFREIGHT_COMP: TStringField;
    SrcFreight: TDataSource;
    TblShip_ToFREIGHT_ID: TBCDField;
    TblShip_ToFreight_comp: TStringField;
    tblOrd_detailTotalPrice: TFloatField;
    QryTerms: TFDQuery;
    TblSales: TFDTable;
    TblSalesID: TBCDField;
    TblSalesEMPLOYEE_ID: TBCDField;
    TblSalesSALES_CODE: TStringField;
    TblSalesFIRST_NAME: TStringField;
    TblSalesLAST_NAME: TStringField;
    TblSalesVENDOR_ID: TBCDField;
    tblOrd_detailTot_Releases: TFloatField;
    TblAKA: TFDTable;
    TblAKAID: TBCDField;
    TblAKAARINVT_ID: TBCDField;
    TblAKACUST_ITEMNO: TStringField;
    TblAKACUST_DESCRIP: TStringField;
    TblAKAARCUSTO_ID: TBCDField;
    TblOrdersFREE_FORM: TStringField;
    QryReleases: TFDQuery;
    QryReleasesORD_DETAIL_ID: TBCDField;
    QryReleasesREQUEST_DATE: TDateTimeField;
    QryReleasesPROMISE_DATE: TDateTimeField;
    QryReleasesSEQ: TBCDField;
    QryReleasesQUAN: TBCDField;
    QryReleasesFORECAST: TStringField;
    QryReleasesSHIP_DATE: TDateTimeField;
    QryReleasesCUSER1: TStringField;
    QryReleasesUNIT_PRICE: TFMTBCDField;
    QryReleasesReleased: TFloatField;
    QryReleasesLeftToShip: TFloatField;
    UpdateSQL1: TFDUpdateSQL;
    QryReleasesCum_Quan: TFloatField;
    QryInvoiced: TFDQuery;
    TblOrd_detailPRICE_PER_1000: TFMTBCDField;
    SrcPtAllocate: TDataSource;
    QryPtAllocate: TFDQuery;
    QryPtAllocatePTALLOCATE_ID: TBCDField;
    TblOrdersDISCOUNT: TBCDField;
    TblOrdersUSERID: TStringField;
    QryOrdTotal: TFDQuery;
    SrcOrdTotal: TDataSource;
    TblOrd_detailLIST_UNIT_PRICE: TFMTBCDField;
    tblOrd_detailDISCOUNT: TBCDField;
    TblOrdersCONTACT_ID: TBCDField;
    QryContact: TFDQuery;
    QryContactID: TBCDField;
    QryContactNAME: TStringField;
    QryContactFIRST_NAME: TStringField;
    QryContactLAST_NAME: TStringField;
    TblOrdersCONTACTNAME: TStringField;
    tblOrd_detailAkaItemNo: TStringField;
    tblOrd_detailAkaDescrip: TStringField;
    QryReleasesID: TBCDField;
    tblCurrency: TFDTable;
    TblOrdersCURRENCY_ID: TBCDField;
    tblOrd_detailECODE: TStringField;
    QryBreakDownTaxes: TFDQuery;
    QryBreakDownTaxesDESCRIP: TStringField;
    QryBreakDownTaxesTAX_RATE: TFMTBCDField;
    QryBreakDownTaxesTAX_AMOUNT: TFMTBCDField;
    tblOrd_detailCOMMENT1: TStringField;
    QryReleasesUSER_DATE: TDateTimeField;
    SrcComm: TDataSource;
    TblComm: TFDTable;
    TblCommID: TBCDField;
    TblCommORD_DETAIL_ID: TBCDField;
    TblCommSALESPEOPLE_ID: TBCDField;
    TblCommCOMMISSION_PERCENT: TFMTBCDField;
    TblCommFirstName: TStringField;
    TblCommLastName: TStringField;
    TblCommSalesCode: TStringField;
    tblOrd_detailSalesPerson: TStringField;
    tblOrd_detailTotalComm: TFloatField;
    tblOrd_detailCommPrcnt: TFloatField;
    TblShip_ToFOB: TStringField;
    TblOrdersREV: TBCDField;
    TblOrdersOE_CONTROL: TStringField;
    tblOrd_detailArinvtRev: TStringField;
    QryShipToEPLANT_ID: TBCDField;
    TblOrdersEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    TblOrdersEPLANT_NAME: TStringField;
    tblOrd_detailEPLANT_ID: TBCDField;
    tblOrd_detailEPlant_Name: TStringField;
    QryFreight: TFDQuery;
    tblOrd_detailCOMM_PCT: TBCDField;
    tblOrd_detailCOST_OBJECT_SOURCE: TStringField;
    tblOrd_detailCOST_OBJECT_ID: TBCDField;
    tblOrd_detailCost_Source: TStringField;
    QryFob: TFDQuery;
    QryFobDESCRIP: TStringField;
    TblOrdersEDI_855_CREATED: TStringField;
    TblOrdersWEB_ORDERS_ID: TBCDField;
    QryReleasesORIG_QUAN: TBCDField;
    tblOrd_detailUNIT: TStringField;
    tblOrd_detailArinvt_Unit: TStringField;
    tblOrd_detailUOM_FACTOR: TFMTBCDField;
    tblOrd_detailGLACCT_ID: TBCDField;
    tblOrd_detailAcct: TStringField;
    tblOrd_detailDOCKID: TStringField;
    tblOrd_detailLINEFEED: TStringField;
    tblOrd_detailRESERVELOCATION: TStringField;
    tblOrd_detailTotal_invoiced: TFloatField;
    tblOrd_detailKBTRIGGER: TStringField;
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
    tblOrd_detailCUST_CUM_START: TBCDField;
    tblOrd_detailLAST_RECEIPT_QTY: TBCDField;
    tblOrd_detailLAST_RECEIPT_DATE: TDateTimeField;
    QryReleasesRAN: TStringField;
    QryReleasesSHIP_TO_ID: TBCDField;
    QryReleasesSHIP_TO_ATTN: TStringField;
    QryReleasesSHIPPED_QUAN: TBCDField;
    tblOrd_detailRMA_DETAIL_ID: TBCDField;
    tblOrd_detailREF_CODE_ID: TBCDField;
    QryRefCode: TFDQuery;
    QryRefCodeCATEGORY_ID: TBCDField;
    QryRefCodeCATEGORY_DESCRIP: TStringField;
    QryRefCodeREF_CODE_ID: TBCDField;
    QryRefCodeREF_CODE_DESCRIP: TStringField;
    QryRefCodeREF_CODE: TStringField;
    tblOrd_detailREF_CODE_DESCRIP: TStringField;
    tblOrd_detailREF_CODE: TStringField;
    tblOrd_detailFAB_QTY: TBCDField;
    tblOrd_detailRAW_MT_QTY: TBCDField;
    tblOrd_detailFAB_START_DATE: TDateTimeField;
    tblOrd_detailFAB_END_DATE: TDateTimeField;
    TblOrdersARCUSTO_CREDIT_CARD_ID: TBCDField;
    tblOrd_detailCONTAINERS: TBCDField;
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
    TblOrdersDIVISION_ID: TBCDField;
    QryReleasesDATE_TYPE: TStringField;
    QryReleasesCUSER2: TStringField;
    QryReleasesBATCH_NO: TStringField;
    QryReleasesJOB_SEQ: TBCDField;
    tblOrd_detailTax_Code: TStringField;
    QryReleasesMUST_SHIP_DATE: TDateTimeField;
    tblOrd_detailAkaRev: TStringField;
    QryDivision: TFDQuery;
    QryDivisionID: TBCDField;
    QryDivisionNAME: TStringField;
    QryDivisionDESCRIP: TStringField;
    QryShipToDIVISION_NAME: TStringField;
    TblOrdersCRM_QUOTE_ID: TBCDField;
    tblOrd_detailSHIP_TO_ID_FROM: TBCDField;
    TblOrdersIS_INTERCOMP: TStringField;
    QryReleasesACK: TStringField;
    TblOrdersCOMMENT1: TStringField;
    QryShipToPK_HIDE: TStringField;
    TblOrdersARCUSTO_STATUS: TStringField;
    TblOrdersIS_OUTSOURCE_VENDOR: TStringField;
    QryReleasesUSER_DATE_2: TDateTimeField;
    QryReleasesUSER_DATE_3: TDateTimeField;
    tblOrd_detailIS_DROP_SHIP: TStringField;
    tblOrd_detailIS_MAKE_TO_ORDER: TStringField;
    TblOrdersPAYMENT_TYPE: TFMTBCDField;
    TblOrdersPaymentTypeStr: TStringField;
    ProcOverdue: TFDStoredProc;
    ProcOverdueInv: TFDStoredProc;
    TblOrdersEXT_COMMENT1: TStringField;
    QryFreightID: TBCDField;
    QryFreightDESCRIP: TStringField;
    TblOrdersEDI_CHANGE_DATE: TDateTimeField;
    QryReleasesINTERNAL_UPDATE_TYPE: TStringField;
    tblOrd_detailPO_INFO: TStringField;
    QryReleasesLOCK_MUST_SHIP_DATE: TStringField;
    tblOrd_detailHardAllocatedVia: TStringField;
    tblOrd_detailMAKE_TO_ORDER_PS_TICKET_DTL_ID: TBCDField;
    tblOrd_detailICT_Ship_To_From_Attn: TStringField;
    TblOrdersCUSER4: TStringField;
    tblOrd_detailDescription2: TStringField;
    QryReleasesREL_DATE: TDateTimeField;
    QryReleasesPTORDER_ID: TFMTBCDField;
    QryReleasesCUSER3: TStringField;
    QryCampaign: TFDQuery;
    QryCampaignID: TBCDField;
    QryCampaignCODE: TStringField;
    QryCampaignDESCRIPTION: TStringField;
    QryCampaignARCHIVED: TStringField;
    QryCampaignPK_HIDE: TStringField;
    tblOrd_detailCAMPAIGN_ID: TBCDField;
    tblOrd_detailCampaignCode: TStringField;
    TblOrdersORD_LINE_DATE: TDateTimeField;
    SrcQuickOE: TDataSource;
    QryQuickOE: TFDQuery;
    QryQuickOEID: TBCDField;
    QryQuickOEORDERS_ID: TBCDField;
    QryQuickOEARINVT_ID: TBCDField;
    QryQuickOEORD_DET_SEQNO: TBCDField;
    QryQuickOEUNIT: TStringField;
    QryQuickOEUNIT_PRICE: TFMTBCDField;
    QryQuickOEEPLANT_ID: TBCDField;
    QryQuickOERELEASES_ID: TBCDField;
    QryQuickOEQUAN: TBCDField;
    QryQuickOEPROMISE_DATE: TDateTimeField;
    QryQuickOERELEASES_COUNT: TFMTBCDField;
    QryQuickOeDescrip: TStringField;
    QryQuickOEDescrip2: TStringField;
    QryQuickOERev: TStringField;
    QryQuickOEClass: TStringField;
    QryLookupArinvt: TFDQuery;
    QryLookupArinvtID: TBCDField;
    QryLookupArinvtITEMNO: TStringField;
    QryLookupArinvtDESCRIP: TStringField;
    QryLookupArinvtREV: TStringField;
    QryQuickOETOTAL_QTY_ORD: TBCDField;
    QryQuickOEUOM_FACTOR: TFMTBCDField;
    QryQuickOEMISC_ITEM: TStringField;
    QryQuickOEArinvt_Unit: TStringField;
    QryQuickOEDISCOUNT: TBCDField;
    QryQuickOELIST_UNIT_PRICE: TFMTBCDField;
    QryQuickOEPRICE_PER_1000: TFMTBCDField;
    QryQuickOEORIG_QUAN: TBCDField;
    QryQuickOEINTERNAL_UPDATE_TYPE: TStringField;
    QryQuickOEItemNo_Disp: TStringField;
    QryQuickOECUMM_SHIPPED: TBCDField;
    QryLookupArinvtEPLANT_ID: TBCDField;
    QryQuickOEGLACCT_ID: TBCDField;
    QryQuickOEDisp_Descript: TStringField;
    QryQuickOEItemNumber: TStringField;
    QryQuickOEAcct: TStringField;
    QryQuickOEAkaDescrip: TStringField;
    QryQuickOEAkaItemNo: TStringField;
    TblOrdersCRM_RFQNO: TStringField;
    QryShipToSHIP_VIA: TStringField;
    TblOrdersFREIGHT_CHARGE: TFMTBCDField;
    TblOrdersFREIGHT_QUOTENO: TStringField;
    QryQuickOETAX_CODE_ID: TBCDField;
    QryReleasesFREIGHT_ID: TBCDField;
    QryReleasesSHIPVIA: TStringField;
    tblOrd_detailIN_TRANSIT_PARTNO_ID: TBCDField;
    QryQuickOEIS_MAKE_TO_ORDER: TStringField;
    QryQuickOERMA_DETAIL_ID: TBCDField;
    QryQuickOECOMMENT1: TStringField;
    QryQuickOECOST_OBJECT_SOURCE: TStringField;
    QryQuickOECOST_OBJECT_ID: TBCDField;
    QryQuickOEBackLog: TFloatField;
    QryReleasesWO_NOTE: TStringField;
    tblOrd_detailCRM_QUOTE_DETAIL_ID: TBCDField;
    TblOrdersCONTACT_ID2: TBCDField;
    tblOrd_detailCUSER1: TStringField;
    tblOrd_detailCUSER2: TStringField;
    tblOrd_detailCUSER3: TStringField;
    tblOrd_detailREBATE_PARAMS_ID: TBCDField;
    tblOrd_detailRebateParam: TStringField;
    QryFreightPK_HIDE: TStringField;
    SrcCommQuick: TDataSource;
    TblCommQuick: TFDTable;
    FloatField4: TBCDField;
    FloatField5: TBCDField;
    FloatField6: TBCDField;
    FloatField8: TFMTBCDField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    QryQuickOESALESPEOPLE_ID: TBCDField;
    QryQuickOEREBATE_PARAMS_ID: TBCDField;
    QrySOContact: TFDQuery;
    StringField42: TStringField;
    FloatField10: TBCDField;
    StringField43: TStringField;
    StringField44: TStringField;
    QrySOContactSOURCE: TStringField;
    tblOrd_detailHIDE: TStringField;
    tblOrd_detailAkaDescrip2: TStringField;
    TblCommAMOUNT: TBCDField;
    tblOrd_detailPhantom: TStringField;
    QryQuickOEPhantom: TStringField;
    tblOrd_detailPHANTOM_ORD_DETAIL_ID: TBCDField;
    tblOrd_detailPHANTOM_PTSPER: TFMTBCDField;
    QryQuickOEPHANTOM_ORD_DETAIL_ID: TBCDField;
    QryQuickOEPHANTOM_PTSPER: TFMTBCDField;
    QryReleasesPHANTOM_RELEASES_ID: TBCDField;
    QryReleasesPENDING_VERIFICATION: TStringField;
    QryReleasesINVENTORY_VERIFIED_DATE: TDateTimeField;
    QryReleasesEXCLUDE_SCHED: TStringField;
    QryFreightEPLANT_ID: TBCDField;
    tblOrd_detailIncludePhantomComponents: TStringField;
    QryQuickOEIncludePhantomComponents: TStringField;
    TblOrdersCRM_OPPORTUNITY_ID: TBCDField;
    TblOrdersCRM_OPPORTUNITY_NO: TStringField;
    tblOrd_detailSTANDARD_ID: TBCDField;
    tblOrd_detailDIVISION_ID: TBCDField;
    tblOrd_detailMfgNo: TStringField;
    tblOrd_detailDivision: TStringField;
    QryQuickOESTANDARD_ID: TBCDField;
    QryQuickOEDIVISION_ID: TBCDField;
    tblOrd_detailAKA_KIND: TStringField;
    tblOrd_detailMfg_Division: TStringField;
    QryQuickOEAKA_KIND: TStringField;
    TblShip_ToFOB_THIRD_PARTY_ID: TBCDField;
    TblOrdersFOB_THIRD_PARTY_ID: TBCDField;
    TblOrdersCURRENCYCODE: TStringField;
    tblOrd_detailMfgnoDefault: TStringField;
    TblOrdersCUST_SO_NOTE: TStringField;
    TblOrdersSHIP_TO_SO_NOTE: TStringField;
    QryOrdTotalQuick: TFDQuery;
    SrcOrdTotalQuick: TDataSource;
    QryOrdTotalQuickORDERS_ID: TBCDField;
    QryOrdTotalQuickTOTAL_PRICE: TFMTBCDField;
    QryOrdTotalQuickTOTAL_TAX: TFMTBCDField;
    QryOrdTotalQuickGRAND_TOTAL: TFMTBCDField;
    QryOrdTotalQuickGrand: TFloatField;
    tblOrd_detailSHIPHOLD: TStringField;
    TblSalesMIDDLE_NAME: TStringField;
    TblCommMIDDLE_NAME: TStringField;
    TblOrdersEDI_865_CREATED: TStringField;
    QryReleasesEXPEDITE: TStringField;
    TblOrdersDROP_SHIP_PO_ID: TBCDField;
    TblOrdersDROPSHIPPONO: TStringField;
    QryQuickOEIS_DROP_SHIP: TStringField;
    QryQuickOESalesPerson: TStringField;
    QryQuickOEPO_INFO: TStringField;
    QryQuickOECUSER1: TStringField;
    QryQuickOENote: TStringField;
    TblOrdersCAMPAIGN_ID: TBCDField;
    TblOrdersCAMPAIGNCODE: TStringField;
    QryReleasesIS_ON_PICKTICKET: TStringField;
    tblOrd_detailAUTO_INVOICE: TStringField;
    QryQuickOEAUTO_INVOICE: TStringField;
    tblOrd_detailNonCommitted: TFloatField;
    tblOrd_detailOnHand: TFloatField;
    TblOrdersCARRIER_ACCT_NUMBER: TStringField;
    QryLookupArinvtCLASS: TStringField;
    QryBillToPK_HIDE: TStringField;
    QryQuickOEDivision: TStringField;
    tblOrd_detailC_PO_MISC_ID: TBCDField;
    QryQuickOEC_PO_MISC_ID: TBCDField;
    TblOrdersAPPROVED: TStringField;
    TblOrdersAPPROVAL_REQUIRED: TStringField;
    tblOrd_detailHasQualityException: TStringField;
    tblOrd_detailMISC_ITEMNO: TStringField;
    QryQuickOEMISC_ITEMNO: TStringField;
    TblCommQuickAMOUNT: TBCDField;
    TblOrdersFREIGHT_ACCOUNT_NUMBER: TStringField;
    QryContactEPLANT_ID: TBCDField;
    QrySOContactEPLANT_ID: TBCDField;
    tblOrd_detailSAMPLE: TStringField;
    TblCommCOMMISSIONS_ID: TBCDField;
    TblCommQuickCOMMISSIONS_ID: TBCDField;
    TblOrdersIS_MANUAL_OUTSOURCE: TStringField;
    tblOrd_detailTotalShipInv: TFloatField;
    tblOrd_detailConfigCode: TStringField;
    TblOrdersCustDiscount: TStringField;
    tblOrd_detailDetailDiscount: TStringField;
    TblOrdersSHIP_COMPLETE: TStringField;
    TblOrdersBILL_TO_ATTN: TStringField;
    TblOrdersSHIP_TO_ATTN: TStringField;
    TblOrdersCREDIT_CARD_LAST_FOUR: TStringField;
    FDUpdateSQL_Orders: TFDUpdateSQL;
    QryQuickOETax_Code: TStringField;
    QryOrdTotalTOTAL_PRICE: TFMTBCDField;
    QryOrdTotalTOTAL_TAX: TFMTBCDField;
    QryOrdTotalFREIGHT_CHARGE: TFMTBCDField;
    QryOrdTotalGRAND_TOTAL: TFMTBCDField;
    QryOrdTotalORDERS_ID: TBCDField;
    SrcContact: TDataSource;
    SrcSOContact: TDataSource;
    SrcDivision: TDataSource;
    SrcFob: TDataSource;
    SrcTerms: TDataSource;
    SrcFreightLookup: TDataSource;
    procedure SrcOrdersDataChange(Sender: TObject; Field: TField);
    procedure TblOrdersBeforePost(DataSet: TDataSet);
    procedure tblOrd_detailBeforePost(DataSet: TDataSet);
    procedure tblOrd_detailCalcFields(DataSet: TDataSet);
    procedure tblOrd_detailTOTAL_QTY_ORDChange(Sender: TField);
    procedure TblOrd_detailNewRecord(DataSet: TDataSet);
    procedure TblReleasesBeforeEdit(DataSet: TDataSet);
    procedure TblReleasesNewRecord(DataSet: TDataSet);
    procedure TblReleasesREQUEST_DATEChange(Sender: TField);
    procedure TblReleasesAfterPost(DataSet: TDataSet);
    procedure TblBill_toCalcFields(DataSet: TDataSet);
    procedure TblShip_ToCalcFields(DataSet: TDataSet);
    procedure tblOrd_detailBeforeEdit(DataSet: TDataSet);
    procedure TblOrdersCalcFields(DataSet: TDataSet);
    procedure tblOrd_detailBeforeDelete(DataSet: TDataSet);
    procedure tblOrd_detailAfterPost(DataSet: TDataSet);
    procedure PkArcustoIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkOrdersIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure TblReleasesCalcFields(DataSet: TDataSet);
    procedure tblOrd_detailAfterCancel(DataSet: TDataSet);
    procedure TblOrdersAfterInsert(DataSet: TDataSet);
    procedure OE_DMCreate(Sender: TObject);
    procedure QryReleasesBeforePost(DataSet: TDataSet);
    procedure UpdateMirrorField( Sender: TField );
    procedure TblOrd_detailARINVT_IDChange(Sender: TField);
    procedure SrcOrd_DetailDataChange(Sender: TObject; Field: TField);
    procedure TblOrdersBeforeEdit(DataSet: TDataSet);
    procedure TblOrdersDISCOUNTChange(Sender: TField);
    procedure TblOrdersAfterPost(DataSet: TDataSet);
    procedure SrcOrdTotalDataChange(Sender: TObject; Field: TField);
    procedure SrcReleasesDataChange(Sender: TObject; Field: TField);
    procedure TblCommBeforePost(DataSet: TDataSet);
    procedure TblCommBeforeEdit(DataSet: TDataSet);
    procedure TblCommAfterPost(DataSet: TDataSet);
    procedure TblOrdersBeforeScroll(DataSet: TDataSet);
    procedure TblOrdersAfterScroll(DataSet: TDataSet);
    procedure PkShipToBeforeOpen(DataSet: TDataSet);
    procedure QryReleasesBeforeDelete(DataSet: TDataSet);
    procedure QryReleasesBeforeInsert(DataSet: TDataSet);
    procedure QryShipToBeforeOpen(DataSet: TDataSet);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure PkOrdDetailBeforeOpen(DataSet: TDataSet);
    procedure tblOrd_detailBeforeInsert(DataSet: TDataSet);
    procedure OE_DMDestroy(Sender: TObject);
    procedure TblArInvtLookUpBeforeOpen(DataSet: TDataSet);
    procedure PkAcctBeforeOpen(DataSet: TDataSet);
    procedure tblCurrencyBeforeOpen(DataSet: TDataSet);
    procedure QryCurrencyBeforeOpen(DataSet: TDataSet);
    procedure TblOrdersSHIP_TO_IDChange(Sender: TField);
    procedure TblOrdersFREIGHT_IDChange(Sender: TField);
    procedure PkMakeToOrderLocationBeforeOpen(DataSet: TDataSet);
    procedure QryReleasesLOCK_MUST_SHIP_DATEChange(Sender: TField);
    procedure QryReleasesAfterInsert(DataSet: TDataSet);
    procedure PkICTShipFromBeforeOpen(DataSet: TDataSet);
    procedure tblOrd_detailFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure QryQuickOEUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure CommitUpdates(DataSet: TDataSet);
    procedure QryQuickOEBeforePost(DataSet: TDataSet);
    procedure QryQuickOEBeforeEdit(DataSet: TDataSet);
    procedure QryQuickOENewRecord(DataSet: TDataSet);
    procedure QryQuickOECalcFields(DataSet: TDataSet);
    procedure QryQuickOETOTAL_QTY_ORDChange(Sender: TField);
    procedure QryQuickOEARINVT_IDChange(Sender: TField);
    procedure SrcQuickOEDataChange(Sender: TObject; Field: TField);
    procedure QryContactBeforeOpen(DataSet: TDataSet);
    procedure QryQuickOEAfterDelete(DataSet: TDataSet);
    procedure TblCommQuickBeforePost(DataSet: TDataSet);
    procedure QryQuickOEBeforeDelete(DataSet: TDataSet);
    procedure PkBOMBeforeOpen(DataSet: TDataSet);
    procedure QryQuickOEBeforeInsert(DataSet: TDataSet);
    procedure QryOrdTotalQuickCalcFields(DataSet: TDataSet);
    procedure PkOrdersIQCreateHPickColumn(Sender: TObject; AField: TField);
    procedure TblOrdersBeforeInsert(DataSet: TDataSet);
    procedure PkOrdersIQBeforeCreateHPickColumn(Sender: TObject; AField: TField;
      var ACanCreateColumn: Boolean);
    procedure PkOrderHistIQBeforeCreateHPickColumn(Sender: TObject;
      AField: TField; var ACanCreateColumn: Boolean);
    procedure PkWaveIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkWaveBeforeOpen(DataSet: TDataSet);
    procedure QryQuickOEARINVT_IDSetText(Sender: TField; const Text: string);
    procedure tblOrd_detailSAMPLEValidate(Sender: TField);
    procedure tblOrd_detailSAMPLEChange(Sender: TField);
    procedure TblCommBeforeDelete(DataSet: TDataSet);
    procedure TblOrdersARCUSTO_IDChange(Sender: TField);
    procedure TblOrd_detailUNIT_PRICEChange(Sender: TField);
    procedure QryQuickOEUNIT_PRICEChange(Sender: TField);
    procedure PkArInvtBeforeOpen(DataSet: TDataSet);
    procedure TblCommNewRecord(DataSet: TDataSet);
    procedure TblOrdersNewRecord(DataSet: TDataSet);
    procedure DoGetText_NullToZeroCurrency(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QryQuickOEAfterPost(DataSet: TDataSet);
    procedure QryBillToBeforeOpen(DataSet: TDataSet);
    procedure TblOrdersORD_LINE_DATEChange(Sender: TField);
    procedure TblOrdersAfterDelete(DataSet: TDataSet);
    procedure PkBogoChildrenBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FDeliveryDate: TDateTime;
    FDeliveryDateChanged: Boolean;

    FBill_To_ID: Real;
    FShip_To_ID: Real;
    //FQtyOrd:Real;
    FDiscountChanged  : Boolean;
    FShip_To_Changed  : Boolean;
    FArinvt_ID_Changed: Boolean;
    FFreight_Changed  : Boolean;
    FArcusto_Id_Changed: Boolean;
    FUnitPriceChangeAccepted: Boolean;
    FUnitPriceChanged: Boolean;
    FTotalQtyChanged: Boolean;

    FPkFilter_FilterInventoryByCustomer: Boolean;

    FShip_To_Comissions_id  : Real;

    FPostingState: TPostingState;  // oe_misc.pas
    FDeletedOrd_Detail_ID: Real;
    FIsDeletedOrdDetailPhantom: Boolean;

    FOrderChanged: Boolean;
    FNewOrder: Boolean;
    // 02/01/2016 (EIQ-10573, Byron) The FOrderIsPosting flag helps corrects a
    // speed issue.
    FOrderIsPosting: Boolean;

    FPartiallyShipped :Real;
    FCurrentOrdDetailID:Real;
    FReleasesQuan:Real;

    FBASED_ON_STD_PRICE:String;
    FAR_DISCOUNT_TIERS_ID:Real;
    FDISCOUNT_PRICE:Real;

    FReleasesList: TList;
    FQty:Real;
    FRequestDate: TDateTime;
    FPromiseDate: TDateTime;
    FReleasesShip_To_ID: Real;

    FBlanketQty: Real;
    FDetailIsHidden: Boolean;

    FQuickDeleting: boolean;
    FIS_MAKE_TO_ORDER:String;

    FQuickQty:Real;
    FQuickPromiseDate: TDateTime;

    FCheckManuallyGeneratedWorkOrders: Boolean;

    FReleasesPostingState: TPostingState;  // oe_misc.pas
    FDeletedReleases_ID: Real;

    FCurrentApprovalRequired: string;
    FOrdDetilAmountChanged:boolean;
    FOrdDetilPriceChanged:boolean;
    FResetDrop_ship_po_id:boolean;



    FOldRelseq:String;
    FOldRelquan:String;
    FOldRelforecast:String;
    FOldRelship_date:String;
    FOldRelcuser1:String;
    FOldRelunit_price:String;
    FOldReleid:String;
    FOldReledate_time:String;
    FOldRelecopy:String;
    FOldReluser_date:String;
    FOldRelshipped_crw:String;
    FOldRelorig_quan:String;
    FOldRelran:String;
    FOldRelship_to_id:String;
    FOldRelshipped_quan:String;
    FOldReldate_type:String;
    FOldRelcuser2:String;
    FOldRelbatch_no:String;
    FOldReljob_seq:String;
    FOldRelmust_ship_date:String;
    FOldRelack:String;
    FOldReluser_date_2:String;
    FOldReluser_date_3:String;
    FOldRelinternal_update_type:String;
    FOldRellock_must_ship_date:String;
    FOldRelcuser3:String;
    FOldRelfreight_id:String;
    FOldRelwo_note:String;
    FOldRelphantom_releases_id:String;
    FOldRelpending_verification:String;
    FOldRelinventory_verified_date:String;
    FOldRelexclude_sched:String;
    FOldRelexpedite:String;
    FIsRebuildCommissionRequired: Boolean;

    FUpdatingPhantomDetail: Boolean;
    FOnSalesOrderChange: TNotifyEvent;
    FOnRebuildRelesesList: TNotifyEvent;

    procedure CheckAndAssignReleases;
    procedure CheckFreeFormCheckBox;
    // procedure RebuildSeq(DataSet: TDataSet; const SeqFieldName:string );
    function GetCommissionPercent( AArinvt_ID, AArcusto_ID: Real ): Real;
    procedure CheckMinOrderQty( Qty_Ord: Real; const cTable, cIdField: string; nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real );
    procedure CheckMinOrderQtyAggr( Qty_Ord: Real; const cTable, cIdField: string; nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real );
    procedure AssignMirrorValueTo( AField:TField; AValue:Real; ADataSource: TDataSource = nil );
    procedure AssignContainers( AField:TField; AValue:Real );
    function  CheckRequestDate:TDateTime;
    //function GetTierDiscount( AArcustoID, AArinvtID: Real ): Real;
//    function GetTierDiscount2( ADISCOUNT, AArcustoID, AArinvtID, AQty: Real ):Real;
//    function Check_AR_DISCOUNT_TIERS_PriceBreaks(APriceBreak, ADtlDiscount, AQty:Real):Real;


    procedure AssignDiscountToUnitPrice( ADiscount: Real; ADataSource: TDataSource = nil );
    procedure PostMCMessage;
    procedure WriteToEventLog( AOrderNo, AAction: string );
    procedure CheckCommissions;
    procedure CheckCommissionsQuick;
    // procedure UpdateOE_Control( AOrders_ID: Real ); see CheckIncrement
    procedure RebuildReleasesSeq( AOrd_Detail_ID: Real; AIsPhantom: string );

    function GetReleasesCumQuan( AReleases_ID, AOrd_Detail_ID: Real): Real;
    function GetReleasesQuanSum( AOrd_Detail_ID, ASeq: Real; APromise_Date: TDateTime; AShipDateContent: TShipDateContent ): Real;
//    procedure AssignDefaultCommiss;

    procedure CheckOrdDetailChanged( AOrd_Detail_ID: Real );
//    procedure CheckMultipleOf;
    procedure ShowItemInfo( ANew_Arinvt_ID, AArcusto_ID: Real );
    procedure CheckPropagateEPlantFromShipTo;
    procedure RecalcOrderReleasesMustShipDate;
    procedure CheckCRMActivityLinkedToOrderDetail;
    procedure CheckDropShipChanged( ADataSet: TDataSet );
    procedure AssignCalculatedFieldsArinvt(AArinvt_ID: Real);
    function CanEditMustStart: Boolean;
    procedure CheckAssignHardAllocatedViaPkTicket;
    // procedure CheckPickTicketAssignedInventory;
    procedure CheckPickTicketAssigned;
    procedure CheckAssignMirrorValue(ADataSource: TDataSource;
      AField: TField);
    //function IsLotCharge(ArinvtId, ArcustoId:real; var ALotCharge:Real; AShip_To_ID: Real ):boolean;
    procedure CheckLotCharge(ADataset:TDataSet);
    procedure CheckManuallyGeneratedWorkOrders(AOrd_Detail_ID: Real);
    procedure CheckPhantomReleaseChild(DataSet: TDataSet);

    function GetIncludePhantomComponents(AOrd_Detail_ID: Int64): Boolean;  overload;
    function GetPhantomKitPriceBasedOnComponents( AOrd_Detail_ID: Real ): Boolean;
    function GetPhantomKitPriceBasedOnComponentsArinvt( AArinvtID: Real ): Boolean;

    procedure CheckAssignMTO( AArinvt_ID: Real );
    procedure CheckAssignMTO2( AArinvt_ID: Real );
    procedure AssignDefaultDropShip(AArinvt_ID, AArcusto_ID: Real);
    procedure CheckIfMTOAllowed(ADataSet:TDataSet);
    function GetLeadDays( AArinvt_ID, AArcusto_ID, AShip_To_ID: Real; AKind: string; ADivision_ID: Real ): Real;
    procedure CheckLeadDays( AReleases_ID: Real );
    procedure CheckAssignSalesOrderHeaderDropShipPO;
    function IsWorkflowMandatory: Boolean;
    procedure RecalculateComissionsAndAmount;
    procedure GetCreditLimitValues(var ACreditHoldStatusID: string; var ATotal,
      ACreditLimit, AOpenToBuy, ACurrent2: Real; var AYNCustOverCreditLimit,
      ACurrentStatusID: string);
    procedure GetCreditLimitValuesFor(const AArcustoID, AOrdersID,
      AOrdDetailID: Int64; const AOrdDetailQty, AOrdDetailUnitPrice: Real;
      var ACreditHoldStatusID: string; var ATotal, ACreditLimit, AOpenToBuy,
      ACurrent2: Real; var AYNCustOverCreditLimit, ACurrentStatusID: string);
    procedure CheckOrdDetailShipped;
    function IsOrdDetailShipped(const AOrdDetailID: Int64): Boolean;
    function IsOrderShipped: Boolean;
    procedure CheckOrderShipped;
    function IsOrderPaymentReceived: Boolean;
    procedure CheckPaymentReceived;
    function CanPromptDeliveryDateChanged: Boolean;
    procedure CheckDeliveryDateChanged;
    procedure ResetDeliveryDateChanged;

    /// <summary> Get the ORD_DETAIL.ID currently selected by the user.
    // Returns an ID based on whether or not Quick Order entry is selected.
    /// </summary>
    function GetSelectedOrdDetailID: Int64;

    /// <summary> Determine whether the total quantity of the releases is
    /// less than the quantity of the parent Order Detail line item.
    /// </summary>
    function IsReleaseQuantitySumLessThanDetail(
      const AOrdDetailID: Int64): Boolean;

    /// <summary> Determine whether the total quantity of the releases is
    /// less than or equal to the quantity of the parent Order Detail line
    /// item. Provide a RELEASES.ID to exclude a release from the check.
    /// </summary>
    function IsReleaseQuantityLessThanDetail(
      const AOrdDetailID, AReleasesID: Int64;
      const AReleaseQtyFieldValue: Real): Boolean;

    /// <summary> Determine whether the total quantity of the releases is
    /// greater than or equal to the quantity of the parent Order Detail line
    /// item. Provide a RELEASES.ID to exclude a release from the check.
    /// </summary>
    function IsReleaseQuantityGreaterThanDetail(
      const AOrdDetailID, AReleasesID: Int64;
      const AReleaseQtyFieldValue: Real): Boolean;
    procedure CheckAssignTaxCodeID(ADataSet: TDataSet);
    procedure CheckOrdersBOGO;
    procedure DeleteBOGOChildren(aOrd_Detail_id:Real);
  public
    { Public declarations }
    FQuanOldValue: Real;
    FCumQuanOldValue: Real;
    FShow_All_Lookup_Items:Integer;
    FPreassignedOrders_ID: Real;
    FExpedited:String;
    OEDataCoordinator: TIQWebDataCoordinator;
    FAmountChanged, FPercentChanged:boolean;
    FAmountChangedId, FPercentChangedId:Real;
    FVinGen_Licensed: Boolean;

    procedure ForceValue( AField: TField; AValue: Real ); overload;
    procedure ForceValue( AField: TField; AValue: string ); overload;
    procedure ForceClear( AField: TField );

    procedure SyncPhantomOrderDetailComponents( DataSet: TDataSet );  overload;
    procedure SyncPhantomOrderDetailComponents(AOrd_Detail_ID: Int64); overload;
    procedure SyncPhantomReleaseComnponents(DataSet: TDataSet);
    procedure DeletePhantomReleaseComponents( AReleases_ID: Real );
    procedure DeletePhantomOrderDetailComponents( AOrd_Detail_ID: Real; DataSet: TDataSet );
    procedure CheckCanModifyPhantomOrderDetailChild(DataSet: TDataSet);
    procedure CheckSetPhantomOrderDetailModified(DataSet: TDataSet);
    /// <summary> Get Inventory item default pricing.  No prompts will be
    /// displayed.  Use this method when first adding a line item.
    /// </summary>
    procedure GetDefaultItemPricing(const AArinvtID, AAkaID: Int64; const AQuantity: Real;
      var ADiscount, AUnitPrice, APricePer1000, AListPrice: Real);

    procedure AssignDefaultCommiss;
    procedure AssignDefaultCommissQuick;

    procedure AssignFieldValue( AField: TField; AValue: Real );
    procedure CheckIncrementVer( AOrders_ID: Real );
    function CheckTaxCalculated(AEplant_ID, AOrders_ID: Real): Boolean;
    procedure UpdateQuieries(Query:TFDQuery);
    procedure ReopenQuery( AQuery:TFDQuery );
    procedure AssignUnitPrice(AQtyOrd: Real = -1; ADoPriceCheck: Boolean = True);
    procedure AssignUnitPriceEx( ADataSet: TDataSet; AQtyOrd: Real = -1; ADoPriceCheck: Boolean = True );
    procedure AssignOrderNo;
    function IsPMEqmtOutOfService(const AArinvtID: Real): Boolean;
    function IsPhantomChild(DataSet: TDataSet): Boolean;
    function IsPendingWorkflowApprovalGoOnHold: Boolean;
    procedure GetTaxes;
    function GetRebateParamsID(const AAKA_ID, AArinvtID: Int64;
      var ARebateParamsID: Int64): Boolean;

    // Pick list methods
    function SelectInventoryItem(const AFilterByCustomer: Boolean;
     var AArinvtID: LargeInt): Boolean;

    /// <summary> Determine if the Terms assigned to the Order are flagged CIA. </summary>
    function IsTermsCashInAdvance: Boolean;

    /// <summary> Determine if the Terms assigned to the Order are flagged CIA,
    /// and the Order has been Invoiced. </summary>
    function  IsInvoicedCashInAdvance: Boolean;

    /// <summary> Determine whether changes to the current Sales Order
    /// are permitted, and raise exception if changes are not allowed.
    /// </summary>
    procedure CheckCashInAdvance;

    /// <summary> Determine whether releases for the currently selected
    /// Order Detail item may be modified, and raise an exception if
    /// changes are not allowed.
    /// </summary>
    procedure CheckCashInAdvanceReleases;
    procedure CheckCashInAdvanceReleasesQuickEntry;

    /// <summary> Determine whether releases for a given Order Detail item
    /// may be modified, based on changes already commited to the database,
    /// and raise an exception if changes are not allowed.
    /// </summary>
    procedure CheckCashInAdvanceDetailReleases(AOrdDetailID: Int64);

    /// <summary> Determine whether or not a release may be deleted for
    /// the currently selected Order Detail item, and and raise an exception
    /// if changes are not allowed.
    /// </summary>
    procedure CheckCashInAdvanceDeleteRelease;

    /// <summary> Determine whether a Cash Receipt has been posted for an
    /// Order Detail line item.
    /// </summary>
    function IsOrderDetailPaymentReceived(const AOrdDetailID: Int64): Boolean;

    /// <summary> Prompt user for tax code, and then update the order detail.
    /// <summary>
    /// <param> ADataSet: the Order Detail dataset to effect.
    /// </param>
    /// <returns>
    /// Returns true if a tax code was selected.  Returns false if the user cancelled
    /// the pick list.
    /// </returns>
    function ChangeTaxCode(ADataSet: TDataSet): Boolean;
    procedure ClearTaxCode(ADataSet: TDataSet);
    function IsNonTaxable(const AArinvtID: Int64): Boolean;

    /// <summary> Refresh the totals for the current order. </summary>
    procedure RefreshTotals;

    procedure RebuildReleasesList( AOrd_Detail_ID: Real );
    class procedure CheckOrderForPickTicket(AOrders_ID: Real);
    class procedure CheckMTOOnWorkorder(AOrders_ID: Real);
    class procedure CheckLinkedCRMActivityBeforeDelete( AOrders_ID: Real );
    class procedure CheckInternalStock( AOrders_ID: Real );
    class procedure CheckBeforeDeleteSalesOrder( AOrders_ID: Real );
    class procedure CheckDropShipChangedApplyToPO( ACargo: TChangingDropShipCargo);
    class function FindOrdDetailAKA_ID(AArinvt_ID, AArcusto_ID, AShip_To_ID: Real; AKind: string): Real; static;
    class procedure GetSetCustomerStatusID( AArcustoID : Real; var AStatus_ID : string );

    procedure CheckCreditLimit;
    procedure CheckCreditLimitQ;
    procedure CheckCreditLimitBeforeClone;

    property NewOrder: Boolean read FNewOrder write FNewOrder;
    property FilterCustomerItems: Boolean read FPkFilter_FilterInventoryByCustomer write FPkFilter_FilterInventoryByCustomer;
    property IsRebuildCommissionRequired: Boolean
      read FIsRebuildCommissionRequired
      write FIsRebuildCommissionRequired;

    procedure AssignPriceBreak( var APriceBreak    : Real;
                                var AListPriceBreak: Real;
                                var APricePer1000  : Real;
                                ADataSet           : TDataSet;
                                ADataSource        : TDataSource;
                                AQtyOrd            : Real;
                                AArcusto_ID        : Real;
                                ACurrency_ID       : Real;
                                AShip_To_ID        : Real;
                                ADiscount          : Real );
    class procedure CheckReleaseDates( DataSet: TDataSet; APrevPromiseDate, APrevRequestDate: TDateTime );
    function AsYN(AValue: Boolean): string;

    property OnSalesOrderChange: TNotifyEvent read FOnSalesOrderChange write FOnSalesOrderChange;
    property OnRebuildRelesesList: TNotifyEvent read FOnRebuildRelesesList write FOnRebuildRelesesList;
    function GetReleasesQuanTotal( AOrd_Detail_ID: Real ): Real;
  end;

//var
//  OE_DM: TOE_DM;

implementation

{$R *.DFM}

uses
//  Avalara,
//  Car_Eco_Chk,
//  CAR_ECO_Exist,
//  CheckShiptoTaxCode,
//  ChkOeBlanketQty,
//  Conf_Del,
//  ConfPoChange,
//  cust,
//  Cust_Shr,
//  DateDlg,
//    DB_DM
    IQMS.Common.DataLib
  , IQMS.Common.StringUtils
  , demo_packingslips
  , System.Math
  , oe_rscstr
  , IQMS.Common.Numbers
  ;
//  Freeform,
//  IQBool,
//  Inv_Misc,
//  IqInQry,
//  IqMesg,
//  IQMisc,
//  IQNLS,
//  IQSecMan,
//  IQSeq,
//  IQUOM,
//  IqUsrMsg,
//  McShare,
//  MTOWorkOrderChk,
//  oe_cancel_drop_ship_dlg,
//  oe_conf_lead_days,
//  oe_confirm_rel_dates_past,
//  oe_confirm_same_po,
//  oe_generated_manual_wo,
//  oe_new_pick_wave,
//  oe_on_pktkt_chk,
//  oe_pick_drop_ship_po,
//  oe_rel_on_pktkt_chk,
//  oe_rel_on_wave_chk,
//  oe_share,
//  OECheckCrLimit,
//  OeCheckDelete,
//  OeCheckReleases,
//  OEQuickUpdateDate,
//  PanelMsg,
//  PkTktChk,
//  pomain,
//  Qk_Base,
//  RevControl,
//  SchdChk,
//  ShipExistsChk,
//  w_oe;

{ TReleaseCargo }

constructor TReleaseCargo.Create( AID, AQuan, ACum_Quan, ASeq: Real; APromise_Date, AShip_Date: TDateTime );
begin
  inherited Create;
  ID          := AID;
  Quan        := AQuan;
  Cum_Quan    := ACum_Quan;
  Seq         := ASeq;
  Promise_Date:= APromise_Date;
  Ship_Date   := AShip_Date;
end;

procedure ClearList( AList: TList );
var
  I: Integer;
begin
  if Assigned(AList) then
  begin
    for I:= AList.Count - 1 downto 0 do
      if Assigned( AList.Items[ I ]) then
         TObject(AList.Items[ I ]).Free;
    AList.Clear;
  end;
end;

procedure TOE_DM.OE_DMCreate(Sender: TObject);
var
  i:integer;
begin
  FBill_To_ID  := -1;
  FShip_To_ID  := -1;
  FCurrentOrdDetailID:= -1;
  FReleasesList:= TList.Create;
  // 02/01/2016 (EIQ-10573, Byron) Initialize flag.
  FOrderIsPosting := False;
  OEDataCoordinator:= TIQWebDataCoordinator.CreateAndRegister( self,
                                                             [ TblBill_To,
                                                               TblShip_To,
                                                               TblFreight,
                                                               // QryOrdTotal,
                                                               tblCurrency,
                                                               QryOrdTotalQuick,
                                                               QryBreakDownTaxes,
                                                               QryBillTo,
                                                               QryShipTo,
                                                               QryInvoiced,
                                                               QryContact,
                                                               QryFob,
                                                               TblSales,
                                                               QryCampaign,
                                                               TblAKA,
                                                               QryTerms,
                                                               // wwQryTaxCodeLookup,
                                                               TblComm,
                                                               TblCommQuick,
                                                               QrySOContact ]);
end;

procedure TOE_DM.OE_DMDestroy(Sender: TObject);
begin
  ClearList( FReleasesList );
  FReleasesList.Free;
end;

procedure TOE_DM.SrcOrdersDataChange(Sender: TObject; Field: TField);
var
   ACont1, ACont2, ASource:String;
   ABillToStatus:String;
begin
  if Assigned(OnSalesOrderChange) then
     OnSalesOrderChange( self );

  UpdateQuieries(QryBillTo);
  UpdateQuieries(QryShipTo);
  UpdateQuieries(QryContact);
end;

procedure TOE_DM.CheckFreeFormCheckBox;
begin
end;


procedure TOE_DM.TblOrdersAfterInsert(DataSet: TDataSet);
begin
  with TblOrders do
  begin
    if FPreassignedOrders_ID > 0 then
       begin
         FieldByName('ID').AsFloat:= FPreassignedOrders_ID;
         FPreassignedOrders_ID:= 0;
       end
    else
       IQAssignIDBeforePost( TblOrders ); {in IQlib}

    FieldByName('DATE_TAKEN').AsDateTime  := Date;
    FieldByName('TIMESTAMP').AsDateTime   := Now;
//    FieldByName('USERID').AsString        := SecurityManager.UserName;
//    FieldByName('ORD_BY').AsString        := SecurityManager.UserName;
//    FieldByName('CHANGEUSER_ID').AsString := SecurityManager.UserName;
    FieldByName('FREE_FORM').AsString     := 'N';
//    FieldByName('APPROVAL_REQUIRED').asString:= TIQBoolean.AsYN(IsWorkflowMandatory);
    AssignOrderNo;
  end;
//  CheckOrdersBOGO;
//  if (Owner is TFrmMainOrder) then
//    PostMessage(TFrmMainOrder(Owner).Handle, iq_Notify, 3, 0);
end;

procedure TOE_DM.AssignOrderNo;
var
  S: string;
  AEPlant_ID: string;
begin
//  AEPlant_ID:= SecurityManager.EPlant_ID;
//  if AEPlant_ID <> 'NULL' then
//     S:= GetEPlantNextSequenceNumber( AEPlant_ID, 'SO', 'S_ORDERS' )
//  else
  begin
    S:= TblOrdersID.asString;
  //  IQAppend_EPlant_Suffix( AEPlant_ID, S );
  end;

//  if AEPlant_ID <> 'NULL' then
//     TblOrdersEPLANT_ID.asFloat:= StrToFloat( AEPlant_ID );
  TblOrdersORDERNO.asString := S;
end;

procedure TOE_DM.TblOrdersBeforePost(DataSet: TDataSet);
var
  S: string;
  AOld_Ship_To_ID: Real;
  AConfirm:Integer;
begin
  // 02/01/2016 (EIQ-10573, Byron) Set the flag to defer calculated fields.
  // This corrects a speed issue.
  FOrderIsPosting := True;

  CheckCashInAdvance;
  if (TblOrdersAPPROVAL_REQUIRED.asString <> 'Y') and IsWorkflowMandatory() then
     TblOrdersAPPROVAL_REQUIRED.asString:= 'Y';

//  CheckFOB_THIRD_PARTY_ID(TblOrdersFOB.asString, TblOrders); {Cust_Shr.pas}

  if (TblOrdersPONO.asString <> '') and (
     (SelectValueFmtAsInteger('select 1 from orders where id <> %d and arcusto_id = %d and pono = ''%s'' and rownum < 2',
     [TblOrdersID.AsLargeInt,
      TblOrdersARCUSTO_ID.AsLargeInt,
      StrTran(Trim(TblOrdersPONO.asString), '''', '''''')]) > 0) or
     (SelectValueFmtAsInteger('select 1 from hist_orders where arcusto_id = %d and pono = ''%s'' and rownum < 2',
     [TblOrdersARCUSTO_ID.AsLargeInt,
      StrTran(Trim(TblOrdersPONO.asString), '''', '''''')]) > 0) ) then

//     case IQDialogChkEx( TFrmOEConfirmSameP0,    {IQDialogChkEx is defined in IQMesg, TFrmOEConfirmSameP0 is in oe_confirm_same_po.pas}
//                         Format(oe_rscstr.cTXT0000085,  [TblOrdersPONO.asString]),
//                         'FrmOEConfirmSameP0' ) of
//       0: raise Exception.Create(Format(oe_rscstr.cTXT0000086,  [TblOrdersPONO.asString]));  // PO # %s is already assigned to the selected customer - operation aborted.
//       1: ; {do nothing}
//     end;
//
//  {Sep-13-2005}
//  AOld_Ship_To_ID:= SelectValueByID('ship_to_id', 'orders', TblOrdersID.asFloat);
//  if (TblOrdersSHIP_TO_ID.asFloat > 0) and (AOld_Ship_To_ID > 0) and (AOld_Ship_To_ID <> TblOrdersSHIP_TO_ID.asFloat) then
//  begin
//     CheckShipmentsExists( TblOrdersID.asFloat );    {ShipExistsChk.pas}
//     TFrmOrderOnPkTicketException.DoShowModal( self, TblOrdersID.asFloat );  // oe_on_pktkt_chk.pas
//  end;


//  TblOrders.FieldByName('CHANGEUSER_ID').AsString := SecurityManager.UserName; // FDManager.FindConnection('IQFD').Params.Values[szUSERNAME];

  {check ship_to_id assigned}
//  if TblOrders.FieldByName('ship_to_id').asFloat = 0 then
//     // 'A Shipping address has not been assigned to the Sales Order.'
//     IQWarning(oe_rscstr.cTXT0000087);

  {Jul-31-2003 propagate ship_to.eplant_id to orders.eplant_id}
  CheckPropagateEPlantFromShipTo;

  FOrderChanged:= (DataSet.State = dsEdit);
  FNewOrder    := FNewOrder or (DataSet.State = dsInsert);
  if FNewOrder and (TblOrdersORD_DATE.asDateTime = 0) then
    TblOrdersORD_DATE.asDateTime := TblOrdersDATE_TAKEN.asDateTime;

  if (DataSet.State = dsInsert) or (TblOrdersARCUSTO_ID.asFloat <> SelectValueByID('arcusto_id', 'orders', TblOrdersID.asFloat )) then
     CheckAssignSalesOrderHeaderDropShipPO;

  if (SelectValueFmtAsFloat('select id from orders where id = %f', [TblOrdersID.asFloat]) <> 0)
    and (TblOrdersPONO.asString <> SelectValueFmtAsString('select pono from orders where id = %f', [TblOrdersID.asFloat])) then
  begin
    // oe_rscstr.cTXT0000163 =
    // 'Sales Order PO number has changed. Update Order Detail PO Info?';
//    if IQDialogChkEx( TFrmConfPOChange, oe_rscstr.cTXT0000163,
//      'OE_ConfirmPONO_Change' ) = 1 then
//      begin
//        if tblOrd_detail.Active and
//          (tblOrd_detail.State in [dsEdit, dsInsert]) then
//          tblOrd_detail.Post;
//        ExecuteCommandParam(
//        'BEGIN iqms.oe_misc.update_ord_detail_po_info(:P_ORDERS_ID, :P_PONO); END;',
//        ['P_ORDERS_ID;INT64','P_PONO;STRING'],
//        [TblOrdersID.AsLargeInt, TblOrdersPONO.AsString]);
//        if tblOrd_detail.Active then
//          tblOrd_detail.Refresh;
//      end;
  end;

//   if SelectValueFmtAsFloat('select id from bill_to where id = %f', [TblOrdersBILL_TO_ID.asFloat]) <> 0 then
//      TFrmMainOrder(Owner).CheckCustomerBillToStatus( TblOrdersBILL_TO_ID.asFloat );
end;

procedure TOE_DM.CheckPropagateEPlantFromShipTo;
begin
end;

class procedure TOE_DM.CheckLinkedCRMActivityBeforeDelete( AOrders_ID: Real );
var
   ACRMActivityID: Real;
begin
  // 09/08/2006 Warn user that there are linked Service Labor Meetings linked to the Order
  if SelectValueFmtAsInteger(
    'select 1 from crm_activity a, ord_detail b '#13 +
    'where a.order_dtl_id = b.id and b.orders_id = %.0f',
    [ AOrders_ID ]) = 1 then
    //oe_rscstr.cTXT0000057 =
    //'CRM Service Labor Meetings are linked to this Sales Order.  Cannot delete.'
    raise Exception.Create(oe_rscstr.cTXT0000057);
end;

class procedure TOE_DM.CheckInternalStock(AOrders_ID: Real);
begin
end;

procedure TOE_DM.WriteToEventLog( AOrderNo, AAction: string );
begin
end;

procedure TOE_DM.TblOrd_DetailBeforePost(DataSet: TDataSet);
var
  ASetupCharge: Real;
  AStandard_ID: Real;
begin
//  if (tblOrd_detail.State in [dsEdit]) and (TFrmMainOrder(Owner).IsChildBOGOItem(tblOrd_detailID.asFloat)) then
//    raise exception.Create(oe_rscstr.cTXT0000184);
  
  if tblOrd_detailARINVT_ID.asFloat <> 0 then
    tblOrd_detailAUTO_INVOICE.asString := '';

  if not (TblOrd_Detail.eof and TblOrd_Detail.bof) then
     if (TblOrd_DetailMISC_ITEM.asString = '') and (TblOrd_DetailARINVT_ID.asFloat = 0) then
      // 'Please enter an item description.'
        raise Exception.Create(oe_rscstr.cTXT0000091);

  if SelectValueFmtAsString('select NVL(cash_in_advance, ''N'') from terms where id = %f', [TblOrdersTerms_id.asFloat]) = 'Y' then
  begin
    if (tblOrd_detailSHIPHOLD.asString <> 'Y') and (tblOrd_detailSHIPHOLD.asString <> '') then
      raise Exception.Create(oe_rscstr.cTXT0000158);
  end;


  CheckIfMTOAllowed(TblOrd_Detail);


//  if not TFrmMainOrder(Owner).FAssigningCostSource then
//  try
//    if tblOrd_detailGLACCT_ID.AsFloat <> 0 then
//      if (SelectValueFmtAsString('select NVL(COST_SOURCE_RQD, ''N'') from glacct where id = %f', [tblOrd_detailGLACCT_ID.AsFloat]) = 'Y') and (tblOrd_detailCOST_OBJECT_SOURCE.asString  = '') then
//         raise exception.create(oe_rscstr.cTXT0000108);
//  finally
//    TFrmMainOrder(Owner).FAssigningCostSource := false;
//  end;
//  TFrmMainOrder(Owner).FAssigningCostSource := false;

  CheckCreditLimit;
  IQAssignIDBeforePost(DataSet);

  if (TblOrd_DetailARINVT_ID.asFloat <> 0) then
  begin
    {Reset Misc}
    TblOrd_Detail.FieldByName('Misc_Item').asString := '';

    {Warn if Setup Charge > 0}
    ASetupCharge:= SelectValueFmtAsFloat('select setup_charge from arinvt where id = %f', [ TblOrd_DetailARINVT_ID.asFloat ]);

    {when adding or changing arinvt - check CAR & ECO}
    if SelectValueByID('arinvt_id', 'ord_detail', TblOrd_DetailID.asFloat ) <> TblOrd_DetailARINVT_ID.asFloat then
    begin
      CheckPickTicketAssigned;
      CheckAssignMTO( TblOrd_DetailARINVT_ID.asFloat );
    end;

    AStandard_ID:= SelectValueByID('standard_id', 'ord_detail', TblOrd_DetailID.asFloat );
    if (TblOrd_DetailPhantom.asString = 'Y') and (AStandard_ID <> TblOrd_DetailSTANDARD_ID.asFloat) then
       ExecuteCommandFmt('delete from ord_detail where phantom_ord_detail_id = %f', [ TblOrd_DetailID.asFloat ]);  // 01-08-2014 regenerate kit components during resync in afterpost
  end;

  case DataSet.State of
    dsInsert: FPostingState:= psInsert;
    dsEdit  : FPostingState:= psEdit;
  else
    FPostingState:= psNone;
  end;

  FIS_MAKE_TO_ORDER := tblOrd_detailIS_MAKE_TO_ORDER.asString;

  CheckDropShipChanged( TblOrd_Detail );

  FResetDrop_ship_po_id := ((tblOrd_detailIS_DROP_SHIP.asString = 'N') and (SelectValueByID('nvl(is_drop_ship, ''N'')', 'ord_detail', TblOrd_detailID.asFloat) = 'Y'));

//  if (TblOrd_detailHIDE.asString = 'Y') and not FDetailIsHidden and (TblOrd_detailBackLog.Value > 0.000001) then
//      if not IQConfirmYN( oe_rscstr.cTXT0000133 ) then  // Are you sure you want to hide this line item with existing backlog?';
//         TblOrd_detailHIDE.asString:= 'N';

  FOrdDetilAmountChanged := false;
  FOrdDetilPriceChanged  := false;


  if DataSet.State in [dsEdit] then
  begin
    FOrdDetilAmountChanged := tblOrd_detailTOTAL_QTY_ORD.asFloat <> SelectValueFmtAsFloat('select TOTAL_QTY_ORD from ord_detail where id = %f', [tblOrd_detailID.asFloat]);
    FOrdDetilPriceChanged := tblOrd_detailUNIT_PRICE.asFloat <> SelectValueFmtAsFloat('select UNIT_PRICE from ord_detail where id = %f', [tblOrd_detailID.asFloat]);
  end;
end;


procedure TOE_DM.CheckAssignMTO( AArinvt_ID: Real );
begin
  if (TblOrd_detailIS_MAKE_TO_ORDER.asString = '') and (SelectValueByID('mark_ord_detail_mto', 'arinvt', AArinvt_ID) = 'Y') then
     TblOrd_detailIS_MAKE_TO_ORDER.asString:= 'Y';
end;

procedure TOE_DM.GetCreditLimitValuesFor(
  const AArcustoID, AOrdersID, AOrdDetailID: Int64;
  const AOrdDetailQty, AOrdDetailUnitPrice: Real;
  var ACreditHoldStatusID: string;
  var ATotal, ACreditLimit, AOpenToBuy, ACurrent2: Real;
  var AYNCustOverCreditLimit, ACurrentStatusID: string);
begin
  // Initiallize
  ACreditHoldStatusID := 'Cr Hold';
  ATotal := 0;
  ACreditLimit := 0;
  AOpenToBuy := 0;
  ACurrent2 := 0;
  AYNCustOverCreditLimit := '';
  ACurrentStatusID:= '';

  //HTM-1007 CheckCreditLimit - create stored procedure HTML5 Refactor 04-09-15 AMB
  with TFDStoredProc.Create(nil) do
    try
//      Connection:= db_dm.FDConnection;
      StoredProcName := 'IQMS.OE_MISC.CHECK_CREDIT_LIMIT';
      Prepare;
      ParamByName('p_arcusto_id').Value := AArcustoID;
      ParamByName('p_orders_id').Value := AOrdersID;
      ParamByName('p_ord_detail_id').Value := AOrdDetailID;
      ParamByName('p_total_qty_ord').Value := AOrdDetailQty;
      ParamByName('p_unit_price').Value := AOrdDetailUnitPrice;
      Execute;

      //Assign values of OUT params to local variables
      (*Total:*)
      ATotal  := ParamByName('p_total').AsFloat;  (*ATotalToPay + APackSlips + ANotInvoiced + APackSlips3 + APackSlips2 + ANotInvoiced2 + ANotInvoiced3 *)
      (*Credit Limit*)
      ACreditLimit:= ParamByName('p_credit_limit').AsFloat;
      (*Open to buy*)
      AOpenToBuy  := ParamByName('p_open_to_buy').AsFloat;
      (*Amount on this sales order, not including current line*)
      ACurrent2   := ParamByName('p_current2').AsFloat;
      (*Quick Yes/No answer to if the system recommends they be placed on credit hold*)
      AYNCustOverCreditLimit
        := ParamByName('p_YN_cust_over_credit_limit').AsString;
    finally
      Free;
    end;

  GetSetCustomerStatusID(AArcustoID, ACurrentStatusID );
end;

procedure TOE_DM.GetCreditLimitValues(
  var ACreditHoldStatusID: string;
  var ATotal, ACreditLimit, AOpenToBuy, ACurrent2: Real;
  var AYNCustOverCreditLimit, ACurrentStatusID: string);
begin
  GetCreditLimitValuesFor(
    TblOrdersARCUSTO_ID.AsLargeInt, TblOrdersID.AsLargeInt, tblOrd_detailID.AsLargeInt,
    tblOrd_detailTOTAL_QTY_ORD.AsFloat, tblOrd_detailUNIT_PRICE.AsFloat,
    {var} ACreditHoldStatusID,
    {var} ATotal,
    {var} ACreditLimit,
    {var} AOpenToBuy,
    {var} ACurrent2,
    {var} AYNCustOverCreditLimit,
    {var} ACurrentStatusID);
end;

procedure TOE_DM.CheckCreditLimitBeforeClone;
begin
end;

procedure TOE_DM.CheckCreditLimit;
begin
end;

procedure TOE_DM.AssignUnitPrice(AQtyOrd: Real; ADoPriceCheck: Boolean);
begin
  AssignUnitPriceEx( TblOrd_Detail, AQtyOrd, ADoPriceCheck );
end;

procedure TOE_DM.GetDefaultItemPricing(const AArinvtID, AAkaID: Int64;
  const AQuantity: Real; var ADiscount, AUnitPrice, APricePer1000, AListPrice: Real);
begin
end;

procedure TOE_DM.AssignUnitPriceEx( ADataSet: TDataSet; AQtyOrd: Real; ADoPriceCheck: Boolean);
var
  aPriceDiscount, aListPriceBreak, aPriceBreak, aPriceBreakPer1000:Real;
begin
end;


procedure TOE_DM.AssignPriceBreak( var APriceBreak    : Real;
                                   var AListPriceBreak: Real;
                                   var APricePer1000  : Real;
                                   ADataSet           : TDataSet;
                                   ADataSource        : TDataSource;
                                   AQtyOrd            : Real;
                                   AArcusto_ID        : Real;
                                   ACurrency_ID       : Real;
                                   AShip_To_ID        : Real;
                                   ADiscount          : Real );
type
  TPriceKind = (pkAKA, pkArinvt, pkDefault);
var
  nAkaId         : Real;
  nId            : Real;
  cIdField       : String;
  cTable         : String;
  nMinQty        : Real;
  IsAKA          : Boolean;
  PriceKind      : TPriceKind;
  APer1000Table  : string;
  ATierDiscount  : Real;
  ARate          : Real;
  ACurrId        : Real;
  AStdPrice      : Real;
  AQty           : Real;
  AOrderCurrId   : Real;
  AkaPrice       : Real;

  AArcusTo_Qty_Price_Break: Real;
  ArcustQty      : Boolean;
  ALotCharge     : Real;

  ABased_on_std_price  : string;
  AAr_discount_tiers_ID: Real;
  ADiscount_price      : Real;

  ACalcDetailDiscount: Real;
  AArcustoDiscount:Real;
  AUsingCUST_DISC_PERC_COMP:boolean;
  ACUST_DISC_PERC_COMPPrice:Real;
  AkaKind:String;
begin
  APriceBreak  := 0;
  AkaPrice     := 0;
  APricePer1000:= 0;
  if AQtyOrd > 0 then
    AQty:= AQtyOrd
  else
    AQty:= ADataSet.FieldByName('Total_Qty_Ord').asFloat;

  if ADataSet.FieldByName('ArInvt_ID').asFloat = 0 then
     EXIT;

  {Checl override qty with arcusto.qty_price_break}
  AArcusto_Qty_Price_Break:= SelectValueByID('qty_price_break', 'arcusto', AArcusto_ID );
  ArcustQty := false;
  if AArcusto_Qty_Price_Break > 0 then
  begin
     AQty:= AArcusto_Qty_Price_Break;
     ArcustQty := true;
  end;

  ARate := 1;
  AOrderCurrId := 0;
  if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
     if ACurrency_ID <> 0 then
        ARate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [ ACurrency_ID ]);
  if ARate = 0 then
     ARate := 1;

  AkaKind := ADataSet.FieldByName('AKA_KIND').asString;

  if AkaKind = '' then AkaKind :=  '@!@$$^&&^$#**';

  {Determine Unit Price Source - Arinvt or AKA}
  nAkaId := SelectValueFmtAsFloat('select id from aka where arcusto_id = %f and arinvt_id = %f ' +
                      ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1 ' +
                      ' and NVL(kind, ''@!@$$^&&^$#**'') = ''%s''',
                      [ AArcusto_ID,
                        ADataSet.FieldByName('ArInvt_ID').asFloat,
                        AArcusto_ID,
                        AShip_To_ID,
                        StrTran(AkaKind, '''', '''''')  ]);

  if (nAkaId <> 0) and (SelectValueFmtAsFloat('select aka_id from aka_breaks where aka_id = %f', [nAkaId]) <> 0) then
    begin
       if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
       begin
         AcurrId:= SelectValueFmtAsFloat('select currency_id from aka where id = %f', [nAkaId]);
         if (AcurrId <> 0) and (AcurrId <> ACurrency_ID ) then
            ARate := ARate/SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [AcurrId]);

         if SelectValueFmtAsString('select curr_code from currency where id = %f', [AcurrId]) = SelectValueFmtAsString('select curr_code from currency where id = %f', [ ACurrency_ID ])  then
            ARate := 1;
       end;

       PriceKind    := pkAKA;
       nId          := nAkaID;
       cIdField     := 'AKA_ID';
       cTable       := 'AKA_BREAKS';
       APer1000Table:= 'AKA';
    end

  else if SelectValueFmtAsFloat('select arinvt_id from arinvt_breaks where arinvt_id = %f and NVL(buying, ''N'') = ''N''', [ADataSet.FieldByName('ArInvt_ID').asFloat]) > 0 then
    begin
       if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
       begin
         if SelectValueFmtAsFloat('select id from arinvt_breaks where arinvt_id = %f and currency_id = %f and NVL(buying, ''N'') = ''N'' ' +
                      '   and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
                      [ADataSet.FieldByName('Arinvt_ID').asFloat, ACurrency_ID ]) <> 0 then
            begin
              ARate := 1;
              AOrderCurrId := ACurrency_ID;
            end
         else
            AOrderCurrId := ACurrency_ID;
       end;

       PriceKind    := pkARINVT;
       nId          := ADataSet.FieldByName('Arinvt_ID').asFloat;
       cIdField     := 'ARINVT_ID';
       cTable       := 'ARINVT_BREAKS';
       APer1000Table:= 'ARINVT'
    end

  else
    begin
      PriceKind     := pkDefault;
      nID           := ADataSet.FieldByName('Arinvt_ID').asFloat;
      APer1000Table := 'ARINVT';
    end;

  AAr_discount_tiers_id := SelectValueFmtAsFloat('select id from ar_discount_tiers tiers where arinvt_id = %f and arcusto_id = %f',
                                     [ ADataSet.FieldByName('ARINVT_ID').asFloat, AArcusto_ID]);

  case PriceKind of

    pkAKA, pkArinvt:
       begin
         APriceBreak:= GetPriceBreakUOM( AQty,   // AQty
                                         nID,                                  // AFK_ID_Value
                                         cIDField,                             // AFK_ID_FieldName
                                         cTable,                               // ATableName
                                         ADataSet.FieldByName('UNIT').asString,           // Act_UOM
                                         ADataSet.FieldByName('Arinvt_Unit').asString,    // Std_UOM
                                         ADataSet.FieldByName('ARINVT_ID').asFloat, 'N', AOrderCurrId, ArcustQty);

         AkaPrice := APriceBreak;
         if (nAkaId = 0) or (SelectValueFmtAsFloat('select count(aka_id) from aka_breaks where aka_id = %f', [nAkaId]) = 0) then
            AkaPrice := 0
         else
         begin
           if APriceBreak = 0 then
           begin
             nId          := ADataSet.FieldByName('Arinvt_ID').asFloat;
             cIdField     := 'ARINVT_ID';
             cTable       := 'ARINVT_BREAKS';
             APer1000Table:= 'ARINVT';

             APriceBreak:= GetPriceBreakUOM( AQty,   // AQty
                                             nID,                                  // AFK_ID_Value
                                             cIDField,                             // AFK_ID_FieldName
                                             cTable,                               // ATableName
                                             ADataSet.FieldByName('UNIT').asString,           // Act_UOM
                                             ADataSet.FieldByName('Arinvt_Unit').asString,    // Std_UOM
                                             ADataSet.FieldByName('ARINVT_ID').asFloat, 'N', AOrderCurrId, ArcustQty);

             if APriceBreak = 0 then
             begin
               APriceBreak := SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [ADataSet.FieldByName('ARINVT_ID').asFloat]);
             end;
             AkaPrice := APriceBreak;
           end;
         end;


         if ADataSet = TblOrd_Detail then
            CheckMinOrderQty( AQty,   // Qty_Ord
                              cTable,                               // cTable
                              cIDField,                             // cIdField
                              nId,                                  // nId
                              ADataSet.FieldByName('UNIT').asString,           // Act_UOM
                              ADataSet.FieldByName('Arinvt_Unit').asString,    // Std_UOM
                              ADataSet.FieldByName('ARINVT_ID').asFloat );     // Arinvt_ID
       end;

    pkDefault:
      begin
        if ADataSet = TblOrd_Detail then
           CheckMinOrderQtyAggr( AQty,   // Qty_Ord
                                 cTable,                               // cTable
                                 cIDField,                             // cIdField
                                 nId,                                  // nId
                                 ADataSet.FieldByName('UNIT').asString,           // Act_UOM
                                 ADataSet.FieldByName('Arinvt_Unit').asString,    // Std_UOM
                                 ADataSet.FieldByName('ARINVT_ID').asFloat );     // Arinvt_ID

      end;
  end;

  AListPriceBreak:= APriceBreak;

  AUsingCUST_DISC_PERC_COMP := false;
  case PriceKind of pkDefault, pkArinvt:
    begin
      AArcustoDiscount := SelectValueFmtAsFloat('select discount from arcusto where id = %f', [AArcusto_ID]);
      if (SelectValueAsString('select NVL(CUST_DISC_PERC_COMP, ''N'') from iqsys2 where rownum < 2') = 'Y') and (AArcustoDiscount <> 0) then
      begin
        AUsingCUST_DISC_PERC_COMP := true;
        if ACUST_DISC_PERC_COMPPrice < APriceBreak then
        begin
          APriceBreak := ACUST_DISC_PERC_COMPPrice;
          if AArcustoDiscount <> 0 then
          begin
            if (ADataSet is TFDQuery) and not TFDQuery(ADataSet).CachedUpdates then
               ExecuteCommandFmt('update ord_detail set discount = %.6f where id = %f', [ AArcustoDiscount, ADataSet.FieldByName('ID').asFloat ])
            else
               IQMS.Common.DataLib.ForceValue( ADataSource, ADataSet.FieldByName('DISCOUNT'), AArcustoDiscount );
          end;
        end;
      end;
    end
  end;


  {Discount}
  ABased_on_std_price:= 'X';
  AAr_discount_tiers_id:= 0;
  ADiscount_price := 0;
  ACalcDetailDiscount:= 0;

  if not AUsingCUST_DISC_PERC_COMP then
  begin
    if (SelectValueAsString('select NVL(CUST_DISC_PERC_COMP, ''N'') from iqsys2 where rownum < 2') = 'Y')  then
      ACalcDetailDiscount:= 0
  end;

  if ACalcDetailDiscount <> 0 then
  begin
    if (ADataSet is TFDQuery) and not TFDQuery(ADataSet).CachedUpdates then
       ExecuteCommandFmt('update ord_detail set discount = %.6f where id = %f', [ ACalcDetailDiscount, ADataSet.FieldByName('ID').asFloat ])
    else
       IQMS.Common.DataLib.ForceValue( ADataSource, ADataSet.FieldByName('DISCOUNT'), ACalcDetailDiscount );
  end;

  if ABased_on_std_price = 'X' then
     begin
        {keep the defaults}
        if ADataSet.FieldByName('List_Unit_Price').asFloat <> 0 then
        begin
          if APriceBreak = 0 then
             begin
              AListPriceBreak := ADataSet.FieldByName('List_Unit_Price').asFloat;
              APriceBreak     := ADataSet.FieldByName('Unit_Price').asFloat;
             end
          else
             begin
               if ACalcDetailDiscount <> 0 then
                 APriceBreak := APriceBreak * ( 1 - ACalcDetailDiscount/100);
             end;
        end
        else
        begin
          if (ADataSet is TFDQuery) and TFDQuery(ADataSet).CachedUpdates then
          begin
            if ACalcDetailDiscount <> 0 then
              APriceBreak := APriceBreak * ( 1 - ACalcDetailDiscount/100);
          end;
        end
     end

  else if ABased_on_std_price = 'Y' then
    begin
      //Feb 1 2007 Z Per Nancy, restored the selection of std_price from arinvt  AStdPrice := APriceBreak;
      AStdPrice := SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [ ADataSet.FieldByName('Arinvt_ID').asFloat ]);

      if ADiscount_price <> -10000000000 then
         begin
           AListPriceBreak:= ADiscount_price;
           APriceBreak := ADiscount_price;
         end
      else
         begin
           if AStdPrice <> 0 then
              AListPriceBreak:= AStdPrice
           else if AListPriceBreak <> 0 then
              AStdPrice:=  AListPriceBreak;
         end;
    end

  else
    begin
      if APriceBreak = -10000000000 then
         APriceBreak := AListPriceBreak
      else
         if (ACalcDetailDiscount <> 0) and (SelectValueFmtAsString('select NVL(USE_DISCOUNT_TIER, ''N'') from arcusto where id = %f', [ AArcusto_ID ]) = 'Y') then
             APriceBreak:= APriceBreak * ( 1 - ACalcDetailDiscount/100);
    end;

  {Per 1000 and List_Unit_Price }
  if SelectValueFmtAsString('select price_per_1000 from %s where id = %f', [ APer1000Table, nID ]) = 'Y' then
     begin
       AListPriceBreak:= AListPriceBreak / 1000;
       APricePer1000  := APriceBreak;
       APriceBreak    := APriceBreak / 1000;
     end
  else
     APricePer1000:= APriceBreak * 1000;

  AListPriceBreak:= AListPriceBreak / ARate;
  APriceBreak    := APriceBreak / ARate;
  APricePer1000  := APricePer1000 / ARate;
end;



procedure TOE_DM.ForceValue( AField: TField; AValue: Real );
var
  AReadOnly: Boolean;
begin
  AReadOnly:= AField.ReadOnly;
  AField.ReadOnly:= FALSE;
  try
    AField.asFloat:= AValue;
  finally
    AField.ReadOnly:= AReadOnly;
  end;
end;

procedure TOE_DM.ForceValue( AField: TField; AValue: string );
var
  AReadOnly: Boolean;
begin
  AReadOnly:= AField.ReadOnly;
  AField.ReadOnly:= FALSE;
  try
    AField.asString:= AValue;
  finally
    AField.ReadOnly:= AReadOnly;
  end;
end;

procedure TOE_DM.ForceClear( AField: TField );
var
  AReadOnly: Boolean;
begin
  AReadOnly:= AField.ReadOnly;
  AField.ReadOnly:= FALSE;
  try
    AField.Clear;
  finally
    AField.ReadOnly:= AReadOnly;
  end;
end;

procedure TOE_DM.CheckMinOrderQty( Qty_Ord: Real; const cTable, cIdField: string; nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real );
var
  nMinQty, aMinQtyAggr, AWaterfallId: Real;
  AQty: Real;
  AItemInfo: string;
begin
  if Qty_Ord = 0 then EXIT;

  AQty:= Qty_Ord;  {IQProc}

  AItemInfo:= Format(oe_rscstr.cTXT0000147, [SelectValueByID('rtrim(itemno)', 'arinvt', AArinvt_ID)]);  // 'Item #: %s'#13#13;

  if cTable = 'ARINVT_BREAKS' then
  begin
    if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
    begin
      if SelectValueFmtAsFloat('select id from arinvt_breaks where arinvt_id = %f and currency_id = %f and NVL(buying, ''N'') = ''N'' ' +
                   'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
                      [TblOrd_DetailArinvt_ID.asFloat, TblOrders.FieldByName('Currency_id').asFloat]) <> 0 then
        nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
                             'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500) ' +
                             'and NVL(buying, ''N'') = ''N'' and currency_id = %f',
                             [cTable, cIdField, nId, TblOrders.FieldByName('Currency_id').asFloat])
      else
        nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
                             'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500) ' +
                             'and NVL(buying, ''N'') = ''N''',
                             [cTable, cIdField, nId]);
    end
    else
      nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
                           'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500) ' +
                           'and NVL(buying, ''N'') = ''N''',
                           [cTable, cIdField, nId]);
  end
  else
  begin
    nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
                         'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
                         [cTable, cIdField, nId]);
  end;


  // Added by PC on 12-16-13 for waterfall pricing
  AWaterfallId := SelectValueFmtAsFloat ('select ar_discount_waterfall_id from arinvt where id = %.0f', [AArinvt_ID]);
  if (AWaterfallId > 0) then
    aMinQtyAggr := SelectValueFmtAsFloat
      ('select Min(QUAN) from AR_DISCOUNT_WATERFALL_LEVELS where AR_DISCOUNT_WATERFALL_ID = %f',
      [AWaterfallId])
  else
    aMinQtyAggr := SelectValueFmtAsFloat('select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f ' +
                           ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1',
                 [FAR_DISCOUNT_TIERS_ID,
                  TblOrdersARCUSTO_ID.asFloat]);
end;

procedure TOE_DM.CheckMinOrderQtyAggr( Qty_Ord: Real; const cTable, cIdField: string; nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real );
var
  aMinQtyAggr: Real;
  AQty: Real;
  AItemInfo: string;
begin
  if Qty_Ord = 0 then EXIT;

  AQty:= Qty_Ord;

  AItemInfo:= Format(oe_rscstr.cTXT0000147, [SelectValueByID('rtrim(itemno)', 'arinvt', AArinvt_ID)]);  // 'Item #: %s'#13#13;

  aMinQtyAggr := SelectValueFmtAsFloat('select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f ' +
                           ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1',
                 [FAR_DISCOUNT_TIERS_ID,
                  TblOrdersARCUSTO_ID.asFloat]);

end;



procedure TOE_DM.tblOrd_detailCalcFields(DataSet: TDataSet);
var
  Aka:Variant;
  i:Integer;
  A: Variant;
  ADivision_ID: Real;
  AId:Real;
  ACount:Real;
begin
//  if TFrmMainOrder(Owner).FCreating then
//     Exit;

    ACount := SelectValueFmtAsFloat('select count(id) from ORD_DETAIL_DISCOUNTS where ord_detail_id = %f', [tblOrd_detailID.AsFloat]);
    if aCount > 1 then
    begin
      tblOrd_detailDetailDiscount.asString := SelectValueFmtAsString('select min(code) from ORD_DETAIL_DISCOUNTS where ord_detail_id = %f', [tblOrd_detailID.AsFloat]);
      tblOrd_detailDetailDiscount.asString := tblOrd_detailDetailDiscount.asString + '...';
    end
    else if aCount = 1 then
    begin
      tblOrd_detailDetailDiscount.asString := SelectValueFmtAsString('select min(code) from ORD_DETAIL_DISCOUNTS where ord_detail_id = %f', [tblOrd_detailID.AsFloat]);
    end
    else
      tblOrd_detailDetailDiscount.asString := '';


  tblOrd_detailRebateParam.asString := SelectValueFmtAsString('select descrip from rebate_params where id = %f', [tblOrd_detailREBATE_PARAMS_ID.asfloat]);


  if tblOrd_detailID.AsFloat = 0 then
    tblOrd_detailTotal_invoiced.AsFloat := 0
  else
    tblOrd_detailTotal_invoiced.AsFloat := SelectValueFmtAsFloat('select invoiced_qty from c_arinvoice_ord_sum where ord_detail_id  = %f',
                                               [tblOrd_detailID.AsFloat]);

  tblOrd_detailTotalShipInv.asFloat := SelectValueFmtAsFloat('select sum(invoice_qty) from arinvoice_detail where ord_detail_id  = %f and shipment_dtl_id is not null and rma_detail_id is null', [tblOrd_detailID.AsFloat]);

  if TblOrd_detailGLACCT_ID.asFloat <> 0 then
    TblOrd_detailACCT.asString := SelectValueFmtAsString('select acct from glacct where id = %f', [TblOrd_detailGLACCT_ID.asFloat])
  else
  begin
    AId := SelectValueFmtAsFloat('select acct_id_sales from arinvt where id = %f', [tblOrd_detailARINVT_ID.asFloat]);
    if AId = 0 then
      AId := SelectValueFmtAsFloat('select p.acct_id_sales from arinvt a, arinvt_group p where a.id = %f and a.arinvt_group_id = p.id', [tblOrd_detailARINVT_ID.asFloat]);
    if AId = 0 then
      AId := SelectValueAsFloat('select acct_id_sales from iqsys where rownum < 2');
    TblOrd_detailACCT.Clear;
    if AId <> 0 then
    begin
      AId := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(%f, misc.geteplantid) from dual', [AId]);
      TblOrd_detailACCT.asString := SelectValueFmtAsString('select acct from glacct where id = %f', [AId]);
    end;
  end;

  AssignCalculatedFieldsArinvt( TblOrd_DetailARINVT_ID.asFloat );

  if TblOrd_Detail.State = dsInsert then
     TblOrd_detail.FieldByName('Tot_Releases').asFloat:= 0
  else
     TblOrd_detail.FieldByName('Tot_Releases').asFloat := GetReleasesQuanTotal( TblOrd_detailID.asFloat );
                                                          //GetValFmt('select sum(r.quan) from releases r ' +
                                                          //          'where r.ord_detail_id = %f',
                                                          //          [tblOrd_detail.FieldByName('ID').asFloat]);

  TblOrd_detailBackLog.Value := TblOrd_detailTot_Releases.Value - TblOrd_detailCumm_Shipped.Value;

  if Abs(TblOrd_detailBackLog.Value) < 0.000000001 then
    TblOrd_detailBackLog.Value:= 0;

  if TblOrd_detailTot_Releases.Value <= 0 then
     TblOrd_detailTot_Releases.Text := '';
  if TblOrd_detailBackLog.Value <= 0 then
     TblOrd_detailBackLog.Text := '';

  with TblOrd_detail do
  begin
     FieldByName('TotalPrice').asFloat :=  FieldByName('TOTAL_QTY_ORD').asFloat * FieldByName('UNIT_PRICE').asFloat;

     Aka:= SelectValueArrayFmt( 'select cust_itemno, cust_descrip, cust_rev, cust_descrip2 from aka '+
                           ' where arinvt_id = %f and arcusto_id = %f and nvl(kind, ''*'') = nvl(''%s'', ''*'') '+
                           '   and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
                          [ FieldByName('ARINVT_ID').asFloat,
                            TblOrders.FieldByName('ARCUSTO_ID').asFloat,
                            FieldByName('AKA_KIND').asString,
                            TblOrders.FieldByName('ARCUSTO_ID').asFloat,
                            TblOrders.FieldByName('SHIP_TO_ID').asFloat]);
     if VarArrayDimCount( Aka ) > 0 then
     begin
       FieldByName('AkaItemNo').asString := Aka[0];
       FieldByName('AkaDescrip').asString := Aka[1];
       FieldByName('AkaRev').asString := Aka[2];
       FieldByName('AkaDescrip2').asString := Aka[3];
     end;
  end;

  CheckCommissions;

  {Cost Source}
  TblOrd_detailCost_Source.AsString :=
    SelectValueFmtAsString(
    'SELECT iqms.cost_source.get_cost_object_display(cost_object_source,  '#13 +
    '                                                cost_object_id)      '#13 +
    '  FROM ord_detail                                                    '#13 +
    ' WHERE id = %d                                                       ',
    [TblOrd_detailID.AsLargeInt]);

  CheckAssignHardAllocatedViaPkTicket;

  if TblOrd_detailSHIP_TO_ID_FROM.asFloat > 0 then
     TblOrd_detailICT_Ship_To_From_Attn.asString:= SelectValueFmtAsString('select attn from ship_to where id = %f', [ TblOrd_detailSHIP_TO_ID_FROM.asFloat ]);

  if TblOrd_DetailSTANDARD_ID.asFloat > 0 then
     TblOrd_DetailMfgNo.asString:= SelectValueByID('mfgno', 'standard', TblOrd_DetailSTANDARD_ID.asFloat );

  if TblOrd_DetailDIVISION_ID.asFloat > 0 then
     TblOrd_DetailDivision.asString:= SelectValueByID('name', 'division', TblOrd_DetailDIVISION_ID.asFloat );

  if TblOrd_DetailSTANDARD_ID.asFloat > 0 then
     TblOrd_detailMfg_Division.asString:= SelectValueFmtAsString('select d.name from standard s, mfgcell m, division d where s.id = %f and s.mfgcell_id = m.id and m.division_id = d.id',
                                                       [ TblOrd_DetailSTANDARD_ID.asFloat ]);


  tblOrd_detailMfgnoDefault.asString := SelectValueFmtAsString('select s.mfgno from standard s, arinvt a where a.standard_id = s.id and a.id =%f',
                                       [tblOrd_detailARINVT_ID.asFloat]);

  if TblOrd_detailEPLANT_ID.asFloat > 0 then
     tblOrd_detailEPlant_Name.asString:= SelectValueByID('name || '' ['' || ID || '']''', 'eplant', TblOrd_detailEPLANT_ID.asFloat );


  TblOrd_detailREF_CODE.Clear;
  TblOrd_detailREF_CODE_DESCRIP.Clear;
  if TblOrd_detailREF_CODE_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt('select ref_code, ref_code_descrip from v_ref_code where ref_code_id = %f', [ TblOrd_detailREF_CODE_ID.asFloat ]);
    if VarArrayDimCount(A) > 0 then
    begin
      TblOrd_detailREF_CODE.asString:= A[ 0 ];
      TblOrd_detailREF_CODE_DESCRIP.asString:= A[ 1 ];
    end;
  end;

  if TblOrd_detailCAMPAIGN_ID.asFloat > 0 then
     TblOrd_detailCampaignCode.asString:= SelectValueByID('code', 'campaign', TblOrd_detailCAMPAIGN_ID.asFloat);

//  if TblOrd_DetailARINVT_ID.asFloat > 0 then
//  begin
//    ADivision_ID:= nz(TblOrd_DetailDIVISION_ID.asFloat, TblOrdersDIVISION_ID.asFloat );
//    TblOrd_detailNonCommitted.Clear;
//  end;

  // 09/21/2015
  tblOrd_detailConfigCode.AsString := SelectValueFmtAsString(
  'SELECT config_code FROM arinvt WHERE id = %.0f',
  [TblOrd_DetailARINVT_ID.asFloat]);

 tblOrd_detailTax_Code.AsString := SelectValueFmtAsString(
   'select tax_code from tax_codes where id = %d',
   [tblOrd_detailTAX_CODE_ID.AsLargeInt]);
end;

procedure TOE_DM.CheckCommissions;
var
  ACount:Real;
  AComm:Real;
  Amount:Real;
begin
  with TblOrd_detail do
  begin
    ACount := SelectValueFmtAsFloat('select count(id) from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f',
                        [FieldByName('ID').asFloat]);
    AComm := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    FieldByName('CommPrcnt').asFloat := AComm;
//    FieldByName('TotalComm').asFloat := AComm * FieldByName('UNIT_PRICE').asFloat *
//                                                FieldByName('TOTAL_QTY_ORD').asFloat/100;
    Amount := SelectValueFmtAsFloat('select sum(amount) from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
//    if (FieldByName('UNIT_PRICE').asFloat * FieldByName('TOTAL_QTY_ORD').asFloat) <> 0 then
//       FieldByName('CommPrcnt').asFloat := 100 * Amount /( FieldByName('UNIT_PRICE').asFloat * FieldByName('TOTAL_QTY_ORD').asFloat )
//    else
//       FieldByName('CommPrcnt').asFloat := 0;

    FieldByName('CommPrcnt').asFloat := FieldByName('CommPrcnt').asFloat;
    FieldByName('TotalComm').asFloat := Amount;

    if ACount = 1 then
      FieldByName('SalesPerson').asString := SelectValueFmtAsString('select  substrB( iqstring.Concat3W( First_Name, Middle_Name, Last_Name), 1, 255) from salespeople where id = ' +
                        '(select salespeople_id from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f)',
                        [FieldByName('ID').asFloat])
   else if ACount > 1 then FieldByName('SalesPerson').asString := 'SPLIT'
   else FieldByName('SalesPerson').asString := '';
  end;
end;

procedure TOE_DM.CheckCommissionsQuick;
var
  ACount:Real;
  AComm:Real;
begin
  with QryQuickOE do
  begin
    ACount := SelectValueFmtAsFloat('select count(id) from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f',
                        [FieldByName('ID').asFloat]);
    AComm := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
//    FieldByName('CommPrcnt').asFloat := AComm;
//    FieldByName('TotalComm').asFloat := AComm * FieldByName('UNIT_PRICE').asFloat *
//                                               FieldByName('TOTAL_QTY_ORD').asFloat/100;


    if ACount = 1 then
      FieldByName('SalesPerson').asString := SelectValueFmtAsString('select  substrB( iqstring.Concat3W( First_Name, Middle_Name, Last_Name), 1, 255) from salespeople where id = ' +
                        '(select salespeople_id from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f)',
                        [FieldByName('ID').asFloat])
   else if ACount > 1 then FieldByName('SalesPerson').asString := 'SPLIT'
   else FieldByName('SalesPerson').asString := '';
  end;
end;


procedure TOE_DM.CheckAssignHardAllocatedViaPkTicket;
var
  AHardAllocatedToPkTicket_ID: Real;
begin
  if TblOrd_detailMAKE_TO_ORDER_PS_TICKET_DTL_ID.asFloat = 0 then
     EXIT;

  AHardAllocatedToPkTicket_ID:= SelectValueFmtAsFloat('select t.id from ps_ticket_dtl d, ps_ticket t where d.id = %f and d.ps_ticket_id = t.id', [ TblOrd_detailMAKE_TO_ORDER_PS_TICKET_DTL_ID.asFloat ]);
  if AHardAllocatedToPkTicket_ID = 0 then
     AHardAllocatedToPkTicket_ID:= SelectValueFmtAsFloat('select t.id from ps_ticket_dtl_hist d, ps_ticket_hist t where d.id = %f and d.ps_ticket_id = t.id', [ TblOrd_detailMAKE_TO_ORDER_PS_TICKET_DTL_ID.asFloat ]);

  TblOrd_detailHardAllocatedVia.AsString:= Format('PT# %.0f', [ AHardAllocatedToPkTicket_ID ]);
end;


procedure TOE_DM.tblOrd_detailTOTAL_QTY_ORDChange(Sender: TField);
begin
  // 11/04/2014 (Byron) Removed the prompt dialog box from this section.
  // The component used by AssignUnitPrice() will handle prompt.
  // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
  FUnitPriceChangeAccepted:= (     (tblOrd_detail.State = dsInsert )
                               and
                                   (FBlanketQty <> tblOrd_detailTOTAL_QTY_ORD.asFloat ))
                             or
                             (     (tblOrd_detailTOTAL_QTY_ORD.asFloat > 0)
                               and (FBlanketQty  = 0)
                               and (tblOrd_detailARINVT_ID.asFloat > 0 ))
                             or
                             (     (tblOrd_detailTOTAL_QTY_ORD.asFloat > 0)
                               and (FBlanketQty <> tblOrd_detailTOTAL_QTY_ORD.asFloat)
                               and (tblOrd_detailARINVT_ID.asFloat > 0));
//                               and (IQDialogChkEx( TFrmOEBlanketQty,
//                                 oe_rscstr.cTXT0000097, // 'The blanket quantity has changed. Update the unit price?'
//                                 'OE_Change_Unit_Price_On_Qty_Change' ) = 0));

   if FUnitPriceChangeAccepted then
     AssignUnitPrice;

   FBlanketQty:= tblOrd_detailTOTAL_QTY_ORD.asFloat;

   FTotalQtyChanged := true;
end;

function TOE_DM.IsNonTaxable(const AArinvtID: Int64): Boolean;
begin
  Result := SelectValueFmtAsString(
    'SELECT NVL(nontaxable, ''N'') FROM arinvt WHERE id = %d',
    [AArinvtID]) = 'Y';
end;

procedure TOE_DM.CheckAssignTaxCodeID(ADataSet: TDataSet);
var
  ATaxCodeID: Int64;
  ANonTaxable: Boolean;
begin
  // This method should only be called during insert (new records only)
  if (ADataSet.FindField('TAX_CODE_ID') = nil) or
    (ADataSet.FindField('ARINVT_ID') = nil) or
    not (ADataSet.State in [dsInsert]) then
    Exit;

  // For non-taxable Inventory items, clear the Tax code by default
  if IsNonTaxable(ADataSet.FieldByName('ARINVT_ID').AsLargeInt) then
    ADataSet.FindField('TAX_CODE_ID').Clear
  else
  begin
    // If a Tax Code is available, assign it as the initial default.
    ATaxCodeID:= SelectValueFmtAsInt64(
      'select tax_code_id from ship_to where id = %d',
      [TblOrdersSHIP_TO_ID.AsLargeInt]);

    if (ATaxCodeID > 0) then
      AssignFieldValue(ADataSet.FindField('TAX_CODE_ID'), ATaxCodeID);
  end;
end;

procedure TOE_DM.TblOrd_detailNewRecord(DataSet: TDataSet);
var
  // ATaxID       : Real;
  SalesPeopleId: Real;
  AOnHold      : Boolean;
  AValue: Real;

  procedure AssignFieldValue(AFieldName: string; AValue: Variant);
  var
     AField: TField;
     AReadOnly: Boolean;
  begin
    AField := DataSet.FindField(AFieldName);

    if (AField = nil) then
       Exit;

    try
       AReadOnly := AField.ReadOnly;
       AField.ReadOnly := False;
       case AField.DataType of
         ftFloat: DataSet.FieldByName(AFieldName).AsFloat := AValue;
       else
         DataSet.FieldByName(AFieldName).AsString := AValue;
       end;
    finally
       AField.ReadOnly := AReadOnly;
    end;
  end;

begin
  DataSet.AutoCalcFields:= FALSE;
  // Note:  Do not reference tblOrd_detail specifically because this
  // is shared with Quick Order entery.
  DataSet.FieldByName('ID').AsLargeInt := GetNextID('ORD_DETAIL');
  DataSet.FieldByName('ORDERS_ID').AsLargeInt := TblOrdersID.AsLargeInt;
  try
//    AOnHold:= TFrmMainOrder(Owner).MarkNewLineItemOnHold
//              or
//              ((TblOrdersAPPROVAL_REQUIRED.asString = 'Y') and IsPendingWorkflowApprovalGoOnHold());  // or IsWorkflowMandatory())

    AssignFieldValue( 'ONHOLD', AsYN(AOnHold));

    // Assign the Tax Code ID based on business rules.  This method is executed
    // also for Quick Order entry.
    CheckAssignTaxCodeID(DataSet);

    AssignFieldValue( 'ORD_DET_SEQNO',
      SelectValueFmtAsInteger(
        'Select Max(ORD_DET_SEQNO) from ORD_DETAIL where ORDERS_ID = %f',
        [TblOrdersID.asFloat]) + 1);

    AssignFieldValue( 'PO_INFO', TblOrdersPONO.asString );

    // 05/06/2015 Assign REF_CODE_ID from ARCUSTO.
    // EIQ-6990 Customer Maintenance -> Miscellaneous tab -> add "Reference Description / Code"
    AValue := SelectValueFmtAsFloat(
     'SELECT ref_code_id FROM arcusto WHERE id = %.0f',
     [TblOrdersARCUSTO_ID.AsFloat]);
    if AValue > 0 then
      AssignFieldValue( 'REF_CODE_ID', AValue);
  finally
    DataSet.AutoCalcFields:= TRUE;
  end;

  if (TblOrdersDROP_SHIP_PO_ID.asFloat > 0) and
    Assigned(DataSet.FindField('IS_DROP_SHIP')) then
    DataSet.FieldByName('IS_DROP_SHIP').asString:= 'Y';
end;

procedure TOE_DM.TblReleasesBeforeEdit(DataSet: TDataSet);
var
  AConfirm: Integer;
begin
  AConfirm := 0;

  FOldRelseq := QryReleasesseq.asString;
  FOldRelquan := QryReleasesquan.asString;
  FOldRelforecast := QryReleasesforecast.asString;
  FOldRelship_date := QryReleasesship_date.asString;
  FOldRelcuser1 := QryReleasescuser1.asString;
  FOldRelunit_price := QryReleasesunit_price.asString;
  FOldReluser_date := QryReleasesuser_date.asString;
  FOldRelorig_quan := QryReleasesorig_quan.asString;
  FOldRelran := QryReleasesran.asString;
  FOldRelship_to_id := QryReleasesship_to_id.asString;
  FOldRelshipped_quan := QryReleasesshipped_quan.asString;
  FOldReldate_type := QryReleasesdate_type.asString;
  FOldRelcuser2 := QryReleasescuser2.asString;
  FOldRelbatch_no := QryReleasesbatch_no.asString;
  FOldReljob_seq := QryReleasesjob_seq.asString;
  FOldRelmust_ship_date := QryReleasesmust_ship_date.asString;
  FOldRelack := QryReleasesack.asString;
  FOldReluser_date_2 := QryReleasesuser_date_2.asString;
  FOldReluser_date_3 := QryReleasesuser_date_3.asString;
  FOldRelinternal_update_type := QryReleasesinternal_update_type.asString;
  FOldRellock_must_ship_date := QryReleaseslock_must_ship_date.asString;
  FOldRelcuser3 := QryReleasescuser3.asString;
  FOldRelfreight_id := QryReleasesfreight_id.asString;
  FOldRelwo_note := QryReleaseswo_note.asString;
  FOldRelphantom_releases_id := QryReleasesphantom_releases_id.asString;
  FOldRelpending_verification := QryReleasespending_verification.asString;
  FOldRelinventory_verified_date := QryReleasesinventory_verified_date.asString;
  FOldRelexclude_sched := QryReleasesexclude_sched.asString;
  FOldRelexpedite := QryReleasesexpedite.asString;


//  CheckCashInAdvance;
  TblOrd_Detail.CheckBrowseMode;
  if TblOrd_DetailID.AsLargeInt = 0 then
     // 'Please create an order line item before trying to add releases.'
    raise Exception.Create(oe_rscstr.cTXT0000098);

  CheckPhantomReleaseChild( DataSet );

  FReleasesQuan := QryReleases.FieldByName('quan').AsFloat;


  FQuanOldValue   := QryReleasesQUAN.AsFloat;
  FCumQuanOldValue:= QryReleasesCum_Quan.AsFloat;
  FQty            := QryReleasesQUAN.AsFloat;
  FRequestDate    := QryReleasesREQUEST_DATE.asDateTime;
  FPromiseDate    := QryReleasesPROMISE_DATE.asDateTime;
  FReleasesShip_To_ID:= QryReleasesSHIP_TO_ID.asFloat;
  FExpedited := QryReleasesEXPEDITE.asString;

  QryReleasesMUST_SHIP_DATE.ReadOnly:= not CanEditMustStart;
end;

procedure TOE_DM.QryReleasesBeforeInsert(DataSet: TDataSet);
begin
  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
  // Releases navigator.
  if IsOrderDetailPaymentReceived(TblOrd_DetailID.AsLargeInt) and
    IsReleaseQuantitySumLessThanDetail(
      TblOrd_DetailID.AsLargeInt) then
    CheckOrderShipped
  else
    // Determine whether edits are permissible
    CheckCashInAdvanceReleases;

  TblOrd_Detail.CheckBrowseMode;
  if TblOrd_DetailID.asFloat = 0 then
     // 'Please create an order line item before trying to add releases.'
    raise Exception.Create(oe_rscstr.cTXT0000098);

  // 10/31/2013 Check phantom item (EIQ-1449)
  CheckCanModifyPhantomOrderDetailChild(TblOrd_Detail);

  FQuanOldValue   := 0;
  FCumQuanOldValue:= GetReleasesQuanTotal( TblOrd_DetailID.asFloat );
  FQty            := 0;
  FRequestDate    := 0;
  FPromiseDate    := 0;
  FReleasesShip_To_ID:= -1;
  FExpedited      := 'N';

  QryReleasesMUST_SHIP_DATE.ReadOnly := false;
//  QryReleasesMUST_SHIP_DATE.ReadOnly:= not CanEditMustStart;
end;


procedure TOE_DM.TblReleasesNewRecord(DataSet: TDataSet);
begin
  QryReleasesID.AsLargeInt := GetNextID('Releases');
  QryReleasesORD_DETAIL_ID.AsLargeInt := tblOrd_detailID.AsLargeInt;
  QryReleasesForecast.Value  := 'N';
  QryReleasesUnit_Price.Value:= TblOrd_DetailUnit_Price.Value;
  AssignFieldValue( QryReleasesQUAN, 0 );

  with TFDQuery.Create(NIL) do
  try
//    Connection := db_dm.FDConnection;
    SQL.Add(Format('select Max(seq), Sum(Quan) from releases where ORD_DETAIL_ID = %.0f', [TblOrd_DetailID.asFloat]));
    Open;
    QryReleasesSEQ.AsFloat:= Fields[ 0 ].asFloat + 1;
    AssignFieldValue( QryReleasesCUM_QUAN, Fields[ 1 ].asFloat );
  finally
    Free; // free TFDQuery
  end;

  try
//   TFrmMainOrder(Owner).iqdbgDelDates.SetFocus;
  except
    {walk away when FrmMainOrder is hidden such as if we assign releases in a wrapper}
  end;
end;

procedure TOE_DM.TblReleasesREQUEST_DATEChange(Sender: TField);
begin
  if QryReleasesPromise_DATE.Value = 0 then
    QryReleasesPromise_DATE.Value := QryReleasesRequest_DATE.Value;
end;

procedure TOE_DM.TblOrd_detailUNIT_PRICEChange(Sender: TField);
begin
  FUnitPriceChanged := true;
end;

procedure TOE_DM.TblReleasesAfterPost(DataSet: TDataSet);
var
  Seq: Real;
  aID : Real;
  AConfirm:Integer;
  AQty:Real;
begin
  FOrderChanged:= TRUE;

  {seq}
  RebuildReleasesSeq( TblOrd_DetailID.asFloat, TblOrd_DetailPhantom.asString );

  {sync phantom components releases to the parent}
  if (TblOrd_DetailPhantom.asString = 'Y') then
     case FReleasesPostingState of
       psEdit, psInsert: SyncPhantomReleaseComnponents( QryReleases );
       psDelete        : DeletePhantomReleaseComponents( FDeletedReleases_ID );
     end;

  {ship_date and shipped_quan. Note - must ship date is updated via trigger}
  ExecuteCommandFmt('begin ship_misc.assign_releases_to_shipment( %f ); end;', [TblOrd_DetailID.asFloat]);

  {load releases}
  RebuildReleasesList( TblOrd_DetailID.asFloat );

  RefreshDataSetByID( QryReleases );
  aId := QryReleasesID.AsFloat;

  // lead days
  if (TblOrdersEDI_CHANGE_DATE.asDateTime = 0) and (FPromiseDate <> QryReleasesPROMISE_DATE.asDateTime) then
     CheckLeadDays( aId );

  AQty := GetReleasesQuanTotal( TblOrd_detailID.asFloat );

  FReleasesPostingState:= psNone;
  FDeletedReleases_ID:= 0;
end;

procedure TOE_DM.CheckManuallyGeneratedWorkOrders( AOrd_Detail_ID: Real );
begin
  if (SelectValueFmtAsFloat('select 1 from workorder where manual_source_ord_detail_id = %f', [ AOrd_Detail_ID ]) = 1) then
  begin
     FCheckManuallyGeneratedWorkOrders:= FALSE;
  end;
end;

procedure TOE_DM.TblBill_toCalcFields(DataSet: TDataSet);
begin
   tblBill_ToCityStateZip.AsString :=
   Trim(Trim(tblBill_ToCity.AsString) + ', ' +
   Trim(Trim(tblBill_ToState.AsString) + ' ' +
   Trim (tblBill_ToZip.AsString)));

end;

procedure TOE_DM.TblShip_ToCalcFields(DataSet: TDataSet);
begin
   tblShip_ToCityStateZip.AsString :=
   Trim(Trim(tblShip_ToCity.AsString) + ', ' +
   Trim(Trim(tblShip_ToState.AsString) + ' ' +
   Trim (tblShip_ToZip.AsString)));

end;

procedure TOE_DM.tblOrd_detailBeforeEdit(DataSet: TDataSet);
begin
  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
  // Order Detail navigator.
  CheckCashInAdvance;
  CheckCanModifyPhantomOrderDetailChild( DataSet );

  //FqtyOrd := TblOrd_Detail.FieldByName('Total_Qty_Ord').asFloat;
  TblOrd_DetailARINVT_ID.ReadOnly:= TblOrd_Detail.FieldByName('CUMM_SHIPPED').asFloat <> 0;
  TblOrd_DetailUNIT.ReadOnly     := TblOrd_DetailARINVT_ID.ReadOnly;

  FBlanketQty:= TblOrd_DetailTOTAL_QTY_ORD.asFloat;
  FDetailIsHidden:= TblOrd_DetailHIDE.asString = 'Y';

  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  FUnitPriceChanged := FALSE;
  FTotalQtyChanged := FALSE;
end;


procedure TOE_DM.UpdateQuieries(Query: TFDQuery);
begin
  with Query do
    if Params[0].AsLargeInt <> TblOrdersARCUSTO_ID.AsLargeInt then
    begin
      Close;
      AssignQueryParamValue(Query, Params[0].Name,  TblOrdersARCUSTO_ID.AsLargeInt);
      Open;
    end;
end;


procedure TOE_DM.TblOrdersCalcFields(DataSet: TDataSet);
var
   S, tmp: String;
   ACount:Real;
begin
  // 02/01/2016 (EIQ-10573, Byron) Added conditional to avoid a massive amout
  // of hits to this procedure.  This corrects a speed issue.
//  if not Assigned(Owner) or TFrmMainOrder(Owner).FCreating or FOrderIsPosting then
//     Exit;

  // TODO: Put this into a package function, and then call it
  // in the TblOrders SQL.
  if SelectValueFmtAsString(
    'SELECT NVL(use_discount_params, ''N'') FROM arcusto WHERE id = %d',
    [TblOrdersARCUSTO_ID.AsLargeInt]) = 'Y' then
  begin
      ACount := SelectValueFmtAsFloat(
      'SELECT COUNT(*) FROM orders_discounts WHERE orders_id = %d AND ROWNUM < 3',
      [TblOrdersID.AsLargeInt]);
      if ACount > 1 then
    begin
          TblOrdersCustDiscount.asString := SelectValueFmtAsString(
            'SELECT MIN(code) FROM orders_discounts WHERE orders_id = %d',
            [TblOrdersID.AsLargeInt]) + '...';
        end
      else if ACount = 1 then
        begin
          TblOrdersCustDiscount.asString := SelectValueFmtAsString(
            'SELECT MIN(code) FROM orders_discounts WHERE orders_id = %d',
            [TblOrdersID.AsLargeInt]);
        end
      else
        TblOrdersCustDiscount.asString := '';
    end;

end;

procedure TOE_DM.tblOrd_detailBeforeDelete(DataSet: TDataSet);
begin
  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
  // Order Detail navigator.

  CheckCashInAdvance;
  CheckCanModifyPhantomOrderDetailChild(DataSet);
  // 02/17/2016 (EIQ-9347, Byron) Set the flag
  CheckSetPhantomOrderDetailModified(DataSet);

  if tblOrd_detail.FieldByName('CUMM_SHIPPED').asFloat <> 0 then
    raise Exception.Create('Cannot delete a shipped item ');

  FPostingState:= psDelete;
  FDeletedOrd_Detail_ID:= TblOrd_DetailID.asFloat;
  FIsDeletedOrdDetailPhantom:= TblOrd_DetailPhantom.asString = 'Y';

  CheckDropShipChanged( TblOrd_Detail );
//  DeleteBOGOChildren(TblOrd_DetailID.asFloat);
end;

procedure TOE_DM.TblOrd_DetailAfterPost(DataSet: TDataSet);
var
  AId:Real;
begin
  // 04/11/2016 Moved down
  //TblOrd_Detail.Refresh;

//  CheckFreeFormCheckBox;

  // 04/11/2016 Sequence of actions is very important
  if (FPostingState = psInsert) {or IsRebuildCommissionRequired} then
  begin
    if (FIS_MAKE_TO_ORDER = 'Y') then
      ExecuteCommandFmt(
      'update ord_detail set IS_MAKE_TO_ORDER = ''Y'' where id = %f',
      [TblOrd_DetailID.asFloat]);
    // 08/17/2016 (Byron, EIQ-14214) When inserting, the trigger (TUA_ORD_DETAIL)
    // will populate the commissions table.  So, there is no longer any need
    // to build commisions from the front end.
    // if IsRebuildCommissionRequired then
    //  // Create the commissions records
    //  AssignDefaultCommiss;
    // Calculate the front-end display values
    // 08/17/2016 (Byron, EIQ-14214) This is also no longer necessary because
    // the trigger creates the commissions using the given amount values.
    // RecalculateComissionsAndAmount;
     CheckLotCharge(TblOrd_Detail);
     TblOrd_Detail.Refresh;
    CheckFreeFormCheckBox;
  end
  else
  begin
    RecalculateComissionsAndAmount;
    TblOrd_Detail.Refresh;
    CheckFreeFormCheckBox;
  end;

//  if (FPostingState = psInsert) and (FIS_MAKE_TO_ORDER = 'Y') then
//  begin
//    AId := tblOrd_detailID.asFloat;
//    ExecuteCommandFmt('update ord_detail set IS_MAKE_TO_ORDER = ''Y'' where id = %f', [ TblOrd_DetailID.asFloat ]);
//    tblOrd_detail.Close;
//    tblOrd_detail.Open;
//    tblOrd_detail.Locate('ID', AId, []);
//  end;

  {sync phantom components to the parent ord_detail}
  case FPostingState of
    psInsert,
    psEdit:
      begin
        // 02/17/2016 (EIQ-9347, Byron) Set the flag
        if FTotalQtyChanged then
        begin
          CheckSetPhantomOrderDetailModified(DataSet);
          if TblOrd_DetailPhantom.asString = 'Y' then
            SyncPhantomOrderDetailComponents( TblOrd_Detail );
        end;
      end;
    psDelete:
      if FIsDeletedOrdDetailPhantom then
        DeletePhantomOrderDetailComponents(FDeletedOrd_Detail_ID, TblOrd_Detail)
  end;

  FPostingState:= psNone;
  FUnitPriceChangeAccepted:= FALSE;
  FDeletedOrd_Detail_ID:= 0;
  FIsDeletedOrdDetailPhantom:= FALSE;
  if (TblOrd_DetailID.asFloat > 0) and (TblOrders.FieldByName('FREE_FORM').asString = 'Y') then
     CheckAndAssignReleases;

// 04/11/2016 Moved this up
//  RecalculateComissionsAndAmount;

  FOrderChanged:= TRUE;
  // UpdateOE_Control( TblOrdersID.asFloat );  see CheckIncrement
  ReopenQuery( QryOrdTotal );

  if FArinvt_ID_Changed then
     RecalcOrderReleasesMustShipDate;

  if FResetDrop_ship_po_id then
  begin
    ExecuteCommandFmt('update orders set drop_ship_po_id = null where id = %f', [TblOrdersID.asFloat]);
    TblOrders.Refresh;
  end;
  FResetDrop_ship_po_id := false;

//  TFrmMainOrder(Owner).SetControls;
//  TFrmMainOrder(Owner).Assign_BOGO_Item(TblOrd_DetailID.asFloat, TblOrd_Detail);
end;

procedure TOE_DM.CheckLotCharge(ADataset:TDataSet);
begin
end;



procedure TOE_DM.CheckDropShipChanged( ADataSet: TDataSet );
var
  AOldIsDropShip: string;
  ACargo: TChangingDropShipCargo;
begin
  {for drop ship the sync between order and po is handled on both front and backend.
   order details : we handle insert and delete on the front end and updates via trigger
   order releases: entirely via trigger
   PO            : the fields readonly property of the drop ship records however is handled entirely on the front end}

  AOldIsDropShip:= SelectValueByID('nvl(is_drop_ship, ''N'')', 'ord_detail', ADataSet.FieldByName('ID').asFloat);

  if AOldIsDropShip = '' then AOldIsDropShip:= 'N';

  ACargo:= TChangingDropShipCargo.Create(TblOrdersDROP_SHIP_PO_ID.asFloat);
  with ACargo do
  begin
    Ord_Detail_ID:= ADataSet.FieldByName('ID').asFloat;             // ADataSet.FieldByName('ID').asFloat;
    Arinvt_ID    := ADataSet.FieldByName('ARINVT_ID').asFloat;      // ADataSet.FieldByName('ARINVT_ID').asFloat;
    Division_ID  := TblOrdersDIVISION_ID.asFloat;
    OldIsDropShip:= AOldIsDropShip;
    NewIsDropShip:= ADataSet.FieldByName('IS_DROP_SHIP').asString;   // ADataSet.FieldByName('IS_DROP_SHIP').asString;
    Comment1     := ADataSet.FieldByName('COMMENT1').asString;       // ADataSet.FieldByName('COMMENT1').asString;
    PostingState := FPostingState;
    Total_Qty_Ord:= ADataSet.FieldByName('TOTAL_QTY_ORD').asFloat;
    UnitPriceChangeAccepted:= FUnitPriceChangeAccepted;
  end;

  // finally - launch the call
  TOE_DM.CheckDropShipChangedApplyToPO( ACargo );  // this unit
end;

class procedure TOE_DM.CheckDropShipChangedApplyToPO( ACargo: TChangingDropShipCargo {oe_misc.pas} );
var
  APO_ID: Int64;

  function _total_ord_qty_changed: Boolean;
  begin
    Result:= ACargo.UnitPriceChangeAccepted
             and
             (SelectValueByID('TOTAL_QTY_ORD', 'ORD_DETAIL', ACargo.Ord_Detail_ID) <> ACargo.Total_Qty_Ord);
  end;

  procedure CheckDeleteAssociatedPO( AOrd_Detail_ID: Int64 );
  begin
    //migrated to stored procedure AMB EIQ-6532 SO - CalcAggregatePriceBasedOnTiers - move logic to Oracle stored procedure
    ExecuteCommandFmt('begin oe_misc.DropShipCheckDeleteAssocPO( %d ); end;',
                      [AOrd_Detail_ID]);
  end;


  procedure _assign_drop_ship_po;
  begin
    // check Drop_Ship_PO_ID is preassigned
  end;


  procedure _assign_drop_ship_po_unit_price;
  begin
  end;


begin
  {for drop ship the sync between order and po is handled on both front and backend.
   order details : we handle insert and delete on the front end and updates via trigger
   order releases: entirely via trigger
   PO            : the fields readonly property of the drop ship records however is handled entirely on the front end}

  if ACargo.OldIsDropShip = '' then ACargo.OldIsDropShip:= 'N';

  case ACargo.PostingState of
    psDelete:
      if ACargo.OldIsDropShip = 'Y' then
         {delete the po}
         CheckDeleteAssociatedPO(Trunc(ACargo.Ord_Detail_ID));

    psInsert, psEdit:
      begin
        if (ACargo.NewIsDropShip = 'Y') and (ACargo.OldIsDropShip = 'N') then
          begin
            _assign_drop_ship_po;
            _assign_drop_ship_po_unit_price;

            ExecuteCommandFmt('update po_detail set cmtline = ''%s'', division_id = %s  where drop_ship_ord_detail_id = %f',
                      [ StrTran(ACargo.Comment1, '''', ''''''),
                        FloatToStr0asNull( ACargo.Division_ID, 'null' ),
                        ACargo.Ord_Detail_ID ]);
          end

        else if (ACargo.NewIsDropShip = 'Y') and (ACargo.OldIsDropShip = 'Y') and _total_ord_qty_changed() then
          _assign_drop_ship_po_unit_price

        else if (ACargo.NewIsDropShip <> 'Y') and (ACargo.OldIsDropShip = 'Y') then
            System.SysUtils.ABORT;
      end;
  end;
end;

function TOE_DM.ChangeTaxCode(ADataSet: TDataSet): Boolean;
begin
  with PkTaxCode do
  begin
    Result := Execute;
    if Result then
    begin
      if not (ADataSet.State in [dsEdit, dsInsert]) then
        ADataSet.Edit;
      ADataSet.FieldByName('TAX_CODE_ID').AsLargeInt := VarAsType(
        GetValue('ID'), varInt64);
      // Update the calculated "display" field
      ADataSet.FieldByName('TAX_CODE').asString := SelectValueFmtAsString(
        'select tax_code from tax_codes where id = %d',
        [ADataSet.FieldByName('TAX_CODE_ID').AsLargeInt]);
    end;
  end;
end;

procedure TOE_DM.ClearTaxCode(ADataSet: TDataSet);
begin
  if not (ADataSet.State in [dsEdit, dsInsert]) then
    ADataSet.Edit;
  ADataSet.FieldByName('TAX_CODE_ID').Clear;
  ADataSet.FieldByName('TAX_CODE').Clear;
end;

procedure TOE_DM.CheckAndAssignReleases;
var
  dRequestDate:TDateTime;
begin
  dRequestDate := CheckRequestDate;
  ExecuteCommandFmt('delete releases where ord_detail_id = %f',
   [tblOrd_Detail.FieldByName('ID').asFloat]);

  if TblOrd_Detail.FieldByName('TOTAL_QTY_ORD').asFloat <> 0 then
     ExecuteCommandFmt('insert into releases ' +
               '(ord_detail_id, ' +
               'promise_date, ' +
               'request_date, ' +
               'quan, ' +
               'unit_price, ' +
               'seq) ' +
               'values ' +
               '(%f, ' +
               'to_date(''%s'', ''MM/DD/RRRR'') , ' +
               'to_date(''%s'', ''MM/DD/RRRR'') , ' +
               '%f, ' +
               '%f, ' +
               '1) ',
               [tblOrd_Detail.FieldByName('ID').asFloat,
               FormatDateTime('mm/dd/yyyy', dRequestDate),
               FormatDateTime('mm/dd/yyyy', dRequestDate),
               tblOrd_Detail.FieldByName('TOTAL_QTY_ORD').asFloat,
               tblOrd_Detail.FieldByName('UNIT_PRICE').asFloat]);
end;


function TOE_DM.CheckRequestDate:TDateTime;
var
  ADate: TDateTime;
begin
  ADate := Date;
  Result:= ADate;
     Result:= ADate;
end;


procedure TOE_DM.PkArcustoIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
var
  AId:Real;
begin
//   Action:= DoIQCustomerModal( self, AID ); {cust.pas}
  if (Action = mrOk) then
    ResultValue := AId;
  TblOrders.Refresh;
end;

procedure TOE_DM.PkArInvtBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'FILTER_ARCUSTO', Integer(FPkFilter_FilterInventoryByCustomer));
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', TblOrdersARCUSTO_ID.AsLargeInt);
  AssignQueryParamValue(DataSet, 'FILTER_EPLANT', Integer(TblOrdersEPLANT_ID.AsLargeInt > 0));
  AssignQueryParamValue(DataSet, 'EPLANT_ID', TblOrdersEPLANT_ID.AsLargeInt);
end;

procedure TOE_DM.PkBOMBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id',
    TblOrd_detailARINVT_ID.AsLargeInt);
end;

procedure TOE_DM.PkOrdersIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
//  PostMessage( TFrmMainOrder(Owner).Handle, wm_Command, TFrmMainOrder(Owner).New1.Command, 0 );
//  TblOrders.Insert;
end;


procedure TOE_DM.TblReleasesCalcFields(DataSet: TDataSet);
var
  nReleased, nShipped:Real;
begin
//  if TFrmMainOrder(Owner).sbtnSigma.Down  then
//     {cumulative}
//     begin
//       if (QryReleases.State in [ dsEdit, dsInsert ]) then
//          QryReleasesCum_Quan.asString:= FloatToStr(StrToFloat(TFrmMainOrder(Owner).wwDbeCumm_Qty.Text))
//       else
//          QryReleasesCum_Quan.asFloat:= GetReleasesCumQuan( QryReleasesID.asFloat, TblOrd_DetailID.asFloat )
//     end
//  else
     {normal input through QUAN}
     QryReleasesCum_Quan.asFloat:= GetReleasesCumQuan( QryReleasesID.asFloat, TblOrd_DetailID.asFloat );


  if QryReleases.FieldByName('ship_date').asDateTime > 0 then
     begin
       QryReleases.FieldByName('Released').asFloat  := QryReleases.FieldByName('quan').asFloat;
       QryReleases.FieldByName('LeftToShip').asFloat:= 0;
     end
  else if QryReleases.FieldByName('shipped_quan').asFloat > 0 then
     begin
       QryReleases.FieldByName('Released').asFloat  := QryReleases.FieldByName('shipped_quan').asFloat;
       QryReleases.FieldByName('LeftToShip').asFloat:= Max(0, QryReleases.FieldByName('quan').asFloat - QryReleases.FieldByName('shipped_quan').asFloat);
     end
  else
     begin
       QryReleases.FieldByName('Released').asFloat  := 0;
       QryReleases.FieldByName('LeftToShip').asFloat:= QryReleases.FieldByName('quan').asFloat;
     end;

end;

procedure TOE_DM.tblOrd_detailAfterCancel(DataSet: TDataSet);
begin
  CheckFreeFormCheckBox;
end;

procedure TOE_DM.QryReleasesBeforePost(DataSet: TDataSet);
var
  AValue: Real;
  AMinSellQty, AmultipleOf: Real;
begin
  AValue := 0;

  if QryReleasesID.AsLargeInt = 0 then
     QryReleasesID.AsLargeInt:= GetNextID('Releases')
   else
    CheckCashInAdvanceReleases;

  if (QryReleasesEXPEDITE.asString = 'Y') and (QryReleasesEXPEDITE.asString <> FExpedited) and (QryReleasesLeftToShip.asFloat <= 0) then
    raise exception.create(oe_rscstr.cTXT0000140);

  CheckReleaseDates( DataSet, FPromiseDate, FRequestDate );

  if (QryReleases.FieldByName('quan').AsFloat > FReleasesQuan) and
     (QryReleases.FieldByName('ship_date').AsDateTime <> 0) then
     ExecuteCommandFmt('update releases set ship_date = null where id = %f',
       [QryReleases.FieldByName('id').asFloat]);

  if TblOrdersEDI_CHANGE_DATE.AsDateTime <> 0 then
    QryReleasesINTERNAL_UPDATE_TYPE.asString := 'EDI';

  QryReleasesORD_DETAIL_ID.asFloat:= TblOrd_DetailID.asFloat;

//  if TFrmMainOrder(Owner).sbtnSigma.Down and (TFrmMainOrder(Owner).iqdbgDelDates.GetActiveField = QryReleasesCum_Quan) then
//     TFrmMainOrder(Owner).iqdbgDelDates.FlushChanges;

  if QryReleasesQUAN.asFloat = 0 then
     // 'Please enter a release quantity.'
     raise Exception.Create(oe_rscstr.cTXT0000101);
  if QryReleasesQUAN.asFloat < 0 then
     // 'The release quantity must be greater than 0.'
     raise Exception.Create(oe_rscstr.cTXT0000102);

  if QryReleasesORIG_QUAN.asFloat = 0 then
    QryReleasesORIG_QUAN.asFloat := QryReleasesQUAN.asFloat;

  if (FQty <> QryReleasesQUAN.asFloat)
     or
     ((FRequestDate <> QryReleasesREQUEST_DATE.asDateTime) and (FRequestDate <> 0))
     or
     ((FReleasesShip_To_ID <> QryReleasesSHIP_TO_ID.asFloat) and (FReleasesShip_To_ID > -1))
     or
     ((FPromiseDate <> QryReleasesPROMISE_DATE.asDateTime) and (FPromiseDate <> 0)) then
  begin
     // if qty changed then check multiples
     CheckCashInAdvanceReleases;
  end;

  // Compare values and get the expected release quantity
  if AmultipleOf > 0 then
    begin
      if AMinSellQty < AmultipleOf then
        AValue := AmultipleOf
      else
        AValue := ceil( AMinSellQty / AmultipleOf ) * AmultipleOf;
    end
  else if AMinSellQty > 0 then
    AValue := AMinSellQty;

   // If current release qty is less than the expected release quantity, then
   // prompt user to replace the qty with the MIN_SELL_QTY value.

  FCheckManuallyGeneratedWorkOrders:= (FQty <> QryReleasesQUAN.asFloat)
                                      or
                                      (FPromiseDate <> QryReleasesPROMISE_DATE.asDateTime);

  case DataSet.State of
    dsInsert: FReleasesPostingState:= psInsert;
    dsEdit  : FReleasesPostingState:= psEdit;
  else
    FReleasesPostingState:= psNone;
  end;

end;


procedure TOE_DM.ReopenQuery( AQuery:TFDQuery );
begin
  with AQuery do
  try
    DisableControls;
    Close;
    Open;
  finally
    EnableControls;
  end;
  PostMCMessage;
end;

procedure TOE_DM.PostMCMessage;
begin
//  nId := TblOrders.FieldByName('currency_id').asInteger;
//  if nId = 0 then nId := Trunc(GetEplantNativeCurrencyId); {in McShare.pas}
//  PostMessage( Application.MainForm.Handle, iq_MCRefreshDataSets, nId, 0 );
end;

procedure TOE_DM.UpdateMirrorField( Sender: TField );
var
  AValue: Real;
  ANewValue: Real;
begin
    if Sender = QryReleasesQUAN then
    begin
       ANewValue:= Sender.NewValue;
       AValue   := FCumQuanOldValue + ANewValue - FQuanOldValue;
       AssignFieldValue( QryReleasesCUM_QUAN, AValue );
    end
end;

procedure TOE_DM.AssignFieldValue( AField: TField; AValue: Real );
var
  AOnChange   : TFieldNotifyEvent;
  AReadOnly   : Boolean;
begin
  with AField do
  try
     AOnChange:= OnChange;
     OnChange := NIL;

     AReadOnly:= ReadOnly;
     ReadOnly := FALSE;

     AsFloat  := Max( 0, AValue );
  finally
     ReadOnly:= AReadOnly;
     OnChange:= AOnChange;
  end;
end;

procedure TOE_DM.TblOrd_detailARINVT_IDChange(Sender: TField);
var
  AUom:String;
begin
  FArinvt_ID_Changed:= TRUE;

  if Sender.DataSet.FieldByName('MISC_ITEM').asString <> '' then
     EXIT;

  AUom:= SelectValueFmtAsString( 'select uom from aka '+
                        ' where arinvt_id = %f and arcusto_id = %f and nvl(kind, ''*'') = nvl(''%s'', ''*'') '+
                        '   and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
                       [ Sender.asFloat,
                         TblOrders.FieldByName('ARCUSTO_ID').asFloat,
                         TblOrd_Detail.FieldByName('AKA_KIND').asString,
                         TblOrders.FieldByName('ARCUSTO_ID').asFloat,
                         TblOrders.FieldByName('SHIP_TO_ID').asFloat]);
  if TblOrdersIS_INTERCOMP.asString <> 'Y' then  // 02-15-2013 ICT orders should be always in native UOM
    if AUom = '' then
     AUom:= SelectValueFmtAsString('select uom from arinvt_uom_conv where arinvt_id = %f and NVL(default_oe, ''N'') = ''Y''', [ Sender.asFloat ]);
  if AUom = '' then
     AUom := SelectValueByID( 'NVL(unit, ''EACH'')', 'arinvt', Sender.asFloat );
  if  not (tblOrd_detail.State in [ dsEdit, dsInsert ]) then
    tblOrd_detail.Edit;

  IQMS.Common.DataLib.ForceValue(SrcOrd_Detail, tblOrd_detailUNIT, AUom);

  with Sender.DataSet do
    //FieldByName( 'uom_factor' ).asFloat:= IQToNativeUomFactor( FieldByName('unit').asString,  // AFromUOM
    //                                      FieldByName('arinvt_id').asFloat,                   // AArinvt_ID
    //                                      TRUE );                                             // AIgnoreError
    IQMS.Common.DataLib.ForceValue(SrcOrd_Detail, FieldByName( 'uom_factor' ), FieldByName('unit').asString);

  if Sender = QryQuickOeARINVT_ID then
     EXIT;

  {drop_ship}
  if TblOrd_detailIS_DROP_SHIP.asString = '' then
     AssignDefaultDropShip( Sender.asFloat, TblOrdersARCUSTO_ID.asFloat );
     // IQMS.Common.DataLib.ForceValue( SrcOrd_Detail, TblOrd_detailIS_DROP_SHIP,
     //      SelectValueFmtAsString('select is_drop_ship from aka where arinvt_id = %f and arcusto_id = %f', [ Sender.asFloat, TblOrdersARCUSTO_ID.asFloat ]));

  ShowItemInfo( Sender.asFloat, TblOrdersARCUSTO_ID.asFloat );
end;

procedure TOE_DM.AssignDefaultCommiss;
begin
  ExecuteCommandFmt(
   'BEGIN iqms.oe_misc.assign_default_commissions(%d, %d); END;',
   [tblOrd_detailID.AsLargeInt,
   Integer(IsRebuildCommissionRequired)]);
  IsRebuildCommissionRequired := False;
end;

procedure TOE_DM.AssignDefaultCommissQuick;
begin
  ExecuteCommandFmt(
   'BEGIN iqms.oe_misc.assign_default_commissions(%d, %d); END;',
   [QryQuickOEID.AsLargeInt,
   Integer(True)]);
  IsRebuildCommissionRequired := False;
  TblCommQuick.Refresh;
end;

procedure TOE_DM.AssignDefaultDropShip( AArinvt_ID, AArcusto_ID: Real );
var
  S: string;
begin
  if AArinvt_ID = 0 then EXIT;

  S:= SelectValueByID('is_drop_ship', 'arinvt', AArinvt_ID);
  if S <> 'Y' then
     S:= SelectValueFmtAsString('select is_drop_ship from aka where arinvt_id = %f and arcusto_id = %f', [ AArinvt_ID, AArcusto_ID ]);

  IQMS.Common.DataLib.ForceValue( SrcOrd_Detail, TblOrd_detailIS_DROP_SHIP, S );
end;


function TOE_DM.SelectInventoryItem(const AFilterByCustomer: Boolean;
  var AArinvtID: LargeInt): Boolean;
begin
  FPkFilter_FilterInventoryByCustomer := AFilterByCustomer;
  with PkArinvt do
   begin
     Result := Execute;
     if Result then
       AArinvtID := System.Variants.VarAsType(GetValue('ID'), varInt64);
   end;
end;

procedure TOE_DM.ShowItemInfo( ANew_Arinvt_ID, AArcusto_ID: Real );
begin
  // 01/15/2014 (Byron) Moved lines to shared unit and method.  I made
  // this change for EIQ-5618.
end;

function TOE_DM.GetCommissionPercent( AArinvt_ID, AArcusto_ID: Real ): Real;
begin
  if AArinvt_ID <> 0 then
  begin
     Result:= SelectValueFmtAsFloat('select comis_prcnt from aka where arcusto_id = %f and arinvt_id = %f ' +
                         ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
     [ AArcusto_ID,
       AArinvt_ID,
       AArcusto_ID,
       TblOrdersSHIP_TO_ID.asFloat ]);

     if Result > 0 then
        EXIT;

     Result:= SelectValueFmtAsFloat('select comis_prcnt from arinvt where id = %f', [ AArinvt_ID ]);
     if Result > 0 then
        EXIT;

     Result:= SelectValueFmtAsFloat('select comm_pcnt from arcusto where id = %f', [ AArcusto_ID ]);
  end
  else
    Result:= 0;
end;

procedure TOE_DM.SrcOrd_DetailDataChange(Sender: TObject; Field: TField);
var
  AMultiple:Real;
  AQty:Real;
  AUnit:String;

begin
//  if TFrmMainOrder(Owner).FCreating then
//     Exit;

//  with TFrmMainOrder(Owner) do
//  if (TblOrd_Detail.State = dsBrowse) and Assigned(TotalOnOrder1) then
//     TotalOnOrder1.Enabled := TblOrd_Detail.FieldByName('ARINVT_ID').asFloat <> 0;

  // 12/30/2013 Do not allow a campaign code to be added to the detail
  // if the header already has a campaign code assigned.
  tblOrd_detailCampaignCode.Visible := TblOrdersCAMPAIGN_ID.AsFloat = 0;

  if (Sender = SrcOrd_Detail) and (TblOrd_Detail.State in [dsEdit, dsInsert]) then
  begin
    if ((Field = TblOrd_detailPRICE_PER_1000) or (Field = TblOrd_detailUNIT_PRICE) or (Field = TblOrd_detailDISCOUNT)) then
       // try
       //    if Field = TblOrd_detailPRICE_PER_1000 then
       //       AssignMirrorValueTo( tblOrd_detailUNIT_PRICE, TblOrd_detailPRICE_PER_1000.asFloat / 1000 )
       //    else if Field = TblOrd_detailUNIT_PRICE then
       //       AssignMirrorValueTo( TblOrd_detailPRICE_PER_1000, tblOrd_detailUNIT_PRICE.asFloat * 1000 )
       //    else if Field = TblOrd_detailDISCOUNT then
       //       AssignDiscountToUnitPrice( TblOrd_detailDISCOUNT.asFloat );
       // except
       //    AssignMirrorValueTo( TblOrd_detailUNIT_PRICE, 0     );
       //    AssignMirrorValueTo( TblOrd_detailPRICE_PER_1000, 0 );
       //    raise;
       // end
       CheckAssignMirrorValue( SrcOrd_Detail, Field )

    else if ((Field = tblOrd_detailTOTAL_QTY_ORD) or (Field = tblOrd_detailCONTAINERS)) then
    begin
      AMultiple := SelectValueFmtAsFloat('select multiple from arinvt where id = %f', [tblOrd_detailARINVT_ID.asFloat]);
      AUnit     := SelectValueFmtAsString('select unit from arinvt where id = %f', [tblOrd_detailARINVT_ID.asFloat]);
      if AMultiple = 0 then
        AMultiple := 1;
      if AUnit = '' then
        AUnit := tblOrd_detailUNIT.asString;
      if Field = tblOrd_detailTOTAL_QTY_ORD then
      begin
        AQty := tblOrd_detailTOTAL_QTY_ORD.asFloat;
        AQty := AQty;
        AQty := AQty/AMultiple;
        AssignContainers( tblOrd_detailCONTAINERS, AQty );
      end
      else
      begin
        AQty := tblOrd_detailCONTAINERS.asFloat*AMultiple;
        AQty := AQty;
        AssignContainers( tblOrd_detailTOTAL_QTY_ORD, AQty);
      end;
    end;
  end;

  // if (Sender = SrcOrd_Detail) and (TblOrd_Detail.State = dsBrowse) then
  //    TFrmMainOrder(self.Owner).sbtnShowUOMConversion.Enabled:= CompareText( Trim(TblOrd_DetailArinvt_Unit.asString), Trim(TblOrd_DetailUNIT.asString)) <> 0;

  PostMCMessage;

  CheckOrdDetailChanged( TblOrd_detailID.asFloat );
end;

procedure TOE_DM.AssignContainers( AField:TField; AValue:Real );
var
  ADataChange: TDataChangeEvent;
begin
  //if not AField.ReadOnly then
     with SrcOrd_Detail do
     try
       ADataChange := OnDataChange;
       OnDataChange:= NIL;
       //AField.AsFloat:= AValue;
       ForceValue( AField, AValue );
     finally
       OnDataChange:= ADataChange;
//       TFrmMainOrder(self.Owner).iqdbgOrders.InvalidateCurrentRow;
     end;
end;


procedure TOE_DM.AssignMirrorValueTo( AField:TField; AValue:Real; ADataSource: TDataSource = nil );
var
  ADataChange: TDataChangeEvent;
  APrice:Real;
  ADataSourceInFocus: TDataSource;
begin
  ADataSourceInFocus:= ADataSource;   // SrcOrd_Detail or SrcQuickOE
  if ADataSourceInFocus = nil then
     ADataSourceInFocus:= SrcOrd_Detail;

     with ADataSourceInFocus do
     try
       ADataChange := OnDataChange;
       OnDataChange:= NIL;
       ForceValue( AField, AValue );

       APrice := DataSet.FieldByName('List_Unit_Price').asFloat;
       if APrice = 0 then
       begin
         APrice := DataSet.FieldByName('UNIT_PRICE').asFloat;
         ForceValue(DataSet.FieldByName('List_Unit_Price'), APrice);
       end;

       try
         if Abs(APrice) <= 0.000001 then
            IQMS.Common.DataLib.ForceValue( ADataSourceInFocus, DataSet.FieldByName('DISCOUNT'), 0)
         else
            IQMS.Common.DataLib.ForceValue( ADataSourceInFocus, DataSet.FieldByName('DISCOUNT'),
                    Round(( 1 - DataSet.FieldByName('UNIT_PRICE').asFloat / APrice ) * 100 * 100) / 100);
       except
         IQMS.Common.DataLib.ForceValue( ADataSourceInFocus, DataSet.FieldByName('DISCOUNT'), 0);
       end;
     finally
       OnDataChange:= ADataChange;
//       TFrmMainOrder(self.Owner).iqdbgOrders.InvalidateCurrentRow;
       // TFrmMainOrder(self.Owner).wwDBGridQuickOE.InvalidateCurrentRow;
     end;
end;

procedure TOE_DM.AssignDiscountToUnitPrice( ADiscount: Real; ADataSource: TDataSource = nil );
var
  ADataChange: TDataChangeEvent;
  APrice:Real;
  ADataSourceInFocus: TDataSource;
begin
  ADataSourceInFocus:= ADataSource;  // SrcOrd_detail or SrcQuickOE
  if ADataSourceInFocus = nil then
     ADataSourceInFocus:= SrcOrd_Detail;

  with ADataSourceInFocus do
  try
    ADataChange := OnDataChange;
    OnDataChange:= NIL;
    APrice:= DataSet.FieldByName('List_Unit_Price').asFloat;
    if APrice = 0 then
    begin
      APrice := DataSet.FieldByName('UNIT_PRICE').asFloat;
      ForceValue(DataSet.FieldByName('List_Unit_Price'), APrice);
    end;

    if not DataSet.FieldByName('UNIT_PRICE').ReadOnly then
       DataSet.FieldByName('UNIT_PRICE').asFloat:= APrice * (1 - ADiscount / 100 );
    if not DataSet.FieldByName('PRICE_PER_1000').ReadOnly then
       DataSet.FieldByName('PRICE_PER_1000').asFloat:= DataSet.FieldByName('UNIT_PRICE').asFloat * 1000;
  finally
    OnDataChange:= ADataChange;
//    TFrmMainOrder(self.Owner).iqdbgOrders.InvalidateCurrentRow;
  end;
end;

procedure TOE_DM.TblOrdersBeforeEdit(DataSet: TDataSet);
begin
  // 12/30/2015 (EIQ-9989) Post detail changes first
  if (QryQuickOE.State in [dsEdit, dsInsert]) then
    QryQuickOE.Post;

  CheckCashInAdvance;
  if Dataset.State in [dsInsert] then
    FDeliveryDate := 0
  else
    FDeliveryDate := TblOrdersORD_LINE_DATE.asDateTime;

  FShip_To_Comissions_id  := SelectValueFmtAsFloat('select COMMISSIONS_ID from ship_to where id = %f', [TblOrdersSHIP_TO_ID.asFloat]);
  FDiscountChanged  := FALSE;
  FShip_To_Changed  := FALSE;
  FArinvt_ID_Changed:= FALSE;
  FFreight_Changed  := FALSE;
  FUnitPriceChangeAccepted:= FALSE;
  FArcusto_Id_Changed := FALSE;
  FCurrentApprovalRequired:= TblOrdersAPPROVAL_REQUIRED.asString;
end;


procedure TOE_DM.TblOrdersBeforeInsert(DataSet: TDataSet);
begin
  if Dataset.State in [DsInsert] then
    FDeliveryDate := 0
  else
    FDeliveryDate := TblOrdersORD_LINE_DATE.asDateTime;

  FShip_To_Comissions_id := -1;

  FDiscountChanged  := FALSE;
  FShip_To_Changed  := FALSE;
  FArinvt_ID_Changed:= FALSE;
  FFreight_Changed  := FALSE;
  FUnitPriceChangeAccepted:= FALSE;
  FArcusto_Id_Changed := FALSE;
  FCurrentApprovalRequired:= '';
end;





procedure TOE_DM.TblOrdersDISCOUNTChange(Sender: TField);
begin
  FDiscountChanged:= TRUE;
end;

procedure TOE_DM.TblOrdersSHIP_TO_IDChange(Sender: TField);
begin
  FShip_To_Changed:= TRUE;
end;

procedure TOE_DM.TblOrdersFREIGHT_IDChange(Sender: TField);
begin
  FFreight_Changed:= TRUE;
end;

procedure TOE_DM.TblOrdersNewRecord(DataSet: TDataSet);
begin
  TblOrdersID.AsLargeInt := GetNextID('ORDERS');
end;

procedure TOE_DM.TblOrdersORD_LINE_DATEChange(Sender: TField);
begin
  FDeliveryDateChanged := True;
end;

procedure TOE_DM.TblOrdersAfterPost(DataSet: TDataSet);
var
  ATaxCodeId:Real;
  ACount, ACount2:Real;
  AConfirm:Integer;
  AShip_To_Comissions_id:Real;
  ACheckComissions_id, AAvalaraEnabled:boolean;
begin
  // 02/01/2016 (EIQ-10573, Byron) Now, only after refreshing, reset the
  // flag to allow calculated fields to be populated.  This corrects a
  // speed issue.
  FOrderIsPosting := False;

  // Refresh the ORDERS table in order to refresh division_id assigned by the trigger.
  TblOrders.Refresh;

  if (TblOrdersAPPROVAL_REQUIRED.asString = 'Y') and (FCurrentApprovalRequired <> 'Y') and IsPendingWorkflowApprovalGoOnHold then
  begin
    ExecuteCommandFmt('update ord_detail set onhold = ''Y'' where orders_id = %f', [ TblOrdersID.asFloat ]);
    Reopen( TblOrd_Detail );
  end;

  if FDiscountChanged and
//    not TFrmMainOrder(Owner).QuickOrderEntryNoReleases1.Checked and
    TblOrd_Detail.Active then
  begin
    TblOrd_Detail.First;
    while not TblOrd_Detail.Eof do
    begin
      TblOrd_Detail.Edit;
      AssignUnitPrice;
      TblOrd_Detail.Post;
      TblOrd_Detail.Next;
    end;
    FDiscountChanged:= FALSE;
  end;

  if FShip_To_Changed or FFreight_Changed then
     RecalcOrderReleasesMustShipDate;

  if FArcusto_Id_Changed and FVinGen_Licensed then
    ExecuteCommandFmt('begin mto.sync_all_vinhist_mlabel_to_SO(%.0f); end;', [ TblOrdersID.asFloat ]);


  AShip_To_Comissions_id  := SelectValueFmtAsFloat('select COMMISSIONS_ID from ship_to where id = %f', [TblOrdersSHIP_TO_ID.asFloat]);
  ACount2 := SelectValueFmtAsFloat('select count(id) from ord_detail where orders_id = %f', [TblOrdersID.asFloat]);
  ACheckComissions_id := (AShip_To_Comissions_id <> FShip_To_Comissions_id) and (FShip_To_Comissions_id >= 0) and (ACount2 <> 0);
  FShip_To_Comissions_id := -1;
  ATaxCodeId := SelectValueFmtAsFloat('select tax_code_id from ship_to where id = %f', [TblOrdersSHIP_TO_ID.asFloat]);

  // Delivery Date
  CheckDeliveryDateChanged;
  ResetDeliveryDateChanged;
end;

function TOE_DM.CanPromptDeliveryDateChanged: Boolean;
begin
  // Determine if conditions are right to prompt the user
  // to update the delivery date.
  Result := // TFrmMainOrder(Owner).QuickOrderEntry and
    (FDeliveryDateChanged or (FDeliveryDate <> 0)) and
    (FDeliveryDate <> TblOrdersORD_LINE_DATE.asDateTime) and
    not (QryQuickOE.eof and QryQuickOE.bof);
end;

procedure TOE_DM.CheckDeliveryDateChanged;
begin
  // Check and prompt user to update the Delivery Date.
end;

procedure TOE_DM.ResetDeliveryDateChanged;
begin
  // Reset private variables used to determine whether or not
  // to prompt the user to update the Delivery Date.
  FDeliveryDate := TblOrdersORD_LINE_DATE.asDateTime;
  FDeliveryDateChanged := False;
end;

procedure TOE_DM.SrcOrdTotalDataChange(Sender: TObject; Field: TField);
begin
  PostMCMessage;
end;

procedure TOE_DM.SrcReleasesDataChange(Sender: TObject; Field: TField);
begin
  // 09/08/2006 (Byron)  Check for CRM Activity linked to order detail
  if (Field = QryReleasesPROMISE_DATE) and
     (QryReleases.State in [dsEdit, dsInsert]) then
     CheckCRMActivityLinkedToOrderDetail; // local method; see below

  if Assigned(QryReleases) and (QryReleases.State = dsBrowse) then
     QryReleasesMUST_SHIP_DATE.ReadOnly:= not CanEditMustStart;

  PostMCMessage;
end;

procedure TOE_DM.CheckCRMActivityLinkedToOrderDetail;
var
   A: Variant;
   ACRMActivityID: Real;
   ADuration: Real;
   ACurStartDate, ACurEndDate,
   ANewStartDate, ANewEndDate: TDateTime;
begin
  { 09/08/2006 Added by Byron.  Requested by Shannon.

    This method checks to see if there is a CRM activity linked to the current
    order detail item.  If so, then we prompt the user to change the start and
    end dates.  This method is only called when the Promise Date changes. }

  if not (QryReleases.State in [dsEdit, dsInsert]) then Exit;

  // Get data ...
  A := SelectValueArrayFmt('select id, startdate, finishdate from crm_activity where ORDER_DTL_ID = %.0f', [tblOrd_detailID.AsFloat]);
  if VarArrayDimCount(A) = 0 then Exit;
  ACRMActivityID := A[0];
  ACurStartDate  := A[1];
  ACurEndDate    := A[2];
  ADuration      := Abs(ACurEndDate - ACurStartDate);
  // Since PROMISE_DATE has no time value, we add the old time value
  ANewStartDate  := Trunc(QryReleasesPROMISE_DATE.AsDateTime) + Frac(ACurStartDate);
  ANewEndDate    := ANewStartDate + ADuration; // increment new FINISHDATE with the current interval

  // Do we have an activity?  If not, then exit
  if (ACRMActivityID = 0) then Exit;

  // Check to see if values have changed
  if (ACurStartDate = ANewStartDate) and
     (ACurEndDate = ANewEndDate) then
     Exit; // no change, exit early

  // Update the values
  ExecuteCommandFmt('update crm_activity set '#13 +
            ' startdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13 +
            ' finishdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi'') '#13 +
            'where id = %.0f',
            [FormatDateTime('mm/dd/yyyy hh:nn', ANewStartDate),
             FormatDateTime('mm/dd/yyyy hh:nn', ANewEndDate),
             ACRMActivityID]);

end;

procedure TOE_DM.TblCommBeforePost(DataSet: TDataSet);
var
  AComm:Real;
begin
  FAmountChanged := false;
  FPercentChanged := false;
  FAmountChangedId := 0;
  FPercentChangedId := 0;

  if tblOrd_detailID.AsLargeInt = 0 then
    // 'Parent record not found.  Cannot post.'
    raise Exception.Create(oe_rscstr.cTXT0000104);

  if TblCommORD_DETAIL_ID.AsLargeInt = 0 then
    TblCommORD_DETAIL_ID.AsLargeInt := tblOrd_detailID.AsLargeInt;

//  with TFDTable(DataSet) do
//    if MasterSource <> nil then
//      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
//         // 'Parent record not found.  Cannot post.'
//         raise Exception.Create(oe_rscstr.cTXT0000104);

  AComm := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ORD_DETAIL_COMMISSIONS where ' +
                     'ORD_DETAIL_ID = %f and id <> %f',
                     [tblOrd_detail.FieldByName('ID').asFloat,
                      TblComm.FieldByName('ID').asFloat]) +
                      TblComm.FieldByName('COMMISSION_PERCENT').asFloat;
  if AComm > 100 then
     // 'The total commission is greater than 100%.  Cannot post.'
    raise exception.Create(oe_rscstr.cTXT0000105);
  IQAssignIDBeforePost(DataSet); {in IQlib}
  if SelectValueFmtAsFloat('select count(id) from ORD_DETAIL_COMMISSIONS where ORD_DETAIL_ID = %f', [tblOrd_detail.FieldByName('ID').asFloat]) <> 0 then
  begin
    if TblCommCOMMISSION_PERCENT.asFloat <> SelectValueFmtAsFloat('select COMMISSION_PERCENT from ORD_DETAIL_COMMISSIONS where id = %f', [TblCommID.asFloat]) then
    begin
      FAmountChanged := false;
      FPercentChangedId := TblCommID.asFloat;
      FPercentChanged := true;
    end;

    if TblCommAMOUNT.asFloat <> SelectValueFmtAsFloat('select amount from ORD_DETAIL_COMMISSIONS where id = %f', [TblCommID.asFloat]) then
    begin
      FAmountChanged := true;
      FAmountChangedId := TblCommID.asFloat;
      FPercentChanged := false;
    end;
  end;
end;

procedure TOE_DM.TblCommNewRecord(DataSet: TDataSet);
begin
  TblCommID.AsLargeInt := GetNextID('ORD_DETAIL_COMMISSIONS');
  TblCommORD_DETAIL_ID.AsLargeInt := tblOrd_detailID.AsLargeInt;
end;

procedure TOE_DM.TblCommBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TOE_DM.TblCommAfterPost(DataSet: TDataSet);
begin
  // Tblord_detail.refresh;  May-00-24 Taken out to speed up adding line items. User MUST hit refresh button
end;

procedure TOE_DM.TblOrdersBeforeScroll(DataSet: TDataSet);
begin
  CheckIncrementVer( DataSet.FieldByName('ID').asFloat );
  if not CheckTaxCalculated(TblOrdersEPLANT_ID.AsFloat, TblOrdersID.AsFloat) then
    Abort;
end;

procedure TOE_DM.TblOrdersAfterScroll(DataSet: TDataSet);
begin
  FOrderChanged:= FALSE;
  FNewOrder    := FALSE;
//  if not TFrmMainOrder(Owner).Enablequick1.Checked then
//    TFrmMainOrder(Owner).Check_If_PackSlip_Exists;

  //TFrmMainOrder(Owner).MakeICTFilterVisible( TblOrdersIs_Intercomp.asString = 'Y' );
  QrySOContact.Close;
  QrySOContact.Open;
  QrySOContact.Locate('ID', TblOrdersCONTACT_ID2.asFloat, []);
  ReOpen(QryBillTo);
  //TFrmMainOrder(Owner).ResetCustDiscountLabels;
  // 05/05/2016 (Byron, EIQ-11465) Initialize the "Delivery Date" value,
  // which is used later for evaluation.  But set the Boolean flag to False.
  FDeliveryDate := TblOrdersORD_LINE_DATE.AsDateTime;
  FDeliveryDateChanged := False;

//  if TFrmMainOrder(Owner).pgctrlDetails.ActivePage = TFrmMainOrder(Owner).TabNormalDataEntry then
//    TFrmMainOrder(Owner).Check_sbBogo(tblOrd_detailID.asFloat)
//  else
//    TFrmMainOrder(Owner).Check_sbBogo(QryQuickOEID.asFloat);
end;  

procedure TOE_DM.TblOrdersARCUSTO_IDChange(Sender: TField);
begin
  FArcusto_Id_Changed := TRUE;
  if (TblOrders.State in [dsEdit, dsInsert]) and
    (SelectValueFmtAsInteger(
    'SELECT 1 FROM contact WHERE arcusto_id = %d and id = %d',
    [TblOrdersARCUSTO_ID.AsLargeInt, TblOrdersCONTACT_ID.AsLargeInt]) = 0) then
    TblOrdersCONTACT_ID.Clear;
end;

procedure TOE_DM.CheckIncrementVer( AOrders_ID: Real );
begin
end;

function TOE_DM.CheckTaxCalculated( AEplant_ID, AOrders_ID: Real ): Boolean;
begin
  Result:= TRUE;
end;

//procedure TOE_DM.UpdateOE_Control( AOrders_ID: Real );
//begin
//  ExecuteCommandFmt( 'update orders set oe_control = ''%s'' where id = %f',
//              [ Format( '%s %s', [ SecurityManager.UserName, DateTimeToStr(Now) ]), AOrders_ID ]);
//end;

procedure TOE_DM.PkShipToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', TblOrdersARCUSTO_ID.AsLargeInt);
end;

procedure TOE_DM.QryReleasesBeforeDelete(DataSet: TDataSet);
begin
  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
  // Releases navigator.
  CheckCashInAdvanceDeleteRelease;
  CheckPhantomReleaseChild( DataSet );

  if (QryReleases.FieldByName('LeftToShip').AsFloat = 0) then
  begin
     raise Exception.Create(oe_rscstr.cTXT0000068);
  end
  else if (QryReleases.FieldByName('LeftToShip').AsFloat <> 0) and (QryReleases.FieldByName('LeftToShip').AsFloat < QryReleases.FieldByName('quan').AsFloat) then
  begin
     raise Exception.Create(oe_rscstr.cTXT0000120);
  end;

  FCheckManuallyGeneratedWorkOrders:= TRUE;

  FReleasesPostingState:= psDelete;
  FDeletedReleases_ID:= QryReleases.FieldByName('id').asFloat;

  // Should I put this check?
  // CheckOrdScheduled( TblOrdersID.asFloat, TblOrd_DetailID.asFloat );
end;

procedure TOE_DM.RebuildReleasesSeq( AOrd_Detail_ID: Real; AIsPhantom: string );
begin
  ExecuteCommandFmt( 'begin     '+
             '  oe_misc.RebuildReleasesSeq( %f, ''%s'');  '+
             'end; ', [ AOrd_Detail_ID, AIsPhantom ]);
end;

procedure TOE_DM.TblArInvtLookUpBeforeOpen(DataSet: TDataSet);
begin
   AssignEPlantFilter(DataSet);
   with DataSet do
   begin
     if Filter > '' then
        Filter:= Format('(%s) and (NON_SALABLE = NULL or NON_SALABLE = ''N'')', [ Filter ])
     else
        Filter:= '(NON_SALABLE = NULL or NON_SALABLE = ''N'')';
   end;
end;

procedure TOE_DM.QryShipToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', TblOrdersARCUSTO_ID.AsLargeInt);

  if DataSet.Filter = '' then
    DataSet.Filter := 'PK_HIDE=''N'''
  else
    DataSet.Filter := DataSet.Filter + ' AND PK_HIDE=''N''';

end;

procedure TOE_DM.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet )
end;

procedure TOE_DM.PkOrdDetailBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'orders_id', TblOrdersID.AsLargeInt);
//  if (TblOrdersIs_Intercomp.asString = 'Y') then
//    AssignQueryParamValue(DataSet, 'ICTShipFromFilter', TFrmMainOrder(self.Owner).ICTShipFromFilter)
//  else
    AssignQueryParamValue(DataSet, 'ICTShipFromFilter', 0);

//  if TFrmMainOrder(self.Owner).sbtnHideDetail.Down then
//     AssignQueryParamValue(DataSet, 'hide', 'Y')
//  else
     AssignQueryParamValue(DataSet, 'hide', 'N')
end;

procedure TOE_DM.tblOrd_detailBeforeInsert(DataSet: TDataSet);
begin
  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
  // Order Detail navigator.
  CheckCashInAdvance;
  TblOrd_DetailARINVT_ID.ReadOnly:= FALSE;
  TblOrd_DetailUNIT.ReadOnly     := FALSE;
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  FBlanketQty:= 0;
  FDetailIsHidden:= FALSE;
  FUnitPriceChanged := FALSE;
  FTotalQtyChanged := FALSE;
end;

procedure TOE_DM.RebuildReleasesList( AOrd_Detail_ID: Real );
var
  ACum_Quan: Real;
begin
  if not Assigned(FReleasesList) then EXIT;

  {Clear List}
  ClearList( FReleasesList );

  {Rebuild the FReleasesList}
  ACum_Quan:= 0;
  with TFDQuery.Create(NIL) do
  try
    Connection:= UniMainModule.FDConnection1;
    SQL.Add(         'select id, quan, seq, promise_date, ship_date from releases ');
    SQL.Add(Format(' where ord_detail_id = %.0f', [ AOrd_Detail_ID ]));
    SQL.Add(         ' order by promise_date, id');
    Open;
    while not Eof do
    begin
      {running cumulative}
      ACum_Quan:= ACum_Quan + FieldByName('quan').asFloat;
      FReleasesList.Add( TReleaseCargo.Create( FieldByName('id').asFloat,
                                               FieldByName('quan').asFloat,
                                               ACum_Quan,
                                               FieldByName('seq').asFloat,
                                               FieldByName('promise_date').asDateTime,
                                               FieldByName('ship_date').asDateTime ));
      Next;
    end;
  finally
    Free; // free TFDQuery
  end;
  FCurrentOrdDetailID:= AOrd_Detail_ID;

  {Update display}
//  TFrmMainOrder(Owner).edTotRel.Text:= FormatFloat(' ###,###,##0.##', GetReleasesQuanTotal( AOrd_Detail_ID ));
  if Assigned(OnRebuildRelesesList) then
     OnRebuildRelesesList( self );
end;

procedure TOE_DM.CheckOrdDetailChanged( AOrd_Detail_ID: Real );
begin
  if FCurrentOrdDetailID <> AOrd_Detail_ID then
     RebuildReleasesList( AOrd_Detail_ID );
end;

function TOE_DM.GetRebateParamsID(const AAKA_ID, AArinvtID: Int64;
  var ARebateParamsID: Int64): Boolean;
begin
  // Initialize to 0 because of the "if" statements below.
  ARebateParamsID := 0;

  if AAKA_ID > 0 then
    ARebateParamsID := SelectValueFmtAsInt64(
      'SELECT rebate_params_id FROM aka where id = %d',
      [AAKA_ID]);

  if (ARebateParamsID = 0) and (AArinvtID > 0) then
    ARebateParamsID := SelectValueFmtAsInt64(
      'SELECT rebate_params_id FROM arinvt where id = %d',
      [AArinvtID]);

  if (ARebateParamsID = 0) and (TblOrdersSHIP_TO_ID.AsLargeInt > 0) then
    ARebateParamsID := SelectValueFmtAsInt64(
    'SELECT rebate_params_id FROM ship_to WHERE id = %d',
    [TblOrdersSHIP_TO_ID.AsLargeInt]);

  if (ARebateParamsID = 0) and (TblOrdersARCUSTO_ID.AsLargeInt > 0) then
    ARebateParamsID := SelectValueFmtAsInt64(
    'SELECT rebate_params_id FROM arcusto WHERE id = %d',
    [TblOrdersARCUSTO_ID.AsLargeInt]);

  Result := ARebateParamsID > 0;
end;

function TOE_DM.GetReleasesCumQuan( AReleases_ID, AOrd_Detail_ID: Real): Real;
var
  I: Integer;
begin
  CheckOrdDetailChanged( AOrd_Detail_ID );

  if Assigned(FReleasesList) then
     for I:= 0 to FReleasesList.Count - 1 do with TReleaseCargo(FReleasesList.Items[ I ]) do
       if ID = AReleases_ID then
       begin
          Result:= Cum_Quan;
          EXIT;
       end;
  Result:= 0;
end;

function TOE_DM.GetReleasesQuanTotal( AOrd_Detail_ID: Real ): Real;
begin
  CheckOrdDetailChanged( AOrd_Detail_ID );

  Result:= 0;
  if Assigned(FReleasesList) then
     if FReleasesList.Count > 0 then with FReleasesList do
        Result:= TReleaseCargo(Items[Count - 1]).Cum_Quan;
end;

function TOE_DM.GetSelectedOrdDetailID: Int64;
begin
//  if TFrmMainOrder(Owner).QuickOrderEntryNoReleases1.Checked then
//    Result := QryQuickOEID.AsLargeInt
//  else
    Result := tblOrd_detailID.AsLargeInt;
end;

class procedure TOE_DM.GetSetCustomerStatusID(AArcustoID : Real;
var AStatus_ID : string);
var
  aDataType : string;
begin
  aDataType:= SelectValueAsString('select data_type from all_tab_columns '+
                                  'where upper(trim(table_name)) = ''ARCUSTO'' '+
                                  '  and upper(trim(column_name)) = ''STATUS_ID''');

  with TFDStoredProc.Create(nil) do
  try
//    Connection:= db_dm.FDConnection;
    StoredProcName := 'IQMS.OE_MISC.GET_SET_CUSTOMER_STATUS';
    Params.CreateParam(ftInteger, 'p_arcusto_id', ptInput).asBCD
      := Trunc(AArcustoID);
    if CompareText(aDataType, 'CHAR') = 0 then
    begin
      Params.CreateParam(ftFixedChar, 'p_status_id', ptInput).AsFixedChar
        := Trim(AStatus_ID);
      Prepare;
      Execute;
      //assign param to pStatus_ID
      AStatus_ID:= Trim(ParamByName('p_status_id').AsFixedChar);
    end
    else if CompareText(aDataType, 'VARCHAR2') = 0 then
    begin
      Params.CreateParam(ftString, 'p_status_id', ptInput).AsString
        := AStatus_ID;
      Prepare;
      Execute;
      //assign param to pStatus_ID
      AStatus_ID:= ParamByName('p_status_id').asString;
    end;
  finally
    Free;
  end;
end;

function TOE_DM.GetReleasesQuanSum( AOrd_Detail_ID, ASeq: Real; APromise_Date: TDateTime; AShipDateContent: TShipDateContent ): Real;
begin
  Result:= 0;
end;

procedure TOE_DM.PkAcctBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TOE_DM.QryBillToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', TblOrdersARCUSTO_ID.AsLargeInt);
end;

procedure TOE_DM.tblCurrencyBeforeOpen(DataSet: TDataSet);
begin
  IQAssignNativeCurrencyFilter(DataSet);
end;

procedure TOE_DM.QryCurrencyBeforeOpen(DataSet: TDataSet);
begin
  IQAssignNativeCurrencyFilter(DataSet);
end;


procedure TOE_DM.RecalcOrderReleasesMustShipDate;
begin
  ExecuteCommandFmt('begin oe_msd.do_update_order( %f ); end;', [ TblOrdersID.asFloat ]);
end;

procedure TOE_DM.PkMakeToOrderLocationBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id',
    tblOrd_detailARINVT_ID.AsLargeInt);
end;

procedure TOE_DM.AssignCalculatedFieldsArinvt( AArinvt_ID: Real );
var
  A: Variant;
begin
  if AArinvt_ID > 0 then
  begin
    A:= SelectValueArrayFmt( 'select itemno, class, rev, unit, descrip, descrip2, phantom, phantom_components_on_so from arinvt where id = %f', [ AArinvt_ID ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblOrd_DetailLookupItemNumber.asString:= A[ 0 ];
      TblOrd_DetailArinvtClass.asString     := A[ 1 ];
      TblOrd_DetailArinvtRev.asString       := A[ 2 ];
      TblOrd_DetailArinvt_Unit.asString     := A[ 3 ];
      TblOrd_DetailDescription.asString     := A[ 4 ];
      TblOrd_DetailDescription2.asString    := A[ 5 ];
      TblOrd_DetailPhantom.asString         := A[ 6 ];
      TblOrd_DetailIncludePhantomComponents.AsString:= A[ 7 ];
    end;
  end;

  if (TblOrd_DetailARINVT_ID.asString = '') then
     begin
       TblOrd_DetailDisp_Descript.Value := TblOrd_DetailMISC_ITEM.Value;
       if TblOrd_DetailMISC_ITEM.Value > '' then
       begin
         TblOrd_DetailItemNumber.Value    := TblOrd_DetailMISC_ITEMNO.AsString; // oe_rscstr.cTXT0000106; // 'Misc. Item'
         {this field is not surfaced - created so we can call FreeForm shared with PO form}
         // TblOrd_DetailMisc_ItemNo.asString:= TblOrd_DetailMISC_ITEMNO.AsString; // oe_rscstr.cTXT0000106; // 'Misc. Item'
       end;
     end
  else
    begin
      TblOrd_DetailDisp_Descript.Value := TblOrd_DetailDESCRIPTION.Value;
      TblOrd_DetailItemNumber.Value    := TblOrd_DetailLookupItemNumber.Value;
    end;

  if TblORd_DetailPHANTOM_ORD_DETAIL_ID.asFloat > 0 then
  begin
    TblOrd_DetailItemNumber.asString   := oe_misc.format_phantom_child_display( TblOrd_DetailItemNumber.asString );
    TblOrd_DetailDisp_Descript.asString:= oe_misc.format_phantom_child_display( TblOrd_DetailDisp_Descript.asString );
  end;

//  if TFrmMainOrder(Owner).IsChildBOGOItem(TblORd_DetailID.asFloat) then
//  begin
//    TblOrd_DetailItemNumber.asString   := oe_misc.format_phantom_child_display( TblOrd_DetailItemNumber.asString );
//    TblOrd_DetailDisp_Descript.asString:= oe_misc.format_phantom_child_display( TblOrd_DetailDisp_Descript.asString );
//  end;
  
end;

function TOE_DM.CanEditMustStart: Boolean;
begin
//  Result:= (Owner <> nil) and (Owner is TFrmMainOrder)
//           and
//          (QryReleasesLOCK_MUST_SHIP_DATE.asString <> 'Y');
end;

procedure TOE_DM.QryReleasesLOCK_MUST_SHIP_DATEChange(Sender: TField);
begin
  QryReleasesMUST_SHIP_DATE.ReadOnly:= not CanEditMustStart;
end;

procedure TOE_DM.QryReleasesAfterInsert(DataSet: TDataSet);
begin
  QryReleasesMUST_SHIP_DATE.ReadOnly:= false;
end;

procedure TOE_DM.PkICTShipFromBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'orders_id', TblOrdersID.asFloat);
end;

procedure TOE_DM.tblOrd_detailFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
//  if (TblOrdersIs_Intercomp.asString = 'Y') and (TFrmMainOrder(Owner).ICTShipFromFilter > 0) then
//  begin
//    Accept:= TblOrd_detailSHIP_TO_ID_FROM.asFloat = TFrmMainOrder(Owner).ICTShipFromFilter;
//  end;
//
//  if Assigned( Owner ) and Assigned( TFrmMainOrder( Owner ).sbtnHideDetail ) then
//     Accept:= Accept
//              and
//              (not TFrmMainOrder(Owner).sbtnHideDetail.Down or (TblOrd_detailHIDE.asString <> 'Y'));
end;

class procedure TOE_DM.CheckOrderForPickTicket( AOrders_ID: Real );
begin
end;

class procedure TOE_DM.CheckMTOOnWorkorder( AOrders_ID: Real );
begin
end;


procedure TOE_DM.CheckPickTicketAssigned;
begin
end;

procedure TOE_DM.CommitUpdates(DataSet: TDataSet);
var
  ALotCharge, AId:Real;
begin
  IQApplyUpdateToTable(DataSet);
  FOrderChanged:= TRUE;

//  if not FQuickDeleting then
//    if not TFrmMainOrder(Owner).sbMisc.Down then
//      AssignDefaultCommissQuick;

  {sync phantom components to the parent ord_detail}
  case FPostingState of
    psInsert,
    psEdit  : if QryQuickOEPhantom.asString = 'Y' then
                 SyncPhantomOrderDetailComponents( QryQuickOe );
    psDelete: if FIsDeletedOrdDetailPhantom then
                 DeletePhantomOrderDetailComponents( FDeletedOrd_Detail_ID, QryQuickOe );
  end;

  if (FPostingState <> psDelete) and (TblOrdersEDI_CHANGE_DATE.asDateTime = 0) and (QryQuickOEPROMISE_DATE.asDateTime <> FQuickPromiseDate) then
     CheckLeadDays( QryQuickOERELEASES_ID.asFloat );

  FIsDeletedOrdDetailPhantom:= FALSE;
  FDeletedOrd_Detail_ID:= 0;

  FQuickDeleting := false;

  FPostingState:= psNone;
  FUnitPriceChangeAccepted:= FALSE;

  if FCheckManuallyGeneratedWorkOrders then
     CheckManuallyGeneratedWorkOrders(  TblOrd_DetailID.asFloat );

  ReopenQuery( QryOrdTotalQuick );

end;

procedure TOE_DM.QryQuickOEAfterPost(DataSet: TDataSet);
begin
  CommitUpdates(DataSet);

  // 02/17/2016 (EIQ-9347, Byron) Set the flag
  if FTotalQtyChanged then
    CheckSetPhantomOrderDetailModified(DataSet);
//  TFrmMainOrder(Owner).Assign_BOGO_Item(QryQuickOEID.asFloat, QryQuickOE);
end;

procedure TOE_DM.QryQuickOEBeforePost(DataSet: TDataSet);
var
  // ATaxID:Real;
  ARebate_Params_id: Int64;
  AMultiplesOf, AMinSellQty, ASuggestedQty:Real;
begin
//  // Initialize
//  if (QryQuickOE.State in [dsEdit]) and (TFrmMainOrder(Owner).IsChildBOGOItem(QryQuickOEID.asFloat)) then
//    raise exception.Create(oe_rscstr.cTXT0000184);
//
//
//  ASuggestedQty := 0;
//  AMultiplesOf := 0;
//  AMinSellQty := 0;
//  CheckCashInAdvanceReleasesQuickEntry;
//
//  if (QryQuickOEARINVT_ID.AsLargeInt = 0) and
//    (QryQuickOEMISC_ITEM.AsString = '') then
//    begin
//      if TFrmMainOrder(Owner).sbMisc.Down then
//        // oe_rscstr.cTXT0000091 = 'Please enter an item description.';
//        raise Exception.Create(oe_rscstr.cTXT0000091)
//      else
//        // oe_rscstr.cTXT0000162 = 'Please select an Inventory item.';
//        raise Exception.Create(oe_rscstr.cTXT0000162);
//    end;
//
//  CheckReleaseDates( DataSet, FQuickPromiseDate, FQuickPromiseDate );
//  CheckIfMTOAllowed(QryQuickOE);
//  // CheckAssignMTO2( QryQuickOEARINVT_ID.asFloat );
//
//  if QryQuickOEID.asFloat = 0 then
//     QryQuickOEID.asFloat:= GetNextID('ord_detail');
//
//  if QryQuickOERELEASES_ID.asFloat = 0 then
//     QryQuickOERELEASES_ID.asFloat:= GetNextID('releases');
//
//  QryQuickOeQUAN.asFloat:= QryQuickOeTOTAL_QTY_ORD.asFloat;
//
//  if QryQuickOeORIG_QUAN.asFloat = 0 then
//     QryQuickOeORIG_QUAN.asFloat:= QryQuickOeQUAN.asFloat;
//
//  // 08/15/2014 (Byron, EIQ-3959 SER# 05609) Check the "Minimum Sell Quantity".
//
//  // Compare values and get the expected release quantity
//  if AMultiplesOf > 0 then
//    begin
//      if AMinSellQty < AMultiplesOf then
//        ASuggestedQty := AMultiplesOf
//      else
//        ASuggestedQty := ceil( AMinSellQty / AMultiplesOf ) * AMultiplesOf;
//    end
//  else if (AMinSellQty > 0) then
//    ASuggestedQty := AMinSellQty;
//
//   // If current release qty is less than the expected release quantity, then
//   // prompt user to replace the qty with the MIN_SELL_QTY value.
//
//  if TblOrdersEDI_CHANGE_DATE.AsDateTime <> 0 then
//    QryQuickOEINTERNAL_UPDATE_TYPE.asString := 'EDI';
//
//  // 07/19/2016 (Byron, EIQ-13175) Remmed the lines that update the tax code here,
//  // and moved these to CheckAssignTaxCodeID() which is called in OnNewRecord.
//  // Tas Code should only be assigned during insert of a new record, not at every
//  // change to the data; otherwise, the TAX_CODE_ID can never be cleared.
//{
//  if SelectValueFmtAsString('select NVL(nontaxable, ''N'') from arinvt where id = %d',
//    [QryQuickOEARINVT_ID.AsLargeInt]) = 'Y' then
//    QryQuickOETAX_CODE_ID.Clear
//  else
//    begin
//      ATaxID:= SelectValueFmtAsFloat('select tax_code_id from ship_to where id = %f', [ TblOrdersSHIP_TO_ID.asFloat ]);
//      if ATaxID >= 1 then
//        AssignFieldValue( QryQuickOETAX_CODE_ID, ATaxID );
//    end;
//}
//  if (QryQuickOEREBATE_PARAMS_ID.AsLargeInt = 0) and
//    (QryQuickOEARINVT_ID.AsLargeInt > 0) and
//    GetRebateParamsID(0, QryQuickOEARINVT_ID.AsLargeInt, {var} ARebate_Params_id) then
//    QryQuickOE.FieldByName('REBATE_PARAMS_ID').AsLargeInt := ARebate_Params_id;
//
//  case DataSet.State of
//    dsInsert: FPostingState:= psInsert;
//    dsEdit  : FPostingState:= psEdit;
//  else
//    FPostingState:= psNone;
//  end;
//
//  FCheckManuallyGeneratedWorkOrders:= (FPostingState = psEdit)
//                                      and
//                                      ((QryQuickOeQUAN.asFloat <> FQuickQty) or (QryQuickOEPROMISE_DATE.asDateTime <> FQuickPromiseDate));
//
//  CheckDropShipChanged( QryQuickOe );
//  CheckCreditLimitQ;

end;


procedure TOE_DM.QryQuickOEBeforeEdit(DataSet: TDataSet);
begin
//  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
//
//  CheckCashInAdvance;
//  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
//
//  CheckCanModifyPhantomOrderDetailChild( DataSet );
//
//  FQuickQty        := QryQuickOeQUAN.asFloat;
//  FQuickPromiseDate:= QryQuickOEPROMISE_DATE.asDateTime;;
end;

procedure TOE_DM.QryQuickOEBeforeInsert(DataSet: TDataSet);
begin
//  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
//  // Quick Order Detail navigator.
//
//  CheckCashInAdvance;
//  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
//
//  CheckCanModifyPhantomOrderDetailChild( DataSet );
//
//  FQuickQty        := 0;
//  FQuickPromiseDate:= 0;
end;

procedure TOE_DM.QryQuickOENewRecord(DataSet: TDataSet);
var
  SalesPeopleId: Real;
begin
//  TblOrd_detailNewRecord( DataSet );
//
//  QryQuickOEORDERS_ID.asFloat:= TblOrdersID.asFloat;
//
//  if TblOrdersORD_LINE_DATE.asDateTime = 0 then
//     QryQuickOEPROMISE_DATE.asDateTime:= Date
//  else
//     QryQuickOEPROMISE_DATE.asDateTime:= TblOrdersORD_LINE_DATE.asDateTime;
//
//
//    SalesPeopleId := SelectValueFmtAsFloat('select salespeople_id from arcusto where id = %f', [TblOrders.FieldByName('arcusto_id').asFloat]);
//    if SalesPeopleId <> 0 then
//      AssignFieldValue( QryQuickOESALESPEOPLE_ID, SalesPeopleId );
end;


procedure TOE_DM.QryQuickOEUNIT_PRICEChange(Sender: TField);
begin
  FUnitPriceChanged := True;
end;

procedure TOE_DM.QryQuickOEUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
//  case ARequest of
//    arInsert:
//       begin
//         ExecuteCommandFmt(
//           'insert into ord_detail  '+
//           '     ( glacct_id, misc_item, id, orders_id, arinvt_id, ord_det_seqno, total_qty_ord, unit_price, unit, eplant_id, discount, uom_factor, '+
//           '       list_unit_price, price_per_1000, is_make_to_order, cost_object_id, cost_object_source, tax_code_id, salespeople_id, '+
//           '       rebate_params_id, aka_kind, comment1, po_info, cuser1, is_drop_ship, misc_Itemno ,division_id, c_po_misc_id) '+
//           'values                  '+
//           '     ( decode(%f, 0, null, %f), ' + //glacct_id
//           '       ''%s'',              '+  // id
//           '       %f,              '+  // id
//           '       %f,              '+  // orders_id
//           '       decode(%f, 0, null, %f), '+  // arinvt_id
//           '       %f,              '+  // ord_det_seqno
//           '       %.6f,            '+  // total_qty_ord
//           '       %.7f,            '+  // unit_price
//           '       ''%s'',          '+  // unit
//           '       %s,              '+  // eplant_id
//           '       %.6f,            '+  // discount
//           '       %.6f,            '+  // uom_factor
//           '       %.7f,            '+  // list_unit_price
//           '       %.6f,            '+  // price_per_1000
//           '       ''%s'',          '+
//           '       decode(%f, 0, null, %f), '+  // cost_object_id
//           '       ''%s'',          '+  // cost_object_source
//           '       decode(%f, 0, null, %f), '+  // tax_code_id
//           '       decode(%f, 0, null, %f), '+  // salespeople_id
//           '       decode(%f, 0, null, %f), '+  // rebate_params_id
//           '       ''%s'',          '+          // aka_kind
//            '       ''%s'',         '+          // comment1,
//            '       ''%s'',         '+          // po_info,
//            '       ''%s'',         '+          // cuser1,
//            '       ''%s'',         '+          // is_drop_ship
//            '       ''%s'',         '+          // misc_itemno
//            '       %s,             '+          // division_id
//           '        %s)             ',          // c_po_misc_id
//           [ASender.FieldByName('glacct_id').asFloat,
//            ASender.FieldByName('glacct_id').asFloat,
//            StrTran(ASender.FieldByName('misc_item').asString, '''', ''''''),
//            ASender.FieldByName('id').asFloat,
//            ASender.FieldByName('orders_id').asFloat,
//            ASender.FieldByName('arinvt_id').asFloat,
//            ASender.FieldByName('arinvt_id').asFloat,
//            ASender.FieldByName('ord_det_seqno').asFloat,
//            ASender.FieldByName('total_qty_ord').asFloat,
//            ASender.FieldByName('unit_price').asFloat,
//            ASender.FieldByName('unit').asString,
//            IQFieldAsStr( ASender.FieldByName('eplant_id'), 'NULL' ),
//            TblOrdersDISCOUNT.asFloat,
////            DataSet.FieldByName('discount').asFloat,
//            ASender.FieldByName('uom_factor').asFloat,
//            ASender.FieldByName('list_unit_price').asFloat,
//            ASender.FieldByName('price_per_1000').asFloat,
//            ASender.FieldByName('is_make_to_order').asString,
//            ASender.FieldByName('cost_object_id').asFloat,
//            ASender.FieldByName('cost_object_id').asFloat,
//            ASender.FieldByName('cost_object_source').asString,
//            ASender.FieldByName('tax_code_id').asFloat,
//            ASender.FieldByName('tax_code_id').asFloat,
//            ASender.FieldByName('SALESPEOPLE_ID').asFloat,
//            ASender.FieldByName('SALESPEOPLE_ID').asFloat,
//            ASender.FieldByName('REBATE_PARAMS_ID').asFloat,
//            ASender.FieldByName('REBATE_PARAMS_ID').asFloat,
//            ASender.FieldByName('aka_kind').asString,
//            StrTran(ASender.FieldByName('comment1').asString, '''', ''''''),
//            StrTran(ASender.FieldByName('po_info').asString, '''', ''''''),
//            StrTran(ASender.FieldByName('cuser1').asString, '''', ''''''),
//            ASender.FieldByName('is_drop_ship').asString,
//            StrTran(ASender.FieldByName('misc_itemno').asString, '''', ''''''),
//            FloatToStr0asNull( ASender.FieldByName('division_id').asFloat, 'NULL'),
//            FloatToStr0asNull( ASender.FieldByName('c_po_misc_id').asFloat, 'NULL') ]);
//
//         ExecuteCommandFmt(
//           'insert into releases    '+
//           '     ( id, ord_detail_id, seq, quan, promise_date, request_date, unit_price, orig_quan, internal_update_type ) '+
//           'values                  '+
//           '     ( %f,              '+  // id
//           '       %f,              '+  // ord_detal_id
//           '       %d,              '+  // seq
//           '       %.6f,            '+  // quan
//           '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+ // promise_date
//           '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+ // request_date
//           '       %.6f,            '+  // unit_price
//           '       %.6f,            '+  // orig_quan
//           '       ''%s'' )         ',  // internal_update_type
//           [ASender.FieldByName('releases_id').asFloat,
//            ASender.FieldByName('id').asFloat,
//            1,
//            ASender.FieldByName('quan').asFloat,
//            FormatDateTime('mm/dd/yyyy hh:nn:ss', ASender.FieldByName('promise_date').asDateTime),
//            FormatDateTime('mm/dd/yyyy hh:nn:ss', ASender.FieldByName('promise_date').asDateTime),
//            ASender.FieldByName('unit_price').asFloat,
//            ASender.FieldByName('orig_quan').asFloat,
//            ASender.FieldByName('internal_update_type').asString ]);
//       end;
//
//    arUpdate:
//       begin
//         ExecuteCommandFmt(
//           'update ord_detail                '+
//           '   set arinvt_id       = decode(%f, 0, null, %f), '+
//           '       glacct_id       = decode(%f, 0, null, %f), '+
//           '       misc_item       = ''%s'', '+
//           '       ord_det_seqno   = %f,     '+
//           '       total_qty_ord   = %f,     '+
//           '       unit_price      = %.7f,   '+
//           '       unit            = ''%s'', '+
//           '       discount        = %.6f,   '+
//           '       uom_factor      = %.6f,   '+
//           '       list_unit_price = %.7f,   '+
//           '       price_per_1000  = %.6f,   '+
//           '       is_make_to_order= ''%s'', '+
//           '       cost_object_id  = decode(%f, 0, null, %f), ' +
//           '       eplant_id  = decode(%f, 0, null, %f), ' +
//           '       cost_object_source = ''%s'', ' +
//           '       standard_id = %s,  '+
//           '       division_id = %s,  '+
//           '       aka_kind = ''%s'', '+
//           '       comment1 = ''%s'', '+
//           '       po_info = ''%s'', '+
//           '       cuser1 = ''%s'', '+
//           '       misc_itemno = ''%s'', '+
//           '       is_drop_ship = ''%s'', '+
//           '       c_po_misc_id = %s, '+
//           '       tax_code_id = %s '+
//           ' where id = %f               ',
//           [ASender.FieldByName('arinvt_id').asFloat,
//            ASender.FieldByName('arinvt_id').asFloat,
//            ASender.FieldByName('glacct_id').asFloat,
//            ASender.FieldByName('glacct_id').asFloat,
//            StrTran(ASender.FieldByName('misc_item').asString, '''', ''''''),
//            ASender.FieldByName('ord_det_seqno').asFloat,
//            ASender.FieldByName('total_qty_ord').asFloat,
//            ASender.FieldByName('unit_price').asFloat,
//            ASender.FieldByName('unit').asString,
//            ASender.FieldByName('discount').asFloat,
//            ASender.FieldByName('uom_factor').asFloat,
//            ASender.FieldByName('list_unit_price').asFloat,
//            ASender.FieldByName('price_per_1000').asFloat,
//            ASender.FieldByName('is_make_to_order').asString,
//            ASender.FieldByName('cost_object_id').asFloat,
//            ASender.FieldByName('cost_object_id').asFloat,
//            ASender.FieldByName('eplant_id').asFloat,
//            ASender.FieldByName('eplant_id').asFloat,
//            ASender.FieldByName('cost_object_source').asString,
//            FloatToStr0asNull( ASender.FieldByName('standard_id').asFloat, 'NULL'),
//            FloatToStr0asNull( ASender.FieldByName('division_id').asFloat, 'NULL'),
//            ASender.FieldByName('aka_kind').asString,
//            StrTran(ASender.FieldByName('comment1').asString, '''', ''''''),
//            StrTran(ASender.FieldByName('po_info').asString, '''', ''''''),
//            StrTran(ASender.FieldByName('cuser1').asString, '''', ''''''),
//            StrTran(ASender.FieldByName('misc_itemno').asString, '''', ''''''),
//            ASender.FieldByName('is_drop_ship').asString,
//            FloatToStr0asNull( ASender.FieldByName('c_po_misc_id').asFloat, 'NULL'),
//            FloatToStr0asNull( ASender.FieldByName('tax_code_id').AsLargeInt, 'NULL'),
//            ASender.FieldByName('id').asFloat ]);
//
//         ExecuteCommandFmt(
//           'update releases                      '+
//           '   set seq                  = %d,    '+
//           '       quan                 = %.6f,  '+
//           '       promise_date         = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+ // promise_date
//           '       request_date         = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+ // request_date
//           '       unit_price           = %.7f,  '+
//           '       internal_update_type = ''%s'' '+
//           ' where id = %f                       ',
//           [1,
//            ASender.FieldByName('quan').asFloat,
//            FormatDateTime('mm/dd/yyyy hh:nn:ss', ASender.FieldByName('promise_date').asDateTime),
//            FormatDateTime('mm/dd/yyyy hh:nn:ss', ASender.FieldByName('promise_date').asDateTime),
//            ASender.FieldByName('unit_price').asFloat,
//            ASender.FieldByName('internal_update_type').asString,
//            ASender.FieldByName('releases_id').asFloat ]);
//
//
//        if (SelectValueFmtAsFloat('select count(id) from releases where ord_detail_id = %f', [ASender.FieldByName('id').asFloat]) = 0)
//           and (ASender.FieldByName('promise_date').asDateTime <> 0) then
//         ExecuteCommandFmt(
//           'insert into releases    '+
//           '     ( id, ord_detail_id, seq, quan, promise_date, request_date, unit_price, orig_quan, internal_update_type ) '+
//           'values                  '+
//           '     ( %f,              '+  // id
//           '       %f,              '+  // ord_detal_id
//           '       %d,              '+  // seq
//           '       %.6f,            '+  // quan
//           '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+ // promise_date
//           '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+ // request_date
//           '       %.6f,            '+  // unit_price
//           '       %.6f,            '+  // orig_quan
//           '       ''%s'' )         ',  // internal_update_type
//           [ASender.FieldByName('releases_id').asFloat,
//            ASender.FieldByName('id').asFloat,
//            1,
//            ASender.FieldByName('quan').asFloat,
//            FormatDateTime('mm/dd/yyyy hh:nn:ss', ASender.FieldByName('promise_date').asDateTime),
//            FormatDateTime('mm/dd/yyyy hh:nn:ss', ASender.FieldByName('promise_date').asDateTime),
//            ASender.FieldByName('unit_price').asFloat,
//            ASender.FieldByName('orig_quan').asFloat,
//            ASender.FieldByName('internal_update_type').asString ]);
//       end;
//
//    arDelete:
//       begin
//       end;
//  end;

  AAction := eaApplied;
end;

procedure TOE_DM.QryQuickOECalcFields(DataSet: TDataSet);
var
  A: Variant;
  Aka: Variant;
begin
//
//  if QryQuickOEGLACCT_ID.asFloat <> 0 then
//    QryQuickOEACCT.asString := SelectValueFmtAsString('select acct from glacct where id = %f', [QryQuickOEGLACCT_ID.asFloat])
//  else
//    QryQuickOEACCT.Clear;
//
//  if DataSet.FieldByName('Arinvt_ID').asFloat  > 0 then
//  begin
//    A:= SelectValueArrayFmt( 'select unit, descrip, descrip2, class, rev, phantom, phantom_components_on_so from arinvt where id = %f', [ DataSet.FieldByName('Arinvt_ID').asFloat ]);
//    if VarArrayDimCount( A ) > 0 then
//    begin
//       QryQuickOEArinvt_Unit.asString:= A[ 0 ];
//       QryQuickOeDescrip.asString    := A[ 1 ];
//       QryQuickOeDescrip2.asString   := A[ 2 ];
//       QryQuickOeClass.asString      := A[ 3 ];
//       QryQuickOeRev.asString        := A[ 4 ];
//       QryQuickOEPhantom.asString    := A[ 5 ];
//       QryQuickOEIncludePhantomComponents.asString:= A[ 6 ];
//    end;
//  end;
//
//  if (QryQuickOEARINVT_ID.asString = '') then
//     begin
//       QryQuickOEDisp_Descript.Value := QryQuickOEMISC_ITEM.Value;
//       if QryQuickOEMISC_ITEM.Value > '' then
//       begin
//         QryQuickOEItemNumber.Value    := QryQuickOEMisc_ItemNo.AsString;
//
////         QryQuickOEItemNumber.Value    := TblOrd_DetailMISC_ITEMNO.AsString; // oe_rscstr.cTXT0000106; // 'Misc. Item'
//         {this field is not surfaced - created so we can call FreeForm shared with PO form}
//         // QryQuickOEMisc_ItemNo.asString:= TblOrd_DetailMISC_ITEMNO.AsString; // oe_rscstr.cTXT0000106; // 'Misc. Item'
//       end;
//     end
//  else
//    begin
//      QryQuickOEDisp_Descript.Value := QryQuickOeDescrip.Value;
//      QryQuickOEItemNumber.Value    := SelectValueFmtAsString('select itemno from arinvt where id = %f', [QryQuickOEARINVT_ID.asFloat]);
//    end;
//
//  if QryQuickOEPHANTOM_ORD_DETAIL_ID.asFloat > 0 then
//  begin
//    QryQuickOEItemNumber.asString   := oe_misc.format_phantom_child_display( QryQuickOEItemNumber.asString );
//    QryQuickOEDisp_Descript.asString:= oe_misc.format_phantom_child_display( QryQuickOEDisp_Descript.asString );
//  end;
//
//  if TFrmMainOrder(Owner).IsChildBOGOItem(QryQuickOEID.asFloat) then
//  begin
//    QryQuickOEItemNumber.asString   := oe_misc.format_phantom_child_display( QryQuickOEItemNumber.asString );
//    QryQuickOEDisp_Descript.asString:= oe_misc.format_phantom_child_display( QryQuickOEDisp_Descript.asString );
//  end;
//
//
//  Aka:= SelectValueArrayFmt( 'select cust_itemno, cust_descrip, cust_rev from aka where arinvt_id = %f and arcusto_id = %f ' +
//                      ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
//                       [QryQuickOEARINVT_ID.asFloat, TblOrders.FieldByName('ARCUSTO_ID').asFloat,
//                        TblOrders.FieldByName('ARCUSTO_ID').asFloat, TblOrders.FieldByName('SHIP_TO_ID').asFloat]);
//  if VarArrayDimCount( Aka ) > 0 then
//  begin
//    QryQuickOEAkaItemNo.asString := Aka[0];
//    QryQuickOEAkaDescrip.asString := Aka[1];
//  end
//  else
//  begin
//    QryQuickOEAkaItemNo.asString := '';
//    QryQuickOEAkaDescrip.asString := '';
//  end;
//
//  QryQuickOEBackLog.asFloat := GetReleasesQuanTotal( QryQuickOEID.asFloat ) - QryQuickOECumm_Shipped.Value;
//  QryQuickOENote.asString := QryQuickOEComment1.asString;
//
//  if QryQuickOeDIVISION_ID.asFloat > 0 then
//     QryQuickOEDivision.asString:= SelectValueByID('name', 'division', QryQuickOeDIVISION_ID.asFloat);
//
//  QryQuickOETax_Code.AsString := SelectValueFmtAsString(
//   'select tax_code from tax_codes where id = %d',
//   [QryQuickOETAX_CODE_ID.AsLargeInt]);
//
//  CheckCommissionsQuick;
end;

procedure TOE_DM.QryQuickOETOTAL_QTY_ORDChange(Sender: TField);
begin
  FUnitPriceChangeAccepted:= TRUE;
  FTotalQtyChanged := True;
  AssignUnitPriceEx( QryQuickOE );
end;

procedure TOE_DM.QryQuickOEARINVT_IDChange(Sender: TField);
var
  AUom:String;
begin
//  FArinvt_ID_Changed:= TRUE;
//
//  if Sender.DataSet.FieldByName('MISC_ITEM').asString <> '' then
//     EXIT;
//
//  AUom:= SelectValueFmtAsString( 'select uom from aka '+
//                        ' where arinvt_id = %f and arcusto_id = %f and nvl(kind, ''*'') = nvl(''%s'', ''*'') '+
//                        '   and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
//                       [ Sender.asFloat,
//                         TblOrders.FieldByName('ARCUSTO_ID').asFloat,
//                         QryQuickOe.FieldByName('AKA_KIND').asString,
//                         TblOrders.FieldByName('ARCUSTO_ID').asFloat,
//                         TblOrders.FieldByName('SHIP_TO_ID').asFloat]);
//  AUom:= '';
//  if TblOrdersIS_INTERCOMP.asString <> 'Y' then  // 02-15-2013 ICT orders should be always in native UOM
//    if AUom = '' then
//     AUom := SelectValueFmtAsString('select uom from arinvt_uom_conv where arinvt_id = %f and NVL(default_oe, ''N'') = ''Y''', [ Sender.asFloat ]);
//  if AUom = '' then
//     AUom := SelectValueByID( 'NVL(unit, ''EACH'')', 'arinvt', Sender.asFloat );
//  if  not (QryQuickOe.State in [ dsEdit, dsInsert ]) then
//    QryQuickOe.Edit;
//
//  IQMS.Common.DataLib.ForceValue(SrcQuickOE, QryQuickOeUNIT, AUom);
//
//  CheckAssignMTO2( QryQuickOEARINVT_ID.asFloat );
//
//  with Sender.DataSet do
//    IQMS.Common.DataLib.ForceValue(SrcQuickOE, FieldByName( 'uom_factor' ), FieldByName('unit').asString);
//
//  ShowItemInfo( Sender.asFloat, TblOrdersARCUSTO_ID.asFloat );
end;


procedure TOE_DM.QryQuickOEARINVT_IDSetText(Sender: TField; const Text: string);
//  function _IsValidInteger( AText: string ): Boolean;
//  begin
//    try
//      Result:= StrToInt( AText ) >= 0;
//    except
//      Result:= False;
//    end;
//  end;

begin
//  // 09-18-2014 added check
//  // EIQ-4319: Sales Order - Item# field goes blank in Quick OE - Internal
//  // EIQ-4320: Sales Order - Receiving "not a valid floating point' error in Quick OE - Internal
//  if Text = '' then
//     Sender.Clear
//  else if (Trim(Text) > '') and _IsValidInteger( Text ) then
//     Sender.AsString:= Text
end;

class procedure TOE_DM.CheckBeforeDeleteSalesOrder(AOrders_ID: Real);
begin
  CheckLinkedCRMActivityBeforeDelete( AOrders_ID );
  CheckOrderForPickTicket( AOrders_ID );   // 04-13-2009
  CheckMTOOnWorkorder( AOrders_ID );       // 04-27-2009
  CheckInternalStock( AOrders_ID ); // 11/12/2014
end;

procedure TOE_DM.SrcQuickOEDataChange(Sender: TObject; Field: TField);
begin
//  if (Sender = SrcQuickOE) then
//     CheckAssignMirrorValue( SrcQuickOE, Field );
end;

procedure TOE_DM.CheckAssignMirrorValue( ADataSource: TDataSource; AField: TField );
var
  ADataSet: TDataSet;
begin
  if not Assigned(ADataSource) or not Assigned(ADataSource.DataSet) then
     EXIT;
  ADataSet:= ADataSource.DataSet;

  if (ADataSet.State in [ dsEdit, dsInsert ])
     and
     ( ( AField = ADataSet.FieldByName('PRICE_PER_1000'))
       or
       ( AField = ADataSet.FieldByName('UNIT_PRICE'))
       or
       ( AField = ADataSet.FieldByName('DISCOUNT'))) then
  try
     if AField = ADataSet.FieldByName('PRICE_PER_1000') then
        AssignMirrorValueTo( ADataSet.FieldByName('UNIT_PRICE'), ADataSet.FieldByName('PRICE_PER_1000').asFloat / 1000, ADataSource  )
     else if AField = ADataSet.FieldByName('UNIT_PRICE') then
        AssignMirrorValueTo( ADataSet.FieldByName('PRICE_PER_1000'), ADataSet.FieldByName('UNIT_PRICE').asFloat * 1000, ADataSource )
     else if AField = ADataSet.FieldByName('DISCOUNT') then
        AssignDiscountToUnitPrice( ADataSet.FieldByName('DISCOUNT').asFloat, ADataSource );
  except
     AssignMirrorValueTo( ADataSet.FieldByName('UNIT_PRICE'),     0, ADataSource );
     AssignMirrorValueTo( ADataSet.FieldByName('PRICE_PER_1000'), 0, ADataSource );
     raise;
  end
end;

procedure TOE_DM.QryContactBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'SHOW_ALL', 1); // TFrmMainOrder(Owner).FShowAllContacts);
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', TblOrdersARCUSTO_ID.AsLargeInt);
end;

function TOE_DM.IsPMEqmtOutOfService(const AArinvtID: Real): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT iqpm.pmeqmt_arinvt_out_of_service(%.0f) FROM DUAL',
    [AArinvtID]) = 1;
end;

procedure TOE_DM.QryQuickOEAfterDelete(DataSet: TDataSet);
begin
  FQuickDeleting := true;
  CommitUpdates(DataSet);
//  TFrmMainOrder(Owner).Assign_BOGO_Item(QryQuickOEID.asFloat, QryQuickOE);
end;

procedure TOE_DM.TblCommQuickBeforePost(DataSet: TDataSet);
var
  AComm:Real;
begin
//  with TFDTable(DataSet) do
//    if MasterSource <> nil then
//      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
//         // 'Parent record not found.  Cannot post.'
//         raise Exception.Create(oe_rscstr.cTXT0000104);
//
//  AComm := SelectValueFmtAsFloat('select sum(COMMISSION_PERCENT) from ORD_DETAIL_COMMISSIONS where ' +
//                     'ORD_DETAIL_ID = %f and id <> %f',
//                     [tblOrd_detail.FieldByName('ID').asFloat,
//                      TblCommQuick.FieldByName('ID').asFloat]) +
//                      TblCommQuick.FieldByName('COMMISSION_PERCENT').asFloat;
//  if AComm > 100 then
//     // 'The total commission is greater than 100%.  Cannot post.'
//    raise exception.Create(oe_rscstr.cTXT0000105);
//  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TOE_DM.QryQuickOEBeforeDelete(DataSet: TDataSet);
begin
//  // 12/30/2015 (Byron, EIQ-10102) Check security based on the
//  // Quick Order Detail navigator.
//  CheckCashInAdvance;
//  CheckCanModifyPhantomOrderDetailChild( DataSet );
//  // 02/17/2016 (EIQ-9347, Byron) Set the flag
//  CheckSetPhantomOrderDetailModified(DataSet);
//
//  // 05/12/2014 Do not delete detail with a shipped release.
//  // EIQ-3011 Sales Orders � QOE � add warning if user tries to delete line
//  // item that has been shipped � Misonix CRM# 957362
//  if SelectValueFmtAsInteger(
//    'SELECT 1 FROM releases WHERE ord_detail_id = %d AND ' +
//    '(TO_NUMBER(ship_date) > 0 OR shipped_quan > 0) AND ROWNUM < 2',
//     // [QryReleasesORD_DETAIL_ID.AsInteger]) = 1 then
//    [QryQuickOEID.AsInteger]) = 1 then
//     // oe_rscstr.cTXT0000145 = 'Cannot delete a shipped item.';
//     raise Exception.Create(oe_rscstr.cTXT0000145);
//
//  FPostingState:= psDelete;
//  FDeletedOrd_Detail_ID:= QryQuickOEID.asFloat;
//  FIsDeletedOrdDetailPhantom:= QryQuickOEPhantom.asString = 'Y';
//
//  CheckDropShipChanged( QryQuickOE );
//  DeleteBOGOChildren(QryQuickOEID.asFloat);
end;

procedure TOE_DM.SyncPhantomOrderDetailComponents( DataSet: TDataSet );     // overloaded!
var
  AOrdDetailID: Int64;
begin
//  // TODO:  For 2016 +, please place most or all of this processing on the
//  // back end.  This involves the TInventoryItemPricing class used in
//  // AssignUnitPriceEx(), but without the prompts.
//  AOrdDetailID := DataSet.FieldByName('id').AsLargeInt;
//  if GetIncludePhantomComponents(AOrdDetailID) then
//  begin
//    FUpdatingPhantomDetail := True;
//    SyncPhantomOrderDetailComponents(AOrdDetailID);  // call overloaded method below
//    try
//      RefreshDataSetByID( DataSet );
//      DataSet.DisableControls;
//      try
//        with TFDQuery.Create(nil) do
//        try
////          Connection := db_dm.FDConnection;
//          SQL.Add('  SELECT id,');
//          SQL.Add('         total_qty_ord');
//          SQL.Add('    FROM ord_detail');
//          SQL.Add(Format('   WHERE orders_id = %d AND',[TblOrdersID.AsLargeInt]));
//          SQL.Add(Format('         phantom_ord_detail_id = %d AND',[AOrdDetailID]));
//          SQL.Add('         arinvt_id IS NOT NULL');
//          SQL.Add('ORDER BY ord_det_seqno');
//          Open;
//          while not Eof do
//            begin
//              DataSet.Locate('ID', Fields[0].AsLargeInt, []);
//              DataSet.Edit;
//              if QryShipToTAX_CODE_ID.AsLargeInt > 0 then
//                tblOrd_detailTAX_CODE_ID.AsLargeInt := QryShipToTAX_CODE_ID.AsLargeInt;
//              AssignUnitPriceEx(DataSet, Fields[1].AsFloat, False);
//              DataSet.Post;
//              Next;
//            end;
//        finally
//          Free;
//        end;
//        DataSet.Locate('ID', AOrdDetailID, []);
//      finally
//        FUpdatingPhantomDetail := False;
//      end;
//    finally
//      DataSet.EnableControls;
//    end;
//  end;
end;

procedure TOE_DM.SyncPhantomOrderDetailComponents(AOrd_Detail_ID: Int64);  // overloaded!
begin
//  if GetIncludePhantomComponents( AOrd_Detail_ID ) then
//    ExecuteCommandFmt('begin oe_phantom.sync_phantom_ord_detail(%d); end;',
//      [AOrd_Detail_ID]);
end;

procedure TOE_DM.SyncPhantomReleaseComnponents(DataSet: TDataSet);
begin
//  ExecuteCommandFmt('begin oe_phantom.sync_this_phantom_release( %d ); end;',
//    [DataSet.FieldByName('id').AsLargeInt {releases_id} ]);
//    RefreshDataSetByID( DataSet );
end;

procedure TOE_DM.DeletePhantomReleaseComponents( AReleases_ID: Real );
begin
  ExecuteCommandFmt('begin oe_phantom.delete_children_releases( %f ); end;', [ AReleases_ID ]);
end;

procedure TOE_DM.DoGetText_NullToZeroCurrency(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  // 02/05/2016 (Byron, EIQ-10315).
  // If the incoming value is NULL -- as in an empty dataset -- just
  // return a 0.00 amount.  Avoid returning a blank record.
//  if Sender.IsNull then
//    Text := FormatFloat1000SeparatorB(0.00, 2)
//  else
//      DB_DataModule.IQOnGetText(Sender, Text, DisplayText);
end;

procedure TOE_DM.DeletePhantomOrderDetailComponents( AOrd_Detail_ID: Real; DataSet: TDataSet );
begin
  ExecuteCommandFmt('begin oe_phantom.delete_children_ord_details( %f ); end;', [ AOrd_Detail_ID ]);
  RefreshDataSetByID( DataSet );
end;

procedure TOE_DM.CheckCanModifyPhantomOrderDetailChild( DataSet: TDataSet );
var
  AIsPhantom, APricingBasedOnComponents: Boolean;
begin
  if FUpdatingPhantomDetail then
    Exit;

  AIsPhantom := IsPhantomChild(DataSet);
  APricingBasedOnComponents := GetPhantomKitPriceBasedOnComponents(
    DataSet.FieldByName('phantom_ord_detail_id').AsLargeInt);

  if AIsPhantom and not APricingBasedOnComponents then
    // oe_rscstr.cTXT0000170 = 'Direct modification of phantom component is not allowed.  Operation aborted.';
    raise Exception.Create( oe_rscstr.cTXT0000170);
end;

procedure TOE_DM.CheckSetPhantomOrderDetailModified(DataSet: TDataSet);
begin
  if DataSet.FieldByName('PHANTOM_ORD_DETAIL_ID').AsLargeInt > 0 then
    ExecuteCommandFmt(
      'UPDATE ord_detail                      '#13 +
      '   SET phantom_dtl_modified = ''Y''    '#13 +
      ' WHERE id = %d                         ',
      [DataSet.FieldByName('PHANTOM_ORD_DETAIL_ID').AsLargeInt]);
end;

procedure TOE_DM.CheckPhantomReleaseChild( DataSet: TDataSet );
begin
  if DataSet.FieldByName('phantom_releases_id').asFloat <> 0 then
    raise Exception.Create('Direct modification of phantom component is not allowed - operation aborted.');
end;

function TOE_DM.IsPhantomChild( DataSet: TDataSet ): Boolean;
begin
  Result:= DataSet.FieldByName('phantom_ord_detail_id').AsLargeInt > 0;
  // even though this child points to a phantom parent check to see if current setting on the parent are true for phantom and include_components_on_so
  if Result then
    Result := GetIncludePhantomComponents(
      DataSet.FieldByName('phantom_ord_detail_id').AsLargeInt);
end;

function TOE_DM.GetIncludePhantomComponents(AOrd_Detail_ID: Int64): Boolean;  // overloaded
begin
//  Result:= SelectValueFmtAsInteger(
//    'select 1 from arinvt a, ord_detail d where d.id = %d and d.arinvt_id = a.id '+
//    '   and a.phantom_components_on_so = ''Y'' and a.phantom = ''Y'' ',
//    [ AOrd_Detail_ID ]) = 1;

  Result := SelectValueFmtAsInteger(
    'SELECT oe_misc.get_include_phantom_components(id)  '#13 +
    '  FROM ord_detail                                  '#13 +
    '  WHERE id = %d                                    ',
    [AOrd_Detail_ID]) = 1;
end;

function TOE_DM.GetPhantomKitPriceBasedOnComponentsArinvt(
  AArinvtID: Real): Boolean;
begin
  Result:= SelectValueFmtAsInteger(
   'SELECT 1                                                '#13 +
   '  FROM arinvt                                           '#13 +
   ' WHERE id = %.0f AND                                    '#13 +
   '       NVL(phantom, ''N'') = ''Y'' AND                  '#13 +
   '       NVL(phantom_components_on_so, ''N'') = ''Y'' AND '#13 +
   '       NVL(phantom_kit_use_comp_price, ''N'') = ''Y''   ',
   [AArinvtID]) = 1;
end;

function TOE_DM.GetPhantomKitPriceBasedOnComponents(
  AOrd_Detail_ID: Real): Boolean;
begin
  Result:= SelectValueFmtAsInteger(
   'SELECT 1                                                    '#13 +
   '  FROM ord_detail a, arinvt b                               '#13 +
   ' WHERE a.id = %.0f AND                                      '#13 +
   '       b.id = a.arinvt_id AND                               '#13 +
   '       NVL(b.phantom, ''N'') = ''Y'' AND                    '#13 +
   '       NVL(b.phantom_components_on_so, ''N'') = ''Y'' AND   '#13 +
   '       NVL(b.phantom_kit_use_comp_price, ''N'') = ''Y''     ',
   [AOrd_Detail_ID]) = 1;
end;

class procedure TOE_DM.CheckReleaseDates( DataSet: TDataSet; APrevPromiseDate, APrevRequestDate: TDateTime );
begin
end;

procedure TOE_DM.QryOrdTotalQuickCalcFields(DataSet: TDataSet);
begin
  QryOrdTotalQuickGRAND.asFloat :=QryOrdTotalQuickGRAND_TOTAL.asFloat + TblOrdersFREIGHT_CHARGE.asFloat;
end;

procedure TOE_DM.PkOrderHistIQBeforeCreateHPickColumn(Sender: TObject;
  AField: TField; var ACanCreateColumn: Boolean);
begin
  if CompareText(AField.FieldName, 'UNIT_PRICE') <> 0 then
     EXIT;

  ACanCreateColumn:= TRUE;
end;

procedure TOE_DM.PkOrdersIQBeforeCreateHPickColumn(Sender: TObject;
  AField: TField; var ACanCreateColumn: Boolean);
begin
  if CompareText(AField.FieldName, 'PRICE') <> 0 then
     EXIT;

  ACanCreateColumn:= TRUE;
end;

procedure TOE_DM.PkOrdersIQCreateHPickColumn(Sender: TObject; AField: TField);
const
  cExe = 'IQWIN32';
  cForm = 'FrmMainOrder';
begin
  if CompareText(AField.FieldName, 'CUSER1') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cExe, cForm, 'lblCUser1', AField.DisplayLabel) // pas
  else if CompareText(AField.FieldName, 'CUSER2') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cExe, cForm, 'lblCUser2', AField.DisplayLabel) // pas
  else if CompareText(AField.FieldName, 'CUSER3') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cExe, cForm, 'lblCUser3', AField.DisplayLabel) // pas
  else if CompareText(AField.FieldName, 'CUSER4') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cExe, cForm, 'lblCUser4', AField.DisplayLabel) // pas
  else if CompareText(AField.FieldName, 'CUSER5') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cExe, cForm, 'lblCUser5', AField.DisplayLabel) // pas
  else if CompareText(AField.FieldName, 'CUSER6') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cExe, cForm, 'lblCUser6', AField.DisplayLabel); // pas
end;

procedure TOE_DM.CheckIfMTOAllowed(ADataSet:TDataSet);
begin
  // 10/21/2013 Check ARINVT_ID, not MISC_ITEM, to determine if the detail
  // is a miscellaneous item.  The MISC_ITEM field can be populated if
  // this Sales Order was created from CRM for a Quote containing
  // Sales Configuration items. (Byron)
  if ((SelectValueFmtAsString('select NVL(non_material, ''N'') from arinvt where id = %f',
    [ADataSet.FieldByName('ARINVT_ID').asFloat]) = 'Y')
        or (ADataSet.FieldByName('ARINVT_ID').AsFloat = 0))
     and (ADataSet.FieldByName('IS_MAKE_TO_ORDER').asString = 'Y') then
        raise Exception.Create(oe_rscstr.cTXT0000138);
end;

class function TOE_DM.FindOrdDetailAKA_ID( AArinvt_ID, AArcusto_ID, AShip_To_ID: Real; AKind: string ): Real;
begin
  Result:= SelectValueFmtAsFloat('select id from aka where arinvt_id = %f and arcusto_id = %f and nvl(kind, ''*'') = nvl(''%s'', ''*'') '+
                     '   and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
                 [ AArinvt_ID,
                   AArcusto_ID,
                   AKind,
                   AArcusto_ID,
                   AShip_To_ID ]);
end;

function TOE_DM.GetLeadDays( AArinvt_ID, AArcusto_ID, AShip_To_ID: Real; AKind: string; ADivision_ID: Real ): Real;
var
  AKA_ID: Real;
  ALead_Days: Real;
begin
  Result:= 0;

  AKA_ID:= TOE_DM.FindOrdDetailAKA_ID( AArinvt_ID, AArcusto_ID, AShip_To_ID, AKind );
  if AKA_ID > 0 then
     Result:= SelectValueByID('lead_days', 'aka', AKA_ID);

  if Result > 0 then
     EXIT;

  if (ADivision_ID > 0) then
     Result:= SelectValueFmtAsFloat('select lead_days from arinvt_division where arinvt_id = %f and division_id = %f',
                                 [ AArinvt_ID, ADivision_ID ]);

  if Result > 0 then
     EXIT;

  Result:= SelectValueByID('lead_days', 'arinvt', AArinvt_ID);
end;

procedure TOE_DM.CheckLeadDays( AReleases_ID: Real );
var
  ALead_Days : Real;
  A          : Variant;
  AArinvt_ID : Real;
  AArcusto_ID: Real;
  AShip_To_ID: Real;
  AKind      : string;
  AMustShipDate: TDateTime;
  APromiseDate : TDateTime;
  ADivision_ID: Real;
begin
  A:= SelectValueArrayFmt('select d.arinvt_id, o.arcusto_id, o.ship_to_id,     '+
                     '       d.aka_kind, r.must_ship_date, r.promise_date,'+
                     '       nvl(d.division_id, o.division_id)            '+
                     ' from releases r,                                   '+
                     '      ord_detail d,                                 '+
                     '      orders o                                      '+
                     'where r.id = %f                                     '+
                     '  and r.ord_detail_id = d.id                        '+
                     '  and d.orders_id = o.id                            ',
                     [ AReleases_ID ]);
  if VarArrayDimCount(A) = 0 then
     EXIT;

  AArinvt_ID := A[ 0 ];
  AArcusto_ID:= A[ 1 ];
  AShip_To_ID:= A[ 2 ];
  AKind      := A[ 3 ];
  AMustShipDate:= A[ 4 ];
  APromiseDate := A[ 5 ];
  ADivision_ID:= A[ 6 ];

  if (AArinvt_ID = 0) or (AArcusto_ID = 0) or (AMustShipDate = 0) or (APromiseDate = 0) then
     EXIT;

  ALead_Days:= GetLeadDays( AArinvt_ID, AArcusto_ID, AShip_To_ID, AKind, ADivision_ID );

end;

procedure TOE_DM.CheckAssignSalesOrderHeaderDropShipPO;
begin
end;

procedure TOE_DM.PkWaveBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'orders_id', TblOrdersID.AsLargeInt);
end;

procedure TOE_DM.PkWaveIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
var
  AWavePick_ID: Real;
begin
  Action:= mrCancel;
end;

function TOE_DM.IsWorkflowMandatory: Boolean;
begin
  Result:= SelectValueAsString('select oe_workflow_mandatory from iqsys2') = 'Y';
end;

function TOE_DM.IsPendingWorkflowApprovalGoOnHold: Boolean;
begin
  Result:= SelectValueAsString('select oe_pending_onhold from iqsys2') = 'Y';
end;

procedure TOE_DM.tblOrd_detailSAMPLEChange(Sender: TField);
begin
  if tblOrd_detailSAMPLE.asString = 'Y' then
    tblOrd_detailGLACCT_ID.asFloat := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(ACCT_ID_SAMPLE_SALES, ''acct_id_sample_sales'', %f) from iqsys2 where rownum < 2',
                                                [TblOrdersEPLANT_ID.asFloat])
  else
    tblOrd_detailGLACCT_ID.Clear;
end;

procedure TOE_DM.tblOrd_detailSAMPLEValidate(Sender: TField);
begin
  if tblOrd_detailSAMPLE.asString = 'Y' then
  begin
    if SelectValueAsFloat('select ACCT_ID_SAMPLE_COGS from iqsys2 where rownum < 2') = 0 then
      raise exception.create('Sample COGS Account must be assigned.');
    if SelectValueAsFloat('select ACCT_ID_SAMPLE_SALES from iqsys2 where rownum < 2') = 0 then
      raise exception.create('Sample Sales Account must be assigned.');
  end;
end;


procedure TOE_DM.TblCommBeforeDelete(DataSet: TDataSet);
begin
  FAmountChanged := false;
  FPercentChanged := false;
end;

procedure TOE_DM.RecalculateComissionsAndAmount;
var
  ATotalAmount, AAmount:Real;
  AQry: TFDQuery;
begin
 if not FOrdDetilAmountChanged and not FOrdDetilPriceChanged then
   Exit;
 ATotalAmount := TblOrd_detailUNIT_PRICE.asFloat * TblOrd_detailTOTAL_QTY_ORD.asFloat;
// AQry := TFDQuery.Create(nil);
// try
////   AQry.Connection := db_dm.FDConnection;
//   AQry.Sql.Add(Format('select id, COMMISSION_PERCENT, salespeople_id from ORD_DETAIL_COMMISSIONS where ord_detail_id = %.0f',
//   [tblOrd_detailID.AsFloat, TFrmMainOrder(Owner).DM.FPercentChangedId]));
//   AQry.Open;
//   while not AQry.eof do
//   begin
//     aAmount := AQry.FieldByName('COMMISSION_PERCENT').asFloat * ATotalAmount/100;
//     ExecuteCommandFmt('update ORD_DETAIL_COMMISSIONS set amount = %f where id = %f',
//       [AAmount, AQry.FieldByName('id').asFloat]);
//     AQry.Next;
//   end;
// finally
//   AQry.Free;
// end;
// TblComm.Close;
// TblComm.Open;
end;

procedure TOE_DM.RefreshTotals;
begin
  ReOpen(QryOrdTotal);
end;

procedure TOE_DM.CheckCashInAdvance;
begin
  // Exit now if the terms are not flagged Cash In Advance
  if (TblOrdersARCUSTO_ID.AsLargeInt = 0) or
   not IsTermsCashInAdvance then
   Exit;

  // Has the order shipped?
  CheckOrderShipped;

  if IsInvoicedCashInAdvance then
    // oe_rscstr.cTXT0000171 = 'An invoice exists against this CIA Order.  Cannot modify or delete.';
    raise Exception.Create(oe_rscstr.cTXT0000171);

  // Has a cash receipt been issued?
  CheckPaymentReceived;

end;

procedure TOE_DM.CheckCashInAdvanceDeleteRelease;
begin
  // Exit now if the terms are not flagged Cash In Advance
  if (TblOrdersARCUSTO_ID.AsLargeInt = 0) or
   not IsTermsCashInAdvance then
   Exit;

  // Has the order shipped?
  CheckOrderShipped;

  if not
  (
    IsOrderDetailPaymentReceived(TblOrd_DetailID.AsLargeInt) and
    QryReleasesSHIP_DATE.IsNull
  ) then
  begin
    // Check to determine whether edits are allowed:
    if IsInvoicedCashInAdvance then
      // oe_rscstr.cTXT0000171 =
      // 'An invoice exists against this CIA Order.  Cannot modify or delete.';
      raise Exception.Create(oe_rscstr.cTXT0000171);
    // Has a cash receipt been issued?
    // CheckPaymentReceived;
  end;
end;

procedure TOE_DM.CheckCreditLimitQ;
begin
end;


procedure TOE_DM.CheckAssignMTO2( AArinvt_ID: Real );
begin
  if ((SelectValueByID('mark_ord_detail_mto', 'arinvt', AArinvt_ID) = 'Y')
      or
      (SelectValueByID('is_make_to_order', 'ship_to', TblOrdersSHIP_TO_ID.asFloat) = 'Y')
      or
      (SelectValueByID('is_make_to_order', 'arcusto', TblOrdersARCUSTO_ID.asFloat) = 'Y')) then
     QryQuickOEIS_MAKE_TO_ORDER.asString:= 'Y';
end;

function TOE_DM.IsTermsCashInAdvance: Boolean;
begin
  Result := SelectValueFmtAsString(
    'select NVL(cash_in_advance, ''N'') from terms where id = %d',
    [TblOrdersTERMS_ID.AsLargeInt]) = 'Y';
end;

function TOE_DM.IsOrdDetailShipped(const AOrdDetailID: Int64): Boolean;
begin
//  Result := SelectValueFmtAsInteger(
//    'SELECT 1                               '#13 +
//    '  FROM ord_detail                      '#13 +
//    ' WHERE id = %d AND                     '#13 +
//    '       NVL(cumm_shipped, 0) > 0  AND   '#13 +
//    '       ROWNUM < 2                      ',
//    [AOrdDetailID]) > 0;
  Result := SelectValueFmtAsInteger(
    'SELECT oe_misc.is_ord_detail_shipped(id) '#13 +
    '  FROM orders                            '#13 +
    ' WHERE id = %d                           ',
    [AOrdDetailID]) = 1;
end;

function TOE_DM.IsOrderShipped: Boolean;
begin
//  Result := SelectValueFmtAsInteger(
//    'SELECT 1                               '#13 +
//    '  FROM ord_detail                      '#13 +
//    ' WHERE orders_id = %d AND              '#13 +
//    '       NVL(cumm_shipped, 0) > 0 AND    '#13 +
//    '       ROWNUM < 2                      ',
//    [TblOrdersID.AsLargeInt]) > 0;

  Result := SelectValueFmtAsInteger(
    'SELECT oe_misc.is_order_shipped(id)    '#13 +
    '  FROM orders                          '#13 +
    ' WHERE id = %d                         ',
    [TblOrdersID.AsLargeInt]) = 1;

// Alternate way to check:
//  Result := SelectValueFmtAsInteger(
//    'SELECT 1                               '#13 +
//    '  FROM releases a, ord_detail b        '#13 +
//    ' WHERE b.orders_id = %d AND            '#13 +
//    '       a.ship_date IS NOT NULL AND     '#13 +
//    '       ROWNUM < 2                      ',
//    [TblOrdersID.AsLargeInt]) > 0;
end;

function TOE_DM.IsOrderPaymentReceived: Boolean;
begin
  Result := SelectValueFmtAsInteger(
//    'SELECT 1                                                 '#13 +
//    '  FROM arinvoice a, arinvoice_detail b, cashrec_detail c '#13 +
//    ' WHERE a.id = b.arinvoice_id AND                         '#13 +
//    '       b.ord_detail_id IN (SELECT id                     '#13 +
//    '                             FROM ord_detail             '#13 +
//    '                            WHERE orders_id = %d) AND    '#13 +
//    '       c.arinvoice_id = a.id AND                         '#13 +
//    '       ROWNUM < 2                                        ',
//    [TblOrdersID.AsLargeInt]) > 0;
    'SELECT oe_misc.is_order_payment_received(id) '#13 +
    '  FROM orders                                '#13 +
    ' WHERE id = %d                               ',
    [TblOrdersID.AsLargeInt]) = 1;
end;

procedure TOE_DM.CheckOrdDetailShipped;
begin
  if IsOrdDetailShipped(GetSelectedOrdDetailID) then
    // oe_rscstr.cTXT0000176 =
    // 'A shipment exists against this CIA Order.  Cannot modify or delete.';
    raise Exception.Create(oe_rscstr.cTXT0000176);
end;

procedure TOE_DM.CheckOrderShipped;
begin
  if IsOrderShipped and IsTermsCashInAdvance then
    // oe_rscstr.cTXT0000176 =
    // 'A shipment exists against this CIA Order.  Cannot modify or delete.';
    raise Exception.Create(oe_rscstr.cTXT0000176);
end;

procedure TOE_DM.CheckPaymentReceived;
begin
  if IsOrderPaymentReceived then
    // oe_rscstr.cTXT0000177 =
    // 'A cash receipt exists against this CIA Order.  Cannot modify or delete.';
    raise Exception.Create(oe_rscstr.cTXT0000177);
end;

function TOE_DM.IsInvoicedCashInAdvance: Boolean;
var
  ACount: Integer;
begin
{  Result := False;

  if (TblOrdersARCUSTO_ID.AsLargeInt = 0) or
   not IsTermsCashInAdvance then
   Exit(False);

  ACount := SelectValueFmtAsInteger(
    'select count(id) from arprepost_detail where ord_detail_id in ' +
    '(select id from ord_detail where orders_id = %d)',
    [TblOrdersID.AsLargeInt]);

  if ACount = 0 then
    ACount := SelectValueFmtAsInteger(
    'select count(id) from arinvoice_detail where ord_detail_id in ' +
    '(select id from ord_detail where orders_id = %d) and ar.GetLefToApply(arinvoice_id) > 0',
    [TblOrdersID.AsLargeInt]);

  Result := ACount > 0;
}
  Result := SelectValueFmtAsInteger(
    'SELECT oe_cia.is_invoiced_cia(id)  '#13 +
    '  FROM orders                      '#13 +
    ' WHERE id = %d                     ',
    [TblOrdersID.AsLargeInt]) = 1;
end;

function TOE_DM.IsOrderDetailPaymentReceived(const AOrdDetailID: Int64): Boolean;
begin
//  Result := SelectValueFmtAsInteger(
//    'SELECT 1                             '#13 +
//    '  FROM cashrec_detail a,             '#13 +
//    '       arinvoice b,                  '#13 +
//    '       arinvoice_detail c            '#13 +
//    ' WHERE c.ord_detail_id = %d AND      '#13 +
//    '       b.id = a.arinvoice_id AND     '#13 +
//    '       c.arinvoice_id = b.id AND     '#13 +
//    '       ROWNUM < 2                    ',
//    [AOrdDetailID])  = 1;

  Result := SelectValueFmtAsInteger(
    'SELECT oe_misc.is_ord_detail_payment_received(id)  '#13 +
    '  FROM ord_detail                                  '#13 +
    ' WHERE id = %d                                     ',
    [AOrdDetailID]) = 1;

end;

function TOE_DM.IsReleaseQuantityGreaterThanDetail(const AOrdDetailID,
  AReleasesID: Int64; const AReleaseQtyFieldValue: Real): Boolean;
begin
  Result := (SelectValueFmtAsFloat(
    'SELECT SUM(quan) FROM releases WHERE ord_detail_id = %d AND id <> %d',
    [AOrdDetailID, AReleasesID]) + AReleaseQtyFieldValue) >=
    SelectValueFmtAsFloat(
    'SELECT total_qty_ord FROM ord_detail WHERE id = %d',
    [AOrdDetailID]);
end;

function TOE_DM.IsReleaseQuantityLessThanDetail(const AOrdDetailID,
  AReleasesID: Int64; const AReleaseQtyFieldValue: Real): Boolean;
begin
  Result := (SelectValueFmtAsFloat(
    'SELECT SUM(quan) FROM releases WHERE ord_detail_id = %d AND id <> %d',
    [AOrdDetailID, AReleasesID]) + AReleaseQtyFieldValue) <=
    SelectValueFmtAsFloat(
    'SELECT total_qty_ord FROM ord_detail WHERE id = %d',
    [AOrdDetailID]);
end;

function TOE_DM.IsReleaseQuantitySumLessThanDetail(
  const AOrdDetailID: Int64): Boolean;
var
  AReleases, ATotalOrdered: Double;
begin
//  Result := SelectValueFmtAsFloat(
//    'SELECT SUM(quan) FROM releases WHERE ord_detail_id = %d',
//    [AOrdDetailID]) <
//    SelectValueFmtAsFloat(
//    'SELECT total_qty_ord FROM ord_detail WHERE id = %d',
//    [AOrdDetailID]);
  AReleases := SelectValueFmtAsFloat(
    'SELECT ROUND(SUM(quan), 6) FROM releases WHERE ord_detail_id = %d',
    [AOrdDetailID]);
  ATotalOrdered := SelectValueFmtAsFloat(
    'SELECT ROUND(total_qty_ord, 6) FROM ord_detail WHERE id = %d',
    [AOrdDetailID]);
  Result := AReleases <  ATotalOrdered
end;

procedure TOE_DM.CheckCashInAdvanceDetailReleases(AOrdDetailID: Int64);
begin
  // Exit now if the terms are not flagged Cash In Advance
  if (TblOrdersARCUSTO_ID.AsLargeInt = 0) or
   not IsTermsCashInAdvance then
   Exit;

  // Has the order shipped?
  CheckOrderShipped;

  if not
  (
    IsOrderDetailPaymentReceived(AOrdDetailID) and
    IsReleaseQuantitySumLessThanDetail(
      AOrdDetailID)
  ) then
  begin
    // Check to determine whether edits are allowed:
        if IsInvoicedCashInAdvance then
      // oe_rscstr.cTXT0000171 =
      // 'An invoice exists against this CIA Order.  Cannot modify or delete.';
      raise Exception.Create(oe_rscstr.cTXT0000171);
    // Has a cash receipt been issued?
    CheckPaymentReceived;
  end;
end;

procedure TOE_DM.CheckCashInAdvanceReleases;
begin
  // Exit now if the terms are not flagged Cash In Advance
  if (TblOrdersARCUSTO_ID.AsLargeInt = 0) or
   not IsTermsCashInAdvance then
   Exit;

  // Note:  Even on a CIA invoice, the request_datea and promise_date
  // must still be editable.  Users cannot edit anything else, though.
  // Adding and deleting is not permitted.
  // See EIQ-9354 and EIQ-11919.

  // Has the order been invoiced?
  if ((FOldRelseq <> QryReleasesseq.asString) or
    (FOldRelquan <> QryReleasesquan.asString) or
    (FOldRelforecast <> QryReleasesforecast.asString) or
    (FOldRelship_date <> QryReleasesship_date.asString) or
    (FOldRelcuser1 <> QryReleasescuser1.asString) or
    (FOldRelunit_price <> QryReleasesunit_price.asString) or
    (FOldReluser_date <> QryReleasesuser_date.asString) or
    (FOldRelorig_quan <> QryReleasesorig_quan.asString) or
    (FOldRelran <> QryReleasesran.asString) or
    (FOldRelship_to_id <> QryReleasesship_to_id.asString) or
    (FOldRelshipped_quan <> QryReleasesshipped_quan.asString) or
    (FOldReldate_type <> QryReleasesdate_type.asString) or
    (FOldRelcuser2 <> QryReleasescuser2.asString) or
    (FOldRelbatch_no <> QryReleasesbatch_no.asString) or
    (FOldReljob_seq <> QryReleasesjob_seq.asString) or
    (FOldRelmust_ship_date <> QryReleasesmust_ship_date.asString) or
    (FOldRelack <> QryReleasesack.asString) or
    (FOldReluser_date_2 <> QryReleasesuser_date_2.asString) or
    (FOldReluser_date_3 <> QryReleasesuser_date_3.asString) or
    (FOldRelinternal_update_type <> QryReleasesinternal_update_type.asString) or
    (FOldRellock_must_ship_date <> QryReleaseslock_must_ship_date.asString) or
    (FOldRelcuser3 <> QryReleasescuser3.asString) or
    (FOldRelfreight_id <> QryReleasesfreight_id.asString) or
    (FOldRelwo_note <> QryReleaseswo_note.asString) or
    (FOldRelphantom_releases_id <> QryReleasesphantom_releases_id.asString) or
    (FOldRelpending_verification <> QryReleasespending_verification.asString) or
    (FOldRelinventory_verified_date <> QryReleasesinventory_verified_date.asString) or
    (FOldRelexclude_sched <> QryReleasesexclude_sched.asString) or
    (FOldRelexpedite <> QryReleasesexpedite.asString)) then
    begin
      // Has the order shipped?
      CheckOrderShipped;

      if not
      (
        IsOrderDetailPaymentReceived(TblOrd_DetailID.AsLargeInt) and
        IsReleaseQuantityLessThanDetail(
          TblOrd_DetailID.AsLargeInt,
          QryReleasesID.AsLargeInt,
          QryReleasesQUAN.AsFloat)
      ) then
      begin
        // Check to determine whether edits are allowed:
        if IsInvoicedCashInAdvance then
          // oe_rscstr.cTXT0000171 =
          // 'An invoice exists against this CIA Order.  Cannot modify or delete.';
          raise Exception.Create(oe_rscstr.cTXT0000171);
        // Has a cash receipt been issued?
        CheckPaymentReceived;
      end;
    end;
end;

procedure TOE_DM.CheckCashInAdvanceReleasesQuickEntry;
begin
  // Exit now if the terms are not flagged Cash In Advance
  if (TblOrdersARCUSTO_ID.AsLargeInt = 0) or
   not IsTermsCashInAdvance then
   Exit;

  if not
  (
    IsOrderDetailPaymentReceived(QryQuickOEID.AsLargeInt) and
    IsReleaseQuantityLessThanDetail(
      QryQuickOEID.AsLargeInt,
      0, // Releases ID
      QryQuickOETOTAL_QTY_ORD.AsFloat)
  ) then
  begin
    // Check to determine whether edits are allowed:
    if IsInvoicedCashInAdvance then
      // oe_rscstr.cTXT0000171 =
      // 'An invoice exists against this CIA Order.  Cannot modify or delete.';
      raise Exception.Create(oe_rscstr.cTXT0000171);
    // Has a cash receipt been issued?
    CheckPaymentReceived;
  end;
  // Has the order shipped?
  CheckOrderShipped;
end;

procedure TOE_DM.GetTaxes;
var
  ATaxCodesId: Real;
begin
end;

procedure TOE_DM.CheckOrdersBOGO;
begin
end;

procedure TOE_DM.TblOrdersAfterDelete(DataSet: TDataSet);
begin
//  CheckOrdersBOGO;
end;


procedure TOE_DM.DeleteBOGOChildren(aOrd_Detail_id:Real);
begin
//  ExecuteCommandFmt('delete from ord_detail where bogo_ord_detail_id = %f', [aOrd_Detail_id]);
end;


procedure TOE_DM.PkBogoChildrenBeforeOpen(DataSet: TDataSet);
var
  aOrdDetailId:Real;
begin
  aOrdDetailId := tblOrd_detailID.asFloat;

//  TFDQuery(DataSet).ParamByName('ar_discount_tiers_id').asFloat := SelectValueFmtAsFloat('select oe_bogo.GetBogo_ar_discount_tiers_id(%f) from dual', [aOrdDetailId]);
  TFDQuery(DataSet).ParamByName('ord_detail_id').asFloat := aOrdDetailId;
end;


function TOE_DM.AsYN( AValue: Boolean ): string;
begin
  if AValue then Result:= 'Y' else Result:= 'N';

end;


end.
