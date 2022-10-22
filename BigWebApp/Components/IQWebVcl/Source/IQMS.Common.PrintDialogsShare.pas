unit IQMS.Common.PrintDialogsShare;

interface

uses
  IQMS.Common.UCRPE32,
  Winapi.Windows,
  System.SysUtils,
  CommDlg,
  System.Classes,
  Vcl.Forms,
  Vcl.Printers,
  WinSpool,
  IQMS.WebVcl.SoftEPlant,
  IQMS.Common.ResStrings,
  WinApi.ActiveX,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  IQMS.Common.CustomPrintInterface,
  IQMS.Common.CustomPrintClasses,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniMultiItem,
  uniComboBox,
  IQMS.WebVcl.ResourceStrings,
  uniDBComboBox;

const
  cAUTO_EFORM_FOLDER = 'auto_eform';
  cAUTO_EFORM_VENDO_FOLDER = 'auto_eform_vendor';

  {Sep-9-06 - Jason - This is no longer needed as the crpe fixes this in cr9 and greater}
  procedure FixPortProblemWhenPrintedToScreen1stTimeFromCRW;

  function IQSetPrinter( APrinterName: String ): Boolean;

  function GetSelectedPrinterName: string;
  function GetPrinterName(const AIndex: Integer): string;

  function GetSelectedPaperBin( var APaperBinName:String ): boolean;

  function GetSelectedDuplexMode( var ADuplex:Integer ): Boolean;

  {RunSQL to insert into repdef_log. Called from Prn_Doc, IQRepDef, IQPrint}
  procedure InternalWriteToRepdefLog( AReportName, AUserName, ADestination: string; AStartTime: TDateTime  );

  // Print a binary file
  function PrintBinary(ALines: TStringList; ATitle: String = ''; APrinter: String = '' ): Boolean;
  function PrintBinaryMemoryStream(AMemoryStream: TMemoryStream; ATitle: String = ''; APrinter: String = '' ): Boolean;
  function PrintBinaryFile(AFileName: TFileName; ATitle: String = ''; APrinter: String = '' ): Boolean;


  // Print a binary file
  function PrintTextFile(AFileName: TFileName; ATitle: String = ''; APrinter: String = '' ): Boolean;
  function PrintText(ALines: TStringList; ATitle: String = ''; APrinter: String = '' ): Boolean;
  procedure PrintStringGrid(Grid: TUniStringGrid; Title: string; Orientation: TPrinterOrientation = poPortrait);

  function GetFileFormatElementName( AKey: string ): string;

  function PrintWindowsTestPage(APrinter: String = ''): Boolean;

type
  TAssignDestination = procedure( Crpe:TCrpe; CRDotNetObject:Variant ) of object;
type
  TOutputTo = ( otNone, otWindow, otPrinter, otExport, otEmail, otFax );

// Managed Enumations to pass to CRXI.  Do not reorder these records!!!
type
  TDestinationOptions = ( dtToWindow, dtToPrinter, dtToExport );

type
  TExportOptions = (dtNoFormat,
                    dtCrystalReport,
                    dtRichText,
                    dtWordForWindows,
                    dtExcel,
                    dtAdobeAcrobatPDF,
                    dtHTML32,
                    dtHTML40,
                    dtExcelRecord,
                    dtTextFormat,
                    dtSeparatedValues,
                    dtTabSeparatedValues,
                    dtEditableRTF);
const
  ExportFileTypeCaption: array[TExportOptions] of String = (
    '',
    IQMS.WebVcl.ResourceStrings.cTXT0000500, //  'Crystal Report';
    IQMS.WebVcl.ResourceStrings.cTXT0000501, //  'Rich Text Format';
    IQMS.WebVcl.ResourceStrings.cTXT0000502, //  'Microsoft Word for Windows';
    IQMS.WebVcl.ResourceStrings.cTXT0000503, //  'Microsoft Excel';
    IQMS.WebVcl.ResourceStrings.cTXT0000504, //  'Adobe Acrobat PDF';
    IQMS.WebVcl.ResourceStrings.cTXT0000505, //  'HTML (32)';
    IQMS.WebVcl.ResourceStrings.cTXT0000506, //  'HTML (40)';
    IQMS.WebVcl.ResourceStrings.cTXT0000507, //  'Microsoft Excel - Data Only';
    IQMS.WebVcl.ResourceStrings.cTXT0000508, //  'Plain Text Format (ASCII)';
    IQMS.WebVcl.ResourceStrings.cTXT0000509, //  'Comma Separated Values (CSV)';
    IQMS.WebVcl.ResourceStrings.cTXT0000510, //  'Tab Separated Values';
    IQMS.WebVcl.ResourceStrings.cTXT0000511  //  'Microsoft Word';
   );

  ExportFileTypeExt: array[TExportOptions] of String = (
    '',
    '.rpt',
    '.rtf',
    '.doc',
    '.xls',
    '.pdf',
    '.htm',
    '.htm',
    '.xls',
    '.txt',
    '.csv',
    '.txt',
    '.doc');

  /// <summary> Common dialog filter strings. </summary>
  ExportFileTypeCommonDialogFilter: array[TExportOptions] of String = (
   IQMS.WebVcl.ResourceStrings.cTXT0000512, //  'Any File (*.*)|*.*|';
   IQMS.WebVcl.ResourceStrings.cTXT0000513, //  'Crystal Report (*.rpt)|*.rpt|';
   IQMS.WebVcl.ResourceStrings.cTXT0000514, //  'Rich Text Format (*.rtf)|*.rtf|';
   IQMS.WebVcl.ResourceStrings.cTXT0000515, //  'Microsoft Word Document (*.doc)|*.doc|';
   IQMS.WebVcl.ResourceStrings.cTXT0000516, //  'Microsoft Excel (*.xls)|*.xls|';
   IQMS.WebVcl.ResourceStrings.cTXT0000517, //  'Adobe Acrobat PDF (*.pdf)|*.pdf|';
   IQMS.WebVcl.ResourceStrings.cTXT0000518, //  'HTML (*.htm)|*.htm|';
   IQMS.WebVcl.ResourceStrings.cTXT0000519, //  'HTML 4 (*.htm)|*.htm|';
   IQMS.WebVcl.ResourceStrings.cTXT0000520, //  'Microsoft Excel (Data Only) (*.xls)|*.xls|';
   IQMS.WebVcl.ResourceStrings.cTXT0000521, //  'Plain Text Format (*.txt)|*.txt|';
   IQMS.WebVcl.ResourceStrings.cTXT0000522, //  'Comma Separated Values (.csv)|*.csv|';
   IQMS.WebVcl.ResourceStrings.cTXT0000523, //  'Tab Separated Values (*.txt)|*.txt|';
   IQMS.WebVcl.ResourceStrings.cTXT0000524  //  'Microsoft Word (*.doc)|*.doc|';
   );

  /// <summary> Supported Crystal file types on Print dialogs. </summary>
  PrintDlgFileTypes = [
    dtRichText,
    dtEditableRTF,
    dtExcel,
    dtAdobeAcrobatPDF,
    dtTextFormat,
    dtSeparatedValues
    ];

  /// <summary> Supported Crystal file types on the Report Definition dialog. </summary>
  RepDefDlgFileTypes = [
    dtRichText,
    dtEditableRTF,
    dtExcel,
    dtAdobeAcrobatPDF,
    dtHTML40,
    dtExcelRecord,
    dtTextFormat,
    dtSeparatedValues];

type
  { TPrintDocsCustomFileTypeCargo}
  TPrintDlgFileTypeCargo = class
    FileType: TExportOptions;
    constructor Create(AFileType: TExportOptions);
  end;

  /// <summary> Load standard Report Definition file types for "Print" form
  /// into a combo box.
  /// </summary>
  procedure LoadRepDefFileTypeCombo_PrnDlg(AComboBox: TUniComboBox);
  /// <summary> Load standard Report Definition file types for the "Print
  // Report" (Report Definition) form into a combo box.
  /// </summary>
  procedure LoadRepDefFileTypeCombo_RepDefDlg(AComboBox: TUniComboBox); overload;
  procedure LoadRepDefFileTypeCombo_RepDefDlg(AComboBox: TUniDBComboBox); overload;
  /// <summary> Get the selected file type from a combo box. </summary>
  function GetSelectedExportOption(AComboBox: TUniComboBox): TExportOptions;
  /// <summary> Set the selected file type in a combo box. </summary>
  procedure SetSelectedExportOption(AComboBox: TUniComboBox; AFileType: TExportOptions);
  /// <summary>Get the ItemIndex of the given export option.</summary>
  function ItemIndexOfExportOption(AOption: TExportOptions): Integer;
  /// <summary>Get the Export Option for the given ItemIndex.</summary>
  function ExportOptionOfItemIndex(AItemIndex: Integer): TExportOptions;
  /// <summary Change the file extension for a given file name so that
  /// it matches the export option. </summary>
  function ChangeFileExtForExportOption(const AFileName: string;
    const AOption: TExportOptions): string;


// End Managed Enumations to pass to CRXI.

