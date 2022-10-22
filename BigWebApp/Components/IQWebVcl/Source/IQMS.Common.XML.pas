unit IQMS.Common.XML;

interface

uses
   System.Classes, System.SysUtils, System.StrUtils, Xml.XMLIntf, Xml.XMLDoc, Xml.xmldom;

{$REGION 'TXMLNodeHelper'}


type
  TIQWebXMLNodeHelper = class(TComponent)
    class function SelectNodes(AParentNode: IXmlNode; const ANodePath: string)
      : IXMLNodeList;
    class function FindNodeByName(const AParentNode: IXmlNode;
      const AName: String;
      var AFoundNode: IXmlNode): Boolean;
  end;

{$ENDREGION 'TXMLNodeHelper'}

function XMLSchemaFileNameFor(const AXMLFileName: String): String;
function XMLEncode(const AValue: String): String; overload;
function XMLEncode(const AValue: String; const ASkipChar: array of Char): String; overload;
function XMLDecode(const AValue: String): String;
procedure FormatXML(const AText: string; var AResult: TStringList);
procedure ViewXML(AOwner: TComponent; AXML: string);

{$REGION 'Simple Text'}
/// <summary>Find a value inside an XML string</summary>
/// <param name="AFullXMLText>The full text of the XML document.
/// </param>
/// <param name="ATagPath>XML path within document.
/// </param>
/// <returns>Returns tag value</returns>
/// <comments>The path may include multiple elements separated by a slash,
/// such as 'RatedShipment\Service\Code\'</comments>
function GetXMLTagValue(AFullXMLText: String; ATagPath: String): String;

/// <summary>Find a value inside an XML string following a strict path.
/// Each element of the path must exist in sequence in order to return
/// a value.</summary>
/// <param name="AFullXMLText>The full text of the XML document.
/// </param>
/// <param name="ATagPath>XML path within document.
/// </param>
/// <returns>Returns tag value</returns>
/// <comments>The path may include multiple elements separated by a slash,
/// such as 'RatedShipment\Service\Code\'</comments>
function GetXMLTagValueStrict(AFullXMLText: String;
  ATagPath: String): String;

/// <summary>Converts URI tags to standard XML tags</summary>
/// <param name="AFullXMLText>The full text of the XML document.
/// </param>
/// <returns>Returns XML with standard XML tags</returns>
function ParseFromURI(AFullXMLText: String): String;

/// <summary>Return a flat list of tags</summary>
/// <param name="AFullXMLText>The full text of the XML document.
/// </param>
/// <param name="AList>The TStringList to populate.
/// </param>
procedure ListTags(const AFullXMLText: String;
  var AList: TStringList);

{$ENDREGION 'Simple Text'}

{$REGION 'Global constants'}


const
  SCHEMA_FILE_EXT = '.XSD';
  XML_FILE_EXT = '.XML';

{$ENDREGION 'Global constants'}

implementation

uses
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.xmlView;

{$REGION 'Encode/Decode constants'}


type
  TCharPairs = array [0 .. 1] of String;

