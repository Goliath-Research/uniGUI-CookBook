unit shipman_usps;

{NOTE: This unit is in development.  It connects to shipper site and obtains
       or processes data.}

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  System.Variants,
  System.SysUtils,
  IQMS.Common.DotNetCOMInterOp,
  Vcl.Printers,
  shipman_shipper,
  shipman_common,
  shipman_printconst,
  FireDAC.Phys,
  MainModule;

  function USPS_Service_Description_From_Code(const ACode: String): String;
  function USPS_Packaging_Description_From_Code(const ACode: String): String;
  procedure USPS_Account(var AUserName, APassword: String);
  procedure USPS_ParseWeight(const AWeight: Real; var APounds: Integer;
     var AOunces: Real);
  function USPS_WeightInOunces(const AWeight: Real): Real;

  // IN: Service Code.  OUT:  Service Type
  function USPS_ServiceTypeFor(AServiceCode: String): String;


type
   TUSPSPackageAction = (uspsRateRequest, uspsPrintLabel);

   TCustomsForm = (cfCN22, cfCP72);

   TUSPSManager = class(TShipperManager)
   private
    { Private declarations }
    FUpdateSenderAddressPrompted: Boolean;
    FCompanyId: Real;
    FPrintEODInstructions: Boolean;
    FComInitialized: Boolean;
    FDotNetFactory: Variant;
    FDotNetInvoker: Variant;
    FLogID: Real;
    function ValidateAccount(const AUserName, APassword: String; ASilent: Boolean = FALSE): Boolean;
    procedure ValidatePackageAccount;
    procedure ValidatePackage;
    function ValidateContactName: Boolean;

    // Updates the IQSYS or EPLANTED Sender address
    procedure UpdateSenderAddress(const Address1, ACity, AState, AZip: String);

    procedure ShopDomestic(var AList: TServiceCodeList; AShowAll: Boolean = TRUE);
    procedure ShopInternational(var AList: TServiceCodeList);

    function ProcessExpressPackage(Action: TUSPSPackageAction): Boolean;
    function ProcessInternationalPackage(Action: TUSPSPackageAction): Boolean;
    procedure ParseAccountStr(const AAccount: String; var AUserName,
      APassword: String);
    function PrintUsingDefaultAssociatedApplication(AFileName: AnsiString;
      AWaitForApplicationToFinish: Boolean = TRUE): Boolean;
    procedure InitCOM;

   protected
    { Protected declarations }
    procedure InitValues; override;
    function GetCarrierType: TCarrierType; override;
    function URL(AType: TURLType): String; overload;
    function PrintLabel_Express: Boolean;
    function PrintLabel_International: Boolean;
    function PrintReturnLabel: Boolean;
    function PrintConfirmationLabel: Boolean;
    procedure PrintCustomsForm(AForm: TCustomsForm);
   public
    { Public declarations }
    destructor Destroy; override;
    // Processing shipping and rates
    function Process_ShipmentRate: Boolean; override;               // calculate the shipment rate
    function Process_ShipShipment: Boolean; override;               // ship the shipment
    function Process_CancelShipment(cancelAll: Boolean = false): Boolean; override;            // cancel the shipment
    function Process_CloseShipment: Boolean; override;             // close out the shipment (end-of-day)
    procedure Process_Shop(var AList: TServiceCodeList); override; // rate shopping

    // When is the earliest available date for pickup? Function returns true,
    // if pickup is available for this address.
    function CheckPickupAvailability(var ADate: TDateTime; var ARoute: String): Boolean;
    function DeliveryDate(const AStartDate: TDateTime; var ADeliveryDate: TDateTime): Boolean;
    procedure PickupInquiry;

    // Helper (informational) methods
    procedure ServiceCodeList(var AList: TServiceCodeList); override;
    procedure PackageCodeList(const AServiceCode: String; var AList: TPackageCodeList); overload; override;
    procedure PayorList(var AList: TList); override;
    procedure PrintFile(AColumnName, ATableName: String; AID: Real;
      AExt: String = '.PDF');

   published
    { Published declarations }
    property CarrierType:TCarrierType read GetCarrierType;
    property CompanyId: Real read FCompanyId write FCompanyId;
    property PrintEODInstructions: Boolean read FPrintEODInstructions write FPrintEODInstructions;
    property LogId: Real read FLogID write FLogID;
end;

const
  USER_AGENT = 'EnterpriseIQ 7.6';
  SHIPMAN_DOTNETDLL = 'IQMS.IQShipman';
  SHIPMAN_DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';

{  PackageLocations: array[TibucarrierpickupPackageLocations] of String =
   ('Not Set',
    'Front Door',
    'Back Door',
    'Side Door',
    'Knock on Door',
    'Mail Room',
    'Office',
    'Reception',
    'In Mailbox',
    'Other');
 }
implementation

uses
  IQMS.WebVcl.Blob,
  IQMS.Common.ErrorDialog,
  IQMS.Common.FileUtils,
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  iqinfobox,prn_share,IQMS.Common.DNetInteropConst,
  }
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,

  shipman_print,
  shipman_rscstr,
  Winapi.ShellAPI
  ;

function USPS_Service_Description_From_Code(const ACode: String): String;
var
   i: Integer;
   S: String;
begin
   Result := '';
   for i := Low(USPS_ServiceCode) to High(USPS_ServiceCode) do
       if USPS_ServiceCode[i] = ACode then
          begin
            Result := USPS_ServiceCodeDescription[i];
            BREAK;
          end;
end;

function USPS_Packaging_Description_From_Code(const ACode: String): String;
var
   i: Integer;
   S: String;
begin
   Result := '';
   for i := Low(USPS_PackagingCode) to High(USPS_PackagingCode) do
       if USPS_PackagingCode[i] = ACode then
          begin
            Result := USPS_PackagingDescrip[i];
            BREAK;
          end;
   if (Result = '') then
     for i := Low(USPS_FirstClassPackagingCode) to High(USPS_FirstClassPackagingCode) do
       if USPS_FirstClassPackagingCode[i] = ACode then
          begin
            Result := USPS_FirstClassPackagingDescrip[i];
            BREAK;
          end;
end;

procedure USPS_Account(var AUserName, APassword: String);
var
   AParams: TStringList;
begin
  try
     AParams := TStringList.Create;
     FillAccountValues(ctUSPS, AParams);
     AUserName := AParams.Values['UserName'];
     APassword := AParams.Values['Password'];
  finally
     if Assigned(AParams) then AParams.Free;
  end;
end;

procedure USPS_ParseWeight(const AWeight: Real; var APounds: Integer;
   var AOunces: Real);
var
   R: Real;
begin
  { NOTE:  There are 16 ounces per 1 pound }
  R := Frac(AWeight) * 16;
  APounds := Trunc(AWeight);
  AOunces := R;
end;

function USPS_WeightInOunces(const AWeight: Real): Real;
begin
  Result := 16 * AWeight;
end;

function USPS_ServiceTypeFor(AServiceCode: String): String;
begin
 {     USFC              USPS First-Class Mail®
       USMM              USPS Media Mail
       USPM              USPS Priority Mail®
       USXM              USPS Priority Mail® Express
       USPS              USPS Parcel Select
       USLM              USPS Library Mail
}

 if IQMS.Common.StringUtils.StrInList(AServiceCode, ['USFC']) then
    Result := 'FIRST_CLASS'
 else if IQMS.Common.StringUtils.StrInList(AServiceCode, ['USPM']) then
    Result := 'PRIORITY'
 else if IQMS.Common.StringUtils.StrInList(AServiceCode, ['USPS']) then
    Result := 'PARCEL'
 else if IQMS.Common.StringUtils.StrInList(AServiceCode, ['USMM']) then
    Result := 'MEDIA'
 else if IQMS.Common.StringUtils.StrInList(AServiceCode, ['USLM']) then
    Result := 'LIBRARY'
 else if IQMS.Common.StringUtils.StrInList(AServiceCode, ['USXM']) then
    Result := 'EXPRESS'
 else
    Result := 'ALL';
end;
{ ---------------------------------------------------------------------------- }
{ TUSPSManager }
{ ---------------------------------------------------------------------------- }

procedure TUSPSManager.InitValues;
begin
  // Initialize values
  SetSourceID(0, '');
  ClearPackageRec(Package);
  FComInitialized := false;
{  Package.PickupCode := FEDEX_PickupCode[0];
  Package.PickupCodeDescription := FEDEX_PickupDescrip[0];
  Package.WeightUOM := UOM_Weight[wmLBS]; // LBS
  Package.PackageCode := FEDEX_PackagingCode[6];
  Package.PackageCodeDescription := FEDEX_PackagingDescrip[6];
  Package.ServiceCode := FEDEX_ServiceCode[11]; // Ground
  Package.ServiceCodeDescription := FEDEX_ServiceCodeDescrip[11]; // Ground
}
end;

procedure TUSPSManager.InitCOM;
begin
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  if not FComInitialized then
    begin
      CreateDNetCOM_Factory(FDotNetFactory, DNetFactoryDLL, SecurityManager, false);
      CreateDNetCOM_Invoker(FDotNetFactory, FDotNetInvoker, SHIPMAN_DOTNETDLL, SHIPMAN_DOTNETCOMTYPE, 'ShipmanInterface');
      FComInitialized := true;
    end;
 }
end;

function TUSPSManager.Process_ShipmentRate: Boolean;
var
  CW: Word;
  aParamArray : array of Variant;
  args: Variant;
begin
  DisableFPUExceptions( CW );
  try
    InitCOM;

    //six params for USPSGetRate, so set length to 5
    aParamArray:= VarArrayCreate([0,5], varVariant);
    //Set param in the param array
    aParamArray[0]:= SecurityManager.UserName;
    aParamArray[1]:= SecurityManager.Password;
    aParamArray[2]:= IQGetServerName( 'IQ' );
    aParamArray[3]:= Source;
    aParamArray[4]:= SourceID;
    aParamArray[5]:= 0; // shopRequestId
    //Convert Array to Variant that can be passed thru COM
    args:= CreateParamListAsVariant( aParamArray );

    Result := FDotNetInvoker.InvokeFunctionEx('USPSGetRate', args);

  finally
    RestoreFPU( CW );
  end;
end;

procedure TUSPSManager.ServiceCodeList(var AList: TServiceCodeList);
var
   i: Integer;
   ACode, ADescription: String;
