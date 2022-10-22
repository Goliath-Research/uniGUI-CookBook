unit Dm_Budg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt;

type
  TModifiedBudget = class
    GLACCT_ID     : Real;
    constructor Create( AGLACCT_ID : Real );
end;

type
  TBudg_DM = class(TDataModule)
    SrcGLPeriods: TDataSource;
    SrcGlYear: TDataSource;
    TblGlYear: TFDTable;
    TblGlYearID: TBCDField;
    TblGlYearDESCRIP: TStringField;
    TblGlYearSTART_DATE: TDateTimeField;
    TblGlYearEND_DATE: TDateTimeField;
    TblGLPeriods: TFDTable;
    TblGLPeriodsID: TBCDField;
    TblGLPeriodsGLYEAR_ID: TBCDField;
    TblGLPeriodsSTART_DATE: TDateTimeField;
    TblGLPeriodsEND_DATE: TDateTimeField;
    TblGLPeriodsSTATUS: TStringField;
    TblGLPeriodsPERIOD: TBCDField;
    SrcIQSys: TDataSource;
    TblIQSys: TFDTable;
    TblIQSysACCT_MASK: TStringField;
    TblIQSysACCT_ACCOUNT_MASK: TStringField;
    TblIQSysACCT_DEPARTMENT_MASK: TStringField;
    TblIQSysACCT_DIVISION_MASK: TStringField;
    TblIQSysACCT_INIT: TStringField;
    PkGLAcct: TIQWebHPick;
    PkGLAcctACCT: TStringField;
    PkGLAcctDESCRIP: TStringField;
    PkGLAcctID: TBCDField;
    TblIQSysCOMPANY: TStringField;
    TblIQSysADDRESS1: TStringField;
    TblIQSysADDRESS2: TStringField;
    TblIQSysCITY: TStringField;
    TblIQSysSTATE: TStringField;
    TblIQSysZIP: TStringField;
    TblIQSysCOUNTRY: TStringField;
    TblIQSysPHONE: TStringField;
    TblIQSysFAX: TStringField;
    TblIQSysEMAIL: TStringField;
    TblIQSysINTERNET: TStringField;
    TblIQSysFED_ID: TStringField;
    TblIQSysDEFAULTPERIOD: TStringField;
    TblIQSysACCT_ID_CASH: TBCDField;
    TblIQSysACCT_ID_AP: TBCDField;
    TblIQSysACCT_ID_AR: TBCDField;
    TblIQSysACCT_ID_FG: TBCDField;
    TblIQSysACCT_ID_FED: TBCDField;
    TblIQSysACCT_ID_SALES: TBCDField;
    TblIQSysACCT_ID_SALESTAX: TBCDField;
    TblIQSysPERIODS_REP_BEG: TStringField;
    TblIQSysPERIODS_REP_END: TStringField;
    TblIQSysREFERENCE: TBCDField;
    TblIQSysNEXTBATCH: TBCDField;
    TblIQSysLAST_QUOTE: TBCDField;
    TblIQSysLAST_ORDER: TBCDField;
    TblIQSysLAST_INVOICE: TBCDField;
    TblIQSysLAST_PO: TBCDField;
    TblIQSysACCT_ID_DISC: TBCDField;
    TblIQSysAPPERIOD: TStringField;
    TblIQSysARPERIOD: TStringField;
    TblIQSysACCT_ID_INVSHRINK: TBCDField;
    TblIQSysACCT_ID_APDISC: TBCDField;
    TblIQSysACCT_ID_ARDISC: TBCDField;
    TblIQSysACCT_ID_COGS: TBCDField;
    TblIQSysACCT_ID_SHIPPING: TBCDField;
    TblIQSysACCT_ID_EXTCHG: TBCDField;
    TblIQSysACCT_ID_WIP: TBCDField;
    TblIQSysACCT_ID_CE: TBCDField;
    TblIQSysPSNUMBER: TBCDField;
    TblIQSysFINANCE_CHG_: TBCDField;
    TblIQSysLAST_RMA: TBCDField;
    TblIQSysLAST_TOOLPM: TBCDField;
    TblIQSysGJBATCH: TBCDField;
    TblIQSysCRBATCH: TBCDField;
    TblIQSysCDBATCH: TBCDField;
    TblIQSysPOBATCH: TBCDField;
    TblIQSysAARBATCH: TBCDField;
    TblIQSysPRBATCH: TBCDField;
    TblIQSysARAGING: TStringField;
    TblIQSysAPAGING: TStringField;
    TblIQSysCASHFLOW: TStringField;
    TblIQSysSERVICECHG: TBCDField;
    TblIQSysMINSERVICECHG: TBCDField;
    TblIQSysRESTOCK: TBCDField;
    TblIQSysCLOSEPOWITHIN: TBCDField;
    TblIQSysCURRENCYCODE: TStringField;
    TblIQSysMULTICURRENCY: TStringField;
    QryGLAcct_Budget: TFDQuery;
    QryGLAcct_BudgetGLACCT_ID: TBCDField;
    QryGLAcct_BudgetGLACCT: TStringField;
    QryGLAcct_BudgetGLACCT_DESCRIP: TStringField;
    QryGLAcct_BudgetGLSUB_ACCT_ID: TBCDField;
    QryGLAcct_BudgetGLSUB_ACCT_DESCRIP: TStringField;
    QryGLAcct_BudgetGLACCT_FY_ID: TBCDField;
    QryGLAcct_BudgetGLYEAR_ID: TBCDField;
    QryGLAcct_BudgetYTDBUDGET: TBCDField;
    SrcGLAcct_Budget: TDataSource;
    QryGLAcct_BudgetPrevYTD: TFloatField;
    QryGLAcct_BudgetPrevBudget: TFloatField;
    QryGLAcct_BudgetPrevVar: TFloatField;
    SrcGLBudget: TDataSource;
    SrcPrevPeriodBudget: TDataSource;
    QryPrevPeriodBudget: TFDQuery;
    QryPrevPeriodBudgetGLACCT_FY_ID: TBCDField;
    QryPrevPeriodBudgetGLYEAR_ID: TBCDField;
    QryPrevPeriodBudgetGLACCT_ID: TBCDField;
    QryPrevPeriodBudgetGLPERIODS_ID: TBCDField;
    QryPrevPeriodBudgetPERIOD: TBCDField;
    QryPrevPeriodBudgetBUDAMOUNT: TBCDField;
    QryPrevPeriodBudgetBUDPERCENT: TBCDField;
    QryPrevPeriodBudgetPeriodActual: TFloatField;
    QryPrevPeriodBudgetPeriodVariance: TFloatField;
    QryGLAcct_BudgetPrevGLAcct_FY_ID: TFloatField;
    TblIQSysGLYEAR_ID: TBCDField;
    updSQLAcctBudget: TFDUpdateSQL;
    updSQLBudget: TFDUpdateSQL;
    TblIQSysGLPERIOD_ID: TBCDField;
    TblIQSysCD_CHECK_LINES: TBCDField;
    TblIQSysCD_CHECK_REPNAME: TStringField;
    TblIQSysCD_CHECK_REMITANCE: TStringField;
    TblIQSysCD_AFTERPOST_REPORT: TStringField;
    TblIQSysCR_AFTERPOST_REPORT: TStringField;
    TblIQSysAP_AFTERPOST_REPORT: TStringField;
    TblIQSysAR_AFTERPOST_REPORT: TStringField;
    TblIQSysGJ_AFTERPOST_REPORT: TStringField;
    TblIQSysPACKSLIP_REPORT: TStringField;
    TblIQSysAP_CHECK_REPORT: TStringField;
    TblIQSysORD_ACK_REPORT: TStringField;
    TblIQSysINVOICE_REPORT: TStringField;
    TblIQSysPO_REPORT: TStringField;
    PkGLAcctTYPE: TStringField;
    QryGLAcct_BudgetGLACCT_TYPE: TStringField;
    QryGLAcct_BudgetACCOUNT: TStringField;
    QryGLAcct_BudgetDIVISION: TStringField;
    QryGLAcct_BudgetDEPARTMENT: TStringField;
    QryGLAcct_BudgetEPLANT_ID: TBCDField;
    PkGLAcctEPLANT_ID: TBCDField;
    QryGLAcct_BudgetBUD_CALC_AMOUNT: TBCDField;
    QryBudgets: TFDQuery;
    QryBudgetsDESCRIP: TStringField;
    QryBudgetsID: TBCDField;
    SrcBudgets_fy: TDataSource;
    TblBudgets_fy: TFDTable;
    TblBudgets_fyID: TBCDField;
    TblBudgets_fyGLACCT_FY_ID: TBCDField;
    TblBudgets_fyBUDGETS_ID: TBCDField;
    TblBudgets_fyYTDBUDGET: TBCDField;
    TblBudgets_fySTATUS: TStringField;
    TblBudgets_fyBUD_CALC_AMOUNT: TBCDField;
    TblBudgets_fyBudget_Name: TStringField;
    TblBudgets_fyPrevBudget: TFloatField;
    TblBudgets_fyPrevYTD: TFloatField;
    TblBudgets_fyPrevVar: TFloatField;
    QryPrevPeriodBudgetBUDGETS_ID: TBCDField;
    QryPrevPeriodBudgetBUDGETS_NAME: TStringField;
    PkForeHead: TIQWebHPick;
    PkForeHeadID: TBCDField;
    PkForeHeadNAME: TStringField;
    PkForeHeadDESCRIPTION: TStringField;
    PkForeHeadSTART_DATE: TDateTimeField;
    PkForeHeadEND_DATE: TDateTimeField;
    PkForeHeadKIND: TStringField;
    TblGLBudget: TFDQuery;
    TblGLBudgetGLACCT_FY_ID: TBCDField;
    TblGLBudgetGLYEAR_ID: TBCDField;
    TblGLBudgetGLACCT_ID: TBCDField;
    TblGLBudgetGLPERIODS_ID: TBCDField;
    TblGLBudgetBUDAMOUNT: TBCDField;
    TblGLBudgetBUDPERCENT: TBCDField;
    TblGLBudgetPERIOD: TBCDField;
    TblGLBudgetPERIOD_START_DATE: TDateTimeField;
    TblGLBudgetPERIOD_END_DATE: TDateTimeField;
    TblGLBudgetBUD_CALC_AMOUNT: TBCDField;
    TblGLBudgetBUDGETS_ID: TBCDField;
    TblGLBudgetBUDGETS_NAME: TStringField;
    TblGLBudgetBUDGETS_FY_ID: TBCDField;
    TblGLBudgetPeriodActual: TFloatField;
    TblGLBudgetPeriodVariance: TFloatField;
    TblGLBudgetGLBUDGET_ID: TBCDField;
    procedure GL_DMCreate(Sender: TObject);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure QryGLAcct_BudgetCalcFields(DataSet: TDataSet);
    procedure TblGLBudgetOldCalcFields(DataSet: TDataSet);
    procedure TblGLBudgetOldBeforeInsert(DataSet: TDataSet);
    procedure QryGLAcct_BudgetUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryGLAcct_BudgetAfterPost(DataSet: TDataSet);
    procedure QryGLAcct_BudgetAfterEdit(DataSet: TDataSet);
    procedure QryGLAcct_BudgetBeforeInsert(DataSet: TDataSet);
    procedure TblGLBudgetOldBeforeEdit(DataSet: TDataSet);
    procedure QryGLAcct_BudgetBeforeClose(DataSet: TDataSet);
    procedure TblGLBudgetOldBUDAMOUNTChange(Sender: TField);
    procedure TblGLBudgetOldBUDPERCENTChange(Sender: TField);
    procedure TblGLBudgetOldAfterPost(DataSet: TDataSet);
    procedure GL_DMDestroy(Sender: TObject);
    procedure TblIQSysBeforeOpen(DataSet: TDataSet);
    procedure QryGLAcct_BudgetBeforeOpen(DataSet: TDataSet);
    procedure PkGLAcctBeforeOpen(DataSet: TDataSet);
    procedure TblBudgets_fyAfterPost(DataSet: TDataSet);
    procedure TblBudgets_fyCalcFields(DataSet: TDataSet);
    procedure QryGLAcct_BudgetBeforeScroll(DataSet: TDataSet);
    procedure TblBudgets_fyBeforeScroll(DataSet: TDataSet);
    procedure TblGLBudgetAfterPost(DataSet: TDataSet);
    procedure TblGLBudgetBeforeEdit(DataSet: TDataSet);
    procedure TblGLBudgetBeforeInsert(DataSet: TDataSet);
    procedure TblGLBudgetCalcFields(DataSet: TDataSet);
    procedure TblGLBudgetBUDAMOUNTChange(Sender: TField);
    procedure TblGLBudgetBUDPERCENTChange(Sender: TField);
    procedure TblBudgets_fyAfterScroll(DataSet: TDataSet);
    procedure TblGLBudgetAfterDelete(DataSet: TDataSet);
    procedure TblGLBudgetUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
  private
    { Private declarations }
    LastAcctType:string;
    AcctTypeForInsert:string;
    FDoNotUpdatePercent:boolean;
    procedure CheckBudgetAmountExists;
    procedure CheckBudgetPeriodsExist( ForceCheck: Boolean = FALSE );
    procedure UpdateTblGLBudget;
    procedure InsertTblGLBudget;
    procedure DeleteTblGLBudget;

  public
    { Public declarations }
    BudgetAccountsList:TList;
    FDonotAllowToScroll:boolean;
    procedure SetEnableApplyRevert;
    procedure GetTotalPeriods( var TotalAmount, TotalPercent : Real );
    procedure CheckAdjustLastPeriod;
    procedure RecalculatePeriods;

    function LocateInBudgetAccountsList( AGLACCT_ID : Real ):Integer;
    function RegisterInBudgetAccountsList( AGLACCT_ID : Real ):Integer;
    procedure EmptyBudgetAccountsList;
    function Check_All_BudgetAccounts:Boolean;
    function CheckBudgetAccount( AGLACCT_ID:Real ):Boolean;
    procedure SplitBetweenPeriods( AValue: Real );
  end;

