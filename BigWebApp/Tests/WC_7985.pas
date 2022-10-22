unit WC_7985;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  prod_assoc_workcenters;

procedure TestDoShowModal;
var
  AParent_ID : Real;
  AIsArchived: Boolean;
begin
  AParent_ID := 7477;
  AIsArchived:= False;
  TFrmProdAssociatedWorkcenters.DoShowModal( AParent_ID, AIsArchived );
end;

initialization

  TTestRepo.RegisterTest('WC-7985', 'Prod', 'prod_assoc_workcenters', 'DoShowModal', TestDoShowModal);

end.
