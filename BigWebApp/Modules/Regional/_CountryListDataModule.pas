unit _CountryListDataModule;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Variants,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  MainModule;

type
  TCountryListDataModule = class(TDataModule)
    SrcLocaleCountry: TDataSource;
    QryLocaleCountry: TFDQuery;
    SrcLocaleSubdivision: TDataSource;
    QryLocaleSubdivision: TFDQuery;
    FDUpdateSQL_LocaleCountry: TFDUpdateSQL;
    FDUpdateSQL_LocaleSubdivision: TFDUpdateSQL;
    PkLocaleCountry: TIQWebHPick;
    PkLocaleSubdivision: TIQWebHPick;
    QryLocaleCountryID: TBCDField;
    QryLocaleCountryNAME: TWideStringField;
    QryLocaleCountryCHR2: TWideStringField;
    QryLocaleCountryCHR3: TWideStringField;
    QryLocaleCountryDIGIT3: TBCDField;
    QryLocaleCountryDEFAULT_SPELLING: TStringField;
    QryLocaleCountryCURRENCY_ID: TBCDField;
    QryLocaleCountryCURR_CODE: TStringField;
    QryLocaleSubdivisionID: TBCDField;
    QryLocaleSubdivisionLOCALE_COUNTRY_ID: TBCDField;
    QryLocaleSubdivisionNAME: TWideStringField;
    PkLocaleCountryID: TBCDField;
    PkLocaleCountryNAME: TWideStringField;
    PkLocaleCountryCHR2: TWideStringField;
    PkLocaleCountryCHR3: TWideStringField;
    PkLocaleCountryDIGIT3: TBCDField;
    PkLocaleCountryDEFAULT_SPELLING: TStringField;
    PkLocaleCountryADDRESS_FORMAT: TBCDField;
    PkLocaleCountryCURRENCY_ID: TBCDField;
    PkLocaleCountryCURR_CODE: TStringField;
    PkLocaleSubdivisionID: TBCDField;
    PkLocaleSubdivisionLOCALE_COUNTRY_ID: TBCDField;
    PkLocaleSubdivisionNAME: TWideStringField;
    PkCurrencyCode: TIQWebHPick;
    PkCurrencyCodeDESCRIP: TStringField;
    PkCurrencyCodeDIGIT3: TStringField;
    PkCurrencyCodeNATIVE_CURR: TStringField;
    PkCurrencyCodeID: TBCDField;
    PkCurrencyCodeCURR_CODE: TStringField;
    QryLocaleCountrySEQ: TBCDField;
    QryLocaleCountryPK_HIDE: TStringField;
    procedure PkLocaleSubdivisionBeforeOpen(DataSet: TDataSet);
    procedure QryLocaleCountryNewRecord(DataSet: TDataSet);
    procedure QryLocaleCountryBeforePost(DataSet: TDataSet);
    procedure QryLocaleSubdivisionNewRecord(DataSet: TDataSet);
    procedure QryLocaleSubdivisionBeforePost(DataSet: TDataSet);
    procedure QryLocaleSubdivisionBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchCountry;
    procedure SearchSubdivision;
    procedure SelectCurrency;
    procedure ClearCurrency;
    procedure LoadDefaultCountryList(const ADefaultSpellingsOnly: Boolean);
    procedure MoveCountrySequenceDown;
    procedure MoveCountrySequenceUp;
    procedure MoveCountrySequenceBottom;
    procedure MoveCountrySequenceTop;
    function CanLoadDefaultCountryList: Boolean;
  end;

var
  CountryListDataModule: TCountryListDataModule;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


uses
  Country_RscStr,
  IQMS.Common.Boolean,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.TableSequence;

procedure TCountryListDataModule.QryLocaleCountryBeforePost(DataSet: TDataSet);
begin
  // Country_RscStr.cRscStr0001 = 'Please enter a name.';
  IQAssert(QryLocaleCountryNAME.AsString > '', Country_RscStr.cRscStr0001);
end;

procedure TCountryListDataModule.QryLocaleCountryNewRecord(DataSet: TDataSet);
begin
  QryLocaleCountryID.AsLargeInt := GetNextID('LOCALE_COUNTRY');
end;

procedure TCountryListDataModule.QryLocaleSubdivisionBeforeInsert(DataSet: TDataSet);
begin
  if (QryLocaleCountry.State in [dsEdit, dsInsert]) then
    QryLocaleCountry.Post;
  // Country_RscStr.cRscStr0002 =
  // 'Please create a country record first, before entering subdivisions.';
  IQAssert(QryLocaleCountryID.AsLargeInt > 0, Country_RscStr.cRscStr0002);
end;

