unit ups_httplink_label;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.Classes,
  System.Variants,
  System.SysUtils,
  System.Math,
  ups_httplink_typelib,
  MaskUtils,
  Vcl.Printers,
  shipman_common,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  {Forwards}
  TUPSShipmentLabels = class;
  TUPSPackageItem = class;
  TUPSPackages = class;
  TUPSBilling = class;
  TUPSSEDOptions = class;
  TPickupSummaryPackageCount = class;
  TPickupSummaryBarcodeReport = class;

  String02 = String[2];
  String03 = String[3];
  String07 = String[7];
  String35 = String[35];

  {TUPSShipmentLabels}
  {This component represents a shipment, and handles multiple UPS packages.
   Some label values require knowledge of all labels in a shipment; so,
   to print "shipping labels," all packages must be taken into account.}
  TUPSShipmentLabels = class(TComponent)
  private
    {Private declarations}
    FSourceID: Real;
    FSource: String;
    FCarrierID: Real;
    FEPlantID: Real;
    FPackages: TUPSPackages;
    FShpNo: ShortString;
    FShpWt: Real;
    FShpWtStr: ShortString;
    FShpWtUOM: TUPSWeightUOM;
    FShipmentDateStr: ShortString;
    FShipmentDate: TDateTime;
    FShpDwt: Real;
    FShpDwtStr: ShortString;

    FShipFrom_Contact: ShortString;
    FShipFrom_Company: ShortString;
    FShipFrom_Phone: ShortString;
    FShipFrom_Addr1: ShortString;
    FShipFrom_Addr2: ShortString;
    FShipFrom_Addr3: ShortString;
    FShipFrom_City: ShortString;
    FShipFrom_State: ShortString;
    FShipFrom_PostalCode: ShortString;
    FShipFrom_Country: ShortString;
    FShipFrom_CountryCode: ShortString;

    FShipTo_Contact: ShortString;
    FShipTo_Company: ShortString;
    FShipTo_Phone: ShortString;
    FShipTo_Addr1: ShortString;
    FShipTo_Addr2: ShortString;
    FShipTo_Addr3: ShortString;
    FShipTo_City: ShortString;
    FShipTo_State: ShortString;
    FShipTo_PostalCode: ShortString;
    FShipTo_Country: ShortString;
    FShipTo_CountryCode: ShortString;
    FShipTo_Country3DigitCode: ShortString;

    FRoutingCode: ShortString;
    FVendorControlNumber: ShortString;
    FDocumentsOnly: Boolean;
    FRoutingCodeVersion: ShortString;
    FCreatedBy: String;
    FCreated: TDateTime;
    FShipperNo: ShortString;
    FReturnService: Boolean;
    FImportControl: Boolean;
    FCarbonNeutral: Boolean;
    FPrintDestination: TUPSPrintDestination;
    FPrinterName: String;
    FReportPrinterName: String;
    FBatchID: Real;
    FDocumentOptions: TUPSDocumentOptions;
    FInvoice: Boolean;
    FInvoiceCopies: Integer;
    FInvoicePaperless: Boolean;
    FInvoicePaperlessNafta: Boolean;
    FInvoicePaperlessOtherDoc: Boolean;
    FAccountNo: ShortString;
    FPickupAttempts: TPickupAttemptsByte;
    FReturnsExchange: Boolean;
    FUPSSEDOptions: TUPSSEDOptions;
    FLabelFileName: String;
    FMaxiCodeFileName: String;
    FPrinterType: TUPSPrinterType;
    FProactiveResponse: Boolean;
    FPrintLabel: Boolean;
    FPrintTestPage: Boolean;
    FPrintPaperless: Boolean;
    FPrintPaperlessNafta: Boolean;
    FPrintSED: Boolean;
    FSEDCopies: Integer;
    FPrintCO: Boolean;
    FCOCopies: Integer;
    FAddressValidated: Boolean;
    FMasterShipmentID: Real;
    FWorldEase: Boolean;
    FWorldEase_City: String;
    FWorldEase_State: String;
    FWorldEase_PostalCode: String;
    FWorldEase_Country3DigitCode: String;
    FMailerID: ShortString;
    FRFA: Boolean;
    FExtDoc: Boolean;
    FConsigneeLabel: Boolean;
    FTestPrint: Boolean;
    procedure SetShipmentDate(const Value: TDateTime);
    function GetBoxCount: Integer;
    //procedure AssignPackageCarrierInfo(APackage: TUPSPackageItem);
  protected
    {Protected declarations}
    procedure CalcShipmentWeight;
    procedure CalcShipmentNo;
    procedure CalcShipperNo;
    procedure CalcVendorCtrlNo;
    procedure AppendToMaxiCodeFile(const AFileName: String);
    procedure ExecPrint;
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Execute;
    procedure Prepare;
    procedure ClearPackages;
  published
    {Published declarations}
    property SourceID: Real read FSourceID write FSourceID;
    property Source: String read FSource write FSource;
    property CarrierID: Real read FCarrierID write FCarrierID;
    property EplantID: Real read FEPlantID write FEplantID;
    property BatchID: Real read FBatchID;
    property Created: TDateTime read FCreated write FCreated;
    property CreatedBy: String read FCreatedBy write FCreatedBy;
    property AccountNo: ShortString read FAccountNo write FAccountNo;
    property MailerID: ShortString read FMailerID write FMailerID;
    property PrintDestination: TUPSPrintDestination read FPrintDestination write FPrintDestination;
    property PrinterName: String read FPrinterName write FPrinterName;
    property ReportPrinterName: String read FReportPrinterName write FReportPrinterName;
    property PrinterType: TUPSPrinterType read FPrinterType write FPrinterType;
    property LabelFileName: String read FLabelFileName write FLabelFileName;
    property TestPrint: Boolean read FTestPrint write FTestPrint;

    // Set this value, and all input.dat files, for each package, will be
    // appended to it.
    property MaxiCodeFileName: String read FMaxiCodeFileName
     write FMaxiCodeFileName;

    // Required properties
    property Packages: TUPSPackages read FPackages write FPackages;
    property ShipmentDate: TDateTime read FShipmentDate write SetShipmentDate;

    property ShipFrom_Contact: ShortString read FShipFrom_Contact write FShipFrom_Contact;
    property ShipFrom_Phone: ShortString read FShipFrom_Phone write FShipFrom_Phone;
    property ShipFrom_Company: ShortString read FShipFrom_Company write FShipFrom_Company;
    property ShipFrom_Addr1: ShortString read FShipFrom_Addr1 write FShipFrom_Addr1;
    property ShipFrom_Addr2: ShortString read FShipFrom_Addr2 write FShipFrom_Addr2;
    property ShipFrom_Addr3: ShortString read FShipFrom_Addr3 write FShipFrom_Addr3;
    property ShipFrom_City: ShortString read FShipFrom_City write FShipFrom_City;
    property ShipFrom_State: ShortString read FShipFrom_State write FShipFrom_State;
    property ShipFrom_Zip: ShortString read FShipFrom_PostalCode write FShipFrom_PostalCode;
    property ShipFrom_Country: ShortString read FShipFrom_Country write FShipFrom_Country;
    property ShipFrom_CountryCode: ShortString read FShipFrom_CountryCode write FShipFrom_CountryCode;

    property ShipTo_Contact: ShortString read FShipTo_Contact write FShipTo_Contact;
    property ShipTo_Phone: ShortString read FShipTo_Phone write FShipTo_Phone;
    property ShipTo_Company: ShortString read FShipTo_Company write FShipTo_Company;
    property ShipTo_Addr1: ShortString read FShipTo_Addr1 write FShipTo_Addr1;
    property ShipTo_Addr2: ShortString read FShipTo_Addr2 write FShipTo_Addr2;
    property ShipTo_Addr3: ShortString read FShipTo_Addr3 write FShipTo_Addr3;
    property ShipTo_City: ShortString read FShipTo_City write FShipTo_City;
    property ShipTo_State: ShortString read FShipTo_State write FShipTo_State;
    property ShipTo_Zip: ShortString read FShipTo_PostalCode write FShipTo_PostalCode;
    property ShipTo_Country: ShortString read FShipTo_Country write FShipTo_Country;
    property ShipTo_CountryCode: ShortString read FShipTo_CountryCode write FShipTo_CountryCode;
    property ShipTo_Country3DigitCode: ShortString read FShipTo_Country3DigitCode write FShipTo_Country3DigitCode;
    property AddressValidated: Boolean read FAddressValidated write FAddressValidated;

    property RoutingCode: ShortString read FRoutingCode write FRoutingCode;
    property RoutingCodeVersion: ShortString read FRoutingCodeVersion write FRoutingCodeVersion;

    // Documents and Invoices
    property DocumentsOnly: Boolean read FDocumentsOnly write FDocumentsOnly;
    property DocumentOptions: TUPSDocumentOptions read FDocumentOptions write FDocumentOptions;
    property Invoice: Boolean read FInvoice write FInvoice;
    property InvoiceCopies: Integer read FInvoiceCopies write FInvoiceCopies;
    property InvoicePaperless: Boolean read FInvoicePaperless write FInvoicePaperless;
    property InvoicePaperlessNafta: Boolean read FInvoicePaperlessNafta write FInvoicePaperlessNafta;
    property InvoicePaperlessIncludesOther: Boolean read FInvoicePaperlessOtherDoc write FInvoicePaperlessOtherDoc;
    property SEDOptions: TUPSSEDOptions read FUPSSEDOptions write FUPSSEDOptions;
    property PrintExtDocLabel: Boolean read FExtDoc write FExtDoc;
    property PrintConsigneeLabel: Boolean read FConsigneeLabel write FConsigneeLabel;

    property CarbonNeutral: Boolean read FCarbonNeutral write FCarbonNeutral;
    property ReturnService: Boolean read FReturnService write FReturnService;
    property ReturnFlexibleAccess: Boolean read FRFA write FRFA;
    property ImportControl: Boolean read FImportControl write FImportControl;
    property PickupAttempts: TPickupAttemptsByte read FPickupAttempts write FPickupAttempts;
    property ReturnsExchange: Boolean read FReturnsExchange write FReturnsExchange;
    property ProactiveResponse: Boolean read FProactiveResponse write FProactiveResponse;
    property PrintLabel: Boolean read FPrintLabel write FPrintLabel;
    property PrintTestPage: Boolean read FPrintTestPage write FPrintTestPage;
    property PrintPaperless: Boolean read FPrintPaperless write FPrintPaperless;
    property PrintPaperlessNafta: Boolean read FPrintPaperlessNafta write FPrintPaperlessNafta;
    property PrintSED: Boolean read FPrintSED write FPrintSED;
    property SEDCopies: Integer read FSEDCopies write FSEDCopies;
    property PrintCO: Boolean read FPrintCO write FPrintCO;
    property COCopies: Integer read FCOCopies write FCOCopies;
    property MasterShipmentID: Real read FMasterShipmentID write FMasterShipmentID;
    property WorldEase: Boolean read FWorldEase write FWorldEase;
    property WorldEase_City: String read FWorldEase_City write FWorldEase_City;
    property WorldEase_State: String read FWorldEase_State write FWorldEase_State;
    property WorldEase_PostalCode: String read FWorldEase_PostalCode write FWorldEase_PostalCode;
    property WorldEase_Country3DigitCode: String read FWorldEase_Country3DigitCode write FWorldEase_Country3DigitCode;

    // Calculated values
    property VendorControlNumber: ShortString read FVendorControlNumber;
    property BoxCount: Integer read GetBoxCount;
    property ShipmentNumber: ShortString read FShpNo;
    property ShipperNumber: ShortString read FShipperNo;
    property ShipmentWeight: Real read FShpWt;
    property ShipmentWeightStr: ShortString read FShpWtStr;
    property ShipmentWeightUOM: TUPSWeightUOM read FShpWtUOM write FShpWtUOM;
    property ShipmentDateStr: ShortString read FShipmentDateStr;
    property ShipmentDWT: Real read FShpDwt; // Shipment Dimensional Weight
    property ShipmentDWTStr: ShortString read FShpDwtStr; // Shipment Dimensional Weight UOM
  end;

  {TUPSPackageItem}
  TUPSPackageItem = class(TComponent)
  private
    {Private declarations}
    FID: Real;
    FOwner: TUPSShipmentLabels;
    FTrackingNo: ShortString;
    FAccountNo: ShortString;
    FShpDwt: Real;
    FShpDwtStr: ShortString;
    FPkgDwt: Real;
    FPkgDwtStr: ShortString;
    FShpNo: ShortString;
    FPkgWtStr: ShortString; // shipment weight string
    FBillableWeight: Real;
    FLargePackage: Boolean;
    FPkgCntStr: ShortString;
    FBoxCount: Integer;
    FBoxNo: Integer;
    FShipmentWeight: ShortString;
    FShpDate: ShortString;
    FAdditionalHandling: Boolean;
    FLP_AH_Indicator: ShortString;
    FAdditionalHandlingCharge: Real;
    FPackageActualWeight: Real;
    FShipTo_Company: ShortString;
    FShipTo_Phone: ShortString;
    FShipTo_PostalCode: ShortString;
    FShipTo_Addr2: ShortString;
    FShipFrom_PostalCode: ShortString;
    FShipFrom_Company: ShortString;
    FShipTo_Country: ShortString;
    FShipTo_Addr1: ShortString;
    FShipTo_Contact: ShortString;
    FShipFrom_Addr2: ShortString;
    FShipTo_CountryCode: ShortString;
    FShipFrom_Phone: ShortString;
    FShipFrom_Country: ShortString;
    FShipFrom_CountryCode: ShortString;
    FShipFrom_Contact: ShortString;
    FShipFrom_Addr1: ShortString;
    FRoutingCode: ShortString;
    FWidth: Integer;
    FLength: Integer;
    FHeight: Real;
    FDimUOM: TUPSDimensionUOM;
    FPackaging: TUPSPackaging;
    FWeightUOM: TUPSWeightUOM;
    FOrderNo: ShortString;
    FServiceNote: ShortString;
    FServiceIcon: ShortString;
    FDepartment: ShortString;
    FDescription: String35;
    FVendorControlNumber: ShortString;
    //FBillingOption: TUPSBillingOption;
    //FBillingOptionStr: ShortString;
    FSignatureOptionStr: ShortString;
    FSignatureOption: TUPSSignatureOption;
    FBatchID: Real;
    FPostalBarCode: ShortString;
    FInternational: Boolean;
    FShipTo_Country3DigitCode: ShortString;
    //FRoutingInstructionCode: String;
    FDocumentsOnly: Boolean;
    FDocIndicator: ShortString;
    FDocumentOptions: TUPSDocumentOptions;
    FDocumentOptionsStr: String;
    FInvoice: Boolean;
    FInvoicePaperless: Boolean;
    FInvoicePaperlessNafta: Boolean;
    FInvoicePaperlessOtherDoc: Boolean;
    FCOD: Boolean;
    FCODAmount: Real;
    FCODIndicator: String;
    //FBillingInstructions: String;
    FDeliveryConfirmation: Boolean;
    FRoutingCodeVersion: ShortString;
    FUPSService: TUPSService;
    //FFileName: String;
    FCreatedBy: String;
    FCreated: TDateTime;
    FShipTo_State: ShortString;
    FShipTo_Addr3: ShortString;
    FShipFrom_State: ShortString;
    FShipTo_City: ShortString;
    FShipFrom_Addr3: ShortString;
    FShipFrom_City: ShortString;
    FServiceClass: String;
    FMaxiCode: String;
    FWorldEaseMaxiCode: String;
    FMaxiCodeMode: Integer;
    FShpDateDate: TDateTime;
    FReference1: String;
    FReference2: String;
    FReference3: String;
    FReference4: String;
    FReference5: String;
    FShipperNo: ShortString;
    FReturnService: Boolean;
    FImportControl: Boolean;
    FPickupAttempts: TPickupAttemptsByte;
    FLabelName: String;
    FDBFFileName: String;
    FPrintDestination: TUPSPrintDestination;
    FDocumentIndicator: TUPSDocumentIndicator;
    FPrinterName: String;
    FReportPrinterName: String;
    FPrinterType: TUPSPrinterType;
    FShipperRelease: Boolean;
    FCODAddShipping: Boolean;
    FCODPayByCheck: Boolean;
    FPackageCost: Real;
    FBilling: TUPSBilling;
    FExchangeCollect: Boolean;
    FLabelFileName: String;
    FMaxiCodeFileName: String;
    FProactiveResponse: Boolean;
    FSaturdayDelivery: Boolean;
    FISC: Boolean;
    FPrintLabel: Boolean;
    FPrintTestPage: Boolean;
    FAddressValidated: Boolean;
    FRFA: Boolean;
    FPackageSeqNo: String;
    FPicNo: String;
    FMailerID: String;
    procedure AssignValuesFromOwner;
    procedure AdjustParams;
    procedure Validate;
    procedure CalcPkgWt;
    procedure CalcPkgCnt;
    procedure CalcLPAHIndicator;
    procedure CalcPostalBarCode;
    procedure CalcRoutingInstruction;
    procedure CalcMaxiCode;
    procedure CreateMaxiCodeImage;
    procedure CalcDocInd;
    procedure CalcDocOptions;
    procedure CalcLabelName;
    procedure PopulatePackageRecord;

    function GetPkgDwt: Real;

    procedure ExecPrint;
    procedure SetCODAmount(const Value: Real);
    procedure SetCOD(const Value: Boolean);
    function GetDBFFileName: String;

    procedure GetLabelLines_EPL(var ALines: TStringList);
    procedure GetLabelLines2_EPL(var ALines: TStringList;
      APrintWarsaw: Boolean; AReferenceLines: TStringList);

    procedure GetLabelLines_ZPL(var ALines: TStringList);
    procedure GetLabelLines2_ZPL(var ALines: TStringList;
     APrintWarsaw: Boolean; AReferenceLines: TStringList);
    procedure GetRecipientAddressLines(var ALines: TStringList);
    procedure GetSenderAddressLines(var ALines: TStringList);
    procedure CreatePostalCodeImage;
    procedure CreateTrackingNumberImage;
    procedure CalcWorldEaseMaxiCode;
    procedure CreateUSPSImage;

  protected
    {Protected declarations}
  public
    {Public declarations}
    constructor Create(AOwner: TUPSShipmentLabels; ATrackingNo: ShortString;
     ABoxNo: Integer);
    destructor Destroy; override;
    procedure Execute;
    procedure CalcDimWt;
    procedure CalcLargePkg;
    procedure CalcPkgAH;
  published
    {Published declarations}
    property ID: Real read FID write FID;
    property TrackingNo: ShortString read FTrackingNo write FTrackingNo;

    property BoxNo: Integer read FBoxNo write FBoxNo;

    property PackageCost: Real read FPackageCost write FPackageCost;

    property PackageWeight: Real read FPackageActualWeight write FPackageActualWeight;
    property PackageDimWeight: Real read FPkgDwt write FPkgDwt;
    property WeightUOM: TUPSWeightUOM read FWeightUOM write FWeightUOM;

    property PackageLength: Integer read FLength write FLength;
    property PackageWidth: Integer read FWidth write FWidth;
    property PackageHeight: Real read FHeight write FHeight;
    property DimensionUOM: TUPSDimensionUOM read FDimUOM write FDimUOM;

    property Service: TUPSService read FUPSService write FUPSService;
    property Packaging: TUPSPackaging read FPackaging write FPackaging;
    property ServiceClass: String read FServiceClass write FServiceClass;

    property Billing: TUPSBilling read FBilling write FBilling;

    property DocumentIndicator: TUPSDocumentIndicator read FDocumentIndicator
     write FDocumentIndicator;

    property AdditionalHandling: Boolean read FAdditionalHandling
     write FAdditionalHandling;
    property AdditionalHandlingCharge: Real read FAdditionalHandlingCharge
     write FAdditionalHandlingCharge;

    property ServiceIcon: ShortString read FServiceIcon write FServiceIcon;
    property ServiceInstructions: ShortString read FServiceNote write FServiceNote;
    property OrderNo: ShortString read FOrderNo write FOrderNo;
    property Department: ShortString read FDepartment write FDepartment;
    property Description: String35 read FDescription write FDescription;
    property DocumentationIndicator: ShortString read FDocIndicator write FDocIndicator;
    //property BillingOption: TUPSBillingOption read FBillingOption write FBillingOption;
    property DeliveryConfirmation: Boolean read FDeliveryConfirmation write FDeliveryConfirmation;
    property SignatureOption: TUPSSignatureOption read FSignatureOption write FSignatureOption;
    property COD: Boolean read FCOD write SetCOD;
    property CODAmount: Real read FCODAmount write SetCODAmount;
    property CODPayByCheck: Boolean read FCODPayByCheck write FCODPayByCheck;
    property CODAddShipping: Boolean read FCODAddShipping write FCODAddShipping;
    property ShipperRelease: Boolean read FShipperRelease write FShipperRelease;
    property ExchangeCollect: Boolean read FExchangeCollect write FExchangeCollect;
    property ProactiveResponse: Boolean read FProactiveResponse write FProactiveResponse;
    property SaturdayDelivery: Boolean read FSaturdayDelivery write FSaturdayDelivery;
    property ISC: Boolean read FISC write FISC;
    property AddressValidated: Boolean read FAddressValidated write FAddressValidated;

    property Reference1: String read FReference1 write FReference1;
    property Reference2: String read FReference2 write FReference2;
    property Reference3: String read FReference3 write FReference3;
    property Reference4: String read FReference4 write FReference4;
    property Reference5: String read FReference5 write FReference5;

    // Calculated properties (after Execute is called)
    property DBFFileName: String read FDBFFileName;
    property LabelName: String read FLabelName;
    property PackageDWT: Real read GetPkgDwt; // Package Dimensional Weight
    property PackageDWTStr: ShortString read FPkgDwtStr; // Package Dimensional Weight ShortString
    property PackageWeightStr: ShortString read FPkgWtStr;
    property BillableWeight: Real read FBillableWeight;
    property LargePackage: Boolean read FLargePackage;
    property PackageCountStr: ShortString read FPkgCntStr;
    property LP_AH_Indicator: ShortString read FLP_AH_Indicator;
    //property BillingOptionStr: ShortString read FBillingOptionStr;
    property SignatureOptionStr: ShortString read FSignatureOptionStr;
    property PostalBarCode: ShortString read FPostalBarCode;
    property International: Boolean read FInternational;
    //property RoutingInstructionCode: String read FRoutingInstructionCode;
    property CODIndicator: String read FCODIndicator;
    //property BillingInstructions: String read FBillingInstructions;
    property MaxiCode: String read FMaxiCode;
    property MaxiCodeFileName: String read FMaxiCodeFileName;
  end;

  TUPSSEDOptions = class(TComponent)
  private
    {Private declarations}
    FTypeChar: Char;
    FAESNo: Code28String;
    FSEDType: TSEDFiledType;
    FExpCode: Code2String;
    FPtTransCode: Char;
    FPtTrans: TSEDPartiesToTrans;
    FRtTransInd: Boolean;
    FExpTxIDCode: Code2String;
    FExpTxIDType: TExporterTaxIDType;
    FTaxID: Code28String;
    procedure SetSEDType(const Value: TSEDFiledType);
    procedure SetFPtTrans(const Value: TSEDPartiesToTrans);
    procedure SetExpTxIDType(const Value: TExporterTaxIDType);
  public
    {Public declarations}
    constructor Create(AOwner: TUPSShipmentLabels);
    destructor Destroy; override;
    procedure Validate;
  published
    {Published declarations}
    property SEDType: TSEDFiledType read FSEDType write SetSEDType;
    property SEDTypeChar: Char read FTypeChar;
    property AESTransactionNumber: Code28String read FAESNo write FAESNo;
    property TaxIDNumber: Code28String read FTaxID write FTaxID;
    property ExportInformationCode: Code2String read FExpCode write FExpCode;

    // This information should be provided if the SED Code = D or U
    property PartiesToTrans: TSEDPartiesToTrans read FPtTrans write SetFPtTrans;
    property PartiesToTransCode: Char read FPtTransCode;
    property RoutedTransactionInd: Boolean read FRtTransInd write FRtTransInd;

    // Required when the SEDCode =D, E, P or U
    // Type of Exporter Tax ID.  Currently used for US and PR origins only.
    property ExporterTaxIDType: TExporterTaxIDType read FExpTxIDType write SetExpTxIDType;
    property ExporterTaxIDTypeCode: Code2String read FExpTxIDCode;
  end;

  {TUPSTrackingNumberGenerator}
  TUPSTrackingNumberGenerator = class(TComponent)
  private
    {Private declarations}
    FUPSService: TUPSService;
    FFromCountryCode: ShortString;
    FToCountryCode: ShortString;
    FTrackingNumber: String;
    FAccountNumber: String;
    FCheckDigit: String;
    FServiceIndicator: String;
    FDeliveryConfirmation: Boolean;
    FSaturdayDelivery: Boolean;
    FReferenceNumber: String;
    FSignatureOption: TUPSSignatureOption;
    FServiceClass: String;
    FServiceIcon: String;
    FShipperRelease: Boolean;
    FReturnService: Boolean;
    FFlexibleAccess: Boolean;
    FImportControl: Boolean;
    FPickupAttempts: TPickupAttemptsByte;
    FCOD: Boolean;
    FReturnsExchange: Boolean;
    FProactiveResponse: Boolean;
    FPackCollect: Boolean;
    procedure SetUPSService(const Value: TUPSService);
    procedure FixAccountNo;
    procedure SetReferenceNumber(const Value: String);
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    procedure Calculate;
    procedure CalculateEx(var ANewTrackingNumber: String);
  published
    {Published declarations}
    // Required properties
    property AccountNumber: String read FAccountNumber write FAccountNumber;
    property UPSService: TUPSService read FUPSService write SetUPSService;
    property ShipFromCountryCode: ShortString read FFromCountryCode write FFromCountryCode;
    property ShipToCountryCode: ShortString read FToCountryCode write FToCountryCode;
    property SaturdayDelivery: Boolean read FSaturdayDelivery write FSaturdayDelivery;
    property DeliveryConfirmation: Boolean read FDeliveryConfirmation write FDeliveryConfirmation;
    property SignatureOption: TUPSSignatureOption read FSignatureOption write FSignatureOption;
    property ReferenceNumber: String read FReferenceNumber write SetReferenceNumber;
    property ShipperRelease: Boolean read FShipperRelease write FShipperRelease;
    property ReturnService: Boolean read FReturnService write FReturnService;
    property FlexibleAccess: Boolean read FFlexibleAccess write FFlexibleAccess;
    property PackCollect: Boolean read FPackCollect write FPackCollect;
    property ImportControl: Boolean read FImportControl write FImportControl;
    property COD: Boolean read FCOD write FCOD;
    property PickupAttempts: TPickupAttemptsByte read FPickupAttempts write FPickupAttempts;
    property ReturnsExchange: Boolean read FReturnsExchange write FReturnsExchange;
    property ProactiveResponse: Boolean read FProactiveResponse write FProactiveResponse;

    // New Tracking Number
    property TrackingNumber: String read FTrackingNumber;
    property ServiceClass: String read FServiceClass;
    property ServiceIcon: String read FServiceIcon;
    property ServiceIndicator: String read FServiceIndicator;
  end;

  TUPSPackages = class(TList)
  private
    {Private declarations}
    FOwner: TUPSShipmentLabels;
  public
    {Public declarations}
    constructor Create(AOwner: TUPSShipmentLabels);
    function Add(const ATrackingNumber: ShortString): TUPSPackageItem;
  end;

  TUPSBilling = class(TComponent)
  private
    {Private declarations}
    FOwner: TUPSPackageItem;
    FCountryCode: String;
    FAccount: String;
    FDescription: String;
    FLabelText: String;
    FPLDCode: String;
    FBillingType: TUPSBillingOption;
    procedure SetBillingType(const Value: TUPSBillingOption);
    procedure UpdateLabelText;
    procedure SetAccount(const Value: String);
    procedure SetCountryCode(const Value: String);
  public
    {Public declarations}
    constructor Create(AOwner: TUPSPackageItem);
  published
    {Published declarations}
    property BillingType: TUPSBillingOption read FBillingType write SetBillingType;
    property Account: String read FAccount write SetAccount;
    property CountryCode: String read FCountryCode write SetCountryCode;
    // Calculated properties
    property Description: String read FDescription;
    property LabelText: String read FLabelText;
    property PLDCode: String read FPLDCode;
  end;

  { TPLDUploadStatus }
  TPLDUploadStatus =
   (plsUploaded,         // Successful upload of PLD   91
    plsNotUploaded1Day,  // 1 day PLD not uploaded     90
    plsNotUploaded2Days, // 2 days PLD not uploaded    92
    plsNotUploaded3Days, // 3 days PLD not uploaded    93
    plsPendingError);    // PLD pending, UPS error     94

  { TPickupSummaryPackageCount }
  TPickupSummaryPackageCount = class(TComponent)
  private
    {Private declarations}
    FCount1DA: Integer;
    FCount2DA: Integer;
    FCount3DS: Integer;
    FCountOther: Integer;
    FShipmentCount: Integer;
    FIntlPkgCount: Integer;
    FCODCount: Integer;
    function GetTotalCount: Integer;
  protected
    {Protected declarations}
  public
    {Public declarations}
    constructor Create(const AOwner: TPickupSummaryBarcodeReport);

    // Adds a service to the count of packages by service.
    // AddService - Adds to count.  If service is an "international" service,
    //              then the International package count will be incremented.
    // AddServiceInternational - Adds to count, but increments the
    //              International package count automatically.
    procedure AddService(const AService: TUPSService; const ACount: Integer;
     AForceAsInternational: Boolean = False);
    procedure AddServiceInternational(const AService: TUPSService;
     const ACount: Integer);

    // May be called by calling application to determine if this service
    // will be considered an international service.  If not, then the
    // calling application may choose to execute AddServiceInternational()
    // instead of AddService().
    function IsInternationalService(const AService: TUPSService): Boolean;

    // Clear all counts
    procedure Clear;
  published
    {Published declarations}
    // Number of shipments (a shipment may comprise 1 or more packages)
    property ShipmentCount: Integer read FShipmentCount write FShipmentCount;
    // Number of international packages.
    // Note: Calling AddService() or AddServiceInternational() will set
    //       this value, but it can be overwritten with this property.
    property InternationalCount: Integer read FIntlPkgCount write FIntlPkgCount;
    // Number C.O.D. packages
    property CODCount: Integer read FCODCount write FCODCount;

    // Counts by service (calculated, read-only)
    property Count1DA: Integer read FCount1DA;
    property Count2DA: Integer read FCount2DA;
    property Count3DS: Integer read FCount3DS;
    property CountOther: Integer read FCountOther;
    property TotalPackageCount: Integer read GetTotalCount;
  end;

  { TPickupSummaryBarcodeReport }
  TPickupSummaryBarcodeReport = class(TComponent)
  private
    {Private declarations}
    FShipmentDateStr: String;
    FShipmentDate: TDateTime;
    FShippingRecordNumber: String;
    FPageNumber: Byte;
    FBookNumber: Cardinal;
    FAccountNumber: String;
    FShipFrom_Contact: ShortString;
    FShipFrom_Company: ShortString;
    FShipFrom_Addr1: ShortString;
    FShipFrom_Addr2: ShortString;
    FShipFrom_City: ShortString;
    FShipFrom_State: ShortString;
    FShipFrom_PostalCode: ShortString;
    FShipFrom_Country: ShortString;
    FBoxCount: Integer;
    FPLDStatus: TPLDUploadStatus;
    FPLDIdentifier: String02;
    FBarCode: String;
    FDeclaredValue: Real;
    FPackageCounts: TPickupSummaryPackageCount;
    FPrinterName: String;
    FVendorControlNumber: ShortString;
    FRoutingCodeVersion: ShortString;
    FPrintDestination: TUPSPrintDestination;
    FLabelFileName: String;
    FPrinterType: TUPSPrinterType;
    procedure GetLabelLines_EPL(var ALines: TStringList);
    procedure GetLabelLines_ZPL(var ALines: TStringList);
    procedure SetShipmentDate(const Value: TDateTime);
    procedure Validate;
    procedure RaiseBuildError(const AMsg: String);
    procedure Check(const ACondition: Boolean; AMsg: String);
    procedure CalcShippingRecordNumber;
    procedure CalcBarCode;
    procedure SetAccountNumber(const Value: String);
    procedure SetPLDStatus(const Value: TPLDUploadStatus);
    procedure CalcVendorCtrlNo;
    procedure ExecPrint;
    procedure GetSenderAddressLines(var ALines: TStringList);
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Execute;
  published
    {Published declarations}
    property ShipmentDate: TDateTime read FShipmentDate write SetShipmentDate;
    property BookNumber: Cardinal read FBookNumber write FBookNumber;
    property PageNumber: Byte read FPageNumber write FPageNumber;

    property AccountNumber: String read FAccountNumber write SetAccountNumber;
    property RoutingCodeVersion: ShortString read FRoutingCodeVersion write FRoutingCodeVersion;
    property PLDStatus: TPLDUploadStatus read FPLDStatus write SetPLDStatus;
    property PrintDestination: TUPSPrintDestination read FPrintDestination write FPrintDestination;
    property PrinterName: String read FPrinterName write FPrinterName;
    property PrinterType: TUPSPrinterType read FPrinterType write FPrinterType;

    property LabelFileName: String read FLabelFileName write FLabelFileName;

    property PackageCounts: TPickupSummaryPackageCount
     read FPackageCounts write FPackageCounts;
    property ShipFrom_Contact: ShortString read FShipFrom_Contact write FShipFrom_Contact;
    property ShipFrom_Company: ShortString read FShipFrom_Company write FShipFrom_Company;
    property ShipFrom_Addr1: ShortString read FShipFrom_Addr1 write FShipFrom_Addr1;
    property ShipFrom_Addr2: ShortString read FShipFrom_Addr2 write FShipFrom_Addr2;
    property ShipFrom_City: ShortString read FShipFrom_City write FShipFrom_City;
    property ShipFrom_State: ShortString read FShipFrom_State write FShipFrom_State;
    property ShipFrom_Zip: ShortString read FShipFrom_PostalCode write FShipFrom_PostalCode;
    property ShipFrom_Country: ShortString read FShipFrom_Country write FShipFrom_Country;

    property BoxCount: Integer read FBoxCount write FBoxCount;
    property DeclaredValue: Real read FDeclaredValue write FDeclaredValue;

    // Calculated properties
    property ShippingRecordNumber: String read FShippingRecordNumber;
    property VendorControlNumber: ShortString read FVendorControlNumber;
  end;

  // 6, 8, 10, 12, 14, 20, 30, 40


  TPrinterFontStyle = (pfsSmall,
                       pfsNormal6,
                       pfsNormal8,
                       pfsNormal10,
                       pfsNormal12,
                       pfsNormal14,
                       pfsNormal16,
                       pfsNormal20,
                       pfsNormal30,
                       pfsNormal40);


  TZPLPrint = class(TComponent)
  private
    {Private declarations}
    FLines: TStringList;
    FFinalLines: TStringList;
    procedure AddHeader;
    procedure AddFooter;
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Clear;
    procedure Add(S: String);
    procedure AddText(const AText: String; const ALeft, ATop: Integer;
     const AStyle: TPrinterFontStyle);
    procedure ThickHorizontalLine(const ATop: Integer);
    procedure ThinHorizontalLine(const ATop: Integer);
    procedure ThinVerticalLine(const ALeft, ATop, AHeight: Integer);
    procedure BlackSquare(const ALeft, ATop, ASize: Integer);
    procedure Execute;
  published
    {Published declarations}
    property Lines: TStringList read FFinalLines;
  end;

  TPDF417 = class(TComponent)
  private
    {Private declarations}
     FShipment: TShippingInfo;
     FInvoice: TShipmentInvoice;
     FPackages: TList;
     FUPSAccount: TStringList;
     FTextList: TStringList;
     FText: String;
     FBillingCode: TUPSBillingOption;
     FPaperless: Boolean;
     FPaperlessNafta: Boolean;
     FMasterShipmentID: Real;
     FWorldEase: Boolean;
     FWorldEaseShipmentNo: String;
     FDocBox: Boolean;
     FPortCountryCode: String;
     FPortCode: String;
     FShipmentCount: Integer;
     FPackageCount: Integer;
     FWeightUOM: String;
     FTotalWeight: Real;
     FDocBoxTracking: String;

    procedure AddString(const AValue: String; const ALength: Integer; const AFixed: Boolean); overload;
    procedure AddString(const AValue: String; const ALength: Integer); overload;
    procedure AddString(const AValue: String); overload;
    procedure Build01;
    procedure Build02;
    procedure Build03;
    procedure Build04(ACode: String);
    procedure Build05;
    procedure Build06;
    procedure Build07;
    procedure Build08;
    procedure Build09;
    procedure Build10;
    procedure Build11;
    procedure Build12;
    procedure Build13;
    procedure Build14;
    procedure Build98;
    procedure Build99;
    procedure SaveToTable;
    procedure AddDate(const AValue: TDateTime);
    function CalculateShipmentWeight: Real;
    procedure AddFloat(const AValue: Real; const ADecimals: Byte;
      const ALength: Integer);
    function CalculateShipmentDimWeight: Real;
    procedure GetPackageFromQuery(APackageID: Real;
      var APackage: TPackage);
    function FixPhoneFax(ANumber, ACountryCode: String): String;
    procedure EndSegment;
    procedure AddInt(const AValue: Integer);
  public
    {Public declarations}
     constructor Create(AOwner: TComponent; ASourceID: Real; ASource: String; AEplantID: Real;
        ACarrierID: Real; APaperless: Boolean; APaperlessNafta: Boolean; ADocBox: Boolean);
     destructor Destroy; override;
     procedure Execute;
     procedure AddPackage(APackage: TPackage);
  published
    {Published declarations}
    property Text: String read FText;
  end;


  // Returns the "check digit"
  function GetCheckDigit(const AStub: String; AMultiplier:Integer = 2): String;

