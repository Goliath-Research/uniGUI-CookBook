unit IQCore.PickTree.Node;

interface

uses
  DB,
  IQCore.Interfaces,
  IQCore.Obj,
  UniGUIAbstractClasses,
  UniTreeView;

type

  TIQTreeNode = class(TIQObj, IIQPickTreeNode)
  private
    FText     : string;
    FSeq      : integer;
    FParentID : integer;
    FParent   : IIQPickTreeNode;

    function  GetText     : string;
    function  GetSeq      : integer;
    function  GetParentID : integer;
    function  GetParent   : IIQPickTreeNode;
    procedure SetText     (val : string);
    procedure SetSeq      (val : integer);
    procedure SetParentID (val : integer);
    procedure SetParent   (val : IIQPickTreeNode);
  protected
    procedure Save(aDataSet : TDataSet; aProc : TAssignFieldValuesProc = nil); override;
  public
    class procedure LoadTreeNodes    (aOwner : TUniTreeView; const aID : integer);
    class procedure DelTreeNode      (aTreeNodeID : integer);
    class procedure UpdTreeNode      (aTreeNodeID : integer; aText : string);
    class procedure UpdateTreeNodeSeq(aTreeNodeID : integer; aSeq : integer);
  end;

implementation

uses
  Math,
  Spring,
  Spring.Collections,
  MainModule;

{ TIQTreeNode }

class procedure TIQTreeNode.DelTreeNode(aTreeNodeID: integer);
var
  DataSetWasActive : boolean;
begin
  with UniMainModule.UserIQModel.TreeNodeDS do
  begin
    DataSetWasActive := Active;
    Active := true;
    try
      if Locate('ID', aTreeNodeID, []) then
      begin
        Delete;
        Refresh;
      end;
    finally
      Active := DataSetWasActive;
    end;
  end;
end;

class procedure TIQTreeNode.LoadTreeNodes(aOwner : TUniTreeView; const aID: integer);
var
  NodeID     : integer;
  NodeText   : string;
  NodeLevel  : integer;
  CurrNode   : TWebTreeNode;
  Parent     : TWebTreeNode;
  TreeNodes  : TWebTreeNodes;
begin
  with UniMainModule.UserIQModel do
  begin
    TreeNodeDS.Open;
    try
      if not TreeNodeDS.Locate('ID', aID, []) then
        Exit;

      TreeNodes := aOwner.Items as TWebTreeNodes;
      TreeNodes.Clear;

      CurrNode  := nil;

      DataServices.SetParamValue(QryTreeNodes, 'RootNode_ID', aID);
      QryTreeNodes.Open;
      try
        while not QryTreeNodes.Eof do
        begin
          NodeID    := QryTreeNodes.FieldByName('ID'   ).AsInteger;
          NodeText  := QryTreeNodes.FieldByName('Text' ).AsString;
          NodeLevel := QryTreeNodes.FieldByName('Level').AsInteger - 1;

          Parent := CurrNode;
          while (Parent <> nil) and (Parent.Level >= NodeLevel) do
            Parent := Parent.Parent as TWebTreeNode;
          CurrNode := TreeNodes.AddChild(Parent, NodeText) as TWebTreeNode;
          CurrNode.Data := pointer(NodeID);

          QryTreeNodes.Next;
        end;
      finally
        QryTreeNodes.Close;
      end;
    finally
      TreeNodeDS.Close;
    end;
  end;
end;

function TIQTreeNode.GetText: string;
begin
  Result := FText;
end;

function TIQTreeNode.GetParent: IIQPickTreeNode;
begin
  Result := FParent;
end;

function TIQTreeNode.GetParentID: integer;
begin
  if (FParentID = 0) and (FParent <> nil) then
    FParentID := FParent.ID;

  Result := FParentID;
end;

function TIQTreeNode.GetSeq: integer;
begin
  Result := FSeq;
end;

procedure TIQTreeNode.Save(aDataSet: TDataSet; aProc : TAssignFieldValuesProc = nil);
var
  DataSetWasActive : boolean;
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.TreeNodeDS;

  DataSetWasActive := aDataSet.Active;
  aDataSet.Active := true;
  try
    inherited Save
    (
      aDataSet,
      procedure
      begin
        aDataSet.FieldByName('Text'     ).AsString  := FText;
        aDataSet.FieldByName('Seq'      ).AsInteger := FSeq;
        aDataSet.FieldByName('Parent_ID').AsInteger := FParentID;
      end
    );
  finally
    aDataSet.Active := DataSetWasActive;
  end;
end;

procedure TIQTreeNode.SetText(val: string);
begin
  FText := val;
end;

class procedure TIQTreeNode.UpdateTreeNodeSeq(aTreeNodeID, aSeq: integer);
var
  DataSet : TDataSet;
  DataSetWasActive : boolean;
begin
  DataSet := UniMainModule.UserIQModel.TreeNodeDS;

  DataSetWasActive := DataSet.Active;
  DataSet.Active := true;
  try
    if not DataSet.Locate('ID', aTreeNodeID, []) then
      Exit;

    if not (DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
      DataSet.Edit;

    DataSet.FieldByName('Seq').AsInteger := aSeq;

    DataSet.Post;
  finally
    DataSet.Active := DataSetWasActive;
  end;
end;

class procedure TIQTreeNode.UpdTreeNode(aTreeNodeID: integer; aText: string);
var
  DataSet : TDataSet;
  DataSetWasActive : boolean;
begin
  DataSet := UniMainModule.UserIQModel.TreeNodeDS;

  DataSetWasActive := DataSet.Active;
  DataSet.Active := true;
  try
    if not DataSet.Locate('ID', aTreeNodeID, []) then
      Exit;

    if not (DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
      DataSet.Edit;

    DataSet.FieldByName('Text').AsString := aText;

    DataSet.Post;
  finally
    DataSet.Active := DataSetWasActive;
  end;
end;

procedure TIQTreeNode.SetParent(val: IIQPickTreeNode);
begin
  FParent := val;
end;

procedure TIQTreeNode.SetParentID(val: integer);
begin
  FParentID := val;
  if FParentID = 0 then
    FParent := nil;
end;

procedure TIQTreeNode.SetSeq(val: integer);
begin
  FSeq := val;
end;

end.
