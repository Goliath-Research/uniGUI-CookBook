unit D4WEditorReg;

interface

procedure Register;

implementation

uses
  Classes, DesignIntf, D4WEditor, D4WEditorDlgSample,
  TreeIntf, D4W.HyperGrid, D4WEditorDlgMemo, D4WEditorDlgPickDataSet,
  D4WModuleFormDesigner,
  D4W.DataControllerList,
  D4W.MenuToActionList,
  D4W.MenuToActionListEditor;


procedure Register;
begin
  RegisterComponents
  (
    'D4WControls',
    [
      TD4WDataControllerLinkList,
      TD4WMenuToActionList,
      TD4WEditor,
      TD4WEditorDlgA,
      TD4WHyperGrid,
      TD4WEditorDlgMemo,
      TD4WEditorDlgPickDataSet,
      TD4WModuleFrmDsgnr
    ]
  );

  RegisterComponentEditor(TD4WMenuToActionList, TD4WMenuToActionListEditor);

  RegisterSprigType(TD4WHyperGrid, TComponentSprig);  // avoid frame's sub controls from being edited in IDE
  RegisterSprigType(TD4WModuleFrmDsgnr, TComponentSprig);

  UnlistPublishedProperty(TD4WHyperGridComponents, 'Tag');
end;

end.
