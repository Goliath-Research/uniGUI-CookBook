unit dtengine_TLB;

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

// PASTLWTR : $Revision:   1.88.1.0.1.0  $
// File generated on 7/6/2000 3:20:22 PM from Type Library described below.

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
// ************************************************************************ //
// Type Lib: G:\dev\600\source\dtsearch\bin\dten600.dll (1)
// IID\LCID: {A967E5C4-B0E1-11D3-B57C-00105AA461D0}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (F:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (F:\WINNT\System32\STDVCL40.DLL)
// Errors:
//   Error creating palette bitmap of (TServer) : Invalid GUID format
//   Error creating palette bitmap of (TJobErrorInfo) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
//   Error creating palette bitmap of (TIndexJob) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
//   Error creating palette bitmap of (TSearchJob) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
//   Error creating palette bitmap of (TFileConverter) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
//   Error creating palette bitmap of (TSearchReportJob) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
//   Error creating palette bitmap of (TOptions) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
//   Error creating palette bitmap of (TWordListBuilder) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
//   Error creating palette bitmap of (TSearchResults) : Server G:\dev\600\source\dtsearch\bin\dten600.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses
  Windows,
  ActiveX,
  Classes,
  Graphics,
  OleServer,
  OleCtrls,
  StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  dtengineMajorVersion = 1;
  dtengineMinorVersion = 0;

  LIBID_dtengine: TGUID = '{A967E5C4-B0E1-11D3-B57C-00105AA461D0}';

  IID_IServer: TGUID = '{A967E5D1-B0E1-11D3-B57C-00105AA461D0}';
  CLASS_Server: TGUID = '{A967E5D2-B0E1-11D3-B57C-00105AA461D0}';
  IID_IJobErrorInfo: TGUID = '{A967E5D5-B0E1-11D3-B57C-00105AA461D0}';
  CLASS_JobErrorInfo: TGUID = '{A967E5D6-B0E1-11D3-B57C-00105AA461D0}';
  IID_IIndexJob: TGUID = '{697DF022-B24E-11D3-B57C-00105AA461D0}';
  CLASS_IndexJob: TGUID = '{697DF023-B24E-11D3-B57C-00105AA461D0}';
  IID_ISearchJob: TGUID = '{697DF024-B24E-11D3-B57C-00105AA461D0}';
  CLASS_SearchJob: TGUID = '{697DF025-B24E-11D3-B57C-00105AA461D0}';
  IID_IFileConverter: TGUID = '{697DF026-B24E-11D3-B57C-00105AA461D0}';
  CLASS_FileConverter: TGUID = '{697DF027-B24E-11D3-B57C-00105AA461D0}';
  IID_ISearchReportJob: TGUID = '{697DF028-B24E-11D3-B57C-00105AA461D0}';
  CLASS_SearchReportJob: TGUID = '{697DF029-B24E-11D3-B57C-00105AA461D0}';
  IID_IOptions: TGUID = '{697DF02A-B24E-11D3-B57C-00105AA461D0}';
  CLASS_Options: TGUID = '{697DF02B-B24E-11D3-B57C-00105AA461D0}';
  IID_IWordListBuilder: TGUID = '{697DF02C-B24E-11D3-B57C-00105AA461D0}';
  CLASS_WordListBuilder: TGUID = '{697DF02D-B24E-11D3-B57C-00105AA461D0}';
  IID_ISearchResults: TGUID = '{798CBE34-B27D-11D3-B57C-00105AA461D0}';
  CLASS_SearchResults: TGUID = '{798CBE35-B27D-11D3-B57C-00105AA461D0}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum __MIDL___MIDL_itf_dten600_0252_0001
type
  __MIDL___MIDL_itf_dten600_0252_0001 = TOleEnum;
const
  Build = $0000170D;

// Constants for enum IndexingStep
type
  IndexingStep = TOleEnum;
const
  ixStepNone = $00000000;
  ixStepBegin = $00000001;
  ixStepCreatingIndex = $00000002;
  ixStepCheckingFiles = $00000003;
  ixStepReadingFiles = $00000004;
  ixStepStoringWords = $00000005;
  ixStepMerging = $00000006;
  ixStepCompressing = $00000007;
  ixStepDone = $00000008;

// Constants for enum __MIDL___MIDL_itf_dten600_0252_0002
type
  __MIDL___MIDL_itf_dten600_0252_0002 = TOleEnum;
const
  stSortDescending = $00000000;
  stSortAscending = $00000002;
  stSortByName = $00000004;
  stSortByDate = $00000008;
  stSortByHits = $00000010;
  stSortBySize = $00000020;
  stSortByUserField = $00000040;
  stSortByIndex = $00000080;
  stSortByType = $00000100;
  stSortByTitle = $00000200;
  stSortByLocation = $00000400;
  stSortByTime = $00000800;
  stSortCaseInsensitive = $00010000;
  stSortNumeric = $00020000;

// Constants for enum __MIDL___MIDL_itf_dten600_0252_0003
type
  __MIDL___MIDL_itf_dten600_0252_0003 = TOleEnum;
const
  dtsCpMakeVirtual = $00000001;
  dtsCpMakeLocal = $00000002;
  dtsCpUseOReillyMappings = $00000004;
  dtsCpMakeUNC = $00000008;
  dtsCpRefreshMappings = $00000010;
  dtsCpStoreInRegistry = $00000020;
  dtsCpReadFromRegistry = $00000040;

// Constants for enum __MIDL___MIDL_itf_dten600_0252_0004
type
  __MIDL___MIDL_itf_dten600_0252_0004 = TOleEnum;
const
  itHTML = $000000E2;
  itAnsi = $000000CA;
  itRTF = $000000D4;

// Constants for enum __MIDL___MIDL_itf_dten600_0252_0005
type
  __MIDL___MIDL_itf_dten600_0252_0005 = TOleEnum;
const
  dtsErAccIndex = $00000001;
  dtsAskDiskFullOverride = $00000002;
  dtsErOpenTemp = $00000003;
  dtsInfNoFilesToIndex = $00000004;
  dtsErIxWrongVersion = $00000005;
  dtsErIxInterrupted = $00000006;
  dtsErAccDirectory = $00000007;
  dtsErWorkDirFail = $00000008;
  dtsErAccFile = $00000009;
  dtsErFileCorrupt = $0000000A;
  dtsErIndexFull = $0000000B;
  dtsErPdfLzwNotLicensed = $0000000C;
  dtsErTimeout = $0000000D;
  dtsErBadRequest = $00000074;
  dtsErNoFilesRetrieved = $0000007A;
  dtsErMaxWords = $00000089;
  dtsErDiskFull = $0000009F;

// Constants for enum __MIDL___MIDL_itf_dten600_0252_0006
type
  __MIDL___MIDL_itf_dten600_0252_0006 = TOleEnum;
const
  dtsSearchFuzzy = $00000001;
  dtsSearchPhonic = $00000002;
  dtsSearchStemming = $00000004;
  dtsSearchNatural = $00000008;
  dtsSearchSynonyms = $00000010;
  dtsSearchUserSynonyms = $00000020;
  dtsSearchWordNetSynonyms = $00000040;
  dtsSearchWordNetRelated = $00000080;
  dtsSearchAllSynonyms = $000000F0;
  dtsSearchWantHitsByWord = $00000100;
  dtsSearchNoDocInfo = $00000200;
  dtsSearchWantHitsByWord2 = $00000400;
  dtsSearchDelayDocInfo = $00001000;
  dtsSearchExternalSynonyms = $00002000;
  dtsSearchRegularExpression = $00004000;
  dtsSearchWantHitDetails = $00008000;

// Constants for enum __MIDL___MIDL_itf_dten600_0252_0007
type
  __MIDL___MIDL_itf_dten600_0252_0007 = TOleEnum;
const
  dtsConvertInputIsHtml = $00000001;
  dtsConvertSkipHiddenHits = $00000002;

// Constants for enum __MIDL___MIDL_itf_dten600_0252_0008
type
  __MIDL___MIDL_itf_dten600_0252_0008 = TOleEnum;
const
  dtsLogTime = $00000001;
  dtsLogCommit = $00000002;
  dtsLogAppend = $00000004;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IServer = interface;
  IServerDisp = dispinterface;
  IJobErrorInfo = interface;
  IJobErrorInfoDisp = dispinterface;
  IIndexJob = interface;
  IIndexJobDisp = dispinterface;
  ISearchJob = interface;
  ISearchJobDisp = dispinterface;
  IFileConverter = interface;
  IFileConverterDisp = dispinterface;
  ISearchReportJob = interface;
  ISearchReportJobDisp = dispinterface;
  IOptions = interface;
  IOptionsDisp = dispinterface;
  IWordListBuilder = interface;
  IWordListBuilderDisp = dispinterface;
  ISearchResults = interface;
  ISearchResultsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Server = IServer;
  JobErrorInfo = IJobErrorInfo;
  IndexJob = IIndexJob;
  SearchJob = ISearchJob;
  FileConverter = IFileConverter;
  SearchReportJob = ISearchReportJob;
  Options = IOptions;
  WordListBuilder = IWordListBuilder;
  SearchResults = ISearchResults;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}

  BuildNumberEnum = __MIDL___MIDL_itf_dten600_0252_0001; 
  SortType = __MIDL___MIDL_itf_dten600_0252_0002; 
  ConvertPathFlags = __MIDL___MIDL_itf_dten600_0252_0003; 
  OutputFormat = __MIDL___MIDL_itf_dten600_0252_0004; 
  ErrorCode = __MIDL___MIDL_itf_dten600_0252_0005; 
  SearchFlag = __MIDL___MIDL_itf_dten600_0252_0006; 
  ConvertFlags = __MIDL___MIDL_itf_dten600_0252_0007; 
  DebugLogFlags = __MIDL___MIDL_itf_dten600_0252_0008; 

// *********************************************************************//
// Interface: IServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A967E5D1-B0E1-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IServer = interface(IDispatch)
    ['{A967E5D1-B0E1-11D3-B57C-00105AA461D0}']
    function  Get_DebugLogName: WideString; safecall;
    procedure Set_DebugLogName(const pVal: WideString); safecall;
    function  Get_HomeDir: WideString; safecall;
    procedure Set_HomeDir(const pVal: WideString); safecall;
    function  Get_PrivateDir: WideString; safecall;
    procedure Set_PrivateDir(const pVal: WideString); safecall;
    procedure Set_SendTestError(Param1: WordBool); safecall;
    procedure Set_SendTestInfo(Param1: WordBool); safecall;
    procedure Set_SendTestQuestion(Param1: WordBool); safecall;
    function  Get_MajorVersion: Smallint; safecall;
    function  Get_MinorVersion: Smallint; safecall;
    function  Get_Build: Integer; safecall;
    function  Get_Initialized: WordBool; safecall;
    function  Get_InitMessage: WideString; safecall;
    procedure Set_LzwEnableCode(Param1: Integer); safecall;
    function  Get_Errors: IDispatch; safecall;
    function  Get_MessageHandler: IDispatch; safecall;
    procedure Set_MessageHandler(const pVal: IDispatch); safecall;
    function  Initialize: WordBool; safecall;
    procedure Shutdown; safecall;
    function  Get_AllocatedObjectList: WideString; safecall;
    function  NewIndexJob: IDispatch; safecall;
    function  NewSearchJob: IDispatch; safecall;
    function  NewOptions: IDispatch; safecall;
    function  NewFileConverter: IDispatch; safecall;
    function  NewWordListBuilder: IDispatch; safecall;
    function  ConvertPath(const path: WideString; siteId: Integer; flags: Integer; 
                          const tableLocation: WideString): WideString; safecall;
    procedure SetDebugLogging(const LogName: WideString; flags: Integer); safecall;
    property DebugLogName: WideString read Get_DebugLogName write Set_DebugLogName;
    property HomeDir: WideString read Get_HomeDir write Set_HomeDir;
    property PrivateDir: WideString read Get_PrivateDir write Set_PrivateDir;
    property SendTestError: WordBool write Set_SendTestError;
    property SendTestInfo: WordBool write Set_SendTestInfo;
    property SendTestQuestion: WordBool write Set_SendTestQuestion;
    property MajorVersion: Smallint read Get_MajorVersion;
    property MinorVersion: Smallint read Get_MinorVersion;
    property Build: Integer read Get_Build;
    property Initialized: WordBool read Get_Initialized;
    property InitMessage: WideString read Get_InitMessage;
    property LzwEnableCode: Integer write Set_LzwEnableCode;
    property Errors: IDispatch read Get_Errors;
    property MessageHandler: IDispatch read Get_MessageHandler write Set_MessageHandler;
    property AllocatedObjectList: WideString read Get_AllocatedObjectList;
  end;

// *********************************************************************//
// DispIntf:  IServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A967E5D1-B0E1-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IServerDisp = dispinterface
    ['{A967E5D1-B0E1-11D3-B57C-00105AA461D0}']
    property DebugLogName: WideString dispid 1;
    property HomeDir: WideString dispid 2;
    property PrivateDir: WideString dispid 3;
    property SendTestError: WordBool writeonly dispid 4;
    property SendTestInfo: WordBool writeonly dispid 5;
    property SendTestQuestion: WordBool writeonly dispid 6;
    property MajorVersion: Smallint readonly dispid 7;
    property MinorVersion: Smallint readonly dispid 8;
    property Build: Integer readonly dispid 9;
    property Initialized: WordBool readonly dispid 10;
    property InitMessage: WideString readonly dispid 11;
    property LzwEnableCode: Integer writeonly dispid 13;
    property Errors: IDispatch readonly dispid 14;
    property MessageHandler: IDispatch dispid 16;
    function  Initialize: WordBool; dispid 17;
    procedure Shutdown; dispid 18;
    property AllocatedObjectList: WideString readonly dispid 19;
    function  NewIndexJob: IDispatch; dispid 20;
    function  NewSearchJob: IDispatch; dispid 21;
    function  NewOptions: IDispatch; dispid 22;
    function  NewFileConverter: IDispatch; dispid 23;
    function  NewWordListBuilder: IDispatch; dispid 24;
    function  ConvertPath(const path: WideString; siteId: Integer; flags: Integer; 
                          const tableLocation: WideString): WideString; dispid 25;
    procedure SetDebugLogging(const LogName: WideString; flags: Integer); dispid 26;
  end;

// *********************************************************************//
// Interface: IJobErrorInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A967E5D5-B0E1-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IJobErrorInfo = interface(IDispatch)
    ['{A967E5D5-B0E1-11D3-B57C-00105AA461D0}']
    function  Get_Count: Integer; safecall;
    function  Get_Message(iMessage: Integer): WideString; safecall;
    function  Get_Code(iMessage: Integer): Integer; safecall;
    function  Get_Arg1(iMessage: Integer): WideString; safecall;
    function  Get_Arg2(iMessage: Integer): WideString; safecall;
    function  Format: WideString; safecall;
    property Count: Integer read Get_Count;
    property Message[iMessage: Integer]: WideString read Get_Message;
    property Code[iMessage: Integer]: Integer read Get_Code;
    property Arg1[iMessage: Integer]: WideString read Get_Arg1;
    property Arg2[iMessage: Integer]: WideString read Get_Arg2;
  end;

// *********************************************************************//
// DispIntf:  IJobErrorInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A967E5D5-B0E1-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IJobErrorInfoDisp = dispinterface
    ['{A967E5D5-B0E1-11D3-B57C-00105AA461D0}']
    property Count: Integer readonly dispid 1;
    property Message[iMessage: Integer]: WideString readonly dispid 2;
    property Code[iMessage: Integer]: Integer readonly dispid 3;
    property Arg1[iMessage: Integer]: WideString readonly dispid 4;
    property Arg2[iMessage: Integer]: WideString readonly dispid 5;
    function  Format: WideString; dispid 6;
  end;

// *********************************************************************//
// Interface: IIndexJob
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF022-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IIndexJob = interface(IDispatch)
    ['{697DF022-B24E-11D3-B57C-00105AA461D0}']
    function  Get_ActionAdd: WordBool; safecall;
    procedure Set_ActionAdd(pVal: WordBool); safecall;
    function  Get_ActionCompress: WordBool; safecall;
    procedure Set_ActionCompress(pVal: WordBool); safecall;
    function  Get_ActionCreate: WordBool; safecall;
    procedure Set_ActionCreate(pVal: WordBool); safecall;
    function  Get_ActionRemoveDeleted: WordBool; safecall;
    procedure Set_ActionRemoveDeleted(pVal: WordBool); safecall;
    function  Get_ActionRemoveListed: WordBool; safecall;
    procedure Set_ActionRemoveListed(pVal: WordBool); safecall;
    function  Get_AllowConcurrentAccess: WordBool; safecall;
    procedure Set_AllowConcurrentAccess(pVal: WordBool); safecall;
    function  Get_CreateAccentSensitive: WordBool; safecall;
    procedure Set_CreateAccentSensitive(pVal: WordBool); safecall;
    function  Get_CreateCaseSensitive: WordBool; safecall;
    procedure Set_CreateCaseSensitive(pVal: WordBool); safecall;
    procedure Set_DataSourceToIndex(const Param1: IDispatch); safecall;
    function  Get_IndexName: WideString; safecall;
    procedure Set_IndexName(const pVal: WideString); safecall;
    function  Get_IndexPath: WideString; safecall;
    procedure Set_IndexPath(const pVal: WideString); safecall;
    procedure Set_StatusHandler(const Param1: IDispatch); safecall;
    function  Get_StoredFields: WideString; safecall;
    procedure Set_StoredFields(const pVal: WideString); safecall;
    function  Get_ToAddDir: WideString; safecall;
    procedure Set_ToAddDir(const pVal: WideString); safecall;
    function  Get_ToAddDirListName: WideString; safecall;
    procedure Set_ToAddDirListName(const pVal: WideString); safecall;
    function  Get_ToAddExcludeFilters: WideString; safecall;
    procedure Set_ToAddExcludeFilters(const pVal: WideString); safecall;
    function  Get_ToAddFileListName: WideString; safecall;
    procedure Set_ToAddFileListName(const pVal: WideString); safecall;
    function  Get_ToAddIncludeFilters: WideString; safecall;
    procedure Set_ToAddIncludeFilters(const pVal: WideString); safecall;
    function  Get_ToRemoveListName: WideString; safecall;
    procedure Set_ToRemoveListName(const pVal: WideString); safecall;
    function  Get_IsThreadDone: WordBool; safecall;
    function  Get_Errors: IDispatch; safecall;
    function  Get_StatusIndexingStep: Integer; safecall;
    function  Get_StatusPercentDone: Integer; safecall;
    function  Get_StatusCurrentFileLocation: WideString; safecall;
    function  Get_StatusCurrentFileName: WideString; safecall;
    function  Get_StatusCurrentFileType: WideString; safecall;
    function  Get_StatusDiskAvailKB: Integer; safecall;
    function  Get_StatusWordsInIndex: Integer; safecall;
    function  Get_StatusDocsInIndex: Integer; safecall;
    function  Get_StatusBytesIndexedKB: Integer; safecall;
    function  Get_StatusBytesToIndexKB: Integer; safecall;
    function  Get_StatusCurrentFilePercentDone: Integer; safecall;
    function  Execute: Smallint; safecall;
    procedure ExecuteInThread; safecall;
    procedure AbortThread; safecall;
    procedure AbortThreadImmediate; safecall;
    function  Get_CreateAddToLibrary: WordBool; safecall;
    procedure Set_CreateAddToLibrary(pVal: WordBool); safecall;
    function  Get_CreateRelativePaths: WordBool; safecall;
    procedure Set_CreateRelativePaths(pVal: WordBool); safecall;
    property ActionAdd: WordBool read Get_ActionAdd write Set_ActionAdd;
    property ActionCompress: WordBool read Get_ActionCompress write Set_ActionCompress;
    property ActionCreate: WordBool read Get_ActionCreate write Set_ActionCreate;
    property ActionRemoveDeleted: WordBool read Get_ActionRemoveDeleted write Set_ActionRemoveDeleted;
    property ActionRemoveListed: WordBool read Get_ActionRemoveListed write Set_ActionRemoveListed;
    property AllowConcurrentAccess: WordBool read Get_AllowConcurrentAccess write Set_AllowConcurrentAccess;
    property CreateAccentSensitive: WordBool read Get_CreateAccentSensitive write Set_CreateAccentSensitive;
    property CreateCaseSensitive: WordBool read Get_CreateCaseSensitive write Set_CreateCaseSensitive;
    property DataSourceToIndex: IDispatch write Set_DataSourceToIndex;
    property IndexName: WideString read Get_IndexName write Set_IndexName;
    property IndexPath: WideString read Get_IndexPath write Set_IndexPath;
    property StatusHandler: IDispatch write Set_StatusHandler;
    property StoredFields: WideString read Get_StoredFields write Set_StoredFields;
    property ToAddDir: WideString read Get_ToAddDir write Set_ToAddDir;
    property ToAddDirListName: WideString read Get_ToAddDirListName write Set_ToAddDirListName;
    property ToAddExcludeFilters: WideString read Get_ToAddExcludeFilters write Set_ToAddExcludeFilters;
    property ToAddFileListName: WideString read Get_ToAddFileListName write Set_ToAddFileListName;
    property ToAddIncludeFilters: WideString read Get_ToAddIncludeFilters write Set_ToAddIncludeFilters;
    property ToRemoveListName: WideString read Get_ToRemoveListName write Set_ToRemoveListName;
    property IsThreadDone: WordBool read Get_IsThreadDone;
    property Errors: IDispatch read Get_Errors;
    property StatusIndexingStep: Integer read Get_StatusIndexingStep;
    property StatusPercentDone: Integer read Get_StatusPercentDone;
    property StatusCurrentFileLocation: WideString read Get_StatusCurrentFileLocation;
    property StatusCurrentFileName: WideString read Get_StatusCurrentFileName;
    property StatusCurrentFileType: WideString read Get_StatusCurrentFileType;
    property StatusDiskAvailKB: Integer read Get_StatusDiskAvailKB;
    property StatusWordsInIndex: Integer read Get_StatusWordsInIndex;
    property StatusDocsInIndex: Integer read Get_StatusDocsInIndex;
    property StatusBytesIndexedKB: Integer read Get_StatusBytesIndexedKB;
    property StatusBytesToIndexKB: Integer read Get_StatusBytesToIndexKB;
    property StatusCurrentFilePercentDone: Integer read Get_StatusCurrentFilePercentDone;
    property CreateAddToLibrary: WordBool read Get_CreateAddToLibrary write Set_CreateAddToLibrary;
    property CreateRelativePaths: WordBool read Get_CreateRelativePaths write Set_CreateRelativePaths;
  end;

// *********************************************************************//
// DispIntf:  IIndexJobDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF022-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IIndexJobDisp = dispinterface
    ['{697DF022-B24E-11D3-B57C-00105AA461D0}']
    property ActionAdd: WordBool dispid 2;
    property ActionCompress: WordBool dispid 3;
    property ActionCreate: WordBool dispid 4;
    property ActionRemoveDeleted: WordBool dispid 5;
    property ActionRemoveListed: WordBool dispid 6;
    property AllowConcurrentAccess: WordBool dispid 7;
    property CreateAccentSensitive: WordBool dispid 8;
    property CreateCaseSensitive: WordBool dispid 9;
    property DataSourceToIndex: IDispatch writeonly dispid 10;
    property IndexName: WideString dispid 11;
    property IndexPath: WideString dispid 12;
    property StatusHandler: IDispatch writeonly dispid 13;
    property StoredFields: WideString dispid 14;
    property ToAddDir: WideString dispid 15;
    property ToAddDirListName: WideString dispid 16;
    property ToAddExcludeFilters: WideString dispid 17;
    property ToAddFileListName: WideString dispid 18;
    property ToAddIncludeFilters: WideString dispid 19;
    property ToRemoveListName: WideString dispid 20;
    property IsThreadDone: WordBool readonly dispid 21;
    property Errors: IDispatch readonly dispid 22;
    property StatusIndexingStep: Integer readonly dispid 23;
    property StatusPercentDone: Integer readonly dispid 24;
    property StatusCurrentFileLocation: WideString readonly dispid 25;
    property StatusCurrentFileName: WideString readonly dispid 26;
    property StatusCurrentFileType: WideString readonly dispid 27;
    property StatusDiskAvailKB: Integer readonly dispid 28;
    property StatusWordsInIndex: Integer readonly dispid 29;
    property StatusDocsInIndex: Integer readonly dispid 30;
    property StatusBytesIndexedKB: Integer readonly dispid 31;
    property StatusBytesToIndexKB: Integer readonly dispid 32;
    property StatusCurrentFilePercentDone: Integer readonly dispid 33;
    function  Execute: Smallint; dispid 34;
    procedure ExecuteInThread; dispid 35;
    procedure AbortThread; dispid 36;
    procedure AbortThreadImmediate; dispid 37;
    property CreateAddToLibrary: WordBool dispid 38;
    property CreateRelativePaths: WordBool dispid 39;
  end;

