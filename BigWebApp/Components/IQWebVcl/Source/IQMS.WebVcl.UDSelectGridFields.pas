unit IQMS.WebVcl.UDSelectGridFields;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.UDRecView,
  Data.DB,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniTreeView,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, uniImage;

type
  TFrmSelectGridFields = class(TUniForm)
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    popmTreeView: TUniPopupMenu;
    NewItem1: TUniMenuItem;
    NewSubItem1: TUniMenuItem;
    N1: TUniMenuItem;
    DeleteItem1: TUniMenuItem;
    DeleteAllItems1: TUniMenuItem;
    N2: TUniMenuItem;
    MoveUp1: TUniMenuItem;
    MoveDown1: TUniMenuItem;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnNewItem: TUniButton;
    btnNewSubItem: TUniButton;
    btnDeleteItem: TUniButton;
    btnDeleteAll: TUniButton;
    btnMoveUp: TUniButton;
    btnMoveDown: TUniButton;
    Bevel1: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    ListBox1: TUniListBox;
    Panel6: TUniPanel;
    TreeView1: TUniTreeView;
    Image1: TUniImage;
    QryUd_Rec_View: TFDQuery;
    N3: TUniMenuItem;
    EditLabel1: TUniMenuItem;
    N4: TUniMenuItem;
    Cancel1: TUniMenuItem;
    Panel7: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel8: TUniPanel;
    sbtnRight: TUniSpeedButton;
    sbtnLeft: TUniSpeedButton;
    Panel11: TUniPanel;
    Label3: TUniLabel;
    Panel10: TUniPanel;
    Label1: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NewItem1Click(Sender: TObject);
    procedure NewSubItem1Click(Sender: TObject);
    procedure DeleteItem1Click(Sender: TObject);
    procedure DeleteAllItems1Click(Sender: TObject);
    procedure MoveUp1Click(Sender: TObject);
    procedure MoveDown1Click(Sender: TObject);
    procedure sbtnRightClick(Sender: TObject);
    procedure Image1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Image1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure EditLabel1Click(Sender: TObject);
    procedure popmTreeViewPopup(Sender: TObject);
  private
    FIQUDRecView: TIQWebUDRecView;
    procedure LoadAvailableList;
    function GetDataSet: TDataSet;
    procedure AssignFieldsTo( AList: TStringList );

    procedure ClearTreeView;
    procedure FreeTreeNodeCargo( ANode: TUniTreeNode );
    procedure DeleteTreeBranch( ANode: TUniTreeNode );
    function FindFieldInTreeView( AFieldName: string ): Boolean;
    procedure CheckAddFromListBoxToTreeViewAsChildOf( AParentNode: TUniTreeNode );

    procedure LoadTreeView;
    procedure BuildNodes( AParentNode: TUniTreeNode; ATreeLevel: Integer );

    procedure SaveTreeView;
    procedure SaveTreeBranch( ANode: TUniTreeNode; AParent_ID: Real );
  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); override;
    class function Execute( AOwner: TComponent; AList: TStringList ):Boolean;
    property DataSet: TDataSet read GetDataSet;
  end;

var
  FrmSelectGridFields: TFrmSelectGridFields;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.ResourceStrings;

type
  TListBoxFieldCargo = class
    FieldName: string;
    constructor Create( AFieldName: string );
  end;

  TTreeViewFieldCargo = class
    FieldName : string;
    Caption: string;
    constructor Create( AFieldName, ACaption: string );
  end;


{ TListBoxFieldCargo }

constructor TListBoxFieldCargo.Create( AFieldName: string );
begin
  FieldName := AFieldName.Trim.ToUpper;
end;

{ TTreeViewFieldCargo }

constructor TTreeViewFieldCargo.Create(AFieldName, ACaption: string);
begin
  FieldName := AFieldName.Trim.ToUpper;
  Caption := ACaption.Trim;
end;


{ TFrmSelectGridFields }

