unit Sched_mn;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  SchdHidn,
  Data.DB,
  Vcl.Buttons,
  Schd_DM,
  RTTypes,
  IQMS.WebVcl.AppDef,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  //WEB_CONVERT IQMS.Common.UserMessages,
  IQMS.WebVcl.DropDownButton,
  Mask,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.Common.Locks,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniDBNavigator,
  uniMainMenu, uniMenuButton;

procedure DoIQSchedule( ACntr_Sched_ID: Real = 0 );
procedure DoIQScheduleEx( ACargo: TJumpToSchedCargo );

{Regular SchedWindow}
procedure DoIQSchedWindow( AWorkOrder_ID: Real ); overload;
procedure DoIQSchedWindow( AWorkOrderList: TStringList ); overload;

{Jobshop SchedWindow}
procedure DoIQSchedWindowJobShop( AWorkOrder_ID: Real ); overload;
procedure DoIQSchedWindowJobShop( AWorkOrderList: TStringList ); overload;

procedure DoIQJumpToIQSchedule( ACntr_Sched_ID: Real );
procedure DoIQJumpToIQScheduleByWorkorder( AWorkorder_ID: Real );

{ASSY1}
procedure DoIQJumpToIQScheduleBySndop_Dispatch_ID( ASndop_Dispatch_ID: Real );
procedure DoASSY1AddToScheduleSndop_Dispatch_ID( ASndop_Dispatch_ID, AWork_Center_ID: Real );

procedure DoAddWorkorderToSchedule( AWorkorder_ID, AWork_Center_ID: Real );

type
  TSchedViewClass = class of TSchdHidden;

type
  TFrm_MainSched = class(TUniForm)
    pnlToolbar: TUniPanel;
    MainMenu1: TUniMainMenu;
    Schedule1: TUniMenuItem;
    InsertJobs1: TUniMenuItem;
    RequirementReports1: TUniMenuItem;
    MachineScheduleReports2: TUniMenuItem;
    SchedulingReports1: TUniMenuItem;
    ScheduleHoursDay1: TUniMenuItem;
    ScheduleMaterial1: TUniMenuItem;
    ScheduleSummary1: TUniMenuItem;
    DailyProjectedRequirements1: TUniMenuItem;
    MaterialExceptionList1: TUniMenuItem;
    DailyMaterialStaging1: TUniMenuItem;
    DailyPartsProjection1: TUniMenuItem;
    Configure1: TUniMenuItem;
    Scale1: TUniMenuItem;
    Colors2: TUniMenuItem;
    SetupNext1: TUniMenuItem;
    Capacity1: TUniMenuItem;
    RoughCutCapacity1: TUniMenuItem;
    AllCapacity1: TUniMenuItem;
    ScheduleCapacity1: TUniMenuItem;
    UnscheduledCapacity2: TUniMenuItem;
    N12: TUniMenuItem;
    N13: TUniMenuItem;
    EditCurrentJob1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Search1: TUniMenuItem;
    N9: TUniMenuItem;
    AboutIQSchedule1: TUniMenuItem;
    N16: TUniMenuItem;
    SnaptoLastJob: TUniMenuItem;
    RemoveJob1: TUniMenuItem;
    WorkOrder1: TUniMenuItem;
    AddEditWorkOrders1: TUniMenuItem;
    N3: TUniMenuItem;
    WorkOrderInfo1: TUniMenuItem;
    SchedulingParameters1: TUniMenuItem;
    N1: TUniMenuItem;
    ShopCalendar2: TUniMenuItem;
    N2: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    InsertJobs2: TUniMenuItem;
    EditJob1: TUniMenuItem;
    RemoveJob2: TUniMenuItem;
    ZoomIn1: TUniMenuItem;
    ZoomOut1: TUniMenuItem;
    N4: TUniMenuItem;
    navCenters: TUniDBNavigator;
    AddDownTime1: TUniMenuItem;
    MoveJob1: TUniMenuItem;
    MoveJob2: TUniMenuItem;
    Recalculate1: TUniMenuItem;
    N6: TUniMenuItem;
    ShopSetup1: TUniMenuItem;
    EndDate: TFDStoredProc;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    N14: TUniMenuItem;
    CenterSearch1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    pnlSchedArea: TUniPanel;
    ResetTimeLine1: TUniMenuItem;
    AddDownTime2: TUniMenuItem;
    Recalculate2: TUniMenuItem;
    View1: TUniMenuItem;
    TextMode1: TUniMenuItem;
    Filter1: TUniMenuItem;
    Filter2: TUniMenuItem;
    AppDef1: TIQWebAppDef;
    File1: TUniMenuItem;
    FileUpdateSchedule1: TUniMenuItem;
    N5: TUniMenuItem;
    Exit1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    IQJumpBom: TIQWebJump;
    JumptoBOM1: TUniMenuItem;
    JumptoWorkorder1: TUniMenuItem;
    N11: TUniMenuItem;
    IQJumpWorkOrder: TIQWebJump;
    PopupMenu2: TUniPopupMenu;
    IQJumpInv: TIQWebJump;
    IQJumpSalesOrder: TIQWebJump;
    JumptoInventory1: TUniMenuItem;
    JumptoSalesOrder1: TUniMenuItem;
    IQJumpInvMaterial: TIQWebJump;
    PopupMenu3: TUniPopupMenu;
    JumptoInvMaterial1: TUniMenuItem;
    ShowDetails1: TUniMenuItem;
    JumptoSalesOrder2: TUniMenuItem;
    Labour1: TUniMenuItem;
    LabourCapacity1: TUniMenuItem;
    N10: TUniMenuItem;
    GanttChart1: TUniMenuItem;
    ProductionBucketEnd1: TUniMenuItem;
    AutoLoad1: TUniMenuItem;
    RunAutoLoad1: TUniMenuItem;
    Backup1: TUniMenuItem;
    Restore1: TUniMenuItem;
    procBackup: TFDStoredProc;
    procRestore: TFDStoredProc;
    pnlLegend: TUniPanel;
    Shape1: TUniPanel;
    Shape2: TUniPanel;
    Shape3: TUniPanel;
    Shape4: TUniPanel;
    AddPMWorkOrder1: TUniMenuItem;
    JumptoPMWorkorder1: TUniMenuItem;
    JumptoInvAvailability1: TUniMenuItem;
    IQJumpAvailability: TIQWebJump;
    Shape5: TUniPanel;
    MaterialsOnExceptionList1: TUniMenuItem;
    Shape6: TUniPanel;
    Shape7: TUniPanel;
    SchedulingWindow1: TUniMenuItem;
    ConflictEvaluator1: TUniMenuItem;
    popmAssocDropDownButton: TUniPopupMenu;
    Recalcthisworkcenterprodstartendtime1: TUniMenuItem;
    RecalcallworkcentersincldependentMustStart: TUniMenuItem;
    Sort1: TUniMenuItem;
    ByWorkCenter1: TUniMenuItem;
    ByWorkCenterDescription1: TUniMenuItem;
    WorkorderRoutingDiagram1: TUniMenuItem;
    BOMTree1: TUniMenuItem;
    Shape8: TUniPanel;
    WorkOrderInfo2: TUniMenuItem;
    N7: TUniMenuItem;
    SalesOrderLineNote1: TUniMenuItem;
    N8: TUniMenuItem;
    PrintGVS1: TUniMenuItem;
    RunsTheBest1: TUniMenuItem;
    pnlTag3: TUniPanel;
    sbtnFlipTextGVS: TUniSpeedButton;
    sbtnPkCenter: TUniSpeedButton;
    pnlTag1: TUniPanel;
    sbtnInsert: TUniSpeedButton;
    sbtnRemove: TUniSpeedButton;
    sbtnMove: TUniSpeedButton;
    sbtnSetUp: TUniSpeedButton;
    sbtnRecalc: TIQWebDropDownButton;
    pnlTag2: TUniPanel;
    sbtnZoomIn: TUniSpeedButton;
    sbtnZoomOut: TUniSpeedButton;
    cboxSetView: TUniComboBox;
    pnlTag4: TUniPanel;
    sbtnHideWorkOrders: TUniSpeedButton;
    Bevel1: TUniPanel;
    wwDBComboDlgWOCaption: TUniEdit;
    cboxGVSMatExceptions: TUniComboBox;
    Bevel2: TUniPanel;
    AssociatedToolingEquipment1: TUniMenuItem;
    Shape9: TUniPanel;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    WhiteboardCapacityPlan1: TUniMenuItem;
    LaborWhiteboardCapacityPlan1: TUniMenuItem;
    ExistingLocks1: TUniMenuItem;
    HardAllocatedToWO1: TUniMenuItem;
    Timer1: TUniTimer;
    CalculateAllWorkCenters1: TUniMenuItem;
    CalcThisWorkCentersMSDBasedOnProdEndTime1: TUniMenuItem;
    PrintLabels1: TUniMenuItem;
    LMRT1: TIQWebLMRT;
    WONote1: TUniMenuItem;
    JumpToRealTimeMonitoring1: TUniMenuItem;
    PriorityNotes: TUniMenuItem;
    PriorityNote1: TUniMenuItem;
    PriorityNote2: TUniMenuItem;
    sbtnGVSViewKind: TUniSpeedButton;
    popmGVSViewKind: TUniPopupMenu;
    SetupTime1: TUniMenuItem;
    JumpToInventoryLocationsTransactions1: TUniMenuItem;
    JumpToMPSTimePhase1: TUniMenuItem;
    muiJumptoProcMon: TUniMenuItem;
    GroupIDAssignments1: TUniMenuItem;
    ReSequenceByMustStartDate1: TUniMenuItem;
    UpdateSchedule1: TUniMenuItem;
    NetChangeSchedule1: TUniMenuItem;
    procedure SchedulingParameters1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Scale1Click(Sender: TObject);
    procedure Colors1Click(Sender: TObject);
    procedure sbtnFlipTextGVSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditCurrentJob1Click(Sender: TObject);
    procedure SnaptoLastJobClick(Sender: TObject);
    procedure sbtnPkCenterClick(Sender: TObject);
    procedure InsertJobs1Click(Sender: TObject);
    procedure AddDownTime1Click(Sender: TObject);
    procedure MoveJob1Click(Sender: TObject);
    procedure RemoveJob1Click(Sender: TObject);
    procedure Recalculate1Click(Sender: TObject);
    procedure ShopSetup1Click(Sender: TObject);
    procedure SetupNext1Click(Sender: TObject);
    procedure AboutIQSchedule1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure ResetTimeLine1Click(Sender: TObject);
    procedure cboxSetViewChange(Sender: TObject);
    procedure sbtnZoomInClick(Sender: TObject);
    procedure sbtnZoomOutClick(Sender: TObject);
    procedure Filter1Click(Sender: TObject);
    procedure AppDef1AfterMfgTypeChanged(Sender: TObject);
    procedure RoughCutCapacity1Click(Sender: TObject);
    procedure DailyPartsProjection1Click(Sender: TObject);
    procedure DailyProjectedRequirements1Click(Sender: TObject);
    procedure JumptoBOM1Click(Sender: TObject);
    procedure JumptoWorkorder1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoSalesOrder1Click(Sender: TObject);
    procedure JumptoInvMaterial1Click(Sender: TObject);
    procedure DailyMaterialStaging1Click(Sender: TObject);
    procedure MaterialExceptionList1Click(Sender: TObject);
    procedure ShowDetails1Click(Sender: TObject);
    procedure UpdateSchedule1Click(Sender: TObject);
    procedure GanttChart1Click(Sender: TObject);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TNavigateBtn'
    procedure navCentersClick(Sender: TObject; Button: TNavigateBtn);}
    procedure LabourCapacity1Click(Sender: TObject);
    procedure Schedule1Click(Sender: TObject);
    procedure ProductionBucketEnd1Click(Sender: TObject);
    procedure RunAutoLoad1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure ShowDupMfg1Click(Sender: TObject);
    procedure AddPMWorkOrder1Click(Sender: TObject);
    procedure JumptoPMWorkorder1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AutoLoad1Click(Sender: TObject);
    procedure JumptoInvAvailability1Click(Sender: TObject);
    procedure MaterialsOnExceptionList1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SchedulingWindow1Click(Sender: TObject);
    procedure sbtnHideWorkOrdersClick(Sender: TObject);
    procedure ConflictEvaluator1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RecalcAllCenters(Sender: TObject);
    procedure ByWorkCenter1Click(Sender: TObject);
    procedure ByWorkCenterDescription1Click(Sender: TObject);
    procedure WorkorderRoutingDiagram1Click(Sender: TObject);
    procedure BOMTree1Click(Sender: TObject);
    procedure AppDef1BeforeMfgTypeChanged(Sender: TObject);
    procedure WorkOrderInfo2Click(Sender: TObject);
    procedure SalesOrderLineNote1Click(Sender: TObject);
    procedure PrintGVS1Click(Sender: TObject);
    procedure Reports1Click(Sender: TObject);
    procedure Configure1Click(Sender: TObject);
    procedure RunsTheBest1Click(Sender: TObject);
    procedure wwDBComboDlgWOCaptionCustomDlg(Sender: TObject);
    procedure cboxGVSMatExceptionsChange(Sender: TObject);
    procedure AssociatedToolingEquipment1Click(Sender: TObject);
    procedure WhiteboardCapacityPlan1Click(Sender: TObject);
    procedure LaborWhiteboardCapacityPlan1Click(Sender: TObject);
    procedure ExistingLocks1Click(Sender: TObject);
    procedure HardAllocatedToWO1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pnlToolbarDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CalcThisWorkCentersMSDBasedOnProdEndTime1Click(
      Sender: TObject);
    procedure PrintLabels1Click(Sender: TObject);
    procedure WONote1Click(Sender: TObject);
    procedure JumpToRealTimeMonitoring1Click(Sender: TObject);
    procedure PriorityNote1Click(Sender: TObject);
    procedure PriorityNote2Click(Sender: TObject);
    procedure SetupTime1Click(Sender: TObject);
    procedure sbtnGVSViewKindClick(Sender: TObject);
    procedure cboxGVSMatExceptionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JumpToInventoryLocationsTransactions1Click(Sender: TObject);
    procedure JumpToMPSTimePhase1Click(Sender: TObject);
    procedure muiJumptoProcMonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupIDAssignments1Click(Sender: TObject);
    procedure ReSequenceByMustStartDate1Click(Sender: TObject);
    procedure NetChangeSchedule1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FSortFieldName: string;
    procedure AssignMfgTypeCell;
    procedure IQExecProc( AProc: TFDStoredProc; S:string );
    procedure AssignFilterAndLocateRecord( AMfgType, AMfgCell: string; AWork_Center_ID, ACntr_Sched_ID: Real );
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo );
    procedure SetGVS_WOCaption(const Value: string);
    procedure AssignLegendVisible;
    procedure PrepareShowSndRunsBest(ASndop_Dispatch_ID: Real);
  protected
    { Protected declarations }
    FGVS_WOCaption: string;
    FDragDirection: string;

    { TODO -oBantuK -cWEB_CONVERT :
        Undeclared identifier: 'iq_RefreshDataSets'
        Undeclared identifier: 'iq_Notify'
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;}
    function IsWorkCenterLikeAssemblyLine(AWork_Center_ID: Real): Boolean;
  public
    { Public declarations }
    CurrentWO : string;
    DM : TSchdDM;
    Child : TSchdHidden;
    RTFilter : TCellMfgType;
    IQIrv32LockHandle: string;
    // InitialWorkOrder_ID: Real;       {is used in SchedGVSWin}
    InitialWorkOrderList: TStringList;  {is used in SchedGVSWin}
    IsSuccessfulStartUp: Boolean;
    IsAssy1Unrestricted: Boolean;

    property SortFieldName: string read FSortFieldName write FSortFieldName;
    property GVS_WOCaption: string read FGVS_WOCaption write SetGVS_WOCaption;

    function GetSnapToLastJob( AWork_Center_ID: Real ): Boolean;
    function ShouldApplyJIT(AWork_Center_ID: Real): Boolean;
    function GetProdStartTimeBasedOnJIT(AWork_Center_ID, AWorkorder_ID: Real): TDateTime;

    constructor Create( AOwner:TComponent; ACntr_Sched_ID: Real );
    constructor CreateEx( AOwner:TComponent );

    constructor CreateSchedWindow( AOwner:TComponent; AWorkOrderList: TStringList; ARefClass: TSchedViewClass );
    procedure StartUp( AOwner:TComponent );
    procedure AssignFilterFromCntrSchedID( ACntr_Sched_ID: Real );
    procedure AssignFilterFromWorkorder( AWorkOrder_ID: Real );
    procedure AssignFilterFromWork_Center(AWork_Center_ID: Real);
    procedure AssignFilterFromCargo( ACargo: TJumpToSchedCargo );

    class procedure IncrementIRV32Semaphore( var ALockHandle: string;
                                             ALockName: string = IQMS_IRV32;
                                             ALockMode: Integer = IQLOCK_SHARED;
                                             ADescription: string = 'Update Schedule' );
    class procedure DecrementIRV32Semaphore( ALockHandle: string );

    procedure ChangeModeTo( SchedViewClass: TSchedViewClass );
    function IsASSY1: Boolean;
    class procedure RaiseUpdateScheduleIQLockError( ALockName: string = IQMS.Common.Locks.IQMS_IRV32; ADescription: string = 'Update Schedule' );
    procedure EnableDragTimer( AValue: Boolean;  ADir: string );
    function Is_ASSY2_Workorder( AWorkorder_ID: Real ): Boolean;
    class procedure NetChangeShell;
  end;

