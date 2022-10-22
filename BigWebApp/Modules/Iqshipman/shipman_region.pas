unit shipman_region;

{This unit contains lists of country and state codes for shipping
 It can be safely called outside of IQShipMan, since it does not
 use any IQShipMan units.}

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.Client,
  UniComboBox,
  UniDBComboBox,
  FireDAC.Phys,
  MainModule;

type
  TCountryCodeType = (cctChr2, cctChr3, cctDigit3);

    function CountryCodeFor(ACountryName: String;
     ACountryCodeType: TCountryCodeType = cctChr2): String;
    function CountryNameFor(const ACountryCode: String): String;

    function USPS_CountryNameFor(const ACountryCode: String): String;

    procedure LoadStateCodes(AComboBox: TUniComboBox; ACountryCode: String = ''; ADefaultState: String = '');
    // Does the country (provided in param) use states or regions?  Allows
    // enabling/disabling of the state combo box.
    function CountryHasState(const ACountryCode: String): Boolean;

    procedure LoadCountryCodes(var AList: TStringList); overload;
    procedure LoadCountryCodes(AComboBox: TUniDBComboBox; AMutliple: Boolean = FALSE); overload;
    procedure LoadCountryCodes(AComboBox: TUniComboBox); overload;
    procedure LoadCountries(AComboBox: TUniDBComboBox; AMutliple: Boolean = FALSE);

    procedure ParseFullName(const AFullName: String; var AFirstName,
     ALastName: String);
    procedure ParseFullNameEx(const AFullName: String; var AFirstName,
     AMiddleName, ALastName: String);

const