// *********************************************************************//
// Interface: ISearchJob
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF024-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  ISearchJob = interface(IDispatch)
    ['{697DF024-B24E-11D3-B57C-00105AA461D0}']
    function  Get_DirListName: WideString; safecall;
    procedure Set_DirListName(const pVal: WideString); safecall;
    function  Get_DirToSearch: WideString; safecall;
    procedure Set_DirToSearch(const pVal: WideString); safecall;
    function  Get_ExcludeFilters: WideString; safecall;
    procedure Set_ExcludeFilters(const pVal: WideString); safecall;
    function  Get_FileCount: Integer; safecall;
    function  Get_HitCount: Integer; safecall;
    function  Get_Fuzziness: Integer; safecall;
    procedure Set_Fuzziness(pVal: Integer); safecall;
    function  Get_IncludeFilters: WideString; safecall;
    procedure Set_IncludeFilters(const pVal: WideString); safecall;
    function  Get_IndexesToSearch: WideString; safecall;
    procedure Set_IndexesToSearch(const pVal: WideString); safecall;
    function  Get_MaxFilesToRetrieve: Integer; safecall;
    procedure Set_MaxFilesToRetrieve(pVal: Integer); safecall;
    function  Get_NaturalLanguage: WordBool; safecall;
    procedure Set_NaturalLanguage(pVal: WordBool); safecall;
    function  Get_OutputListingHits: WordBool; safecall;
    procedure Set_OutputListingHits(pVal: WordBool); safecall;
    function  Get_PhonicSearching: WordBool; safecall;
    procedure Set_PhonicSearching(pVal: WordBool); safecall;
    function  Get_Request: WideString; safecall;
    procedure Set_Request(const pVal: WideString); safecall;
    function  Get_ResultsInMemory: WordBool; safecall;
    procedure Set_ResultsInMemory(pVal: WordBool); safecall;
    function  Get_StatusHandler: IDispatch; safecall;
    procedure Set_StatusHandler(const pVal: IDispatch); safecall;
    function  Get_Stemming: WordBool; safecall;
    procedure Set_Stemming(pVal: WordBool); safecall;
    function  Get_Synonyms: WordBool; safecall;
    procedure Set_Synonyms(pVal: WordBool); safecall;
    function  Get_UserSynonyms: WordBool; safecall;
    procedure Set_UserSynonyms(pVal: WordBool); safecall;
    function  Get_WordNetSynonyms: WordBool; safecall;
    procedure Set_WordNetSynonyms(pVal: WordBool); safecall;
    function  Get_WordNetRelated: WordBool; safecall;
    procedure Set_WordNetRelated(pVal: WordBool); safecall;
    function  Get_Results: IDispatch; safecall;
    function  Get_IsThreadDone: WordBool; safecall;
    function  Get_Errors: IDispatch; safecall;
    function  Get_TimeoutSeconds: Integer; safecall;
    procedure Set_TimeoutSeconds(pVal: Integer); safecall;
    function  Get_DelayDocInfo: WordBool; safecall;
    procedure Set_DelayDocInfo(pVal: WordBool); safecall;
    function  Get_RegularExpression: WordBool; safecall;
    procedure Set_RegularExpression(pVal: WordBool); safecall;
    function  Get_SearchFlags: Integer; safecall;
    procedure Set_SearchFlags(pVal: Integer); safecall;
    function  Execute: Smallint; safecall;
    procedure ExecuteInThread; safecall;
    procedure AbortThread; safecall;
    function  Get_OutputListingName: WideString; safecall;
    procedure Set_OutputListingName(const pVal: WideString); safecall;
    function  Get_ExternalSynonyms: WordBool; safecall;
    procedure Set_ExternalSynonyms(pVal: WordBool); safecall;
    function  Get_FileConditions: WideString; safecall;
    procedure Set_FileConditions(const pVal: WideString); safecall;
    property DirListName: WideString read Get_DirListName write Set_DirListName;
    property DirToSearch: WideString read Get_DirToSearch write Set_DirToSearch;
    property ExcludeFilters: WideString read Get_ExcludeFilters write Set_ExcludeFilters;
    property FileCount: Integer read Get_FileCount;
    property HitCount: Integer read Get_HitCount;
    property Fuzziness: Integer read Get_Fuzziness write Set_Fuzziness;
    property IncludeFilters: WideString read Get_IncludeFilters write Set_IncludeFilters;
    property IndexesToSearch: WideString read Get_IndexesToSearch write Set_IndexesToSearch;
    property MaxFilesToRetrieve: Integer read Get_MaxFilesToRetrieve write Set_MaxFilesToRetrieve;
    property NaturalLanguage: WordBool read Get_NaturalLanguage write Set_NaturalLanguage;
    property OutputListingHits: WordBool read Get_OutputListingHits write Set_OutputListingHits;
    property PhonicSearching: WordBool read Get_PhonicSearching write Set_PhonicSearching;
    property Request: WideString read Get_Request write Set_Request;
    property ResultsInMemory: WordBool read Get_ResultsInMemory write Set_ResultsInMemory;
    property StatusHandler: IDispatch read Get_StatusHandler write Set_StatusHandler;
    property Stemming: WordBool read Get_Stemming write Set_Stemming;
    property Synonyms: WordBool read Get_Synonyms write Set_Synonyms;
    property UserSynonyms: WordBool read Get_UserSynonyms write Set_UserSynonyms;
    property WordNetSynonyms: WordBool read Get_WordNetSynonyms write Set_WordNetSynonyms;
    property WordNetRelated: WordBool read Get_WordNetRelated write Set_WordNetRelated;
    property Results: IDispatch read Get_Results;
    property IsThreadDone: WordBool read Get_IsThreadDone;
    property Errors: IDispatch read Get_Errors;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property DelayDocInfo: WordBool read Get_DelayDocInfo write Set_DelayDocInfo;
    property RegularExpression: WordBool read Get_RegularExpression write Set_RegularExpression;
    property SearchFlags: Integer read Get_SearchFlags write Set_SearchFlags;
    property OutputListingName: WideString read Get_OutputListingName write Set_OutputListingName;
    property ExternalSynonyms: WordBool read Get_ExternalSynonyms write Set_ExternalSynonyms;
    property FileConditions: WideString read Get_FileConditions write Set_FileConditions;
  end;

// *********************************************************************//
// DispIntf:  ISearchJobDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF024-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  ISearchJobDisp = dispinterface
    ['{697DF024-B24E-11D3-B57C-00105AA461D0}']
    property DirListName: WideString dispid 1;
    property DirToSearch: WideString dispid 2;
    property ExcludeFilters: WideString dispid 3;
    property FileCount: Integer readonly dispid 4;
    property HitCount: Integer readonly dispid 5;
    property Fuzziness: Integer dispid 6;
    property IncludeFilters: WideString dispid 7;
    property IndexesToSearch: WideString dispid 8;
    property MaxFilesToRetrieve: Integer dispid 9;
    property NaturalLanguage: WordBool dispid 10;
    property OutputListingHits: WordBool dispid 11;
    property PhonicSearching: WordBool dispid 12;
    property Request: WideString dispid 13;
    property ResultsInMemory: WordBool dispid 14;
    property StatusHandler: IDispatch dispid 15;
    property Stemming: WordBool dispid 16;
    property Synonyms: WordBool dispid 17;
    property UserSynonyms: WordBool dispid 18;
    property WordNetSynonyms: WordBool dispid 19;
    property WordNetRelated: WordBool dispid 20;
    property Results: IDispatch readonly dispid 21;
    property IsThreadDone: WordBool readonly dispid 22;
    property Errors: IDispatch readonly dispid 23;
    property TimeoutSeconds: Integer dispid 24;
    property DelayDocInfo: WordBool dispid 25;
    property RegularExpression: WordBool dispid 26;
    property SearchFlags: Integer dispid 27;
    function  Execute: Smallint; dispid 28;
    procedure ExecuteInThread; dispid 29;
    procedure AbortThread; dispid 30;
    property OutputListingName: WideString dispid 31;
    property ExternalSynonyms: WordBool dispid 32;
    property FileConditions: WideString dispid 33;
  end;

// *********************************************************************//
// Interface: IFileConverter
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF026-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IFileConverter = interface(IDispatch)
    ['{697DF026-B24E-11D3-B57C-00105AA461D0}']
    function  Get_InputFile: WideString; safecall;
    procedure Set_InputFile(const pVal: WideString); safecall;
    function  Get_OutputFile: WideString; safecall;
    procedure Set_OutputFile(const pVal: WideString); safecall;
    function  Get_OutputFormat: Integer; safecall;
    procedure Set_OutputFormat(pVal: Integer); safecall;
    function  Get_BeforeHit: WideString; safecall;
    procedure Set_BeforeHit(const pVal: WideString); safecall;
    function  Get_AfterHit: WideString; safecall;
    procedure Set_AfterHit(const pVal: WideString); safecall;
    function  Get_Footer: WideString; safecall;
    procedure Set_Footer(const pVal: WideString); safecall;
    function  Get_Hits: WideString; safecall;
    procedure Set_Hits(const pVal: WideString); safecall;
    function  Get_Errors: IDispatch; safecall;
    function  Get_BaseHRef: WideString; safecall;
    procedure Set_BaseHRef(const pVal: WideString); safecall;
    function  Get_OutputToString: WordBool; safecall;
    procedure Set_OutputToString(pVal: WordBool); safecall;
    function  Get_OutputStringMaxSize: Integer; safecall;
    procedure Set_OutputStringMaxSize(pVal: Integer); safecall;
    function  Get_OutputString: WideString; safecall;
    function  Get_TimeoutSeconds: Integer; safecall;
    procedure Set_TimeoutSeconds(pVal: Integer); safecall;
    function  Get_AlphabetLocation: WideString; safecall;
    procedure Set_AlphabetLocation(const pVal: WideString); safecall;
    function  Get_flags: Integer; safecall;
    procedure Set_flags(pVal: Integer); safecall;
    procedure Execute; safecall;
    function  Get_Header: WideString; safecall;
    procedure Set_Header(const pVal: WideString); safecall;
    property InputFile: WideString read Get_InputFile write Set_InputFile;
    property OutputFile: WideString read Get_OutputFile write Set_OutputFile;
    property OutputFormat: Integer read Get_OutputFormat write Set_OutputFormat;
    property BeforeHit: WideString read Get_BeforeHit write Set_BeforeHit;
    property AfterHit: WideString read Get_AfterHit write Set_AfterHit;
    property Footer: WideString read Get_Footer write Set_Footer;
    property Hits: WideString read Get_Hits write Set_Hits;
    property Errors: IDispatch read Get_Errors;
    property BaseHRef: WideString read Get_BaseHRef write Set_BaseHRef;
    property OutputToString: WordBool read Get_OutputToString write Set_OutputToString;
    property OutputStringMaxSize: Integer read Get_OutputStringMaxSize write Set_OutputStringMaxSize;
    property OutputString: WideString read Get_OutputString;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property AlphabetLocation: WideString read Get_AlphabetLocation write Set_AlphabetLocation;
    property flags: Integer read Get_flags write Set_flags;
    property Header: WideString read Get_Header write Set_Header;
  end;

// *********************************************************************//
// DispIntf:  IFileConverterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF026-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IFileConverterDisp = dispinterface
    ['{697DF026-B24E-11D3-B57C-00105AA461D0}']
    property InputFile: WideString dispid 1;
    property OutputFile: WideString dispid 2;
    property OutputFormat: Integer dispid 3;
    property BeforeHit: WideString dispid 4;
    property AfterHit: WideString dispid 5;
    property Footer: WideString dispid 6;
    property Hits: WideString dispid 7;
    property Errors: IDispatch readonly dispid 8;
    property BaseHRef: WideString dispid 9;
    property OutputToString: WordBool dispid 10;
    property OutputStringMaxSize: Integer dispid 11;
    property OutputString: WideString readonly dispid 12;
    property TimeoutSeconds: Integer dispid 13;
    property AlphabetLocation: WideString dispid 14;
    property flags: Integer dispid 15;
    procedure Execute; dispid 16;
    property Header: WideString dispid 17;
  end;

// *********************************************************************//
// Interface: ISearchReportJob
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF028-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  ISearchReportJob = interface(IDispatch)
    ['{697DF028-B24E-11D3-B57C-00105AA461D0}']
    function  Get_BeforeHit: WideString; safecall;
    procedure Set_BeforeHit(const pVal: WideString); safecall;
    function  Get_AfterHit: WideString; safecall;
    procedure Set_AfterHit(const pVal: WideString); safecall;
    function  Get_Header: WideString; safecall;
    procedure Set_Header(const pVal: WideString); safecall;
    function  Get_Footer: WideString; safecall;
    procedure Set_Footer(const pVal: WideString); safecall;
    function  Get_FileHeader: WideString; safecall;
    procedure Set_FileHeader(const pVal: WideString); safecall;
    function  Get_ContextHeader: WideString; safecall;
    procedure Set_ContextHeader(const pVal: WideString); safecall;
    function  Get_WordsOfContext: Integer; safecall;
    procedure Set_WordsOfContext(pVal: Integer); safecall;
    function  Get_ParagraphsOfContext: Integer; safecall;
    procedure Set_ParagraphsOfContext(pVal: Integer); safecall;
    function  Get_Errors: IDispatch; safecall;
    function  Get_OutputFormat: Integer; safecall;
    procedure Set_OutputFormat(pVal: Integer); safecall;
    function  Get_OutputFile: WideString; safecall;
    procedure Set_OutputFile(const pVal: WideString); safecall;
    function  Get_TimeoutSeconds: Integer; safecall;
    procedure Set_TimeoutSeconds(pVal: Integer); safecall;
    function  Get_OutputString: WideString; safecall;
    function  Get_OutputStringMaxSize: Integer; safecall;
    procedure Set_OutputStringMaxSize(pVal: Integer); safecall;
    procedure Execute; safecall;
    procedure SelectItems(iFirstItem: Integer; iLastItem: Integer); safecall;
    procedure ClearSelections; safecall;
    procedure SelectAll; safecall;
    function  Get_OutputToString: WordBool; safecall;
    procedure Set_OutputToString(pVal: WordBool); safecall;
    function  Get_FileFooter: WideString; safecall;
    procedure Set_FileFooter(const pVal: WideString); safecall;
    property BeforeHit: WideString read Get_BeforeHit write Set_BeforeHit;
    property AfterHit: WideString read Get_AfterHit write Set_AfterHit;
    property Header: WideString read Get_Header write Set_Header;
    property Footer: WideString read Get_Footer write Set_Footer;
    property FileHeader: WideString read Get_FileHeader write Set_FileHeader;
    property ContextHeader: WideString read Get_ContextHeader write Set_ContextHeader;
    property WordsOfContext: Integer read Get_WordsOfContext write Set_WordsOfContext;
    property ParagraphsOfContext: Integer read Get_ParagraphsOfContext write Set_ParagraphsOfContext;
    property Errors: IDispatch read Get_Errors;
    property OutputFormat: Integer read Get_OutputFormat write Set_OutputFormat;
    property OutputFile: WideString read Get_OutputFile write Set_OutputFile;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property OutputString: WideString read Get_OutputString;
    property OutputStringMaxSize: Integer read Get_OutputStringMaxSize write Set_OutputStringMaxSize;
    property OutputToString: WordBool read Get_OutputToString write Set_OutputToString;
    property FileFooter: WideString read Get_FileFooter write Set_FileFooter;
  end;

// *********************************************************************//
// DispIntf:  ISearchReportJobDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF028-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  ISearchReportJobDisp = dispinterface
    ['{697DF028-B24E-11D3-B57C-00105AA461D0}']
    property BeforeHit: WideString dispid 1;
    property AfterHit: WideString dispid 2;
    property Header: WideString dispid 3;
    property Footer: WideString dispid 4;
    property FileHeader: WideString dispid 5;
    property ContextHeader: WideString dispid 6;
    property WordsOfContext: Integer dispid 7;
    property ParagraphsOfContext: Integer dispid 8;
    property Errors: IDispatch readonly dispid 9;
    property OutputFormat: Integer dispid 10;
    property OutputFile: WideString dispid 11;
    property TimeoutSeconds: Integer dispid 12;
    property OutputString: WideString readonly dispid 13;
    property OutputStringMaxSize: Integer dispid 14;
    procedure Execute; dispid 15;
    procedure SelectItems(iFirstItem: Integer; iLastItem: Integer); dispid 16;
    procedure ClearSelections; dispid 17;
    procedure SelectAll; dispid 18;
    property OutputToString: WordBool dispid 19;
    property FileFooter: WideString dispid 20;
  end;

// *********************************************************************//
// Interface: IOptions
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF02A-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IOptions = interface(IDispatch)
    ['{697DF02A-B24E-11D3-B57C-00105AA461D0}']
    function  Get_BinaryFiles: Integer; safecall;
    procedure Set_BinaryFiles(pVal: Integer); safecall;
    function  Get_Hyphens: Integer; safecall;
    procedure Set_Hyphens(pVal: Integer); safecall;
    function  Get_IndexNumbers: WordBool; safecall;
    procedure Set_IndexNumbers(pVal: WordBool); safecall;
    function  Get_AlphabetName: WideString; safecall;
    procedure Set_AlphabetName(const pVal: WideString); safecall;
    function  Get_BinaryFilterTextChars: WideString; safecall;
    procedure Set_BinaryFilterTextChars(const pVal: WideString); safecall;
    function  Get_StemmingRulesFile: WideString; safecall;
    procedure Set_StemmingRulesFile(const pVal: WideString); safecall;
    function  Get_NoiseWordFile: WideString; safecall;
    procedure Set_NoiseWordFile(const pVal: WideString); safecall;
    function  Get_MaxWordsToRetrieve: Integer; safecall;
    procedure Set_MaxWordsToRetrieve(pVal: Integer); safecall;
    function  Get_MaxStoredFieldSize: Integer; safecall;
    procedure Set_MaxStoredFieldSize(pVal: Integer); safecall;
    function  Get_TitleSize: Integer; safecall;
    procedure Set_TitleSize(pVal: Integer); safecall;
    function  Get_XmlIgnoreTags: WideString; safecall;
    procedure Set_XmlIgnoreTags(const pVal: WideString); safecall;
    procedure Save; safecall;
    function  Get_MaxWordLength: Integer; safecall;
    procedure Set_MaxWordLength(pVal: Integer); safecall;
    function  Get_SegmentationRulesFile: WideString; safecall;
    procedure Set_SegmentationRulesFile(const pVal: WideString); safecall;
    function  Get_TextFieldsFile: WideString; safecall;
    procedure Set_TextFieldsFile(const pVal: WideString); safecall;
    function  Get_UserThesaurusFile: WideString; safecall;
    procedure Set_UserThesaurusFile(const pVal: WideString); safecall;
    function  Get_HomeDir: WideString; safecall;
    procedure Set_HomeDir(const pVal: WideString); safecall;
    function  Get_PrivateDir: WideString; safecall;
    procedure Set_PrivateDir(const pVal: WideString); safecall;
    function  Get_BooleanConnectors: WideString; safecall;
    procedure Set_BooleanConnectors(const pVal: WideString); safecall;
    function  Get_FileTypeTableFile: WideString; safecall;
    procedure Set_FileTypeTableFile(const pVal: WideString); safecall;
    function  Get_UpdateFiles: WordBool; safecall;
    procedure Set_UpdateFiles(pVal: WordBool); safecall;
    function  Get_LzwEnableCode: Integer; safecall;
    procedure Set_LzwEnableCode(pVal: Integer); safecall;
    property BinaryFiles: Integer read Get_BinaryFiles write Set_BinaryFiles;
    property Hyphens: Integer read Get_Hyphens write Set_Hyphens;
    property IndexNumbers: WordBool read Get_IndexNumbers write Set_IndexNumbers;
    property AlphabetName: WideString read Get_AlphabetName write Set_AlphabetName;
    property BinaryFilterTextChars: WideString read Get_BinaryFilterTextChars write Set_BinaryFilterTextChars;
    property StemmingRulesFile: WideString read Get_StemmingRulesFile write Set_StemmingRulesFile;
    property NoiseWordFile: WideString read Get_NoiseWordFile write Set_NoiseWordFile;
    property MaxWordsToRetrieve: Integer read Get_MaxWordsToRetrieve write Set_MaxWordsToRetrieve;
    property MaxStoredFieldSize: Integer read Get_MaxStoredFieldSize write Set_MaxStoredFieldSize;
    property TitleSize: Integer read Get_TitleSize write Set_TitleSize;
    property XmlIgnoreTags: WideString read Get_XmlIgnoreTags write Set_XmlIgnoreTags;
    property MaxWordLength: Integer read Get_MaxWordLength write Set_MaxWordLength;
    property SegmentationRulesFile: WideString read Get_SegmentationRulesFile write Set_SegmentationRulesFile;
    property TextFieldsFile: WideString read Get_TextFieldsFile write Set_TextFieldsFile;
    property UserThesaurusFile: WideString read Get_UserThesaurusFile write Set_UserThesaurusFile;
    property HomeDir: WideString read Get_HomeDir write Set_HomeDir;
    property PrivateDir: WideString read Get_PrivateDir write Set_PrivateDir;
    property BooleanConnectors: WideString read Get_BooleanConnectors write Set_BooleanConnectors;
    property FileTypeTableFile: WideString read Get_FileTypeTableFile write Set_FileTypeTableFile;
    property UpdateFiles: WordBool read Get_UpdateFiles write Set_UpdateFiles;
    property LzwEnableCode: Integer read Get_LzwEnableCode write Set_LzwEnableCode;
  end;

// *********************************************************************//
// DispIntf:  IOptionsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF02A-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IOptionsDisp = dispinterface
    ['{697DF02A-B24E-11D3-B57C-00105AA461D0}']
    property BinaryFiles: Integer dispid 1;
    property Hyphens: Integer dispid 2;
    property IndexNumbers: WordBool dispid 3;
    property AlphabetName: WideString dispid 4;
    property BinaryFilterTextChars: WideString dispid 5;
    property StemmingRulesFile: WideString dispid 6;
    property NoiseWordFile: WideString dispid 7;
    property MaxWordsToRetrieve: Integer dispid 8;
    property MaxStoredFieldSize: Integer dispid 9;
    property TitleSize: Integer dispid 10;
    property XmlIgnoreTags: WideString dispid 11;
    procedure Save; dispid 12;
    property MaxWordLength: Integer dispid 13;
    property SegmentationRulesFile: WideString dispid 14;
    property TextFieldsFile: WideString dispid 15;
    property UserThesaurusFile: WideString dispid 16;
    property HomeDir: WideString dispid 17;
    property PrivateDir: WideString dispid 18;
    property BooleanConnectors: WideString dispid 19;
    property FileTypeTableFile: WideString dispid 20;
    property UpdateFiles: WordBool dispid 21;
    property LzwEnableCode: Integer dispid 22;
  end;

