unit IQMS.Common.PrincipalSourceTypes;

interface

uses
  System.SysUtils,
  System.Classes,
  IQMS.Common.ResStrings,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  { TPrincipalSourceType }
  /// <summary> Global, source dataset enumerated type.
  /// </summary>
  TPrincipalSourceType = (srctNone, srctCustomer, srctVendor, srctPartner,
    srctEmployee);

  { TPrincipalDisplayRec }
  /// <summary> Simple record object containing source display information.
  /// </summary>
  TPrincipalDisplayRec = packed record
    Source: string;
    SourceID,
      ContactID: Real;
    CompanyNo,
      Company,
      Address1,
      Address2,
      City,
      State,
      Zip,
      CityStateZip,
      Country,
      CompanyTelephone,
      CompanyExt,
      CompanyTelephoneAndExt,
      CompanyFax,
      ContactFirstName,
      ContactMiddleName,
      ContactLastName,
      ContactFullName,
      ContactTelephone,
      ContactExt,
      ContactTelephoneAndExt,
      ContactCellTelephone,
      ContactFax,
      ContactMobile,
      ContactPager,
      ContactEMail,
      ContactTitle,
      WebSiteURL,
      UseUSAMask: String;
    /// <summary> Populate record values.
    /// </summary>
    procedure Update(const ASource: String; const ASourceID: Real;
      const AContactID: Real);
    /// <summary> Return a single-line display text for the source.
    /// </summary>
    function GetShortDisplay: String; overload;
    /// <summary> Return a full address information for the source.
    /// </summary>
    procedure GetLongDisplay(var ALines: TStringList);
    /// <summary> Return a full address information for the source
    /// in HTML format.
    /// </summary>
    procedure GetLongDisplayHTML(var ALines: TStringList);
  end;

  { TPrincipalSourceRecordClass }
  TPrincipalSourceRecordClass = class of TIQWebPrincipalSourceRecordBase;

  { TPrincipalSourceRecordBase }
  TIQWebPrincipalSourceRecordBase = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
    /// <summary> TPrincipalSourceType assignment for the current
    /// class (required).
    /// </summary>
    FPrincipalSourceType: TPrincipalSourceType;
  protected
    { Protected declarations }
    /// <summary> Assign the main filter values for this class.
    /// </summary>
    procedure GetMainSourceFilter(var ASourceTableName: string; var ASourceID,
      AContactID: Real); virtual; abstract;
  public
    { Public declarations }
    // constructor Create(AOwner: TComponent); reintroduce;
    /// <summary> Clear all field values.
    /// </summary>
    procedure Reset; virtual; abstract;
    /// <summary> Return a single-line display text for the source.
    /// </summary>
    function GetShortDisplay: String; virtual;
    /// <summary> Return a full address information for the source.
    /// </summary>
    procedure GetLongDisplay(var ALines: TStringList); virtual;
    /// <summary> Return a full address information for the source
    /// in HTML format.
    /// </summary>
    procedure GetLongDisplayHTML(var ALines: TStringList); virtual;
  end;

  { TCustomerSource }
  TCustomerSource = class(TIQWebPrincipalSourceRecordBase)
  private
    { Private declarations }
    FEPLANT_ID: Real;
  protected
    { Protected declarations }
    procedure GetMainSourceFilter(var ASourceTableName: string; var ASourceID,
      AContactID: Real); override;
  public
    { Public declarations }
    // Table: ARCUSTO
    ARCUSTO_ID: Real;
    ARCUSTO_CUSTNO: string;
    ARCUSTO_COMPANY: string;
    ARCUSTO_ADDR1: string;
    ARCUSTO_ADDR2: string;
    ARCUSTO_ADDR3: string;
    ARCUSTO_CITY: string;
    ARCUSTO_STATE: string;
    ARCUSTO_ZIP: string;
    ARCUSTO_COUNTRY: string;
    ARCUSTO_PHONE_NUMBER: string;
    ARCUSTO_FAX_NUMBER: string;
    ARCUSTO_EMAIL: string;
    // Table: BILL TO
    BILL_TO_ID: Real;
    BILL_TO_ATTN: string;
    BILL_TO_ADDR1: string;
    BILL_TO_ADDR2: string;
    BILL_TO_ADDR3: string;
    BILL_TO_CITY: string;
    BILL_TO_STATE: string;
    BILL_TO_ZIP: string;
    BILL_TO_COUNTRY: string;
    // Table: SHIP TO
    SHIP_TO_ID: Real;
    SHIP_TO_ATTN: string;
    SHIP_TO_ADDR1: string;
    SHIP_TO_ADDR2: string;
    SHIP_TO_ADDR3: string;
    SHIP_TO_CITY: string;
    SHIP_TO_STATE: string;
    SHIP_TO_ZIP: string;
    SHIP_TO_COUNTRY: string;
    // Ship From (Company information)
    SHIP_FROM_ID: Real;
    SHIP_FROM_ATTN: string;
    SHIP_FROM_ADDR1: string;
    SHIP_FROM_ADDR2: string;
    SHIP_FROM_ADDR3: string;
    SHIP_FROM_CITY: string;
    SHIP_FROM_STATE: string;
    SHIP_FROM_ZIP: string;
    SHIP_FROM_COUNTRY: string;
    constructor Create(AOwner: TComponent);
    constructor CreateExA(AOwner: TComponent; AArcustoID: Real);
    constructor CreateExB(AOwner: TComponent;
      AArcustoID, ABillToID, AShipToID: Real);
    constructor CreateExC(AOwner: TComponent; AArcustoID, ABillToID, AShipToID,
      AEPlantID: Real);
    /// <summary> Clear all field values.
    /// </summary>
    procedure Reset; override;
    /// <summary> Update all fields using the provided ID values.  The current
    /// EPLANT_ID from the global, system EPlant filter is used.
    /// </summary>
    procedure Update(const AArcustoID, ABillToID, AShipToID: Real);
    /// <summary> Update all fields using the provided ID values, but for
    /// the given EPLANT_ID.  The provided EPLANT_ID will be used instead
    /// of the global, system EPlant filter.
    /// </summary>
    procedure UpdateEx(const AArcustoID, ABillToID, AShipToID, AEPlantID: Real);
    /// <summary> Update the sender (SHIP_FROM) information.  The data comes
    /// from IQSYS and EPLANT, as is appropriate.
    /// </summary>
    procedure UpdateSender;
    /// <summary> Update the main customer fields using the provided
    /// ARCUSTO.ID value.
    /// </summary>
    procedure UpdateCustomer(AArcustoID: Real);
    /// <summary> Update the billing address fields using the provided
    /// BILL_TO.ID value.
    /// </summary>
    procedure UpdateBillTo(ABillToID: Real);
    /// <summary> Update the shippintg address fields using the provided
    /// SHIP_TO.ID value.
    /// </summary>
    procedure UpdateShipTo(AShipToID: Real);
    /// <summary> Copy all fields from another TCustomerSource object to
    /// this object.
    /// </summary>
    procedure CopyFrom(const ASource: TCustomerSource);
  end;

