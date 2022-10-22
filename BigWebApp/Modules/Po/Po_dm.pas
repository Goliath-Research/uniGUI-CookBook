unit PO_DM;

interface

Uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  IQMS.Common.DataLib,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  // Po_ReApproval_Rules,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  System.Variants,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TDM_PO = class(TDataModule)
    SrcPo: TDataSource;
    SrcFreight: TDataSource;
    SrcTerms: TDataSource;
    PKVendors: TIQWebHPick;
    PKRemitTo: TIQWebHPick;
    PKRemitToID: TBCDField;
    PKRemitToVENDOR_ID: TBCDField;
    PKRemitToATTN: TStringField;
    PKRemitToADDR1: TStringField;
    PKRemitToADDR2: TStringField;
    PKRemitToCITY: TStringField;
    PKRemitToSTATE: TStringField;
    PKRemitToZIP: TStringField;
    PkAka: TIQWebHPick;
    PkArInvt: TIQWebHPick;
    PkArInvtID: TBCDField;
    PkArInvtITEMNO: TStringField;
    PkArInvtDESCRIP: TStringField;
    PkArInvtREV: TStringField;
    PkArInvtCLASS: TStringField;
    PKLineItems: TIQWebHPick;
    PKLineItemsID: TBCDField;
    PKLineItemsPONO: TStringField;
    PKLineItemsVENDOR_ID: TBCDField;
    PKLineItemsPO_DATE: TDateTimeField;
    PKLineItemsTERMS_ID: TBCDField;
    PKLineItemsREMIT_TO_ID: TBCDField;
    PKLineItemsFREIGHT_ID: TBCDField;
    PKLineItemsFOB: TStringField;
    PKLineItemsTAX_CODE_ID: TFMTBCDField;
    PKLineItemsSEQ: TBCDField;
    PKLineItemsARINVT_ID: TBCDField;
    PKLineItemsTOTAL_QTY_ORD: TBCDField;
    PKLineItemsUNIT_PRICE: TFMTBCDField;
    PKLineItemsTOTAL: TFMTBCDField;
    PKLineItemsITEM_DESCRIP: TStringField;
    PKLineItemsITEM_NUMBER: TStringField;
    PKLineItemsREQ_DATE: TDateTimeField;
    PKLineItemsGLACCT_ID_INV: TFMTBCDField;
    PKLineItemsCLOSED: TStringField;
    PKLineItemsTAXABLE: TStringField;
    PKLineItemsMISC_ITEM: TStringField;
    PKLineItemsVCOMP: TStringField;
    PKLineItemsVADDR1: TStringField;
    PKLineItemsVADDR2: TStringField;
    PKLineItemsVCITY: TStringField;
    PKLineItemsVSTATE: TStringField;
    PKLineItemsVZIP: TStringField;
    PKLineItemsRCOMP: TStringField;
    PKLineItemsRADDR1: TStringField;
    PKLineItemsRADDR2: TStringField;
    PKLineItemsRCITY: TStringField;
    PKLineItemsRSTATE: TStringField;
    PKLineItemsRZIP: TStringField;
    PKLineItemsTAX_RATE: TFMTBCDField;
    PKLineItemsACCT: TStringField;
    PKLineItemsTERMS: TStringField;
    PKLineItemsFREIGHT: TStringField;
    PKLineItemsITEMNO: TStringField;
    PKLineItemsDESCRIP: TStringField;
    PKLineItemsREV: TStringField;
    PKLineItemsCLASS: TStringField;
    PKLineItemsPO_DETAIL_ID: TBCDField;
    SrcViewPoTotal: TDataSource;
    PkAkaVEND_ITEMNO: TStringField;
    PkAkaVEND_DESCRIP: TStringField;
    PkAkaARINVT_ID: TBCDField;
    PKLineItemsCOST_OBJECT_ID: TBCDField;
    SrcPoDetail: TDataSource;
    TblPoDetail: TFDTable;
    TblPoDetailSEQ: TBCDField;
    TblPoDetailREQ_DATE: TDateTimeField;
    TblPoDetailDisp_Descript: TStringField;
    TblPoDetailItemNumber: TStringField;
    TblPoDetailDescription: TStringField;
    TblPoDetailTotal: TFloatField;
    TblPoDetailGLAcct: TStringField;
    PKVendorsID: TBCDField;
    PKVendorsATTN: TStringField;
    PKVendorsCOMPANY: TStringField;
    PKVendorsADDR1: TStringField;
    PKVendorsADDR2: TStringField;
    PKVendorsCITY: TStringField;
    PKVendorsSTATE: TStringField;
    PKVendorsTERMS_ID: TBCDField;
    PKVendorsZIP: TStringField;
    PKVendorsVENDORNO: TStringField;
    PKShipTo: TIQWebHPick;
    PKShipToID: TBCDField;
    PKShipToCOMPANY: TStringField;
    PKShipToADDRESS1: TStringField;
    PKShipToADDRESS2: TStringField;
    PKShipToCITY: TStringField;
    PKShipToSTATE: TStringField;
    PKShipToZIP: TStringField;
    PKShipToCOUNTRY: TStringField;
    PKShipToPHONE: TStringField;
    PKShipToFAX: TStringField;
    PKShipToEMAIL: TStringField;
    PKShipToINTERNET: TStringField;
    TblPoDetailQty_Received: TFloatField;
    TblPoDetailPROMISE_DATE: TDateTimeField;
    PKPOrders: TIQWebHPick;
    PKPOrdersPONO: TStringField;
    PKPOrdersPO_DATE: TDateTimeField;
    PKPOrdersCOMPANY: TStringField;
    PKPOrdersID: TBCDField;
    PKPOrdersVENDOR_ID: TBCDField;
    PKPOrdersTOTAL_ORDERED: TBCDField;
    PKPOrdersDESCRIPTION: TStringField;
    PKPOrdersITEMNO: TStringField;
    PKPOrdersCLASS: TStringField;
    PKLineItemsSHIP_TO_ID: TBCDField;
    PKLineItemsUSERID: TStringField;
    QryFreight: TFDQuery;
    QryTerms: TFDQuery;
    QryCurrency: TFDQuery;
    TblPoDetailTOTAL_QTY_ORD: TBCDField;
    TblPoDetailArinvt_Unit: TStringField;
    QryBreakDownTaxes: TFDQuery;
    QryBreakDownTaxesDESCRIP: TStringField;
    PKPOrdersVENDORNO: TStringField;
    TblPoDetailStd_Cost_Arinvt: TFloatField;
    wwQryPr_Emp: TFDQuery;
    wwQryPr_EmpLAST_NAME: TStringField;
    wwQryPr_EmpFIRST_NAME: TStringField;
    wwQryPr_EmpEMPNO: TStringField;
    TblPoDetailRev: TStringField;
    TblPoDetailCOST_OBJECT_SOURCE: TStringField;
    TblPoDetailCost_Source: TStringField;
    PkTooling: TIQWebHPick;
    PkToolingWORKORDERNO: TStringField;
    PkToolingPROJECT: TStringField;
    PkToolingBUYERID: TStringField;
    PkToolingCUSTNO: TStringField;
    PkToolingCOMPANY: TStringField;
    PkToolingTASKNO: TStringField;
    PkToolingTASK_DESCRIP: TStringField;
    PkToolingITEMNO: TStringField;
    PkToolingITEM_DESCRIP: TStringField;
    PkToolingELEMENT_DESCRIPTION: TStringField;
    PkToolingTOOL_TASK_ELEMENT_ID: TFloatField;
    PKPOrdersAPPROVED_BY: TStringField;
    PKLineItemsCOMMENT1: TStringField;
    PkPM: TIQWebHPick;
    PkPMID: TBCDField;
    PkPMWORK_ORDER_NO: TBCDField;
    PkPMWO_DATE: TDateTimeField;
    PkPMEQNO: TStringField;
    PkPMTASKNO: TStringField;
    PkPMTASK_DESCRIP: TStringField;
    QryEPlant: TFDQuery;
    TblPoDetailEPlant_Name: TStringField;
    PKPOrdersEPLANT_ID: TBCDField;
    PkArInvtEPLANT_ID: TBCDField;
    PkPO_Detail: TIQWebHPick;
    PkPO_DetailPO_DETAIL_ID: TBCDField;
    PkPO_DetailCLASS: TStringField;
    PkPO_DetailITEMNO: TStringField;
    PkPO_DetailDESCRIPTION: TStringField;
    PkPO_DetailTOTAL_ORDERED: TBCDField;
    PkPO_DetailREQUIRED_DATE: TDateTimeField;
    PkPO_DetailPROMISED_DATE: TDateTimeField;
    PkPO_DetailEPLANT_ID: TBCDField;
    PkPO_DetailSEQ: TBCDField;
    TblPoDetailArinvtEplant_id: TFloatField;
    TblPoDetailDivision_Name: TStringField;
    wwQryDivision: TFDQuery;
    wwQryDivisionID: TBCDField;
    wwQryDivisionNAME: TStringField;
    wwQryRemit: TFDQuery;
    wwQryRemitID: TBCDField;
    wwQryRemitVENDOR_ID: TBCDField;
    wwQryRemitATTN: TStringField;
    wwQryRemitADDR1: TStringField;
    wwQryRemitCITY: TStringField;
    wwQryRemitSTATE: TStringField;
    wwQryRemitZIP: TStringField;
    wwQryShip: TFDQuery;
    wwQryShipID: TBCDField;
    wwQryShipCOMPANY: TStringField;
    wwQryShipADDRESS1: TStringField;
    wwQryShipCITY: TStringField;
    wwQryShipSTATE: TStringField;
    wwQryShipZIP: TStringField;
    wwQryRemitADDR2: TStringField;
    wwQryShipADDRESS2: TStringField;
    wwQryTaxCodes: TFDQuery;
    wwQryTaxCodesID: TBCDField;
    wwQryTaxCodesTAX_CODE: TStringField;
    wwQryTaxCodesTAX_CODE_DESC: TStringField;
    QryCurrencyID: TBCDField;
    QryCurrencyCURR_CODE: TStringField;
    QryCurrencyDESCRIP: TStringField;
    QryCurrencyGLVALUE: TStringField;
    QryCurrencyCURR_SYMBOL: TStringField;
    QryTermsDESCRIPTION: TStringField;
    QryFob: TFDQuery;
    QryFobDESCRIP: TStringField;
    TblPoDetailDescrip2: TStringField;
    PkPO_DetailDESCRIP2: TStringField;
    PKPOrdersDIVISION_ID: TBCDField;
    PKPOrdersDIVISION_NAME: TStringField;
    PKPOrdersREV: TStringField;
    PKPOrdersDESCRIP2: TStringField;
    wwSrcPOReleases: TDataSource;
    QryPOReleases: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryPOReleasesREQUEST_DATE: TDateTimeField;
    QryPOReleasesLeft_To_Recv: TFloatField;
    TblPoDetailQty_OnOrder: TFMTBCDField;
    wwQryPr_EmpPK_HIDE: TStringField;
    PKVendorsPK_HIDE: TStringField;
    PkArInvtPK_HIDE: TStringField;
    PKLineItemsCMTLINE: TStringField;
    TblPoDetailClass: TStringField;
    PKPOrdersBUYERID: TStringField;
    QryCurrencyNATIVE_CURR: TStringField;
    PkAkaEPLANT_ID: TBCDField;
    PkAkaITEMNO: TStringField;
    PkAkaDESCRIP: TStringField;
    PkAkaCLASS: TStringField;
    PkAkaREV: TStringField;
    ViewPoTotal: TFDQuery;
    TblPoDetailVendor_ItemNo: TStringField;
    TblPoDetailVendor_Descrip: TStringField;
    TblPoDetailMISC_ITEMNO: TStringField;
    QryRefCode: TFDQuery;
    QryRefCodeCATEGORY_ID: TBCDField;
    QryRefCodeCATEGORY_DESCRIP: TStringField;
    QryRefCodeREF_CODE_ID: TBCDField;
    QryRefCodeREF_CODE_DESCRIP: TStringField;
    QryRefCodeREF_CODE: TStringField;
    TblPoDetailREF_CODE_DESCRIP: TStringField;
    TblPoDetailREF_CODE: TStringField;
    wwQryRemitCOUNTRY: TStringField;
    wwQryShipCOUNTRY: TStringField;
    PKShipToEPLANT_ID: TBCDField;
    TblPoDetailNon_Material: TStringField;
    PkBuyer: TIQWebHPick;
    PkBuyerUSER_NAME: TStringField;
    PkBuyerFIRST_NAME: TStringField;
    PkBuyerLAST_NAME: TStringField;
    PkBuyerEMPNO: TStringField;
    PkBuyerEMAIL: TStringField;
    QryVendorContact: TFDQuery;
    QryVendorContactID: TBCDField;
    QryVendorContactVENDOR_ID: TBCDField;
    QryVendorContactFIRST_NAME: TStringField;
    QryVendorContactLAST_NAME: TStringField;
    QryVendorContactDISPLAY_NAME: TStringField;
    PKPOrdersDROP_SHIP: TStringField;
    wwQryPr_EmpFULL_NAME: TStringField;
    PkArInvtDESCRIP2: TStringField;
    PkRequisition: TIQWebHPick;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    FloatField1: TBCDField;
    FloatField2: TBCDField;
    FloatField3: TBCDField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField4: TBCDField;
    FloatField5: TBCDField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    PkAkaDESCRIP2: TStringField;
    PKLineItemsDESCRIP2: TStringField;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PkAcctTYPE: TStringField;
    PkAcctEPLANT_ID: TBCDField;
    QryPOType: TFDQuery;
    QryPOTypeNAME: TStringField;
    QryPOTypeDESCRIP: TStringField;
    PKPOrdersCLOSED: TStringField;
    PKPOrdersQTY_RECEIVED: TFMTBCDField;
    PkRequisitionCLOSED: TStringField;
    PkRequisitionQTY_RECEIVED: TFMTBCDField;
    PkAkaVEND_DESCRIP2: TStringField;
    TblPoDetailVendor_Descrip2: TStringField;
    TblPoDetailCUSER1: TStringField;
    TblPoDetailCUSER2: TStringField;
    TblPoDetailCUSER3: TStringField;
    PkAkaID: TBCDField;
    PkContact: TIQWebHPick;
    PkContactID: TBCDField;
    PkContactFIRST_NAME: TStringField;
    PkContactLAST_NAME: TStringField;
    PkContactTITLE: TStringField;
    PkContactPHONE_NUMBER: TStringField;
    PkContactEXT: TStringField;
    PkContactFAX_NUMBER: TStringField;
    PkContactEMAIL: TStringField;
    PkContactPAGER: TStringField;
    PkContactCONTACT_TYPE: TStringField;
    PkRequisitionBUYERNAME: TStringField;
    PKPOrdersBUYERNAME: TStringField;
    IQMS: TStringField;
    PkRequisitionUSERID: TStringField;
    PkRequisitionREQ_BY: TStringField;
    PKPOrdersREQ_BY: TStringField;
    PkArcusto: TIQWebHPick;
    PkArcustoID: TBCDField;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCUST_GROUP: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoADDR2: TStringField;
    PkArcustoADDR3: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPK_HIDE: TStringField;
    PkAkaVEND_REV: TStringField;
    TblPoDetailVend_Aka_Rev: TStringField;
    PKFreight: TIQWebHPick;
    QryFreightID: TBCDField;
    QryFreightDESCRIP: TStringField;
    QryFreightCODE_QUALIFIER: TStringField;
    QryFreightTRANSPORT_CODE: TStringField;
    QryFreightSCAC_IATA_CODE: TStringField;
    QryFreightPK_HIDE: TStringField;
    QryFreightEPLANT_ID: TBCDField;
    QryFreightCOMMENT1: TStringField;
    PKFreightID: TBCDField;
    PKFreightDESCRIP: TStringField;
    PKFreightCODE_QUALIFIER: TStringField;
    PKFreightTRANSPORT_CODE: TStringField;
    PKFreightGLACCT_ID_FREIGHT: TBCDField;
    PKFreightSCAC_IATA_CODE: TStringField;
    PKFreightPK_HIDE: TStringField;
    PKFreightEPLANT_ID: TBCDField;
    PKFreightCOMMENT1: TStringField;
    PkBuyerMIDDLE_NAME: TStringField;
    PKPOrdersCUSER1: TStringField;
    PKPOrdersCUSER2: TStringField;
    PKPOrdersCUSER3: TStringField;
    PkRequisitionCUSER1: TStringField;
    PkRequisitionCUSER2: TStringField;
    PkRequisitionCUSER3: TStringField;
    PkAkaOEM: TIQWebHPick;
    PkAkaOEMVEND_ITEMNO: TStringField;
    PkAkaOEMVEND_DESCRIP: TStringField;
    PkAkaOEMARINVT_ID: TBCDField;
    PkAkaOEMITEMNO: TStringField;
    PkAkaOEMDESCRIP: TStringField;
    PkAkaOEMCLASS: TStringField;
    PkAkaOEMREV: TStringField;
    PkAkaOEMEPLANT_ID: TBCDField;
    PkAkaOEMDESCRIP2: TStringField;
    PkAkaOEMVEND_DESCRIP2: TStringField;
    PkAkaOEMID: TBCDField;
    PkAkaOEMVEND_REV: TStringField;
    PkAkaOEMVENDORNO: TStringField;
    TblPoDetailOEM_Vendor: TStringField;
    PKPOrdersCMTLINE: TStringField;
    PkRequisitionCMTLINE: TStringField;
    TblPoDetailMISC_NOTE: TStringField;
    PkAkaOEMCOMPANY: TStringField;
    SrcWFHeader: TDataSource;
    QryWFHeader: TFDQuery;
    QryWFHeaderIS_STARTED: TStringField;
    UpdateSQLWFHeader: TFDUpdateSQL;
    TblPoDetailTaxCode: TStringField;
    PkTaxCode: TIQWebHPick;
    PkTaxCodeID: TBCDField;
    PkTaxCodeTAX_CODE: TStringField;
    PkTaxCodeDESCRIPTION: TStringField;
    PkTaxCodeRATE: TFMTBCDField;
    PkTaxCodeTAX_CODE2: TStringField;
    QryPO: TFDQuery;
    QryPOID: TBCDField;
    QryPOPONO: TStringField;
    QryPOVENDOR_ID: TBCDField;
    QryPOPO_DATE: TDateTimeField;
    QryPOTERMS_ID: TBCDField;
    QryPOREMIT_TO_ID: TBCDField;
    QryPOSHIP_TO_ID: TBCDField;
    QryPOUSERID: TStringField;
    QryPOBUYERID: TStringField;
    QryPOBUYER_NAME: TStringField;
    QryPOFREIGHT_ID: TBCDField;
    QryPOFOB: TStringField;
    QryPOTAX_CODE_ID: TBCDField;
    QryPOCOMMENT1: TStringField;
    QryPOCOMPANY_ID: TBCDField;
    QryPOCONFIRM_TO: TStringField;
    QryPOCURRENCY_ID: TBCDField;
    QryPOREV: TBCDField;
    QryPOPO_CONTROL: TStringField;
    QryPOPR_EMP_ID_RQSTNR: TBCDField;
    QryPOAPPROVED_BY: TStringField;
    QryPOEPLANT_ID: TBCDField;
    QryPOARCUSTO_ID: TBCDField;
    QryPOARCUSTO_CUSTNO: TStringField;
    QryPOPRINT_COUNT: TBCDField;
    QryPOPRINT_LAST_USER: TStringField;
    QryPOPRINT_LAST_DATE: TDateTimeField;
    QryPOPO_TYPE: TStringField;
    QryPOCREATE_EDI: TStringField;
    QryPOSIGNOFF_EMAIL_SENT: TDateTimeField;
    QryPOSIGNOFF_USERID: TStringField;
    QryPOSIGNOFF_DATE: TDateTimeField;
    QryPOSIGNOFF_TEXT: TStringField;
    QryPOEXPORT_CREATED_DATE: TDateTimeField;
    QryPOSIGNOFF_NOTIFY_USERID: TStringField;
    QryPOSIGNOFF_USERID_AGREE: TStringField;
    QryPOVENDOR_CONTACT_ID: TBCDField;
    QryPOWORKFLOW_ENABLED: TStringField;
    QryPOSIGNOFF_LINK: TStringField;
    QryPOSIGNOFF_SUBJECT: TStringField;
    QryPOCUSER1: TStringField;
    QryPOCUSER2: TStringField;
    QryPOCUSER3: TStringField;
    QryPOCUSER4: TStringField;
    QryPOCUSER5: TStringField;
    QryPOCUSER6: TStringField;
    QryPOON_HOLD: TStringField;
    QryPOREASON: TStringField;
    QryPOVENDOR_COMPANY: TStringField;
    QryPOTERMS_DESCRIPTION: TStringField;
    QryPOFREIGHT_DESCRIP: TStringField;
    QryPOTAX_CODE: TStringField;
    QryPOTAX_CODE_DESC: TStringField;
    QryPOCURR_CODE: TStringField;
    QryPOCURR_DESCRIP: TStringField;
    QryPOEPLANT_NAME: TStringField;
    FDUpdateSQL_PO: TFDUpdateSQL;
    QryPOBuyerName: TStringField;
    TblPoDetailCMTLINE: TStringField;
    TblPoDetailUNIT_PRICE: TFMTBCDField;
    TblPoDetailCLOSED: TStringField;
    TblPoDetailTAXABLE: TStringField;
    TblPoDetailPRICE_PER_1000: TFMTBCDField;
    TblPoDetailUNIT: TStringField;
    TblPoDetailDONT_POST_PPV: TStringField;
    TblPoDetailVENDOR_RMA_RETURNS_ID: TBCDField;
    TblPoDetailEXPORTED_DATE_TIME: TDateTimeField;
    TblPoDetailTAX_CODE_ID: TBCDField;
    TblPoDetailID: TBCDField;
    TblPoDetailPO_ID: TBCDField;
    TblPoDetailGLACCT_ID_INV: TBCDField;
    TblPoDetailMISC_ITEM: TStringField;
    TblPoDetailCOST_OBJECT_ID: TBCDField;
    TblPoDetailSTD_COST: TFMTBCDField;
    TblPoDetailDIVISION_ID: TBCDField;
    TblPoDetailREF_CODE_ID: TBCDField;
    TblPoDetailDROP_SHIP_ORD_DETAIL_ID: TBCDField;
    TblPoDetailARINVT_VENDORS_ID: TBCDField;
    TblPoDetailC_PO_MISC_ID: TBCDField;
    TblPoDetailARINVT_ID: TBCDField;
    TblPoDetailUOM_FACTOR: TFMTBCDField;
    QryPOReleasesID: TBCDField;
    QryPOReleasesPO_DETAIL_ID: TBCDField;
    QryPOReleasesSEQ: TBCDField;
    QryPOReleasesPROMISE_DATE: TDateTimeField;
    QryPOReleasesQUAN: TBCDField;
    QryPOReleasesFORECAST: TStringField;
    QryPOReleasesDATE_RECEIVED: TDateTimeField;
    QryPOReleasesCUSER1: TStringField;
    QryPOReleasesUNIT_PRICE: TFMTBCDField;
    QryPOReleasesUSER_DATE: TDateTimeField;
    QryPOReleasesUSER_DATE2: TDateTimeField;
    QryPOReleasesUSER_DATE3: TDateTimeField;
    QryPOReleasesORIG_QUAN: TBCDField;
    QryPOReleasesBUDGET_STATE: TStringField;
    QryPOReleasesACK: TStringField;
    wwQryPr_EmpID: TBCDField;
    TblPoDetailEPLANT_ID: TBCDField;
    QryTermsDAYS: TBCDField;
    QryTermsDISCOUNT: TBCDField;
    QryTermsID: TBCDField;
    QryTermsDISCOUNT_DAYS: TBCDField;
    wwQryTaxCodesTOT_TAX_RATE: TFMTBCDField;
    QryCurrencySPOT_RATE: TFMTBCDField;
    QryBreakDownTaxesTAX_RATE: TFMTBCDField;
    QryBreakDownTaxesTAX_AMOUNT: TFMTBCDField;
    ViewPoTotalID: TBCDField;
    ViewPoTotalTOTAL: TFMTBCDField;
    ViewPoTotalTAX: TFMTBCDField;
    ViewPoTotalTOTAL_AFTER_TAX: TFMTBCDField;
    QryFreightGLACCT_ID_FREIGHT: TBCDField;
    QryWFHeaderID: TBCDField;
    QryPOVENDORNO: TStringField;
    QryPOVENDOR_ADDR1: TStringField;
    QryPOVENDOR_ADDR2: TStringField;
    QryPOVENDOR_CITY: TStringField;
    QryPOVENDOR_STATE: TStringField;
    QryPOVENDOR_ZIP: TStringField;
    QryPOVENDOR_COUNTRY: TStringField;
    QryPOTERMS_ID_1: TBCDField;
    QryPOREMIT_TO_ATTN: TStringField;
    QryPOREMIT_TO_ADDR1: TStringField;
    QryPOREMIT_TO_ADDR2: TStringField;
    QryPOREMIT_TO_CITY: TStringField;
    QryPOREMIT_TO_STATE: TStringField;
    QryPOREMIT_TO_ZIP: TStringField;
    QryPOREMIT_TO_COUNTRY: TStringField;
    PkContactEPLANT_ID: TBCDField;
    QryVendorContactEPLANT_ID: TBCDField;
    PkArInvtEx: TIQWebHPick;
    PkArInvtExID: TBCDField;
    PkArInvtExITEMNO: TStringField;
    PkArInvtExDESCRIP: TStringField;
    PkArInvtExDESCRIP2: TStringField;
    PkArInvtExREV: TStringField;
    PkArInvtExCLASS: TStringField;
    PkArInvtExEPLANT_ID: TBCDField;
    PkArInvtExPK_HIDE: TStringField;
    procedure TblPoDetailBeforeEdit(DataSet: TDataSet);
    procedure TblPoDetailBeforePost(DataSet: TDataSet);
    procedure TblPoDetailCalcFields(DataSet: TDataSet);
    procedure TblPoDetailAfterPost(DataSet: TDataSet);
    procedure PKPOrdersIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure TblPoDetailAfterDelete(DataSet: TDataSet);
    procedure SrcPoDataChange(Sender: TObject; Field: TField);
    procedure PkArInvtIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure TblPoDetailBeforeDelete(DataSet: TDataSet);
    procedure PkPO_DetailBeforeOpen(DataSet: TDataSet);
    procedure TblPoVENDOR_IDChange(Sender: TField);
    procedure TblPoDetailAfterScroll(DataSet: TDataSet);
    procedure QryPOReleasesAfterPost(DataSet: TDataSet);
    procedure QryPOReleasesBeforeEdit(DataSet: TDataSet);
    procedure QryPOReleasesBeforePost(DataSet: TDataSet);
    procedure QryPOReleasesNewRecord(DataSet: TDataSet);
    procedure QryPOReleasesREQUEST_DATEChange(Sender: TField);
    procedure QryPOReleasesCalcFields(DataSet: TDataSet);
    procedure QryCurrencyBeforeOpen(DataSet: TDataSet);
    procedure PkAkaBeforeOpen(DataSet: TDataSet);
    procedure TblPoDetailARINVT_IDChange(Sender: TField);
    procedure QryPOReleasesBeforeInsert(DataSet: TDataSet);
    procedure QryPOReleasesBeforeDelete(DataSet: TDataSet);
    procedure TblPoDetailBeforeInsert(DataSet: TDataSet);
    procedure PKPOrdersBeforeOpen(DataSet: TDataSet);
    procedure QryPOTypeBeforeOpen(DataSet: TDataSet);
    procedure PkContactBeforeOpen(DataSet: TDataSet);
    procedure PkAkaOEMBeforeOpen(DataSet: TDataSet);
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure QryPOBeforeOpen(DataSet: TDataSet);
    procedure QryPOAfterInsert(DataSet: TDataSet);
    procedure QryPOAfterPost(DataSet: TDataSet);
    procedure QryPOAfterScroll(DataSet: TDataSet);
    procedure QryPOBeforeCancel(DataSet: TDataSet);
    procedure QryPOBeforeDelete(DataSet: TDataSet);
    procedure QryPOBeforeEdit(DataSet: TDataSet);
    procedure QryPOBeforeInsert(DataSet: TDataSet);
    procedure QryPOBeforePost(DataSet: TDataSet);
    procedure QryPOBeforeScroll(DataSet: TDataSet);
    procedure QryPOCalcFields(DataSet: TDataSet);
    procedure QryPONewRecord(DataSet: TDataSet);
    procedure QryVendorContactBeforeOpen(DataSet: TDataSet);
    procedure TblPoDetailNewRecord(DataSet: TDataSet);
    procedure QryPOAfterCancel(DataSet: TDataSet);
    procedure TblPoDetailAfterInsert(DataSet: TDataSet);
    procedure QryPOReleasesAfterInsert(DataSet: TDataSet);
    procedure QryPOReleasesAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FEdit: Boolean;
    FNewPO: Boolean;
    FNewPONO: string;
    FTotalDetailBeforeChange: Real;
    FIsNewPO_Detail: Boolean;
    FTotalPOBeforeChange: Real;
    FQty: Real;
    FTotalReleasesBeforeEdit: Real;
    FTotalReleasesAfterPost: Real;
    FTaxableBeforeEdit: String;
    FViewPoTotalTAX: Real;
    FPO_Type: String;
    FRequestDate: TDateTime;
    FPromiseDate: TDateTime;
    FOldVendorId: Real;
    FSkipDropShipCheck: Boolean;
    // FOnPOChanged: TOnPoChangedEventHandler;
    // FPOChanges: TPO_Changes;
    FRecalcTaxes: Boolean;
    FLastIncRevPOID: Real;

    procedure AssignArinvtLookupInfo;
    procedure AssignArinvt_VendorLookupInfo(AArinvt_ID, AVendor_ID,
      ARINVT_VENDORS_ID: Real);
    procedure RebuildReleasesSeq(APO_Detail_ID: Real);
    procedure ShowItemInfo(ANew_Arinvt_ID, AVendor_ID, ARINVT_VENDORS_ID: Real);
    function isCurrentApproverValid: Boolean;
    procedure AssignReadOnlyWhenDropShip(ADataSet: TDataSet;
      AIsDropShip: Boolean; const AExcludeFieldsList: array of string);
    procedure UpdatePO_Control_AfterReleasePost(APO_ID: Real);
    function GetDefaultPOType: string;
    function GetDefaultPoTypeAssignedToUser: string;
    function GetTotalReleases: Real;
    procedure CheckAssignReleaseDatesUsingLeadTime;
    procedure UpdatePO_Control(APO_ID: Real);
    procedure AssignDefaultPOBuyer;
    function GetDefaultPoTypeAssignedToVendor(AVendor_ID: Real): string;
    function PO_TypeChanged: Boolean;
    function NeedPOWorkflowDueToPoTypeChange(APO_ID: Real): Boolean;
    procedure CheckPreventChangeonClosedPOLine(const DataSet: TDataSet);

    procedure DetectPOChangesBeforePost;
    procedure DetectPODetailChangesBeforePost;
    procedure UpdatesAfterPoDetailPost;
  public
    { Public declarations }
    SkipCheckMinMax: Boolean;
    SkipCheckUnitPrice: Boolean;
    FDoNotCheckVendorStatus: Boolean;
    FSyncronizingGridFormView: Boolean;
    FPORevHasBeenIncremented: Boolean;

    class function GetReleaseQuanLeftToRecv(APOReleases_ID: Real): Real;
    class procedure CheckPODetailIsDropShip(APO_Detail_ID: Real;
      AAllowAuthorizedProceeding: Boolean = False);
    class procedure ArchivePO(APO_ID: Int64; AIncludeTaxHist: Boolean = True);
    class procedure ArchivePODocuments(APO_ID: Int64);

    function CheckPOBeforeDelete(APO_ID: Real): Boolean;
    procedure CheckIncrementVer(APO_ID: Real);
    procedure PostMCMessage;
    procedure AssignDefaults;
    procedure AssignApprovedBy(APO_ID: Real; AAllowApproved: Boolean = True);
    function CanAutoApprovePO: Boolean;
    function ApprovedByCanChange(var S: string): Boolean;
    function IsCurrentlyApproved: Boolean;
    function IsCurrentlyDenied: Boolean;
    function GetReleasesQuanTotal(APoDetail_ID: Real): Real;
    function IsPoTypeAssignedToUser(APoType: string): Boolean;
    procedure SuspendOpeningTables;
    procedure EnsureTablesOpen;
    function GetOutsourceWorkorder_ID: Real;
    function GetPONumber: String;
    procedure CheckExistsResetPOWorkflow(APO_ID: Real);
    procedure CheckExistsDeletePOWorkflow(APO_ID: Real);
    function CheckConvertQty(AArinvt_ID, AQty: Real;
      APODetailUOM, AArinvtUOM: string): Real;
    procedure GetReleaseDatesUsingLeadTime(var ADate: TDateTime);
    function CheckTaxCalculated: Boolean;
    procedure GetTaxes;
    function IsNewPO: Boolean;

    // procedure ReportChanges(APoChanges: TPO_Changes);

    property SkipDropShipCheck: Boolean read FSkipDropShipCheck
      write FSkipDropShipCheck;
    // property OnPOChanged : TOnPoChangedEventHandler read FOnPOChanged write FOnPOChanged;
  end;

