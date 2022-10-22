unit Main;
{$I uniCompilers.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniSplitter, uniEdit, uniTreeView, uniStatusBar, uniMultiItem, uniComboBox,
  uniTimer, uniPageControl, uniButton, uniBitBtn, uniGUIFrame, umain, uniToolBar,
  uniImageList, uniLabel, Menus, uniMainMenu, pngimage, uniImage, uniMemo,
  IQModuleFormDesigner, IQUniModuleFrame,
  IQCore.Interfaces,
  IQWeb.Session.RegServices, IQMS.WebVcl.BookmarkManager;

type
  TMainForm = class(TUniForm)
    LeftPanel: TUniPanel;
    NavTree: TUniTreeView;
    UniStatusBar1: TUniStatusBar;
    CenterPanel: TUniContainerPanel;
    UniClockTimer: TUniTimer;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniToolBar1: TUniToolBar;
    UniToolButtonExpandAll: TUniToolButton;
    UniToolButtonCollapseAll: TUniToolButton;
    UniToolButton3: TUniToolButton;
    UniToolButtonCloseAllTabs: TUniToolButton;
    UniMainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Logout1: TUniMenuItem;
    UniToolButton5: TUniToolButton;
    SearchEdit: TUniComboBox;
    RightPanel: TUniPanel;
    BottomPanel: TUniPanel;
    UniToolButton1: TUniToolButton;
    ThemeComboBox: TUniComboBox;
    UniMemo1: TUniMemo;
    UniToolButton2: TUniToolButton;
    FavoritesMenu: TUniMenuItem;
    TreePopupMenu: TUniPopupMenu;
    AddtoFavorites1: TUniMenuItem;
    ToolImageList: TUniNativeImageList;
    ImageListNavTree: TUniNativeImageList;
    SysAdmTree: TUniTreeView;
    ImageListSysAdm: TUniNativeImageList;
    UniToolButtonAdminTools: TUniToolButton;
    UniSplitter1: TUniSplitter;
    UniSplitter2: TUniSplitter;
    UniSplitter3: TUniSplitter;
    HistoryMenu: TUniMenuItem;
    procedure UniClockTimerTimer(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure NavTreeClick(Sender: TObject);
    procedure TabSheetClose(Sender: TObject; var AllowClose: Boolean);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniPageControl1Change(Sender: TObject);
    procedure UniToolButtonExpandAllClick(Sender: TObject);
    procedure UniToolButtonCollapseAllClick(Sender: TObject);
    procedure UniToolButtonCloseAllTabsClick(Sender: TObject);
    procedure ThemeComboBoxChange(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure Navigate1Click(Sender: TObject);
    procedure SearchEditTriggerEvent(Sender: TUniCustomComboBox;
      AButtonId: Integer);
    procedure SearchEditChange(Sender: TObject);
    procedure NavTreeLoaded(Sender: TObject);
    procedure NavTreeCellContextClick(ANode: TUniTreeNode; X, Y: Integer);
    procedure AddtoFavorites1Click(Sender: TObject);
    procedure FavoritesMenuClick(Sender: TObject);
    procedure SysAdmTreeDblClick(Sender: TObject);
    procedure UniToolButtonAdminToolsClick(Sender: TObject);
  private
    { Private declarations }
    FPreviousSearchString : string;
    FIQWebBookmarkManager : TIQWebBookmarkManager;
    procedure RefreshTime;
    procedure ConstructNavigator;
    procedure GetThemes;
    procedure SearchTree(const AText: string);
    procedure LoadBookmarkMenuItems; // updates the UI
    {
    procedure StartDesigner;
    procedure AfterCreateModule(Sender: TObject);
    procedure BeforeDestroyModule(Sender: TObject);
    procedure LoadDesign(Sender: TObject; const Stream: TMemoryStream);
    procedure SaveDesign(Sender: TObject; const Stream: TMemoryStream);
    procedure NewDialog(Sender: TObject);
    procedure LoadDialog(Sender: TObject);
    procedure SaveDialog(Sender: TObject);
    procedure LoadModuleList(MList: TStrings);
    procedure DoAfterCreateFrame(Frame: TIQUniModuleFrame);
    procedure FrameDestroy(Sender: TObject);
    procedure DoBeforeDestroyFrame(Frame: TIQUniModuleFrame);
    }
  public
    { Public declarations }

    procedure ShowModuleAsTab(aModule : IIQModule; aID : integer);
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars,
  MainModule,
  uniGUIApplication,
  ServerModule,
  uniStrUtils,
  uniGUITheme,
  UniGUIJSUtils,
  System.Generics.Collections,
  IQWeb.Server.Registration,
  IQWeb.Session.Registration,
  DataSetAdmin,
  PickListAdmin,
  PickTreeAdmin,
  ModulesAdmin,
  PromptModule,
  LoadPromptModule,
  IQUniEditorUtils,
  {$IFDEF DEMO}
  demo_form_dispatcher,
  {$ENDIF}
  StrUtils,
  TestRegForms;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.SearchEditChange(Sender: TObject);
begin
  SearchTree(SearchEdit.Text);
end;

procedure TMainForm.SearchEditTriggerEvent(Sender: TUniCustomComboBox;
  AButtonId: Integer);
begin
  case AButtonId of
    0 : SearchTree(Sender.Text);
  end;
end;

procedure TMainForm.SearchTree(const AText: string);
var
  SearchString : string;
  NodeCaption  : string;
  I : Integer;
  aExpand : Boolean;
begin
  SearchString := Trim(AText);
  if SearchString <> FPreviousSearchString then
  begin
    FPreviousSearchString := LowerCase(SearchString);

    if (Length(SearchString) > 1) or (SearchString = '') then
    begin
      aExpand := SearchString <> '';

      NavTree.BeginUpdate;
      try
        NavTree.ResetData;
        for I := 0 to NavTree.Items.Count - 1 do
        begin
          NodeCaption := LowerCase(NavTree.Items[I].Text);
          NavTree.Items[I].Visible := (Length(SearchString) = 0) or (Pos(SearchString, NodeCaption)>0);
          NavTree.Items[I].Expanded := aExpand;
        end;
      finally
        NavTree.EndUpdate;
      end;
    end;
  end;
end;

procedure TMainForm.ShowModuleAsTab(aModule : IIQModule; aID : integer);
var
  Fr : TUniFrame;
  Ts : TUniTabSheet;
  Li : IIQLocatable;
begin
  Fr := aModule.Instance as TUniFrame;
  if not Assigned(Fr) then
    raise Exception.Create(Format('Module <%s> not available!', [aModule]));

  Ts := TUniTabSheet.Create(Self);
  Ts.PageControl := UniPageControl1;

  if aID >= 0 then
    if Supports(Fr, IIQLocatable, Li) then
      Li.LocateID(aID)
    else
      raise Exception.Create(Format('Module <%s> does not support "locatable" interface!', [aModule.Name]));

  Ts.Caption    := aModule.Name;
  if aID >= 0 then
    Ts.Caption := Format('%s = (%d)', [Ts.Caption, aID]);
  Ts.ImageIndex := aModule.IconIndex;

  Ts.AlignmentControl := uniAlignmentClient;
  Ts.Layout     := 'fit';
  Ts.Closable   := True;
  Ts.OnClose    := TabSheetClose;

  Fr.Align  := alClient;
  Fr.Parent := Ts;

  UniPageControl1.ActivePage := Ts;
end;

procedure TMainForm.SysAdmTreeDblClick(Sender: TObject);
begin
  if SysAdmTree.Selected.Text = 'Modules' then
    ModulesAdm.ShowModal
  else if SysAdmTree.Selected.Text = 'DataModules' then
    ModulesAdm.ShowModal
  else if SysAdmTree.Selected.Text = 'Forms' then
    ModulesAdm.ShowModal
  else if SysAdmTree.Selected.Text = 'DataSets' then
    DataSetAdm.ShowModal
  else if SysAdmTree.Selected.Text = 'PickLists' then
    PickListAdm.ShowModal
  else if SysAdmTree.Selected.Text = 'PickTrees' then
    PickTreeAdm.ShowModal
  else
    inherited;
end;

procedure TMainForm.UniClockTimerTimer(Sender: TObject);
begin
  RefreshTime;
end;

procedure TMainForm.LoadBookmarkMenuItems;

  procedure UpdateBookmarkMenuUI(ParentMenuItem: TUniMenuItem; Bookmarks: TIQWebBookmarkList);
  var
    i: integer;
    idx : integer;
    MenuItem: TUniMenuItem;
    Bookmark: TIQWebBookmarkItem;
  begin
    idx := -1;
    // delete any existing menu items in UI
    for i := ParentMenuItem.Count - 1 downto 0 do
    begin
      MenuItem := ParentMenuItem[i];
      ParentMenuItem.Remove(MenuItem);
      FreeAndNil(MenuItem);
    end;

    if Bookmarks.Count = 0 then
    begin
      MenuItem := TUniMenuItem.Create(ParentMenuItem);
      MenuItem.Caption := 'No history items found';
      ParentMenuItem.Insert(0, MenuItem);
    end
    else
      // recreate all menu items in UI
      for Bookmark in Bookmarks do
      begin
        MenuItem := TUniMenuItem.Create(ParentMenuItem);
        MenuItem.Caption := Bookmark.Caption;
        MenuItem.Tag := UniInteger(Bookmark);
        MenuItem.OnClick := FIQWebBookmarkManager.BookmarkClick;
        Inc(idx);
        ParentMenuItem.Insert(idx, MenuItem);
      end;
  end;

begin
  FIQWebBookmarkManager.LoadBookmarks;
  UpdateBookmarkMenuUI(HistoryMenu, FIQWebBookmarkManager.History);
//UpdateBookmarkMenuUI(FavoritesMenu, FIQWebBookmarkManager.Favorites);
end;

procedure TMainForm.Logout1Click(Sender: TObject);
begin
  UniMainModule.Logout(true);
  Close;
end;

procedure TMainForm.FavoritesMenuClick(Sender: TObject);
var
  aNode : TUniTreeNode;
begin
  aNode := Pointer((Sender as TUniMenuItem).Tag);
  if Assigned(aNode) then
  begin
    NavTree.Selected := aNode;
    NavTreeClick(aNode);
  end;
end;

procedure TMainForm.GetThemes;
var
  S : TUniStringArray;
  I : Integer;
begin
  S := UniServerModule.ThemeManager.AllThemes;

  ThemeComboBox.Items.Clear;
  for I := Low(S) to High(S) do
    ThemeComboBox.Items.Add(S[I]);
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  UniMainModule.UserMainForm := Self;
  RegSessionWeb;

  RefreshTime;

  ConstructNavigator;
  GetThemes;
  ThemeComboBox.Text := UniMainModule.Theme;

  SearchEdit.Text := '';

  {$IFDEF DEMO}
  //Requested by sales for demo presentation
  UniToolBar1.Visible  := False;
  RightPanel.Collapsed := True;
  BottomPanel.Collapsed:= True;
  NavTree.FullExpand;
  {$ENDIF}

{$ifdef COMPILER_14_UP}
  with FormatSettings do
{$endif}
  begin
    DateSeparator:='/';
    CurrencyFormat:=0;
    CurrencyString:='$';
  end;

  FIQWebBookmarkManager := TIQWebBookmarkManager.Create;
  LoadBookmarkMenuItems;
end;

procedure TMainForm.UniFormDestroy(Sender: TObject);
begin
  UniToolButtonCloseAllTabsClick(Sender);

  FreeAndNil(FIQWebBookmarkManager);

  UniMainModule.UserMainForm := nil;
end;

procedure TMainForm.UniPageControl1Change(Sender: TObject);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
begin
  Ts := UniPageControl1.ActivePage;
  Nd := Pointer(Ts.Tag);
  NavTree.Selected := Nd;
end;

procedure TMainForm.UniToolButtonExpandAllClick(Sender: TObject);
begin
  NavTree.FullExpand;
end;

procedure TMainForm.UniToolButtonCollapseAllClick(Sender: TObject);
begin
  NavTree.FullCollapse;
end;

procedure TMainForm.UniToolButtonAdminToolsClick(Sender: TObject);
begin
//  UniMainModule.UserIQRegVar.ShowModuleAsTab(FrmNameVinGenerator, 2);
//  StartDesigner;
  TestRegisteredForms.ShowModal;
end;

{$REGION RunTime-Designer}
{
procedure TMainForm.UniToolButtonAdminToolsClick(Sender: TObject);
begin
  StartDesigner;
end;

procedure TMainForm.DoAfterCreateFrame(Frame: TIQUniModuleFrame);
var
  DM : TComponent;
  II : IIQDataModuleFrameEventHandler;
begin
  if Assigned(Frame) and Assigned(Frame.Controller) then
  begin
    DM := Frame.Controller.Owner;
    if Supports(DM, IIQDataModuleFrameEventHandler, II) then
      II.DoOnFrameCreate(Frame);
  end;
end;

procedure TMainForm.DoBeforeDestroyFrame(Frame: TIQUniModuleFrame);
var
  DM : TComponent;
  II : IIQDataModuleFrameEventHandler;
begin
  if Assigned(Frame) and Assigned(Frame.Controller) then
  begin
    DM := Frame.Controller.Owner;
    if Supports(DM, IIQDataModuleFrameEventHandler, II) then
      II.DoOnFrameDestroy(Frame);
  end;
end;

procedure TMainForm.AfterCreateModule(Sender: TObject);
var
  Frame: TIQUniModuleFrame;
begin
  Frame := (Sender as TIQUniModuleFormDesigner).CurrentFrame;
  DoAfterCreateFrame(Frame);
end;

procedure TMainForm.BeforeDestroyModule(Sender: TObject);
var
  Frame: TIQUniModuleFrame;
begin
  Frame := (Sender as TIQUniModuleFormDesigner).CurrentFrame;
  DoBeforeDestroyFrame(Frame);
end;

procedure TMainForm.StartDesigner;
var
  Ts : TUniTabSheet;
  FDesigner : TIQUniModuleFormDesigner;
begin
  Ts := TUniTabSheet.Create(Self);
  Ts.PageControl := UniPageControl1;

  Ts.AlignmentControl := uniAlignmentClient;
  Ts.Layout     := 'fit';
  Ts.Closable   := True;
//    Ts.OnClose    := TabSheetClose;
//    Ts.Tag        := NativeInt(Nd);
//    Ts.ImageIndex := Nd.ImageIndex;

  Ts.Caption    := 'Module Designer';
  FDesigner := TIQUniModuleFormDesigner.Create(Self);
  FDesigner.Parent := Ts;
  FDesigner.AfterCreateModuleForm := AfterCreateModule;
  FDesigner.BeforeDestroyModuleForm := BeforeDestroyModule;
  FDesigner.OnSaveModuleForm := SaveDesign;
  FDesigner.OnLoadModuleForm := LoadDesign;
  FDesigner.OnNewDialog := NewDialog;
  FDesigner.OnLoadDialog := LoadDialog;
  FDesigner.OnSaveDialog := SaveDialog;
  UniPageControl1.ActivePage := Ts;
end;

procedure TMainForm.LoadModuleList(MList : TStrings);
var
  LoadFolder, cFolder : string;
  sr: TSearchRec;

  procedure LoadSubFolder;
  var
    sr: TSearchRec;
    cModule : string;
  begin
    if SysUtils.FindFirst(LoadFolder + cFolder + '\*.dfm', faAnyFile, sr) = 0 then
      begin
        repeat
          cModule := ExtractFileNameNoExt(sr.Name);
          MList.Values[cFolder] := cModule;
        until FindNext(sr) <> 0;
        FindClose(sr);
      end;
  end;
begin
  LoadFolder := UniServerModule.DFMFolder;

  if SysUtils.FindFirst(LoadFolder + '*.*', faDirectory, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory <> 0 then
      begin
        cFolder := sr.Name;
        if Copy(cFolder, 1, 1) <> '.' then
          LoadSubFolder;
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TMainForm.LoadDialog(Sender: TObject);
var
  MList : TStrings;
  Dsgn : TIQUniModuleFormDesigner;

begin
  Dsgn := Sender as TIQUniModuleFormDesigner;

  MList := TStringList.Create;
  try
    LoadModuleList(MList);
    if MList.Count > 0 then
    begin
      LoadPromptForm.AssignList(MList);
      LoadPromptForm.ShowModal(
        procedure(Sender: TComponent; AResult:Integer)
        begin
          if AResult = mrOK then
          begin
            Dsgn.ModuleCategory := (Sender as TLoadPromptForm).SelectedCategory;
            Dsgn.ModuleName := (Sender as TLoadPromptForm).SelectedModule;
            Dsgn.LoadModule;
          end;
        end
      );
    end;
  finally
    MList.Free;
  end;
end;

procedure TMainForm.SaveDialog(Sender: TObject);
begin
  (Sender as TIQUniModuleFormDesigner).SaveModule;
end;

procedure TMainForm.NewDialog(Sender: TObject);
var
  Dsgn : TIQUniModuleFormDesigner;
  category : IIQCategory;
  S : string;
  Cmb : TUniComboBox;
begin
  Dsgn := Sender as TIQUniModuleFormDesigner;
  Cmb := PromptModuleForm.UniComboBox1;
  Cmb.Clear;
  for category in UniMainModule.UserIQRegVar.Categories.Values do
  begin
    S := category.Name;
    Cmb.Items.Add(S);
  end;
  Cmb.Text := '';

  PromptModuleForm.Show
  (
    procedure(Sender: TComponent; AResult:Integer)
    begin
      if AResult = mrOK then
      begin
        Dsgn.ModuleCategory := PromptModuleForm.UniComboBox1.Text;
        Dsgn.ModuleName := PromptModuleForm.UniEdit1.Text;
        Dsgn.CreateNewModule;
      end;
    end
  );
end;

procedure TMainForm.SaveDesign(Sender: TObject; const Stream: TMemoryStream);
var
  SaveFolder : string;
begin
  SaveFolder := UniServerModule.DFMFolder + (Sender as TIQUniModuleFormDesigner).CurrentFrame.ModuleCategory+'\';
  if not DirectoryExists(SaveFolder) then
    CreateDir(SaveFolder);

  Stream.SaveToFile(SaveFolder + (Sender as TIQUniModuleFormDesigner).CurrentFrame.ModuleName + '.dfm');
end;

procedure TMainForm.LoadDesign(Sender: TObject; const Stream: TMemoryStream);
var
  LoadFolder : string;
begin
  LoadFolder := UniServerModule.DFMFolder + (Sender as TIQUniModuleFormDesigner).ModuleCategory + '\';
  if DirectoryExists(LoadFolder) then
    Stream.LoadFromFile(LoadFolder + (Sender as TIQUniModuleFormDesigner).ModuleName + '.dfm');
end;
}
{$ENDREGION}

procedure TMainForm.UniToolButtonCloseAllTabsClick(Sender: TObject);
var
  I: Integer;
  Ts : TUniTabSheet;
begin
  for I := UniPageControl1.PageCount - 1 downto 0 do
  begin
    Ts := UniPageControl1.Pages[I];
    if Ts.Closable then
      Ts.Close;
  end;
end;

procedure TMainForm.TabSheetClose(Sender: TObject; var AllowClose: Boolean);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
  Fr : TUniFrame;
begin
  Ts := Sender as TUniTabSheet;
  Nd := Pointer(Ts.Tag);
  if Assigned(Nd) then
  begin
    if (Ts.ControlCount>0) and (Ts.Controls[0] is TUniFrame) then
    begin
      Fr := Ts.Controls[0] as TUniFrame;
      if not (Fr is TIQUniModuleFrame) then
        UniMainModule.UserIQRegVar.ReleaseInstance(Fr);
    end;

    Nd.Data := nil;
    if NavTree.Selected = Nd then
      NavTree.Selected := nil;
  end;
  LoadBookmarkMenuItems;
end;

procedure TMainForm.ThemeComboBoxChange(Sender: TObject);
begin
  UniMainModule.Theme := ThemeComboBox.Text;
end;

procedure TMainForm.AddtoFavorites1Click(Sender: TObject);
var
  AText : string;
  AItem : TUniMenuItem;
  ANode : TUniTreeNode;
begin
  ANode := NavTree.Selected;
  if ANode <> nil then
  begin
    AText := ANode.Text;
    if FavoritesMenu.Find(AText) = nil then
    begin
      AItem := TUniMenuItem.Create(Self);
      AItem.Caption := AText;
      AItem.ImageIndex := ANode.ImageIndex;
      AItem.Tag := UniInteger(ANode);
      AItem.OnClick := FavoritesMenuClick;
      FavoritesMenu.Add(AItem);
    end;
  end;
end;

procedure TMainForm.ConstructNavigator;
begin
  UniServerModule.ServerRegistration.PopulateNavTree(NavTree, ImageListNavTree);
end;

procedure TMainForm.Navigate1Click(Sender: TObject);
var
  Nd : TUniTreeNode;
begin
  Nd := Pointer((Sender as TUniMenuItem).Tag);
  if Assigned(Nd) then
  begin
    NavTree.Selected := Nd;
    NavTreeClick(Nd);
  end;
end;

procedure TMainForm.NavTreeCellContextClick(ANode: TUniTreeNode; X, Y: Integer);
begin
  if ANode.Count = 0 then
    TreePopupMenu.Popup(X, Y);
end;

procedure TMainForm.NavTreeClick(Sender: TObject);
var
  Nd : TUniTreeNode;
  Ts : TUniTabSheet;
  Fr : TUniFrame;
  md : IIQModule;
  NdText : string;

begin
  Nd := NavTree.Selected;

  {$IFDEF DEMO}
  if demo_form_dispatcher.CheckExecuteDemo(Nd.Text) then
  begin
    UniPageControl1.ActivePageIndex:= 0;
    EXIT;
  end;
  {$ENDIF}

  if Nd.Count = 0 then
  begin
    Ts := Nd.Data;
    NdText := Nd.Text;

    if NdText <> '' then
      md := UniMainModule.UserIQRegVar.GetModuleByTreeCaption(NdText);

    if not Assigned(md) then
      exit;

    if not Assigned(Ts) or (Assigned(md) and not md.Singleton) then
    begin
      Ts := TUniTabSheet.Create(Self);
      Ts.PageControl := UniPageControl1;

      Ts.AlignmentControl := uniAlignmentClient;
      Ts.Layout     := 'fit';
      Ts.Closable   := True;
      Ts.OnClose    := TabSheetClose;
      Ts.Tag        := NativeInt(Nd);

//      DfmModule := False;
//      if Copy(NdText, 1 ,1) = '_' then
//      begin
//        DfmModule := True;
//        Delete(NdText, 1 ,1);
//      end;

      Ts.Caption    := NdText;
      Ts.ImageIndex := Nd.ImageIndex;

//      if DfmModule then
//      begin
//        Fr := TIQUniModuleFrame.Create(Self);
//        MM := TMemoryStream.Create;
//        try
//          MM.LoadFromFile(UniServerModule.DFMFolder + Nd.Parent.Text + '\' + NdText + '.dfm' );
//          LoadComponentFromStream(Self, Fr, MM);
//          DoAfterCreateFrame(Fr as TIQUniModuleFrame);
//          Fr.OnDestroy := FrameDestroy;
//        finally
//          MM.Free;
//        end;
//
//        Fr.Align  := alClient;
//        Fr.Parent := Ts;
//
//        Nd.Data := Ts;
//      end
//      else
      begin
        Fr := md.Instance as TUniFrame;

        if Assigned(Fr) then
        begin
          if not md.Singleton then
            Fr.Name := Fr.Name + IntToStr(md.Sequence);

          Fr.Align  := alClient;
          Fr.Parent := Ts;

          Nd.Data := Ts;
        end
        else
        begin
          UniPageControl1.RemoveControl(Ts);

          Abort;
        end;
      end;
    end;
    UniPageControl1.ActivePage := Ts;
  end;
end;

procedure TMainForm.NavTreeLoaded(Sender: TObject);
begin
  SearchEdit.SetFocus;
end;

procedure TMainForm.RefreshTime;
begin
  UniStatusBar1.Panels[0].Text := FormatDateTime('dd/mm/yyyy hh:nn', Now);
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
