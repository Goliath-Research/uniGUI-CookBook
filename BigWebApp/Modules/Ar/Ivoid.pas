unit IVoid;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmVoidArInvoice = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    SrcGlPeriods: TDataSource;
    TblGlPeriods: TFDTable;
    TblGlPeriodsID: TBCDField;
    TblGlPeriodsGLYEAR_ID: TBCDField;
    TblGlPeriodsPERIOD: TBCDField;
    TblGlPeriodsSTART_DATE: TDateTimeField;
    TblGlPeriodsEND_DATE: TDateTimeField;
    TblGlPeriodsSTATUS: TStringField;
    QryInsArinvoiceVoid: TFDQuery;
    QryInsArinvoiceDetailVoid: TFDQuery;
    PnlCarrier: TUniPanel;
    PnlLeft: TUniPanel;
    PnlClient: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label9: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    EditDate: TUniDBDateTimePicker;
    DBEditPeriod: TUniEdit;
    EditVoidBy: TUniEdit;
    MemoReason: TUniMemo;
    LblReconstruct: TUniLabel;
    cbReconstruct: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure DoFindPeriodClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  protected
    fId:Real;
    fPeriodId:Real;
    fDate:TDateTime;
    fMaxTaxId:Real;
    fInvoiceVoidId:Real;
  private
    { Private declarations }
//    GLPeriodHint:TNotifyEvent;
    FCustomerCompany, FCustno:String;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;
                            var HintInfo: THintInfo );


//    procedure DisplayHint(Sender: TObject);
    procedure InsertGlbatchId(nGLBatchId_Id:Real);
    procedure InsertGlbatch(nGLBatchId_Id:Real);
    procedure InsertArInvoice(nGlBatchId_Id:Real);
    procedure InsertArInvoiceDetail(nGlBatchId_Id:Real);
    procedure DeleteArInvoiceRecord;
    procedure LockTable;
    procedure PrintAfterPostReport(nGLBatchId_Id:Real);
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
    procedure InsertGlbatchCreditMemo(nGLBatchId_Id, AId, AVoidId:Real);
    procedure InsertArInvoiceCreditMemo(nGlBatchId_Id, AId, AVoidId:Real);
    procedure InsertArInvoiceDetailCreditMemo(AId, AVoidId:Real);
    procedure RecreateAR;
    procedure UpdateCreditMemo(arinvoice_id:Real);
    procedure SetId(const Value: Real);
    procedure SetPeriodId(const Value: Real);
  public
    { Public declarations }
    property Id: Real read FId write SetId;
    property PeriodId: Real read FPeriodId write SetPeriodId;
  end;

function DoVoidArInvoice(Id, PeriodId:Real):Boolean;


implementation
{$R *.DFM}
uses
  Ar_rscstr,
  Avalara,
  IQMS.Common.Period,
  IQMS.Common.AccountingShare,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  wwSystem;

function DoVoidArInvoice(Id, PeriodId:Real):Boolean;
var
  LFrmVoidArInvoice : TFrmVoidArInvoice;
begin
  LFrmVoidArInvoice := TFrmVoidArInvoice.Create(uniGUIApplication.UniApplication);
  LFrmVoidArInvoice.Id := Id;
  LFrmVoidArInvoice.PeriodId := PeriodId;
  Result := False;
  LFrmVoidArInvoice.ShowModal;
  Result := (LFrmVoidArInvoice.ModalResult = mrOk);
end;

procedure TFrmVoidArInvoice.FormCreate(Sender: TObject);
begin
  IQSetTablesActiveEx( TRUE, self, '');
  IQRegFormRead( self, [ self ]);
  EditDate.DateTime := Date;
  EditDate.Text := DateToStr(Date);
  TblGLPeriods.FindKey([fPeriodId]);
  EditVoidBy.Text := SecurityManager.UserName;
//  GLPeriodHint := Application.OnHint;
//  Application.OnHint := DisplayHint;
  IQRegFormRead( self, [ self, PnlLeft ]);
end;

procedure TFrmVoidArInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.OnShowHint:= NIL;
//  Application.OnHint := GLPeriodHint;
  IQRegFormWrite( self, [ self, PnlLeft ]);
end;