// *********************************************************************//
// Interface: IWordListBuilder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF02C-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IWordListBuilder = interface(IDispatch)
    ['{697DF02C-B24E-11D3-B57C-00105AA461D0}']
    function  Get_Count: Integer; safecall;
    function  OpenIndex(const IndexName: WideString): Integer; safecall;
    procedure CloseIndex; safecall;
    function  ListWords(const CursorWord: WideString; Range: Integer): Integer; safecall;
    function  GetNthWord(iWord: Integer): WideString; safecall;
    function  GetNthWordCount(iWord: Integer): Integer; safecall;
    function  GetNthWordField(iWord: Integer): WideString; safecall;
    function  ListMatchingWords(const toMatch: WideString; nLimit: Integer; SearchFlags: Integer; 
                                Fuzziness: Integer): Integer; safecall;
    procedure ListFields(var pVal: Integer); safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IWordListBuilderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {697DF02C-B24E-11D3-B57C-00105AA461D0}
// *********************************************************************//
  IWordListBuilderDisp = dispinterface
    ['{697DF02C-B24E-11D3-B57C-00105AA461D0}']
    property Count: Integer readonly dispid 1;
    function  OpenIndex(const IndexName: WideString): Integer; dispid 2;
    procedure CloseIndex; dispid 3;
    function  ListWords(const CursorWord: WideString; Range: Integer): Integer; dispid 4;
    function  GetNthWord(iWord: Integer): WideString; dispid 5;
    function  GetNthWordCount(iWord: Integer): Integer; dispid 6;
    function  GetNthWordField(iWord: Integer): WideString; dispid 7;
    function  ListMatchingWords(const toMatch: WideString; nLimit: Integer; SearchFlags: Integer; 
                                Fuzziness: Integer): Integer; dispid 8;
    procedure ListFields(var pVal: Integer); dispid 9;
  end;

// *********************************************************************//
// Interface: ISearchResults
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {798CBE34-B27D-11D3-B57C-00105AA461D0}
// *********************************************************************//
  ISearchResults = interface(IDispatch)
    ['{798CBE34-B27D-11D3-B57C-00105AA461D0}']
    function  Get_Count: Integer; safecall;
    function  Get_DocName: WideString; safecall;
    function  Get_DocHitCount: Integer; safecall;
    function  Get_DocDetails: WideString; safecall;
    function  Get_DocHits: WideString; safecall;
    function  Get_Request: WideString; safecall;
    function  Get_TotalHitCount: Integer; safecall;
    function  Get_HitByteOffsets: WideString; safecall;
    function  GetNthDoc(iDoc: Integer): WordBool; safecall;
    function  Get_DocDetailItem(const name: WideString): WideString; safecall;
    procedure Sort(flags: Integer; const fieldName: WideString); safecall;
    function  NewSearchReportJob: IDispatch; safecall;
    procedure MakePdfHighlightFile; safecall;
    function  MakePdfWebHighlightFile: WideString; safecall;
    property Count: Integer read Get_Count;
    property DocName: WideString read Get_DocName;
    property DocHitCount: Integer read Get_DocHitCount;
    property DocDetails: WideString read Get_DocDetails;
    property DocHits: WideString read Get_DocHits;
    property Request: WideString read Get_Request;
    property TotalHitCount: Integer read Get_TotalHitCount;
    property HitByteOffsets: WideString read Get_HitByteOffsets;
    property DocDetailItem[const name: WideString]: WideString read Get_DocDetailItem;
  end;

// *********************************************************************//
// DispIntf:  ISearchResultsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {798CBE34-B27D-11D3-B57C-00105AA461D0}
// *********************************************************************//
  ISearchResultsDisp = dispinterface
    ['{798CBE34-B27D-11D3-B57C-00105AA461D0}']
    property Count: Integer readonly dispid 1;
    property DocName: WideString readonly dispid 2;
    property DocHitCount: Integer readonly dispid 3;
    property DocDetails: WideString readonly dispid 4;
    property DocHits: WideString readonly dispid 5;
    property Request: WideString readonly dispid 6;
    property TotalHitCount: Integer readonly dispid 7;
    property HitByteOffsets: WideString readonly dispid 8;
    function  GetNthDoc(iDoc: Integer): WordBool; dispid 9;
    property DocDetailItem[const name: WideString]: WideString readonly dispid 10;
    procedure Sort(flags: Integer; const fieldName: WideString); dispid 11;
    function  NewSearchReportJob: IDispatch; dispid 12;
    procedure MakePdfHighlightFile; dispid 13;
    function  MakePdfWebHighlightFile: WideString; dispid 14;
  end;

// *********************************************************************//
// The Class CoServer provides a Create and CreateRemote method to          
// create instances of the default interface IServer exposed by              
// the CoClass Server. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServer = class
    class function Create: IServer;
    class function CreateRemote(const MachineName: string): IServer;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TServer
// Help String      : Server Class
// Default Interface: IServer
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TServerProperties= class;
{$ENDIF}
  TServer = class(TOleServer)
  private
    FIntf:        IServer;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TServerProperties;
    function      GetServerProperties: TServerProperties;
{$ENDIF}
    function      GetDefaultInterface: IServer;
  protected
    procedure InitServerData; override;
    function  Get_DebugLogName: WideString;
    procedure Set_DebugLogName(const pVal: WideString);
    function  Get_HomeDir: WideString;
    procedure Set_HomeDir(const pVal: WideString);
    function  Get_PrivateDir: WideString;
    procedure Set_PrivateDir(const pVal: WideString);
    procedure Set_SendTestError(Param1: WordBool);
    procedure Set_SendTestInfo(Param1: WordBool);
    procedure Set_SendTestQuestion(Param1: WordBool);
    function  Get_MajorVersion: Smallint;
    function  Get_MinorVersion: Smallint;
    function  Get_Build: Integer;
    function  Get_Initialized: WordBool;
    function  Get_InitMessage: WideString;
    procedure Set_LzwEnableCode(Param1: Integer);
    function  Get_Errors: IDispatch;
    function  Get_MessageHandler: IDispatch;
    procedure Set_MessageHandler(const pVal: IDispatch);
    function  Get_AllocatedObjectList: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IServer);
    procedure Disconnect; override;
    function  Initialize: WordBool;
    procedure Shutdown;
    function  NewIndexJob: IDispatch;
    function  NewSearchJob: IDispatch;
    function  NewOptions: IDispatch;
    function  NewFileConverter: IDispatch;
    function  NewWordListBuilder: IDispatch;
    function  ConvertPath(const path: WideString; siteId: Integer; flags: Integer; 
                          const tableLocation: WideString): WideString;
    procedure SetDebugLogging(const LogName: WideString; flags: Integer);
    property  DefaultInterface: IServer read GetDefaultInterface;
    property SendTestError: WordBool write Set_SendTestError;
    property SendTestInfo: WordBool write Set_SendTestInfo;
    property SendTestQuestion: WordBool write Set_SendTestQuestion;
    property MajorVersion: Smallint read Get_MajorVersion;
    property MinorVersion: Smallint read Get_MinorVersion;
    property Build: Integer read Get_Build;
    property Initialized: WordBool read Get_Initialized;
    property InitMessage: WideString read Get_InitMessage;
    property LzwEnableCode: Integer write Set_LzwEnableCode;
    property Errors: IDispatch read Get_Errors;
    property MessageHandler: IDispatch read Get_MessageHandler write Set_MessageHandler;
    property AllocatedObjectList: WideString read Get_AllocatedObjectList;
    property DebugLogName: WideString read Get_DebugLogName write Set_DebugLogName;
    property HomeDir: WideString read Get_HomeDir write Set_HomeDir;
    property PrivateDir: WideString read Get_PrivateDir write Set_PrivateDir;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TServerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TServer
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TServerProperties = class(TPersistent)
  private
    FServer:    TServer;
    function    GetDefaultInterface: IServer;
    constructor Create(AServer: TServer);
  protected
    function  Get_DebugLogName: WideString;
    procedure Set_DebugLogName(const pVal: WideString);
    function  Get_HomeDir: WideString;
    procedure Set_HomeDir(const pVal: WideString);
    function  Get_PrivateDir: WideString;
    procedure Set_PrivateDir(const pVal: WideString);
    procedure Set_SendTestError(Param1: WordBool);
    procedure Set_SendTestInfo(Param1: WordBool);
    procedure Set_SendTestQuestion(Param1: WordBool);
    function  Get_MajorVersion: Smallint;
    function  Get_MinorVersion: Smallint;
    function  Get_Build: Integer;
    function  Get_Initialized: WordBool;
    function  Get_InitMessage: WideString;
    procedure Set_LzwEnableCode(Param1: Integer);
    function  Get_Errors: IDispatch;
    function  Get_MessageHandler: IDispatch;
    procedure Set_MessageHandler(const pVal: IDispatch);
    function  Get_AllocatedObjectList: WideString;
  public
    property DefaultInterface: IServer read GetDefaultInterface;
  published
    property DebugLogName: WideString read Get_DebugLogName write Set_DebugLogName;
    property HomeDir: WideString read Get_HomeDir write Set_HomeDir;
    property PrivateDir: WideString read Get_PrivateDir write Set_PrivateDir;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoJobErrorInfo provides a Create and CreateRemote method to          
// create instances of the default interface IJobErrorInfo exposed by              
// the CoClass JobErrorInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoJobErrorInfo = class
    class function Create: IJobErrorInfo;
    class function CreateRemote(const MachineName: string): IJobErrorInfo;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TJobErrorInfo
// Help String      : JobErrorInfo Class
// Default Interface: IJobErrorInfo
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TJobErrorInfoProperties= class;
{$ENDIF}
  TJobErrorInfo = class(TOleServer)
  private
    FIntf:        IJobErrorInfo;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TJobErrorInfoProperties;
    function      GetServerProperties: TJobErrorInfoProperties;
{$ENDIF}
    function      GetDefaultInterface: IJobErrorInfo;
  protected
    procedure InitServerData; override;
    function  Get_Count: Integer;
    function  Get_Message(iMessage: Integer): WideString;
    function  Get_Code(iMessage: Integer): Integer;
    function  Get_Arg1(iMessage: Integer): WideString;
    function  Get_Arg2(iMessage: Integer): WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IJobErrorInfo);
    procedure Disconnect; override;
    function  Format: WideString;
    property  DefaultInterface: IJobErrorInfo read GetDefaultInterface;
    property Count: Integer read Get_Count;
    property Message[iMessage: Integer]: WideString read Get_Message;
    property Code[iMessage: Integer]: Integer read Get_Code;
    property Arg1[iMessage: Integer]: WideString read Get_Arg1;
    property Arg2[iMessage: Integer]: WideString read Get_Arg2;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TJobErrorInfoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TJobErrorInfo
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TJobErrorInfoProperties = class(TPersistent)
  private
    FServer:    TJobErrorInfo;
    function    GetDefaultInterface: IJobErrorInfo;
    constructor Create(AServer: TJobErrorInfo);
  protected
    function  Get_Count: Integer;
    function  Get_Message(iMessage: Integer): WideString;
    function  Get_Code(iMessage: Integer): Integer;
    function  Get_Arg1(iMessage: Integer): WideString;
    function  Get_Arg2(iMessage: Integer): WideString;
  public
    property DefaultInterface: IJobErrorInfo read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoIndexJob provides a Create and CreateRemote method to          
// create instances of the default interface IIndexJob exposed by              
// the CoClass IndexJob. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIndexJob = class
    class function Create: IIndexJob;
    class function CreateRemote(const MachineName: string): IIndexJob;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TIndexJob
// Help String      : IndexJob Class
// Default Interface: IIndexJob
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TIndexJobProperties= class;
{$ENDIF}
  TIndexJob = class(TOleServer)
  private
    FIntf:        IIndexJob;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TIndexJobProperties;
    function      GetServerProperties: TIndexJobProperties;
{$ENDIF}
    function      GetDefaultInterface: IIndexJob;
  protected
    procedure InitServerData; override;
    function  Get_ActionAdd: WordBool;
    procedure Set_ActionAdd(pVal: WordBool);
    function  Get_ActionCompress: WordBool;
    procedure Set_ActionCompress(pVal: WordBool);
    function  Get_ActionCreate: WordBool;
    procedure Set_ActionCreate(pVal: WordBool);
    function  Get_ActionRemoveDeleted: WordBool;
    procedure Set_ActionRemoveDeleted(pVal: WordBool);
    function  Get_ActionRemoveListed: WordBool;
    procedure Set_ActionRemoveListed(pVal: WordBool);
    function  Get_AllowConcurrentAccess: WordBool;
    procedure Set_AllowConcurrentAccess(pVal: WordBool);
    function  Get_CreateAccentSensitive: WordBool;
    procedure Set_CreateAccentSensitive(pVal: WordBool);
    function  Get_CreateCaseSensitive: WordBool;
    procedure Set_CreateCaseSensitive(pVal: WordBool);
    procedure Set_DataSourceToIndex(const Param1: IDispatch);
    function  Get_IndexName: WideString;
    procedure Set_IndexName(const pVal: WideString);
    function  Get_IndexPath: WideString;
    procedure Set_IndexPath(const pVal: WideString);
    procedure Set_StatusHandler(const Param1: IDispatch);
    function  Get_StoredFields: WideString;
    procedure Set_StoredFields(const pVal: WideString);
    function  Get_ToAddDir: WideString;
    procedure Set_ToAddDir(const pVal: WideString);
    function  Get_ToAddDirListName: WideString;
    procedure Set_ToAddDirListName(const pVal: WideString);
    function  Get_ToAddExcludeFilters: WideString;
    procedure Set_ToAddExcludeFilters(const pVal: WideString);
    function  Get_ToAddFileListName: WideString;
    procedure Set_ToAddFileListName(const pVal: WideString);
    function  Get_ToAddIncludeFilters: WideString;
    procedure Set_ToAddIncludeFilters(const pVal: WideString);
    function  Get_ToRemoveListName: WideString;
    procedure Set_ToRemoveListName(const pVal: WideString);
    function  Get_IsThreadDone: WordBool;
    function  Get_Errors: IDispatch;
    function  Get_StatusIndexingStep: Integer;
    function  Get_StatusPercentDone: Integer;
    function  Get_StatusCurrentFileLocation: WideString;
    function  Get_StatusCurrentFileName: WideString;
    function  Get_StatusCurrentFileType: WideString;
    function  Get_StatusDiskAvailKB: Integer;
    function  Get_StatusWordsInIndex: Integer;
    function  Get_StatusDocsInIndex: Integer;
    function  Get_StatusBytesIndexedKB: Integer;
    function  Get_StatusBytesToIndexKB: Integer;
    function  Get_StatusCurrentFilePercentDone: Integer;
    function  Get_CreateAddToLibrary: WordBool;
    procedure Set_CreateAddToLibrary(pVal: WordBool);
    function  Get_CreateRelativePaths: WordBool;
    procedure Set_CreateRelativePaths(pVal: WordBool);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IIndexJob);
    procedure Disconnect; override;
    function  Execute: Smallint;
    procedure ExecuteInThread;
    procedure AbortThread;
    procedure AbortThreadImmediate;
    property  DefaultInterface: IIndexJob read GetDefaultInterface;
    property DataSourceToIndex: IDispatch write Set_DataSourceToIndex;
    property StatusHandler: IDispatch write Set_StatusHandler;
    property IsThreadDone: WordBool read Get_IsThreadDone;
    property Errors: IDispatch read Get_Errors;
    property StatusIndexingStep: Integer read Get_StatusIndexingStep;
    property StatusPercentDone: Integer read Get_StatusPercentDone;
    property StatusCurrentFileLocation: WideString read Get_StatusCurrentFileLocation;
    property StatusCurrentFileName: WideString read Get_StatusCurrentFileName;
    property StatusCurrentFileType: WideString read Get_StatusCurrentFileType;
    property StatusDiskAvailKB: Integer read Get_StatusDiskAvailKB;
    property StatusWordsInIndex: Integer read Get_StatusWordsInIndex;
    property StatusDocsInIndex: Integer read Get_StatusDocsInIndex;
    property StatusBytesIndexedKB: Integer read Get_StatusBytesIndexedKB;
    property StatusBytesToIndexKB: Integer read Get_StatusBytesToIndexKB;
    property StatusCurrentFilePercentDone: Integer read Get_StatusCurrentFilePercentDone;
    property ActionAdd: WordBool read Get_ActionAdd write Set_ActionAdd;
    property ActionCompress: WordBool read Get_ActionCompress write Set_ActionCompress;
    property ActionCreate: WordBool read Get_ActionCreate write Set_ActionCreate;
    property ActionRemoveDeleted: WordBool read Get_ActionRemoveDeleted write Set_ActionRemoveDeleted;
    property ActionRemoveListed: WordBool read Get_ActionRemoveListed write Set_ActionRemoveListed;
    property AllowConcurrentAccess: WordBool read Get_AllowConcurrentAccess write Set_AllowConcurrentAccess;
    property CreateAccentSensitive: WordBool read Get_CreateAccentSensitive write Set_CreateAccentSensitive;
    property CreateCaseSensitive: WordBool read Get_CreateCaseSensitive write Set_CreateCaseSensitive;
    property IndexName: WideString read Get_IndexName write Set_IndexName;
    property IndexPath: WideString read Get_IndexPath write Set_IndexPath;
    property StoredFields: WideString read Get_StoredFields write Set_StoredFields;
    property ToAddDir: WideString read Get_ToAddDir write Set_ToAddDir;
    property ToAddDirListName: WideString read Get_ToAddDirListName write Set_ToAddDirListName;
    property ToAddExcludeFilters: WideString read Get_ToAddExcludeFilters write Set_ToAddExcludeFilters;
    property ToAddFileListName: WideString read Get_ToAddFileListName write Set_ToAddFileListName;
    property ToAddIncludeFilters: WideString read Get_ToAddIncludeFilters write Set_ToAddIncludeFilters;
    property ToRemoveListName: WideString read Get_ToRemoveListName write Set_ToRemoveListName;
    property CreateAddToLibrary: WordBool read Get_CreateAddToLibrary write Set_CreateAddToLibrary;
    property CreateRelativePaths: WordBool read Get_CreateRelativePaths write Set_CreateRelativePaths;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TIndexJobProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TIndexJob
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TIndexJobProperties = class(TPersistent)
  private
    FServer:    TIndexJob;
    function    GetDefaultInterface: IIndexJob;
    constructor Create(AServer: TIndexJob);
  protected
    function  Get_ActionAdd: WordBool;
    procedure Set_ActionAdd(pVal: WordBool);
    function  Get_ActionCompress: WordBool;
    procedure Set_ActionCompress(pVal: WordBool);
    function  Get_ActionCreate: WordBool;
    procedure Set_ActionCreate(pVal: WordBool);
    function  Get_ActionRemoveDeleted: WordBool;
    procedure Set_ActionRemoveDeleted(pVal: WordBool);
    function  Get_ActionRemoveListed: WordBool;
    procedure Set_ActionRemoveListed(pVal: WordBool);
    function  Get_AllowConcurrentAccess: WordBool;
    procedure Set_AllowConcurrentAccess(pVal: WordBool);
    function  Get_CreateAccentSensitive: WordBool;
    procedure Set_CreateAccentSensitive(pVal: WordBool);
    function  Get_CreateCaseSensitive: WordBool;
    procedure Set_CreateCaseSensitive(pVal: WordBool);
    procedure Set_DataSourceToIndex(const Param1: IDispatch);
    function  Get_IndexName: WideString;
    procedure Set_IndexName(const pVal: WideString);
    function  Get_IndexPath: WideString;
    procedure Set_IndexPath(const pVal: WideString);
    procedure Set_StatusHandler(const Param1: IDispatch);
    function  Get_StoredFields: WideString;
    procedure Set_StoredFields(const pVal: WideString);
    function  Get_ToAddDir: WideString;
    procedure Set_ToAddDir(const pVal: WideString);
    function  Get_ToAddDirListName: WideString;
    procedure Set_ToAddDirListName(const pVal: WideString);
    function  Get_ToAddExcludeFilters: WideString;
    procedure Set_ToAddExcludeFilters(const pVal: WideString);
    function  Get_ToAddFileListName: WideString;
    procedure Set_ToAddFileListName(const pVal: WideString);
    function  Get_ToAddIncludeFilters: WideString;
    procedure Set_ToAddIncludeFilters(const pVal: WideString);
    function  Get_ToRemoveListName: WideString;
    procedure Set_ToRemoveListName(const pVal: WideString);
    function  Get_IsThreadDone: WordBool;
    function  Get_Errors: IDispatch;
    function  Get_StatusIndexingStep: Integer;
    function  Get_StatusPercentDone: Integer;
    function  Get_StatusCurrentFileLocation: WideString;
    function  Get_StatusCurrentFileName: WideString;
    function  Get_StatusCurrentFileType: WideString;
    function  Get_StatusDiskAvailKB: Integer;
    function  Get_StatusWordsInIndex: Integer;
    function  Get_StatusDocsInIndex: Integer;
    function  Get_StatusBytesIndexedKB: Integer;
    function  Get_StatusBytesToIndexKB: Integer;
    function  Get_StatusCurrentFilePercentDone: Integer;
    function  Get_CreateAddToLibrary: WordBool;
    procedure Set_CreateAddToLibrary(pVal: WordBool);
    function  Get_CreateRelativePaths: WordBool;
    procedure Set_CreateRelativePaths(pVal: WordBool);
  public
    property DefaultInterface: IIndexJob read GetDefaultInterface;
  published
    property ActionAdd: WordBool read Get_ActionAdd write Set_ActionAdd;
    property ActionCompress: WordBool read Get_ActionCompress write Set_ActionCompress;
    property ActionCreate: WordBool read Get_ActionCreate write Set_ActionCreate;
    property ActionRemoveDeleted: WordBool read Get_ActionRemoveDeleted write Set_ActionRemoveDeleted;
    property ActionRemoveListed: WordBool read Get_ActionRemoveListed write Set_ActionRemoveListed;
    property AllowConcurrentAccess: WordBool read Get_AllowConcurrentAccess write Set_AllowConcurrentAccess;
    property CreateAccentSensitive: WordBool read Get_CreateAccentSensitive write Set_CreateAccentSensitive;
    property CreateCaseSensitive: WordBool read Get_CreateCaseSensitive write Set_CreateCaseSensitive;
    property IndexName: WideString read Get_IndexName write Set_IndexName;
    property IndexPath: WideString read Get_IndexPath write Set_IndexPath;
    property StoredFields: WideString read Get_StoredFields write Set_StoredFields;
    property ToAddDir: WideString read Get_ToAddDir write Set_ToAddDir;
    property ToAddDirListName: WideString read Get_ToAddDirListName write Set_ToAddDirListName;
    property ToAddExcludeFilters: WideString read Get_ToAddExcludeFilters write Set_ToAddExcludeFilters;
    property ToAddFileListName: WideString read Get_ToAddFileListName write Set_ToAddFileListName;
    property ToAddIncludeFilters: WideString read Get_ToAddIncludeFilters write Set_ToAddIncludeFilters;
    property ToRemoveListName: WideString read Get_ToRemoveListName write Set_ToRemoveListName;
    property CreateAddToLibrary: WordBool read Get_CreateAddToLibrary write Set_CreateAddToLibrary;
    property CreateRelativePaths: WordBool read Get_CreateRelativePaths write Set_CreateRelativePaths;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSearchJob provides a Create and CreateRemote method to          
// create instances of the default interface ISearchJob exposed by              
// the CoClass SearchJob. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSearchJob = class
    class function Create: ISearchJob;
    class function CreateRemote(const MachineName: string): ISearchJob;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSearchJob
