unit WC_6148;

interface

implementation

uses
  TestReg,
  System.Variants,
  Budgets,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Dialogs,
  SysUtils;

procedure Test1;
var
  a : Real;
begin
  a := GetBudget;
  showmessage(floattostr(a));
end;

procedure Test2;
var
  AQry: TFDQuery;
begin
  AQry := TFDQuery.Create(nil);
  AQry.SQL.Text := 'select id, descrip || (  || code || ) as descrip from budgets order by descrip || ( || code || )';
  DoBudgets(AQry);
  AQry.Free;
end;

initialization

  TTestRepo.RegisterTest('WC-6148', 'Gl', 'FrmBudgets', 'GetBudget', Test1, 1);
  TTestRepo.RegisterTest('WC-6148', 'Gl', 'FrmBudgets', 'DoBudgets', Test2, 2);
end.
