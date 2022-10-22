unit crm_bar;

interface


uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  UniTimer,
  uniGUIBaseClasses,
  uniGUIClasses,
  Vcl.Controls,
  Winapi.ShellAPI,
  uniGUIForm,
  IQMS.Common.Registry,
  System.Variants;

const
  { IQBar's user notification message }
  WM_IQBARNOTIFY = WM_USER + 100;

  { Timer interval }
  SLIDE_DEF_TIMER_INTERVAL = 400; { in milliseconds }

  { Defaults }
  IQ_DEF_SIZE_INC = 1;
  IQ_DEF_DOCK_SIZE = 32;
  IQ_DEF_ROOT_KEY = HKEY_CURRENT_USER;
  IQ_DEF_KEY_NAME = 'Software\IQMS\IQWin32\IQCRM.exe';

var
  hResizing: Boolean;

type
  { You can send to the Windows shell one of the following messages: }
  { Message             Description
    --------------      --------------------------------------------------
    ABM_NEW             Register a new IQBar to the system
    ABM_REMOVE          Remove a previously created IQBar from the system
    ABM_QUERYPOS        Query the IQBar position
    ABM_SETPOS          Set the IQBar position
    ABM_GETSTATE        Get the edge the IQBar is docked to
    ABM_GETTASKBARPOS   Get the Explorer Taskbar position
    ABM_ACTIVATE        Activate the IQBar
    ABM_GETAUTOHIDEBAR  Query if IQBar has Auto-hide behavior
    ABM_SETAUTOHIDEBAR  Set the IQBar's Auto-hide behavior

    The ABM_message constants are defined in Winapi.ShellAPI.PAS as follows:
    ABM_NEW              = $00000000;
    ABM_REMOVE           = $00000001;
    ABM_QUERYPOS         = $00000002;
    ABM_SETPOS           = $00000003;
    ABM_GETSTATE         = $00000004;
    ABM_GETTASKBARPOS    = $00000005;
    ABM_ACTIVATE         = $00000006;
    ABM_GETAUTOHIDEBAR   = $00000007;
    ABM_SETAUTOHIDEBAR   = $00000008;
    ABM_WINDOWPOSCHANGED = $00000009; }

  { The following enumerated type defines the constants in the table }
  TIQBarMessage = (abmNew, abmRemove, abmQueryPos, abmSetPos, abmGetState,
    abmGetTaskBarPos, abmActivate, abmGetAutoHideBar,
    abmSetAutoHideBar, abmWindowPosChanged);

  { An IQBar can be in one of 6 states shown in the table below:
    State          Description
    -----------    -----------------------------------------------------
    ABE_UNKNOWN    The IQBar is in an unknown state
    (usually during construction/destruction)
    ABE_FLOAT      The IQBar is floating on the screen
    ABE_LEFT       The IQBar is docked on the left   edge of the screen
    ABE_TOP        The IQBar is docked on the top    edge of the screen
    ABE_RIGHT      The IQBar is docked on the right  edge of the screen
    ABE_BOTTOM     The IQBar is docked on the bottom edge of the screen

    The ABE_edge state constants are defined in Winapi.ShellAPI.PAS as follows:
    ABE_LEFT    = 0;
    ABE_TOP     = 1;
    ABE_RIGHT   = 2;
    ABE_BOTTOM  = 3;

    The ABE_UNKNOWN and ABE_FLOAT constants are defined here as follows:
    ABE_UNKNOWN = 4;
    ABE_FLOAT   = 5; }

  { The following enumerated type defines the constants in the table
    (Values are mutually exclusive) }
  TIQBarEdge = (abeLeft, abeTop, abeRight, abeBottom, abeUnknown, abeFloat);

  { An IQBar can have several behavior flags as shown below: }
  { Flag                        Description
    --------------------------- -----------------------------------
    ABF_ALLOWLEFT               Allow dock on left   of screen
    ABF_ALLOWRIGHT              Allow dock on right  of screen
    ABF_ALLOWTOP                Allow dock on top    of screen
    ABF_ALLOWBOTTOM             Allow dock on bottom of screen
    ABF_ALLOWFLOAT              Allow float in the middle of screen }

  { The following enumerated type defines the constants in the table }
  TIQBarFlag = (abfAllowLeft, abfAllowTop, abfAllowRight, abfAllowBottom,
    abfAllowFloat);
  TIQBarFlags = set of TIQBarFlag;

  { The following enumerated type defines the IQBar behavior in the Taskbar }
  TIQBarTaskEntry = (abtShow, abtHide, abtFloatDependent);

  { The record below contains all of the IQBar settings that
    can be saved/loaded in/from the Registry }
  TIQBarSettings = packed record
    cbSize: DWORD; // Size of this structure
    abEdge: TIQBarEdge; // ABE_UNKNOWN, ABE_FLOAT, or ABE_edge
    abFlags: TIQBarFlags; // ABF_* flags
    bAutohide: Boolean; // Should IQBar be auto-hidden when docked?
    bAlwaysOnTop: Boolean; // Should IQBar always be on top?
    bSlideEffect: Boolean; // Should IQBar slide?
    nTimerInterval: Integer; // Slide Timer Interval (determines speed)
    szSizeInc: TSize; // Discrete width/height size increments
    szDockSize: TSize; // Width/Height for docked bar
    rcFloat: TRect; // Floating rectangle in screen coordinates
    nMinWidth: Integer; // Min allowed width
    nMinHeight: Integer; // Min allowed height
    nMaxWidth: Integer; // Max allowed width
    nMaxHeight: Integer; // Max allowed height
    szMinDockSize: TSize; // Min Width/Height when docked
    szMaxDockSize: TSize; // Max Width/Height when docked
    abTaskEntry: TIQBarTaskEntry; // IQBar behavior in the Taskbar
  end;

  { The record below contains the settings location in the registry }
  TIQBarSettingsLocation = record
    nRootKey: Integer; // HKEY_CURRENT_USER or HKEY_LOCAL_MACHINE
    KeyName: String; // Key Name starting from root
  end;

  { Declare the class }
  TIQBar = class(TUniForm)
  private
    { Internal implementation state variables }

    { Settings info }
    FABS: TIQBarSettings;
    { We need a member variable which tracks the proposed edge of the
      IQBar while the user is moving it, deciding where to position it.
      While not moving, this member must contain ABE_UNKNOWN so that
      GetEdge returns the current edge contained in FABS.abEdge.
      While moving the IQBar, FabEdgeProposedPrev contains the
      proposed edge based on the position of the IQBar.  The proposed
      edge becomes the new edge when the user stops moving the IQBar. }
    FabEdgeProposedPrev: TIQBarEdge;

    { Is application window full screen? }
    FbFullScreenAppOpen: Boolean;

    { Is the autohide window visible or not? }
    FbAutoHideIsVisible: Boolean;

    { Variable to store the settings location in the registry }
    FabSettingsLocation: TIQBarSettingsLocation;

    procedure WMMenuSelect(var message: TWMMenuSelect); message WM_MENUSELECT;

    { Internal implementation functions }
    { Modifies window creation flags }
    procedure CreateParams(var Params: TCreateParams); override;

    { The Shell SHAppBarMessage  function }
    function IQBarMessage(abMessage: TIQBarMessage;
      abEdge: TIQBarEdge;
      lParam: lParam;
      bRect: Boolean;
      var rc: TRect): UINT;

    function IQBarMessage1(abMessage: TIQBarMessage): UINT;

    function IQBarMessage2(abMessage: TIQBarMessage;
      abEdge: TIQBarEdge): UINT;

    function IQBarMessage3(abMessage: TIQBarMessage;
      abEdge: TIQBarEdge;
      lParam: lParam): UINT;

    function IQBarMessage4(abMessage: TIQBarMessage;
      abEdge: TIQBarEdge;
      lParam: lParam;
      var rc: TRect): UINT;

    { Gets a edge (ABE_FLOAT or ABE_edge) from a point (screen coordinates) }
    function CalcProposedState(var pt: TSmallPoint): TIQBarEdge;

    { Gets a retangle position (screen coordinates) from a proposed state }
    procedure GetRect(abEdgeProposed: TIQBarEdge; var rcProposed: TRect);

    { Adjusts the IQBar's location to account for autohide
      Returns TRUE if rectangle was adjusted }
    function AdjustLocationForAutohide(bShow: Boolean;
      var rc: TRect): Boolean;

    { If IQBar is Autohide and docked, shows/hides the IQBar }
    procedure ShowHiddenIQBar(bShow: Boolean);

    { When Autohide IQBar is shown/hidden, slides in/out of view }
    procedure SlideWindow(var rcEnd: TRect);

    { Returns which edge we're autohidden on or ABE_UNKNOWN }
    function GetAutohideEdge: TIQBarEdge;

    { Returns a TSmallPoint that gives the cursor position in screen coords }
    function GetMessagePosition: TSmallPoint;

    { Changes the style of a window (translated from AfxModifyStyle) }
    function ModifyStyle(hWnd: THandle;
      nStyleOffset: Integer;
      dwRemove: DWORD;
      dwAdd: DWORD;
      nFlags: UINT): Boolean;

  protected
    { Property selector functions }
    { Timer determines when the IQBar should be re-hidden }
    FTimer: TUniTimer;

    { Retrieves the IQBar's edge.  If the IQBar is being positioned, its
      proposed state is returned instead }
    function GetEdge: TIQBarEdge;

    { Changes the IQBar's edge to ABE_UNKNOWN, ABE_FLOAT or an ABE_edge }
    procedure SetEdge(abEdge: TIQBarEdge);

    { Changes the slide time interval }
    procedure SetSlideTime(nInterval: Integer);

    { Overridable functions }
    { Called when the IQBar's proposed state changes }
    procedure OnIQBarStateChange(bProposed: Boolean;
      abEdgeProposed: TIQBarEdge); virtual;

    { Called if user attempts to dock an Autohide IQBar on
      an edge that already contains an Autohide IQBar }
    procedure OnIQBarForcedToDocked; virtual;

    { Called when IQBar gets an ABN_FULLSCREENAPP notification }
    procedure OnABNFullScreenApp(bOpen: Boolean); virtual;

    { Called when IQBar gets an ABN_POSCHANGED notification }
    procedure OnABNPosChanged; virtual;

    { Called when IQBar gets an ABN_WINDOWARRANGE notification }
    procedure OnABNWindowArrange(bBeginning: Boolean); virtual;

    { Message handlers }

    { Called when the IQBar receives a WM_IQBarNOTIFY window message }
    procedure OnIQBarCallbackMsg(var Msg: TMessage); message WM_IQBARNOTIFY;

    { Called when the IQBar form is first created }
    procedure OnCreate(var Msg: TWMCreate); message WM_CREATE;

    { Called when the IQBar form is about to be destroyed }
    procedure OnDestroy(var Msg: TWMDestroy); message WM_DESTROY;

    { Called when the IQBar receives a WM_WINDOWPOSCHANGED message }
    procedure OnWindowPosChanged(var Msg: TWMWindowPosChanged);
      message WM_WINDOWPOSCHANGED;

    { Called when the IQBar receives a WM_ACTIVATE message }
    procedure OnActivate(var Msg: TWMActivate); message WM_ACTIVATE;

    { Called every timer tick }
    procedure OnIQBarTimer(Sender: TObject);

    { Called when the IQBar receives a WM_NCMOUSEMOVE message }
    procedure OnNcMouseMove(var Msg: TWMNCMouseMove); message WM_NCMOUSEMOVE;

    { Called when the IQBar receives a WM_NCHITTEST message }
    procedure OnNcHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;

    { Called when the IQBar receives a WM_ENTERSIZEMOVE message }
    procedure OnEnterSizeMove(var Msg: TMessage); message WM_ENTERSIZEMOVE;

    { Called when the IQBar receives a WM_EXITSIZEMOVE message }
    procedure OnExitSizeMove(var Msg: TMessage); message WM_EXITSIZEMOVE;

    { Called when the IQBar receives a WM_MOVING message }
    procedure OnMoving(var Msg: TMessage); message WM_MOVING;

    { Called when the IQBar receives a WM_SIZING message }
    procedure OnSizing(var Msg: TMessage); message WM_SIZING;

    { Called when the IQBar receives a WM_GETMINMAXINFO message }
    procedure OnGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
      message WM_GETMINMAXINFO;

    { IQBar-specific helper functions }
    { Returns TRUE if abEdge is ABE_LEFT or ABE_RIGHT, else FALSE is returned }
    function IsEdgeLeftOrRight(abEdge: TIQBarEdge): Boolean;

    { Returns TRUE if abEdge is ABE_TOP or ABE_BOTTOM, else FALSE is returned }
    function IsEdgeTopOrBottom(abEdge: TIQBarEdge): Boolean;

    { Returns TRUE if abEdge is ABE_FLOAT, else FALSE is returned }
    function IsFloating(abEdge: TIQBarEdge): Boolean;

    { Returns TRUE if abFlags contain an at least allowed edge to dock on }
    function IsDockable(abFlags: TIQBarFlags): Boolean;

    { Returns TRUE if abFlags contain abfAllowLeft and abfAllowRight }
    function IsDockableVertically(abFlags: TIQBarFlags): Boolean;

    { Returns TRUE if abFlags contain abfAllowTop and abfAllowBottom }
    function IsDockableHorizontally(abFlags: TIQBarFlags): Boolean;

    { Forces the shell to update its IQBar list and the workspace area }
    procedure ResetSystemKnowledge;

    { Returns a proposed edge or ABE_FLOAT based on ABF_* flags and a
      point specified in screen coordinates }
    function GetEdgeFromPoint(abFlags: TIQBarFlags; pt: TSmallPoint)
      : TIQBarEdge;

  public { Public functions }
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateBar; virtual;

    function LoadSettings: Boolean; virtual;
    function SaveSettings: Boolean; virtual;

  published
    { Properties }
    { Allowed dockable edges }
    property Flags: TIQBarFlags read FABS.abFlags write FABS.abFlags;

    { Horizontal size increment }
    property HorzSizeInc: Integer read FABS.szSizeInc.cx
      write FABS.szSizeInc.cx;
    { Vertical size increment }
    property VertSizeInc: Integer read FABS.szSizeInc.cy
      write FABS.szSizeInc.cy;
    { Edge to dock on }
    property Edge: TIQBarEdge read GetEdge write SetEdge;

    { Auto-hide On/Off }
    property AutoHide: Boolean read FABS.bAutohide write FABS.bAutohide;

    { Always On Top On/Off }
    property AlwaysOnTop: Boolean read FABS.bAlwaysOnTop
      write FABS.bAlwaysOnTop;
    { Slide Effect On/Off }
    property SlideEffect: Boolean read FABS.bSlideEffect
      write FABS.bSlideEffect;
    { Slide Time }
    property SlideTime: Integer read FABS.nTimerInterval write SetSlideTime;

    { Horizontal size when docked on left or right }
    property HorzDockSize: Integer read FABS.szDockSize.cy
      write FABS.szDockSize.cy;

    { Vertical size when docked on top or bottom }
    property VertDockSize: Integer read FABS.szDockSize.cx
      write FABS.szDockSize.cx;

    { IQBar coordinates when floating }
    property FloatLeft: Integer read FABS.rcFloat.Left
      write FABS.rcFloat.Left;
    property FloatTop: Integer read FABS.rcFloat.Top
      write FABS.rcFloat.Top;
    property FloatRight: Integer read FABS.rcFloat.Right
      write FABS.rcFloat.Right;
    property FloatBottom: Integer read FABS.rcFloat.Bottom
      write FABS.rcFloat.Bottom;

    { IQBar MinMax dimensions when floating }
    property MinWidth: Integer read FABS.nMinWidth write FABS.nMinWidth;
    property MinHeight: Integer read FABS.nMinHeight write FABS.nMinHeight;
    property MaxWidth: Integer read FABS.nMaxWidth write FABS.nMaxWidth;
    property MaxHeight: Integer read FABS.nMaxHeight write FABS.nMaxHeight;

    { Min Height when docked horizontally }
    property MinHorzDockSize: Integer read FABS.szMinDockSize.cy
      write FABS.szMinDockSize.cy;

    { Min Width when docked vertically }
    property MinVertDockSize: Integer read FABS.szMinDockSize.cx
      write FABS.szMinDockSize.cx;

    { Max Height when docked horizontally }
    property MaxHorzDockSize: Integer read FABS.szMaxDockSize.cy
      write FABS.szMaxDockSize.cy;

    { Max Width when docked vertically }
    property MaxVertDockSize: Integer read FABS.szMaxDockSize.cx
      write FABS.szMaxDockSize.cx;

    { IQBar behavior in the Window Taskbar }
    property TaskEntry: TIQBarTaskEntry read FABS.abTaskEntry
      write FABS.abTaskEntry;

    { RootKey in the registry where settings should be loaded/saved }
    property RootKey: Integer read FabSettingsLocation.nRootKey
      write FabSettingsLocation.nRootKey;

    { KeyName in the registry where settings should be loaded/saved }
    property KeyName: String read FabSettingsLocation.KeyName
      write FabSettingsLocation.KeyName;

  end;

implementation

uses
  crm_rscstr,
  IQMS.Common.Dialogs;

constructor TIQBar.Create(Owner: TComponent);
begin
  { Force the shell to update its list of IQBars and the workarea.
    This is a precaution and is very useful when debugging.  If you create
    an IQBar and then just terminate the application, the shell still
    thinks that the IQBar exists and the user's workarea is smaller than
    it should be.  When a new IQBar is created, calling this function
    fixes the user's workarea. }
  ResetSystemKnowledge;

  { Set default state of IQBar to float with no width & height }
  FABS.cbSize := sizeof(TIQBarSettings);
  FABS.abEdge := abeFloat;
  FABS.abFlags := [abfAllowLeft .. abfAllowFloat];
  FABS.bAutohide := False;
  FABS.bAlwaysOnTop := False;
  FABS.bSlideEffect := True;
  FABS.nTimerInterval := SLIDE_DEF_TIMER_INTERVAL;
  FABS.szSizeInc.cx := IQ_DEF_SIZE_INC;
  FABS.szSizeInc.cy := IQ_DEF_SIZE_INC;
  FABS.szDockSize.cx := IQ_DEF_DOCK_SIZE;
  FABS.szDockSize.cy := IQ_DEF_DOCK_SIZE;
  FABS.rcFloat.Left := 0;
  FABS.rcFloat.Top := 0;
  FABS.rcFloat.Right := 0;
  FABS.rcFloat.Bottom := 0;
  FABS.nMinWidth := 0;
  FABS.nMinHeight := 0;
  FABS.nMaxWidth := GetSystemMetrics(SM_CXSCREEN);
  FABS.nMaxHeight := GetSystemMetrics(SM_CYSCREEN);
  FABS.szMinDockSize.cx := 0;
  FABS.szMinDockSize.cy := 0;
  FABS.szMaxDockSize.cx := GetSystemMetrics(SM_CXSCREEN) div 2;
  FABS.szMaxDockSize.cy := GetSystemMetrics(SM_CYSCREEN) div 2;
  FABS.abTaskEntry := abtFloatDependent;
  FabEdgeProposedPrev := abeUnknown;
  FbFullScreenAppOpen := False;
  FbAutoHideIsVisible := False;

  { Set default location of the settings in the registry }
  with FabSettingsLocation do
    begin
      RootKey := IQ_DEF_ROOT_KEY;
      KeyName := IQ_DEF_KEY_NAME;
    end;

  inherited Create(Owner);
end;

procedure TIQBar.OnCreate(var Msg: TWMCreate);
var
  hMenu: THandle;
begin
  inherited;
  { Associate a timer with the IQBar.  The timer is used to determine
    when a visible, inactive, auto-hide IQBar should be re-hidden }
  FTimer := TUniTimer.Create(Self);
  with FTimer do
    begin
      Interval := FABS.nTimerInterval;
      OnTimer := OnIQBarTimer;
      Enabled := True;
    end;

  { Save the initial position of the floating IQBar }
  FABS.rcFloat.Left := Left;
  FABS.rcFloat.Top := Top;

  { Register our IQBar window with the Shell }
  IQBarMessage1(abmNew);

  { Update IQBar internal state }
  UpdateBar;


  { Modify system menu }
  hMenu := GetSystemMenu(Handle, False);
  // DeleteMenu(hMenu, SC_RESTORE,  MF_BYCOMMAND);
  // DeleteMenu(hMenu, SC_MINIMIZE, MF_BYCOMMAND);
  DeleteMenu(hMenu, SC_MAXIMIZE, MF_BYCOMMAND);
end;

destructor TIQBar.Destroy;
begin
  ResetSystemKnowledge;
  inherited Destroy;
end;

procedure TIQBar.OnDestroy(var Msg: TWMDestroy);
begin
  { Free the Autohide timer }
  FTimer.Enabled := False;
  FTimer.Free;
  { Unregister our IQBar window with the Shell }
  SetEdge(abeUnknown);
  inherited;
end;

procedure TIQBar.UpdateBar;
begin
  SetEdge(GetEdge);
end;

procedure TIQBar.WMMenuSelect(var message: TWMMenuSelect);
var
  b: Boolean;
begin
  inherited;

  b := not ((Message.MenuFlag and $FFFF > 0) and (Message.Menu = 0));
  // FTimer.Enabled := not b;

end;

procedure TIQBar.CreateParams(var Params: TCreateParams);
var
  dwAdd, dwRemove, dwAddEx, dwRemoveEx: DWORD;
begin
  inherited CreateParams(Params);
  { Add Styles }
  dwAdd := 0;
  dwAddEx := WS_EX_TOOLWINDOW;
  { Remove Styles }
  dwRemove := WS_SYSMENU or WS_MAXIMIZEBOX or WS_MINIMIZEBOX;
  dwRemoveEx := WS_EX_APPWINDOW;
  { Modify Styles }
  with Params do
    begin
      Style := Style and (not dwRemove);
      Style := Style or dwAdd;
      ExStyle := ExStyle and (not dwRemoveEx);
      ExStyle := ExStyle or dwAddEx;
    end;
end;

function TIQBar.IQBarMessage(abMessage: TIQBarMessage;
  abEdge: TIQBarEdge;
  lParam: lParam;
  bRect: Boolean;
  var rc: TRect): UINT;
var
  abd: TAppBarData;
begin
  { Initialize an IQBarDATA structure }
  abd.cbSize := sizeof(abd);
  abd.hWnd := Handle;
  abd.uCallbackMessage := WM_IQBARNOTIFY;
  abd.uEdge := Ord(abEdge);
  if bRect then
    abd.rc := rc
  else
    abd.rc := Rect(0, 0, 0, 0);
  abd.lParam := lParam;
  Result := SHAppBarMessage(Ord(abMessage), abd);

  { If the caller passed a rectangle, return the updated rectangle }
  if bRect then
    rc := abd.rc;
end;

function TIQBar.IQBarMessage1(abMessage: TIQBarMessage): UINT;
var
  rc: TRect;
begin
  Result := IQBarMessage(abMessage, abeFloat, 0, False, rc);
end;

function TIQBar.IQBarMessage2(abMessage: TIQBarMessage;
  abEdge: TIQBarEdge): UINT;
var
  rc: TRect;
begin
  Result := IQBarMessage(abMessage, abEdge, 0, False, rc);
end;

function TIQBar.IQBarMessage3(abMessage: TIQBarMessage;
  abEdge: TIQBarEdge;
  lParam: lParam): UINT;
var
  rc: TRect;
begin
  Result := IQBarMessage(abMessage, abEdge, lParam, False, rc);
end;

function TIQBar.IQBarMessage4(abMessage: TIQBarMessage;
  abEdge: TIQBarEdge;
  lParam: lParam;
  var rc: TRect): UINT;
begin
  Result := IQBarMessage(abMessage, abEdge, lParam, True, rc);
end;

function TIQBar.CalcProposedState(var pt: TSmallPoint): TIQBarEdge;
var
  bForceFloat: Boolean;
begin
  { Force the IQBar to float if the user is holding down the Ctrl key
    and the IQBar's style allows floating }
  bForceFloat := ((GetKeyState(VK_CONTROL) and $8000) <> 0) and
    (abfAllowFloat in FABS.abFlags);
  if bForceFloat then
    Result := abeFloat
  else
    Result := GetEdgeFromPoint(FABS.abFlags, pt);
end;

procedure TIQBar.GetRect(abEdgeProposed: TIQBarEdge;
  var rcProposed: TRect);
begin
  { Find the x, y, cx, cy of the IQBar window }
  if abEdgeProposed = abeFloat then
    begin { The IQBar is floating, the proposed rectangle is correct }
      { Do nothing }
    end
  else { The IQBar is docked or auto-hide }
    begin { Set dimensions to full screen }
      with rcProposed do
        begin
          Left := 0;
          Top := 0;
          Right := GetSystemMetrics(SM_CXSCREEN);
          Bottom := GetSystemMetrics(SM_CYSCREEN);
        end;

      { Subtract what we want from the full screen dimensions }
      if not FABS.bAutohide then { Ask the shell where we can dock }
        IQBarMessage4(abmQueryPos, abEdgeProposed, lParam(False), rcProposed);

      case abEdgeProposed of
        abeLeft:
          rcProposed.Right := rcProposed.Left + FABS.szDockSize.cx;
        abeTop:
          rcProposed.Bottom := rcProposed.Top + FABS.szDockSize.cy;
        abeRight:
          rcProposed.Left := rcProposed.Right - FABS.szDockSize.cx;
        abeBottom:
          rcProposed.Top := rcProposed.Bottom - FABS.szDockSize.cy;
      end; { End case statement }
    end;

end;

function TIQBar.AdjustLocationForAutohide(bShow: Boolean;
  var rc: TRect): Boolean;
var
  x, y: Integer;
  cxVisibleBorder, cyVisibleBorder: Integer;
begin
  if ((GetEdge = abeUnknown) or
    (GetEdge = abeFloat) or
    (not FABS.bAutohide)) then
    begin
      { If we are not docked on an edge OR we are not auto-hidden, there is
        nothing for us to do; just return }
      Result := False;
      Exit;
    end;

  { Showing/hiding doesn't change our size; only our position }
  x := 0;
  y := 0; { Assume a position of (0, 0) }

  if bShow then { If we are on the right or bottom, calculate our visible position }
    case GetEdge of
      abeRight:
        x := GetSystemMetrics(SM_CXSCREEN) - (rc.Right - rc.Left);
      abeBottom:
        y := GetSystemMetrics(SM_CYSCREEN) - (rc.Bottom - rc.Top);
    end
  else
    begin { Keep a part of the IQBar visible at all times }
      cxVisibleBorder := 2 * GetSystemMetrics(SM_CXBORDER);
      cyVisibleBorder := 2 * GetSystemMetrics(SM_CYBORDER);
      { Calculate our x or y coordinate so that only the border is visible }
      case GetEdge of
        abeLeft:
          x := - ((rc.Right - rc.Left) - cxVisibleBorder);
        abeRight:
          x := GetSystemMetrics(SM_CXSCREEN) - cxVisibleBorder;
        abeTop:
          y := - ((rc.Bottom - rc.Top) - cyVisibleBorder);
        abeBottom:
          y := GetSystemMetrics(SM_CYSCREEN) - cyVisibleBorder;
      end; { End case statement }
    end; { End else }

  with rc do
    begin
      Right := x + (Right - Left);
      Bottom := y + (Bottom - Top);
      Left := x;
      Top := y;
    end;

  Result := True;
end;

procedure TIQBar.ShowHiddenIQBar(bShow: Boolean);
var
  rc: TRect;
begin
  { Get our window location in screen coordinates }
  GetWindowRect(Handle, rc);

  { Assume  that we are visible }
  FbAutoHideIsVisible := True;

  if AdjustLocationForAutohide(bShow, rc) then
    begin
      { the rectangle was adjusted, we are an autohide bar
        Remember whether we are visible or not }
      FbAutoHideIsVisible := bShow;
      { Slide window in from or out to the edge }
      SlideWindow(rc);
    end;
end;

procedure TIQBar.SlideWindow(var rcEnd: TRect);
var
  bFullDragOn: LongBool;
  rcStart: TRect;
  dwTimeStart, dwTimeEnd, dwTime: DWORD;
  x, y, w, h: Integer;
begin
  { Only slide the window if the user has FullDrag turned on }
  SystemParametersInfo(SPI_GETDRAGFULLWINDOWS, 0, @bFullDragOn, 0);
  { Get the current window position }
  GetWindowRect(Handle, rcStart);
  if (FABS.bSlideEffect and bFullDragOn and
    ((rcStart.Left <> rcEnd.Left) or
    (rcStart.Top <> rcEnd.Top) or
    (rcStart.Right <> rcEnd.Right) or
    (rcStart.Bottom <> rcEnd.Bottom))) then
    begin { Get our starting and ending time }
      dwTimeStart := GetTickCount;
      dwTimeEnd := dwTimeStart + FABS.nTimerInterval;
      dwTime := dwTimeStart;
      while (dwTime < dwTimeEnd)
        do { While we are still sliding, calculate our new position }
        begin
          x := rcStart.Left - (rcStart.Left - rcEnd.Left)
            * Integer(dwTime - dwTimeStart) div FABS.nTimerInterval;

          y := rcStart.Top - (rcStart.Top - rcEnd.Top)
            * Integer(dwTime - dwTimeStart) div FABS.nTimerInterval;

          w := (rcStart.Right - rcStart.Left)
            - ((rcStart.Right - rcStart.Left) - (rcEnd.Right - rcEnd.Left))
            * Integer(dwTime - dwTimeStart) div FABS.nTimerInterval;

          h := (rcStart.Bottom - rcStart.Top)
            - ((rcStart.Bottom - rcStart.Top) - (rcEnd.Bottom - rcEnd.Top))
            * Integer(dwTime - dwTimeStart) div FABS.nTimerInterval;

          { Show the window at its changed position }
          SetWindowPos(Handle, 0, x, y, w, h,
            SWP_NOZORDER or SWP_NOACTIVATE or SWP_DRAWFRAME);
          UpdateWindow(Handle);
          dwTime := GetTickCount;
        end; { End do...while... statement }
    end; { end if statement }

  { Make sure that the window is at its final position }
  Left := rcEnd.Left;
  Top := rcEnd.Top;
  Width := rcEnd.Right - rcEnd.Left;
  Height := rcEnd.Bottom - rcEnd.Top;
end;

function TIQBar.GetAutohideEdge: TIQBarEdge;
begin
  if Handle = IQBarMessage2(abmGetAutoHideBar, abeLeft) then
    Result := abeLeft
  else if Handle = IQBarMessage2(abmGetAutoHideBar, abeTop) then
    Result := abeTop
  else if Handle = IQBarMessage2(abmGetAutoHideBar, abeRight) then
    Result := abeRight
  else if Handle = IQBarMessage2(abmGetAutoHideBar, abeBottom) then
    Result := abeBottom
  else
    { If IQBar is docked but not auto-hidden, we return ABE_UNKNOWN }
    Result := abeUnknown;
end;

function TIQBar.GetMessagePosition: TSmallPoint;
var
  pt: TSmallPoint;
  dw: DWORD;
begin
  dw := GetMessagePos;
  pt.x := SHORT(dw);
  pt.y := SHORT((dw and $FFFF0000) shr 16);
  Result := pt;
end;

function TIQBar.ModifyStyle(hWnd: THandle;
  nStyleOffset: Integer;
  dwRemove: DWORD;
  dwAdd: DWORD;
  nFlags: UINT): Boolean;
var
  dwStyle: DWORD;
  dwNewStyle: DWORD;
begin
  dwStyle := GetWindowLong(hWnd, nStyleOffset);
  dwNewStyle := (dwStyle and (not dwRemove)) or dwAdd;

  if dwStyle = dwNewStyle then
    begin
      Result := False;
      Exit;
    end;

  SetWindowLong(hWnd, nStyleOffset, dwNewStyle);

  if nFlags <> 0 then
    SetWindowPos(hWnd, 0, 0, 0, 0, 0,
      SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE or nFlags);

  Result := True;
end;

{ Property selector functions }
function TIQBar.GetEdge: TIQBarEdge;
begin
  if FabEdgeProposedPrev <> abeUnknown then
    Result := FabEdgeProposedPrev
  else
    Result := FABS.abEdge;
end;

procedure TIQBar.SetEdge(abEdge: TIQBarEdge);
var
  abCurrentEdge: TIQBarEdge;
  currentRect: TRect;
  rc: TRect;
  hWnd: THandle;
begin
  { If the IQBar is registered as auto-hide, unregister it }
  abCurrentEdge := GetAutohideEdge;

  if abCurrentEdge <> abeUnknown
  then { Our IQBar is auto-hidden, unregister it }
    IQBarMessage3(abmSetAutoHideBar, abCurrentEdge, lParam(False));

  { Save the new requested state }
  FABS.abEdge := abEdge;

  case abEdge of
    abeUnknown:
      begin
        { We are being completely unregistered.
          Probably, the IQBar window is being destroyed.
          If the IQBar is registered as NOT auto-hide, unregister it }
        IQBarMessage1(abmRemove);
      end;
    abeFloat:
      if not hResizing then
        begin
          { We are floating and therefore are just a regular window.
            Tell the shell that the docked IQBar should be of 0x0 dimensions
            so that the workspace is not affected by the IQBar }
          currentRect := Rect(0, 0, 0, 0);
          IQBarMessage4(abmSetPos, abEdge, lParam(False), currentRect);
          Left := FABS.rcFloat.Left;
          Top := FABS.rcFloat.Top;
          Width := FABS.rcFloat.Right - FABS.rcFloat.Left;
          Height := FABS.rcFloat.Bottom - FABS.rcFloat.Top;
        end;
  else
    if not hResizing then
      begin
        if FABS.bAutohide and
          (IQBarMessage3(abmSetAutoHideBar,
          GetEdge,
          lParam(True)) = 0) then
          begin { We couldn't set the IQBar on a new edge, let's dock it instead }
            FABS.bAutohide := False;
            { Call a virtual function to let derived System.Classes know that the IQBar
              changed from auto-hide to docked }
            OnIQBarForcedToDocked;
          end;

        GetRect(GetEdge, rc);
        if FABS.bAutohide then
          begin
            currentRect := Rect(0, 0, 0, 0);
            IQBarMessage4(abmSetPos, abeLeft, lParam(False), currentRect);
          end
        else
          begin { Tell the shell where the IQBar is }
            IQBarMessage4(abmSetPos, abEdge, lParam(False), rc);
          end;
        AdjustLocationForAutohide(FbAutoHideIsVisible, rc);
        { Slide window in from or out to the edge }
        SlideWindow(rc);
      end; { End else statement }
  end; { End case statement }

  { Set the IQBar's z-order appropriately }
  hWnd := HWND_NOTOPMOST; { Assume normal Z-Order }
  if FABS.bAlwaysOnTop then
    begin { If we are supposed to be always-on-top, put us there }
      hWnd := HWND_TOPMOST;
      if FbFullScreenAppOpen then
        { But, if a full-screen window is opened, put ourself at the bottom
          of the z-order so that we don't cover the full-screen window }
        hWnd := HWND_BOTTOM;
    end;
  SetWindowPos(Handle, hWnd,
    0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);

  { Make sure that any auto-hide IQBars stay on top of us after we move
    even though our activation state has not changed }
  IQBarMessage1(abmActivate);
  { Tell our derived class that there is a state change }
  OnIQBarStateChange(False, abEdge);
  { Show or hide the taskbar entry depending on IQBar position }
  case FABS.abTaskEntry of
    abtShow:
      ShowWindow(Application.Handle, SW_SHOW);
    // abtHide : ShowWindow(Application.Handle, SW_HIDE);
    abtHide:
      ShowWindow(Application.Handle, SW_SHOW);
    abtFloatDependent:
      case abEdge of
        abeFloat:
          ShowWindow(Application.Handle, SW_SHOW);
        abeLeft, abeTop, abeRight, abeBottom:
          ShowWindow(Application.Handle, SW_SHOW); // was SW_HIDE
      end; { End case statement }
  end;
end;

procedure TIQBar.SetSlideTime(nInterval: Integer);
begin
  FABS.nTimerInterval := nInterval;
  FTimer.Interval := nInterval;
end;

{ Overridable functions }
procedure TIQBar.OnIQBarStateChange(bProposed: Boolean;
  abEdgeProposed: TIQBarEdge);
var
  bFullDragOn: LongBool;
begin
  { Find out if the user has FullDrag turned on }
  SystemParametersInfo(SPI_GETDRAGFULLWINDOWS, 0, @bFullDragOn, 0);
  { If FullDrag is turned on OR the IQBar has changed position }
  if bFullDragOn or not bProposed then
    begin
      if abEdgeProposed = abeFloat then
        { Show the window adornments }
        ModifyStyle(Handle,
          GWL_STYLE,
          0,
          WS_CAPTION or WS_SYSMENU,
          SWP_DRAWFRAME)
      else
        { Hide the window adornments }
        ModifyStyle(Handle,
          GWL_STYLE,
          WS_CAPTION or WS_SYSMENU,
          0,
          SWP_DRAWFRAME);
    end;
end;

procedure TIQBar.OnIQBarForcedToDocked;
begin
  {
    'There is already an auto hidden window on this edge.'#13 +
    'Only one auto hidden window is allowed on an edge.'
  }
  IQError(crm_rscstr.cTXT0000290);
end;

procedure TIQBar.OnABNFullScreenApp(bOpen: Boolean);
begin
  { This function is called when a FullScreen window is openning or
    closing. A FullScreen window is a top-level window that has its caption
    above the top of the screen allowing the entire screen to be occupied
    by the window's client area. }

  { If the IQBar is a topmost window when a FullScreen window is activated,
    we need to change our window to a non-topmost window so that the IQBar
    doesn't cover the FullScreen window's client area. }

  { If the FullScreen window is closing, we need to set the IQBar's
    Z-Order back to when the user wants it to be. }
  FbFullScreenAppOpen := bOpen;
  UpdateBar;
end;

procedure TIQBar.OnABNPosChanged;
begin
  { The TaskBar or another IQBar has changed its size or position }
  if (GetEdge <> abeFloat) and (not FABS.bAutohide) then
    { If we're not floating and we're not auto-hidden, we have to
      reposition our window }
    UpdateBar;
end;

procedure TIQBar.OnABNWindowArrange(bBeginning: Boolean);
begin
  { Do nothing }
end;

{ Message handlers }
procedure TIQBar.OnIQBarCallbackMsg(var Msg: TMessage);
begin
  case Msg.WParam of
    ABN_FULLSCREENAPP:
      OnABNFullScreenApp(Msg.lParam <> 0);
    ABN_POSCHANGED:
      OnABNPosChanged;
    ABN_WINDOWARRANGE:
      OnABNWindowArrange(Msg.lParam <> 0);
  end;
end;

procedure TIQBar.OnWindowPosChanged(var Msg: TWMWindowPosChanged);
begin
  inherited;
  { When our window changes position, tell the Shell so that any
    auto-hidden IQBar on our edge stays on top of our window making it
    always accessible to the user }
  IQBarMessage1(abmWindowPosChanged);
end;

procedure TIQBar.OnActivate(var Msg: TWMActivate);
begin
  inherited;
  if Msg.Active = WA_INACTIVE then
    { Hide the IQBar if we are docked and auto-hidden }
    ShowHiddenIQBar(False);

  { When our window changes position, tell the Shell so that any
    auto-hidden IQBar on our edge stays on top of our window making it
    always accessible to the user. }
  IQBarMessage1(abmActivate);
end;

procedure TIQBar.OnIQBarTimer(Sender: TObject);
var
  pt: TSmallPoint;
  rc: TRect;
begin
  if GetActiveWindow <> Handle then
    begin
      { Possibly hide the IQBar if we are not the active window
        Get the position of the mouse and the IQBar's position
        Everything must be in screen coordinates }
      pt := GetMessagePosition;
      GetWindowRect(Handle, rc);
      { Add margin around the IQBar }
      InflateRect(rc,
        (2 * GetSystemMetrics(SM_CXDOUBLECLK)),
        (2 * GetSystemMetrics(SM_CYDOUBLECLK)));
      if not PtInRect(rc, SmallPointToPoint(pt)) then
        { If the mouse is NOT over the IQBar, hide the IQBar }
        ShowHiddenIQBar(False);
    end;
  inherited;
end;

procedure TIQBar.OnNcMouseMove(var Msg: TWMNCMouseMove);
begin
  { If we are a docked, auto-hidden IQBar, shown us
    when the user moves over our non-client area }
  ShowHiddenIQBar(True);
  inherited;
end;

procedure TIQBar.OnNcHitTest(var Msg: TWMNCHitTest);
var
  u: UINT;
  bPrimaryMouseBtnDown: Boolean;
  rcClient: TRect;
  pt: TPoint;
  vKey: Integer;
begin
  { What is the hit test code }
  inherited;
  u := Msg.Result;

  { If the user presses the secondary mouse button, pretend that the
    user clicked on the client area so that we get WM_CONTEXTMENU Winapi.Messages }
  if GetSystemMetrics(SM_SWAPBUTTON) <> 0 then
    vKey := VK_RBUTTON
  else
    vKey := VK_LBUTTON;
  bPrimaryMouseBtnDown := ((GetAsyncKeyState(vKey) and $8000) <> 0);

  pt.x := Msg.XPos;
  pt.y := Msg.YPos;
  pt := ScreenToClient(pt);
  if (u = HTCLIENT) and bPrimaryMouseBtnDown
    and (ControlAtPos(pt, False) = nil) then
    { User clicked in client area, allow IQBar to move.  We get this
      behavior by pretending that the user clicked on the caption area }
    u := HTCAPTION;

  { If the IQBar is floating and the hittest code is a resize code... }
  if ((GetEdge = abeFloat) and
    (HTSIZEFIRST <= u) and (u <= HTSIZELAST)) then
    begin
      case u of
        HTLEFT, HTRIGHT:
          if FABS.szSizeInc.cx = 0
          then
            u := HTBORDER;
        HTTOP, HTBOTTOM:
          if FABS.szSizeInc.cy = 0
          then
            u := HTBORDER;
        HTTOPLEFT:
          if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTBORDER
          else if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy <> 0)
          then
            u := HTTOP
          else if (FABS.szSizeInc.cx <> 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTLEFT;
        HTTOPRIGHT:
          if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTBORDER
          else if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy <> 0)
          then
            u := HTTOP
          else if (FABS.szSizeInc.cx <> 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTRIGHT;
        HTBOTTOMLEFT:
          if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTBORDER
          else if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy <> 0)
          then
            u := HTBOTTOM
          else if (FABS.szSizeInc.cx <> 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTLEFT;
        HTBOTTOMRIGHT:
          if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTBORDER
          else if (FABS.szSizeInc.cx = 0) and (FABS.szSizeInc.cy <> 0)
          then
            u := HTBOTTOM
          else if (FABS.szSizeInc.cx <> 0) and (FABS.szSizeInc.cy = 0)
          then
            u := HTRIGHT;
      end;
    end;

  { When the IQBar is docked, the user can resize only one edge.
    This next section determines which edge the user can resize.
    To allow resizing, the IQBar window must have the WS_THICKFRAME style }

  { If the IQBar is docked and the hittest code is a resize code... }
  if ((GetEdge <> abeFloat) and (GetEdge <> abeUnknown) and
    (HTSIZEFIRST <= u) and (u <= HTSIZELAST)) then
    begin

      if (IsEdgeLeftOrRight(GetEdge) and (FABS.szSizeInc.cx = 0)) or
        (not IsEdgeLeftOrRight(GetEdge) and (FABS.szSizeInc.cy = 0)) then
        begin
          { If the width/height size increment is zero, then resizing is NOT
            allowed for the edge that the IQBar is docked on }
          u := HTBORDER; { Pretend that the mouse is not on a resize border }
        end
      else
        begin
          { Resizing IS allowed for the edge that the IQBar is docked on
            Get the location of the IQBar's client area in screen coordinates }
          rcClient := GetClientRect;
          pt.x := rcClient.Left;
          pt.y := rcClient.Top;
          pt := ClientToScreen(pt);
          rcClient.Left := pt.x;
          rcClient.Top := pt.y;
          pt.x := rcClient.Right;
          pt.y := rcClient.Bottom;
          pt := ClientToScreen(pt);
          rcClient.Right := pt.x;
          rcClient.Bottom := pt.y;

          u := HTBORDER; { Assume that we can't resize }
          case GetEdge of
            abeLeft:
              if Msg.XPos > rcClient.Right then
                u := HTRIGHT;
            abeTop:
              if Msg.YPos > rcClient.Bottom then
                u := HTBOTTOM;
            abeRight:
              if Msg.XPos < rcClient.Left then
                u := HTLEFT;
            abeBottom:
              if Msg.YPos < rcClient.Top then
                u := HTTOP;
          end; { end case statement }
        end; { end else statement }
    end;

  { Return the hittest code }
  Msg.Result := u;
end;

procedure TIQBar.OnEnterSizeMove(var Msg: TMessage);
begin
  { The user started moving/resizing the IQBar, save its current state }
  // if not hResizing then Screen.Cursor := crSizeAll;
  FabEdgeProposedPrev := GetEdge;
end;

procedure TIQBar.OnExitSizeMove(var Msg: TMessage);
var
  abEdgeProposedPrev: TIQBarEdge;
  rc, rcWorkArea: TRect;
  w, h: Integer;
begin
  Screen.Cursor := crDefault;
  { The user stopped moving/resizing the IQBar, set the new state }
  { Save the new proposed state of the IQBar }
  abEdgeProposedPrev := FabEdgeProposedPrev;

  { Set the proposed state back to unknown.  This causes GetState
    to return the current state rather than the proposed state }
  FabEdgeProposedPrev := abeUnknown;

  { Get the location of the window in screen coordinates }
  GetWindowRect(Handle, rc);

  { If the IQBar's state has changed... }
  if GetEdge = abEdgeProposedPrev then
    case GetEdge of
      abeLeft, abeRight:
        { Save the new width of the docked IQBar }
        FABS.szDockSize.cx := rc.Right - rc.Left;
      abeTop, abeBottom:
        { Save the new height of the docked IQBar }
        FABS.szDockSize.cy := rc.Bottom - rc.Top;
    end;

  { Always save the new position of the floating IQBar }
  if abEdgeProposedPrev = abeFloat then
    begin { If IQBar was floating and keeps floating... }
      if GetEdge = abeFloat then
        begin { If IQBar was docked and is going to float... }
          FABS.rcFloat := rc;
        end
      else { Propose width and height depending on the current window position }
        begin
          w := rc.Right - rc.Left;
          h := rc.Bottom - rc.Top;
          { Adjust width and height }
          SystemParametersInfo(SPI_GETWORKAREA, 0, @rcWorkArea, 0);
          if (w >= (rcWorkArea.Right - rcWorkArea.Left)) or
            (h >= (rcWorkArea.Bottom - rcWorkArea.Top)) then
            begin
              w := FABS.rcFloat.Right - FABS.rcFloat.Left;
              h := FABS.rcFloat.Bottom - FABS.rcFloat.Top;
            end;
          { Save new floating position }
          FABS.rcFloat.Left := rc.Left;
          FABS.rcFloat.Top := rc.Top;
          FABS.rcFloat.Right := rc.Left + w;
          FABS.rcFloat.Bottom := rc.Top + h;
        end; { end begin... }
    end; { end begin... }

  { After setting the dimensions, set the IQBar to the proposed state }
  SetEdge(abEdgeProposedPrev);
  hResizing := False;
end;

procedure TIQBar.OnMoving(var Msg: TMessage);
var
  prc: PRect;
  pt: TSmallPoint;
  abEdgeProposed: TIQBarEdge;
  w, h: Integer;
begin
  Screen.Cursor := crSizeAll;
  { Control form movement.  For example, if the mouse moves
    close to an edge, dock form.  The lParam contains the
    window's position proposed by the system }
  prc := PRect(Msg.lParam);

  { Get the location of the mouse cursor }
  pt := GetMessagePosition;

  { Where should the IQBar be based on the mouse position? }
  abEdgeProposed := CalcProposedState(pt);

  if ((FabEdgeProposedPrev <> abeFloat) and
    (abEdgeProposed = abeFloat)) then
    begin
      { While moving, the user took us from a docked/autohidden state to
        the float state.  We have to calculate a rectangle location so that
        the mouse cursor stays inside the window. }
      prc^ := FABS.rcFloat;
      w := prc^.Right - prc^.Left;
      h := prc^.Bottom - prc^.Top;
      with prc^ do
        begin
          Left := pt.x - w div 2;
          Top := pt.y;
          Right := pt.x - w div 2 + w;
          Bottom := pt.y + h;
        end;
    end;

  { Remember the most-recently proposed state }
  FabEdgeProposedPrev := abEdgeProposed;

  { Tell the system where to move the window based on the proposed state }
  GetRect(abEdgeProposed, prc^);

  { Tell our derived class that there is a proposed state change }
  OnIQBarStateChange(True, abEdgeProposed);
end;

procedure TIQBar.OnSizing(var Msg: TMessage);
var
  prc: PRect;
  rcBorder: TRect;
  nWidthNew, nHeightNew: Integer;
begin
  hResizing := True;
  { Control form resizing.  For example, if the user re-sizes
    an edge, we want to change the size in discrete increments.
    The lParam contains the window's position proposed by the system }
  prc := PRect(Msg.lParam);
  // IQInformation( Format( '%d:%d', [FABS.szMinDockSize.cx, FABS.szMinDockSize.cy]));
  { Get the minimum allowed size of the window depending on current edge. }
  { This is the width/height of the window that must always be present }
  with FABS do
    case abEdge of
      abeFloat:
        rcBorder := Rect(0, 0, nMinWidth, nMinHeight);
    else
      rcBorder := Rect(0, 0, szMinDockSize.cx, szMinDockSize.cy);
    end;

  { Force the window to resize in discrete units set by the FABS.szSizeInc
    member.  From the new, proposed window dimensions passed to us, round
    the width/height to the nearest discrete unit }
  if FABS.szSizeInc.cx <> 0 then
    nWidthNew := ((prc^.Right - prc^.Left) - (rcBorder.Right - rcBorder.Left)
      + FABS.szSizeInc.cx div 2) div FABS.szSizeInc.cx
      * FABS.szSizeInc.cx + (rcBorder.Right - rcBorder.Left)
  else
    nWidthNew := prc^.Right - prc^.Left;

  if FABS.szSizeInc.cy <> 0 then
    nHeightNew := ((prc^.Bottom - prc^.Top) - (rcBorder.Bottom - rcBorder.Top)
      + FABS.szSizeInc.cy div 2) div FABS.szSizeInc.cy
      * FABS.szSizeInc.cy + (rcBorder.Bottom - rcBorder.Top)
  else
    nHeightNew := prc^.Bottom - prc^.Top;

  { Adjust the rectangle's dimensions }
  case Msg.WParam of
    WMSZ_LEFT:
      prc^.Left := prc^.Right - nWidthNew;
    WMSZ_TOP:
      prc^.Top := prc^.Bottom - nHeightNew;
    WMSZ_RIGHT:
      prc^.Right := prc^.Left + nWidthNew;
    WMSZ_BOTTOM:
      prc^.Bottom := prc^.Top + nHeightNew;
    WMSZ_BOTTOMLEFT:
      begin
        prc^.Bottom := prc^.Top + nHeightNew;
        prc^.Left := prc^.Right - nWidthNew;
      end;
    WMSZ_BOTTOMRIGHT:
      begin
        prc^.Bottom := prc^.Top + nHeightNew;
        prc^.Right := prc^.Left + nWidthNew;
      end;
    WMSZ_TOPLEFT:
      begin
        prc^.Left := prc^.Right - nWidthNew;
        prc^.Top := prc^.Bottom - nHeightNew;
      end;
    WMSZ_TOPRIGHT:
      begin
        prc^.Top := prc^.Bottom - nHeightNew;
        prc^.Right := prc^.Left + nWidthNew;
      end;
  end; { end of case statement }
end;

procedure TIQBar.OnGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  if GetEdge = abeFloat then
    with Msg.MinMaxInfo^ do
      begin
        ptMinTrackSize.x := FABS.nMinWidth;
        ptMinTrackSize.y := FABS.nMinHeight;
        ptMaxTrackSize.x := FABS.nMaxWidth;
        ptMaxTrackSize.y := FABS.nMaxHeight;
      end
  else
    with Msg.MinMaxInfo^ do
      begin
        ptMinTrackSize.x := FABS.szMinDockSize.cx;
        ptMinTrackSize.y := FABS.szMinDockSize.cy;
        ptMaxTrackSize.x := GetSystemMetrics(SM_CXSCREEN);
        ptMaxTrackSize.y := GetSystemMetrics(SM_CYSCREEN);
        if not IsEdgeTopOrBottom(GetEdge) then
          ptMaxTrackSize.x := FABS.szMaxDockSize.cx;
        if not IsEdgeLeftOrRight(GetEdge) then
          ptMaxTrackSize.y := FABS.szMaxDockSize.cy;
      end;
end;

{ IQBar-specific helper functions }
function TIQBar.IsEdgeLeftOrRight(abEdge: TIQBarEdge): Boolean;
begin
  Result := (abEdge in [abeLeft, abeRight]);
end;

function TIQBar.IsEdgeTopOrBottom(abEdge: TIQBarEdge): Boolean;
begin
  Result := (abEdge in [abeTop, abeBottom]);
end;

function TIQBar.IsFloating(abEdge: TIQBarEdge): Boolean;
begin
  Result := (abEdge = abeFloat);
end;

function TIQBar.IsDockable(abFlags: TIQBarFlags): Boolean;
begin
  Result := ((abFlags * [abfAllowLeft .. abfAllowBottom]) <> []);
end;

function TIQBar.IsDockableVertically(abFlags: TIQBarFlags): Boolean;
begin
  Result := ((abFlags * [abfAllowLeft, abfAllowRight]) <> []);
end;

function TIQBar.IsDockableHorizontally(abFlags: TIQBarFlags): Boolean;
begin
  Result := ((abFlags * [abfAllowTop, abfAllowBottom]) <> []);
end;

procedure TIQBar.ResetSystemKnowledge;
// {$ifdef DEBUG}
// var
// abd : TIQBarData;
// begin
// abd.cbSize := sizeof(abd);
// abd.hWnd := 0;
// SHIQBarMessage(ABM_REMOVE, abd);
// end;
// {$else}
begin
  { Do nothing }
end;
// {$endif}

function TIQBar.GetEdgeFromPoint(abFlags: TIQBarFlags; pt: TSmallPoint)
  : TIQBarEdge;
var
  rc: TRect;
  cxScreen: Integer;
  cyScreen: Integer;
  ptCenter: TSmallPoint;
  ptOffset: TSmallPoint;
  bIsLeftOrRight: Boolean;
  abSubstEdge: TIQBarEdge;
begin
  if abfAllowFloat in abFlags then
    begin
      { Get the rectangle that bounds the size of the screen
        minus any docked (but not-autohidden) IQBars }
      SystemParametersInfo(SPI_GETWORKAREA, 0, @rc, 0);

      { Leave a 1/2 width/height-of-a-scrollbar gutter around the workarea }
      InflateRect(rc,
        - GetSystemMetrics(SM_CXVSCROLL),
        - GetSystemMetrics(SM_CYHSCROLL));
      { If the point is in the adjusted workarea OR no edges are allowed }
      if PtInRect(rc, SmallPointToPoint(pt)) or
        not IsDockable(abFlags) then
        begin
          { The IQBar should float }
          Result := abeFloat;
          Exit;
        end;
    end;

  { If we get here, the IQBar should be docked }
  { Get the dimensions of the screen }
  cxScreen := GetSystemMetrics(SM_CXSCREEN);
  cyScreen := GetSystemMetrics(SM_CYSCREEN);

  { Find the center of the screen }
  ptCenter.x := cxScreen div 2;
  ptCenter.y := cyScreen div 2;

  { Find the distance from the point to the center }
  ptOffset.x := pt.x - ptCenter.x;
  ptOffset.y := pt.y - ptCenter.y;

  { Determine if the point is farther from the left/right or top/bottom }
  bIsLeftOrRight :=
    ((Abs(ptOffset.y) * cxScreen) <= (Abs(ptOffset.x) * cyScreen));

  { Propose an edge }
  if bIsLeftOrRight then
    begin
      if 0 <= ptOffset.x then
        Result := abeRight
      else
        Result := abeLeft;
    end
  else
    begin
      if 0 <= ptOffset.y then
        Result := abeBottom
      else
        Result := abeTop;
    end;

  { Calculate an edge substitute }
  if abfAllowFloat in abFlags then
    abSubstEdge := abeFloat
  else
    abSubstEdge := FABS.abEdge;

  { Check if the proposed edge is allowed. If not, return the edge substitute }
  case Result of
    abeLeft:
      if not (abfAllowLeft in abFlags) then
        Result := abSubstEdge;
    abeTop:
      if not (abfAllowTop in abFlags) then
        Result := abSubstEdge;
    abeRight:
      if not (abfAllowRight in abFlags) then
        Result := abSubstEdge;
    abeBottom:
      if not (abfAllowBottom in abFlags) then
        Result := abSubstEdge;
  end;
end;

function TIQBar.LoadSettings: Boolean;
var
  Abs: TIQBarSettings;
begin
  Result := False;
  with TIQWebRegistry.Create do
    try
      RootKey := FabSettingsLocation.nRootKey;
      if OpenKey(FabSettingsLocation.KeyName, False) then
        try
//          if ReadBinaryData('', Abs, sizeof(Abs)) = sizeof(Abs) then
//            begin
//              FABS := Abs;
//              Result := True;
//            end;
        except // suppress.  We can get error when running for first time
        end; // on inferior operating systems
    finally
      Free;
    end;
end;

function TIQBar.SaveSettings: Boolean;
var
  reg: TIQWebRegistry;
begin
  Result := False;
  reg := TIQWebRegistry.Create;
  reg.RootKey := FabSettingsLocation.nRootKey;
  if reg.OpenKey(FabSettingsLocation.KeyName, True) then
    begin
//      reg.WriteBinaryData('', FABS, sizeof(FABS));
      Result := True;
    end;
  reg.Destroy
end;

end.
