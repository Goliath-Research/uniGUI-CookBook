unit WC_8166;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  Q_SelectMfgType;

procedure Test1;
begin
  TFrmSelectionQuoteMfgType.Create(UniGUIApplication.UniApplication);
end;

initialization

TTestRepo.RegisterTest('WC-8166', 'Quote', 'Q_SelectMfgType', 'Create', Test1);

end.
