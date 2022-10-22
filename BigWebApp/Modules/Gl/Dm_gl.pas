unit DM_GL;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  FireDAC.Comp.DataSet,
  DBCtrls;

type
  TGL_DM = class(TDataModule)
    SrcGLAcct: TDataSource;
    TblGLAcct: TFDTable;
    SrcGLPeriods: TDataSource;
    SrcGlYear: TDataSource;
    TblGlYear: TFDTable;
    TblGlYearID: TBCDField;
    TblGlYearDESCRIP: TStringField;
    TblGlYearSTART_DATE: TDateTimeField;
    TblGlYearEND_DATE: TDateTimeField;
    TblGlPeriods: TFDTable;
    TblGlPeriodsID: TBCDField;
    TblGlPeriodsGLYEAR_ID: TBCDField;
    TblGlPeriodsSTART_DATE: TDateTimeField;
    TblGlPeriodsEND_DATE: TDateTimeField;
    TblGlPeriodsSTATUS: TStringField;
    TblGLAcctID: TBCDField;
    TblGLAcctACCT: TStringField;
    TblGLAcctDESCRIP: TStringField;
    TblGLAcctGL_SUBACCT_TYPE_ID: TBCDField;
    TblGlPeriodsPERIOD: TBCDField;
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
    QryGLSubAcct: TFDQuery;
    QryGLSubAcctID: TBCDField;
    QryGLSubAcctDESCRIP: TStringField;
    TblGLAcctSubAcctType: TStringField;
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
    TblIQSysGLYEAR_ID: TBCDField;
    TblIQSysGLPERIOD_ID: TBCDField;
    SrcQryGlSubAcctType: TDataSource;
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
    TblIQSysCLOSEORDERWITHIN: TBCDField;
    PkGLAcctTYPE: TStringField;
    TblIQSysCOMPANY_ID: TBCDField;
    TblIQSysORD_REPORT: TStringField;
    TblIQSysORD_STAT_REPORT: TStringField;
    TblIQSysQLETTER_REPORT: TStringField;
    TblIQSysRE_BY_DIVISION: TStringField;
    TblGlPeriodsAP_STATUS: TStringField;
    TblGlPeriodsAR_STATUS: TStringField;
    TblGlPeriodsGL_STATUS: TStringField;
    TblGLAcctEEXCLUDE: TStringField;
    TblGLAcctEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    TblGLAcctEPlant_Name: TStringField;
    PkGLAcctEPLANT_ID: TBCDField;
    TblGLAcctPK_HIDE: TStringField;
    TblGlYearFRL_FISCAL_YEAR: TBCDField;
    TblGLAcctGL_HIDE: TStringField;
    TblGLAcctAP_HIDE: TStringField;
    TblGLAcctAR_HIDE: TStringField;
    TblGLAcctCORVU_ACCT_TYPE: TStringField;
    TblGlYearEPLANT_ID: TBCDField;
    PKGLYear: TIQWebHPick;
    PKGLYearID: TBCDField;
    PKGLYearDESCRIP: TStringField;
    PKGLYearSTART_DATE: TDateTimeField;
    PKGLYearEND_DATE: TDateTimeField;
    PKGLYearFRL_FISCAL_YEAR: TBCDField;
    PKGLYearEPLANT_ID: TBCDField;
    TblGlPeriodsINV_STATUS: TStringField;
    TblGLAcctCOST_SOURCE_RQD: TStringField;
    PkSubAcctType: TIQWebHPick;
    PkSubAcctTypeID: TBCDField;
    PkSubAcctTypeDESCRIP: TStringField;
    TblGLAcctSubAcctType1: TStringField;
    procedure TblGLAcctNewRecord(DataSet: TDataSet);
    procedure SrcGLAcctDataChange(Sender: TObject; Field: TField);
    procedure GL_DMCreate(Sender: TObject);
    procedure SrcGLAcctStateChange(Sender: TObject);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure TblGLAcctAfterPost(DataSet: TDataSet);
    procedure TblGLAcctBeforeInsert(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure TblIQSysAfterOpen(DataSet: TDataSet);
    procedure TblGlPeriodsNewRecord(DataSet: TDataSet);
    procedure TblGlPeriodsBeforeEdit(DataSet: TDataSet);
    procedure TblGlPeriodsBeforeInsert(DataSet: TDataSet);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure TblGlYearFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure TblGlYearBeforePost(DataSet: TDataSet);
    procedure PKGLYearFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TblGLAcctAfterDelete(DataSet: TDataSet);
    procedure TblGLAcctCalcFields(DataSet: TDataSet);
    procedure TblGLAcctAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
//    LastAcctType:string;
//    AcctTypeForInsert:string;
     function CheckAccountNumber:Boolean;
  public
    { Public declarations }
    ApStatus, ArStatus, GlStatus:String;
    Period    : Real;
    StartDate : TDateTime;
    EndDate   : TDateTime;
    procedure RefreshLookUpQuery;
  end;

implementation

{$R *.DFM}

uses
{ TODO -oMugdha -cWEBIQ : Dependency on GL
  GL,    }
  gl_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;

{ TGL_DM }
procedure TGL_DM.GL_DMCreate(Sender: TObject);
begin
  IQSetTablesActiveEx( TRUE, self, gl_rscstr.cTXT0000046 { 'Accessing database.  Please wait.'} );
  // TblGLAcctACCT.EditMask:= TblIQSys.FieldbyName('Acct_Mask').AsString;
  TblGLAcct.Refresh;  {to refresh Lookup Query}
end;

procedure TGL_DM.TblIQSysAfterOpen(DataSet: TDataSet);
begin
  TblGLAcctACCT.EditMask:= TblIQSys.FieldbyName('Acct_Mask').AsString;
end;

procedure TGL_DM.TblGLAcctBeforeInsert(DataSet: TDataSet);
begin
//  AcctTypeForInsert:= LastAcctType;
end;

procedure TGL_DM.TblGLAcctNewRecord(DataSet: TDataSet);
begin
//  TblGLAcctTYPE.asString:= sIIf( Empty(AcctTypeForInsert),'REVENUE', AcctTypeForInsert );
  TblGLAcctACCT.asString:= TblIQSys.FieldbyName('Acct_Init').AsString;
  (* TODO -oMugdha -cWEBIQ : Dependency on GL
  with TFrmGLMain(Owner) do if PageControl2.ActivePage = TabForm then  {Set focus to Acct dbedit}
       dbeAcctNumber.SetFocus;
  TFrmGLMain(Owner).dblcAcctTypeCloseUp(nil);  *)
end;

procedure TGL_DM.SrcGLAcctDataChange(Sender: TObject; Field: TField);
begin
//  TblSubAcctType.Filter := 'ACCT_TYPE = ' + Format('''%s''', [TblGlAcct.FieldByName('TYPE').asstring]);
//  TblSubAcctType.Refresh;
//  if (TblGLAcct.State = dsBrowse) or ( Field = TblGLAcctTYPE ) then
//     if TblGLAcctTYPE.asString <> LastAcctType then
//        RefreshLookUpQuery;
end;

procedure TGL_DM.SrcGLAcctStateChange(Sender: TObject);
begin
  {include all records for lookup purposes in Browse mode and limit to acct_type in edit/insert}
//  RefreshLookUpQuery;

  {Menu}
  { TODO -oMugdha -cWEBIQ : Dependency on GL
  if (Owner <> NIL) then with TFrmGLMain(Owner) do
    if Assigned(New1) and Assigned(navMain) then
    begin
      New1.Visible    := navMain.Controls[ Ord(nbInsert) ].Enabled ;
      Delete1.Visible := navMain.Controls[ Ord(nbDelete) ].Enabled ;
    end; }
end;

procedure TGL_DM.RefreshLookUpQuery;
begin
//  with QryGLSubAcct do
//  begin
//    Close;
//    ParamByName('acct_type').Value := TblGLAcctTYPE.asString;
//    ParamByName('IncludeAll').Value := iIIf( TblGLAcct.State in [ dsInsert, dsEdit ], 0, 1);
//
//    {if account type changed - reset sub-acct-id to null}
//    if TblGLAcctTYPE.asString <> LastAcctType then
//       if TblGLAcct.State in [ dsInsert, dsEdit ] then
//       try
//          SrcGLAcct.OnDataChange:= NIL;
//          TblGLAcctGL_SUBACCT_TYPE_ID.asString:= '';
//       finally
//          SrcGLAcct.OnDataChange:= SrcGLAcctDataChange;
//       end;
//
//    LastAcctType:= TblGLAcctTYPE.asString;
//    Open;
//  end;
end;

procedure TGL_DM.AssignIDBeforePost(DataSet: TDataSet);
var
  aTopLevelID:Real;
  aType:String;
  aEplantId:Real;
begin
  with TblGlAcct do
  begin
    if FieldByName('GL_SUBACCT_TYPE_ID').asFloat = 0
      then raise Exception.Create('Account type must be assigned');
    if FieldByName('ID').asFloat <> 0 then
      if not CheckAccountNumber then Abort;
  end;
  aTopLevelID := SelectValueFmtAsFloat('select CONNECT_BY_ROOT id as top_level_id ' +
                           '  from GLSUB_ACCT_TYPE ' +
                           ' where id = %f ' +
                           ' start with parent_id is null ' +
                           ' connect by prior id = parent_id', [TblGLAcctGL_SUBACCT_TYPE_ID.asFloat]);
  aType := SelectValueFmtAsString('select descrip from GLSUB_ACCT_TYPE where id = %f', [aTopLevelID]);

  if aType = 'STATISTICAL' then
  begin
    TblGLAcctPK_HIDE.asString := 'Y';
    TblGLAcctGL_HIDE.asString := 'Y';
    TblGLAcctAP_HIDE.asString := 'Y';
    TblGLAcctAR_HIDE.asString := 'Y';
  end;
  if TblGLAcct.state in [dsInsert] then
  begin
    aEplantId := SelectValueAsFloat('select misc.geteplantid from dual');
    if aEplantId <> 0 then
      TblGLAcctEplant_Id.asFloat := aEplantId;
  end;
  IQAssignIDBeforePost(DataSet);
end;

procedure TGL_DM.TblGlYearBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  if TblGlYearEPLANT_ID.AsFloat = 0 then
    if SecurityManager.EPlantsExist then
    begin
      if SecurityManager.EPlant_ID <> 'NULL' then
        TblGlYearEPLANT_ID.AsFloat := StrToFloat(SecurityManager.EPlant_ID)
    end;
end;


function TGL_DM.CheckAccountNumber:Boolean;
var
  cAcct, S:String;
begin
  Result := True;
  with TblGlAcct do
  begin
    cAcct := SelectValueFmtAsString('select acct from glacct where id = %f', [FieldByName('ID').asFloat]);
    if (cAcct <> FieldByName('ACCT').asString) and
       (SelectValueFmtAsFloat('select count(id) from glbatch where glacct_id = %f',
          [FieldByName('ID').asFloat]) <> 0) then
    begin
      if not IQConfirmYN('Changing Account Number might have adverse effect on your GL Accounts history.'#13 +
                     'Do you still want to do that?') then
      begin
        Result := false;
        Exit;
      end;
      S := Format('Old Acct: %s, New Acct: %s', [cAcct, FieldByName('ACCT').asString]);
      ExecuteCommandFmt('insert into eventlog (event_time, userid, text, class) values ' +
                '(sysdate, user, ''%s'', ''%s'')', [S, 'GLACCT']);
    end;
  end;
end;

procedure TGL_DM.TblGLAcctAfterPost(DataSet: TDataSet);
begin
{ TODO -oMugdha -cWEBIQ : Dependency on GL
  if Owner is TFrmGLMain then with TFrmGLMain(Owner) do
     gridAccounts.EditorMode:= FALSE;
  TFDTable(DataSet).Refresh;  }
end;

procedure TGL_DM.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet );
end;

