unit WC_5681;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  crm_ref_list;

procedure TestDoPromptHasReferences;
var
  strList:TStringList;
begin
  strList := TStringList.Create;
  strList.Add('Test 1');
  strList.Add('Test 2');
  strList.Add('Test 3');
  strList.Add('Test 4');
  strList.Add('Test 5');
  DoPromptHasReferences(strList);
end;

initialization

  TTestRepo.RegisterTest('WC-5681', 'CRM', 'crm_ref_list', 'DoPromptHasReferences', TestDoPromptHasReferences);

end.
