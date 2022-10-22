unit dv_fielddef;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.Win.ADODB,
  Data.DB,
  TypInfo,
  Winapi.ADOInt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  Vcl.Controls;

type
  TFrmDvFieldDef = class(TUniForm)
    Grid: TUniStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FTableName: string;
    FADOConnection: TADOConnection;
    procedure AddDef(const AFieldName, ADataType: string;
      const ADataLength, ADataPrecision, AScale, ATextLength: Integer);
    procedure ResetGrid;
  public
    { Public declarations }
    procedure LoadDefinition(ADOConnection: TADOConnection; ATableName: string);
    procedure DoShow(ADOConnection: TADOConnection;ATableName: string);
    property TableName: string read FTableName;
    property ADOConnection: TADOConnection read FADOConnection;
  end;

implementation

{$R *.dfm}

uses
  MainModule,
  IQMS.Common.RegFrm,
  IQMS.Common.FileUtils;

{ TFrmDvFieldDef }

procedure TFrmDvFieldDef.DoShow(ADOConnection: TADOConnection; ATableName: string);
var
  FrmDvFieldDef : TFrmDvFieldDef;
begin
  FrmDvFieldDef := TFrmDvFieldDef.Create(uniGUIApplication.UniApplication);
   with FrmDvFieldDef do
    begin
      LoadDefinition(ADOConnection, ATableName);
      show;
    end;
end;

procedure TFrmDvFieldDef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmDvFieldDef.LoadDefinition(ADOConnection: TADOConnection;
  ATableName: string);
var
  Fields: Recordset;
  FieldLen: Integer;
  Flags: Integer;
  DataType: DataTypeEnum;

  AFieldName, ADataType, AAdoFieldType: string;
  ADataLength, ADataPrecision, AScale, AFieldLength: Integer;

  function _ADOTypeToFieldType(const ADOType: DataTypeEnum;
    Precision, Scale: Integer; EnableBCD: Boolean = True): TFieldType;
  begin
    case ADOType of
      adEmpty:
        Result := ftUnknown;
      adTinyInt, adSmallInt:
        Result := ftSmallint;
      adError, adInteger, adUnsignedInt:
        Result := ftInteger;
      adBigInt, adUnsignedBigInt:
        Result := ftLargeInt;
      adUnsignedTinyInt, adUnsignedSmallInt:
        Result := ftWord;
      adSingle, adDouble:
        Result := ftFloat;
      adCurrency:
        Result := ftBCD;
      adBoolean:
        Result := ftBoolean;
      adDBDate:
        Result := ftDate;
      adDBTime:
        Result := ftTime;
      adDate, adDBTimeStamp, adFileTime, adDBFileTime:
        Result := ftDateTime;
      adChar:
        Result := ftFixedChar;
      adVarChar:
        Result := ftString;
      adWChar:
        Result := ftFixedWideChar;
      adBSTR, adVarWChar:
        Result := ftWideString;
      adLongVarChar:
        Result := ftMemo;
      adLongVarWChar:
        Result := ftWideMemo;
      adLongVarBinary:
        Result := ftBlob;
      adBinary:
        Result := ftBytes;
      adVarBinary:
        Result := ftVarBytes;
      adChapter:
        Result := ftDataSet;
      adPropVariant, adVariant:
        Result := ftVariant;
      adIUnknown:
        Result := ftInterface;
      adIDispatch:
        Result := ftIDispatch;
      adGUID:
        Result := ftGUID;
      adDecimal, adNumeric, adVarNumeric:
        if EnableBCD then
          begin
            // Use TFMTBcd for precision and numeric scale values that are out of
            // the range of what is supported by TBCDField and the Currency type.
            if (Scale > 4) or (Precision > 19) then
              Result := ftFMTBcd
            else
              Result := ftBCD;
          end
        else
          Result := ftFloat;
    else
      Result := ftUnknown;
    end;
  end;

  function _ADOTypeToStr(const ADOType: DataTypeEnum): String;
  begin
    case ADOType of
      adEmpty:
        Result := 'Empty';
      adTinyInt:
        Result := 'TinyInt';
      adSmallInt:
        Result := 'SmallInt';
      adInteger:
        Result := 'Integer';
      adBigInt:
        Result := 'BigInt';
      adUnsignedTinyInt:
        Result := 'UnsignedTinyInt';
      adUnsignedSmallInt:
        Result := 'UnsignedSmallInt';
      adUnsignedInt:
        Result := 'UnsignedInt';
      adUnsignedBigInt:
        Result := 'UnsignedBigInt';
      adSingle:
        Result := 'Single';
      adDouble:
        Result := 'Double';
      adCurrency:
        Result := 'Currency';
      adDecimal:
        Result := 'Decimal';
      adNumeric:
        Result := 'Numeric';
      adBoolean:
        Result := 'Boolean';
      adError:
        Result := 'Error';
      adUserDefined:
        Result := 'UserDefined';
      adVariant:
        Result := 'Variant';
      adIDispatch:
        Result := 'IDispatch';
      adIUnknown:
        Result := 'IUnknown';
      adGUID:
        Result := 'GUID';
      adDate:
        Result := 'Date';
      adDBDate:
        Result := 'DBDate';
      adDBTime:
        Result := 'DBTime';
      adDBTimeStamp:
        Result := 'DBTimeStamp';
      adBSTR:
        Result := 'BSTR';
      adChar:
        Result := 'Char';
      adVarChar:
        Result := 'VarChar';
      adLongVarChar:
        Result := 'LongVarChar';
      adWChar:
        Result := 'WChar';
      adVarWChar:
        Result := 'VarWChar';
      adLongVarWChar:
        Result := 'LongVarWChar';
      adBinary:
        Result := 'Binary';
      adVarBinary:
        Result := 'VarBinary';
      adLongVarBinary:
        Result := 'LongVarBinary';
      adChapter:
        Result := 'Chapter';
      adFileTime:
        Result := 'FileTime';
      adDBFileTime:
        Result := 'DBFileTime';
      adPropVariant:
        Result := 'PropVariant';
      adVarNumeric:
        Result := 'VarNumeric';
      adArray:
        Result := 'Array';
    else
      Result := IntToStr(ADOType);
    end;
  end;

