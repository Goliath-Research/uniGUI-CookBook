unit WC_6407;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  kb_control_mfg_demand;

procedure Test;
begin
  TFrmKB_ControlMfgDemand.DoShow(134);
end;

initialization

  TTestRepo.RegisterTest('WC-6407', 'Inv', 'kb_control_mfg_demand', 'DoShow', Test);

end.