(*
// NOTE:  Moved to IQMS.CustomPrint.pas
type

  TPrintHeaderEvent =
    procedure(APageNumber: Integer; ATextRect : TRect) of object;
  TPrintFooterEvent =
    procedure(APageNumber: Integer; ATextRect : TRect) of object;

  TCustomPrint = class(TComponent)
  private
   {Private declarations}
    FHeaderCaption: String;
    FRightMargin: Single;
    FLinesPerInch: Single;
    FLeftMargin: Single;
    FBottomMargin: Single;
    FTopMargin: Single;
    //FFont: TFont;
    FLines: TStringList;
    FShowPrintFinishedDlg: Boolean;
    FShowHeader: Boolean;
    FShowFooter: Boolean;
    F_Y_resolution: Integer;
    F_X_resolution: Integer;
    FPageRect: TRect;
    FTextRect: TRect;
    FFooterRect: TRect;
    FHeaderRect: TRect;
    FLineHeight: Integer;
    FPageCount: Integer;
    FHeaderOnFirstPage: Boolean;
    FFooterOnFirstPage: Boolean;

    // Returns number of pages
    function PrintStrings(ALines: TStringList;
                          ACountPagesOnly: Boolean;
                          AOnPrintHeader: TPrintHeaderEvent;
                          AOnPrintFooter: TPrintFooterEvent): Integer;

    procedure CalcPrintRects;
    procedure ClearRect(var R: TRect);
    function GetCanvasTextHeight: Integer;
    function GetCanvasFont: TFont;
    procedure SetCanvasFont(const Value: TFont);
    procedure SafeAssignFont(const AFromFont: TFont; var AToFont: TFont);
    function GetOrientation: TPrinterOrientation;
    procedure SetOrientation(const Value: TPrinterOrientation);
    procedure SetCanvasFontName(const Value: String);
    procedure SetCanvasFontSize(const Value: Integer);
    procedure SetCanvasFontStyles(const Value: TFontStyles);
  protected
   {Protected declarations}
   procedure OnPrintHeader(APageNumber: Integer; ATextRect : TRect); virtual;
   procedure OnPrintFooter(APageNumber: Integer; ATextRect : TRect); virtual;
  public
   {Public declarations}
   constructor Create(AOwner: TComponent);
   destructor Destroy; override;

   procedure Execute;

   // Returns number of pages (no pages will print)
   function CountPages: Integer;

   procedure StartDoc;
   procedure PrintLine(const ALeft, ATop: Integer; AText: String);
   procedure PrintFooter(const APageNumber: Integer = 1);
   procedure PrintHeader(const APageNumber: Integer = 1);
   procedure EndDoc;
  published
   {Published declarations}
   property Lines: TStringList read FLines write FLines;
   property HeaderCaption: String read FHeaderCaption write FHeaderCaption;
   property LeftMargin: Single read FLeftMargin write FLeftMargin;
   property RightMargin: Single read FRightMargin write FRightMargin;
   property TopMargin: Single read FTopMargin write FTopMargin;
   property BottomMargin: Single read FBottomMargin write FBottomMargin;
   property LinesPerInch: Single read FLinesPerInch write FLinesPerInch;

   property Font: TFont read GetCanvasFont; //  write SetCanvasFont;
   property FontName: String write SetCanvasFontName;
   property FontSize: Integer write SetCanvasFontSize;
   property FontStyle: TFontStyles write SetCanvasFontStyles;

   property Orientation: TPrinterOrientation read GetOrientation write SetOrientation;
   property ShowPrintFinished: Boolean read FShowPrintFinishedDlg write FShowPrintFinishedDlg;
   property ShowHeader: Boolean read FShowHeader write FShowHeader;
   property ShowFooter: Boolean read FShowFooter write FShowFooter;
   property HeaderOnFirstPage: Boolean read FHeaderOnFirstPage write FHeaderOnFirstPage default True;
   property FooterOnFirstPage: Boolean read FFooterOnFirstPage write FFooterOnFirstPage default True;

   property X_resolution: Integer read F_X_resolution;  { horizontal printer resolution, in dpi }
   property Y_resolution: Integer read F_Y_resolution;  { vertical printer resolution, in dpi }
   property PageRect: TRect read FPageRect;             { total page, in paper coordinates }
   property TextRect: TRect read FTextRect;             { output area, in canvas coordinates }
   property HeaderRect: TRect read FHeaderRect;         { total page, in paper coordinates }
   property FooterRect: TRect read FFooterRect;         { total page, in paper coordinates }
   property DefaultLineHeight: Integer read FLineHeight;
   property PageCount: Integer read FPageCount;

   property CanvasTextHeight: Integer read GetCanvasTextHeight;
   function CanvasTextWidth(const AText: String): Integer;
end;
*)

// check append to auto_eform table.
type
  TAutoEForm = class(TComponent)
  private
    FKind         : string;
    FArcusto_ID   : Real;
    FShip_To_ID   : Real;
    FBill_To_ID   : Real;
    FReportName   : string;
    FSelectionList: TStringList;
    FSubject      : string;
    FFileName     : string;
    FDirName      : string;
    FBody         : string;
    FSource       : String;
    FSource_id    : Real;
    FExternalDocsList: TStringList;
    FUserFormattedFileName: string;

    function IsAutoEFormRequested( AContact_ID: Real; APS, AAr, AAck, ABol, ACS, AAck_Contact, ASPC, ACoC, APsOrdContact: string ): Boolean;
    procedure PopulateAutoEForm(AContact_ID: Real);
    procedure StoreInTable(AContact_ID: Real; AFileName: string);
    procedure AssignTargetFileName;
  public
    constructor Create( AKind         : string;  // PS, BOL, AR, ACK, CS, COC
                        AArcusto_ID   : Real;
                        AShip_To_ID   : Real;
                        ABill_To_ID   : Real;
                        AReportName   : string;
                        ASelectionList: TStringList;
                        ASubject      : string;
                        ABody   : string = '';
                        ASource : string = '';
                        ASource_id : real = 0;
                        AExternalDocsList: TStringList = nil;
                        AUserFormattedFileName: string = '' );

    procedure Execute;
    procedure AssignDestination( Crpe: TCrpe; CRDotNetObject:Variant );
    class function GetPrepareDirectory(var ADirName: string): Boolean;
end;


type
  TAutoEFormVendor = class(TComponent)
  private
    FRemit_to_ID  : Real;
    FReportName   : string;
    FSelectionList: TStringList;
    FSubject      : string;
    FFileName     : string;
    FDirName      : string;

    FKind         : string;
    FVendor_ID    : Real;
    FShip_To_ID   : Real;
    FBody         : string;
    FSource       : String;
    FSource_id    : Real;
    FExternalDocsList: TStringList;
    FUserFormattedFileName: string;

    procedure PopulateAutoEFormVendor( AVendor_Contact_ID: Real );
    procedure StoreInTableVendor( AVendor_Contact_ID: Real; AFileName: string );
    procedure AssignTargetFileName;
  public
    constructor Create( ARemit_to_ID   : Real;
                        AReportName   : string;
                        ASelectionList: TStringList;
                        ASubject      : string );

    constructor CreateEx( AKind         : string;  // PO, REMIT (treats null as REMIT)
                          AVendor_ID    : Real;
                          AShip_To_ID   : Real;
                          AReportName   : string;
                          ASelectionList: TStringList;
                          ASubject      : string;
                          ABody         : string = '';
                          ASource       : string = '';
                          ASource_id    : Real = 0;
                          AExternalDocsList: TStringList = nil;
                          AUserFormattedFileName: string = '' );

    procedure Execute;
    procedure AssignDestinationVendor( Crpe: TCrpe; CRDotNetObject:Variant );
    class function GetPrepareDirectoryVendor(var ADirName: string): Boolean; virtual;
end;


{03-17-2010 used in IQRepDefVersions when called rom Prn_Doc based forms such as SO, BOL, PS, ACK. See Prn_Doc.pas and IQRepDefVersions}
procedure EnsureSoftEPlantExists;
procedure AssignSoftEPlant( ASoftEPlant: TIQWebSoftEPlant );
procedure ReleaseSoftEPlant;

var Print_SoftEPlant: TIQWebSoftEPlant;


implementation

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Print,
  IQMS.WebVcl.RepDefVersions,
  IQMS.Common.StringUtils,
  System.StrUtils,
  System.Variants,
  Winapi.ShellAPI,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

procedure LoadRepDefFileTypeCombo_PrnDlg(AComboBox: TUniComboBox);
var
  o: TExportOptions;
  ASelIndex: Integer;
  i: Integer;

  procedure _AddType(AExportOption: TExportOptions);
  begin
    AComboBox.Items.AddObject(ExportFileTypeCaption[AExportOption],
      TPrintDlgFileTypeCargo.Create(AExportOption));
  end;

begin
  ASelIndex := -1;
  if Assigned(AComboBox) then
    begin
      AComboBox.Items.BeginUpdate;
      try
        // Clear the combo box
        IQMS.Common.Controls.ClearComboBoxOfObjects(AComboBox);

        // Note:  To preserve prior changes -- in case the item index was saved
        // to the database -- keep a hard-coded order.
        // See also RepDefDlgFileTypes, in this unit above.
        //
        //  RTF (Word)
        //  RTF
        //  Comma Delimited
        //  Ascii
        //  AdobeAcrobatPDF
        //  Excel
        //  HTML4
        //  Excel - Data Only
        _AddType(dtEditableRTF);
        _AddType(dtRichText);
        _AddType(dtSeparatedValues);
        _AddType(dtTextFormat);
        _AddType(dtAdobeAcrobatPDF);
        _AddType(dtExcel);
        _AddType(dtHTML40);
        _AddType(dtExcelRecord);

        // Default to PDF
        //with cboxEMailFileType do ItemIndex:= 4; // default to pdf 12-11-07
        SetSelectedExportOption(AComboBox, dtAdobeAcrobatPDF);
      finally
        AComboBox.Items.EndUpdate;
      end;
    end;
end;

