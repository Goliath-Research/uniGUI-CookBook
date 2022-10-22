unit IQMS_OpenOffice_TLB;

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

// $Rev: 34747 $
// File generated on 5/15/2013 4:15:09 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\P4\iqwin\IQMS.OpenOffice.tlb (1)
// LIBID: {2DEAB852-B7DE-45C5-B826-69CC75E61DB4}
// LCID: 0
// Helpfile: 
// HelpString: IQMS OpenOffice Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TOpenOfficeApplication) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTextDocument) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TColumnDefinition) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TColumnList) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOfficeDataRow) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOfficeDataSet) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TDatabase) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TDatabaseTable) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TSpreadsheet) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TSpreadsheetTable) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOpenOfficeTextDocument) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOpenOfficeSpreadsheet) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOpenOfficeSpreadsheetTable) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOpenOfficeDatabase) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TOpenOfficeDatabaseTable) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  IQMS_OpenOfficeMajorVersion = 1;
  IQMS_OpenOfficeMinorVersion = 0;

  LIBID_IQMS_OpenOffice: TGUID = '{2DEAB852-B7DE-45C5-B826-69CC75E61DB4}';

  IID__OpenOfficeApplication: TGUID = '{5B63676D-944C-3CDE-A694-57070B0D2661}';
  IID_IOpenOfficeTextDocument: TGUID = '{E8FA3144-51F9-4AF5-9E76-56A48F23C125}';
  CLASS_TextDocument: TGUID = '{33BF43C5-9263-46B7-8BF8-2EB29B06D6C4}';
  IID__ColumnDefinition: TGUID = '{DF854626-065C-32A6-A987-DE245B16A8EB}';
  IID__ColumnList: TGUID = '{2C108DE3-E91B-31EC-9872-9E5DFDC4AB5A}';
  IID__OfficeDataRow: TGUID = '{05934FAD-7F4D-3D58-B1B4-19029247BA15}';
  IID__OfficeDataSet: TGUID = '{FF7B45A1-F496-3F61-B72D-9864BAEAE9EF}';
  IID_IOpenOfficeDatabase: TGUID = '{E1E68614-FAE7-488D-9285-029E5693DF3A}';
  CLASS_Database: TGUID = '{99B7CA01-EE9D-48CB-ABFC-0754E0863EEF}';
  IID_IOpenOfficeDatabaseTable: TGUID = '{69182445-665E-45AE-846A-E404E19BF404}';
  CLASS_DatabaseTable: TGUID = '{8C62A4B1-F984-44C9-BD39-F6056E829EEF}';
  IID_IOpenOfficeSpreadsheet: TGUID = '{8ED0AE71-B229-4E2F-9FCA-9E5A45F9C9DC}';
  CLASS_Spreadsheet: TGUID = '{FAEF8462-A684-4FAC-96BA-15F44571EDB0}';
  IID_IOpenOfficeSpreadsheetTable: TGUID = '{5B3E6272-4A1D-40BC-866B-5F37E39110D8}';
  CLASS_SpreadsheetTable: TGUID = '{54B19FA5-A35B-4FE7-AB45-4C16C74777C5}';
  CLASS_OpenOfficeTextDocument: TGUID = '{7129310D-0006-4919-BE24-BD96E3CBB0A1}';
  CLASS_OpenOfficeSpreadsheet: TGUID = '{6F65DFF7-50F7-4C05-A84A-80B3C76BB2DF}';
  CLASS_OpenOfficeSpreadsheetTable: TGUID = '{335D1F79-3562-4DC8-9FB0-E6FD9E5C357E}';
  CLASS_OpenOfficeDatabase: TGUID = '{C9819BF6-153C-460C-8837-0027EB3E5AB0}';
  CLASS_OpenOfficeDatabaseTable: TGUID = '{83FA7938-BB5D-482C-8F4C-F3E3977824FE}';
  CLASS_OpenOfficeApplication: TGUID = '{5C87C78C-DB2F-3239-BB37-23B109FD8E88}';
  CLASS_ColumnDefinition: TGUID = '{4BE32C53-AE3F-38F9-9273-CE22274DE906}';
  CLASS_ColumnList: TGUID = '{C61B674B-BD11-3223-BF67-206B452BC943}';
  CLASS_OfficeDataRow: TGUID = '{E142B871-B6BB-3CAA-82C8-DE42BDBCE5B1}';
  CLASS_OfficeDataSet: TGUID = '{39755803-7B68-345C-8455-B67D6A33EF7F}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ParagraphStyle
type
  ParagraphStyle = TOleEnum;
const
  ParagraphStyle_Normal = $00000000;
  ParagraphStyle_BodyText = $00000001;
  ParagraphStyle_Heading1 = $00000002;
  ParagraphStyle_Heading2 = $00000003;
  ParagraphStyle_Heading3 = $00000004;

// Constants for enum ColumnDataType
type
  ColumnDataType = TOleEnum;
const
  ColumnDataType_Text = $00000000;
  ColumnDataType_Integer = $00000001;
  ColumnDataType_Float = $00000002;
  ColumnDataType_DateTime = $00000003;

// Constants for enum DocumentType
type
  DocumentType = TOleEnum;
const
  DocumentType_TextDocument = $00000000;
  DocumentType_Spreadsheet = $00000001;
  DocumentType_Database = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _OpenOfficeApplication = interface;
  _OpenOfficeApplicationDisp = dispinterface;
  IOpenOfficeTextDocument = interface;
  IOpenOfficeTextDocumentDisp = dispinterface;
  _ColumnDefinition = interface;
  _ColumnDefinitionDisp = dispinterface;
  _ColumnList = interface;
  _ColumnListDisp = dispinterface;
  _OfficeDataRow = interface;
  _OfficeDataRowDisp = dispinterface;
  _OfficeDataSet = interface;
  _OfficeDataSetDisp = dispinterface;
  IOpenOfficeDatabase = interface;
  IOpenOfficeDatabaseDisp = dispinterface;
  IOpenOfficeDatabaseTable = interface;
  IOpenOfficeDatabaseTableDisp = dispinterface;
  IOpenOfficeSpreadsheet = interface;
  IOpenOfficeSpreadsheetDisp = dispinterface;
  IOpenOfficeSpreadsheetTable = interface;
  IOpenOfficeSpreadsheetTableDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TextDocument = IOpenOfficeTextDocument;
  Database = IOpenOfficeDatabase;
  DatabaseTable = IOpenOfficeDatabaseTable;
  Spreadsheet = IOpenOfficeSpreadsheet;
  SpreadsheetTable = IOpenOfficeSpreadsheetTable;
  OpenOfficeTextDocument = IOpenOfficeTextDocument;
  OpenOfficeSpreadsheet = IOpenOfficeSpreadsheet;
  OpenOfficeSpreadsheetTable = IOpenOfficeSpreadsheetTable;
  OpenOfficeDatabase = IOpenOfficeDatabase;
  OpenOfficeDatabaseTable = IOpenOfficeDatabaseTable;
  OpenOfficeApplication = _OpenOfficeApplication;
  ColumnDefinition = _ColumnDefinition;
  ColumnList = _ColumnList;
  OfficeDataRow = _OfficeDataRow;
  OfficeDataSet = _OfficeDataSet;


// *********************************************************************//
// Interface: _OpenOfficeApplication
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5B63676D-944C-3CDE-A694-57070B0D2661}
// *********************************************************************//
  _OpenOfficeApplication = interface(IDispatch)
    ['{5B63676D-944C-3CDE-A694-57070B0D2661}']
  end;

// *********************************************************************//
// DispIntf:  _OpenOfficeApplicationDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5B63676D-944C-3CDE-A694-57070B0D2661}
// *********************************************************************//
  _OpenOfficeApplicationDisp = dispinterface
    ['{5B63676D-944C-3CDE-A694-57070B0D2661}']
  end;

// *********************************************************************//
// Interface: IOpenOfficeTextDocument
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E8FA3144-51F9-4AF5-9E76-56A48F23C125}
// *********************************************************************//
  IOpenOfficeTextDocument = interface(IDispatch)
    ['{E8FA3144-51F9-4AF5-9E76-56A48F23C125}']
    function FileExt: WideString; safecall;
    procedure AddText(style: ParagraphStyle; const text: WideString); safecall;
    procedure Clear; safecall;
    procedure Save; safecall;
    procedure SaveAs(const fileName: WideString); safecall;
    function IsSaved: WordBool; safecall;
    procedure Show; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOpenOfficeTextDocumentDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E8FA3144-51F9-4AF5-9E76-56A48F23C125}
// *********************************************************************//
  IOpenOfficeTextDocumentDisp = dispinterface
    ['{E8FA3144-51F9-4AF5-9E76-56A48F23C125}']
    function FileExt: WideString; dispid 1;
    procedure AddText(style: ParagraphStyle; const text: WideString); dispid 2;
    procedure Clear; dispid 3;
    procedure Save; dispid 4;
    procedure SaveAs(const fileName: WideString); dispid 5;
    function IsSaved: WordBool; dispid 6;
    procedure Show; dispid 7;
  end;

