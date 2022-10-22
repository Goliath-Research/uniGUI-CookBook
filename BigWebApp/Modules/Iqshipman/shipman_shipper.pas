unit shipman_shipper;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  MaskUtils,
  shipman_common,
  MainModule;

type
   // Forward
   TShipperManager = class;

   // Shipper class
   TShipperClass = class of TShipperManager;

   // Base class for all shipping manager components
   TShipperManager = class(TComponent)
   private
    { Private declarations }
    FSourceID: Real;
    FSource: String;
    FOnSoftError: TOnSoftError;
    FCheckMinDeclaredValue: Boolean;
   protected
    { Protected declarations }
    FCarrierID: Real;
    FShopRequestID: Real;
    procedure InitValues; virtual;
    function GetCarrierType: TCarrierType; virtual;
    procedure ProcessSoftError(AMsg: String); virtual; abstract;
    function URL: String; virtual; abstract;

    // Used internally for adding a name/value pair to some string list.
    // This is used for creating message text for logging.
    procedure AddLn(const AList: TStringList; const AName, AValue: String); overload;
    procedure AddLn(const AList: TStringList; const AName: String; AValue: Integer); overload;
    procedure AddLn(const AList: TStringList; const AName: String; AValue: Real); overload;

    function Service_Description_From_Code(ACode: String): String; virtual; abstract;

   public
    { Public declarations }
    Package: TPackage; // raw package data
    Packages: TList;
    ShippingInfo: TShippingInfo; // sender, recipient, etc.
//    PackageOptions: TPackageOption; // options applied to the package
//    ShipmentOptions: TShipmentOption; // options applied at the shipment level (multiple packages)
    constructor Create(AOwner: TComponent; ASourceID: Real; ASource: String; ACarrierID: Real); virtual;
    destructor Destroy; override;
    procedure SetSourceID(const ASourceID: Real; const ASource: String);

    // Processing shipping and rates
    function Process_ShipmentRate: Boolean; virtual; abstract;              // calculate the shipment rate
    function Process_ShipShipment: Boolean; virtual; abstract;              // ship the package
    function Process_CancelShipment(cancelAll: Boolean = false): Boolean; virtual; abstract;           // cancel the shipment
    function Process_CloseShipment: Boolean; virtual; abstract;            // close out the shipment (end-of-day)
    procedure Process_Shop(var AList: TServiceCodeList); virtual; abstract;// rate shopping

    // Helper (informational) methods
    procedure ClearPackageValues;
    procedure ClearPackageList;
    procedure AddPackage(APackage: TPackage);
    function GetPackage(i: Integer): TPackage;
    procedure LoadDBOptions;
    procedure ServiceCodeList(var AList: TServiceCodeList); virtual; abstract;
    procedure PackageCodeList(const AServiceCode: String; var AList: TPackageCodeList); overload; virtual; abstract;
//    procedure PackageCodeList(var AList: TPackageCodeList); overload;
    procedure PayorList(var AList: TList); virtual; abstract;
    function CreateShopRequest: Real;
    function GetLabelPrinter: String;
    function GetReportPrinter: String;


    function IsServiceAvailable(const AServiceCode: String): Boolean;
    function ShipmentOptionBool(const AName: String) : Boolean; virtual; abstract;
    function ShipmentOptionFloat(const AName: String) : Real; virtual; abstract;
    function ShipmentOptionInt(const AName: String) : Integer; virtual; abstract;
    function PackageOptionBool(const AName: String) : Boolean; virtual; abstract;
    function PackageOptionFloat(const AName: String) : Real; virtual; abstract;
    function PackageOptionInt(const AName: String) : Integer; virtual; abstract;

   published
    { Published declarations }
    property SourceID: Real read FSourceID;
    property Source: String read FSource;
    property CarrierID: Real read FCarrierID write FCarrierID;
    property CheckMinDeclaredValue: Boolean read FCheckMinDeclaredValue write FCheckMinDeclaredValue;
    property OnSoftError: TOnSoftError read FOnSoftError write FOnSoftError;
    property CarrierType:TCarrierType read GetCarrierType;
    property ShopRequestID: Real read FShopRequestID write FShopRequestID;
end;

  function GetShipperReference(ACarrier: TCarrierType): TShipperClass;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  shipman_fedex,
  shipman_ups,
  shipman_usps,
  IQMS.Common.Boolean;