const
  {"The Warsaw Agreement must appear on the address label for all international
   movements." (UPS Guide to Labeling 2009)}
  FIELD_DELIMITER = #9;
  SEGMENT_DELIMITER = #13;
  WARSAW_AGREEMENT = 'Shipper agrees to the applicable UPS Terms and ' +
                     'Conditions of Carriage/Service (found at www.ups.com ' +
                     'and UPS service centers). If the carriage involves an ' +
                     'ultimate destination or stop in a country other than ' +
                     'the country of departure, the Convention for the ' +
                     'Unification of Certain Rules Relating to International ' +
                     'Transportation by Air, as amended (Warsaw Convention) ' +
                     'may apply and in most cases limits UPSs liability for ' +
                     'loss or damage to cargo. Shipments transported partly ' +
                     'or solely by road into or from a country that is party ' +
                     'to the Convention on the Contract for the ' +
                     'International Carriage of Goods by Road (the CMR) are ' +
                     'subject to the provisions of the CMR, notwithstanding ' +
                     'any clause contrary in the UPS Terms. Except as ' +
                     'otherwise governed by Warsaw Convention, CMR or other ' +
                     'mandatory law, the UPS Terms limit UPSs liability for ' +
                     'loss, damage, and delay of this shipment. There are no ' +
                     'stopping places which are agreed at the time of tender ' +
                     'of the shipment, and UPS reserves the right to route ' +
                     'the shipment in any way it deems appropriate.  ' +
                     'Where allowed by law, the shipper authorizes UPS to ' +
                     'act as forwarding agent for export control and customs ' +
                     'purposes. If exported from the US, shipper certifies ' +
                     'that these commodities, technology or software were ' +
                     'exported from the US in accordance with the Export ' +
                     'Administration Regulations. Diversion contrary to law ' +
                     'is prohibited.';


implementation

uses
  IQMS.Common.AddressFormat,
  IQMS.Common.DotNetCOMShared,
  shipman_printconst,
  IQMS.Common.Boolean,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Print,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  prn_share,
  }
  ups_httplink_const,
  ups_httplink_maxicode,
  ups_httplink_rates,
  ups_httplink_service,
  ups_httplink_utils;

function GetCheckDigit(const AStub: String; AMultiplier:Integer = 2): String;
const
  AlphaNumConvert: array[0..25] of array[0..1] of Char =
  (('A','2'),('B','3'),('C','4'),('D','5'),('E','6'),('F','7'),('G','8'),
   ('H','9'),('I','0'),('J','1'),('K','2'),('L','3'),('M','4'),('N','5'),
   ('O','6'),('P','7'),('Q','8'),('R','9'),('S','0'),('T','1'),('U','2'),
   ('V','3'),('W','4'),('X','5'),('Y','6'),('Z','7'));

var
   i, j: Integer;
   S, tmp: String;
   C: Char;
   iSumOdd, iSumEven, iTotal: Integer;
   b: Boolean;

  function _Eval(C_In: Char; var C_Out: Char): Boolean;
  var
     n: Integer;
  begin
    Result := False;
    for n := 0 to 25 do
     if C_In = AlphaNumConvert[n,0] then
        begin
          C_Out := AlphaNumConvert[n,1];
          Result := True;
          Break;
        end;
  end;

begin
  // Initialize
  Result := '0';
  S := Trim(AStub);

  // Convert alphanumeric characters to their numeric equivalents.
  for i := 1 to Length(S) do
   begin
     if System.SysUtils.TryStrToInt(S[i], j) then
        tmp := tmp + S[i]
     else if _Eval(S[i],C) and System.SysUtils.TryStrToInt(C, j) then
        tmp := tmp + C;
   end;

  // From left, add all odd positions
  b := True; // initial
  iSumOdd := 0; // initial
  for i := 1 to Length(tmp) do
   begin
     // skip this number?
     if not b then
        begin
          b := True;
          Continue;
        end;
     // convert character to integer
     if not System.SysUtils.TryStrToInt(tmp[i], j) then
        Exit;
     iSumOdd := iSumOdd + j;
     b := not b;
     j := 0;
   end;

  // From left, add all even positions and multiply by two (2)
  b := False; // initial
  iSumEven := 0; // initial
  for i := 1 to Length(tmp) do
   begin
     // skip this number?
     if not b then
        begin
          b := True;
          Continue;
        end;
     // convert character to integer
     if not System.SysUtils.TryStrToInt(tmp[i], j) then
        Exit;
     iSumEven := iSumEven + j;
     b := not b;
     j := 0;
   end;
   iSumEven := iSumEven * AMultiplier;

  // Add results (sum of even and odd)
  iTotal := iSumOdd + iSumEven;

  // Subtract result from next highest multiple of 10. For example, if our
  // sum value = 78, we get the "next highest multiple of 10" by first
  // rounding up to the nearest 10 and then adding 10.
  iTotal  := IQMS.Common.Numbers.RoundUp(iTotal, 10) - iTotal;
  if iTotal >= 10 then iTotal := 0;
  Result := IntToStr(iTotal);
end;

{ CompileList - assembles a list from an array.  Blank items are skipped.}
procedure CompileList(const AItems: array of String; var AList: TStringList);
var
   i: Integer;
begin
  if not Assigned(AList) then
     Exit;

  for i := 0 to High(AItems) do
   if AItems[i] > '' then
      AList.Add(UpperCase(Trim(AItems[i])));
end;

function FixHyphens(const S: String): String;
begin
  Result := S;
  if Pos('-',S) > 0 then
     Result := IQMS.Common.StringUtils.StrTran(S,'-', '-');
end;

