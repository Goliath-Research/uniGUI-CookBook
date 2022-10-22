unit CDView;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  DM_CD,
  V_basic,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Vcl.DBGrids,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.Documents,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniMainMenu,
  uniLabel, vcl.wwdbgrid, uniButton, uniBitBtn, uniSpeedButton, uniBasicGrid,
  uniDBGrid, uniDBNavigator, uniPageControl;


//const cSql = 'select p.id as id,' +
//'p.check_no as check_no, ' +
//'p.check_date as check_date, ' +
//'p.eplant_id as eplant_id, ' +
//'p.check_status as check_status, ' +
//'p.glperiods_id_cd         as glperiods_id_cd, ' +
//'decode(NVL(vendor_id, 0), 0, NVL(p.misc_payto, '' ''), p.vendor_company) as Payee, ' +
//'NVL(p.misc_payto, '' '') as MISC_PAYTO, ' +
//'decode(NVL(vendor_id, 0), 0, NVL(p.misc_addr1, '' ''), p.vendor_addr1) as ADDR1, ' +
//'decode(NVL(vendor_id, 0), 0, NVL(p.misc_addr2, '' ''), p.vendor_addr2) as ADDR2, ' +
//'decode(NVL(vendor_id, 0), 0, LTrim(RTrim(p.misc_city)) || '' '' ' +
//'|| LTrim(RTrim(p.misc_state)) || '' '' ' +
//'|| LTrim(RTrim(p.misc_zip)), ' +
//'LTrim(RTrim(p.vendor_city)) || '' '' ' +
//'|| LTrim(RTrim(p.vendor_state)) || '' '' ' +
//'|| LTrim(RTrim(p.vendor_zip))) as Misc_CityStateZip, ' +
//'NVL(p.void_reason, '' '') as VOID_REASON, ' +
//'p.check_type as check_type, ' +
//'NVL(p.vendor_company, '' '') as VENDOR, ' +
//'g.period as period, ' +
//'g.start_date as start_date, ' +
//'g.end_date as end_date, ' +
//'t.amount as amount, ' +
//'p.glacct_acct as acct, ' +
//'f.glacct_id_cash as glacct_id_cash ' +
//'from cheque p, ' +
//'vendor v, ' +
//'bankinfo_dtl f, ' +
//'glperiods g, ' +
//'glacct l, ' +
//'V_TOTAL_CHEQUE t ' +
//'where p.vendor_id = v.id(+) ' +
//'and p.glperiods_id_cd = g.id(+) ' +
//'and p.id = t.cheque_id(+) ' +
//'and p.bankinfo_dtl_id = f.id(+) ' +
//'and not exists (select 1 from pr_check_hist where cheque_id = p.id) ' +
//'and f.glacct_id_cash = l.id';

const cSql = 'select p.id as id,' +
'v.id as vendor_id,      ' +
'p.check_no as check_no, ' +
'p.check_date as check_date, ' +
'p.glacct_id_fx, ' +
'p.eplant_id as eplant_id, ' +
'p.bank_amount as bank_amount, ' +
'p.check_status as check_status, ' +
'p.exchange_rate as exchange_rate, ' +
'p.glperiods_id_cd         as glperiods_id_cd, ' +
'decode(NVL(vendor_id, 0), 0, NVL(p.misc_payto, '' ''), p.vendor_company) as Payee, ' +
'NVL(p.misc_payto, '' '') as MISC_PAYTO, ' +
'decode(NVL(vendor_id, 0), 0, NVL(p.misc_addr1, '' ''), p.vendor_addr1) as ADDR1, ' +
'decode(NVL(vendor_id, 0), 0, NVL(p.misc_addr2, '' ''), p.vendor_addr2) as ADDR2, ' +
'decode(NVL(vendor_id, 0), 0, LTrim(RTrim(p.misc_city)) || '' '' ' +
'|| LTrim(RTrim(p.misc_state)) || '' '' ' +
'|| LTrim(RTrim(p.misc_zip)), ' +
'LTrim(RTrim(p.vendor_city)) || '' '' ' +
'|| LTrim(RTrim(p.vendor_state)) || '' '' ' +
'|| LTrim(RTrim(p.vendor_zip))) as Misc_CityStateZip, ' +
'NVL(p.void_reason, '' '') as VOID_REASON, ' +
'p.check_type as check_type, ' +
'NVL(p.vendor_company, '' '') as VENDOR, ' +
'g.period as period, ' +
'gv.period as void_period, ' +
'g.start_date as start_date, ' +
'g.end_date as end_date, ' +
'p.glacct_acct as acct, ' +
'h.batchnumber, ' +
'hv.batchnumber as void_batchnumber, ' +
'p.comment1 as comment1, ' +
'NVL(f.glacct_id_suspense, f.glacct_id_cash) as glacct_id_cash ' +
'from cheque p, ' +
'v_vendor v, ' +
'bankinfo_dtl f, ' +
'glperiods g, ' +
'glperiods gv, ' +
'glbatchid h, ' +
'glbatchid hv, ' +
'glacct l ' +
'where p.vendor_id = v.id(+) ' +
'and h.glperiods_id = g.id(+) ' +
'and hv.glperiods_id = gv.id(+) ' +
'and p.glbatchid_id = h.id(+) ' +
'and p.void_glbatchid_id = hv.id(+) ' +
'and p.bankinfo_dtl_id = f.id(+) ' +
'and not exists (select 1 from pr_check_hist where cheque_id = p.id) ' +
//'and (p.vendor_id is null or (p.vendor_id is not null and exists (select id from v_vendor where id = p.vendor_id))) ' +
'and f.glacct_id_cash = l.id';



