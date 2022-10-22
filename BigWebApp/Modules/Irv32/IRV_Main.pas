unit IRV_Main;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  System.ImageList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniImageList,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmIRV32 = class(TUniForm)
    SrcPTAllocate: TDataSource;
    funcGet_Max_Level: TFDStoredProc;
    procProcess_Level: TFDStoredProc;
    StatusBar1: TUniStatusBar;
    StoredProc1: TFDStoredProc;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    QryDistinctMfgs: TFDQuery;
    QryPtBucket: TFDQuery;
    QryPtBucketID: TBCDField;
    QryPtBucketSTANDARD_ID: TBCDField;
    QryPtBucketSEQ: TBCDField;
    QryPtBucketBUCKET_START: TDateTimeField;
    QryPtBucketBUCKET_END: TDateTimeField;
    QryPtBucketCYCLES_REQ: TBCDField;
    SrcPTBucket: TDataSource;
    Panel4: TUniPanel;
    IQJump1: TIQWebJump;
    IQJump2: TIQWebJump;
    PopupMenu1: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    JumptoBOM1: TUniMenuItem;
    QryPtBucketPRODHRS: TFMTBCDField;
    QryPtBucketEND_TIME: TDateTimeField;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SrcWorkOrd: TDataSource;
    QryWorkOrd: TFDQuery;
    N2: TUniMenuItem;
    GoToID1: TUniMenuItem;
    GoToParent1: TUniMenuItem;
    NetChangeLog1: TUniMenuItem;
    pnlDetails: TUniPanel;
    N3: TUniMenuItem;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Label8: TUniLabel;
    Label9: TUniLabel;
    DBText6: TUniDBEdit;
    DBText7: TUniDBEdit;
    Label5: TUniLabel;
    Label6: TUniLabel;
    DBText8: TUniDBEdit;
    DBText9: TUniDBEdit;
    Label15: TUniLabel;
    Label16: TUniLabel;
    DBText13: TUniDBEdit;
    DBText14: TUniDBEdit;
    Label12: TUniLabel;
    Label14: TUniLabel;
    DBText11: TUniDBEdit;
    DBText12: TUniDBEdit;
    Label7: TUniLabel;
    DBText10: TUniDBEdit;
    Label1: TUniLabel;
    DBText19: TUniDBEdit;
    TabSheet2: TUniTabSheet;
    TabSheet3: TUniTabSheet;
    Label2: TUniLabel;
    DBText1: TUniDBEdit;
    DBText2: TUniDBEdit;
    DBText3: TUniDBEdit;
    Label3: TUniLabel;
    DBText4: TUniDBEdit;
    Label4: TUniLabel;
    DBText5: TUniDBEdit;
    Label11: TUniLabel;
    Label13: TUniLabel;
    DBText15: TUniDBEdit;
    Label10: TUniLabel;
    DBText16: TUniDBEdit;
    DBText17: TUniDBEdit;
    Label17: TUniLabel;
    Label18: TUniLabel;
    DBText18: TUniDBEdit;
    Label19: TUniLabel;
    Label20: TUniLabel;
    DBText20: TUniDBEdit;
    Splitter6: TUniSplitter;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    ListBox1: TUniListBox;
    edStatus: TUniEdit;
    splitDetails: TUniSplitter;
    Panel5: TUniPanel;
    btnRun: TUniButton;
    Contents1: TUniMenuItem;
    TabSheet4: TUniTabSheet;
    DBGrid2: TUniDBGrid;
    SrcPtAlloc_Log: TDataSource;
    QryPtAlloc_Log: TFDQuery;
    QryPtAlloc_LogTEXT: TStringField;
    QryPtAlloc_LogID: TBCDField;
    IQSearch1: TIQUniGridControl;
    QryPTAllocate: TFDQuery;
    QryPTAllocateID: TBCDField;
    QryPTAllocateORDER_ID: TBCDField;
    QryPTAllocateORD_DETAIL_ID: TBCDField;
    QryPTAllocateREQUEST_DATE: TDateTimeField;
    QryPTAllocatePROMISE_DATE: TDateTimeField;
    QryPTAllocateMUST_SHIP_DATE: TDateTimeField;
    QryPTAllocateMUST_START_DATE: TDateTimeField;
    QryPTAllocateARINVT_ID: TBCDField;
    QryPTAllocatePARTNO_ID: TBCDField;
    QryPTAllocateSHIP_QUAN: TFMTBCDField;
    QryPTAllocateMFG_QUAN: TFMTBCDField;
    QryPTAllocateFG_ALLOCATE: TBCDField;
    QryPTAllocatePO_ALLOCATE: TBCDField;
    QryPTAllocateSCHED_ALLOCATE: TBCDField;
    QryPTAllocateMAX_LEVEL: TBCDField;
    QryPTAllocatePARENT_ID: TBCDField;
    QryPTAllocatePRODHRS: TFMTBCDField;
    QryPTAllocateCYCLES_REQ: TBCDField;
    QryPTAllocateSTANDARD_ID: TBCDField;
    QryPTAllocatePTBUCKET_ID: TBCDField;
    QryPTAllocateWO_FIRM_ALLOCATE: TBCDField;
    QryPTAllocateOPMAT_STANDARD_ID: TBCDField;
    QryPTAllocateORIGIN: TStringField;
    QryPTAllocateFORE_DTL_ID: TBCDField;
    QryPTAllocateOVERLAP_HRS: TBCDField;
    QryPTAllocateNOTE1: TStringField;
    QryPTAllocateSCHED_EX_ALLOCATE: TFMTBCDField;
    QryPTAllocateITEMNO: TStringField;
    QryPTAllocateDESCRIP: TStringField;
    QryPTAllocateREV: TStringField;
    QryPTAllocateCLASS: TStringField;
    QryPTAllocateMFGNO: TStringField;
    QryPTAllocateORDERNO: TStringField;
    QryPTAllocateBUCKET: TBCDField;
    QryPTAllocateORDER_TYPE: TStringField;
    QryPTAllocateDIVISION_ID: TBCDField;
    Troubleshooting1: TUniMenuItem;
    VerifyCurrentlyRunningMfgUniqueness1: TUniMenuItem;
    QryPTAllocateMAKE_TO_ORDER_ALLOC: TFMTBCDField;
    ExistingLocks1: TUniMenuItem;
    QryPTAllocateBATCH_SIZE: TFMTBCDField;
    QryPTAllocateDESCRIP2: TStringField;
    ImageList1: TUniImageList;
    procAuto_Load_Process: TFDStoredProc;
    procAssignConsumed: TFDStoredProc;
    procedure btnRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoBOM1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure pnlDBtextsResize(Sender: TObject);
    procedure GoToID1Click(Sender: TObject);
    procedure GoToParent1Click(Sender: TObject);
    procedure NetChangeLog1Click(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure QryPTAllocateAfterOpen(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure VerifyCurrentlyRunningMfgUniqueness1Click(Sender: TObject);
    procedure ExistingLocks1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TUniStatusBar;
      Panel: TUniStatusPanel; const Rect: TRect);
  private
    { Private declarations }
    dStart:TDateTime;
    FIRV32Failed: Boolean;
    procedure StartTimer;
    procedure StopTimer( S : string );
    procedure ExecStoredProc( AName : string );

    function GetStatus:string;
    procedure SetStatus( const S: string );
    procedure GroupMfgIntoBuckets( ALevel: Integer );
    procedure RunSimpleQuery( ATitle, ASQL: string );
    class function GetLastRecalcDate: TDateTime;
    procedure DisplayLastRecalcDate;
    procedure BeforeGroupIntoBuckets(ALevel: Integer);
    procedure RunAutoLoad;
    procedure AssignConsumedItems(I: Integer);
  public
    { Public declarations }
    FIQIrv32LockHandle:string;

    property Status:string read GetStatus write SetStatus;
    property IQIrv32LockHandle: string read FIQIrv32LockHandle write FIQIrv32LockHandle;

    procedure BeginRun;
    procedure EndRun;

    function Get_Max_Level:Integer;
    procedure AllocateByLevels;
    procedure Process_Level( I : Integer );
    function RecalcCapacity: Boolean;
    class function GetLastRecalcDateAsStringEx: string;
    class function GetLastRecalcDateAsString: string;
  end;

procedure DoIRV32(const AIQIrv32LockHandle: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RegFrm,
  DayHrs,
  MainModule,
  IQMS.Common.Dialogs,
  IQMS.Common.Locks,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.HelpHook,
  IQMS.Common.GridBase,
  IQMS.Common.ExistingLocks,
{ TODO -oGPatil -cWebConvert : Dependency on the following Files.
  EventLog,  }
  IQMS.Common.Numbers,
  uniDBText,
  uniGroupBox;

procedure DoIRV32(const AIQIrv32LockHandle: string );
var
  LFrmIRV32 : TFrmIRV32;
begin
  LFrmIRV32 := TFrmIRV32.Create(UniGUIApplication.UniApplication);
  LFrmIRV32.IQIrv32LockHandle:= AIQIrv32LockHandle;
  LFrmIRV32.Show;
end;

procedure TFrmIRV32.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, pnlDetails ] );

  DisplayLastRecalcDate;

  pnlDetails.Top:= 0;  {ensure StatusBar is at the bottom}
  splitDetails.Top:= 0;
