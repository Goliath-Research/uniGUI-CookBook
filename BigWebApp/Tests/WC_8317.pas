unit WC_8317;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  System.Classes, //TStringList
  rma_pick_labels;

procedure Test1;
var
  SL : TStringList;
  I : integer;
  S : string;
begin
  S := '';
  SL := TStringList.Create;
  try
    TFrmRMA_PickLabels.DoShowModal(SL,1,1,1);
    for I := 0 to SL.Count-1 do
      S := S + SL.Strings[I] + #13#10;
    ShowMessage(S);
  finally
    SL.Free;
  end;




end;

initialization

  TTestRepo.RegisterTest('WC-8317', 'Rma', 'rma_pick_labels', 'DoShowModal', Test1, 1);

end.
