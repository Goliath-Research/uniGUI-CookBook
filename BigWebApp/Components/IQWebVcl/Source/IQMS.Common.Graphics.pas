unit IQMS.Common.Graphics;

{
  Load various graphics formats (BMP, JPG, WMF, EMF, ICO, GIF) into a
  pf24bit TBitmap.  The use of a pf24bit TBitmap avoids any palette issues.
}

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  System.Math, AxCtrls, IQMS.WebVcl.DropDownButton, Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  UniImage,
  UniLabel,
  UniCanvas,
  UniStatusBar,
  UniImageList,
  uniSpeedButton,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys;

// Loads a bitmap into a TBitmap object from a TImageList
procedure LoadBitmapFromImageList(const AImageList: TUniImageList;
  const AImageIndex: Integer; const AImage: TUniImage); overload;
procedure LoadBitmapFromImageList(const AImageList: TUniImageList;
  const AImageIndex: Integer; const ABitMap: TBitMap); overload;

procedure LoadButtonImageFromImageList(const ASpeedButton: TUniSpeedButton;
  const AImageList: TUniImageList; const AImageIndex: Integer); overload;
procedure LoadButtonImageFromImageList(const ABitButton: TUniBitBtn;
  const AImageList: TUniImageList; const AImageIndex: Integer); overload;
procedure LoadButtonImageFromImageList(const ADropDownButton: TIQWebDropDownButton;
  const AImageList: TUniImageList; const AImageIndex: Integer); overload;

// Places a bitmap on a TStatusBar
procedure SetStatusBarBitmap(const AImageList: TUniImageList;
  const AImageIndex: Integer; const AImage: TUniImage;
  const AStatusBar: TUniStatusBar; const APanel: Integer;
  const AStatusText, AImageHint: string);

// Compares 2 icons (TIcon) to see if they are the same
function IconsAreEqual(const Icon1, Icon2: TIcon): Boolean;

// Compares 2 bitmaps (TBitmap) to see if they are the same
function BitmapsAreEqual(const ABmp1, ABmp2: TBitmap): Boolean;

// Scales a bitmap
function ScaleBitmap(iPercent: Integer; var bmp: TBitmap): Boolean;
function ScaleBitmapTo(ASize: Integer; var bmp: TBitmap): Boolean;
procedure GetImageSize(const AFileName: TFileName;
  var AWidth, AHeight: Integer); overload;
procedure GetImageSize(const ABitMap: TBitmap;
  var AWidth, AHeight: Integer); overload;

// loads any image format to a TBitMap
function LoadGraphicsFile(const AFileName: TFileName): TBitmap;
  deprecated 'Use LoadGraphicFileAsBitmap';
function LoadGraphicFileAsBitmap(const AFileName: TFileName;
  var ABitmap: TBitmap): Boolean;
// fills a TImage with a TBitmap from any file
procedure LoadImageFromFile(AImage: TUniImage; const AFileName: TFileName);

// returns a 16x16 bitmap "swatch" of the specified color
function GetSwatch(AColor, ATransparentColor: TColor): TBitmap;

procedure DrawGradient(ACanvas: TUniCanvas; ARect: TRect; AColors: array of TColor;
  AHorizontal: Boolean = False);
procedure DrawFrame(ACanvas: TUniCanvas;  ARect: TRect; ABorderDark, ABorderLight: TColor);

// Returns the appropriate font color for the given back color
// (See the note and example in the method below).
procedure GetInverseColors(ABackColor: TColor;
  var ANormalFontColor, ADisabledFontColor: TColor);
function GetFontColor(ABackColor: TColor): TColor;

// Returns a lighter version of the input color (AInputColor).
// The higher the level (ALightnessLevel), the lighter the color.
function LightenColor(AInputColor: TColor; ALightnessLevel: Byte = 250;
  AGrayScale: Boolean = False): TColor;

function GetHighlightColor(BaseColor: TColor): TColor;
function GetShadowColor(BaseColor: TColor): TColor;

procedure GetColorToRGB(BaseColor: TColor; var R, G, B: Integer);
procedure SetRGBToColor(R, G, B: Integer; var AColor: TColor);

function FindGraphicClass(const Buffer; const BufferSize: Int64;
  out GraphicClass: TGraphicClass): Boolean; overload;
function FindGraphicClass(Stream: TStream;
  out GraphicClass: TGraphicClass): Boolean; overload;
function LoadPictureFromField(AField: TBlobField;
  var Picture: TPicture): Boolean;

type
  TFadeDirection = (fdFadeIn, fdFadeOut);

procedure FadeLabel(ALabel: TUniLabel; ATargetColor: TColor;
  AFadeDirection: TFadeDirection; ADelay: Byte = 1);
procedure FadePanel(APanel: TUniPanel; ATargetColor: TColor;
  AFadeDirection: TFadeDirection; ADelay: Byte = 1);

procedure MakeThumbNail(AOriginalBmp, ATargetBmp: TBitmap;
  AThumbnailSize: Word);

const
  MinGraphicSize = 44; // we may test up to & including the 11th longword

type
  THSL = record
    Hue: Integer;
    Saturation: Integer;
    Lightness: Integer;
  end;

function ColorToHSL(Color: TColor): THSL;
function HSLtoColor(HSL: THSL): TColor;

implementation

uses
  IQMS.Common.StringUtils,
  GIFImg,
  JPEG,
  PngImage;

