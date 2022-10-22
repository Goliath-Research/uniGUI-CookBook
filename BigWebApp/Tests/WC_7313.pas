unit WC_7313;

interface

implementation

uses
  TestReg,
  System.Variants,
  Intrcomp;

procedure TestDoIntercompany;
begin
  DoIntercompany;
end;

initialization

  TTestRepo.RegisterTest('WC-7313', 'Iqwin32 ', 'FrmIntercompany', 'DoIntercompany', TestDoIntercompany);
end.
