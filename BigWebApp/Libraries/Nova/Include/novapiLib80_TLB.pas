unit novapiLib80_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 17252 $
// File generated on 6/11/2013 5:40:00 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\Softland\novaPDF 8\SDK\Lib\i386\novapi80.dll (1)
// LIBID: {9B7C4847-8D28-43CC-ADD2-A6495EB93175}
// LCID: 0
// Helpfile: 
// HelpString: novaPI 8.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  novapiLib80MajorVersion = 8;
  novapiLib80MinorVersion = 0;

  LIBID_novapiLib80: TGUID = '{9B7C4847-8D28-43CC-ADD2-A6495EB93175}';

  IID_INovaPdfOptions80: TGUID = '{1988B197-ADAD-4195-A8C1-AB033F615287}';
  CLASS_NovaPdfOptions80: TGUID = '{74DA3985-C44B-4CFB-885B-FA0F19DFD36D}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  INovaPdfOptions80 = interface;
  INovaPdfOptions80Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  NovaPdfOptions80 = INovaPdfOptions80;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPWideChar1 = ^PWideChar; {*}
  PWideString1 = ^WideString; {*}


// *********************************************************************//
// Interface: INovaPdfOptions80
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1988B197-ADAD-4195-A8C1-AB033F615287}
// *********************************************************************//
  INovaPdfOptions80 = interface(IDispatch)
    ['{1988B197-ADAD-4195-A8C1-AB033F615287}']
    procedure Initialize(p_wsPrinterName: PWideChar; p_wsLicenseKey: PWideChar); safecall;
    procedure Initialize2(const p_wsPrinterName: WideString; const p_wsLicenseKey: WideString); safecall;
    procedure InitializeSilent(p_wsPrinterName: PWideChar; p_wsLicenseKey: PWideChar); safecall;
    procedure InitializeSilent2(const p_wsPrinterName: WideString; const p_wsLicenseKey: WideString); safecall;
    procedure RegisterNovaEvent(p_wsEventName: PWideChar); safecall;
    procedure RegisterNovaEvent2(const p_wsEventName: WideString); safecall;
    procedure WaitForNovaEvent(p_nMilliseconds: Integer; out p_bTimeout: Integer); safecall;
    procedure SetOptionString(p_nOption: Integer; p_wsValue: PWideChar); safecall;
    procedure SetOptionString2(p_nOption: Integer; const p_wsValue: WideString); safecall;
    procedure GetOptionString(p_nOption: Integer; out p_pwsValue: PWideChar); safecall;
    procedure GetOptionString2(p_nOption: Integer; out p_pwsValue: WideString); safecall;
    procedure SetOptionLong(p_nOption: Integer; p_lValue: Integer); safecall;
    procedure GetOptionLong(p_nOption: Integer; out p_plValue: Integer); safecall;
    procedure SetOptionBool(p_nOption: Integer; p_bValue: Integer); safecall;
    procedure GetOptionBool(p_nOption: Integer; out p_pbValue: Integer); safecall;
    procedure LoadProfile(p_wsProfileId: PWideChar); safecall;
    procedure LoadProfile2(const p_wsProfileId: WideString); safecall;
    procedure SaveProfile; safecall;
    procedure AddProfile(p_wsProfileName: PWideChar; p_bPublicProfile: Integer; 
                         out p_pwsNewProfileId: PWideChar); safecall;
    procedure AddProfile2(const p_wsProfileName: WideString; p_bPublicProfile: Integer; 
                          out p_pwsNewProfileId: WideString); safecall;
    procedure CopyProfile(p_wsNewProfileName: PWideChar; p_bPublicProfile: Integer; 
                          p_wsOldProfileId: PWideChar; out p_pwsNewProfileId: PWideChar); safecall;
    procedure CopyProfile2(const p_wsNewProfileName: WideString; p_bPublicProfile: Integer; 
                           const p_wsOldProfileId: WideString; out p_pwsNewProfileId: WideString); safecall;
    procedure DeleteProfile(p_wsProfileId: PWideChar); safecall;
    procedure DeleteProfile2(const p_wsProfileId: WideString); safecall;
    procedure GetFirstProfile(out p_wsProfileId: PWideChar); safecall;
    procedure GetFirstProfile2(out p_wsProfileId: WideString); safecall;
    procedure GetNextProfile(out p_wsProfileId: PWideChar); safecall;
    procedure GetNextProfile2(out p_wsProfileId: WideString); safecall;
    procedure GetActiveProfile(out p_wsProfileId: PWideChar); safecall;
    procedure GetActiveProfile2(out p_wsProfileId: WideString); safecall;
    procedure SetActiveProfile(p_wsProfileId: PWideChar); safecall;
    procedure SetActiveProfile2(const p_wsProfileId: WideString); safecall;
    procedure GetFontOption(p_wsFontName: PWideChar; out p_pbAlwaysEmbed: Integer; 
                            out p_pbNeverEmbed: Integer); safecall;
    procedure GetFontOption2(const p_wsFontName: WideString; out p_pbAlwaysEmbed: Integer; 
                             out p_pbNeverEmbed: Integer); safecall;
    procedure SetFontOption(p_wsFontName: PWideChar; p_bAlwaysEmbed: Integer; p_bNeverEmbed: Integer); safecall;
    procedure SetFontOption2(const p_wsFontName: WideString; p_bAlwaysEmbed: Integer; 
                             p_bNeverEmbed: Integer); safecall;
    procedure ClearFontOptions; safecall;
    procedure AddBookmarkDefinition(p_nHeading: Smallint; p_bEnabled: Integer; p_bDetFont: Integer; 
                                    p_wsDetFont: PWideChar; p_nDetFontType: Integer; 
                                    p_bDetStyle: Integer; p_bDetBold: Integer; 
                                    p_bDetItalic: Integer; p_bDetSize: Integer; 
                                    p_nDetSizeVal: SYSINT; p_nDetSizePt: Single; 
                                    p_bDetColor: Integer; p_nDetColor: Integer; 
                                    p_bDispAsBold: Integer; p_bDispAsItalic: Integer; 
                                    p_nDispColor: Integer; out p_nDefinition: Smallint); safecall;
    procedure AddBookmarkDefinition2(p_nHeading: Smallint; p_bEnabled: Integer; 
                                     p_bDetFont: Integer; const p_wsDetFont: WideString; 
                                     p_nDetFontType: Integer; p_bDetStyle: Integer; 
                                     p_bDetBold: Integer; p_bDetItalic: Integer; 
                                     p_bDetSize: Integer; p_nDetSizeVal: SYSINT; 
                                     p_nDetSizePt: Single; p_bDetColor: Integer; 
                                     p_nDetColor: Integer; p_bDispAsBold: Integer; 
                                     p_bDispAsItalic: Integer; p_nDispColor: Integer; 
                                     out p_nDefinition: Smallint); safecall;
    procedure ModifyBookmarkDefinition(p_nDefinition: Smallint; p_nHeading: Smallint; 
                                       p_bEnabled: Integer; p_bDetFont: Integer; 
                                       p_wsDetFont: PWideChar; p_nDetFontType: Integer; 
                                       p_bDetStyle: Integer; p_bDetBold: Integer; 
                                       p_bDetItalic: Integer; p_bDetSize: Integer; 
                                       p_nDetSizeVal: SYSINT; p_nDetSizePt: Single; 
                                       p_bDetColor: Integer; p_nDetColor: Integer; 
                                       p_bDispAsBold: Integer; p_bDispAsItalic: Integer; 
                                       p_nDispColor: Integer); safecall;
    procedure ModifyBookmarkDefinition2(p_nDefinition: Smallint; p_nHeading: Smallint; 
                                        p_bEnabled: Integer; p_bDetFont: Integer; 
                                        const p_wsDetFont: WideString; p_nDetFontType: Integer; 
                                        p_bDetStyle: Integer; p_bDetBold: Integer; 
                                        p_bDetItalic: Integer; p_bDetSize: Integer; 
                                        p_nDetSizeVal: SYSINT; p_nDetSizePt: Single; 
                                        p_bDetColor: Integer; p_nDetColor: Integer; 
                                        p_bDispAsBold: Integer; p_bDispAsItalic: Integer; 
                                        p_nDispColor: Integer); safecall;
    procedure DeleteBookmarkDefinition(p_nDefinition: Smallint); safecall;
    procedure GetBookmarkDefinition(p_nDefinition: Smallint; out p_pnHeading: Smallint; 
                                    out p_pbEnabled: Integer; out p_pbDetFont: Integer; 
                                    out p_pwsDetFont: PWideChar; out p_pnDetFontType: Integer; 
                                    out p_pbDetStyle: Integer; out p_pbDetBold: Integer; 
                                    out p_pbDetItalic: Integer; out p_pbDetSize: Integer; 
                                    out p_pnDetSizeVal: SYSINT; out p_pnDetSizePt: Single; 
                                    out p_pbDetColor: Integer; out p_pnDetColor: Integer; 
                                    out p_pbDispAsBold: Integer; out p_pbDispAsItalic: Integer; 
                                    out p_pnDispColor: Integer); safecall;
    procedure GetBookmarkDefinition2(p_nDefinition: Smallint; out p_pnHeading: Smallint; 
                                     out p_pbEnabled: Integer; out p_pbDetFont: Integer; 
                                     out p_pwsDetFont: WideString; out p_pnDetFontType: Integer; 
                                     out p_pbDetStyle: Integer; out p_pbDetBold: Integer; 
                                     out p_pbDetItalic: Integer; out p_pbDetSize: Integer; 
                                     out p_pnDetSizeVal: SYSINT; out p_pnDetSizePt: Single; 
                                     out p_pbDetColor: Integer; out p_pnDetColor: Integer; 
                                     out p_pbDispAsBold: Integer; out p_pbDispAsItalic: Integer; 
                                     out p_pnDispColor: Integer); safecall;
    procedure GetBookmarkDefinitionCount(out p_nCount: Smallint); safecall;
    procedure SetDefaultPrinter; safecall;
    procedure RestoreDefaultPrinter; safecall;
    procedure GetPDFFileName(p_bPrintStarted: Integer; out p_pwsFileName: PWideChar); safecall;
    procedure GetPDFFileName2(p_bPrintStarted: Integer; out p_pwsFileName: WideString); safecall;
    procedure SetPrinterOption(p_nOption: Integer; p_lValue: Integer); safecall;
    procedure RegisterEventWindow(p_hWnd: Integer); safecall;
    procedure UnRegisterEventWindow; safecall;
    procedure InitializeOLEUsage(const p_pwstrOLEProgID: WideString); safecall;
    procedure LicenseOLEServer; safecall;
    procedure LicenseShellExecuteFile(const p_pwstrFileName: WideString); safecall;
    procedure LicenseApplication(const p_pwstrAppName: WideString); safecall;
    procedure AddWatermarkImage(out p_pwsNewWatermarkId: PWideChar; out p_pwsNewLayoutId: PWideChar); safecall;
    procedure AddWatermarkImage2(out p_pwsNewWatermarkId: WideString; 
                                 out p_pwsNewLayoutId: WideString); safecall;
    procedure SetWatermarkImageOptionString(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                            p_wsValue: PWideChar); safecall;
    procedure SetWatermarkImageOptionString2(const p_pwsWatermarkId: WideString; 
                                             p_nOption: Integer; const p_wsValue: WideString); safecall;
    procedure SetWatermarkImageOptionLong(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                          p_nValue: Integer); safecall;
    procedure SetWatermarkImageOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           p_nValue: Integer); safecall;
    procedure SetWatermarkImageOptionBool(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                          p_bValue: Integer); safecall;
    procedure SetWatermarkImageOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           p_bValue: Integer); safecall;
    procedure SetWatermarkImageOptionFloat(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                           p_fValue: Single); safecall;
    procedure SetWatermarkImageOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            p_fValue: Single); safecall;
    procedure GetWatermarkImageCount(out p_pnCount: Integer); safecall;
    procedure GetWatermarkImage(p_nIndex: Integer; out p_pwsWatermarkId: PWideChar); safecall;
    procedure GetWatermarkImage2(p_nIndex: Integer; out p_pwsWatermarkId: WideString); safecall;
    procedure DeleteWatermarkImage(p_wsWatermarkId: PWideChar); safecall;
    procedure DeleteWatermarkImage2(const p_wsWatermarkId: WideString); safecall;
    procedure GetWatermarkImageOptionString(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                            out p_pwsValue: PWideChar); safecall;
    procedure GetWatermarkImageOptionString2(const p_pwsWatermarkId: WideString; 
                                             p_nOption: Integer; out p_pwsValue: WideString); safecall;
    procedure GetWatermarkImageOptionLong(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                          out p_pnValue: Integer); safecall;
    procedure GetWatermarkImageOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           out p_pnValue: Integer); safecall;
    procedure GetWatermarkImageOptionBool(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                          out p_pnValue: Integer); safecall;
    procedure GetWatermarkImageOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           out p_pnValue: Integer); safecall;
    procedure GetWatermarkImageOptionFloat(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                           out p_pnValue: Single); safecall;
    procedure GetWatermarkImageOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            out p_pnValue: Single); safecall;
    procedure SetLayoutOptionString(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                    p_nOption: Integer; p_wsValue: PWideChar); safecall;
    procedure SetLayoutOptionString2(const p_pwsObjectId: WideString; 
                                     const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                     const p_wsValue: WideString); safecall;
    procedure SetLayoutOptionLong(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                  p_nOption: Integer; p_nValue: Integer); safecall;
    procedure SetLayoutOptionLong2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   p_nValue: Integer); safecall;
    procedure SetLayoutOptionBool(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                  p_nOption: Integer; p_bValue: Integer); safecall;
    procedure SetLayoutOptionBool2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   p_bValue: Integer); safecall;
    procedure SetLayoutOptionFloat(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                   p_nOption: Integer; p_fValue: Single); safecall;
    procedure SetLayoutOptionFloat2(const p_pwsObjectId: WideString; 
                                    const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                    p_fValue: Single); safecall;
    procedure GetLayoutOptionString(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                    p_nOption: Integer; out p_pwsValue: PWideChar); safecall;
    procedure GetLayoutOptionString2(const p_pwsObjectId: WideString; 
                                     const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                     out p_pwsValue: WideString); safecall;
    procedure GetLayoutOptionLong(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                  p_nOption: Integer; out p_pnValue: Integer); safecall;
    procedure GetLayoutOptionLong2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   out p_pnValue: Integer); safecall;
    procedure GetLayoutOptionBool(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                  p_nOption: Integer; out p_pnValue: Integer); safecall;
    procedure GetLayoutOptionBool2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   out p_pnValue: Integer); safecall;
    procedure GetLayoutOptionFloat(p_pwsObjectId: PWideChar; p_pwsLayoutId: PWideChar; 
                                   p_nOption: Integer; out p_pnValue: Single); safecall;
    procedure GetLayoutOptionFloat2(const p_pwsObjectId: WideString; 
                                    const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                    out p_pnValue: Single); safecall;
    procedure GetLayoutCount(p_wsObjectId: PWideChar; out p_pnCount: Integer); safecall;
    procedure GetLayoutCount2(const p_wsObjectId: WideString; out p_pnCount: Integer); safecall;
    procedure GetLayout(p_pwsObjectId: PWideChar; p_nIndex: Integer; out p_pwsLayoutId: PWideChar); safecall;
    procedure GetLayout2(const p_pwsObjectId: WideString; p_nIndex: Integer; 
                         out p_pwsLayoutId: WideString); safecall;
    procedure DeleteLayout(p_pwsObjectId: PWideChar; p_wsLayoutId: PWideChar); safecall;
    procedure DeleteLayout2(const p_pwsObjectId: WideString; const p_wsLayoutId: WideString); safecall;
    procedure AddWatermarkText(out p_pwsNewWatermarkId: PWideChar; out p_pwsNewLayoutId: PWideChar); safecall;
    procedure AddWatermarkText2(out p_pwsNewWatermarkId: WideString; 
                                out p_pwsNewLayoutId: WideString); safecall;
    procedure SetWatermarkTextOptionString(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                           p_wsValue: PWideChar); safecall;
    procedure SetWatermarkTextOptionString2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            const p_wsValue: WideString); safecall;
    procedure SetWatermarkTextOptionLong(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                         p_nValue: Integer); safecall;
    procedure SetWatermarkTextOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          p_nValue: Integer); safecall;
    procedure SetWatermarkTextOptionBool(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                         p_bValue: Integer); safecall;
    procedure SetWatermarkTextOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          p_bValue: Integer); safecall;
    procedure SetWatermarkTextOptionFloat(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                          p_fValue: Single); safecall;
    procedure SetWatermarkTextOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           p_fValue: Single); safecall;
    procedure GetWatermarkTextCount(out p_pnCount: Integer); safecall;
    procedure GetWatermarkText(p_nIndex: Integer; out p_pwsWatermarkId: PWideChar); safecall;
    procedure GetWatermarkText2(p_nIndex: Integer; out p_pwsWatermarkId: WideString); safecall;
    procedure DeleteWatermarkText(p_wsWatermarkId: PWideChar); safecall;
    procedure DeleteWatermarkText2(const p_wsWatermarkId: WideString); safecall;
    procedure GetWatermarkTextOptionString(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                           out p_pwsValue: PWideChar); safecall;
    procedure GetWatermarkTextOptionString2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            out p_pwsValue: WideString); safecall;
    procedure GetWatermarkTextOptionLong(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                         out p_pnValue: Integer); safecall;
    procedure GetWatermarkTextOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          out p_pnValue: Integer); safecall;
    procedure GetWatermarkTextOptionBool(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                         out p_pnValue: Integer); safecall;
    procedure GetWatermarkTextOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          out p_pnValue: Integer); safecall;
    procedure GetWatermarkTextOptionFloat(p_pwsWatermarkId: PWideChar; p_nOption: Integer; 
                                          out p_pnValue: Single); safecall;
    procedure GetWatermarkTextOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           out p_pnValue: Single); safecall;
    procedure AddNovaPrinter(p_wsPrinterName: PWideChar; p_wsPortName: PWideChar; p_wsOEMID: PWideChar; 
                             p_wsServicePort: PWideChar; p_wsLicenseKey: PWideChar); safecall;
    procedure AddNovaPrinter2(const p_wsPrinterName: WideString; const p_wsPortName: WideString; const p_wsOEMID: WideString; 
                              const p_wsServicePort: WideString; const p_wsLicenseKey: WideString); safecall;
    procedure DeleteNovaPrinter(p_wsPrinterName: PWideChar); safecall;
    procedure DeleteNovaPrinter2(const p_wsPrinterName: WideString); safecall;
    procedure AddEmail(out p_pwsNewEmailId: PWideChar); safecall;
    procedure AddEmail2(out p_pwsNewEmailId: WideString); safecall;
    procedure SetEmailOptionString(p_pwsEmailId: PWideChar; p_nOption: Integer; p_wsValue: PWideChar); safecall;
    procedure SetEmailOptionString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                    const p_wsValue: WideString); safecall;
    procedure SetEmailOptionLong(p_pwsEmailId: PWideChar; p_nOption: Integer; p_nValue: Integer); safecall;
    procedure SetEmailOptionLong2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  p_nValue: Integer); safecall;
    procedure SetEmailOptionBool(p_pwsEmailId: PWideChar; p_nOption: Integer; p_bValue: Integer); safecall;
    procedure SetEmailOptionBool2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  p_bValue: Integer); safecall;
    procedure GetEmailCount(out p_pnCount: Integer); safecall;
    procedure GetEmail(p_nIndex: Integer; out p_pwsEmailId: PWideChar); safecall;
    procedure GetEmail2(p_nIndex: Integer; out p_pwsEmailId: WideString); safecall;
    procedure DeleteEmail(p_wsEmailId: PWideChar); safecall;
    procedure DeleteEmail2(const p_wsEmailId: WideString); safecall;
    procedure GetEmailOptionString(p_pwsEmailId: PWideChar; p_nOption: Integer; 
                                   out p_pwsValue: PWideChar); safecall;
    procedure GetEmailOptionString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                    out p_pwsValue: WideString); safecall;
    procedure GetEmailOptionLong(p_pwsEmailId: PWideChar; p_nOption: Integer; out p_pnValue: Integer); safecall;
    procedure GetEmailOptionLong2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  out p_pnValue: Integer); safecall;
    procedure GetEmailOptionBool(p_pwsEmailId: PWideChar; p_nOption: Integer; out p_pbValue: Integer); safecall;
    procedure GetEmailOptionBool2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  out p_pbValue: Integer); safecall;
    procedure AddEmailRecipient(p_pwsEmailId: PWideChar; out p_pwsNewRecipientId: PWideChar; 
                                p_pwsFrom: PWideChar; p_pwsTo: PWideChar; p_pwsCC: PWideChar; 
                                p_pwsBCC: PWideChar); safecall;
    procedure AddEmailRecipient2(const p_pwsEmailId: WideString; 
                                 out p_pwsNewRecipientId: WideString; const p_pwsFrom: WideString; 
                                 const p_pwsTo: WideString; const p_pwsCC: WideString; 
                                 const p_pwsBCC: WideString); safecall;
    procedure DeleteEmailRecipient(p_pwsEmailId: PWideChar; p_pwsRecipientId: PWideChar); safecall;
    procedure DeleteEmailRecipient2(const p_pwsEmailId: WideString; 
                                    const p_pwsRecipientId: WideString); safecall;
    procedure GetEmailRecipientCount(p_pwsEmailId: PWideChar; out p_pnCount: Integer); safecall;
    procedure GetEmailRecipientCount2(const p_pwsEmailId: WideString; out p_pnCount: Integer); safecall;
    procedure GetEmailRecipient(p_nIndex: Integer; p_pwsEmailId: PWideChar; 
                                out p_pwsRecipientId: PWideChar; out p_pwsFrom: PWideChar; 
                                out p_pwsTo: PWideChar; out p_pwsCC: PWideChar; 
                                out p_pwsBCC: PWideChar); safecall;
    procedure GetEmailRecipient2(p_nIndex: Integer; const p_pwsEmailId: WideString; 
                                 out p_pwsRecipientId: WideString; out p_pwsFrom: WideString; 
                                 out p_pwsTo: WideString; out p_pwsCC: WideString; 
                                 out p_pwsBCC: WideString); safecall;
    procedure SetEmailRecipient(p_pwsRecipientId: PWideChar; p_pwsFrom: PWideChar; 
                                p_pwsTo: PWideChar; p_pwsCC: PWideChar; 
                                p_pwsBCC: PWideChar); safecall;
    procedure SetEmailRecipient2(p_pwsRecipientId: WideString; p_pwsFrom: WideString; 
                                 p_pwsTo: WideString; p_pwsCC: WideString; 
                                 p_pwsBCC: WideString); safecall;
    procedure GetSignature(out p_pwsSignatureId: PWideChar; var p_pwsLayoutId: PWideChar); safecall;
    procedure GetSignature2(out p_pwsSignatureId: WideString; var p_pwsLayoutId: WideString); safecall;
    procedure GetOverlay(out p_pwsOverlayId: PWideChar; var p_pwsLayoutId: PWideChar); safecall;
    procedure GetOverlay2(out p_pwsOverlayId: WideString; var p_pwsLayoutId: WideString); safecall;
    procedure GetContentLayout(out p_pwsContentId: PWideChar; out p_pwsLayoutId: PWideChar); safecall;
    procedure GetContentLayout2(out p_pwsContentId: WideString; out p_pwsLayoutId: WideString); safecall;
    procedure SetOptionEncryptedString(p_nOption: Integer; p_wsValue: PWideChar); safecall;
    procedure SetOptionEncryptedString2(p_nOption: Integer; const p_wsValue: WideString); safecall;
    procedure GetOptionEncryptedString(p_nOption: Integer; out p_pwsValue: PWideChar); safecall;
    procedure GetOptionEncryptedString2(p_nOption: Integer; out p_pwsValue: WideString); safecall;
    procedure SetWatermarkImageOptionEncryptedString(p_pwsWatermarkId: PWideChar; 
                                                     p_nOption: Integer; p_wsValue: PWideChar); safecall;
    procedure SetWatermarkImageOptionEncryptedString2(const p_pwsWatermarkId: WideString; 
                                                      p_nOption: Integer; 
                                                      const p_wsValue: WideString); safecall;
    procedure GetWatermarkImageOptionEncryptedString(p_pwsWatermarkId: PWideChar; 
                                                     p_nOption: Integer; out p_pwsValue: PWideChar); safecall;
    procedure GetWatermarkImageOptionEncryptedString2(const p_pwsWatermarkId: WideString; 
                                                      p_nOption: Integer; out p_pwsValue: WideString); safecall;
    procedure SetEmailOptionEncryptedString(p_pwsEmailId: PWideChar; p_nOption: Integer; 
                                            p_wsValue: PWideChar); safecall;
    procedure SetEmailOptionEncryptedString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                             const p_wsValue: WideString); safecall;
    procedure GetEmailOptionEncryptedString(p_pwsEmailId: PWideChar; p_nOption: Integer; 
                                            out p_pwsValue: PWideChar); safecall;
    procedure GetEmailOptionEncryptedString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                             out p_pwsValue: WideString); safecall;
    procedure SetPrinterActivePublicProfile(p_wsPrinterName: PWideChar; p_wsProfileId: PWideChar); safecall;
    procedure SetPrinterActivePublicProfile2(const p_wsPrinterName: WideString; 
                                             const p_wsProfileId: WideString); safecall;
    procedure DeletePrinterActivePublicProfile(p_wsPrinterName: PWideChar); safecall;
    procedure DeletePrinterActivePublicProfile2(const p_wsPrinterName: WideString); safecall;
    procedure SetPrinterPublicProfile(p_wsPrinterName: PWideChar; p_wsProfileId: PWideChar; 
                                      p_bVisible: Integer); safecall;
    procedure SetPrinterPublicProfile2(const p_wsPrinterName: WideString; 
                                       const p_wsProfileId: WideString; p_bVisible: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  INovaPdfOptions80Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1988B197-ADAD-4195-A8C1-AB033F615287}