{$REGION 'Global constants'}


const
  /// <summary> Display name of a source.
  /// </summary>
  PrincipalSourceName: array [TPrincipalSourceType] of String = ('',
    IQMS.Common.ResStrings.cTXT0000470, // 'Customer';
    IQMS.Common.ResStrings.cTXT0000471, // 'Vendor';
    IQMS.Common.ResStrings.cTXT0000472, // 'Partner';
    IQMS.Common.ResStrings.cTXT0000473); // 'Employee';

  /// <summary> Table name of a source.
  /// </summary>
  PrincipalSourceTableName: array [TPrincipalSourceType] of String = ('',
    'ARCUSTO',
    'VENDOR',
    'PARTNER',
    'PR_EMP');

  /// <summary> Contact table name of a source.
  /// </summary>
  PrincipalContactTableName: array [TPrincipalSourceType] of String = ('',
    'CONTACT',
    'VENDOR_CONTACT',
    'PARTNER_CONTACTS',
    '');

{$ENDREGION 'Global constants'}

function PrincipalSourceTypeForTableName(const ATableName: string): TPrincipalSourceType;

implementation

uses
  Data.SqlExpr,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.Regional;

function PrincipalSourceTypeForTableName(const ATableName: string): TPrincipalSourceType;
var
  o: TPrincipalSourceType;
begin
  for o := Low(TPrincipalSourceType) to High(TPrincipalSourceType) do
    if CompareText(ATableName, PrincipalSourceTableName[o]) = 0 then
      begin
        Result := o;
        Break;
      end;
end;

{$REGION 'TPrincipalSourceRecordBase'}

{ TPrincipalSourceRecordBase }

procedure TIQWebPrincipalSourceRecordBase.GetLongDisplay(var ALines: TStringList);
var
  ASource: string;
  ASourceID, AContactID: Real;
  o: TPrincipalDisplayRec;
begin
  if Assigned(ALines) then
    begin
      GetMainSourceFilter(ASource, ASourceID, AContactID);
      o.Update(ASource, ASourceID, AContactID);
      o.GetLongDisplay(ALines);
    end;
end;

procedure TIQWebPrincipalSourceRecordBase.GetLongDisplayHTML(
  var ALines: TStringList);
