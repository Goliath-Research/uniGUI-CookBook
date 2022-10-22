unit IQMS.WebVcl.DocumentsExternal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame,
  Vcl.StdCtrls,
  uniGUIBaseClasses,
//  DMComps,
  System.Variants,
  IQMS.WebVcl.DocumentUtils,
  IQMS.WebVcl.DocumentsCoordinator,
  IQMS.WebVcl.LargeGrid,
  IQMS.WebVcl.Hpick,
  uniBasicGrid,UniStatusBar,
  uniDBGrid,UniPanel, UniDbNavigator,UniSpeedButton,UniMainMenu,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,  Data.DB, Vcl.Menus,
  Vcl.Buttons,
  Spring.Services,
  Spring.Collections,
  PickListDlg,
  IQWeb.Server.DataServices,
  IQMS.common.dataconst,
//  Vcl.Wwfltdlg,
  Vcl.ComCtrls,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.UI.Intf, uniButton, uniBitBtn;
//  vcl.wwDialog;

type
  TBeforeShowRevisions = procedure( Sender:TObject; var ADateOfInterest: TDateTime ) of object;

  TIQWebExtDoc = class(TUniFrame)
    FQryExtDocs: TFDQuery;
    FSrcExtDocs: TDataSource;
    pnlTop: TUniPanel;
    PnlToolbarStandardBtns: TUniPanel;
    SearchBtn: TUniSpeedButton;
    FilterBtn: TUniSpeedButton;
    FilterClearBtn: TUniSpeedButton;
    LaunchDocumentControl: TUniSpeedButton;
    PrintDocument: TUniSpeedButton;
    BtnScanDocument: TUniSpeedButton;
    ExtDocNav: TUniDBNavigator;
    pnlShape: TUniPanel;
    FShape2: TUniPanel;
    FShape3: TUniPanel;
    FShape4: TUniPanel;
    FShape5: TUniPanel;
    FShape6: TUniPanel;
    FShape7: TUniPanel;
    pnlFill: TUniPanel;
    ExtPopUpMenu: TUniPopupMenu;
    Execute1: TUniMenuItem;
    Print1: TUniMenuItem;
    ShowReleases1: TUniMenuItem;
    N1: TUniMenuItem;
    pfilter: TUniMenuItem;
    AssignPrintWithToSelectedRecsClick1: TUniMenuItem;
    ExtDocsGrid: TUniDBGrid;
    FStatusBar1: TUniStatusBar;
    procedure ExtDocsGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FActive: Boolean;
    FReadOnly: Boolean;
    FSource: string;
    FMasterFields: string;  {normally "ID"}
    FDefaultDoc_Library_ID: Real;
    FMasterID: Real;
    FFilter: string;
    FDoc_Used_ID: Real;
    FOnGetMasterTableName: TOnGetMasterTableNameEvent;
    FOnNewRecord: TDataSetNotifyEvent;
    FBeforeInsert: TDataSetNotifyEvent;
    FBeforeDelete: TDataSetNotifyEvent;
    FShowPopupMenu: Boolean;

    FSelectedExternalDocsList: TStringList;
    FAttachedDocumentsCoordinator: TIQAttachedDocumentsCoordinator;


    FTouchscreen: Boolean;  // limited functionality
    FTouchScreenGrid: TIQWebTouchScreenGrid;
    FBeforeShowRevisions: TBeforeShowRevisions;

    FOrderByField: TField;
    FOrderByDesc : Boolean;

    // For backward compatibility
    FDataBaseName: string;

    function GetActive:Boolean;
    procedure SetActive(AValue:Boolean);
    procedure SetTablesActive( AValue:Boolean );
    // function GetDataBaseName:string;
    // procedure SetDataBaseName( const AValue:string );
    function GetMasterSource:TDataSource;
    procedure SetMasterSource(AValue:TDataSource);
    function GetTableName:string;
    procedure SetTableName( const AValue:string );
    function GetColumns: TUniDBGridColumns;
    procedure SetColumns( AValue: TUniDBGridColumns );
    procedure SetSource( AValue: string );
    function GetIsReadOnly: Boolean ;
    procedure SetIsReadOnly( AValue: Boolean );
    function GetSource_ID: Real;
    procedure SetSource_ID(const Value: Real);

    function CreateDocsField( FieldClass: TFieldClass; const AFieldName: string; ADataSet: TDataSet ):TField;
    function CreateColumn( AGrid:TUniDBGrid; const AFieldName, ATitle: string; AWidth: Integer):TUniBaseDBGridColumn;
    procedure DoubleClick(Sender: TObject);

    procedure AssignColumns( ADBGrid: TUniDBGrid );
    procedure AssignDisplayLabels( ADataSet: TDataSet );
    procedure UniDBGridDrawColumnCell(Sender: TObject; ACol,ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
//    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridColEnter(Sender: TObject);
    procedure UpdateExtDoc(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure AfterOpenExtDoc( DataSet: TDataSet );
    procedure AfterPostExtDoc( DataSet: TDataSet );
    procedure BeforeEditExtDoc(DataSet: TDataSet);
    procedure BeforeInsertExtDoc(DataSet: TDataSet);
    procedure BeforeDeleteExtDoc( DataSet: TDataSet );
    procedure BeforePostExtDoc( DataSet: TDataSet );
    procedure BeforeRefreshExtDoc( DataSet: TDataSet );
    procedure DataChangeExtDocs(Sender: TObject; Field: TField);
    procedure DoCalcFields( DataSet: TDataSet );
    procedure DoBeforeInsert( DataSet: TDataSet );
    procedure DoBeforeDelete( DataSet: TDataSet );
    procedure AssignShapeParams;
    procedure RefreshShapeParams;

    function OpenFileDialogGetFileName( var AFileName: string ): Boolean;
    function FindRegisteredExternalDocID( ADoc_Library_ID: Real; AFileName: string ): Real;
    procedure UpdateExternalDoc( DataSet: TDataSet );
    procedure UpdateDocRevision( DataSet: TDataSet );
    procedure UpdateDocUsed( DataSet: TDataSet );
    procedure SetButtons;
    function IsSecuredLib( ADoc_Library_ID: Real ): Boolean;
    function GetLibPath( ADoc_Library_ID: Real ): string;
    procedure EditExtDocGridColumnClick(Sender: TObject);
    procedure AssignExternal_Doc( AID: Real );
    procedure AssignExternalDocsFromSelectedList;
    procedure LaunchDocumentControlClick( Sender: TObject );
    function GetMasterTableName: string;
    function IsShopDataLicensed: Boolean;
    function IsRepositoryKind: Boolean;
    procedure SaveRepositoryToLocalFile( var AFileName: string; APrev_Doc_Revision_ID: Real );
    procedure DeleteRepositoryFiles(AList: TStringList);
    procedure SetShowPopupMenu(const Value: Boolean);
    procedure Notification(AComponent: TComponent; Operation: TOperation);
    function CheckConnected: Boolean;
    function UseConvertToPDF: Boolean;
    function CheckUseConvertPDFRedirectFileName(
      AOriginalFileName: string): string;
    function GetPdfFileName(AFileName: string): string;

    procedure ExecOnPopupMenu( Sender : TObject);
    procedure FilterClick( Sender : TObject);
    procedure FilterClearClick( Sender : TObject);
    procedure SearchClick( Sender : TObject);
    procedure AssignPrintWithToSelectedRecordsClick( Sender : TObject );
    procedure AssignFilterSelectedFields;
    procedure UpdateFilterOnStatusBar;
    function FindMenuItemByName(AName: string): TMenuItem;
    procedure DMTextTargetDrop(Sender: TObject; Acceptor: TWinControl; const DropText: String; X, Y: Integer);
    procedure AssignDropMasterTextTarget;
    procedure RefreshTarget;
    procedure DetermineCellColor(var AFontColor, ABrushColor: TColor);
    procedure AdjustScreen;
    procedure SetTouchscreen(const Value: Boolean);
    procedure AssignTouchscreenGridColumns;
    procedure TouchScreenGridColumnMoved(Sender: TObject; FromIndex,ToIndex: Integer);
    procedure TouchScreenGridColWidthChanged(Sender: TObject; Column: Integer);
    procedure AssignParentIDBeforeOpen(DataSet: TDataSet);
    procedure AssignPickListFields;
    procedure AssignPicklistDefaultColumnsWidth( Sender: TObject; AQuery: TDataSet; AColumn: TUniBaseDBGridColumn );

    procedure ShowReleasesClick( Sener: TObject );
    function GetRevisionFullFileName(ARevision_Doc_ID: Real): string;
    function FindRevisionFullFileName(ARevision_Doc_ID: Real;
      var APrevFileName: string): Boolean;
    function CanExecuteDoc: Boolean;
    procedure DoOnTitleClick(Column: TUniDBGridColumn);
    procedure ChangeSortField(const AField: TField);
    procedure UpdateFieldsOrigin(ADataSet: TDataSet);
    procedure AdjustGridTitleColor;
    function Show6USerFields: Boolean;
    procedure ScanDocument(Sender: TObject);
    function IsExtDocTabSelected: Boolean;
    function GetMasterField: TField;
    function MasterFieldValue: Int64;
    procedure GridDrawColumnCell(Sender: TObject;
  DataCol, DataRow: Integer; Column: TUniDbGridColumn; Attribs: TUniCellAttribs);

  protected
    { Protected declarations }
    FDNetRepository: Variant;
    FRepositoryFiles: TStringList;

    procedure Loaded; override;
    procedure AssignFields;
    procedure CreateTFields( ADataSet: TDataSet );

    procedure DoNewRecord(DataSet: TDataSet);
    procedure AfterInsertExtDoc(DataSet: TDataSet);
    procedure ExecuteOLEPrint( Sender : TObject );
    function GetFullFileName( AShowPrevWhenPending: Boolean = FALSE ): string;
    function FindPreviousVerFullFileName( var APrevFileName: string ): Boolean;
    procedure AttachFile( Sender: TObject);
  public
    { Public declarations }
    property DefaultDoc_Library_ID: Real read FDefaultDoc_Library_ID;

    constructor Create( AComponent:TComponent ); override;
    destructor Destroy; override;

    procedure ActivateOLELink( AVerb: string = 'open');
    procedure AssignDoc_Library( ADoc_Library_ID: Real );
    procedure AttachFile_Ex( AFileName, ADescription: string );
    /// <summary>Returns true if documents have been attached.</summary>
    function HasDocuments: Boolean;

    property ExtDocs: TFDQuery read FQryExtDocs write FQryExtDocs;
    property ExtGrid: TUniDBGrid read ExtDocsGrid write ExtDocsGrid;
    property ExtNav : TUniDBNavigator read ExtDocNav;
    property IsReadOnly: Boolean read GetIsReadOnly write SetIsReadOnly;
    property Source_ID: Real read GetSource_ID write SetSource_ID;
    property MasterTableName: string read GetMasterTableName;
    property AttachedDocumentsCoordinator: TIQAttachedDocumentsCoordinator read FAttachedDocumentsCoordinator write FAttachedDocumentsCoordinator;
//    property wwFilterDialog: TwwFilterDialog read FilterDialog write FilterDialog;
    property Touchscreen: Boolean read FTouchscreen write SetTouchscreen;
    procedure ExecuteDocumentRevision( AExternal_Doc_ID, ADoc_Revision_ID: Real; AVerb: string = 'open' );
    function LocateExternalDoc(AExternal_Doc_ID: Real): Boolean;

    procedure Refresh;
  published
    { Published declarations }
    // Obsolete:
    // Preserved for backward compatibility; set stored to False for new forms.
    property DataBaseName:string read FDataBaseName write FDataBaseName stored False;

    property Active:Boolean read GetActive write SetActive stored False;
    property Align;
//    property BorderStyle;
    property Columns:TUniDBGridColumns read GetColumns write SetColumns;
    property Enabled;
    property Filter: string read FFilter write FFilter;
    property Font;
    property MasterFields:string read FMasterFields write FMasterFields stored True;
    property MasterSource:TDataSource read GetMasterSource write SetMasterSource;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property ShowPopupMenu: Boolean read FShowPopupMenu
     write SetShowPopupMenu default True;
    property Source: string read FSource write SetSource;
    property TableName:string read GetTableName write SetTableName;  {obsolete. see "source" property }
    property TabOrder;
    property TabStop;
    property Visible;
    property OnGetMasterTableName: TOnGetMasterTableNameEvent read FOnGetMasterTableName write FOnGetMasterTableName;
    property OnNewRecord: TDataSetNotifyEvent read FOnNewRecord write FOnNewRecord;
    property BeforeInsert: TDataSetNotifyEvent read FBeforeInsert write FBeforeInsert;
    property BeforeDelete: TDataSetNotifyEvent read FBeforeDelete write FBeforeDelete;
    property OnBeforeShowRevisions: TBeforeShowRevisions read FBeforeShowRevisions write FBeforeShowRevisions;

  end;

procedure IQShellExecute( AFileName: AnsiString; AVerb: AnsiString = 'open' );

implementation

{$R *.dfm}

uses
    IQMS.WebVcl.DocumentsDescript,
    IQMS.Common.Applications,
    IQMS.Common.COMExe,
    IQMS.Common.Controls,
    IQMS.Common.Dialogs,
    IQMS.Common.Miscellaneous,
    IQMS.Common.Numbers,
    IQMS.Common.RegFrm,
    IQMS.WebVcl.SecurityManager,
    IQMS.Common.JumpConstants,
    IQMS.Common.QC_Const,
    IQMS.Qc_Doc.qc_doc_const,
    IQMS.Qc_Doc.qc_doc_dnet,
    IQMS.Qc_Doc.qc_doc_share,
    IQMS.Common.QC_PkDoc,
    IQMS.Common.QC_PkLib,
    Vcl.Printers,
//    printwithdlg,
    Winapi.ShellAPI,
//    System.Variants,
    IQMS.WebVcl.UserDefinedLabel,
    IQMS.WebVcl.DocumentsExternalRevisions,
    IQMS.WebVcl.ResourceStrings,
    IQMS.Common.DataLib,
    IQMS.Common.StringUtils;

const
    cnstSpeedBtnWidth = 25;
    cnstSpeedBtnWidthTouchScreen = 58;

    cnstStandardVisiBtns: TNavButtonSet = [nbFirst, nbPrior, nbNext, nbLast,
      nbInsert, nbDelete, nbPost, nbCancel, nbRefresh];
    cnstReadOnlyVisiBtns: TNavButtonSet = [nbFirst, nbPrior, nbNext, nbLast,
      nbRefresh];

    cnstTopPanelHeight = 27;
    cnstTopPanelHeightTouchScreen = 60;

    cnstNavigatorWidth = 225;
    cnstNavigatorWidthTouchScreen = 480;

    cSHOW_PREV_WHEN_PENDING = TRUE;

procedure IQShellExecute( AFileName: AnsiString; AVerb: AnsiString = 'open' );
var
  ShellExecuteInfo: TShellExecuteInfoA;
begin
  if not FileExists(AFileName) then
     EXIT;
  FillChar( ShellExecuteInfo, SizeOf(TShellExecuteInfoA), 0);

  // 04-01-08 Power Point Support
  // if (CompareText( AVerb, 'Open' ) = 0) and (CompareText( ExtractFileExt( AFileName ), '.pps') = 0) then
  //    AVerb:= 'Show';
  // 11-10-2008 pps viewer wants "Search" but pps Editor wants "Open". Assign blank string - that will invoke the default verb whether it Search or Open
  if (CompareText( AVerb, 'Open' ) = 0) and (CompareText( ExtractFileExt( AFileName ), '.pps') = 0) then
     AVerb:= '';


  with ShellExecuteInfo do
  begin
    cbSize := SizeOf(TShellExecuteInfoA);
    Wnd    := Application.MainForm.Handle;
    lpFile := PAnsiChar( AFileName );
    lpVerb := PAnsiChar( AVerb );
    nShow  := SW_SHOWDEFAULT; // SW_SHOWNORMAL;
  end;

  if not ShellExecuteExA( @ShellExecuteInfo ) then
     raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000341 {'Cannot open file (Error Code = %d).'},
      [GetLastError]);
end;

{ TIQWebExtDoc }

constructor TIQWebExtDoc.Create( AComponent:TComponent );
begin
  inherited;
  FMasterID := 0;
  FReadOnly := False;
  Height:= 160;
  Width := 501;
  Caption:= '';
  BevelOuter:= bvNone;
  FActive:= FALSE;
  Filter:= '(*.*)|*.*|(*.doc)|*.doc|(*.rtf)|*.rtf';
  FMasterFields:= 'ID';
  FRepositoryFiles:= TStringList.Create;
  FSelectedExternalDocsList:= TStringList.Create;  // 11-09-2009 support for tagging multiple docs at once
  FShowPopupMenu := True;

  {ExtDoc Query and TDataSource}
  with FQryExtDocs do
    begin
      IndexesActive := False;
      IndexFieldNames := 'ID';
      ConnectionName:=cnstFDConnectionName;
      UpdateOptions.AssignedValues := [uvUpdateChngFields, uvUpdateMode,
        uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired,
        uvCheckReadOnly, uvCheckUpdatable];
      UpdateOptions.RefreshMode := rmManual;
      UpdateOptions.CheckRequired := False;
      UpdateOptions.CheckReadOnly := False;
      UpdateOptions.CheckUpdatable := False;
      UpdateOptions.UpdateTableName := 'EXTERNAL_DOC';
      CachedUpdates := TRUE;
      OnNewRecord   := DoNewRecord;
      OnUpdateRecord:= UpdateExtDoc;
      AfterInsert   := AfterInsertExtDoc;
      AfterOpen     := AfterOpenExtDoc;
      AfterPost     := AfterPostExtDoc;
      AfterDelete   := AfterPostExtDoc;
      BeforeInsert  := BeforeInsertExtDoc; // 10/15/2013
      BeforeEdit    := BeforeEditExtDoc; // 10/15/2013
      BeforeDelete  := BeforeDeleteExtDoc;
      BeforePost    := BeforePostExtDoc;
      BeforeRefresh := BeforeRefreshExtDoc;
      OnCalcFields  := DoCalcFields;
      BeforeInsert  := DoBeforeInsert;
    end;

  FSrcExtDocs:= TDataSource.Create(self);
  with FSrcExtDocs do
  begin
    DataSet:= FQryExtDocs;
    OnDataChange:= DataChangeExtDocs;
  end;

//  PkDoc:= TIQWebHpick.Create(self);
//  with PkDoc do
//  begin
//    Name      := 'PkDocument';
//    BeforeOpen:= AssignParentIDBeforeOpen;
//    OnIQAfterCreateHPickColumn:= AssignPicklistDefaultColumnsWidth;
//  end;

  {Top Panel}
  with SearchBtn do
   begin
     Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000407; // 'Search'
     Glyph.LoadFromResourceName( HInstance, 'PKLIST' );
   end;

  with FilterBtn do
   begin
     Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000169; // 'Filter dataset'
     Glyph.LoadFromResourceName( HInstance, 'FILTER' );
   end;

   with FilterClearBtn do
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000377 = 'Remove Filter';
      Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000377;
      Glyph.LoadFromResourceName( HInstance, 'CLRFLTR' );
    end;

    with LaunchDocumentControl do
     begin
      Hint    := IQMS.WebVcl.ResourceStrings.cTXT0000060; // 'Launch Document Control'
      Glyph.LoadFromResourceName(HInstance, 'QCDOC');
      Visible := IsDocControlLicensed;
     end;

    with PrintDocument do
      begin
        // IQMS.WebVcl.ResourceStrings.cTXT0000062 = 'Print'
        Hint    := IQMS.WebVcl.ResourceStrings.cTXT0000062;
        Glyph.LoadFromResourceName(HInstance, 'PRINT');
        Visible := IsDocControlLicensed;
        Enabled:= CanExecuteDoc;
      end;

     with BtnScanDocument do
      begin
        Hint    := IQMS.WebVcl.ResourceStrings.cTXT0000434;  // 'Scan'
        Glyph.LoadFromResourceName(HInstance, 'SCAN');
        Visible := IsDocControlLicensed;
      end;


  FShape2.Hint:=cTXT0000071;
  FShape3.Hint:=cTXT0000072;
  FShape4.Hint:=cTXT0000073;
  FShape5.Hint:=cTXT0000302;
  FShape6.Hint:=cTXT0000442;
  FShape7.Hint:=cTXT0000459;

  Execute1.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000061; // 'Execute'
  Print1.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000062; // 'Print'
  ShowReleases1.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000409; // 'Show Releases'
  pfilter.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000169; // 'Filter dataset';
  AssignPrintWithToSelectedRecsClick1.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000397; // 'Assign ''Print With'' ...';


   AssignColumns( ExtDocsGrid );


  UpdateFilterOnStatusBar;
end;

procedure TIQWebExtDoc.AssignColumns( ADBGrid: TUniDBGrid );
var
  I: Integer;
begin
  ADBGrid.Columns.Clear;

  {Seq}
  CreateColumn( ExtDocsGrid, 'SEQ', IQMS.WebVcl.ResourceStrings.cTXT0000063 {' #'}, 23 );

  {Library}
  with CreateColumn( ExtDocsGrid, 'LIBRARY', IQMS.WebVcl.ResourceStrings.cTXT0000064 {'Library'}, 80 ) do
  begin
    ReadOnly:= TRUE;
//    if IsDocControlLicensed then  {qc_doc_share.pas - if licensed - popup picklist}
//       ButtonStyle:= cbsEllipsis;
  end;

  {Library Description}
  with CreateColumn( ExtDocsGrid, 'LIB_DESCRIP', IQMS.WebVcl.ResourceStrings.cTXT0000505 {'Library Description'}, 80 ) do
  begin
    ReadOnly:= TRUE;
    if IsDocControlLicensed then  {qc_doc_share.pas - if licensed - popup picklist}
//       ButtonStyle:= cbsEllipsis;
  end;

  {Document}
  with CreateColumn( ExtDocsGrid, 'DOC_DESCRIP', IQMS.WebVcl.ResourceStrings.cTXT0000065 {'Document Description'},  110 ) do
  begin
    if IsDocControlLicensed then    {if licensed - popup picklist or allow to}
//       ButtonStyle:= cbsEllipsis;   {to edit descrip directly - note readonly is false. See OnDataChange}
  end;

  {File Name}
  with CreateColumn( ExtDocsGrid, 'FILENAME', IQMS.WebVcl.ResourceStrings.cTXT0000066 {'File Name'}, 190 ) do
  begin
//    ButtonStyle:= cbsEllipsis;      {See OnDataChange}
  end;

  {Print for}
  with CreateColumn( ExtDocsGrid, 'PRINTWITH', IQMS.WebVcl.ResourceStrings.cTXT0000067 {'Print With'}, 80 ) do
//    ButtonStyle:= cbsEllipsis;

  {Status}
  with CreateColumn( ExtDocsGrid, 'STATUS', IQMS.WebVcl.ResourceStrings.cTXT0000068 {'Status'}, 60 ) do
    ReadOnly:= TRUE;

  {Rev}
  with CreateColumn( ExtDocsGrid, 'REVISION', IQMS.WebVcl.ResourceStrings.cTXT0000069 {'Revision'}, 60 ) do
    ReadOnly:= TRUE;

  {Include in Auto EForm}
  with CreateColumn( ExtDocsGrid, 'AUTO_EFORM', IQMS.WebVcl.ResourceStrings.cTXT0000400 {'Auto-EForm'}, 80 ) do
  begin
    PickList.Add('Y');
    PickList.Add('N');
  end;

  {No training required}
  with CreateColumn( ExtDocsGrid, 'NO_TRAINING_REQ', IQMS.WebVcl.ResourceStrings.cTXT0000411 {'No Training Req'}, 80 ) do
  begin
    PickList.Add('Y');
    PickList.Add('N');
  end;

  with CreateColumn( ExtDocsGrid, 'IS_EXPIRED', IQMS.WebVcl.ResourceStrings.cTXT0000414 {'Expired'}, 70 ) do
    ReadOnly:= TRUE;

  with CreateColumn( ExtDocsGrid, 'DATE_LAST_MODIFIED', IQMS.WebVcl.ResourceStrings.cTXT0000416 {'Last Modified'}, 90 ) do
    ReadOnly:= TRUE;

  if (csDesigning in ComponentState) or Show6USerFields then
  begin
    with CreateColumn( ExtDocsGrid, 'CUSER1', IQMS.WebVcl.ResourceStrings.cTXT0000427 {'User Text 1'}, 120 ) do
      ReadOnly:= TRUE;

    with CreateColumn( ExtDocsGrid, 'CUSER2', IQMS.WebVcl.ResourceStrings.cTXT0000428 {'User Text 2'}, 120 ) do
      ReadOnly:= TRUE;

    with CreateColumn( ExtDocsGrid, 'CUSER3', IQMS.WebVcl.ResourceStrings.cTXT0000429 {'User Text 3'}, 120 ) do
      ReadOnly:= TRUE;

    with CreateColumn( ExtDocsGrid, 'CUSER4', IQMS.WebVcl.ResourceStrings.cTXT0000430 {'User Text 4'}, 120 ) do
      ReadOnly:= TRUE;

    with CreateColumn( ExtDocsGrid, 'CUSER5', IQMS.WebVcl.ResourceStrings.cTXT0000431 {'User Text 5'}, 120 ) do
      ReadOnly:= TRUE;

    with CreateColumn( ExtDocsGrid, 'CUSER6', IQMS.WebVcl.ResourceStrings.cTXT0000432 {'User Text 6'}, 120 ) do
      ReadOnly:= TRUE;
  end;

  with CreateColumn( ExtDocsGrid, 'CUSER7', IQMS.WebVcl.ResourceStrings.cTXT0000415 {'User Text '}, 120 ) do
    ReadOnly:= TRUE;

  with CreateColumn( ExtDocsGrid, 'docno', IQMS.WebVcl.ResourceStrings.cTXT0000388 {'Doc #'}, 120 ) do
    ReadOnly:= TRUE;

  {Shortcut}
  if IsShopDataLicensed and (Source = 'STANDARD') then
  begin
    with CreateColumn( ExtDocsGrid, 'SHORTCUT_FROM', IQMS.WebVcl.ResourceStrings.cTXT0000335 {'Place Shortcut'}, 80 ) do
    begin
      PickList.Add('NONE');
      PickList.Add('SHOPDATA');
    end;

    CreateColumn( ExtDocsGrid, 'SHORTCUT_SEQ', IQMS.WebVcl.ResourceStrings.cTXT0000336 {'Shortcut Seq'}, 70 );
  end;
end;

function TIQWebExtDoc.Show6USerFields: Boolean;
begin
  Result := GetSwitch('ext_doc_show_6user_fields','params','N') = 'Y';
end;

procedure TIQWebExtDoc.RefreshShapeParams;

  procedure InternalAssign( AShape: TUniPanel; ALeft: Integer );
  begin
    with AShape do
    begin
      Left:= ALeft;
      Top:= 8;
      Width:= 10;
      Height:= 10;
    end;
  end;

begin
  PnlShape.Width := 74;

  InternalAssign(FShape2, 0);
  InternalAssign(FShape3, FShape2.Left + 12);
  InternalAssign(FShape4, FShape3.Left + 12);
  InternalAssign(FShape5, FShape4.Left + 12);
  InternalAssign(FShape6, FShape5.Left + 12);
  InternalAssign(FShape7, FShape6.Left + 12);
end;

function TIQWebExtDoc.CreateColumn( AGrid:TUniDBGrid; const AFieldName, ATitle: string; AWidth: Integer ):TUniBaseDBGridColumn;
begin
  Result:= AGrid.Columns.Add;
  with Result do
  begin
    FieldName    := AFieldName;
    Title.Caption:= ATitle;
    Width        := AWidth;
  end;
end;

function TIQWebExtDoc.CreateDocsField( FieldClass: TFieldClass; const AFieldName: string; ADataSet: TDataSet ):TField;
begin
  Result:= FieldClass.Create(self);
  with Result do
  begin
    FieldName := AFieldName;
    DataSet   := ADataSet;
  end;
end;

function TIQWebExtDoc.GetColumns: TUniDBGridColumns;
begin
  if Assigned(ExtDocsGrid) then
     Result:= ExtDocsGrid.Columns
  else
     Result:= NIL;
end;

procedure TIQWebExtDoc.SetColumns( AValue: TUniDBGridColumns );
begin
  // obsolete
  ExtDocsGrid.Columns:= AValue;
end;

function TIQWebExtDoc.GetActive:Boolean;
begin
  Result:= FActive;
end;

procedure TIQWebExtDoc.SetActive(AValue:Boolean);
begin
  // 01/06/2010 Do not set active if not connected (Byron)
  if not CheckConnected then
     Exit;

  // 09/27/2013 If requested Active = True, and the dataset is
  // already active, then exit early.  It is unnecessary to
  // refresh.
  if AValue = FQryExtDocs.Active then
    Exit;

  SetTablesActive( AValue );
  if (csLoading in ComponentState) then
    FActive:= AValue
  else
    FActive:= FQryExtDocs.Active;

  if not (csDesigning in ComponentState) then
     RefreshTarget;
end;

procedure TIQWebExtDoc.SetTablesActive( AValue:Boolean );
var
  ACursor: Integer;
begin
  // 01/06/2010 Check connection before setting active (Byron)
  if CheckConnected and (TableName <> '') then
    try
      FQryExtDocs.ConnectionName:='IQFD';
      try
        ACursor := Screen.Cursors[crSQLWait];
        Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
        AssignFields;
        AssignPickListFields;
        if FQryExtDocs.SQL.Text > '' then
          FQryExtDocs.Active:= AValue;
      finally
        Screen.Cursor := crArrow;
        Screen.Cursors[crSQLWait] := ACursor;
      end;
    except
      ShowMessage( Exception(ExceptObject).Message + #13 + FQryExtDocs.SQL.Text );
      FQryExtDocs.Active := FALSE;
    end;
end;

function TIQWebExtDoc.GetMasterSource:TDataSource;
begin
  Result:= FQryExtDocs.DataSource;
end;

procedure TIQWebExtDoc.SetMasterSource(AValue:TDataSource);
begin
  FQryExtDocs.DataSource:= AValue;
end;

function TIQWebExtDoc.GetTableName:string; {obsolete. returns Source}
begin
  Result:= Source;
end;

procedure TIQWebExtDoc.SetTableName( const AValue:string );
begin
  if      AValue = 'ARCUSTO_EXT_DOC'   then  Source:= 'ARCUSTO'
  else if AValue = 'ARINVT_EXT_DOC'    then  Source:= 'ARINVT'
  else if AValue = 'CRM_EXT_DOC'       then  Source:= 'CRM'
  else if AValue = 'CRM_QUOTE_EXT_DOC' then  Source:= 'CRM_QUOTE'
  else if AValue = 'HR_EXT_DOC'        then  Source:= 'HR'
  else if AValue = 'JOBSHOP_EXT_DOC'   then  Source:= 'JOBSHOP'
  else if AValue = 'ORDERS_EXT_DOC'    then  Source:= 'ORDERS'
  else if AValue = 'PARTNER_EXT_DOCS'  then  Source:= 'PARTNER'
  else if AValue = 'PMEQMT_EXT_DOC'    then  Source:= 'PMEQMT'
  else if AValue = 'PMTASK_EXT_DOC'    then  Source:= 'PMTASK'
  else if AValue = 'PR_EXT_DOC'        then  Source:= 'PR'
  else if AValue = 'QSNDOP_EXT_DOC'    then  Source:= 'QSNDOP'
  else if AValue = 'QUOTE_EXT_DOC'     then  Source:= 'QUOTE'
  else if AValue = 'SNDOP_EXT_DOC'     then  Source:= 'SNDOP'
  else if AValue = 'STANDARD_EXT_DOC'  then  Source:= 'STANDARD'
  else if AValue = 'TOOL_EXT_DOC'      then  Source:= 'TOOL'
  else if AValue = 'TOOL_TASK_EXT_DOC' then  Source:= 'TOOL_TASK'
  else if AValue = 'VENDOR_EXT_DOC'    then  Source:= 'VENDOR'
  else if AValue = 'QC_AUDIT_DOCS'     then  Source:= 'QC_AUDIT'
  else
       Source:= AValue;
end;

procedure TIQWebExtDoc.SetSource( AValue: string );
begin
  FSource:= AValue;
end;

function TIQWebExtDoc.GetIsReadOnly: Boolean;
begin
  // 10/15/2013 Do not reference the CachedUpdates property.
  with FQryExtDocs do
    Result := FReadOnly and not
     (Assigned( OnUpdateRecord ) or Assigned( UpdateObject ));
end;

procedure TIQWebExtDoc.SetIsReadOnly( AValue: Boolean );
begin
  // 10/15/2013 Do not modify the CachedUpdates property.  This causes
  // a display problem with the TDBNavigator.
  FReadOnly := AValue;

  if not AValue then
     ExtDocNav.VisibleButtons := cnstStandardVisiBtns
  else
     ExtDocNav.VisibleButtons := cnstReadOnlyVisiBtns;

//  IQMS.Common.Controls.ResizeNavBar(FNav, FNav.Height);
end;

function TIQWebExtDoc.GetSource_ID: Real;
begin
  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) and (MasterFields <> '') then
     Result:= MasterSource.DataSet.FieldByName( MasterFields ).asFloat
  else
     Result := FMasterID;
end;

procedure TIQWebExtDoc.SetSource_ID(const Value: Real);
begin
  // 01/06/2010 This method added so that the source/source_id could be
  // set manually without connecting a datasource to this component.
  // The calling form can set all properties except MasterSource, and
  // then set the Source_ID in an event (such as TDataChangeEvent).
  // This is required when working with DBExpress source datasets.

  // If the master source is assigned, then assume we have a datasource
  // connected; we don't need to set the source ID value, since it comes
  // from the datasource.
  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) and (MasterFields > '') then
     Exit;

  // Set the private variable which will be referenced in GetSource_ID.
  FMasterID := Value;

  // Apply the value to the dataset parameter, and then refresh the data.
  if (FQryExtDocs.Params.FindParam(MasterFields) <> NIL) then
     begin
       FQryExtDocs.ParamByName(MasterFields).Value := Trunc(Value);
       Refresh;
     end;
