unit crm_html;

interface

uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  Winapi.ActiveX,
  SHDocVw;

{ How to use:
  These functions create the standard format for search results.
  Each returns a stringlist for a given section of the page.
  To use these functions, create a TStringList object and pass it
  as a parameter.  First call the function to create the header.
  Then add the body text to the list, including headings and the like.
  After you have included the data to be displayed, call the function
  to create the footer.
}

procedure AddHTMLHeader(ATitle: String; var AStringList: TStringList);
procedure AddHTMLFooter(var AStringList: TStringList);

procedure AddTitle(ATitleText: String; var AStringList: TStringList);
procedure AddHeading1(AHeadingText: String; var AStringList: TStringList);
procedure AddHeading2(AHeadingText: String; var AStringList: TStringList);
procedure AddHeading3(AHeadingText: String; var AStringList: TStringList);
procedure AddBarHeading(AHeadingText: String; var AStringList: TStringList);

procedure AddHyperlinkListItem(ACaption, AHyperlink: String;
  var AStringList: TStringList);

procedure AddParagraph(AText: String; var AStringList: TStringList);
procedure AddParagraphNormal(AText: String; var AStringList: TStringList);
procedure AddNewLine(var AStringList: TStringList);
procedure AddLightBar(AStringList: TStringList);
procedure Add3DBar(AStringList: TStringList);

procedure LoadHTMLToWebBrowser(AWebBrowser: TWebBrowser; AHTML: TStringList);

type
  THTMLColor = type String;

type
  TRowCargo = class
    Caption: String;
    Text: String;
    BackColor: THTMLColor;
    HeadingRow: Boolean;
    BlankRow: Boolean;
    BottomBorder: Boolean;
    constructor Create(ACaption, AText: String; ABackColor: THTMLColor);
  end;

type
  TBorderLine = (blNone, blBottom);

  TTwoColumnTable = class(TComponent)
  private
    FRows: TList;
    FRowCount: Integer;
    procedure BuildRow(ACaption, AText: String; ARowCount: Integer;
      ALastRow: Boolean; ABackColor: THTMLColor; var ALines: TStringList;
      ABorderLine: TBorderLine = blNone);
    procedure BuildBlankRow(ABackColor: THTMLColor; ARowCount: Integer;
      ALastRow: Boolean; var ALines: TStringList);
    procedure BuildHeadingRow(ACaption: String; ABackColor: THTMLColor;
      ARowCount: Integer; ALastRow: Boolean; var ALines: TStringList);
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure AddRow(ACaption, AText: String;
      ABackgroundColor: THTMLColor = 'white';
      ABorderLine: TBorderLine = blNone); overload;
    procedure AddRow(ACaption: String; ADate: TDateTime;
      ADateFormat: String = 'c'; ABackgroundColor: THTMLColor = 'white';
      ABorderLine: TBorderLine = blNone); overload;
    procedure AddHeadingRow(ACaption: String;
      ABackgroundColor: THTMLColor = 'white'); overload;
    procedure AddHeadingRow(ADate: TDateTime; ADateFormat: String = 'c';
      ABackgroundColor: THTMLColor = 'white'); overload;
    procedure AddBlankRow(ABackgroundColor: THTMLColor = 'white');
    procedure GetHTMLText(var ALines: TStringList);
  published
    property RowCount: Integer read FRowCount;
  end;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.StringUtils;

