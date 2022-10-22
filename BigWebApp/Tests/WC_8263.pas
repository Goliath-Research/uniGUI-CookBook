unit WC_8263;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  Rec_Chk;

procedure Test;
begin
  CheckRecNotApproved(6627,'IQMS');
end;

initialization

  TTestRepo.RegisterTest('WC-8263', 'Receive', 'Rec_Chk', 'CheckRecNotApproved', Test);

end.
