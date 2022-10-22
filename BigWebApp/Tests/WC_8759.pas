unit WC_8759;

interface

implementation

uses
  TestReg,
  tchscrn_menu_base,
  System.Classes;

procedure Test1;
var
  ButtonClickEvent: TNotifyEvent;
begin
  ButtonClickEvent := nil;
  TFrmTouchScreenMenuBase.DoShow(ButtonClickEvent);
end;

initialization

  TTestRepo.RegisterTest('WC-8759', 'Touchscreen', 'tchscrn_menu_base', 'DoShow', Test1);

end.
