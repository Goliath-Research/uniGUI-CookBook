unit IQMS.WebVcl.UDComboBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Menus, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Stan.Param, FireDAC.Phys, FireDAC.Phys.Intf, FireDAC.DatS,
  FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniComboBox, uniDBComboBox,
  IQMS.WebVcl.HPick, IQMS.Common.JumpConstants, UniMainMenu;

type
  { TOnGetAttributeEvent }
  TOnGetAttributeEvent = procedure( Sender: TObject; var AAttribute: string ) of object;

  { TIQWebUDComboBox }
  TIQWebUDComboBox = class(TUniDBComboBox)
  private
    FQuery:  TFDQuery;
    FKeyFieldName: string;
    FKeyTableName: string;
    FInterPopMenu: TUniPopupMenu;
    FEditEnabled: Boolean;
    FPkListBased: Boolean;
    FPkListSQL: string;
    FPkListFieldName: string;
    FPkList: TIQWebHpick;
    FOnGetAttribute: TOnGetAttributeEvent;

    procedure AssignFromTable;
    procedure AssignSQL;
    procedure CheckAssignSQL;
    procedure SetKeyFieldName(const Value: string);
    procedure SetKeyTableName(const Value: string);
    function CheckKeyAssigned: Boolean;
    procedure Execute(Sender: TObject);
    procedure CheckEditEnabled(Sender: TObject);
    procedure SetBtnImage;
    function IsDropDownList: Boolean;
    procedure AssignDropDownStyle;
    procedure RefreshSameComponents;
    procedure ComboBoxDropDown(Sender: TObject);
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure PopupPickList;
    function GetAttribute: string;
    procedure BeforeOpenPickList(DataSet: TDataSet);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  protected
    procedure Loaded; override;
  public
    constructor Create( AOwner:TComponent ); override;
    procedure RefreshDropDownList;
    property EditEnabled: Boolean read FEditEnabled write FEditEnabled;
    procedure AssignPicklistQueryParams(ADataSet: TDataSet);

  published
    property KeyTableName: string read FKeyTableName write SetKeyTableName;
    property KeyFieldName: string read FKeyFieldName write SetKeyFieldName;

    property OnGetAttribute: TOnGetAttributeEvent read FOnGetAttribute write FOnGetAttribute;
  end;

implementation

{ TIQWebUDComboBox }

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.ApplicationSet,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.UDComboListDlg,
  IQMS.Common.Numbers,
  System.Variants;

const
  cnstPopupPicklist = 1;

constructor TIQWebUDComboBox.Create(AOwner: TComponent);
var
  NewItem  : TUniMenuItem;
begin
  inherited;
  EditEnabled:= TRUE;

  Hint:= IQMS.WebVcl.ResourceStrings.cTXT0000284; // 'Right click to edit the list';
  ShowHint:= TRUE;
  SetBtnImage;

  if ( csDesigning in ComponentState ) then
     EXIT;

  OnMouseDown:=MouseDown;
  FQuery := TFDQuery.Create(self);
  FQuery.ConnectionName := 'IQFD';

  FInterPopMenu:= TUniPopupMenu.Create( self );
  with FInterPopMenu do
  begin
    OnPopup:= CheckEditEnabled;
    NewItem:= TUniMenuItem.Create( FInterPopMenu );
    with NewItem do
    begin
      Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000275; // 'Edit User Defined List';
      OnClick:= Execute;
      Name   := 'Edit1';
    end;
    FInterPopMenu.Items.Add( NewItem );
  end;


  FPkList:= TIQWebHpick.Create( self );
  FPkList.DataBaseName:= FQuery.ConnectionName;
  FPkList.BeforeOpen  := BeforeOpenPickList;

  OnDropDown:= ComboBoxDropDown;
end;

procedure TIQWebUDComboBox.Loaded;
begin
  inherited Loaded;

  SetBtnImage;

  if (csDesigning in ComponentState) then EXIT;

  RefreshDropDownList;
end;

procedure TIQWebUDComboBox.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbright then
    FInterPopMenu.Popup(x,y,sender);
end;

procedure TIQWebUDComboBox.SetBtnImage;
begin
//  ButtonStyle:= cbsCustom;
//  Button.Glyph.FreeImage;
//  Button.NumGlyphs := 2;
//  ButtonGlyph.LoadFromResourceName( HInstance, 'UDBTN' );
//  Button.Font.Name := 'Marlett';
//  Button.Font.Size := 9;
//  Button.Font.Color := clBlue;
//  Button.Caption   := IntToStr(6);
end;