function ColorToHSL(Color: TColor): THSL;
var
  R, G, B, Delta, Max, Min: real;
  H, S, L: real;

  procedure _MinMaxDouble3(const Value1, Value2, Value3: real;
    var Min, Max: real);
  begin
    if Value1 > Value2 then
      begin
        if Value1 > Value3 then
          Max := Value1
        else
          Max := Value3;

        if Value2 < Value3 then
          Min := Value2
        else
          Min := Value3
      end
    else begin
        if Value2 > Value3 then
          Max := Value2
        else
          Max := Value3;

        if Value1 < Value3 then
          Min := Value1
        else
          Min := Value3;
      end;
  end;

begin
  { RGB, each 0 to 255, to HSL.
    H = 0 to 359 (corresponding to 0..359 degrees around hexcone)
    S = 0 (shade of gray) to 255 (pure color)
    L = 0 (black) to 255 {white) }

  R := GetRValue(ColorToRGB(Color)) / 255;
  G := GetGValue(ColorToRGB(Color)) / 255;
  B := GetBValue(ColorToRGB(Color)) / 255;
  _MinMaxDouble3(R, G, B, Min, Max);

  // calculate luminosity
  L := (Max + Min) / 2;

  if Max = Min then // it's grey
    begin
      H := 0; // it's actually undefined
      S := 0
    end
  else begin
      Delta := Max - Min;
      // calculate Saturation
      if L < 0.5 then
        S := Delta / (Max + Min)
      else
        S := Delta / (2 - Max - Min);

      // calculate Hue
      if R = Max then
        H := (G - B) / Delta
      else if G = Max then
        H := 2 + (B - R) / Delta
      else
        H := 4 + (R - G) / Delta;

      H := H / 6;

      if H < 0 then
        H := H + 1
    end;

  Result.Hue := Round(H * (359 - 1));
  Result.Saturation := Round(S * 255);
  Result.Lightness := Round(L * 255);
end;

function HSLtoColor(HSL: THSL): TColor;
var
  M1, M2: real;

  function _HueToColourValue(Hue: real): Byte;
  var
    V: real;
  begin
    if Hue < 0 then
      Hue := Hue + 1
    else if Hue > 1 then
      Hue := Hue - 1;
    if 6 * Hue < 1 then
      V := M1 + (M2 - M1) * Hue * 6
    else if 2 * Hue < 1 then
      V := M2
    else if 3 * Hue < 2 then
      V := M1 + (M2 - M1) * (2 / 3 - Hue) * 6
    else
      V := M1;
    Result := Round(255 * V)
  end;

var
  H, S, L: real;
  R, G, B: Byte;
begin
  H := HSL.Hue / (359 - 1);
  S := HSL.Saturation / 255;
  L := HSL.Lightness / 255;
  if S = 0 then
    begin
      R := Round(255 * L);
      G := R;
      B := R
    end
  else begin
      if L <= 0.5 then
        M2 := L * (1 + S)
      else
        M2 := L + S - L * S;
      M1 := 2 * L - M2;
      R := _HueToColourValue(H + 1 / 3);
      G := _HueToColourValue(H);
      B := _HueToColourValue(H - 1 / 3)
    end;
  Result := RGB(R, G, B);
end;

procedure LoadBitmapFromImageList(const AImageList: TUniImageList;
  const AImageIndex: Integer; const AImage: TUniImage);
var
  bmp: TBitmap;
begin
  // Loads a bitmap from an imagelist (by index) into a TImage
  if AImageList = nil then
    Exit;
  if AImage = nil then
    Exit;
  try
    bmp := TBitmap.Create;
    AImageList.GetBitmap(AImageIndex, bmp);

    if not AImage.Picture.Bitmap.Empty and
      not BitmapsAreEqual(AImage.Picture.Bitmap, bmp) then
      AImage.Picture.Bitmap.Assign(bmp)
    else
      AImage.Picture.Bitmap.Assign(bmp);
  finally
    if (bmp <> nil) and Assigned(bmp) then
      FreeAndNil(bmp);
  end;
end;

procedure LoadBitmapFromImageList(const AImageList: TUniImageList;
  const AImageIndex: Integer; const ABitMap: TBitMap); overload;
begin
  // Loads a bitmap from an imagelist (by index) into a TImage
  if (AImageList <> nil) and (ABitMap <> nil) then
    AImageList.GetBitmap(AImageIndex, ABitMap);
end;

procedure LoadButtonImageFromImageList(const ASpeedButton: TUniSpeedButton;
  const AImageList: TUniImageList; const AImageIndex: Integer);
begin
  if not Assigned(ASpeedButton) or not Assigned(AImageList) then
    Exit;
  ASpeedButton.Glyph := nil;
  if (AImageIndex >= 0) and (AImageIndex <= AImageList.Count) then
    AImageList.GetBitmap(AImageIndex, ASpeedButton.Glyph);
end;

procedure LoadButtonImageFromImageList(const ABitButton: TUniBitBtn;
  const AImageList: TUniImageList; const AImageIndex: Integer);
begin
  if not Assigned(ABitButton) or not Assigned(AImageList) then
    Exit;
  ABitButton.Glyph := nil;
  if (AImageIndex >= 0) and (AImageIndex <= AImageList.Count) then
    AImageList.GetBitmap(AImageIndex, ABitButton.Glyph);
end;

procedure LoadButtonImageFromImageList(const ADropDownButton: TIQWebDropDownButton;
  const AImageList: TUniImageList; const AImageIndex: Integer); overload;