// *********************************************************************//
// Interface: _ColumnDefinition
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DF854626-065C-32A6-A987-DE245B16A8EB}
// *********************************************************************//
  _ColumnDefinition = interface(IDispatch)
    ['{DF854626-065C-32A6-A987-DE245B16A8EB}']
  end;

// *********************************************************************//
// DispIntf:  _ColumnDefinitionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DF854626-065C-32A6-A987-DE245B16A8EB}
// *********************************************************************//
  _ColumnDefinitionDisp = dispinterface
    ['{DF854626-065C-32A6-A987-DE245B16A8EB}']
  end;

// *********************************************************************//
// Interface: _ColumnList
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2C108DE3-E91B-31EC-9872-9E5DFDC4AB5A}
// *********************************************************************//
  _ColumnList = interface(IDispatch)
    ['{2C108DE3-E91B-31EC-9872-9E5DFDC4AB5A}']
  end;

// *********************************************************************//
// DispIntf:  _ColumnListDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2C108DE3-E91B-31EC-9872-9E5DFDC4AB5A}
// *********************************************************************//
  _ColumnListDisp = dispinterface
    ['{2C108DE3-E91B-31EC-9872-9E5DFDC4AB5A}']
  end;

// *********************************************************************//
// Interface: _OfficeDataRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {05934FAD-7F4D-3D58-B1B4-19029247BA15}
// *********************************************************************//
  _OfficeDataRow = interface(IDispatch)
    ['{05934FAD-7F4D-3D58-B1B4-19029247BA15}']
  end;

// *********************************************************************//
// DispIntf:  _OfficeDataRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {05934FAD-7F4D-3D58-B1B4-19029247BA15}
// *********************************************************************//
  _OfficeDataRowDisp = dispinterface
    ['{05934FAD-7F4D-3D58-B1B4-19029247BA15}']
  end;

// *********************************************************************//
// Interface: _OfficeDataSet
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FF7B45A1-F496-3F61-B72D-9864BAEAE9EF}
// *********************************************************************//
  _OfficeDataSet = interface(IDispatch)
    ['{FF7B45A1-F496-3F61-B72D-9864BAEAE9EF}']
  end;

// *********************************************************************//
// DispIntf:  _OfficeDataSetDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FF7B45A1-F496-3F61-B72D-9864BAEAE9EF}
// *********************************************************************//
  _OfficeDataSetDisp = dispinterface
    ['{FF7B45A1-F496-3F61-B72D-9864BAEAE9EF}']
  end;

// *********************************************************************//
// Interface: IOpenOfficeDatabase
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E1E68614-FAE7-488D-9285-029E5693DF3A}
// *********************************************************************//
  IOpenOfficeDatabase = interface(IDispatch)
    ['{E1E68614-FAE7-488D-9285-029E5693DF3A}']
    function AddTable(const name: WideString): IOpenOfficeDatabaseTable; safecall;
    function AddTable_2: IOpenOfficeDatabaseTable; safecall;
    procedure Save; safecall;
    procedure SaveAs(const fileName: WideString); safecall;
    function IsSaved: WordBool; safecall;
    procedure Show; safecall;
    function ColumnCount(const tableName: WideString): Integer; safecall;
    function RecordCount(const tableName: WideString): Integer; safecall;
    function FileExt: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOpenOfficeDatabaseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E1E68614-FAE7-488D-9285-029E5693DF3A}
// *********************************************************************//
  IOpenOfficeDatabaseDisp = dispinterface
    ['{E1E68614-FAE7-488D-9285-029E5693DF3A}']
    function AddTable(const name: WideString): IOpenOfficeDatabaseTable; dispid 1;
    function AddTable_2: IOpenOfficeDatabaseTable; dispid 1610743809;
    procedure Save; dispid 1610743810;
    procedure SaveAs(const fileName: WideString); dispid 3;
    function IsSaved: WordBool; dispid 4;
    procedure Show; dispid 5;
    function ColumnCount(const tableName: WideString): Integer; dispid 6;
    function RecordCount(const tableName: WideString): Integer; dispid 7;
    function FileExt: WideString; dispid 8;
  end;

// *********************************************************************//
// Interface: IOpenOfficeDatabaseTable
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {69182445-665E-45AE-846A-E404E19BF404}
// *********************************************************************//
  IOpenOfficeDatabaseTable = interface(IDispatch)
    ['{69182445-665E-45AE-846A-E404E19BF404}']
    procedure ClearXMLText; safecall;
    function DefinitionXMLText: WideString; safecall;
    function GetTableName: WideString; safecall;
    procedure SetTableName(const name: WideString); safecall;
    function ActiveDataSet: _OfficeDataSet; safecall;
    procedure Insert; safecall;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool); safecall;
    procedure SetColumnValue(const columnName: WideString; value: OleVariant); safecall;
    function GetColumnCount: Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOpenOfficeDatabaseTableDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {69182445-665E-45AE-846A-E404E19BF404}
// *********************************************************************//
  IOpenOfficeDatabaseTableDisp = dispinterface
    ['{69182445-665E-45AE-846A-E404E19BF404}']
    procedure ClearXMLText; dispid 1;
    function DefinitionXMLText: WideString; dispid 2;
    function GetTableName: WideString; dispid 3;
    procedure SetTableName(const name: WideString); dispid 4;
    function ActiveDataSet: _OfficeDataSet; dispid 5;
    procedure Insert; dispid 6;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool); dispid 7;
    procedure SetColumnValue(const columnName: WideString; value: OleVariant); dispid 8;
    function GetColumnCount: Integer; dispid 9;
  end;

// *********************************************************************//
// Interface: IOpenOfficeSpreadsheet
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8ED0AE71-B229-4E2F-9FCA-9E5A45F9C9DC}
// *********************************************************************//
  IOpenOfficeSpreadsheet = interface(IDispatch)
    ['{8ED0AE71-B229-4E2F-9FCA-9E5A45F9C9DC}']
    function AddSheet(const name: WideString; isDefault: WordBool): IOpenOfficeSpreadsheetTable; safecall;
    procedure Save; safecall;
    procedure SaveAs(const fileName: WideString); safecall;
    function IsSaved: WordBool; safecall;
    procedure Show; safecall;
    function ColumnCount(const sheetName: WideString): Integer; safecall;
    function RowCount(const sheetName: WideString): Integer; safecall;
    function FileExt: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOpenOfficeSpreadsheetDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8ED0AE71-B229-4E2F-9FCA-9E5A45F9C9DC}
// *********************************************************************//
  IOpenOfficeSpreadsheetDisp = dispinterface
    ['{8ED0AE71-B229-4E2F-9FCA-9E5A45F9C9DC}']
    function AddSheet(const name: WideString; isDefault: WordBool): IOpenOfficeSpreadsheetTable; dispid 1;
    procedure Save; dispid 2;
    procedure SaveAs(const fileName: WideString); dispid 3;
    function IsSaved: WordBool; dispid 4;
    procedure Show; dispid 5;
    function ColumnCount(const sheetName: WideString): Integer; dispid 6;
    function RowCount(const sheetName: WideString): Integer; dispid 7;
    function FileExt: WideString; dispid 8;
  end;

// *********************************************************************//
// Interface: IOpenOfficeSpreadsheetTable
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B3E6272-4A1D-40BC-866B-5F37E39110D8}
// *********************************************************************//
  IOpenOfficeSpreadsheetTable = interface(IDispatch)
    ['{5B3E6272-4A1D-40BC-866B-5F37E39110D8}']
    function GetSheetName: WideString; safecall;
    procedure SetSheetName(const value: WideString); safecall;
    function GetIsDefaultSheet: WordBool; safecall;
    procedure SetIsDefaultSheet(value: WordBool); safecall;
    procedure ClearXMLText; safecall;
    function XMLText: WideString; safecall;
    procedure Insert; safecall;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool); safecall;
    procedure SetColumnValue(const columnName: WideString; value: OleVariant); safecall;
    function GetColumnCount: Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IOpenOfficeSpreadsheetTableDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B3E6272-4A1D-40BC-866B-5F37E39110D8}
// *********************************************************************//
  IOpenOfficeSpreadsheetTableDisp = dispinterface
    ['{5B3E6272-4A1D-40BC-866B-5F37E39110D8}']
    function GetSheetName: WideString; dispid 1;
    procedure SetSheetName(const value: WideString); dispid 2;
    function GetIsDefaultSheet: WordBool; dispid 3;
    procedure SetIsDefaultSheet(value: WordBool); dispid 4;
    procedure ClearXMLText; dispid 5;
    function XMLText: WideString; dispid 6;
    procedure Insert; dispid 7;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool); dispid 8;
    procedure SetColumnValue(const columnName: WideString; value: OleVariant); dispid 9;
    function GetColumnCount: Integer; dispid 10;
  end;

