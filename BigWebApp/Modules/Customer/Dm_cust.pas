unit DM_Cust;

interface

uses
  Data.DB,
  MainModule,
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
  IQMS.WebVcl.DataCoordinator,
  IQMS.WebVcl.Hpick,
  { TODO -oathite -cWebConvert : Dpends on IQMS.Common.UserMessages
  IQMS.Common.UserMessages, }
  IQMS.WebVcl.PkHideManager,
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Wwdatsrc,
  Winapi.Windows;


type
  TCust_DM = class(TDataModule)
    SrcArcusto: TDataSource;
    TblArcusto: TFDTable;
    SrcContact: TDataSource;
    TblContact: TFDTable;
    TblArcustoID: TBCDField;
    TblArcustoCUSTNO: TStringField;
    TblArcustoCUST_GROUP: TStringField;
    TblArcustoCOMPANY: TStringField;
    TblArcustoADDR1: TStringField;
    TblArcustoADDR2: TStringField;
    TblArcustoADDR3: TStringField;
    TblArcustoCITY: TStringField;
    TblArcustoSTATE: TStringField;
    TblArcustoCOUNTRY: TStringField;
    TblArcustoZIP: TStringField;
    TblArcustoPHONE_NUMBER: TStringField;
    TblArcustoFAX_NUMBER: TStringField;
    TblArcustoPRIME_CONTACT: TStringField;
    TblArcustoCUST_SINCE: TDateTimeField;
    TblArcustoYTD_SALES: TBCDField;
    TblArcustoTERRITORY: TStringField;
    TblArcustoINDUSTRY: TStringField;
    TblArcustoFINANCE_CHARGE: TStringField;
    TblArcustoCREDIT_LIMIT: TBCDField;
    TblArcustoSTATUS_DATE: TDateTimeField;
    TblArcustoSTATEMENTS: TStringField;
    TblArcustoCUSER1: TStringField;
    TblArcustoCUSER2: TStringField;
    TblArcustoCUSER3: TStringField;
    TblArcustoNUSER1: TFMTBCDField;
    TblArcustoNUSER2: TFMTBCDField;
    TblContactARCUSTO_ID: TBCDField;
    TblContactCONTACT_TYPE: TStringField;
    TblContactCONTACT_SEQNO: TBCDField;
    TblContactSALUTATION: TStringField;
    TblContactLAST_NAME: TStringField;
    TblContactFIRST_NAME: TStringField;
    TblContactTITLE: TStringField;
    TblContactPHONE_NUMBER: TStringField;
    TblContactEXT: TStringField;
    TblContactFAX_NUMBER: TStringField;
    TblContactEMAIL: TStringField;
    TblContactPAGER: TStringField;
    SrcShip_to: TDataSource;
    SrcBill_To: TDataSource;
    TblBill_to: TFDTable;
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
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    TblArcustoEXT: TStringField;
    TblArcustoCOMM_PCNT: TFMTBCDField;
    TblArcustoSOURCE: TStringField;
    TblContactCUSER1: TStringField;
    TblContactCUSER2: TStringField;
    TblBill_toEXT: TStringField;
    TblArcustoTER_ID: TBCDField;
    TblArcustoNUSER3: TFMTBCDField;
    TblArcustoTERMS_ID: TBCDField;
    SrcTerms: TDataSource;
    TblTerms: TFDTable;
    TblTermsID: TBCDField;
    TblTermsDESCRIPTION: TStringField;
    TblTermsDAYS: TBCDField;
    TblTermsDISCOUNT: TBCDField;
    TblTermsDISCOUNT_DAYS: TBCDField;
    TblContactID: TBCDField;
    SrcFreight: TDataSource;
    TblFreight: TFDTable;
    TblArcustoTerms: TStringField;
    SrcTaxCodes: TDataSource;
    TblTaxCodes: TFDTable;
    SrcSalesPeople: TDataSource;
    TblSalesPeople: TFDTable;
    TblArcustoTax_Code: TStringField;
    TblArcustoSalesPerson: TStringField;
    TblArcustoTAX_CODES_ID: TBCDField;
    TblArcustoSALESPEOPLE_ID: TBCDField;
    TblBill_toNOTES: TStringField;
    TblArcustoNOTE: TStringField;
    TblArcustoDISCOUNT: TBCDField;
    TblArcustoSTATUS_ID: TStringField;
    TblArcustoCUSER4: TStringField;
    TblArcustoCUSER5: TStringField;
    TblArcustoCUSER6: TStringField;
    TblArcustoNUSER4: TFMTBCDField;
    TblArcustoNUSER5: TFMTBCDField;
    TblArcustoCUST_TYPE_ID: TBCDField;
    PkArcustoADDR2: TStringField;
    PkArcustoADDR3: TStringField;
    TblBill_toCOMPANY_ID: TBCDField;
    tblCurrency: TFDTable;
    TblArcustoCURRENCY_ID: TBCDField;
    TblArcustoAUTOINVOICE_TECHNIQUE: TStringField;
    TblArcustoPS_DATE_ON_INVOICE: TStringField;
    TblArcustoCOMMISSIONS_ID: TBCDField;
    QryCommissions: TFDQuery;
    QryCommissionsID: TBCDField;
    TblArcustoCommission: TStringField;
    SrcComm: TDataSource;
    QryCommissionsCOMMISSION_PERCENT: TFMTBCDField;
    QryCommissionsDESCRIP: TStringField;
    TblArcustoUSE_USA_MASK: TStringField;
    TblContactUSE_USA_MASK: TStringField;
    TblBill_toUSE_USA_MASK: TStringField;
    QryEPlant: TFDQuery;
    QryEPlantID: TBCDField;
    QryEPlantPLANT_NAME: TStringField;
    PkContact: TIQWebHPick;
    PkContactID: TBCDField;
    PkContactSALUTATION: TStringField;
    PkContactLAST_NAME: TStringField;
    PkContactFIRST_NAME: TStringField;
    PkContactTITLE: TStringField;
    PkContactPHONE_NUMBER: TStringField;
    PkContactEXT: TStringField;
    PkContactFAX_NUMBER: TStringField;
    PkContactEMAIL: TStringField;
    PkContactPAGER: TStringField;
    TblArcustoSTATEMENT_DATE: TBCDField;
    TblTermsBASED_ON: TStringField;
    QryFob: TFDQuery;
    QryFobDESCRIP: TStringField;
    TblArcustoLAST_FINANCE_CHARGE_DATE: TDateTimeField;
    TblContactWEB_USERID: TStringField;
    TblContactBILL_TO_ID: TBCDField;
    TblContactSHIP_TO_ID: TBCDField;
    wwSrcShipTo: TDataSource;
    wwQryShipTo: TFDQuery;
    wwSrcBillTo: TDataSource;
    wwQryBillTo: TFDQuery;
    wwQryShipToATTN: TStringField;
    wwQryShipToADDR1: TStringField;
    wwQryShipToADDR2: TStringField;
    wwQryShipToCITY: TStringField;
    wwQryShipToSTATE: TStringField;
    wwQryShipToZIP: TStringField;
    wwQryBillToID: TBCDField;
    wwQryBillToATTN: TStringField;
    wwQryBillToADDR1: TStringField;
    wwQryBillToADDR2: TStringField;
    wwQryBillToCITY: TStringField;
    wwQryBillToSTATE: TStringField;
    wwQryBillToZIP: TStringField;
    wwQryShipToID: TBCDField;
    wwQryAllUsers: TFDQuery;
    wwQryAllUsersUSERNAME: TStringField;
    TblArcustoMIN_CHANGE_INTERVAL: TBCDField;
    wwQryCust_Type: TFDQuery;
    wwQryCust_TypeID: TBCDField;
    wwQryCust_TypeDESCRIP: TStringField;
    wwSrcWeb_Arcusto_Module: TDataSource;
    wwTblWeb_Arcusto_Module: TFDTable;
    wwTblWeb_Arcusto_ModuleID: TBCDField;
    wwTblWeb_Arcusto_ModuleWEB_MODULE_ID: TBCDField;
    wwTblWeb_Arcusto_ModuleARCUSTO_ID: TBCDField;
    wwQryWebModuleLookup: TFDQuery;
    wwTblWeb_Arcusto_ModuleWeb_Module_Name: TStringField;
    wwQryWebModuleLookupID: TBCDField;
    wwQryWebModuleLookupNAME: TStringField;
    wwQryWebModuleLookupDESCRIP: TStringField;
    wwSrcWeb_Contact_Module: TDataSource;
    wwQryWebArcustoLookup: TFDQuery;
    wwQryWebArcustoLookupNAME: TStringField;
    wwQryWebArcustoLookupWEB_ARCUSTO_MODULE_ID: TBCDField;
    wwQryWeb_Contact_Module: TFDQuery;
    wwQryWebArcustoLookupDESCRIP: TStringField;
    wwQryWeb_Contact_ModuleWEB_CONTACT_MODULE_ID: TBCDField;
    wwQryWeb_Contact_ModuleWEB_MODULE_ID: TBCDField;
    wwQryWeb_Contact_ModuleMODULE_NAME: TStringField;
    wwQryWeb_Contact_ModuleWEB_ARCUSTO_MODULE_ID: TBCDField;
    wwQryWeb_Contact_ModuleCONTACT_ID: TBCDField;
    wwQryCompany: TFDQuery;
    wwQryCompanyCOMPANY: TStringField;
    wwQryCompanyCODE: TStringField;
    wwQryCompanyADDRESS1: TStringField;
    wwQryCompanyADDRESS2: TStringField;
    wwQryCompanyCITY: TStringField;
    wwQryCompanySTATE: TStringField;
    wwQryCompanyZIP: TStringField;
    wwQryCompanyCOUNTRY: TStringField;
    wwQryCompanyPHONE: TStringField;
    wwQryCompanyID: TBCDField;
    wwQryCompanyFAX: TStringField;
    wwQryCompanyEMAIL: TStringField;
    wwQryCompanyINTERNET: TStringField;
    wwQryCompanyADDRESS3: TStringField;
    TblArcustoPK_HIDE: TStringField;
    TblArcustoWEB_SITE_URL: TStringField;
    TblArcustoCRM_PROSPECT: TStringField;
    TblArcustoONE_PO_PER_PS: TStringField;
    TblContactDEFAULT_CONTACT: TStringField;
    TblBill_toDEFAULT_BILL_TO: TStringField;
    TblArcustoOVERLAY_LABEL_REPORT: TStringField;
    TblArcustoBEFORE_OVERLAY_LABEL_REPORT: TStringField;
    SrcContactShipTo: TDataSource;
    QryContactShipTo: TFDQuery;
    QryContactShipToID: TBCDField;
    QryContactShipToARCUSTO_ID: TBCDField;
    QryContactShipToCONTACT_SEQNO: TBCDField;
    QryContactShipToSALUTATION: TStringField;
    QryContactShipToLAST_NAME: TStringField;
    QryContactShipToFIRST_NAME: TStringField;
    QryContactShipToTITLE: TStringField;
    QryContactShipToPHONE_NUMBER: TStringField;
    QryContactShipToEXT: TStringField;
    QryContactShipToFAX_NUMBER: TStringField;
    QryContactShipToEMAIL: TStringField;
    QryContactShipToPAGER: TStringField;
    QryContactShipToCUSER1: TStringField;
    QryContactShipToCUSER2: TStringField;
    QryContactShipToSOURCE: TStringField;
    QryContactShipToSOURCE_ID: TBCDField;
    UpdateSQLShipContact: TFDUpdateSQL;
    SrcContactBillTo: TDataSource;
    QryContactBillTo: TFDQuery;
    UpdateSQLBillContact: TFDUpdateSQL;
    QryContactBillToID: TBCDField;
    QryContactBillToARCUSTO_ID: TBCDField;
    QryContactBillToCONTACT_SEQNO: TBCDField;
    QryContactBillToSALUTATION: TStringField;
    QryContactBillToLAST_NAME: TStringField;
    QryContactBillToFIRST_NAME: TStringField;
    QryContactBillToTITLE: TStringField;
    QryContactBillToPHONE_NUMBER: TStringField;
    QryContactBillToEXT: TStringField;
    QryContactBillToFAX_NUMBER: TStringField;
    QryContactBillToEMAIL: TStringField;
    QryContactBillToPAGER: TStringField;
    QryContactBillToCUSER1: TStringField;
    QryContactBillToCUSER2: TStringField;
    QryContactBillToSOURCE: TStringField;
    QryContactBillToSOURCE_ID: TBCDField;
    TblContactSOURCE: TStringField;
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
    TblArcustoSAFETY_LEAD_TIME: TBCDField;
    QryDistCtr: TFDQuery;
    QryDistCtrID: TBCDField;
    QryDistCtrATTN: TStringField;
    QryDistCtrADDR1: TStringField;
    QryDistCtrADDR2: TStringField;
    QryDistCtrADDR3: TStringField;
    QryDistCtrCITY: TStringField;
    QryDistCtrSTATE: TStringField;
    QryDistCtrCOUNTRY: TStringField;
    QryDistCtrZIP: TStringField;
    QryDistCtrPHONE_NUMBER: TStringField;
    SrcDistCtr: TDataSource;
    TblDistCtr: TFDTable;
    TblDistCtrID: TBCDField;
    TblDistCtrATTN: TStringField;
    TblDistCtrADDR1: TStringField;
    TblDistCtrADDR2: TStringField;
    TblDistCtrADDR3: TStringField;
    TblDistCtrCITY: TStringField;
    TblDistCtrSTATE: TStringField;
    TblDistCtrCOUNTRY: TStringField;
    TblDistCtrZIP: TStringField;
    TblDistCtrPHONE_NUMBER: TStringField;
    TblDistCtrEXT: TStringField;
    TblDistCtrFAX: TStringField;
    TblDistCtrPRIME_CONTACT: TStringField;
    TblDistCtrNOTES: TStringField;
    TblDistCtrUSE_USA_MASK: TStringField;
    TblDistCtrEPLANT_ID: TBCDField;
    TblDistCtrEPlant_Name: TStringField;
    TblDistCtrSHIP_TIME: TBCDField;
    QryDistCtrEPLANT_ID: TBCDField;
    TblArcustoSHIP_FORECAST: TStringField;
    QryShipTo: TFDQuery;
    QryShipToID: TBCDField;
    QryShipToARCUSTO_ID: TBCDField;
    QryShipToATTN: TStringField;
    QryShipToADDR1: TStringField;
    QryShipToADDR2: TStringField;
    QryShipToADDR3: TStringField;
    QryShipToCITY: TStringField;
    QryShipToCOUNTRY: TStringField;
    QryShipToZIP: TStringField;
    QryShipToSHIP_TIME: TBCDField;
    QryShipToTAX_CODE_ID: TBCDField;
    QryShipToPHONE_NUMBER: TStringField;
    QryShipToEXT: TStringField;
    QryShipToFAX: TStringField;
    QryShipToPRIME_CONTACT: TStringField;
    QryShipToFREIGHT_ID: TBCDField;
    QryShipToNOTES: TStringField;
    QryShipToFOB: TStringField;
    QryShipToUSE_USA_MASK: TStringField;
    QryShipToEPLANT_ID: TBCDField;
    QryShipToDAYS_MARGIN: TBCDField;
    QryShipToQTY_PCNT_MARGIN: TBCDField;
    QryShipToLOCATIONS_ID: TBCDField;
    QryShipToDEFAULT_SHIP_TO: TStringField;
    QryShipToCUSER1: TStringField;
    QryShipToCUSER2: TStringField;
    QryShipToVMI_INVOICE_ON_SHIP: TStringField;
    QryShipToSUN_SHIP: TStringField;
    QryShipToMON_SHIP: TStringField;
    QryShipToTUE_SHIP: TStringField;
    QryShipToWED_SHIP: TStringField;
    QryShipToTHU_SHIP: TStringField;
    QryShipToFRI_SHIP: TStringField;
    QryShipToSAT_SHIP: TStringField;
    QryShipToUSE_DOCKID_PICKTICKET: TStringField;
    QryShipToDIST_CENTER_ID: TBCDField;
    QryShipToDOCKID: TStringField;
    QryShipToPOOL_CODE: TStringField;
    QryShipToTax_Code: TStringField;
    QryShipToFreight_Comp: TStringField;
    QryShipToEPlant_Name: TStringField;
    QryShipToVMI_Invoice_On_Display: TStringField;
    UpdateSQLShipTo: TFDUpdateSQL;
    TblArcustoQTY_PRICE_BREAK: TFMTBCDField;
    PkShipTo: TIQWebHPick;
    PkShipToID: TBCDField;
    PkShipToARCUSTO_ID: TBCDField;
    PkShipToATTN: TStringField;
    PkShipToADDR1: TStringField;
    PkShipToADDR2: TStringField;
    PkShipToADDR3: TStringField;
    PkShipToCITY: TStringField;
    PkShipToSTATE: TStringField;
    PkShipToCOUNTRY: TStringField;
    PkShipToZIP: TStringField;
    PkShipToSHIP_TIME: TBCDField;
    PkShipToPHONE_NUMBER: TStringField;
    PkShipToEXT: TStringField;
    PkShipToFAX: TStringField;
    PkShipToPRIME_CONTACT: TStringField;
    PkShipToTAX_CODE_ID: TBCDField;
    PkShipToTAX_CODE: TStringField;
    PkShipToFREIGHT_ID: TBCDField;
    PkShipToDESCRIP: TStringField;
    PkShipToEPLANT_ID: TBCDField;
    PkShipToNAME: TStringField;
    PkBillTo: TIQWebHPick;
    PkBillToID: TBCDField;
    PkBillToATTN: TStringField;
    PkBillToADDR1: TStringField;
    PkBillToADDR2: TStringField;
    PkBillToADDR3: TStringField;
    PkBillToCITY: TStringField;
    PkBillToSTATE: TStringField;
    PkBillToCOUNTRY: TStringField;
    PkBillToZIP: TStringField;
    PkBillToPRIME_CONTACT: TStringField;
    PkBillToPHONE_NUMBER: TStringField;
    PkBillToEXT: TStringField;
    PkBillToFAX: TStringField;
    TblContactMOBILE: TStringField;
    QryContactShipToMOBILE: TStringField;
    QryContactBillToMOBILE: TStringField;
    QryShipToBOL_NOTE: TStringField;
    QryShipToPK_TKT_KEEP_REL_SEPARATE: TStringField;
    TblArcustoPACKSLIP_REPORT: TStringField;
    TblArcustoORD_ACK_REPORT: TStringField;
    TblArcustoINVOICE_REPORT: TStringField;
    TblArcustoQLETTER_REPORT: TStringField;
    TblArcustoTL_RFQ_REPORT: TStringField;
    TblArcustoBOL_REPORT: TStringField;
    TblArcustoBOL_HEADER_REPORT: TStringField;
    TblArcustoJOBSHOP_REPORT: TStringField;
    TblBill_toINVOICE_REPORT: TStringField;
    QryShipToPACKSLIP_REPORT: TStringField;
    QryShipToBOL_REPORT: TStringField;
    QryShipToBOL_HEADER_REPORT: TStringField;
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
    QryShipToDIVISION_ID: TBCDField;
    QryDivision: TFDQuery;
    QryDivisionID: TBCDField;
    QryDivisionNAME: TStringField;
    QryDivisionDESCRIP: TStringField;
    QryDivisionEPLANT_ID: TBCDField;
    QryDivisionGL_PLUG_VALUE: TStringField;
    QryShipToDivision: TStringField;
    TblArcustoONE_SO_PER_PS: TStringField;
    QryShipToVMI_USESYSDATE_AUTOINV: TStringField;
    TblArcustoAR_GLACCT_ID: TBCDField;
    QryGlAcct: TFDQuery;
    QryGlAcctACCT: TStringField;
    QryGlAcctDESCRIP: TStringField;
    QryGlAcctEPLANT_ID: TBCDField;
    QryGlAcctID: TBCDField;
    TblArcustoAracct: TStringField;
    TblContactCUSER3: TStringField;
    TblContactCUSER4: TStringField;
    TblContactDEPARTMENT: TStringField;
    QryTerms: TFDQuery;
    QryTermsID: TBCDField;
    QryTermsDESCRIPTION: TStringField;
    QryTermsDAYS: TBCDField;
    QryTermsDISCOUNT: TBCDField;
    QryTermsDISCOUNT_DAYS: TBCDField;
    QryTermsECODE: TStringField;
    QryTermsEID: TBCDField;
    QryTermsEDATE_TIME: TDateTimeField;
    QryTermsECOPY: TStringField;
    QryTermsBASED_ON: TStringField;
    QryTermsEND_OF_MONTH: TStringField;
    QryTermsDAY_OF_MONTH: TBCDField;
    TblTermsEND_OF_MONTH: TStringField;
    TblTermsDAY_OF_MONTH: TBCDField;
    QryShipToCUSER3: TStringField;
    QryShipToCUSER4: TStringField;
    QryShipToCUSER5: TStringField;
    QryShipToNUSER1: TFMTBCDField;
    QryShipToNUSER2: TFMTBCDField;
    QryShipToNUSER3: TFMTBCDField;
    QryShipToNUSER4: TFMTBCDField;
    QryShipToNUSER5: TFMTBCDField;
    TblArcustoDUNNING_GROUP_ID: TBCDField;
    TblArcustoDUNNING_EXCLUDE: TStringField;
    QryDunningGroup: TFDQuery;
    QryDunningGroupID: TBCDField;
    QryDunningGroupDESCRIP: TStringField;
    SrcShipToLabels: TDataSource;
    TblShipToLabels: TFDTable;
    TblShipToLabelsID: TBCDField;
    TblShipToLabelsSHIP_TO_ID: TBCDField;
    TblShipToLabelsEVENT: TBCDField;
    TblShipToLabelsTYPE: TBCDField;
    TblShipToLabelsDESCRIP: TStringField;
    TblShipToLabelsLM_LABELS_ID: TBCDField;
    TblShipToLabelsCRW_REPORT: TStringField;
    TblShipToLabelsCOPIES: TBCDField;
    TblShipToLabelsPROMPT_USER: TStringField;
    TblShipToLabelsLM_Label_Menu_Name: TStringField;
    PkLabels: TIQWebHPick;
    PkLabelsID: TBCDField;
    PkLabelsLABEL_FILE: TStringField;
    PkLabelsLABEL_MENU: TStringField;
    PkLabelsLABEL_TYPE: TStringField;
    PkLabelsCUSTNO: TStringField;
    PkLabelsCUSTOMER: TStringField;
    PkLabelsEPLANT_ID: TBCDField;
    TblShipToLabelsSEQ: TBCDField;
    PkFreight: TIQWebHPick;
    PkFreightID: TBCDField;
    PkFreightDESCRIP: TStringField;
    PkFreightSCAC_IATA_CODE: TStringField;
    PkFreightCODE_QUALIFIER: TStringField;
    PkFreightTRANSPORT_CODE: TStringField;
    PkFreightEQUIP_OWNERS_CODE: TStringField;
    QryShipToNO_PRINTED_INVOICE: TStringField;
    QryShipToPREFERRED_SHIP_DAY: TBCDField;
    QryShipToPK_TKT_EXCLUDE_FORECAST_REL: TStringField;
    QryShipToSTATE: TStringField;
    TblArcustoPS_PRESERVE_RAN: TStringField;
    QryShipToSUPPLIER_CODE: TStringField;
    QryShipToBILLING_SUPPLIER_CODE: TStringField;
    QryShipToCUSER6: TStringField;
    QryShipToCUSER7: TStringField;
    QryEdiBillTo: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TBCDField;
    QryShipToBILL_TO_ID: TBCDField;
    QryShipToBillTo: TStringField;
    QryShipToMATCH_RELEASE_BASED_ON_RAN: TStringField;
    QryShipToPK_HIDE: TStringField;
    TblArcustoCOC_REQUIRED: TStringField;
    QryShipToVMI_USE_CONS_DATE: TStringField;
    QryShipToTRAILER_ID: TBCDField;
    QryTrailer: TFDQuery;
    QryTrailerSEQ: TBCDField;
    QryTrailerDESCRIP: TStringField;
    QryTrailerWIDTH: TFMTBCDField;
    QryTrailerHEIGHT: TFMTBCDField;
    QryTrailerLENGTH: TFMTBCDField;
    QryTrailerMAX_WEIGHT: TFMTBCDField;
    QryTrailerGAP_PERCENT: TBCDField;
    QryTrailerEPLANT_ID: TBCDField;
    QryTrailerID: TBCDField;
    QryTrailerVOLUME: TFMTBCDField;
    QryShipToComm: TFDQuery;
    StringField7: TStringField;
    FloatField2: TBCDField;
    FloatField3: TFMTBCDField;
    QryShipToCOMMISSIONS_ID: TBCDField;
    QryShipToCOMM_PCNT: TFMTBCDField;
    QryShipToCUSER8: TStringField;
    QryShipToCUSER9: TStringField;
    QryShipToCUSER10: TStringField;
    QryShipToCUSER11: TStringField;
    QryShipToCUSER12: TStringField;
    QryShipToCUSER13: TStringField;
    QryShipToCUSER14: TStringField;
    QryShipToCUSER15: TStringField;
    QryShipToCONSOLIDATOR_ID: TBCDField;
    QryConsolidator: TFDQuery;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField4: TBCDField;
    FloatField5: TBCDField;
    SrcFreightRules: TDataSource;
    QryFreightRules: TFDQuery;
    QryFreightRulesID: TBCDField;
    QryFreightRulesFROM_WEIGHT: TFMTBCDField;
    QryFreightRulesTO_WEIGHT: TFMTBCDField;
    QryFreightRulesFREIGHT_ID: TBCDField;
    QryFreightRulesTYPE: TStringField;
    QryFreightRulesFreight_Descrip: TStringField;
    UpdateSQLFreightRules: TFDUpdateSQL;
    QryFreightLookup: TFDQuery;
    QryFreightLookupID: TBCDField;
    QryFreightLookupDESCRIP: TStringField;
    QryFreightRulesARCUSTO_ID: TBCDField;
    TblArcustoTRAILER_OVER_MAX_INSTRUCTIONS: TStringField;
    TblArcustoTRAILER_MAX_LENGTH: TFMTBCDField;
    TblArcustoPALLET_MAX_HEIGHT: TFMTBCDField;
    TblArcustoPALLET_MIN_HEIGHT: TFMTBCDField;
    TblArcustoIS_OVERHANG_ALLOWED: TStringField;
    TblArcustoPALLET_OVERHANG_LIMIT: TFMTBCDField;
    TblArcustoPALLET_SIZE_REQUIRED: TStringField;
    TblArcustoPALLET_GRADE_REQUIRED: TStringField;
    TblArcustoPALLET_MAX_FLOOR_SPACES: TFMTBCDField;
    TblArcustoPALLET_MAX_WEIGHT: TFMTBCDField;
    TblArcustoIS_PALLET_LABELS_REQUIRED: TStringField;
    TblArcustoPALLET_LABEL_PLACEMENT: TStringField;
    TblArcustoCARTON_MAX_HEIGHT: TFMTBCDField;
    TblArcustoCARTON_MAX_LENGTH: TFMTBCDField;
    TblArcustoCARTON_MAX_WIDTH: TFMTBCDField;
    TblArcustoIS_FLOOR_LOADING_ALLOWED: TStringField;
    TblArcustoCARTON_MAX_FLOOR_LOADING: TFMTBCDField;
    TblArcustoIS_ROUTING_REQUIRED: TStringField;
    TblArcustoROUTING_TIME_DEADLINE: TDateTimeField;
    TblArcustoSHIP_TO_PRIORITIZED: TStringField;
    QryShipToPRIORITY_LEVEL: TBCDField;
    TblArcustoTRAILER_MIN_CUBE: TFMTBCDField;
    TblArcustoTRAILER_MAX_CUBE: TFMTBCDField;
    TblArcustoPALLET_TYPE: TStringField;
    TblArcustoCARTON_LABELS_REQUIRED: TStringField;
    TblArcustoCARTON_LABEL_TYPE: TStringField;
    TblArcustoCARTON_LABEL_SIZE: TStringField;
    TblArcustoCARTON_LABEL_PLACEMENT: TStringField;
    QryFreight: TFDQuery;
    TblShipToLabelsPALLET_CHILD_LM_LABELS_ID: TBCDField;
    TblShipToLabelsPALLET_CHILD_CRW_REPORT: TStringField;
    TblShipToLabelsLM_Label_Menu_Name_Child: TStringField;
    TblContactAUTO_EFORM_PS: TStringField;
    TblContactAUTO_EFORM_AR: TStringField;
    TblContactAUTO_EFORM_ORD_ACK: TStringField;
    TblContactAUTO_EFORM_BOL: TStringField;
    QryContactShipToAUTO_EFORM_PS: TStringField;
    QryContactShipToAUTO_EFORM_AR: TStringField;
    QryContactShipToAUTO_EFORM_ORD_ACK: TStringField;
    QryContactShipToAUTO_EFORM_BOL: TStringField;
    QryContactBillToAUTO_EFORM_PS: TStringField;
    QryContactBillToAUTO_EFORM_AR: TStringField;
    QryContactBillToAUTO_EFORM_ORD_ACK: TStringField;
    QryContactBillToAUTO_EFORM_BOL: TStringField;
    TblBill_toPOSTED_INVOICE_REPORT: TStringField;
    TblArcustoPOSTED_INVOICE_REPORT: TStringField;
    QryTaxCodes: TFDQuery;
    QryTaxCodesID: TBCDField;
    QryTaxCodesTAX_CODE: TStringField;
    QryTaxCodesTAX_CODE_DESC: TStringField;
    QryTaxCodesTOT_TAX_RATE: TFMTBCDField;
    QryTaxCodesECODE: TStringField;
    QryTaxCodesEID: TBCDField;
    QryTaxCodesEDATE_TIME: TDateTimeField;
    QryTaxCodesECOPY: TStringField;
    QryTaxCodesVAT_PAID: TStringField;
    SrcQryTaxCodes: TDataSource;
    TblArcustoCOC_REPORT: TStringField;
    QryShipToCOC_REPORT: TStringField;
    QryShipToCOC_REQUIRED: TStringField;
    TblArcustoUSE_DISCOUNT_TIER: TStringField;
    TblContactCUSER5: TStringField;
    TblContactCUSER6: TStringField;
    TblContactCUSER7: TStringField;
    TblContactCUSER8: TStringField;
    TblContactCUSER9: TStringField;
    TblContactNUSER1: TFMTBCDField;
    TblContactNUSER2: TFMTBCDField;
    TblContactNUSER3: TFMTBCDField;
    TblContactNUSER4: TFMTBCDField;
    TblContactNUSER5: TFMTBCDField;
    TblContactNUSER6: TFMTBCDField;
    TblContactNUSER7: TFMTBCDField;
    TblContactNUSER8: TFMTBCDField;
    TblContactNUSER9: TFMTBCDField;
    TblArcustoIS_MAKE_TO_ORDER: TStringField;
    TblArcustoEPLANT_ID: TBCDField;
    PkContactMOBILE: TStringField;
    TblArcustoTRACKING_REQUIRED: TStringField;
    QryFreightRulesMAX_CARTONS: TBCDField;
    TblContactAUTO_EFORM_CS: TStringField;
    QryContactBillToAUTO_EFORM_CS: TStringField;
    QryContactShipToAUTO_EFORM_CS: TStringField;
    TblBill_toPK_HIDE: TStringField;
    PkBillToPK_HIDE: TStringField;
    TblArcustoPS_CONVERT_INFO: TStringField;
    TblContactPK_HIDE: TStringField;
    PkContactPK_HIDE: TStringField;
    QryImporter: TFDQuery;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    FloatField6: TBCDField;
    FloatField7: TBCDField;
    QryShipToIMPORTER_ID: TBCDField;
    TblArcustoTAX_ID: TStringField;
    TblContactADDR1: TStringField;
    TblContactADDR2: TStringField;
    TblContactADDR3: TStringField;
    TblContactCITY: TStringField;
    TblContactSTATE: TStringField;
    TblContactZIP: TStringField;
    TblArcustoBOL_ALL_PS_REPORT: TStringField;
    QryShipToBOL_ALL_PS_REPORT: TStringField;
    TblContactAUTO_EFORM_ORD_ACK_CONTACT: TStringField;
    QryContactShipToAUTO_EFORM_ORD_ACK_CONTACT: TStringField;
    QryShipToACCOUNT_NUMBER: TStringField;
    TblContactCOUNTRY: TStringField;
    QryContactBillToAUTO_EFORM_ORD_ACK_CONTACT: TStringField;
    TblArcustoCRM_QUOTE_REPORT: TStringField;
    QryShipToIS_MAKE_TO_ORDER: TStringField;
    TblContactVERIFIED_DATE: TDateTimeField;
    QryContactBillToVERIFIED_DATE: TDateTimeField;
    QryContactShipToVERIFIED_DATE: TDateTimeField;
    PkArcustoEPLANT_ID: TBCDField;
    PkArcustoACTIVE_TYPE: TStringField;
    TblArcustoREBATE_PARAMS_ID: TBCDField;
    TblArcustoRebateParam: TStringField;
    PkRebateParams: TIQWebHPick;
    PkRebateParamsID: TBCDField;
    PkRebateParamsDESCRIP: TStringField;
    PkRebateParamsBASED_ON: TStringField;
    PkRebateParamsPERCENT: TFMTBCDField;
    PkRebateParamsFLAT_AMOUNT: TBCDField;
    PkRebateParamsEXCLUDE_COMMISSIONS: TStringField;
    PkRebateParamsCASH_BACK: TStringField;
    PkRebateParamsEFFECT_DATE: TDateTimeField;
    PkRebateParamsDEACTIVE_DATE: TDateTimeField;
    PkRebateParamsGLACCT_ID: TBCDField;
    PkRebateParamsACCT: TStringField;
    QryShipToRebateParam: TStringField;
    QryShipToREBATE_PARAMS_ID: TBCDField;
    Pkterms: TIQWebHPick;
    PktermsID: TBCDField;
    PktermsDESCRIPTION: TStringField;
    PktermsDAYS: TBCDField;
    PktermsDISCOUNT: TBCDField;
    PktermsDISCOUNT_DAYS: TBCDField;
    PktermsECODE: TStringField;
    PktermsEID: TBCDField;
    PktermsEDATE_TIME: TDateTimeField;
    PktermsECOPY: TStringField;
    PktermsBASED_ON: TStringField;
    PktermsEND_OF_MONTH: TStringField;
    PktermsDAY_OF_MONTH: TBCDField;
    TblBill_toTerms: TStringField;
    TblBill_toTERMS_ID: TBCDField;
    TblArcustoWEB_PAYMENT_TYPE: TStringField;
    QryFreightID: TBCDField;
    QryFreightDESCRIP: TStringField;
    QryFreightGLACCT_ID_FREIGHT: TBCDField;
    QryFreightSCAC_IATA_CODE: TStringField;
    QryFreightCODE_QUALIFIER: TStringField;
    QryFreightTRANSPORT_CODE: TStringField;
    QryFreightEQUIP_OWNERS_CODE: TStringField;
    QryFreightGLACCT_ID_FREIGHT_AP: TBCDField;
    QryFreightCARRIER_PHONE: TStringField;
    QryFreightCOMMENT1: TStringField;
    QryFreightTRANSIT_ON_WEEKEND: TStringField;
    QryFreightPK_HIDE: TStringField;
    QryShipToCarrier: TFDQuery;
    ScrShipToCarrier: TDataSource;
    UpdateSQLShipToCarrier: TFDUpdateSQL;
    QryShipToCarrierID: TBCDField;
    QryShipToCarrierACCOUNT_NUMBER: TStringField;
    QryShipToCarrierSHIP_TO_ID: TBCDField;
    QryShipToCarrierCARRIER_ID: TBCDField;
    SrcCarriers: TDataSource;
    QryCarriers: TFDQuery;
    QryCarriersID: TBCDField;
    QryCarriersDESCRIP: TStringField;
    QryShipToCarrierDescription: TStringField;
    TblArcustoREF_TYPE: TStringField;
    TblArcustoCSR_PR_EMP_ID: TBCDField;
    TblArcustoAR_PR_EMP_ID: TBCDField;
    TblArcustocsr_emp_name: TStringField;
    TblArcustoar_emp_name: TStringField;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpEMPNO: TStringField;
    PkEmpFIRST_NAME: TStringField;
    PkEmpMIDDLE_NAME: TStringField;
    PkEmpLAST_NAME: TStringField;
    PkEmpPK_HIDE: TStringField;
    PkEmpEPLANT_ID: TBCDField;
    QryShipToFREIGHT_REV_PCNT: TBCDField;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    PKAcctEPLANT_ID: TBCDField;
    QryFreightLookupEPLANT_ID: TBCDField;
    PkThirdParty: TIQWebHPick;
    PkThirdPartyID: TBCDField;
    PkThirdPartyATTN: TStringField;
    PkThirdPartyADDR1: TStringField;
    PkThirdPartyADDR2: TStringField;
    PkThirdPartyADDR3: TStringField;
    PkThirdPartyCITY: TStringField;
    PkThirdPartySTATE: TStringField;
    PkThirdPartyCOUNTRY: TStringField;
    PkThirdPartyZIP: TStringField;
    PkThirdPartyPHONE_NUMBER: TStringField;
    PkThirdPartyEXT: TStringField;
    PkThirdPartyFAX: TStringField;
    PkThirdPartyPRIME_CONTACT: TStringField;
    QryShipToFOB_THIRD_PARTY_ID: TBCDField;
    PkTempl: TIQWebHPick;
    PkTemplID: TBCDField;
    PkTemplTEMPLATE_NAME: TStringField;
    PkTemplTEMPLATE_DESCRIP: TStringField;
    QryShipToINFO_SO: TStringField;
    QryFreightEPLANT_ID: TBCDField;
    QryContactShipToMSDS_RECIPIENT: TStringField;
    PkBillToOE: TIQWebHPick;
    FloatField8: TBCDField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    PkBillToOEPK_HIDE: TStringField;
    TblContactEMAIL_DUNNING: TStringField;
    QryContactBillToEMAIL_DUNNING: TStringField;
    TblArcustoPRIME_CONTACT_EMAIL: TStringField;
    TblArcustoCurrency: TStringField;
    TblArcustoTier: TStringField;
    TblArcustoCC_RETENTION_DAYS: TBCDField;
    TblContactAUTO_EFORM_SPC: TStringField;
    QryContactShipToAUTO_EFORM_SPC: TStringField;
    QryContactBillToAUTO_EFORM_SPC: TStringField;
    TblArcustoDROP_SHIP_VENDOR_ID: TBCDField;
    TblArcustoDropShipVendorDisp: TStringField;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    FloatField11: TBCDField;
    PkVendorPK_HIDE: TStringField;
    TblContactWEB_USERLOG: TStringField;
    QryStoreFrontUsers: TFDQuery;
    QryStoreFrontUsersUSERNAME: TStringField;
    QryStoreFrontUsersCUSTOMERNUMBER: TStringField;
    QryStoreFrontUsersFIRST_NAME: TStringField;
    QryStoreFrontUsersLAST_NAME: TStringField;
    QryStoreFrontUsersEMAILADDRESS: TStringField;
    QryStoreFrontUsersCOMPANY: TStringField;
    QryStoreFrontUsersPASSWORD: TStringField;
    QryStoreFrontUsersEPLANT_ID: TFMTBCDField;
    QryStoreFrontUsersID: TBCDField;
    QryStoreFrontUsersISADMIN: TFMTBCDField;
    QryStoreFrontUsersISORACLEUSER: TFMTBCDField;
    QryStoreFrontUsersCUSTOMERID: TBCDField;
    TblArcustoUSE_EXTERNAL_LABELS: TStringField;
    TblArcustoPS_VERIFY_INVENTORY: TStringField;
    PkGroups: TIQWebHPick;
    PkGroupsID: TBCDField;
    PkGroupsNAME: TStringField;
    PkGroupsDESCRIPTION: TStringField;
    PkLoc: TIQWebHPick;
    PkLocID: TBCDField;
    PkLocLOCATION: TStringField;
    PkLocDESCRIPTION: TStringField;
    PkLocPATH: TBCDField;
    PkLocEPLANT_NAME: TStringField;
    PkLocDIVISION: TStringField;
    PkLocPK_HIDE: TStringField;
    PkLocBUILDING: TStringField;
    PkLocDIVISION_ID: TBCDField;
    QryShipToDIRECT_SHIP_LOCATONS_ID: TBCDField;
    QryShipToDIRECT_SHIP_LOCATON: TStringField;
    TblContactAUTO_EFORM_COC: TStringField;
    QryContactShipToAUTO_EFORM_COC: TStringField;
    QryContactBillToAUTO_EFORM_COC: TStringField;
    QryFreightRulesShipTo: TFDQuery;
    QryFreightRulesShipToFROM_WEIGHT: TFMTBCDField;
    QryFreightRulesShipToTO_WEIGHT: TFMTBCDField;
    QryFreightRulesShipToFreight_Descrip: TStringField;
    QryFreightRulesShipToTYPE: TStringField;
    QryFreightRulesShipToMAX_CARTONS: TBCDField;
    QryFreightRulesShipToID: TBCDField;
    QryFreightRulesShipToFREIGHT_ID: TBCDField;
    QryFreightRulesShipToARCUSTO_ID: TBCDField;
    SrcFreightRulesShipTo: TDataSource;
    UpdateSQLFreightRulesShipTo: TFDUpdateSQL;
    QryFreightRulesShipToSHIP_TO_ID: TBCDField;
    TblArcustoCOMMER_INVOICE_REQUIRED: TStringField;
    TblArcustoCOMMER_INVOICE_REPORT: TStringField;
    QryShipToCOMMER_INVOICE_REPORT: TStringField;
    QryShipToCOMMER_INVOICE_REQUIRED: TStringField;
    TblContactSOURCE_ID: TBCDField;
    QryShipToREVAL_UNIT_PRICE_INV_DATE: TStringField;
    PkShipToPK_HIDE: TStringField;
    QryShipToCUST_TYPE_ID: TBCDField;
    TblContactAUTO_EFORM_PS_ORD_CONTACT: TStringField;
    QryContactShipToAUTO_EFORM_PS_ORD_CONTACT: TStringField;
    PkTaxCode: TIQWebHPick;
    PkTaxCodeTAX_CODE: TStringField;
    PkTaxCodeTAX_CODE_DESC: TStringField;
    PkTaxCodeTOT_TAX_RATE: TFMTBCDField;
    PkTaxCodeID: TBCDField;
    TblArcustoINFO_SO: TStringField;
    TblArcustoINFO_CR: TStringField;
    TblArcustoINFO_AR: TStringField;
    TblTermsPK_HIDE: TStringField;
    PkTerritory: TIQWebHPick;
    PkTerritoryID: TBCDField;
    PkTerritoryCODE: TStringField;
    PkTerritoryDESCRIP: TStringField;
    PkTerritoryPARENT_ID: TBCDField;
    PkTerritoryPARENT_CODE: TStringField;
    PkTerritoryPARENT_DESCRIP: TStringField;
    TblArcustoTERRITORY_ID: TBCDField;
    TblArcustoTerritoryCode: TStringField;
    TblArcustoCRM_OPPORTUNITY_ID: TBCDField;
    TblArcustoCRMOpportunityNo: TStringField;
    TblArcustoSalesStageCode: TStringField;
    TblArcustoSIC_CODE: TStringField;
    TblBill_toSTATUS_ID: TStringField;
    TblArcustoFREIGHT_ID: TBCDField;
    TblArcustoACCOUNT_NUMBER: TStringField;
    TblArcustoFreightDescrip: TStringField;
    QryShipToFREIGHT_DESCRIP: TStringField;
    TblContactEPLANT_ID: TBCDField;
    TblContactEPlantName: TStringField;
    QryContactShipToEPLANT_ID: TBCDField;
    TblArcustoREF_CODE_ID: TBCDField;
    TblArcustoRefCodeDescrip: TStringField;
    TblArcustoRefCodeCode: TStringField;
    PkRefCode: TIQWebHPick;
    PkRefCodeCATEGORY_ID: TBCDField;
    PkRefCodeCATEGORY_DESCRIP: TStringField;
    PkRefCodeREF_CODE_ID: TBCDField;
    PkRefCodeREF_CODE_DESCRIP: TStringField;
    PkRefCodeREF_CODE: TStringField;
    QryShipToCarrierEMAIL: TStringField;
    QryShipToCarrierSHIP: TStringField;
    QryShipToCarrierDELIVERY: TStringField;
    QryShipToCarrierEXCEPTION: TStringField;
    QryShipToPS_VERIFY_INVENTORY: TStringField;
    QryShipToTAX_EXEMPT_NUM: TStringField;
    TblArcustoCASH_IN_ADVANCE: TStringField;
    PkFreightPK_HIDE: TStringField;
    TblTermsCASH_IN_ADVANCE: TStringField;
    TblArcustoECODE: TStringField;
    TblArcustoEID: TBCDField;
    TblArcustoEDATE_TIME: TDateTimeField;
    TblArcustoECOPY: TStringField;
    TblArcustoGLYEAR_ID: TBCDField;
    TblArcustoHIGHEST_BAL_BUCKET: TBCDField;
    TblArcustoALERTMSG: TStringField;
    TblArcustoDISTLIST: TStringField;
    TblArcustoIS_INTERCOMP: TStringField;
    TblArcustoVENDOR_ID_OUTSOURCE: TBCDField;
    TblArcustoCUST_CREDIT_DAYS: TBCDField;
    TblArcustoCUST_CREDIT_INCL_SHIP: TStringField;
    TblArcustoCUST_CREDIT_INCL_SO: TStringField;
    TblArcustoCREDIT_LIMIT_AUTOCALC: TStringField;
    TblArcustoCREATED: TDateTimeField;
    TblArcustoCREATEDBY: TStringField;
    TblArcustoCHANGED: TDateTimeField;
    TblArcustoCHANGEDBY: TStringField;
    TblArcustoWEBUSER_NAME: TStringField;
    TblArcustoWEBUSER_LOG: TStringField;
    TblArcustoARCUSTO_LEVEL_ID: TBCDField;
    TblArcustoCREDIT_LIMIT_AUTO_UPDATE: TStringField;
    TblArcustoCREDIT_LIMIT_PAST_DUE_DAYS: TBCDField;
    TblArcustoHYPERLINK: TStringField;
    TblArcustoHYPERLINKADDRESS: TStringField;
    TblArcustoHYPERLINKSUBADDRESS: TStringField;
    TblArcustoOVERSHIP: TBCDField;
    TblArcustoUNDERSHIP: TBCDField;
    TblArcustoUSE_DISCOUNT_PARAMS: TStringField;
    TblArcustoVAT_TAX_NO: TStringField;
    PkUsageType: TIQWebHPick;
    PkUsageTypeID: TBCDField;
    PkUsageTypeCODE: TStringField;
    PkUsageTypeDESCRIP: TStringField;
    TblArcustoUsageTypeDescrip: TStringField;
    TblArcustoARCUSTO_USAGE_TYPE_ID: TBCDField;
    QryShipToTERRITORY_ID: TBCDField;
    QryShipToTERRITORY_CODE: TStringField;
    TblArcustoSHIP_COMPLETE: TStringField;
    QryShipToUsageTypeCode: TStringField;
    QryShipToARCUSTO_USAGE_TYPE_ID: TBCDField;
    TblArcustoTAX_EXEMPT_NUM: TStringField;
    TblArcustoREV_DISC_ORDER: TStringField;
    QryShipToSHIPMAN_PRINT_BOX_LABEL: TStringField;
    TblArcustoCOUNTRY_ID: TBCDField;
    TblArcustoSTATE_ID: TBCDField;
    TblContactCOUNTRY_ID: TBCDField;
    TblContactSTATE_ID: TBCDField;
    TblArcustoCountryCode2Chr: TStringField;
    QryShipToSTATE_ID: TBCDField;
    QryShipToCOUNTRY_ID: TBCDField;
    TblBill_toCOUNTRY_ID: TBCDField;
    TblBill_toSTATE_ID: TBCDField;
    procedure ConfirmCancel(DataSet: TDataSet);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure HandleError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TblArcustoAfterPost(DataSet: TDataSet);
    procedure TblArcustoCOMMISSIONS_IDChange(Sender: TField);
    procedure TblArcustoBeforePost(DataSet: TDataSet);
    procedure TblArcustoNewRecord(DataSet: TDataSet);
    procedure TblShip_toBeforeOpen(DataSet: TDataSet);
    procedure PkContactBeforeOpen(DataSet: TDataSet);
    procedure TblContactBeforePost(DataSet: TDataSet);
    procedure wwQryWeb_Contact_ModuleUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure wwQryWeb_Contact_ModuleBeforePost(DataSet: TDataSet);
    procedure wwQryWeb_Contact_ModuleAfterPost(DataSet: TDataSet);
    procedure wwQryWeb_Contact_ModuleBeforeDelete(DataSet: TDataSet);
    procedure wwTblWeb_Arcusto_ModuleAfterDelete(DataSet: TDataSet);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure TblShip_toBeforePost(DataSet: TDataSet);
    procedure TblShip_toAfterPost(DataSet: TDataSet);
    procedure TblContactAfterPost(DataSet: TDataSet);
    procedure TblBill_toAfterPost(DataSet: TDataSet);
    procedure TblBill_toBeforePost(DataSet: TDataSet);
    procedure QryContactShipToNewRecord(DataSet: TDataSet);
    procedure QryContactShipToBeforePost(DataSet: TDataSet);
    procedure QryContactShipToAfterPost(DataSet: TDataSet);
    procedure TblShip_toBeforeDelete(DataSet: TDataSet);
    procedure PostParentBeforeEdit(DataSet: TDataSet);
    procedure TblContactAfterDelete(DataSet: TDataSet);
    procedure tblCurrencyBeforeOpen(DataSet: TDataSet);
    procedure TblDistCtrBeforePost(DataSet: TDataSet);
    procedure TblDistCtrNewRecord(DataSet: TDataSet);
    procedure TblDistCtrBeforeOpen(DataSet: TDataSet);
    procedure TblDistCtrBeforeDelete(DataSet: TDataSet);
    procedure QryShipToCalcFields(DataSet: TDataSet);
    procedure ApplyUpdateToTable(DataSet: TDataSet);
    procedure QryShipToBeforeDelete(DataSet: TDataSet);
    procedure PostArcustoBeforeEdit(DataSet: TDataSet);
    procedure QryShipToBeforePost(DataSet: TDataSet);
    procedure PkShipToBeforeOpen(DataSet: TDataSet);
    procedure PkBillToBeforeOpen(DataSet: TDataSet);
    procedure TblShipToLabelsNewRecord(DataSet: TDataSet);
    procedure TblShipToLabelsBeforePost(DataSet: TDataSet);
    procedure QryShipToNewRecord(DataSet: TDataSet);
    procedure QryFreightRulesBeforePost(DataSet: TDataSet);
    procedure ApplyUpdateToTable2(DataSet: TDataSet);
    procedure QryFreightRulesNewRecord(DataSet: TDataSet);
    procedure TblShipToLabelsCalcFields(DataSet: TDataSet);
    procedure SrcShipToLabelsDataChange(Sender: TObject; Field: TField);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TblBill_toPHONE_NUMBERGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QryShipToPHONE_NUMBERGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QryContactShipToPHONE_NUMBERGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QryContactBillToPHONE_NUMBERGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure TblDistCtrPHONE_NUMBERGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure TblArcustoBeforeDelete(DataSet: TDataSet);
    procedure TblContactPHONE_NUMBERGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure TblArcustoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure PkArcustoBeforeOpen(DataSet: TDataSet);
    procedure TblContactNewRecord(DataSet: TDataSet);
    procedure TblBill_toNewRecord(DataSet: TDataSet);
    procedure TblContactBeforeEdit(DataSet: TDataSet);
    procedure TblBill_toCalcFields(DataSet: TDataSet);
    procedure QryShipToCarrierAfterPost(DataSet: TDataSet);
    procedure QryShipToCarrierBeforePost(DataSet: TDataSet);
    procedure QryShipToCarrierNewRecord(DataSet: TDataSet);
    procedure PkEmpBeforeOpen(DataSet: TDataSet);
    procedure TblFreightBeforeOpen(DataSet: TDataSet);
    procedure TblArcustoBeforeEdit(DataSet: TDataSet);
    procedure TblArcustoBeforeInsert(DataSet: TDataSet);
    procedure PkTemplIQAfterHPickCreate(Sender: TObject);
    procedure SrcShip_toDataChange(Sender: TObject; Field: TField);
    procedure SrcBill_ToDataChange(Sender: TObject; Field: TField);
    procedure QryFreightRulesShipToNewRecord(DataSet: TDataSet);
    procedure TblContactAUTO_EFORM_PSChange(Sender: TField);
    procedure QryFreightRulesShipToBeforePost(DataSet: TDataSet);
    procedure SrcArcustoDataChange(Sender: TObject; Field: TField);
    procedure QryShipToBeforeOpen(DataSet: TDataSet);
    procedure TblArcustoAfterScroll(DataSet: TDataSet);
    procedure QryShipToAfterOpen(DataSet: TDataSet);
    procedure QryShipToBeforeEdit(DataSet: TDataSet);
    procedure TblContactCalcFields(DataSet: TDataSet);
    procedure TblContactBeforeOpen(DataSet: TDataSet);
    procedure QryFreightRulesCalcFields(DataSet: TDataSet);
    procedure TblArcustoAfterDelete(DataSet: TDataSet);
    procedure TblArcustoAfterRefresh(DataSet: TDataSet);
    procedure SrcContactDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FWeb_Contact_Module_ID: Real;
    FShip_To_ID: Real;
    FContactPkHideBeforePost: String[1];
    FArcustoCommissionsIDBeforePost,
    FShipToCommissionsIDBeforePost: Int64;
    FExcludeCRMProspects: Boolean;
    FUseLimitedCustomerAccess: Boolean;
    FExcludeCustomerAccess: Boolean;
    FFlagNewAsCRMProspect: Boolean;
    FContactDataCoordinator: TIQWebDataCoordinator;
    FBillToDataCoordinator: TIQWebDataCoordinator;
    FShipToDataCoordinator: TIQWebDataCoordinator;
    FContactsID:Real;
    FPkHideManager: TIQWebPkHideManager;
    procedure CheckAutoEFormSettings(DataSet: TDataSet);
    procedure CheckCanModifyArcusto;
    procedure CheckCustomerTemplate;
    procedure SetContactDataCoordinator(const Value: TIQWebDataCoordinator);
    procedure SetBillToDataCoordinator(const Value: TIQWebDataCoordinator);
    procedure SetShipToDataCoordinator(const Value: TIQWebDataCoordinator);
    function IsEmailAddrUnique( AEmail : string; AWebUserID: string ) : boolean;
    procedure SetCommPctFor(const ACommissionsID: Real);
    procedure ReassignReadOnlyValues;
    function  IsUsingTiersOrDiscount:Boolean;
  public
    { Public declarations }
    property ContactDataCoordinator: TIQWebDataCoordinator read FContactDataCoordinator write SetContactDataCoordinator;
    property BillToDataCoordinator: TIQWebDataCoordinator read FBillToDataCoordinator write SetBillToDataCoordinator;
    property ShipToDataCoordinator: TIQWebDataCoordinator read FShipToDataCoordinator write SetShipToDataCoordinator;

    function IsCurCustnoUnique: Boolean;
    procedure AssignShipToLabelsPalletChildrenPanelVisible;
    procedure CheckResetMutualExclusiveOf(Sender: TField); overload;
    procedure CheckResetMutualExclusiveOf(Sender: TField; AChecked: Boolean);overload;

  published
    { Published declarations }
    property ExcludeCRMProspects: Boolean read FExcludeCRMProspects write FExcludeCRMProspects default True;
    // Flag new customers as CRM Prospects (default = False)
    property FlagNewAsCRMProspect: Boolean read FFlagNewAsCRMProspect write FFlagNewAsCRMProspect default False;
    // Filter by inactive
    property PkHideManager: TIQWebPkHideManager read FPkHideManager write FPkHideManager;
  end;

