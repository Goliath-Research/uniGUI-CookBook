unit IQMS.Common.xmlView;

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
  Vcl.Menus,
  IQMS.WebVcl.About,
  SHDocVw,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm, uniMemo,
  uniGUIApplication,
  uniMainMenu, uniGUIBaseClasses, uniPanel, uniHTMLFrame;

type
  { TFrmXMLViewer }
  TFrmXMLViewer = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    SavetoFile1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    PMain: TUniPopupMenu;
    SavetoFile2: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    UniHTMLFrame1: TUniHTMLFrame;
    procedure Exit1Click(Sender: TObject);
    procedure SavetoFile1Click(Sender: TObject);
    procedure CopyAll1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
    FXmlText: string;
    procedure SetText(const Value: String);
     procedure FormatEditor(AEditor: TUniMemo);
    function GetWordAt(APos: Integer; AText: string; var AStart, AEnd: Integer): string;
  public
    { Public declarations }
    class procedure DoShow (AXMLText: String);
    procedure LoadFromFile(const AFileName: String);
    property XMLText: String read FXmlText write SetText;
  end;

{$REGION 'Constants and arrays'}

type
  TCharSet = set of WideChar;

const
  // Colors
  constColor_Reserved = clRed;
  constColor_Symbol = clBlue;

//  constSYMBOLS: TCharSet = [',', '.', ';', ':', '>', '<', '=', '(', ')', '+',
//    '!', '@', '%', '*', '^', '&', '-', '/', '\', '|', '}', '{', '~'];
  constSYMBOLS: TCharSet = ['"', '&', '<', '>', '/', '?'];
  constSTANDARD_CHARS: TCharSet = ['0' .. '9', 'A' .. 'Z', 'a' .. 'z', '_'];

  AReservedWords: array [0 .. 3] of string = ('XML','XMLNS','ENCODING','VERSION');

{$ENDREGION 'Constants and arrays'}

var
  FrmXMLViewer: TFrmXMLViewer;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.WebBrowserUtils,
  System.Character,
  System.StrUtils,
  WinApi.RichEdit;

{$REGION 'TFrmXMLViewer'}

{ TFrmXMLViewer }

class procedure TFrmXMLViewer.DoShow( AXMLText: String);
begin
  with TFrmXMLViewer.Create(uniGUIApplication.UniApplication) do
   begin
    XMLText := AXMLText;
    Show;
   end;
end;

procedure TFrmXMLViewer.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self,[Self]);
end;

procedure TFrmXMLViewer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self,[Self]);
end;

procedure TFrmXMLViewer.SetText(const Value: String);
begin
  FXmlText := Value;
  UniHTMLFrame1.HTML.Text:=FXmlText;
end;

procedure TFrmXMLViewer.SavetoFile1Click(Sender: TObject);
var
  S : TStringStream;
begin
  S := TStringStream.Create(FXmlText);
    try
      UniSession.SendStream(S, 'Xml.txt');
    finally
      S.Free;
    end;
end;

procedure TFrmXMLViewer.LoadFromFile(const AFileName: String);
var
  sl: TStringList;
begin
  if (AFileName > '') and FileExists(AFileName) then
    begin
      sl := TStringList.Create;
      try
        sl.LoadFromFile(AFileName);
        Text := sl.Text;
      finally
        sl.Free;
      end;
    end;
end;

procedure TFrmXMLViewer.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmXMLViewer.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmXMLViewer.CopyAll1Click(Sender: TObject);
begin
end;

{$REGION 'XML Formatting'}