type
  TFrmCDView = class(TFrmViewBasic)
    PkPeriods: TIQWebHPick;
    PkCDCustomers: TIQWebHPick;
    QryDetailAMOUNT_PAID: TBCDField;
    QryDetailAPINVOICE_ID: TBCDField;
    QryDetailAP_DISCOUNT_TAKEN: TBCDField;
    QryDetailINVOICE_NO: TStringField;
    QryDetailDISC_ACCOUNT: TStringField;
    QryDetailMISC_ACCOUNT: TStringField;
    PkCDCustomersVENDOR_ID: TBCDField;
    PkCDCustomersCOMPANY: TStringField;
    PkCDCustomersADDR1: TStringField;
    PkCDCustomersADDR2: TStringField;
    PkCDCustomersCITY: TStringField;
    PkCDCustomersSTATE: TStringField;
    PkCDCustomersZIP: TStringField;
    PkPeriodsGLPERIODS_ID_CD: TBCDField;
    PkPeriodsPERIOD: TBCDField;
    PkPeriodsSTART_DATE: TDateTimeField;
    PkPeriodsEND_DATE: TDateTimeField;
    PkPeriodsDESCRIP: TStringField;
    QryHeaderID: TBCDField;
    QryHeaderCHECK_NO: TBCDField;
    QryHeaderCHECK_DATE: TDateTimeField;
    QryHeaderCHECK_STATUS: TStringField;
    QryHeaderMISC_PAYTO: TStringField;
    QryHeaderMISC_CITYSTATEZIP: TStringField;
    QryHeaderVOID_REASON: TStringField;
    QryHeaderCHECK_TYPE: TStringField;
    QryHeaderVENDOR: TStringField;
    QryHeaderPERIOD: TBCDField;
    QryHeaderSTART_DATE: TDateTimeField;
    QryHeaderEND_DATE: TDateTimeField;
    QryHeaderACCT: TStringField;
    PkSearch: TIQWebHPick;
    PkSearchID: TBCDField;
    PkSearchCHECK_NO: TBCDField;
    PkSearchCHECK_DATE: TDateTimeField;
    PkSearchCHECK_STATUS: TStringField;
    PkSearchMISC_PAYTO: TStringField;
    PkSearchMISC_ADDR1: TStringField;
    PkSearchMISC_ADDR2: TStringField;
    PkSearchMISC_CITYSTATEZIP: TStringField;
    PkSearchVOID_REASON: TStringField;
    PkSearchCHECK_TYPE: TStringField;
    PkSearchVENDOR: TStringField;
    PkSearchPERIOD: TBCDField;
    PkSearchSTART_DATE: TDateTimeField;
    PkSearchEND_DATE: TDateTimeField;
    PkSearchACCT: TStringField;
    PkSearchPAYEE: TStringField;
    SrcTotals: TDataSource;
    QryTotals: TFDQuery;
    QryHeaderPAYEE: TStringField;
    QryTotalsCHEQUE_ID: TBCDField;
    QryTotalsAMOUNT: TFMTBCDField;
    QryTotalsDISCOUNT: TFMTBCDField;
    VoidCheck1: TUniMenuItem;
    N3: TUniMenuItem;
    QryHeaderGLPERIODS_ID_CD: TBCDField;
    QryHeaderADDR1: TStringField;
    QryHeaderADDR2: TStringField;
    QryHeaderGLACCT_ID_CASH: TFMTBCDField;
    QryDetailGLACCT_ID_AP: TBCDField;
    QryDetailID: TBCDField;
    PM: TUniPopupMenu;
    JumptoAP1: TUniMenuItem;
    Contents1: TUniMenuItem;
    QryHeaderEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    QryHeaderEPlant_Name: TStringField;
    PkSearchEPLANT_ID: TBCDField;
    PkPeriodsEPLANT_ID: TBCDField;
    PkCDCustomersEPLANT_ID: TBCDField;
    QryHeaderAMOUNT: TFloatField;
    QryDetailINVOICE_DATE: TDateTimeField;
    QryHeaderEXCHANGE_RATE: TFMTBCDField;
    QryHeaderBANK_AMOUNT: TBCDField;
    QryHeaderGLACCT_ID_FX: TBCDField;
    QryHeaderBATCHNUMBER: TBCDField;
    QryHeaderVOID_BATCHNUMBER: TBCDField;
    QryHeaderCOMMENT1: TStringField;
    wwMemoDialog10: TwwMemoDialog;
    QryHeaderVOID_PERIOD: TBCDField;
    QryDetailDISC_ACCOUNT_DESC: TStringField;
    QryDetailMISC_ACCOUNT_DESC: TStringField;
    Panel4: TUniPanel;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    lblEPlant: TUniLabel;
    Label112: TUniLabel;
    Label10: TUniLabel;
    Label34: TUniLabel;
    Label11: TUniLabel;
    DBCheckDate: TUniDBEdit;
    DBCheckNo: TUniDBEdit;
    DBCheckStatus: TUniDBEdit;
    DBGlAcct: TUniDBEdit;
    DBPeriod: TUniDBEdit;
    DBCheckType: TUniDBEdit;
    DBPayee: TUniDBEdit;
    DBDisc: TUniDBEdit;
    dbePlant: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    DBBatch: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBcomment: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    GroupBox1: TUniGroupBox;
    Memo1: TUniMemo;
    Label12: TUniLabel;
    DBEdit4: TUniDBEdit;
    QryHeaderEFT: TStringField;
    Label13: TUniLabel;
    DBEdit5: TUniDBEdit;
    PkSearchEFT: TStringField;
    SR: TIQWebSecurityRegister;
    N4: TUniMenuItem;
    CreateEDIFile8201: TUniMenuItem;
    QryHeaderVENDOR_ID: TBCDField;
    PkSearchVENDOR_ID: TBCDField;
    PkSearchBANK_AMOUNT: TBCDField;
    Label14: TUniLabel;
    DBEdit6: TUniDBEdit;
    procedure SBAllClick(Sender: TObject);
    procedure SBCustomerClick(Sender: TObject);
    procedure SBPeriodClick(Sender: TObject);
    procedure SBOriginalClick(Sender: TObject);
    procedure VoidCheck1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcQryHeaderDataChange(Sender: TObject; Field: TField);
    procedure JumptoAP1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure QryHeaderBeforeOpen(DataSet: TDataSet);
    procedure QryHeaderAfterScroll(DataSet: TDataSet);
    procedure PkCDCustomersBeforeOpen(DataSet: TDataSet);
    procedure QryHeaderCalcFields(DataSet: TDataSet);
    procedure DBcommentDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CreateEDIFile8201Click(Sender: TObject);
  private
    { Private declarations }
//    fHint:TNotifyEvent;
    FPeriodID:Real;
    FDoNotOpenHeader:Boolean;
    FBatchNum:Integer;
    FGLBatchId_Id:Real;
    FList:TStringList;
    FId: Real;
    FHeaderId: Real;
    procedure ExecuteAllSearch;override;
    procedure ExecutePeriodSearch;override;
    procedure ExecuteCustomerSearch;override;
    procedure VoidCheck(cReason, AVoidedBy:String; AVoidedDate:TDateTime);

    procedure InsertGlbatchId(nGLBatchId_Id:Real; ABatchDate:TDateTime);
    procedure InsertGlbatch(nGLBatchId_Id:Real);
    procedure InsertRevDiscounts(nGLBatchId_Id:Real);
    procedure InsertDiscounts(nGLBatchId_Id:Real);
    procedure InsertMove(nGLBatchId_Id:Real);
    procedure InsertCDFX(nGLBatchId_Id:Real);
    procedure InsertGainandLoss(nGLBatchId_Id:Real);
    procedure InsertIntercomp(nGLBatchId_Id:Real);
    procedure InsertRevItems(nGLBatchId_Id:Real);
    procedure InsertItems(nGLBatchId_Id:Real);
//    procedure DisplayHint(Sender: TObject);
    procedure PrintAfterPostReport(nGLBatchId_Id:Real);
    procedure PrintAfterPostReportB;
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
    procedure SetPKEPlantFilter;
    procedure SetHightAndWidth;


    procedure InsertFXItems(nGLBatchId_Id:Real);
    procedure InsertFXDiscounts(nGLBatchId_Id:Real);
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure SetId(const Value: Real);
    procedure SetHeaderId(const Value: Real);
  public
    { Public declarations }
    DM: TCD_DM;
    (*
    constructor CreateJumpToCD(AOwner:TComponent; Id:Real);
    constructor Create(AOwner:TComponent; Id:Real; AHeaderId:Real = 0);
    constructor CreateJumpFromAP(AOwner:TComponent; Id:Real);
    constructor CreateJumpFromAP_IncludeVoids(AOwner:TComponent; Id:Real);
    *)
    property Id:Real  write SetId;
    property HeaderId:Real write SetHeaderId;
  end;


procedure DoJumptoCD(aId:Real);
procedure DoJumpFromAPCD(aId:Real);
procedure DoJumpFromAPCD_IncludeVoids(aId:Real);
procedure DoViewCD(aId:Real; AHeaderId:Real = 0);


implementation

{$R *.DFM}

uses
  APView,
  cd_rscstr,
  //CD_Void,
  //Edi820,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,
  UniGuiApplication,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils;

procedure DoViewCD(aId:Real; AHeaderId:Real = 0);
var
   LFrmCDView : TFrmCDView;
begin
  LFrmCDView := TFrmCDView.Create(UniGuiApplication.UniApplication);

  with LFrmCDView do
  begin
  ID:= aId;
  HeaderId:=AHeaderId;
  GridDetail.Cursor:= crJump;

  if GlBatchId_Id = 0
    then SBAll.Click
    else
    begin
      SBOriginal.Visible := True;
      Original1.Visible := True;
      SBOriginal.Click;
      if not (QryHeader.eof and QryHeader.bof) then
        Exit;
    end;

  try
    SBSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      //PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
     // System.SysUtils.ABORT;
    end;
  end;
    SR.Refresh;

    show;
  end;
end;

procedure DoJumpFromAPCD(aId:Real);
var
   LFrmCDView : TFrmCDView;
begin
  LFrmCDView := TFrmCDView.Create(UniGuiApplication.UniApplication);
  LFrmCDView.ID:= aId;
  LFrmCDView.ShowModal;
end;

procedure DoJumpToCD(aId:Real);
var
   LFrmCDView : TFrmCDView;
begin
  LFrmCDView := TFrmCDView.create(UniGuiApplication.UniApplication);
  LFrmCDView.ID:=aID;
  LFrmCDView.ShowModal;
end;


procedure DoJumpFromAPCD_IncludeVoids(aId:Real);
var
 LFrmCDView : TFrmCDView;
