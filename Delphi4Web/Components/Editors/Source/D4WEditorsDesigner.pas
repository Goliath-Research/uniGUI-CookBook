unit D4WEditorsDesigner;

interface

uses
  Classes, Forms, SysUtils, DesignIntf, DesignWindows, DesignEditors, Dialogs,
  Controls, StdCtrls, ToolWin, ComCtrls, ImgList, ImageList, D4W.HyperGrid,
  uniGUIClasses, uniGUIUtils;

type
  TD4WControlEditor = class(TClassProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TD4WHyperGridDsgn = class(TDefaultEditor)
  protected
  public
    function GetVerb(Index: Integer):string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
  end;

  TD4WEditorsDesignDlg = class(TDesignWindow)
    LBox: TListBox;
    ToolBar1: TToolBar;
    NewButton: TToolButton;
    EraseButton: TToolButton;
    ToolButton3: TToolButton;
    CloseButton: TToolButton;
    ImageList1: TImageList;
    EraseAllButton: TToolButton;
    ToolButton6: TToolButton;
    SelectAllButton: TToolButton;
    MoveButton: TToolButton;
    ToolButton9: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure NewButtonClick(Sender: TObject);
    procedure LBoxClick(Sender: TObject);
    procedure EraseButtonClick(Sender: TObject);
    procedure EraseAllButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SelectAllButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MoveButtonClick(Sender: TObject);
  private
    FHyperGrid : TD4WHyperGrid;

    procedure SetGrid(C: TD4WHyperGrid);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure UpdateSelection;
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections); override;

    procedure RefreshList(FAdd: Boolean);
    destructor Destroy; override;
  end;

procedure Register;

implementation

uses
  DesignConst, ToolsAPI, uniStrUtils, D4WEditorTypeDlg, D4WEditor,
  uniPageControl;

{$R *.dfm}

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TD4WControls), TD4WHyperGrid, 'Controls', TD4WControlEditor);
  RegisterComponentEditor(TD4WHyperGrid, TD4WHyperGridDsgn);
end;

procedure RunEditor(C : TD4WHyperGrid; D:IDesigner);
var
  DForm : TD4WEditorsDesignDlg;
begin
  if C.Designer<>nil then
    DForm := C.Designer as TD4WEditorsDesignDlg
  else
    DForm := TD4WEditorsDesignDlg.Create(Application);

  DForm.Designer := D;
  DForm.SetGrid(C);
  DForm.Show;
end;

procedure TD4WEditorsDesignDlg.FormDestroy(Sender: TObject);
begin
  Designer:=nil;
end;

procedure TD4WEditorsDesignDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=27 then Close;

end;

procedure TD4WEditorsDesignDlg.SetGrid(C: TD4WHyperGrid);
begin
  FHyperGrid := C;
  if Assigned(FHyperGrid) then
    FHyperGrid.Designer := Self;

  RefreshList(False);
end;

procedure TD4WEditorsDesignDlg.LBoxClick(Sender: TObject);
begin
  UpdateSelection;
end;

procedure TD4WEditorsDesignDlg.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if Operation = opRemove then
  begin

  end;
end;

procedure TD4WEditorsDesignDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;

  if Assigned(FHyperGrid) then FHyperGrid.Designer:=nil;

  LBox.Clear;
  UpdateSelection;
end;

destructor TD4WEditorsDesignDlg.Destroy;
begin
  FHyperGrid:=nil;
  inherited;
end;

procedure TD4WEditorsDesignDlg.NewButtonClick(Sender: TObject);
var
  C : TUniControl;
  Cat, I : Integer;
  F, F1 : TD4WEditorDialogForm;
  Sl : TUniFormControlClass;
  Pnl: TWinControl;
  S : string;