procedure LoadRepDefFileTypeCombo_RepDefDlg(AComboBox: TUniComboBox);
var
  o: TExportOptions;
  ASelIndex: Integer;
  i: Integer;

  procedure _AddType(AExportOption: TExportOptions);
  begin
    AComboBox.Items.AddObject(ExportFileTypeCaption[AExportOption],
      TPrintDlgFileTypeCargo.Create(AExportOption));
  end;

begin
  ASelIndex := -1;
  if Assigned(AComboBox) then
    begin
      AComboBox.Items.BeginUpdate;
      try
        // Clear the combo box
        IQMS.Common.Controls.ClearComboBoxOfObjects(AComboBox);
        // Load the file types
        // DO NOT DO THIS:
        // for o in RepDefDlgFileTypes do
        //  AComboBox.Items.AddObject(ExportFileTypeCaption[o],
        //    TPrintDlgFileTypeCargo.Create(o));

        // Note:  To preserve prior changes -- in case the item index was saved
        // to the database -- keep a hard-coded order.
        // See also RepDefDlgFileTypes, in this unit above.
        //
        // RTF (Word)
        // RTF
        // Comma Delimited
        // Ascii
        // AdobeAcrobatPDF
        // Excel
        // HTML4
        _AddType(dtEditableRTF);
        _AddType(dtRichText);
        _AddType(dtSeparatedValues);
        _AddType(dtTextFormat);
        _AddType(dtAdobeAcrobatPDF);
        _AddType(dtExcel);
        _AddType(dtHTML40);

        // Default to PDF
        //with cboxEMailFileType do ItemIndex:= 4; // default to pdf 12-11-07
        SetSelectedExportOption(AComboBox, dtAdobeAcrobatPDF);
      finally
        AComboBox.Items.EndUpdate;
      end;
    end;
end;

procedure LoadRepDefFileTypeCombo_RepDefDlg(AComboBox: TUniDBComboBox);
var
  i: Integer;

  procedure _AddType(AExportOption: TExportOptions; AItemIndex: Integer);
  begin
    AComboBox.Items.Add(
      Format('%s'#9'%d',
      [ExportFileTypeCaption[AExportOption], AItemIndex]));
  end;

begin
  AComboBox.Items.BeginUpdate;
  try
    AComboBox.Items.Clear;
    _AddType(dtEditableRTF, 0);
    _AddType(dtRichText, 1);
    _AddType(dtSeparatedValues, 2);
    _AddType(dtTextFormat, 3);
    _AddType(dtAdobeAcrobatPDF, 4);
    _AddType(dtExcel, 5);
    _AddType(dtHtml40, 6);
    _AddType(dtExcelRecord, 7);
  finally
    AComboBox.Items.EndUpdate;
  end;
end;

function ItemIndexOfExportOption(AOption: TExportOptions): Integer; overload;
begin
  case AOption of
   dtEditableRTF: Result := 0;
   dtRichText: Result := 1;
   dtSeparatedValues: Result := 2;
   dtTextFormat: Result := 3;
   dtAdobeAcrobatPDF: Result := 4;
   dtExcel: Result := 5;
   dtHTML40: Result := 6;
   dtExcelRecord: Result := 7;
  end;
end;

function ExportOptionOfItemIndex(AItemIndex: Integer): TExportOptions;
begin
  case AItemIndex of
    0: Result := dtEditableRTF;     // EditableRichTextFormat;
    1: Result := dtRichText;
    2: Result := dtSeparatedValues; // CharacterSeparated;
    3: Result := dtTextFormat;      // Ascii;
    4: Result := dtAdobeAcrobatPDF;
    5: Result := dtExcel;
    6: Result := dtHtml40;
    7: Result := dtExcelRecord;
  else
    Result := dtEditableRTF;           // EditableRichTextFormat;
  end;
end;

function GetSelectedExportOption(AComboBox: TUniComboBox): TExportOptions;
begin
  Result := TExportOptions(0);
  if Assigned(AComboBox) then
    begin
      Result := ExportOptionOfItemIndex(AComboBox.ItemIndex);
      // if Assigned(AComboBox.Items.Objects[AComboBox.ItemIndex]) then
      // Result := TPrintDlgFileTypeCargo(AComboBox.Items.
      //  Objects[AComboBox.ItemIndex]).FileType;
    end;
end;

procedure SetSelectedExportOption(AComboBox: TUniComboBox; AFileType: TExportOptions);
begin
  if Assigned(AComboBox) then
    AComboBox.ItemIndex := ItemIndexOfExportOption(AFileType);
end;

function ChangeFileExtForExportOption(const AFileName: string;
  const AOption: TExportOptions): string;
begin
  Result := AFileName;
  if (AFileName > '') and (AOption > TExportOptions(0)) then
    Result := ChangeFileExt(AFileName, ExportFileTypeExt[AOption]);
end;

procedure EnsureSoftEPlantExists;
begin
  ReleaseSoftEPlant;
  Print_SoftEPlant:= TIQWebSoftEPlant.Create(Application)
end;

procedure AssignSoftEPlant( ASoftEPlant: TIQWebSoftEPlant );
begin
  Print_SoftEPlant.EPlant_ID:= ASoftEPlant.EPlant_ID;
end;

procedure ReleaseSoftEPlant;
begin
  if Assigned(Print_SoftEPlant) then
     FreeAndNil( Print_SoftEPlant );
end;



{ See note in interface section!
  Sep-06-06 - Jason - suspect this is no longer needed b/c of fix made in IQSetPrinter
 Before Sep-06-06 - This call fixes the CRW problem when we print to Screen and this is the *1st* time
 we use to print the report. The Vcl.Printers list entry for default printer gets screwed up.
 The port was assigned "winspool,LPT1:" instead of just "LPT1:".
 This will prevent the internal/external docs printed out}
procedure FixPortProblemWhenPrintedToScreen1stTimeFromCRW;
var
  hMode   : THandle;
  pName   : PChar;
  pDriver : PChar;
  pPort   : PChar;
  sName   : string;
  sDriver : string;
  sPort   : string;
  i       : integer;
begin
  pName  := StrAlloc(255);
  pDriver:= StrAlloc(255);
  pPort  := StrAlloc(255);
  try
    {Use GetPrinter for the hMode since it will show the current  settings (orientation, etc.) from a PrintDialog change}
    Vcl.Printers.Printer.GetPrinter(pName, pDriver, pPort, hMode);

    {Check Driver}
    sDriver := String(pDriver);
    if Length(sDriver) = 0 then
    begin
      GetProfileString('Devices', pName, '', pDriver, MAX_PATH);
      sDriver := String(pDriver);
      i := Pos(',',sDriver);
      sDriver := Copy(sDriver, 1, i-1);
    end;

    {Check Port}
    sPort := String(pPort);
    if Length(sPort) = 0 then
    begin
      GetProfileString('Devices', pName, '', pPort, MAX_PATH);
      sPort := String(pPort);
      i := Pos(',',sPort);
      sPort := Copy(sPort, i + 1, Length(sPort));
    end;
    {Get rid of 'winspool,' prefix}
    i := Pos('winspool,',sPort);
    if i > 0 then
       sPort := Copy(sPort, i+9, Length(sPort));

    {Get Name}
    sName := String(pName);

    {Here! Set the port to "LPT1:" instead of what Crystal does - "winspool,LPT1:"}
    Vcl.Printers.Printer.SetPrinter( PChar(sName), PChar(sDriver), PChar(sPort), 0);
  finally
    StrDispose(pName);
    StrDispose(pDriver);
    StrDispose(pPort);
  end;
end;


// APrinterName is the NAME, not the model!, of the printer exactly as it appears in the printer control panel.
// Returns: false if APrinterName is not located in Printer.Printers list
function IQSetPrinter( APrinterName:String ): Boolean;
var
  hDm     : THandle;
  cPrinter, cDriver, cPort: PChar;
  I       : Integer;
begin
  Result:= False;

  I:= Printer.Printers.IndexOf( APrinterName );
  if I = -1 then
    EXIT;

  // Aug-21-06 - Jason - this was reinstated in order to prevent invalid printer error
  // The issue was this - within a single instance of the application (ie. b/c Vcl.Printers object is global),
  // after the TPrintDialog set the printer settings, the next time we printed(without closing/reopening application),
  // we'd retreive the printer using the name stored in registry from above.  This would result in additional printer
  // objects being created in the global Vcl.Printers list b/c the TPrinterDialog created a TPrinter that differed from
  // our TPrinter.  Long story short - the error you'd get was invalid printer specified b/c the printer name now included the
  // word ' on ' at the end.  Trimming the printer name does not solve the problem!
  // ----- IMPORTANT ------ it was suspected(not for sure) that accessing the printer index caused memory leak.

  cPrinter:= StrAlloc(255);
  cDriver := StrAlloc(255);
  cPort   := StrAlloc(255);

  try
    Printer.PrinterIndex:= I;
    Printer.GetPrinter( cPrinter, cDriver, cPort, hDm );  // this is trick to
    Printer.SetPrinter( cPrinter, cDriver, cPort, hDm );  // avoid possible memory leak
  finally
    StrDispose(cPrinter);
    StrDispose(cDriver);
    StrDispose(cPort);
  end;
  Result:= TRUE;
  // Aug-21-2006 - reimplemented a little differently above
  // Nov-19-2004
  // I:= Printer.Printers.IndexOf( cPrinter );
  // if I > -1 then
  //    Printer.PrinterIndex:= I;

  // Aug-21-06 re-comment out for change above. see same date // {Reinstated Jan-24-2005. Suspected that above code caused Out Of Memory while printing labels}
  //Printer.SetPrinter(PChar(cPrinter), PChar(''), PChar(''), 0);
