
{*******************************************************}
{                                                       }
{ Non-visual component for editing or creating          }
{ a schema file.  The TFixedText component is visible   }
{ at runtime.                                           }
{                                                       }
{*******************************************************}

unit dbtschma;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Forms,
  Controls,
  IQMS.Common.Registry,
  Menus,
  Graphics,
  ExtCtrls,
  Variants,
  Math,
  IniFiles,
  DB;

  procedure GetSchemaFileName( const ATextFileName: String; var ASchemaFileName: String );


type
  TTextFieldInfo = packed record
   FieldName: String;
   FieldSize: Integer;
   FieldType: TFieldType;
end;

type
  TTextFieldArray = array of TTextFieldInfo;

type
  { Forwards }
  TSchemaField = class;

  TSchemaFieldList = class;

  TSchemaType = ( stDelimited, stFixed );

  TDBSchema = class( TComponent )
  private
    FSchemaFileName: String; // full path and name
    FTextFileName: String;   // full path and name
    FDelimiter: String;
    FSeparator: String;
    FSchemaType: TSchemaType;
    FSchemaFileLines: TStringList;
    FHasFieldNames: Boolean;
    // Returns list with schema header lines
    procedure GetSchemaHeader( const ASchemaType: TSchemaType;
       const AFileName, ADelimiter, ASeparator: String;
       var AList: TStringList );
    // Returns list with schema field list
    function EstimateSchemaFieldList: Boolean; // returns TRUE if successful
    function ReadLine( AFileName: String; ALine: Integer ): String; // reads a line from a text file
    // Subroutines called by foregoing main methods
    //function ParseToList( ALineIN, ASeparator: String;
    //   var AList: TStringList ): Boolean;
       
    procedure GetTextFileColInfo(const AFileName: String;
                                  const ASchemaType: TSchemaType;
                                  const ASeparator: String; // field separator
                                  const ADelimiter: String; // text delimiter
                                  var ATextColInfo: TTextFieldArray;
                                  AFirstRowHasFieldNames: Boolean = False);

  public
    SchemaFieldList: TSchemaFieldList;
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    procedure Estimate;      // returns schema information, but does not create file
    procedure Execute;       // creates schema file
    procedure SuggestParams; // overwrites schema config properties based on TextFileName
    function LoadSchemaFile(AFileName: String): Boolean;
  published
    property Delimiter: String read FDelimiter write FDelimiter;
    property HasFieldNames: Boolean read FHasFieldNames write FHasFieldNames;
    property SchemaFileLines: TStringList read FSchemaFileLines;
    property SchemaFileName: String read FSchemaFileName;
    property SchemaType: TSchemaType read FSchemaType write FSchemaType;
    property Separator: String read FSeparator write FSeparator;
    property TextFileName: String read FTextFileName write FTextFileName;
  end;

{ TSchemaField }

  TSchemaField = class( TObject )
    FieldName: String;
    FieldSize: Integer;
    FieldType: String;
    FieldOffset: Integer;
    constructor Create( AFieldName: String; AFieldSize: Integer );
  end;

{ TSchemaFieldList }

  TSchemaFieldList = class( TList )
    function AddField( AFieldName: String; AFieldSize: Integer ): TSchemaField;
    function FieldNameOf( AIndex: Integer ): String;
    function FieldSizeOf( AIndex: Integer ): Integer;
    function FieldTypeOf( AIndex: Integer ): String;
    function FieldOffsetOf( AIndex: Integer ): Integer;
    function FindFieldName( AName: String ): Integer;
    function FindFieldOffset( AOffset: Integer ): Integer;
    procedure GetSchemaDefinition( var AList: TStringList );
end;


{ TFixedText }

