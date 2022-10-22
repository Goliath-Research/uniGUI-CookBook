unit WC_6029;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ArchiveTranslog;

procedure Test1;
begin
  DoShowModal;
end;

initialization

TTestRepo.RegisterTest('WC-6029', 'Eiqarchiver', 'ArchiveTranslog', 'DoShowModal', Test1, 1);

end.
