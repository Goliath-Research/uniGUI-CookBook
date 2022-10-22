unit IQUniDlgSample;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniGroupBox,
  uniEdit, IQUniEditor, IQUniEditorDlg;

type
  TIQUniDialogA = class(TUniForm, IIQEditorDialog)
    UniGroupBox1: TUniGroupBox;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
  private
    { Private declarations }
    procedure SetEditorInstance(Editor: TIQUniCustomEditor);
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


{ TIQUniDialog }

function TIQUniDialogA.GetDialogResult: Integer;
begin
  Result := ModalResult;
end;

function TIQUniDialogA.GetDialogValue: Variant;
begin
  Result := UniEdit1.Text + ' ' + UniEdit2.Text;
end;

procedure TIQUniDialogA.SetDialogValue(const Value: Variant);
begin
  UniEdit1.Text := Value;
end;

procedure TIQUniDialogA.SetEditorInstance(Editor: TIQUniCustomEditor);
begin
//
end;

initialization
  RegisterClass(TIQUniDialogA);

end.