type
  { Forwards }
  TRuler = class;

  TRulerMarker = class;

  TRulerMarkerList = class;

  TLines = class(TStringList);

  TFixedText = class(TPanel)
   procedure DoOnPaint(Sender: TObject);
   procedure DoOnPaintLineNumbers(Sender: TObject);
   procedure DoRulerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
   FAllowAddMarker, FAllowDeleteMarker, FAllowMoveMarker: Boolean;
   FScrollBox: TScrollBox;
   FTextCanvas: TPaintBox;
   FLineNumbers: TPaintBox;
   FRuler: TRuler;
   FLines: TStringList;
   FShowRuler: Boolean;
   FMaxLines: Integer;
   FLineNumbersPanel: TPanel;
   FLineNumbersSpacer: TPanel;
   FModified: Boolean;
   FShowMarkers: Boolean;
   procedure ConfigurePaintBox;
   procedure PaintLines;
   procedure PaintLineNumbers;
   function GetRulerMarkerList: TRulerMarkerList;
   procedure SetLines(const Value: TStringList);
   procedure SetShowRuler(const Value: Boolean);
   function GetRightBorder: Integer;
   procedure SetShowMarkers(const Value: Boolean);
  protected
  public
   constructor Create( AComponent:TComponent ); override;
   procedure ApplyList;
   procedure ClearMarkers;
   function GetFieldSizes: Variant; // array of integer
   function GetMarksArray: Variant;
   procedure AddRulerMarker(AValue: Integer);
   procedure SetMarksArray( const AArray: array of Integer );
   procedure RefreshDisplay;
  published
   property AllowAddMarker: Boolean read FAllowAddMarker write FAllowAddMarker;
   property AllowDeleteMarker: Boolean read FAllowDeleteMarker write FAllowDeleteMarker;
   property AllowMoveMarker: Boolean read FAllowMoveMarker write FAllowMoveMarker;
   property Lines: TStringList read FLines write SetLines;
   property ShowRuler: Boolean read FShowRuler write SetShowRuler;
   property ShowMarkers: Boolean read FShowMarkers write SetShowMarkers;
   property RightBorder: Integer read GetRightBorder;
   property RulerMarkerList: TRulerMarkerList read GetRulerMarkerList;
   property MaxLines: Integer read FMaxLines write FMaxLines;
   property Modified: Boolean read FModified write FModified;
  end;

  { TFieldListItem }
  TRulerMarkerItem = class(TCollectionItem)
  private
    { Private declarations }
    FPosition: Integer;
    FMarker: TRulerMarker;
    procedure SetVisible(const Value: Boolean);
    function GetVisible: Boolean;
  public
    { Public declarations }
    constructor Create(Collection: TRulerMarkerList);
    destructor Destroy; override;
  published
    { Published declarations }
    property Position: Integer read FPosition write FPosition;
    property Marker: TRulerMarker read FMarker write FMarker;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  { TRulerMarkerList }
  TRulerMarkerList = class(TCollection)
  private
    { Private declarations }
    function GetItems(Index: Integer): TRulerMarkerItem;
    procedure SetItems(Index: Integer; const Value: TRulerMarkerItem);
  public
    { Public declarations }
    constructor Create;
    function Add(AMarker: TRulerMarker; APosition: Integer): TRulerMarkerItem; virtual;
    function Find(const APosition: Integer): TRulerMarkerItem;
    function IndexOf(APosition: Integer): Integer;
    function IndexOfMarker(const AMarker: TRulerMarker): Integer;
    property Items[Index: Integer]: TRulerMarkerItem read GetItems write SetItems; default;
  published
    { Published declarations }
  end;


  { TRuler }
  TRuler = class(TCustomControl)
    procedure RulerMarkerDblClick(Sender: TObject);
    procedure RulerMarkerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure RulerMarkerMouseUp(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
   private
    FSpace: Integer;
    TickMarks: array of Integer;
    FRulerMarkerList: TRulerMarkerList;
    procedure SetSpace(const Value: Integer);
    procedure GetSpacesList;
    procedure BuildMarks;
    procedure GetMarkerCoord( X: Integer; var AAbsolute, ARelative, ACharPos: Integer );
    procedure SetMarkerVisibleByValue( const X: Integer );
    function Nearest( X: Integer; var ACharPos: Integer ): Integer;
    function GetAbsolutePosition( ACharPos: Integer ): Integer;
    function MarkerValueExists( const X: Integer ): Boolean;
    function GetUniqueMarkerName( AParent: TWinControl; const X: Integer ): String;
   protected
   public
    constructor Create( AOwner: TComponent ); override;
    procedure RefreshDisplay;
    function AddMarker( AParent: TWinControl; X: Integer; AHeight: Integer ): TRulerMarker;
    procedure DeleteMarker( ARulerMark: TRulerMarker );
    procedure ClearMarkers;
   published
    procedure Paint; Override;
    property SpaceBetweenMarks: Integer read FSpace write SetSpace;
    property RulerMarkerList: TRulerMarkerList read FRulerMarkerList write FRulerMarkerList;
    property Font;
    property Hint;
    property Left;
    property ShowHint;
    property Visible;
    property OnClick;
    property OnMouseDown;
    property OnMouseUp;
    property Height;
    property Width;
  end;

  { TRulerMarker }
  TRulerMarker = class(TShape)
   private
    AbsolutePosition: Integer;
    CharacterPosition: Integer;
   public
    constructor Create( AOwner: TComponent ); override;
end;

implementation

uses
  IQMS.Common.FileUtils,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs,
  IQMS.DBTrans.dbtrscstr;


procedure GetSchemaFileName( const ATextFileName: String; var ASchemaFileName: String );
begin
  // Returns full path and file name of the schema file
  ASchemaFileName := StrBeforeDot( ATextFileName ) + '.sch';
end;

{ TSchemaField }

constructor TSchemaField.Create(AFieldName: String; AFieldSize: Integer );
begin
  inherited Create;
  FieldName := AFieldName;
  FieldSize := AFieldSize;
  FieldType := 'CHAR';
end;

{ TSchemaFieldList }

function TSchemaFieldList.AddField(AFieldName: String;
  AFieldSize: Integer): TSchemaField;
begin
  Result := TSchemaField.Create( AFieldName, AFieldSize );
  Add(Result);
end;

function TSchemaFieldList.FieldNameOf(AIndex: Integer): String;
begin
  if ( AIndex > 0 ) and ( AIndex <= ( Count - 1 )) then
     Result := TSchemaField( Items[AIndex] ).FieldName
  else Result := '';
end;

function TSchemaFieldList.FieldOffsetOf(AIndex: Integer): Integer;
begin
  if ( AIndex > 0 ) and ( AIndex <= ( Count - 1 )) then
     Result := TSchemaField( Items[AIndex] ).FieldOffset
  else Result := 0;
end;

function TSchemaFieldList.FieldSizeOf(AIndex: Integer): Integer;
begin
  if ( AIndex > 0 ) and ( AIndex <= ( Count - 1 )) then
     Result := TSchemaField( Items[AIndex] ).FieldSize
  else Result := 0;
end;

function TSchemaFieldList.FieldTypeOf(AIndex: Integer): String;
begin
  if ( AIndex > 0 ) and ( AIndex <= ( Count - 1 )) then
     Result := TSchemaField( Items[AIndex] ).FieldType
  else Result := '';
end;

function TSchemaFieldList.FindFieldName(AName: String): Integer;
var i: Integer;
begin
  Result := -1; // default
  for i := 0 to Count - 1 do
   if ( AName = TSchemaField( Items[i] ).FieldName ) then
      begin
        Result := i;
        BREAK;
      end;
end;

function TSchemaFieldList.FindFieldOffset(AOffset: Integer): Integer;
var i: Integer;
begin
  Result := -1; // default
  for i := 0 to Count - 1 do
   if ( AOffset = TSchemaField( Items[i] ).FieldOffset ) then
      begin
        Result := i;
        BREAK;
      end;
end;

procedure TSchemaFieldList.GetSchemaDefinition(var AList: TStringList);
var i, iCurSize, iPrevSize: Integer;
begin
  if ( AList = NIL ) then Exit;
  iPrevSize := 0;
  for i := 0 to Count - 1 do
    begin
      iCurSize := TSchemaField( Items[i] ).FieldSize;
      TSchemaField( Items[i] ).FieldOffset := iPrevSize;
      AList.Add( Format( 'Field%d = %s,%s,%d,0,%d',
                         [i+1, TSchemaField( Items[i] ).FieldName,
                          UpperCase( TSchemaField( Items[i] ).FieldType ),
                          iCurSize,  iPrevSize ] ) );
      iPrevSize := iCurSize + iPrevSize;  // get next offset
    end;
end;

{ TRulerMarkerList }

constructor TRulerMarkerList.Create;
begin
  inherited Create(TRulerMarkerItem);
end;

function TRulerMarkerList.Add(AMarker: TRulerMarker;
 APosition: Integer): TRulerMarkerItem;
begin
  Result := TRulerMarkerItem(inherited Add);
  Result.Position := APosition;
  Result.Marker := AMarker;
end;

function TRulerMarkerList.Find(const APosition: Integer): TRulerMarkerItem;
var
   i: Integer;
begin
  Result := NIL;
  i := IndexOf(APosition);
  if i > -1 then
     Result := Items[i];
end;

function TRulerMarkerList.IndexOf(APosition: Integer): Integer;
var
   i: Integer;
begin
  Result := -1; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (TRulerMarkerItem(Items[i]).Position = APosition) then
      begin
        Result := i;
        Break;
      end;
end;

function TRulerMarkerList.IndexOfMarker(
  const AMarker: TRulerMarker): Integer;
var
   i: Integer;
begin
  Result := -1; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if Assigned(TRulerMarkerItem(Items[i]).Marker) and
     (TRulerMarkerItem(Items[i]).Marker = AMarker) then
      begin
        Result := i;
        Break;
      end;
end;

function TRulerMarkerList.GetItems(Index: Integer): TRulerMarkerItem;
begin
  Result := TRulerMarkerItem(inherited Items[Index]);
end;

procedure TRulerMarkerList.SetItems(Index: Integer;
  const Value: TRulerMarkerItem);
begin
  inherited Items[Index] := Value;
end;

{ TRulerMarkerItem }

constructor TRulerMarkerItem.Create(Collection: TRulerMarkerList);
begin
  inherited Create(Collection);
end;

destructor TRulerMarkerItem.Destroy;
begin
  inherited Destroy;
end;

function TRulerMarkerItem.GetVisible: Boolean;
begin
  Result := False;
  if Assigned(FMarker) then
     Result := FMarker.Visible;
end;

procedure TRulerMarkerItem.SetVisible(const Value: Boolean);
begin
  if Assigned(FMarker) then
     FMarker.Visible := Value;
end;

{ TDBSchema }

constructor TDBSchema.Create(AOwner: TComponent);
begin
  FHasFieldNames   := FALSE;
  FDelimiter       := '"';
  FSeparator       := ',';
  FSchemaType      := stDelimited;
  inherited Create( AOwner );
  FSchemaFileLines := TStringList.Create;
  SchemaFieldList  := TSchemaFieldList.Create;
end;

destructor TDBSchema.Destroy;
begin
  if Assigned( FSchemaFileLines ) then FreeAndNil( FSchemaFileLines );
  inherited Destroy;
end;

procedure TDBSchema.Estimate;
begin
  // Ensure schema file list created and cleared
  if not Assigned( FSchemaFileLines ) then FSchemaFileLines := TStringList.Create;
  FSchemaFileLines.Clear;

  // Set schema file name
  GetSchemaFileName( FTextFileName, FSchemaFileName ); // iqschema

  // Get the schema file header lines
  GetSchemaHeader( FSchemaType, FTextFileName, FDelimiter, FSeparator, FSchemaFileLines ); // iqschema

  // Get schema fields
  if ( SchemaFieldList.Count > 0 ) then
     SchemaFieldList.GetSchemaDefinition( FSchemaFileLines )
  else EstimateSchemaFieldList;

end;

procedure TDBSchema.Execute;
begin
  // Use this routine to execute and create the schema file
  Estimate; // get configuration
  // Delete the old schema file
  if FileExists( FSchemaFileName ) then DeleteFile( FSchemaFileName ); // delete the old schema file
  // Create the schema file
  FSchemaFileLines.SaveToFile( FSchemaFileName );
end;

procedure TDBSchema.GetSchemaHeader( const ASchemaType: TSchemaType;
   const AFileName, ADelimiter, ASeparator: String; var AList: TStringList );
begin
  // Returns AList, filled with header for schema file.
  if ( AList = NIL ) then Exit;
  // File name
  AList.Clear;
  AList.Add( '['+ UpperCase( StrBeforeDot( ExtractFileName( AFileName ))) + ']'  );
  case ASchemaType of
    stDelimited:
      begin
        // Add the basic information for any delimited file...
        // File info
        AList.Add( 'FILETYPE = VARYING' );
        AList.Add( 'CHARSET = ascii' );
        // Text Delimiter:  What identifies text (i.e., " ' )?
        AList.Add( 'DELIMITER = ' + FixStr( ADelimiter ) );
        // Separator:  What separates the fields? (i.e., #9,;'| )
        AList.Add( 'SEPARATOR = ' + ASeparator );
        // Extra line
        AList.Add( '' );
      end;
    stFixed:
      begin
        AList.Add( 'FILETYPE = FIXED' );
        AList.Add( 'CHARSET = ascii' );
        AList.Add( '' ); // Extra line
      end;
  end;
end;

function TDBSchema.EstimateSchemaFieldList: Boolean;
   // --------------------------------------------------------------------------
   procedure _CreateFieldList( AFieldCount: Integer; var AList: TStringList );
   var i: Integer;
   begin
     if ( AList = NIL ) then Exit;
     AList.Clear;
     for i := 1 to AFieldCount do
       AList.Add( Format( 'FIELD%d', [i] ));
   end;
   // --------------------------------------------------------------------------
   procedure _RoundUpToFive( var ASize: Integer );
   var
      x, AResult: Integer;
   begin
     // only work with positive values
     if ASize <= 0 then ASize := 0;
     // round down to the nearest 5
     x := (ASize div 5) * 5;
     // if the original number equals the nearest 5, then just pass it "as is"
     if x = ASize then AResult := ASize
     // otherwise add 5 to the rounded 5 value so that we "round up"
     else AResult := x + 5;
     // pass back the result
     ASize := AResult;
   end;
   // --------------------------------------------------------------------------
var
   i, ACurrent_Offset, ASpaces_Counted, AFieldSize, ATemp: Integer;
   AFieldNames, ASampleLines: TStringList; // temp holder for field text (delimited only)
   ASampleLine: String; // sample line of text from the text file
   ASampleText, AFieldName: String; // temp holders for sample text and field name

   ATextColInfo: TTextFieldArray;

begin
  // NOTE:  This method scans the file and "guesses" at the schema configuration.
  //        We only arrive at an estimate here.
  //        It is more accurate for delimited files, than fixed files.  Fixed
  //        files demand user attention.

  if ( FSchemaFileLines = NIL ) then Exit;
  begin
    if FSchemaType = stDelimited then
       begin
         // Separator is required for delimited text files
         Result := ( FSeparator > '' );
         if not Result then Exit;
       end;

    GetTextFileColInfo(FTextFileName, FSchemaType, FSeparator {Separator},
      FDelimiter {Delimiter}, ATextColInfo, FHasFieldNames);

    // 06/27/2006
    if High(ATextColInfo) + 1 > 50 then
       IQWarning(IQMS.DBTrans.dbtrscstr.cTXT0000141); // 'Data file has more than 50 fields, which exceeds the recommended limit.';

    // Now, using on sample text and the field names, build a list of
    // fields with sizes and data types
    SchemaFieldList.Clear;
    for i := Low(ATextColInfo) to High(ATextColInfo) do
        SchemaFieldList.AddField(ATextColInfo[i].FieldName,
           ATextColInfo[i].FieldSize );

    // Add field definition to the schema file
    SchemaFieldList.GetSchemaDefinition( FSchemaFileLines );

  end;
end;

procedure TDBSchema.GetTextFileColInfo(const AFileName: String;
 const ASchemaType: TSchemaType; const ASeparator: String;
 const ADelimiter: String; var ATextColInfo: TTextFieldArray;
 AFirstRowHasFieldNames: Boolean);
const
   MAX_SEARCH_ROWS = 5000;
var
   slFileLines,slTemp: TStringList;
   i,j,L1,L2: Integer;
   ColNameArray: array of String;
   ColLengthArray: array of Integer;
   ColTypeArray: array of Integer;

   // --------------------------------------------------------------------------
   function _DelimitedParseToList(AText: String; var AList: TStringList): Boolean;
   var
      I, ALen : Integer;
      S, F    : String;
      X, Y, Z : Integer;
   begin
     if (AList = NIL) then Exit;
     // Initialization
     AList.Clear; X := 0; Y := 1;
     // Prepare variables to be used
     if RightStr(Trim(AText), 1) <> ASeparator then
        AText := AText + ASeparator;
     ALen := Length(AText);

     // Check each character in the AText string.  Find text between delimiters
     for I := 0 to (ALen) do
      begin
        S := Copy(AText, I, 1);
        if S = ASeparator then
           begin
             Z := I;
             Y := Z - X;
             F := Copy(AText, X, Y); // Get the text between start and end
             F := StrTran(F, ASeparator, '');
             X := I + 1;  // Reset the new startpos
             AList.Add(F);
           end;
      end;
   end;
   // --------------------------------------------------------------------------
   function _FixedParseToList(AText: String; var AList: TStringList): Boolean;
   var
      ACurrent_Offset, ASpaces_Counted, I: Integer;
      AValue: String;
   begin
     AList.Clear;
     ACurrent_Offset := 1; // initialize to 1
     ASpaces_Counted := 0; // initialize to 0

     if Trim( AText ) = '' then Exit;

     // Now, we estimate the field sizes and spacing
     // NOTE:  This is just an estimate.  There is no reliable way aside
     //        from human intervention to determine how a fixed ASCII file
     //        is to be separated.
     for i := 1 to Length(AText) do
      begin
        // last character? Add the rest and we're done
        if ( i >= Length(AText)) then
           AList.Add( Copy( AText, ACurrent_Offset, i ))
        // set the count of spaces = 1
        else if ( AText[i] = #0 ) and ( ASpaces_Counted = 0 ) and ( ACurrent_Offset <= 1 ) then
           ASpaces_Counted := 1
        // increment the count of spaces
        else if ( AText[i] = #32 ) then
           ASpaces_Counted := ASpaces_Counted + 1 // How many consecutive spaces have we encountered?
        // add the next block of text
        // 2 spaces is our best guess, but it can vary between fields
        else if ( AText[i] <> #32 ) and ( ASpaces_Counted >= 2 ) then
           begin
             AValue := Copy(AText, ACurrent_Offset, i - ACurrent_Offset);
             AList.Add(AValue);
             // set values
             ASpaces_Counted := 0;
             ACurrent_Offset := i;
           end;
      end;
   end;
   // --------------------------------------------------------------------------
   procedure _AddColName(AIndex: Integer; // zero-based
                        AName: String);
   var
      curVal: String;
   begin
     if AIndex > High(ColNameArray) then
        SetLength(ColNameArray, AIndex+1);
     if ColNameArray[AIndex] = '' then
        begin
          if AFirstRowHasFieldNames then
             ColNameArray[AIndex] := Trim(AName)
          else
             ColNameArray[AIndex] := Format('FIELD%d',[AIndex+1]);
        end;

     // trim any delimiters on the field names
     if ADelimiter > '' then
        ColNameArray[AIndex] := IQMS.Common.StringUtils.StrTran(ColNameArray[AIndex],ADelimiter,'');
   end;

   // --------------------------------------------------------------------------
   procedure _SetArrayLengths(const ALength: Integer);
   begin
     SetLength(ColNameArray,   ALength);
     SetLength(ColLengthArray, ALength);
     SetLength(ColTypeArray,   ALength);
   end;

   // --------------------------------------------------------------------------
   procedure _AddColLength(AIndex: Integer; // zero-based
                          ALength: Integer);
   var
      curVal: Integer;
   begin
     if AIndex > High(ColLengthArray) then
        SetLength(ColLengthArray, AIndex+1);
     curVal := ColLengthArray[AIndex];
     ColLengthArray[AIndex] := Max(curVal,ALength);
   end;

   // --------------------------------------------------------------------------
   procedure _AddColType(AIndex: Integer; // zero-based
                        AText: String);
   var
      curVal: Integer;
      curType: TFieldType;
      RValue: Extended;
      IValue: Integer;
      S: String;
   begin
     if AIndex > High(ColTypeArray) then
        SetLength(ColTypeArray, AIndex+1);
     // current value
     curVal := ColTypeArray[AIndex];
     curType := TFieldType(curVal);
     S := Trim(AText); // trim the text

     // if the delimiter exists in the text, then we know for sure it's
     // a string; exit early if found.
     if (ASchemaType = stDelimited) and (ADelimiter > '') and
        (Pos(ADelimiter,S) > 0) then
        begin
          ColTypeArray[AIndex] := Ord(ftString);
          Exit;
        end;

     // if the current value is unknown or is a number, then check for text
     if (curType in [ftUnknown, ftInteger, ftFloat]) then
        begin
          // is this a float
          if TryStrToFloat(S, RValue) then
             ColTypeArray[AIndex] := Ord(ftFloat)
          else
             ColTypeArray[AIndex] := Ord(ftString);

          // is this an integer
          if TryStrToInt(S, IValue) then
             ColTypeArray[AIndex] := Ord(ftInteger)
          else
             ColTypeArray[AIndex] := Ord(ftString);
        end
     else
        ColTypeArray[AIndex] := Ord(ftString);
   end;

   // --------------------------------------------------------------------------
   function _CheckArraySizes: Boolean;
   var
      i: Integer;
   begin
     i := High(ColNameArray);
     Result := (High(ColLengthArray) = i) and (High(ColTypeArray) = i);
   end;
   // --------------------------------------------------------------------------
   {function _RoundUpToFive(const ASize: Integer): Integer;
   var
      x, tmp, AResult: Integer;
   begin
     // only work with positive values
     tmp := ASize;
     if tmp <= 0 then tmp := 5;
     Result := tmp;

     // round down to the nearest 5
     x := (tmp div 5) * 5;
     // if the original number equals the nearest 5, then just pass it "as is"
     if x = tmp then Result := tmp
     // otherwise add 5 to the rounded 5 value so that we "round up"
     else Result := x + 5;
   end;}
   // --------------------------------------------------------------------------
   function _NearestFifty(const ASize: Integer): Integer;
   var
      x, tmp, AResult: Integer;
   begin
     // only work with positive values
     tmp := ASize;
     if tmp <= 0 then tmp := 50;
     Result := tmp;

     // round down to the nearest 5
     x := (tmp div 50) * 50;
     // if the original number equals the nearest 5, then just pass it "as is"
     if x = tmp then Result := tmp
     // otherwise add 5 to the rounded 5 value so that we "round up"
     else Result := x + 50;
   end;
   // --------------------------------------------------------------------------
begin

  if not FileExists(AFileName) then
     raise Exception.CreateFmt('Cannot find file, %s.',[AFileName]);

  if (ASchemaType = stDelimited) and (ASeparator = '') then
     raise Exception.Create('Please specify a field separator.');

  try
     slTemp := TStringList.Create;
     slFileLines := TStringList.Create;
     slFileLines.LoadFromFile(AFileName);

     for i := 0 to slFileLines.Count - 1 do
      begin
        // Exit early after exceeding the maximum number of rows to search;
        // we do this for speed. By the time we reach the "max search rows"
        // value, we should have all the data we need.
        if i >= MAX_SEARCH_ROWS then
           BREAK;

        // Convert a file line to a string list of field values.  Uses the
        // field separator passed to this method.
        case ASchemaType of
         stDelimited: _DelimitedParseToList(slFileLines.Strings[i],slTemp);
         stFixed: _FixedParseToList(slFileLines.Strings[i],slTemp);
        end;
        
        // It is possible that the delimiter used in this text file
        // was also used in a field value.  If that is the case, then
        // we will not be able to read the line accurately.  So, just
        // skip it.
        if (High(ColNameArray)+1 > 0 ) and (slTemp.Count <> High(ColNameArray)+1) then
           CONTINUE;

        for j := 0 to slTemp.Count - 1 do
         begin
           if i = 0 then
              begin
                _AddColName(j,slTemp.Strings[j]);
                _SetArrayLengths(High(ColNameArray)+1);
              end;
           if (i > 0) or not AFirstRowHasFieldNames then
              begin
                _AddColLength(j,Length(slTemp.Strings[j]));
                _AddColType(j,slTemp.Strings[j]);
              end;
         end;
      end;

     if not _CheckArraySizes then //Exit;
        raise Exception.Create('Application Error: Could not match fields with data.');

     SetLength(ATextColInfo, High(ColLengthArray)+1);
     for i := Low(ColLengthArray) to High(ColLengthArray) do
      begin
        ATextColInfo[i].FieldName := ColNameArray[i];
        ATextColInfo[i].FieldType := TFieldType(ColTypeArray[i]);
        ATextColInfo[i].FieldSize := _NearestFifty(ColLengthArray[i]);
      end;

  finally
     FreeAndNil(slFileLines);
     FreeAndNil(slTemp);
  end;

end;

(*function TDBSchema.ParseToList( ALineIN, ASeparator: String;
   var AList: TStringList ): Boolean;
var
   I, ALen : Integer;
   S, F    : String;
   X, Y, Z : Integer;
begin
  if ( AList = NIL ) then Exit;
  // Initialization
  AList.Clear;
  X := 0;
  Y := 1;
  // Prepare variables to be used
  if RightStr( Trim( ALineIN ), 1 ) <> ASeparator then ALineIN := ALineIN + ASeparator;
  ALen := Length( ALineIN );

  // Check each character in the ALineIN string.  Find text between delimiters
  for I := 0 to ( ALen  ) do
   begin
     S := Copy( ALineIN, I, 1 );
     if S = ASeparator then
        begin
          Z := I;
          Y := Z - X;
          F := Copy( ALineIN, X, Y ); // Get the text between start and end
          F := StrTran( F, ASeparator, '' );
          X := I + 1;  // Reset the new startpos
          AList.Add( F );
        end;
   end;
end;*)

procedure TDBSchema.SuggestParams;
var
   S: String;
begin
  SchemaType := stDelimited; // initial
  Separator := ','; // default
  Delimiter := '"'; // default
  try
     if ( TextFileName > '' ) and ( UpperCase( ExtractFileExt( TextFileName )) = '.CSV' ) then
        begin
          Separator := ',';
          Delimiter := ''; // Genuine CSV files do not have a text delimiter
        end
     else if FileExists( TextFileName ) then
        begin
          // Get the first line of text
          S := ReadLine( TextFileName, 0 );
          if S = '' then Exit;

          // Delimiter
          if Pos( '"', S ) > 0 then Delimiter := '"'
          else if Pos( '''', S ) > 0 then Delimiter := ''''
          else Delimiter := '';

          // Separator
          if Pos( #9, S ) > 0 then Separator := #9
          else if Pos( ',', S ) > 0 then Separator := ','
          else if Pos( ';', S ) > 0 then Separator := ';'
          else if Pos( '|', S ) > 0 then Separator := '|'
          else SchemaType := stFixed;

          // NOTE:  The fields in a delimited text file will not be
          //        separated by a space character.  The space character
          //        is a sign that the file contains "fixed width" fields.
        end;
  except // intentional suppress
  end;
end;

function TDBSchema.ReadLine(AFileName: String; ALine: Integer): String;
var S: String; ALines: TStringList;
begin
  try
     ALines:= TStringList.Create;
     ALines.LoadFromFile( AFileName );
     Result := ALines.Strings[ALine];
  finally
     if Assigned( ALines ) then FreeAndNil( ALines );
  end;
end;

function TDBSchema.LoadSchemaFile(AFileName: String): Boolean;
var
   ALines, AList: TStringList;
   AFile: TIniFile;
   ASectionName,
   AFieldEntry,
   AText: String;
   AItem: TSchemaField;
   AOffSet,
   i: Integer;
   ALoop: Boolean;

   // field elements
   AFieldName: String;
   AFieldSize: Integer;

   procedure _ParseFieldElement(ALineIn: String);
   begin
     AFieldName := IQMS.Common.StringUtils.GetToken(ALineIn, ',', 1);
     if not IQMS.Common.Numbers.IsStringValidInteger(IQMS.Common.StringUtils.GetToken(ALineIn, ',', 3), AFieldSize) then
        AFieldSize := 10;
     if not IQMS.Common.Numbers.IsStringValidInteger(IQMS.Common.StringUtils.GetToken(ALineIn, ',', 5), AOffSet) then
        AOffSet := 0;
   end;

begin
  // Load schema settings from a schema file
  Result := False;

  if not FileExists(AFileName) then Exit;

  ASectionName := UpperCase(Trim(IQMS.Common.FileUtils.FileNameNoExt(AFileName)));

  AFile := TIniFile.Create(AFileName);

  if Assigned(AFile) then
  try
    // Schema type
    AText := UpperCase(Trim(AFile.ReadString(ASectionName, 'FILETYPE' {Key Name}, 'VARYING' {Default Value})));
    if AText = 'FIXED' then FSchemaType := stFixed else FSchemaType := stDelimited;

    // Delimiter
    FDelimiter := Trim(AFile.ReadString(ASectionName, 'DELIMITER' {Key Name} , '"' {Default Value}));

    // Separator
    FSeparator := Trim(AFile.ReadString(ASectionName, 'SEPARATOR' {Key Name} , ',' {Default Value}));

    SchemaFieldList.Clear;
    i := 1;
    ALoop := True;
    repeat

      AFieldEntry := Format('FIELD%d',[i]);

      if not AFile.ValueExists(ASectionName, AFieldEntry) then
         BREAK;

      AText := UpperCase(Trim(AFile.ReadString(ASectionName, AFieldEntry {Key Name}, '' {Default Value})));
      if AText = '' then
         BREAK;

      // Ex: FIELD2,CHAR,20,0,10
      _ParseFieldElement(AText);
      AItem := SchemaFieldList.AddField( AFieldName, AFieldSize );

      // add the offset
      if (FSchemaType = stFixed) and Assigned(AItem) then
         AItem.FieldOffset := AOffSet;

      Inc(i);

      if (i > 50) or (AFieldName = '') or (AText = '') then
         ALoop := False;

    until ALoop = False;

    Result := True;
    
  finally
    FreeAndNil(AFile);
  end;
end;

{ TRulerMarker }

constructor TRulerMarker.Create(AOwner: TComponent );
begin
  inherited Create( AOwner );
  Width := 1;
  Height := 140;
  Visible := True;
end;

{ TRuler }

constructor TRuler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height := 26;
  Width  := 50;
  Font.Name := 'Fixedsys';
  Font.Size := 9;
  Font.Color:= clBlack;
  FSpace := 8;
  Visible := TRUE;
  FRulerMarkerList := TRulerMarkerList.Create;
  SetLength( TickMarks, 0 ); // initialize
end;

procedure TRuler.GetSpacesList;
var i, x, ALength: Integer;
begin
  x := SpaceBetweenMarks;
  ALength := Trunc( Width / x );
  SetLength( TickMarks, 0 );
  SetLength( TickMarks, ALength );
  for i := 0 to ALength - 1 do
    TickMarks[i] := i * x;
end;

procedure TRuler.Paint;
begin
  inherited Paint;
  BuildMarks;
end;

procedure TRuler.RefreshDisplay;
begin
  // A full recalculate and refresh
  GetSpacesList;
  BuildMarks;
  Invalidate;
end;

procedure TRuler.BuildMarks;
  // ---------------------------------------------------------------------------
  function _isTen( R: Real ): Boolean;
  var D: Double;
  begin
    Result := FALSE;
    try
       D := Frac( R / 10 );
       Result := ( D = 0 );
    except
    end;
  end;
  // ---------------------------------------------------------------------------
var
   i, x, l, ACapLeft: Integer;
   S: String;
begin
  Canvas.Brush.Color := clBtnFace;

  for i := Low(TickMarks) to High(TickMarks) do
   begin
     x := TickMarks[i];
     if _isTen(x) then
        begin
          Canvas.Pen.Color := clBlack;
          Canvas.MoveTo( x, 14 );
          Canvas.LineTo( x, 20 );
          if _isTen(i) then
            begin
              S := IntToStr(i);
              if i = 0 then ACapLeft := x
              else
                 begin
                   l := Canvas.TextWidth(S) + Length(S);
                   ACapLeft := x - Trunc( l / 2 );
                 end;
              Canvas.TextOut( ACapLeft, 0, S);
            end;
        end
     else
        begin
          Canvas.Pen.Color := clBtnShadow;
          Canvas.MoveTo( x, 14 );
          Canvas.LineTo( x, 18 );
        end;
   end;
end;

procedure TRuler.SetSpace(const Value: Integer);
begin
  FSpace := Value;
  RefreshDisplay;
end;

function TRuler.Nearest(X: Integer; var ACharPos: Integer ): Integer;
var
   i: Integer;
   APrevious, ANext: Integer;
begin
  APrevious := 0; // initialization
  ANext     := 0;
  ACharPos  := 0;

  for i := Low(TickMarks) to High(TickMarks) do
   begin
     if X = TickMarks[i] then
        begin
          Result := X;
          ACharPos:=i;
          BREAK;
        end;
     if TickMarks[i] > X then
        begin
          ANext  := TickMarks[i];
          // Get the closest mark
          if ( ANext - X ) < ( X - APrevious ) then
            begin
              Result := ANext;
              ACharPos := i;
            end
          else
            begin
              Result := APrevious;
              ACharPos := i-1;
            end;

          BREAK;
        end;
     APrevious := TickMarks[i];
   end;
end;

procedure TRuler.GetMarkerCoord(X: Integer; var AAbsolute,
  ARelative, ACharPos: Integer);
var
   AScrollBarPos: Integer;
begin
  // Get the position of the scroll bar if it has been scrolled
  AScrollBarPos := Round( TFixedText( Owner ).FScrollBox.HorzScrollBar.Position );
  if ( AScrollBarPos < 0 ) then AScrollBarPos := 0;

  // Get the screen position of the ruler marker line
  // The absolute position is the true position of the marker
  // We must subtract the scrolled position from the absolute position
  // to get the screen position.
  AAbsolute  := Nearest( X, ACharPos );
  ARelative  := AAbsolute - AScrollBarPos; // must compensate for the scroll bar
end;

function TRuler.AddMarker( AParent: TWinControl; X: Integer; AHeight: Integer ): TRulerMarker;
var
   ARelative, AAbsolute, ACharPos: Integer;
   AName: String;
begin
  if ( AParent = NIL ) or ( AHeight = 0 )  or ( X < 0 ) then Exit;
  if not Assigned( FRulerMarkerList ) then
     FRulerMarkerList := TRulerMarkerList.Create;

  Result := NIL; // initial
  GetMarkerCoord( X, AAbsolute, ARelative, ACharPos );
  if ARelative < 0 then Exit;
  AName := GetUniqueMarkerName( AParent, AAbsolute);

  // Check list for existing value
  if MarkerValueExists(AAbsolute) then
     begin
       // Value exists, so set visible = TRUE
       SetMarkerVisibleByValue(AAbsolute);
       Exit;
     end;

  // Create the new ruler marker
  Result := TRulerMarker.Create(AParent);
  with Result do
   begin
     Parent     := AParent;
     Name       := AName;
     Top        := 0;
     Height     := AParent.Height;
     Anchors    := [akLeft,akTop,akBottom];
     AbsolutePosition := AAbsolute;
     CharacterPosition:= ACharPos;
     Left       := ARelative;
     ShowHint   := TRUE;
     Hint       := Format( '%d', [ACharPos] );
     Visible    := TRUE;
     OnDblClick := RulerMarkerDblClick;
     OnMouseMove:= RulerMarkerMouseMove;
     OnMouseUp  := RulerMarkerMouseUp;
   end;

  FRulerMarkerList.Add(Result, ACharPos);

  TFixedText( Owner ).FModified := TRUE;

end;

procedure TRuler.DeleteMarker(ARulerMark: TRulerMarker);
var
   i: Integer;
begin
  if ( ARulerMark = NIL ) or not Assigned( RulerMarkerList ) then Exit;

  Application.ProcessMessages;

  try
     i := RulerMarkerList.IndexOfMarker( ARulerMark );
     if ( i > -1 ) then
        RulerMarkerList.Items[i].Visible := FALSE;
     TFixedText( Owner ).FModified := TRUE;
  except
  end;
end;

procedure TRuler.ClearMarkers;
var
   i: Integer;
begin
  for i := RulerMarkerList.Count - 1 downto 0 do
      begin
        RulerMarkerList.Items[i].Marker.Free;
        RulerMarkerList.Items[i].Marker := NIL;
      end;
  RulerMarkerList.Clear;
  TFixedText( Owner ).FModified := TRUE;
end;

procedure TRuler.RulerMarkerDblClick(Sender: TObject);
begin
  if TComponent(Owner) is TFixedText then
     with TFixedText(Owner) do
        if not AllowDeleteMarker or not ShowRuler then Exit;
        
  if TComponent( Sender ) is TRulerMarker then
     DeleteMarker(( TComponent( Sender ) as TRulerMarker ));
end;

procedure TRuler.RulerMarkerMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
   ARulerMarker: TRulerMarker;
   APoint: TPoint;
   AAbsolute, ARelative, ACharPos: Integer;
   i: Integer;
begin
  if not ( TComponent( Sender ) is TRulerMarker ) then Exit;
  ARulerMarker := ( TComponent( Sender ) as TRulerMarker );

  if TComponent(Owner) is TFixedText then
     with TFixedText(Owner) do
        if not AllowMoveMarker or not ShowRuler then Exit;

  GetCursorPos(APoint);
  APoint := ScreenToClient(APoint);

  if ( ssLeft in Shift ) then
     begin
       GetMarkerCoord( APoint.x, AAbsolute, ARelative, ACharPos );
       ARulerMarker.Left := ARelative;
       ARulerMarker.AbsolutePosition := AAbsolute;
       ARulerMarker.CharacterPosition:= ACharPos;
       ARulerMarker.Hint             := IntToStr(ACharPos);
       ARulerMarker.Pen.Color := clBlue;
       i := RulerMarkerList.IndexOfMarker(ARulerMarker);
       if i > -1 then
          begin
            RulerMarkerList.Items[i].Position := ACharPos;
            RulerMarkerList.Items[i].Marker := ARulerMarker;
          end;
       TFixedText( Owner ).FModified := TRUE;
     end;
end;

procedure TRuler.RulerMarkerMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
begin
  if not ( TComponent( Sender ) is TRulerMarker ) then Exit;
  ( TComponent( Sender ) as TRulerMarker ).Pen.Color := clBlack;
end;

function TRuler.GetUniqueMarkerName( AParent: TWinControl; const X: Integer): String;
var i: Integer;
begin
  i := 0; // initial
  repeat
    Result := Format( 'RulerMarker%d', [i] );
    Inc( i );
  until ( AParent.FindComponent(Result) = NIL );
end;

function TRuler.MarkerValueExists(const X: Integer): Boolean;
var
   i: Integer;
begin
  Result := RulerMarkerList.IndexOf(X) > -1;
{
  for i := 0 to RulerMarkerList.Count - 1 do
    begin
      Result := TRulerMarker( RulerMarkerList.Items[i] ).AbsolutePosition = X;
      if Result then BREAK;
    end;  }
end;

procedure TRuler.SetMarkerVisibleByValue(const X: Integer);
var
   i: Integer;
begin
  i := RulerMarkerList.IndexOf(X);
  if i > -1 then
     RulerMarkerList.Items[i].Visible  := True;
{
  for i := 0 to RulerMarkerList.Count - 1 do
   begin
     if RulerMarkerList.Items[i].Position = X then
        begin
          RulerMarkerList.Items[i].Marker.Visible  := True;
          Break;
        end; }
{     if TRulerMarker( RulerMarkerList.Items[i] ).AbsolutePosition = X then
        begin
          TRulerMarker( RulerMarkerList.Items[i] ).Visible := TRUE;
          BREAK;
        end;
   end; }
end;

function TRuler.GetAbsolutePosition(ACharPos: Integer): Integer;
var
   ADummy: Integer;
begin
     Result := Nearest( ACharPos * SpaceBetweenMarks, ADummy );
end;

{ TFixedText }

constructor TFixedText.Create(AComponent: TComponent);
const
  cRulerHeight = 22;
  cLineNumbersWidth = 30;
begin
  FShowRuler   := TRUE; // default setting
  FShowMarkers := TRUE;  // default setting
  FMaxLines    := 10;   // default setting

  inherited Create( AComponent );

  ControlStyle := ControlStyle - [csSetCaption];

  BevelInner := bvLowered;
  BevelOuter := bvNone;
  Caption    := '';
  ParentBackground := False;
  Tag := 1999; // IqXpMan.pas
  Color := clWhite;
  
  FLineNumbersPanel:= TPanel.Create(Self);
  with FLineNumbersPanel do
   begin
     Parent     := Self;
     Name       := 'LineNumbersPanel';
     BevelInner := bvNone;
     BevelOuter := bvNone;
     Align      := alLeft;
     Caption    := '';
     Width      := cLineNumbersWidth;
     ParentBackground := False;
     ParentColor := False;
     Tag := 1999; // IqXpMan.pas
   end;

  FLineNumbersSpacer:= TPanel.Create(Self);
  with FLineNumbersSpacer do
   begin
     Parent     := FLineNumbersPanel;
     Name       := 'LineNumbersSpacer';
     BevelInner := bvNone;
     BevelOuter := bvNone;
     Align      := alTop;
     Caption    := '';
     Height     := cRulerHeight + 1;
     ParentBackground := True;
     ParentColor := True;
     Tag := 1999; // IqXpMan.pas
   end;

  FLineNumbers:= TPaintBox.Create(Self);
  with FLineNumbers do
   begin
     Parent := FLineNumbersPanel;
     Name   := 'LineNumbers';
     Align  := alClient;
     Font.Charset := ANSI_CHARSET;
     Font.Color := clWindowText;
     Font.Height := -12;
     Font.Name := 'Fixedsys';
     Font.Style := [];
     ParentFont := False;
     Color := clBtnFace;
   end;

  FScrollBox:= TScrollBox.Create(Self);
  with FScrollBox do
   begin
     Parent := Self;
     Name   := 'ScrollBox';
     BorderStyle:=bsNone;
     Align  := alClient;
     Color  := clWhite;
   end;

  FTextCanvas := TPaintBox.Create(Self);
  with FTextCanvas do
   begin
     Parent := FScrollBox;
     Name   := 'TextCanvas';
     Left   := 0;
     Top    := cRulerHeight + 1;
     Width  := 120;
     Height := 120;
     Font.Charset := ANSI_CHARSET;
     Font.Color := clWindowText;
     Font.Height := -12;
     Font.Name := 'Fixedsys';
     Font.Style := [];
     ParentFont := False;
     Color := clWhite;
   end;

  FLines := TStringList.Create;

  FRuler := TRuler.Create(Self);
  with FRuler do
   begin
     Parent := FScrollBox; // Scroll box
     Name := 'Ruler';
     Left := 0;
     Top  := 0;
     Width := FTextCanvas.Width;
     Height:= cRulerHeight;
     Brush.Color := clBtnFace;
     OnMouseDown := DoRulerMouseDown;
     Visible     := FShowRuler;
   end;
end;

procedure TFixedText.ConfigurePaintBox;
   // --------------------------------------------------------------------------
   function _getLongestLine: Integer;
   var i, AValue: Integer;
   begin
     AValue := 0;
     for i := 0 to FLines.Count - 1 do
         begin
           AValue := Max(AValue, Length(FLines.Strings[i]));
           if i >= 100 then BREAK; //
         end;
     Result := AValue;
   end;
   // --------------------------------------------------------------------------
var AWidth, AHeight: Integer;
begin
  if not Assigned( FLines ) or ( FLines.Count = 0 ) then Exit;

  AWidth := (_getLongestLine + 1) * FRuler.SpaceBetweenMarks;

  FScrollBox.HorzScrollBar.Range := AWidth;

  if ( FMaxLines > 0 ) then AHeight:= FMaxLines * 17
  else AHeight:= FLines.Count * 17;
  
  with FTextCanvas do
    begin
      Width := AWidth;   // set width
      Height:= AHeight;  // default height
      Canvas.Font.Color := clBlack;
      Canvas.Font.Name  := 'Fixedsys';
      Canvas.Font.Size  := 9;
      Canvas.Pen.Color := clBlack;
      OnPaint := DoOnPaint;
    end;

  // ensure large line numbers will display
  FLineNumbersPanel.Width :=  FLineNumbers.Canvas.TextWidth( IntToStr( FLines.Count ) ) + 12;
  FLineNumbers.OnPaint := DoOnPaintLineNumbers;
  Application.ProcessMessages;

end;

procedure TFixedText.PaintLines;
const
  cTab = '  »  '; // '¤'
var i: Integer;
begin
  if ( FLines.Count = 0 ) then Exit;
  for i := 0 to FLines.Count - 1 do
    FTextCanvas.Canvas.TextOut( 0, i * 14, StrTran(FLines.Strings[i], #9, cTab) );
end;

procedure TFixedText.PaintLineNumbers;
var i, l: Integer; S: String;
begin
  if ( FLines.Count = 0 ) then Exit;
  for i := 0 to FLines.Count - 1 do
    begin
      S := IntToStr( i + 1 ); // line number caption
      l := FLineNumbers.ClientWidth - FLineNumbers.Canvas.TextWidth( S ) - 4; // right justify text
      FLineNumbers.Canvas.TextOut( l, i * 14, S ); // line numbers iqstring
    end;
end;

procedure TFixedText.DoRulerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var AHeight: Integer;
begin
    if not FAllowAddMarker or not FShowRuler then Exit;
    AHeight := FTextCanvas.Height;
    if ( TComponent( Sender ) is TRuler ) then
       ( TComponent( Sender ) as TRuler ).AddMarker( FScrollBox, X, AHeight );
end;

procedure TFixedText.DoOnPaint(Sender: TObject);
begin
  PaintLines;
  FRuler.RefreshDisplay;
end;

procedure TFixedText.DoOnPaintLineNumbers(Sender: TObject);
begin
  Application.ProcessMessages; // wait for the form to repaint first
  PaintLineNumbers;
end;

procedure TFixedText.ApplyList;
var
   i: Integer;
   S: String;
   AList: TStringList;
begin
  // This method must be called before the list is applied     
  try
     AList := TStringList.Create;
     if not Assigned( FLines ) then FLines := TStringList.Create;
     AList.AddStrings( FLines );
     FLines.Clear;  // Clear the old list
     
     // Fix the incoming lines
     for i := 0 to AList.Count - 1 do
         begin
              if ( FMaxLines > 0 ) and ( i > FMaxLines ) then BREAK;
              S := AList.Strings[i];
              S := StringReplace( S, #13, '', [rfReplaceAll, rfIgnoreCase] );
              S := StringReplace( S, #10, '', [rfReplaceAll, rfIgnoreCase] );
              FLines.Add(S);
         end;

     // Ensure paint box will display all text
     ConfigurePaintBox;

     // Configure the ruler
     FRuler.Width := FTextCanvas.Width;
     FRuler.RefreshDisplay;
     FRuler.SpaceBetweenMarks := FTextCanvas.Canvas.TextWidth( '_' );
     FRuler.RefreshDisplay;
  finally
     if Assigned( AList ) then FreeAndNil( AList );
  end;
end;

function TFixedText.GetRulerMarkerList: TRulerMarkerList;
begin
  Result := FRuler.RulerMarkerList;
end;

procedure TFixedText.SetLines(const Value: TStringList);
begin
  FLines := Value;
  ApplyList;
end;

function TFixedText.GetFieldSizes: Variant;
var
   i, x, iCur, iPrev, AValue: Integer;
   AResult: array of Integer;
   ASeparators: array of Integer;
begin
  // Returns 0 to the right border, and the marks in between...
  ASeparators  := GetMarksArray; // list of "offset" values

  SetLength( AResult, 0 );
  if not VarIsEmpty(ASeparators) and ( VarArrayDimCount(ASeparators) <> 0 ) then
     begin
       // Apply the separators from the FixedText component to the
       // dbtschma list of separators
       // NOTE:  Since the schema list takes "field sizes," not separators,
       //        we have to "reverse engineer" the values so that we pass
       //        field sizes.
       iPrev := 0;
       x     := 0;
       for i := Low(ASeparators) to High(ASeparators) do
        if ( ASeparators[i] > 0 ) then
           begin
             Inc(x);
             iCur := ASeparators[i];
             AValue := iCur - iPrev;
             SetLength( AResult, x );
             AResult[x-1] := AValue;
             iPrev:=iCur;
           end;

       Result := VarArrayCreate( [0, High(AResult)], varInteger );
       for i := Low(AResult) to High(AResult) do
           Result[i] := AResult[i];
     end;
end;

function TFixedText.GetMarksArray: Variant;
  //============================================================================
  function _repl( S:string; N:integer ):string;
  var i:integer;
  begin
       Result:= '';
       for i:= 1 to N do Result:= Result + S;
  end;
  //============================================================================
  function _PadVal( AInt: Integer ): string;
  const cPadN = 6;
  var S: String;
  begin
       S:= IntToStr(AInt);
       if Length( S ) < cPadN then
          Result:= _repl( '0', cPadN - Length( S )) + S
       else Result:= S;
  end;
  //============================================================================


var
   i, ACounter, AValue: Integer;
   ATemp: TStringList;
   S: String;
begin
  try
     ACounter := 0;
     ATemp:= TStringList.Create;
     ATemp.Sorted := TRUE;

     ATemp.Add( '0' ); // add left border

     for i := 0 to RulerMarkerList.Count - 1 do
       if RulerMarkerList.Items[i].Visible then
          begin
            AValue := RulerMarkerList.Items[i].Marker.CharacterPosition;
            S      := _PadVal( AValue );
            if ( ATemp.IndexOf( S ) = -1 ) then ATemp.Add( S ); //iqstring
          end;
{            if TRulerMarker( RulerMarkerList.Items[i] ).Visible then
               begin
                    AValue := TRulerMarker( RulerMarkerList.Items[i] ).CharacterPosition;
                    S      := _PadVal( AValue );
                    if ( ATemp.IndexOf( S ) = -1 ) then ATemp.Add( S ); //iqstring
               end;
       end;}

     // Add right border
     AValue := RightBorder;
     S := _PadVal( AValue );
     if ( ATemp.IndexOf( S ) = -1 ) then ATemp.Add( S ); //iqstring

     ATemp.Sort;
     Result := VarArrayCreate( [0, ATemp.Count-1], varInteger );

     for i := 0 to ATemp.Count - 1 do
        Result[i] := StrToInt( ATemp.Strings[i] );
  finally
     if Assigned( ATemp ) then FreeAndNil( ATemp );
  end;
end;

procedure TFixedText.SetMarksArray(const AArray: array of Integer);
var
   i, w, AValue, AHeight: Integer;
begin
     FRuler.ClearMarkers;
     w := RightBorder;
     if ( High( AArray ) = 0 ) then Exit;
     if w = 0 then w := High( AArray ) + 1;
     AHeight := FTextCanvas.Height;
     for i := 0 to High( AArray ) do
      begin
         AValue := AArray[i];
         if ( AValue > 0 ) and ( AValue < w ) then
            FRuler.AddMarker( FScrollBox, FRuler.GetAbsolutePosition( AValue ), AHeight );
      end;
     SetShowMarkers(FShowMarkers); 
end;

procedure TFixedText.AddRulerMarker(AValue: Integer);
var
   w: Integer;
begin
  w := RightBorder;
  if w = 0 then w := 100000; // arbitrary number
  if ( AValue > 0 ) and ( AValue < w ) then
     FRuler.AddMarker( FScrollBox, FRuler.GetAbsolutePosition( AValue ), FTextCanvas.Height);
end;

procedure TFixedText.SetShowRuler(const Value: Boolean);
begin
  FShowRuler := Value;
  FRuler.Visible := Value;
  FLineNumbersSpacer.Visible := Value;
  if not Value then
     FTextCanvas.Top := 0
  else FTextCanvas.Top := FRuler.Height + 1;
end;

procedure TFixedText.ClearMarkers;
begin
  if Assigned( FRuler ) then
     FRuler.ClearMarkers;
end;

function TFixedText.GetRightBorder: Integer;
begin
  if High(FRuler.TickMarks) > 0 then
     Result := High(FRuler.TickMarks)
  else Result := 0;
end;

procedure TFixedText.RefreshDisplay;
begin
  if FRuler.Visible then FRuler.RefreshDisplay;
  FTextCanvas.Invalidate;
  Invalidate;
end;

procedure TFixedText.SetShowMarkers(const Value: Boolean);
var
   i: Integer;
begin
  FShowMarkers := Value;
  with FRuler do
  begin
    for i := 0 to RulerMarkerList.Count - 1 do
      RulerMarkerList.Items[i].Visible := Value;
    //    TRulerMarker( RulerMarkerList.Items[i] ).Visible := Value;
  end;
end;

end.
