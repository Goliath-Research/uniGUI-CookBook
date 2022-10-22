unit GL;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Tabnotbk,
  Vcl.Menus,
  Vcl.Buttons,
  Data.DB,
  DM_GL,
  Mask,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  { TODO -oathite -cWebConvert : Depends on GLACCTTP
  GLAcctTP, }
  IQMS.Common.PanelMsg,
  IQMS.Common.UserMessages,
  IQMS.WebVcl.UDEmbeddedForm,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniImageList,
  uniTreeView,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TGLCargo = class
     ID  : Real;
     Desc: string;
  end;

type
  TTreeViewCargo = class
    sId         : Real;
    sParentId   : Real;
    constructor Create(AID, AParentId: Real);
  end;


type
  TFrmGLMain = class(TUniForm)
    MainMenu1: TUniMainMenu;
    GL1: TUniMenuItem;
    New1: TUniMenuItem;
    Delete1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    Options1: TUniMenuItem;
    Reports1: TUniMenuItem;
    mnSysParams: TUniMenuItem;
    Other1: TUniMenuItem;
    sbtnSearch: TUniSpeedButton;
    N5: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Budgets1: TUniMenuItem;
    navMain: TUniDBNavigator;
    CreateBudgets1: TUniMenuItem;
    CreateBudgetGroups1: TUniMenuItem;
    DefinePeriods1: TUniMenuItem;
    AccountMask1: TUniMenuItem;
    N9: TUniMenuItem;
    Search1: TUniMenuItem;
    DefineSubAccts1: TUniMenuItem;
    YearEndClosing1: TUniMenuItem;
    N11: TUniMenuItem;
    AccountActivity1: TUniMenuItem;
    Replicate1: TUniMenuItem;
    N12: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    UserDefined1: TUniMenuItem;
    JournalEntries1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PopupMenu1: TUniPopupMenu;
    ShowTotals1: TUniMenuItem;
    Recalculate1: TUniMenuItem;
    PopupMenu2: TUniPopupMenu;
    ShowTotals2: TUniMenuItem;
    Recalculate2: TUniMenuItem;
    Diff1: TUniMenuItem;
    N2: TUniMenuItem;
    N3: TUniMenuItem;
    N4: TUniMenuItem;
    TrialBalance1: TUniMenuItem;
    N6: TUniMenuItem;
    Bankmanager1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    Budget1: TUniMenuItem;
    N7: TUniMenuItem;
    QryAcctType: TFDQuery;
    AccountTypeMaint1: TUniMenuItem;
    PopupMenu3: TUniPopupMenu;
    FullExpand1: TUniMenuItem;
    FullCollapse1: TUniMenuItem;
    ImageList1: TUniImageList;
    PageControl2: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    TabTreeView: TUniTabSheet;
    TV: TUniTreeView;
    SrcGlSubAcctType: TDataSource;
    QrySubAcctType: TFDQuery;
    Panel2: TUniPanel;
    sbtnExpand: TUniSpeedButton;
    sbtnCollapse: TUniSpeedButton;
    N8: TUniMenuItem;
    ReferenceCodes1: TUniMenuItem;
    BrowseGLBatches1: TUniMenuItem;
    Contents1: TUniMenuItem;
    AccountRevaluation1: TUniMenuItem;
    sbEActivity: TUniSpeedButton;
    QryTreeView: TFDQuery;
    QryTreeViewGL_SUBACCT_TYPE_ID: TBCDField;
    QryTreeViewACCT: TStringField;
    QryTreeViewDESCRIP: TStringField;
    QryTreeViewYEAR_END_BALANCE: TFMTBCDField;
    Debug1: TUniMenuItem;
    Show1: TUniMenuItem;
    sbtnUpdateFinRpt: TUniSpeedButton;
    QryTreeViewEPLANT_ID: TBCDField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlFormLeft1: TUniPanel;
    PnlFormClient1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    lblEPlant: TUniLabel;
    dbeAcctNumber: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    dblcAcctType: TUniDBLookupComboBox;
    dbCorVu: TUniDBComboBox;
    dbePlant: TUniDBEdit;
    sbAcctType: TUniSpeedButton;
    sbtnEPlant: TUniSpeedButton;
    Label8: TUniLabel;
    dbHideFromPK: TUniDBCheckBox;
    dbHideFromGL: TUniDBCheckBox;
    dbHideFromAP: TUniDBCheckBox;
    dbHideFromAR: TUniDBCheckBox;
    Panel3: TUniPanel;
    sbtnRefresh: TUniSpeedButton;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    DBCheckBox2: TUniDBCheckBox;
    Panel4: TUniPanel;
    Splitter2: TUniSplitter;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    IQUDEmbeddedForm1: TIQWebUDEmbeddedForm;
    EnableUserDefinedForm1: TUniMenuItem;
    MergeHistoryDeleteGeneralLedgerAccounts1: TUniMenuItem;
    gridAccounts: TIQUniGridControl;
    wwDBComboDlg1: TUniEdit;
    wwDBComboDlg2: TUniEdit;
    PopupMenu4: TUniPopupMenu;
    DelecteactivityfromCTRIALBALANCEASOF1: TUniMenuItem;
    procedure mnSysParamsClick(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure CreateBudgets1Click(Sender: TObject);
    procedure CreateBudgetGroups1Click(Sender: TObject);
    procedure DefinePeriods1Click(Sender: TObject);
    procedure AccountMask1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BudgetComparisons1Click(Sender: TObject);
    procedure DefineSubAccts1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AccountActivity1Click(Sender: TObject);
    procedure Replicate1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Other1Click(Sender: TObject);
    procedure UserDefined1Click(Sender: TObject);
    procedure LookupCBoxAcctSubTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridAccountsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gridAccountsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LookupCBoxAcctSubTypeDropDown(Sender: TObject);
    procedure InvokeNavigator(Sender: TObject);
    procedure JournalEntries1Click(Sender: TObject);
    procedure TrialBalance1Click(Sender: TObject);
    procedure Bankmanager1Click(Sender: TObject);
    procedure Budget1Click(Sender: TObject);
    procedure AccountTypeMaint1Click(Sender: TObject);
    procedure gridAccounts1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TVGetImageIndex(Sender: TObject; Node: TUniTreeNode);
    procedure FullExpand1Click(Sender: TObject);
    procedure FullCollapse1Click(Sender: TObject);
    procedure PageControl2Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageControl2Change(Sender: TObject);
    procedure dblcAcctTypeDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dblcAcctTypeDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure sbtnRefreshClick(Sender: TObject);
    procedure ReferenceCodes1Click(Sender: TObject);
    procedure BrowseGLBatches1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure AccountRevaluation1Click(Sender: TObject);
    procedure sbEActivityClick(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnUpdateFinRptClick(Sender: TObject);
    procedure sbtnEPlantClick(Sender: TObject);
    procedure gridAccounts1EditButtonClick(Sender: TObject);
    procedure dbCorVuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnableUserDefinedForm1Click(Sender: TObject);
    procedure MergeHistoryDeleteGeneralLedgerAccounts1Click(Sender: TObject);
    procedure dblcAcctTypeCloseUp(Sender: TObject);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure wwDBComboDlg2CustomDlg(Sender: TObject);
    procedure DelecteactivityfromCTRIALBALANCEASOF1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    hMsg : TPanelMesg;

    procedure CheckForManatoryRecords;
    procedure PrepareAccountDataSheet;
    procedure ClearTreeView;
    procedure LoadTreeView;
    procedure AssignAccounts(Node:TUniTreeNode; nId:Real);
    procedure BuildNodes( APrentNode: TUniTreeNode; TreeLevel: Integer);
    procedure DeleteEmptyNodes;
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
    procedure PrepareForTreeViewLoad;
  public
    { Public declarations }
    DM:TGL_DM;
    { TODO -oathite -cWebConvert : Depends on GLACCTTP
    FAcctType:TFrmGlAcctType;                          }
  end;

procedure DoIQGL;

//var
//  FrmGLMain: TFrmGLMain;

implementation

{$R *.DFM}
uses
  AcctMask,
  Activity,
  { TODO -oathite -cWebConvert : Depends on Batview, BM_Main
  BatView,
  BM_Main,                                          }
  Budgcomp,
  BudgGrp,
  Budgrp,
  { TODO -oathite -cWebConvert : Depends on EActivit
  EActivit, }
  gl_rscstr,
  { TODO -oathite -cWebConvert : Depends on GLBudget
  GLBudget, }
  GLPeriod,
  GLReval,
  GLTrialB,
  IQMS.Common.Applications,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  { TODO -oathite -cWebConvert : Depends on Journal
  Journal, }
  MergeAndDelGL,
  { TODO -oathite -cWebConvert : Depends on Ref_Code
  Ref_Code, }
  { TODO -oathite -cWebConvert : Depends on Replicat
  Replicat, }
  IQMS.COmmon.SetPlant,
  Subacct;
  { TODO -oathite -cWebConvert : Depends on Sys, Upd_Fin
  Sys,
  Upd_Fin;                                            }

procedure DoIQGL;
begin
  TFrmGLMain.Create( UniApplication ).Show;
end;

constructor TTreeViewCargo.Create(AID, AParentId: Real);
begin
  sID         := AID       ;
  sParentId   := AParentId ;
end;

procedure TFrmGLMain.FormCreate(Sender: TObject);
var
  I:Integer;
begin
  DM:= TGL_DM.Create( self );

  IQSetTablesActiveEx( TRUE, DM, gl_rscstr.cTXT0000047 {'Accessing Chart of Accounts.  Please wait.'} );
  IQSetTablesActiveEx( TRUE, self, gl_rscstr.cTXT0000047 {'Accessing Chart of Accounts.  Please wait.'}  );
  IQRegFormRead( self, [ self, gridAccounts, PnlFormLeft1, Panel4 ]);
  gridAccounts.DataSource:= NIL;
  PageControl2.ActivePage := TabForm;
  CheckForManatoryRecords;
  // SecurityManager.SetVisibleIfLicensed( sbtnEConsolidate, NIL, NIL, IQAppsNames[ apGLConsolidation ], SR );
  SecurityManager.SetVisibleIfLicensed( sbEActivity, NIL, NIL, IQAppsNames[ apGLConsolidation ], SR );
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlFormClient1);
end;

procedure TFrmGLMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I:Integer;
begin
  IQRegFormWrite( self, [ self, gridAccounts, PnlFormLeft1, Panel4 ]);
  IQSetTablesActive( FALSE, DM );
end;

procedure TFrmGLMain.FormDestroy(Sender: TObject);
begin
  Application.OnHint:= NIL;
end;

procedure TFrmGLMain.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmGLMain.CheckForManatoryRecords;
var
  nId:Real;
begin
  if SelectValueFmtAsFloat('select id from %s where descrip = ''%s'' and parent_id is NULL', ['GLSUB_ACCT_TYPE', 'ASSET']) =  0
    then ExecuteCommandFmt('insert into %s (descrip) values (''%s'')',  ['GLSUB_ACCT_TYPE', 'ASSET']);
  if SelectValueFmtAsFloat('select id from %s where descrip = ''%s'' and parent_id is NULL', ['GLSUB_ACCT_TYPE', 'LIABILITY']) =  0
    then ExecuteCommandFmt('insert into %s (descrip) values (''%s'')',  ['GLSUB_ACCT_TYPE', 'LIABILITY']);
  if SelectValueFmtAsFloat('select id from %s where descrip = ''%s'' and parent_id is NULL', ['GLSUB_ACCT_TYPE', 'REVENUE']) =  0
    then ExecuteCommandFmt('insert into %s (descrip) values (''%s'')',  ['GLSUB_ACCT_TYPE', 'REVENUE']);
  if SelectValueFmtAsFloat('select id from %s where descrip = ''%s'' and parent_id is NULL', ['GLSUB_ACCT_TYPE', 'EXPENSE']) =  0
    then ExecuteCommandFmt('insert into %s (descrip) values (''%s'')',  ['GLSUB_ACCT_TYPE', 'EXPENSE']);
  if SelectValueFmtAsFloat('select id from %s where descrip = ''%s'' and parent_id is NULL', ['GLSUB_ACCT_TYPE', 'STATISTICAL']) =  0
    then ExecuteCommandFmt('insert into %s (descrip) values (''%s'')',  ['GLSUB_ACCT_TYPE', 'STATISTICAL']);

  nId := SelectValueFmtAsFloat('select id from %s where descrip = ''%s'' and parent_id is NULL', ['GLSUB_ACCT_TYPE', 'OWNERS EQUITY']);
  if nId = 0 then
  begin
    nId := GetNextID('GLSUB_ACCT_TYPE');
    ExecuteCommandFmt('insert into %s (id, descrip) values (%f, ''%s'')',  ['GLSUB_ACCT_TYPE', nId, 'OWNERS EQUITY']);
    ExecuteCommandFmt('insert into %s (parent_id, descrip) values (%f, ''%s'')',  ['GLSUB_ACCT_TYPE', nId, 'RETAINED EARNINGS']);
  end
  else
    if SelectValueFmtAsFloat('select id from %s where descrip = ''%s'' and parent_id = %f', ['GLSUB_ACCT_TYPE', 'RETAINED EARNINGS', nId]) =  0
      then ExecuteCommandFmt('insert into %s (parent_id, descrip) values (%f, ''%s'')',  ['GLSUB_ACCT_TYPE', nId, 'RETAINED EARNINGS']);
  DM.TblGlAcct.Refresh;
  DM.QryGLSubAcct.Close;
  DM.QryGLSubAcct.Open;
  QrySubAcctType.Close;
  QrySubAcctType.Open;
end;


procedure TFrmGLMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGLMain.PrepareAccountDataSheet;
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'nbInsert'
  if SR.Delete['navMain'] and SR.Insert['navMain']
    then navMain.VisibleButtons:= navMain.VisibleButtons + [ nbInsert, nbDelete ];
  navMain.DataSource := DM.SrcGLAcct; }