begin
  if not Assigned(ADropDownButton) or not Assigned(AImageList) then
    Exit;
  ADropDownButton.Glyph := nil;
  if (AImageIndex >= 0) and (AImageIndex <= AImageList.Count) then
    AImageList.GetBitmap(AImageIndex, ADropDownButton.Glyph);
end;

procedure SetStatusBarBitmap(const AImageList: TUniImageList;
  const AImageIndex: Integer; const AImage: TUniImage;
  const AStatusBar: TUniStatusBar; const APanel: Integer;
  const AStatusText, AImageHint: string);
var
  ALeft, i: Integer;
begin
  if AImageList = nil then
    Exit;
  if AImage = nil then
    Exit;
  if AStatusBar = nil then
    Exit;

  // Initialization and setup
  AImage.Transparent := TRUE;
  AImage.Width := 16; // standard size for status bar
  AImage.Height := 16;
  LoadBitmapFromImageList(AImageList, AImageIndex, AImage);
  AStatusBar.Height := 22; // NOTE:  The status bar height must be 22
  ALeft := 2;

  // Get the left position from the panel index
  for i := 0 to AStatusBar.Panels.Count - 1 do
    begin
      if i >= APanel then
        BREAK;
      ALeft := ALeft + (AStatusBar.Panels[i].Width + 2);
    end;

  // Configure and position the image
  with AImage do
    begin
      Parent := AStatusBar;
      Left := ALeft;
      Top := 4;
      Visible := TRUE;
      Hint := AImageHint;
      ShowHint := TRUE;
    end;

  // Display the text
  AStatusBar.Panels[APanel].Text := Repl(' ', 8) + AStatusText;
  AStatusBar.Update;

end;

function IconsAreEqual(const Icon1, Icon2: TIcon): Boolean;
var
  ms1: TMemoryStream;
  ms2: TMemoryStream;
begin
  Result := False;
  ms1 := TMemoryStream.Create;
  try
    Icon1.SaveToStream(ms1);
    ms2 := TMemoryStream.Create;
    try
      Icon2.SaveToStream(ms2);
      if ms1.Size = ms2.Size then
        // Compare the streams
        Result := CompareMem(ms1.Memory, ms2.Memory, ms1.Size)
    finally
      ms2.Free
    end
  finally
    ms1.Free
  end
end;

function BitmapsAreEqual(const ABmp1, ABmp2: TBitmap): Boolean;
var
  ms1: TMemoryStream;
  ms2: TMemoryStream;
begin
  Result := False;
  ms1 := TMemoryStream.Create;
  try
    ABmp1.SaveToStream(ms1);
    ms2 := TMemoryStream.Create;
    try
      ABmp2.SaveToStream(ms2);
      if ms1.Size = ms2.Size then
        // Compare the streams
        Result := CompareMem(ms1.Memory, ms2.Memory, ms1.Size)
    finally
      ms2.Free
    end
  finally
    ms1.Free
  end
end;

function ScaleBitmap(iPercent: Integer; var bmp: TBitmap): Boolean;
var
  ATempBmp: TBitmap;
  ARect: TRect;
  H, w: Integer;
begin
  Result := False;

  // the original bitmap must be assigned
  if not Assigned(bmp) then
    raise Exception.Create('Application Error: Bitmap not supplied.');

  try
    // create a temporary bitmap to hold the resized image
    ATempBmp := TBitmap.Create;
    try
      // get the new height and width based on the percentage
      H := Trunc(bmp.Height * (iPercent / 100));
      w := Trunc(bmp.Width * (iPercent / 100));

      // set the width and height of the temporary bitmap
      ATempBmp.Width := w;
      ATempBmp.Height := H;

      // create a TRect of the new size
      ARect := Rect(0, 0, w, H);

      // stretch draw the original image onto the canvas of the temporary bitmap,
      // using the original image and using the region supplied by the TRect.
      ATempBmp.Canvas.StretchDraw(ARect, bmp);

      // now assign the temporary bitmap to the original
      bmp.Assign(ATempBmp);

    finally
      // free the temporary bitmap
      ATempBmp.Free;
    end;

    // if we get here, all went well
    Result := TRUE;
  except
    Result := False;
  end;
end;

function ScaleBitmapTo(ASize: Integer; var bmp: TBitmap): Boolean;
var
  ATgtSize, AMaxVal, H, w: Integer;
  APct: Integer;
begin
  if (ASize <= 0) then
    Exit;
  if not Assigned(bmp) then
    raise Exception.Create('Application Error: Bitmap not supplied.');

  // Get the max value for width vs. height
  AMaxVal := Max(bmp.Height, bmp.Width);
  if AMaxVal = 0 then
    AMaxVal := ASize;
  ATgtSize := Min(AMaxVal, ASize);

  // What percent of the full value is our target size?
  APct := Trunc((100 / AMaxVal) * ATgtSize);

  // scale the bitmap
  if APct <> 100 then
    ScaleBitmap(APct, bmp); // in this unit
end;

procedure GetImageSize(const AFileName: TFileName;
  var AWidth, AHeight: Integer); overload;
var
  bmp: TBitmap;
begin
  try
    // create temporary bitmap
    bmp := TBitmap.Create;
    bmp := LoadGraphicsFile(AFileName);

    // overload method, see below
    GetImageSize(bmp, AWidth, AHeight);

  finally
    // free temporary bitmap
    if Assigned(bmp) then
      bmp.Free;
  end;
end;