//var
//  Frm_MainSched: TFrm_MainSched;

implementation

{$R *.DFM}

uses
  cap_whiteboard,
  //WEB_CONVERT CNF_Eval,
  Day_Proj,
  //WEB_CONVERT DupMfg,
  IQMS.Common.EditMemoStr,
  //WEB_CONVERT existing_locks,
  IQMS.Common.Applications,
  IQMS.Common.COMExe,
  IQMS.Common.Controls,
  //WEB_CONVERT IQDateRangeDlg,
  //WEB_CONVERT IQdbGrid,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.Proc,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IRV_Main,
  //WEB_CONVERT Lab_Cap,
  lab_whiteboard,
  Mat_Req,
  //WEB_CONVERT Mat_Stag,
  Mat_Xcpt,
  MatXcpWO,
  //WEB_CONVERT MPS_Time_Phase,
  //WEB_CONVERT Oe_2_Wo,
  IQMS.Common.PanelMsg,
  {WEB_CONVERT
  Plnt_Bas,
  PM_Const,
  RD_WO_Main,
  rt_main,
  rt_priority_note,
  rt_priority_note2,
  rtpcmon_bom_setup,}
  RTSelect,
  RunsBest,
  //WEB_CONVERT schd_autoload,
  //WEB_CONVERT schd_def_wo_caption,
  //WEB_CONVERT schd_snap,
  //WEB_CONVERT schd_wo_groupid,
  //WEB_CONVERT SchdBkt,
  //WEB_CONVERT SchdGVS,
  //WEB_CONVERT SchdGVSWin,
  //WEB_CONVERT SchdGVSWinJobShop,
  //WEB_CONVERT Schdpara,
  //WEB_CONVERT SchdText,
  sched_rscstr,
  //WEB_CONVERT sched_select_mfgtype,
  //WEB_CONVERT SchedPM,
  //WEB_CONVERT Shop_SU,
  //WEB_CONVERT snd_runs_best,
  System.Variants,
  IQMS.Common.WatchDogShare,
  //WEB_CONVERT wo_alloc_mat_main,
  WO_Gantt,
  Cap_Main;

