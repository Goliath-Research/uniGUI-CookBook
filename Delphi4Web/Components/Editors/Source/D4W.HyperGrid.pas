unit D4W.HyperGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniToolBar, uniPageControl,
  uniPanel, uniBasicGrid, uniDBGrid, DB, uniDBNavigator, uniImageList,
  uniButton, uniGUIInterfaces, uniEdit, D4WEditor, uniFieldSet, Actions,
  ActnList, D4W.DataControllerList;

const
  DEFAULT_PADDING = '5';

type
  TD4WHyperGrid = class;

  TD4WControls = class(TList)
  private
    function GetItem(Index: Integer): TUniControl;
    procedure SetItem(Index: Integer; const Value: TUniControl);
  public
    property Items[Index: Integer]: TUniControl read GetItem write SetItem; default;
  end;

  ID4WHyperGrid = interface
    ['{F9A01E46-9A77-471A-BF77-120BC083ACD2}']
  end;

  ID4WContainer = interface
    ['{3A342B64-B93F-4971-9001-A4E35E4E61BA}']
  end;

  TD4WTabForm = class(TUniTabSheet, ID4WContainer)
  protected
    procedure SetParent(AParent: TWinControl); override;
    procedure SetParentComponent(Value: TComponent); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TD4WPageControl = class(TUniPageControl, ID4WContainer)
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure LoadCompleted; override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TD4WFieldSet = class(TUniFieldSet, ID4WContainer)
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TD4WPanel = class(TUniPanel, ID4WContainer)
  private
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner:TComponent); override;
  end;

  TD4WHyperGridComponents = class(TComponent)
  private
    FGrid : TUniDBGrid;
//    FOwner : TD4WHyperGrid;
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
    property Toolbar: TUniToolbar read GetToolbar;
    property Navigator: TUniDBNavigator read GetNavigator;
    property HiddenPanel: TUniHiddenPanel read GetHiddenPanel;
    property FormTab: TUniTabSheet read FFormTab;
  end;

  TD4WHyperGrid = class(TUniFrame, ID4WHyperGrid, IUniOwnsDBGrid)
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
    FD4WControls: TD4WControls;
    FComponents: TD4WHyperGridComponents;
    FDesigner: TComponent;
    FTabsVisible: Boolean;
    FrmDsgn : TUniForm;
    FOnSearch: TNotifyEvent;
    FPrevOnCreateComponent : TCreateComponentEvent;
    FPrevOnSetName : TSetNameEvent;
    FD4WCount, FLoadedCount: Integer;
    FDesignerParent: TUniContainer;
    FOnDesignStart: TNotifyEvent;
    FOnDesignEnd: TNotifyEvent;
    FController: TD4WDataControllerLinkList;
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
    function GetD4WComponents: TD4WHyperGridComponents;
    procedure SetD4WComponents(const Value: TD4WHyperGridComponents);
    function GetDBGrid: TUniDBGrid;
    procedure SetDBGrid(const Value: TUniDBGrid);
    function GetD4WControls: TD4WControls;
    procedure SetD4WControls(const Value: TD4WControls);
    procedure ReadD4WParents(R: TReader);
    procedure WriteD4WParents(W: TWriter);
    procedure ReadD4WControlCount(R: TReader);
    procedure WriteD4WControlCount(W: TWriter);
    procedure ReadMarker(R: TReader);
    procedure WriteMarker(W: TWriter);
    procedure CaptureCreate(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
    procedure CaptureSetname(Reader: TReader; Component: TComponent; var Name: string);
    procedure DsgnFormDestroy(Sender: TObject);
    procedure SetOnSearch(const Value: TNotifyEvent);
    procedure ReadD4WControlsParents(S: TStream);
    procedure WriteD4WControlsParents(S: TStream);
    procedure SetDesignerParent(const Value: TUniContainer);
    procedure SetOnDesignStart(const Value: TNotifyEvent);
    procedure SetOnDesignEnd(const Value: TNotifyEvent);
    function IsDataSourceStored: Boolean;
    procedure SetController(const Value: TD4WDataControllerLinkList);
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
    procedure DeleteD4WControl(AInstance: TComponent);
    function CreateD4WControl(const ControlClass: TUniControlClass; const AName: string; const AParent: TWinControl = nil): TUniControl;
    procedure PopulateActionToolbar(const Actions: TActionList);

    property Designer: TComponent read FDesigner write FDesigner;
    property Controller: TD4WDataControllerLinkList read FController write SetController;
  published
    property D4WComponents: TD4WHyperGridComponents read GetD4WComponents write SetD4WComponents;
    property D4WControls: TD4WControls read GetD4WControls write SetD4WControls stored False;

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
  D4WCategoryForm         = 0;
  D4WCategoryPanel        = 1;
  D4WCategoryFieldSet     = 2;
  D4WCategoryEditor       = 3;
  D4WCategoryFieldEditor  = 4;

var
  RegisteredForms : TStrings = nil;
  RegisteredPanels : TStrings = nil;
  RegisteredCategories : TStrings = nil;
  RegisteredFieldSets : TStrings = nil;

function GetParentLevel(const C: TControl; Root: TWinControl): Integer;
procedure SortControls(AList: TList; Root: TWinControl);

implementation

uses
  D4WGridDesignerFrm, uniGUIApplication, D4WEditorRegEditors;

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
        if (TControl(Item1) is TD4WTabForm) and (TControl(Item2) is TD4WTabForm) then
          Result := TD4WTabForm(Item1).PageIndex -  TD4WTabForm(Item2).PageIndex;

      if Result = 0 then
        if (TControl(Item1) is TUniControl) and (TControl(Item2) is TUniControl) then
          Result := TUniControl(Item1).CreateOrder - TUniControl(Item2).CreateOrder;
    end
  );
