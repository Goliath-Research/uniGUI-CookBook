unit shipman_common;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.Variants,
  System.SysUtils,
  shipman_rscstr,
  shipman_printconst,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniComboBox,
  MainModule;

    // Validation
    function IsPackageDimValid(const ALength, AWidth, AHeight: Real;
     const AUOM: String; const AShowError: Boolean): Boolean;
    function IsTelephoneValid(const ACountryCode, ATelephoneNumber: String): Boolean;
    function IsStateCodeValid(const ACountryCode, AStateCode: String): Boolean;
    function DeclaredValueRequired(const ACountryCode: String): Boolean;
    procedure CheckDeclaredValueRequired(const ACountryCode: String;
      const ACurrentValue: Real);
    function CommodityCount(APackageID: Real): Integer;
    function DocumentCount(APackageID: Real): Integer;
    function PackageCount(ASourceID: Real; ASource: String): Integer;
    function OpenPackageCount(ASourceID: Real; ASource: String): Integer;
    function ShipmentBillableWeight(ASourceID: Real; ASource: String): Integer;
    procedure GetContactEMailList(const ASourceID: Real; const ASource: String; var AList: TStringList);
    procedure GetContactEMailListCmb(const ASourceID: Real; const ASource: String;
     const ACombobox: TUniComboBox);

    function GetPrinterName(const APrinterID: Real): String;
    function GetPrinterDisplayName(const APrinterID: Real): String;
    function GetReportFileName(AReportType:TCarrietReportType; const ACarrierId: Real; AValidateExists:Boolean = true): String;
    function GetBillingName(const ACarrier: Integer; const ACarrierID: Real; const ABillingType: Integer): String;
    function GetBillingDescrip(const ACarrier: Integer; const ABillingType: Integer; const ABillingTypeTax: Integer; const AIntl: Boolean): String;
    function FindCreateReturnShipment(ASourceID: Real; ASource: String): Real;
    function CreateMasterShipment(ASourceID: Real; ASource: String; AServiceCode: String): Real;
    function FedExStrToDate(s:string):TDateTime;
    procedure SyncUPSWithMaster;
    function GenerateAESDirectFiling(ASource: String; ASourceId: Real; ACarrierId: Real; AEplantId: Real): String;

type
   // Lists the supported carrier types
   TCarrierType = (ctUnknown, ctUPS, ctFedExGround, ctFedExExpress, ctUSPS, ctFedExSmartPost, ctWebService);
   TCarrierTypes = set of TCarrierType;
   TCarrierStatus = (csUnknown, csPending, csRejected, csApproved);
   TURLType = (utAll, utTest, utRates, utShipment, utLabels, utTracking, utAddressValidation);

   TUOMWeight = (wmLBS, wmKGS);
   TUOMDimension = (dmIN, dmCM);
   TFedExShipmentService = (fssNone, fssCOD = Ord(1), fssDryIce = Ord(2),
    fssEmailNotification = Ord(4), fssFutureDayShip = Ord(8),
    fssHoldAtLocation = Ord(16), fssHoldSaturday = Ord(32),
    fssHomeDeliveryPremium = Ord(64), fssInsideDelivery = Ord(128),
    fssInsidePickup = Ord(256), fssReturnShipment = Ord(512),
    fssSaturdayDelivery = Ord(1024), fssSaturdayPickup = Ord(2048),
    fssThirdPartyConsignee = Ord(4096), fssBrokerSelect = Ord(8192));
   TFedExPackageService = (fpsNone, fpsAppointmentDelivery = Ord(1),
    fpsDangerousGoods = Ord(2), fpsDryIce = Ord(4), fpsPriorityAlert = Ord(8),
    fpsNonStandardContainer = Ord(16), fpsCOD = Ord(32), fpsSignatureOption= Ord(128));

const
  CarrierNames : array[TCarrierType] of string =
                     ('',               // ctUnknown
                      shipman_rscstr.cTXT000046,  // 'UPS'                          (ctUPS           )
                      shipman_rscstr.cTXT000047,  // 'FedEx Ground'                 (ctFedExGround   )
                      shipman_rscstr.cTXT000048,  // 'FedEx Express'                (ctFedExExpress  )
                      shipman_rscstr.cTXT000049,  // 'United States Postal Service' (ctUSPS          )
                      shipman_rscstr.cTXT000082,  // 'FedEx SmartPost'              (ctFedExSmartPost)
                      shipman_rscstr.cTXT000085); // 'Web Service'                  (ctWebService)
  StandardCarriers: array[0..4] of TCarrierType =
   (ctUPS, ctFedExGround, ctFedExExpress, ctFedExSmartPost, ctUSPS);
  StandardCarrierSet = [ctUPS, ctFedExGround, ctFedExExpress, ctFedExSmartPost, ctUSPS];

  CarrierStatus: array[TCarrierStatus] of String =
   ('Unprocessed.',
    'Pending approval.',
    'Rejected by server.',
    'Approved.');
  // ---------------------------------------------------------------------------
  // *** FedEx ***
  // ---------------------------------------------------------------------------
  URL_FEDEX = 'https://gateway.fedex.com:443/web-services';
  URL_FEDEXTEST = 'https://gatewaybeta.fedex.com:443/web-services';
  FEDEX_DEVELOPER_KEY = 'jWyhEIV105f0jQKS';
  FEDEX_PASSWORD = 'lf96vf5HYAgRV83v0OViv5NP2';
  FEDEX_CLIENT_PRODUCT_ID = 'BKDI';
  FEDEX_CLIENT_PRODUCT_VERSION = '9225';
  ACCOUNT_OVERRIDE_REGISTRY_KEY = '\Software\IQMS\IQWin32\IQShipMan.exe\OverrideAccounts';
  // *** FedEx Package Types **
  FEDEX_PackageType: array[0..20] of String =
   ('BAG','BBL','BDL','BOX','BSK','BXT','CAS','CNT','CRT',
    'CTN','CYL','DRM','ENV','PAL','PCS','PLT','REL','ROL',
    'SKD','TBE','TNK');
  FEDEX_PackageTypeDescrip: array[0..20] of String =
   ('Bag','Barrel','Bundle','Box','Basket',
    'Bucket','Case','Container','Crate','Carton','Cylinder',
    'Drum','Envelope','Pail','Pieces','Pallet','Reel',
    'Roll','Skid','Tube','Tank');
    (* -------------------------------------------------------------------------
       *** FedEx Package Type Summary ***
       Code     Description
       ----     -----------
       BAG      Bag
       BBL      Barrel
       BDL      Bundle
       BOX      Box
       BOX      Other Packaging
       BSK      Basket or hamper
       BXT      Bucket
       CAG      Cage
       CAS      Case
       CHS      Chest
       CNT      Container
       CRT      Crate
       CTN      Carton
       CYL      Cylinder
       DRM      Drum
       ENV      Envelope
       PAL      Pail
       PCL      Parcel
       PCS      Pieces
       PKG      Package
       PLT      Pallet
       REL      Reel
       ROL      Roll
       SAK      Sack
       SHW      Shrink Wrapped
       SKD      Skid
       TBE      Tube
       TBN      Tote Bin
       TNK      Tank
       UNT      Unit
    ------------------------------------------------------------------------- *)
  FEDEX_ReferenceType: array[0..6] of String =
  ('CR', 'BL', 'IN', 'PO', 'DN', 'SI', 'SN');
  FEDEX_ReferenceTypeDescrip: array[0..6] of String =
  ('Customer Reference', 'Bill of Lading', 'Invoice Number', 'PO Number',
   'Department Number', 'Shipment Integrity', 'Store Number');
  // *** Standard FedEx Package Codes **
  FEDEX_PackagingCode: array[0..10] of String =
   ('FEDEX_ENVELOPE','FEDEX_PAK','FEDEX_BOX','FEDEX_TUBE','FEDEX_10KG_BOX',
    'FEDEX_25KG_BOX','YOUR_PACKAGING', 'FEDEX_SMALL_BOX', 'FEDEX_MEDIUM_BOX',
    'FEDEX_LARGE_BOX', 'FEDEX_EXTRA_LARGE_BOX');
  FEDEX_PackagingDescrip: array[0..10] of String =
   ('FedEx® Envelope','FedEx® Pak','FedEx® Box','FedEx® Tube','FedEx® 10kg Box',
    'FedEx® 25kg Box','Your Packaging', 'FedEx® Small Box', 'FedEx® Medium Box',
    'FedEx® Large Box', 'FedEx® Extra Large Box');
    (* -------------------------------------------------------------------------
       *** Package Code Summary ***
       Code                 Description           IBiz Code
       ----                 -----------           ---------
       FEDEX_ENVELOPE       FedEx Envelope        ptFedexEnvelope (0)
       FEDEX_PAK            FedEx Pak             ptFedexPak (1)
       FEDEX_BOX            FedEx Box             ptFedexBox (2)
       FEDEX_TUBE           FedEx Tube            ptFedexTube (3)
       FEDEX_10KG_BOX       FedEx 10KG Box        ptFedex10kgBox (4) -- for international shipments only
       FEDEX_25KG_BOX       FedEx 25KG Box        ptFedex25kgBox (5) -- for international shipments only
       YOUR_PACKAGING       Your Packaging        ptYourPackaging (6)
    ------------------------------------------------------------------------- *)

  // *** FedEx Service Codes ***
  FEDEX_ServiceCode: array[0..23] of String =
   ('PRIORITY_OVERNIGHT',
    'STANDARD_OVERNIGHT',
    'FIRST_OVERNIGHT',
    'FEDEX_2_DAY',
    'FEDEX_2_DAY_AM',
    'FEDEX_EXPRESS_SAVER',
    'FEDEX_GROUND',
    'GROUND_HOME_DELIVERY',
    'FEDEX_1_DAY_FREIGHT',
    'FEDEX_2_DAY_FREIGHT',
    'FEDEX_3_DAY_FREIGHT',
    'FEDEX_FIRST_FREIGHT',
    'FEDEX_FREIGHT_ECONOMY',
    'FEDEX_FREIGHT_PRIORITY',
    'INTERNATIONAL_PRIORITY',
    'INTERNATIONAL_PRIORITY_DIST',
    'INTERNATIONAL_ECONOMY',
    'INTERNATIONAL_ECONOMY_DIST',
    'INTERNATIONAL_FIRST',
    'INTERNATIONAL_PRIORITY_FREIGHT',
    'INTERNATIONAL_ECONOMY_FREIGHT',
    'INTERNATIONAL_DIST_FREIGHT',
    'EUROPE_FIRST_INTERNATIONAL_PRIORITY',
    'SMART_POST');
{  FEDEX_IBiz_ServiceCode: array[0..15] of String =
   ('PRIORITYOVERNIGHT','STANDARDOVERNIGHT','FIRSTOVERNIGHT','FEDEX2DAY',
    'FEDEXEXPRESSSAVER','INTERNATIONALPRIORITY','INTERNATIONALECONOMY',
    'INTERNATIONALFIRST','FEDEX1DAYFREIGHT','FEDEX2DAYFREIGHT',
    'FEDEX3DAYFREIGHT','FEDEXGROUND','GROUNDHOMEDELIVERY',
    'INTERNATIONALPRIORITY FREIGHT','INTERNATIONALECONOMY FREIGHT',
    'EUROPEFIRSTINTERNATIONALPRIORITY');  }
  FEDEX_ServiceCodeDescrip: array[0..23] of String =
   ('FedEx Priority Overnight®','FedEx Standard Overnight®','FedEx First Overnight®',
    'FedEx 2Day®', 'FedEx 2Day® A.M.', 'FedEx Express Saver®','FedEx Ground®','FedEx Home Delivery®',
    'FedEx 1Day® Freight','FedEx 2Day® Freight','FedEx 3Day® Freight', 'FedEx First Overnight® Freight',
    'FedEx Freight® Economy', 'FedEx Freight® Priority',
    'FedEx International Priority®','FedEx International Priority DirectDistribution®',
    'FedEx International Economy®','FedEx International Economy DirectDistribution^(SM) Service',
    'FedEx International First®','FedEx International Priority® Freight',
    'FedEx International Economy® Freight','FedEx International Priority DirectDistribution® Freight',
    'FedEx Europe First® - Int’l Priority','FedEx SmartPost®');
  FEDEX_ServiceCode_Ground: array[0..1] of String =
   ('FEDEX_GROUND','GROUND_HOME_DELIVERY');
  FEDEX_ServiceCode_Express: array[0..16] of String =
   ('PRIORITY_OVERNIGHT','STANDARD_OVERNIGHT','FIRST_OVERNIGHT','FEDEX_2_DAY',
    'FEDEX_2_DAY_AM', 'FEDEX_EXPRESS_SAVER','FEDEX_1_DAY_FREIGHT',
    'FEDEX_2_DAY_FREIGHT','FEDEX_3_DAY_FREIGHT','FEDEX_FIRST_FREIGHT',
    'FEDEX_FREIGHT_ECONOMY', 'FEDEX_FREIGHT_PRIORITY', 'INTERNATIONAL_PRIORITY',
    'INTERNATIONAL_ECONOMY','INTERNATIONAL_FIRST',
    'INTERNATIONAL_PRIORITY_FREIGHT',
    'INTERNATIONAL_ECONOMY_FREIGHT');
  FEDEX_ServiceCode_SmartPost: array[0..0] of String =
   ('SMART_POST');

    (* -------------------------------------------------------------------------
       *** Service Code Summary ***
       Code                                 Description                             TibfratesServiceTypes
       ----                                 -----------                             ---------
                                            (Unspecified)                           stUnspecified (0)
       PRIORITY_OVERNIGHT                   FedEx Priority Overnight                stPriorityOvernight (1)
       STANDARD_OVERNIGHT                   FedEx Standard Overnight                stStandardOvernight (2)
       FIRST_OVERNIGHT                      FedEx First Overnight                   stFirstOvernight (3)
       FEDEX_2DAY                           FedEx 2nd Day                           stFedex2Day (4)
       FEDEX_EXPRESS_SAVER                  FedEx Express Saver                     stFedexExpressSaver (5)
       INTERNATIONAL_PRIORITY               FedEx International Priority            stInternationalPriority (6)
       INTERNATIONAL_ECONOMY                FedEx International Economy             stInternationalEconomy (7)
       INTERNATIONAL_FIRST                  FedEx International First Overnight     stInternationalFirst (8)
       FEDEX_1DAY_FREIGHT                   FedEx 1Day Freight                      stFedex1DayFreight (9)
       FEDEX_2DAY_FREIGHT                   FedEx 2Day Freight                      stFedex2DayFreight (10)
       FEDEX_3DAY_FREIGHT                   FedEx 3Day Freight                      stFedex3DayFreight (11)
       FEDEX_GROUND                         FedEx Ground                            stFedexGround (12)
       GROUND_HOME_DELIVERY                 FedEx Home Delivery                     stGroundHomeDelivery (13)
       INTERNATIONAL_PRIORITY_FREIGHT       FedEx International Priority Overnight  stInternationalPriorityFreight (14)
       INTERNATIONAL_ECONOMY_FREIGHT        FedEx International Economy Freight     stInternationalEconomyFreight (15)
       EUROPE_FIRST_INTERNATIONAL_PRIORITY  FedEx Europe International Priority     stEuropeFirstInternationalPriority (16)
    ------------------------------------------------------------------------- *)

  // *** FedEx Pickup Codes ***
  FEDEX_PickupCode: array[0..4] of String =
   ('REGULAR_PICKUP','REQUEST_COURIER','DROP_BOX','BUSINESS_SERVICE_CENTER',
    'STATION');
  FEDEX_PickupDescrip: array[0..4] of String =
   ('Regular Pickup','Request Courier','Drop Box','Busines Service Center',
    'Station');

  FEDEX_CommercialInvoicePurposes: array[0..8] of String =
    ('Sale', 'Gift', 'Not Sold', 'Personal Effects', 'Repair','Return',
     'Repair and Return', 'Sample', 'Intercompany Data');

  FEDEX_CommercialInvoiceTerms: array[0..12] of String =
    ('FCA', 'FOB', 'FAS', 'CFR', 'CIF', 'CIP', 'CPT',
     'DAF', 'DDP', 'DDU', 'DEQ', 'DES', 'EXW');

    (* -------------------------------------------------------------------------
       *** Pickup Code Summary ***
       Code                      Description             IBiz Code
       ----                      -----------             ---------
       REGULAR_PICKUP            Regular Pickup          dtRegularPickup (0)
       REQUEST_COURIER           Request Courier         dtRequestCourier (1)
       DROP_BOX                  Drop Box                dtDropBox (2)
       BUSINESS_SERVICE_CENTER   Busines Service Center  dtBusinessServiceCenter (3)
       STATION                   Station                 dtStation (4)
    ------------------------------------------------------------------------- *)

  // ---------------------------------------------------------------------------
  // *** USPS ***
  // ---------------------------------------------------------------------------
  cUSPSLicenseNumber = '';
  cUSPSUserID = '348IQMS06183';
  cUSPSPassword = '';

  URL_STAMPS = 'https://swsim.stamps.com/swsim/SwsimV45.asmx';
  URL_STAMPS_TEST = 'https://swsim.testing.stamps.com/swsim/SwsimV45.asmx';

  // This URL used for: AddressInfo, DomesticRates, InternationalRates,
  //                    ShippingTime, and TrackAndConfirm
  URL_USPS_1 = 'http://production.shippingapis.com/ShippingAPI.dll';

  // This URL used for: CarrierPickup, ConfirmationLabels, CustomsLabels,
  //                    ExpressLabels, InternationalLabels, and ReturnLabels
  URL_USPS_2 = 'https://secure.shippingapis.com/ShippingAPI.dll';

  // *** USPS Postage Service ID ***
  // NOTE:  This is the IBiz USPS Integrator PostageServiceId property
  USPS_ServiceCode: array[0..4] of String =
   ('USFC',
    'USMM',
    'USPM',
    'USXM',
    'USPS'
//    'USLM'
    );
  USPS_ServiceCodeInt: array[0..2] of Integer =
   (0, 2, 3);
  USPS_ServiceCodeDescription: array[0..4] of String =
   ('USPS First-Class Mail®',
    'USPS Media Mail',
    'USPS Priority Mail®',
    'USPS Priority Mail Express®',
    'USPS Parcel Select'
//    'USPS Library Mail'
    );
  //USPS_DomesticServiceCode: array[0..1] of Integer =
  //  ();
  //USPS_InternationalServiceCode: array[0..1] of Integer =
  //  ();

    (* -------------------------------------------------------------------------
       *** Service Code Summary ***
       Code           Description
       ----           -----------
       0              USPS First-Class Mail®
       1              USPS Priority Mail®
       2              USPS Express Mail PO to PO
       3              USPS Express Mail PO to Addressee
       4              USPS Parcel Post®
       5              USPS Bound Printed Matter
       6              USPS Media Mail
       7              USPS Library Mail
       12             USPS First-Class Postcard Stamped
       13             USPS Express Mail Flat-Rate Envelope
       16             USPS Priority Mail Flat-Rate Envelope
       17             USPS Priority Mail Flat-Rate Box
    ------------------------------------------------------------------------- *)

  // *** USPS Service Types ***
  USPS_ServiceType: array[0..7] of String =
   ('PRIORITY','FIRST_CLASS','PARCEL','BPM','MEDIA','LIBRARY','EXPRESS','ALL');
  USPS_ServiceTypeDescrip: array[0..7] of String =
   ('Priority Mail','First Class','Parcel Post','BPM rates','Media Mail',
    'Library Mail','Express Mail','All');

    (* -------------------------------------------------------------------------
       *** Service Code Summary ***
       Code           Description                           IBiz Code
       ----           -----------                           ---------
       PRIORITY       Priority Mail                         svcPriority           (0)
       FIRST_CLASS    First Class                           svcFirstClass         (1)
       PARCEL         Parcel Post                           svcParcelPost         (2)
       BPM            BPM rates                             svcBoundPrintedMatter (3)
       MEDIA          Media Mail                            svcMedia              (4)
       LIBRARY        Library Mail                          svcLibrary            (5)
       EXPRESS        Express Mail                          svcExpress            (6)
       ALL            Return rates for all service types.   svcAll                (7)

       NOTE:  Code FIRST_CLASS depends on the First Class type.

    ------------------------------------------------------------------------- *)

  // *** USPS Service Types ***
  USPS_PackagingCode: array[0..7] of String = ('0','1','2','3','4','5','6','7');
  USPS_PackagingDescrip: array[0..7] of String = ('Unspecified',
   'Flat-Rate Envelope','Flat-Rate Box','Rectangular Package',
   'Non-Rectangular Package','Variable', 'Padded Flat-Rate Envelope', 'Legal Flat-Rate Envelope');

    (* -------------------------------------------------------------------------
       *** Packaging Code Summary ***
       Code           Description                           IBiz Code
       ----           -----------                           ---------
       0                                                    scNone (0)
       1              'Flat-Rate Envelope'                  scFlatRateEnvelope (1)
       2              'Flat-Rate Box'                       scFlatRateBox (2)
       3              'Rectangular Package'                 scRectangular (3)
       4              'Non-Rectangular Package'             scNonRectangular (4)
       5              'Variable'                            scVariable (5)
    ------------------------------------------------------------------------- *)

  USPS_FirstClassPackagingCode: array[0..2] of String = ('LETTER','PARCEL','FLAT');
  USPS_FirstClassPackagingDescrip: array[0..2] of String = ('Letter','Parcel','Flat');

  USPS_PackageSizeCode: array[0..2] of Integer = (0,1,2);
  USPS_PackageSizeDescrip: array[0..2] of String = ('Regular','Large','Oversize');


  // *** USPS Carrier Route Types ***
  USPS_CarrierRoute: array[0..2] of String =
   ('C','H','R');
  USPS_CarrierRouteDescrip: array[0..2] of String =
   ('City','Highway','Rural');

  Invoice_DeclarationStatement: String = 'I hereby certify that the information ' +
                                         'on this invoice is true and correct ' +
                                         'and the contents and value of this ' +
                                         'shipment is as stated above.';

  NAFTA_DeclarationStatement: String = 'I hereby certify that the goods covered ' +
                                       'by this shipment qualify as originating ' +
                                       'goods for purposes of preferential ' +
                                       'tariff treatment under the NAFTA.';

  DestinationControlStatement: String = 'These commodities, technology or ' +
                                        'software were exported from the US in ' +
                                        'accordance with the Export ' +
                                        'Administration Regulations. Diversion ' +
                                        'contrary to law is prohibited.';
{ ---------------------------------------------------------------------------- }

  // ---------------------------------------------------------------------------
  // *** UPS ***
  // ---------------------------------------------------------------------------
  URL_UPS_RATE_TEST = 'https://wwwcie.ups.com/webservices/Rate';
  URL_UPS_SHIP_TEST = 'https://wwwcie.ups.com/webservices/Ship';
  URL_UPS_ADDRESS_TEST = 'https://wwwcie.ups.com/webservices/XAV';
  URL_UPS_RATE = 'https://onlinetools.ups.com/webservices/Rate';
  URL_UPS_SHIP = 'https://onlinetools.ups.com/webservices/Ship';
  URL_UPS_ADDRESS = 'https://onlinetools.ups.com/webservices/XAV';


  // ---------------------------------------------------------------------------
  // *** General ***
  // ---------------------------------------------------------------------------
  // NOTE:  Place Imperial measurements in 0 and metric in 1; these values
  //        are retrieved by position.  Metric and Imperial UOM values
  //        cannot be mixed.
  UOM_Weight: array[TUOMWeight] of String = ('LBS','KGS');
  UOM_Dimension: array[TUOMDimension] of String = ('IN','CM');

  Ext_Label_Type: array[0..2] of String =
   ('Package Doc', 'Shipment Doc','Consignee');



