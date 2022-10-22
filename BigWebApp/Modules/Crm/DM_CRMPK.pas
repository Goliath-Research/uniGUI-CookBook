unit DM_CRMPK;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  crm_context,
  crm_const,
  crm_types,
  IQMS.WebVcl.Hpick,
  System.Variants,
  IQMS.WebVcl.QueryNavigator,
  IQMS.Common.PrincipalSourceTypes,
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
  { TDateRangeFilter }
  TDateRangeFilter = packed record
    ByRange: Boolean;
    StartDate: TDateTime;
    EndDate: TDateTime;
  end;

  { TActivityFilter }
  TActivityFilter = packed record
    ActivityType: TActivityType;
    ClosedType: TRecordStatus;
    MyRecordsOnly: Boolean;
    DateRange: TDateRangeFilter;
  end;

  { TCRMPK_DM }
  TCRMPK_DM = class(TDataModule)
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoADDR2: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoID: TBCDField;
    PkArcustoSTATUS_ID: TStringField;
    PkArcustoSTATUS_DATE: TDateTimeField;
    PkArcustoCRM_PROSPECT: TStringField;
    PkArcustoPK_HIDE: TStringField;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    PkVendorCOMPANY: TStringField;
    PkVendorCITY: TStringField;
    PkVendorSTATE: TStringField;
    PkVendorZIP: TStringField;
    PkVendorID: TBCDField;
    PkVendorPK_HIDE: TStringField;
    PkPartner: TIQWebHPick;
    PkPartnerID: TBCDField;
    PkPartnerPARTNERNO: TStringField;
    PkPartnerCOMPANY: TStringField;
    PkPartnerPRIME_CONTACT: TStringField;
    PkPartnerADDR1: TStringField;
    PkPartnerADDR2: TStringField;
    PkPartnerADDR3: TStringField;
    PkPartnerCITY: TStringField;
    PkPartnerSTATE: TStringField;
    PkPartnerZIP: TStringField;
    PkPartnerCOUNTRY: TStringField;
    PkPartnerPARTNER_GROUP: TStringField;
    PkEmployee: TIQWebHPick;
    PkEmployeeID: TFloatField;
    PkEmployeeEMPNO: TStringField;
    PkEmployeeFIRST_NAME: TStringField;
    PkEmployeeLAST_NAME: TStringField;
    PkEmployeeEMAIL: TStringField;
    PkArcustoContacts: TIQWebHPick;
    PkArcustoContactsID: TBCDField;
    PkArcustoContactsARCUSTO_ID: TBCDField;
    PkArcustoContactsSALUTATION: TStringField;
    PkArcustoContactsLAST_NAME: TStringField;
    PkArcustoContactsFIRST_NAME: TStringField;
    PkArcustoContactsTITLE: TStringField;
    PkArcustoContactsPHONE_NUMBER: TStringField;
    PkArcustoContactsEXT: TStringField;
    PkArcustoContactsFAX_NUMBER: TStringField;
    PkArcustoContactsEMAIL: TStringField;
    PkArcustoContactsPAGER: TStringField;
    PkArcustoContactsCOMPANY: TStringField;
    PkArcustoContactsADDR1: TStringField;
    PkArcustoContactsCITY: TStringField;
    PkArcustoContactsSTATE: TStringField;
    PkArcustoContactsZIP: TStringField;
    PkArcustoContactsPK_HIDE: TStringField;
    PkArcustoContactsCRM_PROSPECT: TStringField;
    PkVendorContacts: TIQWebHPick;
    PkVendorContactsID: TBCDField;
    PkVendorContactsVENDOR_ID: TBCDField;
    PkVendorContactsSALUTATION: TStringField;
    PkVendorContactsLAST_NAME: TStringField;
    PkVendorContactsFIRST_NAME: TStringField;
    PkVendorContactsTITLE: TStringField;
    PkVendorContactsPHONE_NUMBER: TStringField;
    PkVendorContactsEXT: TStringField;
    PkVendorContactsFAX_NUMBER: TStringField;
    PkVendorContactsEMAIL: TStringField;
    PkVendorContactsPAGER: TStringField;
    PkVendorContactsCOMPANY: TStringField;
    PkVendorContactsADDR1: TStringField;
    PkVendorContactsCITY: TStringField;
    PkVendorContactsSTATE: TStringField;
    PkVendorContactsZIP: TStringField;
    PkVendorContactsPK_HIDE: TStringField;
    PkPartnerContacts: TIQWebHPick;
    PkPartnerContactsID: TBCDField;
    PkPartnerContactsPARTNER_ID: TBCDField;
    PkPartnerContactsSALUTATION: TStringField;
    PkPartnerContactsLAST_NAME: TStringField;
    PkPartnerContactsFIRST_NAME: TStringField;
    PkPartnerContactsTITLE: TStringField;
    PkPartnerContactsPHONE_NUMBER: TStringField;
    PkPartnerContactsEXT: TStringField;
    PkPartnerContactsFAX_NUMBER: TStringField;
    PkPartnerContactsEMAIL: TStringField;
    PkPartnerContactsCOMPANY: TStringField;
    PkPartnerContactsADDR1: TStringField;
    PkPartnerContactsCITY: TStringField;
    PkPartnerContactsSTATE: TStringField;
    PkPartnerContactsZIP: TStringField;
    PkPartnerContactsPK_HIDE: TStringField;
    PkEmployeeUSER_NAME: TStringField;
    PkPartnerContactsPAGER: TStringField;
    PkGroups: TIQWebHPick;
    PkGroupsID: TBCDField;
    PkGroupsNAME: TStringField;
    PkGroupsDESCRIPTION: TStringField;
    PkEmployeeEPLANT_ID: TFloatField;
    PkEmployeeEPLANT_NAME: TStringField;
    PkPartnerPK_HIDE: TStringField;
    PkArinvt: TIQWebHPick;
    PkArinvtID: TBCDField;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtPK_HIDE: TStringField;
    PkEmployeeDISPLAY_NAME: TStringField;
    PkActivity: TIQWebHPick;
    PkActivitySTARTDATE: TDateTimeField;
    PkActivityFINISHDATE: TDateTimeField;
    PkActivityUSER_ID: TStringField;
    PkActivityASSIGNEDTO_DISPLAY: TStringField;
    PkActivityASSIGNEDTO_LOGIN_NAME: TStringField;
    PkActivityCOMPANY: TStringField;
    PkActivityCUSTOMER_ADDR1: TStringField;
    PkActivityCUSTOMER_ADDR2: TStringField;
    PkActivityCUSTOMER_ADDR3: TStringField;
    PkActivityCUSTOMER_CITY: TStringField;
    PkActivityCUSTOMER_STATE: TStringField;
    PkActivityCUSTOMER_ZIP: TStringField;
    PkActivityCUSTOMER_PHONE_NUMBER: TStringField;
    PkActivityCUSTOMER_EXT: TStringField;
    PkActivityCUSTOMER_FAX_NUMBER: TStringField;
    PkActivityFIRST_NAME: TStringField;
    PkActivityLAST_NAME: TStringField;
    PkActivityCONTACT_TITLE: TStringField;
    PkActivityCONTACT_PHONE_NUMBER: TStringField;
    PkActivityCONTACT_EXT: TStringField;
    PkActivityCONTACT_FAX_NUMBER: TStringField;
    PkActivityCONTACT_EMAIL: TStringField;
    PkActivityID: TBCDField;
    PkActivityPRINCIPLE_SOURCE_DISP: TStringField;
    PkActivitySOURCE_DISPLAY: TStringField;
    PkWarranty: TIQWebHPick;
    PkWarrantyID: TBCDField;
    PkWarrantySERIAL: TStringField;
    PkWarrantyACTIVE_DATE: TDateTimeField;
    PkWarrantyINACTIVE_DATE: TDateTimeField;
    PkWarrantyDURATION_DISPLAY: TStringField;
    PkWarrantyARINVT_ITEMNO: TStringField;
    PkWarrantyARINVT_DESCRIP: TStringField;
    PkWarrantyARINVT_DESCRIP2: TStringField;
    PkWarrantyARINVT_CLASS: TStringField;
    PkWarrantyARINVT_REV: TStringField;
    PkWarrantyARCUSTO_CUSTNO: TStringField;
    PkWarrantyARCUSTO_COMPANY: TStringField;
    PkCampaign: TIQWebHPick;
    PkCampaignID: TFloatField;
    PkCampaignCODE: TStringField;
    PkCampaignDESCRIPTION: TStringField;
    PkOpportunity: TIQWebHPick;
    PkOpportunityID: TBCDField;
    PkOpportunityOPP_NO: TStringField;
    PkOpportunityDESCRIPTION: TStringField;
    PkOpportunityPRINCIPLE_COMPANYNO: TStringField;
    PkOpportunityPRINCIPLE_COMPANY: TStringField;
    PkOpportunityPRINCIPLE_ADDR1: TStringField;
    PkOpportunityPRINCIPLE_ADDR2: TStringField;
    PkOpportunityPRINCIPLE_ADDR3: TStringField;
    PkOpportunityPRINCIPLE_CITY: TStringField;
    PkOpportunityPRINCIPLE_STATE: TStringField;
    PkOpportunityPRINCIPLE_ZIP: TStringField;
    PkOpportunityPRINCIPLE_COUNTRY: TStringField;
    PkOpportunityPRINCIPLE_COMPANY_PHONE: TStringField;
    PkOpportunityPRINCIPLE_COMPANY_EXT: TStringField;
    PkOpportunityPRINCIPLE_COMPANY_FAX: TStringField;
    PkOpportunityPRINCIPLE_COMPANY_URL: TStringField;
    PkOpportunityPRINCIPLE_FIRST_NAME: TStringField;
    PkOpportunityPRINCIPLE_LAST_NAME: TStringField;
    PkOpportunityPRINCIPLE_TITLE: TStringField;
    PkOpportunityPRINCIPLE_CONTACT_EMAIL: TStringField;
    PkOpportunityPRINCIPLE_CONTACT_PHONE: TStringField;
    PkOpportunityPRINCIPLE_CONTACT_EXT: TStringField;
    PkOpportunityPRINCIPLE_CONTACT_FAX: TStringField;
    PkOpportunityPRINCIPLE_CRM_PROSPECT: TStringField;
    PkOpportunityVALUE: TFMTBCDField;
    PkOpportunitySTATUS_CODE: TStringField;
    PkOpportunitySTATUS_DESCRIPTION: TStringField;
    PkOpportunitySTATUS_DATE: TDateTimeField;
    PkOpportunityDATE_OPENED: TDateTimeField;
    PkOpportunityDATE_CLOSED_EXPECT: TDateTimeField;
    PkOpportunityDATE_CLOSED_ACTUAL: TDateTimeField;
    PkOpportunityPK_HIDE: TStringField;
    PkProject: TIQWebHPick;
    PkProjectID: TBCDField;
    PkProjectRFQ: TStringField;
    PkProjectPROJECT: TStringField;
    PkProjectCREATE_DATE: TDateTimeField;
    PkProjectCOMPANY: TStringField;
    PkProjectWORKORDERNO: TStringField;
    PkProjectEQNO: TStringField;
    PkProjectARCHIVED: TStringField;
    PkProjectEPLANT_NAME: TStringField;
    PkProjectEPLANT_ID: TBCDField;
    PkProjectPLM_ITEMNO: TStringField;
    PkProjectPLM_DESCRIP: TStringField;
    PkProjectPLM_REV: TStringField;
    PkProjectPLM_CLASS: TStringField;
    PkWarrantyRegCust: TIQWebHPick;
    PkWarrantyRegCustID: TBCDField;
    PkWarrantyRegCustCRM_WARRANTY_ID: TBCDField;
    PkWarrantyRegCustARCUSTO_ID: TBCDField;
    PkWarrantyRegCustARCUSTO_CUSTNO: TStringField;
    PkWarrantyRegCustARCUSTO_COMPANY: TStringField;
    PkWarrantyRegCustTRANSFER_DATE: TDateTimeField;
    PkWarrantyRegCustCREATED: TDateTimeField;
    PkWarrantyRegCustCREATEDBY: TStringField;
    PkWarrantyComb: TIQWebHPick;
    PkWarrantyCombID: TBCDField;
    PkWarrantyCombSERIAL: TStringField;
    PkWarrantyCombACTIVE_DATE: TDateTimeField;
    PkWarrantyCombINACTIVE_DATE: TDateTimeField;
    PkWarrantyCombDURATION_DISPLAY: TStringField;
    PkWarrantyCombARINVT_ID: TBCDField;
    PkWarrantyCombARINVT_ITEMNO: TStringField;
    PkWarrantyCombARINVT_DESCRIP: TStringField;
    PkWarrantyCombARINVT_DESCRIP2: TStringField;
    PkWarrantyCombARINVT_CLASS: TStringField;
    PkWarrantyCombARINVT_REV: TStringField;
    PkWarrantyCombSOLD_ARCUSTO_ID: TBCDField;
    PkWarrantyCombARCUSTO_CUSTNO: TStringField;
    PkWarrantyCombARCUSTO_COMPANY: TStringField;
    PkWarrantyCombREGCUST_ID: TBCDField;
    PkWarrantyCombREGCUST_ARCUSTO_ID: TBCDField;
    PkWarrantyCombREGCUST_ARCUSTO_CUSTNO: TStringField;
    PkWarrantyCombREGCUST_ARCUSTO_COMPANY: TStringField;
    PkWarrantyCombREGCUST_TRANSFER_DATE: TDateTimeField;
    PkActivitySUBJECT: TStringField;
    PkActivityREGARDING: TStringField;
    PkArcustoUD: TIQWebHPick;
    PkArcustoUDID: TBCDField;
    PkArcustoUDCUSTNO: TStringField;
    PkArcustoUDCOMPANY: TStringField;
    PkArcustoUDSTATE: TStringField;
    PkArcustoUDCUSER1: TStringField;
    PkArcustoUDCUSER2: TStringField;
    PkArcustoUDCUSER3: TStringField;
    PkArcustoUDCUSER4: TStringField;
    PkArcustoUDCUSER5: TStringField;
    PkArcustoUDCUSER6: TStringField;
    PkArcustoUDCRM_CUSER1: TStringField;
    PkArcustoUDCRM_CUSER2: TStringField;
    PkArcustoUDCRM_CUSER3: TStringField;
    PkArcustoUDCRM_CUSER4: TStringField;
    PkArcustoUDCRM_CUSER5: TStringField;
    PkArcustoUDCRM_CUSER6: TStringField;
    PkArcustoUDCRM_CUSER7: TStringField;
    PkArcustoUDCRM_CUSER8: TStringField;
    PkArcustoUDCRM_CUSER9: TStringField;
    PkArcustoUDCRM_CUSER10: TStringField;
    PkArcustoUDCUST_TYPE_DESCRIP: TStringField;
    PkArcustoUDADDR1: TStringField;
    PkArcustoUDCITY: TStringField;
    PkArcustoUDZIP: TStringField;
    PkArcustoUDCOUNTRY: TStringField;
    PkCampaignArchived: TIQWebHPick;
    PkCampaignArchivedID: TFloatField;
    PkCampaignArchivedCODE: TStringField;
    PkCampaignArchivedDESCRIPTION: TStringField;
    PkCampaignPK_HIDE: TStringField;
    PkArcustoContactsMOBILE: TStringField;
    PkVendorContactsMOBILE: TStringField;
    PkPartnerContactsMOBILE: TStringField;
    PkJobShop: TIQWebHPick;
    PkJobShopPROJECTNO: TStringField;
    PkJobShopPROJECT_DESCRIP: TStringField;
    PkJobShopCUSTNO: TStringField;
    PkJobShopCOMPANY: TStringField;
    PkJobShopITEMNO: TStringField;
    PkJobShopDESCRIP: TStringField;
    PkJobShopREV: TStringField;
    PkJobShopMFGNO: TStringField;
    PkJobShopCNTR_TYPE: TStringField;
    PkJobShopMFG_TYPE: TStringField;
    PkJobShopIS_OPEN: TStringField;
    PkJobShopARCHIVED: TStringField;
    PkJobShopID: TBCDField;
    PkJobShopSTATUS: TStringField;
    PkJobShopSTARTED: TStringField;
    PkWorkFlow: TIQWebHPick;
    PkWorkFlowWORKFLOWNO: TStringField;
    PkWorkFlowWF_TYPE_NAME: TStringField;
    PkWorkFlowDEPARTMENT: TStringField;
    PkWorkFlowSEQ_WORKFLOW: TStringField;
    PkWorkFlowINITIATOR: TStringField;
    PkWorkFlowIS_STARTED: TStringField;
    PkWorkFlowOPEN_DATE: TDateTimeField;
    PkWorkFlowEFFECT_DATE: TDateTimeField;
    PkWorkFlowCOMPLETE_DATE: TDateTimeField;
    PkWorkFlowCLOSE_DATE: TDateTimeField;
    PkWorkFlowARCUSTO_CUSTNO: TStringField;
    PkWorkFlowARCUSTO_COMPANY: TStringField;
    PkWorkFlowVENDOR_VENDORNO: TStringField;
    PkWorkFlowVENDOR_COMPANY: TStringField;
    PkWorkFlowCARNO: TStringField;
    PkWorkFlowECONO: TStringField;
    PkWorkFlowKIND: TStringField;
    PkWorkFlowDEV_TYPE: TStringField;
    PkWorkFlowID: TBCDField;
    PkWorkFlowARCUSTO_ID: TBCDField;
    PkWorkFlowEPLANT_ID: TBCDField;
    PkWorkFlowWF_TYPE_ID: TBCDField;
    PkEmployeePK_HIDE: TStringField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtEPLANT_NAME: TStringField;
    PkVendorADDR1: TStringField;
    PkVendorADDR2: TStringField;
    PkVendorADDR3: TStringField;
    PkVendorCOUNTRY: TStringField;
    PkJobShopDESCRIP2: TStringField;
    PkPLM: TIQWebHPick;
    PkPLMPROJECTNO: TStringField;
    PkPLMPROJECT_NAME: TStringField;
    PkPLMDESCRIP: TStringField;
    PkPLMARCUSTO_CUSTNO: TStringField;
    PkPLMARCUSTO_COMPANY: TStringField;
    PkPLMCONTACT_FIRST_NAME: TStringField;
    PkPLMCONTACT_LAST_NAME: TStringField;
    PkPLMMY_FROM_DATE: TStringField;
    PkPLMMY_TO_DATE: TStringField;
    PkPLMCREATE_DATE: TDateTimeField;
    PkPLMRECEIVE_DATE: TDateTimeField;
    PkPLMSTATUS: TStringField;
    PkPLMKIND: TStringField;
    PkPLMARCHIVED: TStringField;
    PkPLMID: TBCDField;
    PkPLMARCUSTO_ID: TBCDField;
    PkPLMCONTACT_ID: TBCDField;
    PkPLMEPLANT_ID: TBCDField;
    PkPLMUSERID: TStringField;
    PkPLMCUSER1: TStringField;
    PkPLMCUSER2: TStringField;
    PkPLMCUSER3: TStringField;
    PkPLMCUSER4: TStringField;
    PkPLMCUSER5: TStringField;
    PkPLMCUSER6: TStringField;
    PkPLMCUSER7: TStringField;
    PkPLMCUSER8: TStringField;
    PkPLMCUSER9: TStringField;
    PkPLMCUSER10: TStringField;
    PkPLMNUSER1: TFMTBCDField;
    PkPLMNUSER2: TFMTBCDField;
    PkPLMNUSER3: TFMTBCDField;
    PkPLMNUSER4: TFMTBCDField;
    PkPLMNUSER5: TFMTBCDField;
    PkPLMNUSER6: TFMTBCDField;
    PkPLMNUSER7: TFMTBCDField;
    PkPLMNUSER8: TFMTBCDField;
    PkPLMNUSER9: TFMTBCDField;
    PkPLMNUSER10: TFMTBCDField;
    PkPLMDIVISION_ID: TBCDField;
    PkPLMALPHA: TDateTimeField;
    PkPLMBETA: TDateTimeField;
    PkPLMJOB1: TDateTimeField;
    PkPLMPILOT: TDateTimeField;
    PkPLMMFGTYPE: TStringField;
    PkPLMPK_HIDE: TStringField;
    PkEngineeringQuote: TIQWebHPick;
    PkEngineeringQuoteRFQ: TStringField;
    PkEngineeringQuotePROJECT: TStringField;
    PkEngineeringQuoteQUOTE_DATE: TDateTimeField;
    PkEngineeringQuoteQUOTE_REV: TBCDField;
    PkEngineeringQuoteID: TBCDField;
    PkEngineeringQuoteEPLANT_ID: TBCDField;
    PkEngineeringQuoteMFGNO: TStringField;
    PkEngineeringQuoteMFG_TYPE: TStringField;
    PkEngineeringQuoteMFGCELL: TStringField;
    PkEngineeringQuoteEXPIRY_DATE: TDateTimeField;
    PkEngineeringQuoteDUE_DATE: TDateTimeField;
    PkEngineeringQuoteCUSTNO: TStringField;
    PkEngineeringQuoteCOMPANY: TStringField;
    PkEngineeringQuoteADDR1: TStringField;
    PkEngineeringQuoteADDR2: TStringField;
    PkEngineeringQuoteADDR3: TStringField;
    PkEngineeringQuoteCITY: TStringField;
    PkEngineeringQuoteSTATE: TStringField;
    PkEngineeringQuoteZIP: TStringField;
    PkEngineeringQuoteCOUNTRY: TStringField;
    PkOpportunityASSIGNEDTO_DISPLAY: TStringField;
    PkOpportunityASSIGNEDTO: TStringField;
    PkArcustoContactsADDR2: TStringField;
    PkArcustoContactsADDR3: TStringField;
    PkArcustoContactsCOUNTRY: TStringField;
    PkVendorContactsCOUNTRY: TStringField;
    PkVendorContactsADDR2: TStringField;
    PkVendorContactsADDR3: TStringField;
    PkPartnerContactsADDR2: TStringField;
    PkPartnerContactsADDR3: TStringField;
    PkPartnerContactsCOUNTRY: TStringField;
    PkPartnerContactsPARTNERNO: TStringField;
    PkVendorContactsVENDORNO: TStringField;
    PkArcustoContactsCUSTNO: TStringField;
    PkSupport: TIQWebHPick;
    PkSupportID: TBCDField;
    PkSupportSTARTDATE: TDateTimeField;
    PkSupportFINISHDATE: TDateTimeField;
    PkSupportSTATUS: TStringField;
    PkSupportASSIGNEDTO_LOGIN_NAME: TStringField;
    PkSupportASSIGNEDTO_DISPLAY: TStringField;
    PkSupportUSER_ID: TStringField;
    PkSupportSUMMARY: TStringField;
    PkSupportQUEUE_NAME: TStringField;
    PkSupportSUBQUEUE_NAME: TStringField;
    PkSupportCOMPANYNO: TStringField;
    PkSupportCOMPANY: TStringField;
    PkSupportCUSTOMER_ADDR1: TStringField;
    PkSupportCUSTOMER_ADDR2: TStringField;
    PkSupportCUSTOMER_ADDR3: TStringField;
    PkSupportCUSTOMER_CITY: TStringField;
    PkSupportCUSTOMER_STATE: TStringField;
    PkSupportCUSTOMER_ZIP: TStringField;
    PkSupportCUSTOMER_PHONE_NUMBER: TStringField;
    PkSupportCUSTOMER_EXT: TStringField;
    PkSupportCUSTOMER_FAX_NUMBER: TStringField;
    PkSupportFIRST_NAME: TStringField;
    PkSupportLAST_NAME: TStringField;
    PkSupportCONTACT_TITLE: TStringField;
    PkSupportCONTACT_PHONE_NUMBER: TStringField;
    PkSupportCONTACT_EXT: TStringField;
    PkSupportCONTACT_FAX_NUMBER: TStringField;
    PkSupportCONTACT_EMAIL: TStringField;
    PkSupportBILL_TO_ATTN: TStringField;
    PkSupportSHIP_TO_ATTN: TStringField;
    PkSupportACTIVITY_TYPE_NAME: TStringField;
    PkBillTo: TIQWebHPick;
    PkBillToID: TBCDField;
    PkBillToARCUSTO_ID: TBCDField;
    PkBillToPRIME_CONTACT: TStringField;
    PkBillToATTN: TStringField;
    PkBillToADDR1: TStringField;
    PkBillToADDR2: TStringField;
    PkBillToADDR3: TStringField;
    PkBillToCITY: TStringField;
    PkBillToSTATE: TStringField;
    PkBillToZIP: TStringField;
    PkBillToPK_HIDE: TStringField;
    PkShipTo: TIQWebHPick;
    PkShipToID: TBCDField;
    PkShipToARCUSTO_ID: TBCDField;
    PkShipToPRIME_CONTACT: TStringField;
    PkShipToATTN: TStringField;
    PkShipToADDR1: TStringField;
    PkShipToADDR2: TStringField;
    PkShipToADDR3: TStringField;
    PkShipToCITY: TStringField;
    PkShipToSTATE: TStringField;
    PkShipToZIP: TStringField;
    PkShipToEPLANT: TStringField;
    PkShipToPK_HIDE: TStringField;
    PkArinvtBase: TIQWebHPick;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField2: TBCDField;
    StringField7: TStringField;
    PkArinvtSTD_COST: TFMTBCDField;
    PkAddressLookup: TIQWebHPick;
    PkAddressLookupADDR1: TStringField;
    PkAddressLookupADDR2: TStringField;
    PkAddressLookupADDR3: TStringField;
    PkAddressLookupCITY: TStringField;
    PkAddressLookupSTATE: TStringField;
    PkAddressLookupZIP: TStringField;
    PkAddressLookupCOUNTRY: TStringField;
    PkAddressLookupPHONE_NUMBER: TStringField;
    PkAddressLookupFAX_NUMBER: TStringField;
    PkCRMQuote: TIQWebHPick;
    PkCRMQuoteRFQ: TStringField;
    PkCRMQuotePROJECT: TStringField;
    PkCRMQuoteQUOTE_DATE: TDateTimeField;
    PkCRMQuoteEXPIRATION_DATE: TDateTimeField;
    PkCRMQuoteFIRST_NAME: TStringField;
    PkCRMQuoteLAST_NAME: TStringField;
    PkCRMQuoteTYPE: TBCDField;
    PkCRMQuoteREV: TBCDField;
    PkCRMQuoteID: TBCDField;
    PkCRMQuoteARCUSTO_ID: TBCDField;
    PkCRMQuoteCONTACT_ID: TBCDField;
    PkCRMQuoteUSERID: TStringField;
    PkCRMQuoteASSIGNEDTO_DISPLAY: TStringField;
    PkCRMQuoteASSIGNEDTO: TStringField;
    PkCRMQuoteASSIGNEDBY: TStringField;
    PkCRMQuoteASSIGNEDDATE: TDateTimeField;
    PkCRMQuoteEPLANT_ID: TBCDField;
    PkCRMQuoteCRM_PROSPECT: TStringField;
    PkCRMQuotePK_HIDE: TStringField;
    PkCRMQuotePONO: TStringField;
    PkCRMQuoteARCUSTO_ADDR1: TStringField;
    PkCRMQuoteARCUSTO_ADDR2: TStringField;
    PkCRMQuoteARCUSTO_ADDR3: TStringField;
    PkCRMQuoteARCUSTO_CITY: TStringField;
    PkCRMQuoteARCUSTO_STATE: TStringField;
    PkCRMQuoteARCUSTO_ZIP: TStringField;
    PkCRMQuoteARCUSTO_COUNTRY: TStringField;
    PkCRMQuoteBILL_TO: TStringField;
    PkCRMQuoteBILLTO_ADDR1: TStringField;
    PkCRMQuoteBILLTO_ADDR2: TStringField;
    PkCRMQuoteBILLTO_ADDR3: TStringField;
    PkCRMQuoteBILLTO_CITY: TStringField;
    PkCRMQuoteBILLTO_STATE: TStringField;
    PkCRMQuoteBILLTO_ZIP: TStringField;
    PkCRMQuoteBILLTO_COUNTRY: TStringField;
    PkCRMQuoteSHIP_TO: TStringField;
    PkCRMQuoteSHIPTO_ADDR1: TStringField;
    PkCRMQuoteSHIPTO_ADDR2: TStringField;
    PkCRMQuoteSHIPTO_ADDR3: TStringField;
    PkCRMQuoteSHIPTO_CITY: TStringField;
    PkCRMQuoteSHIPTO_STATE: TStringField;
    PkCRMQuoteSHIPTO_ZIP: TStringField;
    PkCRMQuoteSHIPTO_COUNTRY: TStringField;
    PkCRMQuoteOPP_NO: TStringField;
    PkCRMQuoteEPLANT_NAME: TStringField;
    PkCRMQuoteLASTCHANGEDBY: TStringField;
    PkCRMQuoteLASTCHANGEDATE: TDateTimeField;
    PkCRMQuoteCUSER1: TStringField;
    PkCRMQuoteCUSER2: TStringField;
    PkCRMQuoteCUSER3: TStringField;
    PkCRMQuoteCUSER4: TStringField;
    PkCRMQuoteCUSER5: TStringField;
    PkCRMQuoteCUSER6: TStringField;
    PkCRMQuoteARINVT_ITEMNO: TStringField;
    PkCRMQuoteARINVT_DESCRIP: TStringField;
    PkCRMQuoteARINVT_DESCRIP2: TStringField;
    PkCRMQuoteARINVT_CLASS: TStringField;
    PkCRMQuoteARINVT_REV: TStringField;
    PkCRMQuoteCUST_ITEMNO: TStringField;
    PkCRMQuoteCUST_DESCRIP: TStringField;
    PkCRMQuoteCUST_DESCRIP2: TStringField;
    PkCRMQuoteCUST_REV: TStringField;
    PkTiers: TIQWebHPick;
    PkTiersID: TBCDField;
    PkTiersDESCRIP: TStringField;
    PkTiersSOURCE: TStringField;
    PkTiersEMAIL: TStringField;
    PkTiersSOURCE_DISP: TStringField;
    PkArcustoSALESPERSON: TStringField;
    PkArcustoContactsSALESPERSON: TStringField;
    PkEmployeeMIDDLE_NAME: TStringField;
    PkActivityMIDDLE_NAME: TStringField;
    PkSupportMIDDLE_NAME: TStringField;
    PkOpportunityPRINCIPLE_MIDDLE_NAME: TStringField;
    PkBillToCUSTNO: TStringField;
    PkBillToCOMPANY: TStringField;
    PkShipToCUSTNO: TStringField;
    PkShipToCOMPANY: TStringField;
    PkSupportCREATED: TDateTimeField;
    PkSupportCHANGED: TDateTimeField;
    PkSupportCHANGEDBY: TStringField;
    PkSupportCUSTOMER_COUNTRY: TStringField;
    PkActivityCREATED: TDateTimeField;
    PkActivityCHANGED: TDateTimeField;
    PkActivityCHANGEDBY: TStringField;
    PkActivityPRINCIPLE_COUNTRY: TStringField;
    PkSalesStage: TIQWebHPick;
    PkSalesStageID: TBCDField;
    PkSalesStageCODE: TStringField;
    PkSalesStageDESCRIP: TStringField;
    PkSalesStageACCESS_LEVEL: TBCDField;
    PkSalesStageANCHOR: TStringField;
    PkTerritory: TIQWebHPick;
    PkTerritoryID: TBCDField;
    PkTerritoryCODE: TStringField;
    PkTerritoryDESCRIP: TStringField;
    PkTerritoryPARENT_ID: TBCDField;
    PkTerritoryPARENT_CODE: TStringField;
    PkTerritoryPARENT_DESCRIP: TStringField;
    PkOpportunityForCustomer: TIQWebHPick;
    PkOpportunityForCustomerID: TBCDField;
    PkOpportunityForCustomerOPP_NO: TStringField;
    PkOpportunityForCustomerDESCRIPTION: TStringField;
    PkOpportunityForCustomerPRINCIPLE_COMPANYNO: TStringField;
    PkOpportunityForCustomerPRINCIPLE_COMPANY: TStringField;
    PkOpportunityForCustomerPRINCIPLE_ADDR1: TStringField;
    PkOpportunityForCustomerPRINCIPLE_ADDR2: TStringField;
    PkOpportunityForCustomerPRINCIPLE_ADDR3: TStringField;
    PkOpportunityForCustomerPRINCIPLE_CITY: TStringField;
    PkOpportunityForCustomerPRINCIPLE_STATE: TStringField;
    PkOpportunityForCustomerPRINCIPLE_ZIP: TStringField;
    PkOpportunityForCustomerPRINCIPLE_COUNTRY: TStringField;
    PkOpportunityForCustomerPRINCIPLE_COMPANY_PHONE: TStringField;
    PkOpportunityForCustomerPRINCIPLE_COMPANY_EXT: TStringField;
    PkOpportunityForCustomerPRINCIPLE_COMPANY_FAX: TStringField;
    PkOpportunityForCustomerPRINCIPLE_COMPANY_URL: TStringField;
    PkOpportunityForCustomerPRINCIPLE_FIRST_NAME: TStringField;
    PkOpportunityForCustomerPRINCIPLE_MIDDLE_NAME: TStringField;
    PkOpportunityForCustomerPRINCIPLE_LAST_NAME: TStringField;
    PkOpportunityForCustomerPRINCIPLE_TITLE: TStringField;
    PkOpportunityForCustomerPRINCIPLE_CONTACT_EMAIL: TStringField;
    PkOpportunityForCustomerPRINCIPLE_CONTACT_PHONE: TStringField;
    PkOpportunityForCustomerPRINCIPLE_CONTACT_EXT: TStringField;
    PkOpportunityForCustomerPRINCIPLE_CONTACT_FAX: TStringField;
    PkOpportunityForCustomerPRINCIPLE_CRM_PROSPECT: TStringField;
    PkOpportunityForCustomerVALUE: TFMTBCDField;
    PkOpportunityForCustomerSTATUS_CODE: TStringField;
    PkOpportunityForCustomerSTATUS_DESCRIPTION: TStringField;
    PkOpportunityForCustomerSTATUS_DATE: TDateTimeField;
    PkOpportunityForCustomerDATE_OPENED: TDateTimeField;
    PkOpportunityForCustomerDATE_CLOSED_EXPECT: TDateTimeField;
    PkOpportunityForCustomerDATE_CLOSED_ACTUAL: TDateTimeField;
    PkOpportunityForCustomerPK_HIDE: TStringField;
    PkOpportunityForCustomerASSIGNEDTO_DISPLAY: TStringField;
    PkOpportunityForCustomerASSIGNEDTO: TStringField;
    PkOpportunityCUSER1: TStringField;
    PkOpportunityCUSER2: TStringField;
    PkOpportunityCUSER3: TStringField;
    PkOpportunityCUSER4: TStringField;
    PkOpportunityCUSER5: TStringField;
    PkOpportunityForCustomerCUSER1: TStringField;
    PkOpportunityForCustomerCUSER2: TStringField;
    PkOpportunityForCustomerCUSER3: TStringField;
    PkOpportunityForCustomerCUSER4: TStringField;
    PkOpportunityForCustomerCUSER5: TStringField;
    PkCRMQuoteARCUSTO_CUSTNO: TStringField;
    PkCRMQuoteARCUSTO_COMPANY: TStringField;
    PkSupportResolutionType: TIQWebHPick;
    PkSupportResolutionTypeID: TBCDField;
    PkSupportResolutionTypeNAME: TStringField;
    PkSupportResolutionTypeDESCRIPTION: TStringField;
    PkRefCode: TIQWebHPick;
    PkRefCodeCATEGORY_ID: TBCDField;
    PkRefCodeCATEGORY_DESCRIP: TStringField;
    PkRefCodeREF_CODE_ID: TBCDField;
    PkRefCodeREF_CODE_DESCRIP: TStringField;
    PkRefCodeREF_CODE: TStringField;
    PkOpportunitySALES_STAGE_CODE: TStringField;
    PkOpportunityForCustomerSALES_STAGE_CODE: TStringField;
    PkCRMQuoteSOURCE_DISPLAY: TStringField;
    PkCRMQuoteSALES_CONFIG_NAME: TStringField;
    PkCRMQuoteSOURCE_TYPE_DISPLAY: TStringField;
    PkArinvtCONFIG_CODE: TStringField;
    PkCRMQuoteCONFIG_CODE: TStringField;
    PkArinvtBaseCONFIG_CODE: TStringField;
    PkSupportSEVERITY_NAME: TStringField;
    PkSupportSEVERITY_COLOR: TBCDField;
    PkOrders: TIQWebHPick;
    PkOrdersID: TBCDField;
    PkOrdersORDERNO: TStringField;
    PkOrdersPONO: TStringField;
    PkOrdersDATE_TAKEN: TDateTimeField;
    PkOrdersORD_BY: TStringField;
    PkOrdersCUSTNO: TStringField;
    PkOrdersCOMPANY: TStringField;
    PkOrdersSHIP_TO_ATTN: TStringField;
    PkOrdersBILL_TO_ATTN: TStringField;
    PkOrdersCRM_QUOTE_RFQ: TStringField;
    PkOrdersEPLANT_ID: TBCDField;
    procedure AssignProspectFilter(DataSet: TDataSet);
    procedure AssignMasterFilter(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure PkArcustoContactsBeforeOpen(DataSet: TDataSet);
    procedure PkVendorContactsBeforeOpen(DataSet: TDataSet);
    procedure PkPartnerContactsBeforeOpen(DataSet: TDataSet);
    procedure PkArcustoContactsIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure PkVendorContactsIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure PkPartnerContactsIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure PkArcustoIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure DoActivityPkBeforeOpen(DataSet: TDataSet);
    procedure PkActivityBeforeOpen(DataSet: TDataSet);
    procedure PkWarrantyIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkCampaignIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkVendorIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkOpportunityIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure DoCRMQuoteBeforeOpen(DataSet: TDataSet);
    procedure PkArcusto_CRMQUOTE_IQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure PkArcustoUDIQCreateHPickColumn(Sender: TObject;
      AField: TField);
    procedure DoIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkSupportBeforeOpen(DataSet: TDataSet);
    procedure PkAddressLookupBeforeOpen(DataSet: TDataSet);
    procedure PkCRMQuoteIQCreateHPickColumn(Sender: TObject; AField: TField);
    procedure PkActivityIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkOpportunityForCustomerBeforeOpen(DataSet: TDataSet);
    procedure PkOpportunityForCustomerIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure PkOpportunityIQCreateHPickColumn(Sender: TObject; AField: TField);
    procedure PkPartnerIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
//    procedure PkSupportIQDrawColumnCell(Sender: TObject; const Rect: TRect;
//      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PkOrdersBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FActivityFilter: TActivityFilter;
    FMasterID: Real; // used for filtering contact picklists.
    // If the FMasterID is 0, then no filtering is applied
    FCRMProspect: TProspectType; // NOTE:  Set this value if you want
    // picklists to filter on CRM_PROSPECT
    FActivityType: TActivityType; // use this for PkActivity only
    procedure VerifyIQModify(AMasterID: Real; APickList: TIQWebHPick);
  public
    { Public declarations }
    function DoCustomerContextPicklist(ACRMProspect: TProspectType;
      var ASourceID: Real): Boolean; // Customer
    function DoCustomerPicklist(ACRMProspect: TProspectType;
      ADataSource: TDataSource; AQueryNavigator: TIQWebQueryNavigator;
      var ASourceID: Real): Boolean; // Customer
    function DoContactContextPicklist(ACRMProspect: TProspectType;
      var ASourceID: Real; var AContactID: Real): Boolean; // Contact
    function DoVendorContextPicklist(var ASourceID: Real): Boolean; // Vendor
    function DoVendorPicklist(ADataSource: TDataSource;
      AQueryNavigator: TIQWebQueryNavigator; var ASourceID: Real): Boolean;
    function DoVendorContactContextPicklist(var ASourceID: Real;
      var AContactID: Real): Boolean; // VendorContact
    function DoPartnerContextPicklist(var ASourceID: Real): Boolean; // Partner
    function DoPartnerContactContextPicklist(var ASourceID: Real;
      var AContactID: Real): Boolean; // PartnerContact
    function DoPartnerPicklist(ADataSource: TDataSource;
      AQueryNavigator: TIQWebQueryNavigator; var ASourceID: Real): Boolean;
    function DoEmployeeContextPicklist(var ASourceID: Real): Boolean;
    // Employee
    // function DoOpenWorkFlow(var AWorkFlowID: Real): Boolean;
    function PkGetValue(APickList: TIQWebHPick; var AMasterValue: Real;
      var AContactID: Real;
      AMasterFieldName: String = 'ID';
      AContactFieldName: String = 'CONTACT_ID'): Boolean;

    function PromptBySource(ASource: TPrincipalSourceType;
      ACRMProspect: TProspectType; var ASourceID: Real;
      var AContactID: Real): Boolean;
    function PromptForContact(AContactSource: TPrincipalSourceType;
      ACRMProspect: TProspectType; var AMasterID: Real;
      var AContactID: Real): Boolean;

    function AddToGroup(ASource: String; ASourceID, AContactID: Real;
      var AGroupID: Real): Boolean;

    // Pick a CRM Activity
    function SelectActivity(AActivityFilter: TActivityFilter;
      var ACRMActivityID: Real): Boolean;

    // Pick a CRM Support Issue
    // Note:  The ActivityType property of the TActivityFilter object is ignored.
    function SelectSupportIssue(AActivityFilter: TActivityFilter;
      var ACRMActivityID: Real; const ACheckOpenIssues: Boolean = True)
      : Boolean;

    // Select SHIP_TO.ID.  Pick list is filtered by Customer.
    function SelectShippingAddress(const AArcustoID: Real;
      var AShipToID: Real): Boolean;
    // Select BILL_TO.ID.  Pick list is filtered by Customer.
    function SelectBillingAddress(const AArcustoID: Real;
      var ABillToID: Real): Boolean;
    // Select address
    function SelectAddress(const AArcustoID: Real;
      var AAddress1, AAddress2, AAddress3, ACity, AState, APostalCode,
      ACountry, ATelephone, AFax: string): Boolean;

    /// <summary> Select a CRM Opportunity. </summary>
    function SelectCRMOpportunity(var ACRMOpportunityID: Real): Boolean;
    /// <summary> Select a CRM Opportunity filtered by Customer. </summary>
    function SelectCRMOpportunityForCustomer(const AArcustoID: Real;
      var ACRMOpportunityID: Real; var ANewResultValue: Boolean): Boolean;

    /// <summary> Select a Sales Order.  Filtering by Customer is optional. </summary>
    function SelectSalesOrder(const AArcustoID: Real;
      var AOrdersID: Real; var ANewResultValue: Boolean;
      AllowNewRecord: Boolean = True): Boolean;

    { Public properties }
    property MasterID: Real read FMasterID write FMasterID;
    property CRMProspect: TProspectType read FCRMProspect write FCRMProspect;
    property ActivityType: TActivityType read FActivityType write FActivityType;
  end;

procedure ClearActivityFilter(var AActivityFilter: TActivityFilter);

var
  CRMPK_DM: TCRMPK_DM;

implementation

uses
  //crm_activity_dnet,
  crm_addcontact,
  crm_addcustomer,
  crm_addpartner,
  crm_addpartnercontact,
  crm_addvendorcontact,
  crm_lib,
  //crm_opportunity,
  crm_rscstr,
  crm_settings,
  //crmquoteaddcust,
  //crmsuprt_dblib,
  //cust,
  IQMS.Common.Graphics,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.QuickAddBase,
  Qk_vend,
  System.Math,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid;

{$R *.DFM}


procedure ClearActivityFilter(var AActivityFilter: TActivityFilter);
begin
  CheckCRMSettingsCreated;
  AActivityFilter.ActivityType := atNone; // declared in crm_types.pas
  AActivityFilter.ClosedType := rsEither;
  AActivityFilter.MyRecordsOnly := False;
  // For date range, by default set it to false, but populate the
  // date values with the customary date range so the calling
  // unit doesn't need to do so.
  AActivityFilter.DateRange.ByRange := False;
  AActivityFilter.DateRange.StartDate := CRMSettings.CRMToday.StartDateTime;
  AActivityFilter.DateRange.EndDate := CRMSettings.CRMToday.EndDateTime;
end;

{ TCRMPK_DM }

procedure TCRMPK_DM.DataModuleCreate(Sender: TObject);
begin
  // Make sure that the CRMContext object is created
  CheckContextObjectCreated;

  // Initialize the values
  // You can override this by changing the value before executing
  // a picklist.
  FCRMProspect := CRMContext.GlobalContext.Prospect;
end;

procedure TCRMPK_DM.AssignProspectFilter(DataSet: TDataSet);
begin
  // How to make this work...
  // You must set this DataModule's public variable, FCRM_Prospect,
  // value accordingly.  The default is "not filtered."
  AssignQueryParamValue(DataSet, 'BY_CRM_PROSPECT',
    Integer(FCRMProspect <> ptDontCare));
  case FCRMProspect of
    ptNoProspects:
      AssignQueryParamValue(DataSet, 'CRM_PROSPECT', 'N');
    ptOnlyProspects:
      AssignQueryParamValue(DataSet, 'CRM_PROSPECT', 'Y');
  else
    AssignQueryParamValue(DataSet, 'CRM_PROSPECT', '');
  end;
end;

function TCRMPK_DM.DoContactContextPicklist(ACRMProspect: TProspectType;
  var ASourceID: Real; var AContactID: Real): Boolean;
begin
  FCRMProspect := ACRMProspect;
  try
    Result := PkGetValue(PkArcustoContacts, ASourceID, AContactID,
      'ARCUSTO_ID', 'ID');
  finally
    // Reset
    FMasterID := 0;
    FCRMProspect := TProspectType(0);
  end;
end;

function TCRMPK_DM.DoCustomerContextPicklist(ACRMProspect: TProspectType;
  var ASourceID: Real): Boolean;
var
  AContactID: Real;
begin
  FCRMProspect := ACRMProspect;
  Result := PkGetValue(PkArcusto, ASourceID, AContactID, 'ID', '');
end;

function TCRMPK_DM.DoEmployeeContextPicklist(var ASourceID: Real): Boolean;
var
  AContactID: Real;
begin
  Result := PkGetValue(PkEmployee, ASourceID, AContactID, 'ID', '');
end;

function TCRMPK_DM.DoPartnerContactContextPicklist(var ASourceID: Real;
  var AContactID: Real): Boolean;
begin
  Result := PkGetValue(PkPartnerContacts, ASourceID, AContactID,
    'PARTNER_ID', 'ID');
end;

function TCRMPK_DM.DoPartnerContextPicklist(var ASourceID: Real): Boolean;
var
  AContactID: Real;
begin
  Result := PkGetValue(PkPartner, ASourceID, AContactID, 'ID', '');
end;

function TCRMPK_DM.DoVendorContactContextPicklist(
  var ASourceID: Real; var AContactID: Real): Boolean;
begin
  Result := PkGetValue(PkVendorContacts, ASourceID, AContactID,
    'VENDOR_ID', 'ID');
end;

function TCRMPK_DM.DoVendorContextPicklist(var ASourceID: Real): Boolean;
var
  AContactID: Real;
begin
  Result := PkGetValue(PkVendor, ASourceID, AContactID, 'ID', '');
end;

{ PkGetValue }
function TCRMPK_DM.PkGetValue(APickList: TIQWebHPick; var AMasterValue: Real;
  var AContactID: Real;
  AMasterFieldName: String = 'ID';
  AContactFieldName: String = 'CONTACT_ID'): Boolean;
begin
  Result := False;

  // Not used because we always show the New button on contacts picklists
  // VerifyIQModify( AMasterValue, APicklist );

  with APickList do
    if Execute then
      begin
        Result := True;
        if AMasterFieldName > '' then
          begin
            if (WasModified = True) and (FMasterID > 0) then
              AMasterValue := FMasterID
            else { if ( WasModified = FALSE ) then }
              AMasterValue := GetValue(AMasterFieldName);
          end;
        if AContactFieldName > '' then
          AContactID := GetValue(AContactFieldName);
      end;
end;

function TCRMPK_DM.PromptBySource(ASource: TPrincipalSourceType;
  ACRMProspect: TProspectType; var ASourceID: Real;
  var AContactID: Real): Boolean;
begin
  FCRMProspect := ACRMProspect;
  case ASource of
    srctCustomer:
      begin
        if (AContactID > 0) or (CRMContext.GlobalContext.ContactsPicklist = True)
        then
          Result := PromptForContact(srctCustomer, ACRMProspect, ASourceID,
            AContactID)
        else
          Result := PkGetValue(PkArcusto, ASourceID, AContactID, 'ID', '');
      end;
    srctVendor:
      begin
        if (AContactID > 0) or (CRMContext.GlobalContext.ContactsPicklist = True)
        then
          Result := PromptForContact(srctVendor, ACRMProspect, ASourceID,
            AContactID)
        else
          Result := PkGetValue(PkVendor, ASourceID, AContactID, 'ID', '');
      end;
    srctPartner:
      begin
        if (AContactID > 0) or (CRMContext.GlobalContext.ContactsPicklist = True)
        then
          Result := PromptForContact(srctPartner, ACRMProspect, ASourceID,
            AContactID)
        else
          Result := PkGetValue(PkPartner, ASourceID, AContactID, 'ID', '');
      end;
    srctEmployee:
      begin
        Result := PkGetValue(PkEmployee, ASourceID, AContactID, 'ID', '');
      end;
  end;
end;

function TCRMPK_DM.PromptForContact(AContactSource: TPrincipalSourceType;
  ACRMProspect: TProspectType; var AMasterID: Real;
  var AContactID: Real): Boolean;
begin
  Result := False;
  FCRMProspect := ACRMProspect;
  // If the source is already a "master" dataset, be sure to set the
  // FMasterID value to the ASourceID.
  { if AContactSource in [srctCustomer, srctVendor, srctPartner ] then
    FMasterID := ASourceID
    else FMasterID := AMasterID; }
  FMasterID := AMasterID;
  // Get the value from the picklist
  case AContactSource of
    srctCustomer:
      Result := PkGetValue(PkArcustoContacts, AMasterID, AContactID,
        'ARCUSTO_ID', 'ID');
    srctVendor:
      Result := PkGetValue(PkVendorContacts, AMasterID, AContactID,
        'VENDOR_ID', 'ID');
    srctPartner:
      Result := PkGetValue(PkPartnerContacts, AMasterID, AContactID,
        'PARTNER_ID', 'ID');
  end;
  FMasterID := 0; // reset
end;

procedure TCRMPK_DM.PkArcustoContactsBeforeOpen(DataSet: TDataSet);
begin
  AssignProspectFilter(DataSet);
  AssignMasterFilter(DataSet);
end;

procedure TCRMPK_DM.PkVendorContactsBeforeOpen(DataSet: TDataSet);
begin
  AssignMasterFilter(DataSet);
end;

procedure TCRMPK_DM.PkPartnerContactsBeforeOpen(DataSet: TDataSet);
begin
  AssignMasterFilter(DataSet);
end;

procedure TCRMPK_DM.AssignMasterFilter(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'master_id', FMasterID);
  AssignQueryParamValue(DataSet, 'by_master_id', Integer(FMasterID > 0));
end;

procedure TCRMPK_DM.PkArcustoContactsIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
//  ResultValue := DoGetQuickContact(FMasterID); // crm_addcontact.pas
  if ResultValue > 0 then
    Action := mrOk
  else
    Action := mrNone;
end;

procedure TCRMPK_DM.PkVendorContactsIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
//  ResultValue := DoGetQuickVendorContact(FMasterID);
  if ResultValue > 0 then
    Action := mrOk
  else
    Action := mrNone;
end;

procedure TCRMPK_DM.PkPartnerContactsIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
//  ResultValue := DoGetQuickPartnerContact(FMasterID);
  if ResultValue > 0 then
    Action := mrOk
  else
    Action := mrNone;
end;

procedure TCRMPK_DM.PkPartnerIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
  Action := DoQuickAppend(TQuickAddPartner, ResultValue)
  // qk_base; crm_addpartner
end;

procedure TCRMPK_DM.VerifyIQModify(AMasterID: Real; APickList: TIQWebHPick);
var
  AOnIQModify: TNotifyEvent;
begin
  // Contact Picklists
  if APickList = PkArcustoContacts then
    begin
      if AMasterID = 0 then
        APickList.OnIQModify := NIL
      else
        APickList.OnIQModify := PkArcustoContactsIQModify;
    end
  else if APickList = PkVendorContacts then
    begin
      if AMasterID = 0 then
        APickList.OnIQModify := NIL
      else
        APickList.OnIQModify := PkVendorContactsIQModify;
    end
  else if APickList = PkPartnerContacts then
    begin
      if AMasterID = 0 then
        APickList.OnIQModify := NIL
      else
        APickList.OnIQModify := PkPartnerContactsIQModify;
    end;
end;

function TCRMPK_DM.AddToGroup(ASource: String; ASourceID, AContactID: Real;
  var AGroupID: Real): Boolean;
begin
  AGroupID := 0;
  with PkGroups do
    if Execute then
      begin
        AGroupID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
        Result := AddToGroupByID(ASource, ASourceID, AContactID, AGroupID);
      end;
end;

procedure TCRMPK_DM.AssignEPlantFilter(DataSet: TDataSet);
begin
  with DataSet do
    begin
      Filter := '';
      IQAssignEPlantFilter(DataSet);
      Filtered := Filter > '';
    end;
end;

procedure TCRMPK_DM.PkArcustoIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
var
  AID: Real;
begin
  if not CRMSettings.ShowCustMainOnNew then
    Action := DoQuickAppend(TFrmCrmAddCustomer, ResultValue)
    // qk_base; crm_addcustomer
  else
    begin
//      Action := DoIQCustomerModal(Application, AID); // cust
      if Action = mrOk then
        ResultValue := AID;
    end;

end;

procedure TCRMPK_DM.DoActivityPkBeforeOpen(DataSet: TDataSet);
begin
  // Is the current context set?  If so, we filter by customer,
  // otherwise, we don't.
  // Global filtering?
  // Provide the values
  AssignQueryParamValue(DataSet, 'principle_source',
    CRMContext.GlobalContext.SourceTable);
  AssignQueryParamValue(DataSet, 'principle_source_id',
    CRMContext.GlobalContext.SourceID);
  AssignQueryParamValue(DataSet, 'by_principle_source',
    Integer(CRMContext.GlobalContext.Source <> srctNone));
  AssignQueryParamValue(DataSet, 'by_principle_source_id',
    Integer(CRMContext.GlobalContext.SourceID > 0));
  AssignQueryParamValue(DataSet, 'crm_prospect',
    sIIf(CRMContext.GlobalContext.Prospect = ptNoProspects, 'N', 'Y'));
  AssignQueryParamValue(DataSet, 'by_crm_prospect',
    Integer(CRMContext.GlobalContext.Prospect <> ptDontCare));

  // Assignment filter
  // Supply the values.
  AssignQueryParamValue(DataSet, 'assigned_to',
    CRMContext.AssignmentContext.AssignedTo);
  AssignQueryParamValue(DataSet, 'by_assignedto',
    Integer(CRMContext.AssignmentContext.Index in [1, 2]));

  AssignQueryParamValue(DataSet, 'current_user',
    SecurityManager.UserName);
  if FActivityType = atNone then
    FActivityType := atCall;
  AssignQueryParamValue(DataSet, 'type_id', Ord(FActivityType));
end;

procedure TCRMPK_DM.PkActivityBeforeOpen(DataSet: TDataSet);
begin
  PkActivity.Title := crm_rscstr.cTXT0001159; // 'Select from Activities'
  case FActivityFilter.ClosedType of
    rsOpen:
      begin
        case FActivityFilter.ActivityType of
          atCall:
            PkActivity.Title := crm_rscstr.cTXT0001149;
          // 'Select from Open Calls'
          atTask:
            PkActivity.Title := crm_rscstr.cTXT0001150;
          // 'Select from Open Tasks'
          atMeeting:
            PkActivity.Title := crm_rscstr.cTXT0001151;
          // 'Select from Open Meetings'
          atSupport:
            PkActivity.Title := crm_rscstr.cTXT0001152;
          // 'Select from Open Support Issues'
          atNote:
            PkActivity.Title := crm_rscstr.cTXT0001153;
          // 'Select from Open Notes'
        end;
      end;
    rsClosed:
      begin
        case FActivityFilter.ActivityType of
          atCall:
            PkActivity.Title := crm_rscstr.cTXT0001144;
          // 'Select from Closed Calls'
          atTask:
            PkActivity.Title := crm_rscstr.cTXT0001145;
          // 'Select from Closed Tasks'
          atMeeting:
            PkActivity.Title := crm_rscstr.cTXT0001146;
          // 'Select from Closed Meetings'
          atSupport:
            PkActivity.Title := crm_rscstr.cTXT0001148;
          // 'Select from Closed Support Issues'
          atNote:
            PkActivity.Title := crm_rscstr.cTXT0001147;
          // 'Select from Closed Notes'
        end;
      end;
    rsEither:
      begin
        case FActivityFilter.ActivityType of
          atCall:
            PkActivity.Title := crm_rscstr.cTXT0001154;
          // 'Select from All Calls'
          atTask:
            PkActivity.Title := crm_rscstr.cTXT0001155;
          // 'Select from All Tasks'
          atMeeting:
            PkActivity.Title := crm_rscstr.cTXT0001156;
          // 'Select from All Meetings'
          atSupport:
            PkActivity.Title := crm_rscstr.cTXT0001158;
          // 'Select from All Support Issues'
          atNote:
            PkActivity.Title := crm_rscstr.cTXT0001157;
          // 'Select from All Notes'
        end;
      end;
  end;

  // Ensure valid dates for the params
  if System.Math.IsNan(FActivityFilter.DateRange.StartDate) or
    System.Math.IsNan(FActivityFilter.DateRange.EndDate) or
    (Trunc(FActivityFilter.DateRange.StartDate) = 0) or
    (Trunc(FActivityFilter.DateRange.EndDate) = 0) then
    begin
      FActivityFilter.DateRange.StartDate := Now();
      FActivityFilter.DateRange.EndDate := Now();
      FActivityFilter.DateRange.ByRange := False;
    end;

  AssignQueryParamValue(DataSet, 'TYPE_INTEGER',
    Ord(FActivityFilter.ActivityType));
  AssignQueryParamValue(DataSet, 'ARCHIVED_SHOW_ALL',
    Integer(FActivityFilter.ClosedType = rsEither));
  AssignQueryParamValue(DataSet, 'ARCHIVED',
    IQMS.Common.Numbers.sIIf(FActivityFilter.ClosedType = rsOpen, 'N', 'Y'));
  AssignQueryParamValue(DataSet, 'MY_CRM_TODAY',
    Integer(FActivityFilter.MyRecordsOnly));
  AssignQueryParamValue(DataSet, 'BY_RANGE',
    Integer(FActivityFilter.DateRange.ByRange));
  AssignQueryParamValue(DataSet, 'START_DATETIME',
    FormatDateTime('mm/dd/yyyy hh:nn', FActivityFilter.DateRange.StartDate));
  AssignQueryParamValue(DataSet, 'END_DATETIME',
    FormatDateTime('mm/dd/yyyy hh:nn', FActivityFilter.DateRange.EndDate));
end;

procedure TCRMPK_DM.PkActivityIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
//  Action := crm_activity_dnet.ProcessPickListNewCRMActivity(
//    FActivityFilter.ActivityType, ResultValue);
end;

procedure TCRMPK_DM.PkAddressLookupBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', Trunc(FMasterID));
end;

procedure TCRMPK_DM.PkWarrantyIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOk;
  ResultValue := 0;
end;

procedure TCRMPK_DM.PkCampaignIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOk;
  ResultValue := 0;
end;

procedure TCRMPK_DM.PkCRMQuoteIQCreateHPickColumn(Sender: TObject;
  AField: TField);
const
  cCRMExe = 'IQCRM.EXE';
  cForm = 'FrmCRMQuote';
begin
  // 01/25/2008 Added user-defined labels
  if CompareText(AField.FieldName, 'CUSER1') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'lblCUser1' { UDLabelName } , 'User Text 1') // pas
  else if CompareText(AField.FieldName, 'CUSER2') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'lblCUser2' { UDLabelName } , 'User Text 2') // pas
  else if CompareText(AField.FieldName, 'CUSER3') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'lblCUser3' { UDLabelName } , 'User Text 3') // pas
  else if CompareText(AField.FieldName, 'CUSER4') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'lblCUser4' { UDLabelName } , 'User Text 4') // pas
  else if CompareText(AField.FieldName, 'CUSER5') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'lblCUser5' { UDLabelName } , 'User Text 5') // pas
  else if CompareText(AField.FieldName, 'CUSER6') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'lblCUser6' { UDLabelName } , 'User Text 6') // pas
