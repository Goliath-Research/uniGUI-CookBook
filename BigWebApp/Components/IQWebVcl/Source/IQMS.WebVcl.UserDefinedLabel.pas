unit IQMS.WebVcl.UserDefinedLabel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Data.DB, Vcl.DBGrids,
//  Vcl.wwDataInspector,
  FireDAC.Comp.Client,uniGUIAbstractClasses,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Stan.Param, FireDAC.Phys, FireDAC.Phys.Intf, FireDAC.DatS,
  FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf, uniDBGrid,
  uniLabel;

type
  TOnGetOwnerNameEvent = procedure( Sender: TObject; var AOwnerName: string ) of object;
  TOnGetSelfNameEvent = procedure( Sender: TObject; var ASelfName: string ) of object;

  TIQWebUserDefLabel = class(TUniLabel)
  private
    { Private declarations }
    FQuery:TFDQuery;
    FDefaultCaption:string;
    FOnGetOwnerName: TOnGetOwnerNameEvent;
    FOnGetSelfName: TOnGetSelfNameEvent;
    FParentAppName: string;
    procedure AssignSQL;
    function GetOwnerName: string;
    function GetSelfName: string;
    procedure SetParentAppName( Value: string );
  protected
    { Protected declarations }
    procedure Loaded; override;
  public
    { Public declarations }
    property OwnerName: string read GetOwnerName;
    property SelfName: string read GetSelfName;
    constructor Create( AOwner:TComponent ); override;
    procedure AssignFromTable;
    procedure SaveToTable( const AValue:string );
    function Execute: Boolean;
    procedure UpdateUserLabelColumnTitleByName( ADBGrid: TUniDBGrid; AFieldName: string );
    procedure UpdateUserLabelColumnTitle( AColumn:TUniBaseDBGridColumn );
    class function GetUserLabelCaption( AAppName, AOwnerName, ALabelName: string ): string;
    class procedure AssignFieldDisplayLabel(AField: TField; AAppName,  AOwnerName, ALabelName: string);
    procedure AssignCaption;
  published
    { Published declarations }
    property OnGetOwnerName: TOnGetOwnerNameEvent read FOnGetOwnerName write FOnGetOwnerName;
    property OnGetSelfName: TOnGetSelfNameEvent read FOnGetSelfName write FOnGetSelfName;
    property ParentAppName: string read FParentAppName write SetParentAppName;
  end;

  { Data Inspector, Edit User-Defined Fields.
   1.  Call CheckDataInspectorEditUserDefined() in the
       Data Inspector event, OnAfterSelectCell.  Pass
       the appropriate parameter values.
   2.  You will need to have a hidden panel, containing the
       design-time TIQWebUserDefLabel controls, somewhere on your
       form. This just makes it easier for you to maintain.
   3.  In the menu OnClick event, used to the label text,
       call EditDataInspectorUserDefined(). The list of field
       names and labels must match.
  }
//  procedure SetDataInspectorPopupMenu(ADataInspector: TwwDataInspector;
//   AStandardPopupMenu: TPopupMenu; AUserDefinedPopupMenu: TPopupMenu);
//  function EditDataInspectorUserDefined(ADataInspector: TwwDataInspector;
//   const AFieldNames: array of string;
//   const ALabels: array of TIQWebUserDefLabel): Boolean;

implementation

uses
  IQMS.Common.Controls,
  IQMS.WebVcl.UserDefinedLabelDialog,
  IQMS.Common.DataLib;