(*
  // *** Country Codes ***
  CountryCodes: array[0..243] of String =
   (
    'AF', // Afghanistan
    'AX', // Åland Islands
    'AL', // Albania
    'DZ', // Algeria
    'AS', // American Samoa
    'AD', // Andorra
    'AO', // Angola
    'AI', // Anguilla
    'AQ', // Antarctica
    'AG', // Antigua and Barbuda
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
    'BY', // Belarus
    'BE', // Belgium
    'BZ', // Belize
    'BJ', // Benin
    'BM', // Bermuda
    'BT', // Bhutan
    'BO', // Bolivia
    'BA', // Bosnia and Herzegovina
    'BW', // Botswana
    'BV', // Bouvet Island
    'BR', // Brazil
    'IO', // British Indian Ocean Territory
    'BN', // Brunei Darussalam
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
    'CX', // Christmas Island
    'CC', // Cocos (Keeling) Islands
    'CO', // Colombia
    'KM', // Comoros
    'CG', // Congo
    'CD', // The Democratic Republic of Congo
    'CK', // Cook Islands
    'CR', // Costa Rica
    'CI', // Côte D''ivoire
    'HR', // Croatia
    'CU', // Cuba
    'CY', // Cyprus
    'CZ', // Czech Republic
    'DK', // Denmark
    'DJ', // Djibouti
    'DM', // Dominica
    'DO', // Dominican Republic
    'EC', // Ecuador
    'EG', // Egypt
    'SV', // El Salvador
    'GQ', // Equatorial Guinea
    'ER', // Eritrea
    'EE', // Estonia
    'ET', // Ethiopia
    'FK', // Falkland Islands (Malvinas)
    'FO', // Faroe Islands
    'FJ', // Fiji
    'FI', // Finland
    'FR', // France
    'GF', // French Guiana
    'PF', // French Polynesia
    'TF', // French Southern Territories
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
    'GG', // Guernsey
    'GN', // Guinea
    'GW', // Guinea-Bissau
    'GY', // Guyana
    'HT', // Haiti
    'HM', // Heard Island and McDonald Islands
    'VA', // Holy See (Vatican City State)
    'HN', // Honduras
    'HK', // Hong Kong
    'HU', // Hungary
    'IS', // Iceland
    'IN', // India
    'ID', // Indonesia
    'IR', // Islamic Republic of Iran
    'IQ', // Iraq
    'IE', // Ireland
    'IM', // Isle of Man
    'IL', // Israel
    'IT', // Italy
    'JM', // Jamaica
    'JP', // Japan
    'JE', // Jersey
    'JO', // Jordan
    'KZ', // Kazakhstan
    'KE', // Kenya
    'KI', // Kiribati
    'KP', // Democratic People''s Republic of Korea (North)
    'KR', // Republic of Korea
    'KW', // Kuwait
    'KG', // Kyrgyzstan
    'LA', // Lao People''s Democratic Republic
    'LV', // Latvia
    'LB', // Lebanon
    'LS', // Lesotho
    'LR', // Liberia
    'LY', // Libyan Arab Jamahiriya
    'LI', // Liechtenstein
    'LT', // Lithuania
    'LU', // Luxembourg
    'MO', // Macao
    'MK', // The Former Yugoslav Republic of Macedonia
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
    'YT', // Mayotte
    'MX', // Mexico
    'FM', // Federated States of Micronesia
    'MD', // Republic of Moldova
    'MC', // Monaco
    'MN', // Mongolia
    'ME', // Serbia-Montenegro (Yugoslavia)
    'MS', // Montserrat
    'MA', // Morocco
    'MZ', // Mozambique
    'MM', // Myanmar
    'NA', // Namibia
    'NR', // Nauru
    'NP', // Nepal
    'NL', // Netherlands
    'AN', // Netherlands Antilles
    'NC', // New Caledonia
    'NZ', // New Zealand
    'NI', // Nicaragua
    'NE', // Niger
    'NG', // Nigeria
    'NU', // Niue
    'NF', // Norfolk Island
    'MP', // Northern Mariana Islands
    'NO', // Norway
    'OM', // Oman
    'PK', // Pakistan
    'PW', // Palau
    'PS', // Palestinian Territory, Occupied
    'PA', // Panama
    'PG', // Papua New Guinea
    'PY', // Paraguay
    'PE', // Peru
    'PH', // Philippines
    'PN', // Pitcairn
    'PL', // Poland
    'PT', // Portugal
    'PR', // Puerto Rico
    'QA', // Qatar
    'RE', // Réunion
    'RO', // Romania
    'RU', // Russian Federation
    'RW', // Rwanda
    'SH', // Saint Helena
    'KN', // Saint Kitts and Nevis
    'LC', // Saint Lucia
    'PM', // Saint Pierre and Miquelon
    'VC', // Saint Vincent and Grenadines
    'WS', // Samoa
    'SM', // San Marino
    'ST', // Sao Tome and Principe
    'SA', // Saudi Arabia
    'SN', // Senegal
    'RS', // Serbia
    'SC', // Seychelles
    'SL', // Sierra Leone
    'SG', // Singapore
    'SK', // Slovak Republic (Slovakia)
    'SI', // Slovenia
    'SB', // Solomon Islands
    'SO', // Somalia
    'ZA', // South Africa
    'GS', // South Georgia and The South Sandwich Islands
    'ES', // Spain
    'LK', // Sri Lanka
    'SD', // Sudan
    'SR', // Suriname
    'SJ', // Svalbard and Jan Mayen
    'SZ', // Swaziland
    'SE', // Sweden
    'CH', // Switzerland
    'SY', // Syrian Arab Republic
    'TW', // Taiwan, Province of China
    'TJ', // Tajikistan
    'TZ', // Tanzania, United Republic of
    'TH', // Thailand
    'TL', // Timor-Leste
    'TG', // Togo
    'TK', // Tokelau
    'TO', // Tonga
    'TT', // Trinidad and Tobago
    'TN', // Tunisia
    'TR', // Turkey
    'TM', // Turkmenistan
    'TC', // Turks and Caicos Islands
    'TV', // Tuvalu
    'UG', // Uganda
    'UA', // Ukraine
    'AE', // United Arab Emirates
    'GB', // United Kingdom
    'US', // United States of America
    'UM', // United States Minor Outlying Islands
    'UY', // Uruguay
    'UZ', // Uzbekistan
    'VU', // Vanuatu
    'VE', // Venezuela
    'VN', // Viet Nam
    'VG', // Virgin Islands, British
    'VI', // Virgin Islands, U.S.
    'WF', // Wallis and Futuna
    'EH', // Western Sahara
    'YE', // Yemen
    'ZM', // Zambia
    'ZW'  // Zimbabwe
   );

  // NOTE:  FedEx only wants a country code; they don't want a country name.
  //        But USPS wants a country name; they don't use country codes.
  //        So, we use FedEx country codes, but USPS country names.

  CountryNames: array[0..243] of String =
   (
    'Afghanistan',                                   // AF
    'Åland Islands',                                 // AX
    'Albania',                                       // AL
    'Algeria',                                       // DZ
    'American Samoa',                                // AS
    'Andorra',                                       // AD
    'Angola',                                        // AO
    'Anguilla',                                      // AI
    'Antarctica',                                    // AQ
    'Antigua & Barbuda',                             // AG
    'Argentina',                                     // AR
    'Armenia',                                       // AM
    'Aruba',                                         // AW
    'Australia',                                     // AU
    'Austria',                                       // AT
    'Azerbaijan',                                    // AZ
    'Bahamas',                                       // BS
    'Bahrain',                                       // BH
    'Bangladesh',                                    // BD
    'Barbados',                                      // BB
    'Belarus',                                       // BY
    'Belgium',                                       // BE
    'Belize',                                        // BZ
    'Benin',                                         // BJ
    'Bermuda',                                       // BM
    'Bhutan',                                        // BT
    'Bolivia',                                       // BO
    'Bosnia-Herzegovina',                            // BA
    'Botswana',                                      // BW
    'Bouvet Island',                                 // BV
    'Brazil',                                        // BR
    'British Indian Ocean Territory',                // IO
    'Brunei Darussalam',                             // BN
    'Bulgaria',                                      // BG
    'Burkina Faso',                                  // BF
    'Burundi',                                       // BI
    'Cambodia',                                      // KH
    'Cameroon',                                      // CM
    'Canada',                                        // CA
    'Cape Verde',                                    // CV
    'Cayman Islands',                                // KY
    'Central African Republic',                      // CF
    'Chad',                                          // TD
    'Chile',                                         // CL
    'China',                                         // CN
    'Christmas Island',                              // CX
    'Cocos (Keeling) Islands',                       // CC
    'Colombia',                                      // CO
    'Comoros',                                       // KM
    'Congo, Republic of the',                        // CG
    'Congo, Democratic Republic of the',             // CD
    'Cook Islands',                                  // CK
    'Costa Rica',                                    // CR
    'Cote d''Ivoire (Ivory Coast)',                  // CI
    'Croatia',                                       // HR
    'Cuba',                                          // CU
    'Cyprus',                                        // CY
    'Czech Republic',                                // CZ
    'Denmark',                                       // DK
    'Djibouti',                                      // DJ
    'Dominica',                                      // DM
    'Dominican Republic',                            // DO
    'Ecuador',                                       // EC
    'Egypt',                                         // EG
    'El Salvador',                                   // SV
    'Equatorial Guinea',                             // GQ
    'Eritrea',                                       // ER
    'Estonia',                                       // EE
    'Ethiopia',                                      // ET
    'Falkland Islands',                              // FK
    'Faroe Islands',                                 // FO
    'Fiji',                                          // FJ
    'Finland',                                       // FI
    'France',                                        // FR
    'French Guiana',                                 // GF
    'French Polynesia',                              // PF
    'French Southern Territories',                   // TF
    'Gabon',                                         // GA
    'Gambia',                                        // GM
    'Georgia, Republic of',                          // GE
    'Germany',                                       // DE
    'Ghana',                                         // GH
    'Gibraltar',                                     // GI
    'Greece',                                        // GR
    'Greenland',                                     // GL
    'Grenada',                                       // GD
    'Guadeloupe',                                    // GP
    'Guam',                                          // GU
    'Guatemala',                                     // GT
    'Guernsey',                                      // GG
    'Guinea',                                        // GN
    'Guinea-Bissau',                                 // GW
    'Guyana',                                        // GY
    'Haiti',                                         // HT
    'Heard Island and McDonald Islands',             // HM
    'Holy See (Vatican City State)',                 // VA
    'Honduras',                                      // HN
    'Hong Kong',                                     // HK
    'Hungary',                                       // HU
    'Iceland',                                       // IS
    'India',                                         // IN
    'Indonesia',                                     // ID
    'Iran',                                          // IR
    'Iraq',                                          // IQ
    'Ireland (Eire)',                                // IE
    'Isle of Man',                                   // IM
    'Israel',                                        // IL
    'Italy',                                         // IT
    'Jamaica',                                       // JM
    'Japan',                                         // JP
    'Jersey',                                        // JE
    'Jordan',                                        // JO
    'Kazakhstan',                                    // KZ
    'Kenya',                                         // KE
    'Kiribati',                                      // KI
    'Korea, Democratic People''s Republic of (North)', // KP
    'Korea, Republic of (South)',                    // KR
    'Kuwait',                                        // KW
    'Kyrgyzstan',                                    // KG
    'Laos',                                          // LA
    'Latvia',                                        // LV
    'Lebanon',                                       // LB
    'Lesotho',                                       // LS
    'Liberia',                                       // LR
    'Libyan Arab Jamahiriya',                        // LY
    'Liechtenstein',                                 // LI
    'Lithuania',                                     // LT
    'Luxembourg',                                    // LU
    'Macao',                                         // MO
    'Macedonia, Republic of',                        // MK
    'Madagascar',                                    // MG
    'Malawi',                                        // MW
    'Malaysia',                                      // MY
    'Maldives',                                      // MV
    'Mali',                                          // ML
    'Malta',                                         // MT
    'Marshall Islands',                              // MH
    'Martinique',                                    // MQ
    'Mauritania',                                    // MR
    'Mauritius',                                     // MU
    'Mayotte',                                       // YT
    'Mexico',                                        // MX
    'Federated States of Micronesia',                // FM
    'Republic of Moldova',                           // MD
    'Monaco',                                        // MC
    'Mongolia',                                      // MN
    'Serbia-Montenegro (Yugoslavia)',                // ME
    'Montserrat',                                    // MS
    'Morocco',                                       // MA
    'Mozambique',                                    // MZ
    'Burma (Myanmar)',                               // MM
    'Namibia',                                       // NA
    'Nauru',                                         // NR
    'Nepal',                                         // NP
    'Netherlands',                                   // NL
    'Netherlands Antilles',                          // AN
    'New Caledonia',                                 // NC
    'New Zealand',                                   // NZ
    'Nicaragua',                                     // NI
    'Niger',                                         // NE
    'Nigeria',                                       // NG
    'Niue',                                          // NU
    'Norfolk Island',                                // NF
    'Northern Mariana Islands',                      // MP
    'Norway',                                        // NO
    'Oman',                                          // OM
    'Pakistan',                                      // PK
    'Palau',                                         // PW
    'Palestinian Territory, Occupied',               // PS
    'Panama',                                        // PA
    'Papua New Guinea',                              // PG
    'Paraguay',                                      // PY
    'Peru',                                          // PE
    'Philippines',                                   // PH
    'Pitcairn Island',                               // PN
    'Poland',                                        // PL
    'Portugal',                                      // PT
    'Puerto Rico',                                   // PR
    'Qatar',                                         // QA
    'Réunion',                                       // RE
    'Romania',                                       // RO
    'Russian Federation',                            // RU
    'Rwanda',                                        // RW
    'Saint Helena',                                  // SH
    'St. Christopher (St. Kitts) & Nevis',           // KN
    'Saint Lucia',                                   // LC
    'Saint Pierre & Miquelon',                       // PM
    'Saint Vincent & Grenadines',                    // VC
    'Western Samoa',                                 // WS
    'San Marino',                                    // SM
    'Sao Tome & Principe',                           // ST
    'Saudi Arabia',                                  // SA
    'Senegal',                                       // SN
    'Serbia',                                        // RS
    'Seychelles',                                    // SC
    'Sierra Leone',                                  // SL
    'Singapore',                                     // SG
    'Slovak Republic (Slovakia)',                    // SK
    'Slovenia',                                      // SI
    'Solomon Islands',                               // SB
    'Somalia',                                       // SO
    'South Africa',                                  // ZA
    'South Georgia and The South Sandwich Islands',  // GS
    'Spain',                                         // ES
    'Sri Lanka',                                     // LK
    'Sudan',                                         // SD
    'Suriname',                                      // SR
    'Svalbard and Jan Mayen',                        // SJ
    'Swaziland',                                     // SZ
    'Sweden',                                        // SE
    'Switzerland',                                   // CH
    'Syrian Arab Republic (Syria)',                  // SY
    'Taiwan, Province of China',                     // TW
    'Tajikistan',                                    // TJ
    'Tanzania, United Republic of',                  // TZ
    'Thailand',                                      // TH
    'Timor-Leste',                                   // TL
    'Togo',                                          // TG
    'Tokelau',                                       // TK
    'Tonga',                                         // TO
    'Trinidad & Tobago',                             // TT
    'Tunisia',                                       // TN
    'Turkey',                                        // TR
    'Turkmenistan',                                  // TM
    'Turks & Caicos Islands',                        // TC
    'Tuvalu',                                        // TV
    'Uganda',                                        // UG
    'Ukraine',                                       // UA
    'United Arab Emirates',                          // AE
    'Great Britain & Northern Ireland',              // GB
    'United States of America',                      // US
    'United States Minor Outlying Islands',          // UM
    'Uruguay',                                       // UY
    'Uzbekistan',                                    // UZ
    'Vanuatu',                                       // VU
    'Venezuela',                                     // VE
    'Viet Nam',                                      // VN
    'British Virgin Islands',                        // VG
    'Virgin Islands, U.S.',                          // VI
    'Wallis & Futuna Islands',                       // WF
    'Western Sahara',                                // EH
    'Yemen',                                         // YE
    'Zambia',                                        // ZM
    'Zimbabwe'                                       // ZW
   );

*)