end;

{ TD4WHyperGrid }

procedure TD4WHyperGrid.AdjustEditorProps(const AControl: TUniControl; const Name: string = '');
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
      if AControl is TD4WCustomEditor then
        (AControl as TD4WCustomEditor).DBGrid := Self.DBGrid;
  end;
end;

function TD4WHyperGrid.CreateD4WControl(const ControlClass: TUniControlClass;
                                            const AName: string;
                                            const AParent: TWinControl = nil): TUniControl;
begin
  Result := ControlClass.Create(Self);
  if AName<>'' then
    Result.Name := AName;

  AssignParent(Result, AParent);
  FD4WControls.Add(Result);
end;

procedure TD4WHyperGrid.DeleteD4WControl(AInstance: TComponent);
var
  Ix : Integer;
begin
  if AInstance is TUniContainer then
    if (AInstance as TUniContainer).ControlCount > 0 then
      raise Exception.Create('Can not erase a container with children.');

  Ix := FD4WControls.IndexOf(AInstance);
  if Ix > -1 then FD4WControls.Delete(Ix);

  AInstance.Free;
end;

procedure TD4WHyperGrid.DsgnFormDestroy(Sender: TObject);
begin
  FrmDsgn := nil;

  if Assigned(FOnDesignEnd) then
    FOnDesignEnd(Self);
end;

procedure TD4WHyperGrid.DesignBtnClick(Sender: TObject);
begin
  if FrmDsgn = nil then
  begin
    FrmDsgn := TD4WGridDesigner.Create(UniApplication);
    with FrmDsgn as TD4WGridDesigner do
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

procedure TD4WHyperGrid.PopulateActionToolbar(const Actions: TActionList);
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

procedure TD4WHyperGrid.PopulateParents(const Items: TStrings; const ACategory: Integer; const Exclude: string = '');
var
  I : Integer;
begin
  case ACategory of
//    D4WCategoryForm  :
//      begin
//        for I := 0 to ComponentCount - 1 do
//          if (Components[I] is TD4WPanel) or
//            (Components[I] is TD4WTabForm) then
//            Items.Add(Components[I].Name);
//      end;

    D4WCategoryPanel :
      begin
        Items.Add(FormTab.Name);
        for I := 0 to ComponentCount - 1 do
          if Components[I] is TD4WTabForm then
            Items.Add(Components[I].Name);
      end;

    D4WCategoryForm,
    D4WCategoryFieldSet:
      begin
        Items.Add(FormTab.Name);
        for I := 0 to ComponentCount - 1 do
          if (Components[I] is TD4WPanel) or
            (Components[I] is TD4WTabForm) then
            Items.Add(Components[I].Name);
      end;

    D4WCategoryEditor:
      begin
        Items.Add(FormTab.Name);
        Items.Add(GridEditorsPanel.Name);
        for I := 0 to ComponentCount - 1 do
          if (Components[I] is TD4WPanel) or
            (Components[I] is TD4WTabForm) or
            (Components[I] is TD4WFieldSet) then
            Items.Add(Components[I].Name);
      end;

    D4WCategoryFieldEditor :
      begin
        for I := 0 to ComponentCount - 1 do
          if Components[I] is TD4WFieldSet then
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

