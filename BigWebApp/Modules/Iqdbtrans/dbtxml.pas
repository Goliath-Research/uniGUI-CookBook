unit dbtxml;

{*****************************************************************************}
{                                                                             }
{ Components for processing XML                                               }
{ This unit contains the components for reading and writing to XML files.     }
{                                                                             }
{*****************************************************************************}

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
  ComCtrls,
  ExtCtrls,
  DB,
  SqlExpr,
  DBClient,
  ADODB,
  Grids,
  XMLIntf,
  XMLDoc,
  IQMS.DBTrans.dbttypes,
  dbtfile,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUIAbstractClasses,
  uniGUITypes,
  uniBasicGrid,
  uniStringGrid,
  uniTreeView;

//  function XMLSchemaFileNameFor(const AXMLFileName: String): String;
//  function XMLEncode(const AValue: String): String;
//  function XMLDecode(const AValue: String): String;

type
  { Forward declarations}
  TXMLSchemaRead = class;
  TXMLSchemaWrite = class;
  TXMLDataTable = class;
  TXMLDataRead = class;

  TXMLEncoding = (enUnknown, enUTF8, enUTF16);

    { TXMLTableImport }
  { Primary component for accessing XML data. }
  TXMLTable = class(TComponent)
  private
   {Private declarations}
    FDOM_Has_Schema: Boolean;
    FDOM_Loaded: Boolean;
    FSchema_Loaded: Boolean;

    // Data Object Models - These are created by this class, and then
    // passed as a property to the schema and data components.
    DOM_Schema: IXMLDocument; // TXpObjModel;
    DOM: IXMLDocument; // TXpObjModel;
    // Child components - These are the components used to process schema
    // and data from the data object models
    FXMLSchema: TXMLSchemaRead;
    FXMLDataRead: TXMLDataRead;
    
    FFileName: String;
    FActive: Boolean;

    procedure LoadDOM(const AShowWaitMsg: Boolean = False);

    procedure SetFileName(const Value: String);
    procedure SetActive(const Value: Boolean);
    function GetDataTable: TXMLDataTable;
    function GetRecordCount: Integer;
    function GetTableName: String;
  protected
   {Protected declarations}
    procedure CheckDOMCreated;
    procedure CheckSchemaLoaded;
  public
   {Public declarations}
    constructor Create(AOwner: TComponent; AXMLFileName: String);
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure ParseToStringGrid(Grid: TUniStringGrid);
    procedure ParseSchemaToTree(ATreeView: TUniTreeView);
  published
   {Published declarations}
    property FileName: String read FFileName write SetFileName;
    property TableName: String read GetTableName;
    property Active: Boolean read FActive write SetActive;
    property RecordCount: Integer read GetRecordCount;

    property Schema: TXMLSchemaRead read FXMLSchema;
    property DataTable: TXMLDataTable read GetDataTable;
  end;
  
  { TXMLSchemaRead }
  { Parses (reads) an XML Schema. This component requires a data object
    model already to have been created and the document loaded.  Using
    the data object model, the component fills a field list. }
  TXMLSchemaRead = class(TComponent)
  private
   {Private declarations}
    FEncodingStr: String;
    FEncoding: TXMLEncoding;
    FTableName: String;
    FDOM: IXMLDocument; // TXpObjModel;
    function NameNoPrefix(const Value: String): String;
    function Prefix(const Value: String): String;
    procedure SetFieldArrayLength(const ANewLength: Integer);
  protected
   {Protected declarations}
    FFields: TFieldDataArray; // declared in dbttypes.pas
  public
   {Public declarations}
    constructor Create(AOwner: TComponent; ADataObjectModel: IXMLDocument);
    destructor Destroy; override;
    procedure Read;
    procedure ParseToTree(ATreeView: TUniTreeView);
    function IndexOfFieldName(const AFieldName: String): Integer;
    procedure ClearFields;
    procedure AddField(AFieldName: String; AFieldSize: Integer;
     AFieldType: TFieldType; AFieldIndex: Integer);
    function DataTypeOf(const AFieldName: String): TFieldType;
  published
   {Published declarations}
    property Fields: TFieldDataArray read FFields write FFields; // declared in dbttypes.pas
    property EncodingStr: String read FEncodingStr write FEncodingStr;
    property Encoding: TXMLEncoding read FEncoding write FEncoding;
    property TableName: String read FTableName write FTableName;
  end;

  { TXMLSchemaWrite }
  { Creates (writes) an XML Schema. This component may be used to create
    an XML schema file by adding to a field list, and then writing the
    schema either to a string list (SaveToStrings) or directly to a
    file (SaveToFile).}
  TXMLSchemaWrite = class(TComponent)
  private
   {Private declarations}
    //FFileName: String;
    FEncodingStr: String;
    FEncoding: TXMLEncoding;
    FTableName: String;
    FLines: TStringList;
    FForEmbedded: Boolean;
    //procedure SetSchemaFileName(const Value: String);
    procedure SetFieldArrayLength(const ANewLength: Integer);
    procedure Write;
    procedure SetTableName(const Value: String);
  protected
   {Protected declarations}
    FFields: TFieldDataArray; // declared in dbttypes.pas
  public
   {Public declarations}
    //constructor Create(AOwner: TComponent; ASchemaFileName: String);
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;

    procedure ClearFields;
    procedure AddField(AFieldName: String; AFieldSize: Integer;
     AFieldType: TFieldType; AFieldIndex: Integer);
    function DataTypeOf(const AFieldName: String): TFieldType;
    function IndexOfFieldName(const AFieldName: String): Integer;

    procedure SaveToFile(AFileName: String);
    procedure SaveToStrings(var AStrings: TStringList);
    
  published
   {Published declarations}
    //property FileName: String read FFileName write SetSchemaFileName;
    property Fields: TFieldDataArray read FFields write FFields; // declared in dbttypes.pas
    property EncodingStr: String read FEncodingStr write FEncodingStr;
    property Encoding: TXMLEncoding read FEncoding write FEncoding;
    property TableName: String read FTableName write SetTableName;
    property ForEmbedded: Boolean read FForEmbedded write FForEmbedded; 
  end;

  { TXMLDataRead }
  { Parses the data contained in an XML data file, and stores records in its
    DataTable property.  This is to be used with TXMLSchemaRead.  }
  TXMLDataRead = class(TComponent)
  private
   {Private declarations}
    FXMLSchema: TXMLSchemaRead;
    FRecordCount: Integer;
    FFieldNames: TStringList;
    FXMLDataTable: TXMLDataTable;
    FDOM: IXMLDocument; // TXpObjModel;
    procedure PopulateFieldNameList;
    procedure PopulateStringGrid(Grid: TUniStringGrid);
    procedure PrepareDataGrid;
  protected
   {Protected declarations}
  public
   {Public declarations}
    constructor Create(AOwner: TComponent; ADataObjectModel: IXMLDocument; // TXpObjModel;
     AXMLSchema: TXMLSchemaRead);
    destructor Destroy; override;
    procedure Parse;
    procedure ParseToStringGrid(Grid: TUniStringGrid);
  published
   {Published declarations}
    property XMLSchema: TXMLSchemaRead read FXMLSchema write FXMLSchema;
    property RecordCount: Integer read FRecordCount default 0;
    property DataTable: TXMLDataTable read FXMLDataTable;
  end;

  TXMLDataArray = array of array of String;

  { TXMLDataTable }
  { Contains the data from an XML file as records. }
  TXMLDataTable = class(TComponent)
  private
   {Private declarations}
    FRecordCount: Integer;
    FFieldList: TStringList;
    FFields: TFieldDataArray;
    FXMLData: TXMLDataArray;
    FXMLSchema: TXMLSchemaRead;
    FDataArrayInitialized: Boolean;
    procedure SetRecordCount(const Value: Integer);
    procedure InitDataArray;
    procedure ClearDataArray;
    function GetColumnCount: Integer;
    procedure SetDataArrayLength(const x, y: Integer);
  protected
   {Protected declarations}
  public
   {Public declarations}
    constructor Create(AOwner: TComponent; AXMLSchema: TXMLSchemaRead);
    destructor Destroy; override;
    procedure CopyFieldsFromSchema;
    // Appends a field name to the field list
    function AddFieldName(const AFieldName: String): Integer;
    // Updates (modifies) a value for an existing record
    procedure UpdateValue(const ARecordNumber: Integer;
     const AFieldName: String; const AValue: String); overload;
    procedure UpdateValue(const ARecordNumber: Integer;
     const AFieldIndex: Integer; const AValue: String); overload;
    // Returns a value
    function GetValue(const ARecordNumber: Integer;
     const AFieldName: String): String; overload;
    function GetValue(const ARecordNumber: Integer;
     const AFieldIndex: Integer): String; overload;
    // Returns a row of text for the desired record
    function RecordText(const ARecordNumber: Integer;
     ADelimiter: String; AFormatAsSQL: Boolean = False): String;
    // Clear the table
    procedure Clear;
    // Add a new record.  After adding a new record, call UpdateValue().
    function Insert: Integer; // returns new record number
  published
   {Published declarations}
    property FieldList: TStringList read FFieldList write FFieldList;
    property Fields: TFieldDataArray read FFields; // declared in dbttypes.pas
    property RecordCount: Integer read FRecordCount write SetRecordCount;
    property ColumnCount: Integer read GetColumnCount;
  end;

  { TXMLExport - Exports a dataset to an XML file.  A schema is also created.}
  TXMLExport = class(TComponent)
  private
   {Private declarations}
    FFile: TDbtFile; // declared in dbtfile.pas
    FXMLSchema: TXMLSchemaWrite;
    FFileName: String;
    FDataSet: TDataSet;
    FTargetTableName: String;
    FShowProgress: Boolean;
    FEmbedSchema: Boolean;
    FSchemaFileName: String;
    FSchemaFileLines: TStringList;
    FRecordCount: Integer;
    FOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
    FOnProgressEvent: TOnProgressEvent;
    procedure OpenSourceData(var ARecordCount: Integer);
    procedure CreateSchemaFile;
    procedure GetSchemaFileLines;

    // property methods
    procedure SetTargetTableName(const Value: String);
  protected
   {Protected declarations}
  public
   {Public declarations}
    constructor Create(AOwner: TComponent;
                       AFileName,
                       ATargetTableName: String;
                       ADataSet: TDataSet);
    destructor Destroy; override;                       
    function Execute: Boolean;
  published
   {Published declarations}
    property FileName: String read FFileName write FFileName;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property TargetTableName: String read FTargetTableName write SetTargetTableName;
    property ShowProgress: Boolean read FShowProgress write FShowProgress;
    property EmbedSchema: Boolean read FEmbedSchema write FEmbedSchema; 

    property OnProgressEvent: TOnProgressEvent read FOnProgressEvent
     write FOnProgressEvent;
    property OnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
     read FOnCheckProgressAbortedEvent write FOnCheckProgressAbortedEvent;
  end;

  { TXMLSimpleWrite }
  { Creates a simple XML file.
    Notes:
     1. The file is created as soon as you create the component,
        and the XML is finalized as soon as you destroy the component.
        Therefore, you must provide the "Table Name" and the "File Name"
        parameters when you create the component.
     2. Add a record using AddRecord(), where the data chunk contains
        the name/value pairs representing field and data.
  }
  TXMLSimpleWrite = class(TComponent)
  private
    FTableName: String;
    FFileName: String;
    FValidParams: Boolean;
    FFile: TDbtFile;
    FRecordCount: Integer;
    procedure AddFooter;
    procedure AddHeader;
    function ValidParams: Boolean;
   {Private declarations}
  protected
   {Protected declarations}
  public
   {Public declarations}
   constructor Create(AOwner: TComponent; ATableName, AFileName: String);
   destructor Destroy; override;
   { Adds data record using name/value pairs, where the field name is the
     "Name" and the field data is the "Value".  For example:
     CUSTNO=DUK00
     COMPANY=DUKE'S INC.
     ADDR1=1521 12TH ST.
   }
   procedure AddRecord(AChunk: TStringList);
  published
   {Published declarations}
   property TableName: String read FTableName;
   property FileName: String read FFileName;
   property RecordCount: Integer read FRecordCount;
  end;