var
  ASource: string;
  ASourceID, AContactID: Real;
  o: TPrincipalDisplayRec;
begin
  if Assigned(ALines) then
    begin
      GetMainSourceFilter(ASource, ASourceID, AContactID);
      o.Update(ASource, ASourceID, AContactID);
      o.GetLongDisplayHTML(ALines);
    end;
end;

function TIQWebPrincipalSourceRecordBase.GetShortDisplay: String;
var
  ASource: string;
  ASourceID, AContactID: Real;
  o: TPrincipalDisplayRec;
begin
  GetMainSourceFilter(ASource, ASourceID, AContactID);
  o.Update(ASource, ASourceID, AContactID);
  Result := GetShortDisplay;
end;

{$ENDREGION 'TPrincipalSourceRecordBase'}

{$REGION 'TCustomerSource'}

{ TCustomerSource }

constructor TCustomerSource.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Reset;
end;

constructor TCustomerSource.CreateExA(AOwner: TComponent; AArcustoID: Real);
begin
  Create(AOwner); // calls main constructor
  UpdateCustomer(AArcustoID);
end;

constructor TCustomerSource.CreateExB(AOwner: TComponent; AArcustoID, ABillToID,
  AShipToID: Real);
begin
  Create(AOwner); // calls main constructor
  Update(AArcustoID, ABillToID, AShipToID);
end;

constructor TCustomerSource.CreateExC(AOwner: TComponent; AArcustoID, ABillToID,
  AShipToID, AEPlantID: Real);
begin
  Create(AOwner); // calls main constructor
  UpdateEx(AArcustoID, ABillToID, AShipToID, AEPlantID);
end;

procedure TCustomerSource.Reset;
begin
  // ARCUSTO
  ARCUSTO_ID := 0;
  ARCUSTO_CUSTNO := '';
  ARCUSTO_COMPANY := '';
  ARCUSTO_ADDR1 := '';
  ARCUSTO_ADDR2 := '';
  ARCUSTO_ADDR3 := '';
  ARCUSTO_CITY := '';
  ARCUSTO_STATE := '';
  ARCUSTO_ZIP := '';
  ARCUSTO_COUNTRY := '';
  ARCUSTO_PHONE_NUMBER := '';
  ARCUSTO_FAX_NUMBER := '';
  ARCUSTO_EMAIL := '';
  // BILL TO
  BILL_TO_ID := 0;
  BILL_TO_ATTN := '';
  BILL_TO_ADDR1 := '';
  BILL_TO_ADDR2 := '';
  BILL_TO_ADDR3 := '';
  BILL_TO_CITY := '';
  BILL_TO_STATE := '';
  BILL_TO_ZIP := '';
  BILL_TO_COUNTRY := '';
  // SHIP TO
  SHIP_TO_ID := 0;
  SHIP_TO_ATTN := '';
  SHIP_TO_ADDR1 := '';
  SHIP_TO_ADDR2 := '';
  SHIP_TO_ADDR3 := '';
  SHIP_TO_CITY := '';
  SHIP_TO_STATE := '';
  SHIP_TO_ZIP := '';
  SHIP_TO_COUNTRY := '';
  // SHIP FROM
  SHIP_FROM_ID := 0;
  SHIP_FROM_ATTN := '';
  SHIP_FROM_ADDR1 := '';
  SHIP_FROM_ADDR2 := '';
  SHIP_FROM_ADDR3 := '';
  SHIP_FROM_CITY := '';
  SHIP_FROM_STATE := '';
  SHIP_FROM_ZIP := '';
  SHIP_FROM_COUNTRY := '';
end;

procedure TCustomerSource.GetMainSourceFilter(var ASourceTableName: string;
  var ASourceID, AContactID: Real);
begin
  // Return table/id values for the main filter.
  ASourceTableName := 'ARCUSTO';
  ASourceID := ARCUSTO_ID;
  AContactID := 0;
end;

procedure TCustomerSource.Update(const AArcustoID, ABillToID, AShipToID: Real);
begin
  FEPLANT_ID := SecurityManager.EPlant_ID_AsFloat;
  UpdateSender;
  UpdateCustomer(AArcustoID);
  UpdateBillTo(ABillToID);
  UpdateShipTo(AShipToID);
end;

procedure TCustomerSource.UpdateEx(const AArcustoID, ABillToID, AShipToID,
  AEPlantID: Real);
begin
  FEPLANT_ID := AEPlantID;
  UpdateSender;
  UpdateCustomer(AArcustoID);
  UpdateBillTo(ABillToID);
  UpdateShipTo(AShipToID);
end;

