unit iqpra_html;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Winapi.ActiveX,
  SHDocVw,
  pra_share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  IQUniGrid;

  procedure AddHTMLHeader(ATitle: String; var AStringList: TStringList);
  procedure AddHTMLFooter(var AStringList: TStringList);


  procedure AddHTMLDataSet(ADataSet: TDataSet; ACanvasTextWidth: Integer; var AHTML: TStringList);
  procedure AddHTMLStringGrid(AStringGrid: TUniStringGrid; var AHTML: TStringList);
  { TODO -oathite -cWebConvert : Undeclared identifier: 'TCustomGrid'
  procedure AddHTMLDBGrid( ADBGrid: TCustomGrid;
                           var AHTML: TStringList;
                           AAssignHtmlColumnText: TAssignHtmlColumnText = nil);  // pra_share.pas }
  procedure AddHTMLHeading(ACaption: String; var AHTML: TStringList);
  procedure AddHTMLSubLine(ACaption, AValue: String; var AHTML: TStringList);
  procedure AddHTMLBlankLine(var AStringList: TStringList);

  procedure BeginTable(var AHTML: TStringList);
  procedure AddTableHeadingRow(const ACaptions: array of String;
                              const AWidths: array of Integer;
                              var AHTML: TStringList;
                              ABorder: Boolean = True);
  procedure AddTableFieldRow(const AValues: array of String;
                              const AWidths: array of Integer;
                              var AHTML: TStringList;
                              ALineAfter: Boolean = True);
  procedure EndTable(var AHTML: TStringList);

  procedure LoadHTMLToWebBrowser(AWebBrowser: TWebBrowser; AHTML: TStringList);

implementation

uses
  IQMS.Common.Numbers,
  uniDBGrid;

procedure AddHTMLHeader(ATitle: String; var AStringList: TStringList);
begin
  with AStringList do
    begin
      Add('<html>                                                                  ');
      Add('<head>                                                                  ');
      Add('<meta http-equiv=Content-Type content="text/html">');
      //Add('<link rel=File-List href="./Search%20Results_files/filelist.xml">       ');
      Add(Format('<title>%s</title>                                               ', [ ATitle ]));
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

procedure BeginTable(var AHTML: TStringList);
begin
  if (AHTML = NIL) then
    Exit;
  // Begin table
  AHTML.Add('<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0');
  AHTML.Add('style=''border-collapse:collapse;mso-yfti-tbllook:191;mso-padding-alt:0in 5.4pt 0in 5.4pt');
end;

procedure AddTableHeadingRow(const ACaptions: array of String;
                            const AWidths: array of Integer;
                            var AHTML: TStringList;
                            ABorder: Boolean);
const
  BORDER_COLOR = 'gray';
  BACK_COLOR = '#F3F3F3'; // '#E6E6E6';
var
  i: Integer;
begin
  if (AHTML = NIL) then
    Exit;
  if (High(ACaptions) <> High(AWidths)) then
    Exit;

  AHTML.Add(Format('<tr style=''mso-yfti-irow:%d''>', [i])); // begin row
  for i := 0 to High(ACaptions) do
    begin
      if ABorder then
        begin
          // first
          if i = 0 then
             AHTML.Add(Format(
             '<td width=%d valign=top style=''border:solid %s 1.0pt;'#13 +
             'border-right:none;background:%s;padding:0in 5.4pt 0in 5.4pt''>',
             [AWidths[i], BORDER_COLOR, BACK_COLOR]))
          // middle
          else if (i > 0) and (i < High(ACaptions)) then
             AHTML.Add(Format(
             '<td width=%d valign=top style=''border-top:solid %s 1.0pt;'#13 +
             'border-left:none;border-bottom:solid %s 1.0pt;border-right:none;'#13 +
             'background:%s;padding:0in 5.4pt 0in 5.4pt''>',
             [AWidths[i], BORDER_COLOR, BORDER_COLOR, BACK_COLOR]))
          // last
          else if (i = High(ACaptions)) then
             AHTML.Add(Format(
             '<td width=%d valign=top style=''border:solid %s 1.0pt;'#13 +
             'border-left:none;background:%s;padding:0in 5.4pt 0in 5.4pt''>',
             [AWidths[i], BORDER_COLOR, BACK_COLOR]));

        //AHTML.Add(Format('  <td width=%d valign=top style=''background:#E6E6E6;padding:0in 5.4pt 0in 5.4pt''>', [AWidths[i]]))
        end
      else
        AHTML.Add(Format('  <td width=%d valign=top style=''background:%s;' +
         'padding:0in 5.4pt 0in 5.4pt''>',
         [AWidths[i], BACK_COLOR]));

      AHTML.Add(Format('  <p class=MsoNormal><b><span style=''font-size:8.0pt;' +
       'font-family:Verdana''>%s<o:p></o:p></span></b></p>', [ACaptions[i]]));
      AHTML.Add('</td>');
    end;
  AHTML.Add('</tr>'); // end row
end;

procedure AddTableFieldRow(const AValues: array of String;
                            const AWidths: array of Integer;
                            var AHTML: TStringList;
                            ALineAfter: Boolean);
var
  i: Integer;
begin
  if (AHTML = NIL) then
    Exit;
  if (High(AValues) <> High(AWidths)) then
    Exit;
  AHTML.Add(Format('<tr style=''mso-yfti-irow:%d''>', [i])); // begin row
  for i := 0 to High(AValues) do
   begin
     if ALineAfter then
        AHTML.Add(Format('  <td width=%d valign=top style=''border:none;border-bottom:solid gray 1.0pt;padding:0in 5.4pt 0in 5.4pt''>', [AWidths[i]]))
     else
       AHTML.Add(Format('  <td width=%d valign=top style=''padding:0in 5.4pt 0in 5.4pt''>', [AWidths[i]]));

     AHTML.Add(Format('  <p class=MsoNormal><span style=''font-size:8.0pt;font-family:Verdana''>%s<o:p></o:p></span></p>', [AValues[i]]));
     AHTML.Add('</td>');
   end;
  AHTML.Add('</tr>'); // end row
end;

procedure EndTable(var AHTML: TStringList);
begin
   if (AHTML = NIL) then Exit;
   // End table
   AHTML.Add('</table>');
end;

procedure AddHTMLDataSet(ADataSet: TDataSet; ACanvasTextWidth: Integer; var AHTML: TStringList);
var
   i, j, AVisColCount: Integer;
   ACaptions: array of String;
   AWidths: array of Integer;
begin
   if (AHTML = NIL) or (ADataSet = NIL) then
     Exit;
   if not ADataSet.Active then
     Exit;

   BeginTable(AHTML);

   // Get visible column count
   AVisColCount := 0;
   for i := 0 to ADataSet.Fields.Count - 1 do
       if ADataSet.Fields[i].Visible then Inc(AVisColCount);
   SetLength(ACaptions, AVisColCount);
   SetLength(AWidths,   AVisColCount);

   // Add heading row
   j := 0; // counter
   for i := 0 to ADataSet.Fields.Count - 1 do
     begin
       if not ADataSet.Fields[i].Visible then CONTINUE;
       ACaptions[j] := ADataSet.Fields[i].DisplayLabel;
       AWidths[j]   := iMax(ADataSet.Fields[i].DisplayWidth * ACanvasTextWidth, Length(ADataSet.Fields[i].DisplayLabel) * ACanvasTextWidth) ;
       Inc(j);
       if j > High(ACaptions) then BREAK;
     end;
   AddTableHeadingRow(ACaptions, AWidths, AHTML);

   // Add field rows
   ADataSet.First;
   while not ADataSet.EOF do
     begin
       SetLength(ACaptions, 0);
       SetLength(ACaptions, AVisColCount);
       j := 0;  // reset
       for i := 0 to ADataSet.Fields.Count - 1 do
         begin
           if not ADataSet.Fields[i].Visible then CONTINUE;
           // 04/16/2009 If the field is a TFloatField, then apply the
           // number format to the display string.  This is part of a
           // requested submitted by Lael.  Numbers need to follow the
           // decimal precision in the Production Reporting settings.
           if (ADataSet.Fields[i] is TFloatField) and
             (TFloatField(ADataSet.Fields[i]).DisplayFormat > '') then
              ACaptions[j] := FormatFloat(
                 TFloatField(ADataSet.Fields[i]).DisplayFormat,
                 ADataSet.Fields[i].AsFloat)
           else
             ACaptions[j] := ADataSet.Fields[i].AsString;
           Inc(j); // can't use i because we may skip a count
           if j > High(ACaptions) then
             BREAK;
         end;
        AddTableFieldRow(ACaptions, AWidths, AHTML);
        ADataSet.Next;
     end;
   EndTable(AHTML);
end;


procedure AddHTMLStringGrid( AStringGrid: TUniStringGrid; var AHTML: TStringList);
var
  i, x, j: Integer; S: String;
  ACaptions: array of String;
  AWidths: array of Integer;
begin
  if (AHTML = NIL) then
    Exit;
  S := '';

  BeginTable(AHTML);
  with AStringGrid do
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'Canvas'
      x := Canvas.TextWidth('X');                                    }
      if (RowCount < 2) then Exit;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'Rows'
      if (Trim(Rows[1].Text) = '') then Exit;}

      SetLength(ACaptions, ColCount);
      SetLength(AWidths,   ColCount);
      // Set the width array only once
      for j := 0 to ColCount - 1 do
          AWidths[j]    := ColWidths[j];

      for i := 0 to RowCount - 1 do
        begin
          // Get array values
          for j := 0 to ColCount - 1 do
              ACaptions[j] := Cells[ j, i ];
          // Add row
          if (i = 0) then AddTableHeadingRow(ACaptions, AWidths, AHTML)
          else AddTableFieldRow(ACaptions, AWidths, AHTML);
        end;
    end;
  EndTable(AHTML);
