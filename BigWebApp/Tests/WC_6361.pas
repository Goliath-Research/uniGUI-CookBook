unit WC_6361;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  inv_relieve_params;

procedure Test;
begin
  TFrmInvRelieveParams.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6361', 'Inv', 'inv_relieve_params', 'DoShowModal', Test);

end.