procedure AddHTMLHeader(ATitle: String; var AStringList: TStringList);
begin
  with AStringList do
    begin
      Add('<html>                                                                  ');
      Add('<head>                                                                  ');
      Add('<meta http-equiv=Content-Type content="text/html">');
      // Add( '<link rel=File-List href="./Search%20Results_files/filelist.xml">       ' );
      Add(Format
        ('<title>%s</title>                                               ',
        [ATitle]));
      Add('<style>                                                                 ');
      Add('<!--                                                                    ');
      Add('@font-face                                                              ');
      Add('	{font-family:SimSun;                                                   ');
      Add('	panose-1:2 1 6 0 3 1 1 1 1 1;                                          ');
      Add('	mso-font-alt:\5B8B\4F53;                                               ');
      Add('	mso-font-charset:134;                                                  ');
      Add('	mso-generic-font-family:auto;                                          ');
      Add('	mso-font-pitch:variable;                                               ');
      Add('	mso-font-signature:3 135135232 16 0 262145 0;}                         ');
      Add('@font-face                                                              ');
      Add('	{font-family:Verdana;                                                  ');
      Add('	panose-1:2 11 6 4 3 5 4 4 2 4;                                         ');
      Add('	mso-font-charset:0;                                                    ');
      Add('	mso-generic-font-family:swiss;                                         ');
      Add('	mso-font-pitch:variable;                                               ');
      Add('	mso-font-signature:536871559 0 0 0 415 0;}                             ');
      Add('@font-face                                                              ');
      Add('	{font-family:"\@SimSun";                                               ');
      Add('	panose-1:2 1 6 0 3 1 1 1 1 1;                                          ');
      Add('	mso-font-charset:134;                                                  ');
      Add('	mso-generic-font-family:auto;                                          ');
      Add('	mso-font-pitch:variable;                                               ');
      Add('	mso-font-signature:3 135135232 16 0 262145 0;}                         ');
      Add(' /* Style Definitions */                                                ');
      Add(' p.MsoNormal, li.MsoNormal, div.MsoNormal                               ');
      Add('	{mso-style-parent:"";                                                  ');
      Add('	margin:0in;                                                            ');
      Add('	margin-bottom:.0001pt;                                                 ');
      Add('	mso-pagination:widow-orphan;                                           ');
      Add('	font-size:10.0pt;                                                      ');
      Add('	font-family:Verdana;                                                   ');
      Add('	mso-fareast-font-family:SimSun;                                        ');
      Add(' mso-bidi-font-family:"Verdana";}                                       ');
      Add('h1                                                                      ');
      Add('	{mso-style-next:Normal;                                                ');
      Add('	margin-top:12.0pt;                                                     ');
      Add('	margin-right:0in;                                                      ');
      Add('	margin-bottom:3.0pt;                                                   ');
      Add('	margin-left:0in;                                                       ');
      Add('	mso-pagination:widow-orphan;                                           ');
      Add('	page-break-after:avoid;                                                ');
      Add('	mso-outline-level:1;                                                   ');
      Add('	font-size:12.0pt;                                                      ');
      Add('	font-family:Arial;                                                     ');
      Add('	font-weight:bold;                                                      ');
      Add('	mso-font-kerning:16.0pt;}                                              ');
      Add('h2                                                                      ');
      Add('	{mso-style-next:Normal;                                                ');
      Add('	margin-top:12.0pt;                                                     ');
      Add('	margin-right:0in;                                                      ');
      Add('	margin-bottom:3.0pt;                                                   ');
      Add('	margin-left:0in;                                                       ');
      Add('	mso-pagination:widow-orphan;                                           ');
      Add('	page-break-after:avoid;                                                ');
      Add('	mso-outline-level:2;                                                   ');
      Add('	font-size:12.0pt;                                                      ');
      Add('	font-family:Arial;                                                     ');
      Add('	font-weight:bold;                                                      ');
      Add('	font-style:italic;}                                                    ');
      Add('h3                                                                      ');
      Add('	{mso-style-next:Normal;                                                ');
      Add('	margin-top:12.0pt;                                                     ');
      Add('	margin-right:0in;                                                      ');
      Add('	margin-bottom:3.0pt;                                                   ');
      Add('	margin-left:0in;                                                       ');
      Add('	mso-pagination:widow-orphan;                                           ');
      Add('	page-break-after:avoid;                                                ');
      Add('	mso-outline-level:3;                                                   ');
      Add('	font-size:10.0pt;                                                      ');
      Add('	font-family:Arial;                                                     ');
      Add('	font-weight:bold;}                                                     ');
      Add('h4                                                                      ');
      Add('	{mso-style-next:Normal;                                                ');
      Add('	margin-top:12.0pt;                                                     ');
      Add('	margin-right:0in;                                                      ');
      Add('	margin-bottom:3.0pt;                                                   ');
      Add('	margin-left:0in;                                                       ');
      Add('	mso-pagination:widow-orphan;                                           ');
      Add('	page-break-after:avoid;                                                ');
      Add('	mso-outline-level:4;                                                   ');
      Add('	font-size:10.0pt;                                                      ');
      Add('	font-family:"Times New Roman";                                         ');
      Add('	mso-fareast-font-family:"Times New Roman";                             ');
      Add('	font-weight:bold;}                                                     ');
      Add('p.MsoTitle, li.MsoTitle, div.MsoTitle                                   ');
      Add('	{margin-top:12.0pt;                                                    ');
      Add('	margin-right:0in;                                                      ');
      Add('	margin-bottom:3.0pt;                                                   ');
      Add('	margin-left:0in;                                                       ');
      Add('	text-align:center;                                                     ');
      Add('	font-size:16.0pt;                                                      ');
      Add('	font-family:Arial;                                                     ');
      Add('	font-weight:bold;}                                                     ');
      Add('p.MsoBodyText, li.MsoBodyText, div.MsoBodyText                          ');
      Add('	{margin-top:0in;                                                       ');
      Add('	margin-right:0in;                                                      ');
      Add('	margin-bottom:6.0pt;                                                   ');
      Add('	margin-left:0in;                                                       ');
      Add('	mso-pagination:widow-orphan;                                           ');
      Add('	font-size:10.0pt;                                                      ');
      Add('	font-family:"Verdana";                                                 ');
      Add('	mso-fareast-font-family:"Verdana";}                                    ');
      Add('a:link, span.MsoHyperlink                                               ');
      Add('	{color:#003399;                                                        ');
      Add('	text-decoration:underline;                                             ');
      Add('	text-underline:single;}                                                ');
      Add('a:visited, span.MsoHyperlinkFollowed                                    ');
      Add('	{color:purple;                                                         ');
      Add('	text-decoration:underline;                                             ');
      Add('	text-underline:single;}                                                ');
      Add('@page Section1                                                          ');
      Add('	{size:8.5in 11.0in;                                                    ');
      Add('	margin:1.0in 1.25in 1.0in 1.25in;                                      ');
      Add('	mso-header-margin:.5in;                                                ');
      Add('	mso-footer-margin:.5in;                                                ');
      Add('	mso-paper-source:0;}                                                   ');
      Add('div.Section1                                                            ');
      Add('	{page:Section1;}                                                       ');
      Add(' /* List Definitions */                                                 ');
      Add('@list l0                                                                ');
      Add('	{mso-list-id:1894385280;                                               ');
      Add('	mso-list-type:hybrid;                                                  ');
      Add('	mso-list-template-ids:225493184 67698703 67698713 67698715 67698703    ');
      Add('  67698713 67698715 67698703 67698713 67698715;}                        ');
      Add('ol                                                                      ');
      Add('	{margin-bottom:0in;}                                                   ');
      Add('ul                                                                      ');
      Add('	{margin-bottom:0in;}                                                   ');
      Add('-->                                                                     ');
      Add('</style>                                                                ');
      Add('</head>                                                                 ');
      Add('<body>                                                                  ');
      Add('<div class=Section1>                                                    ');
    end;