begin
  LFrmCDView := TFrmCDView.create(UniGuiApplication.UniApplication);
  LFrmCDView.id:=aId;
  LFrmCDView.ShowModal;
end;
(*
constructor TFrmCDView.Create( AOwner:TComponent; aId:Real; AHeaderId:Real = 0 );
begin
  DM:= TCD_DM.Create(self);
  inherited Create( AOwner );
  SetPKEPlantFilter;

  DM.Name:= '';
  IQRegFormRead( self, [ self, GridDetail, Panel4 ]);
  IQSetTablesActiveEx( TRUE, self, cd_rscstr.cTXT0000076 {'Accessing Cash Disbursements.  Please wait.'} );
  GlBatchId_Id := Id;
  FHeaderId := AHeaderId;

//  fHint := Application.OnHint;

//  Application.OnHint := DisplayHint;
  GridDetail.Cursor:= crJump;

  if GlBatchId_Id = 0
    then SBAll.Click
    else
    begin
      SBOriginal.Visible := True;
      Original1.Visible := True;
      SBOriginal.Click;
      if not (QryHeader.eof and QryHeader.bof) then
        Exit;
    end;

  try
    SBSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
     // System.SysUtils.ABORT;
    end;
  end;
  SR.Refresh;
end;


constructor TFrmCDView.CreateJumpToCD( AOwner:TComponent; Id:Real);
begin
  DM:= TCD_DM.Create(self);
  inherited Create( AOwner );
  SetPKEPlantFilter;

  DM.Name:= '';
  IQRegFormRead( self, [ self, GridDetail, Panel4 ]);
  IQSetTablesActiveEx( TRUE, self, cd_rscstr.cTXT0000076 {'Accessing Cash Disbursements.  Please wait.'} );
  GlBatchId_Id := 0;
  FHeaderId := 0;

//  fHint := Application.OnHint;

//  Application.OnHint := DisplayHint;
  GridDetail.Cursor:= crJump;

  if GlBatchId_Id = 0
    then SBAll.Click
    else
    begin
      SBOriginal.Visible := True;
      Original1.Visible := True;
      SBOriginal.Click;
      if not (QryHeader.eof and QryHeader.bof) then
        Exit;
    end;

  if Id = 0 then
  try
    SBSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
     // System.SysUtils.ABORT;
    end;
  end
  else QryHeader.Locate('ID', Id, []);
end;
*)


procedure TFrmCDView.SetPKEPlantFilter;
begin
  if SecurityManager.EPlant_ID <> 'NULL' then
  begin
    if Pos('MISC.EPLANT_FILTER', PkCDCustomers.Sql.Text) = 0 then
      PkCDCustomers.Sql.Add(IQFormat(' and i.eplant_id = %f ', [StrToFloat(SecurityManager.EPlant_ID)]));
    if Pos('MISC.EPLANT_FILTER', PkPeriods.Sql.Text)  = 0 then
      PkPeriods.Sql.Add(IQFormat(' and i.eplant_id = %f ', [StrToFloat(SecurityManager.EPlant_ID)]));
    if Pos('MISC.EPLANT_FILTER', PkSearch.Sql.Text)  = 0 then
      PkSearch.Sql.Add(IQFormat(' and i.eplant_id = %f ', [StrToFloat(SecurityManager.EPlant_ID)]));
  end;
  SetHightAndWidth;
end;

procedure TFrmCDView.SetHeaderId(const Value: Real);
begin
  FHeaderId := Value;
end;

procedure TFrmCDView.SetHightAndWidth;
begin
  DBEdit1.Height     := 17;
  DBDisc.Height      := DBEdit1.Height;
  DBEdit3.Height     := DBEdit1.Height;
  DBPeriod.Height    := DBEdit1.Height;
  DBEdit2.Height     := DBEdit1.Height;
  DBCheckType.Height := DBEdit1.Height;

//  DBDisc.Width      := DBEdit1.Width;
//  DBEdit3.Width     := DBEdit1.Width;
//  DBPeriod.Width    := DBEdit1.Width;
//  DBEdit2.Width     := DBEdit1.Width;
//  DBCheckType.Width := DBEdit1.Width;

end;


procedure TFrmCDView.SetId(const Value: Real);
begin
  FId := Value;
end;

(*
constructor TFrmCDView.CreateJumpFromAP(AOwner:TComponent; Id:Real);
var
  AHeaderId, ADetailId:Real;
begin
  DM:= TCD_DM.Create(self);
  inherited Create( AOwner );
  DM.Name:= '';
  SetPKEPlantFilter;
  IQRegFormRead( self, [ self, GridDetail, Panel4 ]);
  IQSetTablesActiveEx( TRUE, self, cd_rscstr.cTXT0000076 {'Accessing Cash Disbursements.  Please wait.'} );


//  fHint := Application.OnHint;

//  Application.OnHint := DisplayHint;

  GridDetail.Cursor:= crJump;


  FDoNotOpenHeader := True;
  SBAllClick(nil);
  Caption := cd_rscstr.cTXT0000045; // 'View Cash Disbursements';


  Panel1.Visible      := False;
  All1.Visible        := False;
  ByCustomer1.Visible := False;
  ByPeriod1.Visible   := False;
  Original1.Visible   := False;
  N1.Visible          := False;
  Search1.Visible     := False;
  N2.Visible          := False;

  ADetailId := SelectValueFmtAsFloat('select min(d.id) from CHEQUE_DETAIL d, CHEQUE c where d.cheque_id = c.id ' +
                         'and SubStr(NVL(c.check_status, '' ''), 1, 4) <> ''VOID'' ' +
                         'and apinvoice_id = %f', [Id]);

  if ADetailId = 0 then Exit;

  AHeaderId := SelectValueFmtAsFloat('select cheque_id from CHEQUE_DETAIL where id = %f', [ADetailId]);

  QryHeader.Close;
  QryHeader.Sql.Add(IqFormat(' and p.id = %f ', [AHeaderId]));
  QryHeader.Open;


//  QryHeader.Locate('ID', AHeaderId, []);
  QryDetail.Locate('ID', ADetailId, []);

end;

constructor TFrmCDView.CreateJumpFromAP_IncludeVoids(AOwner:TComponent; Id:Real);
var
  AHeaderId, ADetailId:Real;
begin
  DM:= TCD_DM.Create(self);
  inherited Create( AOwner );
  DM.Name:= '';
  SetPKEPlantFilter;
  IQRegFormRead( self, [ self, GridDetail, Panel4 ]);
  IQSetTablesActiveEx( TRUE, self, cd_rscstr.cTXT0000076 {'Accessing Cash Disbursements.  Please wait.'} );


//  fHint := Application.OnHint;

//  Application.OnHint := DisplayHint;

  GridDetail.Cursor:= crJump;

  FDoNotOpenHeader := True;
  SBAllClick(nil);
  Caption := cd_rscstr.cTXT0000045; // 'View Cash Disbursements';


  Panel1.Visible      := False;
  All1.Visible        := False;
  ByCustomer1.Visible := False;
  ByPeriod1.Visible   := False;
  Original1.Visible   := False;
  N1.Visible          := False;
  Search1.Visible     := False;
  N2.Visible          := False;

  ADetailId := Id;

  if ADetailId = 0 then Exit;

  AHeaderId := SelectValueFmtAsFloat('select cheque_id from CHEQUE_DETAIL where id = %f', [ADetailId]);

  QryHeader.Close;
  QryHeader.Sql.Add(IqFormat(' and p.id = %f ', [AHeaderId]));
  QryHeader.Open;


//  QryHeader.Locate('ID', AHeaderId, []);
  QryDetail.Locate('ID', ADetailId, []);
end;
*)

procedure TFrmCDView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//   Application.OnHint := fHint;
  Application.OnShowHint:= NIL;
  IQRegFormWrite( self, [ self, GridDetail, Panel4 ]);
end;

//procedure TFrmCDView.DisplayHint(Sender: TObject);
//begin
//  if Assigned(QryHeader) and (QryHeader <> nil) and Assigned(DBPeriod) and (DBPeriod <> nil) then
//  with QryHeader do
//    DBPeriod.Hint := Format(cd_rscstr.cTXT0000046, // 'From: %s'#13'To: %s'
//     [DateToStr(FieldByName('Start_Date').asDateTime),
//      DateToStr(FieldByName('End_Date').asDateTime)]);
//end;


