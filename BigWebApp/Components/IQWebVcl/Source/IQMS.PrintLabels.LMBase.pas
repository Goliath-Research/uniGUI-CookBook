unit IQMS.PrintLabels.LMBase;

{ LM Hierarchy:

[+] TFrmLM_Base
    [+] TFrmLM_Manu [IQLMManu.pas]
        [+] TFrmLM_Bom [IqLmBom.pas]
                TFrmLMBomEx [IQLmBomEx.pas]
                TFrmLMBomAssyMulti [IQLmBom_Assy_Multi.pas]
                TFrmLM_BomAssyProcess [IQLMBom_Assy_Process.pas]
                TFrmLMBomRecvMulti [IQLmBom_Recv_Multi.pas]
                TFrmLMBomRMAMulti [IQLmBom_RMA_Multi.pas]
        [+] TFrmLM_Pack [IQLMPack.pas]
                TFrmLM_Pack_Multi [IQLMPack_Multi.pas]
                [+] TFrmLM_Prod [IQLMProd.pas]
                    TFrmLM_ProdPRW [IQLMProdPRW.pas]
                    [+] TFrmSDLM_Prod [IQLMSdProd.pas]
                            TFrmSDLM_Prod_Assist [IQLMSDProd_Assist.pas]
                [+] TFrmLM_RT [IqLMRT.pas]
                    [+] TFrmSDLM_RT [IQLMSdRT.pas]
                            TFrmLM_RT_Assist [IQLMRT_Assist.pas]
        TFrmLM_SDBOM [IQLmsdbm.pas]
        TFrmIqLmSdPack [IqLMsdpk.pas]
    [+] TFrmLM_Purch [Iqlmpurc.pas]
        [+] TFrmLMRaw [IQLmRaw.pas]
                TFrmLMRawEx [IQLmRawEx.pas]
                TFrmLMRawRecvMulti [IQLMRaw_Recv_Multi.pas]
                TFrmLMRawRMAMulti [IQLMRaw_RMA_Multi.pas]
        TFrmLM_SDRaw [IQLMSDRw.pas]
}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Vcl.Menus,
  Mask,
  IQMS.PrintLabels.DMLM,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  IQMS.PrintLabels.LMShare,
  Vcl.Printers,
  Vcl.DbCtrls,
  System.SyncObjs,
  IQMS.WebVcl.UDComboBox,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmLM_Base = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    N1: TUniMenuItem;
    NewLabel1: TUniMenuItem;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    Panel8: TUniPanel;
    Location: TUniLabel;
    Label3: TUniLabel;
    Label1: TUniLabel;
    Label5: TUniLabel;
    SBNewLabel: TUniSpeedButton;
    Label12: TUniLabel;
    EditQty: TUniEdit;
    wwLabels: TUniDBLookupComboBox;
    EditLblQty: TUniEdit;
    edLotNo: TUniEdit;
    PopupUserDefLabel: TUniPopupMenu;
    DefineLabelText1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Bevel1: TUniPanel;
    wwDBDateTimePickDate: TUniDBDateTimePicker;
    sbUserDefined: TUniScrollBox;
    PnlUserDefined: TUniPanel;
    Splitter3: TUniSplitter;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlUDLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    dbeCUSER1: TUniEdit;
    dbeCUSER2: TUniEdit;
    dbeCUSER3: TUniEdit;
    dbeCUSER4: TUniEdit;
    dbeCUSER5: TUniEdit;
    dbeCUSER6: TUniEdit;
    dbeCUSER7: TUniEdit;
    dbeCUSER8: TUniEdit;
    dbeCUSER9: TUniEdit;
    dbeCUSER10: TUniEdit;
    PnlUDRight01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlUDLeft02: TUniPanel;
    PnlClient03: TUniPanel;
    dbeNUSER1: TUniEdit;
    dbeNUSER2: TUniEdit;
    dbeNUSER3: TUniEdit;
    dbeNUSER4: TUniEdit;
    dbeNUSER5: TUniEdit;
    dbeNUSER6: TUniEdit;
    dbeNUSER7: TUniEdit;
    dbeNUSER8: TUniEdit;
    dbeNUSER9: TUniEdit;
    dbeNUSER10: TUniEdit;
    lblCountryOfOrigin: TUniLabel;
    lblPrinter: TUniLabel;
    wwDBComboPrinter: TUniDBComboBox;
    cmbLabelDispositionSetting: TUniComboBox;
    lblLabelDispositionSetting: TUniLabel;
    TabDimInv: TUniTabSheet;
    pnlDimInvTop: TUniPanel;
    gridDimInv: TIQUniGridControl;
    navDimInv: TUniDBNavigator;
    EdAkaItemno: TUniEdit;
    LblAkaItemno: TUniLabel;
    PnlLegend: TUniPanel;
    shpCalculated: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SBNewLabelClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DoEditBoxExit(Sender: TObject);
    procedure wwLabelsChange(Sender: TObject);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryDimInvBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
//    procedure gridDimInvCalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    private
      { Private declarations }
      FCommPortParams: string;
      FOnGetTotalLabelsCount: TOnGetTotalLabelsCount;
      FOnBeforeMasterLabelInsert: TOnBeforeMasterLabelInsert;
      FWorkCenterID: Real;
      FCRWPrinterName: string;
      FOnBeforeRePrintLabel: TOnBeforeRePrintLabel;
      FOnBeforePrint: TOnBeforePrint;
      procedure AssignManufacturedValues(cName: string);
      procedure AssignPurchasedValues(cName: string);
      procedure AssignLoadValues(cName: string);
      procedure CheckField(AFieldName: string; ADataSet: TDataSet);
      function StrToFloatDef(S: string): Real;
      procedure CopyImageFileToLMdir;
      function ProcessLocally(cDirExe, cLabel, cDirLabels,
        ADBFFile: string): Boolean;
      function ProcessRemotely(cDirExe, cLabel, cDirLabels,
        ADBFFile: string): Boolean;
      function DirWhereDBFGoes: string;
      procedure Rename_XDbf_To_Label_Name(ADBFFile, cLabel: string);
      function LM_Redirect_Dbf: Boolean;
      procedure CheckIntegrityArinvt;
      procedure CreateEmptyDbfFile;
      procedure InitOpenDataSet(ATable: TFDTable);
      procedure SafeAssign(ADataSet: TDataSet; AFieldName: string;
        AFieldType: TFieldType; AValue: Variant);
      procedure ProcessReportBuilder;
      function CheckAdjustQty(ACurrentBoxCount: Integer; AItemsPerBox: Real;
        var ANewQty: Real; var APrevPromptPrint0, AHasAEncountered0
        : Boolean): Boolean;
      function PadZeroSerial(ASerial: Real): string;
      procedure SetOnGetTotalLabelsCount(const Value: TOnGetTotalLabelsCount);
      procedure SetOnBeforePrintLabel(const Value: TOnBeforeMasterLabelInsert);
      function IsTablePopulated: Boolean;
      procedure OnReprintAssignVarsFromMasterLabel;
      procedure WaitForLockFile(ALockFileName: string);
      function IsCreatingCopyOfLabel(I: Integer): Boolean;
      procedure CheckAssignLotDate(AMaster_Label_ID: Real; ADataSet: TDataSet);
      procedure CheckReprintEnsureValuesMatchMasterLabel
        (APrintExist_Master_Label_ID: Real);
      procedure CheckAssignLotDocs(AMaster_Label_ID: Real);
      procedure CheckSICNegativeQty(AQty: Real);
      function IsSIC: Boolean;
      procedure CheckAppendPrinterDesignation(var CommandLine: string;
        AComm_Port: string);
      function CheckPopulateMixedPalletFields(AMaster_Label_ID: Real;
        var AQty: Real): Boolean;
      procedure UpdateMasterLabelMixedPalletInfo(AMaster_Label_ID,
        AQtyInBox: Real);
      procedure CheckCRWPrinterForced(var ACRWPrinterName: string);
      function Check_use_original_label_on_reprint: Boolean;
      procedure CheckMinimumPrintInterval;
      procedure UpdateLastPrintTimeStamp;
      function GetLabelDispositionSetting: TLabelDispositionSetting;
      procedure SetLabelDispositionSetting(const Value
        : TLabelDispositionSetting);
      function GetShowLabelDispositionSetting: Boolean;
      procedure SetShowLabelDispositionSetting(const Value: Boolean);
      function GetLotExpiryDate(AArinvt_ID: Real; ALotNo: string): TDateTime;
      procedure CheckAssignLMInvtryLocationDescription(AMaster_Label_ID: Real;
        ADataSet: TDataSet);
      procedure CheckAssignDimensionalInventory;
      procedure CheckSaveDimensionalInventory(AMaster_Label_ID: Real);
      procedure CheckValidateDimensionalInventory;
      function GetLabelTemplateId: Real;
      function IsLabelTemplateUsed: Boolean;
      procedure ProcessLabelTemplate;
      procedure CheckAssignRejectFields(ADataSet: TDataSet);
      function IsForeignYN: string;
      function GetLabelsQuantity: Integer;
      procedure SetLabelsQuantity(const Value: Integer);
    protected
      { Protected declarations }
      FIsPallet: Boolean;
      FCartons_Pallet: Real;
      FPieces_Carton: Real;
      FPrintExist_Master_Label_ID: Real;
      FAfterMasterLabelInsert: TOnAfterMasterLabelInsert; { IQLMShare.pas }
      CRW_UseDefaultPrinter: Boolean;
      CS_InProgress: TCriticalSection;
      FForeignSerial: string;
      FBadgeNo: string;
      FDBFConnection: TFDConnection;
      procedure AssignDefaults; virtual;
      procedure ValidateBeforePrint; virtual;
      procedure GatherInformation; virtual;
      procedure AssignQuantity; virtual;

      function CheckPrintExist_Serial: Real;
      function CheckPrintExist_CSerial: string;
      function CheckPrintExist_Serial2: string;
      function GetCRWReportName: string; virtual;
      function GetCRWCopies: Integer; virtual;
      procedure CheckIntegrityArinvtMfgNo; virtual;
      procedure CheckUpdateDispoScan(const AMasterLabelID: Real);
      function GetDefaultPkUnitPtsPer(AArinvt_ID: Real): Real;
      procedure CheckMandatoryLotNo;
      procedure PopulateAkaItemno;virtual;
      procedure CheckAssociateToPalletUsingPOReceiptsLabels(  APO_Receipts_Labels_ID, AMaster_Label_ID: Real);
      procedure LoadPrinterList; virtual;
      procedure CheckPromptTouchScreenBadgeNo;
      procedure CreateMasterLabelRecord;
      function GetDBFConnection: TFDConnection;
      function PrintPalletLabels_POReceipts(const APOReceiptsID, ATransLogID,
        AFGMultiID: Int64): Boolean;
      function PrintLabels_POReceipts(const APOReceiptsID, ATransLogID,
        AFGMultiID: Int64): Boolean;
      function GetUnitQuantity: Integer; virtual;
      procedure SetUnitQuantity(const Value: Integer); virtual;
    public
      { Public declarations }
      DM: TLM_DM;
      fId: Real;
      FReprintLabel: Boolean;

      FAccumulateMultipleRecordsBeforePrinting: Boolean;
      FAccumulateMultipleRecordsCount: Integer;
      FBoxNoRepresentsNumberOfCopies: Boolean;
      // FPlannedLabelSource_ID represents which po_receipts_labels id
      // (or master_label_plan if needed in the future) this printed label is based on
      FPlannedLabelSource_ID: Real;

      constructor Create(AOwner: TComponent; Id: Real); virtual;
      destructor Destroy; override;
      function DoShow(AModal: Boolean): Boolean;
      procedure CreateDbfTable;
      procedure AssignShipTo; virtual;
      procedure AssignUserDefined(AArinvt_ID: Real);
      procedure DisplayCaption;
      function IsReportBuilderUsed: Boolean;
      function IsLabel_KindNoShip: Boolean;
      function IsLabel_KindPallet: Boolean;
      function IsLabel_KindNonSerial: Boolean;
      function OnLabelPrintAssignASNInfo: Boolean;
      class procedure UpdateMasterLabelLocationAfterInsert(AMaster_Label_ID,
        AFGMulti_ID: Real; ASetDispoScanTrue: Boolean = FALSE);
      class procedure CheckAppendTranslog_Master_Label(ATranslog_ID,
        AMaster_Label_ID: Real);
      procedure CheckPalletUpdateChildren(AMaster_Label_ID: Real);

      procedure PrintLabel;
      procedure ProcessExec;

      property UnitQuantity: Integer read GetUnitQuantity write SetUnitQuantity;
      property LabelsQuantity: Integer read GetLabelsQuantity write SetLabelsQuantity;

      property AfterMasterLabelInsert: TOnAfterMasterLabelInsert
        read FAfterMasterLabelInsert write FAfterMasterLabelInsert;

      property OnGetTotalLabelsCount: TOnGetTotalLabelsCount
        read FOnGetTotalLabelsCount write SetOnGetTotalLabelsCount;
      property OnBeforeMasterLabelInsert: TOnBeforeMasterLabelInsert read FOnBeforeMasterLabelInsert
        write SetOnBeforePrintLabel;
      property OnBeforePrint: TOnBeforePrint read FOnBeforePrint
        write FOnBeforePrint;
      property OnBeforeRePrintLabel: TOnBeforeRePrintLabel read FOnBeforeRePrintLabel
        write FOnBeforeRePrintLabel;
      property CRWReportName: string read GetCRWReportName;
      property CRWPrinterName: string read FCRWPrinterName
        write FCRWPrinterName;
      property LabelTemplateId: Real read GetLabelTemplateId;
      property WorkCenterID: Real read FWorkCenterID write FWorkCenterID;
      property LabelDispositionSetting: TLabelDispositionSetting
        read GetLabelDispositionSetting write SetLabelDispositionSetting;
      property ShowLabelDispositionSetting: Boolean
        read GetShowLabelDispositionSetting write SetShowLabelDispositionSetting;
      property Label_KindNonSerial: Boolean read IsLabel_KindNonSerial;
      property PlannedLabelSource_ID: Real read FPlannedLabelSource_ID write FPlannedLabelSource_ID;
      procedure AssignFGLotNo(AFGLotNo: string);
      class procedure DoForceCRWPrinterName(S: string);
      class procedure Assign_FDoNotCheck_use_original_label_on_reprint(S: Boolean);
      procedure CheckAssignPrinterName(APrinterName: string);
      class function AssignSkipCheckMinimumPrintInterval( AValue: Boolean ): Boolean;
      class function GetLastUsedCRWPrinterName: string;
      class procedure SetLastUsedCRWPrinterName( S: string );
  end;

var
  FrmLM_Base: TFrmLM_Base;
  IsAnyLabelBeenPrinted: Boolean = FALSE;

implementation

{$R *.DFM}


uses
//  rf_dim_inv,
//  IQActive_TLB,
//  IQMS.Receive.PrintPalletIntf,
//  IQMS.Receive.PrintPallet,
//  iqrf.rf_pro_share,
//  IQSecIns,
//  PSTkPara,
//  touchscrn,
  IQMS.Common.ConfMissingLotno,
  IQMS.Common.ApplicationSet,
  IQMS.Common.COMShare,
  IQMS.Common.Console,
  IQMS.Common.Controls,
  IQMS.Common.FileUtils,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.PrintLabels.LMEdit,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  IQMS.Common.LabelEditor,
  IQMS.Common.Sd_settings,
  System.Variants,
  IQMS.WebVcl.ResourceStrings;


var
  FForcedCRWPrinterName: string;
  FDoNotCheck_use_original_label_on_reprint: Boolean;
  FSkipCheckMinimumPrintInterval: Boolean = FALSE;
  FLastUsedCRWPrinterName: string;

class function TFrmLM_Base.AssignSkipCheckMinimumPrintInterval( AValue: Boolean ): Boolean;
begin
  Result:= FSkipCheckMinimumPrintInterval; // return prev value
  FSkipCheckMinimumPrintInterval:= AValue;
end;


constructor TFrmLM_Base.Create(AOwner: TComponent; Id: Real);
begin
  // Initialization
  FWorkCenterID := 0;

  CS_InProgress := TCriticalSection.Create;

  TIQWebLMBase(AOwner).Child := Self;
  FReprintLabel := True;

  FIsPallet := FALSE;

  if Empty(SelectValueAsString('select LM_DIRECTORY from PARAMS')) then
    // 'Label Matrix Labels directory not set.  Please specify a Labels directory in System Parameters.'
    raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000107);
  if Empty(SelectValueAsString('select LM_EXE_DIR from PARAMS')) then
    // 'Label Matrix EXE directory not set.  Please specify a Label Matrix EXE directory in System Parameters.';
    raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000108);

  DM := TLM_DM.Create(Self);
  inherited Create(AOwner);
  DM.Name := '';

  // 08/29/2014 If this is a touchscreen application, always set this flag.
  // For YouTrack: "EIQ-4114 Allow Labels to be printed from Work Orders without
  //  a customer being assigned."  Approved by Randy. (Byron)
  DM.DoNotDefaultArcusto := IQMS.Common.ApplicationSet.IsTouchScreen;

  TabDimInv.TabVisible:= FALSE;
  fId := Id;
  AssignDefaults;

  PageControl1.ActivePage := TabSheet1;

  // 02-22-2010
//  IQMS.Common.Controls.AdjustDateTimePicker(wwDBDateTimePickDate);
end;

procedure TFrmLM_Base.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient03);

  // 02/29/2016 (Byron, EIQ-10898)
  LoadPrinterList;

  // 01/20/2015 (Byron) set max length of lot number
  edLotNo.MaxLength := GetFieldSize('FGMULTI','LOTNO');
end;

procedure TFrmLM_Base.FormShow(Sender: TObject);
var
  ALastPrinterName: string;
begin
  IQRegFormRead(Self, [Self, PnlUDLeft01, PnlUDLeft02, PnlUDRight01]);

  // Restore the printer
  // 02/29/2016 (Byron, EIQ-10898) Restore printer only in FormShow.
  // This should never be done for the "silent" print requests,
  // since the printer assigned to the label itself (through the Label
  // Matrix editor) should be used.
  if IQRegStringScalarRead(Self, 'LM_Printer', ALastPrinterName) then
     CheckAssignPrinterName(ALastPrinterName);

//  IQSecIns.EnsureSecurityInspectorOnTopOf(Self);
end;

function TFrmLM_Base.DoShow(AModal: Boolean): Boolean;
begin
  Result := True; // default
  if AModal then
    Result := (Self.ShowModal in [mrOk, mrYes])
  else
    Self.Show;
end;

procedure TFrmLM_Base.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  IQRegFormWrite(self, [self, PnlUDLeft01, PnlUDLeft02, PnlUDRight01]);
  IQRegStringScalarWrite(self, 'LM_Printer', wwDBComboPrinter.Text);
end;

destructor TFrmLM_Base.Destroy;
begin
  if Assigned(Owner) and Assigned(TIQWebLMBase(Owner).Child) then
    TIQWebLMBase(Owner).Child := nil;
  CS_InProgress.Free;

  if Assigned(FDBFConnection) then
    FreeAndNil(FDBFConnection);

  inherited;
end;

function NVL(a, b: string): string;
begin
  if Trim(a) = '' then
    Result := b
  else
    Result := a
end;

procedure TFrmLM_Base.LoadPrinterList;
var
  i: Integer;
begin
  for i := 0 to Printer.Printers.Count - 1 do
    wwDBComboPrinter.Items.Add(Printer.Printers[i]);
  // Do not set a default printer here.
  wwDBComboPrinter.ItemIndex := - 1;
end;

procedure TFrmLM_Base.AssignShipTo;
begin
  TIQWebLMBase(self.Owner).Ship_To_ID := 0;

  if TIQWebLMBase(self.Owner).Orders_id = 0 then
    EXIT;

  { if shipments_id is assigned get ship_to_id from shipments else from orders 04-05-06 }
  if TIQWebLMBase(self.Owner).FShipments_ID > 0 then
    TIQWebLMBase(self.Owner).Ship_To_ID :=
      SelectValueFmtAsFloat('select ship_to_id from shipments where id = %f',
      [TIQWebLMBase(self.Owner).FShipments_ID]);

  if (TIQWebLMBase(self.Owner).FShipments_ID = 0) or
    (TIQWebLMBase(self.Owner).Ship_To_ID = 0) then
    TIQWebLMBase(self.Owner).Ship_To_ID :=
      SelectValueFmtAsFloat('select ship_to_id from orders where id = %f',
      [TIQWebLMBase(self.Owner).Orders_id]);

  if TIQWebLMBase(self.Owner).Ship_To_ID <> 0 then
    begin
      with TFDQuery.Create(nil) do
        try
          { Customer }
          ConnectionName := 'IQFD';
          SQL.Add(IQFormat('select attn, ' +
            'addr1, ' +
            'addr2, ' +
            'addr3, ' +
            'cuser1, ' +
            'cuser2, ' +
            'zip, ' +
            'rtrim(TrimLeft(city)) || '', '' || ' +
            'rtrim(TrimLeft(state)) as city_st, ' +
            'supplier_code, ' +
            'country ' +
            'from ship_to where id = %f', [TIQWebLMBase(self.Owner).Ship_To_ID]));
          Open;
          // TLMBase(self.Owner).FCustomer    := FieldByName('attn').asString;
          TIQWebLMBase(self.Owner).FShipName := FieldByName('attn').asString;
          TIQWebLMBase(self.Owner).FAddress1 := FieldByName('addr1').asString;
          TIQWebLMBase(self.Owner).FAddress2 := FieldByName('addr2').asString;
          TIQWebLMBase(self.Owner).FAddress3 := FieldByName('addr3').asString;
          TIQWebLMBase(self.Owner).FShipToUser1 := FieldByName('cuser1').asString;
          TIQWebLMBase(self.Owner).FShipToUser2 := FieldByName('cuser2').asString;
          TIQWebLMBase(self.Owner).FCity_st_zp := FieldByName('city_st').asString +
            ' ' + FieldByName('zip').asString;
          TIQWebLMBase(self.Owner).FZipcode := FieldByName('zip').asString;
          TIQWebLMBase(self.Owner).FSupp_Code :=
            FieldByName('supplier_code').asString;
          TIQWebLMBase(self.Owner).FCountry := FieldByName('country').asString;
        finally
          Free;
        end;
      EXIT;
    end;

  TIQWebLMBase(self.Owner).Ship_To_ID :=
    SelectValueFmtAsFloat('select id from hist_orders where id = %f',
    [TIQWebLMBase(self.Owner).Orders_id]);

  if TIQWebLMBase(self.Owner).Ship_To_ID <> 0 then
    begin
      with TFDQuery.Create(nil) do
        try
          { Customer }
          ConnectionName := 'IQFD';
          SQL.Add(IQFormat('select ship_to_attn as attn, ' +
            'ship_to_addr1 as addr1, ' +
            'ship_to_addr2 as addr2, ' +
            'ship_to_addr3 as addr3, ' +
            'ship_to_zip as zip, ' +
            'rtrim(TrimLeft(ship_to_city)) || '', '' || ' +
            'rtrim(TrimLeft(ship_to_state)) as city_st, ' +
            'arcusto_country as country ' +
            'from hist_orders where id = %f',
            [TIQWebLMBase(self.Owner).Ship_To_ID]));
          Open;
          // TLMBase(self.Owner).FCustomer    := FieldByName('attn').asString;
          TIQWebLMBase(self.Owner).FShipName := FieldByName('attn').asString;
          TIQWebLMBase(self.Owner).FAddress1 := FieldByName('addr1').asString;
          TIQWebLMBase(self.Owner).FAddress2 := FieldByName('addr2').asString;
          TIQWebLMBase(self.Owner).FAddress3 := FieldByName('addr3').asString;
          TIQWebLMBase(self.Owner).FCity_st_zp := FieldByName('city_st').asString +
            ' ' + FieldByName('zip').asString;
          TIQWebLMBase(self.Owner).FZipcode := FieldByName('zip').asString;
          TIQWebLMBase(self.Owner).FCountry := FieldByName('country').asString;
        finally
          Free;
        end;

      TIQWebLMBase(self.Owner).Ship_To_ID :=
        SelectValueFmtAsFloat('select ship_to_id from hist_orders where id = %f',
        [TIQWebLMBase(self.Owner).Orders_id]);

      with TFDQuery.Create(nil) do
        try
          { Customer }
          ConnectionName := 'IQFD';
          SQL.Add(IQFormat('select cuser1, ' +
            '         cuser2, ' +
            '         supplier_code ' +
            'from ship_to where id = %f', [TIQWebLMBase(self.Owner).Ship_To_ID]));
          Open;
          TIQWebLMBase(self.Owner).FShipToUser1 := FieldByName('cuser1').asString;
          TIQWebLMBase(self.Owner).FShipToUser2 := FieldByName('cuser2').asString;
          TIQWebLMBase(self.Owner).FSupp_Code :=
            FieldByName('supplier_code').asString;
        finally
          Free;
        end
    end;
