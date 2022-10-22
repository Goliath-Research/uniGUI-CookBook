unit FrxPop;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniProgressBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, uniMainMenu, Data.DB, Vcl.Graphics,
  Vcl.Controls, uniImage;

type
  TForm1 = class(TUniForm)
    Database1: TFDConnection;
    Image1: TUniImage;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Options1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    SBDeleteAll: TUniSpeedButton;
    SBAddAll: TUniSpeedButton;
    Panel2: TUniPanel;
    SB: TUniStatusBar;
    SBDD: TUniSpeedButton;
    PopulateEplant1: TUniMenuItem;
    PopulateGLAcct1: TUniMenuItem;
    PopulateGLYear1: TUniMenuItem;
    PopulateGLPeriods1: TUniMenuItem;
    PopulateCurrency1: TUniMenuItem;
    PopulateBudget1: TUniMenuItem;
    PopulateGLBatch1: TUniMenuItem;
    N1: TUniMenuItem;
    DeleteAll1: TUniMenuItem;
    AppendAll1: TUniMenuItem;
    PB: TUniProgressBar;
    Panel3: TUniPanel;
    N2: TUniMenuItem;
    FRxDD1: TUniMenuItem;
    SBPopFrl: TUniSpeedButton;
    N3: TUniMenuItem;
    PopulateFRLTables1: TUniMenuItem;
    procedure PopulateEplant1Click(Sender: TObject);
    procedure PopulateGLAcct1Click(Sender: TObject);
    procedure PopulateGLYear1Click(Sender: TObject);
    procedure PopulateGLPeriods1Click(Sender: TObject);
    procedure PopulateCurrency1Click(Sender: TObject);
    procedure PopulateBudget1Click(Sender: TObject);
    procedure PopulateGLBatch1Click(Sender: TObject);
    procedure SBDeleteAllClick(Sender: TObject);
    procedure SBDDClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SBAddAllClick(Sender: TObject);
    procedure SBPopFrlClick(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateBudget;
    procedure PopulateHistBudget;
    procedure PopulateGLBudgetHist(Aacct_id:Integer; Afiscal_year:Integer; AGlAcctFyId:Real);
    procedure PopulateGlBatchId;
    procedure PopulateGlBatchIdHist;
    procedure PopulateGlBatchHist(AGlBatchId_Id:Real; Aentity_num, Afiscal_year, Afiscal_period:Integer; Abatch_id:String);
    procedure PopulateGLBudget(Aacct_id:Integer; Afiscal_year:Integer; AGlAcctFyId:Real);
    procedure PopulateGlBatch(AGlBatchId_Id:Real; Aentity_num, Afiscal_year, Afiscal_period:Integer; Abatch_id:String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.ErrorDialog,
  FrxDD,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Dialogs,
  FrlCtrl;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.PopulateBudget;
var
  AGlYearId:Real;
  AGlAcctFyId:Real;
begin
  ExecuteCommand('delete from glacct_fy');
  ExecuteCommand('delete from glbudget');
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select count(acct_id) as acount from frl_tran_detail where book_code = ''Budget_Original'' and entity_num = 1');
    Open;
    PB.Max := FieldByName('acount').asInteger;
    Sql.Clear;
    Sql.Add('select distinct acct_id, fiscal_year from frl_tran_detail where book_code = ''Budget_Original'' and entity_num = 1');
    Open;
    while not eof do
    begin
      SB.SimpleText := 'Populate GLACCT_FY';
      AGlYearId := SelectValueFmtAsFloat('select id from glyear where descrip = ''%s''',
                             [FieldByName('fiscal_year').asString]);

      AGlAcctFyId := GetNextID('GLACCT_FY');

      ExecuteCommandFmt('insert into glacct_fy (id, glacct_id, glyear_id) values ' +
                '(%f, %f, %f)',
                [AGlAcctFyId,
                 FieldByName('acct_id').asFloat,
                 AGlYearId]);

      PopulateGLBudget(FieldByName('acct_id').asInteger, FieldByName('fiscal_year').asInteger, AGlAcctFyId);

      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    PB.Max := 0;
  end;

end;

procedure TForm1.PopulateHistBudget;
var
  AGlYearId:Real;
  AGlAcctFyId:Real;
begin
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select count(acct_id) as acount from frl_tran_detail_hist where book_code = ''Budget_Original'' and entity_num = 1');
    Open;
    PB.Max := FieldByName('acount').asInteger;
    Sql.Clear;
    Sql.Add('select distinct acct_id, fiscal_year from frl_tran_detail_hist where book_code = ''Budget_Original'' and entity_num = 1');
    Open;
    while not eof do
    begin
      SB.SimpleText := 'Populate GLACCT_FY';
      AGlYearId := SelectValueFmtAsFloat('select id from glyear where descrip = ''%s''',
                             [FieldByName('fiscal_year').asString]);

      AGlAcctFyId := GetNextID('GLACCT_FY');

      ExecuteCommandFmt('insert into glacct_fy (id, glacct_id, glyear_id) values ' +
                '(%f, %f, %f)',
                [AGlAcctFyId,
                 FieldByName('acct_id').asFloat,
                 AGlYearId]);

      PopulateGLBudgetHist(FieldByName('acct_id').asInteger, FieldByName('fiscal_year').asInteger, AGlAcctFyId);

      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    PB.Max := 0;
  end;

end;

procedure TForm1.PopulateGLBudgetHist(Aacct_id:Integer; Afiscal_year:Integer; AGlAcctFyId:Real);
var
  AGlYearId:Real;
  AGlPeriodId:Real;
begin
  SB.SimpleText := 'Populate GLBUDGET';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add(Format('select fiscal_period, rptng_amount from frl_tran_detail_hist where book_code = ''Budget_Original'' ' +
                   'and acct_id = %d and fiscal_year = %d and entity_num = 1',
                   [AAcct_id, Afiscal_year]));
    Open;
    while not eof do
    begin
      AGlYearId := SelectValueFmtAsFloat('select id from glyear where descrip = ''%s''', [IntToStr(Afiscal_year)]);

      AGlPeriodId := SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and period = %f',
                               [AGlYearId,  FieldByName('fiscal_period').asFloat]);



      ExecuteCommandFmt('insert into glbudget (glacct_fy_id, glperiods_id, budamount) values ' +
                '(%f, %f, %f)',
                [AGlAcctFyId,
                 AGlPeriodId,
                 FieldByName('rptng_amount').asFloat]);
      PB.Stepit;
      Panel3.Caption := Format('%d/%d', [PB.Position, PB.Max]);
      Application.ProcessMessages;
      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    Panel3.Caption := '';
  end;
end;




procedure TForm1.PopulateGLBudget(Aacct_id:Integer; Afiscal_year:Integer; AGlAcctFyId:Real);
var
  AGlYearId:Real;
  AGlPeriodId:Real;
begin
  SB.SimpleText := 'Populate GLBUDGET';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add(Format('select fiscal_period, rptng_amount from frl_tran_detail where book_code = ''Budget_Original'' ' +
                   'and acct_id = %d and fiscal_year = %d and entity_num = 1',
                   [AAcct_id, Afiscal_year]));
    Open;
    while not eof do
    begin
      AGlYearId := SelectValueFmtAsFloat('select id from glyear where descrip = ''%s''', [IntToStr(Afiscal_year)]);

      AGlPeriodId := SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and period = %f',
                               [AGlYearId,  FieldByName('fiscal_period').asFloat]);



      ExecuteCommandFmt('insert into glbudget (glacct_fy_id, glperiods_id, budamount) values ' +
                '(%f, %f, %f)',
                [AGlAcctFyId,
                 AGlPeriodId,
                 FieldByName('rptng_amount').asFloat]);
      PB.Stepit;
      Panel3.Caption := Format('%d/%d', [PB.Position, PB.Max]);
      Application.ProcessMessages;
      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    Panel3.Caption := '';
  end;
