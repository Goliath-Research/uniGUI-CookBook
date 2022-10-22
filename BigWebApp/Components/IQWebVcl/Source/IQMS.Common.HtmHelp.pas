unit IQMS.Common.HtmHelp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  IQMS.Common.Registry;

{ Externals from HHCTRL.OCX }

var
  HHCtrlHandle: THandle = 0;   //0 if hhctrl.ocx could not be loaded
const
  hhctrlLib  = 'hhctrl.ocx';
var                            //function are invalid if HHCtrlHandle = 0
  HtmlHelpA: function( hwndCaller: HWND; pszFile: PAnsiChar; uCommand: Cardinal; dwData: DWORD): HWND; stdcall;
  HtmlHelpW: function( hwndCaller: HWND; pszFile: PChar; uCommand: Cardinal; dwData: DWORD): HWND; stdcall;
  HtmlHelp: function( hwndCaller: HWND; pszFile: PChar; uCommand: Cardinal; dwData: DWORD): HWND; stdcall;

{other exports}
  function GetPathToHHCtrlOCX: String;



  { Use the following for GetProcAddress to load from hhctrl.ocx }

const
  ATOM_HTMLHELP_API_ANSI    = 14;
  ATOM_HTMLHELP_API_UNICODE = 15;


  { Commands to pass to HtmlHelp() }

const
  HH_DISPLAY_TOPIC        = $0000;  {**}
  HH_HELP_FINDER          = $0000;  // WinHelp equivalent
  HH_DISPLAY_TOC          = $0001;  // not currently implemented
  HH_DISPLAY_INDEX        = $0002;  // not currently implemented
  HH_DISPLAY_SEARCH       = $0003;  // not currently implemented
  HH_SET_WIN_TYPE         = $0004;
  HH_GET_WIN_TYPE         = $0005;
  HH_GET_WIN_HANDLE       = $0006;
  HH_ENUM_INFO_TYPE       = $0007;  // Get Info type name, call repeatedly to enumerate, -1 at end
  HH_SET_INFO_TYPE        = $0008;  // Add Info type to filter.
  HH_SYNC                 = $0009;
  HH_RESERVED1            = $000A;
  HH_RESERVED2            = $000B;
  HH_RESERVED3            = $000C;
  HH_KEYWORD_LOOKUP       = $000D;
  HH_DISPLAY_TEXT_POPUP   = $000E;  // display string resource id or text in a popup window
  HH_HELP_CONTEXT         = $000F;  {**}// display mapped numeric value in dwData
  HH_TP_HELP_CONTEXTMENU  = $0010;  // text popup help, same as WinHelp HELP_CONTEXTMENU
  HH_TP_HELP_WM_HELP      = $0011;  // text popup help, same as WinHelp HELP_WM_HELP
  HH_CLOSE_ALL            = $0012;  // close all windows opened directly or indirectly by the caller
  HH_ALINK_LOOKUP         = $0013;  // ALink version of HH_KEYWORD_LOOKUP
  HH_GET_LAST_ERROR       = $0014;  // not currently implemented // See HHERROR.h
  HH_ENUM_CATEGORY        = $0015; // Get category name, call repeatedly to enumerate, -1 at end
  HH_ENUM_CATEGORY_IT     = $0016;  // Get category info type members, call repeatedly to enumerate, -1 at end
  HH_RESET_IT_FILTER      = $0017;  // Clear the info type filter of all info types.
  HH_SET_INCLUSIVE_FILTER = $0018;  // set inclusive filtering method for untyped topics to be included in display
  HH_SET_EXCLUSIVE_FILTER = $0019;  // set exclusive filtering method for untyped topics to be excluded from display
  HH_INITIALIZE           = $001C;  // Initializes the help system.
  HH_UNINITIALIZE         = $001D;  // Uninitializes the help system.
  HH_PRETRANSLATEMESSAGE  = $00fd;  // Pumps messages. (NULL, NULL, MSG*).
  HH_SET_GLOBAL_PROPERTY  = $00fc;  // Set a global property. (NULL, NULL, HH_GPROP)

  { window properties }