end;

procedure TCRMPK_DM.PkVendorIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
//  Action := DoQuickAppend(TQuickAddVendor, ResultValue) // qk_base; Qk_vend
end;

procedure TCRMPK_DM.PkOpportunityIQCreateHPickColumn(Sender: TObject;
  AField: TField);
const
  cCRMExe = 'IQCRM.EXE';
  cForm = 'FrmCRMOpportunity';
begin
  // 01/25/2008 Added user-defined labels
  if CompareText(AField.FieldName, 'CUSER1') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'IQUserDefLabel1' { UDLabelName } , 'User Text 1') // pas
  else if CompareText(AField.FieldName, 'CUSER2') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'IQUserDefLabel2' { UDLabelName } , 'User Text 2') // pas
  else if CompareText(AField.FieldName, 'CUSER3') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'IQUserDefLabel3' { UDLabelName } , 'User Text 3') // pas
  else if CompareText(AField.FieldName, 'CUSER4') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'IQUserDefLabel7' { UDLabelName } , 'User Text 4') // pas
  else if CompareText(AField.FieldName, 'CUSER5') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cForm,
      'IQUserDefLabel8' { UDLabelName } , 'User Text 5') // pas
end;

procedure TCRMPK_DM.PkOpportunityIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOk;
  ResultValue := 0;
