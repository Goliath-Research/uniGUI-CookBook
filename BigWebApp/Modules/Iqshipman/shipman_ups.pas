unit shipman_ups;

{NOTE: This unit is in development.  It connects to shipper site and obtains
       or processes data.}

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  shipman_shipper,
  shipman_common,
  shipman_region,
  shipman_dc,
  ups_httplink_typelib,
  IQMS.Common.DotNetCOMInterOp,
  MainModule;

  function UPS_Service_Description_From_Code(ACode: String): String;
  procedure UPS_ServiceCodeList(const ASenderCountryCode: String;
                                      ARecipientCountryCode: String;
                                const AReturnServices: Boolean;
                                  var AList: TServiceCodeList);
  function UPS_ServiceType_From_Code(const ACode: String): TUPSService;

  function UPS_PackageType_From_Code(const ACode: String): TUPSPackaging;
  function UPS_Packaging_Description_From_Code(const ACode: String): String;





type
   TUPSManager = class(TShipperManager)
   private
    { Private declarations }
    FCheckMinDeclaredValue: Boolean;
    FOnSoftError: TOnSoftError;
    FShopping: Boolean;
    procedure ValidateAccount;

    // Handles the update request.  Checks the database for changed values,
    // and makes the appropriate call to the UPS HTTP Server.
   protected
    { Protected declarations }

    // Account values
    FAccountNumber,
    FMailboxID,
    FRegistrationID,
    FPassword: String;
    FValidServiceCodes: TStringList;
    FValidPackageCodes: TStringList;

    procedure InitValues; override;
    function GetCarrierType: TCarrierType; override;
                              // local machine is updated also
    function Service_Description_From_Code(ACode: String): String; override;

   public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASourceID: Real; ASource: String; ACarrierID: Real); override;

    // Processing shipping and rates
    function Process_ShipmentRate: Boolean; override;              // calculate the shipment rate
    function Process_ShipShipment: Boolean; override;
    function Process_CancelShipment(cancelAll: Boolean = false): Boolean; override;            // cancel the shipment
    function Process_CloseShipment: Boolean; override;             // close out the shipment (end-of-day)
    procedure Process_Shop(var AList: TServiceCodeList); override; // rate shopping


    // Helper (informational) methods
    procedure ServiceCodeList(var AList: TServiceCodeList); override;
    procedure PackageCodeList(const AServiceCode: String; var AList: TPackageCodeList); overload; override;
    procedure PayorList(var AList: TList); override;

    function ShipmentOptionBool(const AName: String) : Boolean; override;
    function ShipmentOptionFloat(const AName: String) : Real; override;
    function ShipmentOptionInt(const AName: String) : Integer; override;
    function PackageOptionBool(const AName: String) : Boolean; override;
    function PackageOptionFloat(const AName: String) : Real; override;
    function PackageOptionInt(const AName: String) : Integer; override;

   published
    { Published declarations }
    property CarrierType:TCarrierType read GetCarrierType;
end;

implementation

uses
  IQMS.Common.Boolean,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  shipman_rscstr,
  ups_httplink_label
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  ,editmemostr
  }
  ;


procedure UPS_ServiceCodeList(const ASenderCountryCode: String;
                                    ARecipientCountryCode: String;
                              const AReturnServices: Boolean;
                                var AList: TServiceCodeList);
var
   i: Integer;
   ACode, ADescription: String;
   st: TUPSService;
