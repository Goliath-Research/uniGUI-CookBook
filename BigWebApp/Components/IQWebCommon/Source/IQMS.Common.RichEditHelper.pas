unit IQMS.Common.RichEditHelper;

interface

uses
      Winapi.Windows
    , Winapi.Messages
    , System.SysUtils
    , System.Classes
    , Vcl.Controls
    , Vcl.ComCtrls
    , Winapi.RichEdit
    , Winapi.ShellApi
    ;

type
  TRichEditHelper = class helper for TRichEdit
  public
    /// <summary> How text is displayed depends on whether it is RTF or plain text. </summary>
    procedure LoadText(const AText: string);
    /// </summary> Returns the text as RichText markup. </summary>
    function GetRichTextMarkup: string;
    /// </summary> Sets the text using the provided RichText markup. </summary>
    procedure SetRichTextMarkup(const AText: string);
    /// <summary> Set cursor position to X and Y. </summary>
    procedure UpdateCursorPos(const X, Y: Integer);
    /// <summary> Convert rich edit text (RTF) to plain text. </summary>
    /// <remarks> If the incoming RTF is broken -- for instance, if it were saved
    /// to a field that is smaller than the encoded text and then retrieved back --
    /// then the RTF encoding will display instead of plain text.
    /// </remarks>
    function RtfToPlainText(const ARTF: string): string;
  end;

type
  TRichEditEx = class(TRichEdit)
  private
    procedure CNNotify(var Msg: TWMNotify); message CN_NOTIFY;
  public
    procedure PasteFromClipboard; reintroduce;
    procedure CopyToClipboard; reintroduce;
    procedure CutToClipboard; reintroduce;
  protected
    procedure CreateWnd; override;
  end;

implementation

uses
  Clipbrd;

{$REGION 'TRichEditHelper'}


procedure TRichEditHelper.LoadText(const AText: string);
begin
  Clear;
  if Pos('{\rtf1\', AText) > 0 then
  begin
    if PlainText then
    begin
      Text := RtfToPlainText(AText);
    end
    else
    begin
      SetRichTextMarkup(AText);
    end;
  end
  else
    Text := AText;
end;

function TRichEditHelper.RtfToPlainText(const ARTF: string): string;
var
  ARichEdit: TRichEdit;
begin
  ARichEdit := TRichEdit.CreateParented(HWND_MESSAGE);
  try
    ARichEdit.PlainText := False;
    ARichEdit.SetRichTextMarkup(ARTF);
    ARichEdit.PlainText := True;
    Result := ARichEdit.Text;
  finally
    FreeAndNil(ARichEdit);
  end;
end;

function TRichEditHelper.GetRichTextMarkup: string;
var
  AStream: TStringStream;
begin
  Result := '';
  AStream := TStringStream.Create('');
  try
    Lines.SaveToStream(AStream);
    Result := AStream.DataString;
  finally
    AStream.Free;
  end;
end;

procedure TRichEditHelper.SetRichTextMarkup(const AText: string);
var
  AStream: TStringStream;
begin
  AStream := TStringStream.Create(AText);
  try
    PlainText := False;
    Lines.LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

procedure TRichEditHelper.UpdateCursorPos(const X, Y: Integer);
var
  P: TPoint;
begin
  // Updates the position of the insertion point in the TRichEdit with the
  // values supplied for X and Y.  This method may be used in OnDragOver
  // as users are about to drop a string at some point in the editor.
  P := Point(X, Y);
  SelStart := SendMessage(Handle, EM_CHARFROMPOS, 0, LongInt(@P));
  if CanFocus then
    SetFocus;
end;

{$ENDREGION 'TRichEditHelper'}

{$REGION 'TRichEditEx' }


procedure TRichEditEx.CreateWnd;
var
  mask: Word;
begin
  inherited CreateWnd;

  SendMessage(Handle, EM_AUTOURLDETECT, 1, 0);
  mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
end;

procedure TRichEditEx.CNNotify(var Msg: TWMNotify);
var
  P: TENLink;
  sURL: string;
begin
  if (Msg.NMHdr^.code = EN_LINK) then
  begin
    P := TENLink(Pointer(Msg.NMHdr)^);
    if (P.Msg = WM_LBUTTONDOWN) then
    begin
      try
        SendMessage(Handle, EM_EXSETSEL, 0, LongInt(@(P.chrg)));
        sURL := SelText;
        ShellExecute(Handle, 'open', PChar(sURL), nil, nil, SW_SHOWNORMAL);
      except
      end;
    end;
  end
  else
    inherited;
end;

procedure TRichEditEx.CutToClipboard;
begin
  if PlainText then
  begin
    Clipboard.AsText := SelText;
    SelText := '';
  end
  else
  begin
    SendMessage(Handle, WM_CUT, 0, 0);
  end;
end;

procedure TRichEditEx.CopyToClipboard;
begin
  if PlainText then
  begin
    Clipboard.AsText := SelText;
  end
  else
  begin
    SendMessage(Handle, WM_COPY, 0, 0);
  end;
end;

procedure TRichEditEx.PasteFromClipboard;
var
  AText: string;
begin
  AText := '';
  if PlainText and Clipboard.HasFormat(CF_TEXT) then
  begin
    SelText := Clipboard.AsText;
  end
  else
  begin
    SendMessage(Handle, WM_PASTE, 0, 0);
  end;
end;

{$ENDREGION 'TRichEditEx' }

end.