// *********************************************************************//
// The Class CoTextDocument provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeTextDocument exposed by              
// the CoClass TextDocument. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTextDocument = class
    class function Create: IOpenOfficeTextDocument;
    class function CreateRemote(const MachineName: string): IOpenOfficeTextDocument;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTextDocument
// Help String      : 
// Default Interface: IOpenOfficeTextDocument
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTextDocumentProperties= class;
{$ENDIF}
  TTextDocument = class(TOleServer)
  private
    FIntf: IOpenOfficeTextDocument;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTextDocumentProperties;
    function GetServerProperties: TTextDocumentProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeTextDocument;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeTextDocument);
    procedure Disconnect; override;
    function FileExt: WideString;
    procedure AddText(style: ParagraphStyle; const text: WideString);
    procedure Clear;
    procedure Save;
    procedure SaveAs(const fileName: WideString);
    function IsSaved: WordBool;
    procedure Show;
    property DefaultInterface: IOpenOfficeTextDocument read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTextDocumentProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTextDocument
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTextDocumentProperties = class(TPersistent)
  private
    FServer:    TTextDocument;
    function    GetDefaultInterface: IOpenOfficeTextDocument;
    constructor Create(AServer: TTextDocument);
  protected
  public
    property DefaultInterface: IOpenOfficeTextDocument read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDatabase provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeDatabase exposed by              
// the CoClass Database. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatabase = class
    class function Create: IOpenOfficeDatabase;
    class function CreateRemote(const MachineName: string): IOpenOfficeDatabase;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDatabase
// Help String      : 
// Default Interface: IOpenOfficeDatabase
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDatabaseProperties= class;
{$ENDIF}
  TDatabase = class(TOleServer)
  private
    FIntf: IOpenOfficeDatabase;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TDatabaseProperties;
    function GetServerProperties: TDatabaseProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeDatabase;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeDatabase);
    procedure Disconnect; override;
    function AddTable(const name: WideString): IOpenOfficeDatabaseTable;
    function AddTable_2: IOpenOfficeDatabaseTable;
    procedure Save;
    procedure SaveAs(const fileName: WideString);
    function IsSaved: WordBool;
    procedure Show;
    function ColumnCount(const tableName: WideString): Integer;
    function RecordCount(const tableName: WideString): Integer;
    function FileExt: WideString;
    property DefaultInterface: IOpenOfficeDatabase read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDatabaseProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDatabase
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDatabaseProperties = class(TPersistent)
  private
    FServer:    TDatabase;
    function    GetDefaultInterface: IOpenOfficeDatabase;
    constructor Create(AServer: TDatabase);
  protected
  public
    property DefaultInterface: IOpenOfficeDatabase read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDatabaseTable provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeDatabaseTable exposed by              
// the CoClass DatabaseTable. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatabaseTable = class
    class function Create: IOpenOfficeDatabaseTable;
    class function CreateRemote(const MachineName: string): IOpenOfficeDatabaseTable;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDatabaseTable
// Help String      : 
// Default Interface: IOpenOfficeDatabaseTable
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDatabaseTableProperties= class;
{$ENDIF}
  TDatabaseTable = class(TOleServer)
  private
    FIntf: IOpenOfficeDatabaseTable;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TDatabaseTableProperties;
    function GetServerProperties: TDatabaseTableProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeDatabaseTable;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeDatabaseTable);
    procedure Disconnect; override;
    procedure ClearXMLText;
    function DefinitionXMLText: WideString;
    function GetTableName: WideString;
    procedure SetTableName(const name: WideString);
    function ActiveDataSet: _OfficeDataSet;
    procedure Insert;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool);
    procedure SetColumnValue(const columnName: WideString; value: OleVariant);
    function GetColumnCount: Integer;
    property DefaultInterface: IOpenOfficeDatabaseTable read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDatabaseTableProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDatabaseTable
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDatabaseTableProperties = class(TPersistent)
  private
    FServer:    TDatabaseTable;
    function    GetDefaultInterface: IOpenOfficeDatabaseTable;
    constructor Create(AServer: TDatabaseTable);
  protected
  public
    property DefaultInterface: IOpenOfficeDatabaseTable read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSpreadsheet provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeSpreadsheet exposed by              
// the CoClass Spreadsheet. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSpreadsheet = class
    class function Create: IOpenOfficeSpreadsheet;
    class function CreateRemote(const MachineName: string): IOpenOfficeSpreadsheet;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSpreadsheet
// Help String      : 
// Default Interface: IOpenOfficeSpreadsheet
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSpreadsheetProperties= class;
{$ENDIF}
  TSpreadsheet = class(TOleServer)
  private
    FIntf: IOpenOfficeSpreadsheet;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TSpreadsheetProperties;
    function GetServerProperties: TSpreadsheetProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeSpreadsheet;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeSpreadsheet);
    procedure Disconnect; override;
    function AddSheet(const name: WideString; isDefault: WordBool): IOpenOfficeSpreadsheetTable;
    procedure Save;
    procedure SaveAs(const fileName: WideString);
    function IsSaved: WordBool;
    procedure Show;
    function ColumnCount(const sheetName: WideString): Integer;
    function RowCount(const sheetName: WideString): Integer;
    function FileExt: WideString;
    property DefaultInterface: IOpenOfficeSpreadsheet read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSpreadsheetProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSpreadsheet
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSpreadsheetProperties = class(TPersistent)
  private
    FServer:    TSpreadsheet;
    function    GetDefaultInterface: IOpenOfficeSpreadsheet;
    constructor Create(AServer: TSpreadsheet);
  protected
  public
    property DefaultInterface: IOpenOfficeSpreadsheet read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSpreadsheetTable provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeSpreadsheetTable exposed by              
// the CoClass SpreadsheetTable. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSpreadsheetTable = class
    class function Create: IOpenOfficeSpreadsheetTable;
    class function CreateRemote(const MachineName: string): IOpenOfficeSpreadsheetTable;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSpreadsheetTable
// Help String      : 
// Default Interface: IOpenOfficeSpreadsheetTable
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSpreadsheetTableProperties= class;
{$ENDIF}
  TSpreadsheetTable = class(TOleServer)
  private
    FIntf: IOpenOfficeSpreadsheetTable;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TSpreadsheetTableProperties;
    function GetServerProperties: TSpreadsheetTableProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeSpreadsheetTable;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeSpreadsheetTable);
    procedure Disconnect; override;
    function GetSheetName: WideString;
    procedure SetSheetName(const value: WideString);
    function GetIsDefaultSheet: WordBool;
    procedure SetIsDefaultSheet(value: WordBool);
    procedure ClearXMLText;
    function XMLText: WideString;
    procedure Insert;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool);
    procedure SetColumnValue(const columnName: WideString; value: OleVariant);
    function GetColumnCount: Integer;
    property DefaultInterface: IOpenOfficeSpreadsheetTable read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSpreadsheetTableProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSpreadsheetTable
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSpreadsheetTableProperties = class(TPersistent)
  private
    FServer:    TSpreadsheetTable;
    function    GetDefaultInterface: IOpenOfficeSpreadsheetTable;
    constructor Create(AServer: TSpreadsheetTable);
  protected
  public
    property DefaultInterface: IOpenOfficeSpreadsheetTable read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOpenOfficeTextDocument provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeTextDocument exposed by              
// the CoClass OpenOfficeTextDocument. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOpenOfficeTextDocument = class
    class function Create: IOpenOfficeTextDocument;
    class function CreateRemote(const MachineName: string): IOpenOfficeTextDocument;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOpenOfficeTextDocument
// Help String      : 
// Default Interface: IOpenOfficeTextDocument
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOpenOfficeTextDocumentProperties= class;
{$ENDIF}
  TOpenOfficeTextDocument = class(TOleServer)
  private
    FIntf: IOpenOfficeTextDocument;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOpenOfficeTextDocumentProperties;
    function GetServerProperties: TOpenOfficeTextDocumentProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeTextDocument;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeTextDocument);
    procedure Disconnect; override;
    function FileExt: WideString;
    procedure AddText(style: ParagraphStyle; const text: WideString);
    procedure Clear;
    procedure Save;
    procedure SaveAs(const fileName: WideString);
    function IsSaved: WordBool;
    procedure Show;
    property DefaultInterface: IOpenOfficeTextDocument read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOpenOfficeTextDocumentProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOpenOfficeTextDocument
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOpenOfficeTextDocumentProperties = class(TPersistent)
  private
    FServer:    TOpenOfficeTextDocument;
    function    GetDefaultInterface: IOpenOfficeTextDocument;
    constructor Create(AServer: TOpenOfficeTextDocument);
  protected
  public
    property DefaultInterface: IOpenOfficeTextDocument read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOpenOfficeSpreadsheet provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeSpreadsheet exposed by              
