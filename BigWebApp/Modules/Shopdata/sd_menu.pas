unit sd_menu;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  tchscrn_menu_base,
  Vcl.Buttons,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniLabel, IQMS.WebVcl.SecurityRegister, Vcl.Menus, uniMainMenu,
  uniPageControl, Vcl.Controls, Vcl.Forms;

type
  { TFrmShopDataMenu }
  TFrmShopDataMenu = class(TFrmTouchScreenMenuBase)
    TabSheet2: TUniTabSheet;
    sbtnRTScanToInventory: TUniSpeedButton;
    sbtnFloorDisposition: TUniSpeedButton;
    sbtnPalletBuilder: TUniSpeedButton;
    sbtnRTMonitorWorkCenterView: TUniSpeedButton;
    sbtnRTMonitorGridView: TUniSpeedButton;
    sbtnRTProcessMonitor: TUniSpeedButton;
    sbtnPlantLayout: TUniSpeedButton;
    sbtnInventoryTransactionsandLocations: TUniSpeedButton;
    sbtnWorkorderMaterials: TUniSpeedButton;
    sbtnKanbanSupermarket: TUniSpeedButton;
    sbtnHeijunka: TUniSpeedButton;
    sbtnRejects: TUniSpeedButton;
    sbtnRejectReporting: TUniSpeedButton;
    sbtnDownTime: TUniSpeedButton;
    sbtnInternalDocuments: TUniSpeedButton;
    sbtnExternalDocuments: TUniSpeedButton;
    sbtnPrintRealTimeLabels: TUniSpeedButton;
    sbtnPrintSalesOrderLabels: TUniSpeedButton;
    sbtnPrintInventoryLabels: TUniSpeedButton;
    sbtnSerialNumberTracking: TUniSpeedButton;
    sbtnSPCQuickInspection: TUniSpeedButton;
    sbtnMROWorkOrders: TUniSpeedButton;
    PnlMenuList2: TUniPanel;
    FlowPanel2: TUniPanel;
    sbtnSubmitAnnouncement: TUniSpeedButton;
    sbtnPopupFormTimer: TUniSpeedButton;
    sbtnConfigureShopData: TUniSpeedButton;
    sbtnDialogCheckBoxes: TUniSpeedButton;
    sbtnLogin: TUniSpeedButton;
    sbtnLoginToEPlant: TUniSpeedButton;
    sbtnSecurityInspector: TUniSpeedButton;
    TabSheet3: TUniTabSheet;
    PnlMenuList3: TUniPanel;
    FlowPanel3: TUniPanel;
    sbtnHelp: TUniSpeedButton;
    sbtnKnowledgeCenter: TUniSpeedButton;
    sbtnWikiSOP: TUniSpeedButton;
    sbtnAbout: TUniSpeedButton;
    PnlHelpCaption: TUniPanel;
    lblHelp: TUniLabel;
    PnlOptionsCaption: TUniPanel;
    lblOptions: TUniLabel;
    sbtnWhoIsLoggedIn: TUniSpeedButton;
    sbtnPRW: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateControlSecurity; override;
    procedure AssignButtonTags;
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}


uses
  heijunka_share,
  inv_trans_share,
  IQMS.Common.Applications,
  IQMS.Common.Controls,
  IQMS.WebVcl.SecurityManager,
  sd_const;

procedure TFrmShopDataMenu.FormCreate(Sender: TObject);
begin
  inherited;

  // Assign button tags.
  // IMPORTANT:  Are you adding a new button?  If so, modify
  // sd_const.pas and modify the AssignButtonTags method below.
  AssignButtonTags;
end;