end;

function TIQWebExtDoc.GetLibPath( ADoc_Library_ID: Real ): string;
begin
  // 09/03/2014 Use library function (Byron).  Add for use outside this
  // component for YouTrack:
  // EIQ-3864 SPC Quick Inspection, Add additional Data Types to Parameters
  Result := DocumentLibraryPath(ADoc_Library_ID);
end;

function TIQWebExtDoc.GetMasterField: TField;
begin
  if Assigned(MasterSource) and
    Assigned(MasterSource.DataSet) and
    (MasterFields > '') then
    Result := MasterSource.DataSet.FindField(MasterFields);
end;

function TIQWebExtDoc.MasterFieldValue: Int64;
var
  AField: TField;
begin
  AField := GetMasterField;
  if Assigned(AField) then
    Result := AField.AsLargeInt;
end;

procedure TIQWebExtDoc.AssignFields;
var
  i:Integer;
  AParamName: string;
  AField: TField;
begin
  AParamName := MasterFields;
  if AParamName = ''  then
   AParamName := 'ID';

  AField := GetMasterField;

  if (TableName <> '') then
    begin
      if FQryExtDocs.ConnectionName = '' then
        FQryExtDocs.ConnectionName := 'IQFD';

      with FQryExtDocs do
        begin
          {Clear}
          Close;
          while FieldCount > 0 do Fields[ 0 ].Free;

          SQL.Clear;

          {Displayed}
          SQL.Add(       'select seq,                     ');
          SQL.Add(       '       library,                 ');
          SQL.Add(       '       lib_descrip,             ');
          SQL.Add(       '       doc_descrip,             ');
          SQL.Add(       '       filename,                ');
          SQL.Add(       '       print_with,              ');
          SQL.Add(       '       status,                  ');
          SQL.Add(       '       revision,                ');
          SQL.Add(       '       shortcut_from,           ');
          SQL.Add(       '       shortcut_seq,            ');
          SQL.Add(       '       auto_eform,              ');
          SQL.Add(       '       no_training_req,         ');

          {hidden}
          SQL.Add(       '       doc_used_id,             ');
          SQL.Add(       '       doc_library_id,          ');
          SQL.Add(       '       lib_path,                ');
          SQL.Add(       '       default_ext,             ');
          SQL.Add(       '       lib_type,                ');
          SQL.Add(       '       revision_path,           ');
          SQL.Add(       '       keep_revisions,          ');
          SQL.Add(       '       external_doc_id,         ');
          SQL.Add(       '       owner_team_member_id,    ');
          SQL.Add(       '       doc_revision_id,         ');
          SQL.Add(       '       source,                  ');
          SQL.Add(       '       effect_date,             ');
          SQL.Add(       '       deactive_date,           ');
          SQL.Add(       '       sysdate,                 ');
          SQL.Add(       '       source_id,               ');
          SQL.Add(       '       type,                    ');
          SQL.Add(       '       doc_repository_id,       ');
          SQL.Add(       '       repository_alias,        ');
          SQL.Add(       '       repository_data,         ');
          SQL.Add(       '       convert_to_pdf_display,  ');

          SQL.Add(       '       (select name from team_member where id = owner_team_member_id) as owner_name,  ');
          SQL.Add(       '       docno,                   ');
          SQL.Add(       '       is_expired,              ');
          SQL.Add(       '       cuser1,                  ');
          SQL.Add(       '       cuser2,                  ');
          SQL.Add(       '       cuser3,                  ');
          SQL.Add(       '       cuser4,                  ');
          SQL.Add(       '       cuser5,                  ');
          SQL.Add(       '       cuser6,                  ');
          SQL.Add(       '       cuser7,                  ');
          SQL.Add(       '       date_last_modified,      ');
          SQL.Add(       '       pk_hide                  ');

          SQL.Add(       '  from v_external_docs          ');
          SQL.Add(Format(' where source = ''%s''          ', [ Source      ]));
          SQL.Add(Format('   and source_id = :%s          ', [ AParamName]));  { Ex: "source_id = :ID" }

          SQL.Add(       '-- _ORDER_BY_START_             ');
          SQL.Add(       ' order by seq                   ');
          SQL.Add(       '-- _ORDER_BY_END_               ');

          if Params.FindParam(AParamName) = nil then
            Params.CreateParam(ftBCD, AParamName, ptInput);
          if Assigned(AField) then
            ParamByName(AParamName).DataType:= AField.DataType
          else
            ParamByName(AParamName).DataType:= ftBCD;
          ParamByName(AParamName).ParamType := ptInput;
        end;  {with FDocsLink}

      CreateTFields( FQryExtDocs );
      UpdateFieldsOrigin( FQryExtDocs );
      ChangeSortField( FQryExtDocs.FieldByName('seq'));
    end;