implementation

uses
  IQMS.DBTrans.dbtfields,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtshare,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.FileUtils,
  IQMS.Common.Miscellaneous,
  IQMS.Common.ProgressDialog,
  IQMS.Common.RecordCount,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.XML;

const
 DEFAULT_STRING_FIELD_LENGTH = 250;

{ ---------------------------------------------------------------------------- }
{ TXMLTable }
{ ---------------------------------------------------------------------------- }

constructor TXMLTable.Create(AOwner: TComponent; AXMLFileName: String);
begin
  inherited Create(AOwner);
  FFileName := AXMLFileName;

  CheckDOMCreated;

  FXMLSchema := TXMLSchemaRead.Create(Self, DOM_Schema);
  FXMLDataRead := TXMLDataRead.Create(Self, DOM, FXMLSchema);

end;

destructor TXMLTable.Destroy;
begin
  if Assigned(FXMLSchema) then FreeAndNil(FXMLSchema);
  if Assigned(FXMLDataRead) then FreeAndNil(FXMLDataRead);

  inherited Destroy;
end;

procedure TXMLTable.CheckDOMCreated;
begin
  if not Assigned(DOM_Schema) then
    DOM_Schema := TXMLDocument.Create(nil);
  if not Assigned(DOM) then
    DOM := TXMLDocument.Create(nil);
end;

procedure TXMLTable.CheckSchemaLoaded;
var
   oNode, oChild: IXMLNode;
   i: Integer;
   ATablesNode,
   ATableNameNode: TUniTreeNode;
   ACaption: String;
   ASchemaFile: String;
begin
  if FActive or FSchema_Loaded then Exit;

  FDOM_Has_Schema := False;

  if not Assigned(DOM) then Exit;
  if not Assigned(DOM_Schema) then Exit;
  if not FileExists(FFileName) then Exit;

  // Get the customary schema file name.  We may not use this if the
  // schema information is embedded in the original schema file.
  ASchemaFile := IQMS.Common.XML.XMLSchemaFileNameFor(FFileName);

  // Load the data into the main Data Object Model.  At minimum, this object
  // will contain the data.  But it could also contain the schema information
  // if it is embedded.
  if not FileExists(ASchemaFile) then
     begin
       LoadDOM; // loads file into the main data object model (TXMLDocument)
       FDOM_Has_Schema := TIQWebXMLNodeHelper.FindNodeByName(DOM.DocumentElement, 'schema', oNode);
     end;

  if FileExists(ASchemaFile) then
     begin
       if Assigned(DOM_Schema) then
          begin
            DOM_Schema.xml.Clear;  // ClearDocument;
            DOM_Schema.LoadFromFile(ASchemaFile); // LoadDataSource(ASchemaFile);
            FSchema_Loaded := True;
          end;

       if not TIQWebXMLNodeHelper.FindNodeByName(DOM_Schema.DocumentElement, 'schema', oNode) then
          raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000166 {'Invalid schema file.'});
     end
  else if FDOM_Has_Schema then
    begin
      if Assigned(FXMLSchema) then
         FreeAndNil(FXMLSchema);
      FXMLSchema := TXMLSchemaRead.Create(Self, DOM);
      FSchema_Loaded := True;
    end
  else
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000169 {'Cannot find schema file.'});


end;

procedure TXMLTable.SetFileName(const Value: String);
begin
  FFileName := Value;
end;

procedure TXMLTable.Open;
begin
  if FActive then Exit;

  LoadDOM;
  
  CheckSchemaLoaded;

  // parse the XML file to useable data
  if Assigned(FXMLSchema) then
     FXMLSchema.Read;
  if Assigned(FXMLDataRead) then
     FXMLDataRead.Parse;
  FActive := True;
end;

