unit IQMS.WebVcl.FloatSpinner;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  Buttons,
  Math,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniGUITypes,
  uniPanel;

type
  TOnChangeEvent = TNotifyEvent;
  TFloatSpinnerStyle = (fstStandard, fstTouchscreen, fstCustom);
  TIQWebFloatSpinner = class(TUniControl)
    PanelButtons: TUniPanel;
    ButtonSpinUp: TUniSpeedButton;
    ButtonSpinDown: TUniSpeedButton;
    EditBox: TUniEdit;
    procedure OnEditTextChange(Sender: TObject);
    procedure DoSpinUp(Sender: TObject);
    procedure DoSpinDown(Sender: TObject);
    procedure EditBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditBoxKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FOnChangedEvent: TOnChangeEvent;
    FLastValue: Double;
    FMaxValue: Double;
    FMinValue: Double;
    FEditBoxColor: TColor;
    FPrecision: Integer;
    FDisplayFormat: String;
    FBtnHeight: Integer;
    FBtnWidth: Integer;
    FLgImg: Boolean;
    FFloatSpinnerStyle: TFloatSpinnerStyle;

    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    procedure CMExit(var Msg: TMessage); message CM_EXIT;
    procedure WMSetFont(var Message: TWMSetFont); message WM_SETFONT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;

    function GetPositionStr: String;
    function SelectSection: Integer; // 1 = Number; 2 = Decimal
    function ApplyDecimalPrecision(AValue: String): String;
    function FormattedValue(const Value: Double): String; overload;
    function FormattedValue(const Value: String): String; overload;
    procedure AdjustToBtnSize;
    function ValueOfSideA(ASide: Byte): String;
    function ValueOfSideB(AValue: String; ASide: Byte): String;
    function RemoveTrailingZeroes(AValue: String): String;
    function GetNumericFromStr(AValue: Double; AIncludeDecimal: Boolean = TRUE): String; overload;
    function GetNumericFromStr(AValue: Integer): String; overload;

    // validation
    function CheckValue( ANewValue: String ): Boolean;
    procedure ForceValue( AValue: Double ); overload;
    procedure ForceValue( AValue: String ); overload;

    // property methods
    function GetPosition: Double;
    procedure SetPosition(const Value: Double);
    function GetColor: TColor;
    procedure SetColor( AValue: TColor );
    procedure SetPrecision(const Value: Integer);
    procedure SetBtnHeight(const Value: Integer);
    procedure SetBtnWidth(const Value: Integer);
    procedure SetLgImg(const Value: Boolean);
    procedure SetFloatSpinnerStyle(const Value: TFloatSpinnerStyle);
    procedure IncAsDecimal(var S: String; N: Integer = 1);
  protected
    { Protected declarations }
    procedure Loaded; override;
  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
  published
    { Published declarations }
    { * Properties * }
    property Anchors;
    property AutoSize;
    property Color read GetColor write SetColor;
    property Constraints;
    property Ctl3D;
    property DragCursor;
    property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
    property DragMode;
    property Enabled;
    property Font;
    property MaxValue: Double read FMaxValue write FMaxValue;
    property MinValue: Double read FMinValue write FMinValue;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property PositionStr: String read GetPositionStr;
    property Position: Double read GetPosition write SetPosition;
    property Precision: Integer read FPrecision write SetPrecision;
    property Visible;

    // 01/05/2007 Added for touchscreens
    property Style: TFloatSpinnerStyle read FFloatSpinnerStyle write SetFloatSpinnerStyle;
    property SpinBtnHeight: Integer read FBtnHeight write SetBtnHeight;
    property SpinBtnWidth: Integer read FBtnWidth write SetBtnWidth;
    property LargeBtnImage: Boolean read FLgImg write SetLgImg;

    { * Events * }
    property OnClick;
    property OnChange: TOnChangeEvent read FOnChangedEvent write FOnChangedEvent;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
  end;

const
  cDEFAULT_CTRL_WIDTH  = 87;  // default width of the entire spinner control
  cDEFAULT_CTRL_HEIGHT = 21;  // default height of the entire spinner control
  cDEFAULT_EDIT_HEIGHT = 19; // default height of the edit box
  cEDIT_OFFSET = 2; // edit box height value less than total height
  cDEFAULT_BTN_WIDTH   = 17;  // default spinner button width
  cDEFAULT_BTN_HEIGHT  = 10;  // default spinner button height
  cSPACE_BETWEEN_BTN   =  0;  // space between the spinner buttons