var
  DM_PO: TDM_PO;

implementation

{$R *.DFM}

uses
  // Avalara,
  // Car_Eco_Chk,
  // ChkPoBlanketQty,
  // DM_OR,
  // IqMesg,
  // IqMisc,
  IQMS.Common.Numbers,
  // IQRegFrm,
  // IqSecMan,
  // IqSeq,
  IQMS.Common.Sequence,
  // IqString,
  // IQUoM,
  // IqUsrMsg,
  // McShare,
  // PanelMsg,
  po_base,
  // po_chk_release_received,
  // PO_ChkAP,
  // PO_ChkStatusChange,
  // po_rscstr,
  // po_sec_conf_drop_ship_change,
  // Po_Share,
  // po_wf_main,
  // POChkInv,
  // POChkRec,
  // PoConf,
  // Qk_base,
  // Qk_InvAl,
  // Sys_Share,
  System.Math;
// VStatChk;

class procedure TDM_PO.CheckPODetailIsDropShip(APO_Detail_ID: Real;
  AAllowAuthorizedProceeding: Boolean = False);
var
  ADrop_Ship_Ord_Detail_ID: Real;
  S: string;
begin
  ADrop_Ship_Ord_Detail_ID := SelectValueByID('drop_ship_ord_detail_id',
    'po_detail', APO_Detail_ID);
  if ADrop_Ship_Ord_Detail_ID = 0 then
    Exit;

  // S:= SelectValueFmtAsString('select o.orderno from ord_detail d, orders o where d.id = %f and d.orders_id = o.id', [ ADrop_Ship_Ord_Detail_ID ]);
  S := SelectValueFmtAsString
    ('select orderno from v_ord_comb where ord_detail_id = %f',
    [ADrop_Ship_Ord_Detail_ID]);

  if not AAllowAuthorizedProceeding then
    // po_rscstr.cTXT0000092 =
    // 'This is a drop ship PO associated with a sales order # %s.'#13+
    // 'Direct PO modifications or receipts are not allowed.'#13+
    // 'Changes must be made to the associated sales order.'
    // raise Exception.CreateFmt(po_rscstr.cTXT0000092, [ S ]);

    // AAllowAuthorizedProceeding = True
    // po_rscstr.cTXT0000093 =
    // 'This is a drop ship PO associated with a sales order # %s.'#13 +
    // 'Modifications should be made to the associated sales order.'#13#13+
    // 'Are you sure you want to continue?';
    // if TFrmPOSecConfDropShipChange.DoShowModal(Format(po_rscstr.cTXT0000093,
    // [S])) <> mrYes then
    // ABORT;
