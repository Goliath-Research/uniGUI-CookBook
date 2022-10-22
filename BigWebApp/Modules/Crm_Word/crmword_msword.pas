unit crmword_msword;

(* -----------------------------------------------------------------------------

  *** Microsoft Word Mail Merge ***

  This unit contains methods which handle all mail merge connections to
  Microsoft Word.  The dataset to be merged must already exist on the
  computer disk before the methods in this unit are called.  A Microsoft
  Word document is created, and a mail merge connection to the external
  data is established.

  ---------------------------------------------------------------------------- *)

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Buttons,
  Data.Win.ADODB,
  System.Win.ComObj,
  System.Variants,
  IQMS.Common.Registry,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule,
  IQMS.Web.MicrosoftWord,
  IQMS.Web.MicrosoftWord.Interop,
  IQMS.Web.MicrosoftWord.Types;

type
  { TOnStatusText }
  TOnStatusText = procedure(const AStatusMsg: string) of object;

  { TWordMailMerge }
  TWordMailMerge = class(TMicrosoftWordInterop)
    private
      { Private declarations }
      FOverwrite: Boolean;
      FDocumentName: string;
      FDatabaseName: string;
      FTableName: string;
      FTemplateName: string;
      FConnected: Boolean;
      FOnStatusText: TOnStatusText;
      FVersion: Integer;
{$IFDEF UNICODE}
      FDSN: AnsiString;
{$ELSE}
      FDSN: string;
{$ENDIF}
      // function MicrosoftWordVersion: Integer;
      // function Connect(var AWordAlreadyOpen: Boolean): Boolean;
      // procedure Disconnect;
      // procedure SetConnected(const Value: Boolean);
{$IFDEF UNICODE}
      procedure GetConnectionString(var AConnectionString: AnsiString);
      procedure SetConnection(const AConnectionString: AnsiString);
{$ELSE}
      procedure GetConnectionString(var AConnectionString: string);
      procedure SetConnection(const AConnectionString: string);
{$ENDIF}
    protected
      { Protected declarations }
      // MicrosoftWord: OLEVariant; // Microsoft Word OLE Server
      procedure ValidateMicrosoftWordVersion;
      procedure UpdateStatusText(const AStatusMsg: string);

    public
      { Public declarations }
      constructor Create(AOwner: TComponent);
      destructor Destroy; override;
      procedure Execute;

      // procedure NewDocument;
      // procedure OpenDocument;
      // procedure SaveDocument;
      // procedure SaveAsDocument(const ANewName: string);
      // procedure CloseDocument;

      procedure AssociateMergeSource;

    published
      { Published declarations }

      { The properties, ConnectionName and DocumentName, are required.  The
        TableName is required only if you are using a Microsoft Access
        database.  And of course the datasource for the merge must
        already exist, since this unit merely creates the merge document. }

      // DSN Name.  This is the DSN name used when building the
      // connection string.  It is only used when working with Word 2000.
{$IFDEF UNICODE}
      property DSN: AnsiString read FDSN write FDSN;
{$ELSE}
      property DSN: string read FDSN write FDSN;
{$ENDIF}
      // File name or database name, as applicable (required)
      property DatabaseName: string read FDatabaseName write FDatabaseName;
      // Table name in database, if applicable (optional)
      property TableName: string read FTableName write FTableName;
      // File name and path of the Microsoft Word document (required)
      property DocumentName: string read FDocumentName write FDocumentName;
      // Microsoft Word Template, if desired (optional)
      property TemplateName: string read FTemplateName write FTemplateName;
      // Overwrite the document?  If True, then the Microsoft Word document,
      // as provided in the DocumentName property, will first be deleted.
      property Overwrite: Boolean read FOverwrite write FOverwrite;

      // property Connected: Boolean read FConnected write SetConnected;

      { Methods }
      property OnStatusText: TOnStatusText read FOnStatusText
        write FOnStatusText;

  end;

implementation

uses
  crm_rscstr,
  IQMS.Common.ErrorDialog,
  IQMS.Common.FileUtils,
  { TODO -omugdha : Dependancy IQMS.Common.Registry,}
  IQMS.Common.StringUtils;

{ TWordMailMerge }

constructor TWordMailMerge.Create(AOwner: TComponent);
begin
  inherited Create;

  // Initialization
  FDSN := '';
  FDatabaseName := '';
  FTableName := '';
  FDocumentName := '';
  FTemplateName := '';
  FOverwrite := False;
  FVersion := 0;
end;

destructor TWordMailMerge.Destroy;
begin
  inherited Destroy;
end;

procedure TWordMailMerge.Execute;
var
  AWordAlreadyOpen: Boolean;
  ACreateNew: Boolean;