end;

procedure TCRMPK_DM.PkOrdersBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FMasterID);
  AssignQueryParamValue(DataSet, 'BY_ARCUSTO_ID',
    Integer(FMasterID > 0));
end;

procedure TCRMPK_DM.DoCRMQuoteBeforeOpen(DataSet: TDataSet);
var
  byCust: Boolean;
begin
  byCust := (CRMContext.GlobalContext.Source = srctCustomer) and
    (CRMContext.GlobalContext.SourceID > 0);
  AssignQueryParamValue(DataSet, 'arcusto_id',
    CRMContext.GlobalContext.SourceID);
  AssignQueryParamValue(DataSet, 'all_customers', Integer(not byCust));
end;

procedure TCRMPK_DM.PkArcusto_CRMQUOTE_IQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
//  Action := DoQuickAppend(TFrmCRMQuoteAddCustomer, ResultValue);
  // crmquoteaddcust
end;

procedure TCRMPK_DM.PkArcustoUDIQCreateHPickColumn(Sender: TObject;
  AField: TField);
const
  cIQWinExe = 'IQWIN32.EXE';
  cCRMExe = 'IQCRM.EXE';
  cIQWinFrm = 'Frm_Cust';
  cCRMFrm = 'FrmCRMCustomerCentral';
begin
  // 04/09/2007 Pick list and functionality added
  // ARCUSTO User-Defined Field Labels
  if CompareText(AField.FieldName, 'CUSER1') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cIQWinExe, cIQWinFrm,
      'IQUserDefLabel1') // pas
  else if CompareText(AField.FieldName, 'CUSER2') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cIQWinExe, cIQWinFrm,
      'IQUserDefLabel2') // pas
  else if CompareText(AField.FieldName, 'CUSER3') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cIQWinExe, cIQWinFrm,
      'IQUserDefLabel3') // pas
  else if CompareText(AField.FieldName, 'CUSER4') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cIQWinExe, cIQWinFrm,
      'IQUserDefLabel7') // pas
  else if CompareText(AField.FieldName, 'CUSER5') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cIQWinExe, cIQWinFrm,
      'IQUserDefLabel8') // pas
  else if CompareText(AField.FieldName, 'CUSER6') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cIQWinExe, cIQWinFrm,
      'IQUserDefLabel9') // pas

    // CRM_USER_DEFINED User-Defined Field Labels
  else if CompareText(AField.FieldName, 'CRM_CUSER1') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel1')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER2') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel2')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER3') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel3')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER4') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel4')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER5') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel5')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER6') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel6')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER7') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel7')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER8') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel8')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER9') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel9')
    // pas
  else if CompareText(AField.FieldName, 'CRM_CUSER10') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cCRMExe, cCRMFrm, 'udNoteLabel10');
  // pas