{$REGION 'Wrappers'}

procedure DoIQSchedule( ACntr_Sched_ID: Real = 0 );
var
  I: Integer;
begin
  // 07-22-2010 allow multiple sched Vcl.Forms
  // for I:= 0 to Screen.FormCount - 1 do with Screen do
  //  if (Forms[ I ] is TFrm_MainSched) then
  //  begin
  //    if ACntr_Sched_ID > 0 then with Vcl.Forms[ I ] as TFrm_MainSched do
  //    begin
  //      ChangeModeTo( TSchedViewClass( TSchedText ));
  //      AssignFilterFromCntrSchedID( ACntr_Sched_ID )
  //    end;
  //    Vcl.Forms[ I ].BringToFront;
  //    EXIT;
  //  end;
  TFrm_MainSched.Create(Application.MainForm, ACntr_Sched_ID).Show;
end;

procedure DoIQScheduleEx( ACargo: TJumpToSchedCargo );
var
  I: Integer;
  AForm: TUniForm;
begin
  // 07-22-2010 allow multiple sched Vcl.Forms
  // AForm:= IQMS.Common.Controls.FindFormByClassType( TFrm_MainSched );
  // if not Assigned(AForm) then
  // begin
  //   AForm:= TFrm_MainSched.CreateEx(Application);
  //   if not TFrm_MainSched(AForm).IsSuccessfulStartUp then
  //      EXIT;
  // end;

  AForm:= TFrm_MainSched.CreateEx(Application);
  if not TFrm_MainSched(AForm).IsSuccessfulStartUp then
     EXIT;

  with TFrm_MainSched(AForm) do
  begin
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText'
    ChangeModeTo( TSchedViewClass( TSchedText ));}
    AssignFilterFromCargo( ACargo );
  end;

  AForm.Show;
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
  PostMessage( AForm.Handle, iq_Notify, 0, 0 );}   {Set Focus to Grid}
end;



procedure DoASSY1AddToScheduleSndop_Dispatch_ID( ASndop_Dispatch_ID, AWork_Center_ID: Real );
var
  I: Integer;
  AForm: TUniForm;
  A: Variant;
begin
  // 07-22-2010 allow multiple sched Vcl.Forms
  // // locate / create object
  // AForm:= IQMS.Common.Controls.FindFormByClassType( TFrm_MainSched );
  // if not Assigned(AForm) then
  // begin
  //   AForm:= TFrm_MainSched.CreateEx(Application);
  //   if not TFrm_MainSched(AForm).IsSuccessfulStartUp then
  //      EXIT;
  // end;

  AForm:= TFrm_MainSched.CreateEx(Application);
  if not TFrm_MainSched(AForm).IsSuccessfulStartUp then
     EXIT;

  // position on the work center and append job
  with TFrm_MainSched(AForm) do
  begin
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText'
    ChangeModeTo( TSchedViewClass( TSchedText ));}
    AssignFilterFromWork_Center( AWork_Center_ID );

    A:= SelectValueArrayFmt( 'select d.workorder_id,                                     '+
                        '       assy1_sched.get_process_data( d.id, ''HRS_TO_GO''), '+
                        '       s.setuphrs                                          '+
                        ' from sndop_dispatch d,                                    '+
                        '      sndop s                                              '+
                        ' where d.id = %f                                           '+
                        '   and d.sndop_id = s.id(+)                                ',
                        [ ASndop_Dispatch_ID ]);
    IQAssert(VarArrayDimCount( A ) > 0, Format('Invalid sndop_dispatch_id = %.0f',[ ASndop_Dispatch_ID ]));

    Child.AddJob( AWork_Center_ID,       // nCenterID
                  A[ 0 ],                // nWorkOrdID
                  999,                   // nSeq
                  A[ 1 ],                // nProdHrs
                  A[ 2 ],                // nSetupHrs
                  0,                     // 0 - regular workorder, 1 - downtime, 2 - downtime PM
                  '',                    // down reason
                  TRUE,                  // With Refresh
                  0,                     // pmwo_id
                  ASndop_Dispatch_ID );
  end;

  AForm.Show;
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
  PostMessage( AForm.Handle, iq_Notify, 0, 0 );}   {Set Focus to Grid}
end;


procedure DoAddWorkorderToSchedule( AWorkorder_ID, AWork_Center_ID: Real );
var
  I: Integer;
  AForm: TUniForm;
  A: Variant;
begin
  // 07-22-2010 allow multiple sched Vcl.Forms
  // // locate / create object
  // AForm:= IQMS.Common.Controls.FindFormByClassType( TFrm_MainSched );
  // if not Assigned(AForm) then
  // begin
  //   AForm:= TFrm_MainSched.CreateEx(Application);
  //   if not TFrm_MainSched(AForm).IsSuccessfulStartUp then
  //      EXIT;
  // end;

  AForm:= TFrm_MainSched.CreateEx(Application);
  if not TFrm_MainSched(AForm).IsSuccessfulStartUp then
     EXIT;

  // position on the work center and append job
  with TFrm_MainSched(AForm) do
  begin
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText'
    ChangeModeTo( TSchedViewClass( TSchedText ));}
    AssignFilterFromWork_Center( AWork_Center_ID );

    A:= SelectValueArrayFmt( 'select prodhrs, setuphrs from v_workorder_not_sched where id = %f',
                        [ AWorkorder_ID ]);
    IQAssert(VarArrayDimCount( A ) > 0, Format('Invalid workorder_id = %.0f',[ AWorkorder_ID ]));

    Child.AddJob( AWork_Center_ID,       // nCenterID
                  AWorkorder_ID,         // nWorkOrdID
                  999,                   // nSeq
                  A[ 0 ],                // nProdHrs
                  A[ 1 ],                // nSetupHrs
                  0,                     // 0 - regular workorder, 1 - downtime, 2 - downtime PM
                  '',                    // down reason
                  TRUE,                  // With Refresh
                  0,                     // pmwo_id
                  0 );                   // ASndop_Dispatch_ID
  end;

  AForm.Show;

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
  PostMessage( AForm.Handle, iq_Notify, 0, 0 );}   {Set Focus to Grid}
end;



procedure DoIQSchedWindow( AWorkOrder_ID: Real );
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    AList.Add( FloatToStr( AWorkOrder_ID ));
    DoIQSchedWindow( AList );               {this unit}
  finally
    AList.Free;
  end;
end;

procedure DoIQSchedWindow( AWorkOrderList: TStringList );
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedGVSWin'
  TFrm_MainSched.CreateSchedWindow( Application, AWorkOrderList, TSchedGVSWin ).Show;}
end;

procedure DoIQSchedWindowJobShop( AWorkOrder_ID: Real );
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    AList.Add( FloatToStr( AWorkOrder_ID ));
    DoIQSchedWindowJobShop( AList );               {this unit}
  finally
    AList.Free;
  end;
end;

procedure DoIQSchedWindowJobShop( AWorkOrderList: TStringList );
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedGVSWinJobShop'
  TFrm_MainSched.CreateSchedWindow( Application, AWorkOrderList, TSchedGVSWinJobShop ).Show;}
end;

procedure DoIQJumpToIQSchedule( ACntr_Sched_ID: Real );
begin
  // TFrm_MainSched.Create(Application, ACntr_Sched_ID).Show;
  DoIQSchedule( ACntr_Sched_ID );
end;

procedure DoIQJumpToIQScheduleByWorkorder( AWorkorder_ID: Real );
var
  ACntr_Sched_ID: Real;
begin
  ACntr_Sched_ID:= SelectValueFmtAsFloat('select id from cntr_sched where workorder_id = %f and parent_work_center_id is null', [ AWorkorder_ID ]);  // do not apply rt.consider_work_center(...) = 1
  DoIQJumpToIQSchedule( ACntr_Sched_ID );
end;

procedure DoIQJumpToIQScheduleBySndop_Dispatch_ID( ASndop_Dispatch_ID: Real );
var
  ACntr_Sched_ID: Real;
begin
  ACntr_Sched_ID:= SelectValueFmtAsFloat('select id from cntr_sched where sndop_dispatch_id = %f and parent_work_center_id is null', [ ASndop_Dispatch_ID ]);  // do not apply rt.consider_work_center(...) = 1
  DoIQJumpToIQSchedule( ACntr_Sched_ID );
end;

{$ENDREGION 'Wrappers'}

{  TFrm_MainSched }

constructor TFrm_MainSched.Create( AOwner:TComponent; ACntr_Sched_ID: Real );
begin
  try
    StartUp( AOwner );
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText'
    ChangeModeTo( TSchedViewClass( TSchedText ));}
    if ACntr_Sched_ID > 0 then
       AssignFilterFromCntrSchedID( ACntr_Sched_ID )
    else
       begin
         CheckSmartPageMakeLauncherHidden;
         Filter1Click(self);                                 { Set RTFilter (Cell/MfgType) }
       end;
  except on E:EAbort do
    PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
  end;
end;

constructor TFrm_MainSched.CreateEx( AOwner:TComponent );
begin
  // used in assy1 adding to cntr_sched. see DoASSY1AddToScheduleSndop_Dispatch_ID above
  try
    StartUp( AOwner );
  except on E:EAbort do
    PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
  end;
end;

constructor TFrm_MainSched.CreateSchedWindow( AOwner:TComponent; AWorkOrderList: TStringList; ARefClass: TSchedViewClass );
begin
  try
    StartUp( AOwner );
    if AWorkOrderList.Count = 0 then ABORT;
    InitialWorkOrderList.Assign( AWorkOrderList );

    //ChangeModeTo( TSchedViewClass( TSchedGVSWin ));
    ChangeModeTo( TSchedViewClass( ARefClass ));           {ARefClass = TSchedGVSWin or TSchedGVSWinJobShop }
    AssignFilterFromWorkorder( StrToFloat(InitialWorkOrderList[ 0 ]));

    self.HelpContext:= 1011260;
    if Assigned(Child) then
       Child.HelpContext:= 1011260;

  except on E:EAbort do
    PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
  end;
