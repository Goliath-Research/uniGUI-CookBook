unit ApVoid;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Ivoid,
  Mask,
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
  Data.DB,
  FireDAC.Comp.DataSet, uniCheckBox, uniMemo, uniEdit, uniGUIClasses,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniSplitter, uniButton,
  uniGUIBaseClasses, uniPanel;

type
  TFrmVoidApInvoice = class(TFrmVoidArInvoice)
    QryInsApinvoiceVoid: TFDQuery;
    QryInsApinvoiceVoidDetail: TFDQuery;
    procedure BtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
//    fId:Real;
//    fPeriodId:Real;
//    fDate:TDateTime;
//    fMaxTaxId:Real;
//    GLPeriodHint:TNotifyEvent;
//    fInvoiceVoidId:Real;
    FVendorCompany, FVendorno:String;
    procedure InsertGlbatchId(nGLBatchId_Id:Real);
    procedure InsertGlbatch(nGLBatchId_Id:Real);
    procedure InsertApInvoice(nGlBatchId_Id:Real);
    procedure InsertApInvoiceDetail(nGLBatchId_Id:Real);
    procedure DeleteApInvoiceRecord;
    procedure LockTable;
    procedure PrintAfterPostReport(nGLBatchId_Id:Real);
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
  public
    { Public declarations }
  end;

function DoVoidApInvoice(AId, APeriodId:Real):Boolean;

implementation

{$R *.DFM}

uses
  ap_rscstr,
  APConfComm,
  Avalara,
  IQMS.Common.AccountingShare,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Print,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  uniGUIApplication;

function DoVoidApInvoice(AId, APeriodId:Real):Boolean;
begin
  with TFrmVoidApInvoice.Create( uniGUIApplication.UniApplication ) do
  begin
    Id := AId;
    PeriodId := APeriodId;
    Result := False;
    ShowModal;
    Result := (ModalResult = mrOk);
  end;
end;

procedure TFrmVoidApInvoice.FormActivate(Sender: TObject);
begin
//
end;

procedure TFrmVoidApInvoice.FormCreate(Sender: TObject);
begin
  inherited;

  LblReconstruct.Visible := false;
  CbReconstruct.Visible := false;
end;

procedure TFrmVoidApInvoice.BtnOkClick(Sender: TObject);
var
  DBase:TFDCustomConnection;
  nGLBatchId_Id:Real;
  lNotPrior:Boolean;
  AConfirm:Integer;
  ACount:Real;
begin
  if Empty(EditVoidBy.Text) then
     // 'Please enter a name for Voided By.'
     raise Exception.Create(ap_rscstr.cTXT0000083);
  CheckForOpenPeriod('ap_status', TblGLPeriods.FieldByName('ID').asFloat);  {in IqAcct.pas}

  if SelectValueAsFloat(IQFormat('select apinvoice_id from CDPREPOST_DETAIL ' +
                         'where apinvoice_id = %f', [fId])) <> 0 then
    {'An entry for this invoice was found in the Cash Disbursements prepost table.'#13#13 +
      'In order to void the invoice, this entry (or entries) must first be deleted.'}
    raise exception.create(ap_rscstr.cTXT0000084);

  fDate := StrToDate(EditDate.Text);
  {'You are about to void an invoice.'#13#13 +
   'This change is irreversible.  Do you want to continue?'}
  if not IqConfirmYN(ap_rscstr.cTXT0000085) then Exit;
