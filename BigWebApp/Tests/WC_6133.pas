unit WC_6133;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Jpostall;

procedure Test1;
var
  S: string;
  R: Real;
  D: TDateTime;
  B: Boolean;
begin
  S := '';
  R := 1;
  D := Date;
  B := GetGJPostAll(S, R, D);
  ShowMessage(
   'Result=' + BoolToStr(B, True) +#13#10+
    'S=' + S +#13#10+
    'R=' + FloatToStr(R) +#13#10+
    'D=' + formatdatetime('dd/mm/yyyy', D) +#13#10 );

end;

initialization

TTestRepo.RegisterTest('WC-6133', 'Gj', 'Jpostall', 'GetGJPostAll', Test1, 1);

end.
