unit WC_6828;

interface

implementation

uses
  TestReg,
  TPD_Jump_PO,
  System.SysUtils;

procedure Test1;
var
  Week_Start: TDateTime;
begin
  Week_Start := StrToDateTime('05/29/2016');
  DoTPD_Jump_PO(147536, Week_Start);
end;

initialization

  TTestRepo.RegisterTest('WC_6828', 'Iqmps', 'TPD_Jump_PO', 'DoTPD_Jump_PO', Test1);
end.
