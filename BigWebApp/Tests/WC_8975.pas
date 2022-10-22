unit WC_8975;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wc_optional_elem;

procedure Test1;
begin
  TFrmWorkCenterOptionalElements.DoShowModal(1);
end;

initialization

  TTestRepo.RegisterTest('WC-8975', 'Workcntr', 'wc_optional_elem', 'DoShowModal', Test1, 1);

end.