begin
  // Returns default service code list
  if not Assigned(AList) then Exit;

  { ----------------------------------------------------------------------------
    NOTES:

    The arrays used in this method are contained in unit,
    \ups_httplink\ups_httplink_typelib.pas.  The UPS documentation,
    "Jan 2009 Message Layouts.pdf" was used to identify available
    services. But "Jan 2005 Comprehensive BR_v21.pdf" was used for
    additional clarification on business rules.
  -----------------------------------------------------------------------------}

  if (ASenderCountryCode = 'ALL') then
    begin
         for i := Ord(Low(TUPSService)) to Ord(High(TUPSService)) do
          begin
            st := TUPSService(i); // this unit
            ACode := UPS_ServiceCode[st];
            ADescription := UPS_ServiceCodeDescrip[st];
            AList.Add(ctUPS, ACode, ADescription);
          end;
    end
  else
  if AReturnServices then
    begin
      if (ASenderCountryCode = ARecipientCountryCode) then
       begin
         for i := Low(UPSReturnServiceDomesticCodes) to High(UPSReturnServiceDomesticCodes) do
          begin
            st := UPSReturnServiceDomesticCodes[i]; // this unit
            ACode := UPS_ServiceCode[st];
            ADescription := UPS_ServiceCodeDescrip[st];
            AList.Add(ctUPS, ACode, ADescription);
          end;
       end
      else
       begin
         for i := Low(UPSReturnServiceIntlCodes) to High(UPSReturnServiceIntlCodes) do
          begin
            st := UPSReturnServiceIntlCodes[i]; // this unit
            ACode := UPS_ServiceCode[st];
            ADescription := UPS_ServiceCodeDescrip[st];
            AList.Add(ctUPS, ACode, ADescription);
          end;
       end
    end
  // Domestic Shipments Originating in United States
  else
  if (ASenderCountryCode = 'US') and
     (ARecipientCountryCode = 'US') then
     for i := Low(UPS_ServiceCode_USADomestic) to High(UPS_ServiceCode_USADomestic) do
     begin
       ACode := UPS_ServiceCode_USADomestic[i];
       st := UPS_ServiceType_From_Code(ACode); // this unit
          ADescription := UPS_ServiceCodeDescrip[st];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // Puerto Rico Shipments Originating in United States
  else if (ASenderCountryCode = 'US') and
     (ARecipientCountryCode = 'PR') then
     for i := Low(UPS_ServiceCode_USAPR) to High(UPS_ServiceCode_USAPR) do
     begin
       ACode := UPS_ServiceCode_USAPR[i];
       st := UPS_ServiceType_From_Code(ACode); // this unit
          ADescription := UPS_ServiceCodeDescrip[st];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // International Shipments Originating in United States
  else if (ASenderCountryCode = 'US') and
     (ARecipientCountryCode <> 'US') then
   begin
     for i := Low(UPS_ServiceCode_USAInternational) to High(UPS_ServiceCode_USAInternational) do
     begin
       ACode := UPS_ServiceCode_USAInternational[i];
       st := UPS_ServiceType_From_Code(ACode); // this unit
          ADescription := UPS_ServiceCodeDescrip[st];
       AList.Add(ctUPS, ACode, ADescription);
     end;
     if ((ARecipientCountryCode = 'CA') or (ARecipientCountryCode = 'MX')) then //phillip added
       AList.Add(ctUPS, UPS_ServiceCode[upsStandard], UPS_ServiceCodeDescrip[upsStandard]);
    end

  // Shipments Originating in Puerto Rico
  else if (ASenderCountryCode = 'PR') then
     for i := Low(UPS_ServiceCode_PuertoRico) to High(UPS_ServiceCode_PuertoRico) do
     begin
       ACode := UPS_ServiceCode_PuertoRico[i];
       st := UPS_ServiceType_From_Code(ACode); // this unit
          ADescription := UPS_ServiceCodeDescrip[st];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // Domestic Shipments Originating in Canada
  else if (ASenderCountryCode = 'CA') and
     (ARecipientCountryCode = 'CA') then
     for i := Low(UPS_ServiceCode_CanadaDomestic) to High(UPS_ServiceCode_CanadaDomestic) do
     begin
       ACode := UPS_ServiceCode_CanadaDomestic[i];
       ADescription := UPS_ServiceCodeDescrip_CanadaDomestic[i];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // Transborder Shipments Originating in Canada
  else if (ASenderCountryCode = 'CA') and
   ((ARecipientCountryCode = 'US') or
    (ARecipientCountryCode = 'MX')) then
     for i := Low(UPS_ServiceCode_CanadaTrans) to High(UPS_ServiceCode_CanadaTrans) do
     begin
       ACode := UPS_ServiceCode_CanadaTrans[i];
       ADescription := UPS_ServiceCodeDescrip_CanadaTrans[i];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // International Shipments Originating in Canada
  else if (ASenderCountryCode = 'CA') and
    (ARecipientCountryCode <> 'CA') then
     for i := Low(UPS_ServiceCode_CanadaInternational) to High(UPS_ServiceCode_CanadaInternational) do
     begin
       ACode := UPS_ServiceCode_CanadaInternational[i];
       ADescription := UPS_ServiceCodeDescrip_CanadaInternational[i];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // Shipments Originating in Mexico
  else if (ASenderCountryCode = 'MX') then
     for i := Low(UPS_ServiceCode_MexicoDomestic) to High(UPS_ServiceCode_MexicoDomestic) do
     begin
       ACode := UPS_ServiceCode_MexicoDomestic[i];
       ADescription := UPS_ServiceCodeDescrip_MexicoDomestic[i];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // Polish Domestic Shipments
  else if (ASenderCountryCode = 'PL') and
          (ARecipientCountryCode = 'PL') then
     for i := Low(UPS_ServiceCode_Polish) to High(UPS_ServiceCode_Polish) do
     begin
       ACode := UPS_ServiceCode_Polish[i];
       st := UPS_ServiceType_From_Code(ACode); // this unit
          ADescription := UPS_ServiceCodeDescrip[st];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // Shipments Originating in the European Union
  else if IQMS.Common.StringUtils.StrInList(ASenderCountryCode, EuropeanUnion) then
     for i := Low(UPS_ServiceCode_Euro) to High(UPS_ServiceCode_Euro) do
     begin
       ACode := UPS_ServiceCode_Euro[i];
       st := UPS_ServiceType_From_Code(ACode); // this unit
          ADescription := UPS_ServiceCodeDescrip[st];
       AList.Add(ctUPS, ACode, ADescription);
     end

  // Shipments Originating in Other Countries
  else
     for i := Low(UPS_ServiceCode_Foreign) to High(UPS_ServiceCode_Foreign) do
     begin
       ACode := UPS_ServiceCode_Foreign[i];
       st := UPS_ServiceType_From_Code(ACode); // this unit
          ADescription := UPS_ServiceCodeDescrip[st];
       AList.Add(ctUPS, ACode, ADescription);
     end;

