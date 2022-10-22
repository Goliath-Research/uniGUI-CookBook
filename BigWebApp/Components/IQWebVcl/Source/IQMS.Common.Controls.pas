unit IQMS.Common.Controls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms,
  Vcl.Graphics, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.CheckLst,uniGUIAbstractClasses,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.DBGrids, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.Menus, Vcl.Mask, System.Math, Data.DB, UniPageControl,uniComboBox,

//  Vcl.Wwdbgrid, Vcl.Wwdbigrd, wwDBLook, Vcl.Wwdotdot, Wwdbdlg, wwriched,
//  wwcombobutton, wwdbdatetimepicker, wwmonthcalendar, wwcheckbox,
//  Vcl.Wwfltdlg, Vcl.Wwdbcomb, Vcl.wwDataInspector, Vcl.wwdbedit,
  UniDbGrid,uniBasicGrid,uniGUIClasses, uniguiapplication,UniPanel,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf,

  IQMS.WebVcl.SecurityRegister,
//  IQNumber,
  Winapi.RichEdit, uniGUIForm, uniGUIFrame,  uniEdit,uniLabel, uniStatusBar;

const
  RIGHT_ADJUST_BUFFER = 8;
  // 10/12/2010 Value was 4, but 8 looks better on Vista and Windows 7

type
  { TAlignCmd }
  TAlignCmd = (
    // Lines up the left edges of the selected components (horizontal only)
    acLeftSides,
    // Lines up the horizontal centers of the selected components
    acHorizontalCenters,
    // Lines up the right edges of the selected components (horizontal only)
    acRightSides,
    // Lines up the top edges of the selected components (vertical only)
    acTops,
    // Lines up the vertical centers of the selected components
    acVerticalCenters,
    // Lines up the bottom edges of the selected components (vertical only)
    acBottoms);

{$REGION 'General control methods'}
procedure IQEnableControl(AComponent: TComponent; AValue: Boolean); overload;
procedure IQEnableControl(const AComponents: array of TComponent;
  AValue: Boolean); overload;
procedure IQEnableControl(const AComponents: array of TComponent;
  AValue: Boolean; ASecurityRegister: TIQWebSecurityRegister); overload;

procedure IQShowControl(AComponent: TComponent; AValue: Boolean); overload;
procedure IQShowControl(const AComponents: array of TComponent;
  AValue: Boolean); overload;
procedure IQShowControl(const AComponents: array of TComponent;
  AValue: Boolean; ASecurityRegister: TIQWebSecurityRegister); overload;

procedure IQReadOnlyControl(AComponent: TComponent; AValue: Boolean); overload;
procedure IQReadOnlyControl(const AComponents: array of TComponent;
  AValue: Boolean); overload;
procedure IQReadOnlyControl(const AComponents: array of TComponent;
  AValue: Boolean; ASecurityRegister: TIQWebSecurityRegister); overload;

// Used for hiding embedded grid controls.
procedure IQHideControls(const AComponents: array of TComponent);
// Blink control
procedure Blink(AControl: TControl; ACount: Integer);
// clear parent control of owned controls
procedure FreeControls(AWinControl: TWinControl);
procedure FreeControlsExcept(AWinControl: TWinControl; AControls: array of TControl);
function ControlInList(AControl: TControl; AControlList: array of TControl): Boolean;
function VisibleControlCount(AControl: TWinControl): Integer;
function FindShapeControl(const AOwner: TWinControl;
  const AControlName: string): TShape;
procedure FrameControl(const AControl: TControl; AFramed: Boolean; AColor: TColor = clHighlight);
// Example:  IQMS.Common.Controls.FrameButton(SpeedButton1, SpeedButton1.Down);
procedure FrameButton(const AButton: TButton; AFramed: Boolean); overload;
procedure FrameButton(const AButton: TSpeedButton; AFramed: Boolean); overload;
procedure FrameButton(const AButton: TBitBtn; AFramed: Boolean); overload;
procedure FrameButtonsIfDown(const AButtons: array of TSpeedButton);
procedure PrepareButtonFrame(const AButton: TSpeedButton);
procedure PrepareButtonFrames(const AButtons: array of TSpeedButton);

// system font for controls
procedure ApplySystemFontName(const ALabels: array of TLabel);

function MaxPanelHeightForVisibleControls(APanel: TPanel): Integer;

{$ENDREGION 'General control methods'}

{$REGION 'Centering Controls' }
procedure CenterControlsHorizInWindowA(const AParent: TWinControl);
procedure CenterControlsHorizInWindowB(const AParent: TWinControl;
  const AControls: array of TControl);
procedure CenterLabel(const AEditCtrl: TUniControl; const ALabel: TUniLabel);
procedure IQAlignControls(const AControls: array of TControl;
  const ACommand: TAlignCmd);
procedure CenterControlsVertInWindowA(const AParent: TWinControl);
{$ENDREGION 'Center Controls' }

{$REGION 'Vertical Control Adjustment' }
// Stack controls vertically (tops)
procedure StackUpControls(ATop, AGapBetween: Integer;
  const AControls: array of TControl);
procedure StackUpControlsA(ATop, AGapBetween: Integer;
  const AControls: array of TControl);
procedure StackUpControlsB(AParent: TWinControl; AEditControlLeft: Integer = 2);
procedure StackUpControlsC(const AControls: array of TControl);
{$ENDREGION 'Vertical Control Adjustment' }

{$REGION 'Horizontal Control Adjustment' }
procedure StackUpControlsLeft(ALeft, AGapBetween: Integer;
  const AControls: array of TControl);

// Adjust the width of controls that have [alRight] in the Align properties
// to the ClientWidth of the parent.  All other controls are untouched.
procedure AdjustRightAlignedControlsToParent(AParent: TWinControl;
  ARightOffSet: Integer = RIGHT_ADJUST_BUFFER);

// Adjusts the width of all controls of Parent to the ClientWidth
procedure AdjustControlWidthToParentA(AParent: TWinControl;
  ARightOffSet: Integer = RIGHT_ADJUST_BUFFER);

// Adjusts the width of all listed controls to the ClientWidth of the Parent
procedure AdjustControlWidthToParentB(AParent: TWinControl;
  const AControls: array of TControl;
  ARightOffSet: Integer = RIGHT_ADJUST_BUFFER);

// Beginning with the initial left position (AStartLeft)
procedure AlignControlsFromLeftA(const AParent: TWinControl;
  const AStartLeft, ATop, AGapBetween: Integer);
procedure AlignControlsFromLeftB(const AStartLeft, ATop, AGapBetween: Integer;
  const AControls: array of TControl);
procedure AlignControlsFromLeftC(const AParent: TWinControl;
  const AStartLeft, ATop, AGapBetween, AHeight, AWidth: Integer);

// These are retained for backward compatibility;
// please use AdjustControlWidthToParentB instead.
procedure IQAdjustControlsWidthBasedOnParent(AParent: TWinControl;
  const AControls: array of TControl; AOffset: Integer);
procedure AdjustControlsWidthBasedOnParent(AParent: TWinControl;
  const AControls: array of TControl; AOffset: Integer);
procedure EnsureCompletelyAlignedToRightOf(AParent, AChild: TWinControl);
{$ENDREGION 'Horizontal Control Adjustment' }

// Checks specific to Vista
// NOTE: Avoid calling these methods, since they are OS-specific
// procedure CheckVistaAdjustSize( const AControls: array of TControl;  AOffset: Integer = 4 );
// procedure CheckVistaMove( const AControls: array of TControl; ADirection: Integer = 1 {1-left, 2-up}; AOffset: Integer = 4 );

{$REGION 'Grid methods' }
function IQColumnByName(ADBGrid: TUniDBGrid; const AName: string): TUniBaseDBGridColumn;
function IQAssignColumn(dbGrid: TDBGrid; const sFieldName, sTitle: string;
  Col: TColumn): TColumn;
procedure IQClearSelectedDateColumn(dbGrid: TDBGrid);
procedure ResizeGridToFit(AGrid: TCustomGrid);

//function WWColumnIndexByName(AWWDBGrid: TwwDBGrid;
//  const AFieldName: string): Integer;
//procedure EnsureWWColumnRemoved(AWWDBGrid: TwwDBGrid; const AFieldName: string);
//function EnsureWWColumnExists(AWWDBGrid: TwwDBGrid;
//  const AFieldName, ACaption: string; AWidth: Integer): Integer;
procedure SortDataGrid( Sender: TObject; AFieldName: string );
procedure HighlightSortColumnOnCalcTitleAttributes(Sender: TObject; AFieldName,
  ASortFieldName: string; AFont: TFont; ABrush: TBrush);
/// <summary> If a TwwDBGrid has Multiselect enabled, the highlighted row
/// may appear discolored.  This method checks both for highlighting and
/// the selected row, and will ensure the expected color is applied.  This
/// method should be called at the beginning of OnCalcCellColors in the
/// same place where "if Highlight then" is usually checked.
/// </summary>
function CheckHighlighted(Sender: TObject; Highlight: Boolean;
 AFont: TFont; ABrush: TBrush): Boolean;

/// <summary>  Modify a TwwDBGrid column DisplayLabel property.
/// </summary>
//procedure AssignWWColumnTitle( AGrid: TwwDBGrid; AFieldName, ACaption: string );
/// <summary>  Update a column Display Label.  This method changes a line in
///  the TwwDBGrid Selected list.  Call ApplyUpdates afterwards to ensure
///  changes are displayed.
/// </summary>
//procedure AssignWWColumnTitleEx( AGrid: TwwDBGrid; AFieldName, ACaption: string );
//procedure AssignSelectedFromDataSet(AGrid: TwwDBGrid; ADataSet: TDataSet);
procedure CopyDBGridToClipboard( ADBGrid: TCustomGrid );
//function SelectedListToStringList( wwDBGrid: TwwDBGrid; AList: TStringList; AFieldName: string = 'ID'): Boolean;


/// <summary>  Divide one line of a TwwDBGrid Selected list into
/// separate parts.  If successful, the field name, field size and display
/// label values will be returned.
/// </summary>
function DecodeInfoPowerSelectedString(ASelectedValue: string;
  var AFieldName, AFieldSize, ADisplayLabel: string): Boolean;

/// <summary> Get the ItemIndex of a TwwDBGrid ControlType string
/// for a given field name.
/// </summary>
//function IndexOfInfoPowerControlType(AGrid: TwwDBGrid;
//  AFieldName: string): Integer;

/// <summary> Remove a ControlType string from a TwwDBGrid for a
/// given field name.
/// </summary>
//procedure RemoveInfoPowerControlType(AGrid: TwwDBGrid; AFieldName: string);

{$ENDREGION 'Grid methods' }

{$REGION 'Form methods' }
function FindFormByClassName(AName: string): TUniForm; overload;
function FindFormByClassType(AClass: TClass): TForm; overload;
function GetOwnerForm(const AComponent: TComponent): TUniForm;
function GetOwnerUniForm(const AComponent: TComponent): TUniForm;
function GetOwnerFormName(const AComponent: TComponent): string;
function GetOwnerFormClass(const AComponent: TComponent): TClass;
function OwnerFormClassIs(const AComponent: TComponent; AClass: TClass)
  : Boolean;
function GetOwnerFrame(const AComponent: TComponent): TFrame;
function GetOwnerUniFrame(const AComponent: TComponent): TUniFrame;
function TheOnlyVisibleForms(AForms: array of TForm): Boolean;
procedure EnforceMaximizedWindow(AForm: TForm; ABorderLess: Boolean = False);
procedure SetWindowMaximized(AForm: TForm);
procedure RestoreForm(AForm: TForm); // to be called in a form's OnClose event
procedure CenterForm(AForm: TForm; AOnOwner: Boolean = False);
procedure CenteredFormPos(AForm: TForm; AOnOwner: Boolean; var ALeft, ATop,
  AWidth, AHeight: Integer);
procedure CenteredUniFormPos(AForm: TUniForm; AOnOwner: Boolean; var ALeft, ATop,
  AWidth, AHeight: Integer);
procedure GetDefaultScreenSize(var AWidth, AHeight: Integer);
procedure GetDefaultDesktopSize(var AWidth, AHeight: Integer);
function GetMonitorIndex(const AForm: TForm): Integer;
function IsPrimaryMonitor(const AForm: TForm): Boolean;
// called in a form's OnCreate event, before IQRegFormRead()
procedure PostMessageToForm(AName: string; AMessageID: Integer;
  WParam: Integer = 0; LParam: Integer = 0); overload;
procedure PostMessageToForm(AClass: TClass; AMessageID: Integer;
  WParam: Integer = 0; LParam: Integer = 0); overload;
function GetActiveControlText(AForm: TForm): string;
// Force Window to the Foreground - Pass Handle of form you want to bring to front
procedure ForceForegroundWindow(hwnd: THandle);
function ForceForegroundWindowB(hwnd: THandle): Boolean;
procedure ForceForegroundWindowC(const AOwner: TForm;
  const AModalFormClass: array of string);
procedure ActivateFormByClassName(AClassName: string);
{$ENDREGION 'Form methods' }

{$REGION 'Page Control methods' }
/// <summary> Hides page control tabs. </summary>
procedure HideTabs(PageControl: TUniPageControl);
/// <summary> Shows all page control tabs. </summary>
procedure ShowTabs(PageControl: TUniPageControl);
/// <summary> Hides page control tabs and fits it to a panel. </summary>
procedure AdjustPageControlToParent(PageControl: TUniPageControl;
  AVertOffSet: Integer = 0; AHorizOffSet: Integer = 0);
/// <summary> Toggle table/form view. </summary>
procedure TogglePageControl(PageControl: TUniPageControl);
/// <summary> Visible page count. </summary>
function EnabledPageCount(PageControl: TUniPageControl): Integer;
/// <summary> Next visible page. </summary>
function NextEnabledPage(ATabSheet: TTabSheet): TTabSheet;
/// <summary> Prior visible page. </summary>
function PriorEnabledPage(ATabSheet: TTabSheet): TTabSheet;
/// <summary> Adjust the tab widths to match the tab captions so that
/// all tabs are the same width. </summary>
procedure AutoSizeTabWidths(PageControl: TUniPageControl);
{$ENDREGION 'Page Control methods' }

{$REGION 'Navigator bar (TDBNavigator)' }
procedure ResizeNavBar(ANav: TDBNavigator; AStandardWidth: Integer = 25);
procedure AutoSizeNavBar(ANav: TDBNavigator);
{$ENDREGION 'Navigator bar (TDBNavigator)' }

{$REGION 'Menu (TMainMenu) and Popup menus (TPopupMenu)' }
// Pops up a menu for a speedbutton
procedure PopupMenuFor(ASpeedButton: TSpeedButton;
  APopupMenu: TPopupMenu); overload;
procedure PopupMenuFor(ABitBtn: TBitBtn; APopupMenu: TPopupMenu); overload;

// Pops up a menu for a navigator bar button. Example:
//
// if Button = nbInsert then
// PopupMenuForNavButton(NavDetail, nbInsert, PInsertDetail);
procedure PopupMenuForNavButton(ANav: TDBNavigator; AButton: TNavigateBtn;
  APopupMenu: TPopupMenu);

//procedure PopupMenuFor(AButton: TwwComboButton; APopupMenu: TPopupMenu);
//  overload; // wwcombobutton.pas

procedure SortMenuOptions(AMenuItem: TMenuItem);
procedure BarBreakMenuOptions(AMenuItem: TMenuItem; ABreakCount: Integer);
procedure CheckAssignEmbeddedControlsPopupMenuOf(AParentControl: TWinControl);
{$ENDREGION 'Menu (TMainMenu) and Popup menus (TPopupMenu)' }

{$REGION 'Check Box (TCheckBox) methods' }

// Resizes checkboxes to ensure all caption text displays
procedure ResizeCheckBoxes(AForm: TUniForm; AOwner: TWinControl;
  AMaxWidth: Integer = 0);

/// <summary> Set width of check boxes on owner control to the maximum
/// text width. </summary>
procedure AutoSizeCheckBoxes(AOwner: TWinControl; AMaxWidth: Integer = 0);

procedure ResizeControl(AForm: TUniForm; AControl: TControl;
  AMaxWidth: Integer = 0);

// Returns integer version of a the boolean, for TFDQuery params
// 1=TRUE, 0=FALSE
function CheckboxValueInt(const ACheckBox: TCheckBox): Integer;

{$ENDREGION 'Check Box (TCheckBox) methods' }

{$REGION 'Check List methods' }

// Returns the number of checked items
function CheckedItems(ACheckListBox: TCheckListBox): Integer; overload;
function CheckedItems(AListView: TListView): Integer; overload;
procedure CreateListViewColumns(AListView: TListView;
  const ACaptions: array of string; const AAutoSizeColumns: array of Integer);

// Either checks or unchecks all items in the list
procedure CheckItems(const ACheckListBox: TCheckListBox;
  AChecked: Boolean); overload;
procedure CheckItems(const AListView: TListView; AChecked: Boolean); overload;

{$ENDREGION 'Check List methods' }

{$REGION 'List View (TListView) methods' }

// Move the selected listview item up or down
function LVMoveUp(const AListView: TListView): Boolean; // TRUE if successful
function LVMoveDown(const AListView: TListView): Boolean; // TRUE if successful
function MoveListViewItem(const AListView: TListView;
  const AFromIndex, AToIndex: Word): Boolean; // TRUE if successful

// Updates the header of a list view.  This compensates for a bug in the
// TListView, where the header bar in Report View does not repaint.
procedure UpdateListViewHeader(AListView: TListView);

// Resize column width to match text length
// AColumn = Column index, starting at 0
// AMinWidth = minimum column width
procedure AutoSizeListViewColumn(AListView: TListView;
  AColumn, AMinWidth: Integer);

{$ENDREGION 'List View (TListView) methods' }

{$REGION 'Tree View (TTreeView) methods' }
procedure ClearTreeView(ATreeView: TTreeView);
function TreeViewPromoteSelected(ATreeView: TTreeView): Boolean;
function TreeViewDemoteSelected(ATreeView: TTreeView): Boolean;
function TopMostParentNode(ASelected: TTreeNode): TTreeNode;
{$ENDREGION 'Tree View (TTreeView) methods' }

{$REGION 'Browser Button on InfoPower TwwDBGrid' }
{ After assigning a TwwDBLookupCombo control to a field in a TwwDBGrid,
  call PrepareDBPicklistButton in OnCreate.  Add DBPicklistButtonOnEnter
  to the TwwDBLookupCombo control's OnEnter event.  For browser dots,
  I have found that a caption of three periods and a font of
  Arial 8 Bold works well with the button size. }
// 1. Called by form's OnCreate event
procedure PrepareDBPicklistButton(ASpeedButton: TSpeedButton;
  AParentControl: TCustomEdit; AGrid: TCustomGrid); overload;
//procedure PrepareDBPicklistButton(ASpeedButton: TSpeedButton;
//  AParentControl: TCustomEdit; ADataInspector: TwwDataInspector); overload;
// 2. Called by the parent TwwDBLookupCombo control's OnEnter event
//procedure DBPicklistButtonOnEnter(ASpeedButton: TSpeedButton;
//  AParentControl: TCustomEdit); overload;
// 3. Optionally called by the parent TwwDBLookupCombo control's OnExit event.
// You don't really need to call this, but it is available.
procedure DBPicklistButtonOnExit(ASpeedButton: TSpeedButton);
{$ENDREGION 'Browser Button on InfoPower TwwDBGrid' }

{$REGION 'Combo box methods'}
// Populate display value in a TwwDBLookupCombo in the OnCloseUp event.
// (See full description of parameters at the procedure implementation below).
//procedure UpdateDBLookupComboDisplay(ComboBox: TwwDBLookupCombo;
//  LookupTable, FillTable: TDataSet; Modified: Boolean;
//  TargetIDField, LookupIDField, TargetDisplayField, LookupDisplayField: string);

procedure CheckClearWWDBComboDlg( Sender: TObject; var Key: Word; AField: TField );

procedure LoadMonthNamesComboBox(ComboBox: TComboBox);
procedure LoadDayNamesComboBox(ComboBox: TComboBox);

{$ENDREGION 'Combo box methods'}

{$REGION 'Status bar methods' }
function StatusBarPanelIndex(AStatusBar: TStatusBar; X: Integer): Integer;
procedure SetStatus(AStatusBar: TStatusBar; AText: string;
  APanel: Integer = - 1);overload; // pass -1 for simple text
procedure SetStatus(AStatusBar: TUniStatusBar; AText: string;
  APanel: Integer = - 1);overload; // pass -1 for simple text


procedure AutoSizeStatusBarPanel(AStatusBar: TStatusBar; APanel: Integer); overload;
procedure AutoSizeStatusBarPanel(AStatusBar: TStatusBar; const APanel: array of Integer); overload;
{$ENDREGION 'Status bar methods' }

{$REGION 'String List Methods' }
procedure ClearStringListOfObjects(var AList: TStringList);
procedure ClearStringsOfObjects(AList: TStrings);
procedure ClearListOfObjects(var AList: TList);
procedure ClearComboBoxOfObjects(AComboBox: TUnicustomcombobox);
//procedure ClearWwComboBoxOfObjects(AComboBox: TwwDBComboBox);
procedure ClearListViewOfObjects(AListView: TCustomListView);
procedure ClearListBoxOfObjects(AListBox: TListBox);
{$ENDREGION 'String List Methods' }

{$REGION 'TRichEdit classes'}

