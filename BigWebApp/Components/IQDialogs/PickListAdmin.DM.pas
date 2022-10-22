unit PickListAdmin.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MainModule, uniGUIBaseClasses, uniGUIClasses, uniImageList, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList;

type
  TdmPickListAdmin = class(TDataModule)
    IQPickLists: TFDQuery;
    IQPickListsID: TBCDField;
    IQPickListsNAME: TStringField;
    IQPickListsROWID: TStringField;
    QryPickListItem: TFDQuery;
    QryPickListItemID: TBCDField;
    QryPickListItemTEXT: TStringField;
    QryPickListItemSEQ: TBCDField;
    QryPickListItemPICKLIST_ID: TBCDField;
    dsPickLists: TDataSource;
    dsPickListItems: TDataSource;
    alPickLists: TActionList;
    acMoveUp: TAction;
    acMoveDown: TAction;
    ilAdapter: TUniImageListAdapter;
    ilPickLists: TUniNativeImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure IQPickListsAfterPost(DataSet: TDataSet);
    procedure acMoveUpExecute(Sender: TObject);
    procedure acMoveDownExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPickListAdmin: TdmPickListAdmin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  IQCore.Interfaces;

procedure TdmPickListAdmin.DataModuleCreate(Sender: TObject);
begin
  IQPickLists.Open;
  QryPickListItem.Open;
end;

procedure TdmPickListAdmin.DataModuleDestroy(Sender: TObject);
begin
  QryPickListItem.Close;
  IQPickLists.Close;
end;

procedure TdmPickListAdmin.IQPickListsAfterPost(DataSet: TDataSet);
var
  RowID : string;
begin
  RowID := DataSet.FieldByName('ROWID').AsString;
  DataSet.Refresh;
  DataSet.Locate('ROWID', RowID, []);
end;

procedure TdmPickListAdmin.acMoveUpExecute(Sender: TObject);
var
  PickList : IIQPickList;
begin
  PickList := UniMainModule. UserIQModel.PickLists.GetNewObj;
  PickList.Load(dsPickLists.DataSet);
  with QryPickListItem do
    if not Bof then
    begin
      PickList.SetListItemPos(FieldByName('ID').AsInteger, RecNo, -1);
      Refresh;
    end;
end;

procedure TdmPickListAdmin.acMoveDownExecute(Sender: TObject);
var
  PickList : IIQPickList;
begin
  PickList := UniMainModule. UserIQModel.PickLists.GetNewObj;
  PickList.Load(dsPickLists.DataSet);
  with QryPickListItem do
    if not Eof then
    begin
      PickList.SetListItemPos(FieldByName('ID').AsInteger, RecNo, +1);
      Refresh;
    end;
end;

end.
