unit IQMS.WebVcl.KeyPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, uniGUIJSInterface,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel,
  IQMS.WebVcl.MultimediaSounds;

type
  TIQWebKeyPad = class(TUniFrame)
    Pnl1: TUniPanel;
    Pnl2: TUniPanel;
    Pnl3: TUniPanel;
    Pnl4: TUniPanel;
    Pnl5: TUniPanel;
    Pnl6: TUniPanel;
    Pnl7: TUniPanel;
    Pnl8: TUniPanel;
    Pnl9: TUniPanel;
    PnlSign: TUniPanel;
    Pnl0: TUniPanel;
    PnlPeriod: TUniPanel;
    IQWebSound1: TIQWebSound;
    procedure UniFrameCreate(Sender: TObject);
    procedure Pnl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PnlSignMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOnChange: TNotifyEvent;
    FSelected: String;
    FCacheValue: Real;
    FCacheValueStr: String;
    FIncludeDecimal: Boolean;
    FPlaySound: Boolean;
    FAllowNegative: Boolean;
    LastPressed : TUniPanel;
    function GetSelected: String;
    procedure SetOnChange(const Value: TNotifyEvent);
    procedure ResetPanelColorExcept(APanel: TUniPanel);
    function GetSelectedByte: Byte;
    procedure SetSelectedByte(const Value: Byte);
    procedure DrawFocusImage(Sender: TUniPanel);
    procedure UpdateCacheValue;
    procedure SetIncludeDecimal(const Value: Boolean);
    procedure PlayClickSound;
    procedure SetCacheValueStr(const Value: String);
    function GetNumericFromStr(const Value: String): String;
    procedure SetAllowNegative(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
   published
    property Selected: String read GetSelected;
    property CurrentByteValue: Byte read GetSelectedByte write SetSelectedByte;
    property CachedValue: Real read FCacheValue;
    property CachedValueStr: String read FCacheValueStr write SetCacheValueStr;
    property IncludeDecimal: Boolean read FIncludeDecimal write SetIncludeDecimal;
    property PlaySound: Boolean read FPlaySound write FPlaySound;
    property AllowNegative: Boolean read FAllowNegative write SetAllowNegative;
    property OnChange: TNotifyEvent read FOnChange write SetOnChange;
  end;

implementation

{$R *.dfm}

  uses
   IQMS.Common.Numbers,
   Math,
   IQMS.Common.DataLib;

const
  cFocusPenColor = 12937777; // Dark blue clHighlight;
  cFocusBrushColor = 16311512; // Light blue clInactiveCaptionText;
  cFocusPenInactive = 13160660; // Light gray



function TColorToHex( Color : TColor ): string;
begin
  Result :=
    { red value }
    IntToHex( GetRValue( Color ), 2 ) +
    { green value }
    IntToHex( GetGValue( Color ), 2 ) +
    { blue value }
    IntToHex( GetBValue( Color ), 2 );
end;

procedure TIQWebKeyPad.DrawFocusImage(Sender: TUniPanel);
var
  IJ : IUniJSInterface;
begin
  if Sender = NIL then
    Exit;

  if (Self <> NIL) and not (csDesigning in ComponentState) then
  try
     ResetPanelColorExcept(TUniPanel(Sender));

    if Supports(TUniPanel(Sender), IUniJSInterface, IJ) then
      begin
         IJ.JSCall('setBodyStyle', ['border-width:4px; border-color:'+'#'+TColorToHex(cFocusPenColor)]);
      end;

  except SysUtils.Abort;
  end;
end;

function TIQWebKeyPad.GetNumericFromStr(const Value: String): String;
const
  // 01/10/2007 Added negative sign; numbers are otherwise assumed to be positive.
  cValidChar = [ '0'..'9', '-' ];
var
  i: Integer;
  S, ATempS: String;
  AThousandSeparator, ADecimal: String;
begin
  if (Self = NIL) or (csDesigning in ComponentState) then Exit;

  // Initialization
  Result             := Value;
  ATempS             := '';
  S                  := Trim(Value);
  ADecimal           := FormatSettings.DecimalSeparator;
  AThousandSeparator := FormatSettings.ThousandSeparator;

  if S = '' then Exit;

  // Parse the string
  try
     // Find the number in the string value
     for i := 1 to Length(S) do
       if ( S[i] in cValidChar ) or
          ( S[i] = ADecimal ) or
          ( S[i] = AThousandSeparator ) then
          ATempS := ATempS + S[i]; // fill temporary variable

     Result := ATempS;

  except // suppress
  end;
end;

function TIQWebKeyPad.GetSelected: String;
begin
  Result := FSelected;
end;

function TIQWebKeyPad.GetSelectedByte: Byte;
var
   i: Integer;
begin
   if IsStringValidInteger(FSelected, i) then
      Result := i
   else Result := 0;
end;

procedure TIQWebKeyPad.PlayClickSound;
begin
  IQWebSound1.Beep;
end;

procedure TIQWebKeyPad.ResetPanelColorExcept(APanel: TUniPanel);
var
  IJ : IUniJSInterface;
begin
  if (Self = NIL) or (csDesigning in ComponentState) then Exit;

  if LastPressed<>nil then
   begin
      if Supports(LastPressed, IUniJSInterface, IJ) then
        begin
           IJ.JSCall('setBodyStyle', ['border-width:1px; border-color:'+'#'+TColorToHex(clWhite)]);
        end;
   end;

   LastPressed:=APanel;
end;

procedure TIQWebKeyPad.SetAllowNegative(const Value: Boolean);
begin
  FAllowNegative := Value;
  if Assigned(PnlSign) then
     PnlSign.Visible := FAllowNegative;
end;

procedure TIQWebKeyPad.SetCacheValueStr(const Value: String);
begin
  if (Self = NIL) or (csDesigning in ComponentState) then Exit;

  FCacheValueStr := GetNumericFromStr(Value);
end;

procedure TIQWebKeyPad.SetIncludeDecimal(const Value: Boolean);
begin
  FIncludeDecimal := Value;
  PnlPeriod.Visible := Value;
end;

procedure TIQWebKeyPad.SetOnChange(const Value: TNotifyEvent);
begin
  FOnChange := Value;
end;

procedure TIQWebKeyPad.SetSelectedByte(const Value: Byte);
begin
  FSelected := IntToStr(Value);

  if (Self = NIL) or (csDesigning in ComponentState) then Exit;

  case Value of
   0: DrawFocusImage(Pnl0);
   1: DrawFocusImage(Pnl1);
   2: DrawFocusImage(Pnl2);
   3: DrawFocusImage(Pnl3);
   4: DrawFocusImage(Pnl4);
   5: DrawFocusImage(Pnl5);
   6: DrawFocusImage(Pnl6);
   7: DrawFocusImage(Pnl7);
   8: DrawFocusImage(Pnl8);
   9: DrawFocusImage(Pnl9);
  end;
end;

procedure TIQWebKeyPad.UniFrameCreate(Sender: TObject);
begin
  PnlPeriod.Caption:=FormatSettings.DecimalSeparator;
end;

procedure TIQWebKeyPad.Pnl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   AShape: TUniPanel;
   ACursor: Integer;
begin
  if (Self = NIL) or (csDesigning in ComponentState) then Exit;


  if (Button = mbLeft) and (Sender is TUniPanel) then
  try
        // The shape that is clicked
        AShape := Sender as TUniPanel;
        // Selected string value
        FSelected := AShape.Caption;
        UpdateCacheValue;

        // Redraw ...
        DrawFocusImage(AShape);
        // Play sound
        PlayClickSound;

        // Execute OnChange
        if Assigned(FOnChange) then
           FOnChange(Self);

  except FSelected := '';
  end;
end;

procedure TIQWebKeyPad.PnlSignMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Self = NIL) or (csDesigning in ComponentState) then Exit;

  // Let click finish
  Application.ProcessMessages;

  if (Button = mbLeft) and (Sender is TUniPanel) and (TUniPanel(Sender) = PnlSign) then
  try
        // First, ensure the "selected" variable is cleared
        FSelected := '';
        // Update the cached numeric value
        UpdateCacheValue;
        // Modify the sign (just apply negative to change the sign)
        FCacheValue := -FCacheValue;
        // Update the cached string value and the display
        CachedValueStr := FloatToStr(FCacheValue);

        // Redraw ...
        DrawFocusImage(PnlSign);
        // Play sound
        PlayClickSound;

        // Execute OnChange
        if Assigned(FOnChange) then
           FOnChange(Self);

  except FSelected := '';
  end;
end;

procedure TIQWebKeyPad.UpdateCacheValue;
var
   AValue: Real;
begin
  if (Self = NIL) or (csDesigning in ComponentState) then Exit;

  FCacheValueStr := Trim(FCacheValueStr) + FSelected;

  if FSelected = FormatSettings.DecimalSeparator then
     Exit;

  if IsStringValidFloat(FCacheValueStr, AValue) then
     begin
       // String value
       if (Pos(FormatSettings.DecimalSeparator, FCacheValueStr) = 0) then
          FCacheValueStr := FormatFloat1000SeparatorA(Trunc(AValue)); //iqlib
       // Float value
       if IsStringValidFloat(FCacheValueStr, AValue) then
          begin
            if FIncludeDecimal then
               FCacheValue := AValue
            else FCacheValue := Trunc(AValue);
          end;
     end;

end;

end.
