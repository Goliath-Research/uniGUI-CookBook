unit SchdHidn;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  SchdAdd,
  Data.DB,
  Vcl.Menus,
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
  uniImageList,
  uniGUIClasses,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu;

type
  TJobState = (jsNone, jsLate, jsOnTime, jsScheduledDown, jsMaybeOnTime,
               jsLateForecast, jsOnTimeForecast );

  TUpdateProgressPanelProcedure = procedure( S: string ) of object;

  TMoveCargo = class
    Cntr_Sched_ID      : Real;
    Curr_Work_Center_ID: Real;
    Curr_Seq           : Real;
    New_WorkCenter_ID  : Real;
    New_Seq            : Real;
    constructor Create( ACntr_Sched_ID, ACurr_Work_Center_ID, ACurr_Seq, ANew_WorkCenter_ID, ANew_Seq: Real );
  end;

  TSchdHidden = class(TUniForm)
    pnlCarrier: TUniPanel;
    TextStatus: TUniStatusBar;
    procEnd_Date: TFDStoredProc;
    ImageListLastExec: TUniImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TStatusPanel'
    procedure TextStatusDrawPanel(StatusBar: TUniStatusBar;
      Panel: TStatusPanel; const Rect: TRect);}
  private
    { Private declarations }
    function GetJobState: TJobState;
    procedure CheckUpdateProdStartTimeBasedOnJIT(AWork_Center_ID, AWorkorder_ID, ACntr_Sched_ID: Real);
    function GetGVS_WOCaption: string;
    function GetGVS_ShowExceptionIndex: Integer;
    procedure CheckShowScheduleInfo(AWorkOrder_ID: Real);
    procedure RefreshAssyTrack;
    procedure CheckCloseJobsDlg;
    procedure CheckCloseSchedAddAssy1;
    function GetGVS_IsViewKindSetup: Boolean;
    procedure CheckUndoForceStartSource_A(ACntr_Sched_ID: Real);
    procedure CalculateLabelsCountBasedOnWorkorderQty(Sender: TObject; var ACount: Integer );
    function GetSwitchCheckMRO: Boolean;
    procedure CheckOpenMRO( AWorkorder_ID: Real );
    procedure CheckAdjustSetupHrs(var ASetupHrs: Real; AWorkorder_ID: Real);

  protected
    //JobsDlg  : TSchedAddJob;
    ZoomCount: Integer;
    MaxZoom  : Integer;
    procedure LocateWorkCenter( nID:Real );
    procedure AssignMasterSource; virtual;
    procedure CheckToolConflict( ACenterID, ASeq, AWorkOrdID, AHrs: Real );
    procedure Get_Start_End_Times_For_New_Job( ACenterID, ASeq: Real; var AStartTime, AEndTime: TDateTime; AHrs: Real );
    procedure AdjustShowWorkorderDetails; virtual;
  public
    { Public declarations }
    property JobState: TJobState read GetJobState;
    property GVS_WOCaption: string read GetGVS_WOCaption;
    property GVS_ShowExceptionIndex: Integer read GetGVS_ShowExceptionIndex;
    property GVS_IsViewKindSetup: Boolean read GetGVS_IsViewKindSetup;

    {Clicking...}
    procedure PickCenter(Sender:TObject); virtual;
    procedure InsertJobClick(Sender: TObject);  virtual;
    procedure AddDownTimeClick(Sender: TObject);  virtual;
    procedure EditCurrentJobClick(Sender: TObject); virtual;
    procedure MoveJobClick(Sender: TObject); virtual;
    procedure RemoveJobClick(Sender: TObject); virtual;
    procedure RecalculateClick(Sender:TObject); virtual;
    procedure RecalculateClickEx(Sender:TObject);
    procedure SetupNextClick(Sender:TObject);
    procedure PrintClick(Sender:TObject);
    procedure ResetTimeLineClick(Sender:TObject); virtual; abstract;
    procedure SetViewChange(Sender: TObject); virtual; abstract;
    procedure ZoomOutClick(Sender: TObject); virtual; abstract;
    procedure ZoomInClick(Sender: TObject); virtual; abstract;
    procedure ShowDetailsClick(Sender: TObject); virtual; abstract;
    procedure SchedulingWindow( Sender: TObject );
    procedure BOMTreeClick( AQty: Real ); virtual;
    procedure AssociatedToolingEquiment; virtual;
    procedure WorkorderMaterialExceptions; virtual;
    procedure PrintLabels;

    {The Real stuff}
    function AddJob( nCenterID         : Real;
                     nWorkOrdID        : Real;
                     nSeq              : Integer;
                     nProdHrs          : Real;
                     nSetupHrs         : Real;
                     IsDown            : Integer;
                     const cDownReason : string;
                     WithRefresh       : Boolean;
                     APMWo_ID          : Real;
                     ASndop_Dispatch_ID: Real = 0 ): Real; virtual;
    procedure MoveJob(nSchedID, CurrentCenterID, NewCenterID, CurrentSeq, NewSeq:Real ); virtual;
    function MoveJobEx( nSchedID, CurrentCenterID, NewCenterID, CurrentSeq, NewSeq:Real ): Real;
    procedure RemoveJob( nSchedID, CurrentCenterID:Real );

    { Seq, Start-End Times }
    procedure CheckCenterStartEnd( nCntrID:Real; ForceRecalc: Boolean; ARecalcMustStart: Boolean = FALSE );
    procedure RecalcOneCenter( nCntrID, nSchedID, nSeq:Real; ShowProgress: TUpdateProgressPanelProcedure; ARefreshAssyTrack: Boolean = TRUE );

    { SetUps}
    procedure Setup_Shell( nCntrID: Real );
    procedure DoSetup( nCntrID, nNext_Sched_ID: Real; DeleteCurrent:Boolean );
    procedure DoCloseSetup( nCntrID : Real );
    procedure Non_RT_Setup( nCntrID, nNext_Sched_ID: Real; DeleteCurrent:Boolean );

    {Misc}
    procedure InvalidateSchedule; virtual;
    procedure ConfirmRemove;
    procedure ConfirmNewSetup( nSeq, nCenterID, nWorkOrdID, ASndop_Dispatch_ID: Real );
    function BringToFrontJobsDlg:Boolean;
    procedure SetToolBarMenu; virtual;
    function Mach_Down( nCntrID: Real ):Boolean;
    function JobsCount( nCntrID:Real ):Real;
    function NeedsRecalc( nCntrID : Real ):Boolean;
    procedure CheckEmptySet( DataSet:TDataSet ); overload; virtual;
    procedure CheckEmptySet( ARecordsFound:Boolean ); overload; virtual;
    procedure RefreshAddJobQuery( InclSched: Boolean );
    function IncludeWorkorder( AWorkOrder_ID: string ): Boolean; virtual;

    {Validation}
    procedure Cntr_SchedDataChange(Sender: TObject; Field: TField); virtual;
    procedure CheckToggleCenterActive( AWork_Center_ID: Real );

    {OCX}
    procedure ChangeScale; virtual;
    procedure ChangeColors; virtual;

    {Text}
    procedure Work_CenterDataChange(Sender: TObject; Field: TField); virtual;
    procedure RecalcAllCenters( ForceRecalc: Boolean );
    procedure AssignLabels; virtual;
    procedure SaveLabels; virtual;
    procedure RestoreFromRegistry; virtual;
    procedure SaveToRegistry; virtual;

    procedure RecalcWorkorderMustStart(AWork_Center_ID: Real);
    procedure UpdateProgressPanel( s:string );

    class procedure CheckWorkOrderOnRunHold(AWorkorder_ID: Real);
    class function GetJobStateEx( ADataset: TDataSet ): TJobState;
  end;

implementation

{$R *.DFM}

uses
  { TODO -oBantuK -cWEB_CONVERT : Files are yet to be converted to UniGUI
  AssyTrack_Main,
  BOM_Tree,
  EdDownPM,
  EdiConfDel,
  EditDown,}
  IQMS.Common.EditMemoStr,
  IQMS.Common.EmbeddedWebIISForm,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  //WEB_CONVERT IQLMRT,
  IQMS.PrintLabels.LMShare,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Proc,
  IQMS.Common.StringUtils,
  //WEB_CONVERT IQMS.Common.UserMessages,
  IRV_Main,
  MatXcpWO,
  IQMS.Common.MfgShare,
  //WEB_CONVERT pm_bom_pmeqmt_prompt,
  //WEB_CONVERT RT_Share,
  RTTypes,
  Schd_DM,
  Schdcolr,
  {WEB_CONVERT
  SchdDown,
  Schdedit,
  SchdGVS,
  SchdGVSWin,
  SchdMove,
  SchdNegConsumption,
  SchdNext,
  SchdPara,
  SchdPmeqmt,
  SchdRunsBestChk,
  SchdSameToolJobs,
  Schdscal,}
  //WEB_CONVERT SchdText,
  SchdTool,
  Sched_Mn,
  sched_rscstr,
  //WEB_CONVERT sched_sec_conf_sched_info,
  //WEB_CONVERT SchedAddAssy1,
  //WEB_CONVERT secured_confirm_sched_run_hold,
  System.UITypes,
  System.Variants,
  //WEB_CONVERT wo_conf_del,
  //WEB_CONVERT wo_conf_del_sched,
  //WEB_CONVERT wo_dm,
  AssyTrack_Const;

const DEL_JOB_FROM_SCHED = TRUE;


{ TMoveCargo }
constructor TMoveCargo .Create( ACntr_Sched_ID, ACurr_Work_Center_ID, ACurr_Seq, ANew_WorkCenter_ID, ANew_Seq: Real );
begin

end;


{ TSchdHidden }

procedure TSchdHidden.FormCreate(Sender: TObject);
begin
  pnlCarrier.Parent:= TFrm_MainSched(Owner).pnlSchedArea;
  SetToolBarMenu;
  AssignMasterSource;
  UpdateProgressPanel( TFrmIRV32.GetLastRecalcDateAsStringEx() );  // IRV_Main.pas
end;

procedure TSchdHidden.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  pnlCarrier.Parent:= self;
  Action:= caFree;
end;

