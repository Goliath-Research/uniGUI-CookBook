unit ForeMain;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  ExtCtrls,
  Grids,
  DBGrids,
  Db,
  Buttons,
  DBCtrls,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.ExcelTbl,
  Menus,
  IQMS.WebVcl.About,
  Wwdbigrd,
  Wwdbgrid,
  Wwdatsrc,
  StdCtrls,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  ForeBase,
  IQMS.WebVcl.DropDownButton,
  SyncObjs,
  Wwdotdot,
  wwdbedit,
  Wwdbcomb,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.SoftEPlant,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniTabControl,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGroupBox,
  uniDBNavigator,
  //Vcl.Menus,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame, uniDateTimePicker, uniDBDateTimePicker,
  uniGUIApplication;

type
  TFrmForecastMain = class(TFrmForecast)
    Panel1: TUniPanel;
    StatusBar1: TUniStatusBar;
    SrcForecast: TDataSource;
    QryForecast: TFDQuery;
    PkArinvt: TIQWebHPick;
    PkArinvtCLASS: TStringField;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtID: TBCDField;
    PivotTable1: TIQWebPivotTable;
    QryPivot: TFDQuery;
    QryPivotITEMNO: TStringField;
    QryPivotDESCRIP: TStringField;
    QryPivotCUSTNO: TStringField;
    QryPivotCOMPANY: TStringField;
    QryPivotQTY: TFMTBCDField;
    QryPivotPRICE: TFMTBCDField;
    QryPivotEXT_PRICE: TFMTBCDField;
    QryPivotMM_YY: TStringField;
    Query1: TFDQuery;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField26: TFMTBCDField;
    FloatField27: TFMTBCDField;
    StringField7: TStringField;
    FloatField28: TFMTBCDField;
    StringField8: TStringField;
    PopupMenu1: TUniPopupMenu;
    Edit1: TUniMenuItem;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    N2: TUniMenuItem;
    Options1: TUniMenuItem;
    MovetoCurrentMonth1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    ExcelPivotTable1: TUniMenuItem;
    ItemInfoFixed1: TUniMenuItem;
    N3: TUniMenuItem;
    MonthTotal1: TUniMenuItem;
    ItemTotal1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    SecurityRegister1: TIQWebSecurityRegister;
    IQJumpInv: TIQWebJump;
    JumptoInventory1: TUniMenuItem;
    Misc1: TUniMenuItem;
    ForecastGroups1: TUniMenuItem;
    AssignGroupstoInvItems1: TUniMenuItem;
    GenerateForecast1: TUniMenuItem;
    Generate1: TUniMenuItem;
    GenerateForecast2: TUniMenuItem;
    Generate2: TUniMenuItem;
    N4: TUniMenuItem;
    Parameters1: TUniMenuItem;
    N5: TUniMenuItem;
    DrillDown1: TUniMenuItem;
    PkArinvtPK_HIDE: TStringField;
    Contents1: TUniMenuItem;
    N6: TUniMenuItem;
    ExporttoExcel1: TUniMenuItem;
    ImportfromExcel1: TUniMenuItem;
    QryExport: TFDQuery;
    SaveDialog1: TSaveDialog;
    QryExportITEMNO: TStringField;
    QryExportARINVT_ID: TBCDField;
    QryExportDESCRIP: TStringField;
    QryExportCOMPANY: TStringField;
    QryExportARCUSTO_ID: TBCDField;
    QryExportCUSTNO: TStringField;
    QryExportPRICE: TFMTBCDField;
    QryExportEXT_PRICE: TFMTBCDField;
    QryExportQTY: TFMTBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    N7: TUniMenuItem;
    Copy1: TUniMenuItem;
    Paste1: TUniMenuItem;
    N8: TUniMenuItem;
    EvaluateBestFormula1: TUniMenuItem;
    N9: TUniMenuItem;
    ForecastFormulas1: TUniMenuItem;
    EvaluateBestFormula2: TUniMenuItem;
    popmSearch: TUniPopupMenu;
    Search1: TUniMenuItem;
    SearchAKA1: TUniMenuItem;
    PkAKA: TIQWebHPick;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField9: TStringField;
    FloatField1: TBCDField;
    FloatField2: TBCDField;
    StringField10: TStringField;
    PkAKACUST_ITEMNO: TStringField;
    PkAKACUST_DESCRIP: TStringField;
    PkAKACUST_REV: TStringField;
    PkAKACUSTNO: TStringField;
    PkAKACOMPANY: TStringField;
    QryExportREV: TStringField;
    QryExportMM_DD_YY: TDateTimeField;
    QryExportSHIPTOATTN: TStringField;
    QryExportSHIP_TO_ID: TFMTBCDField;
    QryExportNOTE1: TStringField;
    GenerateReleases1: TUniMenuItem;
    PkArinvtDESCRIP2: TStringField;
    PkAKADESCRIP2: TStringField;
    Query1DESCRIP2: TStringField;
    QryPivotDESCRIP2: TStringField;
    QryExportDESCRIP2: TStringField;
    Planning2: TUniMenuItem;
    SaveForecast2: TUniMenuItem;
    RestoreForecast2: TUniMenuItem;
    PkForeHist: TIQWebHPick;
    PkForeHistNAME: TStringField;
    PkForeHistTIMESTAMP: TDateTimeField;
    CompareForecasts1: TUniMenuItem;
    PkForeHistFORECAST_TYPE: TStringField;
    PkForeHistID: TBCDField;
    PkAKAKIND: TStringField;
    PkForeHistSTART_DATE: TDateTimeField;
    PkForeHistEND_DATE: TDateTimeField;
    pnlForeHead: TUniPanel;
    Splitter1: TUniSplitter;
    FlowPanel2: TFlowPanel;
    sbtnSearchForecast: TUniSpeedButton;
    NavForeHead: TUniDBNavigator;
    Splitter2: TUniSplitter;
    GroupBoxGeneral: TUniGroupBox;
    GroupBox2: TUniGroupBox;
    sbtnEplantView: TUniSpeedButton;
    QryForeHead: TFDQuery;
    QryForeHeadID: TBCDField;
    QryForeHeadNAME: TStringField;
    QryForeHeadDESCRIPTION: TStringField;
    QryForeHeadSTART_DATE: TDateTimeField;
    QryForeHeadEND_DATE: TDateTimeField;
    QryForeHeadKIND: TStringField;
    QryForeHeadARINVT_ID: TBCDField;
    QryForeHeadARCUSTO_ID: TBCDField;
    QryForeHeadFR_GROUP_ID: TBCDField;
    QryForeHeadSHIP_TO_ID: TBCDField;
    QryForeHeadCustNo: TStringField;
    QryForeHeadGroupName: TStringField;
    SrcForeHead: TDataSource;
    PkForeHead: TIQWebHPick;
    PkForeHeadID: TBCDField;
    PkForeHeadNAME: TStringField;
    PkForeHeadDESCRIPTION: TStringField;
    PkForeHeadSTART_DATE: TDateTimeField;
    PkForeHeadEND_DATE: TDateTimeField;
    PkForeHeadKIND: TStringField;
    UpdateSQLForeHead: TFDUpdateSQL;
    pnlGeneralLeft: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Splitter3: TUniSplitter;
    Panel7: TUniPanel;
    dbeForeHeadId: TUniDBEdit;
    dbeForecastName: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    wwDBComboBox1: TUniDBComboBox;
    Splitter4: TUniSplitter;
    pnlFilterLeft: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Panel8: TUniPanel;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    wwDBDateTimePicker2: TUniDBDateTimePicker;
    wwDBComboDlgCust: TUniEdit;
    wwDBComboDlgFrGroup: TUniEdit;
    PkCustomer: TIQWebHPick;
    PkCustomerCUSTNO: TStringField;
    PkCustomerCOMPANY: TStringField;
    PkCustomerID: TBCDField;
    PkGroup: TIQWebHPick;
    PkGroupCODE: TStringField;
    PkGroupDESCRIP: TStringField;
    PkGroupID: TBCDField;
    pnlForecastMain: TUniPanel;
    pnlForecastBody: TUniPanel;
    Panel2: TUniPanel;
    DBGrid1: TIQUniGridControl;
    TabSource: TUniTabControl;
    pnlForecastBodyToolBar: TUniPanel;
    FlowPanel1: TFlowPanel;
    ddbtnSearchItem: TIQWebDropDownButton;
    sbtnCurrentMonth: TUniSpeedButton;
    sbtnGraph: TUniSpeedButton;
    sbtnEvalBest: TUniSpeedButton;
    sbtnQuickDataEntry: TUniSpeedButton;
    TabQtyAmt: TUniTabControl;
    FullItemInfo1: TUniMenuItem;
    GenerateReleases2: TUniMenuItem;
    CloneForecast1: TUniMenuItem;
    sbtnPivot: TUniSpeedButton;
    ExplodeForecast1: TUniMenuItem;
    pnlLegend: TUniPanel;
    Shape3: TUniPanel;
    Shape6: TUniPanel;
    sbtnExplodeForecast: TUniSpeedButton;
    WhereUsed1: TUniMenuItem;
    N1: TUniMenuItem;
    WhiteboardCapacity1: TUniMenuItem;
    LaborWhiteboardCapacity1: TUniMenuItem;
    sbtnWhiteboard: TUniSpeedButton;
    popmWhiteboard: TUniPopupMenu;
    WhiteboardCapacity2: TUniMenuItem;
    LaborWhiteboardCapacity2: TUniMenuItem;
    DDApply: TIQWebDropDownButton;
    PopupMenu2: TUniPopupMenu;
    Updatepriceforthisitem1: TUniMenuItem;
    Updatepriceforallitems1: TUniMenuItem;
    wwDBComboDlgMfgNo: TUniEdit;
    ShowSQL1: TUniMenuItem;
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    PkMfgCUSTOMERNAME: TStringField;
    PkMfgID: TBCDField;
    PkMfgARCUSTO_ID: TBCDField;
    PkMfgEPLANT_ID: TBCDField;
    PkMfgPK_HIDE: TStringField;
    PkMfgSTANDARD_DESCRIP: TStringField;
    QryForeHeadEXCLUDE_NON_SALABLE: TStringField;
    dbchkExcludeNonSalable: TUniDBCheckBox;
    dbchkMakeToStock: TUniDBCheckBox;
    QryForeHeadMAKE_TO_STOCK: TStringField;
    QryExportDIVISION: TStringField;
    QryForeHeadDONT_MAKE_TO_STOCK_CHILD: TStringField;
    dbchkDoNotApplyMakeToStockToChild: TUniDBCheckBox;
    PrinterSetupDialog1: TPrinterSetupDialog;
    OpenDialog1: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnCurrentMonthClick(Sender: TObject);
    procedure SrcForecastDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSourceChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure QryForecastBeforeInsert(DataSet: TDataSet);
    procedure QryForecastUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure sbtnPivotClick(Sender: TObject);
    procedure Exit(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryForecastBeforeOpen(DataSet: TDataSet);
    procedure sbtnFilterClick(Sender: TObject);
    procedure ItemInfoFixed1Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure MonthTotal1Click(Sender: TObject);
    procedure ItemTotal1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure sbtnGraphClick(Sender: TObject);
    procedure ForecastGroups1Click(Sender: TObject);
    procedure AssignGroupstoInvItems1Click(Sender: TObject);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure Generate1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure QryForecastAfterOpen(DataSet: TDataSet);
    procedure Parameters1Click(Sender: TObject);
    procedure DrillDown1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure ExporttoExcel1Click(Sender: TObject);
    procedure ImportfromExcel1Click(Sender: TObject);
    procedure QryExportBeforeOpen(DataSet: TDataSet);
    procedure PkArinvtBeforeOpen(DataSet: TDataSet);
    procedure Copy1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure QryPivotBeforeOpen(DataSet: TDataSet);
    procedure comboForecastTypeCloseUp(Sender: TObject);
    procedure ForecastFormulas1Click(Sender: TObject);
    procedure EvaluateBestFormula1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure SearchAKA1Click(Sender: TObject);
    procedure QryExportCalcFields(DataSet: TDataSet);
    procedure GenerateReleases1Click(Sender: TObject);
    procedure sbtnQuickDataEntryClick(Sender: TObject);
    procedure EPlantFilter1Click(Sender: TObject);
    procedure SaveForecast1Click(Sender: TObject);
    procedure OpenForecast1Click(Sender: TObject);
    procedure CompareForecasts1Click(Sender: TObject);
    procedure DBGrid1CellChanged(Sender: TObject);
    procedure QryForeHeadCalcFields(DataSet: TDataSet);
    procedure ClearComboDlg(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbtnSearchForecastClick(Sender: TObject);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure PkForeHeadIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure QryForeHeadBeforePost(DataSet: TDataSet);
    procedure QryForeHeadNewRecord(DataSet: TDataSet);
    procedure QryForeHeadAfterPost(DataSet: TDataSet);
    procedure wwDBComboDlgCustCustomDlg(Sender: TObject);
    procedure wwDBComboDlgFrGroupCustomDlg(Sender: TObject);
    procedure QryForeHeadAfterScroll(DataSet: TDataSet);
    procedure FullItemInfo1Click(Sender: TObject);
    procedure CloneForecast1Click(Sender: TObject);
    procedure ExplodeForecast1Click(Sender: TObject);
    procedure DBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure WhereUsed1Click(Sender: TObject);
    procedure WhiteboardCapacity1Click(Sender: TObject);
    procedure LaborWhiteboardCapacity1Click(Sender: TObject);
    procedure sbtnWhiteboardClick(Sender: TObject);
    procedure DDApplyClick(Sender: TObject);
    procedure Updatepriceforallitems1Click(Sender: TObject);
    procedure wwDBComboDlgMfgNoCustomDlg(Sender: TObject);
    procedure wwDBComboDlgMfgNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ShowSQL1Click(Sender: TObject);
    procedure PkMfgBeforeOpen(DataSet: TDataSet);
    procedure SrcForeHeadDataChange(Sender: TObject; Field: TField);
    procedure SecurityRegister1AfterApply(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FFore_Arinvt_ID_Copy: Real;
    FShowingSavedForecastsValue: Boolean;
    CS_Status  : TCriticalSection;
    FDesignateAsProduction: Boolean;

    FExportFromDate: TDateTime;
    FExportToDate  : TDateTime;
    FExportArcusto_ID: Real;
    FExportGroup_ID: Real;
    FExportShip_To_ID: Real;
    FFore_Head_ID: Real;

    procedure OpenQuery( ASavePos: Boolean = TRUE );
    procedure CloseQuery;

    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
    function SaveCurrentPos( var AArinvt_ID: Real; var AActiveRow, ALeftCol: Integer; var AActiveFieldName: string ): Boolean;
    procedure RestoreCurrentPos( AArinvt_ID: Real; AActiveRow, ALeftCol: Integer; AActiveFieldName: string );
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure AssignCriteria( AFromDate, AToDate: TDateTime; AArcusto_ID, AGroup_ID, AShip_To_Id: Real );
    procedure ShowTotal( AMsg: string; AValue: Real );
    function SetExcelForecastFileName: boolean;
    function GetExcelForecastFileName: boolean;
    procedure ApplyPictureMask;
    procedure PostMessageToFormsLike( AClass: TClass; AMessageID: Integer; WParam: Integer=0; LParam: Integer=0 );
    procedure CheckUpdateShowingSavedValues;
    function GetShowingSavedForecastsValue: Boolean;
    procedure SetShowingSavedForecastsValue(Value: Boolean);
    procedure UpdateCaption;
    procedure RestoreGridFromRegistry;
    procedure SaveGridToRegistry;

    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure RebuildForecast;
    procedure AssignFixedCols;
    procedure LocateForeHead( AFore_Head_ID: Real; AReopen: Boolean = FALSE );
    procedure CheckDuplicatedForecastDetails(AFore_Head_ID: Real);
    procedure EnsureForeHeadIsOpen;
    procedure SetColumnsReadOnly;
    procedure UpdateForeItemStandard_ID(AStandard_ID: Real);
    procedure SetFore_Head_ID(const Value: Real);
  protected
    function GetArcusto_ID: Real;    override;
    function GetFromDate: TDateTime; override;
    function GetGroup_ID: Real;      override;
    function GetShip_To_ID: Real;    override;
    function GetToDate: TDateTime;   override;
    function GetFore_Head_ID: Real;  override;
    function GetFullItemInfo: Boolean; override;
    function GetForecastType: string; override;
    function GetExcludeNonSalable: Boolean; override;


  public
    { Public declarations }
    procedure PositionOnMonth( MM_YY: string );
    function GetActiveFieldMM: Integer;
    function GetActiveFieldYY: Integer;
    function GetActiveFieldDispalyLabel: string;
    property ShowingSavedForecastsValue: Boolean read GetShowingSavedForecastsValue write SetShowingSavedForecastsValue;
    function GetForecastName: string;
    //constructor Create( AOwner: TComponent; AFore_Head_ID: Real = 0 );
    property Fore_Head_ID: Real write SetFore_Head_ID;
  end;

procedure DoForecast;
procedure DoJumpForecast( AArinvt_ID: Real; MM_YY: string );

var
  FrmForecastMain   : TFrmForecastMain;
  FExcelForecastFile: string;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.PanelMsg,
  IQMS.Common.RegFrm,
  ForeEdit,
  IQMS.Common.Dialogs,
  ForeData,
  IQMS.Common.Numbers,
  ForeSele,
  IQMS.Common.StringUtils,
  ForeGrph,
  FR_Group,
  FrAssign,
  FR_Gen,
  FrSavDlg,
  FR_Param,
  FR_OnOrd,
  FR_Ship,
  ForeImport,
  IQMS.Common.HelpHook,
  ForeExport,
  IQMS.Common.NLS,
  Variants,
  ForeShare,
  ForeConfirmCopy,
  FR_Formulas,
  fore_calc,
  ExcelSele,
  fore_gen_rel_dlg,
  fore_qk_data_entry,
  IQMS.Common.Miscellaneous,
  fr_show_saved_values,
  IQMS.Common.Controls,
  fr_clone,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //WhereUsd,
  fore_ovr_cap_whiteboard,
  fore_lab_cap_whiteboard,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //EditMemoStr,
  IQMS.Web.MicrosoftExcel.Utils;

const
   cnstForecast  = 0;
   cnstShipped   = 1;
   cnstOnOrder   = 2;

   cnstQty       = 0;
   cnstAmt       = 1;

   cnstNewForeHead = 0;
   cnstRebuildForecast = 1;
   cnstPositionOnItemOnMMYY = 2;

type
  TCargoJump = class
    Arinvt_ID: Real;
    MM_YY: string;
    constructor Create( AArinvt_ID: Real; AMM_YY: string );
  end;

constructor TCargoJump.Create( AArinvt_ID: Real; AMM_YY: string );
begin
  Arinvt_ID:= AArinvt_ID;
  MM_YY    := AMM_YY;
end;




procedure DoForecast;
var
  FrmForecastMain : TFrmForecastMain;
begin
  FrmForecastMain := TFrmForecastMain.Create( uniGUIApplication.uniApplication );
  FrmForecastMain.Show;
end;

procedure DoJumpForecast( AArinvt_ID: Real; MM_YY: string );
var
  AFore_Head_ID: Real;
  AForm: TFrmForecastMain;
begin
  // find production forecast
  AFore_Head_ID:= SelectValueAsFloat('select id from fore_head where kind = ''P'' order by id');
  IQAssert( AFore_Head_ID > 0, 'No production forecast found - unable to jump to forecast');

  // reset filters
  ExecuteCommandFmt('update fore_head set arcusto_id = null, fr_group_id = null where id = %f', [ AFore_Head_ID ]);

  //AForm:= TFrmForecastMain.Create( Application, AFore_Head_ID );
  AForm := TFrmForecastMain.Create( uniGUIApplication.uniApplication );
  with AForm do
  begin
    Fore_Head_ID := AFore_Head_ID;
    Show;
    {PostMessage( Handle,
                 iq_Notify,
                 cnstPositionOnItemOnMMYY,
                 LongInt( TCargoJump.Create( AArinvt_ID, MM_YY)));}

    //  PositionOnMonth( MM_YY );
    //  if AArinvt_ID > 0 then
    //     if not DBGrid1.DataSource.DataSet.Locate('arinvt_id', AArinvt_ID, []) then
    //        IQWarning(Format('Unable to locate inventory item ID = %.0f', [ AArinvt_ID ]));
  end;
end;


(*constructor TFrmForecastMain.Create( AOwner: TComponent; AFore_Head_ID: Real = 0 );
begin
  inherited Create( AOwner );

  CS_Status:= TCriticalSection.Create;
  IQSetTablesActive( TRUE, self );

  IQRegFormRead( self, [ self, GroupBoxGeneral, pnlGeneralLeft, pnlFilterLeft ]);

  {init form}
  dbeForeHeadId.ReadOnly:= TRUE;
  AssignFixedCols;

  try
    if AFore_Head_ID > 0 then
       LocateForeHead( AFore_Head_ID, TRUE {Reopen} )  // note QryForeHead is opened and assigned AfterScroll in LocateForeHead
    else
       sbtnSearchForecastClick( nil );                 // note QryForeHead is opened and assigned AfterScroll in LocateForeHead
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      ABORT;
    end;
  end;
end;*)

procedure TFrmForecastMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CS_Status.Free;
  inherited;

  IQRegFormWrite( self, [ self, GroupBoxGeneral, pnlGeneralLeft, pnlFilterLeft ]);
  Application.OnShowHint:= NIL;

  SaveGridToRegistry;
end;

procedure TFrmForecastMain.FormCreate(Sender: TObject);
begin
  inherited;
  CS_Status:= TCriticalSection.Create;

  IQRegFormRead( self, [ self, GroupBoxGeneral, pnlGeneralLeft, pnlFilterLeft ]);

  {init form}
  dbeForeHeadId.ReadOnly:= TRUE;
  AssignFixedCols;

end;

procedure TFrmForecastMain.UniFormShow(Sender: TObject);
begin
  inherited;
  IQSetTablesActive( TRUE, self );
  try
    if FFore_Head_ID > 0 then
       LocateForeHead( FFore_Head_ID, TRUE {Reopen} )  // note QryForeHead is opened and assigned AfterScroll in LocateForeHead
    else
       sbtnSearchForecastClick( nil );                 // note QryForeHead is opened and assigned AfterScroll in LocateForeHead
  except on E:EAbort do
    begin
      //PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      ABORT;
    end;
  end;
end;

procedure TFrmForecastMain.FullItemInfo1Click(Sender: TObject);
begin
  // 05-22-2013 store the grid columns width and close dataset to avoid storing the column width after FullItemInfo1 is changing its state
  if DBGrid1.DataSource.DataSet.Active then
  begin
     SaveGridToRegistry;
     DBGrid1.DataSource.DataSet.Close;
  end;

  FullItemInfo1.Checked:= not FullItemInfo1.Checked;
  AssignFixedCols;

  QryForeHead.AfterScroll( QryForeHead );  // rebuild forecast
end;

procedure TFrmForecastMain.RestoreGridFromRegistry;
var
  N: Integer;

  procedure _check_restore( AFieldName: string; AFullItemInfo: Boolean = TRUE );
  begin
    if AFullItemInfo and IQRegIntegerScalarRead( self, AFieldName + '_WIDTH', N ) then
       { TODO -oSanketG -cWebConvert : Need to find alternative property for ColumnByName in TIQUniGridControl}
       //DBGrid1.ColumnByName( AFieldName ).DisplayWidth:= N;
  end;

begin
  _check_restore( 'ITEMNO'    );
  _check_restore( 'DESCRIP',  FullItemInfo );
  _check_restore( 'DESCRIP2', FullItemInfo );
  _check_restore( 'CLASS',    FullItemInfo );
  _check_restore( 'REV',      FullItemInfo );
  _check_restore( 'UNIT',     FullItemInfo );
  _check_restore( 'EPLANT_ID' );
  _check_restore( 'MFGNO'     );
  _check_restore( 'CODE'      );
end;

procedure TFrmForecastMain.SaveGridToRegistry;

  procedure _check_save( AFieldName: string; AFullItemInfo: Boolean = TRUE );
  begin
    if AFullItemInfo then
       { TODO -oSanketG -cWebConvert : Need to find alternative property for ColumnByName in TIQUniGridControl }
       //IQRegIntegerScalarWrite( self, AFieldName + '_WIDTH', DBGrid1.ColumnByName( AFieldName ).DisplayWidth );
  end;

begin
  _check_save( 'ITEMNO'    );
  _check_save( 'DESCRIP',  FullItemInfo );
  _check_save( 'DESCRIP2', FullItemInfo );
  _check_save( 'CLASS',    FullItemInfo );
  _check_save( 'REV',      FullItemInfo );
  _check_save( 'UNIT',     FullItemInfo );
  _check_save( 'EPLANT_ID' );
  _check_save( 'MFGNO'     );
  _check_save( 'CODE'      );
end;


procedure TFrmForecastMain.sbtnCurrentMonthClick(Sender: TObject);
begin
  PositionOnMonth( FormatDateTime( 'mmm-yyyy', Date ));
end;

procedure TFrmForecastMain.PositionOnMonth( MM_YY: string );
var
  AField: TField;
begin
  AField:= DBGrid1.DataSource.DataSet.FindField( MM_YY );

  if Assigned( AField ) then
  begin
     { TODO -oSanketG -cWebConvert : Need to find alternative property for SetActiveField, SelectedIndex in TIQUniGridControl }
     {DBGrid1.SetActiveField( MM_YY );
     TDrawGrid(DBGrid1).LeftCol:= DBGrid1.SelectedIndex + 1;}
  end
  else
     IQWarning(Format('Unable to locate %s', [ MM_YY ]));


  try DBGrid1.SetFocus except end;
end;

procedure TFrmForecastMain.SrcForecastDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(Sender) then with Sender as TDataSource, DataSet do
  begin
    StatusBar1.Panels[ 0 ].Text:= Format('Item: %s . %s . %s . %s',
                                         [ FieldByName( 'class').asString,
                                           FieldByName( 'itemno').asString,
                                           FieldByName( 'descrip').asString,
                                           FieldByName( 'rev').asString ]);
    if State = dsBrowse then
       CheckUpdateShowingSavedValues;
  end;
end;

procedure TFrmForecastMain.SrcForeHeadDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if Assigned(QryForeHead) and (QryForeHead.State = dsBrowse) then
  begin
    dbchkMakeToStock.Visible:= SecurityRegister1.Visible['dbchkMakeToStock']
                               and
                               (QryForeHeadKIND.asString = 'P');
    dbchkDoNotApplyMakeToStockToChild.Visible:= SecurityRegister1.Visible['dbchkDoNotApplyMakeToStockToChild']
                               and
                               (QryForeHeadKIND.asString = 'P');
  end;
end;

procedure TFrmForecastMain.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative property for GetActiveCol,FixedCols in TIQUniGridControl }
  {with DBGrid1 do
  if (Key = VK_RETURN) and (GetActiveCol >= FixedCols) then
     begin
       DBGrid1DblClick( NIL );
       Key:= 0;
     end}
end;

procedure TFrmForecastMain.TabSourceChange(Sender: TObject);
begin
  Qty_Amt:= TabQtyAmt.TabIndex;  {ForeBase.pas}
  OpenQuery;
end;

procedure TFrmForecastMain.OpenQuery( ASavePos: Boolean = TRUE );
var
   AArinvt_ID      : Real;
   AActiveRow      : Integer;
   AActiveFieldName: string;
   ALeftCol        : Integer;
   AForecast       : TForeBas;   {ForeData.pas }
   hMsg            : TPanelMesg;

   ASaveShowingSavedForecastsValue: Boolean;
begin
   try
     ASaveShowingSavedForecastsValue:= ShowingSavedForecastsValue;
     ShowingSavedForecastsValue:= FALSE;
     try
       hMsg:= hPleaseWait('');
       {Initialize}
       AArinvt_ID       := 0;
       AActiveRow       := -1;
       AActiveFieldName := '';
       ALeftCol         := 0;

       ASavePos:= ASavePos and SaveCurrentPos( AArinvt_ID, AActiveRow, ALeftCol, AActiveFieldName );
       try
         if DBGrid1.DataSource.DataSet.Active then
         begin
            SaveGridToRegistry;
            DBGrid1.DataSource.DataSet.Close;
         end;

         case TabSource.TabIndex of
           cnstForecast: AForecast:= TForeCurrent.Create( self, QryForecast );  { ForeData.pas }
           cnstShipped : AForecast:= TForeShipped.Create( self, QryForecast );  { ForeData.pas }
           cnstOnOrder : AForecast:= TForeOnOrder.Create( self, QryForecast );  { ForeData.pas }
         else
           raise Exception.Create('SQL not available');
         end;

         AForecast.BuildSQL;

         DBGrid1.Invalidate;
         DBGrid1.DataSource.DataSet.Open;
         RestoreGridFromRegistry;
         ApplyPictureMask;
       finally
         //AForecast.Free;
       end;

       if ASavePos then
          RestoreCurrentPos( AArinvt_ID, AActiveRow, ALeftCol, AActiveFieldName );

       UpdateCaption;
     finally
       pnlForecastMain.Enabled:= TRUE;

       if Assigned( hMsg ) then
          hMsg.Free;
       {restore SaveShowingSavedForecastsValue and refresh that window if it's up on the screen}
       ShowingSavedForecastsValue:= ASaveShowingSavedForecastsValue;
       CheckUpdateShowingSavedValues;
     end;
   except on E:Exception do
     raise;
   end;
end;

function TFrmForecastMain.SaveCurrentPos( var AArinvt_ID: Real; var AActiveRow, ALeftCol: Integer; var AActiveFieldName: string ): Boolean;
begin
  AArinvt_ID      := 0;
  AActiveRow      := -1;
  AActiveFieldName:= '';

  with DBGrid1, DataSource.DataSet do
  begin
    Result:= Active;
    if Result then
       begin
         AArinvt_ID      := Nz( FieldbyName('arinvt_id').asFloat, 0 );
         { TODO -oSanketG -cWebConvert : Need to find alternative method for GetActiveRow, GetActiveField in TIQUniGridControl }
         {AActiveRow      := GetActiveRow;
         AActiveFieldName:= GetActiveField.FieldName;}
         ALeftCol        := TDrawGrid(DBGrid1).LeftCol;
       end;
  end;
end;

procedure TFrmForecastMain.RestoreCurrentPos( AArinvt_ID: Real; AActiveRow, ALeftCol: Integer; AActiveFieldName: string );
var
  I: Integer;
begin
  with DBGrid1, DataSource.DataSet do
  begin
    if AActiveFieldName > '' then
       { TODO -oSanketG -cWebConvert : Need to find alternative method for SetActiveField in TIQUniGridControl }
       //DBGrid1.SetActiveField( AActiveFieldName );
    TDrawGrid(DBGrid1).LeftCol:= ALeftCol;

    Locate( 'arinvt_id', AArinvt_ID, []);

    // Forecast - focus on item gets stuck when toggling between tabs using filter for specific customer - Kaysun CRM# 439186
    // if (AActiveRow > -1) and (AActiveRow <> GetActiveRow) then
    // begin
    //    if AActiveRow < GetActiveRow then
    //       I:= GetRowCount - 1 - AActiveRow - 1
    //    else
    //       I:= -AActiveRow;
    //
    //    MoveBy( I );
    //
    //    try
    //      SetActiveRow( AActiveRow );
    //    except
    //      SetActiveRow( 0 );
    //    end;
    // end;
  end;
end;


procedure TFrmForecastMain.DBGrid1DblClick(Sender: TObject);
begin
  CheckEPlantIsMatching;
  QryForeHead.CheckBrowseMode;

  with DBGrid1 do
  { TODO -oSanketG -cWebConvert :  Need to find alternative method for GetActiveRow, GetActiveField in TIQUniGridControl }
  {if Pos( GetActiveField.FieldName, '__CLASS__ITEMNO__REV__DESCRIP__DESCRIP2__REV__UNIT__EPLANT_ID__CODE__MFGNO__GRAND_TOTAL__') = 0 then
     DoEditForecast( self, GetActiveField.DisplayLabel, DataSource.DataSet, Arcusto_ID, ForecastType, QryForeHeadID.asFloat ); } { ForeEdit.pas }
end;

procedure TFrmForecastMain.IQNotify(var Msg: TMessage);
var
  ACargo: TCargoJump;
begin
  case Msg.WParam of
     cnstNewForeHead:
         QryForeHead.Append;

     cnstRebuildForecast:
         RebuildForecast;

     cnstPositionOnItemOnMMYY:
         if Msg.LParam > 0 then
         try
           ACargo:= Pointer(Msg.LParam);
           PositionOnMonth( ACargo.MM_YY );
           if ACargo.Arinvt_ID > 0 then
              if not DBGrid1.DataSource.DataSet.Locate('arinvt_id', ACargo.Arinvt_ID, []) then
                 IQWarning(Format('Unable to locate inventory item ID = %.0f', [ ACargo.Arinvt_ID ]));
         finally
           ACargo.Free;
         end;
  end;
end;

procedure TFrmForecastMain.IQRefreshDataSets( var Msg: TMessage );
var
  N: Real;
  AArinvt_ID: Real;
  AFrom, ATo: TDateTime;
  S: string;
  AFore_Head_ID: Real;
begin
  {WParam - Year, LParam - Month}
  if TabSource.TabIndex = cnstForecast then
     with DBGrid1, DataSource.DataSet do
     begin
       AArinvt_ID   := FieldByName('arinvt_id').asFloat;
       AFrom        := EncodeDate( Msg.WParam, Msg.LParam, 1 );  {YY, MM, DD}
       ATo          := IncMonth( AFrom, 1 ) - 1;
       AFore_Head_ID:= QryForeHeadID.asFloat;

       case TabQtyAmt.TabIndex of
         cnstQty: S:= 'select Sum(qty) ';
         cnstAmt: S:= 'select Sum(ext_price) ';
       end;

       S:= IQFormat('%s from v_fore_item               ' +
                    '  where arinvt_id = %f            ' +
                    '    and fore_head_id = %f         ' +
                    '    and to_date(''01-''|| NVL(MM,1) || ''-'' || NVL(YY,1), ''DD-MM-RRRR'') between to_date(''%s'', ''MM/DD/RRRR'') and to_date(''%s'', ''MM/DD/RRRR'') ',
                    [ S,
                      AArinvt_ID,
                      AFore_Head_ID,
                      FormatDateTime( 'MM/DD/YYYY', AFrom ),
                      FormatDateTime( 'MM/DD/YYYY', ATo )]);
       if Arcusto_ID > 0 then
       begin
          S:= IQFormat('%s and arcusto_id = %f', [ S, Arcusto_ID ]);
          S:= StrTran(S, ' v_fore_item ', ' v_fore_cust ');
       end;

       N:= SelectValueAsFloat(S);

       Edit;
       { TODO -oSanketG -cWebConvert :  Need to find alternative method for GetActiveField in TIQUniGridControl }
       //GetActiveField.AsFloat:= N;
       Post;

       DBGrid1.Update;
     end;
end;

procedure TFrmForecastMain.QryForecastBeforeInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmForecastMain.QryForecastUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  {just keep DBGrid displying results - the actual data is posted in ForeEdit.pas}
  AAction := eaApplied;
end;

procedure TFrmForecastMain.QryForeHeadAfterPost(DataSet: TDataSet);
var
  AReopen: Boolean;
begin
  AReopen:= FALSE;

  // commit
  ApplyUpdate(DataSet);

  // ensure only 1 production forecast
  if FDesignateAsProduction and (QryForeHeadKIND.asString = 'P') then
  begin
    FDesignateAsProduction:= FALSE;
    ExecuteCommandFmt('declare                                              '+
              '  v_fore_head_id number:= %f;                        '+
              'begin                                                '+
                 // turn any other existing P to S
              '  update fore_head set kind = ''S''                  '+
              '   where kind = ''P'' and id <> v_fore_head_id;      '+

                 // delete any forecast explosion
              '  delete from fore_dtl                               '+
              '   where id in (select fore_dtl_id                   '+
              '                  from v_forecast                    '+
              '                 where fore_head_id = v_fore_head_id '+
              '                   and parent_id is not null);       '+
              'end;                                                 ',
              [ QryForeHeadID.asFloat ]);

    AReopen:= TRUE;
  end;

  LocateForeHead( QryForeHeadID.asFloat, AReopen );
end;


procedure TFrmForecastMain.LaborWhiteboardCapacity1Click(Sender: TObject);
var
  AForm : TFrmForeLabCapWhiteboard;
begin
  inherited;

  QryForeHead.CheckBrowseMode;
  IQAssert( QryForeHeadKIND.asString = 'S', 'Forecast Labor Whiteboard Capacity is only available for ''Sales Analysis'' forecasts.');

  if QryForeHeadID.asFloat > 0 then
  begin
    Aform := TFrmForeLabCapWhiteboard.Create(uniGUIApplication.UniApplication);    // fore_lab_cap_whiteboard.pas
    AForm.Fore_Head_ID := QryForeHeadID.asFloat;
    AForm.Show;
  end;

end;

procedure TFrmForecastMain.LocateForeHead( AFore_Head_ID: Real; AReopen: Boolean = FALSE );
begin
  // reopen fore head query and refresh forecast
  QryForeHead.AfterScroll:= nil;
  try
    if AReopen then
       Reopen( QryForeHead );
    QryForeHead.Locate('ID', AFore_Head_ID, []);
  finally
    QryForeHead.AfterScroll:= QryForeHeadAfterScroll;
  end;

  if Assigned(QryForeHead.AfterScroll) then
     QryForeHead.AfterScroll( QryForeHead );
end;


procedure TFrmForecastMain.EnsureForeHeadIsOpen;
begin
  if QryForeHead.State <> dsInactive then
     System.EXIT;

  QryForeHead.AfterScroll:= nil;
  try
    Reopen( QryForeHead );
  finally
    QryForeHead.AfterScroll:= QryForeHeadAfterScroll;
  end;
end;


procedure TFrmForecastMain.QryForeHeadBeforePost(DataSet: TDataSet);
begin
  inherited;

  IQAssert( (QryForeHeadSTART_DATE.asDateTime > 0)
            and
            (QryForeHeadEND_DATE.asDateTime > 0)
            and
            (QryForeHeadEND_DATE.asDateTime > QryForeHeadSTART_DATE.asDateTime ),
            'Valid Start Date and End Date must be entered - operation aborted.');

  FDesignateAsProduction:= FALSE;
  if (SelectValueByID('kind', 'fore_head', QryForeHeadID.asFloat ) <> 'P') and (QryForeHeadKIND.asString = 'P') then
  begin
    FDesignateAsProduction:= IQWarningYN(Format('Only one forecast can be marked ''Production'' - '+
                                                'are you sure you want to designate forecast ''%s'' as Production Forecast?',
                                                [ QryForeHeadNAME.asString ]));
    if not FDesignateAsProduction then
       ABORT;

    CheckDuplicatedForecastDetails( QryForeHeadID.asFloat );
  end;

  if not dbchkMakeToStock.Checked then
    QryForeHeadDONT_MAKE_TO_STOCK_CHILD.Clear;
end;

procedure TFrmForecastMain.QryForeHeadCalcFields(DataSet: TDataSet);
begin
  inherited;  // n

  if QryForeHeadARCUSTO_ID.asFloat > 0 then
     QryForeHeadCustNo.asString:= SelectValueByID('custno', 'arcusto', QryForeHeadARCUSTO_ID.asFloat );

  if QryForeHeadFR_GROUP_ID.asFloat > 0 then
     QryForeHeadGroupName.asString:= SelectValueByID('code', 'fr_group', QryForeHeadFR_GROUP_ID.asFloat );
end;

procedure TFrmForecastMain.QryForeHeadNewRecord(DataSet: TDataSet);
var
  ABoM: TDateTime;
begin
  inherited;

  ABoM:= SelectValueAsFloat('select trunc(sysdate,''MM'') from dual');
  QryForeHeadSTART_DATE.asDateTime:= IncMonth( ABoM, -6 );
  QryForeHeadEND_DATE.asDateTime  := IncMonth( ABoM, 6 );
  QryForeHeadKIND.asString:= 'S';
  try  dbeForecastName.SetFocus; except {supress surprises} end;

  IQAssignIDBeforePost( DataSet, 'FORE_HEAD');
end;

procedure TFrmForecastMain.sbtnPivotClick(Sender: TObject);
var
  hMsg : TPanelMesg;
begin
  CheckEPlantIsMatching;

  hMsg:= hPleaseWait( 'Accessing Excel, please wait...' );
  try
    PivotTable1.ExportFileName:= IQMS.Common.Miscellaneous.IQGetLocalHomePath + '_IQForecastTempPivotTable.TXT';      { IQMS.Common.Miscellaneous.pas }
    PivotTable1.Execute;
    Sleep(1000);
  finally
    hMsg.Free;
  end;
end;

procedure TFrmForecastMain.Exit(Sender: TObject);
begin
  Close;
end;

procedure TFrmForecastMain.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmForecastMain.QryForecastBeforeOpen(DataSet: TDataSet);
begin
  AssignParamsQuery( DataSet );  {ForeBase.pas}
  AssignEPlantFilter( DataSet ); {ForeBase}
end;

procedure TFrmForecastMain.QryExportBeforeOpen(DataSet: TDataSet);
var
  AParam1: TFDParam;
  AParam2: TFDParam;
  AParam3: TFDParam;
  AParam4: TFDParam;
  AParam5: TFDParam;
  AParam6: TFDParam;
  AParam7: TFDParam;
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('afrom_date').AsDateTime := FExportFromDate;
    ParamByName('ato_date').asDateTime   := FExportToDate;

    AParam1:= Params.FindParam('aarcusto_id');
    AParam2:= Params.FindParam('all_customers');

    AParam3:= Params.FindParam('group_id');
    AParam4:= Params.FindParam('any_group');

    AParam5:= Params.FindParam('aship_to_id');
    AParam6:= Params.FindParam('any_ship_to');

    AParam7:= Params.FindParam('exclude_non_salable');

    {Arcusto}
    if Assigned( AParam1 ) then
    begin
      AParam1.DataType:= ftFloat;
      AParam1.AsFloat := FExportArcusto_ID;
    end;

    if Assigned( AParam2 ) then
    begin
      AParam2.DataType:= ftFloat;
      AParam2.AsFloat := iIIf( FExportArcusto_ID = 0, 1, 0);
    end;

    {Group}
    if Assigned( AParam3 ) then
    begin
      AParam3.DataType:= ftFloat;
      AParam3.AsFloat := FExportGroup_ID;
    end;

    if Assigned( AParam4 ) then
    begin
      AParam4.DataType:= ftFloat;
      AParam4.AsFloat := iIIf( FExportGroup_ID = 0, 1, 0);
    end;

    {Ship_To}
    if Assigned( AParam5 ) then
    begin
      AParam5.DataType:= ftFloat;
      AParam5.AsFloat := FExportShip_To_ID;
    end;

    if Assigned( AParam6 ) then
    begin
      AParam6.DataType:= ftFloat;
      AParam6.AsFloat := iIIf( FExportShip_To_ID = 0, 1, 0);
    end;

    {Fore_Head}
    if Params.FindParam('fore_head_id') <> nil then
       ParamByName('fore_head_id').asFloat:= FFore_Head_ID;

    if Assigned(AParam7) then
    begin
      AParam7.DataType:= ftString;
      AParam7.AsString:= IQMS.Common.StringUtils.BoolToYN( ExcludeNonSalable );
    end;
  end;

  AssignEPlantFilter( DataSet ); {ForeBase}
end;

procedure TFrmForecastMain.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  // with HintInfo do
  //   if HintControl = sbtnFilter then
  //      HintStr:= ForecastCriteriaDescription;
end;

procedure TFrmForecastMain.sbtnFilterClick(Sender: TObject);
var
  AFromDate, AToDate: TDateTime;
  AArcusto_ID       : Real;
  AGroup_ID         : Real;
  AShip_To_Id       : Real;
begin
  AFromDate  := FromDate;
  AToDate    := ToDate;
  AArcusto_ID:= Arcusto_ID;
  AGroup_ID  := Group_ID;
  AShip_To_Id := Ship_To_ID;

  DoForecastFilter( AFromDate, AToDate, AArcusto_ID, AGroup_ID );  {ForeSele.pas}

  if (FromDate <> AFromDate) or (ToDate <> AToDate) or (Arcusto_ID <> AArcusto_ID) or (Group_ID <> AGroup_ID) then
  begin
    AssignCriteria( AFromDate, AToDate, AArcusto_ID, AGroup_ID, AShip_To_Id);
    OpenQuery( FALSE );
    // sbtnCurrentMonthClick( NIL );
  end;
end;

procedure TFrmForecastMain.AssignCriteria( AFromDate, AToDate: TDateTime; AArcusto_ID, AGroup_ID, AShip_To_Id: Real );
begin
  inherited;
end;


procedure TFrmForecastMain.ItemInfoFixed1Click(Sender: TObject);
begin
  ItemInfoFixed1.Checked:= not ItemInfoFixed1.Checked;
  AssignFixedCols;
end;

procedure TFrmForecastMain.AssignFixedCols;
begin
   { TODO -oSanketG -cWebConvert : Need to find alternative property for FixedCols in TIQUniGridControl }
  {with DBGrid1 do
    if ItemInfoFixed1.Checked then
         FixedCols:= iIIf( FullItemInfo1.Checked, 6, 1 )
      else
         FixedCols:= 0;}
end;

procedure TFrmForecastMain.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
 {do not allow columns move}
 if FromIndex <> ToIndex then
 begin
   IQWarning('You cannot move columns around. Forecast query will be now rebuilt');
   OpenQuery;
 end;
end;

procedure TFrmForecastMain.MonthTotal1Click(Sender: TObject);
var
  BM    : TBookMark;
  HMsg  : TPanelMesg;
  A     : Real;
  AField: TField;
begin
  A:= 0;
  with QryForecast do
  try
    BM:= BookMark;
    HMsg:= hPleaseWait('');
    DisableControls;
    { TODO -oSanketG -cWebConvert : Need to find alternative property for Fields,SelectedIndex in TIQUniGridControl }
    //AField:= DBGrid1.Fields[ DBGrid1.SelectedIndex ];
    First;
    while not Eof do
    begin
      A:= A + AField.asFloat;
      Next;
    end;
  finally
    BookMark:= BM;
    EnableControls;
    HMsg.Free;
  end;
  ShowTotal( 'Month Total:', A );
end;

procedure TFrmForecastMain.ItemTotal1Click(Sender: TObject);
var
  I: Integer;
  A: Real;
begin
  A:= 0;
  with QryForecast do
    for I:= 0 to FieldCount - 1 do
      if Pos( '-', Fields[ I ].FieldName ) > 0 then
         A:= A + Fields[ I ].asFloat;
  ShowTotal( 'Item Total:', A );
end;

procedure TFrmForecastMain.ShowTotal( AMsg: string; AValue: Real );
begin
  case TabQtyAmt.TabIndex of
    cnstQty: IQConfirm( Format( '%s %.0f',  [ AMsg, AValue ]));
    cnstAmt: IQConfirm( Format( '%s %.2m', [ AMsg, AValue ]));
  end;
end;

procedure TFrmForecastMain.Print1Click(Sender: TObject);
begin
  CheckEPlantIsMatching;

  IQRepDef1.Execute;
end;

procedure TFrmForecastMain.PrintSetup1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //PrinterSetupDialog1.Execute;
end;

procedure TFrmForecastMain.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmForecastMain.sbtnGraphClick(Sender: TObject);
begin
   DoShowForecastGraph(SrcForecast );
end;

procedure TFrmForecastMain.ForecastGroups1Click(Sender: TObject);
begin
  DoForecastGroups;  {FR_Group.pas}
end;

procedure TFrmForecastMain.AssignGroupstoInvItems1Click(Sender: TObject);
begin
  CheckEPlantIsMatching;
  DoFrGroupAssign( );  {FrAssign.pas}
  OpenQuery;
end;

procedure TFrmForecastMain.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    OpenQuery;
    ABORT;
  end;
end;

procedure TFrmForecastMain.Generate1Click(Sender: TObject);
begin
  CheckEPlantIsMatching;
  DoForecastGenerate( VarArrayOf( [ Arcusto_ID,
                                          DBGrid1.DataSource.DataSet.FieldByName('arinvt_id').asFloat,
                                          ForecastType,
                                          QryForeHeadID.asFloat ])); {FR_Gen.pas}
  OpenQuery;
end;

procedure TFrmForecastMain.Backup1Click(Sender: TObject);
begin
 CheckEPlantIsMatching;
  DoBackupRestoreForecast(  );                        {FrSavDlg.pas}
  OpenQuery;
end;

procedure TFrmForecastMain.Restore1Click(Sender: TObject);
begin
  CheckEPlantIsMatching;
  DoBackupRestoreForecast(  'Restore' );             {FrSavDlg.pas}
  OpenQuery;
end;

procedure TFrmForecastMain.QryForecastAfterOpen(DataSet: TDataSet);
begin
  inherited;                            {nothing}
  IQCheckAssign1000Separator( DataSet );
  SetColumnsReadOnly;
end;

procedure TFrmForecastMain.SetColumnsReadOnly;
var
  I: Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative property for ColumnByName in TIQUniGridControl }
  {for I:= 0 to QryForecast.Fields.Count - 1 do
    if Assigned( DBGrid1.ColumnByName( QryForecast.Fields[I].FieldName )) and (QryForecast.Fields[I].FieldName <> 'MFGNO') then
       DBGrid1.ColumnByName( QryForecast.Fields[I].FieldName ).ReadOnly:= TRUE;}
end;

procedure TFrmForecastMain.Parameters1Click(Sender: TObject);
begin
  inherited; {Nothing}

  DoForecastParams(  );  {FR_Param.pas}

  { TODO -oSanketG -cWebConvert : Need to revisit }
  //NavMain.BtnClick( nbRefresh );
end;

procedure TFrmForecastMain.DrillDown1Click(Sender: TObject);
begin
  inherited;  {nothing}
  with DBGrid1 do
    case TabSource.TabIndex of
      cnstForecast: DBGrid1DblClick( NIL );    {like edit}
      { TODO -oSanketG -cWebConvert : Need to find alternative method GetActiveField in TIQUniGridControl }
      {cnstShipped : DoForecastShowShipped( VarArrayOf([ GetActiveField.DisplayLabel, DataSource.DataSet.FieldByName('arinvt_id').asFloat, Arcusto_ID ]));
      cnstOnOrder : DoForecastShowOnOrder( VarArrayOf([ GetActiveField.DisplayLabel, DataSource.DataSet.FieldByName('arinvt_id').asFloat, Arcusto_ID ]));}
    end;
end;

procedure TFrmForecastMain.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmForecast{CHM}, iqhtmForecast{HTM} );  {IQMS.Common.HelpHook.pas}
  Application.OnShowHint:= DoOnShowHint;
end;

procedure TFrmForecastMain.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 998200 );
end;