begin
  // Returns default package list
  if not Assigned(AList) then Exit;
  if (ShippingInfo.Recipient.CountryCode = 'US')  then
    begin
    for i := Low(USPS_ServiceCode) to High(USPS_ServiceCode) do
      begin
        ACode := USPS_ServiceCode[i];
        ADescription := USPS_ServiceCodeDescription[i];
        AList.Add(ctUSPS, ACode, ADescription);
      end;
    end
  else
    begin
    for i := Low(USPS_ServiceCodeInt) to High(USPS_ServiceCodeInt) do
      begin
        ACode := USPS_ServiceCode[USPS_ServiceCodeInt[i]];
        ADescription := USPS_ServiceCodeDescription[USPS_ServiceCodeInt[i]];
        AList.Add(ctUSPS, ACode, ADescription);
      end;
    end;
end;

procedure TUSPSManager.PackageCodeList(const AServiceCode: String; var AList: TPackageCodeList);
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
       AList.Add(ctUSPS, USPS_PackagingCode[x], USPS_PackagingDescrip[x]);
     end;
  end;
  // ---------------------------------------------------------------------------
  procedure _BuildFirstClass(const ACodes: array of Integer);
  var
     i, x: Integer;
  begin
    for i := Low(ACodes) to High(ACodes) do
     begin
       x := ACodes[i];
       AList.Add(ctUSPS, USPS_FirstClassPackagingCode[x], USPS_FirstClassPackagingDescrip[x]);
     end;
  end;
  // ---------------------------------------------------------------------------
var
   AType: String;
begin

  // check object
  if not Assigned(AList) then Exit;

{

  USPS_ServiceCode: array[0..11] of String =
   ('0','1','2','3','4','5','6','7','12','13','16','17');
  USPS_ServiceCodeInt: array[0..11] of Integer =
   (0,1,2,3,4,5,6,7,12,13,16,17);
  USPS_ServiceCodeDescription: array[0..11] of String =
   ('USPS First-Class Mail®','USPS Priority Mail®','USPS Express Mail PO to PO',
    'USPS Express Mail PO to Addressee','USPS Parcel Post®','USPS Bound Printed Matter',
    'USPS Media Mail','USPS Library Mail','USPS First-Class Postcard Stamped',
    'USPS Express Mail Flat-Rate Envelope','USPS Priority Mail Flat-Rate Envelope',
    'USPS Priority Mail Flat-Rate Box');


  USPS_PackagingCode: array[0..5] of String = ('0','1','2','3','4','5');
  USPS_PackagingDescrip: array[0..5] of String = ('Unspecified',
   'Flat-Rate Envelope','Flat-Rate Box','Rectangular Package',
   'Non-Rectangular Package','Variable');

}

{
Service 	     First Class    Size           Container      Machinable?    Dimensions     Girth          Max. Weight
---------------------------------------------------------------------------------------------------------------------
All            Ignored        Regular        Rectangular    Required       Ignored        Ignored        70 lbs.
All            Ignored        Large          Rectangular    Required       Required       Ignored        70 lbs.
All            Ignored        Oversize       Rectangular    Required       Ignored        Ignored        70 lbs.
All            Ignored        Regular        Nonrectangular Required       Ignored        Ignored        70 lbs.
All            Ignored        Large          Nonrectangular Required       Required       Required       70 lbs.
All            Ignored        Oversize       Nonrectangular Required       Ignored        Ignored        70 lbs.
All            Ignored        Regular        Variable/Null  Required       Ignored        Ignored        70 lbs.
All            Ignored        Large          Variable/Null  Required       Ignored        Ignored        70 lbs.
All            Ignored        Oversize       Variable/Null  Required       Ignored        Ignored        70 lbs.

First Class    Letter         Ignored        Ignored        Required       Ignored        Ignored        3.5 oz.
First Class    Flat           Ignored        Ignored        Required       Ignored        Ignored        13 oz.
First Class    Parcel         Ignored        Ignored        Ignored        Ignored        Ignored        13 oz.

Priority       Ignored        Regular        Flat Rate Box  Ignored        Ignored        Ignored        70 lbs.
Priority       Ignored        Ignored        Flat Rate Env. Ignored        Ignored        Ignored        70 lbs.
Priority       Ignored        Large          Rectangular    Ignored        Required       Ignored        70 lbs.
Priority       Ignored        Large          Nonrectangular Ignored        Required       Required       70 lbs.
Priority       Ignored        Regular        Variable/Null  Ignored        Ignored        Ignored        70 lbs.

Express        Ignored        Regular/Large  Flat Rate Env. Ignored        Ignored        Ignored        70 lbs.
Express        Ignored        Regular/Large  Variable/Null  Ignored        Ignored        Ignored        70 lbs.

Parcel Post    Ignored        Regular        Ignored        Required       Ignored        Ignored        70 lbs.
Parcel Post    Ignored        Large          Ignored        Required       Ignored        Ignored        70 lbs.
Parcel Post    Ignored        Oversize       Ignored        Required       Ignored        Ignored        70 lbs.

BPM            Ignored        Regular/Large  Ignored        Ignored        Ignored        Ignored        15 lbs.
Media Mail     Ignored        Regular/Large  Ignored        Ignored        Ignored        Ignored        70 lbs.
Library Mail   Ignored        Regular/Large  Ignored        Ignored        Ignored        Ignored        70 lbs.
}

  // eval by service type
  AType := USPS_ServiceTypeFor(AServiceCode);
  LoadDBOptions;

  if (AType = 'PRIORITY') then
     begin
       //Valid container types for "Priority Mail - Large" are Rectangular and NonRectangular.
       case Package.PackageSizeType of
        0: // Regular
            _Build([1,    // 'Flat-Rate Envelope'
                    6,    // 'Padded Flat-Rate Envelope'
                    7,    // 'Legal Flat-Rate Envelope'
                    2,    // 'Flat-Rate Box'
                    3,    // 'Rectangular Package'
                    4]);  // 'Non-Rectangular Package'
        1: // Large
          _Build([2,   // 'Flat-Rate Box'
                  3,   // 'Rectangular Package'
                  4]);  // 'Non-Rectangular Package'
        2: // Oversize
          _Build([
                  3,   // 'Rectangular Package'
                  4]);  // 'Non-Rectangular Package'
        3: // Small
            _Build([2]);  // 'Flat-Rate Box'
       end;
     end

  // Build a special list for First Clas
  else if (AType = 'FIRST_CLASS') then
     _BuildFirstClass([0,   // Letter
                       1,   // Parcel
                       2])  // Flat

  else if (AType = 'PARCEL') then
     _Build([3,   // 'Rectangular Package'
             4])  // 'Non-Rectangular Package'

  else if (AType = 'EXPRESS') then
     _Build([1,    // 'Flat-Rate Envelope'
             6,    // 'Padded Flat-Rate Envelope'
             7,    // 'Legal Flat-Rate Envelope'
             2])   // 'Flat-Rate Box'

  else if (AType = 'ALL') then
     _Build([1,   // 'Flat-Rate Envelope'
             2,   // 'Flat-Rate Box'
             3,   // 'Rectangular Package'
             4]); // 'Non-Rectangular Package'

end;

procedure TUSPSManager.Process_Shop(var AList: TServiceCodeList);
var
  CW: Word;
  aParamArray : array of Variant;
  args: Variant;
begin
  DisableFPUExceptions( CW );
  try
    InitCOM;


    if (Source = 'SHIPMAN_SHOP_REQUEST') then
    begin
        //five params for USPSShopRate, so set length to 4
        aParamArray:= VarArrayCreate([0,4], varVariant);
        //Set param in the param array
        aParamArray[0]:= SecurityManager.UserName;
        aParamArray[1]:= SecurityManager.Password;
        aParamArray[2]:= IQGetServerName( 'IQ' );
        aParamArray[3]:= CarrierId;
        aParamArray[4]:= ShopRequestID;
        //Convert Array to Variant that can be passed thru COM
        args:= CreateParamListAsVariant( aParamArray );
        FDotNetInvoker.InvokeFunctionEx('USPSShopRate', args)
    end
    else
      begin
        if not Assigned(AList) or not Assigned(ShippingInfo) then Exit;
        if not IsPackageDimValid(Package.Length,Package.Width,Package.Height,Package.DimensionUOM,TRUE {Show Error}) then Exit;
        // validate the shipping information
        with ShippingInfo do
         begin
           if not ValidateSenderData or
              not ValidateRecipientData then
              Exit;

           // Check to see if the recipient country requires a min $1 declared value
           if CheckMinDeclaredValue then
              shipman_common.CheckDeclaredValueRequired(Recipient.CountryCode,Package.DeclaredValue);
         end;
        //six params for USPSGetRate, so set length to 5
        aParamArray:= VarArrayCreate([0,5], varVariant);
        //Set param in the param array
        aParamArray[0]:= SecurityManager.UserName;
        aParamArray[1]:= SecurityManager.Password;
        aParamArray[2]:= IQGetServerName( 'IQ' );
        aParamArray[3]:= Source;
        aParamArray[4]:= SourceID;
        aParamArray[5]:= ShopRequestID; // shopRequestId
        //Convert Array to Variant that can be passed thru COM
        args:= CreateParamListAsVariant( aParamArray );
        FDotNetInvoker.InvokeFunctionEx('USPSGetRate', args);
      end;
  finally
    RestoreFPU( CW );
  end;

  PopulateShopRates(FShopRequestID, CarrierType, AList, false);
end;

procedure TUSPSManager.ShopDomestic(var AList: TServiceCodeList;
 AShowAll: Boolean = TRUE);
var
   hMsg: TPanelMesg;
   i, x: Integer;
//   o: TibuDomesticRates;
   APounds, AOunces: Integer;
   AUserName, APassword,
   AService, ADescription: String;
   AOptionsCost, AListPrice, ATotalCost: Real;
   ALogMsg: TStringList;
   // --------------------------------------------------------------------------
   procedure _AddRow;
   var
      o: TServiceCodeItem;
   begin
     o :=  AList.Add(ctUSPS, AService, ADescription);
     if o = NIL then Exit;
     with o do
      begin
        OptionsCost := AOptionsCost;
        ListPrice   := AListPrice;
        TotalCost   := ATotalCost;
      end;
   end;
   // --------------------------------------------------------------------------
begin
  // Get the account information
  // NOTE:  We cannot get this from the package