procedure TFrmCDView.SBAllClick(Sender: TObject);
begin
  inherited;
  PrevButtonClicked := SBAll;
  Caption := cd_rscstr.cTXT0000047; // 'View Cash Disbursements (All)';
  All1.Checked := True;
  ByCustomer1.Checked := False;
  ByPeriod1.Checked := False;
  Original1.Checked  := False;
  with QryHeader do
  begin
    Close;
    Sql.Clear;
    Sql.Add(cSql);
//    Sql.Add(cSql + ' order by p.check_date');
    if not FDoNotOpenHeader then
      Open;
  end;

end;

procedure TFrmCDView.SBCustomerClick(Sender: TObject);
var
  Company:string;
begin
  inherited;
  if PkCDCustomers.Execute then
  begin
    nArCustoId := PkCDCustomers.GetValue('VENDOR_ID');
    Company    := PkCDCustomers.GetValue('Company');
    with QryHeader do
    begin
      Close;
      Sql.Clear;
      Sql.Add(cSql + IQFormat(' and p.vendor_id = %f ', [nArCustoId]));
//      Sql.Add(cSql + Format(' and p.vendor_id = %f order by p.check_date', [nArCustoId]));
      Open;
    end;
    PrevButtonClicked := SBCustomer;
    Caption := Format(cd_rscstr.cTXT0000048, // 'View Cash Disbursements (Vendor: %s)',
     [Trim(Company)]);
    All1.Checked := False;
    ByCustomer1.Checked := True;
    ByPeriod1.Checked := False;
    Original1.Checked  := False;
  end;
end;

procedure TFrmCDView.SBPeriodClick(Sender: TObject);
var
  nPeriod:Integer;
  cStart_Date, cEnd_Date:string;
begin
  inherited;
  if PkPeriods.Execute then
  begin
    nGlPeriodId := PkPeriods.GetValue('GLPERIODS_ID_CD');
    nPeriod     := PkPeriods.GetValue('PERIOD');
    cStart_Date := DateToStr(PkPeriods.GetValue('START_DATE'));
    cEnd_Date   := DateToStr(PkPeriods.GetValue('END_DATE'));
    with QryHeader do
    begin
      Close;
      Sql.Clear;
      Sql.Add(cSql + IQFormat(' and GLPERIODS_ID_CD = %f ', [nGlPeriodId]));
//      Sql.Add(cSql + Format(' and GLPERIODS_ID_CD = %f order by p.check_date', [nGlPeriodId]));
      Open;
    end;
    PrevButtonClicked := SBPeriod;
    // 'View Cash Disbursements (Period #: %d, %s - %s)'
    Caption := Format(cd_rscstr.cTXT0000049, [nPeriod, cStart_Date, cEnd_Date]);
    All1.Checked := False;
    ByCustomer1.Checked := False;
    ByPeriod1.Checked := True;
    Original1.Checked  := False;
  end;

end;

procedure TFrmCDView.SBOriginalClick(Sender: TObject);
begin
  inherited;
  with QryHeader do
  begin
    Close;
    Sql.Clear;
    Sql.Add(cSql + IQFormat(' and p.id = %f ', [FHeaderId]));
    Open;
    if eof and bof then
    begin
      Close;
      Sql.Clear;
      Sql.Add(cSql + IQFormat(' and glbatchid_id = %f ', [GlBatchId_Id]));
      Open;
    end;
    if eof and bof then
    begin
      Close;
      Sql.Clear;
      Sql.Add(cSql + IQFormat(' and void_glbatchid_id = %f ', [GlBatchId_Id]));
      Open;
    end;
//    Sql.Add(cSql + Format(' and glbatchid_id = %f order by p.check_date', [GlBatchId_Id]));
  end;
  PrevButtonClicked := SBOriginal;
  Caption := cd_rscstr.cTXT0000050; // 'View Cash Disbursements (Original)';
  All1.Checked := False;
  ByCustomer1.Checked := False;
  ByPeriod1.Checked := False;
  Original1.Checked  := True;
end;

procedure TFrmCDView.ExecuteAllSearch;
begin
  with PkSearch do
  begin
//    Sql.Clear;
//    Sql.Add(cSql);
    if Execute then
      QryHeader.Locate('ID', GetValue('ID'), [loCaseInsensitive])
    else System.SysUtils.Abort;
  end;
end;

procedure TFrmCDView.ExecutePeriodSearch;
begin
  with PkSearch do
  begin
    Sql.Clear;
    Sql.Add(cSql + IQFormat(' and p.glperiods_id_cd = %f', [nGlPeriodId]));
    if Execute then QryHeader.Locate('ID', GetValue('ID'), [loCaseInsensitive])
    else System.SysUtils.Abort;

  end;
end;

procedure TFrmCDView.ExecuteCustomerSearch;
begin
  with PkSearch do
  begin
    Sql.Clear;
    Sql.Add(cSql + IQFormat(' and p.vendor_id = %f', [nArCustoId]));
    if Execute then QryHeader.Locate('ID', GetValue('ID'), [loCaseInsensitive])
    else System.SysUtils.Abort;

  end;
end;


procedure TFrmCDView.VoidCheck1Click(Sender: TObject);
var
  AReason:String;
  AVoidedBy:String;
  AVoidedDate:TDateTime;
  i, j:integer;
  AId:Real;
  ApinvoiceId:Real;
begin

  if GridHeader.SelectedRows.count = 0 then
  begin
    if Copy(QryHeaderCHECK_STATUS.AsString, 1, 7) =  'CLEARED' then
      // 'The Check has been cleared.  Cannot void.'
      raise Exception.Create(cd_rscstr.cTXT0000051);

    if Copy(QryHeader.FieldByName('CHECK_STATUS').asString, 1, 4) = 'VOID'
      then raise Exception.Create(cd_rscstr.cTXT0000052 {'The Check is already void.'});
  end;

  FPeriodID := SelectValueAsFloat('select id from glperiods where trunc(sysdate) between start_date and end_date and GL.CheckGLYearEplant(id) = 1');
  if FPeriodID = 0 then
    FPeriodID := QryHeader.FieldByName('GLPERIODS_ID_CD').asFloat;

//  if not GetCDVoidInfo(FPeriodID, cReason) then Exit;     {in CDVoid.pas}

   ApinvoiceId := SelectValueFmtAsFloat('select id from apinvoice where cheque_id = %f and instr(invoice_no, ''ON_ACCT'') <> 0', [QryHeader.FieldByName('ID').asFloat]);

   if ApinvoiceId <> 0 then
   begin
     ApinvoiceId := SelectValueFmtAsFloat('select d.apinvoice_id from cheque_detail d, cheque c where d.cheque_id = c.id and NVL(c.CHECK_STATUS, ''*'') <> ''VOID'' and d.apinvoice_id = %f', [ApinvoiceId]);
     if ApinvoiceId <> 0 then
      raise Exception.Create(cd_rscstr.cTXT0000086);
   end;



  if not IqConfirmYN(cd_rscstr.cTXT0000053{'Void the current check(s)?'}) then Exit;
  { TODO -ombaral -cWEBIQ : Resolve dependency
  if not DoVoidCD(self,  AReason, AVoidedBy, AVoidedDate, FPeriodID) then Exit;
  }


//  CheckForOpenPeriod('ap_status', QryHeader.FieldByName('GLPERIODS_ID_CD').asFloat);  {in IqAcct.pas}

//  if not InputQuery('Void Check',
//                    Format('Enter reason for VOIDING Check# %d',
//                    [QryHeader.FieldByName('CHECK_NO').asInteger]),
//                     cReason) then Abort;
//  cReason := StrTran(cReason, '''', '''''');

  if GridHeader.SelectedRows.Count > 0 then
  begin
    FList := TStringList.Create;
    try
    with GridHeader.DataSource.DataSet do
      for i:=0 to GridHeader.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(GridHeader.SelectedRows.Items[i]));
        if Copy(QryHeaderCHECK_STATUS.AsString, 1, 7) =  'CLEARED' then
          Continue;

        if Copy(QryHeader.FieldByName('CHECK_STATUS').asString, 1, 4) = 'VOID'
          then Continue;

        VoidCheck(AReason, AVoidedBy, AVoidedDate);
      end;

      //'Checks voided successfully.  Do you want to print the AfterPost report?'
      if IqConfirmYN(Format(cd_rscstr.cTXT0000054, [FBatchNum])) then
          PrintAfterPostReportB;
