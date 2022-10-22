unit _CountryLookupDataModule;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  Vcl.wwdblook,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox;

type
  TCountryLookupDataModule = class(TDataModule)
    SrcLocaleCountryLookup: TDataSource;
    QryLocaleCountryLookup: TFDQuery;
    QryLocaleCountryLookupID: TBCDField;
    QryLocaleCountryLookupNAME: TWideStringField;
    QryLocaleCountryLookupPK_HIDE: TStringField;
    SrcLocaleStateLookup: TDataSource;
    QryLocaleStateLookup: TFDQuery;
    QryLocaleStateLookupNAME: TWideStringField;
    QryLocaleStateLookupID: TBCDField;
    QryLocaleStateLookupLOCALE_COUNTRY_ID: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure QryLocaleStateLookupBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FLocaleCountryIDFilter: Int64;
  public
    { Public declarations }
    /// <summary> Ensure the lookup datasets are active.</summary>
    /// <remarks>
    /// Calling this method directly is uncessary, since datasets are
    //  activated when the datamodule is created.
    /// </remarks>
    procedure OpenLookupDataSets;

    /// <summary> Syncronize the lookup datasets in the datamodule so that
    /// the lookup lists are correct.
    /// </summary>
    procedure SyncLookupDataSets(const ACountryID, AStateID: Int64); overload;
    procedure SyncLookupDataSets(
      const ACountryIDField: TField;
      const AStateIDField: TField;
      const ACountryDBLookupCombo: TUniDBLookupComboBox;
      const AStateDBLookupCombo: TUniDBLookupComboBox
      ); overload;

    /// <summary> Call the following in the TwwDBLookupCombo BeforeDropDown event. </summary>
    /// <remarks> Calling this is not always necessary, but is provided if controls are
    /// embedded in a TwwDBGrid.
    /// </remarks>
    procedure DoCountryComboBoxBeforeDropDown(Sender: TObject);

    /// <summary> Call the following in the TwwDBLookupCombo OnCloseUp event. </summary>
    /// <remarks> Calling this is not always necessary, but is provided if controls are
    /// embedded in a TwwDBGrid.
    /// </remarks>
    procedure DoCountryComboBoxOnCloseUp(
      Sender: TObject;
      LookupTable,
      FillTable: TDataSet;
      const Modified: Boolean;
      const ACountryIDFieldName: string = 'COUNTRY_ID';
      const ACountryDisplayFieldName: string = 'COUNTRY';
      const AStateIDFieldName: string = 'STATE_ID'
      );

    /// <summary> Call the following in the TwwDBLookupCombo OnCloseUp event. </summary>
    /// <remarks> Calling this is not always necessary, but is provided if controls are
    /// embedded in a TwwDBGrid.
    /// </remarks>
    procedure DoStateComboBoxOnCloseUp(
      Sender: TObject;
      LookupTable,
      FillTable: TDataSet;
      const Modified: Boolean;
      const AStateIDFieldName: string = 'STATE_ID';
      const AStateDisplayFieldName: string = 'STATE'
      );

    function GetCountryName(const ALocaleCountryID: Int64): string;
    function GetSubdivisionName(const ALocaleSubdivisionID: Int64): string;
  end;

var
  CountryLookupDataModule: TCountryLookupDataModule;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Regional.ControlUtils,
  IQMS.Common.Controls;

{ TCountryLookupDataModule }

procedure TCountryLookupDataModule.DataModuleCreate(Sender: TObject);
begin
  OpenLookupDataSets;
end;

procedure TCountryLookupDataModule.OpenLookupDataSets;
begin
  QryLocaleCountryLookup.Close;
  QryLocaleCountryLookup.Open;
  QryLocaleStateLookup.Close;
  QryLocaleStateLookup.Open;
end;

procedure TCountryLookupDataModule.QryLocaleStateLookupBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FLocaleCountryIDFilter);
end;

procedure TCountryLookupDataModule.SyncLookupDataSets(
  const ACountryID: Int64;
  const AStateID: Int64);
begin
  // Assign the private field value for filtering
  FLocaleCountryIDFilter := ACountryID;

  // Locate the country ID in the lookup dataset
  if not QryLocaleCountryLookup.Active then
    QryLocaleCountryLookup.Open;
  QryLocaleCountryLookup.Locate('ID', ACountryID, []);

  // Locate the state ID in the lookup dataset
  QryLocaleStateLookup.Close;
  QryLocaleStateLookup.Open;
  if AStateID > 0 then
    QryLocaleStateLookup.Locate('ID', AStateID, []);
end;

