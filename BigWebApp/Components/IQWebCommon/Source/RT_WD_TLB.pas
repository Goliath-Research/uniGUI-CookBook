unit RT_WD_TLB;

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

// PASTLWTR : 1.2
// File generated on 6/23/2010 7:52:56 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: c:\P4\iqwin\Rt_Wd\RT_WD.tlb (1)
// LIBID: {4A8386A1-A932-11D3-99E3-00C0A8509ED6}
// LCID: 0
// Helpfile: 
// HelpString: RT_WD Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  RT_WDMajorVersion = 1;
  RT_WDMinorVersion = 0;

  LIBID_RT_WD: TGUID = '{4A8386A1-A932-11D3-99E3-00C0A8509ED6}';

  IID_IRTServRestart: TGUID = '{4A8386A2-A932-11D3-99E3-00C0A8509ED6}';
  CLASS_RTServRestart: TGUID = '{4A8386A4-A932-11D3-99E3-00C0A8509ED6}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRTServRestart = interface;
  IRTServRestartDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RTServRestart = IRTServRestart;


// *********************************************************************//
// Interface: IRTServRestart
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4A8386A2-A932-11D3-99E3-00C0A8509ED6}
// *********************************************************************//
  IRTServRestart = interface(IDispatch)
    ['{4A8386A2-A932-11D3-99E3-00C0A8509ED6}']
    procedure Execute(Packet: OleVariant); safecall;
    procedure Notify(Packet: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRTServRestartDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4A8386A2-A932-11D3-99E3-00C0A8509ED6}
// *********************************************************************//
  IRTServRestartDisp = dispinterface
    ['{4A8386A2-A932-11D3-99E3-00C0A8509ED6}']
    procedure Execute(Packet: OleVariant); dispid 1;
    procedure Notify(Packet: OleVariant); dispid 2;
  end;

// *********************************************************************//
// The Class CoRTServRestart provides a Create and CreateRemote method to          
// create instances of the default interface IRTServRestart exposed by              
// the CoClass RTServRestart. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRTServRestart = class
    class function Create: IRTServRestart;
    class function CreateRemote(const MachineName: string): IRTServRestart;
  end;

implementation

uses ComObj;

class function CoRTServRestart.Create: IRTServRestart;
begin
  Result := CreateComObject(CLASS_RTServRestart) as IRTServRestart;
end;

class function CoRTServRestart.CreateRemote(const MachineName: string): IRTServRestart;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RTServRestart) as IRTServRestart;
end;

end.