end;

function GetSelectedPrinterName: string;
begin
  Result := GetPrinterName(Printer.PrinterIndex);
end;

function GetPrinterName(const AIndex: Integer): string;
begin
  Result := '';
  if (AIndex > -1) and (AIndex < Printer.Printers.Count) then
    try
      Result := Printer.Printers[AIndex];
    except
      Result := '';
    end;
end;

procedure InternalWriteToRepdefLog( AReportName, AUserName, ADestination: string; AStartTime: TDateTime  );
begin
  ExecuteCommandFmt('insert into repdef_log                              '+
            '     ( repname,                                     '+
            '       user_name,                                   '+
            '       timestamp,                                   '+
            '       exec_time,                                   '+
            '       destination )                                '+
            'values                                              '+
            '     ( ''%s'',                                      '+
            '       ''%s'',                                      '+
            '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),  '+
            '       %.6f,                                        '+
            '       ''%s'')                                      ',
            [ AReportName,
              AUserName,
              FormatDateTime( 'mm/dd/yyyy hh:nn:ss', AStartTime ),
              (Now - AStartTime) * 86400,
              FixStr(ADestination) ]);
end;

// Retrieve Paper tray/paper bin/paper source
// return true if found and PaperBinName will have value
function GetSelectedPaperBin( var APaperBinName:String ): boolean;
type
  TBinName      = array [0..23] of Char;
  TBinNameArray = array [1..High(Integer) div SizeOf(TBinName)] of TBinName;
  PBinnameArray = ^TBinNameArray;
  TBinArray     = array [1..High(Integer) div SizeOf(Word)] of Word;
  PBinArray     = ^TBinArray;
var
  Device, Driver, Port: array [0..255] of Char;
  numBinNames, numBins, I, ASelectedBinNumber: Integer;
  pBinNames: PBinnameArray;
  pBins    : PBinArray;
  pDMode   : PDevMode;     // PDEVMODE.dmFields is a DWORD. ie. 4 byte uint
  hDMode   : THandle;
begin
  Result:= False;

  Printer.GetPrinter( Device, Driver, Port, hDMode ); // gets info for currently selected printer
  if hDMode = 0 then
    EXIT;
  try
    pDMode:= GlobalLock( hDMode ); // get devmode pointer
    if pDMode = nil then
      EXIT;

    ASelectedBinNumber:= pDMode^.dmDefaultSource; // smallint

    // how many are there?
    numBinNames := WinSpool.DeviceCapabilities( Device, Port, DC_BINNAMES, nil, nil );
    numBins     := WinSpool.DeviceCapabilities( Device, Port, DC_BINS,     nil, nil );

    if ( numBins <> numBinNames ) or not( numBinNames > 0 ) then // ensure apples arent oranges
      EXIT; // Mmm, sounds tasty

    // initialize more vars
    pBins    := nil;
    pBinNames:= nil;
    GetMem( pBinNames, numBinNames * SizeOf(TBinname) );
    GetMem( pBins,     numBins     * SizeOf(Word)     );

    try
      // Retrieve Bin names and their associated numbers //cant combine these calls with the two similar ones above!
      WinSpool.DeviceCapabilities( Device, Port, DC_BINNAMES, PChar(pBinNames), nil );
      WinSpool.DeviceCapabilities( Device, Port, DC_BINS,     PChar(pBins),     nil );

      // Find our bin!
      for i := 1 to numBinNames do
        if ASelectedBinNumber = pBins^[i] then
        begin
          SetString( APaperBinName, pBinNames^[i], strLen(pBinNames^[i]) ); //ensure unique ref counted string exists to pass as result.
          Result:= True;
          BREAK; // Got it, lets go
        end;
    finally
      if pBins     <> nil then FreeMem(pBins);
      if pBinNames <> nil then FreeMem(pBinNames);
    end;
  finally
    GlobalUnlock( hDMode ); // release devmode handle
  end;
end;


// returns -1 if fail, else
// SIMPLEX = 1;
// VERTICAL = 2;
// HORIZONTAL = 3;
function GetSelectedDuplexMode( var ADuplex:Integer ): Boolean;
var
  Device, Driver, Port: array [0..255] of Char;
  hDMode : THandle;
  pDMode : PDevMode;
begin
  Result:= False;
  ADuplex := -1;

  Printer.GetPrinter( Device, Driver, Port, hDMode ); // gets info for currently selected printer
  if 0 = WinSpool.DeviceCapabilities(Device, Port, DC_DUPLEX, nil, nil) then
    EXIT; // Not supported

  if hDMode = 0 then
    EXIT;

  pDMode:= GlobalLock( hDMode ); // get devmode pointer
  if pDMode = nil then
    EXIT;

  ADuplex:= Integer(pDMode^.dmDuplex); // short

  GlobalUnlock( hDMode ); // release devmode handle

  Result:= True;
end;

function PrintBinaryMemoryStream(AMemoryStream: TMemoryStream; ATitle: String = ''; APrinter: String = '' ): Boolean;
type
  TDoc_Info_1 = record
    pDocName: pChar;
    pOutputFile: pChar;
    pDataType: pChar;
  end;
const
  BufferSize = (1024*1024);
var
  Count, BytesWritten : DWORD;
  hPrinter: THandle;
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port : array[0..255] of char;
  hDeviceMode: THandle;
  DocInfo: TDoc_Info_1;

  iBlock,iBlockTotal : integer;

  Buffer : pointer;
begin
  Result := Assigned(AMemoryStream);
  if not Result then
    EXIT;

  //try // try..except
    GetMem(Buffer,BufferSize);
    if (not IQSetPrinter(APrinter)) then
      IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000345 + #13#13 + APrinter); // 'Printer not found.'
    Printer.GetPrinter(Device, Driver, Port, hDeviceMode);

    if not WinSpool.OpenPrinter(@Device, hPrinter, nil) then
       begin
        IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000345 + #13#13 + APrinter); // 'Printer not found.'
        Result := FALSE;
        Exit;
       end; // end if

    DocInfo.pDocName := PChar(ATitle);
    DocInfo.pOutputFile := nil;
    DocInfo.pDatatype := 'RAW';

    AMemoryStream.Position := 0;
    try
      if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
      begin
        //WinSpool.ClosePrinter(hPrinter);
        Exit;
      end;

      // Start printing
      if not StartPagePrinter(hPrinter) then
      begin
        //EndDocPrinter(hPrinter);
        //WinSpool.ClosePrinter(hPrinter);
        Result := FALSE;
        Exit;
      end;

      iBlock := 0;
      iBlockTotal := AMemoryStream.Size div BufferSize;

      // while not eof...
      while (AMemoryStream.Position < AMemoryStream.Size) do
        begin
          Count := AMemoryStream.Read(Buffer^,BufferSize);
          // Current position may also be measured by iBlock
          inc(iBlock);

          if Count > 0 then
          begin
            if not WritePrinter(hPrinter,
                                Buffer,
                                Count,
                                BytesWritten) then
            begin
              EndPagePrinter(hPrinter);

              raise Exception.CreateFmt( 'Failure attempting to print binary memory stream to %s. Error code = %d', [ APrinter, GetLastError ]);
            end; // end if not WritePrinter()..
          end; // end if Count > 0 then ...
          Application.ProcessMessages;

      end; // end while

    finally
      FreeMem(Buffer);
      EndDocPrinter(hPrinter);
      WinSpool.ClosePrinter(hPrinter);
    end; // try..finally
  //except
  //  Result := FALSE;
  //end; // try..except
end;

function PrintBinary(ALines: TStringList; ATitle: String = ''; APrinter: String = '' ): Boolean;
var
  fsFile : TMemoryStream;
begin
  Result := Assigned(ALines);
  if not Result then
    EXIT;

  fsFile := TMemoryStream.Create;
  try
    ALines.SaveToStream( fsFile ); // Load the file

    Result:= PrintBinaryMemoryStream( fsFile, ATitle, APrinter );
  finally
    fsFile.Free;
  end;
end;

function PrintBinaryFile(AFileName: TFileName; ATitle, APrinter: String): Boolean;
type
  TDoc_Info_1 = record
    pDocName: pChar;
    pOutputFile: pChar;
    pDataType: pChar;
  end;
const
  BufferSize = (1024*1024);
var
  Count, BytesWritten : DWORD;
  hPrinter: THandle;
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port : array[0..255] of char;
  hDeviceMode: THandle;
  DocInfo: TDoc_Info_1;

  iBlock,iBlockTotal : integer;

  fsFile : TFileStream;

  Buffer : pointer;
  APrinterIndex: Integer;