end;


procedure TForm1.PopulateGlBatchId;
var
  AGlBatchId_Id, AGlYearId, AGlPeriodId:Real;
  ABatch_Date:TDateTime;
begin
  ExecuteCommand('truncate table glbatch');
  ExecuteCommand('delete from glbatchid');

  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select count(acct_id) as acount from frl_tran_detail where book_code = ''ACTUAL''');
    Open;
    PB.Max := FieldByName('acount').asInteger;

    Sql.Clear;


    Sql.Add('select distinct entity_num, batch_id, fiscal_year, fiscal_period from frl_tran_detail ' +
                   'where book_code = ''ACTUAL'' order by entity_num, batch_id, fiscal_year');
    Open;
    while not eof do
    begin
      SB.SimpleText := 'Populate GLBATCHID';
      AGlYearId := SelectValueFmtAsFloat('select id from glyear where descrip = ''%s''', [IntToStr(FieldByName('fiscal_year').asInteger)]);

      AGlPeriodId := SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and period = %f',
                               [AGlYearId,  FieldByName('fiscal_period').asFloat]);

      ABatch_Date := SelectValueFmtAsFloat('select start_date from glperiods where id = %f', [AGlPeriodId]);

      AGlBatchId_Id := GetNextID('GLBATCHID');

      ExecuteCommandFmt('insert into glbatchid (id, batchnumber, glperiods_id, batch_date, userid, system_date) ' +
                'values (%f, %f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ''%s'', sysdate)',
                [AGlBatchId_Id,
                 AGlBatchId_Id,
                 AGlPeriodId,
                 FormatDateTime('mm/dd/yyyy', ABatch_Date),
                 SecurityManager.UserName]);

      PopulateGlBatch(AGlBatchId_Id,
                      FieldByname('entity_num').asInteger,
                      FieldByname('fiscal_year').asInteger,
                      FieldByname('fiscal_period').asInteger,
                      FieldByname('batch_id').asString);

      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    PB.Max := 0;
  end;
