unit WC_5174;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  ICA_PO_Receipts;

procedure Test1;
begin
  if Do_ICA_Select_PO_Receipts(2) then
    ShowMessage('Success!');
end;

initialization

  TTestRepo.RegisterTest('WC-5174', 'Ap', 'ICA_PO_Receipts', 'Do_ICA_Select_PO_Receipts', Test1);

end.
