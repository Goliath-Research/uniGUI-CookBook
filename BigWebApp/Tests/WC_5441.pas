unit WC_5441;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CDConfig;

procedure Test1;
begin
  DOCDConfig
end;

initialization

  TTestRepo.RegisterTest('WC-5441', 'Cd', 'CDConfig', 'DOCDConfig', Test1);

end.
