unit shipman_fedex;

{NOTE: This unit is in development.  It connects to shipper site and obtains
       or processes data.}

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  MaskUtils,
  shipman_shipper,
  IQMS.Common.DotNetCOMInterOp,
  shipman_common,
  shipman_dc,
  MainModule;

  function FedEx_Packaging_Description_From_Code(const ACode: String): String;
  function FedEx_Service_Description_From_Code(const ACode: String): String;

  // Checks the date for "future day ship" and if it is invalid, raises an exception
  procedure EvalFutureDayShip(const AFutureDate: TDateTime);
  function PackageDateActive(AShipDate: TDateTime): Boolean;

type
   TFedExType = (ftFedExGround, ftFedExExpress, ftFedExSmartPost);
   TFedExBillingOption =
   (fboSender,             // Sender
    fboRecipient,          // Recipient
    fboThirdParty,         // Third-Party
    fboCollect);           // Collect

   TFedExManager = class(TShipperManager)
   private
    { Private declarations }
    FFedExType: TFedExType;
    function ValidateAccount(const AAccountNumber, AMeterNumber: String; ASilent: Boolean = FALSE): Boolean;
    procedure ValidatePackageAccount;
    function GetCarrierCode: String;
    // is the package still active (based on Ship Date)
   protected
    { Protected declarations }
    FAccountNumber,
    FMeterNumber,
    FUserKey,
    FUserPass: String;
    FLogID: Real;
    FOneRate: Boolean;
    function GetCarrierType: TCarrierType; override;
    procedure InitValues; override;
    procedure GetAccountData; // fills account vars above
    procedure ProcessSoftError(AMsg: String);
    function Service_Description_From_Code(ACode: String): String; override;
    function URL: String; override;
    function GetFedExType: TFedExType; virtual; abstract;

    procedure ParseAccountStr(const AAccount: String; var AAccountNumber,
     AMeterNumber, AUserKey, AUserPass: String);

   public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASourceID: Real; ASource: String; ACarrierID: Real); override;

    // Processing shipping and rates
    function Process_ShipmentRate: Boolean; override;
    function Process_ShipShipment: Boolean; override;
    function Process_CancelShipment(cancelAll: Boolean = false): Boolean; override;            // cancel the shipment
    function Process_CloseShipment: Boolean; override;             // close out the shipment (end-of-day)
    procedure Process_Shop(var AList: TServiceCodeList); override; // rate shopping

    // Helper (informational) methods
    procedure ServiceCodeList(var AList: TServiceCodeList); override;
    procedure PackageCodeList(const AServiceCode: String; var AList: TPackageCodeList); overload; override;
    procedure PayorList(var AList: TList); override;
    function PrintFedexManifest(ALogID: Real): Boolean;
    function UploadDocuments: Boolean;
   published
    { Published declarations }
    property FedExType: TFedExType read GetFedExType;
    property CarrierType:TCarrierType read GetCarrierType;
    property LogId: Real read FLogID write FLogID;
    property OneRate: Boolean read FOneRate write FOneRate;
  end;

  TFedExGround = class(TFedExManager)
  private
  protected
    function GetFedExType: TFedExType; override;
  public
  published
  end;

  TFedExExpress = class(TFedExManager)
  private
  protected
    function GetFedExType: TFedExType; override;
  public
  published
  end;

  TFedExSmartPost = class(TFedExManager)
  private
  protected
    function GetFedExType: TFedExType; override;
  public
  published
  end;

const
  FedExBillingOptionDescription: array[TFedExBillingOption] of String =
   ('Sender',        // fboSender
    'Recipient',     // fboRecipient
    'Third-Party',   // fboThirdParty
    'Collect');      // fboCollect

implementation

uses
  IQMS.WebVcl.Blob,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.Dates,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  shipman_rscstr
  { TODO -ombaral -cWebIQ : Need to resolve dependency }
  //prn_share,
  //editmemostr
  ;

function FedEx_Service_Description_From_Code(const ACode: String): String;
var
   i: Integer;
begin
   Result := '';
   for i := Low(FedEx_ServiceCode) to High(FedEx_ServiceCode) do
       if FedEx_ServiceCode[i] = ACode then
          begin
            Result := FedEx_ServiceCodeDescrip[i];
            BREAK;
          end;
end;

function FedEx_Packaging_Description_From_Code(const ACode: String): String;
var
   i: Integer;
begin
   Result := '';
   for i := Low(FedEx_PackagingCode) to High(FedEx_PackagingCode) do
       if FedEx_PackagingCode[i] = ACode then
          begin
            Result := FedEx_PackagingDescrip[i];
            BREAK;
          end;
end;

procedure EvalFutureDayShip(const AFutureDate: TDateTime);
var
   ADays: Integer;
begin
  ADays := Trunc(AFutureDate) - Trunc(Date);

  if not (ADays in [1..10]) then
     raise Exception.Create('Please check the "Future day ship" date.  ' +
           'The future date must be between 1 and 10 days into the future.');

end;

function PackageDateActive(AShipDate: TDateTime): Boolean;
begin
  // the package is still active only if the ship date is <= than the current date
  Result := Trunc(AShipDate) >= Trunc(Date);
end;


{ ---------------------------------------------------------------------------- }
{ TFedExManager }
{ ---------------------------------------------------------------------------- }

