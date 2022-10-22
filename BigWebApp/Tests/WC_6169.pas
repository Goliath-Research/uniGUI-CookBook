unit WC_6169;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  ref_code;

procedure Test1;
begin
  DoRefCode;
end;

initialization

  TTestRepo.RegisterTest('WC-6169', 'Gl', 'Ref_code', 'DoRefCode', Test1);

end.
