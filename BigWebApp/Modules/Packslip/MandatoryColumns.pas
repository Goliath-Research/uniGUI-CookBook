unit MandatoryColumns;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  UniDBDateTimePicker;

type
  TFrmMandatoryColumns = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Button1: TUniButton;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    ScrollBox2: TUniScrollBox;
    Panel4: TUniPanel;
    ScrollBox1: TUniScrollBox;
    Src: TDataSource;
    Panel6: TUniPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FResult: Boolean;
    FDataset: TDataset;
    FTable: string;
    function AddComponent(AOffset: integer;
      Acolumn_name, Adata_type: string): integer;
    function Create_Label_wwDBDateTimePicker_Pair(const ATop: integer;
      AField: TField; ALabelsPanel, AControlsPanel: TUniScrollBox): TComponent;
    function Create_Label(const ATop: integer; const AField: TField;
      ALabelsPanel: TUniScrollBox): TUniLabel;
    function Create_Label_DBEdit_Pair(const ATop: integer; AField: TField;
      ALabelsPanel, AControlsPanel: TUniScrollBox): TComponent;
    procedure DoOnDeleteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function IsOktoClose: Boolean;
    procedure SetDataSet(const Value: TDataset);
    procedure SetTable(const Value: string);
  public
    { Public declarations }
    property DataSet: TDataset write SetDataSet;
    property Table: string write SetTable;
  end;

function AssignUserDefinedMandatoryFields(ADataSet: TDataset;
  ATable: string): Boolean;

const
  C_LABEL_LEFT: integer = 8;
  C_START_TOP: integer = 8;
  C_CONTROL_INCREMENT: integer = 25;
  C_EDITCONTROL_WIDTH: integer = 120;
  C_CHECKBOX_WIDTH: integer = 15;



implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  packslip_rscstr,
  uniEdit,
  uniDBEdit;

function AssignUserDefinedMandatoryFields(ADataSet: TDataset;
  ATable: string): Boolean;
var
  FrmMandatoryColumns: TFrmMandatoryColumns;
begin
  Result := True;
  if SelectValueFmtAsInteger('select count(*)                        '#13 +
    '     from all_triggers                 '#13 +
    '     where table_name = ''%s''         '#13 +
    '       and owner = ''IQMS''            '#13 +
    '       and trigger_name like ''T4%%''  ', [ATable]) = 0 then
    exit;

  FrmMandatoryColumns := TFrmMandatoryColumns.Create(uniGUIApplication.UniApplication);
  with FrmMandatoryColumns do
  begin
    try
      Dataset := ADataSet;
      Table := ATable;
      ShowModal;
      Result := FResult;
    finally
      //Release;
    end;
  end;
end;

{ TFrmMandatoryColumns }

procedure TFrmMandatoryColumns.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmMandatoryColumns.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmMandatoryColumns.UniFormCreate(Sender: TObject);
var
  AQry: TFDQuery;
  AEmpty: Boolean;
  AOffset: integer;
begin
  AEmpty := False;
  Src.DataSet := FDataset;

  AQry := TFDQuery.Create(nil);
  try
    AQry.Connection := UniMainModule.FDConnection1;
    AQry.SQL.Add('select c.column_name,                        ');
    AQry.SQL.Add('       c.data_type                           ');
    AQry.SQL.Add('  from user_tab_columns c, metadata m        ');
    AQry.SQL.Add(Format(' where c.table_name = ''%s''                 ',
      [FTable]));
    AQry.SQL.Add('   and c.table_name = m.parent_object_name   ');
    AQry.SQL.Add('   and c.column_name = m.object_name         ');
    AQry.SQL.Add('   and m.mandatory_column = ''Y''            ');
    AQry.Open;
    if AQry.Eof and AQry.Bof then
    begin
      FResult := True;
      AEmpty := True;
    end
    else
    begin
      AOffset := 0;
      while not AQry.Eof do
      begin
        AOffset := AddComponent(AOffset, AQry.FieldByName('column_name')
          .AsString, AQry.FieldByName('data_type').AsString);
        AQry.Next;
      end;
    end;
  finally
    AQry.Free;
  end;
  if AEmpty then
  begin
    Application.Processmessages;
    Close;
  end;
end;

procedure TFrmMandatoryColumns.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := IsOktoClose;
end;

function TFrmMandatoryColumns.AddComponent(AOffset: integer;
  Acolumn_name, Adata_type: string): integer;
var
  AComponent: TComponent;
  AField: TField;
begin
  AField := FDataset.FindField(Acolumn_name);
  if Adata_type = 'DATE' then
    AComponent := Create_Label_wwDBDateTimePicker_Pair(AOffset, AField,
      ScrollBox1, ScrollBox2)
  else
    AComponent := Create_Label_DBEdit_Pair(AOffset, AField, ScrollBox1,
      ScrollBox2);

  Result := AOffset;

  Inc(Result, C_CONTROL_INCREMENT);
end;

function TFrmMandatoryColumns.Create_Label_wwDBDateTimePicker_Pair
  (const ATop: integer; AField: TField;
  ALabelsPanel, AControlsPanel: TUniScrollBox): TComponent;