const
  HHWIN_PROP_TAB_AUTOHIDESHOW = DWORD($00000001);  // (1 << 0)  Automatically hide/show tri-pane window
  HHWIN_PROP_ONTOP            = DWORD($00000002);  // (1 << 1)  Top-most window
  HHWIN_PROP_NOTITLEBAR       = DWORD($00000004);  // (1 << 2)  no title bar
  HHWIN_PROP_NODEF_STYLES     = DWORD($00000008);  // (1 << 3)  no default window styles (only HH_WINTYPE.dwStyles)
  HHWIN_PROP_NODEF_EXSTYLES   = DWORD($00000010);  // (1 << 4)  no default extended window styles (only HH_WINTYPE.dwExStyles)
  HHWIN_PROP_TRI_PANE         = DWORD($00000020);  // (1 << 5)  use a tri-pane window
  HHWIN_PROP_NOTB_TEXT        = DWORD($00000040);  // (1 << 6)  no text on toolbar buttons
  HHWIN_PROP_POST_QUIT        = DWORD($00000080);  // (1 << 7)  post WM_QUIT message when window closes
  HHWIN_PROP_AUTO_SYNC        = DWORD($00000100);  // (1 << 8)  automatically ssync contents and index
  HHWIN_PROP_TRACKING         = DWORD($00000200);  // (1 << 9)  send tracking notification messages
  HHWIN_PROP_TAB_SEARCH       = DWORD($00000400);  // (1 << 10) include search tab in navigation pane
  HHWIN_PROP_TAB_HISTORY      = DWORD($00000800);  // (1 << 11) include history tab in navigation pane
  HHWIN_PROP_TAB_FAVORITES    = DWORD($00001000);  // (1 << 12) include favorites tab in navigation pane
  HHWIN_PROP_CHANGE_TITLE     = DWORD($00002000);  // (1 << 13) Put current HTML title in title bar
  HHWIN_PROP_NAV_ONLY_WIN     = DWORD($00004000);  // (1 << 14) Only display the navigation window
  HHWIN_PROP_NO_TOOLBAR       = DWORD($00008000);  // (1 << 15) Don't display a toolbar
  HHWIN_PROP_MENU             = DWORD($00010000);  // (1 << 16) Menu
  HHWIN_PROP_TAB_ADVSEARCH    = DWORD($00020000);  // (1 << 17) Advanced FTS UI.
  HHWIN_PROP_USER_POS         = DWORD($00040000);  // (1 << 18) After initial creation, user controls window size/position
  HHWIN_PROP_TAB_CUSTOM1      = DWORD($00080000);  // (1 << 19) Use custom tab #1
  HHWIN_PROP_TAB_CUSTOM2      = DWORD($00100000);  // (1 << 20) Use custom tab #2
  HHWIN_PROP_TAB_CUSTOM3      = DWORD($00200000);  // (1 << 21) Use custom tab #3
  HHWIN_PROP_TAB_CUSTOM4      = DWORD($00400000);  // (1 << 22) Use custom tab #4
  HHWIN_PROP_TAB_CUSTOM5      = DWORD($00800000);  // (1 << 23) Use custom tab #5
  HHWIN_PROP_TAB_CUSTOM6      = DWORD($01000000);  // (1 << 24) Use custom tab #6
  HHWIN_PROP_TAB_CUSTOM7      = DWORD($02000000);  // (1 << 25) Use custom tab #7
  HHWIN_PROP_TAB_CUSTOM8      = DWORD($04000000);  // (1 << 26) Use custom tab #8
  HHWIN_PROP_TAB_CUSTOM9      = DWORD($08000000);  // (1 << 27) Use custom tab #9
  HHWIN_TB_MARGIN             = DWORD($10000000);  // (1 << 28) the window type has a margin

  { window parameters }