end;

procedure AddHTMLFooter(var AStringList: TStringList);
begin
  with AStringList do
    begin
      Add('<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>');
      Add('                                                                            ');
      Add('<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>');
      Add('                                                                            ');
      Add('</div>                                                                      ');
      Add('                                                                            ');
      Add('</body>                                                                     ');
      Add('                                                                            ');
      Add('</html>                                                                     ');
    end;
end;

procedure AddTitle(ATitleText: String; var AStringList: TStringList);
begin
  AStringList.Add(Format('<p class = MsoTitle>%s</MsoTitle>', [ATitleText]));
end;

procedure AddHeading1(AHeadingText: String; var AStringList: TStringList);
begin
  AStringList.Add(Format('<h1>%s</h1>', [AHeadingText]));
end;

procedure AddHeading2(AHeadingText: String; var AStringList: TStringList);
begin
  AStringList.Add(Format('<h2>%s</h2>', [AHeadingText]));
end;

procedure AddHeading3(AHeadingText: String; var AStringList: TStringList);
begin
  AStringList.Add(Format('<h3>%s</h3>', [AHeadingText]));
end;

procedure AddBarHeading(AHeadingText: String; var AStringList: TStringList);
begin
  with AStringList do
    begin
      { Add( '<table border=1 cellspacing=0 cellpadding=0 width="100%" bgcolor=silver                ' );
        Add( ' style=''width:100.0%;mso-cellspacing:0in;background:#E6E6E6;border:solid silver 1.0pt; ' );
        Add( ' mso-border-alt:solid silver .25pt; mso-padding-alt: 2.25pt 2.25pt 2.25pt 2.25pt''>    ' );
        Add( ' <tr style=''mso-yfti-irow:0;mso-yfti-lastrow:yes''>                                   ' );
        Add( '  <td style=''border:none;padding:2.25pt 2.25pt 2.25pt 2.25pt''>                       ' );
        Add( '  <p class=MsoNormal><b><span style=''font-size:13.0pt;mso-bidi-font-size:12.0pt;' );
        Add( Format( '  font-family:Verdana''>%s</span></b><span ', [ AHeadingText ] ));
        Add( '  style=''font-family:Verdana''><o:p></o:p></span></p>                      ' );
        Add( '  </td>                                                                                ' );
        Add( ' </tr>                                                                                 ' );
        Add( '</table>                                                                               ' ); }
      Add('<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width="100%"');
      Add(' style=''width:100.0%;mso-cellspacing:0in;background:#E6E6E6;border:solid silver 1.0pt;');
      Add(' mso-border-alt:solid silver .25pt;mso-padding-alt:2.25pt 2.25pt 2.25pt 2.25pt''>');
      Add(' <tr style=''mso-yfti-irow:0;mso-yfti-lastrow:yes''>');
      Add('  <td style=''border:none;padding:2.25pt 2.25pt 2.25pt 2.25pt''>');
      Add(Format
        ('  <p class=MsoNormal><b><span style=''font-family:Arial''>%s</span></b><span',
        [AHeadingText]));
      Add('  style=''font-family:Arial''><u1:p></u1:p><o:p></o:p></span></p>');
      Add('  </td>');
      Add(' </tr>');
      Add('</table>');
    end;