procedure TGL_DM.TblGlPeriodsBeforeEdit(DataSet: TDataSet);
begin
  with TblGlPeriods do
  begin
    ApStatus  := FieldByName('AP_STATUS').asString;
    ArStatus  := FieldByName('AR_STATUS').asString;
    GlStatus  := FieldByName('GL_STATUS').asString;
    Period    := FieldByName('PERIOD').asFloat;
    StartDate := FieldByName('START_DATE').asDateTime;
    EndDate   := FieldByName('END_DATE').asDateTime;
  end;
  IQPostParentsBeforeEdit( DataSet );
end;

procedure TGL_DM.TblGlPeriodsBeforeInsert(DataSet: TDataSet);
begin
  ApStatus  := '';
  ArStatus  := '';
  GlStatus  := '';
  Period    := 0;
  StartDate := Date;
  EndDate   := Date;
  IQPostParentsBeforeEdit( DataSet );
end;

procedure TGL_DM.TblGlPeriodsNewRecord(DataSet: TDataSet);
begin
  with TblGLPeriods do
  begin
    FieldByName('AP_STATUS').asString := 'N/O';
    FieldByName('AR_STATUS').asString := 'N/O';
    FieldByName('GL_STATUS').asString := 'N/O';
  end;
end;


procedure TGL_DM.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TGL_DM.TblGlYearFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if SelectValueAsFloat('select misc.geteplantid from dual') <> 0 then
    Accept := SelectValueFmtAsFloat('select GL.CheckGLYearEplant(%f, ''GLYEAR'') from dual', [TblGlYearID.asFloat]) = 1
  else
    Accept := true;