const
  HHWIN_PARAM_PROPERTIES      = DWORD($00000002);  // (1 << 1)  valid fsWinProperties
  HHWIN_PARAM_STYLES          = DWORD($00000004);  // (1 << 2)  valid dwStyles
  HHWIN_PARAM_EXSTYLES        = DWORD($00000008);  // (1 << 3)  valid dwExStyles
  HHWIN_PARAM_RECT            = DWORD($00000010);  // (1 << 4)  valid rcWindowPos
  HHWIN_PARAM_NAV_WIDTH       = DWORD($00000020);  // (1 << 5)  valid iNavWidth
  HHWIN_PARAM_SHOWSTATE       = DWORD($00000040);  // (1 << 6)  valid nShowState
  HHWIN_PARAM_INFOTYPES       = DWORD($00000080);  // (1 << 7)  valid apInfoTypes
  HHWIN_PARAM_TB_FLAGS        = DWORD($00000100);  // (1 << 8)  valid fsToolBarFlags
  HHWIN_PARAM_EXPANSION       = DWORD($00000200);  // (1 << 9)  valid fNotExpanded
  HHWIN_PARAM_TABPOS          = DWORD($00000400);  // (1 << 10) valid tabpos
  HHWIN_PARAM_TABORDER        = DWORD($00000800);  // (1 << 11) valid taborder
  HHWIN_PARAM_HISTORY_COUNT   = DWORD($00001000);  // (1 << 12) valid cHistory
  HHWIN_PARAM_CUR_TAB         = DWORD($00002000);  // (1 << 13) valid curNavType

  { button constants }

const
  HHWIN_BUTTON_EXPAND         = DWORD($00000002);  // (1 << 1)  Expand/contract button
  HHWIN_BUTTON_BACK           = DWORD($00000004);  // (1 << 2)  Back button
  HHWIN_BUTTON_FORWARD        = DWORD($00000008);  // (1 << 3)  Forward button
  HHWIN_BUTTON_STOP           = DWORD($00000010);  // (1 << 4)  Stop button
  HHWIN_BUTTON_REFRESH        = DWORD($00000020);  // (1 << 5)  Refresh button
  HHWIN_BUTTON_HOME           = DWORD($00000040);  // (1 << 6)  Home button
  HHWIN_BUTTON_BROWSE_FWD     = DWORD($00000080);  // (1 << 7)  not implemented
  HHWIN_BUTTON_BROWSE_BCK     = DWORD($00000100);  // (1 << 8)  not implemented
  HHWIN_BUTTON_NOTES          = DWORD($00000200);  // (1 << 9)  not implemented
  HHWIN_BUTTON_CONTENTS       = DWORD($00000400);  // (1 << 10) not implemented
  HHWIN_BUTTON_SYNC           = DWORD($00000800);  // (1 << 11) Sync button
  HHWIN_BUTTON_OPTIONS        = DWORD($00001000);  // (1 << 12) Options button
  HHWIN_BUTTON_PRINT          = DWORD($00002000);  // (1 << 13) Print button
  HHWIN_BUTTON_INDEX          = DWORD($00004000);  // (1 << 14) not implemented
  HHWIN_BUTTON_SEARCH         = DWORD($00008000);  // (1 << 15) not implemented
  HHWIN_BUTTON_HISTORY        = DWORD($00010000);  // (1 << 16) not implemented
  HHWIN_BUTTON_FAVORITES      = DWORD($00020000);  // (1 << 17) not implemented
  HHWIN_BUTTON_JUMP1          = DWORD($00040000);  // (1 << 18)
  HHWIN_BUTTON_JUMP2          = DWORD($00080000);  // (1 << 19)
  HHWIN_BUTTON_ZOOM           = DWORD($00100000);  // (1 << 20)
  HHWIN_BUTTON_TOC_NEXT       = DWORD($00200000);  // (1 << 21)
  HHWIN_BUTTON_TOC_PREV       = DWORD($00400000);  // (1 << 22)

  HHWIN_DEF_BUTTONS           = (HHWIN_BUTTON_EXPAND
                                 OR HHWIN_BUTTON_BACK
                                 OR HHWIN_BUTTON_OPTIONS
                                 OR HHWIN_BUTTON_PRINT);


  { Button IDs }

