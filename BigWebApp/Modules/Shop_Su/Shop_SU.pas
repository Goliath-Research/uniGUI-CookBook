unit Shop_SU;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.dbctrls,
  Mask,
  Data.DB,
  Spin,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.DBGrids,
  Shop_Shr,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniStatusBar,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniScrollBox, IQUniGrid, uniGUIFrame;

type
  TCalendarCargo = record
    Shifts       : Integer;
    Hrs_Day      : Real;
    Mfg_Days_Week: Integer;
    Shift_Start1 : string;
    Shift_Start2 : string;
    Shift_Start3 : string;
    Shift_Start4 : string;
  end;

  TShop_SetUp = class(TUniForm)
    SrcParams: TDataSource;
    StatusBar1: TUniStatusBar;
    TblParams: TFDTable;
    TblParamsSCHED_SCOPE: TBCDField;
    TblParamsMFG_SCOPE: TBCDField;
    TblParamsSHIFTS: TBCDField;
    TblParamsSHIFT_START1: TStringField;
    TblParamsSHIFT_START2: TStringField;
    TblParamsSHIFT_START3: TStringField;
    TblParamsMFG_DAYS_WEEK: TBCDField;
    TblParamsASSY_DAYS_WEEK: TBCDField;
    TblParamsSCHED_POOL_OVERRIDE: TStringField;
    TblParamsMFG_SHIFT1: TStringField;
    TblParamsMFG_SHIFT2: TStringField;
    TblParamsMFG_SHIFT3: TStringField;
    TblParamsASSY_SHIFT1: TStringField;
    TblParamsASSY_SHIFT2: TStringField;
    TblParamsASSY_SHIFT3: TStringField;
    SR: TIQWebSecurityRegister;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    STDLabourCapacity1: TUniMenuItem;
    Calendar1: TUniMenuItem;
    SetDefaultCalendar1: TUniMenuItem;
    AddHolidays1: TUniMenuItem;
    ScheduleDaysOff1: TUniMenuItem;
    TblParamsHRS_DAY: TBCDField;
    TblParamsDuration1: TFloatField;
    TblParamsDuration2: TFloatField;
    TblParamsDuration3: TFloatField;
    PageControl1: TUniPageControl;
    tabDefault: TUniTabSheet;
    tabMfgCell: TUniTabSheet;
    dbgridMfgCell: TUniDBGrid;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    NavMfgCellParam: TUniDBNavigator;
    SrcMfgCell: TDataSource;
    SrcMfgCell_Param: TDataSource;
    TblMfgCell_Param: TFDTable;
    TblMfgCell_ParamID: TBCDField;
    TblMfgCell_ParamDESCRIP: TStringField;
    TblMfgCell_ParamSHIFTS: TBCDField;
    TblMfgCell_ParamSHIFT_START1: TStringField;
    TblMfgCell_ParamSHIFT_START2: TStringField;
    TblMfgCell_ParamSHIFT_START3: TStringField;
    TblMfgCell_ParamMFG_DAYS_WEEK: TBCDField;
    TblMfgCell_ParamMFG_SHIFT1: TStringField;
    TblMfgCell_ParamMFG_SHIFT2: TStringField;
    TblMfgCell_ParamMFG_SHIFT3: TStringField;
    TblMfgCell_ParamHRS_DAY: TBCDField;
    TblMfgCell_ParamSCHED_SCOPE: TBCDField;
    TblMfgCell_ParamMFG_SCOPE: TBCDField;
    TblMfgCell_ParamDuration1Default: TFloatField;
    TblMfgCell_ParamDuration21Default: TFloatField;
    TblMfgCell_ParamDuration31Default: TFloatField;
    Panel3: TUniPanel;
    NavMainDefault: TUniDBNavigator;
    sbtnCopyFromDefault: TUniSpeedButton;
    PopupMenu1: TUniPopupMenu;
    SetCalendarForSelectedMfgCell1: TUniMenuItem;
    SetCalendarforALLMfgCells1: TUniMenuItem;
    Contents1: TUniMenuItem;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    DBText1: TUniDBEdit;
    DBText2: TUniDBEdit;
    DBText3: TUniDBEdit;
    dbeStart1Default: TUniDBEdit;
    dbeStart2Default: TUniDBEdit;
    dbeStart3Default: TUniDBEdit;
    GroupBox2: TUniGroupBox;
    Label7: TUniLabel;
    Label9: TUniLabel;
    Label5: TUniLabel;
    Label8: TUniLabel;
    dbeShiftsDefault: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    dbeMfgDaysWeek: TUniDBEdit;
    dbeAssyDaysWeek: TUniDBEdit;
    sbtnMfgDefaultShopCalendar: TUniSpeedButton;
    sbtnGenDefaultShopCalendar: TUniSpeedButton;
    Label4: TUniLabel;
    GroupBox3: TUniGroupBox;
    Label15: TUniLabel;
    Label16: TUniLabel;
    Label19: TUniLabel;
    sbtnMfgCellShopCalendar: TUniSpeedButton;
    dbeShiftsMfgCell: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    GroupBox4: TUniGroupBox;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    DBText4: TUniDBEdit;
    DBText5: TUniDBEdit;
    DBText6: TUniDBEdit;
    dbeStart1MfgCell: TUniDBEdit;
    dbeStart2MfgCell: TUniDBEdit;
    dbeStart3MfgCell: TUniDBEdit;
    Label6: TUniLabel;
    dbeText4Shift: TUniDBEdit;
    dbeStart4Default: TUniDBEdit;
    TblParamsSHIFT_START4: TStringField;
    TblParamsMFG_SHIFT4: TStringField;
    TblParamsASSY_SHIFT4: TStringField;
    TblParamsDuration4: TFloatField;
    Label20: TUniLabel;
    dbeShift4Mfgcell: TUniDBEdit;
    dbeStart4MfgCell: TUniDBEdit;
    TblMfgCell_ParamSHIFT_START4: TStringField;
    TblMfgCell_ParamMFG_SHIFT4: TStringField;
    TblMfgCell_ParamDuration4: TFloatField;
    dbchkDefaultDisableRTServerShiftReport: TUniDBCheckBox;
    dbchkMfgCellDisableRTServerShiftReport: TUniDBCheckBox;
    TblParamsRTSERVER_DISABLE_SHIFT_REPORT: TStringField;
    TblMfgCell_ParamRTSERVER_DISABLE_SHIFT_REPORT: TStringField;
    TabWorkCenter: TUniTabSheet;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    wwSrcWorkCenter: TDataSource;
    wwQryWorkCenter: TFDQuery;
    wwQryWorkCenterCNTR_DESC: TStringField;
    wwQryWorkCenterEQNO: TStringField;
    wwQryWorkCenterCNTR_TYPE: TStringField;
    wwQryWorkCenterMFG_TYPE: TStringField;
    wwQryWorkCenterMFGCELL: TStringField;
    wwQryWorkCenterID: TBCDField;
    pnlWorkcenterLeft01: TUniPanel;
    wwGridWorkCenter: TIQUniGridControl;
    Splitter2: TUniSplitter;
    PkWorkCenter: TIQWebHPick;
    PkWorkCenterID: TBCDField;
    PkWorkCenterEQNO: TStringField;
    PkWorkCenterCNTR_TYPE: TStringField;
    PkWorkCenterMFG_TYPE: TStringField;
    PkWorkCenterMFGCELL: TStringField;
    PkWorkCenterPK_HIDE: TStringField;
    Panel7: TUniPanel;
    GroupBox5: TUniGroupBox;
    Label21: TUniLabel;
    Label22: TUniLabel;
    Label23: TUniLabel;
    sbtnWorkCenterShopCalendar: TUniSpeedButton;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    wwQryWorkCenterSHIFTS: TBCDField;
    wwQryWorkCenterHRS_DAY: TBCDField;
    wwQryWorkCenterMFG_DAYS_WEEK: TBCDField;
    NavWorkCenter: TUniDBNavigator;
    Panel8: TUniPanel;
    Shape1: TUniPanel;
    FlowPanel1: TUniScrollBox;
    sbtnPkCenter: TUniSpeedButton;
    sbtnCopyToWorkcenterFromDefault: TUniSpeedButton;
    UpdateSQLWorkCenter: TFDUpdateSQL;
    PopupMenu2: TUniPopupMenu;
    SetCalendarforSelectedWorkCenter1: TUniMenuItem;
    pnlDefaultSettings: TUniPanel;
    pnlDefaultLeft01: TUniPanel;
    Splitter3: TUniSplitter;
    pnlSettings: TUniPanel;
    pgctrlDefaultSettings: TUniPageControl;
    TabSystem: TUniTabSheet;
    TabEPlant: TUniTabSheet;
    SrcOrigin: TDataSource;
    QryOrigin: TFDQuery;
    QryOriginORIGIN: TStringField;
    QryOriginSOURCE: TStringField;
    QryOriginID: TFMTBCDField;
    QryOriginSORT: TFMTBCDField;
    wwDBGridOrigin: TIQUniGridControl;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    sbtnCopyFromDefault2: TUniSpeedButton;
    navEplantParam: TUniDBNavigator;
    GroupBox6: TUniGroupBox;
    Label24: TUniLabel;
    Label25: TUniLabel;
    Label26: TUniLabel;
    SpeedButton2: TUniSpeedButton;
    dbeShiftsEPlant: TUniDBEdit;
    DBEdit8: TUniDBEdit;
    DBEdit9: TUniDBEdit;
    GroupBox7: TUniGroupBox;
    Label27: TUniLabel;
    Label28: TUniLabel;
    Label29: TUniLabel;
    Label30: TUniLabel;
    Label31: TUniLabel;
    Label32: TUniLabel;
    DBEdit10: TUniDBEdit;
    DBEdit11: TUniDBEdit;
    DBEdit12: TUniDBEdit;
    dbeStart1MfgCellEPlant: TUniDBEdit;
    dbeStart2MfgCellEPlant: TUniDBEdit;
    dbeStart3MfgCellEPlant: TUniDBEdit;
    DBEdit16: TUniDBEdit;
    dbeStart4MfgCellEPlant: TUniDBEdit;
    dbchkDisableRTServerShiftReportEPlant: TUniDBCheckBox;
    SrcEPlantMfgcellParam: TDataSource;
    QryOriginMFGCELL_PARAM_ID: TFMTBCDField;
    TblMfgCell_ParamEPlant: TFDTable;
    TblMfgCell_ParamEPlantID: TBCDField;
    TblMfgCell_ParamEPlantDESCRIP: TStringField;
    TblMfgCell_ParamEPlantSHIFTS: TBCDField;
    TblMfgCell_ParamEPlantSHIFT_START1: TStringField;
    TblMfgCell_ParamEPlantSHIFT_START2: TStringField;
    TblMfgCell_ParamEPlantSHIFT_START3: TStringField;
    TblMfgCell_ParamEPlantSHIFT_START4: TStringField;
    TblMfgCell_ParamEPlantMFG_DAYS_WEEK: TBCDField;
    TblMfgCell_ParamEPlantMFG_SHIFT1: TStringField;
    TblMfgCell_ParamEPlantMFG_SHIFT2: TStringField;
    TblMfgCell_ParamEPlantMFG_SHIFT3: TStringField;
    TblMfgCell_ParamEPlantMFG_SHIFT4: TStringField;
    TblMfgCell_ParamEPlantHRS_DAY: TBCDField;
    TblMfgCell_ParamEPlantSCHED_SCOPE: TBCDField;
    TblMfgCell_ParamEPlantMFG_SCOPE: TBCDField;
    TblMfgCell_ParamEPlantDuration31Default: TFloatField;
    TblMfgCell_ParamEPlantDuration21Default: TFloatField;
    TblMfgCell_ParamEPlantDuration1Default: TFloatField;
    TblMfgCell_ParamEPlantDuration4: TFloatField;
    TblMfgCell_ParamEPlantRTSERVER_DISABLE_SHIFT_REPORT: TStringField;
    UpdateSQLOrigin: TFDUpdateSQL;
    Panel6: TUniPanel;
    Shape2: TUniPanel;
    Panel12: TUniPanel;
    Shape3: TUniPanel;
    Panel9: TUniPanel;
    Shape4: TUniPanel;
    Shape5: TUniPanel;
    Shape6: TUniPanel;
    wwQryWorkCenterMFGCELL_PARAM_ID: TFMTBCDField;
    TblParamsID: TBCDField;
    QryMfgCell: TFDQuery;
    QryMfgCellMFGCELL: TStringField;
    QryMfgCellDESCRIP: TStringField;
    QryMfgCellMFGTYPE: TStringField;
    QryMfgCellEPLANT_ID: TBCDField;
    QryMfgCellID: TBCDField;
    QryMfgCellMFGCELL_PARAM_ID: TBCDField;
    QryMfgCellPROD_REP_METHOD: TStringField;
    QryMfgCellEPlant_Mfgcell_Param_ID: TFloatField;
    procedure dbeShiftsDefaultChange(Sender: TObject);
    procedure TblParamsSHIFT_START1Validate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnHolidaysClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure ScheduledHolidays1Click(Sender: TObject);
    procedure STDLabourCapacity1Click(Sender: TObject);
    procedure TblParamsCalcFields(DataSet: TDataSet);
    procedure TblParamsNewRecord(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure TblParamsBeforePost(DataSet: TDataSet);
    procedure TblParamsAfterPost(DataSet: TDataSet);
    procedure TblMfgCell_ParamAfterPost(DataSet: TDataSet);
    procedure TblMfgCell_ParamBeforePost(DataSet: TDataSet);
    procedure TblMfgCell_ParamBeforeDelete(DataSet: TDataSet);
    procedure sbtnCopyFromDefaultClick(Sender: TObject);
    procedure SetDefaultCalendar1Click(Sender: TObject);
    procedure SetCalendarForSelectedMfgCell1Click(Sender: TObject);
    procedure SetCalendarforALLMfgCells1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure sbtnMfgDefaultShopCalendarClick(Sender: TObject);
    procedure sbtnGenDefaultShopCalendarClick(Sender: TObject);
    procedure sbtnMfgCellShopCalendarClick(Sender: TObject);
    procedure sbtnPkCenterClick(Sender: TObject);
    procedure sbtnCopyToWorkcenterFromDefaultClick(Sender: TObject);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure sbtnWorkCenterShopCalendarClick(Sender: TObject);
    procedure wwQryWorkCenterBeforeEdit(DataSet: TDataSet);
    procedure wwQryWorkCenterBeforePost(DataSet: TDataSet);
    procedure SetCalendarforSelectedWorkCenter1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure SrcMfgCellDataChange(Sender: TObject; Field: TField);
    procedure SrcOriginDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbeShiftsEPlantChange(Sender: TObject);
    procedure TblMfgCell_ParamEPlantBeforePost(DataSet: TDataSet);
    procedure TblMfgCell_ParamEPlantBeforeDelete(DataSet: TDataSet);
    procedure QryOriginAfterPost(DataSet: TDataSet);
    procedure TblMfgCell_ParamEPlantAfterPost(DataSet: TDataSet);
    procedure QryMfgCellBeforeInsert(DataSet: TDataSet);
    procedure QryMfgCellCalcFields(DataSet: TDataSet);
    procedure dbgridMfgCellDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure wwQryWorkCenterBeforeRefresh(DataSet: TDataSet);
    procedure wwGridWorkCenterDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure wwDBGridOriginDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    SaveStatusBar: TStringList;
    nFatalErrors : integer;
    FMfgCell_ID  : Real;
    FMfgCell     : string;
    FMfgCell_Param_ID: Real;

    nYear    : Integer;
    Jan1     : TDateTime;         // This Year 1st shift date&time
    NextJan1 : TDateTime;         // Next Year 1st shift date&time
    Duration1: Real;
    Duration2: Real;
    Duration3: Real;
    Duration4: Real;
    //FirstShiftOfTheYear:Boolean;  // for a special case of 3 shifts where 1 and 3rd are not working

    FMfgCalendarWeek: TShopCalendarWeek; {Shop_Shr.pas array [1..7] of TShopCalendarDay}
    FGenCalendarWeek: TShopCalendarWeek;

    ParamsShiftModified: Boolean;
    ParamsDaysModifiedMfg: Boolean;
    ParamsDaysModifiedAsy: Boolean;

    ParamsModified: Boolean;

    MfgCellParamsModified: Boolean;
    MfgCellParamsShiftDaysModified: Boolean;

    WorkCenterShifts: Real;
    WorkCenterHrsDay: Real;
    WorkCenterMfgDaysWeek: Real;

    procedure SetDurations;
    procedure SetDurationsEx( AMfgCell_ID: Real );

    procedure PushStatusBar;
    procedure PopStatusBar;

    procedure ValidateAllFields;
    procedure EnableDBControls( nShifts:Integer );
    procedure DeleteDefault_Calendar( AMfgCell_ID: Real );
    procedure CreateDefault_Calendar( AMfgCell_ID: Real );
    procedure CheckDay( ADay:TDateTime; sAsy_Mach:string; nDays_Week, AShifts: Integer; Work1, Work2, Work3, Work4:Boolean; AMfgCell_ID: Real );
    procedure Delete_Calendar( AMfgCell_ID: Real);
    procedure Append_Calendar( AMfgCell_ID: Real);
    function AboutRTserverMessage: string;

    function GetShiftsDBEdit: TUniDBEdit;
    function GetParamTable: TFDTable;
    function GetParamTableDef: TFDTable;
    function GetStartDBEdit( I: Integer ): TUniDBEdit;
    function GetMfgShiftChk( I: Integer ): TUniDBCheckBox;
    procedure EnableButtons( AValue: Boolean );
    procedure DeleteShopCalendar(ASource: string; ASource_ID: Real);
    procedure AssignCalendarParams( ASource: string; ASource_ID: Real; var ACargo: TCalendarCargo);
    function WorkCenterHasMfgcellSpecificCalendar(AWork_Center_ID: Real;
      var AMfgCell_Param_ID: Real): Boolean;
    procedure SetCalendarByWorkCenter(AWork_Center_ID: Real);
    procedure AssignShopCalendarWeek(var AShopCalendarWeek: TShopCalendarWeek;
      ASource: string; ASource_ID: Real);
    procedure ResetWorkingDaysShifts(var AShopWeekCalendar: TShopCalendarWeek;
      AValue: Boolean);
    procedure GetJan1_Work_Center(AWork_Center_ID: Real; var AJan1,
      ANextJan1: TDateTime);
    function GetMfgCell_Param_ID(AMfgCell_ID: Real): Real;
    procedure PrepareParametersEx(var AShifts, nMFG_Days_Week, nASSY_Days_Week: Integer; var AAsy_Mach: string; AMfgCell_ID: Real);

  protected
    FConnection     : TFDConnection;
    property ShiftsDBEdit: TUniDBEdit read GetShiftsDBEdit;
    property StartDBEdit[ I: Integer ]: TUniDBEdit read GetStartDBEdit;
    property MfgShiftChk[ I: Integer  ]: TUniDBCheckBox read GetMfgShiftChk;

    property ParamTable  : TFDTable  read GetParamTable;
    property ParamTableDef: TFDTable read GetParamTableDef;
    procedure ResetUnusedStartTimes( nShifts: Integer );
    procedure DoSetCalendar( ASetUpType: TCalendarSetupType; AMfgCell_ID: Real );
    procedure SetCalendarByMfgCell( AMfgCell_ID: Real );
    procedure GetJan1(AMfgcell_ID: Real);

  public
    { Public declarations }
  end;

procedure ShopSetUp( AConnection: TFDConnection );
procedure ShopSetUpEx;

implementation

{$R *.DFM}

uses
  IQMS.Common.Applications,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
//  IQSecIns,
  IQMS.WebVcl.SecurityManager,
  Shop_Cal,
  Shop_Dlg,
  Shop_Hol,
  Shop_SU_rscstr,
  ShopSchd,
  StdLabor,
  System.Variants;


const
  {asy_mach field in default_calendar table}
  MFG_CNTR  = 'N';
  ASSY_CNTR = 'Y';

{External Procedure}
procedure ShopSetUp( AConnection: TFDConnection );
begin
  with TShop_SetUp.Create(uniGUIApplication.UniApplication) do
  try
    FConnection:= AConnection;
    ShowModal;
  finally
    Free;
  end;
end;

procedure ShopSetUpEx;
begin
  ShopSetUp( UniMainModule.FDConnection1 );
end;

{TShop_SetUp}
procedure TShop_SetUp.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustPageControlToParent( pgctrlDefaultSettings );



  ParamsModified:= FALSE;
  MfgCellParamsModified:= FALSE;

  SaveStatusBar:= TStringList.Create;
  PageControl1.ActivePage:= tabDefault;
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, dbgridMfgCell, pnlWorkcenterLeft01, wwGridWorkCenter, pnlDefaultLeft01 ]);
  ParamTable.Refresh;

  // compensate for security changes
