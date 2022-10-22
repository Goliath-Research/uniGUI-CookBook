unit WC_8218;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  qsnd_where_used;

procedure Test1;
begin
  TFrmQSndWhereUsed.DoShowModal(267);
end;

initialization

TTestRepo.RegisterTest('WC-8218', 'Quote', 'qsnd_where_used', 'DoShowModal', Test1, 1);

end.