function TFrmForecastMain.SetExcelForecastFileName: boolean;
begin
  with SaveDialog1 do
  begin
    {Setup SaveDialog Properties}
    Title      := 'Set Excel Forecast File Name...';
    Filter     := 'Microsoft Excel Files|*.xls';
    FilterIndex:= 1;
    FileName   := '';

    if Execute then
      begin
        FExcelForecastFile:= FileName;
        Result:= True;
      end
    else
        Result:= False;
  end;
end;

procedure TFrmForecastMain.SetFore_Head_ID(const Value: Real);
begin
  FFore_Head_ID := Value;
end;

procedure TFrmForecastMain.ExplodeForecast1Click(Sender: TObject);
var
  AFore_Head_ID: Real;
  hMsg         : TPanelMesg;
begin
  QryForeHead.CheckBrowseMode;
  if QryForeHeadID.asFloat = 0 then
     System.EXIT;
  IQAssert( QryForeHeadKIND.asString = 'S', 'Forecast Explosion is only available for ''Sales Analysis'' forecasts.');

  if not IQConfirmYN('Are you sure you want to run ''Explode Forecast''? ') then
     System.EXIT;

  AFore_Head_ID:= QryForeHeadID.asFloat;
  hMsg:= hPleaseWait('');
  try
    ExecuteCommandFmt('begin forecast_mat_req.do_main( %f ); end;', [ AFore_Head_ID]);
  finally
    LocateForeHead( QryForeHeadID.asFloat , TRUE );
    hMsg.Free;
  end;