constructor TFedExManager.Create(AOwner: TComponent; ASourceID: Real; ASource: String;
 ACarrierID: Real);
begin
  inherited Create(AOwner, ASourceID, ASource, ACarrierID);
  GetAccountData;
end;

procedure TFedExManager.InitValues;
begin
  // Initialize values
  SetSourceID(0, '');
  ClearPackageRec(Package);
  Package.PickupCode := FEDEX_PickupCode[0];
  Package.PickupCodeDescription := FEDEX_PickupDescrip[0];
  Package.WeightUOM := UOM_Weight[wmLBS]; // LBS
  Package.PackageCode := FEDEX_PackagingCode[6];
  Package.PackageCodeDescription := FEDEX_PackagingDescrip[6];
  Package.ServiceCode := FEDEX_ServiceCode[16]; // Ground
  Package.ServiceCodeDescription := FEDEX_ServiceCodeDescrip[16]; // Ground
  FFedExType := GetFedExType;
end;

function TFedExManager.Process_ShipmentRate: Boolean;
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

    try
      Result := ADotNetObject.FedExGetRate( SecurityManager.UserName,
                                  SecurityManager.Password,
                                  IQGetServerName( 'IQ' ),
                                  Source, SourceID);
    finally
      FreeDNetObject( ADotNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;


{ ---------------------------------------------------------------------------- }
procedure TFedExManager.ServiceCodeList(var AList: TServiceCodeList);

   // --------------------------------------------------------------------------
   function _RecipientIsCity(ACountryCode, ACity: String): Boolean;
   begin
     Result := (ShippingInfo.Recipient.CountryCode = ACountryCode {Switzerland}) and
               (UpperCase(ShippingInfo.Recipient.City) = UpperCase(ACity)); // iqstring
   end;
   // --------------------------------------------------------------------------
   function _SenderIsCity(ACountryCode, ACity: String): Boolean;
   begin
     Result := (ShippingInfo.Sender.CountryCode = ACountryCode {Switzerland}) and
               (UpperCase(ShippingInfo.Sender.City) = UpperCase(ACity)); // iqstring
   end;
   // --------------------------------------------------------------------------

var
   i: Integer;
   ACode, ADescription: String;
begin
  // Returns default package list
  if not Assigned(AList) then
    Exit;

  case FedExType of
   ftFedExGround:
     for i := Low(FEDEX_ServiceCode_Ground) to High(FEDEX_ServiceCode_Ground) do
     begin
       ACode := FEDEX_ServiceCode_Ground[i];
       ADescription := FedEx_Service_Description_From_Code(ACode);
       AList.Add(CarrierType, ACode, ADescription);
     end;
   ftFedExSmartPost:
     for i := Low(FEDEX_ServiceCode_SmartPost) to High(FEDEX_ServiceCode_SmartPost) do
     begin
       ACode := FEDEX_ServiceCode_SmartPost[i];
       ADescription := FedEx_Service_Description_From_Code(ACode);
       AList.Add(CarrierType, ACode, ADescription);
     end;
   ftFedExExpress:
     for i := Low(FEDEX_ServiceCode_Express) to High(FEDEX_ServiceCode_Express) do
     begin
       ACode := FEDEX_ServiceCode_Express[i];

       if (SourceID > 0) then
       begin
         // These Services are only available within the United States, including
         // Alaska and Hawaii.  This does not include Canada.
         if IQMS.Common.StringUtils.StrInList(ACode, ['PRIORITY_OVERNIGHT',
                                       'STANDARD_OVERNIGHT',
                                       'FIRST_OVERNIGHT',
                                       'FEDEX_2_DAY',
                                       'FEDEX_2_DAY_AM',
                                       'FEDEX_EXPRESS_SAVER',
                                       'FEDEX_1_DAY_FREIGHT',
                                       'FEDEX_2_DAY_FREIGHT',
                                       'FEDEX_3_DAY_FREIGHT',
                                       'FEDEX_FIRST_FREIGHT'])
            and not ShippingInfo.Domestic('US') then
            CONTINUE;

         // These Services are only available within the United States, *excluding*
         // Alaska (Recipient only) and Hawaii (Sender and Recipient).
         if IQMS.Common.StringUtils.StrInList(ACode, [//'STANDARD_OVERNIGHT', // Available to some areas of HI and AK
                                       'FIRST_OVERNIGHT'])
            and ShippingInfo.Domestic('US')
            and ((ShippingInfo.Sender.State = 'HI' {Hawaii}) or
                 (ShippingInfo.Recipient.State = 'HI' {Hawaii}) or
                 (ShippingInfo.Recipient.State = 'AK' {Alaska})) then
            CONTINUE;

         // These Services are only available within the United States, strictly
         // *excluding* Alaska and Hawaii
         if IQMS.Common.StringUtils.StrInList(ACode, ['FEDEX_EXPRESS_SAVER'])
            and ShippingInfo.Domestic('US')
            and ((ShippingInfo.Sender.State = 'HI' {Hawaii}) or (ShippingInfo.Recipient.State = 'HI' {Hawaii}) or
                 (ShippingInfo.Sender.State = 'AK' {Alaska}) or (ShippingInfo.Recipient.State = 'AK' {Alaska})) then
            CONTINUE;

         // These Services are available to a select list of countries
         if IQMS.Common.StringUtils.StrInList(ACode, ['INTERNATIONAL_ECONOMY_FREIGHT'])
            and not IQMS.Common.StringUtils.StrInList(ShippingInfo.Recipient.CountryCode,
                                       ['AR', // Argentina
                                        'AU',   // Australia
                                        'AT',   // Austria
                                        'BH',   // Bahrain
                                        'BE',   // Belgium
                                        'BR',   // Brazil
                                        'CL',   // Chile
                                        'CN',   // China
                                        'CO',   // Colombia
                                        'CZ',   // Czech Republic
                                        'DK',   // Denmark
                                        'GB',   // England (U.K.)
                                        'FI',   // Finland
                                        'FR',   // France
                                        'DE',   // Germany
                                        'GU',   // Guam
                                        'HK',   // Hong Kong
                                        'HU',   // Hungary
                                        'IN',   // India
                                        'ID',   // Indonesia
                                        'IE',   // Ireland, Northern (U.K.) and Ireland, Republic of
                                        'IL',   // Israel
                                        'IT',   // Italy
                                        'JP',   // Japan
                                        'KR',   // Korea, South
                                        'KW',   // Kuwait
                                        'LU',   // Luxembourg
                                        'MO',   // Macau
                                        'MY',   // Malaysia
                                        'MX',   // Mexico
                                        'NL',   // Netherlands (Holland)
                                        'NZ',   // New Zealand
                                        'NO',   // Norway
                                        'PS',   // Palestine Autonomous
                                        'PA',   // Panama
                                        'PH',   // Philippines
                                        'PL',   // Poland
                                        'PT',   // Portugal
                                        'PR',   // Puerto Rico
                                        'SM',   // San Marino (Italy)
                                        'SG',   // Singapore
                                        'SK',   // Slovak Republic
                                        'SI',   // Slovenia
                                        'ES',   // Spain
                                        'SE',   // Sweden
                                        'CH',   // Switzerland
                                        'TW',   // Taiwan
                                        'TH',   // Thailand
                                        'TR',   // Turkey
                                        'AE',   // United Arab Emirates
                                        'VA',   // Vatican City
                                        'VE',   // Venezuela
                                        'VN'    // Vietnam
                                       ]) then
            CONTINUE;


         if IQMS.Common.StringUtils.StrInList(ACode, ['INTERNATIONAL_FIRST'])
            and not IQMS.Common.StringUtils.StrInList(ShippingInfo.Recipient.CountryCode,
                                       [
                                        'AT',   // Austria
                                        'BE',   // Belgium
                                        'BR',   // Brazil
                                        'CA',   // Canada
                                        'DK',   // Denmark
                                        'GB',   // England (U.K.)
                                        'FR',   // France
                                        'DE',   // Germany
                                        'IT',   // Italy
                                        'LU',   // Luxembourg
                                        'JP',   // Japan
                                        'MX',   // Mexico
                                        'NL',   // Netherlands (Holland)
                                        'PR',   // Puerto Rico
                                        'ES',   // Spain
                                        'CH'    // Switzerland
                                       ]) then
            CONTINUE;

         // This is available to a large list of countries, but I have not
         // taken the time to list them.  I'm doing just a simple check here.
         // NOTE:  The following countries should also be included, but I do
         //        not have country codes for them:
         //        Azores (Portugal)
         //        Bonaire
         //        Channel Islands (U.K.)
         //        Curacao
         //        Macau
         //        Madeira (Portugal)
         //        Saba
         //        St. Barthelemy
         //        St. Croix
         //        St. Eustatius
         //        St. John
         //        St. Maarten/ St. Martin
         //        St. Thomas
         //        Saipan
         if IQMS.Common.StringUtils.StrInList(ACode, ['INTERNATIONAL_ECONOMY',
                                       'EUROPE_FIRST_INTERNATIONAL_PRIORITY',
                                       'INTERNATIONAL_PRIORITY',
                                       'INTERNATIONAL_PRIORITY_FREIGHT'])
            and not IQMS.Common.StringUtils.StrInList(ShippingInfo.Recipient.CountryCode,
                                       ['AF', // Afghanistan
                                        'AL', // Albania
                                        'DZ', // Algeria
                                        'AS', // American Samoa
                                        'AD', // Andorra
                                        'AO', // Angola
                                        'AI', // Anguilla
                                        'AG', // Antigua
                                        'AR', // Argentina
                                        'AM', // Armenia
                                        'AW', // Aruba
                                        'AU', // Australia
                                        'AT', // Austria
                                        'AZ', // Azerbaijan
                                        'BS', // Bahamas
                                        'BH', // Bahrain
                                        'BD', // Bangladesh
                                        'BB', // Barbados
                                        'AG', // Barbuda
                                        'BY', // Belarus
                                        'BE', // Belgium
                                        'BZ', // Belize
                                        'BJ', // Benin
                                        'BM', // Bermuda
                                        'BT', // Bhutan
                                        'BO', // Bolivia
                                        'BA', // Bosnia-Herzegovina
                                        'BW', // Botswana
                                        'BR', // Brazil
                                        'VG', // British Virgin Islands
                                        'BN', // Brunei
                                        'BG', // Bulgaria
                                        'BF', // Burkina Faso
                                        'BI', // Burundi
                                        'KH', // Cambodia
                                        'CM', // Cameroon
                                        'CA', // Canada
                                        'CV', // Cape Verde
                                        'KY', // Cayman Islands
                                        'CF', // Central African Republic
                                        'TD', // Chad
                                        'CL', // Chile
                                        'CN', // China
                                        'CO', // Colombia
                                        'CG', // Congo
                                        'CK', // Cook Islands
                                        'CR', // Costa Rica
                                        'HR', // Croatia
                                        'CY', // Cyprus
                                        'CZ', // Czech Republic
                                        'CD', // Dem. Rep. of Congo
                                        'DK', // Denmark
                                        'DJ', // Djibouti
                                        'DM', // Dominica
                                        'DO', // Dominican Republic
                                        'TL', // East Timor
                                        'EC', // Ecuador
                                        'EG', // Egypt
                                        'SV', // El Salvador
                                        'GB', // England (U.K.)
                                        'GQ', // Equatorial Guinea
                                        'ER', // Eritrea
                                        'EE', // Estonia
                                        'ET', // Ethiopia
                                        'FO', // Faroe Islands
                                        'FJ', // Fiji
                                        'FI', // Finland
                                        'FR', // France
                                        'GF', // French Guiana
                                        'PF', // French Polynesia
                                        'GA', // Gabon
                                        'GM', // Gambia
                                        'GE', // Georgia
                                        'DE', // Germany
                                        'GH', // Ghana
                                        'GI', // Gibraltar
                                        'GR', // Greece
                                        'GL', // Greenland
                                        'GD', // Grenada
                                        'GP', // Guadeloupe
                                        'GU', // Guam
                                        'GT', // Guatemala
                                        'GN', // Guinea
                                        'GW', // Guinea-Bissau
                                        'GY', // Guyana
                                        'HT', // Haiti
                                        'HN', // Honduras
                                        'HK', // Hong Kong
                                        'HU', // Hungary
                                        'IS', // Iceland
                                        'IN', // India
                                        'ID', // Indonesia
                                        'IQ', // Iraq
                                        'IE', // Ireland, Northern (U.K.)
                                        'IE', // Ireland, Republic of
                                        'IL', // Israel
                                        'IT', // Italy
                                        'CI', // Ivory Coast
                                        'JM', // Jamaica
                                        'JP', // Japan
                                        'JO', // Jordan
                                        'KZ', // Kazakhstan
                                        'KE', // Kenya
                                        'KR', // Korea, South
                                        'KW', // Kuwait
                                        'KG', // Kyrgyzstan
                                        'LA', // Laos
                                        'LV', // Latvia
                                        'LB', // Lebanon
                                        'LS', // Lesotho
                                        'LR', // Liberia
                                        'LY', // Libya
                                        'LI', // Liechtenstein
                                        'LT', // Lithuania
                                        'LU', // Luxembourg
                                        'MK', // Macedonia
                                        'MG', // Madagascar
                                        'MW', // Malawi
                                        'MY', // Malaysia
                                        'MV', // Maldives
                                        'ML', // Mali
                                        'MT', // Malta
                                        'MH', // Marshall Islands
                                        'MQ', // Martinique
                                        'MR', // Mauritania
                                        'MU', // Mauritius
                                        'MX', // Mexico
                                        'FM', // Micronesia
                                        'MD', // Moldova
                                        'MC', // Monaco
                                        'MN', // Mongolia
                                        'ME', // Montenegro
                                        'MS', // Montserrat
                                        'MA', // Morocco
                                        'MZ', // Mozambique
                                        'NA', // Namibia
                                        'NP', // Nepal
                                        'NL', // Netherlands (Holland)
                                        'AN', // Netherlands Antilles
                                        'NC', // New Caledonia
                                        'NZ', // New Zealand
                                        'NI', // Nicaragua
                                        'NE', // Niger
                                        'NG', // Nigeria
                                        'NO', // Norway
                                        'OM', // Oman
                                        'PK', // Pakistan
                                        'PW', // Palau
                                        'PS', // Palestine Autonomous
                                        'PA', // Panama
                                        'PG', // Papua New Guinea
                                        'PY', // Paraguay
                                        'PE', // Peru
                                        'PH', // Philippines
                                        'PL', // Poland
                                        'PT', // Portugal
                                        'PR', // Puerto Rico
                                        'QA', // Qatar
                                        'RE', // Reunion Island
                                        'RO', // Romania
                                        'RU', // Russia
                                        'RW', // Rwanda
                                        'KN', // St. Kitts and Nevis
                                        'LC', // St. Lucia
                                        'VC', // St. Vincent
                                        'WS', // Samoa, Western
                                        'SM', // San Marino
                                        'SA', // Saudi Arabia
                                        'GB', // Scotland (U.K.)
                                        'SN', // Senegal
                                        'RS', // Serbia
                                        'SC', // Seychelles
                                        'SL', // Sierra Leone
                                        'SG', // Singapore
                                        'SK', // Slovak Republic
                                        'SI', // Slovenia
                                        'ZA', // South Africa
                                        'ES', // Spain
                                        'LK', // Sri Lanka
                                        'SR', // Suriname
                                        'SZ', // Swaziland
                                        'SE', // Sweden
                                        'CH', // Switzerland
                                        'SY', // Syria
                                        'TW', // Taiwan
                                        'TZ', // Tanzania
                                        'TH', // Thailand
                                        'TG', // Togo
                                        'TO', // Tonga
                                        'TT', // Trinidad and Tobago
                                        'TN', // Tunisia
                                        'TR', // Turkey
                                        'TM', // Turkmenistan
                                        'TC', // Turks and Caicos Islands
                                        'UG', // Uganda
                                        'UA', // Ukraine
                                        'AE', // United Arab Emirates
                                        'UY', // Uruguay
                                        'VI', // U.S. Virgin Islands
                                        'UZ', // Uzbekistan
                                        'VU', // Vanuatu
                                        'VA', // Vatican City
                                        'VE', // Venezuela
                                        'VN', // Vietnam
                                        'GB', // Wales (U.K.)
                                        'WF', // Wallis and Futuna
                                        'YE', // Yemen Arab Republic
                                        'ZM', // Zambia
                                        'ZW']) // Zimbabwe
                                        then
            CONTINUE;

         if IQMS.Common.StringUtils.StrInList(ACode, ['EUROPE_FIRST_INTERNATIONAL_PRIORITY'])
            and ((ShippingInfo.Sender.CountryCode = 'CA' {Canada}) or (ShippingInfo.Recipient.CountryCode = 'CA' {Canada}) or
                 (ShippingInfo.Sender.CountryCode = 'US' {US}) or (ShippingInfo.Recipient.CountryCode = 'US' {US})) then
            CONTINUE;

         if IQMS.Common.StringUtils.StrInList(ACode, ['FEDEX_FREIGHT_ECONOMY',
                                       'FEDEX_FREIGHT_PRIORITY'])
            and not IQMS.Common.StringUtils.StrInList(ShippingInfo.Recipient.CountryCode,
                                      [
                                        'CA', // Canada
                                        'MX', // Mexico
                                        'PR',  // Puerto Rico
                                        'US'  // United States
                                      ]) then
            CONTINUE;
       end;

       ADescription := FedEx_Service_Description_From_Code(ACode);
       AList.Add(CarrierType, ACode, ADescription);
     end;
  end;
end;

{ ---------------------------------------------------------------------------- }
procedure TFedExManager.PackageCodeList(const AServiceCode: String; var AList: TPackageCodeList);

  // ---------------------------------------------------------------------------
  function _ServiceTypeIs(const ACode: String): Boolean;
  begin
    Result := AServiceCode = ACode;
  end;
  // ---------------------------------------------------------------------------
  procedure _Build(const ACodes: array of Integer);
  var
     i, x: Integer;
  begin
    for i := Low(ACodes) to High(ACodes) do
     begin
       x := ACodes[i];
       AList.Add(CarrierType, FEDEX_PackagingCode[x], FEDEX_PackagingDescrip[x]);
     end;
  end;
  // ---------------------------------------------------------------------------

begin
  // *** FedEx Packaging by Service Type *** //
  // check object
  if not Assigned(AList) then
    Exit;

(*

0, // 'FEDEX_ENVELOPE'
1, // 'FEDEX_PAK'
2, // 'FEDEX_BOX'
3, // 'FEDEX_TUBE'
4, // 'FEDEX_10KG_BOX'
5, // 'FEDEX_25KG_BOX'
6, // 'YOUR_PACKAGING'
7, // 'FEDEX_SMALL_BOX'
8, // 'FEDEX_MEDIUM_BOX'
9, // 'FEDEX_LARGE_BOX'
10 // 'FEDEX_EXTRA_LARGE_BOX'

*)

       if FOneRate and
          (_ServiceTypeIs(FEDEX_ServiceCode[0] {'PRIORITY_OVERNIGHT'}) or
           _ServiceTypeIs(FEDEX_ServiceCode[1] {'STANDARD_OVERNIGHT'}) or
           _ServiceTypeIs(FEDEX_ServiceCode[3] {'FEDEX_2_DAY'}) or
           _ServiceTypeIs(FEDEX_ServiceCode[4] {'FEDEX_2_DAY_AM'}) or
           _ServiceTypeIs(FEDEX_ServiceCode[5] {'FEDEX_EXPRESS_SAVER'}) or
           _ServiceTypeIs(FEDEX_ServiceCode[2] {'FIRST_OVERNIGHT'})) then
          _Build([7,   // 'FEDEX_SMALL_BOX'
                  8,   // 'FEDEX_MEDIUM_BOX'
                  9,   // 'FEDEX_LARGE_BOX'
                  10,  // 'FEDEX_EXTRA_LARGE_BOX'
                  1,   // 'FEDEX_PAK'
                  3,   // 'FEDEX_TUBE'
                  0])  // 'FEDEX_ENVELOPE'
  else if _ServiceTypeIs(FEDEX_ServiceCode[0] {'PRIORITY_OVERNIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[1] {'STANDARD_OVERNIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[3] {'FEDEX_2_DAY'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[4] {'FEDEX_2_DAY_AM'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[2] {'FIRST_OVERNIGHT'}) then
          _Build([0,   // 'FEDEX_ENVELOPE'
                  1,   // 'FEDEX_PAK'
                  2,   // 'FEDEX_BOX'
                  3,   // 'FEDEX_TUBE'
                  6])  // 'YOUR_PACKAGING'

  else if _ServiceTypeIs(FEDEX_ServiceCode[5] {'FEDEX_EXPRESS_SAVER'}) then
          _Build([0,   // 'FEDEX_ENVELOPE'
                  7,   // 'FEDEX_SMALL_BOX'
                  8,   // 'FEDEX_MEDIUM_BOX'
                  9,   // 'FEDEX_LARGE_BOX'
                  10,  // 'FEDEX_EXTRA_LARGE_BOX'
                  3,   // 'FEDEX_TUBE'
                  6])  // 'YOUR_PACKAGING'

  else if _ServiceTypeIs(FEDEX_ServiceCode[14] {'INTERNATIONAL_PRIORITY'}) then
          _Build([0,   // 'FEDEX_ENVELOPE'
                  1,   // 'FEDEX_PAK'
                  2,   // 'FEDEX_BOX'
                  4,   // 'FEDEX_10KG_BOX'
                  5,   // 'FEDEX_25KG_BOX'
                  6])  // 'YOUR_PACKAGING'

  else if _ServiceTypeIs(FEDEX_ServiceCode[16] {'INTERNATIONAL_ECONOMY'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[18] {'INTERNATIONAL_FIRST'}) then
          _Build([0,   // 'FEDEX_ENVELOPE'
                  1,   // 'FEDEX_PAK'
                  2,   // 'FEDEX_BOX'
                  3,   // 'FEDEX_TUBE'
                  6])  // 'YOUR_PACKAGING'

  else if _ServiceTypeIs(FEDEX_ServiceCode[6] {'FEDEX_GROUND'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[7] {'GROUND_HOME_DELIVERY'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[8] {'FEDEX_1_DAY_FREIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[9] {'FEDEX_2_DAY_FREIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[10] {'FEDEX_3_DAY_FREIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[11] {'FEDEX_FIRST_FREIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[12] {'FEDEX_FREIGHT_ECONOMY'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[13] {'FEDEX_FREIGHT_PRIORITY'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[23] {'SMART_POST'})
           then
          _Build([6])  // 'YOUR_PACKAGING'

  else if _ServiceTypeIs(FEDEX_ServiceCode[19] {'INTERNATIONAL_PRIORITY_FREIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[20] {'INTERNATIONAL_ECONOMY_FREIGHT'}) or
          _ServiceTypeIs(FEDEX_ServiceCode[22] {'EUROPE_FIRST_INTERNATIONAL_PRIORITY'})
           then
          _Build([6]); // 'YOUR_PACKAGING'
end;

procedure TFedExManager.Process_Shop(var AList: TServiceCodeList);
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
   ADotNetObject: Variant;
   CW: Word;
begin
  if (Source = 'SHIPMAN_SHOP_REQUEST') then
    begin
      DisableFPUExceptions( CW );
      try
        CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

        try
          ADotNetObject.FedExShopRate( SecurityManager.UserName,
                                      SecurityManager.Password,
                                      IQGetServerName( 'IQ' ),
                                      CarrierID, ShopRequestID);
        finally
          FreeDNetObject( ADotNetObject );
        end;
      finally
        RestoreFPU( CW );
      end;
    end
  else
    begin
      if not Assigned(AList) or not Assigned(ShippingInfo) then Exit;
      if not IsPackageDimValid(Package.Length,Package.Width,Package.Height,Package.DimensionUOM,TRUE {Show Error}) then Exit;

      DisableFPUExceptions( CW );
      try
        CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

        try
          ADotNetObject.FedExGetRate( SecurityManager.UserName,
                                      SecurityManager.Password,
                                      IQGetServerName( 'IQ' ),
                                      Source, SourceID, ShopRequestID, Package.CarrierID);
        finally
          FreeDNetObject( ADotNetObject );
        end;
      finally
        RestoreFPU( CW );
      end;

    end;
      PopulateShopRates(FShopRequestID, CarrierType, AList, false);
end;

function TFedExManager.ValidateAccount(const AAccountNumber, AMeterNumber: String;
 ASilent: Boolean): Boolean;
begin
  Result := FALSE;

  // Validate Account information
  Result := (AAccountNumber > '');
  if not Result and not ASilent then
     raise Exception.Create(shipman_rscstr.cTXT000034 {'FedEx Account number not provided'});

  if not Result then Exit;

  // Validate Account information
  Result := (AMeterNumber > '');
  if not Result and not ASilent then
      raise Exception.Create(shipman_rscstr.cTXT000035 {'FedEx Meter number not provided.'});

end;

procedure TFedExManager.ValidatePackageAccount;
var
   AAccountNumber,AMeterNumber, AUserKey, AUserPass: String;
begin
  ParseAccountStr(Package.Account,AAccountNumber,AMeterNumber, AUserKey, AUserPass);
  ValidateAccount(AAccountNumber,AMeterNumber);
end;

function TFedExManager.GetCarrierCode: String;
begin
  if FedExType = ftFedExExpress
  then Result := 'FDXE'
  else Result := 'FDXG';
end;

function TFedExManager.GetCarrierType: TCarrierType;
begin
  if FedExType = ftFedExExpress
  then Result := ctFedExExpress
  else
    if FedExType = ftFedExSmartPost
    then Result := ctFedExSmartPost
    else Result := ctFedExGround;
end;

function TFedExManager.UploadDocuments: Boolean;
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  AMessage: String;
  hMsg: TPanelMesg;
begin
  DisableFPUExceptions( CW );
  Result := false;
  try
    hMsg := hPleaseWait('Uploading Documents.  Please wait...');
    CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

    try
      AMessage := ADotNetObject.FedExUploadDocument( SecurityManager.UserName,
                                  SecurityManager.Password,
                                  IQGetServerName( 'IQ' ),
                                  Source, SourceID, ShippingInfo.Sender.CountryCode,
                                  ShippingInfo.Recipient.CountryCode);
      if (AMessage <> 'Success') then
          IQMS.Common.Dialogs.IQError(AMessage)
      else
          Result := true;
    finally
      FreeDNetObject( ADotNetObject );
    end;
  finally
    RestoreFPU( CW );
    if Assigned(hMsg) then FreeAndNil(hMsg);
  end;
end;


function TFedExManager.Process_ShipShipment: Boolean;
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

    try
      Result := ADotNetObject.FedExShipShipment( SecurityManager.UserName,
                                  SecurityManager.Password,
                                  IQGetServerName( 'IQ' ),
                                  Source, SourceID);
    finally
      FreeDNetObject( ADotNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;
{
function TFedExManager.Process_ShipShipment: Boolean;
begin
  // initial
  Result := FALSE;

  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Source ID must be provided.');

  if (ShippingInfo.International) then
    Result := Process_ShipShipmentIntl
  else
    Result := Process_ShipShipmentDomestic;

end;
}


function TFedExManager.Process_CancelShipment(cancelAll: Boolean = false): Boolean;
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  hMsg: TPanelMesg;
begin

  // initial
  Result := FALSE;

  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Source ID must be provided.');

  if Package.TrackingNumber = '' then
     raise Exception.Create(shipman_rscstr.cTXT000011 {'Cannot cancel.  Tracking number not provided.'});
  ShippingInfo.FillShipmentOptionsFedex;
  with ShippingInfo.ShipmentOptionFedex do
    try
       // we cannot close or cancel Ground packages that are past today's date
       if (FedExType = ftFedExGround) and
           not PackageDateActive(Package.ShipDate) or
           FutureDayShip and not PackageDateActive(ShipDate) then
           begin
             Result := IQMS.Common.Dialogs.IQConfirmYN('FedEx Ground package may already have been processed by FedEx.  ' +
              'A cancellation request cannot be sent to FedEx.  Do you want to flag this package locally as cancelled?');
             Exit;
           end;

       // there is no need to close or cancel Express packages that are over an hour old
       if (FedExType = ftFedExExpress) and
          (Now - Package.ShipDate > IQMS.Common.Dates.TIME_OneHour) then
          begin
             Result := IQMS.Common.Dialogs.IQConfirmYN('FedEx Express package may already have been processed by FedEx.  ' +
              'A cancellation request cannot be sent to FedEx.  Do you want to flag this package locally as cancelled?');
            Exit;
          end;

       try
        DisableFPUExceptions( CW );
        try
          CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

          try
            Result := ADotNetObject.FedExDeleteShipment( SecurityManager.UserName,
                                        SecurityManager.Password,
                                        IQGetServerName( 'IQ' ),
                                        Source, SourceID, Package.TrackingNumber, cancelAll);
          finally
            FreeDNetObject( ADotNetObject );
          end;
        finally
          RestoreFPU( CW );
        end;

       except on E:Exception do
        begin
          // write to log

          // NOTE:  Do not return an exception; must be soft error.
          //raise Exception.CreateFmt('FedEx Error:'#13'%s',[E.Message]);
          IQError(Format('FedEx Error:'#13'%s', [E.Message]));
        end;
       end;
    finally
       if Assigned(hMsg) then FreeAndNil(hMsg);
       Free;
    end;

end;

function TFedExManager.Process_CloseShipment: Boolean;
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  hMsg: TPanelMesg;
begin

  // initial
  Result := FALSE;
  FLogID := 0;

//  AReportFileName := IQMS.Common.Miscellaneous.GetSpecialPath(evTemp) + '~FedExRpt.txt';
//  if FileExists(AReportFileName) then
  //  DeleteFile(AReportFileName);

       try

          hMsg := hPleaseWait('Processing.  Please wait.');

        DisableFPUExceptions( CW );
        try
          CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

          try
          if (FedExType = ftFedExGround) then
            FLogID := ADotNetObject.FedExCloseGround( SecurityManager.UserName,
                                        SecurityManager.Password,
                                        IQGetServerName( 'IQ' ),
                                        CarrierID)
          else if (FedExType = ftFedExSmartPost) then
            FLogID := ADotNetObject.FedExCloseSmartPost( SecurityManager.UserName,
                                        SecurityManager.Password,
                                        IQGetServerName( 'IQ' ),
                                        CarrierID);
          ADotNetObject.FedExVersionCapture( SecurityManager.UserName,
                                        SecurityManager.Password,
                                        IQGetServerName( 'IQ' ),
                                        CarrierID);
          finally
            FreeDNetObject( ADotNetObject );
          end;
        finally
          RestoreFPU( CW );
        end;

    Result := TRUE;

    finally
       if Assigned(hMsg) then FreeAndNil(hMsg);
    end;

end;

function TFedExManager.URL: String;
begin
  Result := shipman_common.GetURL(Package.CarrierID,utAll,URL_FEDEX);
  if Result = '' then
     Result := shipman_common.GetURL(CarrierType,utAll,URL_FEDEX);
  if Result = '' then
     Result := URL_FEDEXTEST;
end;

procedure TFedExManager.PayorList(var AList: TList);
  // ---------------------------------------------------------------------------
  procedure _ad(ACaption: String; AValue: Integer);
  begin
    AList.Add(TDataCargo.Create(ACaption,AValue,''))
  end;
  // ---------------------------------------------------------------------------
begin
{Valid payment types are:
  ptSender (0)
  ptRecipient (1)
  ptThirdParty (2)
  ptCollect (3)
}

  if (AList <> NIL) then
  begin
     AList.Clear;
     case FedExType of
      ftFedExGround:
       begin
         _ad('Sender', 0);
         _ad('Recipient',1);
         _ad('Third-Party',2);
         if (Package.ServiceCode = 'FEDEX_GROUND') then
            _ad('Collect',3);
       end;
      ftFedExExpress:
       begin
         _ad('Sender', 0);
         _ad('Recipient',1);
         _ad('Third-Party',2);
       end;
      ftFedExSmartPost:
       begin
         _ad('Sender', 0);
       end;
     end;

{
The COLLECT payment type is only supported in FedEx Ground services
(i.e. CarrierCode set to FDXG and ServiceType set to 12 (FedEx Ground)).
For Return Manager, only SENDER and THIRDPARTY are allowed.

When PayorType is set to 1 (RECIPIENT) or 2 (THIRDPARTY),
the PayorAccountNumber and PayorCountry are required to be provided
in the request. The last one depends also on the CarrierCode. 

}

  end;
end;

procedure TFedExManager.ProcessSoftError(AMsg: String);
begin
  if Assigned(OnSoftError) and (AMsg > '') then
     begin
       OnSoftError(TSoftErrorType(0),'01', AMsg);
     end;

end;

function TFedExManager.Service_Description_From_Code(ACode: String): String;
begin
  Result := FedEx_Service_Description_From_Code(ACode);
end;

procedure TFedExManager.GetAccountData;
var
   AParams: TStringList;
begin
  try
     AParams := TStringList.Create;
     FillAccountValues(CarrierType, AParams);
     FAccountNumber := AParams.Values['AccountNumber'];
     FMeterNumber := AParams.Values['MeterNumber'];
     FUserKey := AParams.Values['CSPUserKey'];
     FUserPass := AParams.Values['CSPUserPass'];
  finally
     if Assigned(AParams) then AParams.Free;
  end;
end;

function TFedExManager.PrintFedexManifest(ALogID: Real): Boolean;
var
  AReportFileName: TFileName;
  APrinterName: String;
  AMemoryStream: TMemoryStream;
begin
      AReportFileName := System.SysUtils.IncludeTrailingPathDelimiter(IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'Temp') +
        SelectValueFmtAsString('select manifest_filename from fedex_close_log where id = %.0f', [ALogID]);
      AMemoryStream:= TMemoryStream.Create;
      { TODO -ombaral -cWebIQ : Need to resolve dependency
      if not TIQMS.WebVcl.Blob.GetBlob( 'MANIFEST_REPORT', // column name
                      'FEDEX_CLOSE_LOG',  // table name
                      ALogID,
                      AMemoryStream ) then EXIT;
      }
      with TFileStream.Create(AReportFileName, fmCreate) do
        try
          CopyFrom(AMemoryStream, AMemoryStream.Size)
        finally
          Free
        end;

      if (FedExType = ftFedExGround) and FileExists(AReportFileName) then
         begin
           { TODO -ombaral -cWebIQ : Need to resolve dependency
           APrinterName := GetReportPrinter;
           if (not IQSetPrinter(APrinterName)) then
            begin
               IQMS.Common.Dialogs.IQError(Format( 'Could not find printer %s', [ APrinterName ]));;
               EXIT;
            end;
           prn_share.PrintTextFile(AReportFileName, 'FedEx Manifest Report');
          //IQMS.Common.Miscellaneous.ExecuteProgram(AReportFileName,SW_SHOWDEFAULT,'print');
          Sleep(3000);
          }
         end;
end;


{ ---------------------------------------------------------------------------- }
{ TFedExGround }
{ ---------------------------------------------------------------------------- }

function TFedExGround.GetFedExType: TFedExType;
begin
  Result := ftFedExGround;
end;

{ ---------------------------------------------------------------------------- }
{ TFedExExpress }
{ ---------------------------------------------------------------------------- }

function TFedExExpress.GetFedExType: TFedExType;
begin
  Result := ftFedExExpress;
end;

{ ---------------------------------------------------------------------------- }
{ TFedExSmartPost }
{ ---------------------------------------------------------------------------- }

function TFedExSmartPost.GetFedExType: TFedExType;
begin
  Result := ftFedExSmartPost;
end;

procedure TFedExManager.ParseAccountStr(const AAccount: String;
  var AAccountNumber, AMeterNumber, AUserKey, AUserPass: String);
var
   AList: TStringList;
begin
  try
     AList := TStringList.Create;
     IQMS.Common.StringUtils.StrToStringList(AAccount, AList);
     AAccountNumber := AList.Values['AccountNumber'];
     AMeterNumber := AList.Values['MeterNumber'];
     AUserKey := AList.Values['CSPUserKey'];
     AUserPass := AList.Values['CSPUserPass'];
  finally
     if Assigned(AList) then AList.Free;
  end;
end;

end.
