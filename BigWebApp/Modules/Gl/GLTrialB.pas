unit GLTrialB;

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
  Vcl.DBGrids,
  Mask,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.PanelMsg,
  { TODO -oathite -cWebConvert : Dependent on IQMS.Common.UserMessages
  IQMS.Common.UserMessages, }
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  vcl.wwdatsrc,
  ActDrill,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniLabel,
  uniDBText,
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniPageControl, uniMainMenu, uniComboBox, uniDBComboBox;

type
  TFrmTrialBalance = class(TUniForm)
    MainMenu1: TUniMainMenu;
    Options1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel3: TUniPanel;
    GridPeriods: TUniDBGrid;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    PnlToolbar: TUniPanel;
    NavPeriods: TUniDBNavigator;
    Splitter1: TUniSplitter;
    SrcGlYear: TDataSource;
    SrcPreiods: TDataSource;
    QryGLPeriod: TFDQuery;
    SrcTotals: TDataSource;
    QryTotals: TFDQuery;
    SrcAccounts: TDataSource;
    QryAccounts: TFDQuery;
    TblGlYear: TFDTable;
    TblGlYearID: TBCDField;
    TblGlYearDESCRIP: TStringField;
    TblGlYearSTART_DATE: TDateTimeField;
    TblGlYearEND_DATE: TDateTimeField;
    Label3: TUniLabel;
    CBGLYear: TUniDBLookupComboBox;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    DBBalance: TUniDBText;
    QryTotalsGLPERIODS_ID: TBCDField;
    QryTotalsTOTAL_DEBIT: TFMTBCDField;
    QryTotalsTOTAL_CREDIT: TFMTBCDField;
    QryTotalsTOTAL_BALANCE: TFMTBCDField;
    SR: TIQWebSecurityRegister;
    TblGlPeriods: TFDTable;
    TblGlPeriodsID: TBCDField;
    TblGlPeriodsGLYEAR_ID: TBCDField;
    TblGlPeriodsPERIOD: TBCDField;
    TblGlPeriodsSTART_DATE: TDateTimeField;
    TblGlPeriodsEND_DATE: TDateTimeField;
    TblGlPeriodsSTATUS: TStringField;
    TblGlAcct: TFDTable;
    QryGLPeriodID: TBCDField;
    QryGLPeriodGLYEAR_ID: TBCDField;
    QryGLPeriodPERIOD: TBCDField;
    QryGLPeriodSTART_DATE: TDateTimeField;
    QryGLPeriodEND_DATE: TDateTimeField;
    QryGLPeriodSTATUS: TStringField;
    QryGLPeriodytd_balance: TFloatField;
    QryAccountsGLACCT_ID: TBCDField;
    QryAccountsGLYEAR_ID: TBCDField;
    QryAccountsACCT: TStringField;
    QryAccountsDESCRIP: TStringField;
    QryAccountsGLYEAR_START_DATE: TDateTimeField;
    QryAccountsGLYEAR_END_DATE: TDateTimeField;
    QryAccountsYTD_BEGINNING: TFMTBCDField;
    QryAccountsYTD_BALANCE: TBCDField;
    QryAccountsYTD_CREDIT: TBCDField;
    QryAccountsYTD_DEBIT: TBCDField;
    QryAccountsYEAR_END_BALANCE: TFMTBCDField;
    QryAccountsGLPERIODS_START_DATE: TDateTimeField;
    QryAccountsGLPERIODS_END_DATE: TDateTimeField;
    QryAccountsGLPERIODS_ID: TBCDField;
    QryAccountsPERIOD_DEBIT: TBCDField;
    QryAccountsPERIOD_CREDIT: TBCDField;
    QryAccountsPERIOD_BALANCE: TBCDField;
    QryAccountsCUMM_PERIOD_BALANCE: TFMTBCDField;
    DBDebit: TUniDBText;
    DBCredit: TUniDBText;
    QryGLPeriodYTD_CREDIT: TFMTBCDField;
    QryGLPeriodYTD_DEBIT: TFMTBCDField;
    QryAccountsTYPE: TStringField;
    QryAccountsMAJORTYPE: TStringField;
    Contents1: TUniMenuItem;
    QryAccountsPeriod_beginning_balance: TFloatField;
    QryAccountsPeriod_end_balance: TFloatField;
    QryAccountsEPLANT_ID: TBCDField;
    Bevel2: TUniPanel;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    PKAcctEPLANT_ID: TBCDField;
    SrcTblBatchId: TDataSource;
    QryBatchId: TFDQuery;
    QryBatchIdBATCH_ID: TBCDField;
    QryBatchIdBATCH_DATE: TDateTimeField;
    QryBatchIdBATCHNUMBER: TBCDField;
    QryBatchIdSOURCE: TStringField;
    QryBatchIdTOTAL_DEBIT: TFMTBCDField;
    QryBatchIdTOTAL_CREDIT: TFMTBCDField;
    QryBatchIdBALANCE: TFMTBCDField;
    QryBatchIdOnHand: TFloatField;
    QryBatchIdUSERID: TStringField;
    QryBatchIdRunningTotal: TFloatField;
    QryBatchIdGLYEAR_ID: TBCDField;
    QryBatchIdGLACCT_ID: TBCDField;
    QryBatchIdPERIOD_ID: TBCDField;
    SrcTblBatch: TDataSource;
    QryBatchOld: TFDQuery;
    QryBatchOldDEBIT: TBCDField;
    QryBatchOldCREDIT: TBCDField;
    QryBatchOldGLBATCHID_ID: TBCDField;
    QryBatchOldTableName: TStringField;
    QryBatchOldHEADER_ID: TBCDField;
    QryBatchOldDESCRIP: TStringField;
    QryBatchOldREFERENCE: TStringField;
    QryBatchOldREF_CODE: TStringField;
    QryBatchOldID2: TBCDField;
    QryBatchOldCost_Source: TStringField;
    QryBatchOldCOST_OBJECT_ID: TBCDField;
    QryBatchOldCOST_OBJECT_SOURCE: TStringField;
    QryPeriod: TFDQuery;
    QryPeriodPERIOD: TBCDField;
    QryPeriodGLYEAR_ID: TBCDField;
    QryPeriodGLACCT_ID: TBCDField;
    QryPeriodPERIOD_ID: TBCDField;
    QryPeriodGlYear_Descrip: TStringField;
    QryPeriodTOTAL_CREDIT: TBCDField;
    QryPeriodTOTAL_DEBIT: TBCDField;
    QryPeriodTOTAL: TBCDField;
    QryPeriodBEGINNING: TFMTBCDField;
    QryPeriodBALANCE: TFMTBCDField;
    QryPeriodBUDGETED: TFMTBCDField;
    SrcQry: TDataSource;
    TblGlBatchId: TFDTable;
    SrcWholeBatch: TDataSource;
    QryWholeBatch: TFDQuery;
    QryWholeBatchDESCRIP: TStringField;
    QryWholeBatchDEBIT: TBCDField;
    QryWholeBatchCREDIT: TBCDField;
    QryWholeBatchACCT: TStringField;
    QryWholeBatchREFERENCE: TStringField;
    QryWholeBatchREF_CODE: TStringField;
    QryWholeBatchNUM_OF_SUPP_DOCS: TBCDField;
    QryWholeBatchACCT_DESCRIP: TStringField;
    QryWholeBatchGLBATCHID_ID: TBCDField;
    QryWholeBatchHEADER_ID: TBCDField;
    QryWholeBatchBATCHNUMBER: TBCDField;
    QryWholeBatchSOURCE: TStringField;
    SrcAccountsStat: TDataSource;
    QryAccountsStat: TFDQuery;
    Panel1: TUniPanel;
    PC: TUniPageControl;
    TabMon: TUniTabSheet;
    TabStat: TUniTabSheet;
    Panel4: TUniPanel;
    Bevel1: TUniPanel;
    Panel9: TUniPanel;
    Label6: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    SBSearchPurch: TUniSpeedButton;
    edPeriod: TUniEdit;
    edFrom: TUniEdit;
    edTo: TUniEdit;
    Panel2: TUniPanel;
    BtnApply: TUniButton;
    GridAccounts: TUniDBGrid;
    Panel10: TUniPanel;
    Bevel3: TUniPanel;
    Panel11: TUniPanel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label7: TUniLabel;
    SpeedButton1: TUniSpeedButton;
    edPeriodStat: TUniEdit;
    edFromStat: TUniEdit;
    edToStat: TUniEdit;
    Panel12: TUniPanel;
    BtnApplyStat: TUniButton;
    GridAccountsStat: TUniDBGrid;
    QryAccountsStatID: TBCDField;
    QryAccountsStatGLYEAR_ID: TBCDField;
    QryAccountsStatGLACCT_ID: TBCDField;
    QryAccountsStatGLPERIODS_ID: TBCDField;
    QryAccountsStatSTART_DATE: TDateTimeField;
    QryAccountsStatEND_DATE: TDateTimeField;
    QryAccountsStatSTAT_VALUE: TFMTBCDField;
    QryAccountsStatSTAT_VALUE_BALANCE: TFMTBCDField;
    QryAccountsStatACCT: TStringField;
    QryAccountsStatGL_SUBACCT_TYPE_ID: TBCDField;
    QryAccountsStatEPLANT_ID: TBCDField;
    QryAccountsStatCUMM_PERIOD_BALANCE: TFMTBCDField;
    QryAccountsStatPeriod_beginning_balance: TFloatField;
    QryAccountsStatPeriod_end_balance: TFloatField;
    QryAccountsStatYTD_BEGINNING: TFMTBCDField;
    QryAccountsStatDESCRIP: TStringField;
    QryAccountsStatPeriod_Balance: TFloatField;
    QryTotalsTOTAL_STAT_VALUE: TFMTBCDField;
    QryTotalsTOTAL_STAT_VALUE_BALANCE: TFMTBCDField;
    PKAcctStat: TIQWebHPick;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TBCDField;
    QryBatchOldSTAT_VALUE: TFMTBCDField;
    QryBatch: TFDQuery;
    QryBatchDESCRIP: TStringField;
    QryBatchDEBIT: TBCDField;
    QryBatchCREDIT: TBCDField;
    QryBatchGLBATCHID_ID: TBCDField;
    QryBatchHEADER_ID: TBCDField;
    QryBatchREFERENCE: TStringField;
    QryBatchREF_CODE: TStringField;
    QryBatchCOST_OBJECT_ID: TBCDField;
    QryBatchCOST_OBJECT_SOURCE: TStringField;
    QryBatchID2: TBCDField;
    QryBatchSTAT_VALUE: TFMTBCDField;
    QryBatchTableName: TStringField;
    QryBatchCOST_SOURCE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure SrcPreiodsDataChange(Sender: TObject; Field: TField);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryAccountsCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure QryGLPeriodCalcFields(DataSet: TDataSet);
    procedure CBGLYearCloseUp(Sender: TObject);
    procedure QryGLPeriodBeforeScroll(DataSet: TDataSet);
    procedure QryGLPeriodAfterScroll(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure GridPeriodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridPeriodsEnter(Sender: TObject);
    procedure GridAccountsEnter(Sender: TObject);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure QryBatchIdBeforeOpen(DataSet: TDataSet);
    procedure QryBatchIdCalcFields(DataSet: TDataSet);
    procedure QryAccountsAfterScroll(DataSet: TDataSet);
    procedure GridAccountsDblClick(Sender: TObject);
    procedure QryPeriodBeforeOpen(DataSet: TDataSet);
    procedure QryBatchOldBeforeOpen(DataSet: TDataSet);
    procedure QryBatchIdAfterScroll(DataSet: TDataSet);
    procedure QryWholeBatchBeforeOpen(DataSet: TDataSet);
    procedure QryAccountsStatCalcFields(DataSet: TDataSet);
    procedure BtnApplyStatClick(Sender: TObject);
    procedure GridAccountsStatEnter(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SrcTblBatchIdDataChange(Sender: TObject; Field: TField);
    procedure QryBatchBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    nGlPeriodsId:Real;
    //GLYearHint:TNotifyEvent;
    hMsg:TPanelMesg;
    procedure DisplayHint(Sender: TObject);
    { TODO -oathite -cWebConvert : IQMS.Common.UserMessages
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage; }
    procedure ResetDrillDown;
    procedure CloseDrillDown;
    procedure OpenDrillDown;
  public
    { Public declarations }
    fDrillDown : TFrmActDrillDown;
    BegBatchBal, PrevBatchBal2, PrevBatchBal:Real;
  end;

procedure DoTrialBalance;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  IQMS.Common.NLS,
  gl_rscstr,
  IQMS.Common.Dialogs,
  IQMS.Common.Cursor;

var
  AStart:TDateTime;

procedure StartTimer;
begin
  AStart:= Now;
end;

procedure ShowTimer( const S:string );
begin
  IQMS.Common.Dialogs.IQInformation( Format( '%s Time = %10.6f secs', [S, (Now - AStart)*86400 ]));
  AStart:= Now;
end;

procedure DoTrialBalance;
begin
  TFrmTrialBalance.Create(UniApplication).Show;
end;

{ TODO -oathite -cWebConvert : Dependent on IQMS.Common.UserMessages }
(*
procedure TFrmTrialBalance.IQAfterShowMessage( var Msg: TMessage );
begin
   QryGlPeriod.Close;
   QryGlPeriod.ParamByName('nID').Value := TblGlYear.FieldByName('ID').asFloat;
   QryGlPeriod.Open;
   QryGLPeriod.Locate('ID', nGlPeriodsId, []);
   try
     QryGLPeriodBeforeScroll(nil);
//     QryAccounts.Open;
   finally
     QryGLPeriodAfterScroll(nil);
   end;
end;
 *)

procedure TFrmTrialBalance.FormCreate(Sender: TObject);
begin
  nGlPeriodsId := SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
                            [FormatDateTime('mm/dd/yyyy', Date)]);
  CBGLYear.KeyValue := SelectValueAsFloat(IQFormat('select glyear_id from glperiods where id = %f',
                              [nGlPeriodsId]));
  GridAccounts.Cursor:= crDrill;
  //GLYearHint := Application.OnHint;
//  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );

  IQSetTablesActive( FALSE, self );
  IQSetTablesActive( TRUE, self );

  IQRegFormRead( self, [ self, Panel3, GridPeriods, GridAccounts, GridAccountsStat ]);
end;

procedure TFrmTrialBalance.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDrillDown <> nil then
  begin
    fDrillDown.Close;
    fDrillDown := nil;
  end;

  application.processmessages;

  try
    IQRegFormWrite( self, [ self, Panel3, GridPeriods, GridAccounts, GridAccountsStat ]);
  finally
    Application.OnHint:= NIL;  // GLYearHint;
  end;
end;

procedure TFrmTrialBalance.DisplayHint(Sender: TObject);
begin
  with TblGlYear do
  CBGLYear.Hint := Format(gl_rscstr.cTXT0000044 {'Start Date: %s End Date: %s'},
                   [FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
                    FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
end;


procedure TFrmTrialBalance.About1Click(Sender: TObject);
begin
 IqAbout1.Execute;
end;


procedure TFrmTrialBalance.SrcPreiodsDataChange(Sender: TObject;
  Field: TField);
begin
//  QryTotals.Close;
//  QryTotals.Open;
end;

procedure TFrmTrialBalance.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmTrialBalance.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmTrialBalance.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrialBalance.QryAccountsCalcFields(DataSet: TDataSet);
var
  nPrevBal :Real;
  nPeriodId:Real;
begin
 with QryAccounts do
  begin
    FieldByName('Period_beginning_balance').asFloat :=
      FieldByName('cumm_period_balance').AsFloat + FieldByName('ytd_beginning').asFloat;
    FieldByName('Period_end_balance').asFloat :=
      FieldByName('cumm_period_balance').AsFloat + FieldByName('ytd_beginning').asFloat +
      FieldByName('period_balance').asFloat;
  end;

// with QryAccounts do
//  begin
//    if not ((FieldByName('MAJORTYPE').asString = 'REVENUE') or
//       (FieldByName('MAJORTYPE').asString = 'EXPENSE')) then
//      FieldByName('YTD').asFloat := FieldByName('YTP_PERIOD_BALANCE').asFloat +
//                                    FieldByName('PREV_YTD_BALANCE').asFloat
//    else
//      FieldByName('YTD').asFloat := FieldByName('YTP_PERIOD_BALANCE').asFloat;
//    FieldByName('ActualStartbal').asFloat := FieldByName('YTD').asFloat -
//                                             FieldByName('PERIOD_BALANCE').asFloat;
//  end;
end;

procedure TFrmTrialBalance.FormDestroy(Sender: TObject);
begin
  fDrillDown := nil;
  IQSetTablesActive( FALSE, self );
end;

procedure TFrmTrialBalance.QryGLPeriodCalcFields(DataSet: TDataSet);
begin
  with QryGLPeriod do
    FieldByName('ytd_balance').asfloat := FieldByName('ytd_debit').asFloat - FieldByName('ytd_credit').asFloat;
end;

procedure TFrmTrialBalance.CBGLYearCloseUp(Sender: TObject);
begin
  try
    QryGLPeriodBeforeScroll(nil);
    Screen.Cursor := crHourGlass;
    QryGlPeriod.Close;
    QryGlPeriod.ParamByName('nID').Value := TblGlYear.FieldByName('ID').asFloat;
    QryGlPeriod.Open;
    Screen.Cursor := crDefault;
  finally
    QryGLPeriodAfterScroll(nil);
  end;
end;

procedure TFrmTrialBalance.QryGLPeriodBeforeScroll(DataSet: TDataSet);
begin
//  if Assigned( hMsg ) then
//     hMsg.Free;
//  hMsg:= hPleaseWait( 'Accessing database (GL Accounts) ...'  );
end;

procedure TFrmTrialBalance.QryGLPeriodAfterScroll(DataSet: TDataSet);
begin
  if QryGLPeriod.FieldByName('PERIOD').asString = edPeriod.Text then
  begin
    GridAccounts.Color := clWhite;
    GridAccountsStat.Color := clWhite;
  end
  else
  begin
    GridAccounts.Color := clBtnFace;
    GridAccountsStat.Color := clBtnFace;
  end;

  if fDrillDown <> nil then
    ResetDrillDown;

//  if Assigned( hMsg ) then
//  begin
//     hMsg.Free;
//     hMsg:= NIL;
//  end;
end;

procedure TFrmTrialBalance.Contents1Click(Sender: TObject);
begin
//  Application.HelpContext(51);
  IQHelp.HelpContext( 1088761 );
end;

procedure TFrmTrialBalance.FormActivate(Sender: TObject);
begin
  Application.OnHint  := DisplayHint;
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTrialBalance.BtnApplyClick(Sender: TObject);
begin
  try
    hMsg:= hPleaseWait(gl_rscstr.cTXT0000045 {'Accessing GL Accounts.  Please wait.'});

    edPeriod.Text := QryGLPeriod.FieldByName('PERIOD').asString;
    edFrom.Text   := DateToStr(QryGLPeriod.FieldByName('START_DATE').asDateTime);
    edTo.Text     := DateToStr(QryGLPeriod.FieldByName('END_DATE').asDateTime);

    // QryAccounts.Close;
    // QryAccounts.ParamByName('nGLPeriodsId').Value := QryGLPeriod.FieldByName('ID').asFloat;
    // QryAccounts.Open;

    IQAssignEPlantFilter( QryAccounts );  {pas}

    with QryAccounts do
    begin


      if Filter > '' then
        Filter := Format('(%s) and ', [Filter]) + Format('glperiods_id = %f', [ QryGLPeriod.FieldByName('ID').asFloat ])
      else
        Filter := Format('glperiods_id = %f', [ QryGLPeriod.FieldByName('ID').asFloat ]);
      Filtered := True;


//      Filter  := Format('glperiods_id = %f', [ QryGLPeriod.FieldByName('ID').asFloat ]);
//      Filtered:= TRUE;
      if not Active then
        Open;
    end;

    QryTotals.Close;
    QryTotals.ParamByName('nGLPeriodsId').Value := QryGLPeriod.FieldByName('ID').asFloat;
    QryTotals.Open;

    GridAccounts.Color := clWhite;
  finally
     hMsg.Free;
  end;
end;

procedure TFrmTrialBalance.GridPeriodsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then BtnApplyClick(nil);
end;

procedure TFrmTrialBalance.GridPeriodsEnter(Sender: TObject);
begin
  NavPeriods.DataSource := SrcPreiods;
end;

procedure TFrmTrialBalance.GridAccountsEnter(Sender: TObject);
begin
  NavPeriods.DataSource := SrcAccounts;
end;

procedure TFrmTrialBalance.SBSearchPurchClick(Sender: TObject);
var
  AAcctId:Real;
begin
  if QryAccounts.Active then
    with PKAcct do
      if Execute then
      begin
        AAcctId := GetValue('ID');
        QryAccounts.Locate('GLACCT_ID', AAcctId, []);
      end;
end;

procedure TFrmTrialBalance.QryBatchIdAfterScroll(DataSet: TDataSet);
begin
  QryBatch.Close;
  QryBatch.Open;
  QryWholeBatch.Close;
  QryWholeBatch.Open;
end;

procedure TFrmTrialBalance.QryBatchIdBeforeOpen(DataSet: TDataSet);
begin
  QryBatchId.ParamByName('aPERIOD_ID').Value := QryGLPeriodID.asFloat;
  if PC.activepage = TabStat then
    QryBatchId.ParamByName('aGLACCT_ID').Value := QryAccountsStatGLACCT_ID.asFloat
  else
    QryBatchId.ParamByName('aGLACCT_ID').Value := QryAccountsGLACCT_ID.asFloat;
  QryBatchId.ParamByName('aGLYEAR_ID').Value := QryGLPeriodGLYEAR_ID.asFloat;
//  QryBatchId.ParamByName('nFromBatchDate').Value := QryGLPeriodSTART_DATE.asdateTime;
//  QryBatchId.ParamByName('nToBatchDate').Value := QryGLPeriodEND_DATE.asDateTime;
end;

procedure TFrmTrialBalance.QryBatchIdCalcFields(DataSet: TDataSet);
var
  AOrder:String;
  AOnHand:Real;
begin
  with QryBatchId do
//  if fDrillDown <> nil then
  begin
  BegBatchBal := SrcQry.DataSet.FieldByName('Beginning').AsFloat;
  FieldByName('OnHand').asFloat :=
    SelectValueFmtAsFloat('select sum(Balance) as batch_balance                                            ' +
              '  from (select glyear_id,                                                       ' +
              '              glacct_id,                                                        ' +
              '              period_id,                                                        ' +
              '              batch_id,                                                         ' +
              '              batch_date,                                                       ' +
              '              Sum(NVL(batch_credit, 0)) as Total_Credit,                        ' +
              '              Sum(NVL(batch_debit, 0)) as Total_Debit,                          ' +
              '              Sum(NVL(batch_debit, 0)) - Sum(NVL(batch_credit, 0)) as Balance   ' +
              '         from v_glperiods_batch                                                 ' +
              '       where period_id = %f                                                     ' +
              '          and glacct_id = %f                                                    ' +
              '          and glyear_id = %f                                                    ' +
              '          and batch_id <= %f                                                    ' +
              '        group by glyear_id,                                                     ' +
              '                period_id,                                                      ' +
              '                period,                                                         ' +
              '                glacct_id,                                                      ' +
              '                batch_id,                                                       ' +
              '                batch_date)                                                     ',
              [FieldByName('PERIOD_ID').asFloat,
               FieldByName('GLACCT_ID').asFloat,
               FieldByName('GLYEAR_ID').asFloat,
               FieldByName('BATCH_ID').asFloat]) + BegBatchBal;

  if PrevBatchBal2 = 0 then
  begin
    AOnHand :=
      SelectValueFmtAsFloat('select sum(Balance) as batch_balance                                            ' +
                '  from (select sum(NVL(batch_debit, 0)) - Sum(NVL(batch_credit, 0)) as Balance   ' +
                '         from v_glperiods_batch                                                 ' +
                '       where period_id = %f                                                     ' +
                '          and glacct_id = %f                                                    ' +
                '          and glyear_id = %f                                                    ' +
                '          and batch_date <= To_Date(''%s'', ''MM/DD/RRRR''))                    ',
                [FieldByName('PERIOD_ID').asFloat,
                 FieldByName('GLACCT_ID').asFloat,
                 FieldByName('GLYEAR_ID').asFloat,
                 FormatDateTime('mm/dd/yyyy', FieldByName('BATCH_DATE').asDateTime)]);

    QryBatchId.FieldByName('RunningTotal').asFloat := AOnHand;
  end
  else
    QryBatchId.FieldByName('RunningTotal').asFloat := PrevBatchBal2 + QryBatchIdBALANCE.asFloat;

  PrevBatchBal2 := QryBatchId.FieldByName('RunningTotal').asFloat;



//    FieldByName('OnHand').asFloat := FieldByName('BALANCE').asFloat + BegBatchBal;
    PrevBatchBal := FieldByName('OnHand').asFloat;
  end;
end;

procedure TFrmTrialBalance.QryBatchOldBeforeOpen(DataSet: TDataSet);
begin
  QryBatch.ParamByName('aBATCH_ID').Value := QryBatchIdBATCH_ID.asFloat;
  QryBatch.ParamByName('aGLACCT_ID').Value := QryBatchIdGLACCT_ID.asFloat;
end;

procedure TFrmTrialBalance.QryAccountsAfterScroll(DataSet: TDataSet);
begin
  if fDrillDown <> nil then
    ResetDrillDown;
end;

procedure TFrmTrialBalance.ResetDrillDown;
var
 cStartDate, cEndDate, cPeriod:string;
begin
  QryBatchId.Close;
  QryBatchId.Open;

  QryBatch.Close;
  QryBatch.Open;

  QryPeriod.Close;
  QryPeriod.Open;
  cStartDate := DateToStr(QryGLPeriodSTART_DATE.asdateTime);
  cEndDate   := DateToStr(QryGLPeriodEND_DATE.asDateTime);
  cPeriod :=  IntToStr(QryGLPeriodPERIOD.asInteger);
  if fDrillDown <> nil then
  begin
    fDrillDown.Caption := Format('Period: %s, From %s To %s', [cPeriod, cStartDate, cEndDate]);
    if PC.activepage = TabStat then
      fDrillDown.LblAccount.Caption := 'Tr. summary for account: ' + QryAccountsStatACCT.AsString
    else
      fDrillDown.LblAccount.Caption := 'Tr. summary for account: ' + QryAccountsACCT.AsString;
    fDrillDown.LblBatch.Caption := 'Details for Batch#: ' + QryBatchId.FieldByName('BATCHNUMBER').AsString;
  end;

end;

procedure TFrmTrialBalance.CloseDrillDown;
begin
  if fDrillDown <> nil then
    fDrillDown.Close;
  QryBatchId.Close;
  QryBatch.Close;
  QryPeriod.Close;
end;

procedure TFrmTrialBalance.OpenDrillDown;
var
 cStartDate, cEndDate, cPeriod:string;
begin
  ResetDrillDown;
  fDrillDown := TFrmActDrillDown.Create(self);
  PrevBatchBal2 := 0;
  cStartDate := DateToStr(QryGLPeriodSTART_DATE.asdateTime);
  cEndDate   := DateToStr(QryGLPeriodEND_DATE.asDateTime);
  cPeriod :=  IntToStr(QryGLPeriodPERIOD.asInteger);
  if fDrillDown <> nil then
  begin
    fDrillDown.Caption := Format('Period: %s, From %s To %s', [cPeriod, cStartDate, cEndDate]);
    if PC.activepage = TabStat then
      fDrillDown.LblAccount.Caption := 'Tr. summary for account: ' + QryAccountsStatACCT.AsString
    else
      fDrillDown.LblAccount.Caption := 'Tr. summary for account: ' + QryAccountsACCT.AsString;
    fDrillDown.LblBatch.Caption := 'Details for Batch#: ' + QryBatchId.FieldByName('BATCHNUMBER').AsString;
  end;

  fDrillDown.Show;
end;

procedure TFrmTrialBalance.GridAccountsDblClick(Sender: TObject);
begin
  if fDrillDown <> nil then
    CloseDrillDown
  else
    OpenDrillDown;
end;

procedure TFrmTrialBalance.QryPeriodBeforeOpen(DataSet: TDataSet);
begin
  QryPeriod.ParamByName('nGLYearId').Value := QryGLPeriodGLYEAR_ID.asFloat;
  if PC.activepage = TabStat then
    QryPeriod.ParamByName('nGlAcctId').Value := QryAccountsStatGLACCT_ID.asFloat
  else
    QryPeriod.ParamByName('nGlAcctId').Value := QryAccountsGLACCT_ID.asFloat;
  QryPeriod.ParamByName('nglperiod_id').Value := QryGLPeriodID.asFloat;
end;

procedure TFrmTrialBalance.QryWholeBatchBeforeOpen(DataSet: TDataSet);
begin
  QryWholeBatch.ParamByName('abatch_id').Value := QryBatchIdBATCH_ID.asFloat;
end;

procedure TFrmTrialBalance.QryAccountsStatCalcFields(DataSet: TDataSet);
var
  nPrevBal :Real;
  nPeriodId:Real;
begin
    QryAccountsStatPeriod_beginning_balance.asFloat :=
      QryAccountsStatcumm_period_balance.AsFloat + QryAccountsStatytd_beginning.asFloat;
    QryAccountsStatPeriod_end_balance.asFloat := QryAccountsStatcumm_period_balance.AsFloat +
                                                 QryAccountsStatytd_beginning.asFloat +
                                                 QryAccountsStatSTAT_VALUE_BALANCE.asFloat;
    QryAccountsStatPeriod_balance.asFloat := QryAccountsStatcumm_period_balance.AsFloat +
                                             QryAccountsStatytd_beginning.asFloat +
                                             QryAccountsStatSTAT_VALUE_BALANCE.asFloat;
end;

procedure TFrmTrialBalance.BtnApplyStatClick(Sender: TObject);
begin

  try
    hMsg:= hPleaseWait(gl_rscstr.cTXT0000045 {'Accessing GL Accounts.  Please wait.'});

    edPeriodStat.Text := QryGLPeriod.FieldByName('PERIOD').asString;
    edFromStat.Text   := DateToStr(QryGLPeriod.FieldByName('START_DATE').asDateTime);
    edToStat.Text     := DateToStr(QryGLPeriod.FieldByName('END_DATE').asDateTime);

    IQAssignEPlantFilter( QryAccountsStat );  {pas}

    with QryAccountsStat do
    begin
      if Filter > '' then
        Filter := Format('(%s) and ', [Filter]) + Format('glperiods_id = %f', [ QryGLPeriod.FieldByName('ID').asFloat ])
      else
        Filter := Format('glperiods_id = %f', [ QryGLPeriod.FieldByName('ID').asFloat ]);
      Filtered := True;
      if not Active then
        Open;
    end;

    QryTotals.Close;
    QryTotals.ParamByName('nGLPeriodsId').Value := QryGLPeriod.FieldByName('ID').asFloat;
    QryTotals.Open;

    GridAccountsStat.Color := clWhite;
  finally
     hMsg.Free;
  end;
end;

procedure TFrmTrialBalance.GridAccountsStatEnter(Sender: TObject);
begin
  NavPeriods.DataSource := SrcAccountsStat;
end;

procedure TFrmTrialBalance.PCChange(Sender: TObject);
begin
  if PC.activepage = TabStat then
  begin
    Panel6.Caption := 'Value Total:';
    DBDebit.dataField := 'TOTAL_STAT_VALUE';
    Panel8.visible := false;
    DBBalance.DataField := 'TOTAL_STAT_VALUE_BALANCE';
  end
  else
  begin
    Panel6.Caption := 'Debit Total:';
    DBDebit.dataField := 'TOTAL_DEBIT';
    Panel8.visible := true;
    DBBalance.DataField := 'TOTAL_BALANCE';
  end;

end;


procedure TFrmTrialBalance.SpeedButton1Click(Sender: TObject);
var
  AAcctId:Real;
begin
  if QryAccountsStat.Active then
    with PKAcctStat do
      if Execute then
      begin
        AAcctId := GetValue('ID');
        QryAccountsStat.Locate('GLACCT_ID', AAcctId, []);
      end;
end;

procedure TFrmTrialBalance.SrcTblBatchIdDataChange(Sender: TObject;
  Field: TField);
begin
  if fDrillDown <> nil then
    fDrillDown.LblBatch.Caption := 'Details for Batch#: ' + QryBatchId.FieldByName('BATCHNUMBER').AsString;
end;

procedure TFrmTrialBalance.QryBatchBeforeOpen(DataSet: TDataSet);
begin
  QryBatch.ParamByName('aBATCH_ID').Value := QryBatchIdBATCH_ID.asFloat;
  QryBatch.ParamByName('aGLACCT_ID').Value := QryBatchIdGLACCT_ID.asFloat;
end;

end.


