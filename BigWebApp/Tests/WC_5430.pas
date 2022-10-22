unit WC_5430;
//WC-5430 Cd - CDConf
interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  CDConf;

procedure Test1;
begin
  TFrmCDConf.create(uniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-5430', 'Cd', 'CDConf', 'Create', Test1,1);

end.
