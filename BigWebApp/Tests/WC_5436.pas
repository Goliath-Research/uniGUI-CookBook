unit WC_5436;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CDVendorAging;

procedure Test1;
begin
  DoCdVendorAging(34523)
end;

initialization

  TTestRepo.RegisterTest('WC-5436', 'Cd', 'CDVendorAging', 'DoCdVendorAging', Test1);

end.