// the CoClass OpenOfficeSpreadsheet. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOpenOfficeSpreadsheet = class
    class function Create: IOpenOfficeSpreadsheet;
    class function CreateRemote(const MachineName: string): IOpenOfficeSpreadsheet;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOpenOfficeSpreadsheet
// Help String      : 
// Default Interface: IOpenOfficeSpreadsheet
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOpenOfficeSpreadsheetProperties= class;
{$ENDIF}
  TOpenOfficeSpreadsheet = class(TOleServer)
  private
    FIntf: IOpenOfficeSpreadsheet;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOpenOfficeSpreadsheetProperties;
    function GetServerProperties: TOpenOfficeSpreadsheetProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeSpreadsheet;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeSpreadsheet);
    procedure Disconnect; override;
    function AddSheet(const name: WideString; isDefault: WordBool): IOpenOfficeSpreadsheetTable;
    procedure Save;
    procedure SaveAs(const fileName: WideString);
    function IsSaved: WordBool;
    procedure Show;
    function ColumnCount(const sheetName: WideString): Integer;
    function RowCount(const sheetName: WideString): Integer;
    function FileExt: WideString;
    property DefaultInterface: IOpenOfficeSpreadsheet read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOpenOfficeSpreadsheetProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOpenOfficeSpreadsheet
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOpenOfficeSpreadsheetProperties = class(TPersistent)
  private
    FServer:    TOpenOfficeSpreadsheet;
    function    GetDefaultInterface: IOpenOfficeSpreadsheet;
    constructor Create(AServer: TOpenOfficeSpreadsheet);
  protected
  public
    property DefaultInterface: IOpenOfficeSpreadsheet read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOpenOfficeSpreadsheetTable provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeSpreadsheetTable exposed by              
// the CoClass OpenOfficeSpreadsheetTable. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOpenOfficeSpreadsheetTable = class
    class function Create: IOpenOfficeSpreadsheetTable;
    class function CreateRemote(const MachineName: string): IOpenOfficeSpreadsheetTable;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOpenOfficeSpreadsheetTable
// Help String      : 
// Default Interface: IOpenOfficeSpreadsheetTable
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOpenOfficeSpreadsheetTableProperties= class;
{$ENDIF}
  TOpenOfficeSpreadsheetTable = class(TOleServer)
  private
    FIntf: IOpenOfficeSpreadsheetTable;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOpenOfficeSpreadsheetTableProperties;
    function GetServerProperties: TOpenOfficeSpreadsheetTableProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeSpreadsheetTable;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeSpreadsheetTable);
    procedure Disconnect; override;
    function GetSheetName: WideString;
    procedure SetSheetName(const value: WideString);
    function GetIsDefaultSheet: WordBool;
    procedure SetIsDefaultSheet(value: WordBool);
    procedure ClearXMLText;
    function XMLText: WideString;
    procedure Insert;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool);
    procedure SetColumnValue(const columnName: WideString; value: OleVariant);
    function GetColumnCount: Integer;
    property DefaultInterface: IOpenOfficeSpreadsheetTable read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOpenOfficeSpreadsheetTableProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOpenOfficeSpreadsheetTable
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOpenOfficeSpreadsheetTableProperties = class(TPersistent)
  private
    FServer:    TOpenOfficeSpreadsheetTable;
    function    GetDefaultInterface: IOpenOfficeSpreadsheetTable;
    constructor Create(AServer: TOpenOfficeSpreadsheetTable);
  protected
  public
    property DefaultInterface: IOpenOfficeSpreadsheetTable read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOpenOfficeDatabase provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeDatabase exposed by              
// the CoClass OpenOfficeDatabase. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOpenOfficeDatabase = class
    class function Create: IOpenOfficeDatabase;
    class function CreateRemote(const MachineName: string): IOpenOfficeDatabase;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOpenOfficeDatabase
// Help String      : 
// Default Interface: IOpenOfficeDatabase
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOpenOfficeDatabaseProperties= class;
{$ENDIF}
  TOpenOfficeDatabase = class(TOleServer)
  private
    FIntf: IOpenOfficeDatabase;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOpenOfficeDatabaseProperties;
    function GetServerProperties: TOpenOfficeDatabaseProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeDatabase;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeDatabase);
    procedure Disconnect; override;
    function AddTable(const name: WideString): IOpenOfficeDatabaseTable;
    function AddTable_2: IOpenOfficeDatabaseTable;
    procedure Save;
    procedure SaveAs(const fileName: WideString);
    function IsSaved: WordBool;
    procedure Show;
    function ColumnCount(const tableName: WideString): Integer;
    function RecordCount(const tableName: WideString): Integer;
    function FileExt: WideString;
    property DefaultInterface: IOpenOfficeDatabase read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOpenOfficeDatabaseProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOpenOfficeDatabase
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOpenOfficeDatabaseProperties = class(TPersistent)
  private
    FServer:    TOpenOfficeDatabase;
    function    GetDefaultInterface: IOpenOfficeDatabase;
    constructor Create(AServer: TOpenOfficeDatabase);
  protected
  public
    property DefaultInterface: IOpenOfficeDatabase read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOpenOfficeDatabaseTable provides a Create and CreateRemote method to          
// create instances of the default interface IOpenOfficeDatabaseTable exposed by              
// the CoClass OpenOfficeDatabaseTable. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOpenOfficeDatabaseTable = class
    class function Create: IOpenOfficeDatabaseTable;
    class function CreateRemote(const MachineName: string): IOpenOfficeDatabaseTable;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOpenOfficeDatabaseTable
// Help String      : 
// Default Interface: IOpenOfficeDatabaseTable
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOpenOfficeDatabaseTableProperties= class;
{$ENDIF}
  TOpenOfficeDatabaseTable = class(TOleServer)
  private
    FIntf: IOpenOfficeDatabaseTable;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOpenOfficeDatabaseTableProperties;
    function GetServerProperties: TOpenOfficeDatabaseTableProperties;
{$ENDIF}
    function GetDefaultInterface: IOpenOfficeDatabaseTable;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOpenOfficeDatabaseTable);
    procedure Disconnect; override;
    procedure ClearXMLText;
    function DefinitionXMLText: WideString;
    function GetTableName: WideString;
    procedure SetTableName(const name: WideString);
    function ActiveDataSet: _OfficeDataSet;
    procedure Insert;
    procedure AddColumn(const columnName: WideString; columnType: ColumnDataType; keyField: WordBool);
    procedure SetColumnValue(const columnName: WideString; value: OleVariant);
    function GetColumnCount: Integer;
    property DefaultInterface: IOpenOfficeDatabaseTable read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOpenOfficeDatabaseTableProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOpenOfficeDatabaseTable
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOpenOfficeDatabaseTableProperties = class(TPersistent)
  private
    FServer:    TOpenOfficeDatabaseTable;
    function    GetDefaultInterface: IOpenOfficeDatabaseTable;
    constructor Create(AServer: TOpenOfficeDatabaseTable);
  protected
  public
    property DefaultInterface: IOpenOfficeDatabaseTable read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOpenOfficeApplication provides a Create and CreateRemote method to          
// create instances of the default interface _OpenOfficeApplication exposed by              
// the CoClass OpenOfficeApplication. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOpenOfficeApplication = class
    class function Create: _OpenOfficeApplication;
    class function CreateRemote(const MachineName: string): _OpenOfficeApplication;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOpenOfficeApplication
// Help String      : 
// Default Interface: _OpenOfficeApplication
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOpenOfficeApplicationProperties= class;
{$ENDIF}
  TOpenOfficeApplication = class(TOleServer)
  private
    FIntf: _OpenOfficeApplication;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOpenOfficeApplicationProperties;
    function GetServerProperties: TOpenOfficeApplicationProperties;
{$ENDIF}
    function GetDefaultInterface: _OpenOfficeApplication;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _OpenOfficeApplication);
    procedure Disconnect; override;
    property DefaultInterface: _OpenOfficeApplication read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOpenOfficeApplicationProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOpenOfficeApplication
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOpenOfficeApplicationProperties = class(TPersistent)
  private
    FServer:    TOpenOfficeApplication;
    function    GetDefaultInterface: _OpenOfficeApplication;
    constructor Create(AServer: TOpenOfficeApplication);
  protected
  public
    property DefaultInterface: _OpenOfficeApplication read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoColumnDefinition provides a Create and CreateRemote method to          
// create instances of the default interface _ColumnDefinition exposed by              
// the CoClass ColumnDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoColumnDefinition = class
    class function Create: _ColumnDefinition;
    class function CreateRemote(const MachineName: string): _ColumnDefinition;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TColumnDefinition