var
  Cust_DM: TCust_DM;

implementation

{$R *.DFM}

uses
  { TODO -oathite -cWebConvert : Dpends on Cust
  Cust, }
  cust_const,
  cust_rscstr,
  Cust_Shr,
  InactiveContactSalesOrderChk,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  { TODO -oathite -cWebConvert : Dpends on oe_main
  oe_main, }
  IQMS.Common.Regional,
  ship_to_labels_share,
  System.Variants,
  UpdateSalesPersonChk;


procedure TCust_DM.DataModuleCreate(Sender: TObject);
begin
  // 02/16/2009 Added this property.  By default it is true; yes, we
  // exclude CRM Prospects.  However, if Customer Maintenance is called
  // by CRM through one of the CRM-specific wrappers, then this value
  // is set to False.
  ExcludeCRMProspects := True;
  // 12/11/2012 Set property to flag new customers as CRM Prospects.
  // By default, this is false.
  FlagNewAsCRMProspect := False;
  // 02/16/2009 Ensure the ARCUSTO table is filtered.  The filter is
  // handled in the OnFilterRecord event.
  TblArcusto.Filtered := True;

  // 02-16-2009 prepare upfront if user has limited customers access
  FUseLimitedCustomerAccess:= SelectValueAsFloat('select 1 from s_user_crm_customers ' +
    'where user_name = misc.GetUserName and rownum < 2') = 1;
  FExcludeCustomerAccess:= SelectValueAsString('SELECT exclude_customers ' +
    'FROM s_user_general WHERE user_name = misc.getusername AND ' +
    'ROWNUM < 2') = 'Y';

  ContactDataCoordinator:= TIQWebDataCoordinator.CreateAndRegister( self,
                                                                 [ TblContact,
                                                                   wwQryAllUsers,
                                                                   wwTblWeb_Arcusto_Module,
                                                                   wwQryWeb_Contact_Module,
                                                                   wwQryShipTo,
                                                                   wwQryBillTo,
                                                                   wwQryWebArcustoLookup,
                                                                   wwQryWebModuleLookup ]);

  ShipToDataCoordinator:= TIQWebDataCoordinator.CreateAndRegister( self,
                                                                [ QryShipTo,
                                                                  //QryFreight,
                                                                  // wwQryTax,
                                                                  QryShipToComm,
                                                                  QryFob,
                                                                  QryDivision,
                                                                  QryTrailer,
                                                                  QryContactShipTo,
                                                                  QryDistCtr,
                                                                  QryConsolidator,
                                                                  QryImporter,
                                                                  TblShipToLabels,
                                                                  QryShipToCarrier,
                                                                  QryEdiBillTo,
                                                                  QryFreightRulesShipTo ]);

  BillToDataCoordinator:= TIQWebDataCoordinator.CreateAndRegister( self,
                                                                [ TblBill_to,
                                                                  QryContactBillTo ]);

  FPkHideManager := TIQWebPkHideManager.Create(Self.Owner);