//procedure SetDataInspectorPopupMenu(ADataInspector: TwwDataInspector;
// AStandardPopupMenu: TPopupMenu; AUserDefinedPopupMenu: TPopupMenu);
//var
//  AItem: TwwInspectorItem;
//  AFieldName: string;
//  i: Integer;
//begin
//  // Verify required objects are provided
//  if not Assigned(ADataInspector) or not Assigned(AStandardPopupMenu)
//    or not Assigned(AUserDefinedPopupMenu) then
//    Exit;
//
//  // Assign default popup menu
//  ADataInspector.PopupMenu := AStandardPopupMenu;
//
//  // If no item is active, just exit now
//  AItem := ADataInspector.ActiveItem;
//  if not Assigned(AItem) or not Assigned(AItem.Field) then
//     Exit;
//
//  // Get the active item field name for comparison
//  AFieldName := AItem.Field.FieldName;
//  // Check if the active field name is a user-defined field.
//  // Note:  The threshold can be adjusted to whatever is required.
//  for i := 1 to 50 do
//   if (CompareText(AFieldName, Format('CUSER%d',[i])) = 0) or
//      (CompareText(AFieldName, Format('NUSER%d',[i])) = 0) or
//      (CompareText(AFieldName, Format('DUSER%d',[i])) = 0) then
//     begin
//       // This is a user-defined field.  Assign the popup menu.
//       ADataInspector.PopupMenu := AUserDefinedPopupMenu;
//       // And we are done
//       Break;
//     end;
//end;
//
//function EditDataInspectorUserDefined(ADataInspector: TwwDataInspector;
// const AFieldNames: array of string;
// const ALabels: array of TIQWebUserDefLabel): Boolean;
//var
//  AItem: TwwInspectorItem;
//  ALabel: TIQWebUserDefLabel;
//  i: Integer;
//  AFieldName: String;
//begin
//  Result := False;
//  ALabel := NIL;
//
//  // Verify required objects are provided
//  if not Assigned(ADataInspector) or
//     (High(AFieldNames) <> High(ALabels)) then
//    Exit;
//
//  // If no item is active, just exit now
//  AItem := ADataInspector.ActiveItem;
//  if not Assigned(AItem) then
//     Exit;
//
//  // Get the active item field name for comparison
//  AFieldName := AItem.Field.FieldName;
//
//  for i := Low(AFieldNames) to High(AFieldNames) do
//   if CompareText(AFieldName, AFieldNames[i]) = 0 then
//     begin
//       ALabel := ALabels[i];
//       Break;
//     end;
//
//  if Assigned(ALabel) then
//    Result := ALabel.Execute;
//end;

{ TIQWebUserDefLabel }

constructor TIQWebUserDefLabel.Create( AOwner:TComponent );
begin
  inherited;
  FParentAppName:= 'IQWIN32.EXE';
  if not ( csDesigning in ComponentState ) then
  begin
    FQuery:= TFDQuery.Create(self);
    FQuery.ConnectionName := 'IQFD';
  end;
end;

procedure TIQWebUserDefLabel.Loaded;
begin
  inherited Loaded;
  FDefaultCaption:= Caption;
  AssignCaption;
end;

procedure TIQWebUserDefLabel.AssignFromTable;
begin
  if not (csDesigning in ComponentState) then
  with FQuery do
  try
    try
      if Active then Close;
      AssignSQL;
      Open;
      if Eof then
        Caption:= FDefaultCaption
      else
        Caption:= Fields[ 0 ].asString;
    finally
      Close;
    end;
  except
    Caption:= FDefaultCaption;
  end;
end;

procedure TIQWebUserDefLabel.AssignSQL;
begin
  with FQuery do
  begin
    SQL.Clear;
    SQL.Add(Format('select user_text from userdef where app_name = ''%s'' and parent_name = ''%s'' and component_name = ''%s'' ',
                   [ ParentAppName,
                     OwnerName,
                     SelfName ]));
  end;
end;

function TIQWebUserDefLabel.GetOwnerName: string;
begin
  // Result:= self.Owner.Name;  {Oct-24-2002}
  Result:= Copy( self.Owner.ClassName, 2, Length( self.Owner.ClassName ));
  if Assigned( OnGetOwnerName ) then
     OnGetOwnerName( self, Result );
end;

function TIQWebUserDefLabel.GetSelfName: string;
begin
  Result:= self.Name;
  if Assigned( OnGetSelfName ) then
    OnGetSelfName( self, Result );
end;

