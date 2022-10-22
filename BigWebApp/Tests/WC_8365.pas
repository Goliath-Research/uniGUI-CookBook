unit WC_8365;

interface

implementation

uses
  TestReg,
  System.Variants,
  rt_histogram_base;

procedure Test1;
begin
  TFrmRTHistogramBase.DoShow( 2 );
end;

initialization

  TTestRepo.RegisterTest('WC-8365', 'Rt', 'FrmRTHistogramBase', 'DoShow', Test1);
end.