const
  IDTB_EXPAND             = 200;
  IDTB_CONTRACT           = 201;
  IDTB_STOP               = 202;
  IDTB_REFRESH            = 203;
  IDTB_BACK               = 204;
  IDTB_HOME               = 205;
  IDTB_SYNC               = 206;
  IDTB_PRINT              = 207;
  IDTB_OPTIONS            = 208;
  IDTB_FORWARD            = 209;
  IDTB_NOTES              = 210; // not implemented
  IDTB_BROWSE_FWD         = 211;
  IDTB_BROWSE_BACK        = 212;
  IDTB_CONTENTS           = 213; // not implemented
  IDTB_INDEX              = 214; // not implemented
  IDTB_SEARCH             = 215; // not implemented
  IDTB_HISTORY            = 216; // not implemented
  IDTB_FAVORITES          = 217; // not implemented
  IDTB_JUMP1              = 218;
  IDTB_JUMP2              = 219;
  IDTB_CUSTOMIZE          = 221;
  IDTB_ZOOM               = 222;
  IDTB_TOC_NEXT           = 223;
  IDTB_TOC_PREV           = 224;


  { Notification codes }

const
  HHN_FIRST       = (0-860);
  HHN_LAST        = (0-879);

  HHN_NAVCOMPLETE   = (HHN_FIRST-0);
  HHN_TRACK         = (HHN_FIRST-1);
  HHN_WINDOW_CREATE = (HHN_FIRST-2);



type
  HHN_NOTIFY = packed record                  //tagHHN_NOTIFY
    hdr:    TNMHdr;
    pszUrl: PWideChar;          //PCSTR: Multi-byte, null-terminated string
  end;


  HH_POPUP = packed record                   //tagHH_POPUP
    cbStruct:      Integer;     // sizeof this structure
    hinst:         HINST;       // instance handle for string resource
    idString:      cardinal;    // string resource id, or text id if pszFile is specified in HtmlHelp call
    pszText:       PChar;       // used if idString is zero
    pt:            TPOINT;      // top center of popup window
    clrForeground: COLORREF;    // use -1 for default
    clrBackground: COLORREF;    // use -1 for default
    rcMargins:     TRect;       // amount of space between edges of window and text, -1 for each member to ignore
    pszFont:       PChar;       // facename, point size, char set, BOLD ITALIC UNDERLINE
  end;


  HH_AKLINK = packed record     //tagHH_AKLINK
    cbStruct:      integer;     // sizeof this structure
    fReserved:     BOOL;        // must be FALSE (really!)
    pszKeywords:   PChar;       // semi-colon separated keywords
    pszUrl:        PChar;       // URL to jump to if no keywords found (may be NULL)
    pszMsgText:    PChar;       // Message text to display in MessageBox if pszUrl is NULL and no keyword match
    pszMsgTitle:   PChar;       // Message text to display in MessageBox if pszUrl is NULL and no keyword match
    pszWindow:     PChar;       // Window to display URL in
    fIndexOnFail:  BOOL;        // Displays index if keyword lookup fails.
  end;


type
  PHHWIN_NavType = ^THHWIN_NavType;
  THHWIN_NavType = Integer;
const
  HHWIN_NAVTYPE_TOC          = 0;
  HHWIN_NAVTYPE_INDEX        = 1;
  HHWIN_NAVTYPE_SEARCH       = 2;
  HHWIN_NAVTYPE_FAVORITES    = 3;
  HHWIN_NAVTYPE_HISTORY      = 4;   // not implemented
  HHWIN_NAVTYPE_AUTHOR       = 5;
  HHWIN_NAVTYPE_CUSTOM_FIRST = 11;


