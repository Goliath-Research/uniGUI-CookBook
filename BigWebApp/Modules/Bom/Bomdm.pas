unit bomDM;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.AppDef,
  Vcl.Wwdatsrc,
  Vcl.wwDataInspector,
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
  FireDAC.DApt;

type
  TBOM_DM = class(TDataModule)
    SrcStandard: TDataSource;
    SrcPartNo: TDataSource;
    TblPartNo: TFDTable;
    SrcPtOper: TDataSource;
    SrcSndOp: TDataSource;
    SrcOpMat: TDataSource;
    TblPtOper: TFDTable;
    TblSndOp: TFDTable;
    TblOpMat: TFDTable;
    SrcMfg_Aux: TDataSource;
    TblMfg_Aux: TFDTable;
    TblStandard: TFDTable;
    TblStandardID: TBCDField;
    TblStandardMFGNO: TStringField;
    TblStandardSETS: TFMTBCDField;
    TblStandardCYCLETM: TBCDField;
    TblStandardSCRAP: TBCDField;
    TblStandardREGRIND: TBCDField;
    TblStandardOPERATOR: TBCDField;
    TblStandardLBSK: TFMTBCDField;
    TblStandardSHOTWT: TFMTBCDField;
    TblStandardSETUPHRS: TBCDField;
    TblStandardSPRUE: TFMTBCDField;
    TblStandardMFG_TYPE: TStringField;
    TblStandardMFGCELL: TStringField;
    TblStandardORDSCOPE: TBCDField;
    TblStandardRUNSCOPE: TBCDField;
    TblStandardBOM_CNTRL: TStringField;
    TblStandardCNTR_TYPE: TStringField;
    TblStandardARINVT_ID_MAT: TBCDField;
    TblStandardTIMESTAMP: TDateTimeField;
    TblStandardARCUSTO_ID: TBCDField;
    TblStandardPLANFENCE: TBCDField;
    TblStandardRFQ: TStringField;
    TblPartNoID: TBCDField;
    TblPartNoSTANDARD_ID: TBCDField;
    TblPartNoARINVT_ID: TBCDField;
    TblPartNoSTDCAV: TFMTBCDField;
    TblPartNoACTCAV: TFMTBCDField;
    TblPartNoPTWT: TFMTBCDField;
    TblPartNoBOXNO: TBCDField;
    TblMfg_AuxAUX_ID: TBCDField;
    TblMfg_AuxSTANDARD_ID: TBCDField;
    TblPtOperPARTNO_ID: TBCDField;
    TblPtOperSNDOP_ID: TBCDField;
    TblPtOperOPSEQ: TBCDField;
    TblSndOpID: TBCDField;
    TblSndOpVENDOR_ID: TBCDField;
    TblSndOpVEN_LEAD: TBCDField;
    TblSndOpCYCLETM: TBCDField;
    TblSndOpSCRAP: TBCDField;
    TblSndOpOPERATOR: TBCDField;
    TblSndOpSETUPHRS: TBCDField;
    TblSndOpPRICEDATE: TDateTimeField;
    TblSndOpLABOR_RATES_ID: TBCDField;
    TblOpMatSNDOP_ID: TBCDField;
    TblOpMatARINVT_ID: TBCDField;
    TblOpMatWEIGHT: TFMTBCDField;
    TblOpMatLBL_FORMAT: TBCDField;
    SrcArCusto: TDataSource;
    TblArCusto: TFDTable;
    SrcMfgType: TDataSource;
    TblMfgType: TFDTable;
    TblMfgTypeMFGTYPE: TStringField;
    TblMfgTypeDESCRIP: TStringField;
    SrcPmEqmt: TDataSource;
    TblPmEqmt: TFDTable;
    TblStandardFIRST_ARTICLE_DATE: TDateTimeField;
    TblSndOpOP_CLASS: TStringField;
    TblSndOpOPNO: TStringField;
    TblSndOpOPDESC: TStringField;
    TblSndOpCNTR_TYPE: TStringField;
    TblPartNoCLASS: TStringField;
    TblPartNoITEMNO: TStringField;
    TblPartNoDESCRIP: TStringField;
    TblPartNoREV: TStringField;
    TblOpMatDESCRIP: TStringField;
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    PkMfgITEMNO: TStringField;
    PkMfgREV: TStringField;
    PkMfgDESCRIP: TStringField;
    PkMfgID: TBCDField;
    TblStandardCustName: TStringField;
    TblStandardMatDescrip: TStringField;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    PkArinvtPL: TIQWebHPick;
    PkArinvtPLITEMNO: TStringField;
    PkArinvtPLREV: TStringField;
    PkArinvtPLDESCRIP: TStringField;
    PkArinvtPLUNIT: TStringField;
    PkArinvtPLID: TBCDField;
    PkArinvt: TIQWebHPick;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TBCDField;
    PkSndOp: TIQWebHPick;
    PkSndOpOPNO: TStringField;
    PkSndOpOPDESC: TStringField;
    PkSndOpOP_CLASS: TStringField;
    PkSndOpID: TBCDField;
    PkArinvtCLASS: TStringField;
    TblStandardCycleSPH: TFloatField;
    TblStandardHrsK: TFloatField;
    TblStandardFG_LOTNO: TStringField;
    SrcAux: TDataSource;
    TblMfg_AuxDesc: TStringField;
    TblMfg_AuxRate: TFloatField;
    TblStandardCYCLE: TBCDField;
    TblStandardRG_DISPO: TStringField;
    TblStandardREUSE: TStringField;
    TblStandardASSEM: TStringField;
    TblSndOpATPRESS: TStringField;
    AppDef1: TIQWebAppDef;
    TblStandardSPRUE_DISP: TFMTBCDField;
    TblStandardUOM: TStringField;
    TblPartNoPTWT_DISP: TFMTBCDField;
    TblPartNoEcno: TStringField;
    TblPartNoDrawing: TStringField;
    TblPartNoUnit: TStringField;
    procBOM_Clone_Standard: TFDStoredProc;
    PkArinvtCUSTNO: TStringField;
    PkArinvtCOMPANY: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtPLDESCRIP2: TStringField;
    TblPartNodescrip2: TStringField;
    PkArinvtPk: TIQWebHPick;
    QryArCusto: TFDQuery;
    TblStandardPMEQMT_ID: TBCDField;
    TblStandardEqNo: TStringField;
    TblStandardLocation: TStringField;
    PkMfgMFG_TYPE: TStringField;
    TblStandardEFF_FACTOR: TBCDField;
    TblOpMatItemNo: TStringField;
    TblStandardDESCRIP: TStringField;
    TblStandardLABOR_RATE: TFMTBCDField;
    TblMfgTypeLABOR_RATE: TFMTBCDField;
    TblArCustoID: TBCDField;
    TblArCustoCUSTNO: TStringField;
    TblArCustoCOMPANY: TStringField;
    TblArCustoADDR1: TStringField;
    TblArCustoADDR2: TStringField;
    TblArCustoADDR3: TStringField;
    TblArCustoCITY: TStringField;
    TblArCustoSTATE: TStringField;
    TblArCustoCOUNTRY: TStringField;
    TblArCustoZIP: TStringField;
    TblArCustoPHONE_NUMBER: TStringField;
    TblArCustoEXT: TStringField;
    TblArCustoFAX_NUMBER: TStringField;
    TblArCustoPRIME_CONTACT: TStringField;
    wwQryMfgCell: TFDQuery;
    wwQryMfgCellMFGCELL: TStringField;
    wwQryMfgCellDESCRIP: TStringField;
    wwQryMfgCellMFGTYPE: TStringField;
    wwQryWork_Center: TFDQuery;
    wwQryWork_CenterCNTR_TYPE: TStringField;
    wwQryWork_CenterMFG_TYPE: TStringField;
    wwQryArinvtPL: TFDQuery;
    wwQryArinvtPLITEMNO: TStringField;
    wwQryArinvtPLDESCRIP: TStringField;
    wwQryArinvtPLREV: TStringField;
    wwQryArinvtPLID: TBCDField;
    PkMfgDESCRIP2: TStringField;
    TblStandardUSERID: TStringField;
    TblStandardCUSER1: TStringField;
    TblStandardCUSER2: TStringField;
    TblStandardCUSER3: TStringField;
    TblStandardCUSER4: TStringField;
    TblStandardCUSER5: TStringField;
    TblStandardCUSER6: TStringField;
    TblStandardNUSER1: TFMTBCDField;
    TblStandardNUSER2: TFMTBCDField;
    TblStandardNUSER3: TFMTBCDField;
    TblStandardNUSER4: TFMTBCDField;
    TblStandardNUSER5: TFMTBCDField;
    TblOpMatSEQ: TBCDField;
    TblOpMatClass: TStringField;
    TblStandardWITH_ASSY_AT_PRESS: TStringField;
    TblMfgTypeBOM_REPORT: TStringField;
    TblMfgTypeWO_REPORT: TStringField;
    TblStandardLBSK_Disp: TFloatField;
    TblStandardShotWt_Disp: TFloatField;
    TblStandardSETS_DISP: TFMTBCDField;
    TblStandardCYCLETM_DISP: TBCDField;
    TblStandardSPH_Net: TFloatField;
    TblStandardMfgTypeDescrip: TStringField;
    TblOpMatDISPO_CYCLES_BASED: TStringField;
    TblOpMatSCRAP: TBCDField;
    TblMfg_AuxHOW_MANY: TBCDField;
    PkArinvtPkITEMNO: TStringField;
    PkArinvtPkCLASS: TStringField;
    PkArinvtPkREV: TStringField;
    PkArinvtPkDESCRIP: TStringField;
    PkArinvtPkDESCRIP2: TStringField;
    PkArinvtPkUNIT: TStringField;
    PkArinvtPkCUSTNO: TStringField;
    PkArinvtPkCOMPANY: TStringField;
    PkArinvtPkID: TBCDField;
    TblStandardBATCH_TYPE: TStringField;
    TblMfgTypeELEMENTS_ID: TBCDField;
    QryElements: TFDQuery;
    TblMfgTypeElement: TStringField;
    TblStandardEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    PkMfgEPLANT_ID: TBCDField;
    PkArinvtPLEPLANT_ID: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtPkEPLANT_ID: TBCDField;
    TblStandardEPlant_Name: TStringField;
    wwQryWork_CenterEPLANT_ID: TBCDField;
    PkMfgCOMPANY: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    wwQryArinvtPLEPLANT_ID: TBCDField;
    wwQryMfgCellEPLANT_ID: TBCDField;
    TblOpMatID: TBCDField;
    QryAux: TFDQuery;
    TblStandardMFGCELL_ID: TBCDField;
    wwQryMfgCellID: TBCDField;
    TblPtOperCYCLETM: TFMTBCDField;
    TblPtOperOP_Cost: TFloatField;
    TblSndOpCNTR_RATE: TBCDField;
    wwSrcStandard: TDataSource;
    wwQryStandard: TFDQuery;
    wwQryStandardMFGNO: TStringField;
    wwQryStandardSTANDARD_ID: TBCDField;
    TblOpMatSTANDARD_ID: TBCDField;
    wwQryStandardDEFAULT_BOM: TStringField;
    TblSndOpOpNoDisp: TStringField;
    TblOpMatDESCRIP2: TStringField;
    TblPartNoArinvt_EPlant_ID: TBCDField;
    TblOpMatRev: TStringField;
    TblOpMatArinvt_EPLant_ID: TFloatField;
    TblStandardRUNS_BEST_FROM_DATE: TDateTimeField;
    TblStandardFLAT_CYCLETM: TStringField;
    wwQryWork_Center_OutSource: TFDQuery;
    wwQryWork_Center_OutSourceCNTR_TYPE: TStringField;
    wwQryWork_Center_OutSourceMFG_TYPE: TStringField;
    wwQryWork_Center_OutSourceEPLANT_ID: TBCDField;
    wwQryWork_Center_OutSourceCOMPANY: TStringField;
    TblOpMatEXCLUDE_SCRAP_DISPO: TStringField;
    TblStandardEFFECT_DATE: TDateTimeField;
    TblStandardDEACTIVE_DATE: TDateTimeField;
    TblStandardPLANNING_FENCE: TBCDField;
    PkMfgEFFECT_DATE: TDateTimeField;
    PkMfgDEACTIVE_DATE: TDateTimeField;
    TblStandardMatEPlant_ID: TFloatField;
    TblOpMatOVERLAP_HRS: TBCDField;
    TblOpMatArinvt_Standard_ID: TFloatField;
    PkMfgROUTE_SEQ: TBCDField;
    TblStandardROUTE_SEQ: TBCDField;
    TblStandardPK_HIDE: TStringField;
    PkMfgPK_HIDE: TStringField;
    PkArcustoPK_HIDE: TStringField;
    PkArinvtPkPK_HIDE: TStringField;
    PkArinvtPLPK_HIDE: TStringField;
    PkArinvtPK_HIDE: TStringField;
    wwQryArinvtPLPK_HIDE: TStringField;
    TblStandardREUSE_SPRUE: TStringField;
    TblStandardBackflushProdParam: TStringField;
    TblStandardRegrindProdParam: TStringField;
    TblStandardCHK_AVAIL_RG_PRCNT: TStringField;
    TblOpMatEXCLUDE_BACKFLUSH: TStringField;
    TblOpMatTARE_WEIGHT: TFMTBCDField;
    TblOpMatCUSER1: TStringField;
    TblOpMatCUSER2: TStringField;
    TblOpMatCUSER3: TStringField;
    TblOpMatNUSER1: TFMTBCDField;
    TblOpMatNUSER2: TFMTBCDField;
    TblOpMatNUSER3: TFMTBCDField;
    TblOpMatRETURNABLE_CONTAINER: TStringField;
    wwQryWork_CenterMFGCELL_ID: TBCDField;
    TblPartNoNUSER1: TFMTBCDField;
    TblStandardSETUPHRS2: TBCDField;
    wwQryAux: TFDQuery;
    wwQryAuxID: TBCDField;
    wwQryAuxAUX_DESC: TStringField;
    wwQryAuxAUX_RATE: TBCDField;
    wwQryAuxHOW_MANY: TBCDField;
    wwQryAuxEPLANT_ID: TBCDField;
    UpdateSQLAux: TFDUpdateSQL;
    wwQryAuxEPLant_ID_Disp: TFloatField;
    QryAuxID: TBCDField;
    QryAuxAUX_DESC: TStringField;
    QryAuxAUX_RATE: TBCDField;
    QryAuxHOW_MANY: TBCDField;
    QryAuxEPLANT_ID: TBCDField;
    SrcStandard_Pmeqmt: TDataSource;
    TblStandard_Pmeqmt: TFDTable;
    TblStandard_PmeqmtID: TBCDField;
    TblStandard_PmeqmtSTANDARD_ID: TBCDField;
    TblStandard_PmeqmtPMEQMT_ID: TBCDField;
    TblStandard_PmeqmtIS_PRIMARY: TStringField;
    TblStandard_PmeqmtEqno: TStringField;
    TblStandard_PmeqmtLocation: TStringField;
    TblOpMatPTSPER_DISP: TFMTBCDField;
    TblOpMatUNIT: TStringField;
    TblPartNoROUTING_NOTE: TStringField;
    TblOpMatVERIFY_ASN_QTY: TStringField;
    TblOpMatNon_Material: TStringField;
    PkArinvtNON_MATERIAL: TStringField;
    TblStandardSCRAP_DISP: TBCDField;
    TblPartNoIsFabStart: TStringField;
    TblStandardHR_JOB_DESCRIP_ID: TBCDField;
    TblStandardCERT_LEVEL: TBCDField;
    QryHr_Job_Descrip: TFDQuery;
    QryHr_Job_DescripID: TBCDField;
    QryHr_Job_DescripDESCRIP: TStringField;
    TblPtOperLOGIN_REQUIRED: TStringField;
    TblPtOperLOGOUT_REQUIRED: TStringField;
    PkSndOpFAB: TIQWebHPick;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField2: TBCDField;
    TblOpMatALLOC_REQ: TStringField;
    TblOpMatOFFSET_DAYS: TBCDField;
    wwQryAuxDIVISION_ID: TBCDField;
    wwQryAuxDivisionName: TStringField;
    QryDivisionLookup: TFDQuery;
    QryDivisionLookupID: TBCDField;
    QryDivisionLookupNAME: TStringField;
    QryDivisionLookupDESCRIP: TStringField;
    wwQryAuxDIVISION_NAME: TStringField;
    TblPartNoPlannerCode: TStringField;
    TblPartNoPlanner_Code_ID: TBCDField;
    TblStandardSTART_MAT_QTY: TFMTBCDField;
    TblPtOperCYCLETM_DISP: TBCDField;
    TblPtOperOVERLAP_HRS: TBCDField;
    TblPtOperMULTIPLES: TBCDField;
    TblPtOperSCRAP_DISP: TBCDField;
    TblPtOperUOM: TStringField;
    TblMfgTypeFAB_PASSWORD_ON_LOGIN: TStringField;
    TblStandard_PmeqmtDescrip: TStringField;
    TblOpMatFAB_ALLOC_MULTI: TStringField;
    TblStandardINFO_SCHED: TStringField;
    TblStandardIS_OUTSOURCE_DROPSHIP: TStringField;
    wwQryWork_Center_OutSourceMFGCELL_ID: TBCDField;
    TblStandardSHEET_WIDTH: TFMTBCDField;
    TblStandardRAIL: TFMTBCDField;
    TblStandardSHEET_LENGTH: TFMTBCDField;
    TblStandardCLAMP: TFMTBCDField;
    TblStandardSheet_Weight: TFloatField;
    TblStandardMatSPG: TFloatField;
    TblStandardMatGauge: TFloatField;
    TblPartNoIs_By_Product: TStringField;
    PkArinvtByProduct: TIQWebHPick;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    FloatField3: TBCDField;
    FloatField4: TBCDField;
    StringField16: TStringField;
    StringField17: TStringField;
    TblOpMatMBATCH_PERCENT: TFMTBCDField;
    TblStandardSheet_Weight_Disp: TFloatField;
    TblPartNoSkeleton_Weight_Disp: TFMTBCDField;
    TblStandardMatLength: TFloatField;
    TblStandardMatWidth: TFloatField;
    TblStandardIS_VIRTUAL: TStringField;
    TblStandardVIRTUAL_WORK_CENTERS_COUNT: TBCDField;
    TblStandard_PmeqmtService_IN: TStringField;
    TblStandard_PmeqmtServiceOUT: TStringField;
    TblOpMatIs_By_Product: TStringField;
    TblPartNoPTWT_THERMO_DISP: TFMTBCDField;
    TblStandardINCLUDE_START_MAT_IN_STD_COST: TStringField;
    TblOpMatEXCLUDE_SHIP_ORDER: TStringField;
    PkSndOpAssy1: TIQWebHPick;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField5: TBCDField;
    TblStandardTotalPartsPerHr: TFloatField;
    TblPartNoDefaultMfgNo: TStringField;
    PkSndOpPK_HIDE: TStringField;
    PkSndOpFABPK_HIDE: TStringField;
    PkSndOpAssy1PK_HIDE: TStringField;
    TblStandardBATCH_SIZE: TFMTBCDField;
    TblStandardLookupMfgType: TStringField;
    TblMfgTypeSTANDARD_MFGTYPE: TStringField;
    TblStandardCalcType: TStringField;
    TblPartNoSPACE_TRIM_LENGTH: TFMTBCDField;
    TblPartNoSPACE_TRIM_WIDTH: TFMTBCDField;
    TblPartNoSPACE_EDGE_LENGTH: TFMTBCDField;
    TblPartNoSPACE_EDGE_WIDTH: TFMTBCDField;
    TblPartNoPT_VOL: TFMTBCDField;
    PkArinvtForRework: TIQWebHPick;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    FloatField6: TBCDField;
    FloatField7: TBCDField;
    StringField29: TStringField;
    StringField30: TStringField;
    TblPtOperOVERLAP_PROCESS: TStringField;
    PkWorkCenterType: TIQWebHPick;
    PkWorkCenterTypeCNTR_TYPE: TStringField;
    PkWorkCenterTypeMFG_TYPE: TStringField;
    PkWorkCenterTypeEPLANT_ID: TBCDField;
    PkWorkCenterTypeMFGCELL_ID: TBCDField;
    PkWorkCenterTypeMFGCELL_DESCRIP: TStringField;
    PkWorkCenterOutsourceType: TIQWebHPick;
    PkWorkCenterOutsourceTypeCNTR_TYPE: TStringField;
    PkWorkCenterOutsourceTypeMFG_TYPE: TStringField;
    PkWorkCenterOutsourceTypeEPLANT_ID: TBCDField;
    PkWorkCenterOutsourceTypeCOMPANY: TStringField;
    PkWorkCenterOutsourceTypeMFGCELL_ID: TBCDField;
    PkWorkCenterOutsourceTypeMFGCELL_DESCRIP: TStringField;
    TblOpMatINCLUDE_STD_COST: TStringField;
    PkMfgSTANDARD_DESCRIP: TStringField;
    TblPtOperMOVE_SIZE: TFMTBCDField;
    TblPtOperMOVE_TIME: TFMTBCDField;
    TblStandardASSY1_STD_QUAN: TFMTBCDField;
    TblStandardASSY1_STD_PROCESSING_TIME: TFMTBCDField;
    TblStandardQUOTE_ID: TBCDField;
    TblPtOperID: TBCDField;
    TblPtOperParentOpNo: TStringField;
    TblStandardGAUGE: TFMTBCDField;
    SrcStandardPrEmp: TDataSource;
    TblStandard_Pr_Emp: TFDTable;
    TblStandard_Pr_EmpID: TBCDField;
    TblStandard_Pr_EmpSTANDARD_ID: TBCDField;
    TblStandard_Pr_EmpPR_EMP_ID: TBCDField;
    TblStandard_Pr_EmpEmpNo: TStringField;
    TblStandard_Pr_EmpFirstName: TStringField;
    TblStandard_Pr_EmpLastName: TStringField;
    SrcStandardEmpDocs: TDataSource;
    QryStandardEmpDocs: TFDQuery;
    QryStandardEmpDocsDOC_DESCRIP: TStringField;
    QryStandardEmpDocsCURRENT_REVISION: TStringField;
    QryStandardEmpDocsASSIGNED_REVISION: TStringField;
    QryStandardEmpDocsStatus: TStringField;
    QryStandardEmpDocsCERTIFIED_DATE: TDateTimeField;
    QryStandardEmpDocsCURRENT_DOC_REVISION_ID: TBCDField;
    QryStandardEmpDocsASSIGNED_DOC_REVISION_ID: TBCDField;
    QryStandardEmpDocsID: TBCDField;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpEMPNO: TStringField;
    PkEmpFIRST_NAME: TStringField;
    PkEmpMIDDLE_NAME: TStringField;
    PkEmpLAST_NAME: TStringField;
    TblOpMatSTD_BATCH_QTY: TFMTBCDField;
    TblPtOperPROCESS_SCRAP: TBCDField;
    PkAuxCostElements: TIQWebHPick;
    PkAuxCostElementsID: TBCDField;
    PkAuxCostElementsELEM_DESCRIP: TStringField;
    PkAuxCostElementsELEM_TYPE: TStringField;
    PkAuxCostElementsGLACCT_ID: TBCDField;
    wwQryAuxELEMENTS_ID: TBCDField;
    wwQryAuxElem_Descrip: TStringField;
    TblMfg_AuxElem_Descrip: TStringField;
    PkMfgCUSER1: TStringField;
    PkMfgCUSER2: TStringField;
    PkMfgCUSER3: TStringField;
    PkMfgCUSER4: TStringField;
    PkMfgCUSER5: TStringField;
    PkMfgCUSER6: TStringField;
    TblPtOperREPORT_FINAL_ASSY: TStringField;
    TblMfgTypeASSY1_FINAL_ASSY_ON_PROCESS: TStringField;
    TblStandardFinalAssyOnProcess: TStringField;
    TblMfgTypeUSE_YIELD_ON_BOM: TStringField;
    TblStandardUseYieldOnBOM: TStringField;
    TblPtOperUSE_FOR_LABEL_PRINT: TStringField;
    TblOpMatEXCLUDE_KIT_MTO: TStringField;
    TblPartNoPhantom: TStringField;
    PkQuote: TIQWebHPick;
    PkQuoteID: TBCDField;
    PkQuoteRFQ: TStringField;
    PkQuotePROJECT: TStringField;
    PkQuoteQUOTE_DATE: TDateTimeField;
    PkQuoteQUOTE_REV: TBCDField;
    PkQuoteITEMNO: TStringField;
    PkQuoteDESCRIP: TStringField;
    PkQuoteDESCRIP2: TStringField;
    PkQuoteCOMPANY: TStringField;
    PkQuoteEPLANT_ID: TBCDField;
    PkQuoteMFG_TYPE: TStringField;
    TblOpMatEXCLUDE_STD_COST: TStringField;
    TblStandard_Pr_EmpMiddleName: TStringField;
    QryStandardEmpDocsCERT_TRAINING_ID: TBCDField;
    QryStandardEmpDocsCERT_TRAINING_DESCRIP: TStringField;
    TblSndOpNOTE1: TStringField;
    PkSalesConfigTemplatesForThisStandard: TIQWebHPick;
    PkSalesConfigTemplatesForThisStandardID: TBCDField;
    PkSalesConfigTemplatesForThisStandardDESCRIP: TStringField;
    PkSalesConfigTemplatesForThisStandardARINVT_ITEMNO: TStringField;
    PkSalesConfigTemplatesForThisStandardARINVT_DESCRIP: TStringField;
    PkSalesConfigTemplatesForThisStandardARINVT_DESCRIP2: TStringField;
    PkSalesConfigTemplatesForThisStandardARINVT_CLASS: TStringField;
    PkSalesConfigTemplatesForThisStandardARINVT_REV: TStringField;
    PkSalesConfigTemplatesForThisStandardPRICE: TFMTBCDField;
    PkSalesConfigTemplatesForThisStandardEPLANT_NAME: TStringField;
    PkSalesConfigTemplatesForThisStandardEPLANT_ID: TBCDField;
    PkSalesConfigTemplatesForThisStandardPK_HIDE: TStringField;
    TblOpMatEXCLUDE_REJECTS_BACKFLUSH: TStringField;
    TblStandardADC: TStringField;
    TblStandardCORE_SIZE: TFMTBCDField;
    TblStandardOD: TFMTBCDField;
    PkVendorAka: TIQWebHPick;
    PkVendorAkaAKA_ID: TBCDField;
    PkVendorAkaVENDOR_ID: TBCDField;
    PkVendorAkaVENDOR_ITEMNO: TStringField;
    PkVendorAkaVENDOR_DESCRIP: TStringField;
    PkVendorAkaVENDOR_REV: TStringField;
    PkVendorAkaVENDORNO: TStringField;
    PkVendorAkaVENDOR: TStringField;
    PkVendorAkaEPLANT_ID: TBCDField;
    PkVendorAkaONHAND: TBCDField;
    PkVendorAkaARINVT_ITEMNO: TStringField;
    PkVendorAkaARINVT_DESCRIP: TStringField;
    PkVendorAkaARINVT_DESCRIP2: TStringField;
    PkVendorAkaARINVT_REV: TStringField;
    PkVendorAkaNON_CONFORM_TOTAL: TBCDField;
    PkVendorAkaNON_ALLOCATE_TOTAL: TBCDField;
    PkVendorAkaVENDOR_DESCRIP2: TStringField;
    PkVendorAkaPk: TIQWebHPick;
    FloatField8: TBCDField;
    FloatField10: TBCDField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    FloatField11: TBCDField;
    FloatField12: TBCDField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    FloatField13: TBCDField;
    FloatField14: TBCDField;
    StringField40: TStringField;
    PkVendorAkaID: TBCDField;
    PkVendorAkaPkID: TBCDField;
    TblStandardMIN_WIDTH: TFMTBCDField;
    TblStandardMAX_WIDTH: TFMTBCDField;
    TblStandardTRIM_WIDTH: TFMTBCDField;
    TblOpMatSTARTUP_QTY: TFMTBCDField;
    TblOpMatINCLUDE_STARTUP_QTY_STD_COST: TStringField;
    TblStandardALTERNATE_ITEM_CODE_ID: TBCDField;
    TblStandardAlternateItemCode: TStringField;
    wwQryAuxSETUPHRS1: TBCDField;
    wwQryAuxSETUPHRS2: TBCDField;
    TblMfg_AuxSetupHrs1: TFloatField;
    TblMfg_AuxSetupHrs2: TFloatField;
    TblStandardFUTURE_LABOR_RATE: TFMTBCDField;
    TblStandardBUDGET_LABOR_RATE: TFMTBCDField;
    TblStandardFORECAST_LABOR_RATE: TFMTBCDField;
    TblSndOpMultiplesOfDisp: TStringField;
    TblSndOpUSE_MULTIPLIER: TStringField;
    TblOpMatStd_Cost: TFloatField;
    TblOpMatSpg: TFloatField;
    TblOpMatPTSPER_TEMP: TFMTBCDField;
    TblPtOperGROUPING_PROCESS: TStringField;
    TblStandardORIGIN: TStringField;
    PkArinvtPLCLASS: TStringField;
    wwQryArinvtPLCLASS: TStringField;
    TblStandardTREATMENT_INFO: TStringField;
    TblMfg_AuxID: TBCDField;
    TblStandardTreatmentTotalCycle: TFloatField;
    TblOpMatPARENT_BATCH_SIZE: TFMTBCDField;
    TblStandardBATCH_SIZE_SCALABLE: TFMTBCDField;
    procedure BOM_DMCreate(Sender: TObject);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure TblPtOperAfterInsert(DataSet: TDataSet);
    procedure TblOpMatAfterInsert(DataSet: TDataSet);
    procedure TblStandardBeforePost(DataSet: TDataSet);
    procedure ConfirmCancel(DataSet: TDataSet);
    procedure HandleError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TblStandardAfterPost(DataSet: TDataSet);
    procedure TblStandardBeforeDelete(DataSet: TDataSet);
    procedure PkArcustoIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkMfgIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkArinvtIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkArinvtPkIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkArinvtPLIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure wwQryMfgCellFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TblStandardAfterInsert(DataSet: TDataSet);
    procedure SrcOpMatDataChange(Sender: TObject; Field: TField);
    procedure TblMfg_AuxNewRecord(DataSet: TDataSet);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure wwQryWork_CenterBeforeOpen(DataSet: TDataSet);
    procedure TblOpMatPTSPERValidate(Sender: TField);
    procedure PkSndOpIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure TblPartNoNewRecord(DataSet: TDataSet);
    procedure TblPtOperCalcFields(DataSet: TDataSet);
    procedure SrcSndOpDataChange(Sender: TObject; Field: TField);
    procedure TblOpMatBeforePost(DataSet: TDataSet);
    procedure TblSndOpCalcFields(DataSet: TDataSet);
    procedure TblAuxAfterPost(DataSet: TDataSet);
    procedure TblOpMatBeforeInsert(DataSet: TDataSet);
    procedure wwQryWork_CenterFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure wwQryAuxBeforePost(DataSet: TDataSet);
    procedure wwQryAuxCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TblStandard_PmeqmtAfterPost(DataSet: TDataSet);
    procedure TblStandard_PmeqmtBeforePost(DataSet: TDataSet);
    procedure TblStandard_PmeqmtNewRecord(DataSet: TDataSet);
    procedure PkSndOpFABIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure TblPartNoCalcFields(DataSet: TDataSet);
    procedure PkArinvtByProductIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure PkArinvtPLBeforeOpen(DataSet: TDataSet);
    procedure PkSndOpAssy1IQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure TblOpMatCalcFields(DataSet: TDataSet);
    procedure TblPtOperBeforePost(DataSet: TDataSet);
    procedure PkWorkCenterTypeBeforeOpen(DataSet: TDataSet);
    procedure wwQryAuxNewRecord(DataSet: TDataSet);
    procedure TblStandardARINVT_ID_MATChange(Sender: TField);
    procedure QryStandardEmpDocsCalcFields(DataSet: TDataSet);
    procedure QryStandardEmpDocsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure AbortInsert(DataSet: TDataSet);
    procedure QryStandardEmpDocsBeforeDelete(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure TblOpMatAfterPost(DataSet: TDataSet);
    procedure TblMfg_AuxCalcFields(DataSet: TDataSet);
    procedure PkQuoteBeforeOpen(DataSet: TDataSet);
    procedure PkSalesConfigTemplatesForThisStandardBeforeOpen(DataSet: TDataSet);
    procedure PkMfgIQCreateHPickColumn(Sender: TObject; AField: TField);
    procedure TblStandard_PmeqmtCalcFields(DataSet: TDataSet);
    procedure TblStandard_Pr_EmpNewRecord(DataSet: TDataSet);
    procedure TblStandard_Pr_EmpCalcFields(DataSet: TDataSet);
    procedure TblMfg_AuxBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    IsActive:boolean;

    procedure ValidateStandardTable;
    procedure Recalc_LBSK;
    procedure CheckAvailRegrindPerecent;
    procedure AssignInspectorItemVisibleByCaption( ADI:TwwDataInspector; ACaption: string; AIsVisible: Boolean );
    procedure AssignInspectorItemVisibleByFieldName( ADI:TwwDataInspector; AFieldName: string; AIsVisible: Boolean );
    function Is_Thermoform(AMfgType: string): Boolean;
    function Is_Slitting(AMfgType: string): Boolean;
    procedure AssignPartnoCalculatedFields(AArinvt_ID: Real);
    procedure AssignOpMatCalculatedFields(AArinvt_ID: Real);
    procedure CheckResetMfgSplit(AStandard_ID: Real);
    procedure AssignInspectorItemEnabledByFieldName(ADI: TwwDataInspector; AFieldName: string; AEnabled: Boolean);
    procedure DeleteBOM;
    function MfgcellHasCntrType(AMfgcell_ID: Real; ACntrType: string): Boolean;
  public
    { Public declarations }
    IsRoutingLicensed: Boolean;
    IsECOLicensed: Boolean;
    ArinvtEOCList: TStringList;
    procedure AssignStandardCalculatedFields(AArinvt_ID: Real);
    procedure SetTablesActive( const SetActive:Boolean );
    procedure ResfreshRelatedTables( DataSource:TDataSource );
    class procedure PopulateArinvtECOList( AList: TStringList; AStandard_ID: Real; APartno_ID: Real = 0 );
    class procedure DeleteArinvtECO( AList: TStringList );
    class procedure DeleteUniqueSndOpsForPartno( APartnoID: Real );
    class procedure DeleteUniqueSndOpsForMfg( AStandard_ID: Real );
    class procedure Execute_Before_BOM_Delete( AStandard_ID: Real );
  end;

//var
//  BOM_DM: TBOM_DM;

implementation

{$R *.DFM}

uses
  bom_pts_per_check,
  bom_rscstr,
  { TODO -oSanketG -cWC : Need to revisit }
  //Bom_Shel,
  BomConfReplRG,
  ClassLst,
  Inv_Share,
  IQMS.Common.Applications,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  { TODO -oSanketG -cWC : Need to revisit }
  {IQMS.Common.UserMessages,
  Qk_Assy1Op,}
  IQMS.Common.QuickAddBase,
  Qk_Cust,
  { TODO -oSanketG -cWC : Need to revisit }
  //Qk_FabOp,
  Qk_Inv,
  Qk_Pkg,
  Qk_Plast,
  qk_plast_ex,
  qk_plast_exa,
  { TODO -oSanketG -cWC : Need to revisit }
  //Qk_StdOp,
  System.Variants
  { TODO -oSanketG -cWC : Need to revisit }
  //Bom_Base
  ;

procedure TBOM_DM.SetTablesActive( const SetActive:Boolean );
var
  i:integer;
begin
  if SetActive and IsActive
    then EXIT;
  try
    IQSetTablesActiveEx( SetActive, self, bom_rscstr.cTXT0000003 {'Accessing BOM.  Please wait.'}  );

    TblSndOp.UpdateOptions.RequestLive:= FALSE;
    TblSndOp.Active:= SetActive;
    TblSndOp.UpdateOptions.RequestLive:= TRUE;

    IsActive:= SetActive;
  except
    IsActive:= FALSE;
    raise;
  end
end;

procedure TBOM_DM.BOM_DMCreate(Sender: TObject);
begin
  IsActive:= FALSE;

  IsRoutingLicensed:= SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apBOMRoute ], NIL );
  IsECOLicensed    := SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apIQEco ],    NIL );

  PkMfgROUTE_SEQ.Visible:= IsRoutingLicensed;
  ArinvtEOCList:= TStringList.Create;
  TFrmClassList.EnsurePrimaryMaterialIsChecked; {ClassLst.pas}