// Help String      : 
// Default Interface: _ColumnDefinition
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TColumnDefinitionProperties= class;
{$ENDIF}
  TColumnDefinition = class(TOleServer)
  private
    FIntf: _ColumnDefinition;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TColumnDefinitionProperties;
    function GetServerProperties: TColumnDefinitionProperties;
{$ENDIF}
    function GetDefaultInterface: _ColumnDefinition;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _ColumnDefinition);
    procedure Disconnect; override;
    property DefaultInterface: _ColumnDefinition read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TColumnDefinitionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TColumnDefinition
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TColumnDefinitionProperties = class(TPersistent)
  private
    FServer:    TColumnDefinition;
    function    GetDefaultInterface: _ColumnDefinition;
    constructor Create(AServer: TColumnDefinition);
  protected
  public
    property DefaultInterface: _ColumnDefinition read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoColumnList provides a Create and CreateRemote method to          
// create instances of the default interface _ColumnList exposed by              
// the CoClass ColumnList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoColumnList = class
    class function Create: _ColumnList;
    class function CreateRemote(const MachineName: string): _ColumnList;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TColumnList
// Help String      : 
// Default Interface: _ColumnList
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TColumnListProperties= class;
{$ENDIF}
  TColumnList = class(TOleServer)
  private
    FIntf: _ColumnList;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TColumnListProperties;
    function GetServerProperties: TColumnListProperties;
{$ENDIF}
    function GetDefaultInterface: _ColumnList;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _ColumnList);
    procedure Disconnect; override;
    property DefaultInterface: _ColumnList read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TColumnListProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TColumnList
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TColumnListProperties = class(TPersistent)
  private
    FServer:    TColumnList;
    function    GetDefaultInterface: _ColumnList;
    constructor Create(AServer: TColumnList);
  protected
  public
    property DefaultInterface: _ColumnList read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOfficeDataRow provides a Create and CreateRemote method to          
// create instances of the default interface _OfficeDataRow exposed by              
// the CoClass OfficeDataRow. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOfficeDataRow = class
    class function Create: _OfficeDataRow;
    class function CreateRemote(const MachineName: string): _OfficeDataRow;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOfficeDataRow
// Help String      : 
// Default Interface: _OfficeDataRow
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOfficeDataRowProperties= class;
{$ENDIF}
  TOfficeDataRow = class(TOleServer)
  private
    FIntf: _OfficeDataRow;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOfficeDataRowProperties;
    function GetServerProperties: TOfficeDataRowProperties;
{$ENDIF}
    function GetDefaultInterface: _OfficeDataRow;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _OfficeDataRow);
    procedure Disconnect; override;
    property DefaultInterface: _OfficeDataRow read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOfficeDataRowProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOfficeDataRow
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOfficeDataRowProperties = class(TPersistent)
  private
    FServer:    TOfficeDataRow;
    function    GetDefaultInterface: _OfficeDataRow;
    constructor Create(AServer: TOfficeDataRow);
  protected
  public
    property DefaultInterface: _OfficeDataRow read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOfficeDataSet provides a Create and CreateRemote method to          
// create instances of the default interface _OfficeDataSet exposed by              
// the CoClass OfficeDataSet. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOfficeDataSet = class
    class function Create: _OfficeDataSet;
    class function CreateRemote(const MachineName: string): _OfficeDataSet;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOfficeDataSet
// Help String      : 
// Default Interface: _OfficeDataSet
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOfficeDataSetProperties= class;
{$ENDIF}
  TOfficeDataSet = class(TOleServer)
  private
    FIntf: _OfficeDataSet;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TOfficeDataSetProperties;
    function GetServerProperties: TOfficeDataSetProperties;
{$ENDIF}
    function GetDefaultInterface: _OfficeDataSet;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _OfficeDataSet);
    procedure Disconnect; override;
    property DefaultInterface: _OfficeDataSet read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOfficeDataSetProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOfficeDataSet
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOfficeDataSetProperties = class(TPersistent)
  private
    FServer:    TOfficeDataSet;
    function    GetDefaultInterface: _OfficeDataSet;
    constructor Create(AServer: TOfficeDataSet);
  protected
  public
    property DefaultInterface: _OfficeDataSet read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTextDocument.Create: IOpenOfficeTextDocument;
begin
  Result := CreateComObject(CLASS_TextDocument) as IOpenOfficeTextDocument;
end;

class function CoTextDocument.CreateRemote(const MachineName: string): IOpenOfficeTextDocument;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TextDocument) as IOpenOfficeTextDocument;
end;

procedure TTextDocument.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{33BF43C5-9263-46B7-8BF8-2EB29B06D6C4}';
    IntfIID:   '{E8FA3144-51F9-4AF5-9E76-56A48F23C125}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTextDocument.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeTextDocument;
  end;
end;

procedure TTextDocument.ConnectTo(svrIntf: IOpenOfficeTextDocument);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTextDocument.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTextDocument.GetDefaultInterface: IOpenOfficeTextDocument;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TTextDocument.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTextDocumentProperties.Create(Self);
{$ENDIF}
end;

destructor TTextDocument.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTextDocument.GetServerProperties: TTextDocumentProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTextDocument.FileExt: WideString;
begin
  Result := DefaultInterface.FileExt;
end;

procedure TTextDocument.AddText(style: ParagraphStyle; const text: WideString);
begin
  DefaultInterface.AddText(style, text);
end;

procedure TTextDocument.Clear;
begin
  DefaultInterface.Clear;
end;

procedure TTextDocument.Save;
begin
  DefaultInterface.Save;
end;

procedure TTextDocument.SaveAs(const fileName: WideString);
begin
  DefaultInterface.SaveAs(fileName);
end;

function TTextDocument.IsSaved: WordBool;
begin
  Result := DefaultInterface.IsSaved;
end;

procedure TTextDocument.Show;
begin
  DefaultInterface.Show;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTextDocumentProperties.Create(AServer: TTextDocument);
begin
  inherited Create;
  FServer := AServer;
end;

function TTextDocumentProperties.GetDefaultInterface: IOpenOfficeTextDocument;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDatabase.Create: IOpenOfficeDatabase;
begin
  Result := CreateComObject(CLASS_Database) as IOpenOfficeDatabase;
end;

class function CoDatabase.CreateRemote(const MachineName: string): IOpenOfficeDatabase;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Database) as IOpenOfficeDatabase;
end;

procedure TDatabase.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{99B7CA01-EE9D-48CB-ABFC-0754E0863EEF}';
    IntfIID:   '{E1E68614-FAE7-488D-9285-029E5693DF3A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDatabase.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeDatabase;
  end;
end;

procedure TDatabase.ConnectTo(svrIntf: IOpenOfficeDatabase);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDatabase.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDatabase.GetDefaultInterface: IOpenOfficeDatabase;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TDatabase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDatabaseProperties.Create(Self);
{$ENDIF}
end;

destructor TDatabase.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDatabase.GetServerProperties: TDatabaseProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDatabase.AddTable(const name: WideString): IOpenOfficeDatabaseTable;
begin
  Result := DefaultInterface.AddTable(name);
end;

function TDatabase.AddTable_2: IOpenOfficeDatabaseTable;
begin
  Result := DefaultInterface.AddTable_2;
end;

procedure TDatabase.Save;
begin
  DefaultInterface.Save;
end;

procedure TDatabase.SaveAs(const fileName: WideString);
begin
  DefaultInterface.SaveAs(fileName);
end;

function TDatabase.IsSaved: WordBool;
begin
  Result := DefaultInterface.IsSaved;
end;

procedure TDatabase.Show;
begin
  DefaultInterface.Show;
end;

function TDatabase.ColumnCount(const tableName: WideString): Integer;
begin
  Result := DefaultInterface.ColumnCount(tableName);
end;

function TDatabase.RecordCount(const tableName: WideString): Integer;
begin
  Result := DefaultInterface.RecordCount(tableName);
end;

function TDatabase.FileExt: WideString;
begin
  Result := DefaultInterface.FileExt;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDatabaseProperties.Create(AServer: TDatabase);
begin
  inherited Create;
  FServer := AServer;
end;

function TDatabaseProperties.GetDefaultInterface: IOpenOfficeDatabase;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDatabaseTable.Create: IOpenOfficeDatabaseTable;
begin
  Result := CreateComObject(CLASS_DatabaseTable) as IOpenOfficeDatabaseTable;
end;

class function CoDatabaseTable.CreateRemote(const MachineName: string): IOpenOfficeDatabaseTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatabaseTable) as IOpenOfficeDatabaseTable;
end;

procedure TDatabaseTable.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{8C62A4B1-F984-44C9-BD39-F6056E829EEF}';
    IntfIID:   '{69182445-665E-45AE-846A-E404E19BF404}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDatabaseTable.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeDatabaseTable;
  end;
end;

procedure TDatabaseTable.ConnectTo(svrIntf: IOpenOfficeDatabaseTable);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDatabaseTable.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDatabaseTable.GetDefaultInterface: IOpenOfficeDatabaseTable;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TDatabaseTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDatabaseTableProperties.Create(Self);
{$ENDIF}
end;

destructor TDatabaseTable.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDatabaseTable.GetServerProperties: TDatabaseTableProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TDatabaseTable.ClearXMLText;
begin
  DefaultInterface.ClearXMLText;