end;

procedure TFrm_MainSched.FormCreate(Sender: TObject);
begin
  // pnlLegend.Visible:= cboxGVSMatExceptions.ItemIndex <> 3;
  AssignLegendVisible;
  muiJumptoProcMon.Enabled := SecurityManager.IsModuleLicensed(IQAppsNames[IQMS.Common.Applications.apPCMon]);
end;

procedure TFrm_MainSched.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self, cboxGVSMatExceptions ]);
end;

procedure TFrm_MainSched.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:Integer;
begin
  IQRegStringScalarWrite( nil, 'SortFieldName', FSortFieldName, TRUE );
  IQRegStringScalarWrite( self, 'WOCaption',     GVS_WOCaption,   TRUE );

  IQRegFormWrite(self, [ self, cboxGVSMatExceptions ]);

  if Assigned(Child) then
     Child.Close;
  Action:= caFree;
  Application.OnShowHint:= NIL;
end;

procedure TFrm_MainSched.FormDestroy(Sender: TObject);
begin
  InitialWorkOrderList.Free;
end;

procedure TFrm_MainSched.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
  Application.OnShowHint:= DoOnShowHint;
end;

procedure TFrm_MainSched.StartUp( AOwner:TComponent );
var
  AValue: Boolean;
  AStrValue: string;
begin
  InitialWorkOrderList:= TStringList.Create;

  DM:= TSchdDM.Create(self);
  inherited Create(AOwner);
  DM.Name:= '';

  EnableDragTimer( FALSE, '' );

  {sort}
  // IQRegStringScalarRead( self, 'SortFieldName', FSortFieldName, TRUE );  {we use FSortFieldName in GVS to sort workcenters}
  IQRegStringScalarRead( nil, 'SortFieldName', FSortFieldName, TRUE );  {we use FSortFieldName in GVS to sort workcenters}
  if FSortFieldName = '' then
     FSortFieldName:= 'CNTR_DESC';

  if CompareText( SortFieldName, 'EQNO' ) = 0 then
     ByWorkCenter1.Checked:= TRUE
  else
     ByWorkCenterDescription1.Checked:= TRUE;

  {GVS WO caption}
  IQRegStringScalarRead( self, 'WOCaption', AStrValue, TRUE );  {we use WOCaption in GVS}
  if AStrValue = '' then
     AStrValue:= sched_rscstr.cTXT0000001; // 'Mfg#';
  GVS_WOCaption:= AStrValue;

  try
    IncrementIRV32Semaphore(IQIrv32LockHandle);                    {Shared mode}
  except on E:Exception do
    begin
      Application.ShowException( E );
      ABORT;
    end;
  end;
  DecrementIRV32Semaphore(IQIrv32LockHandle);

  //IQSetTablesActive( TRUE, DM );
  IQSetTablesActiveEx(True, DM, sched_rscstr.cTXT0000007 {'Accessing Scheduling.  Please wait.'});

  // {For backward compatability check params.sched_snap_to_last assigned}
  // if (SelectValueAsFloat('select 1 from params where sched_snap_to_last is NULL') = 1) and
  //    IQRegBooleanScalarRead(NIL, 'Snap_To_Last_Job', AValue)  then
  // begin
  //    ExecuteCommandFmt('update params set sched_snap_to_last = ''%s''', [ IIf( AValue, 'Y', 'N' )]);
  // end;
  //if not IQRegBooleanScalarRead( NIL, 'Snap_To_Last_Job', AValue ) then
  //   IQRegBooleanScalarWrite( NIL, 'Snap_To_Last_Job', TRUE ); {first time}

  IsAssy1Unrestricted:= SelectValueAsFloat('select assy1_sched.is_assy1_unrestricted from dual') = 1;

  IsSuccessfulStartUp:= TRUE;
end;


procedure TFrm_MainSched.Exit1Click(Sender: TObject);
begin
  Close;
end;

class procedure TFrm_MainSched.IncrementIRV32Semaphore( var ALockHandle: string;
                                                        ALockName: string = IQMS_IRV32;
                                                        ALockMode: Integer = IQLOCK_SHARED;
                                                        ADescription: string = 'Update Schedule' );
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DB_DataModule'
                                  Undeclared identifier: 'AcquireIQLock'
  with DB_DataModule do
    if not AcquireIQLock( ALockHandle, ALockName, ALockMode ) then}
    begin
      ALockHandle:= '';
      RaiseUpdateScheduleIQLockError( ALockName, ADescription );
    end;
end;

class procedure TFrm_MainSched.RaiseUpdateScheduleIQLockError( ALockName: string = IQMS.Common.Locks.IQMS_IRV32; ADescription: string = 'Update Schedule' );
var
  AUserName: string;
begin
  //Caption:= 'Update Schedule is currently running - you must exit this screen. Please try again later';
  AUserName:= Trim(SelectValueFmtAsString('select user_name from iqsemaphore where lock_name = ''%s''', [ ALockName ]));
  if AUserName > '' then
    raise ENonFatalException.CreateFmt('Failed to acquire shared lock.'#13#13'''%s'' process initiated by %s is currently in progress. Please try again later',
                                       [ ADescription, AUserName ])
  else
    raise ENonFatalException.CreateFmt('Failed to acquire shared lock.'#13#13'''%s'' process is currently in progress. Please try again later',
                                       [ ADescription ]);
end;

class procedure TFrm_MainSched.DecrementIRV32Semaphore( ALockHandle: string );
var
  S:string;
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DB_DataModule'
  with DB_DataModule do}
    if ALockHandle > '' then
    begin
      { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'IQUnLock'
      S:= IQUnLock( ALockHandle );}
      if S <> '' then
         IQWarning( S + ' - Unable to unlock existing lock. Terminate to allow other users to run the same applicaiton');
    end;
end;

procedure TFrm_MainSched.AssignFilterFromCntrSchedID( ACntr_Sched_ID: Real );
var
  A:Variant;
begin
  A:= SelectValueArrayFmt( 'select w.mfg_type, w.mfgcell, w.id as work_center_id from work_center w, cntr_sched s'+
                      ' where s.id = %f and s.work_center_id = w.id', [ ACntr_Sched_ID ]);
  if VarArrayDimCount( A ) = 0 then
     IQWarning(Format('Unable to find Scheduling ID = %.0f', [ ACntr_Sched_ID ]));

  AssignFilterAndLocateRecord( A[ 0 ],            {mfgtype       }
                               A[ 1 ],            {mfgcell       }
                               A[ 2 ],            {work_center_id}
                               ACntr_Sched_ID );  {cntr_sched_id }
end;


procedure TFrm_MainSched.AssignFilterFromCargo( ACargo: TJumpToSchedCargo );
begin
  AssignFilterAndLocateRecord( ACargo.Filter.MfgType,          {mfgtype       }
                               ACargo.Filter.Cell,             {mfgcell       }
                               ACargo.Work_Center_ID,          {work_center_id}
                               ACargo.Cntr_Sched_ID );         {cntr_sched_id }
end;


procedure TFrm_MainSched.AssignFilterFromWorkorder( AWorkOrder_ID: Real );
var
  A:Variant;
begin
  {find mfgtype and cell based on workcenter if scheduled} {do not apply rt.consider_work_center(...) = 1}
  A:= SelectValueArrayFmt( 'select w.mfg_type, w.mfgcell, w.id, s.id from work_center w, cntr_sched s'+
                      ' where s.workorder_id = %f and s.work_center_id = w.id and s.parent_work_center_id is null', [ AWorkOrder_ID ]);

  {if not scheduled find mfgtype and cell based on standard}
  if VarArrayDimCount( A ) = 0 then
     A:= SelectValueArrayFmt( 'select s.mfg_type, s.mfgcell, 0, 0 from workorder w, standard s'+
                         ' where w.id = %f and s.id = w.standard_id', [ AWorkOrder_ID ]);

  if VarArrayDimCount( A ) = 0 then
     raise Exception.CreateFmt('Unable to find WorkOrder %.0f', [ AWorkOrder_ID ]);

  AssignFilterAndLocateRecord( A[ 0 ],   {mfgtype       }
                               A[ 1 ],   {mfgcell       }
                               A[ 2 ],   {work_center_id}
                               A[ 3 ]);  {cntr_sched_id }
end;


procedure TFrm_MainSched.AssignFilterFromWork_Center( AWork_Center_ID: Real );
var
  A:Variant;
