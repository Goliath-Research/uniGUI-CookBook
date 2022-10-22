unit WC_7435;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  ConfPoChange;

procedure TestTFrmConfPOChange;
begin
  TFrmConfPOChange.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7435', 'Oe', 'ConfPoChange', 'Create', TestTFrmConfPOChange);

end.