end;

procedure TDM_PO.AssignDefaults;
var
  nCompId: Real;
  nTaxCodeId: Real;
  A: Variant;
  AIsTaxable: string;
  AFOB: string;
  AFreight_ID: Real;
  ATaxCodesId: Real;
  APr_Emp_ID: Real;
  ADefaultShipToId: Real;
begin
  QryPOPO_DATE.AsDateTime := Date;

  ADefaultShipToId := SelectValueFmtAsFloat
    ('select default_ship_to from vendor where id = %.0f',
    [QryPOVENDOR_ID.AsFloat]);

  if ADefaultShipToId <> 0 then
    QryPOSHIP_TO_ID.AsFloat := ADefaultShipToId;
  // else
  // QryPOSHIP_TO_ID.asFloat:= Get_Default_Company_ID;  {in Sys_Share.pas}
  // QryPOUSERID.asString    := SecurityManager.UserName;

  AssignDefaultPOBuyer;

  // APr_Emp_ID:= SelectValueFmtAsFloat(
  // 'select pr_emp_id from s_user_general where rtrim(user_name) = ''%s''',
  // [SecurityManager.UserName]);
  if APr_Emp_ID > 0 then
    QryPOPR_EMP_ID_RQSTNR.AsFloat := APr_Emp_ID;

  { Default vendor values }
  AIsTaxable := 'N';
  AFOB := '';
  AFreight_ID := 0;
  A := SelectValueArrayFmt
    ('select NVL(taxable, ''N''), FOB, NVL(Freight_ID,0), ' +
    'NVL(tax_code_id, 0), NVL(taxable, ''N'') as taxable ' +
    'from vendor where id = %.0f', [QryPOVENDOR_ID.AsFloat]);
  if VarArrayDimCount(A) > 0 then
  begin
    AIsTaxable := System.Variants.VarToStr(A[0]);
    AFOB := System.Variants.VarToStr(A[1]);
    AFreight_ID := System.Variants.VarAsType(A[2], varInt64);

    if System.Variants.VarToStr(A[4]) = 'Y' then
      ATaxCodesId := System.Variants.VarAsType(A[3], varInt64)
  end;

  // 03-09-2015 EIQ-6308 Vendor Master -> add new tab in for "Vendor Specific Settings"
  // AFOB:= SelectValueFmtAsString('select po_misc.default_vendor_eplant_cparam( %f, %f,''FOB'') from dual',
  // [ QryPOVENDOR_ID.asFloat,
  // SecurityManager.EPlant_ID_AsFloat ]);
  // AFreight_ID:= SelectValueFmtAsFloat('select po_misc.default_vendor_eplant_nparam( %f, %f, ''FREIGHT_ID'') from dual',
  // [ QryPOVENDOR_ID.asFloat,
  // SecurityManager.EPlant_ID_AsFloat ]);
  if Trim(AFOB) > '' then
    QryPOFOB.asString := AFOB;
  if AFreight_ID > 0 then
    QryPOFREIGHT_ID.AsFloat := AFreight_ID;
  if ATaxCodesId > 0 then
    QryPOTAX_CODE_ID.AsFloat := ATaxCodesId;

  // nCompId:= Get_Default_Company_ID; {Sys_Share.pas}
  if nCompId <> 0 then
  begin
    QryPOCOMPANY_ID.AsFloat := nCompId;
    if (AIsTaxable = 'Y') and (ATaxCodesId = 0) then
    begin
      nTaxCodeId := SelectValueFmtAsFloat
        ('select tax_code_id from company where id = %.0f',
        [QryPOCOMPANY_ID.AsFloat]);
      if (nTaxCodeId <> 0) then
        QryPOTAX_CODE_ID.AsFloat := nTaxCodeId;
    end;
  end;

  FNewPONO := GetPONumber;
  QryPOPONO.asString := FNewPONO;
end;

function TDM_PO.GetPONumber: String;
var
  AEPlant_ID: string;
begin
  // Result:= GetEPlantNextSequenceNumber( AEPlant_ID, 'PO', 'S_PONO' );
  // AEPlant_ID:= SecurityManager.EPlant_ID;
  Result := GetEPlantNextSequenceNumberB(AEPlant_ID, 'PO', 'S_PONO');

  if AEPlant_ID <> 'NULL' then
    QryPOEPLANT_ID.AsFloat := StrToFloat(AEPlant_ID)
  else
    QryPOEPLANT_ID.Clear;
end;

procedure TDM_PO.TblPoDetailBeforeEdit(DataSet: TDataSet);
var
  ATaxRate: Real;
begin
  CheckPreventChangeonClosedPOLine(DataSet);
  TFrmPoBase(Owner).FwwBlanketQtyIsChanging := False;

  IQPostParentsBeforeEdit(DataSet); { in IQlib }

  // AssignReadOnlyWhenDropShip( DataSet,
  // SelectValueByID('drop_ship_ord_detail_id', 'po_detail', TblPoDetailID.asFloat ),
  // ['UNIT_PRICE', 'PRICE_PER_1000', 'UNIT', 'CMTLINE', 'CLOSED', 'TAXABLE',
  // 'REF_CODE_ID', 'REF_CODE_DESCRIP', 'GLACCT_ID_INV', 'STD_COST' ]);

  if not SkipDropShipCheck then
    CheckPODetailIsDropShip(TblPoDetailID.AsFloat, True); // 02-25-2013

  FTaxableBeforeEdit := TblPoDetailTAXABLE.asString;
  ATaxRate := SelectValueFmtAsFloat
    ('select tot_tax_rate from tax_codes where id = %f',
    [QryPOTAX_CODE_ID.AsFloat]);

  FViewPoTotalTAX := TblPoDetailUNIT_PRICE.AsFloat *
    TblPoDetailTOTAL_QTY_ORD.AsFloat * ATaxRate / 100;

  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;

  FPO_Type := QryPOPO_TYPE.asString;
end;

procedure TDM_PO.TblPoDetailBeforePost(DataSet: TDataSet);
var
  ACost: Real;
  AStdPrice: Real;
  AConfirm: Integer;