type
  HH_IType = (
    IT_INCLUSIVE,
    IT_EXCLUSIVE,
    IT_HIDDEN );

  tagHH_ENUM_IT = packed record      //tagHH_ENUM_IT, HH_ENUM_IT, *PHH_ENUM_IT
    cbStruct:           Integer;     // size of this structure
    iType:              Integer;     // the type of the information type ie. Inclusive, Exclusive, or Hidden
    pszCatName:         PAnsiChar;   // Set to the name of the Category to enumerate the info types in a category; else NULL
    pszITName:          PAnsiChar;   // volitile pointer to the name of the infotype. Allocated by call. Caller responsible for freeing
    pszITDescription:   PAnsiChar;   // volitile pointer to the description of the infotype.
  end;
  THHEnumInfoType = tagHH_ENUM_IT;
  PHHEnumInfoType = ^THHEnumInfoType;


type
  tagHH_ENUM_CAT = packed record     //tagHH_ENUM_CAT, HH_ENUM_CAT, *PHH_ENUM_CAT
    cbStruct:           Integer;     // size of this structure
    pszCatName:         PAnsiChar;   // volitile pointer to the category name
    pszCatDescription:  PAnsiChar;   // volitile pointer to the category description
  end;
  THHEnumCat = tagHH_ENUM_CAT;
  PHHEnumCat = ^THHEnumCat;


type
  tagHH_SET_INFOTYPE = packed record //tagHH_SET_INFOTYPE, HH_SET_INFOTYPE, *PHH_SET_INFOTYPE
    cbStruct:           Integer;     // the size of this structure
    pszCatName:         PAnsiChar;   // the name of the category, if any, the InfoType is a member of.
    pszInfoTypeName:    PAnsiChar;   // the name of the info type to add to the filter
  end;
  THHSetInfoType = tagHH_SET_INFOTYPE;
  PHHSetInfoType = ^THHSetInfoType;


type
  HH_INFOTYPE = DWORD;
  THHInfoType = HH_INFOTYPE;
  PHHInfoType = ^THHInfoType;        //PHH_INFOTYPE


type
  THHWinNavTabs = (
    HHWIN_NAVTAB_TOP,
    HHWIN_NAVTAB_LEFT,
    HHWIN_NAVTAB_BOTTOM
    );


const
  HH_MAX_TABS  = 19;                 // maximum number of tabs
const
  HH_TAB_CONTENTS     = 0;
  HH_TAB_INDEX        = 1;
  HH_TAB_SEARCH       = 2;
  HH_TAB_FAVORITES    = 3;
  HH_TAB_HISTORY      = 4;
  HH_TAB_AUTHOR       = 5;
  HH_TAB_CUSTOM_FIRST = 11;
  HH_TAB_CUSTOM_LAST  = HH_MAX_TABS;

  HH_MAX_TABS_CUSTOM = (HH_TAB_CUSTOM_LAST - HH_TAB_CUSTOM_FIRST + 1);



  { HH_DISPLAY_SEARCH Command Related Structures and Constants }

const
  HH_FTS_DEFAULT_PROXIMITY = (-1);
type
  tagHH_FTS_QUERY = packed record                //tagHH_FTS_QUERY, HH_FTS_QUERY
    cbStruct:          integer;      // Sizeof structure in bytes.
    fUniCodeStrings:   BOOL;         // TRUE if all strings are unicode.
    pszSearchQuery:    PChar;        // String containing the search query.
    iProximity:        LongInt;      // Word proximity.
    fStemmedSearch:    Bool;         // TRUE for StemmedSearch only.
    fTitleOnly:        Bool;         // TRUE for Title search only.
    fExecute:          Bool;         // TRUE to initiate the search.
    pszWindow:         PChar;        // Window to display in
  end;
  HH_FTS_QUERY = tagHH_FTS_QUERY;



  { HH_WINTYPE Structure }

