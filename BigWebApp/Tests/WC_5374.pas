unit WC_5374;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  bom_aux_equipment;

procedure Test1;
begin
  TFrmAuxiliaryEquipment.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5374', 'Bom', 'bom_aux_equipment', 'DoShow', Test1);

end.