var
  Budg_DM: TBudg_DM;

implementation

{$R *.DFM}

uses
  gl_rscstr,
  { TODO -oathite -cWebConvert : Depends on GLBudget
  GLBudget, }
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;

{ TModifiedBudget }
constructor TModifiedBudget.Create( AGLACCT_ID : Real );
begin
  GLACCT_ID := AGLACCT_ID;
end;

{ TGL_DM }
procedure TBudg_DM.GL_DMCreate(Sender: TObject);
begin
  QryGLAcct_Budget.Close; {make sure it's closed}
  BudgetAccountsList:= TList.Create;
  IQSetTablesActiveEx(True, Self, gl_rscstr.cTXT0000008 {'Accessing Budgets.  Please wait.'} );
end;

procedure TBudg_DM.TblIQSysBeforeOpen(DataSet: TDataSet);
var
  SaveActive:Boolean;
begin
  with QryGLAcct_Budget do
  try
    SaveActive:= Active;
    Close;
    QryGLAcct_BudgetACCOUNT.Size   := iMax(1, Trunc(SelectValueAsFloat('select Length(account) from v_glacct where rownum < 2'   )));
    QryGLAcct_BudgetDIVISION.Size  := iMax(1, Trunc(SelectValueAsFloat('select Length(division) from v_glacct where rownum < 2'  )));
    QryGLAcct_BudgetDEPARTMENT.Size:= iMax(1, Trunc(SelectValueAsFloat('select Length(department) from v_glacct where rownum < 2')));
  finally
    Active:= SaveActive;
  end;
end;

procedure TBudg_DM.GL_DMDestroy(Sender: TObject);
begin
  EmptyBudgetAccountsList;
  BudgetAccountsList.Free;
end;

procedure TBudg_DM.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TBudg_DM.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet );
end;

