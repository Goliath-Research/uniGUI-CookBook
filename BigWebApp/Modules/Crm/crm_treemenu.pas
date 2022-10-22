// WEB CONVERSION - look for TODO tag
unit crm_treemenu;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Registry,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniTreeView,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TTreeCargo = class
  private
    FMenuIndex: LongInt;
    FDescription: string;
  public
    CustomizeChecked: Boolean; //used by the customize tree view only
    property Description: string read FDescription write FDescription; //descriptive text
    property MenuIndex: LongInt read FMenuIndex write FMenuIndex;
    constructor Create(AIndex: Integer; ADescription: string = '');
  end;

type
  TCRMTreeMenuRegistry = class(TComponent)
  private const
    REG_PATH_MENU = '\Software\IQMS\IQWin32\IQCRM.EXE\FrmCRMMain\Tree Menu';
  strict private
    class function NodeRegPath(ATreeView: TUniTreeView; AIndex: Integer): string;
  public
    constructor Create(AOwner: TComponent); override;
    /// <summary>Get the user-defined text for the node. </summary>
    class function GetSavedNodeText(const ANodeName: string): string;
    /// <summary>Set the user-defined text for the node. </summary>
    class function SetSavedNodeText(const ANodeName, ANodeText: string): string;
    /// <summary> Apply the user-defined nodes to the tree view. </summary>
    class procedure ApplySavedTreeMenu(ATreeView: TUniTreeView; var AHasHiddenNodes: Boolean);
    /// <summary> Save the tree view, along with user-defined customizations. </summary>
    class procedure SaveTreeMenu(ATreeView: TUniTreeView);
    /// <summary> Store the last tree node index. </summary>
    class function GetLastTreeMenuIndex(AOwnerForm: TUniForm): Integer;
    /// <summary> Get the last tree node index. </summary>
    class procedure SetLastTreeMenuIndex(AOwnerForm: TUniForm; AIndex: Integer);
  end;

type
  TCloneTree = class
  strict private
    FSourceTreeView: TUniTreeView;
    FTargetTreeView: TUniTreeView;
    procedure CloneTreeNodes(ASourceNode, ATargetNodeParent: TUniTreeNode);
  public
    /// <summary> Clone one tree view to another. </summary>
    class procedure Execute(const ASourceTreeView: TUniTreeView; var ATargeTreeView: TUniTreeView);
    procedure CloneTree;
    property SourceTreeView: TUniTreeView read FSourceTreeView write FSourceTreeView;
    property TargetTreeView: TUniTreeView read FTargetTreeView write FTargetTreeView;
  end;

procedure ClearTreeView(ATreeView: TUniTreeView);

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

{$REGION 'Public methods'}


procedure ClearTreeView(ATreeView: TUniTreeView);
var
  AOnChange: TUniTVChangedEvent;
  //AOnChanging: TUniTVChangingEvent;
  i: Integer;
begin
  AOnChange := ATreeView.OnChange;
  try
    ATreeView.OnChange := nil;
    //AOnChanging := ATreeView.OnChanging;
    try
      //ATreeView.OnChanging := nil;
      ATreeView.Items.BeginUpdate;
      try
        for i := ATreeView.Items.Count - 1 downto 0 do
          if Assigned(ATreeView.Items[i].Data) then
          begin
            TObject(ATreeView.Items[i].Data).Free;
            ATreeView.Items[i].Data := nil;
          end;

        ATreeView.Items.Clear;
      finally
        ATreeView.Items.EndUpdate;
      end;
    finally
      //ATreeView.OnChanging := AOnChanging;
    end;
  finally
    ATreeView.OnChange := AOnChange;
  end;
end;

{$ENDREGION 'Public methods'}

{$REGION 'TTreeCargo' }


constructor TTreeCargo.Create(AIndex: Integer; ADescription: string = '');
begin
  MenuIndex := AIndex;
  Description := ADescription;
  CustomizeChecked := True;
end;

{$ENDREGION 'TTreeCargo' }

{$REGION 'TCRMTreeMenuRegistry' }


constructor TCRMTreeMenuRegistry.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

class procedure TCRMTreeMenuRegistry.ApplySavedTreeMenu(ATreeView: TUniTreeView;
  var AHasHiddenNodes: Boolean);
var
  APath, S: string;
  i: Integer;
  AOnChange: TUniTVChangedEvent;
  // AOnChanging: TTVChangingEvent;
begin
  AHasHiddenNodes := False; //initialize
  if Assigned(ATreeView) then
  begin
    AOnChange := ATreeView.OnChange;
    try
      ATreeView.OnChange := nil;
      //AOnChanging := ATreeView.OnChanging;
      try
        //ATreeView.OnChanging := nil;
        with TIQWebRegistry.CreateRO do //iqrgstry
          try
            RootKey := HKEY_CURRENT_USER;
            //If no ATreeView node has been created, then Exit routine.
            //We are displaying defaults.
            if OpenKey(REG_PATH_MENU, False) then
            begin
              for i := ATreeView.Items.Count - 1 downto 0 do
              begin
                APath := NodeRegPath(ATreeView, i);
                if (APath > '') and OpenKey(APath, False) then
                begin
                  S := Trim(ReadString('Text'));
                  if S > '' then
                    ATreeView.Items[i].Text := S;
                end
                else
                begin
                  if ATreeView.Items[i] <> nil then
                    ATreeView.Items.Delete( ATreeView.Items[i]);
                  AHasHiddenNodes := True;
                  //set this="yes, user has hidden items"
                end;
              end;
            end;
          finally
            Free;
          end;
      finally
        //ATreeView.OnChanging := AOnChanging;
      end;
    finally
      ATreeView.OnChange := AOnChange;
    end;
  end;
