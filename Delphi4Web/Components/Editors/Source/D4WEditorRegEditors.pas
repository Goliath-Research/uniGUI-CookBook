unit D4WEditorRegEditors;

interface

procedure D4WRegisterEditors;

implementation

uses
  Classes, DB, uniGUIClasses, D4WEditor, uniDateTimePicker, uniDBDateTimePicker, uniSpinEdit, uniMemo,
  uniDBMemo, uniCheckBox, uniDBComboBox, uniDBCheckBox, uniComboBox,
  uniDBLookupComboBox, uniDBLookupListBox, D4WEditorDlgMemo, D4WEditorDlgPickDataSet,
  uniEdit, uniDBEdit, uniDBRadioGroup, uniDBText, uniHTMLMemo, D4W.HyperGrid,
  uniDBGrid;

procedure D4WRegisterEditors;
begin
  RegisterClass(TD4WHyperGrid);  // actuall we need to register it as an editor/component
  D4WRegisterEditor('Editor', TD4WEditor);
  D4WRegisterEditor('Datetime Picker', TUniDateTimePicker);
  D4WRegisterEditor('DB Datetime Picker', TUniDBDateTimePicker);
  D4WRegisterEditor('Spin Editor', TUniSpinEdit);
  D4WRegisterEditor('Checkbox', TUniCheckBox);
  D4WRegisterEditor('DB Checkbox', TUniDBCheckBox);
  D4WRegisterEditor('Memo', TUniMemo);
  D4WRegisterEditor('DB Memo', TUniDBMemo);
  D4WRegisterEditor('DBLookupComboBox', TUniDBLookupComboBox);
  D4WRegisterEditor('PickDataSet', TD4WEditorDlgPickDataSet);
  D4WRegisterEditor('DBLookupListBox', TUniDBLookupListBox);
  D4WRegisterEditor('ComboBox', TUniComboBox);
  D4WRegisterEditor('Edit', TUniEdit);
  D4WRegisterEditor('NumberEdit', TUniNumberEdit);
  D4WRegisterEditor('DBEdit', TUniDBEdit);
  D4WRegisterEditor('DBNumberEdit', TUniDBNumberEdit);
  D4WRegisterEditor('MemoDialog', TD4WEditorDlgMemo);
  D4WRegisterEditor('DBEdit Formatted', TUniDBFormattedNumberEdit);
  D4WRegisterEditor('DBRadioGroup', TUniDBRadioGroup);
  D4WRegisterEditor('HTMLMemo', TUniHTMLMemo);
  D4WRegisterEditor('DBMLMemo', TUniDBHTMLMemo);
  D4WRegisterEditor('DBGrid', TUniDBGrid);
//  D4WRegisterEditor('DBText', TUniDBText);
end;

end.
