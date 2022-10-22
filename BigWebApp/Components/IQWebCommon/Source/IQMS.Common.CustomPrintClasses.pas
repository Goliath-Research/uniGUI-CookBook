unit IQMS.Common.CustomPrintClasses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.StdCtrls, Vcl.Printers, WinSpool, IQMS.Common.CustomPrintInterface;

// TCustomPrint
//
// Example - This sends lines to the printer.
// *  var
// *    ACustomPrint: ICustomPrint;
// *  begin
// *    ACustomPrint := TCustomPrint.Create;
// *    with TCustomPrint(ACustomPrint) do
// *    begin
// *      // Set canvas font.  This is the font of the text.
// *      Font.Name := 'Arial';
// *      Font.Size := 14;
// *      Font.Style := [fsBold];
// *      Font.Color := clBlack;
// *      // Begin the print process
// *      StartDoc;
// *      // Add lines
// *      PrintLine(20, 20, AFont, 'Line 1');
// *      PrintLine(20, 20 + CanvasTextHeight, AFont, 'Line 2');
// *      // End the print process and send all lines to the printer
// *      EndDoc;
// *    end;

type
  TPrintHeaderEvent =
    procedure(APageNumber: Integer; ATextRect: TRect) of object;

  TPrintFooterEvent =
    procedure(APageNumber: Integer; ATextRect: TRect) of object;

  TCustomPrint = class(TInterfacedObject, ICustomPrint)
  strict private
    { Private declarations }
    FHeaderCaption: string;
    FRightMargin: Single;
    FLinesPerInch: Single;
    FLeftMargin: Single;
    FBottomMargin: Single;
    FTopMargin: Single;
    // FFont: TFont;
    FLines: TStringList;
    FShowPrintFinishedDlg: Boolean;
    FShowHeader: Boolean;
    FShowFooter: Boolean;
    F_Y_resolution: Integer;
    F_X_resolution: Integer;
    FPageRect: TRect;
    FTextRect: TRect;
    FFooterRect: TRect;
    FHeaderRect: TRect;
    FLineHeight: Integer;
    FPageCount: Integer;
    FHeaderOnFirstPage: Boolean;
    FFooterOnFirstPage: Boolean;

    // Returns number of pages
    function PrintStrings(ALines: TStringList;
      ACountPagesOnly: Boolean;
      AOnPrintHeader: TPrintHeaderEvent;
      AOnPrintFooter: TPrintFooterEvent): Integer;

    procedure CalcPrintRects;
    procedure ClearRect(var R: TRect);
    function GetCanvasTextHeight: Integer;
    function GetCanvasFont: TFont;
    procedure SetCanvasFont(const Value: TFont);
    procedure SafeAssignFont(const AFromFont: TFont; var AToFont: TFont);
    function GetOrientation: TPrinterOrientation;
    procedure SetOrientation(const Value: TPrinterOrientation);
    procedure SetCanvasFontName(const Value: string);
    procedure SetCanvasFontSize(const Value: Integer);
    procedure SetCanvasFontStyles(const Value: TFontStyles);
    function GetTextRect: TRect;
    function GetLines: TStringList;
    procedure SetLines(const Value: TStringList);
    function GetShowHeader: Boolean;
    procedure SetShowHeader(const Value: Boolean);
    function GetShowFooter: Boolean;
    procedure SetShowFooter(const Value: Boolean);
    function GetHeaderCaption: string;
    procedure SetHeaderCaption(const Value: string);
    function GetLeftMargin: Single;
    procedure SetLeftMargin(const Value: Single);
    function GetRightMargin: Single;
    procedure SetRightMargin(const Value: Single);
    function GetTopMargin: Single;
    procedure SetTopMargin(const Value: Single);
    function GetBottomMargin: Single;
    procedure SetBottomMargin(const Value: Single);
    function GetShowPrintFinished: Boolean;
    procedure SetShowPrintFinished(const Value: Boolean);
    function GetHeaderOnFirstPage: Boolean;
    procedure SetHeaderOnFirstPage(const Value: Boolean);
    function GetFooterOnFirstPage: Boolean;
    procedure SetFooterOnFirstPage(const Value: Boolean);
  strict protected
    { Protected declarations }
    procedure OnPrintHeader(APageNumber: Integer; ATextRect: TRect); virtual;
    procedure OnPrintFooter(APageNumber: Integer; ATextRect: TRect); virtual;
  public
    { Public declarations }
    constructor Create; reintroduce;
    destructor Destroy; override;

    procedure Execute;

    // Returns number of pages (no pages will print)
    function CountPages: Integer;

    procedure StartDoc;
    procedure PrintLine(const ALeft, ATop: Integer; AText: string);
    procedure PrintFooter(const APageNumber: Integer = 1);
    procedure PrintHeader(const APageNumber: Integer = 1);
    procedure EndDoc;

    { Published declarations }
    property Lines: TStringList read GetLines write SetLines;
    property HeaderCaption: string read GetHeaderCaption write SetHeaderCaption;
    property LeftMargin: Single read GetLeftMargin write SetLeftMargin;
    property RightMargin: Single read GetRightMargin write SetRightMargin;
    property TopMargin: Single read GetTopMargin write SetTopMargin;
    property BottomMargin: Single read GetBottomMargin write SetBottomMargin;
    property LinesPerInch: Single read FLinesPerInch write FLinesPerInch;

    property Font: TFont read GetCanvasFont; // write SetCanvasFont;
    property FontName: string write SetCanvasFontName;
    property FontSize: Integer write SetCanvasFontSize;
    property FontStyle: TFontStyles write SetCanvasFontStyles;

    property Orientation: TPrinterOrientation read GetOrientation write SetOrientation;
    property ShowPrintFinished: Boolean read GetShowPrintFinished write SetShowPrintFinished;
    property ShowHeader: Boolean read GetShowHeader write SetShowHeader;
    property ShowFooter: Boolean read GetShowFooter write SetShowFooter;
    property HeaderOnFirstPage: Boolean read GetHeaderOnFirstPage write SetHeaderOnFirstPage
      default True;
    property FooterOnFirstPage: Boolean read GetFooterOnFirstPage write SetFooterOnFirstPage
      default True;

    /// <summary> Horizontal printer resolution, in dpi. </summary>
    property X_resolution: Integer read F_X_resolution;
    // <summary>Vertical printer resolution, in dpi</summary>
    property Y_resolution: Integer read F_Y_resolution;
    // <summary>Total page size, in paper coordinates.</summary>
    property PageRect: TRect read FPageRect;
    // <summary> Output area, in canvas coordinates.</summary>
    property TextRect: TRect read GetTextRect;
    // <summary>Header size, in paper coordinates.</summary>
    property HeaderRect: TRect read FHeaderRect;
    // <summary>Footer size, in paper coordinates.</summary>
    property FooterRect: TRect read FFooterRect;
    property DefaultLineHeight: Integer read FLineHeight;
    property PageCount: Integer read FPageCount;
    property CanvasTextHeight: Integer read GetCanvasTextHeight;
    function CanvasTextWidth(const AText: string): Integer;
  end;

