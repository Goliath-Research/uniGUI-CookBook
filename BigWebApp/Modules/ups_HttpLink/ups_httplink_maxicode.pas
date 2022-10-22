unit ups_httplink_maxicode;

(* **************************************************************************
   ***                          UPS MaxiCode                              ***

   ************************************************************************** *)

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.Classes,
  Vcl.Controls,
  System.Variants,
  System.SysUtils,
  System.Math,
  System.DateUtils,
  ups_httplink_typelib,
  System.StrUtils;

type
 {Forward declarations}
 TUPSMaxiCode = class;
 TUPSCompress = class;

 {String declarations}
 String35 = String[35];
 String02 = String[2];

 {Exception class}
 EDLLLoadError = class(Exception);
 EDLLBuildError = class(Exception);

 {Error Codes}
 TCompressionErrorCode = (compress_SUCCESS,                              // 0
                          compress_FAILED_INVALID_WORKSPACE,             // 1
                          compress_VARIABLE_OUT_OF_ORDER,                // 2
                          compress_FAILED_INVALID_DIRECTORY,             // 3
                          compress_FAILED_INVALID_MODE,                  // 4
                          compress_FAILED_INVALID_POSTAL_CODE,           // 5
                          compress_FAILED_INVALID_COUNTRY_CODE,          // 6
                          compress_FAILED_INVALID_CLASS_OF_SERVICE,      // 7
                          compress_FAILED_INVALID_TRACKING_NUMBER,       // 8
                          compress_FAILED_INVALID_SHIPPER_ID,            // 9
                          compress_FAILED_INVALID_JULIAN_PICKUP_DATE,    // 10
                          compress_FAILED_INVALID_SHIPMENT_ID,           // 11
                          compress_FAILED_SHIPMENT_N_X,                  // 12
                          compress_FAILED_WEIGHT,                        // 13
                          compress_FAILED_INVALID_ADDRESS_VALIDATION,    // 14
                          compress_FAILED_INVALID_SHIP_TO_ADDRESS,       // 15
                          compress_FAILED_INVALID_SHIP_TO_CITY,          // 16
                          compress_FAILED_INVALID_SHIP_TO_STATE,         // 17
                          compress_FAILED_SHIP_TO_ADDRESS_2,             // 18
                          compress_FAILED_SHIP_TO_ADDRESS_3,             // 19
                          compress_FAILED_SHIP_TO_ADDRESS_4,             // 20
                          compress_FAILED_SHIP_TO_ADDRESS_5,             // 21
                          compress_NOT_READY_TO_BUILD,                   // 22
                          compress_COMPRESSION_FAILED,                   // 23
                          compress_DATA_AREA_TOO_SMALL,                  // 24
                          compress_INTERNAL_SIZING_PROBLEM,              // 25
                          compress_WORKSPACE_TOO_SMALL,                  // 26
                          compress_FAILED_CODE_TABLE_FILENAME_LENGTH,    // 27
                          compress_FAILED_INVALID_CODE_TABLE_FILENAME,   // 28
                          compress_FAILED_CODE_TABLE_READ,               // 29
                          compress_INVALID_MESSAGE_HEADER,               // 30
                          compress_UNABLE_TO_DETERMINE_MODE,             // 31
                          compress_INVALID_SCAC_CODE,                    // 32
                          compress_MISSING_COMPRESSED_RECORD,            // 33
                          compress_INTERNAL_MAPPING_ERROR,               // 34
                          compress_UNSUPPORTED_VERSION,                  // 35
                          compress_INTERNAL_PADDING_PROBLEM,             // 36
                          compress_CORE_DECOMPRESSOR_ERROR,              // 37
                          compress_FIELD_TRUNCATED,                      // 38
                          compress_UNEXPECTED_TRUNCATION,                // 39
                          compress_DETECTED_FEILD_TOO_LONG,              // 40
                          compress_INVALID_ORIGIN_CARRIER_CODE,          // 41
                          compress_ANSI_STRING_TOO_SHORT,                // 42
                          compress_FAILED_INVALID_SCAC_CODE,             // 43
                          compress_INVALID_FORMAT01_HEADER,              // 44
                          compress_INVALID_FORMAT05_HEADER,              // 45
                          compress_INVALID_MESSAGE_ENDING,               // 46
                          compress_INVALID_ADDRESS_2_FIELD,              // 47
                          compress_INVALID_ADDRESS_3_FIELD,              // 48
                          compress_INVALID_ADDRESS_4_FIELD,              // 49
                          compress_INVALID_ADDRESS_5_FIELD,              // 50
                          compress_FAILED_ABIGUOUS_CITY_FILE_OPEN,       // 51
                          compress_FAILED_TEST_ENCODE_FILE_OPEN,         // 52
                          compress_FAILED_TEST_DECODE_FILE_OPEN,         // 53
                          compress_INVALID_FORMAT07_HEADER,              // 54
                          compress_FAILED_LOG_FILE_OPEN,                 // 55
                          compress_NOT_IN_TEST_MODE);                    // 56

 { TCompressInitialize }
 TCompressInitialize = function(dirPtr: PAnsiChar; // Points to dir where the Compressor can find its files.
                                dirLen: Byte; // Length (bytes) of the string pointed to by dirPtr.
                                workSpace: PAnsiChar; // buffer where the Compressor holds the larger structures
                                ln: SmallInt // Length of the workSpace area in bytes.
                                ): Integer; StdCall;

 { TCompressShutdown }
 TCompressShutdown = function(workSpace: PAnsiChar): Integer; StdCall;

 { TCompressSetMode }
 TCompressSetMode = function(mode: Byte; // Mode of label creation; see mode constants (2 or 3)
                             workSpace: PAnsiChar // workspace buffer
                             ): Integer; StdCall;

 { TCompressBuild }
 TCompressBuild = function(dataPtr: PAnsiChar; // contains compressed string
                           dataLength: Byte; // length, in bytes, of dataPtr
                           CityStateZipCompressionFlag: Boolean; // compress city, state and zip?
                           workSpace: PAnsiChar // workspace buffer
                           ): Integer; StdCall;

 { TCompressBuildAll }
 TCompressBuildAll = function(dataPtr: PAnsiChar; // contains compressed string
                              dataLength: Integer; // length, in bytes, of dataPtr
                              CityStateZipCompressionFlag: Boolean; // compress city, state and zip?
                              workSpace: PAnsiChar // workspace buffer
                              ): Integer; StdCall;

 { TCompressANSIStringBuildAll }
 TCompressANSIStringBuildAll = function(srcPtr: PAnsiChar; // input string
                                        srcLen: Integer; // length, in bytes, of srcPtr
                                        dstPtr: PAnsiChar; // output string
                                        var dstLen: Byte; // length, in bytes, of dstPtr
                                        CityStateZipCompressionFlag: Boolean; // compress city, state and zip?
                                        workSpace: PAnsiChar // workspace buffer
                                        ): Integer; StdCall;

 { TCompressAddValue }
 TCompressAddValue = function(valueType: Integer; // ID or type constant
                              valueLength: Byte; // length of valueData
                              valueData: PAnsiChar; // the data
                              workSpace: PAnsiChar // workspace buffer
                              ): Integer; StdCall;

  { TCompressTestEnable }
  TCompressTestEnable = function(workSpace: PAnsiChar): Integer; StdCall;

  { TCompressTestSuspend }
  TCompressTestSuspend = function(workSpace: PAnsiChar): Integer; StdCall;

  { TCompressTestResume }
  TCompressTestResume = function(workSpace: PAnsiChar): Integer; StdCall;

  { TUPSMaxiCode }
  TUPSMaxiCode = class(TComponent)
  private
    {Private declarations}
    FWorkingDir: AnsiString;
    FMaxiCode: AnsiString;
    FMaxiCodeMode: Integer;
    FAddressValidation: Boolean;
    FAddressValidationYN: AnsiString;
    FPackageWeight: Integer;
    FPackageWeightStr: AnsiString;
    FBoxCount: Integer;
    FBoxNo: Integer;
    FShipperNo: String35;
    FAccountNo: ShortString;
    FShipTo_Addr1: String35;
    FShipTo_Addr2: String35;
    FShipTo_Addr3: String35;
    FShipTo_Addr4: String35;
    FShipTo_Addr5: String35;
    FShipTo_City: String35;
    FShipTo_Original_Zip: ShortString;
    FShipTo_PostalCode: ShortString;
    FShipTo_PostalCodeLength: Integer;
    FShipTo_State: String02;
    FShipTo_Country3DigitCode: ShortString;
    FTrackingNumber: AnsiString;
    FServiceClass: ShortString;
    FPickupDate: TDateTime;
    FSummary: AnsiString;
    FJulianDayOfPickup: AnsiString;
    FCompressedTrackingNumber: AnsiString;
    FBoxCounter: AnsiString;
    FUncompressedText: AnsiString;
    FMaxiCodeFileName: AnsiString;
    FTestMode: Boolean;
    FShipTo_Company: String35;
    FShipTo_Contact: String35;
    FInternational: Boolean;
    FWorldEase: Boolean;

    // local version of "Assert," without the component name in the msg.
    procedure Check(const ACondition: Boolean; AMsg: String);

    procedure Validate;
    procedure BuildMethod_ByFullText;
    procedure BuildMethod_ByValue;
    procedure BuildUncompressedText;
    procedure UpdateSummary;

    procedure UpdateBoxCounter;
    procedure FormatPostalCode;

    // Property methods
    procedure SetAccountNo(const Value: ShortString);
    procedure SetPickupDate(const Value: TDateTime);
    procedure SetShipTo_PostalCode(const Value: ShortString);
    procedure SetTrackingNumber(const Value: AnsiString);
    procedure SetServiceClass(const Value: ShortString);
    procedure SetBoxCount(const Value: Integer);
    procedure SetBoxNo(const Value: Integer);
    procedure SetAddressValidation(const Value: Boolean);
    procedure SetShipTo_Country3DigitCode(const Value: ShortString);
    procedure SetShipTo_Addr1(const Value: String35);
    procedure SetShipTo_Addr2(const Value: String35);
    procedure SetShipTo_Addr3(const Value: String35);
    procedure SetShipTo_Addr4(const Value: String35);
    procedure SetShipTo_Addr5(const Value: String35);
    procedure SetShipTo_City(const Value: String35);
    procedure SetShipTo_State(const Value: String02);
    procedure SetShipperNo(const Value: String35);
    procedure SetPackageWeight(const Value: Integer);
    procedure SetInternational(const Value: Boolean);
    function GetSummary: AnsiString;

    // Developer Note:  Set the working directory and DLL location here.
    // To change the working directory, modify this procedure.
    procedure ConfigureUPSCompressDirectories(
      var AUPSCompress: TUPSCompress);

    // String functions
    function LPadZero(const AValue: AnsiString; ACount: Byte): AnsiString;
    function FixText(const S: AnsiString; const ASpaces: Boolean = True): AnsiString;

  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    procedure Execute;
    procedure ExecuteEx(var AMaxiCode: AnsiString);
    function InputDatFile: AnsiString;
  published
    {Published declarations}

    // Required properties
    property AccountNo: ShortString read FAccountNo write SetAccountNo;
    property TrackingNumber: AnsiString read FTrackingNumber write SetTrackingNumber;
    property CompressedTrackingNumber: AnsiString read FCompressedTrackingNumber;
    property ServiceClass: ShortString read FServiceClass write SetServiceClass;
    property ShipperNumber: String35 read FShipperNo write SetShipperNo;

    property ShipTo_Contact: String35 read FShipTo_Contact write FShipTo_Contact;
    property ShipTo_Company: String35 read FShipTo_Company write FShipTo_Company;
    property ShipTo_Addr1: String35 read FShipTo_Addr1 write SetShipTo_Addr1;
    property ShipTo_Addr2: String35 read FShipTo_Addr2 write SetShipTo_Addr2;
    property ShipTo_Addr3: String35 read FShipTo_Addr3 write SetShipTo_Addr3;
    property ShipTo_Addr4: String35 read FShipTo_Addr4 write SetShipTo_Addr4;
    property ShipTo_Addr5: String35 read FShipTo_Addr5 write SetShipTo_Addr5;
    property ShipTo_City: String35 read FShipTo_City write SetShipTo_City;
    property ShipTo_State: String02 read FShipTo_State write SetShipTo_State;
    property ShipTo_PostalCode: ShortString read FShipTo_PostalCode
     write SetShipTo_PostalCode;
    property ShipTo_Country3DigitCode: ShortString read FShipTo_Country3DigitCode
     write SetShipTo_Country3DigitCode;

    property PickupDate: TDateTime read FPickupDate write SetPickupDate;
    property JulianDayOfPickup: AnsiString read FJulianDayOfPickup;

    property BoxNo: Integer read FBoxNo write SetBoxNo;
    property BoxCount: Integer read FBoxCount write SetBoxCount;
    property BoxCounter: AnsiString read FBoxCounter;
    property PackageWeight: Integer read FPackageWeight write SetPackageWeight;

    property AddressValidation: Boolean read FAddressValidation write SetAddressValidation;

    property TestMode: Boolean read FTestMode write FTestMode;
    property WorldEase: Boolean read FWorldEase write FWorldEase;
    // Result
    property UncompressedText: AnsiString read FUncompressedText;
    property MaxiCode: AnsiString read FMaxiCode;
    property MaxiCodeMode: Integer read FMaxicodeMode;
    property Summary: AnsiString read GetSummary;
    property MaxiCodeFileName: AnsiString read FMaxiCodeFileName;
    property International: Boolean read FInternational
      write SetInternational;
  end;

 { TUPSCompressMode }
 { This type is used internally by TUPSCompress to determine which method
   to call during Execute().  If the method AddValue() is called, then
   the compression mode is set to cmByValue.  If the property, UncompressedText,
   is set, then the mode is set to cmFullText.  This allows some flexiblity
   in how the uncompressed text is sent to the DLL.}
 TUPSCompressionMode = (cmMode2, cmMode3);

 { TUPSPackEntry }
 TUPSPackEntry = class
  ID: Byte;
  Len: SmallInt;
  Value: AnsiString;
  constructor Create(const nID: Byte; const nLen: SmallInt;
      const sValue: AnsiString);
 end;

 { TUPSCompress }
 TUPSCompress = class(TComponent)
  private
    {Private declarations}
    FHandle: THandle;
    FWorkingDir: AnsiString;
    FDLLFileName: AnsiString;
    FTextIn: AnsiString;
    FTextOut: AnsiString;
    FworkSpace: AnsiString;
    FTotalLength: Byte;
    FInitialized: Boolean;
    FValueList: TList; // TStringList;
    FInternalByValue: Boolean;
    FCompressionMode: TUPSCompressionMode;
    FDLLDir: AnsiString;
    FTestMode: Boolean;
    procedure Raise_LoadError(const Msg: String = '');
    procedure Raise_BuildError(const Msg: String = '');
    function ErrMsgText(const ACode: Integer): String;
    procedure SetTextIn(const Value: AnsiString);
    procedure CheckRequiredFilesExist;
    function CompressInitialize: Boolean;
    function CompressSetMode: Boolean;
    function CompressAddValue(const nID: Byte; const nLen: SmallInt;
      const sValue: AnsiString): Boolean;
    function CompressBuild: Boolean;
    function CompressBuildAll: Boolean;
    function Compress_ANSI_StringBuildAll: Boolean;
    function CompressShutDown: Boolean;
    function CompressTestEnable: Boolean;
    function IndexOfPacketID(const nID: Byte): Integer;
    procedure SetWorkingDir(const Value: AnsiString);
    procedure SetDLLDir(const Value: AnsiString);
    procedure InitBuffers;
  protected
    {Protected declarations}
    procedure Connect;
    procedure Disconnect;
    function Connected: Boolean;
    function Initialize: Boolean;
    function Build: Boolean;
    procedure ClearBuffers;
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure AddValue(const nID: Byte; const nLen: SmallInt;
      const sValue: AnsiString);
    function Execute: Boolean; // returns True if successful
  published
    {Published declarations}
    property UncompressedText: AnsiString read FTextIn write SetTextIn;
    property CompressedText: AnsiString read FTextOut write FTextOut;
    property Initialized: Boolean read FInitialized;
    property ValueList: TList read FValueList;
    property WorkingDirectory: AnsiString read FWorkingDir write SetWorkingDir;
    property DLLDirectory: AnsiString read FDLLDir write SetDLLDir;
    property TestMode: Boolean read FTestMode write FTestMode;


    // Compression mode is set internally by the TUPSCompress component.
    // If you build the maxicode using AddValue(), then the compression mode
    // is set to cmByValue.  If you set the UncompressedText property,
    // then the mode is set to cmFullText.
    property CompressionMode: TUPSCompressionMode read FCompressionMode
     write FCompressionMode;