type
  TRichEditHelper = class helper for TRichEdit
  public
    ///<summary> How text is displayed depends on whether it is RTF or plain text. </summary>
    procedure LoadText(const AText: string);
    ///</summary> Returns the text as RichText markup. </summary>
    function GetRichTextMarkup: string;
    ///</summary> Sets the text using the provided RichText markup. </summary>
    procedure SetRichTextMarkup(const AText: string);
    ///<summary> Set cursor position to X and Y. </summary>
    procedure UpdateCursorPos(const X, Y: Integer);
  end;

type
  TRichEditEx = class(TRichEdit)
  private
    procedure CNNotify(var Msg: TWMNotify); message CN_NOTIFY;
  protected
    procedure CreateWnd; override;
  end;

{$ENDREGION 'TRichEdit classes'}

{$REGION 'TRichEdit Methods' }
procedure UpdateCursorPos(AEditor: TRichEdit; X, Y: Integer);
/// <summary> Get the rich text markup in a TRichEdit. </summary>
function GetRtfMarkup(ARichEdit: TRichEdit): string;
/// <summary> Set the markup text in a TRichEdit. </summary>
procedure SetRtfMarkup(ARichEdit: TRichEdit; ARtfMarkupText: string);

{$ENDREGION 'TRichEdit Methods' }

{$REGION 'TCustomEdit Methods' }
procedure SetPasswordCharBullet(AEdit: TCustomEdit);
{$ENDREGION 'TCustomEdit Methods' }

{$REGION 'Hyperlink controls' }
procedure FormatHyperlink(AControl: TControl);
procedure ExecuteHyperlink(AHyperLink: string); overload;
procedure ExecuteHyperlink(AControl: TControl); overload;
function ValidHyperlink(var AHyperLink: string): Boolean;
{$ENDREGION 'Hyperlink controls' }

{$REGION 'Data Inspector (TwwDataInspector) Methods' }
//procedure ExpandDataInspector(ADataInspector: TwwDataInspector;
//  AExpanded: Boolean);
//procedure DataInspectorAsText(ADataInspector: TwwDataInspector;
//  var AList: TStringList);
//function SaveDataInspectorToFile(ADataInspector: TwwDataInspector;
// ADefaultFileName: string; var AFileName: string): Boolean;
//procedure CopyDataInspectorToClipboard(ADataInspector: TwwDataInspector);
//
//procedure AsssignCustomControlToDataInspector(ADataInspector: TwwDataInspector;
//  ATagString: string; AComponent: TWinControl);
//procedure SetDataInspectorItemEnabled(ADataInspector: TwwDataInspector;
//  AFieldName: string; AEnabled: Boolean);
//procedure SetDataInspectorItemReadOnly(ADataInspector: TwwDataInspector;
//  AFieldName: string; AReadOnly: Boolean);
//procedure SetDataInspectorItemCaption(ADataInspector: TwwDataInspector;
//  AFieldName: string; ACaption: string);
//procedure SetDataInspectorItemVisible(ADataInspector: TwwDataInspector;
//  AFieldName: string; AVisible: Boolean);
//// If the selected item field is AFieldName, then the desired popup menu
//// will be used; otherwise, the default popup menu will be assigned.
//procedure SetDataInspectorPopupMenuForField(ADataInspector: TwwDataInspector;
//  AFieldName: string; APopupMenu, ADefaultPopupMenu: TPopupMenu);
{$ENDREGION 'Data Inspector (TwwDataInspector) Methods' }

{$REGION 'Date/Time Picker Methods' }
// Call AdjustDateTimePicker() inside the OnDropDown event of the
// TwwDBDateTimePicker control.
// Example:
// procedure TForm1.DoTimePickerDropDown(Sender: TObject);
// begin
// if (Sender is TwwDBDateTimePicker) then
// IQMS.Common.Controls.AdjustDateTimePicker(TwwDBDateTimePicker(Sender));
// end;
//procedure AdjustDateTimePicker(ADateTimePicker: TwwDBDateTimePicker);
//procedure AdjustMonthCalendar(AMonthCalendar: TwwDBMonthCalendar);
{$ENDREGION 'Date/Time Picker Methods' }

// *** Color ***
function GetReadableFontColorOnTopOf(ARGBColor: LongInt): TColor;

{$REGION 'XP Manager Compensation' }
procedure IQSetParentBackground(const APanels: array of TUniPanel;
  AValue: Boolean);

procedure SetMainFormCaption(const AForm: TForm; const ABaseCaption: string);

procedure FitGridColumnsToText(AGrid: TCustomGrid);

procedure RefreshComponents(const AObjects: array of TWinControl;
  AOffset: Integer; SR: TIQWebSecurityRegister);
procedure RefreshComponentsEx(const AObjects: array of TWinControl;
  SR: TIQWebSecurityRegister);
{$ENDREGION 'XP Manager Compensation' }

procedure CreateLegendOn(AParent: TWinControl; AValues: array of Variant);

{$REGION 'Sliding panels' }
// Slide a panel vertically so that the height equals the
// target height.  For best results, set DoubleBuffered = True
// on your panel.
// The slide speed is determined by the rate, but also by the controls
// and any other painting that the panel may require.  For instance,
// if you have an OnPaint event assigned, speed will also be affected.
// The best rates are 3, 10, and 20.
procedure SlidePanelVertically(const APanel: TCustomPanel;
  const ATargetHeight: Integer; const ARate: Byte = 3);
procedure SlidePanelHorizontally(const APanel: TCustomPanel;
  const ATargetWidth: Integer; const ARate: Byte = 3);
{$ENDREGION 'Sliding panels' }

{$REGION 'Customization of wwFilterDialog' }
//procedure AlignClientWWFilterDialogCriteria( Dialog: TwwFilterDlg );
{$ENDREGION 'Customization of wwFilterDialog'  }

{$REGION 'Common dialogs'}
/// <summary> Get the index of a file extension within the filter list
///  of a common dialog box (e.g., TOpenDialog, TSaveDialog)
/// </summary>
function DialogFilterIndexOf(const AOpenDialog: TOpenDialog; const AExtension: string): Integer; overload;
function DialogFilterIndexOf(const ASaveDialog: TSaveDialog; const AExtension: string): Integer; overload;
{$ENDREGION 'Common dialogs'}

type
  TGridObj = class(TCustomGrid);

implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
//  EMailUtils,
//  iqformfocus,
//  iqmisc,
//  IQRgstry,
//  iqsearch,
//  iqsecman,
//  iqsysinfo,
//  IQUDRecView,
//  mcshare,
//  PanelMsg,
//  wwStr,
  System.DateUtils,
  System.Variants,
  Vcl.Clipbrd,
  Winapi.ShellApi;

procedure IQEnableControl(AComponent: TComponent; AValue: Boolean);
begin
  // NOTE:  Unfortuanately, the classes TControl or even TCustomEdit do
  // not allow writing to the Color property.  So, we need to take
  // the long way and reference each class by name.
  // ***  Set basic enable/disable *** //
  if (AComponent is TControl) then
    TControl(AComponent).Enabled := AValue
  else if (AComponent is TMenuItem) then
    TMenuItem(AComponent).Enabled := AValue;
  // *** Modify display *** //
  // TEdit
//  if AComponent is TEdit then
//    with AComponent as TEdit do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TMaskEdit
//  else if AComponent is TMaskEdit then
//    with AComponent as TMaskEdit do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDBEdit
//  else if AComponent is TDBEdit then
//    with AComponent as TDBEdit do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBEdit
//  else if AComponent is TwwDBEdit then
//    with AComponent as TwwDBEdit do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TComboBox
//  else if AComponent is TComboBox then
//    with AComponent as TComboBox do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDBComboBox
//  else if AComponent is TDBComboBox then
//    with AComponent as TDBComboBox do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBComboBox
//  else if AComponent is TwwDBComboBox then
//    with AComponent as TwwDBComboBox do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDBLookupComboBox
//  else if AComponent is TDBLookupComboBox then
//    with AComponent as TDBLookupComboBox do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBLookupCombo
//  else if AComponent is TwwDBLookupCombo then
//    with AComponent as TwwDBLookupCombo do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBComboDlg
//  else if AComponent is TwwDBComboDlg then
//    with AComponent as TwwDBComboDlg do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDBLookupComboBox
//  else if AComponent is TDBLookupComboBox then
//    with AComponent as TDBLookupComboBox do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBLookupComboDlg
//  else if AComponent is TwwDBLookupComboDlg then
//    with AComponent as TwwDBLookupComboDlg do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBGrid
//  else if AComponent is TwwDBGrid then
//    with AComponent as TwwDBGrid do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDBGrid
//  else if AComponent is TDBGrid then
//    with AComponent as TDBGrid do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDateTimePicker
//  else if AComponent is TDateTimePicker then
//    with AComponent as TDateTimePicker do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBDateTimePicker
//  else if AComponent is TwwDBDateTimePicker then
//    with AComponent as TwwDBDateTimePicker do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TMemo
//  else if AComponent is TMemo then
//    with AComponent as TMemo do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDBMemo
//  else if AComponent is TDBMemo then
//    with AComponent as TDBMemo do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TRichEdit
//  else if AComponent is TRichEdit then
//    with AComponent as TRichEdit do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TDBRichEdit
//  else if AComponent is TDBRichEdit then
//    with AComponent as TDBRichEdit do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TwwDBRichEdit
//  else if AComponent is TwwDBRichEdit then
//    with AComponent as TwwDBRichEdit do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TCheckListBox
//  else if AComponent is TCheckListBox then
//    with AComponent as TCheckListBox do
//      Color := cIIf(AValue, clWindow, clBtnFace)
//      // TIQSearch
//  else if AComponent is TIQSearch then
//    with AComponent as TIQSearch do
//      begin
//        wwIncSearch.Color := cIIf(AValue, clWindow, clBtnFace);
//        Wwdbgrid.Color := cIIf(AValue, clWindow, clBtnFace);
//      end;
end;

procedure IQEnableControl(const AComponents: array of TComponent;
  AValue: Boolean);
var
  i: Integer;
begin
  for i := 0 to high(AComponents) do
    IQEnableControl(AComponents[i], AValue);
end;

procedure IQEnableControl(const AComponents: array of TComponent;
  AValue: Boolean; ASecurityRegister: TIQWebSecurityRegister);
var
  i: Integer;
  AEnabled: Boolean;
begin
  for i := 0 to high(AComponents) do
    begin
      AEnabled := AValue;
      if Assigned(ASecurityRegister) and
        not ASecurityRegister.Enabled[AComponents[i].Name] then
        AEnabled := False;
      IQEnableControl(AComponents[i], AEnabled);
    end;
end;

procedure IQShowControl(AComponent: TComponent; AValue: Boolean); overload;
begin
  if (AComponent is TControl) then
    TControl(AComponent).Visible := AValue
  else if (AComponent is TMenuItem) then
    TMenuItem(AComponent).Visible := AValue;
end;

procedure IQShowControl(const AComponents: array of TComponent;
  AValue: Boolean);
var
  i: Integer;
begin
  for i := 0 to high(AComponents) do
    IQShowControl(AComponents[i], AValue);
end;

procedure IQShowControl(const AComponents: array of TComponent;
  AValue: Boolean; ASecurityRegister: TIQWebSecurityRegister); overload;
var
  i: Integer;
  AEnabled: Boolean;
begin
  for i := 0 to high(AComponents) do
    begin
      AEnabled := AValue;
      if Assigned(ASecurityRegister) and
        not ASecurityRegister.Enabled[AComponents[i].Name] then
        AEnabled := False;
      IQShowControl(AComponents[i], AEnabled);
    end;
end;

procedure IQReadOnlyControl(AComponent: TComponent; AValue: Boolean);
var
  AColor: TColor;
  AEnabled: Boolean;
begin
  // NOTE:  Unfortuanately, the classes TControl or even TCustomEdit do
  // not allow writing to the Color property.  So, we need to take
  // the long way and reference each class by name.
//  AColor := cIIf(AValue, clBtnFace, clWindow);
//  AEnabled := not AValue;
//  // ***  Set basic enable/disable *** //
//  if (AComponent is TButton) then
//    TButton(AComponent).Enabled := not AValue
//  else if (AComponent is TSpeedButton) then
//    TSpeedButton(AComponent).Enabled := not AValue
//  else if (AComponent is TMenuItem) then
//    TMenuItem(AComponent).Enabled := not AValue
//  else if (AComponent is TCustomEdit) then
//    TCustomEdit(AComponent).ReadOnly := AValue;
//  // *** Modify display *** //
//  // TEdit
//  if AComponent is TEdit then
//    with AComponent as TEdit do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TMaskEdit
//  else if AComponent is TMaskEdit then
//    with AComponent as TMaskEdit do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TDBEdit
//  else if AComponent is TDBEdit then
//    with AComponent as TDBEdit do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TwwDBEdit
//  else if AComponent is TwwDBEdit then
//    with AComponent as TwwDBEdit do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TComboBox
//  else if AComponent is TComboBox then
//    with AComponent as TComboBox do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//      end
//    // TDBComboBox
//  else if AComponent is TDBComboBox then
//    with AComponent as TDBComboBox do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//      end
//    // TwwDBComboBox
//  else if AComponent is TwwDBComboBox then
//    with AComponent as TwwDBComboBox do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//        ShowButton := not AValue;
//      end
//    // TDBLookupComboBox
//  else if AComponent is TDBLookupComboBox then
//    with AComponent as TDBLookupComboBox do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//      end
//    // TwwDBLookupCombo
//  else if AComponent is TwwDBLookupCombo then
//    with AComponent as TwwDBLookupCombo do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//        ShowButton := not AValue;
//      end
//    // TwwDBComboDlg
//  else if AComponent is TwwDBComboDlg then
//    with AComponent as TwwDBComboDlg do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//        ShowButton := not AValue;
//      end
//    // TDBLookupComboBox
//  else if AComponent is TDBLookupComboBox then
//    with AComponent as TDBLookupComboBox do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//      end
//    // TwwDBLookupComboDlg
//  else if AComponent is TwwDBLookupComboDlg then
//    with AComponent as TwwDBLookupComboDlg do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//        ShowButton := not AValue;
//      end
//    // TwwDBGrid
//  else if AComponent is TwwDBGrid then
//    with AComponent as TwwDBGrid do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TDBGrid
//  else if AComponent is TDBGrid then
//    with AComponent as TDBGrid do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TDateTimePicker
//  else if AComponent is TDateTimePicker then
//    with AComponent as TDateTimePicker do
//      begin
//        Enabled := AEnabled;
//        Color := AColor;
//      end
//    // TwwDBDateTimePicker
//  else if AComponent is TwwDBDateTimePicker then
//    with AComponent as TwwDBDateTimePicker do
//      begin
//        readonly := AValue;
//        Color := AColor;
//        ShowButton := not AValue;
//      end
//    // TMemo
//  else if AComponent is TMemo then
//    with AComponent as TMemo do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TDBMemo
//  else if AComponent is TDBMemo then
//    with AComponent as TDBMemo do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TRichEdit
//  else if AComponent is TRichEdit then
//    with AComponent as TRichEdit do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TDBRichEdit
//  else if AComponent is TDBRichEdit then
//    with AComponent as TDBRichEdit do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TwwDBRichEdit
//  else if AComponent is TwwDBRichEdit then
//    with AComponent as TwwDBRichEdit do
//      begin
//        readonly := AValue;
//        Color := AColor;
//      end
//    // TCheckListBox
//  else if AComponent is TCheckListBox then
//    with AComponent as TCheckListBox do
//      begin
//        Enabled := not AValue;
//        Color := AColor;
//      end
//    // TIQSearch
//  else if AComponent is TIQSearch then
//    with AComponent as TIQSearch do
//      begin
//        wwIncSearch.Color := AColor;
//        Wwdbgrid.Color := AColor;
//        Wwdbgrid.ReadOnly := AValue;
//      end
//    // TIQUDRecView
//  else if AComponent is TIQUDRecView then
//    with AComponent as TIQUDRecView do
//      begin
//        readonly := AValue;
//      end;
end;

procedure IQReadOnlyControl(const AComponents: array of TComponent;
  AValue: Boolean);
var
  i: Integer;
begin
  for i := 0 to high(AComponents) do
    IQReadOnlyControl(AComponents[i], AValue);
end;

procedure IQReadOnlyControl(const AComponents: array of TComponent;
  AValue: Boolean; ASecurityRegister: TIQWebSecurityRegister);
var
  i: Integer;
  AReadOnly: Boolean;
begin
  for i := 0 to high(AComponents) do
    begin
      AReadOnly := AValue;
      if not AValue and Assigned(ASecurityRegister) then
        AReadOnly := not ASecurityRegister.Enabled[AComponents[i].Name];
      IQReadOnlyControl(AComponents[i], AReadOnly);
    end;
end;

procedure IQHideControls(const AComponents: array of TComponent);
var
  i: Integer;
begin
  for i := 0 to High(AComponents) do
  if (AComponents[i] is TControl) then
    begin
      TControl(AComponents[i]).Visible := False;
      TControl(AComponents[i]).SendToBack;
    end;
end;

function IQColumnByName(ADBGrid: TUniDBGrid; const AName: string): TUniBaseDBGridColumn;
var
  i: Integer;
begin
  with ADBGrid do
    for i := 0 to Columns.Count - 1 do
      if CompareText(Columns[i].FieldName, AName) = 0 then
        begin
          Result := TUniDBGridColumn(Columns[i]);
          EXIT
        end;
  Result := nil;
end;

procedure ResizeGridToFit(AGrid: TCustomGrid);
var
  i, AWidth, ADispWidth, AColWidth: Integer;
  AvrgWidth: Real;
begin
//  if AGrid is TwwDBGrid then
//    with TwwDBGrid(AGrid) do
//      begin
//
//        if FieldCount = 0 then
//          EXIT;
//
//        ADispWidth := 0;
//        AColWidth := 0;
//        for i := 0 to FieldCount - 1 do
//          begin
//            ADispWidth := ADispWidth + Fields[i].DisplayWidth;
//            AColWidth := AColWidth + ColWidthsPixels[i + 1];
//          end;
//
//        if (AColWidth = 0) or (ADispWidth = 0) then
//          AvrgWidth := 100
//        else
//          AvrgWidth := ADispWidth / AColWidth;
//
//        AWidth := Trunc((ClientWidth - ColWidthsPixels[0] - FieldCount) /
//          FieldCount);
//        for i := 0 to FieldCount - 1 do
//          Fields[i].DisplayWidth := Trunc(AvrgWidth * AWidth);
//        AGrid.Refresh;
//      end
//  else if AGrid is TDBGrid then
//    with TDBGrid(AGrid) do
//      begin
//        if Columns.Count = 0 then
//          EXIT;
//
//        AWidth := Trunc((ClientWidth - 11 - Columns.Count) / Columns.Count);
//        for i := 0 to Columns.Count - 1 do
//          Columns[i].Width := AWidth;
//        AGrid.Refresh;
//      end;
end;

function FindFormByClassName(AName: string): TUniForm;
var
  i: Integer;
begin
  for i := UniSession.FormsList.Count -
    1 downto 0 do { Check to see if this thing is already running }
    if CompareText(TUniForm(UniSession.FormsList[i]).ClassName, AName) = 0 then
      begin
        Result := TUniForm(UniSession.FormsList[i]);
        EXIT;
      end;
  Result := nil;
end;

function FindFormByClassType(AClass: TClass): TForm;
var
  i: Integer;
begin
  for i := Screen.FormCount -
    1 downto 0 do { Check to see if this thing is already running }
    if Screen.Forms[i] is AClass then
      begin
        Result := Screen.Forms[i];
        EXIT;
      end;
  Result := nil;
end;

function GetOwnerForm(const AComponent: TComponent): TUniForm; overload;
const
  AMaxCount: Integer = 100;
var
  ACount: Integer; // count iterations
  AOwner: TComponent; // var assigned as next owner
begin
  Result := nil;
  if Assigned(AComponent) then
    begin
      // Initialize
      ACount := 0;
      AOwner := AComponent;
      repeat
         // Increment count
         Inc(ACount);
         // Get the next owner component
         AOwner := AOwner.Owner;
         // Check if the parent is a TForm; if so, return it as the result.
         // Note:  TFrames will register as TForms, but we do not want to
         // include TFrames in the results.
         if not (AOwner is TUniFrame) and (AOwner is TUniForm) then
            Result := TUniForm(AOwner);
      until (Result <> nil) or (AOwner = nil) or (ACount >= AMaxCount);
    end;
end;

function GetOwnerUniForm(const AComponent: TComponent): TUniForm;
const
  AMaxCount: Integer = 100;
var
  ACount: Integer; // count iterations
  AOwner: TComponent; // var assigned as next owner
begin
  Result := nil;
  if Assigned(AComponent) then
    begin
      // Initialize
      ACount := 0;
      AOwner := AComponent;
      repeat
         // Increment count
         Inc(ACount);
         // Get the next owner component
         AOwner := AOwner.Owner;
         // Check if the parent is a TForm; if so, return it as the result.
         // Note:  TFrames will register as TForms, but we do not want to
         // include TFrames in the results.
         if not (AOwner is TUniFrame) and (AOwner is TUniForm) then
            Result := TUniForm(AOwner);
      until (Result <> nil) or (AOwner = nil) or (ACount >= AMaxCount);
    end;
end;

function GetOwnerFormName(const AComponent: TComponent): string;
var
  AForm: TUniForm;
begin
  Result := '';
  if Assigned(AComponent) then
   begin
      AForm := GetOwnerForm(AComponent);
      if Assigned(AForm) then
        Result := AForm.Name;
   end;
end;

function GetOwnerFormClass(const AComponent: TComponent): TClass;
var
  AForm: TUniForm;
begin
  Result := nil;
  if Assigned(AComponent) then
   begin
      AForm := GetOwnerForm(AComponent);
      if Assigned(AForm) then
        Result := AForm.ClassType;
   end;