begin
  A:= SelectValueArrayFmt( 'select mfg_type, mfgcell from work_center where id = %f', [ AWork_Center_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to find Work  Center ID = %.0f', [ AWork_Center_ID ]));

  AssignFilterAndLocateRecord( A[ 0 ],            {mfgtype       }
                               A[ 1 ],            {mfgcell       }
                               AWork_Center_ID,   {work_center_id}
                               0 );               {cntr_sched_id }
end;


procedure TFrm_MainSched.AssignFilterAndLocateRecord( AMfgType, AMfgCell: string; AWork_Center_ID, ACntr_Sched_ID: Real );
begin
  with RTFilter do
  begin
    Cell    := '';
    MfgType := '';
    if AMfgType <> '' then
       MfgType:= AMfgType;
    if AMfgCell <> '' then
       Cell:= AMfgCell;
    if Cell = '' then
      CellOrMfgType:= cmMfgType
    else
      CellOrMfgType:= cmCell;
  end;

  AssignMfgTypeCell;

  try
    if (AWork_Center_ID = 0) and (ACntr_Sched_ID > 0) then
       AWork_Center_ID:= SelectValueByID('work_center_id', 'cntr_sched', ACntr_Sched_ID);

    if AWork_Center_ID > 0 then
       DM.TblWork_Center.Locate('ID', AWork_Center_ID, []);

    if ACntr_Sched_ID > 0 then
       DM.TblCntr_Sched.Locate('ID', ACntr_Sched_ID, []);
  except
  end;
end;

procedure TFrm_MainSched.SchedulingParameters1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrm_SchedParams'
  with TFrm_SchedParams.Create(self) do
  try
    ShowModal
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
    Free;
  end;}
end;

procedure TFrm_MainSched.Scale1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.ChangeScale;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.Colors1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.ChangeColors;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.EditCurrentJob1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.EditCurrentJobClick(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.sbtnFlipTextGVSClick(Sender: TObject);
var
  SchedViewClass: TSchedViewClass;
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText'
  if not Assigned( Child ) then
     ChangeModeTo( TSchedViewClass( TSchedText ))

  else if Child.ClassType = TSchedText then
     ChangeModeTo( TSchedViewClass( TSchedGVS ))

  else
     ChangeModeTo( TSchedViewClass( TSchedText ));}

  AssignLegendVisible;
end;

procedure TFrm_MainSched.sbtnGVSViewKindClick(Sender: TObject);
var
  P: TPoint;
begin
  with TUniSpeedButton(Sender) do
     begin
       P.y:= Height;
       P.x:= Left;
       P:= pnlTag2.ClientToScreen( P );
       popmGVSViewKind.Popup( P.X, P.Y );
     end;
end;


procedure TFrm_MainSched.ChangeModeTo( SchedViewClass: TSchedViewClass );
var
  AChildWasAssigned: Boolean;
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
     AChildWasAssigned:= Assigned(Child);
     if AChildWasAssigned then
     try
       Child.Close;
       Child:= NIL;
     except
       Child:= NIL; {Could not free the child - at least don't get stuck here}
     end;

     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText'
     if SchedViewClass = TSchedText then
        HelpContext := 1062485
     else if SchedViewClass = TSchedGVSWin then
        HelpContext := 1094653
     else if SchedViewClass = TSchedGVSWinJobShop then
        HelpContext := 1094653
     else
        HelpContext := 1013090;}

     DM.Name:= 'SchdDM';
     Child:= SchedViewClass.Create( self );
     DM.Name:= '';
     if AChildWasAssigned then
        Child.InvalidateSchedule;

     pnlLegend.Left:= 0;  {to make it go before the navigator}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.SnaptoLastJobClick(Sender: TObject);
var
  AValue: Boolean;
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    // SnapToLastJob1.Checked:= not SnapToLastJob1.Checked;

    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSched_Snap'
    if not TFrmSched_Snap.DoShowModal( DM.SrcWork_Center ) then}             {schd_snap.pas}
       //WEB_CONVERT EXIT;

    SnaptoLastJob.Checked:= GetSnapToLastJob( DM.TblWork_CenterID.asFloat );

    // if SnapToLastJob1.Checked then
    if GetSnapToLastJob( DM.TblWork_CenterID.asFloat ) then
       IQConfirm('Add/Edit/Move will Snap a Work Order with no Force-Start-Date info to the back of the previous job.')
    else
       IQConfirm('Add/Edit/Move will keep Work Order''s Force-Start-Date info.');
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.sbtnPkCenterClick(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.PickCenter(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.InsertJobs1Click(Sender: TObject);
begin
  Child.InsertJobClick(Sender);
end;

procedure TFrm_MainSched.AddDownTime1Click(Sender: TObject);
begin
  Child.AddDownTimeClick(Sender);
end;

procedure TFrm_MainSched.MoveJob1Click(Sender: TObject);
begin
  Child.MoveJobClick(Sender);
end;

procedure TFrm_MainSched.muiJumptoProcMonClick(Sender: TObject);
var
  AStandard_ID,
  AWork_Cntr_ID,
  AWorkorder_ID,
  APCMonBomID : real;
begin
 //EIQ-1085 RealTime Monitor and Finite Scheduling, right click, jump to Process Monitor Mfg # Setup. 09/25/13 AB
  AStandard_ID  := DM.TblCntr_SchedStandard_ID.asFloat;
  AWork_Cntr_ID := DM.TblCntr_SchedWORK_CENTER_ID.asFloat;
  AWorkorder_ID := DM.TblCntr_SchedWORKORDER_ID.asFloat;

  if (AStandard_ID = 0) or (AWork_Cntr_ID = 0) or (AWorkorder_ID = 0) then Exit;

  {Get which WC/BOM to jump to.  If no records, do not abort jump, just go to the top}
  APCMonBomID   := SelectValueFmtAsFloat('select ID '+
                             'from pcmon_bom '+
                             'where work_center_id = %.0f '+
                             '  and standard_id = %.0f',[ AWork_Cntr_ID,
                                                          AStandard_ID ]);
  (* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmRTPcMonBOMSetup'
  if APCMonBomID <> 0 then
    TFrmRTPcMonBOMSetup.DoPCMonMfgSetupDevice(self, APCMonBomId) //rtpcmon_bom_setup.pas {PcMon BOM has been set up}
  else
    TFrmRTPcMonBOMSetup.DoPCMonMfgSetup(self, AStandard_ID );   //rtpcmon_bom_setup.pas {PcMon BOM has not been set up}
  *)
end;

procedure TFrm_MainSched.RemoveJob1Click(Sender: TObject);
begin
  Child.RemoveJobClick(Sender);
end;

procedure TFrm_MainSched.Recalculate1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.RecalculateClick(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.ShopSetup1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'ShopSetUpEx'
    ShopSetUpEx;}  // in Shop_SU.pas  - sets # of shifts, start times, working days, weekends.
    DM.TblParams.Refresh;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.SetupNext1Click(Sender: TObject);
begin
  // IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  // taken out to allow update schedule to run. Aug-20-02
  try
    Child.SetupNextClick(Sender);
  finally
    // DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.SetupTime1Click(Sender: TObject);
begin
  SetupTime1.Checked:= not SetupTime1.Checked;
  Child.InvalidateSchedule;

end;

procedure TFrm_MainSched.AboutIQSchedule1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrm_MainSched.Print1Click(Sender: TObject);
begin
  Child.PrintClick(Sender);
end;

procedure TFrm_MainSched.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrm_MainSched.ResetTimeLine1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.ResetTimeLineClick(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.cboxSetViewChange(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.SetViewChange(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.sbtnZoomInClick(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.ZoomInClick(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.sbtnZoomOutClick(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.ZoomOutClick(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.Filter1Click(Sender: TObject);
begin
  // if PickMfgTypeCell( RTFilter ) then   {PickMfgTypeCell is in RTSelect.pas}
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSchedSelectMfgType'
  if TFrmSchedSelectMfgType.Execute( RTFilter ) then}  {sched_select_mfgtype.pas}
    begin
      IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
      try
        AssignMfgTypeCell;
      finally
        DecrementIRV32Semaphore(IQIrv32LockHandle);
      end
    end
  {WEB_CONVERT
  else
    ABORT;}                             {Same proc is called OnCreate. Abort if cancelled}
end;

procedure TFrm_MainSched.AssignMfgTypeCell;
begin
  AppDef1.MfgType:= RTFilter.MfgType;
  Child.InvalidateSchedule;

  // 09-16-2011 see Child.AssignLabels called from AppDef1AfterMfgTypeChanged in this unit
  // // 11-16-2010 refresh grid columns that is based on mfgtype
  // if Child is TSchedText then
  //    TSchedText(Child).RestoreGridSettings;
end;

procedure TFrm_MainSched.AppDef1AfterMfgTypeChanged(Sender: TObject);
begin
  if Assigned(Child) then
     Child.AssignLabels;
end;

procedure TFrm_MainSched.AppDef1BeforeMfgTypeChanged(Sender: TObject);
begin
  if Assigned(Child) then
     Child.SaveLabels;
end;

procedure TFrm_MainSched.RoughCutCapacity1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoCapacity'
    DoCapacity;} {Cap_Main.pas}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.DailyPartsProjection1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    DoDailyPartsProj; {Day_Proj.pas}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.DailyProjectedRequirements1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    DoRawMaterialRequired( 0 ); {Mat_Req.pas}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.JumptoBOM1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    IQJumpBom.Execute;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.JumptoWorkorder1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    IQJumpWorkOrder.Execute;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.JumptoInventory1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    IQJumpInv.Execute;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;


procedure TFrm_MainSched.JumptoSalesOrder1Click(Sender: TObject);
var
  AOrd_Detail_ID: Real;
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    if DM.QryPtOrderORDERS_ID.asFLoat > 0 then
    begin
       IQJumpSalesOrder.Execute;
       EXIT;
    end;

    // Plan "B"
    AOrd_Detail_ID:= SelectValueFmtAsFloat('select ord_detail_id from ptorder_rel where ptorder_id = %f and ord_detail_id is not null order by ord_detail_id',
                               [ DM.QryPtOrderID.asFloat ]);

    { TODO -oBantuK -cWEB_CONVERT : 'UserMessages' is not the name of a unit
    JumpDirect( IQMS.Common.UserMessages.iq_JumpToSalesOrderDetail, Trunc(AOrd_Detail_ID));}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.JumptoInvMaterial1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    IQJumpInvMaterial.Execute;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.DailyMaterialStaging1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoMatStaging'
    DoMatStaging;}  {Mat_Stag.pas}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.MaterialExceptionList1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    DoMatException;  {Mat_Xcpt.pas}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.ShowDetails1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.ShowDetailsClick(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.UpdateSchedule1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    DoIRV32( IQIrv32LockHandle ); {IRV_Main}
    if Assigned(Child) then
       Child.UpdateProgressPanel( TFrmIRV32.GetLastRecalcDateAsStringEx() );  // IRV_Main.pas
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.GanttChart1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    DoShowItemGantt( DM.SrcPtOrder );  {WO_Gantt.pas}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

(*TODO -oBantuK -cWEB_CONVERT :
    Undeclared identifier: 'iq_RefreshDataSets'
procedure TFrm_MainSched.IQRefreshDataSets( var Msg: TMessage );
begin
  case Msg.WParam of
    0: begin
         IQSetTablesActive( FALSE, DM );
         IQSetTablesActive( TRUE, DM );
         DM.TblCntr_Sched.Refresh;
       end;
    1: begin
         Reopen( DM.QryV_Sched );
         DM.TblCntr_Sched.Refresh;
         if Msg.LParam > 0 then
            DM.TblCntr_Sched.Locate('ID', Msg.LParam, []);
       end;
    2: begin                              {sent from auto load on completion}
         Reopen( DM.QryV_Sched );
         DM.TblWork_Center.Refresh;
         DM.TblCntr_Sched.Refresh;

         if Assigned(Child) then
         begin
            Child.InvalidateSchedule;
            Child.RestoreFromRegistry;
         end;
       end;

  end;
end;
*)

(* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TNavigateBtn'
procedure TFrm_MainSched.navCentersClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    if Button = nbRefresh then with DM do
    begin
      Reopen( QryV_Sched );
      TblCntr_Sched.Refresh;
      Reopen( QryPtOrder );
    end;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;
*)

procedure TFrm_MainSched.LabourCapacity1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoLaborCapacity'
    DoLaborCapacity;} { Lab_Cap.pas }
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.Schedule1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    ProductionBucketEnd1.Enabled:= (DM.TblCntr_SchedWORKORDER_ID.asFloat > 0) and
                                   (DM.TblCntr_SchedCNTR_SEQ.asFloat = 1)
       // (SelectValueFmtAsFloat('select 1 from illum_rt where cntr_sched_id = %f', [ DM.TblCntr_SchedID.asFloat ]) = 1)
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.ProductionBucketEnd1Click(Sender: TObject);
var
  ADate: TDateTime;
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    ADate:= DM.TblCntr_SchedBucket_End_Disp.asDateTime;
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'GetProdBucketEndDate'
    if GetProdBucketEndDate( ADate ) then} {SchdBkt.pas}
       with DM.TblCntr_Sched do
       begin
         Edit;
         if DateToStr( ADate )= '12/30/1899' then
            DM.TblCntr_SchedPROD_BUCKET_END.Clear
         else
           DM.TblCntr_SchedPROD_BUCKET_END.asDateTime:= ADate;
         Post;
       end;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.RunAutoLoad1Click(Sender: TObject);
begin
  // IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  // try
  //   if TFrmAutoLoad.DoShowModal( self, SecurityManager.EPlant_ID_AsFloat, IIf( RTFilter.CellOrMfgType = cmCell, RTFilter.MfgCell_ID, 0)) then  {schd_autoload.pas}
  //   begin
  //     Reopen( DM.QryV_Sched );
  //     DM.TblWork_Center.Refresh;
  //     DM.TblCntr_Sched.Refresh;
  //
  //     if Assigned(Child) then
  //        Child.InvalidateSchedule;
  //   end;
  // finally
  //   DecrementIRV32Semaphore(IQIrv32LockHandle);
  // end;

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText'
  if Assigned(Child) and (Child is TSchedText) then
     Child.SaveToRegistry;

  TFrmAutoLoad.DoShow( self,
                       SecurityManager.EPlant_ID_AsFloat,
                       IIf( RTFilter.CellOrMfgType = cmCell, RTFilter.MfgCell_ID, 0))} {schd_autoload.pas}
end;

procedure TFrm_MainSched.Backup1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    if IQConfirmYN('This option creates a backup of currently scheduled workorders starting from pos 2 and on'#13#13+
                   Backup1.Hint+#13#13+
                   'Do you wish to continue?') then
    begin
      procBackup.ParamByName('v_freeze_jobs_count').Value:= 2;
      IQExecProc( procBackup, '' );
    end;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;


procedure TFrm_MainSched.Restore1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    if IQConfirmYN('This option restores previously backedup scheduled workorders starting from pos 2 and on'#13#13+
                   Restore1.Hint+#13#13+
                   'Do you wish to continue?') then
    begin
      procRestore.ParamByName('v_freeze_jobs_count').Value:= 2;
      IQExecProc( procRestore, '' );
    end;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.IQExecProc( AProc: TFDStoredProc; S:string );
var
  HMsg: TPanelMesg;
  AEPlant_ID : string;
begin
  AEPlant_ID := SecurityManager.EPlant_ID;

  if not SecurityManager.EPlantsExist or
    (AEPlant_ID <> 'NULL')
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoPickEPlant'
     or DoPickEPlant( AEPlant_ID )}
    then
     try
       HMsg:= hPleaseWait( S );
       with AProc do
       begin

         if AEPlant_ID <> 'NULL' then
            ParamByName('v_eplant_id').Value:= StrToFloat( AEPlant_ID )
         else
            ParamByName('v_eplant_id').Clear;

         if RTFilter.CellOrMfgType = cmCell then
            ParamByName('v_mfgcell_id').Value:= RTFilter.MfgCell_ID
         else
            ParamByName('v_mfgcell_id').Clear;

         Prepare;
         ExecProc;
       end;
     finally
       Reopen( DM.QryV_Sched );
       DM.TblWork_Center.Refresh;
       DM.TblCntr_Sched.Refresh;
       HMsg.Free;
       Screen.Cursor:= crDefault;
     end;

  if Assigned(Child) then
     Child.InvalidateSchedule;
end;

procedure TFrm_MainSched.ShowDupMfg1Click(Sender: TObject);
begin
  // DoShowDupRunningMfg;  { DupMfg.pas }
end;

procedure TFrm_MainSched.AddPMWorkOrder1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    //DoSchedPM( self, DM.TblCntr_SchedWORK_CENTER_ID.asFloat );  {Sched_PM}
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoSchedPM'
    DoSchedPM( self, DM.TblWork_CenterID.asFloat );}               {Sched_PM}
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.JumptoPMWorkorder1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    (* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_JumpToPMWorkOrder'
    if DM.TblCntr_SchedPmWo_ID.asFloat > 0 then
       // DoJumpToPMWO( self, DM.TblCntr_SchedPmWo_ID.asFloat )
       //Com_Exec( 'IQPM', [ PM_Const.PM_JUMP_WO, DM.TblCntr_SchedPmWo_ID.asFloat ])   { IQMS.Common.COMExe.pas }
       IQMS.WebVcl.Jump.JumpDirect(iq_JumpToPMWorkOrder,
         DM.TblCntr_SchedPmWo_ID.asInteger)
    else
       IQConfirm( 'Jump information not available'#13#13'[ ID = NULL ]');
    *)
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.Contents1Click(Sender: TObject);
begin
//     DoHelp( iqchmMFG, iqhtmSCHED, '1062488' );  {in IQMS.Common.HelpHook.pas}
  IQHelp.HelpContext( 1062485 );
end;

procedure TFrm_MainSched.AutoLoad1Click(Sender: TObject);
var
  S: string;
begin
  {Jan-16-02 commented out to avoid hourglass when "auto load" menu option is clicked}
  //IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    S:= Format('EPlant : %s'#13 +
               'MfgCell: %s',
               [ sIIf( SecurityManager.EPlant_ID = 'NULL', 'No Filter', SecurityManager.EPlant_Name ),
                 sIIf( RTFilter.CellOrMfgType <> cmCell,   'No Filter', FixStr(RTFilter.Cell) )]);
    RunAutoLoad1.Hint:= S;
    Backup1.Hint     := S;
    Restore1.Hint    := S;
  finally
    //DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.JumptoInvAvailability1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    IQJumpAvailability.Execute;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.PopupMenu1Popup(Sender: TObject);
begin
  MaterialsOnExceptionList1.Enabled  := DM.TblCntr_SchedWO_IsOnExceptionList.asString = 'Y';
  AssociatedToolingEquipment1.Enabled:= DM.TblCntr_SchedTool_Is_Down.asString = 'Y';
  JumpToRealTimeMonitoring1.Enabled  := (DM.TblWork_CenterID.asFloat > 0) and SR.Enabled['JumpToRealTimeMonitoring1'];
  JumptoPMWorkorder1.Enabled := (DM.TblCntr_SchedPmWo_ID.asInteger > 0) and SR.Enabled['JumptoPMWorkorder1'];
  ReSequenceByMustStartDate1.Enabled:= IsAssy1Unrestricted and SR.Enabled['ReSequenceByMustStartDate1'];
end;

procedure TFrm_MainSched.MaterialsOnExceptionList1Click(Sender: TObject);
begin
  Child.WorkorderMaterialExceptions;
end;

procedure TFrm_MainSched.SchedulingWindow1Click(Sender: TObject);
begin
  Child.SchedulingWindow( Sender );
end;

procedure TFrm_MainSched.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
    if HintControl = sbtnHideWorkOrders then
    begin
       if sbtnHideWorkOrders.Down then
          HintStr:= 'Unrelated workorders are hidden' + #13 + 'Click to show.'
       else
          HintStr:= 'Unrelated workorders are shown' + #13 + 'Click to hide.'
    end;
end;

procedure TFrm_MainSched.sbtnHideWorkOrdersClick(Sender: TObject);
begin
  Child.InvalidateSchedule; {sbtnHideWorkOrders button is visible only in SchedGVSWin}
end;

procedure TFrm_MainSched.ConflictEvaluator1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmEvalConflicts'
  TFrmEvalConflicts.CreateModeless;}  {CNF_EVal}
end;

procedure TFrm_MainSched.RecalcAllCenters(Sender: TObject);
begin
  if not IQConfirmYN('This option recalculates the production start/end dates for every scheduled work order on every work center including ''Must Start'' date for all the child workorders of the top level (0) workorders that are scheduled.'#13#13'Continue?') then
     EXIT;

  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.RecalcAllCenters( TRUE );
    Child.InvalidateSchedule;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.ByWorkCenter1Click(Sender: TObject);
begin
  {used in GVS and text}
  FSortFieldName:= 'eqno';
  ByWorkCenter1.Checked:= TRUE;
  Child.InvalidateSchedule;
end;

procedure TFrm_MainSched.ByWorkCenterDescription1Click(Sender: TObject);
begin
  {used in GVS and text}
  FSortFieldName:= 'cntr_desc';
  ByWorkCenterDescription1.Checked:= TRUE;
  Child.InvalidateSchedule;
end;

procedure TFrm_MainSched.WorkorderRoutingDiagram1Click(Sender: TObject);
var
  AJobshop_Rfq_ID: Real;
begin
  AJobshop_Rfq_ID:= 0;
  if DM.TblCntr_SchedSNDOP_DISPATCH_ID.asFLoat > 0 then
     AJobshop_Rfq_ID:= SelectValueFmtAsFloat('select jobshop_rfq_id from jobshop_task where sndop_dispatch_id = %f', [ DM.TblCntr_SchedSNDOP_DISPATCH_ID.asFLoat ]);
  (* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'ShowWO_RoutingDiagram'
  ShowWO_RoutingDiagram( self,                                                { RD_WO_Main.pas }
                         DM.TblCntr_SchedWORKORDER_ID.asFloat,
                         DM.QryPtOrderARINVT_ID.asFloat,
                         DM.TblCntr_SchedStandard_ID.asFloat,
                         AJobshop_Rfq_ID );*)
end;

procedure TFrm_MainSched.BOMTree1Click(Sender: TObject);
var
  APartsToGo: Real;
  APartLength: Real;
begin
  if Assigned(Child) then
  begin
    APartsToGo:= DM.QryPtOrderPARTS_TO_GO.asFloat;
    if DM.TblWork_CenterLookup_Mfgtype.asString = 'EXTRUSION' then  // translate to eaches
    begin
       APartLength:= SelectValueByID('ptwt', 'partno', DM.QryPtOrderPARTNO_ID.asFloat) / 12;
       if APartLength > 0 then
          APartsToGo:= APartsToGo / APartLength;
    end;

    Child.BOMTreeClick( APartsToGo );
  end
end;


procedure TFrm_MainSched.WorkOrderInfo2Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoOrderEntry2WorkOrderInfo'
  DoOrderEntry2WorkOrderInfo( self, DM.SrcPtOrder );}  {Oe_2_Wo.pas}
end;

function TFrm_MainSched.GetSnapToLastJob( AWork_Center_ID: Real ): Boolean;
var
  AValue: Boolean;
  ASnap_To_Last: Real;
  ASnap_To_Last_SystemDefault: Boolean;
begin
  // if IsWorkCenterLikeAssemblyLine( AWork_Center_ID ) then
  // begin
  //   Result:= FALSE;
  //   EXIT;
  // end;

  {work_center specific}
  ASnap_To_Last:= SelectValueByID( 'snap_to_last', 'work_center', AWork_Center_ID );

  if IsWorkCenterLikeAssemblyLine( AWork_Center_ID ) then
     ASnap_To_Last_SystemDefault:= SelectValueAsString('select assy1_snap_to_last from params') = 'Y'
  else
     ASnap_To_Last_SystemDefault:= SelectValueAsString('select sched_snap_to_last from params') = 'Y';

  Result:= ( ASnap_To_Last = 2)
           or
           ((ASnap_To_Last = 0) and ASnap_To_Last_SystemDefault);
end;


function TFrm_MainSched.ShouldApplyJIT( AWork_Center_ID: Real ): Boolean;
begin
  if IsWorkCenterLikeAssemblyLine( AWork_Center_ID ) then
  begin
    Result:= SelectValueFmtAsString('select sched_jit from work_center where id = %f', [ AWork_Center_ID ]) = 'Y';
    EXIT;
  end;

  case Trunc( SelectValueByID( 'snap_to_last', 'work_center', AWork_Center_ID )) of
    0: {System Default} Result:= SelectValueAsString('select sched_jit from params') = 'Y';
    1: {Do not snap}    Result:= SelectValueFmtAsString('select sched_jit from work_center where id = %f', [ AWork_Center_ID ]) = 'Y';
    2: {Snap}           Result:= FALSE;
  end;
end;


procedure TFrm_MainSched.SalesOrderLineNote1Click(Sender: TObject);
begin
  DoViewMemoStr(SelectValueFmtAsString( 'select comment1 from ord_detail where id = %f', [ DM.QryPtOrderORD_DETAIL_ID.asFloat ]),
                'Sales Order Line Note (Read Only)' );  {IQMS.Common.EditMemoStr.pas}
end;

procedure TFrm_MainSched.Reports1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedGVS'
  PrintGVS1.Enabled:= Assigned( Child ) and (Child is TSchedGVS);}
