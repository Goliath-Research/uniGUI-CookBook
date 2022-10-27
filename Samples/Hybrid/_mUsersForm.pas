unit _mUsersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniBasicGrid, uniDBGrid, unimDBListGrid, unimDBGrid, uniGUIBaseClasses,
  uniDBNavigator, unimDBNavigator, uniToolBar, unimToolbar;

type
  TmUsersForm = class(TUnimForm)
    dbgUsers: TUnimDBGrid;
    barUsers: TUnimToolBar;
    btnToggleAdmin: TUnimToolButton;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimToolButton1: TUnimToolButton;
    dbnUsers: TUnimDBNavigator;
    procedure UnimFormCreate(Sender: TObject);
    procedure UnimFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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

procedure TmUsersForm.UnimFormCreate(Sender: TObject);
begin
  uniMainModule.OnCreateUsersEditor(Sender);
end;

procedure TmUsersForm.UnimFormDestroy(Sender: TObject);
begin
  UniMainModule.OnDestroyUsersEditor(Sender);
end;

end.