procedure TBudg_DM.QryGLAcct_BudgetCalcFields(DataSet: TDataSet);
begin
  QryGLAcct_BudgetPrevYTD.asFloat   := SelectValueAsFloat( IQFormat( 'select prev_ytd_balance from v_glacct_prev_ytd where glyear_id = %f and glacct_id = %f',
                                               [ QryGLAcct_BudgetGLYEAR_ID.asFloat, QryGLAcct_BudgetGLACCT_ID.asFloat ]));

  QryGLAcct_BudgetPrevBudget.asFloat:= SelectValueAsFloat( IQFormat( 'select prev_ytdbudget from v_glacct_prev_budget where glyear_id = %f and glacct_id = %f',
                                               [ QryGLAcct_BudgetGLYEAR_ID.asFloat, QryGLAcct_BudgetGLACCT_ID.asFloat ]));

  QryGLAcct_BudgetPrevVar.AsFloat   := QryGLAcct_BudgetPrevBudget.asFloat - QryGLAcct_BudgetPrevYTD.asFloat;

  { TODO -oathite -cWebConvert : Depends on GLBudget
  QryGLAcct_BudgetPrevGLAcct_FY_ID.asFloat:= SelectValueAsFloat( IQFormat( 'select id from glacct_fy where glyear_id = %f and glacct_id = %f',
                                               [ TFrmGLBudget(Owner).PrevFiscalYearID, QryGLAcct_BudgetGLACCT_ID.asFloat ]));  }
end;

procedure TBudg_DM.TblGLBudgetOldCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('PeriodActual').asFloat:= SelectValueAsFloat( IQFormat( 'select period_balance from v_glacct_period_summary where glperiods_id = %f and glacct_id = %f',
                                                 [ FieldByName('GLPERIODS_ID').asFloat, FieldByName('GLACCT_ID').asFloat ]));

    FieldByName('PeriodVariance').asFloat:= FieldByName('BUDAMOUNT').asFloat - FieldByName('PeriodActual').asFloat;
  end;
end;

procedure TBudg_DM.QryGLAcct_BudgetAfterEdit(DataSet: TDataSet);
begin
  IQAssignNewID( QryGLAcct_BudgetGLACCT_FY_ID, 'glacct_fy' );
end;

