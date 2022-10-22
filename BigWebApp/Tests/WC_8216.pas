unit WC_8216;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  qsnd_clone;

procedure Test1;
begin
  TFrmQSndClone.DoShowModal(220);
end;

initialization

TTestRepo.RegisterTest('WC-8216', 'Quote', 'qsnd_clone', 'DoShowModal', Test1, 1);

end.
