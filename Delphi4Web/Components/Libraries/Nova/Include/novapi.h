

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* at Tue Jul 14 12:28:30 2015
 */
/* Compiler settings for novapi.idl:
    Oicf, W1, Zp8, env=Win32 (32b run), target_arch=X86 7.00.0555 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __novapi_h__
#define __novapi_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __INovaPdfOptions80_FWD_DEFINED__
#define __INovaPdfOptions80_FWD_DEFINED__
typedef interface INovaPdfOptions80 INovaPdfOptions80;
#endif 	/* __INovaPdfOptions80_FWD_DEFINED__ */


#ifndef __NovaPdfOptions80_FWD_DEFINED__
#define __NovaPdfOptions80_FWD_DEFINED__

#ifdef __cplusplus
typedef class NovaPdfOptions80 NovaPdfOptions80;
#else
typedef struct NovaPdfOptions80 NovaPdfOptions80;
#endif /* __cplusplus */

#endif 	/* __NovaPdfOptions80_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __INovaPdfOptions80_INTERFACE_DEFINED__
#define __INovaPdfOptions80_INTERFACE_DEFINED__

/* interface INovaPdfOptions80 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_INovaPdfOptions80;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1988B197-ADAD-4195-A8C1-AB033F615287")
    INovaPdfOptions80 : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Initialize( 
            /* [string][in] */ LPCWSTR p_wsPrinterName,
            /* [string][in] */ LPCWSTR p_wsLicenseKey) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Initialize2( 
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsLicenseKey) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE InitializeSilent( 
            /* [string][in] */ LPCWSTR p_wsPrinterName,
            /* [string][in] */ LPCWSTR p_wsLicenseKey) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE InitializeSilent2( 
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsLicenseKey) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RegisterNovaEvent( 
            /* [in] */ LPCWSTR p_wsEventName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RegisterNovaEvent2( 
            /* [in] */ BSTR p_wsEventName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE WaitForNovaEvent( 
            /* [in] */ LONG p_nMilliseconds,
            /* [out] */ BOOL *p_bTimeout) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetOptionString( 
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetOptionString2( 
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOptionString( 
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOptionString2( 
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetOptionLong( 
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_lValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOptionLong( 
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_plValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetOptionBool( 
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOptionBool( 
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pbValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LoadProfile( 
            /* [string][in] */ LPCWSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LoadProfile2( 
            /* [string][in] */ BSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SaveProfile( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddProfile( 
            /* [string][in] */ LPCWSTR p_wsProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [out] */ LPWSTR *p_pwsNewProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddProfile2( 
            /* [string][in] */ BSTR p_wsProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [out] */ BSTR *p_pwsNewProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CopyProfile( 
            /* [string][in] */ LPCWSTR p_wsNewProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [string][in] */ LPCWSTR p_wsOldProfileId,
            /* [out] */ LPWSTR *p_pwsNewProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CopyProfile2( 
            /* [string][in] */ BSTR p_wsNewProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [string][in] */ BSTR p_wsOldProfileId,
            /* [out] */ BSTR *p_pwsNewProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteProfile( 
            /* [string][in] */ LPCWSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteProfile2( 
            /* [string][in] */ BSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFirstProfile( 
            /* [out] */ LPWSTR *p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFirstProfile2( 
            /* [out] */ BSTR *p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetNextProfile( 
            /* [out] */ LPWSTR *p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetNextProfile2( 
            /* [out] */ BSTR *p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetActiveProfile( 
            /* [out] */ LPWSTR *p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetActiveProfile2( 
            /* [out] */ BSTR *p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetActiveProfile( 
            /* [in] */ LPWSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetActiveProfile2( 
            /* [in] */ BSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFontOption( 
            /* [string][in] */ LPCWSTR p_wsFontName,
            /* [out] */ BOOL *p_pbAlwaysEmbed,
            /* [out] */ BOOL *p_pbNeverEmbed) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFontOption2( 
            /* [string][in] */ BSTR p_wsFontName,
            /* [out] */ BOOL *p_pbAlwaysEmbed,
            /* [out] */ BOOL *p_pbNeverEmbed) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetFontOption( 
            /* [string][in] */ LPCWSTR p_wsFontName,
            /* [in] */ BOOL p_bAlwaysEmbed,
            /* [in] */ BOOL p_bNeverEmbed) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetFontOption2( 
            /* [string][in] */ BSTR p_wsFontName,
            /* [in] */ BOOL p_bAlwaysEmbed,
            /* [in] */ BOOL p_bNeverEmbed) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ClearFontOptions( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddBookmarkDefinition( 
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ LPCWSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor,
            /* [out] */ SHORT *p_nDefinition) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddBookmarkDefinition2( 
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ BSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor,
            /* [out] */ SHORT *p_nDefinition) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ModifyBookmarkDefinition( 
            /* [in] */ SHORT p_nDefinition,
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ LPCWSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ModifyBookmarkDefinition2( 
            /* [in] */ SHORT p_nDefinition,
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ BSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteBookmarkDefinition( 
            /* [in] */ SHORT p_nDefinition) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetBookmarkDefinition( 
            /* [in] */ SHORT p_nDefinition,
            /* [out] */ SHORT *p_pnHeading,
            /* [out] */ BOOL *p_pbEnabled,
            /* [out] */ BOOL *p_pbDetFont,
            /* [string][out] */ LPWSTR *p_pwsDetFont,
            /* [out] */ LONG *p_pnDetFontType,
            /* [out] */ BOOL *p_pbDetStyle,
            /* [out] */ BOOL *p_pbDetBold,
            /* [out] */ BOOL *p_pbDetItalic,
            /* [out] */ BOOL *p_pbDetSize,
            /* [out] */ INT *p_pnDetSizeVal,
            /* [out] */ FLOAT *p_pnDetSizePt,
            /* [out] */ BOOL *p_pbDetColor,
            /* [out] */ LONG *p_pnDetColor,
            /* [out] */ BOOL *p_pbDispAsBold,
            /* [out] */ BOOL *p_pbDispAsItalic,
            /* [out] */ LONG *p_pnDispColor) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetBookmarkDefinition2( 
            /* [in] */ SHORT p_nDefinition,
            /* [out] */ SHORT *p_pnHeading,
            /* [out] */ BOOL *p_pbEnabled,
            /* [out] */ BOOL *p_pbDetFont,
            /* [string][out] */ BSTR *p_pwsDetFont,
            /* [out] */ LONG *p_pnDetFontType,
            /* [out] */ BOOL *p_pbDetStyle,
            /* [out] */ BOOL *p_pbDetBold,
            /* [out] */ BOOL *p_pbDetItalic,
            /* [out] */ BOOL *p_pbDetSize,
            /* [out] */ INT *p_pnDetSizeVal,
            /* [out] */ FLOAT *p_pnDetSizePt,
            /* [out] */ BOOL *p_pbDetColor,
            /* [out] */ LONG *p_pnDetColor,
            /* [out] */ BOOL *p_pbDispAsBold,
            /* [out] */ BOOL *p_pbDispAsItalic,
            /* [out] */ LONG *p_pnDispColor) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetBookmarkDefinitionCount( 
            /* [out] */ SHORT *p_nCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetDefaultPrinter( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RestoreDefaultPrinter( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetPDFFileName( 
            /* [in] */ BOOL p_bPrintStarted,
            /* [string][out] */ LPWSTR *p_pwsFileName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetPDFFileName2( 
            /* [in] */ BOOL p_bPrintStarted,
            /* [string][out] */ BSTR *p_pwsFileName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetPrinterOption( 
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_lValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RegisterEventWindow( 
            /* [in] */ LONG p_hWnd) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE UnRegisterEventWindow( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE InitializeOLEUsage( 
            /* [in] */ BSTR p_pwstrOLEProgID) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LicenseOLEServer( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LicenseShellExecuteFile( 
            /* [in] */ BSTR p_pwstrFileName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LicenseApplication( 
            /* [in] */ BSTR p_pwstrAppName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddWatermarkImage( 
            /* [string][out] */ LPWSTR *p_pwsNewWatermarkId,
            /* [string][out] */ LPWSTR *p_pwsNewLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddWatermarkImage2( 
            /* [string][out] */ BSTR *p_pwsNewWatermarkId,
            /* [string][out] */ BSTR *p_pwsNewLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionString( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionString2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionLong( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionLong2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionBool( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionBool2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionFloat( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionFloat2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageCount( 
            /* [out] */ LONG *p_pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImage( 
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImage2( 
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteWatermarkImage( 
            /* [string][in] */ LPWSTR p_wsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteWatermarkImage2( 
            /* [string][in] */ BSTR p_wsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionString( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionString2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionLong( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionLong2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionBool( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionBool2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionFloat( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionFloat2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionString( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionString2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionLong( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionLong2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionBool( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionBool2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionFloat( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetLayoutOptionFloat2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionString( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionString2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionLong( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionLong2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionBool( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionBool2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionFloat( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutOptionFloat2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutCount( 
            /* [string][in] */ LPWSTR p_wsObjectId,
            /* [out] */ LONG *p_pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayoutCount2( 
            /* [string][in] */ BSTR p_wsObjectId,
            /* [out] */ LONG *p_pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayout( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetLayout2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteLayout( 
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_wsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteLayout2( 
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_wsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddWatermarkText( 
            /* [string][out] */ LPWSTR *p_pwsNewWatermarkId,
            /* [string][out] */ LPWSTR *p_pwsNewLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddWatermarkText2( 
            /* [string][out] */ BSTR *p_pwsNewWatermarkId,
            /* [string][out] */ BSTR *p_pwsNewLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionString( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionString2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionLong( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionLong2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionBool( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionBool2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionFloat( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkTextOptionFloat2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextCount( 
            /* [out] */ LONG *p_pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkText( 
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkText2( 
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteWatermarkText( 
            /* [string][in] */ LPWSTR p_wsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteWatermarkText2( 
            /* [string][in] */ BSTR p_wsWatermarkId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionString( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionString2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionLong( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionLong2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionBool( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionBool2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionFloat( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkTextOptionFloat2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddNovaPrinter( 
            /* [string][in] */ LPCWSTR p_wsPrinterName,
            /* [string][in] */ LPCWSTR p_wsPortName,
            /* [string][in] */ LPCWSTR p_wsOEMID,
            /* [string][in] */ LPCWSTR p_wsServicePort,
            /* [string][in] */ LPCWSTR p_wsLicenseKey) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddNovaPrinter2( 
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsPortName,
            /* [string][in] */ BSTR p_wsOEMID,
            /* [string][in] */ BSTR p_wsServicePort,
            /* [string][in] */ BSTR p_wsLicenseKey) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteNovaPrinter( 
            /* [string][in] */ LPCWSTR p_wsPrinterName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteNovaPrinter2( 
            /* [string][in] */ BSTR p_wsPrinterName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddEmail( 
            /* [string][out] */ LPWSTR *p_pwsNewEmailId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddEmail2( 
            /* [string][out] */ BSTR *p_pwsNewEmailId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionString( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionString2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionLong( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionLong2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionBool( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionBool2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailCount( 
            /* [out] */ LONG *p_pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmail( 
            LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsEmailId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmail2( 
            LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsEmailId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteEmail( 
            /* [string][in] */ LPWSTR p_wsEmailId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteEmail2( 
            /* [string][in] */ BSTR p_wsEmailId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionString( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionString2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionLong( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionLong2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionBool( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pbValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionBool2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pbValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddEmailRecipient( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [string][out] */ LPWSTR *p_pwsNewRecipientId,
            /* [string][in] */ LPWSTR p_pwsFrom,
            /* [string][in] */ LPWSTR p_pwsTo,
            /* [string][in] */ LPWSTR p_pwsCC,
            /* [string][in] */ LPWSTR p_pwsBCC) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddEmailRecipient2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [string][out] */ BSTR *p_pwsNewRecipientId,
            /* [string][in] */ BSTR p_pwsFrom,
            /* [string][in] */ BSTR p_pwsTo,
            /* [string][in] */ BSTR p_pwsCC,
            /* [string][in] */ BSTR p_pwsBCC) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteEmailRecipient( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [string][in] */ LPWSTR p_pwsRecipientId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteEmailRecipient2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [string][in] */ BSTR p_pwsRecipientId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailRecipientCount( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [out] */ LONG *p_pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailRecipientCount2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [out] */ LONG *p_pnCount) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailRecipient( 
            /* [in] */ LONG p_nIndex,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [string][out] */ LPWSTR *p_pwsRecipientId,
            /* [string][out] */ LPWSTR *p_pwsFrom,
            /* [string][out] */ LPWSTR *p_pwsTo,
            /* [string][out] */ LPWSTR *p_pwsCC,
            /* [string][out] */ LPWSTR *p_pwsBCC) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailRecipient2( 
            /* [in] */ LONG p_nIndex,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [string][out] */ BSTR *p_pwsRecipientId,
            /* [string][out] */ BSTR *p_pwsFrom,
            /* [string][out] */ BSTR *p_pwsTo,
            /* [string][out] */ BSTR *p_pwsCC,
            /* [string][out] */ BSTR *p_pwsBCC) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailRecipient( 
            /* [string][in] */ LPWSTR p_pwsRecipientId,
            /* [string][in] */ LPWSTR p_pwsFrom,
            /* [string][in] */ LPWSTR p_pwsTo,
            /* [string][in] */ LPWSTR p_pwsCC,
            /* [string][in] */ LPWSTR p_pwsBCC) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailRecipient2( 
            /* [string][in] */ BSTR p_pwsRecipientId,
            /* [string][in] */ BSTR p_pwsFrom,
            /* [string][in] */ BSTR p_pwsTo,
            /* [string][in] */ BSTR p_pwsCC,
            /* [string][in] */ BSTR p_pwsBCC) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetSignature( 
            /* [string][out] */ LPWSTR *p_pwsSignatureId,
            LPWSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetSignature2( 
            /* [string][out] */ BSTR *p_pwsSignatureId,
            BSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOverlay( 
            /* [string][out] */ LPWSTR *p_pwsOverlayId,
            LPWSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOverlay2( 
            /* [string][out] */ BSTR *p_pwsOverlayId,
            BSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetContentLayout( 
            /* [string][out] */ LPWSTR *p_pwsContentId,
            /* [string][out] */ LPWSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetContentLayout2( 
            /* [string][out] */ BSTR *p_pwsContentId,
            /* [string][out] */ BSTR *p_pwsLayoutId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetOptionEncryptedString( 
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetOptionEncryptedString2( 
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOptionEncryptedString( 
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetOptionEncryptedString2( 
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionEncryptedString( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetWatermarkImageOptionEncryptedString2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionEncryptedString( 
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetWatermarkImageOptionEncryptedString2( 
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionEncryptedString( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetEmailOptionEncryptedString2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionEncryptedString( 
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetEmailOptionEncryptedString2( 
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetPrinterActivePublicProfile( 
            /* [string][in] */ LPWSTR p_wsPrinterName,
            /* [string][in] */ LPWSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetPrinterActivePublicProfile2( 
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsProfileId) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeletePrinterActivePublicProfile( 
            /* [string][in] */ LPWSTR p_wsPrinterName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeletePrinterActivePublicProfile2( 
            /* [string][in] */ BSTR p_wsPrinterName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetPrinterPublicProfile( 
            /* [string][in] */ LPWSTR p_wsPrinterName,
            /* [string][in] */ LPWSTR p_wsProfileId,
            /* [in] */ BOOL p_bVisible) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetPrinterPublicProfile2( 
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsProfileId,
            /* [in] */ BOOL p_bVisible) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct INovaPdfOptions80Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            INovaPdfOptions80 * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            INovaPdfOptions80 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            INovaPdfOptions80 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            INovaPdfOptions80 * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            INovaPdfOptions80 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            INovaPdfOptions80 * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            INovaPdfOptions80 * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsPrinterName,
            /* [string][in] */ LPCWSTR p_wsLicenseKey);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Initialize2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsLicenseKey);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *InitializeSilent )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsPrinterName,
            /* [string][in] */ LPCWSTR p_wsLicenseKey);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *InitializeSilent2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsLicenseKey);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RegisterNovaEvent )( 
            INovaPdfOptions80 * This,
            /* [in] */ LPCWSTR p_wsEventName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RegisterNovaEvent2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ BSTR p_wsEventName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *WaitForNovaEvent )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nMilliseconds,
            /* [out] */ BOOL *p_bTimeout);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetOptionString )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOptionString )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetOptionLong )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_lValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOptionLong )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_plValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetOptionBool )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOptionBool )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pbValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *LoadProfile )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *LoadProfile2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SaveProfile )( 
            INovaPdfOptions80 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddProfile )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [out] */ LPWSTR *p_pwsNewProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddProfile2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [out] */ BSTR *p_pwsNewProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CopyProfile )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsNewProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [string][in] */ LPCWSTR p_wsOldProfileId,
            /* [out] */ LPWSTR *p_pwsNewProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CopyProfile2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsNewProfileName,
            /* [in] */ BOOL p_bPublicProfile,
            /* [string][in] */ BSTR p_wsOldProfileId,
            /* [out] */ BSTR *p_pwsNewProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteProfile )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteProfile2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstProfile )( 
            INovaPdfOptions80 * This,
            /* [out] */ LPWSTR *p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstProfile2 )( 
            INovaPdfOptions80 * This,
            /* [out] */ BSTR *p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetNextProfile )( 
            INovaPdfOptions80 * This,
            /* [out] */ LPWSTR *p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetNextProfile2 )( 
            INovaPdfOptions80 * This,
            /* [out] */ BSTR *p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetActiveProfile )( 
            INovaPdfOptions80 * This,
            /* [out] */ LPWSTR *p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetActiveProfile2 )( 
            INovaPdfOptions80 * This,
            /* [out] */ BSTR *p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetActiveProfile )( 
            INovaPdfOptions80 * This,
            /* [in] */ LPWSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetActiveProfile2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ BSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetFontOption )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsFontName,
            /* [out] */ BOOL *p_pbAlwaysEmbed,
            /* [out] */ BOOL *p_pbNeverEmbed);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetFontOption2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsFontName,
            /* [out] */ BOOL *p_pbAlwaysEmbed,
            /* [out] */ BOOL *p_pbNeverEmbed);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetFontOption )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsFontName,
            /* [in] */ BOOL p_bAlwaysEmbed,
            /* [in] */ BOOL p_bNeverEmbed);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetFontOption2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsFontName,
            /* [in] */ BOOL p_bAlwaysEmbed,
            /* [in] */ BOOL p_bNeverEmbed);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ClearFontOptions )( 
            INovaPdfOptions80 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddBookmarkDefinition )( 
            INovaPdfOptions80 * This,
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ LPCWSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor,
            /* [out] */ SHORT *p_nDefinition);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddBookmarkDefinition2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ BSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor,
            /* [out] */ SHORT *p_nDefinition);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ModifyBookmarkDefinition )( 
            INovaPdfOptions80 * This,
            /* [in] */ SHORT p_nDefinition,
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ LPCWSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ModifyBookmarkDefinition2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ SHORT p_nDefinition,
            /* [in] */ SHORT p_nHeading,
            /* [in] */ BOOL p_bEnabled,
            /* [in] */ BOOL p_bDetFont,
            /* [string][in] */ BSTR p_wsDetFont,
            /* [in] */ LONG p_nDetFontType,
            /* [in] */ BOOL p_bDetStyle,
            /* [in] */ BOOL p_bDetBold,
            /* [in] */ BOOL p_bDetItalic,
            /* [in] */ BOOL p_bDetSize,
            /* [in] */ INT p_nDetSizeVal,
            /* [in] */ FLOAT p_nDetSizePt,
            /* [in] */ BOOL p_bDetColor,
            /* [in] */ LONG p_nDetColor,
            /* [in] */ BOOL p_bDispAsBold,
            /* [in] */ BOOL p_bDispAsItalic,
            /* [in] */ LONG p_nDispColor);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteBookmarkDefinition )( 
            INovaPdfOptions80 * This,
            /* [in] */ SHORT p_nDefinition);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetBookmarkDefinition )( 
            INovaPdfOptions80 * This,
            /* [in] */ SHORT p_nDefinition,
            /* [out] */ SHORT *p_pnHeading,
            /* [out] */ BOOL *p_pbEnabled,
            /* [out] */ BOOL *p_pbDetFont,
            /* [string][out] */ LPWSTR *p_pwsDetFont,
            /* [out] */ LONG *p_pnDetFontType,
            /* [out] */ BOOL *p_pbDetStyle,
            /* [out] */ BOOL *p_pbDetBold,
            /* [out] */ BOOL *p_pbDetItalic,
            /* [out] */ BOOL *p_pbDetSize,
            /* [out] */ INT *p_pnDetSizeVal,
            /* [out] */ FLOAT *p_pnDetSizePt,
            /* [out] */ BOOL *p_pbDetColor,
            /* [out] */ LONG *p_pnDetColor,
            /* [out] */ BOOL *p_pbDispAsBold,
            /* [out] */ BOOL *p_pbDispAsItalic,
            /* [out] */ LONG *p_pnDispColor);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetBookmarkDefinition2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ SHORT p_nDefinition,
            /* [out] */ SHORT *p_pnHeading,
            /* [out] */ BOOL *p_pbEnabled,
            /* [out] */ BOOL *p_pbDetFont,
            /* [string][out] */ BSTR *p_pwsDetFont,
            /* [out] */ LONG *p_pnDetFontType,
            /* [out] */ BOOL *p_pbDetStyle,
            /* [out] */ BOOL *p_pbDetBold,
            /* [out] */ BOOL *p_pbDetItalic,
            /* [out] */ BOOL *p_pbDetSize,
            /* [out] */ INT *p_pnDetSizeVal,
            /* [out] */ FLOAT *p_pnDetSizePt,
            /* [out] */ BOOL *p_pbDetColor,
            /* [out] */ LONG *p_pnDetColor,
            /* [out] */ BOOL *p_pbDispAsBold,
            /* [out] */ BOOL *p_pbDispAsItalic,
            /* [out] */ LONG *p_pnDispColor);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetBookmarkDefinitionCount )( 
            INovaPdfOptions80 * This,
            /* [out] */ SHORT *p_nCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetDefaultPrinter )( 
            INovaPdfOptions80 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RestoreDefaultPrinter )( 
            INovaPdfOptions80 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetPDFFileName )( 
            INovaPdfOptions80 * This,
            /* [in] */ BOOL p_bPrintStarted,
            /* [string][out] */ LPWSTR *p_pwsFileName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetPDFFileName2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ BOOL p_bPrintStarted,
            /* [string][out] */ BSTR *p_pwsFileName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetPrinterOption )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_lValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RegisterEventWindow )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_hWnd);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *UnRegisterEventWindow )( 
            INovaPdfOptions80 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *InitializeOLEUsage )( 
            INovaPdfOptions80 * This,
            /* [in] */ BSTR p_pwstrOLEProgID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *LicenseOLEServer )( 
            INovaPdfOptions80 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *LicenseShellExecuteFile )( 
            INovaPdfOptions80 * This,
            /* [in] */ BSTR p_pwstrFileName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *LicenseApplication )( 
            INovaPdfOptions80 * This,
            /* [in] */ BSTR p_pwstrAppName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddWatermarkImage )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ LPWSTR *p_pwsNewWatermarkId,
            /* [string][out] */ LPWSTR *p_pwsNewLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddWatermarkImage2 )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ BSTR *p_pwsNewWatermarkId,
            /* [string][out] */ BSTR *p_pwsNewLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionFloat )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionFloat2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageCount )( 
            INovaPdfOptions80 * This,
            /* [out] */ LONG *p_pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImage )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImage2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteWatermarkImage )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_wsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteWatermarkImage2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionFloat )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionFloat2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionFloat )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetLayoutOptionFloat2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionFloat )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutOptionFloat2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_pwsLayoutId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutCount )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_wsObjectId,
            /* [out] */ LONG *p_pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayoutCount2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsObjectId,
            /* [out] */ LONG *p_pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayout )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetLayout2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteLayout )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsObjectId,
            /* [string][in] */ LPWSTR p_wsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteLayout2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsObjectId,
            /* [string][in] */ BSTR p_wsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddWatermarkText )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ LPWSTR *p_pwsNewWatermarkId,
            /* [string][out] */ LPWSTR *p_pwsNewLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddWatermarkText2 )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ BSTR *p_pwsNewWatermarkId,
            /* [string][out] */ BSTR *p_pwsNewLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionFloat )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkTextOptionFloat2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [in] */ FLOAT p_fValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextCount )( 
            INovaPdfOptions80 * This,
            /* [out] */ LONG *p_pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkText )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkText2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteWatermarkText )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_wsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteWatermarkText2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsWatermarkId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionFloat )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkTextOptionFloat2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [out] */ FLOAT *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddNovaPrinter )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsPrinterName,
            /* [string][in] */ LPCWSTR p_wsPortName,
            /* [string][in] */ LPCWSTR p_wsOEMID,
            /* [string][in] */ LPCWSTR p_wsServicePort,
            /* [string][in] */ LPCWSTR p_wsLicenseKey);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddNovaPrinter2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsPortName,
            /* [string][in] */ BSTR p_wsOEMID,
            /* [string][in] */ BSTR p_wsServicePort,
            /* [string][in] */ BSTR p_wsLicenseKey);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteNovaPrinter )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPCWSTR p_wsPrinterName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteNovaPrinter2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsPrinterName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddEmail )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ LPWSTR *p_pwsNewEmailId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddEmail2 )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ BSTR *p_pwsNewEmailId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ LONG p_nValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [in] */ BOOL p_bValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailCount )( 
            INovaPdfOptions80 * This,
            /* [out] */ LONG *p_pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmail )( 
            INovaPdfOptions80 * This,
            LONG p_nIndex,
            /* [string][out] */ LPWSTR *p_pwsEmailId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmail2 )( 
            INovaPdfOptions80 * This,
            LONG p_nIndex,
            /* [string][out] */ BSTR *p_pwsEmailId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteEmail )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_wsEmailId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteEmail2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsEmailId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionLong )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionLong2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ LONG *p_pnValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionBool )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pbValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionBool2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [out] */ BOOL *p_pbValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddEmailRecipient )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [string][out] */ LPWSTR *p_pwsNewRecipientId,
            /* [string][in] */ LPWSTR p_pwsFrom,
            /* [string][in] */ LPWSTR p_pwsTo,
            /* [string][in] */ LPWSTR p_pwsCC,
            /* [string][in] */ LPWSTR p_pwsBCC);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddEmailRecipient2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [string][out] */ BSTR *p_pwsNewRecipientId,
            /* [string][in] */ BSTR p_pwsFrom,
            /* [string][in] */ BSTR p_pwsTo,
            /* [string][in] */ BSTR p_pwsCC,
            /* [string][in] */ BSTR p_pwsBCC);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteEmailRecipient )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [string][in] */ LPWSTR p_pwsRecipientId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteEmailRecipient2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [string][in] */ BSTR p_pwsRecipientId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailRecipientCount )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [out] */ LONG *p_pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailRecipientCount2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [out] */ LONG *p_pnCount);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailRecipient )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nIndex,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [string][out] */ LPWSTR *p_pwsRecipientId,
            /* [string][out] */ LPWSTR *p_pwsFrom,
            /* [string][out] */ LPWSTR *p_pwsTo,
            /* [string][out] */ LPWSTR *p_pwsCC,
            /* [string][out] */ LPWSTR *p_pwsBCC);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailRecipient2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nIndex,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [string][out] */ BSTR *p_pwsRecipientId,
            /* [string][out] */ BSTR *p_pwsFrom,
            /* [string][out] */ BSTR *p_pwsTo,
            /* [string][out] */ BSTR *p_pwsCC,
            /* [string][out] */ BSTR *p_pwsBCC);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailRecipient )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsRecipientId,
            /* [string][in] */ LPWSTR p_pwsFrom,
            /* [string][in] */ LPWSTR p_pwsTo,
            /* [string][in] */ LPWSTR p_pwsCC,
            /* [string][in] */ LPWSTR p_pwsBCC);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailRecipient2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsRecipientId,
            /* [string][in] */ BSTR p_pwsFrom,
            /* [string][in] */ BSTR p_pwsTo,
            /* [string][in] */ BSTR p_pwsCC,
            /* [string][in] */ BSTR p_pwsBCC);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetSignature )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ LPWSTR *p_pwsSignatureId,
            LPWSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetSignature2 )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ BSTR *p_pwsSignatureId,
            BSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOverlay )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ LPWSTR *p_pwsOverlayId,
            LPWSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOverlay2 )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ BSTR *p_pwsOverlayId,
            BSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetContentLayout )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ LPWSTR *p_pwsContentId,
            /* [string][out] */ LPWSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetContentLayout2 )( 
            INovaPdfOptions80 * This,
            /* [string][out] */ BSTR *p_pwsContentId,
            /* [string][out] */ BSTR *p_pwsLayoutId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetOptionEncryptedString )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetOptionEncryptedString2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOptionEncryptedString )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetOptionEncryptedString2 )( 
            INovaPdfOptions80 * This,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionEncryptedString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetWatermarkImageOptionEncryptedString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionEncryptedString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetWatermarkImageOptionEncryptedString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsWatermarkId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionEncryptedString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ LPCWSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetEmailOptionEncryptedString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][in] */ BSTR p_wsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionEncryptedString )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ LPWSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetEmailOptionEncryptedString2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_pwsEmailId,
            /* [in] */ LONG p_nOption,
            /* [string][out] */ BSTR *p_pwsValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetPrinterActivePublicProfile )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_wsPrinterName,
            /* [string][in] */ LPWSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetPrinterActivePublicProfile2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsProfileId);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeletePrinterActivePublicProfile )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_wsPrinterName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeletePrinterActivePublicProfile2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsPrinterName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetPrinterPublicProfile )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ LPWSTR p_wsPrinterName,
            /* [string][in] */ LPWSTR p_wsProfileId,
            /* [in] */ BOOL p_bVisible);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetPrinterPublicProfile2 )( 
            INovaPdfOptions80 * This,
            /* [string][in] */ BSTR p_wsPrinterName,
            /* [string][in] */ BSTR p_wsProfileId,
            /* [in] */ BOOL p_bVisible);
        
        END_INTERFACE
    } INovaPdfOptions80Vtbl;

    interface INovaPdfOptions80
    {
        CONST_VTBL struct INovaPdfOptions80Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define INovaPdfOptions80_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define INovaPdfOptions80_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define INovaPdfOptions80_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define INovaPdfOptions80_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define INovaPdfOptions80_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define INovaPdfOptions80_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define INovaPdfOptions80_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define INovaPdfOptions80_Initialize(This,p_wsPrinterName,p_wsLicenseKey)	\
    ( (This)->lpVtbl -> Initialize(This,p_wsPrinterName,p_wsLicenseKey) ) 

#define INovaPdfOptions80_Initialize2(This,p_wsPrinterName,p_wsLicenseKey)	\
    ( (This)->lpVtbl -> Initialize2(This,p_wsPrinterName,p_wsLicenseKey) ) 

#define INovaPdfOptions80_InitializeSilent(This,p_wsPrinterName,p_wsLicenseKey)	\
    ( (This)->lpVtbl -> InitializeSilent(This,p_wsPrinterName,p_wsLicenseKey) ) 

#define INovaPdfOptions80_InitializeSilent2(This,p_wsPrinterName,p_wsLicenseKey)	\
    ( (This)->lpVtbl -> InitializeSilent2(This,p_wsPrinterName,p_wsLicenseKey) ) 

#define INovaPdfOptions80_RegisterNovaEvent(This,p_wsEventName)	\
    ( (This)->lpVtbl -> RegisterNovaEvent(This,p_wsEventName) ) 

#define INovaPdfOptions80_RegisterNovaEvent2(This,p_wsEventName)	\
    ( (This)->lpVtbl -> RegisterNovaEvent2(This,p_wsEventName) ) 

#define INovaPdfOptions80_WaitForNovaEvent(This,p_nMilliseconds,p_bTimeout)	\
    ( (This)->lpVtbl -> WaitForNovaEvent(This,p_nMilliseconds,p_bTimeout) ) 

#define INovaPdfOptions80_SetOptionString(This,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetOptionString(This,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetOptionString2(This,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetOptionString2(This,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_GetOptionString(This,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetOptionString(This,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetOptionString2(This,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetOptionString2(This,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_SetOptionLong(This,p_nOption,p_lValue)	\
    ( (This)->lpVtbl -> SetOptionLong(This,p_nOption,p_lValue) ) 

#define INovaPdfOptions80_GetOptionLong(This,p_nOption,p_plValue)	\
    ( (This)->lpVtbl -> GetOptionLong(This,p_nOption,p_plValue) ) 

#define INovaPdfOptions80_SetOptionBool(This,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetOptionBool(This,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_GetOptionBool(This,p_nOption,p_pbValue)	\
    ( (This)->lpVtbl -> GetOptionBool(This,p_nOption,p_pbValue) ) 

#define INovaPdfOptions80_LoadProfile(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> LoadProfile(This,p_wsProfileId) ) 

#define INovaPdfOptions80_LoadProfile2(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> LoadProfile2(This,p_wsProfileId) ) 

#define INovaPdfOptions80_SaveProfile(This)	\
    ( (This)->lpVtbl -> SaveProfile(This) ) 

#define INovaPdfOptions80_AddProfile(This,p_wsProfileName,p_bPublicProfile,p_pwsNewProfileId)	\
    ( (This)->lpVtbl -> AddProfile(This,p_wsProfileName,p_bPublicProfile,p_pwsNewProfileId) ) 

#define INovaPdfOptions80_AddProfile2(This,p_wsProfileName,p_bPublicProfile,p_pwsNewProfileId)	\
    ( (This)->lpVtbl -> AddProfile2(This,p_wsProfileName,p_bPublicProfile,p_pwsNewProfileId) ) 

#define INovaPdfOptions80_CopyProfile(This,p_wsNewProfileName,p_bPublicProfile,p_wsOldProfileId,p_pwsNewProfileId)	\
    ( (This)->lpVtbl -> CopyProfile(This,p_wsNewProfileName,p_bPublicProfile,p_wsOldProfileId,p_pwsNewProfileId) ) 

#define INovaPdfOptions80_CopyProfile2(This,p_wsNewProfileName,p_bPublicProfile,p_wsOldProfileId,p_pwsNewProfileId)	\
    ( (This)->lpVtbl -> CopyProfile2(This,p_wsNewProfileName,p_bPublicProfile,p_wsOldProfileId,p_pwsNewProfileId) ) 

#define INovaPdfOptions80_DeleteProfile(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> DeleteProfile(This,p_wsProfileId) ) 

#define INovaPdfOptions80_DeleteProfile2(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> DeleteProfile2(This,p_wsProfileId) ) 

#define INovaPdfOptions80_GetFirstProfile(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> GetFirstProfile(This,p_wsProfileId) ) 

#define INovaPdfOptions80_GetFirstProfile2(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> GetFirstProfile2(This,p_wsProfileId) ) 

#define INovaPdfOptions80_GetNextProfile(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> GetNextProfile(This,p_wsProfileId) ) 

#define INovaPdfOptions80_GetNextProfile2(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> GetNextProfile2(This,p_wsProfileId) ) 

#define INovaPdfOptions80_GetActiveProfile(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> GetActiveProfile(This,p_wsProfileId) ) 

#define INovaPdfOptions80_GetActiveProfile2(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> GetActiveProfile2(This,p_wsProfileId) ) 

#define INovaPdfOptions80_SetActiveProfile(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> SetActiveProfile(This,p_wsProfileId) ) 

#define INovaPdfOptions80_SetActiveProfile2(This,p_wsProfileId)	\
    ( (This)->lpVtbl -> SetActiveProfile2(This,p_wsProfileId) ) 

#define INovaPdfOptions80_GetFontOption(This,p_wsFontName,p_pbAlwaysEmbed,p_pbNeverEmbed)	\
    ( (This)->lpVtbl -> GetFontOption(This,p_wsFontName,p_pbAlwaysEmbed,p_pbNeverEmbed) ) 

#define INovaPdfOptions80_GetFontOption2(This,p_wsFontName,p_pbAlwaysEmbed,p_pbNeverEmbed)	\
    ( (This)->lpVtbl -> GetFontOption2(This,p_wsFontName,p_pbAlwaysEmbed,p_pbNeverEmbed) ) 

#define INovaPdfOptions80_SetFontOption(This,p_wsFontName,p_bAlwaysEmbed,p_bNeverEmbed)	\
    ( (This)->lpVtbl -> SetFontOption(This,p_wsFontName,p_bAlwaysEmbed,p_bNeverEmbed) ) 

#define INovaPdfOptions80_SetFontOption2(This,p_wsFontName,p_bAlwaysEmbed,p_bNeverEmbed)	\
    ( (This)->lpVtbl -> SetFontOption2(This,p_wsFontName,p_bAlwaysEmbed,p_bNeverEmbed) ) 

#define INovaPdfOptions80_ClearFontOptions(This)	\
    ( (This)->lpVtbl -> ClearFontOptions(This) ) 

#define INovaPdfOptions80_AddBookmarkDefinition(This,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor,p_nDefinition)	\
    ( (This)->lpVtbl -> AddBookmarkDefinition(This,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor,p_nDefinition) ) 

#define INovaPdfOptions80_AddBookmarkDefinition2(This,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor,p_nDefinition)	\
    ( (This)->lpVtbl -> AddBookmarkDefinition2(This,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor,p_nDefinition) ) 

#define INovaPdfOptions80_ModifyBookmarkDefinition(This,p_nDefinition,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor)	\
    ( (This)->lpVtbl -> ModifyBookmarkDefinition(This,p_nDefinition,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor) ) 

#define INovaPdfOptions80_ModifyBookmarkDefinition2(This,p_nDefinition,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor)	\
    ( (This)->lpVtbl -> ModifyBookmarkDefinition2(This,p_nDefinition,p_nHeading,p_bEnabled,p_bDetFont,p_wsDetFont,p_nDetFontType,p_bDetStyle,p_bDetBold,p_bDetItalic,p_bDetSize,p_nDetSizeVal,p_nDetSizePt,p_bDetColor,p_nDetColor,p_bDispAsBold,p_bDispAsItalic,p_nDispColor) ) 

#define INovaPdfOptions80_DeleteBookmarkDefinition(This,p_nDefinition)	\
    ( (This)->lpVtbl -> DeleteBookmarkDefinition(This,p_nDefinition) ) 

#define INovaPdfOptions80_GetBookmarkDefinition(This,p_nDefinition,p_pnHeading,p_pbEnabled,p_pbDetFont,p_pwsDetFont,p_pnDetFontType,p_pbDetStyle,p_pbDetBold,p_pbDetItalic,p_pbDetSize,p_pnDetSizeVal,p_pnDetSizePt,p_pbDetColor,p_pnDetColor,p_pbDispAsBold,p_pbDispAsItalic,p_pnDispColor)	\
    ( (This)->lpVtbl -> GetBookmarkDefinition(This,p_nDefinition,p_pnHeading,p_pbEnabled,p_pbDetFont,p_pwsDetFont,p_pnDetFontType,p_pbDetStyle,p_pbDetBold,p_pbDetItalic,p_pbDetSize,p_pnDetSizeVal,p_pnDetSizePt,p_pbDetColor,p_pnDetColor,p_pbDispAsBold,p_pbDispAsItalic,p_pnDispColor) ) 

#define INovaPdfOptions80_GetBookmarkDefinition2(This,p_nDefinition,p_pnHeading,p_pbEnabled,p_pbDetFont,p_pwsDetFont,p_pnDetFontType,p_pbDetStyle,p_pbDetBold,p_pbDetItalic,p_pbDetSize,p_pnDetSizeVal,p_pnDetSizePt,p_pbDetColor,p_pnDetColor,p_pbDispAsBold,p_pbDispAsItalic,p_pnDispColor)	\
    ( (This)->lpVtbl -> GetBookmarkDefinition2(This,p_nDefinition,p_pnHeading,p_pbEnabled,p_pbDetFont,p_pwsDetFont,p_pnDetFontType,p_pbDetStyle,p_pbDetBold,p_pbDetItalic,p_pbDetSize,p_pnDetSizeVal,p_pnDetSizePt,p_pbDetColor,p_pnDetColor,p_pbDispAsBold,p_pbDispAsItalic,p_pnDispColor) ) 

#define INovaPdfOptions80_GetBookmarkDefinitionCount(This,p_nCount)	\
    ( (This)->lpVtbl -> GetBookmarkDefinitionCount(This,p_nCount) ) 

#define INovaPdfOptions80_SetDefaultPrinter(This)	\
    ( (This)->lpVtbl -> SetDefaultPrinter(This) ) 

#define INovaPdfOptions80_RestoreDefaultPrinter(This)	\
    ( (This)->lpVtbl -> RestoreDefaultPrinter(This) ) 

#define INovaPdfOptions80_GetPDFFileName(This,p_bPrintStarted,p_pwsFileName)	\
    ( (This)->lpVtbl -> GetPDFFileName(This,p_bPrintStarted,p_pwsFileName) ) 

#define INovaPdfOptions80_GetPDFFileName2(This,p_bPrintStarted,p_pwsFileName)	\
    ( (This)->lpVtbl -> GetPDFFileName2(This,p_bPrintStarted,p_pwsFileName) ) 

#define INovaPdfOptions80_SetPrinterOption(This,p_nOption,p_lValue)	\
    ( (This)->lpVtbl -> SetPrinterOption(This,p_nOption,p_lValue) ) 

#define INovaPdfOptions80_RegisterEventWindow(This,p_hWnd)	\
    ( (This)->lpVtbl -> RegisterEventWindow(This,p_hWnd) ) 

#define INovaPdfOptions80_UnRegisterEventWindow(This)	\
    ( (This)->lpVtbl -> UnRegisterEventWindow(This) ) 

#define INovaPdfOptions80_InitializeOLEUsage(This,p_pwstrOLEProgID)	\
    ( (This)->lpVtbl -> InitializeOLEUsage(This,p_pwstrOLEProgID) ) 

#define INovaPdfOptions80_LicenseOLEServer(This)	\
    ( (This)->lpVtbl -> LicenseOLEServer(This) ) 

#define INovaPdfOptions80_LicenseShellExecuteFile(This,p_pwstrFileName)	\
    ( (This)->lpVtbl -> LicenseShellExecuteFile(This,p_pwstrFileName) ) 

#define INovaPdfOptions80_LicenseApplication(This,p_pwstrAppName)	\
    ( (This)->lpVtbl -> LicenseApplication(This,p_pwstrAppName) ) 

#define INovaPdfOptions80_AddWatermarkImage(This,p_pwsNewWatermarkId,p_pwsNewLayoutId)	\
    ( (This)->lpVtbl -> AddWatermarkImage(This,p_pwsNewWatermarkId,p_pwsNewLayoutId) ) 

#define INovaPdfOptions80_AddWatermarkImage2(This,p_pwsNewWatermarkId,p_pwsNewLayoutId)	\
    ( (This)->lpVtbl -> AddWatermarkImage2(This,p_pwsNewWatermarkId,p_pwsNewLayoutId) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionString(This,p_pwsWatermarkId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionString(This,p_pwsWatermarkId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionString2(This,p_pwsWatermarkId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionString2(This,p_pwsWatermarkId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionLong(This,p_pwsWatermarkId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionLong(This,p_pwsWatermarkId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionLong2(This,p_pwsWatermarkId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionLong2(This,p_pwsWatermarkId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionBool(This,p_pwsWatermarkId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionBool(This,p_pwsWatermarkId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionBool2(This,p_pwsWatermarkId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionBool2(This,p_pwsWatermarkId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionFloat(This,p_pwsWatermarkId,p_nOption,p_fValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionFloat(This,p_pwsWatermarkId,p_nOption,p_fValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_fValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_fValue) ) 

#define INovaPdfOptions80_GetWatermarkImageCount(This,p_pnCount)	\
    ( (This)->lpVtbl -> GetWatermarkImageCount(This,p_pnCount) ) 

#define INovaPdfOptions80_GetWatermarkImage(This,p_nIndex,p_pwsWatermarkId)	\
    ( (This)->lpVtbl -> GetWatermarkImage(This,p_nIndex,p_pwsWatermarkId) ) 

#define INovaPdfOptions80_GetWatermarkImage2(This,p_nIndex,p_pwsWatermarkId)	\
    ( (This)->lpVtbl -> GetWatermarkImage2(This,p_nIndex,p_pwsWatermarkId) ) 

#define INovaPdfOptions80_DeleteWatermarkImage(This,p_wsWatermarkId)	\
    ( (This)->lpVtbl -> DeleteWatermarkImage(This,p_wsWatermarkId) ) 

#define INovaPdfOptions80_DeleteWatermarkImage2(This,p_wsWatermarkId)	\
    ( (This)->lpVtbl -> DeleteWatermarkImage2(This,p_wsWatermarkId) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionString(This,p_pwsWatermarkId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionString(This,p_pwsWatermarkId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionString2(This,p_pwsWatermarkId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionString2(This,p_pwsWatermarkId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionLong(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionLong(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionLong2(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionLong2(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionBool(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionBool(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionBool2(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionBool2(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionFloat(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionFloat(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_SetLayoutOptionString(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionString(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetLayoutOptionString2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionString2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetLayoutOptionLong(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionLong(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetLayoutOptionLong2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionLong2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetLayoutOptionBool(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionBool(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_SetLayoutOptionBool2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionBool2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_SetLayoutOptionFloat(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_fValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionFloat(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_fValue) ) 

#define INovaPdfOptions80_SetLayoutOptionFloat2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_fValue)	\
    ( (This)->lpVtbl -> SetLayoutOptionFloat2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_fValue) ) 

#define INovaPdfOptions80_GetLayoutOptionString(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionString(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetLayoutOptionString2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionString2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetLayoutOptionLong(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionLong(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetLayoutOptionLong2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionLong2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetLayoutOptionBool(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionBool(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetLayoutOptionBool2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionBool2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetLayoutOptionFloat(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionFloat(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetLayoutOptionFloat2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetLayoutOptionFloat2(This,p_pwsObjectId,p_pwsLayoutId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetLayoutCount(This,p_wsObjectId,p_pnCount)	\
    ( (This)->lpVtbl -> GetLayoutCount(This,p_wsObjectId,p_pnCount) ) 

#define INovaPdfOptions80_GetLayoutCount2(This,p_wsObjectId,p_pnCount)	\
    ( (This)->lpVtbl -> GetLayoutCount2(This,p_wsObjectId,p_pnCount) ) 

#define INovaPdfOptions80_GetLayout(This,p_pwsObjectId,p_nIndex,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetLayout(This,p_pwsObjectId,p_nIndex,p_pwsLayoutId) ) 

#define INovaPdfOptions80_GetLayout2(This,p_pwsObjectId,p_nIndex,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetLayout2(This,p_pwsObjectId,p_nIndex,p_pwsLayoutId) ) 

#define INovaPdfOptions80_DeleteLayout(This,p_pwsObjectId,p_wsLayoutId)	\
    ( (This)->lpVtbl -> DeleteLayout(This,p_pwsObjectId,p_wsLayoutId) ) 

#define INovaPdfOptions80_DeleteLayout2(This,p_pwsObjectId,p_wsLayoutId)	\
    ( (This)->lpVtbl -> DeleteLayout2(This,p_pwsObjectId,p_wsLayoutId) ) 

#define INovaPdfOptions80_AddWatermarkText(This,p_pwsNewWatermarkId,p_pwsNewLayoutId)	\
    ( (This)->lpVtbl -> AddWatermarkText(This,p_pwsNewWatermarkId,p_pwsNewLayoutId) ) 

#define INovaPdfOptions80_AddWatermarkText2(This,p_pwsNewWatermarkId,p_pwsNewLayoutId)	\
    ( (This)->lpVtbl -> AddWatermarkText2(This,p_pwsNewWatermarkId,p_pwsNewLayoutId) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionString(This,p_pwsWatermarkId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionString(This,p_pwsWatermarkId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionString2(This,p_pwsWatermarkId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionString2(This,p_pwsWatermarkId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionLong(This,p_pwsWatermarkId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionLong(This,p_pwsWatermarkId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionLong2(This,p_pwsWatermarkId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionLong2(This,p_pwsWatermarkId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionBool(This,p_pwsWatermarkId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionBool(This,p_pwsWatermarkId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionBool2(This,p_pwsWatermarkId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionBool2(This,p_pwsWatermarkId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionFloat(This,p_pwsWatermarkId,p_nOption,p_fValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionFloat(This,p_pwsWatermarkId,p_nOption,p_fValue) ) 

#define INovaPdfOptions80_SetWatermarkTextOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_fValue)	\
    ( (This)->lpVtbl -> SetWatermarkTextOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_fValue) ) 

#define INovaPdfOptions80_GetWatermarkTextCount(This,p_pnCount)	\
    ( (This)->lpVtbl -> GetWatermarkTextCount(This,p_pnCount) ) 

#define INovaPdfOptions80_GetWatermarkText(This,p_nIndex,p_pwsWatermarkId)	\
    ( (This)->lpVtbl -> GetWatermarkText(This,p_nIndex,p_pwsWatermarkId) ) 

#define INovaPdfOptions80_GetWatermarkText2(This,p_nIndex,p_pwsWatermarkId)	\
    ( (This)->lpVtbl -> GetWatermarkText2(This,p_nIndex,p_pwsWatermarkId) ) 

#define INovaPdfOptions80_DeleteWatermarkText(This,p_wsWatermarkId)	\
    ( (This)->lpVtbl -> DeleteWatermarkText(This,p_wsWatermarkId) ) 

#define INovaPdfOptions80_DeleteWatermarkText2(This,p_wsWatermarkId)	\
    ( (This)->lpVtbl -> DeleteWatermarkText2(This,p_wsWatermarkId) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionString(This,p_pwsWatermarkId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionString(This,p_pwsWatermarkId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionString2(This,p_pwsWatermarkId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionString2(This,p_pwsWatermarkId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionLong(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionLong(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionLong2(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionLong2(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionBool(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionBool(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionBool2(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionBool2(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionFloat(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionFloat(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetWatermarkTextOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetWatermarkTextOptionFloat2(This,p_pwsWatermarkId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_AddNovaPrinter(This,p_wsPrinterName,p_wsPortName,p_wsOEMID,p_wsServicePort,p_wsLicenseKey)	\
    ( (This)->lpVtbl -> AddNovaPrinter(This,p_wsPrinterName,p_wsPortName,p_wsOEMID,p_wsServicePort,p_wsLicenseKey) ) 

#define INovaPdfOptions80_AddNovaPrinter2(This,p_wsPrinterName,p_wsPortName,p_wsOEMID,p_wsServicePort,p_wsLicenseKey)	\
    ( (This)->lpVtbl -> AddNovaPrinter2(This,p_wsPrinterName,p_wsPortName,p_wsOEMID,p_wsServicePort,p_wsLicenseKey) ) 

#define INovaPdfOptions80_DeleteNovaPrinter(This,p_wsPrinterName)	\
    ( (This)->lpVtbl -> DeleteNovaPrinter(This,p_wsPrinterName) ) 

#define INovaPdfOptions80_DeleteNovaPrinter2(This,p_wsPrinterName)	\
    ( (This)->lpVtbl -> DeleteNovaPrinter2(This,p_wsPrinterName) ) 

#define INovaPdfOptions80_AddEmail(This,p_pwsNewEmailId)	\
    ( (This)->lpVtbl -> AddEmail(This,p_pwsNewEmailId) ) 

#define INovaPdfOptions80_AddEmail2(This,p_pwsNewEmailId)	\
    ( (This)->lpVtbl -> AddEmail2(This,p_pwsNewEmailId) ) 

#define INovaPdfOptions80_SetEmailOptionString(This,p_pwsEmailId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetEmailOptionString(This,p_pwsEmailId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetEmailOptionString2(This,p_pwsEmailId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetEmailOptionString2(This,p_pwsEmailId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetEmailOptionLong(This,p_pwsEmailId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetEmailOptionLong(This,p_pwsEmailId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetEmailOptionLong2(This,p_pwsEmailId,p_nOption,p_nValue)	\
    ( (This)->lpVtbl -> SetEmailOptionLong2(This,p_pwsEmailId,p_nOption,p_nValue) ) 

#define INovaPdfOptions80_SetEmailOptionBool(This,p_pwsEmailId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetEmailOptionBool(This,p_pwsEmailId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_SetEmailOptionBool2(This,p_pwsEmailId,p_nOption,p_bValue)	\
    ( (This)->lpVtbl -> SetEmailOptionBool2(This,p_pwsEmailId,p_nOption,p_bValue) ) 

#define INovaPdfOptions80_GetEmailCount(This,p_pnCount)	\
    ( (This)->lpVtbl -> GetEmailCount(This,p_pnCount) ) 

#define INovaPdfOptions80_GetEmail(This,p_nIndex,p_pwsEmailId)	\
    ( (This)->lpVtbl -> GetEmail(This,p_nIndex,p_pwsEmailId) ) 

#define INovaPdfOptions80_GetEmail2(This,p_nIndex,p_pwsEmailId)	\
    ( (This)->lpVtbl -> GetEmail2(This,p_nIndex,p_pwsEmailId) ) 

#define INovaPdfOptions80_DeleteEmail(This,p_wsEmailId)	\
    ( (This)->lpVtbl -> DeleteEmail(This,p_wsEmailId) ) 

#define INovaPdfOptions80_DeleteEmail2(This,p_wsEmailId)	\
    ( (This)->lpVtbl -> DeleteEmail2(This,p_wsEmailId) ) 

#define INovaPdfOptions80_GetEmailOptionString(This,p_pwsEmailId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetEmailOptionString(This,p_pwsEmailId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetEmailOptionString2(This,p_pwsEmailId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetEmailOptionString2(This,p_pwsEmailId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetEmailOptionLong(This,p_pwsEmailId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetEmailOptionLong(This,p_pwsEmailId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetEmailOptionLong2(This,p_pwsEmailId,p_nOption,p_pnValue)	\
    ( (This)->lpVtbl -> GetEmailOptionLong2(This,p_pwsEmailId,p_nOption,p_pnValue) ) 

#define INovaPdfOptions80_GetEmailOptionBool(This,p_pwsEmailId,p_nOption,p_pbValue)	\
    ( (This)->lpVtbl -> GetEmailOptionBool(This,p_pwsEmailId,p_nOption,p_pbValue) ) 

#define INovaPdfOptions80_GetEmailOptionBool2(This,p_pwsEmailId,p_nOption,p_pbValue)	\
    ( (This)->lpVtbl -> GetEmailOptionBool2(This,p_pwsEmailId,p_nOption,p_pbValue) ) 

#define INovaPdfOptions80_AddEmailRecipient(This,p_pwsEmailId,p_pwsNewRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC)	\
    ( (This)->lpVtbl -> AddEmailRecipient(This,p_pwsEmailId,p_pwsNewRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC) ) 

#define INovaPdfOptions80_AddEmailRecipient2(This,p_pwsEmailId,p_pwsNewRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC)	\
    ( (This)->lpVtbl -> AddEmailRecipient2(This,p_pwsEmailId,p_pwsNewRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC) ) 

#define INovaPdfOptions80_DeleteEmailRecipient(This,p_pwsEmailId,p_pwsRecipientId)	\
    ( (This)->lpVtbl -> DeleteEmailRecipient(This,p_pwsEmailId,p_pwsRecipientId) ) 

#define INovaPdfOptions80_DeleteEmailRecipient2(This,p_pwsEmailId,p_pwsRecipientId)	\
    ( (This)->lpVtbl -> DeleteEmailRecipient2(This,p_pwsEmailId,p_pwsRecipientId) ) 

#define INovaPdfOptions80_GetEmailRecipientCount(This,p_pwsEmailId,p_pnCount)	\
    ( (This)->lpVtbl -> GetEmailRecipientCount(This,p_pwsEmailId,p_pnCount) ) 

#define INovaPdfOptions80_GetEmailRecipientCount2(This,p_pwsEmailId,p_pnCount)	\
    ( (This)->lpVtbl -> GetEmailRecipientCount2(This,p_pwsEmailId,p_pnCount) ) 

#define INovaPdfOptions80_GetEmailRecipient(This,p_nIndex,p_pwsEmailId,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC)	\
    ( (This)->lpVtbl -> GetEmailRecipient(This,p_nIndex,p_pwsEmailId,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC) ) 

#define INovaPdfOptions80_GetEmailRecipient2(This,p_nIndex,p_pwsEmailId,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC)	\
    ( (This)->lpVtbl -> GetEmailRecipient2(This,p_nIndex,p_pwsEmailId,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC) ) 

#define INovaPdfOptions80_SetEmailRecipient(This,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC)	\
    ( (This)->lpVtbl -> SetEmailRecipient(This,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC) ) 

#define INovaPdfOptions80_SetEmailRecipient2(This,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC)	\
    ( (This)->lpVtbl -> SetEmailRecipient2(This,p_pwsRecipientId,p_pwsFrom,p_pwsTo,p_pwsCC,p_pwsBCC) ) 

#define INovaPdfOptions80_GetSignature(This,p_pwsSignatureId,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetSignature(This,p_pwsSignatureId,p_pwsLayoutId) ) 

#define INovaPdfOptions80_GetSignature2(This,p_pwsSignatureId,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetSignature2(This,p_pwsSignatureId,p_pwsLayoutId) ) 

#define INovaPdfOptions80_GetOverlay(This,p_pwsOverlayId,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetOverlay(This,p_pwsOverlayId,p_pwsLayoutId) ) 

#define INovaPdfOptions80_GetOverlay2(This,p_pwsOverlayId,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetOverlay2(This,p_pwsOverlayId,p_pwsLayoutId) ) 

#define INovaPdfOptions80_GetContentLayout(This,p_pwsContentId,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetContentLayout(This,p_pwsContentId,p_pwsLayoutId) ) 

#define INovaPdfOptions80_GetContentLayout2(This,p_pwsContentId,p_pwsLayoutId)	\
    ( (This)->lpVtbl -> GetContentLayout2(This,p_pwsContentId,p_pwsLayoutId) ) 

#define INovaPdfOptions80_SetOptionEncryptedString(This,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetOptionEncryptedString(This,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetOptionEncryptedString2(This,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetOptionEncryptedString2(This,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_GetOptionEncryptedString(This,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetOptionEncryptedString(This,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetOptionEncryptedString2(This,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetOptionEncryptedString2(This,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionEncryptedString(This,p_pwsWatermarkId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionEncryptedString(This,p_pwsWatermarkId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetWatermarkImageOptionEncryptedString2(This,p_pwsWatermarkId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetWatermarkImageOptionEncryptedString2(This,p_pwsWatermarkId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionEncryptedString(This,p_pwsWatermarkId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionEncryptedString(This,p_pwsWatermarkId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetWatermarkImageOptionEncryptedString2(This,p_pwsWatermarkId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetWatermarkImageOptionEncryptedString2(This,p_pwsWatermarkId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_SetEmailOptionEncryptedString(This,p_pwsEmailId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetEmailOptionEncryptedString(This,p_pwsEmailId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_SetEmailOptionEncryptedString2(This,p_pwsEmailId,p_nOption,p_wsValue)	\
    ( (This)->lpVtbl -> SetEmailOptionEncryptedString2(This,p_pwsEmailId,p_nOption,p_wsValue) ) 

#define INovaPdfOptions80_GetEmailOptionEncryptedString(This,p_pwsEmailId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetEmailOptionEncryptedString(This,p_pwsEmailId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_GetEmailOptionEncryptedString2(This,p_pwsEmailId,p_nOption,p_pwsValue)	\
    ( (This)->lpVtbl -> GetEmailOptionEncryptedString2(This,p_pwsEmailId,p_nOption,p_pwsValue) ) 

#define INovaPdfOptions80_SetPrinterActivePublicProfile(This,p_wsPrinterName,p_wsProfileId)	\
    ( (This)->lpVtbl -> SetPrinterActivePublicProfile(This,p_wsPrinterName,p_wsProfileId) ) 

#define INovaPdfOptions80_SetPrinterActivePublicProfile2(This,p_wsPrinterName,p_wsProfileId)	\
    ( (This)->lpVtbl -> SetPrinterActivePublicProfile2(This,p_wsPrinterName,p_wsProfileId) ) 

#define INovaPdfOptions80_DeletePrinterActivePublicProfile(This,p_wsPrinterName)	\
    ( (This)->lpVtbl -> DeletePrinterActivePublicProfile(This,p_wsPrinterName) ) 

#define INovaPdfOptions80_DeletePrinterActivePublicProfile2(This,p_wsPrinterName)	\
    ( (This)->lpVtbl -> DeletePrinterActivePublicProfile2(This,p_wsPrinterName) ) 

#define INovaPdfOptions80_SetPrinterPublicProfile(This,p_wsPrinterName,p_wsProfileId,p_bVisible)	\
    ( (This)->lpVtbl -> SetPrinterPublicProfile(This,p_wsPrinterName,p_wsProfileId,p_bVisible) ) 

#define INovaPdfOptions80_SetPrinterPublicProfile2(This,p_wsPrinterName,p_wsProfileId,p_bVisible)	\
    ( (This)->lpVtbl -> SetPrinterPublicProfile2(This,p_wsPrinterName,p_wsProfileId,p_bVisible) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetWatermarkTextOptionBool2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsWatermarkId,
    /* [in] */ LONG p_nOption,
    /* [out] */ BOOL *p_pnValue);


void __RPC_STUB INovaPdfOptions80_GetWatermarkTextOptionBool2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetWatermarkTextOptionFloat_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsWatermarkId,
    /* [in] */ LONG p_nOption,
    /* [out] */ FLOAT *p_pnValue);


void __RPC_STUB INovaPdfOptions80_GetWatermarkTextOptionFloat_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetWatermarkTextOptionFloat2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsWatermarkId,
    /* [in] */ LONG p_nOption,
    /* [out] */ FLOAT *p_pnValue);


void __RPC_STUB INovaPdfOptions80_GetWatermarkTextOptionFloat2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_AddNovaPrinter_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPCWSTR p_wsPrinterName,
    /* [string][in] */ LPCWSTR p_wsPortName,
    /* [string][in] */ LPCWSTR p_wsOEMID,
    /* [string][in] */ LPCWSTR p_wsServicePort,
    /* [string][in] */ LPCWSTR p_wsLicenseKey);


void __RPC_STUB INovaPdfOptions80_AddNovaPrinter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_AddNovaPrinter2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_wsPrinterName,
    /* [string][in] */ BSTR p_wsPortName,
    /* [string][in] */ BSTR p_wsOEMID,
    /* [string][in] */ BSTR p_wsServicePort,
    /* [string][in] */ BSTR p_wsLicenseKey);


void __RPC_STUB INovaPdfOptions80_AddNovaPrinter2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeleteNovaPrinter_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPCWSTR p_wsPrinterName);


void __RPC_STUB INovaPdfOptions80_DeleteNovaPrinter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeleteNovaPrinter2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_wsPrinterName);


void __RPC_STUB INovaPdfOptions80_DeleteNovaPrinter2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_AddEmail_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ LPWSTR *p_pwsNewEmailId);


void __RPC_STUB INovaPdfOptions80_AddEmail_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_AddEmail2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ BSTR *p_pwsNewEmailId);


void __RPC_STUB INovaPdfOptions80_AddEmail2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionString_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ LPCWSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ BSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionLong_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [in] */ LONG p_nValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionLong_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionLong2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [in] */ LONG p_nValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionLong2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionBool_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [in] */ BOOL p_bValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionBool_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionBool2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [in] */ BOOL p_bValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionBool2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailCount_Proxy( 
    INovaPdfOptions80 * This,
    /* [out] */ LONG *p_pnCount);


void __RPC_STUB INovaPdfOptions80_GetEmailCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmail_Proxy( 
    INovaPdfOptions80 * This,
    LONG p_nIndex,
    /* [string][out] */ LPWSTR *p_pwsEmailId);


void __RPC_STUB INovaPdfOptions80_GetEmail_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmail2_Proxy( 
    INovaPdfOptions80 * This,
    LONG p_nIndex,
    /* [string][out] */ BSTR *p_pwsEmailId);


void __RPC_STUB INovaPdfOptions80_GetEmail2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeleteEmail_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_wsEmailId);


void __RPC_STUB INovaPdfOptions80_DeleteEmail_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeleteEmail2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_wsEmailId);


void __RPC_STUB INovaPdfOptions80_DeleteEmail2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionString_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ LPWSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ BSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionLong_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [out] */ LONG *p_pnValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionLong_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionLong2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [out] */ LONG *p_pnValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionLong2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionBool_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [out] */ BOOL *p_pbValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionBool_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionBool2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [out] */ BOOL *p_pbValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionBool2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_AddEmailRecipient_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [string][out] */ LPWSTR *p_pwsNewRecipientId,
    /* [string][in] */ LPWSTR p_pwsFrom,
    /* [string][in] */ LPWSTR p_pwsTo,
    /* [string][in] */ LPWSTR p_pwsCC,
    /* [string][in] */ LPWSTR p_pwsBCC);


void __RPC_STUB INovaPdfOptions80_AddEmailRecipient_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_AddEmailRecipient2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [string][out] */ BSTR *p_pwsNewRecipientId,
    /* [string][in] */ BSTR p_pwsFrom,
    /* [string][in] */ BSTR p_pwsTo,
    /* [string][in] */ BSTR p_pwsCC,
    /* [string][in] */ BSTR p_pwsBCC);


void __RPC_STUB INovaPdfOptions80_AddEmailRecipient2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeleteEmailRecipient_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [string][in] */ LPWSTR p_pwsRecipientId);


void __RPC_STUB INovaPdfOptions80_DeleteEmailRecipient_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeleteEmailRecipient2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [string][in] */ BSTR p_pwsRecipientId);


void __RPC_STUB INovaPdfOptions80_DeleteEmailRecipient2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailRecipientCount_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [out] */ LONG *p_pnCount);


void __RPC_STUB INovaPdfOptions80_GetEmailRecipientCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailRecipientCount2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [out] */ LONG *p_pnCount);


void __RPC_STUB INovaPdfOptions80_GetEmailRecipientCount2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailRecipient_Proxy( 
    INovaPdfOptions80 * This,
    /* [in] */ LONG p_nIndex,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [string][out] */ LPWSTR *p_pwsRecipientId,
    /* [string][out] */ LPWSTR *p_pwsFrom,
    /* [string][out] */ LPWSTR *p_pwsTo,
    /* [string][out] */ LPWSTR *p_pwsCC,
    /* [string][out] */ LPWSTR *p_pwsBCC);


void __RPC_STUB INovaPdfOptions80_GetEmailRecipient_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailRecipient2_Proxy( 
    INovaPdfOptions80 * This,
    /* [in] */ LONG p_nIndex,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [string][out] */ BSTR *p_pwsRecipientId,
    /* [string][out] */ BSTR *p_pwsFrom,
    /* [string][out] */ BSTR *p_pwsTo,
    /* [string][out] */ BSTR *p_pwsCC,
    /* [string][out] */ BSTR *p_pwsBCC);


void __RPC_STUB INovaPdfOptions80_GetEmailRecipient2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailRecipient_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsRecipientId,
    /* [string][in] */ LPWSTR p_pwsFrom,
    /* [string][in] */ LPWSTR p_pwsTo,
    /* [string][in] */ LPWSTR p_pwsCC,
    /* [string][in] */ LPWSTR p_pwsBCC);


void __RPC_STUB INovaPdfOptions80_SetEmailRecipient_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailRecipient2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsRecipientId,
    /* [string][in] */ BSTR p_pwsFrom,
    /* [string][in] */ BSTR p_pwsTo,
    /* [string][in] */ BSTR p_pwsCC,
    /* [string][in] */ BSTR p_pwsBCC);


void __RPC_STUB INovaPdfOptions80_SetEmailRecipient2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetSignature_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ LPWSTR *p_pwsSignatureId,
    LPWSTR *p_pwsLayoutId);


void __RPC_STUB INovaPdfOptions80_GetSignature_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetSignature2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ BSTR *p_pwsSignatureId,
    BSTR *p_pwsLayoutId);


void __RPC_STUB INovaPdfOptions80_GetSignature2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetOverlay_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ LPWSTR *p_pwsOverlayId,
    LPWSTR *p_pwsLayoutId);


void __RPC_STUB INovaPdfOptions80_GetOverlay_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetOverlay2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ BSTR *p_pwsOverlayId,
    BSTR *p_pwsLayoutId);


void __RPC_STUB INovaPdfOptions80_GetOverlay2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetContentLayout_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ LPWSTR *p_pwsContentId,
    /* [string][out] */ LPWSTR *p_pwsLayoutId);


void __RPC_STUB INovaPdfOptions80_GetContentLayout_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetContentLayout2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][out] */ BSTR *p_pwsContentId,
    /* [string][out] */ BSTR *p_pwsLayoutId);


void __RPC_STUB INovaPdfOptions80_GetContentLayout2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetOptionEncryptedString_Proxy( 
    INovaPdfOptions80 * This,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ LPCWSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetOptionEncryptedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetOptionEncryptedString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ BSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetOptionEncryptedString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetOptionEncryptedString_Proxy( 
    INovaPdfOptions80 * This,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ LPWSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetOptionEncryptedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetOptionEncryptedString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ BSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetOptionEncryptedString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetWatermarkImageOptionEncryptedString_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsWatermarkId,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ LPCWSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetWatermarkImageOptionEncryptedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetWatermarkImageOptionEncryptedString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsWatermarkId,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ BSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetWatermarkImageOptionEncryptedString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetWatermarkImageOptionEncryptedString_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsWatermarkId,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ LPWSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetWatermarkImageOptionEncryptedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetWatermarkImageOptionEncryptedString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsWatermarkId,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ BSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetWatermarkImageOptionEncryptedString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionEncryptedString_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ LPCWSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionEncryptedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetEmailOptionEncryptedString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][in] */ BSTR p_wsValue);


void __RPC_STUB INovaPdfOptions80_SetEmailOptionEncryptedString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionEncryptedString_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ LPWSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionEncryptedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_GetEmailOptionEncryptedString2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_pwsEmailId,
    /* [in] */ LONG p_nOption,
    /* [string][out] */ BSTR *p_pwsValue);


void __RPC_STUB INovaPdfOptions80_GetEmailOptionEncryptedString2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetPrinterActivePublicProfile_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_wsPrinterName,
    /* [string][in] */ LPWSTR p_wsProfileId);


void __RPC_STUB INovaPdfOptions80_SetPrinterActivePublicProfile_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetPrinterActivePublicProfile2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_wsPrinterName,
    /* [string][in] */ BSTR p_wsProfileId);


void __RPC_STUB INovaPdfOptions80_SetPrinterActivePublicProfile2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeletePrinterActivePublicProfile_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_wsPrinterName);


void __RPC_STUB INovaPdfOptions80_DeletePrinterActivePublicProfile_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_DeletePrinterActivePublicProfile2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_wsPrinterName);


void __RPC_STUB INovaPdfOptions80_DeletePrinterActivePublicProfile2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetPrinterPublicProfile_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ LPWSTR p_wsPrinterName,
    /* [string][in] */ LPWSTR p_wsProfileId,
    /* [in] */ BOOL p_bVisible);


void __RPC_STUB INovaPdfOptions80_SetPrinterPublicProfile_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE INovaPdfOptions80_SetPrinterPublicProfile2_Proxy( 
    INovaPdfOptions80 * This,
    /* [string][in] */ BSTR p_wsPrinterName,
    /* [string][in] */ BSTR p_wsProfileId,
    /* [in] */ BOOL p_bVisible);


void __RPC_STUB INovaPdfOptions80_SetPrinterPublicProfile2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __INovaPdfOptions80_INTERFACE_DEFINED__ */



#ifndef __novaPILib80_LIBRARY_DEFINED__
#define __novaPILib80_LIBRARY_DEFINED__

/* library novaPILib80 */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_novaPILib80;

EXTERN_C const CLSID CLSID_NovaPdfOptions80;

#ifdef __cplusplus

class DECLSPEC_UUID("74DA3985-C44B-4CFB-885B-FA0F19DFD36D")
NovaPdfOptions80;
#endif
#endif /* __novaPILib80_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


