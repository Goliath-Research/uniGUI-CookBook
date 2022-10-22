unit CVoid;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Ivoid,
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
  Data.DB, uniCheckBox, uniMemo, uniEdit, uniGUIClasses, uniDateTimePicker,
  uniDBDateTimePicker, uniLabel, uniSplitter, uniButton, uniGUIBaseClasses,
  uniPanel, uniGUIApplication;

type
  TFrmVoidCr = class(TFrmVoidArInvoice)
    QryInsCrVoid: TFDQuery;
    QryInsCrVoidDetail: TFDQuery;
    procedure BtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure InsertGlbatchId(nGLBatchId_Id:Real);
    procedure InsertGlbatch(nGLBatchId_Id:Real);
    procedure InsertCRInvoice(nGlBatchId_Id:Real);
    procedure InsertCRInvoiceDetail;
    procedure DeleteARInvoiceRecord;
    procedure DeleteCashrecRecord;
    procedure LockTable(ATable:String);
    procedure PrintAfterPostReport(nGLBatchId_Id:Real);
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
    procedure RecreateCR;
  public
    { Public declarations }
  end;

function DoVoidCashRec(Id, PeriodId:Real):Boolean;

implementation
{$R *.DFM}
uses
  IQMS.Common.AccountingShare,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Print,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  wwSystem;

function DoVoidCashRec(Id, PeriodId:Real):Boolean;
var
  LFrmVoidCr : TFrmVoidCr;
begin
  LFrmVoidCr := TFrmVoidCr.Create(uniGUIApplication.UniApplication);
  LFrmVoidCr.Id := Id;
  LFrmVoidCr.PeriodId := PeriodId;
  LFrmVoidCr.LblReconstruct.Visible := true;
  LFrmVoidCr.CbReconstruct.Visible := true;
  Result := False;
  LFrmVoidCr.ShowModal;
  Result := (LFrmVoidCr.ModalResult = mrOk);
end;

procedure TFrmVoidCr.BtnOkClick(Sender: TObject);
var
  DBase:TFDCustomConnection;
  nGLBatchId_Id:Real;
begin
  if Empty(EditVoidBy.Text) then raise Exception.Create('''Void By'' must be filled');
  CheckForOpenPeriod('ar_status', TblGLPeriods.FieldByName('ID').asFloat);  {in IqAcct.pas}
  fDate := wwStrToDateVal(EditDate.Text);
//  fDate := StrToDate(EditDate.Text);
  if not IqConfirmYN('You are about to VOID a Cash Receipt.' + #13 +
                     'This change is irreversible.' + #13 +
                     'Do you wish to continue?') then Exit;
  try
    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    nGLBatchId_Id  := GetNextID('GLBATCHID');
    fInvoiceVoidId   := GetNextID('CASHREC_VOID');
    InsertGlbatchId(nGLBatchId_Id);
    InsertGlbatch(nGLBatchId_Id);

    InsertCrInvoice(nGLBatchId_Id);
    InsertCrInvoiceDetail;
    ExecuteCommandFmt('begin intercomp.update_glbatch(%f, ''Y''); end;', [nGLBatchId_Id]);


    LockTable('ARINVOICE');
    DeleteArInvoiceRecord;
    LockTable('CASHREC');
    if cbReconstruct.Checked then
      RecreateCR;
    DeleteCashrecRecord;
    DBase.Commit;
    BtnOk.Enabled := false;
    if IqConfirmYN('Cash Receipt Voided, Do you wish to print the AfterPost report?')
      then  PrintAfterPostReport(nGLBatchId_Id);
  finally
    Screen.Cursor := crDefault;
    if DBase.InTransaction then
    begin
      DBase.RollBack;
//      raise Exception.Create('Invoice was not voided');
    end;
    ModalResult := mrOk;
  end;
end;

procedure TFrmVoidCr.InsertGlbatchId(nGLBatchId_Id:Real);
var
  nBatchnumber:Real;
begin
  nBatchNumber   := GetNextSequenceNumber('S_CASHREC_BATCHNO');
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
                '''CR'', ' +
                '''CASHREC_DETAIL_VOID'', ' +
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

procedure TFrmVoidCr.InsertGlbatch(nGLBatchId_Id:Real);
begin
//  if SelectValueFmtAsFloat('select count(d.id) from glbatchid h, glbatch d ' +
//               'where d.glbatchid_id = h.id ' +
//               'and d.header_id = %f and instr(d.descrip, ''VOID'') = 0 and h.source = ''CR''', [fId])  = 0 then
//  raise exception.create('Cannot void Cash receipt, HEADER_ID is missing');

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
                'REPCUR_DEBIT, ' +
                'REPCUR_CREDIT, ' +
                'SPOT_RATE, ' +
                'NATIVE_CURR, ' +
                'REPORT_CURR, ' +
                'ref_code) ' +
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
                'd.REPCUR_CREDIT, ' +
                'd.REPCUR_DEBIT, ' +
                'd.SPOT_RATE, ' +
                'd.NATIVE_CURR, ' +
                'd.REPORT_CURR, ' +
                'd.ref_code ' +
                'from ' +
                'glbatch d, glbatchid i ' +
                'where d.header_id = %f ' +
                'and d.glbatchid_id = i.id ' +
                'and instr(d.descrip, ''VOID'') = 0 ' +
                'and i.source = ''CR''',
                [nGlBatchId_Id,
                 fInvoiceVoidId,
                 fId]));