procedure TBudg_DM.CheckBudgetAmountExists;
begin
  { TODO -oathite -cWebConvert : Depends on GLBudget }
  (*
  if (QryGLAcct_BudgetGLACCT_FY_ID.AsFloat = 0) then
     raise Exception.CreateFmt(gl_rscstr.cTXT0000009 {'Please enter %s budget total amount'},
      [ TFrmGLBudget(Owner).FiscalYearDesc ]);     *)
end;

procedure TBudg_DM.QryGLAcct_BudgetBeforeInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TBudg_DM.QryGLAcct_BudgetAfterPost(DataSet: TDataSet);
begin
//  SetEnableApplyRevert;
//  CheckBudgetPeriodsExist;
//  RecalculatePeriods;  {force last one to accept all the diff in totals}
//  RegisterInBudgetAccountsList( QryGLAcct_BudgetGLACCT_ID.asFloat );
end;

procedure TBudg_DM.TblGLBudgetOldAfterPost(DataSet: TDataSet);
begin
  SetEnableApplyRevert;
  RegisterInBudgetAccountsList( TblGLBudgetGLACCT_ID.asFloat );
end;

procedure TBudg_DM.TblGLBudgetOldBeforeInsert(DataSet: TDataSet);
begin
  TblGLBudgetBeforeEdit(DataSet);
  ABORT;                 {but still ... we don't allow append periods via V_GLBUDGET view}
end;

procedure TBudg_DM.TblGLBudgetOldBeforeEdit(DataSet: TDataSet);
begin
  CheckBudgetAmountExists;
  if QryGLAcct_Budget.State = dsEdit then
     QryGLAcct_Budget.Post;
end;

procedure TBudg_DM.CheckBudgetPeriodsExist( ForceCheck: Boolean = FALSE );
var
  AList: TStringList;
  AId:Real;
  hMsg: TPanelMesg;
  ACount:Integer;
  AAmount:Real;
  ARunningTotal:Real;
  ARunningCount:Integer;
  ARunningPercentage:Real;

  procedure LoadExistingPeriodsInList( var AList: TStringList );
  begin
    AList.Clear;
    with TblGLBudget do
    begin
      First;
      while not Eof do
        begin
          AList.Add( TblGLBudgetGLPERIODS_ID.asString );
          Next;
        end;
    end;
  end;

begin
  {Quick Check}
  if not ForceCheck then
    {if we have something in glbudget - exit}
    if not (TblGLBudget.Bof and TblGLBudget.Eof) then
    begin
      { TODO -oathite -cWebConvert : Depends on GLBudget }
      (*
      if TFrmGLBudget(self.Owner).SplitTotalEvenlyAcrossPeriods1.Checked then
      begin
        ACount:= 0;
        TblGLBudget.First;
        while not TblGLBudget.Eof do
        begin
          ACount:= ACount + 1;
          TblGLBudget.Next;
        end;
        AAmount := TblBudgets_fyYTDBUDGET.asFloat / ACount;
        ARunningCount := 0;
        ARunningTotal := 0;
        ARunningPercentage := 0;
        TblGLBudget.First;
        while not TblGLBudget.Eof do
        begin
          ARunningCount := ARunningCount + 1;
          TblGLBudget.Edit;
          if ARunningCount = ACount then
          begin
            AAmount := TblBudgets_fyYTDBUDGET.asFloat - ARunningTotal;
            TblGLBudgetBUDAMOUNT.asFloat   := AAmount;
            TblGLBudgetBUDPERCENT.asFloat  := 100 - ARunningPercentage;

          end
          else
          begin
            TblGLBudgetBUDAMOUNT.asFloat   := AAmount;
            ARunningTotal := ARunningTotal + TblGLBudgetBUDAMOUNT.asFloat;

            TblGLBudgetBUDPERCENT.asFloat  := 100/ACount;
            ARunningPercentage := ARunningPercentage + TblGLBudgetBUDPERCENT.asFloat;
          end;
          TblGLBudget.Next;
        end;
      end;
      *)
      EXIT;
    end;

  {Forced Check}
  AList:= TStringList.Create;
  hMsg := NIL;
  try
    FDoNotUpdatePercent := false;

    { TODO -oathite -cWebConvert : Depends on GLBudget
    if TFrmGLBudget(self.Owner).SplitTotalEvenlyAcrossPeriods1.Checked then
      FDoNotUpdatePercent:= true; }

    LoadExistingPeriodsInList( AList );
    try
      hMsg := hPleaseWait(gl_rscstr.cTXT0000004 {'Creating Budget Periods.  Please wait.'});
      TblGLBudget.DisableControls;
      TblGLBudget.BeforeInsert:= NIL;
      TblGLBudget.OnCalcFields:= NIL;
      CheckBudgetAmountExists;

      ACount  := Trunc(SelectValueFmtAsFloat('select count(id) from glperiods where glyear_id = %f ', [QryGLAcct_BudgetGLYEAR_ID.AsFloat]));
      AAmount := TblBudgets_fyYTDBUDGET.asFloat / ACount;

      {Manually add all the periods}
      with TFDQuery.Create(self) do
      try
        Connection := UniMainModule.FDConnection1;

//        DataBaseName:= 'IQ';
        SQL.Add( IQFormat('select id, period from glperiods where glyear_id = %f order by period', [ QryGLAcct_BudgetGLYEAR_ID.AsFloat ]));
        Open;
        ARunningCount := 0;
        ARunningTotal := 0;
        ARunningPercentage := 0;

        while not Eof do
        begin
          ARunningCount := ARunningCount + 1;
          {If this period already exists in GLBudget - skip it}
          if Alist.IndexOf( Fields[ 0 ].asString ) > -1 then
          begin
            Next;
            Continue;
          end;

          {Append this period to GLBudget}
          hMsg.Mesg := Format(gl_rscstr.cTXT0000005 {'Creating Budget Period %d ...'},[ Fields[ 1 ].asInteger ]);
          TblGLBudget.Append;
          AId := GetNextID('GLBUDGET');
          TblGLBudgetGLBUDGET_ID.asFloat:= AId;
          TblGLBudgetBUDGETS_FY_ID.asFloat:= TblBudgets_fyID.AsFloat;
//          TblGLBudgetGLACCT_FY_ID.asFloat:= QryGLAcct_BudgetGLACCT_FY_ID.AsFloat;
          TblGLBudgetGLPERIODS_ID.asFloat:= Fields[ 0 ].asFloat;
          { TODO -oathite -cWebConvert : Depends on GLBudget
          if TFrmGLBudget(self.Owner).SplitTotalEvenlyAcrossPeriods1.Checked then
          begin
            if ARunningCount = ACount then
            begin
              AAmount := TblBudgets_fyYTDBUDGET.asFloat - ARunningTotal;
              TblGLBudgetBUDAMOUNT.asFloat   := AAmount;
              TblGLBudgetBUDPERCENT.asFloat  := 100 - ARunningPercentage;

            end
            else
            begin
              TblGLBudgetBUDAMOUNT.asFloat   := AAmount;
              ARunningTotal := ARunningTotal + TblGLBudgetBUDAMOUNT.asFloat;

              TblGLBudgetBUDPERCENT.asFloat  := 100/ACount;
              ARunningPercentage := ARunningPercentage + TblGLBudgetBUDPERCENT.asFloat;
            end;
          end
          else
          begin
            TblGLBudgetBUDAMOUNT.asFloat   := 0;
            TblGLBudgetBUDPERCENT.asFloat  := 0;
          end;  }
          TblGLBudgetGLYEAR_ID.asFloat   := QryGLAcct_BudgetGLYEAR_ID.AsFloat;
          TblGLBudgetGLACCT_ID.asFloat   := QryGLAcct_BudgetGLACCT_ID.AsFloat;
          TblGLBudgetPERIOD.asFloat      := Fields[ 1 ].asFloat;
          TblGLBudget.Post;
          InsertTblGLBudget;
          Next;
        end;
        TblGLBudget.First;
      finally
        Free;
      end;
    finally
      if Assigned(hMsg) then FreeAndNil(hMsg);
      TblGLBudget.EnableControls;
      TblGLBudget.BeforeInsert   := TblGLBudgetBeforeInsert;
      TblGLBudget.OnCalcFields   := TblGLBudgetCalcFields;
      TblGLBudget.Close;
      TblGLBudget.Open;
    end;
  finally
    AList.Free;
    FDoNotUpdatePercent:= false;
  end;
end;

procedure TBudg_DM.QryGLAcct_BudgetUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
//  with updSQLAcctBudget do
//  begin
//    SetParams( arUpdate );        {get GLAcct_FY_ID for current rec}
//    if IsFound( IQFormat( 'select 1 from glacct_fy where id = %f', [ Query[arUpdate].ParamByName('GLACCT_FY_ID').asFloat ])) then
//       ExecSQL( arUpdate )        {if found - update ytdbudget}
//    else
//       Apply( arInsert );         {else - insert a new rec into glacct_fy}
//    AUpdateAction:= eaApplied;
//  end;
end;



procedure TBudg_DM.SetEnableApplyRevert;
begin
  { TODO -oathite -cWebConvert : Depends on GLBudget
  with TFrmGLBudget(Owner) do
  begin
    btnApply.Enabled := (QryGLAcct_Budget.UpdatesPending or TblGLBudget.UpdatesPending) and SR.Enabled['btnApply'];
    btnRevert.Enabled:= btnApply.Enabled and SR.Enabled['btnRevert'];
  end; }
end;

procedure TBudg_DM.QryGLAcct_BudgetBeforeClose(DataSet: TDataSet);
begin
  { TODO -oathite -cWebConvert : Depends on GLBudget
  with TFrmGLBudget(Owner) do
    if btnApply <> nil then
      while btnApply.Enabled do
        // 'There are pending transactions that should be applied or cancelled. '+#13+#13+'Apply now?'
        if IQWarningYN(gl_rscstr.cTXT0000010) then
           btnApplyClick(self)
        else
           btnRevertClick(self) }
end;

{convert $ to % and backwards}
procedure TBudg_DM.TblGLBudgetOldBUDAMOUNTChange(Sender: TField);
begin
  { TODO -oathite -cWebConvert : Depends on GLBudget }
  (*
  if TFrmGLBudget(Owner).cboxAdjust.ItemIndex = 0 then {adjust % to $}
  try
     if not FDoNotUpdatePercent then
//     if not TFrmGLBudget(self.Owner).SplitTotalEvenlyAcrossPeriods1.Checked then
       TblGLBudgetBUDPERCENT.asFloat:= (TblGLBudgetBUDAMOUNT.asFloat / TblBudgets_fyYTDBUDGET.asFloat) * 100
//     TblGLBudgetBUDPERCENT.asFloat:= (TblGLBudgetBUDAMOUNT.asFloat / QryGLAcct_BudgetYTDBUDGET.asFloat) * 100
  except
     TblGLBudgetBUDPERCENT.asFloat:= 0;
  end; *)
end;

procedure TBudg_DM.TblGLBudgetOldBUDPERCENTChange(Sender: TField);
begin
  { TODO -oathite -cWebConvert : Depends on GLBudget }
  (*
  if TFrmGLBudget(Owner).cboxAdjust.ItemIndex = 1 then {adjust $ to % }
  try
     TblGLBudgetBUDAMOUNT.asFloat:=  ( TblGLBudgetBUDPERCENT.asFloat / 100 ) * TblBudgets_fyYTDBUDGET.asFloat;
//     TblGLBudgetBUDAMOUNT.asFloat:=  ( TblGLBudgetBUDPERCENT.asFloat / 100 ) * QryGLAcct_BudgetYTDBUDGET.asFloat;
  except
     TblGLBudgetBUDAMOUNT.asFloat:= 0;
  end;   *)
end;

procedure TBudg_DM.GetTotalPeriods( var TotalAmount, TotalPercent : Real );
var
  Bk: TBookMark;
begin
  if Assigned(TblGLBudget) and (TblGLBudget.State in [dsBrowse, dsEdit]) then with TblGLBudget do
  try
    CheckBrowseMode;
    //OnCalcFields:= NIL;
    TotalAmount := 0;
    TotalPercent:= 0;
    Bk:= GetBookMark;
    DisableControls;
    First;
    while not Eof do
    begin
      TotalAmount := TotalAmount  + TblGLBudgetBUDAMOUNT.AsFloat ;
      TotalPercent:= TotalPercent + TblGLBudgetBUDPERCENT.AsFloat;
      Next;
    end;
    TotalAmount := StrToFloat( FloatToStrF( TotalAmount , ffFixed, 12, 2 ));
    TotalPercent:= StrToFloat( FloatToStrF( TotalPercent, ffFixed,  7, 2 ));
  finally
    GotoBookMark(Bk);
    FreeBookMark(Bk);
    EnableControls;
    //OnCalcFields:= TblGLBudgetCalcFields;
    //Refresh;
  end;
end;

procedure TBudg_DM.CheckAdjustLastPeriod;
var
   TotalAmount, TotalPercent: Real;
begin
  with TblGLBudget do if not (Eof and Bof) then
  try
    CheckBrowseMode;
    TblGLBudgetBUDAMOUNT.OnChange := NIL;
    TblGLBudgetBUDPERCENT.OnChange:= NIL;

    GetTotalPeriods( TotalAmount, TotalPercent );

    Edit;
    TblGLBudgetBUDPERCENT.asFloat:= StrToFloat( FloatToStrF( 100 - (TotalPercent - TblGLBudgetBUDPERCENT.asFloat ), ffFixed, 12, 2 ));
    TblGLBudgetBUDAMOUNT.asFloat := StrToFloat( FloatToStrF( TblBudgets_fyYTDBUDGET.asFloat - (TotalAmount - TblGLBudgetBUDAMOUNT.asFloat), ffFixed, 12, 2 ));
//    ExecuteCommandFmt('update glbudget set BUDAMOUNT = %f, BUDPERCENT = %f  where id = %f',
//    [TblGLBudgetBUDAMOUNT.asFloat, TblGLBudgetBUDPERCENT.asFloat, TblGLBudgetGLBUDGET_ID.asFloat]);
//    TblGLBudgetBUDAMOUNT.asFloat := StrToFloat( FloatToStrF( QryGLAcct_BudgetYTDBUDGET.asFloat - (TotalAmount - TblGLBudgetBUDAMOUNT.asFloat), ffFixed, 12, 2 ));
    Post;

  finally
     TblGLBudgetBUDAMOUNT.OnChange := TblGLBudgetBUDAMOUNTChange;
     TblGLBudgetBUDPERCENT.OnChange:= TblGLBudgetBUDPERCENTChange;
  end;
end;

procedure TBudg_DM.RecalculatePeriods;
var
  AId:Real;
  KeyGLACCT_FY_ID:Real;
  KeyPERIOD      :Real;
begin
  QryGLAcct_Budget.CheckBrowseMode;
  with TblGLBudget do if not (Eof and Bof) then
  try
    CheckBrowseMode;
    DisableControls;
    AID:= TblGLBudgetGLBUDGET_ID.AsFloat;
//    KeyGLACCT_FY_ID:= TblGLBudgetGLACCT_FY_ID.AsFloat;  {BookMark didn't work with Edit/Post - the Display and Internal buffer got out of sync. }
//    KeyPERIOD      := TblGLBudgetPERIOD.asFloat;        {Probably because if Cached Updates}
    OnCalcFields:= NIL;
    First;
    while not Eof do
    begin
      Edit;
      { TODO -oathite -cWebConvert : Depends on GLBudget }
      (*
      if TFrmGLBudget(self.Owner).cboxAdjust.ItemIndex = 0 then
        if not TFrmGLBudget(self.Owner).SplitTotalEvenlyAcrossPeriods1.Checked then
           TblGLBudgetBUDAMOUNT.asFloat := TblGLBudgetBUDAMOUNT.asFloat {see onchange of this field}
      else
         TblGLBudgetBUDPERCENT.asFloat:= TblGLBudgetBUDPERCENT.asFloat;  *)
      Post;
      Next;
    end;
  finally
    Locate('GLBUDGET_ID', AId, []);
//    FindKey( [ KeyGLACCT_FY_ID, KeyPERIOD ]);
    EnableControls;
    OnCalcFields:= TblGLBudgetCalcFields;
    Close;
    Open;
  end;
end;

procedure TBudg_DM.EmptyBudgetAccountsList;
var
  I:Integer;
begin
  for i:= BudgetAccountsList.Count - 1 downto 0 do
  begin
    TModifiedBudget(BudgetAccountsList[ I ]).Free;
    BudgetAccountsList.Delete( I );
  end;
  //BudgetAccountsList.Pack;
end;

function TBudg_DM.RegisterInBudgetAccountsList( AGLACCT_ID : Real ):Integer;
var
  I : Integer;
begin
  I:= LocateInBudgetAccountsList( AGLACCT_ID );
  if I > - 1 then
     Result:= I
  else
     I:= BudgetAccountsList.Add( TModifiedBudget.Create( AGLACCT_ID ));
end;

function TBudg_DM.LocateInBudgetAccountsList( AGLACCT_ID:Real ):Integer;
var
  I:Integer;
begin
  for i:= 0 to BudgetAccountsList.Count - 1 do with TModifiedBudget(BudgetAccountsList[ I ]) do
    if GLACCT_ID = AGLACCT_ID then
    begin
       Result:= I;
       EXIT;
    end;
  Result:= -1;
end;

function TBudg_DM.Check_All_BudgetAccounts:Boolean;
var
  I : Integer;
begin
  Result:= TRUE;
  for I:= 0 to BudgetAccountsList.Count - 1 do with TModifiedBudget(BudgetAccountsList[ I ]) do
  begin
    Result:= CheckBudgetAccount( GLACCT_ID );
    if not Result then
       EXIT;
  end;
end;

function TBudg_DM.CheckBudgetAccount( AGLACCT_ID:Real ):Boolean;
var
  TotalAmount, TotalPercent: Real;
  S : string;
  I : Integer;
  hMsg: TPanelMesg;
begin
  with QryGLAcct_Budget do
  try
    hMsg := hPleaseWait(Format(gl_rscstr.cTXT0000006 {'Checking Account# %s Budget ...'},
     [ QryGLAcct_BudgetGLACCT.asString ]));

    Locate( 'GLACCT_ID', AGLACCT_ID, [] );
    GetTotalPeriods( TotalAmount, TotalPercent );
    Result:= (MoneyToStr(TblBudgets_fyYTDBUDGET.asFloat) = MoneyToStr( TotalAmount )) and
             (( StrTran(FloatToStr2(TotalPercent), ',', '.') = '100.00' ) or ( TblBudgets_fyYTDBUDGET.asFloat = 0 ));
  finally
    if Assigned(hMsg) then FreeAndNil(hMsg);
  end;
end;

procedure TBudg_DM.SplitBetweenPeriods( AValue: Real );
var
  AValueEach, APercent: Real;
begin
  QryGLAcct_Budget.CheckBrowseMode;
  TblGLBudget.CheckBrowseMode;
  CheckBudgetPeriodsExist( TRUE );

  with QryGLAcct_Budget do
    AValueEach:= AValue / SelectValueFmtAsFloat('select count(*) from glperiods where glyear_id = %f', [ QryGLAcct_BudgetGLYEAR_ID.AsFloat ]);
    APercent := 100 * SelectValueFmtAsFloat('select count(*) from glperiods where glyear_id = %f', [ QryGLAcct_BudgetGLYEAR_ID.AsFloat ])/AValueEach;
  { TODO -oathite -cWebConvert : Depends on GLBudget
  TFrmGLBudget(self.Owner).cboxAdjust.ItemIndex:=0;  }

  with TblGLBudget do if not( Eof and Bof ) then
  try
    DisableControls;
    OnCalcFields:= NIL;
    First;
    while not Eof do
    begin
//      ExecuteCommandFmt('update glbudget set BUDAMOUNT = %f, BUDPERCENT = %f where id = %f',[AValueEach, APercent, TblGLBudgetGLBUDGET_ID.asFloat]);
      Edit;
      TblGLBudgetBUDAMOUNT.asFloat:= AValueEach;
      Post;
      Next;
    end;
//    Close;
//    Open;
    Last;
    CheckAdjustLastPeriod;
  finally
    EnableControls;
    OnCalcFields:= TblGLBudgetCalcFields;
//    Close;
//    Open;
  end;
end;

procedure TBudg_DM.QryGLAcct_BudgetBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TBudg_DM.PkGLAcctBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TBudg_DM.TblBudgets_fyAfterPost(DataSet: TDataSet);
var
  AId1, AId2:Real;
begin
  AId1 := QryGLAcct_Budget.FieldByName('GLACCT_ID').asFloat;
  { TODO -oathite -cWebConvert : Depends on GLBudget }
  (*AId2 := TFrmGLBudget(Owner).FId;*)
  TblBudgets_fy.Refresh;
//  AId2 := TblBudgets_fyID.asFloat;
  QryGLAcct_Budget.Close;
  QryGLAcct_Budget.Open;
  QryGLAcct_Budget.Locate( 'GLACCT_ID', AID1, [] );
  TblBudgets_fy.Locate( 'ID', AID2, [] );

  SetEnableApplyRevert;
  CheckBudgetPeriodsExist;
  RecalculatePeriods;  {force last one to accept all the diff in totals}
  RegisterInBudgetAccountsList( QryGLAcct_BudgetGLACCT_ID.asFloat );
  FDonotAllowToScroll := true;
end;

procedure TBudg_DM.TblBudgets_fyCalcFields(DataSet: TDataSet);
begin
  TblBudgets_fyPrevBudget.asFloat:= SelectValueFmtAsFloat( 'select prev_ytdbudget from v_glacct_prev_budget ' +
                                               'where glyear_id = %f and glacct_id = %f and budgets_id = %f',
                                               [ QryGLAcct_BudgetGLYEAR_ID.asFloat,
                                                 QryGLAcct_BudgetGLACCT_ID.asFloat,
                                                 TblBudgets_fyBUDGETS_ID.asFloat ]);

  TblBudgets_fyPrevYTD.asFloat   := SelectValueAsFloat( IQFormat( 'select prev_ytd_balance from v_glacct_prev_ytd where glyear_id = %f and glacct_id = %f',
                                               [ QryGLAcct_BudgetGLYEAR_ID.asFloat, QryGLAcct_BudgetGLACCT_ID.asFloat ]));

  TblBudgets_fyPrevVar.AsFloat   := TblBudgets_fyPrevBudget.asFloat - TblBudgets_fyPrevYTD.asFloat;


end;

procedure TBudg_DM.QryGLAcct_BudgetBeforeScroll(DataSet: TDataSet);
begin
  if FDonotAllowToScroll and not (TblGLBudget.eof and TblGLBudget.bof) then
    raise exception.Create(gl_rscstr.cTXT0000096);
end;

procedure TBudg_DM.TblBudgets_fyBeforeScroll(DataSet: TDataSet);
begin
  if FDonotAllowToScroll and not (TblGLBudget.eof and TblGLBudget.bof) then
    raise exception.Create(gl_rscstr.cTXT0000096);
end;

procedure TBudg_DM.TblGLBudgetAfterDelete(DataSet: TDataSet);
begin
  SetEnableApplyRevert;
//  try
//    TblGLBudget.DataBase.ApplyUpdates( [ TblGLBudget ]);
//  except on E:Exception do
//    begin
//      Application.ShowException(E);
//      TblGLBudget.Close;
//      TblGLBudget.Open;
//      System.SysUtils.ABORT;
//    end;
//  end;
end;

procedure TBudg_DM.TblGLBudgetAfterPost(DataSet: TDataSet);
begin
//    try
//      TblGLBudget.DataBase.ApplyUpdates( [ TblGLBudget ]);
//    except on E:Exception do
//      begin
//        Application.ShowException(E);
//        TblGLBudget.Close;
//        TblGLBudget.Open;
//        System.SysUtils.ABORT;
//      end;
//    end;
    SetEnableApplyRevert;
    RegisterInBudgetAccountsList( TblGLBudgetGLACCT_ID.asFloat );
end;


procedure TBudg_DM.TblGLBudgetBeforeEdit(DataSet: TDataSet);
begin
  CheckBudgetAmountExists;
  if QryGLAcct_Budget.State = dsEdit then
     QryGLAcct_Budget.Post;
end;

procedure TBudg_DM.TblGLBudgetBeforeInsert(DataSet: TDataSet);
begin
  TblGLBudgetBeforeEdit(DataSet);
  ABORT;                 {but still ... we don't allow append periods via V_GLBUDGET view}
end;

procedure TBudg_DM.TblGLBudgetBUDAMOUNTChange(Sender: TField);
begin
  { TODO -oathite -cWebConvert : Depends on GLBudget }
  (*
  if TFrmGLBudget(Owner).cboxAdjust.ItemIndex = 0 then {adjust % to $}
  try
     if not FDoNotUpdatePercent then
//     if not TFrmGLBudget(self.Owner).SplitTotalEvenlyAcrossPeriods1.Checked then
       TblGLBudgetBUDPERCENT.asFloat:= (TblGLBudgetBUDAMOUNT.asFloat / TblBudgets_fyYTDBUDGET.asFloat) * 100
//     TblGLBudgetBUDPERCENT.asFloat:= (TblGLBudgetBUDAMOUNT.asFloat / QryGLAcct_BudgetYTDBUDGET.asFloat) * 100
  except
     TblGLBudgetBUDPERCENT.asFloat:= 0;
  end;    *)
end;

procedure TBudg_DM.TblGLBudgetBUDPERCENTChange(Sender: TField);
begin
  { TODO -oathite -cWebConvert : Depends on GLBudget }
  (*
  if TFrmGLBudget(Owner).cboxAdjust.ItemIndex = 1 then {adjust $ to % }
  try
     TblGLBudgetBUDAMOUNT.asFloat:=  ( TblGLBudgetBUDPERCENT.asFloat / 100 ) * TblBudgets_fyYTDBUDGET.asFloat;
//     TblGLBudgetBUDAMOUNT.asFloat:=  ( TblGLBudgetBUDPERCENT.asFloat / 100 ) * QryGLAcct_BudgetYTDBUDGET.asFloat;
  except
     TblGLBudgetBUDAMOUNT.asFloat:= 0;
  end;
  *)
end;

procedure TBudg_DM.TblGLBudgetCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('PeriodActual').asFloat:= SelectValueAsFloat( IQFormat( 'select period_balance from v_glacct_period_summary where glperiods_id = %f and glacct_id = %f',
                                                 [ FieldByName('GLPERIODS_ID').asFloat, FieldByName('GLACCT_ID').asFloat ]));

    FieldByName('PeriodVariance').asFloat:= FieldByName('BUDAMOUNT').asFloat - FieldByName('PeriodActual').asFloat;
  end;
end;

procedure TBudg_DM.TblBudgets_fyAfterScroll(DataSet: TDataSet);
begin
  TblGLBudget.Close;
  TblGLBudget.ParamByName('aid').Value := TblBudgets_fyID.asFloat;

  TblGLBudget.Open;
end;

procedure TBudg_DM.TblGLBudgetUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  with ASender do
    case ARequest of
      arUpdate: UpdateTblGLBudget;
      arInsert: InsertTblGLBudget;
      arDelete: DeleteTblGLBudget;
    end;
  AAction := eaApplied;
end;

procedure TBudg_DM.UpdateTblGLBudget;
var
  i:integer;
begin
  TblGLBudget.First;
  while not TblGLBudget.Eof do begin
    ExecuteCommandFmt('update GLBUDGET                ' +
              '    set                        ' +
              '      BUDAMOUNT = %f,          ' +
              '      BUDPERCENT = %f,         ' +
              '      glacct_fy_id = decode(%f, 0, null, %f),       ' +
              '      glperiods_id = decode(%f, 0, null, %f),       ' +
              '      bud_calc_amount = %f,    ' +
              '      budgets_fy_id = decode(%f, 0, null, %f)       ' +
              '    where ID = %f ',
              [TblGLBudgetBUDAMOUNT.asFloat,
               TblGLBudgetBUDPERCENT.asFloat,
               TblGLBudgetGLACCT_FY_ID.asFloat,
               TblGLBudgetGLACCT_FY_ID.asFloat,
               TblGLBudgetGLPERIODS_ID.asFloat,
               TblGLBudgetGLPERIODS_ID.asFloat,
               TblGLBudgetBUD_CALC_AMOUNT.asFloat,
               TblGLBudgetBUDGETS_FY_ID.asFloat,
               TblGLBudgetBUDGETS_FY_ID.asFloat,
               TblGLBudgetGLBUDGET_ID.asFloat]);
    TblGLBudget.Next;
  end;
end;

procedure TBudg_DM.InsertTblGLBudget;
begin
  ExecuteCommandFmt('insert into GLBUDGET                ' +
            '    ( id,                       ' +
            '      BUDAMOUNT,          ' +
            '      BUDPERCENT,         ' +
            '      glacct_fy_id,       ' +
            '      glperiods_id,       ' +
            '      bud_calc_amount,    ' +
            '      budgets_fy_id)       ' +
            '    values( %f, %f, %f, decode(%f, 0, null, %f), decode(%f, 0, null, %f), %f, decode(%f, 0, null, %f))',
            [TblGLBudgetGLBUDGET_ID.asFloat,
             TblGLBudgetBUDAMOUNT.asFloat,
             TblGLBudgetBUDPERCENT.asFloat,
             TblGLBudgetGLACCT_FY_ID.asFloat,
             TblGLBudgetGLACCT_FY_ID.asFloat,
             TblGLBudgetGLPERIODS_ID.asFloat,
             TblGLBudgetGLPERIODS_ID.asFloat,
             TblGLBudgetBUD_CALC_AMOUNT.asFloat,
             TblGLBudgetBUDGETS_FY_ID.asFloat,
             TblGLBudgetBUDGETS_FY_ID.asFloat]);

end;

procedure TBudg_DM.DeleteTblGLBudget;
begin
  ExecuteCommandFmt('delete from glbudget where id = %f', [TblGLBudgetGLBUDGET_ID.asFloat]);
end;


end.