procedure TSchdHidden.SetToolBarMenu;
var
  IsGVS: Boolean;
  IsSchedWin:Boolean;
  I    : Integer;

  function IsVisible( ATag : Integer; AVisible: Boolean ): Boolean;
  begin
    case ATag of
      1: Result:= not IsGVS;         {Text mode              }
      2: Result:= IsGVS;             {SchedGVS or SchedGVSWin}
      3: Result:= not IsSchedWin;    {Not SchedGVSWin        }
      4: Result:= IsSchedWin;        {Only SchedGVSWin       }
    else
      Result:= AVisible;
    end;
  end;

  procedure SetMenuVisible( AMenuItem: TUniMenuItem );
  var
    I:Integer;
    MakeVisible:Boolean;
  begin
    for I:= 0 to AMenuItem.Count - 1 do with AMenuItem.Items[ I ] do
      Visible:= IsVisible( Tag, Visible );

    MakeVisible:= FALSE;
    for I:= 0 to AMenuItem.Count - 1 do with AMenuItem.Items[ I ] do
      if Visible then
      begin
         MakeVisible:= TRUE;
         System.BREAK;
      end;
    AMenuItem.Visible:= MakeVisible;
  end;

begin
  { TODO -oBantuK -cWEB_CONVERT :
      Undeclared identifier: 'TSchedGVS'
      Undeclared identifier: 'TSchedGVSWin'
  IsGVS     := self is TSchedGVS;
  IsSchedWin:= self is TSchedGVSWin;}
  with TFrm_MainSched(Owner) do
  begin
    {ToolBar}
    for I:= 0 to pnlToolBar.ControlCount - 1 do with pnlToolBar.Controls[ I ] do
      Visible:= IsVisible( Tag, Visible );

    {MainMenu}
    for I:= 0 to MainMenu1.Items.Count - 1 do
      SetMenuVisible( MainMenu1.Items[ I ] );

    {PopupMenu}
    for i:= 0 to PopUpMenu1.Items.Count - 1 do with PopUpMenu1.Items[ I ] do
      Enabled:= IsVisible( Tag, Visible ) and SR.Enabled[ Name ];
  end;
end;

procedure TSchdHidden.AssignMasterSource;
var
  S: string;
begin
  {in the Text view MasterSource is SrcCntr_Sched. In the graphic view - we use SetRange}
  //with TFrm_MainSched(Owner).DM, TblPtOrder do
  // begin
  //    MasterSource:= SrcCntr_Sched;
  //    MasterFields:= 'WORKORDER_ID';
  //end;

  with TFrm_MainSched(Owner).DM, TblCntr_Sched do
  begin
    MasterSource:= SrcWork_Center;
    MasterFields:= 'ID';
  end;

  {in the Text view MasterSource is SrcCntr_Sched. In the graphic view - we use manually assigned workordr_id param}
  with TFrm_MainSched(Owner).DM, QryPtOrder do
  if DataSource <> SrcCntr_Sched then
  begin
    Close;

    {Delphi didn't react on DataSource reassignment after coming from GVS. Here we reset the SQL}
    S:= SQL.Text;
    SQL.Clear;
    SQL.Text:= S;

    DataSource:= SrcCntr_Sched;
    Open;
  end;
end;

procedure TSchdHidden.ChangeColors;
var
  I:Integer;
begin
  { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TFrm_Colors'
  for i:= 0 to Screen.FormCount - 1 do
    if Screen.Forms[ i ] is TFrm_Colors then
    begin
       Screen.Forms[ i ].BringToFront;
       EXIT;
    end;
  TFrm_Colors.Create(Owner).Show;}
end;

procedure TSchdHidden.ChangeScale;
var
  I:Integer;
begin
  { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TFrm_Colors'
  for i:= 0 to Screen.FormCount - 1 do
    if Screen.Forms[ i ] is TFrm_Scale then
    begin
       Screen.Forms[ i ].BringToFront;
       EXIT;
    end;

  TFrm_Scale.Create(Owner).Show;}
end;

procedure TSchdHidden.LocateWorkCenter( nID:Real );
var
  SaveIndexFieldName:string;
  Bk:TBookMark;
begin
  with TFrm_MainSched(Owner).DM.TblWork_Center do
    Locate('id', nID, []);

  // with TFrm_MainSched(Owner).DM.TblWork_Center do
  // try
  //   SaveIndexFieldName:= IndexFieldNames;
  //   DisableControls;
  //   IndexFieldNames:= 'ID';
  //   If FindKey( [nID] ) then
  //      Bk:= GetBookMark;
  // finally
  //   Close;
  //   IndexFieldNames:= SaveIndexFieldName;
  //   Open;
  //
  //   if Assigned(Bk) then begin
  //     GotoBookMark(Bk);
  //     FreeBookMark(Bk);
  //   end;
  //   EnableControls;
  // end;
end;

function TSchdHidden.BringToFrontJobsDlg:Boolean;
var
  i:integer;
begin
  Result:= FALSE;
  { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TSchedAddJob'
  for i:= 0 to Screen.FormCount - 1 do
    if Screen.Forms[i] is TSchedAddJob then begin
       result:= TRUE;
       TSchedAddJob( Screen.Forms[i] ).BringToFront;
       BREAK
    end;
  }
end;

function TSchdHidden.GetJobState: TJobState;
begin
  Result:= TSchdHidden.GetJobStateEx( TFrm_MainSched(Owner).DM.TblCntr_Sched );
end;

procedure TSchdHidden.InsertJobClick(Sender: TObject);
begin
  {ASSY1}
  with TFrm_MainSched(Owner) do
    if IsAssy1 then
    begin
       // TFrmSchedAddAssy1.DoShowModal( self.Owner, DM.TblWork_CenterID.asFloat, RTFilter );         {SchedAddAssy1.pas}
       { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TFrmSchedAddAssy1'
       TFrmSchedAddAssy1.DoShow( self.Owner, DM.TblWork_CenterID.asFloat, RTFilter );}         {SchedAddAssy1.pas}
       EXIT;
    end;

  {Normal workorders}
  if BringToFrontJobsDlg then
    EXIT;

  CheckCloseJobsDlg;

  JobsDlg:= TSchedAddJob.Create(Owner);

  with TFrm_MainSched(Owner).DM do
  begin
    JobsDlg.SetCurrentCenterInfo(TblWork_Center);                                   {Update EqNo, CntrType, CntrID}
    JobsDlg.ePos.Text:= IntToStr( iMax( 1, TblCntr_Sched.FieldByName('CNTR_SEQ').asInteger )); {Current Seq}
  end;
  JobsDlg.Show;
end;


procedure TSchdHidden.CheckCloseJobsDlg;
begin
  if Assigned( JobsDlg ) then
  try
     JobsDlg.Close;
  finally
     JobsDlg:= NIL;
  end;
end;

procedure TSchdHidden.CheckCloseSchedAddAssy1;
var
  AForm: TUniForm;
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSchedAddAssy1'
  AForm:= IQMS.Common.Controls.FindFormByClassType( TFrmSchedAddAssy1 );}
  if AForm <> nil then
     AForm.Close;
end;

procedure TSchdHidden.EditCurrentJobClick(Sender: TObject);
{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TEditDlg'
var
  o: TEditDlg;}
begin
  if TFrm_MainSched(Owner).DM.TblCntr_Sched.EOF then
     // 'To edit a job please schedule one first'
     raise Exception.Create(sched_rscstr.cTXT0000015);
  (* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TEditDlg'
  with TFrm_MainSched(Owner).DM do
  try
    if TblCntr_SchedDOWN_IDLE.asInteger = 0 then
       o:= TEditDlg.Create(Owner)
    else if TblCntr_SchedDOWN_IDLE.asInteger = 2 then
       o:= TEditDownTimePM.Create(Owner)  {EdDownPM}
    else
       o:= TEditDownTime.Create(Owner);

    o.ShowModal;
  finally
    if Assigned(o) then o.Free;
  end;
  *)
end;

procedure TSchdHidden.AddDownTimeClick(Sender: TObject);
begin
  (* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TAddDownTime'
  with TAddDownTime.Create(Owner) do
  try
    with TFrm_MainSched(Owner).DM do begin
      CurrentEqNo     := TblWork_Center['EQNO'];
      CurrentCntr_Type:= TblWork_Center['CNTR_TYPE'];
      CurrentCntr_ID  := TblWork_Center['ID'];
      ePos.Text       := IntToStr( iMax( 1, TblCntr_Sched.FieldByName('CNTR_SEQ').asInteger )); {Current Seq}
    end;
    ShowModal;
  finally
    Free;
  end;
  *)
end;

procedure TSchdHidden.MoveJobClick(Sender: TObject);
var
  { TODO : Undeclared identifier: 'TSchdMoveDlg'
  o: TSchdMoveDlg;}
  ANewSeq     : Real;
  ANewCenterID: Real;
  AList       : TStringList;
  SchdMoveDlgModalResult: integer;

  // ---------------------------------------------------------------------------
  procedure _LoadMovingJobs;
  var I: Integer;
  begin
    AList.Clear;
    with TFrm_MainSched( Owner ).DM do
    try
      TblCntr_Sched.DisableControls;
      { TODO : Undeclared identifier: 'TSchdMoveDlg'
      for I:= 0 to o.wwDBGridMoveJobs.SelectedList.Count - 1 do
      begin
        TblCntr_Sched.GotoBookmark( o.wwDBGridMoveJobs.SelectedList.Items[ I ]);
        AList.Add( TblCntr_Sched.FieldByName('ID').asString );
      end;}
    finally
      TblCntr_Sched.EnableControls;
    end;
  end;

  // ---------------------------------------------------------------------------
  procedure _MoveJobs;
  var
    I: Integer;
  begin
    with TFrm_MainSched( Owner ).DM do
    begin
      for I:= 0 to AList.Count - 1 do
      begin
        if TblCntr_Sched.Locate( 'ID', StrToFloat(AList[ I ]), []) then
           MoveJob( TblCntr_Sched['ID'], TblWork_Center['ID'], ANewCenterID, TblCntr_Sched['CNTR_SEQ'], ANewSeq );
        ANewSeq:= ANewSeq + 1;
        TblCntr_Sched.Refresh;
        Application.ProcessMessages;
      end;

      Reopen( QryV_Sched );
      TblCntr_Sched.Refresh;
    end;
  end;

  // ---------------------------------------------------------------------------
  procedure _DeleteJobs;
  var
    I: Integer;
  begin
    with TFrm_MainSched(self.Owner) do IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
    try
      for I:= 0 to AList.Count - 1 do
        with TFrm_MainSched(Owner).DM.TblCntr_Sched do
        begin
           if Locate( 'ID', StrToFloat(AList[ I ]), []) then
           begin
             RemoveJob( FieldByName('ID').asFloat, FieldByName('WORK_CENTER_ID').asFloat );
             Refresh;
           end;
        end;
      Reopen( TFrm_MainSched(self.Owner).DM.QryV_Sched );
    finally
      with TFrm_MainSched(self.Owner) do DecrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
    end;
  end;