{
 ** Country Listing from the U.S. Postal Service **
Afghanistan
Albania
Algeria
Andorra
Angola
Anguilla
Antigua & Barbuda
Argentina
Armenia
Aruba
Ascension
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bermuda
Bhutan
Bolivia
Bosnia-Herzegovina
Botswana
Brazil
British Virgin Islands
Brunei Darussalam
Bulgaria
Burkina Faso
Burma (Myanmar)
Burundi
Cambodia
Cameroon
Canada
Cape Verde
Cayman Islands
Central African Republic
Chad
Chile
China
Colombia
Comoros
Congo, Democratic Republic of the
Congo, Republic of the
Costa Rica
Cote d'Ivoire (Ivory Coast)
Croatia
Cuba
Cyprus
Czech Republic
Denmark
Djibouti
Dominica
Dominican Republic
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Ethiopia
Falkland Islands
Faroe Islands
Fiji
Finland
France
French Guiana
French Polynesia
Gabon
Gambia
Georgia, Republic of
Germany
Ghana
Gibraltar
Great Britain & Northern Ireland
Greece
Greenland
Grenada
Guadeloupe
Guatemala
Guinea
Guinea-Bissau
Guyana
Haiti
Honduras
Hong Kong
Hungary
Iceland
India
Indonesia
Iran
Iraq
Ireland (Eire)
Israel
Italy
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kiribati
Korea, Democratic People's Republic of (North)
Korea, Republic of (South)
Kuwait
Kyrgyzstan
Laos
Latvia
Lebanon
Lesotho
Liberia
Libya
Liechtenstein
Lithuania
Luxembourg
Macao
Macedonia, Republic of
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Marshall Islands
Martinique
Mauritania
Mauritius
Mexico
Micronesia
Moldova
Mongolia
Montserrat
Morocco
Mozambique
Namibia
Nauru
Nepal
Netherlands
Netherlands Antilles
New Caledonia
New Zealand
Nicaragua
Niger
Nigeria
Norway
Oman
Pakistan
Panama
Papua New Guinea
Paraguay
Peru
Philippines
Pitcairn Island
Poland
Portugal
Qatar
Reunion
Romania
Russia
Rwanda
St. Christopher (St. Kitts) & Nevis
Saint Helena
Saint Lucia
Saint Pierre & Miquelon
Saint Vincent & Grenadines
San Marino
Sao Tome & Principe
Saudi Arabia
Senegal
Serbia-Montenegro (Yugoslavia)
Seychelles
Sierra Leone
Singapore
Slovak Republic (Slovakia)
Slovenia
Solomon Islands
Somalia
South Africa
Spain
Sri Lanka
Sudan
Suriname
Swaziland
Sweden
Switzerland
Syrian Arab Republic (Syria)
Taiwan
Tajikistan
Tanzania
Thailand
Togo
Tonga
Trinidad & Tobago
Tristan da Cunha
Tunisia
Turkey
Turkmenistan
Turks & Caicos Islands
Tuvalu
Uganda
Ukraine
United Arab Emirates
Uruguay
Uzbekistan
Vanuatu
Vatican City
Venezuela
Vietnam
Wallis & Futuna Islands
Western Samoa
Yemen
Zambia
Zimbabwe



}
   StateAbbr_USA: array[0..58] of String =
   ('AL','AK','AS','AZ','AR','CA','CO','CT','DE','DC','FM','FL','GA','GU','HI',
    'ID','IL','IN','IA','KS','KY','LA','ME','MH','MD','MA','MI','MN','MS','MO',
    'MT','NE','NV','NH','NJ','NM','NY','NC','ND','MP','OH','OK','OR','PW','PA',
    'PR','RI','SC','SD','TN','TX','UT','VT','VI','VA','WA','WV','WI','WY');
   StateAbbr_USAMilitaryState: array[0..5] of String =
   ('AE','AA','AE','AE','AE','AP');
   StateAbbr_Canada: array[0..13] of String =
   ('AB','BC','MB','NB','NL','NT','NS','NU','ON','PE','QC','SK','YT', 'PQ');
   StateAbbr_Mexico: array[0..31] of String =
   ('AG','BC','BS','CH','CL','CM','CO','CS','DF','DG','GR','GT','HG','JA','MI',
    'MO','MX','NA','NL','OA','PU','QR','QT','SI','SL','SO','TB','TL','TM','VE',
    'YU','ZA');

   CurrencyCodes: array[0..45] of String =
   ('ANG','ARA','ARN','AWG','AUD','BHD','BBD','BMD','BRL','UKL','BND','CAD',
    'CHP','CNY','CYL','DKK','RDD','ECD','EGP','EUR','HKD','INR','JAD','JYE',
    'KUD','MOP','MYR','NMP','NTD','NZD','NOK','PKR','PHP','SAR','SID','ZAR',
    'WON','SEK','SFR','THB','TTD','TRL','DHS','UYP','USD','VEB');

   // Countries requiring a minimum Declared Value of $1
   CountriesRequiringDeclaredValue: array[0..26] of String =
   ('DZ','AU','BY','CA','CN','RS','ME','GE','ID','JP','KG','KR','KW','LY','MD',
    'MN','NP','NZ','PG','RO','RU','SI','SK','SV','TM','UZ','WS');

   EuropeanUnion: array[0..26] of String =
   ('AT','BE','BG','CY','CZ','DK','EE','FI','FR','DE','GR','HU','IE','IT','LV',
    'LT','LU','MT','NL','PL','PT','RO','SK','SI','ES','SE','GB');
    (* -------------------------------------------------------------------------
       *** European Union Summary ***
       Code                      Country
       ----                      -----------
       AT                        Austria
       BE                        Belgium
       BG                        Bulgaria
       CY                        Cyprus
       CZ                        Czech Republic
       DK                        Denmark
       EE                        Estonia
       FI                        Finland
       FR                        France
       DE                        Germany
       GR                        Greece
       HU                        Hungary
       IE                        Ireland
       IT                        Italy
       LV                        Latvia
       LT                        Lithuania
       LU                        Luxembourg
       MT                        Malta
       NL                        Netherlands
       PL                        Poland
       PT                        Portugal
       RO                        Romania
       SK                        Slovakia
       SI                        Slovenia
       ES                        Spain
       SE                        Sweden
       GB                        United Kingdom

    ------------------------------------------------------------------------- *)