implementation

uses
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils;

{$REGION 'TCustomPrint'}


constructor TCustomPrint.Create;
begin
  inherited Create;
  FLines := TStringList.Create;
  FHeaderCaption := '';
  FLeftMargin := 1;
  FRightMargin := 1;
  FTopMargin := 1;
  FBottomMargin := 1;
  FLinesPerInch := 6;
  FShowPrintFinishedDlg := False;
  FHeaderOnFirstPage := True;
  FFooterOnFirstPage := True;
  FShowHeader := False;
  FShowFooter := False;
  ClearRect(FPageRect);
  ClearRect(FTextRect);
  ClearRect(FFooterRect);
  ClearRect(FHeaderRect);
end;

destructor TCustomPrint.Destroy;
begin
  if Assigned(FLines) then
    FLines.Free;
  inherited Destroy;
end;

procedure TCustomPrint.ClearRect(var R: TRect);
begin
  R.Left := 0;
  R.Top := 0;
  R.Right := 0;
  R.Bottom := 0;
end;

procedure TCustomPrint.Execute;
begin
  FPageCount := PrintStrings(FLines, // text to print
    False, // count pages only?
    OnPrintHeader, // header event
    OnPrintFooter); // footer event

  if ShowPrintFinished then
    IQMS.Common.Dialogs.IQInformation(Format('%d pages printed', [FPageCount]));

end;

function TCustomPrint.CountPages: Integer;
begin
  FPageCount := PrintStrings(
    FLines, // text to print
    True, // count pages only?
    OnPrintHeader, // header event
    OnPrintFooter); // footer event
  Result := FPageCount;
end;

procedure TCustomPrint.OnPrintFooter(APageNumber: Integer; ATextRect: TRect);
var
  S: string;
  res: Integer;