end;

function TDatabaseTable.DefinitionXMLText: WideString;
begin
  Result := DefaultInterface.DefinitionXMLText;
end;

function TDatabaseTable.GetTableName: WideString;
begin
  Result := DefaultInterface.GetTableName;
end;

procedure TDatabaseTable.SetTableName(const name: WideString);
begin
  DefaultInterface.SetTableName(name);
end;

function TDatabaseTable.ActiveDataSet: _OfficeDataSet;
begin
  Result := DefaultInterface.ActiveDataSet;
end;

procedure TDatabaseTable.Insert;
begin
  DefaultInterface.Insert;
end;

procedure TDatabaseTable.AddColumn(const columnName: WideString; columnType: ColumnDataType; 
                                   keyField: WordBool);
begin
  DefaultInterface.AddColumn(columnName, columnType, keyField);
end;

procedure TDatabaseTable.SetColumnValue(const columnName: WideString; value: OleVariant);
begin
  DefaultInterface.SetColumnValue(columnName, value);
end;

function TDatabaseTable.GetColumnCount: Integer;
begin
  Result := DefaultInterface.GetColumnCount;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDatabaseTableProperties.Create(AServer: TDatabaseTable);
begin
  inherited Create;
  FServer := AServer;
end;

function TDatabaseTableProperties.GetDefaultInterface: IOpenOfficeDatabaseTable;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSpreadsheet.Create: IOpenOfficeSpreadsheet;
begin
  Result := CreateComObject(CLASS_Spreadsheet) as IOpenOfficeSpreadsheet;
end;

class function CoSpreadsheet.CreateRemote(const MachineName: string): IOpenOfficeSpreadsheet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Spreadsheet) as IOpenOfficeSpreadsheet;
end;

procedure TSpreadsheet.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{FAEF8462-A684-4FAC-96BA-15F44571EDB0}';
    IntfIID:   '{8ED0AE71-B229-4E2F-9FCA-9E5A45F9C9DC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpreadsheet.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeSpreadsheet;
  end;
end;

procedure TSpreadsheet.ConnectTo(svrIntf: IOpenOfficeSpreadsheet);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpreadsheet.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpreadsheet.GetDefaultInterface: IOpenOfficeSpreadsheet;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpreadsheet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSpreadsheetProperties.Create(Self);
{$ENDIF}
end;

destructor TSpreadsheet.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSpreadsheet.GetServerProperties: TSpreadsheetProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSpreadsheet.AddSheet(const name: WideString; isDefault: WordBool): IOpenOfficeSpreadsheetTable;
begin
  Result := DefaultInterface.AddSheet(name, isDefault);
end;

procedure TSpreadsheet.Save;
begin
  DefaultInterface.Save;
end;

procedure TSpreadsheet.SaveAs(const fileName: WideString);
begin
  DefaultInterface.SaveAs(fileName);
end;

function TSpreadsheet.IsSaved: WordBool;
begin
  Result := DefaultInterface.IsSaved;
end;

procedure TSpreadsheet.Show;
begin
  DefaultInterface.Show;
end;

function TSpreadsheet.ColumnCount(const sheetName: WideString): Integer;
begin
  Result := DefaultInterface.ColumnCount(sheetName);
end;

function TSpreadsheet.RowCount(const sheetName: WideString): Integer;
begin
  Result := DefaultInterface.RowCount(sheetName);
end;

function TSpreadsheet.FileExt: WideString;
begin
  Result := DefaultInterface.FileExt;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSpreadsheetProperties.Create(AServer: TSpreadsheet);
begin
  inherited Create;
  FServer := AServer;
end;

function TSpreadsheetProperties.GetDefaultInterface: IOpenOfficeSpreadsheet;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSpreadsheetTable.Create: IOpenOfficeSpreadsheetTable;
begin
  Result := CreateComObject(CLASS_SpreadsheetTable) as IOpenOfficeSpreadsheetTable;
end;

class function CoSpreadsheetTable.CreateRemote(const MachineName: string): IOpenOfficeSpreadsheetTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpreadsheetTable) as IOpenOfficeSpreadsheetTable;
end;

procedure TSpreadsheetTable.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{54B19FA5-A35B-4FE7-AB45-4C16C74777C5}';
    IntfIID:   '{5B3E6272-4A1D-40BC-866B-5F37E39110D8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpreadsheetTable.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeSpreadsheetTable;
  end;
end;

procedure TSpreadsheetTable.ConnectTo(svrIntf: IOpenOfficeSpreadsheetTable);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpreadsheetTable.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpreadsheetTable.GetDefaultInterface: IOpenOfficeSpreadsheetTable;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpreadsheetTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSpreadsheetTableProperties.Create(Self);
{$ENDIF}
end;

destructor TSpreadsheetTable.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSpreadsheetTable.GetServerProperties: TSpreadsheetTableProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSpreadsheetTable.GetSheetName: WideString;
begin
  Result := DefaultInterface.GetSheetName;
end;

procedure TSpreadsheetTable.SetSheetName(const value: WideString);
begin
  DefaultInterface.SetSheetName(value);
end;

function TSpreadsheetTable.GetIsDefaultSheet: WordBool;
begin
  Result := DefaultInterface.GetIsDefaultSheet;
end;

procedure TSpreadsheetTable.SetIsDefaultSheet(value: WordBool);
begin
  DefaultInterface.SetIsDefaultSheet(value);
end;

procedure TSpreadsheetTable.ClearXMLText;
begin
  DefaultInterface.ClearXMLText;
end;

function TSpreadsheetTable.XMLText: WideString;
begin
  Result := DefaultInterface.XMLText;
end;

procedure TSpreadsheetTable.Insert;
begin
  DefaultInterface.Insert;
end;

procedure TSpreadsheetTable.AddColumn(const columnName: WideString; columnType: ColumnDataType; 
                                      keyField: WordBool);
begin
  DefaultInterface.AddColumn(columnName, columnType, keyField);
end;

procedure TSpreadsheetTable.SetColumnValue(const columnName: WideString; value: OleVariant);
begin
  DefaultInterface.SetColumnValue(columnName, value);
end;

function TSpreadsheetTable.GetColumnCount: Integer;
begin
  Result := DefaultInterface.GetColumnCount;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSpreadsheetTableProperties.Create(AServer: TSpreadsheetTable);
begin
  inherited Create;
  FServer := AServer;
end;

function TSpreadsheetTableProperties.GetDefaultInterface: IOpenOfficeSpreadsheetTable;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOpenOfficeTextDocument.Create: IOpenOfficeTextDocument;
begin
  Result := CreateComObject(CLASS_OpenOfficeTextDocument) as IOpenOfficeTextDocument;
end;

class function CoOpenOfficeTextDocument.CreateRemote(const MachineName: string): IOpenOfficeTextDocument;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OpenOfficeTextDocument) as IOpenOfficeTextDocument;
end;

procedure TOpenOfficeTextDocument.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7129310D-0006-4919-BE24-BD96E3CBB0A1}';
    IntfIID:   '{E8FA3144-51F9-4AF5-9E76-56A48F23C125}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOpenOfficeTextDocument.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeTextDocument;
  end;
end;

procedure TOpenOfficeTextDocument.ConnectTo(svrIntf: IOpenOfficeTextDocument);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOpenOfficeTextDocument.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOpenOfficeTextDocument.GetDefaultInterface: IOpenOfficeTextDocument;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOpenOfficeTextDocument.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOpenOfficeTextDocumentProperties.Create(Self);
{$ENDIF}
end;

destructor TOpenOfficeTextDocument.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOpenOfficeTextDocument.GetServerProperties: TOpenOfficeTextDocumentProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TOpenOfficeTextDocument.FileExt: WideString;
begin
  Result := DefaultInterface.FileExt;
end;

procedure TOpenOfficeTextDocument.AddText(style: ParagraphStyle; const text: WideString);
begin
  DefaultInterface.AddText(style, text);
end;

procedure TOpenOfficeTextDocument.Clear;
begin
  DefaultInterface.Clear;
end;

procedure TOpenOfficeTextDocument.Save;
begin
  DefaultInterface.Save;
end;

procedure TOpenOfficeTextDocument.SaveAs(const fileName: WideString);
begin
  DefaultInterface.SaveAs(fileName);
end;

function TOpenOfficeTextDocument.IsSaved: WordBool;
begin
  Result := DefaultInterface.IsSaved;
end;

procedure TOpenOfficeTextDocument.Show;
begin
  DefaultInterface.Show;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOpenOfficeTextDocumentProperties.Create(AServer: TOpenOfficeTextDocument);
begin
  inherited Create;
  FServer := AServer;
end;

function TOpenOfficeTextDocumentProperties.GetDefaultInterface: IOpenOfficeTextDocument;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOpenOfficeSpreadsheet.Create: IOpenOfficeSpreadsheet;
begin
  Result := CreateComObject(CLASS_OpenOfficeSpreadsheet) as IOpenOfficeSpreadsheet;
