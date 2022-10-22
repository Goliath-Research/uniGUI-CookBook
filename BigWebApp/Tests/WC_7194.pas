unit WC_7194;

interface

implementation

uses
  TestReg,
  color_group,
  Dialogs;

procedure Test1;
begin
  TFrmColorGroup.DoShow;
end;


initialization

  TTestRepo.RegisterTest('WC-7194', 'Iqsys', 'color_group', 'DoShow', Test1);

end.