//  IQMS.Common.Controls.ResizeNavBar(NavMfgCellParam);
//  IQMS.Common.Controls.ResizeNavBar(NavMainDefault);


end;

procedure TShop_SetUp.FormClose(Sender: TObject; var Action: TCloseAction);
var
  S: string;
begin
  // Shop_SU_rscstr.cRsc0000010 = 'Default Schedule: Save changes before exit?';
  if (TblParams.State in [dsEdit, dsInsert]) and
    IQWarningYN(Shop_SU_rscstr.cRsc0000010) then
     TblParams.Post;

  // Shop_SU_rscstr.cRsc0000011 = 'EPlant Schedule: Save changes before exit?';
  if (TblMfgCell_ParamEPlant.State in [dsEdit, dsInsert]) and
    IQWarningYN(Shop_SU_rscstr.cRsc0000011) then
     TblMfgCell_ParamEPlant.Post;

  // Shop_SU_rscstr.cRsc0000012 = 'Mfg Cell Schedule: Save changes before exit?';
  if (TblMfgCell_Param.State in [dsEdit, dsInsert]) and
    IQWarningYN(Shop_SU_rscstr.cRsc0000012) then
     TblMfgCell_Param.Post;

  IQRegFormWrite( self, [ self, dbgridMfgCell, pnlWorkcenterLeft01,
    wwGridWorkCenter, pnlDefaultLeft01 ]);

  if ParamsModified or MfgCellParamsModified then
  begin
    S:= AboutRTserverMessage;
    if S > '' then
       S:= S+#13;
    // Shop_SU_rscstr.cRsc0000009 =
    // 'You must update your calendar after changing shifts, ' +
    //  'hours, etc.';
    S:= S + Shop_SU_rscstr.cRsc0000009;
    IQWarning( S );
  end;
end;

procedure TShop_SetUp.FormDestroy(Sender: TObject);
begin
  SaveStatusBar.Free;