end;

procedure TFrmForecastMain.ExporttoExcel1Click(Sender: TObject);
begin
  CheckEPlantIsMatching;

  FExportFromDate  := FromDate;
  FExportToDate    := ToDate;
  FExportArcusto_ID:= Arcusto_ID;
  FExportGroup_ID  := Group_ID;
  FExportShip_To_ID:= Ship_To_ID;

  if not DoExcelFilter( FExportFromDate, FExportToDate, FExportArcusto_ID, FExportGroup_ID, FExportShip_To_ID ) then {ExcelSele.pas}
     ABORT;

  // prompt for excel forecast file name
  if not SetExcelForecastFileName then
     ABORT;

  // see QryExport before open
  with TIQExportForecastToExcel.Create( self ) do
  try
    Execute;
  finally
    //Free;
  end;
end;

function TFrmForecastMain.GetExcelForecastFileName: boolean;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit }
  (*with OpenDialog1 do
  begin
    {Setup OpenDialog Properties}
    Title      := 'Get Excel Forecast File Name...';
    Filter     := 'Microsoft Excel Files|*.xls;*.xlsx;*.xlsm|Any File|*.*';
    FilterIndex:= 1;
    FileName   := '';

    if Execute then
      begin
        FExcelForecastFile:= FileName;
        Result:= True;
      end
    else
        Result:= False;
  end;*)
