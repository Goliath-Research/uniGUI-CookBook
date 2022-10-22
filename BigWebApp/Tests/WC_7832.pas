unit WC_7832;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  System.classes,
  PItemSel;

procedure Test1;
var
cMenuItem:String;
MainForm:TComponent;
begin
     SelectPOItem('test',MainForm);
end;

initialization

  TTestRepo.RegisterTest('WC-7832', 'Po', 'Pitemsel', 'SelectPOItem', Test1);

end.
