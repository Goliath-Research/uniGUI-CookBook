unit IQMS.WebVcl.UDRecView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, StdCtrls, ComCtrls, Grids, DBGrids,
  Graphics, Vcl.ExtCtrls, Data.DB, Vcl.Buttons, Vcl.DBCtrls, Vcl.Menus,

  //  Vcl.wwDataInspector, Vcl.Wwkeycb, Vcl.Wwdbigrd, Vcl.Wwdbgrid,

  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf;


type
  TIQWebUDRecView = class(TUniFrame)
  private
    FToolBarPanel: TPanel;
    FDesignBtn  : TSpeedButton;
    FCloseBtn   : TSpeedButton;
//    FDataInspector: TwwDataInspector;
    FQryUDRecView: TFDQuery;
//    FwwDBGrid: TwwDBGrid;
    FReadOnly: Boolean;
    procedure ChangeLayoutClick( Sender: TObject );
    procedure HidePanelClick( Sender: TObject );

    function GetFormClass: string;
    function GetCompPath: string;
    procedure ReorderGridFieldsFrom( AList: TStringList );
    function GetDataSet: TDataSet;
    procedure DeleteDataInspectorNodes;
//    procedure BuildDataInspectorNodes( AParentNode: TwwInspectorItem; ATreeLevel: Integer );
//    procedure AssignDataInspectorNode( ANode: TwwInspectorItem; AFieldName, ADisplayLabel: string );
    function GetOwnerForm: TComponent;
//    procedure CheckAssignCustomControl( ANode: TwwInspectorItem; AField: TField );
//    procedure MakeUserDefinedNodeTextNull( Sender: TwwDataInspector; Item: TwwInspectorItem; var PaintText: string);
    function GetCloseBtnVisible: Boolean;
    procedure SetCloseBtnVisible(const Value: Boolean);
//    procedure SetReadOnly(const Value: Boolean);
    function GetDesignBtnVisible: Boolean;
    procedure SetDesignBtnVisible(const Value: Boolean);
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    property DataSet: TDataSet read GetDataSet;
//    property DataInspector: TwwDataInspector read FDataInspector write FDataInspector;
    procedure LoadDataInspector;
    procedure EditLayout;
//    procedure SetFieldVisible(const AFieldName: string; const AVisible: Boolean);
//    procedure SetFieldReadOnly(const AFieldName: string; const AReadOnly: Boolean);
//    procedure RefreshDisplay;
  published

    {Main component common properties}
    property Align;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BorderWidth;
    property CloseBtnVisible: Boolean read GetCloseBtnVisible write SetCloseBtnVisible;
    property DesignBtnVisible: Boolean read GetDesignBtnVisible write SetDesignBtnVisible;
    property Enabled;
//    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property Font;
    property PopupMenu;
    property TabOrder;
    property TabStop;
    property Tag;
    property Visible;
    property OnResize;

    {Introduced by component}
//    property wwDBGrid: TwwDBGrid read FwwDBGrid write FwwDBGrid;
    property FormClass: string read GetFormClass;
    property CompPath: string read GetCompPath;
  end;

implementation

{$R *.dfm}

uses
//  iqregfrm,
  IQMS.WebVcl.Search,
//  iqsecman,
//  iqudselgridfield,
//  vcl_share,
//  wwcommon,
  IQMS.WebVcl.ResourceStrings;


{ TUDRecView }
constructor TIQWebUDRecView.Create(AOwner: TComponent);
begin
  inherited;

  Width     := 220;
  Height    := 120;
  BevelInner:= bvLowered;
  BevelOuter:= bvNone;

  {ToolBarPanel}
  FToolBarPanel:= TPanel.Create(self);
  with FToolBarPanel do
  begin
    Parent    := self;
    Align     := alTop;     // alBottom;
    BevelOuter:= bvRaised;  // bvNone;
    Name      := 'ToolBarPanel';
    Caption   := '';
    Height    := 20;        // 16;
    ShowHint  := TRUE;
    ParentFont:= TRUE;
    ParentBackground := False;
    TabStop   := FALSE;
    Tag := 1999;
    Color := clBtnFace;
  end;

  {Close Speed Button}
  FCloseBtn := TSpeedButton.Create(self);
  with FCloseBtn do
  begin
    Parent := FToolBarPanel;
    Name    := 'CloseBtn';
    Font.Name := 'Marlett';
    Caption := 'r';
    Font.Size := 5;
    Width   := 16;
    Height  := 16;
    Top     := 2;
    Flat    := True;
    Left    := FToolBarPanel.Width - Width - 3;
    Anchors := [akTop, akRight];
    Hint    := IQMS.WebVcl.ResourceStrings.cTXT0000225; // 'Close'
    ParentShowHint := False;
    ShowHint := True;
    OnClick:= HidePanelClick;
    Visible := CloseBtnVisible;
  end;


  {Design Speed Button}
  FDesignBtn := TSpeedButton.Create(self);
  with FDesignBtn  do
  begin
    Parent := FToolBarPanel;
    Name   := 'DesignBtn';
    Width  := 16;                              // 15;
    Height := 16;                              // 15;
    Top    :=  2;                              // 1;
    if FCloseBtn.Visible then
       Left := FToolBarPanel.Width - FCloseBtn.Width - Width - 4
    else Left   := FToolBarPanel.Width - Width - 3; // FToolBarPanel.Width - Width;
    Anchors:= [akTop,akRight];
    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000226; // 'Click to change record view layout'
    OnClick:= ChangeLayoutClick;
    Glyph.LoadFromResourceName(HInstance, 'DESIGN');
    NumGlyphs := 2;
  end;

  {TwwDataInspector}
