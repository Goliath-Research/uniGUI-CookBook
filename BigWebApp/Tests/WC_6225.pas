unit WC_6225;

interface

implementation

uses
  TestReg,
  ict_main;

procedure Test1;
begin
  TFrmICT_Main.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-6225', 'ICT', 'ict_main', 'DoShow', Test1);

end.