end;

function TShop_SetUp.GetShiftsDBEdit: TUniDBEdit;
begin
  if PageControl1.ActivePage = tabDefault then
     begin
       if pgctrlDefaultSettings.ActivePage = TabSystem then
          Result:= dbeShiftsDefault
       else
          Result:= dbeShiftsEPlant
     end
  else
     Result:= dbeShiftsMfgCell
end;

function TShop_SetUp.GetParamTable: TFDTable;
begin
  if PageControl1.ActivePage = tabDefault then
     begin
       if pgctrlDefaultSettings.ActivePage = TabSystem then
          Result:= TblParams
       else
          Result:= TblMfgCell_ParamEPlant
     end
  else
     Result:= TblMfgCell_Param;
end;

function TShop_SetUp.GetParamTableDef: TFDTable;
begin
   if (ParamTable = TblMfgCell_Param) and (TblMfgCell_ParamSHIFTS.asInteger > 0) then
      Result:= TblMfgCell_Param
   else if (ParamTable = TblMfgCell_ParamEPlant) and (TblMfgCell_ParamEPlantSHIFTS.asInteger > 0) then
      Result:= TblMfgCell_ParamEPlant
   else
      Result:= TblParams;
end;

function TShop_SetUp.GetStartDBEdit( I: Integer ): TUniDBEdit;
begin
  if PageControl1.ActivePage = tabDefault then
     if pgctrlDefaultSettings.ActivePage = TabSystem then
        case I of
          1: Result:= dbeStart1Default;
          2: Result:= dbeStart2Default;
          3: Result:= dbeStart3Default;
          4: Result:= dbeStart4Default;
        else
          Result:= dbeStart1Default;
        end
     else
        case I of
          1: Result:= dbeStart1MfgCellEPlant;
          2: Result:= dbeStart2MfgCellEPlant;
          3: Result:= dbeStart3MfgCellEPlant;
          4: Result:= dbeStart4MfgCellEPlant;
        else
          Result:= dbeStart1MfgCellEPlant;;
        end
  else
     case I of
       1: Result:= dbeStart1MfgCell;
       2: Result:= dbeStart2MfgCell;
       3: Result:= dbeStart3MfgCell;
       4: Result:= dbeStart4MfgCell;
     else
       Result:= dbeStart1MfgCell;
     end
end;

function TShop_SetUp.GetMfgShiftChk( I: Integer ): TUniDBCheckBox;
begin
  // ==
  // == if PageControl1.ActivePage = tabDefault then
  // ==    case I of
  // ==      1: Result:= dbchkMfgShift1Default;
  // ==      2: Result:= dbchkMfgShift2Default;
  // ==      3: Result:= dbchkMfgShift3Default;
  // ==    else
  // ==      Result:= dbchkMfgShift1Default;
  // ==    end
  // == else
  // ==    case I of
  // ==      1: Result:= dbchkMfgShift1MfgCell;
  // ==      2: Result:= dbchkMfgShift2MfgCell;
  // ==      3: Result:= dbchkMfgShift3MfgCell;
  // ==    else
  // ==      Result:= dbchkMfgShift1MfgCell;
  // ==    end
end;

procedure TShop_SetUp.TblParamsAfterPost(DataSet: TDataSet);
begin
  ParamsModified:= TRUE;
  //if IQWarningYN('You must update your calendar after changing shifts, hours etc.'#13#13'Would you like to do it now?') then
  //   btnSetCalendarClick( NIL );

  if ParamsShiftModified then
     begin
       ParamsDaysModifiedMfg:= TRUE; {force default down below}
       ParamsDaysModifiedAsy := TRUE;
     end;

  if ParamsDaysModifiedMfg then
     TFrmShopCalendar.DoAssignDefaultShiftSilent( self,                   {shop_cal.pas}
                                                  Shop_Shr.PARAMS         {source = 'PARAMS'},
                                                  1                       {source_id - virtual id for params for mfg});

  if ParamsDaysModifiedAsy then
     TFrmShopCalendar.DoAssignDefaultShiftSilent( self,                   {shop_cal.pas}
                                                  Shop_Shr.PARAMS         {source = 'PARAMS'},
                                                  2                       {source_id - virtual id for params for generic});
end;

function TShop_SetUp.AboutRTserverMessage: string;
begin
  with TFDStoredProc.Create( self ) do
  try
    Connection := UniMainModule.FDConnection1;
    StoredProcName:= 'RT_BOX';
    Params.CreateParam( ftDateTime, 'v_last',   ptInputOutput );
    Params.CreateParam( ftFmtBCD,  'v_result', ptInputOutput );
    Prepare;
    ExecProc;
    if ParamByName('v_result').AsInteger = 1 then   {RTServer is Up and Running!}
      // Shop_SU_rscstr.cRsc0000013 =
      // 'Attention!'#13#13'RTServer must be shut down and restarted ' +
      //  'before changes will take effect.';
      Result:= Shop_SU_rscstr.cRsc0000013
    else
      Result:= '';
    Close;
  finally
    Free;
  end;
end;

procedure TShop_SetUp.dbeShiftsDefaultChange(Sender: TObject);
var
  nShifts:Integer;
begin
  nShifts:= StrToIntDef( ShiftsDBEdit.Text, 1 );

  EnableDBControls( nShifts );         { en-dis-able a few Vcl.Buttons }

  ResetUnusedStartTimes( nShifts );
end;

procedure TShop_SetUp.EnableDBControls( nShifts:Integer );
begin
  StartDBEdit[ 1 ].Enabled:= nShifts >= 1;
  StartDBEdit[ 2 ].Enabled:= nShifts >= 2;
  StartDBEdit[ 3 ].Enabled:= nShifts >= 3;
  StartDBEdit[ 4 ].Enabled:= nShifts >= 4;

  // == MfgShiftChk[ 1 ].Enabled:= nShifts >= 1;
  // == MfgShiftChk[ 2 ].Enabled:= nShifts >= 2;
  // == MfgShiftChk[ 3 ].Enabled:= nShifts >= 3;

  // == if PageControl1.ActivePage = tabDefault then
  // == begin
  // ==   dbchkAssyShift1Default.Enabled:= nShifts >= 1;
  // ==   dbchkAssyShift2Default.Enabled:= nShifts >= 2;
  // ==   dbchkAssyShift3Default.Enabled:= nShifts >= 3;
  // == end;
end;

procedure TShop_SetUp.ResetUnusedStartTimes( nShifts: Integer );
begin
  with ParamTable do
  try
     OnCalcFields:= NIL;
     if State in [dsEdit, dsInsert] then                      { reset unused start times }
        case nShifts of
          1: begin
               FieldByName('SHIFT_START2').asString:= '00:00:00';
               FieldByName('SHIFT_START3').asString:= '00:00:00';
               FieldByName('SHIFT_START4').asString:= '00:00:00';
               FieldByName('MFG_SHIFT2'  ).asString:= 'N';
               FieldByName('MFG_SHIFT3'  ).asString:= 'N';
               FieldByName('MFG_SHIFT4'  ).asString:= 'N';
               if Assigned(FindField( 'ASSY_SHIFT2')) then       {this field exists in PARAMS only}
                  FieldByName('ASSY_SHIFT2' ).asString:= 'N';
               if Assigned(FindField( 'ASSY_SHIFT3')) then
                  FieldByName('ASSY_SHIFT3' ).asString:= 'N';
               if Assigned(FindField( 'ASSY_SHIFT4')) then
                  FieldByName('ASSY_SHIFT4' ).asString:= 'N';
             end;
          2: begin
               FieldByName('SHIFT_START3').AsString:= '00:00:00';
               FieldByName('SHIFT_START4').asString:= '00:00:00';
               FieldByName('MFG_SHIFT3'  ).asString  := 'N';
               FieldByName('MFG_SHIFT4'  ).asString:= 'N';
               if Assigned(FindField( 'ASSY_SHIFT3')) then
                  FieldByName('ASSY_SHIFT3' ).asString:= 'N';
               if Assigned(FindField( 'ASSY_SHIFT4')) then
                  FieldByName('ASSY_SHIFT4' ).asString:= 'N';
             end;
          3: begin
               FieldByName('SHIFT_START4').asString:= '00:00:00';
               FieldByName('MFG_SHIFT4'  ).asString:= 'N';
               if Assigned(FindField( 'ASSY_SHIFT4')) then
                  FieldByName('ASSY_SHIFT4' ).asString:= 'N';
             end;
        end;
  finally
     OnCalcFields:= TblParamsCalcFields;
  end;
end;

procedure TShop_SetUp.ValidateAllFields;
begin
  // At least 1 check box is checked in each group (mfg and assy)
  // == if not MfgShiftChk[ 1 ].Checked and not MfgShiftChk[ 2 ].Checked and not MfgShiftChk[ 3 ].Checked then
  // ==    if not IQWarningYN('No working shift is specified for MFG Centers - is that correct?') then
  // ==       ABORT;

  // == if PageControl1.ActivePage = tabDefault then
  // == begin
  // ==   if not dbchkAssyShift1Default.Checked and not dbchkAssyShift2Default.Checked and not dbchkAssyShift3Default.Checked then
  // ==      if not IQWarningYN('No working shift is specified for ASSY Centers - is that correct?') then
  // ==         ABORT;
  // == end;

  {Determine Duration of each shift}
  SetDurations;

  if Duration1 + Duration2 + Duration3 + Duration4 > 24.0000001 then
    // Shop_SU_rscstr.cRsc0000014 =
    // 'The combined time of Shift 1 + Shift 2 + Shift 3 + Shift 4 ' +
    // 'exceeds 24 hours.  Please check your time values.';
    raise Exception.Create(Shop_SU_rscstr.cRsc0000014);
end;

procedure TShop_SetUp.TblParamsSHIFT_START1Validate(Sender: TField);
begin
  try
    StrToTime( Sender.AsString )  // see if you can convert it
  except
    // Shop_SU_rscstr.cRsc0000015 =
    // 'Invalid Time Specification. Please enter the time in ' +
    // '"HH:MM:SS" format.';
    raise Exception.Create(Sender.DisplayLabel + ' : ' + Sender.AsString +
    ' - ' + Shop_SU_rscstr.cRsc0000015)
  end;
end;

procedure TShop_SetUp.PushStatusBar;
begin
  SaveStatusBar.Add( StatusBar1.Panels[0].Text );
end;

procedure TShop_SetUp.QryMfgCellBeforeInsert(DataSet: TDataSet);
begin
  ABORT;  {do not allow append}
end;

procedure TShop_SetUp.QryMfgCellCalcFields(DataSet: TDataSet);
begin
  if QryMfgCellEPLANT_ID.asFloat > 0 then
     QryMfgCellEPlant_Mfgcell_Param_ID.asFloat:= SelectValueByID('mfgcell_param_id', 'eplant', QryMfgCellEPLANT_ID.asFloat);
end;

