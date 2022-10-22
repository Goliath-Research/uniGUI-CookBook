unit IQUniDlgMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniMemo,
  IQUniEditorDlg, IQUniEditor;

type
  TUniDlgMemoForm = class(TUniForm, IIQEditorDialog)
    UniMemo1: TUniMemo;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
  private
    { Private declarations }
    procedure SetDialogValue(const Value: Variant);
    function GetDialogResult: Integer;
    function GetDialogValue: Variant;
    procedure SetEditorInstance(Editor: TIQUniCustomEditor);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TUniDlgMemoForm }

function TUniDlgMemoForm.GetDialogResult: Integer;
begin
  Result := ModalResult;
end;

function TUniDlgMemoForm.GetDialogValue: Variant;
begin
  Result := UniMemo1.Text;
end;

procedure TUniDlgMemoForm.SetDialogValue(const Value: Variant);
begin
  UniMemo1.Text := Value;
end;

procedure TUniDlgMemoForm.SetEditorInstance(Editor: TIQUniCustomEditor);
begin
//
end;

initialization
  RegisterClass(TUniDlgMemoForm);
end.
