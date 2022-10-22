unit WC_6028;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ArchiveBol;

procedure Test1;
begin
  DoShowModal(Date);
end;

initialization

TTestRepo.RegisterTest('WC-6028', 'Eiqarchiver', 'ArchiveBol', 'DoShowModal', Test1, 1);

end.