procedure TShop_SetUp.QryOriginAfterPost(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TShop_SetUp.PopStatusBar;
var
  s:string;
begin
  with SaveStatusBar do begin
    s:= SaveStatusBar[Count - 1];
    Delete(Count-1);
    StatusBar1.Panels[0].Text:= s;
    StatusBar1.Update;
  end;
end;

procedure TShop_SetUp.SetDurations;
begin
  IQSetDurationsEx( Duration1, Duration2, Duration3, Duration4,
                    ParamTableDef.FieldByName('SHIFTS').asFloat,
                    ParamTableDef.FieldByName('SHIFT_START1').asString,
                    ParamTableDef.FieldByName('SHIFT_START2').asString,
                    ParamTableDef.FieldByName('SHIFT_START3').asString,
                    ParamTableDef.FieldByName('SHIFT_START4').asString,
                    ParamTableDef.FieldByName('HRS_DAY').asFloat );       {Shop_Shr.pas}
end;

procedure TShop_SetUp.SrcMfgCellDataChange(Sender: TObject; Field: TField);
begin
  dbchkMfgCellDisableRTServerShiftReport.Enabled:= (QryMfgCellPROD_REP_METHOD.asString <> 'W') and SR.Enabled['dbchkMfgCellDisableRTServerShiftReport'];
end;

procedure TShop_SetUp.SetDefaultCalendar1Click(Sender: TObject);
begin
  DoSetCalendar( stBoth, 0 );
end;

procedure TShop_SetUp.SetCalendarForSelectedMfgCell1Click(Sender: TObject);
begin
  if QryMfgCellID.asFloat > 0 then
     DoSetCalendar( stMfgCells, QryMfgCellID.asFloat );
end;

procedure TShop_SetUp.SetCalendarforALLMfgCells1Click(Sender: TObject);
begin
  DoSetCalendar( stMfgCells, 0 );
end;

procedure TShop_SetUp.DoSetCalendar( ASetUpType: TCalendarSetupType; AMfgCell_ID: Real );
//  TSetupType = (stDefault, stMfgCells, stBoth);
begin
  TblParams.CheckBrowseMode;
  QryOrigin.CheckBrowseMode;
  TblMfgCell_Param.CheckBrowseMode;
  wwQryWorkCenter.CheckBrowseMode;

  if not AskYearToSetup( nYear ) then  {Shop_Dlg.pas}
     EXIT;

  EnableButtons( FALSE );
  try
    nFatalErrors:= 0;
    PushStatusBar;
    // Shop_SU_rscstr.cRsc0000016 = 'Processing. Please wait ...';
    StatusBar1.panels[0].Text:= Shop_SU_rscstr.cRsc0000016;
    StatusBar1.Update;

    if ASetUpType in [stDefault, stBoth] then
    begin
      // By setting active page to be tagDefault I can use ParamTable property
      PageControl1.ActivePage:= tabDefault;
      pgctrlDefaultSettings.ActivePage:= TabSystem;
      Application.ProcessMessages;
      SetCalendarByMfgCell( 0 );
    end;

    { Process MfgCell(s) }
    if ASetUpType in [stMfgCells, stBoth] then
    begin
      PageControl1.ActivePage:= tabMfgCell;
      Application.ProcessMessages;
      with QryMfgCell do
      begin
        if AMfgCell_ID > 0 then Locate('ID', AMfgCell_ID, []) else  First;

        while not Eof do
        begin
          SetCalendarByMfgCell( FieldByName('id').asFloat );
          if AMfgCell_ID > 0 then
             BREAK;
          Next;
        end;
      end;
    end;

    // process work centers with dedicated calendar
    if ASetUpType in [stDefault, stBoth] then
    begin
      // Shop_SU_rscstr.cRsc0000017 = 'Processing work center specific calendar ... ';
      StatusBar1.Panels[0].text:= Shop_SU_rscstr.cRsc0000017;
      PageControl1.ActivePage:= TabWorkCenter;
      Reopen(wwQryWorkCenter);
      with wwQryWorkCenter do
        while not Eof  do
        begin
          Application.ProcessMessages;
          if FieldByName('shifts').asFloat > 0 then
             SetCalendarByWorkCenter( FieldByName('id').asFloat );
          Next;
        end;
    end;

  finally
    PopStatusBar;
    EnableButtons( TRUE );
    if nFatalErrors = 0 then
      // Shop_SU_rscstr.cRsc0000018 = 'Transaction completed successfully.';
      IQInformation(Shop_SU_rscstr.cRsc0000018)
    else
      // Shop_SU_rscstr.cRsc0000019 = 'Transaction completed with %d error(s)';
      IQWarning(Format(Shop_SU_rscstr.cRsc0000019, [ nFatalErrors ]));
    SR.Refresh;
    Screen.Cursor:= crDefault;
  end;
end;

procedure TShop_SetUp.EnableButtons( AValue: Boolean );
var
  I: Integer;
begin
  for I:= 0 to ComponentCount - 1 do
    if (Components[i] is TUniDBCheckBox) or (Components[i] is TUniDBEdit) or (Components[i] is TUniButton)  then
    begin
      if AValue then
        begin
          TWinControl(Components[ I ]).Enabled:= SR.Enabled[ Components[ I ].Name  ];
          EnableDBControls( ParamTable.FieldByName('SHIFTS').asInteger );
        end
      else
        TWinControl(Components[ I ]).Enabled:= FALSE;
    end;
end;

procedure TShop_SetUp.SetCalendarByMfgCell( AMfgCell_ID: Real );
begin
  try
    FMfgCell:= SelectValueFmtAsString('select descrip from mfgcell where id = %f', [ AMfgCell_ID ]);

    GetJan1( AMfgCell_ID );

    DeleteDefault_Calendar( AMfgCell_ID );
    CreateDefault_Calendar( AMfgCell_ID );

    Delete_Calendar( AMfgCell_ID );
    Append_Calendar( AMfgCell_ID );

    ParamsModified:= TRUE;
  except on E:Exception do
    Application.ShowException( E );
  end;
end;

procedure TShop_SetUp.GetJan1(AMfgcell_ID: Real);
var
  AShiftStart1     : string;
  AMfgcell_Param_ID: Real;
begin
   AMfgcell_Param_ID:= 0;
   if AMfgcell_ID > 0 then
      AMfgcell_Param_ID:= GetMfgCell_Param_ID( AMfgCell_ID );

   if AMfgcell_Param_ID > 0 then
      AShiftStart1:= SelectValueFmtAsString('select shift_start1 from mfgcell_param where id = %f', [ AMfgcell_Param_ID ])
   else
      AShiftStart1:= SelectValueAsString('select shift_start1 from params');

  Jan1    := IQStrToDateTime( IQFormat('01/01/%d %s', [ nYear,   AShiftStart1 ]));
  NextJan1:= IQStrToDateTime( IQFormat('01/01/%d %s', [ nYear+1, AShiftStart1 ]));
end;

procedure TShop_SetUp.DeleteDefault_Calendar(  AMfgCell_ID: Real );
var
  q: TFDQuery;
begin
  try
    try
      PushStatusBar;
      Screen.Cursor:= crHourGlass;
      // Shop_SU_rscstr.cRsc0000020 =
      // 'Mfg Cell: %s. Deleting default weekends/off shifts ...';
      // Shop_SU_rscstr.cRsc0000021 = 'N/A';
      StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000020,
      [ sIIf(FMfgCell = '', Shop_SU_rscstr.cRsc0000021, FMfgCell) ]);
      StatusBar1.Update;

      FConnection.StartTransaction;

      q:= TFDQuery.Create(self);
      q.Connection:= FConnection;
      q.SQL.Add('delete from default_calendar');
      q.SQL.Add(' where :Jan1 <= start_time and start_time < :NextJan1');
      if AMfgCell_ID > 0 then
         q.SQL.Add(IQFormat(' and mfgcell_id = %f', [ AMfgCell_ID ]))
      else
         q.SQL.Add( ' and mfgcell_id is NULL' );
      q.ParamByName('jan1').DataType:= ftDateTime;
      q.ParamByName('nextJan1').DataType:= ftDateTime;

      q.ParamByName('Jan1').asDateTime    := Jan1;
      q.ParamByName('NextJan1').asDateTime:= NextJan1;
      q.Prepare;
      q.ExecSQL;

      FConnection.Commit;
    except
      FConnection.RollBack;
      Inc(nFatalErrors);
      raise;
    end
  finally
    Screen.Cursor:= crDefault;
    Application.ProcessMessages;
    q.Close; q.Free;
    PopStatusBar;
  end;
end;

procedure TShop_SetUp.CreateDefault_Calendar( AMfgCell_ID: Real );
var
  ADay    : TDateTime;
  nMFG_Days_Week : Integer;
  nASSY_Days_Week: Integer;
  AShifts : Integer;
  Asy_Mach: string;
begin
  (* This procedure creates bunch of weekends, off shifts records for MFG and for ASSY (2 sets).
     DEFAULT_CALENDAR is a "generic" down time table that we use to calculate must-start
     date or end-date whenever press# is unknown but only whether it's a MFG or ASSY machine.
  *)
  try
    try
      PushStatusBar;
      Screen.Cursor:= crHourGlass;
      // Shop_SU_rscstr.cRsc0000022 =
      // 'Mfg Cell: %s. Creating default weekends/off shifts ...';
      // Shop_SU_rscstr.cRsc0000021 = 'N/A';
      StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000022,
      [ sIIf(FMfgCell = '', Shop_SU_rscstr.cRsc0000021, FMfgCell) ]); StatusBar1.Update;

      {Determine Duration of each shift}
      SetDurationsEx( AMfgCell_ID );

      {prepare some values for easier handling}
      PrepareParametersEx( AShifts, nMFG_Days_Week, nASSY_Days_Week, Asy_Mach, AMfgCell_ID );

      FConnection.StartTransaction;

      ADay:= Jan1;
      while ADay < NextJan1 do
        begin
          // Shop_SU_rscstr.cRsc0000023 =
          // 'Mfg Cell: %s. Creating default weekends/off shifts. ' +
          // 'Now processing %s';
          // Shop_SU_rscstr.cRsc0000021 = 'N/A';
          StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000023,
            [sIIf(FMfgCell = '', Shop_SU_rscstr.cRsc0000021, FMfgCell), DateToStr( ADay )]);
          StatusBar1.Update;

        Application.ProcessMessages;

        {MFG Center}
        CheckDay( ADay,
                  Asy_Mach,
                  nMFG_Days_Week,
                  AShifts,
                  FMfgCalendarWeek[ DayOfWeek( ADay ) ].Mfg1,
                  FMfgCalendarWeek[ DayOfWeek( ADay ) ].Mfg2,
                  FMfgCalendarWeek[ DayOfWeek( ADay ) ].Mfg3,
                  FMfgCalendarWeek[ DayOfWeek( ADay ) ].Mfg4,
                  AMfgCell_ID );

        {Same for assys}
        if PageControl1.ActivePage = tabDefault then
           CheckDay( ADay,
                     ASSY_CNTR,
                     nASSY_Days_Week,
                     AShifts,
                     FGenCalendarWeek[ DayOfWeek( ADay ) ].Mfg1,
                     FGenCalendarWeek[ DayOfWeek( ADay ) ].Mfg2,
                     FGenCalendarWeek[ DayOfWeek( ADay ) ].Mfg3,
                     FGenCalendarWeek[ DayOfWeek( ADay ) ].Mfg4,
                     0 );

        ADay:= ADay + 1;  // next production date (as of shift# 1 time)
      end;

      FConnection.Commit;
    except
      FConnection.RollBack;
      Inc(nFatalErrors);
      raise;
    end
  finally
    Screen.Cursor:= crDefault;
    Application.ProcessMessages;
    PopStatusBar;
  end;
end;


procedure TShop_SetUp.ResetWorkingDaysShifts( var AShopWeekCalendar: TShopCalendarWeek; AValue: Boolean );
var
  I: Integer;
