unit gl_visu;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniTreeView,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, uniFileUpload;

type
  TFrmGLVisual = class(TUniForm)
    Panel1: TUniPanel;
    TreeView1: TUniTreeView;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Edit1: TUniEdit;
    PopupMenu1: TUniPopupMenu;
    AddtoBottom1: TUniMenuItem;
    AddFirst1: TUniMenuItem;
    AddChild1: TUniMenuItem;
    AddChildFirst1: TUniMenuItem;
    Insert1: TUniMenuItem;
    N1: TUniMenuItem;
    RemoveNode1: TUniMenuItem;
    N2: TUniMenuItem;
    ExpandAll1: TUniMenuItem;
    Shrink1: TUniMenuItem;
    Expand1: TUniMenuItem;
    Clear1: TUniMenuItem;
    ListBox1: TUniListBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    Open1: TUniMenuItem;
    Save1: TUniMenuItem;
    SaveAs1: TUniMenuItem;
    N3: TUniMenuItem;
    Exit1: TUniMenuItem;
    Options1: TUniMenuItem;
    Help1: TUniMenuItem;
    Panel2: TUniPanel;
    StatusBar1: TUniStatusBar;
    SaveDialog1: TSaveDialog;
    LoadDefault1: TUniMenuItem;
    N4: TUniMenuItem;
    sbtnOpenDoc: TUniSpeedButton;
    sbtnSave: TUniSpeedButton;
    sbtnNewFile: TUniSpeedButton;
    sbtnPromote: TUniSpeedButton;
    sbtnDemote: TUniSpeedButton;
    UniFileUpload1: TUniFileUpload;

    procedure AddtoBottom1Click(Sender: TObject);
    procedure AddFirst1Click(Sender: TObject);
    procedure AddChild1Click(Sender: TObject);
    procedure AddChildFirst1Click(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure RemoveNode1Click(Sender: TObject);
    procedure Expand1Click(Sender: TObject);
    procedure ExpandAll1Click(Sender: TObject);
    procedure Shrink1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure LoadDefault1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TUniTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sbtnOpenDocClick(Sender: TObject);
    procedure sbtnSaveClick(Sender: TObject);
    procedure sbtnPromoteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HandleNodes(Sender:TObject);
  end;

implementation
// uses
//  gl;
{$R *.DFM}

procedure TFrmGLVisual.LoadDefault1Click(Sender: TObject);
var
  MyTreeNode1, MyTreeNode2: TUniTreeNode;
  MyBitMap:TBitMap;
begin
//  MyBitMap.LoadFromFile('c:\iqwin\bmp\form.bmp');
  with TreeView1.Items do
  begin
    {Adds a root node}
    Add(TreeView1.Selected, 'RootTreeNode1');

    {Sets MyTreeNode to first node in}
    {tree view and adds a child node to it}
    MyTreeNode1 := TreeView1.Items[0];
    AddChild(MyTreeNode1,'ChildNode1');

    {Adds a root node}
    Add(TreeView1.Selected, 'RootTreeNode2');

    {Sets MyTreeNode to third node in}
    {tree view and adds a child node to it}
    MyTreeNode2:=TreeView1.items[2];
    AddChild(MyTreeNode2,'ChildNode2');

    {Sets MyTreeNode to fourth node in}
    {tree view and adds a child node to it}
    MyTreeNode2:=TreeView1.items[3];
    AddChild(MyTreeNode2,'ChildNode2a');

    {Sets MyTreeNode to fifth node in}
    {tree view and adds a child node to it}

    MyTreeNode2:=TreeView1.items[4];
    Add(MyTreeNode2,'ChildNode2b');

    {add another root node}
    Add(TreeView1.Selected, 'RootTreeNode3');
  end;
 end;

procedure TFrmGLVisual.AddtoBottom1Click(Sender: TObject);
begin
   TreeView1.Items.Add(TreeView1.Selected, Edit1.Text);

end;
procedure TFrmGLVisual.HandleNodes(Sender:TObject);
begin
with TreeView1 do
  begin
  end;
end;
procedure TFrmGLVisual.AddFirst1Click(Sender: TObject);
begin
TreeView1.Items.Add(TreeView1.Selected, Edit1.Text);
end;

procedure TFrmGLVisual.AddChild1Click(Sender: TObject);
begin
TreeView1.Items.AddChild(TreeView1.Selected, Edit1.Text);
end;

procedure TFrmGLVisual.AddChildFirst1Click(Sender: TObject);
begin
TreeView1.Items.AddChild(TreeView1.Selected, Edit1.Text);
end;

procedure TFrmGLVisual.Insert1Click(Sender: TObject);
begin
TreeView1.Items.Add(TreeView1.Selected, Edit1.Text);
end;

procedure TFrmGLVisual.RemoveNode1Click(Sender: TObject);
begin
TreeView1.Selected.Destroy;
end;

procedure TFrmGLVisual.Expand1Click(Sender: TObject);
begin
TreeView1.Selected.Expand(True);
end;

procedure TFrmGLVisual.ExpandAll1Click(Sender: TObject);
begin
TreeView1.FullExpand;
end;

procedure TFrmGLVisual.Shrink1Click(Sender: TObject);
begin
TreeView1.Selected.Collapse(True);
end;

procedure TFrmGLVisual.Clear1Click(Sender: TObject);
begin
TreeView1.Items.Clear;
end;

procedure TFrmGLVisual.Open1Click(Sender: TObject);
begin
   if UniFileUpload1.Execute then
    begin
//      TreeView1.LoadFromFile(UniFileUpload1.FileName);
//      TreeView1.SetFocus;
    end;

end;

procedure TFrmGLVisual.Save1Click(Sender: TObject);
begin
//   TreeView1.SaveToFile('TreeList.txt');

end;

procedure TFrmGLVisual.SaveAs1Click(Sender: TObject);
begin
//   If SaveDialog1.Execute then
//      TreeView1.SaveToFile(SaveDialog1.FileName);
end;



procedure TFrmGLVisual.TreeView1Change(Sender: TObject; Node: TUniTreeNode);
begin
 With StatusBar1.Panels do
   begin
      Items[0].Text:= 'Ll: '     + IntToStr(TreeView1.Selected.Level);
//      Items[1].Text:= 'Idx: '    + IntToStr(TreeView1.Selected.Index);
      Items[2].Text:= 'AbsIdx: ' + IntToStr(TreeView1.Selected.AbsoluteIndex);
      Items[3].Text:= 'ItemID: ' + TreeView1.Selected.Text;
   end;
end;

procedure TFrmGLVisual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TFrmGLVisual.Exit1Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmGLVisual.TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if button = mbLeft then
       TreeView1.BeginDrag(False);

end;

procedure TFrmGLVisual.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept := True;

end;

procedure TFrmGLVisual.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
//var
//  AnItem: TUniTreeNode;
//  AttachMode: TNodeAttachMode;
//  HT: THitTests;
begin
//  With StatusBar1.Panels do
//    Begin
//      Items[0].Text := 'DropLvl '   + IntToStr(TreeView1.DropTarget.Level);
//      Items[1].Text := 'DropIdx '   + IntToStr(TreeView1.DropTarget.Index);
//      Items[2].Text := 'DropAbsInx '+ IntToStr(TreeView1.DropTarget.AbsoluteIndex);
//      Items[3].Text := 'DropID '    + TreeView1.DropTarget.Text;
//    end;
//
//  if TreeView1.Selected = nil then Exit;
//  HT := TreeView1.GetHitTestInfoAt(X, Y);
//  AnItem := TreeView1.GetNodeAt(X, Y);
//  if (HT - [htOnItem, htOnIcon, htNowhere, htOnIndent] <> HT) then
//    begin
//      if (htOnItem in HT) or (htOnIcon in HT) then AttachMode := naAddChild
//      else if htNowhere in HT then AttachMode := naAdd
//      else if htOnIndent in HT then AttachMode := naInsert;
//      TreeView1.Selected.MoveTo(AnItem, AttachMode);
//    end;


end;

procedure TFrmGLVisual.sbtnOpenDocClick(Sender: TObject);
begin
   Open1Click(Sender);
end;

procedure TFrmGLVisual.sbtnSaveClick(Sender: TObject);
begin
 //  Save1Click(Sender);
end;

procedure TFrmGLVisual.sbtnPromoteClick(Sender: TObject);
var
  AnItem, TempItem:TUniTreeNode;
  CurLevel,NewLevel:integer;
begin
//  with TreeView1 do
//     AnItem:=TreeView1.Selected.Parent;  //.GetPrevChild(TreeView1.Selected);
//     TreeView1.Selected.MoveTo(AnItem,naAdd);
//
end;

end.