// Help String      : SearchJob Class
// Default Interface: ISearchJob
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSearchJobProperties= class;
{$ENDIF}
  TSearchJob = class(TOleServer)
  private
    FIntf:        ISearchJob;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSearchJobProperties;
    function      GetServerProperties: TSearchJobProperties;
{$ENDIF}
    function      GetDefaultInterface: ISearchJob;
  protected
    procedure InitServerData; override;
    function  Get_DirListName: WideString;
    procedure Set_DirListName(const pVal: WideString);
    function  Get_DirToSearch: WideString;
    procedure Set_DirToSearch(const pVal: WideString);
    function  Get_ExcludeFilters: WideString;
    procedure Set_ExcludeFilters(const pVal: WideString);
    function  Get_FileCount: Integer;
    function  Get_HitCount: Integer;
    function  Get_Fuzziness: Integer;
    procedure Set_Fuzziness(pVal: Integer);
    function  Get_IncludeFilters: WideString;
    procedure Set_IncludeFilters(const pVal: WideString);
    function  Get_IndexesToSearch: WideString;
    procedure Set_IndexesToSearch(const pVal: WideString);
    function  Get_MaxFilesToRetrieve: Integer;
    procedure Set_MaxFilesToRetrieve(pVal: Integer);
    function  Get_NaturalLanguage: WordBool;
    procedure Set_NaturalLanguage(pVal: WordBool);
    function  Get_OutputListingHits: WordBool;
    procedure Set_OutputListingHits(pVal: WordBool);
    function  Get_PhonicSearching: WordBool;
    procedure Set_PhonicSearching(pVal: WordBool);
    function  Get_Request: WideString;
    procedure Set_Request(const pVal: WideString);
    function  Get_ResultsInMemory: WordBool;
    procedure Set_ResultsInMemory(pVal: WordBool);
    function  Get_StatusHandler: IDispatch;
    procedure Set_StatusHandler(const pVal: IDispatch);
    function  Get_Stemming: WordBool;
    procedure Set_Stemming(pVal: WordBool);
    function  Get_Synonyms: WordBool;
    procedure Set_Synonyms(pVal: WordBool);
    function  Get_UserSynonyms: WordBool;
    procedure Set_UserSynonyms(pVal: WordBool);
    function  Get_WordNetSynonyms: WordBool;
    procedure Set_WordNetSynonyms(pVal: WordBool);
    function  Get_WordNetRelated: WordBool;
    procedure Set_WordNetRelated(pVal: WordBool);
    function  Get_Results: IDispatch;
    function  Get_IsThreadDone: WordBool;
    function  Get_Errors: IDispatch;
    function  Get_TimeoutSeconds: Integer;
    procedure Set_TimeoutSeconds(pVal: Integer);
    function  Get_DelayDocInfo: WordBool;
    procedure Set_DelayDocInfo(pVal: WordBool);
    function  Get_RegularExpression: WordBool;
    procedure Set_RegularExpression(pVal: WordBool);
    function  Get_SearchFlags: Integer;
    procedure Set_SearchFlags(pVal: Integer);
    function  Get_OutputListingName: WideString;
    procedure Set_OutputListingName(const pVal: WideString);
    function  Get_ExternalSynonyms: WordBool;
    procedure Set_ExternalSynonyms(pVal: WordBool);
    function  Get_FileConditions: WideString;
    procedure Set_FileConditions(const pVal: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISearchJob);
    procedure Disconnect; override;
    function  Execute: Smallint;
    procedure ExecuteInThread;
    procedure AbortThread;
    property  DefaultInterface: ISearchJob read GetDefaultInterface;
    property FileCount: Integer read Get_FileCount;
    property HitCount: Integer read Get_HitCount;
    property StatusHandler: IDispatch read Get_StatusHandler write Set_StatusHandler;
    property Results: IDispatch read Get_Results;
    property IsThreadDone: WordBool read Get_IsThreadDone;
    property Errors: IDispatch read Get_Errors;
    property DirListName: WideString read Get_DirListName write Set_DirListName;
    property DirToSearch: WideString read Get_DirToSearch write Set_DirToSearch;
    property ExcludeFilters: WideString read Get_ExcludeFilters write Set_ExcludeFilters;
    property Fuzziness: Integer read Get_Fuzziness write Set_Fuzziness;
    property IncludeFilters: WideString read Get_IncludeFilters write Set_IncludeFilters;
    property IndexesToSearch: WideString read Get_IndexesToSearch write Set_IndexesToSearch;
    property MaxFilesToRetrieve: Integer read Get_MaxFilesToRetrieve write Set_MaxFilesToRetrieve;
    property NaturalLanguage: WordBool read Get_NaturalLanguage write Set_NaturalLanguage;
    property OutputListingHits: WordBool read Get_OutputListingHits write Set_OutputListingHits;
    property PhonicSearching: WordBool read Get_PhonicSearching write Set_PhonicSearching;
    property Request: WideString read Get_Request write Set_Request;
    property ResultsInMemory: WordBool read Get_ResultsInMemory write Set_ResultsInMemory;
    property Stemming: WordBool read Get_Stemming write Set_Stemming;
    property Synonyms: WordBool read Get_Synonyms write Set_Synonyms;
    property UserSynonyms: WordBool read Get_UserSynonyms write Set_UserSynonyms;
    property WordNetSynonyms: WordBool read Get_WordNetSynonyms write Set_WordNetSynonyms;
    property WordNetRelated: WordBool read Get_WordNetRelated write Set_WordNetRelated;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property DelayDocInfo: WordBool read Get_DelayDocInfo write Set_DelayDocInfo;
    property RegularExpression: WordBool read Get_RegularExpression write Set_RegularExpression;
    property SearchFlags: Integer read Get_SearchFlags write Set_SearchFlags;
    property OutputListingName: WideString read Get_OutputListingName write Set_OutputListingName;
    property ExternalSynonyms: WordBool read Get_ExternalSynonyms write Set_ExternalSynonyms;
    property FileConditions: WideString read Get_FileConditions write Set_FileConditions;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSearchJobProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSearchJob
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSearchJobProperties = class(TPersistent)
  private
    FServer:    TSearchJob;
    function    GetDefaultInterface: ISearchJob;
    constructor Create(AServer: TSearchJob);
  protected
    function  Get_DirListName: WideString;
    procedure Set_DirListName(const pVal: WideString);
    function  Get_DirToSearch: WideString;
    procedure Set_DirToSearch(const pVal: WideString);
    function  Get_ExcludeFilters: WideString;
    procedure Set_ExcludeFilters(const pVal: WideString);
    function  Get_FileCount: Integer;
    function  Get_HitCount: Integer;
    function  Get_Fuzziness: Integer;
    procedure Set_Fuzziness(pVal: Integer);
    function  Get_IncludeFilters: WideString;
    procedure Set_IncludeFilters(const pVal: WideString);
    function  Get_IndexesToSearch: WideString;
    procedure Set_IndexesToSearch(const pVal: WideString);
    function  Get_MaxFilesToRetrieve: Integer;
    procedure Set_MaxFilesToRetrieve(pVal: Integer);
    function  Get_NaturalLanguage: WordBool;
    procedure Set_NaturalLanguage(pVal: WordBool);
    function  Get_OutputListingHits: WordBool;
    procedure Set_OutputListingHits(pVal: WordBool);
    function  Get_PhonicSearching: WordBool;
    procedure Set_PhonicSearching(pVal: WordBool);
    function  Get_Request: WideString;
    procedure Set_Request(const pVal: WideString);
    function  Get_ResultsInMemory: WordBool;
    procedure Set_ResultsInMemory(pVal: WordBool);
    function  Get_StatusHandler: IDispatch;
    procedure Set_StatusHandler(const pVal: IDispatch);
    function  Get_Stemming: WordBool;
    procedure Set_Stemming(pVal: WordBool);
    function  Get_Synonyms: WordBool;
    procedure Set_Synonyms(pVal: WordBool);
    function  Get_UserSynonyms: WordBool;
    procedure Set_UserSynonyms(pVal: WordBool);
    function  Get_WordNetSynonyms: WordBool;
    procedure Set_WordNetSynonyms(pVal: WordBool);
    function  Get_WordNetRelated: WordBool;
    procedure Set_WordNetRelated(pVal: WordBool);
    function  Get_Results: IDispatch;
    function  Get_IsThreadDone: WordBool;
    function  Get_Errors: IDispatch;
    function  Get_TimeoutSeconds: Integer;
    procedure Set_TimeoutSeconds(pVal: Integer);
    function  Get_DelayDocInfo: WordBool;
    procedure Set_DelayDocInfo(pVal: WordBool);
    function  Get_RegularExpression: WordBool;
    procedure Set_RegularExpression(pVal: WordBool);
    function  Get_SearchFlags: Integer;
    procedure Set_SearchFlags(pVal: Integer);
    function  Get_OutputListingName: WideString;
    procedure Set_OutputListingName(const pVal: WideString);
    function  Get_ExternalSynonyms: WordBool;
    procedure Set_ExternalSynonyms(pVal: WordBool);
    function  Get_FileConditions: WideString;
    procedure Set_FileConditions(const pVal: WideString);
  public
    property DefaultInterface: ISearchJob read GetDefaultInterface;
  published
    property DirListName: WideString read Get_DirListName write Set_DirListName;
    property DirToSearch: WideString read Get_DirToSearch write Set_DirToSearch;
    property ExcludeFilters: WideString read Get_ExcludeFilters write Set_ExcludeFilters;
    property Fuzziness: Integer read Get_Fuzziness write Set_Fuzziness;
    property IncludeFilters: WideString read Get_IncludeFilters write Set_IncludeFilters;
    property IndexesToSearch: WideString read Get_IndexesToSearch write Set_IndexesToSearch;
    property MaxFilesToRetrieve: Integer read Get_MaxFilesToRetrieve write Set_MaxFilesToRetrieve;
    property NaturalLanguage: WordBool read Get_NaturalLanguage write Set_NaturalLanguage;
    property OutputListingHits: WordBool read Get_OutputListingHits write Set_OutputListingHits;
    property PhonicSearching: WordBool read Get_PhonicSearching write Set_PhonicSearching;
    property Request: WideString read Get_Request write Set_Request;
    property ResultsInMemory: WordBool read Get_ResultsInMemory write Set_ResultsInMemory;
    property Stemming: WordBool read Get_Stemming write Set_Stemming;
    property Synonyms: WordBool read Get_Synonyms write Set_Synonyms;
    property UserSynonyms: WordBool read Get_UserSynonyms write Set_UserSynonyms;
    property WordNetSynonyms: WordBool read Get_WordNetSynonyms write Set_WordNetSynonyms;
    property WordNetRelated: WordBool read Get_WordNetRelated write Set_WordNetRelated;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property DelayDocInfo: WordBool read Get_DelayDocInfo write Set_DelayDocInfo;
    property RegularExpression: WordBool read Get_RegularExpression write Set_RegularExpression;
    property SearchFlags: Integer read Get_SearchFlags write Set_SearchFlags;
    property OutputListingName: WideString read Get_OutputListingName write Set_OutputListingName;
    property ExternalSynonyms: WordBool read Get_ExternalSynonyms write Set_ExternalSynonyms;
    property FileConditions: WideString read Get_FileConditions write Set_FileConditions;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoFileConverter provides a Create and CreateRemote method to          
// create instances of the default interface IFileConverter exposed by              
// the CoClass FileConverter. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFileConverter = class
    class function Create: IFileConverter;
    class function CreateRemote(const MachineName: string): IFileConverter;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFileConverter
// Help String      : FileConverter Class
// Default Interface: IFileConverter
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TFileConverterProperties= class;
{$ENDIF}
  TFileConverter = class(TOleServer)
  private
    FIntf:        IFileConverter;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TFileConverterProperties;
    function      GetServerProperties: TFileConverterProperties;
{$ENDIF}
    function      GetDefaultInterface: IFileConverter;
  protected
    procedure InitServerData; override;
    function  Get_InputFile: WideString;
    procedure Set_InputFile(const pVal: WideString);
    function  Get_OutputFile: WideString;
    procedure Set_OutputFile(const pVal: WideString);
    function  Get_OutputFormat: Integer;
    procedure Set_OutputFormat(pVal: Integer);
    function  Get_BeforeHit: WideString;
    procedure Set_BeforeHit(const pVal: WideString);
    function  Get_AfterHit: WideString;
    procedure Set_AfterHit(const pVal: WideString);
    function  Get_Footer: WideString;
    procedure Set_Footer(const pVal: WideString);
    function  Get_Hits: WideString;
    procedure Set_Hits(const pVal: WideString);
    function  Get_Errors: IDispatch;
    function  Get_BaseHRef: WideString;
    procedure Set_BaseHRef(const pVal: WideString);
    function  Get_OutputToString: WordBool;
    procedure Set_OutputToString(pVal: WordBool);
    function  Get_OutputStringMaxSize: Integer;
    procedure Set_OutputStringMaxSize(pVal: Integer);
    function  Get_OutputString: WideString;
    function  Get_TimeoutSeconds: Integer;
    procedure Set_TimeoutSeconds(pVal: Integer);
    function  Get_AlphabetLocation: WideString;
    procedure Set_AlphabetLocation(const pVal: WideString);
    function  Get_flags: Integer;
    procedure Set_flags(pVal: Integer);
    function  Get_Header: WideString;
    procedure Set_Header(const pVal: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IFileConverter);
    procedure Disconnect; override;
    procedure Execute;
    property  DefaultInterface: IFileConverter read GetDefaultInterface;
    property Errors: IDispatch read Get_Errors;
    property OutputString: WideString read Get_OutputString;
    property InputFile: WideString read Get_InputFile write Set_InputFile;
    property OutputFile: WideString read Get_OutputFile write Set_OutputFile;
    property OutputFormat: Integer read Get_OutputFormat write Set_OutputFormat;
    property BeforeHit: WideString read Get_BeforeHit write Set_BeforeHit;
    property AfterHit: WideString read Get_AfterHit write Set_AfterHit;
    property Footer: WideString read Get_Footer write Set_Footer;
    property Hits: WideString read Get_Hits write Set_Hits;
    property BaseHRef: WideString read Get_BaseHRef write Set_BaseHRef;
    property OutputToString: WordBool read Get_OutputToString write Set_OutputToString;
    property OutputStringMaxSize: Integer read Get_OutputStringMaxSize write Set_OutputStringMaxSize;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property AlphabetLocation: WideString read Get_AlphabetLocation write Set_AlphabetLocation;
    property flags: Integer read Get_flags write Set_flags;
    property Header: WideString read Get_Header write Set_Header;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TFileConverterProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TFileConverter
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TFileConverterProperties = class(TPersistent)
  private
    FServer:    TFileConverter;
    function    GetDefaultInterface: IFileConverter;
    constructor Create(AServer: TFileConverter);
  protected
    function  Get_InputFile: WideString;
    procedure Set_InputFile(const pVal: WideString);
    function  Get_OutputFile: WideString;
    procedure Set_OutputFile(const pVal: WideString);
    function  Get_OutputFormat: Integer;
    procedure Set_OutputFormat(pVal: Integer);
    function  Get_BeforeHit: WideString;
    procedure Set_BeforeHit(const pVal: WideString);
    function  Get_AfterHit: WideString;
    procedure Set_AfterHit(const pVal: WideString);
    function  Get_Footer: WideString;
    procedure Set_Footer(const pVal: WideString);
    function  Get_Hits: WideString;
    procedure Set_Hits(const pVal: WideString);
    function  Get_Errors: IDispatch;
    function  Get_BaseHRef: WideString;
    procedure Set_BaseHRef(const pVal: WideString);
    function  Get_OutputToString: WordBool;
    procedure Set_OutputToString(pVal: WordBool);
    function  Get_OutputStringMaxSize: Integer;
    procedure Set_OutputStringMaxSize(pVal: Integer);
    function  Get_OutputString: WideString;
    function  Get_TimeoutSeconds: Integer;
    procedure Set_TimeoutSeconds(pVal: Integer);
    function  Get_AlphabetLocation: WideString;
    procedure Set_AlphabetLocation(const pVal: WideString);
    function  Get_flags: Integer;
    procedure Set_flags(pVal: Integer);
    function  Get_Header: WideString;
    procedure Set_Header(const pVal: WideString);
  public
    property DefaultInterface: IFileConverter read GetDefaultInterface;
  published
    property InputFile: WideString read Get_InputFile write Set_InputFile;
    property OutputFile: WideString read Get_OutputFile write Set_OutputFile;
    property OutputFormat: Integer read Get_OutputFormat write Set_OutputFormat;
    property BeforeHit: WideString read Get_BeforeHit write Set_BeforeHit;
    property AfterHit: WideString read Get_AfterHit write Set_AfterHit;
    property Footer: WideString read Get_Footer write Set_Footer;
    property Hits: WideString read Get_Hits write Set_Hits;
    property BaseHRef: WideString read Get_BaseHRef write Set_BaseHRef;
    property OutputToString: WordBool read Get_OutputToString write Set_OutputToString;
    property OutputStringMaxSize: Integer read Get_OutputStringMaxSize write Set_OutputStringMaxSize;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property AlphabetLocation: WideString read Get_AlphabetLocation write Set_AlphabetLocation;
    property flags: Integer read Get_flags write Set_flags;
    property Header: WideString read Get_Header write Set_Header;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSearchReportJob provides a Create and CreateRemote method to          
// create instances of the default interface ISearchReportJob exposed by              
// the CoClass SearchReportJob. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSearchReportJob = class
    class function Create: ISearchReportJob;
    class function CreateRemote(const MachineName: string): ISearchReportJob;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSearchReportJob
// Help String      : SearchReportJob Class
// Default Interface: ISearchReportJob
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSearchReportJobProperties= class;
{$ENDIF}
  TSearchReportJob = class(TOleServer)
  private
    FIntf:        ISearchReportJob;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSearchReportJobProperties;
    function      GetServerProperties: TSearchReportJobProperties;
{$ENDIF}
    function      GetDefaultInterface: ISearchReportJob;
  protected
    procedure InitServerData; override;
    function  Get_BeforeHit: WideString;
    procedure Set_BeforeHit(const pVal: WideString);
    function  Get_AfterHit: WideString;
    procedure Set_AfterHit(const pVal: WideString);
    function  Get_Header: WideString;
    procedure Set_Header(const pVal: WideString);
    function  Get_Footer: WideString;
    procedure Set_Footer(const pVal: WideString);
    function  Get_FileHeader: WideString;
    procedure Set_FileHeader(const pVal: WideString);
    function  Get_ContextHeader: WideString;
    procedure Set_ContextHeader(const pVal: WideString);
    function  Get_WordsOfContext: Integer;
    procedure Set_WordsOfContext(pVal: Integer);
    function  Get_ParagraphsOfContext: Integer;
    procedure Set_ParagraphsOfContext(pVal: Integer);
    function  Get_Errors: IDispatch;
    function  Get_OutputFormat: Integer;
    procedure Set_OutputFormat(pVal: Integer);
    function  Get_OutputFile: WideString;
    procedure Set_OutputFile(const pVal: WideString);
    function  Get_TimeoutSeconds: Integer;
    procedure Set_TimeoutSeconds(pVal: Integer);
    function  Get_OutputString: WideString;
    function  Get_OutputStringMaxSize: Integer;
    procedure Set_OutputStringMaxSize(pVal: Integer);
    function  Get_OutputToString: WordBool;
    procedure Set_OutputToString(pVal: WordBool);
    function  Get_FileFooter: WideString;
    procedure Set_FileFooter(const pVal: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISearchReportJob);
    procedure Disconnect; override;
    procedure Execute;
    procedure SelectItems(iFirstItem: Integer; iLastItem: Integer);
    procedure ClearSelections;
    procedure SelectAll;
    property  DefaultInterface: ISearchReportJob read GetDefaultInterface;
    property Errors: IDispatch read Get_Errors;
    property OutputString: WideString read Get_OutputString;
    property BeforeHit: WideString read Get_BeforeHit write Set_BeforeHit;
    property AfterHit: WideString read Get_AfterHit write Set_AfterHit;
    property Header: WideString read Get_Header write Set_Header;
    property Footer: WideString read Get_Footer write Set_Footer;
    property FileHeader: WideString read Get_FileHeader write Set_FileHeader;
    property ContextHeader: WideString read Get_ContextHeader write Set_ContextHeader;
    property WordsOfContext: Integer read Get_WordsOfContext write Set_WordsOfContext;
    property ParagraphsOfContext: Integer read Get_ParagraphsOfContext write Set_ParagraphsOfContext;
    property OutputFormat: Integer read Get_OutputFormat write Set_OutputFormat;
    property OutputFile: WideString read Get_OutputFile write Set_OutputFile;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property OutputStringMaxSize: Integer read Get_OutputStringMaxSize write Set_OutputStringMaxSize;
    property OutputToString: WordBool read Get_OutputToString write Set_OutputToString;
    property FileFooter: WideString read Get_FileFooter write Set_FileFooter;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSearchReportJobProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSearchReportJob
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSearchReportJobProperties = class(TPersistent)
  private
    FServer:    TSearchReportJob;
    function    GetDefaultInterface: ISearchReportJob;
    constructor Create(AServer: TSearchReportJob);
  protected
    function  Get_BeforeHit: WideString;
    procedure Set_BeforeHit(const pVal: WideString);
    function  Get_AfterHit: WideString;
    procedure Set_AfterHit(const pVal: WideString);
    function  Get_Header: WideString;
    procedure Set_Header(const pVal: WideString);
    function  Get_Footer: WideString;
    procedure Set_Footer(const pVal: WideString);
    function  Get_FileHeader: WideString;
    procedure Set_FileHeader(const pVal: WideString);
    function  Get_ContextHeader: WideString;
    procedure Set_ContextHeader(const pVal: WideString);
    function  Get_WordsOfContext: Integer;
    procedure Set_WordsOfContext(pVal: Integer);
    function  Get_ParagraphsOfContext: Integer;
    procedure Set_ParagraphsOfContext(pVal: Integer);
    function  Get_Errors: IDispatch;
    function  Get_OutputFormat: Integer;
    procedure Set_OutputFormat(pVal: Integer);
    function  Get_OutputFile: WideString;
    procedure Set_OutputFile(const pVal: WideString);
    function  Get_TimeoutSeconds: Integer;
    procedure Set_TimeoutSeconds(pVal: Integer);
    function  Get_OutputString: WideString;
    function  Get_OutputStringMaxSize: Integer;
    procedure Set_OutputStringMaxSize(pVal: Integer);
    function  Get_OutputToString: WordBool;
    procedure Set_OutputToString(pVal: WordBool);
    function  Get_FileFooter: WideString;
    procedure Set_FileFooter(const pVal: WideString);
  public
    property DefaultInterface: ISearchReportJob read GetDefaultInterface;
  published
    property BeforeHit: WideString read Get_BeforeHit write Set_BeforeHit;
    property AfterHit: WideString read Get_AfterHit write Set_AfterHit;
    property Header: WideString read Get_Header write Set_Header;
    property Footer: WideString read Get_Footer write Set_Footer;
    property FileHeader: WideString read Get_FileHeader write Set_FileHeader;
    property ContextHeader: WideString read Get_ContextHeader write Set_ContextHeader;
    property WordsOfContext: Integer read Get_WordsOfContext write Set_WordsOfContext;
    property ParagraphsOfContext: Integer read Get_ParagraphsOfContext write Set_ParagraphsOfContext;
    property OutputFormat: Integer read Get_OutputFormat write Set_OutputFormat;
    property OutputFile: WideString read Get_OutputFile write Set_OutputFile;
    property TimeoutSeconds: Integer read Get_TimeoutSeconds write Set_TimeoutSeconds;
    property OutputStringMaxSize: Integer read Get_OutputStringMaxSize write Set_OutputStringMaxSize;
    property OutputToString: WordBool read Get_OutputToString write Set_OutputToString;
    property FileFooter: WideString read Get_FileFooter write Set_FileFooter;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoOptions provides a Create and CreateRemote method to          
// create instances of the default interface IOptions exposed by              
// the CoClass Options. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOptions = class
    class function Create: IOptions;
    class function CreateRemote(const MachineName: string): IOptions;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TOptions