//      begin
//        for j := 0 to FList.Count - 1 do
//          PrintAfterPostReport(StrToFloat(FList[j]));
//      end;


      AId := QryHeaderID.AsFloat;
      QryHeader.Close;
      QryHeader.Open;
      QryHeader.Locate('ID', AId, []);
    finally
      FList.Free;
    end;
  end
  else
    VoidCheck(AReason, AVoidedBy, AVoidedDate);
end;


procedure TFrmCDView.VoidCheck(cReason:String; AVoidedBy:String; AVoidedDate:TDateTime);
var
  DBase:TFDCustomConnection;
  nGLBatchId_Id:Real;
  nChequeId:Real;
  nBatchNum:Integer;
  AId:Real;
  ApinvoiceId:Real;
begin
  try
    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    nBatchNum :=Trunc(DM.TblPrePostCtrl.FieldByName('ID').asFloat);
    FBatchnum := nBatchNum;

    ApinvoiceId := 0;
    with QryHeader do
    begin
      AId := QryHeaderID.AsFloat;
      if FieldByName('CHECK_TYPE').asString <> 'NONGL' then
      begin
        nGLBatchId_Id  := GetNextID('GLBATCHID');
        FGLBatchId_Id  := nGLBatchId_Id;
        if GridHeader.SelectedRows.Count <> 0 then
          FList.Add(FloatToStr(Trunc(FGLBatchId_Id)));

        InsertGlbatchId(nGLBatchId_Id, AVoidedDate);
        InsertGlbatch(nGLBatchId_Id);
        ExecuteCommandFmt('update glbatch set header_id = %f where glbatchid_id = %f', [QryHeaderID.asFloat, nGLBatchId_Id]);
        ExecuteCommandFmt('begin iq_cd_post.UpdateVoidedglbatch(%f, %.6f); end;', [nGLBatchId_Id, QryHeaderID.asFloat]);
        ExecuteCommandFmt('begin intercomp.update_glbatch(%f, ''Y''); end;', [nGLBatchId_Id]);

        ExecuteCommandFmt('update cheque set check_status = ''VOID'', ' +
                                       'void_glbatchid_id = %f, ' +
                                       'void_reason = ''%s'', ' +
                                       'void_by = ''%s'', ' +
                                       'void_date = To_Date(''%s'', ''MM/DD/RRRR''), ' +
                                       'GLPERIODS_ID_CD = %f ' +
                                       'where id = %f',
             [nGLBatchId_Id,
              cReason,
              AVoidedBy,
              FormatDateTime('mm/dd/yyyy', AVoidedDate),
              FPeriodID,
              FieldByName('ID').asFloat]);

      end
      else
        ExecuteCommandFmt('update cheque set check_status = ''VOID'', ' +
                                       'void_reason = ''%s'', ' +
                                       'void_by = ''%s'', ' +
                                       'void_date = To_Date(''%s'', ''MM/DD/RRRR''), ' +
                                       'GLPERIODS_ID_CD = %f ' +
                                       'where id = %f',
             [cReason,
              AVoidedBy,
              FormatDateTime('mm/dd/yyyy', AVoidedDate),
              FPeriodID,
              FieldByName('ID').asFloat]);

      ExecuteCommandFmt('update C_AP_CHEQUE_DETAIL set latestpay_date = null where APINVOICE_ID in ' +
                ' (select APINVOICE_ID from cheque_detail where cheque_id = %f)', [FieldByName('ID').asFloat]);

      ApinvoiceId := SelectValueFmtAsFloat('select id from apinvoice where cheque_id = %f and instr(invoice_no, ''ON_ACCT'') <> 0', [FieldByName('ID').asFloat]);
    end;

    if ApinvoiceId <> 0 then
      ExecuteCommand(IQFormat('Delete APINVOICE where id = %f', [ApinvoiceId]));


    DBase.Commit;
    if GridHeader.SelectedRows.Count = 0 then
    begin
      QryHeader.Close;
      QryHeader.Open;
      QryHeader.Locate('ID', AId, []);
      //'Check voided successfully.  Do you want to print the AfterPost report?'
      if IqConfirmYN(Format(cd_rscstr.cTXT0000055, [nBatchNum]))
        then  PrintAfterPostReport(nGLBatchId_Id);
    end;

  finally
    if DBase.InTransaction then
    begin
      DBase.RollBack;
      ShowMessage(cd_rscstr.cTXT0000056{'Check was not posted.'});
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCDView.PrintAfterPostReportB;
var
  SelectionList:TStringList;
  S: string;
  ACopies : Integer;
  ACollated: Boolean;
  J:integer;
  AStartPage, AStopPage: Integer;
begin
  S:= SelectValueAsString('select cd_afterpost_report from iqsys');
  if Empty( S ) then
     // 'No default report assigned in System Parameters. Please assign default report'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160);

  if not AssignPrinterSettings( self, S, ACopies, ACollated, AStartPage, AStopPage ) then exit; {in IQMS.Common.Print.pas}
  for j := 0 to FList.Count - 1 do
  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList,  IQFormat('{GLBATCHID.ID} = %s', [FList[j]]));
    PrintDefaultReportExA( S, SelectionList, ACopies, ACollated, AStartPage, AStopPage );
//    PrintDefaultReport( self, 'cd_afterpost_report', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
  Screen.Cursor := crDefault;
end;


procedure TFrmCDView.PrintAfterPostReport(nGLBatchId_Id:Real);
var
  SelectionList:TStringList;