procedure TFrmVoidArInvoice.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVoidArInvoice.DoFindPeriodClick(Sender: TObject);
var
  Id:Real;
begin
  Id := DoFindPeriod;
  if Id <> 0 then TblGLPeriods.FindKey([Id]);
end;

//procedure TFrmVoidArInvoice.DisplayHint(Sender: TObject);
//begin
//  with TblGLPeriods do
//  DBEditPeriod.Hint := Format('Start Date: %s End Date: %s',
//                       [FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
//                        FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
//end;

procedure TFrmVoidArInvoice.BtnOkClick(Sender: TObject);
var
  DBase:TFDCustomConnection;
  nGLBatchId_Id, nArInvoiceId:Real;
  lNotPrior:Boolean;
  lNotCreditMemo:Boolean;
  AVoidId:Real;
  AQry:TFDQuery;
  AGJNotCreated:boolean;
begin
  if Empty(EditVoidBy.Text) then raise Exception.Create('''Void By'' must be filled');
  CheckForOpenPeriod('ar_status', TblGLPeriods.FieldByName('ID').asFloat);  {in IqAcct.pas}
  fDate := wwStrToDateVal(EditDate.Text);
//  fDate := StrToDate(EditDate.Text);
  {'You are about to VOID an Invoice.' +
   'This change is irreversible.' + #13 +
   'Do you wish to continue?'}
  if not IqConfirmYN(ar_rscstr.cTXT0000078) then Exit;
  if SelectValueAsFloat(IQFormat('select arinvoice_id from CRPREPOST_DETAIL ' +
                         'where arinvoice_id = %f', [fId])) <> 0 then
  begin
    {'Entry for this invoice is found in the Cash Receipts PrePost Table.' + #13 +
     'In order to void the invoice this entry (or entries) must be deleted.' + #13 +
     'Do you wish to continue and delete those entries or quit the voiding?'}
    if not IqConfirmYN(ar_rscstr.cTXT0000079)
      then Exit;
  end;
  try
    lNotPrior := (SelectValueFmtAsString('select prior_entry from arinvoice where id = %f', [fId]) = 'N');
    lNotCreditMemo := (SelectValueFmtAsFloat('select cashrec_id from arinvoice where id = %f', [fId]) = 0);
    FCustomerCompany := SelectValueFmtAsString('select arcusto_company from arinvoice where id = %f', [fId]);
    FCustno          := SelectValueFmtAsString('select arcusto_custno from arinvoice where id = %f', [fId]);

    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    nGLBatchId_Id  := GetNextID('GLBATCHID');
    fInvoiceVoidId   := GetNextID('ARINVOICE_VOID');
    if lNotPrior and lNotCreditMemo then InsertGlbatchId(nGLBatchId_Id);
    if lNotPrior and lNotCreditMemo then InsertGlbatch(nGLBatchId_Id);


    AGJNotCreated := false;

    AGJNotCreated := (SelectValueFmtAsFloat('select count(h.id)                              ' +
                               '   from h_proc_cost_lot_sum h,                   ' +
                               '        arinvoice_detail d                       ' +
                               '  where h.arinvoice_detail_id = d.id             ' +
                               '    and d.arinvoice_id = %f                      ' +
                               '    and NVL(d.ACTUAL_COST_POSTED, ''N'') = ''Y'' ', [fId]) = 0)
                      and
                     (SelectValueFmtAsFloat('select count(d.id)                              ' +
                               '   from arinvoice_detail d                       ' +
                               '  where d.arinvoice_id = %f                      ' +
                               '    and NVL(d.ACTUAL_COST_POSTED, ''N'') = ''Y'' ', [fId]) <> 0);



    ExecuteCommandFmt('begin glprepost_misc.VoidAR(%f, %f); end;', [fId, TblGLPeriods.FieldByName('ID').asFloat]);
    ExecuteCommandFmt('delete from arprepost where arinvoice_id = %f', [fId]);

    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(IQFormat('select id from arinvoice where arinvoice_id = %f', [fId]));
      Open;
      while not eof do
      begin
        AVoidId := GetNextID('ARINVOICE_VOID');
        InsertGlbatchCreditMemo(nGLBatchId_Id, FieldByname('ID').asFloat, AVoidId);
        InsertArInvoiceCreditMemo(nGlBatchId_Id, FieldByname('ID').asFloat, AVoidId);
        InsertArInvoiceDetailCreditMemo(FieldByname('ID').asFloat, AVoidId);
        Next;
      end;
    finally
      Free;
    end;
//    ExecuteCommandFmt('update shipments set FREIGHT_AUTODED_APPLIED = ''N'' where id = (select SHIPMENTS_AUTODED_ID from arinvoice where id = %f)', [fId]);
    UpdateCreditMemo(fId);
    ExecuteCommandFmt('delete from ARINVOICE_DETAIL where arinvoice_id in (select id from arinvoice where arinvoice_id = %f)', [fId]);
    ExecuteCommandFmt('delete from arinvoice where arinvoice_id = %f', [fId]);
    InsertArInvoice(nGLBatchId_Id);
    InsertArInvoiceDetail(nGLBatchId_Id);
    LockTable;
    if SelectValueAsFloat(IQFormat('select arinvoice_id from cashrec_detail where arinvoice_id = %f', [fId])) <> 0 then
      // 'Record for the invoice was posted to the Cash receipts AfterPost table.  Cannot void.'
      raise Exception.Create(ar_rscstr.cTXT0000080);
    if cbReconstruct.Checked then
      RecreateAR;

    // 10/26/2015 (Byron, EIQ-9217) Clear reference to invoice from
    // credit card transactions.
    ExecuteCommandFmt(
     'UPDATE credit_card_trans            '#13 +
     '   SET invoice_no = NULL,           '#13 +
     '       arinvoice_id = NULL,         '#13 +
     '       cashrec_detail_id = NULL,    '#13 +
     '       crprepost_detail_id = NULL   '#13 +
     ' WHERE arinvoice_id = %.0f          ',
     [fId]);

    DeleteArInvoiceRecord;
    DBase.Commit;

    if AGJNotCreated then
      IqWarning('Actual cost of inventory journal could not be created. History information not found');

    // 'Invoice Voided. Print the AfterPost report?'
    if IqConfirmYN(ar_rscstr.cTXT0000081)
      then  PrintAfterPostReport(nGLBatchId_Id);

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

procedure TFrmVoidArInvoice.PrintAfterPostReport(nGLBatchId_Id:Real);
var
  SelectionList:TStringList;
begin
  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList, IQFormat('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
    PrintDefaultReport( self, 'ar_afterpost_report', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmVoidArInvoice.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;


procedure TFrmVoidArInvoice.SetId(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmVoidArInvoice.SetPeriodId(const Value: Real);
begin
  FPeriodId := Value;
end;

procedure TFrmVoidArInvoice.LockTable;
begin
  try
    ExecuteCommand('lock table cashrec_detail in exclusive mode nowait');
  except
    {'Cannot obtain lock on the AR AfterPost table.  ' +
     'It may be locked by another user.' + #13 +
     'Please try again later.'}
    raise Exception.Create(ar_rscstr.cTXT0000082);
  end;
end;


procedure TFrmVoidArInvoice.DeleteArInvoiceRecord;
var
 AEplantId, APrepostId: Real;
begin
  AEplantId := SelectValueFmtAsFloat('select eplant_id from arinvoice where id = %f', [fId]);
  if AvalaraEnabled(AEplantId) then
    with TAvalaraGetTax.Create(self) do
      try
        VoidTax('ARINVOICE', fId);
      finally
        Free;
      end;

  ExecuteCommand(IQFormat('Delete ARINVOICE_DETAIL where arinvoice_id = %f', [fId]));
  ExecuteCommand(IQFormat('Delete ARINVOICE where id = %f', [fId]));
end;


procedure TFrmVoidArInvoice.InsertGlbatchId(nGLBatchId_Id:Real);
var
  nBatchnumber:Real;
begin
  nBatchNumber   := GetNextSequenceNumber('S_AR_INVOICE');
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
                '''AR'', ' +
                '''ARINVOICE_DETAIL_VOID'', ' +
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

procedure TFrmVoidArInvoice.InsertGlbatch(nGLBatchId_Id:Real);
begin
  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'header_id, ' +
                'glacct_id, ' +
                'credit, ' +
                'debit, ' +
                'NUM_OF_SUPP_DOCS, ' +
                'detail_id, ' +
                'REPCUR_DEBIT, ' +
                'REPCUR_CREDIT, ' +
                'SPOT_RATE, ' +
                'NATIVE_CURR, ' +
                'REPORT_CURR, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                '%f, ' +
                'd.glacct_id, ' +
                'd.debit, ' +
                'd.credit, ' +
                'd.NUM_OF_SUPP_DOCS, ' +
                'd.detail_id, ' +
                'd.REPCUR_CREDIT, ' +
                'd.REPCUR_DEBIT, ' +
                'd.SPOT_RATE, ' +
                'd.NATIVE_CURR, ' +
                'd.REPORT_CURR, ' +
                'd.descrip || '' VOID'' ' +
                'from ' +
                'glbatch d, glbatchid i ' +
                'where d.header_id = %f ' +
                'and d.glbatchid_id = i.id ' +
                'and i.source = ''AR'' ' +
                'and instr(Replace(Replace(d.descrip, ''%s'', ''****''), ''%s'', ''****''), ''VOID'') = 0 ',
                [nGlBatchId_Id,
                 fInvoiceVoidId,
                 fId,
                 StrTran(FCustomerCompany, '''', ''''''),
                 StrTran(FCustno, '''', '''''')]));
end;

procedure TFrmVoidArInvoice.InsertGlbatchCreditMemo(nGLBatchId_Id, AId, AVoidId:Real);
begin
  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'header_id, ' +
                'glacct_id, ' +
                'credit, ' +
                'debit, ' +
                'NUM_OF_SUPP_DOCS, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                '%f, ' +
                'd.glacct_id, ' +
                'd.debit, ' +
                'd.credit, ' +
                'd.NUM_OF_SUPP_DOCS, ' +
                'd.descrip || '' VOID'' ' +
                'from ' +
                'glbatch d, glbatchid i ' +
                'where d.header_id = %f ' +
                'and d.glbatchid_id = i.id ' +
                'and i.source = ''AR'' ' +
                'and instr(Replace(Replace(d.descrip, ''%s'', ''****''), ''%s'', ''****''), ''VOID'') = 0 ',
                [nGlBatchId_Id,
                 AVoidId,
                 fId,
                 StrTran(FCustomerCompany, '''', ''''''),
                 StrTran(FCustno, '''', '''''')]));
end;



procedure TFrmVoidArInvoice.InsertArInvoice(nGlBatchId_Id:Real);
var
  cReason:String;
begin
  cReason := MemoReason.Text;
  cReason := StrTran(cReason, #13, ' ');
  cReason := StrTran(cReason, #10, ' ');
  cReason := StrTran(cReason, '''', '''''');

  with QryInsArinvoiceVoid do
  begin
    Close;
    ParamByName('cReason').Value := cReason;
    ParamByName('cVoidBy').Value := EditVoidBy.Text;
    ParamByName('dVoidDate').Value := fDate;
    ParamByName('nArInvoice_Id').Value := fId;
    ParamByName('nArInvoiceVoid_Id').Value := fInvoiceVoidId;
    ParamByName('nGlBatchId_Id').Value := nGlBatchId_Id;
    ParamByName('nGlPeriods_Id').Value := TblGLPeriods.FieldByName('ID').asFloat;
//    Prepare;
    ExecSql;
  end;

  ExecuteCommandFmt('update email_correspondence set source = ''AR_VOID'', source_id = %f where source = ''AR_POST'' and source_id = %f', [fInvoiceVoidId, fId]);

  ExecuteCommandFmt('insert into arinvoice_void_docs (arinvoice_void_id, iq_docs_id, docseq, type) ' +
          ' select %f, iq_docs_id, docseq, type from arinvoice_docs where arinvoice_id = %f', [fInvoiceVoidId, fId]);

  ExecuteCommandFmt('update doc_used set source = ''ARINVOICE_VOID'', source_id = %f where source = ''ARINVOICE'' and source_id = %f',
             [fInvoiceVoidId, fId]);


end;

procedure TFrmVoidArInvoice.InsertArInvoiceCreditMemo(nGlBatchId_Id, AId, AVoidId:Real);
var
  cReason:String;
begin
  cReason := MemoReason.Text;
  cReason := StrTran(cReason, #13, ' ');
  cReason := StrTran(cReason, #10, ' ');
  cReason := StrTran(cReason, '''', '''''');

  with QryInsArinvoiceVoid do
  begin
    Close;
    ParamByName('cReason').Value := cReason;
    ParamByName('cVoidBy').Value := EditVoidBy.Text;
    ParamByName('dVoidDate').Value := fDate;
    ParamByName('nArInvoice_Id').Value := AId;
    ParamByName('nArInvoiceVoid_Id').Value := AVoidId;
    ParamByName('nGlBatchId_Id').Value := nGlBatchId_Id;
    ParamByName('nGlPeriods_Id').Value := TblGLPeriods.FieldByName('ID').asFloat;
//    Prepare;
    ExecSql;
  end;
end;


procedure TFrmVoidArInvoice.InsertArInvoiceDetail(nGlBatchId_Id:Real);
var
  nId, APoReceiptsId, AInvoiceQty:Real;
  aOrdDetailId:Real;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select id from arinvoice_detail where arinvoice_id = %f', [fId]));
    Open;
    while not eof do
    begin
      nId := GetNextID('ARINVOICE_DETAIL_VOID');
      QryInsArinvoiceDetailVoid.Close;
      QryInsArinvoiceDetailVoid.ParamByName('nId').Value := nId;
      QryInsArinvoiceDetailVoid.ParamByName('nArInvoiceDetail_Id').Value := FieldByName('ID').asFloat;
      QryInsArinvoiceDetailVoid.ParamByName('nArInvoiceVoid_Id').Value := fInvoiceVoidId;
//      QryInsArinvoiceDetailVoid.Prepare;
      QryInsArinvoiceDetailVoid.ExecSql;

      aOrdDetailId := SelectValueFmtAsFloat('select ord_detail_id from arinvoice_detail where id = %f', [FieldByName('ID').asFloat]);
      if aOrdDetailId <> 0 then
      begin
        ExecuteCommandFmt('update ord_detail set auto_invoice = ''Y'' where id = %f and NVL(auto_invoice, ''N'') = ''I''', [aOrdDetailId]);
        ExecuteCommandFmt('update hist_ord_detail set auto_invoice = ''Y'' where id = %f and NVL(auto_invoice, ''N'') = ''I''', [aOrdDetailId]);
      end;

      ExecuteCommandFmt('update glbatch set detail_id = %f where detail_id = %f and glbatchid_id = %f',
      [nId, FieldByName('ID').asFloat, nGlBatchId_Id]);

      APoReceiptsId := SelectValueFmtAsFloat('select po_receipts_id from arinvoice_detail where id = %f', [FieldByName('ID').asFloat]);

      if APoReceiptsId <> 0 then
      begin
        AInvoiceQty := SelectValueFmtAsFloat('select invoice_qty from arinvoice_detail where id = %f', [FieldByName('ID').asFloat]);
        ExecuteCommandFmt('update po_receipts set qty_invoiced = NVL(qty_invoiced, 0) - %.6f  where id = %f', [AInvoiceQty, APoReceiptsId]);
      end;



       ExecuteCommandFmt('insert into ARINVOICE_COMM_VOID ' +
                             '(ARINVOICE_DETAIL_VOID_ID, ' +
                             'salespeople_id, ' +
                             'commission_percent, ' +
                             'sales_code, ' +
                             'first_name, ' +
                             'last_name, amount, middle_name) ' +
                          'select %f, ' +
                                 'c.salespeople_id, ' +
                                 'c.commission_percent, ' +
                                 's.sales_code, ' +
                                 's.first_name, ' +
                                 's.last_name, amount, s.middle_name ' +
                               'from ARINVOICE_COMM c, SALESPEOPLE s ' +
                               'where c.ARINVOICE_DETAIL_ID = %f ' +
                                 'and c.salespeople_id = s.id', [nId, FieldByName('ID').asFloat]);





      ExecuteCommandFmt('insert into ARINVOICE_DETAIL_VOID_TAXES (arinvoice_detail_void_id, ' +
                                                         'tax_elements_descrip, ' +
                                                         'tax_elements_tax_rate, ' +
                                                         'tax_elements_glacct_id, tax_amount) ' +
                                 'select %f, ' +
                                        'tax_elements_descrip, ' +
                                        'tax_elements_tax_rate, ' +
                                        'tax_elements_glacct_id, tax_amount ' +
                                  'from ARINVOICE_DETAIL_TAXES ' +
                                  'where arinvoice_detail_id = %f',
                                  [nId, FieldByName('ID').AsFloat]);


      ExecuteCommandFmt('insert into arinvoice_detail_s_void (arinvoice_detail_void_id, glacct_id, percentage, acct, SPLIT_AMOUNT) ' +
                  'select %f, a.glacct_id, a.percentage, a.acct, a.SPLIT_AMOUNT from arinvoice_detail_sales a ' +
                  'where a.arinvoice_detail_id = %f',
                  [nID, FieldByName('ID').asFloat]);



      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmVoidArInvoice.InsertArInvoiceDetailCreditMemo(AId, AVoidId:Real);