end;

function TFrmForecastMain.GetExcludeNonSalable: Boolean;
begin
  Result:= QryForeHeadEXCLUDE_NON_SALABLE.asString = 'Y';
end;

procedure TFrmForecastMain.ImportfromExcel1Click(Sender: TObject);
begin
  // 05-02-2013 Forecast - Cannot import an excel file into the Kind Production Forecast - CRM #752032 Wise Plastics Technologies
  // IQAssert( QryForeHeadKIND.asString <> 'P', 'Forecast kind must be ''Sales Analysis'' to import from Excel. Please change the forecast kind and try again.');

  if QryForeHeadID.asFloat = 0 then
     ABORT;

  CheckEPlantIsMatching;

  // prompt for excel forecast file name
  if not GetExcelForecastFileName then Abort;

  // inherited; nothing
  with TIQImportForecastFromExcel.Create( self, QryForeHeadID.asFloat ) do
  try
    Execute;
  finally
    //Free;
  end;
end;

procedure TFrmForecastMain.PkArinvtBeforeOpen(DataSet: TDataSet);
begin
  // IQAssignEPlantFilter( DataSet );   {pas}
  AssignEPlantFilter( DataSet ); {ForeBase}
end;

procedure TFrmForecastMain.PkForeHeadIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  inherited;  // n
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( Handle, iq_Notify, cnstNewForeHead, 0 );   { "New" }
end;