procedure TFrmXMLViewer.FormatEditor(AEditor: TUniMemo);

  procedure FormatChars(ASelStart, ASelLength: Integer; AColor: TColor;
    ABold, AItalic: Boolean);
  var
    cf: TCharFormat;
    tr: TTextRangeW;
  begin
    tr.chrg.cpMin := ASelStart;
    tr.chrg.cpMax := ASelStart + ASelLength;
    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@tr.chrg));
    ZeroMemory(@cf, Sizeof(TCharFormat));
    cf.cbSize := Sizeof(cf);
    cf.dwMask := CFM_COLOR or CFM_BOLD or CFM_ITALIC;
    cf.crTextColor := AColor;
    if ABold then
      cf.dwEffects := cf.dwEffects or CFE_BOLD;
    if AItalic then
      cf.dwEffects := cf.dwEffects or CFE_ITALIC;
    SendMessage(AEditor.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@cf));
  end;

  procedure ClearFormatting;
  var
    cf: TCharFormat;
    tr: TTextRangeW;
    cr: TCharRange;
  begin
    tr.chrg.cpMin := 0;
    tr.chrg.cpMax := Length(AEditor.Text);
    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@tr.chrg));
    ZeroMemory(@cf, Sizeof(TCharFormat));
    cf.cbSize := Sizeof(cf);
    cf.dwMask := CFM_COLOR or CFM_BOLD or CFM_ITALIC;
    cf.crTextColor := clBlack;
    SendMessage(AEditor.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@cf));
    ZeroMemory(@cr, Sizeof(TCharRange));
    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@cr));
  end;

  function FormatWordIfFound(const AWord: string;
    const AWordList: array of string; const AColor: TColor;
    const ABold, AItalics: Boolean; var ACurrentPos: Integer): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 0 to high(AWordList) do
      if CompareText(AWord, AWordList[i]) = 0 then
        begin
          Result := True;
          FormatChars(ACurrentPos - 1, Length(AWord), AColor, ABold, AItalics);
          ACurrentPos := ACurrentPos + Length(AWord) - 1; // new position of i
          BREAK;
        end;
  end;

var
  i, x, xA, xB, xC: Integer; // i = counter, x=temporary integer
  AText: string;
  ATextLength: Integer;
  chrgSave: TCharRange;
  AWord: string;
  AWordFound: Boolean;
  AAlignDisabled: Boolean;
  c: Char;
  c2: string[2];
  AStart, AEnd: Integer;

  AOnChange: TNotifyEvent;
  AOnSelectionChange: TNotifyEvent;
  AOnKeyDown: TKeyEvent;