type
  tagHH_WINTYPE = packed record                  //tagHH_WINTYPE, HH_WINTYPE, *PHH_WINTYPE;
    cbStruct:          Integer;      // IN: size of this structure including all Information Types
    fUniCodeStrings:   BOOL;         // IN/OUT: TRUE if all strings are in UNICODE
    pszType:           PChar;        // IN/OUT: Name of a type of window
    fsValidMembers:    DWORD;        // IN: Bit flag of valid members (HHWIN_PARAM_)
    fsWinProperties:   DWORD;        // IN/OUT: Properties/attributes of the window (HHWIN_)

    pszCaption:        PChar;        // IN/OUT: Window title
    dwStyles:          DWORD;        // IN/OUT: Window styles
    dwExStyles:        DWORD;        // IN/OUT: Extended Window styles
    rcWindowPos:       TRect;        // IN: Starting position, OUT: current position
    nShowState:        Integer;      // IN: show state (e.g., SW_SHOW)

    hwndHelp:          HWND;         // OUT: window handle
    hwndCaller:        HWND;         // OUT: who called this window

    paInfoTypes:       PHHInfoType;  // IN: Pointer to an array of Information Types

    { The following members are only valid if HHWIN_PROP_TRI_PANE is set }

    hwndToolBar:       HWND;         // OUT: toolbar window in tri-pane window
    hwndNavigation:    HWND;         // OUT: navigation window in tri-pane window
    hwndHTML:          HWND;         // OUT: window displaying HTML in tri-pane window
    iNavWidth:         Integer;      // IN/OUT: width of navigation window
    rcHTML:            TRect;        // OUT: HTML window coordinates

    pszToc:            PChar;        // IN: Location of the table of contents file
    pszIndex:          PChar;        // IN: Location of the index file
    pszFile:           PChar;        // IN: Default location of the html file
    pszHome:           PChar;        // IN/OUT: html file to display when Home button is clicked
    fsToolBarFlags:    DWORD;        // IN: flags controling the appearance of the toolbar
    fNotExpanded:      BOOL;         // IN: TRUE/FALSE to contract or expand, OUT: current state
    curNavType:        Integer;      // IN/OUT: UI to display in the navigational pane
    tabpos:            Integer;      // IN/OUT: HHWIN_NAVTAB_TOP, HHWIN_NAVTAB_LEFT, or HHWIN_NAVTAB_BOTTOM
    idNotify:          Integer;      // IN: ID to use for WM_NOTIFY messages
    tabOrder: packed array[0..HH_MAX_TABS] of Byte;  // IN/OUT: tab order: Contents, Index, Search, History, Favorites, Reserved 1-5, Custom tabs
    cHistory:          Integer;       // IN/OUT: number of history items to keep (default is 30)
    pszJump1:          PChar;         // Text for HHWIN_BUTTON_JUMP1
    pszJump2:          PChar;         // Text for HHWIN_BUTTON_JUMP2
    pszUrlJump1:       PChar;         // URL for HHWIN_BUTTON_JUMP1
    pszUrlJump2:       PChar;         // URL for HHWIN_BUTTON_JUMP2
    rcMinSize:         TRect;         // Minimum size for window (ignored in version 1)

    cbInfoTypes:       Integer;       // size of paInfoTypes;
    pszCustomTabs:     PChar;         // multiple zero-terminated strings
  end;
  HH_WINTYPE = tagHH_WINTYPE;
  THHWinType = HH_WINTYPE;
  PHHWinType = ^THHWinType;

type
  HHACT = (
    HHACT_TAB_CONTENTS,
    HHACT_TAB_INDEX,
    HHACT_TAB_SEARCH,
    HHACT_TAB_HISTORY,
    HHACT_TAB_FAVORITES,

    HHACT_EXPAND,
    HHACT_CONTRACT,
    HHACT_BACK,
    HHACT_FORWARD,
    HHACT_STOP,
    HHACT_REFRESH,
    HHACT_HOME,
    HHACT_SYNC,
    HHACT_OPTIONS,
    HHACT_PRINT,
    HHACT_HIGHLIGHT,
    HHACT_CUSTOMIZE,
    HHACT_JUMP1,
    HHACT_JUMP2,
    HHACT_ZOOM,
    HHACT_TOC_NEXT,
    HHACT_TOC_PREV,
    HHACT_NOTES,

    HHACT_LAST_ENUM);