begin
  Result := FALSE;

  if not FileExists(AFileName) then
     Exit;

  Result := TRUE;

  try // try..except
    GetMem(Buffer,BufferSize);
    if (not IQSetPrinter(APrinter)) then
      IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000345 + #13#13 + APrinter); // 'Printer not found.'

    Printer.GetPrinter(Device, Driver, Port, hDeviceMode);

    if not WinSpool.OpenPrinter(@Device, hPrinter, nil) then
       begin
        IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000345 + #13#13 + APrinter); // 'Printer not found.'
        Result := FALSE;
        Exit;
       end; // end if

    DocInfo.pDocName := PChar(ATitle);
    DocInfo.pOutputFile := nil;
    DocInfo.pDatatype := 'RAW';

    // Load the file
    fsFile := TFileStream.Create(AFileName,fmOpenRead);
    fsFile.Position := 0;

    try

      if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
      begin
        WinSpool.ClosePrinter(hPrinter);
        Exit;
      end;

      // Start printing
      if not StartPagePrinter(hPrinter) then
      begin
        EndDocPrinter(hPrinter);
        WinSpool.ClosePrinter(hPrinter);
        Result := FALSE;
        Exit;
      end;

      iBlock := 0;
      iBlockTotal := fsFile.Size div BufferSize;

      // while not eof...
      while (fsFile.Position < fsFile.Size) do
        begin
          Count := fsFile.Read(Buffer^,BufferSize);
          // Current position may also be measured by iBlock
          inc(iBlock);

          if Count > 0 then
          begin
            if not WritePrinter(hPrinter,
                                Buffer,
                                Count,
                                BytesWritten) then
            begin
              EndPagePrinter(hPrinter);
              EndDocPrinter(hPrinter);
              WinSpool.ClosePrinter(hPrinter);
              Exit;
            end; // end if not WritePrinter()..
          end; // end if Count > 0 then ...
          Application.ProcessMessages;

      end; // end while

    finally
      FreeMem(Buffer);
      EndDocPrinter(hPrinter);
      WinSpool.ClosePrinter(hPrinter);
      fsFile.Free;
    end; // try..finally
  except
    Result := FALSE;
  end; // try..except
end;

function PrintTextFile(AFileName: TFileName; ATitle: String = ''; APrinter: String = '' ): Boolean;
var
   ALines: TStringList;
begin
   if not FileExists(AFileName) then Exit;
   try
      ALines := TStringList.Create;
      ALines.LoadFromFile(AFileName);
      Result := PrintText(ALines, ATitle, APrinter);
   finally
      if Assigned(ALines) then ALines.Free;
   end;
end;

function PrintText(ALines: TStringList; ATitle: String = ''; APrinter: String = '' ): Boolean;
var
  ACustomPrint: ICustomPrint;
begin
  if not Assigned(ALines) or (ALines.Count = 0) then
    Exit;

  ACustomPrint := TCustomPrint.Create;
  with ACustomPrint do
  begin
     ShowPrintFinished := False;  // do not display the "done" message
     ShowHeader := False;
     ShowFooter := False;
     Lines.AddStrings(ALines);
     HeaderCaption := ATitle;
     Execute;
     Result := True;
  end;
end;

function PrintWindowsTestPage(APrinter: String = ''): Boolean;
var
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port : array[0..255] of char;
  hDeviceMode: THandle;
begin
    if (not IQSetPrinter(APrinter)) then
      IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000345 + #13#13 + APrinter); // 'Printer not found.'

    Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
    ShInvokePrinterCommand(hDeviceMode, PRINTACTION_TESTPAGE, Device, nil, true );
end;