begin
  // Get text
  AText := AEditor.Text;
  if Trim(AText) = '' then
    Exit;

  // Replace the end-of-line characters in the text that is used
  // for evaluation.  This is necessary for the current character
  // position in AText to match the position in the AEditor.
  AText := StringReplace(AText, #13#10, #13, [rfIgnoreCase, rfReplaceAll]);
  AText := StringReplace(AText, #10#13, #13, [rfIgnoreCase, rfReplaceAll]);
  AText := StringReplace(AText, #10, #13, [rfIgnoreCase, rfReplaceAll]);
  ATextLength := Length(AText);

  try
    AEditor.Lines.BeginUpdate; // begin updating
    // Clear events
    AOnChange := AEditor.OnChange;
//    AOnSelectionChange := AEditor.OnSelectionChange;
    AOnKeyDown := AEditor.OnKeyDown;
    AEditor.OnChange := nil;
//    AEditor.OnSelectionChange := nil;
    AEditor.OnKeyDown := nil;
    // Set drawing
//    SendMessage(AEditor.Handle, WM_SETREDRAW, Integer(False), 0);
//    SendMessage(AEditor.Handle, EM_EXGETSEL, 0, LPARAM(@chrgSave));

    // Clear the formatting.  Note:  it is important that we do this because
    // some characters can be missed as we examine the text.  This takes
    // care of alot of problems.
    ClearFormatting;
    i := 1; // initialize counter.  We use a "while" loop.

    while i <= ATextLength do
      begin
        c := AText[i];
        c2 := Copy(AText, i, 2);

        if (ATextLength < 2) or (c = #0) then
          begin
            Inc(i);
            Continue;
          end

{        else if (c2 = '>') then
          begin
            xA := i;

            x := PosEx('<', AText, i + 1);
            if (x = 0) then
              x := ATextLength;
            FormatChars(i - 1, (x - i) + 2, clBlack, False, True);
            i := x + 2;

            // Format quotations within the tag
            repeat
              xB := PosEx('"', AText, xA + 1);
              if (xB > 0) then
                begin
                  xC := PosEx('"', AText, xB + 1);
                  if xC > 0 then
                    FormatChars(xB - 1, xC - xB + 1, constColor_Symbol, False, False);
                end;
              xA := xC + 1;
            until (xA >= i) or (xB = 0);

          end }

        else if (c = '<') then
          begin
            xA := i;

            x := PosEx('>', AText, i + 1);
            if (x = 0) then
              x := ATextLength;
            FormatChars(i - 1, (x - i) + 1, clMaroon, False, False);
            if AText[i+1] = '/' then
              FormatChars(i-1, 2, constColor_Symbol, False, False)
            else
              FormatChars(i-1, 1, constColor_Symbol, False, False);
            FormatChars(x-1, 1, constColor_Symbol, False, False);
            i := x + 1;

            // Format quotations within the tag
            repeat
              xB := PosEx('"', AText, xA + 1);
              if (xB > 0) then
                begin
                  xC := PosEx('"', AText, xB + 1);
                  if xC > 0 then
                    FormatChars(xB - 1, xC - xB + 1, constColor_Symbol, False, False);
                end;
              xA := xC + 1;
            until (xA >= i) or (xB = 0);

          end;

        // Format block comments.  Check here first if our starting point
        // is the beginning of a block comment.  It makes things much faster.
//          begin
//            xA := PosEx('"', AText, i + 1);
//            if (xA = 0) then
//              xA := ATextLength;
//            FormatChars(i - 1, (xA - i) + 2, constColor_Symbol, False, True);
//          end;

        // Symbols
        if System.SysUtils.CharInSet(c, constSYMBOLS) then
          begin
            FormatChars(i - 1, 1, constColor_Symbol, False, False);
            Inc(i); // increment
          end
          // Words
        else if System.Character.TCharacter.IsLetterOrDigit(c) then
          begin
            // Get the word
            AWord := UpperCase(GetWordAt(i, AText, AStart, AEnd));
            AWordFound := False; // reset for inner loops

            AWordFound := FormatWordIfFound(AWord, AReservedWords,
              constColor_Reserved { Color } , True { Bold } ,
              False { Italics } ,
              { var } i);

            // If we get here, it is an ordinary word (table, field, etc.)
            // Increment the counter
            if not AWordFound and (AWord > '') then
              i := i + Length(AWord)
              // new position of i
            else
              Inc(i); // increment
          end
        else
          Inc(i); // increment
      end;
  finally
//    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@chrgSave));
//    SendMessage(AEditor.Handle, WM_SETREDRAW, Integer(True), 0);
    // Restore events
    AEditor.OnChange := AOnChange;
//    AEditor.OnSelectionChange := AOnSelectionChange;
    AEditor.OnKeyDown := AOnKeyDown;
    AEditor.Lines.EndUpdate; // end updating
  end;
end;


function TFrmXMLViewer.GetWordAt(APos: Integer; AText: string; var AStart,
  AEnd: Integer): string;
const
  arrayWordDelimiters: set of AnsiChar = [#0 .. #255] - ['0' .. '9', 'A' .. 'Z',
    'a' .. 'z', '_'];
var
  ATextLength: Integer;
begin
  // Initialize
  Result := '';
  AStart := APos;
  AEnd := APos;
  try
    ATextLength := Length(AText);
    if (ATextLength > 0) and (AText[AStart] <> #32) and
      (ATextLength > AStart) then
      begin
        // Find beginning position of the word we want
        while (AStart > 1) and not System.SysUtils.CharInSet(AText[AStart],
          arrayWordDelimiters) do
          Dec(AStart);
        if not System.SysUtils.CharInSet(AText[AStart], constSTANDARD_CHARS) and
          (AStart + 1 < ATextLength) then
          Inc(AStart);

        // Find the end position of the word
        while (AEnd < ATextLength) and not System.SysUtils.CharInSet(AText[AEnd],
          arrayWordDelimiters) do
          Inc(AEnd);
        if not System.SysUtils.CharInSet(AText[AEnd], constSTANDARD_CHARS) and
          (AEnd - 1 > 0) then
          Dec(AEnd);
        // Return the word
        Result := Copy(AText, AStart, AEnd - AStart + 1);
      end;
  except // suppress
  end;
end;

{$ENDREGION 'XML Formatting'}

{$ENDREGION 'TFrmXMLViewer'}

end.