end;

procedure TForm1.PopulateGlBatchIdHist;
var
  AGlBatchId_Id, AGlYearId, AGlPeriodId:Real;
  ABatch_Date:TDateTime;
begin
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select count(acct_id) as acount from frl_tran_detail_hist where book_code = ''ACTUAL''');
    Open;
    PB.Max := FieldByName('acount').asInteger;

    Sql.Clear;


    Sql.Add('select distinct entity_num, batch_id, fiscal_year, fiscal_period from frl_tran_detail_hist ' +
                   'where book_code = ''ACTUAL'' order by entity_num, batch_id, fiscal_year');
    Open;
    while not eof do
    begin
      SB.SimpleText := 'Populate GLBATCHID';
      AGlYearId := SelectValueFmtAsFloat('select id from glyear where descrip = ''%s''', [IntToStr(FieldByName('fiscal_year').asInteger)]);

      AGlPeriodId := SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and period = %f',
                               [AGlYearId,  FieldByName('fiscal_period').asFloat]);

      ABatch_Date := SelectValueFmtAsFloat('select start_date from glperiods where id = %f', [AGlPeriodId]);

      AGlBatchId_Id := GetNextID('GLBATCHID');

      ExecuteCommandFmt('insert into glbatchid (id, batchnumber, glperiods_id, batch_date, userid, system_date) ' +
                'values (%f, %f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ''%s'', sysdate)',
                [AGlBatchId_Id,
                 AGlBatchId_Id,
                 AGlPeriodId,
                 FormatDateTime('mm/dd/yyyy', ABatch_Date),
                 SecurityManager.UserName]);

      PopulateGlBatchHist(AGlBatchId_Id,
                      FieldByname('entity_num').asInteger,
                      FieldByname('fiscal_year').asInteger,
                      FieldByname('fiscal_period').asInteger,
                      FieldByname('batch_id').asString);

      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    PB.Max := 0;
  end;
end;


procedure TForm1.PopulateGlBatch(AGlBatchId_Id:Real; Aentity_num, Afiscal_year, Afiscal_period:Integer; Abatch_id:String);
var
  ADebit, ACredit:Real;
begin
  SB.SimpleText := 'Populate GLBATCH';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add(Format('select * from frl_tran_detail ' +
                   'where book_code = ''ACTUAL'' and entity_num = %d ' +
                   'and fiscal_year = %d and fiscal_period = %d and batch_id = ''%s''',
                   [Aentity_num, Afiscal_year, Afiscal_period, ABatch_id]));
    Open;
    while not eof do
    begin
      ADebit  := 0;
      ACredit := 0;
      if FieldByname('rptng_amount').asFloat < 0 then
        ACredit := Abs(FieldByname('rptng_amount').asFloat)
      else
        ADebit := FieldByname('rptng_amount').asFloat;
      ExecuteCommandFmt('insert into glbatch (glbatchid_id, glacct_id, debit, credit,  descrip, ref_code) ' +
                'values (%f, %f, %f, %f, RTrim(''%s''), RTrim(''%s''))',
                [AGlBatchId_Id,
                 FieldByName('acct_id').asFloat,
                 ADebit,
                 ACredit,
                 FieldByName('tran_desc').asString,
                 FieldByName('reference_code').asString]);
      PB.Stepit;
      Panel3.Caption := Format('%d/%d', [PB.Position, PB.Max]);
      Application.ProcessMessages;
      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    Panel3.Caption := '';
  end;
end;

procedure TForm1.PopulateGlBatchHist(AGlBatchId_Id:Real; Aentity_num, Afiscal_year, Afiscal_period:Integer; Abatch_id:String);
var
  ADebit, ACredit:Real;