end;

procedure TFrmLM_Base.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmLM_Base.AssignDefaults;
var
  AStandardID: Real;
begin
  DM.SrcLabels.DataSet := DM.QryLabels;
  wwLabels.ListSource := DM.SrcLabels;
  DisplayCaption;
  IQSetTablesActive(FALSE, DM);

  wwLabels.ListField := 'LABEL_MENU_NAME';
  AssignQueryParamValue(DM.QryLabels, 'cLabelType', TIQWebLMBase(Owner).LabelType);
  AssignQueryParamValue(DM.QryLabels, 'arinvt_id', Trunc(fId));

  AssignQueryParamValue(DM.QryVendor, 'nId', Trunc(fId));
  AssignQueryParamValue(DM.QryLocation, 'nId', Trunc(fId));
  AssignQueryParamValue(DM.QryPoOrders, 'nId', Trunc(fId));
  AssignQueryParamValue(DM.QryPoRec, 'nId', Trunc(fId));


  AssignQueryParamValue(DM.QryMfgNo, 'nId', Trunc(fId));
  AssignQueryParamValue(DM.QryMfgNo, 'this_standard_id', Trunc(TIQWebLMBase(Owner)
    .This_Standard_ID));

  AssignQueryParamValue(DM.QryPackage, 'nId', Trunc(fId));
  AssignQueryParamValue(DM.QryPackage, 'this_standard_id', Trunc(TIQWebLMBase(Owner)
    .This_Standard_ID));

  IQSetTablesActive(True, DM);

  wwLabels.Text := DM.QryLabels.FieldByName('LABEL_MENU_NAME').asString;

  if TIQWebLMBase(Owner).This_Standard_ID > 0 then
    AStandardID := TIQWebLMBase(Owner).This_Standard_ID
  else
    AStandardID :=
      SelectValueFmtAsFloat('select standard_id from arinvt where id = %f', [fId]);
  if AStandardID > 0 then
    DM.QryMfgNo.Locate('ID', AStandardID, []);

  // EditDate.Text := DateToStr(Date);
  wwDBDateTimePickDate.DateTime := Date;

  // Fill lot number
  if Trim(TIQWebLMBase(Owner).FLotNo_User) > '' then
    edLotNo.Text := Trim(TIQWebLMBase(Owner).FLotNo_User)
    // user-specified lot number
  else
    edLotNo.Text := Trim(TIQWebLMBase(Owner).FLotNo); // default lot number

  // 12/21/2012 Load the Label Disposition Setting combo box list.
  LoadLabelDispositionSettingComboBox
    (self.cmbLabelDispositionSetting);
  self.cmbLabelDispositionSetting.ItemIndex := - 1;
  PopulateAkaItemno;

  if (EditLblQty.Text = '') or (EditLblQty.Text = '0') then
    EditLblQty.Text := '1';
end;

procedure TFrmLM_Base.DisplayCaption;
begin
  Caption := Format(IQMS.WebVcl.ResourceStrings.cTXT0000109 { 'Print Label for %s, %s' } ,
    [Trim(TIQWebLMBase(Owner).FPart_No),
    Trim(TIQWebLMBase(Owner).FPart_desc)]);
end;

procedure TFrmLM_Base.CheckPromptTouchScreenBadgeNo;
begin
  FBadgeNo := '';
  // 05/15/2014 Check badge number
  // EIQ-3025 ShopData -> Prompt for Badge # for IQLog, Print Labels & Scan to Inventory
  if IQMS.Common.ApplicationSet.IsTouchScreen and
    (CompareText(IQMS.Common.FileUtils.ExeFileName, 'SHOPDATA.EXE') = 0) then
    begin
      CheckShopDataSettingsCreated;
      if ShopDataSettings.PromptForBadgeNumber then
        begin
//          if not touchscrn.TouchScreen_ScanLogin_BadgeNumber(Self,FBadgeNo) then
//            System.SysUtils.Abort;
        end;
    end;
end;

procedure TFrmLM_Base.CreateMasterLabelRecord;
begin
  // Get information before printing
  GatherInformation;
  // Create the DBF or master label record
  CreateDbfTable;
  CopyImageFileToLMdir;
end;

procedure TFrmLM_Base.BtnOkClick(Sender: TObject);
begin
  PrintLabel;
end;

procedure TFrmLM_Base.PrintLabel;
begin
  ValidateBeforePrint;
  CheckValidateDimensionalInventory;
  CheckPromptTouchScreenBadgeNo;
  try
    CS_InProgress.Acquire;
    BtnOk.Enabled := FALSE;
    try
      if not FSkipCheckMinimumPrintInterval then
         CheckMinimumPrintInterval;

      // This creates the master label record and the dbf table
      CreateMasterLabelRecord;

      { do not print foreign label or when accumulating all records in 1 dbf }
      if not ((FForeignSerial <> '') or
        FAccumulateMultipleRecordsBeforePrinting) then
        begin
          if IsTablePopulated then
            ProcessExec;
        end;
  finally
    CS_InProgress.Release;
    BtnOk.Enabled := True;
  end;
  finally
    FBadgeNo := '';
  end;
end;

function TFrmLM_Base.IsTablePopulated: Boolean;
var
  ATable: TFDTable;
begin
  if (IsReportBuilderUsed or IsLabelTemplateUsed) then
    Result := SelectValueFmtAsInteger(
     'SELECT 1 FROM lminvtry WHERE batch = %d AND ROWNUM < 2',
     [Trunc(TIQWebLMBase(self.Owner).FBatch)]) = 1
  else
  begin
    ATable := TFDTable.Create(self);
    with ATable do
      try
        // Assign DatabaseName and TableName
        InitOpenDataSet(ATable);
        // Check if empty
        Result := not (Eof and Bof);
      finally
        Free;
      end;
  end;
end;

procedure TFrmLM_Base.CopyImageFileToLMdir;
var
  ASourceName: string;
  AExt: string;
  AImagesDir: string;
  ALMDir: string;
  ATargetName: string;
  procedure CreateZeroSizeFile(AFileName: string);
  begin
  //EIQ-1460 Label Maint. Directory Does not use unc paths correctly.
    AFileName := IncludeTrailingPathDelimiter(ALMDir) + AFileName;
//    AFileName := StrTran(ALMDir + '\', '\\', '\') + AFileName;
    DeleteFile(AFileName);
    TFileStream.Create(AFileName, fmCreate).Free;
  end;