// Help String      : Options Class
// Default Interface: IOptions
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TOptionsProperties= class;
{$ENDIF}
  TOptions = class(TOleServer)
  private
    FIntf:        IOptions;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TOptionsProperties;
    function      GetServerProperties: TOptionsProperties;
{$ENDIF}
    function      GetDefaultInterface: IOptions;
  protected
    procedure InitServerData; override;
    function  Get_BinaryFiles: Integer;
    procedure Set_BinaryFiles(pVal: Integer);
    function  Get_Hyphens: Integer;
    procedure Set_Hyphens(pVal: Integer);
    function  Get_IndexNumbers: WordBool;
    procedure Set_IndexNumbers(pVal: WordBool);
    function  Get_AlphabetName: WideString;
    procedure Set_AlphabetName(const pVal: WideString);
    function  Get_BinaryFilterTextChars: WideString;
    procedure Set_BinaryFilterTextChars(const pVal: WideString);
    function  Get_StemmingRulesFile: WideString;
    procedure Set_StemmingRulesFile(const pVal: WideString);
    function  Get_NoiseWordFile: WideString;
    procedure Set_NoiseWordFile(const pVal: WideString);
    function  Get_MaxWordsToRetrieve: Integer;
    procedure Set_MaxWordsToRetrieve(pVal: Integer);
    function  Get_MaxStoredFieldSize: Integer;
    procedure Set_MaxStoredFieldSize(pVal: Integer);
    function  Get_TitleSize: Integer;
    procedure Set_TitleSize(pVal: Integer);
    function  Get_XmlIgnoreTags: WideString;
    procedure Set_XmlIgnoreTags(const pVal: WideString);
    function  Get_MaxWordLength: Integer;
    procedure Set_MaxWordLength(pVal: Integer);
    function  Get_SegmentationRulesFile: WideString;
    procedure Set_SegmentationRulesFile(const pVal: WideString);
    function  Get_TextFieldsFile: WideString;
    procedure Set_TextFieldsFile(const pVal: WideString);
    function  Get_UserThesaurusFile: WideString;
    procedure Set_UserThesaurusFile(const pVal: WideString);
    function  Get_HomeDir: WideString;
    procedure Set_HomeDir(const pVal: WideString);
    function  Get_PrivateDir: WideString;
    procedure Set_PrivateDir(const pVal: WideString);
    function  Get_BooleanConnectors: WideString;
    procedure Set_BooleanConnectors(const pVal: WideString);
    function  Get_FileTypeTableFile: WideString;
    procedure Set_FileTypeTableFile(const pVal: WideString);
    function  Get_UpdateFiles: WordBool;
    procedure Set_UpdateFiles(pVal: WordBool);
    function  Get_LzwEnableCode: Integer;
    procedure Set_LzwEnableCode(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IOptions);
    procedure Disconnect; override;
    procedure Save;
    property  DefaultInterface: IOptions read GetDefaultInterface;
    property BinaryFiles: Integer read Get_BinaryFiles write Set_BinaryFiles;
    property Hyphens: Integer read Get_Hyphens write Set_Hyphens;
    property IndexNumbers: WordBool read Get_IndexNumbers write Set_IndexNumbers;
    property AlphabetName: WideString read Get_AlphabetName write Set_AlphabetName;
    property BinaryFilterTextChars: WideString read Get_BinaryFilterTextChars write Set_BinaryFilterTextChars;
    property StemmingRulesFile: WideString read Get_StemmingRulesFile write Set_StemmingRulesFile;
    property NoiseWordFile: WideString read Get_NoiseWordFile write Set_NoiseWordFile;
    property MaxWordsToRetrieve: Integer read Get_MaxWordsToRetrieve write Set_MaxWordsToRetrieve;
    property MaxStoredFieldSize: Integer read Get_MaxStoredFieldSize write Set_MaxStoredFieldSize;
    property TitleSize: Integer read Get_TitleSize write Set_TitleSize;
    property XmlIgnoreTags: WideString read Get_XmlIgnoreTags write Set_XmlIgnoreTags;
    property MaxWordLength: Integer read Get_MaxWordLength write Set_MaxWordLength;
    property SegmentationRulesFile: WideString read Get_SegmentationRulesFile write Set_SegmentationRulesFile;
    property TextFieldsFile: WideString read Get_TextFieldsFile write Set_TextFieldsFile;
    property UserThesaurusFile: WideString read Get_UserThesaurusFile write Set_UserThesaurusFile;
    property HomeDir: WideString read Get_HomeDir write Set_HomeDir;
    property PrivateDir: WideString read Get_PrivateDir write Set_PrivateDir;
    property BooleanConnectors: WideString read Get_BooleanConnectors write Set_BooleanConnectors;
    property FileTypeTableFile: WideString read Get_FileTypeTableFile write Set_FileTypeTableFile;
    property UpdateFiles: WordBool read Get_UpdateFiles write Set_UpdateFiles;
    property LzwEnableCode: Integer read Get_LzwEnableCode write Set_LzwEnableCode;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TOptionsProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TOptions
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TOptionsProperties = class(TPersistent)
  private
    FServer:    TOptions;
    function    GetDefaultInterface: IOptions;
    constructor Create(AServer: TOptions);
  protected
    function  Get_BinaryFiles: Integer;
    procedure Set_BinaryFiles(pVal: Integer);
    function  Get_Hyphens: Integer;
    procedure Set_Hyphens(pVal: Integer);
    function  Get_IndexNumbers: WordBool;
    procedure Set_IndexNumbers(pVal: WordBool);
    function  Get_AlphabetName: WideString;
    procedure Set_AlphabetName(const pVal: WideString);
    function  Get_BinaryFilterTextChars: WideString;
    procedure Set_BinaryFilterTextChars(const pVal: WideString);
    function  Get_StemmingRulesFile: WideString;
    procedure Set_StemmingRulesFile(const pVal: WideString);
    function  Get_NoiseWordFile: WideString;
    procedure Set_NoiseWordFile(const pVal: WideString);
    function  Get_MaxWordsToRetrieve: Integer;
    procedure Set_MaxWordsToRetrieve(pVal: Integer);
    function  Get_MaxStoredFieldSize: Integer;
    procedure Set_MaxStoredFieldSize(pVal: Integer);
    function  Get_TitleSize: Integer;
    procedure Set_TitleSize(pVal: Integer);
    function  Get_XmlIgnoreTags: WideString;
    procedure Set_XmlIgnoreTags(const pVal: WideString);
    function  Get_MaxWordLength: Integer;
    procedure Set_MaxWordLength(pVal: Integer);
    function  Get_SegmentationRulesFile: WideString;
    procedure Set_SegmentationRulesFile(const pVal: WideString);
    function  Get_TextFieldsFile: WideString;
    procedure Set_TextFieldsFile(const pVal: WideString);
    function  Get_UserThesaurusFile: WideString;
    procedure Set_UserThesaurusFile(const pVal: WideString);
    function  Get_HomeDir: WideString;
    procedure Set_HomeDir(const pVal: WideString);
    function  Get_PrivateDir: WideString;
    procedure Set_PrivateDir(const pVal: WideString);
    function  Get_BooleanConnectors: WideString;
    procedure Set_BooleanConnectors(const pVal: WideString);
    function  Get_FileTypeTableFile: WideString;
    procedure Set_FileTypeTableFile(const pVal: WideString);
    function  Get_UpdateFiles: WordBool;
    procedure Set_UpdateFiles(pVal: WordBool);
    function  Get_LzwEnableCode: Integer;
    procedure Set_LzwEnableCode(pVal: Integer);
  public
    property DefaultInterface: IOptions read GetDefaultInterface;
  published
    property BinaryFiles: Integer read Get_BinaryFiles write Set_BinaryFiles;
    property Hyphens: Integer read Get_Hyphens write Set_Hyphens;
    property IndexNumbers: WordBool read Get_IndexNumbers write Set_IndexNumbers;
    property AlphabetName: WideString read Get_AlphabetName write Set_AlphabetName;
    property BinaryFilterTextChars: WideString read Get_BinaryFilterTextChars write Set_BinaryFilterTextChars;
    property StemmingRulesFile: WideString read Get_StemmingRulesFile write Set_StemmingRulesFile;
    property NoiseWordFile: WideString read Get_NoiseWordFile write Set_NoiseWordFile;
    property MaxWordsToRetrieve: Integer read Get_MaxWordsToRetrieve write Set_MaxWordsToRetrieve;
    property MaxStoredFieldSize: Integer read Get_MaxStoredFieldSize write Set_MaxStoredFieldSize;
    property TitleSize: Integer read Get_TitleSize write Set_TitleSize;
    property XmlIgnoreTags: WideString read Get_XmlIgnoreTags write Set_XmlIgnoreTags;
    property MaxWordLength: Integer read Get_MaxWordLength write Set_MaxWordLength;
    property SegmentationRulesFile: WideString read Get_SegmentationRulesFile write Set_SegmentationRulesFile;
    property TextFieldsFile: WideString read Get_TextFieldsFile write Set_TextFieldsFile;
    property UserThesaurusFile: WideString read Get_UserThesaurusFile write Set_UserThesaurusFile;
    property HomeDir: WideString read Get_HomeDir write Set_HomeDir;
    property PrivateDir: WideString read Get_PrivateDir write Set_PrivateDir;
    property BooleanConnectors: WideString read Get_BooleanConnectors write Set_BooleanConnectors;
    property FileTypeTableFile: WideString read Get_FileTypeTableFile write Set_FileTypeTableFile;
    property UpdateFiles: WordBool read Get_UpdateFiles write Set_UpdateFiles;
    property LzwEnableCode: Integer read Get_LzwEnableCode write Set_LzwEnableCode;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoWordListBuilder provides a Create and CreateRemote method to          
// create instances of the default interface IWordListBuilder exposed by              
// the CoClass WordListBuilder. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWordListBuilder = class
    class function Create: IWordListBuilder;
    class function CreateRemote(const MachineName: string): IWordListBuilder;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TWordListBuilder
// Help String      : WordListBuilder Class
// Default Interface: IWordListBuilder
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TWordListBuilderProperties= class;
{$ENDIF}
  TWordListBuilder = class(TOleServer)
  private
    FIntf:        IWordListBuilder;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TWordListBuilderProperties;
    function      GetServerProperties: TWordListBuilderProperties;
{$ENDIF}
    function      GetDefaultInterface: IWordListBuilder;
  protected
    procedure InitServerData; override;
    function  Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IWordListBuilder);
    procedure Disconnect; override;
    function  OpenIndex(const IndexName: WideString): Integer;
    procedure CloseIndex;
    function  ListWords(const CursorWord: WideString; Range: Integer): Integer;
    function  GetNthWord(iWord: Integer): WideString;
    function  GetNthWordCount(iWord: Integer): Integer;
    function  GetNthWordField(iWord: Integer): WideString;
    function  ListMatchingWords(const toMatch: WideString; nLimit: Integer; SearchFlags: Integer; 
                                Fuzziness: Integer): Integer;
    procedure ListFields(var pVal: Integer);
    property  DefaultInterface: IWordListBuilder read GetDefaultInterface;
    property Count: Integer read Get_Count;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TWordListBuilderProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TWordListBuilder
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TWordListBuilderProperties = class(TPersistent)
  private
    FServer:    TWordListBuilder;
    function    GetDefaultInterface: IWordListBuilder;
    constructor Create(AServer: TWordListBuilder);
  protected
    function  Get_Count: Integer;
  public
    property DefaultInterface: IWordListBuilder read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSearchResults provides a Create and CreateRemote method to          
// create instances of the default interface ISearchResults exposed by              
// the CoClass SearchResults. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSearchResults = class
    class function Create: ISearchResults;
    class function CreateRemote(const MachineName: string): ISearchResults;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSearchResults
// Help String      : SearchResults Class
// Default Interface: ISearchResults
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSearchResultsProperties= class;
{$ENDIF}
  TSearchResults = class(TOleServer)
  private
    FIntf:        ISearchResults;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSearchResultsProperties;
    function      GetServerProperties: TSearchResultsProperties;
{$ENDIF}
    function      GetDefaultInterface: ISearchResults;
  protected
    procedure InitServerData; override;
    function  Get_Count: Integer;
    function  Get_DocName: WideString;
    function  Get_DocHitCount: Integer;
    function  Get_DocDetails: WideString;
    function  Get_DocHits: WideString;
    function  Get_Request: WideString;
    function  Get_TotalHitCount: Integer;
    function  Get_HitByteOffsets: WideString;
    function  Get_DocDetailItem(const name: WideString): WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISearchResults);
    procedure Disconnect; override;
    function  GetNthDoc(iDoc: Integer): WordBool;
    procedure Sort(flags: Integer; const fieldName: WideString);
    function  NewSearchReportJob: IDispatch;
    procedure MakePdfHighlightFile;
    function  MakePdfWebHighlightFile: WideString;
    property  DefaultInterface: ISearchResults read GetDefaultInterface;
    property Count: Integer read Get_Count;
    property DocName: WideString read Get_DocName;
    property DocHitCount: Integer read Get_DocHitCount;
    property DocDetails: WideString read Get_DocDetails;
    property DocHits: WideString read Get_DocHits;
    property Request: WideString read Get_Request;
    property TotalHitCount: Integer read Get_TotalHitCount;
    property HitByteOffsets: WideString read Get_HitByteOffsets;
    property DocDetailItem[const name: WideString]: WideString read Get_DocDetailItem;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSearchResultsProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSearchResults
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSearchResultsProperties = class(TPersistent)
  private
    FServer:    TSearchResults;
    function    GetDefaultInterface: ISearchResults;
    constructor Create(AServer: TSearchResults);
  protected
    function  Get_Count: Integer;
    function  Get_DocName: WideString;
    function  Get_DocHitCount: Integer;
    function  Get_DocDetails: WideString;
    function  Get_DocHits: WideString;
    function  Get_Request: WideString;
    function  Get_TotalHitCount: Integer;
    function  Get_HitByteOffsets: WideString;
    function  Get_DocDetailItem(const name: WideString): WideString;
  public
    property DefaultInterface: ISearchResults read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses
  ComObj;

class function CoServer.Create: IServer;
begin
  Result := CreateComObject(CLASS_Server) as IServer;
end;

class function CoServer.CreateRemote(const MachineName: string): IServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Server) as IServer;
end;

procedure TServer.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A967E5D2-B0E1-11D3-B57C-00105AA461D0}';
    IntfIID:   '{A967E5D1-B0E1-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TServer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IServer;
  end;
end;

procedure TServer.ConnectTo(svrIntf: IServer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TServer.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TServer.GetDefaultInterface: IServer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TServerProperties.Create(Self);
{$ENDIF}
end;

destructor TServer.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TServer.GetServerProperties: TServerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TServer.Get_DebugLogName: WideString;
begin
  Result := DefaultInterface.Get_DebugLogName;
end;

procedure TServer.Set_DebugLogName(const pVal: WideString);
begin
  DefaultInterface.Set_DebugLogName(pVal);
end;

function  TServer.Get_HomeDir: WideString;
begin
  Result := DefaultInterface.Get_HomeDir;
end;

procedure TServer.Set_HomeDir(const pVal: WideString);
begin
  DefaultInterface.Set_HomeDir(pVal);
end;

function  TServer.Get_PrivateDir: WideString;
begin
  Result := DefaultInterface.Get_PrivateDir;
end;

procedure TServer.Set_PrivateDir(const pVal: WideString);
begin
  DefaultInterface.Set_PrivateDir(pVal);
end;

procedure TServer.Set_SendTestError(Param1: WordBool);
begin
  DefaultInterface.Set_SendTestError(Param1);
end;

procedure TServer.Set_SendTestInfo(Param1: WordBool);
begin
  DefaultInterface.Set_SendTestInfo(Param1);
end;

procedure TServer.Set_SendTestQuestion(Param1: WordBool);
begin
  DefaultInterface.Set_SendTestQuestion(Param1);
end;

function  TServer.Get_MajorVersion: Smallint;
begin
  Result := DefaultInterface.Get_MajorVersion;
end;

function  TServer.Get_MinorVersion: Smallint;
begin
  Result := DefaultInterface.Get_MinorVersion;
end;

function  TServer.Get_Build: Integer;
begin
  Result := DefaultInterface.Get_Build;
end;

function  TServer.Get_Initialized: WordBool;
begin
  Result := DefaultInterface.Get_Initialized;
end;

function  TServer.Get_InitMessage: WideString;
begin
  Result := DefaultInterface.Get_InitMessage;
end;

procedure TServer.Set_LzwEnableCode(Param1: Integer);
begin
  DefaultInterface.Set_LzwEnableCode(Param1);
end;

function  TServer.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TServer.Get_MessageHandler: IDispatch;
begin
  Result := DefaultInterface.Get_MessageHandler;
end;

procedure TServer.Set_MessageHandler(const pVal: IDispatch);
begin
  DefaultInterface.Set_MessageHandler(pVal);
end;

function  TServer.Get_AllocatedObjectList: WideString;
begin
  Result := DefaultInterface.Get_AllocatedObjectList;
end;

function  TServer.Initialize: WordBool;
begin
  Result := DefaultInterface.Initialize;
end;

procedure TServer.Shutdown;
begin
  DefaultInterface.Shutdown;
end;

function  TServer.NewIndexJob: IDispatch;
begin
  Result := DefaultInterface.NewIndexJob;
end;

function  TServer.NewSearchJob: IDispatch;
begin
  Result := DefaultInterface.NewSearchJob;
end;

function  TServer.NewOptions: IDispatch;
begin
  Result := DefaultInterface.NewOptions;
end;

function  TServer.NewFileConverter: IDispatch;
begin
  Result := DefaultInterface.NewFileConverter;
end;

function  TServer.NewWordListBuilder: IDispatch;
begin
  Result := DefaultInterface.NewWordListBuilder;
end;

function  TServer.ConvertPath(const path: WideString; siteId: Integer; flags: Integer; 
                              const tableLocation: WideString): WideString;
begin
  Result := DefaultInterface.ConvertPath(path, siteId, flags, tableLocation);
end;

procedure TServer.SetDebugLogging(const LogName: WideString; flags: Integer);
begin
  DefaultInterface.SetDebugLogging(LogName, flags);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TServerProperties.Create(AServer: TServer);
begin
  inherited Create;
  FServer := AServer;
end;

function TServerProperties.GetDefaultInterface: IServer;
begin
  Result := FServer.DefaultInterface;
end;

function  TServerProperties.Get_DebugLogName: WideString;
begin
  Result := DefaultInterface.Get_DebugLogName;
end;

procedure TServerProperties.Set_DebugLogName(const pVal: WideString);
begin
  DefaultInterface.Set_DebugLogName(pVal);
end;

function  TServerProperties.Get_HomeDir: WideString;
begin
  Result := DefaultInterface.Get_HomeDir;
end;

procedure TServerProperties.Set_HomeDir(const pVal: WideString);
begin
  DefaultInterface.Set_HomeDir(pVal);
end;

function  TServerProperties.Get_PrivateDir: WideString;
begin
  Result := DefaultInterface.Get_PrivateDir;
end;

procedure TServerProperties.Set_PrivateDir(const pVal: WideString);
begin
  DefaultInterface.Set_PrivateDir(pVal);
end;

procedure TServerProperties.Set_SendTestError(Param1: WordBool);
begin
  DefaultInterface.Set_SendTestError(Param1);
end;

procedure TServerProperties.Set_SendTestInfo(Param1: WordBool);
begin
  DefaultInterface.Set_SendTestInfo(Param1);
end;

procedure TServerProperties.Set_SendTestQuestion(Param1: WordBool);
begin
  DefaultInterface.Set_SendTestQuestion(Param1);
end;

function  TServerProperties.Get_MajorVersion: Smallint;
begin
  Result := DefaultInterface.Get_MajorVersion;
end;

function  TServerProperties.Get_MinorVersion: Smallint;
begin
  Result := DefaultInterface.Get_MinorVersion;
end;

function  TServerProperties.Get_Build: Integer;
begin
  Result := DefaultInterface.Get_Build;
end;

function  TServerProperties.Get_Initialized: WordBool;
begin
  Result := DefaultInterface.Get_Initialized;
end;

function  TServerProperties.Get_InitMessage: WideString;
begin
  Result := DefaultInterface.Get_InitMessage;
end;

procedure TServerProperties.Set_LzwEnableCode(Param1: Integer);
begin
  DefaultInterface.Set_LzwEnableCode(Param1);
end;

function  TServerProperties.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TServerProperties.Get_MessageHandler: IDispatch;
begin
  Result := DefaultInterface.Get_MessageHandler;
end;

procedure TServerProperties.Set_MessageHandler(const pVal: IDispatch);
begin
  DefaultInterface.Set_MessageHandler(pVal);
end;

function  TServerProperties.Get_AllocatedObjectList: WideString;
begin
  Result := DefaultInterface.Get_AllocatedObjectList;
end;

{$ENDIF}

class function CoJobErrorInfo.Create: IJobErrorInfo;
begin
  Result := CreateComObject(CLASS_JobErrorInfo) as IJobErrorInfo;
end;

class function CoJobErrorInfo.CreateRemote(const MachineName: string): IJobErrorInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_JobErrorInfo) as IJobErrorInfo;
end;

procedure TJobErrorInfo.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A967E5D6-B0E1-11D3-B57C-00105AA461D0}';
    IntfIID:   '{A967E5D5-B0E1-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TJobErrorInfo.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IJobErrorInfo;
  end;
end;

procedure TJobErrorInfo.ConnectTo(svrIntf: IJobErrorInfo);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TJobErrorInfo.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TJobErrorInfo.GetDefaultInterface: IJobErrorInfo;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TJobErrorInfo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TJobErrorInfoProperties.Create(Self);
{$ENDIF}
end;

destructor TJobErrorInfo.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TJobErrorInfo.GetServerProperties: TJobErrorInfoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TJobErrorInfo.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

function  TJobErrorInfo.Get_Message(iMessage: Integer): WideString;
begin
  Result := DefaultInterface.Get_Message(iMessage);
end;

function  TJobErrorInfo.Get_Code(iMessage: Integer): Integer;
begin
  Result := DefaultInterface.Get_Code(iMessage);
end;

function  TJobErrorInfo.Get_Arg1(iMessage: Integer): WideString;
begin
  Result := DefaultInterface.Get_Arg1(iMessage);
end;

function  TJobErrorInfo.Get_Arg2(iMessage: Integer): WideString;
begin
  Result := DefaultInterface.Get_Arg2(iMessage);
end;

function  TJobErrorInfo.Format: WideString;
begin
  Result := DefaultInterface.Format;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TJobErrorInfoProperties.Create(AServer: TJobErrorInfo);
begin
  inherited Create;
  FServer := AServer;
end;

function TJobErrorInfoProperties.GetDefaultInterface: IJobErrorInfo;
begin
  Result := FServer.DefaultInterface;
end;

function  TJobErrorInfoProperties.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

function  TJobErrorInfoProperties.Get_Message(iMessage: Integer): WideString;
begin
  Result := DefaultInterface.Get_Message(iMessage);
end;

function  TJobErrorInfoProperties.Get_Code(iMessage: Integer): Integer;
begin
  Result := DefaultInterface.Get_Code(iMessage);
end;

function  TJobErrorInfoProperties.Get_Arg1(iMessage: Integer): WideString;
begin
  Result := DefaultInterface.Get_Arg1(iMessage);
end;

function  TJobErrorInfoProperties.Get_Arg2(iMessage: Integer): WideString;
begin
  Result := DefaultInterface.Get_Arg2(iMessage);
end;

{$ENDIF}

class function CoIndexJob.Create: IIndexJob;
begin
  Result := CreateComObject(CLASS_IndexJob) as IIndexJob;
end;

class function CoIndexJob.CreateRemote(const MachineName: string): IIndexJob;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_IndexJob) as IIndexJob;
end;

procedure TIndexJob.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{697DF023-B24E-11D3-B57C-00105AA461D0}';
    IntfIID:   '{697DF022-B24E-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TIndexJob.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IIndexJob;
  end;
end;

procedure TIndexJob.ConnectTo(svrIntf: IIndexJob);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TIndexJob.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TIndexJob.GetDefaultInterface: IIndexJob;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TIndexJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TIndexJobProperties.Create(Self);
{$ENDIF}
end;

destructor TIndexJob.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TIndexJob.GetServerProperties: TIndexJobProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TIndexJob.Get_ActionAdd: WordBool;
begin
  Result := DefaultInterface.Get_ActionAdd;
end;