procedure TCustomerSource.UpdateSender;
begin
  if FEPLANT_ID > 0 then
    with TFDQuery.Create(nil) do
      try
        // get the data
        ConnectionName := 'IQFD';
        SQL.Add(Format('SELECT a.id, a.company, a.address1, ' +
          'a.address2, a.address3, a.city, a.state, a.zip, a.country ' +
          'FROM eplant a WHERE a.id = %.0f',
          [SecurityManager.EPlant_ID_AsFloat]));
        Open;
        SHIP_FROM_ID := FieldByName('ID').AsFloat;
        SHIP_FROM_ATTN := Trim(FieldByName('COMPANY').AsString);
        SHIP_FROM_ADDR1 :=
          Trim(FieldByName('ADDRESS1').AsString);
        SHIP_FROM_ADDR2 :=
          Trim(FieldByName('ADDRESS2').AsString);
        SHIP_FROM_ADDR3 :=
          Trim(FieldByName('ADDRESS3').AsString);
        SHIP_FROM_CITY := Trim(FieldByName('CITY').AsString);
        SHIP_FROM_STATE := Trim(FieldByName('STATE').AsString);
        SHIP_FROM_ZIP :=
          UpperCase(IQMS.Common.StringUtils.AlphaNumeric(FieldByName('ZIP').AsString));
        SHIP_FROM_COUNTRY :=
          Trim(FieldByName('COUNTRY').AsString);
      finally
        Free;
      end
  else
    with TFDQuery.Create(nil) do
      try
        // get the data
        ConnectionName := 'IQFD';
        SQL.Add('SELECT a.id, a.company, a.address1, ' +
          'a.address2, a.address3, a.city, a.state, a.zip, a.country ' +
          'FROM iqsys a WHERE ROWNUM < 2');
        Open;
        SHIP_FROM_ID := FieldByName('ID').AsFloat;
        SHIP_FROM_ATTN := Trim(FieldByName('COMPANY').AsString);
        SHIP_FROM_ADDR1 := Trim(FieldByName('ADDRESS1').AsString);
        SHIP_FROM_ADDR2 := Trim(FieldByName('ADDRESS2').AsString);
        SHIP_FROM_ADDR3 := Trim(FieldByName('ADDRESS3').AsString);
        SHIP_FROM_CITY := Trim(FieldByName('CITY').AsString);
        SHIP_FROM_STATE := Trim(FieldByName('STATE').AsString);
        SHIP_FROM_ZIP :=
          UpperCase(IQMS.Common.StringUtils.AlphaNumeric(FieldByName('ZIP').AsString));
        SHIP_FROM_COUNTRY := Trim(FieldByName('COUNTRY').AsString);
      finally
        Free;
      end;
end;

procedure TCustomerSource.UpdateCustomer(AArcustoID: Real);
begin
  // This method fills our record object (CustomerInfoRec) with the selected
  // customer data
  with TFDQuery.Create(nil) do
    try
      // get the data
        ConnectionName := 'IQFD';
      SQL.Add(Format('SELECT id, custno, company, addr1, addr2, addr3, city, ' +
        'state, zip, country, phone_number, fax_number, prime_contact_email ' +
        'FROM arcusto WHERE id = %.0f', [AArcustoID]));
      Open;
      // fill the record (declared under Private)
      ARCUSTO_ID := FieldByName('ID').AsFloat;
      ARCUSTO_CUSTNO := Trim(FieldByName('CUSTNO').AsString);
      ARCUSTO_COMPANY := Trim(FieldByName('COMPANY').AsString);
      ARCUSTO_ADDR1 := Trim(FieldByName('ADDR1').AsString);
      ARCUSTO_ADDR2 := Trim(FieldByName('ADDR2').AsString);
      ARCUSTO_ADDR3 := Trim(FieldByName('ADDR3').AsString);
      ARCUSTO_CITY := Trim(FieldByName('CITY').AsString);
      ARCUSTO_STATE := Trim(FieldByName('STATE').AsString);
      ARCUSTO_ZIP := Trim(FieldByName('ZIP').AsString);
      ARCUSTO_COUNTRY := IQMS.Common.Regional.GetValidCountryName
        (Trim(FieldByName('COUNTRY').AsString));
      ARCUSTO_PHONE_NUMBER := Trim(FieldByName('PHONE_NUMBER').AsString);
      ARCUSTO_FAX_NUMBER := Trim(FieldByName('FAX_NUMBER').AsString);
      ARCUSTO_EMAIL := Trim(FieldByName('PRIME_CONTACT_EMAIL').AsString);
    finally
      Free; // free TFDQuery
    end;
end;

