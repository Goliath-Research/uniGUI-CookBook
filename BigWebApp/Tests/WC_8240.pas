unit WC_8240;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CTP_Param;

procedure Test1;
begin
  if DoCTP_Params then
    Showmessage('OK') else
    Showmessage('Cancelled');
end;

initialization

  TTestRepo.RegisterTest('WC-8240', ' Rd', 'CTP_Param', 'DoCTP_Params', Test1, 1);

end.
