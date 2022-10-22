unit WC_7780;

interface

implementation

uses
  TestReg,
  System.Variants,
  PO_Share,
  pm_bom_pmeqmt_prompt;

procedure Test1;
begin
  TFrmPMBomEquipPrompt.DoShowModal(15);
end;

initialization

  TTestRepo.RegisterTest('WC-7780', 'Pm', 'pm_bom_pmeqmt_prompt', 'DoShowModal', Test1);
end.
