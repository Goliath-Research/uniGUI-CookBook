unit Budget;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Tabnotbk,
  Vcl.Menus,
  Vcl.DBGrids,
  Vcl.Buttons,
  Data.DB,
  DM_GL,
  Mask,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  { TODO -oMugdha -cWEBIQ : Dependency on IQdbGrid }
  IQdbGrid,
  BudgSel,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniMultiItem,
  uniListBox,
  uniComboBox,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGroupBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniDBComboBox,
  uniPageControl, Vcl.Grids;
  { TODO -omugdha WEBIQ : Dependency on IQWebdbGrid
   IQWebdbGrid;  }
  { TODO -oMugdha -cWEBIQ : Dependency on IQdbGrid
  IQdbGrid; }

type
  TGLCargo = class
    ID: Real;
    Desc: string;
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
    sbtnToggle: TUniSpeedButton;
    N5: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Budgets1: TUniMenuItem;
    navMain: TUniDBNavigator;
    CreateBudgets1: TUniMenuItem;
    CreateBudgetGroups1: TUniMenuItem;
    N8: TUniMenuItem;
    MonthlyAllocations1: TUniMenuItem;
    PageControl1: TUniPageControl;
    sheetAccountData: TUniTabSheet;
    sheetBudget: TUniTabSheet;
    DefinePeriods1: TUniMenuItem;
    Notebook1: TUniPageControl;
    GroupBox1: TUniGroupBox;
{ TODO -omugdha WEBIQ : Undeclared identifier: 'TIQdbGrid'
    gridAccounts: TIQdbGrid;  }
    AccountMask1: TUniMenuItem;
    N9: TUniMenuItem;
    Search1: TUniMenuItem;
    BudgetComparisons1: TUniMenuItem;
    DefineSubAccts1: TUniMenuItem;
    YearEndClosing1: TUniMenuItem;
    N11: TUniMenuItem;
    AccountActivity1: TUniMenuItem;
    Replicate1: TUniMenuItem;
    N12: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    UserDefined1: TUniMenuItem;
    JournalEntries1: TUniMenuItem;
    Panel2: TUniPanel;
    pnlCurrentBudgetPeriods: TUniPanel;
    Panel8: TUniPanel;
    Panel10: TUniPanel;
    btnApply: TUniButton;
    btnRevert: TUniButton;
    btnSetCriteria: TUniButton;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Splitter1: TUniSplitter;
    Splitter2: TUniSplitter;
    pgctrlBudget: TUniPageControl;
    sheetCurrent: TUniTabSheet;
    gridAcctBudget: TIQdbGrid;
    sheetPeriods: TUniTabSheet;
    gridPrevPeriodBudget: TIQdbGrid;
    pnlFilter: TUniPanel;
    Panel3: TUniPanel;
    gridCurrentPeriodBudget: TIQdbGrid;
    pnlAdjustCBox: TUniPanel;
    Panel7: TUniPanel;
    Panel9: TUniPanel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    lboxFilter: TUniListBox;
    DBEdit1: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    cboxAdjust: TUniComboBox;
    DBEdit4: TUniDBEdit;
    pnlMesg: TUniPanel;
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
    PnlAcctData: TUniPanel;
    Splitter3: TUniSplitter;
    PnlAcctDataLeft: TUniPanel;
    PnlAcctDataClient: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label16: TUniLabel;
    dbeAcctNumber: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    CBoxAcctType: TUniDBComboBox;
    LookupCBoxAcctSubType: TUniDBLookupComboBox;
    Label8: TUniLabel;
    procedure sbtnToggleClick(Sender: TObject);
    procedure mnSysParamsClick(Sender: TObject);
    procedure DesignTool1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure CreateBudgets1Click(Sender: TObject);
    procedure CreateBudgetGroups1Click(Sender: TObject);
    procedure DefinePeriods1Click(Sender: TObject);
    procedure AccountMask1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
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
    procedure btnSetCriteriaClick(Sender: TObject);
    procedure InvokeNavigator(Sender: TObject);
    procedure pnlAdjustCBoxResize(Sender: TObject);
    procedure gridAcctBudgetEnter(Sender: TObject);
    procedure cboxAdjustChange(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btnApplyClick(Sender: TObject);
    procedure btnRevertClick(Sender: TObject);
    procedure gridCurrentPeriodBudgetMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridCurrentPeriodBudgetDragOver(Sender, Source: TObject;
      X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure gridCurrentPeriodBudgetDragDrop(Sender, Source: TObject;
      X, Y: Integer);
    procedure ShowTotals1Click(Sender: TObject);
    procedure Diff1Click(Sender: TObject);
    procedure Recalculate2Click(Sender: TObject);
    procedure JournalEntries1Click(Sender: TObject);
    procedure TrialBalance1Click(Sender: TObject);
    procedure Budgets1Click(Sender: TObject);
    procedure Bankmanager1Click(Sender: TObject);
  private
    { Private declarations }
    FCriteriaChanging: Boolean;
    FPrevYear: TGLCargo;
    FFiscalYearPeriodsCount: Real;
    FDragAmount: Real;

    function GetFiscalYearID: Real;
    procedure SetFiscalYearID(AValue: Real);
    function GetFiscalYearDesc: string;

    function GetPrevFiscalYearID: Real;
    procedure SetPrevFiscalYearID(AValue: Real);
    function GetPrevFiscalYearDesc: string;

    function GetAccountType: string;
    procedure SetAccountType(const AValue: string);

    function GetUserDefinedTypeID: Real;
    procedure SetUserDefinedTypeID(AValue: Real);
    function GetUserDefinedTypeDesc: string;

    function GetAccount: string;
    procedure SetAccount(const AValue: string);

    function GetDepartment: string;
    procedure SetDepartment(const AValue: string);

    function GetDivision: string;
    procedure SetDivision(const AValue: string);

    function GetCurrentCriteria: TBudgetCriteria;
    procedure SetCurrentCriteria(AValue: TBudgetCriteria);
    function CurrentCriteriaDiff(AValue: TBudgetCriteria): Boolean;
    procedure RefreshBudgetQuery;
    procedure Assign_Current_FiscalYearCaptions;
    procedure Assign_Prev_FiscalYearCaptions;
    function ColumnByFieldName(const AFieldName: string;
      ADBGrid: TUniDBGrid): TColumn;
    procedure EnableDBGridColumn(AColumn: TColumn; ACondition: Boolean);
    procedure PrepareAccountDataSheet;
    procedure PrepareBudgetInfoSheet;
    procedure AssignBudgetFilterLocateID(AAcctID: Real);
    function GetMesg: string;
    procedure SetMesg(AValue: string);
    procedure DoBeforeApplyUpdates;
    procedure DoAfterApplyUpdates;
  public
    { Public declarations }
    DM: TGL_DM;
    procedure SyncBudgetGLAcct_ID(AAcctID: Real);

    property FiscalYearID: Real read GetFiscalYearID write SetFiscalYearID;
    property FiscalYearDesc: string read GetFiscalYearDesc;
    property AccountType: string read GetAccountType write SetAccountType;
    property UserDefinedTypeID: Real read GetUserDefinedTypeID
      write SetUserDefinedTypeID;
    property UserDefinedTypeDesc: string read GetUserDefinedTypeDesc;
    property Account: string read GetAccount write SetAccount;
    property Department: string read GetDepartment write SetDepartment;
    property Division: string read GetDivision write SetDivision;
    property PrevFiscalYearID: Real read GetPrevFiscalYearID
      write SetPrevFiscalYearID;
    property PrevFiscalYearDesc: string read GetPrevFiscalYearDesc;
    property FiscalYearPeriodsCount: Real read FFiscalYearPeriodsCount
      write FFiscalYearPeriodsCount;
    property CurrentCriteria: TBudgetCriteria read GetCurrentCriteria
      write SetCurrentCriteria;
    property CriteriaChanging: Boolean read FCriteriaChanging
      write FCriteriaChanging;
    property Mesg: string read GetMesg write SetMesg;
  end;

procedure DoIQGL;

implementation

{$R *.DFM}
{$IFDEF XOXOXOXOXOXOX}

uses
  AcctMask,
  Activity,
  BM_Main,
  Budgcomp,
  BudgGrp,
  Budgrp,
  DM_GL,
  GL_Visu,
  GLBudget,
  GLPeriod,
  GLTrialB,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.ConfirmWithSecurity,
  Journal,
  Replicat,
  Subacct,
  Sys;
{$ELSE}

uses
  IQMS.common.datalib,
  { TODO -omugdha WEBIQ : Dependency on GL_Visu
  GL_Visu,  }
  Budgrp, BudgGrp,
  { TODO -omugdha WEBIQ : Dependency on GLPeriod , Activity ,Replicat,Sys,IQRegFrm
  GLPeriod,
  Activity,
  Replicat,
  Sys,
  IQRegFrm,ConfBas, }

  AcctMask,
  Budgcomp, Subacct,



  IQMS.common.Numbers,
  IQMS.common.Miscellaneous,
  IQMS.common.Mesg,
  IQMS.common.controls,
    IQMS.Common.NLS;
  { TODO -omugdha WEBIQ -cWEBIQ : Dependency on Journal,GLTrialB ,BM_Main,IQNLS,iqctrl
  Journal,
  GLTrialB,
  BM_Main,
  iqctrl; }
{$ENDIF}
(*TODO -omugdha WEBIQ -cWEBIQ : Dependency on DoIQGL  *)
procedure DoIQGL;
var
  LFrmGLMain: TFrmGLMain;
begin
  // TFrmGLMain.Create( Application ).Show;
  with LFrmGLMain do
  begin
    LFrmGLMain := TFrmGLMain.Create(uniGUIApplication.UniApplication);
  end;
end;

procedure TFrmGLMain.SyncBudgetGLAcct_ID(AAcctID: Real);
begin
{ TODO -omugdha WEBIQ -cWEBIQ : Undeclared identifier: 'QryGLAcct_BudgetGLACCT_ID'
  if (AAcctID > 0) and (DM.QryGLAcct_BudgetGLACCT_ID.asFloat <> AAcctID) then
    with DM do
      if (AAcctID > 0) and not(QryGLAcct_Budget.Locate('GLACCT_ID', AAcctID, []))
      then
        AssignBudgetFilterLocateID(AAcctID);   }
  // IQConfirm( Format( 'Note!'+#13#13+'Budget Info Filter has been reset to position on Account# %s',
  // [ SelectValueAsString( Format( 'select acct from glacct where id = %f', [ AAcctID ]))]));
end;

procedure TFrmGLMain.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  DM := TGL_DM.Create(self);
  DM.Name := ''; // Makes the form to look at Local DM
  FCriteriaChanging := FALSE;
  { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'IQRegFormRead'
  IQRegFormRead(self, [self, gridAccounts, gridAcctBudget, gridPrevPeriodBudget,
    gridCurrentPeriodBudget, pnlCurrentBudgetPeriods, pnlFilter,
    PnlAcctDataLeft]);   }
  IQSetTablesActive(TRUE, DM);
  { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'gridAccounts'
  gridAccounts.DataSource := NIL; }
  PageControl1.ActivePage := sheetAccountData;
  { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'PageIndex'
  Notebook1.PageIndex := 0; }
  cboxAdjust.ItemIndex := 0;
  pgctrlBudget.ActivePage := sheetCurrent;
    { TODO -omugdha WEBIQ -cWEBIQ :  'Controls' is not the name of a unit
  IQMS.Common.Controls.ResizeNavBar(navMain); }

  for I := 0 to 5 do
    lboxFilter.Items.Objects[I] := TGLCargo.Create;
  FPrevYear := TGLCargo.Create;
  FiscalYearID := GetDefaultGLYear; { IQMS.Common.Miscellaneous.pas }
end;

procedure TFrmGLMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGLMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
{ TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'IQRegFormWrite'
  IQRegFormWrite(self, [self, gridAccounts, gridAcctBudget,
    gridPrevPeriodBudget, gridCurrentPeriodBudget, pnlCurrentBudgetPeriods,
    pnlFilter, PnlAcctDataLeft]);
  IQSetTablesActive(FALSE, DM);
  for I := 0 to 5 do
    (lboxFilter.Items.Objects[I] as TGLCargo).Free;
  FPrevYear.Free;
  Action := caFree;  }
end;

procedure TFrmGLMain.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  with navMain.DataSource.DataSet do
    try
      if State in [dsEdit, dsInsert] then
        Post;
    except
      Application.ShowException(Exception(ExceptObject));
      AllowChange := FALSE;
    end;
end;

procedure TFrmGLMain.PageControl1Change(Sender: TObject);
begin
  sbtnToggle.Enabled := (PageControl1.ActivePage = sheetAccountData) and
    SR.Enabled['sbtnToggle'] and SR.Visible['sbtnToggle'];
  New1.Enabled := (PageControl1.ActivePage = sheetAccountData) and
    SR.Enabled['New1'] and SR.Visible['New1'];
  Delete1.Enabled := (PageControl1.ActivePage = sheetAccountData) and
    SR.Enabled['Delete1'] and SR.Visible['Delete1'];

  if PageControl1.ActivePage = sheetAccountData then
    PrepareAccountDataSheet
  else
    PrepareBudgetInfoSheet;
end;

procedure TFrmGLMain.PrepareAccountDataSheet;
begin
  if SR.Delete['navMain'] and SR.Insert['navMain'] then
  (* TODO -omugdha WEBIQ -cWEBIQ : Undeclared identifier: 'nbInsert'
    navMain.VisibleButtons := navMain.VisibleButtons + [nbInsert, nbDelete];
  navMain.DataSource := DM.SrcGLAcct;

  { synchronize Account on AcountData sheet with Budget account # }
  with DM do
    if (QryGLAcct_BudgetGLACCT_ID.asFloat > 0) and
      not(TblGLAcct.Locate('ID', QryGLAcct_BudgetGLACCT_ID.asFloat, [])) then
      IQWarning(Format('Unable to Locate Acc# %s',
        [QryGLAcct_BudgetGLACCT.asString]));  *)
end;

procedure TFrmGLMain.PrepareBudgetInfoSheet;
begin
  { Navigator: Vcl.Buttons and DataSource }
  { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'nbInsert'
  navMain.VisibleButtons := navMain.VisibleButtons - [nbInsert, nbDelete];}

  if Screen.ActiveControl is TUniDBGrid then
    navMain.DataSource := (Screen.ActiveControl as TUniDBGrid).DataSource
  else if pgctrlBudget.ActivePage = sheetCurrent then
    navMain.DataSource := gridAcctBudget.DataSource
  else
    navMain.DataSource := gridPrevPeriodBudget.DataSource;

  { synchronize Budget GLaccount # with Account on AcountData sheet }
  SyncBudgetGLAcct_ID(DM.TblGLAcctID.asFloat);
end;

procedure TFrmGLMain.AssignBudgetFilterLocateID(AAcctID: Real);
var
  Criteria: TBudgetCriteria;
begin
{ TODO -omugdha WEBIQ -cWEBIQ : Undeclared identifier: 'DataBaseName'
  with TFDQuery.Create(self) do
    try
      DataBaseName := cnstFDConnectionName;
      SQL.Add(IQFormat
        ('select type, gl_subacct_type_id from glacct where id = %f',
        [AAcctID]));
      Open;
      Criteria.FiscalYearID := CurrentCriteria.FiscalYearID;
      Criteria.AccountType := FieldByName('type').asString;
      Criteria.UserDefinedTypeID := FieldByName('gl_subacct_type_id').asFloat;
      Criteria.Account := '';
      Criteria.Department := '';
      Criteria.Division := '';
    finally
      Free;
    end;

  CurrentCriteria := Criteria;
  DM.QryGLAcct_Budget.Locate('GLACCT_ID', AAcctID, []); }
end;

procedure TFrmGLMain.sbtnSearchClick(Sender: TObject);
begin
  with DM.PkGLAcct do
    if Execute then
      if PageControl1.ActivePage = sheetAccountData then
        // DM.TblGLAcct.FindKey( [ GetValue('ID') ] )
        DM.TblGLAcct.Locate('ID', GetValue('ID'), [])
      else if PageControl1.ActivePage = sheetBudget then
        SyncBudgetGLAcct_ID(GetValue('ID'));
end;

procedure TFrmGLMain.sbtnToggleClick(Sender: TObject);
begin
{ TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'PageIndex'
  with Notebook1 do
    if PageIndex = 0 then
    begin
      PageIndex := 1;
      gridAccounts.DataSource := DM.SrcGLAcct;
    end
    else
    begin
      PageIndex := 0;
      gridAccounts.DataSource := nil;
    end  }
end;

procedure TFrmGLMain.mnSysParamsClick(Sender: TObject);
begin
{ TODO -omugdha WEBIQ -cWEBIQ : dependency on sys.pas
  DoSysParameters(self, DM.TblIQSys);} { sys.pas }
  FiscalYearID := GetDefaultGLYear; { IQMS.Common.Miscellaneous.pas }
end;

procedure TFrmGLMain.DesignTool1Click(Sender: TObject);
begin
{ TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'TFrmGLVisual'
  with TFrmGLVisual.Create(self) do
    try
      Showmodal;
    finally
      Free;
    end;  }
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
{ TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'DoPeriods'
  DoPeriods(self); }
end;

procedure TFrmGLMain.AccountMask1Click(Sender: TObject);
begin
{ TODO -omugdha WEBIQ -cWEBIQ :  Too many actual parameters
  DoAcctMask(self);   }
  DM.TblIQSys.Close;
  DM.TblIQSys.Open;
  { will rebuild Size of Account, Department, Division - see DM_GL }
end;

procedure TFrmGLMain.BudgetComparisons1Click(Sender: TObject);
begin
  with TFrmBudgComp.Create(self) do
    try
      Showmodal;
    finally
      Free;
    end;
end;

procedure TFrmGLMain.DefineSubAccts1Click(Sender: TObject);
begin
(* TODO -omugdha WEBIQ -cWEBIQ : Incompatible types: 'TFDTable' and 'TFrmGLMain'
  DoSubAccounts(self, NIL { Table } ); { SubAcct.Pas }
  DM.QryGLSubAcct.Close; *)
  DM.QryGLSubAcct.Open;
end;

procedure TFrmGLMain.AccountActivity1Click(Sender: TObject);
begin
{ TODO -omugdha WEBIQ -cWEBIQ : dependency on Activity
  DoActivity(self);} { Activity.pas }
end;

procedure TFrmGLMain.Replicate1Click(Sender: TObject);
begin
{ TODO -omugdha WEBIQ -cWEBIQ : dependency on Replicat
  DoReplicateAcct(self); }{ Replicat.pas }
end;

procedure TFrmGLMain.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmGLMain.Other1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmGLMain.UserDefined1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmGLMain.InvokeNavigator(Sender: TObject);
begin
{ TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'BtnClick'
  if Sender = New1 then
    if SR.Insert['NavMain'] then
      navMain.BtnClick(nbInsert)
    else if Sender = Delete1 then
      if SR.Delete['NavMain'] then
        navMain.BtnClick(nbDelete);   }
end;

procedure TFrmGLMain.LookupCBoxAcctSubTypeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    with DM, TblGLAcct do
    begin
      Edit;
      FieldByName('GL_SUBACCT_TYPE_ID').asString := '';
      Key := 0;
    end
end;

{ Handle SubAccounts Query here for Form and Grid view }
procedure TFrmGLMain.LookupCBoxAcctSubTypeDropDown(Sender: TObject);
begin
  { put it in the edit mode to change QrySubAcct where clause to include only acct_type }
  DM.TblGLAcct.Edit;
end;

procedure TFrmGLMain.gridAccountsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  { put it in the edit mode to change QrySubAcct where clause to include only acct_type }
  { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'gridAccounts'
  if (Button = mbLeft) and
    (gridAccounts.SelectedField = DM.TblGLAcctSubAcctType) and
    (gridAccounts.EditorMode) then
    DM.TblGLAcct.Edit;  }
end;

procedure TFrmGLMain.gridAccountsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { put it in the edit mode to change QrySubAcct where clause to include only acct_type }
  { TODO -omugdha WEBIQ -cWEBIQ : Undeclared identifier: 'gridAccounts'
  if (Key = VK_RETURN) and

    (gridAccounts.SelectedField = DM.TblGLAcctSubAcctType) and
    (not gridAccounts.EditorMode) then
    with DM, TblGLAcct do
    begin
      Edit;
      Key := 0;
    end; }
end;

procedure TFrmGLMain.btnSetCriteriaClick(Sender: TObject);
var
  Criteria: TBudgetCriteria;
begin
  Criteria := CurrentCriteria;
  (* TODO -omugdha WEBIQ -cWEBIQ : dpendency on BudgSel
  if GetBudgetSelectionCriteria(self, Criteria) then { BudgSel.Pas }
    CurrentCriteria := Criteria;*)
end;

{ Filter box properties }
function TFrmGLMain.GetFiscalYearID: Real;
begin
  Result := (lboxFilter.Items.Objects[0] as TGLCargo).ID;
end;

procedure TFrmGLMain.SetFiscalYearID(AValue: Real);
begin
  if (lboxFilter.Items.Objects[0] <> NIL) and (FiscalYearID <> AValue) then
  begin
    with lboxFilter.Items.Objects[0] as TGLCargo do
    begin
      ID := AValue;
      Desc := SelectValueAsString
        (IQFormat('select descrip from glyear where id = %f', [AValue]));
      lboxFilter.Items[0] := 'Fiscal Year       : ' + Desc;
    end;

    PrevFiscalYearID := SelectValueAsFloat
      (IQFormat(
      'select prev_glyear_id from v_glyear_current_prev where glyear_id = %f',
      [AValue]));
    FiscalYearPeriodsCount := SelectValueAsFloat
      (IQFormat('select Count(*) from glperiods where glyear_id = %f',
      [AValue]));

    Assign_Current_FiscalYearCaptions;
    RefreshBudgetQuery;
  end;
end;

function TFrmGLMain.GetFiscalYearDesc: string;
begin
  Result := (lboxFilter.Items.Objects[0] as TGLCargo).Desc;
end;

function TFrmGLMain.GetPrevFiscalYearID: Real;
begin
  Result := FPrevYear.ID;
end;

procedure TFrmGLMain.SetPrevFiscalYearID(AValue: Real);
begin
  with FPrevYear do
    if ID <> AValue then
    begin
      ID := AValue;
      Desc := SelectValueAsString
        (IQFormat('select descrip from glyear where id = %f', [AValue]));
      Assign_Prev_FiscalYearCaptions;
    end;
end;

function TFrmGLMain.GetPrevFiscalYearDesc: string;
begin
  Result := FPrevYear.Desc;
end;

function TFrmGLMain.GetAccountType: string;
begin
  Result := (lboxFilter.Items.Objects[1] as TGLCargo).Desc;
end;

procedure TFrmGLMain.SetAccountType(const AValue: string);
begin
  with lboxFilter.Items.Objects[1] as TGLCargo do
  begin
    ID := -1; { not in use }
    Desc := AValue;
    lboxFilter.Items[1] := 'Account Type      : ' + Desc;
    RefreshBudgetQuery;
  end;
end;

function TFrmGLMain.GetUserDefinedTypeID: Real;
begin
  Result := (lboxFilter.Items.Objects[2] as TGLCargo).ID;
end;

procedure TFrmGLMain.SetUserDefinedTypeID(AValue: Real);
begin
  with lboxFilter.Items.Objects[2] as TGLCargo do
  begin
    ID := AValue;
    Desc := SelectValueAsString
      (IQFormat('select descrip from glsub_acct_type where id = %f', [AValue]));
    lboxFilter.Items[2] := 'User Defined Type : ' + Desc;
  end;
end;

function TFrmGLMain.GetUserDefinedTypeDesc: string;
begin
  Result := (lboxFilter.Items.Objects[2] as TGLCargo).Desc;
end;

function TFrmGLMain.GetAccount: string;
begin
  Result := (lboxFilter.Items.Objects[3] as TGLCargo).Desc;
end;

procedure TFrmGLMain.SetAccount(const AValue: string);
begin
  with lboxFilter.Items.Objects[3] as TGLCargo do
  begin
    ID := -1; { not in use }
    Desc := AValue;
    lboxFilter.Items[3] := 'Account           : ' + Desc;
    RefreshBudgetQuery;
  end;
end;

function TFrmGLMain.GetDepartment: string;
begin
  Result := (lboxFilter.Items.Objects[4] as TGLCargo).Desc;
end;

procedure TFrmGLMain.SetDepartment(const AValue: string);
begin
  with lboxFilter.Items.Objects[4] as TGLCargo do
  begin
    ID := -1; { not in use }
    Desc := AValue;
    lboxFilter.Items[4] := 'Department        : ' + Desc;
    RefreshBudgetQuery;
  end;
end;

function TFrmGLMain.GetDivision: string;
begin
  Result := (lboxFilter.Items.Objects[5] as TGLCargo).Desc;
end;

procedure TFrmGLMain.SetDivision(const AValue: string);
begin
  with lboxFilter.Items.Objects[5] as TGLCargo do
  begin
    ID := -1; { not in use }
    Desc := AValue;
    lboxFilter.Items[5] := 'Division          : ' + Desc;
    RefreshBudgetQuery;
  end;
end;

function TFrmGLMain.GetCurrentCriteria: TBudgetCriteria;
begin
  Result.FiscalYearID := FiscalYearID;
  Result.AccountType := AccountType;
  Result.UserDefinedTypeID := UserDefinedTypeID;
  Result.Account := Account;
  Result.Department := Department;
  Result.Division := Division;
end;

procedure TFrmGLMain.SetCurrentCriteria(AValue: TBudgetCriteria);
begin
  if CurrentCriteriaDiff(AValue) then
    try
      CriteriaChanging := TRUE;
      FiscalYearID := AValue.FiscalYearID;
      AccountType := AValue.AccountType;
      UserDefinedTypeID := AValue.UserDefinedTypeID;
      Account := AValue.Account;
      Department := AValue.Department;
      Division := AValue.Division;
    finally
      CriteriaChanging := FALSE;
      RefreshBudgetQuery;
    end;
end;

function TFrmGLMain.CurrentCriteriaDiff(AValue: TBudgetCriteria): Boolean;
begin
  Result := (FiscalYearID <> AValue.FiscalYearID) or
    (AccountType <> AValue.AccountType) or
    (UserDefinedTypeID <> AValue.UserDefinedTypeID) or
    (Account <> AValue.Account) or (Department <> AValue.Department) or
    (Division <> AValue.Division);
end;

procedure TFrmGLMain.RefreshBudgetQuery;

begin
{ TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'QryGLAcct_Budget'
  if CriteriaChanging then
    EXIT;

  with DM.QryGLAcct_Budget, CurrentCriteria do
  begin
    Close;
    ParamByName('glyear_id').Value := FiscalYearID;
    ParamByName('glacct_type').Value := AccountType;
    ParamByName('all_glacct_type').Value := iIIf(AccountType = '', 1, 0);
    ParamByName('glsub_acct_id').Value := UserDefinedTypeID;
    ParamByName('all_glsub_acct_id').Value := iIIf(UserDefinedTypeID < 1, 1, 0);
    ParamByName('account').Value := Account;
    ParamByName('all_account').Value := iIIf(Account = '', 1, 0);
    ParamByName('department').Value := Department;
    ParamByName('all_department').Value := iIIf(Department = '', 1, 0);
    ParamByName('division').Value := Division;
    ParamByName('all_division').Value := iIIf(Division = '', 1, 0);
    Open;
  end;  }
end;

procedure TFrmGLMain.Assign_Current_FiscalYearCaptions;
var
  I: Integer;
begin
  sheetCurrent.Caption := Format('%s Budget by Account', [FiscalYearDesc]);

  for I := 0 to gridAcctBudget.Columns.Count - 1 do
    with gridAcctBudget.Columns[I] do
      if FieldName = 'YTDBUDGET' then
        Title.Caption := Format('%s Budget', [FiscalYearDesc])
      else if FieldName = 'PrevYTD' then
      begin
        if PrevFiscalYearID > 0 then
          Title.Caption := Format('%s Actual', [PrevFiscalYearDesc])
        else
          Title.Caption := 'Prior Actual N/A';
      end
      else if FieldName = 'PrevBudget' then
      begin
        if PrevFiscalYearID > 0 then
          Title.Caption := Format('%s Budget', [PrevFiscalYearDesc])
        else
          Title.Caption := 'Prior Budget N/A';
      end;
end;

procedure TFrmGLMain.Assign_Prev_FiscalYearCaptions;
begin
  if PrevFiscalYearID > 0 then
    sheetPeriods.Caption := Format('%s Account Budget by Period',
      [PrevFiscalYearDesc])
  else
    sheetPeriods.Caption := Format('Prior Account Budget by Period N/A',
      [PrevFiscalYearDesc]);
end;

procedure TFrmGLMain.pnlAdjustCBoxResize(Sender: TObject);
begin
  cboxAdjust.Width := pnlAdjustCBox.Width - 2;
end;

procedure TFrmGLMain.gridAcctBudgetEnter(Sender: TObject);
begin
  if Sender is TUniDBGrid then
    with Sender as TUniDBGrid do
      navMain.DataSource := DataSource;
end;

procedure TFrmGLMain.cboxAdjustChange(Sender: TObject);
begin
  EnableDBGridColumn(ColumnByFieldName('BUDAMOUNT', gridCurrentPeriodBudget),
    cboxAdjust.ItemIndex = 0);
  EnableDBGridColumn(ColumnByFieldName('BUDPERCENT', gridCurrentPeriodBudget),
    cboxAdjust.ItemIndex = 1);
end;

function TFrmGLMain.ColumnByFieldName(const AFieldName: string;
  ADBGrid: TUniDBGrid): TColumn;
var
  I: Integer;
begin
  for I := 0 to ADBGrid.Columns.Count - 1 do
    with ADBGrid do
      if UpperCase(Columns[I].FieldName) = UpperCase(AFieldName) then
      begin
      { TODO -omugdha WEBIQ -cWEBIQ :  Incompatible types: 'TColumn' and 'TUniBaseDBGridColumn'
        Result := Columns[I];
        EXIT;  }
      end;
  Result := NIL;
end;

procedure TFrmGLMain.EnableDBGridColumn(AColumn: TColumn; ACondition: Boolean);
begin
  with AColumn do
  begin
    Color := TColor(iIIf(ACondition, Ord(clWindow), Ord(clBtnFace)));
    ReadOnly := not ACondition;
  end;
end;

function TFrmGLMain.GetMesg: string;
begin
  Result := pnlMesg.Caption;
end;

procedure TFrmGLMain.SetMesg(AValue: string);
begin
  if pnlMesg.Caption <> AValue then
  begin
    pnlMesg.Caption := AValue;
    pnlMesg.Update;
  end;
end;

procedure TFrmGLMain.btnApplyClick(Sender: TObject);
begin
  try
    DoBeforeApplyUpdates;
    { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'QryGLAcct_Budget'
    FDManager.FindConnection('IQFD')
      .ApplyUpdates([DM.QryGLAcct_Budget, DM.TblGLBudget]);}
  finally
    DoAfterApplyUpdates;
    Mesg := '';
  end;
end;

procedure TFrmGLMain.DoBeforeApplyUpdates;
begin
  Mesg := 'Saving Changes - Please Wait...';
  { TODO -omugdha WEBIQ -cWEBIQ : Undeclared identifier: 'TblGLBudget'
  DM.TblGLBudget.OnCalcFields := NIL;
  if DM.QryGLAcct_Budget.State = dsEdit then
    DM.QryGLAcct_Budget.Post;
  if DM.TblGLBudget.State = dsEdit then
    DM.TblGLBudget.Post;
  if not DM.Check_All_BudgetAccounts then
    raise Exception.CreateFmt('Account # %s: ' + #13#13 +
      'Budget Amount is unbalanced.', [DM.QryGLAcct_BudgetGLACCT.asString]); }
end;

procedure TFrmGLMain.DoAfterApplyUpdates;
begin
  Mesg := 'Refreshing Screen - Please Wait...';
  { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'SetEnableApplyRevert'
  DM.SetEnableApplyRevert;
  DM.TblGLBudget.OnCalcFields := DM.TblGLBudgetCalcFields;
  DM.TblGLBudget.First;
  if not btnApply.Enabled then
  begin
    DM.EmptyBudgetAccountsList;
    DM.TblGLBudget.Close;
    DM.TblGLBudget.Open;
  end  }
end;

procedure TFrmGLMain.btnRevertClick(Sender: TObject);
begin
  if IQWarningYN('Are you sure you want to cancel all pending transactions?')
  then
    with DM do
    begin
    { TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'QryGLAcct_Budget'
      QryGLAcct_Budget.CancelUpdates;
      TblGLBudget.CancelUpdates;
      SetEnableApplyRevert;
      EmptyBudgetAccountsList;    }
    end;
end;

procedure TFrmGLMain.gridCurrentPeriodBudgetMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AField: TField;
begin
(* TODO -omugdha WEBIQ -cWEBIQ : Undeclared identifier: 'SelectedIndex'
  if Sender is TUniDBGrid then
    with Sender as TUniDBGrid do
      if (Button = mbLeft) and (Y > TDrawGrid(Sender).DefaultRowHeight) and
        (SelectedIndex > 0) then
      begin
        AField := DataSource.DataSet.FieldByName
          (Columns[SelectedIndex].FieldName);
        // if (AField is TFloatField) and TFloatField(AField).Currency then
        // begin
        FDragAmount := AField.asFloat;
        // DataSource.DataSet.FieldByName( Columns[ SelectedIndex ].FieldName ).asFloat;
        BeginDrag(FALSE);
        // end
      end;     *)
end;

procedure TFrmGLMain.gridCurrentPeriodBudgetDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TIQdbGrid) and (Y > TDrawGrid(Sender).DefaultRowHeight);
end;

procedure TFrmGLMain.gridCurrentPeriodBudgetDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  FOnMouseDown: TMouseEvent;
begin
(* TODO -omugdha WEBIQ -cWEBIQ : Undeclared identifier: 'SelectedIndex'
  if Sender is TIQdbGrid then
    with Sender as TIQdbGrid do
    begin
      FOnMouseDown := OnMouseDown;
      OnMouseDown := NIL;
      try
        MouseDown(mbLeft, [ssLeft], X, Y);
        if not Columns[SelectedIndex].ReadOnly then
          with DataSource.DataSet do
            if MoneyToStr(FieldByName(Columns[SelectedIndex].FieldName).asFloat)
              <> MoneyToStr(FDragAmount) then
            begin
              Edit;
              FieldByName(Columns[SelectedIndex].FieldName).asFloat :=
                FDragAmount;
            end;
      finally
        OnMouseDown := FOnMouseDown;
      end;
    end;*)
end;

procedure TFrmGLMain.ShowTotals1Click(Sender: TObject);
var
  TotalAmount, TotalPercent: Real;
  S: string;
begin
{ TODO -omugdha WEBIQ -cWEBIQ :  Undeclared identifier: 'QryGLAcct_Budget'
  with DM do
    if (QryGLAcct_Budget.State = dsBrowse) and
      (TblGLBudget.State in [dsBrowse, dsEdit]) then
    begin
      GetTotalPeriods(TotalAmount, TotalPercent);
      S := Format('GL Account#: %s' + #13#13 + 'Total Budget : %m' + #13#13,
        [QryGLAcct_BudgetGLACCT.asString, QryGLAcct_BudgetYTDBUDGET.asFloat]);

      S := S + Format('Periods Total $ :  %m', [TotalAmount]);
      if MoneyToStr(QryGLAcct_BudgetYTDBUDGET.asFloat) <> MoneyToStr(TotalAmount)
      then
        S := S + Format('  -  out of balance: %m',
          [QryGLAcct_BudgetYTDBUDGET.asFloat - TotalAmount]);

      S := S + #13;

      S := S + Format('Periods Total %%:  %f', [TotalPercent]);
      if FloatToStr2(TotalPercent) <> '100.00' then
        S := S + Format('  -  out of balance: %f', [100 - TotalPercent]);

      IQConfirm(S);
    end;}
end;

procedure TFrmGLMain.Diff1Click(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : Dependency on dm
  DM.CheckAdjustLastPeriod;   }
  { force differenecs into the existing record in GLBudget }
end;

procedure TFrmGLMain.Recalculate2Click(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : Dependency on dm
  DM.RecalculatePeriods;}
  { Recalc $ vs % and  force differenecs into the existing record in GLBudget }
end;

procedure TFrmGLMain.JournalEntries1Click(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : Dependency on dm
  DoGeneralJournal(self);} { Journal.pas }
end;

procedure TFrmGLMain.TrialBalance1Click(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : Dependency on dm
  DoTrialBalance(self);} { GLTrialB.pas }
end;

procedure TFrmGLMain.Budgets1Click(Sender: TObject);
begin
  // DOBudget;   {GLBudget.pas}
end;

procedure TFrmGLMain.Bankmanager1Click(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : Dependency on dm
  DoIQBM;} { BM_Main.pas  in \iqwin\bm\ }
end;

end.