procedure TCustomerSource.UpdateBillTo(ABillToID: Real);
begin
  // This method fills our record object (CustomerInfoRec) with the selected
  // billing data
  if Trunc(ABillToID) > 0 then
    with TFDQuery.Create(nil) do
      try
        // get the data
        ConnectionName := 'IQFD';
        SQL.Add(Format('SELECT id, attn, addr1, addr2, addr3, city, state, ' +
          'zip, country FROM bill_to WHERE id = %.0f', [ABillToID]));
        Open;
        // fill the record (declared under Private)
        BILL_TO_ID := FieldByName('ID').AsFloat;
        BILL_TO_ATTN := Trim(FieldByName('ATTN').AsString);
        BILL_TO_ADDR1 := Trim(FieldByName('ADDR1').AsString);
        BILL_TO_ADDR2 := Trim(FieldByName('ADDR2').AsString);
        BILL_TO_ADDR3 := Trim(FieldByName('ADDR3').AsString);
        BILL_TO_CITY := Trim(FieldByName('CITY').AsString);
        BILL_TO_STATE := Trim(FieldByName('STATE').AsString);
        BILL_TO_ZIP :=
          UpperCase(IQMS.Common.StringUtils.AlphaNumeric(FieldByName('ZIP').AsString));
        BILL_TO_COUNTRY := IQMS.Common.Regional.GetValidCountryName
          (Trim(FieldByName('COUNTRY').AsString));
      finally
        Free; // free TFDQuery
      end;
end;

procedure TCustomerSource.UpdateShipTo(AShipToID: Real);
begin
  // This method fills our record object (CustomerInfoRec) with the selected
  // shipping data
  with TFDQuery.Create(nil) do
    try
      // get the data
        ConnectionName := 'IQFD';
      SQL.Add(Format('SELECT id, attn, addr1, addr2, addr3, city, state, ' +
        'zip, country FROM ship_to WHERE id = %.0f', [AShipToID]));
      Open;
      // fill the record (declared under Private)
      SHIP_TO_ID := FieldByName('ID').AsFloat;
      SHIP_TO_ATTN := Trim(FieldByName('ATTN').AsString);
      SHIP_TO_ADDR1 := Trim(FieldByName('ADDR1').AsString);
      SHIP_TO_ADDR2 := Trim(FieldByName('ADDR2').AsString);
      SHIP_TO_ADDR3 := Trim(FieldByName('ADDR3').AsString);
      SHIP_TO_CITY := Trim(FieldByName('CITY').AsString);
      SHIP_TO_STATE := Trim(FieldByName('STATE').AsString);
      SHIP_TO_ZIP := UpperCase(IQMS.Common.StringUtils.AlphaNumeric(FieldByName('ZIP')
        .AsString));
      SHIP_TO_COUNTRY := IQMS.Common.Regional.GetValidCountryName
        (Trim(FieldByName('COUNTRY').AsString));
    finally
      Free; // free TFDQuery
    end;
end;

procedure TCustomerSource.CopyFrom(const ASource: TCustomerSource);
begin
  // ARCUSTO
  ARCUSTO_ID := ASource.ARCUSTO_ID;
  ARCUSTO_CUSTNO := ASource.ARCUSTO_CUSTNO;
  ARCUSTO_COMPANY := ASource.ARCUSTO_COMPANY;
  ARCUSTO_ADDR1 := ASource.ARCUSTO_ADDR1;
  ARCUSTO_ADDR2 := ASource.ARCUSTO_ADDR2;
  ARCUSTO_ADDR3 := ASource.ARCUSTO_ADDR3;
  ARCUSTO_CITY := ASource.ARCUSTO_CITY;
  ARCUSTO_STATE := ASource.ARCUSTO_STATE;
  ARCUSTO_ZIP := ASource.ARCUSTO_ZIP;
  ARCUSTO_COUNTRY := ASource.ARCUSTO_COUNTRY;
  ARCUSTO_PHONE_NUMBER := ASource.ARCUSTO_PHONE_NUMBER;
  ARCUSTO_FAX_NUMBER := ASource.ARCUSTO_FAX_NUMBER;
  ARCUSTO_EMAIL := ASource.ARCUSTO_EMAIL;
  // BILL TO
  BILL_TO_ID := ASource.BILL_TO_ID;
  BILL_TO_ATTN := ASource.BILL_TO_ATTN;
  BILL_TO_ADDR1 := ASource.BILL_TO_ADDR1;
  BILL_TO_ADDR2 := ASource.BILL_TO_ADDR2;
  BILL_TO_ADDR3 := ASource.BILL_TO_ADDR3;
  BILL_TO_CITY := ASource.BILL_TO_CITY;
  BILL_TO_STATE := ASource.BILL_TO_STATE;
  BILL_TO_ZIP := ASource.BILL_TO_ZIP;
  BILL_TO_COUNTRY := ASource.BILL_TO_COUNTRY;
  // SHIP TO
  SHIP_TO_ID := ASource.SHIP_TO_ID;
  SHIP_TO_ATTN := ASource.SHIP_TO_ATTN;
  SHIP_TO_ADDR1 := ASource.SHIP_TO_ADDR1;
  SHIP_TO_ADDR2 := ASource.SHIP_TO_ADDR2;
  SHIP_TO_ADDR3 := ASource.SHIP_TO_ADDR3;
  SHIP_TO_CITY := ASource.SHIP_TO_CITY;
  SHIP_TO_STATE := ASource.SHIP_TO_STATE;
  SHIP_TO_ZIP := ASource.SHIP_TO_ZIP;
  SHIP_TO_COUNTRY := ASource.SHIP_TO_COUNTRY;
  // SHIP FROM
  SHIP_FROM_ID := ASource.SHIP_FROM_ID;
  SHIP_FROM_ATTN := ASource.SHIP_FROM_ATTN;
  SHIP_FROM_ADDR1 := ASource.SHIP_FROM_ADDR1;
  SHIP_FROM_ADDR2 := ASource.SHIP_FROM_ADDR2;
  SHIP_FROM_ADDR3 := ASource.SHIP_FROM_ADDR3;
  SHIP_FROM_CITY := ASource.SHIP_FROM_CITY;
  SHIP_FROM_STATE := ASource.SHIP_FROM_STATE;
  SHIP_FROM_ZIP := ASource.SHIP_FROM_ZIP;
  SHIP_FROM_COUNTRY := ASource.SHIP_FROM_COUNTRY;