begin

  if not ShowFooter then
    Exit;

  if not FFooterOnFirstPage and (APageNumber = 1) then
    Exit;

  with Printer.Canvas do
  begin
    // Draw a gray line one point wide below the text
    res := GetDeviceCaps(Handle, LOGPIXELSY);
    pen.Style := psSolid;
    pen.Color := clGray;
    pen.Width := Round(res / 72);
    MoveTo(ATextRect.Left, ATextRect.Top);
    LineTo(ATextRect.Right, ATextRect.Top);
    // Print the page number in Arial 8pt, gray, on right side of
    // footer rect.
    S := Format('Page %d', [APageNumber]);
    Font.Name := Self.Font.Name; // 'Arial';
    Font.Size := 8;
    Font.Color := clGray;
    TextOut(
      ATextRect.Right - TextWidth(S),
      ATextRect.Top + res div
      18,
      S);
  end;
end;

procedure TCustomPrint.OnPrintHeader(APageNumber: Integer; ATextRect: TRect);
var
  res: Integer;
begin

  if not ShowHeader then
    Exit;

  if not FHeaderOnFirstPage and (APageNumber = 1) then
    Exit;

  with Printer.Canvas do
  begin
    // Draw a gray line one point wide 4 points above the text
    res := GetDeviceCaps(Handle, LOGPIXELSY);
    pen.Style := psSolid;
    pen.Color := clGray;
    pen.Width := Round(res / 72);
    MoveTo(ATextRect.Left, ATextRect.Bottom - res div 18);
    LineTo(ATextRect.Right, ATextRect.Bottom - res div 18);
    // // Print the company name in Arial 8pt, gray, on left side of
    // footer rect.
    Font.Name := Self.Font.Name; // 'Arial';
    Font.Size := 8;
    Font.Color := clGray;
    TextOut(ATextRect.Left, ATextRect.Bottom - res div 10 -
      TextHeight('W'), HeaderCaption);
  end;
end;

// Calculate text output and header/footer rectangles.
procedure TCustomPrint.CalcPrintRects;
var
  printorigin: TPoint; // origin of canvas coordinate system in paper coordinates.

  // Get resolution, paper size and non-printable margin from
  // printer driver.
  procedure GetPrinterParameters;
  begin
    with Printer.Canvas do
    begin
      F_X_resolution := GetDeviceCaps(Handle, LOGPIXELSX);
      F_Y_resolution := GetDeviceCaps(Handle, LOGPIXELSY);
      printorigin.X := GetDeviceCaps(Handle, PHYSICALOFFSETX);
      printorigin.Y := GetDeviceCaps(Handle, PHYSICALOFFSETY);
      FPageRect.Left := 0;
      FPageRect.Right := GetDeviceCaps(Handle, PHYSICALWIDTH);
      FPageRect.Top := 0;
      FPageRect.Bottom := GetDeviceCaps(Handle, PHYSICALHEIGHT);
    end;
  end;

// Calculate area between the requested margins, paper-relative.
// Adjust margins if they fall outside the printable area.
// Validate the margins, raise EPrinter exception if no text area
// is left.
  procedure CalcRects;
  var
    max: Integer;
  begin
    with FTextRect do
    begin
      // Figure FTextRect in paper coordinates
      Left := Round(LeftMargin * X_resolution);
      if Left < printorigin.X then
        Left := printorigin.X;

      Top := Round(TopMargin * Y_resolution);
      if Top < printorigin.Y then
        Top := printorigin.Y;

      // Printer.PageWidth and PageHeight return the size of the
      // printable area, we need to add the printorigin to get the
      // edge of the printable area in paper coordinates.
      Right := PageRect.Right - Round(RightMargin * X_resolution);
      max := Printer.PageWidth + printorigin.X;
      if Right > max then
        Right := max;

      Bottom := PageRect.Bottom - Round(BottomMargin *
        Y_resolution);
      max := Printer.PageHeight + printorigin.Y;
      if Bottom > max then
        Bottom := max;

      // Validate the margins.
      if (Left >= Right) or (Top >= Bottom) then
        raise EPrinter.Create(
          'PrintString: the supplied margins are too large.  ' +
          'There is no area to print left on the page.');
    end;

    // Convert FTextRect to canvas coordinates.
    OffsetRect(FTextRect, - printorigin.X, - printorigin.Y);

    // Build header and footer rects.
    FHeaderRect := Rect(FTextRect.Left, 0,
      FTextRect.Right, FTextRect.Top);
    FFooterRect := Rect(FTextRect.Left, FTextRect.Bottom,
      FTextRect.Right, Printer.PageHeight);
  end;

// -------------------------------------------------------------------------
begin
  GetPrinterParameters;
  CalcRects;
  FLineHeight := Round(Y_resolution / LinesPerInch);
