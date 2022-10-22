unit IQUniEditorReg;

interface

procedure Register;

implementation

uses
  Classes, DesignIntf, IQUniEditor, IQUniEditorDlgSample,
  TreeIntf, IQUniGrid, IQUniEditorDlgMemo, IQUniEditorDlgPickDataSet,
  IQModuleFormDesigner;


procedure Register;
begin
  RegisterComponents
  (
    'IQUniControls',
    [
      TIQUniEditor,
      TIQUniEditorDlgA,
      TIQUniGridControl,
      TIQUniEditorDlgMemo,
      TIQUniEditorDlgPickDataSet,
      TIQUniModuleFormDesigner
    ]
  );

  RegisterSprigType(TIQUniGridControl, TComponentSprig);  // avoid frame's sub controls from being edited in IDE

  UnlistPublishedProperty(TIQUniGridControlComponents, 'Tag');
end;

end.