begin
  F := TD4WEditorDialogForm.Create(Application);
  try
    F.ShowList('Select a Category', RegisteredCategories, Cat);
    case Cat of
      D4WCategoryForm     : sl := TUniFormControlClass(F.ShowList('Select a Form Type', RegisteredForms, I));
      D4WCategoryPanel    : sl := TUniFormControlClass(F.ShowList('Select a Panel Type', RegisteredPanels, I));
      D4WCategoryEditor   : sl := TUniFormControlClass(F.ShowList('Select an Editor Type', RegisteredEditors, I));
      D4WCategoryFieldSet : sl := TUniFormControlClass(F.ShowList('Select an Editor Type', RegisteredFieldSets, I));
    else
      sl := nil;
    end;

    if sl<>nil then
    begin
      F1 := TD4WEditorDialogForm.Create(Application);
      try
        FHyperGrid.PopulateParents(F1.ListBox.Items, Cat);
        S := F1.ShowList('Select a Target', I);
        if S<>'' then
          Pnl := FHyperGrid.FindComponent(S) as TWinControl
        else
          Exit;
      finally
        F1.Free;
      end;

      if Pnl = nil then
      begin
        ShowMessage('No Parent Specified');
        Exit;
      end;

      C := FHyperGrid.CreateD4WControl(Sl, uniUniqueComponentName(Sl.ClassName, FHyperGrid), Pnl);

      if Cat = D4WCategoryEditor then
        FHyperGrid.ArrangePanelEditors(Pnl);

      if Assigned(C) then
      begin
        RefreshList(True);
        Designer.Modified;
      end;
    end;
  finally
    F.Free;
  end;
end;

procedure TD4WEditorsDesignDlg.EraseButtonClick(Sender: TObject);
var
  C : TComponent;
  I : Integer;
begin
  if LBox.SelCount = 0 then Exit;

  if MessageDlg('Selected Editors will be deleted, Continue?', mtWarning, mbYesNoCancel, 0)<>mrYes then
    Exit;

  Designer.Modified; // this should be called *before* deleting any control

  with LBox do
    for I := 0 to Items.Count - 1 do
      if Selected[I] then
      begin
        C := TComponent(Items.Objects[I]);
        FHyperGrid.DeleteD4WControl(C);
      end;

//  if LBox.Items.Count > 0 then
//    FGridControl.ArrangePanelEditors();

  RefreshList(False);
end;

procedure TD4WEditorsDesignDlg.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TD4WEditorsDesignDlg.EraseAllButtonClick(Sender: TObject);
var
  C : TComponent;
  I : Integer;
begin
  if MessageDlg('All Editors will be deleted, Continue?', mtWarning, mbYesNoCancel, 0)<>mrYes then
    Exit;

  Designer.Modified; // this should be called *before* deleting any control

  with LBox do
    for I := 0 to Items.Count - 1 do
    begin
      C := TComponent(Items.Objects[I]);
      FHyperGrid.DeleteD4WControl(C);
    end;

//  FGridControl.ArrangePanelEditors;

  RefreshList(False);
end;

procedure TD4WEditorsDesignDlg.SelectAllButtonClick(Sender: TObject);
begin
  LBox.SelectAll;

  UpdateSelection;
end;

procedure TD4WEditorsDesignDlg.MoveButtonClick(Sender: TObject);
var
  F : TD4WEditorDialogForm;
  S : string;
  Pnl : TWinControl;
  I, Cat : Integer;
  C : TControl;
begin
  if LBox.SelCount > 0 then
  begin
    C := nil;
    F := TD4WEditorDialogForm.Create(Application);
    try
      for I := 0 to LBox.Items.Count - 1 do
        if LBox.Selected[I] then
        begin
          C := TControl(LBox.Items.Objects[I]);
          Break;
        end;

      if C is TD4WPanel then
        Cat := D4WCategoryPanel
      else if C is TD4WTabForm then
        Cat := D4WCategoryForm
      else if C is TD4WFieldSet then
        Cat := D4WCategoryFieldSet
      else
        Cat := D4WCategoryEditor;

      FHyperGrid.PopulateParents(F.ListBox.Items, Cat);
      S := F.ShowList('Select a Target', I);
      if S<>'' then
      begin
        Pnl := FHyperGrid.FindComponent(S) as TWinControl;

        if Assigned(Pnl) then
        begin
          FHyperGrid.AssignParent(C, Pnl);
          FHyperGrid.ArrangePanelEditors(Pnl);
          Designer.Modified;
        end;
      end;
    finally
      F.Free;
    end;
  end;
