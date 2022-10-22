unit WC_5330;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  BOMToRFQ;

procedure TestDoBOMToRFQ;
begin
  DoBOMToRFQ(1234);
end;

initialization

  TTestRepo.RegisterTest('WC-5330', 'Bom', 'BOMToRFQ', 'DoBOMToRFQ', TestDoBOMToRFQ);

end.
