unit _mUsersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniBasicGrid, uniDBGrid, unimDBListGrid, unimDBGrid, uniGUIBaseClasses,
  uniDBNavigator, unimDBNavigator, uniToolBar, unimToolbar,
  uniEdit, unimEdit, uniButton, unimButton,
  Interfaces,
  UsersDM;

type
  TmUsersForm = class(TUnimForm, IUsersEditorForm)
    dbgUsers: TUnimDBGrid;
    barUsers: TUnimToolBar;
    btnToggleAdmin: TUnimToolButton;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimToolButton1: TUnimToolButton;
    dbnUsers: TUnimDBNavigator;
    pnlNewPassword: TUnimContainerPanel;
    edtNewPassword: TUnimEdit;
    btnSetPassword: TUnimButton;
    procedure btnSetPasswordClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowAsModal;
  end;

function mUsersForm: TmUsersForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function mUsersForm: TmUsersForm;
begin
  Result := TmUsersForm(UniMainModule.GetFormInstance(TmUsersForm));
end;

procedure TmUsersForm.ShowAsModal;
begin
  ShowModal;
end;

procedure TmUsersForm.btnSetPasswordClick(Sender: TObject);
begin
  dmUsers.SetPassword(edtNewPassword.Text);
  edtNewPassword.Text := '';
end;

end.
