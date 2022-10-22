unit WC_5288;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  System.Classes, // TStringList
  AssyTrack_PickToDispatch;

procedure Test1;
var
  R: Real;
  SL: TStringList;
  I: integer;
  S: string;
begin
  S := '';
  SL := TStringList.Create;
  try

    if TFrmAssyTrackPickToDispatch.DoShowModal(3629, SL, R) then
    begin
      S := 'ASeq = ' + FloatToStr(R) + #13#10;
      for I := 0 to SL.Count - 1 do
        S := S + SL.Strings[I] + #13#10;
      ShowMessage(S);
    end
    else
      ShowMessage('Cancelled');

  finally
    SL.Free;
  end;

end;

initialization

TTestRepo.RegisterTest('WC-5288', 'AssyTrack', 'AssyTrack_PickToDispatch', 'DoShowModal', Test1, 1);

end.
