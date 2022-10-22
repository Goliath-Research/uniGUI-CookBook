unit sd_const;

interface

uses
  System.SysUtils,
  System.Classes,
  shopdata_rscstr,
  MainModule;

type
  { TShopDataScreen }
  TShopDataScreen = (scrnBlank, scrnChild);

  { TShopDataModule }
  TShopDataModule =
    (modBlank, // Blank
    modTimeClock, // 'Time Clock'
    modRealTimeScanToInventory, // 'RT Scan to Inventory'
    modFloorDisposition, // 'Floor Disposition'
    modPalletBuilder, // 'Pallet Builder'
    modRealTimeWorkCenter, // 'RT Work Center'
    modRealTimeMonitor, // 'RT Monitor'
    modRealTimeProcessMonitor, // 'Process Monitor'
    modPlantLayout, // 'Plant Layout'
    modInventoryTransactionsAndLocations,
    // 'Inventory Transactions and Locations'
    modWorkOrderMaterialsComponents, // 'Work Order Materials & Components'
    modKanbanSupermarket, // 'Kanban Supermarket'
    modHeijunka, // 'Heijunka Box Load Leveling'
    modRejects, // 'Rejects'
    modRejectReporting, // 'Reject Reporting'
    modDowntime, // 'Downtime'
    modInternalDocuments, // 'Internal Documents'
    modExternalDocuments, // 'External Documents'
    modPrintRealTimeLabel, // 'Print RealTime Labels'
    modPrintSalesOrderLabel, // 'Print Sales Order Labels'
    modPrintInventoryLabel, // 'Print Inventory Labels'
    modSerialNumberTracking, // 'Serial # Tracking'
    modSPCQuickInspection, // 'Quick Inspection'
    modSPCQuickInspectionWorkCenter, // 'Quick Inspection'
    modMRO, // 'MRO Work Order'
    modConfigurShopdata, // 'Submit an Announcement'
    modPopupFormTimer, // 'Popup Form Timer Interval Setup'
    modDialogCheckboxSetup, // 'Configure ShopData'
    modSecurityInspector, // 'Dialog Check Boxes'
    modLogin, // 'Login'
    modLoginToEPlant, // 'Login into Enterprise Plant'
    modSubmitAnnouncement, // 'Security Inspector'
    modHelpContents, // 'Help Contents'
    modHelpKnowledgeCenter, // 'Knowledge Center'
    modHelpWiki, // 'Wiki/SOP'
    modHelpAbout, // 'About',
    modWhoIsLoggedIn, // 'Who is Logged In'
    modPRW // Report Production By Work Order
    );

type
  TShopDataDispoInfo = class(TObject)
  strict private
    { Private declarations }
    FARINVT_ID: Int64;
    FLOTNO: string;
    FMasterLabelList: TStringList;
    FQuantity: Real;
    FWORK_ORDER_ID: Int64;
    FSTANDARD_ID: Int64;
    FWORK_CENTER_ID: Int64;
  public
    { Public declarations }
    constructor Create; reintroduce;
    destructor Destroy; override;
    property Quantity: Real read FQuantity write FQuantity;
    property WORK_ORDER_ID: Int64 read FWORK_ORDER_ID write FWORK_ORDER_ID;
    property ARINVT_ID: Int64 read FARINVT_ID write FARINVT_ID;
    property LOTNO: string read FLOTNO write FLOTNO;
    property MasterLabelList: TStringList read FMasterLabelList
      write FMasterLabelList;
    property STANDARD_ID: Int64 read FSTANDARD_ID write FSTANDARD_ID;
    property WORK_CENTER_ID: Int64 read FWORK_CENTER_ID write FWORK_CENTER_ID;
  end;