end;

procedure AddParagraph(AText: String; var AStringList: TStringList);
var
  ATemp: TStringList;
  i: Integer;
begin
  // Style = "Body Text"
  try
    ATemp := TStringList.Create;
    ATemp.Text := AText;
    for i := 0 to ATemp.Count - 1 do
      begin
        if Trim(ATemp.Strings[i]) = '' then
          AStringList.Add('<p class=MsoBodyText><o:p>&nbsp;</o:p></p>')
        else
          AStringList.Add(Format('<p class=MsoBodyText>%s<o:p></o:p></p>',
            [ATemp.Strings[i]]));
      end;
  finally
    if Assigned(ATemp) then
      FreeAndNil(ATemp);
  end;
end;

procedure AddParagraphNormal(AText: String; var AStringList: TStringList);
var
  ATemp: TStringList;
  i: Integer;
begin
  // Style = "Normal"
  try
    ATemp := TStringList.Create;
    ATemp.Text := AText;
    for i := 0 to ATemp.Count - 1 do
      begin
        if Trim(ATemp.Strings[i]) = '' then
          AStringList.Add('<p class=MsoNormal><o:p>&nbsp;</o:p></p>')
        else
          AStringList.Add(Format('<p class=MsoNormal>%s<o:p></o:p></p>',
            [ATemp.Strings[i]]));
      end;
  finally
    if Assigned(ATemp) then
      FreeAndNil(ATemp);
  end;
end;

procedure AddNewLine(var AStringList: TStringList);
begin
  AStringList.Add('<p class=MsoNormal><o:p>&nbsp;</o:p></p>');
end;

procedure AddHyperlinkListItem(ACaption, AHyperlink: String;
  var AStringList: TStringList);
begin
  with AStringList do
    begin
      Add(Format
        ('<p class=MsoNormal><span style=''font-size:10.0pt;font-family:Verdana;color:blue''><a href="%s">%s</a></span></p>',
        [AHyperlink, ACaption]));
    end;
end;

procedure AddLightBar(AStringList: TStringList);
begin
  with AStringList do
    begin
      // Add( '<hr size=1 width="100%" noshade color="#cccccc" align=center>' );

      Add(' <div class=MsoNormal align=center style=''text-align:center''><span');
      Add('    style=''padding:0in 0in 0in 0in;font-size:8.0pt;font-family:Verdana''>');
      Add(' <hr size=1 width="100%" noshade color="#cccccc" align=center>');
      Add(' </span></div>');
    end;
end;