begin
  // if not FDoNotCheckVendorStatus then
  // CheckVendStatusFor( QryPOVENDOR_ID.asFloat, ['Not Approved', 'Not Active'] );  {in VStatChk.pas}

  {
    AStdPrice := SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [TblPoDetailARINVT_ID.asFloat]);

    // 06/16/2011 Display prompt only if for an inventory item, not MISC item.
    if (TblPoDetailARINVT_ID.AsFloat > 0) and
    (TblPoDetailUNIT_PRICE.asFloat - AStdPrice > 0.000000000001) and
    not SkipCheckUnitPrice then
    begin
    AConfirm := IQDialogChkEx( TFrmPOConfStdPrice, po_rscstr.cTXT0000063, 'PO_ConfirmStdPrice' ); // POCheckStdPrice.pas
    if AConfirm <> 1 then
    raise Exception.Create(po_rscstr.cTXT0000064);
    end;
  }

  // Check unit price
  // if not SkipCheckUnitPrice then
  // PO_Share.CheckArinvtUnitPriceAgainstStdPrice(
  // TblPoDetailARINVT_ID.AsLargeInt,
  // TblPoDetailUNIT_PRICE.AsFloat);

  // Check GL Account Inv
  // if not TFrmPoBase(self.Owner).FAssigningCostSource and
  // (TblPoDetailCOST_OBJECT_SOURCE.AsString  = '') and
  // PO_Share.GLAccountRequiresCostSource(TblPoDetailGLACCT_ID_INV.AsLargeInt) then
  // po_rscstr.cTXT0000058 = 'GL Account requires entry of a Cost Source.';
  // raise exception.create(po_rscstr.cTXT0000058);

  {
    if not TFrmPoBase(self.Owner).FAssigningCostSource then
    try
    if TblPoDetailGLACCT_ID_INV.AsFloat <> 0 then
    if (SelectValueFmtAsString(
    'select NVL(COST_SOURCE_RQD, ''N'') from glacct where id = %f',
    [TblPoDetailGLACCT_ID_INV.AsFloat]) = 'Y') and (TblPoDetailCOST_OBJECT_SOURCE.AsString  = '') then
    raise exception.create(po_rscstr.cTXT0000058);
    finally
    TFrmPoBase(self.Owner).FAssigningCostSource := False;
    end;
  }
  // Always reset flag
  TFrmPoBase(self.Owner).FAssigningCostSource := False;


  // if Empty(TblPoDetailMISC_ITEM.asString) and
  // (TblPoDetailARINVT_ID.asFloat = 0) and Empty(TblPoDetailCMTLINE.asString) then
  // po_rscstr.cTXT0000124 = 'Row cannot be left blank';
  // raise Exception.Create(po_rscstr.cTXT0000124);


  // if not ((TblPoDetailARINVT_ID.asFloat <> 0) and
  // (SelectValueByID('non_material', 'arinvt', TblPoDetailARINVT_ID.asFloat) <> 'Y')) then
  // if (SelectValueAsString('select NVL(Post_Non_Inventory, ''N'') from iqsys') = 'Y') and
  // (TblPoDetailGLACCT_ID_INV.asFloat = 0) then
  // po_rscstr.cTXT0000125 = 'Please select a GL Account.';
  // raise Exception.Create(po_rscstr.cTXT0000125);


  // if (not Empty(TblPoDetailMISC_ITEM.asString))
  // and (TblPoDetailARINVT_ID.asFloat = 0)
  // and (TblPoDetailGLACCT_ID_INV.asFloat = 0)
  // and (SelectValueAsString(
  // 'select NVL(PO_REQ_GL_ACCOUNT, ''N'') from iqsys2 where rownum < 2') = 'Y') then
  // po_rscstr.cTXT0000125 = 'Please select a GL Account.';
  // raise Exception.Create(po_rscstr.cTXT0000125);

  { Std_Cost is used in V_VENDOR_ANALYSIS. Keep it in Inventory Native uom }
  if TblPoDetailSTD_COST.asString = '' then
    TblPoDetailSTD_COST.AsFloat := TblPoDetailStd_Cost_Arinvt.AsFloat;

  // if not SkipCheckMinMax then  {03-09-2009 - SkipCheckMinMax is assigned True for drop ship po initiated from sales orders form}
  // if TblPoDetailTOTAL_QTY_ORD.asString <> '' then
  // CheckPODetail_Inv( QryPOID.asFloat,                                     {in POChkInv.pas}
  // TblPoDetailARINVT_ID.asFloat,
  // TblPoDetailDIVISION_ID.asFloat,
  // self.CheckConvertQty( TblPoDetailARINVT_ID.asFloat,
  // TblPoDetailTOTAL_QTY_ORD.asFloat,
  // TblPoDetailUNIT.asString,
  // TblPoDetailArinvt_Unit.asString ));
  { when adding or changing arinvt }
  if SelectValueByID('arinvt_id', 'po_detail', TblPoDetailID.AsFloat) <>
    TblPoDetailARINVT_ID.AsFloat then
  begin
    // PO_Receipts
    // if SelectValueFmtAsInteger(
    // 'select 1 from po_receipts where po_detail_id = %f and rownum < 2',
    // [TblPoDetailID.asFloat]) = 1 then
    // po_rscstr.cTXT0000126 =
    // 'Receipts have been created for this PO line item. Changing ' +
    // 'the Item # is not permitted.';
    // raise Exception.Create(po_rscstr.cTXT0000126);

    // CAR & ECO
    // CheckCAR_ECO_Exists(TblPoDetailARINVT_ID.asFloat);   {Car_Eco_Chk.pas}
  end;

  DetectPODetailChangesBeforePost;

  IQAssignIDBeforePost(DataSet); { in IQlib }
end;

procedure TDM_PO.TblPoDetailCalcFields(DataSet: TDataSet);
begin
  if not TUniForm(Owner).Showing then
    Exit;

  TblPoDetailCost_Source.asString := SelectValueFmtAsString
    ('SELECT iqms.cost_source.get_cost_object_display(cost_object_source,  '#13
    + '                                                cost_object_id)      '#13
    + '  FROM po_detail                                                     '#13
    + ' WHERE id = %d                                                       ',
    [TblPoDetailID.AsLargeInt]);

  AssignArinvtLookupInfo;

  AssignArinvt_VendorLookupInfo(TblPoDetailARINVT_ID.AsFloat,
    QryPOVENDOR_ID.AsFloat, TblPoDetailARINVT_VENDORS_ID.AsFloat);

  // TblPoDetailTotal.asFloat := IQRoundEx(TblPoDetailTOTAL_QTY_ORD.asFloat *
  // TblPoDetailUNIT_PRICE.asFloat, 2);

  TblPoDetailQty_Received.AsFloat := SelectValueFmtAsFloat
    ('select qty_received from c_po_receipts_total where po_detail_id = %f',
    [TblPoDetailID.AsFloat]);

  TblPoDetailQty_OnOrder.AsFloat := SelectValueFmtAsFloat
    ('select quan from c_po_releases_total where po_detail_id = %f',
    [TblPoDetailID.AsFloat]);
  TblPoDetailQty_OnOrder.AsFloat :=
    System.Math.Max(0, TblPoDetailQty_OnOrder.AsFloat -
    TblPoDetailQty_Received.AsFloat);
  TblPoDetailTaxCode.asString := SelectValueFmtAsString
    ('select tax_code from tax_codes where id = %f',
    [TblPoDetailTAX_CODE_ID.AsFloat]);

  TblPoDetailGLAcct.asString := SelectValueByID('acct', 'glacct',
    TblPoDetailGLACCT_ID_INV.AsLargeInt);

  TblPoDetailDivision_Name.asString := SelectValueByID('name', 'division',
    TblPoDetailDIVISION_ID.AsLargeInt);

end;

procedure TDM_PO.TblPoDetailNewRecord(DataSet: TDataSet);
begin
  TblPoDetailID.AsLargeInt := GetNextID(TblPoDetail.TableName);
  // if SecurityManager.EPlant_ID_AsFloat > 0 then
  // TblPoDetailEPLANT_ID.asFloat:= SecurityManager.EPlant_ID_AsFloat;
end;

procedure TDM_PO.AssignArinvtLookupInfo;
begin
  if TblPoDetailARINVT_ID.AsLargeInt = 0 then
  begin
    TblPoDetailDisp_Descript.asString := TblPoDetailMISC_ITEM.asString;
    // if TblPoDetailMISC_ITEM.AsString <> '' then
    // po_rscstr.cTXT0000094 = 'Misc. Item';
    // TblPoDetailItemNumber.asString:= Nz(TblPoDetailMISC_ITEMNO.asString,
    // po_rscstr.cTXT0000094);
    // TblPoDetailClass.Clear;
  end
  else
  begin
    with TFDQuery.Create(nil) do
      try
        Connection := TblPoDetail.Connection;
        SQL.Add('SELECT itemno,');
        SQL.Add('       descrip,');
        SQL.Add('       descrip2,');
        SQL.Add('       class,');
        SQL.Add('       rev,');
        SQL.Add('       unit,');
        SQL.Add('       std_cost,');
        SQL.Add('       eplant_id,');
        SQL.Add('       non_material');
        SQL.Add('  FROM arinvt');
        SQL.Add(Format(' WHERE id = %.0f', [TblPoDetailARINVT_ID.AsFloat]));
        Open;
        if not(Bof and Eof) then
        begin
          TblPoDetailItemNumber.asString := Fields[0].asString;
          TblPoDetailDescription.asString := Fields[1].asString;
          TblPoDetailDescrip2.asString := Fields[2].asString;
          TblPoDetailClass.asString := Fields[3].asString;
          TblPoDetailRev.asString := Fields[4].asString;
          TblPoDetailArinvt_Unit.asString := Fields[5].asString;
          TblPoDetailStd_Cost_Arinvt.AsFloat := Fields[6].AsFloat;
          TblPoDetailArinvtEplant_id.asString := Fields[7].asString;
          TblPoDetailNon_Material.asString := Fields[8].asString;
          TblPoDetailDisp_Descript.asString := TblPoDetailDescription.asString;
        end;
      finally
        Free;
      end;
  end;
end;

procedure TDM_PO.AssignArinvt_VendorLookupInfo(AArinvt_ID, AVendor_ID,
  ARINVT_VENDORS_ID: Real);
var
  A: Variant;
begin
  if (AArinvt_ID = 0) or (AVendor_ID = 0) then
  begin
    TblPoDetailVendor_ItemNo.Clear;
    TblPoDetailVendor_Descrip.Clear;
    TblPoDetailVendor_Descrip2.Clear;
    TblPoDetailOEM_Vendor.Clear;
  end
  else
  begin
    if ARINVT_VENDORS_ID = 0 then
      A := SelectValueArrayFmt
        ('select vend_itemno, vend_descrip, vend_descrip2, vend_rev ' +
        'from arinvt_vendors where arinvt_id = %f and vendor_id = %f order by seq',
        [AArinvt_ID, AVendor_ID])
    else
      A := SelectValueArrayFmt
        ('select vend_itemno, vend_descrip, vend_descrip2, vend_rev ' +
        'from arinvt_vendors where id = %f', [ARINVT_VENDORS_ID]);

    if VarArrayDimCount(A) > 0 then
    begin
      TblPoDetailVendor_ItemNo.asString := System.Variants.VarToStr(A[0]);
      TblPoDetailVendor_Descrip.asString := System.Variants.VarToStr(A[1]);
      TblPoDetailVendor_Descrip2.asString := System.Variants.VarToStr(A[2]);
      TblPoDetailVend_Aka_Rev.asString := System.Variants.VarToStr(A[3]);
    end;

    TblPoDetailOEM_Vendor.asString := SelectValueFmtAsString
      ('select v.vendorno from vendor v, vendor_oem_dist d ' +
      'where v.id = d.oem_vendor_id and d.dist_vendor_id = %.0f', [AVendor_ID]);
  end;
end;

procedure TDM_PO.UpdatesAfterPoDetailPost;
begin
  Reopen(ViewPoTotal);
  UpdatePO_Control(QryPOID.AsFloat);
  FEdit := True;
  FIsNewPO_Detail := False;
  if FEdit then
    CheckIncrementVer(QryPOID.AsFloat);
end;

procedure TDM_PO.DetectPOChangesBeforePost;
begin
  // if VarCompareValue(QryPOTERMS_ID.OldValue, QryPOTERMS_ID.NewValue) <> vrEqual then
  // FPoChanges := FPoChanges + [pocTERMS_CHANGED];
end;

procedure TDM_PO.DetectPODetailChangesBeforePost;
begin
  if TblPoDetail.State = dsInsert then
    Exit;

  { case VarCompareValue(TblPoDetailUNIT_PRICE.NewValue, TblPoDetailUNIT_PRICE.OldValue) of
    vrEqual       : ;
    vrLessThan    : FPoChanges := FPoChanges + [pocUNITPRICE_LOWER];
    vrGreaterThan : FPoChanges := FPoChanges + [pocUNITPRICE_HIGHER];
    vrNotEqual    :
    if VarIsNull(TblPoDetailUNIT_PRICE.NewValue) then
    FPoChanges := FPoChanges + [pocUNITPRICE_LOWER]
    else
    FPoChanges := FPoChanges + [pocUNITPRICE_HIGHER];
    end;

    case VarCompareValue(TblPoDetailTOTAL_QTY_ORD.NewValue, TblPoDetailTOTAL_QTY_ORD.OldValue) of
    vrEqual       : ;
    vrLessThan    : FPoChanges := FPoChanges + [pocUNITQTY_LOWER];
    vrGreaterThan : FPoChanges := FPoChanges + [pocUNITQTY_HIGHER];
    vrNotEqual    :
    if VarIsNull(TblPoDetailTOTAL_QTY_ORD.NewValue) then
    FPoChanges := FPoChanges + [pocUNITQTY_LOWER]
    else
    FPoChanges := FPoChanges + [pocUNITQTY_HIGHER];
    end;

    if VarCompareValue(TblPoDetailGLACCT_ID_INV.NewValue, TblPoDetailGLACCT_ID_INV.OldValue) <> vrEqual then
    FPoChanges := FPoChanges + [pocGL_ACCT_CHANGED];
  }
end;

procedure TDM_PO.TblPoDetailAfterPost(DataSet: TDataSet);
begin
  { if Assigned(FOnPoChanged) and (FPOChanges <> []) then
    try
    FOnPoChanged(FPOChanges);
    finally
    FPOChanges := [];
    end;
  }
  UpdatesAfterPoDetailPost;
  FRecalcTaxes := True;
end;

{procedure TDM_PO.ReportChanges(APoChanges: TPO_Changes);
begin
  if Assigned(FOnPoChanged) and (APoChanges <> []) then
    FOnPoChanged(APoChanges);
end;}

procedure TDM_PO.TblPoDetailAfterDelete(DataSet: TDataSet);
begin
  //if Assigned(FOnPoChanged) then
  //  FOnPoChanged([pocLINEITEMS_DELETED]);

  UpdatesAfterPoDetailPost;
end;

procedure TDM_PO.TblPoDetailAfterInsert(DataSet: TDataSet);
begin
//  if Assigned(FOnPoChanged) then
 //   FOnPoChanged([pocLINEITEMS_ADDED]);

  UpdatesAfterPoDetailPost;
end;

procedure TDM_PO.PKPOrdersIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
  Action := mrOK;
  ResultValue := 0;
  PostMessage(TFrmPoBase(Owner).Handle, wm_Command,
    TFrmPoBase(Owner).New1.Command, 0);
