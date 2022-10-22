unit WC_6293;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  FireDAC.Comp.Client,
  ItemInfo;

procedure Test1;
begin
  DoShowItemInfo(1655);
end;

initialization

  TTestRepo.RegisterTest('WC-6293', 'Inv', 'ItemInfo', 'DoShowItemInfo', Test1);

end.