procedure TCountryLookupDataModule.SyncLookupDataSets(
  const ACountryIDField: TField;
  const AStateIDField: TField;
  const ACountryDBLookupCombo: TUniDBLookupComboBox;
  const AStateDBLookupCombo: TUniDBLookupComboBox);
var
  ACountryID, AStateID: Int64;
begin
  ACountryID := 0;
  AStateID := 0;
  if Assigned(ACountryIDField) then
    ACountryID := ACountryIDField.AsLargeInt;
  if Assigned(AStateIDField) then
    AStateID := AStateIDField.AsLargeInt;

  SyncLookupDataSets(ACountryID, AStateID);

  // Ensure combo box display value is correct
  if Assigned(ACountryDBLookupCombo) and
    Assigned(ACountryIDField) then
  begin
    { TODO -oBantuK -cWEB_CONVERT :
        Undeclared identifier: 'LookupValue'
        Undeclared identifier: 'DisplayValue'
    ACountryDBLookupCombo.LookupValue := ACountryIDField.AsString;
    ACountryDBLookupCombo.DisplayValue := GetCountryName(ACountryID);}
  end;

  if Assigned(AStateDBLookupCombo) and
    Assigned(AStateIDField) then
  begin
    { TODO -oBantuK -cWEB_CONVERT :
        Undeclared identifier: 'LookupValue'
    AStateDBLookupCombo.LookupValue := AStateIDField.AsString;
    AStateDBLookupCombo.DisplayValue := GetSubdivisionName(AStateID);}
  end;
end;

procedure TCountryLookupDataModule.DoCountryComboBoxBeforeDropDown(Sender: TObject);
begin
  // Exclude the "Inactive" records
  if Sender is TUniDBLookupComboBox then
    IQMS.Regional.ControlUtils.FilterInactive(Sender as TUniDBLookupComboBox, True);
end;

procedure TCountryLookupDataModule.DoCountryComboBoxOnCloseUp(
  Sender: TObject;
  LookupTable,
  FillTable: TDataSet;
  const Modified: Boolean;
  const ACountryIDFieldName: string;
  const ACountryDisplayFieldName: string;
  const AStateIDFieldName: string
  );
begin
  // Include the "Inactive" records again
  IQMS.Regional.ControlUtils.FilterInactive(Sender as TUniDBLookupComboBox, False);

  // Ensure the COUNTRY_ID is applied to the dataset so that
  // filtering by STATE can occur.
  if not string.IsNullOrWhiteSpace(ACountryIDFieldName) and
   (FillTable.State in [dsEdit, dsInsert]) then
    FillTable.FieldByName(ACountryIDFieldName).Value :=
      LookupTable.FieldByName('ID').Value;

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'UpdateDBLookupComboDisplay' from IQCtrl
  // Ensure the combo box displays properly
  if not string.IsNullOrWhiteSpace(ACountryIDFieldName) and
    not string.IsNullOrWhiteSpace(ACountryDisplayFieldName) then
    UpdateDBLookupComboDisplay(
      Sender as TUniDBLookupComboBox,
      LookupTable,
      FillTable,
      Modified,
      ACountryIDFieldName,
      'ID',
      ACountryDisplayFieldName,
      'NAME');}

  // Syncronize the lookup datasets
  if not string.IsNullOrWhiteSpace(ACountryIDFieldName) and
    not string.IsNullOrWhiteSpace(AStateIDFieldName) then
    SyncLookupDataSets(
      FillTable.FieldByName(ACountryIDFieldName).AsLargeInt,
      FillTable.FieldByName(AStateIDFieldName).AsLargeInt);

end;

procedure TCountryLookupDataModule.DoStateComboBoxOnCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; const Modified: Boolean; const AStateIDFieldName,
  AStateDisplayFieldName: string);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'UpdateDBLookupComboDisplay' from IQCtrl
  UpdateDBLookupComboDisplay(
    Sender as TUniDBLookupComboBox,
    LookupTable,
    FillTable,
    Modified,
    AStateIDFieldName,
    'ID',
    AStateDisplayFieldName,
    'NAME');}
end;

function TCountryLookupDataModule.GetCountryName(const ALocaleCountryID: Int64): string;
begin
  Result := SelectValueFmtAsString(
    'SELECT regional.get_locale_country(%d) FROM DUAL',
    [ALocaleCountryID]);
end;

function TCountryLookupDataModule.GetSubdivisionName(const ALocaleSubdivisionID: Int64): string;
begin
  Result := SelectValueFmtAsString(
    'SELECT regional.get_locale_subdivision(%d) FROM DUAL',
    [ALocaleSubdivisionID]);
end;

end.
