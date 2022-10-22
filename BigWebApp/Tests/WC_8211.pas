unit WC_8211;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  q_set_mat;

procedure Test;
begin
  TFrmQSetMatInfo.DoShow(21);
end;

initialization

  TTestRepo.RegisterTest('WC-8211', 'Quote', 'q_set_mat', 'DoShow', Test);

end.