implementation

uses
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  shipman_dc,
  IQMS.Common.Controls;

function CountryCodeFor(ACountryName: String;
 ACountryCodeType: TCountryCodeType): String;
begin

  // ** Returns shipping country code **
  // This codes are standard country codes across shippers.

  //AFound := FALSE; // initialize

  ACountryName := Trim(UpperCase(ACountryName));

  case ACountryCodeType of
  cctChr2:
    begin
      Result := SelectValueStrParam('select country_code.Get2CharCountryCode(:COUNTRY) from dual',
       ['COUNTRY'],[ACountryName]);
      if Result = '' then
         Result := SelectValueStrParam('select chr2 from v_country_codes ' +
           'where country like ''%%:COUNTRY%%'' and rownum < 2',
           ['COUNTRY'],[ACountryName]);
    end;
  cctChr3:
    begin
    Result := SelectValueStrParam('select country_code.Get3CharCountryCode(:COUNTRY) from dual',
      ['COUNTRY'],[ACountryName]);
      if Result = '' then
         Result := SelectValueStrParam('select chr3 from v_country_codes ' +
           'where country like ''%%:COUNTRY%%'' and rownum < 2',
           ['COUNTRY'],[ACountryName]);
    end;
  cctDigit3:
    begin
    Result := SelectValueStrParam('select country_code.Get3DigitCountryCode(:COUNTRY) from dual',
      ['COUNTRY'],[ACountryName]);
      if Result = '' then
         Result := SelectValueStrParam('select digit3 from v_country_codes ' +
           'where country like ''%%:COUNTRY%%'' and rownum < 2',
           ['COUNTRY'],[ACountryName]);
    end;
  end;

  Result := Trim(Result);