end;

procedure TCRMPK_DM.DoIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOk;
  ResultValue := 0;
end;

{ function TCRMPK_DM.DoOpenWorkFlow(var AWorkFlowID: Real): Boolean;
  var
  AArcustoID,
  AVendorID: Real;
  begin
  // Initialization
  AArcustoID := 0;
  AVendorID := 0;

  if (CRMContext.GlobalContext.Source = srctCustomer) then
  AArcustoID := CRMContext.GlobalContext.SourceID;

  if (CRMContext.GlobalContext.Source = srctVendor) then
  AVendorID := CRMContext.GlobalContext.SourceID;

  with PkWorkFlow do
  if Execute then
  begin
  if NewResultValue then
  DoCRMAddWorkFlow('',AWorkFlowID)
  // CreateNewWorkFlow(AWorkFlowID,
  //                   AArcustoID,
  //                   AVendorID,
  //                   '', // AParams
  //                   True) // Display
  else
  begin
  AWorkFlowID := GetValue('ID');
  DoCRMJumpToWorkFlow(AWorkFlowID, 0);
  end;
  end;
  end; }

function TCRMPK_DM.DoCustomerPicklist(ACRMProspect: TProspectType;
  ADataSource: TDataSource; AQueryNavigator: TIQWebQueryNavigator;
  var ASourceID: Real): Boolean;