{ ---------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------- }

type

   TAddress= packed record
    Company,
    Contact,
    FirstName,
    LastName,
    Address1,
    Address2,
    Address3,
    City,
    State,
    Zip,
    PostalCodeSuffix,
    Country,
    CountryCode,
    CountryCode3Digit,
    Telephone,
    Ext,
    Fax,
    EMail,
    TaxID: String;
    AccountNumber: String;
   end;

   TPackingSlip = packed record
    Carrier: TCarrierType;
    PackingSlipNumber: String;
    ActualWeight: String;
    BillableWeight: String;
    Residential: Boolean;
    PackageCount: Integer;
   end;

   TPackage = packed record
    ID: Real;             // Package ID
    SourceID: Real;
    Source: String;
    Carrier: TCarrierType;
    CarrierID: Real;      // Table Value related to carrier type

    Account: String; // a semi-colon delimited list of name-value pairs

    Length,
    Width,
    Height,
    Girth: Real;
    PackageSizeType: Integer; // USPS only - package size type (Regular, Large, Oversize)
    DimensionUOM: String; // the UOM used for the dimensions (such as, 'IN' or 'CM')
    ActualWeight,         // the weight of the package entered by the user
    BillableWeight,       // the min billable weight of the package returned by the server
    DimensionalWeight,    // the UPS dimensional weight calculated from the dimensions
    DeclaredValue,        // declared value for insurance purposes
    ActualCost,           // package cost
    OptionsCost,          // cost of options
    BillableCost: Real;   // total billable cost
    CurrencyCode,
    ServiceCode,
    ServiceCodeDescription,
    ServiceClass,
    ServiceIcon,
    PackageCode,
    PackageCodeDescription,
    WeightUOM,            // the UOM used for weight (such as, 'LBS' or 'KGS')
    PickupCode,
    PickupCodeDescription,
    Reference1,
    Reference2,
    Reference3,
    Reference4,
    Reference5,
    Destination,
    Contents: String; // destination string for display purposes only

    // Billing
    PayorType: Integer;
    PayorAccount,
    PayorCountry: String;

    // Shipping fields - after box is shipped
    TrackingNumber: String;
    ShipDate: TDateTime; // date when the package was shipped
    DeliveryDate: TDateTime; // date when the package will be delivered

    XMLRequest,
    XMLResponse: String;

    // shipping rate
    //TotalSurcharge,  // Total surcharge amount applied to ship this package
    TotalDiscount: Real;

    // Label
    PrinterType: TPrinterType;
    LabelFile: TFileName;
    LabelBinary: String;

    // Second label file
    PrinterType2: TPrinterType;
    LabelFile2: TFileName;
    LabelBinary2: String;

    Shipped: Boolean;
    Cancelled: Boolean;
    Closed: Boolean;
    Voided: Boolean;
   end;

   TQuantumViewNotification= packed record
    Company,
    Contact,
    EMail: String;
    NotificationType: Integer;
   end;

   TShipmentOptionUPS = packed record
     RecipientEmail: String;
     ReturnServices: Boolean;
     ReturnServicesAttempts: Integer;
     ReturnServicesType: Integer;
     NotificationEmail: String;
     FailEmail: String;
     ReturnServicesPhone: String;
     ReturnServicesText: String;
     ReturnsExchange: Boolean;
     ReturnsPackCollectBox: Integer;
     ImportControl: Boolean;
     ImportControlType: Integer;
     ReturnNotification: Boolean;
     QuantumView: Boolean;
     SaturdayDelivery: Boolean;
     Hundredweight: Boolean;
     HundredweightType: Integer;
     HundredweightTypeOverride: Boolean;
     IntlSpecialCommodity: Boolean;
     IntlSpecialCommodityType: Integer;
     ReceiversLocation: Boolean;
     ReceiversLocationID: String;
     Reference1: String;
     Reference2: String;
     CarbonNeutral: Boolean;
     ShipmentHandling: Boolean;
     ShipmentHandlingCharge: Real;
     ShipmentHandlingType: Integer;
     SaturdayPickup: Boolean;
     ExtendedDestination: Boolean;
   end;
   TShipmentOptionFedex = packed record
     FutureDayShip: Boolean;
     ShipDate: TDateTime;
     HoldAtLocation: Boolean;
     HoldAtContactName: String;
     HoldAtContactCompany: String;
     HoldAtContactPhoneNumer: String;
     HoldAtPhoneNumber: String;
     HoldAtAddress: String;
     HoldAtCity: String;
     HoldAtState: String;
     HoldAtPostalCode: String;
     InsidePickup: Boolean;
     InsideDelivery: Boolean;
     ShipAlert: Boolean;
     ShipAlertEmail: String;
     ShipAlertRecipient: Integer;
     ShipAlertOnShip: Boolean;
     ShipAlertOnDeliver: Boolean;
     ShipAlertOnExcept: Boolean;
     BrokerSelect: Boolean;
     FreightBookingNum: String;
     FreightSLAC: String;
     FreightPackingList: Boolean;
     Duties: Boolean;
     DutiesPayorType: Integer;
     DutiesPayorAccount: String;
     DutiesPayorCountry: String;
     HomeDeliveryType: Integer;
     HomeDeliveryDate: TDateTime;
     HomeDeliveryPhone: String;
     HomeDeliveryInstructions: String;
     SmartPostIndicia: String;
     SmartPostAncillary: String;
     SmartPostManifestID: String;
     SaturdayDelivery: Boolean;
     SaturdayPickup: Boolean;
     ReturnServicesRMANum: String;
     ReturnServicesRMAReason: String;
     ReturnServicesSatPick: Boolean;
     ReturnServicesSatDel: Boolean;
   end;
   TPackageOptionUPS = packed record
     COD: Boolean;
     CODAmount: Real;
     CODPaymentType: Integer;
     DeliveryConfirmation: Boolean;
     SignatureOption: Integer;
     CallTag: Boolean;
     VerbalConfirmation: Boolean;
     ShipperRelease: Boolean;
     QuantumView: Boolean;
     InboundReturnNotification: Boolean;
     ProactiveResponse: Boolean;
     AdditionalHandling: Boolean;
     AdditionalHandlingFee: Real;
     LargePackage: Boolean;
     LargePackageFee: Real;
     Insurance: Boolean;
     InsuranceAmount: Real;
     InsuranceType: Integer;
     HoldForPickup: Boolean;
     ShipperPaidDV: Boolean;
     PackageAttn: String;
     PackagePhone: String;
     FreightPricing: Boolean;
     FreightClass: String;
     FreightNMFC: String;
     FreightNMFCSub: String;
     ReturnServicesSeqNo: String;
   end;
   TPackageOptionFedex = packed record
     COD: Boolean;
     CODAmount: Real;
     CODType: Integer;
     CODCurrency: String;
     SignatureOption: Boolean;
     SignatureOptionType: Integer;
     DropoffType: Integer;
     AdmissPkgType: String;
     NonStandard: Boolean;
     Oversize: Boolean;
     PriorityAlert: Boolean;
     Documents: Boolean;
   end;

   TPackageClass = class(TComponent)
   public
    Package: TPackage;
    PackageOptionUPS: TPackageOptionUPS;
    PackageOptionFedex: TPackageOptionFedex;
    constructor Create(AOwner: TComponent; APackage: TPackage);
    procedure FillPackageOptionsUPS;
    procedure FillPackageOptionsFedex;
   end;

   TShippingInfo = class(TComponent)
   private
    { Private declarations }
    FSourceID: Real;
    FSource: String;
    FMasterShipmentID: Real;
    FEplantID: Real;
    FSender: TAddress;
    FRecipient: TAddress;
    FThirdParty: TAddress;
    FPackingSlip: TPackingSlip;
    FDocuments: Boolean;
    FCarrierID: Real;
    FWorldEase: Boolean;
    FTradeDirect: Boolean;
    FShipmentOptionUPS: TShipmentOptionUPS;
    FShipmentOptionFedex: TShipmentOptionFedex;
    procedure FillSenderData;
    procedure FillRecipientData;
    procedure FillThirdPartyData;
    procedure FillPackingSlipData;
    procedure SetEplantID(const Value: Real);
    procedure SetCarrierID(const Value: Real);

   protected
    { Protected declarations }
   public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASourceID:Real; ASource: String; ACarrierID, AEplantID: Real);
    destructor Destroy; override;
    procedure SetSourceID(const ASourceID: Real; ASource: String);
    procedure Refresh;
    function ValidateSenderData: Boolean;
    function ValidateRecipientData: Boolean;
    function International: Boolean;
    function ReturnShipment: Boolean;
    function Domestic(ACountryCode: String = ''): Boolean;
    function NAFTA: Boolean;
    procedure FillShipmentOptionsUPS;
    procedure FillShipmentOptionsFedex;
   published
    { Published declarations }
    property SourceID: Real read FSourceID;
    property Source: String read FSource;
    property CarrierID: Real read FCarrierID write SetCarrierID;
    property EplantID: Real read FEplantID write SetEplantID;
    property Sender: TAddress read FSender write FSender;
    property Recipient: TAddress read FRecipient write FRecipient;
    property ThirdParty: TAddress read FThirdParty write FThirdParty;
    property PackingSlip: TPackingSlip read FPackingSlip write FPackingSlip;
    property Documents: Boolean read FDocuments;
    property MasterShipmentID: Real read FMasterShipmentID;
    property WorldEase: Boolean read FWorldEase;
    property TradeDirect: Boolean read FTradeDirect;
    property ShipmentOptionUPS: TShipmentOptionUPS read FShipmentOptionUPS;
    property ShipmentOptionFedex: TShipmentOptionFedex read FShipmentOptionFedex;
   end;

   TShipmentGood = class(TComponent)
   private
    { Private declarations }
    FSourceID: Real;
    FSource: String;
    FGoodID: Real;
    FItemno: String;
    FDescrip: String;
    FOriginCountryCode: String;
    FQty: Integer;
    FUom: String;
    FUnitPrice: Real;
    FGrossWeight: Real;
    FWeightUOM: String;
    FPackageCount: Integer;
    FTariffCode: String;
    FMarksNumbers: String;
    FECCN: String;
    FSchedBNumber: String;
    FSchedBUnits: Integer;
    FSchedBUOM: String;
    FSchedBUnits2: Integer;
    FSchedBUOM2: String;
    FLicenseNumber: String;
    FLicenseExpiration: TDateTime;
    FLicenseException: Boolean;
    FLicenseExceptionCode: String;
    FPreferenceCriterion: String;
    FProducer: String;
    FNetCost: Boolean;
    FPeriodStart: TDateTime;
    FPeriodEnd: TDateTime;
    FOnSED: Boolean;
    FOnCO: Boolean;
    FMultipleOriginCountries: Boolean;

    procedure FillGoodData;

   protected
    { Protected declarations }
   public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASourceID: Real; ASource: String; AGoodID: Real);
    destructor Destroy; override;
    procedure SetSourceID(const ASourceID: Real; ASource: String);
    procedure Refresh;
   published
    { Published declarations }
    property SourceID: Real read FSourceID;
    property Source: String read FSource;
    property GoodID: Real read FGoodID write FGoodID;
    property Itemno: String read FItemno write FItemno;
    property Descrip: String read FDescrip write FDescrip;
    property OriginCountryCode: String read FOriginCountryCode write FOriginCountryCode;
    property Qty: Integer read FQty write FQty;
    property UOM: String read FUom write FUom;
    property UnitPrice: Real read FUnitPrice write FUnitPrice;
    property GrossWeight: Real read FGrossWeight write FGrossWeight;
    property WeightUOM: String read FWeightUOM write FWeightUOM;
    property PackageCount: Integer read FPackageCount write FPackageCount;
    property TariffCode: String read FTariffCode write FTariffCode;
    property MarksNumbers: String read FMarksNumbers write FMarksNumbers;
    property ECCN: String read FECCN write FECCN;
    property SchedBNumber: String read FSchedBNumber write FSchedBNumber;
    property SchedBUnits: Integer read FSchedBUnits write FSchedBUnits;
    property SchedBUOM: String read FSchedBUOM write FSchedBUOM;
    property SchedBUnits2: Integer read FSchedBUnits2 write FSchedBUnits2;
    property SchedBUOM2: String read FSchedBUOM2 write FSchedBUOM2;
    property LicenseNumber: String read FLicenseNumber write FLicenseNumber;
    property LicenseExpiration: TDateTime read FLicenseExpiration write FLicenseExpiration;
    property LicenseException: Boolean read FLicenseException write FLicenseException;
    property LicenseExceptionCode: String read FLicenseExceptionCode write FLicenseExceptionCode;
    property PreferenceCriterion: String read FPreferenceCriterion write FPreferenceCriterion;
    property Producer: String read FProducer write FProducer;
    property NetCost: Boolean read FNetCost write FNetCost;
    property PeriodStart: TDateTime read FPeriodStart write FPeriodStart;
    property PeriodEnd: TDateTime read FPeriodEnd write FPeriodEnd;
    property OnSED: Boolean read FOnSED write FOnSED;
    property OnCO: Boolean read FOnCO write FOnCO;
    property MultipleOriginCountries: Boolean read FMultipleOriginCountries write FMultipleOriginCountries;
   end;

   TShipmentInvoice = class(TComponent)
   private
    { Private declarations }
    FSourceID: Real;
    FSource: String;
    FCreateInvoice: Boolean;
    FMasterShipmentID: Real;
    FMaster: Boolean;
    FInvoiceID: Real;
    FGoods: TList;
    FUseUltimateConsignee: Boolean;
    FUltimateConsignee: TAddress;
    FUseImporter: Boolean;
    FImporter: TAddress;
    FCurrencyCode: String;
    FExportReason: String;
    FTermsOfSale: String;
    FInvoiceDiscount: Real;
    FInvoiceFreight: Real;
    FInvoiceInsurance: Real;
    FInvoiceOtherCharges: Real;
    FInvoiceComments: String;
    FPartiesRelated: Boolean;
    FRoutedTransaction: Boolean;
    FExportCode: String;
    FProducer: String;
    FPeriodStart: TDateTime;
    FPeriodEnd: TDateTime;
    FDeclarationCode: String;
    FOwner: String;
    FAdditionalDocs: Boolean;
    FCarrierPrepareSED: Boolean;
    FCarrierPrepareCO: Boolean;
    FCurrencyConversionFactor: Real;
    FSEDbyAES: String;
    FAESNumber: String;
    FPaperless: Boolean;
    FPaperlessNafta: Boolean;
    FInvoiceNumber: String;
    FDocsOnly: Boolean;

    procedure FillInvoiceData;
    procedure FillUltimateConsigneeData;
    procedure FillImporterData;

   protected
    { Protected declarations }
   public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASourceID: Real; ASource: String; AMaster: Boolean);
    destructor Destroy; override;
    procedure SetSourceID(const ASourceID: Real; ASource: String);
    procedure Refresh;
    function ValidateUltimateConsigneeData: Boolean;
    function ValidateImporterData: Boolean;
    function IncludeCO: Boolean;
    function IncludeSED: Boolean;
    function LineTotal: Real;
   published
    { Published declarations }
    property SourceID: Real read FSourceID;
    property Source: String read FSource;
    property CreateInvoice: Boolean read FCreateInvoice;
    property InvoiceID: Real read FInvoiceID write FInvoiceID;
    property Goods: TList read FGoods write FGoods;
    property UseUltimateConsignee: Boolean read FUseUltimateConsignee write FUseUltimateConsignee;
    property UltimateConsignee: TAddress read FUltimateConsignee write FUltimateConsignee;
    property UseImporter: Boolean read FUseImporter write FUseImporter;
    property Importer: TAddress read FImporter write FImporter;
    property CurrencyCode: String read FCurrencyCode write FCurrencyCode;
    property ExportReason: String read FExportReason write FExportReason;
    property TermsOfSale: String read FTermsOfSale write FTermsOfSale;
    property Discount: Real read FInvoiceDiscount write FInvoiceDiscount;
    property Freight: Real read FInvoiceFreight write FInvoiceFreight;
    property Insurance: Real read FInvoiceInsurance write FInvoiceInsurance;
    property OtherCharges: Real read FInvoiceOtherCharges write FInvoiceOtherCharges;
    property Comments: String read FInvoiceComments write FInvoiceComments;
    property PartiesRelated: Boolean read FPartiesRelated write FPartiesRelated;
    property RoutedTransaction: Boolean read FRoutedTransaction write FRoutedTransaction;
    property ExportCode: String read FExportCode write FExportCode;
    property Producer: String read FProducer write FProducer;
    property PeriodStart: TDateTime read FPeriodStart write FPeriodStart;
    property PeriodEnd: TDateTime read FPeriodEnd write FPeriodEnd;
    property DeclarationCode: String read FDeclarationCode write FDeclarationCode;
    property Owner: String read FOwner write FOwner;
    property AdditionalDocs: Boolean read FAdditionalDocs write FAdditionalDocs;
    property CarrierPrepareSED: Boolean read FCarrierPrepareSED write FCarrierPrepareSED;
    property CarrierPrepareCO: Boolean read FCarrierPrepareCO write FCarrierPrepareCO;
    property CurrencyConversionFactor: Real read FCurrencyConversionFactor write FCurrencyConversionFactor;
    property SEDbyAES: String read FSEDbyAES write FSEDbyAES;
    property AESNumber: String read FAESNumber write FAESNumber;
    property Paperless: Boolean read FPaperless write FPaperless;
    property PaperlessNafta: Boolean read FPaperlessNafta write FPaperlessNafta;
    property InvoiceNumber: String read FInvoiceNumber write FInvoiceNumber;
    property DocsOnly: Boolean read FDocsOnly write FDocsOnly;
   end;

   TMasterShipment = class(TComponent)
   private
    { Private declarations }
    FMasterShipmentID: Real;
    FTrackingNumber: String;
    FShipmentNumber: String;
    FServiceCode: String;
    FBillingType: Integer;
    FImporter: TAddress;
    FWeightUOM: String;
    FCurrencyCode: String;
    FPortOfEntry:TAddress;
    FPortCode: String;


    procedure FillMasterShipmentData;
    procedure FillImporterData;
    procedure FillPortData;

   protected
    { Protected declarations }
   public
    { Public declarations }
    constructor Create(AOwner: TComponent; AMasterShipmentID: Real);
    destructor Destroy; override;
    procedure Refresh;
    function ValidateImporterData: Boolean;
   published
    { Published declarations }
    property MasterShipmentID: Real read FMasterShipmentID write FMasterShipmentID;
    property TrackingNumber: String read FTrackingNumber write FTrackingNumber;
    property ShipmentNumber: String read FShipmentNumber write FShipmentNumber;
    property ServiceCode: String read FServiceCode write FServiceCode;
    property BillingType: Integer read FBillingType write FBillingType;
    property Importer: TAddress read FImporter write FImporter;
    property WeightUOM: String read FWeightUOM write FWeightUOM;
    property CurrencyCode: String read FCurrencyCode write FCurrencyCode;
    property PortOfEntry: TAddress read FPortOfEntry write FPortOfEntry;
    property PortCode: String read FPortCode write FPortCode;
   end;

   // Returns default company data, based on IQSYS or EPLANT.
   procedure GetDefaultCompanyData(const AReturn: Boolean; const AEplantID: Real; const ACompanyID: Real; var ASender: TAddress);
   procedure GetShopRequestSenderData(const AShopRequestID: Real; var ASender: TAddress);
   procedure ClearPackageRec(var APackage: TPackage);
   procedure CopyPackageRec(const ASource: TPackage; var ATarget: TPackage);
   procedure UpdatePackageTrackingNumber(const APackage: TPackage);

   function GetTempFileName( APath, AExt: string ): String;
   function GetTempFileNameEx(AExt: string ): String;
   // Returns a temporary file name, used to print a label.  If the label type
   // is Laser, then you must provide a graphic file extension because each
   // carrier supports a different set of printable graphic file types.
   function GetPrinterFileName(const ALabelType: TPrinterType; AGraphicFileExt: String = '.PNG'): String;