end;

function TCustomPrint.PrintStrings(ALines: TStringList;
  ACountPagesOnly: Boolean; AOnPrintHeader: TPrintHeaderEvent;
  AOnPrintFooter: TPrintFooterEvent): Integer;
var
  continuePrint: Boolean; // continue/abort flag for callbacks
  PageCount: Integer; // number of current page
  charheight: Integer; // font height in dots
  textstart: Integer; // index of first line to print on current page, 0-based.
  ASavedFont: TFont;

  // Print a page with headers and footers.
  // Start Print Page
  procedure PrintPage;

    procedure FireHeaderEvent(event: TPrintHeaderEvent; R: TRect);
    begin
      if Assigned(event) then
      begin
        event(PageCount, R);
        // Restore original font, in case it was changed.
        Self.SetCanvasFont(ASavedFont);
      end;
    end;

    procedure FireFooterEvent(event: TPrintFooterEvent; R: TRect);
    begin
      if Assigned(event) then
      begin
        event(PageCount, R);
        // Restore original font, in case it was changed.
        Self.SetCanvasFont(ASavedFont);
      end;
    end;

    procedure DoHeader;
    begin
      FireHeaderEvent(AOnPrintHeader, FHeaderRect);
    end;

    procedure DoFooter;
    begin
      FireFooterEvent(AOnPrintFooter, FFooterRect);
    end;

    procedure DoPage;
    const
      C_TAB_SPACES: string = '        ';
    var
      Y: Integer;
      S: string;
    begin
      Y := FTextRect.Top;
      while (textstart < ALines.Count) and
        (Y <= (FTextRect.Bottom - charheight)) do
      begin
        // Note: use TextRect instead of TextOut to effect clipping
        // of the line on the right margin. It is a bit slower,
        // though. The clipping rect would be
        // Rect( FTextRect.left, y, FTextRect.right, y+charheight).
        // 01/07/2014 Fix the text so that Tab characters print as spaces
        S := IQMS.Common.StringUtils.StrTran(ALines[textstart], #9, C_TAB_SPACES);
        Printer.Canvas.TextOut(FTextRect.Left, Y, S);
        Inc(textstart);
        Inc(Y, FLineHeight);
      end;
    end;

  begin
    DoHeader;
    if continuePrint then
    begin
      DoPage;
      DoFooter;
      if (textstart < ALines.Count) and continuePrint then
      begin
        Inc(PageCount);
        Printer.NewPage;
      end;
    end;
  end; // End Print Page

begin // PrintStrings
  continuePrint := True;
  PageCount := 1;
  textstart := 0;

  try
    ASavedFont := TFont.Create;
    Self.SafeAssignFont(Printer.Canvas.Font, ASavedFont);

    StartDoc; // see below
    charheight := GetCanvasTextHeight;
    while (textstart < ALines.Count) and continuePrint do
      PrintPage;
  finally
    if continuePrint and not ACountPagesOnly then
      Printer.EndDoc
    else
      Printer.Abort;
    if Assigned(ASavedFont) then
      ASavedFont.Free;
  end;

  if continuePrint then
    Result := PageCount
  else
    Result := 0;
end;

procedure TCustomPrint.PrintHeader(const APageNumber: Integer);
var
  AFont: TFont;
begin
  try
    // If this method is called, then override (and overwrite) this property
    FShowHeader := True;
    AFont := TFont.Create;
    SafeAssignFont(Printer.Canvas.Font, AFont);
    OnPrintHeader(APageNumber, FHeaderRect);
  finally
    SetCanvasFont(AFont);
    AFont.Free;
  end;
end;

procedure TCustomPrint.PrintFooter(const APageNumber: Integer);
var
  AFont: TFont;
begin
  try
    // If this method is called, then override (and overwrite) this property
    FShowFooter := True;

    AFont := TFont.Create;
    SafeAssignFont(Printer.Canvas.Font, AFont);
    OnPrintFooter(APageNumber, FFooterRect);
  finally
    SetCanvasFont(AFont);
    AFont.Free;
  end;
end;

procedure TCustomPrint.SafeAssignFont(const AFromFont: TFont;
  var AToFont: TFont);
begin
  if not Assigned(AFromFont) or
    not Assigned(AToFont) then
    Exit;

  AToFont.Name := AFromFont.Name;
  AToFont.Size := AFromFont.Size;
  AToFont.Style := AFromFont.Style;
  // AToFont.Color := AFromFont.Color;
end;

function TCustomPrint.GetCanvasTextHeight: Integer;
begin
  Result := Printer.Canvas.TextHeight('Äy');
end;

function TCustomPrint.GetHeaderCaption: string;
begin
  Result := FHeaderCaption;
end;

procedure TCustomPrint.SetHeaderCaption(const Value: string);
begin
  FHeaderCaption := Value;
end;

function TCustomPrint.GetHeaderOnFirstPage: Boolean;
begin
  Result := FHeaderOnFirstPage;
end;

procedure TCustomPrint.SetHeaderOnFirstPage(const Value: Boolean);
begin
  FHeaderOnFirstPage := Value;
end;

function TCustomPrint.GetFooterOnFirstPage: Boolean;
begin
  Result := FFooterOnFirstPage;
end;

procedure TCustomPrint.SetFooterOnFirstPage(const Value: Boolean);
begin
  FFooterOnFirstPage := Value;
end;

function TCustomPrint.GetLeftMargin: Single;
begin
  Result := FLeftMargin;
end;

procedure TCustomPrint.SetLeftMargin(const Value: Single);
begin
  FLeftMargin := Value;
end;

function TCustomPrint.GetRightMargin: Single;
begin
  Result := FRightMargin;
end;

procedure TCustomPrint.SetRightMargin(const Value: Single);
begin
  FRightMargin := Value;
end;

function TCustomPrint.GetTopMargin: Single;
begin
  Result := FTopMargin;
end;

procedure TCustomPrint.SetTopMargin(const Value: Single);
begin
  FTopMargin := Value;
end;

function TCustomPrint.GetBottomMargin: Single;
begin
  Result := FBottomMargin;
end;

procedure TCustomPrint.SetBottomMargin(const Value: Single);
begin
  FBottomMargin := Value;
end;

function TCustomPrint.GetLines: TStringList;
begin
  Result := FLines;
end;

procedure TCustomPrint.SetLines(const Value: TStringList);
begin
  if Assigned(Value) then
    FLines.Text := Value.Text;
end;

function TCustomPrint.CanvasTextWidth(const AText: string): Integer;
begin
  Result := Printer.Canvas.TextWidth(AText);
end;

procedure TCustomPrint.StartDoc;
begin
  Printer.BeginDoc;
  CalcPrintRects;
  Printer.Canvas.Font.PixelsPerInch := Y_resolution;
end;

procedure TCustomPrint.EndDoc;
begin
  Printer.EndDoc;
end;

procedure TCustomPrint.PrintLine(const ALeft, ATop: Integer; AText: string);
begin
  Printer.Canvas.TextOut(ALeft, ATop, AText);
end;

function TCustomPrint.GetCanvasFont: TFont;
begin
  Result := Printer.Canvas.Font;
end;

procedure TCustomPrint.SetCanvasFont(const Value: TFont);
begin
  Printer.Canvas.Font.Name := Value.Name;
  Printer.Canvas.Font.Size := Value.Size;
  Printer.Canvas.Font.Style := Value.Style;
  // Printer.Canvas.Font.Color := Value.Color;
end;

procedure TCustomPrint.SetCanvasFontName(const Value: string);
begin
  Printer.Canvas.Font.Name := Value;
end;

procedure TCustomPrint.SetCanvasFontSize(const Value: Integer);
begin
  Printer.Canvas.Font.Size := Value;
end;

procedure TCustomPrint.SetCanvasFontStyles(const Value: TFontStyles);
begin
  Printer.Canvas.Font.Style := Value;
end;

function TCustomPrint.GetOrientation: TPrinterOrientation;
begin
  Result := Printer.Orientation;
end;

function TCustomPrint.GetShowFooter: Boolean;
begin
  Result := FShowFooter;
end;

procedure TCustomPrint.SetShowFooter(const Value: Boolean);
begin
  FShowFooter := Value;
end;

function TCustomPrint.GetShowHeader: Boolean;
begin
  Result := FShowHeader;
end;

function TCustomPrint.GetShowPrintFinished: Boolean;
begin
  Result := FShowPrintFinishedDlg;
end;

procedure TCustomPrint.SetShowPrintFinished(const Value: Boolean);
begin
  FShowPrintFinishedDlg := Value;
end;

procedure TCustomPrint.SetShowHeader(const Value: Boolean);
begin
  FShowHeader := Value;
end;

function TCustomPrint.GetTextRect: TRect;
begin
  Result := FTextRect;
end;

procedure TCustomPrint.SetOrientation(const Value: TPrinterOrientation);
begin
  Printer.Orientation := Value;
end;

{$ENDREGION 'TCustomPrint'}


end.