procedure TFrmForecastMain.PkMfgBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  TFDQuery(DataSet).ParamByName('arinvt_id').asFloat:= DBGrid1.Datasource.DataSet.FieldByName('arinvt_id').asFLoat;
end;

procedure TFrmForecastMain.PopupMenu1Popup(Sender: TObject);
begin
  inherited;

  Copy1.Enabled := SecurityRegister1.Enabled['Copy1']  and
                   (QryForecast.FieldByName('arinvt_id').asFloat > 0);

  Paste1.Enabled:= SecurityRegister1.Enabled['Paste1'] and
                   (FFore_Arinvt_ID_Copy > 0)          and
                   (FFore_Arinvt_ID_Copy <> QryForecast.FieldByName('arinvt_id').asFloat) and
                   (QryForecast.FieldByName('arinvt_id').asFloat > 0);
end;

procedure TFrmForecastMain.Copy1Click(Sender: TObject);
begin
  FFore_Arinvt_ID_Copy:= QryForecast.FieldByName('arinvt_id').asFloat;
end;


procedure TFrmForecastMain.Paste1Click(Sender: TObject);
var
  ACopyPasteParams: TCopyPasteParams;
begin
  with ACopyPasteParams do
  begin
    Arinvt_ID_Src:= FFore_Arinvt_ID_Copy;
    Arinvt_ID_Trg:= QryForecast.FieldByName('arinvt_id').asFloat;
    CutOffDate   := EncodeDate( GetActiveFieldYY, GetActiveFieldMM, 1);
    Fore_Head_ID := QryForeHeadID.asFloat;
  end;

  if TFrmConfirmCopy.DoShowModal( ACopyPasteParams ) then
  begin
    ExecuteCommandFmt('begin forecast.copy_releases( %f, %f, %f, to_date(''%s'', ''mm/dd/yyyy''), %f, ''%s'', ''%s''); end;',
              [ ACopyPasteParams.Fore_Head_ID,
                ACopyPasteParams.Arinvt_ID_Src,
                ACopyPasteParams.Arinvt_ID_Trg,
                IQDateTimeToStrEnglish( ACopyPasteParams.CutOffDate ),  // FormatDateTime( 'mm/dd/yyyy', ACopyPasteParams.CutOffDate ),
                ACopyPasteParams.Ship_To_ID,
                ForecastType,
                ACopyPasteParams.Delete_Src ]);
    OpenQuery(TRUE);
  end;