end;

function CountryNameFor(const ACountryCode: String): String;
var
   S: String;
begin
  S := Trim(UpperCase(ACountryCode));
  Result := SelectValueStrParam('select country_code.GetCountryNameFor(:COUNTRY) from dual', ['COUNTRY'],[S]);
end;

function USPS_CountryNameFor(const ACountryCode: String): String;
begin
end;

procedure LoadStateCodes(AComboBox: TUniComboBox; ACountryCode, ADefaultState: String);

  // ---------------------------------------------------------------------------
  procedure _LoadUSACodes;
  var i: Integer;
  begin
     for i := Low(StateAbbr_USA) to High(StateAbbr_USA) do
       AComboBox.Items.Add(StateAbbr_USA[i]);
     for i := Low(StateAbbr_USAMilitaryState) to High(StateAbbr_USAMilitaryState) do
       AComboBox.Items.Add(StateAbbr_USAMilitaryState[i]);
  end;
  // ---------------------------------------------------------------------------
  procedure _LoadCanadaCodes;
  var i: Integer;
  begin
     for i := Low(StateAbbr_Canada) to High(StateAbbr_Canada) do
       AComboBox.Items.Add(StateAbbr_Canada[i]);
  end;
  // ---------------------------------------------------------------------------
  procedure _LoadMexicoCodes;
  var i: Integer;
  begin
     for i := Low(StateAbbr_Mexico) to High(StateAbbr_Mexico) do
       AComboBox.Items.Add(StateAbbr_Mexico[i]);
     // AComboBox.Style := csDropDownList; // strict search
  end;
  // ---------------------------------------------------------------------------

