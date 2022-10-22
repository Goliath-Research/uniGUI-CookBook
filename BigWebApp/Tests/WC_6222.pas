unit WC_6222;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ict_kanban_base;

procedure Test1;
begin
  TFrmKanban_Base.DoShow('test',88,28);
end;

initialization

  TTestRepo.RegisterTest('WC-6222', 'Vendor', 'ict_kanban_base', 'DoShow', Test1, 1);

end.
