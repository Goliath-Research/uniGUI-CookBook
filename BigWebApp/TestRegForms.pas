unit TestRegForms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniPanel, uniPageControl,
  uniSplitter, uniEdit, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait;

type
  TTestRegisteredForms = class(TUniForm)
    mtIssues: TFDMemTable;
    mtIssuesIssue: TStringField;
    dsIssues: TDataSource;
    dbgIssues: TUniDBGrid;
    dbgIssueTests: TUniDBGrid;
    pc: TUniPageControl;
    tsIssues: TUniTabSheet;
    tsModules: TUniTabSheet;
    mtIssueTests: TFDMemTable;
    dsIssueTests: TDataSource;
    mtIssueTestsIssue: TStringField;
    mtIssueTestsModule: TStringField;
    mtIssueTestsForm: TStringField;
    mtIssueTestsDescrip: TStringField;
    UniSplitter1: TUniSplitter;
    UniHiddenPanel1: TUniHiddenPanel;
    edIssueFilter: TUniEdit;
    mtModules: TFDMemTable;
    dsModules: TDataSource;
    mtModulesModule: TStringField;
    mtModuleForms: TFDMemTable;
    dsModuleForms: TDataSource;
    mtModuleFormsModule: TStringField;
    mtModuleFormsForm: TStringField;
    mtModuleFormsIssue: TStringField;
    mtFormTests: TFDMemTable;
    dsFormTests: TDataSource;
    mtFormTestsIssue: TStringField;
    mtFormTestsDescrip: TStringField;
    dbgModules: TUniDBGrid;
    dbgModuleForms: TUniDBGrid;
    UniSplitter2: TUniSplitter;
    UniSplitter3: TUniSplitter;
    dbgFormTests: TUniDBGrid;
    Qry: TFDQuery;
    FDLocalSQL1: TFDLocalSQL;
    SQLiteConn: TFDConnection;
    mtFormTestsTest: TIntegerField;
    mtIssueTestsTest: TIntegerField;
    procedure dbgIssueTestsDblClick(Sender: TObject);
    procedure mtIssuesAfterScroll(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure dbgIssuesColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure mtModulesAfterScroll(DataSet: TDataSet);
    procedure mtModuleFormsAfterScroll(DataSet: TDataSet);
    procedure dbgFormTestsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

  function TestRegisteredForms : TTestRegisteredForms;

implementation

uses
  uniGUIApplication,
  MainModule,
  Spring.Collections,
  TestReg;

{$R *.dfm}

function TestRegisteredForms : TTestRegisteredForms;
begin
  Result := TTestRegisteredForms(UniMainModule.GetFormInstance(TTestRegisteredForms));
end;

{ TTestRegisteredForms }

procedure TTestRegisteredForms.UniFormCreate(Sender: TObject);
var
  tsts   : IDictionary<string, TTestReg>;
  key    : string; // issue-test
  hyppos : integer;
  issue  : string;
  test   : integer;
  detail : TTestReg;
begin
  tsts := TTestRepo.GetTests;

  // Create Issue Tests from the registration dictionary

  mtIssueTests.Open;

  mtIssueTests.BeginBatch;
  try
    for key in tsts.Keys.Ordered do
    begin
      hyppos := Pos('-', key, 4);
      issue  := Copy(key, 1, hyppos - 1);
      test   := StrToInt(Copy(key, hyppos + 1, Length(key) - hyppos));

      tsts.TryGetValue(key, detail);

      mtIssueTests.Append;
      mtIssueTestsIssue.Value   := issue;
      mtIssueTestsModule.Value  := detail.Module;
      mtIssueTestsForm.Value    := detail.Form;
      mtIssueTestsDescrip.Value := detail.Descrip;
      mtIssueTestsTest.Value    := test;
      mtIssueTests.Post;
    end;
  finally
    mtIssueTests.EndBatch;
  end;

  // Create Issues from the Issue Tests

  Qry.Open('SELECT DISTINCT Issue FROM mtIssueTests ORDER BY Issue');
  try
    mtIssues.Open;
    mtIssues.BeginBatch;
    try
      while not Qry.Eof do
      begin
        mtIssues.Append;
        mtIssuesIssue.Value := Qry.FieldByName('Issue').Value;
        mtIssues.Post;

        Qry.Next;
      end;
    finally
      mtIssues.EndBatch;
    end;
  finally
    Qry.Close;
  end;

  // Create Modules from the Issue Tests using a Query

  Qry.Open('SELECT DISTINCT Module FROM mtIssueTests ORDER BY Module');
  try
    mtModules.Open;
    mtModules.BeginBatch;
    try
      while not Qry.Eof do
      begin
        mtModules.Append;
        mtModulesModule.Value := Qry.FieldByName('Module').Value;
        mtModules.Post;

        Qry.Next;
      end;
    finally
      mtModules.EndBatch;
    end;
  finally
    Qry.Close;
  end;

  // Create Module Forms from the Issue Tests using a Query

  Qry.Open('SELECT DISTINCT Module, Form, Issue FROM mtIssueTests ORDER BY Module, Form, Issue');
  try
    mtModuleForms.Open;
    mtModuleForms.BeginBatch;
    try
      while not Qry.Eof do
      begin
        mtModuleForms.Append;
        mtModuleFormsModule.Value := Qry.FieldByName('Module').Value;
        mtModuleFormsForm.Value   := Qry.FieldByName('Form').Value;
        mtModuleFormsIssue.Value  := Qry.FieldByName('Issue').Value;
        mtModuleForms.Post;

        Qry.Next;
      end;
    finally
      mtModuleForms.EndBatch;
    end;
  finally
    Qry.Close;
  end;

  // Create Form Tests from the Issue Tests using a Query

  Qry.Open('SELECT DISTINCT Issue, Descrip, Test FROM mtIssueTests ORDER BY Issue, Test, Descrip');
  try
    mtFormTests.Open;
    mtFormTests.BeginBatch;
    try
      while not Qry.Eof do
      begin
        mtFormTests.Append;
        mtFormTestsIssue.Value   := Qry.FieldByName('Issue').Value;
        mtFormTestsDescrip.Value := Qry.FieldByName('Descrip').Value;
        mtFormTestsTest.Value    := Qry.FieldByName('Test').Value;
        mtFormTests.Post;

        Qry.Next;
      end;
    finally
      mtFormTests.EndBatch;
    end;
  finally
    Qry.Close;
  end;

  mtIssues.AfterScroll  := mtIssuesAfterScroll;
  mtModules.AfterScroll := mtModulesAfterScroll;

  mtIssues.First;
  mtModules.First;
end;

procedure TTestRegisteredForms.mtIssuesAfterScroll(DataSet: TDataSet);
begin
  mtIssueTests.Filtered := false;
  mtIssueTests.Filter   := 'Issue = ''' + mtIssuesIssue.AsString + '''';
  mtIssueTests.Filtered := true;

  dbgIssueTests.Refresh;

  mtIssueTests.First;
end;

procedure TTestRegisteredForms.mtModulesAfterScroll(DataSet: TDataSet);
begin
  mtModuleForms.AfterScroll := nil;
  try
    mtModuleForms.Filtered := false;
    mtModuleForms.Filter   := 'Module = ''' + mtModulesModule.AsString + '''';
    mtModuleForms.Filtered := true;
  finally
    mtModuleForms.AfterScroll := mtModuleFormsAfterScroll;
  end;

  mtModuleForms.First;
end;

procedure TTestRegisteredForms.mtModuleFormsAfterScroll(DataSet: TDataSet);
begin
  mtFormTests.Filtered := false;
  mtFormTests.Filter   := 'Issue = ''' + mtModuleFormsIssue.AsString + '''';
  mtFormTests.Filtered := true;

  mtFormTests.Refresh;

  mtFormTests.First;
end;

procedure TTestRegisteredForms.dbgFormTestsDblClick(Sender: TObject);
begin
  TTestRepo.ExecTest(mtFormTestsIssue.AsString + '-' + mtFormTestsTest.AsString);
end;

procedure TTestRegisteredForms.dbgIssuesColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  mtIssues.Filtered := false;
  mtIssues.Filter   := 'Issue like ''%' + UpperCase(Value) + '%''';
  mtIssues.Filtered := true;
end;

procedure TTestRegisteredForms.dbgIssueTestsDblClick(Sender: TObject);
begin
  TTestRepo.ExecTest(mtIssueTestsIssue.AsString + '-' + mtIssueTestsTest.AsString);
end;

end.

