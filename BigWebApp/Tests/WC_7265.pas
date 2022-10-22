unit WC_7265;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  tl_clone;

procedure Test1;
var
  AProjectNumber: String;
  AProjectName: String;
  AUDForm, AIntDoc, AExtDoc: Boolean;
begin
   DoCloneProjectPrompt(AProjectNumber,AProjectName,AUDForm, AIntDoc, AExtDoc);
end;

initialization

  TTestRepo.RegisterTest('WC-7265', 'Iqtool', 'tl_clone', 'DoCloneProjectPrompt', Test1);

end.