begin
  SB.SimpleText := 'Populate GLBATCH';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add(Format('select * from frl_tran_detail_hist ' +
                   'where book_code = ''ACTUAL'' and entity_num = %d ' +
                   'and fiscal_year = %d and fiscal_period = %d and batch_id = ''%s''',
                   [Aentity_num, Afiscal_year, Afiscal_period, ABatch_id]));
    Open;
    while not eof do
    begin
      ADebit  := 0;
      ACredit := 0;
      if FieldByname('rptng_amount').asFloat < 0 then
        ACredit := Abs(FieldByname('rptng_amount').asFloat)
      else
        ADebit := FieldByname('rptng_amount').asFloat;
      ExecuteCommandFmt('insert into glbatch (glbatchid_id, glacct_id, debit, credit,  descrip, ref_code) ' +
                'values (%f, %f, %f, %f, RTrim(''%s''), RTrim(''%s''))',
                [AGlBatchId_Id,
                 FieldByName('acct_id').asFloat,
                 ADebit,
                 ACredit,
                 FieldByName('tran_desc').asString,
                 FieldByName('reference_code').asString]);
      PB.Stepit;
      Panel3.Caption := Format('%d/%d', [PB.Position, PB.Max]);
      Application.ProcessMessages;
      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
    Panel3.Caption := '';
  end;
end;

procedure TForm1.PopulateEplant1Click(Sender: TObject);
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to populate Eplant (all current records will be deleted)') then Exit;
  ExecuteCommand('delete from eplant');
  SB.SimpleText := 'Populating EPlant';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select * from frl_entity');
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('insert into eplant (id, name, company) values ' +
                '(%f, RTrim(''%s''), RTrim(''%s''))',
                [FieldByName('entity_num').asFloat,
                 FieldByName('entity_desc').asString,
                 FieldByName('entity_desc').asString]);
      Next;
    end;
    if SelectValueAsFloat('select count(id) from eplant') > 0 then
      ExecuteCommand('update iqsys set use_eplants_with_frl = ''Y''');
  finally
    Free;
    SB.SimpleText := '';
  end;
end;