procedure GetImageSize(const ABitMap: TBitmap;
  var AWidth, AHeight: Integer); overload;
begin
  // initialize
  AWidth := 0;
  AHeight := 0;

  // get image size
  if Assigned(ABitMap) then
    begin
      AWidth := ABitMap.Width;
      AHeight := ABitMap.Height;
    end;
end;

function LoadGraphicsFile(const AFileName: TFileName): TBitmap;
var
  ATempImage: TPicture;
  AMetaFile: TMetafile;
  AExt: string;
begin
  Result := nil;

  if FileExists(AFileName) then
    begin
      Result := TBitmap.Create;

      AExt := Trim(UpperCase(ExtractFileExt(AFileName)));
      if (AExt = '.WMF') then
        // meta files
        try
          AMetaFile := TMetafile.Create;
          AMetaFile.LoadFromFile(AFileName);

          // Draw the metafile in the Bitmap's canvas
          with Result do
            begin
              Height := AMetaFile.Height;
              Width := AMetaFile.Width;
              Canvas.Draw(0, 0, AMetaFile);
            end;
        finally
          if Assigned(AMetaFile) then
            AMetaFile.Free;
        end
      else
        // all other images
        try
          ATempImage := TPicture.Create;
          try
            // Load image - let TPicture worry about the image type
            ATempImage.LoadFromFile(AFileName);
            // Try converting image to bitmap
            try
              Result.Assign(ATempImage.Graphic);
            except
              // ATempImage didn't support conversion to TBitmap
              // Draw image on bitmap instead
              Result.Width := ATempImage.Graphic.Width;
              Result.Height := ATempImage.Graphic.Height;
              Result.Canvas.Draw(0, 0, ATempImage.Graphic);
            end;
          finally
            ATempImage.Free;
          end;
        except
          Result.Free;
          raise;
        end;

    end;
end;

function LoadGraphicFileAsBitmap(const AFileName: TFileName;
  var ABitMap: TBitMap): Boolean;
var
  APicture: TPicture;
  AMetaFile: TMetafile;
  AExt: string;
begin
  Result := False;
  if FileExists(AFileName) and Assigned(ABitMap) then
    begin
      AExt := Trim(UpperCase(ExtractFileExt(AFileName)));
      if CompareText(AExt, '.WMF') = 0 then
        begin
          // meta files
          AMetaFile := TMetafile.Create;
          try
            AMetaFile.LoadFromFile(AFileName);
            // Draw the metafile in the Bitmap's canvas
            ABitMap.Height := AMetaFile.Height;
            ABitMap.Width := AMetaFile.Width;
            ABitMap.Canvas.Draw(0, 0, AMetaFile);
          finally
            FreeAndNil(AMetaFile);
          end;
        end
      else
        // all other images
        begin
          APicture := TPicture.Create;
          try
            // Load image - let TPicture worry about the image type
            APicture.LoadFromFile(AFileName);
            // Try converting image to bitmap
            try
              ABitMap.Assign(APicture.Graphic);
            except
              // APicture didn't support conversion to TBitmap
              // Draw image on bitmap instead
              ABitMap.Width := APicture.Graphic.Width;
              ABitMap.Height := APicture.Graphic.Height;
              ABitMap.Canvas.Draw(0, 0, APicture.Graphic);
            end;
          finally
            FreeAndNil(APicture);
          end;
        end;
    end;
end;

procedure LoadImageFromFile(AImage: TUniImage; const AFileName: TFileName);
var
  OleGraphic: TOleGraphic;
  fs: TFileStream;
  bmp: TBitmap;
  pic: TPicture;
  MetaFile: TMetafile;
  AExt: string;
begin
  if AImage = nil then
    Exit;
  if not FileExists(AFileName) then
    Exit;

  try
    bmp := TBitmap.Create;
    pic := TPicture.Create;

    AExt := Trim(UpperCase(ExtractFileExt(AFileName)));
    if (AExt = '.WMF') then
      // meta files
      try
        MetaFile := TMetafile.Create;
        MetaFile.LoadFromFile(AFileName);

        // Draw the metafile in the Bitmap's canvas
        with bmp do
          begin
            Height := MetaFile.Height;
            Width := MetaFile.Width;
            Canvas.Draw(0, 0, MetaFile);
          end;
        AImage.Picture.Assign(bmp);
      finally
        if Assigned(MetaFile) then
          MetaFile.Free;
      end
    else
      try
        OleGraphic := TOleGraphic.Create;
        fs := TFileStream.Create(AFileName, fmOpenRead or fmSharedenyNone);
        OleGraphic.LoadFromStream(fs);
        // AImage.Picture.Assign(OleGraphic);
        pic.Assign(OleGraphic);

        // Try converting image to bitmap
        try
          bmp.Assign(pic.Graphic);
          AImage.Picture.Assign(pic.Bitmap);
        except
          // Image didn't support conversion to TBitmap
          // Draw image on bitmap instead
          bmp.Width := pic.Graphic.Width;
          bmp.Height := pic.Graphic.Height;
          bmp.Canvas.Draw(0, 0, pic.Graphic);
          AImage.Picture.Assign(bmp);
        end;
      finally
        fs.Free;
        OleGraphic.Free
      end;

  finally
    if Assigned(bmp) then
      bmp.Free;
    if Assigned(pic) then
      pic.Free;
  end;

end;

