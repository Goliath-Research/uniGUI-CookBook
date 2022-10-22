unit IQMS.Common.DataSetToRecord;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys;

type
  TDataSetToRecord = class
  private
    FDataSet : TDataSet;
    FHeaderList:TStringList;
    FRecordString:String;
    FFields:String;
    FFieldCount:Integer;
    procedure AppendAllFields;
    function  GetWidth(AFieldName:String):Integer;
  public
    constructor Create( ADataSet: TDataSet; AFields:String = '' );
    destructor Destroy; override;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property HeaderList   : TStringList read FHeaderList   write FHeaderList;
    property RecordString : String      read FRecordString write FRecordString;
    procedure FetchHeader(Lines: TStrings = nil); virtual;
    procedure FetchFooter(Lines: TStrings ); virtual;
    function  FetchRecord(Lines: TStrings = nil):string;
    procedure FetchField( AFieldName: string );  virtual;
    procedure FetchDataSet( Lines: TStrings );
    procedure BeforeFetchFields( Lines: TStrings ); virtual;
    procedure AfterFetchFields( Lines: TStrings ); virtual;
  end;

  TDataSetExportFixed = class(TDataSetToRecord)
    procedure FetchHeader( Lines: TStrings ); override;
  end;

  TDataSetExportDelimited = class(TDataSetToRecord)
  public
    Delimiter: string;
    Separator: string;
    constructor Create( ADataSet: TDataSet; AFields, ADelimiter, ASeparator: string );
    procedure FetchHeader(Lines: TStrings ); override;
    procedure FetchField( AFieldName: string );  override;
  end;

  TDataSetExportXML = class(TDataSetToRecord)
  private
    function IndentBy( ASpaces: Integer ): string;
  public
    procedure FetchHeader(Lines: TStrings ); override;
    procedure FetchFooter(Lines: TStrings ); override;
    procedure FetchField( AFieldName: string ); override;
    procedure BeforeFetchFields( Lines: TStrings ); override;
    procedure AfterFetchFields( Lines: TStrings );  override;
  end;


procedure DataSetToRecords(DataSet:TDataSet; Lines:TStrings; AFields: string = '');

procedure DataSetExportFixed(DataSet:TDataSet; Lines:TStrings; AFields: string );
procedure DataSetExportDelimited(DataSet:TDataSet; Lines:TStrings; AFields, ADelimiter, ASeparator: string );
procedure DataSetExportXML(DataSet:TDataSet; Lines:TStrings; AFields: string );

implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.Numbers;

{ Wrappers }
procedure DataSetToRecords(DataSet:TDataSet; Lines:TStrings; AFields:String = '');
begin
  if not Assigned(DataSet) then
    Exit;
  with TDataSetToRecord.Create(DataSet, AFields) do
  try
    FetchDataSet(Lines);
  finally
    Free;
  end;
end;

procedure DataSetExportFixed(DataSet:TDataSet; Lines:TStrings; AFields: string );
begin
  if not Assigned(DataSet) then
    Exit;
  with TDataSetExportFixed.Create( DataSet, AFields ) do
  try
    FetchDataSet(Lines);
  finally
    Free;
  end;
end;

procedure DataSetExportDelimited(DataSet:TDataSet; Lines:TStrings; AFields, ADelimiter, ASeparator: string );
begin
  if not Assigned(DataSet) then
    Exit;
  with TDataSetExportDelimited.Create( DataSet, AFields, ADelimiter, ASeparator ) do
  try
    FetchDataSet(Lines);
  finally
    Free;
  end;
end;


procedure DataSetExportXML(DataSet:TDataSet; Lines:TStrings; AFields: string );
begin
  if not Assigned(DataSet) then
    Exit;
  with TDataSetExportXML.Create( DataSet, AFields ) do
  try
    FetchDataSet(Lines);
  finally
    Free;
  end;
end;

{  TDataSetToRecord }

constructor TDataSetToRecord.Create( ADataSet: TDataSet; AFields:String = '');
begin
  {Dataset}
  FDataSet:= ADataSet;

  {Fields - get rid of spaces etc}
  FFields := StrTran(AFields, ';', ',');
  while Pos(' ', FFields) > 0 do
    FFields := StrTran(FFields, ' ', '');

  if FFields = '' then
    AppendAllFields
  else if Assigned(FDataSet) then
    FDataSet.FieldDefs.Update;

  FFieldCount:= NumToken(FFields, ',');
  FHeaderList:= TStringList.Create;