type
  tagHHNTRACK = packed record                  //tagHHNTRACK, HHNTRACK;
    hdr:               TNMHdr;
    pszCurUrl:         PWideChar;              // Multi-byte, null-terminated string  !!PWideChar; //PCSTR: Multi-byte, nul-terminated string
    idAction:          Integer;                // HHACT_ value
    phhWinType:        PHHWinType;             // Current window type structure
  end;
  HHNTRACK = tagHHNTRACK;


///////////////////////////////////////////////////////////////////////////////
//
// Global Control Properties.
//
type
  tagHH_GPROPID = Integer;                //tagHH_GPROPID, HH_GPROPID
  HH_GPROPID = tagHH_GPROPID;
const
  HH_GPROPID_SINGLETHREAD     = 1;      // VARIANT_BOOL: True for single thread
  HH_GPROPID_TOOLBAR_MARGIN   = 2;      // long: Provides a left/right margin around the toolbar.
  HH_GPROPID_UI_LANGUAGE      = 3;      // long: LangId of the UI.
  HH_GPROPID_CURRENT_SUBSET   = 4;      // BSTR: Current subset.
  HH_GPROPID_CONTENT_LANGUAGE = 5;      // long: LandId for desired content.

///////////////////////////////////////////////////////////////////////////////
//
// Global Property structure
//
type
  tagHH_GLOBAL_PROPERTY = packed record                  //tagHH_GLOBAL_PROPERTY, HH_GLOBAL_PROPERTY
    id:                HH_GPROPID;
    v:                 VARIANT;
  end;
  HH_GLOBAL_PROPERTY = tagHH_GLOBAL_PROPERTY;



implementation

uses IQMS.Common.Miscellaneous;

const hhPathRegKey = 'CLSID\{adb880a6-d8ff-11cf-9377-00aa003b7a11}\InprocServer32';

{
  Returns full path to hhctrl.ocx. Returns empty string if file or registry entry not found
  Note: hhctrl.ocx may not be in the path. Consider the case where
        the ocx has been downloaded to the windows ocx cache via the net.
        So.. best to get the path from the registry
}
function GetPathToHHCtrlOCX: String;
var
  rg: TIQWebRegistry;
begin
  result := '';  //default return
  rg := TIQWebRegistry.Create;
  rg.RootKey := HKEY_CLASSES_ROOT;
  // if rg.KeyExists(hhPathRegKey) AND rg.OpenKey(hhPathRegKey, FALSE) then  -- this didn't work on XP - regular user had to have special rights to access the registry
  if rg.OpenKeyReadOnly( hhPathRegKey ) then
  begin
    result := rg.ReadString('');  //default value

    {June-28-2007}
    Result:= ExpandEnvironment( Result ); // in Vista convert %SystemRoot%\System32\... to C:\Windows\System32\....

    rg.CloseKey;
    if (result <> '') and (not FileExists(result)) then  //final check - file must exist
      result := '';
  end;
  rg.Free;
end;

procedure ModuleHHCtrl;
var ocxfn: String;
begin
  ocxfn := GetPathToHHCtrlOCX;
  if FileExists(ocxfn) then
  begin
    HHCtrlHandle := LoadLibrary(PChar(ocxfn));
    if HHCtrlHandle <> 0 then
    begin
      @HtmlHelpA := GetProcAddress(HHCtrlHandle, 'HtmlHelpA');
      @HtmlHelpW := GetProcAddress(HHCtrlHandle, 'HtmlHelpW');
      @HtmlHelp := GetProcAddress(HHCtrlHandle, 'HtmlHelp');
    end;
  end;
end;

initialization
  ModuleHHCtrl;
finalization
  if HHCtrlHandle <> 0 then
    FreeLibrary(HHCtrlHandle);
end.