begin
  if TFrm_MainSched(Owner).DM.TblCntr_Sched.EOF and TFrm_MainSched(Owner).DM.TblCntr_Sched.BOF then
     raise Exception.Create('Nothing is Scheduled - Unable to Move Work Orders');

  AList:= TStringList.Create;          {List of moving jobs}
  try
    (* TODO : Undeclared identifier: 'TSchdMoveDlg'

    with TFrm_MainSched( Owner ).DM do
    try
      o:= TSchdMoveDlg.Create( Owner );
      o.CurrentEqNo := TblWork_Center['EQNO'];
      o.CurrentSeq  := TblCntr_Sched['CNTR_SEQ'];
      o.CurrentDesc := TblWork_CenterCNTR_DESC.asString;
      o.Sndop_Dispatch_ID:= TblCntr_Sched.FieldByName('SNDOP_DISPATCH_ID').asFloat;

      if not o.ShowModal = mrOK then
         EXIT;

      _LoadMovingJobs;          {local}
      ANewSeq     := o.NewSeq;
      ANewCenterID:= o.NewCenterID;

      if o.MoveType = mtMove then
         _MoveJobs
      else if o.MoveType = mtDelete then
         _DeleteJobs;

    finally
      o.Free;
    end;
    *)
  finally
    AList.Free;
  end;
end;

procedure TSchdHidden.RemoveJobClick(Sender: TObject);
begin
  with TFrm_MainSched(self.Owner) do IncrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  try
    try
      ConfirmRemove;
    finally
      Screen.Cursor:= crDefault;
    end;

    with TFrm_MainSched(Owner).DM.TblCntr_Sched do
    begin
       RemoveJob( FieldByName('ID').asFloat, FieldByName('WORK_CENTER_ID').asFloat );
       Reopen( TFrm_MainSched(self.Owner).DM.QryV_Sched );
       Refresh;
    end;

  finally
    with TFrm_MainSched(self.Owner) do DecrementIRV32Semaphore(IQIrv32LockHandle);                               {Shared mode}
  end;
end;

procedure TSchdHidden.RestoreFromRegistry;
begin
end;

procedure TSchdHidden.RecalculateClick(Sender:TObject);
begin
  with TFrm_MainSched(Owner).DM.TblWork_Center do
     CheckCenterStartEnd( FieldByName('ID').asFloat, TRUE, FALSE );
end;

procedure TSchdHidden.RecalculateClickEx(Sender:TObject);
begin
  // same as RecalculateClick but with recalc of Must Start Date
  with TFrm_MainSched(Owner).DM.TblWork_Center do
     CheckCenterStartEnd( FieldByName('ID').asFloat, TRUE, TRUE );
end;

procedure TSchdHidden.RecalcAllCenters( ForceRecalc: Boolean );
var
  nCntrID : Real;
begin
  with TFDQuery.Create(Owner) do
  try
    Connection:= UniMainModule.FDConnection1;
    if ForceRecalc then
       SQL.Add('select ID from work_center')
    else
       SQL.Add(Format('  select cntr_sched.work_center_id                                           '+
                      '  from                                                                       '+
                      '       cntr_sched, work_center                                               '+
                      ' where                                                                       '+
                      '       cntr_sched.cntr_seq = 1                                               '+
                      '   and cntr_sched.work_center_id = work_center.id                            '+
                      '   and (                                                                     '+
                      '         to_date(''%s'', ''mm/dd/yyyy'') > Trunc(cntr_sched.prod_start_time) '+   {date changed}
                      '       OR                                                                    '+
                      '         work_center.is_rt = ''Y'' and                                       '+   {or 15 mins passed and center is RT}
                      '         to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') - cntr_sched.prod_start_time >= 15 / (24 * 60))',
                      [ FormatDateTime( 'mm/dd/yyyy', Now ),
                        FormatDateTime( 'mm/dd/yyyy hh:nn:ss', Now )]));
    Open;

    if Eof then EXIT;

    while not Eof do
    begin
      nCntrID:= Fields[ 0 ].asFloat;

      // if ForceRecalc or NeedsRecalc( nCntrID ) then
      RecalcOneCenter( nCntrID, 0{new sched_id}, 0{new seq}, UpdateProgressPanel );

      Next;
    end;

    Calc_Must_Start_Of_All_Depend; { IQMS.Common.Proc.pas }

    TFrm_MainSched(self.Owner).DM.TblWorkOrder.Refresh;
  finally
    Free;
  end;

  RefreshAssyTrack;
end;

procedure TSchdHidden.SetupNextClick(Sender:TObject);
begin
  try
    Setup_Shell( TFrm_MainSched(Owner).DM.TblWork_CenterID.asFloat );
  finally
    TFrm_MainSched(Owner).DM.TblCntr_Sched.Refresh;
  end;
end;

procedure TSchdHidden.PrintClick(Sender:TObject);
begin
  TFrm_MainSched(Owner).IQRepDef1.Execute;
end;

procedure TSchdHidden.ConfirmRemove;
var
  s:string;
begin
  with TFrm_MainSched(Owner).DM.TblCntr_sched do
  begin
    if Bof and Eof then
       // 'No jobs have been scheduled.  There is nothing to remove.'
       raise Exception.Create(sched_rscstr.cTXT0000016)

    else
       if FieldByName('sndop_dispatch_id').asFloat > 0 then
          // 'Remove Process # %s, WO # %.0f, MFG # %s from the schedule?'
          s:= Format(sched_rscstr.cTXT0000017,
                             [FieldByName('opno').asString,
                              FieldByName('WORKORDER_ID').asFloat,
                              FieldByName('JobMfgNo').asString ])

       else if FieldByName('WORKORDER_ID').asFloat > 0 then
          // 'Remove WO # %.0f, MFG # %s (%d) from the schedule?'
          s:= Format(sched_rscstr.cTXT0000018,
                             [FieldByName('WORKORDER_ID').asFloat,
                              FieldByName('JobMfgNo').asString,
                              FieldByName('BUCKET').asInteger])
       else
          // 'Remove WO # %s, sequence # %d, from the schedule?'
          s:= Format(sched_rscstr.cTXT0000019,
                             [FieldByName('JobMfgNo').asString,
                              FieldByName('CNTR_SEQ').asInteger]);

    { TODO -oBantuK -cWEB_CONVERT : There is no overloaded version of
     'MessageDlg' that can be called with these arguments
    if MessageDlg(s, mtWarning, [mbYes, mbCancel],0) = mrCancel then
       ABORT;}
  end;
end;

procedure TSchdHidden.ConfirmNewSetup( nSeq, nCenterID, nWorkOrdID, ASndop_Dispatch_ID: Real );
var
  S: string;
begin
  if nSeq = 1 then
  begin
    if ASndop_Dispatch_ID > 0 then
       // 'Set up process # %s, WO # %.0f, on work center %s?'
       S:= Format(sched_rscstr.cTXT0000020,
                  [SelectValueFmtAsString('select rtrim(opno) from sndop s, sndop_dispatch d where d.id = %f and d.sndop_id = s.id', [ ASndop_Dispatch_ID ]),
                   nWorkOrdID,
                   SelectValueFmtAsString('select eqno from work_center where id = %f', [ nCenterID ]) ])

    else if nWorkOrdID > 0 then
       // 'Set up WO # %.0f on work center %s?'
       S:= Format(sched_rscstr.cTXT0000021,
                  [nWorkOrdID, SelectValueFmtAsString('select eqno from work_center where id = %f', [ nCenterID ]) ])
    else
       // 'Set up next job on work center %s?'
       S:= Format(sched_rscstr.cTXT0000022,
         [ SelectValueFmtAsString('select eqno from work_center where id = %f', [ nCenterID ]) ]);

    if not IQConfirmYNWithSecurity( S, 'ScheduleConfirmNewSetup', False ) then
       ABORT;

     CheckWorkOrderOnRunHold( nWorkOrdID );

     CheckOpenMRO( nWorkOrdID );
  end;
end;

function TSchdHidden.AddJob( nCenterID         : Real;
                             nWorkOrdID        : Real;
                             nSeq              : Integer;
                             nProdHrs          : Real;
                             nSetupHrs         : Real;
                             IsDown            : Integer;
                             const cDownReason : string;
                             WithRefresh       : Boolean;
                             APMWo_ID          : Real;
                             ASndop_Dispatch_ID: Real = 0 ): Real;
var
  Bk  : TBookMark;
  nTmp: Integer;
  ADataSetNotifyEvent: TDataSetNotifyEvent;
