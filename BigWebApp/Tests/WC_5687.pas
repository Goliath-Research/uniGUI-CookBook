unit WC_5687;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  crm_rooms;

procedure TestDoShow;
begin
  TFrmCRMRooms.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5687', 'Crm', 'crm_rooms', 'DoShow', TestDoShow);

end.