begin
  ASourceID := 0;
  FCRMProspect := ACRMProspect;
  with PkArcusto do
    begin
      AssociatedDataSource := ADataSource;
      AssociatedQueryNavigator := AQueryNavigator;
      Result := Execute;
      if Result then
        ASourceID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
    end;
end;

function TCRMPK_DM.DoPartnerPicklist(ADataSource: TDataSource;
  AQueryNavigator: TIQWebQueryNavigator; var ASourceID: Real): Boolean;
begin
  ASourceID := 0;
  with PkPartner do
    begin
      AssociatedDataSource := ADataSource;
      AssociatedQueryNavigator := AQueryNavigator;
      Result := Execute;
      if Result then
        ASourceID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
    end;
end;

function TCRMPK_DM.DoVendorPicklist(ADataSource: TDataSource;
  AQueryNavigator: TIQWebQueryNavigator; var ASourceID: Real): Boolean;
begin
  ASourceID := 0;
  with PkVendor do
    begin
      AssociatedDataSource := ADataSource;
      AssociatedQueryNavigator := AQueryNavigator;
      Result := Execute;
      if Result then
        ASourceID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
    end;
end;

function TCRMPK_DM.SelectActivity(AActivityFilter: TActivityFilter;
  var ACRMActivityID: Real): Boolean;