procedure TXMLTable.Close;
begin
  FActive := False;
  FDOM_Loaded := False;
  FSchema_Loaded := False;
  DOM.XML.Clear;  // ClearDocument;
  DOM_Schema.XML.Clear; // ClearDocument;
end;

procedure TXMLTable.ParseToStringGrid(Grid: TUniStringGrid);
begin
  if Assigned(Grid) and Assigned(FXMLDataRead) then
     FXMLDataRead.ParseToStringGrid(Grid);
end;

procedure TXMLTable.SetActive(const Value: Boolean);
begin
  if Value and not FActive then
     Open
  else if not Value then
     Close; 
end;

function TXMLTable.GetDataTable: TXMLDataTable;
begin
  Result := NIL;
  if Assigned(FXMLDataRead) then
     Result := FXMLDataRead.DataTable;
end;

procedure TXMLTable.ParseSchemaToTree(ATreeView: TUniTreeView);
begin
  //Open;
  CheckSchemaLoaded;
  if Assigned(FXMLSchema) then
     FXMLSchema.ParseToTree(ATreeView);
end;

function TXMLTable.GetRecordCount: Integer;
begin
  if Assigned(FXMLDataRead) then
     Result := FXMLDataRead.RecordCount;
end;

function TXMLTable.GetTableName: String;
begin
  if Assigned(FXMLSchema) then
     Result := FXMLSchema.TableName;
end;

procedure TXMLTable.LoadDOM(const AShowWaitMsg: Boolean = False);
var
   hMsg: TPanelMesg;
   oNode: IXMLNode;
begin
  if FDOM_Loaded then Exit;

  hMsg := NIL;

  if Assigned(DOM) and FileExists(FileName) then
     try
       Screen.Cursor := crHourGlass;
       Application.ProcessMessages;

       if AShowWaitMsg then
          hMsg := hPleaseWait(IQMS.DBTrans.dbtrscstr.cTXT0000173 {'Accessing file.  Please wait...'});
       try
         DOM.XML.Clear; // ClearDocument;
         DOM.LoadFromFile(FileName); // LoadDataSource(FileName);
       finally
         if Assigned(hMsg) then
           FreeAndNil(hMsg);
       end;

       {
       // IQMS.DBTrans.dbtrscstr.cTXT0000174 = 'XML document has errors:'
       if DOM.ErrorCount > 0 then
          raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000174 +
           #13 + DOM.Errors.Text); }

     finally
       Screen.Cursor := crDefault;
     end;

  FDOM_Loaded := True;

  // Validate the DOM
  oNode := DOM.DocumentElement;
  if oNode.ChildNodes.Count < 2 then
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000171{'Invalid XML table format.'});

end;

{ ---------------------------------------------------------------------------- }
{ TXMLSchemaRead }
{ ---------------------------------------------------------------------------- }

constructor TXMLSchemaRead.Create(AOwner: TComponent; ADataObjectModel: IXMLDocument);
begin
  inherited Create(AOwner);
  // assign the XML Partner object model
  FDOM := ADataObjectModel;
  // init field list
  SetLength(FFields, 0);
end;

destructor TXMLSchemaRead.Destroy;
begin
  inherited Destroy;
end;

procedure TXMLSchemaRead.Read;
begin
  ParseToTree(NIL);
end;

procedure TXMLSchemaRead.ParseToTree(ATreeView: TUniTreeView);
var
  oNode, oChild, oSchemaNode: IXMLNode;
  i: Integer;
  ATablesNode,
  ATableNameNode: TUniTreeNode;
  ACaption: String;

  // ---------------------------------------------------------------------------
  function _GetFieldType(const AAttributeName: String): TFieldType;
  var
     AName: String;
  begin
   AName := UpperCase(NameNoPrefix(AAttributeName));

   if IQMS.Common.StringUtils.StrInList(AName, ['BYTE','TINYINT','UNSIGNEDBYTE',
      'UNSIGNEDBYTE']) then
      Result := ftSmallint
   else if IQMS.Common.StringUtils.StrInList(AName, ['INTEGER','SMALLINT','SHORT']) then
      Result := ftInteger
   else if IQMS.Common.StringUtils.StrInList(AName, ['LONGINTEGER','INT','DOUBLE','FLOAT',
    'CURRENCY','MONEY']) then
      Result := ftFloat
   else if IQMS.Common.StringUtils.StrInList(AName, ['DATETIME']) then
      Result := ftDateTime
   else if IQMS.Common.StringUtils.StrInList(AName, ['MEMO','NTEXT']) then
      Result := ftMemo
   else if IQMS.Common.StringUtils.StrInList(AName, ['YESNO','BIT','BOOLEAN']) then
      Result := ftBoolean
   else
      Result := ftString;
  end;
  // ---------------------------------------------------------------------------
  function _AttributeValue(const ANode: IXMLNode;
   const AAttributeName: String): String;
  var
     j: Integer;
     oAttr: IXMLNode; //TXpAttribute;
     AName, ANodeName: String;
  begin

    AName := Trim(UpperCase(NameNoPrefix(AAttributeName)));

    //if ANode.HasAttributes then
       for j := 0 to ANode.AttributeNodes.Count - 1 do
        begin
          oAttr := ANode.AttributeNodes.Get(j);
          ANodeName := Trim(UpperCase(NameNoPrefix(oAttr.NodeName)));
          if CompareStr(AName, ANodeName) = 0 then
             begin
               Result := Variants.VarToStr(oAttr.NodeValue);
               Break;
             end;
        end;
  end;
  // ---------------------------------------------------------------------------
  function _GetStringFieldLength(const ANode: IXMLNode): Integer;
  var
    j: Integer;
    AChild: IXMLNode;
  begin
    // * This method checks the child nodes of AChild *
    // validation
    if Assigned(ATreeView) and (ATableNameNode = NIL) then Exit;
    if ANode = NIL then Exit;
    // initialization
    Result := 0;
    // loop child nodes
    for j := 0 to ANode.ChildNodes.Count - 1 do
        begin
           // get the child node to evaluate
           AChild := ANode.ChildNodes.Get(j);
           // if this is an element node for 'maxLength' then
           // get the value
          if ((CompareText(AChild.NodeName, 'xsd:maxLength') = 0) or
            (CompareText(AChild.LocalName, 'maxLength') = 0)) then
              SysUtils.TryStrToInt(_AttributeValue(AChild, 'value'), Result);
           // recursion - check child nodes
           if AChild.HasChildNodes then
              Result := _GetStringFieldLength(AChild)
        end;
    // always return a default value
    if Result = 0 then
       Result := DEFAULT_STRING_FIELD_LENGTH;
  end;
  // ---------------------------------------------------------------------------
  procedure _UpdateFieldNodes(const ANode: IXMLNode);
  var
    j: Integer;
    AChild: IXMLNode;

    AFieldName: String;
    AFieldType: TFieldType;
    AFieldSize: Integer;
  begin

    if Assigned(ATreeView) and (ATableNameNode = NIL) then Exit;
    if ANode = NIL then Exit;

    for j := 0 to ANode.ChildNodes.Count - 1 do
        begin
           AChild := ANode.ChildNodes.Get(j);

           if (CompareText(AChild.NodeName, 'xsd:element') = 0) or
             (CompareText(AChild.LocalName, 'element') = 0) then
              begin
                AFieldName := _AttributeValue(AChild, 'name');
                if AFieldName > '' then
                   begin
                     // add a tree node for the field
                     if Assigned(ATreeView) then
                        ATreeView.Items.AddChild(ATableNameNode, AFieldName);
                     // Add to the field list.  We need to check the
                     // attribute nodes to get the field information.
                     // Get data type
                     if (_AttributeValue(AChild, 'sqlSType') > '') then
                        AFieldType := _GetFieldType(_AttributeValue(AChild, 'sqlSType'))
                     else if (_AttributeValue(AChild, 'jetType') > '') then
                        AFieldType := _GetFieldType(_AttributeValue(AChild, 'jetType'))
                     else if (_AttributeValue(AChild, 'type') > '') then
                        AFieldType := _GetFieldType(_AttributeValue(AChild, 'type'))
                     else
                        AFieldType := ftString;
                     // Get field size
                     AFieldSize := 0; // default for numeric
                     if AFieldType = ftString then
                        // we need to get at the "maxLength" node, attribute "value"
                        AFieldSize := _GetStringFieldLength(AChild);
                     // Add the field
                     AddField(AFieldName, AFieldSize, AFieldType, -1);
                   end;
              end;

           // recursion - check child nodes
           if AChild.HasChildNodes then
              _UpdateFieldNodes(AChild)

        end;
  end;
  // ---------------------------------------------------------------------------