//  USPS_Account(AUserName, APassword);
//  if not ValidateAccount(AUserName, APassword, TRUE {Silent}) then
     Exit;
{
  LoadDBOptions; // loads the package options
  o := TibuDomesticRates.Create(NIL);
  with o, ShippingInfo, PackageOptions do
  try
     hMsg := hPleaseWait('Processing.  Please wait.');
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Calculate Postage');
     try
        // Populate the TibfRates object
        // Ensure vars are initialized in component
        Reset;

        // fill required values
        UserID   := AUserName;
        Password := APassword;
        Server := URL(utRates);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);
        AddLn(ALogMsg, 'HTTP Version', o.Config('HTTPVersion'));

        // Basic values
        FromZipCode := Sender.Zip;
        ToZipCode   := Recipient.Zip;
        USPS_ParseWeight(Package.ActualWeight, APounds, AOunces);
        PackagePounds := APounds;
        PackageOunces := AOunces;

        // This will show all rates
        if AShowAll then
           ServiceType := svcAll;
        PackageSize := TibudomesticratesPackageSizes(Package.PackageSizeType); // psRegular;

        // Only set these properties if we want a specific rate
        if not AShowAll then
           begin
             PackageLength := Trunc(Package.Length);
             PackageWidth  := Trunc(Package.Width);
             PackageHeight := Trunc(Package.Height);
             PackageGirth  := Trunc(Package.Girth);
             Machinable    := ValueAsBoolean('Machinable');

             // Filter by Service
             ServiceType := IBizUSPSDomestic_ServiceType(USPS_ServiceTypeFor(Package.ServiceCode));
             // First Class type
             if (ServiceType = ibudomesticrates.svcFirstClass) then
                FirstClassType := IBizUSPSDomestic_FirstClassType(Package.PackageCode)
             else FirstClassType := ibudomesticrates.fctNA;
             // Container is provided for all services, except for First Class
             if not (ServiceType = ibudomesticrates.svcFirstClass) then
                ShippingContainer := IBizUSPSDomestic_PackagingType(Package.PackageCode);
           end;

        // * Execute
        CalculatePostage;
}
        {The USPS Server will return a list of
         postage services availible for mailing your package. You can access
         these services through the PostageRate and PostageService array
         properties. Indicies for the postage services start at 0, and the
         total number of services returned is indicated by the PostageCount
         property. The number of PostalZones between the FromZipCode and
         ToZipCode will also be returned, along with any Restrictions for
         mailing to APO/FPO addresses. }
 {
        AddLn(ALogMsg, 'Postage Count', IntToStr(o.PostageCount));
        for i := 0 to PostageCount - 1 do // zero-based
         begin
           // now, get values
           //x            := PostageServiceID[i];
           AService     := IntToStr(PostageServiceID[i]);
           ADescription := USPS_Service_Description_From_Code(AService);
           AOptionsCost := 0;
           AListPrice   := IQMS.Common.Numbers.StoF(PostageRate[i], 0.00);
           ATotalCost   := AListPrice;
           _AddRow;
         end;

        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, False,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));
     except on E:Exception do
      begin
        // For debugging
        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        raise Exception.CreateFmt('U.S. Postal Service Error:'#13'%s',[E.Message]);
      end;
     end;
  finally
     if Assigned(hMsg) then FreeAndNil(hMsg);
     if Assigned(o) then FreeAndNil(o);
     if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end; }
end;

procedure TUSPSManager.ShopInternational(var AList: TServiceCodeList);
var
   hMsg: TPanelMesg;
   i, x: Integer;
//   o: TibuInternationalRates;
   AUserName, APassword,
   AService, ADescription: String;
   APounds, AOunces: Integer;
   AOptionsCost, AListPrice, ATotalCost: Real;
   AServiceMailType: Integer;
   AStrField1,
   AStrField2: String;
   ALogMsg: TStringList;

   AComment: TStringList;

   // --------------------------------------------------------------------------
   procedure _AddRow;
   var
      o: TServiceCodeItem;
   begin
     o :=  AList.AddEx(ctUSPS, AService, ADescription,
                       0,   // AFloatField1
                       0,   // AFloatField2
                       AServiceMailType,   // AIntField1
                       0,   // AIntField2
                       AStrField1,  // AStrField1
                       AStrField2   // AStrField2
                       );
     if o = NIL then Exit;
     with o do
      begin
        OptionsCost := AOptionsCost;
        ListPrice   := AListPrice;
        TotalCost   := ATotalCost;
      end;
   end;
begin
  // Get the account information
  // NOTE:  We cannot get this from the package