class function TFrmSelectGridFields.Execute( AOwner: TComponent; AList: TStringList ):Boolean;
begin
  // Byron:  Partial internationalization since this is for developer use
  IQAssert( AOwner is TIQWebUDRecView, IQMS.WebVcl.ResourceStrings.cTXT0000227 {'Application Error:'} + #32#32 {spaces} + 'Unable to create object of type TFrmSelectGridFields. You must pass TIQWebUDRecView as owner of this object');
//  IQAssert( Assigned(TIQWebUDRecView(AOwner).wwDBGrid), IQMS.WebVcl.ResourceStrings.cTXT0000227 {'Application Error:'} + #32#32 {spaces} + 'Unable to create object of type TFrmSelectGridFields. You must assign wwDBGrid to UDRecView');

  with TFrmSelectGridFields.Create( AOwner ) do
  try
    Result:= ShowModal = mrOK;
    if Result then
       AssignFieldsTo( AList );
  finally
    Release;
  end;
end;

constructor TFrmSelectGridFields.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );

  FIQUDRecView:= TIQWebUDRecView( AOwner );
  IQRegFormRead( self, [ self ]);

  LoadAvailableList;
  LoadTreeView;
end;

procedure TFrmSelectGridFields.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSelectGridFields.FormDestroy(Sender: TObject);
begin
  ClearStringsOfObjects( ListBox1.Items );
  ClearTreeView;
end;

procedure TFrmSelectGridFields.ClearTreeView;
var
  ANode    : TUniTreeNode;
//  AOnChange: TTVChangedEvent;
begin
  with TreeView1 do
  try
//    AOnChange:= OnChange; OnChange := NIL;
    Items.BeginUpdate;
    ANode:= Items.GetFirstNode;
    while Assigned( ANode ) do
    begin
      FreeTreeNodeCargo( ANode );
//      ANode:= ANode.GetNext;
    end;
    Items.Clear;
  finally
//    OnChange:= AOnChange;
    Items.EndUpdate;
  end;
//  ListBox1.Repaint;
end;

procedure TFrmSelectGridFields.FreeTreeNodeCargo( ANode: TUniTreeNode );
begin
  if Assigned(ANode) and Assigned(ANode.Data) then
     TObject(ANode.Data).Free;
end;

function TFrmSelectGridFields.GetDataSet: TDataSet;
begin
  if Assigned( FIQUDRecView ) then
//     Result:= FIQMS.WebVcl.UDRecView.DataSet
  else
     Result:= NIL;
end;

procedure TFrmSelectGridFields.LoadAvailableList;
var
  I: Integer;
  ADataSet: TDataSet;
begin
  ClearStringsOfObjects( ListBox1.Items );
  ListBox1.Clear;

  if not Assigned(DataSet) then
     EXIT;

  for I:= 0 to DataSet.FieldCount - 1 do with DataSet.Fields[ I ] do
    if Visible then
       ListBox1.Items.AddObject( StrTran( StrTran( DisplayName, '~', ''), '  ', ' '),
                                 TListBoxFieldCargo.Create( FieldName ));
end;

procedure TFrmSelectGridFields.AssignFieldsTo( AList: TStringList );
var
  I: Integer;
begin
  AList.Clear;
  for I:= 0 to ListBox1.Items.Count - 1 do
    AList.Add( TListBoxFieldCargo( ListBox1.Items.Objects[ I ]).FieldName );
end;

procedure TFrmSelectGridFields.ListBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Sender = Source) and (Sender = ListBox1)
end;

procedure TFrmSelectGridFields.ListBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ ssLeft ]) and (ListBox1.ItemIndex > -1) then
     ListBox1.BeginDrag( FALSE );
end;

procedure TFrmSelectGridFields.ListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  APoint: TPoint;
  I     : Integer;
begin
  if Source is TUniListBox then
  begin
    APoint.X := X;
    APoint.Y := Y;
//    I:= ListBox1.ItemAtPos( APoint, TRUE );
    if (I > -1) and (ListBox1.ItemIndex <> I) then
      begin
        ListBox1.Items.Move( ListBox1.ItemIndex, I );
        ListBox1.ItemIndex:= I;
      end;
  end;
