unit iqdbx_foreign_key;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  DB,
  SqlExpr,
  DBClient,
  ComCtrls,
  Menus,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniPanel,
  uniMainMenu,
  uniMultiItem,
  uniListBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniBasicGrid,
  uniStringGrid;

type

  TStringArray = array of string;

  TFrmIQDBXFKFields = class(TUniForm)
    PnlLeft: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    lstTables: TUniListBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Options1: TUniMenuItem;
    StayOnTop1: TUniMenuItem;
    lstFields: TUniStringGrid;
    procedure lstTablesClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure StayOnTop1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ShowRequiredFieldsFor(ATableName: String);
    procedure SetTables(const aTables: TStringArray);
  public
    { Public declarations }

    property Tables : TStringArray write SetTables;
  end;

  procedure ShowFKFields(const ATables: TStringArray);
  procedure GetFKFields(ATable: String; var AList: TStringList);


implementation

{$R *.dfm}

uses
IQMS.Common.RegFrm;

procedure ShowFKFields(const ATables: TStringArray);
var
  FrmIQDBXFKFields : TFrmIQDBXFKFields;
begin
  FrmIQDBXFKFields := TFrmIQDBXFKFields.Create(UniApplication);
   with FrmIQDBXFKFields do
    begin
      Tables := ATables;
      Show;
    end;
end;

procedure GetFKFields(ATable: String; var AList: TStringList);
begin

  if (ATable = '') or not Assigned(AList) then Exit;

  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add('select uc.table_name origin_table,');
     SQL.Add('       uc.constraint_name origin_constraint,');
     SQL.Add('       uc.r_constraint_name referenced_constraint,');
     SQL.Add('       ucc.table_name referenced_table,');
     SQL.Add('       ucc.column_name referenced_column_name');
     SQL.Add('  from user_constraints uc,');
     SQL.Add('       user_tables ut,');
     SQL.Add('       user_cons_columns ucc');
     SQL.Add(' where');
     SQL.Add(Format('   ut.table_name = ''%s'' ', [ATable]));
     SQL.Add('   and ut.table_name = uc.table_name');
     SQL.Add('   --and uc.constraint_name like ''FK_%'' ');
     SQL.Add('   and uc.constraint_type = ''R'' ');
     SQL.Add('   and uc.constraint_name = ucc.constraint_name');
     Open;
     while not EOF do
      begin
        AList.Add(Fields[0].AsString);
        Next;
      end;
  finally
     Free;
  end;
end;

{ TFrmIQDBXReqFields }

procedure TFrmIQDBXFKFields.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlLeft]);
end;

procedure TFrmIQDBXFKFields.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, PnlLeft]);
end;

procedure TFrmIQDBXFKFields.SetTables(const aTables: TStringArray);
var
  aTable : string;
begin
  for aTable in aTables do
    lstTables.Items.Add(UpperCase(Trim(aTable)));

  if lstTables.Count > 0 then
    lstTables.ItemIndex := 0;

  lstTablesClick(NIL);
end;

procedure TFrmIQDBXFKFields.ShowRequiredFieldsFor(ATableName: String);

  procedure _AddFieldItem(AField1, AField2, AField3, AField4: String; aCol:integer);
  begin
    with lstFields do
    begin
      Cells[0,aCol]:= AField1;
      Cells[1,aCol]:= AField2;
      Cells[2,aCol]:= AField3;
      Cells[3,aCol]:= AField4;
    end;
  end;

var
  aCol:integer;
begin
  try
     lstFields.BeginUpdate;
//     lstFields.Items.Clear;
     aCol:=0;
     with TFDQuery.Create(NIL) do
     try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('select uc.table_name table_name,');
        SQL.Add('       uc.constraint_name table_constraint,');
        SQL.Add('       uc.r_constraint_name referenced_constraint,');
        SQL.Add('       ucc.table_name referenced_table,');
        SQL.Add('       ucc.column_name referenced_column_name');
        SQL.Add('  from user_constraints uc,');
        SQL.Add('       user_tables ut,');
        SQL.Add('       user_cons_columns ucc');
        SQL.Add(' where');
        SQL.Add(Format('   ut.table_name = ''%s'' ', [ATableName]));
        SQL.Add('   and ut.table_name = uc.table_name');
        SQL.Add('   --and uc.constraint_name like ''FK_%'' ');
        SQL.Add('   and uc.constraint_type = ''R'' ');
        SQL.Add('   and uc.constraint_name = ucc.constraint_name');
        Open;
        lstFields.RowCount:=RecordCount;
        while not EOF do
         begin
           _AddFieldItem(Fields[4].AsString, Fields[1].AsString, Fields[2].AsString, Fields[3].AsString,aCol);
           aCol:=aCol+1;
           Next;
         end;
     finally
        Free;
     end;

  finally
     lstFields.EndUpdate;
  end;
end;

procedure TFrmIQDBXFKFields.lstTablesClick(Sender: TObject);
var
  i: Integer;
begin
  i := lstTables.ItemIndex;
  if (i < 0) or (i > lstTables.Count-1) then Exit;
  ShowRequiredFieldsFor(lstTables.Items.Strings[i]);
end;

procedure TFrmIQDBXFKFields.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQDBXFKFields.Options1Click(Sender: TObject);
begin
  StayOnTop1.Checked := FormStyle = fsStayOnTop;
end;

procedure TFrmIQDBXFKFields.StayOnTop1Click(Sender: TObject);
begin
  if FormStyle = fsStayOnTop then
    FormStyle := fsNormal
  else
    FormStyle := fsStayOnTop;
end;

end.