end;

procedure TFrm_MainSched.ReSequenceByMustStartDate1Click(Sender: TObject);
begin
  if IQConfirmYN( sched_rscstr.cTXT0000039 ) then  // 'About to re-sequence by must start date. Please confirm to continue.'
  begin
    ExecuteCommandFmt('begin sched_misc.resequence_by_must_start( %f ); end;', [ DM.TblWork_CenterID.asFloat ]);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_RefreshDataSets'
    PostMessage( self.Handle, iq_RefreshDataSets, 1, 0);}
  end;
end;

procedure TFrm_MainSched.PrintGVS1Click(Sender: TObject);
var
  AOldStartDateTime: TDateTime;
  AOldEndDateTime  : TDateTime;
  ANewStartDateTime: TDateTime;
  ANewEndDateTime  : TDateTime;
begin
  (* TODO -oBantuK -cWEB_CONVERT : Too many compile time error.
  if Assigned( Child ) and (Child is TSchedGVS) then with TSchedGVS( Child ).SchedOCX1 do
  begin
    AOldStartDateTime:= StrToDateTime(TSDateTimeBeg[ 0 ]);
    AOldEndDateTime  := StrToDateTime(TSDateTimeEnd[ 0 ]);
    ANewStartDateTime:= AOldStartDateTime;
    ANewEndDateTime  := AOldEndDateTime;

    if not IQDateRangeDlg.DoDateRangeDialog( self, ANewStartDateTime, ANewEndDateTime ) then
       EXIT;
    try
      PrintShowDialog:= True;
      TSDateTimeBeg[ 0 ]:= DateTimeToStr( ANewStartDateTime );
      TSDateTimeEnd[ 0 ]:= DateTimeToStr( ANewEndDateTime   );

      PrintChart:= 0; {!!}

    finally
      TSDateTimeBeg[ 0 ]:= DateTimeToStr( AOldStartDateTime );
      TSDateTimeEnd[ 0 ]:= DateTimeToStr( AOldEndDateTime   );
    end;
  end;
  *)