end;

const
  DLL_NAME = 'Compress.dll';

  compress_DIRECTORY_MAX_LENGTH = 200;
  compress_WORKING_SPACE_LENGTH = 8192;
  compress_MAXI_STRING_LENGTH = 100;

  compress_MAX_VALUE_LENGTH = 50;
  compress_MAX_VARIABLE_LENGTH = 35;
  compress_MAX_COMPRESS_STRING_LENGTH = 48;

  // Note:  We've coded things to expect that the MODE2 label is equal to
  //        or longer in length than the mode 3 label.
compress_MAX_LABEL_STRING_LENGTH_MODE2 = 99;
compress_MAX_LABEL_STRING_LENGTH_MODE3 = 96;

//compress_ANSI_POSTAL_LEN = 5;
compress_ANSI_MODE2_POSTAL_LEN = 9;
compress_ANSI_MODE3_POSTAL_LEN = 6;

compress_ANSI_COUNTRY_CODE_LEN = 3;
compress_ANSI_CLASS_OF_SERVICE_LEN = 3;
compress_ANSI_TRACKING_NUMBER_LEN	= 10;
compress_ANSI_SCAC_STRING = 'UPSN';
compress_ANSI_SHIPPER_ID_LEN = 6; // Account number
compress_ANSI_PU_DATE_LEN = 3;
compress_ANSI_SHIPMENTID_MAX_LEN = 30;
compress_ANSI_SHIPMENT_N_X_MAX_LEN = 7;
compress_ANSI_WEIGHT_MAX_LEN = 10;
compress_ANSI_ADDRESS_VALIDATION_LEN = 1;