function FixEPLStr(const S: String): String;
begin
  // Fix EPL string
  Result := S;
  Result := System.SysUtils.StringReplace(Result, '"', '\"',
   [rfReplaceAll, rfIgnoreCase]);
  Result := System.SysUtils.StringReplace(Result, '''', '',
   [rfReplaceAll, rfIgnoreCase]);
end;

{ TUPSPackages }

constructor TUPSPackages.Create(AOwner: TUPSShipmentLabels);
begin
  FOwner := AOwner;
  inherited Create;
end;

function TUPSPackages.Add(const ATrackingNumber: ShortString): TUPSPackageItem;
var
   AItem: Pointer;
   i: Integer;
begin
  i := Self.Count + 1;
  AItem := TUPSPackageItem.Create(FOwner, ATrackingNumber, i);
  TList(Self).Add(AItem);
  Result := AItem;
end;

{ TUPSBilling }

constructor TUPSBilling.Create(AOwner: TUPSPackageItem);
begin
  inherited Create(AOwner);
  FAccount := '';
  FCountryCode := '';
  FDescription := '';
  FLabelText := '';
  FPLDCode := '';
end;

procedure TUPSBilling.SetAccount(const Value: String);
begin
  FAccount := Value;
  UpdateLabelText;
end;

procedure TUPSBilling.SetBillingType(const Value: TUPSBillingOption);
begin
  FBillingType := Value;
  FDescription := UPSBillingOptionDescription[Value];
//  FPLDCode := UPSBillingPLDCode[Value];
  UpdateLabelText;
end;

procedure TUPSBilling.SetCountryCode(const Value: String);
begin
  FCountryCode := Value;
  UpdateLabelText;
end;

procedure TUPSBilling.UpdateLabelText;
begin
end;

{ TUPSShipmentLabels }

constructor TUPSShipmentLabels.Create(AOwner: TComponent);
begin
  FShpWtUOM := uwLBS;
  FShpWt := 0;
  FShpWtStr := '';
  inherited Create(AOwner);
  ShipmentDate := Date();
  FCreated := Now();
  FCreatedBy := 'IQSHIPMAN';
  FPrinterType := uptZebra;
  FPackages := TUPSPackages.Create(Self);
  FUPSSEDOptions := TUPSSEDOptions.Create(Self);
  FPrintLabel := True;
  FPrintTestPage := False;
  FTestPrint := False;
  FCarbonNeutral := False;
end;

destructor TUPSShipmentLabels.Destroy;
begin
  if Assigned(FPackages) then FreeAndNil(FPackages);
  if Assigned(FUPSSEDOptions) then FreeAndNil(FUPSSEDOptions);
  inherited Destroy;
end;

procedure TUPSShipmentLabels.Execute;
var
   i: Integer;
   bUOM: Boolean;
   tmpR: Real;
   o: TUPSPackageItem;
begin
  if PrinterName = '' then
     raise Exception.Create('Application Error: Label Printer name is required.');

  // Total Packages (package count)
  if BoxCount = 0 then Exit;

  // Validate the SED Options
  SEDOptions.Validate;

  // Get the batch ID for this printing
  FBatchID := IQMS.Common.Sequence.GetNextSequenceNumber('S_UPS_LABEL_BATCH');
  if (ShipFrom_CountryCode <> ShipTo_CountryCode) then
    CalcShipmentNo; // shipment number
  CalcShipperNo;  // shipper number
  CalcVendorCtrlNo; // vendor control number
  CalcShipmentWeight; // shipment weight, dim. wt., and uom

  // execute printing for each package
  DeleteFile(MaxiCodeFileName);
  for i := 0 to Packages.Count - 1 do
    begin
      TUPSPackageItem(Packages.Items[i]).Execute;
      // Append to MaxiCode file
      AppendToMaxiCodeFile(TUPSPackageItem(Packages.Items[i]).MaxiCodeFileName);
    end;
  ExecPrint;
end;

procedure TUPSShipmentLabels.CalcShipmentWeight;
var
   i: Integer;
   bUOM: Boolean;
   tmpR: Real;
   o: TUPSPackageItem;
begin
  { We need to assign shipment level values based on the packages.
    So, we cycle the packages, making the appropriate calcultions, etc.,
    and then fill properties which will then be printed on each label. }

  // Calculate the shipment weight, shipment dimensional weight, and
  //  shipment UOM.

  // Initialization - we empty the property variables
  FShpWt := 0;
  FShpDwt := 0;
  bUOM := False; // Shipment UOM assigned?

  // Cycle the packages, and get values
  for i := 0 to Packages.Count - 1 do
   begin
     o := TUPSPackageItem(Packages.Items[i]);
     // set shipment UOM if not already set
     if not bUOM then
        begin
          FShpWtUOM := o.WeightUOM;
          bUOM := True;
        end;
     // ensure all values are in the shipment UOM (shared method, see above).
     ConvertWeight(o.PackageWeight,
                   o.WeightUOM,
                   FShpWtUOM,
                   tmpR);
     // increment total weight
     FShpWt := FShpWt + tmpR;
     // increment total dimensional weight
     FShpDwt := FShpDwt + o.PackageDWT;
     o := NIL;
   end;

  // Apply results to the property variables
  // 1.) Dimensional weight string (this prints on the label)
  RoundToPoint5(FShpDwt,FShpDwt);
  FShpDwtStr := Format('%d %s',
   [Trunc(FShpDwt), UPSWeightUOM[FShpWtUOM]]);
  // 2.) Shipment weight string
  RoundToPoint5(FShpWt,FShpWt);
  FShpWtStr := Format('%.1f %s', [FShpWt, UPSWeightUOM[FShpWtUOM]]);

end;

procedure TUPSShipmentLabels.CalcShipmentNo;
var
   AFirstTrackingNo: ShortString;
begin
  if Packages.Count > 0 then
     AFirstTrackingNo := TUPSPackageItem(Packages.Items[0]).TrackingNo;
  FShpNo := CalculateShipmentNumber(AFirstTrackingNo);
end;

procedure TUPSShipmentLabels.CalcShipperNo;
var
   AFirstTrackingNo: ShortString;
begin
  if Packages.Count > 0 then
     AFirstTrackingNo := TUPSPackageItem(Packages.Items[0]).TrackingNo;
 FShipperNo := CalculateShipperNumber(AFirstTrackingNo);
end;

procedure TUPSShipmentLabels.CalcVendorCtrlNo;
begin
  FVendorControlNumber := Format('%s %s %s',
     [ups_httplink_const.SHIPPING_SOFTWARE_VERSION,
      PrinterName, // printer make and model
      RoutingCodeVersion]);
end;

procedure TUPSShipmentLabels.SetShipmentDate(const Value: TDateTime);
begin
  FShipmentDate := Value;
  FShipmentDateStr := UpperCase(FormatDateTime('dd mmm yyyy', Value));
end;

{procedure TUPSShipmentLabels.AssignPackageCarrierInfo(APackage: TUPSPackageItem);
begin
 if Assigned(APackage) then
    begin
      APackage.ShipFrom_Contact:= Self.ShipFrom_Contact;
      APackage.ShipFrom_Phone:= Self.ShipFrom_Phone;
      APackage.ShipFrom_Company:= Self.ShipFrom_Company;
      APackage.ShipFrom_Addr1:= Self.ShipFrom_Addr1;
      APackage.ShipFrom_Addr2:= Self.ShipFrom_Addr2;
      APackage.ShipFrom_Addr3:= Self.ShipFrom_Addr3;
      APackage.ShipFrom_City:= Self.ShipFrom_City;
      APackage.ShipFrom_State:= Self.ShipFrom_State;
      APackage.ShipFrom_Zip:= Self.ShipFrom_Zip;
      APackage.ShipFrom_Country:= Self.ShipFrom_Country;
      APackage.ShipFrom_CountryCode:= Self.ShipFrom_CountryCode;
      APackage.ShipTo_Contact:= Self.ShipTo_Contact;
      APackage.ShipTo_Phone:= Self.ShipTo_Phone;
      APackage.ShipTo_Company:= Self.ShipTo_Company;
      APackage.ShipTo_Addr1:= Self.ShipTo_Addr1;
      APackage.ShipTo_Addr2:= Self.ShipTo_Addr2;
      APackage.ShipTo_Addr3:= Self.ShipTo_Addr3;
      APackage.ShipTo_City:= Self.ShipTo_City;
      APackage.ShipTo_State:= Self.ShipTo_State;
      APackage.ShipTo_Zip:= Self.ShipTo_Zip;
      APackage.ShipTo_Country:= Self.ShipTo_Country;
      APackage.ShipTo_CountryCode:= Self.ShipTo_CountryCode;
      APackage.ShipTo_Country3DigitCode := Self.ShipTo_Country3DigitCode;
    end;
end;}

procedure TUPSShipmentLabels.ClearPackages;
begin
  Self.Packages.Clear;
end;

procedure TUPSShipmentLabels.Prepare;
begin
  FShpNo := '';
  FShpWt := 0;
  FShpWtStr := '';
  FShpWtUOM := TUPSWeightUOM(0);
  FShipmentDateStr := '';
  FShipmentDate :=  Now();
  FShpDwt := 0;
  FShpDwtStr :=  '';

  FShipFrom_Contact :=  '';
  FShipFrom_Company :=  '';
  FShipFrom_Phone :=  '';
  FShipFrom_Addr1 :=  '';
  FShipFrom_Addr2 :=  '';
  FShipFrom_Addr3 :=  '';
  FShipFrom_City :=  '';
  FShipFrom_State :=  '';
  FShipFrom_PostalCode :=  '';
  FShipFrom_Country :=  '';
  FShipFrom_CountryCode :=  '';

  FShipTo_Contact :=  '';
  FShipTo_Company :=  '';
  FShipTo_Phone :=  '';
  FShipTo_Addr1 :=  '';
  FShipTo_Addr2 :=  '';
  FShipTo_Addr3 :=  '';
  FShipTo_City :=  '';
  FShipTo_State :=  '';
  FShipTo_PostalCode :=  '';
  FShipTo_Country :=  '';
  FShipTo_CountryCode :=  '';
  FShipTo_Country3DigitCode :=  '';

  FRoutingCode :=  '';
  FVendorControlNumber :=  '';
  FDocumentsOnly :=  False;
  FRoutingCodeVersion :=  '';
  FCreatedBy :=  '';
  FCreated :=  Now();
  FShipperNo :=  '';
  FReturnService :=  False;
  FImportControl := False;
  FPickupAttempts := 0;
  FPrintDestination :=  TUPSPrintDestination(0);
  FPrinterName :=  '';
  FPrinterType := uptZebra;
  FMailerID := '';
  FRFA := False;

  Self.Packages.Clear;
end;

function TUPSShipmentLabels.GetBoxCount: Integer;
begin
  Result := 0;
  if Assigned(Packages) then
     Result := Packages.Count;
end;

procedure TUPSShipmentLabels.AppendToMaxiCodeFile(const AFileName: String);
var
   fs_mstr, fs_app: TFileStream;
   S: String;
begin
  // This method takes a file generated by a package MaxiCode (AFileName)
  // and appends it to the larger file represented by FMaxiCodeFileName.
  // Ensure the input.dat file from the package MaxiCode exists
  if (MaxiCodeFileName > '') and (AFileName > '') and FileExists(AFileName) then
  try
     // Create objects
     if not FileExists(FMaxiCodeFileName) then
        fs_mstr := TFileStream.Create(FMaxiCodeFileName, fmCreate)
     else
        fs_mstr := TFileStream.Create(FMaxiCodeFileName, fmOpenReadWrite);
     fs_app := TFileStream.Create(AFileName, fmOpenRead);
     // Move to start of file
     fs_mstr.Seek(0, soFromEnd);
     // Append file to the end of the master file
     fs_mstr.CopyFrom(fs_app, 0);
     // Add a blank line at the end
     S := #13#10;
     fs_mstr.WriteBuffer(Pointer(S)^, Length(S));
  finally
     // Free objects
     if Assigned(fs_mstr) then FreeAndNil(fs_mstr);
     if Assigned(fs_app) then FreeAndNil(fs_app);
  end;
end;

procedure TUPSShipmentLabels.ExecPrint;
var
   ALines: TStringList;
   dir, fn, AControlNumber, ADisplayName: String;
   a: TStringList;
   APrinterIndex, i: Integer;
begin
  APrinterIndex := Printer.PrinterIndex;
  try
    { TODO -ombaral -cWebIQ : Need to resolve dependency
    if (not IQSetPrinter(FPrinterName)) then
       raise Exception.CreateFmt( 'Could not find printer %s', [ FPrinterName ]);;
    }

     i := RPos('\', FPrinterName);
     if i > 0 then
        ADisplayName := Trim(Copy(FPrinterName, i+1, Length(FPrinterName)))
     else
        ADisplayName := Trim(FPrinterName);
    if (FPrintLabel) then
      begin
        a := TStringList.Create;
        a.Add(IQFormat('({V_UPS_PACKAGES.Source_ID} = %f AND', [SourceID]));
        a.Add(IQFormat('{V_UPS_PACKAGES.Source} = ''%s'')', [Source]));
        AControlNumber := SelectValueAsString('select shipman.get_ups_control_number from dual');
        AControlNumber := Copy(AControlNumber, 1, 13) + IQMS.Common.StringUtils.PadR(ADisplayName, 13) + ' ' + Copy(AControlNumber, 28, 13);
        if (WorldEase) then
          PrintDefaultReportExF(GetReportFileName(rptUpsWELabel,CarrierID), a, 1, false, AControlNumber)
        else if (FRFA) then
          PrintDefaultReportExF(GetReportFileName(rptUpsRFALabel,CarrierID), a, 1, false, AControlNumber)
        else if (PrintExtDocLabel) then
          PrintDefaultReportExF(GetReportFileName(rptUpsExtDoc,CarrierID), a, 1, false, AControlNumber)
        else
          PrintDefaultReportExF(GetReportFileName(rptUpsLabel,CarrierID), a, 1, false, AControlNumber);
        if (PrintConsigneeLabel) then
          PrintDefaultReportExF(GetReportFileName(rptUpsConsignee,CarrierID), a, 1, false, AControlNumber);
      end;

    if FTestPrint then
      Exit;

    ExecuteCommandFmt('update shipment_invoice set paperless = ''%s'', paperless_nafta = ''%s'' where source_id = %.0f and source = ''%s''', [IQMS.Common.Boolean.BoolToYN(FPrintPaperless and not WorldEase), IQMS.Common.Boolean.BoolToYN(FPrintPaperlessNafta and not WorldEase), SourceID, Source]);
    if (FPrintPaperless and not WorldEase) then
      begin

        with TPDF417.Create(Self, SourceID, Source, EPlantID, CarrierID, True, False, False) do
          Execute;
        a := TStringList.Create;
        a.Add(IQFormat('({V_UPS_PAPERLESS.SOURCE_ID} = %f AND', [SourceID]));
        a.Add(IQFormat('{V_UPS_PAPERLESS.SOURCE} = ''%s'')', [Source]));
        PrintDefaultReportExF(GetReportFileName(rptUpsPaperless,CarrierID), a, 1, false, AControlNumber);
      end;
    { TODO -ombaral -cWebIQ : Need to resolve dependency
    if (not IQSetPrinter(FReportPrinterName)) then
       raise Exception.CreateFmt( 'Could not find printer %s', [ FReportPrinterName ]);;
//   }

    SetPrinterAsCurrent(FReportPrinterName);
    if (FInvoice and not WorldEase) then
      begin
        a := TStringList.Create;
        a.Add(IQFormat('({V_UPS_INVOICE.SOURCE_ID} = %f AND', [SourceID]));
        a.Add(IQFormat('{V_UPS_INVOICE.SOURCE} = ''%s'')', [Source]));
        for i := 1 to FInvoiceCopies do
          PrintDefaultReportExA(GetReportFileName(rptUpsCommercInvc,CarrierID), a, 1, false);
      end;
    if (FPrintSED) then
      begin
        a := TStringList.Create;
        a.Add(IQFormat('({V_UPS_SED.SOURCE_ID} = %f AND', [SourceID]));
        a.Add(IQFormat('{V_UPS_SED.SOURCE} = ''%s'')', [Source]));
        for i := 1 to FSEDCopies do
          PrintDefaultReportExA(GetReportFileName(rptUpsSed,CarrierID), a, 1, false);
      end;
    if (FPrintCO) then
      if (IQMS.Common.StringUtils.StrInList(FShipTo_CountryCode, ['CA','MX'])) then
        begin
            a := TStringList.Create;
            a.Add(IQFormat('({V_UPS_NAFTA.SOURCE_ID} = %f AND', [SourceID]));
            a.Add(IQFormat('{V_UPS_NAFTA.SOURCE} = ''%s'')', [Source]));
            for i := 1 to FCOCopies do
              PrintDefaultReportExA(GetReportFileName(rptUpsNafta,CarrierID), a, 1, false);
        end
      else
        begin
          a := TStringList.Create;
          a.Add(IQFormat('({V_UPS_CO.SOURCE_ID} = %f AND', [SourceID]));
          a.Add(IQFormat('{V_UPS_CO.SOURCE} = ''%s'')', [Source]));
          for i := 1 to FCOCopies do
            PrintDefaultReportExA(GetReportFileName(rptUpsCertOrigin,CarrierID), a, 1, false);
        end;
    if not (udoPOA in FDocumentOptions) then
      if ((udoSED in FDocumentOptions) or (udoCO in FDocumentOptions)) then
        begin
          a := TStringList.Create;
          PrintDefaultReportExA(GetReportFileName(rptUpsPOA,CarrierID), a, 1, false);
        end;
    if (FReturnsExchange) then
      begin
        a := TStringList.Create;
        a.Add(IQFormat('({V_UPS_PACKAGES.Source_ID} = %f AND', [SourceID]));
        a.Add(IQFormat('{V_UPS_PACKAGES.Source} = ''%s'')', [Source]));
        PrintDefaultReportExA(GetReportFileName(rptUpsExchReceipt,CarrierID), a, 1, false);
      end;

  finally
    Printer.PrinterIndex := APrinterIndex;
  end;
end;

{ TUPSPackageItem }

constructor TUPSPackageItem.Create(AOwner: TUPSShipmentLabels;
 ATrackingNo: ShortString; ABoxNo: Integer);
begin
  FOwner := AOwner;
  inherited Create(AOwner);
  TrackingNo := ATrackingNo;
  FBoxNo := ABoxNo;

  // Initialization
  FBilling := TUPSBilling.Create(Self);
  FInternational := False;
  FAdditionalHandling := False;
  FLargePackage := False;
  FDimUOM := udIN;
  FWeightUOM := uwLBS;
  FUPSService := TUPSService(0);
  FPackaging := upkUnkown;
  //FBillingOption := uboUnknown;
  FDeliveryConfirmation := False;
  FSignatureOption := TUPSSignatureOption(0);
  FDocumentsOnly := False;
  FCOD := False;
  FCODAmount := 0;
  FDocumentIndicator := uriNone;
  FDocIndicator := '';
  FPackageSeqNo := '';
  FPicNo := '';
  FMailerID := '';
end;

destructor TUPSPackageItem.Destroy;
begin
  if Assigned(FBilling) then FreeAndNil(FBilling);
  inherited Destroy;
end;

procedure TUPSPackageItem.Execute;
begin
  AssignValuesFromOwner;
  AdjustParams;
  Validate;

  {"Note: U.S.-to-Puerto Rico movements follow domestic
   content. Puerto Rico-to-U.S. movements follow
   international content" (Guide to Labelling, 11)}
  if (FShipFrom_CountryCode = 'US') and (FShipTo_CountryCode = 'US') then
     begin
       FInternational := False;
       FSignatureOptionStr := UPSSignatureCode_USA[FSignatureOption];
     end
  else if (FShipFrom_CountryCode = 'US') and (FShipTo_CountryCode = 'PR') then
     begin
       FInternational := True;
       FSignatureOptionStr := UPSSignatureCode_USA[FSignatureOption];
     end
  else if (FShipFrom_CountryCode = 'PR') and (FShipTo_CountryCode = 'US') then
     begin
       FInternational := False;
       FSignatureOptionStr := UPSSignatureCode_USA[FSignatureOption];
     end
  else if (FShipFrom_CountryCode <> 'US') and (FShipTo_CountryCode = 'US')  then
     begin
       FInternational := True;
       FSignatureOptionStr := UPSSignatureCode_USA[FSignatureOption];
     end
  else if (FShipFrom_CountryCode = 'CA') and (FShipTo_CountryCode = 'CA') then
     begin
       FInternational := True;
       FSignatureOptionStr := UPSSignatureCode_Canada[FSignatureOption];
     end
  else
     begin
       FInternational := (FShipFrom_CountryCode <> FShipTo_CountryCode);
       FSignatureOptionStr := UPSSignatureCode_Foreign[FSignatureOption];
     end;

  CalcPkgWt; // return the package weight string (e.g., '5 LBS')
  CalcLargePkg; // determine if this is a large package
  CalcPkgAH; // calculate additional handling
  if (Packaging <> upkLetter) then
    CalcDimWt; // get dimensional weight
  CalcPkgCnt; // get the package count string (e.g., '1 of 5');
  CalcLPAHIndicator;
  //FBillingOptionStr := UPSBillingLabelText[FBillingOption];
  CalcPostalBarCode;
  CalcMaxiCode;
  if (FOwner.WorldEase) then
    CalcWorldEaseMaxiCode;
  CreateMaxiCodeImage;
  CreatePostalCodeImage;
  CreateTrackingNumberImage;
  CalcDocInd;
  CalcDocOptions;
  CalcLabelName;

  if FRFA then
    begin
      FPackageSeqNo := SelectValueFmtAsString('select value from shipment_package_option where code = ''ReturnServicesSeqNo'''#13 +
        ' and shipment_packages_id = %.0f', [FID]);
      if (FPackageSeqNo = '') then
      begin
        FPackageSeqNo := Format('%8.0f', [IQMS.Common.Sequence.GetNextSequenceNumber('S_UPS_PICNO')]);
        ExecuteCommandFmt('update shipment_package_option set value = ''%s'' where code = ''ReturnServicesSeqNo'''#13 +
          ' and shipment_packages_id = %.0f', [FPackageSeqNo, FID]);
      end;
      FPicNo := FMailerID + '582' + FPackageSeqNo;
      FPicNo := FPicNo + GetCheckDigit('092023' + FPicNo, 3);
      FDocumentOptionsStr :=  MaskUtils.FormatMaskText('000 0000 0000 0000 0000 00;0', FPicNo);
      CreateUSPSImage;
    end;

  PopulatePackageRecord;
  ExecPrint;
end;

procedure TUPSPackageItem.Validate;
begin
  // Check for required values
  IQMS.Common.Miscellaneous.IQAssert(FPackageActualWeight > 0, 'Package weight must be provided.');
  IQMS.Common.Miscellaneous.IQAssert(Trunc(FPackageActualWeight) < 999, 'Package weight exceeds allowable limit.');

{  if (Packaging <> upkLetter) then
  begin
    IQMS.Common.Miscellaneous.IQAssert(PackageLength > 0, 'Package length must be provided.');
    IQMS.Common.Miscellaneous.IQAssert(PackageWidth > 0,  'Package width must be provided.');
    IQMS.Common.Miscellaneous.IQAssert(PackageHeight > 0,  'Package depth must be provided.');
  end;  }

  IQMS.Common.Miscellaneous.IQAssert(FShipFrom_CountryCode > '', 'Ship From country code must be provided.');
  IQMS.Common.Miscellaneous.IQAssert(FShipTo_CountryCode > '', 'Ship To country code must be provided.');

end;

procedure TUPSPackageItem.AssignValuesFromOwner;
var
   ABatchID: Real;
   i: Integer;
   bUOM: Boolean;
   tmpR: Real;
begin
  { *** Assign Shipment Values to Package ***

    FOwner is of type TUPSShipmentLabels.  We assign "shipment" level values
    to the package in this method. }

  // Ensure owner (TUPSShipmentLabels) exists
  if FOwner = NIL then Exit;

  Self.FBatchID := FOwner.BatchID;
  Self.FAccountNo := FOwner.AccountNo;
  Self.FPrintDestination := FOwner.PrintDestination;
  Self.FPrinterName := FOwner.PrinterName;
  Self.FReportPrinterName := FOwner.ReportPrinterName;
  Self.FPrinterType := FOwner.PrinterType;
  Self.FCreated := FOwner.Created;
  Self.FCreatedBy := FOwner.CreatedBy;
  Self.FBoxCount := FOwner.BoxCount;
  Self.FShipFrom_Contact:= FOwner.ShipFrom_Contact;
  Self.FShipFrom_Phone:= FOwner.ShipFrom_Phone;
  Self.FShipFrom_Company:= FOwner.ShipFrom_Company;
  Self.FShipFrom_Addr1:= FOwner.ShipFrom_Addr1;
  Self.FShipFrom_Addr2:= FOwner.ShipFrom_Addr2;
  Self.FShipFrom_Addr3:= FOwner.ShipFrom_Addr3;
  Self.FShipFrom_City:= FOwner.ShipFrom_City;
  Self.FShipFrom_State:= FOwner.ShipFrom_State;
  Self.FShipFrom_PostalCode:= FOwner.ShipFrom_Zip;
  Self.FShipFrom_Country:= FOwner.ShipFrom_Country;
  Self.FShipFrom_CountryCode:= FOwner.ShipFrom_CountryCode;
  Self.FShipTo_Contact:= FOwner.ShipTo_Contact;
  Self.FShipTo_Phone:= FOwner.ShipTo_Phone;
  Self.FShipTo_Company:= FOwner.ShipTo_Company;
  Self.FShipTo_Addr1:= FOwner.ShipTo_Addr1;
  Self.FShipTo_Addr2:= FOwner.ShipTo_Addr2;
  Self.FShipTo_Addr3:= FOwner.ShipTo_Addr3;
  Self.FShipTo_City:= FOwner.ShipTo_City;
  Self.FShipTo_State:= FOwner.ShipTo_State;
  Self.FShipTo_PostalCode:= FOwner.ShipTo_Zip;
  Self.FShipTo_Country:= FOwner.ShipTo_Country;
  Self.FShipTo_CountryCode:= FOwner.ShipTo_CountryCode;
  Self.FShipTo_Country3DigitCode := FOwner.ShipTo_Country3DigitCode;
  Self.FShipmentWeight := FOwner.ShipmentWeightStr;
  Self.FShpNo := FOwner.ShipmentNumber;
  Self.FShipperNo := FOwner.ShipperNumber;
  Self.FShpDate   := FOwner.ShipmentDateStr;
  Self.FShpDateDate := FOwner.FShipmentDate;
  Self.FShpDwtStr := FOwner.ShipmentDWTStr;
  Self.FRoutingCode    := FOwner.RoutingCode;
  Self.FRoutingCodeVersion := FOwner.RoutingCodeVersion;
  Self.FVendorControlNumber := FOwner.VendorControlNumber;
  Self.FDocumentsOnly := FOwner.DocumentsOnly;
  Self.FDocumentOptions := FOwner.DocumentOptions;
  Self.FInvoice := FOwner.Invoice;
  Self.FInvoicePaperless := FOwner.InvoicePaperless;
  Self.FInvoicePaperlessNafta := FOwner.InvoicePaperlessNafta;
  Self.FInvoicePaperlessOtherDoc := FOwner.InvoicePaperlessIncludesOther;
  Self.FReturnService := FOwner.ReturnService;
  Self.FImportControl := FOwner.ImportControl;
  Self.FPickupAttempts := FOwner.PickupAttempts;
//  Self.FExchangeCollect := FOwner.ExchangeCollect;
  Self.FPrintDestination := FOwner.PrintDestination;
  Self.FLabelFileName := FOwner.LabelFileName;
  Self.FProactiveResponse := FOwner.FProactiveResponse;
  Self.FPrintLabel := FOwner.FPrintLabel;
  Self.FPrintTestPage := FOwner.FPrintTestPage;
  Self.FAddressValidated := FOwner.FAddressValidated;
  Self.FRFA := FOwner.FRFA;
  Self.FMailerID := FOwner.FMailerID;

end;

procedure TUPSPackageItem.AdjustParams;

  function _ev(const S: String): String;
  const
    VALID_CHAR = ['a'..'z','A'..'Z','0'..'9',' ','-'];
  var
     i: Integer;
  begin
    Result := '';
    for i := 1 to Length(S) do
     if S[i] in VALID_CHAR then
        Result := Result + S[i];
    Result := UpperCase(Result);
  end;

begin
  FShipFrom_Contact := _ev(FShipFrom_Contact);
  FShipFrom_Phone := _ev(FShipFrom_Phone);
  FShipFrom_Company := _ev(FShipFrom_Company);
  FShipFrom_Addr1 := _ev(FShipFrom_Addr1);
  FShipFrom_Addr2 := _ev(FShipFrom_Addr2);
  FShipFrom_Addr3 := _ev(FShipFrom_Addr3);
  FShipFrom_City := _ev(FShipFrom_City);
  FShipFrom_State := _ev(FShipFrom_State);
  FShipFrom_PostalCode := _ev(FShipFrom_PostalCode);
  FShipFrom_Country := _ev(FShipFrom_Country);

  FShipTo_Contact := _ev(FShipTo_Contact);
  FShipTo_Phone := _ev(FShipTo_Phone);
  FShipTo_Company := _ev(FShipTo_Company);
  FShipTo_Addr1 := _ev(FShipTo_Addr1);
  FShipTo_Addr2 := _ev(FShipTo_Addr2);
  FShipTo_Addr3 := _ev(FShipTo_Addr3);
  FShipTo_City := _ev(FShipTo_City);
  FShipTo_State := _ev(FShipTo_State);
  FShipTo_PostalCode := _ev(FShipTo_PostalCode);
  FShipTo_Country := _ev(FShipTo_Country);

  FRoutingCode := UpperCase(FRoutingCode);
  FRoutingCodeVersion := UpperCase(FRoutingCodeVersion);

  FPkgWtStr := UpperCase(FPkgWtStr);
  FPkgDwtStr := UpperCase(FPkgDwtStr);

  FServiceNote := _ev(FServiceNote);
  //FBillingOptionStr := _ev(FBillingOptionStr);
  //FBillingInstructions := _ev(FBillingInstructions);

end;

procedure TUPSPackageItem.CalcPkgWt;
begin
  // Adjust package weight and UOM
  RoundToPoint5(FPackageActualWeight,FPackageActualWeight);

  // default package weight string (e.g., '2.5 LBS');
  if Frac(FPackageActualWeight) > 0 then
     FPkgWtStr := Format('%.1f %s', [FPackageActualWeight,
       UPSWeightUOM[FWeightUOM]])
  else
     FPkgWtStr := Format('%d %s', [Trunc(FPackageActualWeight),
       UPSWeightUOM[FWeightUOM]]);

  // Special conditions
  case FPackaging of
   upkUPS25KGbox:
    if (FWeightUOM = uwKG) and
       (FPackageActualWeight <= 25) then
       FPkgWtStr := '25 KG BOX';
   upkUPS10KGbox:
    if (FWeightUOM = uwKG) and
       (FPackageActualWeight <= 10) then
       FPkgWtStr := '10 KG BOX';
   upkLetter:
      FPkgWtStr := 'LTR';
   upkEnvelope:
      FPkgWtStr := 'ENV';
  end; // end case

end;

function TUPSPackageItem.GetPkgDwt: Real;
begin
  if (Packaging <> upkLetter) then
    CalcDimWt;
  Result := FPkgDwt;

end;

procedure TUPSPackageItem.CalcDimWt;
begin
     if (FPackaging in [upkUPS25KGbox, upkUPS10KGbox]) then
        FPkgDwtStr := ''
     else
     if ((FShipTo_CountryCode = 'US') and ((FShipFrom_CountryCode = 'US') or (FShipFrom_CountryCode = 'PR'))) then
         if (FLargePackage or (FPkgDwt > FPackageActualWeight)) then
             FPkgDwtStr := Format('%d,%d,%d',
                 [Trunc(FLength),Trunc(FWidth),Trunc(FHeight)])
         else
             FPkgDwtStr := ''
     else
      begin
//        RoundToPoint5(FPkgDwt,FPkgDwt);
//        FPkgDwt := Round(FPkgDwt);

        // default package weight string (e.g., '2.5 LBS');
        if Frac(FPkgDwt) > 0 then
          FPkgDwtStr := Format('%.0f %s', [FPkgDwt,UPSWeightUOM[FWeightUOM]])
        else
           FPkgDwtStr := Format('%d %s', [Trunc(FPkgDwt), UPSWeightUOM[FWeightUOM]]);
      end;

     FBillableWeight := Max(FPkgDwt, FPackageActualWeight);
     if FLargePackage then
        FBillableWeight := Max(FBillableWeight, 90);
end;

procedure TUPSPackageItem.CalcLargePkg;
begin
  FLargePackage := ups_httplink_utils.IsLargePackage(Trunc(PackageLength),
    Trunc(PackageWidth), Trunc(PackageHeight), FDimUOM);
end;

procedure TUPSPackageItem.CalcPkgAH;
begin
  // exit early if we are already assessing additional handling
  if FAdditionalHandling then Exit;
  FAdditionalHandling := ups_httplink_utils.AdditionalHandlingRequired
   (Trunc(PackageLength), Trunc(PackageWidth), Trunc(PackageHeight),
    FDimUOM, FPackageActualWeight, UPS_ServiceCode[FUPSService]);
  if FAdditionalHandling then
     FAdditionalHandlingCharge := ups_httplink_rates.ADDITIONAL_HANDLING_CHARGE;
end;

procedure TUPSPackageItem.CalcPkgCnt;
begin
  // String used for the package count
  // * do not localize
  if (FBoxCount > 0) then
     FPkgCntStr := Format('%d OF %d',
       [FBoxNo, FBoxCount])
  else
     FPkgCntStr := Format('%d OF __',
       [FBoxNo]);
end;

procedure TUPSPackageItem.CalcLPAHIndicator;
begin
  // Returns the "large package"/"additional handling" code
  FLP_AH_Indicator := '';

  if FLargePackage then
     FLP_AH_Indicator := 'LP';

  if not FLargePackage and FAdditionalHandling then
     FLP_AH_Indicator := 'AH';

  FLP_AH_Indicator := FLP_AH_Indicator;

end;

procedure TUPSPackageItem.CalcPostalBarCode;
begin
  // Ideally, the postal code will also include the +4 digits.
  // Example: 420300768845
  if not FInternational then
     FPostalBarCode := Format('420%s',[FShipTo_PostalCode])
  else
     FPostalBarCode := Format('421%s%s',[FShipTo_Country3DigitCode, FShipTo_PostalCode]);
  // No spaces, parentheses or dashes should be encoded into the bar code
  FPostalBarCode := IQMS.Common.StringUtils.AlphaNumeric(FPostalBarCode);

  {"Note: U.S.-to-Puerto Rico movements follow domestic
   content. Puerto Rico-to-U.S. movements follow
   international content" (Guide to Labelling, 11)}
end;

procedure TUPSPackageItem.CalcRoutingInstruction;
begin
  {"When shipping internationally, documentation indicators are required for
  proper shipment processing. These indicators will print right-justified
  in the Additional Routing Instructions Block immediately below the
  highlight bar of the Tracking Number Bar Code Block." (UPS Guide to Labeling,
  page 33).}

  if not International then Exit;

end;

procedure TUPSPackageItem.CalcDocInd;
//var
//   docind: TUPSDocumentIndicator;
begin
  // Initial
  FDocumentIndicator := uriNone;
  FDocIndicator := '';

  // Document indicators are only for International shipments
  if not International then Exit;

  (* International Document Indicators *
    - Domestic labels do not use document indicators.
      Only international labels have document indicators.
    - For international shipments, a paperless invoice is always
      required for merchandise (not documents only).

    "When shipping internationally, documentation indicators are required for
     proper shipment processing. These indicators will print right-justified
     in the Additional Routing Instructions Block immediately below the
     highlight bar of the Tracking Number Bar Code Block." (UPS Guide to
     Labeling, page 33).*)

  // standard international indicators
  if FOwner.WorldEase then
    FDocumentIndicator := uriWorldEase
  else if FDocumentsOnly then
     FDocumentIndicator := uriDocumentsOnly
  else if FInvoice then
     begin
       FDocumentIndicator := uriInvoice;
       if FInvoicePaperless then
          begin
            FDocumentIndicator := uriPaperlessInvoice;
            if FInvoicePaperlessOtherDoc then
               FDocumentIndicator := uriPaperlessInvoicePlus;
          end;
     end
  else if not FInvoice then
     FDocumentIndicator := uriNoInvoice;



  // For Return Service, take the indicator up one level (see the sequence
  // of the enumerated type TUPSDocumentIndicator in ups_httplink_typelib.pas).
  if (FReturnService or FImportControl) and (FDocumentIndicator <> uriNone) then
     FDocumentIndicator := TUPSDocumentIndicator(Ord(FDocumentIndicator)+1);

  // Populate the text that will display on the label
  FDocIndicator := UPSDocumentIndicator[FDocumentIndicator];

{
The following two indicators are only for goods
shipped within the EU or from the EU to the rest
of the world. The font size is 15 pt, bold.

Shipping System Generates Invoice
for EU Goods Not in Free
Circulation = INV/T1/RS

Shipping System Does Not Generate
Invoice for EU Goods Not in Free
Circulation = KEY/T1/RS}
end;

procedure TUPSPackageItem.CalcDocOptions;

   procedure _ad(S: String);
   begin
     if FDocumentOptionsStr = '' then
        FDocumentOptionsStr := S
     else
        FDocumentOptionsStr := FDocumentOptionsStr + '/' + S;
   end;

begin
  FDocumentOptionsStr := '';

  if not Self.FInvoice then Exit;

  // Do not set options if we have no document indicator
  if FDocumentIndicator = uriNone then Exit;

  if (udoPOA in FDocumentOptions) then
     _ad('POA');
  if (udoSED in FDocumentOptions) then
     _ad('SED');
  if (udoCO in FDocumentOptions) then
     _ad('CO');
  if (FISC) then
    _ad('ISC');
end;

procedure TUPSPackageItem.SetCOD(const Value: Boolean);
begin
  FCOD := Value;
  FCODIndicator := '';
  if FCOD then
     FCODIndicator := 'COD';
end;

procedure TUPSPackageItem.SetCODAmount(const Value: Real);
begin
  FCODAmount := Value;
end;

procedure TUPSPackageItem.ExecPrint;
var
   ALines: TStringList;
   dir, fn: String;
   a: TStringList;
   APrinterIndex: Integer;
begin
  APrinterIndex := Printer.PrinterIndex;
  try
//     if (FPrintLabel) then
//      begin
//        a := TStringList.Create;
//        a.Add(IQFormat('{V_UPS_PACKAGES.ID} = %f', [FID]));
//        SetPrinterAsCurrent(FPrinterName);
//        PrintDefaultReportExA(GetReportFileName(rptUpsLabel,CarrierID), a, 1, false);
//      end;

    if (FPrintTestPage) then
      begin
        a := TStringList.Create;
        a.Add(IQFormat('{SHIPMENT_PACKAGES.ID} = %f', [FID]));
        SetPrinterAsCurrent(FReportPrinterName);
        PrintDefaultReportExA('ups_label_submit.rpt', a, 1, false);
      end;
  finally
    Printer.PrinterIndex := APrinterIndex;
  end;
//  PrintDefaultReportExC('TestMaxicode.rpt', a, self, SetDestinationToScreen);

//  try
//     ALines := TStringList.Create;
//     case FPrinterType of
//      uptEltron: GetLabelLines_EPL(ALines);
//      uptZebra: GetLabelLines_ZPL(ALines);
//      uptUniMark: ;
//     end;
//
//     case FPrintDestination of
//      updTextFile:
//       begin
//         if FLabelFileName > '' then
//            ALines.SaveToFile(FLabelFileName);
//       end
//     else
//       prn_share.PrintBinary(ALines,Format('UPS Label - %s, %s',
//        [UPS_ServiceCodeDescrip[FUPSService], FTrackingNo]),FPrinterName);
//     end; // end case
//  finally
//     if Assigned(ALines) then FreeAndNil(ALines);
//  end;
end;

procedure TUPSPackageItem.GetSenderAddressLines(var ALines: TStringList);
//var
 //  o: TAddressFormatter;
begin
  if not Assigned(ALines) then
     Exit;
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  try
     o := TAddressFormatter.Create(NIL);
     o.ContactName := FShipFrom_Contact;
     //o.ContactTitle := FShipFrom_Phone;
     o.Company := FShipFrom_Company;
     o.Address1 := FShipFrom_Addr1;
     o.Address2 := FShipFrom_Addr2;
     o.City :=  FShipFrom_City;
     o.StateRegionOrProvince := FShipFrom_State;
     o.PostalCode := FShipFrom_PostalCode;
     o.CountryCode := Self.FShipFrom_CountryCode;
     o.AllCaps := True;
     o.IncludeCountry := False; // this may change (?)
     o.Execute;
     ALines.Text := o.Formatted.Text;
  finally
     if Assigned(o) then FreeAndNil(o);
  end;
  }