end;


procedure TFrmGLMain.sbtnSearchClick(Sender: TObject);
begin
  if sbtnSearch.Enabled then
     with DM.PkGLAcct do
       if Execute then
       begin
          if PageControl2.ActivePage <> TabTreeView then
          begin
             DM.TblGLAcct.Locate( 'ID', GetValue('ID'), [] );
             dblcAcctTypeCloseUp(nil);
          end;
       end;
end;

procedure TFrmGLMain.mnSysParamsClick(Sender: TObject);
begin
  // DoSysParameters( self, DM.TblIQSys );   { sys.pas }
  { TODO -oathite -cWebConvert : Depend on Sys
  DoSysParameters( self, NIL );   { sys.pas }
end;

procedure TFrmGLMain.CreateBudgets1Click(Sender: TObject);
begin
  with TFrmBudGrp.Create(self) do
  try
     Showmodal;
  finally
     Free;
  end;
end;

procedure TFrmGLMain.CreateBudgetGroups1Click(Sender: TObject);
begin
  with TFrmGroups.Create(self) do
  try
     Showmodal;
  finally
     Free;
  end;
end;

procedure TFrmGLMain.DefinePeriods1Click(Sender: TObject);
begin
  DoPeriods; {GLPeriod.pas}
end;

procedure TFrmGLMain.AccountMask1Click(Sender: TObject);
begin
  DoAcctMask;
  DM.TblIQSys.Close;
  DM.TblIQSys.Open;  {will rebuild Size of Account, Department, Division - see DM_GL}
end;

procedure TFrmGLMain.BudgetComparisons1Click(Sender: TObject);
begin
  with TFrmBudgComp.Create(self) do
  try
     ShowModal;
  finally
     Free;
  end;
end;

procedure TFrmGLMain.DefineSubAccts1Click(Sender: TObject);
begin
  DoSubAccounts( NIL{Table} );  { SubAcct.Pas }
  DM.QryGLSubAcct.Close;
  DM.QryGLSubAcct.Open;
end;

procedure TFrmGLMain.AccountActivity1Click(Sender: TObject);
begin
  DoActivity;  {Activity.pas}
end;

procedure TFrmGLMain.Replicate1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on Replicat
  DoReplicateAcct( self ); {Replicat.pas}
end;

procedure TFrmGLMain.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmGLMain.Other1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmGLMain.UniFormShow(Sender: TObject);
begin
  DM.Name:= '';              // Makes the form to look at Local DM
  EnableUserDefinedForm1.Visible := not ViewExists('v_ud_glacct');
  if not EnableUserDefinedForm1.Visible then
    IQUDEmbeddedForm1.Active:= true;

  AccountRevaluation1.Enabled := SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys') = 'Y';
  dblcAcctTypeCloseUp(nil);
end;

procedure TFrmGLMain.UserDefined1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmGLMain.InvokeNavigator(Sender: TObject);
begin
  if NavMain.Enabled then
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'BtnClick'
    if (Sender = New1) and SR.Insert['NavMain'] then
       navMain.BtnClick( nbInsert )
    else if (Sender = Delete1) and SR.Delete['NavMain'] then
       navMain.BtnClick( nbDelete );    }
  end;