end;

procedure TIQWebExtDoc.UpdateFieldsOrigin( ADataSet: TDataSet );
var
  i: Integer;
begin
  for i:= 0 to ADataSet.Fields.Count - 1 do
    ADataSet.Fields[i].Origin:= ADataSet.Fields[i].FieldName;
end;


procedure TIQWebExtDoc.CreateTFields( ADataSet: TDataSet );
var
  I: Integer;
  AField: TField;
begin
   ADataSet.FieldDefs.Update;

  {Physical fields}
  for I:= 0 to ADataSet.FieldDefs.Count - 1 do
    AField:= ADataSet.FieldDefs[ I ].CreateField( ADataSet );

  {Captions}
  AssignDisplayLabels( ADataSet );

  if ADataSet = FQryExtDocs then
  begin
     with TStringField.Create( self ) do
     begin
       FieldName:= 'PrintWith';
       DataSet  := FQryExtDocs;
       Name     := 'QryExtDocs' + FieldName;
       FieldKind:= fkCalculated;
       Index    := FQryExtDocs.FieldCount;
       Size     := 50;
     end;

     with TStringField.Create( self ) do
     begin
       FieldName:= 'IsFileExist';
       DataSet  := FQryExtDocs;
       Name     := 'QryExtDocs' + FieldName;
       FieldKind:= fkCalculated;
       Index    := FQryExtDocs.FieldCount;
       Size     := 1;
       Visible  := False;
     end;
  end;
end;

procedure TIQWebExtDoc.Loaded;
var
  AParentTableName: string;
  ACol            : TUniBaseDBGridColumn;
begin
  inherited Loaded;

  if CheckConnected then
  try
    if not (csDesigning in ComponentState) then
       FDefaultDoc_Library_ID := EnsureDefaultLibraryIDExists; {qc_doc_share.pas}

    {Open dataset}
    SetTablesActive( Active );

    if not (csDesigning in ComponentState) then
       AssignDropMasterTextTarget;

    {Property Columns got stored in the DFMs. Needed to add new columns for QC - overwrite DFM here}
    AssignColumns( ExtDocsGrid );

    {Print with}
