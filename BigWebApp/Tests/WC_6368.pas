unit WC_6368;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  inv_spc_setup;

procedure Test;
var
  LFrmReceivingSPCSetup : TFrmReceivingSPCSetup;
  AArinvt_ID: Real;
begin
  LFrmReceivingSPCSetup.DoShowModal(AArinvt_ID);
end;

initialization

  TTestRepo.RegisterTest('WC-6368', 'Inv', 'inv_spc_setup', 'DoShowModal', Test);

end.
