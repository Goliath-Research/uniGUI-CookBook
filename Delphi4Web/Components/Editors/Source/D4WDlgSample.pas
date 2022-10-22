unit D4WDlgSample;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniGroupBox,
  uniEdit, D4WEditor, D4WEditorDlg;

type
  TD4WDialogA = class(TUniForm, ID4WEditorDialog)
    UniGroupBox1: TUniGroupBox;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
  private
    { Private declarations }
    procedure SetEditorInstance(Editor: TD4WCustomEditor);
    function GetDialogResult: Integer;
    function GetDialogValue: Variant;
    procedure SetDialogValue(const Value: Variant);
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


{ TD4WDialogA }

function TD4WDialogA.GetDialogResult: Integer;
begin
  Result := ModalResult;
end;

function TD4WDialogA.GetDialogValue: Variant;
begin
  Result := UniEdit1.Text + ' ' + UniEdit2.Text;
end;

procedure TD4WDialogA.SetDialogValue(const Value: Variant);
begin
  UniEdit1.Text := Value;
end;

procedure TD4WDialogA.SetEditorInstance(Editor: TD4WCustomEditor);
begin
//
end;

initialization
  RegisterClass(TD4WDialogA);

end.
