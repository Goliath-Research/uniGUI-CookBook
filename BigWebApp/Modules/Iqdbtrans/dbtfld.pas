unit dbtfld;

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
  ComCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TDTCargo = class
   DataType: String;
   Length,
   Precision,
   Scale: Boolean;
   Obsolete: Boolean;
   constructor Create(
    ADataType: String;
    ALength,
    APrecision,
    AScale: Boolean);
  end;

  TFrmDbTransField = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    edtFieldName: TUniEdit;
    lblFieldName: TUniLabel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    lblDataType: TUniLabel;
    lblLength: TUniLabel;
    lblPrecision: TUniLabel;
    lblScale: TUniLabel;
    PnlClient02: TUniPanel;
    cmbDataType: TUniComboBox;
    edtLength: TUniEdit;
    edtPrecision: TUniEdit;
    edtScale: TUniEdit;
    udPrecision: TUpDown;
    udScale: TUpDown;
    procedure cmbDataTypeChange(Sender: TObject);
    procedure cmbDataTypeDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SetDisplay(ADataType: String;
                         ALength,
                         APrecision,
                         AScale: SmallInt);
    procedure LoadDataTypeList;
    procedure SetControls;
    procedure SetMinMax;
    function GetDataType: String;
    function GetLength: SmallInt;
    function GetPrecision: SmallInt;
    function GetScale: SmallInt;
    function GetDataTypeSyntax: String;
    function CheckIfDeprecated: Boolean;
    procedure SetDataType(const Value: String);
    procedure SetPrecision(const Value: SmallInt);
    procedure SetScale(const Value: SmallInt);
  public
    { Public declarations }
//    constructor Create(AOwner: TComponent;
//                       AFieldName: String;
//                       ADataType: String;
//                       ALength,
//                       APrecision,
//                       AScale: SmallInt);

    property DataType: String read GetDataType;
    property Length: SmallInt read GetLength;
    property Precision: SmallInt read GetPrecision;
    property Scale: SmallInt read GetScale;
    property DataTypeSyntax: String read GetDataTypeSyntax;
  end;

  function DoDefineField(const AFieldName: String;
                         var ADataType: String;
                         var ALength: SmallInt;
                         var APrecision: SmallInt;
                         var AScale: SmallInt;
                         var ADefinition: String): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

function DoDefineField(  const AFieldName: String;
                         var ADataType: String;
                         var ALength: SmallInt;
                         var APrecision: SmallInt;
                         var AScale: SmallInt;
                         var ADefinition: String): Boolean;
var
  LFrmDbTransField : TFrmDbTransField;
begin
//  with TFrmDbTransField.Create(AOwner,
//                               AFieldName,
//                               ADataType,
//                               ALength,
//                               APrecision,
//                               AScale) do
  LFrmDbTransField := TFrmDbTransField.Create(uniGUIApplication.UniApplication);
     with LFrmDbTransField do
     begin
     Result := (ShowModal = mrOk);
     if Result then
        begin
          ADataType := DataType;
          ALength := Length;
          APrecision :=Precision;
          AScale := Scale;
          ADefinition := DataTypeSyntax;
        end;
     end;

end;

{ TDTCargo }

constructor TDTCargo.Create(ADataType: String; ALength, APrecision,
  AScale: Boolean);
begin
  DataType := ADataType;
  Length    := ALength;
  Precision := APrecision;
  Scale     := AScale;
  Obsolete  := False;
end;

{ TFrmDbTransField }
{
constructor TFrmDbTransField.Create(AOwner: TComponent; AFieldName,
  ADataType: String; ALength, APrecision, AScale: SmallInt);
begin
  inherited Create(AOwner);
  edtFieldName.Text := UpperCase(Trim(AFieldName));
  edtFieldName.Left := lblFieldName.Left + lblFieldName.Width + 16;
  LoadDataTypeList;
  SetDisplay(ADataType, ALength, APrecision, AScale);
end;
}
procedure TFrmDbTransField.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01]);
end;

