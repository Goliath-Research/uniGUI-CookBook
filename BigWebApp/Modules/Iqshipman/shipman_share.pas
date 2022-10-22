unit shipman_share;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  IQMS.WebVcl.SecurityRegister,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox;

  // Safely set a combo box item index
  procedure SafeSetCmbIndex(AComboBox: TUniComboBox; AItemIndex: Integer);

  // Get City, State Zip Country string
  function CityStateZip(const ACity, AState, APostalCode, ACountry: String): String;

  procedure ParsePostalCode(const APostalCode: String;
   var ACode, ASuffix: String);

  procedure ApplySecurityToControl(AComponent: TComponent; ASecurityItem: String; ASecurityRegister:TIQWebSecurityRegister);

  procedure CheckUPSVersionControlCreated;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.Controls;

{ ---------------------------------------------------------------------------- }
function DefaultCarrierID: Real;
begin
  Result := SelectValueAsFloat('select id from freight_carrier where NVL(isdefault,''N'')=''Y''');
  if Result = 0 then
     Result := SelectValueAsFloat('select id from freight_carrier where seq = 1');
  if Result = 0 then
     Result := SelectValueAsFloat('select id from '#13 +
                            '(select id from freight_carrier order by id)'#13 +
                            'where rownum < 2');
end;

{ ---------------------------------------------------------------------------- }
procedure SafeSetCmbIndex(AComboBox: TUniComboBox; AItemIndex: Integer);
var
   nH: Integer;
begin
  if AComboBox = NIL then Exit;
  nH := AComboBox.Items.Count - 1;
  if (AItemIndex in [0..nH]) then
     AComboBox.ItemIndex := AItemIndex;
end;

procedure ApplySecurityToControl(AComponent: TComponent; ASecurityItem: String; ASecurityRegister:TIQWebSecurityRegister);
begin
  IQMS.Common.Controls.IQEnableControl(AComponent, ASecurityRegister.Enabled[ASecurityItem] );
  IQMS.Common.Controls.IQShowControl(AComponent, ASecurityRegister.Visible[ASecurityItem] );
end;

{ ---------------------------------------------------------------------------- }
function CityStateZip(const ACity, AState, APostalCode, ACountry: String): String;
begin
  // get the "city, state zip" line
  if (Trim(ACity) > '') and (Trim(AState) > '') then
     Result := Trim(Format('%s, %s %s', [Trim(ACity),Trim(AState),Trim(APostalCode)]))
  else if (Trim(ACity) > '') and (Trim(AState) = '') then
     Result := Trim(Format('%s %s', [Trim(ACity),Trim(APostalCode)]))
  else if (Trim(AState) > '') and (Trim(ACity) = '') then
     Result := Trim(Format('%s %s', [Trim(AState),Trim(APostalCode)]))
  else Result := Trim(APostalCode);

  // now, add country, if it is available
  if (ACountry > '') then
     Result := Format('%s %s',[Result, ACountry]);

end;

{ ---------------------------------------------------------------------------- }

procedure ParsePostalCode(const APostalCode: String;
 var ACode, ASuffix: String);
var
   ADashPos: Integer;
begin
  // default values
  ACode := APostalCode;
  ASuffix := '0000';

  ADashPos := Pos('-', APostalCode);

  if (ADashPos > 0) and (Length(APostalCode) > 5)  then
     begin
       ACode := LeftStr(APostalCode, ADashPos-1);
       ASuffix := IQMS.Common.StringUtils.RightStr(APostalCode, ADashPos-2);

       // If something went wrong, then return the basics
       if (Length(ACode) < 5) then
          begin
            ACode := APostalCode;
            ASuffix := '0000';
          end;
     end;

end;

{ ---------------------------------------------------------------------------- }

procedure CheckUPSVersionControlCreated;
begin
  ExecuteCommand('begin iqms.shipman.check_ups_versionctrl_created; end;');
end;

end.