end;


procedure TFrmForecastMain.QryPivotBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet as TFDQuery do
    ParamByName('fore_head_id').asFloat:= QryForeHeadID.asFloat;
end;

procedure TFrmForecastMain.comboForecastTypeCloseUp(Sender: TObject);
begin
  inherited; {nothing}

  { TODO -oSanketG -cWebConvert : Need to revisit }
  //NavMain.BtnClick( nbRefresh );
end;

procedure TFrmForecastMain.ForecastFormulas1Click(Sender: TObject);
begin
  inherited; {nothing}
  CheckEPlantIsMatching;
  TFrmFR_Formulas.DoShowModal; {FR_Formulas.pas}
end;

procedure TFrmForecastMain.EvaluateBestFormula1Click(Sender: TObject);
var
  AFore_Item_ID: Real;
begin
  inherited; {nothing}

  CheckEPlantIsMatching;

  {ensure fore_item record exists}
  AFore_Item_ID:= SelectValueFmtAsFloat( 'select ID from fore_item where arinvt_id = %f and fore_head_id = %f',
                             [ QryForecast.FieldByName('arinvt_id').asFloat, QryForeHeadID.asFloat ]);
  if AFore_Item_ID = 0 then
  begin
    AFore_Item_ID:= GetNextID( 'FORE_ITEM' ) ;
    ExecuteCommandFmt('insert into fore_item( id, arinvt_id, fore_head_id) values(%f, %f, %f)',
              [ AFore_Item_ID, QryForecast.FieldByName('arinvt_id').asFloat, QryForeHeadID.asFloat ]);
  end;

  {now call evaluation form}
  TFrmForeCalc.DoShow(  AFore_Item_ID, ForecastType ); {fore_calc.pas}
end;

procedure TFrmForecastMain.Search1Click(Sender: TObject);
begin
  inherited;  // nothing
  with PkArinvt do
    if Execute then
      DBGrid1.DataSource.DataSet.Locate( 'arinvt_id', GetValue('ID'), [] );
end;

procedure TFrmForecastMain.SearchAKA1Click(Sender: TObject);
begin
  inherited;  // nothing
  with PkAKA do
    if Execute then
      DBGrid1.DataSource.DataSet.Locate( 'arinvt_id', GetValue('ID'), [] );
end;

procedure TFrmForecastMain.SecurityRegister1AfterApply(Sender: TObject);
begin
  inherited;

  // 04/05/2016
  IQMS.Common.Controls.IQShowControl(
    [ExcelPivotTable1, ExporttoExcel1, ImportfromExcel1],
    IQMS.Web.MicrosoftExcel.Utils.IsMicrosoftExcelInstalled,
    SecurityRegister1);
end;

procedure TFrmForecastMain.QryExportCalcFields(DataSet: TDataSet);
begin
  QryExportShipToAttn.asString := SelectValueFmtAsString('select attn from ship_to where id = %f', [QryExportSHIP_TO_ID.asFloat]);
end;

procedure TFrmForecastMain.GenerateReleases1Click(Sender: TObject);
var
  ACargo: TForeGenRelCargo;
