unit IQMS.WebVcl.DateControls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Math,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniComboBox, uniGUIForm;

type
  TIQWebDurationComboBox = class(TUniComboBox)
  private
    { Private declarations }

    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    procedure CMOnExit(var Message: TMessage); message CM_EXIT;

    procedure LoadItems;
    procedure PredictDurationByValue(AValue: Real);
    function ParseDurationText(var AValue: Real; var AUnit: String): Boolean;
    function FixUnitText(const AUnit: String): String;


    function GetDuration: Real;
    procedure SetDuration(const Value: Real);
    function GetDisplayText(AValue: Real; AText: String): String;
    procedure DoValidateText;
  protected
    { Protected declarations }
    procedure Loaded; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure Load;
  published
    { Published declarations }
    property Duration: Real read GetDuration write SetDuration;
    property Visible;
  end;

type
  TIQWebTimeComboBox = class(TUniFormControl)
    cmbTimeStr: TComboBox;
    cmbTimeComboDateTime: TDateTimePicker;
    pnlStartTimeButton: TPanel;
    sbtnDropDown: TSpeedButton;
    shpHiLt: TShape;
    procedure DDBtnClick(Sender: TObject);
    procedure TimeStrChange(Sender: TObject);
    procedure TimeStrDropDown(Sender: TObject);
    procedure DoOnChange(Sender: TObject);
  private
    { Private declarations }
    FOnChange: TNotifyEvent;
    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    function GetTime: Real;
    procedure SetTime(const Value: Real);
  protected
    { Protected declarations }
    procedure LoadItems;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    procedure Load;
  published
    { Published declarations }
    property Time: Real read GetTime write SetTime;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;

    property Visible;
  end;

resourcestring
  cMin = 'minutes';
  cHour = 'hours';
  cDay = 'days';
  cWeek = 'weeks';

  cMin2 = 'mns';
  cHour2 = 'hrs';
  cDay2 = 'dys';
  cWeek2 = 'wks';


implementation

uses
    IQMS.Common.Dates,
//    iqnumber,
//    vcl_share,
    IQMS.Common.SysInfo;

{ ---------------------------------------------------------------------------- }
{ TIQWebDurationComboBox }
{ ---------------------------------------------------------------------------- }

constructor TIQWebDurationComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle - [csClickEvents, csDoubleClicks];
  ControlStyle := ControlStyle + [csNoStdEvents];

end;

procedure TIQWebDurationComboBox.Loaded;
begin
  inherited;
  LoadItems;
  ItemIndex := 1;
end;

procedure TIQWebDurationComboBox.CMEnabledChanged(var Msg: TMessage);
begin
  inherited;
  if Self.Enabled then
     begin
       Self.Color := clWhite;
       Self.Font.Color := clBlack;
     end
  else
     begin
       Self.Color := clBtnFace;
       Self.Font.Color := clBtnShadow;
     end;
end;

procedure TIQWebDurationComboBox.LoadItems;
var
   i: Integer;
begin
  Clear;

  // Minutes
  Items.Add(Format('0 %s',  [cMin]));
  Items.Add(Format('5 %s',  [cMin]));
  Items.Add(Format('10 %s', [cMin]));
  Items.Add(Format('15 %s', [cMin]));
  Items.Add(Format('30 %s', [cMin]));

  for i := 1 to 11 do
      Items.Add(Format('%d %s', [i, cHour]));

  Items.Add(Format('0.5 %s', [cDay]));

  for i := 1 to 4 do
      Items.Add(Format('%d %s', [i, cDay]));

  Items.Add(Format('18 %s', [cHour]));

  for i := 1 to 2 do
      Items.Add(Format('%d %s', [i, cWeek]));

end;

function TIQWebDurationComboBox.GetDisplayText(AValue: Real; AText: String): String;
var
   R: Real;
begin
  R := math.RoundTo(AValue, -2);
  if Frac(R) = 0 then
     Result := Format('%d %s', [Round(AValue), AText])
  else
     Result := Format('%s %s', [FormatFloat('#0.0#', R), AText]);

end;

procedure TIQWebDurationComboBox.PredictDurationByValue(AValue: Real);
  function _N(ADouble: Double): Real;
  var S: String;
  begin
    S := Format('%.2f', [ADouble]);
    Result := StrToFloat(S);
  end;
var
   iWeeks, iDays, iHours, iMinutes: Real;
   S: String;