end;

procedure TFrmSelectGridFields.TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ANode: TUniTreeNode;
begin
  if (Shift = [ ssLeft ]) and (TreeView1.Selected <> NIL) then
     TreeView1.BeginDrag( FALSE )

  else if (Shift = [ ssRight ]) and (TreeView1.Selected <> NIL) then
  begin
//    ANode:= TreeView1.GetNodeAt(X, Y);
    if Assigned(ANode) then
       ANode.Selected:= TRUE;
  end;
end;

procedure TFrmSelectGridFields.TreeView1DragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Source = ListBox1) and (Sender = TreeView1)
           or
           (Sender = Source)
end;

procedure TFrmSelectGridFields.TreeView1DragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  AnItem: TUniTreeNode;
//  AttachMode: TNodeAttachMode;
//  HT: THitTests;
begin
//  AnItem:= TreeView1.GetNodeAt(X, Y);
//
//  {From TreeView - just rearrange}
//  if Sender = Source then
//  begin
//    HT    := TreeView1.GetHitTestInfoAt(X, Y);
//    if (HT - [htOnItem, htOnIcon, htNowhere, htOnIndent, htOnButton ] <> HT) then
//    begin
//      if (htOnItem in HT) or (htOnIcon in HT) then
//         AttachMode:= naAddChild
//      else if htNowhere in HT then
//         AttachMode := naAdd
//      else if (htOnIndent in HT) or (htOnButton in HT) then
//        AttachMode := naInsert;
//
//      TreeView1.Selected.MoveTo( AnItem, AttachMode );
//    end;
//    EXIT;
//  end;

  {Came from ListBox - add to treeview}
  CheckAddFromListBoxToTreeViewAsChildOf( AnItem );
end;

{
function TFrmSelectGridFields.FindFieldInTreeView( AFieldName: string ): Boolean;
var
  ANode: TTreeNode;
begin
  ANode:= TreeView1.Items.GetFirstNode;
  while Assigned(ANode) do
  begin
    if CompareText( AFieldName, TTreeViewFieldCargo( ANode.Data ).FieldName ) = 0 then
    begin
      Result:= TRUE;
      EXIT;
    end;
    ANode:= ANode.GetNext;
  end;
  Result:= FALSE;
end;
}

function TFrmSelectGridFields.FindFieldInTreeView( AFieldName: string ): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to TreeView1.Items.Count - 1 do
    if CompareText( AFieldName, TTreeViewFieldCargo( TreeView1.Items[i].Data ).FieldName ) = 0 then
      begin
        Exit(True);
      end;
end;

procedure TFrmSelectGridFields.CheckAddFromListBoxToTreeViewAsChildOf( AParentNode: TUniTreeNode );
var
  ANode: TUniTreeNode;
  I    : Integer;
begin
  with ListBox1, Items do
     if (ItemIndex > -1) and not FindFieldInTreeView( TListBoxFieldCargo( Objects[ ItemIndex ]).FieldName ) then
     begin
       {append to tree view}
       ANode:= TreeView1.Items.AddChild( AParentNode,
                                               Items[ ItemIndex ]);                                {display label = iq_caption}
       ANode.Data:=TTreeViewFieldCargo.Create( TListBoxFieldCargo( Objects[ ItemIndex ]).FieldName,  {fieldname}
                                                                           Items[ ItemIndex ] );
       ANode.Selected:= TRUE;

       {Move the field to the bottom in the listbox. Keep current ItemIndex}
       I:= ItemIndex;
       Move( ItemIndex, Count - 1 );
       ItemIndex:= I;
       //ItemIndex:= Count - 1;
     end;
end;

procedure TFrmSelectGridFields.NewItem1Click(Sender: TObject);
var
  AParentNode: TUniTreeNode;
  ANode      : TUniTreeNode;