function GetShipperReference(ACarrier: TCarrierType): TShipperClass;
begin
  Result := NIL;
  case ACarrier of
   ctUPS           : Result:= TShipperClass(TUPSManager); // shipman_ups
   ctFedExGround   : Result:= TShipperClass(TFedExGround); // shipman_fedex
   ctFedExExpress  : Result:= TShipperClass(TFedExExpress); // shipman_fedex
   ctFedExSmartPost: Result:= TShipperClass(TFedExSmartPost); // shipman_fedex
   ctUSPS          : Result:= TShipperClass(TUSPSManager); // shipman_usps
  end; // end case
end;

{ ---------------------------------------------------------------------------- }
{ TShipperManager }
{ ---------------------------------------------------------------------------- }

constructor TShipperManager.Create(AOwner: TComponent; ASourceID:Real; ASource: String; ACarrierID: Real);
begin
  CheckMinDeclaredValue := TRUE;
  inherited Create(AOwner);
  ShippingInfo := NIL;
//  PackageOptions := NIL;
  FCarrierID := ACarrierID;
  Packages := TList.Create;

  InitValues;

  // Fill property values from constructor
  if ASourceID <> 0 then
    begin
      SetSourceID(ASourceID, ASource);
    end;

//  ShipmentOptions:= TShipmentOption.Create(self, SourceID, Source);
//  ShipmentOptions.OnBeforeGetValues;
//  ShipmentOptions.WriteImmediate:= FALSE;
//  PackageOptions:= TPackageOption.Create(self, 0, CarrierType );
//  PackageOptions.OnBeforeGetValues;
//  PackageOptions.WriteImmediate:= FALSE;
end;

destructor TShipperManager.Destroy;
begin
  if Assigned(ShippingInfo) then FreeAndNil(ShippingInfo);
//  if Assigned(PackageOptions) then FreeAndNil(PackageOptions);
  inherited Destroy;
end;

procedure TShipperManager.InitValues;
begin
  SetSourceID(0, '');
  ClearPackageRec(Package);
end;

procedure TShipperManager.ClearPackageValues;
begin
  shipman_common.ClearPackageRec(Package);
end;

procedure TShipperManager.ClearPackageList;
begin
  Packages := TList.Create;
end;

procedure TShipperManager.AddPackage(APackage: TPackage);
begin
  Packages.Add(TPackageClass.Create(Self, APackage));
end;

function TShipperManager.GetPackage(i: Integer): TPackage;
begin
  if (i < Packages.Count) then
    Result := TPackageClass(Packages[i]).Package
end;

procedure TShipperManager.SetSourceID(const ASourceID: Real; const ASource: String);
var
   AEplantID: Real;
begin
  FSourceID := ASourceID;
  FSource := ASource;

  // Get the package carrier eplant id
  AEplantID := SelectValueFmtAsFloat( 'select eplant_id from freight_carrier where id = %.0f',
                          [ CarrierID ] ); //Phillip changed from Package.CarrierID


  if not Assigned(ShippingInfo) then
     ShippingInfo := TShippingInfo.Create(Self, ASourceID, ASource, CarrierID, AEplantID)
  else
    begin
      ShippingInfo.CarrierID  := CarrierID;
      ShippingInfo.SetSourceID(ASourceID, ASource);
    end;
end;


procedure TShipperManager.LoadDBOptions;
begin
//  if Assigned(PackageOptions) then FreeAndNil(PackageOptions);
//  if Assigned(ShipmentOptions) then FreeAndNil(ShipmentOptions);

//  ShipmentOptions:= TShipmentOption.Create(NIL, SourceID, Source);
//  PackageOptions := TPackageOption.Create(NIL, Package.ID, Package.Carrier);
end;


function TShipperManager.IsServiceAvailable(const AServiceCode: String): Boolean;
var
  AList: TServiceCodeList;
  o: TCodeItem;
begin
  AList := TServiceCodeList.Create;
  try
    ServiceCodeList(AList);
    o:= AList.FindItemByCode(ctUnknown, AServiceCode);
    Result := o <> NIL;
  finally
    AList.Free;
  end;
end;

procedure TShipperManager.AddLn(const AList: TStringList; const AName,
  AValue: String);
begin
  if Assigned(AList) and (AName > '') and (AValue > '') then
    AList.Add(Format('%s=%s',[AName, AValue]));
end;

procedure TShipperManager.AddLn(const AList: TStringList;
  const AName: String; AValue: Integer);
begin
  AddLn(AList, AName, IntToStr(AValue));
end;

procedure TShipperManager.AddLn(const AList: TStringList;
  const AName: String; AValue: Real);
begin
  AddLn(AList, AName, FloatToStr(AValue));