end;

procedure TBOM_DM.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TBOM_DM.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TBOM_DM.TblPtOperAfterInsert(DataSet: TDataSet);
begin
  {Get Next OpSeq}
  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(       'Select Max(OPSEQ) from PTOPER');
    SQL.Add(IQFormat(' where PARTNO_ID = %f order by OPSEQ', [TblPartNoID.value] ));
    Open;
    TblPtOperOPSEQ.value:= Fields[0].asFloat + 1;
  finally
    Free;
  end;
end;

procedure TBOM_DM.TblOpMatAfterInsert(DataSet: TDataSet);
begin
  TblOpMatPTSPER_DISP.Value:= 1;
  TblOpMatSEQ.asFloat:= 1+SelectValueFmtAsFloat('select max(seq) from opmat where sndop_id = %f', [ TblSndopID.asFloat ]);
end;

procedure TBOM_DM.TblStandardBeforePost(DataSet: TDataSet);
begin
  ValidateStandardTable;
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TBOM_DM.ValidateStandardTable;
var
  APkHide: string;
begin
  if TblStandard.State in [ dsEdit, dsInsert ] then
  begin
    TblStandardCYCLETM_DISP.asFloat:= IQRound( TblStandardCYCLETM_DISP.asFloat, 4 );

     { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
    (*if not StrInList( TblStandardLookupMfgType.asString, [ 'FAB', 'ASSY1', 'ASSY2', 'ASSY3'])  and (TblStandardCYCLETM_DISP.asFloat <= 0) then
       raise Exception.CreateFmt( bom_rscstr.cTXT0000001 {'Field %s must be greater than 0'}, [ (TBomShell(Owner).Child as TMain_Mfg_Base).lblCycleTm.Caption ]);*)

    //All mfg types require MFG#
    if Trim(TblStandardMFGNO.asString) = '' then
      raise Exception.CreateFmt( bom_rscstr.cTXT0000032, [ 'MFG #' ]); //Field %s must have a value

    //Center Type, Line size, Vendor etc.
    TblStandardCNTR_TYPE.Required := not StrInList( TblStandardLookupMfgType.asString, [ 'FAB', 'ASSY1', 'ASSY2', 'ASSY3'])
                                     and
                                     not (TblStandardORIGIN.asString = 'ICT');
    { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
    {if (Trim(TblStandardCNTR_TYPE.asString) = '') and (TblStandardCNTR_TYPE.Required) then
      raise Exception.CreateFmt( bom_rscstr.cTXT0000032, [ (TBomShell(Owner).Child as TMain_Mfg_Base).lblPressSize.Caption ]); // Field %s must have a value}

    //Extrusion 2 req. RTSignal Rate
    if (TblStandardLookupMfgType.asString = 'EXTRUSION2') and (TblStandardSPRUE_DISP.asFloat <= 0) then
      raise Exception.CreateFmt( bom_rscstr.cTXT0000001 {'Field %s must be greater than 0'}, [ 'RT Signal Rate' ]);

    TblStandardBOM_CNTRL.asString:= Format('%s-%s %s', [ SecurityManager.UserName, DateToStr(Now), TimeToStr(Now) ]);

    {make sure it's not empty}
    if TblStandardSETS_DISP.asFloat = 0 then
       TblStandardSETS_DISP.asFloat:= 1;

    //if TblStandardSETS_DISP.asFloat <= 0 then
    //   raise Exception.CreateFmt('Field %s must be greater than 0', [ (TBomShell(Owner).Child as TMain_Mfg).lblUnitCycle.Caption ]);

    {Inactive and Jobshop}
    APkHide:= SelectValueByID('pk_hide', 'standard', TblStandardID.asFloat );
    if APkHide <> TblStandardPK_HIDE.asString then
    begin
       CheckCanChangePkHide( TblStandardID.asFloat ); {Inv_Share.pas}

       if (APkHide <> 'Y') and (TblStandardPK_HIDE.asString = 'Y')  then
          CheckResetMfgSplit( TblStandardID.asFloat );
    end;


    if not MfgcellHasCntrType( TblStandardMFGCELL_ID.asFloat, TblStandardCNTR_TYPE.asString ) then
    begin
      if not IQMS.Common.Dialogs.IQConfirmYNWithSecurity({Mesg  }bom_rscstr.cTXT0000036,  // 'Selected center type does not match mfg cell - continue?';
                                            {Key   }'BOM_DMCntrTypeMfgcellMismatch',
                                            {ChkBox}True ) then
         System.SysUtils.ABORT;
    end;
  end;
end;

procedure TBOM_DM.CheckResetMfgSplit( AStandard_ID: Real );
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select s.mfgno,                       '+
                     '       a.itemno,                      '+
                     '       p.id as partno_id              '+
                     '  from standard s, partno p, arinvt a '+
                     ' where                                '+
                     '       s.id = %f                      '+
                     '   and s.id = p.standard_id           '+
                     '   and p.arinvt_id = a.id             '+
                     '   and a.mfg_split = ''P''            ',
                     [ AStandard_ID ]));

    Open;
    while not Eof do
    begin
      IQConfirm( Format( bom_rscstr.cTXT0000025, [ FieldByName('mfgno').asString, FieldByName('itemno').asString ])); {'Mfg# %s will be removed from Item# %s Manufacturing Load Split Percentage Calculation'}
      ExecuteCommandFmt('update partno set mfg_percent = 0 where id = %f', [ FieldByName('partno_id').asFloat ]);
      Next;
    end;
  finally
    Free;
  end;

end;

procedure TBOM_DM.ConfirmCancel(DataSet: TDataSet);
var
  TableName:string;
begin
   if DataSet is TFDTable then
     TableName:= TFDTable( DataSet ).TableName;
   if MessageDlg(Format('%s: Cancel Changes?', [TableName]), mtConfirmation, [mbYes, mbNo],0) = mrNo then
      System.SysUtils.ABORT;
end;

procedure TBOM_DM.HandleError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action:= daAbort;
  IQHandleDBEngineError( DataSet, E );
end;

procedure TBOM_DM.ResfreshRelatedTables( DataSource:TDataSource );
var
  I:Integer;
begin
  for i:= 0 to ComponentCount - 1 do
    if (Components[ I ] is TFDTable) and ( TFDTable(Components[ I ]).MasterSource = DataSource ) then
       TFDTable(Components[ I ]).Refresh;
  DataSource.DataSet.Refresh;
end;

procedure TBOM_DM.TblStandardAfterPost(DataSet: TDataSet);
begin
  Recalc_LBSK;
  CheckAvailRegrindPerecent;
  TblStandard.Refresh;  {to refresh LBSK, SHOTWT, BOM_CNTRL}

  {03-22-2013 to refresh sndop and opmat to allow SrcOpMatDataChange to kick in and update the screen }
  TblSndOp.Refresh;
  TblOpMat.Refresh;
  { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
  {if Assigned( TBomShell(Owner).OnStandardAfterPost ) then
     TBomShell(Owner).OnStandardAfterPost(DataSet);}
end;

procedure TBOM_DM.Recalc_LBSK;
begin
  with AppDef1 do
  begin
    Execute('LBSK', [ TblStandardID.asFloat ]);
    ExecuteCommandFmt('update standard       ' +
              '   set LBSK   = %f,   ' +
              '       shotwt = %.6f, ' +
              '       eplant_id = -1 ' +       {-1 keeps eplant_id as is}
              'where id = %f',
               [ParamByName('v_LBSK').asFloat,
                ParamByName('v_SHOTWT').asFloat,
                TblStandardID.asFloat ]);
  end;
end;

procedure TBOM_DM.CheckAvailRegrindPerecent;
var
  AAvail_RG: Real;
  AKeepChecking: Boolean;
  A: Variant;
begin
  if TblStandardCHK_AVAIL_RG_PRCNT.asString <> 'Y' then
     EXIT;

  if not StrInList( TblStandardLookupMfgType.asString, [ 'INJECTION', 'BLOWMOLD' ]) then
     EXIT;

  try
    A:= SelectValueArrayFmt( 'select sprue, UOM.Lbs_To_Gr(shotwt) from standard where id = %f', [ TblStandardID.asFloat ]);
    if VarArrayDimCount( A ) = 0 then
       System.SysUtils.ABORT;
    AAvail_RG:= Trunc( A[ 0 ] / A[ 1 ] * 100 );
  except
    AAvail_RG:= 0;
  end;

  if TblStandardREGRIND.asFloat - AAvail_RG > 0.00000001 then
     if ConfirmReplaceRegrind( TblStandardREGRIND.asFloat, AAvail_RG, AKeepChecking )then  {BomConfReplRG}
     begin
        {Update to max avail regrind}
        ExecuteCommandFmt('update standard set regrind = %f, chk_avail_rg_prcnt = ''%s'' where id = %f',
                  [ AAvail_RG, IIf(AKeepChecking, 'Y', 'N'), TblStandardID.asFloat ]);
        {After regrind is changed recalc LBSK again}
        Recalc_LBSK;
     end;
end;

procedure TBOM_DM.TblStandardBeforeDelete(DataSet: TDataSet);
begin
  if not IQWarningYN(Format('Are you sure you want to delete %s Configuration %s?', [TblStandardMFG_TYPE.asString, TblStandardMFGNO.asString ])) then
    System.SysUtils.ABORT;

  DeleteBOM;
end;

class procedure TBOM_DM.PopulateArinvtECOList( AList: TStringList; AStandard_ID: Real; APartno_ID: Real = 0 );
begin
  AList.Clear;

  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;
    if APartNo_ID = 0 then
       SQL.Add(IQFormat('select p.arinvt_id from partno p, arinvt a where p.standard_id = %f and p.arinvt_id = a.id and substr(a.class,1,1) = ''~''', [ AStandard_ID ]))
    else
       SQL.Add(IQFormat('select p.arinvt_id from partno p, arinvt a where p.id = %f          and p.arinvt_id = a.id and substr(a.class,1,1) = ''~''', [ APartno_ID ]));
    Open;
    while not Eof do
    begin
      AList.Add( FieldByName('arinvt_id').asString );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TBOM_DM.DeleteBOM;
var
  ADB: TFDConnection;
begin
  if TblStandardID.asFloat = 0 then
     EXIT;

  ADB:= UniMainModule.FDConnection1;
  ADB.StartTransaction;
  try
    PopulateArinvtECOList( ArinvtEOCList, TblStandardID.asFloat );

    Execute_Before_BOM_Delete( TblStandardID.asFloat );

    ExecuteCommandFmt('delete from standard where id = %f', [ TblStandardID.asFloat ]);

    DeleteArinvtECO( ArinvtEOCList );

    ADB.Commit;
  finally
    if ADB.InTransaction then
       ADB.RollBack;
  end;

  {skip to the next available record}
  TblStandard.Refresh;

  {abort because we delete manually with ExecuteCommand under Transaction control}
  System.SysUtils.Abort;
end;


class procedure TBOM_DM.DeleteArinvtECO( AList: TStringList );
var
  I: Integer;
begin
  for I:= 0 to AList.Count - 1 do
    ExecuteCommandFmt('delete from arinvt where id = %s', [ AList[ I ]]);

  AList.Clear;
end;

class procedure TBOM_DM.Execute_Before_BOM_Delete( AStandard_ID: Real );
begin
  ExecuteCommandFmt('begin bom_misc.exec_before_delete_bom( %f ); end;', [ AStandard_ID ]);
  // {Delete sndop(s) that are in use by only this Mfg#}
  // DeleteUniqueSndOpsForMfg( AStandard_ID );
  // ExecuteCommandFmt( 'delete from ptoper where partno_id in (select id from partno where standard_id = %f)', [ AStandard_ID ]);
  // ExecuteCommandFmt( 'update arinvt set cost_standard_id = NULL where cost_standard_id = %f',                [ AStandard_ID ]);
  // ExecuteCommandFmt( 'update arinvt set cost_standard_id_future = NULL where cost_standard_id_future = %f',  [ AStandard_ID ]);
end;

class procedure TBOM_DM.DeleteUniqueSndOpsForMfg( AStandard_ID: Real );
begin
  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( IQFormat('select id from partno where standard_id = %f', [ AStandard_ID ]));
    Open;
    while not Eof do
    begin
      DeleteUniqueSndOpsForPartno( FieldByName('id').asFloat );
      Next;
    end;
  finally
    Free;
  end;
end;


class procedure TBOM_DM.DeleteUniqueSndOpsForPartno( APartnoID: Real );
begin
  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( IQFormat('select ptoper.sndop_id        ' +
                      '  from ptoper                 ' +
                      ' where ptoper.partno_id = %f  ' +
                      '   and ptoper.sndop_id not in ' +
                      '       ( select p2.sndop_id   ' +
                      '         from ptoper p2       ' +
                      '        where p2.partno_id <> ptoper.partno_id)', [ APartnoID ]));
    Open;
    while not Eof do
    begin
      {First disconnect partno from sndop - otherwise will get mutated table during trigger}
      ExecuteCommandFmt( 'delete from ptoper where partno_id = %f and sndop_id = %f', [ APartnoID, FieldByName('sndop_id').asFloat ]);
      ExecuteCommandFmt('delete from opmat where sndop_id = %f', [FieldByName('sndop_id').asFloat]);
      {Now delete sndop}
      ExecuteCommandFmt( 'delete from sndop where id = %f', [ FieldByName('sndop_id').asFloat ]);
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TBOM_DM.PkArcustoIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= DoQuickAppend( TQuickAddCustomer, ResultValue );
end;

procedure TBOM_DM.PkMfgIQCreateHPickColumn(Sender: TObject; AField: TField);
const
  cAppName = 'IQWIN32.EXE';
  cFormName = 'FrmUserFields_IQMS.STANDARD';
begin
  // 01/07/2014 Added user-defined labels
  if CompareText(AField.FieldName, 'CUSER1') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel1UserFields' { UDLabelName } , 'User Text 1')
  else if CompareText(AField.FieldName, 'CUSER2') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel2UserFields' { UDLabelName } , 'User Text 2')
  else if CompareText(AField.FieldName, 'CUSER3') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel3UserFields' { UDLabelName } , 'User Text 3')
  else if CompareText(AField.FieldName, 'CUSER4') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel4UserFields' { UDLabelName } , 'User Text 4')
  else if CompareText(AField.FieldName, 'CUSER5') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel5UserFields' { UDLabelName } , 'User Text 5')
  else if CompareText(AField.FieldName, 'CUSER6') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel6UserFields' { UDLabelName } , 'User Text 6')
  else if CompareText(AField.FieldName, 'NUSER1') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel7UserFields' { UDLabelName } , 'User Numeric 1')
  else if CompareText(AField.FieldName, 'NUSER2') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel8UserFields' { UDLabelName } , 'User Numeric 2')
  else if CompareText(AField.FieldName, 'NUSER3') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel9UserFields' { UDLabelName } , 'User Numeric 3')
  else if CompareText(AField.FieldName, 'NUSER4') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel10UserFields' { UDLabelName } , 'User Numeric 4')
  else if CompareText(AField.FieldName, 'NUSER5') = 0 then
    AField.DisplayLabel := IQGetUDCaption(cAppName, cFormName,
      'IQUserDefLabel11UserFields' { UDLabelName } , 'User Numeric 5');
end;

procedure TBOM_DM.PkMfgIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
  //PostMessage( TBomShell(Owner).Handle, wm_Command, TBomShell(Owner).MfgConfig1.Command, 0 );   { Call "NewMfg" }
end;

procedure TBOM_DM.PkQuoteBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('standard_id').Value := TblStandardID.asFloat;
  AssignQueryParamValue(DataSet, 'standard_id', TblStandardID.asFloat);
end;

procedure TBOM_DM.PkArinvtIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= DoQuickAppend( TQuickAddRawArinvt, ResultValue );
end;

procedure TBOM_DM.PkArinvtPkIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= DoQuickAppend( TQuickAddPackaging, ResultValue );
end;

procedure TBOM_DM.PkArinvtPLIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
var
  AQuickAddBaseCargo: TQuickAddBaseCargo;
begin
  if TblStandardLookupMfgType.AsString = 'TFORM2' then
     try
       AQuickAddBaseCargo:= TQuickAddBaseCargo.Create;
       AQuickAddBaseCargo.CParam1:= TblStandardUOM.asString;

       Action:= DoQuickAppend( TQuickAddPlasticExA, ResultValue, FALSE, AQuickAddBaseCargo )  {qk_plast_exa.pas}
     finally
       AQuickAddBaseCargo.Free;
     end

  else if TblStandardLookupMfgType.AsString = 'THERMOFORM' then
    Action:= DoQuickAppend( TQuickAddPlasticEx, ResultValue )   {qk_plast_ex.pas}

  else
    Action:= DoQuickAppend( TQuickAddPlastic, ResultValue );    {qk_plast.pas}
end;

procedure TBOM_DM.wwQryMfgCellFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= TblStandardMFG_TYPE.asString = wwQryMfgCellMFGTYPE.asString;
end;

procedure TBOM_DM.wwQryWork_CenterBeforeOpen(DataSet: TDataSet);
begin
  // Accept:= TblStandardMFG_TYPE.asString = wwQryWork_CenterMFG_TYPE.asString;
  AssignEPlantFilter( DataSet );

  //with DataSet as TFDQuery do
  //  if Assigned( Params.FindParam('mfg_type')) then
  //     ParamByName('mfg_type').asString:= Trim(TblStandardMFG_TYPE.asString);
  AssignQueryParamValue(DataSet, 'mfg_type', Trim(TblStandardMFG_TYPE.asString));

  // with DataSet do
  //   if Filter = '' then
  //      Filter:= Format('MFG_TYPE = ''%s''', [ PadR( TblStandardMFG_TYPE.asString, 10 )])
  //   else
  //      Filter:= Format('(%s) and (MFG_TYPE = ''%s'')', [Filter, PadR( TblStandardMFG_TYPE.asString, 10 )]);
end;

procedure TBOM_DM.TblStandardAfterInsert(DataSet: TDataSet);
begin
    { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
    {if Assigned(TBomShell(Owner).Child.dbeMfgNo) then
    begin
      TBomShell(Owner).Child.dbeMfgNo.SetFocus;
      TBomShell(Owner).Child.CheckApplyVirtualBOMSettings;
    end;}
end;

procedure TBOM_DM.SrcOpMatDataChange(Sender: TObject; Field: TField);

  {Conditional display on the Details tab}
  procedure CheckHidePKdetails;
  begin
    { TODO -oSanketG -cWC : Need to revisit ,dependent on bom_shel}
    {with TBomShell(Owner).Child do
    begin
      AssignInspectorItemVisibleByCaption( wwDataInspectorOpmat, 'Packaging', (TblOpMatClass.asString = 'PK'));
      AssignInspectorItemVisibleByFieldName( wwDataInspectorOpmat, 'OVERLAP_HRS', (TblOpMatArinvt_Standard_ID.asFloat > 0));
      AssignInspectorItemVisibleByFieldName( wwDataInspectorOpmat, 'OFFSET_DAYS', StrInList( TblStandardLookupMfgType.asString, [ 'FAB', 'ASSY1', 'ASSY2', 'ASSY3' ]));
      AssignInspectorItemVisibleByFieldName( wwDataInspectorOpmat, 'DISPO_CYCLES_BASED', not StrInList( TblStandardLookupMfgType.asString, [ 'ASSY1', 'ASSY2', 'ASSY3' ]));
      AssignInspectorItemVisibleByFieldName( wwDataInspectorOpmat, 'ALLOC_REQ', StrInList( TblStandardLookupMfgType.asString, [ 'FAB' ]));

      AssignInspectorItemVisibleByFieldName( wwDataInspectorOpmat,
                                             'EXCLUDE_KIT_MTO',
                                             (TblStandardLookupMfgType.asString = 'GENERIC') and (TblPartNoPhantom.asString = 'Y'));
    end;}
  end;

  {Display of ptsper and other fields depending on NON_MATERIAL flag}
  procedure CheckHidePtsPer;
  var
    I: Integer;
  begin
    { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
    (*with TBomShell(Owner), Child do
    begin
      {display of controls with tag <> 1 depends on NON_MATERIAL }
      for I:= 0 to tabOpmatSpecs.ControlCount - 1 do
        if tabOpmatSpecs.Controls[ I ].Tag <> 1 then with tabOpmatSpecs.Controls[ I ] do
           Visible:= (TblOpMatNon_Material.asString <> 'Y') and SR.Visible[ Name ];

      {same goes for ScrollBoxOpmatDetails on Details tab}
      wwDataInspectorOpmat.Visible:= (TblOpMatNon_Material.asString <> 'Y');
    end;*)
  end;

  procedure AdjustVisibleGeneral;
  begin
    { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
    {with TBomShell(Owner).Child do
    begin
       AssignInspectorItemVisibleByFieldName( wwDataInspectorOpmat, 'INCLUDE_STD_COST', (TblOpMatEXCLUDE_BACKFLUSH.asString = 'Y'));
       AssignInspectorItemEnabledByFieldName( wwDataInspectorOpmat, 'EXCLUDE_STD_COST', (TblOpMatEXCLUDE_BACKFLUSH.asString <> 'Y' ));
       AssignInspectorItemEnabledByFieldName( wwDataInspectorOpmat, 'EXCLUDE_BACKFLUSH',(TblOpMatEXCLUDE_STD_COST.asString <> 'Y' ));
    end;}
  end;

begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on bom_shel}
  {if Assigned(Sender) and Assigned(TBomShell(Owner).Child) then
  begin
    CheckHidePKdetails;
    CheckHidePtsPer;
    AdjustVisibleGeneral;
  end;}
end;

procedure TBOM_DM.AssignInspectorItemVisibleByCaption( ADI:TwwDataInspector; ACaption: string; AIsVisible: Boolean );
var
  AItem: TwwInspectorItem;
begin
  AItem:= ADI.GetItemByCaption( ACaption );
  if Assigned( AItem ) then
     AItem.Visible:= AIsVisible;
end;

procedure TBOM_DM.AssignInspectorItemVisibleByFieldName(
  ADI: TwwDataInspector; AFieldName: string; AIsVisible: Boolean);
var
  AItem : TwwInspectorItem;
begin
  AItem := ADI.GetItemByFieldName( AFieldName );
  if Assigned( AItem ) then
  begin
    AItem.Visible:= AIsVisible;
  end;
end;

procedure TBOM_DM.AssignInspectorItemEnabledByFieldName(ADI: TwwDataInspector; AFieldName: string; AEnabled: Boolean);
var
  AItem : TwwInspectorItem;
begin
  AItem := ADI.GetItemByFieldName( AFieldName );
  if Assigned( AItem ) then
  begin
    AItem.Enabled:= AEnabled;
  end;
end;


procedure TBOM_DM.SrcSndOpDataChange(Sender: TObject; Field: TField);
var
  AItem: TwwInspectorItem;
begin
  { TODO -oSanketG -cWC : Need to revisit ,dependent on bom_shel}
  (*if Assigned(Sender) and Assigned(TBomShell(Owner).Child) then with TBomShell(Owner).Child do
  begin
     AssignInspectorItemVisibleByCaption( wwDataInspectorPtOper, 'Process Details', (TblSndOpOP_CLASS.asString = 'OP'));
     AssignInspectorItemVisibleByCaption( wwDataInspectorPtOper, 'FAB Process Details', (TblSndOpOP_CLASS.asString = 'FB'));
     AssignInspectorItemVisibleByCaption( wwDataInspectorPtOper, 'ASSY Process Details', (TblSndOpOP_CLASS.asString = 'AS'));
     AssignInspectorItemVisibleByCaption( wwDataInspectorPtOper, 'Login', (TblSndOpOP_CLASS.asString = 'FB'));

     {InfoPower throws exception when doing PTOper.Edit}
     if not wwDataInspectorPtOper.HaveVisibleItem then
        wwDataInspectorPtOper.DataSource:= nil
     else if wwDataInspectorPtOper.DataSource = nil then
        wwDataInspectorPtOper.DataSource:= SrcPtOper;
     wwDataInspectorPtOper.Visible:= wwDataInspectorPtOper.DataSource <> nil;

     {enable ptsper only for non components ie packaging}
     if (TblStandardLookupMfgType.asString = 'MBATCH') or (TblStandardLookupMfgType.asString = 'COMPOUND1') then
       DBEdit12.Enabled:= (TblSndOpOP_CLASS.asString > '') and (TblSndOpOP_CLASS.asString <> 'IN');

     UpdateMultiplesOfCaption;
  end;*)
end;

procedure TBOM_DM.TblMfg_AuxNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('How_Many').asFloat:= 1;
end;

procedure TBOM_DM.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TBOM_DM.TblOpMatPTSPERValidate(Sender: TField);
begin
  //if Abs(Sender.asFloat) < 0.0000000001 then
  //   raise Exception.Create('Parts Per must be greater than 0');

  bom_pts_per_check.CheckBOMPtsPerIsZero( TblOpMatID.asFloat, Sender.asFloat );
end;

procedure TBOM_DM.PkSndOpIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on qk_stdOp}
  //Action:= DoDefineQuickSndOper( ResultValue );
end;

procedure TBOM_DM.TblPartNoNewRecord(DataSet: TDataSet);
begin
  TblPartNoID.asFloat:= 0;
  TblPartNoSTDCAV.Value:= 1;
  if StrInList( TblStandardLookupMfgType.asString, ['FAB']) then
     TblPartNoACTCAV.Value:= 0
  else
     TblPartNoACTCAV.Value:= 1;

end;

procedure TBOM_DM.TblPtOperCalcFields(DataSet: TDataSet);
var
  ACount: Real;
begin
  //TblPtOperOP_Cost.asFloat:= TblPtOperCYCLETM.asFloat * TblSndOpCNTR_RATE.asFloat;
  if TblPtOperSNDOP_ID.asFloat > 0 then
     TblPtOperOP_Cost.asFloat:= TblPtOperCYCLETM.asFloat / 3600 * SelectValueFmtAsFloat( 'select cntr_rate from sndop where id = %f', [ TblPtOperSNDOP_ID.asFloat ])
  else
     TblPtOperOP_Cost.asFloat:= 0;

  ACount:= SelectValueFmtAsFloat('select count(*) from ptoper_depend where ptoper_id = %f', [ TblPtOperID.asFloat ]);
  if ACount > 1 then
     TblPtOperParentOpNo.asString:= '<Multiple>'
  else if ACount = 1 then
     TblPtOperParentOpNo.asString:= SelectValueFmtAsString('select decode( d.parent_id, -1, ''<START>'', s.opno) from sndop s, ptoper_depend d, ptoper p '+
                                                 ' where d.ptoper_id = %f and d.parent_id = p.id(+) and p.sndop_id = s.id(+)',
                                                 [ TblPtOperID.asFloat ]);
end;

procedure TBOM_DM.TblOpMatBeforePost(DataSet: TDataSet);
begin
  AssignIDBeforePost( DataSet );

  if (TRim(TblStandardLookupMfgType.asString) = 'GENERIC') and
     (TblOpMatSTANDARD_ID.asFloat > 0 )               and
     (SelectValueFmtAsFloat('select count(o.id)                 '+
                '  from partno p, ptoper t, opmat o '+
                ' where p.standard_id = %f          '+
                '   and t.partno_id = p.id          '+
                '   and o.sndop_id = t.sndop_id     '+
                '   and o.id <> %f                  '+
                '   and o.standard_id is not NULL   ', [ TblStandardID.asFloat, TblOpMatID.asFloat ]) > 0) then
     raise Exception.Create('Assy@WorkCenter: only 1 item is allowed to be applied specific Mfg #');

  if TblOpMatEXCLUDE_BACKFLUSH.asString <> 'Y' then
     TblOpMatINCLUDE_STD_COST.Clear;

  if TblOpMatEXCLUDE_BACKFLUSH.asString = 'Y' then
     TblOpMatEXCLUDE_STD_COST.Clear;

  if TblOpMatEXCLUDE_STD_COST.asString = 'Y' then
  begin
     TblOpMatEXCLUDE_BACKFLUSH.Clear;
     TblOpMatINCLUDE_STD_COST.Clear;
  end;
end;

procedure TBOM_DM.TblOpMatAfterPost(DataSet: TDataSet);
begin
  // nothing.  Bom_MBatch_Worksheet uses this event handler after firing this event...which is currently empty.
end;

procedure TBOM_DM.TblSndOpCalcFields(DataSet: TDataSet);
begin
  TblSndOpopNoDisp.asString:= Format('%s [%s]', [ TblSndOpOPDESC.asString, TblSndOpOPNO.asString ]);

  if TblSndOpUSE_MULTIPLIER.asString = 'Y'  then
     TblSndOpMultiplesOfDisp.asString:= 'Multiplier'
  else
     TblSndOpMultiplesOfDisp.asString:= 'Multiples Of';
end;

procedure TBOM_DM.TblAuxAfterPost(DataSet: TDataSet);
begin
  // FDManager.FindConnection('IQFD').ApplyUpdates( [ TFDQuery(DataSet) ]);
  // ReOpen( QryAux );
  RefreshDataSetByID( QryAux );
  TblMfg_Aux.Refresh;
end;

procedure TBOM_DM.TblOpMatBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  if (TblSndOpOP_CLASS.asString = 'OP') and (TblOpMatARINVT_ID.asFloat = 0) then
     System.SysUtils.ABORT
end;

procedure TBOM_DM.wwQryWork_CenterFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if TblStandardMFGCELL_ID.asFloat > 0 then
     Accept:= TblStandardMFGCELL_ID.asFloat = DataSet.FieldByName('MFGCELL_ID').asFloat               // wwQryWork_CenterMFGCELL_ID.asFloat
  else
     Accept:= Trim(TblStandardMFG_TYPE.asString) =  Trim(DataSet.FieldByName('MFG_TYPE').asString);  //  Trim(wwQryWork_CenterMFG_TYPE.asString);
end;

procedure TBOM_DM.wwQryAuxBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ID').asFloat = 0 then
     DataSet.FieldByName('ID').asFloat:= GetNextID('AUX');
end;

procedure TBOM_DM.wwQryAuxCalcFields(DataSet: TDataSet);
begin
  if wwQryAuxEPLANT_ID.asFloat = 0 then
     wwQryAuxEPLant_ID_Disp.Clear
  else
     wwQryAuxEPLant_ID_Disp.asFloat:= wwQryAuxEPLANT_ID.asFloat;

   if wwQryAuxELEMENTS_ID.asFloat > 0 then
      wwQryAuxElem_Descrip.asString:= SelectValueByID('elem_descrip', 'elements', wwQryAuxELEMENTS_ID.asFloat);
end;

procedure TBOM_DM.DataModuleDestroy(Sender: TObject);
begin
  ArinvtEOCList.Free;
end;

procedure TBOM_DM.TblStandard_PmeqmtNewRecord(DataSet: TDataSet);
begin
  TblStandard_PmeqmtID.asFloat:= 0;
  if SelectValueFmtAsFloat('select 1 from standard_pmeqmt where standard_id = %f and is_primary = ''Y''', [ TblStandardID.asFloat ]) = 0 then
     TblStandard_PmeqmtIS_PRIMARY.asString:= 'Y';
end;

procedure TBOM_DM.TblStandard_Pr_EmpCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblStandard_Pr_EmpPR_EMP_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt('select empno, first_name, middle_name, last_name from pr_emp where id = %f', [ TblStandard_Pr_EmpPR_EMP_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblStandard_Pr_EmpEmpNo.asString:= A[ 0 ];
      TblStandard_Pr_EmpFirstName.asString:= A[ 1 ];
      TblStandard_Pr_EmpMiddleName.asString:= A[ 2 ];
      TblStandard_Pr_EmpLastName.asString:= A[ 3 ];
    end;
  end;
end;

procedure TBOM_DM.TblStandard_Pr_EmpNewRecord(DataSet: TDataSet);
begin
  TblStandard_Pr_EmpID.asFloat:= 0;
end;

procedure TBOM_DM.TblStandard_PmeqmtBeforePost(DataSet: TDataSet);
begin
  AssignIDBeforePost(DataSet);

  {prevent from unchecking is_primary}
  if (TblStandard_PmeqmtIS_PRIMARY.asString <> 'Y') and (SelectValueByID('is_primary', 'standard_pmeqmt', TblStandard_PmeqmtID.asFloat ) = 'Y') then
     TblStandard_PmeqmtIS_PRIMARY.asString:= 'Y';
end;

procedure TBOM_DM.TblStandard_PmeqmtCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblStandard_PmeqmtPMEQMT_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt('select eqno, location, descrip, service_date_in, service_date_out from pmeqmt where id = %f',
                            [ TblStandard_PmeqmtPMEQMT_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblStandard_PmeqmtEqno.asString:= A[ 0 ];
      TblStandard_PmeqmtLocation.asString:= A[ 1 ];
      TblStandard_PmeqmtDescrip.asString:= A[ 2 ];
      TblStandard_PmeqmtService_IN.asString:= A[ 3 ];
      TblStandard_PmeqmtServiceOUT.asString:= A[ 4 ];
    end;
  end;
end;

procedure TBOM_DM.TblStandard_PmeqmtAfterPost(DataSet: TDataSet);
var
  AID: Real;
begin
  if TblStandard_PmeqmtIS_PRIMARY.asString = 'Y' then
     ExecuteCommandFmt('update standard_pmeqmt set is_primary = NULL where standard_id = %f and id <> %f and is_primary = ''Y''',
               [ TblStandardID.asFloat, TblStandard_PmeqmtID.asFloat ]);

  if SelectValueFmtAsFloat('select 1 from standard_pmeqmt where standard_id = %f and is_primary = ''Y''', [ TblStandardID.asFloat ]) = 0 then
     ExecuteCommandFmt('update standard_pmeqmt set is_primary = ''Y'' where id = %f',
               [ TblStandard_PmeqmtID.asFloat ]);

  // TblStandard_Pmeqmt.Refresh;
  RefreshDataSetByID( TblStandard_Pmeqmt );  // 10-27-2008 force refresh of the calculated fields looked up in the wwdbgrid

  AID:= SelectValueFmtAsFloat('select pmeqmt_id from standard_pmeqmt where standard_id = %f and is_primary = ''Y''', [ TblStandardID.asFloat ]);

  if AID = 0 then
     ExecuteCommandFmt('update standard set pmeqmt_id = NULL where id = %f', [ TblStandardID.asFloat ])
  else
     ExecuteCommandFmt('update standard set pmeqmt_id = %f where id = %f', [ AID, TblStandardID.asFloat ]);
end;


procedure TBOM_DM.PkSndOpFABIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on Qk_FabOp}
  //Action:= DoDefineQuickFABOper( ResultValue ); {Qk_FabOp}
end;

procedure TBOM_DM.TblPartNoCalcFields(DataSet: TDataSet);
var
  ANonSkeletonWeight: Real;
begin
  if TblPartNoARINVT_ID.asFloat > 0 then
     TblPartNoPlannerCode.asString:= SelectValueFmtAsString('select p.code from arinvt a, planner_code p where a.id = %f and a.planner_code_id = p.id',
                                                  [ TblPartNoARINVT_ID.asFloat ])
  else
     TblPartNoPlannerCode.Clear;

  if Is_Thermoform( TblStandardLookupMfgType.asString ) then
  begin
    {net parts weight in bom uom}
    ANonSkeletonWeight:= SelectValueFmtAsFloat('select sum( nvl(partno.ptwt_thermo_disp,0) * nvl(partno.actcav,1)) '+
                                   '  from partno where partno.standard_id = %f',
                                   [ TblStandardID.asFloat ]);
    {skeleton weight in bom uom}
    TblPartNoSkeleton_Weight_Disp.asFloat:= TblStandardSheet_Weight_Disp.asFloat - ANonSkeletonWeight;
  end;

  if TblPartNoARINVT_ID.asFloat > 0 then
     TblPartNoDefaultMfgNo.asString:= SelectValueFmtAsString('select s.mfgno from arinvt a, standard s where a.id = %f and a.standard_id = s.id', [ TblPartNoARINVT_ID.asFloat ]);

  AssignPartnoCalculatedFields( TblPartNoARINVT_ID.asFloat );
end;


procedure TBOM_DM.PkArinvtByProductIQModify(Sender: TObject;  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= DoQuickAppend( TQuickAddPlastic, ResultValue );
  if (Action = mrOK) and (ResultValue  > 0) then
     ExecuteCommandFmt('update arinvt set is_by_product = ''Y'' where id = %f', [ DtoF( ResultValue )]);
end;

procedure TBOM_DM.PkArinvtPLBeforeOpen(DataSet: TDataSet);
begin
  AssignEPlantFilter(DataSet);

  if TblStandardLookupMfgType.asString = 'TFORM2' then
     // TFDQuery(DataSet).ParamByName('only_each').Value := 1
     AssignQueryParamValue(DataSet, 'only_each', 1)
  else
     // TFDQuery(DataSet).ParamByName('only_each').Value := 0;
     AssignQueryParamValue(DataSet, 'only_each', 0)
end;

function TBOM_DM.Is_Thermoform( AMfgType: string ): Boolean;
begin
  Result:= StrInList( Uppercase(Trim(AMfgType)), ['TFORM2', 'THERMOFORM']);
end;

function TBOM_DM.Is_Slitting( AMfgType: string ): Boolean;
begin
  Result:= Uppercase(Trim( AMfgType )) = 'SLITTING';
end;

procedure TBOM_DM.PkSalesConfigTemplatesForThisStandardBeforeOpen(DataSet: TDataSet);
begin
  //with TFDQuery(DataSet) do
  //ParamByName('STANDARD_ID').AsInteger := TblStandardID.AsInteger;
  AssignQueryParamValue(DataSet, 'STANDARD_ID', TblStandardID.AsInteger)
end;

procedure TBOM_DM.PkSndOpAssy1IQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on Qk_Assy1Op}
  //Action:= DoDefineQuickAssy1Oper( ResultValue ); {Qk_Assy1Op.pas}
end;


procedure TBOM_DM.AssignPartnoCalculatedFields( AArinvt_ID: Real );
var
  A: Variant;
begin
  if AArinvt_ID = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select class,            '+
                            '        itemno,          '+
                            '        descrip,         '+
                            '        rev,             '+
                            '        ecno,            '+
                            '        drawing,         '+
                            '        unit,            '+
                            '        descrip2,        '+
                            '        eplant_id,       '+
                            '        fab_start,       '+
                            '        planner_code_id, '+
                            '        is_by_product,   '+
                            '        phantom          '+
                            '   from arinvt           '+
                            '  where id = %f          ',
                            [ AArinvt_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  TblPartNoClass.asString           := A[ 0 ];
  TblPartNoItemno.asString          := A[ 1 ];
  TblPartNoDescrip.asString         := A[ 2 ];
  TblPartNoRev.asString             := A[ 3 ];
  TblPartNoEcno.asString            := A[ 4 ];
  TblPartNoDrawing.asString         := A[ 5 ];
  TblPartNoUnit.asString            := A[ 6 ];
  TblPartNoDescrip2.asString        := A[ 7 ];
  TblPartNoArinvt_EPlant_ID.asString:= FloatToStr0asNull( DtoF(A[ 8 ]) );
  TblPartNoIsFabStart.asString      := A[ 9 ];
  TblPartNoPlanner_Code_ID.asString := FloatToStr0asNull( DtoF(A[ 10]) );
  TblPartNoIs_By_Product.asString   := A[ 11];
  TblPartNoPhantom.asString         := A[ 12];
end;


procedure TBOM_DM.AssignStandardCalculatedFields( AArinvt_ID: Real );
var
  A: Variant;
begin
  if AArinvt_ID = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select descrip,     '+
                            '       eplant_id,   '+
                            '       spg,         '+
                            '       gauge,       '+
                            '       length,      '+
                            '       width        '+
                            '  from arinvt       '+
                            ' where id = %f      ',
                            [ AArinvt_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  TblStandardMatDescrip.asString  := A[ 0 ];
  TblStandardMatEPlant_ID.asString:= FloatToStr0asNull( DtoF(A[ 1 ]) );
  TblStandardMatSPG.asString      := A[ 2 ];
  TblStandardMatGauge.asString    := A[ 3 ];
  TblStandardMatLength.asString   := A[ 4 ];
  TblStandardMatWidth.asString    := A[ 5 ];

  if SelectValueFmtAsFloat('select uom.is_metric_sys_num( %f ) from dual', [ TblStandardEPLANT_ID.asFloat ]) = 1 then
     TblStandardCalcType.asString:= 'Metric'
  else
     TblStandardCalcType.asString:= 'Imperial';
end;

procedure TBOM_DM.TblOpMatCalcFields(DataSet: TDataSet);
begin
  AssignOpMatCalculatedFields( TblOpmatARINVT_ID.asFloat );
end;


procedure TBOM_DM.AssignOpMatCalculatedFields( AArinvt_ID: Real );
var
  A: Variant;
begin
  if AArinvt_ID = 0 then
     EXIT;

  try
   //  TblOpMat.DisableControls;  02-25-2016 FireDAC conversion, commented out due to causing multiple duplicate opmat records
  A:= SelectValueArrayFmt( 'select                   '+
                            '        itemno,          '+
                            '        descrip,         '+
                            '        descrip2,        '+
                            '        class,           '+
                            '        rev,             '+
                            '        non_material,    '+
                            '        eplant_id,       '+
                            '        standard_id,     '+
                            '        is_by_product,   '+
                            '        spg,             '+  // used in Bom_MBatch_Worksheet for
                            '        std_cost         '+  // mbatch and compound1
                            '   from arinvt           '+
                            '  where id = %f          ',
                            [ AArinvt_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  TblOpMatItemNo.asString            := A[ 0 ];
  TblOpMatDESCRIP.asString           := A[ 1 ];
  TblOpMatDESCRIP2.asString          := A[ 2 ];
  TblOpMatClass.asString             := A[ 3 ];
  TblOpMatRev.asString               := A[ 4 ];
  TblOpMatNon_Material.asString      := A[ 5 ];
  TblOpMatArinvt_EPLant_ID.asString  := FloatToStr0asNull( DtoF(A[ 6 ]));
  TblOpMatArinvt_Standard_ID.asString:= FloatToStr0asNull( DtoF(A[ 7 ]));
  TblOpMatIs_By_Product.asString     := A[ 8 ];
  TblOpMatSpg.asString               := A[ 9 ];
  TblOpMatStd_Cost.asString          := A[ 10];
  finally
    // TblOpMat.EnableControls;
  end;
end;


procedure TBOM_DM.TblPtOperBeforePost(DataSet: TDataSet);
var
  ANeedToRefreshDataSet: Boolean;

  procedure _CheckEnsureOnlyOneProcessHasFlagAssigned( AFieldName: string );
  begin
    if (DataSet.State = dsEdit) and (DataSet.FieldByName( AFieldName ).asString = 'Y') and (SelectValueByID( AFieldName, 'ptoper', DataSet.FieldByName('id').asFloat) <> 'Y') then
    begin
       ExecuteCommandFmt('update ptoper set ' + AFieldName + ' = null where partno_id = %f and id <> %f',
                 [ DataSet.FieldByName('partno_id').asFloat,
                   DataSet.FieldByName('id').asFloat ]);
       ANeedToRefreshDataSet:= TRUE;
    end;
  end;

begin
  // // 03-23-2009 ASSY1 only!
  // if StrInList(TblStandardLookupMfgType.asString, ['ASSY1', 'ASSY2', 'ASSY3']) and (DataSet.State = dsInsert)  then
  //    IQAssert( SelectValueFmtAsFloat('select count(*) from ptoper where partno_id = %f and sndop_id = %f',
  //                        [ DataSet.FieldByName('partno_id').asFloat, DataSet.FieldByName('sndop_id').asFloat ]) = 0,
  //              {Process# %s already exists in the Mfg# %s - operation aborted}
  //              Format( bom_rscstr.cTXT0000017, [ SelectValueByID('opno', 'sndop', DataSet.FieldByName('sndop_id').asFloat), TblStandardMFGNO.asString ]));

  AssignIDBeforePost( DataSet );

  ANeedToRefreshDataSet:= FALSE;

  _CheckEnsureOnlyOneProcessHasFlagAssigned( 'report_final_assy' );
  _CheckEnsureOnlyOneProcessHasFlagAssigned( 'use_for_label_print' );
  _CheckEnsureOnlyOneProcessHasFlagAssigned( 'grouping_process' );

  if ANeedToRefreshDataSet then
     { TODO -oSanketG -cWC : Need to revisit, dependent on bom_shel }
     //PostMessage( TBomShell(Owner).Handle, iq_RefreshDataSets, 1, 0);  // reload outline
end;

procedure TBOM_DM.PkWorkCenterTypeBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('mfg_type').asString := TblStandardMFG_TYPE.asString;
  //   ParamByName('mfgcell_id').Value := TblStandardMFGCELL_ID.asFloat;
  // end;
  AssignQueryParamValue(DataSet, 'mfg_type',   TblStandardMFG_TYPE.asString );
  AssignQueryParamValue(DataSet, 'mfgcell_id', TblStandardMFGCELL_ID.asFloat);
end;


procedure TBOM_DM.wwQryAuxNewRecord(DataSet: TDataSet);
var
  LSM : TSecurityManager;
begin
  LSM := SecurityManager;
  if (Assigned(LSM)) and (LSM.EPlant_ID_AsFloat > 0) then
     wwQryAuxEPLANT_ID.asFloat:= LSM.EPlant_ID_AsFloat;
end;

procedure TBOM_DM.TblStandardARINVT_ID_MATChange(Sender: TField);
begin
  if (Is_Thermoform( TblStandardLookupMfgType.asString ) or Is_Slitting( TblStandardLookupMfgType.asString )) and (Sender.AsFloat > 0) then    // (TblStandardGAUGE.asFloat = 0) and
     TblStandardGAUGE.asFloat:= SelectValueByID( 'gauge', 'arinvt', Sender.AsFloat );
end;

procedure TBOM_DM.QryStandardEmpDocsCalcFields(DataSet: TDataSet);
begin
  if QryStandardEmpDocsASSIGNED_DOC_REVISION_ID.asFloat = 0 then
     QryStandardEmpDocsStatus.asString:= 'Not Certified'

  else if QryStandardEmpDocsASSIGNED_DOC_REVISION_ID.asFloat <> QryStandardEmpDocsCURRENT_DOC_REVISION_ID.asFloat  then
     QryStandardEmpDocsStatus.asString:= 'Certification Revision Mismatch'

  else if (QryStandardEmpDocsASSIGNED_DOC_REVISION_ID.asFloat = QryStandardEmpDocsCURRENT_DOC_REVISION_ID.asFloat) and  (QryStandardEmpDocsASSIGNED_DOC_REVISION_ID.asFloat > 0) then
     QryStandardEmpDocsStatus.asString:= 'Certified'
end;

procedure TBOM_DM.QryStandardEmpDocsUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest = arDelete then
  begin
    ExecuteCommandFmt('delete standard_pr_emp_doc where id = %f', [ DtoF(ASender.FieldByName('id').OldValue) ]);
  end;
  AAction := eaApplied;
end;

procedure TBOM_DM.AbortInsert(DataSet: TDataSet);
begin
  System.SysUtils.ABORT;
end;

procedure TBOM_DM.QryStandardEmpDocsBeforeDelete(DataSet: TDataSet);
begin
  IQAssert( QryStandardEmpDocsID.asFloat > 0, 'Certificaton is not assigned for this document');
end;

procedure TBOM_DM.ApplyUpdate(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable(DataSet);
  Reopen(DataSet);
end;


procedure TBOM_DM.TblMfg_AuxBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TBOM_DM.TblMfg_AuxCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  TblMfg_AuxElem_Descrip.asString:= SelectValueFmtAsString('select e.elem_descrip from aux, elements e where aux.id = %f and aux.elements_id = e.id', [ TblMfg_AuxAUX_ID.asFloat ]);

  if TblMfg_AuxAUX_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt( 'select setuphrs1, setuphrs2 from aux where id = %f', [ TblMfg_AuxAUX_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblMfg_AuxSetupHrs1.asFloat:= A[ 0 ];
      TblMfg_AuxSetupHrs2.asFloat:= A[ 1 ];
    end;
  end;
end;


function TBOM_DM.MfgcellHasCntrType( AMfgcell_ID: Real; ACntrType: string ): Boolean;
begin
  Result:= TRUE;

  if (AMfgcell_ID = 0) or (Trim(ACntrType) = '') then
     EXIT;

  Result:= SelectValueFmtAsFloat('select 1 from work_center                '+
                                       ' where misc.eplant_filter(eplant_id) = 1 '+
                                       '   and mfgcell_id = %f                   '+
                                       '   and rtrim(cntr_type) = rtrim(''%s'')  '+
                                       '   and rownum < 2                        ',
                                       [ AMfgcell_ID,
                                         FixStr( ACntrType )]) = 1;
end;

end.
