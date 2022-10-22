unit WC_8434;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  SalAPInv;

procedure Test1;
begin
  DoShowAPCommissionsInvoices;
end;

initialization

  TTestRepo.RegisterTest('WC-8434', 'Salesmen', 'SalAPInv', 'DoShowAPCommissionsInvoices', Test1);

end.