procedure TIndexJob.Set_ActionAdd(pVal: WordBool);
begin
  DefaultInterface.Set_ActionAdd(pVal);
end;

function  TIndexJob.Get_ActionCompress: WordBool;
begin
  Result := DefaultInterface.Get_ActionCompress;
end;

procedure TIndexJob.Set_ActionCompress(pVal: WordBool);
begin
  DefaultInterface.Set_ActionCompress(pVal);
end;

function  TIndexJob.Get_ActionCreate: WordBool;
begin
  Result := DefaultInterface.Get_ActionCreate;
end;

procedure TIndexJob.Set_ActionCreate(pVal: WordBool);
begin
  DefaultInterface.Set_ActionCreate(pVal);
end;

function  TIndexJob.Get_ActionRemoveDeleted: WordBool;
begin
  Result := DefaultInterface.Get_ActionRemoveDeleted;
end;

procedure TIndexJob.Set_ActionRemoveDeleted(pVal: WordBool);
begin
  DefaultInterface.Set_ActionRemoveDeleted(pVal);
end;

function  TIndexJob.Get_ActionRemoveListed: WordBool;
begin
  Result := DefaultInterface.Get_ActionRemoveListed;
end;

procedure TIndexJob.Set_ActionRemoveListed(pVal: WordBool);
begin
  DefaultInterface.Set_ActionRemoveListed(pVal);
end;

function  TIndexJob.Get_AllowConcurrentAccess: WordBool;
begin
  Result := DefaultInterface.Get_AllowConcurrentAccess;
end;

procedure TIndexJob.Set_AllowConcurrentAccess(pVal: WordBool);
begin
  DefaultInterface.Set_AllowConcurrentAccess(pVal);
end;

function  TIndexJob.Get_CreateAccentSensitive: WordBool;
begin
  Result := DefaultInterface.Get_CreateAccentSensitive;
end;

procedure TIndexJob.Set_CreateAccentSensitive(pVal: WordBool);
begin
  DefaultInterface.Set_CreateAccentSensitive(pVal);
end;

function  TIndexJob.Get_CreateCaseSensitive: WordBool;
begin
  Result := DefaultInterface.Get_CreateCaseSensitive;
end;

procedure TIndexJob.Set_CreateCaseSensitive(pVal: WordBool);
begin
  DefaultInterface.Set_CreateCaseSensitive(pVal);
end;

procedure TIndexJob.Set_DataSourceToIndex(const Param1: IDispatch);
begin
  DefaultInterface.Set_DataSourceToIndex(Param1);
end;

function  TIndexJob.Get_IndexName: WideString;
begin
  Result := DefaultInterface.Get_IndexName;
end;

procedure TIndexJob.Set_IndexName(const pVal: WideString);
begin
  DefaultInterface.Set_IndexName(pVal);
end;

function  TIndexJob.Get_IndexPath: WideString;
begin
  Result := DefaultInterface.Get_IndexPath;
end;

procedure TIndexJob.Set_IndexPath(const pVal: WideString);
begin
  DefaultInterface.Set_IndexPath(pVal);
end;

procedure TIndexJob.Set_StatusHandler(const Param1: IDispatch);
begin
  DefaultInterface.Set_StatusHandler(Param1);
end;

function  TIndexJob.Get_StoredFields: WideString;
begin
  Result := DefaultInterface.Get_StoredFields;
end;

procedure TIndexJob.Set_StoredFields(const pVal: WideString);
begin
  DefaultInterface.Set_StoredFields(pVal);
end;

function  TIndexJob.Get_ToAddDir: WideString;
begin
  Result := DefaultInterface.Get_ToAddDir;
end;

