unit WC_7653;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PRDDRang;

procedure Test1;
var
  D1,D2: TDateTime;
begin
  if DoSelectDDRange(D1,D2) then
    Showmessage(formatdatetime('dd/mm/yyyy', D1) + '  ' +formatdatetime('dd/mm/yyyy', D2))
  else
    Showmessage('Cancelled');
end;

initialization

  TTestRepo.RegisterTest('WC-7653', 'Payroll', 'PRDDRang', 'DoSelectDDRange', Test1, 1);

end.