var
   AIndex: Integer;
   AOnChange: TNotifyEvent;
begin

  try
     AOnChange := AComboBox.OnChange;
     AComboBox.OnChange := NIL;

     AComboBox.Items.BeginUpdate;
     AComboBox.Items.Clear;

     if ACountryCode = 'US' then
        begin
          //if AComboBox.Style <> csDropDownList then
          //   AComboBox.Style := csDropDownList; // strict search
          _LoadUSACodes;
        end
     else if ACountryCode = 'CA' then
        begin
          //if AComboBox.Style <> csDropDownList then
          //   AComboBox.Style := csDropDownList; // strict search
          _LoadCanadaCodes;
        end
     else if ACountryCode = 'MX' then
        begin
          //if AComboBox.Style <> csDropDownList then
          //   AComboBox.Style := csDropDownList; // strict search
          _LoadMexicoCodes;
        end
     else
        begin
         // if AComboBox.Style <> csDropDown then
         //    AComboBox.Style := csDropDown; // strict search
          {_LoadUSACodes;
          _LoadCanadaCodes;
          _LoadMexicoCodes; }
        end;

     if (ADefaultState > '') then
        begin
          AIndex := AComboBox.Items.IndexOf(Trim(ADefaultState));
          if AIndex > -1 then
             AComboBox.ItemIndex := AIndex;
        end;

  finally
     AComboBox.Items.EndUpdate;
     AComboBox.OnChange := AOnChange;
  end;