end;

procedure TFrmIRV32.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlDetails ] );
end;

function TFrmIRV32.GetStatus:string;
begin
  Result:= edStatus.Text;
end;

procedure TFrmIRV32.SetStatus( const S: string );
begin
  edStatus.Text:= S;
  edStatus.Update;
end;

procedure TFrmIRV32.StartTimer;
begin
  dStart:= Now;
end;

procedure TFrmIRV32.StopTimer( S : string );
var
  I: Integer;
  T: string;
begin
  for I:= 1 to Occurances( ';', S ) + 1 do
  begin
    T:= GetToken( S, ';', I );
    if Trim(T) <> '' then
       ListBox1.Items.Add( Format( '%-30s Time = %10.4f sec', [  T, (Now - dStart)*86400 ]))
    else
       ListBox1.Items.Add( '' );
  end;
  ListBox1.Update;
end;

procedure TFrmIRV32.btnRunClick(Sender: TObject);
var
  ANow: TDateTime;
  AResult: Boolean;
begin
  if not IQConfirmYN('Are you sure you want to run Update Schedule?'#13#13+
                     Format('Last Recalc: %s', [ GetLastRecalcDateAsString() ])) then
     EXIT;

  DisplayLastRecalcDate;

  BeginRun;
  try
    ExecuteCommand('begin misc.eplant_preserve_null_id:= 1; end;');
    try
       ANow:= Now;

       StartTimer;
          ExecStoredProc( 'IRV32.BEFORE_RUN' );
       StopTimer('Before_Run - Init');

       StartTimer;
          ExecStoredProc( 'IRV32.RESET_MFG_QUAN' );
       StopTimer('Reset_Mfg_Quan');

       StartTimer;
          ExecStoredProc( 'IRV32.SET_BACKLOG_ARINVT_ORDERS' );
       StopTimer('Set_Backlog_Ord');

       StartTimer;
          AllocateByLevels;
       StopTimer('Allocate/Bucket by Levels');

       //StartTimer;
       //   BeforeGroupIntoBuckets;
       //StopTimer('BeforeGroupIntoBuckets');

       //StartTimer;
       //   GroupMfgIntoBuckets;
       //StopTimer('GroupIntoBuckets');

       StartTimer;
          ExecStoredProc( 'IRV32.MERGE_WITH_WORKORDERS');
       StopTimer('Merge Workorders');

       StartTimer;
          ExecStoredProc( 'IRV32.AFTER_RUN' );
       StopTimer('After_Run - Free');

       StartTimer;
          ExecStoredProc( 'MPS.ASSIGN_EXCEPTIONS' );
       StopTimer('MPS - Assign_Exceptions');

       dStart:= ANow;
       StopTimer(';IRV32 Total');

       if GetSwitch('sched_run_auto_load', 'params') = 'Y' then
       begin
         StartTimer;
         RunAutoLoad;
         StopTimer(';Auto Load Total');
       end;

       StartTimer;
          AResult:= RecalcCapacity;
       StopTimer(';Recalc Capacity Total');
       if not AResult then raise Exception.Create('Failed to Recalc Capacity');

       dStart:= ANow;
       StopTimer(';Grand Total');

    except on E:Exception do
       begin
          FIRV32Failed:= TRUE;
          Status:= 'IRV32 Run Failed: '+E.Message;
          raise;
       end;
    end;
  finally
    ExecuteCommand('begin misc.eplant_preserve_null_id:= 0; end;');

    EndRun;
  end;