begin
  // Initialization
  oNode := NIL;
  oChild := NIL;

  if not Assigned(FDOM) then Exit;

  ClearFields; // see below
  
  try
     if (ATreeView <> NIL) and Assigned(ATreeView) then ATreeView.Items.BeginUpdate;
     if (ATreeView <> NIL) and Assigned(ATreeView) then ATreeView.Items.Clear;

     // Get the schema node
     oNode := FDOM.DocumentElement;
     oSchemaNode := NIL;
     if not TIQWebXMLNodeHelper.FindNodeByName(FDOM.DocumentElement, 'schema', oSchemaNode) then
        raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000166 {'Invalid schema file.'});
     
     oChild := NIL; // reset

     // Add the tree view node to represent the schema
     if (ATreeView <> NIL) and Assigned(ATreeView) then
        ATablesNode := ATreeView.Items.Add(NIL, IQMS.DBTrans.dbtrscstr.cTXT0000167 {'Tables'});

     // Get the schema nodes.  Again, there will be exactly 2 nodes.
     // The first node contains just the table name.  The second node is
     // named for the table name, and contains field information.
     if oSchemaNode.ChildNodes.Count <> 2 then
        raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000166 {'Invalid schema file.'});

     // get the second of the 2 child nodes
     oChild := oSchemaNode.ChildNodes.Get(1);

     // get the table name
     if (ATreeView <> NIL) and Assigned(ATreeView) then
        begin
          FTableName := _AttributeValue(oChild, 'name');
          ACaption := FTableName;
          if ACaption = '' then ACaption := IQMS.DBTrans.dbtrscstr.cTXT0000168; // 'Table'
          ATableNameNode := ATreeView.Items.AddChild(ATablesNode, ACaption);
        end;

     // Get the field nodes
     _UpdateFieldNodes(oChild);

  finally
     if (ATreeView <> NIL) and Assigned(ATreeView) then
        begin
          if ATreeView.Items.Count > 0 then
             ATreeView.Items[0].Expand(False);
          ATreeView.Items.EndUpdate;
        end;
  end;
end;

function TXMLSchemaRead.NameNoPrefix(const Value: String): String;
var
   i: Integer;
begin
  // default value; just return the original text.
  Result := Value;
  // find the colon in the value
  i := Pos(':',Value);
  // return text after the colon
  if i > 0 then
     Result := Copy(Value, i+1, Length(Value));
end;

function TXMLSchemaRead.Prefix(const Value: String): String;
var
   i: Integer;
begin
  // default value; just return the original text.
  Result := '';
  // find the colon in the value
  i := Pos(':',Value);
  // return text before the colon
  if i > 0 then
     Result := Copy(Value, 1, i-1);
end;

function TXMLSchemaRead.IndexOfFieldName(const AFieldName: String): Integer;
var
   i: Integer;
begin
  Result := -1;
  for i := Low(Fields) to High(Fields) do
   if CompareStr(Fields[i].FieldName, AFieldName) = 0 then
      begin
        Result := i;
        Break;
      end;
end;

function TXMLSchemaRead.DataTypeOf(const AFieldName: String): TFieldType;
var
   i: Integer;
begin
  Result := ftUnknown;
  i := IndexOfFieldName(AFieldName);
  if i > -1 then
     Result := Fields[i].DataType;
end;

procedure TXMLSchemaRead.AddField(AFieldName: String; AFieldSize: Integer;
  AFieldType: TFieldType; AFieldIndex: Integer);
var
   i: Integer;
begin
  // 1.) field name
  i := High(FFields) + 1;
  SetFieldArrayLength(i + 1);
  FFields[i].FieldName := AFieldName;
  FFields[i].DataType := AFieldType;
  FFields[i].FieldSize := AFieldSize; // default for numeric
  FFields[i].Visible := True;
  FFields[i].Index := AFieldIndex;
end;

procedure TXMLSchemaRead.ClearFields;
begin
  if Assigned(FFields) then
     SetLength(FFields, 0);
end;

procedure TXMLSchemaRead.SetFieldArrayLength(const ANewLength: Integer);
begin
  try
     SetLength(FFields, ANewLength);
  except on
     E:EOutOfMemory do
      // 'The number of fields exceeds requested limit (%d):'#13'%s'
      raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000175,
       [ANewLength, E.Message])
  end;
end;

{ ---------------------------------------------------------------------------- }
{ TXMLSchemaWrite }
{ ---------------------------------------------------------------------------- }

constructor TXMLSchemaWrite.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FLines := TStringList.Create;

  // assign the schema file; this will also load the file into the object model.
  //FileName := ASchemaFileName;

  // init field list
  ClearFields;
end;

destructor TXMLSchemaWrite.Destroy;
begin
  if Assigned(FLines) then FreeAndNil(FLines);
  inherited Destroy;
end;

procedure TXMLSchemaWrite.Write;
var
   ALines: TStringList;
   i: Integer;
   APkFieldName: String;

   // --------------------------------------------------------------------------
   procedure _ad(const S: String);
   begin
     if Trim(S) > '' then
        ALines.Add(S);
   end;
   // --------------------------------------------------------------------------
   procedure _ad_str(const AFieldName: String; AFieldSize: Integer);
   begin
     _ad(Format('<xsd:element name="%s" minOccurs="0" od:jetType="text" ' +
      'od:sqlSType="nvarchar">',[AFieldName]));
     _ad('<xsd:simpleType>');
     _ad('<xsd:restriction base="xsd:string">');
     _ad(Format('<xsd:maxLength value="%d"/>',[AFieldSize]));
     _ad('</xsd:restriction>');
     _ad('</xsd:simpleType>');
     _ad('</xsd:element>');
   end;
   // --------------------------------------------------------------------------
   procedure _ad_int(const AFieldName: String);
   begin
     _ad(Format('<xsd:element name="%s" minOccurs="0" od:jetType="integer" ' +
      'od:sqlSType="smallint" type="xsd:short"/>', [AFieldName]));
   end;
   // --------------------------------------------------------------------------
   procedure _ad_byte(const AFieldName: String);
   begin
     _ad(Format('<xsd:element name="%s" minOccurs="0" od:jetType="byte" ' +
      'od:sqlSType="tinyint" type="xsd:unsignedByte"/>', [AFieldName]));
   end;
   // --------------------------------------------------------------------------
   procedure _ad_float(const AFieldName: String);
   begin
     _ad(Format('<xsd:element name="%s" minOccurs="0" od:jetType="double" ' +
       'od:sqlSType="float" type="xsd:double"/>',[AFieldName]));
   end;
   // --------------------------------------------------------------------------
   procedure _ad_datetime(const AFieldName: String);
   begin
     _ad(Format('<xsd:element name="%s" minOccurs="0" ' +
      'od:jetType="datetime" od:sqlSType="datetime" type="xsd:dateTime"/>',
      [AFieldName]));
   end;
   // --------------------------------------------------------------------------
   procedure _ad_memo(const AFieldName: String);
   begin
     _ad(Format('<xsd:element name="%s" minOccurs="0" od:jetType="memo" ' +
      'od:sqlSType="ntext">', [AFieldName]));
     _ad('<xsd:simpleType>');
     _ad('<xsd:restriction base="xsd:string">');
     _ad('<xsd:maxLength value="536870910"/>');
     _ad('</xsd:restriction>');
     _ad('</xsd:simpleType>');
     _ad('</xsd:element>');
   end;
   // --------------------------------------------------------------------------
   procedure _ad_boolean(const AFieldName: String);
   begin
    _ad(Format('<xsd:element name="MYBOOLEAN" minOccurs="1" od:jetType="yesno" ' +
      'od:sqlSType="bit" od:nonNullable="yes" type="xsd:boolean"/>',
      [AFieldName]));
    _ad('');
   end;
   // --------------------------------------------------------------------------
{   procedure _ad_hyperlink(const AFieldName: String);
   begin
    _ad(Format('<xsd:element name="%s" minOccurs="0" od:jetType="hyperlink" ' +
     'od:sqlSType="ntext" od:hyperlink="yes">', [AFieldName]));
    _ad('<xsd:simpleType>');
    _ad('<xsd:restriction base="xsd:string">');
    _ad('<xsd:maxLength value="536870910"/>');
    _ad('</xsd:restriction>');
    _ad('</xsd:simpleType>');
    _ad('</xsd:element>');
   end;}
   // --------------------------------------------------------------------------