implementation

uses
  IQMS.Common.Screen,
  IQMS.Common.StringUtils,
  IQMS.Common.NLS,
  IQMS.Common.Numbers;

{ TFloatSpinner }

constructor TIQWebFloatSpinner.Create(AOwner: TComponent);
begin

    FEditBoxColor := clWindow;

    inherited Create( AOwner );

    ControlStyle := [ csCaptureMouse,
                      csClickEvents,
                      csSetCaption,
                      csDoubleClicks ];
    // Self
    Width      := cDEFAULT_CTRL_WIDTH;
    Height     := cDEFAULT_CTRL_HEIGHT;
    BevelOuter := bvNone;
    Caption    := '';

    // Set default values for property variables
    FLastValue := 0;
    FPrecision := 9;
    FBtnHeight := cDEFAULT_BTN_HEIGHT;
    FBtnWidth  := cDEFAULT_BTN_WIDTH;
    FLgImg     := FALSE; // use large images

    EditBox:= TUniEdit.Create(Self);
    with EditBox do
      begin
        Parent         := Self;
        Left           := 0;
        Top            := 0;
        Width          := cDEFAULT_CTRL_WIDTH - cDEFAULT_BTN_WIDTH - 1;
        Height         := cDEFAULT_EDIT_HEIGHT;
        // 01/05/20007 Setting MinHeight constraint prevents resize after font change
        Constraints.MinHeight := cDEFAULT_EDIT_HEIGHT;
        Anchors        := [akLeft, akTop, akRight, akBottom];
//        HideSelection  := False;
        TabOrder       := 1;
        Text           := '';
        OnKeyDown      := EditBoxKeyDown;
        OnKeyPress     := EditBoxKeyPress;
        OnChange       := OnEditTextChange;
      end;

    // This panel is on the right side of the control, and holds
    // the spinner buttons.
    PanelButtons:= TUniPanel.Create(Self);
    with PanelButtons do
      begin
        Parent     := Self;
        Left       := cDEFAULT_CTRL_WIDTH - cDEFAULT_BTN_WIDTH;
        Top        := 0;
        Width      := cDEFAULT_BTN_WIDTH;
        Height     := cDEFAULT_CTRL_HEIGHT;
        Align      := alRight;
        BevelOuter := bvNone;
        TabOrder   := 0;
      end;

    ButtonSpinUp:= TUniSpeedButton.Create(Self);
    with ButtonSpinUp do
      begin
        Parent    := PanelButtons;
        Left      := 0;
        Top       := 0;
        Width     := cDEFAULT_BTN_WIDTH;
        Height    := cDEFAULT_BTN_HEIGHT;
        ParentFont:= False;
        Font.Name := 'Marlett';
        Font.Size := 8;
        Caption   := IntToStr(5);
        OnClick   := DoSpinUp;
        Tag       := 1999;
      end;

    ButtonSpinDown:= TUniSpeedButton.Create(Self);
    with ButtonSpinDown do
      begin
        Parent    := PanelButtons;
        Left      := 0;
        Top       := cDEFAULT_BTN_HEIGHT + cSPACE_BETWEEN_BTN;
        Width     := cDEFAULT_BTN_WIDTH;
        Height    := cDEFAULT_BTN_HEIGHT;
        ParentFont:= False;
        Font.Name := 'Marlett';
        Font.Size := 8;
        Caption   := IntToStr(6);
        IconAlign := iabottom;
//        Layout    := blGlyphBottom;
        OnClick   := DoSpinDown;
        Tag       := 1999;
      end;

   FFloatSpinnerStyle := fstStandard;
end;

destructor TIQWebFloatSpinner.Destroy;
begin
     if Assigned( ButtonSpinUp ) then FreeAndNil( ButtonSpinUp );
     if Assigned( ButtonSpinDown ) then FreeAndNil( ButtonSpinDown );
     if Assigned( EditBox ) then FreeAndNil( EditBox );
     inherited;
end;

