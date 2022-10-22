unit WC_7122;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  spc_gage_linearity;

procedure Test1;
var
 Form: TFrmSPCGageLinearity;
begin
   Form := TFrmSPCGageLinearity.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7122', 'Iqspc', 'spc_gage_linearity', 'create', Test1);
end.