const
  // Caption text associated with each screen
  ShopDataModuleCaption: array [TShopDataModule] of string =
    ('', // Blank
    shopdata_rscstr.cTXT0000131, // 'Time Clock'
    shopdata_rscstr.cTXT0000132, // 'RT Scan to Inventory'
    shopdata_rscstr.cTXT0000133, // 'Floor Disposition'
    shopdata_rscstr.cTXT0000134, // 'Pallet Builder'
    shopdata_rscstr.cTXT0000135, // 'RT Work Center'
    shopdata_rscstr.cTXT0000136, // 'RT Monitor'
    shopdata_rscstr.cTXT0000137, // 'Process Monitor'
    shopdata_rscstr.cTXT0000138, // 'Plant Layout'
    shopdata_rscstr.cTXT0000139, // 'Inventory Transactions and Locations'
    shopdata_rscstr.cTXT0000140, // 'Work Order Materials & Components'
    shopdata_rscstr.cTXT0000141, // 'Kanban Supermarket'
    shopdata_rscstr.cTXT0000142, // 'Heijunka Box Load Leveling'
    shopdata_rscstr.cTXT0000143, // 'Rejects'
    shopdata_rscstr.cTXT0000144, // 'Reject Reporting'
    shopdata_rscstr.cTXT0000145, // 'Downtime'
    shopdata_rscstr.cTXT0000146, // 'Internal Documents'
    shopdata_rscstr.cTXT0000147, // 'External Documents'
    shopdata_rscstr.cTXT0000148, // 'Print RealTime Labels'
    shopdata_rscstr.cTXT0000149, // 'Print Sales Order Labels'
    shopdata_rscstr.cTXT0000150, // 'Print Inventory Labels'
    shopdata_rscstr.cTXT0000151, // 'Serial # Tracking'
    shopdata_rscstr.cTXT0000152, // 'Quick Inspection'
    shopdata_rscstr.cTXT0000152, // 'Quick Inspection'
    shopdata_rscstr.cTXT0000153, // 'MRO Work Order'
    shopdata_rscstr.cTXT0000154, // 'Submit an Announcement'
    shopdata_rscstr.cTXT0000155, // 'Popup Form Timer Interval Setup'
    shopdata_rscstr.cTXT0000156, // 'Configure ShopData'
    shopdata_rscstr.cTXT0000157, // 'Dialog Check Boxes'
    shopdata_rscstr.cTXT0000158, // 'Login'
    shopdata_rscstr.cTXT0000159, // 'Login into Enterprise Plant'
    shopdata_rscstr.cTXT0000160, // 'Security Inspector'
    shopdata_rscstr.cTXT0000161, // 'Help Contents'
    shopdata_rscstr.cTXT0000162, // 'Knowledge Center'
    shopdata_rscstr.cTXT0000163, // 'Wiki/SOP'
    shopdata_rscstr.cTXT0000164, // 'About'
    shopdata_rscstr.cTXT0000165, // 'Who is Logged In'
    shopdata_rscstr.cTXT0000167 // 'Report Production By Work Order'
    );

  // Main ShopData modules
  ShopDataMainModules =
    [modBlank, // Blank
     modTimeClock, // 'Time Clock'
     modRealTimeScanToInventory, // 'RT Scan to Inventory'
     modFloorDisposition, // 'Floor Disposition'
     modPalletBuilder, // 'Pallet Builder'
     modRealTimeWorkCenter, // 'RT Work Center'
     modRealTimeMonitor, // 'RT Monitor'
     modRealTimeProcessMonitor, // 'Process Monitor'
     modPlantLayout, // 'Plant Layout'
     modInventoryTransactionsAndLocations, // 'Inventory Transactions and Locations'
     modWorkOrderMaterialsComponents, // 'Work Order Materials & Components'
     modKanbanSupermarket, // 'Kanban Supermarket'
     modHeijunka, // 'Heijunka Box Load Leveling'
     modRejects, // 'Rejects'
     modRejectReporting, // 'Reject Reporting'
     modDowntime, // 'Downtime'
     modInternalDocuments, // 'Internal Documents'
     modExternalDocuments, // 'External Documents'
     modPrintRealTimeLabel, // 'Print RealTime Labels'
     modPrintSalesOrderLabel, // 'Print Sales Order Labels'
     modPrintInventoryLabel, // 'Print Inventory Labels'
     modSerialNumberTracking, // 'Serial # Tracking'
     modSPCQuickInspection, // 'Quick Inspection'
     modSPCQuickInspectionWorkCenter, // 'Quick Inspection'
     modMRO, // 'MRO Work Order'
     modPRW // Report Production By Work Order
    ];

  // ShopData modules that are embedded child screens
  // ShopDataChildForms: array [0 .. 23] of TShopDataModule =
  ShopDataChildForms =
    [modBlank, // Blank
  modTimeClock, // 'Time Clock'
  modRealTimeScanToInventory, // 'RT Scan to Inventory'
  modFloorDisposition, // 'Floor Disposition'
  modPalletBuilder, // 'Pallet Builder'
  modRealTimeWorkCenter, // 'RT Work Center'
  modRealTimeMonitor, // 'RT Monitor'
  modRealTimeProcessMonitor, // 'Process Monitor'
  modPlantLayout, // 'Plant Layout'
  modInventoryTransactionsAndLocations,
  // 'Inventory Transactions and Locations'
  modWorkOrderMaterialsComponents, // 'Work Order Materials & Components'
  modKanbanSupermarket, // 'Kanban Supermarket'
  modHeijunka, // 'Heijunka Box Load Leveling'
  modRejects, // 'Rejects'
  // Excluded:  modRejectReporting, // 'Reject Reporting'
  modDowntime, // 'Downtime'
  modInternalDocuments, // 'Internal Documents'
  modExternalDocuments, // 'External Documents'
  modPrintRealTimeLabel, // 'Print RealTime Labels'
  modPrintSalesOrderLabel, // 'Print Sales Order Labels'
  modPrintInventoryLabel, // 'Print Inventory Labels'
  modSerialNumberTracking, // 'Serial # Tracking'
  modSPCQuickInspection, // 'Quick Inspection'
  modSPCQuickInspectionWorkCenter, // 'Quick Inspection'
  modMRO, // 'MRO Work Order'
  modPRW // Report Production By Work Order
    ];

const
  // Notifications
  NOTIFY_CREATE_CHILD = 1;
  NOTIFY_SHOW_LAST_MODULE = 2;
  NOTIFY_APPLY_SETTINGS = 3;

function IntToShopDataModule(Value: Integer): TShopDataModule;

implementation

function IntToShopDataModule(Value: Integer): TShopDataModule;
begin
  Result := TShopDataModule(0);
  if (Value >= 0) and (Value <= Ord(High(TShopDataModule))) then
    Result := TShopDataModule(Value);
end;

{ TShopDataDispoInfo }

constructor TShopDataDispoInfo.Create;
begin
  inherited Create;
  FARINVT_ID := 0;
  FLOTNO := '';
  FQuantity := 0;
  FWORK_ORDER_ID := 0;
  FSTANDARD_ID := 0;
  FWORK_CENTER_ID := 0;
  FMasterLabelList := TStringList.Create;
end;

destructor TShopDataDispoInfo.Destroy;
begin
  if Assigned(FMasterLabelList) then
    FreeAndNil(FMasterLabelList);
  inherited Destroy;
end;

end.
