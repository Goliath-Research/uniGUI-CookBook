unit _dUsersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniToolBar,
  Interfaces;

type
  TdUsersForm = class(TUniForm, IUsersEditorForm)
    dbnCustomers: TUniDBNavigator;
    dbgCustomers: TUniDBGrid;
    barTop: TUniToolBar;
    btnToggleAdmin: TUniToolButton;
    cntUsers: TUniToolButton;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
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

procedure TdUsersForm.UniFormCreate(Sender: TObject);
begin
  uniMainModule.OnCreateUsersEditor(Sender);
end;

procedure TdUsersForm.UniFormDestroy(Sender: TObject);
begin
  uniMainModule.OnDestroyUsersEditor(Sender);
end;

end.
