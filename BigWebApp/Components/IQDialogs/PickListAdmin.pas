unit PickListAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniImageList, uniToolBar,
  uniPanel, uniBasicGrid, uniDBGrid, uniDBNavigator, uniSplitter,
  PickListAdmin.DM, Data.DB;

type
  TPickListAdminForm = class(TUniForm)
    pnlPickLists: TUniPanel;
    dbnavPickLists: TUniDBNavigator;
    tbPickLists: TUniToolBar;
    grdPickLists: TUniDBGrid;
    pnlPickListItems: TUniPanel;
    tbPickListItems: TUniToolBar;
    dbnavPickListItems: TUniDBNavigator;
    grdPickListItems: TUniDBGrid;
    btnMoveUp: TUniToolButton;
    btnMoveDown: TUniToolButton;
    UniSplitter1: TUniSplitter;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function PickListAdm: TPickListAdminForm;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function PickListAdm: TPickListAdminForm;
begin
  Result := TPickListAdminForm(UniMainModule.GetFormInstance(TPickListAdminForm));
end;

procedure TPickListAdminForm.UniFormCreate(Sender: TObject);
begin
  dmPickListAdmin := TdmPickListAdmin.Create(nil);

  btnMoveUp.Action    := dmPickListAdmin.acMoveUp;
  btnMoveDown.Action  := dmPickListAdmin.acMoveDown;
end;

procedure TPickListAdminForm.UniFormDestroy(Sender: TObject);
begin
  FreeAndNil(dmPickListAdmin);
end;

end.
