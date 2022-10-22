unit WC_6244;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Buyercod;

procedure Test1;
begin
  DoBuyerCode;
end;

initialization

  TTestRepo.RegisterTest('WC-6244', 'Inv', 'Buyercod', 'DoBuyerCode', Test1, 1);

end.