procedure TD4WHyperGrid.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('ControlCount', ReadD4WControlCount, WriteD4WControlCount, FD4WControls.Count > 0);
  Filer.DefineProperty('Parents', ReadD4WParents, WriteD4WParents, FD4WControls.Count > 0);
//  Filer.DefineBinaryProperty('ControlParents', ReadD4WControlsParents, WriteD4WControlsParents, FD4WControls.Count > 0);
  Filer.DefineProperty('Marker', ReadMarker, WriteMarker, True);
end;

procedure TD4WHyperGrid.DoCreate;
begin
  inherited;
  FParents := TStringList.Create;
  FTabsVisible := True;

  FComponents := TD4WHyperGridComponents.Create(Self);
  FComponents.FGrid := DBGrid;
  FComponents.FNavigator := DBNavigator;
  FComponents.FToolbar := TopToolBar;
  FComponents.FHiddenPanel := GridEditorsPanel;
  FComponents.FFormTab := FormTab;

  FD4WControls := TD4WControls.Create;

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

procedure TD4WHyperGrid.DoDestroy;
begin
  if FDesigner is TCustomForm then
    (FDesigner as TCustomForm).Destroy;

  FrmDsgn.Free;
  inherited;
  FPendingWork.Free;
  FParents.Free;
  FD4WControls.Free;
end;

procedure TD4WHyperGrid.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I : Integer;
begin
  inherited;
  SortControls(FD4WControls, FormTab);
  for I := 0 to FD4WControls.Count-1 do
    Proc(FD4WControls[I]);
end;

function TD4WHyperGrid.GetColumns: TUniDBGridColumns;
begin
  Result := DBGrid.Columns;
end;

function TD4WHyperGrid.GetD4WComponents: TD4WHyperGridComponents;
begin
  Result := FComponents;
end;

function TD4WHyperGrid.GetDataSource: TDataSource;
begin
  Result := DBGrid.DataSource;
end;

function TD4WHyperGrid.GetDBGrid: TUniDBGrid;
begin
  Result := DBGrid;
end;

function TD4WHyperGrid.GetD4WControls: TD4WControls;
begin
  Result := FD4WControls;
end;

function TD4WHyperGrid.GetGrid: IUniCustomDBGrid;
begin
  Result := DBGrid;
end;

procedure TD4WHyperGrid.InitDataSources(const Value: TDataSource);
begin
  DBGrid.DataSource := Value;
  DBNavigator.DataSource := Value;
end;

function TD4WHyperGrid.IsColumnsStored: Boolean;
begin
  Result := DBGrid.ColumnsCustomized;
end;

function TD4WHyperGrid.IsDataSourceStored: Boolean;
begin
  Result := True;
end;

procedure TD4WHyperGrid.SetColumns(const Value: TUniDBGridColumns);
begin
  DBGrid.Columns.Assign(Value);
end;

procedure TD4WHyperGrid.SetController(const Value: TD4WDataControllerLinkList);
begin
  FController := Value;
end;

procedure TD4WHyperGrid.SetD4WComponents(const Value: TD4WHyperGridComponents);
begin
  FComponents.Assign(Value);
end;

procedure TD4WHyperGrid.SetDataSource(const Value: TDataSource);
begin
  InitDataSources(Value);
end;

procedure TD4WHyperGrid.SetDBGrid(const Value: TUniDBGrid);
begin
  //
end;

procedure TD4WHyperGrid.SetDesignerParent(const Value: TUniContainer);
begin
  FDesignerParent := Value;
end;

procedure TD4WHyperGrid.SetD4WControls(const Value: TD4WControls);
begin
  FD4WControls.Assign(Value);
end;

procedure TD4WHyperGrid.SetOnDesignEnd(const Value: TNotifyEvent);
begin
  FOnDesignEnd := Value;
end;

procedure TD4WHyperGrid.SetOnDesignStart(const Value: TNotifyEvent);
begin
  FOnDesignStart := Value;
end;

