unit _CostSourceDataModule;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  System.Variants,
  IQMS.CostSource.Types,
  Generics.Collections,
  Vcl.ActnList,
  IQMS.WebVcl.AppDef,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  System.Actions;

type
  TCostSourceDataModule = class(TDataModule)
    PkProject: TIQWebHPick;
    PkMROWorkOrder: TIQWebHPick;
    PkMROWorkOrderWORK_ORDER_NO: TBCDField;
    PkMROWorkOrderEQNO: TStringField;
    PkMROWorkOrderTASK_NUMBER: TStringField;
    PkProjectTask: TIQWebHPick;
    PkMROWorkOrderPMWO_DTL_ID: TBCDField;
    PkMROWorkOrderEPLANT_ID: TBCDField;
    PkMROWorkOrderTASK_DESCRIPTION: TStringField;
    PkProjectTaskTOOL_RFQ_ID: TBCDField;
    PkProjectTaskWORKORDERNO: TStringField;
    PkProjectTaskRFQ: TStringField;
    PkProjectTaskPROJECT: TStringField;
    PkProjectTaskBUYERID: TStringField;
    PkProjectTaskCUSTNO: TStringField;
    PkProjectTaskCOMPANY: TStringField;
    PkProjectTaskNAME: TStringField;
    PkProjectTaskITEMNO: TStringField;
    PkProjectTaskDESCRIP: TStringField;
    PkProjectTaskELEM_DESCRIP: TStringField;
    PkProjectTaskEPLANT_ID: TBCDField;
    PkProjectTaskEPLANT_NAME: TStringField;
    PkProjectTOOL_RFQ_ID: TBCDField;
    PkProjectWORKORDERNO: TStringField;
    PkProjectRFQ: TStringField;
    PkProjectPROJECT: TStringField;
    PkProjectBUYERID: TStringField;
    PkProjectCUSTNO: TStringField;
    PkProjectCOMPANY: TStringField;
    PkProjectEPLANT_ID: TBCDField;
    PkProjectEPLANT_NAME: TStringField;
    PkProjectTaskTOOL_TASK_INFORMATION_ID: TBCDField;
    PkMROWorkOrderWO_DATE: TDateTimeField;
    PkJobShop: TIQWebHPick;
    PkJobShopID: TBCDField;
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
    PkJobShopTopItem: TIQWebHPick;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    PkJobShopMAIN_ARINVT_ID: TBCDField;
    PkJobShopMAIN_STANDARD_ID: TBCDField;
    PkJobShopTASK_ARINVT_ID: TBCDField;
    PkJobShopTASK_STANDARD_ID: TBCDField;
    PkFixedAssets: TIQWebHPick;
    PkFixedAssetsID: TBCDField;
    PkFixedAssetsASSET_NO: TStringField;
    PkFixedAssetsDESCRIP: TStringField;
    PkFixedAssetsSERIAL_NUMBER: TStringField;
    PkFixedAssetsEPLANT_ID: TBCDField;
    PkFixedAssetsEPLANT_NAME: TStringField;
    PkJobShopOPNO: TStringField;
    PkJobShopOPDESC: TStringField;
    PkJobShopSNDOP_DISPATCH_ID: TBCDField;
    PkJobShopTopItemOPNO: TStringField;
    PkJobShopTopItemOPDESC: TStringField;
    PkJobShopTopItemSNDOP_DISPATCH_ID: TBCDField;
    PkMROWorkOrderCOMPANY: TStringField;
    SrcProjectArprepost: TDataSource;
    QryProjectArprepost: TFDQuery;
    QryProjectArprepostINVOICE_NO: TStringField;
    QryProjectArprepostINVOICE_ITEMNO: TStringField;
    QryProjectArprepostRFQ: TStringField;
    QryProjectArprepostWORKORDERNO: TStringField;
    QryProjectArprepostPROJECT: TStringField;
    QryProjectArprepostTOOL_RFQ_ID: TBCDField;
    QryProjectArprepostSOURCE: TStringField;
    SrcProjectARInvoice: TDataSource;
    QryProjectARInvoice: TFDQuery;
    QryProjectARInvoiceTOOL_RFQ_ID: TBCDField;
    QryProjectARInvoiceINVOICE_NO: TStringField;
    QryProjectARInvoiceINVOICE_ITEMNO: TStringField;
    QryProjectARInvoiceRFQ: TStringField;
    QryProjectARInvoiceWORKORDERNO: TStringField;
    QryProjectARInvoicePROJECT: TStringField;
    QryProjectARInvoiceSOURCE: TStringField;
    SrcProjectTaskArprepost: TDataSource;
    QryProjectTaskArprepost: TFDQuery;
    QryProjectTaskArprepostINVOICE_NO: TStringField;
    QryProjectTaskArprepostINVOICE_ITEMNO: TStringField;
    QryProjectTaskArprepostRFQ: TStringField;
    QryProjectTaskArprepostWORKORDERNO: TStringField;
    QryProjectTaskArprepostPROJECT: TStringField;
    QryProjectTaskArprepostTOOL_RFQ_ID: TBCDField;
    QryProjectTaskArprepostNAME: TStringField;
    QryProjectTaskArprepostELEM_DESCRIP: TStringField;
    QryProjectTaskArprepostITEMNO: TStringField;
    QryProjectTaskArprepostITEM_DESCRIP: TStringField;
    QryProjectTaskArprepostSOURCE: TStringField;
    SrcProjectTaskARInvoice: TDataSource;
    QryProjectTaskARInvoice: TFDQuery;
    QryProjectTaskARInvoiceTOOL_RFQ_ID: TBCDField;
    QryProjectTaskARInvoiceINVOICE_NO: TStringField;
    QryProjectTaskARInvoiceINVOICE_ITEMNO: TStringField;
    QryProjectTaskARInvoiceRFQ: TStringField;
    QryProjectTaskARInvoiceWORKORDERNO: TStringField;
    QryProjectTaskARInvoicePROJECT: TStringField;
    QryProjectTaskARInvoiceNAME: TStringField;
    QryProjectTaskARInvoiceELEM_DESCRIP: TStringField;
    QryProjectTaskARInvoiceITEMNO: TStringField;
    QryProjectTaskARInvoiceITEM_DESCRIP: TStringField;
    QryProjectTaskARInvoiceSOURCE: TStringField;
    QryProjectAPInvoice: TFDQuery;
    QryProjectAPInvoiceID: TBCDField;
    QryProjectAPInvoiceTOOL_RFQ_ID: TBCDField;
    QryProjectAPInvoiceINVOICE_NO: TStringField;
    QryProjectAPInvoiceAP_ITEMNO: TStringField;
    QryProjectAPInvoiceWORKORDERNO: TStringField;
    QryProjectAPInvoiceITEMNO: TStringField;
    QryProjectAPInvoiceNAME: TStringField;
    QryProjectAPInvoiceELEM_DESCRIP: TStringField;
    QryProjectAPInvoiceSOURCE: TStringField;
    SrcProjectAPInvoice: TDataSource;
    SrcProjectApprepost: TDataSource;
    QryProjectApprepost: TFDQuery;
    QryProjectApprepostINVOICE_NO: TStringField;
    QryProjectApprepostINVOICE_ITEMNO: TStringField;
    QryProjectApprepostPO_DETAIL_ID: TBCDField;
    QryProjectApprepostITEMNO: TStringField;
    QryProjectApprepostITEM_DESCRIP: TStringField;
    QryProjectApprepostELEM_DESCRIP: TStringField;
    QryProjectApprepostNAME: TStringField;
    QryProjectApprepostWORKORDERNO: TStringField;
    QryProjectApprepostELEMENTS_ID: TFMTBCDField;
    QryProjectApprepostARINVT_ID: TFMTBCDField;
    QryProjectApprepostTOOL_RFQ_ID: TBCDField;
    QryProjectApprepostTOOL_ARCUSTO_ID: TFMTBCDField;
    QryProjectApprepostSOURCE: TStringField;
    QryProjectOrders: TFDQuery;
    QryProjectOrdersORDERNO: TStringField;
    QryProjectOrdersRFQ: TStringField;
    QryProjectOrdersOE_ITEMNO: TStringField;
    QryProjectOrdersWORKORDERNO: TStringField;
    QryProjectOrdersPROJECT: TStringField;
    QryProjectOrdersTOOL_RFQ_ID: TBCDField;
    QryProjectOrdersSOURCE: TStringField;
    SrcProjectOrders: TDataSource;
    QryProjectTaskOrders: TFDQuery;
    QryProjectTaskOrdersORDERNO: TStringField;
    QryProjectTaskOrdersOE_ITEMNO: TStringField;
    QryProjectTaskOrdersRFQ: TStringField;
    QryProjectTaskOrdersWORKORDERNO: TStringField;
    QryProjectTaskOrdersPROJECT: TStringField;
    QryProjectTaskOrdersTOOL_RFQ_ID: TBCDField;
    QryProjectTaskOrdersNAME: TStringField;
    QryProjectTaskOrdersELEM_DESCRIP: TStringField;
    QryProjectTaskOrdersITEMNO: TStringField;
    QryProjectTaskOrdersITEM_DESCRIP: TStringField;
    QryProjectTaskOrdersSOURCE: TStringField;
    SrcProjectTaskOrders: TDataSource;
    SrcProjectOrderHist: TDataSource;
    QryProjectOrderHist: TFDQuery;
    QryProjectOrderHistORDERNO: TStringField;
    QryProjectOrderHistOE_ITEMNO: TStringField;
    QryProjectOrderHistRFQ: TStringField;
    QryProjectOrderHistWORKORDERNO: TStringField;
    QryProjectOrderHistPROJECT: TStringField;
    QryProjectOrderHistTOOL_RFQ_ID: TBCDField;
    QryProjectOrderHistSOURCE: TStringField;
    SrcProjectTaskOrderHist: TDataSource;
    QryProjectTaskOrderHist: TFDQuery;
    QryProjectTaskOrderHistORDERNO: TStringField;
    QryProjectTaskOrderHistOE_ITEMNO: TStringField;
    QryProjectTaskOrderHistRFQ: TStringField;
    QryProjectTaskOrderHistWORKORDERNO: TStringField;
    QryProjectTaskOrderHistPROJECT: TStringField;
    QryProjectTaskOrderHistTOOL_RFQ_ID: TBCDField;
    QryProjectTaskOrderHistNAME: TStringField;
    QryProjectTaskOrderHistELEM_DESCRIP: TStringField;
    QryProjectTaskOrderHistITEMNO: TStringField;
    QryProjectTaskOrderHistITEM_DESCRIP: TStringField;
    QryProjectTaskOrderHistSOURCE: TStringField;
    QryProjectPO: TFDQuery;
    QryProjectPOPONO: TStringField;
    QryProjectPOPO_ITEMNO: TStringField;
    QryProjectPOPO_DETAIL_ID: TBCDField;
    QryProjectPOITEMNO: TStringField;
    QryProjectPOITEM_DESCRIP: TStringField;
    QryProjectPOELEM_DESCRIP: TStringField;
    QryProjectPONAME: TStringField;
    QryProjectPOWORKORDERNO: TStringField;
    QryProjectPOELEMENTS_ID: TFMTBCDField;
    QryProjectPOARINVT_ID: TFMTBCDField;
    QryProjectPOTOOL_RFQ_ID: TBCDField;
    QryProjectPOTOOL_ARCUSTO_ID: TFMTBCDField;
    QryProjectPOSOURCE: TStringField;
    SrcProjectPO: TDataSource;
    SrcProjectPOHist: TDataSource;
    QryProjectPOHist: TFDQuery;
    QryProjectPOHistPONO: TStringField;
    QryProjectPOHistPO_ITEMNO: TStringField;
    QryProjectPOHistWORKORDERNO: TStringField;
    QryProjectPOHistITEMNO: TStringField;
    QryProjectPOHistNAME: TStringField;
    QryProjectPOHistELEM_DESCRIP: TStringField;
    QryProjectPOHistTOOL_RFQ_ID: TBCDField;
    QryProjectPOHistSOURCE: TStringField;
    QryProjectGL: TFDQuery;
    QryProjectGLDEBIT_CREDIT: TFMTBCDField;
    QryProjectGLTOOL_RFQ_ID: TBCDField;
    QryProjectGLWORKORDERNO: TStringField;
    QryProjectGLNAME: TStringField;
    QryProjectGLELEM_DESCRIP: TStringField;
    QryProjectGLSOURCE: TStringField;
    QryProjectGLRFQ: TStringField;
    QryProjectGLPROJECT: TStringField;
    SrcProjectGL: TDataSource;
    SrcProjectGJ: TDataSource;
    QryProjectGJ: TFDQuery;
    QryProjectGJDEBIT_CREDIT: TFMTBCDField;
    QryProjectGJTOOL_RFQ_ID: TBCDField;
    QryProjectGJWORKORDERNO: TStringField;
    QryProjectGJNAME: TStringField;
    QryProjectGJELEM_DESCRIP: TStringField;
    QryProjectGJSOURCE: TStringField;
    QryProjectGJRFQ: TStringField;
    QryProjectGJPROJECT: TStringField;
    ActionList1: TActionList;
    JumpToProjectManager1: TAction;
    JumpToMRO1: TAction;
    JumpToMROWorkOrder1: TAction;
    SrcFixedAssetsArprepost: TDataSource;
    QryFixedAssetsArprepost: TFDQuery;
    QryFixedAssetsArprepostINVOICE_NO: TStringField;
    QryFixedAssetsArprepostINVOICE_ITEMNO: TStringField;
    QryFixedAssetsArprepostFA_MAIN_ID: TBCDField;
    QryFixedAssetsArprepostASSET_NO: TStringField;
    QryFixedAssetsArprepostDESCRIP: TStringField;
    QryFixedAssetsArprepostSERIAL_NUMBER: TStringField;
    QryFixedAssetsArprepostIN_SERVICE_DATE: TDateTimeField;
    JumpToFixedAssets1: TAction;
    SrcFixedAssetsARInvoice: TDataSource;
    QryFixedAssetsARInvoice: TFDQuery;
    QryFixedAssetsARInvoiceINVOICE_NO: TStringField;
    QryFixedAssetsARInvoiceINVOICE_ITEMNO: TStringField;
    QryFixedAssetsARInvoiceFA_MAIN_ID: TBCDField;
    QryFixedAssetsARInvoiceASSET_NO: TStringField;
    QryFixedAssetsARInvoiceDESCRIP: TStringField;
    QryFixedAssetsARInvoiceSERIAL_NUMBER: TStringField;
    QryFixedAssetsARInvoiceIN_SERVICE_DATE: TDateTimeField;
    SrcFixedAssetsApprepost: TDataSource;
    QryFixedAssetsApprepost: TFDQuery;
    QryFixedAssetsApprepostINVOICE_NO: TStringField;
    QryFixedAssetsApprepostITEMNO: TStringField;
    QryFixedAssetsApprepostPO_DETAIL_ID: TBCDField;
    QryFixedAssetsApprepostASSET_NO: TStringField;
    QryFixedAssetsApprepostDESCRIP: TStringField;
    QryFixedAssetsApprepostSERIAL_NUMBER: TStringField;
    QryFixedAssetsApprepostIN_SERVICE_DATE: TDateTimeField;
    QryFixedAssetsApprepostFA_MAIN_ID: TBCDField;
    SrcFixedAssetsAPInvoice: TDataSource;
    QryFixedAssetsAPInvoice: TFDQuery;
    QryFixedAssetsAPInvoiceINVOICE_NO: TStringField;
    QryFixedAssetsAPInvoiceAP_ITEMNO: TStringField;
    QryFixedAssetsAPInvoiceFA_MAIN_ID: TBCDField;
    QryFixedAssetsAPInvoiceASSET_NO: TStringField;
    QryFixedAssetsAPInvoiceDESCRIP: TStringField;
    QryFixedAssetsAPInvoiceSERIAL_NUMBER: TStringField;
    QryFixedAssetsAPInvoiceIN_SERVICE_DATE: TDateTimeField;
    SrcFixedAssetsOrders: TDataSource;
    QryFixedAssetsOrders: TFDQuery;
    QryFixedAssetsOrdersORDERNO: TStringField;
    QryFixedAssetsOrdersITEMNO: TStringField;
    QryFixedAssetsOrdersFA_MAIN_ID: TBCDField;
    QryFixedAssetsOrdersASSET_NO: TStringField;
    QryFixedAssetsOrdersDESCRIP: TStringField;
    QryFixedAssetsOrdersSERIAL_NUMBER: TStringField;
    QryFixedAssetsOrdersIN_SERVICE_DATE: TDateTimeField;
    SrcFixedAssetsOrderHist: TDataSource;
    QryFixedAssetsOrderHist: TFDQuery;
    QryFixedAssetsOrderHistORDERNO: TStringField;
    QryFixedAssetsOrderHistITEMNO: TStringField;
    QryFixedAssetsOrderHistFA_MAIN_ID: TBCDField;
    QryFixedAssetsOrderHistASSET_NO: TStringField;
    QryFixedAssetsOrderHistDESCRIP: TStringField;
    QryFixedAssetsOrderHistSERIAL_NUMBER: TStringField;
    QryFixedAssetsOrderHistIN_SERVICE_DATE: TDateTimeField;
    SrcFixedAssetsPO: TDataSource;
    QryFixedAssetsPO: TFDQuery;
    QryFixedAssetsPOPONO: TStringField;
    QryFixedAssetsPOITEMNO: TStringField;
    QryFixedAssetsPOPO_DETAIL_ID: TBCDField;
    QryFixedAssetsPOFA_MAIN_ID: TBCDField;
    QryFixedAssetsPOASSET_NO: TStringField;
    QryFixedAssetsPODESCRIP: TStringField;
    QryFixedAssetsPOSERIAL_NUMBER: TStringField;
    QryFixedAssetsPOIN_SERVICE_DATE: TDateTimeField;
    SrcFixedAssetsPOHist: TDataSource;
    QryFixedAssetsPOHist: TFDQuery;
    QryFixedAssetsPOHistPONO: TStringField;
    QryFixedAssetsPOHistITEMNO: TStringField;
    QryFixedAssetsPOHistFA_MAIN_ID: TBCDField;
    QryFixedAssetsPOHistASSET_NO: TStringField;
    QryFixedAssetsPOHistDESCRIP: TStringField;
    QryFixedAssetsPOHistSERIAL_NUMBER: TStringField;
    QryFixedAssetsPOHistIN_SERVICE_DATE: TDateTimeField;
    SrcFixedAssetsGL: TDataSource;
    QryFixedAssetsGL: TFDQuery;
    QryFixedAssetsGLDESCRIP: TStringField;
    QryFixedAssetsGLDEBIT_CREDIT: TFMTBCDField;
    QryFixedAssetsGLASSET_NO: TStringField;
    QryFixedAssetsGLSERIAL_NUMBER: TStringField;
    QryFixedAssetsGLIN_SERVICE_DATE: TDateTimeField;
    QryFixedAssetsGLGJ_DESCRIP: TStringField;
    QryFixedAssetsGLFA_MAIN_ID: TBCDField;
    SrcFixedAssetsGJ: TDataSource;
    QryFixedAssetsGJ: TFDQuery;
    QryFixedAssetsGJDESCRIP: TStringField;
    QryFixedAssetsGJDEBIT_CREDIT: TFMTBCDField;
    QryFixedAssetsGJASSET_NO: TStringField;
    QryFixedAssetsGJSERIAL_NUMBER: TStringField;
    QryFixedAssetsGJIN_SERVICE_DATE: TDateTimeField;
    QryFixedAssetsGJGJ_DESCRIP: TStringField;
    QryFixedAssetsGJFA_MAIN_ID: TBCDField;
    SrcJobShopArprepost: TDataSource;
    QryJobShopArprepost: TFDQuery;
    QryJobShopArprepostJOBSHOP_TASK_ID: TBCDField;
    QryJobShopArprepostMFGNO: TStringField;
    QryJobShopArprepostROUTE_SEQ: TBCDField;
    QryJobShopArprepostMFG_TYPE: TStringField;
    QryJobShopArprepostSTANDARD_ID: TBCDField;
    QryJobShopArprepostARINVT_ID: TBCDField;
    QryJobShopArprepostSph: TBCDField;
    QryJobShopArprepostSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopArprepostOPNO: TStringField;
    QryJobShopArprepostOPDESC: TStringField;
    QryJobShopArprepostINVOICE_NO: TStringField;
    QryJobShopArprepostITEMNO: TStringField;
    QryJobShopArprepostPROJECTNO: TStringField;
    JumpToJobShopProject1: TAction;
    JumpToBOM1: TAction;
    JumpToInventory1: TAction;
    SrcJobShopARInvoice: TDataSource;
    QryJobShopARInvoice: TFDQuery;
    QryJobShopARInvoiceJOBSHOP_TASK_ID: TBCDField;
    QryJobShopARInvoiceMFGNO: TStringField;
    QryJobShopARInvoiceROUTE_SEQ: TBCDField;
    QryJobShopARInvoiceMFG_TYPE: TStringField;
    QryJobShopARInvoiceSTANDARD_ID: TBCDField;
    QryJobShopARInvoiceARINVT_ID: TBCDField;
    QryJobShopARInvoiceSph: TBCDField;
    QryJobShopARInvoiceSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopARInvoiceOPNO: TStringField;
    QryJobShopARInvoiceOPDESC: TStringField;
    QryJobShopARInvoiceINVOICE_NO: TStringField;
    QryJobShopARInvoiceITEMNO: TStringField;
    QryJobShopARInvoicePROJECTNO: TStringField;
    SrcJobShopApprepost: TDataSource;
    QryJobShopApprepost: TFDQuery;
    QryJobShopApprepostJOBSHOP_TASK_ID: TBCDField;
    QryJobShopApprepostMFGNO: TStringField;
    QryJobShopApprepostROUTE_SEQ: TBCDField;
    QryJobShopApprepostMFG_TYPE: TStringField;
    QryJobShopApprepostSTANDARD_ID: TBCDField;
    QryJobShopApprepostARINVT_ID: TBCDField;
    QryJobShopApprepostSph: TBCDField;
    QryJobShopApprepostSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopApprepostOPNO: TStringField;
    QryJobShopApprepostOPDESC: TStringField;
    QryJobShopApprepostINVOICE_NO: TStringField;
    QryJobShopApprepostITEMNO: TStringField;
    QryJobShopApprepostPROJECTNO: TStringField;
    SrcJobShopAPInvoice: TDataSource;
    QryJobShopAPInvoice: TFDQuery;
    QryJobShopAPInvoiceJOBSHOP_TASK_ID: TBCDField;
    QryJobShopAPInvoiceMFGNO: TStringField;
    QryJobShopAPInvoiceROUTE_SEQ: TBCDField;
    QryJobShopAPInvoiceMFG_TYPE: TStringField;
    QryJobShopAPInvoiceSTANDARD_ID: TBCDField;
    QryJobShopAPInvoiceARINVT_ID: TBCDField;
    QryJobShopAPInvoiceSph: TBCDField;
    QryJobShopAPInvoiceSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopAPInvoiceOPNO: TStringField;
    QryJobShopAPInvoiceOPDESC: TStringField;
    QryJobShopAPInvoiceINVOICE_NO: TStringField;
    QryJobShopAPInvoiceITEMNO: TStringField;
    QryJobShopAPInvoicePROJECTNO: TStringField;
    SrcJobShopOrders: TDataSource;
    QryJobShopOrders: TFDQuery;
    QryJobShopOrdersJOBSHOP_TASK_ID: TBCDField;
    QryJobShopOrdersMFGNO: TStringField;
    QryJobShopOrdersROUTE_SEQ: TBCDField;
    QryJobShopOrdersMFG_TYPE: TStringField;
    QryJobShopOrdersSTANDARD_ID: TBCDField;
    QryJobShopOrdersARINVT_ID: TBCDField;
    QryJobShopOrdersORDERNO: TStringField;
    QryJobShopOrdersITEMNO: TStringField;
    QryJobShopOrdersSph: TBCDField;
    QryJobShopOrdersSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopOrdersOPNO: TStringField;
    QryJobShopOrdersOPDESC: TStringField;
    QryJobShopOrdersPROJECTNO: TStringField;
    SrcJobShopOrderHist: TDataSource;
    QryJobShopOrderHist: TFDQuery;
    QryJobShopOrderHistJOBSHOP_TASK_ID: TBCDField;
    QryJobShopOrderHistMFGNO: TStringField;
    QryJobShopOrderHistROUTE_SEQ: TBCDField;
    QryJobShopOrderHistMFG_TYPE: TStringField;
    QryJobShopOrderHistSTANDARD_ID: TBCDField;
    QryJobShopOrderHistARINVT_ID: TBCDField;
    QryJobShopOrderHistSph: TBCDField;
    QryJobShopOrderHistSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopOrderHistOPNO: TStringField;
    QryJobShopOrderHistOPDESC: TStringField;
    QryJobShopOrderHistORDERNO: TStringField;
    QryJobShopOrderHistITEMNO: TStringField;
    QryJobShopOrderHistPROJECTNO: TStringField;
    SrcJobShopPO: TDataSource;
    QryJobShopPO: TFDQuery;
    QryJobShopPOJOBSHOP_TASK_ID: TBCDField;
    QryJobShopPOMFGNO: TStringField;
    QryJobShopPOROUTE_SEQ: TBCDField;
    QryJobShopPOMFG_TYPE: TStringField;
    QryJobShopPOSTANDARD_ID: TBCDField;
    QryJobShopPOARINVT_ID: TBCDField;
    QryJobShopPOSph: TBCDField;
    QryJobShopPOPONO: TStringField;
    QryJobShopPOITEMNO: TStringField;
    QryJobShopPOPROJECTNO: TStringField;
    QryJobShopPOSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopPOOPNO: TStringField;
    QryJobShopPOOPDESC: TStringField;
    SrcJobShopPOHist: TDataSource;
    QryJobShopPOHist: TFDQuery;
    QryJobShopPOHistJOBSHOP_TASK_ID: TBCDField;
    QryJobShopPOHistMFGNO: TStringField;
    QryJobShopPOHistROUTE_SEQ: TBCDField;
    QryJobShopPOHistMFG_TYPE: TStringField;
    QryJobShopPOHistSTANDARD_ID: TBCDField;
    QryJobShopPOHistARINVT_ID: TBCDField;
    QryJobShopPOHistSph: TBCDField;
    QryJobShopPOHistSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopPOHistOPNO: TStringField;
    QryJobShopPOHistOPDESC: TStringField;
    QryJobShopPOHistPONO: TStringField;
    QryJobShopPOHistITEMNO: TStringField;
    QryJobShopPOHistPROJECTNO: TStringField;
    SrcJobShopGL: TDataSource;
    QryJobShopGL: TFDQuery;
    QryJobShopGLJOBSHOP_TASK_ID: TBCDField;
    QryJobShopGLMFGNO: TStringField;
    QryJobShopGLROUTE_SEQ: TBCDField;
    QryJobShopGLMFG_TYPE: TStringField;
    QryJobShopGLSTANDARD_ID: TBCDField;
    QryJobShopGLARINVT_ID: TBCDField;
    QryJobShopGLSph: TBCDField;
    QryJobShopGLSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopGLOPNO: TStringField;
    QryJobShopGLOPDESC: TStringField;
    QryJobShopGLDESCRIP: TStringField;
    QryJobShopGLACCT: TStringField;
    SrcJobShopGJ: TDataSource;
    QryJobShopGJ: TFDQuery;
    QryJobShopGJJOBSHOP_TASK_ID: TBCDField;
    QryJobShopGJMFGNO: TStringField;
    QryJobShopGJROUTE_SEQ: TBCDField;
    QryJobShopGJMFG_TYPE: TStringField;
    QryJobShopGJSTANDARD_ID: TBCDField;
    QryJobShopGJARINVT_ID: TBCDField;
    QryJobShopGJSph: TBCDField;
    QryJobShopGJSNDOP_DISPATCH_ID: TBCDField;
    QryJobShopGJOPNO: TStringField;
    QryJobShopGJOPDESC: TStringField;
    QryJobShopGJDESCRIP: TStringField;
    QryJobShopGJACCT: TStringField;
    SrcMROArprepost: TDataSource;
    QryMROArprepost: TFDQuery;
    QryMROArprepostID: TBCDField;
    QryMROArprepostINVOICE_NO: TStringField;
    QryMROArprepostITEMNO: TStringField;
    QryMROArprepostWORK_ORDER_NO: TBCDField;
    QryMROArprepostWO_DATE: TDateTimeField;
    QryMROArprepostTASKNO: TStringField;
    QryMROArprepostEQNO: TStringField;
    QryMROArprepostPMEQMT_ID: TBCDField;
    SrcMROARInvoice: TDataSource;
    QryMROARInvoice: TFDQuery;
    QryMROARInvoiceID: TBCDField;
    QryMROARInvoiceINVOICE_NO: TStringField;
    QryMROARInvoiceARINVT_ITEMNO: TStringField;
    QryMROARInvoiceWORK_ORDER_NO: TBCDField;
    QryMROARInvoiceWO_DATE: TDateTimeField;
    QryMROARInvoiceTASKNO: TStringField;
    QryMROARInvoiceEQNO: TStringField;
    QryMROARInvoicePMEQMT_ID: TBCDField;
    SrcMROApprepost: TDataSource;
    QryMROApprepost: TFDQuery;
    QryMROApprepostINVOICE_NO: TStringField;
    QryMROApprepostWORK_ORDER_NO: TBCDField;
    QryMROApprepostINVOICE_ITEMNO: TStringField;
    QryMROApprepostTASKNO: TStringField;
    QryMROApprepostEQNO: TStringField;
    QryMROApprepostPMEQMT_ID: TBCDField;
    QryMROApprepostPO_DETAIL_ID: TBCDField;
    QryMROApprepostWO_DATE: TDateTimeField;
    SrcMROAPInvoice: TDataSource;
    QryMROAPInvoice: TFDQuery;
    QryMROAPInvoiceINVOICE_NO: TStringField;
    QryMROAPInvoiceWORK_ORDER_NO: TBCDField;
    QryMROAPInvoiceAP_ITEMNO: TStringField;
    QryMROAPInvoiceTASKNO: TStringField;
    QryMROAPInvoiceEQNO: TStringField;
    QryMROAPInvoicePMEQMT_ID: TBCDField;
    QryMROAPInvoiceWO_DATE: TDateTimeField;
    SrcMROOrders: TDataSource;
    QryMROOrders: TFDQuery;
    QryMROOrdersORDERNO: TStringField;
    QryMROOrdersWORK_ORDER_NO: TBCDField;
    QryMROOrdersOE_ITEMNO: TStringField;
    QryMROOrdersTASKNO: TStringField;
    QryMROOrdersEQNO: TStringField;
    QryMROOrdersPMEQMT_ID: TBCDField;
    QryMROOrdersWO_DATE: TDateTimeField;
    SrcMROOrderHist: TDataSource;
    QryMROOrderHist: TFDQuery;
    QryMROOrderHistORDERNO: TStringField;
    QryMROOrderHistWORK_ORDER_NO: TBCDField;
    QryMROOrderHistOE_ITEMNO: TStringField;
    QryMROOrderHistTASKNO: TStringField;
    QryMROOrderHistEQNO: TStringField;
    QryMROOrderHistPMEQMT_ID: TBCDField;
    QryMROOrderHistWO_DATE: TDateTimeField;
    SrcMROPO: TDataSource;
    QryMROPO: TFDQuery;
    QryMROPOID: TBCDField;
    QryMROPOPONO: TStringField;
    QryMROPOWORK_ORDER_NO: TBCDField;
    QryMROPOITEMNO: TStringField;
    QryMROPOWO_DATE: TDateTimeField;
    QryMROPOTASKNO: TStringField;
    QryMROPOEQNO: TStringField;
    QryMROPOPMEQMT_ID: TBCDField;
    SrcMROPOHist: TDataSource;
    QryMROPOHist: TFDQuery;
    QryMROPOHistID: TBCDField;
    QryMROPOHistPONO: TStringField;
    QryMROPOHistITEMNO: TStringField;
    QryMROPOHistWORK_ORDER_NO: TBCDField;
    QryMROPOHistWO_DATE: TDateTimeField;
    QryMROPOHistTASKNO: TStringField;
    QryMROPOHistEQNO: TStringField;
    QryMROPOHistPMEQMT_ID: TBCDField;
    SrcMROGL: TDataSource;
    QryMROGL: TFDQuery;
    QryMROGLGJ_DESCRIP: TStringField;
    QryMROGLDEBIT_CREDIT: TFMTBCDField;
    QryMROGLWORK_ORDER_NO: TBCDField;
    QryMROGLTASKNO: TStringField;
    QryMROGLEQNO: TStringField;
    QryMROGLPMEQMT_ID: TBCDField;
    QryMROGLWO_DATE: TDateTimeField;
    SrcMROGJ: TDataSource;
    QryMROGJ: TFDQuery;
    QryMROGJGJ_DESCRIP: TStringField;
    QryMROGJDEBIT_CREDIT: TFMTBCDField;
    QryMROGJWORK_ORDER_NO: TBCDField;
    QryMROGJTASKNO: TStringField;
    QryMROGJEQNO: TStringField;
    QryMROGJPMEQMT_ID: TBCDField;
    QryMROGJWO_DATE: TDateTimeField;
    QryProjectAPInvoicePROJECT: TStringField;
    QryProjectAPInvoiceITEM_DESCRIP: TStringField;
    QryProjectApprepostRFQ: TStringField;
    QryProjectApprepostPROJECT: TStringField;
    QryProjectPORFQ: TStringField;
    QryProjectPOPROJECT: TStringField;
    QryProjectPOHistRFQ: TStringField;
    QryProjectPOHistPROJECT: TStringField;
    QryProjectPOHistITEM_DESCRIP: TStringField;
    QryProjectGLGJ_DESCRIP: TStringField;
    JobShopAppDef1: TIQWebAppDef;
    { TODO -oathite -cWebConvert : TGridDrawState alternative is not present
    procedure PkJobShopIQDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState); }
    procedure AssignQueryParams(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure JumpToProjectManager1Execute(Sender: TObject);
    procedure JumpToMRO1Execute(Sender: TObject);
    procedure JumpToMROWorkOrder1Execute(Sender: TObject);
    procedure JumpToFixedAssets1Execute(Sender: TObject);
    procedure JumpToJobShopProject1Execute(Sender: TObject);
    procedure JumpToBOM1Execute(Sender: TObject);
    procedure JumpToInventory1Execute(Sender: TObject);
    procedure JobShopCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FCostObjectSource: string;
    FCostObjectID: Int64;
    FCostSourceMenuType: TCostSourceMenuType;
    FCostSourceOwnerType: TCostSourceOwnerType;

    // Get datasource used for summary form
    function GetSummaryDataSource_Project(
      const ACostSourceOwnerType: TCostSourceOwnerType;
      const ACostSourceMenuType: TCostSourceMenuType)
      : TDataSource;
    function GetSummaryDataSource_MRO(
      const ACostSourceOwnerType: TCostSourceOwnerType)
      : TDataSource;
    function GetSummaryDataSource_JobShop(
      const ACostSourceOwnerType: TCostSourceOwnerType)
      : TDataSource;
    function GetSummaryDataSource_FixedAssets(
      const ACostSourceOwnerType: TCostSourceOwnerType)
      : TDataSource;

    procedure CreateJumpMenus(
      const ACostSourceOwnerType: TCostSourceOwnerType;
      const ACostSourceMenuType: TCostSourceMenuType;
      var AJumps: TList<TAction>);
    procedure ExecuteJump(const AJumpID: Integer; const ARecordID: Int64);
    function GetSummaryDataSource: TDataSource;
    function GetSummaryDataSet: TDataSet;
  public
    { Public declarations }
    class function PromptCostSource(
      ACostSourceMenuType: TCostSourceMenuType;
      var AValue: Int64): Boolean;

    class procedure ShowSummary(
      ACostSourceOwnerType: TCostSourceOwnerType;
      ACostSourceMenuType: TCostSourceMenuType;
      ACostObjectID: Int64);

    class function IsDataSetReadOnly(const ADataSet: TDataSet): Boolean;

    procedure AssignJobshop2Visible(APk: TIQWebHPick);

    function SelectProject(var AValue: Int64): Boolean;
    function SelectProjectTask(var AValue: Int64): Boolean;
    function SelectMRO(var AValue: Int64): Boolean;
    function SelectJobShop(var AValue: Int64): Boolean;
    function SelectJobShopItem(var AValue: Int64): Boolean;
    function SelectFixedAssets(var AValue: Int64): Boolean;

    // The following are assigned by the class methods.
    property CostSourceMenuType: TCostSourceMenuType read FCostSourceMenuType
      write FCostSourceMenuType;
    property CostSourceOwnerType: TCostSourceOwnerType read FCostSourceOwnerType
      write FCostSourceOwnerType;
    property CostObjectSource: string read FCostObjectSource write FCostObjectSource;
    property CostObjectID: Int64 read FCostObjectID write FCostObjectID;
  end;

implementation

{$R *.DFM}

{ TCS_DM }

uses
  _FrmCostSourceSummary,
  IQMS.Common.DataLib,
  IQMS.WebVcl.Jump,
  IQMS.Common.Miscellaneous,
  IQMS.Common.JumpConstants,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

procedure TCostSourceDataModule.DataModuleCreate(Sender: TObject);
begin
  // Initialize
  FCostSourceMenuType := TCostSourceMenuType(0);
  FCostSourceOwnerType := TCostSourceOwnerType(0);
  FCostObjectSource := '';
  FCostObjectID := 0;
end;

{$REGION 'Class methods'}


class function TCostSourceDataModule.PromptCostSource(
  ACostSourceMenuType: TCostSourceMenuType; var AValue: Int64): Boolean;
begin
  with Self.Create(nil) do
    try
      CostSourceMenuType := ACostSourceMenuType;
      case ACostSourceMenuType of
        ProjectManagerProject:
          Result := SelectProject(AValue);
        ProjectManagerTask:
          Result := SelectProjectTask(AValue);
        MRO:
          Result := SelectMRO(AValue);
        JobShop:
          Result := SelectJobShop(AValue);
        FixedAssets:
          Result := SelectFixedAssets(AValue);
      end;
    finally
      Free;
    end;
end;

class procedure TCostSourceDataModule.ShowSummary(
  ACostSourceOwnerType: TCostSourceOwnerType;
  ACostSourceMenuType: TCostSourceMenuType;
  ACostObjectID: Int64);
var
  AJumps: TList<TAction>;
begin
  // DEVELOPER NOTE This is where the "Summary" datasets are used.
  // 1.) Add a new dataset to this Datamodule.
  // 2.) Assign it to the ADataSource variable below.

  with Self.Create(nil) do
    try
      // Assign property values (required)
      CostSourceMenuType := ACostSourceMenuType;
      CostSourceOwnerType := ACostSourceOwnerType;

      // Assign values for filtering (required)
      CostObjectSource := CostSourceString[ACostSourceMenuType];
      CostObjectID := ACostObjectID;

      AJumps := TList<TAction>.Create;
      try
        CreateJumpMenus(CostSourceOwnerType, ACostSourceMenuType, AJumps);
        TFrmCostSourceSummary.DoShowModal(
          GetSummaryDataSource,
          AJumps,
          ACostSourceMenuType);

//        _FrmCostSourceSummary.DoShowModal(
//          GetSummaryDataSource,
//          AJumps,
//          ACostSourceMenuType);
      finally
        AJumps.Free;
      end;
    finally
      Free;
    end;
end;

function TCostSourceDataModule.GetSummaryDataSet: TDataSet;
var
  ADataSource: TDataSource;
begin
  Result := nil;
  ADataSource := GetSummaryDataSource;
  if Assigned(ADataSource) then
    Result := ADataSource.DataSet;
end;

function TCostSourceDataModule.GetSummaryDataSource: TDataSource;
begin
  Result := nil;
  case CostSourceMenuType of
    ProjectManagerProject, ProjectManagerTask:
      Result := GetSummaryDataSource_Project(CostSourceOwnerType, CostSourceMenuType);
    MRO:
      Result := GetSummaryDataSource_MRO(CostSourceOwnerType);
    JobShop:
      Result := GetSummaryDataSource_JobShop(CostSourceOwnerType);
    FixedAssets:
      Result := GetSummaryDataSource_FixedAssets(CostSourceOwnerType);
  end;
end;

function TCostSourceDataModule.GetSummaryDataSource_Project(const ACostSourceOwnerType
  : TCostSourceOwnerType; const ACostSourceMenuType: TCostSourceMenuType): TDataSource;
begin
  // This method returns the appropriate datasource for the given
  // parameters.
  Result := nil;
  case ACostSourceOwnerType of
    AccountsReceivable:
      begin
        case ACostSourceMenuType of
          ProjectManagerProject:
            Result := SrcProjectArprepost;
          ProjectManagerTask:
            Result := SrcProjectTaskArprepost;
        end;
      end;
    AccountsReceivableArchived:
      begin
        case ACostSourceMenuType of
          ProjectManagerProject:
            Result := SrcProjectARInvoice;
          ProjectManagerTask:
            Result := SrcProjectTaskARInvoice;
        end;
      end;
    AccountsPayable:
      Result := SrcProjectApprepost;
    AccountsPayableArchived:
      Result := SrcProjectAPInvoice;
    PurchaseOrders:
      Result := SrcProjectPO;
    PurchaseOrderArchived:
      Result := SrcProjectPOHist;
    SalesOrders:
      Result := SrcProjectOrders;
    SalesOrderHistory:
      Result := SrcProjectTaskOrders;
    GeneralLedger:
      Result := SrcProjectGL;
    GeneralJournal:
      Result := SrcProjectGJ;
  end;
end;

class function TCostSourceDataModule.IsDataSetReadOnly(
  const ADataSet: TDataSet): Boolean;
begin
  Result := True;
  if Assigned(ADataSet) then
  begin
    if ADataSet is TFDQuery then
      Result := TFDQuery(ADataSet).UpdateOptions.ReadOnly
    else if ADataSet is TFDTable then
      Result := TFDQuery(ADataSet).UpdateOptions.ReadOnly;
  end;
end;

function TCostSourceDataModule.GetSummaryDataSource_MRO(const ACostSourceOwnerType
  : TCostSourceOwnerType): TDataSource;
begin
  // This method returns the appropriate datasource for the given
  // parameters.
  Result := nil;
  case ACostSourceOwnerType of
    AccountsReceivable:
      Result := SrcMROArprepost;
    AccountsReceivableArchived:
      Result := SrcMROARInvoice;
    AccountsPayable:
      Result := SrcMROApprepost;
    AccountsPayableArchived:
      Result := SrcMROAPInvoice;
    PurchaseOrders:
      Result := SrcMROPO;
    PurchaseOrderArchived:
      Result := SrcMROPOHist;
    SalesOrders:
      Result := SrcMROOrders;
    SalesOrderHistory:
      Result := SrcMROOrderHist;
    GeneralLedger:
      Result := SrcMROGL;
    GeneralJournal:
      Result := SrcMROGJ;
  end;
end;

function TCostSourceDataModule.GetSummaryDataSource_JobShop(const ACostSourceOwnerType
  : TCostSourceOwnerType): TDataSource;
begin
  // This method returns the appropriate datasource for the given
  // parameters.
  Result := nil;
  case ACostSourceOwnerType of
    AccountsReceivable:
      Result := SrcJobShopArprepost;
    AccountsReceivableArchived:
      Result := SrcJobShopARInvoice;
    AccountsPayable:
      Result := SrcJobShopApprepost;
    AccountsPayableArchived:
      Result := SrcJobShopAPInvoice;
    PurchaseOrders:
      Result := SrcJobShopPO;
    PurchaseOrderArchived:
      Result := SrcJobShopPOHist;
    SalesOrders:
      Result := SrcJobShopOrders;
    SalesOrderHistory:
      Result := SrcJobShopOrderHist;
    GeneralLedger:
      Result := SrcJobShopGL;
    GeneralJournal:
      Result := SrcJobShopGJ;
  end;
end;

function TCostSourceDataModule.GetSummaryDataSource_FixedAssets(const ACostSourceOwnerType
  : TCostSourceOwnerType): TDataSource;
begin
  // This method returns the appropriate datasource for the given
  // parameters.
  Result := nil;
  case ACostSourceOwnerType of
    AccountsReceivable:
      Result := SrcFixedAssetsArprepost;
    AccountsReceivableArchived:
      Result := SrcFixedAssetsARInvoice;
    AccountsPayable:
      Result := SrcFixedAssetsApprepost;
    AccountsPayableArchived:
      Result := SrcFixedAssetsAPInvoice;
    PurchaseOrders:
      Result := SrcFixedAssetsPO;
    PurchaseOrderArchived:
      Result := SrcFixedAssetsPOHist;
    SalesOrders:
      Result := SrcFixedAssetsOrders;
    SalesOrderHistory:
      Result := SrcFixedAssetsOrderHist;
    GeneralLedger:
      Result := SrcFixedAssetsGL;
    GeneralJournal:
      Result := SrcFixedAssetsGJ;
  end;
end;

{$ENDREGION 'Class methods'}

{$REGION 'Pick list methods'}


function TCostSourceDataModule.SelectProject(var AValue: Int64): Boolean;
begin
  AValue := 0;
  with PkProject do
  begin
    Result := Execute;
    if Result then
      AValue := System.Variants.VarAsType(GetValue('TOOL_RFQ_ID'), varUInt64);
  end;
end;

function TCostSourceDataModule.SelectProjectTask(var AValue: Int64): Boolean;
begin
  AValue := 0;
  with PkProjectTask do
  begin
    Result := Execute;
    if Result then
      AValue := System.Variants.VarAsType(GetValue('TOOL_TASK_INFORMATION_ID'), varUInt64);
  end;
end;

function TCostSourceDataModule.SelectMRO(var AValue: Int64): Boolean;
begin
  AValue := 0;
  with PkMROWorkOrder do
  begin
    Result := Execute;
    if Result then
      AValue := System.Variants.VarAsType(GetValue('PMWO_DTL_ID'), varUInt64);
  end;
end;

function TCostSourceDataModule.SelectJobShop(var AValue: Int64): Boolean;
begin
  AValue := 0;
  with PkJobShop do
  begin
    Result := Execute;
    if Result then
      AValue := System.Variants.VarAsType(GetValue('ID'), varUInt64);
  end;
end;

function TCostSourceDataModule.SelectJobShopItem(var AValue: Int64): Boolean;
begin
  AValue := 0;
  with PkJobShopTopItem do
  begin
    Result := Execute;
    if Result then
      AValue := System.Variants.VarAsType(GetValue('ID'), varUInt64);
  end;
end;

function TCostSourceDataModule.SelectFixedAssets(var AValue: Int64): Boolean;
begin
  AValue := 0;
  with PkFixedAssets do
  begin
    Result := Execute;
    if Result then
      AValue := System.Variants.VarAsType(GetValue('ID'), varUInt64);
  end;
end;

{$ENDREGION 'Pick list methods'}

{$REGION 'Jump menu methods'}


procedure TCostSourceDataModule.CreateJumpMenus(
  const ACostSourceOwnerType: TCostSourceOwnerType;
  const ACostSourceMenuType: TCostSourceMenuType;
  var AJumps: TList<TAction>);
var
  AEvent: TNotifyEvent;
begin
  case ACostSourceMenuType of
    TCostSourceMenuType.ProjectManagerProject,
      TCostSourceMenuType.ProjectManagerTask:
      AJumps.Add(JumpToProjectManager1);
    TCostSourceMenuType.MRO:
      begin
        AJumps.Add(JumpToMRO1);
        AJumps.Add(JumpToMROWorkOrder1);
      end;
    TCostSourceMenuType.JobShop:
      begin
        AJumps.Add(JumpToJobShopProject1);
        AJumps.Add(JumpToBOM1);
        AJumps.Add(JumpToInventory1);
      end;
    TCostSourceMenuType.FixedAssets:
      AJumps.Add(JumpToFixedAssets1);
    TCostSourceMenuType.UnassignCostSource:
      ;
  end;
end;

procedure TCostSourceDataModule.ExecuteJump(const AJumpID: Integer;
  const ARecordID: Int64);
begin
  try
    IQMS.WebVcl.Jump.JumpDirect(AJumpID, ARecordID);
  except
    on E: Exception do // in case Cancel was clicked
      if not IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

{$REGION 'Project Jumps'}


procedure TCostSourceDataModule.JumpToFixedAssets1Execute(Sender: TObject);
var
  ADataSet: TDataSet;
begin
  ADataSet := GetSummaryDataSet;
  if Assigned(ADataSet) and (ADataSet.FindField('FA_MAIN_ID') <> nil) then
    ExecuteJump(iq_JumpToAM_FAMaint, ADataSet.FindField('FA_MAIN_ID').AsLargeInt);
end;

procedure TCostSourceDataModule.JobShopCalcFields(DataSet: TDataSet);
begin
  if (DataSet.FindField('Sph') <> nil) and
    (DataSet.FindField('JOBSHOP_TASK_ID') <> nil) and
    (DataSet.FindField('STANDARD_ID') <> nil) and
    (DataSet.FindField('MFG_TYPE') <> nil) then
  begin
    if jobshop2_licensed = 1 then
      DataSet.FieldByName('Sph').AsFloat :=
        SelectValueFmtAsFloat(
        'SELECT appdef_sndop.get_hrs_part_ex_a(ptoper.multiples, '#13 +
        '                                      ptoper.cycletm,   '#13 +
        '                                      ptoper.scrap,     '#13 +
        '                                      sndop.batch_type) '#13 +
        '          AS std_hrs_part                               '#13 +
        '  FROM jobshop_task t,                                  '#13 +
        '       partno p,                                        '#13 +
        '       ptoper ptoper,                                   '#13 +
        '       sndop                                            '#13 +
        ' WHERE t.id = %d AND                                    '#13 +
        '       t.arinvt_id = p.arinvt_id AND                    '#13 +
        '       t.standard_id = p.standard_id AND                '#13 +
        '       p.id = ptoper.partno_id AND                      '#13 +
        '       ptoper.sndop_id = t.sndop_id AND                 '#13 +
        '       t.sndop_id = sndop.id                            ',
        [DataSet.FieldByName('JOBSHOP_TASK_ID').AsLargeInt])
    else
    begin
      JobShopAppDef1.DataSource := DataSet.DataSource;
      DataSet.FieldByName('Sph').AsFloat :=
        JobShopAppDef1.Execute(
        'SPH',
        [DataSet.FieldByName('STANDARD_ID').AsLargeInt,
        DataSet.FieldByName('MFG_TYPE').AsString]).AsFloat;
    end;
  end;
end;

procedure TCostSourceDataModule.JumpToBOM1Execute(Sender: TObject);
var
  ADataSet: TDataSet;
begin
  ADataSet := GetSummaryDataSet;
  if Assigned(ADataSet) and (ADataSet.FindField('STANDARD_ID') <> nil) then
    ExecuteJump(iq_JumpToBOM, ADataSet.FindField('STANDARD_ID').AsLargeInt);
end;

procedure TCostSourceDataModule.JumpToInventory1Execute(Sender: TObject);
var
  ADataSet: TDataSet;
begin
  ADataSet := GetSummaryDataSet;
  if Assigned(ADataSet) and (ADataSet.FindField('ARINVT_ID') <> nil) then
    ExecuteJump(iq_JumpToInv, ADataSet.FindField('ARINVT_ID').AsLargeInt);
end;

procedure TCostSourceDataModule.JumpToJobShopProject1Execute(Sender: TObject);
var
  AJobShop_Rfq_ID: Int64;
  ADataSet: TDataSet;
begin
  ADataSet := GetSummaryDataSet;
  if Assigned(ADataSet) and (ADataSet.FindField('JOBSHOP_TASK_ID') <> nil) then
  begin
    AJobShop_Rfq_ID := SelectValueFmtAsInt64(
      'SELECT jobshop_rfq_id FROM jobshop_task WHERE id = %d',
      [ADataSet.FindField('JOBSHOP_TASK_ID').AsLargeInt]);
    ExecuteJump(iq_JumpToJobShop, AJobShop_Rfq_ID);
  end;
end;

procedure TCostSourceDataModule.JumpToMRO1Execute(Sender: TObject);
var
  ADataSet: TDataSet;
begin
  ADataSet := GetSummaryDataSet;
  if Assigned(ADataSet) and (ADataSet.FindField('PMEQMT_ID') <> nil) then
    ExecuteJump(iq_JumpToPM, ADataSet.FindField('PMEQMT_ID').AsLargeInt);
end;

procedure TCostSourceDataModule.JumpToMROWorkOrder1Execute(Sender: TObject);
var
  ADataSet: TDataSet;
begin
  ADataSet := GetSummaryDataSet;
  if Assigned(ADataSet) and (ADataSet.FindField('WORK_ORDER_NO') <> nil) then
    ExecuteJump(iq_JumpToPMWorkOrder, ADataSet.FindField('WORK_ORDER_NO').AsLargeInt);
end;

procedure TCostSourceDataModule.JumpToProjectManager1Execute(Sender: TObject);
var
  ADataSet: TDataSet;
begin
  ADataSet := GetSummaryDataSet;
  if Assigned(ADataSet) and (ADataSet.FindField('TOOL_RFQ_ID') <> nil) then
    ExecuteJump(iq_JumpToTooling, ADataSet.FindField('TOOL_RFQ_ID').AsLargeInt);
end;

{$ENDREGION 'Project Jumps'}

{$ENDREGION 'Jump menu methods'}


procedure TCostSourceDataModule.AssignQueryParams(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FCostObjectID);
  AssignQueryParamValue(DataSet, 'COST_OBJECT_SOURCE', FCostObjectSource);
end;
{ TODO -oathite -cWebConvert : TGridDrawState alternative is not present
procedure TCostSourceDataModule.PkJobShopIQDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Sender as TUniDBGrid do
  begin
    with DataSource.DataSet do
      if (FieldByName('MAIN_ARINVT_ID').AsLargeInt = FieldByName('TASK_ARINVT_ID').AsLargeInt) and
        (FieldByName('MAIN_STANDARD_ID').AsLargeInt = FieldByName('TASK_STANDARD_ID').AsLargeInt)
      then
        with Canvas do
          Font.Style := Font.Style + [fsBold];

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;  }

procedure TCostSourceDataModule.AssignJobshop2Visible(APk: TIQWebHPick);
var
  AVisible: Boolean;
begin
  AVisible := jobshop2_licensed = 1;
  with APk do
  begin
    FieldByName('opno').Visible := AVisible;
    FieldByName('opdesc').Visible := AVisible;
    FieldByName('sndop_dispatch_id').Visible := AVisible;
  end;
end;

end.