end;

{$ENDREGION 'TCustomerSource'}

{$REGION 'TPrincipalDisplayRec'}

{ TPrincipalDisplayRec }

procedure TPrincipalDisplayRec.GetLongDisplay(var ALines: TStringList);
  procedure _AddLine(const AValue: String);
  begin
    if AValue > '' then
      ALines.Add(AValue)
  end;
  procedure _AddLineWithCaption(const ACaption, AValue: String);
  begin
    if (AValue > '') and (ACaption > '') then
      ALines.Add(Format('%s  %s', [Trim(ACaption), AValue]));
  end;
  procedure _AddMailToWithCaption(const ACaption, AValue: String);
  begin
    if (AValue > '') and (ACaption > '') then
      ALines.Add(Format('%s  %s', [Trim(ACaption), 'mailto:' + AValue]));
  end;

begin
  if not Assigned(ALines) or (Source = '') or (SourceID = 0) then
    Exit;
  if (ContactID > 0) or (CompareText(Source, 'PR_EMP') = 0) then
    _AddLine(ContactFullName);

  _AddLine(Company);
  _AddLine(Address1);
  _AddLine(Address2);
  _AddLine(CityStateZip);
  _AddLine(Country);

  // IQMS.Common.ResStrings. cTXT0000458 = 'Company Telephone:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000458, CompanyTelephoneAndExt);
  // IQMS.Common.ResStrings. cTXT0000460 = 'Company Fax:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000460, CompanyFax);
  // IQMS.Common.ResStrings. cTXT0000462 = 'Contact Telephone:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000462, ContactTelephoneAndExt);
  // IQMS.Common.ResStrings. cTXT0000465 = 'Contact Fax:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000465, ContactFax);
  // IQMS.Common.ResStrings. cTXT0000461 = 'Contact Cell Telephone:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000461, ContactMobile);
  // IQMS.Common.ResStrings. cTXT0000468 = 'Contact Pager:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000468, ContactPager);
  // IQMS.Common.ResStrings. cTXT0000467 = 'Contact Title:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000467, ContactTitle);
  // IQMS.Common.ResStrings. cTXT0000466 = 'Contact Email:';
  _AddMailToWithCaption(IQMS.Common.ResStrings.cTXT0000466, ContactEMail);
  // IQMS.Common.ResStrings.cTXT0000457 = 'Web Site URL:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000457, WebSiteURL);
end;

procedure TPrincipalDisplayRec.GetLongDisplayHTML(var ALines: TStringList);

  procedure _AddLineNormal(AText: String);
  begin
    if AText > '' then
      ALines.Add(Format('%s<br>', [AText]));
  end;
  procedure _AddLineBold(AText: String);
  begin
    if AText > '' then
      ALines.Add(Format('<b>%s</b><br>', [AText]));
  end;
  procedure _AddLineWithCaption(ACaption, AText: String);
  begin
    if (ACaption > '') and (AText > '') then
      ALines.Add(Format('<b>%s  </b>%s<br>', [ACaption, AText]));
  end;
  procedure _AddMailToWithCaption(ACaption, AEmail: String);
  begin
    if (ACaption > '') and (AEmail > '') then
      ALines.Add(Format('<b>%s  </b><a href="mailto:%s">%s</a><br>',
        [ACaption, AEmail, AEmail]));
  end;
  procedure _AddURL(ACaption, AURL: String);
  begin
    if (ACaption > '') and (AURL > '') then
      ALines.Add(Format('<b>%s  </b><a href="%s">%s</a><br>',
        [ACaption, AURL, AURL]));
  end;

