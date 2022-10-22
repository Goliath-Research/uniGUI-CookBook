unit iqdbx_required_fields;

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
  ADODB,
  ComCtrls,
  Menus,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniListBox, uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniStringGrid;

type
  TStringArray = array of string;

  TFrmIQDBXReqFields = class(TUniForm)
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
      procedure ShowRequiredFieldsFor(ATableName: string);
      procedure SetTables(const aTables: TStringArray);
    public
      { Public declarations }
    property Tables : TStringArray write SetTables;
  end;

procedure ShowRequiredFields(const ATables: TStringArray);
procedure GetRequiredFields(ATable: string; var AList: TStringList);


implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;

procedure ShowRequiredFields(const ATables: TStringArray);
var
  FrmIQDBXReqFields : TFrmIQDBXReqFields;
begin
  FrmIQDBXReqFields := TFrmIQDBXReqFields.Create(UniApplication);
   with FrmIQDBXReqFields do
    begin
      Tables := ATables;
      Show;
    end;
end;

procedure GetRequiredFields(ATable: string; var AList: TStringList);
begin
  if (ATable = '') or not Assigned(AList) then
    Exit;

  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT column_name, data_type, data_length, data_precision ');
      SQL.Add('FROM cols');
      SQL.Add(Format('WHERE table_name = ''%s'' AND', [ATable]));
      SQL.Add('      nullable = ''N'' ');
      SQL.Add('ORDER BY column_id');
      Open;
      while not EOF do
        begin
          AList.Add(Fields[0].AsString);
          Next;
        end;

      // Trim any additional text
      AList.Text := Trim(AList.Text);

    finally
      Free;
    end;
end;

{ TFrmIQDBXReqFields }


procedure TFrmIQDBXReqFields.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlLeft]);
end;

procedure TFrmIQDBXReqFields.SetTables(const aTables: TStringArray);
var
  aTable : string;
begin
  for aTable in aTables do
    lstTables.Items.Add(UpperCase(Trim(aTable)));

  if lstTables.Count > 0 then
    lstTables.ItemIndex := 0;

  lstTablesClick(NIL);
end;

procedure TFrmIQDBXReqFields.ShowRequiredFieldsFor(ATableName: string);
// ---------------------------------------------------------------------------
  procedure _AddFieldItem(AFieldName, ADataType: string; ADataLength, ADataPrecision, aCol: Integer);
  begin
    with lstFields do
      begin
        Cells[0,aCol]:= AFieldName;
        Cells[1,aCol]:= ADataType;
        Cells[2,aCol]:= IntToStr(ADataLength);
        Cells[3,aCol]:= IntToStr(ADataPrecision);
      end;
  end;
// ---------------------------------------------------------------------------
var
aCol: Integer;
begin
  try
    lstFields.BeginUpdate;
    aCol:=0;

    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT column_name, data_type, data_length, data_precision ');
        SQL.Add('FROM cols');
        SQL.Add(Format('WHERE table_name = ''%s'' AND', [ATableName]));
        SQL.Add('      nullable = ''N'' ');
        SQL.Add('ORDER BY column_id');
        Open;
        lstFields.RowCount:=RecordCount;
        while not EOF do
          begin
            _AddFieldItem(Fields[0].AsString, Fields[1].AsString,
              Fields[2].AsInteger, Fields[3].AsInteger,aCol);
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

procedure TFrmIQDBXReqFields.lstTablesClick(Sender: TObject);
var
  i: Integer;
begin
  i := lstTables.ItemIndex;
  if (i < 0) or (i > lstTables.Count - 1) then
    Exit;
  ShowRequiredFieldsFor(lstTables.Items.Strings[i]);
end;

procedure TFrmIQDBXReqFields.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQDBXReqFields.Options1Click(Sender: TObject);
begin
  StayOnTop1.Checked := FormStyle = fsStayOnTop;
end;

procedure TFrmIQDBXReqFields.StayOnTop1Click(Sender: TObject);
begin
  if FormStyle = fsStayOnTop then
    FormStyle := fsNormal
  else
    FormStyle := fsStayOnTop;
end;

procedure TFrmIQDBXReqFields.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, PnlLeft]);
end;

end.