begin
  // Initialize
  ACRMActivityID := 0;
  FActivityFilter.ActivityType := AActivityFilter.ActivityType;
  FActivityFilter.ClosedType := AActivityFilter.ClosedType;
  FActivityFilter.MyRecordsOnly := AActivityFilter.MyRecordsOnly;
  FActivityFilter.DateRange := AActivityFilter.DateRange;
  Result := PkActivity.Execute;
  if Result then
    ACRMActivityID := System.Variants.VarAsType(PkActivity.GetValue('ID'),
      varUInt64);
  Result := Result and (Trunc(ACRMActivityID) > 0);
end;

function TCRMPK_DM.SelectAddress(const AArcustoID: Real; var AAddress1,
  AAddress2, AAddress3, ACity, AState, APostalCode, ACountry, ATelephone,
  AFax: string): Boolean;
begin
  try
    FMasterID := AArcustoID;
    with PkAddressLookup do
      begin
        Result := Execute;
        if Result then
          begin
            AAddress1 := System.Variants.VarToStr(GetValue('ADDR1'));
            AAddress2 := System.Variants.VarToStr(GetValue('ADDR2'));
            AAddress3 := System.Variants.VarToStr(GetValue('ADDR3'));
            ACity := System.Variants.VarToStr(GetValue('CITY'));
            AState := System.Variants.VarToStr(GetValue('STATE'));
            APostalCode := System.Variants.VarToStr(GetValue('ZIP'));
            ACountry := System.Variants.VarToStr(GetValue('COUNTRY'));
            ATelephone := System.Variants.VarToStr(GetValue('PHONE_NUMBER'));
            AFax := System.Variants.VarToStr(GetValue('FAX_NUMBER'));
          end;
      end;
  finally
    FMasterID := 0;
  end;