compress_ANSI_SHIP_TO_CITY_MAX_LEN = 35;
compress_ANSI_SHIP_TO_STATE_MAX_LEN = 2;
//compress_ANSI_FORMAT_SEPARATOR = '';
//compress_ANSI_FORMAT_SEPARATOR_LEN = SizeOf(compress_ANSI_FORMAT_SEPARATOR)-1;
//compress_ANSI_FORMAT05_HEADER = '05';
//compress_ANSI_FORMAT05_HEADER_LEN = SizeOf(compress_ANSI_FORMAT05_HEADER)-1;
//compress_ANSI_APPLICATION_ID_LEN = 3;
//compress_ANSI_SHIP_TO_ADDRESS_2_APP_ID = '20L';
//compress_ANSI_SHIP_TO_ADDRESS_3_APP_ID = '21L';
//compress_ANSI_SHIP_TO_ADDRESS_4_APP_ID = '22L';
//compress_ANSI_SHIP_TO_ADDRESS_5_APP_ID = '23L';

compress_ANSI_SHIP_TO_ADDRESS_1_MAX_LEN = 35;
compress_ANSI_SHIP_TO_ADDRESS_2_MAX_LEN = 35;
compress_ANSI_SHIP_TO_ADDRESS_3_MAX_LEN = 35;
compress_ANSI_SHIP_TO_ADDRESS_4_MAX_LEN = 35;
compress_ANSI_SHIP_TO_ADDRESS_5_MAX_LEN = 35;

  {Maximum length any single code can be.}
  //MAX_CODE_LENGTH = 48;
  //MAX_ENTRY_WIDTH = 5;

  {MAX_BIT_FILE_SIZE must be at least 1 larger than FORMAT_07_BYTES_SIZE}
  //MAX_FILE_SIZE = 800;
  //MAX_BIT_FILE_SIZE = 33;
  //FORMAT_07_BYTES_SIZE = 32;
  //FORMAT_07_SYMBOL_SIZE = 45;
  //PAD_CHARACTER = 0;

  {Mode Settings}
  compress_ANSI_MODE2 = 2;
  compress_ANSI_MODE3 = 3;

  {Sequence and definition of variables to pass into the compress_AddValue
   function.  The user is expected to pass these types, along with their
   associated data, in ascending order as defined below.  New or reassigned
   entries in this enumerated list must be added to the end of the list in
   order to maintain backward compatibility.}
  compress_ANSI_INTERFACE_START = 0;
  compress_ANSI_SET_MODE = 2;
  compress_ANSI_MESSAGE_START = 3;
  compress_ANSI_FORMAT_1_START = 4;
  compress_ANSI_SHIP_TO_POSTAL_CODE = 5;
  compress_ANSI_SHIP_TO_COUNTRY_CODE = 6;
  compress_ANSI_CLASS_OF_SERVICE = 7;
  compress_ANSI_TRACKING_NUMBER = 8;
  compress_ANSI_ORIGIN_CARRIER = 9;
  compress_ANSI_SHIPPER_ID = 10;
  compress_ANSI_JULIAN_DATE_OF_PU = 11;
  compress_ANSI_SHIPMENT_ID = 12;
  compress_ANSI_SHIPMENT_N_X = 13;
  compress_ANSI_WEIGHT = 14;
  compress_ANSI_ADDRESS_VALIDATION = 15;
  compress_ANSI_SHIP_TO_ADDRESS_1 = 16;
  compress_ANSI_SHIP_TO_CITY = 17;
  compress_ANSI_SHIP_TO_STATE = 18;
  compress_ANSI_FORMAT_1_END = 19;
  compress_ANSI_FORMAT_5_START = 20;
  compress_ANSI_SHIP_TO_ADDRESS_2 = 21;
  compress_ANSI_SHIP_TO_ADDRESS_3 = 22;
  compress_ANSI_SHIP_TO_ADDRESS_4 = 23;
  compress_ANSI_SHIP_TO_ADDRESS_5 = 24;
  compress_ANSI_FORMAT_5_END = 25;
  compress_ANSI_MESSAGE_END = 26;
  compress_ANSI_INTERFACE_END = 27;
  //compress_DIMENSIONING_ENTRY = $007FFF; // Simply to force a declaration of a
                                        // 2 byte memory space

  // Character codes used in maxicode string
  FS: Char = #28;
  GS: Char = #29; // $1D
  RS: Char = #30; // $1E
  EOT: Char = #4;
  CR: Char = #13; // $0D

  CompressionErrorCode: array[TCompressionErrorCode] of String =
    ('Success.',                                        // 0
     'Invalid workspace.',                              // 1
     'Variable out of order.',                          // 2
     'Invalid directory.',                              // 3
     'Invalid mode.',                                   // 4
     'Invalid postal code.',                            // 5
     'Invalid country code.',                           // 6
     'Invalid class of service.',                       // 7
     'Invalid tracking number.',                        // 8
     'Invalid Shipper ID.',                             // 9
     'Invalid Julian pickup date.',                     // 10
     'Invalid shipment id.',                            // 11
     'Incorrect shipment N X.',                         // 12
     'Invalid weight.',                                 // 13
     'Invalid address validation.',                     // 14
     'Invalid recipient (Ship To) address.',            // 15
     'Invalid recipient (Ship To) city.',               // 16
     'Invalid recipient (Ship To) state.',              // 17
     'Invalid recipient (Ship To) address 2.',          // 18
     'Invalid recipient (Ship To) address 3.',          // 19
     'Invalid recipient (Ship To) address 4.',          // 20
     'Invalid recipient (Ship To) address 5.',          // 21
     'Not ready to build.',                             // 22
     'Compression failed.',                             // 23
     'Data area too small.',                            // 24
     'Internal sizing problem. ',                       // 25
     'Workspace too small. ',                           // 26
     'Invalid code table filename length.',             // 27
     'Invalid code table filename.  ' +
     'Cannot open the etbl.bin or postal.dat files.',   // 28
     'Failed code table read.',                         // 29
     'Invalid message header.',                         // 30
     'Unable to determine mode. ',                      // 31
     'Invalid SCAC code.',                              // 32
     'Missing compressed record.',                      // 33
     'Internal mapping error. ',                        // 34
     'Unsupported version. ',                           // 35
     'Internal padding problem. ',                      // 36
     'Core decompressor error. ',                       // 37
     'Field truncated. ',                               // 38
     'Unexpected truncation. ',                         // 39
     'Detected field too long. ',                       // 40
     'Invalid origin carrier code. ',                   // 41
     'ANSI string too short.',                          // 42
     'Failed invalid SCAC code. ',                      // 43
     'Invalid Format01 header.',                        // 44
     'Invalid Format05 header.',                        // 45
     'Invalid message ending.',                         // 46
     'Invalid address 2 field.',                        // 47
     'Invalid address 3 field.',                        // 48
     'Invalid address 4 field. ',                       // 49
     'Invalid address 5 field. ',                       // 50
     'Ambiguous city file open.',                       // 51
     'Test encode file open.',                          // 52
     'Test decode file open.',                          // 53
     'Invalid Format07 header.',                        // 54
     'Cannot open log file.',                           // 55
     'Not in test mode.');                              // 56

implementation

uses
  IQMS.Common.FileUtils,
  IQMS.Common.Miscellaneous;

{ TUPSPackEntry }

constructor TUPSPackEntry.Create(const nID: Byte; const nLen: SmallInt;
  const sValue: AnsiString);
begin
  ID := nID;
  Len := nLen;
  Value := sValue;
end;

{ TUPSMaxiCode }

constructor TUPSMaxiCode.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAddressValidation := False;
  FAddressValidationYN := 'N';
  FSummary := '';
  FMaxiCode := '';
  FBoxCounter := '0/0';
  FShipTo_PostalCodeLength := 5; // initial
end;

procedure TUPSMaxiCode.Check(const ACondition: Boolean; AMsg: String);
begin
  // Local version of "Assert" method, but without the component
  // name in the msg.
  if not ACondition then
     raise Exception.Create(AMsg);
end;

