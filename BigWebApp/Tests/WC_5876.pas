unit WC_5876;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  Qk_Cust;

procedure TestCreate;
var
  LFrm: TQuickAddCustomer;
begin
  LFrm:= TQuickAddCustomer.Create(UniGuiApplication.UniApplication);
  LFrm.Show;
end;

procedure TestCreateWithParam;
var
  LFrm: TQuickAddCustomer;
begin
  LFrm:= TQuickAddCustomer.Create(UniGuiApplication.UniApplication);
  LFrm.DefaultStatusID:= 'Open';
  LFrm.Show;
end;

initialization
  TTestRepo.RegisterTest('WC-5876', 'Customer',  'QuickAddCustomer', 'Create', TestCreate, 1);
  TTestRepo.RegisterTest('WC-5876', 'Customer',  'QuickAddCustomer', 'Create With Params', TestCreateWithParam, 2);
end.
