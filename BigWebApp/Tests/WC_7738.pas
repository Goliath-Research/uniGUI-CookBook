unit WC_7738;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  PM_cloneprompt;

procedure TestTFrmClonePrompt;
var AEqno,ADescrip : String;
AShowDocuments,
  AShowInventory,
  AShowParts,
  AShowComponents,
  AResetTaskUnits: Boolean;
begin
   AEqno := '258';
   ADescrip := 'IQMS';
   AShowDocuments := TRUE;
  AShowInventory := TRUE;
  AShowParts := TRUE;
  AShowComponents := TRUE;
  AResetTaskUnits := TRUE;
  DoCloneEquipmentPrompt(AEqno,ADescrip,AShowDocuments,AShowInventory,AShowParts,AShowComponents,AResetTaskUnits);
end;

initialization

  TTestRepo.RegisterTest('WC-7738','PM', 'PM_cloneprompt', 'DoCloneEquipmentPrompt', TestTFrmClonePrompt);

end.