end;


procedure TUPSPackageItem.GetRecipientAddressLines(var ALines: TStringList);
//var
   //o: TAddressFormatter;
begin
  if not Assigned(ALines) then
     Exit;
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  try
     o := TAddressFormatter.Create(NIL);
     o.ContactName := FShipTo_Contact;
     o.Company := FShipTo_Company;
     o.Address1 := FShipTo_Addr1;
     o.Address2 := FShipTo_Addr2;
     o.City :=  FShipTo_City;
     o.StateRegionOrProvince := FShipTo_State;
     o.PostalCode := FShipTo_PostalCode;
     o.CountryCode := Self.FShipTo_CountryCode;
     o.AllCaps := True;
     o.Execute;
     ALines.Text := o.Formatted.Text;
  finally
     if Assigned(o) then FreeAndNil(o);
  end;
  }
end;

procedure TUPSPackageItem.GetLabelLines_EPL(var ALines: TStringList);
var
   i, x, y, z: Integer;
   sl, ref: TStringList;
   tmp: String;
   bPrnWarsawLabel: Boolean; // must print a separate label containing the Warsaw Agreement

   procedure _chkOverflowAdd(const S: String; const AMax: Integer = 4);
   begin
     if sl.Count >= AMax then
        ref.Add(S)
     else
        sl.Add(S);
   end;