begin
  {add user defined empty node (just text) as sibling}
  if TreeView1.Selected <> nil then
     AParentNode:= TreeView1.Selected.Parent
  else
     AParentNode:= NIL;

  ANode:= TreeView1.Items.AddChild( AParentNode, IQMS.WebVcl.ResourceStrings.cTXT0000228 {'User defined item'});
  ANode.Data:=TTreeViewFieldCargo.Create( '', '' );
  ANode.Selected:= TRUE;
end;

procedure TFrmSelectGridFields.NewSubItem1Click(Sender: TObject);
var
  ANode: TUniTreeNode;
begin
  ANode:= TreeView1.Items.AddChild( TreeView1.Selected, IQMS.WebVcl.ResourceStrings.cTXT0000228 {'User defined item'});
  ANode.Data:=TTreeViewFieldCargo.Create( '', '' );
  ANode.Selected:= TRUE;
end;

procedure TFrmSelectGridFields.DeleteItem1Click(Sender: TObject);
begin
  if TreeView1.Selected <> nil then
  begin
    DeleteTreeBranch( TreeView1.Selected );
    ListBox1.Update;
  end;
end;

procedure TFrmSelectGridFields.DeleteTreeBranch( ANode: TUniTreeNode );
begin
  if ANode = nil then
     EXIT;

  while ANode.HasChildren do
    DeleteTreeBranch( ANode.GetFirstChild );

  FreeTreeNodeCargo( ANode );
  ANode.Destroy;
end;

procedure TFrmSelectGridFields.DeleteAllItems1Click(Sender: TObject);
begin
  if IQConfirmYN( IQMS.WebVcl.ResourceStrings.cTXT0000229 {'Are you sure you want to delete all items?'} ) then
     ClearTreeView;
end;

procedure TFrmSelectGridFields.MoveUp1Click(Sender: TObject);
var
  ANode: TUniTreeNode;
begin
  if TreeView1.Selected = nil then
     EXIT;

//  ANode:= TreeView1.Selected.GetPrevSibling;
  if ANode = nil then
     EXIT;

//  TreeView1.Selected.MoveTo( ANode, naInsert );
end;

procedure TFrmSelectGridFields.MoveDown1Click(Sender: TObject);
var
  ANode: TUniTreeNode;
begin
  if TreeView1.Selected = nil then
     EXIT;

//  ANode:= TreeView1.Selected.GetNextSibling;
  if ANode = nil then
     EXIT;

//  ANode.MoveTo( TreeView1.Selected, naInsert );
end;

procedure TFrmSelectGridFields.sbtnRightClick(Sender: TObject);
begin
  CheckAddFromListBoxToTreeViewAsChildOf( NIL );
end;

procedure TFrmSelectGridFields.Image1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Source = TreeView1) and (TreeView1.Selected <> nil);
end;

procedure TFrmSelectGridFields.Image1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  btnDeleteItem.Click;
end;

procedure TFrmSelectGridFields.SaveTreeView;
begin
  with TFDConnection(FDManager.FindConnection('IQFD')) do
  try
    StartTransaction;

//    ExecuteCommandFmt('delete from ud_rec_view    '+
//              ' where userid = ''%s''     '+
//              '   and form_class = ''%s'' '+
//              '   and comp_path = ''%s''  ',
//              [ SecurityManager.UserName,
//                FIQMS.WebVcl.UDRecView.FormClass,
//                FIQMS.WebVcl.UDRecView.CompPath ]);

    SaveTreeBranch( TreeView1.Items.GetFirstNode, 0 );

    Commit;
  finally
    if InTransaction then
       RollBack;
  end;
end;

procedure TFrmSelectGridFields.btnOKClick(Sender: TObject);
begin
  SaveTreeView;
  ModalResult:= mrOK;
end;

procedure TFrmSelectGridFields.SaveTreeBranch( ANode: TUniTreeNode; AParent_ID: Real );
var
  ID:Real;
  function SaveTreeNode( ANode: TUniTreeNode; AParent_ID: Real ):Real;
  begin
    Result:= GetNextID( 'ud_rec_view' );