procedure TIndexJob.Set_ToAddDir(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddDir(pVal);
end;

function  TIndexJob.Get_ToAddDirListName: WideString;
begin
  Result := DefaultInterface.Get_ToAddDirListName;
end;

procedure TIndexJob.Set_ToAddDirListName(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddDirListName(pVal);
end;

function  TIndexJob.Get_ToAddExcludeFilters: WideString;
begin
  Result := DefaultInterface.Get_ToAddExcludeFilters;
end;

procedure TIndexJob.Set_ToAddExcludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddExcludeFilters(pVal);
end;

function  TIndexJob.Get_ToAddFileListName: WideString;
begin
  Result := DefaultInterface.Get_ToAddFileListName;
end;

procedure TIndexJob.Set_ToAddFileListName(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddFileListName(pVal);
end;

function  TIndexJob.Get_ToAddIncludeFilters: WideString;
begin
  Result := DefaultInterface.Get_ToAddIncludeFilters;
end;

procedure TIndexJob.Set_ToAddIncludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddIncludeFilters(pVal);
end;

function  TIndexJob.Get_ToRemoveListName: WideString;
begin
  Result := DefaultInterface.Get_ToRemoveListName;
end;

procedure TIndexJob.Set_ToRemoveListName(const pVal: WideString);
begin
  DefaultInterface.Set_ToRemoveListName(pVal);
end;

function  TIndexJob.Get_IsThreadDone: WordBool;
begin
  Result := DefaultInterface.Get_IsThreadDone;
end;

function  TIndexJob.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TIndexJob.Get_StatusIndexingStep: Integer;
begin
  Result := DefaultInterface.Get_StatusIndexingStep;
end;

function  TIndexJob.Get_StatusPercentDone: Integer;
begin
  Result := DefaultInterface.Get_StatusPercentDone;
end;

function  TIndexJob.Get_StatusCurrentFileLocation: WideString;
begin
  Result := DefaultInterface.Get_StatusCurrentFileLocation;
end;

function  TIndexJob.Get_StatusCurrentFileName: WideString;
begin
  Result := DefaultInterface.Get_StatusCurrentFileName;
end;

function  TIndexJob.Get_StatusCurrentFileType: WideString;
begin
  Result := DefaultInterface.Get_StatusCurrentFileType;
end;

function  TIndexJob.Get_StatusDiskAvailKB: Integer;
begin
  Result := DefaultInterface.Get_StatusDiskAvailKB;
end;

function  TIndexJob.Get_StatusWordsInIndex: Integer;
begin
  Result := DefaultInterface.Get_StatusWordsInIndex;
end;

function  TIndexJob.Get_StatusDocsInIndex: Integer;
begin
  Result := DefaultInterface.Get_StatusDocsInIndex;
end;

function  TIndexJob.Get_StatusBytesIndexedKB: Integer;
begin
  Result := DefaultInterface.Get_StatusBytesIndexedKB;
end;

function  TIndexJob.Get_StatusBytesToIndexKB: Integer;
begin
  Result := DefaultInterface.Get_StatusBytesToIndexKB;
end;

function  TIndexJob.Get_StatusCurrentFilePercentDone: Integer;
begin
  Result := DefaultInterface.Get_StatusCurrentFilePercentDone;
end;

function  TIndexJob.Get_CreateAddToLibrary: WordBool;
begin
  Result := DefaultInterface.Get_CreateAddToLibrary;
end;

procedure TIndexJob.Set_CreateAddToLibrary(pVal: WordBool);
begin
  DefaultInterface.Set_CreateAddToLibrary(pVal);
end;

function  TIndexJob.Get_CreateRelativePaths: WordBool;
begin
  Result := DefaultInterface.Get_CreateRelativePaths;
end;

procedure TIndexJob.Set_CreateRelativePaths(pVal: WordBool);
begin
  DefaultInterface.Set_CreateRelativePaths(pVal);
end;

function  TIndexJob.Execute: Smallint;
begin
  Result := DefaultInterface.Execute;
end;

procedure TIndexJob.ExecuteInThread;
begin
  DefaultInterface.ExecuteInThread;
end;

procedure TIndexJob.AbortThread;
begin
  DefaultInterface.AbortThread;
end;

procedure TIndexJob.AbortThreadImmediate;
begin
  DefaultInterface.AbortThreadImmediate;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TIndexJobProperties.Create(AServer: TIndexJob);
begin
  inherited Create;
  FServer := AServer;
end;

function TIndexJobProperties.GetDefaultInterface: IIndexJob;
begin
  Result := FServer.DefaultInterface;
end;

function  TIndexJobProperties.Get_ActionAdd: WordBool;
begin
  Result := DefaultInterface.Get_ActionAdd;
end;

procedure TIndexJobProperties.Set_ActionAdd(pVal: WordBool);
begin
  DefaultInterface.Set_ActionAdd(pVal);
end;

function  TIndexJobProperties.Get_ActionCompress: WordBool;
begin
  Result := DefaultInterface.Get_ActionCompress;
end;

procedure TIndexJobProperties.Set_ActionCompress(pVal: WordBool);
begin
  DefaultInterface.Set_ActionCompress(pVal);
end;

function  TIndexJobProperties.Get_ActionCreate: WordBool;
begin
  Result := DefaultInterface.Get_ActionCreate;
end;

procedure TIndexJobProperties.Set_ActionCreate(pVal: WordBool);
begin
  DefaultInterface.Set_ActionCreate(pVal);
end;

function  TIndexJobProperties.Get_ActionRemoveDeleted: WordBool;
begin
  Result := DefaultInterface.Get_ActionRemoveDeleted;
end;

procedure TIndexJobProperties.Set_ActionRemoveDeleted(pVal: WordBool);
begin
  DefaultInterface.Set_ActionRemoveDeleted(pVal);
end;

function  TIndexJobProperties.Get_ActionRemoveListed: WordBool;
begin
  Result := DefaultInterface.Get_ActionRemoveListed;
end;

procedure TIndexJobProperties.Set_ActionRemoveListed(pVal: WordBool);
begin
  DefaultInterface.Set_ActionRemoveListed(pVal);
end;

function  TIndexJobProperties.Get_AllowConcurrentAccess: WordBool;
begin
  Result := DefaultInterface.Get_AllowConcurrentAccess;
end;

procedure TIndexJobProperties.Set_AllowConcurrentAccess(pVal: WordBool);
begin
  DefaultInterface.Set_AllowConcurrentAccess(pVal);
end;

function  TIndexJobProperties.Get_CreateAccentSensitive: WordBool;
begin
  Result := DefaultInterface.Get_CreateAccentSensitive;
end;

procedure TIndexJobProperties.Set_CreateAccentSensitive(pVal: WordBool);
begin
  DefaultInterface.Set_CreateAccentSensitive(pVal);
end;

function  TIndexJobProperties.Get_CreateCaseSensitive: WordBool;
begin
  Result := DefaultInterface.Get_CreateCaseSensitive;
end;

procedure TIndexJobProperties.Set_CreateCaseSensitive(pVal: WordBool);
begin
  DefaultInterface.Set_CreateCaseSensitive(pVal);
end;

procedure TIndexJobProperties.Set_DataSourceToIndex(const Param1: IDispatch);
begin
  DefaultInterface.Set_DataSourceToIndex(Param1);
end;

function  TIndexJobProperties.Get_IndexName: WideString;
begin
  Result := DefaultInterface.Get_IndexName;
end;

procedure TIndexJobProperties.Set_IndexName(const pVal: WideString);
begin
  DefaultInterface.Set_IndexName(pVal);
end;

function  TIndexJobProperties.Get_IndexPath: WideString;
begin
  Result := DefaultInterface.Get_IndexPath;
end;

procedure TIndexJobProperties.Set_IndexPath(const pVal: WideString);
begin
  DefaultInterface.Set_IndexPath(pVal);
end;

procedure TIndexJobProperties.Set_StatusHandler(const Param1: IDispatch);
begin
  DefaultInterface.Set_StatusHandler(Param1);
end;

function  TIndexJobProperties.Get_StoredFields: WideString;
begin
  Result := DefaultInterface.Get_StoredFields;
end;

procedure TIndexJobProperties.Set_StoredFields(const pVal: WideString);
begin
  DefaultInterface.Set_StoredFields(pVal);
end;

function  TIndexJobProperties.Get_ToAddDir: WideString;
begin
  Result := DefaultInterface.Get_ToAddDir;
end;

procedure TIndexJobProperties.Set_ToAddDir(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddDir(pVal);
end;

function  TIndexJobProperties.Get_ToAddDirListName: WideString;
begin
  Result := DefaultInterface.Get_ToAddDirListName;
end;

procedure TIndexJobProperties.Set_ToAddDirListName(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddDirListName(pVal);
end;

function  TIndexJobProperties.Get_ToAddExcludeFilters: WideString;
begin
  Result := DefaultInterface.Get_ToAddExcludeFilters;
end;

procedure TIndexJobProperties.Set_ToAddExcludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddExcludeFilters(pVal);
end;

function  TIndexJobProperties.Get_ToAddFileListName: WideString;
begin
  Result := DefaultInterface.Get_ToAddFileListName;
end;

procedure TIndexJobProperties.Set_ToAddFileListName(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddFileListName(pVal);
end;

function  TIndexJobProperties.Get_ToAddIncludeFilters: WideString;
begin
  Result := DefaultInterface.Get_ToAddIncludeFilters;
end;

procedure TIndexJobProperties.Set_ToAddIncludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_ToAddIncludeFilters(pVal);
end;

function  TIndexJobProperties.Get_ToRemoveListName: WideString;
begin
  Result := DefaultInterface.Get_ToRemoveListName;
end;

procedure TIndexJobProperties.Set_ToRemoveListName(const pVal: WideString);
begin
  DefaultInterface.Set_ToRemoveListName(pVal);
end;

function  TIndexJobProperties.Get_IsThreadDone: WordBool;
begin
  Result := DefaultInterface.Get_IsThreadDone;
end;

function  TIndexJobProperties.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TIndexJobProperties.Get_StatusIndexingStep: Integer;
begin
  Result := DefaultInterface.Get_StatusIndexingStep;
end;

function  TIndexJobProperties.Get_StatusPercentDone: Integer;
begin
  Result := DefaultInterface.Get_StatusPercentDone;
end;

function  TIndexJobProperties.Get_StatusCurrentFileLocation: WideString;
begin
  Result := DefaultInterface.Get_StatusCurrentFileLocation;
end;

function  TIndexJobProperties.Get_StatusCurrentFileName: WideString;
begin
  Result := DefaultInterface.Get_StatusCurrentFileName;
end;

function  TIndexJobProperties.Get_StatusCurrentFileType: WideString;
begin
  Result := DefaultInterface.Get_StatusCurrentFileType;
end;

function  TIndexJobProperties.Get_StatusDiskAvailKB: Integer;
begin
  Result := DefaultInterface.Get_StatusDiskAvailKB;
end;

function  TIndexJobProperties.Get_StatusWordsInIndex: Integer;
begin
  Result := DefaultInterface.Get_StatusWordsInIndex;
end;

function  TIndexJobProperties.Get_StatusDocsInIndex: Integer;
begin
  Result := DefaultInterface.Get_StatusDocsInIndex;
end;

function  TIndexJobProperties.Get_StatusBytesIndexedKB: Integer;
begin
  Result := DefaultInterface.Get_StatusBytesIndexedKB;
end;

function  TIndexJobProperties.Get_StatusBytesToIndexKB: Integer;
begin
  Result := DefaultInterface.Get_StatusBytesToIndexKB;
end;

function  TIndexJobProperties.Get_StatusCurrentFilePercentDone: Integer;
begin
  Result := DefaultInterface.Get_StatusCurrentFilePercentDone;
end;

function  TIndexJobProperties.Get_CreateAddToLibrary: WordBool;
begin
  Result := DefaultInterface.Get_CreateAddToLibrary;
end;

procedure TIndexJobProperties.Set_CreateAddToLibrary(pVal: WordBool);
begin
  DefaultInterface.Set_CreateAddToLibrary(pVal);
end;

function  TIndexJobProperties.Get_CreateRelativePaths: WordBool;
begin
  Result := DefaultInterface.Get_CreateRelativePaths;
end;

procedure TIndexJobProperties.Set_CreateRelativePaths(pVal: WordBool);
begin
  DefaultInterface.Set_CreateRelativePaths(pVal);
end;

{$ENDIF}

class function CoSearchJob.Create: ISearchJob;
begin
  Result := CreateComObject(CLASS_SearchJob) as ISearchJob;
end;

class function CoSearchJob.CreateRemote(const MachineName: string): ISearchJob;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SearchJob) as ISearchJob;
end;

procedure TSearchJob.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{697DF025-B24E-11D3-B57C-00105AA461D0}';
    IntfIID:   '{697DF024-B24E-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSearchJob.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISearchJob;
  end;
end;

procedure TSearchJob.ConnectTo(svrIntf: ISearchJob);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSearchJob.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSearchJob.GetDefaultInterface: ISearchJob;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSearchJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSearchJobProperties.Create(Self);
{$ENDIF}
end;

destructor TSearchJob.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSearchJob.GetServerProperties: TSearchJobProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TSearchJob.Get_DirListName: WideString;
begin
  Result := DefaultInterface.Get_DirListName;
end;

procedure TSearchJob.Set_DirListName(const pVal: WideString);
begin
  DefaultInterface.Set_DirListName(pVal);
end;

function  TSearchJob.Get_DirToSearch: WideString;
begin
  Result := DefaultInterface.Get_DirToSearch;
end;

procedure TSearchJob.Set_DirToSearch(const pVal: WideString);
begin
  DefaultInterface.Set_DirToSearch(pVal);
end;

function  TSearchJob.Get_ExcludeFilters: WideString;
begin
  Result := DefaultInterface.Get_ExcludeFilters;
end;

procedure TSearchJob.Set_ExcludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_ExcludeFilters(pVal);
end;

function  TSearchJob.Get_FileCount: Integer;
begin
  Result := DefaultInterface.Get_FileCount;
end;

function  TSearchJob.Get_HitCount: Integer;
begin
  Result := DefaultInterface.Get_HitCount;
end;

function  TSearchJob.Get_Fuzziness: Integer;
begin
  Result := DefaultInterface.Get_Fuzziness;
end;

procedure TSearchJob.Set_Fuzziness(pVal: Integer);
begin
  DefaultInterface.Set_Fuzziness(pVal);
end;

function  TSearchJob.Get_IncludeFilters: WideString;
begin
  Result := DefaultInterface.Get_IncludeFilters;
end;

procedure TSearchJob.Set_IncludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_IncludeFilters(pVal);
end;

function  TSearchJob.Get_IndexesToSearch: WideString;
begin
  Result := DefaultInterface.Get_IndexesToSearch;
end;

procedure TSearchJob.Set_IndexesToSearch(const pVal: WideString);
begin
  DefaultInterface.Set_IndexesToSearch(pVal);
end;

function  TSearchJob.Get_MaxFilesToRetrieve: Integer;
begin
  Result := DefaultInterface.Get_MaxFilesToRetrieve;
end;

procedure TSearchJob.Set_MaxFilesToRetrieve(pVal: Integer);
begin
  DefaultInterface.Set_MaxFilesToRetrieve(pVal);
end;

function  TSearchJob.Get_NaturalLanguage: WordBool;
begin
  Result := DefaultInterface.Get_NaturalLanguage;
end;

procedure TSearchJob.Set_NaturalLanguage(pVal: WordBool);
begin
  DefaultInterface.Set_NaturalLanguage(pVal);
end;

function  TSearchJob.Get_OutputListingHits: WordBool;
begin
  Result := DefaultInterface.Get_OutputListingHits;
end;

procedure TSearchJob.Set_OutputListingHits(pVal: WordBool);
begin
  DefaultInterface.Set_OutputListingHits(pVal);
end;

function  TSearchJob.Get_PhonicSearching: WordBool;
begin
  Result := DefaultInterface.Get_PhonicSearching;
end;

procedure TSearchJob.Set_PhonicSearching(pVal: WordBool);
begin
  DefaultInterface.Set_PhonicSearching(pVal);
end;

function  TSearchJob.Get_Request: WideString;
begin
  Result := DefaultInterface.Get_Request;
end;

procedure TSearchJob.Set_Request(const pVal: WideString);
begin
  DefaultInterface.Set_Request(pVal);
end;

function  TSearchJob.Get_ResultsInMemory: WordBool;
begin
  Result := DefaultInterface.Get_ResultsInMemory;
end;

procedure TSearchJob.Set_ResultsInMemory(pVal: WordBool);
begin
  DefaultInterface.Set_ResultsInMemory(pVal);
end;

function  TSearchJob.Get_StatusHandler: IDispatch;
begin
  Result := DefaultInterface.Get_StatusHandler;
end;

procedure TSearchJob.Set_StatusHandler(const pVal: IDispatch);
begin
  DefaultInterface.Set_StatusHandler(pVal);
end;

function  TSearchJob.Get_Stemming: WordBool;
begin
  Result := DefaultInterface.Get_Stemming;
end;

procedure TSearchJob.Set_Stemming(pVal: WordBool);
begin
  DefaultInterface.Set_Stemming(pVal);
end;

function  TSearchJob.Get_Synonyms: WordBool;
begin
  Result := DefaultInterface.Get_Synonyms;
end;

procedure TSearchJob.Set_Synonyms(pVal: WordBool);
begin
  DefaultInterface.Set_Synonyms(pVal);
end;

function  TSearchJob.Get_UserSynonyms: WordBool;
begin
  Result := DefaultInterface.Get_UserSynonyms;
end;

procedure TSearchJob.Set_UserSynonyms(pVal: WordBool);
begin
  DefaultInterface.Set_UserSynonyms(pVal);
end;

function  TSearchJob.Get_WordNetSynonyms: WordBool;
begin
  Result := DefaultInterface.Get_WordNetSynonyms;
end;

procedure TSearchJob.Set_WordNetSynonyms(pVal: WordBool);
begin
  DefaultInterface.Set_WordNetSynonyms(pVal);
end;

function  TSearchJob.Get_WordNetRelated: WordBool;
begin
  Result := DefaultInterface.Get_WordNetRelated;
end;

procedure TSearchJob.Set_WordNetRelated(pVal: WordBool);
begin
  DefaultInterface.Set_WordNetRelated(pVal);
end;

function  TSearchJob.Get_Results: IDispatch;
begin
  Result := DefaultInterface.Get_Results;
end;

function  TSearchJob.Get_IsThreadDone: WordBool;
begin
  Result := DefaultInterface.Get_IsThreadDone;
end;

function  TSearchJob.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TSearchJob.Get_TimeoutSeconds: Integer;
begin
  Result := DefaultInterface.Get_TimeoutSeconds;
end;

procedure TSearchJob.Set_TimeoutSeconds(pVal: Integer);
begin
  DefaultInterface.Set_TimeoutSeconds(pVal);
end;

function  TSearchJob.Get_DelayDocInfo: WordBool;
begin
  Result := DefaultInterface.Get_DelayDocInfo;
end;

procedure TSearchJob.Set_DelayDocInfo(pVal: WordBool);
begin
  DefaultInterface.Set_DelayDocInfo(pVal);
end;

function  TSearchJob.Get_RegularExpression: WordBool;
begin
  Result := DefaultInterface.Get_RegularExpression;
end;

procedure TSearchJob.Set_RegularExpression(pVal: WordBool);
begin
  DefaultInterface.Set_RegularExpression(pVal);
end;

function  TSearchJob.Get_SearchFlags: Integer;
begin
  Result := DefaultInterface.Get_SearchFlags;
end;

procedure TSearchJob.Set_SearchFlags(pVal: Integer);
begin
  DefaultInterface.Set_SearchFlags(pVal);
end;

function  TSearchJob.Get_OutputListingName: WideString;
begin
  Result := DefaultInterface.Get_OutputListingName;
end;

procedure TSearchJob.Set_OutputListingName(const pVal: WideString);
begin
  DefaultInterface.Set_OutputListingName(pVal);
end;

function  TSearchJob.Get_ExternalSynonyms: WordBool;
begin
  Result := DefaultInterface.Get_ExternalSynonyms;
end;

procedure TSearchJob.Set_ExternalSynonyms(pVal: WordBool);
begin
  DefaultInterface.Set_ExternalSynonyms(pVal);
end;

function  TSearchJob.Get_FileConditions: WideString;
begin
  Result := DefaultInterface.Get_FileConditions;
end;

procedure TSearchJob.Set_FileConditions(const pVal: WideString);
begin
  DefaultInterface.Set_FileConditions(pVal);
end;

function  TSearchJob.Execute: Smallint;
begin
  Result := DefaultInterface.Execute;
end;

procedure TSearchJob.ExecuteInThread;
begin
  DefaultInterface.ExecuteInThread;
end;

procedure TSearchJob.AbortThread;
begin
  DefaultInterface.AbortThread;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSearchJobProperties.Create(AServer: TSearchJob);
begin
  inherited Create;
  FServer := AServer;
end;

function TSearchJobProperties.GetDefaultInterface: ISearchJob;
begin
  Result := FServer.DefaultInterface;
end;

function  TSearchJobProperties.Get_DirListName: WideString;
begin
  Result := DefaultInterface.Get_DirListName;
end;

procedure TSearchJobProperties.Set_DirListName(const pVal: WideString);
begin
  DefaultInterface.Set_DirListName(pVal);
end;

function  TSearchJobProperties.Get_DirToSearch: WideString;
begin
  Result := DefaultInterface.Get_DirToSearch;
end;

procedure TSearchJobProperties.Set_DirToSearch(const pVal: WideString);
begin
  DefaultInterface.Set_DirToSearch(pVal);
end;

function  TSearchJobProperties.Get_ExcludeFilters: WideString;
begin
  Result := DefaultInterface.Get_ExcludeFilters;
end;

procedure TSearchJobProperties.Set_ExcludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_ExcludeFilters(pVal);
end;

function  TSearchJobProperties.Get_FileCount: Integer;
begin
  Result := DefaultInterface.Get_FileCount;
end;

function  TSearchJobProperties.Get_HitCount: Integer;
begin
  Result := DefaultInterface.Get_HitCount;
end;

function  TSearchJobProperties.Get_Fuzziness: Integer;
begin
  Result := DefaultInterface.Get_Fuzziness;
end;

procedure TSearchJobProperties.Set_Fuzziness(pVal: Integer);
begin
  DefaultInterface.Set_Fuzziness(pVal);
end;

function  TSearchJobProperties.Get_IncludeFilters: WideString;
begin
  Result := DefaultInterface.Get_IncludeFilters;
end;

procedure TSearchJobProperties.Set_IncludeFilters(const pVal: WideString);
begin
  DefaultInterface.Set_IncludeFilters(pVal);
end;

function  TSearchJobProperties.Get_IndexesToSearch: WideString;
begin
  Result := DefaultInterface.Get_IndexesToSearch;
end;

procedure TSearchJobProperties.Set_IndexesToSearch(const pVal: WideString);
begin
  DefaultInterface.Set_IndexesToSearch(pVal);
end;

function  TSearchJobProperties.Get_MaxFilesToRetrieve: Integer;
begin
  Result := DefaultInterface.Get_MaxFilesToRetrieve;
end;

procedure TSearchJobProperties.Set_MaxFilesToRetrieve(pVal: Integer);
begin
  DefaultInterface.Set_MaxFilesToRetrieve(pVal);
end;

function  TSearchJobProperties.Get_NaturalLanguage: WordBool;
begin
  Result := DefaultInterface.Get_NaturalLanguage;
end;

procedure TSearchJobProperties.Set_NaturalLanguage(pVal: WordBool);
begin
  DefaultInterface.Set_NaturalLanguage(pVal);
end;

function  TSearchJobProperties.Get_OutputListingHits: WordBool;
begin
  Result := DefaultInterface.Get_OutputListingHits;
end;

procedure TSearchJobProperties.Set_OutputListingHits(pVal: WordBool);
begin
  DefaultInterface.Set_OutputListingHits(pVal);
end;

function  TSearchJobProperties.Get_PhonicSearching: WordBool;
begin
  Result := DefaultInterface.Get_PhonicSearching;
end;

procedure TSearchJobProperties.Set_PhonicSearching(pVal: WordBool);
begin
  DefaultInterface.Set_PhonicSearching(pVal);
end;

function  TSearchJobProperties.Get_Request: WideString;
begin
  Result := DefaultInterface.Get_Request;
end;

procedure TSearchJobProperties.Set_Request(const pVal: WideString);
begin
  DefaultInterface.Set_Request(pVal);
end;

function  TSearchJobProperties.Get_ResultsInMemory: WordBool;
begin
  Result := DefaultInterface.Get_ResultsInMemory;
end;

procedure TSearchJobProperties.Set_ResultsInMemory(pVal: WordBool);
begin
  DefaultInterface.Set_ResultsInMemory(pVal);
end;

function  TSearchJobProperties.Get_StatusHandler: IDispatch;
begin
  Result := DefaultInterface.Get_StatusHandler;
end;

procedure TSearchJobProperties.Set_StatusHandler(const pVal: IDispatch);
begin
  DefaultInterface.Set_StatusHandler(pVal);
end;

function  TSearchJobProperties.Get_Stemming: WordBool;
begin
  Result := DefaultInterface.Get_Stemming;
end;

procedure TSearchJobProperties.Set_Stemming(pVal: WordBool);
begin
  DefaultInterface.Set_Stemming(pVal);
end;

function  TSearchJobProperties.Get_Synonyms: WordBool;
begin
  Result := DefaultInterface.Get_Synonyms;
end;

procedure TSearchJobProperties.Set_Synonyms(pVal: WordBool);
begin
  DefaultInterface.Set_Synonyms(pVal);
end;

function  TSearchJobProperties.Get_UserSynonyms: WordBool;
begin
  Result := DefaultInterface.Get_UserSynonyms;
end;

procedure TSearchJobProperties.Set_UserSynonyms(pVal: WordBool);
begin
  DefaultInterface.Set_UserSynonyms(pVal);
end;

function  TSearchJobProperties.Get_WordNetSynonyms: WordBool;
begin
  Result := DefaultInterface.Get_WordNetSynonyms;
end;

procedure TSearchJobProperties.Set_WordNetSynonyms(pVal: WordBool);
begin
  DefaultInterface.Set_WordNetSynonyms(pVal);
end;

function  TSearchJobProperties.Get_WordNetRelated: WordBool;
begin
  Result := DefaultInterface.Get_WordNetRelated;
end;

procedure TSearchJobProperties.Set_WordNetRelated(pVal: WordBool);
begin
  DefaultInterface.Set_WordNetRelated(pVal);
end;

function  TSearchJobProperties.Get_Results: IDispatch;
begin
  Result := DefaultInterface.Get_Results;
end;

function  TSearchJobProperties.Get_IsThreadDone: WordBool;
begin
  Result := DefaultInterface.Get_IsThreadDone;
end;

function  TSearchJobProperties.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TSearchJobProperties.Get_TimeoutSeconds: Integer;
begin
  Result := DefaultInterface.Get_TimeoutSeconds;
end;

procedure TSearchJobProperties.Set_TimeoutSeconds(pVal: Integer);
begin
  DefaultInterface.Set_TimeoutSeconds(pVal);
end;

function  TSearchJobProperties.Get_DelayDocInfo: WordBool;
begin
  Result := DefaultInterface.Get_DelayDocInfo;
end;

procedure TSearchJobProperties.Set_DelayDocInfo(pVal: WordBool);
begin
  DefaultInterface.Set_DelayDocInfo(pVal);
end;

function  TSearchJobProperties.Get_RegularExpression: WordBool;
begin
  Result := DefaultInterface.Get_RegularExpression;
end;

procedure TSearchJobProperties.Set_RegularExpression(pVal: WordBool);
begin
  DefaultInterface.Set_RegularExpression(pVal);
end;

function  TSearchJobProperties.Get_SearchFlags: Integer;
begin
  Result := DefaultInterface.Get_SearchFlags;
end;

procedure TSearchJobProperties.Set_SearchFlags(pVal: Integer);
begin
  DefaultInterface.Set_SearchFlags(pVal);
end;

function  TSearchJobProperties.Get_OutputListingName: WideString;
begin
  Result := DefaultInterface.Get_OutputListingName;
end;

procedure TSearchJobProperties.Set_OutputListingName(const pVal: WideString);
begin
  DefaultInterface.Set_OutputListingName(pVal);
end;

function  TSearchJobProperties.Get_ExternalSynonyms: WordBool;
begin
  Result := DefaultInterface.Get_ExternalSynonyms;
end;

procedure TSearchJobProperties.Set_ExternalSynonyms(pVal: WordBool);
begin
  DefaultInterface.Set_ExternalSynonyms(pVal);
end;

function  TSearchJobProperties.Get_FileConditions: WideString;
begin
  Result := DefaultInterface.Get_FileConditions;
end;

procedure TSearchJobProperties.Set_FileConditions(const pVal: WideString);
begin
  DefaultInterface.Set_FileConditions(pVal);
end;

{$ENDIF}

class function CoFileConverter.Create: IFileConverter;
begin
  Result := CreateComObject(CLASS_FileConverter) as IFileConverter;
end;

class function CoFileConverter.CreateRemote(const MachineName: string): IFileConverter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FileConverter) as IFileConverter;
end;

procedure TFileConverter.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{697DF027-B24E-11D3-B57C-00105AA461D0}';
    IntfIID:   '{697DF026-B24E-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFileConverter.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IFileConverter;
  end;
end;

procedure TFileConverter.ConnectTo(svrIntf: IFileConverter);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TFileConverter.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TFileConverter.GetDefaultInterface: IFileConverter;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TFileConverter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TFileConverterProperties.Create(Self);
{$ENDIF}
end;

destructor TFileConverter.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TFileConverter.GetServerProperties: TFileConverterProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TFileConverter.Get_InputFile: WideString;
begin
  Result := DefaultInterface.Get_InputFile;
end;

procedure TFileConverter.Set_InputFile(const pVal: WideString);
begin
  DefaultInterface.Set_InputFile(pVal);
end;

function  TFileConverter.Get_OutputFile: WideString;
begin
  Result := DefaultInterface.Get_OutputFile;
end;

procedure TFileConverter.Set_OutputFile(const pVal: WideString);
begin
  DefaultInterface.Set_OutputFile(pVal);
end;

function  TFileConverter.Get_OutputFormat: Integer;
begin
  Result := DefaultInterface.Get_OutputFormat;
end;

procedure TFileConverter.Set_OutputFormat(pVal: Integer);
begin
  DefaultInterface.Set_OutputFormat(pVal);
end;

function  TFileConverter.Get_BeforeHit: WideString;
begin
  Result := DefaultInterface.Get_BeforeHit;
end;

procedure TFileConverter.Set_BeforeHit(const pVal: WideString);
begin
  DefaultInterface.Set_BeforeHit(pVal);
end;

function  TFileConverter.Get_AfterHit: WideString;
begin
  Result := DefaultInterface.Get_AfterHit;
end;

procedure TFileConverter.Set_AfterHit(const pVal: WideString);
begin
  DefaultInterface.Set_AfterHit(pVal);
end;

function  TFileConverter.Get_Footer: WideString;
begin
  Result := DefaultInterface.Get_Footer;
end;

procedure TFileConverter.Set_Footer(const pVal: WideString);
begin
  DefaultInterface.Set_Footer(pVal);
end;

function  TFileConverter.Get_Hits: WideString;
begin
  Result := DefaultInterface.Get_Hits;
end;

procedure TFileConverter.Set_Hits(const pVal: WideString);
begin
  DefaultInterface.Set_Hits(pVal);
end;

function  TFileConverter.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TFileConverter.Get_BaseHRef: WideString;
begin
  Result := DefaultInterface.Get_BaseHRef;
end;

procedure TFileConverter.Set_BaseHRef(const pVal: WideString);
begin
  DefaultInterface.Set_BaseHRef(pVal);
end;

function  TFileConverter.Get_OutputToString: WordBool;
begin
  Result := DefaultInterface.Get_OutputToString;
end;

procedure TFileConverter.Set_OutputToString(pVal: WordBool);
begin
  DefaultInterface.Set_OutputToString(pVal);
end;

function  TFileConverter.Get_OutputStringMaxSize: Integer;
begin
  Result := DefaultInterface.Get_OutputStringMaxSize;
end;

procedure TFileConverter.Set_OutputStringMaxSize(pVal: Integer);
begin
  DefaultInterface.Set_OutputStringMaxSize(pVal);
end;

function  TFileConverter.Get_OutputString: WideString;
begin
  Result := DefaultInterface.Get_OutputString;
end;

function  TFileConverter.Get_TimeoutSeconds: Integer;
begin
  Result := DefaultInterface.Get_TimeoutSeconds;
end;

procedure TFileConverter.Set_TimeoutSeconds(pVal: Integer);
begin
  DefaultInterface.Set_TimeoutSeconds(pVal);
end;

function  TFileConverter.Get_AlphabetLocation: WideString;
begin
  Result := DefaultInterface.Get_AlphabetLocation;
end;

procedure TFileConverter.Set_AlphabetLocation(const pVal: WideString);
begin
  DefaultInterface.Set_AlphabetLocation(pVal);
end;

function  TFileConverter.Get_flags: Integer;
begin
  Result := DefaultInterface.Get_flags;
end;

procedure TFileConverter.Set_flags(pVal: Integer);
begin
  DefaultInterface.Set_flags(pVal);
end;

function  TFileConverter.Get_Header: WideString;
begin
  Result := DefaultInterface.Get_Header;
end;

procedure TFileConverter.Set_Header(const pVal: WideString);
begin
  DefaultInterface.Set_Header(pVal);
end;

procedure TFileConverter.Execute;
begin
  DefaultInterface.Execute;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TFileConverterProperties.Create(AServer: TFileConverter);
begin
  inherited Create;
  FServer := AServer;
end;

function TFileConverterProperties.GetDefaultInterface: IFileConverter;
begin
  Result := FServer.DefaultInterface;
end;

function  TFileConverterProperties.Get_InputFile: WideString;
begin
  Result := DefaultInterface.Get_InputFile;
end;

procedure TFileConverterProperties.Set_InputFile(const pVal: WideString);
begin
  DefaultInterface.Set_InputFile(pVal);
end;

function  TFileConverterProperties.Get_OutputFile: WideString;
begin
  Result := DefaultInterface.Get_OutputFile;
end;

procedure TFileConverterProperties.Set_OutputFile(const pVal: WideString);
begin
  DefaultInterface.Set_OutputFile(pVal);
end;

function  TFileConverterProperties.Get_OutputFormat: Integer;
begin
  Result := DefaultInterface.Get_OutputFormat;
end;

procedure TFileConverterProperties.Set_OutputFormat(pVal: Integer);
begin
  DefaultInterface.Set_OutputFormat(pVal);
end;

function  TFileConverterProperties.Get_BeforeHit: WideString;
begin
  Result := DefaultInterface.Get_BeforeHit;
end;

procedure TFileConverterProperties.Set_BeforeHit(const pVal: WideString);
begin
  DefaultInterface.Set_BeforeHit(pVal);
end;

function  TFileConverterProperties.Get_AfterHit: WideString;
begin
  Result := DefaultInterface.Get_AfterHit;
end;

procedure TFileConverterProperties.Set_AfterHit(const pVal: WideString);
begin
  DefaultInterface.Set_AfterHit(pVal);
end;

function  TFileConverterProperties.Get_Footer: WideString;
begin
  Result := DefaultInterface.Get_Footer;
end;

procedure TFileConverterProperties.Set_Footer(const pVal: WideString);
begin
  DefaultInterface.Set_Footer(pVal);
end;

function  TFileConverterProperties.Get_Hits: WideString;
begin
  Result := DefaultInterface.Get_Hits;
end;

procedure TFileConverterProperties.Set_Hits(const pVal: WideString);
begin
  DefaultInterface.Set_Hits(pVal);
end;

function  TFileConverterProperties.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TFileConverterProperties.Get_BaseHRef: WideString;
begin
  Result := DefaultInterface.Get_BaseHRef;
end;

procedure TFileConverterProperties.Set_BaseHRef(const pVal: WideString);
begin
  DefaultInterface.Set_BaseHRef(pVal);
end;

function  TFileConverterProperties.Get_OutputToString: WordBool;
begin
  Result := DefaultInterface.Get_OutputToString;
end;

procedure TFileConverterProperties.Set_OutputToString(pVal: WordBool);
begin
  DefaultInterface.Set_OutputToString(pVal);
end;

function  TFileConverterProperties.Get_OutputStringMaxSize: Integer;
begin
  Result := DefaultInterface.Get_OutputStringMaxSize;
end;

procedure TFileConverterProperties.Set_OutputStringMaxSize(pVal: Integer);
begin
  DefaultInterface.Set_OutputStringMaxSize(pVal);
end;

function  TFileConverterProperties.Get_OutputString: WideString;
begin
  Result := DefaultInterface.Get_OutputString;
end;

function  TFileConverterProperties.Get_TimeoutSeconds: Integer;
begin
  Result := DefaultInterface.Get_TimeoutSeconds;
end;

procedure TFileConverterProperties.Set_TimeoutSeconds(pVal: Integer);
begin
  DefaultInterface.Set_TimeoutSeconds(pVal);
end;

function  TFileConverterProperties.Get_AlphabetLocation: WideString;
begin
  Result := DefaultInterface.Get_AlphabetLocation;
end;

procedure TFileConverterProperties.Set_AlphabetLocation(const pVal: WideString);
begin
  DefaultInterface.Set_AlphabetLocation(pVal);
end;

function  TFileConverterProperties.Get_flags: Integer;
begin
  Result := DefaultInterface.Get_flags;
end;

procedure TFileConverterProperties.Set_flags(pVal: Integer);
begin
  DefaultInterface.Set_flags(pVal);
end;

function  TFileConverterProperties.Get_Header: WideString;
begin
  Result := DefaultInterface.Get_Header;
end;

procedure TFileConverterProperties.Set_Header(const pVal: WideString);
begin
  DefaultInterface.Set_Header(pVal);
end;

{$ENDIF}

class function CoSearchReportJob.Create: ISearchReportJob;
begin
  Result := CreateComObject(CLASS_SearchReportJob) as ISearchReportJob;
end;

class function CoSearchReportJob.CreateRemote(const MachineName: string): ISearchReportJob;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SearchReportJob) as ISearchReportJob;
end;

procedure TSearchReportJob.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{697DF029-B24E-11D3-B57C-00105AA461D0}';
    IntfIID:   '{697DF028-B24E-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSearchReportJob.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISearchReportJob;
  end;
end;

procedure TSearchReportJob.ConnectTo(svrIntf: ISearchReportJob);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSearchReportJob.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSearchReportJob.GetDefaultInterface: ISearchReportJob;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSearchReportJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSearchReportJobProperties.Create(Self);
{$ENDIF}
end;

destructor TSearchReportJob.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSearchReportJob.GetServerProperties: TSearchReportJobProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TSearchReportJob.Get_BeforeHit: WideString;
begin
  Result := DefaultInterface.Get_BeforeHit;
end;

procedure TSearchReportJob.Set_BeforeHit(const pVal: WideString);
begin
  DefaultInterface.Set_BeforeHit(pVal);
end;

function  TSearchReportJob.Get_AfterHit: WideString;
begin
  Result := DefaultInterface.Get_AfterHit;
end;

procedure TSearchReportJob.Set_AfterHit(const pVal: WideString);
begin
  DefaultInterface.Set_AfterHit(pVal);
end;

function  TSearchReportJob.Get_Header: WideString;
begin
  Result := DefaultInterface.Get_Header;
end;

procedure TSearchReportJob.Set_Header(const pVal: WideString);
begin
  DefaultInterface.Set_Header(pVal);
end;

function  TSearchReportJob.Get_Footer: WideString;
begin
  Result := DefaultInterface.Get_Footer;
end;

procedure TSearchReportJob.Set_Footer(const pVal: WideString);
begin
  DefaultInterface.Set_Footer(pVal);
end;

function  TSearchReportJob.Get_FileHeader: WideString;
begin
  Result := DefaultInterface.Get_FileHeader;
end;

procedure TSearchReportJob.Set_FileHeader(const pVal: WideString);
begin
  DefaultInterface.Set_FileHeader(pVal);
end;

function  TSearchReportJob.Get_ContextHeader: WideString;
begin
  Result := DefaultInterface.Get_ContextHeader;
end;

procedure TSearchReportJob.Set_ContextHeader(const pVal: WideString);
begin
  DefaultInterface.Set_ContextHeader(pVal);
end;

function  TSearchReportJob.Get_WordsOfContext: Integer;
begin
  Result := DefaultInterface.Get_WordsOfContext;
end;

procedure TSearchReportJob.Set_WordsOfContext(pVal: Integer);
begin
  DefaultInterface.Set_WordsOfContext(pVal);
end;

function  TSearchReportJob.Get_ParagraphsOfContext: Integer;
begin
  Result := DefaultInterface.Get_ParagraphsOfContext;
end;

procedure TSearchReportJob.Set_ParagraphsOfContext(pVal: Integer);
begin
  DefaultInterface.Set_ParagraphsOfContext(pVal);
end;

function  TSearchReportJob.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TSearchReportJob.Get_OutputFormat: Integer;
begin
  Result := DefaultInterface.Get_OutputFormat;
end;

procedure TSearchReportJob.Set_OutputFormat(pVal: Integer);
begin
  DefaultInterface.Set_OutputFormat(pVal);
end;

function  TSearchReportJob.Get_OutputFile: WideString;
begin
  Result := DefaultInterface.Get_OutputFile;
end;

procedure TSearchReportJob.Set_OutputFile(const pVal: WideString);
begin
  DefaultInterface.Set_OutputFile(pVal);
end;

function  TSearchReportJob.Get_TimeoutSeconds: Integer;
begin
  Result := DefaultInterface.Get_TimeoutSeconds;
end;

procedure TSearchReportJob.Set_TimeoutSeconds(pVal: Integer);
begin
  DefaultInterface.Set_TimeoutSeconds(pVal);
end;

function  TSearchReportJob.Get_OutputString: WideString;
begin
  Result := DefaultInterface.Get_OutputString;
end;

function  TSearchReportJob.Get_OutputStringMaxSize: Integer;
begin
  Result := DefaultInterface.Get_OutputStringMaxSize;
end;

procedure TSearchReportJob.Set_OutputStringMaxSize(pVal: Integer);
begin
  DefaultInterface.Set_OutputStringMaxSize(pVal);
end;

function  TSearchReportJob.Get_OutputToString: WordBool;
begin
  Result := DefaultInterface.Get_OutputToString;
end;

procedure TSearchReportJob.Set_OutputToString(pVal: WordBool);
begin
  DefaultInterface.Set_OutputToString(pVal);
end;

function  TSearchReportJob.Get_FileFooter: WideString;
begin
  Result := DefaultInterface.Get_FileFooter;
end;

procedure TSearchReportJob.Set_FileFooter(const pVal: WideString);
begin
  DefaultInterface.Set_FileFooter(pVal);
end;

procedure TSearchReportJob.Execute;
begin
  DefaultInterface.Execute;
end;

procedure TSearchReportJob.SelectItems(iFirstItem: Integer; iLastItem: Integer);
begin
  DefaultInterface.SelectItems(iFirstItem, iLastItem);
end;

procedure TSearchReportJob.ClearSelections;
begin
  DefaultInterface.ClearSelections;
end;

procedure TSearchReportJob.SelectAll;
begin
  DefaultInterface.SelectAll;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSearchReportJobProperties.Create(AServer: TSearchReportJob);
begin
  inherited Create;
  FServer := AServer;
end;

function TSearchReportJobProperties.GetDefaultInterface: ISearchReportJob;
begin
  Result := FServer.DefaultInterface;
end;

function  TSearchReportJobProperties.Get_BeforeHit: WideString;
begin
  Result := DefaultInterface.Get_BeforeHit;
end;

procedure TSearchReportJobProperties.Set_BeforeHit(const pVal: WideString);
begin
  DefaultInterface.Set_BeforeHit(pVal);
end;

function  TSearchReportJobProperties.Get_AfterHit: WideString;
begin
  Result := DefaultInterface.Get_AfterHit;
end;

procedure TSearchReportJobProperties.Set_AfterHit(const pVal: WideString);
begin
  DefaultInterface.Set_AfterHit(pVal);
end;

function  TSearchReportJobProperties.Get_Header: WideString;
begin
  Result := DefaultInterface.Get_Header;
end;

procedure TSearchReportJobProperties.Set_Header(const pVal: WideString);
begin
  DefaultInterface.Set_Header(pVal);
end;

function  TSearchReportJobProperties.Get_Footer: WideString;
begin
  Result := DefaultInterface.Get_Footer;
end;

procedure TSearchReportJobProperties.Set_Footer(const pVal: WideString);
begin
  DefaultInterface.Set_Footer(pVal);
end;

function  TSearchReportJobProperties.Get_FileHeader: WideString;
begin
  Result := DefaultInterface.Get_FileHeader;
end;

procedure TSearchReportJobProperties.Set_FileHeader(const pVal: WideString);
begin
  DefaultInterface.Set_FileHeader(pVal);
end;

function  TSearchReportJobProperties.Get_ContextHeader: WideString;
begin
  Result := DefaultInterface.Get_ContextHeader;
end;

procedure TSearchReportJobProperties.Set_ContextHeader(const pVal: WideString);
begin
  DefaultInterface.Set_ContextHeader(pVal);
end;

function  TSearchReportJobProperties.Get_WordsOfContext: Integer;
begin
  Result := DefaultInterface.Get_WordsOfContext;
end;

procedure TSearchReportJobProperties.Set_WordsOfContext(pVal: Integer);
begin
  DefaultInterface.Set_WordsOfContext(pVal);
end;

function  TSearchReportJobProperties.Get_ParagraphsOfContext: Integer;
begin
  Result := DefaultInterface.Get_ParagraphsOfContext;
end;

procedure TSearchReportJobProperties.Set_ParagraphsOfContext(pVal: Integer);
begin
  DefaultInterface.Set_ParagraphsOfContext(pVal);
end;

function  TSearchReportJobProperties.Get_Errors: IDispatch;
begin
  Result := DefaultInterface.Get_Errors;
end;

function  TSearchReportJobProperties.Get_OutputFormat: Integer;
begin
  Result := DefaultInterface.Get_OutputFormat;
end;

procedure TSearchReportJobProperties.Set_OutputFormat(pVal: Integer);
begin
  DefaultInterface.Set_OutputFormat(pVal);
end;

function  TSearchReportJobProperties.Get_OutputFile: WideString;
begin
  Result := DefaultInterface.Get_OutputFile;
end;

procedure TSearchReportJobProperties.Set_OutputFile(const pVal: WideString);
begin
  DefaultInterface.Set_OutputFile(pVal);
end;

function  TSearchReportJobProperties.Get_TimeoutSeconds: Integer;
begin
  Result := DefaultInterface.Get_TimeoutSeconds;
end;

procedure TSearchReportJobProperties.Set_TimeoutSeconds(pVal: Integer);
begin
  DefaultInterface.Set_TimeoutSeconds(pVal);
end;

function  TSearchReportJobProperties.Get_OutputString: WideString;
begin
  Result := DefaultInterface.Get_OutputString;
end;

function  TSearchReportJobProperties.Get_OutputStringMaxSize: Integer;
begin
  Result := DefaultInterface.Get_OutputStringMaxSize;
end;

procedure TSearchReportJobProperties.Set_OutputStringMaxSize(pVal: Integer);
begin
  DefaultInterface.Set_OutputStringMaxSize(pVal);
end;

function  TSearchReportJobProperties.Get_OutputToString: WordBool;
begin
  Result := DefaultInterface.Get_OutputToString;
end;

procedure TSearchReportJobProperties.Set_OutputToString(pVal: WordBool);
begin
  DefaultInterface.Set_OutputToString(pVal);
end;

function  TSearchReportJobProperties.Get_FileFooter: WideString;
begin
  Result := DefaultInterface.Get_FileFooter;
end;

procedure TSearchReportJobProperties.Set_FileFooter(const pVal: WideString);
begin
  DefaultInterface.Set_FileFooter(pVal);
end;

{$ENDIF}

class function CoOptions.Create: IOptions;
begin
  Result := CreateComObject(CLASS_Options) as IOptions;
end;

class function CoOptions.CreateRemote(const MachineName: string): IOptions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Options) as IOptions;
end;

procedure TOptions.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{697DF02B-B24E-11D3-B57C-00105AA461D0}';
    IntfIID:   '{697DF02A-B24E-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TOptions.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IOptions;
  end;
end;

procedure TOptions.ConnectTo(svrIntf: IOptions);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TOptions.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TOptions.GetDefaultInterface: IOptions;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TOptions.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TOptionsProperties.Create(Self);
{$ENDIF}
end;

destructor TOptions.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TOptions.GetServerProperties: TOptionsProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TOptions.Get_BinaryFiles: Integer;
begin
  Result := DefaultInterface.Get_BinaryFiles;
end;

procedure TOptions.Set_BinaryFiles(pVal: Integer);
begin
  DefaultInterface.Set_BinaryFiles(pVal);
end;

function  TOptions.Get_Hyphens: Integer;
begin
  Result := DefaultInterface.Get_Hyphens;
end;

procedure TOptions.Set_Hyphens(pVal: Integer);
begin
  DefaultInterface.Set_Hyphens(pVal);
end;

function  TOptions.Get_IndexNumbers: WordBool;
begin
  Result := DefaultInterface.Get_IndexNumbers;
end;

procedure TOptions.Set_IndexNumbers(pVal: WordBool);
begin
  DefaultInterface.Set_IndexNumbers(pVal);
end;

function  TOptions.Get_AlphabetName: WideString;
begin
  Result := DefaultInterface.Get_AlphabetName;
end;

procedure TOptions.Set_AlphabetName(const pVal: WideString);
begin
  DefaultInterface.Set_AlphabetName(pVal);
end;

function  TOptions.Get_BinaryFilterTextChars: WideString;
begin
  Result := DefaultInterface.Get_BinaryFilterTextChars;
end;

procedure TOptions.Set_BinaryFilterTextChars(const pVal: WideString);
begin
  DefaultInterface.Set_BinaryFilterTextChars(pVal);
end;

function  TOptions.Get_StemmingRulesFile: WideString;
begin
  Result := DefaultInterface.Get_StemmingRulesFile;
end;

procedure TOptions.Set_StemmingRulesFile(const pVal: WideString);
begin
  DefaultInterface.Set_StemmingRulesFile(pVal);
end;

function  TOptions.Get_NoiseWordFile: WideString;
begin
  Result := DefaultInterface.Get_NoiseWordFile;
end;

procedure TOptions.Set_NoiseWordFile(const pVal: WideString);
begin
  DefaultInterface.Set_NoiseWordFile(pVal);
end;

function  TOptions.Get_MaxWordsToRetrieve: Integer;
begin
  Result := DefaultInterface.Get_MaxWordsToRetrieve;
end;

procedure TOptions.Set_MaxWordsToRetrieve(pVal: Integer);
begin
  DefaultInterface.Set_MaxWordsToRetrieve(pVal);
end;

function  TOptions.Get_MaxStoredFieldSize: Integer;
begin
  Result := DefaultInterface.Get_MaxStoredFieldSize;
end;

procedure TOptions.Set_MaxStoredFieldSize(pVal: Integer);
begin
  DefaultInterface.Set_MaxStoredFieldSize(pVal);
end;

function  TOptions.Get_TitleSize: Integer;
begin
  Result := DefaultInterface.Get_TitleSize;
end;

procedure TOptions.Set_TitleSize(pVal: Integer);
begin
  DefaultInterface.Set_TitleSize(pVal);
end;

function  TOptions.Get_XmlIgnoreTags: WideString;
begin
  Result := DefaultInterface.Get_XmlIgnoreTags;
end;

procedure TOptions.Set_XmlIgnoreTags(const pVal: WideString);
begin
  DefaultInterface.Set_XmlIgnoreTags(pVal);
end;

function  TOptions.Get_MaxWordLength: Integer;
begin
  Result := DefaultInterface.Get_MaxWordLength;
end;

procedure TOptions.Set_MaxWordLength(pVal: Integer);
begin
  DefaultInterface.Set_MaxWordLength(pVal);
end;

function  TOptions.Get_SegmentationRulesFile: WideString;
begin
  Result := DefaultInterface.Get_SegmentationRulesFile;
end;

procedure TOptions.Set_SegmentationRulesFile(const pVal: WideString);
begin
  DefaultInterface.Set_SegmentationRulesFile(pVal);
end;

function  TOptions.Get_TextFieldsFile: WideString;
begin
  Result := DefaultInterface.Get_TextFieldsFile;
end;

procedure TOptions.Set_TextFieldsFile(const pVal: WideString);
begin
  DefaultInterface.Set_TextFieldsFile(pVal);
end;

function  TOptions.Get_UserThesaurusFile: WideString;
begin
  Result := DefaultInterface.Get_UserThesaurusFile;
end;

procedure TOptions.Set_UserThesaurusFile(const pVal: WideString);
begin
  DefaultInterface.Set_UserThesaurusFile(pVal);
end;

function  TOptions.Get_HomeDir: WideString;
begin
  Result := DefaultInterface.Get_HomeDir;
end;

procedure TOptions.Set_HomeDir(const pVal: WideString);
begin
  DefaultInterface.Set_HomeDir(pVal);
end;

function  TOptions.Get_PrivateDir: WideString;
begin
  Result := DefaultInterface.Get_PrivateDir;
end;

procedure TOptions.Set_PrivateDir(const pVal: WideString);
begin
  DefaultInterface.Set_PrivateDir(pVal);
end;

function  TOptions.Get_BooleanConnectors: WideString;
begin
  Result := DefaultInterface.Get_BooleanConnectors;
end;

procedure TOptions.Set_BooleanConnectors(const pVal: WideString);
begin
  DefaultInterface.Set_BooleanConnectors(pVal);
end;

function  TOptions.Get_FileTypeTableFile: WideString;
begin
  Result := DefaultInterface.Get_FileTypeTableFile;
end;

procedure TOptions.Set_FileTypeTableFile(const pVal: WideString);
begin
  DefaultInterface.Set_FileTypeTableFile(pVal);
end;

function  TOptions.Get_UpdateFiles: WordBool;
begin
  Result := DefaultInterface.Get_UpdateFiles;
end;

procedure TOptions.Set_UpdateFiles(pVal: WordBool);
begin
  DefaultInterface.Set_UpdateFiles(pVal);
end;

function  TOptions.Get_LzwEnableCode: Integer;
begin
  Result := DefaultInterface.Get_LzwEnableCode;
end;

procedure TOptions.Set_LzwEnableCode(pVal: Integer);
begin
  DefaultInterface.Set_LzwEnableCode(pVal);
end;

procedure TOptions.Save;
begin
  DefaultInterface.Save;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TOptionsProperties.Create(AServer: TOptions);
begin
  inherited Create;
  FServer := AServer;
end;

function TOptionsProperties.GetDefaultInterface: IOptions;
begin
  Result := FServer.DefaultInterface;
end;

function  TOptionsProperties.Get_BinaryFiles: Integer;
begin
  Result := DefaultInterface.Get_BinaryFiles;
end;

procedure TOptionsProperties.Set_BinaryFiles(pVal: Integer);
begin
  DefaultInterface.Set_BinaryFiles(pVal);
end;

function  TOptionsProperties.Get_Hyphens: Integer;
begin
  Result := DefaultInterface.Get_Hyphens;
end;

procedure TOptionsProperties.Set_Hyphens(pVal: Integer);
begin
  DefaultInterface.Set_Hyphens(pVal);
end;

function  TOptionsProperties.Get_IndexNumbers: WordBool;
begin
  Result := DefaultInterface.Get_IndexNumbers;
end;

procedure TOptionsProperties.Set_IndexNumbers(pVal: WordBool);
begin
  DefaultInterface.Set_IndexNumbers(pVal);
end;

function  TOptionsProperties.Get_AlphabetName: WideString;
begin
  Result := DefaultInterface.Get_AlphabetName;
end;

procedure TOptionsProperties.Set_AlphabetName(const pVal: WideString);
begin
  DefaultInterface.Set_AlphabetName(pVal);
end;

function  TOptionsProperties.Get_BinaryFilterTextChars: WideString;
begin
  Result := DefaultInterface.Get_BinaryFilterTextChars;
end;

procedure TOptionsProperties.Set_BinaryFilterTextChars(const pVal: WideString);
begin
  DefaultInterface.Set_BinaryFilterTextChars(pVal);
end;

function  TOptionsProperties.Get_StemmingRulesFile: WideString;
begin
  Result := DefaultInterface.Get_StemmingRulesFile;
end;

procedure TOptionsProperties.Set_StemmingRulesFile(const pVal: WideString);
begin
  DefaultInterface.Set_StemmingRulesFile(pVal);
end;

function  TOptionsProperties.Get_NoiseWordFile: WideString;
begin
  Result := DefaultInterface.Get_NoiseWordFile;
end;

procedure TOptionsProperties.Set_NoiseWordFile(const pVal: WideString);
begin
  DefaultInterface.Set_NoiseWordFile(pVal);
end;

function  TOptionsProperties.Get_MaxWordsToRetrieve: Integer;
begin
  Result := DefaultInterface.Get_MaxWordsToRetrieve;
end;

procedure TOptionsProperties.Set_MaxWordsToRetrieve(pVal: Integer);
begin
  DefaultInterface.Set_MaxWordsToRetrieve(pVal);
end;

function  TOptionsProperties.Get_MaxStoredFieldSize: Integer;
begin
  Result := DefaultInterface.Get_MaxStoredFieldSize;
end;

procedure TOptionsProperties.Set_MaxStoredFieldSize(pVal: Integer);
begin
  DefaultInterface.Set_MaxStoredFieldSize(pVal);
end;

function  TOptionsProperties.Get_TitleSize: Integer;
begin
  Result := DefaultInterface.Get_TitleSize;
end;

procedure TOptionsProperties.Set_TitleSize(pVal: Integer);
begin
  DefaultInterface.Set_TitleSize(pVal);
end;

function  TOptionsProperties.Get_XmlIgnoreTags: WideString;
begin
  Result := DefaultInterface.Get_XmlIgnoreTags;
end;

procedure TOptionsProperties.Set_XmlIgnoreTags(const pVal: WideString);
begin
  DefaultInterface.Set_XmlIgnoreTags(pVal);
end;

function  TOptionsProperties.Get_MaxWordLength: Integer;
begin
  Result := DefaultInterface.Get_MaxWordLength;
end;

procedure TOptionsProperties.Set_MaxWordLength(pVal: Integer);
begin
  DefaultInterface.Set_MaxWordLength(pVal);
end;

function  TOptionsProperties.Get_SegmentationRulesFile: WideString;
begin
  Result := DefaultInterface.Get_SegmentationRulesFile;
end;

procedure TOptionsProperties.Set_SegmentationRulesFile(const pVal: WideString);
begin
  DefaultInterface.Set_SegmentationRulesFile(pVal);
end;

function  TOptionsProperties.Get_TextFieldsFile: WideString;
begin
  Result := DefaultInterface.Get_TextFieldsFile;
end;

procedure TOptionsProperties.Set_TextFieldsFile(const pVal: WideString);
begin
  DefaultInterface.Set_TextFieldsFile(pVal);
end;

function  TOptionsProperties.Get_UserThesaurusFile: WideString;
begin
  Result := DefaultInterface.Get_UserThesaurusFile;
end;

procedure TOptionsProperties.Set_UserThesaurusFile(const pVal: WideString);
begin
  DefaultInterface.Set_UserThesaurusFile(pVal);
end;

function  TOptionsProperties.Get_HomeDir: WideString;
begin
  Result := DefaultInterface.Get_HomeDir;
end;

procedure TOptionsProperties.Set_HomeDir(const pVal: WideString);
begin
  DefaultInterface.Set_HomeDir(pVal);
end;

function  TOptionsProperties.Get_PrivateDir: WideString;
begin
  Result := DefaultInterface.Get_PrivateDir;
end;

procedure TOptionsProperties.Set_PrivateDir(const pVal: WideString);
begin
  DefaultInterface.Set_PrivateDir(pVal);
end;

function  TOptionsProperties.Get_BooleanConnectors: WideString;
begin
  Result := DefaultInterface.Get_BooleanConnectors;
end;

procedure TOptionsProperties.Set_BooleanConnectors(const pVal: WideString);
begin
  DefaultInterface.Set_BooleanConnectors(pVal);
end;

function  TOptionsProperties.Get_FileTypeTableFile: WideString;
begin
  Result := DefaultInterface.Get_FileTypeTableFile;
end;

procedure TOptionsProperties.Set_FileTypeTableFile(const pVal: WideString);
begin
  DefaultInterface.Set_FileTypeTableFile(pVal);
end;

function  TOptionsProperties.Get_UpdateFiles: WordBool;
begin
  Result := DefaultInterface.Get_UpdateFiles;
end;

procedure TOptionsProperties.Set_UpdateFiles(pVal: WordBool);
begin
  DefaultInterface.Set_UpdateFiles(pVal);
end;

function  TOptionsProperties.Get_LzwEnableCode: Integer;
begin
  Result := DefaultInterface.Get_LzwEnableCode;
end;

procedure TOptionsProperties.Set_LzwEnableCode(pVal: Integer);
begin
  DefaultInterface.Set_LzwEnableCode(pVal);
end;

{$ENDIF}

class function CoWordListBuilder.Create: IWordListBuilder;
begin
  Result := CreateComObject(CLASS_WordListBuilder) as IWordListBuilder;
end;

class function CoWordListBuilder.CreateRemote(const MachineName: string): IWordListBuilder;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WordListBuilder) as IWordListBuilder;
end;

procedure TWordListBuilder.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{697DF02D-B24E-11D3-B57C-00105AA461D0}';
    IntfIID:   '{697DF02C-B24E-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TWordListBuilder.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IWordListBuilder;
  end;
end;

procedure TWordListBuilder.ConnectTo(svrIntf: IWordListBuilder);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TWordListBuilder.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TWordListBuilder.GetDefaultInterface: IWordListBuilder;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TWordListBuilder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TWordListBuilderProperties.Create(Self);
{$ENDIF}
end;

destructor TWordListBuilder.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TWordListBuilder.GetServerProperties: TWordListBuilderProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TWordListBuilder.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

function  TWordListBuilder.OpenIndex(const IndexName: WideString): Integer;
begin
  Result := DefaultInterface.OpenIndex(IndexName);
end;

procedure TWordListBuilder.CloseIndex;
begin
  DefaultInterface.CloseIndex;
end;

function  TWordListBuilder.ListWords(const CursorWord: WideString; Range: Integer): Integer;
begin
  Result := DefaultInterface.ListWords(CursorWord, Range);
end;

function  TWordListBuilder.GetNthWord(iWord: Integer): WideString;
begin
  Result := DefaultInterface.GetNthWord(iWord);
end;

function  TWordListBuilder.GetNthWordCount(iWord: Integer): Integer;
begin
  Result := DefaultInterface.GetNthWordCount(iWord);
end;

function  TWordListBuilder.GetNthWordField(iWord: Integer): WideString;
begin
  Result := DefaultInterface.GetNthWordField(iWord);
end;

function  TWordListBuilder.ListMatchingWords(const toMatch: WideString; nLimit: Integer; 
                                             SearchFlags: Integer; Fuzziness: Integer): Integer;
begin
  Result := DefaultInterface.ListMatchingWords(toMatch, nLimit, SearchFlags, Fuzziness);
end;

procedure TWordListBuilder.ListFields(var pVal: Integer);
begin
  DefaultInterface.ListFields(pVal);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TWordListBuilderProperties.Create(AServer: TWordListBuilder);
begin
  inherited Create;
  FServer := AServer;
end;

function TWordListBuilderProperties.GetDefaultInterface: IWordListBuilder;
begin
  Result := FServer.DefaultInterface;
end;

function  TWordListBuilderProperties.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

{$ENDIF}

class function CoSearchResults.Create: ISearchResults;
begin
  Result := CreateComObject(CLASS_SearchResults) as ISearchResults;
end;

class function CoSearchResults.CreateRemote(const MachineName: string): ISearchResults;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SearchResults) as ISearchResults;
end;