begin

   iMinutes := _N(AValue / IQMS.Common.Dates.TIME_OneMinute);
   iHours   := _N(AValue / IQMS.Common.Dates.TIME_OneHour);
   iDays    := _N(AValue / IQMS.Common.Dates.TIME_OneDay);
   iWeeks   := _N(AValue / IQMS.Common.Dates.TIME_OneWeek);

   if iWeeks >= 1 then
      S := GetDisplayText(iWeeks, cWeek)
   else if iDays >= 1 then
      S := GetDisplayText(iDays, cDay)
   else if iHours >= 1 then
      S := GetDisplayText(iHours, cHour)
   else if iMinutes >= 1 then
      S := GetDisplayText(iMinutes, cMin)
   else
      S := Format('0 %s', [cMin]);

   Text := S;

end;

function TIQWebDurationComboBox.GetDuration: Real;
var
  AValue: Real;
  AUnit: String;
  i: Integer;
begin
  // Get the parts
  if not ParseDurationText(AValue, AUnit) then Exit;

       if AUnit = cMin then
       Result := AValue * IQMS.Common.Dates.TIME_OneMinute
  else if AUnit = cHour then
       Result := AValue * IQMS.Common.Dates.TIME_OneHour
  else if AUnit = cDay then
       Result := AValue * IQMS.Common.Dates.TIME_OneDay
  else if AUnit = cWeek then
       Result := AValue * IQMS.Common.Dates.TIME_OneWeek
  else
       Result := 0;

end;

procedure TIQWebDurationComboBox.SetDuration(const Value: Real);
begin
  PredictDurationByValue(Value);
end;

procedure TIQWebDurationComboBox.Load;
begin
  LoadItems;
end;

function TIQWebDurationComboBox.ParseDurationText(var AValue: Real;
  var AUnit: String): Boolean;
