unit WC_8252;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  CheckClosed;

procedure TestTCheckPostReceived;
begin
  TCheckPostReceived.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8252', 'Receive', 'CheckClosed','Create', TestTCheckPostReceived);

end.
