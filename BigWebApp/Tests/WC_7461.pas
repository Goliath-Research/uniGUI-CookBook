unit WC_7461;

interface

implementation

uses
  TestReg,
  Oe_Create_WO;

procedure Test1;
begin
  Do_Oe_Create_WO(530);
end;

initialization

  TTestRepo.RegisterTest('WC-7461', 'Oe', 'Oe_Create_WO', 'DoShow', Test1, 1);
end.
