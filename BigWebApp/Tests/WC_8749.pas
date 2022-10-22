unit WC_8749;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  tchscrn_choose;

procedure Test1;
var
 Form: TFrmTouchScreenChoose;
begin
   Form := TFrmTouchScreenChoose.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8749', 'Touchscreen', 'tchscrn_choose', 'create', Test1);
end.