begin
  with TFrm_MainSched(self.Owner) do IncrementIRV32Semaphore(IQIrv32LockHandle);   {Shared mode}
  try
     nTmp:= Trunc( JobsCount( nCenterID ) );
     if (nSeq <= 0) or (nSeq > nTmp) then
        nSeq:= nTmp + 1;

     ConfirmNewSetup( nSeq, nCenterID, nWorkOrdID, ASndop_Dispatch_ID );

     CheckToolConflict( nCenterID, nSeq, nWorkOrdID, nProdHrs+nSetupHrs );

     { TODO : Undeclared identifier: 'CheckWorkCenterInRunsTheBest'
     CheckWorkCenterInRunsTheBest( nCenterID, nWorkOrdID, ASndop_Dispatch_ID );}                      {SchdRunsBestChk.pas}

     CheckToggleCenterActive( nCenterID );

     CheckShowScheduleInfo( nWorkOrdID );  {this unit}

     if nSeq > 1 then
        CheckOpenMRO( nWorkOrdID );

     CheckAdjustSetupHrs( nSetupHrs, nWorkOrdID );

     with TFrm_MainSched(Owner).DM do
     try
        try
          TblCntr_Sched.DisableControls;
          Result:= GetNextID('CNTR_SCHED');

          ExecuteCommandFmt( 'insert into cntr_sched         '+
                     '          ( id,                '+
                     '            work_center_id,    '+
                     '            workorder_id,      '+
                     '            pmwo_id,           '+
                     '            cntr_seq,          '+
                     '            prodhrs,           '+
                     '            setuphrs,          '+
                     '            down_idle,         '+
                     '            force_reason,      '+
                     '            force_source,      '+
                     '            sndop_dispatch_id) '+
                     '    values (%f,                '+  // Result
                     '            %f,                '+  // nCenterID
                     '            %s,                '+  // nWorkOrdID
                     '            %s,                '+  // APMWo_ID
                     '            %d,                '+  // nSeq;
                     '            %.6f,              '+  // nProdHrs;
                     '            %f,                '+  // nSetupHrs;
                     '            %d,                '+  // IsDown;
                     '            ''%s'',            '+  // cDownReason;
                     '            ''%s'',            '+  // Force Source = ' '
                     '            %s)                ',  // Sndop_Dispatch_ID
                    [ Result,
                      nCenterID,
                      IIf( nWorkOrdID = 0, 'NULL', FloatToStr( nWorkOrdID )),
                      IIf( APMWo_ID = 0, 'NULL', FloatToStr( APMWo_ID )),
                      nSeq,
                      nProdHrs,
                      nSetupHrs,
                      IsDown,
                      cDownReason,
                      ' ',
                      IIf( ASndop_Dispatch_ID = 0, 'NULL', FloatToStr(ASndop_Dispatch_ID)) ]);

          CheckUpdateProdStartTimeBasedOnJIT( nCenterID, nWorkOrdID, Result ); {this unit}

          if nSeq = 1 then
             DoSetup( nCenterID, Result, not DEL_JOB_FROM_SCHED )
          else
             RecalcOneCenter( nCenterID, Result, nSeq, UpdateProgressPanel );

          if WithRefresh then
          begin
            BringToFrontJobsDlg;
            RefreshAddJobQuery( TRUE );
          end;
        except
          if Result > 0 then
             ExecuteCommandFmt('delete cntr_sched where id = %f', [ Result ]);
          raise;
        end;

        { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
        PostMessage( Handle, iq_Notify, 0, 0);}  {this is for GVSWin so we can update the treeview }
     finally
       TblCntr_Sched.EnableControls;
       if WithRefresh then
       begin
          Reopen(QryV_Sched);
          TblCntr_Sched.Refresh;
          TblCntr_Sched.Locate('ID', Result, []);
       end
     end;
  finally
    with TFrm_MainSched(self.Owner) do DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;
end;

procedure TSchdHidden.CheckToolConflict( ACenterID, ASeq, AWorkOrdID, AHrs: Real );
var
  AStartTime, AEndTime: TDateTime;
begin
  Get_Start_End_Times_For_New_Job( ACenterID, ASeq, AStartTime, AEndTime, AHrs );

  if SelectValueFmtAsFloat(  'select 1                                                                       ' +
                 '  from cntr_sched c,                                                           ' +
                 '       workorder w,                                                            ' +
                 '       standard_pmeqmt s                                                       ' +
                 ' where c.workorder_id = w.id                                                   ' +
                 '   and w.standard_id = s.standard_id                                           ' +
                 '   and s.pmeqmt_id in                                                          ' +
                 '       (select s2.pmeqmt_id                                                    ' +
                 '          from standard_pmeqmt s2,                                             ' +
                 '               workorder w2                                                    ' +
                 '         where w2.id = %f                                                      ' +
                 '           and s2.standard_id = w2.standard_id)                                ' +
                 '   and ( c.prod_start_time between to_date( ''%s'', ''MM/DD/RRRR HH24:MI:SS'') ' +
                 '                               and to_date( ''%s'', ''MM/DD/RRRR HH24:MI:SS'') ' +
                 '         or                                                                    ' +
                 '         c.prod_end_time between to_date( ''%s'', ''MM/DD/RRRR HH24:MI:SS'' )  ' +
                 '                             and to_date( ''%s'', ''MM/DD/RRRR HH24:MI:SS'' )  ' +
                 '         or                                                                    ' +
                 '         ( c.prod_start_time <= to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS'' )    ' +
                 '           and c.prod_end_time >= to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS''))) ' +
                 '   and rownum < 2 ',
                 [ AWorkOrdID,
                   FormatDateTime( 'MM/DD/YYYY hh:nn:ss', AStartTime ),
                   FormatDateTime( 'MM/DD/YYYY hh:nn:ss', AEndTime   ),
                   FormatDateTime( 'MM/DD/YYYY hh:nn:ss', AStartTime ),
                   FormatDateTime( 'MM/DD/YYYY hh:nn:ss', AEndTime   ),
                   FormatDateTime( 'MM/DD/YYYY hh:nn:ss', AStartTime ),
                   FormatDateTime( 'MM/DD/YYYY hh:nn:ss', AEndTime   ) ]) = 1 then
     if DoShowToolConflict( AWorkOrdID, AStartTime, AEndTime ) = mrCancel then
        ABORT;
end;

procedure TSchdHidden.Get_Start_End_Times_For_New_Job( ACenterID, ASeq: Real; var AStartTime, AEndTime: TDateTime; AHrs: Real );
begin
  with TFDQuery.Create(self) do
  try
    Connection:= UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select prod_end_time from cntr_sched where work_center_id = %f and cntr_seq = %f', [ ACenterID, ASeq - 1 ]));
    Open;
    if Eof then
       AStartTime:= Now
    else
       AStartTime:= Fields[ 0 ].asDateTime + 1/86400;
  finally
    Free;
  end;

  with procEnd_Date do
  begin
    ParamByName('v_cntr_ID').Value            := ACenterID;
    ParamByName('v_ini_start_time').asDateTime:= AStartTime;
    ParamByName('v_hrs').Value                := AHrs;
    ParamByName('v_is_default_calendar').Value:= 0;
    ParamByName('v_mfgcell_id').Value         := 0;  {v_mfgcell_id is applied for default_calendar only}
    ExecProc;
    AEndTime:= ParamByName('v_end_time').asDateTime;
  end;
end;

procedure TSchdHidden.MoveJob(nSchedID, CurrentCenterID, NewCenterID, CurrentSeq, NewSeq:Real );
var
  ACntr_Sched_ID: Real;
  AList              : TStringList;
  I                  : Integer;
  ADB                : TFDConnection;
  AWasInTransaction  : Boolean;
  AWorkorder_ID      : Real;
begin
  with TFrm_MainSched(self.Owner) do IncrementIRV32Semaphore(IQIrv32LockHandle);        {Shared mode}

  try
    ADB:= UniMainModule.FDConnection1;
    AWasInTransaction:= ADB.InTransaction;
    if not AWasInTransaction then
       ADB.StartTransaction;
    try
       AList:= TStringList.Create; {SchdSameToolJobs.pas}
       try
         {Load Cntr_Sched_IDs we are about to move}
         { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'CheckLoadSameToolAdjoiningJobs'
         CheckLoadSameToolAdjoiningJobs( AList, nSchedID, CurrentCenterID, CurrentSeq ); }

         for I:= 0 to AList.Count - 1 do
         begin
           ACntr_Sched_ID:= StrToFloat( AList[ I ]);
           {Accept cntr_seq of the original moved job and SelectValueByID of the subsequent}
           if I > 0 then
              CurrentSeq:= SelectValueByID( 'cntr_seq', 'cntr_sched', ACntr_Sched_ID );

           {Actual Move. Returns to what sequence was the job moved to. Used in the next itteration}
           NewSeq:= MoveJobEx( ACntr_Sched_ID, CurrentCenterID, NewCenterID, CurrentSeq, NewSeq );

           {Prepare for next job to be moved}
           NewSeq:= NewSeq + 1;
         end;

       finally
         AList.Free;
         {For GVSWin so we can update the treeview }
         { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
         PostMessage( Handle, iq_Notify, 0, 0);}
       end;

       if not AWasInTransaction then
          ADB.Commit;
    finally
       if not AWasInTransaction and ADB.InTransaction then
          ADB.RollBack;
    end;

  finally
    with TFrm_MainSched(self.Owner) do DecrementIRV32Semaphore(IQIrv32LockHandle);
  end;

  {Check for Negative Consumption. 11-06-2011 exclude COMPLEX workorders for now}
  AWorkorder_ID:= SelectValueByID('workorder_id', 'cntr_sched', nSchedID );

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'CheckNegativeConsumption'
  if not IQMS.Common.MfgShare.IsComplexWorkorder( AWorkorder_ID ) then
     CheckNegativeConsumption( AWorkorder_ID );}  {SchdNegConsumption.pas}
end;


function TSchdHidden.MoveJobEx( nSchedID, CurrentCenterID, NewCenterID, CurrentSeq, NewSeq:Real ): Real;
var
  CenterChanged, SeqChanged: Boolean;
  nNext_Sched_ID: Real;
  nTmp : Real;
  CurrentToPool: Boolean;
  WoIsFinished: Boolean;
  WoIsLeftInSchedule: Boolean;
  AWorkorder_ID: Real;
  ASndop_Dispatch_ID: Real;