end;

procedure TFrmGLMain.LookupCBoxAcctSubTypeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    with DM, TblGLAcct do
    begin
      Edit;
      FieldByName('GL_SUBACCT_TYPE_ID').asString:= '';
      Key:= 0;
    end
end;


{Handle SubAccounts Query here for Form and Grid view}
procedure TFrmGLMain.LookupCBoxAcctSubTypeDropDown(Sender: TObject);
begin
  {put it in the edit mode to change QrySubAcct where clause to include only acct_type}
  DM.TblGLAcct.Edit;
end;

procedure TFrmGLMain.gridAccountsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedField' }
  (*
  {put it in the edit mode to change QrySubAcct where clause to include only acct_type}
  if (Button = mbLeft) and (gridAccounts.SelectedField = DM.TblGLAcctSubAcctType) and (gridAccounts.EditorMode) then
     DM.TblGLAcct.Edit;
  *)
end;

procedure TFrmGLMain.gridAccountsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedField' }
  (*
  {put it in the edit mode to change QrySubAcct where clause to include only acct_type}
  if (Key = VK_RETURN) and (gridAccounts.SelectedField = DM.TblGLAcctSubAcctType) and (not gridAccounts.EditorMode) then
    with DM, TblGLAcct do
    begin
      Edit;
      Key:= 0;
    end;  *)
