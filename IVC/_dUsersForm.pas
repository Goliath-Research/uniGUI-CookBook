unit _dUsersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar, uniEdit, uniButton,
  Interfaces,
  UsersDM;

type
  TdUsersForm = class(TUniForm, IUsersEditorForm)
    dbnCustomers: TUniDBNavigator;
    dbgCustomers: TUniDBGrid;
    barTop: TUniToolBar;
    btnToggleAdmin: TUniToolButton;
    cntUsers: TUniToolButton;
    edtNewPassword: TUniEdit;
    btnSetPassword: TUniButton;
    procedure btnSetPasswordClick(Sender: TObject);
  private
    { Private declarations }
  public

    procedure ShowAsModal;
  end;

function dUsersForm: TdUsersForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function dUsersForm: TdUsersForm;
begin
  Result := TdUsersForm(UniMainModule.GetFormInstance(TdUsersForm));
end;

procedure TdUsersForm.ShowAsModal;
begin
  ShowModal;
end;

procedure TdUsersForm.btnSetPasswordClick(Sender: TObject);
begin
  dmUsers.SetPassword(edtNewPassword.Text);
  edtNewPassword.Text := '';
end;

end.
