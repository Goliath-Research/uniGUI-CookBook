unit WC_6301;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  NonAlloc;

procedure Test1;
var
 Form: TNonAllocateTable;
begin
  Form := TNonAllocateTable.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6301', 'Inv', 'NonAlloc', 'create', Test1);
end.