end;

procedure TFrmGLMain.JournalEntries1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on Journal
  DoGeneralJournal( self ); {Journal.pas}
end;

procedure TFrmGLMain.TrialBalance1Click(Sender: TObject);
begin
  DoTrialBalance;     {GLTrialB.pas}
end;

procedure TFrmGLMain.Bankmanager1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on BM_Main
  DoIQBM;  {BM_Main.pas  in \iqwin\bm\}
end;

procedure TFrmGLMain.Budget1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depend on GLBudget
  DOGLBudget;   {GLBudget.pas}
end;

procedure TFrmGLMain.LoadTreeView;
var
  sMajor, sType, sSubType:string;
  MajorTreeID, TypeTreeID, SubTypeTreeID : TUniTreeNode;
begin
  if SelectValueAsFloat('select glyear_id from iqsys') = 0 then
     // 'Please assign current GL Year in System Parameters before reviewing the GL Tree View of Accounts';
     raise Exception.Create(gl_rscstr.cTXT0000048);

  try
    TV.Items.BeginUpdate;
    IQMS.Common.Controls.IQEnableControl([sbtnExpand, sbtnCollapse,sbtnRefresh], False);
    PrepareForTreeViewLoad;
    BuildNodes(nil, 1);
    DeleteEmptyNodes;
    FullExpand1.Click;
  finally
    TV.Items.EndUpdate;
    if Assigned(hMsg) then FreeAndNil(hMsg);
    IQMS.Common.Controls.IQEnableControl([sbtnExpand, sbtnCollapse,sbtnRefresh], True);
  end;