//  FDataInspector:= TwwDataInspector.Create(self);
//  with FDataInspector do
//  begin
//    Parent             := self;
//    Name               := 'DataInspector';
//    Align              := alClient;
//    Font.Color         := clNavy;
//    LineStyleCaption   := ovDottedLine;
//    LineStyleData      := ovDottedLine;
//    BorderStyle        := bsNone;
//    Options            := [ ovColumnResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert ];
//    OnCalcDataPaintText:= MakeUserDefinedNodeTextNull;
//  end;

  {FQryUDRecView - a query to retrieve rec view layout}
  FQryUDRecView:= TFDQuery.Create(self);
  with FQryUDRecView do
  begin
    // Connection := db_dm.FDConnection;
    SQL.Add('select id,                      ');
    SQL.Add('       parent_id,               ');
    SQL.Add('       level,                   ');
    SQL.Add('       field_name,              ');
    SQL.Add('       ud_caption               ');
    SQL.Add('  from                          ');
    SQL.Add('       ud_rec_view              ');
    SQL.Add(' where                          ');
    SQL.Add('       userid = :userid         ');
    SQL.Add('   and form_class = :class_form ');
    SQL.Add('   and comp_path  = :comp_path  ');
    SQL.Add(' start with                     ');
    SQL.Add('       parent_id is NULL        ');
    SQL.Add('connect by                      ');
    SQL.Add('       parent_id = prior id     ');
    SQL.Add('order by                        ');
    SQL.Add('       id                       ');
  end;
end;

procedure TIQWebUDRecView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent is TPopupMenu) and (PopupMenu = AComponent) then
     PopupMenu := NIL;
end;

destructor TIQWebUDRecView.Destroy;
begin
//  IQRegIntegerScalarWrite( GetOwnerForm, 'IQUDRecView_CaptionWidth', FDataInspector.CaptionWidth );
  inherited;
end;

procedure TIQWebUDRecView.EditLayout;
begin
  ChangeLayoutClick(FDesignBtn);
end;

function TIQWebUDRecView.GetCompPath: string;
var
  AOwner: TComponent;
begin
  Result:= self.Name;

  AOwner:= self.Owner;
  while Assigned(AOwner) and not (AOwner is TForm) do
  begin
    Result:= Format('%s.%s', [ AOwner.Name, Result ]);
    AOwner:= AOwner.Owner;
  end;

  Result := UpperCase(Result);
  if (Owner is TIQWebSearch) and (TIQWebSearch(Owner).RegistryPathExtension <> '') then
    Result:= Result + '_' + TIQWebSearch(Self.Owner).RegistryPathExtension;
end;

function TIQWebUDRecView.GetFormClass: string;
var
  AOwner: TComponent;
begin
  AOwner:= self.Owner;
  while Assigned(AOwner) and not (AOwner is TForm) do
    AOwner:= AOwner.Owner;

  if Assigned(AOwner) then
     Result:= UpperCase( AOwner.ClassName )
  else
     // Byron:  Partial internationalization since this is for developer use
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000227 {'Application Error:'} + #32#32 {spaces} + 'Unable to determine owner''s Form Class' );
end;

function TIQWebUDRecView.GetDataSet: TDataSet;
begin
//  if Assigned( wwDBGrid ) and Assigned( wwDBGrid.DataSource ) then
//     Result:= wwDBGrid.DataSource.DataSet
//  else
     Result:= NIL;
end;

procedure TIQWebUDRecView.ChangeLayoutClick(Sender: TObject);
var
  AList: TStringList;
