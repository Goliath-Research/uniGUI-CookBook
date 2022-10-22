unit WC_6235;

interface

implementation

uses
  TestReg,
  ict_wizard;

procedure Test1;
begin
  TFrmICT_Wizard.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-6235', 'ICT', 'ict_wizard', 'DoShow', Test1);

end.