procedure TD4WHyperGrid.SetOnSearch(const Value: TNotifyEvent);
begin
  FOnSearch := Value;
end;

procedure TD4WHyperGrid.SetToolbarActions(const Value: TActionList);
begin
  FToolbarActions := Value;
end;

procedure TD4WHyperGrid.SetGrid(Value: IUniCustomDBGrid);
begin
  //
end;

procedure TD4WHyperGrid.UniToolButton1Click(Sender: TObject);
begin
  if Assigned(FOnSearch) then
    FOnSearch(Self);
end;

procedure TD4WHyperGrid.UniToolButton4Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 1 - PageControl.ActivePageIndex;
end;

procedure TD4WHyperGrid.ReadD4WControlCount(R: TReader);
begin
  FD4WCount := R.ReadInteger;
end;

procedure TD4WHyperGrid.ReadD4WControlsParents(S: TStream);
begin
  FParents.LoadFromStream(S);
end;

procedure TD4WHyperGrid.ArrangePanelEditors(const APanel: TWinControl);
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

procedure TD4WHyperGrid.WriteD4WControlCount(W: TWriter);
begin
  FD4WCount := FD4WControls.Count;
  W.WriteInteger(FD4WCount);
end;

procedure TD4WHyperGrid.WriteD4WControlsParents(S: TStream);
var
  I: Integer;
  C : TControl;
  Prn : TWinControl;
begin
  FParents.Clear;
  for I := 0 to D4WControls.Count - 1 do
  begin
    C := D4WControls[I];
    if C is TD4WTabForm then
      Prn := (C as TD4WTabForm).PageControl.Parent
    else
      Prn := C.Parent;

    if Assigned(Prn) then
      FParents.Values[C.Name] := Prn.Name;

  end;
  FParents.SaveToStream(S);
end;

procedure TD4WHyperGrid.WriteD4WParents(W: TWriter);
var
  I: Integer;
  C : TControl;
  Prn : TWinControl;
begin
  FParents.Clear;
  for I := 0 to D4WControls.Count - 1 do
  begin
    C := D4WControls[I];
    if C is TD4WTabForm then
      Prn := (C as TD4WTabForm).PageControl.Parent
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

procedure TD4WHyperGrid.ReadD4WParents(R: TReader);
begin
  FParents.Clear;
  R.ReadListBegin;
  while not R.EndOfList do
    FParents.Add(R.ReadString);
  R.ReadListEnd;
end;

procedure TD4WHyperGrid.WriteMarker(W: TWriter);
begin
  W.WriteInteger(0);
end;

procedure TD4WHyperGrid.AssignParent(AControl: TControl; AParent: TWinControl);
var
  Pg : TUniPageControl;
  I: Integer;
begin
  if (AControl is TD4WTabForm) and Assigned(AParent) then
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
      Pg := TD4WPageControl.Create(Self);
      Pg.Parent := AParent;
      Pg.Align := alClient;
      Pg.Name := AParent.Name + '_PG';
    end;

    (AControl as TD4WTabForm).PageControl := Pg;
  end
  else
    AControl.Parent := AParent;
end;