end;

procedure TD4WEditorsDesignDlg.RefreshList(FAdd: Boolean);
var
  I : Integer;
begin
  LBox.Clear;

  if Assigned(FHyperGrid) then
  begin
    for I := 0 to FHyperGrid.D4WControls.Count-1 do
      LBox.Items.AddObject((FHyperGrid.D4WControls[I] as TComponent).Name, FHyperGrid.D4WControls[I]);

    if LBox.Items.Count>0 then
    begin
      if FAdd then
        LBox.Selected[Lbox.Items.Count-1]:=True;
    end;
  end;

  UpdateSelection;
end;

procedure TD4WEditorsDesignDlg.UpdateSelection;
var
  I : Integer;
  C : TComponent;
  ComponentList: IDesignerSelections;
  Prn : TWinControl;
begin
  if Active then
  begin
    MoveButton.Enabled := LBox.SelCount = 1;

    ComponentList := TDesignerSelections.Create;
    try
      with LBox do
        for I := 0 to Items.Count - 1 do
          if Selected[I] then
          begin
            C := TComponent(Items.Objects[I]);
            if C <> nil then ComponentList.Add(C);
          end;

      if (ComponentList.Count = 0) and Assigned(FHyperGrid) then
        ComponentList.Add(FHyperGrid);
    except
      raise;
    end;

    if ComponentList.Count = 1 then
    begin
      if ComponentList.Items[0] is TD4WTabForm then
        Prn := (ComponentList.Items[0] as TD4WTabForm)
      else if ComponentList.Items[0] is TD4WPanel then
        Prn := (ComponentList.Items[0] as TD4WPanel).Parent
      else
        Prn := nil;

      if Prn is TUniTabSheet then (Prn as TUniTabSheet).Show;
    end;

    Designer.SetSelections(ComponentList);
  end;
end;


procedure TD4WEditorsDesignDlg.SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
var
  I: Integer;
  S: Boolean;

  function InSelection(Component: TComponent): Boolean;
  var
    I: Integer;
  begin
    Result := True;
    if ASelection <> nil then
      with ASelection do
        for I := 0 to Count - 1 do
          if Component = Items[I] then Exit;
    Result := False;
  end;

begin
  if FHyperGrid = nil then Exit;


  with LBox do
    for I := 0 to Items.Count - 1 do
    begin
      S := InSelection(TComponent(Items.Objects[I]));
      if Selected[I] <> S then Selected[I] := S;
    end;
end;

{ TD4WHyperGridDsgn }

procedure TD4WHyperGridDsgn.Edit;
begin
  ExecuteVerb(0);
end;

procedure TD4WHyperGridDsgn.ExecuteVerb(Index: Integer);
var
  uC : TD4WHyperGrid;
begin
  uC := Component as TD4WHyperGrid;

  case Index of
    0 : RunEditor(uC, Designer);
  end;
end;

function TD4WHyperGridDsgn.GetVerb(Index: Integer): string;
begin
  case Index of
    0 : Result:='HyperGrid Editor...';
  end;
end;

function TD4WHyperGridDsgn.GetVerbCount: Integer;
begin
  Result:=1;
end;

{ TD4WHyperGridEditor }

procedure TD4WControlEditor.Edit;
var
  uGrid : TD4WHyperGrid;
begin
  uGrid := TD4WHyperGrid(GetComponent(0));

  RunEditor(uGrid, Designer);
end;

function TD4WControlEditor.GetAttributes: TPropertyAttributes;
begin
	Result := [paDialog];
end;

end.
