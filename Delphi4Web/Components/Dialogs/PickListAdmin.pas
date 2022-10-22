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

end.