const
  XMLCharPairs: array [0 .. 87] of TCharPairs =
    (
    ('&nbsp;', #32),
    ('&apos;', ''''),
    ('&quot;', '"'),
    ('&amp;', '&'),
    ('&brvbar;', '¦'),
    ('&iquest;', '¿'),
    ('&lt;', '<'),
    ('&gt;', '>'),
    ('&plusmn;', '±'),
    ('&laquo;', #147),
    ('&raquo;', #148),
    ('&cent;', '¢'),
    ('&pound;', '£'),
    ('&yen;', '¥'),
    ('&sect;', '§'),
    ('&reg;', '®'),
    ('&deg;', '°'),
    ('&micro;', 'µ'),
    ('&para;', #20),
    ('&middot;', '·'),
    ('&frac14;', '¼'),
    ('&frac12;', '½'),
    ('&frac34;', '¾'),
    ('&sup1;', '¹'),
    ('&sup2;', '²'),
    ('&sup3;', '³'),
    ('&Aacute;', 'Á'),
    ('&aacute;', 'á'),
    ('&Agrave;', 'À'),
    ('&agrave;', 'à'),
    ('&Acirc;', 'Â'),
    ('&acirc;', 'â'),
    ('&Auml;', 'Ä'),
    ('&auml;', 'ä'),
    ('&Atilde;', 'Ã'),
    ('&atilde;', 'ã'),
    ('&Aring;', 'Å'),
    ('&aring;', 'å'),
    ('&AElig;', 'Æ'),
    ('&aelig;', 'æ'),
    ('&Ccedil;', 'Ç'),
    ('&ccdil;', 'ç'),
    ('&ETH;', 'Ð'),
    ('&eth;', 'ð'),
    ('&Eacute;', 'É'),
    ('&eacute;', 'é'),
    ('&Egrave;', 'È'),
    ('&egrave;', 'è'),
    ('&Ecirc;', 'Ê'),
    ('&ecirc;', 'ê'),
    ('&Euml;', 'Ë'),
    ('&euml;', 'ë'),
    ('&Iacute;', 'Í'),
    ('&iacute;', 'í'),
    ('&Igrave;', 'Ì'),
    ('&igrave;', 'ì'),
    ('&Icirc;', 'Î'),
    ('&icirc;', 'î'),
    ('&Iuml;', 'Ï'),
    ('&iuml;', 'ï'),
    ('&Ntilde;', 'Ñ'),
    ('&ntilde;', 'ñ'),
    ('&Oacute;', 'Ó'),
    ('&oacute;', 'ó'),
    ('&Ograve;', 'Ò'),
    ('&ograve;', 'ò'),
    ('&Ocirc;', 'Ô'),
    ('&ocirc;', 'ô'),
    ('&Ouml;', 'Ö'),
    ('&ouml;', 'ö'),
    ('&Otilde;', 'Õ'),
    ('&otilde;', 'õ'),
    ('&Oslash;', 'Ø'),
    ('&oslash;', 'ø'),
    ('&szlig;', 'ß'),
    ('&THORN;', 'Þ'),
    ('&thorn;', 'þ'),
    ('&Uacute;', 'Ú'),
    ('&uacute;', 'ú'),
    ('&Ugrave;', 'Ù'),
    ('&ugrave;', 'ù'),
    ('&Ucirc;', 'Û'),
    ('&ucirc;', 'û'),
    ('&Uuml;', 'Ü'),
    ('&uuml;', 'ü'),
    ('&Yacute;', 'Ý'),
    ('&yacute;', 'ý'),
    ('&yuml;', 'ÿ'));

  XMLLimitedCharPairs: array [0 .. 7] of TCharPairs =
    (
    ('&apos;', ''''),
    ('&quot;', '"'),
    ('&amp;', '&'),
    ('&lt;', '<'),
    ('&gt;', '>'),
    ('&laquo;', #147),
    ('&raquo;', #148),
    ('&para;', #20));

  XMLSkipChar: array [0 .. 6] of Char =
    ('"',
    '<',
    '>',
    '!',
    '?',
    #$0A,
    #$0D);

{$ENDREGION 'Encode/Decode constants'}

{$REGION 'TXMLNodeHelper'}
  { TXMLNodeHelper }

class function TIQWebXMLNodeHelper.SelectNodes(AParentNode: IXmlNode;
  const ANodePath: string): IXMLNodeList;
var
  intfSelect: IDomNodeSelect;
  intfAccess: IXmlNodeAccess;
  dnlResult: IDomNodeList;
  intfDocAccess: IXmlDocumentAccess;
  doc: TXmlDocument;
  i: Integer;
  dn: IDomNode;
begin
  Result := nil;
  if not Assigned(AParentNode)
    or not Supports(AParentNode, IXmlNodeAccess, intfAccess)
    or not Supports(AParentNode.DOMNode, IDomNodeSelect, intfSelect) then
    Exit;

  dnlResult := intfSelect.SelectNodes(ANodePath);
  if Assigned(dnlResult) then
    begin
      Result := TXmlNodeList.Create(intfAccess.GetNodeObject, '', nil);
      if Supports(AParentNode.OwnerDocument, IXmlDocumentAccess,
        intfDocAccess) then
        doc := intfDocAccess.DocumentObject
      else
        doc := nil;

      for i := 0 to dnlResult.length - 1 do
        begin
          dn := dnlResult.item[i];
          Result.Add(TXmlNode.Create(dn, nil, doc));
        end;
    end;
end;

class function TIQWebXMLNodeHelper.FindNodeByName(const AParentNode: IXmlNode;
  const AName: String;
  var AFoundNode: IXmlNode): Boolean;
// ---------------------------------------------------------------------------
  function _Find(const ANextParentNode: IXmlNode): IXmlNode;
  var
    i: Integer;
    oChild: IXmlNode;
  begin
    Result := NIL;
    if ANextParentNode = NIL then
      Exit;

    if CompareText(ANextParentNode.LocalName, AName) = 0 then
      begin
        Result := ANextParentNode;
        Exit;
      end;

    // We test for length.  If the count is > 500, then we can be
    // sure that we have passed the informational sections, and we
    // are now cycling records.  We want to avoid cycling hundreds
    // of records, in case we did not find the node we want.
    if ANextParentNode.ChildNodes.Count < 500 then
      for i := 0 to ANextParentNode.ChildNodes.Count - 1 do
        begin

          oChild := ANextParentNode.ChildNodes.Get(i);

          // Check if this is the schema node
          if (LowerCase(oChild.LocalName) = LowerCase(AName)) or
            (Pos(LowerCase(AName), LowerCase(oChild.NodeName)) > 0) then
            begin
              Result := oChild;
              Break
            end;

          Result := _Find(oChild); // recurse

          if Result <> NIL then
            Break;
        end;
  end;

// ---------------------------------------------------------------------------
begin
  AFoundNode := _Find(AParentNode);
  Result := AFoundNode <> NIL;
end;

{$ENDREGION 'TXMLNodeHelper'}


function XMLSchemaFileNameFor(const AXMLFileName
  : String): String;
begin
  Result := AXMLFileName;
  if (UpperCase(ExtractFileExt(AXMLFileName)) = XML_FILE_EXT) then
    Result := ChangeFileExt(AXMLFileName, LowerCase(SCHEMA_FILE_EXT));
end;

function XMLEncode(const AValue: String): String;
begin
  Result := XMLEncode(AValue, XMLSkipChar);
end;

function XMLEncode(const AValue: String; const ASkipChar: array of Char): String;
var
  ATmp, ATmpR: String;
  i: Integer;
  // ---------------------------------------------------------------------------
  function _get(const C: Char; var S: String): Boolean;
  var
    j: Integer;
  begin
    Result := False;
    S := C;
    for j := 0 to High(XMLLimitedCharPairs) do
      begin
        if (C = XMLLimitedCharPairs[j, 1]) then
          begin
            S := XMLLimitedCharPairs[j, 0];
            Result := True;
            Break;
          end;
      end;
  end;
// ---------------------------------------------------------------------------
  function _Skip(const C: Char): Boolean;
  var
    j: Integer;
  begin
    Result := False;
    for j := 0 to High(ASkipChar) do
      if ASkipChar[j] = C then
        begin
          Result := True;
          Break;
        end;
  end;

// ---------------------------------------------------------------------------
begin
  // initialize
  Result := '';

  for i := 1 to length(AValue) do
    begin
      // skip this character?
      if _Skip(AValue[i]) then
        Continue
        // check for character pair; if found, convert it.
      else if _get(AValue[i], ATmp) then
        Result := Result + ATmp
      else
        // default: return the text, but first encode it.
        // Since this unit handles exporting text, we must
        // encode to UTF-8.
        Result := Result + System.UTF8Encode(AValue[i]);
    end;
end;

function XMLDecode(const AValue: String): String;
var
  i: Integer;
  S: String;
  C: Char;
begin
  // This function "decodes" XML text.  It simply changes the character pairs
  // to a usable form.  Note:  Do not call System.UTF8Decode() since this will
  // only create problems.  It creates problems because we parse XML files
  // using XML Partner components.  The XML Partner components decode the text
  // before it gets here, so we do not need to decode anything.
  Result := AValue;
  for i := 0 to High(XMLCharPairs) do
    Result := IQMS.Common.StringUtils.StrTran(Result, XMLCharPairs[i, 0], XMLCharPairs[i, 1]);
end;

procedure FormatXML(const AText: string; var AResult: TStringList);
var
  ADecodedXML: string;
begin
  ADecodedXML := XMLDecode(AText);
  AResult.Text := Xml.XMLDoc.FormatXMLData(ADecodedXML);
end;

procedure ViewXML(AOwner: TComponent; AXML: string);
begin
  IQMS.Common.xmlView.TFrmXMLViewer.DoShow(AXML);
end;

{$REGION 'Simple Text'}


function GetXMLTagValue(AFullXMLText: String; ATagPath: String): String;
var
  i, iStart, iStartEndTag, iEnd: Integer;
  ATags: TStringList;
  ATempXML, ATempTag: String;

  function _PosNextEndCaret(const AStartPos: Integer): Integer;
  begin
    Result := System.StrUtils.PosEx('>', ATempXML, AStartPos);
  end;

begin
  // This method gets the value for a particular tag

  // Initialization
  Result := ''; // initial
  iStart := 0; // initial
  iEnd := 0; // initial

  // Validation
  if Trim(AFullXMLText) = '' then
    Exit;

  // 1.) Build string list of tags (passed to this function)
  // Temporary string list for the tags
  ATags := TStringList.Create;
  try
    // Cycle tag list and build values
    if IQMS.Common.StringUtils.NumToken(ATagPath, '\') = 0 then
      ATags.Add(ATagPath)
    else
      for i := 1 to IQMS.Common.StringUtils.NumToken(ATagPath, '\') do
        ATags.Add(IQMS.Common.StringUtils.GetToken(ATagPath, '\', i));

    // 2.) Initialize the temporary string which will be
    // modified as the tags are cycled.
    ATempXML := AFullXMLText;

    // 3.) Find each tag in the string.  The temporary string
    // is gradually diminished so that all that remains
    // is the desired string.
    for i := 0 to ATags.Count - 1 do
      begin
        // The next tag to find
        ATempTag := ATags.Strings[i];
        // Get the starting position of the tag.  Note: we do
        // not include the trailing caret.
        iStart := Pos(Format('<%s', [ATempTag]), ATempXML);
        // If this tag was not found, then we must exit
        if iStart = 0 then
          Exit;
        // Get the end of the starting tag.  The method below
        // searches for the end-caret (>).  This will always be
        // the next end-caret (>) character to be found in the
        // temporary string.
        iStartEndTag := _PosNextEndCaret(iStart);
        // Get the end of the starting tag.  We don't want to include
        // the starting tag; we want the text that follows it.
        iStart := iStartEndTag + 1;
        // Now, find the ending tag.
        iEnd := Pos(Format('</%s>', [ATempTag]), ATempXML);
        // Copy the text between the end of the starting tag
        // and the beginning of the ending tag.  What returns
        // is our working text, which we will modify if there
        // are additional tags.  If there are no more tags to
        // find, then this is the desired text.
        ATempXML := Trim(Copy(ATempXML, iStart, iEnd - iStart));
        // Apply the result only if this is the last tag
        if i = ATags.Count - 1 then
          Result := ATempXML;
      end;
  finally
    ATags.Free;
  end;
end;

function GetXMLTagValueStrict(AFullXMLText: String;
  ATagPath: String): String;
VAR
  DOM: IXMLDocument;
  Node: IXMLNode;
  sl: TStringList;
  i: Integer;


  function _GetNextChildNode(AParentNode: IXMLNode; ANodeName: string;
   var AChildNode: IXMLNode): Boolean;
  var
    i: Integer;
    ATempChild: IXMLNode;
  begin
    AChildNode := nil;
    for i := 0 to AParentNode.ChildNodes.Count - 1 do
      begin
        ATempChild := AParentNode.ChildNodes.Get(i);
        if (ATempChild = nil) then
          Break;
        // Check if this is the schema node
        if (CompareText(ATempChild.LocalName, ANodeName) = 0) then
          begin
            AChildNode := ATempChild;
            Break
          end;
      end;
    Result := AChildNode <> nil;
  end;


begin
  // Initialize
  Result := '';
  // Create the DOM.  Please note that we do not free the DOM because
  // it is an interface and does not support being freed.  It will
  // be freed by Delphi.
  DOM := TXMLDocument.Create(nil);
  DOM.LoadFromXML(AFullXMLText);
  // The string list will contain each element of the path that needs
  // to be followed.
  sl := TStringList.Create;
  try
    // We obtain a list by parsing based on the delimiter
    sl.Text := IQMS.Common.StringUtils.StrTran(ATagPath, '\', #13);
    // If we have a valid path, then proceed
    if sl.Count > 0 then
      begin
        // First, try to find the first node.  If the very first node
        // does not exist, then there's no point in continuing.
        if not TIQWebXMLNodeHelper.FindNodeByName(DOM.DocumentElement,
          sl.Strings[0], Node) then
          // The first node was not found; exit now.
          Exit;
        // If there is only one element in the path, then just grab
        // the first node that was found, and exit.
        if (sl.Count = 1) then
          begin
            Result := Node.Text;
            // Done
            Exit;
          end;
        // Loop the path elements, starting with the second element (since
        // we have already grabbed the first node).
        for i := 1 to sl.Count - 1 do
          begin
            // If the requested path element is not the next node in the
            // sequence, then stop looping and exit.  If this occurs
            // (meaning, it was not found), then the path does not exist,
            // in the strictest sense.  We want an exact, sequential path,
            // with no skips.  Show no mercy.
            if not _GetNextChildNode(Node,
              sl.Strings[i], Node) then
              // Out of here!
              Break;
            // If this is the last element in the path, then the path
            // sequence was found, and we can return the value of the
            // last node.
            if i = sl.Count - 1 then
              // Return the value; we are done.
              Result := Node.Text
          end;
      end;
  finally
    sl.Free;
  end;
end;

function ParseFromURI(AFullXMLText: String): String;
var
  ATemp: Char;
  i: Integer;
  // ---------------------------------------------------------------------------
  procedure _Append(const C: Char);
  begin
    Result := Result + C;
  end;
// ---------------------------------------------------------------------------
  function _GetTagChar(var C: Char): Boolean;
  var
    n: Integer;
  begin
    Result := False;
    C := #0;
    try
      if (i > 0) and (i + 2 <= length(AFullXMLText)) then
        begin
          n := HexToInt(AFullXMLText[i + 1] + AFullXMLText[i + 2]);
          if (n in [0 .. 255]) then
            C := Chr(n);
        end;
      Result := C > #0;
    except
      Result := False;
    end;
  end;

// ---------------------------------------------------------------------------
begin

  // Initialization
  Result := '';
  i := 1;
  ATemp := #0;

  // If empty, then exit
  if Trim(AFullXMLText) = '' then
    Exit;

  // loop text, replacing Hex tags
  repeat

    if (AFullXMLText[i] = '%') and _GetTagChar(ATemp) then
      begin
        _Append(ATemp);
        i := i + 3;
        Continue;
      end
    else
      begin
        _Append(AFullXMLText[i]);
        Inc(i);
      end;

  until i >= length(AFullXMLText);

end;

procedure ListTags(const AFullXMLText: String;
  var AList: TStringList);
var
  i: Integer;
  ATagFound: Boolean;
  ATagName: String;
begin
  if not Assigned(AList) then
    Exit;

  // Initialization
  ATagName := '';
  ATagFound := False;

  // If empty, then exit
  if Trim(AFullXMLText) = '' then
    Exit;

  // loop text, replacing Hex tags
  for i := 1 to length(AFullXMLText) do
    begin

      if (AFullXMLText[i] = '<') and not ATagFound then
        ATagFound := True;

      if ATagFound then
        begin
          ATagName := ATagName + AFullXMLText[i];
          if ATagName = '</' then
            begin
              ATagName := '';
              ATagFound := False;
            end;
        end;

      if (AFullXMLText[i] = '>') and ATagFound then
        begin
          AList.Add(ATagName);
          ATagName := '';
          ATagFound := False;
        end;
    end;
end;

{$ENDREGION 'Simple Text'}

end.
