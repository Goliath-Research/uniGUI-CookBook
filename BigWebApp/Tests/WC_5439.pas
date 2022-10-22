unit WC_5439;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CD_Void;

procedure Test1;
var
  AReason:String;
  AVoidedBy:String;
  AVoidedDate:TDateTime;
  APeriodID:Real;
begin
  AReason := 'test';
  AVoidedBy := 'test1';
  AVoidedDate := 2-3-2016;
  APeriodID := 313;
  DoVoidCD(AReason, AVoidedBy, AVoidedDate, APeriodID)
end;

initialization

  TTestRepo.RegisterTest('WC-5439', 'Cd', 'CD_Void', 'DoVoidCD', Test1);

end.