end;


procedure TGL_DM.PKGLYearFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if SelectValueAsFloat('select misc.geteplantid from dual') <> 0 then
    Accept := SelectValueFmtAsFloat('select GL.CheckGLYearEplant(%f, ''GLYEAR'') from dual', [TFDQuery(DataSet).FieldByName('ID').asFloat]) = 1
  else
    Accept := true;
end;

procedure TGL_DM.TblGLAcctAfterDelete(DataSet: TDataSet);
begin
{ TODO -oMugdha -cWEBIQ : Dependency on GL
  if Owner is TFrmGLMain then
    TFrmGLMain(Owner).dblcAcctTypeCloseUp(nil);  }
end;

procedure TGL_DM.TblGLAcctCalcFields(DataSet: TDataSet);
begin
  TblGLAcctSubAcctType1.asString := SelectValueFmtAsString('select descrip from GLSub_Acct_Type where id = %f', [TblGLAcctGL_SUBACCT_TYPE_ID.asFloat]);
end;

procedure TGL_DM.TblGLAcctAfterScroll(DataSet: TDataSet);
begin
{ TODO -oMugdha -cWEBIQ : Dependency on GL
  if Owner is TFrmGLMain then
    TFrmGLMain(Owner).dblcAcctTypeCloseUp(nil); }
end;



end.