var
  nId:Real;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select id from arinvoice_detail where arinvoice_id = %f', [AId]));
    Open;
    while not eof do
    begin
      nId := GetNextID('ARINVOICE_DETAIL_VOID');
      QryInsArinvoiceDetailVoid.Close;
      QryInsArinvoiceDetailVoid.ParamByName('nId').Value := nId;
      QryInsArinvoiceDetailVoid.ParamByName('nArInvoiceDetail_Id').Value := FieldByName('ID').asFloat;
      QryInsArinvoiceDetailVoid.ParamByName('nArInvoiceVoid_Id').Value := AVoidId;
//      QryInsArinvoiceDetailVoid.Prepare;
      QryInsArinvoiceDetailVoid.ExecSql;



       ExecuteCommandFmt('insert into ARINVOICE_COMM_VOID ' +
                             '(ARINVOICE_DETAIL_VOID_ID, ' +
                             'salespeople_id, ' +
                             'commission_percent, ' +
                             'sales_code, ' +
                             'first_name, ' +
                             'last_name, middle_name) ' +
                          'select %f, ' +
                                 'c.salespeople_id, ' +
                                 'c.commission_percent, ' +
                                 's.sales_code, ' +
                                 's.first_name, ' +
                                 's.last_name, s.middle_name ' +
                               'from ARINVOICE_COMM c, SALESPEOPLE s ' +
                               'where c.ARINVOICE_DETAIL_ID = %f ' +
                                 'and c.salespeople_id = s.id', [nId, FieldByName('ID').asFloat]);





      ExecuteCommandFmt('insert into ARINVOICE_DETAIL_VOID_TAXES (arinvoice_detail_void_id, ' +
                                                         'tax_elements_descrip, ' +
                                                         'tax_elements_tax_rate, ' +
                                                         'tax_elements_glacct_id, tax_amount) ' +
                                 'select %f, ' +
                                        'tax_elements_descrip, ' +
                                        'tax_elements_tax_rate, ' +
                                        'tax_elements_glacct_id, tax_amount ' +
                                  'from ARINVOICE_DETAIL_TAXES ' +
                                  'where arinvoice_detail_id = %f',
                                  [nId, FieldByName('ID').AsFloat]);

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmVoidArInvoice.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmVoidArInvoice.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
    if HintControl = DBEditPeriod then  with TblGLPeriods do
      HintStr := Format(ar_rscstr.cTXT0000037 {'Start Date: %s'#13'End Date: %s'},
                       [FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
                        FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
end;

procedure TFrmVoidArInvoice.RecreateAR;
begin
  ExecuteCommandFmt('begin ar.RecreateAR(%f); end;', [fId]);
end;

procedure TFrmVoidArInvoice.UpdateCreditMemo(arinvoice_id:Real);
var
  acm_arinvoice_id, ainvoicetotal:Real;
begin
  acm_arinvoice_id := SelectValueFmtAsFloat('select arinvoice_id from arinvoice where id = %f', [arinvoice_id]);
  ainvoicetotal    := SelectValueFmtAsFloat('select invoicetotal from arinvoice where id = %f', [arinvoice_id]);
  ExecuteCommandFmt('update arinvoice set lefttoapply = lefttoapply - %f where id = %f', [ainvoicetotal, acm_arinvoice_id]);
end;


end.
