unit _dUsersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar,
  Interfaces,
  UsersDM;

type
  TdUsersForm = class(TUniForm, IUsersEditorForm)
    dbnCustomers: TUniDBNavigator;
    dbgCustomers: TUniDBGrid;
    barTop: TUniToolBar;
    btnToggleAdmin: TUniToolButton;
    cntUsers: TUniToolButton;
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

end.
