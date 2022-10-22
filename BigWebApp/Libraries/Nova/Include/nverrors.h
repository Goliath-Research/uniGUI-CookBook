#ifndef __NV_ERRORS_H__
#define __NV_ERRORS_H__

//-----------------------------------------------------------------------------
// Module Name: nverrors.h
//              Error and warning codes returned by the nova interfaces
//-----------------------------------------------------------------------------

// Error codes
#define FACILITY_NOVA 0x55DA


// general error codes
// MessageId: NV_NOT_INITIALIZED
// MessageText: Initialize was not called.
#define NV_NOT_INITIALIZED   0xD5DA0001

// get/set options error codes
// MessageId: NV_INVALID_OPTION
// MessageText: invalid option name
#define NV_INVALID_OPTION    0xD5DA0004

// get/set options error codes
// MessageId: NV_WRONG_OPTION_TYPE
// MessageText: invalid option type
#define NV_WRONG_OPTION_TYPE    0xD5DA0005

// MessageId: NV_UNKNOWN_PROFILE
// MessageText: profile does not exist
#define NV_UNKNOWN_PROFILE   0xD5DA0008

// MessageId: NV_NO_MORE_PROFILES
// MessageText: enumeration of profiles is finished
#define NV_NO_MORE_PROFILES  0xD5DA000A

// MessageId: NV_ENUM_NOT_INIT
// MessageText: GetFirstProfile or GetFirstForm not called
#define NV_ENUM_NOT_INIT     0xD5DA000B

// MessageId: NV_NODEFAULT_PRINTER
// MessageText: SetDefaultPrinter was not called
#define NV_NODEFAULT_PRINTER 0xD5DA0014

// MessageId: NV_NOT_REGISTERED
// MessageText: novapi2.dll (this module) is not registered
#define NV_NOT_REGISTERED    0xD5DA0015

// MessageId: NV_INVALID_BOOKMARK_DEF
// MessageText: invalid bookmark definition index
#define NV_INVALID_BOOKMARK_DEF  0xD5DA0016

// MessageId: NV_INVALID_PRINTER_NAME
// MessageText: cannot find printer with given printer name
#define NV_INVALID_PRINTER_NAME   0xD5DA0018

// MessageId: NV_NOT_A_NOVAPDF_PRINTER
// MessageText: printer is not a novaPDF printer
#define NV_NOT_A_NOVAPDF_PRINTER  0xD5DA0019

// MessageId: NV_PUBLIC_PROFILE
// MessageText: you are not allowed to modify public profiles on client PCs
#define NV_PUBLIC_PROFILE  0xD5DA0020

// MessageId: NV_INVALID_WATERMARK_IMG
// MessageText: invalid watermark image index
#define NV_INVALID_WATERMARK_IMG  0xD5DA0021

// MessageId: NV_INVALID_WATERMARK_TXT
// MessageText: invalid watermark text index
#define NV_INVALID_WATERMARK_TXT  0xD5DA0022

// MessageId: NV_ERROR_DELETE_PRINTER
// MessageText: there was an error deleting printer
#define NV_ERROR_DELETE_PRINTER 0xD5DA0025

// MessageId: NV_PROFILE_ERROR
// MessageText: error reading profile
#define NV_PROFILE_ERROR 0xD5DA0027

// MessageId: NV_NO_ACTIVE_PROFILE
// MessageText: there is no valid active profile
#define NV_NO_ACTIVE_PROFILE 0xD5DA0028

// MessageId: NV_NO_PROFILE
// MessageText: there is no profile loaded
#define NV_NO_PROFILE 0xD5DA0029

// MessageId: NV_SERVICE_ERROR
// MessageText: cannot load connect to service module
#define NV_SERVICE_ERROR 0xD5DA002A

// MessageId: NV_PROFILE_SAVE_ERROR
// MessageText: error saving profile
#define NV_PROFILE_SAVE_ERROR 0xD5DA002B

// MessageId: NV_PROFILE_DELETE_ERROR
// MessageText: error deleting profile
#define NV_PROFILE_DELETE_ERROR 0xD5DA002C

// MessageId: NV_INVALID_LAYOUT
// MessageText: invalid layout id
#define NV_INVALID_LAYOUT  0xD5DA002D

// MessageId: NV_INVALID_EMAIL
// MessageText: invalid email id
#define NV_INVALID_EMAIL  0xD5DA002E

// MessageId: NV_INVALID_RECIPIENT
// MessageText: invalid email recipient id
#define NV_INVALID_RECIPIENT  0xD5DA002F

// MessageId: NV_INVALID_LICENSE
// MessageText: license does not allow COM usage
#define NV_INVALID_LICENSE  0xD5DA0030


#endif // not defined __NV_ERRORS_H__