end;

procedure TFrmVoidCr.InsertCRInvoice(nGlBatchId_Id:Real);
var
  cReason:String;
begin
  cReason := MemoReason.Text;
  cReason := StrTran(cReason, #13, ' ');
  cReason := StrTran(cReason, #10, ' ');
  cReason := StrTran(cReason, '''', '''''');

  with QryInsCrVoid do
  begin
    Close;
    ParamByName('cReason').Value := cReason;
    ParamByName('cVoidBy').Value := EditVoidBy.Text;
    ParamByName('dDate').Value := fDate;
    ParamByName('nCrId').Value := fId;
    ParamByName('nCrVoidId').Value := fInvoiceVoidId;
    ParamByName('nGlBatchId_Id').Value := nGlBatchId_Id;
//    Prepare;
    ExecSql;
  end;

  ExecuteCommandFmt('insert into cashrec_void_docs (cashrec_void_id, iq_docs_id, docseq, type) select %f, iq_docs_id, docseq, type from cashrec_docs where cashrec_id = %f',
            [fInvoiceVoidId, fId]);

  ExecuteCommandFmt('update doc_used set source = ''CASHREC_VOID'', source_id = %f where source = ''CASHREC'' and source_id = %f',
            [fInvoiceVoidId, fId]);

  ExecuteCommandFmt('update EMAIL_CORRESPONDENCE set source = ''CASHREC_VOID'', source_id = %f where source = ''CASHREC'' and source_id = %f',
            [fInvoiceVoidId, fId]);

end;

procedure TFrmVoidCr.InsertCRInvoiceDetail;
begin
  ExecuteCommandFmt('begin CR.InsCashRecDetailVoid(%f, %f); end;', [fInvoiceVoidId, fId])
//  with QryInsCrVoidDetail do
//  begin
//    Close;
//    ParamByName('nCrId').Value := fId;
//    ParamByName('nCrVoidId').Value := fInvoiceVoidId;
//    ExecSql;
//  end;
end;

procedure TFrmVoidCr.LockTable(ATable:String);
begin
  try
    ExecuteCommandFmt('lock table %s in exclusive mode nowait', [ATable]);
  except
    raise Exception.Create('Unable to obtain lock on the AR AfterPost table.' + #13 +
                           'It is possibly locked by another user.' + #13 +
                           'Please try again later.' );
  end;
end;

procedure TFrmVoidCr.DeleteArInvoiceRecord;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select id from arinvoice where INVOICE_NO = ''ONACCT'' and CASHREC_ID = %f', [fId]));
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('Delete ARINVOICE_DETAIL where ARINVOICE_ID = %f', [FieldByName('ID').asFloat]);
      Next;
    end;
  finally
    Free;
  end;
  ExecuteCommandFmt('Delete ARINVOICE where INVOICE_NO = ''ONACCT'' and CASHREC_ID = %f', [fId]);
  ExecuteCommandFmt('update ARINVOICE set CASHREC_ID = null where CASHREC_ID = %f', [fId]);
end;

procedure TFrmVoidCr.DeleteCashrecRecord;
begin
  ExecuteCommandFmt('Delete CASHREC where ID = %f', [fId]);
end;

procedure TFrmVoidCr.PrintAfterPostReport(nGLBatchId_Id:Real);
var
  SelectionList:TStringList;
begin
  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList, IQFormat('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
    PrintDefaultReport( self, 'cr_afterpost_report', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmVoidCr.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;



procedure TFrmVoidCr.FormActivate(Sender: TObject);
begin
//
end;

procedure TFrmVoidCr.RecreateCR;
begin
  ExecuteCommandFmt('begin cr.RecreateCR(%f); end;', [fId]);
end;

end.
