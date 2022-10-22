unit WC_7818;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  POChkRec;

procedure Test1;
begin
  CheckPO_IfReceived(4631);
end;

procedure Test2;
begin
  CheckPODetail_IfReceived(576, 4631);
end;

initialization

  TTestRepo.RegisterTest('WC-7818', 'Po', 'POChkRec', 'CheckPO_IfReceived', Test1, 1);
  TTestRepo.RegisterTest('WC-7818', 'Po', 'POChkRec', 'CheckPODetail_IfReceived', Test2, 2);

end.
