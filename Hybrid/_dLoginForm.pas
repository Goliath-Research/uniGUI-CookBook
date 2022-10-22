unit _dLoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniFieldSet,
  uniEdit, uniPanel, uniButton;

type
  TdLoginForm = class(TUniLoginForm)
    UniFieldSet1: TUniFieldSet;
    edtUsername: TUniEdit;
    edtPassword: TUniEdit;
    UniFieldContainer1: TUniFieldContainer;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    UniContainerPanel1: TUniContainerPanel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function dLoginForm: TdLoginForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function dLoginForm: TdLoginForm;
begin
  Result := TdLoginForm(UniMainModule.GetFormInstance(TdLoginForm));
end;

procedure TdLoginForm.btnOkClick(Sender: TObject);
begin
  if uniMainModule.Login(edtUsername.Text, edtPassword.Text, true) then
    ModalResult := mrOk
  else
    ShowMessage('Invalid credentials!');
end;

initialization
  RegisterAppFormClass(TdLoginForm);

end.
