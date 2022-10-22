unit WC_8156;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Q_Labor;

procedure Test1;
begin
  TFrmQuote_Labor.DoShowModal(nil);
end;

initialization

  TTestRepo.RegisterTest('WC-8156', 'Quote', 'Q_Labor', 'DoShowModal', Test1, 1);

end.