procedure TUPSMaxiCode.Execute;
begin
  ExecuteEx(FMaxiCode);
end;

procedure TUPSMaxiCode.ExecuteEx(var AMaxiCode: AnsiString);
begin

  // Reset
  FMaxiCodeFileName := '';

  // Validation
  if (not WorldEase) then
    Validate; // see below

  // Build compressed MaxiCode
  //BuildMethod_ByValue;
  BuildMethod_ByFullText;

  if TestMode then
     FMaxiCodeFileName := FWorkingDir + 'input.dat';

  if not FileExists(FMaxiCodeFileName) then
     FMaxiCodeFileName := '';

  UpdateSummary;

end;

procedure TUPSMaxiCode.Validate;
begin
  // Validation
  Check(FAccountNo > '', 'Application Error:  Account number not supplied.  ' +
    'Cannot generate MaxiCode.');
  Check(FTrackingNumber > '', 'Application Error:  Tracking number not ' +
   'supplied.  Cannot generate MaxiCode.');
  Check(FServiceClass > '', 'Application Error:  Service class not ' +
   'supplied.  Cannot generate MaxiCode.');
  Check(FShipTo_Addr1 > '', 'Application Error:  Address not supplied.  ' +
   'Cannot generate MaxiCode.');
  Check(FShipTo_City > '', 'Application Error:  City not supplied.  ' +
   'Cannot generate MaxiCode.');
  Check(FShipTo_PostalCode > '', 'Application Error:  Postal code not supplied.  ' +
   'Cannot generate MaxiCode.');
  Check(Length(FShipTo_PostalCode) in [5, 6, 9], 'Application Error:  Invalid Postal code.  ' +
   'Postal code must be 5 or 9 digits.  Cannot generate MaxiCode.');
  Check(FShipTo_Country3DigitCode > '', 'Application Error:  Country code ' +
   'not supplied.  Cannot generate MaxiCode.');
  Check(Trunc(FPickupDate) > 0, 'Application Error:  Pickup date not ' +
   'supplied.  Cannot generate MaxiCode.');
  Check(FBoxNo > 0, 'Application Error:  Box number not supplied.  Cannot ' +
   'generate MaxiCode.');
end;

procedure TUPSMaxiCode.BuildMethod_ByValue;
var
   UPSCompress: TUPSCompress;