begin
  // This method generates the text for a EPL label. The text is then
  // sent to the printer.

  // Validation
  if not Assigned(ALines) then Exit;
  // Initialization
  bPrnWarsawLabel := False;

  try
     // This temporary string list is used to build address lines, and
     // detail lines based on available information.  After building the
     // list, we add lines to the label.
     sl := TStringList.Create;
     ref := TStringList.Create;

     ALines.Clear;
     // Header
     ALines.Add('N');
     ALines.Add('Q1219,24');
     ALines.Add('R15,0');
     ALines.Add('S3');
     ALines.Add('D11');
     ALines.Add('ZB');
     ALines.Add('I8,1');

     // Sender Address Block
     //tmp := IQMS.Common.AddressFormat.GetFormattedCityStatePostalCode(FShipFrom_CountryCode,
     // FShipFrom_City, FShipFrom_State, FShipFrom_PostalCode);
     // tmp := ConcatCityStateZip
     //               (FShipFrom_City,
     //                IQMS.Common.StringUtils.LeftStr(FShipFrom_State,2),
     //                IQMS.Common.StringUtils.LeftStr(FShipFrom_PostalCode,16));
     sl.Clear;
     GetSenderAddressLines(sl);
     // CompileList([IQMS.Common.StringUtils.LeftStr(FShipFrom_Contact, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Phone, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Company, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr1, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr2, 35),
     //              tmp,
     //              IQMS.Common.Numbers.sIIf(International, IQMS.Common.StringUtils.LeftStr(FShipFrom_Country, 35),'')],
     //              sl);

     y := 21;
     for i := 0 to sl.Count - 1 do
       begin
         ALines.Add(Format('A20,%d,0,2,1,1,N,"%s"',
          [y, FixHyphens(sl.Strings[i])]));
         y := y + 24; // advanced the vertical position
       end;

     // Package weight and count
     ALines.Add(Format('A440,18,0,1,2,3,N,"%s"',[FPkgWtStr]));
     //x := 772 - (Length(FPkgCntStr)*12);
     x := 660 - Length(FPkgCntStr);
     ALines.Add(Format('A%d,24,0,4,1,1,N,"%s"',[x, FPkgCntStr]));

     // Shipment Information
     if FCOD then
        ALines.Add('A440,69,0,3,2,3,N,"COD"')
     else if FReturnService then
        ALines.Add('A440,69,0,3,2,3,N,"RS"')
     else
        begin
          // 'A20,%d,0,2,1,1,N,"%s"'
          ALines.Add(Format('A440,69,0,2,1,1,N,"SHP#: %s"',[FShpNo]));
          ALines.Add(Format('A440,93,0,2,1,1,N,"SHP WT: %s"',[FShipmentWeight]));
          ALines.Add(Format('A440,117,0,2,1,1,N,"SHP DWT: %s"',[FShpDwtStr]));
          ALines.Add(Format('A440,141,0,2,1,1,N,"DATE: %s"',[FShpDate]));
          ALines.Add(Format('A440,165,0,2,1,1,N,"%s"',[FLP_AH_Indicator]));
        end;

     ALines.Add('A20,199,0,4,1,1,N,"SHIP"');
     ALines.Add('A20,227,0,4,1,1,N," TO:"');

     // Proactive Response
     if FProactiveResponse then
        ALines.Add('A660,165,0,3,2,3,N,"PRO"');

     // Recipient Address Block
     tmp := IQMS.Common.AddressFormat.GetFormattedCityStatePostalCode(FShipTo_CountryCode,
      FShipTo_City, FShipTo_State, FShipTo_PostalCode);
     sl.Clear;
     //GetRecipientAddressLines(sl);
     CompileList([IQMS.Common.StringUtils.LeftStr(FShipTo_Contact,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Phone,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Company,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Addr1,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Addr2,39)],
                  sl);
     y := 199;
     for i := 0 to sl.Count - 1 do
       begin
         ALines.Add(Format('A122,%d,0,4,1,1,N,"%s"',[y, FixHyphens(sl.Strings[i])]));
         y := y + 28; // advanced the vertical position
       end;

     y := y + 6;

     // Bold Postal Code
     if tmp > '' then
        begin
          ALines.Add(Format('A122,%d,0,1,2,3,N,"%s"',[y, tmp]));
          y := y + 45;
        end;

     // Bold Country
     if International and (FShipTo_Country > '') then
        ALines.Add(Format('A122,%d,0,1,2,3,N,"%s"',
         [y, FixHyphens(FShipTo_Country)]));

     // Thin horizontal line (below Ship To address)
     ALines.Add('LE0,441,809,2');
     // Vertial line (right of MaxiCode)
     ALines.Add('LE244,443,2,234');

     // MaxiCode
     ALines.Add(Format('b12,453,M,m2,"001,%s,%s,0000,%s"',
      [FShipTo_Country3DigitCode, FShipTo_PostalCode, FixEPLStr(FMaxiCode)]));
{


b12,453,M,m2,"003,840,07652,0000,[)>01961Z10000064UPSN12345E07&CXBS+O\
RK*0YX#L*\"SA+'IYF9/50P\
PIAB0ZPNS8H\
"
A284,459,0,4,2,2,N," NJ 075 9-02"
B303,559,0,1,4,12,102,N,"42007652"
A20,711,0,3,2,2,N,"UPS GROUND"
A20,760,0,3,1,1,N,"TRACKING #: 1Z 123 45E 03 1000 0064"
LE687,697,122,100
B81,817,0,1,3,9,203,N,"1Z12345E0310000064"
A20,1067,0,3,1,1,N,"BILLING: P/P"
A20,1098,0,3,1,1,N,"REF1: Eltron 2543 SAMPLE"
A468,1193,0,2,1,1,N,"CSI 7.0 E2543 60.1A 10/2006"
P1,1

}

     // Routing Code
     ALines.Add(Format('A284,459,0,4,2,2,N,"%s"',[FRoutingCode]));
     // Postal Bar Code
     ALines.Add(Format('B303,559,0,1,4,12,102,N,"%s"',[FPostalBarCode]));

     // Thick bar (above service)
     ALines.Add('LE0,677,809,20');

     // Service
     tmp := UpperCase(UPS_ServiceCodeDescripSimplified[FUPSService]); //  (ups_httplink_typelib.pas);
     ALines.Add(Format('A20,711,0,3,2,2,N,"%s"',[tmp]));

     if (FUPSService in [upsGround, upsStandard]) then
        // UPS Ground, Black Square
        ALines.Add('LE687,697,122,100')
     else
       ALines.Add(Format('A674,711,0,3,2,2,N,"%s"',[FServiceIcon]));

     // Tracking number
     ALines.Add(Format('A20,760,0,3,1,1,N,"TRACKING #: %s"',[FTrackingNo]));
     // Thin line (below service and tracking number)
     ALines.Add('LE0,797,809,2');


     // Tracking number bar code
     tmp := AlphaNumeric(FTrackingNo);
     ALines.Add(Format('B81,817,0,1,3,9,203,N,"%s"',[tmp]));

     // Thick bar (below the tracking number bar code)
     ALines.Add('LE0,1036,809,20');


     // Initialize the lists
     sl.Clear;
     ref.Clear;

     // Additional Routing Instructions
     // C.O.D.
     if FCOD then
        begin
          if Billing.LabelText > '' then
             _chkOverflowAdd(Format('BILLING: %s',[Billing.LabelText]));
          // Add shipping cost to the display value, if necessary
          if FCODAddShipping then
             tmp := FormatFloat('#,##0.00', FCODAmount + FPackageCost)
          else
             tmp := FormatFloat('#,##0.00', FCODAmount);
          // Add the COD line
          if FCODPayByCheck then
             _chkOverflowAdd(Format('COD CASHIERS CK/MO ONLY $ %s', [tmp]))
          else
             _chkOverflowAdd(Format('COD $ %s', [tmp]));
          if FSignatureOptionStr > '' then
             _chkOverflowAdd(FSignatureOptionStr);
        end
     // Return Service
     else if FReturnService then
        begin
          if FDescription > '' then
             _chkOverflowAdd(Format('DESC: %s',[FDescription]));
          _chkOverflowAdd('RETURN SERVICE');
        end
     // Basic
     else
        begin
          if Billing.LabelText > '' then
             _chkOverflowAdd(Format('BILLING: %s',[Billing.LabelText]));
          if FShipperRelease then
             _chkOverflowAdd('ATTENTION UPS DRIVER:  SHIPPER RELEASE');
          if FDescription > '' then
             _chkOverflowAdd(Format('DESC: %s',[FDescription]));

          // AES
          if Assigned(FOwner) and Assigned(FOwner.SEDOptions) then
             begin
               // AES Number
               if (FOwner.SEDOptions.SEDType = sedElectronicPreDeparture) and
                  (FOwner.SEDOptions.AESTransactionNumber > '') then
                  begin
                    _chkOverflowAdd(Format('AES NUMBER: %s',
                     [FOwner.SEDOptions.AESTransactionNumber]));
                  end;
               // Tax ID Number (DUNS or EIN)
               if (FOwner.SEDOptions.SEDType in
                    [sedWithExportDocuments,sedElectronicPreDeparture,
                     sedElectronicPostDeparture,sedUPSPrepared]) and
                  (FOwner.SEDOptions.TaxIDNumber > '') then
                  begin
                    tmp := IQMS.Common.Numbers.sIIf(FOwner.SEDOptions.ExporterTaxIDType=xtiDUNS, 'DUNS','EIN');
                   _chkOverflowAdd(Format('%s: %s',
                     [tmp, FOwner.SEDOptions.TaxIDNumber]));
                  end;
             end;

          if (FSignatureOptionStr > '') then
             _chkOverflowAdd(FSignatureOptionStr);
        end;

     // Reference fields
     if (FReference1 > '') then
        _chkOverflowAdd('REF 1:' + FReference1);
     if (FReference2 > '') then
        _chkOverflowAdd('REF 2:' + FReference2);
     if (FReference3 > '') then
        _chkOverflowAdd('REF 3:' + FReference3);
     if (FReference4 > '') then
        _chkOverflowAdd('REF 4:' + FReference4);
     if (FReference5 > '') then
        _chkOverflowAdd('REF 5:' + FReference5);

     // Add the lines ("BILLING: P/P", etc.)
     y := 1067;
     for i := 0 to sl.Count - 1 do
       begin
         ALines.Add(Format('A20,%d,0,3,1,1,N,"%s"',
          [y, FixHyphens(sl.Strings[i])]));
         y := y + 28; // advanced the vertical position
       end;

     // WARSAW_AGREEMENT
     // Note:  EPL cannot print the text small enough for the Warsaw
     //        agreement to be printed at the bottom of the first label.
     //        So, if the Warsaw agreement must print, then it will
     //        print on a separate label.
     bPrnWarsawLabel := FInternational and (FBoxNo = 1);

     // Document Indicator
     z := Length(IQMS.Common.StringUtils.AlphaNumeric(FDocIndicator));
     x := 700 - (z * 15);
     if (Pos('-',FDocIndicator) > 0) or (Pos(#45,FDocIndicator) > 0) then
        x := x - 72;
     ALines.Add(Format('A%d,1067,0,3,2,2,N,"%s"',[x, FDocIndicator]));

     // Document Options (INV/SED/CO)
     x := 700 - ((Length(FDocumentOptionsStr)*5) + 2);
     ALines.Add(Format('A%d,1103,0,3,1,1,N,"%s"',[x, FDocumentOptionsStr]));

     // Vendor Control Number
     x := 598 - (Length(FVendorControlNumber) * 8);
     ALines.Add(Format('A%d,1193,0,2,1,1,N,"%s"',[x, FVendorControlNumber]));

     // Footer
     ALines.Add('P1,1');

     GetLabelLines2_EPL(ALines, bPrnWarsawLabel, ref);

  finally
     if Assigned(sl) then FreeAndNil(sl);
     if Assigned(ref) then FreeAndNil(ref);
  end;

end;

procedure TUPSPackageItem.GetLabelLines2_EPL(var ALines: TStringList;
 APrintWarsaw: Boolean; AReferenceLines: TStringList);
var
   i, x, y, z: Integer;
   tmp: String;
   sl: TStringList;

   procedure _ad2col(const y_pos: Integer;
    const ACaption1, AText1, ACaption2, AText2: String; var new_y_pos: Integer);
   var
      S1, S2: String;
   begin
     S1 := '';
     S2 := '';

     new_y_pos := y_pos;

     if Trim(AText1 + AText2) = '' then Exit;

     if AText1 > '' then
        begin
          S1 := Format('%s: %s',[ACaption1, FixHyphens(AText1)]);
          if AText2 > '' then
             S2 := Format('%s: %s',[ACaption2, FixHyphens(AText2)]);
        end
     else if AText2 > '' then
        S1 := Format('%s: %s',[ACaption2, FixHyphens(AText2)]);


     // Tracking number
     ALines.Add(Format('A20,%d,0,3,1,1,N,"%s"',[y_pos, S1]));
     // Shipping number
     ALines.Add(Format('A450,%d,0,3,1,1,N,"%s"',[y_pos, S2]));

     new_y_pos := y_pos + 24;
   end;

begin

  if not Assigned(ALines) then Exit;

  // If we don't need the Warsaw lines, and there are no additional lines
  // to print, then just exit
  if (AReferenceLines.Count = 0) and not APrintWarsaw then Exit;

  // Header
  ALines.Add('N');
  ALines.Add('Q1219,24');
  ALines.Add('R15,0');
  ALines.Add('S3');
  ALines.Add('D11');
  ALines.Add('ZB');
  ALines.Add('I8,1');

  ALines.Add('A90,28,0,3,1,1,N,"Backup Document - Please Place on Package."');

  // Tracking number and Shipping number
  y := 62;
  _ad2col(y,'TR#',FTrackingNo,'SHP#',FShpNo, y);
  _ad2col(y,'ORD#',FOrderNo,'DEPT#',FixHyphens(FDepartment), y);

  // Reference fields
  // If there are reference lines to print, then we print them here
  if Assigned(AReferenceLines) then
  for i := 0 to AReferenceLines.Count - 1 do
    begin
      ALines.Add(Format('A24,%d,0,3,1,1,N,"%s"',
       [y, FixHyphens(AReferenceLines.Strings[i])]));
      if i >= 5 then Break;
      y := y + 24; // advanced the vertical position
    end;

  // Thin line
  ALines.Add(Format('LE0,%d,809,2',[y]));

  // Barcode (?)


  // Warsaw Agreement
  if APrintWarsaw then
     try
        sl := TStringList.Create;
        sl.Text := WrapText(WARSAW_AGREEMENT, #13, ['.', ' ', #9, '-'], 74);
        x := 540;
        for i := 0 to sl.Count - 1 do
          begin
            ALines.Add(Format('A24,%d,0,1,1,1,N,"%s"',
              [x, FixEPLStr(sl.Strings[i])]));
            Inc(x, 22);
          end;

       // * Signature Section *
       // Thin line
       ALines.Add('LE0,1058,809,2');
       ALines.Add('A40,1062,0,3,1,1,N,"SHIPPERS SIGNATURE:"');
       ALines.Add('A560,1062,0,3,1,1,N,"DATE:"');
     finally
        if Assigned(sl) then FreeAndNil(sl);
     end;

  // Vendor Control Number
  x := 598 - (Length(FVendorControlNumber) * 8);
  ALines.Add(Format('A%d,1193,0,2,1,1,N,"%s"',[x, FVendorControlNumber]));

  // Footer
  ALines.Add('P1,1');

end;

procedure TUPSPackageItem.GetLabelLines_ZPL(var ALines: TStringList);
var
   i, x, y: Integer;
   sl, ref: TStringList;
   tmp: String;
   bPrnSecondPage,
   bPrnWarsawLabel: Boolean; // must print a separate label containing the Warsaw Agreement
   lbl: TZPLPrint;

   procedure _chkOverflowAdd(const S: String; const AMax: Integer = 5);
   begin
     if sl.Count >= AMax then
        ref.Add(S)
     else
        sl.Add(S);
   end;

begin
  // This method generates the text for a ZPL label. The text is then
  // sent to the printer.

  // Validation
  if not Assigned(ALines) then Exit;
  // Initialization
  bPrnWarsawLabel := False;

  try
     // This temporary string list is used to build address lines, and
     // detail lines based on available information.  After building the
     // list, we add lines to the label.
     sl := TStringList.Create;
     ref := TStringList.Create;
     lbl := TZPLPrint.Create(NIL);

     // Sender Address Block
     sl.Clear;
     GetSenderAddressLines(sl);

     y := 35;
     for i := 0 to sl.Count - 1 do
       begin
         lbl.AddText(sl.Strings[i], 10, y, pfsNormal8);
         Inc(y, 24); // advanced the vertical position
       end;

     // Package weight and count
     lbl.AddText(FPkgWtStr, 422, 38, pfsNormal14);
     lbl.AddText(FPkgCntStr, 610, 38, pfsNormal12);

     // Shipment Information
     if FCOD then
        lbl.AddText('COD', 440, 90, pfsNormal30)
     else if FReturnService and not FProactiveResponse then
        lbl.AddText('RS', 440, 90, pfsNormal30)
     else
        begin
          lbl.AddText(Format('SHP#: %s',[FShpNo]), 440, 83, pfsNormal8);
          lbl.AddText(Format('SHP WT: %s',[FShipmentWeight]), 440, 107, pfsNormal8);
          lbl.AddText(Format('SHP DWT: %s',[FShpDwtStr]), 440, 131, pfsNormal8);
          lbl.AddText(Format('DATE: %s',[FShpDate]), 440, 155, pfsNormal8);
          lbl.AddText(FLP_AH_Indicator, 440, 179, pfsNormal8);
        end;

     // 'SHIP TO:'
     lbl.AddText('SHIP', 10, 221, pfsNormal12);
     lbl.AddText('TO:', 38, 251, pfsNormal12);

     // Proactive Response
     if FProactiveResponse then
        lbl.AddText('PRO', 660, 179, pfsNormal20);

     // Recipient Address Block
     tmp := IQMS.Common.AddressFormat.GetFormattedCityStatePostalCode(FShipTo_CountryCode,
      FShipTo_City, FShipTo_State, FShipTo_PostalCode);
     sl.Clear;
     CompileList([IQMS.Common.StringUtils.LeftStr(FShipTo_Contact,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Phone,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Company,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Addr1,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Addr2,39)],
                  sl);
     y := 221;
     for i := 0 to sl.Count - 1 do
       begin
         lbl.AddText(sl.Strings[i], 100, y, pfsNormal10);
         Inc(y, 28); // advanced the vertical position
       end;

     Inc(y, 4);

     // Bold Postal Code
     if tmp > '' then
        begin
          lbl.AddText(tmp, 100, y, pfsNormal12);
          Inc(y, 32);
        end;

     // Bold Country
     if International and (FShipTo_Country > '') then
        lbl.AddText(FShipTo_Country, 100, y, pfsNormal12);

     // Lines  for borders
     lbl.ThinHorizontalLine(453);
     lbl.ThickHorizontalLine(679);
     // Vertical line to the right of the MaxiCode
     lbl.ThinVerticalLine(250 {Left},453 {Top},227 {Height});

     if not International and
        ups_httplink_utils.IsHeavyWeightPackage(FPackageActualWeight,FWeightUOM) then
        begin
          // Prints a large, "H" where the MaxiCode normally goes.
          lbl.Add('^A0,228,320^FO36,482^FDH^FS');
        end
     else
        begin
          // MaxiCode (FMaxiCode)
          // Example: '001840076520000[)>_1E01_1D961Z12345675_1' +
          //  'DUPSN_112345E_1D284_1D_1D1/20_1D60_1DN_1D_1DPARAMUS_1DNJ_1E_04'
          lbl.Add(Format('^FO22,467^BD^FH^FD%s^FS',
            ['001' + FShipTo_Country3DigitCode + FShipTo_PostalCode + FMaxiCode]));
        end;

     // Routing Code
     lbl.AddText(Trim(FRoutingCode), 300, 474, pfsNormal30);

     // Postal Bar Code
     lbl.Add(Format('^FO300,555^BY3^BCN,102,N^FD>;%s^FS',[FPostalBarCode]));

     // Service Icon
     if (FUPSService in [upsGround, upsStandard]) then
        // Black Box
        lbl.BlackSquare(692 {Left}, 682 {690} {Top}, 120{Size})
     else
        lbl.AddText(FServiceIcon, 600, 697, pfsNormal40);

     // Service
     tmp := UpperCase(UPS_ServiceCodeDescripSimplified[FUPSService]); //  (ups_httplink_typelib.pas);
     lbl.AddText(tmp, 20, 700, pfsNormal20);

     // Tracking number
     lbl.AddText(Format('TRACKING #: %s',[FTrackingNo]), 20, 752, pfsNormal10);

     // thin line below tracking number
     lbl.ThinHorizontalLine(783);

     // Tracking number bar code
     lbl.Add(Format('^FO50,803^BY3^BCN,203,N^FD>:%s^FS',
      [AlphaNumeric(FTrackingNo)]));

     // Thick line
     lbl.ThickHorizontalLine(1020);

     // Initialize the lists
     sl.Clear;
     ref.Clear;

     // Additional Routing Instructions
     // C.O.D.
     if FCOD then
        begin
          if Billing.LabelText > '' then
             _chkOverflowAdd(Format('BILLING: %s',[Billing.LabelText]));
          // Add shipping cost to the display value, if necessary
          if FCODAddShipping then
             tmp := FormatFloat('#,##0.00', FCODAmount + FPackageCost)
          else
             tmp := FormatFloat('#,##0.00', FCODAmount);
          // Add the COD line
          if FCODPayByCheck then
             _chkOverflowAdd(Format('COD CASHIERS CK/MO ONLY $ %s', [tmp]))
          else
             _chkOverflowAdd(Format('COD $ %s', [tmp]));
          if FSignatureOptionStr > '' then
             _chkOverflowAdd(FSignatureOptionStr);
        end
     // Return Service
     else if FReturnService then
        begin
          if FDescription > '' then
             _chkOverflowAdd(Format('DESC: %s',[FDescription]));
          _chkOverflowAdd('RETURN SERVICE');
        end
     // Basic
     else
        begin
          if Billing.LabelText > '' then
             _chkOverflowAdd(Format('BILLING: %s',[Billing.LabelText]));
          if FShipperRelease then
             _chkOverflowAdd('ATTENTION UPS DRIVER:  SHIPPER RELEASE');
          if FDescription > '' then
             _chkOverflowAdd(Format('DESC: %s',[FDescription]));

          // AES
          if Assigned(FOwner) and Assigned(FOwner.SEDOptions) then
             begin
               // AES Number
               if (FOwner.SEDOptions.SEDType = sedElectronicPreDeparture) and
                  (FOwner.SEDOptions.AESTransactionNumber > '') then
                  begin
                    _chkOverflowAdd(Format('AES NUMBER: %s',
                     [FOwner.SEDOptions.AESTransactionNumber]));
                  end;
               // Tax ID Number (DUNS or EIN)
               if (FOwner.SEDOptions.SEDType in
                    [sedWithExportDocuments,sedElectronicPreDeparture,
                     sedElectronicPostDeparture,sedUPSPrepared]) and
                  (FOwner.SEDOptions.TaxIDNumber > '') then
                  begin
                    tmp := IQMS.Common.Numbers.sIIf(FOwner.SEDOptions.ExporterTaxIDType=xtiDUNS, 'DUNS','EIN');
                   _chkOverflowAdd(Format('%s: %s',
                     [tmp, FOwner.SEDOptions.TaxIDNumber]));
                  end;
             end;

          if (FSignatureOptionStr > '') then
             _chkOverflowAdd(FSignatureOptionStr);
        end;

     // Reference fields
     if (FReference1 > '') then
        _chkOverflowAdd('REF 1:' + FReference1);
     if (FReference2 > '') then
        _chkOverflowAdd('REF 2:' + FReference2);
     if (FReference3 > '') then
        _chkOverflowAdd('REF 3:' + FReference3);
     if (FReference4 > '') then
        _chkOverflowAdd('REF 4:' + FReference4);
     if (FReference5 > '') then
        _chkOverflowAdd('REF 5:' + FReference5);

     // Add the lines
     y := 1044;
     for i := 0 to sl.Count - 1 do
       begin
         lbl.AddText(sl.Strings[i], 20, y, pfsNormal8);
         Inc(y, 26); // advanced the vertical position
       end;

     // Print Warsaw Agreement on second page
     bPrnWarsawLabel := False;
     if FInternational then
        begin
          if (sl.Count <= 2) then
             lbl.Add(Format('^A0N,5,5^FO20,1132^FB780,6,,,^FD%s^FS',
              [WARSAW_AGREEMENT]))
          // Yes, we need to print the Warsaw agreement on the second page.
          else bPrnWarsawLabel := (FBoxNo = 1);
        end;

     // Document Indicator (INV/SED/CO)
     //z := Length(IQMS.Common.StringUtils.AlphaNumeric(FDocIndicator));
     //x := 740 - (z * 15);
     //if (Pos('-',FDocIndicator) > 0) or (Pos(#45,FDocIndicator) > 0) then
     //   x := x - 72;
     lbl.AddText(FDocIndicator, 600, 1044, pfsNormal20);

     // Document Options (POA/SED/CO)
     //x := 740 - ((Length(FDocumentOptionsStr)*5) + 2);
     lbl.AddText(FDocumentOptionsStr, 600, 1100, pfsNormal10);

     // Vendor Control Number
     y := 790 - (Length(FVendorControlNumber)*8);
     x := Max(10, x);
     lbl.AddText(FVendorControlNumber, x, 1182, pfsSmall);

     lbl.Execute;
     ALines.AddStrings(lbl.Lines);

     // Always print the second page if this is the first box of an
     // International shipment, this is a return service and
     // this is not UPS Standard.
     bPrnSecondPage := FInternational and FReturnService and
      (FUPSService <> upsStandard) and (FBoxNo = 1);
     if not bPrnSecondPage then
        bPrnSecondPage := bPrnWarsawLabel;

     // Print the second page
     if bPrnSecondPage then
        GetLabelLines2_ZPL(ALines, bPrnWarsawLabel, ref);

  finally
     if Assigned(sl) then FreeAndNil(sl);
     if Assigned(ref) then FreeAndNil(ref);
     if Assigned(lbl) then FreeAndNil(lbl);
  end;
end;

(*
procedure TUPSPackageItem.GetLabelLines_ZPL(var ALines: TStringList);
var
   i, x, y, z: Integer;
   sl, ref: TStringList;
   tmp: String;
   bPrnWarsawLabel: Boolean; // must print a separate label containing the Warsaw Agreement

   function _svc_icon_left: Integer;
   var
      l1, n1: Integer;
      s: String;
   begin
     // only numbers and alpha-characters
     s := IQMS.Common.StringUtils.AlphaNumeric(FServiceIcon);
     l1 := Length(s);

     if (Length(FServiceIcon) = 3) and (Pos('+', FServiceIcon) > 0) then
        Result := 632
     else if (Length(FServiceIcon) = 3) and (Pos(' ', FServiceIcon) > 0) then
        Result := 656
     else if (Length(FServiceIcon) = 1) then
        Result := 748
     else if (Length(FServiceIcon) = 2) then
        Result := 688
     else if (Length(FServiceIcon) = 3) then
        Result := 632
     else
        Result := 688;
   end;

   procedure _chkOverflowAdd(const S: String; const AMax: Integer = 4);
   begin
     if sl.Count >= AMax then
        ref.Add(S)
     else
        sl.Add(S);
   end;

   procedure _ThickHorizontalLine(const ATop: Integer);
   begin
     ALines.Add(Format('^FO0,%d^GB797,0,13^FS',[ATop]));
   end;

   procedure _ThinHorizontalLine(const ATop: Integer);
   begin
     ALines.Add(Format('^FO0,%d^GB797,0,2^FS',[ATop]));
   end;

begin
  // This method generates the text for a ZPL label. The text is then
  // sent to the printer.

  // Validation
  if not Assigned(ALines) then Exit;
  // Initialization
  bPrnWarsawLabel := False;

  try
     // This temporary string list is used to build address lines, and
     // detail lines based on available information.  After building the
     // list, we add lines to the label.
     sl := TStringList.Create;
     ref := TStringList.Create;

     // Header
     ALines.Add('~CC^~CD,~CT~^IDR:*.*^XA^LH0,0^PW791^MMT~TA000');
     ALines.Add('^MTD~SD15^LT0^PR5,5,5^POI^PMN^LRN^LH10,10');
     ALines.Add('^CI27');
     ALines.Add('^CI27');

     // Sender Address Block
     // tmp := ConcatCityStateZip
     //               (FShipFrom_City,
     //                IQMS.Common.StringUtils.LeftStr(FShipFrom_State,2),
     //                IQMS.Common.StringUtils.LeftStr(FShipFrom_PostalCode,16));
     sl.Clear;
     GetSenderAddressLines(sl);
     // CompileList([IQMS.Common.StringUtils.LeftStr(FShipFrom_Contact, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Phone, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Company, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr1, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr2, 35),
     //              tmp,
     //              IQMS.Common.Numbers.sIIf(International, IQMS.Common.StringUtils.LeftStr(FShipFrom_Country, 35),'')],
     //              sl);

     y := 35;
     for i := 0 to sl.Count - 1 do
       begin
         ALines.Add(Format('^FO10,%d^A0N,24,24^FD%s^FS',
          [y, FixHyphens(sl.Strings[i])]));
         y := y + 24; // advanced the vertical position
       end;

     // Package weight and count
     ALines.Add(Format('^A0,40,42^FO422,38^FD%s^FS',[FPkgWtStr]));
     ALines.Add(Format('^A0,28,35^FO610,38^FD%s^FS',[FPkgCntStr]));

     // Shipment Information
     if FCOD then
        begin
          ALines.Add('^FO440,90^A0,80,71^FDCOD^FS');
        end
     else if FReturnService then
        begin
          ALines.Add('^FO440,90^A0,80,71^FDRS^FS');
        end
     else
        begin
          ALines.Add(Format('^FO440,83^A0N,24,24^FDSHP#: %s^FS',[FShpNo]));
          ALines.Add(Format('^FO440,107^A0N,24,24^FDSHP WT: %s^FS',[FShipmentWeight]));
          ALines.Add(Format('^FO440,131^A0N,24,24^FDSHP DWT: %s^FS',[FShpDwtStr]));
          ALines.Add(Format('^FO440,155^A0N,24,24^FDDATE: %s^FS',[FShpDate]));
          ALines.Add(Format('^FO440,179^A0N,24,24^FD%s^FS',[FLP_AH_Indicator]));
        end;

     // 'SHIP TO:'
     ALines.Add('^A0,48,42^FO10,223^FDSHIP^FS');
     ALines.Add('^A0,48,42^FO39,271^FDTO:^FS');

     // Recipient Address Block
     tmp := IQMS.Common.AddressFormat.GetFormattedCityStatePostalCode(FShipTo_CountryCode,
      FShipTo_City, FShipTo_State, FShipTo_PostalCode);
     // tmp := Format('%s %s %s', [FShipTo_City,FShipTo_State,FShipTo_PostalCode]);
     sl.Clear;
     //GetRecipientAddressLines(sl);
     CompileList([IQMS.Common.StringUtils.LeftStr(FShipTo_Contact,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Phone,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Company,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Addr1,39),
                  IQMS.Common.StringUtils.LeftStr(FShipTo_Addr2,39)],
                  sl);
     y := 223;
     for i := 0 to sl.Count - 1 do
       begin
         ALines.Add(Format('^A0,28,35^FO120,%d^FD%s^FS',[y, FixHyphens(sl.Strings[i])]));
         y := y + 28; // advanced the vertical position
       end;

     y := y + 6;

     // Bold Postal Code
     if tmp > '' then
        begin
          ALines.Add(Format('^A0,48,42^FO120,%d^FD%s^FS',[y, tmp]));
          y := y + 45;
        end;

     // Bold Country
     if International and (FShipTo_Country > '') then
        ALines.Add(Format('^A0,48,42^FO120,%d^FD%s^FS',[y, FixHyphens(FShipTo_Country)]));

     // Lines  for borders
     _ThinHorizontalLine(463);
     _ThickHorizontalLine(689);
     // Vertical line to the right of the MaxiCode
     ALines.Add('^FO260,463^GB0,227,2^FS');

     if not International and
        ups_httplink_utils.IsHeavyWeightPackage(FPackageActualWeight,FWeightUOM) then
        begin
          // Prints a large, "H" where the MaxiCode normally goes.
          ALines.Add('^A0,228,320^FO36,492^FDH^FS');
        end
     else
        begin
          // MaxiCode (FMaxiCode)
          // Example: '001840076520000[)>_1E01_1D961Z12345675_1' +
          //  'DUPSN_112345E_1D284_1D_1D1/20_1D60_1DN_1D_1DPARAMUS_1DNJ_1E_04'
          ALines.Add(Format('^FO32,477^BD^FH^FD%s^FS',
            ['001' + FShipTo_Country3DigitCode + FShipTo_PostalCode + FMaxiCode]));
        end;

     // Routing Code
     ALines.Add(Format('^A0,80,71^FO320,484^FD%s^FS', [FRoutingCode]));
     // Postal Bar Code
     ALines.Add(Format('^FO320,565^BY3^BCN,102,N^FD>;%s^FS',[FPostalBarCode]));

     // Service Icon
     if (FUPSService in [upsGround, upsStandard]) then
        // Black Box
        ALines.Add('^FO692,700^GB120,120,120^FS')
     else
        ALines.Add(Format('^A0N,100,80^FO600,715^FD%s^FS',[FServiceIcon]));

     // Service
     tmp := UpperCase(UPS_ServiceCodeDescripSimplified[FUPSService]); //  (ups_httplink_typelib.pas);
     ALines.Add(Format('^A0,53,53^FO20,718^FD%s^FS',[tmp]));

     // Tracking number
     ALines.Add(Format('^A0N,32,32^FO20,770^FDTRACKING #: %s^FS',[FTrackingNo]));

     // thin line below tracking number
     //ALines.Add('^FO0,807^GB797,0,2^FS');
     _ThinHorizontalLine(807);

     // Tracking number bar code
     tmp := AlphaNumeric(FTrackingNo);
     ALines.Add('^FO50,827');
     //ALines.Add('^FO100,838');
     ALines.Add(Format('^BY3^BCN,203,N^FD>:%s^FS',[tmp]));

     // Thick line
     //ALines.Add('^FO0,1044^GB797,0,13^FS');
     _ThickHorizontalLine(1044);

     // Initialize the lists
     sl.Clear;
     ref.Clear;

     // Additional Routing Instructions
     // C.O.D.
     if FCOD then
        begin
          if Billing.LabelText > '' then
             _chkOverflowAdd(Format('BILLING: %s',[Billing.LabelText]));
          // Add shipping cost to the display value, if necessary
          if FCODAddShipping then
             tmp := FormatFloat('#,##0.00', FCODAmount + FPackageCost)
          else
             tmp := FormatFloat('#,##0.00', FCODAmount);
          // Add the COD line
          if FCODPayByCheck then
             _chkOverflowAdd(Format('COD CASHIERS CK/MO ONLY $ %s', [tmp]))
          else
             _chkOverflowAdd(Format('COD $ %s', [tmp]));
          if FSignatureOptionStr > '' then
             _chkOverflowAdd(FSignatureOptionStr);
        end
     // Return Service
     else if FReturnService then
        begin
          if FDescription > '' then
             _chkOverflowAdd(Format('DESC: %s',[FDescription]));
          _chkOverflowAdd('RETURN SERVICE');
        end
     // Basic
     else
        begin
          if Billing.LabelText > '' then
             _chkOverflowAdd(Format('BILLING: %s',[Billing.LabelText]));
          if FShipperRelease then
             _chkOverflowAdd('ATTENTION UPS DRIVER:  SHIPPER RELEASE');
          if FDescription > '' then
             _chkOverflowAdd(Format('DESC: %s',[FDescription]));

          // AES
          if Assigned(FOwner) and Assigned(FOwner.SEDOptions) then
             begin
               // AES Number
               if (FOwner.SEDOptions.SEDType = sedElectronicPreDeparture) and
                  (FOwner.SEDOptions.AESTransactionNumber > '') then
                  begin
                    _chkOverflowAdd(Format('AES NUMBER: %s',
                     [FOwner.SEDOptions.AESTransactionNumber]));
                  end;
               // Tax ID Number (DUNS or EIN)
               if (FOwner.SEDOptions.SEDType in
                    [sedWithExportDocuments,sedElectronicPreDeparture,
                     sedElectronicPostDeparture,sedUPSPrepared]) and
                  (FOwner.SEDOptions.TaxIDNumber > '') then
                  begin
                    tmp := IQMS.Common.Numbers.sIIf(FOwner.SEDOptions.ExporterTaxIDType=xtiDUNS, 'DUNS','EIN');
                   _chkOverflowAdd(Format('%s: %s',
                     [tmp, FOwner.SEDOptions.TaxIDNumber]));
                  end;
             end;

          if (FSignatureOptionStr > '') then
             _chkOverflowAdd(FSignatureOptionStr);
        end;

     // Reference fields
     if (FReference1 > '') then
        _chkOverflowAdd('REF 1:' + FReference1);
     if (FReference2 > '') then
        _chkOverflowAdd('REF 2:' + FReference2);
     if (FReference3 > '') then
        _chkOverflowAdd('REF 3:' + FReference3);
     if (FReference4 > '') then
        _chkOverflowAdd('REF 4:' + FReference4);
     if (FReference5 > '') then
        _chkOverflowAdd('REF 5:' + FReference5);

     // Add the lines
     y := 1070; // 1122;
     for i := 0 to sl.Count - 1 do
       begin
         ALines.Add(Format('^A0N,24,24^FO20,%d^FD%s^FS',
          [y, FixHyphens(sl.Strings[i])]));
         y := y + 28; // advanced the vertical position
       end;

     // WARSAW_AGREEMENT
     bPrnWarsawLabel := False;
     if FInternational then
        begin
          if (sl.Count <= 2) then
             ALines.Add(Format('^A0N,5,5^FO20,1142^FB780,6,,,^FD%s^FS',
              [WARSAW_AGREEMENT]))
          else bPrnWarsawLabel := (FBoxNo = 1);
        end;

     // Document Indicator (INV/SED/CO)
     z := Length(IQMS.Common.StringUtils.AlphaNumeric(FDocIndicator));
     x := 740 - (z * 15);
     if (Pos('-',FDocIndicator) > 0) or (Pos(#45,FDocIndicator) > 0) then
        x := x - 72;
     //ALines.Add(Format('^FO720,1122^A0,59,53^FD%s^FS',['INV'{FDocIndicator}]));
     ALines.Add(Format('^A0,59,53^FO%d,1070^FD%s^FS',[x, FDocIndicator]));
     //ALines.Add(Format('^FO674,1084^A0,59,53^FD%s^FS',[FDocIndicator]));

     // Document Options (POA/SED/CO)
     x := 740 - ((Length(FDocumentOptionsStr)*5) + 2);
     ALines.Add(Format('^A0N,24,24^FO%d,1128^FD%s^FS',[x, FDocumentOptionsStr]));

     // Vendor Control Number
     x := 770 - (Length(FVendorControlNumber)*12);
     x := Max(10, x);
     ALines.Add(Format('^ADN,0,0^FO%d,1182^FD%s^FS',[x, FVendorControlNumber]));

     // Footer
     ALines.Add('^XZ');

     GetLabelLines2_ZPL(ALines, bPrnWarsawLabel, ref);

  finally
     if Assigned(sl) then FreeAndNil(sl);
     if Assigned(ref) then FreeAndNil(ref);
  end;


end;
*)

procedure TUPSPackageItem.GetLabelLines2_ZPL(var ALines: TStringList;
 APrintWarsaw: Boolean; AReferenceLines: TStringList);
var
   i, y: Integer;
   tmp: String;
   lbl: TZPLPrint;

   procedure _ad2col(const y_pos: Integer;
    const ACaption1, AText1, ACaption2, AText2: String; var new_y_pos: Integer);
   var
      S1, S2: String;
   begin
     S1 := '';
     S2 := '';

     new_y_pos := y_pos;

     // Validate
     if Trim(AText1 + AText2) = '' then Exit;

     // Get text
     if AText1 > '' then
        begin
          S1 := Format('%s: %s',[ACaption1, FixHyphens(AText1)]);
          if AText2 > '' then
             S2 := Format('%s: %s',[ACaption2, FixHyphens(AText2)]);
        end
     else if AText2 > '' then
        S1 := Format('%s: %s',[ACaption2, FixHyphens(AText2)]);

     // Add columns
     lbl.AddText(S1, 24, y_pos, pfsNormal8);
     lbl.AddText(S2, 450, y_pos, pfsNormal8);
     // advance position
     new_y_pos := y_pos + 24;
   end;

begin

  if not Assigned(ALines) then Exit;

  try
     lbl := TZPLPrint.Create(NIL);

     // If we don't need the Warsaw lines, and there are no additional lines
     // to print, then just exit
     if (AReferenceLines.Count = 0) and not APrintWarsaw then Exit;

     //tmp := 'Backup Document - Please Place on Package.';
     //x := (800 - (Length(tmp)*12)) div 2;
     //ALines.Add(Format('^FO%d,35^A0N,24,24^FD%s^FS',
     // [x, tmp]));
     lbl.AddText('Backup Document - Please Place on Package.', 160, 35,
      pfsNormal8);

     // Tracking number and Shipping number
     y := 62;
     _ad2col(y,'TR#',FTrackingNo,'SHP#',FShpNo, y);
     _ad2col(y,'ORD#',FOrderNo,'DEPT#',FixHyphens(FDepartment), y);

     // Reference fields
     // If there are reference lines to print, then we print them here
     if Assigned(AReferenceLines) then
     for i := 0 to AReferenceLines.Count - 1 do
       begin
         lbl.AddText(AReferenceLines.Strings[i], 25, y, pfsNormal8);
         if i >= 5 then Break;
         Inc(y, 24); // advanced the vertical position
       end;

     // Thin line
     lbl.ThinHorizontalLine(y);

     Inc(y, 64); // advanced the vertical position

     // PDF417 Barcode
     lbl.Add(Format('^FO40,%d^BY3^BCN,203,N^FD>:%s^FS',
      [y, AlphaNumeric(FTrackingNo)]));

     // Warsaw Agreement
     if APrintWarsaw then
        begin
          lbl.Add(Format('^A0N,16,16^FO20,830^FB730,30,,,^FD%s^FS',
           [WARSAW_AGREEMENT]));

          // * Signature Section *
          lbl.ThinHorizontalLine(1058);
          lbl.AddText('SHIPPERS SIGNATURE:', 40, 1062, pfsNormal8);
          lbl.AddText('DATE:', 560, 1062, pfsNormal8);
        end;

     // Vendor Control Number
     y := 790 - (Length(FVendorControlNumber)*8);
     y := Max(10, y);
     lbl.AddText(FVendorControlNumber, y, 1182, pfsSmall);

     lbl.Execute;

     ALines.AddStrings(lbl.Lines);

  finally
    if Assigned(lbl) then FreeAndNil(lbl);
  end;
end;

(*
procedure TUPSPackageItem.GetLabelLines2_ZPL(var ALines: TStringList;
 APrintWarsaw: Boolean; AReferenceLines: TStringList);
var
   i, x, y, z: Integer;
   tmp: String;
   lbl: TZPLPrint;

   procedure _ad2col(const y_pos: Integer;
    const ACaption1, AText1, ACaption2, AText2: String; var new_y_pos: Integer);
   var
      S1, S2: String;
   begin
     S1 := '';
     S2 := '';

     new_y_pos := y_pos;

     if Trim(AText1 + AText2) = '' then Exit;

     if AText1 > '' then
        begin
          S1 := Format('%s: %s',[ACaption1, FixHyphens(AText1)]);
          if AText2 > '' then
             S2 := Format('%s: %s',[ACaption2, FixHyphens(AText2)]);
        end
     else if AText2 > '' then
        S1 := Format('%s: %s',[ACaption2, FixHyphens(AText2)]);


     // Tracking number
     ALines.Add(Format('^A0N,24,24^FO24,%d^FD%s^FS',[y_pos, S1]));
     // Shipping number
     ALines.Add(Format('^A0N,24,24^FO450,%d^FD%s^FS',[y_pos, S2]));

     new_y_pos := y_pos + 24;
   end;

begin

  if not Assigned(ALines) then Exit;

  try
     lbl := TZPLPrint.Create(NIL);

     // If we don't need the Warsaw lines, and there are no additional lines
     // to print, then just exit
     if (AReferenceLines.Count = 0) and not APrintWarsaw then Exit;

     // Header
     ALines.Add('^XA^LH0,0^PR1^POI^FO0,0^FD^FS');

     //ALines.Add('^XA^LH0,0^PR1^POI^FS');
     tmp := 'Backup Document - Please Place on Package.';
     x := (800 - (Length(tmp)*12)) div 2;
     ALines.Add(Format('^FO%d,35^A0N,24,24^FD%s^FS',
      [x, tmp]));

     // Tracking number and Shipping number
     y := 62;
     _ad2col(y,'TR#',FTrackingNo,'SHP#',FShpNo, y);
     _ad2col(y,'ORD#',FOrderNo,'DEPT#',FixHyphens(FDepartment), y);

     // Reference fields
     // If there are reference lines to print, then we print them here
     if Assigned(AReferenceLines) then
     for i := 0 to AReferenceLines.Count - 1 do
       begin
         ALines.Add(Format('^FO25,%d^A0N,24,24^FD%s^FS',
          [y, FixHyphens(AReferenceLines.Strings[i])]));
         if i >= 5 then Break;
         y := y + 24; // advanced the vertical position
       end;

     // Thin line
     ALines.Add(Format('^FO0,%d^GB797,0,2^FS',[y]));

     // Barcode


     // Warsaw Agreement
     if APrintWarsaw then
        begin
          ALines.Add(Format('^A0N,24,24^FO24,560^FB740,30,,,^FD%s^FS',[WARSAW_AGREEMENT]));

          // * Signature Section *
          // Thin line
          ALines.Add('^FO0,1058^GB797,0,2^FS');
          ALines.Add('^FO40,1062^A0N,24,24^FDSHIPPERS SIGNATURE:^FS');
          ALines.Add('^FO560,1062^A0N,24,24^FDDATE:^FS');

        end;

     // Vendor Control Number
     x := 600 - (Length(FVendorControlNumber)*12);
     x := Max(10, x);
     ALines.Add(Format('^ADN,0,0^FO%d,1182^FD%s^FS',[x, FVendorControlNumber]));

     // Footer
     ALines.Add('^XZ');

  finally
    if Assigned(lbl) then FreeAndNil(lbl);
  end;
end;
*)

function TUPSPackageItem.GetDBFFileName: String;
var
   dir, tmp: String;
begin
  dir := System.SysUtils.IncludeTrailingPathDelimiter(IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'Temp');
  ForceDirectories(dir);
  //tmp := FileNameNoExt(FLabelName) + '.dbf';
  tmp := 'upslabel.dbf';
  Result := dir + tmp;
end;

procedure TUPSPackageItem.CalcMaxiCode;
var
   o: TUPSMaxiCode;
begin
  // Initialize
  FMaxiCodeFileName := '';

  try
    o := TUPSMaxiCode.Create(NIL); // in ups_httplink_maxicode.pas
    o.TestMode := True;
    o.AccountNo := FAccountNo;
    o.TrackingNumber := Self.FTrackingNo;
    o.ShipperNumber := ups_httplink_utils.CalculateShipperNumber(o.TrackingNumber);
    o.ServiceClass := FServiceClass;
    o.ShipTo_Company := FShipTo_Company;
    o.ShipTo_Contact := FShipTo_Contact;
    o.ShipTo_Addr1 := FShipTo_Addr1;
    o.ShipTo_Addr2 := FShipTo_Addr2;
    o.ShipTo_City := FShipTo_City;
    o.ShipTo_State := FShipTo_State;
    o.International := FInternational;
    o.ShipTo_PostalCode := FShipTo_PostalCode;
    o.ShipTo_Country3DigitCode := FShipTo_Country3DigitCode;

    o.PickupDate := FShpDateDate;

    o.BoxNo := FBoxNo;
    o.BoxCount := FBoxCount;
    o.PackageWeight := Round(Self.FPackageActualWeight);

    o.AddressValidation := FAddressValidated;

    o.Execute;

    Self.FMaxiCode := o.MaxiCode;
    Self.FMaxiCodeMode := o.MaxiCodeMode;
    Self.FMaxiCodeFileName := o.MaxiCodeFileName;

  finally
     if Assigned(o) then FreeAndNil(o);
  end;
end;

procedure TUPSPackageItem.CalcWorldEaseMaxiCode;
var
   o: TUPSMaxiCode;
begin
  // Initialize
//  FMaxiCodeFileName := '';

  try
    o := TUPSMaxiCode.Create(NIL); // in ups_httplink_maxicode.pas
    o.TestMode := True;
    o.AccountNo := FAccountNo;
    o.TrackingNumber := Self.FTrackingNo;
    o.ShipperNumber := ups_httplink_utils.CalculateShipperNumber(o.TrackingNumber);
    o.ServiceClass := FServiceClass;
    o.ShipTo_Company := '';
    o.ShipTo_Contact := '';
    o.ShipTo_Addr1 := '';
    o.ShipTo_Addr2 := '';
    o.ShipTo_City := FOwner.WorldEase_City;
    o.ShipTo_State := FOwner.WorldEase_State;
    o.International := True;
    o.ShipTo_PostalCode := FOwner.WorldEase_PostalCode;
    o.ShipTo_Country3DigitCode := FOwner.WorldEase_Country3DigitCode;

    o.PickupDate := FShpDateDate;

    o.BoxNo := 1;
    o.BoxCount := 1;
    o.PackageWeight := Round(Self.FPackageActualWeight);

    o.AddressValidation := False;
    o.WorldEase := True;

    o.Execute;

    Self.FWorldEaseMaxiCode := o.MaxiCode;
//    Self.FMaxiCodeMode := o.MaxiCodeMode;
//    Self.FMaxiCodeFileName := o.MaxiCodeFileName;

  finally
     if Assigned(o) then FreeAndNil(o);
  end;
end;

procedure TUPSPackageItem.CreateMaxiCodeImage;
var
   A: Variant;
begin
  CheckCreateDNetCOM('IQMS.Barcode', 'IQMS.Barcode.Maxicode', A);
  try

    A.CreateMaxicodeImage(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
            'SHIPMENT_PACKAGES', 'LABEL_BLOB', FID, FMaxiCode, FMaxiCodeMode);

    if (FOwner.WorldEase) then
      A.CreateMaxicodeImage(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
              'SHIPMENT_PACKAGES', 'WORLD_EASE_MAXICODE', FID, FWorldEaseMaxiCode, 2);
  finally
    CheckFreeDNetCOM(A);
  end;
end;

procedure TUPSPackageItem.CreateUSPSImage;
var
   A: Variant;
begin
  CheckCreateDNetCOM('IQMS.Barcode', 'IQMS.Barcode.GS128', A);
  try
    A.CreateGS128Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
            'SHIPMENT_PACKAGES', 'WORLD_EASE_MAXICODE', FID,
            '42056902' {+ LeftStr(FShipTo_PostalCode, 5)} + #200 + '92023' + FPicNo, 0.65);
  finally
    CheckFreeDNetCOM(A);
  end;
end;


procedure TUPSPackageItem.CreatePostalCodeImage;
var
   A: Variant;
   ASplit, i: Integer;
   AWorldEasePostalBarCode: String;
begin
{    i := 1;
    ASplit := 1;
    while ((i <= Length(APostalBarCode)) and not
     ((Integer(APostalBarCode[i]) < 48) or (Integer(APostalBarCode[i]) > 57))) do
        begin
          ASplit := i;
          i := i + 1;
        end;
    ASplit := ASplit - (ASplit mod 2);
    if (ASplit < Length(APostalBarCode)) then
      APostalBarCode := 'Ë' + LeftStr(APostalBarCode, ASplit) +
                        'É' + RightStr(APostalBarCode, Length(APostalBarCode) - ASplit)
    else
      APostalBarCode := 'Ë' + APostalBarCode;
 }
  CheckCreateDNetCOM('IQMS.Barcode', 'IQMS.Barcode.Code128', A);
  try

    A.CreateCode128Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
            'SHIPMENT_PACKAGES', 'POSTAL_CODE_IMAGE', FID, FPostalBarCode, 0.5);

    if (FOwner.WorldEase) then
    begin
      AWorldEasePostalBarCode := Format('421%s%s',[FOwner.WorldEase_Country3DigitCode, FOwner.WorldEase_PostalCode]);
      // No spaces, parentheses or dashes should be encoded into the bar code
      AWorldEasePostalBarCode := IQMS.Common.StringUtils.AlphaNumeric(AWorldEasePostalBarCode);

      A.CreateCode128Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
              'MASTER_SHIPMENT', 'POSTAL_CODE_IMAGE', FOwner.MasterShipmentID, AWorldEasePostalBarCode, 0.5);
    end;
  finally
    CheckFreeDNetCOM(A);
  end;
end;

procedure TUPSPackageItem.CreateTrackingNumberImage;
var
   A: Variant;
   ATrackingNo: String;
   ALastAlpha, i: Integer;
begin
  CheckCreateDNetCOM('IQMS.Barcode', 'IQMS.Barcode.Code128', A);
  try
      ATrackingNo := IQMS.Common.StringUtils.AlphaNumeric(FTrackingNo);

      for i := 1 to Length(ATrackingNo) do
        if ((Integer(ATrackingNo[i]) < 48) or (Integer(ATrackingNo[i]) > 57)) then
          ALastAlpha := i;
      ALastAlpha := ALastAlpha + ((Length(ATrackingNo) - ALastAlpha) mod 2);
      ATrackingNo := LeftStr(ATrackingNo, ALastAlpha) +
                     'Ë' + RightStr(ATrackingNo, Length(ATrackingNo) - ALastAlpha);

      A.CreateCode128Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
              'SHIPMENT_PACKAGES', 'TRACKING_NUMBER_IMAGE', FID, ATrackingNo, 0.75);
  finally
    CheckFreeDNetCOM(A);
  end;
end;



procedure TUPSPackageItem.CalcLabelName;
begin
  FLabelName := 'UPSExpress.qdf'; // default

  case Self.Service of
   upsNextDayAir,
   upsSecondDayAir,
   upsWorldwideExpress,
   upsWorldwideExpedited,
   upsThreeDaySelect,
   upsNextDayAirSaver,
   upsNextDayAirEarlyAM,
   upsWorldwideExpressPlus,
   upsSecondDayAirAM,
   upsWorldwideSaver:
    begin
      FLabelName := 'UPSExpress.qdf'; // default
    end;
   upsGround:
    begin
      FLabelName := 'UPSGround.qdf'; // default
    end;
   upsStandard:
    begin
      FLabelName := 'UPSStandard.qdf'; // default
    end;
   upsEconomy:
    begin
      FLabelName := 'UPSEconomy.qdf'; // default
    end;
  end; // end case
end;

procedure TUPSPackageItem.PopulatePackageRecord;
begin
     ExecuteCommandParam('update shipment_packages set'#13 +
                       'shipment_number = :SHIPMENT_NUMBER,'#13 +
                       'boxno = :BOXNO, box_count = :BOX_COUNT,'#13 +
                       'service_icon = :SERVICE_ICON,'#13 +
                       'doc_ind = :DOC_IND,'#13 +
                       'doc_options = :DOC_OPTIONS,'#13 +
                       'dim_weight = nvl(dim_weight, :DIM_WEIGHT)'#13 +
                       'where id = :ID',
                       ['SHIPMENT_NUMBER;STRING','BOXNO;FLOAT',
                       'BOX_COUNT;FLOAT', 'SERVICE_ICON;STRING',
                       'DOC_IND;STRING', 'DOC_OPTIONS;STRING',
                       ':DIM_WEIGHT;FLOAT', 'ID;FLOAT'],
                       [FShpNo, FBoxno, FBoxCount,  FServiceIcon,
                       FDocIndicator, FDocumentOptionsStr, FPkgDwt, FID]);

end;


{ TUPSTrackingNumberGenerator }

constructor TUPSTrackingNumberGenerator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Initialization
  FAccountNumber := '';
  FUPSService := TUPSService(0);
  FFromCountryCode := '';
  FToCountryCode := '';
  FSaturdayDelivery := False;
  FDeliveryConfirmation := False;
  FSignatureOption := TUPSSignatureOption(0);
  FReturnService := False;
  FImportControl := False;
  FPickupAttempts := 0;
  FReturnsExchange := False;
  FPackCollect := False;
  FFlexibleAccess := False;
  FProactiveResponse := False;
end;

procedure TUPSTrackingNumberGenerator.SetUPSService(
  const Value: TUPSService);
begin
  FUPSService := Value;
end;

procedure TUPSTrackingNumberGenerator.Calculate;
begin
  CalculateEx(FTrackingNumber);
end;

procedure TUPSTrackingNumberGenerator.CalculateEx(
  var ANewTrackingNumber: String);
var
   o: TUPSSrvRetrieval;
begin
  FixAccountNo;

 o :=  TUPSSrvRetrieval.Create(NIL); // ups_httplink_service.pas
 try
    // Supplied values
    o.SenderCountryCode := ShipFromCountryCode;
    o.RecipientCountryCode := ShipToCountryCode;
    o.UPSService := UPSService;
    o.SaturdayDelivery := SaturdayDelivery;
    o.DeliveryConfirmation := DeliveryConfirmation;
    o.SignatureOption := SignatureOption;
    o.ShipperRelease := ShipperRelease;
    o.ReturnService := ReturnService;
    o.FlexibleAccess := FlexibleAccess;
    o.ImportControl := ImportControl;
    o.PickupAttempts := PickupAttempts;
    o.COD := COD;
    o.ReturnsExchange := ReturnsExchange;
    o.PackCollect := PackCollect;
    o.ProactiveResponse := ProactiveResponse;
    // get values
    o.Execute;

    // Returned values
    FServiceIcon := o.ServiceIcon;
    FServiceIndicator := o.ServiceIndicator;
    FServiceClass := o.ServiceClass;

 finally
    o.Free;
 end;


 // Get the "check digit."  We pass everything except the '1Z' to the routine.
 FCheckDigit := GetCheckDigit(FAccountNumber +
                              FServiceIndicator +
                              FReferenceNumber);


  // Mask:
  //   '1Z 999 999 99 9999 9999'
  // Examples:
  //   1Z 123 456 78 1234 5678
  //   1Z 123 X56 66 0000 5628

  FTrackingNumber := Format('1Z %s %s %s%s',
   [FAccountNumber,
    FServiceIndicator,
    FReferenceNumber,
    FCheckDigit]);
  ANewTrackingNumber := FTrackingNumber;
end;

procedure TUPSTrackingNumberGenerator.FixAccountNo;
begin
  FAccountNumber := IQMS.Common.StringUtils.AlphaNumeric(FAccountNumber);
  FAccountNumber := Copy(FAccountNumber, 1,3) + ' ' + Copy(FAccountNumber, 4,3);
end;

procedure TUPSTrackingNumberGenerator.SetReferenceNumber(
  const Value: String);
var
   tmp: String;
begin
  tmp := IQMS.Common.StringUtils.LPadZero(Value, 7);
  tmp := Copy(tmp, 1,4) + ' ' + Copy(tmp, 5,3);
  FReferenceNumber := tmp;
end;

{ TUPSSEDOptions }

constructor TUPSSEDOptions.Create(AOwner: TUPSShipmentLabels);
begin
  inherited Create(AOwner);
  SEDType := sedNone;
  PartiesToTrans := sptNone;
  ExportInformationCode := 'OS';
  FRtTransInd := False;
end;

destructor TUPSSEDOptions.Destroy;
begin
  inherited Destroy;
end;

procedure TUPSSEDOptions.SetExpTxIDType(const Value: TExporterTaxIDType);
begin
  FExpTxIDType := Value;
  FExpTxIDCode := ExporterTaxIDTypeCode[Ord(Value)];
end;

procedure TUPSSEDOptions.SetFPtTrans(const Value: TSEDPartiesToTrans);
begin
  FPtTrans := Value;
  FPtTransCode := #0;
  case Value of
   sptNone: FPtTransCode := #32;
   sptRelated: FPtTransCode := 'R';
   sptNonRelated: FPtTransCode := 'N';
  end; // end case
end;

procedure TUPSSEDOptions.SetSEDType(const Value: TSEDFiledType);
begin
  FSEDType := Value;
  FTypeChar := SEDFiledType[Value];
end;

procedure TUPSSEDOptions.Validate;
begin
{
    property SEDType: TSEDFiledType read FSEDType write SetSEDType;
    property SEDTypeChar: Char read FTypeChar;
    property AESTransactionNumber: Code28String read FAESNo write FAESNo;
    property TaxIDNumber: Code28String read FTaxID write FTaxID;
    property ExportInformationCode: Code2String read FExpCode write FExpCode;

    // This information should be provided if the SED Code = D or U
    property PartiesToTrans: TSEDPartiesToTrans read FPtTrans write SetFPtTrans;
    property PartiesToTransCode: Char read FPtTransCode;
    property RoutedTransactionInd: Boolean read FRtTransInd write FRtTransInd;

    // Required when the SEDCode =D, E, P or U
    // Type of Exporter Tax ID.  Currently used for US and PR origins only.
    property ExporterTaxIDType: TExporterTaxIDType read FExpTxIDType write SetExpTxIDType;
    property ExporterTaxIDTypeCode: Code2String read FExpTxIDCode;

}
  if FSEDType = sedNone then Exit;

  if (FSEDType = sedElectronicPreDeparture) and
     (Trim(FAESNo)='') then
     raise Exception.CreateFmt('An AES Number must be provided for SED type, ' +
      '''%s''',[SEDFiledTypeDescription[FSEDType]]);

  {Currently used for US and PR origins only. Identifies the shipper and
   consignee/importer as related or nonrelated, as indicated on the waybill
   and/or SED.  This information should be provided if the SED Code = D or U.}
  if (FSEDType in [sedWithExportDocuments,sedUPSPrepared]) and
     (FPtTrans = sptNone) then
     FPtTrans := sptRelated;

  {Required when the SEDCode = D or U.}
  if (FSEDType in [sedWithExportDocuments,sedUPSPrepared]) and
     (FExpCode = '') then
     raise Exception.CreateFmt('An Export Information code must be provided for SED type, ' +
      '''%s''',[SEDFiledTypeDescription[FSEDType]]);

  if (FSEDType in [sedWithExportDocuments,
                   sedElectronicPreDeparture,
                   sedElectronicPostDeparture,
                   sedUPSPrepared]) then
      begin
        if (Trim(FTaxID) = '') then
           raise Exception.CreateFmt('An Tax ID Number must be provided ' +
            'for SED type, ''%s''', [SEDFiledTypeDescription[FSEDType]]);

        if not (FExpTxIDType in [xtiDUNS, xtiEIN]) then
           raise Exception.CreateFmt('Invalid Tax ID type (%s) for SED Type (%s).',
            [ExporterTaxIDTypeDescription[FExpTxIDType],
             SEDFiledTypeDescription[FSEDType]]);
     end;

end;

{ TPickupSummaryBarcodeReport }

constructor TPickupSummaryBarcodeReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PLDStatus := plsUploaded;
  FDeclaredValue := 0;
  FPackageCounts := TPickupSummaryPackageCount.Create(Self);
  FPrintDestination :=  TUPSPrintDestination(0);
  FPrinterType := uptZebra;
end;

destructor TPickupSummaryBarcodeReport.Destroy;
begin
  if Assigned(FPackageCounts) then FreeAndNil(FPackageCounts);
  inherited Destroy;
end;

procedure TPickupSummaryBarcodeReport.Execute;
begin
  CalcShippingRecordNumber;
  CalcBarCode;
  CalcVendorCtrlNo;
  Validate;
  ExecPrint;
end;

procedure TPickupSummaryBarcodeReport.Validate;
begin
  Check(Trunc(FShipmentDate) > 0, 'Shipment Date is required.');
  Check(Trim(FShippingRecordNumber) > '', 'Shipping Record Number is required.');
  Check(Trim(FAccountNumber) > '', 'Account Number is required.');
  Check(Trim(FBarCode) > '', 'Application Error: Bar Code undetermined.');
  Check(Trim(FPrinterName) > '', 'Printer name is required.');
  Check(Trim(FRoutingCodeVersion) > '', 'Routing Code version is required.');
end;

procedure TPickupSummaryBarcodeReport.Check(const ACondition: Boolean;
 AMsg: String);
begin
  // Local version of "Assert" method, but without the component
  // name in the msg.
  if not ACondition then
     RaiseBuildError(AMsg);
end;

procedure TPickupSummaryBarcodeReport.RaiseBuildError(const AMsg: String);
begin
  raise Exception.CreateFmt(
    'Error building Pickup Summary Barcode Report:'#13'%s',
    [AMsg]);
end;

procedure TPickupSummaryBarcodeReport.GetSenderAddressLines(var ALines: TStringList);
//var
   //o: TAddressFormatter;
begin
  if not Assigned(ALines) then
     Exit;
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  try
     o := TAddressFormatter.Create(NIL);

     // Either/or, but not both
     if FShipFrom_Contact > '' then
        o.ContactName := FShipFrom_Contact
     else
        o.Company := FShipFrom_Company;

     o.Address1 := FShipFrom_Addr1;
     o.Address2 := FShipFrom_Addr2;
     o.City :=  FShipFrom_City;
     o.StateRegionOrProvince := FShipFrom_State;
     o.PostalCode := FShipFrom_PostalCode;
     o.Country := FShipFrom_Country;
     o.AllCaps := True;
     o.IncludeCountry := False;
     o.Execute;
     ALines.Text := o.Formatted.Text;
  finally
     if Assigned(o) then FreeAndNil(o);
  end;
  }
end;

procedure TPickupSummaryBarcodeReport.GetLabelLines_EPL(
  var ALines: TStringList);
const
   // "Packages by Service" starting top position
   PKG_BY_SVC_START_TOP = 887;
   // Increment value for "Packages by Service" top position
   PKG_BY_SVC_INC_TOP = 36; // 40;
var
   APkgDtlTop: Integer; // top value, for itemizing pkg counts
   tmp: String;
   i, x: Integer;
   sl: TStringList;

  // ---------------------------------------------------------------------------
  procedure _AddPackageCount(ACode: String; ACount: Integer);
  begin
    // Add an itemized package count (standard method)
    ALines.Add(Format('A22,%d,0,4,1,1,N,"%s"',[APkgDtlTop, ACode]));
    ALines.Add(Format('A117,%d,0,4,1,1,N,"%d"',[APkgDtlTop, ACount]));
    APkgDtlTop := APkgDtlTop + PKG_BY_SVC_INC_TOP;
  end;
  // ---------------------------------------------------------------------------
  procedure _AddIntlAndShipmentCount(AIntlCount, AShpCount: Integer);
  begin
    // Add international package count

    ALines.Add(Format('A260,%d,0,4,1,1,N,"INT''L pkgs"',
     [PKG_BY_SVC_START_TOP]));
    ALines.Add(Format('A426,%d,0,4,1,1,N," %d "',
     [PKG_BY_SVC_START_TOP, AIntlCount]));
    ALines.Add(Format('A558,%d,0,4,1,1,N,"/shpts %d"',
     [PKG_BY_SVC_START_TOP, AShpCount]));
  end;
  // ---------------------------------------------------------------------------
  procedure _AddPackageCountCOD(ACount: Integer);
  begin
    // Add C.O.D. package count

    ALines.Add(Format('A260,%d,0,4,1,1,N,"CODS"',
     [PKG_BY_SVC_START_TOP + PKG_BY_SVC_INC_TOP]));
    ALines.Add(Format('A440,%d,0,4,1,1,N,"%d"',
     [PKG_BY_SVC_START_TOP + PKG_BY_SVC_INC_TOP, ACount])); // C.O.D. count.
  end;
  // ---------------------------------------------------------------------------

begin
  if not Assigned(ALines) then Exit;

  // Initialization
  APkgDtlTop := 0;
  ALines.Clear;

  // Label header
  ALines.Add('N');
  ALines.Add('Q1219,24');
  ALines.Add('R15,0');
  ALines.Add('S3');
  ALines.Add('D11');
  ALines.Add('ZB');
  ALines.Add('I8,1');

  // Report title
  ALines.Add('A10,20,0,4,1,1,N,"PICKUP SUMMARY BARCODE REPORT"');

  // Ship Date
  ALines.Add('A10,60,0,3,1,1,N,"SHIP DATE"');
  ALines.Add(Format('A178,60,0,4,1,1,N,"%s"', [FShipmentDateStr]));
  // Shipping Record
  ALines.Add('A10,100,0,3,1,1,N,"SHIPPING RECORD:"');
  ALines.Add(Format('A282,100,0,4,1,1,N,"%s"',[FShippingRecordNumber]));
  // Account Number
  ALines.Add('A10,140,0,3,1,1,N,"ACCOUNT NUMBER:"');
  ALines.Add(Format('A282,140,0,4,1,1,N,"%s"',[FAccountNumber]));

  // Customer label line (preceeds address)
  ALines.Add('A10,180,0,3,1,1,N,"CUSTOMER"');

  // Sender Address Block
  try
     sl := TStringList.Create;
     //tmp := ConcatCityStateZip
     //              (FShipFrom_City,
     //               IQMS.Common.StringUtils.LeftStr(FShipFrom_State,2),
     //               IQMS.Common.StringUtils.LeftStr(FShipFrom_PostalCode,16));
     // Note:  Only allowed 4 lines
     GetSenderAddressLines(sl);
     //CompileList([IQMS.Common.Numbers.sIIf(FShipFrom_Contact > '',
     //                           IQMS.Common.StringUtils.LeftStr(FShipFrom_Contact, 35),
     //                           IQMS.Common.StringUtils.LeftStr(FShipFrom_Company, 35)),
     //             IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr1, 35),
     //             IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr2, 35),
     //             tmp],
     //             sl);

     // initialize top position
     x := 220;
     for i := 0 to sl.Count - 1 do
      begin
         ALines.Add(Format('A47,%d,0,3,1,1,N,"%s"',
          [x, FixEPLStr(FixHyphens(sl.Strings[i]))]));
         x := x + 38;
      end;

  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;

  // Thick horizontal line
  ALines.Add('LE0,379,797,20');

  //A10,207,0,3,1,1,N,"
  // * Pickup Summary Barcode Block *
  // 1. Human-readable text (e.g., '91 000 000 1234 56789 12345 8')
  ALines.Add(Format('A160,427,0,4,1,1,N,"%s"', [FBarCode]));
  // 2. Barcode (e.g., '91000000123456789123458')
//  ALines.Add(Format('B50,477,0,1,4,12,198,N,"%s"',
  ALines.Add(Format('B50,467,0,1,3,8,194,N,"%s"',
   [IQMS.Common.StringUtils.AlphaNumeric(FBarCode)]));

  // 3. Thick horizontal line
  ALines.Add('LE0,680,797,20');

  // * Driver Summary Block *
  // 1. Title
  ALines.Add('A20,708,0,5,1,1,N,"DRIVER SUMMARY"');

  // 2. Total number of packages (nn,nnn)
  ALines.Add(Format('A20,787,0,4,1,1,N,"TOTAL NUMBER OF PACKAGES = %s"',
   [FormatFloat('#,###', FBoxCount)]));

  // 3.  Declared value packages
  {a separate UPS Control Log report (also known as a UPS High Value Report)
   is required for packages with a declared value greater than $999.99 (U.S.)
   or equivalent.  When these packages are tendered to UPS, the Pickup Summary
   Bar Code Report must included the following text:  UPS CONTROL LOG REQUIRED.}
  if FDeclaredValue >= 1000 then
     ALines.Add('A20,823,0,4,1,1,N,"UPS CONTROL LOG REQUIRED"');

  // 4. Total number of packages by service
  APkgDtlTop := PKG_BY_SVC_START_TOP; // initial top value, for the first line
  _AddPackageCount('1DA' {Code}, FPackageCounts.Count1DA {Pkg Count});
  _AddPackageCount('2DA' {Code}, FPackageCounts.Count2DA {Pkg Count});
  _AddPackageCount('3DS' {Code}, FPackageCounts.Count3DS {Pkg Count});
  _AddIntlAndShipmentCount(FPackageCounts.InternationalCount,
                           FPackageCounts.ShipmentCount);
  _AddPackageCountCOD(FPackageCounts.CODCount);

  // Service agreement text

  ALines.Add('A30,1018,0,3,1,1,N,"SHIPMENTS SUBJECT TO TERMS OF AGREEMENT ON FILE"');
  // Line
  ALines.Add('LE0,1040,797,2');

  // Shipper Receipt
  ALines.Add('A12,1085,0,3,1,1,N,"Received By:"');
  ALines.Add('LE180,1113,340,2'); // Line
  ALines.Add('A12,1135,0,3,1,1,N,"Pickup Time:"');
  ALines.Add('LE180,1163,340,2'); // Line
  ALines.Add('A539,1135,0,3,1,1,N,"Pkgs:"');
  ALines.Add('LE600,1163,120,2'); // Line
  if (FPLDStatus in [plsNotUploaded1Day,plsNotUploaded2Days,
      plsNotUploaded3Days,plsPendingError]) then
      ALines.Add('A539,1085,0,3,1,1,N,"PENDING PLD"');

  // Vendor Control Number
  x := 598 - (Length(FVendorControlNumber) * 8);
  ALines.Add(Format('A%d,1193,0,2,1,1,N,"%s"',[x, FVendorControlNumber]));

  // Footer
  ALines.Add('P1,1');
end;

procedure TPickupSummaryBarcodeReport.GetLabelLines_ZPL(
  var ALines: TStringList);
const
   // "Packages by Service" starting top position
   PKG_BY_SVC_START_TOP = 887;
   // Increment value for "Packages by Service" top position
   PKG_BY_SVC_INC_TOP = 36; // 40;
var
   APkgDtlTop: Integer; // top value, for itemizing pkg counts
   tmp: String;
   i, x: Integer;
   sl: TStringList;

  // ---------------------------------------------------------------------------
  procedure _AddPackageCount(ACode: String; ACount: Integer);
  begin
    // Add an itemized package count (standard method)
    ALines.Add(Format('^FT22,%d^A0N,30,34^FV%s^FS',[APkgDtlTop, ACode]));
    ALines.Add(Format('^FT117,%d^A0N,30,34^FV%d^FS',[APkgDtlTop, ACount]));
    APkgDtlTop := APkgDtlTop + PKG_BY_SVC_INC_TOP;
  end;
  // ---------------------------------------------------------------------------
  procedure _AddIntlAndShipmentCount(AIntlCount, AShpCount: Integer);
  begin
    // Add international package count
    ALines.Add(Format('^FT260,%d^A0N,30,34^FVINT''L pkgs^FS',
     [PKG_BY_SVC_START_TOP]));
    ALines.Add(Format('^FT426,%d^A0N,30,34^FV %d ^FS',
     [PKG_BY_SVC_START_TOP, AIntlCount]));
    ALines.Add(Format('^FT558,%d^A0N,30,34^FV/shpts %d^FS',
     [PKG_BY_SVC_START_TOP, AShpCount]));
  end;
  // ---------------------------------------------------------------------------
  procedure _AddPackageCountCOD(ACount: Integer);
  begin
    // Add C.O.D. package count
    ALines.Add(Format('^FT260,%d^A0N,30,34^FVCODS^FS',
     [PKG_BY_SVC_START_TOP + PKG_BY_SVC_INC_TOP]));
    ALines.Add(Format('^FT440,%d^A0N,30,34^FV%d^FS',
     [PKG_BY_SVC_START_TOP + PKG_BY_SVC_INC_TOP, ACount])); // C.O.D. count.
  end;
  // ---------------------------------------------------------------------------
  //function _PkgCode

begin
  if not Assigned(ALines) then Exit;

  // Initialization
  APkgDtlTop := 0;
  ALines.Clear;

  // Label header
  ALines.Add('~CC^~CD,~CT~^IDR:*.*^XA^LH0,0^PW791^MMT~TA000');
  ALines.Add('^MTD~SD15^LT0^PR5,5,5^POI^PMN^LRN^LH10,10');
  ALines.Add('^CI27');
  ALines.Add('^CI27');

  // Report title
  ALines.Add('^FT10,47^A0N,30,34^FVPICKUP SUMMARY BARCODE REPORT^FS');
  // Ship Date
  ALines.Add('^FT10,87^A0N,30,30^FVSHIP DATE: ^FS');
  ALines.Add(Format('^FT178,87^A0N,30,34^FV%s^FS', [FShipmentDateStr]));
  // Shipping Record
  ALines.Add('^FT10,127^A0N,30,30^FVSHIPPING RECORD:  ^FS');
  ALines.Add(Format('^FT282,127^A0N,30,34^FV%s^FS',[FShippingRecordNumber]));
  // Account Number
  ALines.Add('^FT10,167^A0N,30,30^FVACCOUNT NUMBER:   ^FS');
  ALines.Add(Format('^FT282,167^A0N,30,34^FV%s^FS^',[FAccountNumber]));
  // Customer label line (preceeds address)
  ALines.Add('FT10,207^A0N,30,30^FVCUSTOMER^FS');

  // Sender Address Block
  try
     sl := TStringList.Create;
     GetSenderAddressLines(sl);
     // tmp := ConcatCityStateZip
     //               (FShipFrom_City,
     //                IQMS.Common.StringUtils.LeftStr(FShipFrom_State,2),
     //                IQMS.Common.StringUtils.LeftStr(FShipFrom_PostalCode,16));
     // Note:  Only allowed 4 lines
     // CompileList([IQMS.Common.Numbers.sIIf(FShipFrom_Contact > '',
     //                            IQMS.Common.StringUtils.LeftStr(FShipFrom_Contact, 35),
     //                            IQMS.Common.StringUtils.LeftStr(FShipFrom_Company, 35)),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr1, 35),
     //              IQMS.Common.StringUtils.LeftStr(FShipFrom_Addr2, 35),
     //              tmp],
     //              sl);

     // initialize top position
     x := 246;
     for i := 0 to sl.Count - 1 do
      begin
         ALines.Add(Format('^FT47,%d^A0N,30,30^FV%s^FS',
          [x, FixHyphens(sl.Strings[i])]));
         x := x + 38;
      end;

  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;

  // Thick horizontal line
  ALines.Add('^FO0,380^GB797,13,13^FS');

  // * Pickup Summary Barcode Block *
  // 1. Human-readable text (e.g., '91 000 000 1234 56789 12345 8')
  ALines.Add(Format('^FT160,437^A0N,30,34^FV%s^FS', [FBarCode]));
  // 2. Barcode (e.g., '91000000123456789123458')
  ALines.Add(Format('^FT50,657^BY3^BCN,197,N,N,,A^FV%s^FS',
   [IQMS.Common.StringUtils.AlphaNumeric(FBarCode)]));
  // 3. Thick horizontal line
  ALines.Add('^FO0,680^GB797,13,13^FS');

  // * Driver Summary Block *
  // 1. Title
  ALines.Add('^FT20,753^A0N,60,64^FVDRIVER SUMMARY^FS');

  // 2. Total number of packages (nn,nnn)
  ALines.Add(Format('^FT20,787^A0N,30,34^FVTOTAL NUMBER OF PACKAGES = %s^FS',
   [FormatFloat('#,###', FBoxCount)]));

  // 3.  Declared value packages
  {a separate UPS Control Log report (also known as a UPS High Value Report)
   is required for packages with a declared value greater than $999.99 (U.S.)
   or equivalent.  When these packages are tendered to UPS, the Pickup Summary
   Bar Code Report must included the following text:  UPS CONTROL LOG REQUIRED.}
  if FDeclaredValue >= 1000 then
     ALines.Add('^FT20,823^A0N,30,34^FVUPS CONTROL LOG REQUIRED^FS');

  // 4. Total number of packages by service
  APkgDtlTop := PKG_BY_SVC_START_TOP; // initial top value, for the first line
  _AddPackageCount('1DA' {Code}, FPackageCounts.Count1DA {Pkg Count});
  _AddPackageCount('2DA' {Code}, FPackageCounts.Count2DA {Pkg Count});
  _AddPackageCount('3DS' {Code}, FPackageCounts.Count3DS {Pkg Count});
  _AddIntlAndShipmentCount(FPackageCounts.InternationalCount,
                           FPackageCounts.ShipmentCount);
  _AddPackageCountCOD(FPackageCounts.CODCount);

  // Service agreement text
  ALines.Add('^FT30,1018^A0N,24,28^FVSHIPMENTS SUBJECT TO TERMS OF AGREEMENT ON FILE^FS');
  // Line
  ALines.Add('^FO0,1035^GB797,3,3^FS');
  // Shipper Receipt
  {tmp := Repl('_', 34);
  if (FPLDStatus in [plsNotUploaded1Day,plsNotUploaded2Days,
      plsNotUploaded3Days,plsPendingError]) then
      tmp := Format('%s  PENDING PLD',[Repl('_', 21)]);
  ALines.Add(Format('^FT12,1085^A0N,28,32^FVReceived By:%s^FS', [tmp]));
  ALines.Add(Format('^FT12,1135^A0N,28,32^FVPickup Time:%s^FS', [Repl('_', 21)]));
  ALines.Add('^FT539,1135^A0N,28,32^FVPkgs:_______^FS');
  }

  // Shipper Receipt
  ALines.Add('^FT12,1085^A0N,28,32^FVReceived By:^FS');
  ALines.Add('^FO180,1085^GB340,0,2^FS'); // line
  ALines.Add('^FT12,1135^A0N,28,32^FVPickup Time:^FS');
  ALines.Add('^FO180,1135^GB340,0,2^FS'); // line
  ALines.Add('^FT539,1135^A0N,28,32^FVPkgs:^FS');
  ALines.Add('^FO620,1135^GB120,0,2^FS'); // line
  if (FPLDStatus in [plsNotUploaded1Day,plsNotUploaded2Days,
      plsNotUploaded3Days,plsPendingError]) then
      ALines.Add('^FT539,1085^A0N,28,32^FVPENDING PLD^FS');

  // Vendor Control Number
  x := 770 - (Length(FVendorControlNumber)*12);
  x := Max(10, x);
  ALines.Add(Format('^ADN,0,0^FO%d,1182^FD%s^FS',[x, FVendorControlNumber]));

  // Label footer
  ALines.Add('^PQ1,0,0,Y^XZ');
end;

procedure TPickupSummaryBarcodeReport.ExecPrint;
var
   ALines: TStringList;
   dir, fn: String;
begin
  try
     ALines := TStringList.Create;

     case FPrinterType of
      uptEltron: GetLabelLines_EPL(ALines);
      uptZebra: GetLabelLines_ZPL(ALines);
      uptUniMark: ;
     end;

     case FPrintDestination of
      updTextFile:
       begin
         if FLabelFileName > '' then
            ALines.SaveToFile(FLabelFileName);
       end
     else
     { TODO -ombaral -cWebIQ : Need to resolve dependency
       prn_share.PrintBinary(ALines, 'UPS Pickup Summary Barcode Report',
        FPrinterName);
       }
     end; // end case
  finally
     if Assigned(ALines) then FreeAndNil(ALines);
  end;
end;

procedure TPickupSummaryBarcodeReport.CalcVendorCtrlNo;
begin
  FVendorControlNumber := Format('%s %s %s',
     [ups_httplink_const.SHIPPING_SOFTWARE_VERSION,
      PrinterName, // printer make and model
      RoutingCodeVersion]);
end;

procedure TPickupSummaryBarcodeReport.SetShipmentDate(
  const Value: TDateTime);
begin
  FShipmentDate := Value;
  // Note:  The date format is strange, but that is how it's documented.
  // Example:  'JUN 28, 2008'
  FShipmentDateStr := UpperCase(FormatDateTime('mmm dd, yyyy', Value));
end;

procedure TPickupSummaryBarcodeReport.CalcShippingRecordNumber;
const
   ChkTable: array[0..6] of Double =
     (0.00000, 0.14286, 0.28571, 0.42857, 0.57143, 0.71429, 0.85714);
var
   tmp: String;
   chkDigit: Byte;

   function _GetChkDigit(const AValue: Double): Byte;
   var
      j: Integer;
      r: Double;
   begin
     Result := 0;
     r := Frac(AValue);
     for j := 0 to 6 do
      if r = ChkTable[j] then
         begin
           Result := j;
           Break;
         end;
   end;

begin
  // Validation
  Check(Trunc(FBookNumber) > 0, 'Book Number required.');
  Check(Trunc(FPageNumber) > 0, 'Page Number required.');

  // Get the "check digit"
  chkDigit := _GetChkDigit((FBookNumber + FPageNumber)/ 7);
  // Get the string value
  tmp := Format('%d%d%d', [FBookNumber,FPageNumber,chkDigit]);
  // Format the string value
  FShippingRecordNumber := MaskUtils.FormatMaskText('AAAA AAAA AA;0', tmp);
end;

procedure TPickupSummaryBarcodeReport.SetAccountNumber(
  const Value: String);
var
   tmp: String;
begin
  tmp := IQMS.Common.StringUtils.AlphaNumeric(Value);
  FAccountNumber := MaskUtils.FormatMaskText('AAA-AAA;0', tmp);
end;

procedure TPickupSummaryBarcodeReport.SetPLDStatus(
  const Value: TPLDUploadStatus);
begin
  FPLDStatus := Value;
  case Value of
   plsUploaded: FPLDIdentifier := '91';          // Successful upload of PLD   91
   plsNotUploaded1Day: FPLDIdentifier := '90';  // 1 day PLD not uploaded     90
   plsNotUploaded2Days: FPLDIdentifier := '92'; // 2 days PLD not uploaded    92
   plsNotUploaded3Days: FPLDIdentifier := '93'; // 3 days PLD not uploaded    93
   plsPendingError: FPLDIdentifier := '94';     // PLD pending, UPS error     94
  end;
end;

procedure TPickupSummaryBarcodeReport.CalcBarCode;
var
   tmp,
   AAccount,
   ABookPage,
   APkgCount,
   AChkDigit: String;
begin
  tmp := IQMS.Common.StringUtils.AlphaNumeric(FAccountNumber);
  AAccount := MaskUtils.FormatMaskText('AAA AAA;0', tmp);

  // Get the string value
  tmp := Format('%d%d', [FBookNumber,FPageNumber]);
  // Format the string value
  ABookPage := MaskUtils.FormatMaskText('AAAA AAAAA;0', tmp);

  APkgCount := IQMS.Common.StringUtils.LPadZero(IntToStr(FBoxCount), 5);

  AChkDigit := GetCheckDigit(AAccount +
                             ABookPage +
                             APkgCount);


  FBarCode := Format('%s %s %s %s %s',
   [FPLDIdentifier, AAccount, ABookPage, APkgCount, AChkDigit]);
end;

{ TPickupSummaryPackageCount }

constructor TPickupSummaryPackageCount.Create(
  const AOwner: TPickupSummaryBarcodeReport);
begin
  inherited Create(AOwner);

  // Intialization
  Clear;
end;

procedure TPickupSummaryPackageCount.AddService(
  const AService: TUPSService; const ACount: Integer;
  AForceAsInternational: Boolean);
begin
  case AService of
   upsNextDayAirEarlyAM, upsNextDayAir, upsNextDayAirSaver:
    Inc(FCount1DA, ACount);
   upsSecondDayAir, upsSecondDayAirAM:
    Inc(FCount2DA, ACount);
   upsThreeDaySelect:
    Inc(FCount3DS, ACount);
  else
    Inc(FCountOther, ACount);
  end;

  if AForceAsInternational or IsInternationalService(AService) then
     Inc(FIntlPkgCount, ACount);
end;

procedure TPickupSummaryPackageCount.AddServiceInternational(
  const AService: TUPSService; const ACount: Integer);
begin
  AddService(AService, ACount);
  // Reverse logic: if this is not an international service, then
  // increment the count.  Why? If it is an international service,
  // then the call to AddService() will already have incremented
  // the FIntlPkgCount.  But in this method we want to increment
  // the FIntlPkgCount regardless.
  if not IsInternationalService(AService) then
     Inc(FIntlPkgCount);
end;

function TPickupSummaryPackageCount.IsInternationalService(
 const AService: TUPSService): Boolean;
begin
  Result := AService in [upsWorldwideExpress,
                         upsWorldwideExpedited,
                         upsWorldwideExpressPlus,
                         upsWorldwideExpressNA1,
                         upsWorldwideSaver,
                         upsStandard,
                         upsEconomy];
end;

function TPickupSummaryPackageCount.GetTotalCount: Integer;
begin
  Result := FCount1DA + FCount2DA + FCount3DS + FCountOther;
end;

procedure TPickupSummaryPackageCount.Clear;
begin
  FCount1DA := 0;
  FCount2DA := 0;
  FCount3DS := 0;
  FCountOther := 0;
  FShipmentCount := 0;
  FIntlPkgCount := 0;
  FCODCount := 0;
end;

{ TZPLPrint }

constructor TZPLPrint.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLines := TStringList.Create;
  FFinalLines := TStringList.Create;
end;

destructor TZPLPrint.Destroy;
begin
  if Assigned(FLines) then FreeAndNil(FLines);
  if Assigned(FFinalLines) then FreeAndNil(FFinalLines);
  inherited Destroy;
end;

procedure TZPLPrint.Clear;
begin
  FLines.Clear;
  FFinalLines.Clear;
end;

procedure TZPLPrint.Execute;
begin
  FFinalLines.Clear;
  AddHeader;
  FFinalLines.AddStrings(FLines);
  AddFooter;
end;

procedure TZPLPrint.AddHeader;
begin
  // We modify FFinalLines
  FFinalLines.Add('~CC^~CD,~CT~^IDR:*.*^XA^LH0,0^PW791^MMT~TA000');
  FFinalLines.Add('^MTD~SD15^LT0^PR5,5,5^POI^PMN^LRN^LH10,10');
  FFinalLines.Add('^CI27');
  FFinalLines.Add('^CI27');
end;

procedure TZPLPrint.AddFooter;
begin
  // Add footer to FFinalLines
  FFinalLines.Add('^XZ');
end;

procedure TZPLPrint.Add(S: String);
begin
  FLines.Add(FixHyphens(S));
end;

procedure TZPLPrint.AddText(const AText: String; const ALeft,
  ATop: Integer; const AStyle: TPrinterFontStyle);
const
  BASE_CHAR_HEIGHT = 9;
  BASE_CHAR_WIDTH = 5;
var
   tmp: String;
begin
  case AStyle of
    pfsSmall:
      //tmp := Format('^FO%d,%d^ADN,0,0^FD%s^FS',[ALeft, ATop, AText]);
      tmp := Format('^FO%d,%d^A0N,16,16^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal6:
      tmp := Format('^FO%d,%d^A0N,20,20^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal8:
      tmp := Format('^FO%d,%d^A0N,24,24^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal10:
      tmp := Format('^FO%d,%d^A0N,28,30^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal12:
      tmp := Format('^FO%d,%d^A0N,30,35^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal14:
      tmp := Format('^FO%d,%d^A0N,45,45^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal16:
      tmp := Format('^FO%d,%d^A0N,50,50^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal20:
      tmp := Format('^FO%d,%d^A0N,53,53^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal30:
      tmp := Format('^FO%d,%d^A0N,80,70^FD%s^FS',[ALeft, ATop, AText]);
    pfsNormal40:
      tmp := Format('^FO%d,%d^A0N,100,80^FD%s^FS',[ALeft, ATop, AText]);
  end;

  FLines.Add(FixHyphens(tmp));

{
  case AStyle of
   pfsSmall:
    tmp := Format('^FO%d,%d^ADN,0,0^FD%s^FS',[ALeft, ATop, AText]);
   pfsNormal10:
    tmp := Format('^FO%d,%d^A0N,24,24^FD%s^FS',[ALeft, ATop, AText]);
   pfsBold10:
    tmp := Format('^FO%d,%d^A0N,28,28^FD%s^FS',[ALeft, ATop, AText]);
   pfsNormal12:
    tmp := Format('^FO%d,%d^A0N,28,35^FD%s^FS',[ALeft, ATop, AText]);
   pfsBold12:
    tmp := Format('^FO%d,%d^A0N,28,35^FD%s^FS',[ALeft, ATop, AText]);
   pfsNormal14:
    tmp := Format('^FO%d,%d^A0N,30,30^FD%s^FS',[ALeft, ATop, AText]);
   pfsBold14:
    tmp := Format('^FO%d,%d^A0N,48,42^FD%s^FS',[ALeft, ATop, AText]);
   pfsNormal16:
    tmp := Format('^FO%d,%d^A0N,53,53^FD%s^FS',[ALeft, ATop, AText]);
   pfsBold16:
    tmp := Format('^FO%d,%d^A0N,53,53^FD%s^FS',[ALeft, ATop, AText]);
   pfsNormal20:
    tmp := Format('^FO%d,%d^A0N,80,71^FD%s^FS',[ALeft, ATop, AText]);
   pfsBold20:
    tmp := Format('^FO%d,%d^A0N,80,71^FD%s^FS',[ALeft, ATop, AText]);
  end; }
end;

procedure TZPLPrint.BlackSquare(const ALeft, ATop, ASize: Integer);
begin
  FLines.Add(Format('^FO%d,%d^GB%d,%d,%d^FS',
   [ALeft, ATop, ASize, ASize, ASize]));
end;

procedure TZPLPrint.ThickHorizontalLine(const ATop: Integer);
begin
  FLines.Add(Format('^FO0,%d^GB797,0,13^FS',[ATop]));
end;

procedure TZPLPrint.ThinHorizontalLine(const ATop: Integer);
begin
  FLines.Add(Format('^FO0,%d^GB797,0,2^FS',[ATop]));
end;

procedure TZPLPrint.ThinVerticalLine(const ALeft, ATop, AHeight: Integer);
begin
  FLines.Add(Format('^FO%d,%d^GB0,%d,2^FS',[ALeft, ATop, AHeight]));
end;

{ TPDF417 }

procedure TPDF417.AddPackage(APackage: TPackage);
var
  APackageClass: TPackageClass;
begin
  APackageClass := TPackageClass.Create(Self, APackage);
  APackageClass.FillPackageOptionsUPS;
  FPackages.Add(APackageClass);
end;


procedure TPDF417.GetPackageFromQuery(APackageID: Real;
 var APackage: TPackage);
var
   AParamStr: String;
begin
  // Fill record with Package data from query
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add('SELECT * ');
     SQL.Add('FROM SHIPMENT_PACKAGES');
     SQL.Add(Format('WHERE ID = %.0f',[APackageID]));
     Open;

     APackage.ID                     := FieldByName('ID').AsFloat                   ;
     APackage.SourceID               := FieldByName('SOURCE_ID').AsFloat            ;
     APackage.Source                 := FieldByName('SOURCE').AsString              ;
     APackage.CarrierID              := FieldByName('CARRIER_ID').AsFloat           ;
//     APackage.Carrier                := CarrierTypeFromID(APackage.CarrierID)       ;
     // see below for account data
     APackage.Length                 := FieldByName('LENGTH').AsFloat               ;
     APackage.Width                  := FieldByName('WIDTH').AsFloat                ;
     APackage.Height                 := FieldByName('HEIGHT').AsFloat               ;
     APackage.Girth                  := FieldByName('GIRTH').AsFloat               ;
     APackage.DimensionUOM           := FieldByName('DIMENSION_UOM').AsString       ;
     APackage.PackageSizeType        := FieldByName('PACKAGE_SIZE_TYPE').AsInteger  ;
     APackage.DeclaredValue          := FieldByName('DECLARED_VALUE').AsFloat       ;
     APackage.ActualWeight           := FieldByName('ACTUAL_WEIGHT').AsFloat        ;
     APackage.BillableWeight         := FieldByName('BILLABLE_WEIGHT').AsFloat      ;
     APackage.DimensionalWeight      := FieldByName('DIM_WEIGHT').AsFloat      ;
     APackage.WeightUOM              := FieldByName('WEIGHT_UOM').AsString          ;
     APackage.ActualCost             := FieldByName('PACKAGE_COST').AsFloat         ;
     APackage.BillableCost           := FieldByName('TOTAL_COST').AsFloat           ;
     APackage.OptionsCost            := FieldByName('OPTIONS_COST').AsFloat         ;
     APackage.CurrencyCode           := FieldByName('CURRENCY_CODE').AsString       ;
     APackage.ServiceCode            := FieldByName('SERVICE_CODE').AsString        ;
     APackage.ServiceCodeDescription := FieldByName('SERVICE_DESCRIP').AsString     ;
     APackage.ServiceIcon            := FieldByName('SERVICE_ICON').AsString        ;
     APackage.ServiceClass           := FieldByName('SERVICE_CLASS').AsString       ;
     APackage.PackageCode            := FieldByName('PACKAGE_CODE').AsString        ;
     APackage.PackageCodeDescription := FieldByName('PACKAGE_DESCRIP').AsString     ;
     //APackage.PickupCode             :=
     //APackage.PickupCodeDescription  :=
     APackage.PayorType              := FieldByName('BILLING_TYPE').AsInteger       ;
     APackage.PayorAccount           := FieldByName('BILLING_ACCOUNT').AsString     ;
     APackage.PayorCountry           := FieldByName('BILLING_COUNTRY').AsString     ;
     APackage.Reference1             := FieldByName('REFERENCE1').AsString          ;
     APackage.Reference2             := FieldByName('REFERENCE2').AsString          ;
     APackage.Reference3             := FieldByName('REFERENCE3').AsString          ;
     APackage.Reference4             := FieldByName('REFERENCE4').AsString          ;
     APackage.Reference5             := FieldByName('REFERENCE5').AsString          ;
     APackage.TrackingNumber         := FieldByName('TRACKING_NUMBER').AsString     ;
     APackage.ShipDate               := FieldByName('SHIPPED_DATE').AsDateTime      ;

     APackage.Contents               := FieldByName('CONTENTS').AsString;

     APackage.Shipped                := FieldByName('SHIPPED').AsString = 'Y';
     APackage.Cancelled              := FieldByName('CANCELLED').AsString = 'Y';
     APackage.Closed                 := FieldByName('CLOSED').AsString = 'Y';
     APackage.Voided                 := FieldByName('VOIDED').AsString = 'Y';

     Close;
     SQL.Clear;

     FillAccountValues(APackage.CarrierID, AParamStr);
     APackage.Account := AParamStr;

  finally
     Free;
  end;
end;

procedure TPDF417.AddString(const AValue: String);
begin
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  FText := FText + IQMS.Common.StringUtils.Trim(AValue) + FIELD_DELIMITER;
  }
end;

procedure TPDF417.AddString(const AValue: String;
  const ALength: Integer);
begin
  AddString(AValue, ALength, False);
end;

procedure TPDF417.AddString(const AValue: String;
  const ALength: Integer; const AFixed: Boolean);
begin
  if (AFixed) then
    FText := FText + IQMS.Common.StringUtils.PadR(AValue, ALength) + FIELD_DELIMITER
  else
    FText := FText + IQMS.Common.StringUtils.LeftStr(AValue, ALength) + FIELD_DELIMITER;
end;

procedure TPDF417.AddDate(const AValue: TDateTime);
  var S: String;
begin
  DateTimeToString(S, 'DDMMYYYY', AValue);
  FText := FText + S + FIELD_DELIMITER;
end;

procedure TPDF417.AddFloat(const AValue: Real; const ADecimals: Byte;
 const ALength: Integer);
begin
  FText := FText + FloatToStrF(AValue, ffFixed, ALength, ADecimals) + FIELD_DELIMITER;
end;

procedure TPDF417.AddInt(const AValue: Integer);
begin
  FText := FText + IntToStr(AValue) + FIELD_DELIMITER;
end;

procedure TPDF417.EndSegment;
begin
  FText := IQMS.Common.StringUtils.LeftStr(FText, Length(FText) - 1) + SEGMENT_DELIMITER;
  if (Length(FText) > 800) then
    begin
      FTextList.Add(FText);
      FText := '';
    end;
end;

function TPDF417.CalculateShipmentWeight: Real;
var
  AWeight: Real;
  j: Integer;
begin
  AWeight:= 0;
  for j := 0 to FPackages.Count - 1 do
    with TPackageClass(FPackages.Items[j]).Package do
        if (PackageCode = '01') then
          AWeight := AWeight + 0
        else
          AWeight := AWeight +  ActualWeight;

  Result := AWeight;
end;

function TPDF417.CalculateShipmentDimWeight: Real;
var
  AWeight: Real;
  j: Integer;
  APackage: TPackageClass;
begin
  AWeight:= 0;
  for j := 0 to FPackages.Count - 1 do
  begin
    APackage := TPackageClass(FPackages.Items[j]);
    if ((APackage.Package.PackageCode = '22') and (APackage.Package.ServiceCode = '07') and (APackage.PackageOptionUPS.COD)) then
        AWeight := AWeight + 0
    else
      AWeight := AWeight +  APackage.Package.DimensionalWeight;
  end;

  Result := AWeight;
end;

function TPDF417.FixPhoneFax(ANumber: String; ACountryCode:String):String;
var
   S: String;
   i: Integer;
begin
   S := Numerics(ANumber);
   i := Length(S);

   if (IQMS.Common.StringUtils.StrInList(ACountryCode, ['US','PR', 'CA', 'VI']) and (i = 10)) then
     S:= '1' + S;
   Result := S;
end;

constructor TPDF417.Create(AOwner: TComponent; ASourceID: Real; ASource: String; AEplantID: Real;
  ACarrierID: Real; APaperless: Boolean; APaperlessNafta: Boolean; ADocBox: Boolean);
var
  APackage: TPackage;
  AData: Variant;
begin
  inherited Create(AOwner);

  FTextList := TStringList.Create;
  FPaperless := APaperless;
  FPaperlessNafta := APaperlessNafta;
  FUPSAccount := TStringList.Create;
  shipman_common.FillAccountValues(ACarrierID, FUPSAccount);
  FShipment := TShippingInfo.Create(Self, ASourceID, ASource, ACarrierID, AEplantID);
  FShipment.ValidateSenderData;
  FShipment.ValidateRecipientData;
  FShipment.FillShipmentOptionsUPS;
  FInvoice :=  TShipmentInvoice.Create(Self, FShipment.SourceID, FShipment.Source, ADocBox);
  FPackages := TList.Create;

  if (ADocBox) then
    begin
      AData := SelectValueArray(Format('select ms.id, ms.shipment_number, poe.portcountrycode,'#13 +
                   'poe.portcode, ms.weight_uom, ms.tracking_number from master_shipment ms, '#13 +
                   '%s s, ups_port_of_entry poe'#13 +
                   ' where s.master_shipment_id = ms.id and ms.ups_port_of_entry_id = poe.id and s.id = %.0f',
                   [FShipment.Source, FShipment.SourceID]));

      if System.Variants.VarArrayDimCount(AData) <> 0 then
         begin
          FMasterShipmentID := AData[0];
          FWorldEase := (FMasterShipmentID > 0);
          FWorldEaseShipmentNo := Trim(AData[1]);
          FDocBox := True;
          FPortCountryCode := Trim(AData[2]);
          FPortCode := Trim(AData[3]);
          FShipmentCount := Round(SelectValueFmtAsFloat('select count(*) from v_packslips where master_shipment_id = %.0f', [FMasterShipmentID])) + 1;
          FPackageCount := Round(SelectValueFmtAsFloat('select count(*)  from v_packslips s, '#13 +
                    'shipment_packages sp where sp.source_id = s.source_id and sp.source = s.source and s.master_shipment_id = %.0f', [FMasterShipmentID])) + 1;
          FWeightUOM := Trim(AData[4]);
          FTotalWeight := SelectValueFmtAsFloat('select sum(sp.actual_weight) from v_packslips s, '#13 +
                    'shipment_packages sp where sp.source_id = s.source_id and sp.source = s.source and s.master_shipment_id = %.0f', [FMasterShipmentID]) + 1;
          FDocBoxTracking := Trim(AData[5]);
         end;
    end
  else
    begin
      AData := SelectValueArray(Format('select ms.id, ms.shipment_number from master_shipment ms, '#13 +
                   'v_packslips s where s.master_shipment_id = ms.id and s.source_id = %.0f and s.source = ''%s''',
                   [FShipment.SourceID, FShipment.Source]));

      if System.Variants.VarArrayDimCount(AData) <> 0 then
         begin
          FMasterShipmentID := AData[0];
          FWorldEase := (FMasterShipmentID > 0);
          FWorldEaseShipmentNo := Trim(AData[1]);
         end;
    end;

  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add('select id');
     SQL.Add('FROM shipment_packages');
     SQL.Add('where');
//     SQL.Add(' NVL(shipped,''N'') = ''N''');
//     SQL.Add(' NVL(closed,''N'') = ''N''');
     SQL.Add(' NVL(cancelled,''N'') = ''N''');
     SQL.Add(Format(' and source_id = %.0f',[ASourceID]));
     SQL.Add(Format(' and source = ''%s''',[ASource]));
     SQL.Add(Format(' and carrier_id = %.0f order by seq',[ACarrierID]));
     Open;

     while not EOF do
      begin
        GetPackageFromQuery(FieldByName('ID').AsFloat, APackage);
        AddPackage(APackage);
        Next;
      end;
  finally
    Free;
  end;

end;

procedure TPDF417.Execute;
begin
  Build01; //Interchange Header Segment
  Build02; //Shipment Header Record
//  Build03; //Reference Header Segment

  Build04('SH'); //Parties in a Shipment
  if (FInvoice.UseImporter) then
    Build04('SO'); //Parties in a Shipment
  Build04('ST'); //Parties in a Shipment
  if (TUPSBillingOption(TPackageClass(FPackages.Items[0]).Package.PayorType) = uboThirdParty) then
    Build04('AP'); //Parties in a Shipment

  Build05;  //Shipment Level Descriptions
  Build06;  //Invoice Charge Type Segment
  Build07;  //Package Level Segment
{  if (FDocBox) then
    begin
      with TFDQuery.Create(NIL) do
      try
         Connection := MainModule.FDConnection;
         SQL.Add('select id');
         SQL.Add('FROM shipments');
         SQL.Add('where');
         SQL.Add(Format('master_shipment_id = %.0f',[FMasterShipmentID]));
         Open;

         while not EOF do
          begin
            FInvoice :=  TShipmentInvoice.Create(Self, FieldByName('ID').AsFloat);
            Build08;
            Next;
          end;
      finally
        Free;
      end;
    end
  else   }
    Build08;  //Invoice Line Detail Segment
  Build09;  //Shipment Accessorials Segment
  if (FWorldEase) then
    Build10;  //World Ease Doc Box Segment
//  Build11;  //Trade Direct USI Number Record
//  Build12;  //Pallet
  if (FPaperless) then
    Build13;  //Paperless
  Build14;  //Invoice Level Description
  Build98;  //Over Capacity Message
  Build99;  //Shipment Terminator
  if (FText <> '') then
    FTextList.Add(FText);
  SaveToTable;
end;

destructor TPDF417.Destroy;
begin

  inherited;
end;

procedure TPDF417.Build01;
begin
  AddString('01'); //Interchange Header Segment
  AddString('25'); //Message Version Number
  AddString('{)>'); //Indicator
  AddString(CLIENT_DATA_SOURCE, 3); // Data Source Type Code
  AddString(SHIPPING_SOFTWARE_VERSION, 10); // ClientSoftware Version zebra
  AddString('0200'); //EMMS Version Number zebra
  EndSegment;
end;

procedure TPDF417.Build02;
var
  AWeight, ADimWeight: Real;
  AServiceCode: String;
begin

  AWeight := CalculateShipmentWeight;
  ADimWeight := CalculateShipmentDimWeight;

  AddString('02', 2); //Shipment Header Segment
  AddDate(Date()); //Pick Up/Ship Date
  with TPackageClass(FPackages.Items[0]).Package do
  begin
    AddString(IQMS.Common.StringUtils.AlphaNumeric(TrackingNumber), 18); //Shipment Tracking Number
    if (ServiceCode = '07') then      // Worldwide Express
      AServiceCode := '01'
    else if (ServiceCode = '08') then // Worldwide Expedited
      AServiceCode := '05'
    else if (ServiceCode = '11') then // Standard
      AServiceCode := '08'
    else if (ServiceCode = '64') then // UPS Express NA1
      AServiceCode := '11'
    else if (ServiceCode = '54') then // Express Plus
      AServiceCode := '21'
    else if (ServiceCode = '65') then // WorldWide Saver
      AServiceCode := '28'
    else if (ServiceCode = '12') then // 3 Day Select
      AServiceCode := '33';
    AddString(AServiceCode, 2); //Shipment Service Level
    AddString('P'); //Shipment Document Type Code
    AddString(''); //Manifest No. (Book And Page Number) zebra
    if (PackageCode = '01') then
      AddString('1') // Document Indicator (01 = letter)
    else
      AddString('3'); // Document Indicator (03 = non-document)     zebra
    AddFloat(AWeight, 1, 6); //Actual Shipment Weight
    AddString(WeightUOM, 3); // Actual Weight Unit of Measure
    AddFloat(ADimWeight, 1, 6);  //Dimensional Shipment Weight
    AddString(''); //Package Type zebra
    FBillingCode := TUPSBillingOption(PayorType);
    with FInvoice do
    begin
      AddFloat(LineTotal - Discount + Freight + Insurance + OtherCharges, 2, 9); // Total Invoice Amount
      AddString(CurrencyCode, 3); // Invoice Currency
      AddString(''); //Certificate of Origin/Status of Goods zebra

      if (TermsOfSale = 'FOA') then
        AddString('A'); // Terms of Delivery
      if (TermsOfSale = 'CIF') then
        AddString('C'); // Terms of Delivery
      if (TermsOfSale = 'EXW') then
        AddString('E'); // Terms of Delivery
      if (TermsOfSale = 'FOB') then
        AddString('F'); // Terms of Delivery
      if (TermsOfSale = 'CFR') then
        AddString('R'); // Terms of Delivery
      if (TermsOfSale = 'UNK') then
        AddString('U'); // Terms of Delivery
      if (TermsOfSale = 'FCA') then
        AddString('1'); // Terms of Delivery
      if (TermsOfSale = 'FAS') then
        AddString('2'); // Terms of Delivery
      if (TermsOfSale = 'CPT') then
        AddString('3'); // Terms of Delivery
      if (TermsOfSale = 'CIP') then
        AddString('4'); // Terms of Delivery
      if (TermsOfSale = 'DAF') then
        AddString('5'); // Terms of Delivery
      if (TermsOfSale = 'DDU') then
        AddString('6'); // Terms of Delivery
      if (TermsOfSale = 'DDP') then
        AddString('7'); // Terms of Delivery
      if (TermsOfSale = 'DES') then
        AddString('8'); // Terms of Delivery
      if (TermsOfSale = 'DEQ') then
        AddString('9'); // Terms of Delivery
      if (TermsOfSale = '') then
        AddString(''); // Terms of Delivery

      if (UpperCase(ExportReason) = 'TEMP IN BOND') then
        AddString('01'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'SALE') then
        AddString('02'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'REPAIR') then
        AddString('03'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'GOVERNMENT') then
        AddString('04'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'GIFT') then
        AddString('05'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'SAMPLE') then
        AddString('06'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'RETURN') then
        AddString('07'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'INTER-COMPANY DATA') then
        AddString('08'); //Type of Importation/Shipment
      if (UpperCase(ExportReason) = 'OTHER') then
        AddString('09'); //Type of Importation/Shipment
      if (UseUltimateConsignee) then
        AddString(UltimateConsignee.CountryCode, 2) //Country of Ultimate Destination
      else
        AddString(FShipment.Recipient.CountryCode, 2); //Country of Ultimate Destination

      AddString(''); //Agreement Type zebra
      AddString(SEDbyAES);// SED Indicator
      AddString(AESNumber, 28); // AES Transaction Number
      {
      if (IncludeSED) then
        if (CarrierPrepareSED) then
          AddString('U') // SED Indicator
        else
          if (SEDbyAES) then
           AddString('E') // SED Indicator
          else
            AddString('D') // SED Indicator
      else
        AddString('');// SED Indicator

      if (SEDbyAES) then
        AddString(AESNumber, 28) // AES Transaction Number
      else
        AddString(''); // AES Transaction Number
        }

      AddString(''); // MRN Number zebra
      AddString('0'); // Average Weight Indicator


    end;

//    ACount:= 0;
//    ACount:= SelectValueFmtAsFloat('select count(*) from shipment_option where code = ''SaturdayDelivery'' and shipments_id = %.0f', [FShipment.ShipmentsID]);
//    if (ACount > 0) then
//      AddString('02', 2);

  end;
  EndSegment;
end;

procedure TPDF417.Build03;
begin

end;

procedure TPDF417.Build04(ACode: String);
var
  AContact, ACompany, AAddr1, AAddr2, AAddr3, ACity,
    AState, AZip, ACountryCode, ATelephone, AFaxInd,
    AFax, AAccount, AEIN :String;
  ARecipient: TAddress;
begin

  AddString('04', 2); //Parties in a Shipment
  AddString(ACode, 2); //Account Type
  if (ACode = 'SH') then
    ARecipient := FShipment.Sender;
  if (ACode = 'SO') then
    ARecipient := FInvoice.Importer;
  if (ACode = 'ST') then
    ARecipient := FShipment.Recipient;
  if (ACode = 'AP') then
    ARecipient := FShipment.ThirdParty;
  if (ACode = 'SH') or (ACode = 'SO') or (ACode = 'ST') or (ACode = 'AP') then
        with ARecipient do
        begin
          AContact:= Contact;
          ACompany:= Company;
          AAddr1:= Address1;
          AAddr2:= Address2;
          AAddr3:= Address3;
          ACity:= City;
          AState:= State;
          AZip:= AlphaNumeric(Zip);
          ACountryCode:= CountryCode;
          ATelephone:= FixPhoneFax(Telephone, ACountryCode);
          AFaxInd:= ' ';
          AFax:= FixPhoneFax(Fax, ACountryCode);
          AAccount:= AccountNumber;
          AEIN := '';
        end;
//  if (ACode = 'AP') then
//    AAccount := ARecipient.AccountNumber;

  AddString(ACompany, 35); // Company Name
  AddString(ACity, 30); // City
  AddString(AState, 2); // State
  AddString(AZip, 9); // Zip
  AddString(ACountryCode, 2); // Country Code
  AddString(AAccount, 10); // UPS account number
  if (ACode = 'SO') then
    AddString(AAddr1, 35) // Addr1
  else
    AddString(AAddr1, 32); // Addr1

  AddString('', 16); // Credit Card Number
  AddString('', 4); // Credit Card Expiration
  AddString(AEIN, 14); // Tax Identification Number (EIN)
  AddString(AContact, 25); // Attn Name
  AddString(ATelephone, 14); // Phone Number
  AddString(AFax, 14); // Fax Number - optional
  AddString(AAddr2, 35); // Addr2
  if (ACode = 'SO') then
    AddString(AAddr3, 35) // Addr3
  else
    AddString(AAddr3, 30); // Addr3

  EndSegment;

end;

procedure TPDF417.Build05;
begin
  if (TPackageClass(FPackages.Items[0]).Package.Contents <> '') then
  begin
    AddString('05', 2);
    AddString('GSI', 3);
    AddString(TPackageClass(FPackages.Items[0]).Package.Contents, 40);
    EndSegment;
  end;
  if (FDocBox and (FShipmentCount > 2)) then
  begin
    AddString('05', 2);
    AddString('OTH', 3);
    AddString('Multiple Consignees');
    EndSegment;
  end;
  if (FDocBox) then
  begin
    AddString('05', 2);
    AddString('INV', 3);
    AddString('These commodities, technology or software were exp');
    EndSegment;
    AddString('05', 2);
    AddString('INV', 3);
    AddString('orted from the United States in accordance with th');
    EndSegment;
    AddString('05', 2);
    AddString('INV', 3);
    AddString('e Export Administration Regulations.  Diversion co');
    EndSegment;
    AddString('05', 2);
    AddString('INV', 3);
    AddString('ntrary to U.S. law is prohibited.');
    EndSegment;
  end;

end;

procedure TPDF417.Build06;
begin
  with FInvoice do
  begin
    if (Freight > 0) then
    begin
      AddString('06', 2); // Invoice Charge Type Segment
      AddString('F', 1); // Invoice Charge Type
      AddFloat(Freight, 2, 9); // Invoice Charge Amount
      EndSegment;
    end;

    if (Insurance > 0) then
    begin
      AddString('06', 2); // Invoice Charge Type Segment
      AddString('I', 1); // Invoice Charge Type
      AddFloat(Insurance, 2, 9); // Invoice Charge Amount
      EndSegment;
    end;

    if (Discount > 0) then
    begin
      AddString('06', 2); // Invoice Charge Type Segment
      AddString('D', 1); // Invoice Charge Type
      AddFloat(Discount, 2, 9); // Invoice Charge Amount
      EndSegment;
    end;

    if (OtherCharges > 0) then
    begin
      AddString('06', 2); // Invoice Charge Type Segment
      AddString('O', 1); // Invoice Charge Type
      AddFloat(OtherCharges, 2, 9); // Invoice Charge Amount
      EndSegment;
    end;
  end;

end;

procedure TPDF417.Build07;
var
  i: Integer;
  AWeight, ADimWeight: Real;
begin
 if (FDocBox) then
   begin
      AddString('07', 2); // Package Level Segment
      AddString(IQMS.Common.StringUtils.AlphaNumeric(FDocBoxTracking), 18); // Package Tracking Number
      AddFloat(1, 1, 6); // Package Actual Weight
      AddString(''); //Hazard Class/Division Code 1
      AddString(''); //Hazmat IDG ID Number 1
      AddString(''); //Hazard Class/Division Code 2
      AddString(''); //Hazmat IDG ID Number 2
      AddString(''); //Hazard Class/Division Code 3
      AddString(''); //Hazmat IDG ID Number 3
      AddString('');
      AddString('');
      AddString('');
      AddString('');
      AddFloat(0, 1, 6); //Package Dimensional Weight
      EndSegment;
   end
 else
 begin
  for i := 0 to FPackages.Count - 1 do
    with TPackageClass(FPackages.Items[i]).Package do
    with TPackageClass(FPackages.Items[i]).PackageOptionUPS do
    begin
      AddString('07', 2); // Package Level Segment
      AddString(IQMS.Common.StringUtils.AlphaNumeric(TrackingNumber), 18); // Package Tracking Number
      if (PackageCode = '01') then
        begin
          AWeight := 0;
          ADimWeight := 0;
        end
      else
        begin
          AWeight := ActualWeight;
          ADimWeight := DimensionalWeight;
        end;
      AddFloat(AWeight, 1, 6); // Package Actual Weight
      AddString(''); //Hazard Class/Division Code 1
      AddString(''); //Hazmat IDG ID Number 1
      AddString(''); //Hazard Class/Division Code 2
      AddString(''); //Hazmat IDG ID Number 2
      AddString(''); //Hazard Class/Division Code 3
      AddString(''); //Hazmat IDG ID Number 3
        if (AdditionalHandling) then
          AddString('07')
        else
          AddString('');

        if (LargePackage) then
          AddString('14')
        else
          AddString('');

        if (ProactiveResponse) then
          AddString('16')
        else
          AddString('');

          AddString(''); //Dry Ice

      AddFloat(ADimWeight, 1, 6); //Package Dimensional Weight

      EndSegment;
    end;
 end;

end;

procedure TPDF417.Build08;
var
  i: Integer;
begin
  for i := 0 to FInvoice.Goods.Count - 1 do
    with TShipmentGood(FInvoice.Goods[i]) do
  begin
    AddString('08'); //Invoice Line Detail Segment
    AddInt(Qty); //Invoice Line Quantity
    AddString(UOM, 3, True); //Invoice Quantity Unit of Measure
    AddFloat(UnitPrice, 6, 12); //Invoice Line Per Unit Amount
    AddString(Descrip, 52); //Invoice Line Text 1
    AddString(OriginCountryCode, 2); //Invoice Line Country of Origin
    AddString(TariffCode, 15); //Invoice Line Harmonized Code
    if (not LicenseException) then
      AddString(LicenseNumber, 15) //Invoice Line Export License Number
    else
      AddString('');
    AddString(''); //Invoice Line Text 2
    if (FPaperless) then
      begin
        AddFloat(Qty * UnitPrice, 2, 12);//Invoice Line Extended Amount
        AddString(FInvoice.CurrencyCode, 3);//Invoice Line Currency Code
      end
    else
      begin
        AddString('');
        AddString('');
      end;

    AddString(Itemno, 35); //Part Number

    EndSegment;
  end;

end;

procedure TPDF417.Build09;
var
  AEVSCount, ACODCount, AADDCount,
  ABPICount, ATNTCount, AEPICount,
  ADVSCount, ALargePackageCount, i: Integer;

  AEVSAmount, ACODAmount, AADDAmount,
  ABPIAmount, ATNTAmount, AEPIAmount,
  ADVSAmount: Real;
begin
  AEVSCount := 0;
  ACODCount := 0;
  AADDCount := 0;
  ABPICount := 0;
  ATNTCount := 0;
  AEPICount := 0;
  ADVSCount := 0;
  ALargePackageCount := 0;

  AEVSAmount := 0;
  ACODAmount := 0;
  AADDAmount := 0;
  ABPIAmount := 0;
  ATNTAmount := 0;
  AEPIAmount := 0;
  ADVSAmount := 0;

  for i := 0 to FPackages.Count - 1 do
    with TPackageClass(FPackages.Items[i]).Package do
      with TPackageClass(FPackages.Items[i]).PackageOptionUPS do
        begin
          if (DeclaredValue > 0) then
            if (ShipperPaidDV) then
              begin
                ADVSCount := ADVSCount + 1;
                ADVSAmount := ADVSAmount + DeclaredValue;
              end
            else
              begin
                AEVSCount := AEVSCount + 1;
                AEVSAmount := AEVSAmount + DeclaredValue;
              end;

            if (COD) then
              begin
                ACODCount := ACODCount + 1;
                ACODAmount := ACODAmount + CODAmount;
              end;

            if (AdditionalHandling) then
              begin
                AADDCount := AADDCount + 1;
                AADDAmount := AADDAmount + AdditionalHandlingFee;
              end;

            if (Insurance) then
              case InsuranceType of
                0:
                  begin
                    AEPICount := AEPICount + 1;
                    AEPIAmount := AEPIAmount + InsuranceAmount;
                  end;
                1:
                  begin
                    ABPICount := ABPICount + 1;
                    ABPIAmount := ABPIAmount + InsuranceAmount;
                  end;
                2:
                  begin
                    ATNTCount := ATNTCount + 1;
                    ATNTAmount := ATNTAmount + InsuranceAmount;
                  end;
              end;
            if (LargePackage) then
              ALargePackageCount := ALargePackageCount + 1;
        end;
  with FShipment.ShipmentOptionUPS do
    begin
      if (SaturdayDelivery) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('02'); // Service Option Type
          AddString('1');  // Accessorial Quantity
          AddString(''); // Accessorial Amount
          AddString(''); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (AEVSCount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('04'); // Service Option Type
          AddInt(AEVSCount);  // Accessorial Quantity
          AddFloat(AEVSAmount, 2, 11); // Accessorial Amount
          AddString(FInvoice.CurrencyCode); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (ACODCount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('05'); // Service Option Type
          AddInt(ACODCount);  // Accessorial Quantity
          AddFloat(ACODAmount, 2, 11); // Accessorial Amount
          AddString(FInvoice.CurrencyCode); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (AADDCount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('07'); // Service Option Type
          AddInt(AADDCount);  // Accessorial Quantity
          AddFloat(AADDAmount, 2, 11); // Accessorial Amount
          AddString(FInvoice.CurrencyCode); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (FShipment.PackingSlip.Residential) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('10'); // Service Option Type
          AddString('1');  // Accessorial Quantity
          AddString(''); // Accessorial Amount
          AddString(''); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (ABPICount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('11'); // Service Option Type
          AddInt(ABPICount);  // Accessorial Quantity
          AddFloat(ABPIAmount, 2, 11); // Accessorial Amount
          AddString(FInvoice.CurrencyCode); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (ATNTCount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('12'); // Service Option Type
          AddInt(ATNTCount);  // Accessorial Quantity
          AddFloat(ATNTAmount, 2, 11); // Accessorial Amount
          AddString(FInvoice.CurrencyCode); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (AEPICount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('13'); // Service Option Type
          AddInt(AEPICount);  // Accessorial Quantity
          AddFloat(AEPIAmount, 2, 11); // Accessorial Amount
          AddString(FInvoice.CurrencyCode); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (ALargePackageCount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('14'); // Service Option Type
          AddInt(ALargePackageCount);  // Accessorial Quantity
          AddString(''); // Accessorial Amount
          AddString(''); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;

      if (ADVSCount > 0) then
        begin
          AddString('09'); // Shipment Accessorial Segment
          AddString('15'); // Service Option Type
          AddInt(ADVSCount);  // Accessorial Quantity
          AddFloat(ADVSAmount, 2, 11); // Accessorial Amount
          AddString(FInvoice.CurrencyCode); // Accessorial Amount Curr Code
          AddString(''); // Accessorial Collection Method
          EndSegment;
        end;
    end;
end;

procedure TPDF417.Build10;
begin
    AddString('10'); // WorldEase
    AddString(Alphanumeric(FWorldEaseShipmentNo), 11);
    if (FDocBox) then
      begin
        AddString(FPortCountryCode, 2);
        AddString(LPadZero(FPortCode, 5), 5);
        AddInt(FShipmentCount);
        AddInt(FPackageCount);
        AddString(FWeightUOM);
        AddFloat(FTotalWeight, 1, 12);
      end
    else
      begin
        AddString('');
        AddString('');
        AddString('');
        AddString('');
        AddString('');
        AddString('');
      end;
    EndSegment;
end;

procedure TPDF417.Build11;
begin

end;

procedure TPDF417.Build12;
begin

end;

procedure TPDF417.Build13;
begin
  with FInvoice do
    begin
      AddString('13'); // Paperless
      if (FPaperless) then
        if (AdditionalDocs) then
          AddString('1') //Paperless Indicator
        else
          AddString('0') //Paperless Indicator
      else
        AddString(''); //Paperless Indicator
      AddString(ExportReason, 35); //Reason for Export
      AddString(''); //Invoice Number
      AddString(''); //Purchase Order Number
      AddInt(FPackages.Count); //Total Number of Packages
      AddFloat(LineTotal - Discount, 2, 16); //Invoice Sub Total
      AddFloat(LineTotal - Discount + Freight + Insurance + OtherCharges, 2, 16); // Invoice Total Amount
      EndSegment;

    end;

end;

procedure TPDF417.Build14;
begin
  with FInvoice do
    begin
      if (DeclarationCode = 'INVOICE') then
        begin
          AddString('14'); //Invoice Level Description Segment
          AddString('004'); //Invoice Description Type
          AddString('01'); //Free form text
          EndSegment;
        end
      else
        if (DeclarationCode = 'NAFTA') then
          begin
            AddString('14'); //Invoice Level Description Segment
            AddString('004'); //Invoice Description Type
            AddString('02'); //Free form text
            EndSegment;
          end
        else
          if (DeclarationCode = 'NONE') then
            if (Comments <> '') then
              begin
                AddString('14'); //Invoice Level Description Segment
                AddString('005'); //Invoice Description Type
                AddString(Comments, 550); //Free form text
                EndSegment;
              end;

    end;
end;

procedure TPDF417.Build98;
begin
  if (Length(FText) > 5400) then
    begin
      AddString('98'); //  Key Shipment Bar code ID
      AddString('Shipment data exceeds bar code capacity. Shipment must be keyed.'); // Shipment Must Be Keyed Message
      EndSegment;
    end;
end;

procedure TPDF417.Build99;
begin
  AddString('99'); // Shipment Terminator ID
  EndSegment;
end;

procedure TPDF417.SaveToTable;
var
   A: Variant;
   AFileID, AFullText: String;
   i: Integer;
begin
  CheckCreateDNetCOM('IQMS.Barcode', 'IQMS.Barcode.PDF417', A);
  try
    if (FDocBox) then
    begin
    ExecuteCommandFmt('update master_shipment set MASTER_PDF4171 = null,'#13 +
              'MASTER_PDF4172 = null, MASTER_PDF4173 = null, MASTER_PDF4174 = null,'#13 +
              'MASTER_PDF4175 = null, MASTER_PDF4176 = null where id = %.0f', [FMasterShipmentID]);
    if (FTextList.Count > 1) then
      begin
       for i := 0 to FTextList.Count - 1 do
           AFullText := AFullText + FTextList[i];
       if (Length(AFullText) > 1300) then
         begin
           AFileID := LPadZero(IntToStr(Round(FMasterShipmentID)), 6);
           AFileID := '0' + LeftStr(AFileID, 2) +
                      '0' + RightStr(LeftStr(AFileID, 4), 2) +
                      '0' + RightStr(AFileID, 2);
           for i := 0 to FTextList.Count - 1 do
            A.CreateMacroPDF417Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
                 'master_shipment', 'MASTER_PDF417' + IntToStr(i + 1), FMasterShipmentID, FTextList[i], FTextList.Count, i, AFileID);
         end
       else
      A.CreatePDF417Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
            'master_shipment', 'MASTER_PDF4171', FMasterShipmentID, AFullText);

      end
    else
      A.CreatePDF417Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
            'master_shipment', 'MASTER_PDF4171', FMasterShipmentID, FTextList[0]);
    end
    else
    begin
    ExecuteCommandFmt('update shipment_invoice set PDF_BLOB1 = null,'#13 +
              'PDF_BLOB2 = null, PDF_BLOB3 = null, PDF_BLOB4 = null,'#13 +
              'PDF_BLOB5 = null, PDF_BLOB6 = null where id = %.0f', [FInvoice.InvoiceID]);
    if (FTextList.Count > 1) then
      begin
       AFileID := LPadZero(IntToStr(Round(FShipment.SourceID)), 6);
       AFileID := '0' + LeftStr(AFileID, 2) +
                  '0' + RightStr(LeftStr(AFileID, 4), 2) +
                  '0' + RightStr(AFileID, 2);
       for i := 0 to FTextList.Count - 1 do
        A.CreateMacroPDF417Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
              'SHIPMENT_INVOICE', 'PDF_BLOB' + IntToStr(i + 1), FInvoice.InvoiceID, FTextList[i], FTextList.Count, i, AFileID);

      end
    else
      A.CreatePDF417Image(IQGetServerName( 'IQ' ), 'IQMS', IQGetPassword( 'IQ' ),
            'SHIPMENT_INVOICE', 'PDF_BLOB1', FInvoice.InvoiceID, FTextList[0]);
    end;
  finally
    CheckFreeDNetCOM(A);
  end;
end;

end.
