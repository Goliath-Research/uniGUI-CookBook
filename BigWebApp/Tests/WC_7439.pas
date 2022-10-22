unit WC_7439;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Fob3rdParty;

procedure TestTFrmFobThirdParty;
begin
   Do3rdPartyBilling;
end;

initialization

  TTestRepo.RegisterTest('WC-7439', 'OE', 'Fob3rdParty', 'Do3rdPartyBilling', TestTFrmFobThirdParty);

end.