end;

function TCRMPK_DM.SelectSupportIssue(AActivityFilter: TActivityFilter;
  var ACRMActivityID: Real; const ACheckOpenIssues: Boolean): Boolean;
begin
  ACRMActivityID := 0;
  FActivityFilter.ActivityType := atSupport; // override whatever comes in
  FActivityFilter.ClosedType := AActivityFilter.ClosedType;
  FActivityFilter.MyRecordsOnly := AActivityFilter.MyRecordsOnly;
  FActivityFilter.DateRange := AActivityFilter.DateRange;

  // Do not allow new Support Issues if we are showing a list of
  // archived records.
  { if (FActivityFilter.ClosedType = rsClosed) then
    PkSupport.OnIQModify := NIL
    else }
  PkSupport.OnIQModify := Self.DoIQModify;

  Result := PkSupport.Execute;
  if not Result then
    Exit;

  if PkSupport.NewResultValue then
    begin
      ACRMActivityID := GetNextID('CRM_ACTIVITY');
//      Result := crmsuprt_dblib.CreateSupportIssue(ACRMActivityID,
//        ACheckOpenIssues);
    end
  else
    ACRMActivityID := System.Variants.VarAsType(PkSupport.GetValue('ID'),
      varUInt64);

  Result := Result and (ACRMActivityID > 0);