begin
//  if DesignBtnVisible and not ReadOnly then
//    begin
//      AList:= TStringList.Create;
//      try
//        if TFrmSelectGridFields.Execute( self, AList ) then   {IQUDSelGridField.pas}
//        begin
//           ReorderGridFieldsFrom( AList );
//           LoadDataInspector;
//        end;
//      finally
//        AList.Free;
//      end;
//    end;
end;

procedure TIQWebUDRecView.ReorderGridFieldsFrom( AList: TStringList );
var
  I: Integer;
begin
  if not Assigned(DataSet) then
     EXIT;

  for I:= 0 to AList.Count - 1 do with DataSet do
    if Assigned( FindField( AList[ I ] )) then
       FieldByName( AList[ I ]).Index:= I;
end;


procedure TIQWebUDRecView.Loaded;
var
  AWidth: Integer;
begin
  inherited Loaded;

  if Assigned(DataSet) and (ComponentState = []) then
     LoadDataInspector;

//  if IQRegIntegerScalarRead( GetOwnerForm, 'IQUDRecView_CaptionWidth', AWidth ) then
//     FDataInspector.CaptionWidth:= AWidth;
end;

procedure TIQWebUDRecView.LoadDataInspector;
var
  AWidth: Integer;
begin
  // Check connection
//  if not Assigned(db_dm.DB_DataModule) or
//    not db_dm.DB_DataModule.IsConnectedToOracle then
//    Exit;
//
//  with FQryUDRecView do
//  begin
//    if Active then
//      Close;
//    Connection := db_dm.FDConnection;
//    ParamByName('userid').asString    := SecurityManager.UserName;
//    ParamByName('class_form').asString:= FormClass;
//    ParamByName('comp_path').asString := CompPath;
//    Open;
//  end;

//  FDataInspector.BeginUpdate;
//  try
//    {Assign Datasource - this will populate all the fields}
//    FDataInspector.DataSource:= wwDBGrid.DataSource;
//
//    {Delete fields from the prev step}
//    DeleteDataInspectorNodes;
//
//    {Rebuild the inspector}
//    BuildDataInspectorNodes( NIL, 1 );
//
//    {If UD Fields are not assigned, navigating IQMS.WebVcl.Search or clicking the blank fields triggered AV. EIQ-3214 AB 05-23-14}
//    FDataInspector.Enabled:= FDataInspector.Items.Count > 0;
//    if FDataInspector.Items.Count = 0 then
//       FDataInspector.DataSource:= nil;
//
//  finally
//    FDataInspector.EndUpdate;
//    FDataInspector.Invalidate;
//  end;
end;

procedure TIQWebUDRecView.DeleteDataInspectorNodes;
//var
//  I: Integer;
begin
//  for I:= FDataInspector.Items.Count - 1 downto 0 do
//      FDataInspector.Items.Delete(I)
end;

//procedure TIQWebUDRecView.BuildDataInspectorNodes( AParentNode: TwwInspectorItem; ATreeLevel: Integer );
//var
//  ACurrentNode: TwwInspectorItem;
//begin
//  with FQryUDRecView do
//    while not Eof do
//    begin
//      if FieldByName('level').asFloat = ATreeLevel then     {same level?}
//         begin
//           if AParentNode = nil then
//              ACurrentNode:= FDataInspector.Items.Add
//           else
//              ACurrentNode:= AParentNode.Items.Add;
//           AssignDataInspectorNode( ACurrentNode, FieldByName('field_name').asString, FieldByName('ud_caption').asString );
//           Next;
//         end
//
//      else if FieldByName('level').asFloat > ATreeLevel then
//         BuildDataInspectorNodes( ACurrentNode, ATreeLevel + 1 )         {recursion}
//
//      else
//        EXIT;
//    end;
//end;

//procedure TIQWebUDRecView.AssignDataInspectorNode( ANode: TwwInspectorItem; AFieldName, ADisplayLabel: string );
//begin
//  with ANode do
//  begin
//    Caption   := ADisplayLabel;
//    DataField := AFieldName;
//
//    if (DataSource <> nil) and (DataSource.DataSet <> nil) and (DataSource.DataSet.FindField(AFieldName) <> nil) then
//    begin
//       if (DataSource.DataSet.FieldByName(AFieldName).ReadOnly) then
//          ReadOnly:= TRUE;
//
//       {check if this field is a dropdown or a checkbox}
//       CheckAssignCustomControl( ANode, DataSource.DataSet.FieldByName(AFieldName));
//    end;
//
//    {Check toggle user definined fields to RO}
//    if DataField = '' then
//       ReadOnly:= TRUE;
//  end;
//end;