end;

procedure TDM_PO.PostMCMessage;
var
  nId: Integer;
begin
  nId := QryPOCURRENCY_ID.asInteger;
 // if nId = 0 then
 //   nId := Trunc(GetEplantNativeCurrencyId); { in McShare.pas }
 // PostMessage(Application.MainForm.Handle, iq_MCRefreshDataSets, nId, 0);
end;

procedure TDM_PO.UpdatePO_Control(APO_ID: Real);
var
  A: Variant;
  S: string;
  ATaxRate: Real;
  AValue: Real;
  ATotalDetailBeforeChange: Real;
  ACheckDeletePOWorkflow: Boolean;
  AForceWorkflowReset: Boolean;
  ACanAutoApprovePO: Boolean;
begin
  ACheckDeletePOWorkflow := False;
  // 09/23/2015 (Byron, EIQ-7599) Store in variable for re-use.
  ACanAutoApprovePO := CanAutoApprovePO;

 // ExecuteCommandFmt('update po set po_control = ''%s'' where id = %f',
  //  [Format('%s %s', [SecurityManager.UserName, DateTimeToStr(Now)]), APO_ID]);

  { 06-02-2008 po workflow based on templates. 08-27-08 Kicks in only if user cannot approve the PO }
 { if PO_Share.IsPOWorkflowTemplateBased then
  begin
    AForceWorkflowReset := NeedPOWorkflowDueToPoTypeChange(APO_ID);

    if not ApprovedByCanChange(S) then
    begin
      if (FTotalPOBeforeChange < ViewPoTotalTOTAL_AFTER_TAX.AsFloat) or
        FIsNewPO_Detail or AForceWorkflowReset then
        CheckExistsResetPOWorkflow(APO_ID);
      Exit;
    end;
    // CheckExistsDeletePOWorkflow(APO_ID);
    // 12-19-2012 moved below to only delete the workflow if po is getting
    // approved which excludes the RequisitionClass
    ACheckDeletePOWorkflow := True;
  end;
}
  if FTaxableBeforeEdit <> TblPoDetailTAXABLE.asString then
  begin
    ATaxRate := SelectValueFmtAsFloat
      ('select tot_tax_rate from tax_codes where id = %f',
      [QryPOTAX_CODE_ID.AsFloat]);

    if FTaxableBeforeEdit = 'Y' then
      FTotalPOBeforeChange :=
        StrToFloat(Format('%f', [FTotalPOBeforeChange - FViewPoTotalTAX]))
    else
      FTotalPOBeforeChange :=
        StrToFloat(Format('%f',
        [FTotalPOBeforeChange + TblPoDetailUNIT_PRICE.AsFloat *
        TblPoDetailTOTAL_QTY_ORD.AsFloat * ATaxRate / 100]));

    AValue := Abs(FTotalPOBeforeChange - ViewPoTotalTOTAL_AFTER_TAX.AsFloat);
    if AValue - 0.01 < 0.00000001 then
      FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
  end;

  { 03-27-2009 do not attempt to approve automatically when in requisition }
  if TFrmPoBase(self.Owner).IsRequisitionClass then
    Exit;

  if IsCurrentlyDenied and (ViewPoTotalTOTAL.AsFloat > 0) and
    (FTotalPOBeforeChange <> ViewPoTotalTOTAL_AFTER_TAX.AsFloat) and ACanAutoApprovePO
  then
  begin
    A := SelectValueArrayFmt
      ('select rtrim(pono), rtrim(approved_by) from po where id = %f',
      [APO_ID]);
   // if (VarArrayDimCount(A) > 0) and
    // IQDialogChkEx is defined in IQMesg,  TFrmPOChkStatusChange is in PO_ChkStatusChange
    // po_rscstr.cTXT0000091 =
    // 'PO# %s status is ''%s''.'#13#13 +
    // 'About to attempt to approve the PO.';
     // (IQDialogChkEx(TFrmPOChkStatusChange, Format(po_rscstr.cTXT0000091,
    //  [A[0], A[1]]), 'FrmPOChkStatusChange') = 1) then
    begin
      AssignApprovedBy(APO_ID);
      if ACheckDeletePOWorkflow then
        CheckExistsDeletePOWorkflow(APO_ID);
    end;
    Exit;
  end;

  if not IsCurrentlyApproved and (ViewPoTotalTOTAL.AsFloat > 0) and
    (FTotalPOBeforeChange <> ViewPoTotalTOTAL_AFTER_TAX.AsFloat) then
  begin
    AssignApprovedBy(APO_ID, ACanAutoApprovePO);
    if ACheckDeletePOWorkflow then
      CheckExistsDeletePOWorkflow(APO_ID);
    Exit;
  end;

  ATotalDetailBeforeChange := SelectValueFmtAsFloat
    ('select NVL(total_after_tax, 0) from v_po_total where id = %f',
    [QryPOID.AsFloat]);

  if IsCurrentlyApproved then
  begin
    if ((FTotalDetailBeforeChange < ATotalDetailBeforeChange) or
      FIsNewPO_Detail or PO_TypeChanged) then
    begin
      AssignApprovedBy(APO_ID, ACanAutoApprovePO);
      if ACheckDeletePOWorkflow then
        CheckExistsDeletePOWorkflow(APO_ID);
    end;
  end
  else
  begin
   { if ((ATotalDetailBeforeChange > FTotalDetailBeforeChange) and
      not FIsNewPO_Detail and GetPO_RAR_UNITPRICE_HIGHER) or
      (FIsNewPO_Detail and GetPO_RAR_LINEITEMS_ADDED) or PO_TypeChanged then
    begin
      AssignApprovedBy(APO_ID, ACanAutoApprovePO);
      if ACheckDeletePOWorkflow then
        CheckExistsDeletePOWorkflow(APO_ID);

    end;}
  end;
end;

procedure TDM_PO.UpdatePO_Control_AfterReleasePost(APO_ID: Real);
var
  A: Variant;
  S: string;
  ATotalReleases: Real;
  ACheckDeletePOWorkflow: Boolean;
  AForceWorkflowReset: Boolean;
  ACanAutoApprovePO: Boolean;
begin
  ACheckDeletePOWorkflow := False;
  // 09/23/2015 (Byron, EIQ-7599) Store in variable for re-use.
  ACanAutoApprovePO := CanAutoApprovePO;

 // ExecuteCommandFmt('update po set po_control = ''%s'' where id = %f',
 //   [Format('%s %s', [SecurityManager.UserName, DateTimeToStr(Now)]), APO_ID]);

  { 06-02-2008 po workflow based on templates. 08-27-08 Kicks in only if user cannot approve the PO }
{  if PO_Share.IsPOWorkflowTemplateBased then
  begin
    AForceWorkflowReset := NeedPOWorkflowDueToPoTypeChange(APO_ID);
    // 09/15/2015 (Byron, EIQ-7599) Only auto-approve, if System Parameters
    // setting permits it.
    if not ACanAutoApprovePO or not ApprovedByCanChange(S) then
    begin
      if (FTotalPOBeforeChange < ViewPoTotalTOTAL_AFTER_TAX.AsFloat) or
        FIsNewPO_Detail or AForceWorkflowReset then
        CheckExistsResetPOWorkflow(APO_ID);
      Exit;
    end;
    // if workflow exists - delete it and proceed to approve it below
    // CheckExistsDeletePOWorkflow(APO_ID);  12-19-2012 moved below to only delete the workflow if po is getting approved which excludes the RequisitionClass
    ACheckDeletePOWorkflow := True;
  end;
 }
  { 08-18-2009 moved to be after creating a workflow }
  { 03-27-2009 do not attempt to approve automatically when in requisition }
  if TFrmPoBase(self.Owner).IsRequisitionClass then
    Exit;

  FTotalReleasesAfterPost := SelectValueFmtAsFloat
    ('select Sum(NVL(r.quan, 0) * NVL(d.unit_price, 0) * (1 + decode(NVL(d.taxable, ''N''), ''N'', 0, NVL(t.tot_tax_rate, 0)/100))) '
    + '      from po_detail d,                                                              '
    + '           po_releases r,                                                            '
    + '           po p,                                                                     '
    + '           tax_codes t                                                               '
    + '     where r.po_detail_id = d.id                                                     '
    + '       and d.po_id = p.id                                                            '
    + '       and p.id = %f                                                                 '
    + '       and p.tax_code_id = t.id(+)', [QryPOID.AsFloat]);

  ATotalReleases := SelectValueFmtAsFloat
    ('select Sum(NVL(r.quan, 0)) from  po_releases r where r.po_detail_id = %f',
    [TblPoDetailID.AsFloat]);

  if IsCurrentlyDenied and (ViewPoTotalTOTAL.AsFloat > 0) and
    (FTotalReleasesAfterPost <> FTotalReleasesBeforeEdit) and ACanAutoApprovePO
  then
  begin
    A := SelectValueArrayFmt
      ('select rtrim(pono), rtrim(approved_by) from po where id = %f',
      [APO_ID]);
  //  if (VarArrayDimCount(A) > 0) and
    { IQDialogChkEx is defined in IQMesg,  TFrmPOChkStatusChange is in PO_ChkStatusChange }
    // po_rscstr.cTXT0000095 =
    // 'PO # %s status is ''%s''.'#13#13 +
    // 'About to attempt to approve the PO.';
   //   (IQDialogChkEx(TFrmPOChkStatusChange, Format(po_rscstr.cTXT0000095,
    //  [A[0], A[1]]), 'FrmPOChkStatusChange') = 1) then
    begin
      AssignApprovedBy(APO_ID);
      if ACheckDeletePOWorkflow then
        CheckExistsDeletePOWorkflow(APO_ID);
    end;
    Exit;
  end;

  if not IsCurrentlyApproved and (ViewPoTotalTOTAL.AsFloat > 0) and
    (FTotalReleasesAfterPost < FTotalReleasesBeforeEdit) then
  begin
    AssignApprovedBy(APO_ID, ACanAutoApprovePO);
    if ACheckDeletePOWorkflow then
      CheckExistsDeletePOWorkflow(APO_ID);
    Exit;
  end;

  if IsCurrentlyApproved and (ViewPoTotalTOTAL.AsFloat > 0) and
    (FTotalReleasesAfterPost > FTotalReleasesBeforeEdit) and
    (ATotalReleases > TblPoDetailTOTAL_QTY_ORD.AsFloat) //and GetPO_RAR_RELEASES_ADDED
  then
  begin
    AssignApprovedBy(APO_ID, ACanAutoApprovePO);
    if ACheckDeletePOWorkflow then
      CheckExistsDeletePOWorkflow(APO_ID);
    Exit;
  end;
end;

procedure TDM_PO.CheckPreventChangeonClosedPOLine(const DataSet: TDataSet);
var
  AWasAlreadyClosed: Boolean;
begin
  // EIQ-5582 SER #6199 - Add an option (parameter) to not allow changes to a closed PO line AMB 01-14-15
  AWasAlreadyClosed := SelectValueFmtAsString
    ('select nvl(closed, ''N'') from po_detail where id = %f',
    [TblPoDetailID.AsFloat]) = 'Y';

  if (GetSwitch('NOCHNG_CLSD_PO_DETAIL', 'IQSYS2') = 'Y') and
    (TblPoDetailCLOSED.asString = 'Y') and (AWasAlreadyClosed) then
  begin
    // 'Unable to modify a closed PO Line. Check with your DBA';
   // IQError(po_rscstr.cTXT0000084);
    DataSet.Cancel;
    ABORT;
  end;
end;

procedure TDM_PO.CheckExistsDeletePOWorkflow(APO_ID: Real);
begin
  ExecuteCommandFmt
    ('delete from wf_header where kind = ''PO'' and source_id = %f', [APO_ID]);
end;

function TDM_PO.isCurrentApproverValid: Boolean;
begin
  Result := SelectValueFmtAsString
    ('SELECT po_misc.isassignedapprovervalid(%d) AS val FROM DUAL',
    [QryPOID.AsLargeInt]) = 'Y';
end;

procedure TDM_PO.AssignApprovedBy(APO_ID: Real; AAllowApproved: Boolean);
var
  S: string;
  AIsApproved: Boolean;
begin
  AIsApproved := ApprovedByCanChange(S);

  // 09/30/2015 (Byron, EIQ-7599)
 // if not AAllowApproved and PO_Share.POStatusApproved(S) then
  //  Exit;

 // if (S <> QryPOAPPROVED_BY.asString) or
 //   (PO_Share.POStatusNotApproved(S) and not isCurrentApproverValid) then
 { begin
    ExecuteCommandFmt('update po set approved_by = ''%s'' where id = %f',
      [S, APO_ID]);
    if AIsApproved then
      PO_Share.CheckExecuteAutoEFormPO(APO_ID);

    if PO_Share.POStatusNotApproved(S) then
    begin
      ExecuteCommandFmt
        ('update po set signoff_userid = NULL, signoff_email_sent = NULL, signoff_date = NULL, signoff_text = NULL where id = %f',
        [APO_ID]);

      if SelectValueAsString('select po_apply_full_wf_on_reject from params') = 'Y'
      then
        ExecuteCommandFmt
          ('update po set signoff_userid_agree = NULL where id = %f', [APO_ID]);
    end;

    QryPO.Refresh;
  end
  }
end;

procedure TDM_PO.CheckExistsResetPOWorkflow(APO_ID: Real);
var
  AWF_Header_ID: Real;
begin
 // if PO_Share.IsPOWorkflowTemplateBased then
 // begin
 //   AWF_Header_ID := TFrmPOWorkflowMain.EnsurePOWorkflowExists(self, APO_ID);
    { po_wf_main.pas }
  //  TFrmPOWorkflowMain.ResetPOWorkflow(AWF_Header_ID);
 // end;
 // ExecuteCommandFmt
 //   ('update po set approved_by = ''Not Approved'' where id = %f', [APO_ID]);
 // QryPO.Refresh;
end;

procedure TDM_PO.AbortOnInsert(DataSet: TDataSet);
begin
  // po_rscstr.cTXT0000096 = 'No PO workflow exists.  Operation aborted.';
 // IQAssert(QryWFHeaderID.AsFloat > 0, po_rscstr.cTXT0000096);
  ABORT; // precaution
end;