begin

  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList,  IQFormat('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
    PrintDefaultReport( self, 'cd_afterpost_report', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmCDView.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;


procedure TFrmCDView.InsertGlbatchId(nGLBatchId_Id:Real; ABatchDate:TDateTime);
var
  nBatchnumber:Real;
begin
  nBatchNumber   := GetNextSequenceNumber('S_CASHDISB');
  ExecuteCommand(IQFormat('insert into glbatchid ' +
                '(id, ' +
                'batchnumber, ' +
                'source, ' +
                'tablename, ' +
                'glperiods_id, ' +
                'userid, ' +
                'batch_date) ' +
                'values ' +
                '(%f, ' +
                '%f, ' +
                '''CD'', ' +
                '''CASH_DISBURSEMENT VOID'', ' +
                '%f, ' +
                '''%s'', ' +
                'To_Date(''%s'', ''MM/DD/RRRR''))',
                [nGlBatchId_Id,
                 nBatchNumber,
                 FPeriodID,
                 SecurityManager.UserName,
                 FormatDateTime('mm/dd/yyyy', ABatchDate)]));
//                 FormatDateTime('mm/dd/yyyy', QryHeader.FieldByName('CHECK_DATE').asDateTime)]));

end;

procedure TFrmCDView.InsertGlbatch(nGLBatchId_Id:Real);
var
  nSum:Real;
begin
  InsertItems(nGLBatchId_Id);
  InsertMove(nGLBatchId_Id);
  InsertCDFX(nGLBatchId_Id);
  InsertGainandLoss(nGLBatchId_Id);

//  InsertIntercomp(nGLBatchId_Id);
  InsertRevItems(nGLBatchId_Id);
  InsertFXItems(nGLBatchId_Id);
  InsertDiscounts(nGLBatchId_Id);
  InsertRevDiscounts(nGLBatchId_Id);
  InsertFXDiscounts(nGLBatchId_Id);
end;

procedure TFrmCDView.InsertCDFX(nGLBatchId_Id:Real);
var
  AGlbatchid_id: Real;
begin
  AGlbatchid_id := SelectValueFmtAsFloat('select glbatchid_id from cheque where id = %f', [QryHeaderID.asFloat]);
  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'debit, ' +
            'credit, ' +
            'descrip) ' +
            ' select ' +
            ' %f, ' +
            'glacct_id, ' +
            'credit, ' +
            'debit, ' +
            '''VOID CD FX POSTING CHECK# '' || ''%s'' ' +
            ' from glbatch where glbatchid_id = %f and InStr(descrip, ''CD FX POSTING'') <> 0 and header_id = %f',
            [nGlBatchId_Id,
             IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
             AGlbatchid_id,
             QryHeaderID.asFloat]);
end;


procedure TFrmCDView.InsertMove(nGLBatchId_Id:Real);
var
  AGlbatchid_id: Real;
begin
  AGlbatchid_id := SelectValueFmtAsFloat('select glbatchid_id from cheque where id = %f', [QryHeaderID.asFloat]);
  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'debit, ' +
            'credit, ' +
            'descrip) ' +
            ' select ' +
            ' %f, ' +
            'glacct_id, ' +
            'credit, ' +
            'debit, ' +
            '''VOID FX MOVE FOR CHECK# '' || ''%s'' ' +
            ' from glbatch where glbatchid_id = %f and InStr(descrip, ''FX MOVE'') <> 0 and header_id = %f',
            [nGlBatchId_Id,
             IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
             AGlbatchid_id,
             QryHeaderID.asFloat]);
end;

procedure TFrmCDView.InsertGainandLoss(nGLBatchId_Id:Real);
var
  AGlbatchid_id: Real;
begin
  AGlbatchid_id := SelectValueFmtAsFloat('select glbatchid_id from cheque where id = %f', [QryHeaderID.asFloat]);
  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'debit, ' +
            'credit, ' +
            'descrip) ' +
            ' select ' +
            ' %f, ' +
            'glacct_id, ' +
            'credit, ' +
            'debit, ' +
            '''VOID FX MOVE FOR CHECK# '' || ''%s'' ' +
            ' from glbatch where glbatchid_id = %f and InStr(descrip, ''G&L (FX)'') <> 0 and header_id = %f',
            [nGlBatchId_Id,
             IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
             AGlbatchid_id,
             QryHeaderID.asFloat]);
end;


procedure TFrmCDView.InsertIntercomp(nGLBatchId_Id:Real);
var
  AGlbatchid_id: Real;
begin
  AGlbatchid_id := SelectValueFmtAsFloat('select glbatchid_id from cheque where id = %f', [QryHeaderID.asFloat]);
  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'debit, ' +
            'credit, ' +
            'descrip) ' +
            ' select ' +
            ' %f, ' +
            'glacct_id, ' +
            'credit, ' +
            'debit, ' +
            '''VOID Intercompany post FOR CHECK# '' || ''%s'' ' +
            ' from glbatch where glbatchid_id = %f and InStr(descrip, ''Intercompany post'') <> 0 ',
            [nGlBatchId_Id,
             IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
             AGlbatchid_id]);
end;


procedure TFrmCDView.InsertItems(nGLBatchId_Id:Real);
begin
  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'debit, ' +
            'credit, ' +
            'descrip) ' +
            'values( ' +
            '%f, ' +
            '%f, ' +
            'decode(sign( %f ) , -1, 0, Abs(%f)), ' +
            'decode(sign(%f), -1, Abs(%f), 0), ' +
            '''VOID AMOUNT FOR CHECK# '' || ''%s'')',
            [nGlBatchId_Id,
            QryHeader.FieldByName('GLACCT_ID_CASH').asFloat,
            QryHeader.FieldByName('BANK_AMOUNT').asFloat,
            QryHeader.FieldByName('BANK_AMOUNT').asFloat,
            QryHeader.FieldByName('BANK_AMOUNT').asFloat,
            QryHeader.FieldByName('BANK_AMOUNT').asFloat,
            IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat))]);



{  ExecuteCommand(Format('insert into glbatch ' +
                '(glbatchid_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                '%f, ' +
                'decode(sign( d.amount ) , -1, ' +
                '0, Abs(d.amount)), ' +
                'decode(sign(d.amount), -1, ' +
                'Abs(d.amount), 0), ' +
                '''VOID AMOUNT FOR CHECK# '' || ''%s'' ' +
                'from ' +
                'V_TOTAL_CHEQUE d ' +
                'where d.cheque_id = %f' ,
                [nGlBatchId_Id,
                QryHeader.FieldByName('GLACCT_ID_CASH').asFloat,
                IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
                QryHeader.FieldByName('ID').asFloat]));
}
end;

procedure TFrmCDView.InsertRevItems(nGLBatchId_Id:Real);
begin
  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'debit, ' +
            'credit, ' +
            'descrip) ' +
            'select ' +
            '%f, ' +
            'decode(NVL(d.apinvoice_id, 0), 0, D.GLACCT_ID_MISC_EXPENSE, a.glacct_id_ap), '+
            'decode(sign( d.amount_paid) , -1, Abs(d.amount_paid), 0), ' +
            'decode(sign(d.amount_paid), -1, 0, Abs(d.amount_paid)), ' +
            '''VOID REV. AMOUNT FOR CHECK# '' || ''%s'' ' +
            'from ' +
            'cheque_detail d, ' +
            'apinvoice a ' +
            'where d.cheque_id = %f ' +
            'and d.apinvoice_id = a.id(+) ' +
            'and NVL(d.amount_paid, 0) <> 0',
            [nGlBatchId_Id,
             IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
             QryHeader.FieldByName('ID').asFloat]);
end;


procedure TFrmCDView.InsertFXItems(nGLBatchId_Id:Real);
var
  Amount:Real;
begin
  Amount := SelectValueFmtAsFloat('select sum(NVL(debit, 0)) - sum(NVL(credit, 0)) from glbatch where glbatchid_id = %f', [nGLBatchId_Id]);
  if (Amount <> 0) and (QryHeaderGLACCT_ID_FX.asFloat <> 0) then
    ExecuteCommandFmt('insert into glbatch ' +
              '(glbatchid_id, ' +
              'glacct_id, ' +
              'debit, ' +
              'credit, ' +
              'descrip) ' +
              'values ( ' +
              '%f, ' +
              '%f, '+
              'decode(sign(%f) , -1, Abs(%f), 0), ' +
              'decode(sign(%f), -1, 0, Abs(%f)), ' +
              '''VOID FX AMOUNT FOR CHECK# '' || ''%s'')',
              [nGlBatchId_Id,
               QryHeaderGLACCT_ID_FX.asFloat,
               Amount,
               Amount,
               Amount,
               Amount,
               IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat))]);
end;

procedure TFrmCDView.InsertDiscounts(nGLBatchId_Id:Real);
begin
  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                'a.glacct_id_ap, ' +
                'decode(sign(d.ap_discount_taken), -1, ' +
                'Abs(d.ap_discount_taken), 0), ' +
                'decode(sign( d.ap_discount_taken) , -1, ' +
                '0, Abs(d.ap_discount_taken)), ' +
                '''VOID DISCOUNT FOR CHECK# '' || ''%s'' ' +
                'from ' +
                'cheque_detail d, ' +
                'apinvoice a ' +
                'where d.cheque_id = %f ' +
                'and d.apinvoice_id = a.id ' +
                'and NVL(a.glacct_id_ap, 0) <> 0 ' +
                'and NVL(d.ap_discount_taken, 0) <> 0',
                [nGlBatchId_Id,
                IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
                QryHeader.FieldByName('ID').asFloat]));
end;

procedure TFrmCDView.InsertRevDiscounts(nGLBatchId_Id:Real);
begin
  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                'd.glacct_id_ap_disc, ' +
                'decode(sign(d.ap_discount_taken), -1, ' +
                '0, Abs(d.ap_discount_taken)), ' +
                'decode(sign( d.ap_discount_taken ) , -1, ' +
                'Abs(d.ap_discount_taken), 0), ' +
                '''VOID REV. DISCOUNT FOR CHECK# '' || ''%s'' ' +
                'from ' +
                'cheque_detail d, ' +
                'apinvoice a, ' +
                'cheque h ' +
                'where d.cheque_id = h.id ' +
                'and d.apinvoice_id = a.id(+) ' +
                'and h.id = %f ' +
                'and NVL(d.ap_discount_taken, 0) <> 0',
                [nGlBatchId_Id,
                IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
                QryHeader.FieldByName('ID').asFloat]));

  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'glacct_id, ' +
                'credit, ' +
                'debit, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                'IQ_CD_POST.GetDebitFXAccount(d.glacct_id_ap_disc), ' +
                'decode(sign(d.ap_discount_taken - d.ap_discount_taken * NVL(NVL(NVL(a.fx_revalue_rate, a.fx_rate), h.exchange_rate), 1)), -1, ' +
                '0, Abs(d.ap_discount_taken - d.ap_discount_taken * NVL(NVL(NVL(a.fx_revalue_rate, a.fx_rate), h.exchange_rate), 1))), ' +
                'decode(sign( d.ap_discount_taken - d.ap_discount_taken * NVL(NVL(NVL(a.fx_revalue_rate, a.fx_rate), h.exchange_rate), 1) ) , -1, ' +
                'Abs(d.ap_discount_taken - d.ap_discount_taken * NVL(NVL(NVL(a.fx_revalue_rate, a.fx_rate), h.exchange_rate), 1)), 0), ' +
                '''VOID REV. DISCOUNT FOR CHECK# FX '' || ''%s'' ' +
                'from ' +
                'cheque_detail d, ' +
                'apinvoice a, ' +
                'cheque h ' +
                'where d.cheque_id = h.id ' +
                'and d.apinvoice_id = a.id(+) ' +
                'and h.id = %f ' +
                'and NVL(d.ap_discount_taken, 0) <> 0',
                [nGlBatchId_Id,
                IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat)),
                QryHeader.FieldByName('ID').asFloat]));