function TIQWebUDComboBox.CheckKeyAssigned: Boolean;
var
  AOwner: string;
begin
  Result:= FALSE;

  if Assigned(Owner) and (Owner.Name > '') then AOwner:= Owner.Name else AOwner:= '<NIL>';

  if (FKeyTableName = '') then
  begin
    {'Property KeyTableName is not assigned ( %s on %s )'}
    IQWarning(Format( IQMS.WebVcl.ResourceStrings.cTXT0000276, [ self.Name, AOwner ]));
    EXIT;
  end;

  if (FKeyFieldName = '') then
  begin
    {'Property KeyFieldName is not assigned ( %s on %s )'}
    IQWarning(Format( IQMS.WebVcl.ResourceStrings.cTXT0000277, [ self.Name, AOwner ]));
    EXIT;
  end;

  Result:= TRUE;
end;

procedure TIQWebUDComboBox.AssignFromTable;
begin
  self.Items.Clear;
  if not IsNonIQMSSchema then
    with FQuery do
    try
      try
        CheckAssignSQL;
        if FQuery.SQL.Count > 0 then
          begin
            Reopen( FQuery );
            while not Eof do
            begin
              Items.Add( Fields[ 0 ].asString );
              Next;
            end;
          end;
      except on E: Exception do
        IQWarning( E.Message );
      end;
    finally
      Close;
    end;

  AssignDropDownStyle;
end;

procedure TIQWebUDComboBox.CheckAssignSQL;
var
  A: Variant;
begin
  if FQuery.SQL.Count = 0 then
    AssignSQL;