end;

procedure TCust_DM.ConfirmCancel(DataSet: TDataSet);
begin
   if MessageDlg('Cancel Changes?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      ABORT
end;

procedure TCust_DM.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TCust_DM.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TCust_DM.HandleError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action:= daAbort;
  IQHandleDBEngineError( DataSet, E );
end;

procedure TCust_DM.TblArcustoAfterDelete(DataSet: TDataSet);
begin
  ReassignReadOnlyValues;     
end;

procedure TCust_DM.TblArcustoAfterPost(DataSet: TDataSet);
var
  AIsShipToAssigned: Boolean;
  AIsBillToAssigned: Boolean;
begin
  // ship_to
  if QryShipTo.Active then
     AIsShipToAssigned:= not (QryShipTo.Eof and QryShipTo.Bof)
  else
     AIsShipToAssigned:= SelectValueFmtAsFloat('select 1 from ship_to where arcusto_id = %f and rownum < 2', [ TblArcustoID.asFloat ]) = 1;

  // bill_to
  if TblBill_To.Active then
     AIsBillToAssigned:= not (TblBill_To.Eof and TblBill_To.Bof)
  else
     AIsBillToAssigned:= SelectValueFmtAsFloat('select 1 from bill_to where arcusto_id = %f and rownum < 2', [ TblArcustoID.asFloat ]) = 1;

  // if ( QryShipTo.Eof and QryShipTo.Bof ) and ( TblBill_To.Eof and TblBill_To.Bof ) and IQConfirmYN('Create default Ship-To and Bill-To address?') then
  if not AIsShipToAssigned and not AIsBillToAssigned and IQConfirmYN('Create default Ship-To and Bill-To address?') then
     begin
        if not QryShipTo.Active then QryShipTo.Open;
        if not TblBill_To.Active then TblBill_To.Open;
        { TODO -oathite -cWebConvert : Dpends on cust
        TFrm_Cust(Owner).CopyInfo( 'ARCUSTO', QryShipTo,  TblArcustoID.asFloat );
        TFrm_Cust(Owner).CopyInfo( 'ARCUSTO', TblBill_To, TblArcustoID.asFloat ); }
     end

  // else if ( QryShipTo.Eof and QryShipTo.Bof ) and IQConfirmYN('Create default Ship-To address?') then
  else if not AIsShipToAssigned and IQConfirmYN('Create default Ship-To address?') then
     begin
       if not QryShipTo.Active then QryShipTo.Open;

       { TODO -oathite -cWebConvert : Dpends on cust
       TFrm_Cust(Owner).CopyInfo( 'ARCUSTO', QryShipTo, TblArcustoID.asFloat );  }
     end

  // else if ( TblBill_To.Eof and TblBill_To.Bof ) and IQConfirmYN('Create default Bill-To address?') then
  else if not AIsBillToAssigned and IQConfirmYN('Create default Bill-To address?') then
     begin
      if not TblBill_To.Active then TblBill_To.Open;
      { TODO -oathite -cWebConvert : Dpends on cust
      TFrm_Cust(Owner).CopyInfo( 'ARCUSTO', TblBill_To, TblArcustoID.asFloat ); }
     end;

  {to refresh the eplant_id}
  TblArcusto.Refresh;

  // 07/18/2011 Refresh contacts.  If PK_HIDE was changed, a trigger will
  // update CONTACT.PK_HIDE.  We refresh it here so the user sees the change.
  if TblContact.Active then
     TblContact.Refresh;

  if QryShipTo.Active then
  begin
    QryShipTo.CheckBrowseMode;
    QryShipTo.Close;
    QryShipTo.Open;
  end;

  if TblBill_To.Active then
     TblBill_To.CheckBrowseMode;

  ReassignReadOnlyValues;     
end;

procedure TCust_DM.TblArcustoAfterScroll(DataSet: TDataSet);
begin
  ReOpen( QryShipTo ); //EIQ-4349 Customer Maintenance -  Customer Maint > Ship to refresh issue - Internal AB 10-03-14
  ReassignReadOnlyValues;
end;

procedure TCust_DM.SetCommPctFor(const ACommissionsID: Real);
begin
  if ACommissionsID > 0 then
    begin
      if not (TblArcusto.State in [dsEdit, dsInsert]) then
        TblArcusto.Edit;
      TblArcustoCOMM_PCNT.AsFloat := SelectValueFmtAsFloat(
        'SELECT SUM(commission_percent) FROM commissions_detail ' +
        'WHERE commissions_id = %.0f', [ACommissionsID]);
    end;
end;

procedure TCust_DM.TblArcustoCOMMISSIONS_IDChange(Sender: TField);
begin
  // See private procedure this unit, above.
  SetCommPctFor(TblArcustoCOMMISSIONS_ID.AsFloat);
end;

procedure TCust_DM.TblArcustoBeforePost(DataSet: TDataSet);
var
  AFirst: Boolean;
begin
  if (TblArcustoUSE_DISCOUNT_PARAMS.AsString <> 'Y') and 
     (SelectValueFmtAsString('select NVL(USE_DISCOUNT_PARAMS, ''N'') from arcusto where id = %f', [TblArcustoID.asFloat]) = 'Y') and
     (SelectValueFmtAsFloat('select count(id) from DISCOUNT_PARAMS where arcusto_id = %f', [TblArcustoID.asFloat]) <> 0) then
     raise Exception.Create( 'Please remove Customer assigned Discount Parameters first' );
                                                                                                                             
  if (TblArcustoUSE_DISCOUNT_PARAMS.AsString = 'Y') and IsUsingTiersOrDiscount then
     raise Exception.Create( 'Cannot Assign both Tier Discounts and Discount Parameters' );
                                                                                    
  if not IsCurCustnoUnique then
     raise Exception.Create( 'The Customer # you entered is already used.  Please enter a unique Customer #.' );

  if (TblArcustoONE_SO_PER_PS.asString = 'Y') and (TblArcustoONE_PO_PER_PS.asString = 'Y') then
     raise Exception.Create( 'One PO# per packslip and One SO# per packslip are mutually exclusive - both cannot be checked.' );

  if (TblArcustoFREIGHT_ID.AsFloat = 0) and (TblArcustoACCOUNT_NUMBER.AsString > '') then
     {'Freight Carrier Account # cannot be entered without having Ship Via. Enter valid Ship Via and try again.'}
     raise Exception.Create( cust_rscstr.cTXT0000051 );

  AssignIDBeforePost(DataSet);

  if TblArcustoUSE_DISCOUNT_PARAMS.asString <> 'Y' then
  begin
    TblArcustoREV_DISC_ORDER.asString := 'N';
    { TODO -oathite -cWebConvert : Dpends on cust
    TFrm_Cust(Owner).DBRevDiscOrder.ReadOnly := true; }
  end
  else
  begin
    { TODO -oathite -cWebConvert : Dpends on cust
    TFrm_Cust(Owner).DBRevDiscOrder.ReadOnly := false; }
  end;



  // 09/10/2012 Check STATE and clear it if necessary
  IQMS.Common.Regional.CheckClearStateCode(TblArcustoSTATE, TblArcustoCOUNTRY);


  // 03/03/2015
  // EIQ-6253 Mass Sales Order Update when the Salesperson changes on the
  // Customer or if the Salesperson is marked Inactive
  // cust_rscstr.cTXT0000016 = 'Change Salesperson for Customer';
  if (DataSet.State = dsEdit) and
     (TblArcustoCOMMISSIONS_ID.AsFloat > 0) and
     (FArcustoCommissionsIDBeforePost > 0) and
     (FArcustoCommissionsIDBeforePost <>  TblArcustoCOMMISSIONS_ID.AsLargeInt) then
     begin
       UpdateSalesPersonChk.CheckMassUpdateCommissionsGroupOnOrders(
         TblArcustoID.AsLargeInt,
         0 {SHIP_TO.ID},
         FArcustoCommissionsIDBeforePost,
         TblArcustoCOMMISSIONS_ID.AsLargeInt);
     end;

  if TblArcustoCOMMISSIONS_ID.AsLargeInt > 0 then
    if SelectValueFmtAsFloat(
      'select count(id) from commissions_detail where commissions_id = %f',
      [TblArcustoCOMMISSIONS_ID.AsFloat]) > 1 then
      if Abs(SelectValueFmtAsFloat(
        'SELECT SUM(commission_percent) FROM commissions_detail WHERE commissions_id = %f',
        [TblArcustoCOMMISSIONS_ID.AsFloat]) - TblArcustoCOMM_PCNT.AsFloat) > 0.00000000001 then
        begin
          if SelectValueFmtAsFloat(
            'SELECT SUM(ratio) FROM commissions_detail WHERE commissions_id = %f',
            [TblArcustoCOMMISSIONS_ID.AsFloat]) = 0 then
            // cust_rscstr.cTXT0000020 =
            // 'The Commission %% specified by the user (%f%%) does not amount
            // to the total commissions in the %s';
            IQWarning(Format(cust_rscstr.cTXT0000020,
             [TblArcustoCOMM_PCNT.AsFloat,
              TblArcustoCOMMISSION.AsString]));
        end;

  // Reset
  FArcustoCommissionsIDBeforePost := 0;

end;

procedure TCust_DM.TblArcustoNewRecord(DataSet: TDataSet);
begin
  // Default to FALSE.  We do not apply the mask by default.
  //if SelectValueAsFloat('select count(*) from all_objects where object_name = ''S_SYSGEN_CUSTNO''') = 0 then
  //  ExecuteCommand('create sequence S_SYSGEN_CUSTNO start with 1 NoCache NoCycle');

  //DataSet.FieldByName('CUSTNO').asString := SelectValueAsString('select arcusto_misc.GetNextARCUSTOSequence from dual');

  TblArcustoCUSTNO.AsString := NextCustomerNumber;

  CheckApplyUSAMask(DataSet.FieldByName('USE_USA_MASK'));
//  DataSet.FieldByName('USE_USA_MASK').asString:= 'N';

  // 12/11/2012 Flag this new customer as a "CRM Prospect"?  By default,
  // this is false (of course), but if this form is called from CRM,
  // then this flag will be true. This is the documented rule.
  if FFlagNewAsCRMProspect then
    TblArcustoCRM_PROSPECT.AsString := 'Y';

  CheckCustomerTemplate;
end;

procedure TCust_DM.TblShip_toBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TCust_DM.PkContactBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', TblArcusto.FieldByName('ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := TblArcusto.FieldByName('ID').asFloat;
end;

procedure TCust_DM.TblContactBeforePost(DataSet: TDataSet);
begin
  AssignIDBeforePost(DataSet);
  FContactsID := TblContactID.asFloat;
  TblContactWEB_USERID.asString:= UpperCase( TblContactWEB_USERID.asString );

  // 01/11/2011 If the user has set this contact to inactive, check sales
  // orders that reference this contact and prompt user for what to do.
  // (Byron).  SCR # 1799
  // E-Mail Subject: Re: CRM - Customer Contacts - Frontend contraint?
  if (DataSet.State = dsEdit) and
     (TblContactPK_HIDE.asString = 'Y') and
     (FContactPkHideBeforePost <> 'Y') and
      not CheckContactOrdersBeforeSettingInactive(TblArcustoID.AsFloat, TblContactID.AsFloat) then // InactiveContactSalesOrderChk.pas
       System.SysUtils.Abort;
  // Reset
  FContactPkHideBeforePost := '';

  if TblContactPK_HIDE.asString = 'Y' then
  begin
    TblContactDEFAULT_CONTACT.asString    := 'N';
    TblContactAUTO_EFORM_PS.asString      := 'N';
    TblContactAUTO_EFORM_AR.asString      := 'N';
    TblContactAUTO_EFORM_ORD_ACK.asString := 'N';
    TblContactAUTO_EFORM_BOL.asString     := 'N';
    TblContactAUTO_EFORM_CS.asString      := 'N';
  end;
  if DataSet.State = dsInsert then
  begin
    if (TblContactFIRST_NAME.asString = '') and (TblContactLAST_NAME.asString = '') then
    begin
      TblContactFIRST_NAME.asString:= TblContactWEB_USERID.asString;
      TblContactLAST_NAME.asString := TblContactWEB_USERID.asString;
    end;
  end;

  if (TblContactWEB_USERID.asString <> '') and (TblContactEMAIL.asString = '') then
    IQWarning(cust_rscstr.cTXT0000062); { 'Warning! Email is required for this user to receive notifications from WebDirect.'}

  if (TblContactWEB_USERID.asString <> '') and (TblContactEMAIL.asString <> '') then
    IQAssert( IsEmailAddrUnique( TblContactEMAIL.asString, TblContactWEB_USERID.AsString ), Format(cust_rscstr.cTXT0000063, [ TblContactEMAIL.asString])); // cTXT0000063 = 'Email address %s is not unique...';

  CheckAutoEFormSettings(DataSet);

  IQMS.Common.Regional.CheckClearStateCode(TblContactSTATE,TblContactCOUNTRY);
end;

procedure TCust_DM.TblContactCalcFields(DataSet: TDataSet);
begin
  TblContactEPlantName.AsString :=  SelectValueByID(
    '''['' || ID || '']  '' || name', 'eplant',
    TblContactEPLANT_ID.asFloat);
end;

procedure TCust_DM.wwQryWeb_Contact_ModuleBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if State = dsInsert then
       FieldByName('web_contact_module_id').asFloat:= GetNextID( 'web_contact_module' );
    FWeb_Contact_Module_ID:= FieldByName('web_contact_module_id').asFloat;

    if TblContactID.asFloat = 0 then
       raise Exception.Create('Contact information is unavaliable - unable to continue');
    FieldByName('contact_id').asFloat:= TblContactID.asFloat;

  end;
end;

procedure TCust_DM.wwQryWeb_Contact_ModuleBeforeDelete(DataSet: TDataSet);
begin
  with DataSet do
    FWeb_Contact_Module_ID:= FieldByName('web_contact_module_id').asFloat;
end;

procedure TCust_DM.wwQryWeb_Contact_ModuleUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
var
  S: string;
begin
    case ARequest of
       arUpdate: S:= IQFormat('update web_contact_module set web_arcusto_module_id = %f, contact_id = %f where id = %f',
                           [ TFDQuery(ASender).FieldByName('web_arcusto_module_id').asFloat,
                             TFDQuery(ASender).FieldByName('contact_id').asFloat,
                             FWeb_Contact_Module_ID ]);

       arInsert: S:= IQFormat('insert into web_contact_module(id, web_arcusto_module_id, contact_id) values(%f, %f, %f)',
                           [ FWeb_Contact_Module_ID,
                             TFDQuery(ASender).FieldByName('web_arcusto_module_id').asFloat,
                             TFDQuery(ASender).FieldByName('contact_id').asFloat ]);

       arDelete: S:= IQFormat('delete from web_contact_module where id = %f',
                           [ FWeb_Contact_Module_ID ]);
    end;

  ExecuteCommand( S );

  AAction := eaApplied;
end;

procedure TCust_DM.wwQryWeb_Contact_ModuleAfterPost(DataSet: TDataSet);
begin
{
  with wwQryWeb_Contact_Module do
  try
    Database.ApplyUpdates([ wwQryWeb_Contact_Module ]);
  except
    CancelUpdates;
    raise;
  end;
}
end;

procedure TCust_DM.wwTblWeb_Arcusto_ModuleAfterDelete(DataSet: TDataSet);
begin
  Reopen(wwQryWeb_Contact_Module);
end;

procedure TCust_DM.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
end;

procedure TCust_DM.TblShip_toBeforePost(DataSet: TDataSet);
var
  AEplantExpr: string;
  AEPlant_ID : string;
begin
  AssignIDBeforePost(DataSet);
  FShip_To_ID:= DataSet.FieldByName('ID').asFloat;


  (*
  if ( DataSet.FieldByName('default_ship_to').asString = 'Y' ) and                               {now is checked}
     ( SelectValueByID('default_ship_to', 'ship_to', DataSet.FieldByName('ID').asFloat) <> 'Y' ) then {was not checked before post}
  begin
    {Figure out the eplant_id}
    if DataSet.State = dsInsert then
       begin
         AEPlant_ID:= DataSet.FieldByName('EPlant_ID').asString;
         if AEPlant_ID = '' then
            AEPlant_ID:=  SecurityManager.EPlant_ID;
       end
    else
       AEPlant_ID:= DataSet.FieldByName('EPlant_ID').asString;

    if (AEPlant_ID = 'NULL') or (AEPlant_ID = '') then
       AEplantExpr:= 'eplant_id is NULL'
    else
       AEplantExpr:= 'eplant_id = ' + AEPlant_ID;

    ExecuteCommandFmt('update ship_to set default_ship_to = ''N'' '+
              ' where arcusto_id = %f                     '+
              '   and id <> %f                            '+
              '   and %s                                  ',  {EPlant}
              [ DataSet.FieldByName('arcusto_id').asFloat,
                DataSet.FieldByName('ID').asFloat,
                AEplantExpr ]);

  end;
  *)
end;

procedure TCust_DM.TblShip_toAfterPost(DataSet: TDataSet);
var
  AEPlant_ID : string;
  AEplantExpr: string;
begin
  {Delphi loses the position pointer under eplant filter}
  if FShip_To_ID <> DataSet.FieldByName('ID').asFloat then
  begin
     if not DataSet.Locate('ID', FShip_To_ID, []) then
        EXIT;
  end;

  if ( DataSet.FieldByName('default_ship_to').asString = 'Y' ) then
  begin
    AEPlant_ID:= DataSet.FieldByName('EPlant_ID').asString;

    if (AEPlant_ID = 'NULL') or (AEPlant_ID = '') then
       AEplantExpr:= 'eplant_id is NULL'
    else
       AEplantExpr:= 'eplant_id = ' + AEPlant_ID;

    ExecuteCommandFmt('update ship_to set default_ship_to = ''N'' '+
              ' where arcusto_id = %f                     '+
              '   and id <> %f                            '+
              '   and %s                                  ',  {EPlant}
              [ DataSet.FieldByName('arcusto_id').asFloat,
                DataSet.FieldByName('ID').asFloat,
                AEplantExpr ]);
    // DataSet.Refresh;
    RefreshDataSetByID( DataSet );
  end;

  QryDistCtr.Close;
  QryDistCtr.Open;
end;

procedure TCust_DM.TblContactAfterPost(DataSet: TDataSet);
var
  I:Integer;
  AId:Real;
begin
  if (DataSet.FieldByName('ID').asFloat <> FContactsID) and (Trunc(FContactsID) <> 0) then
    Dataset.Locate('ID', FContactsID, []);

  if ( DataSet.FieldByName('default_contact').asString = 'Y' ) then
  begin
    ExecuteCommandFmt('update contact set default_contact = ''N'' '+
              ' where arcusto_id = %f                     '+
              '   and id <> %f                            ',
              [ DataSet.FieldByName('arcusto_id').asFloat,
                DataSet.FieldByName('ID').asFloat ]);
    DataSet.Refresh;
  end;

  if DataSet.FieldByName('source').asString = 'SHIP_TO' then
     Reopen(QryContactShipTo)
  else if DataSet.FieldByName('source').asString = 'BILL_TO' then
     Reopen(QryContactBillTo);

  for I:= 0 to Screen.FormCount - 1 do              // Per Nancys email Sept 25 2007 to refresh Contacts dropdown   Z
    if CompareText( Screen.Forms[ I ].ClassName, 'TFrmMainOrder') = 0  then
    begin
       { TODO -oathite -cWebConvert : Dpends on oe_main
       TFrmMainOrder(Screen.Forms[ I ]).DM.QryContact.Close;
       TFrmMainOrder(Screen.Forms[ I ]).DM.QryContact.Open; }
    end;

end;

procedure TCust_DM.TblContactAUTO_EFORM_PSChange(Sender: TField);
begin
  CheckResetMutualExclusiveOf( Sender );
end;

procedure TCust_DM.TblBill_toAfterPost(DataSet: TDataSet);
begin
  if ( DataSet.FieldByName('default_bill_to').asString = 'Y' ) then
  begin
    ExecuteCommandFmt('update bill_to set default_bill_to = ''N'' '+
              ' where arcusto_id = %f                     '+
              '   and id <> %f                            ',
              [ DataSet.FieldByName('arcusto_id').asFloat,
                DataSet.FieldByName('ID').asFloat ]);
    DataSet.Refresh;
  end;
end;

procedure TCust_DM.TblBill_toBeforePost(DataSet: TDataSet);
begin
  AssignIDBeforePost(DataSet);
  IQMS.Common.Regional.CheckClearStateCode(TblBill_toSTATE,TblBill_toCOUNTRY);
end;

procedure TCust_DM.QryContactShipToNewRecord(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    if DataSource.DataSet.FieldByName('id').asFloat = 0 then
       ABORT;
    FieldByName('arcusto_id').asFloat:= DataSource.DataSet.FieldByName('arcusto_id').asFloat;
    FieldByName('source_id').asFloat := DataSource.DataSet.FieldByName('id').asFloat;
    if DataSource.DataSet is TFDTable then
       FieldByName('source').asString:= UpperCase(TFDTable(DataSource.DataSet).TableName)
    else if DataSource.DataSet = QryShipTo then
       begin
         FieldByName('source').asString:= 'SHIP_TO';
         // 04/10/2015 Populate the EPLANT_ID.
         // EIQ-6311 Vendor Master & Customer Master -> soft EPlant Vendor & Customer Contacts
         if QryShipToEPLANT_ID.AsFloat > 0 then
           FieldByName('eplant_id').AsFloat := QryShipToEPLANT_ID.AsFloat;
       end
    else
       IQWarning('Unable to determine Source for contact record');

    FieldByName('verified_date').asDateTime:= SelectValueAsFloat('select trunc(sysdate) from dual');
  end;
end;

procedure TCust_DM.QryContactShipToBeforePost(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    if FieldByName('ID').asFloat = 0 then FieldByName('ID').asFloat:= GetNextID('contact');
  CheckAutoEFormSettings(DataSet);
end;

procedure TCust_DM.QryContactShipToAfterPost(DataSet: TDataSet);
begin
  FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery(DataSet) ]);
  if TblContact.Active then
     TblContact.Refresh;
end;

procedure TCust_DM.TblShip_toBeforeDelete(DataSet: TDataSet);
begin
  ExecuteCommandFmt('delete from contact where source_id = %f and source = ''%s''',
            [ DataSet.FieldByName('ID').asFloat,
              UpperCase(TFDTable(DataSet).TableName) ]);
end;

procedure TCust_DM.PostParentBeforeEdit(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    if Assigned( DataSource ) and Assigned( DataSource.DataSet ) then
       DataSource.DataSet.CheckBrowseMode;
end;

procedure TCust_DM.TblContactAfterDelete(DataSet: TDataSet);
begin
  Reopen(QryContactShipTo);
  Reopen(QryContactBillTo);
end;

procedure TCust_DM.tblCurrencyBeforeOpen(DataSet: TDataSet);
begin
//  IQAssignNativeCurrencyFilter(DataSet);
end;

procedure TCust_DM.TblDistCtrBeforePost(DataSet: TDataSet);
begin
  AssignIDBeforePost(DataSet);
  // Validate data entry for state
  IQMS.Common.Regional.CheckClearStateCode(TblDistCtrSTATE, TblDistCtrCOUNTRY);
  { TODO -oathite -cWebConvert : Dpends on cust
  if (Owner is TFrm_Cust) then
    PostMessage( TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_DistCenterChanged, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TCust_DM.TblDistCtrNewRecord(DataSet: TDataSet);
begin
  CheckApplyUSAMask(DataSet.FieldByName('USE_USA_MASK'));
//  DataSet.FieldByName('USE_USA_MASK').asString:= 'Y';
end;

procedure TCust_DM.TblDistCtrBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TCust_DM.TblDistCtrBeforeDelete(DataSet: TDataSet);
begin
  ExecuteCommandFmt('update ship_to set dist_center_id = null where dist_center_id = %f', [TblDistCtrID.asFloat]);
  { TODO -oathite -cWebConvert : Dpends on cust
  if (Owner is TFrm_Cust) then
    PostMessage( TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_DistCenterChanged, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TCust_DM.QryShipToCalcFields(DataSet: TDataSet);
begin
  if QryShipToVMI_INVOICE_ON_SHIP.asString = 'Y' then
     QryShipToVMI_Invoice_On_Display.asString:= 'Invoice on Pack Slip'
  else
     QryShipToVMI_Invoice_On_Display.asString:= 'Invoice on Consume';

  QryShipToTax_Code.asString    := SelectValueByID( 'TAX_CODE', 'TAX_CODES', DataSet.FieldByName('tax_code_id').asFloat );
  QryShipToFreight_Comp.asString:= SelectValueByID( 'DESCRIP', 'freight', QryShipToFREIGHT_ID.asFloat );
  QryShipToRebateParam.asString := SelectValueFmtAsString('select descrip from rebate_params where id = %f', [QryShipToREBATE_PARAMS_ID.asfloat]);
  QryShipToDIRECT_SHIP_LOCATON.AsString := SelectValueFmtAsString('select loc_desc from locations where id = %f', [QryShipToDIRECT_SHIP_LOCATONS_ID.asFloat]);
  QryShipToUsageTypeCode.AsString := SelectValueFmtAsString('select description from arcusto_usage_type where id = %.0f',
    [QryShipToARCUSTO_USAGE_TYPE_ID.AsFloat]);
end;

procedure TCust_DM.QryShipToCarrierAfterPost(DataSet: TDataSet);
begin
//  FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery(DataSet) ]);
end;

procedure TCust_DM.QryShipToCarrierBeforePost(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    if FieldByName('ID').asFloat = 0 then FieldByName('ID').asFloat:= GetNextID('ship_to_carrier_account');
end;

procedure TCust_DM.QryShipToCarrierNewRecord(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    if DataSource.DataSet.FieldByName('id').asFloat = 0 then
       ABORT;
    FieldByName('ship_to_id').asFloat := DataSource.DataSet.FieldByName('id').asFloat;
  end;

end;

procedure TCust_DM.ApplyUpdateToTable(DataSet: TDataSet);
begin
  try
    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;

  TblShip_ToAfterPost( DataSet );
end;

procedure TCust_DM.QryShipToAfterOpen(DataSet: TDataSet);
begin
  { TODO -oathite -cWebConvert : Dpends on cust
  if Assigned(Owner) and (Owner is TFrm_Cust) then
    TFrm_Cust(Owner).SetVMIItemsBtnEnabled;     }
end;

procedure TCust_DM.QryShipToBeforeDelete(DataSet: TDataSet);
begin
  ExecuteCommandFmt('delete from contact where source_id = %f and source = ''SHIP_TO''',
            [ DataSet.FieldByName('ID').asFloat ]);
end;

procedure TCust_DM.QryShipToBeforeEdit(DataSet: TDataSet);
begin
  PostArcustoBeforeEdit(DataSet);
  FShipToCommissionsIDBeforePost := QryShipToCOMMISSIONS_ID.AsLargeInt;
end;

procedure TCust_DM.QryShipToBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
   ParamByName('ARCUSTO_ID').Value := TblArcustoID.AsInteger;
end;

procedure TCust_DM.PostArcustoBeforeEdit(DataSet: TDataSet);
begin
  TblArcusto.CheckBrowseMode;
end;

procedure TCust_DM.QryShipToBeforePost(DataSet: TDataSet);
var
  A: Variant;
  ATotComm:Real;
  AFirst: Boolean;
begin
  IQAssert( QryShipToSHIP_TIME.asFloat >= 0, 'Field Ship Days cannot be negative.' );

  CheckFOB_THIRD_PARTY_ID(QryShipToFOB.asString, QryShipTo); {Cust_Shr.pas}


  if DataSet.FieldByName('ID').asFloat = 0 then
     DataSet.FieldByName('ID').asFloat:= GetNextID('ship_to');

  if DataSet.FieldByName('ARCUSTO_ID').asFloat = 0 then
     DataSet.FieldByName('ARCUSTO_ID').asFloat:= TblArcustoID.asFloat;

  // Validate Freight Carried Acct #
  if (DataSet.FieldByName('freight_id').asFloat = 0) and (DataSet.FieldByName('account_number').asString = '') then
     {nothing}
  else if (DataSet.FieldByName('freight_id').asFloat = 0) and (DataSet.FieldByName('account_number').asString > '') then
     {'Freight Carrier Account # cannot be entered without having Ship Via. Enter valid Ship Via and try again.'}
     raise Exception.Create( cust_rscstr.cTXT0000051 )
  else if (DataSet.FieldByName('freight_id').asFloat > 0) and (DataSet.FieldByName('account_number').asString = '') then
     {nothing}
  else if (DataSet.FieldByName('freight_id').asFloat > 0) and (DataSet.FieldByName('account_number').asString > '') then
     begin
       // check if freight_id changed and account_number didnt
       A:= SelectValueArrayFmt( 'select freight_id, account_number from ship_to where id = %f', [ DataSet.FieldByName('ID').asFloat ]);
       if VarArrayDimCount( A ) > 0 then
       begin
         if  (DataSet.FieldByName('freight_id').asFloat <> A[ 0 ])
             and
             (A[ 0 ] > 0)
             and
             (DataSet.FieldByName('account_number').asString = A[ 1 ]) then
           DataSet.FieldByName('account_number').Clear;
       end;
     end;

  FShip_To_ID:= DataSet.FieldByName('ID').asFloat;

  IQMS.Common.Regional.CheckClearStateCode(QryShipToSTATE,QryShipToCOUNTRY);

  // 03/03/2015
  // EIQ-6253 Mass Sales Order Update when the Salesperson changes on the
  // Customer or if the Salesperson is marked Inactive
  // cust_rscstr.cTXT0000016 = 'Change Salesperson for Customer';
  if (DataSet.State = dsEdit) and
     (QryShipToCOMMISSIONS_ID.AsFloat > 0) and
     (FShipToCommissionsIDBeforePost > 0) and
     (FShipToCommissionsIDBeforePost <>  QryShipToCOMMISSIONS_ID.AsLargeInt) then
     begin
       UpdateSalesPersonChk.CheckMassUpdateCommissionsGroupOnOrders(
         TblArcustoID.AsLargeInt,
         QryShipToID.AsLargeInt,
         FShipToCommissionsIDBeforePost,
         QryShipToCOMMISSIONS_ID.AsLargeInt);
     end;

  if QryShipToCOMM_PCNT.asFloat = 0 then
  begin
    if FShipToCommissionsIDBeforePost > 0 then
      ATotComm := SelectValueFmtAsFloat(
        'select sum(commission_percent) from commissions_detail ' +
        'where commissions_id = %d', [FShipToCommissionsIDBeforePost])
    else
      ATotComm := SelectValueFmtAsFloat(
        'select sum(commission_percent) from commissions_detail ' +
        'where commissions_id = %d', [QryShipToCOMMISSIONS_ID.AsLargeInt]);
    if AtotComm <> QryShipToCOMM_PCNT.asFloat then
      QryShipToCOMM_PCNT.asFloat := AtotComm;
  end
  else
  begin
   if  (FShipToCommissionsIDBeforePost <>  QryShipToCOMMISSIONS_ID.AsLargeInt) then
   begin
      ATotComm := SelectValueFmtAsFloat(
        'select sum(commission_percent) from commissions_detail ' +
        'where commissions_id = %d', [QryShipToCOMMISSIONS_ID.AsLargeInt]);
    if AtotComm <> QryShipToCOMM_PCNT.asFloat then
      QryShipToCOMM_PCNT.asFloat := AtotComm;
   end;
  end;


  // Reset
  FShipToCommissionsIDBeforePost := 0;

end;

procedure TCust_DM.PkShipToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', TblArcusto.FieldByName('ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := TblArcusto.FieldByName('ID').asFloat;
end;

procedure TCust_DM.PkBillToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', TblArcusto.FieldByName('ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := TblArcusto.FieldByName('ID').asFloat;
end;

function TCust_DM.IsCurCustnoUnique: Boolean;
var
   ACurrentCustno: String;
begin
     ACurrentCustno := FixStr(UpperCase( Trim( TblArcustoCUSTNO.AsString )));
     Result := not IsFoundFmt( 'select id from arcusto where upper( TrimLeft( rtrim( custno ))) = ''%s'' and id <> %.0f',
                               [ACurrentCustno, TblArcustoID.AsFloat ] );

end;

procedure TCust_DM.TblShipToLabelsNewRecord(DataSet: TDataSet);
begin
  TblShipToLabelsCOPIES.asFloat:= 1;
  TblShipToLabelsPROMPT_USER.asString:= 'Y';
  TblShipToLabelsTYPE.asFloat:= 0; {serialized}
end;

procedure TCust_DM.TblShipToLabelsBeforePost(DataSet: TDataSet);
begin
  if (TblShipToLabelsTYPE.asFloat = ship_to_labels_share.cSHIP_TO_LABEL_TYPE_NON_SERIALIZED) then
     TblShipToLabelsLM_LABELS_ID.Clear
  else
     if not ((TblShipToLabelsTYPE.asString = '3') {External Case}) then
       TblShipToLabelsCRW_REPORT.Clear;

  if (TblShipToLabelsEVENT.asFloat = cSHIP_TO_LABEL_EVENT_ON_CONVERT_PS) and (TblShipToLabelsTYPE.asFloat = cSHIP_TO_LABEL_TYPE_SERIALIZED)
     or
     (TblShipToLabelsEVENT.asFloat = cSHIP_TO_LABEL_EVENT_ON_CONVERT_PS) and (TblShipToLabelsTYPE.asFloat = cSHIP_TO_LABEL_TYPE_REPRINT)
     or
     (TblShipToLabelsEVENT.asFloat = cSHIP_TO_LABEL_EVENT_ON_MIXED)      and (TblShipToLabelsTYPE.asFloat = cSHIP_TO_LABEL_TYPE_SERIALIZED)
     or
     (TblShipToLabelsEVENT.asFloat = cSHIP_TO_LABEL_EVENT_ON_MIXED)      and (TblShipToLabelsTYPE.asFloat = cSHIP_TO_LABEL_TYPE_REPRINT)
     or
     (TblShipToLabelsEVENT.asFloat = cSHIP_TO_LABEL_EVENT_ON_PALLET)     and (TblShipToLabelsTYPE.asFloat = cSHIP_TO_LABEL_TYPE_REPRINT) then
     begin
       IQWarning('Warning! This combination of Type/Event is not supported');
     end;

  IQAssignIDBeforePost(DataSet);
end;

procedure TCust_DM.QryShipToNewRecord(DataSet: TDataSet);
begin
  QryShipToID.Value := GetNextID('SHIP_TO');
  CheckApplyUSAMask(DataSet.FieldByName('USE_USA_MASK'));
//  DataSet.FieldByName('USE_USA_MASK').asString:= 'N';
//     TblArcustoNewRecord(DataSet);

     // We must assign eplant_id when the record is first created or the
     // record will disappear when the eplant filter is applied.
     if SecurityManager.EPlant_ID_AsFloat > 0 then
        QryShipToEPLANT_ID.AsFloat := SecurityManager.EPlant_ID_AsFloat;
end;

procedure TCust_DM.QryFreightRulesBeforePost(DataSet: TDataSet);

  procedure CheckWeightConflict( AConflictFreight_Rules_ID: Real );
  var S: string;
  begin
    if AConflictFreight_Rules_ID = 0 then
       EXIT;
    S:= SelectValueFmtAsString('select f.descrip from freight_rules r, freight f where r.id = %f and r.freight_id = f.id', [ AConflictFreight_Rules_ID ]);
    raise Exception.CreateFmt('Weight conflict detected with Ship Via ''%s''', [ S ]);
  end;

begin
  with DataSet as TFDQuery do
    if FieldByName('ID').asFloat = 0 then FieldByName('ID').asFloat:= GetNextID('freight_rules');

  IQAssert( QryFreightRulesFROM_WEIGHT.asFloat >= 0, '''From Weight'' cannot be negative number');
  IQAssert( QryFreightRulesFROM_WEIGHT.asFloat < QryFreightRulesTO_WEIGHT.asFloat, '''From Weight'' must be less than ''To Weight''');

  CheckWeightConflict( SelectValueFmtAsFloat('select id from freight_rules where arcusto_id = %f and id <> %f and %.6f between from_weight and to_weight and ship_to_id is null',
                                 [ QryFreightRulesARCUSTO_ID.asFloat,
                                   QryFreightRulesID.asFloat,
                                   QryFreightRulesFROM_WEIGHT.asFloat ]));

  CheckWeightConflict( SelectValueFmtAsFloat('select id from freight_rules where arcusto_id = %f and id <> %f and %.6f between from_weight and to_weight and ship_to_id is null',
                                 [ QryFreightRulesARCUSTO_ID.asFloat,
                                   QryFreightRulesID.asFloat,
                                   QryFreightRulesTO_WEIGHT.asFloat ]));

  CheckWeightConflict( SelectValueFmtAsFloat('select id from freight_rules where arcusto_id = %f and id <> %f and (from_weight between %.6f and %.6f OR to_weight between %.6f and %.6f) and ship_to_id is null',
                                 [ QryFreightRulesARCUSTO_ID.asFloat,
                                   QryFreightRulesID.asFloat,
                                   QryFreightRulesFROM_WEIGHT.asFloat,
                                   QryFreightRulesTO_WEIGHT.asFloat,
                                   QryFreightRulesFROM_WEIGHT.asFloat,
                                   QryFreightRulesTO_WEIGHT.asFloat ]));
end;

procedure TCust_DM.ApplyUpdateToTable2(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TCust_DM.QryFreightRulesNewRecord(DataSet: TDataSet);
begin
  QryFreightRulesARCUSTO_ID.asFloat:= TblArcustoID.asFloat;
end;

procedure TCust_DM.QryFreightRulesShipToBeforePost(DataSet: TDataSet);
  procedure CheckWeightConflict( AConflictFreight_Rules_ID: Real );
  var S: string;
  begin
    if AConflictFreight_Rules_ID = 0 then
       EXIT;
    S:= SelectValueFmtAsString('select f.descrip from freight_rules r, freight f where r.id = %f and r.freight_id = f.id', [ AConflictFreight_Rules_ID ]);
    raise Exception.CreateFmt('Weight conflict detected with Ship Via ''%s''', [ S ]);
  end;

begin
  with DataSet as TFDQuery do
    if FieldByName('ID').asFloat = 0 then FieldByName('ID').asFloat:= GetNextID('freight_rules');

  IQAssert( QryFreightRulesShipToFROM_WEIGHT.asFloat >= 0, '''From Weight'' cannot be negative number');
  IQAssert( QryFreightRulesShipToFROM_WEIGHT.asFloat < QryFreightRulesShipToTO_WEIGHT.asFloat, '''From Weight'' must be less than ''To Weight''');

  CheckWeightConflict( SelectValueFmtAsFloat('select id from freight_rules where arcusto_id = %f and ship_to_id = %f and id <> %f and %.6f between from_weight and to_weight',
                                 [ QryFreightRulesShipToARCUSTO_ID.asFloat,
                                   QryFreightRulesShipToSHIP_TO_ID.asFloat,
                                   QryFreightRulesShipToID.asFloat,
                                   QryFreightRulesShipToFROM_WEIGHT.asFloat ]));

  CheckWeightConflict( SelectValueFmtAsFloat('select id from freight_rules where arcusto_id = %f and ship_to_id = %f and id <> %f and %.6f between from_weight and to_weight',
                                 [ QryFreightRulesShipToARCUSTO_ID.asFloat,
                                   QryFreightRulesShipToSHIP_TO_ID.asFloat,
                                   QryFreightRulesShipToID.asFloat,
                                   QryFreightRulesShipToTO_WEIGHT.asFloat ]));

  CheckWeightConflict( SelectValueFmtAsFloat('select id from freight_rules where arcusto_id = %f and ship_to_id = %f and id <> %f and (from_weight between %.6f and %.6f OR to_weight between %.6f and %.6f)',
                                 [ QryFreightRulesShipToARCUSTO_ID.asFloat,
                                   QryFreightRulesShipToSHIP_TO_ID.asFloat,
                                   QryFreightRulesShipToID.asFloat,
                                   QryFreightRulesShipToFROM_WEIGHT.asFloat,
                                   QryFreightRulesShipToTO_WEIGHT.asFloat,
                                   QryFreightRulesShipToFROM_WEIGHT.asFloat,
                                   QryFreightRulesShipToTO_WEIGHT.asFloat ]));
end;

procedure TCust_DM.QryFreightRulesShipToNewRecord(DataSet: TDataSet);
begin
  QryFreightRulesShipToARCUSTO_ID.asFloat:= TblArcustoID.asFloat;
  QryFreightRulesShipToSHIP_TO_ID.asFloat:= QryShipToID.asFloat;
end;

procedure TCust_DM.TblShipToLabelsCalcFields(DataSet: TDataSet);
begin
  TblShipToLabelsLM_Label_Menu_Name.asString:= SelectValueByID('label_menu_name', 'lm_labels', TblShipToLabelsLM_LABELS_ID.asFloat );
  if TblShipToLabelsPALLET_CHILD_LM_LABELS_ID.asFloat = 0 then EXIT;

  TblShipToLabelsLM_Label_Menu_Name_Child.asString:= SelectValueByID('label_menu_name', 'lm_labels', TblShipToLabelsPALLET_CHILD_LM_LABELS_ID.asFloat )
end;

procedure TCust_DM.SetBillToDataCoordinator(const Value: TIQWebDataCoordinator);
begin
  FBillToDataCoordinator := Value;
end;

procedure TCust_DM.SetContactDataCoordinator(const Value: TIQWebDataCoordinator);
begin
  FContactDataCoordinator := Value;
end;

procedure TCust_DM.SetShipToDataCoordinator(const Value: TIQWebDataCoordinator);
begin
  FShipToDataCoordinator := Value;
end;

procedure TCust_DM.SrcArcustoDataChange(Sender: TObject; Field: TField);
begin
  ReOpen( QryShipTo ); //EIQ-4349 Customer Maintenance -  Customer Maint > Ship to refresh issue - Internal AB 10-03-14

  { TODO -oathite -cWebConvert : Dpends on cust
  if Assigned(Owner) and (Owner is TFrm_Cust) and TFrm_Cust(Owner).Showing then
    PostMessage(TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_CustomerChanged, 0); }
end;

procedure TCust_DM.SrcBill_ToDataChange(Sender: TObject; Field: TField);
begin
  // 06/10/2013 Post message to owner TFrm_Cust of datasource change.
  // Required for state lists.
  { TODO -oathite -cWebConvert : Dpends on cust
  if Assigned(Owner) and (Owner is TFrm_Cust) and
    (TblBill_to.State in [dsBrowse]) then
    PostMessage(TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_BillToChanged, 0);   }
end;

procedure TCust_DM.SrcContactDataChange(Sender: TObject; Field: TField);
begin
  { TODO -oathite -cWebConvert : Dpends on cust
  if Assigned(Owner) and (Owner is TFrm_Cust) and TFrm_Cust(Owner).Showing and
    (TblContact.State in [dsBrowse]) then
    PostMessage(TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_ContactChanged, 0); }
end;

procedure TCust_DM.SrcShipToLabelsDataChange(Sender: TObject;  Field: TField);
begin
  AssignShipToLabelsPalletChildrenPanelVisible;
end;

procedure TCust_DM.SrcShip_toDataChange(Sender: TObject; Field: TField);
begin
  // 06/10/2013 Post message to owner TFrm_Cust of datasource change.
  // Required for state lists.
  { TODO -oathite -cWebConvert : Dpends on cust
  if Assigned(Owner) and (Owner is TFrm_Cust) and TFrm_Cust(Owner).Showing and
    (QryShipTo.State in [dsBrowse]) then
    PostMessage(TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_ShipToChanged, 0); }
end;

procedure TCust_DM.AssignShipToLabelsPalletChildrenPanelVisible;
begin
  (* TODO -oathite -cWebConvert : Dpends on cust
  if Assigned(Owner) and Assigned(TFrm_Cust(Owner).pnlShipToLabelsPalletChildren) then with TFrm_Cust(Owner) do
  begin
     pnlShipToLabelsPalletChildren.Visible:= TblShipToLabelsEVENT.asFloat = ship_to_labels_share.cSHIP_TO_LABEL_EVENT_ON_SERIAL_CHILDREN;  {reprint of pallet + children}
     splitPalletChildren.Visible:= pnlShipToLabelsPalletChildren.Visible;
     splitPalletChildren.Left:= 0;
  end;     *)
end;

procedure TCust_DM.DoGetTelephoneText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblArcustoUSE_USA_MASK.AsString = 'Y');
end;

procedure TCust_DM.TblContactPHONE_NUMBERGetText(Sender: TField;  var Text: String; DisplayText: Boolean);
begin
  Text := FormatTelephoneText(Sender.AsString, TblContactUSE_USA_MASK.AsString = 'Y');
end;

procedure TCust_DM.TblBill_toPHONE_NUMBERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblBill_toUSE_USA_MASK.AsString = 'Y');
end;

procedure TCust_DM.QryShipToPHONE_NUMBERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, QryShipToUSE_USA_MASK.AsString = 'Y');
end;

procedure TCust_DM.QryContactShipToPHONE_NUMBERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, QryShipToUSE_USA_MASK.AsString = 'Y');
end;

procedure TCust_DM.QryContactBillToPHONE_NUMBERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblBill_toUSE_USA_MASK.AsString = 'Y');
end;

procedure TCust_DM.TblDistCtrPHONE_NUMBERGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblDistCtrUSE_USA_MASK.AsString = 'Y');
end;

procedure TCust_DM.TblFreightBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet, TRUE );
end;

procedure TCust_DM.TblArcustoBeforeDelete(DataSet: TDataSet);
begin
  CheckCanModifyArcusto;

  if SelectValueFmtAsFloat('select v.arcusto_id from ' +
            ' v_c_ship_hist v,                                                    ' +
                    '     ship_to s,                                                    ' +
                    '     c_arinvoice_ship_sum a                                        ' +
                    ' where NVL(v.pending_invoiced_qty, 0) < NVL(v.invoice_qty, 0)      ' +
                    ' and v.qtyshipped > NVL(a.invoiced_qty, 0)                         ' +
                    ' and NVL(v.to_invoice, ''Y'') = ''Y''                              ' +
                    ' and v.ship_to_id = s.id(+)                                        ' +
                    ' and (v.vmi = ''N'' or  (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'')  ) ' +
                    ' and v.shipment_dtl_id = a.shipment_dtl_id(+) and v.arcusto_id = %f', [TblArcustoID.asFloat]) <> 0
  then raise exception.Create(cust_rscstr.cTXT0000049);

end;

procedure TCust_DM.CheckCanModifyArcusto;
begin
  // 09/17/2012
  // FW: Customer Maintenance - change error message when security prevents
  // user from creating new record CRM# 664773
  // Byron
  { TODO -oathite -cWebConvert : Dpends on cust }(*
  if not TFrm_Cust(Owner).SR.ReadWrite['TblArcusto'] then
    // cust_rscstr.cTXT0000005 =
    // 'No new records or modifications are permitted. Contact your DBA'
    raise Exception.Create(cust_rscstr.cTXT0000005);   *)
end;

procedure TCust_DM.TblArcustoBeforeEdit(DataSet: TDataSet);
begin
  CheckCanModifyArcusto;
  FArcustoCommissionsIDBeforePost := TblArcustoCOMMISSIONS_ID.AsLargeInt;
end;

procedure TCust_DM.TblArcustoBeforeInsert(DataSet: TDataSet);
begin
  CheckCanModifyArcusto;
  { TODO -oathite -cWebConvert : Dpends on cust
  if Assigned(Owner) and (Owner is TFrm_Cust) and TFrm_Cust(Owner).Showing then
    PostMessage(TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_SyncLocaleDataSets, 0); }

end;

procedure TCust_DM.CheckAutoEFormSettings(DataSet: TDataSet);
  procedure Check(AFieldName: string);
  var
    AField, AEmailField: TField;
  begin
    // Checkbox field
    AField := DataSet.FindField(AFieldName);
    // Email field
    AEmailField := DataSet.FindField('EMAIL');
    // Validate setting
    if Assigned(AEmailField) and Assigned(AField) and
      (AField is TStringField) and (AField.AsString = 'Y') and
      (AEmailField.AsString = '') then
       raise Exception.Create(Format(
       'Cannot toggle/set %s ON - email address must be assigned.',
       [ AField.DisplayLabel ]))
  end;
begin
  Check('AUTO_EFORM_CS');
  Check('AUTO_EFORM_PS');
  Check('AUTO_EFORM_AR');
  Check('AUTO_EFORM_ORD_ACK');
  Check('AUTO_EFORM_ORD_ACK_CONTACT');
  Check('AUTO_EFORM_BOL');
  Check('AUTO_EFORM_SPC');
  Check('AUTO_EFORM_COC');
  Check('EMAIL_DUNNING');

  if (DataSet.FieldByName('AUTO_EFORM_ORD_ACK').AsString = 'Y') and (DataSet.FieldByName('AUTO_EFORM_ORD_ACK_CONTACT').AsString = 'Y') then
     raise Exception.CreateFmt('Fields ''%s'' and ''%s'' are mutually exclusive - checkmark only one of them.',
                               [ DataSet.FieldByName('AUTO_EFORM_ORD_ACK').DisplayLabel,
                                 DataSet.FieldByName('AUTO_EFORM_ORD_ACK_CONTACT').DisplayLabel ]);
end;



procedure TCust_DM.TblArcustoFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
begin
  // Accept := CheckUserHasCustomerAccess(TblArcustoID.AsFloat);
  Accept:= PkHideManager.CanAccept(DataSet.FieldByName('PK_HIDE').asString);
  if not Accept then
     EXIT;

  // eplant
  Accept:= (SecurityManager.EPlant_ID_AsFloat = 0) or
    (DataSet.FieldByName('EPLANT_ID').asFloat = 0) or
    (SecurityManager.EPlant_ID_AsFloat = DataSet.FieldByName('EPLANT_ID').asFloat );
  if not Accept then
     EXIT;

  // customer access
  if FUseLimitedCustomerAccess then
  begin
    if FExcludeCustomerAccess then
     Accept:= SelectValueFmtAsFloat('select 1 from s_user_crm_customers ' +
      'where user_name = misc.GetUserName and arcusto_id = %.0f',
      [ DataSet.FieldByName('ID').asFloat ]) = 0
    else
     Accept:= SelectValueFmtAsFloat('select 1 from s_user_crm_customers ' +
      'where user_name = misc.GetUserName and arcusto_id = %.0f',
      [ DataSet.FieldByName('ID').asFloat ]) = 1;
    if not Accept then
       EXIT;
  end;

  // 02/16/2009 Check the CRM Prospects filter
  if ExcludeCRMProspects and Accept then
     Accept := TblArcustoCRM_PROSPECT.IsNull or
      (TblArcustoCRM_PROSPECT.AsString = 'N');
end;

procedure TCust_DM.PkArcustoBeforeOpen(DataSet: TDataSet);
var
  ASelectedViewIndex: Integer;
begin
  ASelectedViewIndex:= 0;
  if Assigned(PkHideManager) then
     ASelectedViewIndex:= PkHideManager.SelectedViewIndex;

  AssignQueryParamValue(DataSet, 'selected_view', ASelectedViewIndex);

//  TFDQuery(DataSet).ParamByName('selected_view').Value := ASelectedViewIndex;
end;

procedure TCust_DM.TblContactNewRecord(DataSet: TDataSet);
begin
  CheckApplyUSAMask(DataSet.FieldByName('USE_USA_MASK'));
//  DataSet.FieldByName('USE_USA_MASK').asString:= 'N';
  DataSet.FieldByName('verified_date').asDateTime:= SelectValueAsFloat('select trunc(sysdate) from dual');
end;

procedure TCust_DM.TblBill_toNewRecord(DataSet: TDataSet);
begin
  CheckApplyUSAMask(DataSet.FieldByName('USE_USA_MASK'));
//  DataSet.FieldByName('USE_USA_MASK').asString:= 'N';
end;

procedure TCust_DM.TblContactBeforeEdit(DataSet: TDataSet);
begin
  PostParentsBeforeEdit(DataSet);
  FContactPkHideBeforePost := TblContactPK_HIDE.AsString;
end;

procedure TCust_DM.TblContactBeforeOpen(DataSet: TDataSet);
begin
  TblContact.Filter := IQEPlantFilterExpr(True);
end;

procedure TCust_DM.TblBill_toCalcFields(DataSet: TDataSet);
begin
  TblBill_toTerms.asString := SelectValueFmtAsString('select description from terms where id = %f', [TblBill_toTERMS_ID.asFloat]);
end;

procedure TCust_DM.PkEmpBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AId', TblArcustoID.asFloat);
  AssignQueryParamValue(DataSet, 'AEplantId', TblArcustoEPLANT_ID.asFloat);
//  TFDQuery(Dataset).ParamByName('AId').Value := TblArcustoID.asFloat;
//  TFDQuery(Dataset).ParamByName('AEplantId').Value := TblArcustoEPLANT_ID.asFloat;
end;

procedure TCust_DM.CheckCustomerTemplate;
var
  ACount:Real;
  AQry:TFDQuery;
  AId:Real;

  { Issue:  EIQ-3157 Customer Maintenance - creating new record with customer template
                     yields ORA-02290: check contraint (IQMS.CKC_COC_REQUIRED_ARCUSTO)
                     violated  Nicomatic CRM# 104760 AB 09-26-14}
  procedure _SafeAssignStr( AQryFieldName : string; ATblStrField : TStringField );
  var
    AQryFieldData : string;
  begin
     AQryFieldData:= Trim(AQry.FieldByName(IqFormat('%s',[ AQryFieldName ] )).asString);
     if ( AQryFieldData <> '' ) and ( ATblStrField.asString = '' ) then
         ATblStrField.asString:= AQryFieldData;
  end;

  procedure _SafeAssignFlt( AQryFieldName : string; ATblFloatField : TNumericField );
  var
    AQryFieldData : Real;
  begin
     AQryFieldData:= AQry.FieldByName(IqFormat('%s',[ AQryFieldName ] )).AsFloat;
     if ( AQryFieldData <> 0 ) and ( ATblFloatField.asFloat = 0 ) then
       ATblFloatField.AsBCD:= AQryFieldData;
  end;

  begin (* main *)

  if not (TblArcusto.State in [dsInsert]) then exit;
  ACount := SelectValueAsFloat('select count(id) from ARCUSTO_TEMPLATE');
  if ACount = 0 then exit;
  if ACount = 1 then
    AId := SelectValueAsFloat('select min(id) from ARCUSTO_TEMPLATE')
  else
  begin
    with PkTempl do
    if execute then
      aId := GetValue('ID')
    else
      Exit;
  end;

  AQry := TFDQuery.Create(nil);
  try
    AQry.Connection := UniMainModule.FDConnection1;
    AQry.Sql.Add(IqFormat('select * from ARCUSTO_TEMPLATE where id = %f', [aId]));
    AQry.Open;
    if AQry.Eof and AQry.Bof then exit;
    _SafeAssignFlt('AR_GLACCT_ID', TblArcustoAR_GLACCT_ID );
    _SafeAssignStr('AUTOINVOICE_TECHNIQUE', TblArcustoAUTOINVOICE_TECHNIQUE );
    _SafeAssignStr('COC_REQUIRED', TblArcustoCOC_REQUIRED );
    _SafeAssignFlt('COMMISSIONS_ID', TblArcustoCOMMISSIONS_ID);
    _SafeAssignFlt('COMM_PCNT', TblArcustoCOMM_PCNT);
    _SafeAssignFlt('CREDIT_LIMIT', TblArcustoCREDIT_LIMIT );
    _SafeAssignFlt('CURRENCY_ID', TblArcustoCURRENCY_ID);
    _SafeAssignFlt('DISCOUNT', TblArcustoDISCOUNT);
    _SafeAssignFlt('DUNNING_GROUP_ID', TblArcustoDUNNING_GROUP_ID);
    _SafeAssignStr('DUNNING_EXCLUDE', TblArcustoDUNNING_EXCLUDE);
    _SafeAssignStr('FINANCE_CHARGE', TblArcustoFINANCE_CHARGE);
    _SafeAssignStr('INDUSTRY', TblArcustoINDUSTRY);
    _SafeAssignStr('IS_MAKE_TO_ORDER', TblArcustoIS_MAKE_TO_ORDER);
    _SafeAssignFlt('MIN_CHANGE_INTERVAL', TblArcustoMIN_CHANGE_INTERVAL);
    _SafeAssignStr('ONE_PO_PER_PS', TblArcustoONE_PO_PER_PS);
    _SafeAssignStr('ONE_SO_PER_PS', TblArcustoONE_SO_PER_PS);
    _SafeAssignStr('PS_DATE_ON_INVOICE', TblArcustoPS_DATE_ON_INVOICE);
    _SafeAssignStr('PS_PRESERVE_RAN', TblArcustoPS_PRESERVE_RAN);
    _SafeAssignFlt('QTY_PRICE_BREAK', TblArcustoQTY_PRICE_BREAK);
    _SafeAssignFlt('REBATE_PARAMS_ID', TblArcustoREBATE_PARAMS_ID);
    _SafeAssignStr('REF_TYPE', TblArcustoREF_TYPE);
    _SafeAssignFlt('SAFETY_LEAD_TIME', TblArcustoSAFETY_LEAD_TIME);
    _SafeAssignStr('SHIP_FORECAST', TblArcustoSHIP_FORECAST);
    _SafeAssignStr('SOURCE', TblArcustoSOURCE);
    _SafeAssignStr('STATUS_ID', TblArcustoSTATUS_ID);
    _SafeAssignStr('STATEMENTS',TblArcustoSTATEMENTS);
    _SafeAssignStr('TERRITORY',TblArcustoTERRITORY);
    _SafeAssignFlt('TERMS_ID', TblArcustoTERMS_ID);
    _SafeAssignStr('TRACKING_REQUIRED', TblArcustoTRACKING_REQUIRED);
    _SafeAssignStr('USE_DISCOUNT_TIER', TblArcustoUSE_DISCOUNT_TIER);
    _SafeAssignStr('WEB_PAYMENT_TYPE', TblArcustoWEB_PAYMENT_TYPE);
  finally
    AQry.Free;
  end;

{
AR_GLACCT_ID
AUTOINVOICE_TECHNIQUE
COC_REQUIRED
COMMISSIONS_ID
COMM_PCNT
CREDIT_LIMIT
CURRENCY_ID
DISCOUNT
DUNNING_GROUP_ID
DUNNING_EXCLUDE
FINANCE_CHARGE
INDUSTRY
IS_MAKE_TO_ORDER
MIN_CHANGE_INTERVAL
ONE_PO_PER_PS
ONE_SO_PER_PS
PS_DATE_ON_INVOICE
PS_PRESERVE_RAN
QTY_PRICE_BREAK
REBATE_PARAMS_ID
REF_TYPE
SAFETY_LEAD_TIME
SHIP_FORECAST
SOURCE
STATUS_ID
STATEMENTS
TERRITORY
TERMS_ID
TRACKING_REQUIRED
USE_DISCOUNT_TIER
WEB_PAYMENT_TYPE
}

end;

procedure TCust_DM.PkTemplIQAfterHPickCreate(Sender: TObject);
begin
  IQMS.Common.Controls.ForceForegroundWindowC(TForm(Sender), []);
end;


procedure TCust_DM.CheckResetMutualExclusiveOf( Sender: TField );
begin
  CheckResetMutualExclusiveOf( Sender, Sender.asString = 'Y');
end;

procedure TCust_DM.CheckResetMutualExclusiveOf(Sender: TField;  AChecked: Boolean);
var
  ADataSet: TDataSet;
  AOtherFieldName: string;
  AOtherField: TField;
begin
  if Sender = nil then
     EXIT;

  ADataSet:= Sender.DataSet;
  if not (ADataSet.State in [dsEdit, dsInsert]) then
     EXIT;

  if not AChecked then
     EXIT;

  if Sender.FieldName = 'AUTO_EFORM_PS' then
     AOtherFieldName:= 'AUTO_EFORM_PS_ORD_CONTACT'
  else if Sender.FieldName = 'AUTO_EFORM_PS_ORD_CONTACT' then
     AOtherFieldName:= 'AUTO_EFORM_PS'
  else
     EXIT;

  AOtherField:= ADataSet.FindField(AOtherFieldName);
  if AOtherField = nil then
     EXIT;

  AOtherField.Clear;
end;


function TCust_DM.IsEmailAddrUnique( AEmail : string; AWebUserID: string ) : boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 '+
                     ' from contact where web_userid <> ''%s'' '+
                     '  and upper(trim(email)) = upper(trim(''%s''))', [ AWebUserID, AEmail ]) <> 1;
end;

procedure TCust_DM.QryFreightRulesCalcFields(DataSet: TDataSet);
begin
  QryFreightRulesFreight_Descrip.asString := SelectValueFmtAsString('select descrip from  freight where id = %f', [QryFreightRulesFREIGHT_ID.value]);
end;


procedure TCust_DM.ReassignReadOnlyValues;
begin
  { TODO -oathite -cWebConvert : Dpends on cust
  TFrm_Cust(Owner).cmbCustType.ReadOnly     := false;
  TFrm_Cust(Owner).dbeDiscount.ReadOnly     := false;
  TFrm_Cust(Owner).DBTierDiscount.ReadOnly  := false;
  TFrm_Cust(Owner).DBUseDiscParams.ReadOnly := false;


  if IsUsingTiersOrDiscount and  TFrm_Cust(Owner).DBUseDiscParams.Checked then
  begin
    TFrm_Cust(Owner).cmbCustType.ReadOnly    := true;
    TFrm_Cust(Owner).dbeDiscount.ReadOnly    := true;
    TFrm_Cust(Owner).DBTierDiscount.ReadOnly := true;
  end
  else if (not IsUsingTiersOrDiscount and (not TFrm_Cust(Owner).DBUseDiscParams.Checked)) then
  begin
// everything avaliable    
  end
  else 
  begin
    TFrm_Cust(Owner).cmbCustType.ReadOnly    := TFrm_Cust(Owner).DBUseDiscParams.Checked;
    TFrm_Cust(Owner).dbeDiscount.ReadOnly    := TFrm_Cust(Owner).DBUseDiscParams.Checked;
    TFrm_Cust(Owner).DBTierDiscount.ReadOnly := TFrm_Cust(Owner).DBUseDiscParams.Checked;

    TFrm_Cust(Owner).DBUseDiscParams.ReadOnly := not TFrm_Cust(Owner).DBTierDiscount.ReadOnly;
  end;
  

  
  TFrm_Cust(Owner).DBRevDiscOrder.ReadOnly := not TFrm_Cust(Owner).DBUseDiscParams.Checked;


  TFrm_Cust(Owner).cmbCustType.Enabled     := not TFrm_Cust(Owner).cmbCustType.ReadOnly;
  TFrm_Cust(Owner).dbeDiscount.Enabled     := not TFrm_Cust(Owner).dbeDiscount.ReadOnly;
  TFrm_Cust(Owner).DBTierDiscount.Enabled  := not TFrm_Cust(Owner).DBTierDiscount.ReadOnly;
  TFrm_Cust(Owner).DBUseDiscParams.Enabled := not TFrm_Cust(Owner).DBUseDiscParams.ReadOnly;
  TFrm_Cust(Owner).DBRevDiscOrder.Enabled  := not TFrm_Cust(Owner).DBUseDiscParams.ReadOnly;   }
end;

function  TCust_DM.IsUsingTiersOrDiscount:Boolean;
begin
  Result := ((TblArcustoUSE_DISCOUNT_TIER.AsString = 'Y') or
             (TblArcustoDISCOUNT.asFloat <> 0) or    
             (TblArcustoCUST_TYPE_ID.asFloat <> 0));
end;


procedure TCust_DM.TblArcustoAfterRefresh(DataSet: TDataSet);
begin
  ReassignReadOnlyValues;
end;



end.