begin
  for I:= 1 to 7 do with AShopWeekCalendar[ I ] do
  begin
    Mfg1:= AValue; {working Y/N}
    Mfg2:= AValue;
    Mfg3:= AValue;
    Mfg4:= AValue;
  end;
end;

procedure TShop_SetUp.AssignShopCalendarWeek( var AShopCalendarWeek: TShopCalendarWeek; ASource: string; ASource_ID: Real );
begin
  ResetWorkingDaysShifts( AShopCalendarWeek, FALSE );

  with TFDQuery.Create(self) do
  try
    Connection:= FConnection;
    SQL.Add(IQFormat( 'select working, shift, week_day from shop_calendar where source = ''%s'' and source_id = %f', [ ASource, ASource_ID ]));
    Open;
    while not Eof do
    begin
      if (FieldByName('week_day').asInteger >= 1) and (FieldByName('week_day').asInteger <= 7) then
         case FieldByName('shift').asInteger of
           1: AShopCalendarWeek[ FieldByName('week_day').asInteger ].Mfg1:= FieldByName('working').asString = 'Y';
           2: AShopCalendarWeek[ FieldByName('week_day').asInteger ].Mfg2:= FieldByName('working').asString = 'Y';
           3: AShopCalendarWeek[ FieldByName('week_day').asInteger ].Mfg3:= FieldByName('working').asString = 'Y';
           4: AShopCalendarWeek[ FieldByName('week_day').asInteger ].Mfg4:= FieldByName('working').asString = 'Y';
         end;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TShop_SetUp.CheckDay( ADay:TDateTime; sAsy_Mach:string; nDays_Week, AShifts:Integer; Work1, Work2, Work3, Work4: Boolean; AMfgCell_ID: Real );
{passed ADay represents production date starting with the time of shift# 1}
begin
  CheckCreateTimeOff( ADay,
                      nDays_Week,
                      AShifts,     // ParamTable.FieldByName('SHIFTS').asInteger,
                      Work1, Work2, Work3, Work4,
                      sAsy_Mach,
                      Duration1, Duration2, Duration3, Duration4,
                      AMfgCell_ID )
end;

procedure TShop_SetUp.Delete_Calendar( AMfgCell_ID: Real );
var
  q:TFDQuery;
  t:TFDTable;
begin
  try
    try
      PushStatusBar;
      Screen.Cursor:= crHourGlass;
      // Shop_SU_rscstr.cRsc0000024 = 'Mfg Cell: %s. Deleting Shop Calendar weekends/off shifts ...';
      // Shop_SU_rscstr.cRsc0000021 = 'N/A';
      StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000024,
        [ sIIf(FMfgCell = '', Shop_SU_rscstr.cRsc0000021, FMfgCell) ]); StatusBar1.Update;

      {we need to go center by center to prevent rollback segment overflow}
      q:= TFDQuery.Create(self);
      q.Connection:= FConnection;
      q.SQL.Add('delete from calendar');
      q.SQL.Add(' where work_cntr_id = :id' );
      q.SQL.Add('  and :Jan1 <= start_time and start_time < :NextJan1');
      // q.SQL.Add('  and day_off_type in (1,2,4)' );      // Shop Calendar - Holidays do not get removed when setting the default calendar - CRM#567086
      q.ParamByName('id').DataType:= ftBCD;
      q.ParamByName('jan1').DataType:= ftDateTime;
      q.ParamByName('nextJan1').DataType:= ftDateTime;

      t:= TFDTable.Create(self);
      t.Connection:= FConnection;
      t.TableName   := 'WORK_CENTER';
      if AMfgCell_ID > 0 then
         t.Filter:= IQFormat('mfgcell_id = %.0f and mfgcell_id <> NULL', [ AMfgCell_ID ])
      else
         t.Filter:= 'mfgcell_id = NULL';

      t.Filter:= t.Filter + ' and (shifts = 0 or shifts = NULL)';  // work centers with designated calendar will be processed separately

      t.Filtered:= TRUE;

      t.Open;  // work_center table
      with t do
        while not EOF do
          begin
            // Shop_SU_rscstr.cRsc0000025 =
            // 'Mfg Cell: %s. Deleting Shop Calendar weekends/off shifts for
            // center # %s ...';
            // Shop_SU_rscstr.cRsc0000021 = 'N/A';
            StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000025,
            [sIIf(FMfgCell = '', Shop_SU_rscstr.cRsc0000021, FMfgCell),
            FieldByName('EQNO').asString ]);
            StatusBar1.Update;

          Application.ProcessMessages;
          FConnection.StartTransaction;

          q.Close;
          q.ParamByName('ID').asFloat         := FieldByName('ID').asFloat;
          q.ParamByName('Jan1').asDateTime    := Jan1;
          q.ParamByName('NextJan1').asDateTime:= NextJan1;
          q.ExecSQL;

          FConnection.Commit;
          Next;
        end;
    except
      FConnection.RollBack;
      Inc(nFatalErrors);
      raise;
    end
  finally
    Screen.Cursor:= crDefault;
    Application.ProcessMessages;
    q.Free;
    t.Free;
    PopStatusBar;
  end;
end;

procedure TShop_SetUp.Append_Calendar( AMfgCell_ID: Real );
var
  i    : Integer;
  dDate: TDateTime;
  t    : TFDTable;
  AMfgcellFilter: string;
begin
  try
    try
      PushStatusBar;
      // Shop_SU_rscstr.cRsc0000026 =
      // 'Mfg Cell: %s. Updating Shop Calendar ...';
      // Shop_SU_rscstr.cRsc0000021 = 'N/A';
      StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000026,
      [ sIIf(FMfgCell = '', Shop_SU_rscstr.cRsc0000021, FMfgCell) ]);
      StatusBar1.Update;

      t:= TFDTable.Create(self);
      t.Connection:= FConnection;
      t.TableName   := 'WORK_CENTER';
      if AMfgCell_ID > 0 then
         t.Filter:= Format('mfgcell_id = %0.f and mfgcell_id <> NULL', [ AMfgCell_ID ])
      else
         t.Filter:= 'mfgcell_id = NULL';

      // work centers with designated calendar will be processed separately
      t.Filter:= t.Filter + ' and (shifts = 0 or shifts = NULL)';
      t.Filtered:= TRUE;

      if (AMfgCell_ID > 0) and (SelectValueFmtAsFloat('select iqcalendar.get_mfgcell_param_id( %0.f ) from dual', [ AMfgCell_ID ]) > 0) then
         AMfgcellFilter:= Format('and default_calendar.mfgcell_id = %0.f', [ AMfgCell_ID ])
      else
         AMfgcellFilter:= 'and default_calendar.mfgcell_id is NULL';

      t.Open;  // work_center table
      with t do
        while not EOF do
          begin
            // Shop_SU_rscstr.cRsc0000027 = 'Mfg Cell: %s. Updating Shop Calendar for center # %s ...';
            // Shop_SU_rscstr.cRsc0000021 = 'N/A';
            StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000027,
            [ sIIf(FMfgCell = '', Shop_SU_rscstr.cRsc0000021, FMfgCell), FieldByName('EQNO').asString ]);
          StatusBar1.Update;
          Application.ProcessMessages;

          ExecuteCommandFmt('begin                                                                      '+
                    '  for v in ( select start_time, end_time, day_off_type                     '+
                    '               from default_calendar                                       '+
                    '              where asy_mach = decode( Mfg.Like_Generic_ExA( mfg.lookup_mfgtype( ''%s'' )), 1, ''Y'', ''N'') '+
                    '                and to_date(''%s'', ''mm/dd/yy hh24:mi:ss'') <= start_time '+
                    '                and start_time < to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')  '+
                                     AMfgcellFilter +
                    '              order by start_time )                                        '+
                    '  loop                                                                     '+
                    '    shop.save_to_workcenter_calendar( %f,                                  '+   // v_work_cntr_id
                    '                                      v.start_time,                        '+   // v_start_time
                    '                                      v.end_time,                          '+   // v_end_time
                    '                                      v.day_off_type );                    '+   // v_day_off_type
                    '  end loop;                                                                '+
                    'end;                                                                       ',
                    [ FieldByName('mfg_type').asString,
                      FormatDateTime('mm/dd/yyyy hh:nn:ss', Jan1),
                      FormatDateTime('mm/dd/yyyy hh:nn:ss', NextJan1),
                      FieldByName('ID').asFloat ]);  // work_center_id

          Next;
        end;

    except
      Inc(nFatalErrors);
      raise;
    end
  finally
    // q.Close; q.Free;
    t.Free;
    PopStatusBar;
  end;
end;

procedure TShop_SetUp.btnHolidaysClick(Sender: TObject);
begin
  DoShopHoliday;  {Shop_Hol.pas}
end;

procedure TShop_SetUp.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );

  dbchkDefaultDisableRTServerShiftReport.Visible:= SR.Visible['dbchkDefaultDisableRTServerShiftReport']
                                                   and
                                                   SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apRT_Monitor ], NIL );
  dbchkMfgCellDisableRTServerShiftReport.Visible:= SR.Visible['dbchkMfgCellDisableRTServerShiftReport']
                                                   and
                                                   SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apRT_Monitor ], NIL );

  dbchkDisableRTServerShiftReportEPlant.Visible:= SR.Visible['dbchkDisableRTServerShiftReportEPlant']
                                                   and
                                                   SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apRT_Monitor ], NIL );
end;

procedure TShop_SetUp.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TShop_SetUp.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TShop_SetUp.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute
end;

procedure TShop_SetUp.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute
end;

procedure TShop_SetUp.ScheduledHolidays1Click(Sender: TObject);
begin
  DoShopSchedHolidays; {ShopSchd}
end;

procedure TShop_SetUp.STDLabourCapacity1Click(Sender: TObject);
begin
  DoSetStdLaborHrs; {StdLabor.pas}
end;

procedure TShop_SetUp.TblParamsCalcFields(DataSet: TDataSet);
begin
  if StartDBEdit[ 1 ].Text > '' then
  begin
    SetDurations;
    DataSet.FieldByName('Duration1').asFloat:= Duration1;
    DataSet.FieldByName('Duration2').asFloat:= Duration2;
    DataSet.FieldByName('Duration3').asFloat:= Duration3;
    DataSet.FieldByName('Duration4').asFloat:= Duration4;
  end;
end;

procedure TShop_SetUp.TblParamsNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID').asFloat:= 0;
    FieldByName('HRS_DAY').asFloat      := 24;
    FieldByName('SHIFT_START1').asString:= '00:00:00';
    FieldByName('SHIFT_START2').asString:= '00:00:00';
    FieldByName('SHIFT_START3').asString:= '00:00:00';
    FieldByName('SHIFT_START4').asString:= '00:00:00';
    FieldByName('MFG_DAYS_WEEK').asFloat:= 5;
  end;
end;