end;

procedure TFrmGLMain.PrepareForTreeViewLoad;
begin
  hMsg:= hPleaseWait( 'Accessing database, please wait...' );
  ClearTreeView;

  hMsg.Mesg:= 'Accessing database (QryAcctType) ...';
  QryAcctType.Close; QryAcctType.Open;

  hMsg.Mesg:= 'Building Tree View (QryTreeView) ...';
  QryTreeView.Close; QryTreeView.Open;
end;

procedure TFrmGLMain.BuildNodes( APrentNode: TUniTreeNode; TreeLevel: Integer);
var
  QryLevel:Integer;
  cAcctType:String;
  nId    :Real;
  nParentId :Real;
  CurrentNode:TUniTreeNode;
begin
   with QryAcctType do
     while not Eof do
     begin
       cAcctType := FieldByName('descrip').asString;
       QryLevel  := FieldByName('level').asInteger;
       nId       := FieldByName('id').asFloat;
       nParentId := FieldByName('parent_id').asFloat;

       hMsg.Mesg:= Format('Processing %s ...', [ cAcctType ]);

       if QryLevel = TreeLevel then
       begin
         { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
         CurrentNode := TV.Items.AddChildObject( APrentNode, cAcctType, TTreeViewCargo.Create( nId, nParentId ));
         AssignAccounts(CurrentNode, nId);  }
         Next;
       end
       else if QryLevel > TreeLevel then
         BuildNodes(CurrentNode, TreeLevel + 1)
       else
         Exit;
     end;
