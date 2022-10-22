unit IQMS.Common.WebBrowserUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.SysUtils, System.Variants,
  Vcl.ComCtrls, SHDocVw, WinInet;

/// <summary>
/// Display page in WebBrowser component without executing events.
/// </summary>
/// <param name="AWebBrowser">The TWebBrowser component.
/// </param>
/// <param name="AURL">The target URL.
/// </param>
procedure ForceNavigate(AWebBrowser: TWebBrowser; AURL: string);

/// <summary>
/// Get the HTML source from a WebBrowser component.
/// </summary>
/// <param name="AWebBrowser">The TWebBrowser component.
/// </param>
/// <param name="AHTMLSource">An existing TStringList to populate.
/// </param>
function GetWebBrowserPageSource(AWebBrowser: TWebBrowser; var AHTMLSource: TStringList): Boolean;

/// <summary>
/// Get the HTML source from a Web page for a given URL.
/// </summary>
/// </param>
/// <param name="AURL">URL to the Web page.
/// </param>
/// </param>
/// <param name="AHTMLSource">An existing TStringList to populate.
/// </param>
function GetURLPageSource(AURL: string; var AHTMLSource: TStringList): Boolean;

/// <summary>
/// List the links referenced within the HTML source of a WebBrowser component.
/// </summary>
/// <param name="AWebBrowser">The TWebBrowser component.
/// </param>
/// </param>
/// <param name="AList">An existing TStringList to populate.
/// </param>
procedure GetWebBrowserPageLinks(AWebBrowser: TWebBrowser; var AList: TStringList);

/// <summary>
/// Loads HTML into a WebBrowser component.
/// </summary>
/// <param name="AWebBrowser">The TWebBrowser component.
/// </param>
/// </param>
/// <param name="AHTML">An existing TStringList containing HTML to load.
/// </param>
procedure LoadHTMLToWebBrowser(AWebBrowser: TWebBrowser; AHTML: TStringList); overload;

/// <summary>
/// Loads HTML into a WebBrowser component.
/// </summary>
/// <param name="AWebBrowser">The TWebBrowser component.
/// </param>
/// </param>
/// <param name="AHTML">The HTML string to load.
/// </param>
procedure LoadHTMLToWebBrowser(AWebBrowser: TWebBrowser; AHTML: string); overload;

implementation

uses
  Winapi.ActiveX,
  (*UG_rem_AMB*)
  //iqmisc,
  (*UG_rem_AMB*)
  Winapi.ShellAPI;

procedure ForceNavigate(AWebBrowser: TWebBrowser; AURL: string);
var
  AEvent: TWebBrowserBeforeNavigate2;
begin
  AEvent := AWebBrowser.OnBeforeNavigate2;
  try
    AWebBrowser.OnBeforeNavigate2 := nil;
    AWebBrowser.Navigate(AURL);
  finally
    AWebBrowser.OnBeforeNavigate2 := AEvent;
  end;
end;

function GetWebBrowserPageSource(AWebBrowser: TWebBrowser; var AHTMLSource: TStringList): Boolean;
var
  APStream: IPersistStreamInit;
  AStringStream: TStringStream;
  AIStream: IStream;
  ATempString, ACodeLine: string;
begin
  ATempString := '';
  try
    APStream := AWebBrowser.Document as IPersistStreamInit;
    AStringStream := TStringStream.Create(ATempString);
    AIStream := TStreamAdapter.Create(AStringStream, soReference) as IStream;
    Result := Succeeded(APStream.Save(AIStream, TRUE));
    ACodeLine := AStringStream.Datastring;
    if Result then
      AHTMLSource.Text := ACodeLine;
  finally
    if Assigned(AStringStream) then
      FreeAndNil(AStringStream);
  end;
end;

function GetURLPageSource(AURL: string; var AHTMLSource: TStringList): Boolean;
const
  BufferSize = 1024;
var
  fn: string;
  hSession, hURL: HInternet;
  Buffer: array [1 .. BufferSize] of Byte;
  BufferLen: DWORD;
  f: file;
  sAppName: string;
begin
  Result := False;
  if not Assigned(AHTMLSource) then
    Exit;
  AHTMLSource.Clear;

  // Get the temporary file name
  (*UG_rem_AMB*)
//  fn := iqmisc.IQGetLocalHomePath + iqmisc.GetRandomName + '.txt';

  // Open session to Internet
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG,
    nil, nil, 0);

  // Write the HTML source from the Web page to a temporary file
  try
    hURL := InternetOpenURL(hSession, PChar(AURL), nil, 0, 0, 0);
    try
      AssignFile(f, fn);
      Rewrite(f, 1);
      repeat
        InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
        BlockWrite(f, Buffer, BufferLen)
      until BufferLen = 0;
      CloseFile(f);
      Result := TRUE;
    finally
      InternetCloseHandle(hURL)
    end
  finally
    InternetCloseHandle(hSession)
  end;

  // Load the text from the file and delete the file
  if FileExists(fn) then
  begin
    AHTMLSource.LoadFromFile(fn);
    DeleteFile(fn);
  end;
end;

procedure GetWebBrowserPageLinks(AWebBrowser: TWebBrowser; var AList: TStringList);
var
  ALink: string;
  i, x: Integer;
begin
  AList.Clear;
  x := AWebBrowser.OleObject.Document.Links.Length;
  for i := 0 to (x - 1) do
  begin
    ALink := AWebBrowser.OleObject.Document.Links.Item(i);
    AList.Add(ALink);
  end;
end;

procedure LoadHTMLToWebBrowser(AWebBrowser: TWebBrowser; AHTML: string);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Text := AHTML;
    LoadHTMLToWebBrowser(AWebBrowser, sl);
  finally
    sl.Free;
  end;
end;

procedure LoadHTMLToWebBrowser( AWebBrowser: TWebBrowser; AHTML: TStringList );
const
  cMaxTime = 0.000115740740741; // ten seconds
var
  AStart: TDateTime;
  AMemStream: TMemoryStream;
begin
  // Validate required objects
  if not Assigned(AWebBrowser) or not Assigned(AHTML) then
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
        Break;
    end;

  // If no HTML lines, then exit
  if AHTML.Count = 0 then
    Exit;

  // Now, load the HTML
  if (AWebBrowser.ReadyState >= READYSTATE_INTERACTIVE) and
    Assigned(AWebBrowser.Document) then
    begin
      AMemStream := TMemoryStream.Create;
      try
        AHTML.SaveToStream(AMemStream);
        AMemStream.Seek(0, 0);
        (AWebBrowser.Document as IPersistStreamInit).Load(
        TStreamAdapter.Create(AMemStream));
      finally
        AMemStream.Free;
      end;
    end;
end;

end.