function GetSwatch(AColor, ATransparentColor: TColor): TBitmap;

  function _CreateRect(X1, X2, Y1, Y2: Integer): TRect;
  begin
    with Result do
      begin
        TopLeft.X := X1;
        TopLeft.Y := X2;
        BottomRight.X := Y1;
        BottomRight.Y := Y2;
      end;
  end;

var
  bmp: TBitmap;
  AFullRect, AFrameRect, AInsideRect: TRect;
begin
  AFullRect := _CreateRect(1, 1, 16, 16);
  AFrameRect := _CreateRect(1, 1, 15, 15);
  AInsideRect := _CreateRect(2, 2, 14, 14);

  Result := TBitmap.Create;
  with Result do
    begin
      Width := 16;
      Height := 16;

      Canvas.Brush.Color := ATransparentColor; // clFuchsia;
      Canvas.FillRect(AFullRect);

      Canvas.Pen.Color := clBlack;
      Canvas.Rectangle(AFrameRect);
      Canvas.Brush.Color := AColor;
      Canvas.FillRect(AInsideRect);

    end;

end;

procedure DrawGradient(ACanvas: TUniCanvas; ARect: TRect; AColors: array of TColor;
  AHorizontal: Boolean = False);
type
  RGBArray = array [0 .. 2] of Byte;
var
  X, Y, z, APosition, AReqColorCount, ATempCounter, AGrColorCount,
    ASpan: Integer;
  AFactor: double;
  A: RGBArray;
  B: array of RGBArray;
  APenWidth: Integer;
//  APenStyle: TPenStyle;
  APenColor: TColor;
begin
  AReqColorCount := high(AColors);
  if AReqColorCount > 0 then
    begin
      if AHorizontal then
        ASpan := ARect.Right - ARect.Left
      else
        ASpan := ARect.Bottom - ARect.Top;
      SetLength(B, AReqColorCount + 1);
      for X := 0 to AReqColorCount do
        begin
          AColors[X] := ColorToRGB(AColors[X]);
          B[X][0] := GetRValue(AColors[X]);
          B[X][1] := GetGValue(AColors[X]);
          B[X][2] := GetBValue(AColors[X]);
        end;
      APenWidth := ACanvas.Pen.Width;
//      APenStyle := ACanvas.Pen.Style;
      APenColor := ACanvas.Pen.Color;
      ACanvas.Pen.Width := 1;
//      ACanvas.Pen.Style := psSolid;
      AGrColorCount := Round(ASpan / AReqColorCount);
      for Y := 0 to AReqColorCount - 1 do
        begin
          if Y = AReqColorCount - 1 then
            ATempCounter := ASpan - Y * AGrColorCount - 1
          else
            ATempCounter := AGrColorCount;
          for X := 0 to ATempCounter do
            begin
              APosition := X + Y * AGrColorCount;
              AFactor := X / ATempCounter;
              for z := 0 to 2 do
                A[z] := Trunc(B[Y][z] + ((B[Y + 1][z] - B[Y][z]) * AFactor));
              ACanvas.Pen.Color := RGB(A[0], A[1], A[2]);
              if AHorizontal then
                begin
                  ACanvas.MoveTo(ARect.Left + APosition, ARect.Top);
                  ACanvas.LineTo(ARect.Left + APosition, ARect.Bottom);
                end
              else begin
                  ACanvas.MoveTo(ARect.Left, ARect.Top + APosition);
                  ACanvas.LineTo(ARect.Right, ARect.Top + APosition);
                end;
            end;
        end;
      B := nil;
      ACanvas.Pen.Width := APenWidth;
//      ACanvas.Pen.Style := APenStyle;
      ACanvas.Pen.Color := APenColor;
    end;
end;

procedure DrawFrame(ACanvas: TUniCanvas;  ARect: TRect; ABorderDark,
  ABorderLight: TColor);
const
  clBuffer: Integer = - 1;
begin
  ACanvas.Pen.Color := ABorderDark;
//  ACanvas.Brush.Style := bsClear;
  ACanvas.Rectangle(ARect.left, ARect.Top, ARect.left+ARect.Width, ARect.Top+ARect.Height );
  InflateRect(ARect, clBuffer, clBuffer);
  ACanvas.Pen.Color := ABorderLight;
//  ACanvas.Brush.Style := bsClear;
  ACanvas.Rectangle(ARect.left, ARect.Top, ARect.left+ARect.Width, ARect.Top+ARect.Height);
end;

procedure GetInverseColors(ABackColor: TColor;
  var ANormalFontColor, ADisabledFontColor: TColor);
(* Returns the inverse colors of the supplied back color (ABackColor).

  For instance, if you are calculating grid colors, but you are letting
  the user select color coding, you will need to set the font color
  so that it is visible.  If the user picks a dark color, then the font
  should be light.  But if the user picks a light color, the font color
  should be dark.

  This routines takes the back color you provide, and returns either a
  light or a dark color, depending on the lightness or darkness of the
  back color. Even the disabled font color (ADisabledFontColor) will
  will be a lighter or darker gray, depending on the back color.

  Usage Example:

  procedure _Proc(AEdit: TEdit);
  var
  ANormalColor, ADisabledColor: TColor;
  begin
  GetInverseColors(AEdit.Color, ANormalColor, ADisabledColor);
  AEdit.Font.Color := ANormalColor;
  end;

  Formula:
  Calculate the luminance of the color using the simplified formula
  luminance = 0.25*red + 0.625*green + 0.125*blue
  If greater than 0.5, use a dark background
*)
var
  ARGB: LongInt;
  R, G, B: Integer;