begin
  {init}
  nNext_Sched_ID:= 0;
  WoIsFinished:= FALSE;

  {make sure NewSeq is not > then existing seqs}
  nTmp:= JobsCount( NewCenterID );
  if nTmp < NewSeq then NewSeq:= nTmp + 1;

  Result:= NewSeq;

  CenterChanged := CurrentCenterID <> NewCenterID;
  SeqChanged    := CurrentSeq <> NewSeq;
  AWorkorder_ID := SelectValueFmtAsFloat('select workorder_id from cntr_sched where id = %f', [ nSchedID ]);
  ASndop_Dispatch_ID:= SelectValueFmtAsFloat('select sndop_dispatch_id from cntr_sched where id = %f', [ nSchedID ]);

  if not (CenterChanged) and not (SeqChanged) then
     EXIT;

  if not CenterChanged and (JobsCount( CurrentCenterID ) = 1) then                 {avoid 1 workorder scheduled and moved within the same press}
     EXIT;

     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'CheckWorkCenterInRunsTheBest'
  CheckWorkCenterInRunsTheBest( NewCenterID, AWorkorder_ID, ASndop_Dispatch_ID );}  {SchdRunsBestChk.pas}

  ConfirmNewSetup( NewSeq, NewCenterID, AWorkorder_ID, ASndop_Dispatch_ID );

  CheckToggleCenterActive( NewCenterID );

  // A nightmare starts here...
  if (NewSeq = 1) and (CurrentSeq = 1) then begin
     // Current Center:take off current job in seq 1. Setup next job on that machine.

     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'ConfirmSetUpExA'
     if JobsCount( CurrentCenterID ) > 1 then
        ConfirmSetUpExA( CurrentCenterID, nNext_Sched_ID, CurrentToPool, WoIsFinished, WoIsLeftInSchedule );}  {select what job to setup. CurrentToPool is ignored}

     {03-07-2009 mark current job finished}
     { TODO -oBantuK -cWEB_CONVERT : SchdNext yet to be converted
     if WoIsFinished then
        SchdNext.RecordWorkorderActualEndTime( CurrentCenterID, AWorkorder_ID );}


     // 11-06-2015 EIQ-8765 first unschedule it
     // Current Press
     if nNext_Sched_ID > 0 then
        begin
          CheckUndoForceStartSource_A( nNext_Sched_ID );
          DoSetup( CurrentCenterID, nNext_Sched_ID, not DEL_JOB_FROM_SCHED ) {don't delete - we movin'it to another press}
        end
     else
        DoCloseSetup( CurrentCenterID );

     // New Machine: Setup next job (transfer job from current to the new press)
     if CenterChanged then
     begin
       CheckUndoForceStartSource_A( nSchedID );
       DoSetup( NewCenterID, nSchedID, not DEL_JOB_FROM_SCHED );
     end;

     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TIQMS'
     TIQMS.Common.EmbeddedWebIISForm.CheckShowSetupChecklist( CurrentCenterID );}
  end

  else if (NewSeq = 1) and (CurrentSeq <> 1) then begin
     // New Machine: Setup next job
     CheckUndoForceStartSource_A( nSchedID );
     DoSetup( NewCenterID, nSchedID, not DEL_JOB_FROM_SCHED );

     // Current Center: just recalc
     if CenterChanged then
        RecalcOneCenter( CurrentCenterID, 0, 0, UpdateProgressPanel );

     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TIQMS'
     TIQMS.Common.EmbeddedWebIISForm.CheckShowSetupChecklist( CurrentCenterID );}
  end

  else if (NewSeq <> 1) and (CurrentSeq = 1) then begin
     // Current Center:take off current job in seq 1. Setup next.

     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'ConfirmSetUpExA'
     if JobsCount( CurrentCenterID ) > 1 then
        ConfirmSetUpExA( CurrentCenterID, nNext_Sched_ID, CurrentToPool, WoIsFinished, WoIsLeftInSchedule  );}  {select what job to setup. CurrentToPool is ignored}

     {03-07-2009 mark current job finished}
     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'SchdNext'
     if WoIsFinished then
        SchdNext.RecordWorkorderActualEndTime( CurrentCenterID, AWorkorder_ID );}

     // New Machine: Move the job and recalc
     if CenterChanged then
     begin
        CheckUndoForceStartSource_A( nSchedID );
        ExecuteCommandFmt('update cntr_sched set work_center_id = %f, cntr_seq = %f where id = %f', [ NewCenterID, NewSeq, nSchedID ]);
        RecalcOneCenter( NewCenterID, nSchedID, NewSeq, UpdateProgressPanel );
     end;

     // Current Press
     if nNext_Sched_ID > 0 then
        begin
          CheckUndoForceStartSource_A( nNext_Sched_ID );
          DoSetup( CurrentCenterID, nNext_Sched_ID, not DEL_JOB_FROM_SCHED )
        end
     else
        DoCloseSetup( CurrentCenterID );

     if not CenterChanged then
        RecalcOneCenter( CurrentCenterID, nSchedID, NewSeq, UpdateProgressPanel );

     { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TIQMS'
     TIQMS.Common.EmbeddedWebIISForm.CheckShowSetupChecklist( CurrentCenterID );}
  end

  else if (NewSeq <> 1) and (CurrentSeq <> 1) then begin
     if CenterChanged then
        ExecuteCommandFmt('update cntr_sched set work_center_id = %f, cntr_seq = %f  where id = %f', [ NewCenterID, NewSeq, nSchedID ]);

     // New Machine: just Recalc jobs
     CheckUndoForceStartSource_A( nSchedID );
     RecalcOneCenter( NewCenterID, nSchedID, NewSeq, UpdateProgressPanel );

     // Current Machine: just Recalc jobs
     if CenterChanged then RecalcOneCenter( CurrentCenterID, 0, 0, UpdateProgressPanel );
  end;
end;


procedure TSchdHidden.RemoveJob( nSchedID, CurrentCenterID:Real );
type
  TRemovedJob = ( rjFirst_ThereMoreJobs, rjFirst_NoMoreJobs, rj2ndOrGreater );
var
  q: TFDQuery;
  RemovedJob: TRemovedJob;
  AWorkorder_ID: Real;
begin
  RemovedJob:= rj2ndOrGreater;

  if SelectValueFmtAsFloat('select cntr_seq from cntr_sched where ID = %f', [ nSchedID ]) = 1 then
  begin
     if JobsCount( CurrentCenterID ) > 1 then
        RemovedJob:= rjFirst_ThereMoreJobs
     else
        RemovedJob:= rjFirst_NoMoreJobs;
  end;

  try
    case RemovedJob of
      rjFirst_ThereMoreJobs:
              begin
                 Setup_Shell( CurrentCenterID );
                 EXIT;
              end;
      rjFirst_NoMoreJobs:
              begin
                AWorkorder_ID:= SelectValueByID( 'workorder_id', 'cntr_sched', nSchedID);
                { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'SchdNext'
                if (AWorkorder_ID > 0) and IQConfirmYN(Format('Is Workorder %.0f finished?', [ AWorkorder_ID ])) then
                   SchdNext.RecordWorkorderActualEndTime( CurrentCenterID, AWorkorder_ID );}
                DoCloseSetup( CurrentCenterID );
              end;
      rj2ndOrGreater: ;
    end;

    // with TFDQuery.Create(Owner) do
    // try
    //   ConnectionName:= 'IQ';
    //   SQL.Add(IQFormat('delete from cntr_sched where id = %f', [nSchedID] ));
    //   ExecSQL;
    //   RecalcOneCenter( CurrentCenterID, 0{new sched_id}, 0{new seq}, UpdateProgressPanel );
    // finally
    //   Close; Free;
    // end;

    // delete cntr_sched_id
    // 11-06-2011 COMPLEX mfgtype - as a pecaution make sure all the children are gone too
    ExecuteCommandFmt('declare                                                                             '+
              '  v_cntr_sched_id  number::= %f;                                                    '+
              '  v_work_center_id number;                                                          '+
              '  v_workorder_id   number;                                                          '+
              '  v_is_virtual     varchar2(1);                                                     '+
              'begin                                                                               '+

              // get work_center_id, workorder_id and is_virtual
              '  begin                                                                             '+
              '    select c.work_center_id, c.workorder_id, w.is_virtual                           '+
              '      into v_work_center_id, v_workorder_id, v_is_virtual                           '+
              '      from cntr_sched c, work_center w                                              '+
              '     where c.id = v_cntr_sched_id                                                   '+
              '       and c.work_center_id = w.id;                                                 '+
              '  exception when no_data_found then                                                 '+
              '    v_work_center_id::= null;                                                       '+
              '  end;                                                                              '+

              // delete cntr_sched
              '  delete from cntr_sched where id = v_cntr_sched_id;                                '+

              // precaution - make sure all complex children are deleted from cntr_sched too
              '  if nvl(v_is_virtual, ''N'') = ''C'' then                                          '+
              '     delete from cntr_sched                                                         '+
              '      where parent_work_center_id = v_work_center_id                                '+
              '        and workorder_id in                                                         '+
              '            (select id from workorder where complex_workorder_id = v_workorder_id); '+
              '  end if;                                                                           '+
              'end;                                                                                ',
              [ nSchedID ]);

    RecalcOneCenter( CurrentCenterID, 0{new sched_id}, 0{new seq}, UpdateProgressPanel );

    BringToFrontJobsDlg;
    RefreshAddJobQuery( TRUE );
  finally
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
    PostMessage( Handle, iq_Notify, 0, 0);}  {this is for GVSWin so we can update the treeview }
  end;
end;


procedure TSchdHidden.CheckCenterStartEnd( nCntrID:Real; ForceRecalc: Boolean; ARecalcMustStart: Boolean = FALSE );
begin
  if ForceRecalc or NeedsRecalc( nCntrID ) then
  begin
     RecalcOneCenter( nCntrID, 0{new sched_id}, 0{new seq}, UpdateProgressPanel );

     // 12-11-2009 do not recalc must start date for ASSY1 workorders
     if ARecalcMustStart and not TFrm_MainSched(self.Owner).IsAssy1 then
     begin
        RecalcWorkorderMustStart( nCntrID );
        TFrm_MainSched(Owner).DM.TblWorkOrder.Refresh;
     end;

     if TFrm_MainSched(Owner).DM.TblCntr_Sched.State = dsBrowse then
        TFrm_MainSched(Owner).DM.TblCntr_Sched.Refresh;
  end;
end;

function TSchdHidden.NeedsRecalc( nCntrID : Real ):Boolean;
var
  q            :TFDQuery;
  ProdStartTime:TDateTime;
  DateChanged  :Boolean;
  TimeChanged  :Boolean;
  Today        :TDateTime;
begin
  (* We will recalc start-end if
    1. Date is different from Prod_Start_Time date
    2. Cntr is RT and there is 15 mins (probably need to make it global para)
  *)
  try
     Result       := FALSE;
     DateChanged  := TRUE;
     TimeChanged  := TRUE;
     ProdStartTime:= 0;
     Today        := Now;

     q:= TFDQuery.Create(Owner);
     q.Connection:= UniMainModule.FDConnection1;
     q.SQL.Add(         'select cntr_sched.prod_start_time, work_center.is_rt');
     q.SQL.Add(         '  from cntr_sched, work_center');
     q.SQL.Add(IQFormat(' where cntr_sched.work_center_id = %f and cntr_sched.cntr_seq = 1', [nCntrID]));
     q.SQL.Add(         '   and cntr_sched.work_center_id = work_center.id');
     q.Open;

     if not q.EOF then
       ProdStartTime:= q.FieldByName('prod_start_time').asDateTime;

     DateChanged:= Trunc(ProdStartTime) <> Trunc( Date );
     TimeChanged:= Abs( StrToTime(TimeToStr(ProdStartTime)) - Time ) >= 15 / (24 * 60);  // 15 mins

     if DateChanged then
        Result:= TRUE
     else
       if q.FieldByName('is_rt').asString = 'Y' then
          Result:= TimeChanged;
  finally
     q.Close; q.Free;
  end;
end;

