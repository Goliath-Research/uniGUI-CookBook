unit WC_5403;

interface

implementation

uses
  TestReg,
  System.StrUtils,
  System.Classes,
  uniGUIDialogs,
  DayHrs;

procedure Test1;
begin
  ShowMessage(IfThen( DoDayHrs( false ), 'OK', 'Cancel'));
end;

procedure Test2;
begin
  ShowMessage(IfThen( DoDayHrs( true ), 'OK', 'Cancel'));
end;

procedure Test3;
begin
  ShowMessage(IfThen( DoDayHrs( [ 'IDEAL_VS_EXISTING' ]), 'OK', 'Cancel'));
end;

procedure Test4;
var
  r : boolean;
  s : TStringlist;
begin
  r := DoDayHrs( false, s);
  try
    ShowMessage(IfThen(r, s.Text, 'Cancel'));
  finally
    s.Free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-5403', 'Capacity', 'DayHrs', 'DoDayHrs( false )'                  , Test1, 1);
  TTestRepo.RegisterTest('WC-5403', 'Capacity', 'DayHrs', 'DoDayHrs( true )'                   , Test2, 2);
  TTestRepo.RegisterTest('WC-5403', 'Capacity', 'DayHrs', 'DoDayHrs( [''IDEAL_VS_EXISTING''] )', Test3, 3);
  TTestRepo.RegisterTest('WC-5403', 'Capacity', 'DayHrs', 'DoDayHrs( false, AList )'           , Test4, 4);

end.
