unit WC_8446;

interface

implementation

uses
  MainModule,
  TestReg,
  ud_query_editor_base,
  Classes;
procedure Test1;
var
  tmp : TStringList;
begin
  try
    tmp:=Tstringlist.Create();
    tmp.Add('');
    if TFrmUD_QueryEditorBase.DoShowModal(15,tmp) then
  finally
    tmp.Free;
  end;

end;

initialization

  TTestRepo.RegisterTest('WC_8446', 'Sanalys', 'ud_query_editor_base', 'DoShowModal', Test1);

end.