end;
{ TODO -oathite -cWebConvert : 'TCustomGrid' is not a type identifier }(*
procedure AddHTMLDBGrid( ADBGrid: TCustomGrid;
                         var AHTML: TStringList;
                         AAssignHtmlColumnText: TAssignHtmlColumnText = nil);
var
  i: Integer;
  ADataSet: TDataSet;
  ACaptions: array of String;
  AWidths: array of Integer;
  AVisiFields: array of String;
  AColumnCount: Integer;
  AFieldText: array of String;

  function _GetTrueColCount: Integer;
  var
    n: Integer;
  begin
    Result := 0;
    if not Assigned(ADBGrid) then EXIT;

    if ADBGrid is TUniDBGrid then
      begin
        for n := 0 to TUniDBGrid(ADBGrid).Columns.Count - 1 do
          if TUniDBGrid(ADBGrid).Columns[n].Visible then
            Inc(Result)
      end
    { TODO -oathite -cWebConvert : Undeclared identifier: 'Selected'
    else If ADBGrid is TIQUniGridControl then
      for n := 0 to TIQUniGridControl(ADBGrid).Selected.Count - 1 do  }
        Inc(Result);
  end;

  procedure _SetColumnArrays;
  var
    n1,n2: Integer;
    x: Integer;
  begin
    n2 := 0;
    if not Assigned(ADBGrid) then EXIT;

    if ADBGrid is TUniDBGrid then
      begin
       for n1 := 0 to TUniDBGrid(ADBGrid).Columns.Count - 1 do
         if TUniDBGrid(ADBGrid).Columns[n1].Visible then
           begin
             ACaptions[n2] := TUniDBGrid(ADBGrid).Columns[n1].Title.Caption;
             AWidths[n2] := TUniDBGrid(ADBGrid).Columns[n1].Width;
             AVisiFields[n2] := TUniDBGrid(ADBGrid).Columns[n1].FieldName;
             Inc(n2);
           end
      end
    else if ADBGrid is TIQUniGridControl then
      begin
        x:= TIQUniGridControl(ADBGrid).Canvas.TextWidth('X');
        for n1 := 0 to TIQUniGridControl(ADBGrid).Selected.Count - 1 do
          begin
            { TODO -oathite -cWebConvert : Undeclared identifier: 'DisplayLabel'
            ACaptions[n2]  := TIQUniGridControl(ADBGrid).Columns[n1].DisplayLabel; }
            { TODO -oathite -cWebConvert : Undeclared identifier: 'DisplayWidth'
            AWidths[n2]    := TIQUniGridControl(ADBGrid).Columns[n1].DisplayWidth * x; }
            AVisiFields[n2]:= TIQUniGridControl(ADBGrid).Columns[n1].FieldName;
            Inc(n2);
          end;
      end;
  end;

  procedure _SetFieldTextForCurRecord;
  var
    j: Integer;
  begin
    for j := Low(AVisiFields) to High(AVisiFields) do
     begin
       if (ADataSet.FieldByName(AVisiFields[j]).DataType in
         [ftDate, ftTime, ftDateTime]) then
         begin
           if ADataSet.FieldByName(AVisiFields[j]).AsDateTime > 0 then
             AFieldText[j] := FormatDateTime('ddddd', ADataSet.FieldByName(AVisiFields[j]).AsDateTime)
         end
       else
         AFieldText[j] := ADataSet.FieldByName(AVisiFields[j]).AsString;

       if Assigned(AAssignHtmlColumnText) then
         AAssignHtmlColumnText( nil, ADataSet.FieldByName(AVisiFields[j]), AFieldText[j]);
     end;
  end;

  function _GetDataSet: TDataSet;
  begin
    Result:= nil;
    if not Assigned(ADBGrid) then
      EXIT
    else if ADBGrid is TUniDBGrid then with TUniDBGrid(ADBGrid) do
      begin
        if Assigned(DataSource) then
           Result:= DataSource.DataSet
      end
    else if ADBGrid is TIQUniGridControl then with TIQUniGridControl(ADBGrid) do
      begin
        if Assigned(DataSource) then
           Result:= DataSource.DataSet
      end;
  end;

begin
  if (AHTML = NIL) then
    Exit;
  if not Assigned(ADBGrid) then
    Exit;

  ADataSet := _GetDataSet();
  if not Assigned(ADataSet) then
    Exit;

  BeginTable(AHTML);
  with ADBGrid do
    begin
      AColumnCount := _GetTrueColCount;
      SetLength(ACaptions,   AColumnCount); // Display Labels (Titles)
      SetLength(AWidths,     AColumnCount); // Column widths
      SetLength(AVisiFields, AColumnCount); // Visible fields (field names)
      SetLength(AFieldText,  AColumnCount); // Row text array (data)

      // Set the width array only once
      _SetColumnArrays;
      AddTableHeadingRow(ACaptions, AWidths, AHTML);
      ADataSet.First;
      while not ADataSet.EOF do
      begin
        // Get the data as a text array
        _SetFieldTextForCurRecord;
        // Add the data as a table row
        AddTableFieldRow(AFieldText, AWidths, AHTML);
        // Next data record
        ADataSet.Next;
      end;
    end;
  EndTable(AHTML);
end;
*)
procedure AddHTMLHeading(ACaption: String; var AHTML: TStringList);
begin
  if (AHTML = NIL) then
    Exit;
  AHTML.Add(Format('<p class=MsoNormal><b><span style=''font-size:9.0pt;font-family:Verdana''>%s<o:p></o:p></span></b></p>', [ACaption]));
