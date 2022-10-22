unit WC_5440;
//WC-5440 Cd - Cdallinv
interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  cdallinv;

procedure Test1;
begin
  DoCDAllInvoices('','');
end;

initialization

  TTestRepo.RegisterTest('WC-5440', 'Cd', 'cdallinv', 'DoCDAllInvoices', Test1,1);

end.