(*

constructor TCustomPrint.Create(AOwner: TComponent);
begin
  Lines := NIL; // initial

  inherited Create(AOwner);
  HeaderCaption:='';
  LeftMargin   := 1;
  RightMargin  := 1;
  TopMargin    := 1;
  BottomMargin := 1;
  LinesPerInch := 6;
  ShowPrintFinished := TRUE;
  Lines:= TStringList.Create;
  FHeaderOnFirstPage := True;
  FFooterOnFirstPage := True;

  if (AOwner is TUniForm) and (TUniForm(Owner).Font <> NIL) then
     Font.Assign(TUniForm(Owner).Font);
  ShowPrintFinished := False;
  ShowHeader := False;
  ShowFooter := False;
  ClearRect(FPageRect);
  ClearRect(FTextRect);
  ClearRect(FFooterRect);
  ClearRect(FHeaderRect);
end;

destructor TCustomPrint.Destroy;
begin
  if Assigned(Lines) then Lines.Free;
  inherited Destroy;
end;

procedure TCustomPrint.ClearRect(var R: TRect);
begin
  R.Left := 0;
  R.Top := 0;
  R.Right := 0;
  R.Bottom := 0;
end;

procedure TCustomPrint.Execute;
begin
  FPageCount := PrintStrings(Lines,          // text to print
                             False,          // count pages only?
                             OnPrintHeader,  // header event
                             OnPrintFooter); // footer event

  if ShowPrintFinished then
     IQMS.Common.Dialogs.IQInformation(Format('%d pages printed',[FPageCount]));

end;

function TCustomPrint.CountPages: Integer;
begin
  FPageCount := PrintStrings(Lines,          // text to print
                             True,           // count pages only?
                             OnPrintHeader,  // header event
                             OnPrintFooter); // footer event
  Result := FPageCount;
end;

procedure TCustomPrint.OnPrintFooter(APageNumber: Integer; ATextRect : TRect);
var
  S: string;
  res: integer;
begin

  if not ShowFooter then Exit;

  if not FFooterOnFirstPage and (APageNumber = 1) then Exit;

  with Printer.Canvas do
  begin
    { Draw a gray line one point wide below the text }
    res := GetDeviceCaps(Handle, LOGPIXELSY);
    pen.Style := psSolid;
    pen.Color := clGray;
    pen.Width := Round(res / 72);
    MoveTo(ATextRect.Left, ATextRect.Top);
    LineTo(ATextRect.Right, ATextRect.Top);
    { Print the page number in Arial 8pt, gray, on right side of
      footer rect. }
    S := Format('Page %d', [APageNumber]);
    Font.Name := Self.Font.Name; //'Arial';
    Font.Size := 8;
    Font.Color := clGray;
    TextOut(ATextRect.Right - TextWidth(S), ATextRect.Top + res div
      18,
      S);
  end;
end;

procedure TCustomPrint.OnPrintHeader(APageNumber: Integer; ATextRect : TRect);
var
  res: Integer;
begin

  if not ShowHeader then Exit;

  if not FHeaderOnFirstPage and (APageNumber = 1) then Exit;

  with Printer.Canvas do
  begin
    { Draw a gray line one point wide 4 points above the text }
    res := GetDeviceCaps(Handle, LOGPIXELSY);
    pen.Style := psSolid;
    pen.Color := clGray;
    pen.Width := Round(res / 72);
    MoveTo(ATextRect.Left, ATextRect.Bottom - res div 18);
    LineTo(ATextRect.Right, ATextRect.Bottom - res div 18);
    { Print the company name in Arial 8pt, gray, on left side of
      footer rect. }
    Font.Name := Self.Font.Name; // 'Arial';
    Font.Size := 8;
    Font.Color := clGray;
    TextOut(ATextRect.Left, ATextRect.Bottom - res div 10 -
      TextHeight('W'), HeaderCaption);
  end;
end;

{ Calculate text output and header/footer rectangles. }
procedure TCustomPrint.CalcPrintRects;
var
  printorigin : TPoint;    { origin of canvas coordinate system in paper coordinates. }

  // -------------------------------------------------------------------------
  { Get resolution, paper size and non-printable margin from
    printer driver. }
  procedure GetPrinterParameters;
  begin
    with Printer.Canvas do
    begin
      F_X_resolution := GetDeviceCaps(Handle, LOGPIXELSX);
      F_Y_resolution := GetDeviceCaps(Handle, LOGPIXELSY);
      printorigin.X := GetDeviceCaps(Handle, PHYSICALOFFSETX);
      printorigin.Y := GetDeviceCaps(Handle, PHYSICALOFFSETY);
      FPageRect.Left := 0;
      FPageRect.Right := GetDeviceCaps(Handle, PHYSICALWIDTH);
      FPageRect.Top := 0;
      FPageRect.Bottom := GetDeviceCaps(Handle, PHYSICALHEIGHT);
    end; { With }
  end; { GetPrinterParameters }

  // -------------------------------------------------------------------------
  { Calculate area between the requested margins, paper-relative.
    Adjust margins if they fall outside the printable area.
    Validate the margins, raise EPrinter exception if no text area
    is left. }
  procedure CalcRects;
  var
    max : integer;
  begin
    with FTextRect do
    begin
      { Figure FTextRect in paper coordinates }
      Left := Round(leftmargin * X_resolution);
      if Left < printorigin.x then
        Left := printorigin.x;

      Top := Round(topmargin * Y_resolution);
      if Top < printorigin.y then
        Top := printorigin.y;

        { Printer.PageWidth and PageHeight return the size of the
          printable area, we need to add the printorigin to get the
          edge of the printable area in paper coordinates. }
      Right := PageRect.Right - Round(rightmargin * X_resolution);
      max := Printer.PageWidth + printorigin.X;
      if Right > max then
        Right := max;

      Bottom := PageRect.Bottom - Round(bottommargin *
        Y_resolution);
      max := Printer.PageHeight + printorigin.Y;
      if Bottom > max then
        Bottom := max;

      { Validate the margins. }
      if (Left >= Right) or (Top >= Bottom) then
        raise EPrinter.Create('PrintString: the supplied margins are too large.  '+
          'There is no area to print left on the page.');
    end; { With }

    { Convert FTextRect to canvas coordinates. }
    OffsetRect(FTextRect, - printorigin.X, - printorigin.Y);

    { Build header and footer rects. }
    FHeaderRect := Rect(FTextRect.Left, 0,
      FTextRect.Right, FTextRect.Top);
    FFooterRect := Rect(FTextRect.Left, FTextRect.Bottom,
      FTextRect.Right, Printer.PageHeight);
  end; { CalcRects }
  // -------------------------------------------------------------------------
begin { CalcPrintRects }
  GetPrinterParameters;
  CalcRects;
  FLineHeight := round(Y_resolution / linesPerInch);
end; { CalcPrintRects }

function TCustomPrint.PrintStrings(ALines: TStringList;
  ACountPagesOnly: Boolean; AOnPrintHeader: TPrintHeaderEvent;
                         AOnPrintFooter: TPrintFooterEvent): Integer;
var
  continuePrint: Boolean;  { continue/abort flag for callbacks }
  pagecount: Integer;      { number of current page }
  charheight: Integer;     { font height in dots  }
  textstart: Integer;      { index of first line to print on current page, 0-based. }
  ASavedFont: TFont;

  // ---------------------------------------------------------------------------
  { Print a page with headers and footers. }
  procedure PrintPage;
    // -------------------------------------------------------------------------
    procedure FireHeaderEvent(event : TPrintHeaderEvent; r : TRect);
    begin
      if Assigned(event) then
      begin
        event(pagecount, r);
        // Restore original font, in case it was changed.
        Self.SetCanvasFont(ASavedFont);
      end; { If }
    end; { FireHeaderFooterEvent }
    // -------------------------------------------------------------------------
    procedure FireFooterEvent(event : TPrintFooterEvent; r : TRect);
    begin
      if Assigned(event) then
      begin
        event(pagecount, r);
        // Restore original font, in case it was changed.
        Self.SetCanvasFont(ASavedFont);
      end; { If }
    end; { FireHeaderFooterEvent }
    // -------------------------------------------------------------------------
    procedure DoHeader;
    begin
      FireHeaderEvent(AOnPrintHeader, FHeaderRect);
    end; { DoHeader }

    // -------------------------------------------------------------------------
    procedure DoFooter;
    begin
      FireFooterEvent(AOnPrintFooter, FFooterRect);
    end; { DoFooter }

    // -------------------------------------------------------------------------
    procedure DoPage;
    const
      C_TAB_SPACES: String = '        ';
    var
      y: integer;
      s: string;
    begin
      y := FTextRect.Top;
      while (textStart < ALines.Count) and
        (y <= (FTextRect.Bottom - charheight)) do
      begin
          { Note: use TextRect instead of TextOut to effect clipping
            of the line on the right margin. It is a bit slower,
            though. The clipping rect would be
            Rect( FTextRect.left, y, FTextRect.right, y+charheight). }
        // 01/07/2014 Fix the text so that Tab characters print as spaces
        s := IQMS.Common.StringUtils.StrTran(ALines[textStart], #9, C_TAB_SPACES);
        Printer.Canvas.TextOut(FTextRect.Left, y, s);
        Inc(textStart);
        Inc(y, FLineHeight);
      end; { While }
    end; { DoPage }
    // -------------------------------------------------------------------------

  begin { PrintPage }
    DoHeader;
    if ContinuePrint then
    begin
      DoPage;
      DoFooter;
      if (textStart < ALines.Count) and ContinuePrint then
      begin
        Inc(pagecount);
        Printer.NewPage;
      end; { If }
    end;
  end; { PrintPage }
  // ---------------------------------------------------------------------------

begin { PrintStrings }
  continuePrint := True;
  pagecount := 1;
  textstart := 0;


  try
     ASavedFont := TFont.Create;
     Self.SafeAssignFont(Printer.Canvas.Font, ASavedFont);

     StartDoc; // see below
     charheight := GetCanvasTextHeight;
     while (textstart < ALines.Count) and ContinuePrint do
       PrintPage;
  finally
     if continuePrint and not ACountPagesOnly then
        Printer.EndDoc
     else
        Printer.Abort;
     if Assigned(ASavedFont) then ASavedFont.Free;
  end;

  if continuePrint then
    Result := pagecount
  else
    Result := 0;
end;

procedure TCustomPrint.PrintHeader(const APageNumber: Integer);
var
   AFont: TFont;
begin
  try
     // If this method is called, then override (and overwrite) this property
     FShowHeader := True;
     AFont := TFont.Create;
     SafeAssignFont(Printer.Canvas.Font, AFont);
     OnPrintHeader(APageNumber, FHeaderRect);
  finally
     SetCanvasFont(AFont);
     AFont.Free;
  end;
end;

procedure TCustomPrint.PrintFooter(const APageNumber: Integer);
var
   AFont: TFont;
begin
  try
     // If this method is called, then override (and overwrite) this property
     FShowFooter := True;

     AFont := TFont.Create;
     SafeAssignFont(Printer.Canvas.Font, AFont);
     OnPrintFooter(APageNumber, FFooterRect);
  finally
     SetCanvasFont(AFont);
     AFont.Free;
  end;
end;

procedure TCustomPrint.SafeAssignFont(const AFromFont: TFont;
 var AToFont: TFont);
begin
  if not Assigned(AFromFont) or
     not Assigned(AToFont) then
     Exit;

  AToFont.Name := AFromFont.Name;
  AToFont.Size := AFromFont.Size;
  AToFont.Style := AFromFont.Style;
  //AToFont.Color := AFromFont.Color;
end;


function TCustomPrint.GetCanvasTextHeight: Integer;
begin
  Result := Printer.Canvas.TextHeight('�y');
end;

function TCustomPrint.CanvasTextWidth(const AText: String): Integer;
begin
  Result := Printer.Canvas.TextWidth(AText);
end;

procedure TCustomPrint.StartDoc;
begin
  Printer.BeginDoc;
  CalcPrintRects;
  Printer.Canvas.Font.PixelsPerInch := Y_resolution;
end;

procedure TCustomPrint.EndDoc;
begin
  Printer.EndDoc;
end;

procedure TCustomPrint.PrintLine(const ALeft, ATop: Integer; AText: String);
begin
  Printer.Canvas.TextOut(ALeft {X}, ATop {Y}, AText);
end;

*)

procedure PrintStringGrid(Grid: TUniStringGrid; Title: string;
  Orientation: TPrinterOrientation);
var
  P, I, J, YPos, XPos, HorzSize, VertSize: Integer;
  ANumPages, APage, AArea, AHeaderSize, AFooterSize, AMargin, AFontHeight: Integer;
  mmx, mmy: Extended;
  Footer: string;
begin
  // Initialize vars
  AHeaderSize := 100;
  AFooterSize := 200;
  AMargin := 36;
  AFontHeight := 36;

  // Initialize printer
  Printer.Orientation := Orientation;
  Printer.Title  := Title;
  Printer.BeginDoc;

  //Get the printer pixels
  mmx := GetDeviceCaps(Printer.Canvas.Handle, PHYSICALWIDTH) /
    GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSX) * 25.4;
  mmy := GetDeviceCaps(Printer.Canvas.Handle, PHYSICALHEIGHT) /
    GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY) * 25.4;

  // set values based on printer
  VertSize := Trunc(mmy) * 10;
  HorzSize := Trunc(mmx) * 10;
  SetMapMode(Printer.Canvas.Handle, MM_LOMETRIC);

  //Get the working area
  AArea := (VertSize - AHeaderSize - AFooterSize) div AMargin;

  // Get page count
  if Grid.RowCount mod AArea <> 0 then
    ANumPages := Grid.RowCount div AArea + 1
  else
    ANumPages := Grid.RowCount div AArea;

  // Initialize first page
  APage := 1;

  //Print the grid
  for P := 1 to ANumPages do
  begin
    // Header
    Printer.Canvas.Font.Height := 48;
    Printer.Canvas.TextOut((HorzSize div 2 - (Printer.Canvas.TextWidth(Title) div 2)),
      - 20,Title);
    Printer.Canvas.Pen.Width := 5;
    Printer.Canvas.MoveTo(0, - AHeaderSize);
    Printer.Canvas.LineTo(HorzSize, - AHeaderSize);

    // Footer
    Printer.Canvas.MoveTo(0, - VertSize + AFooterSize);
    Printer.Canvas.LineTo(HorzSize, - VertSize + AFooterSize);
    Printer.Canvas.Font.Height := 36;
    Footer := Format('Page %d of %d', [APage, ANumPages]); // need to add to IQMS.Common.ResStrings.pas
    Printer.Canvas.TextOut((HorzSize div 2 - (Printer.Canvas.TextWidth(Footer) div 2)),
      - VertSize + 150,Footer);

    // Printer the grid
    Printer.Canvas.Font.Height := AFontHeight;
    YPos := AHeaderSize + 10;
    for I := 1 to AArea do
    begin
      if Grid.RowCount >= I + (APage - 1) * AArea then
      begin
        XPos := 0;
        for J := 0 to Grid.ColCount - 1 do
        begin
          Printer.Canvas.TextOut(XPos, - YPos,
            Grid.Cells[J, I + (APage - 1) * AArea - 1]);
          XPos := XPos + Grid.ColWidths[J] * 3;
        end;
        YPos := YPos + AMargin;
      end;
    end;

    // Page number
    Inc(APage);
    if APage <= ANumPages then Printer.NewPage;

  end;
  // Done!
  Printer.EndDoc;
end;


{ TAutoEForm }
constructor TAutoEForm.Create( AKind: string;
                               AArcusto_ID,
                               AShip_To_ID,
                               ABill_To_ID: Real;
                               AReportName: string;
                               ASelectionList: TStringList;
                               ASubject: string;
                               ABody   : string = '';
                               ASource : string = '';
                               ASource_id : real = 0;
                               AExternalDocsList: TStringList = nil;
                               AUserFormattedFileName: string = '');

begin
  FKind            := AKind;
  FArcusto_ID      := AArcusto_ID;
  FShip_To_ID      := AShip_To_ID;
  FBill_To_ID      := ABill_To_ID;
  FReportName      := AReportName;
  FSelectionList   := ASelectionList;
  FSubject         := ASubject;
  FFileName        := '';
  FDirName         := '';
  FBody            := ABody;
  FSource          := ASource;
  FSource_id       := ASource_id;
  FExternalDocsList:= AExternalDocsList;
  FUserFormattedFileName:= AUserFormattedFileName;
