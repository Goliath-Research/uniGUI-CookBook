unit WC_7430;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CAR_ECO_Exist;

procedure TestTFrmCAR_ECO_Exist;
begin
  ShowCAR_ECO_Exist(85);
end;

initialization

  TTestRepo.RegisterTest('WC-7430', 'OE', 'CAR_ECO_Exist', 'ShowCAR_ECO_Exist', TestTFrmCAR_ECO_Exist);

end.
