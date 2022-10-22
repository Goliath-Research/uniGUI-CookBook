unit WC_7970;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  ProdEmp;

procedure TestDoShow;

begin
  DoProdEmpHours(47);
end;

initialization

  TTestRepo.RegisterTest('WC-7970', 'Prod', 'ProdEmp', 'DoProdEmpHours', TestDoShow);

end.
