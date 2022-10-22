unit IQMS.Web.MicrosoftWord.Utils;

interface

uses
  System.SysUtils, System.Classes;

function IsMicrosoftWordInstalled: Boolean;

/// <summary> Create a new document and insert the contents of another file into
/// the new document.
/// </summary>
procedure CreateDocumentInsertFile(const ANewDocumentName, ATemplateName,
  AInsertFileName: string); overload;

/// <summary> Create a new document and insert the contents of another file into
/// the new document.
/// </summary>
procedure CreateDocumentInsertFile(const ANewDocumentName, ATemplateName: string;
  AInsertFileNames: TStringList); overload;

/// <summary> Print a document through Microsoft Word. </summary>
function PrintMSWordDoc(const AFileName: string): Boolean;

/// <summary> Compare two documents using Microsoft Word. </summary>
procedure CompareMSWordDocuments(const AFileName1: string; const AFileName2: string);

/// <summary> Convert a document to HTML using Microsoft Word. </summary>
procedure ConvertDocumentToHTML(const ADocFileName, AHtmFileName: string);

implementation

uses
  IQMS.Web.MicrosoftWord,
  IQMS.Web.MicrosoftWord.Interop,
  IQMS.Web.MicrosoftWord.Types,
  System.Variants;

var
  // Stored internally to keep track of version
  FMicrosoftWordInstalled: ShortInt;

function IsMicrosoftWordInstalled: Boolean;
var
  MicrosoftWord: IMicrosoftWord;
begin
  // If the version has not been checked yet, then check it
  if FMicrosoftWordInstalled = -1 then
    begin
      MicrosoftWord := TMicrosoftWordInterop.Create;
      // Assign internal variable with result
      FMicrosoftWordInstalled := Integer(MicrosoftWord.IsInstalled);
    end;
  // Return true if Microsoft Word is installed
  Result := FMicrosoftWordInstalled = 1;
end;

procedure CreateDocumentInsertFile(const ANewDocumentName, ATemplateName,
  AInsertFileName: string);
var
  AInsertFileNames: TStringList;
begin
  AInsertFileNames := TStringList.Create;
  try
    AInsertFileNames.Add(AInsertFileName);
    CreateDocumentInsertFile(
      ANewDocumentName,
      ATemplateName,
      AInsertFileNames);
  finally
    AInsertFileNames.Free;
  end;
end;

procedure CreateDocumentInsertFile(const ANewDocumentName, ATemplateName: string;
  AInsertFileNames: TStringList);
var
  I: Integer;
  MicrosoftWord: IMicrosoftWord;
begin
  MicrosoftWord := TMicrosoftWordInterop.Create;
  if MicrosoftWord.Connect then
  begin
    //Close Doc wiith ANewDocumentName if open
    if (MicrosoftWord.Application.Documents.Count > 0) then
      for I := MicrosoftWord.Application.Documents.Count downto 1 do
        if CompareText(MicrosoftWord.Application.Documents.Item(I).FullName, ANewDocumentName) = 0
        then
          MicrosoftWord.Application.Documents.Item(I).Close(TWdSaveOptions.wdDoNotSaveChanges);

    MicrosoftWord.Application.Visible := True;

    //Create From Template
    if ATemplateName > '' then
      MicrosoftWord.Application.Documents.Add(ATemplateName, False)
    else
      MicrosoftWord.Application.Documents.Add;

    //Move to bookmark
    if MicrosoftWord.Application.ActiveDocument.BookMarks.Count > 0 then
      MicrosoftWord.Application.ActiveDocument.BookMarks.Item(1).Select
    else
      MicrosoftWord.Application.ActiveDocument.BookMarks.Item('\StartOfDoc').Select;

    //Insert files from list.  Each item is a file name
    for I := 0 to AInsertFileNames.Count - 1 do
    begin
      MicrosoftWord.Application.Selection.InsertFile(AInsertFileNames.Strings[I], '', False,
        False, False);
    end;

    MicrosoftWord.Application.ActiveDocument.SaveAs(ANewDocumentName,
      TWdSaveFormat.wdFormatDocument);
  end;
end;

function PrintMSWordDoc(const AFileName: string): Boolean;
const
  //Background Printing:
  //False = macro does not run while Microsoft Word prints the document
  DO_NOT_BACKGROUND_PRINT: Boolean = False;
var
  MicrosoftWord: IMicrosoftWord;
begin
  Result := False;
  MicrosoftWord := TMicrosoftWordInterop.Create;
  if MicrosoftWord.Connect then
    try
      MicrosoftWord.OpenDocument(AFileName, True);
      MicrosoftWord.Application.ActiveDocument.PrintOut(DO_NOT_BACKGROUND_PRINT);
      Result := True;
    finally
      MicrosoftWord.Disconnect;
    end;
end;

procedure CompareMSWordDocuments(const AFileName1: string; const AFileName2: string);
var
  OrigDoc: OLEVariant;
  NewDoc: OLEVariant;
  MicrosoftWord: IMicrosoftWord;
begin
  MicrosoftWord := TMicrosoftWordInterop.Create;
  if MicrosoftWord.Connect then
    try
      //Hide word
      MicrosoftWord.Application.Visible := False;
      try
        //Open first File
        OrigDoc := MicrosoftWord.Application.Documents.Open(AFileName1,
          , //AFileName1ConfirmConversions
          True, //ReadOnly
          , //AddToRecentFiles
          , //PasswordDocument
          , //PasswordTemplate
          , //Revert
          , //WritePasswordDocument
          , //WritePasswordTemplate
          , //Format
          , //Encoding,
          True //Visible
          );

        NewDoc := MicrosoftWord.Application.Documents.Open(AFileName2,
          , //AFileName1ConfirmConversions
          True, //ReadOnly
          , //AddToRecentFiles
          , //PasswordDocument
          , //PasswordTemplate
          , //Revert
          , //WritePasswordDocument
          , //WritePasswordTemplate
          , //Format
          , //Encoding,
          True //Visible
          );
        //hide original doc
        OrigDoc.Windows.Item(1).Visible := False;
        NewDoc.Windows.Item(1).Visible := False;

        MicrosoftWord.Application.CompareDocuments(OrigDoc, NewDoc);

        OrigDoc.Close;
        NewDoc.Close;

        //make word visible
        if MicrosoftWord.Application.Connected then
          MicrosoftWord.Application.Visible := True;

        //make "save as" dialog not show when closing comparison doc
        MicrosoftWord.Application.ActiveDocument.Saved := True;
      except
        //make word visible
        if MicrosoftWord.Application.Connected then
          MicrosoftWord.Application.Visible := True;
        raise;
      end;
    finally
      if not VarIsClear(OrigDoc) then
        System.VarClear(OrigDoc);
      if not VarIsClear(NewDoc) then
        System.VarClear(NewDoc);
      MicrosoftWord.Disconnect;
    end;
end;

procedure ConvertDocumentToHTML(const ADocFileName, AHtmFileName: string);
var
  MicrosoftWord: IMicrosoftWord;
begin
  MicrosoftWord := TMicrosoftWordInterop.Create;
  if MicrosoftWord.Connect then
  try
    MicrosoftWord.OpenDocument(ADocFileName, False);
    MicrosoftWord.ActiveDocument.SaveAs(AHtmFileName, TWdSaveFormat.wdFormatHTML);
  finally
    MicrosoftWord.Disconnect;
  end;
end;

initialization
  FMicrosoftWordInstalled := -1;

end.