procedure TShop_SetUp.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch5{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TShop_SetUp.TblParamsBeforePost(DataSet: TDataSet);
begin
  ValidateAllFields;
  ParamsShiftModified  := FALSE;
  ParamsDaysModifiedMfg:= FALSE;
  ParamsDaysModifiedAsy:= FALSE;

  if DataSet.State = dsEdit then
  begin
    ParamsShiftModified  := DataSet.FieldByName('shifts').asFloat <> SelectValueAsFloat('select shifts from params');
    ParamsDaysModifiedMfg:= DataSet.FieldByName('mfg_days_week').asFloat <> SelectValueAsFloat('select mfg_days_week from params');
    ParamsDaysModifiedAsy:= DataSet.FieldByName('assy_days_week').asFloat <> SelectValueAsFloat('select assy_days_week from params');
  end;
end;

procedure TShop_SetUp.TblMfgCell_ParamBeforePost(DataSet: TDataSet);
begin
  if (QryMfgCell.Eof and QryMfgCell.Bof) then
    // Shop_SU_rscstr.cRsc0000028 =
    // 'No Manufacturing Cells were found.  Cannot attach schedule.';
    raise Exception.Create(Shop_SU_rscstr.cRsc0000028);

  IQAssignIDBeforePost( DataSet );
  ValidateAllFields;
  FMfgCell_ID:= DataSet.FieldByName('ID').asFloat;

  MfgCellParamsShiftDaysModified:= FALSE;
  if (FMfgCell_ID > 0) then // and (DataSet.State = dsEdit) then
  begin
    MfgCellParamsShiftDaysModified:= (DataSet.FieldByName('SHIFTS').asFloat <> SelectValueByID('shifts', 'mfgcell_param', FMfgCell_ID ))
                                     or
                                     (DataSet.FieldByName('MFG_DAYS_WEEK').asFloat <> SelectValueByID('mfg_days_week', 'mfgcell_param', FMfgCell_ID ));
  end;
end;

procedure TShop_SetUp.TblMfgCell_ParamEPlantAfterPost(DataSet: TDataSet);
begin
  MfgCellParamsModified:= TRUE;
  {Assign MfgCell_Param ID to MfgCell}
  with QryOrigin do
  begin
    Edit;
    if FMfgCell_Param_ID > 0 then
       QryOriginMFGCELL_PARAM_ID.asFloat:= FMfgCell_Param_ID
    else
       QryOriginMFGCELL_PARAM_ID.Clear;
    Post;

    if MfgCellParamsShiftDaysModified then
       TFrmShopCalendar.DoAssignDefaultShiftSilent( self,                   {shop_cal.pas}
                                                    Shop_Shr.MFGCELL_PARAM, {source = MFGCELL_PARAM}
                                                    FMfgCell_Param_ID );    {source_id}
  end;
end;

procedure TShop_SetUp.TblMfgCell_ParamEPlantBeforeDelete(DataSet: TDataSet);
begin
  // Shop_SU_rscstr.cRsc0000029 =
  // 'Are you sure you want to revert to the default schedule?';
  if not IQConfirmYN(Shop_SU_rscstr.cRsc0000029) then
     ABORT;
  FMfgCell_Param_ID:= 0;
  MfgCellParamsShiftDaysModified:= FALSE;
  ExecuteCommandFmt('update eplant set mfgcell_param_id = NULL where mfgcell_param_id = %f', [ QryOriginMFGCELL_PARAM_ID.asFloat ]);
end;

procedure TShop_SetUp.TblMfgCell_ParamEPlantBeforePost(DataSet: TDataSet);
begin
  if (QryOrigin.Eof and QryOrigin.Bof) or (QryOriginID.asFloat = 0) then
     raise Exception.Create('No EPlants found - unable to attach schedule');

  IQAssignIDBeforePost( DataSet );
  ValidateAllFields;
  FMfgCell_Param_ID:= DataSet.FieldByName('ID').asFloat;

  MfgCellParamsShiftDaysModified:= FALSE;
  if (FMfgCell_Param_ID > 0) then //
  begin
    MfgCellParamsShiftDaysModified:= (DataSet.FieldByName('SHIFTS').asFloat <> SelectValueByID('shifts', 'mfgcell_param', FMfgCell_Param_ID ))
                                     or
                                     (DataSet.FieldByName('MFG_DAYS_WEEK').asFloat <> SelectValueByID('mfg_days_week', 'mfgcell_param', FMfgCell_Param_ID ));
  end;
end;

procedure TShop_SetUp.TblMfgCell_ParamAfterPost(DataSet: TDataSet);
begin
  MfgCellParamsModified:= TRUE;
  {Assign MfgCell_Param ID to MfgCell}
  with QryMfgCell do
  begin
    Edit;
    if FMfgCell_ID > 0 then
       QryMfgCellMFGCELL_PARAM_ID.asFloat:= FMfgCell_ID
    else
       QryMfgCellMFGCELL_PARAM_ID.Clear;
    Post;

    if MfgCellParamsShiftDaysModified then
       TFrmShopCalendar.DoAssignDefaultShiftSilent( self,                   {shop_cal.pas}
                                                    Shop_Shr.MFGCELL_PARAM, { source = MFGCELL_PARAM}
                                                    FMfgCell_ID );          {source_id}
  end;
end;

procedure TShop_SetUp.TblMfgCell_ParamBeforeDelete(DataSet: TDataSet);
begin
  // Shop_SU_rscstr.cRsc0000029 =
  // 'Are you sure you want to revert to the default schedule?';
  if not IQConfirmYN(Shop_SU_rscstr.cRsc0000029) then
     ABORT;
  FMfgCell_ID:= 0;
  MfgCellParamsShiftDaysModified:= FALSE;
  ExecuteCommandFmt('update mfgcell set mfgcell_param_id = NULL where mfgcell_param_id = %f', [ QryMfgCellMFGCELL_PARAM_ID.asFloat ]);
end;

procedure TShop_SetUp.sbtnCopyFromDefaultClick(Sender: TObject);
var
  A: Variant;
  AMfgcell_Param_ID: Real;

  // ---------------------------------------------------------------------------
  procedure _assign_params_from_default;
  begin
     A:= SelectValueArray('select shifts, shift_start1, shift_start2, shift_start3, shift_start4, '+
                     '       mfg_days_week, mfg_shift1, mfg_shift2, mfg_shift3, mfg_shift4,  '+
                     '       hrs_day, rtserver_disable_shift_report                          '+
                     '  from params');
  end;


  // ---------------------------------------------------------------------------
  function _assign_params_from_eplant( AEPlant_ID: Real ): Boolean;
  var
    AMfgcell_Param_ID: Real;
  begin
    AMfgcell_Param_ID:= SelectValueByID('mfgcell_param_id', 'eplant', AEPlant_ID);
    if AMfgcell_Param_ID = 0 then
       EXIT (False);

    A:= SelectValueArrayFmt('select shifts, shift_start1, shift_start2, shift_start3, shift_start4, '+
                       '       mfg_days_week, mfg_shift1, mfg_shift2, mfg_shift3, mfg_shift4,  '+
                       '       hrs_day, rtserver_disable_shift_report                          '+
                       '  from mfgcell_param where id = %f',
                       [ AMfgcell_Param_ID ]);
    Result:= VarArrayDimCount( A ) > 0;
  end;


// -----------------------------------------------------------------------------
begin
  // Shop_SU_rscstr.cRsc0000030 =
  // 'Are you sure you want to copy from the default schedule?';
  if not IQConfirmYN(Shop_SU_rscstr.cRsc0000030) then
     EXIT;

  if ParamTable = TblMfgCell_ParamEPlant then
     _assign_params_from_default

  else if ParamTable = TblMfgCell_Param then
     begin
       if not _assign_params_from_eplant( QryMfgCell.FieldByName('eplant_id').asFloat ) then
          _assign_params_from_default
     end;

  with ParamTable do
  begin
    Edit;
    FieldByName('SHIFTS').asFloat       := A[ 0 ];  // TblParamsSHIFTS.asFloat;
    FieldByName('SHIFT_START1').asString:= A[ 1 ];  // TblParamsSHIFT_START1.asString;
    FieldByName('SHIFT_START2').asString:= A[ 2 ];  // TblParamsSHIFT_START2.asString;
    FieldByName('SHIFT_START3').asString:= A[ 3 ];  // TblParamsSHIFT_START3.asString;
    FieldByName('SHIFT_START4').asString:= A[ 4 ];  // TblParamsSHIFT_START4.asString;
    FieldByName('MFG_DAYS_WEEK').asFloat:= A[ 5 ];  // TblParamsMFG_DAYS_WEEK.asFloat;
    FieldByName('MFG_SHIFT1').asString  := A[ 6 ];  // TblParamsMFG_SHIFT1.asString;
    FieldByName('MFG_SHIFT2').asString  := A[ 7 ];  // TblParamsMFG_SHIFT2.asString;
    FieldByName('MFG_SHIFT3').asString  := A[ 8 ];  // TblParamsMFG_SHIFT3.asString;
    FieldByName('MFG_SHIFT4').asString  := A[ 9 ];  // TblParamsMFG_SHIFT4.asString;
    FieldByName('HRS_DAY').asFloat      := A[ 10];  // TblParamsHRS_DAY.asFloat;
    FieldByName('RTSERVER_DISABLE_SHIFT_REPORT').asString:= A[ 11 ];  // TblParamsRTSERVER_DISABLE_SHIFT_REPORT.asString;
    Post;
  end;

  DeleteShopCalendar( Shop_Shr.MFGCELL_PARAM { source = MFGCELL_PARAM}, ParamTable.FieldByName('ID').asFloat {source_id} );

  ExecuteCommandFmt('insert into shop_calendar                            '+
            '      (source, source_id, week_day, shift, working ) '+
            'select ''%s'',                                       '+
            '       %f,                                           '+
            '       week_day,                                     '+
            '       shift,                                        '+
            '       working                                       '+
            '  from shop_calendar                                 '+
            ' where source = ''%s''                               '+
            '   and source_id = 1                                 ',
            [ Shop_Shr.MFGCELL_PARAM,               {source = MFGCELL_PARAM}
              ParamTable.FieldByName('ID').asFloat, {source_id}
              Shop_Shr.PARAMS                       {source = PARAMS }]);
end;

procedure TShop_SetUp.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext )
end;

procedure TShop_SetUp.PageControl1Change(Sender: TObject);
begin
  ParamTable.Refresh;
end;

procedure TShop_SetUp.sbtnMfgDefaultShopCalendarClick(Sender: TObject);
begin
  TblParams.CheckBrowseMode;
  TFrmShopCalendar.DoShowModal( self,
                                Shop_Shr.PARAMS {source = 'PARAMS'},
                                1 {source_id - virtual id for params for mfg} );
  ParamsModified:= TRUE;
end;

procedure TShop_SetUp.sbtnPkCenterClick(Sender: TObject);
begin
  with PkWorkCenter do
    if Execute then
       wwQryWorkCenter.Locate('ID', GetValue('ID'), [])
end;

procedure TShop_SetUp.sbtnWorkCenterShopCalendarClick(Sender: TObject);
begin
  wwQryWorkCenter.CheckBrowseMode;
  if wwQryWorkCenter.FieldByName('SHIFTS').asFloat = 0 then
     EXIT;

  TFrmShopCalendar.DoShowModal( self,
                                Shop_Shr.WORK_CENTER { source = MFGCELL_PARAM},
                                wwQryWorkCenterID.asFloat {source_id} );
  ParamsModified:= TRUE;
end;

procedure TShop_SetUp.sbtnGenDefaultShopCalendarClick(Sender: TObject);
begin
  TblParams.CheckBrowseMode;
  TFrmShopCalendar.DoShowModal( self,
                                Shop_Shr.PARAMS {source = 'PARAMS'},
                                2 {source_id - virtual id for params for generic} );
  ParamsModified:= TRUE;
end;

