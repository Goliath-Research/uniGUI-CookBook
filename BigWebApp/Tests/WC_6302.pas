unit WC_6302;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  NonConf;

procedure Test1;
var
 Form: TNonConformTable;
begin
  Form := TNonConformTable.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6302', 'Inv', 'NonConf', 'create', Test1);
end.
