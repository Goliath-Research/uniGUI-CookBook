unit IQCore.PickTree;

interface

uses
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj,
  UniGUIAbstractClasses,
  UniTreeView;

type

  TIQPickTrees = class(TIQObjs<IIQPickTree>, IIQPickTrees)
  end;

  TIQPickTree = class(TIQNamedObj, IIQPickTree)
  private
    FLevels     : integer;
    FRootNodeID : integer;
    FRootNode   : IIQPickTreeNode;

    function  GetLevels : integer;
    function  GetRootNode : IIQPickTreeNode;
    procedure SetLevels(val : integer);
  public
    procedure Load(aDataSet : TDataSet); override;
    procedure Save(aDataSet : TDataSet; aProc : TAssignFieldValuesProc = nil); override;

    procedure LoadTreeNodes(aOwner : TUniTreeView);
    // SaveTreeNodes updates Seq according to the current loaded tree
    procedure SaveTreeNodes(aOwner : TUniTreeView);
    function  AddTreeNode  (aParentID   : integer; aText : string) : integer;
    procedure DelTreeNode  (aTreeNodeID : integer);
    procedure UpdTreeNode  (aTreeNodeID : integer; aText : string);
  end;

implementation

uses
  SysUtils,
  MainModule,
  IQCore.PickTree.Node;

{ TIQPickTree }

function TIQPickTree.GetRootNode: IIQPickTreeNode;
begin
  Result := FRootNode;
end;

procedure TIQPickTree.Load(aDataSet: TDataSet);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.PickTreeDS;

  inherited Load(aDataSet);

  FLevels     := aDataSet.FieldByName('Levels'         ).AsInteger;
  FRootNodeID := aDataSet.FieldByName('PickTreeNode_ID').AsInteger;
end;

procedure TIQPickTree.Save(aDataSet: TDataSet; aProc : TAssignFieldValuesProc = nil);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.PickTreeDS;

  inherited Save
  (
    aDataSet,
    procedure
    begin
      aDataSet.FieldByName('Levels').AsInteger := FLevels;
    end
  );
end;

procedure TIQPickTree.SaveTreeNodes(aOwner: TUniTreeView);
var
  i : integer;
  n : TWebTreeNode;

  procedure CheckAndUpdateOrder(aNode : TWebTreeNode);
  var
    i : integer;
    n : TWebTreeNode;
    s : string;
    UpdateIsNeeded : boolean;
  begin
    if not aNode.HasChildren then
      Exit;

    UpdateIsNeeded := false;

    // n.ChildNodes is not public...
    // We need to iterate over aNode.Item[0]...
    i := 0;
    n := aNode.Item[i] as TWebTreeNode;
    s := '';
    while n <> nil do
    begin
      // If items are not in alphabetical order, update Seq
      if s > n.Text then
      begin
        UpdateIsNeeded := true;
        break;
      end;

      s := n.Text;
      Inc(i);
      n := aNode.Item[i] as TWebTreeNode;
    end;

    if UpdateIsNeeded then
    begin
      i := 0;
      n := aNode.Item[i] as TWebTreeNode;
      while n <> nil do
      begin
        TIQTreeNode.UpdateTreeNodeSeq(integer(n.Data), i + 1);

        Inc(i);
        n := aNode.Item[i] as TWebTreeNode;
      end;
    end;
  end;

begin
  // The tree editor should create, modify, or delete nodes
  // directly on the database.
  // This method should only update the Seq field in case the
  // order was modified.

  // Just in case, let's make sure we create any TWebTreeNode
  // without the NodeID (added to the tree, but not to the database).
  // We don't need to check the root node

  for i := 1 to aOwner.Items.Count - 1 do
  begin
    n := aOwner.Items[i] as TWebTreeNode;

    if integer(n.Data) = 0 then
      n.Data := pointer(AddTreeNode(integer(n.Parent.Data), n.Text));
  end;

  // Recursively ask to check nodes, level by level, looking for custom order
  // to update the Seq field

  CheckAndUpdateOrder(aOwner.Items[0] as TWebTreeNode);
end;

procedure TIQPickTree.LoadTreeNodes(aOwner : TUniTreeView);
var
  RootNodeID : integer;
begin
  if FRootNodeID <> 0 then
    RootNodeID := FRootNodeID
  else
    RootNodeID := GetRootNode.ID;

  TIQTreeNode.LoadTreeNodes(aOwner, RootNodeID);
end;

function TIQPickTree.AddTreeNode(aParentID: integer; aText: string): integer;
var
  tn : IIQPickTreeNode;
begin
  tn := TIQTreeNode.Create;
  tn.Text := aText;
  tn.ParentID := aParentID;

  tn.Save(nil);
  Result := tn.ID;
end;

procedure TIQPickTree.DelTreeNode(aTreeNodeID: integer);
begin
  TIQTreeNode.DelTreeNode(aTreeNodeID);
end;

function TIQPickTree.GetLevels: integer;
begin
  Result := FLevels;
end;

procedure TIQPickTree.SetLevels(val : integer);
begin
  FLevels := val;
end;

procedure TIQPickTree.UpdTreeNode(aTreeNodeID: integer; aText: string);
begin
  TIQTreeNode.UpdTreeNode(aTreeNodeID, aText);
end;

end.
