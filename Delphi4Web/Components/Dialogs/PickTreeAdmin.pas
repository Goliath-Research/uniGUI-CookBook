unit PickTreeAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniToolBar, uniGUIBaseClasses, uniTreeView,
  uniImageList, uniSplitter,
  uniBasicGrid, uniDBGrid, uniDBNavigator, uniPanel, Data.DB,
  PickTreeAdmin.DM,
  IQCore.Interfaces;

type
  TPickTreeAdminForm = class(TUniForm)
    UniTreeView1: TUniTreeView;
    UniToolBar1: TUniToolBar;
    btnNewChild: TUniToolButton;
    btnDelete: TUniToolButton;
    btnEdit: TUniToolButton;
    pnlPickLists: TUniPanel;
    tbPickLists: TUniToolBar;
    dbnavPickLists: TUniDBNavigator;
    grdPickTrees: TUniDBGrid;
    pnlPickTreeNodes: TUniPanel;
    btnUp: TUniToolButton;
    btnDown: TUniToolButton;
    UniSplitter1: TUniSplitter;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function PickTreeAdm: TPickTreeAdminForm;

implementation

uses
  uniGUIApplication,
  MainModule,
  uniGUIDialogs,
  IQCore.PickTree;

{$R *.dfm}

function PickTreeAdm: TPickTreeAdminForm;
begin
  Result := TPickTreeAdminForm(UniMainModule.GetFormInstance(TPickTreeAdminForm));
end;

procedure TPickTreeAdminForm.UniFormCreate(Sender: TObject);
begin
  dmPickTreeAdmin := TdmPickTreeAdmin.Create(nil, UniTreeView1);

  btnUp.Action        := dmPickTreeAdmin.acMoveUp;
  btnDown.Action      := dmPickTreeAdmin.acMoveDown;
  btnNewChild.Action  := dmPickTreeAdmin.acNewChild;
  btnEdit.Action      := dmPickTreeAdmin.acEditCaption;
  btnDelete.Action    := dmPickTreeAdmin.acDelete;
end;

procedure TPickTreeAdminForm.UniFormDestroy(Sender: TObject);
begin
  FreeAndNil(dmPickTreeAdmin);
end;

end.