procedure TIQWebUserDefLabel.SaveToTable( const AValue:string );
begin
  with TFDTable.Create(self) do
  try
    ConnectionName := 'IQFD';
    TableName   := 'USERDEF';
    Open;
    SetRange( [ ParentAppName, OwnerName, SelfName ],
              [ ParentAppName, OwnerName, SelfName ]);
    Edit;
    FieldByName('App_Name').asString      := ParentAppName;
    FieldByName('Parent_Name').asString   := OwnerName;
    FieldByName('Component_Name').asString:= SelfName;
    FieldByName('User_Text').asString     := AValue;
    Post;
    Caption:= AValue;
  finally
    Free;
  end;
end;

function TIQWebUserDefLabel.Execute: Boolean;
var
  S:string;
begin
  Result := False;
  S:= Caption;
  if UserLabelDlg( FDefaultCaption, S ) then
   begin
     SaveToTable( S );
     Result := True;
   end;
end;

procedure TIQWebUserDefLabel.UpdateUserLabelColumnTitleByName( ADBGrid: TUniDBGrid; AFieldName: string );
var
  ACol: TUniBaseDBGridColumn;
begin
  ACol:= IQColumnByName( ADBGrid, UpperCase( AFieldName ));
  UpdateUserLabelColumnTitle( ACol );
end;

procedure TIQWebUserDefLabel.UpdateUserLabelColumnTitle( AColumn:TUniBaseDBGridColumn );
begin
  if Assigned( AColumn ) then
     AColumn.Title.Caption:= Caption;
end;

procedure TIQWebUserDefLabel.SetParentAppName( Value: string );
begin
  FParentAppName:= UpperCase( Trim( Value ));
  if FParentAppName = '' then
     FParentAppName:= 'IQWIN32.EXE';
end;

class function TIQWebUserDefLabel.GetUserLabelCaption(AAppName, AOwnerName, ALabelName: string): string;
begin
  Result:= SelectValueFmtAsString('select user_text from userdef where app_name = ''%s'' and parent_name = ''%s'' and component_name = ''%s'' ',
                   [ AAppName,
                     AOwnerName,
                     ALabelName ]);

end;

class procedure TIQWebUserDefLabel.AssignFieldDisplayLabel( AField: TField; AAppName, AOwnerName, ALabelName: string );
var
  S: string;
begin
  S:= GetUserLabelCaption(AAppName, AOwnerName, ALabelName);
  if S > '' then
     AField.DisplayLabel:= S;
end;

procedure TIQWebUserDefLabel.AssignCaption;
begin
  AssignFromTable;
end;


end.

{ How to make columns titles userdefinable

1. Drop PopupMenu1. Caption = 'Define Column Title'.
   Drop TIQWebUserDefLabel(s) 1 per column. Visible = FALSE. Caption = Default text

2. OnMouseDown of DBGrid1
  if (Button = mbRight) and (Y < DBGrid1.RowHeights[0]) then with DBGrid1 do
     begin
        SelectedIndex:= MouseCoord( X, Y ).X - 1;
        if Pos( Columns[ SelectedIndex ].FieldName, 'CUSER1_CUSER2_CUSER3' ) > 0 then
        begin
           P.X:= X;
           P.Y:= Y;
           P:= ClientToScreen( P );
           PopupMenu1.Popup( P.X, P.Y );
        end;
     end

3. OnPopupMenu:
   with DBGrid1, Columns[ SelectedIndex ] do
   begin
     if FieldName = 'CUSER1' then        ALabel:= IQUserDefLabel1
     else if FieldName = 'CUSER2' then   ALabel:= IQUserDefLabel2
     else if FieldName = 'CUSER3' then   ALabel:= IQUserDefLabel3;

     ALabel.Execute;
     ALabel.UpdateUserLabelColumnTitle( Columns[ SelectedIndex ])
   end;


3. On FormCreate:
     IQUserDefLabel1.UpdateUserLabelColumnTitleByName( DBGrid1, 'CUSER1' );
     IQUserDefLabel2.UpdateUserLabelColumnTitleByName( DBGrid1, 'CUSER2' );
}