//
//procedure TIQWebUDRecView.CheckAssignCustomControl( ANode: TwwInspectorItem; AField: TField );
//var
//  AControlType: string;
//  AParameters : string;
//begin
//  {wwcommon.pas}
////  wwDataSet_GetControl( AField.DataSet,
////                        AField.FieldName,
////                        AControlType,
////                        AParameters );
//
//  if AControlType = '' then
//     EXIT;
//
//  if CompareText(AControlType, 'CustomEdit') = 0 then
//  begin
//     {Note! Make sure wwDBGrid has dgAlwaysShowEditor in the Options or the DropDown box will be blinking}
//     if Assigned(wwDBGrid) and not (dgAlwaysShowEditor in wwDBGrid.Options) then
//        wwDBGrid.Options:= wwDBGrid.Options + [ dgAlwaysShowEditor ];
//
//     if GetOwnerForm <> nil then
//        ANode.CustomControl:= TCustomEdit( GetOwnerForm.FindComponent( AParameters ));
//
//     ANode.CustomControlAlwaysPaints:= FALSE;
//     EXIT;
//  end;
//
//  if CompareText(AControlType, 'CheckBox') = 0 then
//  begin
//     with ANode.PickList do
//     begin
//       DisplayAsCheckbox:= TRUE;
//       Items.Add('Y');
//       Items.Add('N');
//     end;
//     EXIT;
//  end;
//end;

function TIQWebUDRecView.GetOwnerForm: TComponent;
begin
  Result:= self.Owner;
  while Assigned(Result) do
  begin
    if Result is TForm then
       EXIT;
    Result:= Result.Owner;
  end;
  Result:= nil;
end;

//procedure TIQWebUDRecView.MakeUserDefinedNodeTextNull( Sender: TwwDataInspector; Item: TwwInspectorItem; var PaintText: string);
//begin
//  {we had a problem with UD field that happened to be the 1st - the text always showed some garbage}
//  if Item.DataField = '' then
//     PaintText:= '';
//end;

procedure TIQWebUDRecView.HidePanelClick(Sender: TObject);
begin
     Self.Visible := FALSE;
end;

function TIQWebUDRecView.GetCloseBtnVisible: Boolean;
begin
     Result:= FCloseBtn.Visible;
end;

procedure TIQWebUDRecView.SetCloseBtnVisible(const Value: Boolean);
begin
  FCloseBtn.Visible := Value;
  if FCloseBtn.Visible then
  begin
    FCloseBtn.Left := FToolBarPanel.Width - FCloseBtn.Width - 1;
    FDesignBtn.Left := FToolBarPanel.Width - FCloseBtn.Width - FDesignBtn.Width - 2;
  end
  else
    FDesignBtn.Left   := FToolBarPanel.Width - FDesignBtn.Width - 2; // FToolBarPanel.Width - Width;
end;

function TIQWebUDRecView.GetDesignBtnVisible: Boolean;
begin
  Result := FDesignBtn.Visible;
end;

procedure TIQWebUDRecView.SetDesignBtnVisible(const Value: Boolean);
begin
  FDesignBtn.Visible := Value;
end;

//procedure TIQWebUDRecView.SetReadOnly(const Value: Boolean);
//begin
//  FReadOnly := Value;
//  FDesignBtn.Enabled := not FReadOnly;
//  FDataInspector.ReadOnly := FReadOnly;
//end;

//procedure TIQWebUDRecView.SetFieldReadOnly(const AFieldName: string;
//  const AReadOnly: Boolean);
//var
//  AItem: TwwInspectorItem;
//begin
//  AItem := FDataInspector.GetItemByFieldName(AFieldName);
//  if Assigned(AItem) then
//    AItem.ReadOnly := AReadOnly;
//end;

//procedure TIQWebUDRecView.SetFieldVisible(const AFieldName: string;
//  const AVisible: Boolean);
//var
//  AItem: TwwInspectorItem;
//begin
//  AItem := FDataInspector.GetItemByFieldName(AFieldName);
//  if Assigned(AItem) then
//    AItem.Visible := AVisible;
//end;

//procedure TIQWebUDRecView.RefreshDisplay;
//var
//  i: Integer;
//begin
//  if Assigned(DataInspector) then
//    begin
//      for i := 0 to DataInspector.Items.Count - 1 do
//        begin
//          if Assigned(DataInspector.Items[i].Field) then
//            begin
//              DataInspector.Items[i].ReadOnly :=
//                DataInspector.Items[i].Field.ReadOnly;
//              DataInspector.Items[i].Visible :=
//                DataInspector.Items[i].Field.Visible;
//            end;
//        end;
//      DataInspector.Refresh;
//      DataInspector.Realign;
//    end;
//end;

end.