end;

procedure TCRMPK_DM.PkSupportBeforeOpen(DataSet: TDataSet);
var
  ASourceDisplay: String;
begin
  ASourceDisplay := ''; // initial value

  // Ensure valid dates for the params
  if (Trunc(FActivityFilter.DateRange.StartDate) = 0) or
    (Trunc(FActivityFilter.DateRange.EndDate) = 0) then
    begin
      FActivityFilter.DateRange.StartDate := Now();
      FActivityFilter.DateRange.EndDate := Now();
      FActivityFilter.DateRange.ByRange := False;
    end;

  AssignQueryParamValue(DataSet, 'ARCHIVED_SHOW_ALL',
    Integer(FActivityFilter.ClosedType = rsEither));
  AssignQueryParamValue(DataSet, 'ARCHIVED',
    IQMS.Common.Numbers.sIIf(FActivityFilter.ClosedType = rsOpen, 'N', 'Y'));
  AssignQueryParamValue(DataSet, 'MY_CRM_TODAY',
    Integer(FActivityFilter.MyRecordsOnly));
  AssignQueryParamValue(DataSet, 'BY_RANGE',
    Integer(FActivityFilter.DateRange.ByRange));
  AssignQueryParamValue(DataSet, 'START_DATETIME',
    FormatDateTime('mm/dd/yyyy hh:nn', FActivityFilter.DateRange.StartDate));
  AssignQueryParamValue(DataSet, 'END_DATETIME',
    FormatDateTime('mm/dd/yyyy hh:nn', FActivityFilter.DateRange.EndDate));

  // Is the current context set?  If so, we filter by customer,
  // otherwise, we don't.
  if (CRMContext.GlobalContext.Source = srctCustomer) and
    (CRMContext.GlobalContext.SourceID > 0) then
    ASourceDisplay := Format('[%s]',
      [CRMContext.GlobalContext.Display.ShortSourceCaption]);

  if (FActivityFilter.ClosedType = rsOpen) then
    PkSupport.Title :=
      Format(crm_rscstr.cTXT0000706 { 'Select from Open Support Issues %s' } ,
      [ASourceDisplay])
  else if (FActivityFilter.ClosedType = rsClosed) then
    PkSupport.Title :=
      Format(crm_rscstr.cTXT0000707 { 'Select from Closed Support Issues %s' } ,
      [ASourceDisplay])
  else
    PkSupport.Title :=
      Format(crm_rscstr.cTXT0000708 { 'Select from All Support Issues %s' } ,
      [ASourceDisplay]);

end;

//procedure TCRMPK_DM.PkSupportIQDrawColumnCell(Sender: TObject;
//  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
//var
//  AColor: TColor;
//  AHasColor: Boolean;
//begin
//  with TUniDBGrid(Sender), Canvas do
//    begin
//      AColor := clNone;
//      AHasColor := False;
//      if (DataSource.DataSet.FindField('severity_color') <> NIL) and
//        (DataSource.DataSet.FieldByName('severity_color').AsLargeInt > 0) then
//        begin
//          AColor := TColor(DataSource.DataSet.FieldByName('severity_color')
//            .AsLargeInt);
//          AHasColor := True;
//        end;
//
//      if gdSelected in State then
//        begin
//          if AHasColor then
//            begin
//              Brush.Color := clBlack;
//              Font.Color := clWhite;
//            end;
//        end
//      else
//        begin
//          if AHasColor then
//            begin
//              Brush.Color := AColor;
//              Font.Color := IQMS.Common.Graphics.GetFontColor(AColor);
//            end;
//        end;
//    end;
//
//  TUniDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
//end;

function TCRMPK_DM.SelectBillingAddress(const AArcustoID: Real;
  var ABillToID: Real): Boolean;
begin
  ABillToID := 0;
  FMasterID := AArcustoID;
  try
    with PkBillTo do
      begin
        Result := Execute;
        if Result then
          ABillToID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
      end;
  finally
    FMasterID := 0;
  end;
end;

function TCRMPK_DM.SelectCRMOpportunity(var ACRMOpportunityID: Real): Boolean;
begin
  Result := False;
  ACRMOpportunityID := 0;
  with PkOpportunity do
    begin
      Result := Execute;
      if Result then
        ACRMOpportunityID := System.Variants.VarAsType(GetValue('ID'),
          varUInt64);
    end;
end;

function TCRMPK_DM.SelectCRMOpportunityForCustomer(const AArcustoID: Real;
  var ACRMOpportunityID: Real; var ANewResultValue: Boolean): Boolean;
begin
  // Initialize
  Result := False;
  ACRMOpportunityID := 0;
  // Set the ID value to filter the pick list
  FMasterID := AArcustoID;
  try
    // Get the value
    with PkOpportunityForCustomer do
      begin
        Result := Execute;
        ANewResultValue := NewResultValue;
        if Result then
          ACRMOpportunityID := System.Variants.VarAsType(GetValue('ID'),
            varUInt64);
      end;
  finally
    // Reset
    FMasterID := 0;
  end;
end;

function TCRMPK_DM.SelectSalesOrder(const AArcustoID: Real; var AOrdersID: Real;
  var ANewResultValue: Boolean; AllowNewRecord: Boolean): Boolean;
var
  AOnIQModify: TModifyProc; // declared in HpickFrm.pas
begin
  AOrdersID := 0;
  FMasterID := AArcustoID;
  AOnIQModify := PkOrders.OnIQModify;
  try
    if not AllowNewRecord then
      PkOrders.OnIQModify := nil;
      try
        with PkOrders do
          begin
            Result := Execute;
            ANewResultValue := NewResultValue;
            if Result then
              AOrdersID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
          end;
      finally
        FMasterID := 0;
      end;
  finally
    if not AllowNewRecord then
      PkOrders.OnIQModify := AOnIQModify;
  end;
end;

function TCRMPK_DM.SelectShippingAddress(const AArcustoID: Real;
  var AShipToID: Real): Boolean;
begin
  AShipToID := 0;
  FMasterID := AArcustoID;
  try
    with PkShipTo do
      begin
        Result := Execute;
        if Result then
          AShipToID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
      end;
  finally
    FMasterID := 0;
  end;
end;

procedure TCRMPK_DM.PkOpportunityForCustomerBeforeOpen(DataSet: TDataSet);
begin
  // See SelectCRMOpportunityForCustomer() above.
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FMasterID);
end;

procedure TCRMPK_DM.PkOpportunityForCustomerIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
var
  AResultValue: Real;
begin
//  Action := crm_opportunity.CreateNewOpportunity('ARCUSTO', FMasterID, 0,
//    { var } AResultValue);
  ResultValue := AResultValue;
end;

end.