var
  AFax, ACityStateZip: String;
  AStart, AEnd: Integer;
  AID: Real;
  AType: Integer;
begin
  if ALines = NIL then
    Exit;

  if not Assigned(ALines) or (Source = '') or (SourceID = 0) then
    Exit;

  // begin paragraph
  ALines.Add('<p class=MsoBodyText>');

  if (ContactID > 0) or (CompareText(Source, 'PR_EMP') = 0) then
    _AddLineBold(ContactFullName)
  else
    _AddLineBold(Company);
  _AddLineNormal(Address1);
  _AddLineNormal(Address2);
  _AddLineNormal(CityStateZip);
  _AddLineNormal(Country);

  // IQMS.Common.ResStrings. cTXT0000458 = 'Company Telephone:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000458, CompanyTelephoneAndExt);
  // IQMS.Common.ResStrings. cTXT0000460 = 'Company Fax:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000460, CompanyFax);
  // IQMS.Common.ResStrings. cTXT0000462 = 'Contact Telephone:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000462, ContactTelephoneAndExt);
  // IQMS.Common.ResStrings. cTXT0000465 = 'Contact Fax:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000465, ContactFax);
  // IQMS.Common.ResStrings. cTXT0000461 = 'Contact Cell Telephone:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000461, ContactMobile);
  // IQMS.Common.ResStrings. cTXT0000468 = 'Contact Pager:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000468, ContactPager);
  // IQMS.Common.ResStrings. cTXT0000467 = 'Contact Title:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000467, ContactTitle);
  // IQMS.Common.ResStrings. cTXT0000466 = 'Contact Email:';
  _AddMailToWithCaption(IQMS.Common.ResStrings.cTXT0000466, ContactEMail);
  // IQMS.Common.ResStrings.cTXT0000457 = 'Web Site URL:';
  _AddLineWithCaption(IQMS.Common.ResStrings.cTXT0000457, WebSiteURL);

  // end paragraph
  ALines.Add('</p>');

end;

function TPrincipalDisplayRec.GetShortDisplay: String;
var
  AID: Real;
  ATable: String;
begin
  Result := '';
  if (Trim(Source) = '') or (SourceID = 0) then
    Exit;

  if ContactID > 0 then
    begin
      AID := ContactID;
      if Source = 'ARCUSTO' then
        ATable := 'CONTACT'
      else if Source = 'VENDOR' then
        ATable := 'VENDOR_CONTACT'
      else if Source = 'PARTNER' then
        ATable := 'PARTNER_CONTACTS'
      else
        Exit;

      Result := SelectValueFmtAsString(
        'SELECT TrimLeft( RTRIM( first_name ) || '' '' || TrimLeft( RTRIM( last_name ))) '
        +
        'FROM %s WHERE id = %.0f',
        [ATable, AID]);
    end
  else
    begin
      AID := SourceID;
      ATable := Source;
      if CompareText(Source, 'PR_EMP') = 0 then
        Result := SelectValueFmtAsString
          ('SELECT TrimLeft( RTRIM( first_name ) || '' '' || TrimLeft( RTRIM( last_name ))) '
          +
          'FROM pr_emp WHERE id = %.0f',
          [AID])
      else
        Result := SelectValueFmtAsString('SELECT company FROM %s WHERE id = %.0f',
          [ATable, AID]);
    end;
end;

procedure TPrincipalDisplayRec.Update(const ASource: String; const ASourceID,
  AContactID: Real);
var
  b: Boolean;