//    ACol:= IQColumnByName( ExtDocsGrid, 'PRINT_WITH' );
    if Assigned( ACol ) then
    begin
      AParentTableName:= MasterTableName;
      AssignPrintWithToList( ACol.PickList, AParentTableName );  {DocDesc.pas}
    end;

    {FileName}
    if not (csDesigning in ComponentState) then
    begin
       ACol:= IQColumnByName( ExtDocsGrid, 'FILENAME' );
       if Assigned( ACol ) and (GetSwitch('doc_hide_unc_path','params','N') = 'Y') then
          ACol.Collection:= NIL;

    end;

    IQRegFormRead( self, [ ExtDocsGrid ]);

    AdjustScreen;
  except
    if csDesigning in ComponentState then
      Application.HandleException(Self)
    else
      raise;
  end;
end;

function TIQWebExtDoc.LocateExternalDoc(AExternal_Doc_ID: Real): Boolean;
begin
  Result := FQryExtDocs.Locate('external_doc_id', AExternal_Doc_ID, []);
end;

procedure TIQWebExtDoc.DoubleClick(Sender: TObject);
begin
  ActivateOLELink;
end;

procedure TIQWebExtDoc.EditExtDocGridColumnClick(Sender: TObject);
var
  AID: Real;
  APrintWith: String;
begin
  // avail only if IQDoc licensed
//  with ExtDocsGrid do
//    if CompareText( SelectedField.FieldName, 'library' ) = 0 then
//         begin
//           if (FQryExtDocs.FieldByName('doc_library_id').asFloat = 0) and (FQryExtDocs.State <> dsInsert) then
//              FQryExtDocs.Insert  // this will cause the library picklist to popup
//
//           else if DoPkList_Doc_Library( AID ) then with FQryExtDocs do                        {QC_PkLib.pas}
//              AssignDoc_Library( AID );
//         end
//
//    else if CompareText( SelectedField.FieldName, 'doc_descrip' ) = 0 then
//         begin
//           if DoPkList_DocEx( FQryExtDocs.FieldByName('doc_library_id').asFloat, MasterTableName, Source_ID,  FSelectedExternalDocsList, FQryExtDocs.State = dsInsert  ) then {QC_PkDoc.pas}
//              AssignExternalDocsFromSelectedList;
//         end
//
//    else if CompareText( SelectedField.FieldName, 'filename' ) = 0 then
//         begin
//           if IsDocControlLicensed then
//              begin
//                if DoPkList_DocEx( FQryExtDocs.FieldByName('doc_library_id').asFloat, MasterTableName, Source_ID,  FSelectedExternalDocsList, FQryExtDocs.State = dsInsert  ) then {QC_PkDoc.pas}
//                   AssignExternalDocsFromSelectedList;
//              end
//           else
//              AttachFile( Sender );
//         end
//
//    else if CompareText( SelectedField.FieldName, 'PrintWith' ) = 0 then
//         begin
//              APrintWith := FQryExtDocs.FieldByName( 'PRINT_WITH' ).AsString;
//              if DoPrintWith( Self, Source, APrintWith ) then
//                 begin
//                      if not ( FQryExtDocs.State in [ dsEdit, dsInsert ] ) then
//                         FQryExtDocs.Edit;
//                      FQryExtDocs.FieldByName( 'PRINT_WITH' ).AsString := APrintWith;
//                      FQryExtDocs.Post;
//                 end;
//         end;
end;

procedure TIQWebExtDoc.AttachFile( Sender: TObject );
var
  AFileName       : string;
  AExternal_Doc_ID: Real;
begin
  AFileName:= FQryExtDocs.FieldByName('filename').asString;

  if OpenFileDialogGetFileName( AFileName ) then
    with FQryExtDocs do
    begin
      if not (State in [dsInsert, dsEdit]) then  Edit;

      AExternal_Doc_ID:= FindRegisteredExternalDocID( FieldByName('doc_library_id').asFloat, AFileName );

      if AExternal_Doc_ID = 0 then
        begin
          FieldByName('external_doc_id').asFloat:= GetNextID( 'external_doc' );
          FieldByName('doc_descrip').asString   :=
            IQMS.WebVcl.ResourceStrings.cTXT0000074 {'Doc ID'} +
            #32 {space} +
            FieldByName('external_doc_id').asString;
          FieldByName('doc_revision_id').asFloat:= GetNextID( 'doc_revision' );
          FieldByName('filename').asString      := AFileName;
        end
      else
        begin
          FieldByName('external_doc_id').asFloat:= AExternal_Doc_ID;
          FieldByName('doc_descrip').asString   := SelectValueFmtAsString(
            'SELECT descrip FROM external_doc WHERE id = %.0f',
            [AExternal_Doc_ID]);
          FieldByName('doc_revision_id').asFloat:= SelectValueFmtAsInt64(
            'SELECT id FROM doc_revision WHERE external_doc_id = %.0f AND ' +
            'UPPER(filename) = ''%s'' AND NVL(hist, ''N'') = ''N''',
            [AExternal_Doc_ID, UpperCase(FixStr(AFileName))]);
          FieldByName('filename').asString      := AFileName;
        end
    end;
end;

procedure TIQWebExtDoc.AttachFile_Ex( AFileName, ADescription: string );
var
  AExternal_Doc_ID: Real;
begin
  with FQryExtDocs do
  begin
    if not (State in [dsInsert, dsEdit]) then  Edit;

    AExternal_Doc_ID:= FindRegisteredExternalDocID( FieldByName('doc_library_id').asFloat, AFileName );

    if AExternal_Doc_ID = 0 then
      begin
        FieldByName('external_doc_id').asFloat:= GetNextID('external_doc');
        FieldByName('doc_descrip').asString   := ADescription;
        FieldByName('doc_revision_id').asFloat:= GetNextID('doc_revision');
        FieldByName('filename').asString      := AFileName;
        FieldByName('status').asString        := QC_DOC_RELEASED;  {Feb-10-2006}
      end
    else
      begin
        FieldByName('external_doc_id').asFloat:= AExternal_Doc_ID;
        FieldByName('doc_descrip').asString   := SelectValueFmtAsString(
          'SELECT descrip FROM external_doc WHERE id = %.0f',
          [AExternal_Doc_ID]);
        FieldByName('doc_revision_id').asFloat:= SelectValueFmtAsInt64(
          'SELECT id FROM doc_revision WHERE external_doc_id = %.0f AND ' +
          'UPPER(filename) = ''%s'' AND NVL(hist, ''N'') = ''N''',
          [AExternal_Doc_ID, UpperCase(FixStr(AFileName))]);
        FieldByName('filename').asString      := AFileName;
      end
  end;
end;

function TIQWebExtDoc.OpenFileDialogGetFileName( var AFileName: string ): Boolean;
var
  ALibPath: string;
begin
  with TOpenDialog.Create(self) do
  try
    Filter:= self.Filter;

    {based on library assign initial dir}
    ALibPath:= GetLibPath( FQryExtDocs.FieldByName('doc_library_id').asFloat );

    if ALibPath = '' then
       InitialDir:= ExtractFilePath( AFileName )
    else
       InitialDir:= ALibPath;

    Result:= Execute;
    if Result then
    begin
      if ALibPath = '' then
         AFileName:= FileName
      else
         AFileName:= ExtractFileName( FileName );
    end;
  finally
    Free;
  end;
end;

function TIQWebExtDoc.FindRegisteredExternalDocID( ADoc_Library_ID: Real; AFileName: string ): Real;
begin
  // 09/03/2014 Use library function (Byron).  Add for use outside this
  // component for YouTrack:
  // EIQ-3864 SPC Quick Inspection, Add additional Data Types to Parameters
  Result := GetRegisteredExternalDocID(ADoc_Library_ID, AFileName);
end;

procedure TIQWebExtDoc.DoNewRecord(DataSet: TDataSet);
begin
  if Assigned(OnNewRecord) then
     OnNewRecord( DataSet );

  if (Source > '') and (Source_ID > 0) then
  begin
    DataSet.FieldByName('seq').asFloat := 1 +
      SelectValueFmtAsInteger(
      'SELECT MAX(seq) FROM doc_used WHERE source = ''%s'' AND ' +
      'source_id = %.0f', [ Source, Source_ID ]);
    DataSet.FieldByName('source').asString  := Source;
    DataSet.FieldByName('source_id').asFloat:= Source_ID;
    DataSet.FieldByName('doc_used_id').asFloat:= GetNextID('DOC_USED');
    DataSet.FieldByName('print_with').asString:= 'NONE';
  end;

  // IQMS.WebVcl.ResourceStrings.cTXT0000334 =
  // 'Parent is not assigned - document cannot be associated with an
  // undefined parent.'
  IQAssert( DataSet.FieldByName('source_id').asFloat > 0,
    IQMS.WebVcl.ResourceStrings.cTXT0000334);
end;

procedure TIQWebExtDoc.DoOnTitleClick(Column: TUniDbGridColumn);
begin
  if Assigned(Column.Field) then
     ChangeSortField(Column.Field);
end;

procedure TIQWebExtDoc.AssignDisplayLabels( ADataSet: TDataSet );
var
   i: Integer;

   procedure AssignFieldDisplayLabel( AFieldName, ATitle: string );
   begin
     if ADataSet.FindField( AFieldName ) <> nil then
     begin
       ADataSet.FieldByName( AFieldName ).DisplayLabel:= ATitle;
       ADataSet.FieldByName( AFieldName ).Tag:= 1;  // for wwFilterDialog
     end;
   end;

   function DefaultUserDefinedTo( ADefaultCaption, AUserDefinedComponentName: string ): string;
   begin
     Result:= TIQWebUserDefLabel.GetUserLabelCaption('IQQC.EXE',
       'FrmQCDocMaint', AUserDefinedComponentName); // IQMS.WebVcl.UserDefinedLabel
     if Result = '' then
        Result:= ADefaultCaption;
   end;

   procedure _EnsureUserDefinedColumnCorrectTitle( AFieldName: string );
   var
     AColumn: TUniDbGridColumn;
   begin
//     AColumn:= IQMS.Common.Controls.IQColumnByName( ExtDocsGrid, AFieldName );
     if Assigned(AColumn) and Assigned(ADataSet.FindField( AFieldName )) then
        AColumn.Title.Caption:= ADataSet.FieldByName( AFieldName ).DisplayLabel;
   end;


begin
  {visible}
  AssignFieldDisplayLabel('library', IQMS.WebVcl.ResourceStrings.cTXT0000064); {'Library'}
  AssignFieldDisplayLabel('lib_descrip', IQMS.WebVcl.ResourceStrings.cTXT0000505); {'Library Description'}
  AssignFieldDisplayLabel('doc_descrip', IQMS.WebVcl.ResourceStrings.cTXT0000065); {'Document'}
  AssignFieldDisplayLabel('filename'   , IQMS.WebVcl.ResourceStrings.cTXT0000066); {'File Name'}
  AssignFieldDisplayLabel('status'     , IQMS.WebVcl.ResourceStrings.cTXT0000068); {'Status'}
  AssignFieldDisplayLabel('revision'   , IQMS.WebVcl.ResourceStrings.cTXT0000069); {'Revision'}
  AssignFieldDisplayLabel('seq'        , IQMS.WebVcl.ResourceStrings.cTXT0000063); {' #'}
  AssignFieldDisplayLabel('print_with' , IQMS.WebVcl.ResourceStrings.cTXT0000067); {'Print With'}
  AssignFieldDisplayLabel('auto_eform' , IQMS.WebVcl.ResourceStrings.cTXT0000400); {'Auto-EForm'}
  AssignFieldDisplayLabel('no_training_req', IQMS.WebVcl.ResourceStrings.cTXT0000411); {'No Training Req'}
  AssignFieldDisplayLabel('is_expired' , IQMS.WebVcl.ResourceStrings.cTXT0000414); {'Expired'}
  AssignFieldDisplayLabel('date_last_modified', IQMS.WebVcl.ResourceStrings.cTXT0000416); {'Last Modified'}
  // IQMS.WebVcl.ResourceStrings.cTXT0000427 = 'User Text 1';
  AssignFieldDisplayLabel('cuser1'     , DefaultUserDefinedTo( IQMS.WebVcl.ResourceStrings.cTXT0000427, 'IQUserDefLabelOnGrid1'));
  // IQMS.WebVcl.ResourceStrings.cTXT0000428 = 'User Text 2';
  AssignFieldDisplayLabel('cuser2'     , DefaultUserDefinedTo( IQMS.WebVcl.ResourceStrings.cTXT0000428, 'IQUserDefLabelOnGrid2'));
  // IQMS.WebVcl.ResourceStrings.cTXT0000429 = 'User Text 3';
  AssignFieldDisplayLabel('cuser3'     , DefaultUserDefinedTo( IQMS.WebVcl.ResourceStrings.cTXT0000429, 'IQUserDefLabelOnGrid3'));
  // IQMS.WebVcl.ResourceStrings.cTXT0000430 = 'User Text 4';
  AssignFieldDisplayLabel('cuser4'     , DefaultUserDefinedTo( IQMS.WebVcl.ResourceStrings.cTXT0000430, 'IQUserDefLabelOnGrid4'));
  // IQMS.WebVcl.ResourceStrings.cTXT0000431 = 'User Text 5';
  AssignFieldDisplayLabel('cuser5'     , DefaultUserDefinedTo( IQMS.WebVcl.ResourceStrings.cTXT0000431, 'IQUserDefLabelOnGrid5'));
  // IQMS.WebVcl.ResourceStrings.cTXT0000432 = 'User Text 6';
  AssignFieldDisplayLabel('cuser6'     , DefaultUserDefinedTo( IQMS.WebVcl.ResourceStrings.cTXT0000432, 'IQUserDefLabelOnGrid6'));
  // IQMS.WebVcl.ResourceStrings.cTXT0000415 = 'User Text 7';
  AssignFieldDisplayLabel('cuser7'     , DefaultUserDefinedTo( IQMS.WebVcl.ResourceStrings.cTXT0000415, 'IQUserDefLabelOnGrid7'));

  {in case of CUser1-7 ensure the correct title}
  for i:= 1 to 7 do
    _EnsureUserDefinedColumnCorrectTitle( Format('CUSER%d', [ i ]));

  {non visible}
  AssignFieldDisplayLabel('docno'      , IQMS.WebVcl.ResourceStrings.cTXT0000388); // 'Doc #';
  AssignFieldDisplayLabel('owner_name' , IQMS.WebVcl.ResourceStrings.cTXT0000389); // 'Owner';

  {restore grid settings in case title change ex: CUSER7 }
  IQRegFormRead( self, [ ExtDocsGrid ]);
