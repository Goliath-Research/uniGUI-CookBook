unit _dOperatorsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar, uniEdit, uniButton,
  Interfaces,
  UsersDM;

type
  TdOperatorsForm = class(TUniForm, IOperatorsEditorForm)
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

function dOperatorsForm : TdOperatorsForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function dOperatorsForm : TdOperatorsForm;
begin
  Result := TdOperatorsForm(UniMainModule.GetFormInstance(TdOperatorsForm));
end;

procedure TdOperatorsForm.ShowAsModal;
begin
  ShowModal;
end;

procedure TdOperatorsForm.btnSetPasswordClick(Sender: TObject);
begin
  dmUsers.SetPassword(edtNewPassword.Text);
  edtNewPassword.Text := '';
end;

end.