begin
  // Initialization
  UPSCompress := NIL;

  if not (FShipTo_PostalCodeLength in [5,6,9]) then
     raise Exception.Create('Invalid Postal Code length');

  try
     // Create the local component to process compression
     UPSCompress := TUPSCompress.Create(NIL);

     // Set the working directory and DLL location
     ConfigureUPSCompressDirectories(UPSCompress); // see below

     // Set Test Mode
     UPSCompress.TestMode := Self.TestMode;

     // Assign property values to the TUPSCompress component.
     with UPSCompress do
     begin
       // International is Mode 3.  Domestic is Mode 3.
       if FInternational then
          CompressionMode := cmMode3
       else
          CompressionMode := cmMode2;

       AddValue(compress_ANSI_INTERFACE_START, 0, #0);

       case CompressionMode of
         cmMode2:
         AddValue(compress_ANSI_SET_MODE, FShipTo_PostalCodeLength,
          IntToStr(compress_ANSI_MODE2));

         cmMode3:
         AddValue(compress_ANSI_SET_MODE, FShipTo_PostalCodeLength,
          IntToStr(compress_ANSI_MODE3));

       end;

       AddValue(compress_ANSI_MESSAGE_START, 0, #0);
       AddValue(compress_ANSI_FORMAT_1_START, 0, #0);
       AddValue(compress_ANSI_SHIP_TO_POSTAL_CODE,
        FShipTo_PostalCodeLength, FShipTo_PostalCode);
       AddValue(compress_ANSI_SHIP_TO_COUNTRY_CODE,
        compress_ANSI_COUNTRY_CODE_LEN, FShipTo_Country3DigitCode);
       AddValue(compress_ANSI_CLASS_OF_SERVICE,
        compress_ANSI_CLASS_OF_SERVICE_LEN, FServiceClass);
       AddValue(compress_ANSI_TRACKING_NUMBER,
        compress_ANSI_TRACKING_NUMBER_LEN, FCompressedTrackingNumber);
       AddValue(compress_ANSI_ORIGIN_CARRIER,
        Length(compress_ANSI_SCAC_STRING), compress_ANSI_SCAC_STRING);
       AddValue(compress_ANSI_SHIPPER_ID,
        compress_ANSI_SHIPPER_ID_LEN, FAccountNo);
       AddValue(compress_ANSI_JULIAN_DATE_OF_PU,
        compress_ANSI_PU_DATE_LEN, FJulianDayOfPickup);
       AddValue(compress_ANSI_SHIPMENT_ID,
        compress_ANSI_SHIPMENTID_MAX_LEN, FShipperNo);
       AddValue(compress_ANSI_SHIPMENT_N_X,
        compress_ANSI_SHIPMENT_N_X_MAX_LEN, FBoxCounter);
       AddValue(compress_ANSI_WEIGHT,
        compress_ANSI_WEIGHT_MAX_LEN, FPackageWeightStr);
       AddValue(compress_ANSI_ADDRESS_VALIDATION,
        compress_ANSI_ADDRESS_VALIDATION_LEN, FAddressValidationYN);
       AddValue(compress_ANSI_SHIP_TO_ADDRESS_1,
        compress_ANSI_SHIP_TO_ADDRESS_1_MAX_LEN, FShipTo_Addr1);
       AddValue(compress_ANSI_SHIP_TO_CITY, compress_ANSI_SHIP_TO_CITY_MAX_LEN,
        FShipTo_City);
       AddValue(compress_ANSI_SHIP_TO_STATE,
        compress_ANSI_SHIP_TO_STATE_MAX_LEN, FShipTo_State);
       AddValue(compress_ANSI_FORMAT_1_END, 0, #0);
       AddValue(compress_ANSI_FORMAT_5_START, 0, #0);
       AddValue(compress_ANSI_SHIP_TO_ADDRESS_2,
        compress_ANSI_SHIP_TO_ADDRESS_2_MAX_LEN, FShipTo_Addr2);
       AddValue(compress_ANSI_SHIP_TO_ADDRESS_3,
        compress_ANSI_SHIP_TO_ADDRESS_3_MAX_LEN, FShipTo_Addr3);
       AddValue(compress_ANSI_SHIP_TO_ADDRESS_4,
        compress_ANSI_SHIP_TO_ADDRESS_4_MAX_LEN, FShipTo_Addr4);
       AddValue(compress_ANSI_SHIP_TO_ADDRESS_5,
        compress_ANSI_SHIP_TO_ADDRESS_5_MAX_LEN, FShipTo_Addr5);
       AddValue(compress_ANSI_FORMAT_5_END, 0, #0);
       AddValue(compress_ANSI_MESSAGE_END, 0, #0);
       AddValue(compress_ANSI_INTERFACE_END, 0, #0);
     end;

     // This connects to the DLL, passing all property and private values.
     if UPSCompress.Execute then
        // Returns the uncompressed MaxiCode text.  This is what should be
        // used in the barcode on the label.
        Self.FMaxiCode := UPSCompress.CompressedText;

     UPSCompress.Disconnect;

  finally
     if Assigned(UPSCompress) then FreeAndNil(UPSCompress);
  end;
end;

procedure TUPSMaxiCode.BuildMethod_ByFullText;
var
   UPSCompress: TUPSCompress;
begin
  // Get the uncompressed MaxiCode text (see below)
  BuildUncompressedText;

  // Validate
  if FUncompressedText = '' then
     Exit;

  if FInternational then
    begin
      Self.FMaxiCode := FUncompressedText;
      Self.FMaxiCodeMode := 3;
    end
  else
    begin
      // Send uncompressed text to TUPSCompress
      UPSCompress := TUPSCompress.Create(NIL);

      // Test Mode
      UPSCompress.TestMode := Self.TestMode;

      try
         // Set the working directory and DLL location
         ConfigureUPSCompressDirectories(UPSCompress); // see below

         // U.S. is Mode 2.  All others are Mode 3.
//         if Self.ShipTo_Country3DigitCode = '840' then
            UPSCompress.CompressionMode := cmMode2;
            Self.FMaxicodeMode := 2;
//         else
//            UPSCompress.CompressionMode := cmMode3;

         // Set the uncompressed text
         UPSCompress.UncompressedText := Self.FUncompressedText;

         // This connects to the DLL, passing all property and private values.
         DeleteFile(FWorkingDir + 'input.dat');
         if UPSCompress.Execute then
            // Returns the uncompressed MaxiCode text.  This is what should be
            // used in the barcode on the label.
            Self.FMaxiCode := UPSCompress.CompressedText;

         UPSCompress.Disconnect;

      finally
         if Assigned(UPSCompress) then FreeAndNil(UPSCompress);
      end;
    end;
end;

procedure TUPSMaxiCode.ConfigureUPSCompressDirectories(
 var AUPSCompress: TUPSCompress);
begin
  if not Assigned(AUPSCompress) then
     Exit;

  // Set local variable
  FWorkingDir := IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'UPS' +
   System.SysUtils.PathDelim + 'Files' + System.SysUtils.PathDelim;

  // Set the working directory and DLL location
  AUPSCompress.WorkingDirectory := FWorkingDir;
  AUPSCompress.DLLDirectory := IQMS.Common.Miscellaneous.IQGetLocalHomePath;
end;

function TUPSMaxiCode.FixText(const S: AnsiString;
 const ASpaces: Boolean = True): AnsiString;
var
   i: Integer;
begin
  Result := '';

  for i := 1 to Length(S) do
    if Winapi.Windows.IsCharAlphaNumericA(S[i]) or (ASpaces and (S[i] = ' ')) then
       Result := Result + S[i];

  Result := UpperCase(Result);
end;

procedure TUPSMaxiCode.BuildUncompressedText;
var
   sl_addr: TStringList;
   i, j, n: Integer;

   procedure _ad(S: AnsiString);
   begin
     if Trim(FUncompressedText) > '' then
        FUncompressedText := FUncompressedText + GS + Trim(UpperCase(S))
     else
        FUncompressedText := Trim(UpperCase(S));
   end;

   procedure _adfield(S: AnsiString);
   begin
     _ad(FixText(S));
   end;

   procedure _adfield2(S: AnsiString);
   begin
     _ad(S);
   end;

begin
  try
     // Create string list that will be used for hierarchy of address fields
     sl_addr := TStringList.Create;

     // Build a hierarchical list of address fields.
     if Trim(FShipTo_Addr1) > '' then sl_addr.Add(FShipTo_Addr1);
     if Trim(FShipTo_Addr2) > '' then sl_addr.Add(FShipTo_Addr2);
     if Trim(FShipTo_Addr3) > '' then sl_addr.Add(FShipTo_Addr3);
     if Trim(FShipTo_Addr4) > '' then sl_addr.Add(FShipTo_Addr4);
     if Trim(FShipTo_Company) > '' then sl_addr.Add(Trim(UpperCase(FixText(FShipTo_Company))));
     if Trim(FShipTo_Contact) > '' then sl_addr.Add(Trim(UpperCase(FixText(FShipTo_Contact))));

     // Initialization
     FUncompressedText := '';
     // message header
     FUncompressedText := '[)>' + RS + '01' + GS + '96' + FShipTo_PostalCode;

     // Add fields.  Sequence is important.
     _adfield(FShipTo_Country3DigitCode);
     _adfield(FServiceClass);
     _adfield(FCompressedTrackingNumber);
     _adfield(compress_ANSI_SCAC_STRING);
//     _adfield(FAccountNo); // UPS501P
     _adfield(FShipperNo); //123X56
     _adfield(FJulianDayOfPickup);
//     if FInternational then
       _adfield('');
//     else
//       _adfield(FShipperNo); //123X56
     _adfield2(FBoxCounter);
     _adfield(FPackageWeightStr);
     _adfield(FAddressValidationYN);

     if FInternational then
         _adfield('')
     else
        begin
          // Add the first address line
          if sl_addr.Count > 0 then
            begin
              // add the "field"
              _adfield(sl_addr.Strings[0]);
              // remove the line we just added
              sl_addr.Delete(0);
            end;
        end;

     _adfield(FShipTo_City);
     if ((FShipTo_Country3DigitCode = '840') or (FShipTo_Country3DigitCode = '124')) then
       _adfield(FShipTo_State)
     else
       _adfield('');

     // Add the "05" section which contains additional address lines
     if ((not FInternational) and (sl_addr.Count > 0)) then
        begin
          // Add the "05" header flag
          FUncompressedText := FUncompressedText + RS + '05';
          // Add the lines
          for i := 0 to sl_addr.Count - 1 do
            _adfield(Format('2%dL%s',[i, sl_addr.Strings[i]]));

          // Add the extra field place holders
          j := i;
//          n := 4 - (sl_addr.Count - 1);
          n := 3;
          for i := j to n do
            _adfield(Format('2%dL',[i]));
        end;

  finally
     if Assigned(sl_addr) then FreeAndNil(sl_addr);
  end;

  FUncompressedText := FUncompressedText + RS + EOT;
end;

procedure TUPSMaxiCode.UpdateSummary;
var
   sl: TStringList;

   procedure _ad(ACaption, AValue: AnsiString);
   begin
     sl.Add(Format('%s=%s',[ACaption, AValue]));
   end;

   function _BoolToYesNo(const B: Boolean): AnsiString;
   begin
     if B then Result := 'Yes' else Result := 'No';
   end;

begin
  FSummary := '';
  try
     sl := TStringList.Create;
     _ad('Account #',FAccountNo);
     _ad('Full Tracking #', FTrackingNumber);
     _ad('Compressed Tracking #', FCompressedTrackingNumber);
     _ad('Service Class', FServiceClass);
     _ad('Address 1',FShipTo_Addr1);
     _ad('Address 2',FShipTo_Addr2);
     _ad('City',FShipTo_City);
     _ad('State',FShipTo_State);
     _ad('Postal Code',FShipTo_PostalCode);
     _ad('Country Code',FShipTo_Country3DigitCode);
     _ad('Shipper #',FShipperNo);
     _ad('Pickup Day',IntToStr(DayOfTheYear(FPickupDate)));
     _ad('Pickup Date',FormatDateTime('dddddd',FPickupDate));
     _ad('Julian Day of Pickup', FJulianDayOfPickup);
     _ad('Box #',IntToStr(FBoxNo));
     _ad('Box Count',IntToStr(FBoxCount));
     _ad('Package Weight',FPackageWeightStr);
     _ad('Address Validation?',_BoolToYesNo(FAddressValidation));
     if FUncompressedText > '' then
        _ad('Uncompressed MaxiCode',FUncompressedText);
     FSummary := sl.Text;
  finally
     FreeAndNil(sl);
  end;
end;

procedure TUPSMaxiCode.SetPickupDate(const Value: TDateTime);
var
   ADay: AnsiString;
begin
  FPickupDate := Value;
  ADay := IntToStr(DayOfTheYear(FPickupDate));
  FJulianDayOfPickup := LPadZero(ADay, 3);
end;

procedure TUPSMaxiCode.SetShipTo_PostalCode(const Value: ShortString);
begin
  // Record the original value because we also format the postal code
  // when the country code is changed.  The useable value is always
  // alpha-numeric.  No punctuation.
  FShipTo_Original_Zip := UpperCase(FixText(Value, False {spaces}));

  // Set the variable that is actually sent to the DLL.  This line
  // just an initialization; it is changed by FormatPostalCode below.
  FShipTo_PostalCode := FShipTo_Original_Zip;
  // Modify the postal code that we will send.
  FormatPostalCode;
end;

procedure TUPSMaxiCode.SetTrackingNumber(const Value: AnsiString);
begin
  // Set the original value
  FTrackingNumber := Value;
  // Set the "compressed" tracking number which will be sent to the DLL.
  FCompressedTrackingNumber := '1Z' +
   Copy(FixText(FTrackingNumber, False {spaces}), 11, 18);
end;

procedure TUPSMaxiCode.SetBoxCount(const Value: Integer);
begin
  FBoxCount := Value;
  UpdateBoxCounter;
end;

procedure TUPSMaxiCode.SetBoxNo(const Value: Integer);
begin
  FBoxNo := Value;
  UpdateBoxCounter;
end;

procedure TUPSMaxiCode.UpdateBoxCounter;
begin
  FBoxCounter := Format('%d/%d',[FBoxNo,FBoxCount]);
end;

procedure TUPSMaxiCode.SetAddressValidation(const Value: Boolean);
begin
  FAddressValidation := Value;
  if Value then FAddressValidationYN := 'Y' else FAddressValidationYN := 'N';
end;

procedure TUPSMaxiCode.SetInternational(const Value: Boolean);
begin
  FInternational := Value;
end;

procedure TUPSMaxiCode.SetShipTo_Country3DigitCode(
  const Value: ShortString);
begin
  // This value must be a full 3-digit string, with left-padded zeroes ('000').
  FShipTo_Country3DigitCode := LPadZero(Value, compress_ANSI_COUNTRY_CODE_LEN);
  // We format the postal code based on the country code
  FormatPostalCode;
end;

procedure TUPSMaxiCode.FormatPostalCode;
var
   AAlphaNum: AnsiString;
begin
  if FShipTo_Country3DigitCode = '' then
     Exit;

  // Note:  The Compression Mode (TUPSCompressionMode) is set according
  //        to the 3-digit country code in the TUPSCompress component.
  //        Since this component (TUPSMaxiCode) does not have a Compression
  //        Mode property, we will format the postal code based on the
  //        country code.  In effect, for U.S. destinations, the mode is 2;
  //        for all others, it is 3.

  // For U.S. (equivalent to compress_ANSI_MODE2)
  if not FInternational then
     begin
       // Check the length and added a Zip+4 of '0000' if necessary.
       if Length(FShipTo_Original_Zip) = 5 then
          begin
            FShipTo_PostalCode := FShipTo_Original_Zip + '0000';
            // Cannot validate the address with a Zip+4 of '0000'
            FAddressValidation := False;
          end
       else
          FShipTo_PostalCode := FShipTo_Original_Zip;

       // Set internal variable for postal code length
       FShipTo_PostalCodeLength := Length(FShipTo_PostalCode);

       if not (FShipTo_PostalCodeLength in [5,9]) then
          raise Exception.Create('Invalid Postal Code.  Postal code must be ' +
            'either 5 or 9 digits.');


     end
  // For non-U.S. (equivalent to compress_ANSI_MODE3)
  else
     begin
       // Truncate non-U.S. postal code.  And ensure that anything shorter
       // than 6 characters is padded.
       FShipTo_PostalCode := System.StrUtils.LeftStr(FShipTo_Original_Zip + '      ', 6);
       // Set internal variable for postal code length
       FShipTo_PostalCodeLength := 6;
     end;
end;

function TUPSMaxiCode.LPadZero(const AValue: AnsiString;
 ACount: Byte): AnsiString;
var
   tmp: AnsiString;
begin
  tmp := Trim(AValue);

  if Length(tmp) < ACount then
     Result:= System.StrUtils.DupeString('0', ACount - Length(tmp)) + tmp
  else
     Result:= tmp;
end;

function TUPSMaxiCode.GetSummary: AnsiString;
begin
 UpdateSummary;
 Result := FSummary;
end;

procedure TUPSMaxiCode.SetShipTo_Addr1(const Value: String35);
begin
  FShipTo_Addr1 := Trim(UpperCase(Value));
  FShipTo_Addr1 := FixText(FShipTo_Addr1);
end;

procedure TUPSMaxiCode.SetShipTo_Addr2(const Value: String35);
begin
  FShipTo_Addr2 := Trim(UpperCase(Value));
  FShipTo_Addr2 := FixText(FShipTo_Addr2);
end;

procedure TUPSMaxiCode.SetShipTo_Addr3(const Value: String35);
begin
  FShipTo_Addr3 := Trim(UpperCase(Value));
  FShipTo_Addr3 := FixText(FShipTo_Addr3);
end;

procedure TUPSMaxiCode.SetShipTo_Addr4(const Value: String35);
begin
  FShipTo_Addr4 := Trim(UpperCase(Value));
  FShipTo_Addr4 := FixText(FShipTo_Addr4);
end;

procedure TUPSMaxiCode.SetShipTo_Addr5(const Value: String35);
begin
  FShipTo_Addr5 := Trim(UpperCase(Value));
  FShipTo_Addr5 := FixText(FShipTo_Addr5);
end;

procedure TUPSMaxiCode.SetShipTo_City(const Value: String35);
begin
  FShipTo_City := LeftStr(Trim(UpperCase(Value)), 20);
  FShipTo_City := FixText(FShipTo_City);
end;

procedure TUPSMaxiCode.SetShipTo_State(const Value: String02);
begin
  FShipTo_State := Trim(UpperCase(Value));
end;

procedure TUPSMaxiCode.SetAccountNo(const Value: ShortString);
begin
  FAccountNo := UpperCase(FixText(Value, False {spaces}));
end;

procedure TUPSMaxiCode.SetServiceClass(const Value: ShortString);
begin
  FServiceClass := LPadZero(Trim(Value), compress_ANSI_CLASS_OF_SERVICE_LEN);
end;

procedure TUPSMaxiCode.SetShipperNo(const Value: String35);
begin
  FShipperNo := UpperCase(FixText(Value, False {Spaces}));
end;

procedure TUPSMaxiCode.SetPackageWeight(const Value: Integer);
begin
  FPackageWeight := Value;
  FPackageWeightStr := IntToStr(Value); // in LB
end;

function TUPSMaxiCode.InputDatFile: AnsiString;
begin
  Result := System.SysUtils.IncludeTrailingPathDelimiter(FWorkingDir) +
   'input.dat';
end;

{ TUPSCompress }

constructor TUPSCompress.Create(AOwner: TComponent);
begin
  FHandle := 0;
  FInitialized := False;
  FInternalByValue := True;//False;
  FTotalLength := 0;
  FTestMode := False;

  inherited Create(AOwner);

  // Create container list for values
  FValueList := TList.Create;

  // Reset the property variable before calling compress below
  InitBuffers;

  CompressionMode := cmMode2;
end;

destructor TUPSCompress.Destroy;
begin
  Disconnect;
  if Assigned(FValueList) then FreeAndNil(FValueList);
  inherited Destroy;
end;

procedure TUPSCompress.Connect;
begin
  if not Connected then
  try
     FHandle := LoadLibrary(DLL_NAME);
  except on E:Exception do
    Raise_LoadError(E.Message);
  end;
end;

function TUPSCompress.Connected: Boolean;
begin
  Result := FHandle > 0;
end;

procedure TUPSCompress.Disconnect;
begin
  try
     if Connected then
        begin
          CompressShutDown;
          FreeLibrary(FHandle);
        end;
  finally
     FHandle := 0;
  end;
end;

procedure TUPSCompress.CheckRequiredFilesExist;
var
  AWorkingDir, ADLLFileName: String;
begin
  { * Required files *

    The following files are used by the UPS Maxicode DLL. They must exist in
    the working directory.  This method checks for the existence of the
    files, and raises an exception if they are not found. }

  // Check the working directory
  AWorkingDir := String(FWorkingDir);
  ADLLFileName := String(FDLLFileName);
  if (AWorkingDir = '') or not DirectoryExists(AWorkingDir) then
     raise Exception.Create('Cannot find UPS Compression working directory.');

  // Find the DLL
  if not FileExists(FDLLFileName) then
     IQMS.Common.FileUtils.FindFirstFileInstance(AWorkingDir, DLL_NAME, ADLLFileName);
  if not FileExists(FDLLFileName) then
     raise Exception.CreateFmt('Cannot find UPS Compression DLL (%s).',
      [DLL_NAME]);

  // Ensure these files exist in the working directory
  if not FileExists(AWorkingDir + 'postal.dat') then
     raise Exception.Create('Cannot find required file (postal.dat) in local home path.');
  if not FileExists(AWorkingDir + 'etbl.bin') then
     raise Exception.Create('Cannot find required file (etbl.bin) in local home path.');
end;

function TUPSCompress.Initialize: Boolean;
begin
  // Initialization
  Result := False;
  // Initialize DLL, setting the local property variable.
  FInitialized := CompressInitialize;
  // Set Mode
  Result := CompressSetMode;
end;

function TUPSCompress.Execute: Boolean;
begin
  { * Execute *

    This method is the starting point for all compression System.Actions.
    When called, all inputted property values are used to construct
    the maxicode string.  And after it is completed, the calling
    form may use the returned maxicode string by referencing the
    CompressedText property. }

  if not FInternalByValue and (Trim(FTextIn)='') then
     raise Exception.Create('Application Error: Uncompressed MaxiCode text ' +
      'must be supplied before attempting compression.');

  // Ensure directory exists
  ForceDirectories(FWorkingDir);

  // Check for required files
  CheckRequiredFilesExist;

  // Connect to the DLL.
  Connect;

  // Check the connection.  If unsuccessful, then inform user.
  if not Connected then
     Raise_LoadError;

  // Call initial DLL methods
  if not Initialize then
     Raise_LoadError;

  // Set test mode
  if TestMode then
     CompressTestEnable;

  // Compress and build the maxicode
  Result := Build;

end;

function TUPSCompress.CompressInitialize: Boolean;
var
   compress_Initialize: TCompressInitialize;
   ret: Integer; // return code
   errMsg: String; // contains error message text for user
begin
  // Initialization
  Result := False;
  compress_Initialize := NIL;
  ret := 0;
  errMsg := '';

  // Check property variable to see if we are already initialized.  We may
  // initialize only once per session.  If we are already intialized, then
  // exit early.
  if FInitialized then
     Exit;

  // Check directory; it must exist
  if not DirectoryExists(FWorkingDir) then
     raise Exception.CreateFmt('Application Error:  Cannot find working directory:'#13'%s',
      [FWorkingDir]);

  // Check directory length
  if Length(FWorkingDir) > compress_DIRECTORY_MAX_LENGTH then
     raise Exception.CreateFmt('Working directory too long:'#13'%s'#13 +
      'Directory text length cannot excede %d characters.',
      [FWorkingDir, compress_DIRECTORY_MAX_LENGTH]);

  // Verify connection to the DLL.  At this point, we should be connected,
  // so it is unlikely there will be a problem.
  if not Connected then
     Exit;

  // This function is called to provide a setup phase for the Compressor.
  // It is to be called before invoking other DLL functions.
  @compress_Initialize := GetProcAddress(FHandle, 'compress_Initialize');
  if Assigned(@compress_Initialize) then
     ret := compress_Initialize(PAnsiChar(FWorkingDir), Length(FWorkingDir),
              PAnsiChar(FworkSpace), compress_WORKING_SPACE_LENGTH);
  // Get the error message text
  errMsg := ErrMsgText(ret); // local function
  Result := ret = 0;

  // Check result and raise error, if necessary.
  if not Result then
     Raise_LoadError(errMsg);

end;

procedure TUPSCompress.InitBuffers;
begin
  // Set the workspace buffer length.  Refer to the constants at the top
  // of this unit for the actual value of compress_WORKING_SPACE_LENGTH.
  SetLength(FworkSpace, compress_WORKING_SPACE_LENGTH);
  SetLength(FTextIn, 255);//compress_MAXI_STRING_LENGTH);
  SetLength(FTextOut, compress_MAXI_STRING_LENGTH);

  // Fill entire string with null characters (#0)
  ZeroMemory(Pointer(FworkSpace), compress_WORKING_SPACE_LENGTH * SizeOf(AnsiChar));
  ZeroMemory(Pointer(FTextIn),    255 * SizeOf(AnsiChar));
  ZeroMemory(Pointer(FTextOut),   compress_MAXI_STRING_LENGTH * SizeOf(AnsiChar));
end;

procedure TUPSCompress.ClearBuffers;
begin
  FworkSpace := '';
  FTextIn := '';
  FTextOut := '';
end;

function TUPSCompress.CompressSetMode: Boolean;
var
   compress_SetMode: TCompressSetMode;
   ret: Integer; // return code
   errMsg: String; // contains error message text for user
begin
  // Initialize
  Result := False;
  compress_SetMode := NIL;
  errMsg := '';
  ret := 0;

  // Validation
  if not FInitialized then
     Exit;

 // This function is called to set the mode of operation for the current
 // instance of the Compressor.
  @compress_SetMode := GetProcAddress(FHandle, 'compress_SetMode');
  if Assigned(@compress_SetMode) then
     case FCompressionMode of
       cmMode2: ret := compress_SetMode(compress_ANSI_MODE2, PAnsiChar(FworkSpace));
       cmMode3: ret := compress_SetMode(compress_ANSI_MODE3, PAnsiChar(FworkSpace));
     end;

  // Get the error message text
  errMsg := ErrMsgText(ret); // local function
  Result := ret = 0;

  // Check result and raise error, if necessary.
  if not Result then
     Raise_LoadError(errMsg);

end;

function TUPSCompress.CompressShutDown: Boolean;
var
   compress_ShutDown: TCompressShutdown;
   ret: Integer;
begin
  // Initialize
  Result := False;
  ret := 0;
  compress_ShutDown := NIL;

  // If we are not connect, then exit early; no need to disconnect.
  if not Connected then
     Exit;

  try
     // This function is called to provide a shutdown phase for this instance
     // of the Compressor.
     @compress_ShutDown := GetProcAddress(FHandle, 'compress_ShutDown');
     if Assigned(@compress_ShutDown) then
        ret := compress_ShutDown(PAnsiChar(FworkSpace));

     Result := ret = 0;

     // Reset the property variable.  We are no longer connected, and
     // therefore no longer initialized.  To call the DLL again, we will
     // have to re-initialize.
     FInitialized := False;

  except
   // full suppress; no need to display exception.  If something went
   // terribly wrong, then we are only concerned about startup and
   // in-process Winapi.Messages.
  end;
end;

function TUPSCompress.Build: Boolean;
var
   i, valRef: Integer;
begin
  { * Build *

    This method sends the property values to the DLL and builds the
    maxicode. }

  // Initialize
  Result := False;

  // Validation
  if not FInitialized then
     Exit;

  // Add values from the list
  if FInternalByValue then
     begin
       // Clear the buffers.  We are building the FTextIn internally.
       InitBuffers;
       for i := 0 to FValueList.Count - 1 do
         begin
           // Call the local method below to add the value to the internal list.
           // Once all values are added, then we call the CompressBuildAll()
           // function below to send them to the DLL.
           CompressAddValue(TUPSPackEntry(FValueList.Items[i]).ID,
                            TUPSPackEntry(FValueList.Items[i]).Len,
                            TUPSPackEntry(FValueList.Items[i]).Value);
         end;
     end;

  // Build the MaxiCode string
  if FInternalByValue then
     Result := CompressBuildAll
  else
     Result := Compress_ANSI_StringBuildAll;
end;

procedure TUPSCompress.AddValue(const nID: Byte;
  const nLen: SmallInt; const sValue: AnsiString);
var
   i: Integer;
   AText: AnsiString;
   rec: TUPSPackEntry;
begin
  {This internal method allows the calling component to build a list of
   values.}

  // Validation
  if not Assigned(FValueList) then
     Exit;

  // Check if value exists
  if IndexOfPacketID(nID) > -1 then
     Exit;

  FValueList.Add(TUPSPackEntry.Create(nID,nLen,sValue));

  // Set the mode
  FInternalByValue := True;
end;

function TUPSCompress.IndexOfPacketID(const nID: Byte): Integer;
var
   i: Integer;
begin
  Result := -1;
  if Assigned(FValueList) then
  for i := 0 to FValueList.Count - 1 do
   if TUPSPackEntry(FValueList.Items[i]).ID = nID then
      begin
        Result := i;
        Break;
      end;
end;

(*******************************************************************************
compress_Build()

Description:
  This function is called upon to perform the compression
  on the field list.

Parameters:
  dataPtr - Points to the location to store the compressed
            string...The caller should make sure to provide
            space for at least
            compress_MAX_COMPRESS_STRING_LENGTH bytes.
  lengthPtr - Contains the length, in bytes, pointed to by
            dataPtr.  This value should be ate least
            compress_MAX_COMPRESS_STRING_LENGTH.
  cityStateZipCompressionFlag - Set to TRUE to enable city
            state zip compression for this label.
  workspace - Points to a buffer, sized at least
            compress_WORKING_SPACE_LENGTH bytes.  This
            is where the compressor holds the larger
            structures which it deals with.  This releases the
            compressor from maintaining these structures on the
            stack in order to remain reentrant.

Returns:
  dataPtr - The compressed string is filled into this area.
            length     - Contains the size of the compressed string, in
                         bytes.
            0          - Successful.
            non zero   - Otherwise.

*******************************************************************************)

function TUPSCompress.CompressBuild: Boolean;
var
   compress_Build: TCompressBuild;
   ret: Integer; // return code
   errMsg: String; // contains error message text for user
   dataStr: AnsiString;
   dataPtr: AnsiString;
   dataLen: Byte;
begin
  // Initialization
  Result := False;
  ret := 0;
  compress_Build := NIL;

  // Validation
  if not FInitialized then
     Exit;

  SetLength(dataPtr, compress_MAX_COMPRESS_STRING_LENGTH);
  ZeroMemory(Pointer(dataPtr), Length(dataPtr) * SizeOf(Char));
  dataLen := FTotalLength;

  // Create pointer to DLL method, compress_BuildAll, and execute.
  @compress_Build := GetProcAddress(FHandle, 'compress_Build');
  if Assigned(@compress_Build) then
     ret := compress_Build(PAnsiChar(dataPtr),  // placeholder for compressed string
                           dataLen,  // length, in bytes, of srcPtr
                           True, // compress city, state and zip?
                           PAnsiChar(FworkSpace));    // work space (see Initialize)

  // Get the error message text
  errMsg := ErrMsgText(ret); // local function
  Result := ret = 0;

  // Check result and raise error, if necessary.
  if not Result then
     Raise_BuildError(errMsg);

  // Assign property value
  // Copy the returned text to the property variable
  if Result then
     SetString(FTextOut, PAnsiChar(dataPtr), dataLen);
end;

(*******************************************************************************
compress_BuildAll()

Description:
  This function is called upon to perform the compilation and
  compression of the entire field list.

Parameters:
  dataPtr - Points to the location to store the compressed
            string...The caller should make sure to provide
            space for at least compress_MAXI_STRING_LENGTH
            bytes.

  lengthPtr - Contains the length, in bytes, pointed to by
              dataPtr.  This value should be at least
              compress_MAXI_STRING_LENGTH.
  cityStateZipCompressionFlag - Set to TRUE to enable city
              state zip compression for this label.

  workspace - Points to a buffer, sized at least
              compress_WORKING_SPACE_LENGTH bytes.  This
              is where the compressor holds the larger
              structures which it deals with.  This releases the
              compressor from maintaining these structures on the
              stack in order to remain reentrant.

Returns:
  dataPtr - The entire message is filled into this area...This includes
            both the primary and seconday Winapi.Messages, the format 01 field,
            format 07 field, associated headers, and terminations.
            length        - Contains the size of the string, in bytes.
            0             - Successful.
            non zero      - Otherwise.

*******************************************************************************)

function TUPSCompress.CompressBuildAll: Boolean;
var
   compress_BuildAll: TCompressBuildAll;
   ret: Integer; // return code
   errMsg: String; // contains error message text for user
   dataPtr: AnsiString;
   dataLen: Integer;
begin
  // Initialization
  Result := False;
  ret := 0;
  compress_BuildAll := NIL;
  dataPtr := #0;
  dataLen := 0;

  // Validation
  if not FInitialized then
     Exit;

  // Set data area size
  dataLen := FTotalLength;
  SetLength(dataPtr, compress_MAX_COMPRESS_STRING_LENGTH);
  ZeroMemory(Pointer(dataPtr), Length(dataPtr) * SizeOf(Char));

  // Create pointer to DLL method, compress_BuildAll, and execute.
  @compress_BuildAll := GetProcAddress(FHandle, 'compress_BuildAll');
  if Assigned(@compress_BuildAll) then
     ret := compress_BuildAll(PAnsiChar(dataPtr),  // placeholder for compressed string
                              dataLen,  // length, in bytes, of srcPtr
                              True, // compress city, state and zip?
                              PAnsiChar(FworkSpace)); // work space (see Initialize)

  // Get the error message text
  errMsg := ErrMsgText(ret); // local function
  Result := ret = 0;

  // Check result and raise error, if necessary.
  if not Result then
     Raise_BuildError(errMsg);

  // Copy the returned text to the property variable
  if Result then
     SetString(FTextOut, PAnsiChar(dataPtr), dataLen);
end;

(*******************************************************************************
compress_ANSI_StringBuildAll()

Description:
  This function is called upon to provide an interface
  to the compressor which converts the external ansi
  string interface to the external type/value pairs
  interface.

Parameters:
  srcPtr -  Points to a string of characters formatted in
            accordance to the ANSI interface specification.
  srcLen -  Contains the length, in bytes, pointed to by
            srcPtr.
  dstPtr -  Points to the location to store the compressed
            string...The caller should make sure to provide
            space for at least compress_MAXI_STRING_LENGTH
            bytes.
  dstLen -  Contains the length, in bytes, pointed to by
            dstPtr.  This value should be at least
            compress_MAXI_STRING_LENGTH.
  cityStateZipCompressionFlag - Set to TRUE to enable city
            state zip compression for this label.
  workspace - Points to a buffer, sized at least
            compress_WORKING_SPACE_LENGTH bytes.  This
            is where the compressor holds the larger
            structures which it deals with.  This releases the
            compressor from maintaining these structures on the
            stack in order to remain reentrant.

Returns
  dstPtr  - The entire message is filled into this area...This includes
            both the primary and seconday Winapi.Messages, the format 01 field,
            format 07 field, associated headers, and terminations.
  dstLen  - Contains the size of the string, in bytes.
            0          - Successful.
            non zero   - Otherwise.

*******************************************************************************)

function TUPSCompress.Compress_ANSI_StringBuildAll: Boolean;
var
   compress_ANSI_StringBuildAll: TCompressANSIStringBuildAll; // DLL function
   ret: Integer; // return code
   errMsg: String; // contains error message text for user
   dstPtr: AnsiString; // string returned by DLL
   srcLen: Integer;
   dstLen: Byte; // length of returned string
begin
  // Initialization
  Result := False;
  compress_ANSI_StringBuildAll := NIL;
  ret := 0;
  errMsg := '';
  dstPtr := #0;
  dstLen := 0;
  srcLen := Length(FTextIn);

  // Validation
  if Trim(FTextIn) = '' then
     raise Exception.Create('Uncompressed text not provided.  ' +
      'Cannot compress MaxiCode.');

  // Initialize the "out" values
  dstLen := compress_MAXI_STRING_LENGTH;
  SetLength(dstPtr, compress_MAXI_STRING_LENGTH);
  ZeroMemory(Pointer(dstPtr), Length(dstPtr) * SizeOf(Char));

  // Create pointer to DLL method, compress_ANSI_StringBuildAll, and execute.
  @compress_ANSI_StringBuildAll := GetProcAddress(FHandle,
   'compress_ANSI_StringBuildAll');
  if Assigned(@compress_ANSI_StringBuildAll) then
     ret := compress_ANSI_StringBuildAll(
                       {in} PAnsiChar(FTextIn), // input string
                       {in} srcLen, // length, in bytes, of srcPtr
                      {out} PAnsiChar(dstPtr), // output string
                 {var, out} dstLen, // length, in bytes, of dstPtr
                       {in} True, // compress city, state and zip?
                       {in} PAnsiChar(FworkSpace)); // work space (see Initialize)

  // Get the error message text
  errMsg := ErrMsgText(ret); // local function
  Result := ret = 0;

  // Copy the returned text to the property variable
  if Result then
     SetString(FTextOut, PAnsiChar(dstPtr), dstLen);

  // Check result and raise error, if necessary.
  if not Result then
     Raise_BuildError(errMsg);
end;

function TUPSCompress.CompressAddValue(const nID: Byte; const nLen: SmallInt;
 const sValue: AnsiString): Boolean;
var
   compress_AddValue: TCompressAddValue;
   ret: Integer; // return code
   errMsg: String; // contains error message text for user
begin
  // Initialization
  Result := False;
  compress_AddValue := NIL;
  ret := 0;
  errMsg := '';

  // Validation
  if not FInitialized then
     Exit;

  // Create pointer to DLL method, compress_AddValue, and execute.
  @compress_AddValue := GetProcAddress(FHandle, 'compress_AddValue');
  if Assigned(@compress_AddValue) then
     ret := compress_AddValue(nID, // ID or type constant
                              nLen, // length of valueData
                              PAnsiChar(sValue), // the data
                              PAnsiChar(FworkSpace))
  else
    raise Exception.Create('Application Error:  Cannot send values to ' +
     'MaxiCode compression DLL.');

  // Get the error message text
  errMsg := ErrMsgText(ret); // local function
  Result := ret = 0;
  Inc(FTotalLength, nLen);

  // Check result and raise error, if necessary.
  if not Result then
     Raise_BuildError(errMsg);
end;

function TUPSCompress.CompressTestEnable: Boolean;
var
   compress_TestEnable: TCompressTestEnable;
   ret: Integer; // return code
   errMsg: String; // contains error message text for user
begin
  // Initialization
  Result := False;
  compress_TestEnable := NIL;
  ret := 0;
  errMsg := '';

  // Validation
  if not FInitialized then
     Exit;

  // Create pointer to DLL method, compress_AddValue, and execute.
  @compress_TestEnable := GetProcAddress(FHandle, 'compress_TestEnable');
  if Assigned(@compress_TestEnable) then
     ret := compress_TestEnable(PAnsiChar(FworkSpace));
  // Get the error message text
  errMsg := ErrMsgText(ret); // local function
  Result := ret = 0;
  // Check result and raise error, if necessary.
  if not Result then
     Raise_LoadError(errMsg);
end;

procedure TUPSCompress.Raise_LoadError(const Msg: String = '');
var
   S_Error: String;
begin
  // Raise a DLL load error
  S_Error := Trim(Format('MaxiCode compression failure.  ' +
                         'Cannot load DLL (%s).'#13'%s',
                         [DLL_NAME, Msg]));
  raise EDLLLoadError.Create(S_Error);
end;

procedure TUPSCompress.Raise_BuildError(const Msg: String);
var
   S_Error: String;
begin
  // Raise a DLL load error
  S_Error := Trim(Format('MaxiCode compression failure.  ' +
                         'Cannot build.'#13'%s',
                         [Msg]));
  raise EDLLBuildError.Create(S_Error);
end;

function TUPSCompress.ErrMsgText(const ACode: Integer): String;
var
   AText: String;
begin
  Result := '';
  if ACode = 0 then Exit;

  // default
  Result := Format('[Error Code: %d]',[ACode]);

  if (ACode > 0) and (ACode < Ord(High(CompressionErrorCode))) then
     begin
       AText := CompressionErrorCode[TCompressionErrorCode(ACode)];
       if Trim(AText) > '' then
          Result := Format('%s [Error Code: %d]',[AText, ACode]);
     end;
end;

procedure TUPSCompress.SetTextIn(const Value: AnsiString);
begin
  FTextIn := Value;
  FInternalByValue := False;
end;

procedure TUPSCompress.SetWorkingDir(const Value: AnsiString);
begin
  FWorkingDir := Value;
end;

procedure TUPSCompress.SetDLLDir(const Value: AnsiString);
begin
  FDLLDir := Value;
  FDLLFileName := FDLLDir + DLL_NAME;
end;

end.
