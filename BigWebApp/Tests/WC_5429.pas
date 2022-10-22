unit WC_5429;

interface

uses
  System.Classes;

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  mat_xcpt_suggested_acion_dlg;

procedure Test1;
var
  AList : TStringList;
begin
   AList := TStringList.Create;
   TFrmMatXcptSuggestedActionDlg.DoShowModal(AList);
   ShowMessage(AList[0]);
end;

initialization

  TTestRepo.RegisterTest('WC-5429', 'Capacity',  'mat_xcpt_suggested_acion_dlg', 'DoShowModal', Test1);

end.
