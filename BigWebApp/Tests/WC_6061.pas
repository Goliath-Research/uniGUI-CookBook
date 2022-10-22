unit WC_6061;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FaReviewDept;

procedure Test1;
begin
  DoReviewDepr;
end;

initialization

  TTestRepo.RegisterTest('WC-6061', 'Fa', 'FaReviewDept', 'DoReviewDepr', Test1, 1);

end.