end;

class function TCRMTreeMenuRegistry.GetLastTreeMenuIndex(AOwnerForm: TUniForm): Integer;
begin
  if not IQMS.Common.RegFrm.IQRegIntegerScalarRead(AOwnerForm, 'CURRENT_MENU_NODE', Result) then
    Result := -1;
end;

class function TCRMTreeMenuRegistry.GetSavedNodeText(const ANodeName: string): string;
var
  APath, S: string;
begin
  //Returns the saved menu caption by name
  Result := '';
  APath := Format('%s\%s', [REG_PATH_MENU, ANodeName]);
  with TIQWebRegistry.CreateRO do //iqrgstry
    try
      RootKey := HKEY_CURRENT_USER;
      //If no TreeView node has been created, then Exit routine.
      //We are displaying defaults.
      if OpenKey(REG_PATH_MENU, False) and OpenKey(APath, False) then
        Result := Trim(ReadString('Text'));
    finally
      Free;
    end;
end;

class function TCRMTreeMenuRegistry.NodeRegPath(ATreeView: TUniTreeView; AIndex: Integer): string;
var
  AHex: string;
begin
  Result := '';
  if Assigned(ATreeView) and
    (ATreeView.Items.Count - 1 >= AIndex) and
    Assigned(ATreeView.Items[AIndex].Data) then
  begin
    AHex := IntToHex(TTreeCargo(ATreeView.Items[AIndex].Data).MenuIndex, 4);
    Result := Format('%s\%s', [REG_PATH_MENU, AHex]);
  end;
end;

class procedure TCRMTreeMenuRegistry.SaveTreeMenu(ATreeView: TUniTreeView);
var
  i: Integer;
  APath: string;
begin
  with TIQWebRegistry.Create do //iqrgstry
    try
      RootKey := HKEY_CURRENT_USER;
      DeleteKey(REG_PATH_MENU); //we are resetting it
      for i := 0 to ATreeView.Items.Count - 1 do
      begin
        if not Assigned(ATreeView.Items[i].Data) then
          CONTINUE;
        APath := NodeRegPath(ATreeView, i);
        if (APath > '') and OpenKey(APath, True) then
          WriteString('Text', ATreeView.Items[i].Text);
      end;
    finally
      Free;
    end;

  if Assigned(ATreeView.Selected) then
    TCRMTreeMenuRegistry.SetLastTreeMenuIndex(
      IQMS.Common.Controls.GetOwnerForm(ATreeView),
      TTreeCargo(ATreeView.Selected.Data).MenuIndex)
end;

class procedure TCRMTreeMenuRegistry.SetLastTreeMenuIndex(AOwnerForm: TUniForm; AIndex: Integer);
begin
  IQMS.Common.RegFrm.IQRegIntegerScalarWrite(AOwnerForm, 'CURRENT_MENU_NODE', AIndex);
end;

class function TCRMTreeMenuRegistry.SetSavedNodeText(const ANodeName, ANodeText: string): string;
var
  APath, S: string;
begin
  //Returns the saved menu caption by name
  APath := Format('%s\%s', [REG_PATH_MENU, ANodeName]);
  with TIQWebRegistry.Create do //iqrgstry
    try
      RootKey := HKEY_CURRENT_USER;
      //If no TreeView node has been created, then Exit routine.
      //We are displaying defaults.
      if OpenKey(REG_PATH_MENU, True) and OpenKey(APath, True) then
        WriteString('Text', ANodeText);
    finally
      Free;
    end;
end;

{$ENDREGION 'TCRMTreeMenuRegistry' }

{$REGION 'TCloneTree' }


class procedure TCloneTree.Execute(const ASourceTreeView: TUniTreeView; var ATargeTreeView: TUniTreeView);
begin
  with TCloneTree.Create do
    try
      SourceTreeView := ASourceTreeView;
      TargetTreeView := ATargeTreeView;
      CloneTree;
    finally
      Free;
    end;
end;

procedure TCloneTree.CloneTree;
begin
  //Validation
  if not Assigned(FSourceTreeView) or
    not Assigned(FTargetTreeView) or
    (FSourceTreeView.Items.Count = 0) then
    Exit;

  //Clear the target
  crm_treemenu.ClearTreeView(FTargetTreeView);

  //Start the process.  Recursion is used.
  FTargetTreeView.Items.BeginUpdate;
  try
    CloneTreeNodes(FSourceTreeView.Items[0], nil);
  finally
    FTargetTreeView.Items.EndUpdate;
  end;
end;

procedure TCloneTree.CloneTreeNodes(ASourceNode, ATargetNodeParent: TUniTreeNode);
var
  ATrgTreeNode: TUniTreeNode;
  ATrgCargo: TTreeCargo;
begin
  if ASourceNode <> nil then
    repeat
      //prepare object cargo
      ATrgCargo := TTreeCargo.Create(TTreeCargo(ASourceNode.Data).MenuIndex,
        TTreeCargo(ASourceNode.Data).Description);
      ATrgCargo.CustomizeChecked := True;

      //add node
      ATrgTreeNode:= FTargetTreeView.Items.AddChild(ATargetNodeParent, ASourceNode.Text);
      ATrgTreeNode.Data:= ATrgCargo;

      //recursion - pass first child and dig in
      CloneTreeNodes(ASourceNode.GetFirstChild(), ATrgTreeNode);

      // TODO - awaiting support GetNextSibling;
      // ASourceNode := ASourceNode.GetNextSibling;
    until ASourceNode = nil;
end;

{$ENDREGION 'TCloneTree' }

end.