function TDM_PO.CanAutoApprovePO: Boolean;
begin
  // 07/16/2015 EIQ-7599 Check System Parameter setting.
  Result := SelectValueAsString('SELECT NVL(do_not_auto_approve_po,''N'')'#13 +
    '  FROM iqsys2'#13 + ' WHERE ROWNUM < 2') <> 'Y';
end;

function TDM_PO.ApprovedByCanChange(var S: string): Boolean;
var
  AReleasesTotal: Real;
  AMaxTotal: Real;
begin
  AReleasesTotal := GetTotalReleases;

  if AReleasesTotal >= ViewPoTotalTOTAL_AFTER_TAX.AsFloat then
    AMaxTotal := AReleasesTotal
  else
    AMaxTotal := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;

 // S := SelectValueFmtAsString
 //   ('select po_misc.approved_by(misc.getusername, %f, ''PO'', ''%s'', %f) from dual',
 //   [AMaxTotal, FixStr(QryPOPO_TYPE.asString), QryPOID.AsFloat]);
  // 09/23/2015 (Byron, EIQ-7599) Use shared method.
 // Result := not PO_Share.POStatusNotApproved(S);
end;

class procedure TDM_PO.ArchivePO(APO_ID: Int64; AIncludeTaxHist: Boolean);
begin
  ExecuteCommandFmt('BEGIN iqms.po_archive.archive_po(%d, %d); END;',
    [APO_ID, Integer(AIncludeTaxHist)]);
end;

class procedure TDM_PO.ArchivePODocuments(APO_ID: Int64);
begin
  ExecuteCommandFmt('BEGIN iqms.po_archive.archive_po_docs(%d); END;',
    [APO_ID]);
end;

procedure TDM_PO.CheckIncrementVer(APO_ID: Real);
var
  aPORevExists: Boolean;
begin
  aPORevExists := False;

  if not FPORevHasBeenIncremented then
  begin
    aPORevExists := 1 = SelectValueFmtAsInteger
      ('select 1 from po where id = %f and nvl(rev, 0) > 0', [APO_ID]);
    if aPORevExists then
    begin
      // po_rscstr.cTXT0000097 = 'Is this a purchase order revision?';
    //  if not FNewPO and FEdit and IQConfirmYN(po_rscstr.cTXT0000097) then
    //  begin
   //     ExecuteCommandFmt('update po set rev = NVL(rev,0) + 1 where id = %f',
   //       [APO_ID]);
   //     FPORevHasBeenIncremented := True;
    //    FLastIncRevPOID := APO_ID;
    //  end;
    end
    else
    begin
      // Automatically enter rev 1 so they aren't prompted multiple times while editing a new PO.
      ExecuteCommandFmt('update po set rev = NVL(rev,0) + 1 where id = %f',
        [APO_ID]);
      FPORevHasBeenIncremented := True;
      FLastIncRevPOID := APO_ID;
    end;
  end;
end;

procedure TDM_PO.SrcPoDataChange(Sender: TObject; Field: TField);
begin
  PostMCMessage;
  if not(Assigned(Owner) and (Owner <> nil)) then
    Exit;
  with TFrmPoBase(Owner) do
  begin
    if Assigned(dbeApprovedBy) then
    begin
     { dbeApprovedBy.Color :=
        cIIf(PO_Share.POStatusNotApproved(dbeApprovedBy.Text), clYellow,
        cIIf(PO_Share.POStatusDenied(dbeApprovedBy.Text), clRed, clBtnFace));
      // 03-12-2009 we now support 2 separate Vcl.Forms: requisition and purchase order
      Caption := IIf(not IsCurrentlyApproved or IsCurrentlyDenied,
        Format(po_rscstr.cTXT0000062, [Trim(QryPOID.asString),
        Trim(QryPOVENDOR_COMPANY.asString), Trim(QryPOVENDORNO.asString)]),
        Format(po_rscstr.cTXT0000061, [Trim(QryPOPONO.asString),
        Trim(QryPOVENDOR_COMPANY.asString), Trim(QryPOVENDORNO.asString)]));
      // po_rscstr.cTXT0000089 = 'Approved';
      // po_rscstr.cTXT0000090 = 'Status';
      lblApprovedBy.Caption :=
        IIf(IsCurrentlyApproved and not IsCurrentlyDenied,
        po_rscstr.cTXT0000089, po_rscstr.cTXT0000090);
        }
    end;

    if not IsRequisitionClass and Assigned(QryPO) and (QryPO.State = dsBrowse)
    then
      CheckIsDisp_po_id_as_requisition;

    // RewindResetWorkflowApprovalProcess1.Enabled:= FIsWorkflowTemplateBased and
    // SR.Enabled['RewindResetWorkflowApprovalProcess1'] and
    // (dbeApprovedBy.Text = 'Denied');
  end;

  if (Field = QryPOVENDOR_ID) and (QryPO.State in [dsEdit, dsInsert]) then
    QryPOVENDOR_CONTACT_ID.Clear;

  CheckIncrementVer(QryPOID.AsFloat);
end;

procedure TDM_PO.PkArInvtIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
 // Action := DoQuickAppend(TQuickAddAllArinvt, ResultValue);
  { in Qk_base.pas,  Qk_InvAl.pas }
end;

procedure TDM_PO.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
end;

procedure TDM_PO.TblPoDetailBeforeDelete(DataSet: TDataSet);
begin
 // CheckVendStatusFor(QryPOVENDOR_ID.AsFloat, ['Not Approved', 'Not Active']);
  { in VStatChk.pas }
//  IQAssert(SelectValueFmtAsFloat
//    ('select 1 from po_receipts where po_detail_id = %f and rownum < 2',
 //   [TblPoDetailID.AsFloat]) = 0,
  //  po_rscstr.
  //  cTXT0000078 { 'Cannot delete a received item - operation aborted' } );

  CheckPODetailIsDropShip(TblPoDetailID.AsFloat, True);

  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
  FPO_Type := QryPOPO_TYPE.asString;
end;

procedure TDM_PO.PkPO_DetailBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'po_id', QryPOID.AsLargeInt);
end;

procedure TDM_PO.TblPoVENDOR_IDChange(Sender: TField);
var
  aId: Real;
begin
  aId := SelectValueFmtAsFloat('select arcusto_id from vendor where id = %f',
    [QryPOVENDOR_ID.AsFloat]);
  if aId <> 0 then
    QryPOARCUSTO_ID.AsFloat := aId
  else
    QryPOARCUSTO_ID.Clear;
end;

procedure TDM_PO.TblPoDetailAfterScroll(DataSet: TDataSet);
begin
  if TblPoDetail.State in [dsInsert] then
    FTotalDetailBeforeChange := 0
  else
    FTotalDetailBeforeChange := SelectValueFmtAsFloat
      ('select NVL(total_after_tax, 0) from v_po_total where id = %f',
      [QryPOID.AsFloat]);

  FIsNewPO_Detail := TblPoDetail.State = dsInsert;
end;

function TDM_PO.IsCurrentlyApproved: Boolean;
begin
//  with TFrmPoBase(Owner) do
//    Result := Assigned(dbeApprovedBy) and PO_Share.POStatusApproved
 //     (dbeApprovedBy.Text);
end;

function TDM_PO.IsCurrentlyDenied: Boolean;
begin
  //with TFrmPoBase(Owner) do
  //  Result := Assigned(dbeApprovedBy) and
   //   PO_Share.POStatusDenied(dbeApprovedBy.Text);
end;

function TDM_PO.IsNewPO: Boolean;
begin
  Result := QryPOPO_CONTROL.IsNull;
end;

procedure TDM_PO.QryPOReleasesAfterDelete(DataSet: TDataSet);
begin
//  FPOChanges := FPOChanges + [pocRELEASES_DELETED];

  QryPOReleasesAfterPost(DataSet);
end;

procedure TDM_PO.QryPOReleasesAfterInsert(DataSet: TDataSet);
begin
 // FPOChanges := FPOChanges + [pocRELEASES_ADDED];

  // QryPOReleasesAfterPost(DataSet);
end;

procedure TDM_PO.QryPOReleasesAfterPost(DataSet: TDataSet);
var
  ATotal: Real;
  AConfirm: Integer;
  aId: Real;
begin
  UpdatePO_Control_AfterReleasePost(QryPOID.AsFloat);
  RebuildReleasesSeq(TblPoDetailID.AsFloat);
  RefreshDataSetByID(QryPOReleases);

  { Will trigger is this ver change question }
  FEdit := True;

  { Update releases total and check blanket qty }
  ATotal := GetReleasesQuanTotal(TblPoDetailID.AsFloat);
  TFrmPoBase(self.Owner).UpdateReleasesFooter(ATotal);

  // if Abs(ATotal - TblPoDetailTOTAL_QTY_ORD.AsFloat) > 0.00001 then   // 05-28-2010 take out the ABS
  if ATotal - TblPoDetailTOTAL_QTY_ORD.AsFloat > 0.00001 then
  begin
    // po_rscstr.cTXT0000098 =
    // 'The total quantity of the releases (%.4f) for %s is greater ' +
    // 'than the blanket quantity (%.4f).  This may affect PO approval. ' +
    // 'What do you want to do?';
   // AConfirm := IQDialogChkEx(TCheckPoBlanketQty, Format(po_rscstr.cTXT0000098,
   //   [ATotal, TblPoDetailItemNumber.asString, TblPoDetailTOTAL_QTY_ORD.AsFloat]
   //   )); { ChkPoBlanketQty.pas }

    if AConfirm = 1 then
    begin
      aId := QryPOReleasesID.AsFloat;
      TblPoDetail.Edit;
      TblPoDetailTOTAL_QTY_ORD.AsFloat := ATotal;
      TblPoDetail.Post;
      QryPOReleases.Locate('ID', aId, []);
    end;

  end;

 // if Assigned(FOnPoChanged) then
 //   try
 //     FOnPoChanged(FPOChanges);
 //   finally
 //     FPOChanges := [];
  //  end;
end;

function TDM_PO.GetReleasesQuanTotal(APoDetail_ID: Real): Real;
begin
  Result := SelectValueFmtAsFloat
    ('select sum(quan) from po_releases where po_detail_id = %f',
    [APoDetail_ID]);
end;

procedure TDM_PO.RebuildReleasesSeq(APO_Detail_ID: Real);
begin
  ExecuteCommandFmt
    ('declare                                                                  '#13
    + '  v_seq  number := 1;                                                    '#13
    + 'begin                                                                    '#13
    + '   for v in ( select rowid as row_id,                                    '#13
    + '                     NVL(seq,0) as seq                                   '#13
    + '                from po_releases                                         '#13
    + '               where po_detail_id = %.0f                                 '#13
    + '            order by promise_date )                                      '#13
    + '   loop                                                                  '#13
    + '     if v_seq <> v.seq then                                              '#13
    + '        update po_releases set seq = v_seq where rowid = v.row_id;       '#13
    + '     end if;                                                             '#13
    + '     v_seq := v_seq + 1;                                                 '#13
    + '   end loop;                                                             '#13
    + '   commit;                                                               '#13
    + 'end;                                                                     ',
    [APO_Detail_ID]);
end;

procedure TDM_PO.QryPOReleasesBeforeEdit(DataSet: TDataSet);
begin
  // EIQ-14010 Check security based on the
  // Releases navigator.
  // if not TFrmPoBase(Owner).SR.ReadWrite['NavReleases'] then
  // System.SysUtils.Abort;

  TblPoDetail.CheckBrowseMode;

  // po_rscstr.cTXT0000099 = 'A release must be attached to a PO line';
 // IQAssert(TblPoDetailID.AsFloat > 0, po_rscstr.cTXT0000099);

  CheckPODetailIsDropShip(TblPoDetailID.AsFloat, True); // 02-25-2013

  FQty := QryPOReleasesQUAN.AsFloat;

  FTotalReleasesBeforeEdit := GetTotalReleases;

  FRequestDate := QryPOReleasesREQUEST_DATE.AsDateTime;
  FPromiseDate := QryPOReleasesPROMISE_DATE.AsDateTime;

  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
  FPO_Type := QryPOPO_TYPE.asString;
end;

procedure TDM_PO.QryPOReleasesBeforePost(DataSet: TDataSet);
var
  AConfirm: Integer;
begin
  CheckPreventChangeonClosedPOLine(DataSet);
 // CheckVendStatusFor(QryPOVENDOR_ID.AsFloat, ['Not Approved', 'Not Active']);
  { in VStatChk.pas }
  if (QryPOReleasesID.AsFloat <> 0) and (QryPOReleases.State <> dsInsert) and
    (QryPOReleasesQUAN.AsFloat <> SelectValueFmtAsFloat
    ('select quan from po_releases where id = %f', [QryPOReleasesID.AsFloat]))
    and (QryPOReleasesLeft_To_Recv.AsFloat <= 0) then
  begin
    // po_rscstr.cTXT0000100 = 'Over receipt on purchase order message';
  //  AConfirm := IQDialogChkEx(TFrm_POReceivedReleasesConfirm,
  //    po_rscstr.cTXT0000100, 'Frm_POReceivedReleasesConfirm');
  //  if AConfirm <> 1 then
   //   ABORT;
  end;

  // po_rscstr.cTXT0000101 = 'Please enter a Request Date.';
 // IQAssert(QryPOReleasesREQUEST_DATE.AsDateTime > 0, po_rscstr.cTXT0000101);
  // po_rscstr.cTXT0000102 = 'Please enter a Promise Date.';
//  IQAssert(QryPOReleasesPROMISE_DATE.AsDateTime > 0, po_rscstr.cTXT0000102);
  // po_rscstr.cTXT0000103 = 'Release quantity must be greater than 0.00.';
//  IQAssert(QryPOReleasesQUAN.AsFloat > 0, po_rscstr.cTXT0000103);

 // TOE_DM.CheckReleaseDates(DataSet, FPromiseDate, FRequestDate); // dm_or.pas

  if QryPOReleasesID.AsFloat = 0 then
    QryPOReleasesID.AsFloat := GetNextID('PO_RELEASES');

  if QryPOReleasesPO_DETAIL_ID.AsFloat <> TblPoDetailID.AsFloat then
    QryPOReleasesPO_DETAIL_ID.AsFloat := TblPoDetailID.AsFloat;

  if QryPOReleasesORIG_QUAN.AsFloat = 0 then
    QryPOReleasesORIG_QUAN.AsFloat := QryPOReleasesQUAN.AsFloat;

  // if FQty <> QryPOReleasesQUAN.asFloat then
  // TFrmPoBase(Owner).CheckMultipleOf( QryPOReleases, TFrmPoBase(Owner).FRelInputCargo);