procedure TFrmDbTransField.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmDbTransField.SetDataType(const Value: String);
begin

end;

procedure TFrmDbTransField.SetDisplay(ADataType: String; ALength,
  APrecision, AScale: SmallInt);
var
   i: SmallInt;
   b_len, b_prec, b_scale: Boolean;
begin
{ TODO -omugdha -cWEBIQ : dependancy on udiLength
  udLength.Position := ALength;
  udPrecision.Position := APrecision;
  udScale.Position := AScale;
  b_len := (ALength > 0);
  b_prec := (APrecision > 0);
  b_scale := (AScale > 0);
  for i := 0 to cmbDataType.Items.Count - 1 do
     if (TDTCargo(cmbDataType.Items.Objects[i]).DataType = ADataType) and
        (b_len = TDTCargo(cmbDataType.Items.Objects[i]).Length) and
        (b_prec = TDTCargo(cmbDataType.Items.Objects[i]).Precision) and
        (b_scale = TDTCargo(cmbDataType.Items.Objects[i]).Scale) then
        begin
          cmbDataType.ItemIndex := i;
          Break;
        end;
  SetControls;
  }
end;

procedure TFrmDbTransField.cmbDataTypeChange(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

function TFrmDbTransField.CheckIfDeprecated: Boolean;
var
   dt: String;
begin
{ TODO -omugdha -cWEBIQ : dependancy on udiLength
  Result := True;
  if (cmbDataType.ItemIndex > -1) and
     TDTCargo(cmbDataType.Items.Objects[cmbDataType.ItemIndex]).Obsolete then }
     {'The selected data type, %s, has been deprecated.  ' +
      'Are you sure you want to use this data type'}
      { TODO -omugdha -cWEBIQ : dependancy on udiLength
     Result := IQMS.Common.Dialogs.IQConfirmYN(Format(IQMS.DBTrans.dbtrscstr.cTXT0000191,
      [TDTCargo(cmbDataType.Items.Objects[cmbDataType.ItemIndex]).DataType])); }
end;

procedure TFrmDbTransField.SetControls;
var
   i: SmallInt;
begin
  i := cmbDataType.ItemIndex;
  { TODO -omugdha -cWEBIQ : dependancy on udiLength
  IQMS.Common.Controls.IQShowControl([lblLength, edtLength, udLength,
                        lblPrecision, edtPrecision, udPrecision,
                        lblScale, edtScale, udScale], False);
  if i = -1 then
     Exit;

  lblLength.Visible := TDTCargo(cmbDataType.Items.Objects[i]).Length;
  edtLength.Visible := lblLength.Visible;
  udLength.Visible := lblLength.Visible;

  lblPrecision.Visible := TDTCargo(cmbDataType.Items.Objects[i]).Precision;
  edtPrecision.Visible := lblPrecision.Visible;
  udPrecision.Visible := lblPrecision.Visible;

  lblScale.Visible := TDTCargo(cmbDataType.Items.Objects[i]).Scale;
  edtScale.Visible := lblScale.Visible;
  udScale.Visible := lblScale.Visible;
              }
  SetMinMax;

end;

procedure TFrmDbTransField.SetMinMax;
var
   ADataType: String;
begin
  ADataType := Self.DataType;
  //udLength.Min := 1;
  udPrecision.Min := 1;
  udScale.Min := 1;

       if (ADataType = 'CHAR') or
          (ADataType = 'NCHAR') or
          (ADataType = 'CHARACTER') then
          //udLength.Max := 2000

  else if (ADataType = 'VARCHAR2') or
          (ADataType = 'NVARCHAR2') or
          (ADataType = 'CHARACTER VARYING') or
          (ADataType = 'CHAR VARYING') then
          //udLength.Max := 4000

  else if (ADataType = 'NUMBER') or
          (ADataType = 'FLOAT') or
          (ADataType = 'REAL') or
          (ADataType = 'INT') or
          (ADataType = 'INTEGER') or
          (ADataType = 'SMALLINT') or
          (ADataType = 'DEC') or
          (ADataType = 'DECIMAL') or
          (ADataType = 'DOUBLE PRECISION') then
     begin
       udPrecision.Max := 38;
       udScale.Max := 127;
     end;
end;

procedure TFrmDbTransField.SetPrecision(const Value: SmallInt);
begin

end;

procedure TFrmDbTransField.SetScale(const Value: SmallInt);
begin

end;

procedure TFrmDbTransField.LoadDataTypeList;

  procedure _Add(ACaption, ADataType: String; ALength, APrecision,
    AScale: Boolean; AObsolete: Boolean = False);
  var
     i: Integer;
  begin
    i := cmbDataType.Items.AddObject(ACaption,
     TDTCargo.Create(ADataType, ALength, APrecision, AScale));
    if AObsolete then
       TDTCargo(cmbDataType.Items.Objects[i]).Obsolete := True;
  end;

begin
  try
     cmbDataType.Items.BeginUpdate;
     cmbDataType.Items.Clear;
     _Add('BLOB', 'BLOB', False {Length}, False {Precision}, False {Scale});
     _Add('CHAR', 'CHAR', False {Length}, False {Precision}, False {Scale});
     _Add('CHAR VARYING(%N)', 'CHAR VARYING', True {Length}, False {Precision}, False {Scale});
     _Add('CHAR(%N)', 'CHAR', True {Length}, False {Precision}, False {Scale});
     _Add('CHARACTER', 'CHARACTER', False {Length}, False {Precision}, False {Scale});
     _Add('CHARACTER VARYING(%N)', 'CHARACTER VARYING', True {Length}, False {Precision}, False {Scale});
     _Add('CHARACTER(%N)', 'CHARACTER', True {Length}, False {Precision}, False {Scale});
     _Add('CLOB', 'CLOB', False {Length}, False {Precision}, False {Scale});
     _Add('DATE', 'DATE', False {Length}, False {Precision}, False {Scale});
     _Add('DEC', 'DEC', False {Length}, False {Precision}, False {Scale});
     _Add('DEC(%P)', 'DEC', False {Length}, True {Precision}, False {Scale});
     _Add('DEC(%P,%S)', 'DEC', False {Length}, True {Precision}, True {Scale});
     _Add('DECIMAL', 'DECIMAL', False {Length}, False {Precision}, False {Scale});
     _Add('DECIMAL(%P)', 'DECIMAL', False {Length}, True {Precision}, False {Scale});
     _Add('DECIMAL(%P,%S)', 'DECIMAL', False {Length}, False {Precision}, False {Scale});
     _Add('DOUBLE PRECISION', 'DOUBLE PRECISION', False {Length}, False {Precision}, False {Scale});
     _Add('FLOAT', 'FLOAT', False {Length}, False {Precision}, False {Scale});
     _Add('FLOAT(%P)', 'FLOAT', False {Length}, True {Precision}, False {Scale});
     _Add('INT', 'INT', False {Length}, False {Precision}, False {Scale});
     _Add('INTEGER', 'INTEGER', False {Length}, False {Precision}, False {Scale});
     _Add('LONG', 'LONG', False {Length}, False {Precision}, False {Scale}, True {Obsolete});
     _Add('LONG RAW', 'LONG RAW', False {Length}, False {Precision}, False {Scale}, True {Obsolete});
     _Add('LONG VARCHAR', 'LONG VARCHAR', False {Length}, False {Precision}, False {Scale}, True {Obsolete});
     _Add('NUMBER', 'NUMBER', False {Length}, False {Precision}, False {Scale});
     _Add('NUMBER(%P)', 'NUMBER', False {Length}, True {Precision}, False {Scale});
     _Add('NUMBER(%P,%S)', 'NUMBER', False {Length}, True {Precision}, True {Scale});
     //Obsolete:  _Add('RAW(%N)', 'RAW', True {Length}, False {Precision}, False {Scale});
     _Add('REAL', 'REAL', False {Length}, False {Precision}, False {Scale});
     _Add('SMALLINT', 'SMALLINT', False {Length}, False {Precision}, False {Scale});
     _Add('VARCHAR(%N)', 'VARCHAR', True {Length}, False {Precision}, False {Scale});
     _Add('VARCHAR2(%N)', 'VARCHAR2', True {Length}, False {Precision}, False {Scale});
  finally
    cmbDataType.Items.EndUpdate;
  end;
end;

function TFrmDbTransField.GetDataType: String;
begin
  Result := '';
  if (cmbDataType.ItemIndex > -1) then
     Result := TDTCargo(cmbDataType.Items.Objects[cmbDataType.ItemIndex]).DataType;
end;

function TFrmDbTransField.GetLength: SmallInt;
begin
  Result := 0;
  if (cmbDataType.ItemIndex > -1) and
     TDTCargo(cmbDataType.Items.Objects[cmbDataType.ItemIndex]).Length then
     //Result := udLength.Position;
end;

function TFrmDbTransField.GetPrecision: SmallInt;
begin
  Result := 0;
  if (cmbDataType.ItemIndex > -1) and
     TDTCargo(cmbDataType.Items.Objects[cmbDataType.ItemIndex]).Precision then
     Result := udPrecision.Position;
end;

function TFrmDbTransField.GetScale: SmallInt;
begin
  Result := 0;
  if (cmbDataType.ItemIndex > -1) and
     TDTCargo(cmbDataType.Items.Objects[cmbDataType.ItemIndex]).Scale then
     Result := udScale.Position;
end;

function TFrmDbTransField.GetDataTypeSyntax: String;
var
   s: String;
begin
  Result := '';
  if (cmbDataType.ItemIndex > -1) then
  { TODO -omugdha -cWEBIQ : dependancy on udiLength
     begin
       s := cmbDataType.Items.Strings[cmbDataType.ItemIndex];
       s := IQMS.Common.StringUtils.StrTran(s, '%N', IntToStr(udLength.Position));
       s := IQMS.Common.StringUtils.StrTran(s, '%P', IntToStr(udPrecision.Position));
       s := IQMS.Common.StringUtils.StrTran(s, '%S', IntToStr(udLength.Position));
       Result := s;
     end;
     }

end;

procedure TFrmDbTransField.cmbDataTypeDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
{
 TOwnerDrawState =
  (odSelected, odGrayed, odDisabled, odChecked, odFocused, odDefault,
   odHotLight, odInactive, odNoAccel, odNoFocusRect, odReserved1,
   odReserved2, odComboBoxEdit)
}

  if (odSelected in State) or (odFocused in State) then
  { TODO -omugdha -cWEBIQ : dependancy on canvas
     cmbDataType.Canvas.Font.Color := clWhite }

  else if not (odComboBoxEdit in State) and
    (TDTCargo(cmbDataType.Items.Objects[Index]).Obsolete) then
    begin
    { TODO -omugdha -cWEBIQ : dependancy on canvas
      cmbDataType.Canvas.Font.Style := [fsItalic];
      cmbDataType.Canvas.Font.Color := clGray; }
    end

  else
     begin
     { TODO -omugdha -cWEBIQ : dependancy on canvas
         cmbDataType.Canvas.Font.Style := [];
         cmbDataType.Canvas.Font.Color := clWindowText; }
     end;
       { TODO -omugdha -cWEBIQ : dependancy on canvas
    cmbDataType.Canvas.FillRect(Rect);
    cmbDataType.Canvas.TextOut(Rect.Left,Rect.Top,cmbDataType.Items[Index]);}

end;

procedure TFrmDbTransField.btnOkClick(Sender: TObject);
begin
  if CheckIfDeprecated then
     ModalResult := mrOk;
end;

end.