procedure TSchdHidden.RecalcOneCenter( nCntrID, nSchedID, nSeq:Real; ShowProgress: TUpdateProgressPanelProcedure; ARefreshAssyTrack: Boolean = TRUE );
begin
  try
    Screen.Cursor:= crHourGlass;
    if Assigned(ShowProgress) then
       // 'Center ID %.0f: Scanning scheduled work orders ...'
       ShowProgress(Format(sched_rscstr.cTXT0000023, [ nCntrID ]));

    Recalc_Center( nCntrID, nSchedID, nSeq );   // IQMS.Common.Proc. (stored proc)

    if ARefreshAssyTrack and IQMS.Common.MfgShare.IsMfgTypeSimilarToASSY1( SelectValueByID('mfg_type', 'work_center', nCntrID )) then
       RefreshAssyTrack;

  finally
    if Assigned(ShowProgress) then
       // ShowProgress( Format('Status: Last Recalc %s', [ DateTimeToStr( Now ) ] ));
       ShowProgress( TFrmIRV32.GetLastRecalcDateAsStringEx() );  // IRV_Main.pas
  end;
end;

procedure TSchdHidden.Setup_Shell( nCntrID: Real );
var
  nNext_Sched_ID  : Real;
  CurrentToPool   : Boolean;
  CurrentWorkOrdID: Real;
  CurrentSched_ID : Real;
  A               : Variant;
  WoIsFinished    : Boolean;
  WoIsLeftInSchedule: Boolean;
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TConfrimDeleteArchive'
  ADeleteArchiveMode: TConfrimDeleteArchive;}
  ANextWorkOrdID  : Real;
begin
  nNext_Sched_ID:= 0;
  CurrentWorkOrdID:= SelectValueFmtAsFloat('select workorder_id from cntr_sched where work_center_id = %f and cntr_seq = 1', [ nCntrID ]);
  CurrentSched_ID := SelectValueFmtAsFloat('select id from cntr_sched where work_center_id = %f and cntr_seq = 1', [ nCntrID ]);

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'ConfirmSetUpExA'
  ConfirmSetUpExA( nCntrID, nNext_Sched_ID, CurrentToPool, WoIsFinished, WoIsLeftInSchedule, 1011192 );} // 1065938 {select what job to setup}

  ANextWorkOrdID:= SelectValueFmtAsFloat('select workorder_id from cntr_sched where id = %f', [ nNext_Sched_ID ]);
  if ANextWorkOrdID > 0 then
     CheckOpenMRO( ANextWorkOrdID );

  (*TODO -oBantuK -cWEB_CONVERT : Too many compile time error. }
  {05-26-2014 archive workorder}
  ADeleteArchiveMode:= daNone;
  if not CurrentToPool
     and not WoIsLeftInSchedule
     and (CurrentWorkOrdID > 0)
     //and (SelectValueByID('firm', 'workorder', CurrentWorkOrdID) <> 'Y')
     and not IQMS.Common.MfgShare.IsWorkorderPRW( CurrentWorkOrdID ) then
  begin
    // ADeleteArchiveMode:= TFrmWOConfDel.DoShowModal( CurrentWorkOrdID );  // wo_conf_del.pas
    ADeleteArchiveMode:= TFrmWOConfDelSched.DoShowModal( CurrentWorkOrdID );  // wo_conf_del_sched.pas
    if ADeleteArchiveMode = daNone then
       ABORT
    else if ADeleteArchiveMode = daSkip then
       CurrentToPool:= TRUE;
  end;

  {03-07-2009 mark current job finished}
  if WoIsFinished then
     SchdNext.RecordWorkorderActualEndTime( nCntrID, CurrentWorkOrdID );
  *)

  {Oct-08-04}
  if not CurrentToPool then
     A:= SelectValueArrayFmt( 'select standard_id, origin, division_id, order_type, bucket_start_time, make_to_order_detail_id from workorder where id = %f', [ CurrentWorkOrdID ]);

  DoSetup( nCntrID, nNext_Sched_ID, DEL_JOB_FROM_SCHED and not WoIsLeftInSchedule);

  if not CurrentToPool and (CurrentWorkOrdID > 0) and not WoIsLeftInSchedule and not IQMS.Common.MfgShare.IsWorkorderPRW( CurrentWorkOrdID ) then
  begin
    // ExecuteCommandFmt('delete from workorder where id = %f', [ CurrentWorkOrdID ]);
    {02-06-2009}
    // if SelectValueByID('firm', 'workorder', CurrentWorkOrdID) = 'Y' then
    //    ExecuteCommandFmt('begin                                        '+
    //              '  IRV32.Check_Remove_Finished_Firm_WO( %f ); '+
    //              'end;                                         ',
    //              [ CurrentWorkOrdID ])
    //

    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TWoDm'
    TWoDm.DeleteWorkorder( CurrentWorkOrdID, ADeleteArchiveMode = daDeleteArchive);}  // wo_dm

    if (VarArrayDimCount( A ) > 0) and (A[ 4 ] > 0 {bucket_start_time}) then
       ExecuteCommandFmt('begin irv32.reorder_buckets( %f, ''%s'', %f, ''%s'', %f); end;',
                  [ DtoF(A[0]),                    // v_standard_id
                    A[1],                          // v_origin
                    DtoF(A[2]),                    // v_division_id
                    A[3],                          // v_order_type
                    DtoF(A[5]) ]);                 // v_make_to_order_detail_id
  end;


  if WoIsLeftInSchedule and (CurrentSched_ID > 0) then
     Recalc_Center( nCntrID, CurrentSched_ID, 2 );   // IQMS.Common.Proc. (stored proc)

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TIQMS'
  TIQMS.Common.EmbeddedWebIISForm.CheckShowSetupChecklist( nCntrID );}
end; // Setup_Shell

procedure TSchdHidden.DoSetup( nCntrID, nNext_Sched_ID: Real; DeleteCurrent:Boolean );
begin
  if Is_Center_RT( nCntrID ) then
     RT_Setup( nCntrID, nNext_Sched_ID, DeleteCurrent )  {IQMS.Common.Proc. Close out existing run and startup a new one}
  else
     Non_RT_Setup( nCntrID, nNext_Sched_ID, DeleteCurrent );

  {07-03-2003 check for is_mfg_quan_padded and convert to FIRM}
  ExecuteCommandFmt('begin IRV32.Check_Padded_Convert_Firm( %f); end;', [ DtoF( SelectValueByID('workorder_id', 'cntr_sched', nNext_Sched_ID ))]);
end;

procedure TSchdHidden.DoCloseSetup( nCntrID : Real );
begin
  if Is_Center_RT( nCntrID ) then
     RT_Close_SetUp( nCntrID )   {IQProc}
  else
    // in the future we need to write to hist_illum_rt and xdayprod files
    //with TFDQuery.Create(self) do
    //try
    //   ConnectionName:= 'IQ';
    //   SQL.Add('delete from cntr_sched');
    //   SQL.Add(Format('where cntr_seq = 1 and work_center_id = %f', [ nCntrID ]));
    //   ExecSQL;
    //   RecalcOneCenter( nCntrID, 0, 0, UpdateProgressPanel );
    //finally
    //   Close; Free;
    //end;
end;

procedure TSchdHidden.Non_RT_Setup( nCntrID, nNext_Sched_ID:Real; DeleteCurrent:Boolean );
var
  AWorkorder_ID: Real;
begin
  // in the future we need to write to hist_illum_rt and xdayprod files

  with TFDQuery.Create(Owner) do
  try
     Connection:= UniMainModule.FDConnection1;
     if DeleteCurrent then begin
       SQL.Add('delete from cntr_sched');
       SQL.Add(IQFormat('where cntr_seq = 1 and work_center_id = %f', [ nCntrID ]));
       ExecSQL;
     end;

     Close;
     SQL.Clear;
     SQL.Add(IQFormat('update cntr_sched set work_center_id = %f, cntr_seq = 1', [ nCntrID ]));
     SQL.Add(IQFormat('where id = %f', [ nNext_Sched_ID ]));
     ExecSQL;

     // populate cycles_planned for manual workorders
     AWorkorder_ID:= SelectValueFmtAsFloat('select workorder_id from cntr_sched where id = %f', [ nNext_Sched_ID ]);
     if AWorkorder_ID > 0 then
     begin
       ExecuteCommandFmt( 'begin rt.check_populate_planned_cycles(%f); end;', [ AWorkorder_ID ]);

       if (SelectValueAsString('select sched_firm_on_setup from params') = 'Y')
          or
          (SelectValueFmtAsFloat('select forecast.is_workorder_make_to_stock( %f ) from dual', [ AWorkorder_ID ]) = 1) then
         ExecuteCommandFmt('begin irv32.convert_to_firm( %f ); end;', [ AWorkorder_ID ]);
     end;

     RecalcOneCenter( nCntrID, nNext_Sched_ID, 1, UpdateProgressPanel );
  finally
     Close; Free;
  end;
end;

{Misc}
function TSchdHidden.JobsCount( nCntrID:Real ):Real;
begin
  JobsCount:= SelectValueFmtAsFloat('select count(*) from cntr_sched where work_center_id = %f', [ nCntrID ]);
end;

function TSchdHidden.Mach_Down( nCntrID: Real ):Boolean;
var
  Situation:Integer;
begin
  result:= FALSE;
  Situation:= RT_Is_Cntr_Down( nCntrID );  // stored proc. See IQMS.Common.Proc.pas

  case Situation of
    {'The Work Center is currently in production.  Setting up a '+
     'different work order is NOT allowed until the machine is down.' + #13+
     'If the WRONG work order is scheduled, choose SUSPEND to force the '+
     'work order change.' + #13+#13+
     'Do you want to SUSPEND the machine?'}
    0: result:= IQConfirmYN(sched_rscstr.cTXT0000024);
    1: Result:= TRUE;
    // 'The Work Center is NOT in the RealTime table. The setup did NOT go into the RealTime.'
    2: IQWarning(sched_rscstr.cTXT0000025);
  end;
end;

procedure TSchdHidden.Work_CenterDataChange(Sender: TObject; Field: TField);
var
  I: Integer;