end;

function CountryHasState(const ACountryCode: String): Boolean;
begin
  Result := IQMS.Common.StringUtils.StrInList(ACountryCode, ['US','CA','MX']);
end;

procedure LoadCountryCodes(var AList: TStringList); overload;
var
  ASys_Country, ASys_2Char, ASys_3Char: string;
  ASys_3Digit: Integer;
  ASys_Found: Boolean;
begin
  IQMS.Common.Miscellaneous.IQGetCountryCode(ASys_Country, ASys_2Char, ASys_3Char, ASys_3Digit);
  ASys_Found := not IQMS.Common.StringUtils.IsEmpty(ASys_2Char);
  if ASys_Found then
    AList.Add(Format('%s=%s',[Trim(ASys_Country), Trim(ASys_2Char)]));
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add('SELECT a.chr2, a.chr3, a.digit3, a.country');
     SQL.Add('FROM v_country_codes a');
     SQL.Add('WHERE NVL(default_spelling,''N'') = ''Y'' ');
     SQL.Add('ORDER BY a.country');
     Open;
     while not EOF do
      begin
        if not ASys_Found or
          (ASys_Found and (CompareText(ASys_Country, FieldByName('COUNTRY').AsString) <> 0)) then
          AList.Add(Format('%s=%s',[Trim(FieldByName('COUNTRY').AsString), Trim(FieldByName('CHR2').AsString)]));
        Next;
      end;
  finally
     Free; // free TFDQuery
  end;
end;