begin
  if High(Fields) < 0 then Exit;

  if (TableName = '') then
     Exit;

  //if FileName = '' then Exit;
  //DeleteFile(FileName);

  ALines := TStringList.Create;
  try
     _ad('<?xml version="1.0" encoding="UTF-8"?>');

     // Note:  If we are generating this schema to be embedded at the top of
     //        an XML file, which also contains data, then we need to modify
     //        the first line or two.
     if FForEmbedded then
        begin
          _ad('<root xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:od=' +
              '"urn:schemas-microsoft-com:officedata">');
          _ad('<xsd:schema>');
        end
     else
         _ad('<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
             'xmlns:od="urn:schemas-microsoft-com:officedata">');

     _ad('<xsd:element name="dataroot">');
     _ad('<xsd:complexType>');
     _ad('<xsd:sequence>');
     _ad(Format('<xsd:element ref="%s" minOccurs="0" maxOccurs="unbounded"/>',
         [TableName]));
     _ad('</xsd:sequence>');
     _ad('<xsd:attribute name="generated" type="xsd:dateTime"/>');
     _ad('</xsd:complexType>');
     _ad('</xsd:element>');
     _ad(Format('<xsd:element name="%s">', [TableName]));
     _ad('<xsd:annotation>');

     APkFieldName := IQMS.DBTrans.dbtshare.GetTablePrimaryKey(TableName);
     if APkFieldName > '' then
        begin
          _ad('<xsd:appinfo>');
          _ad(Format('<od:index index-name="PrimaryKey" index-key="%s" ' +
           'primary="yes" unique="yes" clustered="no"/>',[APkFieldName]));
          _ad('</xsd:appinfo>');
        end
     else
       _ad('<xsd:appinfo/>');

     _ad('</xsd:annotation>');
     _ad('<xsd:complexType>');
     _ad('<xsd:sequence>');

     // Add fields
     for i := Low(Fields) to High(Fields) do
      begin
        case Fields[i].DataType of
         ftSmallint:
          _ad_byte(Fields[i].FieldName);
         ftInteger, ftWord, ftLargeint:
          _ad_int(Fields[i].FieldName);
         ftFloat, ftCurrency, ftBCD, ftAutoInc, ftFMTBcd:
          _ad_float(Fields[i].FieldName);
         ftDate, ftTime, ftDateTime, ftTimeStamp:
          _ad_datetime(Fields[i].FieldName);
         ftMemo, ftFmtMemo:
          _ad_memo(Fields[i].FieldName);
         ftBoolean:
          _ad_boolean(Fields[i].FieldName);
         ftString, ftFixedChar, ftWideString, ftGuid:
          begin
            if (Fields[i].FieldSize - 1 <= 255) then
               _ad_str(Fields[i].FieldName, Fields[i].FieldSize-1)
            else
              _ad_memo(Fields[i].FieldName);
          end;
         ftBytes, ftVarBytes, ftBlob, ftGraphic, ftParadoxOle,
         ftDBaseOle, ftTypedBinary, ftCursor, ftADT, ftArray, ftReference,
         ftDataSet, ftOraBlob, ftOraClob, ftVariant, ftInterface, ftIDispatch:
          Continue; 
        else
         // treat as ftString
          begin
            if (Fields[i].FieldSize - 1 <= 255) then
               _ad_str(Fields[i].FieldName, Fields[i].FieldSize-1)
            else
              _ad_memo(Fields[i].FieldName);
          end;
        end;
      end;

     // end schema
     _ad('</xsd:sequence>');
     _ad('</xsd:complexType>');
     _ad('</xsd:element>');
     _ad('</xsd:schema>');

     //ALines.SaveToFile(FileName);
     FLines.Clear;
     FLines.AddStrings(ALines);

  finally
     if Assigned(ALines) then FreeAndNil(ALines);
  end;

end;

procedure TXMLSchemaWrite.SaveToFile(AFileName: String);
begin
  Write;
  DeleteFile(AFileName);
  FLines.SaveToFile(AFileName);
end;

procedure TXMLSchemaWrite.SaveToStrings(var AStrings: TStringList);
begin
  if not Assigned(AStrings) then Exit;
  Write;
  AStrings.Clear;
  AStrings.AddStrings(FLines);
end;

function TXMLSchemaWrite.IndexOfFieldName(const AFieldName: String): Integer;
var
   i: Integer;
begin
  Result := -1;
  for i := Low(Fields) to High(Fields) do
   if CompareStr(Fields[i].FieldName, AFieldName) = 0 then
      begin
        Result := i;
        Break;
      end;
end;

function TXMLSchemaWrite.DataTypeOf(const AFieldName: String): TFieldType;
var
   i: Integer;
begin
  Result := ftUnknown;
  i := IndexOfFieldName(AFieldName);
  if i > -1 then
     Result := Fields[i].DataType;
end;

procedure TXMLSchemaWrite.AddField(AFieldName: String; AFieldSize: Integer;
  AFieldType: TFieldType; AFieldIndex: Integer);
var
   i: Integer;
begin
  // 1.) field name
  i := High(FFields) + 1;
  SetFieldArrayLength(i + 1); // local
  FFields[i].FieldName := AFieldName;
  FFields[i].DataType := AFieldType;
  FFields[i].FieldSize := AFieldSize; // default for numeric
  FFields[i].Visible := True;
  FFields[i].Index := AFieldIndex;  
end;

procedure TXMLSchemaWrite.ClearFields;
begin
  if Assigned(FFields) then
     SetLength(FFields, 0);
end;

procedure TXMLSchemaWrite.SetFieldArrayLength(const ANewLength: Integer);
begin
  try
     SetLength(FFields, ANewLength);
  except on
     E:EOutOfMemory do
      // 'The number of fields exceeds requested limit (%d):'#13'%s'
      raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000175,
       [ANewLength, E.Message])
  end;
end;

procedure TXMLSchemaWrite.SetTableName(const Value: String);
var
   S: String;
begin
  S := Value;
  if Pos('.', S) > 0 then
     S := IQMS.Common.StringUtils.StrBeforeDot(S);
  FTableName := S;
end;

{ ---------------------------------------------------------------------------- }
{ TXMLDataRead }
{ ---------------------------------------------------------------------------- }

constructor TXMLDataRead.Create(AOwner: TComponent; ADataObjectModel: IXMLDocument;
 AXMLSchema: TXMLSchemaRead);
begin
  inherited Create(AOwner);
  // create the XML Partner object model
  FDOM := ADataObjectModel;
  // Assign the schema object
  FXMLSchema := AXMLSchema;
  // create the simple, field names list
  FFieldNames := TStringList.Create;
end;

destructor TXMLDataRead.Destroy;
begin
  if Assigned(FFieldNames) then FreeAndNil(FFieldNames);
  inherited Destroy;
end;

procedure TXMLDataRead.PrepareDataGrid;
begin
  if Assigned(FXMLDataTable) then
     FreeAndNil(FXMLDataTable);
  FXMLSchema.Read;
  FXMLDataTable := TXMLDataTable.Create(Self, FXMLSchema);
end;