begin
  with TFrm_MainSched(Owner) do
  begin
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedGVSWin'
    if self is TSchedGVSWin then
       Caption:= sched_rscstr.cTXT0000009 // 'Scheduling'
    else
       // 'Scheduling - Center %s - %s'
       Caption:= Format(sched_rscstr.cTXT0000008,
         [DM.TblWork_Center.FieldByName('EQNO').asString ,
          DM.TblWork_Center.FieldByName('CNTR_DESC').asString ]);}

    SnaptoLastJob.Checked:= GetSnapToLastJob( DM.TblWork_CenterID.asFloat );

    case IsAssy1 of
      TRUE:
       begin
          CheckCloseJobsDlg;
          {if TFrmSchedAddAssy1 window is open - update it}
          { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSchedAddAssy1'
          if IQMS.Common.Controls.FindFormByClassType( TFrmSchedAddAssy1 ) <> nil then
             TFrmSchedAddAssy1.DoShow( self.Owner, DM.TblWork_CenterID.asFloat, RTFilter );}         {SchedAddAssy1.pas}
       end;

      FALSE:
       begin
          CheckCloseSchedAddAssy1;
          {if TSchedAddJob window is open - update it}
          if Assigned( JobsDlg ) then with JobsDlg do
          begin
            SetCurrentCenterInfo( DM.TblWork_Center );  // update EqNo, CntrType, CntrID
            BringToFront;
            RefreshAddJobQuery( FALSE );
          end;
       end;
    end;
  end;
end;

procedure TSchdHidden.UpdateProgressPanel( s:string );
begin
  TextStatus.Panels[4].Text:= s;
  TextStatus.Update;
end;

procedure TSchdHidden.InvalidateSchedule;
begin
  with TFrm_MainSched(Owner).RTFilter do
    if CellorMfgType = cmCELL then
       TextStatus.Panels[3].Text:= 'Cell: '+ Cell
    else
       begin
         if UseBaseMfgType then
            TextStatus.Panels[3].Text:= 'Base Mfg Type: '+ Lookup_MfgType
         else
            TextStatus.Panels[3].Text:= 'Mfg Type: '+ MfgType;
       end;
  TextStatus.Update;

  {if RTFilter has changed - refresh filter in the AddJob box }
  RefreshAddJobQuery( FALSE );

  {make sure grid titles reflect mfgtype}
  TFrm_MainSched(Owner).AppDef1AfterMfgTypeChanged( NIL );
end;

procedure TSchdHidden.PickCenter(Sender:TObject);
begin
 {ReAssign SQL based on MfgType/Cell}
  with TFrm_MainSched(Owner), DM.PkCenter do
  begin
    SQL.Clear;
    SQL.Add('select eqno, cntr_desc, capacity, cntr_type, id, eplant_id, pk_hide from iqms.work_center' );
    if RTFilter.CellorMfgType = cmCELL then
       begin
          SQL.Add( Format('where MFGCELL = ''%s''', [ FixStr( RTFilter.Cell )]));
          SQL.Add( Format('   or ( mfgcell is NULL and mfg_type = ''%s'')' , [ FixStr(RTFilter.MfgType) ]))
       end
    else
       begin
         if RTFilter.UseBaseMfgType then
            SQL.Add( Format('where mfg.lookup_mfgtype(MFG_TYPE) = ''%s''', [ RTFilter.Lookup_MfgType ]))
         else
            SQL.Add( Format('where MFG_TYPE = ''%s''', [ FixStr(RTFilter.MfgType) ]));
       end;

    SQL.Add( '  and parent_id is null' );
    SQL.Add( '  and (frame_id is null or frame_set_id > 0)' );
  end;
end;

procedure TSchdHidden.CheckEmptySet( DataSet:TDataSet );
begin
  with TFrm_MainSched(Owner) do
    Schedule1.Enabled:= not (DataSet.Eof and DataSet.Bof);
end;

procedure TSchdHidden.CheckEmptySet( ARecordsFound: Boolean );
begin
  with TFrm_MainSched(Owner) do
    Schedule1.Enabled:= ARecordsFound;
end;

procedure TSchdHidden.AssignLabels;
begin
end;

procedure TSchdHidden.SaveLabels;
begin
end;

procedure TSchdHidden.SaveToRegistry;
begin
end;

procedure TSchdHidden.RefreshAddJobQuery( InclSched: Boolean );
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_RefreshDataSets'
  if Assigned( JobsDlg ) then
     PostMessage( JobsDlg.Handle, iq_RefreshDataSets, Ord(InclSched), 0 );}

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSchedAddAssy1'
  if IQMS.Common.Controls.FindFormByClassType( TFrmSchedAddAssy1 ) <> nil then
     TFrmSchedAddAssy1.DoShow( self.Owner, TFrm_MainSched(self.Owner).DM.TblWork_CenterID.asFloat, TFrm_MainSched(self.Owner).RTFilter );}         {SchedAddAssy1.pas}
end;

procedure TSchdHidden.SchedulingWindow( Sender: TObject );
begin
  DoIQSchedWindow( TFrm_MainSched(Owner).DM.TblCntr_SchedWORKORDER_ID.asFloat );  {sched_mn.pas}
end;

function TSchdHidden.IncludeWorkorder( AWorkOrder_ID: string ): Boolean;
begin
  {Normal SchedGVS always includes all workorders. SchedGVSWin may hide unrelated workorders}
  Result:= TRUE;
end;

procedure TSchdHidden.Cntr_SchedDataChange(Sender: TObject; Field: TField);
var
  AIsASSY2: Boolean;
begin
  {in text mode we remove material description for standard that arinvt_id_mat is NULL.
   See SchedText.pas overrides this event}
  with TFrm_MainSched(Owner) do
  begin
    AIsASSY2:= Is_ASSY2_Workorder( DM.TblCntr_SchedWORKORDER_ID.asFloat );
    sbtnMove.Enabled:= SR.Enabled[ 'sbtnMove' ] and not AIsASSY2;
    MoveJob1.Enabled:= SR.Enabled[ 'MoveJob1' ] and not AIsASSY2;
    MoveJob2.Enabled:= SR.Enabled[ 'MoveJob2' ] and not AIsASSY2;
  end;

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TSchedGVS'
  if not (self is TSchedGVS) then
     AdjustShowWorkorderDetails;}
end;

procedure TSchdHidden.BOMTreeClick( AQty: Real );
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DoShowBOMReqMaterials'
  DoShowBOMReqMaterials( TFrm_MainSched(self.Owner),
                         TFrm_MainSched(self.Owner).DM.SrcPtOrder,
                         'ARINVT_ID',
                         AQty );}  // TFrm_MainSched(self.Owner).DM.QryPtOrderREL_QUAN_DISP.asFloat );  {BOM_Tree.pas}
end;


procedure TSchdHidden.CheckToggleCenterActive( AWork_Center_ID: Real );
begin
  if SelectValueByID('pk_hide', 'work_center', AWork_Center_ID ) <> 'Y' then
     EXIT;

  {'Work center %s is currently flagged, ''Inactive''. By scheduling a ' +
   'work order, the work center will be toggled to ''Active''.'#13#13+
   'Do you want to continue?'}
  if not IQConfirmYN(Format(sched_rscstr.cTXT0000026,
                            [ SelectValueByID('rtrim(eqno)', 'work_center', AWork_Center_ID) ])) then
     ABORT;

  ExecuteCommandFmt('update work_center set pk_hide = ''N'' where id = %f', [ AWork_Center_ID ]);
end;


procedure TSchdHidden.CheckUpdateProdStartTimeBasedOnJIT( AWork_Center_ID, AWorkorder_ID, ACntr_Sched_ID: Real );
var
  AProd_Start_Time: TDateTime;
begin
  AProd_Start_Time:= TFrm_MainSched(Owner).GetProdStartTimeBasedOnJIT( AWork_Center_ID, AWorkorder_ID );
  if AProd_Start_Time > 0 then
     ExecuteCommandFmt('update cntr_sched                                                  '+
               '   set prod_start_time = to_date(''%s'', ''mm/dd/yy hh24:mi:ss''), '+
               '       force_source = ''U'', force_reason = ''JIT''                '+
               ' where id = %f',
               [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', AProd_Start_Time),
                 ACntr_Sched_ID ]);
end;


function TSchdHidden.GetGVS_WOCaption: string;
begin
  Result:= TFrm_MainSched(Owner).GVS_WOCaption;
end;

function TSchdHidden.GetGVS_ShowExceptionIndex: Integer;
begin
  {0 - show all records no exceptions, 1 - only material exceptions, 2 - only tooling exceptions, 3 - MAterial Color Code display}
  if TFrm_MainSched(Owner).cboxGVSMatExceptions.ItemIndex >= 0 then
     Result:= TFrm_MainSched(Owner).cboxGVSMatExceptions.ItemIndex
  else
     Result:= 0;
end;

function TSchdHidden.GetGVS_IsViewKindSetup: Boolean;
begin
  Result:= TFrm_MainSched(Owner).SetupTime1.Checked;
end;

procedure TSchdHidden.AssociatedToolingEquiment;
begin
   { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSchdPmeqmt'
   TFrmSchdPmeqmt.DoShowModal( TFrm_MainSched(self.Owner).DM.TblCntr_SchedStandard_ID.asFloat );}  {SchdPmeqmt.pas}
end;

procedure TSchdHidden.WorkorderMaterialExceptions;
begin
  DoShowWorkorderMaterialExceptions( TFrm_MainSched(self.Owner).DM.TblCntr_SchedWORKORDER_ID.asFloat );  {MatXcpWO.pas}
end;

procedure TSchdHidden.CheckShowScheduleInfo( AWorkorder_ID: Real );
var
  A: Variant;
  S: string;
begin
  A:= SelectValueArrayFmt('select s.mfgno, s.info_sched from standard s, workorder w where w.id = %f and w.standard_id = s.id',
                     [ AWorkorder_ID ]);
  if (VarArrayDimCount( A ) = 0) or (Trim(A[ 1 ]) = '') then
     EXIT;

  // DoViewMemoStr( self, A[ 1 ], Format(sched_rscstr.cTXT0000027, [ A[ 0 ]])); {IQMS.Common.EditMemoStr.pas}
  S:= Format(sched_rscstr.cTXT0000027 {'MFG # %s'} + #13#13'%s', [ A[ 0 ], A[ 1 ]]);
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSecuredConfirmSchedInfo'
  if TFrmSecuredConfirmSchedInfo.DoShowModal( S ) <> mrYes then  // sched_sec_conf_sched_info.pas
     ABORT;}
end;