procedure TD4WHyperGrid.CaptureCreate(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
begin
  if ComponentClass.InheritsFrom(TUniControl) then
  begin
    Component := CreateD4WControl(TUniControlClass(ComponentClass), '');
    Reader.Parent := nil;
  end;
end;

procedure TD4WHyperGrid.CaptureSetname(Reader: TReader; Component: TComponent; var Name: string);
var
  PrnName : string;
  Prn : TWinControl;
begin
  Inc(FLoadedCount);
  if FLoadedCount >= FD4WCount then
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

procedure TD4WHyperGrid.ReadMarker(R: TReader);
begin
  if FD4WCount > 0 then
  begin
    FPrevOnCreateComponent := R.OnCreateComponent;
    FPrevOnSetName := R.OnSetName;

    R.OnCreateComponent := CaptureCreate;
    R.OnSetName := CaptureSetname;
  end;
  R.ReadInteger;
end;

procedure TD4WHyperGrid.LoadCompleted;
begin
  inherited;
  if not FTabsVisible then
  begin
    FormTab.TabVisible := False;
    GridTab.TabVisible := False;
  end;
  PopulateActionToolbar(FToolbarActions);
end;

procedure TD4WHyperGrid.Loaded;
begin
  inherited;
  if csDesigning in ComponentState then
    ArrangePanelEditors(GridEditorsPanel);
end;

procedure TD4WHyperGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I: Integer;
begin
  inherited;
  if Operation = opRemove then
  begin
    for I := D4WControls.Count -1  downto 0 do
      if D4WControls[I] = AComponent then
        D4WControls.Delete(I);
  end;
end;

{ TD4WHyperGridComponents }

function TD4WHyperGridComponents.GetGrid: TUniDBGrid;
begin
  Result := FGrid;
end;

function TD4WHyperGridComponents.GetHiddenPanel: TUniHiddenPanel;
begin
  Result := FHiddenPanel;
end;

function TD4WHyperGridComponents.GetNavigator: TUniDBNavigator;
begin
  Result := FNavigator;
end;

function TD4WHyperGridComponents.GetToolbar: TUniToolBar;
begin
  Result := FToolbar;
end;


{ TD4WControls }

function TD4WControls.GetItem(Index: Integer): TUniControl;
var
  T : Pointer;
begin
  T := inherited Items[Index];
  if Assigned(T) then
    Result:=TObject(T) as TUniControl
  else
    Result:=nil;
end;

procedure TD4WControls.SetItem(Index: Integer; const Value: TUniControl);
begin
  inherited Items[Index] := Value;
end;

{ TD4WTabForm }

constructor TD4WTabForm.Create(AOwner: TComponent);
begin
  inherited;
  Layout := 'border';
  LayoutConfig.BodyPadding := DEFAULT_PADDING;
//  ControlOptions := ControlOptions + [uoAddToItems];
end;

procedure TD4WTabForm.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
// nop
end;

procedure TD4WTabForm.Loaded;
begin
  inherited;
  if IsDesigning then
    if (Owner is TD4WHyperGrid) then
      (Owner as TD4WHyperGrid).ArrangePanelEditors(Self);
end;

procedure TD4WTabForm.SetParent(AParent: TWinControl);
begin
  inherited;

end;

procedure TD4WTabForm.SetParentComponent(Value: TComponent);
begin
  if (Parent <> Value) and (Value is TWinControl) and (Owner is TD4WHyperGrid) then
    (Owner as TD4WHyperGrid).AssignParent(Self, Value as TWinControl)
  else
    inherited;
end;

{ TD4WPageControl }

constructor TD4WPageControl.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TD4WPageControl.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
// nop
end;

procedure TD4WPageControl.LoadCompleted;
begin
  if PageCount > 0 then
    Self.LayoutConfig.Region := Pages[0].LayoutConfig.Region;
  inherited;
end;

{ TD4WPanel }

constructor TD4WPanel.Create(AOwner: TComponent);
begin
  inherited;
  Layout := 'border';
  LayoutConfig.BodyPadding := DEFAULT_PADDING;
//  ControlOptions := ControlOptions + [uoAddToItems];
end;

procedure TD4WPanel.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
// nop
end;

procedure TD4WPanel.Loaded;
begin
  inherited;
  if IsDesigning and (Owner is TD4WHyperGrid) then
    (Owner as TD4WHyperGrid).ArrangePanelEditors(Self);
end;

{ TD4WFieldSet }

constructor TD4WFieldSet.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TD4WFieldSet.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
  // nop
end;

initialization;
  RegisteredForms := nil;
  RegisteredPanels := nil;
  RegisteredCategories := nil;
  RegisteredFieldSets := nil;

  D4WRegisterClass(RegisteredForms, 'Form', TD4WTabForm);
  D4WRegisterClass(RegisteredPanels, 'Panel', TD4WPanel);
  D4WRegisterClass(RegisteredFieldSets, 'FieldSet', TD4WFieldSet);

  D4WRegisterClass(RegisteredCategories, 'Form', nil);
  D4WRegisterClass(RegisteredCategories, 'Panel', nil);
  D4WRegisterClass(RegisteredCategories, 'FieldSet', nil);
  D4WRegisterClass(RegisteredCategories, 'Editor', nil);

  D4WRegisterEditors;

finalization
  RegisteredForms.Free;
  RegisteredPanels.Free;
  RegisteredFieldSets.Free;
  RegisteredCategories.Free;

  RegisteredForms := nil;
  RegisteredPanels := nil;
  RegisteredCategories := nil;

end.