end;

function OwnerFormClassIs(const AComponent: TComponent; AClass: TClass)
  : Boolean;
var
  AForm: TUniForm;
begin
  Result := False;
  if Assigned(AComponent) then
   begin
      AForm := GetOwnerForm(AComponent);
      if Assigned(AForm) then
        Result := AForm.ClassType = AClass;
   end;
end;

function GetOwnerFrame(const AComponent: TComponent): TFrame;
const
  AMaxCount: Integer = 100;
var
  ACount: Integer; // count iterations
  AOwner: TComponent; // var assigned as next owner
begin
  Result := nil;
  if Assigned(AComponent) then
    begin
      // Initialize
      ACount := 0;
      AOwner := AComponent;
      repeat
         // Increment count
         Inc(ACount);
         // Get the next owner component
         AOwner := AOwner.Owner;
         // Check if the parent is a TForm; if so, return it as the result.
         // Note:  TFrames will register as TForms, but we do not want to
         // include TFrames in the results.
         if (AOwner is TFrame) and not (AOwner is TForm) then
            Result := TFrame(AOwner);
      until (Result <> nil) or (AOwner = nil) or (ACount >= AMaxCount);
    end;
end;

function GetOwnerUniFrame(const AComponent: TComponent): TUniFrame;
const
  AMaxCount: Integer = 100;
var
  ACount: Integer; // count iterations
  AOwner: TComponent; // var assigned as next owner
begin
  Result := nil;
  if Assigned(AComponent) then
    begin
      // Initialize
      ACount := 0;
      AOwner := AComponent;
      repeat
         // Increment count
         Inc(ACount);
         // Get the next owner component
         AOwner := AOwner.Owner;
         // Check if the parent is a TForm; if so, return it as the result.
         // Note:  TFrames will register as TForms, but we do not want to
         // include TFrames in the results.
         if (AOwner is TUniFrame) and not (AOwner is TUniForm) then
            Result := TUniFrame(AOwner);
      until (Result <> nil) or (AOwner = nil) or (ACount >= AMaxCount);
    end;
end;

procedure AdjustPageControlToParent(PageControl: TUniPageControl;
  AVertOffSet: Integer = 0; AHorizOffSet: Integer = 0);
begin
  (*
    Adjusts a page control to its parent TPanel.

    NOTE:  The parent of the page control must be a TPanel.
    If the parent is the Form itself, the TUniPageControl
    will not display.

    Calling this method results in a page control, whose tabs are visible
    at design time, being adjusted so that the tabs are invisible and
    the pagecontrol's edges is about 1 pixel from the parent's ClientWidth.
    You may provide extra offset values if you wish, but this should be
    unnecessary.

  *)

  if not Assigned(PageControl) then
    EXIT;

  HideTabs(PageControl); // see below

  with PageControl do
    begin
      Align := alNone;
      Anchors := [akLeft, akTop, akRight, akBottom];
      Left := - 4 - AHorizOffSet;
      Top := - 6 - AVertOffSet;
      Width := Parent.ClientWidth + 8 + AHorizOffSet;
      Height := Parent.ClientHeight + 10 + AVertOffSet;
    end;
  PageControl.ActivePageIndex := 0;
end;

procedure HideTabs(PageControl: TUniPageControl);
var
  i: Integer;
begin
  // Hides the tabs on a page control.
  // This method is used primarily by AdjustPageControlToParent().
  if Assigned(PageControl) then
    begin
      // 08/03/2015 Prevents EListError.
      PageControl.HandleNeeded;
      try
        for i := 0 to PageControl.PageCount - 1 do
          PageControl.Pages[i].TabVisible := False;
      except
        on E: Exception do
          if not (E is EListError) then
            raise;
      end;
    end;
end;

procedure ShowTabs(PageControl: TUniPageControl);
var
  i: Integer;
begin
  // Shows all tabs on a page control.
  if Assigned(PageControl) then
    try
      for i := 0 to PageControl.PageCount - 1 do
        PageControl.Pages[i].TabVisible := True;
    except
      on E: Exception do
        if not (E is EListError) then
          raise;
    end;
end;

procedure TogglePageControl(PageControl: TUniPageControl);
begin
  // Toggles or cycles the pages in a page control.
  // If there are only two pages for form and grid view, this
  // method "toggles" the pages.  Otherwise, if there are more
  // than two pages, this method will cycle all pages.
  if not Assigned(PageControl) then
    EXIT;
//  PageControl.ActivePage := PageControl.FindNextPage(PageControl.ActivePage,
//    True, False);
end;

function EnabledPageCount(PageControl: TUniPageControl): Integer;
var
  i: Integer;
begin
  Result := 0;
  if Assigned(PageControl) then
    begin
      for i := 0 to PageControl.PageCount - 1 do
       if PageControl.Pages[i].Enabled then
        Inc(Result);
    end;
end;

function NextEnabledPage(ATabSheet: TTabSheet): TTabSheet;
var
  PageControl: TPageControl;
  Index, i: Integer;
begin
  Result := ATabSheet;
  if Assigned(ATabSheet) then
    begin
      PageControl := ATabSheet.PageControl;
      Index := ATabSheet.PageIndex + 1;
      for i := Index to PageControl.PageCount - 1 do
       if PageControl.Pages[i].Enabled then
         begin
           Exit(PageControl.Pages[i]);
         end;
    end;
end;

function PriorEnabledPage(ATabSheet: TTabSheet): TTabSheet;
var
  PageControl: TPageControl;
  Index, i: Integer;
begin
  Result := ATabSheet;
  if Assigned(ATabSheet) then
    begin
      PageControl := ATabSheet.PageControl;
      Index := ATabSheet.PageIndex - 1;
      for i := Index downto 0 do
       if PageControl.Pages[i].Enabled then
         begin
           Exit(PageControl.Pages[i]);
         end;
    end;
end;

procedure AutoSizeTabWidths(PageControl: TUniPageControl);
var
  i, j, w, buf: Integer;
  s: string;

  function _getTextWidthPixels(const AText: string; AFont: TFont): Integer;
  var
    ABitmap: TBitmap;
  begin
    ABitmap := TBitmap.Create;
    try
      ABitmap.Canvas.Font := AFont;
      Result := ABitmap.Canvas.TextWidth(AText);
    finally
      ABitmap.Free;
    end;
  end;

begin
  w := 0;
  if Assigned(PageControl) then
    begin
//      for i := 0 to PageControl.PageCount - 1 do
//        begin
//          s := PageControl.Pages[i].Caption;
//          j := _getTextWidthPixels(s, PageControl.Font);
//          w := System.Math.MaxIntValue([w, j]);
//        end;

      // Initialize additiona tab with value
//      buf := 16;
//      // Increment the value if an image list is assigned
//      if Assigned(PageControl.Images) then
//        Inc(buf, PageControl.Images.Width + 8);
      // Increment the value if the font is bold
//      if (fsBold in PageControl.Font.Style) then
//        Inc(buf, 8); // 16 + 8 = 24
//      // Add the buffer to the final tab width
//      PageControl.TabWidth := w + buf;

//      if (fsBold in PageControl.Font.Style) then
//        PageControl.TabWidth := w + 24
//      else
//        PageControl.TabWidth := w + 16;
    end;
end;

function CheckedItems(ACheckListBox: TCheckListBox): Integer;
var
  i, ACnt: Integer; { counters }
begin
  { Returns the number of checked items in a checklist box.
    Example:
    if CheckedItems( lstFiles ) > 0 then //Are any selected
    begin                           //If so, begin the process
    ...
    end;
  }

  // Initialize counter variable
  ACnt := 0;
  // Cycle through the check list box items.
  // If an item is checked, then increment the counter, ACnt.
  for i := 0 to (ACheckListBox.Items.Count - 1) do
    begin
      if ACheckListBox.Checked[i] = True then
        Inc(ACnt, 1);
    end;
  // Return the number of checked items
  Result := ACnt;
end;

function CheckedItems(AListView: TListView): Integer; overload;
var
  i, ACnt: Integer; { counters }
begin
  { Returns the number of checked items in a TListView.
    Example:
    if CheckedItems( lstFiles ) > 0 then //Are any selected
    begin                           //If so, begin the process
    ...
    end;
  }

  // Initialize counter variable
  ACnt := 0;
  // Cycle through the check list box items.
  // If an item is checked, then increment the counter, ACnt.
  for i := 0 to (AListView.Items.Count - 1) do
    begin
      if AListView.Items[i].Checked = True then
        Inc(ACnt, 1);
    end;
  // Return the number of checked items
  Result := ACnt;
end;

procedure CheckItems(const ACheckListBox: TCheckListBox; AChecked: Boolean);
var
  i: Integer;
begin
  // Either checks or unchecks all items in the list
  with ACheckListBox do
    try
      Items.BeginUpdate;
      for i := 0 to Count - 1 do
        Checked[i] := AChecked;
    finally
      Items.EndUpdate;
    end;
end;

procedure CheckItems(const AListView: TListView; AChecked: Boolean);
var
  i: Integer;
begin
  // Either checks or unchecks all items in the list
  with AListView do
    try
      Items.BeginUpdate;
      for i := 0 to Items.Count - 1 do
        Items[i].Checked := AChecked;
    finally
      Items.EndUpdate;
    end;
end;

function LVMoveUp(const AListView: TListView): Boolean;
var
  ACurIndex, ANewIndex: Integer;
begin
  // In a TListView, moves select item up by one click
  if AListView.Selected = nil then
    EXIT;
  ACurIndex := AListView.Selected.Index;
  ANewIndex := ACurIndex - 1;
  if ANewIndex >= 0 then
    Result := MoveListViewItem(AListView, ACurIndex, ANewIndex);
end;

function LVMoveDown(const AListView: TListView): Boolean;
var
  ACurIndex, ANewIndex: Integer;
begin
  // In a TListView, moves select item down by one click
  if AListView.Selected = nil then
    EXIT;
  ACurIndex := AListView.Selected.Index;
  ANewIndex := ACurIndex + 1;
  if ANewIndex <= AListView.Items.Count then
    Result := MoveListViewItem(AListView, ACurIndex, ANewIndex + 1);
  // we add 1 to the new index
end;

function MoveListViewItem(const AListView: TListView;
  const AFromIndex, AToIndex: Word): Boolean;
var
  ASourceItem, ATargetItem: TListItem;
begin
  Result := False;
  with AListView do
    try
      Items.BeginUpdate;
      ASourceItem := Items[AFromIndex];
      ATargetItem := Items.Insert(AToIndex);
      ATargetItem.Assign(ASourceItem);
      if Assigned(ASourceItem) then
        ASourceItem.Free;

      // Set item focus
      Selected := ATargetItem;
      ItemFocused := ATargetItem;
      SetFocus;

      Result := True;
    finally
      Items.EndUpdate;
    end;
end;

procedure CreateListViewColumns(AListView: TListView;
  const ACaptions: array of string; const AAutoSizeColumns: array of Integer);
var
  i: Integer;

  function _autoSize(const index: Integer): Boolean;
  var
    j: Integer;
  begin
    Result := False;
    for j := low(AAutoSizeColumns) to high(AAutoSizeColumns) do
      if AAutoSizeColumns[j] = index then
        begin
          Result := True;
          Break;
        end;
  end;

begin
  if Assigned(AListView) then
    with AListView do
      begin
        Items.Clear;
        AListView.ViewStyle := vsReport;
        Columns.Clear;
        for i := 0 to high(ACaptions) do
          with Columns.Add do
            begin
              AutoSize := _autoSize(i);
              Caption := ACaptions[i];
              Width := 100;
            end;
      end;
end;

procedure PrepareDBPicklistButton(ASpeedButton: TSpeedButton;
  AParentControl: TCustomEdit; AGrid: TCustomGrid);
var
  APanel: TPanel;
  iWidth, iHeight: Integer;
begin
  // Validation
  if not Assigned(ASpeedButton) or
    not Assigned(AParentControl) or
    not Assigned(AGrid) then
    Exit;

  // Button width is based on the standard width of a scroll bar button
  iWidth := Max(GetSystemMetrics(SM_CXVSCROLL), 15);
  // Button height is based on the default row height of the grid.  This works
  // in most cases; not all.  In some cases, the value can be too large.
  iHeight := TStringGrid(AGrid).DefaultRowHeight;

  // 07/20/2009 Compensate for known issues
  if iHeight = 24 then
    iHeight := 17;

  // Create the panel that will be the parent of the speedbutton
  // Note: This panel is set to invisible after focus leaves the control.
  APanel := TPanel.Create(AParentControl);

  with APanel do
    begin
      Parent := AParentControl;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      BorderStyle := bsNone;
      Caption := '';
      ParentBackground := False;
      Tag := 1999;
      Color := clBtnFace;
      Height := iHeight;
      Width := iWidth;
      Top := 0;
      Left := (AParentControl.ClientWidth - (2 * iWidth));
      Anchors := [akTop, akRight];
      Visible := False;
    end;

  with ASpeedButton do
    begin
      Parent := APanel;
      Top := 0;
      Left := 1; // we create a border here
      Width := APanel.Width - 1;
      Height := APanel.Height;
      Tag := 1999;
      Flat := False;
      Transparent := False;
      Visible := True;
    end;
end;

//procedure PrepareDBPicklistButton(ASpeedButton: TSpeedButton;
//  AParentControl: TCustomEdit; ADataInspector: TwwDataInspector);
//var
//  APanel: TPanel;
//  iWidth, iHeight: Integer;
//begin
//  // Validation
//  if not Assigned(ASpeedButton) or
//    not Assigned(AParentControl) or
//    not Assigned(ADataInspector) then
//    Exit;
//
//  // Button width is based on the standard width of a scroll bar button
//  iWidth := Max(GetSystemMetrics(SM_CXVSCROLL), 15);
//  // Button height is based on the default row height of the grid.
//  iHeight := 15;
//  if ADataInspector.DefaultRowHeight > 16 then
//    iHeight := ADataInspector.DefaultRowHeight - 1;
//
//  // Create the panel that will be the parent of the speedbutton
//  // Note: This panel is set to invisible after focus leaves the control.
//  APanel := TPanel.Create(AParentControl);
//
//  with APanel do
//    begin
//      Parent := AParentControl;
//      BevelInner := bvNone;
//      BevelOuter := bvNone;
//      BorderStyle := bsNone;
//      Caption := '';
//      ParentBackground := False;
//      Tag := 1999;
//      Color := clBtnFace;
//      Height := iHeight;
//      Width := iWidth;
//      Top := 0;
//      Left := (AParentControl.ClientWidth - (2 * iWidth));
//      Anchors := [akTop, akRight];
//      Visible := False;
//    end;
//
//  with ASpeedButton do
//    begin
//      Parent := APanel;
//      Top := 0;
//      Left := 1; // we create a border here
//      Width := APanel.Width - 1;
//      Height := APanel.Height;
//      Tag := 1999;
//      Flat := False;
//      Transparent := False;
//      Visible := True;
//    end;
//end;

//procedure DBPicklistButtonOnEnter(ASpeedButton: TSpeedButton;
//  AParentControl: TCustomEdit);
//begin
//
//  if AParentControl = nil then
//    EXIT;
//
//  if AParentControl is TwwDBComboDlg then
//    TwwDBComboDlg(AParentControl).ShowButton := AParentControl.Enabled
//  else if AParentControl is TwwDBLookupComboDlg then
//    TwwDBLookupComboDlg(AParentControl).ShowButton := AParentControl.Enabled
//  else if AParentControl.ClassParent = TwwDBCustomCombo then // Vcl.Wwdotdot.pas
//    TwwDBLookupCombo(AParentControl).ShowButton := AParentControl.Enabled
//  else if AParentControl.ClassParent = TwwDBCustomLookupCombo then
//     wwDBLook.pas
//    TwwDBLookupCombo(AParentControl).ShowButton := AParentControl.Enabled;
//
//  if AParentControl.Enabled then
//    with TPanel(ASpeedButton.Parent) do
//      begin
//        Visible := True;
//        BringToFront;
//      end;
//end;

procedure DBPicklistButtonOnExit(ASpeedButton: TSpeedButton);
begin
  if ASpeedButton.Parent.ClassType = TPanel then
    TPanel(ASpeedButton.Parent).Visible := False;
end;

(* Purpose:  Populate display value in a TwwDBLookupCombo in the OnCloseUp event.
  The InfoPower combo box has a bug which can prevent the display
  value from appearing in the combo box control.  Instead, the
  lookup dataset's ID value will display.

  Parameters:
  A. OnCloseUp Event Parameter Values
  ---------------------------------
  ComboBox:            The combo box control itself.
  Pass TwwDBLookupCombo(Sender).
  LookupTable:         Pass the event's LookupTable parameter.
  FillTable:           Pass the event's FillTable parameter.
  Modified:            Pass the event's modified parameter.

  B. ID Fields
  ---------------------------------
  TargetIDField:       The "lookup" ID in main table; this is the field you
  wish to update.
  LookupIDField:       The field name in the lookup dataset containing
  desired value.
  C. Display Fields
  ---------------------------------
  TargetDisplayField:  The field in the main dataset that contains the
  human-readable display value.
  LookupDisplayField:  The field in the "lookup" dataset that contains the
  desired display value.

  Example:
  UpdateDBLookupComboDisplay(TwwDBLookupCombo(Sender), LookupTable,
  FillTable, modified, 'RETURN_CODE_ID' {TargetIDField},
  'ID' {LookupIDField}, 'RETURN_CODE' {TargetDisplayField},
  'CODE' {LookupDisplayField}); // in IQMS.Common.Controls.pas

*)
//procedure UpdateDBLookupComboDisplay(ComboBox: TwwDBLookupCombo;
//  LookupTable, FillTable: TDataSet; Modified: Boolean;
//  TargetIDField, LookupIDField, TargetDisplayField, LookupDisplayField: string);
//begin
//   This code compensates for an InfoPower bug, where the combo box will
//   sporadically display the ID value, and not the text value.
//   Validate the datasets.
//  if (LookupTable = nil) or (FillTable = nil) then
//    EXIT;
//   Validate the combo box control.
//  if not Assigned(ComboBox) then
//    EXIT;
//
//  if Modified then
//    try
//       Make sure the "FillTable" (DataSet that is being filled with
//       the lookup value) is in edit mode.
//      if not (FillTable.State in [dsEdit, dsInsert]) then
//        FillTable.Edit;
//
//       Apply the ID Value in the Lookup dataset, to the Fill Table
//      FillTable.FieldByName(TargetIDField).Value :=
//        LookupTable.FieldByName(LookupIDField).Value;
//
//       Apply the string value from the lookup dataset
//       to the Fill Table field that contains the display text
//      FillTable.FieldByName(TargetDisplayField).Value :=
//        LookupTable.FieldByName(LookupDisplayField).Value;
//
//       Finally, update the combo box display text
//      ComboBox.Text := LookupTable.FieldByName(LookupDisplayField).AsString;
//    except
//      on E: Exception do
//        raise Exception.CreateFmt('Could not change value:  %s', [E.Message]);
//    end;
//end;


procedure CheckClearWWDBComboDlg( Sender: TObject; var Key: Word; AField: TField );
begin
  if Key = VK_Delete then
  begin
    AField.DataSet.Edit;
    AField.Clear;
//    TwwDBComboDlg(Sender).Text:= '';
    Key:= 0;
  end;
end;

procedure LoadMonthNamesComboBox(ComboBox: TComboBox);
var
   i, x, AItemIndex: Integer;
begin
  if Assigned(ComboBox) then
    begin
      AItemIndex := -1;
      ComboBox.Items.BeginUpdate;
      try
         ComboBox.Items.Clear;
         for i := 1 to High(FormatSettings.LongMonthNames) do
          begin
            x := ComboBox.Items.Add(FormatSettings.LongMonthNames[i]);
            if (AItemIndex = -1) and (i = System.DateUtils.MonthOf(Date())) then
               AItemIndex := x;
          end;
          ComboBox.ItemIndex := AItemIndex;
      finally
         ComboBox.Items.EndUpdate;
      end;
    end;
end;

procedure LoadDayNamesComboBox(ComboBox: TComboBox);
var
   i, x, AItemIndex: Integer;
begin
  if Assigned(ComboBox) then
    begin
      AItemIndex := -1;
      ComboBox.Items.BeginUpdate;
      try
         ComboBox.Items.Clear;
         for i := 1 to High(FormatSettings.LongDayNames) do
          begin
            x := ComboBox.Items.Add(FormatSettings.LongDayNames[i]);
            if (AItemIndex = -1) and (i = System.DateUtils.DayOf(Date())) then
              AItemIndex := x;
          end;
         ComboBox.ItemIndex := AItemIndex;
      finally
         ComboBox.Items.EndUpdate;
      end;
    end;
end;

function StatusBarPanelIndex(AStatusBar: TStatusBar; X: Integer): Integer;
var
  AWidth: Integer;
  i: Integer;
  W: Integer;
begin
  AWidth := 0;
  with AStatusBar do
    for i := 0 to Panels.Count - 1 do
      begin
        if i < Panels.Count - 1 then
          W := Panels[i].Width
        else
          W := AStatusBar.Width - AWidth;
        AWidth := AWidth + W;
        if X <= AWidth then
          begin
            Result := i;
            EXIT;
          end;
      end;
  Result := - 1;
end;

procedure SetStatus(AStatusBar: TStatusBar; AText: string; APanel: Integer);
begin
  // Updates the status bar, by panel, with text

  // The control must exist
  if AStatusBar = nil then
    EXIT;
  // Set the panel text
  if APanel >= 0 then
    begin
      if (APanel > AStatusBar.Panels.Count - 1) then
        EXIT; // check index
      AStatusBar.Panels[APanel].Text := AText;
    end
    // For simple text, the index can be -1
  else
    AStatusBar.SimpleText := AText;
  // Update the bar, or the text will not display
  AStatusBar.Update;