procedure TSearchResults.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{798CBE35-B27D-11D3-B57C-00105AA461D0}';
    IntfIID:   '{798CBE34-B27D-11D3-B57C-00105AA461D0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSearchResults.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISearchResults;
  end;
end;

procedure TSearchResults.ConnectTo(svrIntf: ISearchResults);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSearchResults.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSearchResults.GetDefaultInterface: ISearchResults;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSearchResults.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSearchResultsProperties.Create(Self);
{$ENDIF}
end;

destructor TSearchResults.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSearchResults.GetServerProperties: TSearchResultsProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TSearchResults.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

function  TSearchResults.Get_DocName: WideString;
begin
  Result := DefaultInterface.Get_DocName;
end;

function  TSearchResults.Get_DocHitCount: Integer;
begin
  Result := DefaultInterface.Get_DocHitCount;
end;

function  TSearchResults.Get_DocDetails: WideString;
begin
  Result := DefaultInterface.Get_DocDetails;
end;

function  TSearchResults.Get_DocHits: WideString;
begin
  Result := DefaultInterface.Get_DocHits;
end;

function  TSearchResults.Get_Request: WideString;
begin
  Result := DefaultInterface.Get_Request;
end;

function  TSearchResults.Get_TotalHitCount: Integer;
begin
  Result := DefaultInterface.Get_TotalHitCount;
end;

function  TSearchResults.Get_HitByteOffsets: WideString;
begin
  Result := DefaultInterface.Get_HitByteOffsets;
end;

function  TSearchResults.Get_DocDetailItem(const name: WideString): WideString;
begin
  Result := DefaultInterface.Get_DocDetailItem(name);
end;

function  TSearchResults.GetNthDoc(iDoc: Integer): WordBool;
begin
  Result := DefaultInterface.GetNthDoc(iDoc);
end;

procedure TSearchResults.Sort(flags: Integer; const fieldName: WideString);
begin
  DefaultInterface.Sort(flags, fieldName);
end;

function  TSearchResults.NewSearchReportJob: IDispatch;
begin
  Result := DefaultInterface.NewSearchReportJob;
end;

procedure TSearchResults.MakePdfHighlightFile;
begin
  DefaultInterface.MakePdfHighlightFile;
end;

function  TSearchResults.MakePdfWebHighlightFile: WideString;
begin
  Result := DefaultInterface.MakePdfWebHighlightFile;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSearchResultsProperties.Create(AServer: TSearchResults);
begin
  inherited Create;
  FServer := AServer;
end;

function TSearchResultsProperties.GetDefaultInterface: ISearchResults;
begin
  Result := FServer.DefaultInterface;
end;

function  TSearchResultsProperties.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

function  TSearchResultsProperties.Get_DocName: WideString;
begin
  Result := DefaultInterface.Get_DocName;
end;

function  TSearchResultsProperties.Get_DocHitCount: Integer;
begin
  Result := DefaultInterface.Get_DocHitCount;
end;

function  TSearchResultsProperties.Get_DocDetails: WideString;
begin
  Result := DefaultInterface.Get_DocDetails;
end;

function  TSearchResultsProperties.Get_DocHits: WideString;
begin
  Result := DefaultInterface.Get_DocHits;
end;

function  TSearchResultsProperties.Get_Request: WideString;
begin
  Result := DefaultInterface.Get_Request;
end;

function  TSearchResultsProperties.Get_TotalHitCount: Integer;
begin
  Result := DefaultInterface.Get_TotalHitCount;
end;

function  TSearchResultsProperties.Get_HitByteOffsets: WideString;
begin
  Result := DefaultInterface.Get_HitByteOffsets;
end;

function  TSearchResultsProperties.Get_DocDetailItem(const name: WideString): WideString;
begin
  Result := DefaultInterface.Get_DocDetailItem(name);
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('ActiveX',[TServer, TJobErrorInfo, TIndexJob, TSearchJob, 
    TFileConverter, TSearchReportJob, TOptions, TWordListBuilder, TSearchResults]);
end;

end.
