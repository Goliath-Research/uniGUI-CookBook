unit WC_6649;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  EdiConfDel;

procedure Test1;
begin
  DeleteOrNo;
end;

initialization

  TTestRepo.RegisterTest('WC-6649', 'Iqedi', 'EdiConfDel', 'DeleteOrNo', Test1);

end.
