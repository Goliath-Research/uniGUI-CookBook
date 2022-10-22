unit IQUniEditorRegEditors;

interface

procedure IQRegisterEditors;

implementation

uses
  Classes, DB, uniGUIClasses, IQUniEditor, uniDateTimePicker, uniDBDateTimePicker, uniSpinEdit, uniMemo,
  uniDBMemo, uniCheckBox, uniDBComboBox, uniDBCheckBox, uniComboBox,
  uniDBLookupComboBox, uniDBLookupListBox, IQUniEditorDlgMemo, IQUniEditorDlgPickDataSet,
  uniEdit, uniDBEdit, uniDBRadioGroup, uniDBText, uniHTMLMemo, IQUniGrid,
  uniDBGrid;

procedure IQRegisterEditors;
begin
  RegisterClass(TIQUniGridControl);  // actuall we need to register it as an editor/component
  IQRegisterEditor('IQEditor', TIQUniEditor);
  IQRegisterEditor('Datetime Picker', TUniDateTimePicker);
  IQRegisterEditor('DB Datetime Picker', TUniDBDateTimePicker);
  IQRegisterEditor('Spin Editor', TUniSpinEdit);
  IQRegisterEditor('Checkbox', TUniCheckBox);
  IQRegisterEditor('DB Checkbox', TUniDBCheckBox);
  IQRegisterEditor('Memo', TUniMemo);
  IQRegisterEditor('DB Memo', TUniDBMemo);
  IQRegisterEditor('DBLookupComboBox', TUniDBLookupComboBox);
  IQRegisterEditor('PickDataSet', TIQUniEditorDlgPickDataSet);
  IQRegisterEditor('DBLookupListBox', TUniDBLookupListBox);
  IQRegisterEditor('ComboBox', TUniComboBox);
  IQRegisterEditor('Edit', TUniEdit);
  IQRegisterEditor('NumberEdit', TUniNumberEdit);
  IQRegisterEditor('DBEdit', TUniDBEdit);
  IQRegisterEditor('DBNumberEdit', TUniDBNumberEdit);
  IQRegisterEditor('IQMemoDialog', TIQUniEditorDlgMemo);
  IQRegisterEditor('DBEdit Formatted', TUniDBFormattedNumberEdit);
  IQRegisterEditor('DBRadioGroup', TUniDBRadioGroup);
  IQRegisterEditor('HTMLMemo', TUniHTMLMemo);
  IQRegisterEditor('DBMLMemo', TUniDBHTMLMemo);
  IQRegisterEditor('DBGrid', TUniDBGrid);
//  IQRegisterEditor('DBText', TUniDBText);
end;

end.