begin
  ALMDir := SelectValueAsString('select lm_directory from params');
  if Trim(ALMDir) = '' then
    begin
      IQWarning(IQMS.WebVcl.ResourceStrings.
        cTXT0000110 { 'Label Matrix directory is undefined. Unable to copy image to Label Matrix directory' } );
      EXIT;
    end;

  ASourceName := SelectValueFmtAsString
    ('select lm_image_filename from arinvt where id = %f',
    [TIQWebLMBase(Owner).FArinvt_ID]);

  if ASourceName > '' then
    begin
      { copy image to LM Directory }
      AImagesDir := IQGetImagesPath;
      if AImagesDir = '' then
        begin
          // 'IQMS Images directory is undefined. Unable to copy image to Label Matrix directory'
          IQWarning(IQMS.WebVcl.ResourceStrings.cTXT0000111);
          EXIT;
        end;

      ASourceName := AImagesDir + ASourceName; { source dir }
      AExt := ExtractFileExt(ASourceName);
      ATargetName := StrTran(ALMDir + '\', '\\', '\') + 'LM_IMAGE' + AExt;

      if not CopyFile(PChar(ASourceName), PChar(ATargetName), FALSE) then
        IQWarning(Format
          (IQMS.WebVcl.ResourceStrings.
          cTXT0000098 { 'Unable to copy %s to %s. Error Code: %d' } ,
          [ASourceName, ATargetName, GetLastError]));
    end
  else
    begin
      { create blank lm_image file in LM directory }
      CreateZeroSizeFile('LM_IMAGE.BMP');
      CreateZeroSizeFile('LM_IMAGE.JPG');
      CreateZeroSizeFile('LM_IMAGE.JPEG');
    end;
end;

function TFrmLM_Base.IsReportBuilderUsed: Boolean;
begin
  Result := CRWReportName > '';
  // wwLabels.LookUpTable.FieldByName('REPORT_NAME').asString > '';
end;

function TFrmLM_Base.IsLabelTemplateUsed: Boolean;
begin
  Result := LabelTemplateId > 0;
end;
function TFrmLM_Base.IsLabel_KindNonSerial: Boolean;
begin
  {EIQ-3206 New label kind called NONSERIAL - Wilbert Plastics, NOT tracked in master_label 06-26-14 AB}
  Result := wwLabels.ListSource.DataSet.FieldByName('LABEL_KIND').asString = 'NONSERIAL';
end;

function TFrmLM_Base.IsLabel_KindNoShip: Boolean;
begin
  Result := wwLabels.ListSource.DataSet.FieldByName('LABEL_KIND').asString = 'NOSHIP';
end;

function TFrmLM_Base.IsLabel_KindPallet: Boolean;
begin
  Result:= wwLabels.ListSource.DataSet.FieldByName('LABEL_KIND').asString = 'PALLET';

  // 03-30-3015 EIQ-4927: Tessy - printing a label with a pk marked as 'Is Pallet' does not set MASTER_LABEL.IS_PALLET = Y
  // revert the change
  // if (TLMBase(Owner).FPkg_Arinvt_ID > 0) then
  //    Result:= SelectValueByID('is_pallet', 'arinvt', TLMBase(Owner).FPkg_Arinvt_ID) = 'Y';
end;

function TFrmLM_Base.OnLabelPrintAssignASNInfo: Boolean;
begin
//  Result := GetPK_TKT_ASSIGN_ASN_ON_PRINT_LBL; { PSTkPara.pas }
  // SelectValueAsString('select pk_tkt_assign_asn_on_print_lbl from params') = 'Y';
end;

procedure TFrmLM_Base.ValidateBeforePrint;
var
  AQuantity, ALabelQuantity: Integer;
begin
  // validate and get the quantity
  if not IQMS.Common.Numbers.IsStringValidInteger(EditQty.Text, AQuantity) then
    raise Exception.Create
      (IQMS.WebVcl.ResourceStrings.cTXT0000112 { 'Valid Quantity must be entered' } );

  // validate and get the label quantity
  if not IQMS.Common.Numbers.IsStringValidInteger(EditLblQty.Text, ALabelQuantity) or (ALabelQuantity = 0) then
    raise Exception.Create
      (IQMS.WebVcl.ResourceStrings.cTXT0000113 { 'Valid Labels Quantity must be entered' } );
end;

procedure TFrmLM_Base.GatherInformation;
var
  dDate: TDateTime;
  nQty: Real;
  nLabelQty: Integer;
  ALM_Labels_ID: Real;
begin
  if FIsPallet then
    begin
      // dbeCUser9.Text := FloatToStr(FPieces_Carton);
      // dbeCUser10.Text:= FloatToStr(FCartons_Pallet);
      TIQWebLMBase(Owner).F_CARTONS_PALLET := FCartons_Pallet;
      TIQWebLMBase(Owner).F_PIECES_CARTON := FPieces_Carton;
    end;

  // dDate := StrToDate(EditDate.Text);
  dDate := wwDBDateTimePickDate.DateTime;

  // 06/10/2016 Validation of quantities should already have
  // been done, before getting here.
  nQty := UnitQuantity;
  nLabelQty := LabelsQuantity;

  if nLabelQty = 0 then { Deb found this. Sep 23,99 }
    nLabelQty := 1;

  TIQWebLMBase(Owner).TBoxNo := nLabelQty;
  TIQWebLMBase(Owner).Vendor_Id := DM.QryVendor.FieldByName('ID').asFloat;
  TIQWebLMBase(Owner).FgMulti_Id := DM.QryLocation.FieldByName('ID').asFloat;

  TIQWebLMBase(Owner).FLM_Labels_ID := wwLabels.ListSource.DataSet.FieldByName
    ('ID').asFloat;
  // 09-27-2010
  if FPrintExist_Master_Label_ID > 0 then
    begin
      ALM_Labels_ID := SelectValueByID('lm_labels_id', 'master_label', FPrintExist_Master_Label_ID);

      if (ForcedLM_Lables_ID > 0) and wwLabels.ListSource.DataSet.Locate('id', ForcedLM_Lables_ID, []) then
         TIQWebLMBase(Owner).FLM_Labels_ID:= ForcedLM_Lables_ID

      else if Check_use_original_label_on_reprint then
        begin
          if not BypassChangingLabelToOriginal and
            use_original_label_on_reprint() and
            wwLabels.ListSource.DataSet.Locate('id', ALM_Labels_ID, []) then
            TIQWebLMBase(Owner).FLM_Labels_ID := ALM_Labels_ID
            // assign lm_labels_id if exists
          else
            wwLabels.ListSource.DataSet.Locate('id', TIQWebLMBase(Owner).FLM_Labels_ID, []);
          // restore to default if lm_labels_id does not exist
        end

      else
        begin
          if not BypassChangingLabelToOriginal and
            wwLabels.ListSource.DataSet.Locate('id', ALM_Labels_ID, []) then
            TIQWebLMBase(Owner).FLM_Labels_ID := ALM_Labels_ID
            // assign lm_labels_id if exists
          else
            wwLabels.ListSource.DataSet.Locate('id', TIQWebLMBase(Owner).FLM_Labels_ID, []);
          // restore to default if lm_labels_id does not exist
        end;

    end;

  if (IsReportBuilderUsed or IsLabelTemplateUsed) then
    begin
      TIQWebLMBase(Owner).FReportFile := CRWReportName;
      // wwLabels.LookUpTable.FieldByName('REPORT_NAME').asString;
      if not FAccumulateMultipleRecordsBeforePrinting or
        FAccumulateMultipleRecordsBeforePrinting and
        (FAccumulateMultipleRecordsCount <= 1) then
        TIQWebLMBase(Owner).FBatch := GetNextSequenceNumber('S_LM_DBF');
    end
  else
    begin
      TIQWebLMBase(Owner).LabelFile := wwLabels.ListSource.DataSet.FieldByName
        ('LABEL_FILE').asString;
      if not FAccumulateMultipleRecordsBeforePrinting or
        FAccumulateMultipleRecordsBeforePrinting and
        (FAccumulateMultipleRecordsCount <= 1) then
        TIQWebLMBase(Owner).DBFFile := IQFormat('X%.0f.DBF',
          [GetNextSequenceNumber('S_LM_DBF')]); { X1234.DBF }
    end;

  TIQWebLMBase(Owner).RemoteServer := wwLabels.ListSource.DataSet.FieldByName
    ('REMOTE_SERVER').asString;
  TIQWebLMBase(Owner).Comm_Port := wwLabels.ListSource.DataSet.FieldByName
    ('COMM_PORT').asString;

  // TLMBase(Owner).LabelFile  := TFDQuery(DM.SrcLabels.DataSet).FieldByName('LABEL_FILE').asString;
  TIQWebLMBase(Owner).LabelDate := dDate;
  AssignQuantity;
  TIQWebLMBase(Owner).LabelQty := TIQWebLMBase(Owner).TBoxNo;
  TIQWebLMBase(Owner).FLotNo := edLotNo.Text;

  TIQWebLMBase(Owner).FInv_CUser1 := dbeCUSER1.Text;
  TIQWebLMBase(Owner).FInv_CUser2 := dbeCUSER2.Text;
  TIQWebLMBase(Owner).FInv_CUser3 := dbeCUSER3.Text;
  TIQWebLMBase(Owner).FInv_CUser4 := dbeCUSER4.Text;
  TIQWebLMBase(Owner).FInv_CUser5 := dbeCUSER5.Text;
  TIQWebLMBase(Owner).FInv_CUser6 := dbeCUSER6.Text;
  TIQWebLMBase(Owner).FInv_CUser7 := dbeCUSER7.Text;
  TIQWebLMBase(Owner).FInv_CUser8 := dbeCUSER8.Text;
  TIQWebLMBase(Owner).FInv_CUser9 := dbeCUSER9.Text;
  TIQWebLMBase(Owner).FInv_CUser10 := dbeCUSER10.Text;

  TIQWebLMBase(Owner).FInv_NUser1 := StrToFloatDef(dbeNUSER1.Text);
  TIQWebLMBase(Owner).FInv_NUser2 := StrToFloatDef(dbeNUSER2.Text);
  TIQWebLMBase(Owner).FInv_NUser3 := StrToFloatDef(dbeNUSER3.Text);
  TIQWebLMBase(Owner).FInv_NUser4 := StrToFloatDef(dbeNUSER4.Text);
  TIQWebLMBase(Owner).FInv_NUser5 := StrToFloatDef(dbeNUSER5.Text);
  TIQWebLMBase(Owner).FInv_NUser6 := StrToFloatDef(dbeNUSER6.Text);
  TIQWebLMBase(Owner).FInv_NUser7 := StrToFloatDef(dbeNUSER7.Text);
  TIQWebLMBase(Owner).FInv_NUser8 := StrToFloatDef(dbeNUSER8.Text);
  TIQWebLMBase(Owner).FInv_NUser9 := StrToFloatDef(dbeNUSER9.Text);
  TIQWebLMBase(Owner).FInv_NUser10 := StrToFloatDef(dbeNUSER10.Text);

  if SecurityManager.EPlantsExist then
    if SecurityManager.EPlant_ID <> 'NULL' then
      TIQWebLMBase(Owner).FEplant_Id := StrToFloat(SecurityManager.EPlant_ID);

  TIQWebLMBase(self.Owner).Flabel_date := dDate;

//  TIQWebLMBase(self.Owner).CountryOfOrigin := IQUDComboBoxCountryOfOrigin.Text;

  { 04-26-2007 when reprinting assign orderno, pono from the master_label to preserve it }
  if FPrintExist_Master_Label_ID > 0 then
    OnReprintAssignVarsFromMasterLabel;
end;

procedure TFrmLM_Base.OnReprintAssignVarsFromMasterLabel;
var
  AQuery: TFDQuery;
begin
  AQuery := TFDQuery.Create(nil);
  // Do not use "with"
  try
    AQuery.ConnectionName := 'IQFD';
    AQuery.SQL.Add('select orderno,          ');
    AQuery.SQL.Add('       pono,             ');
    AQuery.SQL.Add('       inv_cuser1,       ');
    AQuery.SQL.Add('       inv_cuser2,       ');
    AQuery.SQL.Add('       inv_cuser3,       ');
    AQuery.SQL.Add('       inv_cuser4,       ');
    AQuery.SQL.Add('       inv_cuser5,       ');
    AQuery.SQL.Add('       inv_cuser6,       ');
    AQuery.SQL.Add('       inv_cuser7,       ');
    AQuery.SQL.Add('       inv_cuser8,       ');
    AQuery.SQL.Add('       inv_cuser9,       ');
    AQuery.SQL.Add('       invcuser10,       ');
    AQuery.SQL.Add('       inv_nuser1,       ');
    AQuery.SQL.Add('       inv_nuser2,       ');
    AQuery.SQL.Add('       inv_nuser3,       ');
    AQuery.SQL.Add('       inv_nuser4,       ');
    AQuery.SQL.Add('       inv_nuser5,       ');
    AQuery.SQL.Add('       inv_nuser6,       ');
    AQuery.SQL.Add('       inv_nuser7,       ');
    AQuery.SQL.Add('       inv_nuser8,       ');
    AQuery.SQL.Add('       inv_nuser9,       ');
    AQuery.SQL.Add('       invnuser10,       ');
    AQuery.SQL.Add('       pressno,          ');
    AQuery.SQL.Add('       prod_date,        ');
    AQuery.SQL.Add('       standard_id,      ');
    AQuery.SQL.Add('       packslipno        ');
    AQuery.SQL.Add('  from master_label      ');
    AQuery.SQL.Add(Format(' where id = %.0f  ',[FPrintExist_Master_Label_ID]));
    AQuery.Open;
    if not (AQuery.Bof and AQuery.Eof) then
      begin
        if Trim(TIQWebLMBase(self.Owner).FOrder_No) = '' then
          TIQWebLMBase(self.Owner).FOrder_No := AQuery.Fields[0].AsString;

        if TIQWebLMBase(Owner).FLabelType = 'MANUFACTURED' then
          begin
            if Trim(TIQWebLMBase(self.Owner).FPono) = '' then
              TIQWebLMBase(self.Owner).FPono := AQuery.Fields[1].AsString;
          end

        else if TIQWebLMBase(Owner).FLabelType = 'PURCHASED' then
          begin
            if Trim(TIQWebLMBase(self.Owner).FPoNoRec) = '' then
              TIQWebLMBase(self.Owner).FPoNoRec := AQuery.Fields[1].AsString;
          end;

        TIQWebLMBase(self.Owner).FInv_CUser1 := AQuery.Fields[2].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser2 := AQuery.Fields[3].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser3 := AQuery.Fields[4].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser4 := AQuery.Fields[5].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser5 := AQuery.Fields[6].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser6 := AQuery.Fields[7].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser7 := AQuery.Fields[8].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser8 := AQuery.Fields[9].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser9 := AQuery.Fields[10].AsString;
        TIQWebLMBase(self.Owner).FInv_CUser10 := AQuery.Fields[11].AsString;

        TIQWebLMBase(self.Owner).FInv_NUser1 := AQuery.Fields[12].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser2 := AQuery.Fields[13].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser3 := AQuery.Fields[14].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser4 := AQuery.Fields[15].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser5 := AQuery.Fields[16].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser6 := AQuery.Fields[17].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser7 := AQuery.Fields[18].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser8 := AQuery.Fields[19].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser9 := AQuery.Fields[20].AsFloat;
        TIQWebLMBase(self.Owner).FInv_NUser10 := AQuery.Fields[21].AsFloat;

        TIQWebLMBase(self.Owner).Eqno := AQuery.FieldByName('pressno').AsString;

        if not AQuery.FieldByName('prod_date').IsNull and
          (AQuery.FieldByName('prod_date').AsFloat > 1) then
        // if not VarIsNull(Fields[23]) and (Fields[23] > 0) then
          TIQWebLMBase(self.Owner).Fprod_date := AQuery.FieldByName('prod_date').AsDateTime;

        // 08-06-2010 - restore standard_id we used to print this label
        TIQWebLMBase(self.Owner).Standard_ID := AQuery.FieldByName('standard_id').AsLargeInt;

        TIQWebLMBase(self.Owner).FPackslipNo := AQuery.FieldByName('packslipno').AsString;
      end;
  finally
    FreeAndNil(AQuery);
  end;
end;

function TFrmLM_Base.StrToFloatDef(S: string): Real;
begin
  if not IQMS.Common.Numbers.IsStringValidFloat(S, Result) then
    Result := 0;
end;

procedure TFrmLM_Base.AssignQuantity;
var
  AQty: Real;
begin
  if not IQMS.Common.Numbers.IsStringValidFloat(EditQty.Text, AQty) then
    AQty := 0;
  TIQWebLMBase(Owner).Quantity := AQty;
end;

procedure TFrmLM_Base.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLM_Base.SBNewLabelClick(Sender: TObject);
begin
  DoLabelMaintenance;
  wwLabels.ListSource.DataSet.Close;
  wwLabels.ListSource.DataSet.Open;
  wwLabels.Text := DM.QryLabelCust.FieldByName('LABEL_MENU_NAME').asString;
end;

function TFrmLM_Base.DirWhereDBFGoes: string;
begin
  Result := SelectValueAsString('select LM_DIRECTORY from PARAMS');
  if Result = '' then
    IQWarning(IQMS.WebVcl.ResourceStrings.
      cTXT0000114 { 'Label Matrix directory is undefined.' } );

  //EIQ-1460 Label Maint. Directory Does not use unc paths correctly.
  Result := IncludeTrailingPathDelimiter(Result);
end;

procedure TFrmLM_Base.CreateDbfTable;
begin
  CheckIntegrityArinvt;
  CheckIntegrityArinvtMfgNo;

  if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
    CreateEmptyDbfFile;

  if TIQWebLMBase(Owner).FLabelType = 'MANUFACTURED' then
    AssignManufacturedValues(TIQWebLMBase(Owner).FLabelFile)
  else if TIQWebLMBase(Owner).FLabelType = 'PURCHASED' then
    AssignPurchasedValues(TIQWebLMBase(Owner).FLabelFile)
  else
    AssignLoadValues(TIQWebLMBase(Owner).FLabelFile)
end;

procedure TFrmLM_Base.CreateEmptyDbfFile;
var
  ALabelFileName, AFileName: string;
  Qry: TFDQuery;
  ATable: TFDTable;
begin
  ALabelFileName := TIQWebLMBase(Owner).DBFFile; // TIQWebLMBase(Owner).FLabelFile;
  with DM.QrylabelDtl do
    begin
      Close;
      AssignQueryParamValue(DM.QrylabelDtl, 'nId',
        wwLabels.ListSource.DataSet.FieldByName('ID').AsLargeInt);
      Open;
      if Eof and Bof
      { 'Incomplete Label Information.  ' + #13 +
        'Please execute the Create DBF File option ' +
        '(when positioned on that label) in the Label Maintenance form.' }
      then
        raise Exception.Create(cTXT0000115);
    end;

  { do not erase the dbf is we are in FAccumulateMultipleRecordsBeforePrinting mode }
  if FAccumulateMultipleRecordsBeforePrinting and
    (FAccumulateMultipleRecordsCount > 1) and
    FileExists(DirWhereDBFGoes + ALabelFileName) then
    EXIT;

  // Create the empty DBF
  // Pass var ALabelFileName to override the default file name
  TLMCreateDBF.CreateEmptyDbfFile(
    wwLabels.ListSource.DataSet.FieldByName('ID').AsLargeInt, False, ALabelFileName);
(*
  Qry := TFDQuery.Create(nil);
  with Qry do
    try
      Connection := GetDBFConnection;
      AFileName := IncludeTrailingPathDelimiter(DirWhereDBFGoes) + ALabelFileName;
      if FileExists(AFileName) then
        DeleteFile(AFileName);


      SQL.Clear;
      SQL.Add(Format('create table ''%s''', [ALabelFileName]));
      SQL.Add('(');
      while not DM.QrylabelDtl.Eof do
        begin
          if (DM.QrylabelDtl.FieldByName('FIELD_TYPE')
            .asString = 'Character') then
            SQL.Add(Format('%s %s(%d),',
              [DM.QrylabelDtl.FieldByName('FIELD_NAME').asString,
              DM.QrylabelDtl.FieldByName('FIELD_TYPE').asString,
              DM.QrylabelDtl.FieldByName('WIDTH').asInteger]))
          else if (DM.QrylabelDtl.FieldByName('FIELD_TYPE')
            .asString = 'Numeric') then
            SQL.Add(Format('%s %s(%d, %d),',
              [DM.QrylabelDtl.FieldByName('FIELD_NAME').asString,
              DM.QrylabelDtl.FieldByName('FIELD_TYPE').asString,
              DM.QrylabelDtl.FieldByName('WIDTH').asInteger,
              DM.QrylabelDtl.FieldByName('DEC').asInteger]))
          else
            SQL.Add(Format('%s %s,', [DM.QrylabelDtl.FieldByName('FIELD_NAME')
              .asString,
              DM.QrylabelDtl.FieldByName('FIELD_TYPE').asString]));

          DM.QrylabelDtl.Next;
        end;
      SQL[SQL.Count - 1] := Copy(SQL[SQL.Count - 1], 1,
        Length(SQL[SQL.Count - 1]) - 1);
      SQL.Add(')');

      try
        ExecSQL;
      except
        Application.ShowException(Exception(ExceptObject));
        ABORT;
      end;

    finally
      Free;
    end;
*)
end;

procedure TFrmLM_Base.CheckIntegrityArinvt;
var
  a: Variant;
begin
  { check Arinvt_ID matching class, rev, desc. For now check only Arinvt_ID > 0 }
  with TIQWebLMBase(self.Owner) do
    if FArinvt_ID > 0 then
      begin
        a := SelectValueArrayFmt
          ('select class, itemno, rev, descrip from arinvt where id = %f',
          [FArinvt_ID]);
        IQAssert(VarArrayDimCount(a) > 0,
          Format('Unable to find arinvt id = %.0f', [FArinvt_ID]));

        IQAssert(CompareText(Trim(FClass), Trim(a[0])) = 0,
          Format(IQMS.WebVcl.ResourceStrings.
          cTXT0000116 { 'Class %s of ARINVT ID, %.0f, does not match the internal value, %s.' } ,
          [a[0], FArinvt_ID, FClass]));
        IQAssert(CompareText(Trim(FPart_No), Trim(a[1])) = 0,
          Format(IQMS.WebVcl.ResourceStrings.
          cTXT0000117 { 'Item # %s of ARINVT ID, %.0f, does not match the internal value, %s.' } ,
          [a[1], FArinvt_ID, FPart_No]));
        IQAssert(CompareText(Trim(FRev), Trim(a[2])) = 0,
          Format(IQMS.WebVcl.ResourceStrings.
          cTXT0000118 { 'Revision %s of ARINVT ID, %.0f, does not match the internal value, %s.' } ,
          [a[2], FArinvt_ID, FRev]));
        IQAssert(CompareText(Trim(FPart_desc), Trim(a[3])) = 0,
          Format(IQMS.WebVcl.ResourceStrings.
          cTXT0000119 { 'Description %s of ARINVT ID, %.0f, does not match the internal value, %s.' } ,
          [a[3], FArinvt_ID, FPart_desc]));
      end;
end;

procedure TFrmLM_Base.CheckIntegrityArinvtMfgNo;
begin
  with TIQWebLMBase(self.Owner) do
    if (FArinvt_ID > 0) and (Trim(FMoldno) > '') then
      begin
        IQAssert(SelectValueFmtAsFloat
          ('select 1 from standard s, partno p where p.arinvt_id = %f and p.standard_id = s.id and RTrim(TrimLeft(s.mfgno)) = ''%s''',
          [FArinvt_ID, StrTran(Trim(FMoldno), '''', '''''')]) = 1,
          // 'MFG # %s does not belong to Item # %s of ARINVT ID, %.0f.'
          Format(IQMS.WebVcl.ResourceStrings.cTXT0000120, [Trim(FMoldno), FPart_No,
          FArinvt_ID]));
      end;
end;

procedure TFrmLM_Base.CheckSICNegativeQty(AQty: Real);
var
  a: Variant;
  AArinvt_ID: Real;
begin
  if FPrintExist_Master_Label_ID > 0 then
    EXIT;

  if not IsSIC() then
    EXIT;

  IQAssert(AQty >= 0,
    IQMS.WebVcl.ResourceStrings.
    cTXT0000375 { 'SIC Inventory item - negative qty is not allowed. Operation aborted.' } );
end;

procedure TFrmLM_Base.CheckUpdateDispoScan(const AMasterLabelID: Real);
var
  ALabelDispositionSetting: TLabelDispositionSetting;
begin
  //EIQ-3206 New label kind called NONSERIAL - Wilbert Plastics 06-23-14 AB
  if Label_KindNonSerial or (IsForeignYN() = 'Y') then
     EXIT;
  // If we are showing the combo box, then either take the combo box
  // setting or get the system setting.  This is in fulfillment of
  // "RE: Labels - add override to global print all labels as
  // dispositioned - SER 3571".
  if (AMasterLabelID > 0) and (ShowLabelDispositionSetting) then
    begin
      // Get the setting that has been set by the end-user
      ALabelDispositionSetting :=
        GetLabelDispositionSettingComboBox
        (self.cmbLabelDispositionSetting);
      // Determine if we need to modify the DISPO_SCAN value.  If the
      // selection is set to ldsSystemDefault, then we do nothing;
      // we leave the field alone because the trigger modifies this
      // for us.  This code here is basically an override of the
      // default system setting.
      case ALabelDispositionSetting of
        ldsDispositioned:
          ExecuteCommandFmt(
            'UPDATE master_label SET dispo_scan = ''Y'' WHERE id = %.0f',
            [AMasterLabelID]);
        ldsNonDispositioned:
          ExecuteCommandFmt(
            'UPDATE master_label SET dispo_scan = ''N'' WHERE id = %.0f',
            [AMasterLabelID]);
      end;
    end;
end;

function TFrmLM_Base.IsSIC: Boolean;
begin
  Result:= TIQWebLMBase(self.Owner).IsSIC;
  // Result := SelectValueFmtAsString('select is_linked_to_serial from arinvt where id = %f',
  //   [TLMBase(self.Owner).FArinvt_ID]) = 'Y';
end;

function TFrmLM_Base.GetDBFConnection: TFDConnection;
begin
  if not Assigned(FDBFConnection) then
    FDBFConnection := TFDConnection.Create(nil);
  ConfigureLabelMatrixDBFConnection(FDBFConnection);
  Result := FDBFConnection;
end;

procedure TFrmLM_Base.InitOpenDataSet(ATable: TFDTable);
begin
  with ATable do
    if (IsReportBuilderUsed or IsLabelTemplateUsed) then
      begin
        ConnectionName := 'IQFD';
        TableName := 'LMINVTRY';
        UpdateOptions.KeyFields := 'ID';
        Open;
        FieldByName('ID').Required := FALSE;
      end
    else
      begin
        Connection := GetDBFConnection;
        TableName := FileNameNoExt(TIQWebLMBase(self.Owner).DBFFile);
        Open;
      end;
end;

procedure TFrmLM_Base.SafeAssign(ADataSet: TDataSet; AFieldName: string;
  AFieldType: TFieldType; AValue: Variant);
var
  AField: TField;
begin
  AField := ADataSet.FindField(AFieldName);
  if Assigned(AField) then
  try
    // NULL
    if System.Variants.VarIsNull(AValue) or
      System.Variants.VarIsEmpty(AValue) then
      AField.Clear
    // Float
    else if (AFieldType in [ftFloat, ftFMTBcd, ftExtended]) then
      AField.AsFloat := System.Variants.VarAsType(AValue, varDouble)
    // Currency
    else if (AFieldType in [ftCurrency]) then
      AField.AsFloat := System.Variants.VarAsType(AValue, varCurrency)
    // BCD and Int64 (long)
    else if (AFieldType in [ftAutoInc, ftLargeint, ftBCD]) then
      AField.AsLargeInt := System.Variants.VarAsType(AValue, varInt64)
    // Integer
    else if (AFieldType in [ftInteger]) then
      AField.AsInteger := System.Variants.VarAsType(AValue, varInteger)
    // Single
    else if (AFieldType in [ftSingle]) then
      AField.AsInteger := System.Variants.VarAsType(AValue, varSingle)
    // Long Word
    else if (AFieldType in [ftLongWord]) then
      AField.AsInteger := System.Variants.VarAsType(AValue, varLongWord)
    // Small Integer
    else if (AFieldType in [ftSmallint]) then
      AField.AsInteger := System.Variants.VarAsType(AValue, varSmallint)
    // Word
    else if (AFieldType in [ftWord]) then
      AField.AsInteger := System.Variants.VarAsType(AValue, varWord)
    // Short Integer
    else if (AFieldType in [ftShortint]) then
      AField.AsInteger := System.Variants.VarAsType(AValue, varShortInt)
    // Byte
    else if (AFieldType in [ftByte]) then
      AField.AsInteger := System.Variants.VarAsType(AValue, varByte)
    // Date/Time
    else if (AFieldType in [ftDate, ftTime, ftDateTime, ftTimeStamp,
      ftOraTimeStamp]) then
      AField.AsDateTime := System.Variants.VarAsType(AValue, varDate)
    // String
    else
      AField.AsString := System.Variants.VarToStr(AValue);
  except on E: Exception do
    raise Exception.CreateFmt(
      'Encountered error assigning field value:'#13 +
      '%s'#13 +
      'Field Name = %s',
      [E.Message,
      AFieldName]);
  end;
end;

procedure TFrmLM_Base.AssignLoadValues(cName: string);
var
  ATable: TFDTable;
  AValidReceivedDate:Real;
begin
  ATable := TFDTable.Create(self);
  with ATable do
    try
      InitOpenDataSet(ATable); { Assign DatabaseName and TableName }
      Insert;

      if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
        CheckField('cserial', ATable);

      if not Label_KindNonSerial then
        SafeAssign(ATable, 'master_label_id', ftFloat, TIQWebLMBase(self.Owner).Fserial);
      SafeAssign(ATable, 'timestamp', ftDateTime, Now);
      SafeAssign(ATable, 'batch', ftFloat, TIQWebLMBase(self.Owner).FBatch);

      if not Label_KindNonSerial then
      begin
      SafeAssign(ATable, 'cserial', ftString, TIQWebLMBase(self.Owner).FCserial);
      SafeAssign(ATable, 'serial', ftFloat, TIQWebLMBase(self.Owner).Fserial);
      end;
      SafeAssign(ATable, 'DESCRIP', ftString, TIQWebLMBase(self.Owner).FPart_desc);
      SafeAssign(ATable, 'LBL_DATE', ftDateTime, Date);

      if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
        begin
          CheckField('Inv_CUser4', ATable);
          CheckField('Inv_CUser5', ATable);
          CheckField('Inv_CUser6', ATable);
          CheckField('Inv_CUser7', ATable);
          CheckField('Inv_CUser8', ATable);
          CheckField('Inv_CUser9', ATable);
          CheckField('InvCUser10', ATable);

          CheckField('Inv_NUser4', ATable);
          CheckField('Inv_NUser5', ATable);
          CheckField('Inv_NUser6', ATable);
          CheckField('Inv_NUser7', ATable);
          CheckField('Inv_NUser8', ATable);
          CheckField('Inv_NUser9', ATable);
          CheckField('InvNUser10', ATable);
        end;

      SafeAssign(ATable, 'Inv_CUser1', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser1);
      SafeAssign(ATable, 'Inv_CUser2', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser2);
      SafeAssign(ATable, 'Inv_CUser3', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser3);
      SafeAssign(ATable, 'Inv_CUser4', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser4);
      SafeAssign(ATable, 'Inv_CUser5', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser5);
      SafeAssign(ATable, 'Inv_CUser6', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser6);
      SafeAssign(ATable, 'Inv_CUser7', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser7);
      SafeAssign(ATable, 'Inv_CUser8', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser8);
      SafeAssign(ATable, 'Inv_CUser9', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser9);
      SafeAssign(ATable, 'InvCUser10', ftString,
        TIQWebLMBase(self.Owner).FInv_CUser10);

      SafeAssign(ATable, 'Inv_NUser1', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser1);
      SafeAssign(ATable, 'Inv_NUser2', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser2);
      SafeAssign(ATable, 'Inv_NUser3', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser3);
      SafeAssign(ATable, 'Inv_NUser4', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser4);
      SafeAssign(ATable, 'Inv_NUser5', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser5);
      SafeAssign(ATable, 'Inv_NUser6', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser6);
      SafeAssign(ATable, 'Inv_NUser7', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser7);
      SafeAssign(ATable, 'Inv_NUser8', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser8);
      SafeAssign(ATable, 'Inv_NUser9', ftFloat, TIQWebLMBase(self.Owner).FInv_NUser9);
      SafeAssign(ATable, 'InvNUser10', ftFloat, TIQWebLMBase(self.Owner)
        .FInv_NUser10);

      SafeAssign(ATable, 'countryorg', ftString,
        TIQWebLMBase(self.Owner).CountryOfOrigin);
      SafeAssign(ATable, 'packslipno', ftString,
        TIQWebLMBase(self.Owner).FPackslipNo);

      AValidReceivedDate := 0;
      if TIQWebLMBase(self.Owner).FDateReceived > Date - 10000 then
      begin
         SafeAssign( ATable, 'DATE_RECEIVED', ftDateTime, TIQWebLMBase(self.Owner).FDateReceived );
        AValidReceivedDate := 1;
      end;

      CheckAssignRejectFields(ATable);

      Post;
      if not Label_KindNonSerial then
      begin
      ExecuteCommandFmt('insert into MASTER_LABEL ' +
        '(id, ' +
        'descrip, ' +
        'print_date, ' +
        'serial, ' +
        'noship, ' +
        'packslipno, ' +
        'DATE_RECEIVED, ' +
        'badgeno ) ' +
        'values ' +
        '(%f, ' +
        '''%s'', ' +
        'To_Date(''%s'', ''MM/DD/RRRR''), ' +
        '''%s'', ' +
        '''%s'', ' +
        '''%s'', ' +
        'decode(%f, 0, null, IQMS.Common.Miscellaneous.str_to_date(''%s'')), ' +
        '''%s'' ) ',
        [TIQWebLMBase(self.Owner).Fserial,
        StrTran(TIQWebLMBase(self.Owner).FPart_desc, '''', ''''''),
        FormatDateTime('mm/dd/yyyy', Date),
        TIQWebLMBase(self.Owner).FCserial,
        IIf(IsLabel_KindNoShip, 'Y', ''),
        TIQWebLMBase(self.Owner).FPackslipNo,
        AValidReceivedDate,
        FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FDateReceived),
        FBadgeNo]);
      CheckUpdateDispoScan(TIQWebLMBase(self.Owner).Fserial);
      end;
      // ProcessExec;
    finally
      Free;
    end;
end;

procedure TFrmLM_Base.AssignManufacturedValues(cName: string);
var
  i, j: Integer;
  ATable: TFDTable;
  AQtyInBox: Real;
  ALabelsCount: Integer;
  ABeforePrintRec: TBeforePrintRec;
  APrevPromptPrint0: Boolean;
  AHasAEncountered0: Boolean;
  AIsMixedPallet: Boolean;
  ADate: TDateTime;
  AValidReceivedDate:Real;
begin
  APrevPromptPrint0 := FALSE;
  AHasAEncountered0 := FALSE;
  AIsMixedPallet := FALSE;

  ALabelsCount := TIQWebLMBase(self.Owner).FTBoxNo;

  if Assigned(OnGetTotalLabelsCount) then
    OnGetTotalLabelsCount(ALabelsCount);

  if Assigned(OnBeforeMasterLabelInsert) then
    begin
      OnBeforeMasterLabelInsert(ABeforePrintRec);
      TIQWebLMBase(self.Owner).FBaseno := ABeforePrintRec.Eqno;
      TIQWebLMBase(self.Owner).Fprod_date := ABeforePrintRec.ProdDate;
      TIQWebLMBase(self.Owner).FPressno := ABeforePrintRec.PressNo;
      TIQWebLMBase(self.Owner).FCntr_Desc :=
        SelectValueStrParam('SELECT cntr_desc FROM work_center WHERE TRIM(eqno) = TRIM(:EQNO)',
        ['EQNO'], [TIQWebLMBase(self.Owner).FPressno]);
    end;

  ATable := TFDTable.Create(self);
  with ATable do
    try
      InitOpenDataSet(ATable); { Assign DatabaseName and TableName }
      j := TIQWebLMBase(self.Owner).FBoxno;
      for i := j to (j - 1 + TIQWebLMBase(self.Owner).FTBoxNo) do
        begin
          if not IsCreatingCopyOfLabel(i - j + 1) then
            if not CheckAdjustQty(i - j + 1, TIQWebLMBase(self.Owner).FQuantity,
              AQtyInBox, APrevPromptPrint0, AHasAEncountered0) then
              CONTINUE;

          if FPrintExist_Master_Label_ID > 0 then
            TIQWebLMBase(self.Owner).FBoxno := SelectValueByID('boxno', 'master_label',
              FPrintExist_Master_Label_ID)
          else if not IsCreatingCopyOfLabel(i - j + 1) then
            TIQWebLMBase(self.Owner).FBoxno := i;

          //Prevents Nonserial labels from burning a master_label ID - AB 06-26-14
          if Label_KindNonSerial then
            TIQWebLMBase(self.Owner).Fserial:= 0
          else if FPrintExist_Master_Label_ID > 0 then
            TIQWebLMBase(self.Owner).Fserial := FPrintExist_Master_Label_ID
          else if not IsCreatingCopyOfLabel(i - j + 1) then
            TIQWebLMBase(self.Owner).Fserial := GetNextID('MASTER_LABEL');

          TIQWebLMBase(self.Owner).FNoShip:= IIf(IsLabel_KindNoShip, 'Y', '');

          CheckReprintEnsureValuesMatchMasterLabel(FPrintExist_Master_Label_ID);
          CheckSICNegativeQty(AQtyInBox);

          if FPrintExist_Master_Label_ID > 0 then
            AIsMixedPallet := CheckPopulateMixedPalletFields
              (FPrintExist_Master_Label_ID, AQtyInBox);

          if (FPrintExist_Master_Label_ID > 0) and Assigned( OnBeforeRePrintLabel ) then
             OnBeforeRePrintLabel( self, FPrintExist_Master_Label_ID );

          Insert;
          if not Label_KindNonSerial then
            SafeAssign(ATable, 'master_label_id', ftFloat, TIQWebLMBase(self.Owner).Fserial);
          SafeAssign(ATable, 'timestamp', ftDateTime, Now);
          SafeAssign(ATable, 'batch', ftFloat, TIQWebLMBase(self.Owner).FBatch);

          SafeAssign(ATable, 'part_no', ftString, TIQWebLMBase(self.Owner).FPart_No);
          SafeAssign(ATable, 'part_desc', ftString,
            TIQWebLMBase(self.Owner).FPart_desc);
          SafeAssign(ATable, 'quantity', ftFloat,
            AQtyInBox { TLMBase(Self.Owner).FQuantity } );
          SafeAssign(ATable, 'rev', ftString, TIQWebLMBase(self.Owner).FRev);
          SafeAssign(ATable, 'moldno', ftString, TIQWebLMBase(self.Owner).FMoldno);
          SafeAssign(ATable, 'order_no', ftString,
            TIQWebLMBase(self.Owner).FOrder_No);
          SafeAssign(ATable, 'pono', ftString, TIQWebLMBase(self.Owner).FPono);
          SafeAssign(ATable, 'cust_no', ftString, TIQWebLMBase(self.Owner).FCust_no);
          SafeAssign(ATable, 'customer', ftString,
            NVL(TIQWebLMBase(self.Owner).FShipName, TIQWebLMBase(self.Owner).FCustomer));
          SafeAssign(ATable, 'address1', ftString,
            TIQWebLMBase(self.Owner).FAddress1);
          SafeAssign(ATable, 'address2', ftString,
            TIQWebLMBase(self.Owner).FAddress2);
          SafeAssign(ATable, 'address3', ftString,
            TIQWebLMBase(self.Owner).FAddress3);
          SafeAssign(ATable, 'city_st_zp', ftString,
            TIQWebLMBase(self.Owner).FCity_st_zp);
          SafeAssign(ATable, 'country', ftString, TIQWebLMBase(self.Owner).FCountry);
          SafeAssign(ATable, 'material', ftString,
            TIQWebLMBase(self.Owner).FMaterial);
          SafeAssign(ATable, 'vendor', ftString, TIQWebLMBase(self.Owner).FVendor1);
          SafeAssign(ATable, 'fg_lotno', ftString, TIQWebLMBase(self.Owner).FLotNo);
          SafeAssign(ATable, 'baseno', ftString, TIQWebLMBase(self.Owner).FBaseno);
          SafeAssign(ATable, 'pressno', ftString, TIQWebLMBase(self.Owner).Eqno);
          SafeAssign(ATable, 'cntr_desc', ftString,
            TIQWebLMBase(self.Owner).Cntr_Desc);
          SafeAssign(ATable, 'boxno', ftInteger,
            TIQWebLMBase(self.Owner).FBoxno mod 10000);
          { make sure we don't go over 9999 }
          SafeAssign(ATable, 'part_no2', ftString, TIQWebLMBase(self.Owner).Part_No2);
          SafeAssign(ATable, 'quantity2', ftString,
            TIQWebLMBase(self.Owner).Quantity2);
          SafeAssign(ATable, 'rev2', ftString, TIQWebLMBase(self.Owner).Rev2);
          SafeAssign(ATable, 'moldno2', ftString, TIQWebLMBase(self.Owner).MoldNo2);
          SafeAssign(ATable, 'order_no2', ftString,
            TIQWebLMBase(self.Owner).Order_no2);
          SafeAssign(ATable, 'pono2', ftString, TIQWebLMBase(self.Owner).PoNo2);
          SafeAssign(ATable, 'cust_no2', ftString, TIQWebLMBase(self.Owner).Cust_no2);
          SafeAssign(ATable, 'fg_lotno2', ftString,
            TIQWebLMBase(self.Owner).GetLotNo2);
          SafeAssign(ATable, 'boxno2', ftString, TIQWebLMBase(self.Owner).Boxno2);
          SafeAssign(ATable, 'ord_quan', ftFloat, TIQWebLMBase(self.Owner).Ford_quan);
          SafeAssign(ATable, 'aka_ptno', ftString,
            TIQWebLMBase(self.Owner).FAka_ptno);
          SafeAssign(ATable, 'aka_ptno2', ftString,
            TIQWebLMBase(self.Owner).Aka_ptno2);
          SafeAssign(ATable, 'aka_desc', ftString,
            TIQWebLMBase(self.Owner).FAka_desc);
          SafeAssign(ATable, 'aka_c4', ftString, TIQWebLMBase(self.Owner).FAka_C4);

          SafeAssign(ATable, 'pck_wght', ftFloat, TIQWebLMBase(self.Owner).FPck_wght);
          SafeAssign(ATable, 'pck_wght2', ftString,
            TIQWebLMBase(self.Owner).Pck_wght2);
          if not Label_KindNonSerial then
          SafeAssign(ATable, 'serial', ftFloat, CheckPrintExist_Serial);
          // TLMBase(Self.Owner).Fserial         );
          SafeAssign(ATable, 'zipcode', ftString, TIQWebLMBase(self.Owner).FZipcode);
          SafeAssign(ATable, 'vendor_2', ftString, TIQWebLMBase(self.Owner).FVendor2);
          SafeAssign(ATable, 'series', ftString, TIQWebLMBase(self.Owner).FSeries);
          SafeAssign(ATable, 'tboxno', ftInteger, ALabelsCount);
          // TLMBase(Self.Owner).FTBoxno         );
          SafeAssign(ATable, 'billname', ftString,
            TIQWebLMBase(self.Owner).FBillname);
          SafeAssign(ATable, 'billadd', ftString, TIQWebLMBase(self.Owner).FBilladd);
          SafeAssign(ATable, 'billadd2', ftString,
            TIQWebLMBase(self.Owner).FBilladd2);
          SafeAssign(ATable, 'billadd3', ftString,
            TIQWebLMBase(self.Owner).FBilladd3);
          SafeAssign(ATable, 'billcityst', ftString,
            TIQWebLMBase(self.Owner).FBillcityst);
          SafeAssign(ATable, 'billzip', ftString, TIQWebLMBase(self.Owner).FBillzip);
          SafeAssign(ATable, 'ecno', ftString, TIQWebLMBase(self.Owner).FEcno);
          SafeAssign(ATable, 'lbl_time', ftString, Copy(TimeToStr(Time), 1, 8));
          SafeAssign(ATable, 'material2', ftString,
            TIQWebLMBase(self.Owner).FMaterial2);

          SafeAssign(ATable, 'part_desc2', ftString,
            TIQWebLMBase(self.Owner).FMaterial2);


          SafeAssign(ATable, 'bcls_item1', ftString,
            TIQWebLMBase(self.Owner).FBlend[1].BlendItem);
          SafeAssign(ATable, 'bcls_item2', ftString,
            TIQWebLMBase(self.Owner).FBlend[2].BlendItem);
          SafeAssign(ATable, 'bcls_item3', ftString,
            TIQWebLMBase(self.Owner).FBlend[3].BlendItem);
          SafeAssign(ATable, 'bcls_item4', ftString,
            TIQWebLMBase(self.Owner).FBlend[4].BlendItem);
          SafeAssign(ATable, 'bcls_item5', ftString,
            TIQWebLMBase(self.Owner).FBlend[5].BlendItem);
          SafeAssign(ATable, 'bldesc1', ftString,
            TIQWebLMBase(self.Owner).FBlend[1].BlendDesc);
          SafeAssign(ATable, 'bldesc2', ftString,
            TIQWebLMBase(self.Owner).FBlend[2].BlendDesc);
          SafeAssign(ATable, 'bldesc3', ftString,
            TIQWebLMBase(self.Owner).FBlend[3].BlendDesc);
          SafeAssign(ATable, 'bldesc4', ftString,
            TIQWebLMBase(self.Owner).FBlend[4].BlendDesc);
          SafeAssign(ATable, 'bldesc5', ftString,
            TIQWebLMBase(self.Owner).FBlend[5].BlendDesc);
          SafeAssign(ATable, 'bld_prcnt1', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[1].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt2', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[2].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt3', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[3].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt4', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[4].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt5', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[5].BlendPrcn);

          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              CheckField('Inv_CUser4', ATable);
              CheckField('Inv_CUser5', ATable);
              CheckField('Inv_CUser6', ATable);
              CheckField('Inv_CUser7', ATable);
              CheckField('Inv_CUser8', ATable);
              CheckField('Inv_CUser9', ATable);
              CheckField('InvCUser10', ATable);

              CheckField('Inv_NUser4', ATable);
              CheckField('Inv_NUser5', ATable);
              CheckField('Inv_NUser6', ATable);
              CheckField('Inv_NUser7', ATable);
              CheckField('Inv_NUser8', ATable);
              CheckField('Inv_NUser9', ATable);
              CheckField('InvNUser10', ATable);
            end;

          SafeAssign(ATable, 'Inv_CUser1', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser1);
          SafeAssign(ATable, 'Inv_CUser2', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser2);
          SafeAssign(ATable, 'Inv_CUser3', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser3);
          SafeAssign(ATable, 'Inv_CUser4', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser4);
          SafeAssign(ATable, 'Inv_CUser5', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser5);
          SafeAssign(ATable, 'Inv_CUser6', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser6);
          SafeAssign(ATable, 'Inv_CUser7', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser7);
          SafeAssign(ATable, 'Inv_CUser8', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser8);
          SafeAssign(ATable, 'Inv_CUser9', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser9);
          SafeAssign(ATable, 'InvCUser10', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser10);

          SafeAssign(ATable, 'Inv_NUser1', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser1);
          SafeAssign(ATable, 'Inv_NUser2', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser2);
          SafeAssign(ATable, 'Inv_NUser3', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser3);
          SafeAssign(ATable, 'Inv_NUser4', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser4);
          SafeAssign(ATable, 'Inv_NUser5', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser5);
          SafeAssign(ATable, 'Inv_NUser6', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser6);
          SafeAssign(ATable, 'Inv_NUser7', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser7);
          SafeAssign(ATable, 'Inv_NUser8', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser8);
          SafeAssign(ATable, 'Inv_NUser9', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser9);
          SafeAssign(ATable, 'InvNUser10', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser10);

          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              SafeAssign(ATable, 'cartonsplt', ftString,
                TIQWebLMBase(self.Owner).F_CARTONS_PALLET);
              SafeAssign(ATable, 'piecescart', ftString,
                TIQWebLMBase(self.Owner).F_PIECES_CARTON);
            end
          else
            begin
              SafeAssign(ATable, 'cartons_pallet', ftString,
                TIQWebLMBase(self.Owner).F_CARTONS_PALLET);
              SafeAssign(ATable, 'pieces_carton', ftString,
                TIQWebLMBase(self.Owner).F_PIECES_CARTON);
            end;

          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              CheckField('cserial', ATable);
              CheckField('DOCKID', ATable);
              CheckField('LINEFEED', ATable);
              CheckField('RESERVELOC', ATable);
              CheckField('SHPTOUSER1', ATable);
              CheckField('SHPTOUSER2', ATable);
              CheckField('division', ATable);
            end;

          if not Label_KindNonSerial then
          SafeAssign(ATable, 'cserial', ftString, CheckPrintExist_CSerial);
          // PadZeroSerial( TLMBase(Self.Owner).Fserial ));   // StrTran(Format('%9s', [IntToStr(Trunc(TLMBase(Self.Owner).Fserial))]), ' ', '0'));
          SafeAssign(ATable, 'serial2', ftString, CheckPrintExist_Serial2);
          // TLMBase(Self.Owner).Serial2    );
          SafeAssign(ATable, 'drawing', ftString, TIQWebLMBase(self.Owner).FDrawing);
          SafeAssign(ATable, 'pl_itemno', ftString,
            TIQWebLMBase(self.Owner).FPL_ItemNo);
          SafeAssign(ATable, 'division', ftString,
            TIQWebLMBase(self.Owner).FDivision);

          SafeAssign(ATable, 'DOCKID', ftString, TIQWebLMBase(self.Owner).FDOCKID);
          SafeAssign(ATable, 'LINEFEED', ftString,
            TIQWebLMBase(self.Owner).FLINEFEED);
          SafeAssign(ATable, 'RESERVELOC', ftString,
            TIQWebLMBase(self.Owner).FRESERVELOC);
          SafeAssign(ATable, 'SHPTOUSER1', ftString,
            TIQWebLMBase(self.Owner).FShipToUser1);
          SafeAssign(ATable, 'SHPTOUSER2', ftString,
            TIQWebLMBase(self.Owner).FShipToUser2);

          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              CheckField('Raw_CUsr1', ATable);
              CheckField('Raw_CUsr2', ATable);
              CheckField('Raw_CUsr3', ATable);
              CheckField('Raw_CUsr4', ATable);
              CheckField('Raw_CUsr5', ATable);
              CheckField('Raw_NUsr1', ATable);
              CheckField('Raw_NUsr2', ATable);
              CheckField('Raw_NUsr3', ATable);
              CheckField('Raw_NUsr4', ATable);
              CheckField('Raw_NUsr5', ATable);
              CheckField('eplant_id', ATable);
              CheckField('label_date', ATable);
              CheckField('prod_date', ATable);
              CheckField('raw_mat_ex', ATable);
              CheckField('Class', ATable);
              CheckField('ptwt', ATable);
              CheckField('shift', ATable);
            end;

          SafeAssign(ATable, 'Raw_CUsr1', ftString,
            TIQWebLMBase(self.Owner).FRaw_CUsr1);
          SafeAssign(ATable, 'Raw_CUsr2', ftString,
            TIQWebLMBase(self.Owner).FRaw_CUsr2);
          SafeAssign(ATable, 'Raw_CUsr3', ftString,
            TIQWebLMBase(self.Owner).FRaw_CUsr3);
          SafeAssign(ATable, 'Raw_CUsr4', ftString,
            TIQWebLMBase(self.Owner).FRaw_CUsr4);
          SafeAssign(ATable, 'Raw_CUsr5', ftString,
            TIQWebLMBase(self.Owner).FRaw_CUsr5);

          SafeAssign(ATable, 'Raw_NUsr1', ftFloat,
            TIQWebLMBase(self.Owner).FRaw_NUsr1);
          SafeAssign(ATable, 'Raw_NUsr2', ftFloat,
            TIQWebLMBase(self.Owner).FRaw_NUsr2);
          SafeAssign(ATable, 'Raw_NUsr3', ftFloat,
            TIQWebLMBase(self.Owner).FRaw_NUsr3);
          SafeAssign(ATable, 'Raw_NUsr4', ftFloat,
            TIQWebLMBase(self.Owner).FRaw_NUsr4);
          SafeAssign(ATable, 'Raw_NUsr5', ftFloat,
            TIQWebLMBase(self.Owner).FRaw_NUsr5);

          SafeAssign(ATable, 'eplant_id', ftFloat,
            TIQWebLMBase(self.Owner).FEplant_Id);
          SafeAssign(ATable, 'label_date', ftDateTime,
            TIQWebLMBase(self.Owner).Flabel_date);

          if TIQWebLMBase(self.Owner).Fprod_date <> 0 then
            SafeAssign(ATable, 'prod_date', ftDateTime,
              TIQWebLMBase(self.Owner).Fprod_date);

          SafeAssign(ATable, 'Raw_Mat_Ex', ftString,
            TIQWebLMBase(self.Owner).FRaw_Mat_Ex);
          SafeAssign(ATable, 'Class', ftString, TIQWebLMBase(self.Owner).FClass);
          SafeAssign(ATable, 'ptwt', ftFloat, TIQWebLMBase(self.Owner).Fptwt);
          SafeAssign(ATable, 'Shift', ftInteger, TIQWebLMBase(self.Owner).FShift);

          { Sep-30-2003 }
          SafeAssign(ATable, 'arinvt_id', ftFloat,
            TIQWebLMBase(self.Owner).FArinvt_ID);
          SafeAssign(ATable, 'standard_id', ftFloat,
            TIQWebLMBase(self.Owner).Standard_ID);
          SafeAssign(ATable, 'orders_id', ftFloat,
            TIQWebLMBase(self.Owner).Orders_id);
          SafeAssign(ATable, 'arcusto_id', ftFloat,
            TIQWebLMBase(self.Owner).FArcusto_ID);
          SafeAssign(ATable, 'bill_to_id', ftFloat,
            TIQWebLMBase(self.Owner).Bill_to_ID);
          SafeAssign(ATable, 'ship_to_id', ftFloat,
            TIQWebLMBase(self.Owner).FShip_to_ID);
          SafeAssign(ATable, 'aka_id', ftFloat, TIQWebLMBase(self.Owner).FAka_ID);
          SafeAssign(ATable, 'vendor_id', ftFloat,
            TIQWebLMBase(self.Owner).Vendor_Id);

          if TIQWebLMBase(self.Owner).Ord_detail_id <> 0 then
            begin
              SafeAssign(ATable, 'ord_detail_id', ftFloat,
                TIQWebLMBase(self.Owner).Ord_detail_id);
              // SafeAssign( ATable, 'ord_detail',    ftFloat, TLMBase(Self.Owner).ord_Detail_id);
            end;

          if TIQWebLMBase(self.Owner).FShipmentDtlId <> 0 then
            begin
              SafeAssign(ATable, 'shipment_dtl_id', ftFloat,
                TIQWebLMBase(self.Owner).FShipmentDtlID);
            end;

          if TIQWebLMBase(self.Owner).Pk_Ticket_Dtl_ID <> 0 then
            SafeAssign(ATable, 'ps_ticket_dtl_id', ftFloat,
              TIQWebLMBase(self.Owner).Pk_Ticket_Dtl_ID);

          { Pkg AKA }
          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              SafeAssign(ATable, 'Pk_AkaItem', ftString,
                TIQWebLMBase(self.Owner).FPkg_Aka_Itemno);
            end
          else
            begin
              SafeAssign(ATable, 'Pkg_Arinvt_ID', ftFloat,
                TIQWebLMBase(self.Owner).FPkg_Arinvt_ID);
              SafeAssign(ATable, 'Pkg_Aka_ID', ftFloat,
                TIQWebLMBase(self.Owner).FPkg_Aka_ID);
              SafeAssign(ATable, 'Pkg_Aka_Itemno', ftString,
                TIQWebLMBase(self.Owner).FPkg_Aka_Itemno);
            end;

          SafeAssign(ATable, 'Pkg_Itemno', ftString,
            SelectValueByID('itemno', 'arinvt', TIQWebLMBase(self.Owner).FPkg_Arinvt_ID));

          { EDI }
          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              SafeAssign(ATable, 'isa_r_code', ftString,
                TIQWebLMBase(self.Owner).FIsa_receiver_code);
              SafeAssign(ATable, 'su_s_code', ftString,
                TIQWebLMBase(self.Owner).FSu_supplier_code);
              SafeAssign(ATable, 'pci_11z', ftString,
                TIQWebLMBase(self.Owner).FPci_11z);
              SafeAssign(ATable, 'pci_12z', ftString,
                TIQWebLMBase(self.Owner).FPci_12z);
              SafeAssign(ATable, 'pci_13z', ftString,
                TIQWebLMBase(self.Owner).FPci_13z);
              SafeAssign(ATable, 'pci_14z', ftString,
                TIQWebLMBase(self.Owner).FPci_14z);
              SafeAssign(ATable, 'pci_15z', ftString,
                TIQWebLMBase(self.Owner).FPci_15z);
              SafeAssign(ATable, 'pci_16z', ftString,
                TIQWebLMBase(self.Owner).FPci_16z);
              SafeAssign(ATable, 'pci_17z', ftString,
                TIQWebLMBase(self.Owner).FPci_17z);
              SafeAssign(ATable, 'ship_to_u5', ftString,
                TIQWebLMBase(self.Owner).FShip_to_cuser5);
              SafeAssign(ATable, 'edi_s_code', ftString,
                TIQWebLMBase(self.Owner).FEdi_ship_to_code);
              SafeAssign(ATable, 'cust_ref', ftString,
                TIQWebLMBase(self.Owner).FCust_ref);
              SafeAssign(ATable, 'sf_n1_code', ftString,
                TIQWebLMBase(self.Owner).FSf_n1_code);
              SafeAssign(ATable, 'ran', ftString, TIQWebLMBase(self.Owner).FRan);

              SafeAssign(ATable, 'seg_man', ftString,
                TIQWebLMBase(self.Owner).FSeg_man);

              SafeAssign(ATable, 'co_addr1', ftString,
                TIQWebLMBase(self.Owner).FCo_Addr1);
              SafeAssign(ATable, 'co_addr2', ftString,
                TIQWebLMBase(self.Owner).FCo_Addr2);
              SafeAssign(ATable, 'co_city', ftString,
                TIQWebLMBase(self.Owner).FCo_City);
              SafeAssign(ATable, 'co_state', ftString,
                TIQWebLMBase(self.Owner).FCo_State);
              SafeAssign(ATable, 'co_zip', ftString,
                TIQWebLMBase(self.Owner).FCo_Zip);

              SafeAssign(ATable, 'EDIUser1', ftString,
                TIQWebLMBase(self.Owner).FEDIUser1);
              SafeAssign(ATable, 'EDIUser2', ftString,
                TIQWebLMBase(self.Owner).FEDIUser2);
              SafeAssign(ATable, 'EDIUser3', ftString,
                TIQWebLMBase(self.Owner).FEDIUser3);
              SafeAssign(ATable, 'EDIUser4', ftString,
                TIQWebLMBase(self.Owner).FEDIUser4);
              SafeAssign(ATable, 'EDIUser5', ftString,
                TIQWebLMBase(self.Owner).FEDIUser5);
              SafeAssign(ATable, 'EDIUser6', ftString,
                TIQWebLMBase(self.Owner).FEDIUser6);
              SafeAssign(ATable, 'EDIUser7', ftString,
                TIQWebLMBase(self.Owner).FEDIUser7);
              SafeAssign(ATable, 'EDIUser8', ftString,
                TIQWebLMBase(self.Owner).FEDIUser8);
              SafeAssign(ATable, 'EDIUser9', ftString,
                TIQWebLMBase(self.Owner).FEDIUser9);
              SafeAssign(ATable, 'EDIUser10', ftString,
                TIQWebLMBase(self.Owner).FEDIUser10);
              SafeAssign(ATable, 'EDIUser11', ftString,
                TIQWebLMBase(self.Owner).FEDIUser11);
              SafeAssign(ATable, 'EDIUser12', ftString,
                TIQWebLMBase(self.Owner).FEDIUser12);
              SafeAssign(ATable, 'EDIUser13', ftString,
                TIQWebLMBase(self.Owner).FEDIUser13);
              SafeAssign(ATable, 'EDIUser14', ftString,
                TIQWebLMBase(self.Owner).FEDIUser14);
              SafeAssign(ATable, 'EDIUser15', ftString,
                TIQWebLMBase(self.Owner).FEDIUser15);

              { 07-16-2007 }
              SafeAssign(ATable, 'rel_cuser1', ftString,
                TIQWebLMBase(self.Owner).FRel_CUser1);
              SafeAssign(ATable, 'rel_cuser2', ftString,
                TIQWebLMBase(self.Owner).FRel_CUser2);
            end;

          { Serialized shipping label on pallet completion }
          SafeAssign(ATable, 'Qty_per_pk', ftFloat,
            TIQWebLMBase(self.Owner).FQty_per_pk);
          SafeAssign(ATable, 'Qty_of_pks', ftFloat,
            TIQWebLMBase(self.Owner).FQty_of_pks);

          SafeAssign(ATable, 'packno', ftString, TIQWebLMBase(self.Owner).FPackno);

          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            SafeAssign(ATable, 'aka_rev', ftString,
              TIQWebLMBase(self.Owner).FAka_Rev);

          { 01-02-2007 }
          SafeAssign(ATable, 'supp_code', ftString,
            TIQWebLMBase(self.Owner).FSupp_Code);
          SafeAssign(ATable, 'upc_code', ftString,
            TIQWebLMBase(self.Owner).FUPC_Code);
          SafeAssign(ATable, 'upc_code2', ftString,
            TIQWebLMBase(self.Owner).FUPC_Code2);
          SafeAssign(ATable, 'pk_tare', ftFloat, TIQWebLMBase(self.Owner).FPk_Tare);
          SafeAssign(ATable, 'pk_1_tare', ftString,
            TIQWebLMBase(self.Owner).FPK_1_Tare);
          SafeAssign(ATable, 'pk_1_item', ftString,
            TIQWebLMBase(self.Owner).FPK_1_Item);

          if (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              SafeAssign(ATable, 'last_sndop_id', ftFloat,
                TIQWebLMBase(self.Owner).FSndop_id);
              SafeAssign(ATable, 'next_sndop_id', ftFloat,
                TIQWebLMBase(self.Owner).FNext_Sndop_id);
              SafeAssign(ATable, 'process_login', ftString,
                TIQWebLMBase(self.Owner).FProcessLogin);
              SafeAssign(ATable, 'sndop_dispatch_id', ftFloat,
                TIQWebLMBase(self.Owner).FSndop_Dispatch_ID);
              SafeAssign(ATable, 'process_shift_id', ftFloat,
                TIQWebLMBase(self.Owner).FProcessShift_ID);
              SafeAssign(ATable, 'next_sndop_dispatch_id', ftFloat,
                TIQWebLMBase(self.Owner).FNext_Sndop_Dispatch_ID);
            end;

          SafeAssign(ATable, 'workord_id', ftFloat,
            TIQWebLMBase(self.Owner).Workorder_ID);

          SafeAssign(ATable, 'countryorg', ftString,
            TIQWebLMBase(self.Owner).CountryOfOrigin);
          SafeAssign(ATable, 'packslipno', ftString,
            TIQWebLMBase(self.Owner).FPackslipNo);

          AValidReceivedDate := 0;
          if TIQWebLMBase(self.Owner).FDateReceived > Date - 10000 then
          begin
             SafeAssign( ATable, 'DATE_RECEIVED', ftDateTime, TIQWebLMBase(self.Owner).FDateReceived );
            AValidReceivedDate := 1;
          end;


          SafeAssign(ATable, 'shelf_life', ftFloat,
            TIQWebLMBase(self.Owner).FShelf_life);
          if TIQWebLMBase(self.Owner).FStart_Time <> 0 then
            SafeAssign(ATable, 'start_time', ftString,
              DateTimeToStr(TIQWebLMBase(self.Owner).FStart_Time));

          // lot expiry date
          ADate:= self.GetLotExpiryDate( TIQWebLMBase(self.Owner).FArinvt_ID, TIQWebLMBase(self.Owner).FLotNo );
          if ADate > 0 then
             SafeAssign(ATable, 'expiry_dt', ftDateTime, ADate );

          SafeAssign(ATable, 'ord_uom',    ftString, TIQWebLMBase(self.Owner).FOrd_Detail_Uom );
          SafeAssign(ATable, 'ord_seq',    ftFloat,  TIQWebLMBase(self.Owner).FOrd_Detail_Seq );
          SafeAssign(ATable, 'ord_cuser1', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser1 );
          SafeAssign(ATable, 'ord_cuser2', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser2 );
          SafeAssign(ATable, 'ord_cuser3', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser3 );
          SafeAssign(ATable, 'ord_cuser4', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser4 );
          SafeAssign(ATable, 'ord_cuser5', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser5 );
          SafeAssign(ATable, 'ord_cuser6', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser6 );
          SafeAssign(ATable, 'shipeplant', ftFloat,  TIQWebLMBase(self.Owner).FShip_From_Eplant );

          CheckAssignRejectFields(ATable);

          Post;

          // skip insert/update of the master label if this is a 'N' copy of the 1st label
          if IsCreatingCopyOfLabel(i - j + 1) then
            CONTINUE;

          //EIQ-3206 New label kind called NONSERIAL - Wilbert Plastics 06-23-14 AB
          if not Label_KindNonSerial then
          begin
          { if FPrintExist_Master_Label_ID > 0 we just update existing record and print it }
          if FPrintExist_Master_Label_ID > 0 then
            { Keep printing the same one }
            ExecuteCommandFmt(
              'update MASTER_LABEL set   ' +
              '    id         = %f     , ' +
              '    class      = ''%s'' , ' +
              '    itemno     = ''%s'' , ' +
              '    rev        = ''%s'' , ' +
              '    descrip    = ''%s'' , ' +
              '    descrip2   = ''%s'' , ' +
              '    pono       = ''%s'' , ' +
              '    eqno       = ''%s'' , ' +
              '    mfgno      = ''%s'' , ' +
              '    standard_id= %f     , ' +
              '    orderno    = ''%s'' , ' +
              '    arcusto_id = %f     , ' +
              '    fg_lotno   = ''%s'' , ' +
              // '    boxno      = %d     , '+
              '    print_date = To_Date(''%s'', ''MM/DD/RRRR''), ' +
              '    qty        = %.6f     , ' +
                //'    weight     = %.6f     , ' +   (*remmed 10-06-15 per EIQ-8661 - weight on pallet label for indiv box*)
              '    arinvt_id  = Decode(%f, 0, '''', %f), ' +
              '    volume     = %.6f     , ' +
              '    ord_detail_id = decode(%f, 0, null, %f), ' +
              '    box_id     = %s     , ' +
              // '    is_pallet  = ''%s'',  '  +
              '    noship     = ''%s'',  ' +
              '    date_received = decode(%f, 0, null, IQMS.Common.Miscellaneous.str_to_date(''%s'')), ' +
//              '    date_received = IQMS.Common.Miscellaneous.str_to_date(''%s''), ' +
              '    lm_labels_id = %f     ' +
              ' where id = %f            ',
              [TIQWebLMBase(self.Owner).Fserial,
              StrTran(TIQWebLMBase(self.Owner).FClass, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPart_No, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FRev, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPart_desc, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FMaterial2, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPono, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FBaseno, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FMoldno, '''', ''''''),
              TIQWebLMBase(self.Owner).Standard_ID,
              StrTran(TIQWebLMBase(self.Owner).FOrder_No, '''', ''''''),
              TIQWebLMBase(self.Owner).FArcusto_ID,
              StrTran(TIQWebLMBase(self.Owner).FLotNo, '''', ''''''),
              // i mod 10000,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FLabelDate),
              AQtyInBox, // TLMBase(Self.Owner).FQuantity,
              // TLMBase(self.Owner).FWeight,  (*remmed 10-06-15 per EIQ-8661 - weight on pallet label for indiv box*)
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FVolume,
              TIQWebLMBase(self.Owner).Ord_detail_id,
              TIQWebLMBase(self.Owner).Ord_detail_id,
              IIf(TIQWebLMBase(self.Owner).FBox_ID > 0,
              FloatToStr(TIQWebLMBase(self.Owner).FBox_ID), 'NULL'),
              { packaging arinvt_id is stored in box_id }
              // IIf( IsLabel_KindPallet, 'Y', ''),
              TIQWebLMBase(self.Owner).FNoShip, // IIf(IsLabel_KindNoShip, 'Y', ''),
              AValidReceivedDate,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FDateReceived),
              TIQWebLMBase(self.Owner).FLM_Labels_ID,
              FPrintExist_Master_Label_ID])
          else
            ExecuteCommandFmt(
              'insert into MASTER_LABEL ' +
              '(id, ' +
              'class, ' +
              'itemno, ' +
              'rev, ' +
              'descrip, ' +
              'descrip2, ' +
              'pono, ' +
              'eqno, ' +
              'mfgno, ' +
              'standard_id, ' +
              'orderno, ' +
              'arcusto_id, ' +
              'fg_lotno, ' +
              'boxno, ' +
              'print_date, ' +
              'qty, ' +
              'weight, ' +
              'arinvt_id, ' +
              'volume, ' +
              'box_id, ' +
              'ord_detail_id, ' +
              'is_pallet, ' +
              'pkg_aka_id,' +
              'pkg_aka_itemno, ' +
              'shipping,       ' +
              'serial,         ' +
              'dockid,         ' +
              'linefeed,       ' +
              'reserveloc,     ' +
              'pci_11z,        ' +
              'pci_12z,        ' +
              'pci_13z,        ' +
              'pci_14z,        ' +
              'pci_15z,        ' +
              'pci_16z,        ' +
              'pci_17z,        ' +
              'seg_man,        ' +
              'noship,         ' +
              'ps_ticket_dtl_id, ' +
              'lm_labels_id,   ' +
              'upc_code,       ' +
              'Inv_CUser1,       ' +
              'Inv_CUser2,       ' +
              'Inv_CUser3,       ' +
              'Inv_CUser4,       ' +
              'Inv_CUser5,       ' +
              'Inv_CUser6,       ' +
              'Inv_CUser7,       ' +
              'Inv_CUser8,       ' +
              'Inv_CUser9,       ' +
              'InvCUser10,       ' +

              'Inv_NUser1,       ' +
              'Inv_NUser2,       ' +
              'Inv_NUser3,       ' +
              'Inv_NUser4,       ' +
              'Inv_NUser5,       ' +
              'Inv_NUser6,       ' +
              'Inv_NUser7,       ' +
              'Inv_NUser8,       ' +
              'Inv_NUser9,       ' +
              'InvNUser10,       ' +
              'pressno   ,       ' +
              'prod_date ,       ' +
              'upc_code2 ,       ' +

              'last_sndop_id    , ' +
              'next_sndop_id    , ' +
              'process_login    , ' +
              'sndop_dispatch_id, ' +
              'process_shift_id , ' +
              'next_sndop_dispatch_id, ' +
              'workorder_id,      ' +
              'countryorg,        ' +
              'packslipno,        ' +
              'ran,               ' +
              'badgeno,           ' +
              'date_received,     ' +
              'shipment_dtl_id,   ' +
              'foreign )          ' +

              'VALUES ' +
              '(%f, ' + // id
              '''%s'', ' + // class
              '''%s'', ' + // itemno
              '''%s'', ' + // rev
              'Replace(''%s'', ''@@@~~~@@@~~~@@@~~~'', Chr(34)), ' + // descrip
              'Replace(''%s'', ''@@@~~~@@@~~~@@@~~~'', Chr(34)), ' + // descrip2
              // '''%s'', '     +                            // descrip
              // '''%s'', '     +                            // descrip2
              '''%s'', ' + // pono
              '''%s'', ' + // eqno
              '''%s'', ' + // mfgno
              '%f, ' + // standard_id
              '''%s'', ' + // orderno
              '%f, ' + // arcusto_id
              '''%s'', ' + // fg_lotno
              '%d, ' + // boxno
              'To_Date(''%s'', ''MM/DD/RRRR''), ' + // print_date
              '%.6f, ' + // qty
              '%.6f, ' + // weight
              'Decode(%f, 0, '''', %f), ' + // arinvt_id
              '%.6f, ' + // volume
              '%s, ' + // box_id
              'Decode(%f, 0, null, %f), ' + // ord_detail_id
              '''%s'', ' + // is_pallet
              '%f, ' + // Pkg_Aka_ID
              '''%s'', ' + // Pkg_Aka_Itemno
              '''%s'', ' + // Shipping
              '''%s'', ' + // Serial
              '''%s'', ' + // dockid
              '''%s'', ' + // linefeed
              '''%s'', ' + // reserveloc
              '''%s'', ' + // pci_11z
              '''%s'', ' + // pci_12z
              '''%s'', ' + // pci_13z
              '''%s'', ' + // pci_14z
              '''%s'', ' + // pci_15z
              '''%s'', ' + // pci_16z
              '''%s'', ' + // pci_17z
              '''%s'', ' + // seg_man
              '''%s'', ' + // noship
              '%s    , ' + // ps_ticket_dtl_id
              ' %f   , ' + // lm_label_id
              '''%s'', ' + // upc_code

              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '''%s'', ' + // pressno
              ' decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), ' +
              // prod_date
              '''%s'', ' + // upc_code2
              '%s,     ' + // last_sndop_id
              '%s,     ' + // next_sndop_id
              '''%s'', ' + // process_login
              '%s,     ' + // sndop_dispatch_id
              '%s,     ' + // process_shift_id
              '%s,     ' + // next_sndop_dispatch_id
              '%s,     ' + // workorder_id
              '''%s'', ' + // country of origin
              '''%s'', ' + // packslipno
              '''%s'' ,' +  // ran
              '''%s'' ,' +
              'decode(%f, 0, null, IQMS.Common.Miscellaneous.str_to_date(''%s'')), ' +
//              'IQMS.Common.Miscellaneous.str_to_date(''%s'') ,' +
              '%s ,   '+  // shipment_dtl_id  SER#05984/EIQ-4359 AB 10-05-14
              '''%s'')',  // ForeignSerial = Y
              [TIQWebLMBase(self.Owner).Fserial,
              StrTran(TIQWebLMBase(self.Owner).FClass, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPart_No, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FRev, '''', ''''''),
              StrTran(StrTran(TIQWebLMBase(self.Owner).FPart_desc, '''', ''''''),
              '"', '@@@~~~@@@~~~@@@~~~'),
              StrTran(StrTran(TIQWebLMBase(self.Owner).FMaterial2, '''', ''''''),
              '"', '@@@~~~@@@~~~@@@~~~'),
              // StrTran(TLMBase(Self.Owner).FPart_desc, '''', ''''''),
              // StrTran(TLMBase(Self.Owner).FMaterial2, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPono, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FBaseno, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FMoldno, '''', ''''''),
              TIQWebLMBase(self.Owner).Standard_ID,
              StrTran(TIQWebLMBase(self.Owner).FOrder_No, '''', ''''''),
              TIQWebLMBase(self.Owner).FArcusto_ID,
              StrTran(TIQWebLMBase(self.Owner).FLotNo, '''', ''''''),
              i mod 10000,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FLabelDate),
              AQtyInBox, // TLMBase(Self.Owner).FQuantity,
              TIQWebLMBase(self.Owner).FWeight,
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FVolume,
              IIf(TIQWebLMBase(self.Owner).FBox_ID > 0,
              FloatToStr(TIQWebLMBase(self.Owner).FBox_ID), 'NULL'),
              { packaging arinvt_id is stored in box_id }
              TIQWebLMBase(self.Owner).Ord_detail_id,
              TIQWebLMBase(self.Owner).Ord_detail_id,
              IIf(IsLabel_KindPallet, 'Y', ''),
              // IIf( FIsPallet, 'Y', ''),
              TIQWebLMBase(self.Owner).FPkg_Aka_ID,
              TIQWebLMBase(self.Owner).FPkg_Aka_Itemno,
              IIf(TIQWebLMBase(self.Owner).FShipping, 'Y', 'N'),
              CheckPrintExist_CSerial,
              TIQWebLMBase(self.Owner).FDOCKID,
              TIQWebLMBase(self.Owner).FLINEFEED,
              TIQWebLMBase(self.Owner).FRESERVELOC,
              TIQWebLMBase(self.Owner).FPci_11z,
              TIQWebLMBase(self.Owner).FPci_12z,
              TIQWebLMBase(self.Owner).FPci_13z,
              TIQWebLMBase(self.Owner).FPci_14z,
              TIQWebLMBase(self.Owner).FPci_15z,
              TIQWebLMBase(self.Owner).FPci_16z,
              TIQWebLMBase(self.Owner).FPci_17z,
              TIQWebLMBase(self.Owner).FSeg_man,
              TIQWebLMBase(self.Owner).FNoShip, //  IIf(IsLabel_KindNoShip, 'Y', ''),
              IIf(OnLabelPrintAssignASNInfo and (TIQWebLMBase(self.Owner)
              .Pk_Ticket_Dtl_ID <> 0), FloatToStr(TIQWebLMBase(self.Owner)
              .Pk_Ticket_Dtl_ID), 'NULL'),
              TIQWebLMBase(self.Owner).FLM_Labels_ID,
              TIQWebLMBase(self.Owner).FUPC_Code,

              FixStr(TIQWebLMBase(self.Owner).FInv_CUser1),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser2),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser3),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser4),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser5),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser6),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser7),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser8),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser9),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser10),

              TIQWebLMBase(self.Owner).FInv_NUser1,
              TIQWebLMBase(self.Owner).FInv_NUser2,
              TIQWebLMBase(self.Owner).FInv_NUser3,
              TIQWebLMBase(self.Owner).FInv_NUser4,
              TIQWebLMBase(self.Owner).FInv_NUser5,
              TIQWebLMBase(self.Owner).FInv_NUser6,
              TIQWebLMBase(self.Owner).FInv_NUser7,
              TIQWebLMBase(self.Owner).FInv_NUser8,
              TIQWebLMBase(self.Owner).FInv_NUser9,
              TIQWebLMBase(self.Owner).FInv_NUser10,
              FixStr(TIQWebLMBase(self.Owner).Eqno),
              TIQWebLMBase(self.Owner).Fprod_date,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).Fprod_date),
              TIQWebLMBase(self.Owner).FUPC_Code2,

              IQMS.Common.StringUtils.FloatToStr0asNull(TIQWebLMBase(self.Owner).FSndop_id, 'null'),
              IQMS.Common.StringUtils.FloatToStr0asNull(TIQWebLMBase(self.Owner).FNext_Sndop_id,
              'null'),
              TIQWebLMBase(self.Owner).FProcessLogin,
              IQMS.Common.StringUtils.FloatToStr0asNull(TIQWebLMBase(self.Owner).FSndop_Dispatch_ID,
              'null'),
              IQMS.Common.StringUtils.FloatToStr0asNull(TIQWebLMBase(self.Owner).FProcessShift_ID,
              'null'),
              IQMS.Common.StringUtils.FloatToStr0asNull(TIQWebLMBase(self.Owner)
              .FNext_Sndop_Dispatch_ID, 'null'),
              IQMS.Common.StringUtils.FloatToStr0asNull(TIQWebLMBase(self.Owner).Workorder_ID,
              'null'),
              TIQWebLMBase(self.Owner).CountryOfOrigin,
              TIQWebLMBase(self.Owner).FPackslipNo,
              TIQWebLMBase(self.Owner).FRan,
              FBadgeNo,
              AValidReceivedDate,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FDateReceived),
              IQMS.Common.StringUtils.FloatToStr0asNull(TIQWebLMBase(self.Owner).FShipmentDtlId, 'null'),
              IsForeignYN() ]);
          end;

          if not Label_KindNonSerial then
          begin
            // 12/21/2012 Check update dispo_scan
            CheckUpdateDispoScan(TIQWebLMBase(self.Owner).Fserial);

            if Assigned(AfterMasterLabelInsert) then
              AfterMasterLabelInsert(TIQWebLMBase(self.Owner).Fserial);

            CheckAssignLotDate(TIQWebLMBase(self.Owner).Fserial, ATable);
            CheckAssignLotDocs(TIQWebLMBase(self.Owner).Fserial);

            if (IsReportBuilderUsed or IsLabelTemplateUsed) then
               CheckAssignLMInvtryLocationDescription( TIQWebLMBase(self.Owner).Fserial, ATable);

            if AIsMixedPallet then
              UpdateMasterLabelMixedPalletInfo(FPrintExist_Master_Label_ID,
                AQtyInBox);

            if FPrintExist_Master_Label_ID = 0 then                               // for new label only
               CheckSaveDimensionalInventory( TIQWebLMBase(self.Owner).Fserial );
          end;
        end;
    finally
      Free;
    end;
end;

procedure TFrmLM_Base.CheckField(AFieldName: string; ADataSet: TDataSet);
begin
  if ADataSet.FindField(AFieldName) = nil then
    { 'Field, %s, not found.'#13 +
      'Please rerun Label Edit routine and recreate the label.' }
    raise Exception.Create(Format(IQMS.WebVcl.ResourceStrings.cTXT0000121, [AFieldName]));
end;

function TFrmLM_Base.IsCreatingCopyOfLabel(I: Integer): Boolean;
begin
  Result := (I > 1) and FBoxNoRepresentsNumberOfCopies;
end;

procedure TFrmLM_Base.AssignPurchasedValues(cName: string);
var
  ATable: TFDTable;
  i: Integer;
  AIsMixedPallet: Boolean;
  ADate: TDateTime;
  AValidReceivedDate:Real;
begin
  AIsMixedPallet := FALSE;

  ATable := TFDTable.Create(self);
  with ATable do
    try
      InitOpenDataSet(ATable); { Assign DatabaseName and TableName }
      for i := 1 to TIQWebLMBase(self.Owner).FTBoxNo do
        begin
          if Label_KindNonSerial then
            TIQWebLMBase(self.Owner).Fserial:= 0
          else if FPrintExist_Master_Label_ID > 0 then
            TIQWebLMBase(self.Owner).Fserial := FPrintExist_Master_Label_ID
          else if not IsCreatingCopyOfLabel(i) then
            { do nothing in case of creating a copy of a label - just add to the dbf file the same info as a the prior record. Do not add to master_label }
            TIQWebLMBase(self.Owner).Fserial := GetNextID('MASTER_LABEL');

          TIQWebLMBase(self.Owner).FNoShip:= IIf(IsLabel_KindNoShip, 'Y', '');

          CheckReprintEnsureValuesMatchMasterLabel(FPrintExist_Master_Label_ID);
          CheckSICNegativeQty(TIQWebLMBase(self.Owner).FQuantity);

          if FPrintExist_Master_Label_ID > 0 then
            AIsMixedPallet := CheckPopulateMixedPalletFields
              (FPrintExist_Master_Label_ID, TIQWebLMBase(self.Owner).FQuantity);

          if (FPrintExist_Master_Label_ID > 0) and Assigned( OnBeforeRePrintLabel ) then
             OnBeforeRePrintLabel( self, FPrintExist_Master_Label_ID );

          Insert;
          if not Label_KindNonSerial then
            SafeAssign(ATable, 'master_label_id', ftFloat, TIQWebLMBase(self.Owner).Fserial);
          SafeAssign(ATable, 'timestamp', ftDateTime, Now);
          SafeAssign(ATable, 'batch', ftFloat, TIQWebLMBase(self.Owner).FBatch);

          if (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              SafeAssign(ATable, 'part_no', ftString,
                TIQWebLMBase(self.Owner).FPart_No);
              SafeAssign(ATable, 'part_desc', ftString,
                TIQWebLMBase(self.Owner).FPart_desc);
              SafeAssign(ATable, 'fg_lotno', ftString,
                TIQWebLMBase(self.Owner).FLotNo)
            end
          else
            begin
              SafeAssign(ATable, 'ITEMNO', ftString,
                TIQWebLMBase(self.Owner).FPart_No);
              SafeAssign(ATable, 'DESCRIP', ftString,
                TIQWebLMBase(self.Owner).FPart_desc);
              SafeAssign(ATable, 'LOTNO', ftString, TIQWebLMBase(self.Owner).FLotNo);
            end;

          SafeAssign(ATable, 'VEN_CODE', ftString,
            TIQWebLMBase(self.Owner).FVen_Code1);
          SafeAssign(ATable, 'VEN_CODE2', ftString,
            TIQWebLMBase(self.Owner).FVen_Code2);
          SafeAssign(ATable, 'VENDOR', ftString, TIQWebLMBase(self.Owner).FVendor1);
          SafeAssign(ATable, 'VENDOR2', ftString, TIQWebLMBase(self.Owner).FVendor2);
          SafeAssign(ATable, 'LBL_DATE', ftDateTime,
            TIQWebLMBase(self.Owner).FLabelDate);
          SafeAssign(ATable, 'QUANTITY', ftFloat, TIQWebLMBase(self.Owner).FQuantity);
          SafeAssign(ATable, 'UNIT', ftString, TIQWebLMBase(self.Owner).FUnit);

          SafeAssign(ATable, 'CLASS', ftString, TIQWebLMBase(self.Owner).FClass);
          SafeAssign(ATable, 'QUANTITY2', ftString,
            TIQWebLMBase(self.Owner).Quantity2);
          SafeAssign(ATable, 'LOTNO2', ftString, TIQWebLMBase(self.Owner).GetLotNo2);
          SafeAssign(ATable, 'ITEMNO2', ftString, TIQWebLMBase(self.Owner).Part_No2);
          SafeAssign(ATable, 'PONO', ftString, TIQWebLMBase(self.Owner).FPoNoRec);
          SafeAssign(ATable, 'PONO2', ftString, TIQWebLMBase(self.Owner).PonoRec2);

          SafeAssign(ATable, 'bcls_item1', ftString,
            TIQWebLMBase(self.Owner).FBlend[1].BlendItem);
          SafeAssign(ATable, 'bcls_item2', ftString,
            TIQWebLMBase(self.Owner).FBlend[2].BlendItem);
          SafeAssign(ATable, 'bcls_item3', ftString,
            TIQWebLMBase(self.Owner).FBlend[3].BlendItem);
          SafeAssign(ATable, 'bcls_item4', ftString,
            TIQWebLMBase(self.Owner).FBlend[4].BlendItem);
          SafeAssign(ATable, 'bcls_item5', ftString,
            TIQWebLMBase(self.Owner).FBlend[5].BlendItem);
          SafeAssign(ATable, 'bldesc1', ftString,
            TIQWebLMBase(self.Owner).FBlend[1].BlendDesc);
          SafeAssign(ATable, 'bldesc2', ftString,
            TIQWebLMBase(self.Owner).FBlend[2].BlendDesc);
          SafeAssign(ATable, 'bldesc3', ftString,
            TIQWebLMBase(self.Owner).FBlend[3].BlendDesc);
          SafeAssign(ATable, 'bldesc4', ftString,
            TIQWebLMBase(self.Owner).FBlend[4].BlendDesc);
          SafeAssign(ATable, 'bldesc5', ftString,
            TIQWebLMBase(self.Owner).FBlend[5].BlendDesc);
          SafeAssign(ATable, 'bld_prcnt1', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[1].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt2', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[2].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt3', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[3].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt4', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[4].BlendPrcn);
          SafeAssign(ATable, 'bld_prcnt5', ftFloat,
            TIQWebLMBase(self.Owner).FBlend[5].BlendPrcn);

          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              CheckField('Inv_CUser4', ATable);
              CheckField('Inv_CUser5', ATable);
              CheckField('Inv_CUser6', ATable);
              CheckField('Inv_CUser7', ATable);
              CheckField('Inv_CUser8', ATable);
              CheckField('Inv_CUser9', ATable);
              CheckField('InvCUser10', ATable);

              CheckField('Inv_NUser4', ATable);
              CheckField('Inv_NUser5', ATable);
              CheckField('Inv_NUser6', ATable);
              CheckField('Inv_NUser7', ATable);
              CheckField('Inv_NUser8', ATable);
              CheckField('Inv_NUser9', ATable);
              CheckField('InvNUser10', ATable);
            end;

          SafeAssign(ATable, 'Inv_CUser1', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser1);
          SafeAssign(ATable, 'Inv_CUser2', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser2);
          SafeAssign(ATable, 'Inv_CUser3', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser3);
          SafeAssign(ATable, 'Inv_CUser4', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser4);
          SafeAssign(ATable, 'Inv_CUser5', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser5);
          SafeAssign(ATable, 'Inv_CUser6', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser6);
          SafeAssign(ATable, 'Inv_CUser7', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser7);
          SafeAssign(ATable, 'Inv_CUser8', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser8);
          SafeAssign(ATable, 'Inv_CUser9', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser9);
          SafeAssign(ATable, 'InvCUser10', ftString,
            TIQWebLMBase(self.Owner).FInv_CUser10);

          SafeAssign(ATable, 'Inv_NUser1', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser1);
          SafeAssign(ATable, 'Inv_NUser2', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser2);
          SafeAssign(ATable, 'Inv_NUser3', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser3);
          SafeAssign(ATable, 'Inv_NUser4', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser4);
          SafeAssign(ATable, 'Inv_NUser5', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser5);
          SafeAssign(ATable, 'Inv_NUser6', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser6);
          SafeAssign(ATable, 'Inv_NUser7', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser7);
          SafeAssign(ATable, 'Inv_NUser8', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser8);
          SafeAssign(ATable, 'Inv_NUser9', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser9);
          SafeAssign(ATable, 'InvNUser10', ftFloat,
            TIQWebLMBase(self.Owner).FInv_NUser10);

          SafeAssign(ATable, 'DESCRIP2', ftString,
            TIQWebLMBase(self.Owner).FMaterial2);
          if not Label_KindNonSerial then
          SafeAssign(ATable, 'SERIAL', ftFloat, CheckPrintExist_Serial);
          // TLMBase(Self.Owner).FSerial     );

          if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
            begin
              CheckField('serial2', ATable);
              CheckField('cserial', ATable);
              { 10-23-2007 allow mfg labels to be attached to purchased item for reselling purchased goods }
              // CheckField('receiptno', ATable);
              // CheckField('rev',       ATable);
              // CheckField('division',  ATable);
            end;

          SafeAssign(ATable, 'serial2', ftString, CheckPrintExist_Serial2);
          // TLMBase(Self.Owner).Serial2 );
          if not Label_KindNonSerial then
          SafeAssign(ATable, 'cserial', ftString, CheckPrintExist_CSerial);
          // PadZeroSerial( TLMBase(Self.Owner).Fserial )); // StrTran(Format('%9s', [IntToStr(Trunc(TLMBase(Self.Owner).Fserial))]), ' ', '0'));
          SafeAssign(ATable, 'receiptno', ftString,
            TIQWebLMBase(self.Owner).Freceiptnum);
          SafeAssign(ATable, 'rev', ftString, TIQWebLMBase(self.Owner).FRev);
          SafeAssign(ATable, 'division', ftString,
            TIQWebLMBase(self.Owner).FDivision);

          SafeAssign(ATable, 'lbl_time', ftString, Copy(TimeToStr(Time), 1, 8));
          SafeAssign(ATable, 'material2', ftString,
            TIQWebLMBase(self.Owner).FMaterial2);
          SafeAssign(ATable, 'label_date', ftDateTime,
            TIQWebLMBase(self.Owner).Flabel_date);

          { Sep-30-2003 }
          SafeAssign(ATable, 'arinvt_id', ftFloat,
            TIQWebLMBase(self.Owner).FArinvt_ID);
          SafeAssign(ATable, 'vendor_id', ftFloat,
            TIQWebLMBase(self.Owner).Vendor_Id);

          { 01-02-2007 }
          SafeAssign(ATable, 'supp_code', ftString,
            TIQWebLMBase(self.Owner).FSupp_Code);
          SafeAssign(ATable, 'upc_code', ftString,
            TIQWebLMBase(self.Owner).FUPC_Code);
          SafeAssign(ATable, 'upc_code2', ftString,
            TIQWebLMBase(self.Owner).FUPC_Code2);

          SafeAssign(ATable, 'countryorg', ftString,
            TIQWebLMBase(self.Owner).CountryOfOrigin);
          SafeAssign(ATable, 'packslipno', ftString,
            TIQWebLMBase(self.Owner).FPackslipNo);

          AValidReceivedDate := 0;
          if TIQWebLMBase(self.Owner).FDateReceived > Date - 10000 then
          begin
             SafeAssign( ATable, 'DATE_RECEIVED', ftDateTime, TIQWebLMBase(self.Owner).FDateReceived );
            AValidReceivedDate := 1;
          end;


          // lot expiry date
          ADate:= self.GetLotExpiryDate( TIQWebLMBase(self.Owner).FArinvt_ID, TIQWebLMBase(self.Owner).FLotNo );
          if ADate > 0 then
             SafeAssign(ATable, 'expiry_dt', ftDateTime, ADate );


          SafeAssign(ATable, 'ord_uom',    ftString, TIQWebLMBase(self.Owner).FOrd_Detail_Uom );
          SafeAssign(ATable, 'ord_seq',    ftFloat,  TIQWebLMBase(self.Owner).FOrd_Detail_Seq );
          SafeAssign(ATable, 'ord_cuser1', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser1 );
          SafeAssign(ATable, 'ord_cuser2', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser2 );
          SafeAssign(ATable, 'ord_cuser3', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser3 );
          SafeAssign(ATable, 'ord_cuser4', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser4 );
          SafeAssign(ATable, 'ord_cuser5', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser5 );
          SafeAssign(ATable, 'ord_cuser6', ftString, TIQWebLMBase(self.Owner).FOrd_DetailCuser6 );
          SafeAssign(ATable, 'shipeplant', ftFloat,  TIQWebLMBase(self.Owner).FShip_From_Eplant );

          SafeAssign(ATable, 'aka_ptno', ftString, TIQWebLMBase(self.Owner).FAka_ptno);
          SafeAssign(ATable, 'aka_desc', ftString, TIQWebLMBase(self.Owner).FAka_desc);
          SafeAssign(ATable, 'aka_id', ftFloat, TIQWebLMBase(self.Owner).FAka_ID);
          SafeAssign(ATable, 'ran', ftString, TIQWebLMBase(self.Owner).FRan);
          if TIQWebLMBase(self.Owner).Pk_Ticket_Dtl_ID <> 0 then
            SafeAssign(ATable, 'ps_ticket_dtl_id', ftFloat, TIQWebLMBase(self.Owner).Pk_Ticket_Dtl_ID);

          CheckAssignRejectFields(ATable);

          Post;

          // skip insert/update of the master label if this is a 'N' copy of the 1st label
          if IsCreatingCopyOfLabel(i) then
            CONTINUE;

          if not Label_KindNonSerial then
          begin
          if FPrintExist_Master_Label_ID > 0 then
            ExecuteCommandFmt('update MASTER_LABEL set ' +
              '  id         = %f,      ' +
              '  class      = ''%s'',  ' +
              '  itemno     = ''%s'',  ' +
              '  rev        = ''%s'',  ' +
              '  descrip    = ''%s'',  ' +
              '  descrip2   = ''%s'',  ' +
              '  pono       = ''%s'',  ' +
              '  eqno       = ''%s'',  ' +
              '  mfgno      = ''%s'',  ' +
              '  standard_id= %f,      ' +
              '  orderno    = ''%s'',  ' +
              '  arcusto_id = %f    ,  ' +
              '  fg_lotno   = ''%s'',  ' +
              // '  boxno      = %d    ,  ' +
              '  print_date = To_Date(''%s'', ''MM/DD/RRRR''), ' +
              '  arinvt_id  = Decode(%f, 0, '''', %f), ' +
              '  qty        = %f,      ' +
              // '  is_pallet  = ''%s'',  ' +
              '  noship     = ''%s'',  ' +
              '  date_received = decode(%f, 0, null, IQMS.Common.Miscellaneous.str_to_date(''%s'')), ' +
//              '  date_received = IQMS.Common.Miscellaneous.str_to_date(''%s''), ' +
              '  lm_labels_id = %f     ' +
              ' where id = %f          ',
              [TIQWebLMBase(self.Owner).Fserial,
              StrTran(TIQWebLMBase(self.Owner).FClass, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPart_No, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FRev, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPart_desc, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FMaterial2, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPoNoRec, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FBaseno, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FMoldno, '''', ''''''),
              TIQWebLMBase(self.Owner).Standard_ID,
              StrTran(TIQWebLMBase(self.Owner).FOrder_No, '''', ''''''),
              TIQWebLMBase(self.Owner).FArcusto_ID,
              StrTran(TIQWebLMBase(self.Owner).FLotNo, '''', ''''''),
              // i,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FLabelDate),
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FQuantity,
              // IIf( IsLabel_KindPallet, 'Y', ''),
              TIQWebLMBase(self.Owner).FNoShip,  //  IIf(IsLabel_KindNoShip, 'Y', ''),
              AValidReceivedDate,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FDateReceived),
              TIQWebLMBase(self.Owner).FLM_Labels_ID,
              FPrintExist_Master_Label_ID])
          else
            ExecuteCommandFmt('insert into MASTER_LABEL ' +
              '(id, ' +
              'class, ' +
              'itemno, ' +
              'rev, ' +
              'descrip, ' +
              'descrip2, ' +
              'pono, ' +
              'eqno, ' +
              'mfgno, ' +
              'standard_id, ' +
              'orderno, ' +
              'arcusto_id, ' +
              'fg_lotno, ' +
              'boxno, ' +
              'print_date, ' +
              'arinvt_id, ' +
              'qty, ' +
              'is_pallet,  ' +
              'serial, ' +
              'noship, ' +
              'lm_labels_id, ' +
              'upc_code,     ' +

              'Inv_CUser1,       ' +
              'Inv_CUser2,       ' +
              'Inv_CUser3,       ' +
              'Inv_CUser4,       ' +
              'Inv_CUser5,       ' +
              'Inv_CUser6,       ' +
              'Inv_CUser7,       ' +
              'Inv_CUser8,       ' +
              'Inv_CUser9,       ' +
              'InvCUser10,       ' +

              'Inv_NUser1,       ' +
              'Inv_NUser2,       ' +
              'Inv_NUser3,       ' +
              'Inv_NUser4,       ' +
              'Inv_NUser5,       ' +
              'Inv_NUser6,       ' +
              'Inv_NUser7,       ' +
              'Inv_NUser8,       ' +
              'Inv_NUser9,       ' +
              'InvNUser10,       ' +
              'pressno   ,       ' +
              'prod_date ,       ' +
              'upc_code2,        ' +
              'countryorg,       ' +
              'packslipno ,      ' +
              'date_received,    ' +
              'badgeno,          ' +
              'foreign )         ' +
              'values ' +
              '(%f, ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              'Replace(''%s'', ''@@@~~~@@@~~~@@@~~~'', Chr(34)), ' +
              'Replace(''%s'', ''@@@~~~@@@~~~@@@~~~'', Chr(34)), ' +
              // '''%s'', '     +
              // '''%s'', '     +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '%f, ' +
              '''%s'', ' +
              '%f, ' +
              '''%s'', ' +
              '%d, ' +
              'To_Date(''%s'', ''MM/DD/RRRR''), ' +
              'Decode(%f, 0, '''', %f), ' +
              '%.4f, ' +
              '''%s'', ' +
              '''%s'', ' + { serial }
              '''%s'', ' + { noship }
              '%f    , ' + { lm_labels_id }
              '''%s'', ' + { upc_code }

              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '''%s'', ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '%.6f, ' +
              '''%s'', ' + // pressno
              ' decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), ' +
              // prod_date
              '''%s'',         ' + { upc_code2 }
              '''%s'', ' + // country of origin
              '''%s'' , ' + // packslipno
              'decode(%f, 0, null, IQMS.Common.Miscellaneous.str_to_date(''%s'')), ' +
//              'IQMS.Common.Miscellaneous.str_to_date(''%s'') ,' +
              '''%s'', '+ // badgeno
              '''%s'')',  // Foreign Y/N

              [TIQWebLMBase(self.Owner).Fserial,
              StrTran(TIQWebLMBase(self.Owner).FClass, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPart_No, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FRev, '''', ''''''),
              StrTran(StrTran(TIQWebLMBase(self.Owner).FPart_desc, '''', ''''''),
              '"', '@@@~~~@@@~~~@@@~~~'),
              StrTran(StrTran(TIQWebLMBase(self.Owner).FMaterial2, '''', ''''''),
              '"', '@@@~~~@@@~~~@@@~~~'),
              // StrTran(TLMBase(Self.Owner).FPart_desc, '''', ''''''),
              // StrTran(TLMBase(Self.Owner).FMaterial2, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FPoNoRec, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FBaseno, '''', ''''''),
              StrTran(TIQWebLMBase(self.Owner).FMoldno, '''', ''''''),
              TIQWebLMBase(self.Owner).Standard_ID,
              StrTran(TIQWebLMBase(self.Owner).FOrder_No, '''', ''''''),
              TIQWebLMBase(self.Owner).FArcusto_ID,
              StrTran(TIQWebLMBase(self.Owner).FLotNo, '''', ''''''),
              i,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FLabelDate),
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FArinvt_ID,
              TIQWebLMBase(self.Owner).FQuantity,
              IIf(IsLabel_KindPallet, 'Y', ''),
              // IIf( FIsPallet, 'Y', ''),
              CheckPrintExist_CSerial,
              TIQWebLMBase(self.Owner).FNoShip,  // IIf(IsLabel_KindNoShip, 'Y', ''),
              TIQWebLMBase(self.Owner).FLM_Labels_ID,
              TIQWebLMBase(self.Owner).FUPC_Code,

              FixStr(TIQWebLMBase(self.Owner).FInv_CUser1),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser2),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser3),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser4),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser5),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser6),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser7),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser8),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser9),
              FixStr(TIQWebLMBase(self.Owner).FInv_CUser10),

              TIQWebLMBase(self.Owner).FInv_NUser1,
              TIQWebLMBase(self.Owner).FInv_NUser2,
              TIQWebLMBase(self.Owner).FInv_NUser3,
              TIQWebLMBase(self.Owner).FInv_NUser4,
              TIQWebLMBase(self.Owner).FInv_NUser5,
              TIQWebLMBase(self.Owner).FInv_NUser6,
              TIQWebLMBase(self.Owner).FInv_NUser7,
              TIQWebLMBase(self.Owner).FInv_NUser8,
              TIQWebLMBase(self.Owner).FInv_NUser9,
              TIQWebLMBase(self.Owner).FInv_NUser10,
              TIQWebLMBase(self.Owner).Eqno,
              TIQWebLMBase(self.Owner).Fprod_date,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).Fprod_date),
              TIQWebLMBase(self.Owner).FUPC_Code2,
              TIQWebLMBase(self.Owner).CountryOfOrigin,
              TIQWebLMBase(self.Owner).FPackslipNo,
              AValidReceivedDate,
              FormatDateTime('mm/dd/yyyy', TIQWebLMBase(self.Owner).FDateReceived),
              FBadgeno,
              IsForeignYN() ]);
              end;

          if not Label_KindNonSerial then
          begin
          if Assigned(AfterMasterLabelInsert) then
            AfterMasterLabelInsert(TIQWebLMBase(self.Owner).Fserial);

          CheckAssignLotDate(TIQWebLMBase(self.Owner).Fserial, ATable);
          CheckAssignLotDocs(TIQWebLMBase(self.Owner).Fserial);

          if (IsReportBuilderUsed or IsLabelTemplateUsed) then
             CheckAssignLMInvtryLocationDescription( TIQWebLMBase(self.Owner).Fserial, ATable);

          if AIsMixedPallet then
            UpdateMasterLabelMixedPalletInfo(FPrintExist_Master_Label_ID,
              TIQWebLMBase(self.Owner).FQuantity);

          if FPrintExist_Master_Label_ID = 0 then                               // for new label only
             CheckSaveDimensionalInventory( TIQWebLMBase(self.Owner).Fserial );

          //EIQ-3003 Label Printing- Purchased Item labels are ignoring the Label Disposition Setting... AB 05/07/14
          CheckUpdateDispoScan(TIQWebLMBase(self.Owner).Fserial);
          end;

        end;
    finally
      Free;
    end;
end;

procedure TFrmLM_Base.CheckAssignRejectFields(ADataSet: TDataSet);
begin
  if (Owner is TIQWebLMReject) then
    begin
      SafeAssign(ADataSet, 'label_date', ftDateTime, TIQWebLMBase(self.Owner).Flabel_date);
      SafeAssign(ADataSet, 'lbl_time', ftString, Copy(TimeToStr(Time), 1, 8));

      // Inventory Item information
      SafeAssign(ADataSet, 'part_no', ftString, TIQWebLMBase(self.Owner).FPart_No);
      SafeAssign(ADataSet, 'part_desc', ftString, TIQWebLMBase(self.Owner).FPart_desc);
      SafeAssign(ADataSet, 'material', ftString, TIQWebLMBase(self.Owner).FMaterial);
      SafeAssign(ADataSet, 'class', ftString, TIQWebLMBase(self.Owner).FClass);
      SafeAssign(ADataSet, 'rev', ftString, TIQWebLMBase(self.Owner).FRev);

      // Reject Quantity
      SafeAssign(ADataSet, 'quantity', ftFloat, TIQWebLMBase(Self.Owner).FQuantity);

      //Mfg #
      SafeAssign(ADataSet, 'moldno', ftString, TIQWebLMBase(self.Owner).FMoldno);

      // Reject Code and comment
      SafeAssign(ADataSet, 'rej_code', ftString, TIQWebLMReject(self.Owner).RejectCode);
      SafeAssign(ADataSet, 'rej_desc', ftString, TIQWebLMReject(self.Owner).RejectDescription);
      SafeAssign(ADataSet, 'rej_commnt', ftString, TIQWebLMReject(self.Owner).RejectComment);

      //Lot #
      SafeAssign(ADataSet, 'fg_lotno', ftString, TIQWebLMBase(self.Owner).FLotNo);

      //User ID
      SafeAssign(ADataSet, 'user_id', ftString, SecurityManager.UserName);

    end;
end;

procedure TFrmLM_Base.About1Click(Sender: TObject);
begin
  // IqAbout1.Execute;
end;

procedure TFrmLM_Base.ProcessExec;
var
  Success: LongBool;
  cDirExe: string;
  cLabel: string;
  cDirLabels: string;
  ADBFFile: string;
  CurrentDir: string;
  AInTran: Boolean;
begin
  // Execute just before sending to printer
  if Assigned(FOnBeforePrint) then
    FOnBeforePrint;

  { RB }
  if IsReportBuilderUsed then
    begin
//      AInTran := MainModule.FDConnection.InTransaction;
      try
        // All session changes must be committed in order for
        // Crystal reports can access the data.
//        if AInTran then
//          MainModule.FDConnection.Commit;

        ProcessReportBuilder;

        UpdateLastPrintTimeStamp;

      finally
//        if AInTran then
//          MainModule.FDConnection.StartTransaction;
      end;

      EXIT;
    end;

  { Label Template }
  if IsLabelTemplateUsed then
    begin
//      AInTran := MainModule.FDConnection.InTransaction;
      try
//        if AInTran then
//          MainModule.FDConnection.Commit;

        ProcessLabelTemplate;

        UpdateLastPrintTimeStamp;

      finally
//        if AInTran then
//          MainModule.FDConnection.StartTransaction;
      end;

      EXIT;
    end;

  { LM }
  cDirLabels := IncludeTrailingPathDelimiter(SelectValueAsString('select LM_DIRECTORY from PARAMS'));
//  cDirLabels := StrTran(SelectValueAsString('select LM_DIRECTORY from PARAMS') + '\',
//    '\\', '\');
  cDirExe := IncludeTrailingPathDelimiter(SelectValueAsString('select LM_EXE_DIR from PARAMS'));
//  cDirExe := StrTran(SelectValueAsString('select LM_EXE_DIR from PARAMS') + '\',
//    '\\', '\');
  cLabel := Copy(TIQWebLMBase(Owner).FLabelFile, 1,
    Pos('.', TIQWebLMBase(Owner).FLabelFile) - 1);
  ADBFFile := TIQWebLMBase(Owner).DBFFile;

  CurrentDir := GetCurrentDir;
  try
    if not SetCurrentDir(cDirLabels) then
      raise Exception.CreateFmt
        (IQMS.WebVcl.ResourceStrings.cTXT0000122 { 'Unable to set current directory to %s' } ,
        [cDirLabels]);

    if TIQWebLMBase(Owner).RemoteServer = '' then
      Success := ProcessLocally(cDirExe, cLabel, cDirLabels, ADBFFile)
    else
      Success := ProcessRemotely(cDirExe, cLabel, cDirLabels, ADBFFile);

    DeleteFilesOlderThan(DirWhereDBFGoes + 'X*.DBF', 2); { IQMS.Common.FileUtils.pas }

  finally
    SetCurrentDir(CurrentDir);
  end;

  if Success then
    UpdateLastPrintTimeStamp
  else
    ABORT;

  IsAnyLabelBeenPrinted := True;
end;

procedure TFrmLM_Base.ProcessReportBuilder;
var
  AReportName: string;
  AList: TStringList;
  APrinterIndex: Integer;
  ACopies: Integer;
begin
  AReportName := TIQWebLMBase(Owner).FReportFile;

  ExecuteCommandFmt(
    'delete from lminvtry where timestamp < to_date(''%s'', ''mm/dd/yyyy'')',
    [FormatDateTime('mm/dd/yyyy', Date)]);

  AList := TStringList.Create;
  try
    if TIQWebLMBase(Owner).FLabelType = 'MANUFACTURED' then
      AList.Add(IQFormat('{V_LMINVTRY_MANUFACTURED.BATCH} = %f',
        [TIQWebLMBase(Owner).FBatch]))
    else { 'PURCHASED' }
      AList.Add(IQFormat('{V_LMINVTRY_PURCHASED.BATCH} = %f',
        [TIQWebLMBase(Owner).FBatch]));

    ACopies := GetCRWCopies;
    // SelectValueByID( 'crw_label_copies', 'lm_labels', wwLabels.LookUpTable.FieldByName('id').asFloat );

    { Sep-24-04 }
    if ACopies = 0 then
      ACopies := 1;

    if CRW_UseDefaultPrinter then
      begin
        PrintDefaultReportExA(AReportName, { name }
          AList, { selection criteria }
          ACopies) { copies }
      end
    else
      try
        // Save the currently selected printer index; we will restore
        // it after printing.
        APrinterIndex := Printer.PrinterIndex;

        { this will show up in the print dialog # of copies field }
        IQRegIntegerScalarWrite(self, AReportName + '_Copies', ACopies);

        CheckCRWPrinterForced(FCRWPrinterName);
        // SerReprintRange is using to assign CRW printer upfront

        // Print the report
        PrintDefaultReportEx(self,
          AReportName, // name
          AList, // selection criteria
          CRWPrinterName); // printer name

        // 05-13-2013
        SetLastUsedCRWPrinterName( Printer.Printers[ Printer.PrinterIndex ]);

      finally
        // Restore the original printer index
        Printer.PrinterIndex := APrinterIndex;
      end;
  finally
    AList.Free;
  end;
end;

procedure TFrmLM_Base.ProcessLabelTemplate;
var
  APrinterName: String;
begin

  ExecuteCommandFmt(
    'delete from lminvtry where timestamp < to_date(''%s'', ''mm/dd/yyyy'')',
    [FormatDateTime('mm/dd/yyyy', Date)]);
  APrinterName := wwDBComboPrinter.Text;
    if (APrinterName = '') then
      APrinterName := FForcedCRWPrinterName;
  IQMS.Common.LabelEditor.PrintLabelTemplate(TIQWebLMBase(Owner).FBatch, LabelTemplateId, APrinterName);
end;

procedure TFrmLM_Base.QryDimInvBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'gtt_master_label_dim');
end;

procedure TFrmLM_Base.Rename_XDbf_To_Label_Name(ADBFFile, cLabel: string);
var
  ASrc: string;
  ATrg: string;
  ADir: string;
begin
  { ADBFFile       - dbf name with the .dbf no path
    cLabel          - label name witout the .qdf
    DirWhereDBFGoes - returns path with trailing \ of where dbf is created }
  if FDBFConnection.Connected then
    FDBFConnection.Connected := False;

  ADir := DirWhereDBFGoes;
  ASrc := ADir + ADBFFile;
  ATrg := ADir + cLabel + '.dbf';

  if FileExists(ATrg) then
    if not DeleteFile(ATrg) then
      IQWarning(Format(IQMS.WebVcl.ResourceStrings.cTXT0000123 { 'Unable to delete file, %s.' } ,
        [ATrg]));

  if not RenameFile(ASrc, ATrg) then
    raise Exception.CreateFmt
      (IQMS.WebVcl.ResourceStrings.cTXT0000124 { 'Unable to rename %s to %s.' } , [ASrc, ATrg]);
end;

function TFrmLM_Base.LM_Redirect_Dbf: Boolean;
begin
  try
    Result := SelectValueAsString('select LM_REDIRECT_DBF from PARAMS') = 'Y';
  except
    Result := FALSE;
  end;
end;

function TFrmLM_Base.ProcessLocally(cDirExe, cLabel, cDirLabels,
  ADBFFile: string): Boolean;
var
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  CommandLine: string;
  AComm_Port: string;
  AExtraSwitch: string;
  AIsWinVer: Boolean;
  S: string;
  ALockFileName: string;
  a: Variant;
  AUser, APass, ADomain: string;
  pDomain: PWideChar;
  pUsername: PWideChar;
  pPassword: PWideChar;
  pCommand: PWideChar;
begin
  { h }
  a := SelectValueArray
    ('select srvc_username, srvc_password, srvc_domain from iqsys2 where rownum < 2');;
  if VarArrayDimCount(a) > 0 then
    begin
      AUser := a[0];
      APass := a[1];
      ADomain := a[2];
    end;

  TIQWebLMBase(Owner).FLM_Switch := Trim(SelectValueAsString('select LM_EXTRA_SWITCH from params'));

  FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);
  with StartUpInfo do
    begin
      cb := SizeOf(TStartUpInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
      wShowWindow := sw_SHOWNORMAL;
    end;

  AIsWinVer := True;

  if FileExists(cDirExe + 'lmprint.exe') then
    { Dos }
    begin
      AIsWinVer := FALSE;
      Rename_XDbf_To_Label_Name(ADBFFile, cLabel);
      CommandLine := Format(cDirExe + 'LMprint.exe /L=%s /NL',
        [cDirLabels + cLabel]);
    end
  else if LM_Redirect_Dbf() then
    begin
      { Winapi.Windows with DBF Redirection }
      CommandLine := Format(cDirExe + 'LMWprint.exe /L="%s" /FILE=%s,%s',
        [cDirLabels + cLabel, cLabel, DirWhereDBFGoes + ADBFFile]);
    end
  else
    { Winapi.Windows, no redirection }
    begin
      Rename_XDbf_To_Label_Name(ADBFFile, cLabel);
      CommandLine := Format(cDirExe + 'LMWprint.exe /L="%s"',
        [cDirLabels + cLabel]);
    end;

  { COM port }
  AComm_Port := '';
  FCommPortParams := Trim(SelectValueAsString('select comm_port from params'));
  if (Trim(FCommPortParams) > '') and (FCommPortParams <> 'Default') then
    AComm_Port := FCommPortParams;

  if (TIQWebLMBase(Owner).Comm_Port > '') and
    (TIQWebLMBase(Owner).Comm_Port <> 'Default') then
    AComm_Port := TIQWebLMBase(Owner).Comm_Port;

  // if AComm_Port > '' then
  // CommandLine:= Format( CommandLine + ' /O=%s:', [ AComm_Port ]);
  CheckAppendPrinterDesignation(CommandLine, AComm_Port);

  { Auto Verify }
  if AIsWinVer and (SelectValueAsString('select lm_auto_verify from params') = 'Y') then
    CommandLine := Format('%s %s', [CommandLine, '/Z=1']);

  { Extra switches. Ex: /W - instructs to stay in memory }
  AExtraSwitch := Trim(TIQWebLMBase(Owner).FLM_Switch);
  if (AExtraSwitch > '') and (Pos(' ' + AExtraSwitch, CommandLine) = 0) then
    CommandLine := Format('%s %s', [CommandLine, AExtraSwitch]);

  if IsConsole then
    begin
      S := CommandLine;
      if not FileExists(cDirLabels + cLabel + '.qdf') then
        S := Format('%s'#13#10'Error - unable to find label file %s',
          [S, cDirLabels + cLabel + '.qdf']);
      IQMS.Common.Print.LogPrintEvent(Format('LM Label# %f.0',
        [TIQWebLMBase(self.Owner).Fserial]), S);
    end;

  { 01-03-2008 add /F option to control lock file and sync with Label Matrix this way }
  ALockFileName := IncludeTrailingBackslash(cDirExe) + GetRandomName;
  CommandLine := Format('%s /F=''%s''', [CommandLine, ALockFileName]);

  if (AUser <> '') and (APass <> '') and (ADomain <> '') and IsConsole
  then
    begin
      try
        // Allocate necessary memory for the fourth main properties
        GetMem(pDomain, Length(ADomain) * SizeOf(WideChar) + SizeOf(WideChar));
        GetMem(pUsername, Length(AUser) * SizeOf(WideChar) + SizeOf(WideChar));
        GetMem(pPassword, Length(APass) * SizeOf(WideChar) + SizeOf(WideChar));
        GetMem(pCommand, Length(CommandLine) * SizeOf(WideChar) +
          SizeOf(WideChar));

        // Convert the fourth main properties to WideString data type
        StringToWideChar(ADomain, pDomain, Length(ADomain) * SizeOf(WideChar) +
          SizeOf(WideChar));
        StringToWideChar(AUser, pUsername, Length(AUser) * SizeOf(WideChar) +
          SizeOf(WideChar));
        StringToWideChar(APass, pPassword, Length(APass) * SizeOf(WideChar) +
          SizeOf(WideChar));
        StringToWideChar(CommandLine, pCommand, Length(CommandLine) *
          SizeOf(WideChar) + SizeOf(WideChar));

        Result := CreateProcessWithLogonW(pUsername, pDomain, pPassword, 0, nil,
          pCommand, 0, nil, nil, StartUpInfo, ProcessInfo);

        // Wait for the command to end
        WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      finally
        // UnAllocate necessary memory
        FreeMem(pDomain);
        FreeMem(pUsername);
        FreeMem(pPassword);
        FreeMem(pCommand);
      end;
    end
  else
    Result := CreateProcess(nil, PChar(CommandLine), nil, nil, FALSE,
      NORMAL_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);

  if not Result then
    begin
      { 'Error Executing Label Matrix.'#13#13+
        'Error Code: %d'#13+
        'Labels Directory: %s'#13+
        'Label Matrix EXE Directory: %s' }
      IQError(Format(IQMS.WebVcl.ResourceStrings.cTXT0000125, [GetLastError, cDirLabels,
        cDirExe]));
      EXIT;
    end;

  // {08-13-2007 attempt to sync with LMWPrint}
  // with ProcessInfo do
  // begin
  // WaitForSingleObject( hProcess, INFINITE );
  // CloseHandle( hThread  );
  // CloseHandle( hProcess );
  // end;

  { 01-03-2008 wait for 1 second and check for lock file. If not found - LM finished printing }
  Sleep(500);
  WaitForLockFile(ALockFileName);
end;

function TFrmLM_Base.ProcessRemotely(cDirExe, cLabel, cDirLabels,
  ADBFFile: string): Boolean;
//var
//  IQLMPrint: IIQLMPrint;

  function GetLastDir(S: string): string;
  begin
    S := Copy(S, 1, RPos('\', S) - 1); { D:\LM\X1234.dbf ->  D:\LM }
    if Pos('\', S) > 0 then
      S := Copy(S, RPos('\', S) + 1, Length(S)); { D:\LM -> LM }
    Result := S;
  end;

begin
  try
//    IQLMPrint := CoIQLMPrint.CreateRemote(TIQWebLMBase(Owner).RemoteServer);
    try
      { Call IQExecute DCom Server IIQLMPrint Interface }
//      IQLMPrint.Execute(IQGetComputerName, // AClientName  {IQComShr}
//        GetLastDir(DirWhereDBFGoes), // APath of where DBF is,
//        ADBFFile, // AFileName,
//        cLabel); // ALabelName
      Result := True;
    finally
//      IQLMPrint := nil;
    end;
  except
    on E: Exception do
      begin
        IQError(E.Message);
        Result := FALSE;
      end;
  end;
end;

procedure TFrmLM_Base.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLM_Base.DefineLabelText1Click(Sender: TObject);
begin
  (PopupUserDefLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;

procedure TFrmLM_Base.AssignUserDefined(AArinvt_ID: Real);
var
  a: Variant;
begin
  a := SelectValueArrayFmt('select cuser1, ' +
    'cuser2, ' +
    'cuser3, ' +
    'cuser4, ' +
    'cuser5, ' +
    'cuser6, ' +
    'cuser7, ' +
    'cuser8, ' +
    'cuser9, ' +
    'cuser10, ' +
    'nuser1, ' +
    'nuser2, ' +
    'nuser3, ' +
    'nuser4, ' +
    'nuser5, ' +
    'nuser6, ' +
    'nuser7, ' +
    'nuser8, ' +
    'nuser9, ' +
    'nuser10 from arinvt where id = %f', [AArinvt_ID]);
  if VarArrayDimCount(a) > 0 then
    begin
      dbeCUSER1.Text := a[0];
      dbeCUSER2.Text := a[1];
      dbeCUSER3.Text := a[2];
      dbeCUSER4.Text := a[3];
      dbeCUSER5.Text := a[4];
      dbeCUSER6.Text := a[5];
      dbeCUSER7.Text := a[6];
      dbeCUSER8.Text := a[7];
      dbeCUSER9.Text := a[8];
      dbeCUSER10.Text := a[9];

      dbeNUSER1.Text := a[10];
      dbeNUSER2.Text := a[11];
      dbeNUSER3.Text := a[12];
      dbeNUSER4.Text := a[13];
      dbeNUSER5.Text := a[14];
      dbeNUSER6.Text := a[15];
      dbeNUSER7.Text := a[16];
      dbeNUSER8.Text := a[17];
      dbeNUSER9.Text := a[18];
      dbeNUSER10.Text := a[19];
    end;

  CheckAssignDimensionalInventory;
end;

procedure TFrmLM_Base.Contents1Click(Sender: TObject);
begin
  // 03/03/2011 Call the form Help Context.  Not all descendent Vcl.Forms have the
  // same help context.  This will ensure that the correct help context is
  // displayed. (Byron)
  IQHelp.HelpContext(self.HelpContext);
end;

procedure TFrmLM_Base.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmLbl { HTM } ); { IQMS.Common.HelpHook.pas }
end;

function TFrmLM_Base.CheckAdjustQty(ACurrentBoxCount: Integer;
  AItemsPerBox: Real; var ANewQty: Real;
  var APrevPromptPrint0, AHasAEncountered0: Boolean): Boolean;
begin
  try
    Result := True;

    if TIQWebLMBase(Owner).FShipQty = 0 then
      begin
        ANewQty := AItemsPerBox;
        EXIT;
      end;

    if ACurrentBoxCount * AItemsPerBox <= TIQWebLMBase(Owner).FShipQty then
      begin
        ANewQty := AItemsPerBox;
        EXIT;
      end;

    ANewQty := TIQWebLMBase(Owner).FShipQty - (ACurrentBoxCount - 1) * AItemsPerBox;
    if ANewQty < 0 then { s/n happen }
      ANewQty := 0;

  finally
    if not IsConsole and (ANewQty = 0) then
      begin
        // if not IQWarningYN( Format(cTXT0000307, [ ACurrentBoxCount ])) then // 'Qty 0 is about to be printed on label %d. Continue printing this label?'
        // 08-05-2008 prompt only once. Check if we have encountered 0 in the past and act accordingly
        if not AHasAEncountered0 then
          begin
            Result := IQWarningYN(cTXT0000351);
            // 'Label(s) with 0 qty is about to be printed. Continue printing?'
            APrevPromptPrint0 := Result;
            AHasAEncountered0 := True;
          end
        else
          Result := APrevPromptPrint0;
      end
  end;
end;

function TFrmLM_Base.PadZeroSerial(ASerial: Real): string;
var
  ASerial_Length: Integer;
begin
  // ASerial_Length := Trunc(SelectValueAsFloat('select NVL(serial_length, 9) from iqsys'));
  // if not (ASerial_Length in [7, 8, 9]) then
  //   ASerial_Length := 9;
  // 03-25-2015 EIQ-6522
  ASerial_Length:= Trunc(SelectValueAsFloat('select master_label_misc.get_serial_length_print() from dual'));

  Result := LPadZero(FloatToStr(ASerial), ASerial_Length);
end;

function TFrmLM_Base.CheckPrintExist_Serial: Real;
begin
  // FSerial = master_label.id. However when we reprint master_label.serial can be different from id because of VERIFY_SERIAL
  { May-11-05 with introduction of foreign labels the serial may not even be a number. Since we must retun numeric value default to FSerial }
  try
    if FPrintExist_Master_Label_ID > 0 then
      Result := StrToFloat(SelectValueByID('serial', 'master_label',
        FPrintExist_Master_Label_ID))
    else
      Result := TIQWebLMBase(self.Owner).Fserial
  except
    Result := TIQWebLMBase(self.Owner).Fserial
  end;
end;

function TFrmLM_Base.CheckPrintExist_CSerial: string;
begin
  if FForeignSerial > '' then
    Result := FForeignSerial

  else if FPrintExist_Master_Label_ID > 0 then
    Result := SelectValueByID('serial', 'master_label', FPrintExist_Master_Label_ID)
    // PadZeroSerial( CheckPrintExist_Serial )

  else
    Result := PadZeroSerial(TIQWebLMBase(self.Owner).Fserial)
end;

function TFrmLM_Base.CheckPrintExist_Serial2: string;
begin
  if FForeignSerial > '' then
    Result := FForeignSerial

  else if FPrintExist_Master_Label_ID > 0 then
    Result := 'S' + FloatToStr(CheckPrintExist_Serial)

  else
    Result := TIQWebLMBase(self.Owner).Serial2
end;

procedure TFrmLM_Base.SetOnGetTotalLabelsCount(const Value
  : TOnGetTotalLabelsCount);
begin
  FOnGetTotalLabelsCount := Value;
end;

procedure TFrmLM_Base.SetOnBeforePrintLabel(const Value: TOnBeforeMasterLabelInsert);
begin
  FOnBeforeMasterLabelInsert := Value;
end;

class procedure TFrmLM_Base.UpdateMasterLabelLocationAfterInsert
  (AMaster_Label_ID, AFGMulti_ID: Real; ASetDispoScanTrue: Boolean = FALSE);
var
  a: Variant;
  ALoc_Desc: string;
  AFGLotNo: string;
  ASystemFlag: Boolean;
begin
  a := SelectValueArrayFmt
    ('select loc_desc, lotno from v_fgmulti_locations where id = %f',
    [AFGMulti_ID]);
  if VarArrayDimCount(a) = 0 then
    EXIT;
  ALoc_Desc := FixStr(a[0]);
  AFGLotNo := FixStr(a[1]);

  ExecuteCommandFmt(
    'update master_label       '+
    '   set loc_desc = ''%s'', '+
    '       fgmulti_id = decode( nvl(is_pallet,''N''), ''Y'', null, %f), '+
    '       fg_lotno = ''%s''  '+
    '  where id = %f',
    [StrTran(ALoc_Desc, '''', ''''''),
    AFGMulti_ID,
    AFGLotNo,
    AMaster_Label_ID]);

  if ASetDispoScanTrue then
    ExecuteCommandFmt('update master_label set dispo_scan = ''Y'' where id = %f',
      [AMaster_Label_ID]);
end;

class procedure TFrmLM_Base.CheckAppendTranslog_Master_Label(ATranslog_ID,
  AMaster_Label_ID: Real);
begin
  if (ATranslog_ID > 0) and (AMaster_Label_ID > 0) then
    ExecuteCommandFmt('insert into translog_master_label         ' +
      '    ( translog_id, master_label_id, qty ) ' +
      'select %f, id, qty                        ' +
      '  from master_label where id = %f         ',
      [ATranslog_ID,
      AMaster_Label_ID]);
end;

procedure TFrmLM_Base.CheckPalletUpdateChildren(AMaster_Label_ID: Real);
begin
  if Label_KindNonSerial then
     EXIT;

  if SelectValueFmtAsString('select is_pallet from master_label where id = %f',
    [AMaster_Label_ID]) = 'Y' then
    begin
      ExecuteCommandFmt('begin RF.update_pallet_children( %f ); end;',
        [AMaster_Label_ID]);
      { reset pallet fgmulti_id to null to prevent the pallet label showing up in the fgmulti associated labels list }
      ExecuteCommandFmt('update master_label set fgmulti_id = NULL where id = %f',
        [AMaster_Label_ID]);
    end;
end;

procedure TFrmLM_Base.DoEditBoxExit(Sender: TObject);
begin
//  FormatEditTextAsInteger(TUniEdit(Sender)); // iqlib
end;

procedure TFrmLM_Base.WaitForLockFile(ALockFileName: string);
var
  AStart: TDateTime;
begin
  AStart := Now;
  while FileExists(ALockFileName) do
    begin
      { if it didn't finish printing after 20 mins the process hung }
      if (Now - AStart) * 86400 > 60 * 20 then
        begin
          IQWarning(
            'Label Matrix is not responding - program will abort waiting for the printout and attempt to continue normal execution.');
          BREAK;
        end;
      Sleep(300);
    end;
end;

procedure TFrmLM_Base.CheckAssignLotDate(AMaster_Label_ID: Real;
  ADataSet: TDataSet);
var
  AFGMulti_ID: Real;
  ALot_Date: TDateTime;
begin
  if Label_KindNonSerial then
     EXIT;

  ALot_Date := 0;
  if FPrintExist_Master_Label_ID > 0 then
    ALot_Date:= TIQWebLMBase(self.Owner).FLot_Date

  else if TIQWebLMBase(self.Owner).FLot_Date > 0 then
    ALot_Date := TIQWebLMBase(self.Owner).FLot_Date

  else
    begin
      AFGMulti_ID := SelectValueByID('fgmulti_id', 'master_label', AMaster_Label_ID);
      if AFGMulti_ID = 0 then
        EXIT;
      ALot_Date := SelectValueByID('lot_date', 'fgmulti', AFGMulti_ID);
    end;

  if ALot_Date = 0 then
    EXIT;

  ExecuteCommandFmt(
    'update master_label set lot_date = to_date(''%s'',''mm/dd/yyyy hh24:mi:ss'') where id = %f',
    [FormatDateTime('mm/dd/yyyy hh:nn:ss', ALot_Date),
    AMaster_Label_ID]);
  if not (ADataSet.Eof and ADataSet.Bof) then
    begin
      ADataSet.Refresh;
      ADataSet.Edit;
      SafeAssign(ADataSet, 'lot_date', ftDateTime, ALot_Date);
      ADataSet.Post;
    end;
end;

procedure TFrmLM_Base.CheckAssignLMInvtryLocationDescription(
  AMaster_Label_ID: Real; ADataSet: TDataSet);
var
  ALoc_Desc: string;
begin
  ALoc_Desc:= SelectValueByID('loc_desc', 'master_label', AMaster_Label_ID);
  if ALoc_Desc = '' then
     EXIT;

  if not (ADataSet.Eof and ADataSet.Bof) then
    begin
      ADataSet.Refresh;
      ADataSet.Edit;
      SafeAssign(ADataSet, 'location', ftString, ALoc_Desc);
      ADataSet.Post;
    end;
end;


procedure TFrmLM_Base.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;

procedure TFrmLM_Base.CheckReprintEnsureValuesMatchMasterLabel
  (APrintExist_Master_Label_ID: Real);
var
  a: Variant;
begin
  if APrintExist_Master_Label_ID = 0 then
    EXIT;

  // 09-29-2009 for now ensure PCI segments are reprinted as is
  a := SelectValueArrayFmt
    ('select pci_11z, pci_12z, pci_13z, pci_14z, pci_15z, pci_16z, pci_17z, ' +
    '       fg_lotno, ran ' +
    '  from master_label where id = %f',
    [APrintExist_Master_Label_ID]);
  if VarArrayDimCount(a) = 0 then
    EXIT;

  TIQWebLMBase(self.Owner).FPci_11z := a[0]; // pci_11z
  TIQWebLMBase(self.Owner).FPci_12z := a[1]; // pci_12z
  TIQWebLMBase(self.Owner).FPci_13z := a[2]; // pci_13z
  TIQWebLMBase(self.Owner).FPci_14z := a[3]; // pci_14z
  TIQWebLMBase(self.Owner).FPci_15z := a[4]; // pci_15z
  TIQWebLMBase(self.Owner).FPci_16z := a[5]; // pci_16z
  TIQWebLMBase(self.Owner).FPci_17z := a[6]; // pci_17z
  TIQWebLMBase(self.Owner).FLotNo   := a[7];
  TIQWebLMBase(self.Owner).FRan     := a[8]; // ran
end;

function TFrmLM_Base.GetCRWReportName: string;
begin
  Result := wwLabels.DataSource.DataSet.FieldByName('REPORT_NAME').asString;
end;

function TFrmLM_Base.GetCRWCopies: Integer;
begin
  Result := SelectValueByID('crw_label_copies', 'lm_labels',
    wwLabels.DataSource.DataSet.FieldByName('id').asFloat);
end;

procedure TFrmLM_Base.CheckAssignLotDocs(AMaster_Label_ID: Real);
var
  a: Variant;
  AArinvt_ID: Real;
  ALotNo: string;
  ACountryOfOrigin: string;
begin
  a := SelectValueArrayFmt
    ('select arinvt_id, fg_lotno, countryorg from master_label where id = %f',
    [AMaster_Label_ID]);
  if VarArrayDimCount(a) = 0 then
    EXIT; // s/n happen

  AArinvt_ID := a[0];
  ALotNo := a[1];
  ACountryOfOrigin := a[2];

  ALotNo := FixStr(Trim(ALotNo));
  ACountryOfOrigin := FixStr(Trim(ACountryOfOrigin));

  if (AArinvt_ID = 0) or (Trim(ALotNo) = '') or
    (Trim(ACountryOfOrigin) = '') then
    EXIT;

  if SelectValueFmtAsFloat
    ('select id from arinvt_lot_docs where arinvt_id = %f and lotno = ''%s''',
    [AArinvt_ID, ALotNo]) > 0 then
    EXIT;

  ExecuteCommandFmt(
    'insert into arinvt_lot_docs( arinvt_id, lotno, country ) values (%f, ''%s'', ''%s'')',
    [AArinvt_ID,
    ALotNo,
    ACountryOfOrigin]);
end;

procedure TFrmLM_Base.CheckAppendPrinterDesignation(var CommandLine: string;
  AComm_Port: string);
var
  S: string;
begin
  S := '';

//  if IsConsole then
//    S := iqrf.rf_pro_share.ProfileGetLMPrinterAsAttribute

//  else if not (IsReportBuilderUsed or IsLabelTemplateUsed) then
//    S := wwDBComboPrinter.Text;

  // new way of designating the printer
  if Trim(S) > '' then
    begin
      // CommandLine:= Format('%s /ON=%s', [ CommandLine, S ]);
      CommandLine := Format('%s /X="%s"', [CommandLine, S]);
      EXIT;
    end;

  // old/existing default
  if Trim(AComm_Port) > '' then
    CommandLine := Format(CommandLine + ' /O=%s:', [AComm_Port]);
end;

procedure TFrmLM_Base.wwLabelsChange(Sender: TObject);
begin
  lblPrinter.Visible := not IsReportBuilderUsed;
  wwDBComboPrinter.Visible := not IsReportBuilderUsed;

end;

function TFrmLM_Base.CheckPopulateMixedPalletFields(AMaster_Label_ID: Real;
  var AQty: Real): Boolean;
var
  a: Variant;
  AArinvt_ID: Real;
  APS_Ticket_Dtl_ID: Real;
  AArcusto_ID: Real;
  APartno_ID: Real;
  ACount: Real;
begin
  Result := FALSE;

  a := SelectValueArrayFmt
    ('select is_pallet, arinvt_id from master_label where id = %f',
    [AMaster_Label_ID]);
  if VarArrayDimCount(a) = 0 then
    EXIT; // s/n happen

  // must be pallet and arinvt_id = 0 (mixed pallet)
  if not ((a[0] = 'Y') and (a[1] = 0)) then
    EXIT;

  Result := True; // mixed pallet with all the same or different items

  // how many different children are out there
  ACount := SelectValueFmtAsFloat
    ('select count(distinct arinvt_id) from master_label where parent_id = %f and arinvt_id is not null',
    [AMaster_Label_ID]);
  if ACount > 1 then
    begin
      TIQWebLMBase(self.Owner).FPart_No := 'MIXED';
      EXIT;
    end;

  // how many child labels - goes into "quantity"
  // AQty:= SelectValueFmtAsFloat('select count(*) from master_label where parent_id = %f', [ AMaster_Label_ID ]);
  AQty := SelectValueFmtAsFloat('select sum(qty) from master_label where parent_id = %f',
    [AMaster_Label_ID]);

  // get 1st child info in order to lookup rest of the stuff
  a := SelectValueArrayFmt
    ('select arinvt_id, ps_ticket_dtl_id, arcusto_id from master_label where parent_id = %f and arinvt_id is not null order by id',
    [AMaster_Label_ID]);
  if VarArrayDimCount(a) = 0 then
    EXIT; // s/n happen

  AArinvt_ID := a[0];
  APS_Ticket_Dtl_ID := a[1];
  AArcusto_ID := a[2];

  // arinvt info
  a := SelectValueArrayFmt
    ('select itemno, descrip, descrip2, unit, class, rev, ecno, series, drawing, standard_id, ' +
    '       cuser1, cuser2, cuser3, cuser4, cuser5, cuser6, cuser7, cuser8, cuser9, cuser10, '
    +
    '       nuser1, nuser2, nuser3, nuser4, nuser5, nuser6, nuser7, nuser8, nuser9, nuser10  '
    +
    '  from arinvt where id = %f',
    [AArinvt_ID]);
  if VarArrayDimCount(a) = 0 then
    EXIT; // s/n happen

  TIQWebLMBase(self.Owner).FPart_No := a[0];
  TIQWebLMBase(self.Owner).FPart_desc := a[1];
  TIQWebLMBase(self.Owner).FMaterial2 := a[2];
  TIQWebLMBase(self.Owner).FUnit := a[3];
  TIQWebLMBase(self.Owner).FClass := a[4];
  TIQWebLMBase(self.Owner).FRev := a[5];
  TIQWebLMBase(self.Owner).FEcno := a[6];
  TIQWebLMBase(self.Owner).FSeries := a[7];
  TIQWebLMBase(self.Owner).FDrawing := a[8];
  TIQWebLMBase(self.Owner).Standard_ID := a[9];
  TIQWebLMBase(Owner).FInv_CUser1 := a[10];
  TIQWebLMBase(Owner).FInv_CUser2 := a[11];
  TIQWebLMBase(Owner).FInv_CUser3 := a[12];
  TIQWebLMBase(Owner).FInv_CUser4 := a[13];
  TIQWebLMBase(Owner).FInv_CUser5 := a[14];
  TIQWebLMBase(Owner).FInv_CUser6 := a[15];
  TIQWebLMBase(Owner).FInv_CUser7 := a[16];
  TIQWebLMBase(Owner).FInv_CUser8 := a[17];
  TIQWebLMBase(Owner).FInv_CUser9 := a[18];
  TIQWebLMBase(Owner).FInv_CUser10 := a[19];
  TIQWebLMBase(Owner).FInv_NUser1 := a[20];
  TIQWebLMBase(Owner).FInv_NUser2 := a[21];
  TIQWebLMBase(Owner).FInv_NUser3 := a[22];
  TIQWebLMBase(Owner).FInv_NUser4 := a[23];
  TIQWebLMBase(Owner).FInv_NUser5 := a[24];
  TIQWebLMBase(Owner).FInv_NUser6 := a[25];
  TIQWebLMBase(Owner).FInv_NUser7 := a[26];
  TIQWebLMBase(Owner).FInv_NUser8 := a[27];
  TIQWebLMBase(Owner).FInv_NUser9 := a[28];
  TIQWebLMBase(Owner).FInv_NUser10 := a[29];

  // standard
  a := SelectValueArrayFmt('select mfgno, arinvt_id_mat from standard where id = %f',
    [TIQWebLMBase(self.Owner).Standard_ID]);
  if VarArrayDimCount(a) > 0 then
    begin
      TIQWebLMBase(self.Owner).FMoldno := a[0];
      TIQWebLMBase(self.Owner).FPL_ItemNo :=
        SelectValueFmtAsString('select itemno from arinvt where id = %f', [DtoF(a[1])]);
    end;

  // aka info
  TIQWebLMBase(self.Owner).FShip_to_ID :=
    SelectValueFmtAsFloat('select t.ship_to_id from ps_ticket_dtl d, ps_ticket t where d.id = %f and d.ps_ticket_id = t.id',
    [APS_Ticket_Dtl_ID]);
  a := SelectValueArrayFmt
    ('select cust_itemno, cust_descrip, id, cuser4, cust_rev from aka where arcusto_id = %f and arinvt_id = %f ' +
    '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id ) = 1',
    [AArcusto_ID,
    AArinvt_ID,
    TIQWebLMBase(self.Owner).NumToStrDef(TIQWebLMBase(self.Owner).FShip_to_ID)]);
  TIQWebLMBase(self.Owner).FAka_ptno := '';
  TIQWebLMBase(self.Owner).FAka_desc := '';
  TIQWebLMBase(self.Owner).FAka_ID := 0;
  TIQWebLMBase(self.Owner).FAka_C4 := '';
  TIQWebLMBase(self.Owner).FAka_Rev := '';
  if VarArrayDimCount(a) > 0 then
    begin
      TIQWebLMBase(self.Owner).FAka_ptno := a[0];
      TIQWebLMBase(self.Owner).FAka_desc := a[1];
      TIQWebLMBase(self.Owner).FAka_ID := a[2];
      TIQWebLMBase(self.Owner).FAka_C4 := a[3];
      TIQWebLMBase(self.Owner).FAka_Rev := a[4];
    end;

  // PK info
  APartno_ID := SelectValueFmtAsFloat
    ('select id from partno where standard_id = %f and arinvt_id = %f',
    [TIQWebLMBase(self.Owner).Standard_ID, AArinvt_ID]);
  if APartno_ID > 0 then
    TIQWebLMBase(Owner).FPK_1_Item := SelectValueFmtAsString('select a.itemno            ' +
      '  from partno p,           ' +
      '       ptoper t,           ' +
      '       sndop s,            ' +
      '       opmat o,            ' +
      '       arinvt a            ' +
      ' where p.id = %.0f         ' +
      '   and t.partno_id = p.id  ' +
      '   and t.sndop_id = s.id   ' +
      '   and s.op_class = ''PK'' ' +
      '   and o.sndop_id = s.id   ' +
      '   and o.arinvt_id = a.id  ' +
      '   and o.seq = 1           ',
      [APartno_ID]);
end;

procedure TFrmLM_Base.UpdateMasterLabelMixedPalletInfo(AMaster_Label_ID,
  AQtyInBox: Real);
begin
  if not Label_KindNonSerial then
  ExecuteCommandFmt('update MASTER_LABEL              ' +
    '   set class          = ''%s'',  ' +
    '       itemno         = ''%s'',  ' +
    '       rev            = ''%s'',  ' +
    '       descrip        = ''%s'',  ' +
    '       descrip2       = ''%s'',  ' +
    '       mfgno          = ''%s'',  ' +
    '       standard_id    = %f,      ' +
    '       qty            = %f,      ' +
    '       Inv_CUser1     = ''%s'',  ' +
    '       Inv_CUser2     = ''%s'',  ' +
    '       Inv_CUser3     = ''%s'',  ' +
    '       Inv_CUser4     = ''%s'',  ' +
    '       Inv_CUser5     = ''%s'',  ' +
    '       Inv_CUser6     = ''%s'',  ' +
    '       Inv_CUser7     = ''%s'',  ' +
    '       Inv_CUser8     = ''%s'',  ' +
    '       Inv_CUser9     = ''%s'',  ' +
    '       InvCUser10     = ''%s'',  ' +
    '       Inv_NUser1     = %.6f,    ' +
    '       Inv_NUser2     = %.6f,    ' +
    '       Inv_NUser3     = %.6f,    ' +
    '       Inv_NUser4     = %.6f,    ' +
    '       Inv_NUser5     = %.6f,    ' +
    '       Inv_NUser6     = %.6f,    ' +
    '       Inv_NUser7     = %.6f,    ' +
    '       Inv_NUser8     = %.6f,    ' +
    '       Inv_NUser9     = %.6f,    ' +
    '       InvNUser10     = %.6f     ' +
    ' where id = %f                   ',
    [StrTran(TIQWebLMBase(self.Owner).FClass, '''', ''''''),
    StrTran(TIQWebLMBase(self.Owner).FPart_No, '''', ''''''),
    StrTran(TIQWebLMBase(self.Owner).FRev, '''', ''''''),
    StrTran(StrTran(TIQWebLMBase(self.Owner).FPart_desc, '''', ''''''), '"',
    '@@@~~~@@@~~~@@@~~~'),
    StrTran(StrTran(TIQWebLMBase(self.Owner).FMaterial2, '''', ''''''), '"',
    '@@@~~~@@@~~~@@@~~~'),
    StrTran(TIQWebLMBase(self.Owner).FMoldno, '''', ''''''),
    TIQWebLMBase(self.Owner).Standard_ID,
    AQtyInBox,
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser1),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser2),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser3),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser4),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser5),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser6),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser7),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser8),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser9),
    FixStr(TIQWebLMBase(self.Owner).FInv_CUser10),
    TIQWebLMBase(self.Owner).FInv_NUser1,
    TIQWebLMBase(self.Owner).FInv_NUser2,
    TIQWebLMBase(self.Owner).FInv_NUser3,
    TIQWebLMBase(self.Owner).FInv_NUser4,
    TIQWebLMBase(self.Owner).FInv_NUser5,
    TIQWebLMBase(self.Owner).FInv_NUser6,
    TIQWebLMBase(self.Owner).FInv_NUser7,
    TIQWebLMBase(self.Owner).FInv_NUser8,
    TIQWebLMBase(self.Owner).FInv_NUser9,
    TIQWebLMBase(self.Owner).FInv_NUser10,
    AMaster_Label_ID]);
end;

procedure TFrmLM_Base.AssignFGLotNo(AFGLotNo: string);
begin
  edLotNo.Text := Trim(AFGLotNo);
end;

class procedure TFrmLM_Base.DoForceCRWPrinterName(S: string);
begin
  FForcedCRWPrinterName := S;
end;

procedure TFrmLM_Base.CheckCRWPrinterForced(var ACRWPrinterName: string);
begin
  if FForcedCRWPrinterName > '' then
    ACRWPrinterName := FForcedCRWPrinterName;
end;

class procedure TFrmLM_Base.Assign_FDoNotCheck_use_original_label_on_reprint
  (S: Boolean);
begin
  FDoNotCheck_use_original_label_on_reprint := S;
end;

function TFrmLM_Base.Check_use_original_label_on_reprint: Boolean;
begin
  Result := not FDoNotCheck_use_original_label_on_reprint;
end;

procedure TFrmLM_Base.CheckMinimumPrintInterval;
var
  APrint_Interval: Real;
  ALast_Print: TDateTime;
  ANow: TDateTime;
begin
  if TIQWebLMBase(Owner).FArinvt_ID = 0 then
    EXIT;

  {For LPA only, should these settings be considered, and NOT the sys params setting 06-12-14 AB EIQ-3123}
  if AnsiCompareText(IQMS.Common.FileUtils.ExeFileName, 'Label_ID.EXE') = 0 then
    {Check ARINVT record, then LPA setting for labels printed through LPA, not system params}
    APrint_Interval := SelectValueFmtAsFloat('select coalesce( (select lbl_assist_print_interval from arinvt where id = %f), '+
                                 '                 (select lbl_assist_print_interval from params) ) from dual', [ TIQWebLMBase(Owner).FArinvt_ID ])

  else
    {Only System Param Level - all other exes}
  APrint_Interval := SelectValueAsFloat('select LBL_PRINT_INTERVAL from params');
  if APrint_Interval <= 0 then
    EXIT;

  ALast_Print := SelectValueByID('LBL_LAST_PRINT', 'arinvt',
    TIQWebLMBase(Owner).FArinvt_ID);
  if ALast_Print = 0 then
    EXIT;

  ANow := SelectValueAsFloat('select sysdate from dual');

  if (ANow - ALast_Print) * 86400 <= APrint_Interval then
    ABORT;
end;

procedure TFrmLM_Base.UpdateLastPrintTimeStamp;
begin
  if TIQWebLMBase(Owner).FArinvt_ID = 0 then
    EXIT;

  ExecuteCommandFmt('update arinvt set LBL_LAST_PRINT = sysdate where id = %f',
    [TIQWebLMBase(Owner).FArinvt_ID]);
end;

function TFrmLM_Base.GetLabelDispositionSetting: TLabelDispositionSetting;
begin
  Result := GetLabelDispositionSettingComboBox(
    self.cmbLabelDispositionSetting);
end;

function TFrmLM_Base.GetLabelTemplateId: Real;
begin
  Result := wwLabels.DataSource.DataSet.FieldByName('LABEL_TEMPLATE_ID').AsFloat;
end;

procedure TFrmLM_Base.SetLabelDispositionSetting(
  const Value: TLabelDispositionSetting);
begin
  if (cmbLabelDispositionSetting.Items.Count > 0) then
    self.cmbLabelDispositionSetting.ItemIndex := Ord(Value);
end;

function TFrmLM_Base.GetShowLabelDispositionSetting: Boolean;
begin
  Result := cmbLabelDispositionSetting.Visible;
end;

//procedure TFrmLM_Base.gridDimInvCalcCellColors(Sender: TObject; Field: TField;
//  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
//begin
//  if Highlight then
//     EXIT;
//
//  if DM.QryDimInvCALCULATED.AsString = 'Y' then
//     ABrush.Color := shpCalculated.Brush.Color
//  else if Field.ReadOnly then
//     ABrush.Color:= clBtnFace;
//end;

procedure TFrmLM_Base.SetShowLabelDispositionSetting(const Value: Boolean);
begin
  cmbLabelDispositionSetting.Visible := Value;
  lblLabelDispositionSetting.Visible := Value;
end;

procedure TFrmLM_Base.CheckAssignPrinterName( APrinterName: string );
begin
  if (APrinterName > '') and (wwDBComboPrinter.Items.IndexOf(APrinterName) > - 1) then
    wwDBComboPrinter.ItemIndex := wwDBComboPrinter.Items.IndexOf(APrinterName)
  else if (APrinterName = '') then
    wwDBComboPrinter.ItemIndex := -1;
end;

function TFrmLM_Base.GetLotExpiryDate( AArinvt_ID: Real; ALotNo: string ): TDateTime;
begin
  Result:= 0;
  if Trim(ALotNo) = '' then
     EXIT;

  Result:= SelectValueFmtAsFloat('select expiry_date from arinvt_lot_docs where arinvt_id = %f and rtrim(lotno) = ''%s''',
                     [ AArinvt_ID, StrTran( ALotNo, '''', '''''')]);
end;

class function TFrmLM_Base.GetLastUsedCRWPrinterName: string;
begin
  Result:= FLastUsedCRWPrinterName;
end;

class procedure TFrmLM_Base.SetLastUsedCRWPrinterName( S: string );
begin
  FLastUsedCRWPrinterName:= S;
end;

procedure TFrmLM_Base.CheckAssignDimensionalInventory;
begin
  tabDimInv.TabVisible:= IsSIC and (FPrintExist_Master_Label_ID = 0);  // SIC and new label only
  if not tabDimInv.TabVisible then
     EXIT;

//  ExecuteCommand('truncate table gtt_master_label_dim');
//  ExecuteCommandFmt('insert into gtt_master_label_dim( name, uom ) select name, uom from arinvt_dim where arinvt_id = %f order by name', [ TLMBase(Owner).FArinvt_ID ]);
  // 10/26/2015 (Byron, EIQ-9205) Load the GTT
  ExecuteCommandFmt(
    'BEGIN inv_misc.load_gtt_dim_characteristics(%.0f); END;',
    [TIQWebLMBase(Owner).FArinvt_ID]);

  // 10/26/2016 (Byron, EIQ-9205) Check whether the user entered default
  // values for every dimension, and calculate, if required.
  if DM.CanCalculateDimensions then
    DM.CalculateDimensions;

  Reopen(DM.QryDimInv);
end;

procedure TFrmLM_Base.CheckSaveDimensionalInventory( AMaster_Label_ID: Real );
begin
  if not tabDimInv.TabVisible then
     EXIT;
  if Label_KindNonSerial then
     EXIT;

  if DM.QryDimInv.State in [dsEdit] then
     DM.QryDimInv.Post;

  if IQMS.Common.ApplicationSet.AppType = atCGI then
    EXIT; //WMSIQ should never enter this method, this is handled in WMS_Dispatch WMSCheckSaveDimensionalInventory! AE 02-09-15

  ExecuteCommandFmt('insert into master_label_dim                '+
            '     ( master_label_id, name, uom, nvalue ) '+
            'select %f, name, uom, nvalue                '+
            ' from gtt_master_label_dim                  '+
            'order by name                               ',
            [ AMaster_Label_ID ]);
end;

function TFrmLM_Base.GetDefaultPkUnitPtsPer( AArinvt_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select inv_trans_misc.get_default_ptsper( %f ) from dual', [ AArinvt_ID ]);
end;

procedure TFrmLM_Base.CheckMandatoryLotNo;
var
  AItemNo     : string;
  AErrConfirm : string;
  AErrAborting: string;
begin
  // EIQ-2226 Label Printing for Mfg & Purchased Items -> If Item is marked Lot # Mandatory ->
  // Show warning if attempting to print a label without a Lot#

  if TIQWebLMBase(self.Owner).Arinvt_ID = 0 then
     EXIT;

  if SelectValueByID('is_lot_mandatory', 'arinvt', TIQWebLMBase(self.Owner).Arinvt_ID) <> 'Y' then
     EXIT;

  if edLotNo.Text > '' then
     EXIT;

  if IsConsole then
     EXIT;  // for now let it pass

  AItemNo     := SelectValueByID('rtrim(itemno)', 'arinvt', TIQWebLMBase(self.Owner).Arinvt_ID );
  AErrConfirm := Format( IQMS.WebVcl.ResourceStrings.cTXT0000424 {'Lot # is Mandatory for %s.'#13#13'Continue?'},    [ AItemNo ]);
  AErrAborting:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000425 {'Lot # is Mandatory for %s - operation aborted.'}, [ AItemNo ]);

//  case IQDialogChkEx( TFrmConfirmMissingLotNo,      {IQDialogChkEx is defined in IQMesg, TFrmConfirmMissingLotNo is in conf_missing_lotno.pas}
//                      AErrConfirm,
//                      'FrmConfirmMissingLotNo' ) of
//    0: raise Exception.Create( AErrAborting );
//    1: ; {do nothing}
//  end;
end;

procedure TFrmLM_Base.CheckValidateDimensionalInventory;
var
  ADimensionName: string;
begin
  if FPrintExist_Master_Label_ID > 0 then  // for new label only
    Exit;

  if IQMS.Common.ApplicationSet.AppType = atCGI then
    EXIT; //WMSIQ should never enter this method! AE 02-09-15

  if not tabDimInv.TabVisible then
     EXIT;

  {$IFDEF IQRF}
  if IsConsole and (SelectValueAsFloat('select count(*) from gtt_master_label_dim') > 0) then
     rf_dim_inv.PromptDimensionalInventory( TIQWebLMBase(self.Owner).FArinvt_ID );  // IQRF
  {$ENDIF}

  if not IsMissingMandatoryDimensionalInventoryData( TIQWebLMBase(self.Owner).FArinvt_ID, ADimensionName ) then
     EXIT;

  PageControl1.ActivePage:= tabDimInv;
  (*raise our own exception here new type declared in IQLMShare*)
  // '''%s'' is a required dimension for this inventory item that has not been populated
  raise EDimensionalInventoryViolation.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000494, [ ADimensionName ]);
end;

procedure TFrmLM_Base.PopulateAkaItemno;
var
  AkaItemno:String;
  AId:Real;
begin
  aId := 0;
  if TIQWebLMBase(self.Owner).FDoNoDisplayAKANumber then
  begin
    EdAkaItemno.Text := '';
  end
  else
  begin
    if TIQWebLMBase(self.Owner).FAka_Kind <> '' then
    begin
      AId := SelectValueFmtAsFloat('select id from aka where arcusto_id = %f and arinvt_id = %f ' +
        '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id ) = 1 and kind = ''%s''',
        [TIQWebLMBase(self.Owner).Arcusto_ID,
         TIQWebLMBase(self.Owner).Arinvt_ID,
         TIQWebLMBase(self.Owner).NumToStrDef(TIQWebLMBase(self.Owner).FShip_to_ID),
         StrTran(TIQWebLMBase(self.Owner).FAka_Kind, '''', '''''')
         ]);
    end
    else
    begin
      AId := SelectValueFmtAsFloat('select id from aka where arcusto_id = %f and arinvt_id = %f ' +
        '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id ) = 1',
        [TIQWebLMBase(self.Owner).Arcusto_ID,
         TIQWebLMBase(self.Owner).Arinvt_ID,
         TIQWebLMBase(self.Owner).NumToStrDef(TIQWebLMBase(self.Owner).FShip_to_ID)
         ]);

    end;
    if AId <> 0 then
    begin
      AkaItemno := SelectValueFmtAsString('select cust_itemno from aka where id = %f', [AId]);
      TIQWebLMBase(self.Owner).FAka_ID := AId;
      TIQWebLMBase(self.Owner).FAka_ptno := AkaItemno;
      TIQWebLMBase(self.Owner).FAka_desc := SelectValueFmtAsString('select cust_descrip from aka where id = %f', [AId]);
    end;
    EdAkaItemno.Readonly := false;
    EdAkaItemno.Text := AkaItemno;
  end;
  EdAkaItemno.Readonly := true;
end;

function TFrmLM_Base.IsForeignYN: string;
begin
  if FForeignSerial > '' then
     Result:= 'Y'
  else
     Result:= ''
end;


procedure TFrmLM_Base.CheckAssociateToPalletUsingPOReceiptsLabels( APO_Receipts_Labels_ID, AMaster_Label_ID: Real );
var
  APO_Receipts_Labels_Pallet_ID: Real;
  APallet_Master_Label_ID: Real;
begin
  // get pointer to the po_receipts_labels_pallet record (if exists)
  APO_Receipts_Labels_Pallet_ID:= SelectValueByID('po_receipts_labels_pallet_id', 'po_receipts_labels', APO_Receipts_Labels_ID);
  if APO_Receipts_Labels_Pallet_ID = 0 then
     EXIT;

  // get printed pallet id
  APallet_Master_Label_ID:= SelectValueByID('printed_master_label_id', 'po_receipts_labels_pallet', APO_Receipts_Labels_Pallet_ID);
  if APallet_Master_Label_ID = 0 then
     EXIT;

  // 04/25/2016 (Byron, EIQ-9360) Also clear IS_PALLET when setting parent_id
  // since this is a child label.  It can be set incorrectly above by
  // IsLabel_KindPallet when the MASTER_LABEL record is created.
  ExecuteCommandFmt('update master_label set parent_id = %f, is_pallet = null where id = %f',
            [ APallet_Master_Label_ID,
              AMaster_Label_ID ]);

  ExecuteCommandFmt('begin rf.update_pallet_label_qty( %f ); end;',
            [ APallet_Master_Label_ID ]);
end;

function TFrmLM_Base.GetUnitQuantity: Integer;
begin
  if not TryStrToInt(EditQty.Text, Result) then
    Result := 0;
end;

procedure TFrmLM_Base.SetUnitQuantity(const Value: Integer);
begin
  EditQty.Text := IntToStr(Value);
end;

function TFrmLM_Base.GetLabelsQuantity: Integer;
begin
  if not TryStrToInt(EditLblQty.Text, Result) then
    Result := 0;
end;

procedure TFrmLM_Base.SetLabelsQuantity(const Value: Integer);
begin
  EditLblQty.Text := IntToStr(Value);
end;

function TFrmLM_Base.PrintPalletLabels_POReceipts(const APOReceiptsID,
  ATransLogID, AFGMultiID: Int64): Boolean;
var
//  AReceivingPallet: IPrintReceivingPallet;
  APalletQuery, AChildQuery: TFDQuery; // queries used for looping
begin
  // Initialization
  Result := True;
  // Create class to print the pallet label
//  AReceivingPallet := TPrintReceivingPallet.Create(
//    APOReceiptsID,
//    Trunc(TLMBase(self.Owner).FArinvt_ID),
//    AFGMultiID,
//    ATransLogID);

  // Prepare the list of pallets (parent)
  APalletQuery := TFDQuery.Create(nil);
  try
    APalletQuery.ConnectionName := 'IQFD';
    APalletQuery.SQL.Add(       'select id,                       ');
    APalletQuery.SQL.Add(       '       qty                       ');
    APalletQuery.SQL.Add(       '  from po_receipts_labels_pallet ');
    APalletQuery.SQL.Add(Format('  where po_receipts_id = %d      ',
      [APOReceiptsID]));
    APalletQuery.SQL.Add(       '  order by seq                   ');
    APalletQuery.Open;

    // Prepare list of pallent children
    AChildQuery := TFDQuery.Create(nil);
    try
      AChildQuery.ConnectionName := 'IQFD';
      AChildQuery.SQL.Add(       '  SELECT id,                                     ');
      AChildQuery.SQL.Add(       '         qty                                     ');
      AChildQuery.SQL.Add(       '    FROM po_receipts_labels                      ');
      AChildQuery.SQL.Add(Format('   WHERE po_receipts_id = %d AND                 ',
        [APOReceiptsID]));
      AChildQuery.SQL.Add(       '         po_receipts_labels_pallet_id = :id AND  ');
      AChildQuery.SQL.Add(       '         NVL(qty, 0) > 0                         ');
      AChildQuery.SQL.Add(       'ORDER BY id                                      ');
      AChildQuery.Params[0].ParamType := ptInput;
      AChildQuery.Params[0].DataType := APalletQuery.Fields[0].DataType;
      AChildQuery.Params[0].Value := APalletQuery.Fields[0].Value;

      // Loop the list of pallets (parent), and print the pallet
      // label first, followed by the children for that pallet.
      while not APalletQuery.Eof do
      begin
        // Print one pallet label (parent)
//        AReceivingPallet.PrintPallet(
//          APalletQuery.FieldByName('ID').AsLargeInt,
//          APalletQuery.FieldByName('QTY').AsFloat);

        // Reset counter
        FAccumulateMultipleRecordsCount := 0;
        try
          // Refresh the child dataset
          if AChildQuery.Active then
            AChildQuery.Close;
          AChildQuery.Params[0].Value := APalletQuery.Fields[0].Value;
          AChildQuery.Open;

          // Process the child labels
          while not AChildQuery.Eof do
          begin
            // Set the quantity
            UnitQuantity := AChildQuery.FieldByName('QTY').AsInteger;
            Inc(FAccumulateMultipleRecordsCount);
            PlannedLabelSource_ID := AChildQuery.FieldByName('ID').AsLargeInt;

            // po_receipts_labels.id
            PrintLabel;

            // Next child record
            AChildQuery.Next;
          end;
          // Print the child label(s)
          if FAccumulateMultipleRecordsCount > 0 then
            ProcessExec;
        except
          on
            E: EDimensionalInventoryViolation do
          begin
            // EIQ-5223 SER# 06231 - Prevent the form from closing if SIC
            // and they didn't enter mandatory inv dim characteristic AMB 04-30-15
            Result := False;
            Application.ShowException(E);
          end;
        end;
        // Move to the next pallet record (po_receipts_labels_pallet)
        APalletQuery.Next;
      end;
    finally
      FreeAndNil(AChildQuery);
    end;
  finally
    FreeAndNil(APalletQuery);
  end;
end;

function TFrmLM_Base.PrintLabels_POReceipts(const APOReceiptsID, ATransLogID,
  AFGMultiID: Int64): Boolean;
var
  AQuery: TFDQuery;
begin
  // Initialize counter
  FAccumulateMultipleRecordsCount := 0;
  // Prepare list of pallent children
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.ConnectionName := 'IQFD';
    AQuery.SQL.Add(       '  SELECT id,                                     ');
    AQuery.SQL.Add(       '         qty                                     ');
    AQuery.SQL.Add(       '    FROM po_receipts_labels                      ');
    AQuery.SQL.Add(Format('   WHERE po_receipts_id = %d AND                 ',
      [APOReceiptsID]));
    AQuery.SQL.Add(       '         NVL(qty, 0) > 0                         ');
    AQuery.SQL.Add(       'ORDER BY id                                      ');
    AQuery.Open;
    try
      // Process the child labels
      while not AQuery.Eof do
      begin
        // Set the quantity
        UnitQuantity := AQuery.FieldByName('QTY').AsInteger;
        Inc(FAccumulateMultipleRecordsCount);
        PlannedLabelSource_ID := AQuery.FieldByName('ID').AsLargeInt;

        // po_receipts_labels.id
        PrintLabel;

        // Next child record
        AQuery.Next;
      end;
      // Print the child label(s)
      if FAccumulateMultipleRecordsCount > 0 then
        ProcessExec;
    except
      on
        E: EDimensionalInventoryViolation do
      begin
        // EIQ-5223 SER# 06231 - Prevent the form from closing if SIC
        // and they didn't enter mandatory inv dim characteristic AMB 04-30-15
        Result := FALSE;
        Application.ShowException(E);
      end;
    end;
  finally
    FreeAndNil(AQuery);
  end;
end;

end.
