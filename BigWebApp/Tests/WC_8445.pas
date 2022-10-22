unit WC_8445;

interface

implementation

uses
  MainModule,
  TestReg,
  ud_query_base;
procedure Test1;
begin
  TFrmUD_QueryBase.DoShow('');

end;

initialization

  TTestRepo.RegisterTest('WC_8445', 'Sanalys', 'ud_query_base', 'DoShow', Test1);

end.