const
  cValidChar = [ '0'..'9'];
  cBreakChar = [ #13, #10, #0, ' '];
var
   i, n: Integer;
   S, ATempS,
   AThousandSeparator, ADecimal: String;
begin
  ADecimal           := FormatSettings.DecimalSeparator;
  AThousandSeparator := FormatSettings.ThousandSeparator;

  // holder
  S := Text;

  // number/text divider is a space and it must exist
  n := Pos(' ', S);
  Result := n > 0;
  if not Result then Exit;

  // Get the number part
  ATempS := Trim(Copy(S, 1, n - 1));

  // now, get the useable number
//  Result := iqnumber.IsStringValidFloat(ATempS, AValue);
  if not Result then Exit;

  // Get the text part
  AUnit := Trim(Copy(S, n + 1, Length(S)));
  AUnit := FixUnitText(AUnit);
  Result := AUnit > '';
  
end;

function TIQWebDurationComboBox.FixUnitText(const AUnit: String): String;

   function _Same(S: String): Boolean;
   begin
     Result := UpperCase(Trim(AUnit)) = UpperCase(Trim(S));
   end;

   function _Like1(S: String): Boolean;
   begin
     Result := Copy(UpperCase(Trim(AUnit)), 1, 3) = Copy(UpperCase(Trim(S)), 1, 3);
   end;

   function _Like2(S: String): Boolean;
   begin
     Result := Copy(UpperCase(Trim(AUnit)), 1, 2) = Copy(UpperCase(Trim(S)), 1, 3);
   end;

begin
       if Trim(AUnit) = '' then Result := ''

  // full string - exact
  else if _Same(cMin)    then Result := cMin
  else if _Same(cHour)   then Result := cHour
  else if _Same(cDay)    then Result := cDay
  else if _Same(cWeek)   then Result := cWeek

  // abbreviations - exact
  else if _Same(cMin2)   then Result := cMin
  else if _Same(cHour2)  then Result := cHour
  else if _Same(cDay2)   then Result := cDay
  else if _Same(cWeek2)  then Result := cWeek

  // full string - partial
  else if _Like1(cMin)   then Result := cMin
  else if _Like1(cHour)  then Result := cHour
  else if _Like1(cDay)   then Result := cDay
  else if _Like1(cWeek)  then Result := cWeek

  // abbreviations - partial
  else if _Like2(cMin2)  then Result := cMin
  else if _Like2(cHour2) then Result := cHour
  else if _Like2(cDay2)  then Result := cDay
  else if _Like2(cWeek2) then Result := cWeek


  else Result := '';

end;

procedure TIQWebDurationComboBox.DoValidateText;
var
  AValue: Real;
  AUnit: String;
  i: Integer;
begin
  // Get the parts
  if not ParseDurationText(AValue, AUnit) then
     //raise Exception.Create('Invalid time value.');
     ItemIndex := 1
  else
     begin
       Text := GetDisplayText(AValue, AUnit);
       if Text = '' then
          ItemIndex := 1;
     end;
end;

procedure TIQWebDurationComboBox.CMOnExit(var Message: TMessage);
begin
  DoValidateText;
end;

{ ---------------------------------------------------------------------------- }
{ TIQWebTimeComboBox }
{ ---------------------------------------------------------------------------- }

constructor TIQWebTimeComboBox.Create(AOwner: TComponent);
const
  cDEFAULT_WIDTH = 112;
  cDEFAULT_HEIGHT = 21;
var
   bXp: Boolean;
begin

  inherited Create(AOwner);

  ControlStyle := ControlStyle - [csClickEvents, csDoubleClicks];
  ControlStyle := ControlStyle + [csNoStdEvents];

  if not (csDesigning in ComponentState) then
     bXp := IQMS.Common.SysInfo.IsWinXP or IQMS.Common.SysInfo.IsWinVista
  else
     bXp := False;

  Width := cDEFAULT_WIDTH;
  Height := cDEFAULT_HEIGHT;
//  BevelOuter := bvNone;
//  BevelInner := bvNone;

  cmbTimeStr := TComboBox.Create(Self);
  with cmbTimeStr do
  begin
    Parent := Self;
    Left := 2;
    Top  := 0;
    Width := cDEFAULT_WIDTH - 3;
    Height := cDEFAULT_HEIGHT;
    Style := csDropDownList;
    Anchors := [akLeft, akTop, akRight, akBottom];
    ItemHeight := 13;
    TabStop := False;
    OnChange := TimeStrChange;
    OnDropDown := TimeStrDropDown;
  end;

  cmbTimeComboDateTime := TDateTimePicker.Create(Self);
  with cmbTimeComboDateTime do
  begin
    Parent := Self;
    Left := 0;
    Top := 0;
    Width := cDEFAULT_WIDTH;
    Height := cDEFAULT_HEIGHT;
    Anchors := [akLeft, akTop, akRight, akBottom];
    //ShowButton := FALSE;

    DateMode := dmComboBox;
    DateFormat := dfShort;
    Kind := dtkTime;
    //DisplayFormat := 't';

    OnChange := DoOnChange;
  end;

  cmbTimeStr.SendToBack;

  pnlStartTimeButton := TPanel.Create(Self);
  with pnlStartTimeButton do
  begin
    Parent := Self;
    {Left := 93;
    Top := 2;
    Width := 17;
    Height := 17;}
    if bXp then
       begin
         Left := 93;
         Top := 1;
         Width := 18;
         Height := 19;
       end
    else
       begin
         Left := 93;
         Top := 2;
         Width := 17;
         Height := 17;
       end;
    Anchors := [akTop, akRight];
    BevelOuter := bvNone;
    BevelInner := bvNone;
    ParentBackground := False;
    TabOrder := 1;
    Color := clWindow;
  end;

  sbtnDropDown := TSpeedButton.Create(Self);
  with sbtnDropDown do
  begin
    Parent := pnlStartTimeButton;

    if bXp then
       begin
         Left := 0;
         Top  := 0;
         Width := 18;
         Height := 19;
       end
    else
       begin
         Left := 1;
         Top  := 1;
         Width := 16;
         Height := 16;
       end;

    Anchors := [akLeft, akTop, akRight, akBottom];
    Tag := 1999;

    OnClick := DDBtnClick;

    // Load image from resource file
    //Glyph.LoadFromResourceName(HInstance, 'DROPSTANDARDTCB');
    Font.Name := 'Marlett';
    Font.Size := 9;
    Caption   := IntToStr(6);


    if (bXp) then
      begin
        Flat := True;
        Transparent := True;
      end;
  end;
  {
  shpHiLt := TShape.Create(Self);
  with shpHiLt do
  begin
    Parent := pnlStartTimeButton;
    Width := 1;
    Align := alRight;
    Pen.Color := cl3DDkShadow;
    Visible := not bXp;
  end;
  }
end;

destructor TIQWebTimeComboBox.Destroy;
begin
  //if Assigned(shpHiLt) then FreeAndNil(shpHiLt);
  if Assigned(sbtnDropDown) then FreeAndNil(sbtnDropDown);
  if Assigned(pnlStartTimeButton) then FreeAndNil(pnlStartTimeButton);
  if Assigned(cmbTimeComboDateTime) then FreeAndNil(cmbTimeComboDateTime);
  if Assigned(cmbTimeStr) then FreeAndNil(cmbTimeStr);

  inherited Destroy;
end;

procedure TIQWebTimeComboBox.Loaded;
begin
  inherited Loaded;

  if (cmbTimeComboDateTime <> NIL) then
     cmbTimeComboDateTime.Format := 'hh:mm tt';

end;

function TIQWebTimeComboBox.GetTime: Real;
begin
  if ( csDesigning in ComponentState ) then
     Exit;
  Result := cmbTimeComboDateTime.Time;
end;

procedure TIQWebTimeComboBox.Load;
begin
  LoadItems;
end;

procedure TIQWebTimeComboBox.LoadItems;
var
   i: Integer;
begin

  if ( csDesigning in ComponentState ) then
     Exit;

  cmbTimeComboDateTime.Format := 'hh:mm tt';

  with cmbTimeStr do
  try
     Items.BeginUpdate;
     Items.Clear;
     for i := 0 to 47 do
         Items.Add(FormatDateTime('t', i * IQMS.Common.Dates.TIME_30Mins ));

  finally
     Items.EndUpdate;
  end;   

end;

procedure TIQWebTimeComboBox.SetTime(const Value: Real);
begin
  if ( csDesigning in ComponentState ) then
     Exit;

  cmbTimeComboDateTime.Time := Value;
end;

procedure TIQWebTimeComboBox.DDBtnClick(Sender: TObject);
begin
  if ( csDesigning in ComponentState ) then
     Exit;

  cmbTimeStr.DroppedDown := TRUE;
end;

procedure TIQWebTimeComboBox.TimeStrChange(Sender: TObject);
var
   S: String;
   ATime: TDateTime;
begin
  if ( csDesigning in ComponentState ) then
     Exit;

  if (cmbTimeComboDateTime = NIL) or
     (cmbTimeStr = NIL) then
     Exit;

  if cmbTimeStr.ItemIndex > -1 then
     begin
       ATime := cmbTimeComboDateTime.DateTime;
       S := cmbTimeStr.Items.Strings[cmbTimeStr.ItemIndex];
       if IsStringValidDate(S, ATime) then // iqdate
          begin
            cmbTimeComboDateTime.Time := Frac(ATime);
            cmbTimeComboDateTime.Refresh;
          end;

       if Assigned(FOnChange) then
          FOnChange(Self);

     end;

end;

procedure TIQWebTimeComboBox.TimeStrDropDown(Sender: TObject);
var
   ANewTime: TTime;
   i: Integer;
begin
  if ( csDesigning in ComponentState ) then
     Exit;

  if (cmbTimeComboDateTime = NIL) or
     (cmbTimeStr = NIL) then
     Exit;


  LoadItems;

  // now find the current time
  RoundTime30(cmbTimeComboDateTime.Time, ANewTime);
  i := cmbTimeStr.Items.IndexOf(FormatDateTime('t', ANewTime));
  if i > -1 then cmbTimeStr.ItemIndex := i;

end;

procedure TIQWebTimeComboBox.DoOnChange(Sender: TObject);
begin
  if Assigned(FOnChange) then
     FOnChange(Self);
end;

procedure TIQWebTimeComboBox.CMEnabledChanged(var Msg: TMessage);
begin
  inherited;

  cmbTimeStr.Enabled := Self.Enabled;
  cmbTimeComboDateTime.Enabled := Self.Enabled;
  
  if Self.Enabled then
     begin
       cmbTimeStr.Color := clWhite;
       cmbTimeStr.Font.Color := clBlack;
       cmbTimeComboDateTime.Color := clWhite;
       cmbTimeComboDateTime.Font.Color := clBlack;
     end
  else
     begin
       cmbTimeStr.Color := clBtnFace;
       cmbTimeStr.Font.Color := clBtnShadow;
       cmbTimeComboDateTime.Color := clBtnFace;
       cmbTimeComboDateTime.Font.Color := clBtnShadow;
     end;
end;

end.