//
  if not IsNonIQMSSchema then
  begin
    A:= SelectValueArrayFmt('select pklist_based, pklist_sql, pklist_field_name '+
                       '  from user_def_list                               '+
                       ' where table_name = ''%s'' and field_name = ''%s'' ',
                       [ FKeyTableName, FKeyFieldName ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      FPkListBased    := A[ 0 ] = 'Y';
      FPkListSQL      := A[ 1 ];
      FPkListFieldName:= A[ 2 ];
    end;
  end;
end;

procedure TIQWebUDComboBox.AssignSQL;
var
  AAttribute, ASQLText: string;
begin
  if not IsNonIQMSSchema then
    begin
      AAttribute := GetAttribute;
      with FQuery do
      try
        if Active then
           Close;
        SQL.Clear;
        SQL.Add(       'select d.text                                      ');
        SQL.Add(       '  from user_def_list_detail d,                     ');
        SQL.Add(       '       user_def_list l                             ');
        SQL.Add(       ' where                                             ');
        SQL.Add(Format('       l.table_name = ''%s''                       ',[FKeyTableName]));
        SQL.Add(Format('   and l.field_name = ''%s''                       ',[FKeyFieldName]));
        if AAttribute > '' then
        SQL.Add(Format('   and Upper(l.attribute) = Upper(''%s'')          ',[AAttribute]));
        SQL.Add(       '   and d.user_def_list_id = l.id                   ');
        SQL.Add(       ' order by d.seq                                    ');
        ASQLText := SQL.Text;
        if ASQLText > '' then
         begin
           //
         end;
      except on E: Exception do
        IQWarning( E.Message );
      end;
    end;
end;

procedure TIQWebUDComboBox.SetKeyFieldName(const Value: string);
begin
  FKeyFieldName:= Trim(UpperCase(Value));
end;

procedure TIQWebUDComboBox.SetKeyTableName(const Value: string);
begin
  FKeyTableName:= Trim(UpperCase(Value));
end;

procedure TIQWebUDComboBox.Execute(Sender: TObject);
begin
//   TFrmIQUDComboListDlg is declared in IQUDComboListDlg.pas
  if TFrmIQUDComboListDlg.DoShowModal( KeyTableName, KeyFieldName,
    GetAttribute) then
    begin
      AssignFromTable;
      RefreshSameComponents;
    end;
end;


function TIQWebUDComboBox.GetAttribute: string;
begin
  Result := '';
  if Assigned( FOnGetAttribute ) then
     FOnGetAttribute( self, Result );
end;

procedure TIQWebUDComboBox.CheckEditEnabled(Sender: TObject);
begin
  FInterPopMenu.Items[ 0 ].Enabled:= EditEnabled;
end;

procedure TIQWebUDComboBox.RefreshDropDownList;
begin
  if not CheckKeyAssigned
   or IsNonIQMSSchema then
     EXIT;

  AssignSQL;
  AssignFromTable;
end;


function TIQWebUDComboBox.IsDropDownList: Boolean;
var
  S: string;
begin
  if not IsNonIQMSSchema then
    begin
      S:= SelectValueFmtAsString('select is_drop_down_list   '+
                       '  from user_def_list       '+
                       ' where table_name = ''%s'' '+
                       '   and field_name = ''%s'' ',
                       [ FKeyTableName, FKeyFieldName ]);

      if S = 'Y' then
         Result:= TRUE

      else if S = 'N' then
         Result:= FALSE

      else
         Result:= SelectValueAsString('select ud_drop_down_is_list from params') = 'Y';
    end;
end;


procedure TIQWebUDComboBox.AssignDropDownStyle;
var
  AIsDropDownList: Boolean;
begin
  try
    AIsDropDownList:= IsDropDownList();

    self.Style        := IIf( AIsDropDownList, csDropDownList, csDropDown );
//    self.ShowMatchText:= AIsDropDownList;
    self.ClearButton:= TRUE;

  except on E:Exception do
    ;  // ignore errors where the db has not run the update script yet.
  end;
end;

procedure TIQWebUDComboBox.RefreshSameComponents;
var
  I : Integer;
  Compo: TComponent;
begin
  try
    for i:= 0 to Owner.ComponentCount-1 do
    begin
      Compo:= Owner.Components[i];
      if  (Compo is TIQWebUDComboBox)
      and (Compo <> self)
      and (TIQWebUDComboBox(Compo).DataField = self.DataField)
      and (TIQWebUDComboBox(Compo).DataSource = self.DataSource)
      and (TIQWebUDComboBox(Compo).KeyFieldName = self.KeyFieldName)
      and (TIQWebUDComboBox(Compo).KeyTableName = self.KeyTableName)
      then
      begin
        TIQWebUDComboBox(Compo).Items.Clear;
        with FQuery do
        try
          try
            Reopen( FQuery );
            while not Eof do
            begin
              TIQWebUDComboBox(Compo).Items.Add( Fields[ 0 ].asString );
              Next;
            end;
          except on E: Exception do
            IQWarning( E.Message );
          end;
        finally
          Close;
        end;
      end;
    end;
  except
    on E:Exception do
      IQWarning( E.Message );
  end;
end;

procedure TIQWebUDComboBox.ComboBoxDropDown(Sender: TObject);
begin
  if not FPkListBased then
     EXIT;

  PostMessage( Handle, iq_Notify, cnstPopupPicklist, 0 );

  ABORT;
end;


procedure TIQWebUDComboBox.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    1: PopupPickList;
  end;
end;

procedure TIQWebUDComboBox.PopupPickList;
var
  I: Integer;
begin
  with FPkList do
  begin
    Close;
    while FieldCount > 0 do Fields[ 0 ].Free;

    SQL.Text:= FPkListSQL;

    AssignPicklistQueryParams( FPkList );

    FieldDefs.Update;

    for I:= 0 to FieldDefs.Count - 1 do
      FieldDefs[ I ].CreateField( FPkList );

    if Execute then
    begin
       self.DataSource.DataSet.Edit;
       self.DataSource.DataSet.FieldByName( self.DataField ).asString:= GetValue( FPkListFieldName );
    end;
  end;
end;


procedure TIQWebUDComboBox.BeforeOpenPickList(DataSet: TDataSet);
begin
  AssignPicklistQueryParams(DataSet);
end;


procedure TIQWebUDComboBox.AssignPicklistQueryParams(ADataSet: TDataSet);
var
  I: Integer;
begin
  if ADataSet is TFDQuery then
    with TFDQuery(ADataSet) do
  for I:= 0 to Params.Count - 1 do
    if (DataSource <> nil) and (DataSource.DataSet.FindField( Params[I].Name ) <> nil) then
     begin
       Params[I].DataType:= self.DataSource.DataSet.FieldByName( Params[I].Name ).DataType;
       Params[I].Value   := self.DataSource.DataSet.FieldByName( Params[I].Name ).Value;
     end;
end;

end.
