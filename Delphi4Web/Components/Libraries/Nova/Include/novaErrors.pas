unit novaErrors;

//  Error and warning codes returned by the nova interfaces

interface

USES
  ActiveX,
  Windows;

CONST

// Error and warning codes returned by the nova interfaces

// Error codes
  FACILITY_NOVA  = $55DA;


// general error codes
// MessageId: NV_NOT_INITIALIZED
// MessageText: Initialize was not called.
  NV_NOT_INITIALIZED    = $D5DA0001;

// get/set options error codes
// MessageId: NV_INVALID_OPTION
// MessageText: invalid option name
  NV_INVALID_OPTION     = $D5DA0004;

// get/set options error codes
// MessageId: NV_WRONG_OPTION_TYPE
// MessageText: invalid option type
  NV_WRONG_OPTION_TYPE  = $D5DA0005;

// MessageId: NV_UNKNOWN_PROFILE
// MessageText: profile does not exist
  NV_UNKNOWN_PROFILE    = $D5DA0008;

// MessageId: NV_NO_MORE_PROFILES
// MessageText: enumeration of profiles is finished
  NV_NO_MORE_PROFILES   = $D5DA000A;

// MessageId: NV_ENUM_NOT_INIT
// MessageText: GetFirstProfile or GetFirstForm not called
  NV_ENUM_NOT_INIT      = $D5DA000B;

// MessageId: NV_NODEFAULT_PRINTER
// MessageText: SetDefaultPrinter was not called
  NV_NODEFAULT_PRINTER  = $D5DA0014;

// MessageId: NV_NOT_REGISTERED
// MessageText: novapi2.dll (this module) is not registered
  NV_NOT_REGISTERED     = $D5DA0015;

// MessageId: NV_INVALID_BOOKMARK_DEF
// MessageText: invalif bookmark definition index
  NV_INVALID_BOOKMARK_DEF  = $D5DA0016;

// MessageId: NV_INVALID_PRINTER_NAME
// MessageText: cannot find printer with given printer name
  NV_INVALID_PRINTER_NAME =  $D5DA0018;

// MessageId: NV_NOT_A_NOVAPDF_PRINTER
// MessageText: printer is not a novaPDF printer
  NV_NOT_A_NOVAPDF_PRINTER = $D5DA0019;

// MessageId: NV_PUBLIC_PROFILE
// MessageText: you are not allowed to modify public profiles on client PCs
  NV_PUBLIC_PROFILE = $D5DA0020;

// MessageId: NV_INVALID_WATERMARK_IMG
// MessageText: invalid watermark image index
  NV_INVALID_WATERMARK_IMG = $D5DA0021;

// MessageId: NV_INVALID_WATERMARK_TXT
// MessageText: invalid watermark text index
  NV_INVALID_WATERMARK_TXT = $D5DA0022;

// MessageId: NV_ERROR_DELETE_PRINTER
// MessageText: there was an error deleting printer
  NV_ERROR_DELETE_PRINTER = $D5DA0025;

// MessageId: NV_PROFILE_ERROR
// MessageText: error reading profile
  NV_PROFILE_ERROR = $D5DA0027;

// MessageId: NV_NO_ACTIVE_PROFILE
// MessageText: there is no valid active profile
  NV_NO_ACTIVE_PROFILE = $D5DA0028;

// MessageId: NV_NO_PROFILE
// MessageText: there is no profile loaded
  NV_NO_PROFILE = $D5DA0029;

// MessageId: NV_SERVICE_ERROR
// MessageText: cannot load connect to service module
  NV_SERVICE_ERROR = $D5DA002A;

// MessageId: NV_PROFILE_SAVE_ERROR
// MessageText: error saving profile
  NV_PROFILE_SAVE_ERROR = $D5DA002B;

// MessageId: NV_PROFILE_DELETE_ERROR
// MessageText: error deleting profile
  NV_PROFILE_DELETE_ERROR = $D5DA002C;

// MessageId: NV_INVALID_LAYOUT
// MessageText: invalid layout id
  NV_INVALID_LAYOUT = $D5DA002D;

// MessageId: NV_INVALID_EMAIL
// MessageText: invalid email id
  NV_INVALID_EMAIL = $D5DA002E;

// MessageId: NV_INVALID_RECIPIENT
// MessageText: invalid email recipient id
  NV_INVALID_RECIPIENT = $D5DA002F;

// MessageId: NV_INVALID_LICENSE
// MessageText: license does not allow COM usage
  NV_INVALID_LICENSE = $D5DA0030;


implementation

end.