// *********************************************************************//
  INovaPdfOptions80Disp = dispinterface
    ['{1988B197-ADAD-4195-A8C1-AB033F615287}']
    procedure Initialize(p_wsPrinterName: {??PWideChar}OleVariant; 
                         p_wsLicenseKey: {??PWideChar}OleVariant); dispid 1;
    procedure Initialize2(const p_wsPrinterName: WideString; const p_wsLicenseKey: WideString); dispid 2;
    procedure InitializeSilent(p_wsPrinterName: {??PWideChar}OleVariant; 
                               p_wsLicenseKey: {??PWideChar}OleVariant); dispid 3;
    procedure InitializeSilent2(const p_wsPrinterName: WideString; const p_wsLicenseKey: WideString); dispid 4;
    procedure RegisterNovaEvent(p_wsEventName: {??PWideChar}OleVariant); dispid 5;
    procedure RegisterNovaEvent2(const p_wsEventName: WideString); dispid 6;
    procedure WaitForNovaEvent(p_nMilliseconds: Integer; out p_bTimeout: Integer); dispid 7;
    procedure SetOptionString(p_nOption: Integer; p_wsValue: {??PWideChar}OleVariant); dispid 8;
    procedure SetOptionString2(p_nOption: Integer; const p_wsValue: WideString); dispid 9;
    procedure GetOptionString(p_nOption: Integer; out p_pwsValue: {??PWideChar}OleVariant); dispid 10;
    procedure GetOptionString2(p_nOption: Integer; out p_pwsValue: WideString); dispid 11;
    procedure SetOptionLong(p_nOption: Integer; p_lValue: Integer); dispid 12;
    procedure GetOptionLong(p_nOption: Integer; out p_plValue: Integer); dispid 13;
    procedure SetOptionBool(p_nOption: Integer; p_bValue: Integer); dispid 14;
    procedure GetOptionBool(p_nOption: Integer; out p_pbValue: Integer); dispid 15;
    procedure LoadProfile(p_wsProfileId: {??PWideChar}OleVariant); dispid 16;
    procedure LoadProfile2(const p_wsProfileId: WideString); dispid 17;
    procedure SaveProfile; dispid 18;
    procedure AddProfile(p_wsProfileName: {??PWideChar}OleVariant; p_bPublicProfile: Integer; 
                         out p_pwsNewProfileId: {??PWideChar}OleVariant); dispid 19;
    procedure AddProfile2(const p_wsProfileName: WideString; p_bPublicProfile: Integer; 
                          out p_pwsNewProfileId: WideString); dispid 20;
    procedure CopyProfile(p_wsNewProfileName: {??PWideChar}OleVariant; p_bPublicProfile: Integer; 
                          p_wsOldProfileId: {??PWideChar}OleVariant; 
                          out p_pwsNewProfileId: {??PWideChar}OleVariant); dispid 21;
    procedure CopyProfile2(const p_wsNewProfileName: WideString; p_bPublicProfile: Integer; 
                           const p_wsOldProfileId: WideString; out p_pwsNewProfileId: WideString); dispid 22;
    procedure DeleteProfile(p_wsProfileId: {??PWideChar}OleVariant); dispid 23;
    procedure DeleteProfile2(const p_wsProfileId: WideString); dispid 24;
    procedure GetFirstProfile(out p_wsProfileId: {??PWideChar}OleVariant); dispid 25;
    procedure GetFirstProfile2(out p_wsProfileId: WideString); dispid 26;
    procedure GetNextProfile(out p_wsProfileId: {??PWideChar}OleVariant); dispid 27;
    procedure GetNextProfile2(out p_wsProfileId: WideString); dispid 28;
    procedure GetActiveProfile(out p_wsProfileId: {??PWideChar}OleVariant); dispid 29;
    procedure GetActiveProfile2(out p_wsProfileId: WideString); dispid 30;
    procedure SetActiveProfile(p_wsProfileId: {??PWideChar}OleVariant); dispid 31;
    procedure SetActiveProfile2(const p_wsProfileId: WideString); dispid 32;
    procedure GetFontOption(p_wsFontName: {??PWideChar}OleVariant; out p_pbAlwaysEmbed: Integer; 
                            out p_pbNeverEmbed: Integer); dispid 33;
    procedure GetFontOption2(const p_wsFontName: WideString; out p_pbAlwaysEmbed: Integer; 
                             out p_pbNeverEmbed: Integer); dispid 34;
    procedure SetFontOption(p_wsFontName: {??PWideChar}OleVariant; p_bAlwaysEmbed: Integer; 
                            p_bNeverEmbed: Integer); dispid 35;
    procedure SetFontOption2(const p_wsFontName: WideString; p_bAlwaysEmbed: Integer; 
                             p_bNeverEmbed: Integer); dispid 36;
    procedure ClearFontOptions; dispid 37;
    procedure AddBookmarkDefinition(p_nHeading: Smallint; p_bEnabled: Integer; p_bDetFont: Integer; 
                                    p_wsDetFont: {??PWideChar}OleVariant; p_nDetFontType: Integer; 
                                    p_bDetStyle: Integer; p_bDetBold: Integer; 
                                    p_bDetItalic: Integer; p_bDetSize: Integer; 
                                    p_nDetSizeVal: SYSINT; p_nDetSizePt: Single; 
                                    p_bDetColor: Integer; p_nDetColor: Integer; 
                                    p_bDispAsBold: Integer; p_bDispAsItalic: Integer; 
                                    p_nDispColor: Integer; out p_nDefinition: Smallint); dispid 38;
    procedure AddBookmarkDefinition2(p_nHeading: Smallint; p_bEnabled: Integer; 
                                     p_bDetFont: Integer; const p_wsDetFont: WideString; 
                                     p_nDetFontType: Integer; p_bDetStyle: Integer; 
                                     p_bDetBold: Integer; p_bDetItalic: Integer; 
                                     p_bDetSize: Integer; p_nDetSizeVal: SYSINT; 
                                     p_nDetSizePt: Single; p_bDetColor: Integer; 
                                     p_nDetColor: Integer; p_bDispAsBold: Integer; 
                                     p_bDispAsItalic: Integer; p_nDispColor: Integer; 
                                     out p_nDefinition: Smallint); dispid 39;
    procedure ModifyBookmarkDefinition(p_nDefinition: Smallint; p_nHeading: Smallint; 
                                       p_bEnabled: Integer; p_bDetFont: Integer; 
                                       p_wsDetFont: {??PWideChar}OleVariant; 
                                       p_nDetFontType: Integer; p_bDetStyle: Integer; 
                                       p_bDetBold: Integer; p_bDetItalic: Integer; 
                                       p_bDetSize: Integer; p_nDetSizeVal: SYSINT; 
                                       p_nDetSizePt: Single; p_bDetColor: Integer; 
                                       p_nDetColor: Integer; p_bDispAsBold: Integer; 
                                       p_bDispAsItalic: Integer; p_nDispColor: Integer); dispid 40;
    procedure ModifyBookmarkDefinition2(p_nDefinition: Smallint; p_nHeading: Smallint; 
                                        p_bEnabled: Integer; p_bDetFont: Integer; 
                                        const p_wsDetFont: WideString; p_nDetFontType: Integer; 
                                        p_bDetStyle: Integer; p_bDetBold: Integer; 
                                        p_bDetItalic: Integer; p_bDetSize: Integer; 
                                        p_nDetSizeVal: SYSINT; p_nDetSizePt: Single; 
                                        p_bDetColor: Integer; p_nDetColor: Integer; 
                                        p_bDispAsBold: Integer; p_bDispAsItalic: Integer; 
                                        p_nDispColor: Integer); dispid 41;
    procedure DeleteBookmarkDefinition(p_nDefinition: Smallint); dispid 42;
    procedure GetBookmarkDefinition(p_nDefinition: Smallint; out p_pnHeading: Smallint; 
                                    out p_pbEnabled: Integer; out p_pbDetFont: Integer; 
                                    out p_pwsDetFont: {??PWideChar}OleVariant; 
                                    out p_pnDetFontType: Integer; out p_pbDetStyle: Integer; 
                                    out p_pbDetBold: Integer; out p_pbDetItalic: Integer; 
                                    out p_pbDetSize: Integer; out p_pnDetSizeVal: SYSINT; 
                                    out p_pnDetSizePt: Single; out p_pbDetColor: Integer; 
                                    out p_pnDetColor: Integer; out p_pbDispAsBold: Integer; 
                                    out p_pbDispAsItalic: Integer; out p_pnDispColor: Integer); dispid 43;
    procedure GetBookmarkDefinition2(p_nDefinition: Smallint; out p_pnHeading: Smallint; 
                                     out p_pbEnabled: Integer; out p_pbDetFont: Integer; 
                                     out p_pwsDetFont: WideString; out p_pnDetFontType: Integer; 
                                     out p_pbDetStyle: Integer; out p_pbDetBold: Integer; 
                                     out p_pbDetItalic: Integer; out p_pbDetSize: Integer; 
                                     out p_pnDetSizeVal: SYSINT; out p_pnDetSizePt: Single; 
                                     out p_pbDetColor: Integer; out p_pnDetColor: Integer; 
                                     out p_pbDispAsBold: Integer; out p_pbDispAsItalic: Integer; 
                                     out p_pnDispColor: Integer); dispid 44;
    procedure GetBookmarkDefinitionCount(out p_nCount: Smallint); dispid 45;
    procedure SetDefaultPrinter; dispid 46;
    procedure RestoreDefaultPrinter; dispid 47;
    procedure GetPDFFileName(p_bPrintStarted: Integer; out p_pwsFileName: {??PWideChar}OleVariant); dispid 48;
    procedure GetPDFFileName2(p_bPrintStarted: Integer; out p_pwsFileName: WideString); dispid 49;
    procedure SetPrinterOption(p_nOption: Integer; p_lValue: Integer); dispid 50;
    procedure RegisterEventWindow(p_hWnd: Integer); dispid 51;
    procedure UnRegisterEventWindow; dispid 52;
    procedure InitializeOLEUsage(const p_pwstrOLEProgID: WideString); dispid 53;
    procedure LicenseOLEServer; dispid 54;
    procedure LicenseShellExecuteFile(const p_pwstrFileName: WideString); dispid 55;
    procedure LicenseApplication(const p_pwstrAppName: WideString); dispid 56;
    procedure AddWatermarkImage(out p_pwsNewWatermarkId: {??PWideChar}OleVariant; 
                                out p_pwsNewLayoutId: {??PWideChar}OleVariant); dispid 57;
    procedure AddWatermarkImage2(out p_pwsNewWatermarkId: WideString; 
                                 out p_pwsNewLayoutId: WideString); dispid 58;
    procedure SetWatermarkImageOptionString(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                            p_nOption: Integer; p_wsValue: {??PWideChar}OleVariant); dispid 59;
    procedure SetWatermarkImageOptionString2(const p_pwsWatermarkId: WideString; 
                                             p_nOption: Integer; const p_wsValue: WideString); dispid 60;
    procedure SetWatermarkImageOptionLong(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                          p_nOption: Integer; p_nValue: Integer); dispid 61;
    procedure SetWatermarkImageOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           p_nValue: Integer); dispid 62;
    procedure SetWatermarkImageOptionBool(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                          p_nOption: Integer; p_bValue: Integer); dispid 63;
    procedure SetWatermarkImageOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           p_bValue: Integer); dispid 64;
    procedure SetWatermarkImageOptionFloat(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                           p_nOption: Integer; p_fValue: Single); dispid 65;
    procedure SetWatermarkImageOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            p_fValue: Single); dispid 66;
    procedure GetWatermarkImageCount(out p_pnCount: Integer); dispid 67;
    procedure GetWatermarkImage(p_nIndex: Integer; out p_pwsWatermarkId: {??PWideChar}OleVariant); dispid 68;
    procedure GetWatermarkImage2(p_nIndex: Integer; out p_pwsWatermarkId: WideString); dispid 69;
    procedure DeleteWatermarkImage(p_wsWatermarkId: {??PWideChar}OleVariant); dispid 70;
    procedure DeleteWatermarkImage2(const p_wsWatermarkId: WideString); dispid 71;
    procedure GetWatermarkImageOptionString(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                            p_nOption: Integer; 
                                            out p_pwsValue: {??PWideChar}OleVariant); dispid 72;
    procedure GetWatermarkImageOptionString2(const p_pwsWatermarkId: WideString; 
                                             p_nOption: Integer; out p_pwsValue: WideString); dispid 73;
    procedure GetWatermarkImageOptionLong(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                          p_nOption: Integer; out p_pnValue: Integer); dispid 74;
    procedure GetWatermarkImageOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           out p_pnValue: Integer); dispid 75;
    procedure GetWatermarkImageOptionBool(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                          p_nOption: Integer; out p_pnValue: Integer); dispid 76;
    procedure GetWatermarkImageOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           out p_pnValue: Integer); dispid 77;
    procedure GetWatermarkImageOptionFloat(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                           p_nOption: Integer; out p_pnValue: Single); dispid 78;
    procedure GetWatermarkImageOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            out p_pnValue: Single); dispid 79;
    procedure SetLayoutOptionString(p_pwsObjectId: {??PWideChar}OleVariant; 
                                    p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                    p_wsValue: {??PWideChar}OleVariant); dispid 80;
    procedure SetLayoutOptionString2(const p_pwsObjectId: WideString; 
                                     const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                     const p_wsValue: WideString); dispid 81;
    procedure SetLayoutOptionLong(p_pwsObjectId: {??PWideChar}OleVariant; 
                                  p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                  p_nValue: Integer); dispid 82;
    procedure SetLayoutOptionLong2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   p_nValue: Integer); dispid 83;
    procedure SetLayoutOptionBool(p_pwsObjectId: {??PWideChar}OleVariant; 
                                  p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                  p_bValue: Integer); dispid 84;
    procedure SetLayoutOptionBool2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   p_bValue: Integer); dispid 85;
    procedure SetLayoutOptionFloat(p_pwsObjectId: {??PWideChar}OleVariant; 
                                   p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                   p_fValue: Single); dispid 86;
    procedure SetLayoutOptionFloat2(const p_pwsObjectId: WideString; 
                                    const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                    p_fValue: Single); dispid 87;
    procedure GetLayoutOptionString(p_pwsObjectId: {??PWideChar}OleVariant; 
                                    p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                    out p_pwsValue: {??PWideChar}OleVariant); dispid 88;
    procedure GetLayoutOptionString2(const p_pwsObjectId: WideString; 
                                     const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                     out p_pwsValue: WideString); dispid 89;
    procedure GetLayoutOptionLong(p_pwsObjectId: {??PWideChar}OleVariant; 
                                  p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                  out p_pnValue: Integer); dispid 90;
    procedure GetLayoutOptionLong2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   out p_pnValue: Integer); dispid 91;
    procedure GetLayoutOptionBool(p_pwsObjectId: {??PWideChar}OleVariant; 
                                  p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                  out p_pnValue: Integer); dispid 92;
    procedure GetLayoutOptionBool2(const p_pwsObjectId: WideString; 
                                   const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                   out p_pnValue: Integer); dispid 93;
    procedure GetLayoutOptionFloat(p_pwsObjectId: {??PWideChar}OleVariant; 
                                   p_pwsLayoutId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                   out p_pnValue: Single); dispid 94;
    procedure GetLayoutOptionFloat2(const p_pwsObjectId: WideString; 
                                    const p_pwsLayoutId: WideString; p_nOption: Integer; 
                                    out p_pnValue: Single); dispid 95;
    procedure GetLayoutCount(p_wsObjectId: {??PWideChar}OleVariant; out p_pnCount: Integer); dispid 96;
    procedure GetLayoutCount2(const p_wsObjectId: WideString; out p_pnCount: Integer); dispid 97;
    procedure GetLayout(p_pwsObjectId: {??PWideChar}OleVariant; p_nIndex: Integer; 
                        out p_pwsLayoutId: {??PWideChar}OleVariant); dispid 98;
    procedure GetLayout2(const p_pwsObjectId: WideString; p_nIndex: Integer; 
                         out p_pwsLayoutId: WideString); dispid 99;
    procedure DeleteLayout(p_pwsObjectId: {??PWideChar}OleVariant; 
                           p_wsLayoutId: {??PWideChar}OleVariant); dispid 100;
    procedure DeleteLayout2(const p_pwsObjectId: WideString; const p_wsLayoutId: WideString); dispid 101;
    procedure AddWatermarkText(out p_pwsNewWatermarkId: {??PWideChar}OleVariant; 
                               out p_pwsNewLayoutId: {??PWideChar}OleVariant); dispid 102;
    procedure AddWatermarkText2(out p_pwsNewWatermarkId: WideString; 
                                out p_pwsNewLayoutId: WideString); dispid 103;
    procedure SetWatermarkTextOptionString(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                           p_nOption: Integer; p_wsValue: {??PWideChar}OleVariant); dispid 104;
    procedure SetWatermarkTextOptionString2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            const p_wsValue: WideString); dispid 105;
    procedure SetWatermarkTextOptionLong(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                         p_nOption: Integer; p_nValue: Integer); dispid 106;
    procedure SetWatermarkTextOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          p_nValue: Integer); dispid 107;
    procedure SetWatermarkTextOptionBool(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                         p_nOption: Integer; p_bValue: Integer); dispid 108;
    procedure SetWatermarkTextOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          p_bValue: Integer); dispid 109;
    procedure SetWatermarkTextOptionFloat(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                          p_nOption: Integer; p_fValue: Single); dispid 110;
    procedure SetWatermarkTextOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           p_fValue: Single); dispid 111;
    procedure GetWatermarkTextCount(out p_pnCount: Integer); dispid 112;
    procedure GetWatermarkText(p_nIndex: Integer; out p_pwsWatermarkId: {??PWideChar}OleVariant); dispid 113;
    procedure GetWatermarkText2(p_nIndex: Integer; out p_pwsWatermarkId: WideString); dispid 114;
    procedure DeleteWatermarkText(p_wsWatermarkId: {??PWideChar}OleVariant); dispid 115;
    procedure DeleteWatermarkText2(const p_wsWatermarkId: WideString); dispid 116;
    procedure GetWatermarkTextOptionString(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                           p_nOption: Integer; 
                                           out p_pwsValue: {??PWideChar}OleVariant); dispid 117;
    procedure GetWatermarkTextOptionString2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                            out p_pwsValue: WideString); dispid 118;
    procedure GetWatermarkTextOptionLong(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                         p_nOption: Integer; out p_pnValue: Integer); dispid 119;
    procedure GetWatermarkTextOptionLong2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          out p_pnValue: Integer); dispid 120;
    procedure GetWatermarkTextOptionBool(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                         p_nOption: Integer; out p_pnValue: Integer); dispid 121;
    procedure GetWatermarkTextOptionBool2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                          out p_pnValue: Integer); dispid 122;
    procedure GetWatermarkTextOptionFloat(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                          p_nOption: Integer; out p_pnValue: Single); dispid 123;
    procedure GetWatermarkTextOptionFloat2(const p_pwsWatermarkId: WideString; p_nOption: Integer; 
                                           out p_pnValue: Single); dispid 124;
    procedure AddNovaPrinter(p_wsPrinterName: {??PWideChar}OleVariant; 
                             p_wsPortName: {??PWideChar}OleVariant; 
                             p_wsOEMID: {??PWideChar}OleVariant; 
                             p_wsServicePort: {??PWideChar}OleVariant; 
                             p_wsLicenseKey: {??PWideChar}OleVariant); dispid 125;
    procedure AddNovaPrinter2(const p_wsPrinterName: WideString; const p_wsPortName: WideString; const p_wsOEMID: WideString; 
                              const p_wsServicePort: WideString; const p_wsLicenseKey: WideString); dispid 126;
    procedure DeleteNovaPrinter(p_wsPrinterName: {??PWideChar}OleVariant); dispid 127;
    procedure DeleteNovaPrinter2(const p_wsPrinterName: WideString); dispid 128;
    procedure AddEmail(out p_pwsNewEmailId: {??PWideChar}OleVariant); dispid 129;
    procedure AddEmail2(out p_pwsNewEmailId: WideString); dispid 130;
    procedure SetEmailOptionString(p_pwsEmailId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                   p_wsValue: {??PWideChar}OleVariant); dispid 131;
    procedure SetEmailOptionString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                    const p_wsValue: WideString); dispid 132;
    procedure SetEmailOptionLong(p_pwsEmailId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                 p_nValue: Integer); dispid 133;
    procedure SetEmailOptionLong2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  p_nValue: Integer); dispid 134;
    procedure SetEmailOptionBool(p_pwsEmailId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                 p_bValue: Integer); dispid 135;
    procedure SetEmailOptionBool2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  p_bValue: Integer); dispid 136;
    procedure GetEmailCount(out p_pnCount: Integer); dispid 137;
    procedure GetEmail(p_nIndex: Integer; out p_pwsEmailId: {??PWideChar}OleVariant); dispid 138;
    procedure GetEmail2(p_nIndex: Integer; out p_pwsEmailId: WideString); dispid 139;
    procedure DeleteEmail(p_wsEmailId: {??PWideChar}OleVariant); dispid 140;
    procedure DeleteEmail2(const p_wsEmailId: WideString); dispid 141;
    procedure GetEmailOptionString(p_pwsEmailId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                   out p_pwsValue: {??PWideChar}OleVariant); dispid 142;
    procedure GetEmailOptionString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                    out p_pwsValue: WideString); dispid 143;
    procedure GetEmailOptionLong(p_pwsEmailId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                 out p_pnValue: Integer); dispid 144;
    procedure GetEmailOptionLong2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  out p_pnValue: Integer); dispid 145;
    procedure GetEmailOptionBool(p_pwsEmailId: {??PWideChar}OleVariant; p_nOption: Integer; 
                                 out p_pbValue: Integer); dispid 146;
    procedure GetEmailOptionBool2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                  out p_pbValue: Integer); dispid 147;
    procedure AddEmailRecipient(p_pwsEmailId: {??PWideChar}OleVariant; 
                                out p_pwsNewRecipientId: {??PWideChar}OleVariant; 
                                p_pwsFrom: {??PWideChar}OleVariant; 
                                p_pwsTo: {??PWideChar}OleVariant; p_pwsCC: {??PWideChar}OleVariant; 
                                p_pwsBCC: {??PWideChar}OleVariant); dispid 148;
    procedure AddEmailRecipient2(const p_pwsEmailId: WideString; 
                                 out p_pwsNewRecipientId: WideString; const p_pwsFrom: WideString; 
                                 const p_pwsTo: WideString; const p_pwsCC: WideString; 
                                 const p_pwsBCC: WideString); dispid 149;
    procedure DeleteEmailRecipient(p_pwsEmailId: {??PWideChar}OleVariant; 
                                   p_pwsRecipientId: {??PWideChar}OleVariant); dispid 150;
    procedure DeleteEmailRecipient2(const p_pwsEmailId: WideString; 
                                    const p_pwsRecipientId: WideString); dispid 151;
    procedure GetEmailRecipientCount(p_pwsEmailId: {??PWideChar}OleVariant; out p_pnCount: Integer); dispid 152;
    procedure GetEmailRecipientCount2(const p_pwsEmailId: WideString; out p_pnCount: Integer); dispid 153;
    procedure GetEmailRecipient(p_nIndex: Integer; p_pwsEmailId: {??PWideChar}OleVariant; 
                                out p_pwsRecipientId: {??PWideChar}OleVariant; 
                                out p_pwsFrom: {??PWideChar}OleVariant; 
                                out p_pwsTo: {??PWideChar}OleVariant; 
                                out p_pwsCC: {??PWideChar}OleVariant; 
                                out p_pwsBCC: {??PWideChar}OleVariant); dispid 154;
    procedure GetEmailRecipient2(p_nIndex: Integer; const p_pwsEmailId: WideString; 
                                 out p_pwsRecipientId: WideString; out p_pwsFrom: WideString; 
                                 out p_pwsTo: WideString; out p_pwsCC: WideString; 
                                 out p_pwsBCC: WideString); dispid 155;
    procedure SetEmailRecipient(p_pwsRecipientId: {??PWideChar}OleVariant; p_pwsFrom: {??PWideChar}OleVariant;
                                p_pwsTo: {??PWideChar}OleVariant; p_pwsCC: {??PWideChar}OleVariant;
                                p_pwsBCC: {??PWideChar}OleVariant); dispid 156;
    procedure SetEmailRecipient2(p_pwsRecipientId: WideString; p_pwsFrom: WideString; 
                                 p_pwsTo: WideString; p_pwsCC: WideString; 
                                 p_pwsBCC: WideString); dispid 157;
    procedure GetSignature(out p_pwsSignatureId: {??PWideChar}OleVariant; 
                           var p_pwsLayoutId: {??PWideChar}OleVariant); dispid 158;
    procedure GetSignature2(out p_pwsSignatureId: WideString; var p_pwsLayoutId: WideString); dispid 159;
    procedure GetOverlay(out p_pwsOverlayId: {??PWideChar}OleVariant; 
                         var p_pwsLayoutId: {??PWideChar}OleVariant); dispid 160;
    procedure GetOverlay2(out p_pwsOverlayId: WideString; var p_pwsLayoutId: WideString); dispid 161;
    procedure GetContentLayout(out p_pwsContentId: {??PWideChar}OleVariant; 
                               out p_pwsLayoutId: {??PWideChar}OleVariant); dispid 162;
    procedure GetContentLayout2(out p_pwsContentId: WideString; out p_pwsLayoutId: WideString); dispid 163;
    procedure SetOptionEncryptedString(p_nOption: Integer; p_wsValue: {??PWideChar}OleVariant); dispid 164;
    procedure SetOptionEncryptedString2(p_nOption: Integer; const p_wsValue: WideString); dispid 165;
    procedure GetOptionEncryptedString(p_nOption: Integer; out p_pwsValue: {??PWideChar}OleVariant); dispid 166;
    procedure GetOptionEncryptedString2(p_nOption: Integer; out p_pwsValue: WideString); dispid 167;
    procedure SetWatermarkImageOptionEncryptedString(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                                     p_nOption: Integer; 
                                                     p_wsValue: {??PWideChar}OleVariant); dispid 168;
    procedure SetWatermarkImageOptionEncryptedString2(const p_pwsWatermarkId: WideString; 
                                                      p_nOption: Integer; 
                                                      const p_wsValue: WideString); dispid 169;
    procedure GetWatermarkImageOptionEncryptedString(p_pwsWatermarkId: {??PWideChar}OleVariant; 
                                                     p_nOption: Integer; 
                                                     out p_pwsValue: {??PWideChar}OleVariant); dispid 170;
    procedure GetWatermarkImageOptionEncryptedString2(const p_pwsWatermarkId: WideString; 
                                                      p_nOption: Integer; out p_pwsValue: WideString); dispid 171;
    procedure SetEmailOptionEncryptedString(p_pwsEmailId: {??PWideChar}OleVariant; 
                                            p_nOption: Integer; p_wsValue: {??PWideChar}OleVariant); dispid 172;
    procedure SetEmailOptionEncryptedString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                             const p_wsValue: WideString); dispid 173;
    procedure GetEmailOptionEncryptedString(p_pwsEmailId: {??PWideChar}OleVariant; 
                                            p_nOption: Integer; 
                                            out p_pwsValue: {??PWideChar}OleVariant); dispid 174;
    procedure GetEmailOptionEncryptedString2(const p_pwsEmailId: WideString; p_nOption: Integer; 
                                             out p_pwsValue: WideString); dispid 175;
    procedure SetPrinterActivePublicProfile(p_wsPrinterName: {??PWideChar}OleVariant; 
                                            p_wsProfileId: {??PWideChar}OleVariant); dispid 176;
    procedure SetPrinterActivePublicProfile2(const p_wsPrinterName: WideString; 
                                             const p_wsProfileId: WideString); dispid 177;
    procedure DeletePrinterActivePublicProfile(p_wsPrinterName: {??PWideChar}OleVariant); dispid 178;
    procedure DeletePrinterActivePublicProfile2(const p_wsPrinterName: WideString); dispid 179;
    procedure SetPrinterPublicProfile(p_wsPrinterName: {??PWideChar}OleVariant; 
                                      p_wsProfileId: {??PWideChar}OleVariant; p_bVisible: Integer); dispid 180;
    procedure SetPrinterPublicProfile2(const p_wsPrinterName: WideString; 
                                       const p_wsProfileId: WideString; p_bVisible: Integer); dispid 181;
  end;

// *********************************************************************//
// The Class CoNovaPdfOptions80 provides a Create and CreateRemote method to          
// create instances of the default interface INovaPdfOptions80 exposed by              
// the CoClass NovaPdfOptions80. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNovaPdfOptions80 = class
    class function Create: INovaPdfOptions80;
    class function CreateRemote(const MachineName: string): INovaPdfOptions80;
  end;

implementation

uses ComObj;

class function CoNovaPdfOptions80.Create: INovaPdfOptions80;
begin
  Result := CreateComObject(CLASS_NovaPdfOptions80) as INovaPdfOptions80;
end;

class function CoNovaPdfOptions80.CreateRemote(const MachineName: string): INovaPdfOptions80;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NovaPdfOptions80) as INovaPdfOptions80;
end;

end.