procedure Add3DBar(AStringList: TStringList);
begin
  with AStringList do
    begin
      // Add( '<hr size=1 width="100%" noshade color="#cccccc" align=center>' );
      Add('<hr size=2 width="100%" align=center>');
    end;
end;

procedure LoadHTMLToWebBrowser(AWebBrowser: TWebBrowser; AHTML: TStringList);
const
  cMaxTime = 0.000115740740741; // ten seconds
var
  AStart: TDateTime;
  AMemStream: TMemoryStream;
begin
  if (AWebBrowser = NIL) or (AHTML = NIL) then
    Exit;

  AWebBrowser.Navigate('about:blank');

  // Load the blank document.  We set a timer on this to about 10 seconds,
  // because it could potentially continue forever or cause an AV.
  AStart := Now;
  while ((Now - AStart) < cMaxTime) do
    begin
      if (AWebBrowser.ReadyState < READYSTATE_INTERACTIVE) then
        Application.ProcessMessages
      else
        BREAK;
    end;

  // Now, load the HTML
  if (AWebBrowser.ReadyState >= READYSTATE_INTERACTIVE) and
    Assigned(AWebBrowser.Document) then
    begin
      AMemStream := TMemoryStream.Create;
      try
        AHTML.SaveToStream(AMemStream);
        AMemStream.Seek(0, 0);
        (AWebBrowser.Document as IPersistStreamInit)
          .Load(TStreamAdapter.Create(AMemStream));
      finally
        AMemStream.Free;
      end;
    end;
end;

{ TRowCargo }

constructor TRowCargo.Create(ACaption, AText: String; ABackColor: THTMLColor);
begin
  Caption := ACaption;
  Text := AText;
  BackColor := ABackColor;
  HeadingRow := FALSE;
  BlankRow := FALSE;
  BottomBorder := FALSE;
end;

{ TTwoColumnTable }

constructor TTwoColumnTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRows := TList.Create;
  FRowCount := 0; // initialize
end;

destructor TTwoColumnTable.Destroy;
begin
  IQMS.Common.Controls.ClearListOfObjects(FRows);
  if Assigned(FRows) then
    FreeAndNil(FRows);
  inherited Destroy;
end;

procedure TTwoColumnTable.AddRow(ACaption, AText: String;
  ABackgroundColor: THTMLColor; ABorderLine: TBorderLine);
var
  i: Integer;
begin
  // Allows us to add a row.  We use this method to build a list of rows
  // We worry about correct HTML syntax later
  i := FRows.Add(TRowCargo.Create(ACaption, AText, ABackgroundColor));
  if ABorderLine = blBottom then
    TRowCargo(FRows.Items[i]).BottomBorder := TRUE;
end;

procedure TTwoColumnTable.AddRow(ACaption: String; ADate: TDateTime;
  ADateFormat: String; ABackgroundColor: THTMLColor; ABorderLine: TBorderLine);
var
  S: String;
  i: Integer;
begin
  if Trunc(ADate) > 60 then
    S := FormatDateTime(ADateFormat, ADate)
  else
    S := '';
  i := FRows.Add(TRowCargo.Create(ACaption, S, ABackgroundColor));
  if ABorderLine = blBottom then
    TRowCargo(FRows.Items[i]).BottomBorder := TRUE;
end;

procedure TTwoColumnTable.AddHeadingRow(ACaption: String;
  ABackgroundColor: THTMLColor);
var
  i: Integer;
begin
  // Adds a "heading row" with text.  This is a one-column row.
  i := FRows.Add(TRowCargo.Create(ACaption, '', ABackgroundColor));
  TRowCargo(FRows.Items[i]).HeadingRow := TRUE;
end;

procedure TTwoColumnTable.AddHeadingRow(ADate: TDateTime;
  ADateFormat: String; ABackgroundColor: THTMLColor);
var
  i: Integer;
  S: String;
begin
  // Adds a "heading row" with text.  This is a one-column row.
  if Trunc(ADate) > 60 then
    S := FormatDateTime(ADateFormat, ADate)
  else
    S := '';
  i := FRows.Add(TRowCargo.Create(S, '', ABackgroundColor));
  TRowCargo(FRows.Items[i]).HeadingRow := TRUE;
end;

procedure TTwoColumnTable.AddBlankRow(ABackgroundColor: THTMLColor);
var
  i: Integer;