end;

procedure SetStatus(AStatusBar: TUniStatusBar; AText: string;
  APanel: Integer = - 1);overload; // pass -1 for simple text
begin
   if AStatusBar = nil then
    EXIT;
  if APanel >= 0 then
    begin
      if (APanel > AStatusBar.Panels.Count - 1) then
        EXIT; // check index
      AStatusBar.Panels[APanel].Text := AText;
    end
  else
    AStatusBar.Panels[0].Text := AText;
  AStatusBar.Update;
end;

procedure AutoSizeStatusBarPanel(AStatusBar: TStatusBar; APanel: Integer);
var
  AText: string;
  ABitmap: TBitmap;
begin
  if Assigned(AStatusBar) and (AStatusBar.Panels.Count > 0) then
    begin
      AText := AStatusBar.Panels[APanel].Text;
      ABitmap := TBitmap.Create;
      try
        ABitmap.Canvas.Font := AStatusBar.Font;
        AStatusBar.Panels[APanel].Width := ABitmap.Canvas.TextWidth(AText) + 10;
      finally
        ABitmap.Free;
      end;
    end;
end;

procedure AutoSizeStatusBarPanel(AStatusBar: TStatusBar; const APanel: array of Integer);
var
  i: Integer;
begin
 for i := Low(APanel) to High(APanel) do
   AutoSizeStatusBarPanel(AStatusBar, APanel[i]);
end;

function TheOnlyVisibleForms(AForms: array of TForm): Boolean;
var
  i, j: Integer;
begin
  Result := False;
  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].Visible then
      begin
        Result := False;
        for j := 0 to high(AForms) do
          if AForms[j].Visible and
            (CompareText(Screen.Forms[i].ClassName, AForms[j].ClassName)
            = 0) then
            begin
              Result := True;
              Break;
            end;
        if not Result then
          EXIT;
      end;
end;

procedure EnforceMaximizedWindow(AForm: TForm; ABorderLess: Boolean = False);
// ---------------------------------------------------------------------------
  procedure _ModifySysMenu;
  var
    hMenu: THandle;
  begin
    hMenu := Winapi.Windows.GetSystemMenu(AForm.Handle, False);
    Winapi.Windows.DeleteMenu(hMenu, Winapi.Windows.SC_MAXIMIZE, Winapi.Windows.MF_BYCOMMAND);
    Winapi.Windows.DeleteMenu(hMenu, Winapi.Windows.SC_MINIMIZE, Winapi.Windows.MF_BYCOMMAND);
    Winapi.Windows.DeleteMenu(hMenu, Winapi.Windows.SC_RESTORE, Winapi.Windows.MF_BYCOMMAND);
    Winapi.Windows.DeleteMenu(hMenu, Winapi.Windows.SC_MOVE, Winapi.Windows.MF_BYCOMMAND);
    Winapi.Windows.DeleteMenu(hMenu, Winapi.Windows.SC_SIZE, Winapi.Windows.MF_BYCOMMAND);

    // This will remove the divider line if called only once.  But if this
    // is called repeatedly, then even the Close menu will be removed.
    // Winapi.Windows.DeleteMenu( hMenu, 0, Winapi.Windows.MF_BYPOSITION ); {Divider line}
  end;

// ---------------------------------------------------------------------------
var
  AScreenHeight, AScreenWidth, i: Integer;
  AOnResize: TNotifyEvent;
begin
  if Assigned(AForm) then
    with AForm do
      try
        // Prevent OnResize event to execute this method repeatedly
        AOnResize := AForm.OnResize;
        AForm.OnResize := nil;
        if (Screen.MonitorCount > 1) then
          begin
            // Get the screen size for the primary monitor
            for i := 0 to Screen.MonitorCount - 1 do
              if Screen.Monitors[i].Primary then
                begin
                  // To get the "desktop" area of this monitor, access the
                  // WorkareaRect.  The Height and Width values are the
                  // screen area.  We use the WorkareaRect so that we
                  // center this form within the desktop.
                  AScreenHeight := Screen.Monitors[i].WorkareaRect.Bottom;
                  AScreenWidth := Screen.Monitors[i].WorkareaRect.Right;
                  Break;
                end;
          end
        else begin
            // This is not a dual-monitor system; just use the desktop.
            AScreenHeight := Screen.DesktopHeight;
            AScreenWidth := Screen.DesktopWidth;
          end;

        // This should not happen, but if it does, exit early.
        if (AScreenHeight = 0) or (AScreenWidth = 0) then
          Exit;


        // Remove border? This is ideal for touch-screens
        if ABorderLess then
          BorderStyle := bsNone;

        // Modify the system menu, accessible by clicking form icon (top left
        // corner).  This prevents user from using them to restore or minimize
        // the form.
        _ModifySysMenu;

        // set the Window State to maximized first before setting size
        if WindowState <> wsMaximized then
          WindowState := wsMaximized;

        // Now, ensure the form is positioned correctly
        Top := 0;
        Left := 0;
        Height := AScreenHeight;
        Width := AScreenWidth;

      finally
        AForm.OnResize := AOnResize;
      end;
end;

procedure SetWindowMaximized(AForm: TForm);
var
  //AScreenHeight, AScreenWidth,
  i: Integer;
  AOnResize: TNotifyEvent;
begin
  // Initialize
//  AScreenHeight := 0;
//  AScreenWidth  := 0;
  if Assigned(AForm) then
    try
      // Prevent OnResize event to execute this method repeatedly
      AOnResize := AForm.OnResize;
      AForm.OnResize := nil;

      // set the Window State to maximized first before setting size
      if AForm.WindowState <> wsMaximized then
        AForm.WindowState := wsMaximized;

      if (Screen.MonitorCount > 1) then
        begin
          // Get the screen size for the primary monitor
          for i := 0 to Screen.MonitorCount - 1 do
            if Screen.Monitors[i].Primary then
              begin
                // To get the "desktop" area of this monitor, access the
                // WorkareaRect.  The Height and Width values are the
                // screen area.  We use the WorkareaRect so that we do
                // not overlap the task bar.
                //AScreenHeight := Screen.Monitors[i].WorkareaRect.Bottom;
                //AScreenWidth := Screen.Monitors[i].WorkareaRect.Right;
                with Screen.Monitors[i].WorkareaRect do
                   AForm.SetBounds(Left, Top, Right - Left, Bottom - Top);
                Break;
              end;
        end
      else
       begin
          //AScreenHeight := Screen.WorkAreaRect.Bottom;
          //AScreenWidth := Screen.WorkAreaRect.Right;
          // This is not a dual-monitor system; just use the desktop.
          //AScreenHeight := Screen.DesktopHeight;
          //AScreenWidth := Screen.DesktopWidth;
          with Screen.WorkAreaRect do
             AForm.SetBounds(Left, Top, Right - Left, Bottom - Top);
        end;

      // This should not happen, but if it does, exit early.
      //if (AScreenHeight = 0) or (AScreenWidth = 0) then
      //  Exit;

      // set the Window State to maximized first before setting size
//      if AForm.WindowState <> wsMaximized then
//        AForm.WindowState := wsMaximized;

      // Now, ensure the form is positioned correctly
//      AForm.Top := 0;
//      AForm.Left := 0;
//      AForm.Height := AScreenHeight;
//      AForm.Width := AScreenWidth;
    finally
      AForm.OnResize := AOnResize;
    end;
end;

procedure GetDefaultScreenSize(var AWidth, AHeight: Integer);
var
  i: Integer;
begin
  // Initialize defaults.
  // These would apply if not a dual-monitor system.
  AHeight := Screen.Height;
  AWidth := Screen.Width;
  // Now, if this is dual monitor system, get the correct values.
  if (Screen.MonitorCount > 1) then
    begin
      // Get the screen size for the primary monitor
      for i := 0 to Screen.MonitorCount - 1 do
        if Screen.Monitors[i].Primary then
          begin
            // Screen height and width
            AHeight := Screen.Monitors[i].Height;
            AWidth := Screen.Monitors[i].Width;
            Break;
          end;
    end;
end;

procedure GetDefaultDesktopSize(var AWidth, AHeight: Integer);
var
  i: Integer;
  hTaskbar: HWND;
  ATaskBarRect: TRect;
begin
  // Initialize defaults.
  // These would apply if not a dual-monitor system.
  AHeight := Screen.DesktopHeight;
  AWidth := Screen.DesktopWidth;
  if (Screen.MonitorCount = 1) then
    begin
      AHeight := Screen.Monitors[0].WorkareaRect.Bottom;
      AWidth := Screen.Monitors[0].WorkareaRect.Right;
    end
  // Now, if this is dual monitor system, get the correct values.
  else if (Screen.MonitorCount > 1) then
    begin
      // Get the screen size for the primary monitor
      for i := 0 to Screen.MonitorCount - 1 do
        if Screen.Monitors[i].Primary then
          begin
            // To get the "desktop" area of this monitor, access the
            // WorkareaRect.  The Height and Width values are the
            // screen area.  We use the WorkareaRect so that we
            // center this form within the desktop.
            AHeight := Screen.Monitors[i].WorkareaRect.Bottom;
            AWidth := Screen.Monitors[i].WorkareaRect.Right;
            Break;
          end;
    end
  else
    begin
      AHeight := Screen.DesktopHeight;
      AWidth := Screen.DesktopWidth;
      hTaskbar := FindWindow('Shell_TrayWnd', nil);
      if hTaskbar <> 0 then
        begin
          GetWindowRect(hTaskbar, ATaskBarRect);
          if (ATaskBarRect.Right = AWidth) then
            AHeight := AHeight -  (ATaskBarRect.Bottom - ATaskBarRect.Top)
          else if (ATaskBarRect.Bottom = AHeight) then
            AWidth := AWidth -  (ATaskBarRect.Right - ATaskBarRect.Left);
        end;
    end;
end;

function GetMonitorIndex(const AForm: TForm): Integer;
begin
  Result := - 1;
  if Assigned(AForm) then
    Result := Screen.MonitorFromPoint(AForm.ClientToScreen(Point(0, 0)))
      .MonitorNum;
end;

function IsPrimaryMonitor(const AForm: TForm): Boolean;
begin
  Result := False;
  if Assigned(AForm) then
    Result := Screen.MonitorFromPoint(AForm.ClientToScreen(Point(0, 0)))
      .Primary;
end;

procedure CenteredFormPos(AForm: TForm; AOnOwner: Boolean; var ALeft, ATop,
  AWidth, AHeight: Integer);
var
  AScreenHeight, AScreenWidth, i: Integer;
  ANewTop, ANewLeft: Integer;
  AOwnerForm: TUniForm;
begin
  // Initialize
  ALeft := 0;
  ATop := 0;
  AWidth := 0;
  AHeight := 0;
  AOwnerForm := nil;
  ANewTop := 0;
  ANewLeft := 0;
  AScreenHeight := 0;
  AScreenWidth := 0;

  // Validate
  if not Assigned(AForm) then
    EXIT;

  // Default returned values
  ATop := AForm.Top;
  ALeft := AForm.Left;
  AWidth := AForm.Width;
  AHeight := AForm.Height;

  // Get the owner form
  if AOnOwner then
    AOwnerForm := GetOwnerForm(AForm);

  // Get the desktop size
  GetDefaultDesktopSize(AScreenWidth, AScreenHeight);

  // This should not happen, but if it does, exit early.
  if (AScreenHeight = 0) or (AScreenWidth = 0) then
    Exit;

  // Ensure the form will display inside the desktop
  if AForm.Width > AScreenWidth then
    AWidth := AScreenWidth;
  if AForm.Height > AScreenHeight then
    AHeight := AScreenHeight;

  // Center on the owner form
  // Note:  If the owner form is not visible, then do not bother centering.
  if AOnOwner and Assigned(AOwnerForm) and AOwnerForm.Visible then
    begin
      // This will center the child form perfectly in the center of
      // the owner form.
      ANewTop := AOwnerForm.Top + ((AOwnerForm.Height - AForm.Height) div 2);
      ANewLeft := AOwnerForm.Left + ((AOwnerForm.Width - AForm.Width) div 2);
    end
  else begin
      // Center in desktop
      ANewTop := (AScreenHeight - AForm.Height) div 2;
      ANewLeft := (AScreenWidth - AForm.Width) div 2;
    end;

  // If this is a really big form, then center it in the desktop.
  if ((ANewTop + AForm.Height) > AScreenHeight) then
    ANewTop := (AScreenHeight - AForm.Height) div 2;
  if ((ANewLeft + AForm.Width) > AScreenWidth) then
    ANewLeft := (AScreenWidth - AForm.Width) div 2;

  if ANewTop < 0 then
    ANewTop := 0;
  if ANewLeft < 0 then
    ANewLeft := 0;

  ATop := ANewTop;
  ALeft := ANewLeft;
end;

procedure CenteredUniFormPos(AForm: TUniForm; AOnOwner: Boolean; var ALeft, ATop,
  AWidth, AHeight: Integer);
var
  AScreenHeight, AScreenWidth, i: Integer;
  ANewTop, ANewLeft: Integer;
  AOwnerForm: TUniForm;
begin
  // Initialize
  ALeft := 0;
  ATop := 0;
  AWidth := 0;
  AHeight := 0;
  AOwnerForm := nil;
  ANewTop := 0;
  ANewLeft := 0;
  AScreenHeight := 0;
  AScreenWidth := 0;

  // Validate
  if not Assigned(AForm) then
    EXIT;

  // Default returned values
  ATop := AForm.Top;
  ALeft := AForm.Left;
  AWidth := AForm.Width;
  AHeight := AForm.Height;

  // Get the owner form
  if AOnOwner then
    AOwnerForm := GetOwnerUniForm(AForm);

  // Get the desktop size
  GetDefaultDesktopSize(AScreenWidth, AScreenHeight);

  // This should not happen, but if it does, exit early.
  if (AScreenHeight = 0) or (AScreenWidth = 0) then
    Exit;

  // Ensure the form will display inside the desktop
  if AForm.Width > AScreenWidth then
    AWidth := AScreenWidth;
  if AForm.Height > AScreenHeight then
    AHeight := AScreenHeight;

  // Center on the owner form
  // Note:  If the owner form is not visible, then do not bother centering.
  if AOnOwner and Assigned(AOwnerForm) and AOwnerForm.Visible then
    begin
      // This will center the child form perfectly in the center of
      // the owner form.
      ANewTop := AOwnerForm.Top + ((AOwnerForm.Height - AForm.Height) div 2);
      ANewLeft := AOwnerForm.Left + ((AOwnerForm.Width - AForm.Width) div 2);
    end
  else begin
      // Center in desktop
      ANewTop := (AScreenHeight - AForm.Height) div 2;
      ANewLeft := (AScreenWidth - AForm.Width) div 2;
    end;

  // If this is a really big form, then center it in the desktop.
  if ((ANewTop + AForm.Height) > AScreenHeight) then
    ANewTop := (AScreenHeight - AForm.Height) div 2;
  if ((ANewLeft + AForm.Width) > AScreenWidth) then
    ANewLeft := (AScreenWidth - AForm.Width) div 2;

  if ANewTop < 0 then
    ANewTop := 0;
  if ANewLeft < 0 then
    ANewLeft := 0;

  ATop := ANewTop;
  ALeft := ANewLeft;
end;

procedure CenterForm(AForm: TForm; AOnOwner: Boolean);
var
  ALeft, ATop, AWidth, AHeight: Integer;
begin
  if not Assigned(AForm) then
    Exit;

  // Get the centered position (see above)
  CenteredFormPos(AForm, AOnOwner, {var} ALeft, ATop, AWidth, AHeight);

  // Apply form position
  AForm.Left := ALeft;
  AForm.Top := ATop;
  AForm.Width := AWidth;
  AForm.Height := AHeight;
end;

procedure RestoreForm(AForm: TForm);
begin
  // Restores a form if it is minimized or maximized.
  // Call this method in the OnClose event of a form, before
  // calling IQRegFormWrite
  with AForm do
    if IsZoomed(Handle) or IsIconic(Handle) then
      WindowState := wsNormal;
end;

procedure PostMessageToForm(AName: string; AMessageID, WParam, LParam: Integer);
var
  AForm: TUniForm;
begin
  AForm := FindFormByClassName(AName);
  if Assigned(AForm) then
    PostMessage(AForm.Handle, AMessageID, WParam, LParam);
end;

procedure PostMessageToForm(AClass: TClass; AMessageID: Integer;
  WParam: Integer = 0; LParam: Integer = 0);
var
  AForm: TForm;
begin
  AForm := FindFormByClassType(AClass);
  if Assigned(AForm) then
    PostMessage(AForm.Handle, AMessageID, WParam, LParam);
end;

function GetActiveControlText(AForm: TForm): string;
var
  S: string;
  Buffer: PChar;
  Size: Byte;
begin
  with AForm do
    begin
      Result := '';
      Size := ActiveControl.GetTextLen; // Get length of string
      Inc(Size); // Add room for null character
      GetMem(Buffer, Size); // Creates Buffer dynamic variable
      ActiveControl.GetTextBuf(Buffer, Size); // Put Text into Buffer}
      S := StrPas(Buffer); // Convert Buffer to a Pascal-style string
      FreeMem(Buffer, Size); // Frees memory allocated to Buffer
      Result := S;
    end;
end;

procedure ClearStringListOfObjects(var AList: TStringList);
var
  i: Integer;
begin
  if Assigned(AList) then
    begin
      for i := AList.Count - 1 downto 0 do
        if Assigned(AList.Objects[i]) then
          begin
            TObject(AList.Objects[i]).Free;
            AList.Objects[i] := nil;
          end;
      AList.Clear;
    end;
end;

procedure ClearStringsOfObjects(AList: TStrings);
var
  i: Integer;
begin
  if Assigned(AList) then
    begin
      for i := AList.Count - 1 downto 0 do
        if Assigned(AList.Objects[i]) then
          begin
            TObject(AList.Objects[i]).Free;
            AList.Objects[i] := nil;
          end;
      AList.Clear;
    end;
end;

procedure ClearListOfObjects(var AList: TList);
var
  i: Integer;
begin
  if Assigned(AList) then
    begin
      for i := AList.Count - 1 downto 0 do
        if Assigned(AList[i]) then
          begin
            TObject(AList[i]).Free;
            AList[i] := nil;
          end;
      AList.Clear;
    end;
end;

procedure ClearComboBoxOfObjects(AComboBox: TUniCustomComboBox);
var
  i: Integer;
begin
  if Assigned(AComboBox) then
    begin
      for i := AComboBox.Items.Count - 1 downto 0 do
        if Assigned(AComboBox.Items.Objects[i]) then
          begin
            TObject(AComboBox.Items.Objects[i]).Free;
            AComboBox.Items.Objects[i] := nil;
          end;
      AComboBox.Items.Clear;
    end;
end;

//procedure ClearWwComboBoxOfObjects(AComboBox: TwwDBComboBox);
//var
//  i: Integer;
//begin
//  if Assigned(AComboBox) then
//    begin
//      for i := AComboBox.Items.Count - 1 downto 0 do
//        if Assigned(AComboBox.Items.Objects[i]) then
//          begin
//            TObject(AComboBox.Items.Objects[i]).Free;
//            AComboBox.Items.Objects[i] := nil;
//          end;
//      AComboBox.Items.Clear;
//    end;
//end;

procedure ClearListViewOfObjects(AListView: TCustomListView);
var
  i: Integer;
begin
  if Assigned(AListView) then
    begin
      for i := AListView.Items.Count - 1 downto 0 do
        if Assigned(AListView.Items[i].Data) then
          begin
            TObject(AListView.Items[i].Data).Free;
            AListView.Items[i].Data := nil;
          end;
      AListView.Items.Clear;
    end;
end;

procedure ClearListBoxOfObjects(AListBox: TListBox);
var
  i: Integer;
begin
  if Assigned(AListBox) then
    begin
      for i := AListBox.Items.Count - 1 downto 0 do
        if Assigned(AListBox.Items.Objects[i]) then
          begin
            TObject(AListBox.Items.Objects[i]).Free;
            AListBox.Items.Objects[i] := nil;
          end;
      AListBox.Items.Clear;
    end;
end;

function IQAssignColumn(dbGrid: TDBGrid; const sFieldName, sTitle: string;
  Col: TColumn): TColumn;
begin
  Result := nil;
  if sTitle = '' then { empty title - remove this column }
    begin
      if Assigned(Col) then
        Col.Collection := nil
    end
  else { create column if does not exist and assign title }
    begin
      Result := Col;
      if not Assigned(Result) then
        Result := dbGrid.Columns.Add;
      with Result do
        begin
          if FieldName <> sFieldName then
            FieldName := sFieldName;
          if Title.Caption <> sTitle then
            Title.Caption := sTitle;
        end;
    end;
end;

procedure IQClearSelectedDateColumn(dbGrid: TDBGrid);
begin
  with dbGrid do
    if Assigned(SelectedField) and (SelectedField.DataType = ftDateTime) then
      begin
        SelectedField.DataSet.Edit;
        SelectedField.Value := NULL;
      end;
end;

{$REGION 'TRichEdit classes'}

{$REGION 'TRichEditHelper'}

