unit IQGridDesignerFrm;

{$R uniGUIGlyph.RES}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  DB, Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniToolBar,
  uniPageControl, IQUniGrid, uniStatusBar, uniTreeView, uniImageList, uniPropertyGrid,
  uniPanel, uniMultiItem, uniComboBox;

type
  TIQUniGridDesigner = class(TUniForm)
    UniToolBar1: TUniToolBar;
    TreeView: TUniTreeView;
    UniStatusBar1: TUniStatusBar;
    ToolbarImages: TUniNativeImageList;
    UniToolButton1: TUniToolButton;
    UniToolButton2: TUniToolButton;
    UniToolButton3: TUniToolButton;
    UniToolButton4: TUniToolButton;
    UniPropertyGrid1: TUniPropertyGrid;
    UniToolButton6: TUniToolButton;
    UniToolButton7: TUniToolButton;
    UniToolButton8: TUniToolButton;
    ClassIcons: TUniNativeImageList;
    UniToolButton9: TUniToolButton;
    UniToolButton10: TUniToolButton;
    UniToolButton11: TUniToolButton;
    UniToolButton13: TUniToolButton;
    UniToolButton14: TUniToolButton;
    UniToolButton15: TUniToolButton;
    UniPanel1: TUniPanel;
    RegionCombo: TUniComboBox;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniToolButton1Click(Sender: TObject);
    procedure UniToolButton2Click(Sender: TObject);
    procedure UniToolButton3Click(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TUniTreeNode);
    procedure UniToolButton6Click(Sender: TObject);
    procedure UniToolButton8Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniToolButton10Click(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniToolButton11Click(Sender: TObject);
    procedure UniToolButton13Click(Sender: TObject);
    procedure UniToolButton14Click(Sender: TObject);
    procedure RegionComboChange(Sender: TObject);
  private
    { Private declarations }
    PSelected : TUniControl;
    FGrid: TIQUniGridControl;
    FIconLookup: TStrings;
    FSelFields: TList;
    procedure PopulateTree(const Selected: TControl = nil);
    procedure NewControl(const ACat: Integer);
    procedure CallbackType(Sender: TComponent; AResult:Integer);
    procedure CallbackParent(Sender: TComponent; AResult:Integer);
    procedure CallbackMove(Sender: TComponent; AResult:Integer);
    function GetParentTab(const C: TControl): TControl;
    function CloneControl(var Source: TUniControl): TUniControl;
    procedure FocusParentTab(C: TControl);
    procedure FocusControl(C: TUniControl; State: Boolean);
    procedure SelectControl(C: TControl);
    procedure PopulateClassIcons;
    procedure CreateNewControl(AClass: TUniControlClass; const AParent, ALayout, ARegion: string );
    procedure FieldsToEditors;
    procedure GenerateEditors(AFields: TList; ATarget: TIQUniFieldSet);
  public
    { Public declarations }
    procedure DoDestroy; override;
    property Grid: TIQUniGridControl read FGrid write FGrid;
  end;

implementation

uses
  uniGUIApplication, IQGridDesignerSelectFrm, IQUniEditor, uniGUIUtils,
  uniGUIJSInterface, IQUniEditorFieldsDlg, IQUniEditorUtils;


{$R *.dfm}

function TIQUniGridDesigner.GetParentTab(const C: TControl): TControl;
begin
  Result := C;
  while Assigned(Result) and (not (Result is TUniTabSheet)) do
    Result := Result.Parent;
end;

procedure TIQUniGridDesigner.PopulateClassIcons;

const
  ICON_SIZE = '16';

  function GetBaseResName(AClass: TClass): string;
  begin
    Result := AClass.ClassName + ICON_SIZE;

    while FindResource(HInstance, PChar(Result), RT_BITMAP) = 0 do
    begin
      AClass := AClass.ClassParent;
      Result := AClass.ClassName + ICON_SIZE;

      if AClass = TUniControl then
      begin
        Result := '';
        Break;
      end;
    end;
  end;

  procedure RegisterClassIcon(AClass: TClass);
  var
    MClass, AResName : string;
    B : TUniBitmap;
    Ix: Integer;
  begin
    if AClass <> nil then
    begin
      MClass := AClass.ClassName;
      AResName := GetBaseResName(AClass);

      if AResName <> '' then
      begin
        B := TUniBitmap.Create;
        try
          B.TransparentColor := clFuchsia;
          B.LoadFromResourceName(HInstance, AResName);

          Ix := ClassIcons.AddMasked(B, clFuchsia);
          FIconLookup.AddObject(MClass, TObject(Ix));
        finally
          B.Free;
        end;
      end;
    end;
  end;

var
  AClass: TClass;
  I: Integer;
begin
  RegisterClassIcon(TIQUniPanel);
  RegisterClassIcon(TIQUniTabForm);
  RegisterClassIcon(TIQUniFieldSet);

  for I := 0 to RegisteredEditors.Count - 1 do
  begin
    AClass := TClass(RegisteredEditors.Objects[I]);
    RegisterClassIcon(AClass);
  end;
end;

procedure TIQUniGridDesigner.PopulateTree(const Selected: TControl = nil);
var
  IQList: TList;
  I, Ix : Integer;
  Root, Prn: TWinControl;
  PrnNode: TUniTreeNode;
  C : TControl;
  ANode : TUniTreeNode;
  S : string;
begin
  Root := FGrid.FormTab;
  IQList := TList.Create;
  try
    for I := 0 to FGrid.IQControls.Count - 1 do
      IQList.Add(FGrid.IQControls[I]);

    SortControls(IQList, Root);

    TreeView.BeginUpdate;
    try
      TreeView.Items.Clear;
      ANode := TreeView.Items.Add(nil, FGrid.Name);
      ANode.Data := FGrid;

      for I := 0 to IQList.Count - 1 do
      begin
        C := TControl(IQList[I]);
        if C is TIQUniTabForm then
          Prn := (C as TIQUniTabForm).PageControl.Parent
        else
          Prn := C.Parent;

        if Prn = Root then
          PrnNode := nil
        else
          PrnNode := TreeView.Items.FindNodeByCaption(Prn.Name);

        ANode := TreeView.Items.Add(PrnNode, C.Name);
        ANode.Data := C;

        Ix := FIconLookup.IndexOf(C.ClassName);
        if Ix > -1 then
          Ix := Integer(FIconLookup.Objects[Ix]);

        ANode.ImageIndex := Ix;
      end;

      if TreeView.Items.Count > 0 then
      begin
        if Selected<>nil then
        begin
          S := Selected.Name;
          TreeView.Selected := TreeView.Items.FindNodeByCaption(S);
        end
        else
          TreeView.Selected := TreeView.Items[0];

        if TreeView.Selected<>nil then
          SelectControl(TreeView.Selected.Data);
      end;
    finally
      TreeView.EndUpdate;
    end;

  finally
    IQList.Free;
  end;
end;

procedure TIQUniGridDesigner.RegionComboChange(Sender: TObject);
var
  C : TControl;
  IL : IUniLayout;
begin
  C := TreeView.Selected.Data;

  if Supports(C, IUniLayout, IL) then
    IL.LayoutConfig.Region := RegionCombo.Text;
end;

procedure TIQUniGridDesigner.FocusParentTab(C: TControl);
begin
  if Assigned(C.Parent) and (C.Parent.Visible) then
  begin
    C := GetParentTab(C);
    if C is TUniTabSheet then
      (C as TUniTabSheet).PageControl.ActivePage := TIQUniTabForm(C);
  end;
end;

procedure TIQUniGridDesigner.FocusControl(C: TUniControl; State: Boolean);
begin
  if C is TUniContainer then
  begin

  end
  else if C is TUniControl then
    if State then
    begin
      C.WebFocus;
      if C.JSControl <> nil then
        (Self.WebForm as IUniJSInterface).JSAssign('getEl().dom.style.backgroundColor',['#ccc'], C.JSControl);
//      (C as IUniJSInterface).JSAssign('getEl().dom.style.backgroundColor',['lime']);
    end
    else
    begin
      if C.JSControl <> nil then
        (Self.WebForm as IUniJSInterface).JSAssign('getEl().dom.style.backgroundColor',[''], C.JSControl);
    end;
end;

procedure TIQUniGridDesigner.SelectControl(C: TControl);
var
  IL : IUniLayout;
begin
  UniPropertyGrid1.AttachedComponent := C;
  if Assigned(C) then
  begin
    FocusParentTab(C);

    if Assigned(C.Parent) and C.Parent.Visible then
    begin
      FocusControl(PSelected, False);
      PSelected := TUniControl(C);
      FocusControl(TUniControl(C), True);
    end;

    if Supports(C, IUniLayout, IL) then
    begin
      RegionCombo.Enabled := True;
      RegionCombo.Text := IL.LayoutConfig.Region;
    end
    else
      RegionCombo.Enabled := False;
  end;
end;

procedure TIQUniGridDesigner.TreeViewChange(Sender: TObject; Node: TUniTreeNode);
var
  C : TControl;
begin
  C := Node.Data;

  SelectControl(C);
end;

procedure TIQUniGridDesigner.UniFormBeforeShow(Sender: TObject);
begin
  if Assigned(FGrid) then
  begin
    Caption := 'Grid Designer' + '-' + FGrid.Name;
    PopulateTree;
  end;
end;

procedure TIQUniGridDesigner.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FocusControl(PSelected, False);
end;

procedure TIQUniGridDesigner.UniFormCreate(Sender: TObject);
begin
  FIconLookup := TStringList.Create;
  PopulateClassIcons
end;

procedure TIQUniGridDesigner.CallbackMove(Sender: TComponent; AResult: Integer);
var
  S : string;
  Pnl: TWinControl;
  C : TUniControl;
begin
  S := (Sender as TIQDesignerSelectForm).Result;
  C := TreeView.Selected.Data;

  if (S <> '') and Assigned(C) then
  begin
    Pnl := FGrid.FindComponent(S) as TWinControl;

    PSelected := nil;

    if C is TUniContainer then
      C.Parent := Pnl
    else
    begin
//      C := CloneControl(C);
      C.Parent := Pnl;
    end;

    PopulateTree(C);
  end;
end;

function TIQUniGridDesigner.CloneControl(var Source: TUniControl): TUniControl;
var
  M : TMemoryStream;
begin
  M := TMemoryStream.Create;
  try
    M.WriteComponent(Source);
    FGrid.DeleteIQControl(Source);
    Result := FGrid.CreateIQControl(TUniControlClass(Source.ClassType), Source.Name);

    M.Position := 0;
    M.ReadComponent(Result);
  finally
    M.Free;
  end;
end;

procedure TIQUniGridDesigner.DoDestroy;
begin
  FIconLookup.Free;
  FSelFields.Free;
  inherited;
end;

procedure TIQUniGridDesigner.CreateNewControl(AClass: TUniControlClass; const AParent, ALayout, ARegion: string );
var
  Pnl: TWinControl;
  C : TUniControl;
  IL : IUniLayout;
  PNode : TUniTreeNode;
begin
  Pnl := FGrid.FindComponent(AParent) as TWinControl;
  C := FGrid.CreateIQControl(AClass, uniUniqueComponentName(AClass.ClassName, FGrid), Pnl);

  PNode := TreeView.Items.FindNodeByCaption(Pnl.Name);
  PNode := TreeView.Items.Add(PNode, C.Name);
  PNode.Data := C;

  if C is TUniContainer then
  begin
    TUniContainer(C).Layout := ALayout;
    TUniContainer(C).LayoutConfig.Region := ARegion;
    if Supports(Pnl, IUniLayout, IL) then
      if IL.Layout = 'border' then
        TUniContainer(C).LayoutConfig.Split := True;
  end;

  if C is TIQUniTabForm then
    TIQUniTabForm(C).Caption := C.Name;

  if C is TUniFormControl then
    FGrid.AdjustEditorProps(C);
  PopulateTree(C);
end;

procedure TIQUniGridDesigner.CallbackParent(Sender: TComponent; AResult: Integer);
var
  Sl : TUniFormControlClass;
  Cat : Integer;
  SParent, PrnLayout, Layout : string;
  F1 : TIQDesignerSelectForm;
  Prn : TUniContainer;
begin
  Sl := TUniFormControlClass((Sender as TIQDesignerSelectForm).ResultClass);
  SParent := (Sender as TIQDesignerSelectForm).Result;
  Cat := (Sender as TIQDesignerSelectForm).Category;
  Layout := (Sender as TIQDesignerSelectForm).Data;

  if SParent <> '' then
  begin
    Prn := FGrid.FindComponent(SParent) as TUniContainer;
    Assert(Prn <> nil);

    PrnLayout := Prn.Layout;

    if (Cat <> IQCategoryEditor) and (PrnLayout = 'border') then
    begin
      F1 := TIQDesignerSelectForm.Create(UniApplication);
      F1.UniListBox.Items.Add('north');
      F1.UniListBox.Items.Add('south');
      F1.UniListBox.Items.Add('west');
      F1.UniListBox.Items.Add('east');
      F1.UniListBox.Items.Add('center');
      F1.ShowList('Please select a Region',
        procedure(Sender: TComponent; AResult: Integer )
        begin
          CreateNewControl(sl, SParent, Layout, (Sender as TIQDesignerSelectForm).Result);
        end
      );


    end
    else
      CreateNewControl(sl, SParent, Layout, '');
  end
  else
    ShowMessage('No Parent Specified');
end;

procedure TIQUniGridDesigner.CallbackType(Sender: TComponent; AResult: Integer);
var
  Sl : TUniFormControlClass;
  F1 : TIQDesignerSelectForm;
  Cat, I : Integer;
  S : string;
begin
  Sl := TUniFormControlClass((Sender as TIQDesignerSelectForm).ResultClass);
  Cat := (Sender as TIQDesignerSelectForm).Category;

  if Assigned(Sl) then
  begin
    F1 := TIQDesignerSelectForm.Create(UniApplication);
    try
      F1.ResultClass := Sl;
      F1.Category := Cat;

//      if (Cat = IQCategoryForm) or (Cat = IQCategoryPanel) then
      if False then  // skip layout dialog and set "border" as default layout
      begin
        F1.UniListBox.Items.Add('Border Layout');
        F1.UniListBox.Items.Add('Fit Layout');
        F1.UniListBox.Items.Add('Anchor Layout');
        F1.ShowList('Please select a Layout',
          procedure(Sender: TComponent; AResult: Integer )
          begin
            I := (Sender as TIQDesignerSelectForm).ItemIndex;
            F1 := TIQDesignerSelectForm.Create(UniApplication);
            try
              F1.ResultClass := Sl;
              F1.Category := Cat;   // very bad design!!!  we need to relay dialog parameters to each new dialog
              case I of
                0 : F1.Data := 'border';
                1 : F1.Data := 'fit';
                2 : F1.Data := 'anchor';
              else
                F1.Data := 'form';
              end;
              FGrid.PopulateParents(F1.UniListBox.Items, Cat);
              F1.ShowList('Please select a target', CallbackParent);
            except
              F1.Release;
              raise;
            end;
          end
        );
      end
      else
      begin
        FGrid.PopulateParents(F1.UniListBox.Items, Cat);
        if (Cat = IQCategoryForm) or (Cat = IQCategoryPanel) then
          F1.Data := 'border'
        else
          F1.Data := '';

        F1.ShowList('Please select a Target', CallbackParent);
      end;
    except
      F1.Release;
      raise;
    end;
  end;

end;

procedure TIQUniGridDesigner.NewControl(const ACat: Integer);
var
  F1 : TIQDesignerSelectForm;
begin
  F1 := TIQDesignerSelectForm.Create(UniApplication);
  try
    F1.Category := ACat;
    case ACat of
      IQCategoryForm : F1.ShowList('Select a Form Type', RegisteredForms, CallbackType);
      IQCategoryPanel : F1.ShowList('Select a Panel Type', RegisteredPanels, CallbackType);
      IQCategoryFieldSet : F1.ShowList('Select a FieldSet Type', RegisteredFieldSets, CallbackType);
      IQCategoryEditor : F1.ShowList('Select an Editor Type', RegisteredEditors, CallbackType);

    end;
  except
    F1.Release;
    raise;
  end;
end;

procedure TIQUniGridDesigner.UniToolButton10Click(Sender: TObject);
begin
  PopulateTree(PSelected);
end;

procedure TIQUniGridDesigner.UniToolButton11Click(Sender: TObject);
begin
  NewControl(IQCategoryFieldSet);
end;

procedure TIQUniGridDesigner.UniToolButton13Click(Sender: TObject);
begin
  Close;
end;

procedure TIQUniGridDesigner.UniToolButton14Click(Sender: TObject);
begin
  FieldsToEditors;
end;

procedure TIQUniGridDesigner.UniToolButton1Click(Sender: TObject);
begin
  NewControl(IQCategoryForm);
end;

procedure TIQUniGridDesigner.UniToolButton2Click(Sender: TObject);
begin
  NewControl(IQCategoryPanel);
end;

procedure TIQUniGridDesigner.UniToolButton3Click(Sender: TObject);
begin
  NewControl(IQCategoryEditor);
end;

procedure TIQUniGridDesigner.UniToolButton6Click(Sender: TObject);
var
  C : TControl;
  F1 : TIQDesignerSelectForm;
begin
  if TreeView.Selected <> nil then
  begin
    C := TreeView.Selected.Data;
    if C is TUniFormControl then
    begin
      F1 := TIQDesignerSelectForm.Create(UniApplication);
      try
        FGrid.PopulateParents(F1.UniListBox.Items, IQCategoryEditor, C.Parent.Name);
        F1.ShowList('Please select a target', CallbackMove);
      except
        F1.Release;
        raise;
      end;
    end
    else
      ShowMessage('Please select an editor first.');
  end;
end;

procedure TIQUniGridDesigner.UniToolButton8Click(Sender: TObject);
var
  C : TControl;
begin
  C := TreeView.Selected.Data;
  if C is TUniFormControl then
    MessageDlg('Are you sure you want to delete this editor?', mtWarning, mbYesNo,
      procedure(Sender: TComponent; AResult:Integer)
      begin
        if AResult = mrYes then
        begin
          FGrid.DeleteIQControl(C);
          PSelected := nil;
          PopulateTree(nil);
        end;
      end
    )
  else
    ShowMessage('Please select an editor first.');

end;

procedure TIQUniGridDesigner.GenerateEditors(AFields: TList; ATarget: TIQUniFieldSet);
var
  I: Integer;
  FField: TField;
  FEditor : TUniFormControl;
begin
  for I := 0 to AFields.Count - 1 do
  begin
    FField := TField(AFields[I]);
    FEditor := GetEditorInstance(FGrid, ATarget, FField);
  end;
  PopulateTree(ATarget);
end;

procedure TIQUniGridDesigner.FieldsToEditors;
var
  F1 : TIQDesignerSelectForm;
  SParent : string;
  SParentContainer: TIQUniFieldSet;
begin
  with TIQFieldSelect.Create(UniApplication) do
  begin
    DataSource := FGrid.DataSource;
    ShowModal(
      procedure(Sender: TComponent; AResult:Integer)
      begin
        if AResult = mrOK then
        begin
          if FSelFields = nil then FSelFields := TList.Create;
          FSelFields.Clear;
          FSelFields.Assign( (Sender as TIQFieldSelect).SelectedFields);
          if FSelFields.Count > 0 then
          begin
            F1 := TIQDesignerSelectForm.Create(UniApplication);
            FGrid.PopulateParents(F1.UniListBox.Items, IQCategoryFieldEditor);
            F1.ShowList('Please select a target',
              procedure(Sender: TComponent; AResult:Integer)
              begin
                SParent := (Sender as TIQDesignerSelectForm).Result;
                if SParent <> '' then
                begin
                  SParentContainer := FGrid.FindComponent(SParent) as TIQUniFieldSet;
                  SelectControl(SParentContainer);

                  GenerateEditors(FSelFields, SParentContainer);
                end;
              end
            );
          end;
        end;
      end
    );
  end;
end;

end.
