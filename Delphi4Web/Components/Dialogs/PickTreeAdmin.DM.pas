unit PickTreeAdmin.DM;

interface

uses
  System.SysUtils, System.Classes,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniImageList, uniGUIBaseClasses, uniGUIClasses,
  uniTreeView,
  MainModule,
  IQCore.Interfaces,
  IQCore.PickTree;

type
  TdmPickTreeAdmin = class(TDataModule)
    IQPickTrees: TFDQuery;
    dsPickTrees: TDataSource;
    IQPickTreesID: TBCDField;
    IQPickTreesNAME: TStringField;
    IQPickTreesLEVELS: TBCDField;
    IQPickTreesPICKTREENODE_ID: TBCDField;
    IQPickTreesROWID: TStringField;
    alPickTrees: TActionList;
    ilPickTrees: TUniNativeImageList;
    ilAdapter: TUniImageListAdapter;
    acMoveUp: TAction;
    acMoveDown: TAction;
    acNewChild: TAction;
    acEditCaption: TAction;
    acDelete: TAction;
    procedure DataModuleDestroy(Sender: TObject);
    procedure IQPickTreesAfterPost(DataSet: TDataSet);
    procedure IQPickTreesAfterScroll(DataSet: TDataSet);
    procedure acMoveUpExecute(Sender: TObject);
    procedure acMoveDownExecute(Sender: TObject);
    procedure acNewChildExecute(Sender: TObject);
    procedure acEditCaptionExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FPickTree     : IIQPickTree;
    FUniTreeView  : TUniTreeView;

    procedure LoadTreeNodes;
    procedure SelectNode(aNodeID : integer);
  public
    { Public declarations }

    constructor Create(aOwner : TComponent; aUniTreeView : TUniTreeView);

    property UniTreeView  : TUniTreeView read FUniTreeView write FUniTreeView;
  end;

var
  dmPickTreeAdmin: TdmPickTreeAdmin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  UITypes,
  Vcl.Dialogs,
  uniGUIDialogs;

procedure TdmPickTreeAdmin.acDeleteExecute(Sender: TObject);
var
  tn : TWebTreeNode;
  id : integer;
begin
  tn := UniTreeView.Selected as TWebTreeNode;
  if tn <> nil then
  begin
    if tn.Level = 0 then
      uniGUIDialogs.MessageDlg('Cannot delete the root!', mtInformation, [mbOk])
    else
    begin
      id := integer(tn.Data);

      FPickTree.DelTreeNode(id);

      LoadTreeNodes;
    end;
  end;
end;

procedure TdmPickTreeAdmin.acEditCaptionExecute(Sender: TObject);
var
  tn     : TWebTreeNode;
  NodeID : integer;
begin
  tn     := UniTreeView.Selected as TWebTreeNode;
  NodeID := integer(tn.Data);

  Prompt
  (
    'New caption:',
    UniTreeView.Selected.Text,
    TMsgDlgType.mtInformation,
    mbOKCancel,
    procedure(Sender: TComponent; AResult: Integer; AText: string)
    begin
      if AResult = mrOK then
      begin
        tn.Text := AText;

        FPickTree.UpdTreeNode(NodeID, AText);

        LoadTreeNodes;

        SelectNode(NodeID);
      end;
    end
  );
end;

procedure TdmPickTreeAdmin.acMoveDownExecute(Sender: TObject);
var
  tn : TWebTreeNode;
begin
  tn := UniTreeView.Selected as TWebTreeNode;
  if (tn <> nil) and (tn.Level <> 0) then
  begin

  end;
end;

procedure TdmPickTreeAdmin.acMoveUpExecute(Sender: TObject);
var
  tn  : TWebTreeNode; // Selected Node
  pn  : TWebTreeNode; // Previous Node (sibling)
  tmp : TWebTreeNode;
  idx : integer;
begin
  UniTreeView.BeginUpdate;
  try
    tn := UniTreeView.Selected as TWebTreeNode;
    if (tn <> nil) and not tn.IsFirstNode then
    begin
      // Cannot move up the first node

      idx := tn.Id - TWebTreeNode(tn.Parent).Id - 1;
      if idx <> 0 then
      begin
        pn  := tn.Parent.Item[idx - 1] as TWebTreeNode;
        tmp := pn;
        pn  := tn;
        tn  := tmp;

        UniTreeView.Selected := pn;
      end;
    end;
  finally
//    UniTreeView1.Refresh;
    UniTreeView.EndUpdate;
  end;
end;

procedure TdmPickTreeAdmin.acNewChildExecute(Sender: TObject);
var
  tn : TWebTreeNode;
  ParentID : integer;
  NodeID   : integer;
begin
  tn := UniTreeView.Selected as TWebTreeNode;
  if tn <> nil then
  begin
    ParentID := integer(tn.Data);
    NodeID := FPickTree.AddTreeNode(ParentID, 'New Node');

    LoadTreeNodes;

    SelectNode(NodeID);
  end;
end;

constructor TdmPickTreeAdmin.Create(aOwner: TComponent; aUniTreeView: TUniTreeView);
begin
  inherited Create(aOwner);

  FUniTreeView := aUniTreeView;
  IQPickTrees.Open;
end;

procedure TdmPickTreeAdmin.DataModuleDestroy(Sender: TObject);
begin
  IQPickTrees.Close;
end;

procedure TdmPickTreeAdmin.IQPickTreesAfterPost(DataSet: TDataSet);
var
  RowID : string;
begin
  RowID := DataSet.FieldByName('ROWID').AsString;
  DataSet.Refresh;
  DataSet.Locate('ROWID', RowID, []);
end;

procedure TdmPickTreeAdmin.IQPickTreesAfterScroll(DataSet: TDataSet);
begin
  if not Assigned(FUniTreeView) then
    Exit;

  UniTreeView.Items.Clear;
  UniTreeView.BeginUpdate;
  try
    if (DataSet.State = dsBrowse) and not (DataSet.Bof and DataSet.Eof) then
    begin
      FPickTree := UniMainModule.UserIQModel.PickTrees.NewObj;
      FPickTree.Load(DataSet);

      FPickTree.LoadTreeNodes(UniTreeView);
    end;
  finally
    UniTreeView.EndUpdate;
  end;
end;

procedure TdmPickTreeAdmin.LoadTreeNodes;
begin
  UniTreeView.BeginUpdate;
  try
    UniTreeView.Items.Clear;

    if FPickTree <> nil then
      FPickTree.LoadTreeNodes(UniTreeView);
  finally
    UniTreeView.EndUpdate;
  end;
end;

procedure TdmPickTreeAdmin.SelectNode(aNodeID: integer);
var
  i : integer;
  n : TWebTreeNode;
begin
  for i := 0 to UniTreeView.Items.Count - 1 do
  begin
    n := UniTreeView.Items[i] as TWebTreeNode;

    if integer(n.Data) = aNodeID then
    begin
      UniTreeView.Selected := n;
      UniTreeView.Refresh;
      break;
    end;
  end;
end;

end.