{ ---------------------------------------------------------------------------- }
{ TCodeList }
{ ---------------------------------------------------------------------------- }
type
  // Forward
  TCodeItem = class;

  // Code List
  TCodeList = class(TCollection)
   private
    { Private declarations }
   protected
    { Protected declarations }
   public
    { Public declarations }
    constructor Create; virtual;
    function Add(ACarrier: TCarrierType; ACode, ADescription: String): TCodeItem;
    function FindItem(ACarrier: TCarrierType; ACode, ADescription: String): TCodeItem;
    function FindItemByCode(ACarrier: TCarrierType; ACode: String): TCodeItem;
    function FindItemByDescription(ACarrier: TCarrierType; ADescription: String): TCodeItem;
    function IndexOfCode(ACarrier: TCarrierType; ACode: String): Integer;
    function IndexOfDescription(ACarrier: TCarrierType; ADescription: String): Integer;
   published
    { Published declarations }
   end;

  // Code item
  TCodeItem = class(TCollectionItem)
   private
    { Private declarations }
    FDescription: String;
    FCode: String;
    FCarrier: TCarrierType;
   protected
    { Protected declarations }
   public
    { Public declarations }
     constructor Create(Collection: TCodeList);
     destructor Destroy; override;
   published
    { Published declarations }
    property Carrier: TCarrierType read FCarrier write FCarrier;
    property Code: String read FCode write FCode;
    property Description: String read FDescription write FDescription;
end;

{ ---------------------------------------------------------------------------- }
{ TServiceCodeList }
{ ---------------------------------------------------------------------------- }
type
  // Forward
  TServiceCodeItem = class;

  // Service Code List
  TServiceCodeList = class(TCodeList)
   public
    { Public declarations }
    function Add(ACarrier: TCarrierType; ACode, ADescription: String): TServiceCodeItem;
    function AddEx(ACarrier: TCarrierType; ACode, ADescription: String;
     AFloatField1, AFloatField2: Real; AIntField1, AIntField2: Integer;
     AStrField1, AStrField2: String): TServiceCodeItem;
   end;

  // Service Code (item)
  TServiceCodeItem = class(TCodeItem)
   private
    { Private declarations }
    FOptionsCost: Real;
    FTotalCost: Real;
    FListPrice: Real;
    FIntField1: Integer;
    FIntField2: Integer;
    FStrField1: String;
    FStrField2: String;
    FFloatField2: Real;
    FFloatField1: Real;
    FQuoteNo: String;
    FErrorMsg: String;
   protected
    { Protected declarations }
   public
    { Public declarations }
     constructor Create(Collection: TServiceCodeList);
   published
    { Published declarations }
    property Carrier;
    property Code;
    property Description;

    // List price = what is the list price for this code?
    property ListPrice: Real read FListPrice write FListPrice;
    // Options cost = added cost for options, if any.
    property OptionsCost: Real read FOptionsCost write FOptionsCost;
    // Total cost = list price + options cost
    property TotalCost: Real read FTotalCost write FTotalCost;
    // Quote No from service
    property QuoteNo: String read FQuoteNo write FQuoteNo;
    // Error message if web service failed
    property ErrorMsg: String read FErrorMsg write FErrorMsg;

    // Additional data that may be specific to a carrier
    property IntField1: Integer read FIntField1 write FIntField1;
    property IntField2: Integer read FIntField2 write FIntField2;
    property FloatField1: Real read FFloatField1 write FFloatField1;
    property FloatField2: Real read FFloatField2 write FFloatField2;
    property StrField1: String read FStrField1 write FStrField1;
    property StrField2: String read FStrField2 write FStrField2;

end;

{ ---------------------------------------------------------------------------- }
{ TPackageCodeList }
{ ---------------------------------------------------------------------------- }
type
  // Forward
  TPackageCodeItem = class;

  // Package Code List
  TPackageCodeList = class(TCodeList)
   public
    { Public declarations }
    function Add(ACarrier: TCarrierType; ACode, ADescription: String): TPackageCodeItem;
   end;

  TPackageCodeItem = class(TCodeItem)
   public
    { Public declarations }
    constructor Create(Collection: TPackageCodeList);
   published
    { Published declarations }
    property Code;
    property Description;
end;
{ ---------------------------------------------------------------------------- }


{ ---------------------------------------------------------------------------- }
{ TSoftErrorList }
{ ---------------------------------------------------------------------------- }
type

  TSoftErrorType = (seWarning,
                    seInformation,
                    seShippingWarning,
                    seShippingInformation,
                    seURSAWarning,
                    seURSAInformation);

// Warning, Information, Shipping Warning, Shipping Information, URSA Warning, URSA Information

  // Call back
  TOnSoftError = procedure(const AErrorType: TSoftErrorType;
    const ACode, ADescription: String) of object;

  // Forward
  TSoftErrorItem = class;

  // Code List
  TSoftErrorList = class(TCollection)
   private
    { Private declarations }
   protected
    { Protected declarations }
   public
    { Public declarations }
    constructor Create;
    function Add(AType: TSoftErrorType; ACode, ADescription: String): TSoftErrorItem;
    function FindItem(AType: TSoftErrorType; ACode, ADescription: String): TSoftErrorItem;
    function FindItemByCode(ACode: String): TSoftErrorItem;
    function FindItemByDescription(ADescription: String): TSoftErrorItem;
    function IndexOfCode(ACode: String): Integer;
    function IndexOfDescription(ADescription: String): Integer;
   published
    { Published declarations }
   end;

  // Code item
  TSoftErrorItem = class(TCollectionItem)
   private
    { Private declarations }
    FType: TSoftErrorType;
    FCode: String;
    FDescription: String;
    FErrorType: TSoftErrorType;
    procedure SetErrorType(const Value: TSoftErrorType);
   protected
    { Protected declarations }
   public
    { Public declarations }
     constructor Create(Collection: TSoftErrorList);
     destructor Destroy; override;
   published
    { Published declarations }
    property ErrorType: TSoftErrorType read FErrorType write SetErrorType;
    property Code: String read FCode write FCode;
    property Description: String read FDescription write FDescription;
end;
{ ---------------------------------------------------------------------------- }
   TQuantumViewNotificationClass = class(TComponent)
   public
    Notification: TQuantumViewNotification;
    constructor Create(AOwner: TComponent; ANotification: TQuantumViewNotification);
   end;

   TQuantumView = class(TComponent)
   public
    ShipFrom: String;
    Memo: String;
    FailEmail: String;
    Subject: String;
    SubjectType: Integer;
    Notifications: TList;

    constructor Create(AOwner: TComponent; ASource: String; ASourceID: Real);
   end;
{ ---------------------------------------------------------------------------- }


    //    TURLType = (utAll, utTest, utRates, utShipment, utLabels);
    function GetURL(const ACarrierID: Real; AURLType: TURLType; ADefaultURL: String): String; overload;
    function GetURL(const ACarrierType: TCarrierType; AURLType: TURLType; ADefaultURL: String): String; overload;
//    procedure SetCarrierImage(const ACarrier: TCarrierType; var AImage: TImage);
//    procedure GetCarrierBmp(const ACarrier: TCarrierType; var ABmp: TBitMap);
    function CarrierExists(const ACarrierType: TCarrierType): Boolean;
    function DefaultCarrierID(const ACarrierType: TCarrierType = ctUnknown): Real;
    function CarrierTypeFromIndex(AIndex: Integer): TCarrierType;
    function CarrierTypeFromID(const ACarrierID: Real): TCarrierType;
    procedure UpdateCarrierStatus(const ACarrierID: Real;
      const ACarrierStatus: TCarrierStatus);

    // Generic method that retrieves the full account information for the
    // specified carrier.  Depending on carrier, perhaps only 2 of the
    // returned params will be used.
    procedure FillAccountValues(const ACarrier: TCarrierType;
                                var AParams: TStringList); overload;
    procedure FillAccountValues(const ACarrierID: Real;
                                var AParams: TStringList); overload;
    procedure FillAccountValues(const ACarrierID: Real;
                                var AParamStr: String); overload;
    procedure CheckAccountCreated(const ACarrierID: Real);
    procedure PopulateShopRates(AShopRequestID: Real; ACarrierType: TCarrierType; var AList: TServiceCodeList; AShowErrors: boolean);

// Global variables
var
   DEBUG_MODE: Boolean;
   TEST_MODE: Boolean;

implementation

uses
  IQMS.Common.Boolean,
  IQMS.Common.FileUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Registry,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  shipman_dc,
  shipman_fedex,
  shipman_params,
  shipman_region,
  shipman_share,
  shipman_ups,
  ups_httplink_label,
  ups_httplink_typelib,
  ups_httplink_utils
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  ,iq_updat
  }
  ;

procedure GetDefaultCompanyData(const AReturn: Boolean; const AEplantID: Real; const ACompanyID: Real; var ASender: TAddress);
var
   AData: Variant;
   ASQL: String;
   ASenderSource: String;
   ASenderSourceID: Real;
