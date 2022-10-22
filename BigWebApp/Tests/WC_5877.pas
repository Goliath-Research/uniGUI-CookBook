unit WC_5877;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  Data.DB,
  Qk_contact;

procedure Test1;
var
  a : Variant;
begin
  a := 'test';
  DoQuickAddContact(20368,a);
end;

initialization

  TTestRepo.RegisterTest('WC-5877', 'Customer', 'Qk_contact', 'DoQuickAddContact', Test1);

end.