procedure TRichEditHelper.LoadText(const AText: string);
begin
  Clear;
  if Pos('{\rtf1\', AText) > 0 then
    IQMS.Common.Controls.SetRtfMarkup(Self, AText)
  else
    Text := AText;
end;

function TRichEditHelper.GetRichTextMarkup: string;
var
  AStream: TStringStream;
begin
  Result := '';
  AStream := TStringStream.Create('');
  try
    Lines.SaveToStream(AStream);
    Result := AStream.DataString;
  finally
    AStream.Free;
  end;
end;

procedure TRichEditHelper.SetRichTextMarkup(const AText: string);
var
  AStream: TStringStream;
begin
  AStream := TStringStream.Create(AText);
  try
    PlainText := False;
    Lines.LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

procedure TRichEditHelper.UpdateCursorPos(const X, Y: Integer);
var
  P: TPoint;
begin
  //Updates the position of the insertion point in the TRichEdit with the
  //values supplied for X and Y.  This method may be used in OnDragOver
  //as users are about to drop a string at some point in the editor.
  P := Point(X, Y);
  SelStart := SendMessage(Handle, EM_CHARFROMPOS, 0, LongInt(@P));
  if CanFocus then
    SetFocus;
end;

{$ENDREGION 'TRichEditHelper'}

{$REGION 'TRichEditEx' }

procedure TRichEditEx.CreateWnd;
var
  mask: Word;
begin
  inherited CreateWnd;

  SendMessage(Handle, EM_AUTOURLDETECT, 1, 0);
  mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
end;

procedure TRichEditEx.CNNotify(var Msg: TWMNotify);
var
  P: TENLink;
  sURL: string;
begin
  if (Msg.NMHdr^.code = EN_LINK) then
  begin
    P := TENLink(Pointer(Msg.NMHdr)^);
    if (P.Msg = WM_LBUTTONDOWN) then
    begin
      try
        SendMessage(Handle, EM_EXSETSEL, 0, LongInt(@(P.chrg)));
        sURL := SelText;
        ShellExecute(Handle, 'open', PChar(sURL), 0, 0, SW_SHOWNORMAL);
      except
      end;
    end;
  end
  else
    inherited;
end;

{$ENDREGION 'TRichEditEx' }

{$ENDREGION 'TRichEdit classes'}

procedure UpdateCursorPos(AEditor: TRichEdit; X, Y: Integer);
var
  P: TPoint;
begin
  // Updates the position of the insertion point in the TRichEdit with the
  // values supplied for X and Y.  This method may be used in OnDragOver
  // as users are about to drop a string at some point in the editor.
  if AEditor <> nil then
    begin
      P := Point(X, Y);
      AEditor.SelStart := SendMessage(AEditor.Handle, EM_CHARFROMPOS, 0,
        LongInt(@P));
      if AEditor.CanFocus then
        AEditor.SetFocus;
    end;
end;

function GetRtfMarkup(ARichEdit: TRichEdit): string;
var
  AStream: TStringStream;
begin
  Result := '';
  if Assigned(ARichEdit) then
    begin
      AStream := TStringStream.Create('');
      try
        ARichEdit.Lines.SaveToStream(AStream);
        Result := AStream.DataString;
      finally
        AStream.Free;
      end;
    end;
end;

procedure SetRtfMarkup(ARichEdit: TRichEdit; ARtfMarkupText: string);
var
  AStream: TStringStream;
begin
  if Assigned(ARichEdit) then
    begin
      AStream := TStringStream.Create(ARtfMarkupText);
      try
        ARichEdit.PlainText := False;
        ARichEdit.Lines.LoadFromStream(AStream);
      finally
        AStream.Free;
      end;
    end;
end;

procedure FormatHyperlink(AControl: TControl);
begin
  // Formats a control to look like a hyperlink
//  if AControl is TwwDBLookupCombo then
//    with AControl as TwwDBLookupCombo do
//      begin
//        if Trim(Text) > '' then
//          Cursor := crHandPoint
//        else
//          Cursor := crDefault;
//        Font.Style := [fsUnderline];
//        Font.Color := clBlue;
//      end
//  else
  if AControl is TDBLookupComboBox then
    with AControl as TDBLookupComboBox do
      begin
        if Trim(Text) > '' then
          Cursor := crHandPoint
        else
          Cursor := crDefault;
        Font.Style := [fsUnderline];
        Font.Color := clBlue;
      end
  else if AControl is TDBComboBox then
    with AControl as TDBComboBox do
      begin
        if Trim(Text) > '' then
          Cursor := crHandPoint
        else
          Cursor := crDefault;
        Font.Style := [fsUnderline];
        Font.Color := clBlue;
      end
  else if AControl is TDBEdit then
    with AControl as TDBEdit do
      begin
        if Trim(Text) > '' then
          Cursor := crHandPoint
        else
          Cursor := crDefault;
        Font.Style := [fsUnderline];
        Font.Color := clBlue;
      end
//  else if AControl is TwwDBEdit then
//    with AControl as TwwDBEdit do
//      begin
//        if Trim(Text) > '' then
//          Cursor := crHandPoint
//        else
//          Cursor := crDefault;
//        Font.Style := [fsUnderline];
//        Font.Color := clBlue;
//      end
  else if AControl is TEdit then
    with AControl as TEdit do
      begin
        if Trim(Text) > '' then
          Cursor := crHandPoint
        else
          Cursor := crDefault;
        Font.Style := [fsUnderline];
        Font.Color := clBlue;
      end
  else if AControl is TLabel then
    with AControl as TLabel do
      begin
        if Trim(Caption) > '' then
          Cursor := crHandPoint
        else
          Cursor := crDefault;
        Font.Style := [fsUnderline];
        Font.Color := clBlue;
      end
end;

procedure ExecuteHyperlink(AHyperLink: string); overload;
begin
  // Executes text as a hyperlink
//  if ValidHyperlink(AHyperLink) then
//    ExecuteProgram(AHyperLink, SW_SHOWDEFAULT, ''); // IQMisc.pas
end;

procedure ExecuteHyperlink(AControl: TControl);
var
  AHyperLink: string;
begin
  // Executes the text of a control as a hyperlink
//  if AControl is TwwDBLookupCombo then
//    with AControl as TwwDBLookupCombo do
//      AHyperLink := Text
//  else
  if AControl is TDBLookupComboBox then
    with AControl as TDBLookupComboBox do
      AHyperLink := Text
  else if AControl is TDBComboBox then
    with AControl as TDBComboBox do
      AHyperLink := Text
  else if AControl is TDBEdit then
    with AControl as TDBEdit do
      AHyperLink := Text
//  else if AControl is TwwDBEdit then
//    with AControl as TwwDBEdit do
//      AHyperLink := Text
  else if AControl is TEdit then
    with AControl as TEdit do
      AHyperLink := Text
  else if AControl is TLabel then
    with AControl as TLabel do
      AHyperLink := Caption;
  ExecuteHyperlink(AHyperLink);
end;

function ValidHyperlink(var AHyperLink: string): Boolean;
begin
  // Returns TRUE if the text is a valid hyperlink
  // Returns a formatted value for AHyperLink which can then
  // be executed.
  Result := Trim(AHyperLink) > '';
  if not Result then
    EXIT;
//  Result := EMailUtils.EMailValid(AHyperLink); // email address
//  if Result then
//    AHyperLink := Format('mailto:%s', [AHyperLink])
//  else
//    Result := FileExists(AHyperLink) or (Pos('http://', AHyperLink) > 0) or
//      (Pos('https://', AHyperLink) > 0) or (Pos('ftp://', AHyperLink) > 0);
end;

//procedure ExpandDataInspector(ADataInspector: TwwDataInspector;
//  AExpanded: Boolean);
//var
//  i: Integer;
//begin
//  if ADataInspector.Items.Count = 0 then
//    EXIT;
//  with ADataInspector do
//    try
//      Items.BeginUpdate;
//      if Items[0] <> nil then
//        ActiveItem := Items[0]
//      else
//        EXIT;
//      for i := 0 to Items.Count - 1 do
//        Items[i].Expanded := AExpanded;
//    finally
//      Items.EndUpdate;
//      Refresh;
//    end;
//end;

procedure CenterControlsHorizInWindowA(const AParent: TWinControl);
var
  i, W: Integer;
begin
  W := AParent.ClientWidth div 2;
  for i := 0 to AParent.ControlCount - 1 do
    AParent.Controls[i].Left := Abs(W - (AParent.Controls[i].Width div 2));
end;

procedure CenterControlsHorizInWindowB(const AParent: TWinControl;
  const AControls: array of TControl);
var
  i, W: Integer;
begin
  W := AParent.ClientWidth div 2;
  for i := 0 to high(AControls) do
    AControls[i].Left := Abs(W - (AControls[i].Width div 2));
end;

procedure CenterControlsVertInWindowA(const AParent: TWinControl);
var
  i: Integer;
begin
  for i := 0 to AParent.ControlCount - 1 do
    AParent.Controls[i].Top :=
      (AParent.ClientHeight - AParent.Controls[i].Height) div 2;
end;

procedure CenterLabel(const AEditCtrl: TUniControl; const ALabel: TUniLabel);
begin
  if Assigned(AEditCtrl) or not Assigned(ALabel) then
    IQAlignControls([AEditCtrl, ALabel], acVerticalCenters); // see below
   if Assigned(AEditCtrl) or not Assigned(ALabel) then
   ALabel.Top := AEditCtrl.Top + (AEditCtrl.Height div 2) - (ALabel.Height div 2);;
end;

procedure IQAlignControls(const AControls: array of TControl;
  const ACommand: TAlignCmd);
var
  i: Integer;
  ctrlFirst: TControl;
begin
  if high(AControls) <= 0 then
    EXIT;

  ctrlFirst := AControls[0];

  if not Assigned(ctrlFirst) then
    EXIT;

  case ACommand of
    acLeftSides:
      // Lines up the left edges of the selected components (horizontal only)
      begin
        for i := 1 to high(AControls) do
          AControls[i].Left := ctrlFirst.Left;
      end;

    acHorizontalCenters:
      // Lines up the centers of the selected components
      begin
        for i := 1 to high(AControls) do
          AControls[i].Left := ctrlFirst.Left + (ctrlFirst.Width div 2) -
            (AControls[i].Width div 2);
      end;

    acRightSides:
      // Lines up the right edges of the selected components (horizontal only)
      begin
        for i := 1 to high(AControls) do
          AControls[i].Left := (ctrlFirst.Left + ctrlFirst.Width) -
            AControls[i].Width;
      end;

    acTops:
      // Lines up the top edges of the selected components (vertical only)
      begin
        for i := 1 to high(AControls) do
          AControls[i].Top := ctrlFirst.Top;
      end;

    acVerticalCenters:
      // Lines up the centers of the selected components
      begin
        for i := 1 to high(AControls) do
          AControls[i].Top := ctrlFirst.Top + (ctrlFirst.Height div 2) -
            (AControls[i].Height div 2);
      end;

    acBottoms:
      // Lines up the bottom edges of the selected components (vertical only)
      begin
        for i := 1 to high(AControls) do
          AControls[i].Top := (ctrlFirst.Top + ctrlFirst.Height) -
            AControls[i].Height;
      end;

  end; // end case
end;


procedure AdjustToWindowsDPI( var APixels: Integer );
var
  ADPI: Integer;
begin
//  with TIQRegistry.Create do
//  try
//    RootKey:= HKEY_CURRENT_USER;
//    if not (OpenKey( '\Control Panel\Desktop\WindowMetrics', FALSE ) and ValueExists( 'AppliedDPI' )) then
//       EXIT;
//    ADPI:= ReadInteger( 'AppliedDPI' );
//  finally
//    Free;
//  end;

  if ADPI = 96 then
     EXIT;

  APixels:= (APixels * ADPI) div 96;
end;


procedure StackUpControls(ATop, AGapBetween: Integer;
  const AControls: array of TControl);
var
  i: Integer;
begin
  AdjustToWindowsDPI( ATop );
  AdjustToWindowsDPI( AGapBetween );

  for i := 0 to high(AControls) do
    if AControls[i].Visible then
      begin
        AControls[i].Top := ATop;
        ATop := ATop + AGapBetween;
      end;
end;

procedure StackUpControlsA(ATop, AGapBetween: Integer;
  const AControls: array of TControl);
var
  i: Integer;
begin
  AdjustToWindowsDPI( ATop );
  AdjustToWindowsDPI( AGapBetween );

  for i := 0 to high(AControls) do
    if AControls[i].Visible then
      begin
        AControls[i].Top := ATop;
        if AControls[i].Height > AGapBetween then
          ATop := ATop + AControls[i].Height + 2
        else
          ATop := ATop + AGapBetween;
      end;
end;

procedure StackUpControlsLeft(ALeft, AGapBetween: Integer;
  const AControls: array of TControl);
var
  i: Integer;
  ALastRight: Integer;
begin
  ALastRight := ALeft;
  for i := 0 to high(AControls) do
    if AControls[i].Visible then
      begin
        AControls[i].Left := ALastRight;
        ALastRight := ALastRight + AControls[i].Width + 1 + AGapBetween;
      end;
end;

procedure StackUpControlsB(AParent: TWinControl; AEditControlLeft: Integer = 2);
var
  i, W1, W2: Integer;
begin
  // Adjusts edit controls in a scrollbox starting at AEditBoxLeft

  // Get values for size variables
  W1 := (AParent.ClientWidth - AEditControlLeft) - 2; // Edit box widths
  W2 := AParent.ClientWidth - 13; // Line widths

  // Edit box sizes
  for i := 0 to (AParent.ControlCount - 1) do
    begin
      if (AParent.Controls[i] is TCustomEdit) or
        (AParent.Controls[i] is TCustomComboBox) or
        (AParent.Controls[i] is TDBLookupControl) then
        with AParent.Controls[i] do
          begin
            Left := AEditControlLeft;
            Width := W1;
            Anchors := [akLeft, akTop, akRight];
          end;
    end;

  // Line sizes
  for i := 0 to (AParent.ControlCount - 1) do
    begin
      if (AParent.Controls[i] is TBevel) then
        with AParent.Controls[i] do
          begin
            Left := 6;
            Width := W2;
            Anchors := [akLeft, akTop, akRight];
          end;
    end;

  if AParent is TScrollBox then
    TScrollBox(AParent).VertScrollBar.Position := 0;
end;

procedure StackUpControlsC(const AControls: array of TControl);
var
  i: Integer;
begin
  { works only if all the controls are Top aligned }
  for i := 0 to high(AControls) do
    if AControls[i].Visible then
      AControls[i].Top := i
    else
      AControls[i].Top := 1000; { push it down }
end;

procedure AlignControlsFromLeftA(const AParent: TWinControl;
  const AStartLeft, ATop, AGapBetween: Integer);
var
  i, iLeft: Integer;
begin
  { Align all controls contained in the parent, starting with the AStartLeft
    position, and lining them up to the right }
  iLeft := AStartLeft;
  for i := 0 to AParent.ControlCount - 1 do
    if AParent.Controls[i].Visible then
      begin
        AParent.Controls[i].Top := ATop;
        AParent.Controls[i].Left := iLeft;
        iLeft := iLeft + AParent.Controls[i].Width + AGapBetween;
      end;
end;

procedure AlignControlsFromLeftB(const AStartLeft, ATop, AGapBetween: Integer;
  const AControls: array of TControl);
var
  i, iLeft: Integer;
begin
  { Align all listed controls, starting with the AStartLeft position,
    and lining them up to the right }
  iLeft := AStartLeft;
  for i := 0 to high(AControls) do
    if AControls[i].Visible then
      begin
        AControls[i].Top := ATop;
        AControls[i].Left := iLeft;
        iLeft := iLeft + AControls[i].Width + AGapBetween;
      end;
end;

procedure AlignControlsFromLeftC(const AParent: TWinControl;
  const AStartLeft, ATop, AGapBetween, AHeight, AWidth: Integer);
var
  i, iLeft: Integer;
begin
  { Align all controls contained in the parent, starting with the AStartLeft
    position, and lining them up to the right }
  iLeft := AStartLeft;
  for i := 0 to AParent.ControlCount - 1 do
    if AParent.Controls[i].Visible then
      begin
        AParent.Controls[i].Top := ATop;
        AParent.Controls[i].Left := iLeft;
        if AHeight > 0 then
          AParent.Controls[i].Height := AHeight;
        if AWidth > 0 then
          AParent.Controls[i].Width := AWidth;
        iLeft := iLeft + AParent.Controls[i].Width + AGapBetween;
      end;
end;

procedure AdjustRightAlignedControlsToParent(AParent: TWinControl;
  ARightOffSet: Integer);
var
  i, W: Integer;
begin
  // Controls that have [alRight] in the Align properties are adjusted to the
  // ClientWidth of the parent
  W := AParent.ClientWidth - ARightOffSet;
  for i := 0 to AParent.ControlCount - 1 do
    if (akRight in AParent.Controls[i].Anchors) then
      with AParent.Controls[i] do
        Width := Abs(W - Left);
end;

procedure AdjustControlWidthToParent(AParent: TWinControl;
  ARightOffSet: Integer);
var
  i, W: Integer;
begin
  // The width of all child controls are adjusted to the ClientWidth of the parent
  W := AParent.ClientWidth - ARightOffSet;
  for i := 0 to AParent.ControlCount - 1 do
    with AParent.Controls[i] do
      Width := Abs(W - Left);
end;

procedure AdjustControlWidthToParentA(AParent: TWinControl;
  ARightOffSet: Integer);
var
  i: Integer;
  W: Integer;
begin
  // Adjusts the width of controls to the ClientWidth of the parent
  W := AParent.ClientWidth - ARightOffSet;
  for i := 0 to AParent.ControlCount - 1 do
    AParent.Controls[i].Width := Abs(W - AParent.Controls[i].Left);
end;

procedure AdjustControlWidthToParentB(AParent: TWinControl;
  const AControls: array of TControl; ARightOffSet: Integer);
var
  i: Integer;
  W: Integer;
begin
  // Adjusts the width of controls to the ClientWidth of the parent
  W := AParent.ClientWidth - ARightOffSet;
  for i := 0 to high(AControls) do
    AControls[i].Width := Abs(W - AControls[i].Left);
end;

procedure IQAdjustControlsWidthBasedOnParent(AParent: TWinControl;
  const AControls: array of TControl; AOffset: Integer);
var
  i: Integer;
begin
  { Use this mehod when having controls right aligned. Call it from OnShow.
    This will establish the correct distance from the right border of the parent panel.

    I had a case when 2 controls did not show up the same in Vista while was OK in XP.
    Ex: AdjustControlsWidthBasedOnParent( Panel4, [ wwcombMfgCell, timeProdDate ], 4 );
  }
  AdjustToWindowsDPI(AOffset);
  for i := 0 to high(AControls) do
    AControls[i].Width := AParent.Width - AControls[i].Left - AOffset;
end;

procedure AdjustControlsWidthBasedOnParent(AParent: TWinControl;
  const AControls: array of TControl; AOffset: Integer);
begin
  IQAdjustControlsWidthBasedOnParent(AParent, AControls, AOffset);
end;

function CheckboxValueInt(const ACheckBox: TCheckBox): Integer;
// 1=TRUE, 0=FALSE
begin
  if ACheckBox.Checked = True then
    Result := 1
  else
    Result := 0;
end;

procedure ResizeCheckBoxes(AForm: TUniForm; AOwner: TWinControl;
  AMaxWidth: Integer);
const
  cMinWidth = 26;
var
  ctrl: TControl;
  S: string; // caption text
  i: Integer; // counter
  tw: Integer; // text width
  cw: Integer; // control width
begin
  // Adjusts the widths of check boxes and radio buttons, based on the
  // caption text.  This is essential for localized versions.

  if (AOwner = nil) or (AForm = nil) then
    EXIT;

  with AOwner do
    for i := 0 to ControlCount - 1 do
      begin
        // Get control
        ctrl := Controls[i];

        ResizeControl(AForm, ctrl, AMaxWidth);

        // -- // Get the control caption text
        // -- if ( ctrl is TCheckBox ) then
        // --    s := TCheckBox(ctrl).Caption
        // -- else if ( ctrl is TDBCheckBox ) then
        // --    s := TDBCheckBox(ctrl).Caption
        // -- else if ( ctrl is TwwCheckBox ) then
        // --    s := TwwCheckBox(ctrl).Caption
        // -- else if ( ctrl is TRadioButton ) then
        // --    s := TRadioButton(ctrl).Caption
        // -- else Continue;
        // --
        // -- // Get the text width based on the owner form canvas
        // -- tw := AForm.Canvas.TextWidth(s);
        // --
        // -- // Get the control width
        // -- if AMaxWidth > 0 then
        // --    cw := Min(AMaxWidth, tw + cMinWidth)
        // -- else
        // --    cw := tw + cMinWidth;
        // --
        // -- // Set the control width
        // -- ctrl.Width := cw;
        // --
        // -- // If we are setting width based on screen settings,
        // -- // no anchors should be applied.  Anchors may exist
        // -- // on older screens, where this was once done.
        // -- ctrl.Anchors := [akLeft,akTop];
      end;
end;

procedure AutoSizeCheckBoxes(AOwner: TWinControl; AMaxWidth: Integer = 0);
var
  AForm: TUniForm;
begin
  AForm := GetOwnerForm(AOwner);
  ResizeCheckBoxes(AForm, AOwner, AMaxWidth);
end;

procedure ResizeControl(AForm: TUniForm; AControl: TControl;
  AMaxWidth: Integer = 0);
const
  cMinWidth = 30;
var
  tw: Integer; // text width
  cw: Integer; // control width
  S: string;
begin
  if (AForm = nil) then
    EXIT;

  // Get the control caption text
  if (AControl is TCheckBox) then
    S := TCheckBox(AControl).Caption

  else if (AControl is TDBCheckBox) then
    S := TDBCheckBox(AControl).Caption

//  else if (AControl is TwwCheckBox) then
//    S := TwwCheckBox(AControl).Caption

  else if (AControl is TRadioButton) then
    S := TRadioButton(AControl).Caption

  else
    EXIT;

  // Get the text width based on the owner form canvas
  tw := AForm.Canvas.TextWidth(S);

  // Get the control width
  if AMaxWidth > 0 then
    cw := Min(AMaxWidth, tw + cMinWidth)
  else
    cw := tw + cMinWidth;

  // Set the control width
  AControl.Width := cw;

  // If we are setting width based on screen settings,
  // no anchors should be applied.  Anchors may exist
  // on older screens, where this was once done.
  AControl.Anchors := [akLeft, akTop];
end;

procedure ResizeNavBar(ANav: TDBNavigator; AStandardWidth: Integer = 25);
var
  i, X: Integer;
begin
  // Resizes TDBNavigator
  X := 0;
  for i := 0 to ANav.ControlCount - 1 do
    if ANav.Controls[i].Visible then
      Inc(X);
  ANav.Width := X * AStandardWidth;
end;

procedure AutoSizeNavBar(ANav: TDBNavigator);
var
  AHeight: Integer;
begin
  if Assigned(ANav) and Assigned(ANav.Parent) then
    begin
      // If the height of the parent panel has been changed programmatically,
      // the height of the navigator may not adjust immediately, even if
      // Align = alRight.  So, get the height from the parent panel
      if (ANav.Parent is TPanel) then
        AHeight := TPanel(ANav.Parent).ClientHeight -
          ((TPanel(ANav.Parent).BevelWidth * 2) + TPanel(ANav.Parent)
          .BorderWidth)
      else
        // By default, get the height from the navigator itself.
        AHeight := ANav.Height;
      // Adjust the navigator
      ANav.Realign;
      ResizeNavBar(ANav, AHeight);
    end;
end;

procedure PopupMenuFor(ASpeedButton: TSpeedButton; APopupMenu: TPopupMenu);
var
  X, Y: Integer;
begin
  if (ASpeedButton = nil) or (APopupMenu = nil) then
    EXIT;

  X := (ASpeedButton.ClientOrigin.X);
  Y := (ASpeedButton.ClientOrigin.Y) + ASpeedButton.Height;
  APopupMenu.Popup(X, Y);
end;

procedure PopupMenuFor(ABitBtn: TBitBtn; APopupMenu: TPopupMenu);
var
  X, Y: Integer;
begin
  if (ABitBtn = nil) or (APopupMenu = nil) then
    EXIT;

  X := (ABitBtn.ClientOrigin.X);
  Y := (ABitBtn.ClientOrigin.Y) + ABitBtn.Height;
  APopupMenu.Popup(X, Y);
end;

//procedure PopupMenuFor(AButton: TwwComboButton; APopupMenu: TPopupMenu);
//  overload; // wwcombobutton.pas
//var
//  X, Y: Integer;
//begin
//  if (AButton = nil) or (APopupMenu = nil) then
//    EXIT;
//
//  X := (AButton.ClientOrigin.X);
//  Y := (AButton.ClientOrigin.Y) + AButton.Height;
//  APopupMenu.Popup(X, Y);
//end;

procedure PopupMenuForNavButton(ANav: TDBNavigator; AButton: TNavigateBtn;
  APopupMenu: TPopupMenu);
var
  P: TPoint;
begin
  { Example:

    if Button = nbInsert then
    PopupMenuForNavButton(NavDetail, nbInsert, PInsertDetail);

  }

  if (ANav = nil) or (APopupMenu = nil) then
    EXIT;

  try
    with ANav.Controls[Ord(AButton)] do
      begin
        P.X := Left;
        P.Y := Top + Height + 1;
        P := Parent.ClientToScreen(P);
      end;

    APopupMenu.Popup(P.X, P.Y);
  finally
    System.SysUtils.Abort; // cancel the default TDBNavigator action
  end;
end;

//procedure DataInspectorAsText(ADataInspector: TwwDataInspector;
//  var AList: TStringList);
//// ---------------------------------------------------------------------------
//  function _GetFieldText(AField: TField): string;
//  begin
//    // 11/05/2009 Added this method (Byron)
//    Result := '';
//    if not Assigned(AField) then
//      EXIT;
//    if (AField is TFloatField) then
//      begin
//        if TFloatField(AField).currency then
//          Result := FormatSettings.CurrencyString + FormatFloat1000SeparatorB
//            (TFloatField(AField).AsFloat, 2)
//        else if TFloatField(AField).DisplayFormat > '' then
//          Result := FormatFloat(TFloatField(AField).DisplayFormat,
//            TFloatField(AField).AsFloat)
//        else
//          Result := FormatFloat1000SeparatorB(TFloatField(AField).AsFloat);
//      end
//    else
//      Result := AField.AsString;
//  end;
// ---------------------------------------------------------------------------
//  procedure _GetDataInspectorText(ADataInspector: TwwDataInspector;
//    ACurrentItem: TwwInspectorItem; var AList: TStringList);
//  var
//    i: Integer;
//    ACaption, AText: string;
//  begin
//    if AList = nil then
//      EXIT;
//    // Add first item on the inspector
//    if ACurrentItem = nil then
//      begin
//        for i := 0 to ADataInspector.Items.Count - 1 do
//          begin
//            ACurrentItem := ADataInspector.Items[i];
//            AText := Trim(ACurrentItem.DisplayText);
//            if AText = '' then
//              AText := Trim(ACurrentItem.EditText);
//            if (AText = '') and Assigned(ACurrentItem.Field) then
//              begin
//                AText := _GetFieldText(ACurrentItem.Field)
//              end;
//            AText := StrTran(AText, '&&', '&');
//
//            ACaption := ACurrentItem.Caption;
//            ACaption := StrTran(ACaption, '&&', '&');
//
//            if AText > '' then
//              AList.Add(Format('%s%s: %s', [Repl(#9, ACurrentItem.Level),
//                // indentation, if any
//                ACaption, AText]))
//            else if ACurrentItem.Caption > '' then
//              AList.Add(ACurrentItem.Caption + ':')
//            else
//              CONTINUE;
//
//            _GetDataInspectorText(ADataInspector, ACurrentItem, AList);
//          end;
//      end
//    else begin
//        for i := 0 to ACurrentItem.Items.Count - 1 do
//          begin
//            AText := Trim(ACurrentItem.Items[i].DisplayText);
//            if AText = '' then
//              AText := Trim(ACurrentItem.Items[i].EditText);
//            if (AText = '') and Assigned(ACurrentItem.Items[i].Field) then
//              AText := _GetFieldText(ACurrentItem.Items[i].Field);
//            AText := StrTran(AText, '&&', '&');
//
//            ACaption := ACurrentItem.Items[i].Caption;
//            ACaption := StrTran(ACaption, '&&', '&');
//
//            if AText > '' then
//              AList.Add(Format('%s%s: %s',
//                [Repl(#9, ACurrentItem.Items[i].Level), // indentation, if any
//                ACaption, AText]))
//            else if ACurrentItem.Items[i].Caption > '' then
//              AList.Add(ACurrentItem.Items[i].Caption + ':')
//            else
//              CONTINUE;
//            _GetDataInspectorText(ADataInspector, ACurrentItem.Items[i], AList);
//            // recurse
//          end;
//      end;
//  end;

// ---------------------------------------------------------------------------
//begin
//  _GetDataInspectorText(ADataInspector, nil, AList);
//end;

//function SaveDataInspectorToFile(ADataInspector: TwwDataInspector;
//  ADefaultFileName: string; var AFileName: string): Boolean;
//var
//  AList: TStringList;
//begin
//  AFileName := '';
//  with TSaveDialog.Create(NIL) do
//  try
//    DefaultExt := '.txt';
//    FileName := ChangeFileExt(ADefaultFileName, '.txt');
//    Filter := 'Text File (*.txt)|*.txt|Any File (*.*)|*.*';
//    Result := Execute;
//    if Result then
//      begin
//        AList := TStringList.Create;
//        try
//          Screen.Cursor := crHourGlass;
//          AFileName := FileName;
//          try
//            DataInspectorAsText(ADataInspector, AList);
//            AList.SaveToFile(FileName);
//          finally
//            Screen.Cursor := crDefault;
//          end;
//        finally
//          if Assigned(AList) then
//            FreeAndNil(AList);
//        end;
//      end;
//  finally
//     Free;
//  end;
//end;
//
//procedure CopyDataInspectorToClipboard(ADataInspector: TwwDataInspector);
//var
//  AList: TStringList;
//begin
//  // Copy to clipboard
//  AList := TStringList.Create;
//  try
//    Screen.Cursor := crHourGlass;
//    try
//      DataInspectorAsText(ADataInspector, AList);
//      Clipboard.AsText := AList.Text;
//    finally
//      Screen.Cursor := crDefault;
//    end;
//  finally
//    if Assigned(AList) then
//      FreeAndNil(AList);
//  end;
//end;
//
//procedure AsssignCustomControlToDataInspector(ADataInspector: TwwDataInspector;
//  ATagString: string; AComponent: TWinControl);
//var
//  AInspectorItem: TwwInspectorItem;
//begin
//  AInspectorItem := ADataInspector.GetItemByTagString(ATagString);
//
//  { Vcl.XPMan + Vcl.wwDataInspector weird anomaly - by assigning 1999 we will prevent our internal function from assigning parent background color }
//  if (AComponent is TPanel) or (AComponent is TGroupBox) or
//    (AComponent is TScrollBox) then
//    begin
//      AComponent.Tag := 1999;
//      TPanel(AComponent).ParentBackground := True;
//      TPanel(AComponent).ParentBackground := False;
//    end;
//
//  if Assigned(AInspectorItem) then
//    AInspectorItem.CustomControl := AComponent;
//end;
//
//procedure SetDataInspectorItemEnabled(ADataInspector: TwwDataInspector;
//  AFieldName: string; AEnabled: Boolean);
//var
//  AItem: TwwInspectorItem;
//begin
//  if not Assigned(ADataInspector) or (Length(AFieldName) = 0) then
//    EXIT;
//  AItem := ADataInspector.GetItemByFieldName(AFieldName);
//  if Assigned(AItem) then
//    AItem.Enabled := AEnabled;
//end;
//
//procedure SetDataInspectorItemReadOnly(ADataInspector: TwwDataInspector;
//  AFieldName: string; AReadOnly: Boolean);
//var
//  AItem: TwwInspectorItem;
//begin
//  if not Assigned(ADataInspector) or (Length(AFieldName) = 0) then
//    EXIT;
//  AItem := ADataInspector.GetItemByFieldName(AFieldName);
//  if Assigned(AItem) then
//    AItem.ReadOnly := AReadOnly;
//end;
//
//procedure SetDataInspectorItemCaption(ADataInspector: TwwDataInspector;
//  AFieldName: string; ACaption: string);
//var
//  AItem: TwwInspectorItem;
//begin
//  if not Assigned(ADataInspector) or (Length(AFieldName) = 0) then
//    EXIT;
//  AItem := ADataInspector.GetItemByFieldName(AFieldName);
//  if Assigned(AItem) then
//    AItem.Caption := ACaption;
//end;
//
//procedure SetDataInspectorItemVisible(ADataInspector: TwwDataInspector;
//  AFieldName: string; AVisible: Boolean);
//var
//  AItem: TwwInspectorItem;
//begin
//  if not Assigned(ADataInspector) or (Length(AFieldName) = 0) then
//    EXIT;
//  AItem := ADataInspector.GetItemByFieldName(AFieldName);
//  if Assigned(AItem) then
//    AItem.Visible := AVisible;
//end;
//
//procedure SetDataInspectorPopupMenuForField(ADataInspector: TwwDataInspector;
//  AFieldName: string; APopupMenu, ADefaultPopupMenu: TPopupMenu);
//var
//  AItem: TwwInspectorItem;
//begin
//  if not Assigned(ADataInspector) or (Length(AFieldName) = 0) then
//    EXIT;
//  ADataInspector.PopupMenu := ADefaultPopupMenu;
//  AItem := ADataInspector.GetItemByFieldName(AFieldName);
//  if Assigned(AItem) then
//    ADataInspector.PopupMenu := APopupMenu;
//end;

function GetReadableFontColorOnTopOf(ARGBColor: LongInt): TColor;
var
  R, G, B: Integer;
  AGrayScaleRepresentation: Integer;
begin
  R := ARGBColor and $FF;
  G := (ARGBColor and $FF00) shr 8;
  B := (ARGBColor and $FF0000) shr 16;

  AGrayScaleRepresentation := Round(0.3 * R + 0.59 * G + 0.11 * B);

  if AGrayScaleRepresentation > 128 then
    Result := clBlack
  else
    Result := clWhite
end;

procedure ForceForegroundWindow(hwnd: THandle);
var
  ATempFrm: TForm;
  X, Y: Integer;
  APt: TPoint;
begin
  { There is a drawback to this method.  A primary mouse click is simulated.
    So, if a mouse button or other control is under the mouse when this fires,
    then the OnClick event will be executed for that control.  To prevent this,
    I move the mouse position.
  }

  // create a temporary form
  ATempFrm := TForm.Create(nil);
  try
    // set form properties
    ATempFrm.BorderStyle := bsNone;

    // remember the current mouse position, and set the new mouse position
    // to the new form
    GetCursorPos(APt);

    ATempFrm.SetBounds(0 { Left } , 0 { Top } , 5 { Width } , 5 { Height } );
    // position form off-screen
    ATempFrm.FormStyle := fsStayOnTop;
    ATempFrm.Show;

    // This places the form well below the screen border. We set it below, because
    // if we set at the top corner, it could click the system menu of maximized
    // applications and close them.
    SetCursorPos( - 1 { Left } , - 1 { Top } ); // click the off-screen form

    // click the new form
    mouse_event(MOUSEEVENTF_LEFTDOWN or MOUSEEVENTF_ABSOLUTE, 0 { X } ,
      0 { Y } , 0, 0);
    mouse_event(MOUSEEVENTF_LEFTUP or MOUSEEVENTF_ABSOLUTE, 0 { X } ,
      0 { Y } , 0, 0);

    SetForegroundWindow(hwnd);

  finally
    // Free the temporary form
    ATempFrm.Free;
    // reset the cursor to the original position
    SetCursorPos(APt.X, APt.Y);
  end;

  ActivateFormByClassName('THyperPick');

end;

function ForceForegroundWindowB(hwnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
  if IsIconic(hwnd) then
    ShowWindow(hwnd, SW_RESTORE);

  if GetForegroundWindow = hwnd then
    Result := True
  else
    begin
      // Windows 98/2000 doesn't want to foreground a window when some other
      // window has keyboard focus

      if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4))
        or ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
        (Win32MinorVersion > 0)))) then
        begin
          // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
          // Converted to Delphi by Ray Lischner
          // Published in The Delphi Magazine 55, page 16

          Result := False;
          ForegroundThreadID := Winapi.Windows.GetWindowThreadProcessID
            (GetForegroundWindow(), nil);
          ThisThreadID := Winapi.Windows.GetWindowThreadProcessID(hwnd, nil);
          if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then
            begin
              BringWindowToTop(hwnd); // IE 5.5 related hack
              SetForegroundWindow(hwnd);
              AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
              Result := (GetForegroundWindow = hwnd);
            end;
          if not Result then
            begin
              // Code by Daniel P. Stasinski
              SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0,
                @timeout, 0);
              SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
                SPIF_SENDCHANGE);
              BringWindowToTop(hwnd); // IE 5.5 related hack
              SetForegroundWindow(hwnd);
              SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
                TObject(timeout), SPIF_SENDCHANGE);
            end;
        end
      else begin
          BringWindowToTop(hwnd); // IE 5.5 related hack
          SetForegroundWindow(hwnd);
        end;

      Result := (GetForegroundWindow = hwnd);
    end;
