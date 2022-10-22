unit WC_6310;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Qk_Inv,
  uniGUIApplication;

procedure Test1;
begin
  TQuickAddRawArinvt.create(uniGUIApplication.UniApplication).show;
end;

initialization

  TTestRepo.RegisterTest('WC-6310', 'Inv', 'Qk_Inv', 'create', Test1);

end.
