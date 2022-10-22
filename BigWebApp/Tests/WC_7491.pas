unit WC_7491;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oe_estimate_bol_weight;

procedure Test1;
begin
  if TFrmEstimateBOLWeight.DoShowModal(1) then
    Showmessage('TRUE') else
    Showmessage('FALSE');
end;

initialization

  TTestRepo.RegisterTest('WC-7491', 'OE', 'oe_estimate_bol_weight', 'DoShowModal', Test1, 1);

end.
