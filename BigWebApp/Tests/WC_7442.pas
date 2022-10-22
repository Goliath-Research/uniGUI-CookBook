unit WC_7442;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  Item_Sel;

procedure Test1;
var
 Form: TFrmItemSelect;
 AMenuItem: string;
begin
   Form := TFrmItemSelect.create(uniGUIApplication.uniApplication);
   AMenuItem := 'Test';
   TFrmItemSelect.MenuItem :=  AMenuItem;
   TFrmItemSelect.show;
end;

initialization

  TTestRepo.RegisterTest('WC-7442', 'Oe', 'Item_Sel', 'create', Test1);
end.