end;

function UPS_Service_Description_From_Code(ACode: String): String;
var
   AList: TServiceCodeList;
   i: Integer;
   AItemCode: String;
begin
  try
     AList := TServiceCodeList.Create;
     UPS_ServiceCodeList('ALL', '', False, AList);
     for i := 0 to AList.Count - 1 do
      begin
        AItemCode := TServiceCodeItem(AList.Items[i]).Code;
        if AItemCode = ACode then
           begin
             Result := TServiceCodeItem(AList.Items[i]).Description;
             Break;
           end;
      end;
  finally
     if Assigned(AList) then FreeAndNil(AList);
  end;
end;

function UPS_ServiceType_From_Code(const ACode: String): TUPSService;
var
   i: Integer;
begin
  Result := TUPSService(0);
  for i := Ord(Low(UPS_ServiceCode)) to Ord(High(UPS_ServiceCode)) do
      if UPS_ServiceCode[TUPSService(i)] = ACode then
         begin
           Result := TUPSService(i);
           BREAK;
         end;
end;

function UPS_PackageType_From_Code(const ACode: String): TUPSPackaging;
var
   i: Integer;
   S: String;
begin
   Result := upkUnkown;
   for i := Ord(Low(UPS_PackagingCode)) to Ord(High(UPS_PackagingCode)) do
       if UPS_PackagingCode[TUPSPackaging(i)] = ACode then
          begin
            Result := TUPSPackaging(i);
            BREAK;
          end;
end;

function UPS_Packaging_Description_From_Code(const ACode: String): String;
var
   i: Integer;
   S: String;
begin
   Result := '';
   for i := Ord(Low(UPS_PackagingCode)) to Ord(High(UPS_PackagingCode)) do
       if UPS_PackagingCode[TUPSPackaging(i)] = ACode then
          begin
            Result := UPS_PackagingDescrip[TUPSPackaging(i)];
            BREAK;
          end;
end;

{ ---------------------------------------------------------------------------- }
{ TUPSManager }
{ ---------------------------------------------------------------------------- }

constructor TUPSManager.Create(AOwner: TComponent; ASourceID: Real; ASource: String;
  ACarrierID: Real);
begin
  inherited Create(AOwner, ASourceID, ASource, ACarrierID);

end;