end;

procedure TFrmIRV32.BeginRun;
var
  S:string;
  AUserName: string;
begin
  FIRV32Failed:= FALSE;
{ TODO -oGPatil -cWebConvert : Dependency on db_dm.pas  File
  with DB_DataModule do
  begin
    S:= IQLock( FIQIrv32LockHandle, IQLOCK_EXCLUSIVE );
    if S > '' then
    begin
      AUserName:= Trim(SelectValueFmtAsString('select user_name from iqsemaphore where lock_name = ''%s''', [ IQMS.Common.Locks.IQMS_IRV32 ]));
      if AUserName > '' then
         raise Exception.CreateFmt('Failed to acquire exclusive lock. Possible cause - somebody else (%s) is using scheduling module. '#13'Please try again later', [ AUserName ])
      else
         raise Exception.Create   ('Failed to acquire exclusive lock. Possible cause - somebody else is using scheduling module. '#13'Please try again later');
    end;
    Register_Exclusive_Lock( IQMS_IRV32 );
  end;          }

  ExecuteCommand('begin dd.set_disable_check_mandatory(1); end;'); // disable user defined triggers to check mandatory cols);

  btnRun.Enabled:= FALSE;

  ListBox1.Clear;
  QryPTAllocate.Close;
end;

procedure TFrmIRV32.EndRun;
var
  S:string;
  ASuccess: string;
begin
  ASuccess:= sIIf( FIRV32Failed, 'false', 'true');
  ExecuteCommandFmt('begin irv32.end_run( %s ); end;', [ ASuccess ]);

  ExecuteCommand('begin dd.set_disable_check_mandatory(0); end;'); // enable user defined triggers to check mandatory cols

  if not FIRV32Failed then
    Status:= 'IRV32 - Finished Successfully';
    // ExecuteCommand('begin irv32.end_run; end;');

  DisplayLastRecalcDate;

  ExecuteCommandFmt('insert into eventlog( Event_Time, UserID, Text, class ) values ( sysdate, ''%s'', ''%s'', ''IRV32 INFO'')',
            [ SecurityManager.UserName, FixStr(Status) ]);

  btnRun.Enabled:= TRUE;
  IQSetTablesActive( FALSE, self );
  IQSetTablesActive( TRUE, self );

  { TODO -oGPatil -cWebConvert : Dependency on db_dm.pas File
  with DB_DataModule do
    //S:= IQConvertLock( FIQIrv32LockHandle, IQLOCK_SHARED );
    S:= IQUnLock( IQIrv32LockHandle );   }
  if S > '' then
    IQWarning( S + ' - Unable to release exclusive lock. Terminate to allow other users to run scheduling module');

  PostMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0 );
end;

procedure TFrmIRV32.ExecStoredProc( AName : string );
begin
  Status:= ProperCase( AName );
  with StoredProc1 do
  begin
    Close;
    Params.Clear;
    SchemaName:= 'IQMS';
    PackageName:= IQMS.Common.StringUtils.StrBeforeDot( AName );
    StoredProcName:= IQMS.Common.StringUtils.StrAfterDot( AName );
    //Prepare;
    ExecProc;
  end;
end;

procedure TFrmIRV32.AllocateByLevels;
var
  I: Integer;
begin
  I:= 0;
  repeat
    Status:= Format('Allocating and grouping in buckets level %d ...', [ I ]);

    Process_Level( I );
    BeforeGroupIntoBuckets( I );
    GroupMfgIntoBuckets( I );
    AssignConsumedItems( I );

    Inc( I );
  until I > Get_Max_Level;
end;

procedure TFrmIRV32.Process_Level( I : Integer );
begin
  with procProcess_Level do
  begin
    Close;
    ParamByName('v_level').Value:= I;
    // Prepare;
    ExecProc;
  end;
end;



function TFrmIRV32.Get_Max_Level:Integer;
{delete ptallocate and re-populate based on orders}
begin
  with funcGet_Max_Level do
  begin
    Close;
    // Prepare;
    ExecProc;
    Result:= Params[ 0 ].asInteger;
  end;
end;


procedure TFrmIRV32.BeforeGroupIntoBuckets(  ALevel: Integer );
begin
  ExecuteCommandFmt('begin irv32.before_create_mfg_buckets( %d ); end;', [ ALevel ]);
end;

procedure TFrmIRV32.GroupMfgIntoBuckets( ALevel: Integer );
begin
  with QryDistinctMfgs do
  begin
    Close;
    ParamByName('processed_level').Value:= ALevel;
    Open;

    while not Eof do
    begin
      Status:= Format('Buckets for Mfg# %s', [ FieldByName('mfgno').asString ]);

      ExecuteCommandFmt('begin                                 '+
                '  irv32.Create_Mfg_Buckets( %f,       '+                 // v_standard_id
                '                            ''%s'',   '+                 // v_origin
                '                            %s,       '+                 // division_id (used for AUTO_MRP)
                '                            ''%s'',   '+                 // order_type  (AUTO_MRP or null )
                '                            %s,       '+                 // make_to_order_detail_id
                '                            %s );     '+                 // complex_standard_id
                'end;                                  ',
                [ FieldByName('standard_id').asFloat,
                  Trim( FieldByName('origin').asString),
                  IQFieldAsStr(FieldByName('division_id')),               // division_id is always NULL
                  Trim( FieldByName('order_type').asString),              // unless order_type = AUTO-MRP
                  IQFieldAsStr(FieldByName('make_to_order_detail_id')),   // normally null unless this is make-to-order sales order
                  IQFieldAsStr(FieldByName('complex_standard_id')) ]);    // normally null unless this is a part of complex BOM
      Next;
    end;
  end;
end;


procedure TFrmIRV32.AssignConsumedItems( I: Integer );
begin
  with procAssignConsumed do  // irv32.assign_consumed_items_by_level
  begin
    Close;
    ParamByName('v_level').Value:= I;
    ExecProc;
  end;
end;


procedure TFrmIRV32.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIRV32.JumptoInventory1Click(Sender: TObject);
begin
  IQJump1.Execute;
end;

procedure TFrmIRV32.JumptoBOM1Click(Sender: TObject);
begin
  IQJump2.Execute;
end;

procedure TFrmIRV32.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmIRV32.pnlDBtextsResize(Sender: TObject);
var
  I:Integer;
begin
  //for I:= 0 to pnlDBtexts.ControlCount - 1 do
  //  if pnlDBtexts.Controls[ I ] is TDBText then with pnlDBtexts.Controls[ I ] as TDBText do
  //     Width:= pnlDBtexts.Width - Left;
end;

function TFrmIRV32.RecalcCapacity: Boolean;
var
  AList: TStringList;
  I    : Integer;
begin
  //if not chkRecalcCapacity.Checked then EXIT;
  Status:= 'Recalculate Capacity, Available Hours, Projected Parts and Material Required';
  AList:= TStringList.Create;
  try
    Result:= DoDayHrs(TRUE, AList );

    ListBox1.Items.Add( '' );
    for I:= 0 to AList.Count - 1 do
      ListBox1.Items.Add( AList[ I ])
  finally
    AList.Free;
  end;
end;


procedure TFrmIRV32.GoToID1Click(Sender: TObject);
var
  S : string;
  ID: Real;
begin
  S:= '';
  if InputQuery('Go To ID ...', 'Enter ID', S ) then
  begin
    ID:= StrToFloat(S);
    QryPTAllocate.Locate('ID', ID, []);
  end;
end;

procedure TFrmIRV32.GoToParent1Click(Sender: TObject);
begin
  with QryPTAllocate do
    if FieldByName('parent_id').asFloat > 0 then
       Locate('ID', FieldByName('parent_id').asFloat, []);
end;

procedure TFrmIRV32.NetChangeLog1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on EventLog.pas File
  ShowEventLogClassOf( 'NET CHANGE'); {EventLog.pas}
end;

procedure TFrmIRV32.Panel3Resize(Sender: TObject);
var
  I: Integer;
  AGroupBox: TUniGroupBox;
begin
  with (Sender as TUniPanel) do
    for I:= 0 to ControlCount - 1 do
      if Controls[ I ] is TUniGroupBox then
      begin
        AGroupBox:= TUniGroupBox(Controls[ I ]);
        BREAK;
      end;

  if Assigned(AGroupBox) then with AGroupBox do
    for I:= 0 to ControlCount - 1 do
      if Controls[ I ] is TUniDBText then with Controls[ I ] as TUniDBText do
        if Tag = 1 then
          Width:= AGroupBox.ClientWidth - Left - 2;
end;

procedure TFrmIRV32.QryPTAllocateAfterOpen(DataSet: TDataSet);
begin
  StatusBar1.Panels[ 0 ].Text:= Format('%d records', [ Trunc( SelectValueAsFloat( 'select count(*) from ptallocate' ))]);
end;

procedure TFrmIRV32.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmIRV32.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmWORKORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmIRV32.VerifyCurrentlyRunningMfgUniqueness1Click(Sender: TObject);
begin
  RunSimpleQuery( 'Same Mfg# in the 1-st position',
                  'select wc.eqno,                                                    '+
                  '       wc.mfg_type,                                                '+
                  '       js.work_center_id,                                          '+
                  '       js.workorder_id,                                            '+
                  '       s.mfgno                                                     '+
                  '  from                                                             '+
                  '       work_center wc,                                             '+
                  '       (select id as work_center_id, standard_id, workorder_id     '+
                  '          from v_scheduled_workorders                              '+
                  '         where cntr_seq = 1                                        '+
                  '           and standard_id in                                      '+
                  '                          ( select standard_id                     '+
                  '                              from v_scheduled_workorders          '+
                  '                             where cntr_seq = 1                    '+
                  '                               and parent_id is null               '+
                  '                             group by standard_id                  '+
                  '                            having count( standard_id ) > 1 )) js, '+
                  '       standard s                                                  '+
                  ' where                                                             '+
                  '       wc.id = js.work_center_id                                   '+
                  '   and s.id = js.standard_id                                       '+
                  '   and not (mfg.lookup_mfgtype( s.mfg_type ) in                    '+
                  '                              (''ASSY1'', ''ASSY2'', ''ASSY3''))   ');
end;

procedure TFrmIRV32.RunSimpleQuery( ATitle, ASQL: string );
var
  LFrmIQGridBase : TFrmIQGridBase;
begin
  LFrmIQGridBase := TFrmIQGridBase.Create(UniGUIApplication.UniApplication);  {IQGridBase.pas}
  Caption:= ATitle;

  LFrmIQGridBase.Query1.Close;
  LFrmIQGridBase.Query1.SQL.Clear;
  LFrmIQGridBase.Query1.SQL.Add( ASQL );
  LFrmIQGridBase.Query1.Open;

  LFrmIQGridBase.ShowModal;
end;

procedure TFrmIRV32.ExistingLocks1Click(Sender: TObject);
begin
  TFrmExistingLocks.DoShowModal( IQMS.Common.Locks.IQMS_IRV32 );  {existing_locks.pas}
end;

class function TFrmIRV32.GetLastRecalcDate: TDateTime;
begin
  Result:= SelectValueAsFloat('select update_sched_last_exec from params');
end;

procedure TFrmIRV32.DisplayLastRecalcDate;
begin
  StatusBar1.Panels[ 1 ].Text:= TFrmIRV32.GetLastRecalcDateAsStringEx();  // this unit and class
end;

class function TFrmIRV32.GetLastRecalcDateAsStringEx: string;
var
  S: string;
begin
  S:= GetLastRecalcDateAsString();
  if (S = 'N/A') and (SelectValueAsFloat('select 1 from eventlog where class = ''IRV32 INFO'' and rownum < 2') = 1) then
     {if last exec date is null and this is not the very first time they run IRV then say ERROR}
     Result:= 'Last Recalc: ERROR - see eventlog'
  else
     Result:= Format('Last Recalc: %s', [ S ]);
end;

class function TFrmIRV32.GetLastRecalcDateAsString: string;
var
  ADate: TDateTime;
  S: string;
begin
  ADate:= GetLastRecalcDate();
  if ADate > 0 then
     Result:= DateTimeToStr( ADate )
  else
     Result:= 'N/A';
end;

procedure TFrmIRV32.StatusBar1DrawPanel(StatusBar: TUniStatusBar;
  Panel: TUniStatusPanel; const Rect: TRect);
begin
{ TODO -oGPatil -cWebConvert : TUniStatusBar does not contain a member named Canvas
  if (Panel.Style = psOwnerDraw) and (Panel.Index = 1) then
     with StatusBar1.Canvas do
     begin
       if Pos('ERROR', Panel.Text) > 0 then
          begin
             Font.Color:= clRed;
             Imagelist1.Draw( StatusBar1.Canvas, Rect.Left, Rect.Top, 1);
          end
       else
          begin
             Font.Color:= clBlack;
             Imagelist1.Draw( StatusBar1.Canvas, Rect.Left, Rect.Top, 0);
          end;
       TextOut( Rect.Left + 20, Rect.Top + 1, Panel.Text );
     end;  }
end;


procedure TFrmIRV32.RunAutoLoad;
var
  AList: TStringList;
  I: Integer;
  AEPlant_ID: Real;
begin
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, 'select id from eplant order by id');
    if AList.Count = 0 then
       AList.Add('0');

    for I:= 0 to AList.Count - 1 do
      with procAuto_Load_Process do
      begin
        AEPlant_ID:= StrToFloat(AList[ I ]);
        if AEPlant_ID > 0 then
           ParamByName('v_eplant_id').asFMTBcd:= AEPlant_ID
        else
           ParamByName('v_eplant_id').Clear;

        ParamByName('v_mfgcell_id').Clear;

        ExecProc;
      end;
  finally
    AList.Free;
  end;
end;


end.