end;

procedure ForceForegroundWindowC(const AOwner: TForm;
  const AModalFormClass: array of string);
begin
//  iqformfocus.ForceFormFocus(AOwner, AModalFormClass);
end;

procedure ActivateFormByClassName(AClassName: string);
var
  AForm: TUniForm;
begin
  // if the New Credit Card form is open, activate it
  AForm := FindFormByClassName(AClassName); // IQMS.Common.Controls
  if AForm <> nil then
    AForm.BringToFront;
end;

{ procedure CheckVistaAdjustSize( const AControls: array of TControl;  AOffset: Integer = 4 );
  var
  I:Integer;
  begin
  if not IsWinVista then // in IqSysInfo.pas
  EXIT;

  for I:= 0 to High( AControls ) do
  AControls[ I ].Width:= AControls[ I ].Width - AOffset;
  end; }

(*
  procedure CheckVistaMove( const AControls: array of TControl; ADirection: Integer = 1 {1-left, 2-up}; AOffset: Integer = 4 );
  var
  I:Integer;
  begin
  if not IsWinVista then // in IqSysInfo.pas
  EXIT;

  for I:= 0 to High( AControls ) do
  case ADirection of
  1: AControls[ I ].Left:= AControls[ I ].Left - AOffset;
  2: AControls[ I ].Top:= AControls[ I ].Top - AOffset;
  end;
  end;
*)

procedure UpdateListViewHeader(AListView: TListView);
var
  h: THandle;
begin
  h := GetDlgItem(AListView.Handle, 0);
  if (h <> 0) then
    InvalidateRect(h, nil, True);
end;

procedure AutoSizeListViewColumn(AListView: TListView;
  AColumn, AMinWidth: Integer);
const
  cMaxRows: Integer = 200;
  cDefaultBuffer: Integer = 10;
  cImageListBuffer: Integer = 26;
var
  i, ANewWidth: Integer;
  AColText: string;
  ABuffer: Integer;
begin
  if not Assigned(AListView) or (AColumn < 0) or
    (AColumn > AListView.Columns.Count - 1) then
    EXIT;
  // Get the width of the caption.  This will be our starting point.
  AColText := AListView.Column[AColumn].Caption;
  ANewWidth := System.Math.Max(AMinWidth, AListView.Canvas.TextWidth(AColText));
  ABuffer := IfThen(Assigned(AListView.SmallImages), cImageListBuffer, cDefaultBuffer);
  // Cycle rows and obtain optimum width
  for i := 0 to AListView.Items.Count - 1 do
    begin
      if AColumn = 0 then
        AColText := AListView.Items[i].Caption
      else
        AColText := AListView.Items[i].SubItems.Strings[AColumn - 1];

      ANewWidth := System.Math.Max(ANewWidth, AListView.Canvas.TextWidth(AColText));

      if i > cMaxRows then
        Break;
    end;

  AListView.Column[AColumn].Width := ANewWidth + ABuffer;
end;

procedure ClearTreeView(ATreeView: TTreeView);
var
  i: Integer;
begin
  // 09/22/2010 This method added (Byron)
  for i := ATreeView.Items.Count - 1 downto 0 do
    with ATreeView.Items[i] do
      begin
        if Assigned(Data) then
          TObject(Data).Free;
        Delete;
      end;
  ATreeView.Items.Clear;
end;

function TreeViewPromoteSelected(ATreeView: TTreeView): Boolean;
var
  ANode, AParentNode, AParentParentNode: TTreeNode;
begin
  { Moves an item to the LEFT (<==)in the tree view, essentially "promoting" it.
    This makes the level decrement by 1.

    A True result is returned if the node was moved.  If the result of this
    function is False, then no action was taken.

  }

  // Initialization
  Result := False;
  AParentNode := nil;
  AParentParentNode := nil;

  // Validation
  if not Assigned(ATreeView) or not Assigned(ATreeView.Selected) then
    EXIT;

  // Assign node variable; this is the one we need to modify.
  ANode := ATreeView.Selected;

  // Catch this one early.  If we are already at tree level 0, then
  // Exit early.
  if ANode.Level = 0 then
    EXIT; // cannot go lower than 1

  { Get the parent node of the current node.  We will be making the
    current node a sibling, or equal in level to, this parent. }
  AParentNode := ANode.Parent;

  // Make sure AParentNode is not NULL.  If it is, then there is
  // no reason to promote.
  if (AParentNode = nil) or (AParentNode = ANode) then
    EXIT;

  { Get the parent of the immediate parent of current node.  This
    parent, which we are calling "previous parent" will now be the
    parent of our current node, if it exists.  If there is no additional
    parent, then we don't need to bother with it.  Otherwise, this is
    ideally the easiest way to promote a node. }
  AParentParentNode := AParentNode.Parent;

  try
    ATreeView.Items.BeginUpdate;
    if Assigned(AParentParentNode) then
      begin
        // naAddChild	= The new or relocated node becomes the last child of the other node.
        ANode.MoveTo(AParentParentNode, naAddChild);
        Result := True;
      end
    else if Assigned(AParentNode) then
      begin
        if AParentNode.getNextSibling <> nil then
          // naInsert	The new or relocated node becomes the sibling immediately before the other node.
          ANode.MoveTo(AParentNode.getNextSibling, naInsert)
        else
          // naAdd = The new or relocated node becomes the last sibling of the other node.
          ANode.MoveTo(AParentNode, naAdd);
        Result := True;
      end
    else if (ANode.GetNext <> nil) then
      begin
        ANode.MoveTo(ANode.GetNext, naInsert);
        // ?? ANode.GetNext.MoveTo(ANode, naInsert);
        Result := True;
      end;
  finally
    ATreeView.Items.EndUpdate;
  end;
end;

function TreeViewDemoteSelected(ATreeView: TTreeView): Boolean;
var
  APrevParentNode, APrevNode, ANode: TTreeNode;
  AOnCustomDrawItem: TTVCustomDrawItemEvent;
  ATVExpandingEvent: TTVExpandingEvent;