end;

procedure TFrmCDView.InsertFXDiscounts(nGLBatchId_Id:Real);
var
  Amount:Real;
begin
  Amount := SelectValueFmtAsFloat('select sum(NVL(debit, 0)) - sum(NVL(credit, 0)) from glbatch where glbatchid_id = %f', [nGLBatchId_Id]);
  if (Amount <> 0) and (QryHeaderGLACCT_ID_FX.asFloat <> 0) then
    ExecuteCommandFmt('insert into glbatch ' +
              '(glbatchid_id, ' +
              'glacct_id, ' +
              'debit, ' +
              'credit, ' +
              'descrip) ' +
              'values ( ' +
              '%f, ' +
              '%f, '+
              'decode(sign( %f) , -1, Abs(%f), 0), ' +
              'decode(sign(%f), -1, 0, Abs(%f)), ' +
              '''VOID FX DISC AMOUNT FOR CHECK# '' || ''%s'')',
              [nGlBatchId_Id,
               QryHeaderGLACCT_ID_FX.asFloat,
               Amount,
               Amount,
               Amount,
               Amount,
               IntToStr(Trunc(QryHeader.FieldByName('CHECK_NO').asFloat))]);
end;


procedure TFrmCDView.SrcQryHeaderDataChange(Sender: TObject;
  Field: TField);
begin
  VoidCheck1.Enabled := (Copy(QryHeader.FieldByName('CHECK_STATUS').asString, 1, 4) <> 'VOID')  or (GridHeader.SelectedRows.count > 0)
end;

procedure TFrmCDView.JumptoAP1Click(Sender: TObject);
begin
  with QryDetail do
    if fieldByName('APINVOICE_ID').asFloat <> 0 then
      DoViewAPfromCD(self, fieldByName('APINVOICE_ID').asFloat);  {in APView.pas}
end;

procedure TFrmCDView.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCDView.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1041895 );
end;

procedure TFrmCDView.QryHeaderBeforeOpen(DataSet: TDataSet);
begin
  if SecurityManager.EPlant_ID <> 'NULL' then
    QryHeader.Sql.Add(IQFormat(' and p.eplant_id = %f ', [StrToFloat(SecurityManager.EPlant_ID)]));
end;

procedure TFrmCDView.QryHeaderAfterScroll(DataSet: TDataSet);
var
  AQry:TFDQuery;
  AVendorId:Real;
  Abankinfo_dtl_id:Real;
  A820Vendor, A820Bank:Boolean;
begin
//  edAmount.Text := Format('%m', [SelectValueFmtAsFloat('select amount from V_TOTAL_CHEQUE where cheque_id = %f', [QryHeaderID.asFloat])]);

  AVendorId := SelectValueFmtAsFloat('select vendor_id from cheque where id = %f', [QryHeaderID.asFloat]);
  A820Vendor := SelectValueFmtAsFloat('select count(p.id)                          ' +
                          '    from v_vendor a,                        ' +
                          '         edi_partners p,                    ' +
                          '         edi_partners_ts t                  ' +
                          '   where a.id = p.vendor_id                 ' +
                          '     and t.edi_partners_id = p.id           ' +
                          '     and t.in_out_bound= ''OUTBOUND''       ' +
                          '     and t.transaction_set_code = ''820''   ' +
                          '     and a.id = %f                          ' +
                          '     and exists (select id                  ' +
                          '                   from cheque              ' +
                          '                  where vendor_id = a.id    ' +
                          '                    and id = %f)', [AVendorId, QryHeaderID.asFloat]) <> 0;



  Abankinfo_dtl_id := SelectValueFmtAsFloat('select bankinfo_dtl_id from cheque where id = %f', [QryHeaderID.asFloat]);

  A820Bank := SelectValueFmtAsFloat('select count(p.id)                               ' +
                        '    from bankinfo a,                             ' +
                        '         edi_partners p,                         ' +
                        '         edi_partners_ts t                       ' +
                        '   where a.id = p.bankinfo_id                    ' +
                        '     and t.edi_partners_id = p.id                ' +
                        '     and t.in_out_bound = ''OUTBOUND''           ' +
                        '     and t.transaction_set_code = ''820''        ' +
                        '     and exists (select c.id                     ' +
                        '                   from cheque c,                ' +
                        '                        bankinfo_dtl d           ' +
                        '                  where d.bankinfo_id = a.id     ' +
                        '                   and c.id = %f                 ' +
                        '                   and c.bankinfo_dtl_id = %f    ' +
                        '                   and c.bankinfo_dtl_id = d.id)', [QryHeaderID.asFloat, Abankinfo_dtl_id]) <> 0;






  CreateEDIFile8201.Enabled := A820Bank or A820Vendor;





  Memo1.Lines.Clear;
  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    Connection := uNIMainModule.FDConnection1;
    Sql.Add(IqFormat('select * from cheque where id =%f', [QryHeaderID.asFloat]));
    Open;
    if not eof and bof then
    begin
      if FieldByName('check_type').AsString = 'QUICK' then
      begin
        if Trim(FieldByName('misc_payto').asString) <> '' then
          Memo1.Lines.Add(FieldByName('misc_payto').asString);
        if Trim(FieldByName('misc_addr1').asString) <> '' then
          Memo1.Lines.Add(FieldByName('misc_addr1').asString);
        if Trim(FieldByName('misc_addr2').asString) <> '' then
          Memo1.Lines.Add(FieldByName('misc_addr2').asString);
        if Trim(Trim(FieldByName('misc_city').asString) + ' ' + Trim(FieldByName('misc_state').asString)) <> '' then
          Memo1.Lines.Add(Trim(Trim(FieldByName('misc_city').asString) + ' ' + Trim(FieldByName('misc_state').asString)));
        if Trim(FieldByName('misc_zip').asString) <> '' then
          Memo1.Lines.Add(FieldByName('misc_zip').asString);
      end
      else
      begin
        if Trim(FieldByName('remit_to_attn').asString) <> '' then
          Memo1.Lines.Add(FieldByName('remit_to_attn').asString);
        if Trim(FieldByName('remit_to_addr1').asString) <> '' then
          Memo1.Lines.Add(FieldByName('remit_to_addr1').asString);
        if Trim(FieldByName('remit_to_addr2').asString) <> '' then
          Memo1.Lines.Add(FieldByName('remit_to_addr2').asString);
        if Trim(FieldByName('remit_to_addr3').asString) <> '' then
          Memo1.Lines.Add(FieldByName('remit_to_addr3').asString);
        if Trim(Trim(FieldByName('remit_to_city').asString) + ' ' + Trim(FieldByName('remit_to_state').asString)) <> '' then
          Memo1.Lines.Add(Trim(Trim(FieldByName('remit_to_city').asString) + ' ' + Trim(FieldByName('remit_to_state').asString)));
        if Trim(Trim(FieldByName('remit_to_zip').asString) + ' ' + Trim(FieldByName('remit_to_country').asString)) <> '' then
          Memo1.Lines.Add(Trim(Trim(FieldByName('remit_to_zip').asString) + ' ' + Trim(FieldByName('remit_to_country').asString)));

{
        if Trim(FieldByName('vendor_company').asString) <> '' then
          Memo1.Lines.Add(FieldByName('vendor_company').asString);
        if Trim(FieldByName('vendor_attn').asString) <> '' then
          Memo1.Lines.Add(FieldByName('vendor_attn').asString);
        if Trim(FieldByName('vendor_addr1').asString) <> '' then
          Memo1.Lines.Add(FieldByName('vendor_addr1').asString);
        if Trim(FieldByName('vendor_addr2').asString) <> '' then
          Memo1.Lines.Add(FieldByName('vendor_addr2').asString);
        if Trim(FieldByName('vendor_addr3').asString) <> '' then
          Memo1.Lines.Add(FieldByName('vendor_addr3').asString);
        if Trim(Trim(FieldByName('vendor_city').asString) + ' ' + Trim(FieldByName('vendor_state').asString)) <> '' then
          Memo1.Lines.Add(Trim(Trim(FieldByName('vendor_city').asString) + ' ' + Trim(FieldByName('vendor_state').asString)));
        if Trim(Trim(FieldByName('vendor_zip').asString) + ' ' + Trim(FieldByName('vendor_country').asString)) <> '' then
          Memo1.Lines.Add(Trim(Trim(FieldByName('vendor_zip').asString) + ' ' + Trim(FieldByName('vendor_country').asString)));
}
      end;
    end;
  finally
    free;
  end;
end;

procedure TFrmCDView.PkCDCustomersBeforeOpen(DataSet: TDataSet);
begin
//  IQAssignEPlantFilter( DataSet );  {pas}
//  DataSet.Filtered := True;


end;


procedure TFrmCDView.QryHeaderCalcFields(DataSet: TDataSet);
begin
  QryHeaderAMOUNT.asFloat := SelectValueFmtAsFloat('select amount from V_TOTAL_CHEQUE where cheque_id = %f', [QryHeaderID.asFloat]);
  if QryHeaderCHECK_NO.asFloat = 0 then
    QryHeaderEFT.asString := 'Y'
  else
    QryHeaderEFT.asString := 'N';
end;

procedure TFrmCDView.DBcommentDblClick(Sender: TObject);
var
  AId:Real;
begin
  wwMemoDialog10.Lines.Clear;
  wwMemoDialog10.Lines.Add(QryHeaderCOMMENT1.asString);
  if wwMemoDialog10.Execute then
  begin
    AId := QryHeaderID.asFloat;
    ExecuteCommandFmt('update cheque set comment1 = ''%s'' where id = %f', [StrTran(wwMemoDialog10.Lines.Text, '''', ''''''), QryHeaderID.asFloat]);
    QryHeader.Close;
    QryHeader.Open;
    QryHeader.Locate('ID', AId, []);
  end;
end;

procedure TFrmCDView.FormCreate(Sender: TObject);
begin
  CheckVistaAdjustSize( [DBEdit2, DBEdit3]);
  DM:= TCD_DM.Create(self);
  inherited;
  DM.Name:= '';
  SetPKEPlantFilter;
  IQRegFormRead( self, [ self, GridDetail, Panel4 ]);
  IQSetTablesActiveEx( TRUE, self, cd_rscstr.cTXT0000076 {'Accessing Cash Disbursements.  Please wait.'} );

end;

procedure TFrmCDView.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin

  with HintInfo do
  begin
    if HintControl = DBPeriod then
      with QryHeader do
        HintStr := Format(cd_rscstr.cTXT0000046, // 'From: %s'#13'To: %s'
        [DateToStr(FieldByName('Start_Date').asDateTime),
        DateToStr(FieldByName('End_Date').asDateTime)]);

  end;

//  if Assigned(QryHeader) and (QryHeader <> nil) and Assigned(DBPeriod) and (DBPeriod <> nil) then
//  with QryHeader do
//    DBPeriod.Hint := Format(cd_rscstr.cTXT0000046, // 'From: %s'#13'To: %s'
//     [DateToStr(FieldByName('Start_Date').asDateTime),
//      DateToStr(FieldByName('End_Date').asDateTime)]);
end;


procedure TFrmCDView.CreateEDIFile8201Click(Sender: TObject);
var
  AVendorId:Real;
  Abankinfo_dtl_id:Real;
  AEdiPartnersTsId:Real;
  AEdiPartnersId:Real;
  A820Vendor, A820Bank:Boolean;
  ATransactionSetId:String;
begin
  AVendorId := SelectValueFmtAsFloat('select vendor_id from cheque where id = %f', [QryHeaderID.asFloat]);
  AEdiPartnersTsId := SelectValueFmtAsFloat('select t.id                           ' +
                          '    from v_vendor a,                        ' +
                          '         edi_partners p,                    ' +
                          '         edi_partners_ts t                  ' +
                          '   where a.id = p.vendor_id                 ' +
                          '     and t.edi_partners_id = p.id           ' +
                          '     and t.in_out_bound= ''OUTBOUND''       ' +
                          '     and t.transaction_set_code = ''820''   ' +
                          '     and a.id = %f                          ' +
                          '     and exists (select id                  ' +
                          '                   from cheque              ' +
                          '                  where vendor_id = a.id    ' +
                          '                    and id = %f)', [AVendorId, QryHeaderID.asFloat]);

  if AEdiPartnersTsId <> 0 then
  begin
    AEdiPartnersId := SelectValueFmtAsFloat('select edi_partners_id from edi_partners_ts where id = %f', [AEdiPartnersTsId]);
    ATransactionSetId := SelectValueFmtAsString('select transaction_set_unique_id from edi_partners_ts where id = %f', [AEdiPartnersTsId]);
    ExecuteCommand('begin edi_820_outbound.arr_clear; end;');
    ExecuteCommandFmt('begin edi_820_outbound.arr_add(%f); end;', [QryHeaderID.asFloat]);
    { TODO -ombaral -cWEBIQ : Resolve dependency
    Do820EdiTransaction(self, AEdiPartnersId, ATransactionSetId);
    }
    ExecuteCommand('begin edi_820_outbound.arr_clear; end;');
  end;


  Abankinfo_dtl_id := SelectValueFmtAsFloat('select bankinfo_dtl_id from cheque where id = %f', [QryHeaderID.asFloat]);

  AEdiPartnersTsId := SelectValueFmtAsFloat('select t.id                               ' +
                        '    from bankinfo a,                             ' +
                        '         edi_partners p,                         ' +
                        '         edi_partners_ts t                       ' +
                        '   where a.id = p.bankinfo_id                    ' +
                        '     and t.edi_partners_id = p.id                ' +
                        '     and t.in_out_bound = ''OUTBOUND''           ' +
                        '     and t.transaction_set_code = ''820''        ' +
                        '     and exists (select c.id                     ' +
                        '                   from cheque c,                ' +
                        '                        bankinfo_dtl d           ' +
                        '                  where d.bankinfo_id = a.id     ' +
                        '                   and c.id = %f                 ' +
                        '                   and c.bankinfo_dtl_id = %f    ' +
                        '                   and c.bankinfo_dtl_id = d.id)', [QryHeaderID.asFloat, Abankinfo_dtl_id]);


  if AEdiPartnersTsId <> 0 then
  begin
    AEdiPartnersId := SelectValueFmtAsFloat('select edi_partners_id from edi_partners_ts where id = %f', [AEdiPartnersTsId]);
    ATransactionSetId := SelectValueFmtAsString('select transaction_set_unique_id from edi_partners_ts where id = %f', [AEdiPartnersTsId]);
    ExecuteCommand('begin edi_820_outbound.arr_clear; end;');
    ExecuteCommandFmt('begin edi_820_outbound.arr_add(%f); end;', [QryHeaderID.asFloat]);
    { TODO -ombaral -cWEBIQ : Resolve dependency
    Do820EdiTransaction(self, AEdiPartnersId, ATransactionSetId);
    }
    ExecuteCommand('begin edi_820_outbound.arr_clear; end;');
  end;

end;

end.