procedure TFrmShopDataMenu.AssignButtonTags;
begin
  // Assign button tags according the enum (see unit sd_const.pas)
  sbtnAbout.Tag := Ord(sd_const.TShopDataModule.modHelpAbout);
  sbtnConfigureShopData.Tag :=
    Ord(sd_const.TShopDataModule.modConfigurShopdata);
  sbtnDialogCheckBoxes.Tag :=
    Ord(sd_const.TShopDataModule.modDialogCheckboxSetup);
  sbtnDownTime.Tag := Ord(sd_const.TShopDataModule.modDowntime);
  sbtnExternalDocuments.Tag :=
    Ord(sd_const.TShopDataModule.modExternalDocuments);
  sbtnFloorDisposition.Tag := Ord(sd_const.TShopDataModule.modFloorDisposition);
  sbtnHeijunka.Tag := Ord(sd_const.TShopDataModule.modHeijunka);
  sbtnHelp.Tag := Ord(sd_const.TShopDataModule.modHelpContents);
  sbtnInternalDocuments.Tag :=
    Ord(sd_const.TShopDataModule.modInternalDocuments);
  sbtnInventoryTransactionsandLocations.Tag :=
    Ord(sd_const.TShopDataModule.modInventoryTransactionsAndLocations);
  sbtnKanbanSupermarket.Tag :=
    Ord(sd_const.TShopDataModule.modKanbanSupermarket);
  sbtnKnowledgeCenter.Tag :=
    Ord(sd_const.TShopDataModule.modHelpKnowledgeCenter);
  sbtnLogin.Tag := Ord(sd_const.TShopDataModule.modLogin);
  sbtnLoginToEPlant.Tag := Ord(sd_const.TShopDataModule.modLoginToEPlant);
  sbtnMROWorkOrders.Tag := Ord(sd_const.TShopDataModule.modMRO);
  sbtnPalletBuilder.Tag := Ord(sd_const.TShopDataModule.modPalletBuilder);
  sbtnPlantLayout.Tag := Ord(sd_const.TShopDataModule.modPlantLayout);
  sbtnPopupFormTimer.Tag := Ord(sd_const.TShopDataModule.modPopupFormTimer);
  sbtnPrintInventoryLabels.Tag :=
    Ord(sd_const.TShopDataModule.modPrintInventoryLabel);
  sbtnPrintRealTimeLabels.Tag :=
    Ord(sd_const.TShopDataModule.modPrintRealTimeLabel);
  sbtnPrintSalesOrderLabels.Tag :=
    Ord(sd_const.TShopDataModule.modPrintSalesOrderLabel);
  sbtnRejectReporting.Tag := Ord(sd_const.TShopDataModule.modRejectReporting);
  sbtnRejects.Tag := Ord(sd_const.TShopDataModule.modRejects);
  sbtnRTMonitorGridView.Tag := Ord(sd_const.TShopDataModule.modRealTimeMonitor);
  sbtnRTMonitorWorkCenterView.Tag :=
    Ord(sd_const.TShopDataModule.modRealTimeWorkCenter);
  sbtnRTProcessMonitor.Tag :=
    Ord(sd_const.TShopDataModule.modRealTimeProcessMonitor);
  sbtnRTScanToInventory.Tag :=
    Ord(sd_const.TShopDataModule.modRealTimeScanToInventory);
  sbtnSecurityInspector.Tag :=
    Ord(sd_const.TShopDataModule.modSecurityInspector);
  sbtnSerialNumberTracking.Tag :=
    Ord(sd_const.TShopDataModule.modSerialNumberTracking);
  sbtnSPCQuickInspection.Tag :=
    Ord(sd_const.TShopDataModule.modSPCQuickInspection);
  sbtnSubmitAnnouncement.Tag :=
    Ord(sd_const.TShopDataModule.modSubmitAnnouncement);
  sbtnWikiSOP.Tag := Ord(sd_const.TShopDataModule.modHelpWiki);
  sbtnWorkorderMaterials.Tag :=
    Ord(sd_const.TShopDataModule.modWorkOrderMaterialsComponents);
  sbtnWhoIsLoggedIn.Tag := Ord(sd_const.TShopDataModule.modWhoIsLoggedIn);
  sbtnPRW.Tag := Ord(sd_const.TShopDataModule.modPRW);
end;

procedure TFrmShopDataMenu.UpdateControlSecurity;
begin
  // Apply control visibility based on security
  // inherited; // nothing
  // Security manager
  sbtnSecurityInspector.Enabled := SR.Enabled['sbtnSecurityInspector'] or
    SecurityManager.IsUserDBA;
  sbtnSecurityInspector.Visible := SR.Visible['sbtnSecurityInspector'] or
    SecurityManager.IsUserDBA;
  // Heijunka
  sbtnHeijunka.Visible := SR.Visible['sbtnHeijunka'] and
    heijunka_share.IsHeijunkaSchedEnabled();
  // Kanban Supermarket
  sbtnKanbanSupermarket.Visible := SR.Visible['sbtnKanbanSupermarket'] and
    heijunka_share.IsHeijunkaSchedEnabled();

  // Apply licensing

  // RT Processing Monitor Licensing
  // 10/22/2009 RT Process Monitor button added
  // Approved by Randy.  E-Mail subject: Re: ShopData - add security on
  // new RT Process Monitor sbtn and issue with RT Workcenter button
  SecurityManager.SetVisibleIfLicensed(sbtnRTProcessMonitor, nil, nil,
    IQAppsNames[apPCMon], SR);

  // RT Monitor Licensing
  // 11/26/2014 (Byron) Do not surface icons for the following modules unless
  // the system has a license for "RT Monitor". Requested by Randy.
  // EIQ-5073 ShopData -> Do not surface icons for the following modules
  // unless the system has a license for "RT Monitor"
  SecurityManager.SetVisibleIfLicensed(sbtnRTScanToInventory, nil, nil,
    IQAppsNames[apRT_Monitor], SR);
  SecurityManager.SetVisibleIfLicensed(sbtnFloorDisposition, nil, nil,
    IQAppsNames[apRT_Monitor], SR);
  SecurityManager.SetVisibleIfLicensed(sbtnRTMonitorGridView, nil, nil,
    IQAppsNames[apRT_Monitor], SR);
  SecurityManager.SetVisibleIfLicensed(sbtnRTMonitorWorkCenterView, nil, nil,
    IQAppsNames[apRT_Monitor], SR);
  SecurityManager.SetVisibleIfLicensed(sbtnDownTime, nil, nil,
    IQAppsNames[apRT_Monitor], SR);
  SecurityManager.SetVisibleIfLicensed(sbtnPrintRealTimeLabels, nil, nil,
    IQAppsNames[apRT_Monitor], SR);

  // SPC Licensing
  SecurityManager.SetVisibleIfLicensed(sbtnSPCQuickInspection, nil, nil,
    IQAppsNames[apSPC], SR);
  // MRO Licensing
  SecurityManager.SetVisibleIfLicensed(sbtnMROWorkOrders, nil, nil,
    IQAppsNames[apPM], SR);

  // Production Reporting by Work Order
  SecurityManager.SetVisibleIfLicensed(sbtnPRW, nil, nil,
    IQAppsNames[apProdRepByWO], SR);

  // 12/26/2013
  sbtnWorkorderMaterials.Visible := inv_trans_share.IsWMS2Licensed;

  // After security is done, is there anything to show on the tab?
  TabSheet2.Enabled := IQMS.Common.Controls.VisibleControlCount(FlowPanel2) > 0;
  TabSheet3.Enabled := IQMS.Common.Controls.VisibleControlCount(FlowPanel3) > 0;
end;

end.