begin
   // Fills Sender Data

   // First, clear the data we plan to modify.  Do not clear other fields.
   with ASender do
   begin
    Company      := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
    TaxID        := '';
   end;

   // Get the current data
   if (AReturn) then
    begin
     ASQL := Format(
                'select'#13 +
                '   a.ship_from_attn as company,'#13 +
                '   a.ship_from_addr1 as address1,'#13 +
                '   a.ship_from_addr2 as address2,'#13 +
                '   a.ship_from_addr3 as address3,'#13 +
                '   a.ship_from_city as city,'#13 +
                '   a.ship_from_state as state,'#13 +
                '   a.ship_from_zip as zip,'#13 +
                '   country_code.getcountrynamefor(a.ship_from_country_code) as country,'#13 +
                '   a.ship_from_country_code as country_code,'#13 +
                '   a.ship_from_phone as phone,'#13 +
                '   '' '' as taxid,'#13 +
                '   a.ship_from_contact as contact'#13 +
                'from'#13 +
                '   return_shipment a'#13 +
                'where '#13 +
                '    a.id = %.0f ',
                [ACompanyID]);
    end
   else
    begin
     if (ACompanyID > 0) then
      begin
        ASenderSource := 'COMPANY';
        ASenderSourceID := ACompanyID;
      end
     else
       if AEplantID > 0 then
        begin
        ASenderSource := 'EPLANT';
        ASenderSourceID := AEplantID;
        end
       else
        begin
        ASenderSource := 'IQSYS';
        ASenderSourceID := 0;
        end;
     ASQL := Format(
                'select'#13 +
                '   a.company as company,'#13 +
                '   a.address1 as address1,'#13 +
                '   a.address2 as address2,'#13 +
                '   a.address3 as address3,'#13 +
                '   a.city as city,'#13 +
                '   a.state as state,'#13 +
                '   a.zip as zip,'#13 +
                '   a.country as country,'#13 +
                '   a.country_code as country_code,'#13 +
                '   a.phone as phone,'#13 +
                '   a.tax_id as taxid'#13 +
                'from'#13 +
                '   v_company_addresses a'#13 +
                'where '#13 +
                '    a.id = %.0f '#13 +
                'and a.source = ''%s''',
                [ASenderSourceID, ASenderSource]);
    end;

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with ASender do
       begin
        Company      := Trim(AData[0]);
        Address1     := Trim(AData[1]);
        Address2     := Trim(AData[2]);
        Address3     := Trim(AData[3]);
        City         := Trim(AData[4]);
        State        := Trim(AData[5]);
        Zip          := Trim(AData[6]);
        Country      := Trim(AData[7]);
        CountryCode  := Trim(AData[8]);
        Telephone    := Trim(AData[9]);
        TaxID        := Trim(AData[10]);
        if AReturn then
          Contact        := Trim(AData[11]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure we have a USPS-style country name for this code
        Country      := CountryNameFor(CountryCode);
       end;
end;

procedure GetShopRequestSenderData(const AShopRequestID: Real; var ASender: TAddress);
var
   AData: Variant;
   ASQL: String;
begin
   // Fills Sender Data

   // First, clear the data we plan to modify.  Do not clear other fields.
   with ASender do
   begin
    Company      := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
    TaxID        := '';
   end;

   // Get the current data
   ASQL := Format(
              'select'#13 +
              '   a.ship_from_company as company,'#13 +
              '   a.ship_from_addr1 as address1,'#13 +
              '   a.ship_from_addr2 as address2,'#13 +
              '   a.ship_from_addr3 as address3,'#13 +
              '   a.ship_from_city as city,'#13 +
              '   a.ship_from_state as state,'#13 +
              '   a.ship_from_zip as zip,'#13 +
              '   a.ship_from_country_code as country_code'#13 +
              'from'#13 +
              '   shipman_shop_request a'#13 +
              'where '#13 +
              '   a.id = %.0f ',
              [AShopRequestID]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with ASender do
       begin
        Company      := Trim(AData[0]);
        Address1     := Trim(AData[1]);
        Address2     := Trim(AData[2]);
        Address3     := Trim(AData[3]);
        City         := Trim(AData[4]);
        State        := Trim(AData[5]);
        Zip          := Trim(AData[6]);
        CountryCode  := Trim(AData[7]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure we have a USPS-style country name for this code
        Country      := CountryNameFor(CountryCode);
       end;
end;

function CarrierTypeFromIndex(AIndex: Integer): TCarrierType;
var
   o: TCarrierType;
begin
  Result := ctUnknown;
  if (AIndex > 0) and (AIndex <= Ord(High(o))) then
     Result := TCarrierType(AIndex);
end;

function CarrierTypeFromID(const ACarrierID: Real): TCarrierType;
var
  AType: Integer;
begin
  AType := Trunc(SelectValueFmtAsFloat('select type from freight_carrier where id = %.0f',[ACarrierID]));
  if (AType in [0..5]) then
     Result := TCarrierType(AType);
end;

procedure UpdateCarrierStatus(const ACarrierID: Real;
 const ACarrierStatus: TCarrierStatus);
begin
  if ACarrierID > 0 then
     ExecuteCommandFmt('update freight_carrier '#13 +
                     'set status = %d '#13 +
                     'where id = %.0f',
                     [Ord(ACarrierStatus),
                      ACarrierID]);
end;

procedure ClearPackageRec(var APackage: TPackage);
begin
  with APackage do
  begin
    ID                     := 0;
    SourceID               := 0;
    Source                 := '';
    Carrier                := ctUPS;
    CarrierID              := 0;
    //AccountNumber          := '';
    //AccountNumber2         := '';
    //UserName               := '';
    //Password               := '';
    Account                := '';
    Length                 := 0;
    Width                  := 0;
    Height                 := 0;
    Girth                  := 0;
    DimensionUOM           := '';
    PackageSizeType        := 0;
    ActualWeight           := 0;
    BillableWeight         := 0;
    DimensionalWeight      := 0;
    WeightUOM              := '';
    DeclaredValue          := 0;
    ActualCost             := 0;
    BillableCost           := 0;
    OptionsCost            := 0;
    CurrencyCode           := '';
    ServiceCode            := '';
    ServiceCodeDescription := '';
    PackageCode            := '';
    PackageCodeDescription := '';
    PickupCode             := '';
    PickupCodeDescription  := '';

    PayorType              := 0;
    PayorAccount           := '';
    PayorCountry           := '';

    Reference1              := '';
    Reference2              := '';
    Reference3              := '';
    Reference4              := '';
    Reference5              := '';
    Destination            := '';
    Contents               := '';
    TrackingNumber         := '';
    ShipDate               := 0;
    DeliveryDate           := 0;
    //TotalSurcharge         := 0;
    TotalDiscount          := 0;

    PrinterType            := ptUnknown;
    LabelFile              := '';
    LabelBinary            := '';

    PrinterType2           := ptUnknown;
    LabelFile2             := '';
    LabelBinary2           := '';

    XMLRequest             := '';
    XMLResponse            := '';

    Shipped                := FALSE;
    Cancelled              := FALSE;
    Closed                 := FALSE;
    Voided                 := FALSE;
  end;
end;

procedure CopyPackageRec(const ASource: TPackage; var ATarget: TPackage);
begin
    ATarget.ID                     := ASource.ID                    ;
    ATarget.SourceID               := ASource.SourceID              ;
    ATarget.Source                 := ASource.Source                ;
    ATarget.Carrier                := ASource.Carrier               ;
    ATarget.CarrierID              := ASource.CarrierID             ;
    ATarget.Account                := ASource.Account               ;
    //ATarget.AccountNumber          := ASource.AccountNumber         ;
    //ATarget.AccountNumber2         := ASource.AccountNumber2        ;
    //ATarget.UserName               := ASource.UserName              ;
    //ATarget.Password               := ASource.Password              ;
    ATarget.Length                 := ASource.Length                ;
    ATarget.Width                  := ASource.Width                 ;
    ATarget.Height                 := ASource.Height                ;
    ATarget.Girth                  := ASource.Girth                 ;
    ATarget.DimensionUOM           := ASource.DimensionUOM          ;
    ATarget.ActualWeight           := ASource.ActualWeight          ;
    ATarget.BillableWeight         := ASource.BillableWeight        ;
    ATarget.DimensionalWeight      := ASource.DimensionalWeight     ;
    ATarget.WeightUOM              := ASource.WeightUOM             ;
    ATarget.PackageSizeType        := ASource.PackageSizeType       ;
    ATarget.DeclaredValue          := ASource.DeclaredValue         ;
    ATarget.ActualCost             := ASource.ActualCost            ;
    ATarget.BillableCost           := ASource.BillableCost          ;
    ATarget.OptionsCost            := ASource.OptionsCost           ;
    ATarget.CurrencyCode           := ASource.CurrencyCode          ;
    ATarget.ServiceCode            := ASource.ServiceCode           ;
    ATarget.ServiceCodeDescription := ASource.ServiceCodeDescription;
    ATarget.ServiceIcon            := ASource.ServiceIcon           ;
    ATarget.ServiceClass           := ASource.ServiceClass          ;
    ATarget.PackageCode            := ASource.PackageCode           ;
    ATarget.PackageCodeDescription := ASource.PackageCodeDescription;
    ATarget.PickupCode             := ASource.PickupCode            ;
    ATarget.PickupCodeDescription  := ASource.PickupCodeDescription ;
    ATarget.PayorType              := ASource.PayorType             ;
    ATarget.PayorAccount           := ASource.PayorAccount          ;
    ATarget.PayorCountry           := ASource.PayorCountry          ;

    ATarget.Reference1             := ASource.Reference1            ;
    ATarget.Reference2             := ASource.Reference2            ;
    ATarget.Reference3             := ASource.Reference3            ;
    ATarget.Reference4             := ASource.Reference4            ;
    ATarget.Reference5             := ASource.Reference5            ;
    ATarget.Destination            := ASource.Destination           ;
    ATarget.Contents               := ASource.Contents              ;
    ATarget.TrackingNumber         := ASource.TrackingNumber        ;
    ATarget.ShipDate               := ASource.ShipDate              ;
    ATarget.DeliveryDate           := ASource.DeliveryDate          ;
    //ATarget.TotalSurcharge         := ASource.TotalSurcharge        ;
    ATarget.TotalDiscount          := ASource.TotalDiscount         ;

    ATarget.PrinterType            := ASource.PrinterType           ;
    ATarget.LabelFile              := ASource.LabelFile             ;
    ATarget.LabelBinary            := ASource.LabelBinary           ;

    ATarget.PrinterType2           := ASource.PrinterType           ;
    ATarget.LabelFile2             := ASource.LabelFile             ;
    ATarget.LabelBinary2           := ASource.LabelBinary           ;

    ATarget.XMLRequest             := ASource.XMLRequest            ;
    ATarget.XMLResponse            := ASource.XMLResponse           ;

    ATarget.Shipped                := ASource.Shipped               ;
    ATarget.Cancelled              := ASource.Cancelled             ;
    ATarget.Closed                 := ASource.Closed                ;
    ATarget.voided                 := ASource.Voided                ;

end;

procedure UpdatePackageTrackingNumber(const APackage: TPackage);
begin
  ExecuteCommandParam('update shipment_packages set '#13 +
    'tracking_number = :TRACKING_NUMBER,'#13 +
    'service_icon = :SERVICE_ICON,'#13 +
    'service_class = :SERVICE_CLASS where id = :ID',
    ['TRACKING_NUMBER', 'SERVICE_ICON', 'SERVICE_CLASS','ID'],
    [APackage.TrackingNumber, APackage.ServiceIcon, APackage.ServiceClass,APackage.ID]);
end;

function GetTempFileName( APath, AExt: string ): string;
begin
  APath := System.SysUtils.IncludeTrailingPathDelimiter(APath);
  ForceDirectories(APath);
  Result :=  APath + Format('~%s%s',
    [IQMS.Common.Miscellaneous.GetRandomName, AExt]);  // IQMS.Common.Miscellaneous.pas
end;

function GetTempFileNameEx(AExt: string ): string;
var
   APath: String;
begin
  APath := System.SysUtils.IncludeTrailingPathDelimiter(
   IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'Temp');
  Result := GetTempFileName(APath, AExt);
end;

function GetPrinterFileName(const ALabelType: TPrinterType;
 AGraphicFileExt: String = '.PNG'): String;
var
   AExt, ADir: String;
begin
  case ALabelType of
   ptLaser:    AExt := AGraphicFileExt;
   ptEltron:   AExt := '.EPL';
   ptZebra:    AExt := '.ZPL';
   ptUniMark:  AExt := '.PRN';
  else         AExt := '.EPL'; // default to Eltron
  end;

  if (ALabelType = ptLaser) and (Trim(AExt) = '') then
     raise Exception.Create('Application Error:  A graphic file extension must be provided for laser Vcl.Printers.');


  Result := GetTempFileNameEx(AExt);

end;

function IsPackageDimValid(const ALength, AWidth, AHeight: Real;
 const AUOM: String; const AShowError: Boolean): Boolean;
var
   AMax: Integer;
begin
  // Package Dimensions:  Required unless packaging type is letter,
  // express tube, or express box; length + 2 * (width + height) must be
  // less than or equal to 165 IN or 419 CM; dimensions always required
  // for shipments within the UK or within Poland

  AMax := IQMS.Common.Numbers.iIIf(AUOM = 'CM',419 {CM}, 165 {IN});

  Result := (ALength + ((2 * AWidth) + (2 * AHeight))) <= AMax;

  if not Result and AShowError then
     raise Exception.Create(shipman_rscstr.cTXT000016 {'Package dimensions are too large.'});
end;


function IsTelephoneValid(const ACountryCode, ATelephoneNumber: String): Boolean;
var
   S: String;
   i: Integer;
begin
   Result := TRUE;
   if (Trim(ACountryCode) = '') or (Trim(ATelephoneNumber) = '') then Exit;

   // Get just numbers
   S := Numerics(ATelephoneNumber);
   i := Length(S);

   if (ACountryCode = 'US') or (ACountryCode = 'CA') then
      Result := i in [10,11]
   else
      Result := i = 16;

   Result:= TRUE; //zebra
end;

function IsStateCodeValid(const ACountryCode, AStateCode: String): Boolean;
begin
  // Default to true
  Result := TRUE;

  if ACountryCode = 'US' then // USA
     Result := IQMS.Common.StringUtils.StrInList(Trim(AStateCode), StateAbbr_USA) or
               IQMS.Common.StringUtils.StrInList(Trim(AStateCode), StateAbbr_USAMilitaryState)
  else if ACountryCode = 'CA' then // Canada
     Result := IQMS.Common.StringUtils.StrInList(Trim(AStateCode), StateAbbr_Canada)
  else if ACountryCode = 'MX' then // Mexico
     Result := IQMS.Common.StringUtils.StrInList(Trim(AStateCode), StateAbbr_Mexico);

end;

function DeclaredValueRequired(const ACountryCode: String): Boolean;
begin
  Result := (ACountryCode > '') and IQMS.Common.StringUtils.StrInList(ACountryCode, CountriesRequiringDeclaredValue);
end;

procedure CheckDeclaredValueRequired(const ACountryCode: String;
 const ACurrentValue: Real);
begin
  // Don't bother if we have a declared value
  if (ACurrentValue >= 1) or (ACountryCode = '') then Exit;

  if DeclaredValueRequired(ACountryCode) then
     raise Exception.Create(shipman_rscstr.cTXT000030 {'Destination country requires a minimum declared value of $1.00.'});
end;

function GetURL(const ACarrierID: Real; AURLType: TURLType; ADefaultURL: String): String;
begin
  Result := SelectValueFmtAsString('select b.url from freight_carrier a, freight_carrier_url b'#13 +
               'where a.id = %.0f and b.carrier_id = a.id and b.type = %d',[ACarrierID, Ord(AURLType)]);

  if Result = '' then
     Result := ADefaultURL;
end;

function GetURL(const ACarrierType: TCarrierType; AURLType: TURLType; ADefaultURL: String): String;
var
   ACarrierID: Real;
begin
  ACarrierID := SelectValueFmtAsFloat('select id from freight_carrier where type = %d and rownum < 2',[Ord(ACarrierType)]);
  Result := GetURL(ACarrierID, AURLType, ADefaultURL);
end;

{procedure SetCarrierImage(const ACarrier: TCarrierType; var AImage: TImage);
var
   bmp: TBitmap;
   clr: TColor;
   ARscName: String;
   evt: TNotifyEvent;
begin
  if AImage = NIL then Exit;

  try
     bmp := NIL;
     AImage.Picture.Bitmap := NIL;

     case ACarrier of
      ctUPS:            ARscName := 'LOGO_UPS';
      ctFedExGround:    ARscName := 'LOGO_FEDEX_GROUND';
      ctFedExExpress:   ARscName := 'LOGO_FEDEX_EXPRESS';
      ctFedExSmartPost: ARscName := 'LOGO_FEDEX';
      ctUSPS:           ARscName := 'LOGO_USPS';
     else Exit;
     end;// end case

     bmp := TBitmap.Create;
     bmp.LoadFromResourceName(HInstance, ARscName);
     AImage.Picture.Bitmap.Assign(bmp);

  except on E:Exception do
    IQError(E.Message);
  end;

end;}

{procedure GetCarrierBmp(const ACarrier: TCarrierType; var ABmp: TBitMap);
var
   clr: TColor;
   ARscName: String;
   evt: TNotifyEvent;
begin
  if ABmp = NIL then
     ABmp := TBitmap.Create;

  try

     case ACarrier of
      ctUPS:            ARscName := 'LOGO_UPS';
      ctFedExGround:    ARscName := 'LOGO_FEDEX_GROUND';
      ctFedExExpress:   ARscName := 'LOGO_FEDEX_EXPRESS';
      ctFedExSmartPost: ARscName := 'LOGO_FEDEX_SMART_POST';
      ctUSPS:           ARscName := 'LOGO_USPS';
     else Exit;
     end;// end case

     ABmp.LoadFromResourceName(HInstance, ARscName);

  except on E:Exception do
    IQError(E.Message);
  end;

end; }

function CarrierExists(const ACarrierType: TCarrierType): Boolean;
begin
  // Return the account number of the first UPS account
  if SecurityManager.EPlant_ID_AsFloat > 0 then
     Result := (SelectValueFmtAsFloat('select id from'#13 +
                                '(select id from freight_carrier'#13 +
                                ' where type = %d and eplant_id = %.0f'#13 +
                                ' order by id)'#13 +
                                'where rownum < 2',
                                [Ord(ACarrierType), SecurityManager.EPlant_ID_AsFloat]) > 0) // iqlib
  else
     Result := (SelectValueFmtAsFloat('select id from'#13 +
                                '(select id from freight_carrier'#13 +
                                ' where type = %d'#13 +
                                ' order by id)'#13 +
                                'where rownum < 2',
                                [Ord(ACarrierType)]) > 0); // iqlib
end;

function DefaultCarrierID(const ACarrierType: TCarrierType = ctUnknown): Real;
var
   AType: Integer;
   AOverride: Real;
   AKey: String;
begin

  // Get type index for SQL
  AType := Ord(ACarrierType);

  //'and (type = %d and %d = 1 or %d = 0)'#13 +
  // get the "default" carrier id
  if SecurityManager.EPlant_ID_AsFloat > 0 then
     Result := SelectValueFmtAsFloat('select id from freight_carrier '#13 +
      'where NVL(isdefault,''N'')=''Y'' '#13 +
      'and NVL(eplant_id,0) = %.0f'#13 +
      'and (type = %d and %d = 1 or %d = 0)'#13 +
      'order by seq, id',
      [SecurityManager.EPlant_ID_AsFloat,
       AType, INTEGER(AType > 0), INTEGER(AType > 0)])
  else
     Result := SelectValueFmtAsFloat('select id '#13 +
                               'from freight_carrier '#13 +
                               'where NVL(isdefault,''N'')=''Y'' '#13 +
                               'and (type = %d and %d = 1 or %d = 0)'#13 +
                               'order by seq, id',
                               [AType, INTEGER(AType > 0), INTEGER(AType > 0)]);

  // get the first carrier id (no eplant)
  if (Result = 0) and (SecurityManager.EPlant_ID_AsFloat = 0) then
     Result := SelectValueFmtAsFloat('select id '#13 +
                               'from freight_carrier '#13 +
                               'where NVL(eplant_id,0) = 0 '#13 +
                               ' and (type = %d and %d = 1 or %d = 0)'#13 +
                               'order by seq, id',
                               [AType, INTEGER(AType > 0), INTEGER(AType > 0)])

  // get the first carrier id, filtering by eplant as needed
  else if (Result = 0) and (SecurityManager.EPlant_ID_AsFloat > 0) then
     Result := SelectValueFmtAsFloat('select id from '#13 +
                               '(select id'#13 +
                               '  from freight_carrier '#13 +
                               '  where NVL(eplant_id,0) = %.0f '#13 +
                               '    and (type = %d and %d = 1 or %d = 0)'#13 +
                               '  order by seq, id)'#13 +
                               'where rownum < 2',
                               [SecurityManager.EPlant_ID_AsFloat,
                                AType, INTEGER(AType > 0), INTEGER(AType > 0)]);
  AType := Round(SelectValueFmtAsFloat('select type from freight_carrier where id = %.0f', [Result]));

  AKey := ACCOUNT_OVERRIDE_REGISTRY_KEY + Format('\CarrierType%d',[AType]);
  AOverride := IQMS.Common.StringUtils.StrToFloatSafe(IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'CarrierID'));

  if (AOverride > 0) then
    Result := AOverride;

end;

function CommodityCount(APackageID: Real): Integer;
begin
  Result := Trunc(SelectValueFmtAsFloat('select count(*) from shipment_commod '#13 +
    'where shipment_packages_id = %.0f',[APackageID]));
end;

function DocumentCount(APackageID: Real): Integer;
begin
  Result := Trunc(SelectValueFmtAsFloat('select count(*) from shipment_document '#13 +
   'where shipment_packages_id = %.0f',[APackageID]));
end;

function PackageCount(ASourceID: Real; ASource: String): Integer;
begin
  Result := Trunc(SelectValueFmtAsFloat('select count(a.id) as package_count'#13 +
                            'from shipment_packages a'#13 +
                            'where a.source_id = %.0f'#13 +
                            ' and a.source = ''%s'''#13 +
                            ' and NVL(cancelled,''N'') <> ''Y'''#13 +
                            ' and NVL(voided,''N'') <> ''Y''',
                            [ASourceID, ASource]));
end;

function OpenPackageCount(ASourceID: Real; ASource: String): Integer;
begin
  Result := Trunc(SelectValueFmtAsFloat('select count(a.id) as package_count'#13 +
                            'from shipment_packages a'#13 +
                            'where a.source_id = %.0f'#13 +
                            ' and a.source = ''%s'''#13 +
                            ' and NVL(shipped,''N'') <> ''Y'''#13 +
                            ' and NVL(closed,''N'') <> ''Y'''#13 +
                            ' and NVL(cancelled,''N'') <> ''Y'''#13 +
                            ' and NVL(voided,''N'') <> ''Y''',
                            [ASourceID, ASource]));
end;

function ShipmentBillableWeight(ASourceID: Real; ASource: String): Integer;
begin
  Result := Trunc(SelectValueFmtAsFloat('select sum(sp.billable_weight) as total_weight'#13 +
                            'from shipment_packages sp'#13 +
                            'where sp.source_id = %.0f'#13 +
                            ' and sp.source = ''%s'''#13 +
                            ' and NVL(shipped,''N'') <> ''Y'''#13 +
                            ' and NVL(closed,''N'') <> ''Y'''#13 +
                            ' and NVL(cancelled,''N'') <> ''Y''',
                            [ASourceID, ASource]));
end;

procedure GetContactEMailList(const ASourceID: Real; const ASource: String; var AList: TStringList);
begin
  if (ASourceID = 0) or (ASource <> 'SHIPMENTS') or not Assigned(AList) then Exit;
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add('select distinct b.email');
     SQL.Add('from shipments a, contact b');
     SQL.Add('where');
     SQL.Add(Format(' a.id = %.0f',[ASourceID]));
     SQL.Add(' and b.arcusto_id = a.arcusto_id');
     SQL.Add(' and b.email is not NULL');
     SQL.Add('order by b.email');
     Open;
     while not EOF do
      begin
        AList.Add(Trim(Fields[0].AsString));
        Next;
      end;
  finally
     Free;
  end;
end;

procedure GetContactEMailListCmb(const ASourceID: Real; const ASource: String;
  const ACombobox: TUniComboBox);
var
   AList: TStringList;
begin
  // initial
  AList := NIL;
  if Assigned(ACombobox) then
  try
     ACombobox.Items.BeginUpdate;
     ACombobox.Items.Clear;
     AList := TStringList.Create;
     AList.Sorted := True;
     AList.Duplicates := dupIgnore;
     GetContactEMailList(ASourceID,ASource,AList);
     ACombobox.Items.AddStrings(AList);
  finally
    if Assigned(AList) then AList.Free;
     ACombobox.Items.EndUpdate;
  end;
end;

function GetPrinterName(const APrinterID: Real): String;
begin
  Result := SelectValueFmtAsString('select printer from freight_printer where id = %.0f',
   [APrinterID]);
end;

function GetPrinterDisplayName(const APrinterID: Real): String;
begin
  Result := SelectValueFmtAsString('select name from freight_printer where id = %.0f',
   [APrinterID]);
end;

function GetReportFileName(AReportType:TCarrietReportType; const ACarrierId: Real; AValidateExists:Boolean = true): String;
var
  AFieldName:String;
begin
  AFieldName:= 'UnknownCarrierReportType';
  case AReportType of
    rptUpsHighVal      : AFieldName:= 'UPS_HIGH_VALUE_REPORT';
    rptUpsPickupSum    : AFieldName:= 'UPS_PICKUP_SUM_REPORT';
    rptUpsWEDocBox     : AFieldName:= 'UPS_WE_DOC_BOX_REPORT';
    rptUpsWELabel      : AFieldName:= 'UPS_WE_LABEL_REPORT';
    rptUpsMastInvc     : AFieldName:= 'UPS_MASTER_INVOICE_REPORT';
    rptUpsCnsldInvc    : AFieldName:= 'UPS_CNSLD_INVC_DTL_REPORT';
    rptUpsCertOrigin   : AFieldName:= 'UPS_CERT_ORIGIN_REPORT';
    rptUpsCommercInvc  : AFieldName:= 'UPS_COMM_INVC_REPORT';
    rptUpsLabel        : AFieldName:= 'UPS_LABEL_REPORT';
    rptUpsNafta        : AFieldName:= 'UPS_NAFTA_REPORT';
    rptUpsPaperless    : AFieldName:= 'UPS_PAPERLESS_REPORT';
    rptUpsSed          : AFieldName:= 'UPS_SED_REPORT';
    rptUpsDayShipDtl   : AFieldName:= 'UPS_DAY_SHIP_DTL_REPORT';
    rptUpsISA          : AFieldName:= 'UPS_ISA_REPORT';
    rptUpsPOA          : AFieldName:= 'UPS_POA_REPORT';
    rptUpsExchReceipt  : AFieldName:= 'UPS_EXCHANGE_RECEIPT';
    rptUpsRFALabel     : AFieldName:= 'UPS_RFA_LABEL';
    rptUpsExtDoc       : AFieldName:= 'UPS_EXT_DOC_REPORT';
    rptUpsConsignee    : AFieldName:= 'UPS_CONSIGNEE_REPORT';
  end;

  Result := SelectValueFmtAsString( 'select %s from freight_report where FREIGHT_CARRIER_ID = %.0f',
   [ AFieldName, ACarrierId ] );

  IQAssert( FileExists( IQGetReportsPath + Result ),
            // No default report assigned in Carrier Maintenance. Please assign default report.
            shipman_rscstr.cTXT000081 );
end;

function GetBillingName(const ACarrier: Integer; const ACarrierID: Real; const ABillingType: Integer): String;
begin
  Result := SelectValueFmtAsString('select f.descrip from fob f, fob_carrier_link fl '#13 +
    'where f.id = fl.fob_id and fl.carrier_id = %.0f and fl.billing_type = %.0d',
   [ACarrierID, ABillingType]);
  if (Result = '') then
     case TCarrierType(ACarrier) of
      ctUPS:            Result := UPSBillingOptionDescription[TUPSBillingOption(ABillingType)];
      ctFedExGround, ctFedExExpress, ctFedExSmartPost:    Result := FedExBillingOptionDescription[TFedExBillingOption(ABillingType)];
      ctUSPS:           ;
     else Exit;
     end;// end case
end;

function GetBillingDescrip(const ACarrier: Integer; const ABillingType: Integer; const ABillingTypeTax: Integer; const AIntl: Boolean): String;
begin
     case TCarrierType(ACarrier) of
      ctUPS:
        begin
          if (AIntl) then
            Result := UPSBillingOptionDescription[TUPSBillingOption(ABillingType)] + ', ' +
                      UPSBillingOptionDescription[TUPSBillingOption(ABillingTypeTax)]
          else
            Result := UPSBillingOptionDescription[TUPSBillingOption(ABillingType)];
        end;
      ctFedExGround, ctFedExExpress, ctFedExSmartPost:    Result := FedExBillingOptionDescription[TFedExBillingOption(ABillingType)];
      ctUSPS:           ;
     else Exit;
     end;// end case
end;
procedure FillAccountValues(const ACarrier: TCarrierType;
  var AParams: TStringList);
var
   ACarrierID: Real;
begin
  if not Assigned(AParams) then Exit;
  ACarrierID := DefaultCarrierID(ACarrier);
  FillAccountValues(ACarrierID, AParams);
end;

procedure FillAccountValues(const ACarrierID: Real;
  var AParams: TStringList);
var
   ACarrierType: TCarrierType;
   APrimeContact: String;

   procedure _Add(AName, AValue: String);
   begin
     AParams.Add(Format('%s=%s',[AName, AValue]));
   end;

begin

  if not Assigned(AParams) then Exit;

  ACarrierType := TCarrierType(Trunc(SelectValueFmtAsFloat('select type ' +
   'from freight_carrier where id = %.0f',
   [ACarrierID])));
  APrimeContact := SelectValueFmtAsString('select prime_contact from freight_carrier where id = %.0f',
   [ACarrierID]);
  with TCarrierOptions.Create(NIL, ACarrierID) do
  try
     Refresh;
     case ACarrierType of
      ctUPS:
       begin
         _Add('AccountNumber',ParamByName('AccountNumber').AsString);
         _Add('MailboxID',ParamByName('MailboxID').AsString);
         _Add('RegistrationID',ParamByName('RegistrationID').AsString);
         _Add('Password',ParamByName('Password').AsString);
         _Add('rfaMailerID',ParamByName('rfaMailerID').AsString);
       end;
      ctFedExGround, ctFedExExpress, ctFedExSmartPost:
       begin
         _Add('AccountNumber',ParamByName('AccountNumber').AsString);
         _Add('MeterNumber',ParamByName('MeterNumber').AsString);
         _Add('CSPUserKey',ParamByName('CSPUserKey').AsString);
         _Add('CSPUserPass',ParamByName('CSPUserPass').AsString);
       end;
      ctUSPS:
       begin
         _Add('UserName',ParamByName('UserName').AsString);
         _Add('Password',ParamByName('Password').AsString);
       end;
      end; // end case

     if (APrimeContact > '') then
        _Add('PrimeContact',APrimeContact);
  finally
     Free;
  end;

end;

procedure FillAccountValues(const ACarrierID: Real;
                            var AParamStr: String);
var
   AParams: TStringList;
begin
   try
      AParams := TStringList.Create;
      FillAccountValues(ACarrierID, AParams);
      AParamStr := IQMS.Common.StringUtils.StrTran(AParams.Text, #13, ';');
   finally
      if Assigned(AParams) then AParams.Free;
   end;
end;

procedure CheckAccountCreated(const ACarrierID: Real);
begin
  ExecuteCommandFmt('begin iqms.shipman.check_carrier_options_created(%.0f); end;',
   [ACarrierID]);
end;

function FindCreateReturnShipment(ASourceID: Real; ASource: String): Real;
  var
    AReturnShipmentID: Real;
begin
  AReturnShipmentID := SelectValueFmtAsFloat('select id from return_shipment where parent_source = ''%s'' and parent_id = %.0f', [ASource, ASourceID]);
  if (AReturnShipmentID <= 0) then
  begin
    AReturnShipmentID := GetNextID('RETURN_SHIPMENT');
    if (ASource = 'SHIPMENTS') then
        begin
            ExecuteCommandFmt('insert into return_shipment(id, parent_id, parent_source, ship_from_contact, ship_from_attn, ship_from_addr1, ship_from_addr2, '#13 +
              'ship_from_addr3, ship_from_city, ship_from_state, ship_from_zip, ship_from_country_code, ship_from_residential, ship_from_phone, eplant_id, '#13 +
              'ship_to_attn, ship_to_addr1, ship_to_addr2, ship_to_addr3, ship_to_city, ship_to_state, ship_to_zip, '#13 +
              'ship_to_country_code, ship_to_residential, ship_to_phone, packslipno) '#13 +
              'select %.0f, %.0f, ''%s'', s.manifest_contact, s.ship_to_attn, s.ship_to_addr1, s.ship_to_addr2, s.ship_to_addr3, s.ship_to_city, s.ship_to_state, '#13 +
              's.ship_to_zip, substr(country_code.get2charcountrycode(s.ship_to_country),1,2), s.ship_residential, s.ship_to_phone_number, s.eplant_id, '#13 +
              'c.company, c.address1, c.address2, c.address3, c.city, c.state, c.zip, c.country_code, ''N'', c.phone, s.packslipno '#13 +
              'from shipments s, v_company_addresses c where s.id = %.0f '#13 +
              'and c.source = decode(nvl(s.company_id, 0), 0, decode(nvl(s.eplant_id, 0), 0, ''IQSYS'', ''EPLANT''), ''COMPANY'') '#13 +
              'and c.id = decode(nvl(s.company_id, 0), 0, decode(nvl(s.eplant_id, 0), 0, 0, s.eplant_id), s.company_id) ', [AReturnShipmentID, ASourceID, ASource, ASourceID]);
        end;
    if (ASource = 'MANUAL_PACKSLIP') then
        begin
            ExecuteCommandFmt('insert into return_shipment(id, parent_id, parent_source, ship_from_contact, ship_from_attn, ship_from_addr1, ship_from_addr2, '#13 +
              'ship_from_addr3, ship_from_city, ship_from_state, ship_from_zip, ship_from_country_code, ship_from_residential, ship_from_phone, eplant_id, '#13 +
              'ship_to_attn, ship_to_addr1, ship_to_addr2, ship_to_addr3, ship_to_city, ship_to_state, ship_to_zip, '#13 +
              'ship_to_country_code, ship_to_residential, ship_to_phone, packslipno) '#13 +
              'select %.0f, %.0f, ''%s'', s.contact, s.prime_contact, s.addr1, s.addr2, s.addr3, s.city, s.state, '#13 +
              's.zip, substr(country_code.get2charcountrycode(s.country),1,2), s.ship_residential, s.phone_number, s.eplant_id, '#13 +
              'c.company, c.address1, c.address2, c.address3, c.city, c.state, c.zip, c.country_code, ''N'', c.phone, s.packslipno '#13 +
              'from manual_packslip s, v_company_addresses c where s.id = %.0f '#13 +
              'and c.source = decode(nvl(s.company_id, 0), 0, decode(nvl(s.eplant_id, 0), 0, ''IQSYS'', ''EPLANT''), ''COMPANY'') '#13 +
              'and c.id = decode(nvl(s.company_id, 0), 0, decode(nvl(s.eplant_id, 0), 0, 0, s.eplant_id), s.company_id) ', [AReturnShipmentID, ASourceID, ASource, ASourceID]);
        end;
  end;
  Result := AReturnShipmentID;
end;

function CreateMasterShipment(ASourceID: Real; ASource: String; AServiceCode: String): Real;
  var AMasterShipmentID: Real;
   AUPSAccount: TStringList;
   AAccountNumber, ATrackingNumber, AServiceIcon, AServiceClass, AShipmentNumber: String;
   tmpR, ACarrierID: Real;
begin
  // get the UPS account
  try
     AUPSAccount := TStringList.Create;
     ACarrierID := SelectValueFmtAsFloat('select distinct carrier_id from shipment_packages'#13 +
                             'where source_id = %.0f and source = ''%s''', [ASourceID, ASource]);

     shipman_common.FillAccountValues(ACarrierID, AUPSAccount);
     AAccountNumber := AUPSAccount.Values['AccountNumber'];
  finally
     AUPSAccount.Free;
  end;

  // get the next tracking number
  with TUPSTrackingNumberGenerator.Create(NIL) do // ups_httplink_label.pas
  try
    ReturnService := false;
    ImportControl := false;

    AccountNumber := AAccountNumber;
    UPSService := shipman_ups.UPS_ServiceType_From_Code(AServiceCode); // in ups_httplink_typelib.pas (TUPSService)
    ShipFromCountryCode := 'US';
    ShipToCountryCode := 'XX';
    SaturdayDelivery := False;
    DeliveryConfirmation := False;
    SignatureOption := usoNoSignature; // in ups_httplink_typelib.pas (TUPSSignatureOption)
    ShipperRelease := False;
    ProactiveResponse := False;
    COD := False;
    tmpR := IQMS.Common.Sequence.GetNextSequenceNumber('S_UPS_REFERENCE');

    // check sequence number size and reset if necessary
    if tmpR > 9999999 then
       begin
         IQMS.Common.Sequence.SetNextSequenceNumber(1,'S_UPS_REFERENCE');
         tmpR := IQMS.Common.Sequence.GetNextSequenceNumber('S_UPS_REFERENCE');
       end;
    ReferenceNumber := FloatToStr(tmpR);

    Calculate;

    ATrackingNumber := TrackingNumber;
    AServiceIcon := ServiceIcon;
    AServiceClass := ServiceClass;
  finally
    Free;
  end;

  AShipmentNumber := ups_httplink_utils.CalculateShipmentNumber(ATrackingNumber);

  AMasterShipmentID := GetNextID('MASTER_SHIPMENT');
  ExecuteCommandFmt('insert into master_shipment(id, pickup_date, service_code, service_descrip,'#13 +
            'billing_type, weight_uom, curr_code, ups_port_of_entry_id, portcode, importer_id, '#13 +
            'doc_box_service_icon, doc_box_service_class, eplant_id, carrier_id, tracking_number, '#13 +
            'shipment_number, doc_box_contents, world_ease)'#13 +
            'select distinct %.0f, trunc(sysdate), sp.service_code, sp.service_descrip,'#13 +
            'sp.billing_type, sp.weight_uom, si.curr_code, poe.id, poe.portcode, si.importer_id, '#13 +
            '''%s'', ''%s'', s.eplant_id, sp.carrier_id, ''%s'', ''%s'', sp.contents, ''Y'''#13 +
            'from v_packslips s, shipment_packages sp,'#13 +
                 'shipment_invoice si,'#13 +
                 'ups_port_of_entry poe'#13 +
            'where s.source_id = sp.source_id and s.source = sp.source '#13 +
            'and sp.source_id = %.0f and sp.source = ''%s'''#13 +
            'and poe.id = shipman.get_poe_id(sp.source_id, sp.source)'#13 +
            'and sp.source_id = si.source_id(+) and sp.source = si.source(+)',
            [AMasterShipmentID, AServiceIcon, AServiceClass, ATrackingNumber,
            AShipmentNumber, ASourceID, ASource]);
  Result := AMasterShipmentID;

end;

function FedExStrToDate(s:string):TDateTime;
var
  ADefault: TDateTime;
begin
  try
     ADefault := Date + 1;
     // Follows this format:  YYYY-MM-DD
     if S > '' then Result := IQMS.Common.NLS.IQStrToDate(S)
     else Result := ADefault;
  except
     Result := ADefault;
  end;
end;

procedure SyncUPSWithMaster;
var
  n:Integer;
  HasErrors:Boolean;
  ADir: String;
begin
   { TODO -ombaral -cWebIQ : Need to resolve dependency }
  (*
  n:= 0;
  HasErrors:= FALSE;
  with TIQUpdate.Create do
  try
    try
       CheckSourceDestinationDirs;
      SetOutOfDateFilesList( 'Postal.dat' , true);
      SetOutOfDateFilesList( 'etbl.bin', true );
//      if not fileExists(IQMS_Local_Home +'Postal.dat') then
//        List.Add(IQMS_Master_Home +'Postal.dat');
//      if not fileExists(IQMS_Local_Home +'etbl.bin') then
//        List.Add(IQMS_Master_Home +'etbl.bin');

      n:= CopyFromMaster( List ); // pass the full list of found files

      if (n > 0) then
      begin

        ADir := IQMS_Local_Home + 'UPS' +
          System.SysUtils.PathDelim + 'Files' + System.SysUtils.PathDelim;
        if (not DirectoryExists(ADir)) then
          ForceDirectories(ADir);

        with TIQCopyDir.Create( IQMS_Local_Home, ADir ) do
          try
             IncludeSubDir := false;
             CopyFiles( [ 'POSTAL.DAT' ] );
          finally
             Free;
          end;

        with TIQCopyDir.Create( IQMS_Local_Home, ADir ) do
          try
             IncludeSubDir := false;
             CopyFiles( [ 'ETBL.BIN' ] );
          finally
             Free;
          end;
      end;

    except
       HasErrors:= TRUE;
//       Application.ShowException( Exception( ExceptObject ));
    end;
  finally
    Free;
  end;
  *)

end;

procedure PopulateShopRates(AShopRequestID: Real; ACarrierType: TCarrierType;
  var AList: TServiceCodeList; AShowErrors: Boolean);
var
  ASQL: String;
  AData: Variant;
  AService, ADescription, AQuoteNo, AErrorMsg: String;
  AOptionsCost, AListPrice, ATotalCost, AID: Real;

  // --------------------------------------------------------------------------
  procedure _AddRow;
  var
    o: TServiceCodeItem;
  begin
    o := AList.Add(ACarrierType, AService, ADescription);
    if o = NIL then
      Exit;
    with o do
    begin
      OptionsCost := AOptionsCost;
      ListPrice := AListPrice;
      TotalCost := ATotalCost;
      FloatField1 := AID;
      QuoteNo := AQuoteNo;
      ErrorMsg := AErrorMsg;
    end;
  end;

begin
  with TFDQuery.Create(NIL) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('select id, service_code, package_cost, options_cost, total_cost, freight_id, quote_no, error_msg, service_level ');
      SQL.Add('from shipman_shop_rate ');
      SQL.Add('where ');
      SQL.Add(Format('shipman_shop_request_id = %.0f', [AShopRequestID]));
      SQL.Add(Format(' and carrier_type = %.0d', [Ord(ACarrierType)]));
      if not AShowErrors then
        SQL.Add(' and nvl(freight_id, 0) > 0');

      Open;

      while not EOF do
      begin
        AService := FieldByName('SERVICE_CODE').AsString;
        case (ACarrierType) of
          ctUPS: ADescription := shipman_ups.UPS_Service_Description_From_Code(AService);
          ctFedExGround: ADescription := shipman_fedex.FedEx_Service_Description_From_Code(AService);
          ctFedExExpress: ADescription := shipman_fedex.FedEx_Service_Description_From_Code(AService);
          ctFedExSmartPost: ADescription := shipman_fedex.FedEx_Service_Description_From_Code(AService);
        else
          if FieldByName('FREIGHT_ID').AsFloat = 0 then
            ADescription := FieldByName('ERROR_MSG').AsString
          else
          begin
            ADescription := SelectValueFmtAsString('select descrip from freight where id = %.0f', [FieldByName('FREIGHT_ID').AsFloat]);
            if FieldByName('service_level').AsString <> '' then
              ADescription := ADescription + ' - ' + FieldByName('service_level').AsString;
          end;
        end;
        AID := FieldByName('ID').AsFloat;
        AListPrice := FieldByName('PACKAGE_COST').AsFloat;
        AOptionsCost := FieldByName('OPTIONS_COST').AsFloat;
        ATotalCost := FieldByName('TOTAL_COST').AsFloat;
        AQuoteNo := FieldByName('QUOTE_NO').AsString;
        AErrorMsg := FieldByName('ERROR_MSG').AsString;
        _AddRow;
        Next;
      end;
    finally
      Free;
    end;

end;

function GenerateAESDirectFiling(ASource: String; ASourceId: Real; ACarrierId: Real; AEplantId: Real): String;
var
  AShipment: TShippingInfo;
  AInvoice: TShipmentInvoice;
  AGood: TShipmentGood;
  AHTML: TStringList;
  AFilename: String;
  ACarrierType: TCarrierType;
  AFirst, AMiddle, ALast: String;
  i: Integer;
  procedure _AddItem(ACode: String; AValue:String);
  begin
    AHTML.Add(Format('<input type="HIDDEN" name="%s" VALUE="%s">', [ACode, AValue]) + #10#13);
  end;
  procedure _AddLine(AString:String);
  begin
    AHTML.Add(AString + #10#13);
  end;
begin
  AFilename := GetTempFileNameEx('.html');
  ACarrierType := CarrierTypeFromID(ACarrierId);
  AShipment := TShippingInfo.Create(nil, ASourceId, ASource, ACarrierId, AEplantId);
  AInvoice := TShipmentInvoice.Create(nil, ASourceId, ASource, False);
  AHTML := TStringList.Create;
  _AddLine('<html>');
  _AddLine('<head>');
  _AddLine('<title>Submit to AESDirect</title>');
  _AddLine('</head>');
  _AddLine('<body>');
  _AddLine('<form action="https://www.aesdirect.gov/weblink/weblink.cgi" method="POST">');

  _AddLine('<!-- System Variables -->');
  _AddItem('wl_app_ident', '');     //TODO Application Identifier
  _AddItem('wl_app_name', '');     //TODO  Application Name
  _AddItem('wl_nologin_url', '');     //TODO Unsuccessful Login URL
  _AddItem('wl_nosed_url', '');     //TODO No EEI Return URL
  _AddItem('wl_success_url', '');     //TODO Succuss Return URL
  _AddItem('EMAIL', '');     //TODO Response Email Address - defaults to account email

  _AddLine('<!-- General Information -->');
  _AddItem('SRN', '');     //TODO Shipment Reference Number
  _AddItem('ST', AShipment.Sender.State);  //State of Origin
  _AddItem('POE', '');     //TODO Port of Export
  _AddItem('COD', AShipment.Recipient.CountryCode);     //Country of Destination
  _AddItem('POU', '');     //TODO Port of Unlading (Only for vessel shipments?)
  if (ACarrierType in [ctFedExGround, ctFedExExpress]) then
    begin
      AShipment.FillShipmentOptionsFedex;
      if (AShipment.ShipmentOptionFedex.FutureDayShip) then
        _AddItem('EDA', FormatDateTime('yymmdd', AShipment.ShipmentOptionFedex.ShipDate))     //Departure Date YYMMDD
      else
        _AddItem('EDA', FormatDateTime('yymmdd', Date()));     //Departure Date YYMMDD
    end
  else
    _AddItem('EDA', FormatDateTime('yymmdd', Date()));     //Departure Date YYMMDD
  _AddItem('MOT', '');     //TODO Mode of Transport
  _AddItem('SCAC', '');     //TODO Carrier
  _AddItem('VN', '');     //TODO Conveyance Name
  _AddItem('RCC', IQMS.Common.Boolean.BoolToYN(AInvoice.PartiesRelated));     //Related Companies
  _AddItem('HAZ', 'N');     //Hazardous Cargo
  _AddItem('RT', IQMS.Common.Boolean.BoolToYN(AInvoice.RoutedTransaction));     //Related Companies
  if (AInvoice.SEDbyAES = 'E') then
    _AddItem('FO', '2') //  Filing Option - Predeparture
  else
    _AddItem('FO', '4'); //  Filing Option - Postdeparture

  _AddLine('<!-- U.S. Principal Party in Interest (USPPI) -->');
  _AddItem('AD0_1', AShipment.Sender.Company);  //Name
  _AddItem('AD0_2', AShipment.Sender.TaxID);  //ID Number
  _AddItem('AD0_3', 'E');  //ID Type - E = EIN
  _AddItem('AD0_4', AShipment.Sender.Address1);  //Address Line 1
  _AddItem('AD0_5', AShipment.Sender.Address2);  //Address Line 2
  _AddItem('AD0_6', AShipment.Sender.City);  //City
  _AddItem('AD0_7', AShipment.Sender.State);  //State
  _AddItem('AD0_8', AShipment.Sender.Zip);  //Zip
  IQMS.Common.StringUtils.ParseFullName(AShipment.Sender.Contact, AFirst, AMiddle, ALast);
  _AddItem('AD0_9', AFirst);  //Contact First Name
  if (AMiddle <> '') then
    _AddItem('AD0_10', LeftStr(AMiddle, 1)); //Contact Middle Initial
  _AddItem('AD0_11', ALast);  //Contact Last Name
  _AddItem('AD0_12', AShipment.Sender.Telephone);  //Contact Phone

  _AddLine('<!-- Ultimate Consignee -->');
  _AddItem('AD1_3', AShipment.Recipient.Company);  //Name
  _AddItem('AD1_5', AShipment.Recipient.Contact);  //Contact Name
  _AddItem('AD1_7', AShipment.Recipient.Telephone);  //Contact Phone
  _AddItem('AD1_8', AShipment.Recipient.Address1);  //Address Line 1
  _AddItem('AD1_9', AShipment.Recipient.Address2);  //Address Line 2
  _AddItem('AD1_10', AShipment.Recipient.City);  //City
  if ((AShipment.Recipient.CountryCode = 'US') or
      (AShipment.Recipient.CountryCode = 'MX') or
      (AShipment.Recipient.CountryCode = 'CA')) then
    _AddItem('AD1_11', AShipment.Recipient.State);  //State
  _AddItem('AD1_12', AShipment.Recipient.CountryCode);  //Country
  if (AShipment.Recipient.CountryCode = 'US') then
    _AddItem('AD1_13', AShipment.Recipient.Zip);  //Zip
  _AddItem('AD1_14', 'D');  //TODO Ultimate Consignee Type

  if (AInvoice.UseImporter) then
  begin
    _AddLine('<!-- Intermediate Consignee -->');
    _AddItem('AD4_3', AInvoice.Importer.Company);  //Name
    _AddItem('AD4_5', AInvoice.Importer.Contact);  //Contact Name
    _AddItem('AD4_7', AInvoice.Importer.Telephone);  //Contact Phone
    _AddItem('AD4_8', AInvoice.Importer.Address1);  //Address Line 1
    _AddItem('AD4_9', AInvoice.Importer.Address2);  //Address Line 2
    _AddItem('AD4_10', AInvoice.Importer.City);  //City
    if ((AInvoice.Importer.CountryCode = 'US') or
        (AInvoice.Importer.CountryCode = 'MX') or
        (AInvoice.Importer.CountryCode = 'CA')) then
      _AddItem('AD4_11', AInvoice.Importer.State);  //State
    _AddItem('AD4_12', AInvoice.Importer.CountryCode);  //Country
    if (AInvoice.Importer.CountryCode = 'US') then
      _AddItem('AD4_13', AInvoice.Importer.Zip);  //Zip
  end;

  for i := 0 to AInvoice.Goods.Count - 1 do
    begin
      AGood := TShipmentGood(AInvoice.Goods[i]);
      _AddItem(Format('isLine%d', [i + 1]), 'Y');  //Line Item Flag
      _AddItem(Format('IT%d_1', [i + 1]), 'Y');  //Export Code - TODO
      _AddItem(Format('IT%d_2', [i + 1]), '' + IntToStr(Round(AGood.UnitPrice * AGood.Qty)));  //Value in Whole US Dollars
    end;

  _AddLine('<table cellpadding="3" border="0" cellspacing="0">');
  _AddLine('<tbody><tr>');
  _AddLine('<td bgcolor="#EEEEEE" align="center" valign="middle">');
  _AddLine('<img src="http://aesdirect.census.gov/pix/aesdirect_s.jpg" height="31" width="88" alt="AESDirect"></td>');
  _AddLine('<td bgcolor="#EEEEEE" align="center" valign="middle"><font face="verdana,arial,helvetica" size="1">');
  _AddLine('<input type="submit" value="Submit EEI to AESWebLink"><br>');
  _AddLine('<a href="http://aesdirect.census.gov" target="_blank">AES<i>Direct</i> Homepage</a> | <a href="#" ');
  _AddLine('onclick="window.open(''http://aesdirect.census.gov/support/weblink_login_help.html'',''aeshelp'',''width=460,height=300'');">AES<i>WebLink</i> Login Help</a></font></td>');
  _AddLine('</tr></tbody></table>');
  _AddLine('</form>');
  _AddLine('</body>');
  _AddLine('</html>');

  Result := AFilename;
end;

constructor TPackageClass.Create(AOwner: TComponent; APackage:TPackage);
begin
  inherited Create(AOwner);
  Package := APackage;
end;

{ ---------------------------------------------------------------------------- }
{ TShippingInfo }
{ ---------------------------------------------------------------------------- }

constructor TShippingInfo.Create(AOwner: TComponent; ASourceID: Real; ASource: String; ACarrierID,
 AEplantID: Real);
 var
 AMSID: Real;
begin
  inherited Create(AOwner);
  // Set internal vars
  FCarrierID := ACarrierID;
  FEplantID := AEplantID;
  FSourceID := ASourceID;
  if (FSourceID > 0) then
    FSource := ASource
  else
    FSource := 'SHIPMENTS';

  AMSID := 0;
  if ((ASourceID > 0) and ((ASource = 'SHIPMENTS') or (ASource = 'MANUAL_PACKSLIP'))) then
    AMSID := SelectValueFmtAsFloat('select master_shipment_id from %s s, master_shipment ms where ms.id = s.master_shipment_id'#13 +
      ' and nvl(ms.world_ease, ''N'') = ''Y'' and s.id = %.0f', [ASource, ASourceID]);
  if (AMSID > 0) then
  begin
    FMasterShipmentID := AMSID;
    FWorldEase := true;
  end;
  if ((ASourceID > 0) and ((ASource = 'SHIPMENTS') or (ASource = 'MANUAL_PACKSLIP'))) then
    AMSID := SelectValueFmtAsFloat('select master_shipment_id from %s s, master_shipment ms where ms.id = s.master_shipment_id'#13 +
      ' and nvl(ms.trade_direct, ''N'') = ''Y'' and s.id = %.0f', [ASource, ASourceID]);
  if (AMSID > 0) then
  begin
    FMasterShipmentID := AMSID;
    FTradeDirect := true;
  end;
  // Now, refresh
  Refresh;
end;

destructor TShippingInfo.Destroy;
begin

  inherited Destroy;
end;

procedure TShippingInfo.SetSourceID(const ASourceID: Real; ASource: String);
begin
  FSourceID := ASourceID;
  FSource := ASource;
  Refresh;
end;

procedure TShippingInfo.SetEplantID(const Value: Real);
begin
  FEplantID := Value;
  Refresh;
end;

procedure TShippingInfo.SetCarrierID(const Value: Real);
begin
  FCarrierID := Value;
  Refresh;
end;

procedure TShippingInfo.Refresh;
begin
  FillPackingSlipData;
  FillSenderData;
  FillRecipientData;
  FillThirdPartyData;
  FDocuments := Trunc(SelectValueFmtAsFloat('select content_type from v_packslips where source_id = %.0f and source = ''%s''', [SourceID, Source])) = 1;
end;

procedure TShippingInfo.FillSenderData;
var
   AData: Variant;
   ASQL,
   AContact, AFirstName, ALastName: String;
   AEplantID: Real;
   ACompanyID: Real;
   ASender: TAddress;
   AUPSAccount: TStringList;
begin
   // Fills Sender Data

   // First, clear the existing data
   with FSender do
   begin
    Company      := '';
    Contact      := '';
    FirstName    := '';
    LastName     := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
    TaxID        := '';
    AccountNumber:= '';
   end;


   // Eplant ID must either come from shipments or the package.  We are getting
   // the SHIPMENTS.EPLANT_ID here.  This cannot come from the SecurityManager
   // filter in case the user is in "Show All" mode, but the SHIPMENTS record
   // has an eplant assigned.  Ideally, this value should come from the
   // package Carrier record; so, we allow the EplantID to be specified by
   // the calling application.
   AUPSAccount := TStringList.Create;
   FillAccountValues(FCarrierID, AUPSAccount);
   FSender.AccountNumber := AUPSAccount.Values['AccountNumber'];

   AEplantID := FEplantID;
   if AEplantID = 0 then
      AEplantID := SelectValueFmtAsFloat('select eplant_id from v_packslips where source = ''%s'' and source_id = %.0f',
        [Source, SourceID]);

    ACompanyID := SelectValueFmtAsFloat('select company_id from v_packslips where source = ''%s'' and source_id = %.0f',
      [Source, SourceID]);
   // Call the foregoing wrapper to get the basic company information
   if (Source = 'SHIPMAN_SHOP_REQUEST') then
     GetShopRequestSenderData(SourceID, FSender)
   else
    if (Source = 'RETURN_SHIPMENT') then
     GetDefaultCompanyData(true, AEplantID, SourceID, FSender)
    else
     GetDefaultCompanyData(false, AEplantID, ACompanyID, FSender);

   if Trim(FSender.Contact) = '' then
      FSender.Contact := Trim(Format('%s %s',
       [Trim(FSender.FirstName), Trim(FSender.LastName)]));

   // Get the contact information from the packing slip
   //AContact := SelectValueFmtAsString('select bill_to_prime_contact from shipments where id = %.0f',[ShipmentsID]);
   if (Source = 'RETURN_SHIPMENT') then
     AContact := FSender.Contact
   else
     AContact := SelectValueFmtAsString('select prime_contact from freight_carrier where id = %.0f',[CarrierID]);
   if AContact > '' then
      begin
       ParseFullName(AContact, AFirstName, ALastName); // shipman_region.pas
        with FSender do
         begin
          Contact      := AContact;
          FirstName    := AFirstName;
          LastName     := ALastName;
         end;
      end;
end;

procedure TShippingInfo.FillRecipientData;
var
   AData: Variant;
   AFirstName,
   ALastName,
   ASQL: String;
begin
   // First, clear the existing data
   with FRecipient do
   begin
    Company      := '';
    Contact      := '';
    FirstName    := '';
    LastName     := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    CountryCode3Digit := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
    TaxID        := '';
   end;

   if SourceID = 0 then Exit;

   ASQL := Format(
           'select'#13 +
           '   a.ship_to_attn as ship_to_attn,'#13 +
           '   a.ship_to_prime_contact as ship_to_prime_contact,'#13 +
           '   a.ship_to_addr1 as ship_to_addr1,'#13 +
           '   a.ship_to_addr2 as ship_to_addr2,'#13 +
           '   a.ship_to_addr3 as ship_to_addr3,'#13 +
           '   a.ship_to_city as ship_to_city,'#13 +
           '   a.ship_to_state as ship_to_state,'#13 +
           '   a.ship_to_zip as ship_to_zip,'#13 +
           '   a.ship_to_country as ship_to_country,'#13 +
           '   a.ship_to_country_code as ship_to_country_code,'#13 +
           '   a.ship_to_phone_number as ship_to_phone_number,'#13 +
           '   a.ship_to_ext as ship_to_ext,'#13 +
           '   a.ship_to_fax as ship_to_fax,'#13 +
           '   a.ship_to_note as ship_to_note'#13 +
           'from'#13 +
           '   v_packslips a'#13 +
           'where'#13 +
           '   a.source_id = %.0f'#13 +
           '   and a.source = ''%s'''#13,
           [SourceID, Source]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FRecipient do
       begin
        Company      := Trim(AData[0]);
        Contact      := Trim(AData[1]);
        ParseFullName(Contact, AFirstName, ALastName); // shipman_region.pas
        FirstName    := AFirstName;
        LastName     := ALastName;
        Address1     := Trim(AData[2]);
        Address2     := Trim(AData[3]);
        Address3     := Trim(AData[4]);
        City         := Trim(AData[5]);
        State        := Trim(AData[6]);
        Zip          := Trim(AData[7]);
        Country      := Trim(AData[8]);
        CountryCode  := Trim(AData[9]);
        Telephone    := Trim(AData[10]);
        Ext          := Trim(AData[11]);
        Fax          := Trim(AData[12]);
        TaxID        := Trim(AData[13]);
        // Get e-mail from shipment options
        EMail        := SelectValueFmtAsString(
         'select iqms.shipman.get_shipment_option(%.0f,''%s'', ''RecipientEMail'') from dual',
           [SourceID, Source]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure we have a USPS-style country name for this code
        if (CountryCode <> '') then
          Country      := CountryNameFor(CountryCode);

        // ensure the country code is populated
        if CountryCode = '' then
           begin
             CountryCode  := CountryCodeFor(Country, cctChr2);
             Country      := CountryNameFor(CountryCode);
             // update the country code for later
             //if CountryCode > '' then
             //   ExecuteCommandFmt('update shipments set country_code = ''%s'' where id = %.0f', [CountryCode, ShipmentsID]);
           end;
        CountryCode3Digit := shipman_region.CountryCodeFor(Country, cctDigit3);
       end;


end;

procedure TShippingInfo.FillThirdPartyData;
var
   AData: Variant;
   AFirstName,
   ALastName,
   ASQL: String;
begin
   // First, clear the existing data
   with FThirdParty do
   begin
    Company      := '';
    Contact      := '';
    FirstName    := '';
    LastName     := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    CountryCode3Digit := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
   end;

   if SourceID = 0 then Exit;

   ASQL := Format(
           'select'#13 +
           '   t.attn as attn,'#13 +
           '   t.prime_contact as prime_contact,'#13 +
           '   t.addr1 as addr1,'#13 +
           '   t.addr2 as addr2,'#13 +
           '   t.addr3 as addr3,'#13 +
           '   t.city as city,'#13 +
           '   t.state as state,'#13 +
           '   t.zip as zip,'#13 +
           '   t.country as country,'#13 +
           '   country_code.Get2CharCountryCode(upper(trim(t.country))) as COUNTRY_CODE,'#13 +
           '   t.phone_number as phone_number,'#13 +
           '   t.ext as ext,'#13 +
           '   t.fax as fax,'#13 +
           '   t.notes as note,'#13 +
           '   t.account_number as account_number'#13 +
           'from'#13 +
           '   third_party t,'#13 +
           '   shipment_packages sp'#13 +
           'where'#13 +
           '   t.id = sp.third_party_id'#13 +
           '   and sp.source_id = %.0f'#13 +
           '   and sp.source = ''%s'''#13 +
           '   and sp.seq = (select min(seq) from shipment_packages where source_id = %.0f and source = ''%s'')',
           [SourceID, Source, SourceID, Source]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FThirdParty do
       begin
        Company      := Trim(AData[0]);
        Contact      := Trim(AData[1]);
        ParseFullName(Contact, AFirstName, ALastName); // shipman_region.pas
        FirstName    := AFirstName;
        LastName     := ALastName;
        Address1     := Trim(AData[2]);
        Address2     := Trim(AData[3]);
        Address3     := Trim(AData[4]);
        City         := Trim(AData[5]);
        State        := Trim(AData[6]);
        Zip          := Trim(AData[7]);
        Country      := Trim(AData[8]);
        CountryCode  := Trim(AData[9]);
        Telephone    := Trim(AData[10]);
        Ext          := Trim(AData[11]);
        Fax          := Trim(AData[12]);
        AccountNumber:= Trim(AData[14]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure the country code is populated
        if CountryCode = '' then
           begin
             CountryCode  := CountryCodeFor(Country, cctChr2);
             // update the country code for later
             //if CountryCode > '' then
             //   ExecuteCommandFmt('update shipments set country_code = ''%s'' where id = %.0f', [CountryCode, ShipmentsID]);
           end;
        CountryCode3Digit := shipman_region.CountryCodeFor(CountryCode, cctDigit3);
        // ensure we have a USPS-style country name for this code
        Country      := CountryNameFor(CountryCode);
       end;


end;

procedure TShippingInfo.FillPackingSlipData;
var
   ASQL: String;
   AData: Variant;
   APackageCount: Integer;
begin

   with FPackingSlip do
   begin
    PackingSlipNumber := '';
    ActualWeight      := '';
    BillableWeight    := '';
    Residential       := FALSE;
    PackageCount      := 0;
   end;

   if SourceID = 0 then Exit;

   ASQL := Format(
                  'select'#13 +
                  '   a.packslipno as packslipno,'#13 +
                  '   a.ship_residential as ship_residential'#13 +
                  // '   a.ship_via as ship_via,'#13 +
                  //'   a.shipdate as shipdate,'#13 +
                  //'   a.ps_date as ps_date,'#13 +
                  //'   a.terms_descrip as terms_descrip,'#13 +
                  //'   a.pro_no as pro_no,'#13 +
                  //'   a.est_arrival as est_arrival,'#13 +
                  //'   a.bol_comment1 as bol_comment1,'#13 +
                  //'   a.auto_freight_price as auto_freight_price,'#13 +
                  //'   a.tracking_num as tracking_num,'#13 +
                  //'   a.freight_id as freight_id,'#13 +
                  //'   a.ups_boxcount as ups_boxcount,'#13 +
                  //'   a.ups_boxweight as ups_boxweight'#13 +
                  'from'#13 +
                  '   V_packslips a'#13 +
                  'where'#13 +
                  '   a.source_id = %.0f'#13 +
                  '   and a.source = ''%s''',
                  [SourceID, Source]);

   AData := SelectValueArray(ASQL);

   APackageCount := PackageCount(SourceID, Source);

   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FPackingSlip do
       begin
         PackingSlipNumber := AData[0];
         Residential       := AData[1] = 'Y';
         PackageCount      := APackageCount;
       end;
end;

procedure TShippingInfo.FillShipmentOptionsUPS;
var
   ASQL: String;
   AData: Variant;
begin

   with FShipmentOptionUPS do
   begin
     RecipientEmail:= '';
     ReturnServices:= False;
     ReturnServicesAttempts:= 0;
     ReturnServicesType:= 0;
     NotificationEmail:= '';
     FailEmail:= '';
     ReturnServicesPhone:= '';
     ReturnServicesText:= '';
     ReturnsExchange:= False;
     ReturnsPackCollectBox:= 0;
     ImportControl:= False;
     ImportControlType:= 0;
     ReturnNotification:= False;
     QuantumView:= False;
     SaturdayDelivery:= False;
     Hundredweight:= False;
     HundredweightType:= 0;
     HundredweightTypeOverride:= False;
     IntlSpecialCommodity:= False;
     IntlSpecialCommodityType:= 0;
     ReceiversLocation:= False;
     ReceiversLocationID:= '';
     Reference1:= '';
     Reference2:= '';
     CarbonNeutral:= False;
     ShipmentHandling:= False;
     ShipmentHandlingCharge:= 0;
     ShipmentHandlingType:= 0;
     SaturdayPickup:= False;
     ExtendedDestination:= False;
   end;

   if SourceID = 0 then Exit;

   ASQL := Format(
       'SELECT a.recipientemail, a.returnservices,'#13 +
       'nvl(a.returnservicesattempts, 0), nvl(a.returnservicestype, 0),'#13 +
       'a.notificationemail, a.failemail, a.returnservicesphone,'#13 +
       'a.returnservicestext, a.returnsexchange, nvl(a.returnspackcollectbox, 0),'#13 +
       'a.importcontrol, nvl(a.importcontroltype, 0), a.returnnotification,'#13 +
       'a.quantumview, a.saturdaydelivery, a.hundredweight,'#13 +
       'nvl(a.hundredweighttype, 0), a.hundredweighttypeoverride,'#13 +
       'a.intlspecialcommodity, nvl(a.intlspecialcommoditytype, 0),'#13 +
       'a.receiverslocation, a.receiverslocationid, a.reference1,'#13 +
       'a.reference2, a.carbonneutral, a.shipmenthandling,'#13 +
       'nvl(a.shipmenthandlingcharge, 0), nvl(a.shipmenthandlingtype, 0),'#13 +
       'a.saturdaypickup, a.extendeddestination'#13 +
       'FROM shipment_option_ups a'#13 +
                  'where'#13 +
                  '   a.source_id = %.0f and a.source = ''%s''',
                  [SourceID, Source]);

   AData := SelectValueArray(ASQL);


   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FShipmentOptionUPS do
       begin
         RecipientEmail            := AData[0];
         ReturnServices            := AData[1] = 'Y';
         ReturnServicesAttempts    := AData[2];
         ReturnServicesType        := AData[3];
         NotificationEmail         := AData[4];
         FailEmail                 := AData[5];
         ReturnServicesPhone       := AData[6];
         ReturnServicesText        := AData[7];
         ReturnsExchange           := AData[8] = 'Y';
         ReturnsPackCollectBox     := AData[9];
         ImportControl             := AData[10] = 'Y';
         ImportControlType         := AData[11];
         ReturnNotification        := AData[12] = 'Y';
         QuantumView               := AData[13] = 'Y';
         SaturdayDelivery          := AData[14] = 'Y';
         Hundredweight             := AData[15] = 'Y';
         HundredweightType         := AData[16];
         HundredweightTypeOverride := AData[17] = 'Y';
         IntlSpecialCommodity      := AData[18] = 'Y';
         IntlSpecialCommodityType  := AData[19];
         ReceiversLocation         := AData[20] = 'Y';
         ReceiversLocationID       := AData[21];
         Reference1                := AData[22];
         Reference2                := AData[23];
         CarbonNeutral             := AData[24] = 'Y';
         ShipmentHandling          := AData[25] = 'Y';
         ShipmentHandlingCharge    := AData[26];
         ShipmentHandlingType      := AData[27];
         SaturdayPickup            := AData[28] = 'Y';
         ExtendedDestination       := AData[29] = 'Y';
       end;
end;

procedure TShippingInfo.FillShipmentOptionsFedex;
var
   ASQL: String;
   AData: Variant;
begin

   with FShipmentOptionFedex do
   begin
     FutureDayShip := False;
     ShipDate := 0;
     HoldAtLocation := False;
     HoldAtContactName := '';
     HoldAtContactCompany := '';
     HoldAtContactPhoneNumer := '';
     HoldAtPhoneNumber := '';
     HoldAtAddress := '';
     HoldAtCity := '';
     HoldAtState := '';
     HoldAtPostalCode := '';
     InsidePickup := False;
     InsideDelivery := False;
     ShipAlert := False;
     ShipAlertEmail := '';
     ShipAlertRecipient := 0;
     ShipAlertOnShip := False;
     ShipAlertOnDeliver := False;
     ShipAlertOnExcept := False;
     BrokerSelect := False;
     FreightBookingNum := '';
     FreightSLAC := '';
     FreightPackingList := False;
     Duties := False;
     DutiesPayorType := 0;
     DutiesPayorAccount := '';
     DutiesPayorCountry := '';
     HomeDeliveryType := 0;
     HomeDeliveryDate := 0;
     HomeDeliveryPhone := '';
     HomeDeliveryInstructions := '';
     SmartPostIndicia := '';
     SmartPostAncillary := '';
     SmartPostManifestID := '';
     SaturdayDelivery := False;
     SaturdayPickup := False;
     ReturnServicesRMANum := '';
     ReturnServicesRMAReason := '';
     ReturnServicesSatPick := False;
     ReturnServicesSatDel := False;
   end;

   if SourceID = 0 then Exit;

   ASQL := Format(
       'SELECT so.futuredayship, so.shipdate,'#13 +
       'so.holdatlocation, so.holdatcontactname, so.holdatcontactcompany,'#13 +
       'so.holdatcontactphonenumber, so.holdatphonenumber, so.holdataddress,'#13 +
       'so.holdatcity, so.holdatstate, so.holdatpostalcode, so.insidepickup,'#13 +
       'so.insidedelivery, so.shipalert, so.shipalertemail,'#13 +
       'nvl(so.shipalertrecipient, 0), so.shipalertonship, so.shipalertondeliver,'#13 +
       'so.shipalertonexcept, so.brokerselect, so.freightbookingnum,'#13 +
       'so.freightslac, so.freightpackinglist, so.duties, nvl(so.dutiespayortype, 0),'#13 +
       'so.dutiespayoraccount, so.dutiespayorcountry, nvl(so.homedeliverytype, 0),'#13 +
       'so.homedeliverydate, so.homedeliveryphone,'#13 +
       'so.homedeliveryinstructions, so.smartpostindicia,'#13 +
       'so.smartpostancillary, so.smartpostmanifestid, so.saturdaydelivery, '#13 +
       'so.saturdaypickup, so.returnservicesrmanum, '#13 +
       'so.returnservicesrmareason, so.returnservicessatpick, '#13 +
       'so.returnservicessatdel'#13 +
       'FROM shipment_option_fedex so'#13 +
                  'where'#13 +
                  '   so.source_id = %.0f and so.source = ''%s''',
                  [SourceID, Source]);

   AData := SelectValueArray(ASQL);


   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FShipmentOptionFedex do
       begin
         FutureDayShip             := AData[0] = 'Y';
         if (AData[1] <> System.Variants.Null) then
           ShipDate                := AData[1];
         HoldAtLocation            := AData[2] = 'Y';
         HoldAtContactName         := AData[3];
         HoldAtContactCompany      := AData[4];
         HoldAtContactPhoneNumer   := AData[5];
         HoldAtPhoneNumber         := AData[6];
         HoldAtAddress             := AData[7];
         HoldAtCity                := AData[8];
         HoldAtState               := AData[9];
         HoldAtPostalCode          := AData[10];
         InsidePickup              := AData[11] = 'Y';
         InsideDelivery            := AData[12] = 'Y';
         ShipAlert                 := AData[13] = 'Y';
         ShipAlertEmail            := AData[14];
         ShipAlertRecipient        := AData[15];
         ShipAlertOnShip           := AData[16] = 'Y';
         ShipAlertOnDeliver        := AData[17] = 'Y';
         ShipAlertOnExcept         := AData[18] = 'Y';
         BrokerSelect              := AData[19] = 'Y';
         FreightBookingNum         := AData[20];
         FreightSLAC               := AData[21];
         FreightPackingList        := AData[22] = 'Y';
         Duties                    := AData[23] = 'Y';
         DutiesPayorType           := AData[24];
         DutiesPayorAccount        := AData[25];
         DutiesPayorCountry        := AData[26];
         HomeDeliveryType          := AData[27];
         if (AData[27] <> System.Variants.Null) then
           HomeDeliveryDate        := AData[28];
         HomeDeliveryPhone         := AData[29];
         HomeDeliveryInstructions  := AData[30];
         SmartPostIndicia          := AData[31];
         SmartPostAncillary        := AData[32];
         SmartPostManifestID       := AData[33];
         SaturdayDelivery          := AData[34] = 'Y';
         SaturdayPickup            := AData[35] = 'Y';
         ReturnServicesRMANum      := AData[36];
         ReturnServicesRMAReason   := AData[37];
         ReturnServicesSatPick     := AData[38] = 'Y';
         ReturnServicesSatDel      := AData[39] = 'Y';
       end;
end;

procedure TPackageClass.FillPackageOptionsUPS;
var
   ASQL: String;
   AData: Variant;
begin

   with PackageOptionUPS do
   begin
     COD:= False;
     CODAmount:= 0;
     CODPaymentType:= 0;
     DeliveryConfirmation:= False;
     SignatureOption:= 0;
     CallTag:= False;
     VerbalConfirmation:= False;
     ShipperRelease:= False;
     QuantumView:= False;
     InboundReturnNotification:= False;
     ProactiveResponse:= False;
     AdditionalHandling:= False;
     AdditionalHandlingFee:= 0;
     LargePackage:= False;
     LargePackageFee:= 0;
     Insurance:= False;
     InsuranceAmount:= 0;
     InsuranceType:= 0;
     HoldForPickup:= False;
     ShipperPaidDV:= False;
     PackageAttn:= '';
     PackagePhone:= '';
     FreightPricing:= False;
     FreightClass:= '';
     FreightNMFC:= '';
     FreightNMFCSub:= '';
     ReturnServicesSeqNo:= '';
   end;

   if Package.ID = 0 then Exit;

   ASQL := Format(
                  'SELECT a.cod, nvl(a.codamount, 0),'#13 +
                  'nvl(a.codpaymenttype, 0), a.deliveryconfirmation, nvl(a.signatureoption, 0),'#13 +
                  'a.calltag, a.verbalconfirmation, a.shipperrelease, a.quantumview,'#13 +
                  'a.inboundreturnnotification, a.proactiveresponse,'#13 +
                  'a.additionalhandling, nvl(a.additionalhandlingfee, 0), a.largepackage,'#13 +
                  'nvl(a.largepackagefee, 0), a.insurance, nvl(a.insuranceamount, 0),'#13 +
                  'nvl(a.insurancetype, 0), a.holdforpickup, a.shipperpaiddv, a.packageattn,'#13 +
                  'a.packagephone, a.freightpricing, a.freightclass, a.freightnmfc,'#13 +
                  'a.freightnmfcsub, a.returnservicesseqno'#13 +
                  'FROM shipment_pkg_opt_ups a'#13 +
                  'where'#13 +
                  '   a.shipment_packages_id = %.0f',
                  [Package.ID]);

   AData := SelectValueArray(ASQL);


   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with PackageOptionUPS do
       begin
         COD                       := AData[0] = 'Y';
         CODAmount                 := AData[1];
         CODPaymentType            := AData[2];
         DeliveryConfirmation      := AData[3] = 'Y';
         SignatureOption           := AData[4];
         CallTag                   := AData[5] = 'Y';
         VerbalConfirmation        := AData[6] = 'Y';
         ShipperRelease            := AData[7] = 'Y';
         QuantumView               := AData[8] = 'Y';
         InboundReturnNotification := AData[9] = 'Y';
         ProactiveResponse         := AData[10] = 'Y';
         AdditionalHandling        := AData[11] = 'Y';
         AdditionalHandlingFee     := AData[12];
         LargePackage              := AData[13] = 'Y';
         LargePackageFee           := AData[14];
         Insurance                 := AData[15] = 'Y';
         InsuranceAmount           := AData[16];
         InsuranceType             := AData[17];
         HoldForPickup             := AData[18] = 'Y';
         ShipperPaidDV             := AData[19] = 'Y';
         PackageAttn               := AData[20];
         PackagePhone              := AData[21];
         FreightPricing            := AData[22] = 'Y';
         FreightClass              := AData[23];
         FreightNMFC               := AData[24];
         FreightNMFCSub            := AData[25];
         ReturnServicesSeqNo       := AData[26];
       end;
end;

procedure TPackageClass.FillPackageOptionsFedex;
var
   ASQL: String;
   AData: Variant;
begin

   with PackageOptionFedex do
   begin
     COD := False;
     CODAmount := 0;
     CODType := 0;
     CODCurrency := '';
     SignatureOption := False;
     SignatureOptionType := 0;
     DropoffType := 0;
     AdmissPkgType := '';
     NonStandard := False;
     Oversize := False;
     PriorityAlert := False;
     Documents := False;
   end;

   if Package.ID = 0 then Exit;

   ASQL := Format(
                  'SELECT po.cod, nvl(po.codamount, 0), nvl(po.codtype, 0), '#13 +
                  'po.codcurrency, po.signatureoption, nvl(po.signatureoptiontype, 0), '#13 +
                  'nvl(po.dropofftype, 0), po.admisspkgtype, po.nonstandard, po.oversize, '#13 +
                  'po.priorityalert, po.documents'#13 +
                  'FROM shipment_pkg_opt_fedex po'#13 +
                  'where'#13 +
                  '   po.shipment_packages_id = %.0f',
                  [Package.ID]);

   AData := SelectValueArray(ASQL);


   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with PackageOptionFedex do
       begin
         COD                       := AData[0] = 'Y';
         CODAmount                 := AData[1];
         CODType                   := AData[2];
         CODCurrency               := AData[3];
         SignatureOption           := AData[4] = 'Y';
         SignatureOptionType       := AData[5];
         DropoffType               := AData[6];
         AdmissPkgType             := AData[7];
         NonStandard               := AData[8] = 'Y';
         Oversize                  := AData[9] = 'Y';
         PriorityAlert             := AData[10] = 'Y';
         Documents                 := AData[11] = 'Y';
       end;
end;

function TShippingInfo.ValidateRecipientData: Boolean;
var
   ACode: String;
begin
  // Get the country code
  ACode := CountryCodeFor(Recipient.Country);

  // Validate country code
  Result := ACode > '';
  if not Result then
     raise Exception.Create(shipman_rscstr.cTXT000028 {'Country code not found for Packing Slip recipient.'});

  // Validate state code
  if IQMS.Common.StringUtils.StrInList(ACode, ['US','CA','MX']) then
     begin
       Result := (Trim(Recipient.State) > '') and IsStateCodeValid(ACode, Recipient.State);
       if not Result then
          raise Exception.Create(shipman_rscstr.cTXT000029 {'State code not found for Packing Slip recipient.'});
     end;

end;

function TShippingInfo.ValidateSenderData: Boolean;
var
   ACode: String;
begin
  // Get the country code
  ACode := CountryCodeFor(Sender.Country);

  // Validate country code
  Result := ACode > '';
  if not Result then
     raise Exception.Create(shipman_rscstr.cTXT000026 {'Country code not found for Packing Slip sender.'});

  // Validate telephone number
  Result := (Trim(Sender.Telephone) > '');
  if not Result then
     raise Exception.Create(shipman_rscstr.cTXT000064 {'Telephone number is required for Packing Slip sender.'});

  Result := IsTelephoneValid(ACode, Sender.Telephone);
  if not Result then
     {'Please check the telephone number.  Telephone ' +
      'numbers should contain 10 numbers for United States and Canadian locations, ' +
      'and 16 numbers for all other countries.'}
     raise Exception.Create(shipman_rscstr.cTXT000013);

  // Validate state code
  if IQMS.Common.StringUtils.StrInList(ACode, ['US','CA','MX']) then
     begin
       Result := (Trim(Sender.State) > '') and IsStateCodeValid(ACode, Sender.State);
       if not Result then
          raise Exception.Create(shipman_rscstr.cTXT000027 {'State code not found for Packing Slip sender.'});
     end;

end;

function TShippingInfo.International: Boolean;
begin
  Result := Sender.CountryCode <> Recipient.CountryCode;
end;

function TShippingInfo.ReturnShipment: Boolean;
begin
  Result := FSource = 'RETURN_SHIPMENT';
end;

function TShippingInfo.Domestic(ACountryCode: String): Boolean;
begin
  if ACountryCode > '' then
     Result := (Sender.CountryCode = ACountryCode) and (Recipient.CountryCode = ACountryCode)
  else
     Result := Sender.CountryCode = Recipient.CountryCode;
end;

function TShippingInfo.NAFTA: Boolean;
begin
  Result := (International and
             IQMS.Common.StringUtils.StrInList(Sender.CountryCode, ['US','CA','MX']) and
             IQMS.Common.StringUtils.StrInList(Recipient.CountryCode, ['US','CA','MX']));
end;


{ ---------------------------------------------------------------------------- }
{ TShipmentGood }
{ ---------------------------------------------------------------------------- }

constructor TShipmentGood.Create(AOwner: TComponent; ASourceID: Real; ASource: String; AGoodID: Real);
begin
  inherited Create(AOwner);
  FSourceID := ASourceID;
  FSource := ASource;
  FGoodID := AGoodID;
  Refresh;
end;

destructor TShipmentGood.Destroy;
begin

  inherited Destroy;
end;

procedure TShipmentGood.SetSourceID(const ASourceID: Real; ASource: String);
begin
  FSourceID := ASourceID;
  FSource := ASource;
  Refresh;
end;


procedure TShipmentGood.Refresh;
begin
  FillGoodData;
end;

procedure TShipmentGood.FillGoodData;
var
   AData: Variant;
   ASQL: String;
   AInvoiceShipTo: Real;
   AShipmentShipTo: Real;
begin
   // First, clear the existing data

    FItemno := '';
    FDescrip := '';
    FOriginCountryCode := '';
    FQty := 0;
    FUom := '';
    FUnitPrice := 0;
    FGrossWeight := 0;
    FWeightUOM := '';
    FPackageCount := 0;
    FTariffCode := '';
    FMarksNumbers := '';
    FECCN := '';
    FSchedBNumber := '';
    FSchedBUnits := 0;
    FSchedBUOM := '';
    FSchedBUnits2 := 0;
    FSchedBUOM2 := '';
    FLicenseNumber := '';
    FLicenseExpiration := Date();
    FLicenseException := false;
    FLicenseExceptionCode := '';
    FPreferenceCriterion := '';
    FProducer := '';
    FNetCost := false;
    FPeriodStart := Date();
    FPeriodEnd := Date();
    FOnSED := false;
    FOnCO := false;
    FMultipleOriginCountries := false;

   if SourceID = 0 then Exit;

   ASQL := Format(
           'select sg.id,'#13 +
                  'sg.itemno,'#13 +
                  'sg.descrip,'#13 +
                  'sg.origin_country,'#13 +
                  'sg.qty,'#13 +
                  'sg.uom,'#13 +
                  'sg.unit_price,'#13 +
                  'sg.gross_weight,'#13 +
                  'sg.weight_uom,'#13 +
                  'sg.packages,'#13 +
                  'sg.tariff_code,'#13 +
                  'sg.marks_numbers,'#13 +
                  'sg.eccn,'#13 +
                  'sg.schedb_number,'#13 +
                  'sg.schedb_units,'#13 +
                  'sg.schedb_uom,'#13 +
                  'sg.schedb_units2,'#13 +
                  'sg.schedb_uom2,'#13 +
                  'sg.license_number,'#13 +
                  'sg.license_expiration,'#13 +
                  'sg.licence_exception,'#13 +
                  'sg.licence_exception_code,'#13 +
                  'sg.preference_criterion,'#13 +
                  'sg.producer,'#13 +
                  'sg.net_cost,'#13 +
                  'sg.period_start,'#13 +
                  'sg.period_end,'#13 +
                  'sg.on_sed,'#13 +
                  'sg.on_co,'#13 +
                  'sg.multiple_origin_countries'#13 +
           'from shipment_goods sg'#13 +
           'where'#13 +
           '   sg.id = %.0f',
           [GoodID]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
       begin
        FItemno := Trim(AData[1]);
        FDescrip := Trim(AData[2]);
        FOriginCountryCode := Trim(AData[3]);
        FQty := AData[4];
        FUom := Trim(AData[5]);
        FUnitPrice := AData[6];
        FGrossWeight := AData[7];
        FWeightUOM := Trim(AData[8]);
        FPackageCount :=  AData[9];
        FTariffCode := Trim(AData[10]);
        FMarksNumbers := Trim(AData[11]);
        FECCN := Trim(AData[12]);
        FSchedBNumber := Trim(AData[13]);
        FSchedBUnits :=  AData[14];
        FSchedBUOM := Trim(AData[15]);
        FSchedBUnits2 :=  AData[16];
        FSchedBUOM2 := Trim(AData[17]);
        FLicenseNumber := Trim(AData[18]);
        if not (AData[19] = NULL) then FLicenseExpiration  := VarToDateTime(AData[19]) else FLicenseExpiration := 0;
        FLicenseException := IQMS.Common.Boolean.YNToBool(AData[20]);;
        FLicenseExceptionCode :=Trim(AData[21]);
        FPreferenceCriterion := Trim(AData[22]);
        FProducer := Trim(AData[23]);
        FNetCost := IQMS.Common.Boolean.YNToBool(AData[24]);
        if not (AData[25] = NULL) then FPeriodStart  := VarToDateTime(AData[25]) else FPeriodStart := 0;
        if not (AData[26] = NULL) then FPeriodEnd  := VarToDateTime(AData[26]) else FPeriodEnd := 0;
        FOnSED := IQMS.Common.Boolean.YNToBool(AData[27]);
        FOnCO := IQMS.Common.Boolean.YNToBool(AData[28]);
        FMultipleOriginCountries := IQMS.Common.Boolean.YNToBool(AData[29]);
       end;

end;

{ ---------------------------------------------------------------------------- }
{ TShipmentInvoice }
{ ---------------------------------------------------------------------------- }

constructor TShipmentInvoice.Create(AOwner: TComponent; ASourceID: Real; ASource: String; AMaster: Boolean);
begin
  inherited Create(AOwner);
  FSourceID := ASourceID;
  FSource := ASource;
  FMaster := AMaster;
  if (AMaster) then
    FMasterShipmentID := SelectValueFmtAsFloat('select master_shipment_id from %s where id = %.0f', [ASource, ASourceID]);
  Refresh;
end;

destructor TShipmentInvoice.Destroy;
begin

  inherited Destroy;
end;

procedure TShipmentInvoice.SetSourceID(const ASourceID: Real; ASource: String);
begin
  FSourceID := ASourceID;
  FSource := ASource;
  Refresh;
end;


procedure TShipmentInvoice.Refresh;
begin
  FillInvoiceData;
  FillUltimateConsigneeData;
  FillImporterData;
end;

procedure TShipmentInvoice.FillInvoiceData;
var
   AData: Variant;
   ASQL: String;
   AInvoiceShipTo: Real;
   AShipmentShipTo: Real;
   AImporterID: Real;
   AInvoiceType: Integer;
begin
   // First, clear the existing data

    FInvoiceID := 0;
    FCreateInvoice := False;
    FCurrencyCode := '';
    FExportReason := '';
    FTermsOfSale := '';
    FInvoiceDiscount := 0;
    FInvoiceFreight := 0;
    FInvoiceInsurance := 0;
    FInvoiceOtherCharges := 0;
    FInvoiceComments := '';
    FPartiesRelated := false;
    FRoutedTransaction := false;
    FExportCode := '';
    FProducer := '';
    FPeriodStart := Date();
    FPeriodEnd := Date();
    FDeclarationCode := '';
    FOwner := '';
    FAdditionalDocs := false;
    FCarrierPrepareSED := false;
    FCarrierPrepareCO := false;
    FCurrencyConversionFactor := 0;
    FSEDbyAES := '';
    FAESNumber := '';
    FPaperless := false;
    FPaperlessNafta := false;
    FInvoiceNumber := '';

   if SourceID = 0 then Exit;

   ASQL := Format(
           'select si.curr_code,'#13 +
                  'si.export_reason,'#13 +
                  'si.terms_of_sale,'#13 +
                  'si.invoice_discount,'#13 +
                  'si.invoice_freight,'#13 +
                  'si.invoice_insurance,'#13 +
                  'si.invoice_other_charges,'#13 +
                  'si.invoice_comments,'#13 +
                  'si.parties_related,'#13 +
                  'si.routed_transaction,'#13 +
                  'si.export_code,'#13 +
                  'si.producer,'#13 +
                  'si.period_start,'#13 +
                  'si.period_end,'#13 +
                  'si.declaration_code,'#13 +
                  'si.owner,'#13 +
                  'si.additional_docs,'#13 +
                  'si.carrier_prepare_sed,'#13 +
                  'si.carrier_prepare_co,'#13 +
                  'si.currency_conversion_factor,'#13 +
                  'nvl(si.ship_to_id, 0),'#13 +
                  'si.id,'#13 +
                  'nvl(si.importer_id, 0),'#13 +
                  'si.sed_by_aes,'#13 +
                  'si.aes_number,'#13 +
                  'si.paperless,'#13 +
                  'si.paperless_nafta,'#13 +
                  'si.invoice_type,'#13 +
                  'si.invoice_number,'#13 +
                  'si.docs_only'#13 +
           'from shipment_invoice si'#13 +
           'where'#13 +
           '   si.source_id = %.0f'#13 +
           '   and si.source = ''%s''',
           [SourceID, Source]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
       begin
        FCurrencyCode := Trim(AData[0]);
        FExportReason := Trim(AData[1]);
        FTermsOfSale := Trim(AData[2]);
        FInvoiceDiscount := AData[3];
        FInvoiceFreight := AData[4];
        FInvoiceInsurance := AData[5];
        FInvoiceOtherCharges := AData[6];
        FInvoiceComments := Trim(AData[7]);
        FPartiesRelated := IQMS.Common.Boolean.YNToBool(AData[8]);
        FRoutedTransaction := IQMS.Common.Boolean.YNToBool(AData[9]);
        FExportCode := Trim(AData[10]);
        FProducer := Trim(AData[11]);
        if not (AData[12] = NULL) then FPeriodStart  := VarToDateTime(AData[12]) else FPeriodStart := Now;
        if not (AData[13] = NULL) then FPeriodEnd  := VarToDateTime(AData[13]) else FPeriodEnd := Now;
        FDeclarationCode := Trim(AData[14]);
        FOwner := Trim(AData[15]);
        FAdditionalDocs := IQMS.Common.Boolean.YNToBool(AData[16]);
        FCarrierPrepareSED := IQMS.Common.Boolean.YNToBool(AData[17]);
        FCarrierPrepareCO := IQMS.Common.Boolean.YNToBool(AData[18]);
        FCurrencyConversionFactor := AData[19];
        AInvoiceShipTo := AData[20];
        FInvoiceID := AData[21];
        AImporterID := AData[22];
        FSEDbyAES := AData[23];
        FAESNumber := Trim(AData[24]);
        FPaperless := IQMS.Common.Boolean.YNToBool(AData[25]);
        FPaperlessNafta := IQMS.Common.Boolean.YNToBool(AData[26]);
        AInvoiceType := AData[27];
        FCreateInvoice := AInvoiceType in [2, 3];
        FInvoiceNumber := Trim(AData[28]);
        FDocsOnly := IQMS.Common.Boolean.YNToBool(AData[29]);

        if (Source = 'SHIPMENTS') then
          AShipmentShipTO := SelectValueFmtAsFloat('select ship_to_id from shipments where id = %0.f', [SourceID]);
        if ((AInvoiceShipTo = 0) or (AInvoiceShipTo = AShipmentShipTo)) then
          FUseUltimateConsignee := false
        else
          FUseUltimateConsignee := true;
        if (AImporterID = 0) then
          FUseImporter := false
        else
          FUseImporter := true;
       end;

       if (FMaster) then
        begin
         ASQL := Format(
             'select sum(si.invoice_discount),'#13 +
                    'sum(si.invoice_freight),'#13 +
                    'sum(si.invoice_insurance),'#13 +
                    'sum(si.invoice_other_charges)'#13 +
             'from shipment_invoice si,'#13 +
             '%s s'#13 +
             'where'#13 +
             'si.source_id = s.id'#13 +
             'and s.master_shipment_id = %.0f',
           [Source, FMasterShipmentID]);

       AData := SelectValueArray(ASQL);

     // Update the data
       if System.Variants.VarArrayDimCount(AData) <> 0 then
         begin
          FInvoiceDiscount := AData[0];
          FInvoiceFreight := AData[1];
          FInvoiceInsurance := AData[2];
          FInvoiceOtherCharges := AData[3];
         end;
     end;


       if InvoiceID = 0 then exit;
       FGoods := TList.Create;
       with TFDQuery.Create(NIL) do
       try
         Connection := UniMainModule.FDConnection1;
       if (FMaster) then
        begin
           SQL.Add('select sg.id');
           SQL.Add('FROM shipment_goods sg,');
           SQL.Add(Format('%s s', [ Source ] ));
           SQL.Add('where');
           SQL.Add('sg.source_id = s.id');
           SQL.Add(Format('and s.master_shipment_id = %.0f',[FMasterShipmentID]));
           SQL.Add('order by s.id, sg.id');
         end
        else
         begin
           SQL.Add('select id');
           SQL.Add('FROM shipment_goods');
           SQL.Add('where');
           SQL.Add(Format('source_id = %.0f',[SourceID]));
           SQL.Add(Format('and source = ''%s''',[Source]));
           SQL.Add('order by id');
         end;
         Open;

         while not EOF do
          begin
            FGoods.Add(TShipmentGood.Create(Self, SourceID, Source, FieldByName('ID').AsFloat));
            Next;
          end;
      finally
        Free;
      end;
end;

procedure TShipmentInvoice.FillUltimateConsigneeData;
var
   AData: Variant;
   AFirstName,
   ALastName,
   ASQL: String;
begin
   // First, clear the existing data
   with FUltimateConsignee do
   begin
    Company      := '';
    Contact      := '';
    FirstName    := '';
    LastName     := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    CountryCode3Digit := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
   end;

   if SourceID = 0 then Exit;

   ASQL := Format(
           'select'#13 +
           '   st.attn as ship_to_attn,'#13 +
           '   st.prime_contact as ship_to_prime_contact,'#13 +
           '   st.addr1 as ship_to_addr1,'#13 +
           '   st.addr2 as ship_to_addr2,'#13 +
           '   st.addr3 as ship_to_addr3,'#13 +
           '   st.city as ship_to_city,'#13 +
           '   st.state as ship_to_state,'#13 +
           '   st.zip as ship_to_zip,'#13 +
           '   st.country as ship_to_country,'#13 +
           '   country_code.Get2CharCountryCode(upper(trim(st.country))) as ship_to_country_code,'#13 +
           '   st.phone_number as ship_to_phone_number,'#13 +
           '   st.ext as ship_to_ext,'#13 +
           '   st.fax as ship_to_fax'#13 +
           'from'#13 +
           '   ship_to st,'#13 +
           '   shipment_invoice si'#13 +
           'where'#13 +
           '    st.id = si.ship_to_id'#13 +
           'and si.source_id = %.0f'#13 +
           'and si.source = ''%s''',
           [SourceID, Source]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FUltimateConsignee do
       begin
        Company      := Trim(AData[0]);
        Contact      := Trim(AData[1]);
        ParseFullName(Contact, AFirstName, ALastName); // shipman_region.pas
        FirstName    := AFirstName;
        LastName     := ALastName;
        Address1     := Trim(AData[2]);
        Address2     := Trim(AData[3]);
        Address3     := Trim(AData[4]);
        City         := Trim(AData[5]);
        State        := Trim(AData[6]);
        Zip          := Trim(AData[7]);
        Country      := Trim(AData[8]);
        CountryCode  := Trim(AData[9]);
        Telephone    := Trim(AData[10]);
        Ext          := Trim(AData[11]);
        Fax          := Trim(AData[12]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure the country code is populated
        if CountryCode = '' then
             CountryCode  := CountryCodeFor(Country, cctChr2);
        CountryCode3Digit := shipman_region.CountryCodeFor(CountryCode, cctDigit3);
        // ensure we have a USPS-style country name for this code
        Country      := CountryNameFor(CountryCode);
       end;
end;

procedure TShipmentInvoice.FillImporterData;
var
   AData: Variant;
   AFirstName,
   ALastName,
   ASQL: String;
begin
   // First, clear the existing data
   with FImporter do
   begin
    Company      := '';
    Contact      := '';
    FirstName    := '';
    LastName     := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    CountryCode3Digit := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
   end;

   if SourceID = 0 then Exit;

   ASQL := Format(
           'select'#13 +
           '   i.attn as ship_to_attn,'#13 +
           '   i.prime_contact as ship_to_prime_contact,'#13 +
           '   i.addr1 as ship_to_addr1,'#13 +
           '   i.addr2 as ship_to_addr2,'#13 +
           '   i.addr3 as ship_to_addr3,'#13 +
           '   i.city as ship_to_city,'#13 +
           '   i.state as ship_to_state,'#13 +
           '   i.zip as ship_to_zip,'#13 +
           '   i.country as ship_to_country,'#13 +
           '   country_code.Get2CharCountryCode(upper(trim(i.country))) as ship_to_country_code,'#13 +
           '   i.phone_number as ship_to_phone_number,'#13 +
           '   i.ext as ship_to_ext,'#13 +
           '   i.fax as ship_to_fax'#13 +
           'from'#13 +
           '   importer i,'#13 +
           '   shipment_invoice si'#13 +
           'where'#13 +
           '    i.id = si.importer_id'#13 +
           'and si.source_id = %.0f'#13 +
           'and si.source = ''%s''',
           [SourceID, Source]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FImporter do
       begin
        Company      := Trim(AData[0]);
        Contact      := Trim(AData[1]);
        ParseFullName(Contact, AFirstName, ALastName); // shipman_region.pas
        FirstName    := AFirstName;
        LastName     := ALastName;
        Address1     := Trim(AData[2]);
        Address2     := Trim(AData[3]);
        Address3     := Trim(AData[4]);
        City         := Trim(AData[5]);
        State        := Trim(AData[6]);
        Zip          := Trim(AData[7]);
        Country      := Trim(AData[8]);
        CountryCode  := Trim(AData[9]);
        Telephone    := Trim(AData[10]);
        Ext          := Trim(AData[11]);
        Fax          := Trim(AData[12]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure the country code is populated
        if CountryCode = '' then
             CountryCode  := CountryCodeFor(Country, cctChr2);
        CountryCode3Digit := shipman_region.CountryCodeFor(CountryCode, cctDigit3);
        // ensure we have a USPS-style country name for this code
        Country      := CountryNameFor(CountryCode);
       end;
end;

function TShipmentInvoice.ValidateUltimateConsigneeData: Boolean;
var
   ACode: String;
begin
  // Get the country code
  ACode := CountryCodeFor(UltimateConsignee.Country);

  // Validate country code
  Result := ACode > '';
  if not Result then
     raise Exception.Create(shipman_rscstr.cTXT000028 {'Country code not found for Packing Slip recipient.'});

  // Validate state code
  if IQMS.Common.StringUtils.StrInList(ACode, ['US','CA','MX']) then
     begin
       Result := (Trim(UltimateConsignee.State) > '') and IsStateCodeValid(ACode, UltimateConsignee.State);
       if not Result then
          raise Exception.Create(shipman_rscstr.cTXT000029 {'State code not found for Packing Slip recipient.'});
     end;

end;

function TShipmentInvoice.ValidateImporterData: Boolean;
var
   ACode: String;
begin
  // Get the country code
  ACode := CountryCodeFor(Importer.Country);

  // Validate country code
  Result := ACode > '';
  if not Result then
     raise Exception.Create(shipman_rscstr.cTXT000028 {'Country code not found for Packing Slip recipient.'});

  // Validate state code
  if IQMS.Common.StringUtils.StrInList(ACode, ['US','CA','MX']) then
     begin
       Result := (Trim(Importer.State) > '') and IsStateCodeValid(ACode, Importer.State);
       if not Result then
          raise Exception.Create(shipman_rscstr.cTXT000029 {'State code not found for Packing Slip recipient.'});
     end;
end;

function TShipmentInvoice.IncludeCO: Boolean;
var i: Integer;
begin
  Result := false;
  for i := 0 to Goods.Count - 1 do
    Result := (Result or TShipmentGood(Goods[i]).OnCO);
end;

function TShipmentInvoice.IncludeSED: Boolean;
var i: Integer;
begin
  Result := false;
  for i := 0 to Goods.Count - 1 do
    Result := (Result or TShipmentGood(Goods[i]).OnSED);
end;

function TShipmentInvoice.LineTotal: Real;
var i: Integer;
begin
  Result := 0;
  for i := 0 to Goods.Count - 1 do
    Result := Result + (TShipmentGood(Goods[i]).Qty * TShipmentGood(Goods[i]).UnitPrice);
end;

{ ---------------------------------------------------------------------------- }
{ TCodeList }
{ ---------------------------------------------------------------------------- }

constructor TCodeList.Create;
begin
  inherited Create(TCodeItem);
end;

function TCodeList.Add(ACarrier: TCarrierType; ACode, ADescription: String): TCodeItem;
begin
  // Adds to the list
  Result := NIL; // default

  // Validation
  if (ACode = '') then Exit;
  if (ADescription = '') then Exit;

  // Check if item already exists, and pass it as a result
  Result := FindItem(ACarrier, ACode, ADescription);

  // Create the new item
  if Result = NIL then
     begin
       Result := TCodeItem.Create(Self);
       Result.Carrier := ACarrier;
       Result.Code := ACode;
       Result.Description := ADescription;
     end;
end;

function TCodeList.FindItem(ACarrier: TCarrierType; ACode, ADescription: String): TCodeItem;
var
   i: Integer;
begin
  Result := NIL; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (TCodeItem(Items[i]).Carrier = ACarrier) and
      (CompareStr(TCodeItem(Items[i]).Code, ACode)=0) and
      (CompareStr(TCodeItem(Items[i]).Description, ADescription)=0) then
      begin
        Result := TCodeItem(Items[i]);
        BREAK;
      end;
end;

function TCodeList.FindItemByCode(ACarrier: TCarrierType; ACode: String): TCodeItem;
var
   i: Integer;
begin
  Result := NIL; // default
  // cycle list and find item
  if ACarrier <> ctUnknown then
     begin
       for i := 0 to Count - 1 do
        if (TCodeItem(Items[i]).Carrier = ACarrier) and
           (CompareStr(TCodeItem(Items[i]).Code, ACode)=0) then
           begin
             Result := TCodeItem(Items[i]);
             BREAK;
           end;
     end
  else
     begin
       for i := 0 to Count - 1 do
        if (CompareStr(TCodeItem(Items[i]).Code, ACode)=0) then
           begin
             Result := TCodeItem(Items[i]);
             BREAK;
           end;
     end;
end;

function TCodeList.FindItemByDescription(ACarrier: TCarrierType; ADescription: String): TCodeItem;
var
   i: Integer;
begin
  Result := NIL; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (TCodeItem(Items[i]).Carrier = ACarrier) and
      (CompareStr(TCodeItem(Items[i]).Description, ADescription)=0) then
      begin
        Result := TCodeItem(Items[i]);
        BREAK;
      end;
end;

function TCodeList.IndexOfCode(ACarrier: TCarrierType; ACode: String): Integer;
var
   i: Integer;
begin
  Result := -1; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (TCodeItem(Items[i]).Carrier = ACarrier) and
      (CompareStr(TCodeItem(Items[i]).Code, ACode)=0) then
      begin
        Result := i;
        BREAK;
      end;
end;

function TCodeList.IndexOfDescription(ACarrier: TCarrierType; ADescription: String): Integer;
var
   i: Integer;
begin
  Result := -1; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (TCodeItem(Items[i]).Carrier = ACarrier) and
      (CompareStr(TCodeItem(Items[i]).Description, ADescription)=0) then
      begin
        Result := i;
        BREAK;
      end;
end;

{ ---------------------------------------------------------------------------- }
{ TCodeItem }
{ ---------------------------------------------------------------------------- }

constructor TCodeItem.Create(Collection: TCodeList);
begin
  inherited Create(Collection);
  Carrier := TCarrierType(0);
end;

destructor TCodeItem.Destroy;
begin
  inherited Destroy;
end;

{ ---------------------------------------------------------------------------- }
{ TServiceCodeList }
{ ---------------------------------------------------------------------------- }

function TServiceCodeList.Add(ACarrier: TCarrierType; ACode,
  ADescription: String): TServiceCodeItem;
begin
  // Adds to the list
  Result := NIL; // default

  // Validation
  if (ACode = '') then Exit;
  if (ADescription = '') then Exit;

  // Check if item already exists, and pass it as a result
  Result := TServiceCodeItem(FindItem(ACarrier, ACode, ADescription));

  // Create the new item
  if Result = NIL then
     begin
       Result := TServiceCodeItem.Create(Self);
       Result.Carrier := ACarrier;
       Result.Code := ACode;
       Result.Description := ADescription;
     end;
end;

function TServiceCodeList.AddEx(ACarrier: TCarrierType; ACode,
  ADescription: String; AFloatField1, AFloatField2: Real; AIntField1,
  AIntField2: Integer; AStrField1, AStrField2: String): TServiceCodeItem;
begin
  Result := Add(ACarrier, ACode, ADescription);
  if Result <> NIL then
     with Result do
      begin
        FloatField1 := AFloatField1;
        FloatField2 := AFloatField2;
        IntField1   := AIntField1;
        IntField2   := AIntField2;
        StrField1   := AStrField1;
        StrField2   := AStrField2;
      end;
end;


{ ---------------------------------------------------------------------------- }
{ TServiceCodeItem }
{ ---------------------------------------------------------------------------- }

constructor TServiceCodeItem.Create(Collection: TServiceCodeList);
begin
  inherited Create(Collection);
  // initialize
  FOptionsCost := 0;
  FTotalCost   := 0;
  FListPrice   := 0;
end;

{ ---------------------------------------------------------------------------- }
{ TPackageCodeList }
{ ---------------------------------------------------------------------------- }

function TPackageCodeList.Add(ACarrier: TCarrierType; ACode,
  ADescription: String): TPackageCodeItem;
begin
  // Adds to the list
  Result := NIL; // default

  // Validation
  if (ACode = '') then Exit;
  if (ADescription = '') then Exit;

  // Check if item already exists, and pass it as a result
  Result := TPackageCodeItem(FindItem(ACarrier, ACode, ADescription));

  // Create the new item
  if Result = NIL then
     begin
       Result := TPackageCodeItem.Create(Self);
       Result.Carrier := ACarrier;
       Result.Code := ACode;
       Result.Description := ADescription;
     end;
end;

{ ---------------------------------------------------------------------------- }
{ TPackageCodeItem }
{ ---------------------------------------------------------------------------- }

constructor TPackageCodeItem.Create(Collection: TPackageCodeList);
begin
  inherited Create(Collection);
end;

{ ---------------------------------------------------------------------------- }
{ TSoftErrorList }
{ ---------------------------------------------------------------------------- }

constructor TSoftErrorList.Create;
begin
  inherited Create(TSoftErrorItem);
end;

function TSoftErrorList.Add(AType: TSoftErrorType; ACode,
  ADescription: String): TSoftErrorItem;
begin
  // Adds to the list
  Result := NIL; // default

  // Validation
  if (ACode = '') then Exit;
  if (ADescription = '') then Exit;

  // Check if item already exists, and pass it as a result
  Result := FindItem(AType, ACode, ADescription);

  // Create the new item
  if Result = NIL then
     begin
       Result := TSoftErrorItem.Create(Self);
       Result.ErrorType := AType;
       Result.Code := ACode;
       Result.Description := ADescription;
       Result.DisplayName := ADescription;
     end;

end;

function TSoftErrorList.FindItem(AType: TSoftErrorType; ACode,
  ADescription: String): TSoftErrorItem;
var
   i: Integer;
begin
  Result := NIL; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (TSoftErrorItem(Items[i]).ErrorType = AType) and
      (CompareStr(TSoftErrorItem(Items[i]).Code, ACode)=0) and
      (CompareStr(TSoftErrorItem(Items[i]).Description, ADescription)=0) then
      begin
        Result := TSoftErrorItem(Items[i]);
        BREAK;
      end;
end;

function TSoftErrorList.FindItemByCode(ACode: String): TSoftErrorItem;
var
   i: Integer;
begin
  Result := NIL; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (CompareStr(TSoftErrorItem(Items[i]).Code, ACode)=0) then
      begin
        Result := TSoftErrorItem(Items[i]);
        BREAK;
      end;
end;

function TSoftErrorList.FindItemByDescription(
  ADescription: String): TSoftErrorItem;
var
   i: Integer;
begin
  Result := NIL; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (CompareStr(TSoftErrorItem(Items[i]).Description, ADescription)=0) then
      begin
        Result := TSoftErrorItem(Items[i]);
        BREAK;
      end;
end;

function TSoftErrorList.IndexOfCode(ACode: String): Integer;
var
   i: Integer;
begin
  Result := -1; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (CompareStr(TSoftErrorItem(Items[i]).Code, ACode)=0) then
      begin
        Result := i;
        BREAK;
      end;
end;

function TSoftErrorList.IndexOfDescription(ADescription: String): Integer;
var
   i: Integer;
begin
  Result := -1; // default
  // cycle list and find item
  for i := 0 to Count - 1 do
   if (CompareStr(TSoftErrorItem(Items[i]).Description, ADescription)=0) then
      begin
        Result := i;
        BREAK;
      end;
end;

{ ---------------------------------------------------------------------------- }
{ TSoftErrorItem }
{ ---------------------------------------------------------------------------- }

constructor TSoftErrorItem.Create(Collection: TSoftErrorList);
begin
  inherited Create(Collection);
  ErrorType := TSoftErrorType(0);
  Code := '';
  Description := '';
end;

destructor TSoftErrorItem.Destroy;
begin
  inherited Destroy;
end;

procedure TSoftErrorItem.SetErrorType(const Value: TSoftErrorType);
begin
  FErrorType := Value;
end;

{ TMasterShipment }

constructor TMasterShipment.Create(AOwner: TComponent; AMasterShipmentID: Real);
begin
  inherited Create(AOwner);
  FMasterShipmentID := AMasterShipmentID;
  Refresh;
end;

destructor TMasterShipment.Destroy;
begin

  inherited;
end;

procedure TMasterShipment.FillImporterData;
var
   AData: Variant;
   AFirstName,
   ALastName,
   ASQL: String;
begin
   // First, clear the existing data
   with FImporter do
   begin
    Company      := '';
    Contact      := '';
    FirstName    := '';
    LastName     := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    CountryCode3Digit := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
    AccountNumber := '';
   end;

   if MasterShipmentID = 0 then Exit;

   ASQL := Format(
           'select'#13 +
           '   i.attn as ship_to_attn,'#13 +
           '   i.prime_contact as ship_to_prime_contact,'#13 +
           '   i.addr1 as ship_to_addr1,'#13 +
           '   i.addr2 as ship_to_addr2,'#13 +
           '   i.addr3 as ship_to_addr3,'#13 +
           '   i.city as ship_to_city,'#13 +
           '   i.state as ship_to_state,'#13 +
           '   i.zip as ship_to_zip,'#13 +
           '   i.country as ship_to_country,'#13 +
           '   country_code.Get2CharCountryCode(upper(trim(i.country))) as ship_to_country_code,'#13 +
           '   i.phone_number as ship_to_phone_number,'#13 +
           '   i.ext as ship_to_ext,'#13 +
           '   i.fax as ship_to_fax,'#13 +
           '   i.account_number'#13 +
           'from'#13 +
           '   importer i,'#13 +
           '   master_shipment ms'#13 +
           'where'#13 +
           '    i.id = ms.importer_id'#13 +
           'and ms.id = %.0f',
           [MasterShipmentID]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FImporter do
       begin
        Company      := Trim(AData[0]);
        Contact      := Trim(AData[1]);
        ParseFullName(Contact, AFirstName, ALastName); // shipman_region.pas
        FirstName    := AFirstName;
        LastName     := ALastName;
        Address1     := Trim(AData[2]);
        Address2     := Trim(AData[3]);
        Address3     := Trim(AData[4]);
        City         := Trim(AData[5]);
        State        := Trim(AData[6]);
        Zip          := Trim(AData[7]);
        Country      := Trim(AData[8]);
        CountryCode  := Trim(AData[9]);
        Telephone    := Trim(AData[10]);
        Ext          := Trim(AData[11]);
        Fax          := Trim(AData[12]);
        AccountNumber:= Trim(AData[13]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure the country code is populated
        if CountryCode = '' then
             CountryCode  := CountryCodeFor(Country, cctChr2);
        CountryCode3Digit := shipman_region.CountryCodeFor(CountryCode, cctDigit3);
        // ensure we have a USPS-style country name for this code
        Country      := CountryNameFor(CountryCode);
       end;
end;

procedure TMasterShipment.FillPortData;
var
   AData: Variant;
   AFirstName,
   ALastName,
   ASQL: String;
begin
   // First, clear the existing data
   with FPortOfEntry do
   begin
    Company      := '';
    Contact      := '';
    FirstName    := '';
    LastName     := '';
    Address1     := '';
    Address2     := '';
    Address3     := '';
    City         := '';
    State        := '';
    Zip          := '';
    Country      := '';
    CountryCode  := '';
    CountryCode3Digit := '';
    Telephone    := '';
    Ext          := '';
    Fax          := '';
    EMail        := '';
   end;

   if MasterShipmentID = 0 then Exit;

   ASQL := Format(
           'select'#13 +
           '   p.portname,'#13 +
           '   p.portconsignee,'#13 +
           '   p.portaddress1,'#13 +
           '   p.portaddress2,'#13 +
           '   p.portcity,'#13 +
           '   p.portstatecountyprovince,'#13 +
           '   p.portpostalcode,'#13 +
           '   country_code.getcountrynamefor(p.portcountrycode),'#13 +
           '   p.portcountrycode,'#13 +
           '   p.portcode'#13 +
           'from'#13 +
           '   ups_port_of_entry p,'#13 +
           '   master_shipment ms'#13 +
           'where'#13 +
           '    p.id = ms.UPS_PORT_OF_ENTRY_ID'#13 +
           'and ms.id = %.0f',
           [MasterShipmentID]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
      with FPortOfEntry do
       begin
        Company      := Trim(AData[0]);
        Contact      := Trim(AData[1]);
        ParseFullName(Contact, AFirstName, ALastName); // shipman_region.pas
        FirstName    := AFirstName;
        LastName     := ALastName;
        Address1     := Trim(AData[2]);
        Address2     := Trim(AData[3]);
        City         := Trim(AData[4]);
        State        := Trim(AData[5]);
        Zip          := Trim(AData[6]);
        Country      := Trim(AData[7]);
        CountryCode  := Trim(AData[8]);
        PortCode     := Trim(AData[9]);

        ParsePostalCode(Zip,Zip,PostalCodeSuffix); // shipman_share.pas

        // ensure the country code is populated
        if CountryCode = '' then
             CountryCode  := CountryCodeFor(Country, cctChr2);
        CountryCode3Digit := shipman_region.CountryCodeFor(CountryCode, cctDigit3);
        // ensure we have a USPS-style country name for this code
        Country      := CountryNameFor(CountryCode);
       end;
end;

procedure TMasterShipment.FillMasterShipmentData;
var
   AData: Variant;
   ASQL: String;
begin
    FShipmentNumber := '';
    FTrackingNumber := '';
    FServiceCode := '';
    FBillingType := 0;
    FWeightUOM := '';
    FCurrencyCode := '';


   if MasterShipmentID = 0 then Exit;

   ASQL := Format(
           'select ms.tracking_number,'#13 +
                  'ms.service_code,'#13 +
                  'ms.billing_type,'#13 +
                  'ms.weight_uom,'#13 +
                  'ms.curr_code,'#13 +
                  'ms.shipment_number'#13 +
           'from master_shipment ms'#13 +
           'where'#13 +
           '   ms.id = %.0f',
           [MasterShipmentID]);

   AData := SelectValueArray(ASQL);

   // Update the data
   if System.Variants.VarArrayDimCount(AData) <> 0 then
       begin
        FTrackingNumber := Trim(AData[0]);
        FServiceCode := Trim(AData[1]);
        FBillingType := AData[2];
        FWeightUOM := Trim(AData[3]);
        FCurrencyCode := Trim(AData[4]);
        FShipmentNumber := Trim(AData[5]);
       end;
end;

procedure TMasterShipment.Refresh;
begin
  FillMasterShipmentData;
  FillImporterData;
  FillPortData;
end;

function TMasterShipment.ValidateImporterData: Boolean;
var
   ACode: String;
begin
  // Get the country code
  ACode := CountryCodeFor(Importer.Country);

  // Validate country code
  Result := ACode > '';
  if not Result then
     raise Exception.Create(shipman_rscstr.cTXT000028 {'Country code not found for Packing Slip recipient.'});

  // Validate state code
  if IQMS.Common.StringUtils.StrInList(ACode, ['US','CA','MX']) then
     begin
       Result := (Trim(Importer.State) > '') and IsStateCodeValid(ACode, Importer.State);
       if not Result then
          raise Exception.Create(shipman_rscstr.cTXT000029 {'State code not found for Packing Slip recipient.'});
     end;

end;

{ TQuantumView }

constructor TQuantumView.Create(AOwner: TComponent; ASource: String; ASourceID: Real);
var
  AValues: Variant;
  ANotification: TQuantumViewNotification;
  i, j: Integer;
begin
  inherited Create(AOwner);
  Notifications := TList.Create();
  AValues:= SelectValueArrayFmt(
      'select ship_from_name, fail_email, subject_type, subject, memo, return,'#13 +
      'company1, contact1, email1, ship1, exception1, delivery1, intransit1,'#13 +
      'company2, contact2, email2, ship2, exception2, delivery2, intransit2,'#13 +
      'company3, contact3, email3, ship3, exception3, delivery3, intransit3,'#13 +
      'company4, contact4, email4, ship4, exception4, delivery4, intransit4,'#13 +
      'company5, contact5, email5, ship5, exception5, delivery5, intransit5 '#13 +
      'from ups_quantum_view where source = ''%s'' and source_id = %.0f', [ASource, ASourceID]);

  if VarArrayDimCount(AValues) > 0  then
  begin
  ShipFrom    := AValues[0];
  FailEmail   := AValues[1];
  SubjectType := AValues[2];
  Subject     := AValues[3];
  Memo        := AValues[4];

  for i := 0 to 4 do
    begin
      ANotification.Company := AValues[6 + (i * 7)];
      ANotification.Contact := AValues[7 + (i * 7)];
      ANotification.Email   := AValues[8 + (i * 7)];
      if (IQMS.Common.Boolean.YNToBool(AValues[5])) then
        begin
          ANotification.NotificationType := 4;
          if (ANotification.Email <> '') then
            Notifications.Add(TQuantumViewNotificationClass.Create(Self, ANotification))
        end
      else
      for j := 0 to 3 do
        if (AValues[9 + (i * 7) + j] = 'Y') then
          begin
            ANotification.NotificationType := j;
            Notifications.Add(TQuantumViewNotificationClass.Create(Self, ANotification))
          end;
    end;
  end;
end;

{ TQuantumViewNotificationClass }

constructor TQuantumViewNotificationClass.Create(AOwner: TComponent;
  ANotification: TQuantumViewNotification);
begin
  inherited Create(AOwner);
  Notification := ANotification;
end;

end.
