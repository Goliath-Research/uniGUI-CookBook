unit WC_6171;

interface

implementation

uses
  MainModule,
  TestReg,
  subacct,
  uniGUIApplication,
  IQMS.Common.DataConst,
  FireDAC.Comp.Client;
procedure Test1;

var
table1:TFDTable;
begin
  table1:=TFDTable.Create(uniapplication);
  table1.ConnectionName:=cnstFDConnectionName;
  table1.TableName:='GLSUB_ACCT_TYPE';
  DoSubAccounts(table1);
end;

initialization

  TTestRepo.RegisterTest('WC_6171', 'Gl', 'subacct', 'DoSubAccounts', Test1);

end.