end;

destructor TDataSetToRecord.Destroy;
begin
  FHeaderList.Free;
end;

procedure TDataSetToRecord.AppendAllFields;
var
  i:Integer;
begin
  if Assigned(FDataSet) then
  with FDataSet do
  begin
    FieldDefs.Update;
    FFields:= FieldDefs.Items[0].Name;
    for I:= 1 to FieldDefs.Count - 1 do
      FFields := FFields + ',' + FieldDefs.Items[ I ].Name;
  end;
end;

function TDataSetToRecord.GetWidth(AFieldName:String):Integer;
var
  AField:TFieldDef;
  AWidth:Integer;
begin
  try
    AField:= FDataSet.FieldDefs.Find(AFieldName);
  except
    AField:= NIL;
  end;

  if not Assigned( AField ) then
     AWidth:= Length(AFieldName)
  else if AField.DataType in [ftSmallint, ftInteger, ftFloat, ftCurrency] then
     AWidth := 15
  else if AField.DataType in [ftDate, ftDateTime, ftTime] then
     AWidth := 22
  else
     AWidth := AField.Size;

  if Length(AFieldName) > AWidth then
     Result := Length(AFieldName) + 1
  else
     Result := AWidth + 1;
end;

procedure TDataSetToRecord.FetchHeader(Lines:TStrings = nil);
var
  AStr1     : string;
  AStr2     : string;
  AFieldName: string;
  I, AWidth:Integer;
begin
  AStr1:= '';
  AStr2:= '';

  for I:= 1 to FFieldCount do
  begin
    AFieldName:= GetToken(FFields, ',', i);
    AWidth    := GetWidth(AFieldName);

    AStr1:= AStr1 + PadR( ProperCase(AFieldName), IIf( I = FFieldCount, AWidth - 1, AWidth ));
    AStr2:= AStr2 + Repl('_', AWidth - 1) + ' ';
  end;

  FHeaderList.Clear;
  FHeaderList.Add(AStr1);
  FHeaderList.Add(AStr2);

  if Assigned(Lines) then
  begin
    Lines.Add(AStr1);
    Lines.Add(AStr2);
  end;
end;

function TDataSetToRecord.FetchRecord(Lines:TStrings = nil):String;
var
  AFieldName: string;
  AField    : TFieldDef;
  I         : Integer;
begin
  FRecordString := '';

  BeforeFetchFields( Lines );

  for I:= 1 to FFieldCount do
    FetchField( GetToken( FFields, ',', I ));

  AfterFetchFields( Lines );

  Result:= FRecordString;

  if Assigned(Lines) and (Result > '') then
    Lines.Add(Result);
end;

procedure TDataSetToRecord.FetchField( AFieldName: string );
var
  AWidth: Integer;
  AField: TFieldDef;
begin
  AWidth:= GetWidth( AFieldName );
  try
    AField:= FDataSet.FieldDefs.Find(AFieldName);
  except
    AField:= NIL;
  end;

  if not Assigned( AField ) then
  begin
    FRecordString := FRecordString + Space( AWidth );
    EXIT;
  end;

  with FDataSet do
    case AField.DataType of
      ftSmallint, ftInteger, ftFloat, ftCurrency:
        FRecordString := FRecordString + Space(AWidth - Length(Trim(FieldByName(AField.Name).asString)) - 1) + Trim(FieldByName(AField.Name).asString) + ' ';

      ftDateTime:
        begin
          if FieldByName(AField.Name).AsDateTime <> 0 then
             FRecordString:= FRecordString + Space(AWidth - Length(Trim( DateTimeToStr( FieldByName(AField.Name).AsDateTime ))) - 1) +
                             Trim( DateTimeToStr( FieldByName(AField.Name).AsDateTime )) + ' '
          else
             FRecordString:= FRecordString + Space(AWidth);
        end

    else
      FRecordString:= FRecordString + PadR(FieldByName(AField.Name).asString, AWidth)
    end;
end;

