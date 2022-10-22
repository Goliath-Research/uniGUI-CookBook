unit IQUniGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniToolBar, uniPageControl,
  uniPanel, uniBasicGrid, uniDBGrid, DB, uniDBNavigator, uniImageList,
  uniButton, uniGUIInterfaces, uniEdit, IQUniEditor, uniFieldSet, Actions,
  ActnList, IQMS.WebComponents.DataControllerList;

const
  DEFAULT_PADDING = '5';

type
  TIQUniGridControl = class;

  TIQControls = class(TList)
  private
    function GetItem(Index: Integer): TUniControl;
    procedure SetItem(Index: Integer; const Value: TUniControl);
  public
    property Items[Index: Integer]: TUniControl read GetItem write SetItem; default;
  end;

  IIQUniGridControl = interface
    ['{F9A01E46-9A77-471A-BF77-120BC083ACD2}']
  end;

  IIQUniContainer = interface
    ['{3A342B64-B93F-4971-9001-A4E35E4E61BA}']
  end;

  TIQUniTabForm = class(TUniTabSheet, IIQUniContainer)
  protected
    procedure SetParent(AParent: TWinControl); override;
    procedure SetParentComponent(Value: TComponent); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TIQUniPageControl = class(TUniPageControl, IIQUniContainer)
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure LoadCompleted; override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TIQUniFieldSet = class(TUniFieldSet, IIQUniContainer)
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TIQUniPanel = class(TUniPanel, IIQUniContainer)
  private
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TIQUniGridControlComponents = class(TComponent)
  private
    FGrid : TUniDBGrid;
    FOwner : TIQUniGridControl;
    FNavigator : TUniDBNavigator;
    FToolbar : TUniToolBar;
    FHiddenPanel : TUniHiddenPanel;
    FFormTab: TUniTabSheet;
    function GetGrid: TUniDBGrid;
    function GetNavigator: TUniDBNavigator;
    function GetToolbar: TUniToolBar;
    function GetHiddenPanel: TUniHiddenPanel;
  published
    property Grid: TUniDBGrid read GetGrid;
    property Navigator: TUniDBNavigator read GetNavigator;
    property HiddenPanel: TUniHiddenPanel read GetHiddenPanel;
    property FormTab: TUniTabSheet read FFormTab;
  end;

  TIQUniGridControl = class(TUniFrame, IIQUniGridControl, IUniOwnsDBGrid)
    PageControl: TUniPageControl;
    GridTab: TUniTabSheet;
    FormTab: TUniTabSheet;
    TopToolBar: TUniToolBar;
    UniToolButton1: TUniToolButton;
    UniToolButton3: TUniToolButton;
    DBNavigator: TUniDBNavigator;
    ImgList: TUniNativeImageList;
    UniToolButton4: TUniToolButton;
    DBGrid: TUniDBGrid;
    GridEditorsPanel: TUniHiddenPanel;
    UniToolButton5: TUniToolButton;
    DesignBtn: TUniToolButton;
    UniToolButton2: TUniToolButton;
    GridToolBar: TUniToolBar;
    btnCaseSensitive: TUniToolButton;
    btnExactMatch: TUniToolButton;
    btnSort: TUniToolButton;
    btnFilter: TUniToolButton;
    btnSearch: TUniToolButton;
    UniToolButton10: TUniToolButton;
    edtSearchText: TUniEdit;
    UniToolButton6: TUniToolButton;
    ActionToolBar: TUniToolBar;
    procedure UniToolButton4Click(Sender: TObject);
    procedure DesignBtnClick(Sender: TObject);
    procedure UniToolButton1Click(Sender: TObject);
  private
    FParents: TStrings;
    FIQControls: TIQControls;
    FComponents: TIQUniGridControlComponents;
    FDesigner: TComponent;
    FTabsVisible: Boolean;
    FrmDsgn : TUniForm;
    FOnSearch: TNotifyEvent;
    FPrevOnCreateComponent : TCreateComponentEvent;
    FPrevOnSetName : TSetNameEvent;
    FIQCount, FLoadedCount: Integer;
    FDesignerParent: TUniContainer;
    FOnDesignStart: TNotifyEvent;
    FOnDesignEnd: TNotifyEvent;
    FController: TIQDataControllerLinkList;
    FToolbarActions: TActionList;
    FPendingWork: TStrings;

    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    procedure InitDataSources(const Value: TDataSource);
    function GetColumns: TUniDBGridColumns;
    procedure SetColumns(const Value: TUniDBGridColumns);
    function GetGrid: IUniCustomDBGrid;
    procedure SetGrid(Value: IUniCustomDBGrid);
    function IsColumnsStored: Boolean;
    function GetIQComponents: TIQUniGridControlComponents;
    procedure SetIQComponents(const Value: TIQUniGridControlComponents);
    function GetDBGrid: TUniDBGrid;
    procedure SetDBGrid(const Value: TUniDBGrid);
    function GetIQControls: TIQControls;
    procedure SetIQControls(const Value: TIQControls);
    procedure ReadIQParents(R: TReader);
    procedure WriteIQParents(W: TWriter);
    procedure ReadIQControlCount(R: TReader);
    procedure WriteIQControlCount(W: TWriter);
    procedure ReadMarker(R: TReader);
    procedure WriteMarker(W: TWriter);
    procedure CaptureCreate(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
    procedure CaptureSetname(Reader: TReader; Component: TComponent; var Name: string);
    procedure DsgnFormDestroy(Sender: TObject);
    procedure SetOnSearch(const Value: TNotifyEvent);
    procedure ReadIQControlsParents(S: TStream);
    procedure WriteIQControlsParents(S: TStream);
    procedure SetDesignerParent(const Value: TUniContainer);
    procedure SetOnDesignStart(const Value: TNotifyEvent);
    procedure SetOnDesignEnd(const Value: TNotifyEvent);
    function IsDataSourceStored: Boolean;
    procedure SetController(const Value: TIQDataControllerLinkList);
    procedure SetToolbarActions(const Value: TActionList);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoCreate; override;
    procedure DoDestroy; override;
    procedure Loaded; override;
    procedure LoadCompleted; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure AdjustEditorProps(const AControl: TUniControl; const Name: string = '');
    procedure AssignParent(AControl: TControl; AParent: TWinControl);
    procedure PopulateParents(const Items: TStrings; const ACategory: Integer; const Exclude: string = '');
    procedure ArrangePanelEditors(const APanel: TWinControl);
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure DeleteIQControl(AInstance: TComponent);
    function CreateIQControl(const ControlClass: TUniControlClass; const AName: string; const AParent: TWinControl = nil): TUniControl;
    procedure PopulateActionToolbar(const Actions: TActionList);

    property Designer: TComponent read FDesigner write FDesigner;
    property Controller: TIQDataControllerLinkList read FController write SetController;
  published
    property IQComponents: TIQUniGridControlComponents read GetIQComponents write SetIQComponents;
    property IQControls: TIQControls read GetIQControls write SetIQControls stored False;

    property DataSource: TDataSource read GetDataSource write SetDataSource stored IsDataSourceStored;
    property Columns: TUniDBGridColumns read GetColumns write SetColumns stored IsColumnsStored;
    property TabsVisible: Boolean read FTabsVisible write FTabsVisible default False;
    property DesignerParent: TUniContainer read FDesignerParent write SetDesignerParent;
    property ToolbarActions: TActionList read FToolbarActions write SetToolbarActions;

    property OnSearch: TNotifyEvent read FOnSearch write SetOnSearch;
    property OnDesignStart: TNotifyEvent read FOnDesignStart write SetOnDesignStart;
    property OnDesignEnd: TNotifyEvent read FOnDesignEnd write SetOnDesignEnd;
    property PendingWork: TStrings read FPendingWork;

    property OnMouseDown;
  end;

const
  IQCategoryForm      = 0;
  IQCategoryPanel     = 1;
  IQCategoryFieldSet  = 2;
  IQCategoryEditor    = 3;
  IQCategoryFieldEditor     = 4;

var
  RegisteredForms : TStrings = nil;
  RegisteredPanels : TStrings = nil;
  RegisteredCategories : TStrings = nil;
  RegisteredFieldSets : TStrings = nil;

function GetParentLevel(const C: TControl; Root: TWinControl): Integer;
procedure SortControls(AList: TList; Root: TWinControl);

implementation

uses
  IQGridDesignerFrm, uniGUIApplication, IQUniEditorRegEditors;

{$R *.dfm}

type
  THComponent = class(TComponent);
  THUniFormControl = class(TUniFormControl);

function GetParentLevel(const C: TControl; Root: TWinControl): Integer;
var
  P : TControl;
begin
  Result := 0;

  P := C.Parent;
  while Assigned(P) and (P <> Root) do
  begin
    Inc(Result);
    P := P.Parent;
  end;
end;

procedure SortControls(AList: TList; Root: TWinControl);
begin
  AList.SortList(
    function (Item1, Item2: Pointer): Integer
    begin
      Result := GetParentLevel(TControl(Item1), Root) - GetParentLevel(TControl(Item2), Root);

      if Result = 0 then
        if (TControl(Item1) is TIQUniTabForm) and (TControl(Item2) is TIQUniTabForm) then
          Result := TIQUniTabForm(Item1).PageIndex -  TIQUniTabForm(Item2).PageIndex;

      if Result = 0 then
        if (TControl(Item1) is TUniControl) and (TControl(Item2) is TUniControl) then
          Result := TUniControl(Item1).CreateOrder - TUniControl(Item2).CreateOrder;
    end
  );
end;

{ TIQUniGridControl }

procedure TIQUniGridControl.AdjustEditorProps(const AControl: TUniControl; const Name: string = '');
var
  S : string;
begin
  if AControl is TUniFormControl then
  begin
    if THUniFormControl(AControl).FieldLabel = '' then
    begin
      S := AControl.Name;
      if S ='' then S := Name;
      if S = '' then S:= 'Field Label';

      if not (AControl.Parent is TUniHiddenPanel) then
        THUniFormControl(AControl).FieldLabel := S;
    end;

    if AControl.Parent is TUniHiddenPanel then
      if AControl is TIQUniCustomEditor then
        (AControl as TIQUniCustomEditor).DBGrid := Self.DBGrid;
  end;
end;

function TIQUniGridControl.CreateIQControl(const ControlClass: TUniControlClass;
                                            const AName: string;
                                            const AParent: TWinControl = nil): TUniControl;
begin
  Result := ControlClass.Create(Self);
  if AName<>'' then
    Result.Name := AName;

  AssignParent(Result, AParent);
  FIQControls.Add(Result);
end;

procedure TIQUniGridControl.DeleteIQControl(AInstance: TComponent);
var
  Ix : Integer;
begin
  if AInstance is TUniContainer then
    if (AInstance as TUniContainer).ControlCount > 0 then
      raise Exception.Create('Can not erase a container with children.');

  Ix := FIQControls.IndexOf(AInstance);
  if Ix > -1 then FIQControls.Delete(Ix);

  AInstance.Free;
end;

procedure TIQUniGridControl.DsgnFormDestroy(Sender: TObject);
begin
  FrmDsgn := nil;

  if Assigned(FOnDesignEnd) then
    FOnDesignEnd(Self);
end;

procedure TIQUniGridControl.DesignBtnClick(Sender: TObject);
begin
  if FrmDsgn = nil then
  begin
    FrmDsgn := TIQUniGridDesigner.Create(UniApplication);
    with FrmDsgn as TIQUniGridDesigner do
    begin
      if FDesignerParent <> nil then
      begin
        Parent := FDesignerParent;
        BorderStyle := bsNone;
        FDesignerParent.Width := Width;
        if FDesignerParent is TUniPanel then
          TUniPanel(FDesignerParent).Collapsed := False;
      end;
      Grid := Self;
      Left := 16;
      Top := 16;
      OnDestroy := DsgnFormDestroy;
      Show();

      if Assigned(FOnDesignStart) then
        FOnDesignStart(Self);
    end;
  end;
end;

procedure TIQUniGridControl.PopulateActionToolbar(const Actions: TActionList);
var
  I: Integer;
  tb : TUniToolButton;
begin
  if Assigned(Actions) then
  begin
    if Actions.Images is TUniImageListAdapter then
      ActionToolBar.Images := (Actions.Images as TUniImageListAdapter).UniImageList;

    for I := 0 to Actions.ActionCount - 1 do
    begin
      tb := TUniToolButton.Create(Self);
      tb.Parent := ActionToolBar;
      tb.Action := Actions.Actions[I];
      tb.LayoutConfig.Region := 'west';
    end;
  end;
end;

procedure TIQUniGridControl.PopulateParents(const Items: TStrings; const ACategory: Integer; const Exclude: string = '');
var
  I : Integer;
begin
  case ACategory of
//    IQCategoryForm  :
//      begin
//        for I := 0 to ComponentCount - 1 do
//          if (Components[I] is TIQUniPanel) or
//            (Components[I] is TIQUniTabForm) then
//            Items.Add(Components[I].Name);
//      end;

    IQCategoryPanel :
      begin
        Items.Add(FormTab.Name);
        for I := 0 to ComponentCount - 1 do
          if Components[I] is TIQUniTabForm then
            Items.Add(Components[I].Name);
      end;

    IQCategoryForm,
    IQCategoryFieldSet:
      begin
        Items.Add(FormTab.Name);
        for I := 0 to ComponentCount - 1 do
          if (Components[I] is TIQUniPanel) or
            (Components[I] is TIQUniTabForm) then
            Items.Add(Components[I].Name);
      end;

    IQCategoryEditor:
      begin
        Items.Add(FormTab.Name);
        Items.Add(GridEditorsPanel.Name);
        for I := 0 to ComponentCount - 1 do
          if (Components[I] is TIQUniPanel) or
            (Components[I] is TIQUniTabForm) or
            (Components[I] is TIQUniFieldSet) then
            Items.Add(Components[I].Name);
      end;

    IQCategoryFieldEditor :
      begin
        for I := 0 to ComponentCount - 1 do
          if Components[I] is TIQUniFieldSet then
            Items.Add(Components[I].Name);
      end;
  end;

  if Exclude<>'' then
  begin
    I := Items.IndexOf(Exclude);
    if I > -1 then
      Items.Delete(I);
  end;
end;

procedure TIQUniGridControl.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('IQControlCount', ReadIQControlCount, WriteIQControlCount, FIQControls.Count > 0);
  Filer.DefineProperty('IQParents', ReadIQParents, WriteIQParents, FIQControls.Count > 0);
//  Filer.DefineBinaryProperty('IQControlParents', ReadIQControlsParents, WriteIQControlsParents, FIQControls.Count > 0);
  Filer.DefineProperty('Marker', ReadMarker, WriteMarker, True);
end;

procedure TIQUniGridControl.DoCreate;
begin
  inherited;
  FParents := TStringList.Create;
  FTabsVisible := True;

  FComponents := TIQUniGridControlComponents.Create(Self);
  FComponents.FGrid := DBGrid;
  FComponents.FNavigator := DBNavigator;
  FComponents.FToolbar := TopToolBar;
  FComponents.FHiddenPanel := GridEditorsPanel;
  FComponents.FFormTab := FormTab;

  FIQControls := TIQControls.Create;

  FPendingWork := TStringList.Create;

  if csDesigning in ComponentState then
  begin
    FComponents.SetSubComponent(True);
    DBGrid.SetSubComponent(True);
    DBNavigator.SetSubComponent(True);
    GridEditorsPanel.SetSubComponent(True);
    FormTab.SetSubComponent(True);
  end;

  PageControl.ActivePageIndex := 0;
end;

procedure TIQUniGridControl.DoDestroy;
begin
  if FDesigner is TCustomForm then
    (FDesigner as TCustomForm).Destroy;

  FrmDsgn.Free;
  inherited;
  FPendingWork.Free;
  FParents.Free;
  FIQControls.Free;
end;

procedure TIQUniGridControl.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I : Integer;
begin
  inherited;
  SortControls(FIQControls, FormTab);
  for I := 0 to FIQControls.Count-1 do
    Proc(FIQControls[I]);
end;

function TIQUniGridControl.GetColumns: TUniDBGridColumns;
begin
  Result := DBGrid.Columns;
end;

function TIQUniGridControl.GetIQComponents: TIQUniGridControlComponents;
begin
  Result := FComponents;
end;

function TIQUniGridControl.GetDataSource: TDataSource;
begin
  Result := DBGrid.DataSource;
end;

function TIQUniGridControl.GetDBGrid: TUniDBGrid;
begin
  Result := DBGrid;
end;

function TIQUniGridControl.GetIQControls: TIQControls;
begin
  Result := FIQControls;
end;

function TIQUniGridControl.GetGrid: IUniCustomDBGrid;
begin
  Result := DBGrid;
end;

procedure TIQUniGridControl.InitDataSources(const Value: TDataSource);
begin
  DBGrid.DataSource := Value;
  DBNavigator.DataSource := Value;
end;

function TIQUniGridControl.IsColumnsStored: Boolean;
begin
  Result := DBGrid.ColumnsCustomized;
end;

function TIQUniGridControl.IsDataSourceStored: Boolean;
begin
  Result := True;
end;

procedure TIQUniGridControl.SetColumns(const Value: TUniDBGridColumns);
begin
  DBGrid.Columns.Assign(Value);
end;

procedure TIQUniGridControl.SetController(const Value: TIQDataControllerLinkList);
begin
  FController := Value;
end;

procedure TIQUniGridControl.SetIQComponents(const Value: TIQUniGridControlComponents);
begin
  FComponents.Assign(Value);
end;

procedure TIQUniGridControl.SetDataSource(const Value: TDataSource);
begin
  InitDataSources(Value);
end;

procedure TIQUniGridControl.SetDBGrid(const Value: TUniDBGrid);
begin
  //
end;

procedure TIQUniGridControl.SetDesignerParent(const Value: TUniContainer);
begin
  FDesignerParent := Value;
end;

procedure TIQUniGridControl.SetIQControls(const Value: TIQControls);
begin
  FIQControls.Assign(Value);
end;

procedure TIQUniGridControl.SetOnDesignEnd(const Value: TNotifyEvent);
begin
  FOnDesignEnd := Value;
end;

procedure TIQUniGridControl.SetOnDesignStart(const Value: TNotifyEvent);
begin
  FOnDesignStart := Value;
end;

procedure TIQUniGridControl.SetOnSearch(const Value: TNotifyEvent);
begin
  FOnSearch := Value;
end;

procedure TIQUniGridControl.SetToolbarActions(const Value: TActionList);
begin
  FToolbarActions := Value;
end;

procedure TIQUniGridControl.SetGrid(Value: IUniCustomDBGrid);
begin
  //
end;

procedure TIQUniGridControl.UniToolButton1Click(Sender: TObject);
begin
  if Assigned(FOnSearch) then
    FOnSearch(Self);
end;

procedure TIQUniGridControl.UniToolButton4Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 1 - PageControl.ActivePageIndex;
end;

procedure TIQUniGridControl.ReadIQControlCount(R: TReader);
begin
  FIQCount := R.ReadInteger;
end;

procedure TIQUniGridControl.ReadIQControlsParents(S: TStream);
begin
  FParents.LoadFromStream(S);
end;

procedure TIQUniGridControl.ArrangePanelEditors(const APanel: TWinControl);
var
  I, pH : Integer;
  C : TControl;
begin
  pH := 8;
  for I := 0 to APanel.ControlCount - 1 do
  begin
    C := APanel.Controls[I];
    if C is TUniFormControl then
    begin
      C.Top := pH;
      C.Left := 8;
      pH := pH + C.Height + 2;
    end;
  end;
end;

procedure TIQUniGridControl.WriteIQControlCount(W: TWriter);
begin
  FIQCount := FIQControls.Count;
  W.WriteInteger(FIQCount);
end;

procedure TIQUniGridControl.WriteIQControlsParents(S: TStream);
var
  I: Integer;
  C : TControl;
  Prn : TWinControl;
begin
  FParents.Clear;
  for I := 0 to IQControls.Count - 1 do
  begin
    C := IQControls[I];
    if C is TIQUniTabForm then
      Prn := (C as TIQUniTabForm).PageControl.Parent
    else
      Prn := C.Parent;

    if Assigned(Prn) then
      FParents.Values[C.Name] := Prn.Name;

  end;
  FParents.SaveToStream(S);
end;

procedure TIQUniGridControl.WriteIQParents(W: TWriter);
var
  I: Integer;
  C : TControl;
  Prn : TWinControl;
begin
  FParents.Clear;
  for I := 0 to IQControls.Count - 1 do
  begin
    C := IQControls[I];
    if C is TIQUniTabForm then
      Prn := (C as TIQUniTabForm).PageControl.Parent
    else
      Prn := C.Parent;

    if Assigned(Prn) then
      FParents.Values[C.Name] := Prn.Name;
  end;

  W.WriteListBegin;
  for I := 0 to FParents.Count - 1 do
    W.WriteString(FParents[I]);
  W.WriteListEnd;
end;

procedure TIQUniGridControl.ReadIQParents(R: TReader);
begin
  FParents.Clear;
  R.ReadListBegin;
  while not R.EndOfList do
    FParents.Add(R.ReadString);
  R.ReadListEnd;
end;

procedure TIQUniGridControl.WriteMarker(W: TWriter);
begin
  W.WriteInteger(0);
end;

procedure TIQUniGridControl.AssignParent(AControl: TControl; AParent: TWinControl);
var
  Pg : TUniPageControl;
  I: Integer;
begin
  if (AControl is TIQUniTabForm) and Assigned(AParent) then
  begin
    Pg := nil;
    if AParent is TUniPageControl then
      Pg := AParent as TUniPageControl
    else
      for I := 0 to AParent.ControlCount - 1 do
      begin
        if AParent.Controls[I] is TUniPageControl then
        begin
          Pg := AParent.Controls[I] as TUniPageControl;
          Break;
        end;
      end;

    if Pg = nil then
    begin
      Pg := TIQUniPageControl.Create(Self);
      Pg.Parent := AParent;
      Pg.Align := alClient;
      Pg.Name := AParent.Name + '_PG';
    end;

    (AControl as TIQUniTabForm).PageControl := Pg;
  end
  else
    AControl.Parent := AParent;
end;

procedure TIQUniGridControl.CaptureCreate(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
begin
  if ComponentClass.InheritsFrom(TUniControl) then
  begin
    Component := CreateIQControl(TUniControlClass(ComponentClass), '');
    Reader.Parent := nil;
  end;
end;

procedure TIQUniGridControl.CaptureSetname(Reader: TReader; Component: TComponent; var Name: string);
var
  PrnName : string;
  Prn : TWinControl;
begin
  Inc(FLoadedCount);
  if FLoadedCount >= FIQCount then
  begin
    Reader.OnCreateComponent := FPrevOnCreateComponent;
    Reader.OnSetName := FPrevOnSetName;
  end;

  PrnName := FParents.Values[Name];
  if PrnName<>'' then
    Prn := TWinControl(Component.Owner.FindComponent(PrnName))
  else
    Prn := nil;

  if Prn<>nil then
  begin
    if Assigned(Component) then
      THComponent(Component).SetParentComponent(Prn);
  end;

  if Component is TUniFormControl then
    AdjustEditorProps(Component as TUniFormControl, Name);
end;

procedure TIQUniGridControl.ReadMarker(R: TReader);
begin
  if FIQCount > 0 then
  begin
    FPrevOnCreateComponent := R.OnCreateComponent;
    FPrevOnSetName := R.OnSetName;

    R.OnCreateComponent := CaptureCreate;
    R.OnSetName := CaptureSetname;
  end;
  R.ReadInteger;
end;

procedure TIQUniGridControl.LoadCompleted;
begin
  inherited;
  if not FTabsVisible then
  begin
    FormTab.TabVisible := False;
    GridTab.TabVisible := False;
  end;
  PopulateActionToolbar(FToolbarActions);
end;

procedure TIQUniGridControl.Loaded;
begin
  inherited;
  if csDesigning in ComponentState then
    ArrangePanelEditors(GridEditorsPanel);
end;

procedure TIQUniGridControl.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I: Integer;
begin
  inherited;
  if Operation = opRemove then
  begin
    for I := IQControls.Count -1  downto 0 do
      if IQControls[I] = AComponent then
        IQControls.Delete(I);
  end;
end;

{ TIQUniGridControlComponents }

function TIQUniGridControlComponents.GetGrid: TUniDBGrid;
begin
  Result := FGrid;
end;

function TIQUniGridControlComponents.GetHiddenPanel: TUniHiddenPanel;
begin
  Result := FHiddenPanel;
end;

function TIQUniGridControlComponents.GetNavigator: TUniDBNavigator;
begin
  Result := FNavigator;
end;

function TIQUniGridControlComponents.GetToolbar: TUniToolBar;
begin
  Result := FToolbar;
end;


{ TIQControls }

function TIQControls.GetItem(Index: Integer): TUniControl;
var
  T : Pointer;
begin
  T := inherited Items[Index];
  if Assigned(T) then
    Result:=TObject(T) as TUniControl
  else
    Result:=nil;
end;

procedure TIQControls.SetItem(Index: Integer; const Value: TUniControl);
begin
  inherited Items[Index] := Value;
end;

{ TIQUniTabForm }

constructor TIQUniTabForm.Create(AOwner: TComponent);
begin
  inherited;
  Layout := 'border';
  LayoutConfig.BodyPadding := DEFAULT_PADDING;
//  ControlOptions := ControlOptions + [uoAddToItems];
end;

procedure TIQUniTabForm.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
// nop
end;

procedure TIQUniTabForm.Loaded;
begin
  inherited;
  if IsDesigning then
    if (Owner is TIQUniGridControl) then
      (Owner as TIQUniGridControl).ArrangePanelEditors(Self);
end;

procedure TIQUniTabForm.SetParent(AParent: TWinControl);
begin
  inherited;

end;

procedure TIQUniTabForm.SetParentComponent(Value: TComponent);
begin
  if (Parent <> Value) and (Value is TWinControl) and (Owner is TIQUniGridControl) then
    (Owner as TIQUniGridControl).AssignParent(Self, Value as TWinControl)
  else
    inherited;
end;

{ TIQUniPageControl }

constructor TIQUniPageControl.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TIQUniPageControl.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
// nop
end;

procedure TIQUniPageControl.LoadCompleted;
begin
  if PageCount > 0 then
    Self.LayoutConfig.Region := Pages[0].LayoutConfig.Region;
  inherited;
end;

{ TIQUniPanel }

constructor TIQUniPanel.Create(AOwner: TComponent);
begin
  inherited;
  Layout := 'border';
  LayoutConfig.BodyPadding := DEFAULT_PADDING;
//  ControlOptions := ControlOptions + [uoAddToItems];
end;

procedure TIQUniPanel.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
// nop
end;

procedure TIQUniPanel.Loaded;
begin
  inherited;
  if IsDesigning then
    if (Owner is TIQUniGridControl) then
      (Owner as TIQUniGridControl).ArrangePanelEditors(Self);
end;

{ TIQUniFieldSet }

constructor TIQUniFieldSet.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TIQUniFieldSet.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
  // nop
end;

initialization;
  RegisteredForms := nil;
  RegisteredPanels := nil;
  RegisteredCategories := nil;
  RegisteredFieldSets := nil;

  IQRegisterClass(RegisteredForms, 'Form', TIQUniTabForm);
  IQRegisterClass(RegisteredPanels, 'Panel', TIQUniPanel);
  IQRegisterClass(RegisteredFieldSets, 'FieldSet', TIQUniFieldSet);

  IQRegisterClass(RegisteredCategories, 'Form', nil);
  IQRegisterClass(RegisteredCategories, 'Panel', nil);
  IQRegisterClass(RegisteredCategories, 'FieldSet', nil);
  IQRegisterClass(RegisteredCategories, 'Editor', nil);

  IQRegisterEditors;

finalization
  RegisteredForms.Free;
  RegisteredPanels.Free;
  RegisteredFieldSets.Free;
  RegisteredCategories.Free;

  RegisteredForms := nil;
  RegisteredPanels := nil;
  RegisteredCategories := nil;

end.