end;

procedure TFrm_MainSched.Configure1Click(Sender: TObject);
begin
  SnaptoLastJob.Enabled:= SR.Enabled['SnaptoLastJob']; //  and not IsWorkCenterLikeAssemblyLine( DM.TblWork_CenterID.asFloat );
  SnaptoLastJob.Checked:= GetSnapToLastJob( DM.TblWork_CenterID.asFloat );
end;

function TFrm_MainSched.GetProdStartTimeBasedOnJIT( AWork_Center_ID, AWorkorder_ID: Real ): TDateTime;
var
  ASafety_Lead_Time: Real;
begin
   if (AWorkorder_ID = 0) or not ShouldApplyJIT( AWork_Center_ID ) then
   begin
     Result:= 0;
     EXIT;
   end;

  {Lead Time}
  ASafety_Lead_Time:= SelectValueFmtAsFloat('select a.safety_lead_time from arcusto a, workorder w where w.id = %f and w.arcusto_id = a.id', [ AWorkorder_ID ]);
  if ASafety_Lead_Time = 0 then
     ASafety_Lead_Time:= SelectValueAsFloat('select safety_lead_time from params');

  {Must Start Time}
  Result:= SelectValueFmtAsFloat('select start_time from workorder where id = %f', [ AWorkorder_ID ]) - ASafety_Lead_Time;
end;


procedure TFrm_MainSched.RunsTheBest1Click(Sender: TObject);
begin
  if DM.TblCntr_SchedSNDOP_DISPATCH_ID.asFloat > 0 then
     PrepareShowSndRunsBest( DM.TblCntr_SchedSNDOP_DISPATCH_ID.asFloat )

  else if DM.TblCntr_SchedStandard_ID.asFloat > 0 then
     DoRunsTheBestEx( DM.TblCntr_SchedStandard_ID.asFloat ); {RunsBest.pas}
end;

procedure TFrm_MainSched.PrepareShowSndRunsBest( ASndop_Dispatch_ID: Real );
var
  ASndop_ID: Real;
begin
  ASndop_ID:= SelectValueByID('sndop_id', 'sndop_dispatch', ASndop_Dispatch_ID);
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSndRunsBest'
  TFrmSndRunsBest.DoShowModal( self, ASndop_ID );}   // snd_runs_best.pas
end;


procedure TFrm_MainSched.SetGVS_WOCaption(const Value: string);
begin
  FGVS_WOCaption:= Value;
  wwDBComboDlgWOCaption.Text:= FGVS_WOCaption;
end;

procedure TFrm_MainSched.wwDBComboDlgWOCaptionCustomDlg(Sender: TObject);
var
  ACaption: string;
begin
  ACaption:= GVS_WOCaption;
  (* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSchdDefineWOCaption'
  if TFrmSchdDefineWOCaption.DoShowModal( ACaption ) then {schd_def_wo_caption.pas}
  begin
     GVS_WOCaption:= ACaption;
     Child.InvalidateSchedule;
  end;
  *)
end;