procedure TXMLDataRead.Parse;
begin
  ParseToStringGrid(NIL);
end;

procedure TXMLDataRead.ParseToStringGrid(Grid: TUniStringGrid);
var
  aCount : Integer;
  oNode, oSelNode, oChild, oDataRootNode: IXMLNode;
  i: Integer;
  ACol, ARow: Integer;
  
  // ---------------------------------------------------------------------------
  procedure _PrepareDataTable;
  begin
    DataTable.Clear;
    DataTable.FieldList.Clear;
    DataTable.FieldList.AddStrings(FFieldNames);
  end;
  // ---------------------------------------------------------------------------
  procedure _RecurseFieldNodes(ARecordNumber: Integer;
   ANode: IXMLNode);
  var
    j: Integer;
  begin
    for j := 0 to ANode.ChildNodes.Count - 1 do
        begin
          // This is a field
          oChild := ANode.ChildNodes.Get(j);
          if oChild.IsTextElement then          
            begin
              // returns the field name
              DataTable.UpdateValue(ARecordNumber,
                                    oChild.NodeName, // FieldName
                                    oChild.Text);    // FieldValue
              Inc(ACol); // inc here; 0-based
            end;
        end;
  end;
  // ---------------------------------------------------------------------------
begin
  if not Assigned(FXMLSchema) then Exit;
  if not Assigned(FDOM) then Exit;

  PrepareDataGrid;

  DataTable.CopyFieldsFromSchema;

  PopulateFieldNameList;
  _PrepareDataTable;

  // Initialization
  oNode := NIL;
  oSelNode := NIL;
  oChild := NIL;

  FRecordCount := 0;
  ACol := 0;
  ARow := 0;

  // get the start node
  oNode := FDOM.DocumentElement;
  oDataRootNode := NIL;
  if not TIQWebXMLNodeHelper.FindNodeByName(FDOM.DocumentElement, 'dataroot', oDataRootNode) then
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000166 {'Invalid schema file.'});

  oChild := NIL; // reset

  // cycle the children of the 'dataroot' node (the oNode object will
  // reference the 'dataroot' node at this point).  Each child of the
  // 'dataroot' node will be a row contain field values.  So, in effect,
  // we are now looping through the rows and fields.
  ARow := 0;
  for i := 0 to oDataRootNode.ChildNodes.Count - 1 do
      begin
        //Inc(ARow); // this will skip the "column header" row
        ACol := 0; // reset before each iteration
        ARow := DataTable.Insert;
        // This node represents a record
        oChild := oDataRootNode.ChildNodes.Get(i);
        // Now get the field values
         if oChild.HasChildNodes then
            _RecurseFieldNodes(ARow, oChild);
      end;

  // set to actual count processed
  FRecordCount := DataTable.RecordCount;

  // Now, populate the string grid, if provided
  if Assigned(Grid) then
     PopulateStringGrid(Grid);

end;

procedure TXMLDataRead.PopulateFieldNameList;
var
   i: Integer;
begin
  if not Assigned(XMLSchema) or not Assigned(FFieldNames) then
     Exit;

  FFieldNames.Clear;

  for i := 0 to High(XMLSchema.Fields) do
      FFieldNames.Add(XMLSchema.Fields[i].FieldName);
end;

procedure TXMLDataRead.PopulateStringGrid(Grid: TUniStringGrid);
var
   i, ARow, ACol: Integer;
   AValue: String;

  // ---------------------------------------------------------------------------
  procedure _PrepareStringGrid;
  var
     i,j: Integer;
  begin
    if not Assigned(Grid) then
       Exit;

    // clear the string grid
    if Assigned(Grid) then
    with Grid do
    begin
      for j := 0 to Grid.RowCount - 1 do
       for i := 0 to Grid.ColCount - 1 do
          Grid.Cells[i,j]:='';

      RowCount := 2;
      ColCount := 2;
    end;

    Grid.ColCount := FFieldNames.Count;

    if Assigned(XMLSchema) then
    for j := 0 to High(XMLSchema.Fields) do
        Grid.Cells[j {Col}, 0 {Row}] := XMLSchema.Fields[j].FieldName;

  end;
  // ---------------------------------------------------------------------------
  procedure _AddStringGridFieldValue(iRow, iCol: Integer; sFieldValue: String);
  begin
    if iRow > Grid.RowCount - 1 then
       Grid.RowCount := Grid.RowCount + 1;
     Grid.Cells[iCol,iRow] := sFieldValue;
  end;
  // ---------------------------------------------------------------------------
begin
  if not Assigned(Grid) or not Assigned(DataTable) then Exit;

  _PrepareStringGrid;

  with DataTable do
  begin
     for ARow := 1 to DataTable.RecordCount do
     begin
       for ACol := 0 to DataTable.ColumnCount - 1 do
       begin
          AValue := DataTable.GetValue(ARow, ACol);
          _AddStringGridFieldValue(ARow, ACol, AValue)
       end;
     end;
  end;

//  IQMS.Common.Controls.FitGridColumnsToText(Grid);

end;

{ ---------------------------------------------------------------------------- }
{ TXMLDataTable }
{ ---------------------------------------------------------------------------- }

constructor TXMLDataTable.Create(AOwner: TComponent; AXMLSchema: TXMLSchemaRead);
begin
  if not Assigned(AXMLSchema) then
     raise Exception.Create('Application Error: XML Schema not provided.');
     
  FRecordCount := 0;
  inherited Create(AOwner);
  FXMLSchema := AXMLSchema;
  FFieldList := TStringList.Create;
  // init field list
  CopyFieldsFromSchema;
  InitDataArray;
end;

destructor TXMLDataTable.Destroy;
begin
  if Assigned(FFieldList) then
    FreeAndNil(FFieldList);
  inherited Destroy;
end;

procedure TXMLDataTable.InitDataArray;
begin
  if FDataArrayInitialized then Exit;
  ClearDataArray;
  FDataArrayInitialized := True;
end;

procedure TXMLDataTable.ClearDataArray;
begin
  SetLength(FXMLData,0,0);
end;

function TXMLDataTable.AddFieldName(const AFieldName: String): Integer;
begin
  if Assigned(FFieldList) then
     Result := FFieldList.Add(AFieldName);
  //SetLength(FXMLData, RecordCount {x}, FFieldList.Count {y});
  SetDataArrayLength(RecordCount {x}, FFieldList.Count {y});
end;

procedure TXMLDataTable.SetDataArrayLength(const x, y: Integer);
begin
  try
     SetLength(FXMLData, x, y);
  except on
     E:EOutOfMemory do
      // 'The number of fields exceeds requested limit (%d):'#13'%s'
      raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000175,
       [x, E.Message])
  end;
end;

procedure TXMLDataTable.UpdateValue(const ARecordNumber: Integer;
  const AFieldName, AValue: String);
var
   ACol: Integer;
begin
  ACol := FFieldList.IndexOf(AFieldName);
  if ACol = -1 then Exit;
  if (ARecordNumber >= 1) then
     begin
       if (High(FXMLData) < ARecordNumber - 1) then
          Exit;

       FXMLData[ARecordNumber - 1 {x}, ACol {y}] := AValue;
     end;
end;

procedure TXMLDataTable.UpdateValue(const ARecordNumber: Integer;
 const AFieldIndex: Integer; const AValue: String);
begin
  if (AFieldIndex > -1) and
     (ARecordNumber >= 1) then
     begin
       if (High(FXMLData) < ARecordNumber - 1) then
          Exit;

       FXMLData[ARecordNumber - 1 {x}, AFieldIndex {y}] := AValue;
     end;
end;

function TXMLDataTable.GetValue(const ARecordNumber: Integer;
  const AFieldName: String): String;
var
   ACol: Integer;
begin
  Result := '';
  ACol := FFieldList.IndexOf(AFieldName);
  if ACol = -1 then Exit;
  if (ARecordNumber >= 1) then
     Result := FXMLData[ARecordNumber - 1 {x}, ACol {y}];
end;

function TXMLDataTable.GetValue(const ARecordNumber,
  AFieldIndex: Integer): String;
