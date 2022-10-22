unit IQMS.Common.Regional;
{ ** Regional Constants and Methods **

  This unit contains methods and constants for countries, states, and
  anything related to regional information.  Country lists are based
  on the view, V_COUNTRY_CODE, which is maintained based on the ISO list.

  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  Adding Country and State controls to a form (how to):

  1.  Add either a TComboBox or TDBComboBox for "Country."  The "Country"
  combo box must preceed the "State or Region" combo box.

  2.  Add either a TComboBox or TDBComboBox for "State or Region",
  after the "Country" combo box.

  3.  In the FormCreate event of the form (or constructor or statup method)
  load the list of countries as follows:

  // Load country list
  Regional.LoadCountries(cmbCountry);

  4.  In the OnChange event of the Country combo box, add the following
  line of code to load the "State" list:

  // Load state or region list for the selected country
  Regional.LoadStateCombo(cmbState,cmbCountry);

  You can also add this in the OnDataChange event, if it is more
  appropriate.  In any case, when the user changes the Country,
  load the State codes.  But do not add this line in the OnDropDown
  or OnChange event of the "State" combo box or an Access Violation
  may occur.

  4.  Finally, add an event that will validate the "State" code.
  In the BeforePost event of the dataset, call one of the overloaded
  methods for CheckClearStateCode.  For example:

  // Validate data entry for state
  Regional.CheckClearStateCode(Table1STATE, cmbState);

  5.  If you are using TDBComboBox controls, you will want to clean up
  memory usage to avoid memory leaks.  In the form's OnClose event, OnDestroy
  event or destructor, add the following:

  iqctrl.ClearComboBoxOfObjects(cmbState);
  iqctrl.ClearComboBoxOfObjects(cmbCountry);

  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------

}

interface

uses
  Winapi.Windows, System.Classes, System.SysUtils,
  Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,IQMS.Common.ResStrings,
  FireDAC.Comp.Client, FireDAC.Phys, UniCombobox, uniDBComboBox;

type
  TCountryCodeType = (cctChr2, cctChr3, cctDigit3);

type
  CountryNameString = string[20];

  /// <summary>Get a valid ISO country name for the given value</summary>
function GetValidCountryName(const ACountryName: string): string;

/// <summary>Get a valid country code for a country name</summary>
function CountryCodeFor(ACountryName: string;
  ACountryCodeType: TCountryCodeType = cctChr2): string;

/// <summary>Get a country name for a country code</summary>
function CountryNameFor(const ACountryCode: string): string;

/// <summary>Load state list into a TComboBox.</summary>
/// <comments>Called in TComboBox.OnDropDown. The ACountryComboBox
/// should already have been loaded using the procedure,
/// LoadCountries().</comments>
procedure LoadStateCombo(AStateComboBox: TUniComboBox;
  ACountryComboBox: TUniComboBox); overload;
/// <summary>Load state list into a TDBComboBox.</summary>
procedure LoadStateCombo(AStateComboBox: TUniDBComboBox;
  ACountryComboBox: TUniDBComboBox); overload;

//  /// <summary>Load state list into a TDBComboBox.</summary>
//  procedure LoadStateCombo(AStateComboBox: TwwDBComboBox;
//    ACountryComboBox: TwwDBComboBox); overload;

/// <summary>
/// Load state list into a TCustomComboBox for
/// the given 2-character country code (i.e., US, CA, or MX).
// The default state will be selected in the combo box.
/// </summary>
procedure LoadStateCodes(AComboBox: TUniCustomComboBox; ACountryCode: string = '';
  ADefaultState: string = ''); overload;

// procedure LoadStateCodes(AComboBox: TwwDBComboBox; ACountryCode: string = '';
//   ADefaultState: string = ''); overload;

// Load the list of state codes into a string list.
procedure LoadStateCodeList(ACountryCode: string; var AList: TStringList;
  var AStrictSearch: Boolean);

///<summary> Determine if country uses a regions list.
// Used for enabling/disabling of the state combo box </summary>
function CountryHasState(const ACountryCode: string): Boolean;

// The following load a list of countries.
/// <summary>Load country list</summary>
procedure LoadCountries(var AList: TStringList); overload;
procedure LoadCountries(AComboBox: TUniComboBox); overload;
procedure LoadCountries(AComboBox: TUniDBComboBox); overload;

// procedure LoadCountries(AComboBox: TwwDBComboBox); overload;
// Returns the 2-character country code based on the selected combo box.
// This is a "Country" combo box that has been populated by one of the
// foregoing LoadCountries() overload methods.
function ComboBoxCountryCode(AComboBox: TUniCustomComboBox): string;
// The following load country codes as a list.
procedure LoadCountryCodeMapList(var AList: TStringList;
  const ACountryCodeType: TCountryCodeType = cctChr2);
function IndexOfCountryCode(AComboBox: TUniComboBox; ACode: string): Integer;

procedure CheckClearStateCode(AStateField: TField;
  AStateComboBox: TUniComboBox); overload;
procedure CheckClearStateCode(AStateField: TField;
  AStateComboBox: TUniDBComboBox); overload;
procedure CheckClearStateCode(AStateField: TField;
  ACountryField: TField); overload;

// procedure CheckClearStateCode(AStateField: TField;
//   AStateComboBox: TwwDBComboBox); overload;

// Contact name parsing
procedure ParseFullName(const AFullName: string;
  var AFirstName, ALastName: string);
procedure ParseFullNameEx(const AFullName: string;
  var AFirstName, AMiddleName, ALastName: string);

const
  CountryCodeField: array [TCountryCodeType] of string = ('chr2', 'chr3',
    'digit3');

type
  CodeString = string[2];

  { TDataCargo }
  TCountryCargo = class
    Country: string;
    Code: CodeString;
    constructor Create(ACountry: string; ACode: CodeString);
  end;