begin

  ARGB := ColorToRGB(ABackColor);

  R := GetRValue(ARGB) * 2;
  G := GetGValue(ARGB) * 5;
  B := GetBValue(ARGB);

  if R + G + B < 1024 then
    begin
      ANormalFontColor := clWhite;
      ADisabledFontColor := clSilver;
    end
  else begin
      ANormalFontColor := clBlack;
      ADisabledFontColor := clDkGray;
    end;
end;

function GetFontColor(ABackColor: TColor): TColor;
var
  ANormalFontColor, ADisabledFontColor: TColor;
begin
  GetInverseColors(ABackColor, ANormalFontColor, ADisabledFontColor);
  Result := ANormalFontColor;
end;

function LightenColor(AInputColor: TColor; ALightnessLevel: Byte;
  AGrayScale: Boolean): TColor;
var
  R, G, B: extended;
begin
  // Grab RGB values
  R := GetRValue(AInputColor);
  G := GetGValue(AInputColor);
  B := GetBValue(AInputColor);
  // Do the operation
  if not AGrayScale then
    begin
      R := R + ((R / 255) * ALightnessLevel);
      G := G + ((G / 255) * ALightnessLevel);
      B := B + ((B / 255) * ALightnessLevel);
    end
  else begin
      R := R - ((R / 255) * ALightnessLevel);
      G := G - ((G / 255) * ALightnessLevel);
      B := B - ((B / 255) * ALightnessLevel);
    end;
  // Check whether result is in range
  if R > 255 then
    R := 255;
  if R < 0 then
    R := 0;
  if G > 255 then
    G := 255;
  if G < 0 then
    G := 0;
  if B > 255 then
    B := 255;
  if B < 0 then
    B := 0;
  // Send it out
  Result := RGB(Byte(Round(R)), Byte(Round(G)), Byte(Round(B)));
end;

function GetHighlightColor(BaseColor: TColor): TColor;
begin
  Result := RGB(Min(GetRValue(ColorToRGB(BaseColor)) + 64, 255),
    Min(GetGValue(ColorToRGB(BaseColor)) + 64, 255),
    Min(GetBValue(ColorToRGB(BaseColor)) + 64, 255));
end;

function GetShadowColor(BaseColor: TColor): TColor;
begin
  Result := RGB(Max(GetRValue(ColorToRGB(BaseColor)) - 64, 0),
    Max(GetGValue(ColorToRGB(BaseColor)) - 64, 0),
    Max(GetBValue(ColorToRGB(BaseColor)) - 64, 0));
end;

procedure FadeLabel(ALabel: TUniLabel; ATargetColor: TColor;
  AFadeDirection: TFadeDirection; ADelay: Byte);
var
  HSL: THSL;
  i, j, X: Integer;
  AOrigColor: TColor;

  function CheckLabelState: Boolean;
  begin
    Result := Assigned(ALabel) and not (csDestroying in ALabel.ComponentState);
  end;

begin
  if not CheckLabelState then
    Exit;

  AOrigColor := ALabel.Font.Color;
  j := 1;

  if AFadeDirection = fdFadeOut then
    begin
      i := 1;
      X := 256;
    end
  else begin
      i := 256;
      X := 1;
    end;

  repeat
    HSL := ColorToHSL(AOrigColor);
    Inc(HSL.Lightness, i);
    if AFadeDirection = fdFadeOut then
      Inc(i)
    else
      Dec(i);
    if not CheckLabelState then
      BREAK;
    try
      ALabel.Font.Color := HSLtoColor(HSL);
      ALabel.Invalidate;
    except
    end;
    Application.ProcessMessages;
    if (ADelay > 0) and (j = 1) then
      Sleep(ADelay);
    Inc(j);
    if j > 10 then
      j := 1;
  until not CheckLabelState or (ALabel.Font.Color = ATargetColor) or
    (((AFadeDirection = fdFadeOut) and (i > 256)) or
    ((AFadeDirection = fdFadeIn) and (i < 0)));
  if CheckLabelState then
    ALabel.Font.Color := ATargetColor;
end;

procedure FadePanel(APanel: TUniPanel; ATargetColor: TColor;
  AFadeDirection: TFadeDirection; ADelay: Byte);
var
  HSL: THSL;
  i, X: Integer;
  AOrigColor: TColor;
begin
  AOrigColor := APanel.Color;

  if AFadeDirection = fdFadeOut then
    begin
      i := 1;
      X := 256;
    end
  else begin
      i := 256;
      X := 1;
    end;

  repeat
    HSL := ColorToHSL(AOrigColor);
    Inc(HSL.Lightness, i);
    if AFadeDirection = fdFadeOut then
      Inc(i)
    else
      Dec(i);
    APanel.Color := HSLtoColor(HSL);
    APanel.Invalidate;
    Application.ProcessMessages;
    if ADelay > 0 then
      Sleep(ADelay);
  until (APanel.Color = ATargetColor) or
    (((AFadeDirection = fdFadeOut) and (i > 256)) or
    ((AFadeDirection = fdFadeIn) and (i < 0)));
end;

procedure GetColorToRGB(BaseColor: TColor; var R, G, B: Integer);
begin
  R := BaseColor and $FF;
  G := (BaseColor shr 8) and $FF;
  B := (BaseColor shr 16) and $FF;
  {
    R := GetRValue(ColorToRGB(Color)) / 255;
    G := GetGValue(ColorToRGB(Color)) / 255;
    B := GetBValue(ColorToRGB(Color)) / 255;
  }