begin
  Result := '';
  if (AFieldIndex = -1) or (AFieldIndex > FFieldList.Count - 1) then
     Exit;

  if (ARecordNumber >= 1) then
     Result := FXMLData[ARecordNumber - 1 {x}, AFieldIndex {y}];
end;

procedure TXMLDataTable.SetRecordCount(const Value: Integer);
begin
  FRecordCount := Value;
  //SetLength(FXMLData, Value {x}, FFieldList.Count {y});
  SetDataArrayLength(Value {x}, FFieldList.Count {y});
end;

procedure TXMLDataTable.Clear;
begin
  ClearDataArray;
end;

function TXMLDataTable.Insert: Integer;
begin
  RecordCount := RecordCount + 1;
  Result := RecordCount;
end;

function TXMLDataTable.RecordText(const ARecordNumber: Integer;
 ADelimiter: String; AFormatAsSQL: Boolean): String;
var
   S: String;
   x,y: Integer;
  // ---------------------------------------------------------------------------
  function _getText(const ACol, ARow: Integer): String;
  var
     AFieldName: String;
     AFieldType: TFieldType;
     AFieldSize: Integer;
     i: Integer;
  begin
    AFieldName := FieldList.Strings[ACol];
    AFieldType := ftString; // default
    AFieldSize := 0;

    for i := Low(Fields) to High(Fields) do
     if Fields[i].FieldName = AFieldName then
        begin
          AFieldType := Fields[i].DataType;
          AFieldSize := Fields[i].FieldSize;
          Break;
        end;

    Result := FXMLData[ARow,ACol];
    if AFormatAsSQL then
       Result := IQMS.DBTrans.dbtfields.GetFormattedDataAsStringB(Result,
        AFieldSize, AFieldType);
  end;
  // ---------------------------------------------------------------------------

begin
   y := ARecordNumber - 1;
   if y > High(FXMLData) then
      y := High(FXMLData);

   for x := 0 to FFieldList.Count - 1 do
    if x = 0 then
       S := _getText(x,y)
    else
       S := S + ADelimiter + _getText(x,y);
   Result := S;    
end;

function TXMLDataTable.GetColumnCount: Integer;
begin
  Result := FFieldList.Count;
end;

procedure TXMLDataTable.CopyFieldsFromSchema;
var
   i: Integer;
begin
  if not Assigned(FXMLSchema) then Exit;
  SetLength(FFields, 0);
  for i := Low(FXMLSchema.Fields) to High(FXMLSchema.Fields) do
   begin
     SetLength(FFields, i + 1);
     FFields[i].DataType := FXMLSchema.Fields[i].DataType;
     FFields[i].FieldName  := FXMLSchema.Fields[i].FieldName;
     FFields[i].FieldSize := FXMLSchema.Fields[i].FieldSize;
     FFields[i].Visible := FXMLSchema.Fields[i].Visible;
   end;
end;

{ TXMLExport }

constructor TXMLExport.Create(AOwner: TComponent;
                              AFileName,
                              ATargetTableName: String;
                              ADataSet: TDataSet);
begin
  inherited Create(AOwner);
  FShowProgress := True;
  FRecordCount := 0;
  FEmbedSchema := False;
  FFileName := AFileName;
  FSchemaFileName := '';
  FTargetTableName := ATargetTableName;
  FDataSet := ADataSet;
  FXMLSchema := TXMLSchemaWrite.Create(Self);
  FSchemaFileLines := TStringList.Create;
  FXMLSchema.TableName := ATargetTableName;
  FFile := TDbtFile.Create(AFileName);
  FFile.BatchSize := 100;
  FFile.ProcessBatch := True;
end;

destructor TXMLExport.Destroy;
begin
  if Assigned(FFile) then FreeAndNil(FFile);
  if Assigned(FSchemaFileLines) then FreeAndNil(FSchemaFileLines);

  inherited Destroy;
end;

procedure TXMLExport.GetSchemaFileLines;
var
   i: Integer;
begin

  if not Assigned(DataSet) then Exit;
  if not Assigned(FSchemaFileLines) then Exit;

  if not Assigned(FXMLSchema) then
     FXMLSchema := TXMLSchemaWrite.Create(Self);

  if not DataSet.Active then DataSet.Open;

  FSchemaFileLines.Clear;

  with FXMLSchema do
  begin
     ClearFields;
     for i := 0 to DataSet.FieldCount - 1 do
      if DataSet.Fields[i].Visible then
         AddField(DataSet.Fields[i].FieldName,
                  DataSet.Fields[i].DataSize,
                  DataSet.Fields[i].DataType,
                  i);
     // This tells the TXMLSchema object how to construct the schema text.
     // If this schema is to be embedded, then it should be slightly different.
     ForEmbedded := Self.FEmbedSchema;
     // Save the schema to the file lines
     SaveToStrings(FSchemaFileLines);
  end;


end;

procedure TXMLExport.OpenSourceData(var ARecordCount: Integer);
var
   hMsg: TPanelMesg;
begin
  hMsg := NIL;
  
  try
     if ShowProgress and not Assigned(OnProgressEvent) then
        hMsg := hPleaseWait('');
     if Assigned(OnProgressEvent) then
        begin
          //'Accessing database.  Please wait.'
          OnProgressEvent(0,0,IQMS.DBTrans.dbtrscstr.cTXT0000207);
          Application.ProcessMessages;
        end;
     if not DataSet.Active then
        begin
          DataSet.Open;
          FRecordCount := IQMS.DBTrans.dbtshare.GetRecordCount(DataSet);
        end;
     ARecordCount := FRecordCount;
  finally
     if Assigned(hMsg) then FreeAndNil(hMsg);
  end;
end;

procedure TXMLExport.CreateSchemaFile;
var
   i: Integer;
   hMsg: TPanelMesg;
begin
  // validation
  if not Assigned(DataSet) or
    not Assigned(FSchemaFileLines) then Exit;

  if ShowProgress and not Assigned(OnProgressEvent) then
     //'Accessing source data. Please wait.'
     hMsg := hPleaseWait(IQMS.DBTrans.dbtrscstr.cTXT0000209)
  else
     hMsg := nil;
  try
     // the target schema file name
     FSchemaFileName := IQMS.Common.XML.XMLSchemaFileNameFor(FileName);
     // get the lines
     if FSchemaFileLines.Count = 0 then
        GetSchemaFileLines;
     // save the lines to file
     FSchemaFileLines.SaveToFile(FSchemaFileName);
  finally
     if Assigned(hMsg) then
       FreeAndNil(hMsg);
  end;

  // verify file created
  if not FileExists(FSchemaFileName) then
     //'XML Schema could not be created.  Operation aborted.'
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000172);
end;

function TXMLExport.Execute: Boolean;
var
   i, AMax, ACount: Integer;
   hPrg: TIQWebProgressDialog; // in IQMS.Common.ProgressDialog.pas
   dt: TFieldType;
   fld: TField;
   AProgressMessage: String;
   AAborted: Boolean;

   // --------------------------------------------------------------------------
   procedure _ad(const S: String);
   begin
     // write to file
     FFile.Write(S);
   end;
   // --------------------------------------------------------------------------
   procedure _ad_str(const AFieldName, AValue: String);
   var
      S: String;
   begin
     S := IQMS.Common.XML.XMLEncode(AValue); // declared in this unit
    _ad(Format('<%s>%s</%s>',[AFieldName, S, AFieldName]));
   end;
   // --------------------------------------------------------------------------
   procedure _ad_datetime(const AFieldName: String; ADateTime: TDateTime);
   begin
    _ad_str(AFieldName, IQMS.Common.Dates.XMLDateTimeStr(ADateTime));
   end;
   // --------------------------------------------------------------------------

