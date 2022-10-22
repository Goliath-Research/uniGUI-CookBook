unit D4WDlgMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniMemo,
  D4WEditorDlg, D4WEditor;

type
  TD4WDlgMemoForm = class(TUniForm, ID4WEditorDialog)
    UniMemo1: TUniMemo;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
  private
    { Private declarations }
    procedure SetDialogValue(const Value: Variant);
    function GetDialogResult: Integer;
    function GetDialogValue: Variant;
    procedure SetEditorInstance(Editor: TD4WCustomEditor);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TD4WDlgMemoForm }

function TD4WDlgMemoForm.GetDialogResult: Integer;
begin
  Result := ModalResult;
end;

function TD4WDlgMemoForm.GetDialogValue: Variant;
begin
  Result := UniMemo1.Text;
end;

procedure TD4WDlgMemoForm.SetDialogValue(const Value: Variant);
begin
  UniMemo1.Text := Value;
end;

procedure TD4WDlgMemoForm.SetEditorInstance(Editor: TD4WCustomEditor);
begin
//
end;

initialization
  RegisterClass(TD4WDlgMemoForm);
end.
