unit WC_5354;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Bom_SameInv;

procedure TestDoShow;
begin
  TFrmBomSameArinvt.DoShow(147169);
end;

initialization
  TTestRepo.RegisterTest('WC-5354', 'Bom',  'Bom_SameInv', 'DoShow( AArinvt_ID: Real )', TestDoShow);
end.
