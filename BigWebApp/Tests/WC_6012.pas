unit WC_6012;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  dng_assoc_group;

procedure Test1;
var
  AGroupID: Real;
  AAssociated: TAssociatedWith;
begin
  ShowAssocGroup(147536,awCustomers);
end;

initialization

TTestRepo.RegisterTest('WC-6012', 'Dunning', 'dng_assoc_group','ShowAssocGroup', Test1);

end.