procedure TIQWebFloatSpinner.Loaded;
begin
  inherited;

  // 01/05/2007 Ensure proportions
  EditBox.Width := Width - PanelButtons.Width - 1;
  EditBox.Height:= Height - cEDIT_OFFSET;
  EditBox.Constraints.MinHeight := EditBox.Height; 
end;

procedure TIQWebFloatSpinner.DoSpinDown(Sender: TObject);
var I, L, D: Integer; S: String; R: Double; ANewValue: String;
begin
     ANewValue := '';
     Application.ProcessMessages;
     if ( Trim( EditBox.Text ) = '' ) then
        ForceValue( MaxValue )
     else if ( Position = MinValue ) then Exit
     else if ( Position < MinValue ) then
       begin
            Position := MinValue;
            Exit;
       end
     else
       begin
//            // Ensure valid float
//            //if not SysUtils.TryStrToFloat(EditBox.Text, R) then Exit;
//            // 07/21/2011 Use IQString function instead of SysUtils function
//            // because the IQString function works with thousand separator;
//            // the SysUtils function does not.
//            if not IQMS.Common.Numbers.IsStringValidFloat(EditBox.Text, R) then Exit;
//            // Which section is selected
//            D := SelectSection;
//            // Is the left or right side of decimal a valid number?
//            if IsStringValidInteger(EditBox.SelText,I) then
//               begin
//                    // Left side
//                    if D = 1 then
//                       begin
//                            if ((I-1) >= MinValue ) then
//                               // since this is left side, format it and trim decimal value
//                               EditBox.SelText := ApplyDecimalPrecision(FormattedValue(IntToStr(I-1))) // left side, so format
//                            else ANewValue := FloatToStr( Round( R ));
//                       end
//                    // Right side (decimal)
//                    else
//                       begin
//                            if ((I-1) >= 0 ) then
//                               begin
//                                 S := ''; L := 0; // initialize these
//                                 // If we have a precision value, then set the number
//                                 if FPrecision > 0 then
//                                    begin
//                                      L := Length(EditBox.SelText);
//                                      S := LPadZero( IntToStr(I-1), L ); // iqstring
//                                    end;
//                                 EditBox.SelText := S; // right side, do not format
//                               end
//                            else if FPrecision > 0 then
//                               ANewValue := FloatToStr( Round( R ));
//                       end;
//               end;
       end;
     // if we changed the value, then set it
     if ANewValue > '' then
        ForceValue(ANewValue); // 08/22/2006
     SelectSection;
     Invalidate;
end;

procedure TIQWebFloatSpinner.DoSpinUp(Sender: TObject);
var I, L, D: Integer; S: String; R: Double; ANewValue: String;
begin
     ANewValue := '';
     Application.ProcessMessages;
     if ( Trim( EditBox.Text ) = '' ) then
        ForceValue( MinValue )
     else if ( Position = MaxValue ) and ( MaxValue > 0 ) then Exit
     else if ( Position > MaxValue ) and ( MaxValue > 0 ) then
       begin
            Position := MaxValue;
            Exit;
       end
     else
       begin
//            // Ensure valid float
//            //if not SysUtils.TryStrToFloat(EditBox.Text, R ) then Exit;
//            // 07/21/2011 Use IQString function instead of SysUtils function
//            // because the IQString function works with thousand separator;
//            // the SysUtils function does not.
//            if not IQMS.Common.Numbers.IsStringValidFloat(EditBox.Text, R) then Exit;
//
//            // Which section is selected
//            D := SelectSection;
//            // Is the left or right side of decimal a valid number?
//            if IsStringValidInteger(EditBox.SelText,I) then // iqnumber
//               begin
//                    // We are incrementing left side of decimal
//                    if D = 1 then EditBox.SelText := ApplyDecimalPrecision(FormattedValue(IntToStr(I+1))) // left side, format it
//                    // We are incrementing the right side (the decimal)
//                    else
//                       // We are incrementing right side of decimal
//                       begin
//                            S := ''; L := 0; // initialize these
//                            // If we have a precision ...
//                            if FPrecision > 0 then
//                               begin
//                                S := EditBox.SelText; // get text for a test
//                                L := Length(EditBox.SelText);
//                               end;
//
//                            // NOTE:  If no precision is specified (<=0), then
//                            //        we must not permit a decimal.
//
//                            // Is the decimal all 9's?
//                            if S = Repl( '9', L ) then // iqstring
//                               // if so, then round up
//                               ANewValue := FloatToStr( Round( R ))
//                            else if FPrecision > 0 then
//                               // otherwise, increment the value
//                               begin
//                                    S := LPadZero( IntToStr(I+1), L ); // iqstring
//                                    EditBox.SelText := S;  // right side, do not format
//                               end;
//                       end;
//               end;
       end;
     if ANewValue > '' then
        ForceValue(ANewValue);
     SelectSection;
     Invalidate;
