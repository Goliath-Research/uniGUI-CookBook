unit WC_6233;

interface

implementation

uses
  TestReg,
  System.Variants,
  ict_truck_rate;

procedure TestDoShow;
begin
  TFrmICT_TruckRate.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-6233', 'ict ', 'FrmICT_TruckRate', 'DoShow', TestDoShow);
end.
