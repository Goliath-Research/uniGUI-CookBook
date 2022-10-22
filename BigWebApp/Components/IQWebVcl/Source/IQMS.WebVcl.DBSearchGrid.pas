unit IQMS.WebVcl.DBSearchGrid;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  IQMS.WebVcl.DBGrid,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit;

type
  TIQWebDbSearchGrid = class(TIQWebDBGrid)
  private
    { Private declarations }
    fEdit:TUniEdit;
    fEsc :Boolean;
    FTableName: string;
    FTableFieldName: string;
    FFieldSearch: string; 
    FFieldIndex: string;
    procedure SetSearchField(const Value:string );
    procedure SetIndexField(const Value:string );
    procedure SetTableName(const Value: String);
    procedure SetTableFieldName(const Value: String);
                   
    //procedure ColEnter; override;
    procedure KeyDownEdit(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExitEdit(Sender: TObject);

    
    //function  GetColLeft(nIndex:Integer):Integer;
  protected              
    { Protected declarations }
  public
    { Public declarations }
    constructor Create( AOwner:TComponent ); override;
  published
    { Published declarations }
    property FieldSearch:string read FFieldSearch write SetSearchField;
    property FieldIndex:string  read FFieldIndex  write SetIndexField;
    property TableName: String read FTableName write SetTableName;
    property TableFieldName: String read FTableFieldName write SetTableFieldName;
  end;                           

procedure Register;

implementation

uses
  IQMS.Common.DataLib,
  Data.DB;
constructor TIQWebDbSearchGrid.Create( AOwner:TComponent );
begin

  inherited Create( AOwner );
  //OnColEnter := GridColEnter; //method not implemented
  fEdit := TUniEdit.Create(AOwner);
  //fEdit.Parent :=  self; //TUniControl can not accept child controls
  fEdit.onKeyDown := KeyDownEdit;
  fEdit.onExit    := ExitEdit;
  fEdit.AutoSize := False;
  fEdit.Height := 16;

end;


//procedure TIQWebDbSearchGrid.ColEnter;
//begin
//  inherited;
//  if UpperCase(SelectedField.FieldName) = FieldSearch then
//  begin
//    fEdit.Width := Columns.Items[self.SelectedIndex].Width ;
//    fEdit.Top := (Row * (RowHeights[Row] + 1)) ;
//    fEdit.Left := GetColLeft(SelectedIndex) + 12;
//    fEdit.Text := DataSource.DataSet.FieldByName(FieldSearch).asString;
//    fEdit.Visible := True;
//    fEdit.SetFocus;
//  end;
//end;

//function TIQWebDbSearchGrid.GetColLeft(nIndex:Integer):Integer;
//var
//  i:Integer;
//  nLeftCol, nVisibleColCount:Integer;
//begin
//   nLeftCol := LeftCol - 1;
//   Result := nIndex;
//   For i := nLeftCol to nIndex - 1 do
//     Result := Result + Columns.Items[i].Width;
//end;

procedure TIQWebDbSearchGrid.SetTableName(const Value: String);
begin
  FTableName := Value;
end;

procedure TIQWebDbSearchGrid.SetTableFieldName(const Value: String);
begin
  FTableFieldName := Value;
end;

procedure TIQWebDbSearchGrid.SetSearchField(const Value:string );
begin
  FFieldSearch := Value;
end;


procedure TIQWebDbSearchGrid.SetIndexField(const Value:string );
begin
  FFieldIndex := Value;
end;

procedure TIQWebDbSearchGrid.ExitEdit(Sender: TObject);
var
  nId:Real;
  eExit:TNotifyEvent;
begin
  try
    eExit := fEdit.OnExit;
    fEdit.OnExit := nil;
    nId := SelectValue(Format('select id from %s where %s like ''%s%%''',
                  [fTableName, fTableFieldName, fEdit.Text]));
    if (nId <> DataSource.DataSet.FieldByName(FieldIndex).asFloat) and 
       (nId <> 0) and 
       (not fEsc)
    then with DataSource.DataSet do
      begin
        if not(State in [dsEdit, dsInsert]) then Edit;
        FieldByName(FieldIndex).asFloat := nId;
      end;
    //selectedIndex

//    if SelectedIndex  = (FieldCount - 1) then
//    begin
//      SelectedIndex := 0;
//      DataSource.DataSet.Next;
//    end
//    else SelectedIndex := SelectedIndex + 1;
    SetFocus;
  finally  
    fEdit.Visible := False;
    fEdit.OnExit := eExit;
  end;
end;

procedure TIQWebDbSearchGrid.KeyDownEdit(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_TAB) or (Key = VK_ESCAPE) then 
  begin
    if Key = VK_ESCAPE then fEsc := True else fEsc := False;
    ExitEdit(nil);
  end;  
end;

procedure Register;
begin
  RegisterComponents('IQMS', [TIQWebDbSearchGrid]);
end;

end.
 