begin
  Self.FADOConnection := ADOConnection;
  Self.FTableName := FileNameNoExt(ATableName);
  ResetGrid;

  if not Assigned(FADOConnection) or (FTableName = '') then
    Exit;

  if not FADOConnection.Connected then
    FADOConnection.Connected := True;

  Fields := FADOConnection.ConnectionObject.OpenSchema(adSchemaColumns,
    VarArrayOf([Null, Null, FTableName]), EmptyParam);

  while not Fields.EOF do
    begin
      AFieldName := VarToStr(Fields.Fields['COLUMN_NAME'].Value);
      ADataType := _ADOTypeToStr(Fields.Fields['DATA_TYPE'].Value);
      ADataLength := StrToIntDef(VarToStr(
        Fields.Fields['CHARACTER_MAXIMUM_LENGTH'].Value), 0);
      ADataPrecision := StrToIntDef(VarToStr(
        Fields.Fields['NUMERIC_PRECISION'].Value), 0);
      AScale := StrToIntDef(VarToStr(
        Fields.Fields['NUMERIC_SCALE'].Value), 0);
      AFieldLength := StrToIntDef(VarToStr(
        Fields.Fields['CHARACTER_MAXIMUM_LENGTH'].Value), 0);
      // AAdoFieldType := _ADOTypeToFieldType(Fields.Fields['DATA_TYPE'].Value,ADataPrecision,AScale,True);
      // Flags := StrToIntDef(VarToStr(Fields.Fields['COLUMN_FLAGS'].Value), 0);
      AddDef(AFieldName, ADataType, ADataLength, ADataPrecision, AScale,AFieldLength);
      Fields.MoveNext;
    end;
end;

procedure TFrmDvFieldDef.ResetGrid;
begin
  with Grid do
    begin
      RowCount := 1;
      ColCount := 6;
    end;
end;

procedure TFrmDvFieldDef.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
end;

procedure TFrmDvFieldDef.AddDef(const AFieldName, ADataType: string;
  const ADataLength, ADataPrecision, AScale, ATextLength: Integer);
var
  ACode, ADescrip: String;
  ARow: Integer;
begin
  with Grid do
    begin
      ARow := 1;
      if (Trim(Cells[0,ARow]) > '') then
        begin
          ARow := RowCount;
          RowCount := ARow + 1;
        end;
      Cells[0,ARow] := AFieldName;
      Cells[1,ARow] := ADataType;
      Cells[2,ARow] := IntToStr(ADataLength);
      Cells[3,ARow] := IntToStr(ADataPrecision);
      Cells[4,ARow] := IntToStr(AScale);
      Cells[5,ARow] := IntToStr(ATextLength);
    end;
end;

end.
