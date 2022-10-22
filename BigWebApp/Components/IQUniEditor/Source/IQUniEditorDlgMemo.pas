unit IQUniEditorDlgMemo;

interface

uses
  Classes,
  uniGUIForm,
  IQUniEditorDlg;

type
  TIQUniEditorDlgMemo = class(TIQUniCustomEditorDlg)
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

{ TIQUniEditorDlgMemo }

function TIQUniEditorDlgMemo.DialogClassName: string;
begin
  Result := 'TUniDlgMemoForm';
end;

procedure TIQUniEditorDlgMemo.DoBeforeCreateDialog;
begin
  if not Assigned(Field) then
    raise Exception.Create('Error, field is nil');
end;

end.
