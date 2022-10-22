unit WC_5678;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_recur_prompt;

procedure Test1;
var ASelectedIndex: Integer;
begin
  if DoPromptRecSaveOption(ASelectedIndex) then
    showmessage(IntToStr(ASelectedIndex));
end;

initialization

  TTestRepo.RegisterTest('WC-5678', 'CRM', 'crm_recur_prompt', 'DoPromptRecSaveOption', Test1);

end.