end;

procedure TFrmGLMain.AssignAccounts(Node:TUniTreeNode; nID:Real);
var
  I:Integer;
  S: string;
begin
  with QryTreeView do
  begin
    S:= IQEPlantFilterExpr; {IQLib}
    if S > '' then
      Filter:= Format( '(%s) and (gl_subacct_type_id = %f)', [ S, nID ])
    else
      Filter:= Format( 'gl_subacct_type_id = %f', [ nID ]);

    First;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
    while not Eof do
    begin
      TV.Items.AddChildObject( Node,
                               Format('%s <%s>  Yr.Bal: %f',
                                      [ FieldByName('acct').asString,
                                        FieldByName('descrip').asString,
                                        FieldByName('year_end_balance').asFloat ]),
                               TTreeViewCargo.Create( 0, 0 ));
      Next;
    end;   }
  end;
  //with TFDQuery.Create(self) do
  //try
  //  Connection := MainModule.FDConnection;
  //  SQL.Add(       'select glacct.acct,                     ' );
  //  SQL.Add(       '       glacct.descrip,                  ' );
  //  SQL.Add(       '       ybb.year_end_balance             ' );
  //  SQL.Add(       '  from glacct,                          ' );
  //  SQL.Add(       '       V_GLACCT_FOR_TREEVIEW ybb,       ' );
  //  SQL.Add(       '      (select glyear_id from iqsys) sys ' );
  //  SQL.Add(Format('where gl_subacct_type_id = %f  ', [ nID ]));
  //  SQL.Add(       '   and ybb.glacct_id = glacct.id        ' );
  //  SQL.Add(       '   and ybb.glyear_id = sys.glyear_id    ' );
  //  Open;
  //  while not eof do
  //  begin
  //    TV.Items.AddChildObject( Node, Format('%s <%s>  Yr.Bal: %m',
  //                             [ FieldByName('acct').asString,
  //                               FieldByName('descrip').asString,
  //                               FieldByName('year_end_balance').asFloat ]),
  //                             TTreeViewCargo.Create( 0, 0));
  //    Next;
  //  end;
  //finally
  //  Free;
  //end;
end;

procedure TFrmGLMain.ClearTreeView;
var
  I:Integer;
  Node: TUniTreeNode;
begin
  //for I:= TV.Items.Count - 1 downto 0 do with TV.Items[ I ] do
  //begin
  //  if Assigned(Data) then
  //     TObject(Data).Free;
  //  Delete;
  //end;

  Node:= TV.Items.GetFirstNode;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNext'
  while Node <> nil do
  begin
    if Assigned(Node.Data) then
       TObject(Node.Data).Free;
    Node := Node.GetNext;
  end;

  TV.Items.Clear;   }
end;


procedure TFrmGLMain.AccountTypeMaint1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
  TODO -oathite -cWebConvert : Depends on GLACCTTP
  gridAccounts.EditorMode := False;
  if FAcctType = nil then
    DoAcctTypeMaint(self);   }
end;

procedure TFrmGLMain.dblcAcctTypeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  {TODO -oathite -cWebConvert : Depends on GLACCTTP
  if FAcctType <> nil then
    with DM.TblGlAcct do
    begin
      DM.QryGLSubAcct.Close;
      DM.QryGLSubAcct.Open;
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('GL_SUBACCT_TYPE_ID').asFloat := TTVCargo(FAcctType.TV.Selected.Data).sId
    end; }
end;

procedure TFrmGLMain.dblcAcctTypeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
//  if (FAcctType <> nil) and (Source = FAcctType.TV)
//    then Accept := True
//    else Accept := False;
end;