//  USPS_Account(AUserName, APassword);
//  if not ValidateAccount(AUserName, APassword, TRUE {Silent}) then
     Exit;
     {
  LoadDBOptions; // loads the package options
  o := TibuInternationalRates.Create(NIL);
  with o, ShippingInfo do
  try
     hMsg := hPleaseWait('Processing.  Please wait.');
     AComment := TStringList.Create;
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Calculate Postage');
     try
        // Populate the TibfRates object
        // Ensure vars are initialized in component
        Reset;

        // fill required values
        UserID   := AUserName;
        Password := APassword;
        Server := URL(utRates);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        DestinationCountry := Recipient.Country;

        USPS_ParseWeight(Package.ActualWeight, APounds, AOunces);
        if Package.ActualWeight = 0 then
           AOunces := 3;
        PackagePounds := APounds;
        PackageOunces := AOunces;

        MailType := TibuinternationalratesMailTypes(PackageOptions.ValueAsInt('MailType'));
        if Package.DeclaredValue = 0 then Package.DeclaredValue := 1;
        ValueOfContents := FloatToStr(Package.DeclaredValue);

        // * Execute
        CalculatePostage;
}
        {The USPS Server will return a list of
         postage services availible for mailing your package. You can access
         these services through the PostageRate and PostageService array
         properties. Indicies for the postage services start at 0, and the
         total number of services returned is indicated by the PostageCount
         property. The number of PostalZones between the FromZipCode and
         ToZipCode will also be returned, along with any Restrictions for
         mailing to APO/FPO addresses. }
 {
        AddLn(ALogMsg, 'Service Count', IntToStr(o.ServiceCount));
        for i := 0 to ServiceCount - 1 do
         begin
           // now, get values
           //x            := PostageServiceID[i];
           AService     := IntToStr(ServiceID[i]);
           ADescription := USPS_Service_Description_From_Code(AService);
           AOptionsCost := IQMS.Common.Numbers.StoF(InsuranceCost[i], 0.00); // use options cost for insurance cost
           AListPrice   := IQMS.Common.Numbers.StoF(Postage[i], 0.00);
           ATotalCost   := AListPrice;
           AServiceMailType := Ord(IBizUSPSDomestic_ServiceType(ServiceMailType[i]));

           AComment.Clear;

           //if ExpressMail[i] > '' then AComment.Add(Format('Express Mail: %s',[ExpressMail[i]]));
           if ServiceCommitments[i] > '' then AComment.Add(Format('Service Commitments: %s',[ServiceCommitments[i]]));
           if MaxDimensions[i] > '' then AComment.Add(Format('Maximum Dimensions: %s',[MaxDimensions[i]]));
           if MaxWeight[i] > '' then AComment.Add(Format('Maximum Weight: %s',[MaxWeight[i]]));
           if InsuranceComment[i] > '' then AComment.Add(Format('No insurance required: %s',[InsuranceComment[i]]));
           if IndemnityCoverage[i] > '' then AComment.Add(Format('Indemnity Coverage: %s',[IndemnityCoverage[i]]));

           //if CustomsForms[i] > '' then AComment.Add(Format('Required Customs Vcl.Forms: %s',[CustomsForms[i]]));
           AStrField1 := AComment.Text;

           _AddRow;

         end;

        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, False ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

     except on E:Exception do
      begin
        // For debugging
        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        raise Exception.CreateFmt('U.S. Postal Service Error:'#13'%s',[E.Message]);
      end;
     end;
  finally
     if Assigned(hMsg) then FreeAndNil(hMsg);
     if Assigned(o) then FreeAndNil(o);
     if Assigned(AComment) then FreeAndNil(AComment);
     if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

function TUSPSManager.ValidateAccount(const AUserName, APassword: String;
 ASilent: Boolean = FALSE): Boolean;
begin
  // Validate Account information
  Result := (Trim(AUserName) > '') and (Trim(APassword) > '');
  if not Result and not ASilent then
     // 'U.S. Postal Service account information is incomplete.';
     raise Exception.Create(shipman_rscstr.cTXT000071);
end;

procedure TUSPSManager.ValidatePackageAccount;
var
   AUserName, APassword: String;
begin
  ParseAccountStr(Package.Account, AUserName, APassword);
  ValidateAccount(AUserName, APassword);
end;

function TUSPSManager.Process_CancelShipment(cancelAll: Boolean = false): Boolean;
var
  CW: Word;
  hMsg:TPanelMesg;
  aParamArray : array of Variant;
  args: Variant;
begin
  DisableFPUExceptions( CW );
  try
    hMsg := hPleaseWait('Cancelling Package...');

    try

      InitCom;

      //four params for USPSCancelLabel, so set length to 3
      aParamArray:= VarArrayCreate([0,3], varVariant);
      //Set param in the param array
      aParamArray[0]:= SecurityManager.UserName;
      aParamArray[1]:= SecurityManager.Password;
      aParamArray[2]:= IQGetServerName( 'IQ' );
      aParamArray[3]:= Package.ID;
      //Convert Array to Variant that can be passed thru COM
      args:= CreateParamListAsVariant( aParamArray );
      Result := FDotNetInvoker.InvokeFunctionEx('USPSCancelLabel', args);

    finally
      if Assigned( hMsg ) then hMsg.Free;
    end;

  finally
    RestoreFPU( CW );
  end;
end;

function TUSPSManager.Process_CloseShipment: Boolean;
var
  CW: Word;
  hMsg: TPanelMesg;
  aParamArray : array of Variant;
  args: Variant;
begin
  // initial
  Result := FALSE;
  FLogID := 0;

  try
    hMsg := hPleaseWait('Processing.  Please wait.');
    DisableFPUExceptions( CW );
    try
      InitCOM;

      //six params for USPSClose, so set length to 5
      aParamArray:= VarArrayCreate([0,5], varVariant);
      //Set param in the param array
      aParamArray[0]:= SecurityManager.UserName;
      aParamArray[1]:= SecurityManager.Password;
      aParamArray[2]:= IQGetServerName( 'IQ' );
      aParamArray[3]:= CarrierID;
      aParamArray[4]:= CompanyId;
      aParamArray[5]:= PrintEODInstructions;
      //Convert Array to Variant that can be passed thru COM
      args:= CreateParamListAsVariant( aParamArray );

      FLogID := FDotNetInvoker.InvokeFunctionEx('USPSClose', args);

    finally
      RestoreFPU( CW );
    end;

    Result := FLogID > 0;

  finally
     if Assigned(hMsg) then FreeAndNil(hMsg);
  end;

end;

procedure TUSPSManager.PrintFile(AColumnName: String; ATableName: String; AID: Real; AExt: String = '.PDF' );
var
  ATempFileName: TFileName;
  AMemoryStream: TMemoryStream;
  ACurrentPrinterIndex, ADefaultPrinterIndex: Integer;
  APrinterName: String;
begin

  Printer.Refresh();
  ACurrentPrinterIndex := Printer.PrinterIndex;
  Printer.PrinterIndex := -1;
  ADefaultPrinterIndex := Printer.PrinterIndex;
  // get the label information
  APrinterName := GetReportPrinter;
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  if (not IQSetPrinter(APrinterName)) then
     raise Exception.CreateFmt( 'Could not find printer %s', [APrinterName ]);;
  }
  IQMS.Common.Miscellaneous.ChangeWindowsDefaultPrinter( Printer.Printers[ Printer.PrinterIndex ]) ;

  // get temp file; we will save binary data to this file
  ATempFileName := GetPrinterFileName(ptLaser, AExt);

  // extract clob to file
    AMemoryStream:= TMemoryStream.Create;
    { TODO -ombaral -cWebIQ : Need to resolve dependency
    if TIQMS.WebVcl.Blob.GetBlob( AColumnName, // column name
                      ATableName,  // table name
                      AID,
                      AMemoryStream ) then
    begin
      with TFileStream.Create(ATempFileName, fmCreate) do
        try
          CopyFrom(AMemoryStream, AMemoryStream.Size)
        finally
          Free
        end;

      PrintUsingDefaultAssociatedApplication(ATempFileName, False);
    end;
  }
  Printer.PrinterIndex := ACurrentPrinterIndex;
  IQMS.Common.Miscellaneous.ChangeWindowsDefaultPrinter( Printer.Printers[ ADefaultPrinterIndex ]) ;
  Application.ProcessMessages;
  IQMS.Common.Miscellaneous.EnsureZeroJobsInPrintQueue();

  DeleteFilesOlderThan( IncludeTrailingPathDelimiter(IQGetLocalHomePath) + 'Temp\*.*' , 1 );  {IQMS.Common.FileUtils.pas}

end;

function TUSPSManager.PrintUsingDefaultAssociatedApplication( AFileName: AnsiString; AWaitForApplicationToFinish: Boolean = TRUE ): Boolean;
label
  Finish;
var
  ShellExecuteInfo: TShellExecuteInfoA;
begin
  Result:= FALSE;

  if not FileExists(AFileName) then
     EXIT;

  // init
  FillChar( ShellExecuteInfo, SizeOf(TShellExecuteInfo), 0);
  with ShellExecuteInfo do
  begin
    cbSize := SizeOf(TShellExecuteInfoA);
    Wnd    := Application.Handle; // Application.MainForm.Handle; reference to Application.MainForm will hang UP IQRF
    lpFile := PAnsiChar( AFileName );
    lpVerb := 'print';
    nShow  := SW_SHOWDEFAULT;
//    fMask  := SEE_MASK_FLAG_NO_UI;
  end;

  // launch
  if not ShellExecuteExA( @ShellExecuteInfo ) then
     raise Exception.CreateFmt( 'Failure attempting to call ShellExecuteExA. Error Code = %d', [ GetLastError ]);

  if ShellExecuteInfo.hProcess = 0 then
     goto Finish;

  if AWaitForApplicationToFinish then
  begin
    WaitForSingleObject( ShellExecuteInfo.hProcess, INFINITE );
    CloseHandle(ShellExecuteInfo.hProcess);
  end;

  Result:= TRUE;

  Finish:
  {wait extra 5 seconds for the system to print submitted doc}
  Application.ProcessMessages;
  Sleep(5000);
end;

function TUSPSManager.ValidateContactName: Boolean;
begin
  Result := False;
  if Assigned(ShippingInfo) then
  with ShippingInfo do
  begin
    // ensure that both vars have a value
{    if (Trim(Recipient.FirstName)='') then
       Recipient.FirstName := Recipient.LastName;
    if (Trim(Recipient.LastName)='') then
       Recipient.LastName := Recipient.FirstName;}
    if (Trim(Recipient.FirstName + Recipient.LastName)='') then
       raise Exception.Create('Contact name is required on U.S. Postal Service packages.');
  end;
  Result := TRUE;
end;

function TUSPSManager.Process_ShipShipment: Boolean;
var
  CW: Word;
  aParamArray : array of Variant;
  args: Variant;
begin
  DisableFPUExceptions( CW );
  try
    InitCOM;

    //five params for USPSShipShipment, so set length to 4
    aParamArray:= VarArrayCreate([0,4], varVariant);
    //Set param in the param array
    aParamArray[0]:= SecurityManager.UserName;
    aParamArray[1]:= SecurityManager.Password;
    aParamArray[2]:= IQGetServerName( 'IQ' );
    aParamArray[3]:= Source;
    aParamArray[4]:= SourceID;
    //Convert Array to Variant that can be passed thru COM
    args:= CreateParamListAsVariant( aParamArray );

    Result := FDotNetInvoker.InvokeFunctionEx('USPSShipShipment', args);

  finally
    RestoreFPU( CW );
  end;
end;

procedure TUSPSManager.PayorList(var AList: TList);
begin

end;

function TUSPSManager.CheckPickupAvailability(var ADate: TDateTime;
 var ARoute: String): Boolean;
var
   //o: TibuCarrierPickup;
   AUserName, APassword,
   ADateStr: String;
   ALogMsg: TStringList;
begin
  // initial
  Result := FALSE;
  ADate  := 0;
   Exit;
   {
  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Source ID must be provided.');

  // Get the account information
  // NOTE:  We cannot get this from the package
  USPS_Account(AUserName, APassword);
  ValidateAccount(AUserName, APassword);
  o := TibuCarrierPickup.Create(NIL);
  LoadDBOptions; // loads the package options
  with o, ShippingInfo do
  try

     Result := Sender.CountryCode = 'US';
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Pickup Availability');


     try
        // fill required values
        UserID   := AUserName;
        Password := APassword;
        Server   := URL(utShipment);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        FirmName := Sender.Company;
        Address  := Sender.Address1;
        City     := Sender.City;
        State    := Sender.State;
        ZipCode  := Sender.Zip;

        // execute
        PickupAvailability;

        ADateStr := o.Date;
        ARoute := o.CarrierRoute;
        AddLn(ALogMsg, 'Date', ADateStr);
        AddLn(ALogMsg, 'Route', ARoute);

        Result := ADateStr > '';

        IQMS.Dates.IsStringValidDate(ADateStr, ADate);

        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, False ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

     except on E:Exception do
      begin
        // write to log
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        // For debugging
        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        raise Exception.CreateFmt('U.S. Postal Service Error:'#13'%s',[E.Message]);
      end;
     end;
  finally
    if Assigned(o) then FreeAndNil(o); // free TibuCarrierPickup
    if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

function TUSPSManager.URL(AType: TURLType): String;
var
   ADefault: String;
begin
  (*
   This URL used for: AddressInfo, DomesticRates, InternationalRates,
                      ShippingTime, and TrackAndConfirm
   URL_USPS_1 = 'http://production.shippingapis.com/ShippingAPI.dll';

   This URL used for: CarrierPickup, ConfirmationLabels, CustomsLabels,
                      ExpressLabels, InternationalLabels, and ReturnLabels
   URL_USPS_2 = 'https://secure.shippingapis.com/ShippingAPI.dll';
  *)
  if (AType in [utRates,utTracking]) then ADefault := URL_USPS_1 else ADefault := URL_USPS_2;
  Result := shipman_common.GetURL(Package.CarrierID,AType,ADefault);
end;

procedure TUSPSManager.UpdateSenderAddress(const Address1, ACity,
  AState, AZip: String);
  // ---------------------------------------------------------------------------
  procedure _UpdateIQSysField(AFieldName, ANewValue: String);
  begin
  if (AFieldName > '') and (ANewValue > '') then
     ExecuteCommandParam(Format('update iqsys set'#13 +
                       '  %s = :%s'#13 +
                       'where rownum < 2', [AFieldName, UpperCase(AFieldName)]),
                       [UpperCase(AFieldName)],
                       [ANewValue]);
  end;
  // ---------------------------------------------------------------------------
  procedure _UpdateEplantField(AFieldName, ANewValue: String);
  begin
  if (AFieldName > '') and (ANewValue > '') then
     ExecuteCommandParam(Format('update eplant set'#13 +
                       '  %s = :%s'#13 +
                       'where id = :ID', [AFieldName, UpperCase(AFieldName)]),
                       [UpperCase(AFieldName),
                        'ID'],
                       [ANewValue,
                        SecurityManager.EPlant_ID_AsFloat]);
  end;
  // ---------------------------------------------------------------------------
begin
  // USPS requires that the recipient address be updated
  if (SourceID = 0) or not Assigned(ShippingInfo) then
     Exit;

  // if we have already prompted to update the sender address for this session,
  // then don't prompt again.
  if FUpdateSenderAddressPrompted then
     Exit;

  FUpdateSenderAddressPrompted := TRUE;

  // Prompt user to update
  if ((UpperCase(Address1) <> UpperCase(ShippingInfo.Sender.Address1)) or
      (UpperCase(ACity) <> UpperCase(ShippingInfo.Sender.City)) or
      (UpperCase(AState) <> UpperCase(ShippingInfo.Sender.State)) or
      (UpperCase(AZip) <> UpperCase(ShippingInfo.Sender.Zip))) then
      begin
       if not IQConfirmYN(Format('Do you want to update your (sender) address as follows:'#13#13 +
                             ' Address: %s'#13 +
                             ' City: %s'#13 +
                             ' State or Region: %s'#13 +
                             ' Postal Code: %s'#13#13 +
                             'This is a "standardized address," and it may be required if you wish to cancel the package later.',
                             [Address1,
                              ACity,
                              AState,
                              AZip])) then Exit;
      end
  else Exit;

  // update the address values
  if SecurityManager.EPlant_ID_AsFloat > 0 then
     begin
       _UpdateEplantField('ADDRESS1', Address1);
       _UpdateEplantField('CITY',     ACity);
       _UpdateEplantField('STATE',    AState);
       _UpdateEplantField('ZIP',      AZip);
     end
  else
     begin
       _UpdateIQSysField('ADDRESS1', Address1);
       _UpdateIQSysField('CITY',     ACity);
       _UpdateIQSysField('STATE',    AState);
       _UpdateIQSysField('ZIP',      AZip);
     end;

(*
  if (Address1 > '') then
     ExecuteCommandParam('update shipments set'#13 +
                       '  ship_to_addr1 = :SHIP_TO_ADDR1'#13 +
                       'where id = :ID',
                       ['SHIP_TO_ADDR1',
                        'ID'],
                       [Address1,
                        ShipmentsID]);

  if (ACity > '') then
     ExecuteCommandParam('update shipments set'#13 +
                       '  ship_to_city = :SHIP_TO_CITY'#13 +
                       'where id = :ID',
                       ['SHIP_TO_CITY',
                        'ID'],
                       [ACity,
                        ShipmentsID]);

  if (AState > '') then
     ExecuteCommandParam('update shipments set'#13 +
                       '  ship_to_state = :SHIP_TO_STATE'#13 +
                       'where id = :ID',
                       ['SHIP_TO_STATE',
                        'ID'],
                       [AState,
                        ShipmentsID]);

  if (AZip > '') then
     ExecuteCommandParam('update shipments set'#13 +
                       '  ship_to_zip = :SHIP_TO_ZIP'#13 +
                       'where id = :ID',
                       ['SHIP_TO_ZIP',
                        'ID'],
                       [AZip,
                        ShipmentsID]);
*)

end;

function TUSPSManager.PrintLabel_Express: Boolean;
begin
  Result := ProcessExpressPackage(uspsPrintLabel);
end;

function TUSPSManager.PrintLabel_International: Boolean;
begin
  Result := ProcessInternationalPackage(uspsPrintLabel);
end;

function TUSPSManager.ProcessExpressPackage(Action: TUSPSPackageAction): Boolean;
var
   i, x: Integer;
//   o: TibuExpressLabels;
   AUserName, APassword,
   AService, ADescription: String;
   ALogMsg: TStringList;
begin
  Result := False;
  // Get the account information
  // NOTE:  We cannot get this from the package
//  USPS_Account(AUserName, APassword);
//  if not ValidateAccount(AUserName, APassword, TRUE {Silent}) then
     Exit;
{  o := TibuExpressLabels.Create(NIL);
  LoadDBOptions; // loads the package options
  with o, ShippingInfo, PackageOptions do
  try
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Calculate Postage');
     try
        // Ensure vars are initialized in component
        Reset;

        // fill required values
        UserID   := AUserName;
        Password := APassword;
        Server := URL(utLabels);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        FromFirm := Sender.Company;
        if Sender.Address2 > '' then
          begin
           FromAddress1 := Sender.Address1;
           FromAddress2 := Sender.Address2;
          end
        else FromAddress2 := Sender.Address1;
        FromCity := Sender.City;
        FromState := Sender.State;
        FromZipCode := Sender.Zip;
        //FromZip4 := "1234"
        FromPhone := IQMS.Common.StringUtils.Numerics(Sender.Telephone);
        ToFirstName := Recipient.FirstName;
        ToLastName := Recipient.LastName;
        ToFirm := Recipient.Company;
        if Recipient.Address2 > '' then
          begin
           ToAddress2 := Recipient.Address2;
           ToAddress1 := Recipient.Address1;
          end
        else
           ToAddress2 := Recipient.Address1;
        ToCity := Recipient.City;
        ToState := Recipient.State;
        ToZipCode := Recipient.Zip;
        ToZip4 := Recipient.PostalCodeSuffix;
        ToPhone := IQMS.Common.StringUtils.Numerics(Recipient.Telephone);
        //ToZip4 := "1234"
        FlatRate := ValueAsBoolean('FlatRate');
        NoWeekendDelivery := ValueAsBoolean('NoWeekendDelivery');
        NoHolidayDelivery := ValueAsBoolean('NoHolidayDelivery');
        StandardizeAddress := True;
                  }
        {In general, items must weigh 70 pounds (1120 ounces) or less.
         First-Class Mail cannot exceed 13 ounces.
         Bound Printed Matter cannot exceed 15 pounds.
         On international shipments, weight limits vary by country.}
                   {
        // Package weight must be translated out to ounces
        WeightInOunces := USPS_WeightInOunces(Package.ActualWeight);

        if (USPS_ServiceTypeFor(Package.ServiceCode) = 'FIRST_CLASS') and
           (WeightInOunces > 13) then
           Exit
        else if (USPS_ServiceTypeFor(Package.ServiceCode) = 'BPM') and
           (WeightInOunces > 15) then
           Exit
        else if (WeightInOunces > 1120) then
           Exit;

        case Action of
         uspsPrintLabel:
          begin
            AddLn(ALogMsg, 'Action', 'Print label');
            // TibuexpresslabelsImageTypes = (itNone, itTIF, itJPG, itPDF, itGIF);
            // For ExpressMailLabels the only valid image types are PDF, GIF, or NONE.
            ImageType := ibuexpresslabels.itGIF; // hard-coded for now
            ShippingLabelFile := GetPrinterFileName(ptLaser, '.GIF'); // example: "c:\expresslabel.gif";
            //Config('Overwrite=True'); // Bug
            if FileExists(ShippingLabelFile) then
               DeleteFile(ShippingLabelFile);

            GetExpressMailLabel; // execute

            Package.LabelBinary := ShippingLabel;
            Package.LabelFile := ShippingLabelFile;

            // Note: Do not update the tracking number in this method,
            //       or you will not be able to cancel the package.
            Package.ActualCost   := StrToFloat(Postage);
            Package.BillableCost := StrToFloat(Postage);
          end;
         uspsRateRequest:
          begin
            AddLn(ALogMsg, 'Action', 'Rate request');
            ImageType := ibuexpresslabels.itNone; // none desired
            ShippingLabelFile := '';

            GetExpressMailLabel; // execute

            // Note: Do not update the tracking number in this method,
            //       or you will not be able to cancel the package.
            //ProcessSoftError(Config('Warning'));
            Package.ActualCost   := StrToFloat(Postage);
            Package.BillableCost := StrToFloat(Postage);

            // write to log
            if Action = uspsRateRequest then
               shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, False ,
                 ALogMsg.Text, Config('FullRequest'), Config('FullResponse'))
            else
               shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, False ,
                 ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

          end;
        end; // end case

      Result := TRUE; // pass TRUE here

      UpdateSenderAddress(FromAddress1,FromCity,FromState,FromZipCode);

     except on E:Exception do
      begin
        // write to log
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        if Action = uspsRateRequest then
           shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, True,
             ALogMsg.Text, Config('FullRequest'), Config('FullResponse'))
        else
           shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, True,
             ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        // For debugging
        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        // NOTE:  Trap this:  it must be a soft error
        // IQMS.Common.Dialogs.IQError(Format('U.S. Postal Service Error:'#13'%s',[E.Message]));
      end;
     end;
  finally
     if Assigned(o) then FreeAndNil(o);
     if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

function TUSPSManager.ProcessInternationalPackage(
  Action: TUSPSPackageAction): Boolean;
var
   i, x: Integer;
//   o: TibuInternationalLabels;
   AUserName, APassword,
   AService, ADescription: String;
   APounds, AOunces: Integer;

   AHTML: TStringList;
   AHTMLTempDir,
   AHTMLFileName,
   AHTMLTitle: String;
   AShowHTML: Boolean;
   ALogMsg: TStringList;
begin
  // Get the account information
  // NOTE:  We cannot get this from the package
//  USPS_Account(AUserName, APassword);
//  if not ValidateAccount(AUserName, APassword, TRUE {Silent}) then
     Exit;
     {
  o := TibuInternationalLabels.Create(NIL);
  LoadDBOptions; // loads the package options
  with o, ShippingInfo do
  try
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Calculate Postage');
     try
        // Ensure vars are initialized in component
        Reset;

        // fill required values
        UserID   := AUserName;
        Password := APassword;
        Server := URL(utLabels);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        FromFirm := Sender.Company;
        FromFirstName := Sender.FirstName;
        FromLastName := Sender.LastName;
        FromMiddleInitial := '';
        FromAddress1 := Sender.Address1;
        if Sender.Address2 > '' then
           FromAddress2 := Sender.Address2
        else
           FromAddress2 := Sender.Address1;
        FromCity := Sender.City;
        FromState := Sender.State;
        FromZipCode := Sender.Zip;
        //FromZip4 := '0000';
        // NOTE:  FromCountry is assumed to be the US
        FromPhone := IQMS.Common.StringUtils.Numerics(Sender.Telephone);

        ToFirm := Recipient.Company;
        ToName := Recipient.Contact;
        ToAddress1 := Recipient.Address1;
        if Recipient.Address2 > '' then
           ToAddress2 := Recipient.Address2
        else
           ToAddress2 := Recipient.Address1;
        ToCity := Recipient.City;
        ToProvince := Recipient.State;
        ToPostalCode := Recipient.Zip;
        ToCountry    := CountryNameFor(CountryCodeFor(Recipient.Country));
        //ToZip4 := "1234"
        ToEMail := Recipient.EMail;
        ToFax := IQMS.Common.StringUtils.Numerics(Recipient.Fax);
        ToPhone := IQMS.Common.StringUtils.Numerics(Recipient.Telephone);

        // Indicates whether or not the ToAddress1 is a Post Office Box
        ToPOBoxFlag := FALSE; // hard-coded for now
        LicenseNumber := ''; // import license number, if known
        // Postal Office Zip Code where the item will be mailed (if different from FromZipCode).
        MailingLocation := ShipmentOptions.ValueAsStr('MailingPostalCode');

        USPS_ParseWeight(Package.ActualWeight, APounds, AOunces);
        PackagePounds := APounds;
        PackageOunces := AOunces;

        // Package contents:
        // (ctSample, ctGift, ctDocuments, ctReturn, ctOther, ctMerchandise)
        Contents := TibuinternationallabelsContents(PackageOptions.ValueAsInt('ContentType',Ord(ctMerchandise)));
        if (Contents = ibuinternationallabels.ctOther) then
           Config(PackageOptions.ValueFormatted('OtherContents'));
        CertificateNumber := ShipmentOptions.ValueAsStr('CertificateNumber');
        FromCustomsReference := ShipmentOptions.ValueAsStr('FromCustomsReference');
        Comments := Package.Contents; // use the "contents" field for "comments"
        MailingLocation := ShipmentOptions.ValueAsStr('MailingPostalCode');

        // Does not apply to First Class
        if Package.ServiceCode <> '0' then
           begin
             InvoiceNumber := PackageOptions.ValueAsStr('InvoiceNumber');
             LicenseNumber := ShipmentOptions.ValueAsStr('LicenseNumber');

             Insured := PackageOptions.ValueAsBoolean('Insured');
             if Insured then
                begin
                  InsuredAmount := PackageOptions.ValueAsFloatStr('InsuredAmount');
                  InsuredNumber := PackageOptions.ValueAsStr('InsuredNumber');
                end;

             NonDeliveryOption := TibuinternationallabelsNonDeliveryOptions(PackageOptions.ValueAsInt('NonDeliveryOption'));
             if NonDeliveryOption = ndoRedirect then
                begin
                  Config(PackageOptions.ValueFormatted('AltReturnAddress1'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress2'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress3'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress4'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress5'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress6'));
                  Config(PackageOptions.ValueFormatted('AltReturnState   '));
                  Config(PackageOptions.ValueFormatted('AltReturnCountry '));
                end;
           end;

        // These are available for First Class mail only
        //if Package.ServiceCode = '0' then // First Class only
        //   begin
        //   end;

        // Itemization is required
        // NOTE:  USPS does not use the FedEx "documents" format; they treat
        //        everything as merchandise.  The ContentType property indicates
        //        the content type (merchandise, documents, etc.), but everything
        //        is itemized like merchandise.

        // NOTE: We do not allow "documents" shipments through USPS;
        //       full merchandise information is required.
        if ShippingInfo.Documents then
           raise Exception.Create('Document shipments are not allowed with USPS. Full merchandise information is required.');


        x := shipman_common.CommodityCount(Package.ID);
        ItemCount := Min(x, 20);  // required

        // something must be provided, or we get an error
        if x = 0 then
           begin
            ItemCount := 1;
            ItemDescription[0] := 'INTERNATIONAL SHIPPING CONTAINERS'; // required
            ItemOrigin[0] := 'United States of America';
            ItemTariffNumber[0] := '980120'; //
            ItemNetPounds[0] := APounds;
            ItemNetOunces[0] := AOunces;
            ItemQuantity[0] := 1;
            ItemValue[0] := '1.00';
           end
        else
          with TFDQuery.Create(NIL) do
          try
            x := 0; // inital
            Connection := MainModule.FDConnection;
            SQL.Add(Format('select * from shipment_commod where shipment_packages_id = %.0f',[Package.ID]));
            Open;
            while not EOF do
             begin
              // 30 is the maximum
              if x > 30 then BREAK;
              ItemDescription[x] := FieldByName('DESCRIP').AsString; // required
              ItemOrigin[x] := CountryNameFor(FieldByName('MFG_COUNTRY').AsString); // required; same as country code
              ItemTariffNumber[x] := FieldByName('CODE').AsString; // required
              USPS_ParseWeight(FieldByName('UNIT_WEIGHT').AsFloat, APounds, AOunces);
              ItemNetPounds[x] := APounds;
              ItemNetOunces[x] := AOunces;
              ItemQuantity[x] := FieldByName('QUANTITY').AsInteger; // required
              ItemValue[x] := FormatFloat('###0.000000',FieldByName('UNIT_PRICE').AsFloat); // optional; 6 decimals
              Inc(x);
              Next;
             end;
          finally
            Free;
          end;

        case Action of
         uspsPrintLabel:
          begin
            // ilOnePerFile, ilAllInOneFile, iTrimLeftOnePerFile, iTrimLeftAllInOneFile
            ImageLayout := iTrimLeftAllInOneFile;
            // TibuexpresslabelsImageTypes = (itNone, itTIF, itJPG, itPDF, itGIF);
            ImageType := ibuinternationallabels.itTIF; // hard-coded for now
            ShippingLabelFile := GetPrinterFileName(ptLaser, '.TIF'); // example: "c:\expresslabel.jpg";
            //Config('Overwrite=True');
            if FileExists(ShippingLabelFile) then
               DeleteFile(ShippingLabelFile);

            // The method we call depends on the service
            case IBizUSPSDomestic_ServiceType(Package.ServiceCode) of
             svcPriority:   GetPriorityLabel;
             svcFirstClass: GetExpressLabel;
             svcExpress:    GetFirstClassLabel;
            else GetExpressLabel;
            end; // end case

            if ShippingLabelCount > 0 then
               begin
                 Package.LabelBinary := ShippingLabels[1];
                 Package.LabelFile := ShippingLabelFile;
               end;

            // Note: Do not update the tracking number in this method,
            //       or you will not be able to cancel the package.
            Package.ActualCost   := StrToFloat(Postage);
            Package.BillableCost := StrToFloat(Postage);

            shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, False ,
              ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));
          end;
         uspsRateRequest:
          begin
            ImageType := ibuinternationallabels.itNone; // none desired
            ShippingLabelFile := '';

            // The method we call depends on the service
            // GetPriorityLabel, GetExpressLabel, or GetFirstClassLabel,
            GetExpressLabel;
            Result := TRUE;

            // Note: Do not update the tracking number in this method,
            //       or you will not be able to cancel the package.
            Package.ActualCost   := StrToFloat(Postage);
            Package.BillableCost := Package.ActualCost;

            // write to log
            shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, False ,
              ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));
          end;
        end; // end case

        // Returned based on insurance
        if Insured then
           PackageOptions.ParamByName('IndemnityCoverage').AsString := IndemnityCoverage;

        PackageOptions.ParamByName('SDRValue').AsString := o.SDRValue;

        // display notes
        if (o.Notes > '')  and (Action = uspsPrintLabel) then
           //IQMS.Common.Dialogs.IQInformation(o.Notes);
           ProcessSoftError(o.Notes);

        // Regulations documentation
        if Action = uspsPrintLabel then
        try
           // We want to use a consistent naming convention for each country code
           // because this data will be the same for each country.  If we are
           // shipping multiple packages, we do not want a new Web page for each
           // package.  We only need one page for the current country.
           AHTMLTempDir  := System.SysUtils.IncludeTrailingPathDelimiter(IQGetLocalHomePath + 'Temp');
           AHTMLFileName := AHTMLTempDir + Format('USPSCondForMail_%s.htm',[Recipient.CountryCode]);
           ForceDirectories(AHTMLTempDir);
           IQMS.Common.FileUtils.DeleteFilesOlderThan(Format('%sUSPSCondForMail*.htm', [AHTMLTempDir]), 3);

           AHTML := TStringList.Create;
           AHTMLTitle := Format('Country Conditions for Mailing - %s',[shipman_region.CountryNameFor(Recipient.CountryCode)]);
           crm_html.AddHTMLHeader(shipman_region.CountryNameFor(Recipient.CountryCode), AHTML);
           crm_html.AddTitle(AHTMLTitle, AHTML);

           if o.Prohibitions > '' then
              begin
                crm_html.AddHeading1('Prohibitions', AHTML);
                crm_html.AddParagraph(o.Prohibitions, AHTML);
                AShowHTML := TRUE;
              end;

           if o.Restrictions > '' then
              begin
                crm_html.AddHeading1('Restrictions', AHTML);
                crm_html.AddParagraph(o.Restrictions, AHTML);
                AShowHTML := TRUE;
              end;

           if o.Observations > '' then
              begin
                crm_html.AddHeading1('Observations', AHTML);
                crm_html.AddParagraph(o.Observations, AHTML);
                AShowHTML := TRUE;
              end;

           if o.Regulations > '' then
              begin
                crm_html.AddHeading1('Regulations', AHTML);
                crm_html.AddParagraph(o.Regulations, AHTML);
                AShowHTML := TRUE;
              end;

           crm_html.AddHTMLFooter(AHTML);

           if AShowHTML then
              begin
                AHTML.SaveToFile(AHTMLFileName);
                IQMS.Common.Miscellaneous.ExecuteProgram(AHTMLFileName);
              end;

        finally
          AHTML.Free;
        end;

     except on E:Exception do
      begin
        // write to log
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        if Action = uspsRateRequest then
           shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcRate, True ,
             ALogMsg.Text, Config('FullRequest'), Config('FullResponse'))
        else
           shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, True,
             ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        // For debugging
        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        // NOTE:  Trap this:  it must be a soft error
        IQMS.Common.Dialogs.IQError(Format('U.S. Postal Service Error:'#13'%s',[E.Message]));
      end;
     end;
  finally
     if Assigned(o) then FreeAndNil(o);
     if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;


procedure TUSPSManager.ValidatePackage;
var
   AType: String;
begin
{
Service 	     First Class    Size           Container      Machinable?    Dimensions     Girth          Max. Weight
---------------------------------------------------------------------------------------------------------------------
First Class    Letter         Ignored        Ignored        Required       Ignored        Ignored        3.5 oz.
First Class    Flat           Ignored        Ignored        Required       Ignored        Ignored        13 oz.
First Class    Parcel         Ignored        Ignored        Ignored        Ignored        Ignored        13 oz.
Priority       Ignored        Regular        Flat Rate Box  Ignored        Ignored        Ignored        70 lbs.
Priority       Ignored        Ignored        Flat Rate Env. Ignored        Ignored        Ignored        70 lbs.
Priority       Ignored        Large          Rectangular    Ignored        Required       Ignored        70 lbs.
Priority       Ignored        Large          Nonrectangular Ignored        Required       Required       70 lbs.
Priority       Ignored        Regular        Variable/Null  Ignored        Ignored        Ignored        70 lbs.
Express        Ignored        Regular/Large  Flat Rate Env. Ignored        Ignored        Ignored        70 lbs.
Express        Ignored        Regular/Large  Variable/Null  Ignored        Ignored        Ignored        70 lbs.
Parcel Post    Ignored        Regular        Ignored        Required       Ignored        Ignored        70 lbs.
Parcel Post    Ignored        Large          Ignored        Required       Ignored        Ignored        70 lbs.
Parcel Post    Ignored        Oversize       Ignored        Required       Ignored        Ignored        70 lbs.
BPM            Ignored        Regular/Large  Ignored        Ignored        Ignored        Ignored        15 lbs.
Media Mail     Ignored        Regular/Large  Ignored        Ignored        Ignored        Ignored        70 lbs.
Library Mail   Ignored        Regular/Large  Ignored        Ignored        Ignored        Ignored        70 lbs.
}

  // eval by service type
  AType := USPS_ServiceTypeFor(Package.ServiceCode);

  if (AType = 'PRIORITY') then
     begin

     end
  else if (AType = 'FIRST_CLASS') then
     begin

     end
  else if (AType = 'PARCEL') then
     begin

     end
  else if (AType = 'BPM') then
     begin

     end
  else if (AType = 'MEDIA') then
     begin
     end
  else if (AType = 'LIBRARY') then
     begin

     end
  else if (AType = 'EXPRESS') then
     begin
     end
  else if (AType = 'ALL') then
     begin

     end;


end;

function TUSPSManager.DeliveryDate(const AStartDate: TDateTime;
 var ADeliveryDate: TDateTime): Boolean;
var
//   o: TibuShippingTime;
   AUserName,
   APassword,
   ADays,
   ADateStr: String;
   i,
   AInterval: Integer;
   ALogMsg: TStringList;
begin
  // initial
  Result := FALSE;
  Exit; // Bug in component, exit early
  {
  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Source ID must be provided.');

  // Get the account information
  // NOTE:  We cannot get this from the package
  USPS_Account(AUserName, APassword);
  ValidateAccount(AUserName, APassword);
  o := TibuShippingTime.Create(NIL);

  with o, ShippingInfo do
  try
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Get Shipping Time');
     try
        Reset;

        // fill required values
        UserID := AUserName;
        Password := APassword;
        Server := URL(utTracking);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        i  := Ord(IBizUSPSDomestic_ServiceType(USPS_ServiceTypeFor(Package.ServiceCode)));
        ServiceType := TibushippingtimeServiceTypes(i);
        // execute
        GetShippingTime(Sender.Zip, Recipient.Zip);

        ADays := Days;

        Result := IQMS.Common.Numbers.IsStringValidInteger(ADays, AInterval);

        if Result then
           ADeliveryDate := Trunc(AStartDate) + AInterval
        else
           ADeliveryDate := Trunc(AStartDate);

        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, False ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

     except on E:Exception do
      begin
        // write to log
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        // For debugging
        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        // Soft error!
        IQError(Format('U.S. Postal Service Error:'#13'%s',[E.Message]));
      end;
     end;
  finally
    if Assigned(o) then FreeAndNil(o); // free TibuCarrierPickup
    if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

destructor TUSPSManager.Destroy;
begin
  if FComInitialized then
    begin
      FreeDNetObject( FDotNetFactory );
      FreeDNetObject( FDotNetInvoker );
    end;
  inherited;
end;

function TUSPSManager.PrintConfirmationLabel: Boolean;
var
//   o: TibuConfirmationLabels;
   AUserName,
   APassword: String;
   i: Integer;
   ALogMsg: TStringList;
begin
  Result := False;
  Exit;
  {
  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Source ID must be provided.');

  // Get the account information
  // NOTE:  We cannot get this from the package
  USPS_Account(AUserName, APassword);
  ValidateAccount(AUserName, APassword);
  o := TibuConfirmationLabels.Create(NIL);

  if not Assigned(PackageOptions) then
     LoadDBOptions; // loads the package options

  with o, ShippingInfo, PackageOptions do
  try
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Print Confirmation Label');
     try
        Reset;

        // fill required values
        UserID := AUserName;
        Password := APassword;
        Server := URL(utLabels);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        if TEST_MODE then
           begin
             Config('Certify=true');
             AddLn(ALogMsg, 'Test Mode', 'Yes');
           end;

        FromFirm     := Sender.Company;
        FromName     := Sender.Contact;
        FromAddress1 := Sender.Address1;
        FromAddress2 := Sender.Address2;
        FromCity     := Sender.City;
        FromState    := Sender.State;
        FromZipCode  := Sender.Zip;

        ToFirm       := Recipient.Company;
        ToName       := Recipient.Contact;
        ToAddress1   := Recipient.Address1;
        ToAddress2   := Recipient.Address2;
        ToCity       := Recipient.City;
        ToState      := Recipient.State;
        ToZipCode    := Recipient.Zip;


        //TibuconfirmationlabelsServiceTypes = (stPriority, stFirstClass, stParcelPost, stBoundPrintedMatter, stMediaMail, stLibraryMail);
        i  := Ord(IBizUSPSDomestic_ServiceType(USPS_ServiceTypeFor(Package.ServiceCode)));
        ServiceType := TibuconfirmationlabelsServiceTypes(i);

        AddressServiceRequest := ValueAsBoolean('AddressServiceRequest');
        LabelDate := ValueAsStr('LabelDate');
        // LabelOption - property will default to 1 and that is what we want.
        // Postal Office Zip Code where the item will be mailed (if different from FromZipCode).
        MailingLocation := ShipmentOptions.ValueAsStr('MailingPostalCode');

        // E-Mail information
        SenderName     := Sender.Company;
        SenderEmail    := Sender.EMail;
        RecipientName  := Recipient.Contact;
        RecipientEmail := Recipient.EMail;

        // this will allow the customer receipt to print separately
        //SeparateReceipt := True;
        ImageType := ibuconfirmationlabels.itGIF; // hard-coded
        CustomerReceiptFile := GetPrinterFileName(ptLaser, '.GIF');
        if FileExists(CustomerReceiptFile) then
           DeleteFile(CustomerReceiptFile);

        CustomerRefNo := ValueAsStr('CustomerRefNo');

        SeparateReceipt := ValueAsBoolean('SeparateReceipt');

        ShippingLabelFile := GetPrinterFileName(ptLaser, '.GIF'); // example: "c:\expresslabel.gif";
        if FileExists(ShippingLabelFile) then
           DeleteFile(ShippingLabelFile);

        WaiveSignature := ValueAsBoolean('WaiveSignature');

        // Execute
        case ValueAsInt('ConfirmationService') of
         0: GetDeliveryConfirmationLabel;
         1: GetSignatureConfirmationLabel;
        else Exit;
        end;

        // Returned values

        Package.LabelBinary := ShippingLabel;
        Package.LabelFile := ShippingLabelFile;
        Package.TrackingNumber := TrackingNumber;
        // update the tracking number immediately, in case other errors follow below
        UpdatePackageTrackingNumber(Package);

        // Need to print customer receipt separately?
        Package.LabelBinary2 := CustomerReceipt;
        Package.LabelFile2 := CustomerReceiptFile;

        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, False ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));
        Result := True;
     except on E:Exception do
      begin
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        // Soft error!
        IQError(Format('U.S. Postal Service Error:'#13'%s',[E.Message]));
      end;
     end;
  finally
    if Assigned(o) then FreeAndNil(o); // free TibuCarrierPickup
    if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

procedure TUSPSManager.PrintCustomsForm(AForm: TCustomsForm);
var
   //o: TibuCustomsLabels;
   AUserName,
   APassword: String;
   i, x, APounds, AOunces: Integer;

   AHTML: TStringList;
   AHTMLTempDir,
   AHTMLFileName,
   AHTMLTitle: String;
   AShowHTML: Boolean;
   ALogMsg: TStringList;
begin
     Exit;
     {
  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Shipments ID must be provided.');

  // Get the account information
  // NOTE:  We cannot get this from the package
  USPS_Account(AUserName, APassword);
  ValidateAccount(AUserName, APassword);
  o := TibuCustomsLabels.Create(NIL);
  LoadDBOptions; // loads the package options
  with o, ShippingInfo do
  try
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Print Customs Form');
     try
        Reset;

        // fill required values
        UserID := AUserName;
        Password := APassword;
        Server := URL(utTracking);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        FromFirstName := Sender.FirstName;
        FromLastName  := Sender.LastName;
        FromFirm      := Sender.Company;
        FromAddress1  := Sender.Address1;
        if Sender.Address2 = '' then
           FromAddress2  := Sender.Address1
        else
           FromAddress2  := Sender.Address2;
        FromCity      := Sender.City;
        FromState     := Sender.State;
        FromZipCode   := Sender.Zip;
        //FromZip4 (optional)
        FromPhone     := IQMS.Common.StringUtils.Numerics(Sender.Telephone);
        CustomerRefNo := PackageOptions.ValueAsStr('CustomerRefNo');

        ToAddress1    := Recipient.Address1;
        ToAddress2    := Recipient.Address2;
        ToAddress3    := Recipient.Address3;
        //ToAddress4
        //ToAddress5
        //ToAddress6
        ToCountry     := Recipient.Country;
        //ToAPOFPOZip
        ToPhone       := IQMS.Common.StringUtils.Numerics(Recipient.Telephone);
        ToFax         := IQMS.Common.StringUtils.Numerics(Recipient.Fax);
        ToEmail       := Recipient.EMail;

        // For CP72 only
        if AForm = cfCP72 then
           begin
             ToReference   := PackageOptions.ValueAsStr('ToCustomsReference');
             NonDeliveryOption := TibucustomslabelsNonDeliveryOptions(PackageOptions.ValueAsInt('NonDeliveryOption'));
             if NonDeliveryOption = ibucustomslabels.ndRedirect then
                begin
                  Config(PackageOptions.ValueFormatted('AltReturnAddress1'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress2'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress3'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress4'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress5'));
                  Config(PackageOptions.ValueFormatted('AltReturnAddress6'));
                  Config(PackageOptions.ValueFormatted('AltReturnState   '));
                  Config(PackageOptions.ValueFormatted('AltReturnCountry '));
                end;
             DeliveryType := ibucustomslabels.dtAirmail; // hard-coded for now
             InvoiceNumber := PackageOptions.ValueAsStr('InvoiceNumber');
             InsuredNumber := PackageOptions.ValueAsStr('InsuredNumber');
             InsuredAmount := PackageOptions.ValueAsStr('InsuredAmount');
             SDRInsuredValue := '0.00'; // hard-coded for now
             Postage := FormatFloat('###0.00',Package.BillableCost);
             Comments := Package.Contents; // same as Comments
           end;

        ImageType     := ibucustomslabels.itGIF; // hard-coded for now
        CustomsFormFile := GetPrinterFileName(ptLaser, '.GIF'); // example: "c:\expresslabel.gif";
        if FileExists(CustomsFormFile) then
           DeleteFile(CustomsFormFile);

        x := shipman_common.CommodityCount(Package.ID);
        ItemCount := Min(x, 20);  // required

        // something must be provided, or we get an error
        if x = 0 then
           begin
            ItemCount := 1;
            ItemDescription[0] := 'INTERNATIONAL SHIPPING CONTAINERS'; // required
            ItemOrigin[0] := 'United States of America';
            ItemTariffNumber[0] := '980120'; //
            ItemNetPounds[0] := APounds;
            ItemNetOunces[0] := AOunces;
            ItemQuantity[0] := 1;
            ItemValue[0] := '1.00';
           end
        else
          with TFDQuery.Create(NIL) do
          try
            x := 0; // inital
            Connection := MainModule.FDConnection;
            SQL.Add(Format('select * from shipment_commod where shipment_packages_id = %.0f',[Package.ID]));
            Open;
            while not EOF do
             begin
              // 30 is the maximum
              if x > 30 then BREAK;
              ItemDescription[x] := FieldByName('DESCRIP').AsString; // required
              ItemOrigin[x] := CountryNameFor(FieldByName('MFG_COUNTRY').AsString); // required; same as country code
              ItemTariffNumber[x] := FieldByName('CODE').AsString; // required
              USPS_ParseWeight(FieldByName('UNIT_WEIGHT').AsFloat, APounds, AOunces);
              ItemNetPounds[x] := APounds;
              ItemNetOunces[x] := AOunces;
              ItemQuantity[x] := FieldByName('QUANTITY').AsInteger; // required
              ItemValue[x] := FormatFloat('###0.000000',FieldByName('UNIT_PRICE').AsFloat); // optional; 6 decimals
              Inc(x);
              Next;
             end;
          finally
            Free;
          end;

        // Package contents:
        // (ctSample, ctGift, ctDocuments, ctReturn, ctOther, ctMerchandise)
        Contents := TibucustomslabelsContents(PackageOptions.ValueAsInt('ContentType',Ord(ctMerchandise)));
        if (Contents = ibucustomslabels.ctOther) then
           Config(PackageOptions.ValueFormatted('OtherContents'));

        CountryOfOrigin := Sender.Country;

        HSTariffNumber  := PackageOptions.ValueAsStr('HSTariffNumber');

        USPS_ParseWeight(Package.ActualWeight, APounds, AOunces);
        GrossPounds := APounds;
        GrossOunces := AOunces;

        // execution
        case AForm of
         cfCN22:
          begin
           // get the form!
           GetFormCN22;
           Package.LabelBinary := CN22Form;
           Package.LabelFile := CustomsFormFile;
           // returned values
           // CN22Form  //Image of the Customs Form CN 22.
           //CustomsFormInstructions
           //BarcodeNumber
           //Restrictions
           //Prohibitions
           //Regulations
           //TotalValue

          end;
         cfCP72:
          begin

           // get the form!
           GetFormCP72;
           // returned values
           //Package.LabelBinary := CN72Forms;
           //Package.LabelFile := CustomsFormFile;

          end;
        else Exit;
        end;


        try
           // We want to use a consistent naming convention for each country code
           // because this data will be the same for each country.  If we are
           // shipping multiple packages, we do not want a new Web page for each
           // package.  We only need one page for the current country.
           AHTMLTempDir  := System.SysUtils.IncludeTrailingPathDelimiter(IQGetLocalHomePath + 'Temp');
           AHTMLFileName := AHTMLTempDir + Format('USPSCondForMail_%s.htm',[Recipient.CountryCode]);
           ForceDirectories(AHTMLTempDir);
           IQMS.Common.FileUtils.DeleteFilesOlderThan(Format('%sUSPSCondForMail*.htm', [AHTMLTempDir]), 3);

           AHTML := TStringList.Create;
           AHTMLTitle := Format('Country Conditions for Mailing - %s',[shipman_region.CountryNameFor(Recipient.CountryCode)]);
           crm_html.AddHTMLHeader(shipman_region.CountryNameFor(Recipient.CountryCode), AHTML);
           crm_html.AddTitle(AHTMLTitle, AHTML);

           if o.Prohibitions > '' then
              begin
                crm_html.AddHeading1('Prohibitions', AHTML);
                crm_html.AddParagraph(o.Prohibitions, AHTML);
                AShowHTML := TRUE;
              end;

           if o.Restrictions > '' then
              begin
                crm_html.AddHeading1('Restrictions', AHTML);
                crm_html.AddParagraph(o.Restrictions, AHTML);
                AShowHTML := TRUE;
              end;

           if o.Observations > '' then
              begin
                crm_html.AddHeading1('Observations', AHTML);
                crm_html.AddParagraph(o.Observations, AHTML);
                AShowHTML := TRUE;
              end;

           if o.Regulations > '' then
              begin
                crm_html.AddHeading1('Regulations', AHTML);
                crm_html.AddParagraph(o.Regulations, AHTML);
                AShowHTML := TRUE;
              end;

           crm_html.AddHTMLFooter(AHTML);

           if AShowHTML then
              begin
                AHTML.SaveToFile(AHTMLFileName);
                IQMS.Common.Miscellaneous.ExecuteProgram(AHTMLFileName);
              end;

        finally
          AHTML.Free;
        end;

        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, False ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

     except on E:Exception do
      begin
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        // Soft error!
        IQError(Format('U.S. Postal Service Error:'#13'%s',[E.Message]));
      end;
     end;
  finally
    if Assigned(o) then FreeAndNil(o); // free TibuCarrierPickup
    if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

function TUSPSManager.PrintReturnLabel: Boolean;
var
//   o: TibuReturnLabels;
   AUserName,
   APassword: String;
   ALogMsg: TStringList;
begin
  Result := False;
  Exit;
{  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Source ID must be provided.');

  // Get the account information
  // NOTE:  We cannot get this from the package
  USPS_Account(AUserName, APassword);
  ValidateAccount(AUserName, APassword);
  o := TibuReturnLabels.Create(NIL);

  with o, ShippingInfo do
  try
     ALogMsg := TStringList.Create;
     ALogMsg.Add('Print Return Label');
     try
        Reset;

        // fill required values
        UserID := AUserName;
        Password := APassword;
        Server := URL(utTracking);
        Config(Format('UserAgent=%s', [USER_AGENT]));

        AddLn(ALogMsg, 'User Name', o.UserID);
        AddLn(ALogMsg, 'Password', o.Password);
        AddLn(ALogMsg, 'URL', o.Server);

        if TEST_MODE then
           begin
             Config('Certify=true');
             AddLn(ALogMsg, 'Test Mode', 'Yes');
           end;

        CustomerName := Sender.Company;
        CustomerAddress := Sender.Address1;
        CustomerCity := Sender.City;
        CustomerState := Sender.State;
        CustomerZipCode := Sender.Zip;
        RetailerName := Recipient.Company;
        RetailerAddress := Recipient.Address1;
        PermitNumber := "123456789"
        PermitIssuingPOCity := "New York"
        PermitIssuingPOState := "NY"
        PermitIssuingPOZipCode := "10128"
        PostageDuePOBox := "48374"
        PostageDueCity := "New York"
        PostageDueState := "NY"
        PostageDueZipCode := "10128"
        PostageDueZip4 := "0143"
        ServiceType := stPriority
        DeliveryConfirmation := False
        InsuranceValue := "50"
        PackageId := "1234"
        PackagePounds := 10
        PackageOunces := 8
        RMANumber := "RMA100"
        ImageType := itTIF
        ShippingLabelFile := "c:\returnlabel.tif"

        GetReturnLabel;

        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, False ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));
        Result := True;
     except on E:Exception do
      begin
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcLabel, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        // Soft error!
        IQError(Format('U.S. Postal Service Error:'#13'%s',[E.Message]));
      end;
     end;
  finally
    if Assigned(o) then FreeAndNil(o); // free TibuCarrierPickup
    if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

procedure TUSPSManager.PickupInquiry;
var
   //o: TibuCarrierPickup;
   AUserName, APassword,
   ADateStr: String;
   ASummary: TStringList;
   ADate: TDateTime;
   ALogMsg: TStringList;
begin
  // initial
  Exit;
  {
  ADate  := 0;
  ASummary := NIL;
  ALogMsg := NIL;

  if (SourceID = 0) or not Assigned(ShippingInfo) then
      raise Exception.Create('Application Error:  Source ID must be provided.');

  // Get the account information
  // NOTE:  We cannot get this from the package
  USPS_Account(AUserName, APassword);
  ValidateAccount(AUserName, APassword);
  o := TibuCarrierPickup.Create(NIL);
  LoadDBOptions; // loads the package options
  with o, ShippingInfo do
  try

     if not (Sender.CountryCode = 'US') then
        Exit;

     ALogMsg := TStringList.Create;
     ALogMsg.Add('Pickup Inquiry');
     ASummary := TStringList.Create;

     try
        // fill required values
        UserID   := AUserName;
        Password := APassword;
        Server   := URL(utShipment);
        FirmName := Sender.Company;
        Address  := Sender.Address1;
        City     := Sender.City;
        State    := Sender.State;
        ZipCode  := Sender.Zip;
        ConfirmationNumber := IQMS.Common.StringUtils.AlphaNumeric(Package.TrackingNumber);

        // execute
        PickupInquiry;
        ADateStr := o.Date;
        if (ADateStr = '') or not IQMS.Dates.IsStringValidDate(ADateStr, ADate) then
           Exit;

        // Return values
        AddLn(ASummary, 'Estimated Weight', IntToStr(EstimatedWeight));
        AddLn(ASummary, 'Express Mail Count', IntToStr(CountExpress));
        AddLn(ASummary, 'Priority Mail Count', IntToStr(CountPriority));
        AddLn(ASummary, 'International Count', IntToStr(CountInternational));
        AddLn(ASummary, 'Other Packages Count', IntToStr(CountOther));
        AddLn(ASummary, 'Pickup Date', FormatDateTime('dddddd', ADate));
        //AddLn(ASummary, 'Day of Week', DayOfWeek);
        AddLn(ASummary, 'Confirmation Number', ConfirmationNumber);
        AddLn(ASummary, 'Pickup Location', PackageLocations[PackageLocation]);
        AddLn(ASummary, 'Special Instructions', SpecialInstructions);

        ALogMsg.Add('');
        ALogMsg.AddStrings(ASummary);
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, False ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        DoShowInfoBox_Ex(Application,
                         ASummary,
                         'USPS Pickup Inquiry', // Header
                         'Inquiry', // NameTitle
                         'Response'); // ValueTitle

     except on E:Exception do
      begin
        // write to log
        ALogMsg.Insert(0, Format('Error:'#13'%s',[E.Message]));
        ALogMsg.Add('');
        shipman_log.WriteToLog(ctUSPS, Package.CarrierID, lcUnknown, True ,
         ALogMsg.Text, Config('FullRequest'), Config('FullResponse'));

        // For debugging
        if DEBUG_MODE then
           ShowIQShipManDebug(Self,
                              E.Message,
                              Config('FullRequest'),
                              Config('FullResponse')); // in shipman_debug.pas

        raise Exception.CreateFmt('U.S. Postal Service Error:'#13'%s',[E.Message]);
      end;
     end;
  finally
    if Assigned(o) then FreeAndNil(o); // free TibuCarrierPickup
    if Assigned(ASummary) then FreeAndNil(ASummary); // free TStringList
    if Assigned(ALogMsg) then FreeAndNil(ALogMsg);
  end;
  }
end;

procedure TUSPSManager.ParseAccountStr(const AAccount: String;
  var AUserName, APassword: String);
var
   AList: TStringList;
begin
  try
     AList := TStringList.Create;
     IQMS.Common.StringUtils.StrToStringList(AAccount, AList);
     AUserName := AList.Values['UserName'];
     APassword := AList.Values['Password'];
  finally
     if Assigned(AList) then AList.Free;
  end;
end;

function TUSPSManager.GetCarrierType: TCarrierType;
begin
  Result:= ctUSPS;
end;

end.
