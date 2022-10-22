unit WC_7295;

interface

implementation

uses
  TestReg,
  VMasterPage;

procedure Test1;
begin
  TFrmPage_Master.ViewEdit;
end;

initialization

  TTestRepo.RegisterTest('WC-7295', 'Iqvoice', 'VMasterPage', 'ViewEdit', Test1);

end.