end;

procedure TDM_PO.QryPOReleasesNewRecord(DataSet: TDataSet);
begin
  if QryPOReleasesID.AsFloat = 0 then
    QryPOReleasesID.AsFloat := GetNextID('PO_RELEASES');
  CheckPreventChangeonClosedPOLine(DataSet);
  QryPOReleasesFORECAST.Value := 'N';
  QryPOReleasesUNIT_PRICE.AsFloat := TblPoDetailUNIT_PRICE.AsFloat;
  QryPOReleasesQUAN.AsFloat := 0;
  QryPOReleasesSEQ.AsFloat := 1 + SelectValueFmtAsFloat
    ('select Max(seq) from po_releases where po_detail_id = %f',
    [TblPoDetailID.AsFloat]);

  // assign promised and required dates based on leadtime
  self.CheckAssignReleaseDatesUsingLeadTime;

  if TFrmPoBase(self.Owner).FormIsCreated then
    TFrmPoBase(self.Owner).GridReleases.SetFocus;
end;

procedure TDM_PO.QryPOReleasesREQUEST_DATEChange(Sender: TField);
begin
  if QryPOReleasesPROMISE_DATE.Value = 0 then
    QryPOReleasesPROMISE_DATE.Value := QryPOReleasesREQUEST_DATE.Value;
end;

procedure TDM_PO.QryPOReleasesCalcFields(DataSet: TDataSet);
begin
  if QryPOReleasesID.AsFloat <> 0 then
    QryPOReleasesLeft_To_Recv.Value := TDM_PO.GetReleaseQuanLeftToRecv
      (QryPOReleasesID.AsFloat);
end;

class function TDM_PO.GetReleaseQuanLeftToRecv(APOReleases_ID: Real): Real;
begin
  Result := SelectValueFmtAsFloat
    ('select greatest(0, quan - nvl(recv_quan,0)) from c_po_releases where id = %f',
    [APOReleases_ID]);
end;

procedure TDM_PO.QryCurrencyBeforeOpen(DataSet: TDataSet);
begin
  IQAssignNativeCurrencyFilter(DataSet);
end;

procedure TDM_PO.PkAkaBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'vendor_id', QryPOVENDOR_ID.AsLargeInt);
end;

procedure TDM_PO.PkAkaOEMBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'po_id', QryPOID.AsLargeInt);
end;

procedure TDM_PO.TblPoDetailARINVT_IDChange(Sender: TField);
begin
  ShowItemInfo(Sender.AsFloat, QryPOVENDOR_ID.AsFloat,
    TblPoDetailARINVT_VENDORS_ID.AsFloat);
end;

procedure TDM_PO.ShowItemInfo(ANew_Arinvt_ID, AVendor_ID,
  ARINVT_VENDORS_ID: Real);
begin
  //PO_Share.PopupItemInfo(ANew_Arinvt_ID, AVendor_ID, ARINVT_VENDORS_ID);
end;

procedure TDM_PO.QryPOReleasesBeforeInsert(DataSet: TDataSet);
begin
  // EIQ-14010 Check security based on the
  // Releases navigator.
  // if not TFrmPoBase(Owner).SR.Insert['NavReleases'] then
  // System.SysUtils.Abort;

  CheckPODetailIsDropShip(TblPoDetailID.AsFloat, True);
  QryPOReleasesBeforeEdit(DataSet);
  FQty := 0;

  FTotalReleasesBeforeEdit := GetTotalReleases;
  FRequestDate := 0;
  FPromiseDate := 0;

  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
  FPO_Type := QryPOPO_TYPE.asString;
end;

procedure TDM_PO.AssignReadOnlyWhenDropShip(ADataSet: TDataSet;
  AIsDropShip: Boolean; const AExcludeFieldsList: array of string);
var
  I: Integer;
begin
  for I := 0 to ADataSet.FieldCount - 1 do
  begin
  //  if not StrInList(ADataSet.Fields[I].FieldName, AExcludeFieldsList) then
  //    if ADataSet.Fields[I].FieldKind = fkData then
   //     ADataSet.Fields[I].ReadOnly := AIsDropShip;
  end;
end;

procedure TDM_PO.QryPOReleasesBeforeDelete(DataSet: TDataSet);
begin
  // EIQ-14010 Check security based on the
  // Releases navigator.
  // if not TFrmPoBase(Owner).SR.Delete['NavReleases'] then
  // System.SysUtils.Abort;

  RefreshDataSetByID(DataSet);
  CheckPreventChangeonClosedPOLine(DataSet);
  with DataSet do
  begin
    if (QryPOReleasesQUAN.AsFloat > 0) and
      (QryPOReleasesLeft_To_Recv.AsFloat = 0) or
      (QryPOReleasesLeft_To_Recv.AsFloat < QryPOReleasesQUAN.AsFloat) and
      (QryPOReleasesLeft_To_Recv.AsFloat > 0) then
    begin
      { IQDialogChkEx is defined in IQMesg,  TFrmPOChkReleaseReceived is in po_chk_release_received.pas }
      // po_rscstr.cTXT0000079 =
      // 'Warning!'#13'Release received in full or Release partially
      // received.'#13#13'Are you sure you want to continue?';
//      if IQDialogChkEx(TFrmPOChkReleaseReceived, po_rscstr.cTXT0000079,
//        'FrmPOChkReleaseReceived') = 0 then
        // po_rscstr.cTXT0000080 =
        // 'This is a full or partial received release - operation aborted
        // per user instruction.'
 //       raise Exception.Create(po_rscstr.cTXT0000080);
    end
  end;

 // CheckVendStatusFor(QryPOVENDOR_ID.AsFloat, ['Not Approved', 'Not Active']);
  { in VStatChk.pas }
  CheckPODetailIsDropShip(TblPoDetailID.AsFloat, True);
  FTotalReleasesBeforeEdit := GetTotalReleases;

  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
  FPO_Type := QryPOPO_TYPE.asString;
end;

procedure TDM_PO.TblPoDetailBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet); { in IQlib }
  if not SkipDropShipCheck then
    CheckPODetailIsDropShip(TblPoDetailID.AsFloat, True); // 02-25-2013
  TFrmPoBase(Owner).FwwBlanketQtyIsChanging := False;
  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
  FPO_Type := QryPOPO_TYPE.asString;
end;

procedure TDM_PO.PKPOrdersBeforeOpen(DataSet: TDataSet);
begin
  if Assigned(self.Owner) and (self.Owner is TFrmPoBase) then
  begin
    with TFrmPoBase(self.Owner) do
    begin
      AssignQueryParamValue(DataSet, 'show_po_id_as_requisition',
        SelectValueAsInteger
        ('select po_misc.disp_po_id_as_requisition from dual'));
    //  AssignQueryParamValue(DataSet, 'requisition_only',
    //    IQMS.Common.Numbers.IIf(IsRequisitionClass, 1, 0));
    //  AssignQueryParamValue(DataSet, 'filter_by_user',
     //   IQMS.Common.Numbers.fIIf(IsFilterByUserID, 1, 0));
//      AssignQueryParamValue(DataSet, 'userid', SecurityManager.UserName);
    end;
  end;
end;

procedure TDM_PO.QryPOAfterCancel(DataSet: TDataSet);
begin
  // 09/15/2015 (Byron, EIQ-7599) Reset after cancel
  FNewPO := False;
end;

procedure TDM_PO.QryPOAfterInsert(DataSet: TDataSet);
begin
  AssignDefaults;
end;

procedure TDM_PO.QryPOAfterPost(DataSet: TDataSet);
var
  APOID, AVendorID, AAkaID: Int64;
begin
  // 03/18/2016 Store these ID values first because some methods may "refresh"
  // the dataset, causing the current record to disappear.
  APOID := QryPOID.AsLargeInt;
  AVendorID := QryPOVENDOR_ID.AsLargeInt;

  // 03/18/2016 Disable controls to reduce blink.  It's not 100 % perfect, since
  // it won't work with InfoPower controls.
  // This is required because the dataset is "refreshed" by other methods,
  // and we need to relocate the original record.
  QryPO.DisableControls;
  try
   // if Assigned(FOnPoChanged) and (FPOChanges <> []) then
   //   try
    //    FOnPoChanged(FPOChanges);
    //  finally
     //   FPOChanges := [];
   //   end;

    if FNewPO then
    begin
      // 03/11/2015 If finished inserting a new record, sync the main form
      // Query Navigator with the new record.  This is required, or the
      // new record will not be visible after other methods (below) refresh
      // QryPO.
      TFrmPoBase(Owner).LocatePO(APOID, True);
     // PopupPOInfo(AVendorID); { in Po_Share.pas }
    end;

   // IQRegStringScalarWrite(self, 'PO_Type', QryPOPO_TYPE.asString);

    Reopen(ViewPoTotal);
    UpdatePO_Control(APOID);

    if TFrmPoBase(Owner).FRefreshPODerails then
    begin
      TblPoDetail.Close;
      TblPoDetail.Open;
      TFrmPoBase(Owner).FRefreshPODerails := False;
    end;
    if (FOldVendorId <> AVendorID) and (FOldVendorId <> 0) then
    begin
      FOldVendorId := AVendorID;
      if TblPoDetail.Eof and TblPoDetail.Bof then
        Exit;
      TblPoDetail.First;
      while not TblPoDetail.Eof do
      begin
        TblPoDetail.Edit;
        AAkaID := SelectValueFmtAsInt64
          ('select id from arinvt_vendors where vendor_id = %d and arinvt_id = %d order by seq',
          [AVendorID, TblPoDetailARINVT_ID.AsLargeInt]);

        if AAkaID <> 0 then
          TblPoDetailARINVT_VENDORS_ID.AsLargeInt := AAkaID
        else
          TblPoDetailARINVT_VENDORS_ID.Clear;

        TFrmPoBase(Owner).AssignUnitPrice;
        TblPoDetail.Post;
        TblPoDetail.next;
      end;
    end;

  finally
    QryPO.EnableControls;
    // 09/15/2015 (Byron, EIQ-7599) Reset switch at end of this event
    FNewPO := False;
    FRecalcTaxes := True;
  end;
end;

procedure TDM_PO.QryPOAfterScroll(DataSet: TDataSet);
begin
  FEdit := False;
  // 09/15/2015 (Byron, EIQ-7599) Do not reset switch here.
  // FNewPO:= False;
  TFrmPoBase(Owner).FOldPONO := '';
  Reopen(QryVendorContact);
  FRecalcTaxes := False;
  if QryPOID.AsFloat <> FLastIncRevPOID then
    FPORevHasBeenIncremented := False;
end;

procedure TDM_PO.QryPOBeforeCancel(DataSet: TDataSet);
begin
 // if (QryPO.State in [dsInsert]) and (QryPOPONO.asString <> '') then
  //  Record_Skipped_Seq('PO', 'PO', 'PONO', QryPOPONO.asString, '',
   //   SKIP_SEQ_CANCEL);
end;

procedure TDM_PO.QryPOBeforeDelete(DataSet: TDataSet);
var
  APO_Detail_ID: Real;
begin
  CheckPOBeforeDelete(QryPOID.AsFloat);
  FPO_Type := '';
end;

function TDM_PO.CheckPOBeforeDelete(APO_ID: Real): Boolean;
var
  APO_Detail_ID: Real;
begin
//  CheckPOReceived_UnInvoiced(APO_ID); { PO_ChkAP.pas }
//  CheckPO_IfReceived(APO_ID); { POChkRec.pas }

  { find at least one po_detail that has associated drop ship sales order }
  APO_Detail_ID := SelectValueFmtAsFloat
    ('select d.id from po_detail d, v_ord_comb o where d.po_id = %f and ' +
    'd.drop_ship_ord_detail_id = o.ord_detail_id and rownum < 2', [APO_ID]);
  CheckPODetailIsDropShip(APO_Detail_ID, True);
  Result := True;
end;

procedure TDM_PO.QryPOBeforeEdit(DataSet: TDataSet);
begin
  FOldVendorId := QryPOVENDOR_ID.AsFloat;
  FPO_Type := QryPOPO_TYPE.asString;
  FTotalPOBeforeChange := ViewPoTotalTOTAL_AFTER_TAX.AsFloat;
end;

procedure TDM_PO.QryPOBeforeInsert(DataSet: TDataSet);
begin
  FOldVendorId := 0;
  FPO_Type := '';
end;

procedure TDM_PO.QryPOBeforeOpen(DataSet: TDataSet);

  procedure _CheckAddToFilter(S: string);
  begin
    if DataSet.Filter > '' then
      DataSet.Filter := DataSet.Filter + ' AND ';
    DataSet.Filter := DataSet.Filter + S;
  end;

begin
//  AssignQueryParamValue(DataSet, 'ID',
//    Trunc(TFrmPoBase(self.Owner).NavHeader.MainID));
//  AssignQueryParamValue(DataSet, 'SCOPE_BATCH',
//    Trunc(TFrmPoBase(self.Owner).NavHeader.ScopeBatch));
  AssignQueryParamValue(DataSet, 'SHOW_ALL',
    Integer(TFrmPoBase(self.Owner).ShowAllMainRecords));

  if Assigned(self.Owner) and (self.Owner is TFrmPoBase) then
  begin
    // TFrmPoBase(self.Owner).AssignPOTableFilter( Dataset );
    if TFrmPoBase(self.Owner).IsRequisitionClass then
      _CheckAddToFilter
        (' (APPROVED_BY is NULL or APPROVED_BY = ''Not Approved'' or APPROVED_BY = ''Denied'') ');
   // if TFrmPoBase(self.Owner).IsFilterByUserID() then
   //   _CheckAddToFilter(Format(' (USERID = ''%s'') ',
    //    [SecurityManager.UserName]));
  end;
end;

procedure TDM_PO.QryPOBeforePost(DataSet: TDataSet);
var
  nPono: Real;
  S: string;
  AReadOnly: Boolean;
begin
  // po_rscstr.cTXT0000104 =
  // 'A Shipping address has not been assigned to the Purchase Order.';
