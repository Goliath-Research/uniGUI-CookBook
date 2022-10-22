unit WC_8720;

interface

implementation

uses
  TestReg,
  tag_sel,
  Tag_share,
  System.SysUtils;

procedure Test1;
var
  Criteria: TTagInvSelectionCritera;
begin
  Criteria:= TTagInvSelectionCritera.Create( 0 );
  GetSelectionCriteria(Criteria );
end;

initialization

  TTestRepo.RegisterTest('WC-8720', 'Taginv', 'tag_sel', 'GetSelectionCriteria', Test1);
end.
