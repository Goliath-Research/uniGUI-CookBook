unit WC_5392;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  ChangeInvoiceNo,
  BRMain;

procedure Test1;
var
  LFfrmBR_Main: TFfrmBR_Main;
begin

    LFfrmBR_Main := TFfrmBR_Main.Create(uniGUIApplication.UniApplication);
  end;

initialization

TTestRepo.RegisterTest('WC_5392', 'Br', 'BRMain', 'create', Test1);

end.