procedure TShop_SetUp.sbtnMfgCellShopCalendarClick(Sender: TObject);
begin
  TblMfgCell_Param.CheckBrowseMode;
  TFrmShopCalendar.DoShowModal( self,
                                Shop_Shr.MFGCELL_PARAM { source = MFGCELL_PARAM},
                                TblMfgCell_ParamID.asFloat {source_id} );
  ParamsModified:= TRUE;
end;


procedure TShop_SetUp.sbtnCopyToWorkcenterFromDefaultClick(Sender: TObject);
var
  AMfgCell_Param_ID: Real;
  ADefaultCargo: TCalendarCargo;
  ASource: string;
  ASource_ID: Real;
begin
  // Shop_SU_rscstr.cRsc0000030 =
  // 'Are you sure you want to copy from the default schedule?';
  if not IQConfirmYN(Shop_SU_rscstr.cRsc0000030) then
     EXIT;

  if WorkCenterHasMfgcellSpecificCalendar( wwQryWorkCenterID.asFloat, AMfgCell_Param_ID ) then
     begin
       AssignCalendarParams( Shop_Shr.MFGCELL_PARAM, AMfgCell_Param_ID, ADefaultCargo );
       ASource   := Shop_Shr.MFGCELL_PARAM;
       ASource_ID:= AMfgCell_Param_ID;
     end
  else
     begin
       AssignCalendarParams( Shop_Shr.PARAMS, 0, ADefaultCargo );
       ASource   := Shop_Shr.PARAMS;
       ASource_ID:= 2;
     end;

  with wwQryWorkCenter do
  begin
    Edit;

    FieldByName('SHIFTS').asFloat       := ADefaultCargo.Shifts;
    FieldByName('MFG_DAYS_WEEK').asFloat:= ADefaultCargo.Mfg_Days_Week;
    FieldByName('HRS_DAY').asFloat      := ADefaultCargo.Hrs_Day;

    // this will prevent redoing the shop_calendar  in the after post because field values have changed
    WorkCenterShifts     := FieldByName('SHIFTS').asFloat;
    WorkCenterHrsDay     := FieldByName('MFG_DAYS_WEEK').asFloat;
    WorkCenterMfgDaysWeek:= FieldByName('HRS_DAY').asFloat;

    Post;
  end;

  DeleteShopCalendar( Shop_Shr.WORK_CENTER, wwQryWorkCenterID.asFloat {source_id} );

  ExecuteCommandFmt('insert into shop_calendar                            '+
            '      (source, source_id, week_day, shift, working ) '+
            'select ''%s'',                                       '+
            '       %f,                                           '+
            '       week_day,                                     '+
            '       shift,                                        '+
            '       working                                       '+
            '  from shop_calendar                                 '+
            ' where source = ''%s''                               '+
            '   and nvl(source_id,0) = %f                         ',
            [ Shop_Shr.WORK_CENTER,     {source = WORK_CENTER}
              wwQryWorkCenterID.asFloat,{source_id}
              ASource,                  {cloned source}
              ASource_ID ]);            {cloned source id}
end;

procedure TShop_SetUp.wwDBGridOriginDBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
   if (Column.Field = QryOriginSOURCE) and (CompareText(QryOriginORIGIN.asString, 'EPlant') = 0) and (QryOriginMFGCELL_PARAM_ID.asFloat > 0) then
  begin
//     if Highlight then
//        begin
//          ABrush.Color:= clBlack;
//          AFont.Color := clYellow;
//        end
//     else
//        begin
          Attribs.Color:= clWindow;
          Attribs.font.Color := clRed;
//        end;
  end;
end;

procedure TShop_SetUp.wwGridWorkCenterDBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (wwQryWorkCenter.FieldByName('SHIFTS').asFloat > 0)
     or
     (wwQryWorkCenter.FieldByName('MFG_DAYS_WEEK').asFloat > 0)
     or
     (wwQryWorkCenter.FieldByName('HRS_DAY').asFloat > 0 ) then
   begin
//     if Highlight then
//        begin
//          ABrush.Color:= clBlack;
//          AFont.Color := clYellow;
//        end
//     else
//        begin
          Attribs.Color:= clWindow;
          Attribs.Font.Color := clRed;
//        end;
   end

 else if wwQryWorkCenterMFGCELL_PARAM_ID.asFloat > 0 then
   begin
//     if Highlight then
//        IQMS.Common.Screen.AssignColorToFontBrush( AFont, ABrush, clAqua, clBlack )
//     else
        IQMS.Common.Screen.AssignColorToFontBrush( Attribs.font, Attribs, clBlue, clWindow )
   end;
end;

procedure TShop_SetUp.wwQryWorkCenterBeforeEdit(DataSet: TDataSet);
begin
  WorkCenterShifts     := wwQryWorkCenter.FieldByName('SHIFTS').asFloat;
  WorkCenterHrsDay     := wwQryWorkCenter.FieldByName('MFG_DAYS_WEEK').asFloat;
  WorkCenterMfgDaysWeek:= wwQryWorkCenter.FieldByName('HRS_DAY').asFloat;
end;


procedure TShop_SetUp.wwQryWorkCenterBeforePost(DataSet: TDataSet);
var
  AMfgCell_Param_ID: Real;
  ACargo: TCalendarCargo;
begin
  // validate shifts and hrs_day do not exceed the params or mfgcel_param settings
  if (wwQryWorkCenter.FieldByName('SHIFTS').asFloat > 0) and
    (wwQryWorkCenter.FieldByName('HRS_DAY').asFloat > 0) then
  begin
    if WorkCenterHasMfgcellSpecificCalendar( wwQryWorkCenterID.asFloat, AMfgCell_Param_ID ) then
       AssignCalendarParams( Shop_Shr.MFGCELL_PARAM, AMfgCell_Param_ID, ACargo )
    else
       AssignCalendarParams( Shop_Shr.PARAMS, 0, ACargo );

    // Shop_SU_rscstr.cRsc0000031 =
    // 'The number of shifts must not exceed %d.  Operation aborted.';
    IQAssert( ACargo.Shifts >= wwQryWorkCenter.FieldByName('SHIFTS').asFloat,
      Format(Shop_SU_rscstr.cRsc0000031,
      [ ACargo.Shifts ]));
    // Shop_SU_rscstr.cRsc0000032 =
    // 'Hours/Day must not exceed %.0f.  Operation aborted.';
    IQAssert( ACargo.Hrs_Day >= wwQryWorkCenter.FieldByName('HRS_DAY').asFloat,
      Format(Shop_SU_rscstr.cRsc0000032,
      [ ACargo.Hrs_Day ]));
  end;
end;


procedure TShop_SetUp.wwQryWorkCenterBeforeRefresh(DataSet: TDataSet);
begin
  IQCheckRefresh( navWorkCenter, nbrefresh );
end;

procedure TShop_SetUp.ApplyUpdates(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable( DataSet );

  if wwQryWorkCenter.FieldByName('SHIFTS').asFloat = 0 then
     // clear shop_calendar
     DeleteShopCalendar( Shop_Shr.WORK_CENTER{source}, wwQryWorkCenterID.asFloat {source_id})

  else if not ((WorkCenterShifts  = wwQryWorkCenter.FieldByName('SHIFTS').asFloat)
                and
                (WorkCenterHrsDay = wwQryWorkCenter.FieldByName('MFG_DAYS_WEEK').asFloat)
                and
                (WorkCenterMfgDaysWeek = wwQryWorkCenter.FieldByName('HRS_DAY').asFloat)) then
     // repopulate_calendar
     TFrmShopCalendar.DoAssignDefaultShiftSilent( self,                        {shop_cal.pas}
                                                  Shop_Shr.WORK_CENTER,        {source = WORK_CENTER}
                                                  wwQryWorkCenterID.asFloat ); {source_id}

  ParamsModified:= TRUE;
end;

procedure TShop_SetUp.DeleteShopCalendar( ASource: string; ASource_ID: Real );
begin
  ExecuteCommandFmt('delete from shop_calendar where source = ''%s'' and source_id = %f',
            [ ASource,
              ASource_ID ]);
end;

procedure TShop_SetUp.AssignCalendarParams( ASource: string; ASource_ID: Real; var ACargo: TCalendarCargo);
var
  A: Variant;
  AMfgCell_Param_ID: Real;
  ADefaultCargo: TCalendarCargo;
begin
  if ASource = Shop_Shr.PARAMS then
     begin
       A:= SelectValueArray('select shifts, hrs_day, mfg_days_week, shift_start1, shift_start2, shift_start3, shift_start4 from params');
       if VarArrayDimCount( A ) = 0 then ABORT;
       ACargo.Shifts       := A[ 0 ];
       ACargo.Hrs_Day      := A[ 1 ];
       ACargo.Mfg_Days_Week:= A[ 2 ];
       ACargo.Shift_Start1 := A[ 3 ];
       ACargo.Shift_Start2 := A[ 4 ];
       ACargo.Shift_Start3 := A[ 5 ];
       ACargo.Shift_Start4 := A[ 6 ];
     end

  else if ASource = Shop_Shr.MFGCELL_PARAM then
     begin
       A:= SelectValueArrayFmt('select shifts, hrs_day, mfg_days_week, shift_start1, shift_start2, shift_start3, shift_start4 from mfgcell_param where id = %f', [ ASource_ID ]);
       if VarArrayDimCount( A ) = 0 then ABORT;
       ACargo.Shifts       := A[ 0 ];
       ACargo.Hrs_Day      := A[ 1 ];
       ACargo.Mfg_Days_Week:= A[ 2 ];
       ACargo.Shift_Start1 := A[ 3 ];
       ACargo.Shift_Start2 := A[ 4 ];
       ACargo.Shift_Start3 := A[ 5 ];
       ACargo.Shift_Start4 := A[ 6 ];
     end

  else if ASource = Shop_Shr.WORK_CENTER then
     begin
       // get the default first
       if WorkCenterHasMfgcellSpecificCalendar( ASource_ID, AMfgCell_Param_ID ) then
          AssignCalendarParams( Shop_Shr.MFGCELL_PARAM, AMfgCell_Param_ID, ADefaultCargo )
       else
          AssignCalendarParams( Shop_Shr.PARAMS, 0, ADefaultCargo );

       // assign to ACargo
       ACargo.Shifts       := ADefaultCargo.Shifts;
       ACargo.Hrs_Day      := ADefaultCargo.Hrs_Day;
       ACargo.Mfg_Days_Week:= ADefaultCargo.Mfg_Days_Week;
       ACargo.Shift_Start1 := ADefaultCargo.Shift_Start1;
       ACargo.Shift_Start2 := ADefaultCargo.Shift_Start2;
       ACargo.Shift_Start3 := ADefaultCargo.Shift_Start3;
       ACargo.Shift_Start4 := ADefaultCargo.Shift_Start4;

       // if we have specific setup take having the least hrs_day and shifts (we do not allow exceeding default hrs_day & # shifts)
       A:= SelectValueArrayFmt('select shifts, hrs_day, mfg_days_week from work_center where id = %f', [ ASource_ID ]);
       if (VarArrayDimCount( A ) > 0) and (A[ 0 ] > 0) and (A[ 1 ] > 0) and (A[ 2 ] > 2) then
       begin
         ACargo.Shifts       := iMin( A[ 0 ], ADefaultCargo.Shifts  );
         ACargo.Hrs_Day      := fMin( A[ 1 ], ADefaultCargo.Hrs_Day );
         ACargo.Mfg_Days_Week:= A[ 2 ];
       end
     end;
end;


function TShop_SetUp.WorkCenterHasMfgcellSpecificCalendar( AWork_Center_ID: Real; var AMfgCell_Param_ID: Real ): Boolean;
begin
  AMfgCell_Param_ID:= SelectValueFmtAsFloat('select iqcalendar.get_mfgcell_param_id( w.mfgcell_id ) from work_center w where w.id = %f',
                                [ AWork_Center_ID ]);
  Result:= AMfgCell_Param_ID > 0;
end;

procedure TShop_SetUp.SetCalendarByWorkCenter( AWork_Center_ID: Real );
var
   ACargo       : TCalendarCargo;
   ADuration1   : Real;
   ADuration2   : Real;
   ADuration3   : Real;
   ADuration4   : Real;
   ACalendarWeek: TShopCalendarWeek; {Shop_Shr.pas array [1..7] of TShopCalendarDay}
   AJan1        : TDateTime;         // This Year 1st shift date&time
   ANextJan1    : TDateTime;         // Next Year 1st shift date&time
   ADay         : TDateTime;

   procedure _Delete_Calendar;
   begin
     ExecuteCommandFmt('delete from calendar                                              '+
               '  where work_cntr_id = %f                                         '+
               '    and to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') <= start_time  '+
               '    and start_time < to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'')   ',
               [ AWork_Center_ID,
                 FormatDateTime('mm/dd/yyyy hh:nn:ss', AJan1),
                 FormatDateTime('mm/dd/yyyy hh:nn:ss', ANextJan1)]);
   end;

