unit WC_6767;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  hrevent_types;

procedure Test1;
begin
  DoHREventTypes;
end;

initialization

  TTestRepo.RegisterTest('WC-6767', 'Iqhr', 'hrevent_types', 'DoHREventTypes', Test1);

end.
