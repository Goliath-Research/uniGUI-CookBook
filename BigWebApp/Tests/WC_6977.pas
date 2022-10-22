unit WC_6977;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  qk_third_party;

procedure Test;
begin
  TQuickAddThirdParty.Create(UniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-6977', 'Iqshipman',  'qk_third_party', 'Create', Test);
end.
