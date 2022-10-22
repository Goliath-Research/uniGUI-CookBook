unit WC_7434;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  ChkOeBlanketQty;

procedure TestTCheckOeBlanketQty;
begin
  TCheckOeBlanketQty.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7434', 'Oe', 'ChkOeBlanketQty', 'Create', TestTCheckOeBlanketQty);

end.
