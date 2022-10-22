unit WC_7251;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Tloption;

procedure TestTFrmToolingOptions;
begin
  DoToolingOptions;
end;

initialization

  TTestRepo.RegisterTest('WC-7251', 'Iqtool', 'Tloption', 'DoToolingOptions', TestTFrmToolingOptions);

end.