begin
  if QryForecast.FieldByName('arinvt_id').asFloat = 0 then
     System.EXIT;

  if TFrmForecasrGenerateReleaseDlg.DoShowModal(  ACargo ) then  {fore_gen_rel_dlg.pas}
  begin
    ExecuteCommandFmt('begin                                                          '+
              '  forecast.generate_releases( %f,                              '+  // v_fore_head_id
              '                              %f,                              '+  // v_arinvt_id
              '                              %d,                              '+  // v_releases_count
              '                              %f,                              '+  // v_qty_per
              '                              to_date(''%s'', ''mm/dd/yyyy''), '+  // v_start_date
              '                              %f,                              '+  // v_interval
              '                              ''%s'',                          '+  // v_overwrite
              '                              %f,                              '+  // v_arcusto_id_in
              '                              %f );                            '+  // v_ship_to_id_in
              'end; ',
              [ QryForeHeadID.asFloat,                                            // v_fore_head_id
                QryForecast.FieldByName('arinvt_id').asFloat,                     // v_arinvt_id
                ACargo.Count,                                                     // v_releases_count
                ACargo.Qty_Per,                                                   // v_qty_per
                FormatDateTime('mm/dd/yyyy', ACargo.Start_Date),                  // v_start_date
                ACargo.Interval,                                                  // v_interval
                IQMS.Common.StringUtils.BoolToYN( ACargo.Overwrite ),                            // v_overwrite
                ACargo.Arcusto_ID,                                                // v_arcusto_id_in
                ACargo.Ship_To_ID ]);                                             // v_ship_to_id_in
    OpenQuery;
  end;
end;

procedure TFrmForecastMain.sbtnQuickDataEntryClick(Sender: TObject);
begin
  inherited;  {n}
  CheckEPlantIsMatching;

  TFrmForeQuickDataEntry.DoShowModal( QryForeHeadID.asFloat, DBGrid1.DataSource.DataSet.FieldByName('arinvt_id').asFloat );  // fore_qk_data_entry.pas
  OpenQuery;
end;

procedure TFrmForecastMain.sbtnSearchForecastClick(Sender: TObject);
begin
  inherited;  // n

  with PkForeHead do
    if Execute then
       begin
         if GetValue('id') = 0 then  // add new fore_head
            EnsureForeHeadIsOpen
         else
            LocateForeHead( GetValue('id'), not QryForeHead.Active {Reopen} )
       end
    else
       ABORT;
end;

procedure TFrmForecastMain.sbtnWhiteboardClick(Sender: TObject);
begin
  inherited;  // n
  QryForeHead.CheckBrowseMode;
  if QryForeHeadID.asFloat = 0 then
     System.EXIT;
  IQAssert( QryForeHeadKIND.asString = 'S', 'Whiteboard functionality is only available for ''Sales Analysis'' forecasts.');

  { TODO -oSanketG -cWebConvert : Need to revisit
  [dcc32 Error] ForeMain.pas(1818): E2250 There is no overloaded version of 'PopupMenuFor' that can be called with these arguments}
  //IQMS.Common.Controls.PopupMenuFor( sbtnWhiteboard, popmWhiteboard );
end;

procedure TFrmForecastMain.ApplyPictureMask;
var
  I: Integer;
begin
  for I:= 0 to DBGrid1.DataSource.DataSet.Fields.Count - 1 do with DBGrid1.DataSource.DataSet do
    if Fields[ I ] is TFloatField then
       if Qty_Amt = 0 then
          TFloatField(Fields[ I ]).DisplayFormat:= '###,###,###,###.##'
       else
          TFloatField(Fields[ I ]).DisplayFormat:= '###,###,###.######';
end;

procedure TFrmForecastMain.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TFrmForecastMain.EPlantFilter1Click(Sender: TObject);
begin
  if SoftEPlant1.ChangeEPlantView then
     OpenQuery;
end;

procedure TFrmForecastMain.SaveForecast1Click(Sender: TObject);
var
  h: TPanelMesg;
  aCount:Real;
begin
  // inherited;  // n
  // if TFrmForecastSaveToHist.Execute( self ) then  // FR_HistDlg.pas
  //    UpdateCaption;

  aCount := SelectValueFmtAsFloat('select count(id) from EDI_PARTNERS_TS where fore_head_id = %f', [QryForeHeadID.asFloat]);

  if aCount = 0 then
  begin
    if not IQConfirmYN(Format('Are you sure you want to archive forecast ''%s''?', [ QryForeHeadNAME.asString ])) then
       System.EXIT;
  end
  else
  begin
    if not IQConfirmYN(Format('If you continue to archive forecast ''%s'', its association with all EDI trading partners will be removed in Trading Partner Profile Maintenance. Please contact your EDI Administrator for more information.' + #13#13 +
                              'Are you sure you want to archive forecast ''%s''?', [ QryForeHeadNAME.asString, QryForeHeadNAME.asString ])) then
       System.EXIT;

    ExecuteCommandFmt('update EDI_PARTNERS_TS set fore_head_id = null where fore_head_id = %f', [QryForeHeadID.asFloat])
  end;
  h:= hPleaseWait('');
  try
    ExecuteCommandFmt('begin                             '+
              '  forecast_hist.do_backup( %f );  '+   // v_fore_hist_id
              'end;                              ',
              [ QryForeHeadID.asFloat ]);
    Reopen( QryForeHead );
  finally
    h.Free;
  end;
end;

procedure TFrmForecastMain.OpenForecast1Click(Sender: TObject);
begin
  inherited;
  with PkForeHist do
    if Execute and IQConfirmYN(Format('Are you sure you want to restore forecast ''%s''?', [ GetValue('name') ])) then
    begin
      ExecuteCommandFmt('begin forecast_hist.do_restore( %f ); end;', [ DtoF( GetValue('ID'))]);
      LocateForeHead( GetValue('ID'), TRUE );
    end;
end;

procedure TFrmForecastMain.CompareForecasts1Click(Sender: TObject);
begin
  inherited;  // n
  TFrmForecastShowSavedValues.DoShow(  ); // fr_show_saved_values.pas
end;


function TFrmForecastMain.GetActiveFieldMM: Integer;
begin
  try
    { TODO -oSanketG -cWebConvert : Need to find alternative method for GetActiveField in TIQUniGridControl }
    //Result:= IQMS.Common.NLS.IQMonthStrToMonth( GetToken( UpperCase( DBGrid1.GetActiveField.DisplayLabel ), '-', 1 ));
  except
    Result:= 0;
  end;
end;


function TFrmForecastMain.GetActiveFieldYY: Integer;
begin
  try
    { TODO -oSanketG -cWebConvert : Need to find alternative method for GetActiveField in TIQUniGridControl }
    //Result:= StrToInt( GetToken( UpperCase( DBGrid1.GetActiveField.DisplayLabel ), '-', 2 ) );
  except
    Result:= 0;
  end;
end;


function TFrmForecastMain.GetActiveFieldDispalyLabel: string;
begin
  try
    { TODO -oSanketG -cWebConvert : Need to find alternative method for GetActiveField in TIQUniGridControl }
    //Result:= DBGrid1.GetActiveField.DisplayLabel;
  except
    Result:= 'N/A';
  end;
end;


procedure TFrmForecastMain.DBGrid1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if Highlight then System.EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace

  else if (QryForecast.FieldByName('HAS_LEVEL').asFloat = 1)
          and
          (Pos( Field.FieldName, '__CLASS__ITEMNO__REV__DESCRIP__DESCRIP2__REV__UNIT__EPLANT_ID__CODE__MFGNO__') = 0)
          and
          (Field.AsFloat > 0) then
     begin
        ABrush.Color:= iIIf( QryForecast.FieldByName('standard_id').asFloat > 0, clBlue, clYellow );
        AFont.Color := iIIf( QryForecast.FieldByName('standard_id').asFloat > 0, clWhite, clBlack );
     end;
end;

procedure TFrmForecastMain.DBGrid1CellChanged(Sender: TObject);
begin
  inherited;
  CheckUpdateShowingSavedValues;
end;

procedure TFrmForecastMain.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    LocateForeHead( QryForeHeadID.asFloat, TRUE );
    ABORT;
  end;
end;

procedure TFrmForecastMain.CheckUpdateShowingSavedValues;
begin
  if ShowingSavedForecastsValue then
     PostMessageToFormsLike( TFrmForecastShowSavedValues, iq_RefreshDataSets );
end;