var
  ALabel: TUniLabel;
begin
  ALabel := Create_Label(ATop, AField, ALabelsPanel);
  if ALabel = nil then
    exit;

  Result := TUniDBDateTimePicker.Create(self);
  with TUniDBDateTimePicker(Result) do
  begin
    name := Format('_ud_component_%s', [AField.FieldName]);
    Parent := AControlsPanel;
    Left := 0;
    Top := ATop;
    Width := AControlsPanel.Width;
    // if AField.DataType in [ftString, ftWideString] then
    Anchors := [akLeft, akTop, akRight];

    DataSource := Src;

    DataField := AField.FieldName;
    Tag := -ATop;
    OnKeyDown := DoOnDeleteKeyDown;
  end;
  { TODO -oSanketG -cWC : Need to find alternative for FocusControl in TUniLabel }
  //ALabel.FocusControl := TUniDBDateTimePicker(Result);
  IQMS.Common.Controls.CenterLabel(TUniDBDateTimePicker(Result), ALabel);
end;

function TFrmMandatoryColumns.Create_Label_DBEdit_Pair(const ATop: integer;
  AField: TField; ALabelsPanel, AControlsPanel: TUniScrollBox): TComponent;
var
  ALabel: TUniLabel;
begin
  ALabel := Create_Label(ATop, AField, ALabelsPanel);
  if ALabel = nil then
    exit;

  Result := TUniDBEdit.Create(self);
  with TUniDBEdit(Result) do
  begin
    name := Format('_ud_component_%s', [AField.FieldName]);
    Parent := AControlsPanel;
    Left := 0;
    Top := ATop;
    Width := AControlsPanel.Width;
    if AField.DataType in [ftString, ftWideString] then
      Anchors := [akLeft, akTop, akRight];

    DataSource := Src;

    DataField := AField.FieldName;
    Tag := -ATop;
    if AField.DataType in [ftDateTime, ftTimeStamp] then
    begin
      AField.EditMask := '!##/##/####;1;_';
      OnKeyDown := DoOnDeleteKeyDown;
    end;
  end;
  { TODO -oSanketG -cWC : Need to find alternative for FocusControl in TUniLabel }
  //ALabel.FocusControl := TUniDBEdit(Result);
  IQMS.Common.Controls.CenterLabel(TUniDBEdit(Result), ALabel);
end;

function TFrmMandatoryColumns.Create_Label(const ATop: integer;
  const AField: TField; ALabelsPanel: TUniScrollBox): TUniLabel;
begin
  // Create the label
  Result := TUniLabel.Create(self);
  with Result do
  begin
    Parent := ALabelsPanel;
    Left := C_LABEL_LEFT;
    Top := ATop;
    Caption := AField.DisplayLabel;
    // Set tag to a negative number. Make label and DBEdit the same number
    // to link them logically
    Tag := -ATop;
  end;
end;

procedure TFrmMandatoryColumns.DoOnDeleteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key <> VK_DELETE) then
    exit;

  if (Sender is TUniDBEdit) then
    with (Sender as TUniDBEdit).Field do
    begin
      DataSet.Edit;
      Clear;
    end
  else if Sender is TUniDBDateTimePicker then
    with TUniDBDateTimePicker(Sender), DataSource do
    begin
      DataSet.Edit;
      DataSet.FieldByName(DataField).Clear;
    end;
  Key := 0;
end;

procedure TFrmMandatoryColumns.Button1Click(Sender: TObject);
begin
  Close;
end;

function TFrmMandatoryColumns.IsOktoClose: Boolean;
var
  AQry: TFDQuery;
  AField: TField;
  ANotFilled: Boolean;
begin
  ANotFilled := False;
  AQry := TFDQuery.Create(nil);
  try
    AQry.Connection := UniMainModule.FDConnection1;
    AQry.SQL.Add('select c.column_name,                        ');
    AQry.SQL.Add('       c.data_type                           ');
    AQry.SQL.Add('  from user_tab_columns c, metadata m        ');
    AQry.SQL.Add(Format(' where c.table_name = ''%s''                 ',
      [FTable]));
    AQry.SQL.Add('   and c.table_name = m.parent_object_name   ');
    AQry.SQL.Add('   and c.column_name = m.object_name         ');
    AQry.SQL.Add('   and m.mandatory_column = ''Y''            ');
    AQry.Open;
    while not AQry.Eof do
    begin
      AField := FDataset.FindField(AQry.FieldByName('column_name').AsString);
      ANotFilled := AField.AsString = '';
      AQry.Next;
    end;
  finally
    AQry.Free;
  end;
  if ANotFilled then
  begin
    // packslip_rscstr.cTXT0000130 =
    // 'One of the Mandatory Columns was not entered. Do you ' +
    // 'still want to close the form?';
    Result := IQConfirmYN(packslip_rscstr.cTXT0000130);
  end
  else
    Result := True;
end;

procedure TFrmMandatoryColumns.SetDataSet(const Value: TDataset);
begin
  FDataSet := Value;
end;

procedure TFrmMandatoryColumns.SetTable(const Value: string);
begin
  FTable := Value;
end;

end.