procedure TUPSManager.InitValues;
begin
  // Initialize values
  SetSourceID(0, '');
  ClearPackageRec(Package);
  Package.PickupCode := UPS_PickupCode[0];
  Package.PickupCodeDescription := UPS_PickupDescrip[0];
  Package.WeightUOM := UPSWeightUOM[uwLBS];
  Package.DimensionUOM := UPSDimensionUOM[udIN]; // 'IN'
  Package.PackageCode := UPS_PackagingCode[upkLetter];
  Package.PackageCodeDescription := UPS_PackagingDescrip[upkLetter];
  Package.ServiceCode := UPS_ServiceCode[upsGround]; // Ground
  Package.ServiceCodeDescription := UPS_ServiceCodeDescrip[upsGround]; // Ground
end;

procedure TUPSManager.Process_Shop(var AList: TServiceCodeList);
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
          ADotNetObject.UPSShopRate( SecurityManager.UserName,
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
          ADotNetObject.UPSGetRate( SecurityManager.UserName,
                                      SecurityManager.Password,
                                      IQGetServerName( 'IQ' ),
                                      Source, SourceID, ShopRequestID);
        finally
          FreeDNetObject( ADotNetObject );
        end;
      finally
        RestoreFPU( CW );
      end;

    end;
      PopulateShopRates(FShopRequestID, CarrierType, AList, false);
end;

function TUPSManager.Process_ShipmentRate: Boolean;
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
      Result := ADotNetObject.UPSGetRate( SecurityManager.UserName,
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


procedure TUPSManager.PackageCodeList(const AServiceCode: String; var AList: TPackageCodeList);
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
       AList.Add(ctUPS, UPS_PackagingCode[TUPSPackaging(x)], UPS_PackagingDescrip[TUPSPackaging(x)]);
     end;
  end;
  // ---------------------------------------------------------------------------
var
   i: Integer;
   ACode,
   ADescription: String;
begin
       if _ServiceTypeIs(UPS_ServiceCode[upsStandard]  {'11'}) then  // UPS Standard
          _Build([Ord(upkCustomerSupplied),    // Customer supplied package,
                  Ord(upkLetter),    // UPS letter,
                  Ord(upkTube),    // Tube,
                  Ord(upkPAK),    // PAK,
//                  Ord(upkUPSBox),    // UPS express box,
                  Ord(upkUPSBoxSmall),    // UPS small express box,
                  Ord(upkUPSBoxMedium),    // UPS medium express box,
                  Ord(upkUPSBoxLarge),    // UPS large express box,
                  Ord(upkUPS25KGbox),    // UPS 25KG box,
                  Ord(upkUPS10KGbox),   // UPS 10KG box,
                  Ord(upkPallet)])  // Pallet

  else if _ServiceTypeIs(UPS_ServiceCode[upsThreeDaySelect]  {'12'}) or  // UPS Three-Day Select®
          _ServiceTypeIs(UPS_ServiceCode[upsGround]  {'03'}) then  // UPS Ground
          _Build([Ord(upkCustomerSupplied)])    // Customer supplied package,

  else if _ServiceTypeIs(UPS_ServiceCode[upsNextDayAirEarlyAM]  {'14'}) or  // UPS Next Day Air® Early A.M. SM
          _ServiceTypeIs(UPS_ServiceCode[upsNextDayAir]  {'01'}) or  // UPS Next Day Air®
          _ServiceTypeIs(UPS_ServiceCode[upsNextDayAirSaver]  {'13'}) or  // UPS Next Day Air Saver®
          _ServiceTypeIs(UPS_ServiceCode[upsSecondDayAirAM] {59'}) or // UPS Second Day Air A.M.®
          _ServiceTypeIs(UPS_ServiceCode[upsSecondDayAir]  {'02'}) then  // UPS Second Day Air®
          _Build([Ord(upkCustomerSupplied),    // Customer supplied package,
                  Ord(upkLetter),    // UPS letter,
                  Ord(upkTube),    // Tube,
                  Ord(upkPAK),    // PAK,
                  Ord(upkUPSBoxSmall),    // UPS express box small,
                  Ord(upkUPSBoxMedium),    // UPS express box medium,
                  Ord(upkUPSBoxLarge)])   // UPS express box large,


  else if _ServiceTypeIs(UPS_ServiceCode[upsWorldwideExpressPlus] {54'}) then // UPS Worldwide Express PlusSM
          _Build([Ord(upkCustomerSupplied),    // Customer supplied package,
                  Ord(upkLetter),    // UPS letter,
                  Ord(upkTube),    // Tube,
                  Ord(upkPAK),    // PAK,
                  Ord(upkUPSBoxSmall),    // UPS express box small,
                  Ord(upkUPSBoxMedium),    // UPS express box medium,
                  Ord(upkUPSBoxLarge),    // UPS express box large,
                  //6,    // UPS small express box,
                  //7,    // UPS medium express box,
                  //8,    // UPS large express box,
                  Ord(upkUPS25KGbox),    // UPS 25KG box,
                  Ord(upkUPS10KGbox),   // UPS 10KG box,
                  Ord(upkPallet)])  // Pallet

  else if _ServiceTypeIs(UPS_ServiceCode[upsWorldwideSaver] {65'}) then // UPS Saver
          _Build([Ord(upkCustomerSupplied),    // Customer supplied package,
                  Ord(upkLetter),    // UPS letter,
                  Ord(upkTube),    // Tube,
                  Ord(upkPAK),    // PAK,
                  Ord(upkUPSBoxSmall),    // UPS small express box,
                  Ord(upkUPSBoxMedium),    // UPS medium express box,
                  Ord(upkUPSBoxLarge),    // UPS large express box,
                  Ord(upkUPS25KGbox),    // UPS 25KG box,
                  Ord(upkUPS10KGbox),   // UPS 10KG box,
                  Ord(upkPallet)])  // Pallet

  else if _ServiceTypeIs(UPS_ServiceCode[upsWorldwideExpress] {07'}) then // UPS Worldwide ExpressSM
          _Build([Ord(upkCustomerSupplied),    // Customer supplied package,
                  Ord(upkLetter),    // UPS letter,
                  Ord(upkTube),    // Tube,
                  Ord(upkPAK),    // PAK,
                  Ord(upkUPSBoxSmall),    // UPS small express box,
                  Ord(upkUPSBoxMedium),    // UPS medium express box,
                  Ord(upkUPSBoxLarge),    // UPS large express box,
                  Ord(upkUPS25KGbox),    // UPS 25KG box,
                  Ord(upkUPS10KGbox),   // UPS 10KG box,
                  Ord(upkPallet)])  // Pallet

  else if _ServiceTypeIs(UPS_ServiceCode[upsWorldwideExpedited] {08'}) then // UPS Worldwide ExpeditedSM
          _Build([Ord(upkCustomerSupplied),    // Customer supplied package,
                  Ord(upkTube),    // Tube,
                  Ord(upkPAK),    // PAK,
                  Ord(upkUPSBoxSmall),    // UPS small express box,
                  Ord(upkUPSBoxMedium),    // UPS medium express box,
                  Ord(upkUPSBoxLarge),    // UPS large express box,
                  Ord(upkUPS25KGbox),    // UPS 25KG box,
                  Ord(upkUPS10KGbox),   // UPS 10KG box,
                  Ord(upkPallet)])  // Pallet

end;

function TUPSManager.PackageOptionBool(const AName: String): Boolean;
begin
  Result := IQMS.Common.Boolean.YNToBool(SelectValueFmtAsString('select %s from shipment_pkg_opt_ups where shipment_packages_id = %.0f', [AName, Package.ID]));
end;

function TUPSManager.PackageOptionFloat(const AName: String): Real;
begin
  Result := SelectValueFmtAsFloat('select %s from shipment_pkg_opt_ups where shipment_packages_id = %.0f', [AName, Package.ID]);
end;

function TUPSManager.PackageOptionInt(const AName: String): Integer;
begin
  Result := Round(SelectValueFmtAsFloat('select %s from shipment_pkg_opt_ups where shipment_packages_id = %.0f', [AName, Package.ID]));
end;

procedure TUPSManager.ServiceCodeList(var AList: TServiceCodeList);
var
  i: Integer;
begin

  UPS_ServiceCodeList( ShippingInfo.Sender.CountryCode,
                       ShippingInfo.Recipient.CountryCode,
                       (Source = 'RETURN_SHIPMENT'),
                       AList );
   if Assigned(FValidServiceCodes) then
    begin
        i := 0;
        while (i < AList.Count) do
          if not (FValidServiceCodes.IndexOf(TServiceCodeItem(AList.Items[i]).Code) >= 0) then
            AList.Delete(i)
          else
            i := i + 1;
    end
   else
    begin
      FValidServiceCodes := TStringList.Create;
       if (ShippingInfo.International and not (ShippingInfo.Recipient.CountryCode = 'PR')) then
         begin
            i := 0;
            while (i < AList.Count) do
              begin
                  FValidServiceCodes.Add(TServiceCodeItem(AList.Items[i]).Code);
                  i := i + 1;
              end;
            if (ShippingInfo.Recipient.CountryCode = 'MX') then
              begin
                FValidServiceCodes.Add(UPS_ServiceCode[upsStandard]);
                AList.Add(ctUPS, UPS_ServiceCode[upsStandard], UPS_ServiceCodeDescrip[upsStandard]);
              end;
        end
   else
     begin
        i := 0;
        while (i < AList.Count) do
          begin
            if ((Source <> 'RETURN_SHIPMENT') and (
                {2010 Daily Rates - UPS Next Day Air Early AM: 48 states and AK }
                ((ShippingInfo.Recipient.State = 'HI') and (TServiceCodeItem(AList.Items[i]).Code  = '14')) or
                {2010 Daily Rates - UPS Next Day Air Saver: Available to the 48 contiguous states  }
                (((ShippingInfo.Recipient.State = 'HI') or (ShippingInfo.Recipient.State = 'AK')) and (TServiceCodeItem(AList.Items[i]).Code  = '13')) or
                {2010 Daily Rates - UPS 3 Day Select: Available to the 48 contiguous states  }
                (((ShippingInfo.Recipient.State = 'HI') or (ShippingInfo.Recipient.State = 'AK')) and (TServiceCodeItem(AList.Items[i]).Code  = '12'))
                )) then
                  AList.Delete(i)
            else
              begin
                FValidServiceCodes.Add(TServiceCodeItem(AList.Items[i]).Code);
                i := i + 1;
              end;
          end;
     end;
   end;
   {2010 Daily Rates - UPS 2nd Day Air AM: Not available to residential destinations.  }
   if (ShippingInfo.PackingSlip.Residential) then
     begin
       i := AList.IndexOfCode(ctUPS, '59');
       if (i >= 0) then
         AList.Delete(i)
     end;
end;

procedure TUPSManager.ValidateAccount;
begin
  // Validate Account information
  if (FAccountNumber = '') then
     raise Exception.Create(shipman_rscstr.cTXT000033 {'UPS Account number not provided.'});
end;

function TUPSManager.Process_CancelShipment(cancelAll: Boolean = false): Boolean;
begin

  Result := TRUE;
end;

function TUPSManager.Process_CloseShipment: Boolean;
begin
  Result := TRUE;
end;

function TUPSManager.Process_ShipShipment: Boolean;
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
      Result := ADotNetObject.UPSShipShipment( SecurityManager.UserName,
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


procedure TUPSManager.PayorList(var AList: TList);
begin

end;


function TUPSManager.GetCarrierType: TCarrierType;
begin
  Result:= ctUPS;
end;

function TUPSManager.Service_Description_From_Code(ACode: String): String;
begin
  Result := UPS_Service_Description_From_Code(ACode);
end;

function TUPSManager.ShipmentOptionBool(const AName: String): Boolean;
begin
  Result := IQMS.Common.Boolean.YNToBool(SelectValueFmtAsString('select %s from shipment_option_ups where source = ''%s'' and source_id = %.0f', [AName, Source, SourceID]));
end;

function TUPSManager.ShipmentOptionFloat(const AName: String): Real;
begin
  Result := SelectValueFmtAsFloat('select %s from shipment_option_ups where source = ''%s'' and source_id = %.0f', [AName, Source, SourceID]);
end;

function TUPSManager.ShipmentOptionInt(const AName: String): Integer;
begin
  Result := Round(SelectValueFmtAsFloat('select %s from shipment_option_ups where source = ''%s'' and source_id = %.0f', [AName, Source, SourceID]));
end;


end.
