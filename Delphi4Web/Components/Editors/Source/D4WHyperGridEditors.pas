unit D4WHyperGridEditors;

interface

uses
  Classes, Controls, SysUtils, DesignIntf, DesignEditors, Dialogs, WideStrings,
  DBReg, D4W.HyperGrid, ColnEdit;

implementation

uses
  uniGUIEditors, uniGUIAbstractClasses, uniDBGrid;

initialization
  RegisterPropertyEditor(TypeInfo(TControl), TUniBaseDBGridColumn, 'Editor', TDBGridEditorProperty);
  RegisterPropertyEditor(TypeInfo(TUniDBGridColumns), TD4WHyperGrid, 'Columns', TUniDBColumnsProperty);


end.