end;
(*
procedure TIQWebFloatSpinner.DoSpinDown(Sender: TObject);
var
   L, D: Integer;
   I: LongInt;
   R: Real;
   S, ANewValue: String;
begin
  ANewValue := '';
  Application.ProcessMessages;
  if ( Trim( EditBox.Text ) = '' ) then
     ForceValue( MaxValue )
  else if ( Position = MinValue ) then Exit
  else if ( Position < MinValue ) then
    begin
         Position := MinValue;
         Exit;
    end
  else if IsStringValidFloat(EditBox.Text, R ) then // Ensure valid float
    begin
      D := SelectSection;     // Which section is selected?
      S := ValueOfSideA(D);   // Get the selected value as string

      if D = 2 then
         begin
           IncAsDecimal(S, -1 {Add});
           EditBox.SelText := S;
         end
      else
         begin
           if S > '' then I := StrToInt64(S) else S := '0'; // Adjust to at least a 0
           Dec(I);

           if (I < 0) then I := 0;

           if (MinValue = 0) or (I >= MinValue) then
              EditBox.SelText := IntToStr(I);
         end;

    end;

  SelectSection;
  Invalidate;
end;

procedure TIQWebFloatSpinner.DoSpinUp(Sender: TObject);
var I, L, D: Integer; S: String; R: Real; ANewValue: String;
begin
  ANewValue := '';
  Application.ProcessMessages;
  if ( Trim( EditBox.Text ) = '' ) then
     ForceValue( MinValue )
  else if ( Position = MaxValue ) and ( MaxValue > 0 ) then Exit
  else if ( Position > MaxValue ) and ( MaxValue > 0 ) then
    begin
         Position := MaxValue;
         Exit;
    end
  else if IsStringValidFloat(EditBox.Text, R ) then // Ensure valid float
    begin
      D := SelectSection;     // Which section is selected?
      S := ValueOfSideA(D);   // Get the selected value as string
      if D = 2 then
         begin
           IncAsDecimal(S, 1 {Add});
           EditBox.SelText := S;
         end
      else
         begin
           if S > '' then I := StrToInt64(S) else S := '0'; // Adjust to at least a 0
           Inc(I);
           if (MaxValue = 0) or (I <= MaxValue) then
              EditBox.SelText := IntToStr(I);
         end;
    end;
  SelectSection;
  Invalidate;
end;
*)

procedure TIQWebFloatSpinner.EditBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//     if ( Key = VK_LEFT ) then
//        begin
//             Key := 0;
//             EditBox.SelStart := 0;
//             SelectSection;
//        end
//     else if ( Key = VK_RIGHT ) then
//        begin
//             Key := 0;
//             EditBox.SelStart := Length(EditBox.Text);
//             SelectSection;
//        end
//     else if ( Key = VK_UP ) then
//        begin
//             Key := 0;
//             DoSpinUp(Sender);
//        end
//     else if ( Key = VK_DOWN ) then
//        begin
//             Key := 0;
//             DoSpinDown(Sender);
//        end;
end;