procedure TFrmGLMain.gridAccounts1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  FOnMouseDown: TMouseEvent;
begin
//  FOnMouseDown:= gridAccounts.OnMouseDown;
//  gridAccounts.OnMouseDown:= NIL;
//  try
//    gridAccounts.MouseDown( mbLeft, [ssLeft], X, Y );
//    dblcAcctTypeDragDrop(nil, nil, 0, 0);
//  finally
//    gridAccounts.OnMouseDown:= FOnMouseDown;
//  end;

end;

procedure TFrmGLMain.TVGetImageIndex(Sender: TObject; Node: TUniTreeNode);
begin
  { TODO -oathite -cWebConvert : Depends on GLAcctTP
  with Node do
    if (TTVCargo(Node.Data).sParentId = 0) and (TTVCargo(Node.Data).sId = 0) then
      begin
        ImageIndex    := 0;
        SelectedIndex := 0;
      end
      else if (TTVCargo(Node.Data).sParentId = 0) and (TTVCargo(Node.Data).sId <> 0) then
      begin
        ImageIndex    := 1;
        SelectedIndex := 1;
      end
      else
      begin
        ImageIndex    := 2;
        SelectedIndex := 2;
      end;
      }
end;

procedure TFrmGLMain.FullExpand1Click(Sender: TObject);
begin
  with TV do
  begin
    FullExpand;
    Selected:= Items.GetFirstNode;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TopItem'
    TopItem := Selected; }
  end;
end;

procedure TFrmGLMain.FullCollapse1Click(Sender: TObject);
begin
  TV.FullCollapse;
end;

procedure TFrmGLMain.PageControl2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  with navMain.DataSource.DataSet do
  try
    if State in [dsEdit, dsInsert] then
       Post;
  except
    Application.ShowException( Exception( ExceptObject ));
    AllowChange:= FALSE;
  end;
end;

procedure TFrmGLMain.PageControl2Change(Sender: TObject);
begin
 //New1.Enabled      := (PageControl2.ActivePage <> TabTreeView) and SR.Enabled['New1'] and SR.Visible['New1'];
 //Delete1.Enabled   := (PageControl2.ActivePage <> TabTreeView) and SR.Enabled['Delete1'] and SR.Visible['Delete1'];
 NavMain.Enabled   := (PageControl2.ActivePage <> TabTreeView) and SR.Enabled['NavMain'];
 sbtnSearch.Enabled:= (PageControl2.ActivePage <> TabTreeView) and SR.Enabled['NavMain'];

 if PageControl2.ActivePage <> TabTreeView then
     PrepareAccountDataSheet;

 with PageControl2 do
   if ActivePage = TabForm then
      gridAccounts.DataSource := nil
   else if ActivePage = TabGrid then
      gridAccounts.DataSource := DM.SrcGLAcct
   else if TV.Items.Count = 0 then
      begin
       Invalidate;
       Application.ProcessMessages;
       LoadTreeView;
      end;
end;

procedure TFrmGLMain.DeleteEmptyNodes;
var
  i:Integer;
  CurItem : TUniTreeNode;
  AItem: TUniTreeNode;
begin
  CurItem:= TV.Items.GetFirstNode;
  while Assigned( CurItem ) do
  begin
    AItem  := CurItem;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNext'
    CurItem:= CurItem.GetNext;  }
    { TODO -oathite -cWebConvert : Depends on GLAcctTP
    if (not ((TTVCargo( AItem.Data ).sParentId = 0) and ( TTVCargo( AItem.Data).sId = 0)) ) and not AItem.HasChildren then
    begin
      TTreeViewCargo( AItem.Data ).Free;
      AItem.Delete;
    end; }
  end;
  //with TV do
  //  for i := Items.Count-1 downto 0 do
  //   if (not ((TTVCargo(Items[i].Data).sParentId = 0) and (TTVCargo(Items[i].Data).sId = 0)) ) and (not Items[i].HasChildren) then
  //    begin
  //      TTreeViewCargo(Items[i].Data).Free;
  //      Items[i].Delete;
  //    end;
end;

procedure TFrmGLMain.sbtnRefreshClick(Sender: TObject);
begin
  LoadTreeView;
end;

procedure TFrmGLMain.ReferenceCodes1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depeds on Ref_Code
  DoRefCode;  {in Ref_code.pas  (GL)}
end;