const
  CountryCodesWithRegions: array [0 .. 21] of string = ('AR', 'AT', 'AU', 'BE',
    'BR', 'CA', 'CH', 'CN', 'CZ', 'DE', 'FR', 'GB', 'ID', 'IN', 'IT', 'KN',
    'MX', 'NL', 'SE', 'TH', 'US', 'VE');
  Regions_Argentina: array [0 .. 23] of string = ('Buenos Aires City',
    'Buenos Aires', 'Catamarca', 'Chaco', 'Chubut', 'Córdoba', 'Corrientes',
    'Entre Ríos', 'Formosa', 'Jujuy', 'La Pampa', 'La Rioja', 'Mendoza',
    'Misiones', 'Neuquén', 'Río Negro', 'Salta', 'San Juan', 'San Luis',
    'Santa Cruz', 'Santa Fe', 'Santiago del Estero', 'Tierra del Fuego',
    'Tucumán');
  Regions_Australia: array [0 .. 7] of string = ('ACT', 'NSW', 'NT', 'QLD',
    'SA', 'TAS', 'VIC', 'WA');
  Regions_Austria: array [0 .. 8] of string =
    (IQMS.Common.ResStrings.cTXT0000422 { 'Burgenland' } ,
    IQMS.Common.ResStrings.cTXT0000423 { 'Carinthia' ('Kärnten') } ,
    IQMS.Common.ResStrings.cTXT0000424 { 'Lower Austria' ('Niederösterreich') } ,
    IQMS.Common.ResStrings.cTXT0000425 { 'Upper Austria' ('Oberösterreich') } ,
    IQMS.Common.ResStrings.cTXT0000426 { 'Salzburg' } ,
    IQMS.Common.ResStrings.cTXT0000427 { 'Styria' ('Steiermark') } ,
    IQMS.Common.ResStrings.cTXT0000428 { 'Tyrol' ('Tirol') } ,
    IQMS.Common.ResStrings.cTXT0000429 { 'Vorarlberg' } ,
    IQMS.Common.ResStrings.cTXT0000430 { 'Vienna' ('Wien') } );
  Regions_Belgium: array [0 .. 9] of string =
    (IQMS.Common.ResStrings.cTXT0000431 { 'Antwerp' } ,
    IQMS.Common.ResStrings.cTXT0000432 { 'East Flanders' } ,
    IQMS.Common.ResStrings.cTXT0000433 { 'Flemish Brabant' } ,
    IQMS.Common.ResStrings.cTXT0000434 { 'Hainaut' } ,
    IQMS.Common.ResStrings.cTXT0000435 { 'Liège' } ,
    IQMS.Common.ResStrings.cTXT0000436 { 'Limburg' } ,
    IQMS.Common.ResStrings.cTXT0000437 { 'Luxembourg' } ,
    IQMS.Common.ResStrings.cTXT0000438 { 'Namur' } ,
    IQMS.Common.ResStrings.cTXT0000439 { 'Walloon Brabant' } ,
    IQMS.Common.ResStrings.cTXT0000440 { 'West Flanders' } );
  Regions_Brazil: array [0 .. 26] of string = ('Amazonas', 'Pará',
    'Mato Grosso', 'Minas Gerais', 'Bahia', 'Mato Grosso do Sul', 'Goiás',
    'Maranhão', 'Rio Grande do Sul', 'Tocantins', 'Piauí', 'São Paulo',
    'Rondônia', 'Roraima', 'Paraná', 'Acre', 'Ceará', 'Amapá', 'Pernambuco',
    'Santa Catarina', 'Paraíba', 'Rio Grande do Norte', 'Espírito Santo',
    'Rio de Janeiro', 'Alagoas', 'Sergipe', 'Distrito Federal');
  Regions_Canada: array [0 .. 12] of string = ('AB', 'BC', 'MB', 'NB', 'NL',
    'NT', 'NS', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT');
  Regions_China: array [0 .. 32] of string = ('Anhui', 'Beijing', 'Chongqing',
    'Fujian', 'Gansu', 'Guangdong', 'Guangxi', 'Guizhou', 'Hainan', 'Hebei',
    'Heilongjiang', 'Henan', 'Hong Kong', 'Hubei', 'Hunan', 'Inner Mongolia',
    'Jiangsu', 'Jiangxi', 'Jilin', 'Liaoning', 'Macau', 'Ningxia', 'Qinghai',
    'Shandong', 'Shanghai', 'Shanxi', 'Shanxi', 'Sichuan', 'Tianjin', 'Tibet',
    'Xinjiang', 'Yunnan', 'Zhejiang');
  Regions_China_Unicode: array [0 .. 32] of string = ('北京(Beijing)',
    '天津 (Tianjin)', '河北 (Hebei)', '山西 (Shanxi)', '内蒙 (Neimeng)',
    '辽宁 (Liaoning)', '吉林 (Jilin)', '黑龙江 (Heilongj)', '上海 (Shanghai)',
    '江苏 (Jiangsu)', '浙江 (Zhejiang)', '安徽 (Anhui)', '福建 (Fujian)',
    '江西 (Jiangxi)', '山东 (Shandong)', '河南 (Henan)', '湖北 (Hubei)', '湖南 (Hunan)',
    '广东 (Guangdong)', '广西 (Guangxi)', '海南 (Hainan)', '重庆 (Chongqing)',
    '四川 (Sichuan)', '贵州 (Guizhou)', '云南 (Yunnan)', '西藏 (Tibet)', '陕西 (Shanxi)',
    '甘肃 (Gansu)', '青海 (Qinghai)', '宁夏 (Ningxia)', '新疆 (Xinjiang)',
    '香港 (Hong Kong)', '澳门 (Macau)');
  Regions_CzechRepublic: array [0 .. 6] of string = ('Hlavní mesto Praha',
    'Jizní Cechy', 'Jizní Morava', 'Severní Cechy', 'Severní Morava',
    'Východní Cechy', 'Zapadní Cechy');
  Regions_France: array [0 .. 20] of string = ('Alsace', 'Aquitaine',
    'Auvergne', 'Bretagne', 'Bourgogne', 'Centre', 'Champagne-Ardenne',
    'Franche-Comté', 'Île-de-France', 'Languedoc-Roussillon', 'Limousin',
    'Lorraine', 'Basse-Normandie', 'Midi-Pyrénées', 'Nord-Pas-de-Calais',
    'Pays de la Loire', 'Picardie', 'Poitou-Charentes',
    'Provence-Alpes-Côte d''Azur', 'Rhône-Alpes', 'Haute-Normandie');
  Regions_Germany: array [0 .. 15] of string = ('Baden-Württemberg', 'Bayern',
    'Berlin', 'Brandenburg', 'Bremen', 'Hamburg', 'Hessen',
    'Mecklenburg-Vorpommern', 'Niedersachsen', 'Nordrhein-Westfalen',
    'Rheinland-Pfalz', 'Saarland', 'Sachsen', 'Sachsen-Anhalt',
    'Schleswig-Holstein', 'Thüringen');
  Regions_GreatBritain: array [0 .. 127] of string = ('Aberdeenshire',
    'Alderney', 'Anglesey', 'Angus', 'Aontroim', 'Argyllshire', 'Avon',
    'Ayrshire', 'Banffshire', 'Bedfordshire', 'Berkshire', 'Berwickshire',
    'Borders', 'Breconshire', 'Buckinghamshire', 'Bute', 'Caernarvonshire',
    'Caithness', 'Cambridgeshire', 'Cardiganshire', 'Carmarthenshire',
    'Central', 'Cheshire', 'Clackmannanshire', 'Cleveland', 'Clwyd',
    'Co. Antrim', 'Co. Armagh', 'Co. Down', 'Co. Durham', 'Co. Fermanagh',
    'Co. Londonderry', 'Co. Tyrone', 'Cornwall', 'Cumberland', 'Cumbria',
    'Denbighshire', 'Derbyshire', 'Devon', 'Dorset', 'Dumfries & Galloway',
    'Dumfries-shire', 'Dunbartonshire', 'Dyfed', 'E. Lothian', 'E. Sussex',
    'E. Yorkshire', 'Essex', 'Fife', 'Flintshire', 'Glamorgan',
    'Gloucestershire', 'Grampian', 'Greater Manchester', 'Guernsey', 'Gwent',
    'Gwynedd', 'Hampshire', 'Hereford & Worcester', 'Herefordshire',
    'Hertfordshire', 'Highland', 'Humberside', 'Huntingdonshire',
    'Inverness-shire', 'Isle of Wight', 'Jersey', 'Kent', 'Kincardineshire',
    'Kinross-shire', 'Kirkcudbrightshire', 'Lanarkshire', 'Lancashire',
    'Leicestershire', 'Lincolnshire', 'Lothian', 'Merionethshire', 'Merseyside',
    'Mid Glamorgan', 'Midlothian', 'Monmouthshire', 'Montgomeryshire',
    'Morayshire', 'N. Yorkshire', 'Nairn', 'Norfolk', 'Northamptonshire',
    'Northumberland', 'Nottinghamshire', 'Orkney', 'Oxfordshire',
    'Peebles-shire', 'Pembrokeshire', 'Perth', 'Powys', 'Radnorshire',
    'Renfrewshire', 'Ross & Cromarty', 'Roxburghshire', 'Rutland',
    'S. Glamorgan', 'S. Yorkshire', 'Sark', 'Selkirkshire', 'Shetland',
    'Shropshire', 'Somerset', 'Staffordshire', 'Stirlingshire', 'Strathclyde',
    'Suffolk', 'Surrey', 'Sussex', 'Sutherland', 'Tayside', 'Tyne & Wear',
    'W. Glamorgan', 'W. Lothian', 'W. Midlands', 'W. Sussex', 'W. Yorkshire',
    'Warwickshire', 'Western Isles', 'Westmorland', 'Wigtownshire', 'Wiltshire',
    'Worcestershire', 'Yorkshire');
  Regions_Ireland: array [0 .. 25] of string = ('Carlow', 'Cavan', 'Clare',
    'Cork', 'Donegal', 'Dublin', 'Galway', 'Kerry', 'Kildare', 'Kilkenny',
    'Laois', 'Leitrim', 'Limerick', 'Longford', 'Louth', 'Mayo', 'Meath',
    'Monaghan', 'Offaly', 'Roscommon', 'Sligo', 'Tipperary', 'Waterford',
    'Westmeath', 'Wexford', 'Wicklow');
  Regions_India: array [0 .. 34] of string = ('AP', 'AR', 'AS', 'BR', 'CT',
    'GA', 'GJ', 'HR', 'HP', 'JK', 'JH', 'KA', 'KL', 'MP', 'MH', 'MN', 'ML',
    'MZ', 'NL', 'OR', 'PB', 'RJ', 'SK', 'TN', 'TR', 'UT', 'UP', 'WB', 'AN',
    'CH', 'DN', 'DD', 'DL', 'LD', 'PY');
  Regions_Indonesia: array [0 .. 32] of string = ('Aceh', 'Bali',
    'Bangka-Belitung', 'Banten', 'Bengkulu', 'Central Java',
    'Central Kalimantan', 'Central Sulawesi', 'E. Java', 'E. Kalimantan',
    'E. Nusa Tenggara', 'Gorontalo', 'Jakarta', 'Jambi', 'Lampung', 'Maluku',
    'N. Maluku', 'N. Sulawesi', 'N. Sumatra', 'Papua', 'Riau', 'Riau Islands',
    'S.E. Sulawesi', 'S. Kalimantan', 'S. Sulawesi', 'S. Sumatra', 'W. Java',
    'W. Kalimantan', 'W. Nusa Tenggara', 'W. Papua', 'W. Sulawesi',
    'W. Sumatra', 'Yogyakarta');
  Regions_Italy: array [0 .. 19] of string = ('Abruzzo', 'Aosta Valley',
    'Apulia', 'Basilicata', 'Calabria', 'Campania', 'Emilia-Romagna',
    'Friuli-Venezia', 'Lazio', 'Liguria', 'Lombardy', 'Marche', 'Molise',
    'Piedmont', 'Sardinia', 'Sicily', 'Trentino-Alto Adige', 'Tuscany',
    'Umbria', 'Veneto');
  Regions_Mexico: array [0 .. 31] of string = ('AG', 'BC', 'BS', 'CH', 'CL',
    'CM', 'CO', 'CS', 'DF', 'DG', 'GR', 'GT', 'HG', 'JA', 'MI', 'MO', 'MX',
    'NA', 'NL', 'OA', 'PU', 'QR', 'QT', 'SI', 'SL', 'SO', 'TB', 'TL', 'TM',
    'VE', 'YU', 'ZA');
  Regions_Netherlands: array [0 .. 11] of string = ('Drenthe', 'Flevoland',
    'Friesland', 'Gelderland', 'Groningen', 'Limburg', 'N. Brabant',
    'N. Holland', 'Overijssel', 'S. Holland', 'Utrecht', 'Zeeland');
  Regions_Portugal: array [0 .. 19] of string = ('Aveiro', 'Azores', 'Beja',
    'Braga', 'Bragança', 'Castelo Branco', 'Coimbra', 'Évora', 'Faro', 'Guarda',
    'Leiria', 'Lisboa', 'Madeira', 'Portalegre', 'Porto', 'Santarém', 'Setúbal',
    'Viana do Castelo', 'Vila Real', 'Viseu');
  Regions_PuertoRico: array [0 .. 77] of string = ('Adjuntas', 'Aguada',
    'Aguadilla', 'Aguas Buenas', 'Aibonito', 'Añasco', 'Arecibo', 'Arroyo',
    'Barceloneta', 'Barranquitas', 'Bayamón', 'Cabo Rojo', 'Caguas', 'Camuy',
    'Canóvanas', 'Carolina', 'Cataño', 'Cayey', 'Ceiba', 'Ciales', 'Cidra',
    'Coamo', 'Comerío', 'Corozal', 'Culebra', 'Dorado', 'Fajardo', 'Florida',
    'Guánica', 'Guayama', 'Guayanilla', 'Guaynabo', 'Gurabo', 'Hatillo',
    'Hormigueros', 'Humacao', 'Isabela', 'Jayuya', 'Juana Díaz', 'Juncos',
    'Lajas', 'Lares', 'Las Marías', 'Las Piedras', 'Loíza', 'Luquillo',
    'Manatí', 'Maricao', 'Maunabo', 'Mayagüez', 'Moca', 'Morovis', 'Naguabo',
    'Naranjito', 'Orocovis', 'Patillas', 'Peñuelas', 'Ponce', 'Quebradillas',
    'Rincón', 'Río Grande', 'Sabana Grande', 'Salinas', 'San Germán',
    'San Juan', 'San Lorenzo', 'San Sebastián', 'Santa Isabel', 'Toa Alta',
    'Toa Baja', 'Trujillo Alto', 'Utuado', 'Vega Alta', 'Vega Baja', 'Vieques',
    'Villalba', 'Yabucoa', 'Yauco');
  Regions_SaintKittsAndNevis: array [0 .. 1] of string = ('St. Kitts', 'Nevis');
  Regions_Sweden: array [0 .. 24] of string = ('Ångermanland', 'Blekinge',
    'Bohuslän', 'Dalarna', 'Dalsland', 'Gotland', 'Gästrikland', 'Halland',
    'Hälsingland', 'Härjedalen', 'Jämtland', 'Lappland', 'Medelpad',
    'Norrbotten', 'Närke', 'Öland', 'Östergötland', 'Skåne', 'Småland',
    'Södermanland', 'Uppland', 'Värmland', 'Västmanland', 'Västerbotten',
    'Västergötland');
  Regions_Switzerland: array [0 .. 25] of string = ('AG', 'AI', 'AR', 'BE',
    'BL', 'BS', 'FR', 'GE', 'GL', 'GR', 'JU', 'LU', 'NE', 'NW', 'OW', 'SG',
    'SH', 'SO', 'SZ', 'TG', 'TI', 'UR', 'VD', 'VS', 'ZG', 'ZH');
  Regions_Thailand: array [0 .. 76] of string = ('Amnat Charoen', 'Ang Thong',
    'Bangkok', 'Bueng Kan', 'Buriram', 'Chachoengsao', 'Chainat', 'Chaiyaphum',
    'Chanthaburi', 'Chiang Mai', 'Chiang Rai', 'Chonburi', 'Chumphon',
    'Kalasin', 'Kamphaeng Phet', 'Kanchanaburi', 'Khon Kaen', 'Krabi',
    'Lampang', 'Lamphun', 'Loei', 'Lopburi', 'Mae Hong Son', 'Maha Sarakham',
    'Mukdahan', 'Nakhon Nayok', 'Nakhon Pathom', 'Nakhon Phanom',
    'Nakhon Ratchasima', 'Nakhon Sawan', 'Nakhon Si Thammarat', 'Nan',
    'Narathiwat', 'Nong Bua Lamphu', 'Nong Khai', 'Nonthaburi', 'Pathum Thani',
    'Pattani', 'Phang Nga', 'Phatthalung', 'Phayao', 'Phetchabun',
    'Phetchaburi', 'Phichit', 'Phitsanulok', 'Phra Nakhon Si Ayutthaya',
    'Phrae', 'Phuket', 'Prachinburi', 'Prachuap Khiri Khan', 'Ranong',
    'Ratchaburi', 'Rayong', 'Roi Et', 'Sa Kaeo', 'Sakon Nakhon', 'Samut Prakan',
    'Samut Sakhon', 'Samut Songkhram', 'Saraburi', 'Satun', 'Sing Buri',
    'Sisaket', 'Songkhla', 'Sukhothai', 'Suphan Buri', 'Surat Thani', 'Surin',
    'Tak', 'Trang', 'Trat', 'Ubon Ratchathani', 'Udon Thani', 'Uthai Thani',
    'Uttaradit', 'Yala', 'Yasothon');
  Regions_USA: array [0 .. 58] of string = ('AK', 'AL', 'AR', 'AS', 'AZ', 'CA',
    'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL',
    'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP',
    'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK',
    'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VI',
    'VT', 'WA', 'WI', 'WV', 'WY');
  Regions_USAMilitaryState: array [0 .. 5] of string = ('AE', 'AA', 'AE', 'AE',
    'AE', 'AP');
  Regions_Venezuela: array [0 .. 24] of string = ('Amazonas', 'Anzoátegui',
    'Apure', 'Aragua', 'Barinas', 'Bolívar', 'Carabobo', 'Caracas', 'Cojedes',
    'Delta Amacuro', 'Dependencias Federales', 'Falcón', 'Guárico', 'Lara',
    'Mérida', 'Miranda', 'Monagas', 'Nueva Esparta', 'Portuguesa', 'Sucre',
    'Táchira', 'Trujillo', 'Vargas', 'Yaracuy', 'Zulia');
  CurrencyCodes: array [0 .. 45] of string = ('ANG', 'ARA', 'ARN', 'AWG', 'AUD',
    'BHD', 'BBD', 'BMD', 'BRL', 'UKL', 'BND', 'CAD', 'CHP', 'CNY', 'CYL', 'DKK',
    'RDD', 'ECD', 'EGP', 'EUR', 'HKD', 'INR', 'JAD', 'JYE', 'KUD', 'MOP', 'MYR',
    'NMP', 'NTD', 'NZD', 'NOK', 'PKR', 'PHP', 'SAR', 'SID', 'ZAR', 'WON', 'SEK',
    'SFR', 'THB', 'TTD', 'TRL', 'DHS', 'UYP', 'USD', 'VEB');
  // Countries requiring a minimum Declared Value of $1
  CountriesRequiringDeclaredValue: array [0 .. 26] of string = ('DZ', 'AU',
    'BY', 'CA', 'CN', 'RS', 'ME', 'GE', 'ID', 'JP', 'KG', 'KR', 'KW', 'LY',
    'MD', 'MN', 'NP', 'NZ', 'PG', 'RO', 'RU', 'SI', 'SK', 'SV', 'TM',
    'UZ', 'WS');
  EuropeanUnion: array [0 .. 26] of string = ('AT', 'BE', 'BG', 'CY', 'CZ',
    'DK', 'EE', 'FI', 'FR', 'DE', 'GR', 'HU', 'IE', 'IT', 'LV', 'LT', 'LU',
    'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SE', 'GB');
  CountriesRequiringStrictStateList: array [0 .. 3] of string = ('US', 'MX',
    'CA', 'AU');

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
  IQMs.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

function GetValidCountryName(const ACountryName: string): string;
begin
  Result := '';
  if Trim(ACountryName) > '' then
    Result := SelectValueStrParam(
      'select country_code.getvalidcountryname(:COUNTRY) from dual',
      ['COUNTRY'], [Trim(FixStr(ACountryName))]);
end;

function CountryCodeFor(ACountryName: string;
  ACountryCodeType: TCountryCodeType): string;
begin
  // ** Returns shipping country code **
  // This codes are standard country codes across shippers.
  Result := '';
  ACountryName := Trim(UpperCase(ACountryName));
  if ACountryName > '' then
    case ACountryCodeType of
      cctChr2:
        begin
          Result := SelectValueStrParam(
            'select country_code.Get2CharCountryCode(:COUNTRY) from dual',
            ['COUNTRY'], [ACountryName]);
          if Result = '' then
            Result := SelectValueStrParam(
              'select chr2 from v_country_codes ' +
              'where country like ''%%:COUNTRY%%'' and rownum < 2', ['COUNTRY'],
              [ACountryName]);
        end;
      cctChr3:
        begin
          Result := SelectValueStrParam(
            'select country_code.Get3CharCountryCode(:COUNTRY) from dual',
            ['COUNTRY'], [ACountryName]);
          if Result = '' then
            Result := SelectValueStrParam('select chr3 from v_country_codes ' +
              'where country like ''%%:COUNTRY%%'' and rownum < 2', ['COUNTRY'],
              [ACountryName]);
        end;
      cctDigit3:
        begin
          Result := SelectValueStrParam(
            'select country_code.Get3DigitCountryCode(:COUNTRY) from dual',
            ['COUNTRY'], [ACountryName]);
          if Result = '' then
            Result := SelectValueStrParam(
              'select digit3 from v_country_codes ' +
              'where country like ''%%:COUNTRY%%'' and rownum < 2', ['COUNTRY'],
              [ACountryName]);
        end;
    end;
  Result := Trim(Result);
end;

function CountryNameFor(const ACountryCode: string): string;
var
  AModCountryCode: string;
begin
  Result := '';
  AModCountryCode := Trim(UpperCase(ACountryCode));
  if AModCountryCode > '' then
    begin
      Result := SelectValueStrParam(
        'select country_code.GetCountryNameFor(:COUNTRY) from dual',
        ['COUNTRY'],
        [AModCountryCode]);
    end;
end;

procedure LoadStateCombo(AStateComboBox: TUniComboBox;
  ACountryComboBox: TUniComboBox);
var
  i: Integer;
  ACode, AState: string;
begin
  if not Assigned(AStateComboBox) or not Assigned(ACountryComboBox) or
    (ACountryComboBox.Items.Count = 0) then
    Exit;
  i := AStateComboBox.ItemIndex;
  if i > - 1 then
    AState := AStateComboBox.Items.Strings[i];
  if ACountryComboBox.ItemIndex > -1 then
    ACode:= ComboBoxCountryCode(ACountryComboBox);
  LoadStateCodes(AStateComboBox, ACode, AState);
end;

procedure LoadStateCombo(AStateComboBox: TUniDBComboBox;
  ACountryComboBox: TUniDBComboBox);
var
  i: Integer;
  ACountry, ACountryCode, AState: string;
begin
  // Initialization
  i := - 1;
  ACountryCode := '';
  AState := '';
  // Validation
  if not Assigned(AStateComboBox) or not Assigned(ACountryComboBox) or
    (ACountryComboBox.Items.Count = 0) then
    Exit;
  // Get current state
  if Assigned(AStateComboBox.Field) then
    AState := AStateComboBox.Field.AsString;
  if (AState = '') then
    begin
      i := AStateComboBox.ItemIndex;
      if i > - 1 then
        AState := AStateComboBox.Items.Strings[i];
    end;

  // Get current country
  ACountry := ACountryComboBox.Text;
  i := ACountryComboBox.ItemIndex;
  if (i > - 1) and Assigned(ACountryComboBox.Items.Objects[i]) then
    ACountryCode := TCountryCargo(ACountryComboBox.Items.Objects[i]).Code;
  // 03/28/2011
  if (ACountryCode = '') and (ACountry > '') then
    ACountryCode := CountryCodeFor(ACountry);
  // Load the state codes for the country
  LoadStateCodes(AStateComboBox, ACountryCode, AState);
end;

//procedure LoadStateCombo(AStateComboBox: TwwDBComboBox;
//  ACountryComboBox: TwwDBComboBox); overload;
//var
//  i: Integer;
//  ACountry, ACountryCode, AState: string;
//begin
//  // Initialization
//  i := - 1;
//  ACountryCode := '';
//  AState := '';
//  // Validation
//  if not Assigned(AStateComboBox) or not Assigned(ACountryComboBox) or
//    (ACountryComboBox.Items.Count = 0) then
//    Exit;
//  // Get current state
//  if Assigned(AStateComboBox.Field) then
//    AState := AStateComboBox.Field.AsString;
//  if (AState = '') then
//    begin
//      i := AStateComboBox.ItemIndex;
//      if i > - 1 then
//        AState := AStateComboBox.Items.Strings[i];
//    end;
//
//  // Get current country
//  ACountry := ACountryComboBox.Text;
//  i := ACountryComboBox.ItemIndex;
//  if (i > - 1) and Assigned(ACountryComboBox.Items.Objects[i]) then
//    ACountryCode := TCountryCargo(ACountryComboBox.Items.Objects[i]).Code;
//  // 03/28/2011
//  if (ACountryCode = '') and (ACountry > '') then
//    ACountryCode := CountryCodeFor(ACountry);
//  // Load the state codes for the country
//  LoadStateCodes(AStateComboBox, ACountryCode, AState);
//end;

procedure LoadStateCodeList(ACountryCode: string; var AList: TStringList;
  var AStrictSearch: Boolean);

  procedure _LoadCodes(const AArray: array of string);
  var
    i: Integer;
  begin
    // add array content
    for i := low(AArray) to high(AArray) do
      if AList.IndexOf(AArray[i]) = - 1 then
        AList.Add(AArray[i]);
  end;

begin
  // Initialization
  AStrictSearch := False;
  // Validation
  if not Assigned(AList) then
    Exit;
  // Build the list
  try
    AList.Clear;
    // 07/24/2012 If there is no country code assigned,
    // then use the system country code.
    if Trim(ACountryCode) = '' then
      ACountryCode := IQGetCountryCode_2Char;
    { Note:  Other countries support states, regions, and provinces.
      but because of address format, it may not be correct to
      surface the abbreviation.  The countries are included below,
      but have been commented until requested. }
    if ACountryCode = 'AR' then
      begin
        _LoadCodes(Regions_Argentina);
      end
    else if ACountryCode = 'AU' then
      begin
        _LoadCodes(Regions_Australia);
      end
    else if ACountryCode = 'AT' then
      begin
        _LoadCodes(Regions_Austria);
      end
    else if ACountryCode = 'BE' then
      begin
        _LoadCodes(Regions_Belgium);
      end
    else if ACountryCode = 'BR' then
      begin
        _LoadCodes(Regions_Brazil);
      end
    else if ACountryCode = 'CA' then
      begin
        _LoadCodes(Regions_Canada);
      end
    else if ACountryCode = 'CN' then
      begin
        // 08/20/2013 Ensured that only Chinese databases actually use
        // the Chinese characters.  Do not test for Unicode.
        if (Pos('CHINESE', GetOracleLanguage) > 0) and
           (CompareText('CHINA', GetOracleTerritory) = 0) then
          _LoadCodes(Regions_China_Unicode)
        else
          _LoadCodes(Regions_China);
      end
    else if ACountryCode = 'CZ' then
      begin
        _LoadCodes(Regions_CzechRepublic);
      end
    else if ACountryCode = 'DE' then
      begin
        _LoadCodes(Regions_Germany);
      end
    else if ACountryCode = 'FR' then
      begin
        _LoadCodes(Regions_France);
      end
    else if ACountryCode = 'GB' then
      begin
        _LoadCodes(Regions_GreatBritain);
      end
    else if ACountryCode = 'ID' then
      begin
        _LoadCodes(Regions_Indonesia);
      end
    else if ACountryCode = 'IN' then
      begin
        _LoadCodes(Regions_India);
      end
    else if ACountryCode = 'IE' then
      begin
        _LoadCodes(Regions_Ireland);
      end
    else if ACountryCode = 'IT' then
      begin
        _LoadCodes(Regions_Italy);
      end
    else if ACountryCode = 'MX' then
      begin
        _LoadCodes(Regions_Mexico);
      end
    else if ACountryCode = 'NL' then
      begin
        _LoadCodes(Regions_Netherlands);
      end
    else if ACountryCode = 'PT' then
      begin
        _LoadCodes(Regions_Portugal);
      end
    else if ACountryCode = 'PR' then
      begin
        _LoadCodes(Regions_PuertoRico);
      end
    else if ACountryCode = 'KN' then
      begin
        _LoadCodes(Regions_SaintKittsAndNevis);
      end
    else if ACountryCode = 'SE' then
      begin
        _LoadCodes(Regions_Sweden);
      end
    else if ACountryCode = 'CH' then
      begin
        _LoadCodes(Regions_Switzerland);
      end
    else if ACountryCode = 'TH' then
      begin
        _LoadCodes(Regions_Thailand);
      end
    else if ACountryCode = 'US' then
      begin
        _LoadCodes(Regions_USA);
        _LoadCodes(Regions_USAMilitaryState);
      end
    else if ACountryCode = 'VE' then
      begin
        _LoadCodes(Regions_Venezuela);
      end;
  finally
    AList.Sort;
  end;
  // 07/27/2012 Enforce "strict search" only for these
  // country codes.
  AStrictSearch := StrInList(ACountryCode,
    CountriesRequiringStrictStateList);

end;

procedure LoadStateCodes(AComboBox: TUniCustomComboBox;
  ACountryCode, ADefaultState: string);
var
  AIndex: Integer;
  AOnChange: TNotifyEvent;
  AList: TStringList;
  AStrictSearch: Boolean;
begin
  // Initialization
  AStrictSearch := False;
  AOnChange := nil;
  AIndex := - 1;
  // Create temp string list
  AList := TStringList.Create;
  try
    // Prepare combo box
    if AComboBox is TUniComboBox then
      with TUniComboBox(AComboBox) do
        begin
          AOnChange := OnChange;
          OnChange := nil;
        end
    else if AComboBox is TUniDBComboBox then
      with TUniDBComboBox(AComboBox) do
        begin
          AOnChange := OnChange;
          OnChange := nil;
        end;
    AComboBox.Items.BeginUpdate;
    try
      // 10/12/2011 Must clear objects first to avoid memory leaks
      ClearComboBoxOfObjects(AComboBox);
      // Popuplate string list with state codes (see above).  The list
      // will be sorted.
      LoadStateCodeList(ACountryCode, { var } AList, { var } AStrictSearch);
      // Load combo box
      AComboBox.Items.Assign(AList);
      // Restrict to list
      if AComboBox is TUniComboBox then
        with TUniComboBox(AComboBox) do
          if AStrictSearch then
            Style := csDropDownList
          else
            Style := csDropDown
      else if AComboBox is TUniDBComboBox then
        with TUniDBComboBox(AComboBox) do
          if AStrictSearch then
            Style := csDropDownList
          else
            Style := csDropDown;

      // Set focus on the default state
      if (ADefaultState > '') then
        begin
          AIndex := AComboBox.Items.IndexOf(Trim(ADefaultState));
          if AStrictSearch and (AIndex > - 1) then
            AComboBox.ItemIndex := AIndex
          else if not AStrictSearch then
            begin
              if AComboBox is TUniComboBox then
                TUniComboBox(AComboBox).Text := ADefaultState
              else if AComboBox is TUniDBComboBox then
                TUniDBComboBox(AComboBox).Text := ADefaultState;
            end;
        end;
    finally
      AComboBox.Items.EndUpdate;
      if AComboBox is TUniComboBox then
        with TUniComboBox(AComboBox) do
          OnChange := AOnChange
      else if AComboBox is TUniDBComboBox then
        with TUniDBComboBox(AComboBox) do
          OnChange := AOnChange;
    end;
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

//procedure LoadStateCodes(AComboBox: TwwDBComboBox;
//  ACountryCode, ADefaultState: string);
//var
//  AIndex: Integer;
//  AOnChange: TNotifyEvent;
//  AList: TStringList;
//  AStrictSearch: Boolean;
//begin
//  // Initialization
//  AStrictSearch := False;
//  AOnChange := nil;
//  AIndex := - 1;
//  // Create temp string list
//  AList := TStringList.Create;
//  try
//    // Prepare combo box
//    AOnChange := AComboBox.OnChange;
//    try
//      AComboBox.OnChange := nil;
//      AComboBox.Items.BeginUpdate;
//      // 10/12/2011 Must clear objects first to avoid memory leaks
//      iqctrl.ClearWwComboBoxOfObjects(AComboBox);
//      // Popuplate string list with state codes (see above).  The list
//      // will be sorted.
//      LoadStateCodeList(ACountryCode, { var } AList, { var } AStrictSearch);
//      // Load combo box
//      AComboBox.Items.Assign(AList);
//      // Restrict to list
//      with AComboBox do
//        if AStrictSearch then
//          Style := csDropDownList
//        else
//          Style := csDropDown;
//
//      // Set focus on the default state
//      if (ADefaultState > '') then
//        begin
//          AIndex := AComboBox.Items.IndexOf(Trim(ADefaultState));
//          if AStrictSearch and (AIndex > - 1) then
//            AComboBox.ItemIndex := AIndex
//          else if not AStrictSearch then
//            AComboBox.Text := ADefaultState;
//        end;
//    finally
//      AComboBox.Items.EndUpdate;
//      AComboBox.OnChange := AOnChange;
//    end;
//  finally
//    if Assigned(AList) then
//      FreeAndNil(AList);
//  end;
//end;

function CountryHasState(const ACountryCode: string): Boolean;
begin
  // Result := iqstring.StrInList(ACountryCode, ['US', 'CA', 'MX']);
  Result := StrInList(ACountryCode, CountryCodesWithRegions);
end;

procedure LoadCountryCodeMapList(var AList: TStringList;
  const ACountryCodeType: TCountryCodeType);
var
  AField: string;
begin
  AField := CountryCodeField[ACountryCodeType];
  with TFDQuery.Create(nil) do
    try
      ConnectionName := 'IQFD';
      SQL.Add('SELECT a.country, a.chr2, a.chr3, a.digit3');
      SQL.Add('FROM v_country_codes a');
      SQL.Add('WHERE NVL(default_spelling,''N'') = ''Y'' ');
      SQL.Add('ORDER BY a.country');
      Open;
      while not EOF do
        begin
          AList.Add(Format('%s=%s', [Trim(FieldByName('COUNTRY').AsString),
            Trim(FieldByName(AField).AsString)]));
          Next;
        end;
    finally
      Free; // free TFDQuery
    end;
end;

procedure LoadCountries(var AList: TStringList);
begin
  with TFDQuery.Create(nil) do
    try
      ConnectionName := 'IQFD';
      SQL.Add('SELECT a.country');
      SQL.Add('FROM v_country_codes a');
      SQL.Add('WHERE NVL(default_spelling,''N'') = ''Y'' ');
      SQL.Add('ORDER BY a.country');
      Open;
      while not EOF do
        begin
          AList.Add(Fields[0].AsString);
          Next;
        end;
    finally
      Free;
      // free TFDQuery
    end;
end;

procedure LoadCountries(AComboBox: TUniComboBox);
var
  i: Integer;
  ASys_Country, ASys_2Char, ASys_3Char: string;
  ASys_3Digit: Integer;
  ASys_Found: Boolean;
  procedure _AddItem(ACountry: string; ACode: CodeString);
  begin
    if (ACountry = '') or (ACode = '') then
      Exit;
    AComboBox.Items.AddObject(ACountry, TCountryCargo.Create(ACountry, ACode));
  end;

begin
  if (AComboBox = nil) then
    Exit;
  // 07/24/2012 Get the system country code (System Parameters)
  IQGetCountryCode(ASys_Country, ASys_2Char, ASys_3Char, ASys_3Digit);
  ASys_Found := not Empty(ASys_2Char);
  with TFDQuery.Create(nil) do
    try
      AComboBox.Items.BeginUpdate;
      // 07/24/2012 Do not sort the combo box list
      AComboBox.Sorted := False;
      // Clear list
      // 10/12/2011 Must clear objects first to avoid memory leaks
      ClearComboBoxOfObjects(AComboBox);
      // 07/24/2012 Add system country first
      if ASys_Found then
        _AddItem(ASys_Country, ASys_2Char);
      ConnectionName := 'IQFD';;
      SQL.Add('SELECT a.country, a.chr2');
      SQL.Add('FROM v_country_codes a');
      SQL.Add('WHERE NVL(default_spelling,''N'') = ''Y'' ');
      SQL.Add('ORDER BY a.country');
      Open;
      while not EOF do
        begin
          if not ASys_Found or
            (ASys_Found and (CompareText(ASys_2Char, Fields[1].AsString) <> 0)) then
            _AddItem(Fields[0].AsString, Fields[1].AsString);
          Next;
        end;
      // 05/17/2013 Prevent users from entering non-standard values.
      AComboBox.Style := csDropDownList;
    finally
      Free;
      // free TFDQuery
      AComboBox.Items.EndUpdate;
    end;
end;

procedure LoadCountries(AComboBox: TUniDBComboBox);
var
  i: Integer;
  ASys_Country, ASys_2Char, ASys_3Char: string;
  ASys_3Digit: Integer;
  ASys_Found: Boolean;
  ACurrentValue: string;

  procedure _AddItem(ACountry: string; ACode: CodeString);
  begin
    if (ACountry = '') or (ACode = '') then
      Exit;
    AComboBox.Items.AddObject(ACountry, TCountryCargo.Create(ACountry, ACode));
  end;

begin
  if (AComboBox = nil) then
    Exit;
  // 07/24/2012 Get the system country code (System Parameters)
  IQGetCountryCode(ASys_Country, ASys_2Char, ASys_3Char, ASys_3Digit);
  ASys_Found := not Empty(ASys_2Char);

  AComboBox.Items.BeginUpdate;
  try
    // 02/28/2014 Get the current value, if any
    ACurrentValue := AComboBox.Text;
    // 07/24/2012 Do not sort the combo box list
    AComboBox.Sorted := False;
    // Clear list
    // 10/12/2011 Must clear objects first to avoid memory leaks
    ClearComboBoxOfObjects(AComboBox);
    // Build query and populate the list
    with TFDQuery.Create(nil) do
      try
        // 07/24/2012 Add system country first
        if ASys_Found then
          _AddItem(ASys_Country, ASys_2Char);
        ConnectionName := 'IQFD';
        SQL.Add('SELECT a.country, a.chr2');
        SQL.Add('FROM v_country_codes a');
        SQL.Add('WHERE NVL(default_spelling,''N'') = ''Y'' ');
        SQL.Add('ORDER BY a.country');
        Open;
        while not EOF do
          begin
            if not ASys_Found or
              (ASys_Found and (CompareText(ASys_2Char, Fields[1].AsString) <> 0)) then
              _AddItem(Fields[0].AsString, Fields[1].AsString);
            Next;
          end;
      finally
        Free;
      end;
    // 05/17/2013 Prevent users from entering non-standard values.
    AComboBox.Style := csDropDownList;
    // 02/28/2014 Set the current value in the locked list
    if ACurrentValue > '' then
      AComboBox.ItemIndex := AComboBox.Items.IndexOf(ACurrentValue);
  finally
    AComboBox.Items.EndUpdate;
  end;
end;

//procedure LoadCountries(AComboBox: TwwDBComboBox);
//var
//  i: Integer;
//  AList: TStringList;
//  ALineText, ACountry: string;
//  ASys_Country, ASys_2Char, ASys_3Char: string;
//  ASys_3Digit: Integer;
//  ASys_Found: Boolean;
//begin
//  if AComboBox = nil then
//    Exit;
//  // 07/24/2012 Get the system country code (System Parameters)
//  iqmisc.IQGetCountryCode(ASys_Country, ASys_2Char, ASys_3Char, ASys_3Digit);
//  ASys_Found := not iqstring.IsEmpty(ASys_2Char);
//  // 07/24/2012 Add system country first
//  AComboBox.Items.Clear;
//  if ASys_Found then
//    AComboBox.Items.Add(Format('%s'#9'%s', [ASys_Country, ASys_Country]));
//  // 07/24/2012 Do not sort the combo box list
//  AComboBox.Sorted := False;
//  with TFDQuery.Create(nil) do
//    try
//      AComboBox.Items.BeginUpdate;
//      AComboBox.MapList := True;
//      Connection := db_dm.FDConnection;
//      SQL.Add('SELECT a.country');
//      SQL.Add('FROM v_country_codes a');
//      SQL.Add('WHERE NVL(default_spelling,''N'') = ''Y'' ');
//      SQL.Add('ORDER BY a.country');
//      Open;
//      while not EOF do
//        begin
//            if not ASys_Found or
//              (ASys_Found and (CompareText(ASys_Country, Fields[0].AsString) <> 0)) then
//            AComboBox.Items.Add(Format('%s'#9'%s', [Fields[0].AsString,
//              Fields[0].AsString]));
//          Next;
//        end;
//      // 05/17/2013 Prevent users from entering non-standard values.
//      AComboBox.Style := csDropDownList;
//    finally
//      Free; // free TFDQuery
//      AComboBox.Items.EndUpdate;
//    end;
//end;

function ComboBoxCountryCode(AComboBox: TUniCustomComboBox): string;
begin
  Result := '';
  if Assigned(AComboBox) and (AComboBox.ItemIndex > - 1) and
    Assigned(AComboBox.Items.Objects[AComboBox.ItemIndex]) then
    Result := TCountryCargo(AComboBox.Items.Objects[AComboBox.ItemIndex]).Code;
end;

procedure ParseFullName(const AFullName: string;
  var AFirstName, ALastName: string);
var
  AAdjustedFullName: string;
  i1, i2: Integer;
begin
  AAdjustedFullName := Trim(AFullName);
  if (AAdjustedFullName > '') then
    begin
      i1 := Pos(' ', AAdjustedFullName);
      // find the space
      i2 := Pos(',', AAdjustedFullName);
      // is there a comma? we dont' want last name, first name formats
      // no space or comma
      if (i1 <= 1) and (i2 <= 1) then
        begin
          AFirstName := AAdjustedFullName;
          ALastName := '';
        end
        // by comma
      else if (i2 > 1) then
        begin
          AFirstName := Trim(Copy(AAdjustedFullName, i2 + 1,
            Length(AAdjustedFullName)));
          ALastName := Trim(Copy(AAdjustedFullName, 1, i2 - 1));
        end
        // by space
      else if (i1 > 1) then
        begin
          AFirstName := Copy(AAdjustedFullName, 1, i1 - 1);
          ALastName := Copy(AAdjustedFullName, i1 + 1,
            Length(AAdjustedFullName));
        end;
    end;
end;

procedure ParseFullNameEx(const AFullName: string;
  var AFirstName, AMiddleName, ALastName: string);
const
  SPACE = ' ';
  COMMA = ',';
var
  AAdjustedFullName: string;
  i, i1, i2, spaceCount, commaCount: Integer;
  sl: TStringList;
begin
  AAdjustedFullName := Trim(AFullName);
  AMiddleName := '';
  if (AAdjustedFullName > '') then
    begin
      // find the space
      i1 := Pos(' ', AAdjustedFullName);
      // is there a comma? we dont' want last name, first name formats
      i2 := Pos(',', AAdjustedFullName);
      spaceCount := NumToken(AAdjustedFullName, SPACE);
      commaCount := NumToken(AAdjustedFullName, COMMA);
      // no space or comma
      if (i1 = 0) and (i2 = 0) then
        begin
          AFirstName := AAdjustedFullName;
          ALastName := '';
        end
        // by comma
      else if (i2 >= 1) then
        begin
          // assume last name first, if a comma is used
          ALastName := Trim(Copy(AAdjustedFullName, 1, i2 - 1));
          AFirstName := Trim(Copy(AAdjustedFullName, i2 + 1,
            Length(AAdjustedFullName)));
          i1 := Pos(' ', AFirstName);
          if i1 > 0 then
            begin
              commaCount := NumToken(AFirstName, COMMA);
              AFirstName := GetToken(AAdjustedFullName, ' ', 1);
              AMiddleName := GetToken(AAdjustedFullName, ' ', 2);
            end;
        end
        // by space
      else if (i1 >= 1) then
        case spaceCount of
          0 .. 1:
            AFirstName := AAdjustedFullName;
          2:
            begin
              AFirstName := GetToken(AAdjustedFullName, ' ', 1);
              ALastName := GetToken(AAdjustedFullName, ' ', 2);
            end;
          3:
            begin
              AFirstName := GetToken(AAdjustedFullName, ' ', 1);
              AMiddleName := GetToken(AAdjustedFullName, ' ', 2);
              ALastName := GetToken(AAdjustedFullName, ' ', 3);
            end;
        else
          begin
            sl := TStringList.Create;
            try
              // Get a string list based on spaces
              sl.Text := StringReplace(AAdjustedFullName, ' ', #13,
                [rfReplaceAll, rfIgnoreCase]);

              // Remove empty lines
              for i := sl.Count - 1 downto 0 do
               if Trim(sl.Strings[i]) = '' then
                sl.Delete(i);

              // Loop the list.
              for i := 0 to sl.Count - 1 do
                begin
                  // First string is "first name"
                  if i = 0 then
                    AFirstName := Trim(sl.Strings[i])
                  // Last string is "last name"
                  else if i = sl.Count - 1 then
                    ALastName := Trim(sl.Strings[i])
                  // Middle strings are concatenated to form "middle name"
                  else
                   begin
                     if AMiddleName = '' then
                       AMiddleName := Trim(sl.Strings[i])
                     else
                       AMiddleName := AMiddleName + ' ' + Trim(sl.Strings[i]);
                   end;
                end;

            finally
              sl.Free;
            end;
          end;
        end; // end case
    end;
end;

function IndexOfCountryCode(AComboBox: TUniComboBox; ACode: string): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to AComboBox.Items.Count - 1 do
    if Assigned(AComboBox.Items.Objects[i]) and
      (AComboBox.Items.Objects[i] is TCountryCargo) and
      (TCountryCargo(AComboBox.Items.Objects[i]).Code = ACode) then
      begin
        Result := i;
        BREAK;
      end;
end;

procedure CheckClearStateCode(AStateField: TField; AStateComboBox: TUniComboBox);
var
  AState: string;
begin
  // Ensure components exist
  if not Assigned(AStateField) or not Assigned(AStateComboBox) then
    Exit;
  // Don't bother validating unless we have a strict list.  Don't bothter
  // checking lists that allow users to enter whatever they want.
  if (AStateComboBox.Style <> csDropDownList) then
    Exit;
  // Dataset state
  if not (AStateField.DataSet.State in [dsEdit, dsInsert]) then
    Exit;
  // Get the state
  AState := AStateField.AsString;
  // Validate
  if (AStateComboBox.Items.IndexOf(AState) = - 1) then
    begin
      AStateComboBox.Text := '';
      AStateComboBox.ItemIndex := - 1;
      AStateField.Clear;
    end;
end;


//procedure CheckClearStateCode(AStateField: TField; AStateComboBox: TwwDBComboBox);
//var
//  AState: string;
//begin
//  // Ensure components exist
//  if not Assigned(AStateField) or not Assigned(AStateComboBox) then
//    Exit;
//  // Don't bother validating unless we have a strict list.  Don't bothter
//  // checking lists that allow users to enter whatever they want.
//  if (AStateComboBox.Style <> csDropDownList) then
//    Exit;
//  // Dataset state
//  if not (AStateField.DataSet.State in [dsEdit, dsInsert]) then
//    Exit;
//  // Get the state
//  AState := AStateField.AsString;
//  // Validate
//  if AStateComboBox.GetComboValue(AState) <> AState then
//    begin
//      AStateComboBox.Text := '';
//      AStateComboBox.ItemIndex := - 1;
//      AStateField.Clear;
//    end;
//end;


procedure CheckClearStateCode(AStateField: TField; AStateComboBox: TUniDBComboBox);
var
  AState: string;
begin
  // Ensure components exist
  if not Assigned(AStateField) or not Assigned(AStateComboBox) then
    Exit;
  // Don't bother validating unless we have a strict list.  Don't bothter
  // checking lists that allow users to enter whatever they want.
  if (AStateComboBox.Style <> csDropDownList) then
    Exit;
  // Dataset state
  if not (AStateField.DataSet.State in [dsEdit, dsInsert]) then
    Exit;
  // Get the state
  AState := AStateField.AsString;
  // Validate
  if (AStateComboBox.Items.IndexOf(AState) = - 1) then
    begin
      AStateComboBox.Text := '';
      AStateComboBox.ItemIndex := - 1;
      AStateField.Clear;
    end;
end;

procedure CheckClearStateCode(AStateField, ACountryField: TField);
var
  AState, ACountryCode: string;
  AClear: Boolean;
begin
  AClear := False;
  // Ensure components exist
  if not Assigned(AStateField) or not Assigned(ACountryField) then
    Exit;
  // Get the country code
  ACountryCode := CountryCodeFor(ACountryField.AsString);
  // Don't bother validating unless we have a strict list.  Don't bothter
  // checking lists that allow users to enter whatever they want.
  if not StrInList(ACountryCode,
    CountriesRequiringStrictStateList) then
    Exit;
  // Dataset state
  if not (AStateField.DataSet.State in [dsEdit, dsInsert]) then
    Exit;
  // Get the state
  AState := AStateField.AsString;
  // Validate
  if (ACountryCode = 'US') then
    AClear := not StrInList(AState, Regions_USA) and
      not StrInList(AState, Regions_USAMilitaryState)
  else if (ACountryCode = 'MX') then
    AClear := not StrInList(AState, Regions_Mexico)
  else if (ACountryCode = 'CA') then
    AClear := not StrInList(AState, Regions_Canada)
  else if (ACountryCode = 'AU') then
    AClear := not StrInList(AState, Regions_Australia);
  if AClear then
    AStateField.Clear;
end;

{ ---------------------------------------------------------------------------- }
{ TCountryCargo }
{ ---------------------------------------------------------------------------- }
{ TCountryCargo }
constructor TCountryCargo.Create(ACountry: string; ACode: CodeString);
begin
  Country := ACountry;
  Code := ACode;
end;

end.
