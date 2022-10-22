unit WC_7823;

interface

implementation

uses
  TestReg,
  PO_Chk;

procedure Test1;
var
  PO_ID: Real;
begin
  PO_ID := 7423;
  CheckPONotApproved(PO_ID, ['Approved','Not Approved','Denied']);
end;

initialization

  TTestRepo.RegisterTest('WC_7823', 'PO', 'PO_Chk', 'CheckPONotApproved', Test1);

end.
