unit WC_5890;

interface

implementation

uses
  TestReg,
  SysUtils,
  Waterfall;

procedure Waterfalls;
begin
   DoSetupWaterfalls;
end;

initialization

  TTestRepo.RegisterTest('WC-5890', 'Customer', 'TFrmWaterfall_Setup', 'DoSetupWaterfalls', Waterfalls);

end.