begin
  Self.Source := ASource;
  Self.SourceID := ASourceID;
  Self.ContactID := AContactID;

  with TFDStoredProc.Create(NIL) do
    try
      ConnectionName := 'IQFD';
      StoredProcName := 'IQMS.IQCRM.GET_PRINCIPLE_SOURCE_VALUES';
      Prepare;
      { PROCEDURE get_principle_source_values(
        p_source               IN     VARCHAR2,
        p_source_id            IN     NUMBER,
        p_contact_id           IN     NUMBER,
        p_companyno               OUT VARCHAR2,
        p_company                 OUT VARCHAR2,
        p_contact_first_name      OUT VARCHAR2,
        p_contact_nickname        OUT VARCHAR2,
        p_contact_middle_name     OUT VARCHAR2,
        p_contact_last_name       OUT VARCHAR2,
        p_contact_full_name       OUT VARCHAR2,
        p_contact_title           OUT VARCHAR2,
        p_addr1                   OUT VARCHAR2,
        p_addr2                   OUT VARCHAR2,
        p_addr3                   OUT VARCHAR2,
        p_city                    OUT VARCHAR2,
        p_state                   OUT VARCHAR2,
        p_zip                     OUT VARCHAR2,
        p_country                 OUT VARCHAR2,
        p_company_phone           OUT VARCHAR2,
        p_company_ext             OUT VARCHAR2,
        p_company_fax             OUT VARCHAR2,
        p_contact_phone           OUT VARCHAR2,
        p_contact_ext             OUT VARCHAR2,
        p_contact_fax             OUT VARCHAR2,
        p_contact_mobile          OUT VARCHAR2,
        p_email                   OUT VARCHAR2,
        p_web_site_url            OUT VARCHAR2,
        p_use_usa_mask            OUT VARCHAR2,
        p_crm_prospect            OUT VARCHAR2);
      }
      ParamByName('p_source').Value := ASource;
      ParamByName('p_source_id').Value := ASourceID;
      ParamByName('p_contact_id').Value := AContactID;
      Execute;

      Self.CompanyNo := ParamByName('p_companyno').AsString;
      Self.Company := ParamByName('p_company').AsString;
      Self.ContactFirstName := ParamByName('p_contact_first_name').AsString;
      Self.ContactMiddleName := ParamByName('p_contact_middle_name').AsString;
      Self.ContactLastName := ParamByName('p_contact_last_name').AsString;
      Self.ContactFullName := ParamByName('p_contact_full_name').AsString;
      Self.ContactTitle := ParamByName('p_contact_title').AsString;
      Self.Address1 := ParamByName('p_addr1').AsString;
      Self.Address2 := ParamByName('p_addr2').AsString;
      Self.City := ParamByName('p_city').AsString;
      Self.State := ParamByName('p_state').AsString;
      Self.Zip := ParamByName('p_zip').AsString;
      Self.Country := ParamByName('p_country').AsString;
      Self.CompanyTelephone := ParamByName('p_company_phone').AsString;
      Self.CompanyExt := ParamByName('p_company_ext').AsString;
      Self.CompanyFax := ParamByName('p_company_fax').AsString;
      Self.ContactTelephone := ParamByName('p_contact_phone').AsString;
      Self.ContactExt := ParamByName('p_contact_ext').AsString;
      Self.ContactFax := ParamByName('p_contact_fax').AsString;
      Self.ContactMobile := ParamByName('p_contact_mobile').AsString;
      Self.ContactEMail := ParamByName('p_email').AsString;
      Self.WebSiteURL := ParamByName('p_web_site_url').AsString;
      Self.UseUSAMask := ParamByName('p_use_usa_mask').AsString;

      // 06/01/2009 Format the telephone mask.  Requested by Nancy.
      b := UseUSAMask = 'Y';
      Self.CompanyTelephone := FormatTelephoneText(CompanyTelephone, b);
      Self.ContactTelephone := FormatTelephoneText(ContactTelephone, b);
      Self.CompanyFax := FormatTelephoneText(CompanyFax, b);
      Self.ContactFax := FormatTelephoneText(ContactFax, b);
      Self.ContactMobile := FormatTelephoneText(ContactMobile, b);
    finally
      Free;
    end;

  // Additional Formatting
  // Ensure telephone formatting
  Self.CompanyTelephone := FormatTelephoneText(CompanyTelephone,
    UseUSAMask = 'Y'); // iqlib
  Self.ContactTelephone := FormatTelephoneText(ContactTelephone,
    UseUSAMask = 'Y'); // iqlib
  // concatenated values
  Self.CityStateZip := ConcatCityStateZip(City, State, Zip); // see above
  Self.CompanyTelephoneAndExt := IQMS.Common.Numbers.sIIf(CompanyExt > '',
    // IQMS.Common.ResStrings.cTXT0000469 = '%s, Ext. %s';

    Format(IQMS.Common.ResStrings.cTXT0000469, [CompanyTelephone, CompanyExt]),
    CompanyTelephone);
  Self.ContactTelephoneAndExt := IQMS.Common.Numbers.sIIf(ContactExt > '',
    Format(IQMS.Common.ResStrings.cTXT0000469, [ContactTelephone, ContactExt]),
    ContactTelephone);
end;

{$ENDREGION 'TPrincipalDisplayRec'}

end.