procedure TDataSetToRecord.FetchDataSet(Lines:TStrings);
begin
  if not Assigned(Lines) then
    Exit;
  Lines.Clear;
  FetchHeader(Lines);
  with FDataSet do
  begin
    // Open;
    // First;
    Close;
    Open;
    while not eof do
    begin
      FetchRecord(Lines);
      Next;
    end;
  end;
  FetchFooter(Lines);
end;

procedure TDataSetToRecord.FetchFooter(Lines: TStrings);
begin
  {place holder. will be used in XML export}
end;

procedure TDataSetToRecord.BeforeFetchFields(Lines: TStrings);
begin
  {place holder. will be used in XML export}
end;


procedure TDataSetToRecord.AfterFetchFields(Lines: TStrings);
begin
  {place holder. will be used in XML export}
end;


{ TDataSetExportFixed }

procedure TDataSetExportFixed.FetchHeader(Lines: TStrings);
begin
  // inherited;  {when exporting there is not titles}
end;



{ TDataSetExportDelimited }

constructor TDataSetExportDelimited.Create(ADataSet: TDataSet; AFields, ADelimiter, ASeparator: string);
begin
  inherited Create( ADataSet, AFields );
  Delimiter:= ADelimiter;
  Separator:= ASeparator;
end;

procedure TDataSetExportDelimited.FetchHeader(Lines: TStrings);
begin
  // inherited;  {when exporting there is not titles}
end;

procedure TDataSetExportDelimited.FetchField(AFieldName: string);
var
  AField: TFieldDef;
begin
  if not Assigned(FDataSet) then
    Exit;

  try
    AField:= FDataSet.FieldDefs.Find(AFieldName);
  except
    AField:= NIL;
  end;

  if Assigned( AField ) then with FDataSet do
  begin
     case AField.DataType of
       ftSmallint, ftInteger, ftFloat, ftCurrency:
         FRecordString:= FRecordString + Trim( FieldByName(AField.Name).asString );

       ftDateTime:
         if FieldByName(AField.Name).AsDateTime <> 0 then
            FRecordString:= FRecordString + Separator + Trim( DateTimeToStr( FieldByName(AField.Name).AsDateTime )) + Separator;

     else
         FRecordString:= FRecordString + Separator + FieldByName(AField.Name).asString + Separator;
     end;
  end;

  if GetToken( FFields, ',', FFieldCount ) <> AFieldName then
     FRecordString := FRecordString + Delimiter;
end;



{ TDataSetExportXML }

procedure TDataSetExportXML.FetchHeader(Lines: TStrings);
begin
  Lines.Add( '<?xml version="1.0" encoding="ISO-8859-1" ?>' );
  Lines.Add( '<DataSet>' );
end;

procedure TDataSetExportXML.FetchFooter(Lines: TStrings);
begin
  Lines.Add( '</DataSet>' );
end;

procedure TDataSetExportXML.BeforeFetchFields(Lines: TStrings);
begin
  FRecordString:= FRecordString + IndentBy( 2 ) + '<Record>'#13;
end;

procedure TDataSetExportXML.AfterFetchFields(Lines: TStrings);
begin
  FRecordString:= FRecordString + IndentBy( 2 ) + '</Record>';
end;

function TDataSetExportXML.IndentBy(ASpaces: Integer): string;
begin
  Result:= Space( ASpaces );
end;

procedure TDataSetExportXML.FetchField(AFieldName: string);
var
  AField: TFieldDef;
begin
  try
    AField:= FDataSet.FieldDefs.Find(AFieldName);
  except
    AField:= NIL;
  end;

  FRecordString:= Format('%s%s<%s>',[ FRecordString, IndentBy( 4 ), AFieldName ]);

  if Assigned( AField ) then with FDataSet do
  begin
     case AField.DataType of
       ftSmallint, ftInteger, ftFloat, ftCurrency:
         FRecordString:= FRecordString + Trim( FieldByName(AField.Name).asString );

       ftDateTime:
         if FieldByName(AField.Name).AsDateTime <> 0 then
            FRecordString:= FRecordString + Trim( DateTimeToStr( FieldByName(AField.Name).AsDateTime ));

     else
         FRecordString:= FRecordString + FieldByName(AField.Name).asString
     end;
  end;

  FRecordString:= Format('%s</%s>'#13, [ FRecordString, AFieldName ]);
end;



end.