begin
  { Moves an item to the RIGHT (==>) in the tree view, essentially "demoting" it.
    This makes item a child of the previous item.

    A True result is returned if the node was moved.  If the result of this
    function is False, then no action was taken.
  }

  // Initialization
  Result := False;
  ANode := nil;
  APrevNode := nil;
  APrevParentNode := nil;

  // Validation
  { The selected node must have a parent and a sibling, both.  If not,
    then there is no point demoting the level.  If the selected item
    does have a sibling, then we assign the previous sibling node to the
    APrevNode variable.  We are setting fairly restrictive limits on what
    can be done here, but it results in a safer and more structured
    method. }
  if not Assigned(ATreeView) or not Assigned(ATreeView.Selected) { or
    not Assigned(ATreeView.Selected.Parent) } then
    EXIT;

  try
    ATreeView.Items.BeginUpdate;
    // 08/18/2010 Disable these events.  Doing so will prevent an AV
    // when calling MoveTo() below.
    AOnCustomDrawItem := ATreeView.OnCustomDrawItem;
    ATreeView.OnCustomDrawItem := nil;
    ATVExpandingEvent := ATreeView.OnExpanding;
    ATreeView.OnExpanding := nil;

    // Fill object variables
    ANode := ATreeView.Selected;
    APrevNode := ANode.getPrevSibling;

    // Make sure nothing went wrong, and we have a bizarre situation.
    if (APrevNode = nil) or (APrevNode = ANode) then
      EXIT;

    // Make the selected node a child of the previous sibling.
    ANode.MoveTo(APrevNode, naAddChild);

    // Pass true result
    Result := True;

  finally
    ATreeView.OnCustomDrawItem := AOnCustomDrawItem;
    ATreeView.OnExpanding := ATVExpandingEvent;
    ATreeView.Items.EndUpdate;
  end;

end;

function TopMostParentNode(ASelected: TTreeNode): TTreeNode;
var
  ANode: TTreeNode;
begin
  if Assigned(ASelected) then
    begin
      // Intialize local variable
      ANode := ASelected;
      // Loop parent relationships until no parent is assigned
      while Assigned(ANode.Parent) do
        ANode := ANode.Parent;
      // Return the final value
      Result := ANode;
    end
  else
    Result := nil;
end;

procedure IQSetParentBackground(const APanels: array of TUniPanel;
  AValue: Boolean);
// ---------------------------------------------------------------------------
  procedure _SetProperty(APanel: TUniPanel);
  begin
    with APanel do
      begin
        ParentBackground := AValue;
        ParentBackground := not AValue;
        ParentBackground := AValue;
        if Tag = 0 then
          Tag := 1999;
      end;
  end;

// ---------------------------------------------------------------------------
var
  i: Integer;
begin
  for i := 0 to high(APanels) do
    _SetProperty(APanels[i]);
end;

procedure SetPasswordCharBullet(AEdit: TCustomEdit);
const
  BULLET_CHAR = #183;
begin
  // Set the password character
  // While TCustomEdit contains the property PasswordChar, it is only
  // surfaced by descendent classes.
  if  Assigned(AEdit) and (Screen.Fonts.IndexOf('Symbol') >= 0) then
    begin
      if (AEdit is TEdit) then
        with TEdit(AEdit) do
          begin
            ParentFont := False;
            Font.Name := 'Symbol';
            Font.Size := 9;
            Font.Style := [fsBold];
            PasswordChar := BULLET_CHAR
          end

      else if (AEdit is TDBEdit) then
        with TDBEdit(AEdit) do
          begin
            ParentFont := False;
            Font.Name := 'Symbol';
            Font.Size := 9;
            Font.Style := [fsBold];
            PasswordChar := BULLET_CHAR
          end;
    end;
end;

procedure SetMainFormCaption(const AForm: TForm; const ABaseCaption: string);
var
  AUser, AServer, ANativeCurr: string;
begin
  if not Assigned(AForm) or (ABaseCaption = '') then
    EXIT;

//  AServer := iqmisc.IQGetServerName;
//  AUser := iqsecman.SecurityManager.UserName;
//
//  if iqsecman.SecurityManager.EPlantsExist then
//    begin
//      if iqsecman.SecurityManager.EPlant_ID = 'NULL' then
//        AForm.Caption := Format('%s [%s, %s]', [ABaseCaption, AUser, AServer])
//      else
//        begin
//          ANativeCurr := mcshare.GetNativeCurrencyFilter
//            (StrToFloat(iqsecman.SecurityManager.EPlant_ID)); // mcshare.pas
//          if (ANativeCurr <> '') then
//            AForm.Caption := Format('%s [%s, %s, %s (%s)]',
//              [ABaseCaption, AUser, AServer,
//              iqsecman.SecurityManager.EPlant_Name, ANativeCurr])
//          else
//            AForm.Caption := Format('%s [%s, %s, %s]',
//              [ABaseCaption, AUser, AServer,
//              iqsecman.SecurityManager.EPlant_Name]);
//        end;
//    end
//  else
//    AForm.Caption := Format('%s [%s, %s]', [ABaseCaption, AUser, AServer]);
end;

// Fits grid columns to the column text.  Used the first 10 rows
// to get text length. This works on any TCustomGrid descendent,
// such as TStringGrid and TDBGrid.
procedure FitGridColumnsToText(AGrid: TCustomGrid);
var
  ACol, ARow: Integer;
  AGridObj: TGridObj;
  AMaxWidth: Integer;
  AColWidth: Integer;
  AColText: string;
  AMaxRow: Integer;
  AColWidths: array of Integer;
begin
  AGridObj := TGridObj(AGrid);
  // AGridObj := TCustomGrid(AGrid);
  SetLength(AColWidths, AGridObj.ColCount);
  AMaxRow := 10;
  if AMaxRow > AGridObj.RowCount then
    AMaxRow := AGridObj.RowCount;
  for ACol := 0 to AGridObj.ColCount - 1 do
    begin
      AMaxWidth := 0;
      for ARow := 0 to AMaxRow - 1 do
        begin
          AColText := AGridObj.GetEditText(ACol, ARow);
          AColWidth := AGridObj.Canvas.TextWidth(AColText);
          if AColWidth > AMaxWidth then
            AMaxWidth := AColWidth;
        end;
      if goVertLine in AGridObj.Options then
        Inc(AMaxWidth, AGridObj.GridLineWidth);
      AColWidths[ACol] := AMaxWidth + 4;
      AGridObj.ColWidths[ACol] := AColWidths[ACol];
    end;
end;

//function WWColumnIndexByName(AWWDBGrid: TwwDBGrid;
//  const AFieldName: string): Integer;
//var
//  i: Integer;
//begin
//  for i := 0 to AWWDBGrid.Selected.Count - 1 do
//    if CompareText(AFieldName + #9, LeftStr(AWWDBGrid.Selected[i],
//      Length(AFieldName) + 1)) = 0 then
//      begin
//        Result := i;
//        EXIT;
//      end;
//  Result := - 1;
//end;
//
//procedure EnsureWWColumnRemoved(AWWDBGrid: TwwDBGrid; const AFieldName: string);
//var
//  i: Integer;
//begin
//  i := WWColumnIndexByName(AWWDBGrid, AFieldName);
//  if i > - 1 then
//    AWWDBGrid.Selected.Delete(i);
//  AWWDBGrid.ApplySelected;
//end;
//
//function EnsureWWColumnExists(AWWDBGrid: TwwDBGrid;
//  const AFieldName, ACaption: string; AWidth: Integer): Integer;
//begin
//  Result := WWColumnIndexByName(AWWDBGrid, AFieldName);
//  if Result = - 1 then
//    Result := AWWDBGrid.Selected.Add(AFieldName + #9 + IntToStr(AWidth) + #9 +
//      ACaption + #9);
//  AWWDBGrid.ApplySelected;
//end;

procedure SortDataGrid( Sender: TObject; AFieldName: string );
label
  _construct_query;
const
  _START_ORDER_BY_ = '_START_ORDER_BY_';
  _END_ORDER_BY_ = '_END_ORDER_BY_';
var
  ADataSet          : TDataSet;
  AFieldOrigin      : string;
  ASQL              : TStrings;
  I                 : Integer;
  AStartOrderByZone : Integer;
  ACurrOrderBy      : string;
  ACurrMode         : string;
  AText             : string;

  // ---------------------------------------------------------------------------
  function _init: Boolean;
  var
    DS: TDataSet;
  begin
    Result:= False;
//    if Sender is TwwDBGrid then with Sender as TwwDBGrid do
//       begin
//         if Assigned(DataSource) and Assigned(DataSource.DataSet) then
//            DS:= DataSource.DataSet
//       end
//    else
    if Sender is TDBGrid then with Sender as TDBGrid do
       begin
         if Assigned(DataSource) and Assigned(DataSource.DataSet) then
            DS:= DataSource.DataSet;
       end
    else
       EXIT;

//    IQAssert( Assigned(DS) and (DS is TFDQuery), 'Procedure SortDataGrid is only compatible with a query dataset.');
    ADataSet:= TFDQuery(DS);
    Result:= True;
  end;

  // ---------------------------------------------------------------------------
  procedure _RetriveCurrentOrderBy;
  var
    S: string;
    I: Integer;
    ATokenCount: Integer;
    K: Integer;
  begin
    // retrieve: "order by whatever desc"
    S:= StrTran( Trim( ASQL[ AStartOrderByZone + 1 ]), '  ', ' ');
    ATokenCount:= NumToken( S, ' ');
    if ATokenCount = 0 then
       EXIT;

    // "order by Trim( a.ITEMNO ) desc" - get the "Trim( ITEMNO )"
//    if CompareText( IQString.GetToken( S, ' ', ATokenCount ), 'DESC') = 0 then
//       k:= ATokenCount - 1
//    else if CompareText( IQString.GetToken( S, ' ', ATokenCount ), 'ASC') = 0 then
//       k:= ATokenCount - 1
//    else
//       k:= ATokenCount;
//
//    for i:= 3 to k do
//      ACurrOrderBy:= ACurrOrderBy + IQString.GetToken( S, ' ', i );
//
//    // ASC or DESC
//    if CompareText( IQString.GetToken( S, ' ', ATokenCount ), 'DESC') = 0 then
//       ACurrMode:= 'DESC'
//    else
//       ACurrMode:= 'ASC'
  end;

// ---------------------------------------------------------------------------
begin
{$REGION 'Sorting wwDBGrid on title click'}
{
  1. only compatible with TFDQuery
  2. for each visible field in the grid assign its ORIGIN and set wwdbgrid.TitleButtons to True.
  3. remove any ORDER BY at the end of the SQL
     or
     change the ORDER BY to the following format:
-- _START_ORDER_BY_
order by arinvt_vendors_id, effect_date, quan
-- _END_ORDER_BY_

  4. on title click add IQMS.Common.Controls.SortDataGrid( Sender, AFieldName );
  5. ( optional) assign OnCalcTitleAttributes to highlight the sort column by calling:
     HighlightSortColumnOnCalcTitleAttributes( Sender, AFieldName, ASortFieldName, AFont, ABrush)
}
{$ENDREGION}

  // init and validate
  if not _init() then
     EXIT;

  if ADataSet.FindField(AFieldName) = nil then
     EXIT;

  AFieldOrigin:= ADataSet.FieldByName(AFieldName).Origin;
  if AFieldOrigin = '' then
     EXIT;

  ASQL:= TFDQuery(ADataSet).SQL;
  ACurrOrderBy:= '';
  ACurrMode   := '';  // ASC or DESC

  // start and end of order by
  AStartOrderByZone:= LinePosInList(_START_ORDER_BY_, ASQL );
  if AStartOrderByZone = -1 then
  begin
    ASQL.Add(Format('-- %s',[ _START_ORDER_BY_ ]));
    ASQL.Add(Format('-- %s',[ _END_ORDER_BY_ ]));
    goto _construct_query;
  end;

  _RetriveCurrentOrderBy;

//  IQString.DeleteStringsBetweenKeyWords( ASQL, _START_ORDER_BY_, _END_ORDER_BY_, AStartOrderByZone);

  _construct_query:

  AText:= Format('order by %s ', [ AFieldOrigin ]);

  // toggle asc vs desc
  if (CompareText( AFieldOrigin, ACurrOrderBy ) = 0) and (ACurrMode = 'ASC') then
      AText:= AText + ' DESC';

//  IQString.InsertStringsBetweenKeyWords( ASQL,  AText, _START_ORDER_BY_, _END_ORDER_BY_ );

  Reopen(ADataSet);
end;


procedure HighlightSortColumnOnCalcTitleAttributes(Sender: TObject; AFieldName, ASortFieldName: string; AFont: TFont; ABrush: TBrush);
begin
  if AFieldName = ASortFieldName then
     begin
       AFont.Color:= clNavy;
       AFont.Style:= AFont.Style + [ fsBold ];
     end
  else
     begin
       AFont.Color:= clBlack;
       AFont.Style:= AFont.Style - [ fsBold ];
     end
end;

function CheckHighlighted(Sender: TObject; Highlight: Boolean;
  AFont: TFont; ABrush: TBrush): Boolean;
begin
  Result := False;

  if Highlight then
    Exit(True);

//  if (Sender is TwwDBGrid) and
//    (dgMultiselect in TwwDBGrid(Sender).Options) and
//    (TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow) then
//    begin
//      ABrush.Color := clHighlight;
//      AFont.Color := clHighlightText;
//      Exit(True);
//    end;
end;

//procedure AssignWWColumnTitle( AGrid: TwwDBGrid; AFieldName, ACaption: string );
//var
//  i: Integer;
//begin
//  i:= IQMS.Common.Controls.WWColumnIndexByName(AGrid, AFieldName);
//  if i > -1 then
//    AGrid.Columns[i].DisplayLabel:= ACaption;
//end;

function DecodeInfoPowerSelectedString(ASelectedValue: string;
  var AFieldName, AFieldSize, ADisplayLabel: string): Boolean;
var
  i: Integer;
  sl: TStringList;
begin
  // Clear values
  AFieldName := '';
  AFieldSize := '';
  ADisplayLabel := '';
  sl := TStringList.Create;
  try
    // Populate the string list
    sl.Text := StringReplace(ASelectedValue, #9, #13,
      [rfReplaceAll, rfIgnoreCase]);
    // Loop the string list
    for i := 0 to sl.Count - 1 do
      // Ignore empty strings.  If the character is a #9, it will
      // return an empty string
      if Trim(sl.Strings[i]) > '' then
        begin
          // While looping, update the parts.  Only update a part
          // if it has not yet been populated.
          // Part 1:  Field name
          if AFieldName = '' then
            AFieldName := sl.Strings[i]
          // Part 2:  Field size
          else if AFieldSize = '' then
            AFieldSize := sl.Strings[i]
          // Part 3:  Display label
          else if ADisplayLabel = '' then
            ADisplayLabel := sl.Strings[i];
        end;
  finally
    sl.Free;
  end;
  // Return true if the something was found
  Result := (AFieldName > '') and (AFieldSize > '') and (ADisplayLabel > '');
end;

//procedure AssignWWColumnTitleEx(AGrid: TwwDBGrid; AFieldName, ACaption: string);
//var
//  i, x: Integer;
//  s: string;
//  AFieldNameEx, AFieldSizeEx, ADisplayLabelEx: string;
//begin
//  if Assigned(AGrid) then
//    // Loop the grid list of "selected" items
//    for i := 0 to AGrid.Selected.Count - 1 do
//      begin
//        // Divide the current line into its parts
//        if DecodeInfoPowerSelectedString(AGrid.Selected.Strings[i],
//          {var} AFieldNameEx, {var} AFieldSizeEx, {var} ADisplayLabelEx) then
//          begin
//            // Compare the field name for this line with the field name
//            // passed to the method.  Are they the same?
//            if CompareText(AFieldName, AFieldNameEx) = 0 then
//              begin
//                // Modify just this one line, passing the original
//                // field name and size, but changing the display label
//                // to the new value.
//                AGrid.Selected.Strings[i] := Format(
//                  '%s'#9'%s'#9'%s'#9#9,
//                  [AFieldName, AFieldSizeEx, ACaption]);
//                // Done; stop looping.
//                Break;
//              end;
//          end;
//      end;
//end;
//
//function IndexOfInfoPowerControlType(AGrid: TwwDBGrid;
//  AFieldName: string): Integer;
//
//  function _FieldName(ALine: string): string;
//  var
//    i: Integer;
//  begin
//    // The field name will always be the first chunk in the line.
//    // For example:
//    //  'NAME;CustomEdit;cmbGridGroupName;F'
//    //  'PK_HIDE;CheckBox;Y;N'
//    i := Pos(';', ALine);
//    if i > 0 then
//      Result := Copy(ALine, 1, i - 1)
//    else
//      Result := ALine;
//  end;
//
//var
//  i: Integer;
//begin
//  // Initialize
//  Result := -1;
//  // Loop the TwwDBGrid ControlType strings, find the line for the
//  // desired field, and return the item index for that line.
//  for i := 0 to AGrid.ControlType.Count - 1 do
//    if CompareText(_FieldName(AGrid.ControlType.Strings[i]),AFieldName) = 0 then
//      begin
//        Result := i;
//        Break;
//      end;
//end;
//
//procedure RemoveInfoPowerControlType(AGrid: TwwDBGrid; AFieldName: string);
//var
//  i: Integer;
//begin
//  // Get the item index of the desired ControlType string
//  i := IndexOfInfoPowerControlType(AGrid, AFieldName);
//  // If it exists in the list, delete it
//  if i > -1 then
//    AGrid.ControlType.Delete(i);
//end;

procedure CopyDBGridToClipboard( ADBGrid: TCustomGrid );
var
   i: Integer;
   ADataSet: TDataSet;
   AVisiFields: array of String;
   AColumnCount: Integer;
   AFieldText: array of String;
   AText: string;

   function _GetTrueColCount: Integer;
   var
      n: Integer;
   begin
     Result := 0;
     if not Assigned(ADBGrid) then EXIT;

     if ADBGrid is TDBGrid then
        begin
          for n := 0 to TDBGrid(ADBGrid).Columns.Count - 1 do
            if TDBGrid(ADBGrid).Columns[n].Visible then
               Inc(Result)
        end

//     else If ADBGrid is TwwDBGrid then
//        for n := 0 to TwwDBGrid(ADBGrid).Selected.Count - 1 do
//            Inc(Result);
   end;

   procedure _SetColumnArrays;
   var
      n1,n2: Integer;
      x: Integer;
   begin
     n2 := 0;
     if not Assigned(ADBGrid) then EXIT;

     if ADBGrid is TDBGrid then
        begin
         for n1 := 0 to TDBGrid(ADBGrid).Columns.Count - 1 do
           if TDBGrid(ADBGrid).Columns[n1].Visible then
              begin
                AVisiFields[n2] := TDBGrid(ADBGrid).Columns[n1].FieldName;
                Inc(n2);
              end
        end
//     else if ADBGrid is TwwDBGrid then
//        begin
//          for n1 := 0 to TwwDBGrid(ADBGrid).Selected.Count - 1 do
//              begin
//                AVisiFields[n2]:= TwwDBGrid(ADBGrid).Columns[n1].FieldName;
//                Inc(n2);
//              end;
//        end;
   end;

   procedure _SetFieldTextForCurRecord;
   var
      j: Integer;
   begin
     for j := Low(AVisiFields) to High(AVisiFields) do
      begin
        if (ADataSet.FieldByName(AVisiFields[j]).DataType in
            [ftDate, ftTime, ftDateTime]) then
            begin
               if ADataSet.FieldByName(AVisiFields[j]).AsDateTime > 0 then
                  AFieldText[j] := FormatDateTime('ddddd', ADataSet.FieldByName(AVisiFields[j]).AsDateTime)
            end
        else
           AFieldText[j] := ADataSet.FieldByName(AVisiFields[j]).AsString;
      end;
   end;

   function _GetDataSet: TDataSet;
   begin
     Result:= nil;
     if not Assigned(ADBGrid) then
        EXIT
     else if ADBGrid is TDBGrid then with TDBGrid(ADBGrid) do
        begin
          if Assigned(DataSource) then
             Result:= DataSource.DataSet
        end
//     else if ADBGrid is TwwDBGrid then with TwwDBGrid(ADBGrid) do
//        begin
//          if Assigned(DataSource) then
//             Result:= DataSource.DataSet
//        end;
   end;

   function _AddToClipboard: string;
   var
      i: Integer;
   begin
     Result:= '';
     for i:= Low(AVisiFields) to High(AVisiFields) do
     begin
       Result:= Result + AFieldText[i] + #9;
     end;
     Result:= Result + #13;
   end;


begin
   if not Assigned(ADBGrid) then Exit;

   ADataSet := _GetDataSet();
   if not Assigned(ADataSet) then Exit;

   AText:= '';
   with ADBGrid do
     begin
       AColumnCount := _GetTrueColCount;

       SetLength(AVisiFields, AColumnCount); // Visible fields (field names)
       SetLength(AFieldText,  AColumnCount); // Row text array (data)

       // Set the width array only once
       _SetColumnArrays;
       ADataSet.First;
       while not ADataSet.EOF do
       begin
         // Get the data as a text array
         _SetFieldTextForCurRecord;
         // Add to clipboard
         AText:= AText + _AddToClipboard;
         // Next data record
         ADataSet.Next;
       end;

       Clipboard.AsText:= AText;
     end;
end;


