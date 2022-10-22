unit WC_8547;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  Sd_rej;

procedure Test1;
var
  Options : TRejectOptions;
begin
  Options.RejectCode := 'test1';
  Options.RejectCodeID := 5;
  Options.Attribute := 'test2';
  Options.Cavity := 10;
  Options.Quantity := 20;
  Options.Comment := 'test3';
  Options.NonConformLocationID := 40;
  DoRejectPad(48,149328,Options);
end;

procedure Test2;
var
  Options : TRejectOptions;
begin
  Options.RejectCode := 'test1';
  Options.RejectCodeID := 5;
  Options.Attribute := 'test2';
  Options.Cavity := 10;
  Options.Quantity := 20;
  Options.Comment := 'test3';
  Options.NonConformLocationID := 40;
  TFrmSDRejectEdit.DoShowModal(48,149328,Options);
end;


initialization

  TTestRepo.RegisterTest('WC-8547', 'Shopdata', 'Sd_rej', 'DoRejectPad', Test1,1);
  TTestRepo.RegisterTest('WC-8547', 'Shopdata', 'Sd_rej', 'DoShowModal', Test2,2);
end.
