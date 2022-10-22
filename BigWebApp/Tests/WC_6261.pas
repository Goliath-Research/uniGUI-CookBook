unit WC_6261;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  FireDAC.Comp.Client,
  INV_GL;

procedure Test1;
begin
  DoINVGL(562);
end;

initialization

  TTestRepo.RegisterTest('WC-6261', 'Inv', 'INV_GL', 'DoINVGL', Test1);

end.
