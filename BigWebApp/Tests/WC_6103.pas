unit WC_6103;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  AvDtl_BL;

procedure Test1;
begin
  DoCreate(1,Date,1);
end;

initialization

  TTestRepo.RegisterTest('WC-6103', 'Fgavail', 'AvDtl_BL', 'DoCreate', Test1, 1);

end.