begin
  // Adds a "heading row" with text.  This is a one-column row.
  i := FRows.Add(TRowCargo.Create('', '', ABackgroundColor));
  TRowCargo(FRows.Items[i]).BlankRow := TRUE;
end;

procedure TTwoColumnTable.GetHTMLText(var ALines: TStringList);
var
  i: Integer;
  ABorderLine: TBorderLine;
begin
  // This method returns the useable HTML text which represents the table
  // and all of the rows we have added.

  // ensure we have a list to work with
  if ALines = NIL then
    raise Exception.Create('Application Error:  String list object is NIL.');

  // Begin table
  // ALines.Add('<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0');
  // ALines.Add(' style=''border-collapse:collapse;mso-yfti-tbllook:480;mso-padding-alt:0in 5.4pt 0in 5.4pt''>');

  ALines.Add
    ('<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 width="100%"');
  ALines.Add
    (' style=''width:100.0%;border-collapse:collapse;mso-yfti-tbllook:480;mso-padding-alt:');
  ALines.Add(' 0in 5.4pt 0in 5.4pt''>');

  // Add the rows we have accumulated
  for i := 0 to FRows.Count - 1 do
    begin

      ABorderLine := blNone;
      if TRowCargo(FRows.Items[i]).BottomBorder then
        ABorderLine := blBottom;

      if TRowCargo(FRows.Items[i]).HeadingRow then
        BuildHeadingRow(TRowCargo(FRows.Items[i]).Caption,
          TRowCargo(FRows.Items[i]).BackColor, i, (i = (FRows.Count - 1))
          { Last Row } , ALines)
      else if TRowCargo(FRows.Items[i]).BlankRow then
        BuildBlankRow(TRowCargo(FRows.Items[i]).BackColor, i,
          (i = (FRows.Count - 1)) { Last Row } , ALines)
      else
        BuildRow(TRowCargo(FRows.Items[i]).Caption, TRowCargo(FRows.Items[i])
          .Text, i, (i = (FRows.Count - 1)) { Last Row } ,
          TRowCargo(FRows.Items[i]).BackColor, ALines, ABorderLine);
    end;
  // End table
  ALines.Add('</table>');

end;

procedure TTwoColumnTable.BuildRow(ACaption, AText: String;
  ARowCount: Integer; ALastRow: Boolean; ABackColor: THTMLColor;
  var ALines: TStringList;
  ABorderLine: TBorderLine);
var
  ATextLines: TStringList; // used in case there are #13 characters
  i: Integer;
  ABorder: String;
begin
  // NOTE:  Only call this method if you have already started a table (<table>)
  // This initiates a row
  try
    // We create a temporary object for the text we will be adding
    ATextLines := TStringList.Create;
    ATextLines.Text := AText;

    ABorder := '';
    if ABorderLine = blBottom then
      ABorder := 'border:none;border-bottom:solid gray 1.0pt;';

    // Begin the row
    if ARowCount = 0 then
      ALines.Add(' <tr style=''mso-yfti-irow:0;mso-yfti-firstrow:yes''>')
    else if ALastRow then
      ALines.Add(Format(' <tr style=''mso-yfti-irow:%d;mso-yfti-lastrow:yes''>',
        [ARowCount]))
    else
      ALines.Add(Format(' <tr style=''mso-yfti-irow:%d''>', [ARowCount]));

    // Add the caption cell and text
    ALines.Add
      (Format('  <td width=168 valign=top style=''width:1.75in;%s background=%s;padding:0in 5.4pt 0in 5.4pt''>',
      [ABorder, ABackColor]));
    ALines.Add
      (Format('  <p class=MsoNormal><b style=''mso-bidi-font-weight:normal''>%s<o:p></o:p></b></p>',
      [ACaption]));
    // finish the caption cell
    ALines.Add('  </td>');
    // add the Text cell
    ALines.Add
      (Format('  <td width=422 valign=top style=''width:4.4in;%s background=%s;padding:0in 5.4pt 0in 5.4pt''>',
      [ABorder, ABackColor]));
    // We add the text this way in case there are #13 characters
    for i := 0 to ATextLines.Count - 1 do
      ALines.Add(Format('  <p class=MsoNormal>%s</p>',
        [ATextLines.Strings[i]]));
    // finish the cell
    ALines.Add('  </td>');
    // finish the row
    ALines.Add(' </tr>');

  finally
    // Free the temporary list we were using for the text
    ATextLines.Free;
  end;