//    ExecuteCommandFmt('insert into ud_rec_view '+
//              '      (id,              '+
//              '       seq,             '+
//              '       userid,          '+
//              '       parent_id,       '+
//              '       form_class,      '+
//              '       comp_path,       '+
//              '       field_name,      '+
//              '       iq_caption,      '+
//              '       ud_caption)      '+
//              ' values                 '+
//              '       (%f,             '+                                             {id}
//              '        %d,             '+                                             {seq}
//              '        ''%s'',         '+                                             {userid}
//              '        %s,             '+                                             {parent_id}
//              '        ''%s'',         '+                                             {form_class}
//              '        ''%s'',         '+                                             {comp_path}
//              '        ''%s'',         '+                                             {field_name}
//              '        ''%s'',         '+                                             {iq_caption}
//              '        ''%s'' )        ',                                             {ud_caption}
//
//              [ Result,                                                               {id}
//                ANode.Index,                                                          {seq}
//                SecurityManager.UserName,                                             {userid}
//                IIf( AParent_ID > 0, FloatToStr(AParent_ID),'NULL'),                  {parent_id}
//                FIQMS.WebVcl.UDRecView.FormClass,                                               {form_class}
//                FIQMS.WebVcl.UDRecView.CompPath,                                                {comp_path}
//                TTreeViewFieldCargo( ANode.Data ).FieldName,                          {field_name}
//                StrTran( TTreeViewFieldCargo( ANode.Data ).Caption, '''', ''''''), {iq_caption}
//                StrTran( ANode.Text, '''', '''''') ]);                                {ud_caption}
  end;
begin
  while Assigned( ANode ) do
  begin
    Application.ProcessMessages;
    ID:= SaveTreeNode( ANode, AParent_ID );     {local func}
    SaveTreeBranch( ANode.GetFirstChild, ID );  {recursive}
//    ANode:= ANode.GetNextSibling;
  end;
end;


procedure TFrmSelectGridFields.LoadTreeView;
begin
  with QryUd_Rec_View do
  begin
    Close;
    ParamByName('userid').asString    :=  SecurityManager.UserName;
//    ParamByName('class_form').asString:=  FIQMS.WebVcl.UDRecView.FormClass;
//    ParamByName('comp_path').asString :=  FIQMS.WebVcl.UDRecView.CompPath;
    Open;
  end;
  BuildNodes( NIL, 1 );
end;

procedure TFrmSelectGridFields.BuildNodes( AParentNode: TUniTreeNode; ATreeLevel: Integer );
var
  ACurrentNode: TUniTreeNode;
begin
  with QryUD_Rec_View do
    while not Eof do
    begin
      if FieldByName('level').asFloat = ATreeLevel then   {same level?}
         begin
           ACurrentNode:= TreeView1.Items.AddChild( AParentNode,
                                                          FieldByName('ud_caption').asString);
           ACurrentNode.Data:= TTreeViewFieldCargo.Create( FieldByName('field_name').asString,
                                                                                      FieldByName('ud_caption').asString );
           Next;
         end

      else if FieldByName('level').asFloat > ATreeLevel then
         BuildNodes( ACurrentNode, ATreeLevel + 1 )         {recursion}

      else
        EXIT;
    end;
end;

procedure TFrmSelectGridFields.ListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
//  with (Control as TUniListBox).Canvas do
//  begin
//    FillRect( Rect );
//
//    if FindFieldInTreeView(  TListBoxFieldCargo( (Control as TUniListBox).Items.Objects[ Index ]).FieldName ) then
//       Font.Color:= clSilver;
//
//    TextOut( Rect.Left + 2, Rect.Top, (Control as TUniListBox).Items[ Index ])
//  end;
end;

procedure TFrmSelectGridFields.popmTreeViewPopup(Sender: TObject);
begin
  EditLabel1.Enabled:= (TreeView1.Selected <> NIL);
end;

procedure TFrmSelectGridFields.EditLabel1Click(Sender: TObject);
begin
//  if TreeView1.Selected <> NIL then
//     TreeView1.Selected.EditText;
end;


end.
