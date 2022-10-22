unit IQActive_TLB;

// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// PASTLWTR : $Revision:   1.11.1.75  $
// File generated on 02/08/2000 2:12:18 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\IQwin\iqactive\IQActive.tlb
// IID\LCID: {DBB91D74-DE58-11D3-99F4-00C0A8509ED6}\0
// Helpfile: 
// HelpString: IQActive Library
// Version:    1.0
// ************************************************************************ //

interface

uses
  Windows,
  ActiveX,
  Classes,
  Graphics,
  OleCtrls,
  StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_IQActive: TGUID = '{DBB91D74-DE58-11D3-99F4-00C0A8509ED6}';
  IID_IIQLMPrint: TGUID = '{DBB91D75-DE58-11D3-99F4-00C0A8509ED6}';
  CLASS_IQLMPrint: TGUID = '{DBB91D77-DE58-11D3-99F4-00C0A8509ED6}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IIQLMPrint = interface;
  IIQLMPrintDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  IQLMPrint = IIQLMPrint;


// *********************************************************************//
// Interface: IIQLMPrint
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBB91D75-DE58-11D3-99F4-00C0A8509ED6}
// *********************************************************************//
  IIQLMPrint = interface(IDispatch)
    ['{DBB91D75-DE58-11D3-99F4-00C0A8509ED6}']
    procedure Execute(const AClientName: WideString; const APath: WideString; 
                      const AFileName: WideString; const ALabelName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IIQLMPrintDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBB91D75-DE58-11D3-99F4-00C0A8509ED6}
// *********************************************************************//
  IIQLMPrintDisp = dispinterface
    ['{DBB91D75-DE58-11D3-99F4-00C0A8509ED6}']
    procedure Execute(const AClientName: WideString; const APath: WideString;
                      const AFileName: WideString; const ALabelName: WideString); dispid 1;
  end;

  CoIQLMPrint = class
    class function Create: IIQLMPrint;
    class function CreateRemote(const MachineName: string): IIQLMPrint;
  end;

implementation

uses
  ComObj;

class function CoIQLMPrint.Create: IIQLMPrint;
begin
  Result := CreateComObject(CLASS_IQLMPrint) as IIQLMPrint;
end;

class function CoIQLMPrint.CreateRemote(const MachineName: string): IIQLMPrint;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_IQLMPrint) as IIQLMPrint;
end;

end.