end;

class function CoOpenOfficeSpreadsheet.CreateRemote(const MachineName: string): IOpenOfficeSpreadsheet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OpenOfficeSpreadsheet) as IOpenOfficeSpreadsheet;
end;

procedure TOpenOfficeSpreadsheet.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{6F65DFF7-50F7-4C05-A84A-80B3C76BB2DF}';
    IntfIID:   '{8ED0AE71-B229-4E2F-9FCA-9E5A45F9C9DC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOpenOfficeSpreadsheet.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeSpreadsheet;
  end;
end;

procedure TOpenOfficeSpreadsheet.ConnectTo(svrIntf: IOpenOfficeSpreadsheet);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOpenOfficeSpreadsheet.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOpenOfficeSpreadsheet.GetDefaultInterface: IOpenOfficeSpreadsheet;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOpenOfficeSpreadsheet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOpenOfficeSpreadsheetProperties.Create(Self);
{$ENDIF}
end;

destructor TOpenOfficeSpreadsheet.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOpenOfficeSpreadsheet.GetServerProperties: TOpenOfficeSpreadsheetProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TOpenOfficeSpreadsheet.AddSheet(const name: WideString; isDefault: WordBool): IOpenOfficeSpreadsheetTable;
begin
  Result := DefaultInterface.AddSheet(name, isDefault);
end;

procedure TOpenOfficeSpreadsheet.Save;
begin
  DefaultInterface.Save;
end;

procedure TOpenOfficeSpreadsheet.SaveAs(const fileName: WideString);
begin
  DefaultInterface.SaveAs(fileName);
end;

function TOpenOfficeSpreadsheet.IsSaved: WordBool;
begin
  Result := DefaultInterface.IsSaved;
end;

procedure TOpenOfficeSpreadsheet.Show;
begin
  DefaultInterface.Show;
end;

function TOpenOfficeSpreadsheet.ColumnCount(const sheetName: WideString): Integer;
begin
  Result := DefaultInterface.ColumnCount(sheetName);
end;

function TOpenOfficeSpreadsheet.RowCount(const sheetName: WideString): Integer;
begin
  Result := DefaultInterface.RowCount(sheetName);
end;

function TOpenOfficeSpreadsheet.FileExt: WideString;
begin
  Result := DefaultInterface.FileExt;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOpenOfficeSpreadsheetProperties.Create(AServer: TOpenOfficeSpreadsheet);
begin
  inherited Create;
  FServer := AServer;
end;

function TOpenOfficeSpreadsheetProperties.GetDefaultInterface: IOpenOfficeSpreadsheet;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOpenOfficeSpreadsheetTable.Create: IOpenOfficeSpreadsheetTable;
begin
  Result := CreateComObject(CLASS_OpenOfficeSpreadsheetTable) as IOpenOfficeSpreadsheetTable;
end;

class function CoOpenOfficeSpreadsheetTable.CreateRemote(const MachineName: string): IOpenOfficeSpreadsheetTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OpenOfficeSpreadsheetTable) as IOpenOfficeSpreadsheetTable;
end;

procedure TOpenOfficeSpreadsheetTable.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{335D1F79-3562-4DC8-9FB0-E6FD9E5C357E}';
    IntfIID:   '{5B3E6272-4A1D-40BC-866B-5F37E39110D8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOpenOfficeSpreadsheetTable.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeSpreadsheetTable;
  end;
end;

procedure TOpenOfficeSpreadsheetTable.ConnectTo(svrIntf: IOpenOfficeSpreadsheetTable);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOpenOfficeSpreadsheetTable.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOpenOfficeSpreadsheetTable.GetDefaultInterface: IOpenOfficeSpreadsheetTable;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOpenOfficeSpreadsheetTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOpenOfficeSpreadsheetTableProperties.Create(Self);
{$ENDIF}
end;

destructor TOpenOfficeSpreadsheetTable.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOpenOfficeSpreadsheetTable.GetServerProperties: TOpenOfficeSpreadsheetTableProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TOpenOfficeSpreadsheetTable.GetSheetName: WideString;
begin
  Result := DefaultInterface.GetSheetName;
end;

procedure TOpenOfficeSpreadsheetTable.SetSheetName(const value: WideString);
begin
  DefaultInterface.SetSheetName(value);
end;

function TOpenOfficeSpreadsheetTable.GetIsDefaultSheet: WordBool;
begin
  Result := DefaultInterface.GetIsDefaultSheet;
end;

procedure TOpenOfficeSpreadsheetTable.SetIsDefaultSheet(value: WordBool);
begin
  DefaultInterface.SetIsDefaultSheet(value);
end;

procedure TOpenOfficeSpreadsheetTable.ClearXMLText;
begin
  DefaultInterface.ClearXMLText;
end;

function TOpenOfficeSpreadsheetTable.XMLText: WideString;
begin
  Result := DefaultInterface.XMLText;
end;

procedure TOpenOfficeSpreadsheetTable.Insert;
begin
  DefaultInterface.Insert;
end;

procedure TOpenOfficeSpreadsheetTable.AddColumn(const columnName: WideString; 
                                                columnType: ColumnDataType; keyField: WordBool);
begin
  DefaultInterface.AddColumn(columnName, columnType, keyField);
end;

procedure TOpenOfficeSpreadsheetTable.SetColumnValue(const columnName: WideString; value: OleVariant);
begin
  DefaultInterface.SetColumnValue(columnName, value);
end;

function TOpenOfficeSpreadsheetTable.GetColumnCount: Integer;
begin
  Result := DefaultInterface.GetColumnCount;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOpenOfficeSpreadsheetTableProperties.Create(AServer: TOpenOfficeSpreadsheetTable);
begin
  inherited Create;
  FServer := AServer;
end;

function TOpenOfficeSpreadsheetTableProperties.GetDefaultInterface: IOpenOfficeSpreadsheetTable;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOpenOfficeDatabase.Create: IOpenOfficeDatabase;
begin
  Result := CreateComObject(CLASS_OpenOfficeDatabase) as IOpenOfficeDatabase;
end;

class function CoOpenOfficeDatabase.CreateRemote(const MachineName: string): IOpenOfficeDatabase;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OpenOfficeDatabase) as IOpenOfficeDatabase;
end;

procedure TOpenOfficeDatabase.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C9819BF6-153C-460C-8837-0027EB3E5AB0}';
    IntfIID:   '{E1E68614-FAE7-488D-9285-029E5693DF3A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOpenOfficeDatabase.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeDatabase;
  end;
end;

procedure TOpenOfficeDatabase.ConnectTo(svrIntf: IOpenOfficeDatabase);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOpenOfficeDatabase.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOpenOfficeDatabase.GetDefaultInterface: IOpenOfficeDatabase;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOpenOfficeDatabase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOpenOfficeDatabaseProperties.Create(Self);
{$ENDIF}
end;

destructor TOpenOfficeDatabase.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOpenOfficeDatabase.GetServerProperties: TOpenOfficeDatabaseProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TOpenOfficeDatabase.AddTable(const name: WideString): IOpenOfficeDatabaseTable;
begin
  Result := DefaultInterface.AddTable(name);
end;

function TOpenOfficeDatabase.AddTable_2: IOpenOfficeDatabaseTable;
begin
  Result := DefaultInterface.AddTable_2;
end;

procedure TOpenOfficeDatabase.Save;
begin
  DefaultInterface.Save;
end;

procedure TOpenOfficeDatabase.SaveAs(const fileName: WideString);
begin
  DefaultInterface.SaveAs(fileName);
end;

function TOpenOfficeDatabase.IsSaved: WordBool;
begin
  Result := DefaultInterface.IsSaved;
end;

procedure TOpenOfficeDatabase.Show;
begin
  DefaultInterface.Show;
end;

function TOpenOfficeDatabase.ColumnCount(const tableName: WideString): Integer;
begin
  Result := DefaultInterface.ColumnCount(tableName);
end;

function TOpenOfficeDatabase.RecordCount(const tableName: WideString): Integer;
begin
  Result := DefaultInterface.RecordCount(tableName);
end;

function TOpenOfficeDatabase.FileExt: WideString;
begin
  Result := DefaultInterface.FileExt;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOpenOfficeDatabaseProperties.Create(AServer: TOpenOfficeDatabase);
begin
  inherited Create;
  FServer := AServer;
end;

function TOpenOfficeDatabaseProperties.GetDefaultInterface: IOpenOfficeDatabase;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOpenOfficeDatabaseTable.Create: IOpenOfficeDatabaseTable;
begin
  Result := CreateComObject(CLASS_OpenOfficeDatabaseTable) as IOpenOfficeDatabaseTable;
end;

class function CoOpenOfficeDatabaseTable.CreateRemote(const MachineName: string): IOpenOfficeDatabaseTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OpenOfficeDatabaseTable) as IOpenOfficeDatabaseTable;
end;