procedure TFrmGLMain.BrowseGLBatches1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depeds on BatView
  DOViewBatch('GJ');  {in BatView.pas in GL}
end;

procedure TFrmGLMain.Contents1Click(Sender: TObject);
begin
//  Application.HelpContext(0);
  IQHelp.HelpContext( 1095676 );
end;

procedure TFrmGLMain.IQRefreshDataSets( var Msg: TMessage );
begin
  DM.TblIQSys.Refresh;
end;

procedure TFrmGLMain.AccountRevaluation1Click(Sender: TObject);
begin
  DoAccuntRevaluation; {in GLReval.pas}
end;

procedure TFrmGLMain.sbEActivityClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depeds on EActivit
  DoEActivity( self );  {EActivit.pas}
end;

procedure TFrmGLMain.Show1Click(Sender: TObject);
begin
  //IQTiming1.Display;
end;

procedure TFrmGLMain.sbtnUpdateFinRptClick(Sender: TObject);
begin
  DM.TblGLAcct.CheckBrowseMode;
  { TODO -oathite -cWebConvert : Depends on upd_Fin
  DoUpdate_Fin_Rpt( DM.TblGLAcct );  {Upd_Fin.pas}
end;

procedure TFrmGLMain.sbtnEPlantClick(Sender: TObject);
begin
  DoChangePlantID( DM.TblGLAcct );  {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmGLMain.gridAccounts1EditButtonClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedField'
  if gridAccounts.SelectedField = DM.TblGLAcctEPlant_Name then
     sbtnEPlantClick( NIL)     }
end;

procedure TFrmGLMain.dbCorVuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  with DM.TblGLAcct do
  begin
    Edit;
    FieldByName('CORVU_ACCT_TYPE').Clear;
    Key:= 0;
  end;
end;

procedure TFrmGLMain.EnableUserDefinedForm1Click(Sender: TObject);
begin
  IQUDEmbeddedForm1.Active:= true;
end;

procedure TFrmGLMain.MergeHistoryDeleteGeneralLedgerAccounts1Click(
  Sender: TObject);
begin
  DoMergeAndDelGL;
end;

procedure TFrmGLMain.dblcAcctTypeCloseUp(Sender: TObject);
var
  aTopLevelID:Real;
  aType:String;
begin
  if not Assigned(DM) or (DM = nil) then Exit;
  aTopLevelID := SelectValueFmtAsFloat('select CONNECT_BY_ROOT id as top_level_id ' +
                           '  from GLSUB_ACCT_TYPE ' +
                           ' where id = %f ' +
                           ' start with parent_id is null ' +
                           ' connect by prior id = parent_id', [DM.TblGLAcctGL_SUBACCT_TYPE_ID.asFloat]);
  aType := SelectValueFmtAsString('select descrip from GLSUB_ACCT_TYPE where id = %f', [aTopLevelID]);
  if aType = 'STATISTICAL' then
  begin
    dbHideFromPK.Visible := false;
    dbHideFromGL.Visible := false;
    dbHideFromAP.Visible := false;
    dbHideFromAR.Visible := false;
    DBCheckBox2.Visible  := false;
  end
  else
  begin
    dbHideFromPK.Visible := true;
    dbHideFromGL.Visible := true;
    dbHideFromAP.Visible := true;
    dbHideFromAR.Visible := true;
    DBCheckBox2.Visible  := true;
  end;
end;

procedure TFrmGLMain.wwDBComboDlg1CustomDlg(Sender: TObject);
begin
  sbtnEPlantClick( NIL);
end;



procedure TFrmGLMain.wwDBComboDlg2CustomDlg(Sender: TObject);
begin
  with DM.PkSubAcctType do
  if Execute then
  begin
    if not (DM.TblGLAcct.State in [dsEdit, dsInsert]) then DM.TblGLAcct.Edit;
    DM.TblGLAcctGL_SUBACCT_TYPE_ID.asFloat := GetValue('ID');
  end;
end;

procedure TFrmGLMain.DelecteactivityfromCTRIALBALANCEASOF1Click(Sender: TObject);
begin
  ExecuteCommandFmt('delete from C_TRIAL_BALANCE_AS_OF where glacct_id = %f', [DM.TblGLAcctID.asFloat]);
end;



end.

