unit WC_8918;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  vendor_assoc_oem;

procedure Test1;
begin
  TFrmAssociatedOEM.DoShowModal(47625);
end;

initialization

  TTestRepo.RegisterTest('WC-8918', 'Wrkorder', 'vendor_assoc_oem', 'DoShowModal', Test1, 1);

end.