procedure TSchdHidden.RecalcWorkorderMustStart(AWork_Center_ID: Real);
begin
  if AWork_Center_ID = 0 then EXIT;

  ExecuteCommandFmt('declare                                                                       '+
            '  v_work_center_id number::= %f;                                              '+
            '  v_start_time     date;                                                      '+
            'begin                                                                         '+
            '  for v in (select cntr_sched.workorder_id,                                   '+
            // '                w.end_time,                                                '+
            '                   cntr_sched.prod_end_time as end_time,                      '+
            '                   nvl(w.prodhrs,0) prod_hrs,                                 '+
            '                   nvl(cntr_sched.setuphrs, 0) setuphrs,                      '+
            '                   s.mfgcell_id                                               '+
            '              from cntr_sched, workorder w, standard s                        '+
            '             where cntr_sched.work_center_id = v_work_center_id               '+
         // '               and cntr_sched.parent_work_center_id is null                   '+
            '               and rt.consider_work_center( cntr_sched.parent_work_center_id, cntr_sched.complex_child ) = 1 '+
            '               and cntr_sched.workorder_id = w.id                             '+
            '               and w.standard_id = s.id )                                     '+
            '  loop                                                                        '+
            '    StartDate( v_work_center_id,                                              '+
            '               v.end_time,                                                    '+
            '               v.prod_hrs + v.setuphrs,                                       '+
            '               0,                                                             '+
            '               v_start_time,                                                  '+
            '               v.mfgcell_id );                                                '+
            '    update workorder set start_time = v_start_time where id = v.workorder_id; '+
            '  end loop;                                                                   '+
            'end;                                                                          ',
            [ AWork_Center_ID ]);
end;


procedure TSchdHidden.RefreshAssyTrack;
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmAssyTrackMain''
  IQMS.Common.Controls.PostMessageToForm( TFrmAssyTrackMain, iq_RefreshDataSets, AssyTrack_Const.cRefreshDataSet_Process, 0 );}
end;

procedure TSchdHidden.PrintLabels;
var
  AQry: TFDQuery;
  ADM : TSchdDM;
begin
  ADM:= TFrm_MainSched(self.Owner).DM;

  with TFrm_MainSched(Owner).LMRT1 do
  begin
    Standard_ID     := 0;  {reset internal values}
    This_Standard_ID:= ADM.QryPtOrderSTANDARD_ID.asFloat;

    AQry:= TFDQuery.Create(nil);
    try
      AQry.Connection := UniMainModule.FDConnection1;
      AQry.Sql.Add(IQFormat('select prod_date, prod_shift from V_MFGCELL_PARAM_ALL where mfgcell_id = %f', [ ADM.TblWork_CenterMFGCELL_ID.asFloat ]));
      AQry.Open;
      if not (AQry.eof and AQry.bof) then
      begin
        FProd_date := AQry.FieldByName('prod_date').asDateTime;
        FShift     := Trunc(AQry.FieldByName('prod_shift').asFloat);
      end;
    finally
      AQry.Free;
    end;

    Arinvt_ID   := ADM.QryPtOrderARINVT_ID.asFloat;
    Eqno        := ADM.TblWork_CenterEQNO.asString;
    MfgNo       := ADM.TblCntr_SchedMfgNo.asString;
    Orders_id   := ADM.QryPtOrderORDERS_ID.asFloat;
    Ord_Detail_id   := ADM.QryPtOrderORD_DETAIL_ID.asFloat;
    Partno_id   := ADM.QryPtOrderPARTNO_ID.asFloat;
    Workorder_id:= ADM.QryPtOrderWORKORDER_ID.asFloat;

    if (FOrder_No = '') and (Orders_id <> 0) then
       //'Please note: %s is not directly ordered item. It is required to satisfy sales order %s.'
       IQConfirm(Format(sched_rscstr.cTXT0000028,
                       [ SelectValueFmtAsString('select itemno from arinvt where id = %f',  [ Arinvt_ID ]),
                         SelectValueFmtAsString('select orderno from orders where id = %f', [ Orders_id ]) ]));
    ArCusto_id := ADM.QryPtOrderARCUSTO_ID.asFloat;

    OnCalculateLabelsCount:= CalculateLabelsCountBasedOnWorkorderQty;

    Execute;
  end;
end;

procedure TSchdHidden.CalculateLabelsCountBasedOnWorkorderQty( Sender: TObject; var ACount: Integer );
var
  AQty: Real;
  ADM : TSchdDM;
  ABoxQty: Real;
  ABoxes : Real;
begin
  // call back from IQLMRT to calculate number of required labels
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmLM_RT'
  if not (Sender is TFrmLM_RT) then
     EXIT;}
  ADM:= TFrm_MainSched(self.Owner).DM;
  try
    AQty:= ADM.QryPtOrderREL_QUAN_DISP.asFloat;
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmLM_RT'
    if not IQMS.Common.Numbers.IsStringValidFloat( TFrmLM_RT(Sender).EditBox.Text, ABoxQty) or (ABoxQty = 0) then
       ABoxQty:= 1;}
    ABoxes:= AQty / ABoxQty;
  except
    ABoxes := 1;
  end;
  if (ABoxes - Trunc(ABoxes)) <> 0 then
     ABoxes:= ABoxes + 1;
  ACount:= Trunc(ABoxes);
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TStatusPanel'
procedure TSchdHidden.TextStatusDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  ALeft: Integer;
begin
  if (Panel.Style = psOwnerDraw) and (Panel.Index = 4) then
     with TextStatus.Canvas do
     begin
       ALeft:= Rect.Left + 2;

       if Pos('ERROR', Panel.Text) > 0 then
          begin
             Font.Color:= clRed;
             ImageListLastExec.Draw( TextStatus.Canvas, Rect.Left, Rect.Top, 1);
             ALeft:= Rect.Left +  20;
          end
       // 'Last Recalc:'
       else if Pos(sched_rscstr.cTXT0000029, Panel.Text) > 0 then
          begin
             Font.Color:= clBlack;
             ImageListLastExec.Draw( TextStatus.Canvas, Rect.Left, Rect.Top, 0);
             ALeft:= Rect.Left + 20;
          end;
       TextOut( ALeft, Rect.Top, Panel.Text );
     end;
end;}

class procedure TSchdHidden.CheckWorkOrderOnRunHold( AWorkorder_ID: Real );
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmSecuredConfirmSchedRunHold'
  if (SelectValueByID('run_hold', 'workorder', AWorkorder_ID ) = 'Y')
     and
     // 'Work Order # %.0f is on a Run Hold - do you want to continue?'
     (TFrmSecuredConfirmSchedRunHold.DoShowModal( Format(sched_rscstr.cTXT0000030, [ AWorkorder_ID ])) <> mrYes) then  // secured_confirm_sched_run_hold.pas
    ABORT;}
end;


procedure TSchdHidden.CheckUndoForceStartSource_A( ACntr_Sched_ID: Real );
begin
  if SelectValueByID('force_source', 'cntr_sched', ACntr_Sched_ID) = 'A' then
     ExecuteCommandFmt('update cntr_sched set force_source = null where id = %f', [ ACntr_Sched_ID ]);
end;

function TSchdHidden.GetSwitchCheckMRO: Boolean;
begin
  Result:= SelectValueAsString('select SCHED_CHECK_MRO from params') = 'Y';
end;

procedure TSchdHidden.CheckOpenMRO( AWorkorder_ID: Real );
begin
  // 12-12-2014 EIQ-5199 Finite Schedule -> Inserting WOs or moving WOs to the first position -> add ability to show open MRO WOs
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmPMBomEquipPrompt'
  if GetSwitchCheckMRO() then
     if not TFrmPMBomEquipPrompt.DoShowModal( self, SelectValueByID('standard_id', 'workorder', AWorkorder_ID )) then  // pm_bom_pmeqmt_prompt.pas
        ABORT;}
end;


class function TSchdHidden.GetJobStateEx( ADataset: TDataSet ): TJobState;

  function _EnsureFieldExistsInDataSet( AFieldName: string ): Boolean;
  begin
    if not Assigned(ADataSet.FindField( AFieldName )) then
    begin
      IQError(Format('Field %s must be present in the dataset %s - operation aborted.', [ AFieldName, ADataset ]));
      Result:= FALSE;
    end;
    Result:= TRUE;
  end;

begin
  Result:= jsNone;
  if not _EnsureFieldExistsInDataSet('DOWN_IDLE') or
     not _EnsureFieldExistsInDataSet('START_TIME') or
     not _EnsureFieldExistsInDataSet('PROD_START_TIME') or
     not _EnsureFieldExistsInDataSet('WO_Origin') or
     not _EnsureFieldExistsInDataSet('Maybe_On_Time_Count') then
  begin
    EXIT;
  end;

  with ADataSet do
    if FieldByName('DOWN_IDLE').asInteger in [1,2] then
       Result:= jsScheduledDown
    else if (FieldByName('START_TIME').asDateTime = 0) then         // Should not happen
       Result:= jsNone
    // else if FieldByName('sndop_dispatch_id').asFloat > 0 then
    //    begin
    //      if FieldByName('Assy1_End_Time').asDateTime > FieldByName('end_time').asDateTime then
    //         Result:= jsLate
    //      else
    //         Result:= jsOnTime
    //    end
    else if FieldByName('PROD_START_TIME').asDateTime <= FieldByName('START_TIME').asDateTime then
       begin
         if FieldByName('WO_Origin').asString = 'FORECAST' then
            Result:= jsOnTimeForecast
         else
            Result:= jsOnTime
       end
    else if FieldByName('Maybe_On_Time_Count').asInteger > 0 then
       Result:= jsMaybeOnTime
    else
       begin
         if FieldByName('WO_Origin').asString = 'FORECAST' then
            Result:= jsLateForecast
         else
            Result:= jsLate
       end
end;


procedure TSchdHidden.AdjustShowWorkorderDetails;
begin
  // overriden in SchdText
end;

procedure TSchdHidden.CheckAdjustSetupHrs( var ASetupHrs: Real; AWorkorder_ID: Real );
var
  AStandard_ID: Real;
begin
  AStandard_ID:= SelectValueByID('standard_id', 'workorder', AWorkorder_ID);
  if not IQMS.Common.MfgShare.CompareMfgType( 'TREATMENT', AStandard_ID ) then
     EXIT;

  // TREATMENT setuphrs (load and unload) are included in the prod hrs - do not count them
  ASetupHrs:= 0; // for now keep it as 0. SelectValueByID('nvl(setuphrs,0) + nvl(setuphrs2,0)', 'standard', AStandard_ID);
end;


end.