end;

procedure TAutoEForm.Execute;
var
  Qry: TFDQuery;

  function check_allow_01: Boolean;
  begin
    with Qry do Result:= (FieldByName('source').asString = 'SHIP_TO') and ((FieldByName('source_id').asFloat = FShip_To_ID) or (FShip_To_ID = -10) or ((FShip_To_ID > 0) and (FieldByName('source_id').asFloat = 0 ) ))
  end;

  function check_allow_02: Boolean;
  begin
    with Qry do Result:= (FieldByName('source').asString = 'BILL_TO') and ((FieldByName('source_id').asFloat = FBill_To_ID) or (FBill_To_ID = -10))
  end;

  function check_allow_03: Boolean;
  begin
    with Qry do Result:= (FieldByName('source').asString = '') and (FieldByName('source_id').asFloat = 0)
  end;

  function check_allow_04: Boolean;
  begin
    Result:= True;

    if (FKind = 'PS')
       and
       (FSource = 'SHIPMENTS')
       and
       (FSource_id > 0)
       and
       (Qry.FieldByName('auto_eform_ps_ord_contact').asString = 'Y') then
    begin
      Result:= SelectValueFmtAsFloat('select 1                      '+
                         ' from shipment_dtl sd,        '+
                         '      ord_detail od,          '+
                         '      orders o                '+
                         'where sd.shipments_id = %f    '+
                         '  and sd.order_dtl_id = od.id '+
                         '  and od.orders_id = o.id     '+
                         '  and o.contact_id = %f       ',
                         [ FSource_ID,
                           Qry.FieldByName('id').asFloat ]) = 1;
    end;
  end;


  procedure _ProcessBasedOnCustomerContacts;
  begin
    Qry:= TFDQuery.Create(nil);
    with Qry do
    try
      ConnectionName :='IQFD';
      SQL.Add(Format('select id,                 '+
                     '       source,             '+
                     '       source_id,          '+
                     '       auto_eform_ps,      '+
                     '       auto_eform_ar,      '+
                     '       auto_eform_ord_ack, '+
                     '       auto_eform_cs,      '+
                     '       auto_eform_bol,     '+
                     '       auto_eform_spc,     '+
                     '       auto_eform_coc,     '+
                     '       auto_eform_ord_ack_contact, '+
                     '       auto_eform_ps_ord_contact   '+
                     '  from contact             '+
                     ' where arcusto_id = %.0f   ',
                     [ FArcusto_ID ]));
      Open;
      while not Eof do
      begin
        // Find a contact matching
        //  1. ship_to_id and having corresponding to AKInd auto_eform_xxx checked
        //     2a. if ship_to_id = -10 we include all ship_tos  Z. Nov 11 2013
        //  2. bill_to_id (same as above)
        //     2a. if bill_to_id = -10 we include all bill_tos  Z. July 27 2009
        //  3. if no ship_to_id/bill_to_id is found then check just arcusto_id
        if (check_allow_01 or
          check_allow_02 or
          check_allow_03) and
          check_allow_04 and
          IsAutoEFormRequested(FieldByName('id').asFloat,
                               FieldByName('auto_eform_ps').asString,
                               FieldByName('auto_eform_ar').asString,
                               FieldByName('auto_eform_ord_ack').asString,
                               FieldByName('auto_eform_bol').asString,
                               FieldByName('auto_eform_cs').asString,
                               FieldByName('auto_eform_ord_ack_contact').asString,
                               FieldByName('auto_eform_spc').asString,
                               FieldByName('auto_eform_coc').asString,
                               FieldByName('auto_eform_ps_ord_contact').asString ) then
          PopulateAutoEForm( FieldByName('id').asFloat );
        Next;
      end;
    finally
      Free;
    end;
  end;

begin
  {figure out output file}
  if not TAutoEForm.GetPrepareDirectory( FDirName ) then
     EXIT;

  _ProcessBasedOnCustomerContacts
end;

function TAutoEForm.IsAutoEFormRequested( AContact_ID: Real; APS, AAr, AAck, ABol, ACS, AAck_Contact, ASPC, ACoC, APsOrdContact: string ): Boolean;
begin
  if FKind = 'PS'           then Result:= (APS = 'Y')
                                          or
                                          (APsOrdContact = 'Y')
  else if FKind = 'INVOICE' then Result:= AAr = 'Y'
  else if FKind = 'ACK'     then Result:= (AAck = 'Y')
                                          or
                                          ((AAck_Contact = 'Y') and ( SelectValueByID('contact_id', 'orders', FSource_ID ) = AContact_ID ))
  else if FKind = 'BOL'     then Result:= ABol = 'Y'
  else if FKind = 'CS'      then Result:= ACS = 'Y'
  else if FKind = 'SPC'     then Result:= ASPC = 'Y'
  else if FKind = 'COC'     then Result:= ACoC = 'Y'
  else                           Result:= FALSE;
end;


procedure TAutoEForm.PopulateAutoEForm( AContact_ID: Real );
begin
  AssignTargetFileName();

  {print report}
  try
    PrintDefaultReportExG( FReportName, FSelectionList, self, AssignDestination ); {IQMS.Common.Print.pas}
  except on E:Exception do
    Exception.RaiseOuterException( Exception.Create( Format( 'Error creating Auto Eform for source = %s. %s', [ FSource, E.Message ] ) ) );
  end;

  {store in the table}
  StoreInTable( AContact_ID, FFileName );
end;