procedure LoadCountryCodes(AComboBox: TUniDBComboBox; AMutliple: Boolean);
  // ---------------------------------------------------------------------------
  procedure _AddItem(ACountryName, ACountryCode: String);
  begin
    AComboBox.Items.Add(Format('%s'#9'%s',[ACountryName,ACountryCode]));
  end;
  // ---------------------------------------------------------------------------
var
   i: Integer;
   AList: TStringList;
   ALineText, ACountry, ACode: String;

   procedure _GetMapping;
   var
      i: Integer;
   begin
     i := Pos('=', ALineText);
     if i > 0 then
        begin
          ACountry := Copy(ALineText, 1, i - 1);
          ACode := Copy(ALineText, i + 1, 255);
        end;
   end;

begin
  if AComboBox = NIL then Exit;

  try
     AList := TStringList.Create;
     AComboBox.Items.BeginUpdate;
     AComboBox.Items.Clear;
     //AComboBox.MapList := TRUE;

     LoadCountryCodes(AList);

     // Add the "multiple" option
     if AMutliple then
        AComboBox.Items.Add('Multiple'#9'XX');

     for i := 0 to AList.Count - 1 do
        begin
          ALineText := AList.Strings[i];
          _GetMapping;
          _AddItem(ACountry, ACode);
        end;

     AComboBox.Sorted := False;

  finally
     AComboBox.Items.EndUpdate;
  end;
end;

procedure LoadCountryCodes(AComboBox: TUniComboBox); // overload method
  // ---------------------------------------------------------------------------
  procedure _AddItem(ACountryName, ACountryCode: String);
  var
     x: Integer;
  begin
    if (ACountryName = '') or (ACountryCode = '') then Exit;
    x := AComboBox.Items.Count;
    // TDataCargo is declared in shipman_dc.pas
    AComboBox.Items.AddObject(ACountryName, TDataCargo.Create(ACountryName,x,ACountryCode));
  end;
  // ---------------------------------------------------------------------------

var
   i: Integer;
   AList: TStringList;
   ALineText, ACountry, ACode: String;

   procedure _GetMapping;
   var
      i: Integer;
   begin
     i := Pos('=', ALineText);
     if i > 0 then
        begin
          ACountry := Copy(ALineText, 1, i - 1);
          ACode := Copy(ALineText, i + 1, 255);
        end;
   end;


begin
  if (AComboBox = NIL) then Exit;

  try
     AList := TStringList.Create;
     AComboBox.Items.BeginUpdate;
     AComboBox.Items.Clear;
     LoadCountryCodes(AList);

     for i := 0 to AList.Count - 1 do
        begin
          ALineText := AList.Strings[i];
          _GetMapping;
          _AddItem(ACountry, ACode);
        end;

     AComboBox.Sorted := TRUE;
  finally
     AComboBox.Items.EndUpdate;
  end;
end;

procedure LoadCountries(AComboBox: TUniDBComboBox; AMutliple: Boolean);
  // ---------------------------------------------------------------------------
  procedure _AddItem(ACountryName: String);
  begin
    AComboBox.Items.Add(Format('%s'#9'%s',[ACountryName,ACountryName]));
  end;
  // ---------------------------------------------------------------------------
var
   i: Integer;
   AList: TStringList;
   ALineText, ACountry: String;

   procedure _GetMapping;
   var
      i: Integer;
   begin
     i := Pos('=', ALineText);
     if i > 0 then
        begin
          ACountry := Copy(ALineText, 1, i - 1);
        end;
   end;

begin
  if AComboBox = NIL then Exit;

  try
     AList := TStringList.Create;
     AComboBox.Items.BeginUpdate;
     AComboBox.Items.Clear;
     //AComboBox.MapList := TRUE;

     LoadCountryCodes(AList);

     // Add the "multiple" option
     if AMutliple then
        AComboBox.Items.Add('Multiple');

     for i := 0 to AList.Count - 1 do
        begin
          ALineText := AList.Strings[i];
          _GetMapping;
          _AddItem(ACountry);
        end;

     AComboBox.Sorted := TRUE;

  finally
     AComboBox.Items.EndUpdate;
  end;
end;

procedure ParseFullName(const AFullName: String; var AFirstName, ALastName: String);
var
   AAdjustedFullName: String;
   i1, i2: Integer;
begin
  AAdjustedFullName := Trim(AFullName);

  if (AAdjustedFullName > '') then
     begin
        i1 := Pos(' ', AAdjustedFullName);  // find the space
        i2 := Pos(',', AAdjustedFullName);  // is there a comma? we dont' want last name, first name formats

        // no space or comma
        if (i1 <= 1) and (i2 <= 1) then
           begin
             AFirstName := AAdjustedFullName;
             ALastName := '';
           end

        // by comma
        else if (i2 > 1) then
           begin
             AFirstName := Trim(Copy(AAdjustedFullName, i2 + 1, Length(AAdjustedFullName)));
             ALastName := Trim(Copy(AAdjustedFullName, 1, i2-1));
           end

        // by space
        else if (i1 > 1) then
           begin
             AFirstName := Copy(AAdjustedFullName, 1, i1 - 1);
             ALastName := Copy(AAdjustedFullName, i1 + 1, Length(AAdjustedFullName));
           end;
     end;
end;

procedure ParseFullNameEx(const AFullName: String; var AFirstName,
 AMiddleName, ALastName: String);
const
  SPACE = ' ';
  COMMA = ',';
var
   AAdjustedFullName: String;
   i1, i2, spaceCount, commaCount: Integer;
begin
  AAdjustedFullName := Trim(AFullName);
  AMiddleName := '';

  if (AAdjustedFullName > '') then
     begin
        i1 := Pos(' ', AAdjustedFullName);  // find the space
        i2 := Pos(',', AAdjustedFullName);  // is there a comma? we dont' want last name, first name formats

        spaceCount := IQMS.Common.StringUtils.NumToken(AAdjustedFullName, SPACE);
        commaCount := IQMS.Common.StringUtils.NumToken(AAdjustedFullName, COMMA);

        // no space or comma
        if (i1 <= 1) and (i2 <= 1) then
           begin
             AFirstName := AAdjustedFullName;
             ALastName := '';
           end

        // by comma
        else if (i2 > 1) then
           begin
             // assume last name first, if a comma is used
             ALastName := Trim(Copy(AAdjustedFullName, 1, i2-1));
             AFirstName := Trim(Copy(AAdjustedFullName, i2 + 1, Length(AAdjustedFullName)));
             i1 := Pos(' ', AFirstName);
             if i1 > 0 then
                begin
                  commaCount := IQMS.Common.StringUtils.NumToken(AFirstName, COMMA);
                  AFirstName  := GetToken(AAdjustedFullName, ' ', 1);
                  AMiddleName := GetToken(AAdjustedFullName, ' ', 2);
                end;
           end

        // by space
        else if (i1 > 1) then
           case spaceCount of
             0..1: AFirstName := AAdjustedFullName;
             2: begin
                  AFirstName  := GetToken(AAdjustedFullName, ' ', 1);
                  ALastName   := GetToken(AAdjustedFullName, ' ', 2);
                end;
             3: begin
                  AFirstName  := GetToken(AAdjustedFullName, ' ', 1);
                  AMiddleName := GetToken(AAdjustedFullName, ' ', 2);
                  ALastName   := GetToken(AAdjustedFullName, ' ', 3);
                end;
             else
                begin
                  AFirstName := Copy(AAdjustedFullName, 1, i1 - 1);
                  ALastName := Copy(AAdjustedFullName, i1 + 1, Length(AAdjustedFullName));
                end;
           end; // end case
     end;
end;

end.