procedure TOpenOfficeDatabaseTable.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{83FA7938-BB5D-482C-8F4C-F3E3977824FE}';
    IntfIID:   '{69182445-665E-45AE-846A-E404E19BF404}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOpenOfficeDatabaseTable.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOpenOfficeDatabaseTable;
  end;
end;

procedure TOpenOfficeDatabaseTable.ConnectTo(svrIntf: IOpenOfficeDatabaseTable);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOpenOfficeDatabaseTable.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOpenOfficeDatabaseTable.GetDefaultInterface: IOpenOfficeDatabaseTable;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOpenOfficeDatabaseTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOpenOfficeDatabaseTableProperties.Create(Self);
{$ENDIF}
end;

destructor TOpenOfficeDatabaseTable.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOpenOfficeDatabaseTable.GetServerProperties: TOpenOfficeDatabaseTableProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TOpenOfficeDatabaseTable.ClearXMLText;
begin
  DefaultInterface.ClearXMLText;
end;

function TOpenOfficeDatabaseTable.DefinitionXMLText: WideString;
begin
  Result := DefaultInterface.DefinitionXMLText;
end;

function TOpenOfficeDatabaseTable.GetTableName: WideString;
begin
  Result := DefaultInterface.GetTableName;
end;

procedure TOpenOfficeDatabaseTable.SetTableName(const name: WideString);
begin
  DefaultInterface.SetTableName(name);
end;

function TOpenOfficeDatabaseTable.ActiveDataSet: _OfficeDataSet;
begin
  Result := DefaultInterface.ActiveDataSet;
end;

procedure TOpenOfficeDatabaseTable.Insert;
begin
  DefaultInterface.Insert;
end;

procedure TOpenOfficeDatabaseTable.AddColumn(const columnName: WideString; 
                                             columnType: ColumnDataType; keyField: WordBool);
begin
  DefaultInterface.AddColumn(columnName, columnType, keyField);
end;

procedure TOpenOfficeDatabaseTable.SetColumnValue(const columnName: WideString; value: OleVariant);
begin
  DefaultInterface.SetColumnValue(columnName, value);
end;

function TOpenOfficeDatabaseTable.GetColumnCount: Integer;
begin
  Result := DefaultInterface.GetColumnCount;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOpenOfficeDatabaseTableProperties.Create(AServer: TOpenOfficeDatabaseTable);
begin
  inherited Create;
  FServer := AServer;
end;

function TOpenOfficeDatabaseTableProperties.GetDefaultInterface: IOpenOfficeDatabaseTable;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOpenOfficeApplication.Create: _OpenOfficeApplication;
begin
  Result := CreateComObject(CLASS_OpenOfficeApplication) as _OpenOfficeApplication;
end;

class function CoOpenOfficeApplication.CreateRemote(const MachineName: string): _OpenOfficeApplication;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OpenOfficeApplication) as _OpenOfficeApplication;
end;

procedure TOpenOfficeApplication.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{5C87C78C-DB2F-3239-BB37-23B109FD8E88}';
    IntfIID:   '{5B63676D-944C-3CDE-A694-57070B0D2661}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOpenOfficeApplication.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _OpenOfficeApplication;
  end;
end;

procedure TOpenOfficeApplication.ConnectTo(svrIntf: _OpenOfficeApplication);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOpenOfficeApplication.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOpenOfficeApplication.GetDefaultInterface: _OpenOfficeApplication;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOpenOfficeApplication.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOpenOfficeApplicationProperties.Create(Self);
{$ENDIF}
end;

destructor TOpenOfficeApplication.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOpenOfficeApplication.GetServerProperties: TOpenOfficeApplicationProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOpenOfficeApplicationProperties.Create(AServer: TOpenOfficeApplication);
begin
  inherited Create;
  FServer := AServer;
end;

function TOpenOfficeApplicationProperties.GetDefaultInterface: _OpenOfficeApplication;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoColumnDefinition.Create: _ColumnDefinition;
begin
  Result := CreateComObject(CLASS_ColumnDefinition) as _ColumnDefinition;
end;

class function CoColumnDefinition.CreateRemote(const MachineName: string): _ColumnDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ColumnDefinition) as _ColumnDefinition;
end;

procedure TColumnDefinition.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{4BE32C53-AE3F-38F9-9273-CE22274DE906}';
    IntfIID:   '{DF854626-065C-32A6-A987-DE245B16A8EB}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TColumnDefinition.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _ColumnDefinition;
  end;
end;

procedure TColumnDefinition.ConnectTo(svrIntf: _ColumnDefinition);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TColumnDefinition.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TColumnDefinition.GetDefaultInterface: _ColumnDefinition;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TColumnDefinition.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TColumnDefinitionProperties.Create(Self);
{$ENDIF}
end;

destructor TColumnDefinition.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TColumnDefinition.GetServerProperties: TColumnDefinitionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TColumnDefinitionProperties.Create(AServer: TColumnDefinition);
begin
  inherited Create;
  FServer := AServer;
end;

function TColumnDefinitionProperties.GetDefaultInterface: _ColumnDefinition;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoColumnList.Create: _ColumnList;
begin
  Result := CreateComObject(CLASS_ColumnList) as _ColumnList;
end;

class function CoColumnList.CreateRemote(const MachineName: string): _ColumnList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ColumnList) as _ColumnList;
end;

procedure TColumnList.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C61B674B-BD11-3223-BF67-206B452BC943}';
    IntfIID:   '{2C108DE3-E91B-31EC-9872-9E5DFDC4AB5A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TColumnList.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _ColumnList;
  end;
end;

procedure TColumnList.ConnectTo(svrIntf: _ColumnList);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TColumnList.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TColumnList.GetDefaultInterface: _ColumnList;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TColumnList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TColumnListProperties.Create(Self);
{$ENDIF}
end;

destructor TColumnList.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TColumnList.GetServerProperties: TColumnListProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TColumnListProperties.Create(AServer: TColumnList);
begin
  inherited Create;
  FServer := AServer;
end;

function TColumnListProperties.GetDefaultInterface: _ColumnList;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOfficeDataRow.Create: _OfficeDataRow;
begin
  Result := CreateComObject(CLASS_OfficeDataRow) as _OfficeDataRow;
end;

class function CoOfficeDataRow.CreateRemote(const MachineName: string): _OfficeDataRow;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OfficeDataRow) as _OfficeDataRow;
end;

procedure TOfficeDataRow.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E142B871-B6BB-3CAA-82C8-DE42BDBCE5B1}';
    IntfIID:   '{05934FAD-7F4D-3D58-B1B4-19029247BA15}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOfficeDataRow.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _OfficeDataRow;
  end;
end;

procedure TOfficeDataRow.ConnectTo(svrIntf: _OfficeDataRow);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOfficeDataRow.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOfficeDataRow.GetDefaultInterface: _OfficeDataRow;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOfficeDataRow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOfficeDataRowProperties.Create(Self);
{$ENDIF}
end;

destructor TOfficeDataRow.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOfficeDataRow.GetServerProperties: TOfficeDataRowProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOfficeDataRowProperties.Create(AServer: TOfficeDataRow);
begin
  inherited Create;
  FServer := AServer;
end;

function TOfficeDataRowProperties.GetDefaultInterface: _OfficeDataRow;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoOfficeDataSet.Create: _OfficeDataSet;
begin
  Result := CreateComObject(CLASS_OfficeDataSet) as _OfficeDataSet;
end;

class function CoOfficeDataSet.CreateRemote(const MachineName: string): _OfficeDataSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OfficeDataSet) as _OfficeDataSet;
end;

procedure TOfficeDataSet.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{39755803-7B68-345C-8455-B67D6A33EF7F}';
    IntfIID:   '{FF7B45A1-F496-3F61-B72D-9864BAEAE9EF}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOfficeDataSet.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _OfficeDataSet;
  end;
end;

procedure TOfficeDataSet.ConnectTo(svrIntf: _OfficeDataSet);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOfficeDataSet.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOfficeDataSet.GetDefaultInterface: _OfficeDataSet;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TOfficeDataSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOfficeDataSetProperties.Create(Self);
{$ENDIF}
end;

destructor TOfficeDataSet.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOfficeDataSet.GetServerProperties: TOfficeDataSetProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOfficeDataSetProperties.Create(AServer: TOfficeDataSet);
begin
  inherited Create;
  FServer := AServer;
end;

function TOfficeDataSetProperties.GetDefaultInterface: _OfficeDataSet;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TTextDocument, TDatabase, TDatabaseTable, TSpreadsheet, 
    TSpreadsheetTable, TOpenOfficeTextDocument, TOpenOfficeSpreadsheet, TOpenOfficeSpreadsheetTable, TOpenOfficeDatabase, 
    TOpenOfficeDatabaseTable, TOpenOfficeApplication, TColumnDefinition, TColumnList, TOfficeDataRow, 
    TOfficeDataSet]);
end;

end.