procedure TFrmForecastMain.ClearComboDlg(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;  // n

  if (Key = VK_DELETE) and (Sender is TUniEdit) then
  begin
    QryForeHead.Edit;

    if Sender = wwDBComboDlgFrGroup then
       QryForeHeadFR_GROUP_ID.Clear

    else if Sender = wwDBComboDlgCust then
       QryForeHeadARCUSTO_ID.Clear;

    (Sender as TUniEdit).Text:= '';

    Key:= 0;
  end;
end;

procedure TFrmForecastMain.CloneForecast1Click(Sender: TObject);
var
  ATrgFore_Head_ID: Real;
begin
  inherited; // n

  if TFrmForecastClone.DoShowModal( QryForeHeadID.asFloat, ATrgFore_Head_ID ) then
     LocateForeHead( ATrgFore_Head_ID, TRUE );
end;

procedure TFrmForecastMain.CloseQuery;
begin
  QryForecast.Close;
  pnlForecastMain.Enabled:= FALSE;
end;

procedure TFrmForecastMain.PostMessageToFormsLike( AClass: TClass; AMessageID: Integer; WParam: Integer=0; LParam: Integer=0 );
var
  I: Integer;
begin
  for I:= Screen.FormCount - 1 downto 0 do     {Check to see if this thing is already running}
    if Screen.Forms[ I ] is AClass then
       PostMessage( Screen.Forms[ I ].Handle, AMessageID, WParam, LParam );
end;

function TFrmForecastMain.GetShowingSavedForecastsValue: Boolean;
begin
  CS_Status.Acquire;
  try
    Result:= FShowingSavedForecastsValue;
  finally
    CS_Status.Release;
  end;
end;

procedure TFrmForecastMain.SetShowingSavedForecastsValue(Value: Boolean);
begin
  CS_Status.Acquire;
  try
    FShowingSavedForecastsValue:= Value;
  finally
    CS_Status.Release;
  end;
end;

function TFrmForecastMain.GetForecastName: string;
begin
  Result:= QryForeHeadNAME.asString; // SelectValueAsString('select name from fore_head');
end;

function TFrmForecastMain.GetForecastType: string;
begin
  Result:= QryForeHeadKIND.asString;
end;

procedure TFrmForecastMain.UpdateCaption;
var
  S: string;
begin
  S:= GetForecastName();
  if S = '' then
     S:= 'Forecast';
  Caption:= Format('%s [EPlant: %s]',
                   [ S,
                     IIf( SoftEPlant1.EPlant_ID = 'NULL', 'ALL', SoftEPlant1.EPlant_ID )]);
end;

procedure TFrmForecastMain.WhereUsed1Click(Sender: TObject);
begin
  inherited;  // n

  { TODO -oSanketG -cWebConvert : Need to revisit }
  {if QryForecast.FieldByName('arinvt_id').asFloat > 0 then
     DoWhereUsed( self, QryForecast.FieldByName('arinvt_id').asFloat );  // WhereUsd.pas}
end;

procedure TFrmForecastMain.WhiteboardCapacity1Click(Sender: TObject);
var
  AForm : TFrmForeOvrCapWhiteboard;
begin
  inherited;  // n

  QryForeHead.CheckBrowseMode;
  IQAssert( QryForeHeadKIND.asString = 'S', 'Forecast Whiteboard Capacity is only available for ''Sales Analysis'' forecasts.');

  if QryForeHeadID.asFloat > 0 then
  begin
    AForm := TFrmForeOvrCapWhiteboard.Create(uniGUIApplication.UniApplication);  // fore_ovr_cap_whiteboard.pas
    AForm.Fore_Head_ID := QryForeHeadID.asFloat;
    AForm.Show;
  end;

end;

procedure TFrmForecastMain.wwDBComboDlgCustCustomDlg(Sender: TObject);
begin
  inherited;  // n
  with PkCustomer do
    if Execute then
    begin
      QryForeHead.Edit;
      QryForeHeadARCUSTO_ID.asFloat:= GetValue('id');
    end;
end;

procedure TFrmForecastMain.wwDBComboDlgFrGroupCustomDlg(Sender: TObject);
begin
  inherited;
  with PkGroup do
    if Execute then
    begin
      QryForeHead.Edit;
      QryForeHeadFR_GROUP_ID.asFloat:= GetValue('id');
    end;
end;


function TFrmForecastMain.GetArcusto_ID: Real;
begin
  Result:= QryForeHeadARCUSTO_ID.asFloat;
end;

function TFrmForecastMain.GetFromDate: TDateTime;
begin
  Result:= QryForeHeadSTART_DATE.asDateTime;
end;

function TFrmForecastMain.GetFullItemInfo: Boolean;
begin
  Result:= FullItemInfo1.Checked;
end;

function TFrmForecastMain.GetGroup_ID: Real;
begin
  Result:= QryForeHeadFR_GROUP_ID.asFloat;
end;

function TFrmForecastMain.GetShip_To_ID: Real;
begin
  Result:= QryForeHeadSHIP_TO_ID.asFloat;
end;

function TFrmForecastMain.GetToDate: TDateTime;
begin
  Result:= QryForeHeadEND_DATE.asDateTime;
end;

function TFrmForecastMain.GetFore_Head_ID: Real;
begin
  Result:= QryForeHeadID.asFloat;
end;

procedure TFrmForecastMain.RebuildForecast;
begin
  TabSourceChange( nil );
  RestoreGridFromRegistry;
end;

procedure TFrmForecastMain.QryForeHeadAfterScroll(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
     CloseQuery  // close Forecast query
  else
     //PostMessage( Handle, iq_Notify, cnstRebuildForecast, 0 );   { "Rebuild Forecast" }
end;


procedure TFrmForecastMain.CheckDuplicatedForecastDetails( AFore_Head_ID: Real );
var
  AIsConsumeByMonthly: Boolean;
  AFore_Cust_ID: Real;
  ACustNo: string;
  AItemNo: string;
begin
  AIsConsumeByMonthly:= SelectValueAsString('select fr_consume_monthly from params') = 'Y';

  if AIsConsumeByMonthly then
     {avoid same DAY when consumed monthly}
     AFore_Cust_ID:= SelectValueFmtAsFloat('select d.fore_cust_id               '+
                               ' from fore_item i,                  '+
                               '      fore_cust c,                  '+
                               '      fore_dtl d                    '+
                               'where                               '+
                               '      i.fore_head_id = %f           '+
                               '  and i.id = c.fore_item_id         '+
                               '  and c.id = d.fore_cust_id         '+
                               'group by d.fore_cust_id,            '+
                               '         d.req_date,                '+
                               '         nvl(ship_to_id,0)          '+
                               'having count(*) > 1                 ',
                               [ AFore_Head_ID ])
  else
     {avoid same WEEK when consumed weekly}
     AFore_Cust_ID:= SelectValueFmtAsFloat('select d.fore_cust_id               '+
                               ' from                               '+
                               '      fore_item i,                  '+
                               '      fore_cust c,                  '+
                               '      fore_dtl d                    '+
                               'where                               '+
                               '      i.fore_head_id = %f           '+
                               '  and i.id = c.fore_item_id         '+
                               '  and c.id = d.fore_cust_id         '+
                               'group by d.fore_cust_id,            '+
                               '         d.year,                    '+
                               '         d.week,                    '+
                               '         nvl(ship_to_id,0)          '+
                               'having count(*) > 1                 ',
                               [ AFore_Head_ID ]);

  if AFore_Cust_ID = 0 then    // no duplicates - good!
     System.EXIT;

  ACustNo:= SelectValueFmtAsString('select b.custno from fore_cust a, arcusto b where a.id = %f and a.arcusto_id = b.id', [ AFore_Cust_ID ]);
  AItemNo:= SelectValueFmtAsString('select c.itemno from fore_cust a, fore_item b, arinvt c          '+
                         ' where a.id = %f and a.fore_item_id = b.id and b.arinvt_id = c.id',
                         [ AFore_Cust_ID ]);

  raise Exception.CreateFmt('Duplicate forecast requirements found for item# %s and customer %s - operation aborted',
                            [ Trim(AItemNo), Trim(ACustNo) ]);
end;

procedure TFrmForecastMain.DDApplyClick(Sender: TObject);
var
  Arinvt_id:real;
  APrice: Real;
  AQry:TFDQuery;
  ASysDate:TDateTime;
begin
  Arinvt_id := DBGrid1.DataSource.Dataset.FieldByName('arinvt_id').asFloat;
  AQry := TFDQuery.Create(nil);
  try
    AQry.Connection := UniMainModule.FDConnection1;
    AQry.Sql.Add(IqFormat('select f.id,                          ' +
                          '       f.ship_to_id,                  ' +
                          '       i.id as fore_item_id,          ' +
                          '       i.arinvt_id,                   ' +
                          '       c.arcusto_id,                  ' +
                          '       d.req_date,                    ' +
                          '       d.qty,                         ' +
                          '       d.price,                       ' +
                          '       d.id as fore_dtl_id            ' +
                          '  from fore_head f,                   ' +
                          '       fore_item i,                   ' +
                          '       fore_cust c,                   ' +
                          '       fore_dtl d,                    ' +
                          '       arinvt a                       ' +
                          ' where f.id = %f                      ' +
                          '   and i.fore_head_id = f.id          ' +
                          '   and a.id = %f                      ' +
                          '   and a.id = i.arinvt_id             ' +
                          '   and c.fore_item_id = i.id          ' +
                          '   and d.fore_cust_id = c.id          ' +
                          '   and misc.eplant_filter_include_nulls(a.eplant_id) = 1                                                                                                                 ' +
                          '   and ((NVL(f.fr_group_id, 0) = 0) or ((NVL(f.fr_group_id, 0) <> 0) and a.fr_group_id = NVL(f.fr_group_id, 0)))                                                         ' +
                          '   and ((NVL(f.arcusto_id, 0) = 0) or ((NVL(f.arcusto_id, 0) <> 0) and c.arcusto_id = NVL(f.arcusto_id, 0)))                                                             ' +
                          '   and ( (f.start_date is null and f.end_date is null) or ( (f.start_date is not null and f.end_date is not null)  and d.req_date between f.start_date and f.end_date) ) ',
                          [QryForeHeadID.asFloat, Arinvt_id]));
   AQry.Open;
   if not (AQry.eof and AQry.bof) then
   begin
     while not AQry.Eof do
     begin
       ASysDate:= AQry.FieldByName('REQ_DATE').asDateTime;
       TFrmEditForecast.AssignUnitPrice_Ex( Arinvt_ID, AQry.FieldByName('arcusto_id').asFloat, AQry.FieldByName('QTY').asFloat, APrice, ASysDate, AQry.FieldByName('ship_to_id').asFloat );
       ExecuteCommandFmt('update fore_dtl set price = %.6f where id = %f', [APrice, AQry.FieldByName('fore_dtl_id').asFloat]);
       AQry.Next;
     end;
   end;
  finally
    AQry.Free;
  end;
end;

procedure TFrmForecastMain.Updatepriceforallitems1Click(Sender: TObject);
var
  Arinvt_id:real;
begin
  Arinvt_id := DBGrid1.DataSource.Dataset.FieldByName('arinvt_id').asFloat;
  DBGrid1.DataSource.Dataset.first;
  while not DBGrid1.DataSource.Dataset.eof do
  begin
    DDApplyClick(nil);
    DBGrid1.DataSource.Dataset.Next;
  end;
  DBGrid1.DataSource.Dataset.Locate('ARINVT_ID', Arinvt_id, []);
  IQInformation( 'Prices updated.');
end;


procedure TFrmForecastMain.wwDBComboDlgMfgNoCustomDlg(Sender: TObject);
begin
  if TabSource.TabIndex <> cnstForecast then
     System.EXIT;

  if not PkMfg.Execute or (PkMfg.GetValue('id') = QryForecast.FieldByName('standard_id').asFloat) then
       System.EXIT;

  UpdateForeItemStandard_ID( PkMfg.GetValue('id'));
end;


procedure TFrmForecastMain.wwDBComboDlgMfgNoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_DELETE then
  begin
    UpdateForeItemStandard_ID( 0 );
    Key:= 0;
  end;
end;

procedure TFrmForecastMain.UpdateForeItemStandard_ID( AStandard_ID: Real );
var
  AFore_Item_ID : Real;
begin
  AFore_Item_ID:= SelectValueFmtAsFloat( 'select id from fore_item where arinvt_id = %f and fore_head_id = %f',
                             [ QryForecast.FieldByName('arinvt_id').asFloat, QryForeHeadID.asFloat ]);
  IQAssert(AFore_Item_ID > 0, 'Unable to establish fore_item.id - operation aborted');

  ExecuteCommandFmt('update fore_item set standard_id = %s where id = %f',
            [ IQMS.Common.StringUtils.FloatToStr0asNull( AStandard_ID, 'null'),
              AFore_Item_ID ]);
  OpenQuery;
end;


procedure TFrmForecastMain.ShowSQL1Click(Sender: TObject);
begin
  inherited;
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //DoViewMemoStr(self, QryForecast.SQL.Text);
end;

end.
