unit _mOperatorsForm;

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
  TmOperatorsForm = class(TUnimForm, IOperatorsEditorForm)
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

function mOperatorsForm : TmOperatorsForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function mOperatorsForm : TmOperatorsForm;
begin
  Result := TmOperatorsForm(UniMainModule.GetFormInstance(TmOperatorsForm));
end;

procedure TmOperatorsForm.ShowAsModal;
begin
  ShowModal;
end;

procedure TmOperatorsForm.btnSetPasswordClick(Sender: TObject);
begin
  dmUsers.SetPassword(edtNewPassword.Text);
  edtNewPassword.Text := '';
end;

end.