class function TAutoEForm.GetPrepareDirectory(var ADirName: string): Boolean;
begin
  ADirName:= IQGetMasterHomePath();
  if IQMS.Common.ApplicationSet.IsCGI then
    ADirName:= IQGetUNCMasterHomePath();

  if IQMS.Common.ApplicationSet.IsCGI and (ADirName = '') then
  begin
    IQError( 'Error encountered while processing AUTO EFORM.'#10#13'UNC Master Home must be configured in IQStatus on the apache web server!' );
    Result:= FALSE;
  end;

  ADirName:= IncludeTrailingBackslash( IncludeTrailingBackslash( ADirName ) + cAUTO_EFORM_FOLDER );
  if not ForceDirectories(ADirName) then
  begin
    IQError(Format('Error encountered while processing AUTO EFORM. Unable to create folder %s. Error Code = %d',
                   [ ADirName, GetLastError() ]));
    Result:= FALSE;
  end;
  Result:= TRUE;
end;


procedure TAutoEForm.StoreInTable( AContact_ID: Real; AFileName: string );
var
  AAuto_EForm_ID: Real;
  I: Integer;
begin
  AAuto_EForm_ID:= GetNextID('auto_eform');
  ExecuteCommandFmt('insert into auto_eform                                   '+
            '     ( id, contact_id, subject, file_name, timestamp, body, source, source_id, kind ) '+
            'values                                                   '+
            '     ( %f, %f, ''%s'', ''%s'', sysdate, ''%s'', ''%s'', %f, ''%s'')              ',
            [ AAuto_EForm_ID,
              AContact_ID,
              StrTran( Copy( FSubject, 1, 255), '''', ''''''),
              ExtractFileName(AFileName),
              StrTran(FBody, '''', ''''''),
              FSource,
              FSource_id,
              FKind]);

  if Assigned(FExternalDocsList) then
    for I:= 0 to FExternalDocsList.Count - 1 do
      ExecuteCommandFmt('insert into auto_eform_docs( auto_eform_id, source, source_id ) values( %f, ''EXTERNAL_DOC'', %s )',
                [ AAuto_EForm_ID, FExternalDocsList[ I ]]);
end;

procedure TAutoEForm.AssignDestination(Crpe: TCrpe; CRDotNetObject: Variant);
begin
  SetDestinationToFileExA( Crpe, CRDotNetObject, FFileName,
    ItemIndexOfExportOption(dtAdobeAcrobatPDF));{ IQRepDefVersions.pas }
end;


procedure TAutoEForm.AssignTargetFileName;

  function GetDocumentDescription: string;
  var
    ABad: array of string;
    I: Integer;
  begin
    if FSource = 'SHIPMENTS'         then Result:= SelectValueByID('packslipno', 'shipments', FSource_ID)
    else if FSource = 'BOL'          then Result:= SelectValueByID('bolno', 'bol', FSource_ID)
    else if FSource = 'ARINVOICE'    then Result:= SelectValueByID('invoice_no', 'arinvoice', FSource_ID)
    else if FSource = 'ORDERS'       then Result:= SelectValueByID('orderno', 'orders', FSource_ID)
    else if FSource = 'BOL'          then Result:= SelectValueByID('packslipno', 'shipments', FSource_ID)
    else if FSource = 'ARPREPOST'    then Result:= SelectValueByID('invoice_no', 'arprepost', FSource_ID)
    else if FSource = 'ARCUSTO'      then Result:= SelectValueByID('custno', 'arcusto', FSource_ID)
    else if FSource = 'PO'           then Result:= SelectValueByID('pono', 'po', FSource_ID)
    else if FSource = 'SHIPMENT_DTL' then Result:= SelectValueFmtAsString('select packslipno from c_ship_hist where shipment_dtl_id = %f', [ FSource_ID ])
    else
      Result:= '';

    ABad:= VarArrayOf([ '`', '~', ',', '!', '@', '#', '%', '^', '&', '*', '(', ')', '+', '=', '/', '?', '>', '<', '|', '\', '"', '''', '$' ]);
    for I:= 0 to High( ABad ) do
      AnsiReplaceText( Result, ABad[ I ], '_');
  end;

begin
  if FUserFormattedFileName > '' then
     FFileName:= FDirName + ChangeFileExt(FUserFormattedFileName, '') + ' ' + GetRandomName + '.PDF'
  else
     FFileName:= FDirName + FKind + ' ' + GetDocumentDescription() + ' ' + GetRandomName + '.PDF';
end;


{ TAutoEFormVendor }
constructor TAutoEFormVendor.Create( ARemit_to_ID:Real;
                                     AReportName: string;
                                     ASelectionList: TStringList;
                                     ASubject: string);
begin
  FRemit_to_ID   := ARemit_to_ID;
  FReportName   := AReportName;
  FSelectionList:= ASelectionList;
  FSubject      := ASubject;
  FFileName     := '';
  FDirName      := '';
  FKind         := 'REMIT';
end;

constructor TAutoEFormVendor.CreateEx( AKind         : string;
                                       AVendor_ID    : Real;
                                       AShip_To_ID   : Real;
                                       AReportName   : string;
                                       ASelectionList: TStringList;
                                       ASubject      : string;
                                       ABody         : string = '';
                                       ASource       : string = '';
                                       ASource_id    : Real = 0;
                                       AExternalDocsList: TStringList = nil;
                                       AUserFormattedFileName: string = '' );
begin
  FKind            := AKind;
  FVendor_ID       := AVendor_ID;
  FShip_To_ID      := AShip_To_ID;
  FReportName      := AReportName;
  FSelectionList   := ASelectionList;
  FSubject         := ASubject;
  FFileName        := '';
  FDirName         := '';
  FBody            := ABody;
  FSource          := ASource;
  FSource_id       := ASource_id;
  FExternalDocsList:= AExternalDocsList;
  FUserFormattedFileName:= AUserFormattedFileName;
end;

procedure TAutoEFormVendor.Execute;
var
  Qry: TFDQuery;

  procedure _ProcessBasedOnVendorRemit_To;
  begin
    PopulateAutoEFormVendor( 0 {vendor_contact_id} );  // note FRemit_To_ID is assigned up front in the create constructor
  end;

  procedure _ProcessBasedOnVendorContacts;
  begin
    Qry:= TFDQuery.Create(nil);
    with Qry do
    try
      ConnectionName :='IQFD';
      SQL.Add(Format('select id,                 '+
                     '       auto_eform_po       '+
                     '  from vendor_contact      '+
                     ' where vendor_id = %.0f    ',
                     [ FVendor_ID ]));
      Open;
      while not Eof do
      begin
        if FieldByName('auto_eform_po').asString = 'Y' then
           PopulateAutoEFormVendor( FieldByName('id').asFloat );
        Next;
      end;
    finally
      Free;
    end;
  end;


begin
  {figure out output file}
  if not TAutoEFormVendor.GetPrepareDirectoryVendor( FDirName ) then
     EXIT;

  if FKind = 'PO' then
     _ProcessBasedOnVendorContacts
  else
     _ProcessBasedOnVendorRemit_To
end;

procedure TAutoEFormVendor.PopulateAutoEFormVendor( AVendor_Contact_ID: Real );
var
  ANeedToUninitialize: Boolean;
begin
  // 10/16/2015 (Byron, EIQ-8940) Call CoInitialize.  This method is
  // executed at some point by an IQAlert thread.
  ANeedToUninitialize:= Succeeded(CoInitialize(nil));
  try
    AssignTargetFileName();

    {print report}
    PrintDefaultReportExC( FReportName, FSelectionList, self, AssignDestinationVendor ); {IQMS.Common.Print.pas}

    {store in the table}
    StoreInTableVendor( AVendor_Contact_ID, FFileName );

  finally
    if ANeedToUninitialize then
       CoUninitialize;
  end;
end;


class function TAutoEFormVendor.GetPrepareDirectoryVendor( var ADirName: string ): Boolean;
begin
  ADirName:= IQGetMasterHomePath();
  if IQMS.Common.ApplicationSet.IsCGI then
    ADirName:= IQGetUNCMasterHomePath();

  if IQMS.Common.ApplicationSet.IsCGI and (ADirName = '') then
  begin
    IQError('Error encountered while processing AUTO EFORM VENDOR. UNC Folder must be configured in IQStatus on the apache pc!');
    Result:= FALSE;
  end;

  ADirName:= IncludeTrailingBackslash( IncludeTrailingBackslash( ADirName ) + cAUTO_EFORM_VENDO_FOLDER );
  if not ForceDirectories(ADirName) then
  begin
    IQError(Format('Error encountered while processing AUTO EFORM VENDOR. Unable to create folder %s. Error Code = %d', [ ADirName, GetLastError() ]));
    Result:= FALSE;
  end;
  Result:= TRUE;
end;

procedure TAutoEFormVendor.StoreInTableVendor( AVendor_Contact_ID: Real; AFileName: string );
var
  AAuto_EForm_Vendor_ID: Real;
  I: Integer;
begin
  AAuto_EForm_Vendor_ID:= GetNextID('auto_eform_vendor');
  ExecuteCommandFmt('insert into auto_eform_vendor                                   '+
            '     ( id, remit_to_id, vendor_contact_id, subject, file_name, timestamp, body, source, source_id, kind ) '+
            'values                                                          '+
            '     ( %f, %s, %s, ''%s'', ''%s'', sysdate, ''%s'', ''%s'', %f, ''%s'') ',
            [ AAuto_EForm_Vendor_ID,                                     // id
              IQMS.Common.StringUtils.FloatToStr0asNull( FRemit_to_ID, 'null' ),        // remit_to_id
              IQMS.Common.StringUtils.FloatToStr0asNull( AVendor_Contact_ID, 'null' ),  // vendor_contact_id
              StrTran( Copy( FSubject, 1, 255), '''', ''''''),           // subject
              StrTran(ExtractFileName(AFileName), '''', ''''''),                                // file_name
              StrTran(FBody, '''', ''''''),                              // body
              FSource,                                                   // source
              FSource_id,                                                // source_id
              FKind]);                                                   // kind

  if Assigned(FExternalDocsList) then
    for I:= 0 to FExternalDocsList.Count - 1 do
      ExecuteCommandFmt('insert into auto_eform_vendor_docs( auto_eform_vendor_id, source, source_id ) values( %f, ''EXTERNAL_DOC'', %s )',
                [ AAuto_EForm_Vendor_ID, FExternalDocsList[ I ]]);
end;

procedure TAutoEFormVendor.AssignDestinationVendor(Crpe: TCrpe; CRDotNetObject: Variant);
begin
  SetDestinationToFileExA( Crpe, CRDotNetObject, FFileName,
    ItemIndexOfExportOption(dtAdobeAcrobatPDF));{ IQRepDefVersions.pas }
end;


procedure TAutoEFormVendor.AssignTargetFileName;

  function GetDocumentDescription: string;
  var
    ABad: array of string;
    I: Integer;
  begin
    if FSource = 'PO' then Result:= SelectValueByID('pono', 'po', FSource_ID)
    else
       Result:= SelectValueByID('attn', 'remit_to', FRemit_To_ID);

    ABad:= VarArrayOf([ '`', '~', ',', '!', '@', '#', '%', '^', '&', '*', '(', ')', '+', '=', '/', '?', '>', '<', '|', '\', '"', '''', '$' ]);
    for I:= 0 to High( ABad ) do
      AnsiReplaceText( Result, ABad[ I ], '_');
  end;

begin
  FFileName:= FDirName + FKind + ' ' + GetDocumentDescription() + ' ' + GetRandomName + '.PDF';
end;



//function TCustomPrint.GetCanvasFont: TFont;
//begin
//  Result := Printer.Canvas.Font;
//end;
//
//procedure TCustomPrint.SetCanvasFont(const Value: TFont);
//begin
//  Printer.Canvas.Font.Name := Value.Name;
//  Printer.Canvas.Font.Size := Value.Size;
//  Printer.Canvas.Font.Style := Value.Style;
//  //Printer.Canvas.Font.Color := Value.Color;
//end;
//
//procedure TCustomPrint.SetCanvasFontName(const Value: String);
//begin
//  Printer.Canvas.Font.Name := Value;
//end;
//
//procedure TCustomPrint.SetCanvasFontSize(const Value: Integer);
//begin
//  Printer.Canvas.Font.Size := Value;
//end;
//
//procedure TCustomPrint.SetCanvasFontStyles(const Value: TFontStyles);
//begin
//  Printer.Canvas.Font.Style := Value;
//end;
//
//function TCustomPrint.GetOrientation: TPrinterOrientation;
//begin
//  Result := Printer.Orientation;
//end;
//
//procedure TCustomPrint.SetOrientation(const Value: TPrinterOrientation);
//begin
//  Printer.Orientation := Value;
//end;


{ MISC }
function GetFileFormatElementName( AKey: string ): string;
begin
  if CompareText( AKey, 'Type' ) = 0 then
     Result:= IQMS.Common.ResStrings.cTXT0000412 {'Type'}

  else if CompareText( AKey, 'Number' ) = 0 then
     Result:= IQMS.Common.ResStrings.cTXT0000413 {'Number'}

  else if CompareText( AKey, 'Date' ) = 0 then
     Result:= IQMS.Common.ResStrings.cTXT0000414 {'Date'}

  else if CompareText( AKey, 'Company' ) = 0 then
     Result:= IQMS.Common.ResStrings.cTXT0000415 {'Company'}

  else
     Result:= AKey;  // s/n happen
end;


{ TPrintDlgFileTypeCargo }

constructor TPrintDlgFileTypeCargo.Create(AFileType: TExportOptions);
begin
  FileType := AFileType;
end;

end.