end;

procedure SetRGBToColor(R, G, B: Integer; var AColor: TColor);
begin
  AColor := RGB(R, G, B);
end;

procedure MakeThumbNail(AOriginalBmp, ATargetBmp: TBitmap;
  AThumbnailSize: Word);
type
  PRGB24 = ^TRGB24;

  TRGB24 = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
var
  x, y, ix, iy: integer;
  x1, x2, x3: integer;

  xscale, yscale: single;
  iRed, iGrn, iBlu, iRatio: Longword;
  p, c1, c2, c3, c4, c5: TRGB24;
  pt, pt1: PRGB24;
  iSrc, iDst, s1: integer;
  i, j, R, G, B, tmpY: integer;

  RowDest, RowSource, RowSourceStart: integer;
  w, h: integer;
  dxmin, dymin: integer;
  ny1, ny2, ny3: integer;
  dx, dy: integer;
  lutX, lutY: array of integer;

begin
  if AOriginalBmp.PixelFormat <> pf24bit then
    AOriginalBmp.PixelFormat := pf24bit;
  if ATargetBmp.PixelFormat <> pf24bit then
    ATargetBmp.PixelFormat := pf24bit;
  ATargetBmp.Width := AThumbnailSize;
  ATargetBmp.Height := AThumbnailSize;
  w := AThumbnailSize;
  h := AThumbnailSize;

  if (AOriginalBmp.Width <= AThumbnailSize) and
    (AOriginalBmp.Height <= AThumbnailSize) then
    begin
      ATargetBmp.Assign(AOriginalBmp);
      exit;
    end;

  iDst := (w * 24 + 31) and not 31;
  iDst := iDst div 8; // BytesPerScanline
  iSrc := (AOriginalBmp.Width * 24 + 31) and not 31;
  iSrc := iSrc div 8;

  xscale := 1 / (w / AOriginalBmp.Width);
  yscale := 1 / (h / AOriginalBmp.Height);

  // X lookup table
  SetLength(lutX, w);
  x1 := 0;
  x2 := trunc(xscale);
  for x := 0 to w - 1 do
    begin
      lutX[x] := x2 - x1;
      x1 := x2;
      x2 := trunc((x + 2) * xscale);
    end;

  // Y lookup table
  SetLength(lutY, h);
  x1 := 0;
  x2 := trunc(yscale);
  for x := 0 to h - 1 do
    begin
      lutY[x] := x2 - x1;
      x1 := x2;
      x2 := trunc((x + 2) * yscale);
    end;

  dec(w);
  dec(h);
  RowDest := integer(ATargetBmp.Scanline[0]);
  RowSourceStart := integer(AOriginalBmp.Scanline[0]);
  RowSource := RowSourceStart;
  for y := 0 to h do
    begin
      dy := lutY[y];
      x1 := 0;
      x3 := 0;
      for x := 0 to w do
        begin
          dx := lutX[x];
          iRed := 0;
          iGrn := 0;
          iBlu := 0;
          RowSource := RowSourceStart;
          for iy := 1 to dy do
            begin
              pt := PRGB24(RowSource + x1);
              for ix := 1 to dx do
                begin
                  iRed := iRed + pt.R;
                  iGrn := iGrn + pt.G;
                  iBlu := iBlu + pt.B;
                  inc(pt);
                end;
              RowSource := RowSource - iSrc;
            end;
          iRatio := 65535 div Nz((dx * dy), 1);
          pt1 := PRGB24(RowDest + x3);
          pt1.R := (iRed * iRatio) shr 16;
          pt1.G := (iGrn * iRatio) shr 16;
          pt1.B := (iBlu * iRatio) shr 16;
          x1 := x1 + 3 * dx;
          inc(x3, 3);
        end;
      RowDest := RowDest - iDst;
      RowSourceStart := RowSource;
    end;

  if ATargetBmp.Height < 3 then
    exit;

  // Sharpening...
  s1 := integer(ATargetBmp.Scanline[0]);
  iDst := integer(ATargetBmp.Scanline[1]) - s1;
  ny1 := integer(s1);
  ny2 := ny1 + iDst;
  ny3 := ny2 + iDst;
  for y := 1 to ATargetBmp.Height - 2 do
    begin
      for x := 0 to ATargetBmp.Width - 3 do
        begin
          x1 := x * 3;
          x2 := x1 + 3;
          x3 := x1 + 6;

          c1 := PRGB24(ny1 + x1)^;
          c2 := PRGB24(ny1 + x3)^;
          c3 := PRGB24(ny2 + x2)^;
          c4 := PRGB24(ny3 + x1)^;
          c5 := PRGB24(ny3 + x3)^;

          R := (c1.R + c2.R + (c3.R * - 12) + c4.R + c5.R) div - 8;
          G := (c1.G + c2.G + (c3.G * - 12) + c4.G + c5.G) div - 8;
          B := (c1.B + c2.B + (c3.B * - 12) + c4.B + c5.B) div - 8;

          if R < 0 then
            R := 0
          else if R > 255 then
            R := 255;
          if G < 0 then
            G := 0
          else if G > 255 then
            G := 255;
          if B < 0 then
            B := 0
          else if B > 255 then
            B := 255;

          pt1 := PRGB24(ny2 + x2);
          pt1.R := R;
          pt1.G := G;
          pt1.B := B;
        end;
      inc(ny1, iDst);
      inc(ny2, iDst);
      inc(ny3, iDst);
    end;