//  if Trim(TFrmPoBase(self.Owner).wwComboShip.Text) = '' then
//    iqmesg.IQWarning(po_rscstr.cTXT0000104);

 // if not FDoNotCheckVendorStatus then
  //  CheckVendStatusFor(QryPOVENDOR_ID.AsFloat, ['Not Approved', 'Not Active']);
  { in VStatChk.pas }

  FEdit := QryPO.State = dsEdit;
  FNewPO := FNewPO or (QryPO.State = dsInsert);

  if QryPOPO_TYPE.asString = '' then
    QryPOPO_TYPE.asString := GetDefaultPOType(); // 'RAW MATERIAL';

 // if (SelectValueAsString('select multicurrency from iqsys') = 'Y') and
 //   (QryPOCURRENCY_ID.AsFloat = 0) then
 //   AssignEPlantCurrency(QryPO, QryPOCURRENCY_ID, 'VENDOR',
 //     QryPOVENDOR_ID.AsFloat);

 // if QryPOPONO.asString = '' then
    // po_rscstr.cTXT0000105 = 'Please enter a PO number.';
  //  raise Exception.Create(po_rscstr.cTXT0000105);

  // po_rscstr.cTXT0000106 =
  // 'This PO number %s already exists in the history table.  ' +
  // 'Please enter a different PO number.';
//  if SelectValueFmtAsFloat('select id from po_hist where pono = ''%s''',
 //   [StrTran(Trim(QryPOPONO.asString), '''', '''''')]) <> 0 then
  //  raise Exception.Create(Format(po_rscstr.cTXT0000106,
   //   [StrTran(Trim(QryPOPONO.asString), '''', '''''')]));

//  if (TFrmPoBase(self.Owner).FOldPONO <> '') and
 //   (TFrmPoBase(self.Owner).FOldPONO <> QryPOPONO.asString) then
 // begin
  //  Record_Skipped_Seq('PO', 'PO', 'PONO', TFrmPoBase(self.Owner).FOldPONO,
 //     StrTran(Trim(QryPOPONO.asString), '''', ''''''), SKIP_SEQ_CHANGE);
    TFrmPoBase(self.Owner).FOldPONO := QryPOPONO.asString;
//  end;

 // if (QryPOSHIP_TO_ID.AsFloat <> SelectValueFmtAsFloat
   // ('select ship_to_id from po where id = %f', [QryPOID.AsFloat])) and
  //  (QryPOSHIP_TO_ID.AsFloat <> QryPOCOMPANY_ID.AsFloat) and
  //  (QryPOSHIP_TO_ID.AsFloat <> 0) then
   // QryPOCOMPANY_ID.AsFloat := QryPOSHIP_TO_ID.AsFloat;

//  DetectPOChangesBeforePost;

 // try
  //  AReadOnly := QryPOID.ReadOnly;
   // QryPOID.ReadOnly := False;
 // finally
  //  QryPOID.ReadOnly := AReadOnly;
 // end;

end;

procedure TDM_PO.QryPOBeforeScroll(DataSet: TDataSet);
begin
  CheckIncrementVer(QryPOID.AsFloat);
  if not CheckTaxCalculated then
    ABORT;
end;

procedure TDM_PO.QryPOCalcFields(DataSet: TDataSet);
begin
  if QryPOBUYER_NAME.asString > '' then
    QryPOBuyerName.asString := QryPOBUYER_NAME.asString
  else
    QryPOBuyerName.asString := QryPOBUYERID.asString;
end;

procedure TDM_PO.QryPONewRecord(DataSet: TDataSet);
var
  AValue: string;
  aId: Int64;
begin
  QryPOID.AsLargeInt := GetNextID('PO');
 // if SecurityManager.EPlant_ID_AsInteger > 0 then
  //  QryPOEPLANT_ID.AsLargeInt := SecurityManager.EPlant_ID_AsInteger;

  TFrmPoBase(Owner).SBSearchVend.Click;

  AValue := GetDefaultPoTypeAssignedToVendor(QryPOVENDOR_ID.AsFloat);

  if AValue = '' then
    AValue := GetDefaultPoTypeAssignedToUser;

 // if AValue > '' then
 //   QryPOPO_TYPE.asString :=
  //    AValue { new way using is_default in s_user_po_type }

//  else if IQRegStringScalarRead(self, 'PO_Type', AValue) and (AValue > '') and
 //   IsPoTypeAssignedToUser(AValue) then
  //  QryPOPO_TYPE.asString := AValue; { old way }

 // QryPOWORKFLOW_ENABLED.asString := 'N';

  // 10/06/2015 (Byron, EIQ-6099) Assign tax code ID from vendor.
  aId := SelectValueFmtAsInt64('SELECT tax_code_id FROM vendor WHERE id = %d',
    [QryPOVENDOR_ID.AsLargeInt]);
  if aId > 0 then
    QryPOTAX_CODE_ID.AsLargeInt := aId;

end;

procedure TDM_PO.QryPOTypeBeforeOpen(DataSet: TDataSet);
begin
  //TFDQuery(DataSet).ParamByName('user_name').asString :=
  //  SecurityManager.UserName;
end;

procedure TDM_PO.QryVendorContactBeforeOpen(DataSet: TDataSet);
begin
  QryVendorContact.ParamByName('VENDOR_ID').AsLargeInt :=
    QryPOVENDOR_ID.AsLargeInt;
end;

function TDM_PO.GetDefaultPoTypeAssignedToUser: string;
begin
 // Result := SelectValueFmtAsString
  //  ('select t.name from s_user_po_type p, po_type t where p.user_name = ''%s'' and p.po_type_id = t.id and p.is_default = ''Y''',
   // [UpperCase(SecurityManager.UserName)]);
end;

function TDM_PO.GetDefaultPOType: string;
const
  cDefaultPoType = 'RAW MATERIAL';
begin
  { 03-01-2011 }
  Result := GetDefaultPoTypeAssignedToUser;
  if Result <> '' then
    Exit;

  { continue the old way }

  // default to raw material
 // Result := SelectValueFmtAsString
 //   ('select t.name from s_user_po_type p, po_type t where p.user_name = ''%s'' and p.po_type_id = t.id and t.name = ''%s''',
  //  [UpperCase(SecurityManager.UserName), cDefaultPoType]);
 // if Result <> '' then
  //  Exit;

  // default to 1st one
//  Result := SelectValueFmtAsString
 //   ('select t.name from s_user_po_type p, po_type t where p.user_name = ''%s'' and p.po_type_id = t.id order by p.id',
  //  [UpperCase(SecurityManager.UserName)]);

  // default to raw material if nothing is assigned
  Result := 'RAW MATERIAL';
end;

function TDM_PO.IsPoTypeAssignedToUser(APoType: string): Boolean;
begin
//  Result := SelectValueFmtAsInteger
 //   ('select 1 from s_user_po_type p, po_type t where p.user_name = ''%s'' and p.po_type_id = t.id and t.name = ''%s''',
  //  [UpperCase(SecurityManager.UserName), FixStr(APoType)]) = 1;
end;

procedure TDM_PO.SuspendOpeningTables;
begin
  QryPO.Tag := 1;
  TblPoDetail.Tag := 1;
  QryPOReleases.Tag := 1;
  ViewPoTotal.Tag := 1;
  QryBreakDownTaxes.Tag := 1;
end;

procedure TDM_PO.EnsureTablesOpen;
begin
  if not QryPO.Active then
    QryPO.Open;
  if not TblPoDetail.Active then
    TblPoDetail.Open;
  if not QryPOReleases.Active then
    QryPOReleases.Open;
  if not ViewPoTotal.Active then
    ViewPoTotal.Open;
  if not QryBreakDownTaxes.Active then
    QryBreakDownTaxes.Open;
  if not wwQryPr_Emp.Active then
    wwQryPr_Emp.Open;
  if not QryCurrency.Active then
    QryCurrency.Open;
  if not QryVendorContact.Active then
    QryVendorContact.Open;
  if not wwQryDivision.Active then
    wwQryDivision.Open;
  if not QryRefCode.Active then
    QryRefCode.Open;
  if not QryFreight.Active then
    QryFreight.Open;
  if not QryTerms.Active then
    QryTerms.Open;
  if not QryFob.Active then
    QryFob.Open;
  if not wwQryRemit.Active then
    wwQryRemit.Open;
  if not wwQryShip.Active then
    wwQryShip.Open;
  if not wwQryTaxCodes.Active then
    wwQryTaxCodes.Open;
end;

function TDM_PO.GetOutsourceWorkorder_ID: Real;
begin
  Result := SelectValueFmtAsFloat
    ('select id from workorder where outsource_po_detail_id = %f',
    [TblPoDetailID.AsFloat]);
end;

procedure TDM_PO.PkContactBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', QryPOVENDOR_ID.AsFloat);
end;

function TDM_PO.GetTotalReleases: Real;
begin
  Result := SelectValueFmtAsFloat
    ('select Sum(NVL(r.quan, 0) * NVL(d.unit_price, 0) * (1 + decode(NVL(d.taxable, ''N''), ''N'', 0, NVL(t.tot_tax_rate, 0)/100))) '
    + '      from po_detail d,                                                              '
    + '           po_releases r,                                                            '
    + '           po p,                                                                     '
    + '           tax_codes t                                                               '
    + '     where r.po_detail_id = d.id                                                     '
    + '       and d.po_id = p.id                                                            '
    + '       and p.id = %f                                                                 '
    + '       and p.tax_code_id = t.id(+)', [QryPOID.AsFloat]);
end;

procedure TDM_PO.GetReleaseDatesUsingLeadTime(var ADate: TDateTime);
begin
  with TFDStoredProc.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      StoredProcName := 'IQMS.PO_MISC.GET_RELEASE_DATES_WITH_LDTIME';
      Params.CreateParam(ftFMTBCD, 'p_po_detail_id', ptInput).AsFMTBCD :=
        TblPoDetailID.AsFloat;
      Params.CreateParam(ftDate, 'p_date', ptInputOutput).AsDateTime := ADate;
      Prepare;
      Execute;
      ADate := ParamByName('p_date').AsDateTime;
    finally
      Free;
    end;
end;

procedure TDM_PO.CheckAssignReleaseDatesUsingLeadTime;
var
  ADate: TDateTime;
begin
  ADate := Date();
  GetReleaseDatesUsingLeadTime(ADate);
  QryPOReleasesPROMISE_DATE.AsDateTime := ADate;
  QryPOReleasesREQUEST_DATE.AsDateTime := ADate;
end;

procedure TDM_PO.AssignDefaultPOBuyer;
begin
  if QryPOBUYERID.asString > '' then
    Exit;

  // no validation is required
  if SelectValueAsString('select po_buyer_validation from iqsys2') <> 'Y' then
  begin
   // QryPOBUYERID.asString := SecurityManager.UserName;
    Exit;
  end;

  // is a buyer
//  if SelectValueFmtAsString
//    ('select po_buyer from s_user_general where rtrim(user_name) = ''%s''',
 //   [SecurityManager.UserName]) = 'Y' then
//  begin
 //   QryPOBUYERID.asString := SecurityManager.UserName;
  //  Exit;
 // end;

  // popup a picklist
  with PkBuyer do
    if Execute then
    begin
      QryPOBUYERID.asString := System.Variants.VarToStr(GetValue('USER_NAME'));
      Exit;
    end;

  if QryPO.State in [dsEdit, dsInsert] then
  begin
    QryPO.Cancel;
    // po_rscstr.cTXT0000077 =
    // 'Buyer is not assigned - operation aborted'
//    raise Exception.Create(po_rscstr.cTXT0000077);
  end;

//  QryPOBUYERID.asString := SecurityManager.UserName;
end;

function TDM_PO.CheckConvertQty(AArinvt_ID, AQty: Real;
  APODetailUOM, AArinvtUOM: string): Real;
begin
  Result := AQty;
  if CompareText(Trim(APODetailUOM), Trim(AArinvtUOM)) = 0 then
    Exit;

//  Result := IQConvertUom(AQty, // AQty
//    APODetailUOM, // AFromUOM
 //   AArinvtUOM, // AToUOM
  //  AArinvt_ID, // AArinvt_ID
   // True); // AIgnoreError
end;

function TDM_PO.GetDefaultPoTypeAssignedToVendor(AVendor_ID: Real): string;
begin
  Result := SelectValueFmtAsString
    ('select t.name from vendor v, po_type t where v.id = %f and ' +
    'v.po_type_id = t.id', [AVendor_ID]);
end;

function TDM_PO.PO_TypeChanged: Boolean;
begin
  Result := FPO_Type <> QryPOPO_TYPE.asString;
end;

function TDM_PO.NeedPOWorkflowDueToPoTypeChange(APO_ID: Real): Boolean;
var
  AWF_Header_ID: Real;
begin
  Result := False;

  // po type changed
  if not PO_TypeChanged then
    Exit;

  // workflow exists
//  AWF_Header_ID := TFrmPOWorkflowMain.GetExistingWorkflowOf(APO_ID);
//  if AWF_Header_ID = 0 then
 //   Exit(True);

  // needs new template
  //if SelectValueByID('wf_type_id', 'wf_header', APO_ID)
  //  = TFrmPOWorkflowMain.GetDefaultWorkflowTemplate_ID(APO_ID) then
   // Exit(False);

  // delete associated workflow
 // CheckExistsDeletePOWorkflow(APO_ID);

  Result := True;
end;

function TDM_PO.CheckTaxCalculated: Boolean;
var
  APromptResult: TModalResult;
begin
  Result := True;
{  if FRecalcTaxes and Avalara.AvalaraEnabled(QryPOEPLANT_ID.AsFloat) then
    if (SelectValueFmtAsString
      ('select nvl(tax_calculated, ''N'') from po where id = %.0f',
      [QryPOID.AsFloat]) = 'N') then
    begin
      // Changes have been made since taxes were last calculated. Recalculate now?
      APromptResult := iqmesg.IQConfirmEx(po_rscstr.cTXT0000132,
        [mbYes, mbNo, mbCancel]);
      if (APromptResult in [mrYes, mrCancel]) then
        Result := False;
      if (APromptResult = mrYes) then
        GetTaxes;
    end;
    }
end;

procedure TDM_PO.GetTaxes;
//var
//  hMsg: TPanelMesg;
begin
  {if Avalara.AvalaraEnabled(QryPOEPLANT_ID.AsFloat) then
  begin
    hMsg := hPleaseWait('Calculating Taxes.  Please wait...');
    try
      with TAvalaraGetTax.Create(self) do
        try
          begin
            GetTax('PO', QryPOID.AsFloat);
            Reopen(ViewPoTotal);
            RefreshDataSetByID(TblPoDetail);
            FOnPoChanged([]);
          end;
        finally
          Free;
        end;
    finally
      if Assigned(hMsg) then
        FreeAndNil(hMsg);
    end;
  end;
  }
end;

end.