procedure TForm1.PopulateGLAcct1Click(Sender: TObject);
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to populate GLACCT (all current records will be deleted)') then Exit;
  ExecuteCommand('delete from glacct');
  SB.SimpleText := 'Populating GLACCT';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select count(acct_id) as acount from frl_acct_code');
    Open;
    PB.Max := FieldByName('acount').asInteger;
    Sql.Clear;
    Sql.Add('select * from frl_acct_code');
    Open;
    while not eof do
    try
      ExecuteCommandFmt('insert into glacct (id, acct, descrip, eplant_id, ecode) values ' +
                '(%f, SubStr(''%s'', 1, 4) || ''-'' || SubStr(''%s'', 5, 4) || ''-'' || SubStr(''%s'', 9, 3), ''%s'', %f, ''%s'')',
                [FieldByName('acct_id').asFloat,
                 FieldByName('acct_code').asString,
                 FieldByName('acct_code').asString,
                 FieldByName('acct_code').asString,
                 StrTran(FieldByName('acct_desc').asString, '''', ''''''),
                 FieldByName('entity_num').asFloat,
                 FieldByName('entity_num').asString]);
      PB.StepIt;
      Panel3.Caption := Format('%d/%d', [PB.Position, PB.Max]);
      Application.ProcessMessages;
      Next;
    except
      on E:Exception do
      begin
        ShowMessage('Glacct: ' + FieldByName('acct_code').asString +#13 +
                    'Desc: ' + FieldByName('acct_desc').asString +#13 +
                    'Eplant ID: ' + FieldByName('entity_num').asString +#13 +
                    'Id: ' + FieldByName('acct_id').asString +#13 + E.Message);
        Exit;
      end;
    end;
  finally
    Free;
    PB.Max := 0;
    SB.SimpleText := '';
    Panel3.Caption := '';
  end;
end;

procedure TForm1.PopulateGLYear1Click(Sender: TObject);
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to populate GLYEAR (all current records will be deleted)') then Exit;
  ExecuteCommand('delete from glperiods');
  ExecuteCommand('delete from glyear');
  SB.SimpleText := 'Populating GLYEAR';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select * from frl_year_ctrl where entity_num = 1');
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('insert into glyear (descrip, start_date, end_date) values ' +
                '(''%s'', To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''))',
                [FieldByName('fiscal_year').asString,
                 FormatDateTime('mm/dd/yyyy', FieldByName('beginning_date').asDateTime),
                 FormatDateTime('mm/dd/yyyy', FieldByName('ending_date').asDateTime)]);
      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
  end;
end;

procedure TForm1.PopulateGLPeriods1Click(Sender: TObject);
var
  AGlYearId:Real;
  AStartDate:TDateTime;
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to populate GLPERIODS (all current records will be deleted)') then Exit;
  ExecuteCommand('delete from glperiods');
  SB.SimpleText := 'Populating GLPERIODS';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select * from frl_period_ctrl where entity_num = 1 and fiscal_period <> 0 order by period_end_date');
    Open;
    while not eof do
    begin
      AGlYearId := SelectValueFmtAsFloat('select id from glyear where descrip = ''%s''',
                             [FieldByName('fiscal_year').asString]);

      AStartDate := SelectValueFmtAsFloat('select max(end_date) + 1 from glperiods where end_date < To_Date(''%s'', ''MM/DD/RRRR'')',
                               [FormatDateTime('mm/dd/yyyy', FieldByName('period_end_date').asdateTime)]);

      if AStartDate = 0 then
        AStartDate := SelectValueFmtAsFloat('select start_date from glyear where id = %f', [AGlYearId]);

      ExecuteCommandFmt('insert into glperiods (glyear_id, period, start_date, end_date) values ' +
                '(%f, ''%s'', To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''))',
                [AGlYearId,
                 FieldByName('fiscal_period').asString,
                 FormatDateTime('mm/dd/yyyy', AStartDate),
                 FormatDateTime('mm/dd/yyyy', FieldByName('period_end_date').asDateTime)]);
      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
  end;
end;

procedure TForm1.PopulateCurrency1Click(Sender: TObject);
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to populate CURRENCY (all current records will be deleted)') then Exit;
  ExecuteCommand('delete from currency');
  SB.SimpleText := 'Populating CURRENCY';
  with TFDQuery.Create(self) do
  try
    DataBaseName := 'IqFrx';
    Sql.Add('select * from frl_currency_ctrl');
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('insert into currency (curr_code, descrip, spot_rate) values ' +
                '(RTrim(''%s''), RTrim(''%s''), %f)',
                [FieldByName('curr_code').asString,
                 FieldByName('curr_desc').asString,
                 FieldByName('divide_multiply').asFloat]);
      Next;
    end;
  finally
    Free;
    SB.SimpleText := '';
  end;
end;

procedure TForm1.PopulateBudget1Click(Sender: TObject);
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to populate GLBUDGET (all current records will be deleted)') then Exit;
  PopulateBudget;
  PopulateHistBudget;
end;

procedure TForm1.PopulateGLBatch1Click(Sender: TObject);
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to populate GLBATCH (all current records will be deleted)') then Exit;
  PopulateGlBatchId;
  PopulateGlBatchIdHist;
end;

procedure TForm1.SBDeleteAllClick(Sender: TObject);
begin
  if Sender <> SBAddAll then
    if not IqConfirmYN('Do you wish to delete all current records in IQWIN95?') then Exit;
  SB.SimpleText := 'deleteing GLBUDGET';
  ExecuteCommand('delete from glbudget');
  SB.SimpleText := 'deleteing GLACCT_FY';
  ExecuteCommand('delete from glacct_fy');
  SB.SimpleText := 'deleteing GLBATCH';
  ExecuteCommand('truncate table glbatch');
  SB.SimpleText := 'deleteing GLBATCHID';
  ExecuteCommand('delete from glbatchid');
  ExecuteCommand('update iqsys set currency_id = null');
  SB.SimpleText := 'deleteing CURRENCY';
  ExecuteCommand('delete from currency');
  SB.SimpleText := 'deleteing GLPERIODS';
  ExecuteCommand('delete from glperiods');
  SB.SimpleText := 'deleteing GLYEAR';
  ExecuteCommand('delete from glyear');
  SB.SimpleText := 'deleteing GLACCT';
  ExecuteCommand('delete from glacct');
  SB.SimpleText := 'deleteing EPLANT';
  ExecuteCommand('delete from eplant');
  SB.SimpleText := '';
end;

procedure TForm1.SBDDClick(Sender: TObject);
begin
  DOEvaluateSql(self, '');
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TForm1.SBAddAllClick(Sender: TObject);
begin
  if not IqConfirmYN('Do you wish to populate the IQWIN95 database (all current records will be deleted)?') then Exit;
  SBDeleteAllClick(Sender);
  PopulateEplant1Click(Sender);
  PopulateGLAcct1Click(Sender);
  PopulateGLYear1Click(Sender);
  PopulateGLPeriods1Click(Sender);
  PopulateCurrency1Click(Sender);
  PopulateBudget1Click(Sender);
  PopulateGLBatch1Click(Sender);
  IqConfirm('Done');
end;

procedure TForm1.SBPopFrlClick(Sender: TObject);
begin
  DoFrlSysCtrl; {in FrlCtrl.pas}
end;

end.
