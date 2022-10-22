unit dm_zip;

{ This DM is used mainly by zip_main and by zipcode.pas.  It contains
  no module-specific unit declarations; therefore, it can be called by
  or linked into any application. }

interface

uses
  System.SysUtils,
  System.Classes,
  System.Variants,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TZIP_DM = class(TDataModule)
    PkZipCode: TIQWebHPick;
    PkZipCodeID: TBCDField;
    PkZipCodeCITY: TStringField;
    PkZipCodeSTATE: TStringField;
    PkZipCodeZIP: TStringField;
    PkZipCodeCOUNTRY: TStringField;
    PkZipCodeLookup: TIQWebHPick;
    PkZipCodeLookupID: TBCDField;
    PkZipCodeLookupCITY: TStringField;
    PkZipCodeLookupSTATE: TStringField;
    PkZipCodeLookupZIP: TStringField;
    PkZipCodeLookupCOUNTRY: TStringField;
    procedure PkZipCodeLookupBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    FZipCode: String; // used for filtering the picklist (PkZipCodeLookup)
    function SearchZip(var ACity, AState, AZipCode, ACountry: String): Boolean;
    function SearchByZip(const AZipCode: String;
      var ACity, AState, ACountry: String): Boolean;
  end;

var
  ZIP_DM: TZIP_DM;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.ResStrings,
  IQMS.Common.Regional;

function TZIP_DM.SearchByZip(const AZipCode: String; var ACity, AState,
  ACountry: String): Boolean;
begin
  FZipCode := AZipCode; // used for filtering the picklist
  with PkZipCodeLookup do
    begin
      if Execute then
        begin
          ACity := System.Variants.VarToStr(GetValue('CITY'));
          AState := System.Variants.VarToStr(GetValue('STATE'));
          ACountry := IQMS.Common.Regional.GetValidCountryName
            (System.Variants.VarToStr(GetValue('COUNTRY')));
          Result := TRUE;
        end
      else
        Result := FALSE;
    end;
end;

function TZIP_DM.SearchZip(var ACity, AState, AZipCode,
  ACountry: String): Boolean;
begin
  with PkZipCode do
    if Execute then
      begin
        ACity := System.Variants.VarToStr(GetValue('CITY'));
        AState := System.Variants.VarToStr(GetValue('STATE'));
        AZipCode := System.Variants.VarToStr(GetValue('ZIP'));
        ACountry := IQMS.Common.Regional.GetValidCountryName
          (System.Variants.VarToStr(GetValue('COUNTRY')));
        Result := TRUE;
      end
    else
      Result := FALSE;
end;

procedure TZIP_DM.PkZipCodeLookupBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ZIPCODE', Trim(FZipCode));
  if Trim(FZipCode) > '' then
    PkZipCode.Title :=
      Format(IQMS.Common.ResStrings.cTXT0000315 { 'Select Record by Zip Code - %s' } ,
      [FZipCode]);
end;

end.
