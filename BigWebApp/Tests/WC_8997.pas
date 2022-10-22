unit WC_8997;

interface

implementation

uses
  TestReg,
  wo_alloc_substitute;

procedure TestDoShowModal;
var
  Top_Workorder_BOM_ID, Workorder_BOM_ID, Substituted_Arinvt_ID: Real;
begin
  Top_Workorder_BOM_ID := 701;
  Workorder_BOM_ID := 700;
  Substituted_Arinvt_ID := 147193;
  TFrmWO_Alloc_Substitute.DoShowModal(Top_Workorder_BOM_ID, Workorder_BOM_ID, Substituted_Arinvt_ID);
end;

initialization

  TTestRepo.RegisterTest('WC-8997', 'Wrkorder ', 'wo_alloc_substitute', 'DoShowModal', TestDoShowModal);
end.