end;


procedure TIQWebExtDoc.AfterInsertExtDoc(DataSet: TDataSet);
var
  AID: Real;
begin
  if (Source > '') and (Source_ID > 0) then
  begin
    if not IsDocControlLicensed then
    begin
      AssignDoc_Library( FDefaultDoc_Library_ID );
      AttachFile( NIL );
      EXIT;
    end;

    // 08/28/2014 If the doc_library_id is already assigned, do not prompt.
    if (FQryExtDocs.FieldByName('doc_library_id').AsInteger > 0) then
      AID := FQryExtDocs.FieldByName('doc_library_id').AsInteger
    else
      if not DoPkList_Doc_Library( {var} AID ) then
        AID := 0;

    if AID > 0 then
      begin
         AssignDoc_Library( AID );
         if DoPkList_DocEx( FQryExtDocs.FieldByName('doc_library_id').asFloat,
           MasterTableName, Source_ID,  FSelectedExternalDocsList,
           FQryExtDocs.State = dsInsert ) then {QC_PkDoc.pas}
            AssignExternalDocsFromSelectedList;
      end;
  end;
end;


procedure TIQWebExtDoc.AfterOpenExtDoc(DataSet: TDataSet);
begin
  SetButtons;
end;

function TIQWebExtDoc.UseConvertToPDF: Boolean;
begin
  Result:= FQryExtDocs.FieldByName('convert_to_pdf_display').asString = 'Y';
end;

function TIQWebExtDoc.GetPdfFileName( AFileName: string ): string;
begin
  Result:= ChangeFileExt( AFileName, '.PDF' );
end;


function TIQWebExtDoc.CheckUseConvertPDFRedirectFileName( AOriginalFileName: string ): string;
begin
  Result:= AOriginalFileName;
  if UseConvertToPDF and FileExists( GetPdfFileName( AOriginalFileName )) then
     Result:= GetPdfFileName( AOriginalFileName );
end;


procedure TIQWebExtDoc.SaveRepositoryToLocalFile( var AFileName: string; APrev_Doc_Revision_ID: Real );
var
  ADoc_Repository_ID: Real;
begin
  ADoc_Repository_ID:= SelectValueByID('doc_repository_id', 'doc_revision', APrev_Doc_Revision_ID );

  if ADoc_Repository_ID = 0 then
     raise Exception.Create('Repository record ID is not assigned');

  if not EstablishRepositoryAccess( FDNetRepository, FQryExtDocs.FieldByName('repository_alias').asString, CharXOR(FQryExtDocs.FieldByName('repository_data').asString)) then {qc_doc_share.pas}
     System.SysUtils.Abort;

  {store the repository file in a temp folder c:\iqwin\temp\arik\123.txt}
  if (SecurityManager <> nil) then
     AFileName:= Format('%s\temp\%s\%s', [ ExcludeTrailingBackslash( IQGetLocalHomePath ), SecurityManager.UserName, AFileName ])
  else
     AFileName:= Format('%s\temp\%s', [ ExcludeTrailingBackslash( IQGetLocalHomePath ), AFileName ]);

  AssignFileReadOnly( AFileName, FALSE {readonly});

  if UseConvertToPDF then
  begin
    AssignFileReadOnly( GetPdfFileName( AFileName ), FALSE {readonly});
    if not DNET_SaveToPDF( FDNetRepository, ADoc_Repository_ID, GetPdfFileName( AFileName )) then
       raise Exception.Create('Unable to save a blob repository record to a temp pdf file');
    if FileExists( GetPdfFileName( AFileName )) then
       AFileName:= GetPdfFileName( AFileName );
  end;

  if not UseConvertToPDF
     or
     UseConvertToPDF and not FileExists( GetPdfFileName( AFileName )) then
  begin
     if not DNET_SaveToFile( FDNetRepository, ADoc_Repository_ID, AFileName ) then
        raise Exception.Create('Unable to save a blob repository record to a temp file');
  end;

  AssignFileReadOnly( AFileName, TRUE {readonly});

  if FRepositoryFiles.IndexOf( AFileName ) = -1 then
     FRepositoryFiles.Add( AFileName );
end;


procedure TIQWebExtDoc.FilterClearClick(Sender: TObject);
begin
  try
//    FilterDialog.ClearFilter;
//    FilterDialog.ApplyFilter;
  finally
    FQryExtDocs.Filtered:= False;
  end;
  UpdateFilterOnStatusBar;
end;

procedure TIQWebExtDoc.FilterClick(Sender: TObject);
begin
  {Execute WWFilter}
  AssignFilterSelectedFields;
//  FilterDialog.Execute;
  UpdateFilterOnStatusBar;
end;


procedure TIQWebExtDoc.AssignFilterSelectedFields;
var
  I: Integer;
begin
//  if FilterDialog.FieldInfo.Count > 0 then
//     EXIT;

  for I:= 0 to FQryExtDocs.Fields.Count - 1 do
    if FQryExtDocs.Fields[ I ].Tag = 1 then
//       FilterDialog.SelectedFields.Add( FQryExtDocs.Fields[ I ].FieldName );
end;


function TIQWebExtDoc.FindPreviousVerFullFileName( var APrevFileName: string ): Boolean;
var
  APrev_Doc_Revision_ID: Real;
begin
  Result:= FALSE;

  with FQryExtDocs do
  begin
    {Ensure pending state}
    if not ( ((FieldByName('status').asString = QC_DOC_PENDING)
              or
              (FieldByName('status').asString = QC_DOC_AUTHORIZED)
              or
              (FieldByName('status').asString = QC_DOC_CHECKED_OUT))

            and
              ( IsRepositoryKind() or (Trim( FieldByName('revision_path').asString ) > ''))

            and
              ( FieldByName('keep_revisions').asString = 'Y')) then
      EXIT;

    {Previous revison}
    APrev_Doc_Revision_ID:= SelectValueFmtAsInt64(
      'SELECT MAX(id) FROM doc_revision WHERE external_doc_id = %.0f AND ' +
      'hist = ''Y''', [FieldByName('external_doc_id').asFloat]);
    if APrev_Doc_Revision_ID = 0 then
       EXIT;

    {File name}
    APrevFileName:= SelectValueFmtAsString(
      'SELECT filename FROM doc_revision WHERE id = %.0f',
      [APrev_Doc_Revision_ID]);

    if APrevFileName > '' then
    begin
      if IsRepositoryKind() then
         SaveRepositoryToLocalFile( APrevFileName, APrev_Doc_Revision_ID )
      else
         begin
           APrevFileName:= IncludeTrailingBackslash(FieldByName('revision_path').asString) + ExtractFileName( APrevFileName );
           APrevFileName:= CheckUseConvertPDFRedirectFileName( APrevFileName );
         end;
    end;

    Result:= TRUE;
  end;
end;

function TIQWebExtDoc.FindRevisionFullFileName( ARevision_Doc_ID: Real; var APrevFileName: string ): Boolean;
begin
  with FQryExtDocs do
  begin
    if ARevision_Doc_ID = 0 then
       EXIT;

    {File name}
    APrevFileName:= SelectValueByID('filename', 'doc_revision', ARevision_Doc_ID );

    if APrevFileName > '' then
    begin
      if IsRepositoryKind() then
         SaveRepositoryToLocalFile( APrevFileName, ARevision_Doc_ID )
      else
         begin
           APrevFileName:= IncludeTrailingBackslash(FieldByName('revision_path').asString) + ExtractFileName( APrevFileName );
           APrevFileName:= CheckUseConvertPDFRedirectFileName( APrevFileName );
         end;
    end;

    Result:= TRUE;
  end;
end;


function TIQWebExtDoc.GetFullFileName( AShowPrevWhenPending: Boolean = FALSE ): string;
var
  ALibPath: string;
begin
  with FQryExtDocs do
  begin
    ALibPath:= GetLibPath( FieldByName('doc_library_id').asFloat );

    Result:= FieldByName('filename').asString;

    Result:= CheckUseConvertPDFRedirectFileName( Result );

    {Default lib}
    if not IsRepositoryKind() and (Trim(ALibPath) = '') then
       EXIT;

    {special state - pending status}
    if AShowPrevWhenPending
       and (  (FieldByName('status').asString = QC_DOC_PENDING)
            or
              (FieldByName('status').asString = QC_DOC_AUTHORIZED)
            or
              (FieldByName('status').asString = QC_DOC_CHECKED_OUT )
            or
              (FieldByName('status').asString = QC_DOC_NEW )) then
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000487 =
      // 'The document is in the Pending Review/Authorization stage.'#13'Unable to proceed';
      if FieldByName('keep_revisions').asString = 'N' then
         raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000487);
      // IQMS.WebVcl.ResourceStrings.cTXT0000488 =
      // 'No previous version was found � unable to proceed.'#13'Document must have ''Released'' status.';
      if not FindPreviousVerFullFileName( Result ) then
         raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000488);

      EXIT;
    end;

    {all others}
    if IsRepositoryKind() then
       SaveRepositoryToLocalFile( Result, FieldByName('doc_revision_id').asFloat )
    else
       begin
         Result:= IncludeTrailingBackslash( ALibPath ) + FieldByName('filename').asString;
         Result:= CheckUseConvertPDFRedirectFileName( Result );
       end;
  end;
end;


function TIQWebExtDoc.GetRevisionFullFileName( ARevision_Doc_ID: Real ): string;
var
  ALibPath: string;
begin
  with FQryExtDocs do
  begin
    ALibPath:= GetLibPath( FieldByName('doc_library_id').asFloat );

    Result:= FieldByName('filename').asString;

    {Default lib}
    if not IsRepositoryKind() and (Trim(ALibPath) = '') then
       EXIT;
    // IQMS.WebVcl.ResourceStrings.cTXT0000489 =
    // 'Revision identified by ID %.0f was not found � unable to proceed.';
    if not FindRevisionFullFileName( ARevision_Doc_ID,  Result ) then
       raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000489, [ ARevision_Doc_ID ]);
  end;
end;

procedure TIQWebExtDoc.ActivateOLELink( AVerb: string = 'open' );
var
  AFileName: string;
begin
  with FQryExtDocs do
  begin
    if (State = dsInactive) or (Eof and Bof) then
       EXIT;
    CheckBrowseMode;

    {Check expiry date}
    if (FieldByName('deactive_date').asDateTime > 0) and
      (FieldByName('deactive_date').asDateTime < SelectValueAsDateTime('select sysdate from dual')) then
       // IQMS.WebVcl.ResourceStrings.cTXT0000301 =
       // 'The document is not available - it is expired and requires review.'
       raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000301 );
    AFileName:= GetFullFileName( cSHOW_PREV_WHEN_PENDING );
    IQAssert( FileExists(AFileName), Format( cTXT0000076 {'File %s not found'}, [ AFileName ]));
    IQShellExecute( AFileName, AVerb );
  end;
end;

function TIQWebExtDoc.FindMenuItemByName( AName: string ): TMenuItem;
var
  I: Integer;
begin
  for I:= 0 to ExtPopUpMenu.Items.Count - 1 do
  begin
    if CompareText( ExtPopUpMenu.Items[ I ].Name, AName ) = 0  then
    begin
      Result:= ExtPopUpMenu.Items[ I ];
      EXIT;
    end;
  end;
  Result:= nil;
end;

function TIQWebExtDoc.CanExecuteDoc: Boolean;
begin
  Result := False;
  // 06/18/2013 Added this method to determine if a document is
  // selected in the grid.
  // Return true if only one record is selected.
  Result := Assigned(ExtGrid) and Assigned(FQryExtDocs) and
    FQryExtDocs.Active and
    (FQryExtDocs.FieldByName('external_doc_id').AsInteger > 0) and
    (ExtGrid.SelectedRows.Count <= 1);
end;

procedure TIQWebExtDoc.ExecOnPopupMenu(Sender: TObject);
var
  AMenuItem: TMenuItem;
begin
  AMenuItem:= FindMenuItemByName('AssignPrintWithToSelectedRecsClick1');
  if Assigned(AMenuItem) then
     AMenuItem.Enabled:= not IsReadOnly and (ExtGrid.SelectedRows.Count > 0);

  AMenuItem:= FindMenuItemByName('Execute1');
  if Assigned(AMenuItem) then
     AMenuItem.Enabled:= CanExecuteDoc;

  AMenuItem:= FindMenuItemByName('Print1');
  if Assigned(AMenuItem) then
     AMenuItem.Enabled:= CanExecuteDoc;
end;



procedure TIQWebExtDoc.AssignPrintWithToSelectedRecordsClick(Sender: TObject);
var
  I: Integer;
  APrintWith: string;
begin
  APrintWith:= FQryExtDocs.FieldByName( 'PRINT_WITH' ).AsString;
