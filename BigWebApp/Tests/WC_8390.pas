unit WC_8390;

interface

implementation

uses
  MainModule,
  TestReg,
  OraDirectorySetup,
  uniGUIApplication;
procedure Test1;

begin
   TFrmOraDirectorySetup.execute('','');
end;

initialization

  TTestRepo.RegisterTest('WC_8390', 'Rtpcmon', 'OraDirectorySetup', 'Execute', Test1);

end.
