unit D4WEditorDlgMemo;

interface

uses
  Classes,
  uniGUIForm,
  D4WEditorDlg;

type
  TD4WEditorDlgMemo = class(TD4WCustomEditorDlg)
  protected
    function DialogClassName: string; override;
    procedure DoBeforeCreateDialog; override;
  published
    property OnDialogResult;
    property DataField;
    property DataSource;
  end;

implementation

uses
  SysUtils,
  DB;

{ TD4WEditorDlgMemo }

function TD4WEditorDlgMemo.DialogClassName: string;
begin
  Result := 'TUniDlgMemoForm';
end;

procedure TD4WEditorDlgMemo.DoBeforeCreateDialog;
begin
  if not Assigned(Field) then
    raise Exception.Create('Error, field is nil');
end;

end.