procedure TCountryListDataModule.QryLocaleSubdivisionBeforePost(DataSet: TDataSet);
begin
  if (QryLocaleCountry.State in [dsEdit, dsInsert]) then
    QryLocaleCountry.Post;
  // Country_RscStr.cRscStr0001 = 'Please enter a name.';
  IQAssert(QryLocaleSubdivisionNAME.AsString > '', Country_RscStr.cRscStr0001);
end;

procedure TCountryListDataModule.QryLocaleSubdivisionNewRecord(DataSet: TDataSet);
begin
  QryLocaleSubdivisionID.AsLargeInt := GetNextID('LOCALE_SUBDIVISION');
  QryLocaleSubdivisionLOCALE_COUNTRY_ID.AsLargeInt := QryLocaleCountryID.AsLargeInt;
end;

procedure TCountryListDataModule.SearchCountry;
begin
  with PkLocaleCountry do
  begin
    if Execute then
    begin
      if NewResultValue then
        QryLocaleCountry.Append
      else
        QryLocaleCountry.Locate('ID',
          System.Variants.VarAsType(GetValue('ID'), varUInt64),
          []);
    end;
  end;
end;

procedure TCountryListDataModule.SearchSubdivision;
begin
  with PkLocaleSubdivision do
  begin
    if Execute then
    begin
      if NewResultValue then
        QryLocaleSubdivision.Append
      else
        QryLocaleSubdivision.Locate('ID',
          System.Variants.VarAsType(GetValue('ID'), varUInt64),
          []);
    end;
  end;
end;

procedure TCountryListDataModule.SelectCurrency;
begin
  with PkCurrencyCode do
  begin
    if Execute then
    begin
      if not (QryLocaleCountry.State in [dsEdit, dsInsert]) then
        QryLocaleCountry.Edit;
      QryLocaleCountryCURRENCY_ID.AsLargeInt := System.Variants.VarAsType(GetValue('ID'),
        varUInt64);
      QryLocaleCountryCURR_CODE.AsString := System.Variants.VarToStr(GetValue('CURR_CODE'));
    end;
  end;
end;

function TCountryListDataModule.CanLoadDefaultCountryList: Boolean;
begin
  Result := SelectValueAsInteger(
    'SELECT iqms.regional.can_load_defaults FROM DUAL') = 1;
end;

procedure TCountryListDataModule.ClearCurrency;
begin
  // Country_RscStr.cRscStr0003 = 'Clear currency?';
  if IQConfirmYN(Country_RscStr.cRscStr0003) then
  begin
    if not (QryLocaleCountry.State in [dsEdit, dsInsert]) then
      QryLocaleCountry.Edit;
    QryLocaleCountryCURRENCY_ID.Clear;
    QryLocaleCountryCURR_CODE.Clear;
  end;
end;

procedure TCountryListDataModule.LoadDefaultCountryList(const ADefaultSpellingsOnly: Boolean);
begin
  ExecuteCommandFmt(
    'BEGIN iqms.regional.load_locale_countries(''%s'');  END;',
    [TIQBoolean.AsYN(ADefaultSpellingsOnly)]);
  QryLocaleCountry.Refresh;
  QryLocaleSubdivision.Refresh;
end;

procedure TCountryListDataModule.PkLocaleSubdivisionBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', QryLocaleCountryID.AsLargeInt);
end;

procedure TCountryListDataModule.MoveCountrySequenceDown;
begin
  ChangeSequence(
    QryLocaleCountry, // DataSet
    'LOCALE_COUNTRY', // TableName
    '', // Master Field
    QryLocaleCountrySEQ.AsInteger, // Current Seq
    QryLocaleCountrySEQ.AsInteger + 1 // New Seq
    ); // table_seq
end;

procedure TCountryListDataModule.MoveCountrySequenceUp;
begin
  ChangeSequence(
    QryLocaleCountry, // DataSet
    'LOCALE_COUNTRY', // TableName
    '', // Master Field
    QryLocaleCountrySEQ.AsInteger, // Current Seq
    QryLocaleCountrySEQ.AsInteger - 1 // New Seq
    ); // table_seq
end;

procedure TCountryListDataModule.MoveCountrySequenceBottom;
begin
  ChangeSequence(
    QryLocaleCountry, // DataSet
    'LOCALE_COUNTRY', // TableName
    '', // Master Field
    QryLocaleCountrySEQ.AsInteger, // Current Seq
    SelectValueAsInteger('SELECT MAX(seq) FROM locale_country') // New Seq
    ); // table_seq
end;

procedure TCountryListDataModule.MoveCountrySequenceTop;
begin
  ChangeSequence(
    QryLocaleCountry, // DataSet
    'LOCALE_COUNTRY', // TableName
    '', // Master Field
    QryLocaleCountrySEQ.AsInteger, // Current Seq
    1 // New Seq
    ); // table_seq
end;

end.