//procedure AssignSelectedFromDataSet(AGrid: TwwDBGrid; ADataSet: TDataSet);
//var
//  i: Integer;
//begin
//  if Assigned(AGrid) and Assigned(ADataSet) then
//    begin
//      AGrid.Selected.Clear;
//      for i := 0 to ADataSet.FieldCount - 1 do
//        if ADataSet.Fields[i].Visible then
//          begin
//            AGrid.Selected.Add(Format('%s'#9'%d'#9'%s'#9#9,
//             [ADataSet.Fields[i].FieldName, ADataSet.Fields[i].DisplayWidth,
//             ADataSet.Fields[i].DisplayLabel ]));
//          end;
//      AGrid.ApplySelected;
//    end;
//end;
//
//function SelectedListToStringList( wwDBGrid: TwwDBGrid; AList: TStringList; AFieldName: string = 'ID'): Boolean;
//var
//  I: Integer;
//begin
//  AList.Clear;
//  Result:= FALSE;
//  with wwDBGrid, DataSource do
//  begin
//     if DataSet.Eof and DataSet.Bof then
//        EXIT;
//
//     if SelectedList.Count > 0 then
//        for I:= 0 to SelectedList.Count - 1 do
//        begin
//          DataSet.GotoBookmark( SelectedList.Items[ I ]);
//          AList.Add( DataSet.FieldByName( AFieldName ).asString );
//        end
//     else
//        AList.Add( DataSet.FieldByName( AFieldName ).asString );
//  end;
//  Result:= AList.Count > 0;
//end;
//
//
//
//procedure AdjustDateTimePicker(ADateTimePicker: TwwDBDateTimePicker);
//var
//  AYear, AMonth, ADay: Word;
//begin
//  if not Assigned(ADateTimePicker) then
//    EXIT;
//  try
//    DecodeDate(Date(), AYear, AMonth, ADay);
//    with ADateTimePicker do
//      CalendarAttributes.PopupYearOptions.StartYear := AYear - 10;
//  except // full suppress
//  end;
//end;
//
//procedure AdjustMonthCalendar(AMonthCalendar: TwwDBMonthCalendar);
//var
//  AYear, AMonth, ADay: Word;
//begin
//  if not Assigned(AMonthCalendar) then
//    EXIT;
//  try
//    DecodeDate(Date(), AYear, AMonth, ADay);
//    AMonthCalendar.PopupYearOptions.StartYear := AYear - 10;
//  except // full suppress
//  end;
//end;

procedure RefreshComponents(const AObjects: array of TWinControl;
  AOffset: Integer; SR: TIQWebSecurityRegister);
var
  i: Integer;
begin
  for i := 0 to high(AObjects) do
    if AObjects[i].Visible then
      begin
        AObjects[i].Visible := False;
        AObjects[i].Visible := True and
          ( not Assigned(SR) or SR.Visible[AObjects[i].Name]);
        if AOffset > 0 then
          AObjects[i].Width := AObjects[i].Parent.Width - AOffset;
      end;
end;

procedure RefreshComponentsEx(const AObjects: array of TWinControl;
  SR: TIQWebSecurityRegister);
var
  i: Integer;
  W: Integer;
begin
  for i := 0 to high(AObjects) do
    if AObjects[i].Visible then
      begin
        // W:= AObjects[ I ].Width;
        // AObjects[ I ].Width:= 0;
        // AObjects[ I ].Width:= W;

        AObjects[i].Visible := False;
        AObjects[i].Visible := True and
          ( not Assigned(SR) or SR.Visible[AObjects[i].Name]);
      end;
end;

procedure CreateLegendOn(AParent: TWinControl; AValues: array of Variant);
var
  i, N: Integer;
  ALeftOffset: Integer;
  AShape: TShape;
  ABrushColor: TColor;
  APenColor: TColor;
  AHint: string;

  function CreateShape: TShape;
  begin
    Result := TShape.Create(AParent.Owner);
    with Result do
      begin
        Left := ALeftOffset;
        Top := (AParent.Height - 11) div 2;
        Width := 11;
        Height := 11;
        Hint := AHint;
        ShowHint := True;
        Anchors := [akTop, akLeft];
        Brush.Color := ABrushColor;
        Pen.Color := APenColor;
        Shape := stSquare;
      end;
  end;

begin
  ALeftOffset := 2;
  i := 0;
  N := high(AValues);
  while i < N do
    begin
      // AValues is array of the following values: brush1, front1, hint1, brush2, front2, hint2,  brush3, front3, hint3 etc
      ABrushColor := AValues[i];
      APenColor := AValues[i + 1];
      AHint := AValues[i + 2];

      AShape := CreateShape;
      AShape.Parent := AParent;

      Inc(ALeftOffset, 13);
      Inc(i, 3);
    end;

  if ALeftOffset > 0 then
    begin
      AParent.Visible := True;
      AParent.Width := ALeftOffset; //  - 2;
    end;
end;

procedure EnsureCompletelyAlignedToRightOf(AParent, AChild: TWinControl);
begin
  { attemp to fix Maximizing sales orders and quoting - the display doesn't repaint until you click on a field }
  if not Assigned(AChild) or not Assigned(AParent) then
    EXIT;

  if not AChild.Visible then
    EXIT;

  { check if the child is within 20 pixels from the parent right border }
  if AChild.Left + AChild.Width < AParent.Width - 25 then
    AChild.Left := AParent.Width;
  // this should throw this panel as far right as possible
end;

procedure SortMenuOptions(AMenuItem: TMenuItem);
var
  AList: TStringList;
  i: Integer;
begin
  AList := TStringList.Create;
  try
    // load and remove original menu items
    for i := AMenuItem.Count - 1 downto 0 do
      begin
        if AMenuItem.Items[i].Caption <> '-' then
          begin
            AMenuItem.Items[i].Break := TMenuBreak.mbNone;
            AList.AddObject(StrTran(AMenuItem.Items[i].Caption, '&', ''),
              AMenuItem.Items[i]);
          end;

        AMenuItem.Delete(i);
      end;

    // sort
    AList.Sorted := True;

    // assgin back
    for i := 0 to AList.Count - 1 do
      AMenuItem.Add(AList.Objects[i] as TMenuItem);

  finally
    AList.Free;
  end;
end;

procedure BarBreakMenuOptions(AMenuItem: TMenuItem; ABreakCount: Integer);
var
  i: Integer;
begin
  for i := 0 to AMenuItem.Count - 1 do
    begin
      if i = (AMenuItem.Count div ABreakCount) + (AMenuItem.Count mod ABreakCount) then
        AMenuItem[i].Break := mbBarBreak;
    end;
end;

procedure Blink(AControl: TControl; ACount: Integer);
const
  c_delay_int: Integer = 100;
var
  i: Integer;
  AVisible: Boolean;
begin
  AVisible := AControl.Visible;
  try
    for i := 1 to ACount do
      with AControl do
        begin
          Visible := not Visible;
          Update;
          Sleep(c_delay_int);
          Visible := not Visible;
          Update;
          Sleep(c_delay_int);
        end;
  finally
    AControl.Visible := AVisible;
  end;
end;

//function FindCustomEditControlByFieldName(AWWDBGrid: TwwDBGrid;
//  AFieldName: string; var ACustomEditControl: TWinControl): Boolean;
//var
//  AControlType: string;
//  AParameters: string;
//  AName: string;
//  i: Integer;
//begin
//  i := 1;
//  Result := False;
//  ACustomEditControl := nil;
//
//  AWWDBGrid.GetControlInfo(AFieldName, AControlType, AParameters);
//  if AControlType = 'CustomEdit' then
//    begin
////      AName := wwStr.strGetToken(AParameters, ';', i);
//      ACustomEditControl := AWWDBGrid.GetComponent(AName);
//      Result := Assigned(ACustomEditControl);
//    end;
//end;

procedure CheckAssignEmbeddedControlsPopupMenuOf(AParentControl: TWinControl);
var
  i: Integer;
  AChildControl: TWinControl;

begin
  // {TwwDBGrid}
  // This did not always work! 03-30-2012
  // if (AParentControl is TwwDBGrid) then
  // begin
  // if Assigned( TwwDBGrid(AParentControl).PopupMenu ) then with TwwDBGrid(AParentControl) do
  // for I:= 0 to ControlCount - 1 do
  // if (Controls[ I ] is TCustomEdit) and not Assigned(TEdit(Controls[ I ]).PopupMenu) then
  // TEdit(Controls[ I ]).PopupMenu:=  TwwDBGrid( AParentControl ).PopupMenu;
  // end;
//
//  if (AParentControl is TwwDBGrid) then
//    begin
//      if Assigned(TwwDBGrid(AParentControl).PopupMenu) then
//        with TwwDBGrid(AParentControl) do
//          for i := 0 to FieldCount - 1 do
//            if FindCustomEditControlByFieldName(TwwDBGrid(AParentControl),
//              Fields[i].FieldName, AChildControl) and
//              not Assigned(TEdit(AChildControl).PopupMenu) then
//              begin
//                TEdit(AChildControl).PopupMenu := TwwDBGrid(AParentControl)
//                  .PopupMenu;
//              end;
//    end;

  { for future use - add here other components (perhaps TDBGrid) that require parent popupmenu to be propagated to the children controls }
end;

procedure SlidePanelVertically(const APanel: TCustomPanel;
  const ATargetHeight: Integer; const ARate: Byte);
var
  ACurrentHeight, X, i, j, i_inc_value, range: Integer;
  AFinalArray: array of Integer;
  AParent: TWinControl;
  ADoubleBuffered: Boolean;
begin
  if not Assigned(APanel) or (ARate <= 0) then
    EXIT;

  try
    ACurrentHeight := APanel.Height;
    AParent := APanel.Parent;
    ADoubleBuffered := AParent.DoubleBuffered;
    AParent.DoubleBuffered := True;

    range := Abs(ATargetHeight - ACurrentHeight);
    if range = 0 then
      EXIT;

    i_inc_value := range div ARate;
    if i_inc_value = 0 then
      i_inc_value := 1;

    SetLength(AFinalArray, 0);
    X := i_inc_value;
    repeat
      X := X div 2;
      i := high(AFinalArray) + 1;
      SetLength(AFinalArray, i + 1);
      AFinalArray[i] := X;
    until X <= 1;

    // Expand
    if ACurrentHeight < ATargetHeight then
      begin
        repeat
          j := APanel.Height + i_inc_value;
          if j >= ATargetHeight - i_inc_value then
            Break;
          APanel.Height := j;
          AParent.Invalidate;
          Application.ProcessMessages;
        until APanel.Height >= ATargetHeight - i_inc_value;

        for i := low(AFinalArray) to high(AFinalArray) do
          begin
            j := APanel.Height + AFinalArray[i];
            if j >= ATargetHeight then
              Break;
            APanel.Height := j;
            AParent.Invalidate;
            Application.ProcessMessages;
          end;
        APanel.Height := ATargetHeight;
      end
      // Collapse
    else
      begin
        repeat
          j := APanel.Height - i_inc_value;
          if j <= ATargetHeight + i_inc_value then
            Break;
          APanel.Height := j;
          AParent.Invalidate;
          Application.ProcessMessages;
        until APanel.Height <= ATargetHeight + i_inc_value;

        for i := low(AFinalArray) to high(AFinalArray) do
          begin
            j := APanel.Height - AFinalArray[i];
            if j <= ATargetHeight then
              Break;
            APanel.Height := j;
            AParent.Invalidate;
            Application.ProcessMessages;
          end;
        APanel.Height := ATargetHeight;
      end;
  finally
    AParent.DoubleBuffered := ADoubleBuffered;
  end;
end;

procedure SlidePanelHorizontally(const APanel: TCustomPanel;
  const ATargetWidth: Integer; const ARate: Byte = 3);
var
  ACurrentWidth, X, i, j, i_inc_value, range: Integer;
  AFinalArray: array of Integer;
  AParent: TWinControl;
  ADoubleBuffered: Boolean;
begin
  if not Assigned(APanel) or (ARate <= 0) then
    EXIT;

  try
    ACurrentWidth := APanel.Width;
    AParent := APanel.Parent;
    ADoubleBuffered := AParent.DoubleBuffered;
    AParent.DoubleBuffered := True;

    range := Abs(ATargetWidth - ACurrentWidth);
    if range = 0 then
      EXIT;

    i_inc_value := range div ARate;
    if i_inc_value = 0 then
      i_inc_value := 1;

    SetLength(AFinalArray, 0);
    X := i_inc_value;
    repeat
      X := X div 2;
      i := high(AFinalArray) + 1;
      SetLength(AFinalArray, i + 1);
      AFinalArray[i] := X;
    until X <= 1;

    // Expand
    if ACurrentWidth < ATargetWidth then
      begin
        repeat
          j := APanel.Width + i_inc_value;
          if j >= ATargetWidth - i_inc_value then
            Break;
          APanel.Width := j;
          AParent.Invalidate;
          Application.ProcessMessages;
        until APanel.Width >= ATargetWidth - i_inc_value;

        for i := low(AFinalArray) to high(AFinalArray) do
          begin
            j := APanel.Width + AFinalArray[i];
            if j >= ATargetWidth then
              Break;
            APanel.Width := j;
            AParent.Invalidate;
            Application.ProcessMessages;
          end;
        APanel.Width := ATargetWidth;
      end
      // Collapse
    else
      begin
        repeat
          j := APanel.Width - i_inc_value;
          if j <= ATargetWidth + i_inc_value then
            Break;
          APanel.Width := j;
          AParent.Invalidate;
          Application.ProcessMessages;
        until APanel.Width <= ATargetWidth + i_inc_value;

        for i := low(AFinalArray) to high(AFinalArray) do
          begin
            j := APanel.Width - AFinalArray[i];
            if j <= ATargetWidth then
              Break;
            APanel.Width := j;
            AParent.Invalidate;
            Application.ProcessMessages;
          end;
        APanel.Width := ATargetWidth;
      end;
  finally
    AParent.DoubleBuffered := ADoubleBuffered;
  end;
end;

procedure FreeControls(AWinControl: TWinControl);
var
  i: Integer;
begin
  if Assigned(AWinControl) then
    for i := AWinControl.ControlCount - 1 downto 0 do
      begin
        //AWinControl.RemoveControl(AWinControl.Controls[i]);
        AWinControl.Controls[i].Free;
      end;
end;

procedure FreeControlsExcept(AWinControl: TWinControl; AControls: array of TControl);
var
  i: Integer;
begin
  if Assigned(AWinControl) then
    for i := AWinControl.ControlCount - 1 downto 0 do
      begin
        if not ControlInList(AWinControl.Controls[i], AControls)  then
          begin
            //AWinControl.RemoveControl(AWinControl.Controls[i]);
            AWinControl.Controls[i].Free;
          end;
      end;
end;

function ControlInList(AControl: TControl; AControlList: array of TControl): Boolean;
var
  i: Integer;
begin
 for i := Low(AControlList) to High(AControlList) do
   begin
     if (AControl = AControlList[i]) then
      begin
        Result := True;
        Break;
      end;
   end;
end;

function VisibleControlCount(AControl: TWinControl): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to AControl.ControlCount - 1 do
   if AControl.Controls[i].Visible then
     Inc(Result);
end;

function FindShapeControl(const AOwner: TWinControl;
  const AControlName: string): TShape;
var
  i: Integer;
begin
  Result := nil;
  for i := AOwner.ControlCount - 1 downto 0 do
    if (AOwner.Controls[i] is TShape) and
      (CompareText(TShape(AOwner.Controls[i]).Name, AControlName) = 0) then
      begin
        Result := TShape(AOwner.Controls[i]);
        Break;
      end;
end;

procedure FrameButton(const AButton: TButton; AFramed: Boolean);
begin
  Application.ProcessMessages;
  FrameControl(AButton, AFramed);
end;

procedure FrameButton(const AButton: TSpeedButton; AFramed: Boolean);
begin
  Application.ProcessMessages;
  FrameControl(AButton, AFramed);
end;

procedure FrameButton(const AButton: TBitBtn; AFramed: Boolean);
begin
  Application.ProcessMessages;
  FrameControl(AButton, AFramed);
end;

procedure FrameControl(const AControl: TControl; AFramed: Boolean;
 AColor: TColor);
const
  cBuffer: Integer = 2;
var
  AWinControl: TWinControl;
  AFrame: TShape; // Vcl.ExtCtrls.pas
  AFrameName: string;
  ARect: TRect;
begin
  if Assigned(AControl) then
    begin
      // Get the owner (parent) form
      AWinControl := AControl.Parent;
      if Assigned(AWinControl) then
        begin
          // Get the expected frame name
          AFrameName := Format('shpDynamicButtonFrame_%s', [AControl.Name]);
          // Find the existing button frame, if it exists
          AFrame := FindShapeControl(AWinControl, AFrameName);
          // If the frame does not yet exist, then go ahead and created it,
          // even if it won't be visible.
          if AFrame = nil then
            begin
              AFrame := TShape.Create(AWinControl);
              AFrame.Name := AFrameName;
              AFrame.Parent := AControl.Parent;
            end;
          // Show or hide the frame
          if Assigned(AFrame) then
            begin
              AControl.BringToFront;
              ARect := AControl.BoundsRect;
              InflateRect(ARect, (cBuffer + 1), cBuffer);
              AFrame.BoundsRect := ARect;
              AFrame.Pen.Color := AColor;
              AFrame.Pen.Width := cBuffer;
              AFrame.Anchors := AControl.Anchors;
              AFrame.Visible := AFramed;
            end;
        end;
    end;
end;

procedure PrepareButtonFrame(const AButton: TSpeedButton);
const
  cBuffer: Integer = 2;
var
  ARect: TRect;
begin
  if Assigned(AButton) then
    begin
      ARect := AButton.BoundsRect;
      InflateRect(ARect, -(cBuffer + 1), -cBuffer);
      AButton.BoundsRect := ARect;
      AButton.Flat := False;
      FrameButton(AButton, False);
    end;
end;

procedure PrepareButtonFrames(const AButtons: array of TSpeedButton);
var
  AButton: TSpeedButton;
begin
  for AButton in AButtons do
    PrepareButtonFrame(AButton);
end;

procedure FrameButtonsIfDown(const AButtons: array of TSpeedButton);
var
  AButton: TSpeedButton;
begin
  for AButton in AButtons do
    FrameButton(AButton, AButton.Down);
end;

procedure ApplySystemFontName(const ALabels: array of TLabel);
//var
//  ALabel: TLabel;
begin
//  for ALabel in ALabels do
//    ALabel.Font.Name := iqsysinfo.SystemFontName;
end;

//procedure AlignClientWWFilterDialogCriteria( Dialog: TwwFilterDlg );
//begin
//  dialog.SelectNotebook.Align:= TAlign.alTop;
//  dialog.FilterValueClearButton.Anchors:= [akRight, akTop];
//  dialog.MinValueClearButton.Anchors:= [akRight, akTop];
//  dialog.MaxValueClearButton.Anchors:= [akRight, akTop];
//  dialog.FilterValueEdit.Anchors:= [akLeft, akTop, akRight];
//
//  dialog.MinValueEdit.Anchors:= [akLeft, akTop, akRight];
//  dialog.MinDateEdit.Anchors:= [akLeft, akTop, akRight];
//  dialog.MaxValueEdit.Anchors:= [akLeft, akTop, akRight];
//  dialog.MaxDateEdit.Anchors:= [akLeft, akTop, akRight];
//
//  dialog.OKCancelPanel.Align:= TAlign.alRight;
//  dialog.fieldListpanel.Align:= TAlign.alLeft;
//  dialog.FieldCriteriaPanel.Align:= TAlign.alClient;
//  dialog.Constraints.MinHeight:= 300;
//end;

function MaxPanelHeightForVisibleControls(APanel: TPanel): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to APanel.ControlCount - 1 do
   if APanel.Controls[i].Visible then
     Result := Max(Result, APanel.Controls[i].Top + APanel.Controls[i].Height);
end;

{$REGION 'Common dialogs'}
function DialogFilterIndexOf(const AOpenDialog: TOpenDialog; const AExtension: string): Integer;
var
  AFilterList: string;
  sl: TStringList;
  i, AIndex: Integer;
  AFound: Boolean;
begin
  if Assigned(AOpenDialog) and (AExtension > '') then
    begin
      AFilterList := AOpenDialog.Filter;
      AIndex := 0;
      AFound := False;
      sl := TStringList.Create;
      try
        sl.Text := StringReplace(AFilterList, '|', #13,
          [rfReplaceAll, rfIgnoreCase]);
        for i := 0 to sl.Count - 1 do
          begin
            if Odd(i) then
              begin
                Inc(AIndex);
                if Pos(AExtension, sl.Strings[i]) > 0 then
                  begin
                    AFound := True;
                    Break;
                  end;
              end;
          end;
        if AFound then
          Result := AIndex
        else
          Result := AOpenDialog.FilterIndex;
      finally
        sl.Free;
      end;
    end;
end;

function DialogFilterIndexOf(const ASaveDialog: TSaveDialog; const AExtension: string): Integer;
var
  AFilterList: string;
  sl: TStringList;
  i, AIndex: Integer;
  AFound: Boolean;
begin
  if Assigned(ASaveDialog) and (AExtension > '') then
    begin
      AFilterList := ASaveDialog.Filter;
      AIndex := 0;
      AFound := False;
      sl := TStringList.Create;
      try
        sl.Text := StringReplace(AFilterList, '|', #13,
          [rfReplaceAll, rfIgnoreCase]);
        for i := 0 to sl.Count - 1 do
          begin
            if Odd(i) then
              begin
                Inc(AIndex);
                if Pos(AExtension, sl.Strings[i]) > 0 then
                  begin
                    AFound := True;
                    Break;
                  end;
              end;
          end;
        if AFound then
          Result := AIndex
        else
          Result := ASaveDialog.FilterIndex;
      finally
        sl.Free;
      end;
    end;
end;

{$ENDREGION 'Common dialogs'}

end.
