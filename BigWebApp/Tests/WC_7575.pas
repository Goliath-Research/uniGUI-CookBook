unit WC_7575;
// WC-7575 Packslip - Psnewloc
interface

implementation

uses
  MainModule,
  UniGUIApplication,
  TestReg,
  Psnewloc;

procedure Test;
begin
   CreateNewLocation(20465);
end;

initialization

  TTestRepo.RegisterTest('WC-7575', 'Packslip', 'Psnewloc', 'CreateNewLocation', Test);

end.