end;

function FindGraphicClass(const Buffer; const BufferSize: Int64;
  out GraphicClass: TGraphicClass): Boolean;
var
  LongWords: array [Byte] of LongWord absolute Buffer;
  Words: array [Byte] of Word absolute Buffer;
begin
  GraphicClass := nil;
  Result := False;
  if BufferSize < MinGraphicSize then
    Exit;
  case Words[0] of
    $4D42:
      GraphicClass := TBitmap;
    $D8FF:
      GraphicClass := TJPEGImage;
    $4949:
      if Words[1] = $002A then
        GraphicClass := TWicImage; // i.e., TIFF
    $4D4D:
      if Words[1] = $2A00 then
        GraphicClass := TWicImage; // i.e., TIFF
  else
    if Int64(Buffer) = $A1A0A0D474E5089 then
      GraphicClass := TPNGImage
    else if LongWords[0] = $9AC6CDD7 then
      GraphicClass := TMetafile
    else if (LongWords[0] = 1) and (LongWords[10] = $464D4520) then
      GraphicClass := TMetafile
    else if StrLComp(PAnsiChar(@Buffer), 'GIF', 3) = 0 then
      GraphicClass := TGIFImage
    else if Words[1] = 1 then
      GraphicClass := TIcon;
  end;
  Result := (GraphicClass <> nil);
end;

function FindGraphicClass(Stream: TStream;
  out GraphicClass: TGraphicClass): Boolean;
var
  Buffer: PByte;
  CurPos: Int64;
  BytesRead: Integer;
begin
  if Stream is TCustomMemoryStream then
    begin
      Buffer := TCustomMemoryStream(Stream).Memory;
      CurPos := Stream.Position;
      Inc(Buffer, CurPos);
      Result := FindGraphicClass(Buffer^, Stream.Size - CurPos, GraphicClass);
      Exit;
    end;
  GetMem(Buffer, MinGraphicSize);
  try
    BytesRead := Stream.Read(Buffer^, MinGraphicSize);
    Stream.Seek( - BytesRead, soCurrent);
    Result := FindGraphicClass(Buffer^, BytesRead, GraphicClass);
  finally
    FreeMem(Buffer);
  end;
end;

function LoadPictureFromField(AField: TBlobField;
  var Picture: TPicture): Boolean;
const
  MinGraphicSize = 44; // we may test up to & including the 11th longword
var
  Graphic: TGraphic;
  GraphicClass: TGraphicClass;
  Stream: TMemoryStream;

  function FindGraphicClass(const Buffer; const BufferSize: Int64;
    out GraphicClass: TGraphicClass): Boolean; overload;
  var
    LongWords: array [Byte] of LongWord absolute Buffer;
    Words: array [Byte] of Word absolute Buffer;
  begin
    GraphicClass := nil;
    Result := False;
    if BufferSize < MinGraphicSize then
      Exit;
    case Words[0] of
      $4D42:
        GraphicClass := TBitmap;
      $D8FF:
        GraphicClass := TJPEGImage;
      $4949:
        if Words[1] = $002A then
          GraphicClass := TWicImage; // i.e., TIFF
      $4D4D:
        if Words[1] = $2A00 then
          GraphicClass := TWicImage; // i.e., TIFF
    else
      if Int64(Buffer) = $A1A0A0D474E5089 then
        GraphicClass := TPNGImage
      else if LongWords[0] = $9AC6CDD7 then
        GraphicClass := TMetafile
      else if (LongWords[0] = 1) and (LongWords[10] = $464D4520) then
        GraphicClass := TMetafile
      else if StrLComp(PAnsiChar(@Buffer), 'GIF', 3) = 0 then
        GraphicClass := TGIFImage
      else if Words[1] = 1 then
        GraphicClass := TIcon;
    end;
    Result := (GraphicClass <> nil);
  end;

  function FindGraphicClass(Stream: TStream;
    out GraphicClass: TGraphicClass): Boolean; overload;
  var
    Buffer: PByte;
    CurPos: Int64;
    BytesRead: Integer;
  begin
    if Stream is TCustomMemoryStream then
      begin
        Buffer := TCustomMemoryStream(Stream).Memory;
        CurPos := Stream.Position;
        Inc(Buffer, CurPos);
        Result := FindGraphicClass(Buffer^, Stream.Size - CurPos, GraphicClass);
        Exit;
      end;
    GetMem(Buffer, MinGraphicSize);
    try
      BytesRead := Stream.Read(Buffer^, MinGraphicSize);
      Stream.Seek( - BytesRead, soCurrent);
      Result := FindGraphicClass(Buffer^, BytesRead, GraphicClass);
    finally
      FreeMem(Buffer);
    end;
  end;

begin
  Graphic := nil;
  try
    Stream := TMemoryStream.Create;
    try
      AField.SaveToStream(Stream);
      if Stream.Size = 0 then
        begin
          Picture.Assign(nil);
          Exit(False);
        end;
      if not FindGraphicClass(Stream.Memory^, Stream.Size, GraphicClass) then
        Exit(False);
      Graphic := GraphicClass.Create;
      try
        Stream.Position := 0;
        Graphic.LoadFromStream(Stream);
        Picture.Assign(Graphic);
        Result := True;
      finally
        Graphic.Free;
      end;
    finally
      Stream.Free;
    end;
  except
    Result := False;
  end;
end;

end.
