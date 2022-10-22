unit FrlCtrl;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Mask,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.Time,
  IQMS.WebVcl.RepDef,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  IQMS.Common.RollbackManager,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.Common.StringUtils,
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, IQMS.WebVcl.Strings, uniMainMenu, IQUniGrid, uniGUIFrame,
  uniComboBox, uniDBComboBox;

type
  TFrm_Frl = class(TUniForm)
    PC: TUniPageControl;
    TabEntity: TUniTabSheet;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    SrcSysCtrl: TDataSource;
    TblSysCtrl: TFDTable;
    TblSysCtrlSYSTEM_ID: TBCDField;
    TblSysCtrlBASE_CURRENCY: TStringField;
    TblSysCtrlFRL_RELEASE_NUM: TStringField;
    TblSysCtrlUSE_SEP_UNPOSTED: TBCDField;
    QryCurrency: TFDQuery;
    TblSysCtrlcurr_code: TStringField;
    help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Options1: TUniMenuItem;
    PopulateFRLdatabase1: TUniMenuItem;
    PopulateIndividualtables1: TUniMenuItem;
    Populatefrlyearctrl1: TUniMenuItem;
    Populatefrlperiodctrl1: TUniMenuItem;
    Populatefrlacctcode1: TUniMenuItem;
    Populatefrlsegctrl1: TUniMenuItem;
    Populatefrlsegdesc1: TUniMenuItem;
    Populatefrlbookctrl1: TUniMenuItem;
    Populatefrlperiodbal1: TUniMenuItem;
    Populatefrlcurrencyctrl1: TUniMenuItem;
    Populatefrlbatchctrl1: TUniMenuItem;
    Populatefrltrandetail1: TUniMenuItem;
    SrcEntity: TDataSource;
    TblEntity: TFDTable;
    TblEntityENTITY_CODE: TStringField;
    TblEntityENTITY_DESC: TStringField;
    TblEntityRPTNG_CURR_CODE: TStringField;
    TblEntityUSE_PROJECTS: TBCDField;
    TblEntityUSE_MULTI_CURR: TBCDField;
    TblEntityUSE_TRANS_DETL: TBCDField;
    TblEntityACCT_LENGTH: TBCDField;
    TblEntityMASK_LENGTH: TBCDField;
    TblEntityACCT_MASK: TStringField;
    TblEntityMAX_SEGS: TBCDField;
    TblEntityNATURAL_SEG: TBCDField;
    TabOptions: TUniTabSheet;
    cbUseEplants: TUniCheckBox;
    PCEntity: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Label5: TUniLabel;
    Label6: TUniLabel;
    DBUseProj: TUniDBCheckBox;
    DBUseMc: TUniDBCheckBox;
    DBDetTrack: TUniDBCheckBox;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    dbEntityCode: TUniDBEdit;
    dbEntityDescrio: TUniDBEdit;
    DBAcctLen: TUniDBEdit;
    DBMaskLen: TUniDBEdit;
    DBAcctMask: TUniDBEdit;
    DBMaxseg: TUniDBEdit;
    DBNatSeg: TUniDBEdit;
    Panel3: TUniPanel;
    NavEntity: TUniDBNavigator;
    gridEntity: TIQUniGridControl;
    SR: TIQWebSecurityRegister;
    SBGridView: TUniSpeedButton;
    Label12: TUniLabel;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    QryCurr2: TFDQuery;
    QryCurr1: TFDQuery;
    TblEntitycurr_code: TStringField;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    Populatefrlaccttypectrl1: TUniMenuItem;
    ProcPDatabase: TFDStoredProc;
    ProcPopulate: TFDStoredProc;
    ProcPopulateNoParams: TFDStoredProc;
    PopulateFrlentity1: TUniMenuItem;
    IQTiming1: TIQWebTiming;
    Debug1: TUniMenuItem;
    Clear1: TUniMenuItem;
    Show1: TUniMenuItem;
    N1: TUniMenuItem;
    DeleteAlldata1: TUniMenuItem;
    N2: TUniMenuItem;
    Contents1: TUniMenuItem;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    dbSystemID: TUniDBEdit;
    DbReleaseNum: TUniDBEdit;
    dbBasCurr: TUniDBEdit;
    N3: TUniMenuItem;
    ShowupostedGLBatches1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PopulateFRLbudgets1: TUniMenuItem;
    PopulateFRLDepreciationBooks1: TUniMenuItem;
    TblEntityENTITY_NUM: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblSysCtrlAfterInsert(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure cbUseEplantsClick(Sender: TObject);
    procedure TblEntityBeforeInsert(DataSet: TDataSet);
    procedure SBGridViewClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure PopulateFRLdatabase1Click(Sender: TObject);
    procedure Populatefrlentity1Click(Sender: TObject);
    procedure Populatefrlbookctrl1Click(Sender: TObject);
    procedure TblEntityAfterPost(DataSet: TDataSet);
    procedure Show1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure DeleteAlldata1Click(Sender: TObject);
    procedure ShowupostedGLBatches1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure PopulateFRLbudgets1Click(Sender: TObject);
    procedure PopulateFRLDepreciationBooks1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    HMsg:TPanelMesg;
  public
    { Public declarations }
  end;

procedure DoFrlSysCtrl;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  Frlpost,
  FrlShare,
  IQMS.Common.Locks,
  IQMS.Common.Mcshare,
  IQMS.Common.Miscellaneous;

procedure DoFrlSysCtrl;
var
  LFrm_Frl : TFrm_Frl;
begin
  LFrm_Frl :=  TFrm_Frl.Create(UniGUIApplication.UniApplication);
  LFrm_Frl.Show;
end;

procedure TFrm_Frl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IQRegFormWrite( self, [self]);
end;

procedure TFrm_Frl.TblSysCtrlAfterInsert(DataSet: TDataSet);
begin
  TblSysCtrlBASE_CURRENCY.asString   := intToStr(Trunc(GetEplantNativeCurrencyId));  {in McShare.pas}
  TblSysCtrlSYSTEM_ID.asInteger      := 17;
  TblSysCtrlFRL_RELEASE_NUM.asString := '1.3';
  TblSysCtrlUSE_SEP_UNPOSTED.asInteger := 1;
end;

procedure TFrm_Frl.UniFormCreate(Sender: TObject);
begin
//  CreateComponentsList(self, 'c:\out\');
  IQSetTablesActive( true, self );
  IQRegFormRead( self, [self, gridEntity]);
  try
    cbUseEplants.OnClick := nil;
    cbUseEplants.Checked := SelectValueAsString('select NVL(use_eplants_with_frl, ''N'') from iqsys where rownum < 2') = 'Y';
  finally
    cbUseEplants.OnClick := cbUseEplantsClick;
  end;
  PC.ActivePage := TabEntity;
  PCEntity.ActivePage := TabForm;
  gridEntity.DataSource:= NIL;
  with TblSysCtrl do
  begin
    if Eof and Bof then
    begin
      Insert;
      Post;
    end
  end;
end;

procedure TFrm_Frl.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrm_Frl.cbUseEplantsClick(Sender: TObject);
begin
  if cbUseEplants.Checked then
  begin
    ExecuteCommand('update iqsys set use_eplants_with_frl = ''Y''');
  end
  else
  begin
    ExecuteCommand('update iqsys set use_eplants_with_frl = ''N''');
  end;
  IqConfirm('Please run ''Populate FRL database'' to refresh the data');
end;

procedure TFrm_Frl.TblEntityBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrm_Frl.SBGridViewClick(Sender: TObject);
begin
  if (PCEntity.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    IQRegFormWrite( self, [self, gridEntity]);
    gridEntity.DataSource:= NIL;
    PCEntity.ActivePage := TabForm;
  end
  else
  begin
    gridEntity.DataSource:= SrcEntity;
    IQRegFormRead( self, [self, gridEntity]);
    PCEntity.ActivePage := TabGrid;
  end;
end;

procedure TFrm_Frl.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Frl.PopulateFRLdatabase1Click(Sender: TObject);
var
//  DBase:TFDConnection;
  RB: TFDRollbackManager;
  IQFrlLockHandle: string;
  aParam:String;
begin
  if GetEplantNativeCurrencyId = 0 then  {in McShare.pas}
//  if SelectValueAsFloat('select currency_id from iqsys') = 0 then
    raise Exception.Create('No default currency assigned, Please assign through System Parameters');
  if SelectValueAsFloat('select count(entity_num) from frl_entity') <> 0 then
    raise Exception.Create('FRL tables contain data, cannot populate. (to delete all data please use the ''Delete all data'' option)');

  if not IqConfirmYN('Do you wish to populate the database (all current data will be lost)?') then Exit;
{ TODO -oGPatil -cWebConvert : DB_DataModule Undeclared Identifier
  if not DB_DataModule.AcquireIQLock( IQFrlLockHandle, IQMS_FRL, IQLOCK_EXCLUSIVE ) then
  begin
    IQWarning('c_glacct_ybb_all_periods_cumm table is currently in use. Please try again later.');
    EXIT;
  end; }
  try
    Populatefrlentity1Click(PopulateFrlentity1);
    Populate_c_glacct_ybb_all_periods_cumm;
    if SelectValueAsFloat('select id from iq_rollback where SEGMENT_NAME = ''FRL_POPULATE''') = 0 then
      ExecuteCommand('insert into iq_rollback (SEGMENT_NAME, TABLESPACE_NAME, INIT_SIZE, NEXT_EXT ) ' +
             'values (''FRL_POPULATE'', ''ROLLBACK_DATA'', 300, 100)');
{ TODO -oGPatil -cWebConvert : IQMS.Common.RollbackManager does not contain Create
    RB:= IQMS.Common.RollbackManager.Create( 'FRL_POPULATE');      }
    HMsg:= hPleaseWait( 'Populating database...' );
//    DBase := FDManager.FindConnection('IQFD');
//    DBase.StartTransaction;
    RB.Associate;
//    IqTiming1.Start('populate database');

    if cbUseEplants.Checked then
      aParam := 'Y'
    else
      aParam := 'N';

    ExecuteCommandFmt('begin FRX_MISC.POPULATE_FRL_TABLES_NO_ENTITY(''%s''); end;', [AParam]);

{
    with ProcPDatabase do
    begin
      if Params.Count = 0 then
        Params.CreateParam(ftString, 'V_INCL_EPLANTS', ptInput);
      if cbUseEplants.Checked then
        Params[0].asString := 'Y'
      else
        Params[0].asString := 'N';
      Prepare;
      ExecProc;
    end;
}
//    IqTiming1.Stop('populate database');
//    DBase.Commit;
    IQSetTablesActive( false, self );
    IQSetTablesActive( true, self );
    ShowMessage('DataBase populated');
  finally
{ TODO -oGPatil -cWebConvert : DB_DataModule Undeclared Identifier
    DB_DataModule.IQUnLock( IQFrlLockHandle );  }
    try
      HMsg.Free;
    except      // in case it was freed already
    end;
//    if DBase.InTransaction then
//    begin
//      DBase.RollBack;
//    end;
    RB.Free;
    ResetConnection;  {in IQMS.Common.Miscellaneous.pas}
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrm_Frl.Populatefrlentity1Click(Sender: TObject);
var
  DBase:TFDCustomConnection;
  RB: TFDRollbackManager;
  aParam:String;
begin
  try
    HMsg:= hPleaseWait( Format('Populating table %s...', [StrTran(TUniMenuItem(Sender).Hint, 'populate_', '')]) );
    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    if cbUseEplants.Checked then
      aParam := 'Y'
    else
      aParam := 'N';

    ExecuteCommandFmt('begin FRX_MISC.%s(''%s''); end;', [Uppercase(TUniMenuItem(Sender).Hint), AParam]);
{
    with ProcPopulate do
    begin

      StoredProcName := Format('FRX_MISC.%s', [Uppercase(TMenuItem(Sender).Hint)]);
      if Params.Count = 0 then
        Params.CreateParam(ftString, 'V_INCL_EPLANTS', ptInput);
      if cbUseEplants.Checked then
        Params[0].asString := 'Y'
      else
        Params[0].asString := 'N';

      Prepare;
      ExecProc;
    end;
}
    DBase.Commit;
    IQSetTablesActive( false, self );
    IQSetTablesActive( true, self );
  finally
    HMsg.Free;
    if DBase.InTransaction then
    begin
      DBase.RollBack;
    end;
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrm_Frl.Populatefrlbookctrl1Click(Sender: TObject);
var
  DBase:TFDCustomConnection;
  RB: TFDRollbackManager;
begin
  if not IqConfirmYN(Format('Do you wish to populate the %s table (all current data will be lost)?',
         [StrTran(TUniMenuItem(Sender).Hint, 'populate_', '')])) then Exit;
  try
{ TODO -oGPatil -cWebConvert : IQMS.Common.RollbackManager does not contain Create
    RB:= IQMS.Common.RollbackManager.Create( 'FRL_POPULATE');  }
    HMsg:= hPleaseWait( Format('Populating table %s...', [StrTran(TUniMenuItem(Sender).Hint, 'populate_', '')]) );
    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    IqTiming1.Start(StrTran(TUniMenuItem(Sender).Hint, 'populate_', ''));
    with ProcPopulate do
    begin
      StoredProcName := Format('FRX_MISC.%s', [Uppercase(TUniMenuItem(Sender).Hint)]);
      Prepare;
      ExecProc;
    end;
    IqTiming1.Stop(StrTran(TUniMenuItem(Sender).Hint, 'populate_', ''));
    DBase.Commit;
    IQSetTablesActive( false, self );
    IQSetTablesActive( true, self );
    ShowMessage(Format('Table %s populated', [StrTran(TUniMenuItem(Sender).Hint, 'populate_', '')]));
  finally
    HMsg.Free;
    if DBase.InTransaction then
    begin
      DBase.RollBack;
    end;
    RB.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Frl.TblEntityAfterPost(DataSet: TDataSet);
begin
  IqConfirm('table frl_tran_detail must be repopulated if the reporting currency was changed');
end;

procedure TFrm_Frl.Show1Click(Sender: TObject);
begin
 IqTiming1.Display;
end;

procedure TFrm_Frl.Clear1Click(Sender: TObject);
begin
 IqTiming1.Clear;
end;

procedure TFrm_Frl.DeleteAlldata1Click(Sender: TObject);
begin
  if IqConfirmYN('Do you wish to delete all data?') then
  ExecuteCommand('begin FRX_MISC.TruncateAllX; end;');
  TblEntity.Refresh;
end;

procedure TFrm_Frl.ShowupostedGLBatches1Click(Sender: TObject);
begin
  DoShowUnpostedBatches;  {in Frlpost.pas}
end;

procedure TFrm_Frl.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrm_Frl.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrm_Frl.PopulateFRLbudgets1Click(Sender: TObject);
var
  RB: TFDRollbackManager;
begin
  if not IqConfirmYN('Do you wish to populate the FRx budget data with current information (all current budgets info will be lost)?') then Exit;
  try
{ TODO -oGPatil -cWebConvert : IQMS.Common.RollbackManager does not contain Create
    RB:= IQMS.Common.RollbackManager.Create( 'FRL_POPULATE'); }
    HMsg:= hPleaseWait( 'Populating budgets...' );
    RB.Associate;
    if cbUseEplants.Checked then
      ExecuteCommand('begin frx_budget.Populate_frx_budget(''Y''); end;')
    else
      ExecuteCommand('begin frx_budget.Populate_frx_budget(''N''); end;');
    ShowMessage('Budgets populated');
  finally
    HMsg.Free;
    RB.Free;
  end;

end;

procedure TFrm_Frl.PopulateFRLDepreciationBooks1Click(Sender: TObject);
var
  RB: TFDRollbackManager;
begin
  if not IqConfirmYN('Do you wish to populate the FRL Depreciation Books with current information (all current FRL Depreciation Books data will be lost)?') then Exit;
  try
{ TODO -oGPatil -cWebConvert : IQMS.Common.RollbackManager does not contain Create
    RB:= IQMS.Common.RollbackManager.Create( 'FRL_POPULATE'); }
    HMsg:= hPleaseWait( 'Populating Depreciation Books...' );
    RB.Associate;
    if cbUseEplants.Checked then
      ExecuteCommand('begin frx_budget.Populate_frx_Depr_Books(''Y''); end;')
    else
      ExecuteCommand('begin frx_budget.Populate_frx_Depr_Books(''N''); end;');
    ShowMessage('Depreciation Books populated');
  finally
    HMsg.Free;
    RB.Free;
  end;

end;

end.