//  if not DoPrintWith( self, Source, APrintWith ) then
//     EXIT;

  for I:= 0 to ExtGrid.SelectedRows.Count - 1 do
  begin
   //Adding check for Invalid Bookmark in case supplied from the control
    if not FQryExtDocs.BookmarkValid( ExtGrid.SelectedRows[ I ]) then
       Continue;
    FQryExtDocs.GotoBookmark( ExtGrid.SelectedRows[ I ]);
    FQryExtDocs.Edit;
    FQryExtDocs.FieldByName( 'PRINT_WITH' ).AsString := APrintWith;
    FQryExtDocs.Post;
  end;
end;


procedure TIQWebExtDoc.AssignShapeParams;
begin

end;

procedure TIQWebExtDoc.ExecuteOLEPrint( Sender : TObject );
begin
  ActivateOLELink('print');
end;

procedure TIQWebExtDoc.ExtDocsGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbright then
   ExtPopUpMenu.Popup(x,y,sender);
end;

procedure TIQWebExtDoc.GridDrawColumnCell(Sender: TObject;
  DataCol, DataRow: Integer; Column: TUniDbGridColumn; Attribs: TUniCellAttribs);
var
  AFontColor, ABrushColor: TColor;

  procedure SetColor( AFontColor, ABrushColor: TColor );
  begin
    with Sender as TUniDbGrid do
    begin
      Attribs.Color:= ABrushColor;
      Attribs.Font.Color := AFontColor;
    end;
  end;

begin
  try
//    if gdFocused in State then
//       EXIT;

    DetermineCellColor( AFontColor, ABrushColor );
    SetColor( AFontColor, ABrushColor );

  finally
//    TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State );
  end;
end;

function TIQWebExtDoc.HasDocuments: Boolean;
begin
  Result := not (FQryExtDocs.Bof and FQryExtDocs.Eof);
end;

procedure TIQWebExtDoc.GridColEnter(Sender: TObject);
begin
end;

procedure TIQWebExtDoc.DetermineCellColor( var AFontColor, ABrushColor: TColor );
  procedure _Set( F, B: TColor );
  begin
    AFontColor := F;
    ABrushColor:= B;
  end;
begin
  if FQryExtDocs.FieldByName('filename').asString = '' then
     _Set( clBlack, clWindow )
  else if FQryExtDocs.FieldbyName('PK_HIDE').asString = 'Y' then
     _Set( clBlack, clSilver )
  else if FQryExtDocs.FieldbyName('IsFileExist').asString = 'N' then
     _Set( clWhite, clRed )
  else if (CompareText( FQryExtDocs.FieldByName('STATUS').asString, QC_DOC_RELEASED ) = 0)
           and (FQryExtDocs.FieldByName('deactive_date').asDateTime > 0 )
           and (FQryExtDocs.FieldByName('deactive_date').asDateTime <
           FQryExtDocs.FieldByName('sysdate').asDateTime ) then
     _Set( clWhite, clOlive )
  else if CompareText( FQryExtDocs.FieldByName('STATUS').asString, QC_DOC_RELEASED ) = 0 then
     _Set( clWhite, clGreen )
  else if CompareText( FQryExtDocs.FieldByName('STATUS').asString, QC_DOC_CHECKED_OUT ) = 0 then
     _Set( clBlack, clYellow )
  else if CompareText( FQryExtDocs.FieldByName('STATUS').asString, QC_DOC_PENDING ) = 0 then
     _Set( clBlack, clAqua )
  else if CompareText( FQryExtDocs.FieldByName('STATUS').asString, QC_DOC_AUTHORIZED ) = 0 then
     _Set( clBlack, clAqua )
  else if CompareText( FQryExtDocs.FieldByName('STATUS').asString, QC_DOC_NEW ) = 0 then
     _Set( clBlack, clYellow )
end;

procedure TIQWebExtDoc.BeforeDeleteExtDoc( DataSet: TDataSet );
begin
  // 10/15/2013
  if FReadOnly then
    System.SysUtils.Abort;

  FDoc_Used_ID:= DataSet.FieldByName('doc_used_id').asFloat;

  DoBeforeDelete(DataSet);
end;

procedure TIQWebExtDoc.BeforeEditExtDoc(DataSet: TDataSet);
begin
  // 10/15/2013
  if FReadOnly then
    System.SysUtils.Abort;
end;

procedure TIQWebExtDoc.BeforeInsertExtDoc(DataSet: TDataSet);
begin
  // 10/15/2013
  if FReadOnly then
    System.SysUtils.Abort;
end;

procedure TIQWebExtDoc.SetButtons;
begin
  // Print button (same as menu)
  if Assigned(PrintDocument) then
    PrintDocument.Enabled:= CanExecuteDoc;
end;

procedure TIQWebExtDoc.AfterPostExtDoc( DataSet: TDataSet );
begin
  if FQryExtDocs.ApplyUpdates = 0 then
    FQryExtDocs.CommitUpdates;
  SetButtons;
end;


procedure TIQWebExtDoc.BeforePostExtDoc( DataSet: TDataSet );
var
  AShortcutColumn: TUniBaseDBGridColumn;
begin
  // 10/15/2013
  if FReadOnly then
    System.SysUtils.Abort;

  {Status}
  if not IsDocControlLicensed then
     DataSet.FieldByName('status').asString:= IQMS.WebVcl.ResourceStrings.cTXT0000077;  // 'Released'

  {FileName}
  with DataSet do
    if GetLibPath( FieldByName('doc_library_id').asFloat ) > '' then
       FieldByName('filename').asString:= ExtractFileName( FieldByName('filename').asString );

  if IsDocControlLicensed then
  begin
    IQAssert( DataSet.FieldByName('doc_library_id').asFloat  > 0, IQMS.WebVcl.ResourceStrings.cTXT0000078 {'Library must be selected'}  );
    IQAssert( DataSet.FieldByName('external_doc_id').asFloat > 0, IQMS.WebVcl.ResourceStrings.cTXT0000079 {'Document must be selected'} );
    IQAssert( DataSet.FieldByName('doc_revision_id').asFloat > 0, IQMS.WebVcl.ResourceStrings.cTXT0000080 {'Document file must be selected'});
  end;

  {valid shortcut name}
  if DataSet.FieldByName('SHORTCUT_FROM').asString > '' then
  begin
     AShortcutColumn:= IQColumnByName( ExtDocsGrid, 'SHORTCUT_FROM' );
     if Assigned(AShortcutColumn) and (AShortcutColumn.PickList.IndexOf( DataSet.FieldByName('SHORTCUT_FROM').asString ) = -1) then
        DataSet.FieldByName('SHORTCUT_FROM').asString:= '';
  end;

  if (FQryExtDocs.FieldByName('AUTO_EFORM').asString = 'Y') and not StrInList( FQryExtDocs.FieldByName('PRINT_WITH').asString, [ 'PACKING SLIP', 'SALES ORDER ACK', 'INVOICE', 'SALES ORDER', 'PICKTICKET', 'COC', 'ALL' ]) then
     FQryExtDocs.FieldByName('AUTO_EFORM').Clear;
end;

procedure TIQWebExtDoc.BeforeRefreshExtDoc(DataSet: TDataSet);
begin
  RefreshDataSetByID( FQryExtDocs, 'doc_used_id' );
    System.SysUtils.Abort;
end;

procedure TIQWebExtDoc.DoCalcFields( DataSet: TDataSet );
begin
  FQryExtDocs.FieldbyName('IsFileExist').asString:= 'U';  // unknown

  if IsExtDocTabSelected() then
  begin
    if FQryExtDocs.FieldbyName('doc_revision_id').asFloat = 0 then
       FQryExtDocs.FieldbyName('IsFileExist').asString:= 'N'
    else if IsRepositoryKind then
       FQryExtDocs.FieldbyName('IsFileExist').asString:= BoolToYN( DataSet.FieldByName('doc_repository_id').asFloat > 0)
    else if FileExists( GetFullFileName ) then
       FQryExtDocs.FieldbyName('IsFileExist').asString:= 'Y'
    else
       FQryExtDocs.FieldbyName('IsFileExist').asString:= 'N';
  end;

  FQryExtDocs.FieldbyName('PrintWith').AsString := GetPrintWithDisplay( FQryExtDocs.FieldbyName('PRINT_WITH').AsString ); //IQMS.WebVcl.DocumentUtils
end;

procedure TIQWebExtDoc.DataChangeExtDocs(Sender: TObject; Field: TField);
var
  AColumn: TUniBaseDBGridColumn;
begin
  if Assigned(FQryExtDocs) and Assigned(ExtDocsGrid) and Assigned(ExtDocsGrid.Columns) and (FQryExtDocs.State <> dsInactive) then
  begin
     SetButtons;
//
     AColumn:= IQColumnByName( ExtDocsGrid, 'doc_descrip' );
     if Assigned( AColumn ) then
       AColumn.ReadOnly:= IsDocControlLicensed and IsSecuredLib( FQryExtDocs.FieldByName('doc_library_id').asFloat );

     AColumn:= IQColumnByName( ExtDocsGrid, 'filename' );
     if Assigned( AColumn ) then
        AColumn.ReadOnly:= true;//IsDocControlLicensed and IsSecuredLib( FQryExtDocs.FieldByName('doc_library_id').asFloat );

     if Assigned(FAttachedDocumentsCoordinator) then
        FAttachedDocumentsCoordinator.UpdateDocumentsExistsIndicator( self, not(FQryExtDocs.Bof and FQryExtDocs.Eof));

     AColumn:= IQColumnByName( ExtDocsGrid, 'auto_eform' );
     if Assigned(AColumn) then
        AColumn.ReadOnly:= not StrInList( FQryExtDocs.FieldByName('PRINT_WITH').asString, [ 'PACKING SLIP', 'SALES ORDER ACK', 'INVOICE', 'SALES ORDER', 'PICKTICKET', 'COC', 'ALL' ]);
  end;
end;

function TIQWebExtDoc.IsSecuredLib( ADoc_Library_ID: Real ): Boolean;
begin
  Result:= StrInList(
    SelectValueByID( 'type', 'doc_library', ADoc_Library_ID ),
    [QC_DOC_SECURE, QC_DOC_APPROVAL]);
end;

