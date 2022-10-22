unit WC_8313;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  System.Classes, //TStringList
  Rma_UsePk;

procedure Test1;
var
  SL : TStringList;
  I : integer;
  S : string;
begin
  S := '';
  SL := TStringList.Create;
  try
      TFrmRmaUseMatPk.Execute(1, SL);
    for I := 0 to SL.Count-1 do
      S := S + SL.Strings[I] + #13#10;
    ShowMessage(S);
  finally
    SL.Free;
  end;

end;

initialization

  TTestRepo.RegisterTest('WC-8313', 'Rma', 'Rma_UsePk', 'Execute', Test1, 1);

end.