procedure TFrm_MainSched.cboxGVSMatExceptionsChange(Sender: TObject);
begin
  Child.InvalidateSchedule;
  AssignLegendVisible;
end;

procedure TFrm_MainSched.cboxGVSMatExceptionsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    cboxGVSMatExceptions.ItemIndex:= -1;
    cboxGVSMatExceptionsChange( Sender );
    Key:= 0;
  end;
end;

procedure TFrm_MainSched.AssociatedToolingEquipment1Click(Sender: TObject);
begin
  Child.AssociatedToolingEquiment;
end;

procedure TFrm_MainSched.AssignLegendVisible;
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedText, TSchedGVS'
  if Assigned( Child ) then
     pnlLegend.Visible:= ( Child is TSchedText)
                         or
                         ((Child is TSchedGVS) and (Child.GVS_ShowExceptionIndex <> 3));
  }
end;


procedure TFrm_MainSched.WhiteboardCapacityPlan1Click(Sender: TObject);
begin
  TFrmCapWhiteboard.DoShow;  // cap_whiteboard.pas
end;

procedure TFrm_MainSched.LaborWhiteboardCapacityPlan1Click(
  Sender: TObject);
begin
  TFrmLabWhiteboard.DoShow; // lab_whiteboard.pas
end;

procedure TFrm_MainSched.ExistingLocks1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmExistingLocks'
  TFrmExistingLocks.DoShowModal( IQMS.Common.Locks.IQMS_IRV32 );}  {existing_locks.pas}
end;

procedure TFrm_MainSched.HardAllocatedToWO1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmWO_Alloc_Mat_Main'
  TFrmWO_Alloc_Mat_Main.DoShow( self, DM.TblCntr_SchedWORKORDER_ID.asFloat );}  // wo_alloc_mat_main.pas
end;

function TFrm_MainSched.IsASSY1: Boolean;
begin
  Result:= (DM.TblWork_CenterLookup_Mfgtype.asString = 'ASSY1') or (DM.TblWork_CenterLookup_Mfgtype.asString = 'ASSY2');
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
procedure TFrm_MainSched.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    0: // the grid loses focus and cannot regain it - weird
       if Assigned(Child) and TSchedText(Child).GridJobs.Visible and TSchedText(Child).DBGrid2.Visible then
       begin
          TSchedText(Child).DBGrid2.SetFocus;
          TSchedText(Child).GridJobs.SetFocus;
       end;
    1: if Assigned(Child) and (Child is TSchedGVS) then
          TSchedGVS(Child).AdjustMaterialTabsVisible(  Msg.LParam );
  end;
end;
}

procedure TFrm_MainSched.Timer1Timer(Sender: TObject);
begin
  if FDragDirection = 'UP' then
     DM.TblCntr_Sched.MoveBy(-1)

  else if FDragDirection = 'DOWN' then
     DM.TblCntr_Sched.MoveBy(1);
end;

procedure TFrm_MainSched.EnableDragTimer(AValue: Boolean; ADir: string);
begin
  FDragDirection:= ADir;
  Timer1.Enabled:= AValue;
end;

procedure TFrm_MainSched.pnlToolbarDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TIQdbGrid'
  if ((Source is TIQdbGrid) and ( TIQdbGrid(Source).Name = 'GridJobs' )) then
  begin
    EnableDragTimer( TRUE, 'UP' );
    Accept:= FALSE;
  end;}
end;

function TFrm_MainSched.IsWorkCenterLikeAssemblyLine( AWork_Center_ID: Real ): Boolean;
var
  S: string;
begin
  S:= SelectValueFmtAsString('select mfg.lookup_mfgtype(mfg_type) from work_center where id = %f', [ AWork_Center_ID ]);
  Result:= IQMS.Common.StringUtils.StrInList( S, ['ASSY1', 'ASSY2', 'ASSY3']);
end;

function TFrm_MainSched.Is_ASSY2_Workorder( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select assy1_misc.is_workorder_mfgtype_like( %f, ''ASSY2'') from dual', [ AWorkorder_ID ]) = 1;
end;

procedure TFrm_MainSched.CalcThisWorkCentersMSDBasedOnProdEndTime1Click(
  Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.RecalculateClickEx(Sender);
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.PrintLabels1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    Child.PrintLabels;
  finally
    DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TFrm_MainSched.WONote1Click(Sender: TObject);
var
  S: string;
begin
  if DM.QryPtOrderRELEASES_ID.asFloat = 0 then
     EXIT;

  S:= DM.QryPtOrderWO_NOTE.asString;

  if not SR.ReadWrite['QryPtOrderWO_NOTE'] then    {IQMS.Common.EditMemoStr.pas}
  begin
    DoViewMemoStr( S, 'View Workorder Note' );
    EXIT
  end;

  if DoEditMemoStr( S, DM.QryPtOrderWO_NOTE.Size, 'Edit Workorder Note' ) then
  begin
    ExecuteCommandFmt('update releases set wo_note = ''%s'' where id = %f', [ FixStr(S), DM.QryPtOrderRELEASES_ID.asFloat ]);
    RefreshDataSetByID( DM.QryPtOrder );
  end
end;

procedure TFrm_MainSched.JumpToRealTimeMonitoring1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoIQRT'
  if DM.TblWork_CenterID.asFloat > 0 then
     DoIQRT( DM.TblWork_CenterID.asFloat );}  // rt_main.pas
end;

procedure TFrm_MainSched.PriorityNote1Click(Sender: TObject);
var
  S: string;
begin
  if DM.TblCntr_SchedID.asFloat = 0 then
     EXIT;

  S:= SelectValueFmtAsString('select priority_note from cntr_sched where id = %f', [ DM.TblCntr_SchedID.asFloat ]);
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmRT_Priority_Note'
  if TFrmRT_Priority_Note.DoShowModal( self, S ) then  // rt_priority_note.pas
  begin
     ExecuteCommandFmt('update cntr_sched set priority_note = ''%s'' where id = %f', [ FixStr( S ), DM.TblCntr_SchedID.asFloat ]);
     DM.TblCntr_Sched.Refresh;
  end;}
end;

procedure TFrm_MainSched.PriorityNote2Click(Sender: TObject);
var
  S: string;
begin
  if DM.TblCntr_SchedID.asFloat = 0 then
     EXIT;

  S:= SelectValueFmtAsString('select priority_note2 from cntr_sched where id = %f', [ DM.TblCntr_SchedID.asFloat ]);
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmRT_Priority_Note2'
  if TFrmRT_Priority_Note2.DoShowModal( self, S ) then  // rt_priority_note2.pas
  begin
     ExecuteCommandFmt('update cntr_sched set priority_note2 = ''%s'' where id = %f', [ FixStr( S ), DM.TblCntr_SchedID.asFloat ]);
     DM.TblCntr_Sched.Refresh;
  end;}
end;

procedure TFrm_MainSched.JumpToInventoryLocationsTransactions1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_JumpToInvTransLocs'
  JumpDirect( iq_JumpToInvTransLocs, DM.QryPtOrderARINVT_ID.asInteger );}
end;

procedure TFrm_MainSched.JumpToMPSTimePhase1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoMPS_TimePhaseData'
  DoMPS_TimePhaseData( DM.QryPtOrderARINVT_ID.asFloat );}  { MPS_Time_Phase.pas }
end;

procedure TFrm_MainSched.GroupIDAssignments1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSchedWorkorderGroupID'
  TFrmSchedWorkorderGroupID.DoShow( self );}  // schd_wo_groupid.pas
end;

procedure TFrm_MainSched.NetChangeSchedule1Click(Sender: TObject);
begin
  IncrementIRV32Semaphore( IQIrv32LockHandle ); {Shared mode}
  try
    NetChangeShell;
  finally
    DecrementIRV32Semaphore( IQIrv32LockHandle );
  end;
end;

class procedure TFrm_MainSched.NetChangeShell;
var
  OK: Boolean;
  ALockHandle: string;
  HMsg: TPanelMesg;

  procedure _begin_run;
  var
    ALockName: string;
  begin
    ALockName:= Format('%s-%.0f', [ IQMS_IRV32, SecurityManager.EPlant_ID_AsFloat ]);
    IncrementIRV32Semaphore( ALockHandle, ALockName, IQLOCK_EXCLUSIVE );
    ExecuteCommand('begin dd.set_disable_check_mandatory(1); end;'); // disable user defined triggers to check mandatory cols);
  end;

  procedure _finish_run;
  begin
    ExecuteCommand('begin dd.set_disable_check_mandatory(0); end;'); // enable user defined triggers to check mandatory cols
    DecrementIRV32Semaphore( ALockHandle );
  end;

begin
  OK:= not SecurityManager.EPlantsExist or (SecurityManager.EPlant_ID <> 'NULL');
  IQAssert( OK, sched_rscstr.cTXT0000041 ); // 'You must be associated with an existing EPlant in order to proceed - operation aborted.';

  if not IQConfirmYN(sched_rscstr.cTXT0000042) then // 'Are you sure you want to run Net Change Schedule?';
     EXIT;

  _begin_run;
  try
    HMsg:= hPleaseWait();
    try
      ExecuteCommandFmt('begin irv32_net.do_irv32_net_change( %f ); end;', [  SecurityManager.EPlant_ID_AsFloat ]);
    finally
      HMsg.Free;
    end;
  finally
    _finish_run;
  end;

  IQInformation( sched_rscstr.cTXT0000043 ); // 'Finished running Net Change Schedule';
end;


procedure TFrm_MainSched.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  AFocusControl: TControl;
begin
  if (Key = VK_F1) and (Shift = []) then
  begin
    AFocusControl := ActiveControl;
    if not Assigned(AFocusControl) or Assigned(AFocusControl) and
      (AFocusControl.HelpContext <= 0) then
    begin
      PostMessage(Handle, wm_Command, Contents1.Command, 0); { Call "Contents" }
      Key:= 0;
    end;
  end;
end;


end.