begin
  // initialization
  Result := False;
  hPrg := NIL;
  AMax := 0;
  ACount := 0;
  AAborted := False;
  
  if not Assigned(FXMLSchema) then
     Exit;

  // remove the original file
  DeleteFile(FileName);

  try
     try
        // Access the source data
        OpenSourceData(AMax);

        // If we are not embedding the schema information into the XML file (which
        // is the default setting), then create the schema file now.
        if not FEmbedSchema then
           CreateSchemaFile;

        // 'Exporting to %s.  Please wait.'
        AProgressMessage := Format(IQMS.DBTrans.dbtrscstr.cTXT0000043,
           [ExtractFileName(FileName)]);

        // Create the Progress Dialog box
        if ShowProgress then
           begin
             hPrg := hProgressDlg( 100, AProgressMessage);
             hPrg.MaxProgress := AMax;
           end;

        if Assigned(OnProgressEvent) then
           OnProgressEvent(AMax, 0, AProgressMessage);

        // If we are embedding the schema information into the XML file, then
        // we do that here.
        if FEmbedSchema then
           begin
             if FSchemaFileLines.Count = 0 then
                GetSchemaFileLines;
     
             for i := 0 to FSchemaFileLines.Count - 1 do
                 _ad(FSchemaFileLines.Strings[i]);
           end;
           
        // XML Header
        if not FEmbedSchema then
           begin
             _ad('<?xml version="1.0" encoding="UTF-8"?>');
             _ad(Format('<dataroot xmlns:od="urn:schemas-microsoft-com:officedata" ' +
              'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  ' +
              'xsi:noNamespaceSchemaLocation="%s.xsd" ' +
              'generated="%s">',
              [IQMS.Common.FileUtils.FileNameNoExt(FileName), IQMS.Common.Dates.XMLDateTimeStr(Now)]));
           end
        else
           begin
             _ad(Format('<dataroot xmlns:xsi="http://www.w3.org/2001/XMLSchema-' +
              'instance" generated="%s">',
              [IQMS.Common.Dates.XMLDateTimeStr(Now)]));
           end;

        // dataset should be open by this point.
        if not DataSet.Active then
           Exit;
           
        DataSet.First;
        if Assigned(hPrg) then
           begin
             hPrg.Marquee := False;
             hPrg.Status1 := 'Exporting XML data...';
             hPrg.CancelBtnEnabled := True;
             Application.ProcessMessages;
           end;

        // Add field data
        while not DataSet.EOF do
         begin
           // check if user clicked Cancel
           if Assigned(hPrg) and hPrg.CheckProgressAborted then
              begin
                AAborted := True;
                Break;
              end;
           if Assigned(OnCheckProgressAbortedEvent) and
              OnCheckProgressAbortedEvent then
              begin
                AAborted := True;
                Break;
              end;

           _ad(Format('<%s>',[TargetTableName]));

           for i := Low(FXMLSchema.Fields) to High(FXMLSchema.Fields) do
            begin
              dt := FXMLSchema.Fields[i].DataType; //FXMLSchema.DataTypeOf(DataSet.Fields[i].FieldName);
              fld := DataSet.Fields[FXMLSchema.Fields[i].Index];
              //DataSet.FindField(FXMLSchema.Fields[i].FieldName);
              // Note: do not use fld.IsNull.  This causes an AV with some
              //       fields if the dataset is DBExpress.
              if (dt <> ftUnknown) and
                 (fld.AsString <> '') then
                 case dt of
                  ftTimeStamp, ftDateTime, ftDate, ftTime:
                   _ad_datetime(fld.FieldName, fld.AsDateTime);
                 else
                    _ad_str(fld.FieldName, fld.AsString);
                 end; // end case
            end;
            
           {for i := 0 to DataSet.FieldCount - 1 do
            begin
              dt := FXMLSchema.DataTypeOf(DataSet.Fields[i].FieldName);
              if (dt <> ftUnknown) then
              //if not DataSet.Fields[i].IsNull then
                 case dt of
                  ftTimeStamp, ftDateTime, ftDate, ftTime:
                   _ad_datetime(DataSet.Fields[i].FieldName,
                    DataSet.Fields[i].AsDateTime);
                 else
                    _ad_str(DataSet.Fields[i].FieldName,
                     DataSet.Fields[i].AsString);
                 end; // end case
            end;}

             _ad(Format('</%s>',[TargetTableName]));
     
           DataSet.Next;

           if Assigned(hPrg) then
              hPrg.StepProgress;

           if Assigned(OnProgressEvent) then
              OnProgressEvent(AMax, ACount, AProgressMessage);

         end;
     
        // XML Footer
        _ad('</dataroot>');
     
        if FEmbedSchema then
           _ad('</root>');
     
        Result := not AAborted;

        // write all pending changes to file
        FFile.FlushBatch;

     finally
        if Assigned(hPrg) then FreeAndNil(hPrg);
     end;
  except on E:Exception do
    if IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
    begin
      if Assigned(FFile) then FreeAndNil(FFile);
      DeleteFile(FFileName);
      DeleteFile(FSchemaFileName);
      raise Exception.CreateFmt('XML export error:'#13'%s',[E.Message]);
    end;
  end;

  // If process failed, then remove the XML file; it is unusable. 
  if not Result then
     begin
       if Assigned(FFile) then FreeAndNil(FFile);
       DeleteFile(FFileName);
       DeleteFile(FSchemaFileName);
     end;

end;

procedure TXMLExport.SetTargetTableName(const Value: String);
var
   S: String;
begin
  S := Value;
  if Pos('.', S) > 0 then
     S := IQMS.Common.StringUtils.StrBeforeDot(S);
  FTargetTableName := S;

  if Assigned(FXMLSchema) then
     FXMLSchema.TableName := S;
end;

{ TXMLSimpleWrite }

constructor TXMLSimpleWrite.Create(AOwner: TComponent; ATableName,
  AFileName: String);
begin
  FFile := NIL;
  inherited Create(AOwner);
  FTableName := Trim(ATableName);
  FFileName := AFileName;
  FValidParams := ValidParams;
  AddHeader;
end;

destructor TXMLSimpleWrite.Destroy;
begin
  AddFooter;
  if Assigned(FFile) then
    begin
      FFile.FlushBatch;
      FFile.Free;
      FFile := NIL;
    end;
  inherited Destroy;
end;

function TXMLSimpleWrite.ValidParams: Boolean;
begin
  Result := (FTableName > '') and (FFileName > '');
end;

procedure TXMLSimpleWrite.AddHeader;
var
   ADir: String;
begin
  if not FValidParams then
     Exit;

  if FileExists(FFileName) then
     DeleteFile(FFileName);

  ADir := ExtractFilePath(FFileName);
  if not DirectoryExists(ADir) then
     ForceDirectories(ADir);

  FFile := TDbtFile.Create(FFileName);
  FFile.Write('<?xml version="1.0" encoding="UTF-8"?>');
  FFile.Write(Format('<dataroot xmlns:od="urn:schemas-microsoft-com:officedata" generated="%s">',
    [IQMS.Common.Dates.XMLDateTimeStr(IQMS.Common.Dates.IQOracleAdjustedDateTime)]));
end;

procedure TXMLSimpleWrite.AddRecord(AChunk: TStringList);
var
   i: Integer;
   AName, AValue, ATag: String;
begin
  if not FValidParams or not Assigned(FFile) then
     Exit;

    { The final record will look similar to this:

        <ARCUSTO>
        <CUSTNO>PEP01</CUSTNO>
        <COMPANY>PEPSI-COLA COMPANY</COMPANY>
        <ADDR1>500 PEPSI WAY</ADDR1>
        </ARCUSTO>
        
    }

  FFile.Write(Format('<%s>',[FTableName]));
  for i := 0 to AChunk.Count - 1 do
   begin
     IQMS.Common.StringUtils.GetNameValuePair(AChunk.Strings[i], AName, AValue);
     FFile.Write(Format('<%s>%s</%s>',[AName, AValue, AName]));
   end;
  FFile.Write(Format('</%s>',[FTableName]));

  // Increment the record count
  Inc(FRecordCount);
  
end;

procedure TXMLSimpleWrite.AddFooter;
begin
  if not FValidParams or not Assigned(FFile) then
     Exit;
  FFile.Write('</dataroot>');
end;

end.