//  if SelectValueAsFloat(IQFormat('select apinvoice_id from CDPREPOST_DETAIL ' +
//                         'where apinvoice_id = %f', [fId])) <> 0 then
//  begin
//    if not IqConfirmYN('Entry for this invoice is found in the CD PrePost Table.' + #13 +
//                        'In order to void the invoice this entry (or entries) must be deleted.' + #13 +
//                        'Do you wish to continue and delete those entries or quit the voiding?')
//      then Exit;
//  end;
  try
    lNotPrior := (SelectValueAsString(IQFormat('select prior_entry from apinvoice where id = %f', [fId])) = 'N');
    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    nGLBatchId_Id  := GetNextID('GLBATCHID');
    fInvoiceVoidId   := GetNextID('APINVOICE_VOID');
    FVendorCompany := SelectValueFmtAsString('select vendor_company from apinvoice where id = %f', [fId]);
    FVendorno      := SelectValueFmtAsString('select vendorno from apinvoice where id = %f', [fId]);

    if lNotPrior then InsertGlbatchId(nGLBatchId_Id);
    if lNotPrior then InsertGlbatch(nGLBatchId_Id);
    InsertApInvoice(nGLBatchId_Id);
    InsertApInvoiceDetail(nGLBatchId_Id);

    ACount := SelectValueFmtAsFloat('select count(id) from apinvoice_detail where apinvoice_id = %f and arinvoice_comm_id is not null', [FId]);
    if ACount <> 0 then
    begin
      { TODO -oathite -cWebConvert : type mismatch
      AConfirm := IQDialogChkEx( TFrmApConfComissions, ap_rscstr.cTXT0000104, 'AP_ConfirmReopenComissions' );
      if AConfirm = 1 then
        ExecuteCommandFmt('update arinvoice_comm set closed = ''N'' ' +
                  ' where id in (select arinvoice_comm_id from apinvoice_detail where apinvoice_id = %f)', [FId]);   }
    end;


    LockTable;
    if SelectValueFmtAsFloat('select apinvoice_id from cheque_detail d, cheque c where d.apinvoice_id = %f ' +
                 'and d.cheque_id = c.id and SubStr(NVL(c.check_status, ''    ''), 1, 4) <> ''VOID''', [fId]) <> 0
      then
      { 'Cannot void.  This invoice has already been posted to the Cash
        Disbursements AfterPost table.' }
      raise Exception.Create(ap_rscstr.cTXT0000087);
    DeleteApInvoiceRecord;
    DBase.Commit;

    //'Invoice voided. Do you want to print the AfterPost report?'
    if IQConfirmYN(ap_rscstr.cTXT0000086) then
       PrintAfterPostReport(nGLBatchId_Id);

  finally
    Screen.Cursor := crDefault;
    if DBase.InTransaction then
    begin
      DBase.RollBack;
//      raise Exception.Create('Invoice was not voided');
    end;
  end;
  ModalResult := mrOk;
end;

procedure TFrmVoidApInvoice.PrintAfterPostReport(nGLBatchId_Id:Real);
var
  SelectionList:TStringList;
begin
  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList, IQFormat('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
    PrintDefaultReport( self, 'ap_afterpost_report', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmVoidApInvoice.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;


procedure TFrmVoidApInvoice.LockTable;
begin
  try
    ExecuteCommand('lock table cheque_detail in exclusive mode nowait');
  except
    {'Cannot acquire lock on the Cash Disbursements AfterPost table. ' +
     'It may be locked by another user.'#13#13 +
     'Please try again later.'}
    raise Exception.Create(ap_rscstr.cTXT0000088);
  end;
end;

procedure TFrmVoidApInvoice.DeleteApInvoiceRecord;
var
 AEplantId, APrepostId: Real;
begin
  AEplantId := SelectValueFmtAsFloat('select eplant_id from apinvoice where id = %f', [fId]);
  if AvalaraEnabled(AEplantId) then
    with TAvalaraGetTax.Create(self) do
      try
        VoidTax('APINVOICE', fId);
      finally
        Free;
      end;

  ExecuteCommand(IQFormat('Delete APINVOICE where id = %f', [fId]));
end;

procedure TFrmVoidApInvoice.InsertGlbatchId(nGLBatchId_Id:Real);
var
  nBatchnumber:Real;
begin
  nBatchNumber   := GetNextSequenceNumber('S_AP_INVOICE');
  ExecuteCommand(IQFormat('insert into glbatchid ' +
                '(id, ' +
                'batchnumber, ' +
                'source, ' +
                'tablename, ' +
                'glperiods_id, ' +
                'userid, ' +
                'system_date, ' +
                'batch_date) ' +
                'values ' +
                '(%f, ' +
                '%f, ' +
                '''AP'', ' +
                '''APINVOICE_DETAIL_VOID'', ' +
                '%f, ' +
                '''%s'', ' +
                'To_Date(''%s'', ''MM/DD/RRRR''), ' +
                'To_Date(''%s'', ''MM/DD/RRRR''))',
                [nGlBatchId_Id,
                 nBatchNumber,
                 TblGLPeriods.FieldByName('ID').asFloat,
                 SecurityManager.UserName,
                 FormatDateTime('mm/dd/yyyy', Date),
                 FormatDateTime('mm/dd/yyyy', fDate)]));
end;

procedure TFrmVoidApInvoice.InsertGlbatch(nGLBatchId_Id:Real);
begin
  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'header_id, ' +
                'glacct_id, ' +
                'credit, ' +
                'debit, ' +
                'descrip, ' +
                'ref_code_id, ' +
                'reference, ' +
                'ref_code_descrip, ' +
                'ref_code_category, ' +
                'ref_code, ' +
                'detail_id, ' +
                'REPCUR_DEBIT, ' +
                'REPCUR_CREDIT, ' +
                'SPOT_RATE, ' +
                'NATIVE_CURR, ' +
                'REPORT_CURR, ' +
                'NUM_OF_SUPP_DOCS) ' +
                'select ' +
                '%f, ' +
                '%f, ' +
                'd.glacct_id, ' +
                'd.debit, ' +
                'd.credit, ' +
                'd.descrip || '' VOID'', ' +
                'd.ref_code_id, ' +
                'd.reference, ' +
                'd.ref_code_descrip, ' +
                'd.ref_code_category, ' +
                'd.ref_code, ' +
                'd.detail_id, ' +
                'd.REPCUR_CREDIT, ' +
                'd.REPCUR_DEBIT, ' +
                'd.SPOT_RATE, ' +
                'd.NATIVE_CURR, ' +
                'd.REPORT_CURR, ' +
                'd.NUM_OF_SUPP_DOCS ' +
                'from ' +
                'glbatch d, glbatchid i ' +
                'where d.header_id = %f ' +
                'and d.glbatchid_id = i.id ' +
                'and instr(Replace(Replace(d.descrip, ''%s'', ''****''), ''%s'', ''****''), ''VOID'') = 0 ' +
                'and i.source = ''AP''',
                [nGlBatchId_Id,
                 fInvoiceVoidId,
                 fId,
                 StrTran(FVendorCompany, '''', ''''''),
                 StrTran(FVendorno, '''', '''''')]));
end;


procedure TFrmVoidApInvoice.InsertApInvoice(nGlBatchId_Id:Real);
var
  cReason:String;
begin
  cReason := MemoReason.Text;
  cReason := StrTran(cReason, #13, ' ');
  cReason := StrTran(cReason, #10, ' ');
  cReason := StrTran(cReason, '''', '''''');

  with QryInsApInvoiceVoid do
  begin
    Close;
//    ParamByName('cReason').Value := cReason;
//    ParamByName('cVoidBy').Value := EditVoidBy.Text;
//    ParamByName('dDate').Value := fDate;
//    ParamByName('nApInvoiceId').Value := fId;
//    ParamByName('nApInvoiceVoidId').Value := fInvoiceVoidId;
//    ParamByName('nGlBatchId_Id').Value := nGlBatchId_Id;
//    ParamByName('nGlPeriodsId').Value := TblGLPeriods.FieldByName('ID').asFloat;

    AssignQueryParamValue(QryInsApInvoiceVoid, 'cReason'         , cReason);
    AssignQueryParamValue(QryInsApInvoiceVoid, 'cVoidBy'         , EditVoidBy.Text);
    AssignQueryParamValue(QryInsApInvoiceVoid, 'dDate'           , fDate);
    AssignQueryParamValue(QryInsApInvoiceVoid, 'nApInvoiceId'    , fId);
    AssignQueryParamValue(QryInsApInvoiceVoid, 'nApInvoiceVoidId', fInvoiceVoidId);
    AssignQueryParamValue(QryInsApInvoiceVoid, 'nGlBatchId_Id'   , nGlBatchId_Id);
    AssignQueryParamValue(QryInsApInvoiceVoid, 'nGlPeriodsId'    , TblGLPeriods.FieldByName('ID').asFloat);

//    Prepare;
    ExecSql;
  end;

  ExecuteCommandFmt('update email_correspondence set source = ''AP_VOID'', source_id = %f where source = ''AP_POST'' and source_id = %f', [fInvoiceVoidId, fId]);

  ExecuteCommandFmt('insert into apinvoice_void_docs (apinvoice_void_id, iq_docs_id, docseq, type) ' +
          ' select %f, iq_docs_id, docseq, type from apinvoice_docs where apinvoice_id = %f', [fInvoiceVoidId, fId]);

  ExecuteCommandFmt('update doc_used set source = ''APINVOICE_VOID'', source_id = %f where source = ''APINVOICE'' and source_id = %f',
             [fInvoiceVoidId, fId]);

end;

procedure TFrmVoidApInvoice.InsertApInvoiceDetail(nGlBatchId_Id:Real);
begin
  ExecuteCommandFmt('begin ap.InsertApInvoiceVoidDetail(%f, %f, %f); end;',
            [fId,
             fInvoiceVoidId,
             nGlBatchId_Id]);

//  with QryInsApInvoiceVoidDetail do
//  begin
//    Close;
//    ParamByName('nApInvoiceId').Value := fId;
//    ParamByName('nApInvoiceVoidId').Value := fInvoiceVoidId;
//    ExecSql;
//  end;
end;

end.