end;

procedure AddHTMLSubLine(ACaption, AValue: String; var AHTML: TStringList);
begin
  if (AHTML = NIL) then
    Exit;
  AHTML.Add('<p class=MsoNormal><span style=''font-size:8.0pt;font-family:Verdana''>');
  AHTML.Add('<span style=''mso-tab-count:1''> </span>');
  AHTML.Add(Format('%s: ', [ACaption]));
  AHTML.Add('<span style=''mso-spacerun:yes''> </span>');
  AHTML.Add(Format('%s', [AValue]));
  AHTML.Add('<o:p></o:p></span></p>');
end;

procedure AddHTMLBlankLine(var AStringList: TStringList);
begin
  AStringList.Add('<p class=MsoNormal><o:p>&nbsp;</o:p></p>');
end;

procedure LoadHTMLToWebBrowser(AWebBrowser: TWebBrowser; AHTML: TStringList);
const
  cMaxTime = 0.000115740740741; // ten seconds
var
  AStart: TDateTime;
  AMemStream: TMemoryStream;
begin
  if (AWebBrowser = NIL) or (AHTML = NIL) then Exit;

  AWebBrowser.Navigate('about:blank');

  // Load the blank document.  We set a timer on this to about 10 seconds,
  // because it could potentially continue forever or cause an AV.
  AStart := Now;
  while ((Now - AStart) < cMaxTime) do
    begin
      if (AWebBrowser.ReadyState < READYSTATE_INTERACTIVE) then
          Application.ProcessMessages
      else BREAK;
    end;

  // Now, load the HTML
  if (AWebBrowser.ReadyState >= READYSTATE_INTERACTIVE) and
     Assigned(AWebBrowser.Document) then
     begin
       AMemStream := TMemoryStream.Create;
       try
         AHTML.SaveToStream(AMemStream);
         AMemStream.Seek(0, 0);
         (AWebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(AMemStream));
       finally
         AMemStream.Free;
       end;
     end;
end;

end.