end;

procedure TTwoColumnTable.BuildHeadingRow(ACaption: String;
  ABackColor: THTMLColor; ARowCount: Integer; ALastRow: Boolean;
  var ALines: TStringList);
begin
  // Adds a heading row to the table

  if ALines = NIL then
    Exit;

  if ARowCount = 0 then
    ALines.Add(' <tr style=''mso-yfti-irow:0;mso-yfti-firstrow:yes''>')
  else if ALastRow then
    ALines.Add(Format(' <tr style=''mso-yfti-irow:%d;mso-yfti-lastrow:yes''>',
      [ARowCount]))
  else
    ALines.Add(Format(' <tr style=''mso-yfti-irow:%d''>', [ARowCount]));

  ALines.Add
    ('  <td width=276 valign=top style=''width:207.0pt;border:none;border-bottom:solid windowtext 1.0pt;');
  ALines.Add
    (Format('  mso-border-bottom-alt:solid windowtext .5pt;background:%s;padding:0in 5.4pt 0in 5.4pt''>',
    [ABackColor]));
  ALines.Add(Format('  <p class=MsoNormal><b>%s</b><u1:p></u1:p></p>',
    [ACaption]));
  ALines.Add('  </td>');
  ALines.Add
    ('  <td width=708 valign=top style=''width:531.0pt;border:none;border-bottom:solid windowtext 1.0pt;');
  ALines.Add
    (Format('  mso-border-bottom-alt:solid windowtext .5pt;background:%s;padding:0in 5.4pt 0in 5.4pt''>',
    [ABackColor]));
  ALines.Add('  <p class=MsoNormal>&nbsp;</p>');
  ALines.Add('  </td>');
  ALines.Add(' </tr>');

  // Add the cell.  This is one cell containing the text
  { ALines.Add('  <td width=590 colspan=2 valign=top style=''width:6.15in;border:none;');
    ALines.Add('  border-bottom:solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;');
    ALines.Add(Format('  background:%s;padding:0in 5.4pt 0in 5.4pt''>', [ABackColor]));
    ALines.Add(Format('  <p class=MsoNormal><b style=''mso-bidi-font-weight:normal''>%s<o:p></o:p></b></p>', [ACaption]));
    ALines.Add('  </td>');
    ALines.Add(' </tr>'); }

end;

procedure TTwoColumnTable.BuildBlankRow(ABackColor: THTMLColor;
  ARowCount: Integer; ALastRow: Boolean;
  var ALines: TStringList);
begin
  // Adds a blank row to the table

  if ALines = NIL then
    Exit;

  // Begin the row
  if ARowCount = 0 then
    ALines.Add(' <tr style=''mso-yfti-irow:0;mso-yfti-firstrow:yes''>')
  else if ALastRow then
    ALines.Add(Format(' <tr style=''mso-yfti-irow:%d;mso-yfti-lastrow:yes''>',
      [ARowCount]))
  else
    ALines.Add(Format(' <tr style=''mso-yfti-irow:%d''>', [ARowCount]));

  ALines.Add
    (Format('  <td width=276 valign=top style=''width:207.0pt;background:%s;padding:',
    [ABackColor]));
  ALines.Add('  0in 5.4pt 0in 5.4pt''>');
  ALines.Add('  <p class=MsoNormal><b>&nbsp;</b></p>');
  ALines.Add('  </td>');
  ALines.Add
    (Format('  <td width=708 valign=top style=''width:531.0pt;background:%s;padding:',
    [ABackColor]));
  ALines.Add('  0in 5.4pt 0in 5.4pt''>');
  ALines.Add('  <p class=MsoNormal>&nbsp;</p>');
  ALines.Add('  </td>');
  ALines.Add(' </tr>');
  {
    ALines.Add(Format('  <td width=590 colspan=2 valign=top style=''background:%s;width:6.15in;''', [ABackColor]));
    ALines.Add('  padding:0in 5.4pt 0in 5.4pt''>');
    ALines.Add('  <p class=MsoNormal><o:p>&nbsp;</o:p></p>');
    ALines.Add('  </td>');
    ALines.Add(' </tr>'); }
end;

end.