procedure TIQWebExtDoc.UpdateExtDoc(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arUpdate, arInsert:
      begin
        UpdateExternalDoc( FQryExtDocs );
        UpdateDocRevision( FQryExtDocs );
        UpdateDocUsed( FQryExtDocs );
      end;
    arDelete:
      begin
        ExecuteCommandFmt(
          'delete from doc_used where id = %f', [ FDoc_Used_ID ]);
      end;
  end;

  AAction := eaApplied;
end;


procedure TIQWebExtDoc.UpdateExternalDoc( DataSet: TDataSet );
begin
  ExecuteCommandFmt(
    'begin                                                  '+
    '  update external_doc                                  '+
    '     set doc_library_id = %f,                          '+
    '         descrip = ''%s'',                             '+
    '         status = ''%s''                               '+
    '   where id = %f;                                      '+

    '  if SQL%%NOTFOUND then                                '+
    '     insert into external_doc                          '+
    '       ( id, doc_library_id, descrip, status )         '+
    '         values( %f, %f, ''%s'', ''%s'' );             '+
    '                                                       '+
    '  end if;                                              '+
    'end;                                                   ',
    [DataSet.FieldByName('doc_library_id').asFloat,
     FixStrC( DataSet.FieldByName('doc_descrip').asString),
     StrTran( DataSet.FieldByName('status').asString, '''', ''''''),
     DataSet.FieldByName('external_doc_id').asFloat,

     DataSet.FieldByName('external_doc_id').asFloat,
     DataSet.FieldByName('doc_library_id').asFloat,
     FixStrC( DataSet.FieldByName('doc_descrip').asString),
     StrTran( DataSet.FieldByName('status').asString, '''', '''''') ]);
end;

procedure TIQWebExtDoc.UniDBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
  AFontColor, ABrushColor: TColor;

  procedure SetColor( AFontColor, ABrushColor: TColor );
  begin
    with Sender as TUniDbGrid do
    begin
      Attribs.Color:= ABrushColor;
      Attribs.Font.Color := AFontColor;
    end;
  end;

begin
  try
//    if gdFocused in State then
//       EXIT;

    DetermineCellColor( AFontColor, ABrushColor );
    SetColor( AFontColor, ABrushColor );

  finally
  end;
end;

procedure TIQWebExtDoc.UpdateDocRevision( DataSet: TDataSet );
begin
  ExecuteCommandFmt(
    'begin                                         '+
    '  if ''%s'' is NULL then                      '+
    '     delete from doc_revision where id = %f;  '+
    '     RETURN;                                  '+
    '  end if;                                     '+

    '  update doc_revision                         '+
    '     set external_doc_id = %f,                '+
    '         filename = ''%s''                    '+
    '   where id = %f;                             '+

    '  if SQL%%NOTFOUND then                       '+
    '     insert into doc_revision                 '+
    '          ( id, external_doc_id, filename )   '+
    '    values( %f, %f,              ''%s'');     '+
    '  end if;                                     '+
    'end;                                          ',
    [StrTran(DataSet.FieldByName('filename').asString, '''', ''''''),
     DataSet.FieldByName('doc_revision_id').asFloat,

     DataSet.FieldByName('external_doc_id').asFloat,
     FixStrC(DataSet.FieldByName('filename').asString),
     DataSet.FieldByName('doc_revision_id').asFloat,

     DataSet.FieldByName('doc_revision_id').asFloat,
     DataSet.FieldByName('external_doc_id').asFloat,
     FixStrC(DataSet.FieldByName('filename').asString)]);
end;

procedure TIQWebExtDoc.UpdateDocUsed( DataSet: TdataSet );
begin
  ExecuteCommandFmt(
    'begin                                                                  '+
    '  update doc_used                                                      '+
    '     set external_doc_id = %f,                                         '+
    '         source = ''%s'',                                              '+
    '         source_id = %f,                                               '+
    '         seq = %f,                                                     '+
    '         print_with = ''%s'',                                          '+
    '         shortcut_from = ''%s'',                                       '+
    '         shortcut_seq = %f,                                            '+
    '         auto_eform = ''%s'',                                          '+
    '         no_training_req = ''%s''                                      '+
    '   where id = %f;                                                      '+

    '  if SQL%%NOTFOUND then                                                '+
    '     insert into doc_used                                              '+
    '          ( id, external_doc_id, source, source_id, seq, print_with,   '+
    '            shortcut_from, shortcut_seq, auto_eform, no_training_req ) '+
    '    values( %f, %f, ''%s'', %f, %f,  ''%s'',                           '+
    '            ''%s'', %f, ''%s'', ''%s'');                               '+
    '  end if;                                                              '+
    'end;                                                                   ',
    [DataSet.FieldByName('external_doc_id').asFloat,
     DataSet.FieldByName('source').asString,
     DataSet.FieldByName('source_id').asFloat,
     DataSet.FieldByName('seq').asFloat,
     DataSet.FieldByName('print_with').asString,
     DataSet.FieldByName('shortcut_from').asString,
     DataSet.FieldByName('shortcut_seq').asFloat,
     DataSet.FieldByName('auto_eform').asString,
     DataSet.FieldByName('no_training_req').asString,
     DataSet.FieldByName('doc_used_id').asFloat,

     DataSet.FieldByName('doc_used_id').asFloat,
     DataSet.FieldByName('external_doc_id').asFloat,
     DataSet.FieldByName('source').asString,
     DataSet.FieldByName('source_id').asFloat,
     DataSet.FieldByName('seq').asFloat,
     DataSet.FieldByName('print_with').asString,
     DataSet.FieldByName('shortcut_from').asString,
     DataSet.FieldByName('shortcut_seq').asFloat,
     DataSet.FieldByName('auto_eform').asString,
     DataSet.FieldByName('no_training_req').asString]);
end;

procedure TIQWebExtDoc.AssignDoc_Library( ADoc_Library_ID: Real );
begin
  with FQryExtDocs do
    if FieldByName('doc_library_id').asFloat <> ADoc_Library_ID then
    begin
       Edit;
       FieldByName('doc_library_id').asFloat:= ADoc_Library_ID;
       FieldByName('library').asString  := SelectValueByID(
         'descrip', 'doc_library', ADoc_Library_ID );
       AssignExternal_Doc( -1 );
    end;
end;

procedure TIQWebExtDoc.AssignExternal_Doc( AID: Real );
begin
    if AID <> FQryExtDocs.FieldByName('external_doc_id').asFloat then
    begin
       FQryExtDocs.Edit;

       FQryExtDocs.FieldByName('external_doc_id').Clear;
       FQryExtDocs.FieldByName('doc_descrip').Clear;
       FQryExtDocs.FieldByName('status').Clear;
       FQryExtDocs.FieldByName('doc_revision_id').Clear;
       FQryExtDocs.FieldByName('revision').Clear;
       FQryExtDocs.FieldByName('filename').Clear;
       FQryExtDocs.FieldByName('deactive_date').Clear;
       FQryExtDocs.FieldByName('sysdate').Clear;

       if AID <= 0 then
          EXIT;

       with TFDQuery.Create(nil) do
       try
         Connection := FQryExtDocs.Connection;
         SQL.Add('SELECT d.descrip,');
         SQL.Add('       d.status,');
         SQL.Add('       r.id,');
         SQL.Add('       r.revision,');
         SQL.Add('       r.filename,');
         SQL.Add('       r.deactive_date,');
         SQL.Add('       r.doc_repository_id,');
         SQL.Add('       l.type,');
         SQL.Add('       l.repository_alias,');
         SQL.Add('       l.repository_data');
         SQL.Add('  FROM doc_library l, external_doc d, doc_revision r');
         SQL.Add(Format(' WHERE d.id = %.0f AND',[AID]));
         SQL.Add('       d.id = r.external_doc_id(+) AND');
         SQL.Add('       NVL(r.hist, ''N'') = ''N'' AND');
         SQL.Add('       d.doc_library_id = l.id');
         Open;
         if not (Bof and Eof) then
           begin
             FQryExtDocs.FieldByName('external_doc_id').AsLargeInt := Trunc(AID);
             FQryExtDocs.FieldByName('doc_descrip').asString      := Fields[0].AsString;
             FQryExtDocs.FieldByName('status').asString           := Fields[1].AsString;
             FQryExtDocs.FieldByName('doc_revision_id').AsLargeInt:= Fields[2].AsLargeInt;
             FQryExtDocs.FieldByName('revision').asString         := Fields[3].AsString;
             FQryExtDocs.FieldByName('filename').asString         := Fields[4].AsString;
             if Fields[5].AsDateTime > 0 then
                FQryExtDocs.FieldByName('deactive_date').asDateTime := Fields[5].AsDateTime;
             FQryExtDocs.FieldByName('sysdate').asDateTime :=
               SelectValueAsDateTime('select sysdate from dual');
             FQryExtDocs.FieldByName('doc_repository_id').asString:= Fields[6].AsString;
             FQryExtDocs.FieldByName('type').asString             := Fields[7].AsString;
             FQryExtDocs.FieldByName('repository_alias').asString := Fields[8].AsString;
             FQryExtDocs.FieldByName('repository_data').asString  := Fields[9].AsString;
           end;
       finally
         Free;
       end;
    end;
end;

procedure TIQWebExtDoc.LaunchDocumentControlClick( Sender: TObject );
begin
  if not IsDocControlLicensed then
    Exit;
  if CompareText( ExtractFileName(Application.ExeName), 'IQQC.Exe' ) <> 0 then
     Com_Exec( 'IQQC', [ QC_DOC_MAINT, FQryExtDocs.FieldByName('external_doc_id').asInteger ])    { IQComExe.pas }

  else if Assigned( Application.MainForm ) then
     PostMessage( Application.MainForm.Handle, iq_DCOM_Internal_Notify, QC_DOC_MAINT, FQryExtDocs.FieldByName('external_doc_id').asInteger );
end;


function TIQWebExtDoc.GetMasterTableName: string;
begin
  if Assigned( MasterSource ) and Assigned(MasterSource.DataSet) then
    begin
     if (MasterSource.DataSet is TFDTable) then
       Result:= StrAfterDot( TFDTable( MasterSource.DataSet).TableName )
     else if (MasterSource.DataSet is TFDTable) then
       Result := TFDTable(MasterSource.DataSet).TableName
     else if (MasterSource.DataSet is TFDQuery) then
       Result := TFDQuery(MasterSource.DataSet).UpdateOptions.UpdateTableName
     else
       Result:= '';
    end;

  if Assigned( FOnGetMasterTableName ) then
     OnGetMasterTableName( self, Result );
end;

destructor TIQWebExtDoc.Destroy;
begin
  CheckFreeDNetCOM( FDNetRepository );

  DeleteRepositoryFiles( FRepositoryFiles );
  if Assigned(FRepositoryFiles) then FreeAndNil(FRepositoryFiles);

  if Assigned(FSelectedExternalDocsList) then FreeAndNil(FSelectedExternalDocsList);

  IQRegFormWrite( self, [ ExtDocsGrid ]);

  inherited;
end;



procedure TIQWebExtDoc.DeleteRepositoryFiles( AList: TStringList );
var
  I: Integer;
begin
  for I := 0 to AList.Count - 1 do
  begin
    AssignFileReadOnly( AList[ I ] , FALSE {readonly});
    DeleteFile( AList[ I ] );
  end;
end;


procedure TIQWebExtDoc.DoBeforeInsert(DataSet: TDataSet);
begin
  // 08/03/2010 Save master dataset changes before posting record.
  // Changed by Byron.
  // Requested by Susan.
  // E-Mail Subject:  RE: Gages/Devices - automatically save Calibration upon entry PRD - CRM # 448486
  // E-Mail Date: 07/20/2010 1:04 PM
  if Assigned(MasterSource) and
     Assigned(MasterSource.DataSet) and
     (MasterSource.DataSet.State in [dsEdit,dsInsert]) then
     MasterSource.DataSet.Post;

  if not (nbInsert in ExtNav.VisibleButtons) then
     System.SysUtils.Abort;

  if Assigned(FBeforeInsert) then
     FBeforeInsert(DataSet);
end;

procedure TIQWebExtDoc.DoBeforeDelete(DataSet: TDataSet);
begin
  if Assigned(FBeforeDelete) then
     FBeforeDelete(DataSet);
end;


function TIQWebExtDoc.IsShopDataLicensed: Boolean;
begin
   Result:= FALSE;
   try
     if StrToFloat(Trim(CharXOR(SelectValueAsString(
       'select sd_users from iqorder2' )))) > 0 then
       Result:= TRUE;
   except
     Result:= FALSE;
   end;
end;

function TIQWebExtDoc.IsRepositoryKind: Boolean;
begin
  Result:= CompareText( FQryExtDocs.FieldByName('type').asString, 'Repository' ) = 0;
end;


procedure TIQWebExtDoc.SetShowPopupMenu(const Value: Boolean);
var
   o: TUniPopupMenu;
begin
  // set variable
  FShowPopupMenu := Value;
  // eval
  if Value then o := ExtPopUpMenu else o := NIL;
//  // assign popup menu
//  ExtDocsGrid.PopupMenu := o;
end;

procedure TIQWebExtDoc.Refresh;
begin
  if CheckConnected and
   (FQryExtDocs.SQL.Count > 0) and
   (FQryExtDocs.FindField('doc_used_id') <> nil) then
  RefreshDataSetByID( FQryExtDocs, 'doc_used_id' );
end;

function TIQWebExtDoc.CheckConnected: Boolean;
begin
  Result := False;
  // 10/25/2013 Added ComponentState check (Byron)
  Result := not (csLoading in ComponentState) and
//    Assigned(db_dm.DB_DataModule) and
//    (db_dm.DB_DataModule.FDConnection1 <> nil) and
//    db_dm.FDConnection.Connected and
    Assigned(FQryExtDocs) and
    Assigned(FQryExtDocs.DataSource) and
    Assigned(FQryExtDocs.DataSource.DataSet) and
    EnsureConnectionExists;
end;

procedure TIQWebExtDoc.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and
    (AComponent is TIQAttachedDocumentsCoordinator) and
    (FAttachedDocumentsCoordinator = AComponent) then
    FAttachedDocumentsCoordinator := NIL;
end;


procedure TIQWebExtDoc.AssignExternalDocsFromSelectedList;
var
  I: Integer;
  AInsertMode    : Boolean;
  AAfterInsert   :  TDataSetNotifyEvent;
  ADoc_Library_ID: Real;
begin
  AInsertMode    := FQryExtDocs.State = dsInsert;
  ADoc_Library_ID:= FQryExtDocs.FieldByName('doc_library_id').asFloat;

  AAfterInsert:= FQryExtDocs.AfterInsert;
  FQryExtDocs.AfterInsert:= nil;
  try
    for I:= 0 to FSelectedExternalDocsList.Count - 1 do
    begin
      if AInsertMode and (FQryExtDocs.State <> dsInsert) then
         FQryExtDocs.Append;

      AssignDoc_Library( ADoc_Library_ID );
      AssignExternal_Doc( StrToFloat( FSelectedExternalDocsList[ I ]));

      if FQryExtDocs.State <> dsBrowse then
         FQryExtDocs.Post;
    end;

    // 01/06/2010 Refresh data so that the sequencing is correct visually.
    // Added by Byron.
    Refresh;

  finally
    FQryExtDocs.AfterInsert:= AAfterInsert;
  end;
end;

procedure TIQWebExtDoc.UpdateFilterOnStatusBar;

   function GetFilterFields: string;
   var
     I         : Integer;
//     AFieldInfo: TwwFieldInfo;
   begin
     Result:= '';
//     if FilterDialog.FieldInfo.Count = 0 then EXIT;

//     for I:= 0 to FilterDialog.FieldInfo.Count - 1 do
//     begin
//       AFieldInfo:= TwwFieldInfo(FilterDialog.FieldInfo.Items[ I ]);
//       if Result = '' then
//          Result:= AFieldInfo.DisplayLabel
//       else
//          Result:= Format( '%s, %s', [ Result, AFieldInfo.DisplayLabel ]);
//     end;
   end;
begin
  with FStatusBar1 do
  begin
//    if FilterDialog.FieldInfo.Count > 0 then
//       Panels[0].Text := Format(' Advanced Search Filter: %s ', [ GetFilterFields ])
//    else
//       Panels[0].Text := '';
  end;

  // remove filter speedbutton
//  FilterClearBtn.Visible := FilterDialog.FieldInfo.Count > 0;
  if FilterClearBtn.Visible then
    FilterClearBtn.Left := FilterBtn.Left + FilterBtn.Width;
end;


procedure TIQWebExtDoc.DMTextTargetDrop(Sender: TObject; Acceptor: TWinControl;
  const DropText: String; X, Y: Integer);
var
  I: Integer;
  AFileName: string;
  ADoc_Library_ID: Real;

  function _Init: Boolean;
  begin
    if FQryExtDocs.State in [dsEdit, dsInsert] then
       FQryExtDocs.Cancel;

    FSelectedExternalDocsList.Clear;

    Result:= FQryExtDocs.State = dsBrowse;
  end;

  procedure _AddFileToLibrary( AFileName: string );
  var
    AExt_Doc_ID: Real;
  begin
    // check if exists
    AExt_Doc_ID:= FindExternalDocumentByFileNameInLibrary(
      ADoc_Library_ID, AFileName );

    IQAssert( AExt_Doc_ID = 0, Format('Failed - file %s is already associated with the document %s in ''%s''',
                                    [ AFileName,
                                      SelectValueByID('descrip', 'external_doc', AExt_Doc_ID ),
                                      SelectValueByID('descrip', 'doc_library' , ADoc_Library_ID ) ]));
//     add new document to library
    if AExt_Doc_ID = 0 then
    begin
       AExt_Doc_ID:= GetNextID('external_doc');
       Com_Exec( 'IQQC', [ QC_DOC_INSERT_NEW_DOC_EX, ADoc_Library_ID,
         AFileName, AExt_Doc_ID ]);    {iqcomexe.pas, qc_doc_share.pas}
    end;

    if SelectValueFmtAsInteger(
      'SELECT 1 FROM external_doc WHERE id = %.0f AND doc_library_id = %.0f',
      [AExt_Doc_ID, ADoc_Library_ID]) = 1 then
       FSelectedExternalDocsList.Add( FloatToStr( AExt_Doc_ID ));
  end;

  procedure _AssignSelectedDocumentsFromLibrary;
  var
    AAfterInsert:  TDataSetNotifyEvent;
  begin
    if FSelectedExternalDocsList.Count = 0 then
       EXIT;
    AAfterInsert:= FQryExtDocs.AfterInsert;
    FQryExtDocs.AfterInsert:= nil;
    try
      FQryExtDocs.Append;
      FQryExtDocs.FieldByName('doc_library_id').asFloat:= ADoc_Library_ID;
      FQryExtDocs.FieldByName('library').asString  :=
        SelectValueByID('descrip', 'doc_library', ADoc_Library_ID );
      AssignExternal_Doc( -1 );

      AssignExternalDocsFromSelectedList;
    finally
      FQryExtDocs.AfterInsert:= AAfterInsert;
    end;
  end;

begin
  if not _Init() then
     EXIT;

  if not DoPkList_Doc_Library(ADoc_Library_ID) then
     EXIT;

  try
    CheckLibraryTeamMembersOnly( ADoc_Library_ID, TRUE {AIsAccessOnlyEnough});
  except on E: Exception do
    begin
      Application.ShowException(E);
      System.SysUtils.Abort;
    end;
  end;

  {todo- FDMTextTarget}
//  // Loop over all dropped file names
//  for I:= 0 to FDMTextTarget.DroppedLines.Count - 1 do    // Iterate
//  begin
//    // Get the filename
//    AFileName:= FDMTextTarget.DroppedLines[ I ];
//
//    // Add the file to the default library AND list of selected docs
//    try
//      _AddFileToLibrary( AFileName );
//    except
//      on E: Exception do
//        Application.ShowException(E);
//    end;
//  end;

  // process the list
  _AssignSelectedDocumentsFromLibrary;
end;

procedure TIQWebExtDoc.AssignDropMasterTextTarget;
begin
//  if not Assigned(FDMTextTarget) then
//     EXIT;
//
//  FDMTextTarget.AcceptorControl:= self;
//  RefreshTarget;
end;

procedure TIQWebExtDoc.RefreshTarget;
var
  AControl: TWinControl;
begin
//  // Check component
//  if not Assigned(FDMTextTarget) then
//     EXIT;
//
//  // Re-assign acceptor control
//  AControl := FDMTextTarget.AcceptorControl;
//  FDMTextTarget.AcceptorControl := nil;
//  FDMTextTarget.AcceptorControl := AControl;
end;


procedure TIQWebExtDoc.AdjustScreen;
begin
       pnlTop.Height     := cnstTopPanelHeight;
       ExtDocNav.Width         := cnstNavigatorWidth;
       FilterBtn.Width   := cnstSpeedBtnWidth;
       //FFilterBtn.Height  := cnstSpeedBtnWidth;
       FilterClearBtn.Width   := cnstSpeedBtnWidth;
       LaunchDocumentControl.Width := cnstSpeedBtnWidth;
       //FSBtnDocCtrl.Height:= cnstSpeedBtnWidth;
       SearchBtn.Width := cnstSpeedBtnWidth;
       //FSearchBtn.Height:= cnstSpeedBtnWidth;
       PrintDocument.Width := cnstSpeedBtnWidth;
       //FSBtnPrint.Height:= cnstSpeedBtnWidth;
       BtnScanDocument.Width := cnstSpeedBtnWidth;
       ///FSBtnScan.Height:= cnstSpeedBtnWidth;
       PnlToolbarStandardBtns.Width := cnstSpeedBtnWidth * 6;

  RefreshShapeParams;

  // Only visible buttons will be stacked.  If document control is not
  // licensed, no worries.  The controls will still be stacked correctly.
  IQMS.Common.Controls.StackUpControlsLeft( 1, 1, [SearchBtn, FilterBtn, FilterClearBtn,
    LaunchDocumentControl, PrintDocument, BtnScanDocument]);
  IQMS.Common.Controls.CenterControlsVertInWindowA( PnlShape );
end;

procedure TIQWebExtDoc.SetTouchscreen(const Value: Boolean);
begin
  FTouchscreen:= Value;

  AdjustScreen;

  FTouchScreenGrid.Visible := FTouchscreen;
  ExtDocsGrid.Visible          := not FTouchscreen;

  UpdateFilterOnStatusBar;
end;

procedure TIQWebExtDoc.AssignTouchscreenGridColumns;
var
  I: Integer;
begin
//  FTouchScreenGrid.DBGrid.DBGrid.UseTFields:= FALSE;
//  FTouchScreenGrid.DBGrid.DBGrid.Selected.Clear;

  for I:= 0 to ExtDocsGrid.Columns.Count - 1 do
  begin
//    FTouchScreenGrid.DBGrid.Selected.Add( ExtDocsGrid.Columns[I].FieldName +
//                                          #9   +
//                                          IntToStr(ExtDocsGrid.Columns[I].Width) +
//                                          #9   +
//                                          ExtDocsGrid.Columns[I].Title.Caption );
  end;
//  FTouchScreenGrid.DBGrid.ApplySelected;

  IQRegFormRead( self, [ FTouchScreenGrid.DBGrid ]);
end;

procedure TIQWebExtDoc.TouchScreenGridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  IQRegFormWrite( self, [ FTouchScreenGrid.DBGrid ]);
end;

procedure TIQWebExtDoc.TouchScreenGridColWidthChanged(Sender: TObject; Column: Integer);
begin
  IQRegFormWrite( self, [ FTouchScreenGrid.DBGrid ]);
end;

procedure TIQWebExtDoc.SearchClick( Sender : TObject);
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
  S   : Tstringlist;
begin
 if (TableName <> '') then
     // with PkDoc do
     begin
       IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');
       {Clear}

       s:=TStringList.Create;
       {Displayed}
       s.Add(       'select seq,                 ');
       s.Add(       '       library,             ');
       s.Add(       '       lib_descrip,         ');
       s.Add(       '       doc_descrip,         ');
       s.Add(       '       filename,            ');
       s.Add(       '       print_with,          ');
       s.Add(       '       revision,            ');
       s.Add(       '       auto_eform,          ');
       s.Add(       '       no_training_req,     ');
       s.Add(       '       is_expired,          ');

       {hidden}
       s.Add(       '       external_doc_id      ');

       s.Add(       '  from v_external_docs      ');
       s.Add(Format(' where source = ''%s''      ', [ Source      ]));
       s.Add(Format('   and source_id = :%s      ', [ MasterFields]));  { Ex: "source_id = :ID" }
       s.Add(       'order by seq                ');

       Qry := IDS.GetQuery(s.Text);

       try
          Qry.Open;

          ID := DoSinglePickList(Qry, strtoint(MasterFields));

        FQryExtDocs.Locate('external_doc_id',Qry.FieldByName('external_doc_id').AsFloat, []);
        finally
          Qry.Free;
        end;


//       if PkDoc.Params.FindParam(MasterFields) = nil then
//         PkDoc.Params.CreateParam(ftBCD, MasterFields, ptInput);
//       PkDoc.ParamByName(MasterFields).DataType:= ftBCD;
//       PkDoc.ParamByName(MasterFields).ParamType := ptInput;
//       PkDoc.ParamByName(MasterFields).AsBCD := 0;
//       CreateTFields( PkDoc );
//
//       // length
//       PkDoc.FieldByName('seq').DisplayWidth:= 23;
//       PkDoc.FieldByName('library').DisplayWidth:= 80;
//       PkDoc.FieldByName('lib_descrip').DisplayWidth:= 110;
//       PkDoc.FieldByName('doc_descrip').DisplayWidth:= 110;
//       PkDoc.FieldByName('filename').DisplayWidth:= 190;
//       PkDoc.FieldByName('print_with').DisplayWidth:= 80;
//       PkDoc.FieldByName('revision').DisplayWidth:= 60;
//       PkDoc.FieldByName('auto_eform').DisplayWidth:= 80;
//       PkDoc.FieldByName('no_training_req').DisplayWidth:= 80;
//       PkDoc.FieldByName('is_expired').DisplayWidth:= 70;
//
//       // visibility
//       PkDoc.FieldByName('external_doc_id').Visible:= FALSE;
//       if not (csDesigning in ComponentState) then
//          PkDoc.FieldByName('filename').Visible := GetSwitch(
//            'doc_hide_unc_path', 'params', 'N') <> 'Y';
     end;


end;

procedure TIQWebExtDoc.AssignParentIDBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, MasterFields, Trunc(Source_ID));
end;

procedure TIQWebExtDoc.AssignPicklistDefaultColumnsWidth( Sender: TObject;
  AQuery: TDataSet; AColumn: TUniBaseDBGridColumn );
begin
  if AQuery.FindField( AColumn.FieldName ) <> nil then
     AColumn.Width:= AQuery.FieldByName(AColumn.FieldName).DisplayWidth;
end;

procedure TIQWebExtDoc.AssignPickListFields;
begin

end;

procedure TIQWebExtDoc.ShowReleasesClick(Sener: TObject);
var
  ADateOfInterest: TDateTime;
begin
  ADateOfInterest:= 0;
  if Assigned(OnBeforeShowRevisions) then
     OnBeforeShowRevisions( self, ADateOfInterest );

  TFrmIQExtDocRevisions.DoShowModal(
    FQryExtDocs.FieldByName('external_doc_id').asFloat,
    ADateOfInterest );  // IQExtDocRevisions.pas
end;

procedure TIQWebExtDoc.ExecuteDocumentRevision( AExternal_Doc_ID,
  ADoc_Revision_ID: Real; AVerb: string = 'open' );
var
  AFileName: string;
begin
  with FQryExtDocs do
  begin
    if (State = dsInactive) or (Eof and Bof) then
       EXIT;
    CheckBrowseMode;

    IQAssert( Locate('external_doc_id', AExternal_Doc_ID, []),
      Format('Unable to locate external doc ID %.0f - operation aborted.',
      [ AExternal_Doc_ID ]));

    // if passed doc_revision_id represents current revision then just use normal execute
    if ADoc_Revision_ID = FieldByName('doc_revision_id').asFloat then
    begin
      DoubleClick( nil );
      EXIT;
    end;

    // find this revision file and open it
    AFileName:= GetRevisionFullFileName( ADoc_Revision_ID );
    IQAssert( FileExists(AFileName), Format( cTXT0000076 {'File %s not found'}, [ AFileName ]));
    IQShellExecute( AFileName, AVerb );
  end;
end;

procedure TIQWebExtDoc.ChangeSortField(const AField: TField);
var
  I: Integer;
  AOrderBy: string;
begin
  // check dataset assigned
  if not Assigned(ExtDocs) or not Assigned(AField) then
     Exit;

  if (AField.Origin = '') or (AField.FieldKind <> fkData) then
     Exit;

  if AField = FOrderByField then
     FOrderByDesc:= not FOrderByDesc
  else
     begin
       FOrderByField:= AField;
       FOrderByDesc := False;
     end;

  // Save setting changes
//  IQRegFormWrite(Self, [ExtGrid, FilterDialog]);

  // Assign the new search field
  ExtDocs.Close;
  try
    DeleteStringsBetweenKeyWords( ExtDocs.SQL,
                                           '_ORDER_BY_START_',
                                           '_ORDER_BY_END_',
                                           I );
    AOrderBy:= Format('ORDER BY %s %s', [ AField.Origin, sIIf( FOrderByDesc, 'DESC', '')]);

    InsertStringsBetweenKeyWords( ExtDocs.SQL,
                                           AOrderBy,
                                           '_ORDER_BY_START_',
                                           '_ORDER_BY_END_' );
  finally
    ExtDocs.Open;
  end;

  AdjustGridTitleColor;

  // Apply setting changes
//  IQRegFormRead(Self, [ExtGrid, FilterDialog]);
end;

procedure TIQWebExtDoc.AdjustGridTitleColor;
var
  I: Integer;
begin
  for I:= 0 to ExtGrid.Columns.Count - 1 do with ExtGrid.Columns[ I ] do
    if Field = FOrderByField then
       begin
         Title.Font.Style:= Title.Font.Style + [fsBold];
         Title.Font.Color:= clNavy;
       end
    else
       Title.Font.Style:= Title.Font.Style - [fsBold];
end;

procedure TIQWebExtDoc.ScanDocument( Sender: TObject);
begin
  Application.Minimize;
  try
    Com_Exec( 'IQQC', [ QC_DOC_INSERT_NEW_SCAN_IMAGE,    {iqcomexe.pas, qc_doc_share.pas}
                        Source_ID,
                        Source ]);
    self.Refresh;
  finally
    Application.Restore;
  end;
end;


function TIQWebExtDoc.IsExtDocTabSelected: Boolean;
begin
  Result:= TIQAttachedDocumentsCoordinator.IsExtDocTabSelected( self );
end;

end.