procedure TIQWebFloatSpinner.EditBoxKeyPress(Sender: TObject; var Key: Char);
const
  cValidChar = [ #8, '0'..'9', '-' ];
begin
  if ( Key = #13 ) then
     begin
          Key := #0;
          EditBox.SelectAll;
     end
  else if not ( Key in cValidChar ) and ( Key <> FormatSettings.DecimalSeparator ) then Key := #0;
end;

procedure TIQWebFloatSpinner.OnEditTextChange(Sender: TObject);
var
   AValue: Double;
begin
     if ( Trim( EditBox.Text ) = '' ) then Exit;

     // 07/21/2011 Use the iqnumber function, not SysUtils function.
     if not IQMS.Common.Numbers.IsStringValidFloat(EditBox.Text, AValue ) or not CheckValue( EditBox.Text ) then
        ForceValue( FLastValue )
     else
        begin
             FLastValue := AValue;
             // If this event has been assigned at design time, execute it now
             if Assigned(OnChange) then
                OnChange(Sender);
        end;
end;

function TIQWebFloatSpinner.SelectSection: Integer;
var
   S: String;
   i1, i2: Integer;
begin
//     S  := EditBox.Text;
//     i1 := EditBox.SelStart;
//     i2 := Pos( FormatSettings.DecimalSeparator, S );
//     if (i2 = 0) or (i1 < i2) then
//        begin
//             Result := 1;
//             EditBox.SelStart := 0;
//             EditBox.SelLength := i2-1;
//        end
//     else
//        begin
//             Result := 2;
//             EditBox.SelStart := i2;
//             EditBox.SelLength := Length(S);
//        end;
end;

function TIQWebFloatSpinner.GetPosition: Double;
var AResult: Double;
begin
  // 07/21/2011 Use iqnumber function, not SysUtils function
     if IQMS.Common.Numbers.IsStringValidFloat(EditBox.Text, AResult ) then
        Result := AResult
     else Result := 0;
end;

procedure TIQWebFloatSpinner.SetPosition(const Value: Double);
var
   iFracLength: Integer;
   sFracPart: String;
begin
  // Basic value
  EditBox.Text := FloatToStr(Value);

  // Ensure that the fraction is within the precision
  sFracPart := ValueOfSideB(FloatToStr(Value), 2);
  iFracLength := Length(sFracPart);

  // Apply the precision only if we must, because otherwise this
  // will add trailing zeroes.
  if iFracLength > FPrecision then
     EditBox.Text := IQMS.Common.NLS.IQFloatToStrF(Value, ffFixed, 12, FPrecision );

end;

function TIQWebFloatSpinner.GetPositionStr: String;
begin
     Result := ApplyDecimalPrecision(EditBox.Text);
end;

procedure TIQWebFloatSpinner.SetPrecision(const Value: Integer);
begin
  FPrecision := Value;
  ApplyDecimalPrecision(EditBox.Text);
end;

function TIQWebFloatSpinner.CheckValue(ANewValue: String): Boolean;
var R: Double;
begin
     // 07/21/2011 Use iqnumber function, not SysUtils function
     Result := IQMS.Common.Numbers.IsStringValidFloat( ANewValue, R );
     if Result then
        begin
             if ( MaxValue > 0 ) and ( MaxValue > MinValue ) then
                Result := ( R <= MaxValue ) and ( R >= MinValue );
        end;
end;

procedure TIQWebFloatSpinner.ForceValue(AValue: Double);
begin
     try
        EditBox.OnChange := NIL;
        //EditBox.Text := FloatToStr( AValue ); // old, remmed 08/22/2006
        EditBox.Text := FormattedValue(AValue); // 08/22/2006

     finally EditBox.OnChange := OnEditTextChange;
     end;
end;

procedure TIQWebFloatSpinner.ForceValue(AValue: String);
var
   R: Double;
begin
   // 07/21/2011 Use iqnumber function, not SysUtils function.
   if not IQMS.Common.Numbers.IsStringValidFloat(AValue, R) then Exit;
   ForceValue(R); // overload method above
end;

function TIQWebFloatSpinner.FormattedValue(const Value: Double): String;
var
   APrecisionValue: Double;
begin
  if FDisplayFormat > '' then
     Result := FormatFloat(FDisplayFormat, Value)
  else Result := FloatToStr(Value);

  // Apply precision
  Result := ApplyDecimalPrecision(Result);
end;

function TIQWebFloatSpinner.FormattedValue(const Value: String): String;
var
   R: Double;
begin
  Result := '';
  // 07/21/2011 Use iqnumber function, not SysUtils function.
  if not IQMS.Common.Numbers.IsStringValidFloat(Value, R) then
     Exit;
  Result := FormattedValue(R); // overload method above
end;

function TIQWebFloatSpinner.GetColor: TColor;
begin
     Result := EditBox.Color;
end;

procedure TIQWebFloatSpinner.SetColor(AValue: TColor);
begin
     FEditBoxColor := AValue;
     EditBox.Color := AValue;
end;

procedure TIQWebFloatSpinner.CMEnabledChanged(var Msg: TMessage);
begin
     inherited;
     Self.ButtonSpinDown.Enabled := Self.Enabled;
     Self.ButtonSpinUp.Enabled := Self.Enabled;
     if Self.Enabled then Self.EditBox.Color := FEditBoxColor
     else Self.EditBox.Color := clBtnFace;
end;

procedure TIQWebFloatSpinner.CMExit(var Msg: TMessage);
begin
 inherited;
 // Added 08/22/2006
 if (EditBox.Text > '') and (FDisplayFormat > '') then
    ForceValue(EditBox.Text); // applies formatting
end;


function TIQWebFloatSpinner.ValueOfSideA(ASide: Byte): String;
begin
  Result := ValueOfSideB(EditBox.Text, ASide);
end;

function TIQWebFloatSpinner.ValueOfSideB(AValue: String; ASide: Byte): String;
var
   iDecPos: Integer;
   S: String;
begin
  // Get the position of the decimal separator
  iDecPos := Pos( FormatSettings.DecimalSeparator, AValue );

  case ASide of
   1: // left side
    begin
      if iDecPos = 0 then // no decimal
         Result := Trim(AValue)
      else
         Result := Copy(Trim(AValue), 1, iDecPos - 1);
    end;
   2: // right side
    begin
      if iDecPos = 0 then // no decimal
         Result := ''
      else
         Result := Copy(Trim(AValue), iDecPos + 1, Length(Trim(AValue)));
    end;
  end;

end;

function TIQWebFloatSpinner.ApplyDecimalPrecision(AValue: String): String;
var
   AInt, AFrac, ATemp: String;
   i: Integer;
   R: Double;
begin
     Result := AValue; // default

     // Get the position of the decimal separator
     i := Pos( FormatSettings.DecimalSeparator, AValue );
     // Do we have a decimal separator?  Yes...
     if ( i > 0 ) then
        begin
          // Left side of decimal
          AInt := Copy( AValue, 1, I - 1);
          // Right side of decimal
          AFrac:= Copy( AValue, I + 1, Length( AValue ));
        end
     // No... exit early (don't need to do anything)
     else Exit;

     // Initialize our temporary holder
     ATemp := '';

     // Do we have a fraction?  Yes...
     if (FPrecision > 0) and ( AFrac > '' ) then
       // Starting from the last number down to the first number,
       // remove extra zeroes
       for i := Length(AFrac) downto 0 do
         begin
           if AFrac[i] <> '0' then
              begin
                ATemp := LeftStr( AFrac, i );
                BREAK;
              end;
         end;

     // Get just the decimal portion up to the precision
     if FPrecision > 0 then
        ATemp := Copy(ATemp, 1, FPrecision);

     // Return the full number (both sides)
     if ATemp = '' then Result := AInt
     else Result := AInt + FormatSettings.DecimalSeparator + ATemp;
end;

procedure TIQWebFloatSpinner.SetBtnHeight(const Value: Integer);
begin
  FBtnHeight := Value;
  FFloatSpinnerStyle := fstCustom;
  AdjustToBtnSize;
end;

procedure TIQWebFloatSpinner.SetBtnWidth(const Value: Integer);
begin
  FBtnWidth := Value;
  FFloatSpinnerStyle := fstCustom;
  AdjustToBtnSize;
end;

procedure TIQWebFloatSpinner.AdjustToBtnSize;
var
   ACurCtrlWidth, ANewCtrlWidth, ANewCtrlHeight: Integer;
begin

  // Base width
  ACurCtrlWidth := Width;

  // Adjust top button
  with ButtonSpinUp do
    begin
      Left      := 0;
      Top       := 0;
      Width     := FBtnWidth;
      Height    := FBtnHeight;
    end;

  // Adjust bottom button
  with ButtonSpinDown do
    begin
      Left      := 0;
      Top       := FBtnHeight + cSPACE_BETWEEN_BTN;
      Width     := FBtnWidth;
      Height    := FBtnHeight;
      //Layout    := blGlyphBottom;
    end;

    
       // Do not modify control size at runtime
       if (csDesigning in ComponentState) and
          (Width = cDEFAULT_CTRL_WIDTH) and
          (Height = cDEFAULT_CTRL_Height) then
        begin
          ANewCtrlWidth  := ACurCtrlWidth + FBtnWidth; // add to the width
          ANewCtrlHeight := (FBtnHeight * 2) + cSPACE_BETWEEN_BTN + 1;
          Width      := ANewCtrlWidth;  // new control width
          Height     := ANewCtrlHeight; // new control height
        end;


  // Adjust the width of the button panel.  The height will adjust
  // with the control height (changed above).
  PanelButtons.Width := FBtnWidth;

  EditBox.Left           := 0; // no change
  EditBox.Top            := 0; // no change
  EditBox.Width          := ANewCtrlWidth - FBtnWidth - 1;
  EditBox.Height         := ANewCtrlHeight - cEDIT_OFFSET;
  // 01/05/20007 Setting MinHeight constraint prevents resize after font change
  EditBox.Constraints.MinHeight := EditBox.Height;
end;

procedure TIQWebFloatSpinner.SetLgImg(const Value: Boolean);
begin
  FLgImg := Value;
  with ButtonSpinUp do Font.Size := IQMS.Common.Numbers.iIf(Value, 11, 8);
  with ButtonSpinDown do  Font.Size := IQMS.Common.Numbers.iIf(Value, 11, 8);
end;

procedure TIQWebFloatSpinner.SetFloatSpinnerStyle(
  const Value: TFloatSpinnerStyle);
begin
  // With this property, quickly set the style to standard or touchscreen.
  // This method is only called at design time.  At runtime, the changed
  // properties are read and applied from the form.

  FFloatSpinnerStyle := Value;

  if not (csDesigning in ComponentState) then Exit;

  case FFloatSpinnerStyle of
    fstCustom:
     begin
       // no major changes, just ensure everything is proportional
       EditBox.Width := Width - PanelButtons.Width - 1;
       EditBox.Height:= Height - cEDIT_OFFSET;
     end;
    fstStandard:
     begin
       Font.Style := [];
       Font.Name := IQMS.Common.Screen.SystemFontName;
       Font.Size := 8;

       FBtnHeight := cDEFAULT_BTN_HEIGHT;
       FBtnWidth  := cDEFAULT_BTN_WIDTH;

       AdjustToBtnSize;
       LargeBtnImage := FALSE;

       Width      := cDEFAULT_CTRL_WIDTH;
       Height     := cDEFAULT_CTRL_HEIGHT;

       EditBox.Width := cDEFAULT_CTRL_WIDTH - cDEFAULT_BTN_WIDTH - 1;
       EditBox.Height:= cDEFAULT_EDIT_HEIGHT;
       EditBox.Constraints.MinHeight := EditBox.Height;
       FFloatSpinnerStyle := fstStandard;

     end;
    fstTouchscreen:
     begin

       Font.Style := [fsBold];
       Font.Name := 'Tahoma';
       Font.Size := 14;

       FBtnHeight := 23;
       FBtnWidth  := 60;

       AdjustToBtnSize;

       LargeBtnImage := TRUE;

       // Don't modify width unless we must
       if Width < FBtnWidth then
          Width := FBtnWidth + 6;

       EditBox.Width := Width - FBtnWidth - 1;
       EditBox.Height:= Height - cEDIT_OFFSET;
       EditBox.Constraints.MinHeight := EditBox.Height;
       FFloatSpinnerStyle := fstTouchscreen;
     end;
  end; // end case

end;

procedure TIQWebFloatSpinner.WMSetFont(var Message: TWMSetFont);
var
   ACurHeight: Integer;
begin
  ACurHeight := Height;
  FFloatSpinnerStyle := fstCustom;
  inherited;
  Height := ACurHeight;
end;

procedure TIQWebFloatSpinner.CMFontChanged(var Message: TMessage);
begin
  FFloatSpinnerStyle := fstCustom;
  inherited;
end;

function TIQWebFloatSpinner.RemoveTrailingZeroes(AValue: String): String;
var
   i: Integer;
begin
  Result := AValue; // default
  for i := Length(AValue) downto 0 do
    begin
      if AValue[i] <> '0' then
         begin
           Result := LeftStr( AValue, i );
           BREAK;
         end;
    end;
end;

function TIQWebFloatSpinner.GetNumericFromStr(AValue: Double;
  AIncludeDecimal: Boolean): String;
const
  cValidChar = [ '0'..'9' ];
var
   iEndPos, i: Integer;
   S, ATemp: String;
begin
   //S := IQMS.Common.Numbers.FloatToStr2(AValue);
   S := IQMS.Common.NLS.IQFloatToStrF(AValue, ffFixed, 15, FPrecision);
   if not AIncludeDecimal then
      iEndPos := Pos( FormatSettings.DecimalSeparator, S )
   else
      iEndPos := Length(S);

   for i := 1 to iEndPos do
    if (S[i] in cValidChar) or
       (S[i] = FormatSettings.DecimalSeparator) then
       ATemp := ATemp + S[i];

   Result := ATemp;
end;

function TIQWebFloatSpinner.GetNumericFromStr(AValue: Integer): String;
const
  cValidChar = [ '0'..'9' ];
var
   iEndPos, i: Integer;
   S, ATemp: String;
begin
   S := IQMS.Common.Numbers.FloatToStr2(AValue);
   iEndPos := Pos( FormatSettings.DecimalSeparator, S );
   if iEndPos = 0 then
      iEndPos := Length(S);

   for i := 1 to iEndPos do
    if (S[i] in cValidChar) then
      begin
       if (S[i] = FormatSettings.DecimalSeparator) then
          BREAK;
       ATemp := ATemp + S[i];
      end;
end;

procedure TIQWebFloatSpinner.IncAsDecimal(var S: String; N: Integer);
var
   X: LongInt; // or Int64
   i: Integer;
   bHasPrecedingZeroes: Boolean;
   R, rInc: Double;
   ATemp: String;
begin
  { This method handles the task of incrementing just the decimal portion.

   Example Values provided by X:
     N = 1
     IN:   123
     OUT:  124

     N = 1
     IN:   001
     OUT:  002

     N = -1
     IN:   123
     OUT:  122

     N = -1
     IN:   001
     OUT:  999

   Examples for Usage:
    Start      Increment    Result
    -------------------------------
    1.123      1            1.124
    1.123     -1            1.122
    1.001      1            1.002
    1.001     -1            1.999
  }

  // Check for preceding zeroes
  bHasPrecedingZeroes := (Length(S) > 1) and (S[1] = '0');


  // ** Increment **
  if N > 0 then
     begin
       // Simple increment
       if not bHasPrecedingZeroes then
          begin
            // Get String as LongInt
            if S > '' then X := StrToInt64(S) else S := '0'; // Adjust to at least a 0
            Inc(X);
            S := IntToStr(X);
          end
       // Complex increment
       else
        begin
          // Get the IN string as a decimal
          ATemp := Format('0.%s', [S]);
          R := IQMS.Common.Numbers.StoF(ATemp);
          // Get a value to add:
          // For example, if our number is '0005', then we want to get '0.0001'
          ATemp := Format('0.%s1', [Repl('0', Length(S)-1)]);
          // Turn the string into a floating point (i.e., 0.0001)
          rInc := IQMS.Common.Numbers.StoF(ATemp);
          // Add the decimal value we created to the number
          R := R + rInc;
          S := GetNumericFromStr(R);
          S := RemoveTrailingZeroes(S);
          S := ValueOfSideB(S, 2);
          if S = '' then S := '0';
        end;
     end

  // ** Decrement **
   else if N < 0 then
     begin
       // Simple decrement
       if not bHasPrecedingZeroes then
          begin
            // Get String as LongInt
            if S > '' then X := StrToInt64(S) else S := '0'; // Adjust to at least a 0
            Dec(X);
            if (X < 0) then X := 0; // reset, if negative
            S := IntToStr(X);
          end
       // Complex decrement
       else
         begin
          // Get the IN string as a decimal
          ATemp := Format('0.%s', [S]);
          R := IQMS.Common.Numbers.StoF(ATemp);
          // Get a value to add:
          // For example, if our number is '0005', then we want to get '0.0001'
          ATemp := Format('0.%s1', [Repl('0', Length(S)-1)]);
          // Turn the string into a floating point (i.e., 0.0001)
          rInc := IQMS.Common.Numbers.StoF(ATemp);
          // Subtract the decimal value we created to the number
          R := R - rInc;
          S := GetNumericFromStr(R);
          S := RemoveTrailingZeroes(S);
          S := ValueOfSideB(S, 2);
          if S = '' then S := '0';
         end;
     end;
end;

end.
