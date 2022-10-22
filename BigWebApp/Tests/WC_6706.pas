unit WC_6706;

interface

implementation

uses
  TestReg,
  System.Classes,
  ForeConfirmCopy,
  ForeShare,
  System.SysUtils;

procedure Test1;
var
  LCopyPasteParams: TCopyPasteParams;
begin
  with LCopyPasteParams do
  begin
    Arinvt_ID_Src:= 147623;
    Arinvt_ID_Trg:= 147623;
    CutOffDate   := EncodeDate( 2014, 04, 1);
    Fore_Head_ID := 9;
  end;
  TFrmConfirmCopy.DoShowModal(LCopyPasteParams);
end;

initialization

  TTestRepo.RegisterTest('WC_6706', 'Iqforecast', 'ForeConfirmCopy', 'DoShowModal', Test1);

end.