end;

function TShipperManager.GetCarrierType: TCarrierType;
begin
  Result:= ctUnknown;
end;

function TShipperManager.CreateShopRequest: Real;
var
   APackageType: Integer;
begin
      FShopRequestID := GetNextID('SHIPMAN_SHOP_REQUEST');
      if ((Package.PackageCode = 'FEDEX_ENVELOPE') or (Package.PackageCode = '01')) then
        APackageType := 1
      else
        APackageType := 2;
      with ShippingInfo do
      ExecuteCommandParam('insert into shipman_shop_request(id, ship_to_contact, ship_to_company,'#13 +
       'ship_to_addr1, ship_to_addr2, ship_to_addr3,'#13 +
       'ship_to_city, ship_to_state, ship_to_zip,'#13 +
       'ship_to_country_code, ship_to_residential, weight,'#13 +
       'package_type, ship_from_contact, ship_from_company,'#13 +
       'ship_from_addr1, ship_from_addr2, ship_from_addr3,'#13 +
       'ship_from_city, ship_from_state, ship_from_zip,'#13 +
       'ship_from_country_code)'#13 +
       'values(:ID, :SHIP_TO_CONTACT, :SHIP_TO_COMPANY, '#13 +
       ':SHIP_TO_ADDR1, :SHIP_TO_ADDR2, :SHIP_TO_ADDR3, '#13 +
       ':SHIP_TO_CITY, :SHIP_TO_STATE, :SHIP_TO_ZIP, '#13 +
       ':SHIP_TO_CC, :SHIP_TO_RES, :WEIGHT, '#13 +
       ':PACKAGE_TYPE, :SHIP_FROM_CONTACT, :SHIP_FROM_COMPANY, '#13 +
       ':SHIP_FROM_ADDR1, :SHIP_FROM_ADDR2, :SHIP_FROM_ADDR3, '#13 +
       ':SHIP_FROM_CITY, :SHIP_FROM_STATE, :SHIP_FROM_ZIP, :SHIP_FROM_CC)',
       ['ID;FLOAT','SHIP_TO_CONTACT;STRING','SHIP_TO_COMPANY;STRING',
        'SHIP_TO_ADDR1;STRING', 'SHIP_TO_ADDR2;STRING', 'SHIP_TO_ADDR3;STRING',
        'SHIP_TO_CITY;STRING', 'SHIP_TO_STATE;STRING', 'SHIP_TO_ZIP;STRING',
        'SHIP_TO_CC;STRING', 'SHIP_TO_RES;STRING', 'WEIGHT;FLOAT',
        'PACKAGE_TYPE;INTEGER','SHIP_FROM_CONTACT;STRING','SHIP_FROM_COMPANY;STRING',
        'SHIP_FROM_ADDR1;STRING', 'SHIP_FROM_ADDR2;STRING', 'SHIP_FROM_ADDR3;STRING',
        'SHIP_FROM_CITY;STRING', 'SHIP_FROM_STATE;STRING', 'SHIP_FROM_ZIP;STRING',
        'SHIP_FROM_CC;STRING'],
       [FShopRequestID, Recipient.Contact, Recipient.Company,
        Recipient.Address1, Recipient.Address2, Recipient.Address3,
        Recipient.City, Recipient.State, Recipient.Zip,
        Recipient.CountryCode, IQMS.Common.Boolean.BoolToYN(PackingSlip.Residential), Package.ActualWeight,
        APackageType, Sender.Contact, Sender.Company,
        Sender.Address1, Sender.Address2, Sender.Address3,
        Sender.City, Sender.State, Sender.Zip, Sender.CountryCode]);
  Result := FShopRequestID;
end;

function TShipperManager.GetLabelPrinter: String;
begin
  IQMS.Common.RegFrm.IQRegStringScalarRead( nil, 'FLabelPrinter:' + FloatToStr(CarrierID), Result );
  if (Result = '') then
    Result := SelectValueFmtAsString('select printer from freight_printer fp, freight_carrier fc ' +
      'where fc.label_printer_id = fp.id and fc.id = %.0f', [CarrierID]);
end;

function TShipperManager.GetReportPrinter: String;
begin
  IQMS.Common.RegFrm.IQRegStringScalarRead( nil, 'FReportPrinter:' + FloatToStr(CarrierID), Result );
  if (Result = '') then
    Result := SelectValueFmtAsString('select printer from freight_printer fp, freight_carrier fc ' +
      'where fc.report_printer_id = fp.id and fc.id = %.0f', [CarrierID]);
end;

end.