begin
  try
    AssignCalendarParams( Shop_Shr.WORK_CENTER, AWork_Center_ID,  ACargo );
    GetJan1_Work_Center( AWork_Center_ID,  AJan1, ANextJan1 );

    _Delete_Calendar;

    IQSetDurationsEx( ADuration1, ADuration2, ADuration3, ADuration4,       {Shop_Shr.pas}
                      ACargo.Shifts,
                      ACargo.Shift_Start1,
                      ACargo.Shift_Start2,
                      ACargo.Shift_Start3,
                      ACargo.Shift_Start4,
                      ACargo.Hrs_Day );

    AssignShopCalendarWeek( ACalendarWeek, Shop_Shr.WORK_CENTER, AWork_Center_ID );


    ADay:= AJan1;
    while ADay < ANextJan1 do
    begin
      // Shop_SU_rscstr.cRsc0000033 =
      // 'Creating default weekends/off shifts for work center %s, %s...';
      StatusBar1.Panels[0].text:= Format(Shop_SU_rscstr.cRsc0000033,
        [ SelectValueByID('eqno', 'work_center', AWork_Center_ID ), DateToStr( ADay )]);
      Application.ProcessMessages;

      Shop_Shr.CheckCreateTimeOff( ADay,
                                   ACargo.Mfg_Days_Week,
                                   ACargo.Shifts,
                                   ACalendarWeek[ DayOfWeek( ADay ) ].Mfg1,
                                   ACalendarWeek[ DayOfWeek( ADay ) ].Mfg2,
                                   ACalendarWeek[ DayOfWeek( ADay ) ].Mfg3,
                                   ACalendarWeek[ DayOfWeek( ADay ) ].Mfg4,
                                   FloatToStr( AWork_Center_ID ),
                                   ADuration1, ADuration2, ADuration3, ADuration4,
                                   0 {mfgcell_id - not used });

      ADay:= ADay + 1;  // next production date as of 1st shift time
    end;

    ParamsModified:= TRUE;
  except on E:Exception do
    begin
      Application.ShowException( E );
      Inc( nFatalErrors );
    end;
  end;
end;

procedure TShop_SetUp.GetJan1_Work_Center( AWork_Center_ID: Real; var AJan1, ANextJan1: TDateTime );
var
  AMfgCell_Param_ID: Real;
  ADefaultCargo: TCalendarCargo;
begin
  if WorkCenterHasMfgcellSpecificCalendar( AWork_Center_ID, AMfgCell_Param_ID ) then
     AssignCalendarParams( Shop_Shr.MFGCELL_PARAM, AMfgCell_Param_ID, ADefaultCargo )
  else
     AssignCalendarParams( Shop_Shr.PARAMS, 0, ADefaultCargo );

  AJan1    := IQStrToDateTime( IQFormat('01/01/%d %s', [ nYear,   ADefaultCargo.Shift_Start1 ]));
  ANextJan1:= IQStrToDateTime( IQFormat('01/01/%d %s', [ nYear+1, ADefaultCargo.Shift_Start1 ]));
end;

procedure TShop_SetUp.PopupMenu2Popup(Sender: TObject);
begin
  wwQryWorkCenter.CheckBrowseMode;
  SetCalendarforSelectedWorkCenter1.Enabled:= wwQryWorkCenter.FieldByName('SHIFTS').asFloat > 0;
end;

procedure TShop_SetUp.SetCalendarforSelectedWorkCenter1Click(Sender: TObject);
begin
  // Shop_SU_rscstr.cRsc0000034 = 'Update Selected Work Center Calendar';
  if not AskYearToSetup( nYear, Shop_SU_rscstr.cRsc0000034) then  {Shop_Dlg.pas}
     EXIT;
  try
    SetCalendarByWorkCenter( wwQryWorkCenterID.asFloat );
  finally
    StatusBar1.Panels[0].text:= '';
  end;
  // Shop_SU_rscstr.cRsc0000035 =
  // 'Finished updating selected work center calendar.';
  IQInformation(Shop_SU_rscstr.cRsc0000035);
end;


procedure TShop_SetUp.SrcOriginDataChange(Sender: TObject; Field: TField);
begin
  if not (Assigned(QryOrigin) and (QryOrigin.State = dsBrowse)) then
     EXIT;

  if QryOriginORIGIN.asString = 'System' then
     pgctrlDefaultSettings.ActivePageIndex:= 0
  else
     pgctrlDefaultSettings.ActivePageIndex:= 1;

  dbeShiftsDefaultChange( nil );
end;

procedure TShop_SetUp.SpeedButton2Click(Sender: TObject);
begin
  TblMfgCell_ParamEplant.CheckBrowseMode;
  TFrmShopCalendar.DoShowModal( self,
                                Shop_Shr.MFGCELL_PARAM { source = MFGCELL_PARAM},
                                TblMfgCell_ParamEPlantID.asFloat {source_id} );
  ParamsModified:= TRUE;
end;

procedure TShop_SetUp.dbeShiftsEPlantChange(Sender: TObject);
var
  nShifts:Integer;
begin
  nShifts:= StrToIntDef( ShiftsDBEdit.Text, 1 );

  EnableDBControls( nShifts );         { en-dis-able a few Vcl.Buttons }

  ResetUnusedStartTimes( nShifts );
end;


procedure TShop_SetUp.dbgridMfgCellDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
    with Sender as TUniDBGrid do
    if DataSource.DataSet.FieldByName('mfgcell_param_id').asFloat > 0 then
       begin
//         if not (gdSelected in State) then
//            IQMS.Common.Screen.AssignColorToFontBrush( Canvas.Font, Canvas.Brush, clRed, clWindow )
//         else
            IQMS.Common.Screen.AssignColorToFontBrush( Attribs.Font, Attribs, clYellow, clBlack );
       end
    else if QryMfgCellEPlant_Mfgcell_Param_ID.asFloat > 0 then
       begin
//         if not (gdSelected in State) then
//            IQMS.Common.Screen.AssignColorToFontBrush( Canvas.Font, Canvas.Brush, clBlue, clWindow )
//         else
            IQMS.Common.Screen.AssignColorToFontBrush( Attribs.Font, Attribs, clAqua, clBlack )
       end;

//  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State );
end;

function TShop_SetUp.GetMfgCell_Param_ID( AMfgCell_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select iqcalendar.get_mfgcell_param_id(%f) from dual', [ AMfgCell_ID ]);
end;


procedure TShop_SetUp.SetDurationsEx( AMfgCell_ID: Real );
var
  AMfgCell_Param_ID: Real;
  ACargo           : TCalendarCargo;
begin
  AMfgCell_Param_ID:= GetMfgCell_Param_ID( AMfgCell_ID );

  if (AMfgCell_ID = 0) or (AMfgCell_Param_ID = 0) then
     AssignCalendarParams( Shop_Shr.PARAMS, 0, ACargo )
  else
     AssignCalendarParams( Shop_Shr.MFGCELL_PARAM, AMfgCell_Param_ID, ACargo );

  IQSetDurationsEx( Duration1, Duration2, Duration3, Duration4,       {Shop_Shr.pas}
                    ACargo.Shifts,
                    ACargo.Shift_Start1,
                    ACargo.Shift_Start2,
                    ACargo.Shift_Start3,
                    ACargo.Shift_Start4,
                    ACargo.Hrs_Day );
end;


procedure TShop_SetUp.PrepareParametersEx( var AShifts, nMFG_Days_Week, nASSY_Days_Week: Integer; var AAsy_Mach: string; AMfgCell_ID: Real );
var
  AMfgcell_Param_ID: Real;

  procedure _assign_system_default( AAsyMach: string );
  var
    A: Variant;
  begin
    A:= SelectValueArray('select shifts, mfg_days_week, assy_days_week from params');
    if AAsyMach = 'B' {both} then
       begin
         AShifts        := A[ 0 ];        {# of shifts          }
         nMFG_Days_Week := A[ 1 ];        {mfg days working days}
         nASSY_Days_Week:= A[ 2 ];        {gen working days     }
         AssignShopCalendarWeek( FMfgCalendarWeek, Shop_Shr.PARAMS, 1 );
         AssignShopCalendarWeek( FGenCalendarWeek, Shop_Shr.PARAMS, 2 );
       end
    else if AAsyMach = 'N' then
       begin
         AShifts        := A[ 0 ];
         nMFG_Days_Week := A[ 1 ];
         AssignShopCalendarWeek( FMfgCalendarWeek, Shop_Shr.PARAMS, 1 );
       end
    else if AAsyMach = 'Y' then
       begin
         AShifts        := A[ 0 ];
         nMFG_Days_Week := A[ 2 ];
         AssignShopCalendarWeek( FMfgCalendarWeek, Shop_Shr.PARAMS, 2 );
       end;
  end;

  procedure _assign_from_mfgcell_param( AMfgcell_Param_ID: Real );
  var
    A: Variant;
  begin
    A:= SelectValueArrayFmt('select shifts, mfg_days_week from mfgcell_param where id = %f', [ AMfgcell_Param_ID ]);
    IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to locate mfgcel_param_id = %f', [ AMfgcell_Param_ID ]));

    AShifts        := A[ 0 ];
    nMFG_Days_Week := A[ 1 ];
    AssignShopCalendarWeek( FMfgCalendarWeek, Shop_Shr.MFGCELL_PARAM, AMfgcell_Param_ID );
  end;

begin
   AAsy_Mach:= MFG_CNTR;

   if AMfgCell_ID = 0 then
     _assign_system_default( 'B' {both asy and mfg})

   else
     begin
       AMfgcell_Param_ID:= GetMfgCell_Param_ID( AMfgCell_ID );
       AAsy_Mach:= SelectValueFmtAsString('select decode( Mfg.Like_Generic_ExA( mfg.lookup_mfgtype( mfgtype )), 1, ''Y'', ''N'' ) from mfgcell where id = %f', [ AMfgCell_ID ]);

       if AMfgcell_Param_ID > 0 then
          _assign_from_mfgcell_param( AMfgcell_Param_ID )
       else
          _assign_system_default( AAsy_Mach );
     end;
end;


end.