begin
  // Ensure the Microsoft Word version is compatible (see below)
  ValidateMicrosoftWordVersion;

  UpdateStatusText
    (crm_rscstr.cTXT0000168 { 'Connecting to Microsoft Word ...' } );

  if not TryConnect(AWordAlreadyOpen) then
    Exit;

  try
    // The current version of OfficePartner supports passing a
    // template.  But this only works for 2000 and XP.
    // It is simpler to go the long route, and do it this way.
    // 01/28/2014 Do not turn off screen updating because Word
    // will always prompt.
    // EIQ-2113  CRM Mail Merge, Office 2010 Issue
    // MicrosoftWord.ScreenUpdating := False;

    // Create New if the file does not exist, or if it does exist, the
    // user wants to overwrite it.
    ACreateNew := not FileExists(DocumentName) or
      (FileExists(DocumentName) and Overwrite);

    // User does not want to create a new document (or overwrite an existing one)
    // nor does he want to verify the document database.  That means there is
    // nothing to do here.
    // if not ACreateNew and not FExportOptions.VerifyDocumentDataSource then Exit;

    if ACreateNew then
      begin
        NewDocument; // create a new document
        //Set the document type
        Application.ActiveDocument.MailMerge.MainDocumentType := TWdMailMergeMainDocType.wdFormLetters;
      end
    else
      OpenDocument(DocumentName); // open existing document

    // Set the mail merge datasource
    AssociateMergeSource;

    UpdateStatusText
      (crm_rscstr.cTXT0000171 { 'Saving and closing Mail Merge document...' } );

    if ACreateNew then
      SaveAsDocument(DocumentName)
    else
      SaveDocument;

    CloseDocument;

  finally
    UpdateStatusText(crm_rscstr.cTXT0000172 { 'Almost done...' } );
    // MicrosoftWord.ScreenUpdating := True;
    if not AWordAlreadyOpen then
      Disconnect;
  end;
end;

procedure TWordMailMerge.ValidateMicrosoftWordVersion;
begin
  if Version < 9 then
    // 'Current version of Microsoft Word not supported.'
    raise Exception.Create(crm_rscstr.cTXT0000167);
end;

procedure TWordMailMerge.UpdateStatusText(const AStatusMsg: string);
begin
  // Update status text
  if Assigned(FOnStatusText) then
    FOnStatusText(AStatusMsg);
end;

procedure TWordMailMerge.AssociateMergeSource;
var
{$IFDEF UNICODE}
  AConnectionString: AnsiString;
{$ELSE}
  AConnectionString: string;
{$ENDIF}
begin
  GetConnectionString(AConnectionString);
  SetConnection(AConnectionString);
end;

procedure TWordMailMerge.GetConnectionString;
begin
  // Get the connection string which is appropriate for Word version and
  // for the datasource.

  // Initialize
  AConnectionString := '';

  // Check Microsoft Word Version
  if Version < 9 then
    Exit;

  // Microsoft Excel
  if Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.XLS' then
    AConnectionString := TableName

    // Paradox or DBase
  else if (Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.DBF') or
    (Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.DB') then
    AConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Password='''';' + 'User ID=Admin;' + 'Data Source=%s;' + 'Mode=Read;',
      [ExtractFilePath(DatabaseName)])
    // CSV
  else if (Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.CSV') then
    AConnectionString := ''

    // Microsoft Access database
  else if (Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.MDB') then
    AConnectionString := Format('TABLE %s', [TableName])

    // Default
  else
    AConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Password='''';' + 'User ID=Admin;' + 'Data Source=%s;' + 'Mode=Read;',
      [DatabaseName]);

end;

procedure TWordMailMerge.SetConnection;
var
{$IFDEF UNICODE}
  ASQLStatement: AnsiString;
{$ELSE}
  ASQLStatement: string;
{$ENDIF}
begin
  // Check Microsoft Word Version
  if Version < 9 then
    Exit;

  // Microsoft Excel
  if Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.XLS' then
    ASQLStatement := Format('SELECT * FROM `%s`', [TableName])

    // Paradox or DBase
  else if (Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.DBF') or
    (Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.DB') then
    ASQLStatement := Format('SELECT * FROM `%s`', [FileNameNoExt(DatabaseName)])

    // CSV
  else if (Trim(UpperCase(ExtractFileExt(DatabaseName))) = '.CSV') then
    ASQLStatement := ''

    // All others, including Microsoft Access (.MDB)
  else
    ASQLStatement := Format('SELECT * FROM `%s`', [TableName]);

  // Apply mail merge settings
  Application.ActiveDocument.MailMerge.OpenDataSource(
    Name := DatabaseName,
    ConfirmConversions := False,
    ReadOnly := False,
    LinkToSource := True,
    Connection := AConnectionString,
    SQLStatement := ASQLStatement,
    SubType := wdMergeSubTypeAccess);
end;

end.
