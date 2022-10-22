unit zipcode;

{ Routines that can be called outside COM. This unit can be declared
  safely in any application.  It contains no module-specific units,
  but methods that are primarily SQL.
}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

// Select from zip code picklist
function SelectZipCode(var ACity, AState, AZipCode, ACountry: String): Boolean;
function SelectZipCodeDB(ACityField, AStateField, AZipCodeField,
  ACountryField: TStringField; AAutoPost: Boolean = TRUE): Boolean;

// Lookup the City, State and Country for a Zip Code
// 1.  Return by variable
function GetZipCodeLookup(const AZipCode: String; var ACity, AState,
  ACountry: String; AShowError: Boolean = TRUE): Boolean;
// 2.  Pass dataset fields and post changes
function GetZipCodeDBLookup(ACityField, AStateField, AZipCodeField,
  ACountryField: TStringField; AShowError: Boolean = TRUE;
  AAutoPost: Boolean = TRUE): Boolean;

implementation

uses
  dm_zip,
  IQMS.WebVcl.Hpick,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.ResStrings,
  IQMS.Common.Regional;

function SelectZipCode(var ACity, AState, AZipCode, ACountry: String): Boolean;
var
  APicklist: TIQWebHPick;
begin
  with TZIP_DM.Create(NIL) do
    try
      if Trim(AZipCode) > '' then
        Result := SearchByZip(AZipCode, ACity, AState, ACountry)
      else
        Result := SearchZip(ACity, AState, AZipCode, ACountry);
    finally
      Free;
    end;
end;

function SelectZipCodeDB(ACityField, AStateField, AZipCodeField,
  ACountryField: TStringField; AAutoPost: Boolean = TRUE): Boolean;
var
  AZipCode, ACity, AState, ACountry: String;
begin
  // Applies values to dataset fields
  Result := FALSE;
  if not Assigned(AZipCodeField) then
    Exit;
  if not Assigned(AZipCodeField.DataSet) or
    (AZipCodeField.DataSet.Active = FALSE) then
    Exit;
  // Must post changes first for accurate return
  if AAutoPost and (AZipCodeField.DataSet.State in [dsEdit, dsInsert]) then
    AZipCodeField.DataSet.Post;
  // Get values
  if SelectZipCode(ACity, AState, AZipCode, ACountry) then // zipcode
    begin
      if not (AZipCodeField.DataSet.State in [dsEdit, dsInsert]) then
        AZipCodeField.DataSet.Edit;
      AZipCodeField.AsString := AZipCode;
      if Assigned(ACityField) then
        ACityField.AsString := ACity;
      if Assigned(AStateField) then
        AStateField.AsString := AState;
      if Assigned(ACountryField) then
        ACountryField.AsString := ACountry;
      if AAutoPost then
        AZipCodeField.DataSet.Post;
      Result := TRUE;
    end;
end;

function GetZipCodeLookup(const AZipCode: String; var ACity, AState,
  ACountry: String; AShowError: Boolean = TRUE): Boolean;
var
  ACount, x: Integer;
  AData: Variant;
  AZip: String; // fixed version of the AZipCode parameter
begin
  // Based on a Zip Code, get the city, state and country.
  // Returns TRUE if the zip code was found in the database.
  Result := FALSE; // default

  // Trim zip code
  AZip := UpperCase(Trim(AZipCode));
  if AZip = '' then
    Exit;
  // Get left side of dash (-)
  // if Pos('-',AZip)>0 then AZip := GetToken(AZip,'-',1);
  x := Pos('-', AZip);
  if x > 0 then
    AZip := Copy(AZip, 1, x - 1);

  ACount := 0;
  with TFDQuery.Create(NIL) do
    try
      Connection := UniMainModule.FDConnection1;
      // NOTE: wrapping the field, zip, in trim(upper()) slows down the SQL markedly.
      // The difference can be 5 seconds versus 1 second.
      SQL.Add(Format
        ('select city, state, country from zipcode where upper(trim(zip)) = ''%s''',
        [AZip]));
      // SQL.Add( Format( 'select city, state, country from zipcode where zip = ''%s''', [AZip]));
      Open;
      Result := not (BOF and EOF);
      if not Result and AShowError then
        begin
          IQError(IQMS.Common.ResStrings.cTXT0000305 { 'Zip Code not found.' } );
          Exit;
        end;
      // NOTE:  we don't "select count(*) from zipcode" because it takes too long.
      // It takes so long because we trim(upper(zip)).
      // So, we limit this to one SQL command inside this TFDQuery.
      ACount := 0;
      while not EOF do
        begin
          ACity := FieldByName('CITY').AsString;
          AState := FieldByName('STATE').AsString;
          // 08/03/2015 Get a valid country name so that it displays correctly
          // in the combo box.
          ACountry := IQMS.Common.Regional.GetValidCountryName(FieldByName('COUNTRY')
            .AsString);
          Next;
          Inc(ACount);
          // If we truly have more than one record, then present a picklist
          if ACount >= 2 then
            begin
              Result := SelectZipCode(ACity, AState, AZip, ACountry);
              BREAK;
            end;
        end;
    finally
      Free;
    end;
end;

function GetZipCodeDBLookup(ACityField, AStateField, AZipCodeField,
  ACountryField: TStringField; AShowError: Boolean = TRUE;
  AAutoPost: Boolean = TRUE): Boolean;
var
  AZipCode, ACity, AState, ACountry: String;
begin
  // Applies values to dataset fields
  Result := FALSE;
  if not Assigned(AZipCodeField) then
    Exit;
  if not Assigned(AZipCodeField.DataSet) or
    (AZipCodeField.DataSet.Active = FALSE) then
    Exit;
  // Must post changes first for accurate return
  if AAutoPost and (AZipCodeField.DataSet.State in [dsEdit, dsInsert]) then
    AZipCodeField.DataSet.Post;
  // Get values
  AZipCode := AZipCodeField.AsString;
  Result := GetZipCodeLookup(AZipCode, ACity, AState, ACountry, AShowError);
  if Result then
    begin
      if not (AZipCodeField.DataSet.State in [dsEdit, dsInsert]) then
        AZipCodeField.DataSet.Edit;
      if Assigned(ACityField) then
        ACityField.AsString := ACity;
      if Assigned(AStateField) then
        AStateField.AsString := AState;
      if Assigned(ACountryField) then
        ACountryField.AsString := ACountry;
      if AAutoPost then
        AZipCodeField.DataSet.Post;
    end;
end;

end.
