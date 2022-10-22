unit WC_7429;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CAR_ECO_Chk;

procedure TestTFrmCar_Eco_ExistsException;
begin
   CheckCAR_ECO_Exists(147789);
end;

initialization

  TTestRepo.RegisterTest('WC-7429', 'OE', 'CAR_ECO_Chk', 'CheckCAR_ECO_Exists', TestTFrmCar_Eco_ExistsException);

end.
