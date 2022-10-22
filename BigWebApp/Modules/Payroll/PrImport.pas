unit PrImport;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.Common.DataConst,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Comp.DataMove,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.DBGrids,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniProgressBar,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, vcl.wwdbgrid, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  IQUniGrid, uniGUIFrame, uniMemo, uniBasicGrid, uniDBGrid;

const SqlShema = 'select  import_code as import_cod,         ' +
                 '        descrip,             ' +
                 '        import_table_name as import_tab,   ' +
                 '        table_type,          ' +
                 '        budget_code as budget_cod,          ' +
                 '        field_delimiter as field_deli,     ' +
                 '        record_delimiters as record_del,   ' +
                 '        record_length as record_len,       ' +
                 '        character_delimiters as character_' +
                 '  from PR_IMPORT_TABLES      ' +
                 ' where id = ';

const SqlFiles = 'select a.ID, ' +
                 '       a.iq_table_name as iq_table_n,     ' +
                 '       a.import_seq,       ' +
                 '       a.sql_statement as sql_statem     ' +
                 '  from IQ_IMPORT_TABLES a, PR_IMPORT_TABLES b ' +
                ' where a.PR_IMPORT_TABLES_ID = b.id ' +
                '   and b.id = ';

const SqlFields = 'select a.IQ_IMPORT_TABLES_ID as IQ_IMPORT_, ' +
                  '       a.iq_field_name as iq_field_n,    ' +
                  '       a.lookup_table as lookup_tab,     ' +
                  '       a.seq,              ' +
                  '       a.start_pos,        ' +
                  '       a.field_length as field_leng,     ' +
                  '       a.field_name,       ' +
                  '       a.descrip,          ' +
                  '       a.sql_statement as sql_statem,    ' +
                  '       a.date_format as date_forma,      ' +
                  '       a.literal,          ' +
                  '       a.do_not_append_if_zero as do_not_app ' +
                  '  from PR_FIELDS_MATCH a, IQ_IMPORT_TABLES b, PR_IMPORT_TABLES c ' +
                  ' where a.IQ_IMPORT_TABLES_ID = b.id ' +
                  '   and b.PR_IMPORT_TABLES_ID = c.id ' +
                  '   and c.id = ';

const SqlBudgetFields =  'select id,                                 ' +
                         '       pr_import_tables_id as pr_import_,  ' +
                         '       seq,                                ' +
                         '       start_pos,                          ' +
                         '       field_length as field_leng,         ' +
                         '       field_name,                         ' +
                         '       descrip,                            ' +
                         '       sql_statement as sql_statem,        ' +
                         '       field_type,                         ' +
                         '       acct_seq                            ' +
                         '  from BUDGET_FIELDS_MATCH                 ' +
                         ' where pr_import_tables_id = ';


type
  TFrmPrImport = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    IQAbout1: TIQWebAbout;
    Splitter2: TUniSplitter;
    PCFile: TUniPageControl;
    TabDbf: TUniTabSheet;
    TabAscii: TUniTabSheet;
    GridDbf: TUnidbGrid;
    Panel10: TUniPanel;
    NavDbf: TUniDBNavigator;
    TabEmpty: TUniTabSheet;
    SrcHeader: TDataSource;
    TblHeader: TFDTable;
    SrcTables: TDataSource;
    TblTables: TFDTable;
    SrcFields: TDataSource;
    TblFields: TFDTable;
    SrcDBF: TDataSource;
    TblDbf: TFDTable;
    TblHeaderID: TBCDField;
    TblHeaderIMPORT_CODE: TStringField;
    TblHeaderDESCRIP: TStringField;
    TblHeaderIMPORT_TABLE_NAME: TStringField;
    TblHeaderTABLE_TYPE: TStringField;
    TblHeaderFIELD_DELIMITER: TStringField;
    TblHeaderRECORD_DELIMITERS: TStringField;
    TblHeaderRECORD_LENGTH: TBCDField;
    TblTablesID: TBCDField;
    TblTablesPR_IMPORT_TABLES_ID: TBCDField;
    TblTablesIQ_TABLE_NAME: TStringField;
    TblTablesIMPORT_SEQ: TBCDField;
    TblTablesSQL_STATEMENT: TStringField;
    TblFieldsID: TBCDField;
    TblFieldsIQ_IMPORT_TABLES_ID: TBCDField;
    TblFieldsIQ_FIELD_NAME: TStringField;
    TblFieldsSEQ: TBCDField;
    TblFieldsSTART_POS: TBCDField;
    TblFieldsFIELD_LENGTH: TBCDField;
    TblFieldsFIELD_NAME: TStringField;
    TblFieldsDESCRIP: TStringField;
    TblFieldsSQL_STATEMENT: TStringField;
    QryAllTables: TFDQuery;
    QryAllTablesTABLE_NAME: TStringField;
    wwMemo: TwwMemoDialog;
    TblFieldsIqFieldName: TStringField;
    OpenFile: TOpenDialog;
    SBASCII: TUniStatusBar;
    SBDBF: TUniStatusBar;
    N1: TUniMenuItem;
    StoptReadingFile1: TUniMenuItem;
    TblFieldsDATE_FORMAT: TStringField;
    PKEmp: TIQWebHPick;
    PKPayType: TIQWebHPick;
    PKEmpID: TStringField;
    PKEmpEMPNO: TStringField;
    PKEmpFIRST_NAME: TStringField;
    PKEmpMIDDLE_NAME: TStringField;
    PKEmpLAST_NAME: TStringField;
    PKEmpSSNMBR: TStringField;
    PKEmpADDR1: TStringField;
    PKEmpADDR2: TStringField;
    PKEmpSTATE: TStringField;
    PKEmpCOUNTRY: TStringField;
    PKEmpZIP: TStringField;
    PKEmpPHONE_NUMBER: TStringField;
    PKEmpCITY: TStringField;
    PKPayTypeID: TStringField;
    PKPayTypeDESCRIPTION: TStringField;
    qryColumns: TFDQuery;
    qryColumnsCOLUMN_NAME: TStringField;
    TblFieldsLOOKUP_TABLE: TStringField;
    TblFieldsLITERAL: TStringField;
    TblFieldsLoopkUpTable: TStringField;
    TblFieldsDO_NOT_APPEND_IF_ZERO: TStringField;
    TblHeaderCHARACTER_DELIMITERS: TStringField;
    PKImport: TIQWebHPick;
    PKImportID: TBCDField;
    PKImportIMPORT_CODE: TStringField;
    PKImportDESCRIP: TStringField;
    PKImportTABLE_TYPE: TStringField;
    Panel11: TUniPanel;
    SBSearch: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    sbStop: TUniSpeedButton;
    sbOpen: TUniSpeedButton;
    sbProcess: TUniSpeedButton;
    N2: TUniMenuItem;
    OpenImportFile1: TUniMenuItem;
    ProcessImport1: TUniMenuItem;
    N3: TUniMenuItem;
    Search1: TUniMenuItem;
    Toggle1: TUniMenuItem;
    PnlEmptyCarrier: TUniPanel;
    Panel14: TUniPanel;
    SBRecords: TUniStatusBar;
    Panel12: TUniPanel;
    PB: TUniProgressBar;
    Panel15: TUniPanel;
    SbStopImport: TUniSpeedButton;
    Panel16: TUniPanel;
    NewSchema1: TUniMenuItem;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PkAcctTYPE: TStringField;
    SBGL: TUniSpeedButton;
    PopupMenu1: TUniPopupMenu;
    CopyRecord1: TUniMenuItem;
    PasteRecord1: TUniMenuItem;
    N4: TUniMenuItem;
    CopyAllRecords1: TUniMenuItem;
    PasteAllRecords1: TUniMenuItem;
    ExportSchematoDBF1: TUniMenuItem;
    ImportSchemafromDBF1: TUniMenuItem;
    N5: TUniMenuItem;
    QryBatchMove: TFDQuery;
    BatchMove1: TFDDataMove;
    TblHeaderBUDGET_CODE: TStringField;
    TblHeaderGLYEAR_ID: TBCDField;
    TblHeaderRECS_TO_SKIP: TBCDField;
    TblHeaderGLYear: TStringField;
    PkGlYear: TIQWebHPick;
    PkBudgets: TIQWebHPick;
    PkBudgetsID: TBCDField;
    PkBudgetsDESCRIP: TStringField;
    PkBudgetsCODE: TStringField;
    PkGlYearID: TBCDField;
    PkGlYearDESCRIP: TStringField;
    PkGlYearSTART_DATE: TDateTimeField;
    PkGlYearEND_DATE: TDateTimeField;
    PopupMenu2: TUniPopupMenu;
    PopupMenu3: TUniPopupMenu;
    ClearBudgetCode1: TUniMenuItem;
    ClearFiscalYear1: TUniMenuItem;
    SrcBudgetFields: TDataSource;
    TblBudgetFields: TFDTable;
    TblBudgetFieldsID: TBCDField;
    TblBudgetFieldsPR_IMPORT_TABLES_ID: TBCDField;
    TblBudgetFieldsSEQ: TBCDField;
    TblBudgetFieldsSTART_POS: TBCDField;
    TblBudgetFieldsFIELD_LENGTH: TBCDField;
    TblBudgetFieldsFIELD_NAME: TStringField;
    TblBudgetFieldsDESCRIP: TStringField;
    TblBudgetFieldsSQL_STATEMENT: TStringField;
    TblBudgetFieldsFIELD_TYPE: TStringField;
    TblBudgetFieldsGLPERIODS_ID: TBCDField;
    PkPeriods: TIQWebHPick;
    PkPeriodsID: TBCDField;
    PkPeriodsPERIOD: TBCDField;
    PkPeriodsSTART_DATE: TDateTimeField;
    PkPeriodsEND_DATE: TDateTimeField;
    TblBudgetFieldsPeriod: TStringField;
    TblBudgetFieldsACCT_SEQ: TBCDField;
    PopupMenu4: TUniPopupMenu;
    ClearPeriod1: TUniMenuItem;
    Options1: TUniMenuItem;
    EditMappingTable1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SR: TIQWebSecurityRegister;
    Bevel2: TUniPanel;
    Bevel1: TUniPanel;
    Panel23: TUniPanel;
    Panel24: TUniPanel;
    Label13: TUniLabel;
    Bevel5: TUniPanel;
    Bevel6: TUniPanel;
    Bevel7: TUniPanel;
    Shape1: TUniPanel;
    bvTopBuffer: TUniPanel;
    bvLeftBuffer: TUniPanel;
    bvRightBuffer: TUniPanel;
    bvBottomBuffer: TUniPanel;
    Label14: TUniLabel;
    PnlPCCarrier: TUniPanel;
    PC: TUniPageControl;
    TabGrid: TUniTabSheet;
    GridHeader: TIQUniGridControl;
    dbTableType1: TUniDBComboBox;
    TabForm: TUniTabSheet;
    sbFormView: TUniScrollBox;
    PnlFormView1: TUniPanel;
    Splitter4: TUniSplitter;
    PnlFormViewLeft1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    PnlFormViewClient1: TUniPanel;
    dbImportCode: TUniDBEdit;
    dbDescrip: TUniDBEdit;
    dbTableType2: TUniDBComboBox;
    dbRecordLen: TUniDBEdit;
    dbRecordDelim: TUniDBEdit;
    dbFieldDelim: TUniDBEdit;
    dbCharDelim: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    PnlFormViewBudget: TUniPanel;
    GroupBox1: TUniGroupBox;
    Panel26: TUniPanel;
    Splitter5: TUniSplitter;
    PnlFormViewBudgetLeft1: TUniPanel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    PnlFormViewBudgetClient1: TUniPanel;
    dbCode: TUniDBEdit;
    dbYear: TUniDBEdit;
    PnlPC2Carrier: TUniPanel;
    PC2: TUniPageControl;
    TabGeneral: TUniTabSheet;
    Panel5: TUniPanel;
    Splitter3: TUniSplitter;
    Panel6: TUniPanel;
    Bevel3: TUniPanel;
    GridTables: TIQUniGridControl;
    dbAllTables: TUniDBLookupComboBox;
    Panel8: TUniPanel;
    Bevel4: TUniPanel;
    GridFields: TUnidbGrid;
    Panel21: TUniPanel;
    Panel22: TUniPanel;
    Label12: TUniLabel;
    Panel9: TUniPanel;
    NavFields: TUniDBNavigator;
    TabBudget: TUniTabSheet;
    Panel17: TUniPanel;
    Bevel9: TUniPanel;
    Panel18: TUniPanel;
    NavBudget: TUniDBNavigator;
    GridBudget: TIQUniGridControl;
    dbFieldType: TUniDBComboBox;
    dbPeriods: TUniEdit;
    PnlEmptyDefault: TUniPanel;
    Shape2: TUniPanel;
    PnlFormViewSpacer: TUniPanel;
    Bevel10: TUniPanel;
    Bevel11: TUniPanel;
    Bevel12: TUniPanel;
    PkImportExp: TIQWebHPick;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    TblHeaderEXP_USER_ID: TBCDField;
    SBExp: TUniSpeedButton;
    AssociateschemawithExpUser1: TUniMenuItem;
    PkAssoc: TIQWebHPick;
    FloatField2: TBCDField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    OpenDialog3: TOpenDialog;
    QrySqlShema: TFDQuery;
    QrySqlFiles: TFDQuery;
    QrySqlFields: TFDQuery;
    QrySqlBudgetFields: TFDQuery;
    RE: TUniMemo;
    Panel19: TUniPanel;
    Panel20: TUniPanel;
    Label11: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure TblHeaderBeforePost(DataSet: TDataSet);
    procedure TblTablesBeforeEdit(DataSet: TDataSet);
    procedure TblFieldsBeforePost(DataSet: TDataSet);
    procedure TblTablesBeforePost(DataSet: TDataSet);
    procedure GridFieldsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OpenImportFile1Click(Sender: TObject);
    procedure SBGridViewClick(Sender: TObject);
    procedure GridFieldsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure REMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RESelectionChange(Sender: TObject);
    procedure StoptReadingFile1Click(Sender: TObject);
    procedure GridHeaderDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GridHeaderDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ProcessImport1Click(Sender: TObject);
    procedure dbCharDelimDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbRecordDelimDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure SBSearchClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PKImportIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure NewSchema1Click(Sender: TObject);
    procedure SBGLClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CopyRecord1Click(Sender: TObject);
    procedure PasteRecord1Click(Sender: TObject);
    procedure CopyAllRecords1Click(Sender: TObject);
    procedure PasteAllRecords1Click(Sender: TObject);
    procedure ExportSchematoDBF1Click(Sender: TObject);
    procedure ImportSchemafromDBF1Click(Sender: TObject);
    procedure TblHeaderCalcFields(DataSet: TDataSet);
    procedure dbCodeDblClick(Sender: TObject);
    procedure dbYearDblClick(Sender: TObject);
    procedure ClearBudgetCode1Click(Sender: TObject);
    procedure ClearFiscalYear1Click(Sender: TObject);
    procedure TblHeaderAfterScroll(DataSet: TDataSet);
    procedure TblBudgetFieldsBeforeEdit(DataSet: TDataSet);
    procedure TblBudgetFieldsBeforePost(DataSet: TDataSet);
    procedure GridBudgetDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GridBudgetDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbPeriodsCustomDlg(Sender: TObject);
    procedure PkPeriodsBeforeOpen(DataSet: TDataSet);
    procedure TblBudgetFieldsCalcFields(DataSet: TDataSet);
    procedure ClearPeriod1Click(Sender: TObject);
    procedure EditMappingTable1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PkImportExpBeforeOpen(DataSet: TDataSet);
    procedure TblHeaderNewRecord(DataSet: TDataSet);
    procedure SBExpClick(Sender: TObject);
    procedure AssociateschemawithExpUser1Click(Sender: TObject);
    procedure TblHeaderFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
  private
    { Private declarations }
    FFile:String;
    FDbfField:String;
    FCol:Integer;
    FAbort:Boolean;
    FRecDel:String;
    FFieldDel:String;
    FCharDel:String;
    FLine:String;
    FSql:String;
    FDoNotAppend:Boolean;
    FFileSize:Integer;
    FProcessedSize:Integer;
    FInProcess:Boolean;
    FRecords :Integer;
    FGLDate:TDateTime;
    FGLPrepostId, FGLPrepostCycleId : Real;

    FID:Real;
    FIDS:String;

    FSchema_FName_IN          :String;
    FSchemaFile_FName_IN      :String;
    FSchemaFields_FName_IN    :String;
    FSchemaFile_FName_INDBT   :String;
    FSchemaFields_FName_INDBT :String;
    FSchemaBudget_FName_IN    :String;
    FSchemaBudget_FName_INDBT :String;

    FAccountList:TStringList;
    FPeriodList :TStringList;
    FBadList    :TStringList;
    FStopProcessing : Boolean;
    FDBF:Boolean;
    FExpHeaderId:Real;
    FEXP_USER_ID:Real;
    FEnteredBy:String;
    FSqlLiteConnection:TFDConnection;

    procedure DeleteID(ATable:TFDTable; Key:Word; AField:String);
    procedure OpenExternalFile;
    function  IsDBF(AFile:String):Boolean;
    function  IsXLS(AFile:String):Boolean;
    procedure OpenDBFFile;
    procedure OpenASCIIFile;
    procedure InsertRecordLength;
    procedure AcceptFromDBF;
    procedure AcceptFromRE;
    procedure AcceptFromDBF2;
    procedure AcceptFromRE2;
    procedure CheckSelText;
    procedure OpenFlatAsciiNoCRLF;
    procedure OpenDelimitedAsciiNoCRLF;
    procedure GetRecordDelimiters;
    procedure GetFieldDelimiters;
    procedure GetCharDelimiters;
    procedure CheckAll;

    procedure ProcessDBF;
    procedure ProcessFlat_CRLF;
    procedure ProcessFlat_NO_CRLF;
    procedure ProcessDelim_NO_CRLF;

    procedure ProcessRecords;
    procedure AppendRecord;
    procedure InsertRecord;

    function  GetFieldValue:String;
    function  GetMatchValue(AValue:String):String;
    procedure CreateSQL_Header;
    procedure AppendValueToSQL(AValue:String);
    procedure CreateSQL_Trailer;
    function  IsBlank(AValue:String):Boolean;
    function  GetDelimitedFieldValue:String;
    procedure ChangeSeparators;
    procedure GetFileSize;
    function  GetASCIIFileSize:Integer;
    procedure UpdateGauge;
    procedure ProcessImport;
    procedure AssignSelection(Qry:TFDQuery; AID:Real; ASql:String);
    procedure BatchCopyTableToDBF( const AFileName:String; SourceTableName : TFDQuery );
    procedure InsertShemaRecord;
    procedure InsertFiles(AID:Real);
    procedure InsertBudgt(AID:Real);
    procedure InsertFields(ANewID, AOldID:Real);
    procedure ProcessBudget;
    function  GetBudgetDelimitedFieldValue(ASeq:Integer):String;
    procedure PopulateAccountList;
    procedure PopulatePeriodList;
    procedure PopulateAccountListDBF;
    procedure PopulatePeriodListDBF;
    function  GetAccountId(var Acct:string):Real;
    function  GetMatchValueBudget(AValue:String):String;
    procedure StartUp(AOwner:TComponent; AId:real);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
    constructor CreateExp(AOwner:TComponent; AEXP_USER_ID:real; AEnteredBy:String);
  end;

procedure DoExpImport(AOwner:TComponent; AEXP_USER_ID:real; var AHdr_id:Real; AEnteredBy:String);
procedure DoPrImport;

var
  FrmPrImport: TFrmPrImport;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs,
  PRGLdate,
  IQMS.Common.HelpHook,
  ComObj,
  edbadord,
  IQMS.Common.NLS,
  EditMap,
  IQMS.Common.Controls,
  IQMS.Web.MicrosoftExcel.Utils,
  IQMS.Common.SqlLiteImportExport;


procedure DoExpImport(AOwner:TComponent; AEXP_USER_ID:real; var AHdr_id:Real; AEnteredBy:String);
begin
  with TFrmPrImport.CreateExp(AOwner, AEXP_USER_ID, AEnteredBy) do
  try
    ShowModal;
    AHdr_id := FExpHeaderId;
  finally
    free;
  end;
end;


procedure DoPrImport;
begin
  TFrmPrImport.Create(Application).Show;
end;

constructor TFrmPrImport.Create(AOwner:TComponent);
begin
  StartUp(AOwner, 0);
end;

constructor TFrmPrImport.CreateExp(AOwner:TComponent; AEXP_USER_ID:real; AEnteredBy:String);
begin
  StartUp(AOwner, AEXP_USER_ID);
  FEnteredBy := AEnteredBy;
end;


procedure TFrmPrImport.StartUp(AOwner:TComponent; AId:Real);
var
  AMargin:Integer;
begin
  inherited Create(Owner);
  FEXP_USER_ID := AId;
  FExpHeaderId := 0;
  if FEXP_USER_ID = 0 then
  begin
    SBExp.visible := false;
    AssociateschemawithExpUser1.visible := false;
  end
  else
  begin
    SBGL.visible := false;
    SBExp.left := SBGL.left;
    AssociateschemawithExpUser1.visible := true;
  end;

  IQRegFormRead( self, [ self, Panel1, Panel3, Panel6,
   PnlFormViewLeft1, PnlFormViewBudgetLeft1,
   GridHeader, GridTables, GridFields]);
  IQSetTablesActive( TRUE, self );
  PnlEmptyCarrier.Visible := False;
  PnlEmptyDefault.Visible := True;
  // set the page control to parent panel; this will give a smooth effect.
  IQMS.Common.Controls.AdjustPageControlToParent(PCFile);
  IQMS.Common.Controls.AdjustPageControlToParent(PC);
  IQMS.Common.Controls.AdjustPageControlToParent(PC2);
  sbFormView.VertScrollBar.Position := 0;

  // adjust right-aligned controls
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlFormViewClient1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlFormViewBudgetClient1);

  // compensate for security changes
  GridHeader.DataSource := nil;
  FID := -1;
  try
    SBSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
      Close;   { Call "Exit" }
  end;
end;

procedure TFrmPrImport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel1, Panel3, Panel6,
   PnlFormViewLeft1, PnlFormViewBudgetLeft1,
   GridHeader, GridTables, GridFields]);
  Action := caFree;
end;

procedure TFrmPrImport.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrImport.TblHeaderBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmPrImport.TblTablesBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmPrImport.TblFieldsBeforePost(DataSet: TDataSet);
begin
  with TFDTable(DataSet) do
  begin
    if MasterSource <> nil then
      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
        raise Exception.Create('Parent record not found, cannot post');
  end;
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmPrImport.TblTablesBeforePost(DataSet: TDataSet);
var
  ATableName:String;
begin
  with TFDTable(DataSet) do
  begin
    if MasterSource <> nil then
      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
        raise Exception.Create('Parent record not found, cannot post');

    if SelectValueFmtAsString('select table_name from all_tables where owner = ''IQMS'' and table_name = ''%s''',
                               [FieldByName('IQ_TABLE_NAME').asString]) = '' then
      raise Exception.Create(Format('Table %s not found', [FieldByName('IQ_TABLE_NAME').asString]));
  end;
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmPrImport.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridHeader.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    GridHeader.DataSource  := SrcHeader;
    PC.ActivePage := TabGrid;
  end;
end;

procedure TFrmPrImport.GridFieldsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if GridFields.SelectedField = TblFields.FieldByName('LOOKUP_TABLE') then
    DeleteID(TblFields, Key, 'LOOKUP_TABLE');
end;

procedure TFrmPrImport.DeleteID(ATable:TFDTable; Key:Word; AField:String);
begin
  if Key = VK_DELETE then
  with ATable do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName(AField).Clear;
    Key:= 0;
  end;
end;

procedure TFrmPrImport.OpenImportFile1Click(Sender: TObject);
begin
  TblHeader.CheckBrowseMode;
  if TblHeader.FieldByName('TABLE_TYPE').AsString = '' then
    raise Exception.Create('No File Type specified.');

  if (TblHeader.FieldByName('TABLE_TYPE').AsString = 'ANC') and
     (TblHeader.FieldByName('RECORD_LENGTH').asInteger = 0) then
     raise Exception.Create('Flat ASCII File (No LF+CR). No Record Length specified');

//  if (TblHeader.FieldByName('TABLE_TYPE').AsString = 'ANL') and
//    (TblHeader.FieldByName('RECORD_DELIMITERS').asString = '') then
//     raise Exception.Create('Delimited ASCII File (No LF+CR). No Record Delimiters specified');

  with OpenFile do
  if Execute then
  begin
    FFile := UpperCase(FileName);
    Caption := Format('Import External File: %s', [FFile]);
    OpenExternalFile;
  end;
end;

procedure TFrmPrImport.OpenExternalFile;
var
  ExcelApp  : OLEVariant;
begin

  if IsXLS(FFile) then
  begin
    if  not IQMS.Web.MicrosoftExcel.Utils.IsMicrosoftExcelInstalled then
      raise exception.Create('Microsoft Excel not installed');

    ExcelApp:= CreateOleObject('Excel.Application');
    try
      ExcelApp.Workbooks.Open( FFile );
      FFile := StrTran(UpperCase(FFile), '.XLS', '.TXT');
      ExcelApp.DisplayAlerts := 0;
      ExcelApp.ActiveWorkbook.SaveAs( FFile, -4158, 0 );            // -4158 - text file   0 - no backup
    finally
      ExcelApp.Application.Quit;
    end;
    sbStop.Enabled := True;
    StoptReadingFile1.Enabled := True;
    Sleep(1500);
    OpenASCIIFile;
  end
  else if IsDBF(FFile) then
  begin
    sbStop.Enabled := False;
    StoptReadingFile1.Enabled := False;
    OpenDBFFile;
  end
  else
  begin
    sbStop.Enabled := True;
    StoptReadingFile1.Enabled := True;
    OpenASCIIFile;
  end
end;

function TFrmPrImport.IsDBF(AFile:String):Boolean;
begin
  Result := ExtractFileExt(AFile) = '.DBF'
end;

function TFrmPrImport.IsXLS(AFile:String):Boolean;
begin
  Result := ExtractFileExt(AFile) = '.XLS'
end;


procedure TFrmPrImport.OpenDBFFile;
begin
  TblDbf.Close;
  TblDbf.ConnectionName := cnstFDConnectionName;
  TblDbf.TableName    := ExtractFileName(FFile);
  TblDbf.Open;
  SBDBF.Panels[0].Text := Format('File: %s', [FFile]);
  PCFile.ActivePage   := TabDbf;
end;

procedure TFrmPrImport.OpenASCIIFile;
begin
  RE.Lines.Clear;
  if (TblHeader.FieldByName('TABLE_TYPE').AsString = 'AFL') or
     (TblHeader.FieldByName('TABLE_TYPE').AsString = 'ADL') or
     (TblHeader.FieldByName('TABLE_TYPE').AsString = 'AXL') or
     ( (TblHeader.FieldByName('TABLE_TYPE').AsString = 'ANL') and
     (TblHeader.FieldByName('RECORD_DELIMITERS').AsString = '') )
     then
  begin
    RE.Lines.LoadFromFile(FFile);
    SBASCII.Panels[2].Text := Format('File: %s', [FFile]);
    if TblHeader.FieldByName('TABLE_TYPE').AsString = 'AFL' then InsertRecordLength;
    PCFile.ActivePage := TabAscii;
    Exit;
  end;

  if (TblHeader.FieldByName('TABLE_TYPE').AsString = 'ANC') then OpenFlatAsciiNoCRLF
  else if (TblHeader.FieldByName('TABLE_TYPE').AsString = 'ANL') then OpenDelimitedAsciiNoCRLF
  else raise Exception.Create('Wrong File Type');
  PCFile.ActivePage := TabAscii;
end;

procedure TFrmPrImport.GridFieldsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
//  if Source = GridDbf then Accept := True
//  else if (Source = RE) and
//          (TblHeader.FieldByName('TABLE_TYPE').asString = 'AFL')
//           then Accept := True
//  else Accept := False;
end;

procedure TFrmPrImport.REMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  if RE.SelLength > 0 then RE.BeginDrag(FALSE);
end;

procedure TFrmPrImport.RESelectionChange(Sender: TObject);
var
  ARow, ACol:Integer;
begin
  with RE do
  begin
//    ARow := Perform( EM_LINEFROMCHAR, SelStart, 0) + 1;
//    FCol := SelStart - Perform(EM_LINEINDEX, ARow - 1, 0) + 1;
//    SBASCII.Panels[0].Text := Format('Row# %d', [ARow]);
//    SBASCII.Panels[1].Text := Format('Col# %d', [FCol]);
  end;
end;

procedure TFrmPrImport.InsertRecordLength;
begin
  with TblHeader do
  if (FieldByName('TABLE_TYPE').AsString = 'AFL') and (FieldByName('RECORD_LENGTH').asInteger = 0) then
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName('RECORD_LENGTH').asInteger := Length(RE.Lines[0]);
    Post;
  end;
end;


procedure TFrmPrImport.AcceptFromDBF;
begin
  with TblFields do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
//    FieldByName('FIELD_NAME').asString := GridDbf.SelectedField.FieldName;
    Post;
  end;
end;

procedure TFrmPrImport.AcceptFromRE;
begin
  CheckSelText;
  with TblFields do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName('START_POS').asInteger := FCol;
//    FieldByName('FIELD_LENGTH').asInteger := RE.SelLength;
    Post;
  end;
end;

procedure TFrmPrImport.CheckSelText;
var
  ARow1, ARow2, AMaxLength:Integer;
begin
  with RE do
  begin
//    ARow1 := Perform( EM_LINEFROMCHAR, SelStart, 0) + 1;
//    ARow2 := Perform( EM_LINEFROMCHAR, SelStart + SelLength, 0) + 1;
    if ARow1 <> ARow2 then
      raise Exception.Create('More that one line selected');
  end;
end;

procedure TFrmPrImport.OpenFlatAsciiNoCRLF;
var
//  AStr:array[0..1023] of char;
  AStr:String;
  AChr: Ansichar;
  ARead:Integer;
  AFile:Integer;
begin
  AFile := FileOpen(FFile, fmOpenRead);
  FAbort := False;
  try
    while True do
    begin
//      ARead := FileRead(AFile, AStr, 1024);
      ARead := FileRead(AFile, AChr, 1);
      Application.ProcessMessages;
      if (ARead <> 1) or FAbort then Exit;
      AStr := AStr + AChr;
      if Length(AStr) = TblHeader.FieldByName('RECORD_LENGTH').asInteger then
      begin
        Re.Lines.Add(AStr);
        AStr := '';
      end;
    end;
  finally
    FileClose(AFile);
  end;
end;

procedure TFrmPrImport.OpenDelimitedAsciiNoCRLF;
var
  AStr:String;
  AChr: Ansichar;
  ARead:Integer;
  AFile:Integer;
begin
  GetRecordDelimiters;
  AFile := FileOpen(FFile, fmOpenRead);
  FAbort := False;
  try
    while True do
    begin
      ARead := FileRead(AFile, AChr, 1);
      Application.ProcessMessages;
      if (ARead <> 1) or FAbort then Exit;
      AStr := AStr + AChr;
      if Pos(FRecDel, AStr) <> 0 then
      begin
        AStr := StrTran(AStr, FRecDel, '');
        Re.Lines.Add(AStr);
        AStr := '';
      end;
    end;
  finally
    FileClose(AFile);
  end;
end;

procedure TFrmPrImport.StoptReadingFile1Click(Sender: TObject);
begin
  FAbort := True;
end;

procedure TFrmPrImport.GetRecordDelimiters;
var
  AStr:String;
  i:Integer;
begin
  FRecDel := '';
  AStr := TblHeader.FieldByName('RECORD_DELIMITERS').asString;
  AStr := StrTran(Trim(AStr), ' ', '');
  for i := 1 to NumToken(AStr, ',') do
    FRecDel := FRecDel + Chr(Trunc(StrToFloat(GetToken(AStr, ',', i))));
  if FRecDel = '' then
    raise Exception.Create('No record delimiters found');
end;

procedure TFrmPrImport.GetFieldDelimiters;
var
  AStr:String;
  i:Integer;
begin
  FFieldDel := '';
  AStr := TblHeader.FieldByName('FIELD_DELIMITER').asString;
  AStr := StrTran(Trim(AStr), ' ', '');
  if Trim(AStr) = '' then Exit;
  for i := 1 to NumToken(AStr, ',') do
    FFieldDel := FFieldDel + Chr(Trunc(StrToFloat(GetToken(AStr, ',', i))));
  if Length(FFieldDel) > 1 then
    raise Exception.Create('Field Delimiter must not be longer that one characher');
end;

procedure TFrmPrImport.GetCharDelimiters;
var
  AStr:String;
  i:Integer;
begin
  FCharDel := '';
  AStr := TblHeader.FieldByName('CHARACTER_DELIMITERS').asString;
  AStr := StrTran(Trim(AStr), ' ', '');
  if Trim(AStr) = '' then Exit;
  for i := 1 to NumToken(AStr, ',') do
    FCharDel := FCharDel + Chr(Trunc(StrToFloat(GetToken(AStr, ',', i))));
  if Length(FCharDel) > 1 then
    raise Exception.Create('String Delimiter must not be longer that one characher');

end;



procedure TFrmPrImport.GridHeaderDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  Acoord: TGridCoord;
begin
//  Acoord := GridHeader.MouseCoord(X, Y);
//  if (Source = RE) and
//     ((TblHeader.FieldByName('TABLE_TYPE').asString = 'ADL') or
//      (TblHeader.FieldByName('TABLE_TYPE').AsString = 'AXL') or
//      (TblHeader.FieldByName('TABLE_TYPE').asString = 'ANL') ) then Accept := True
//  else Accept := False;
//  if Accept then
//  if not ( (GridHeader.FieldName(ACoord.X) = 'FIELD_DELIMITER') or
//           (GridHeader.FieldName(ACoord.X) = 'CHARACTER_DELIMITERS') or
//           (GridHeader.FieldName(ACoord.X) = 'RECORD_DELIMITERS') ) then Accept := False;

end;

procedure TFrmPrImport.GridHeaderDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  FOnMouseDown: TMouseEvent;
  ADelim, AStr:String;
  i:Integer;
  Acoord: TGridCoord;
begin
//  Acoord := GridHeader.MouseCoord(X, Y);
//  if Acoord.Y < 1 then Exit;     // Avoid droping on a title;
//  try
//    GridHeader.SetActiveRow(ACoord.Y - 1);
//  except
//    Exit;                        // Avoid Grid index out of bounds;
//  end;
//  if not ( (GridHeader.FieldName(ACoord.X) = 'FIELD_DELIMITER') or
//           (GridHeader.FieldName(ACoord.X) = 'CHARACTER_DELIMITERS') or
//           (GridHeader.FieldName(ACoord.X) = 'RECORD_DELIMITERS') ) then Exit;
//  with tblHeader do
//  begin
//    ADelim := '';
//    AStr := RE.SelText;
//    for i := 1 to Length(AStr) do
//      ADelim := ADelim + IntToStr(Ord(AStr[i])) + ',';
//    ADelim := Copy(ADelim, 1, Length(ADelim) - 1);
//    if not (State in [dsEdit, dsInsert]) then Edit;
//    FieldByName(GridHeader.FieldName(ACoord.X)).asString := ADelim;
//    Post;
//  end;
end;

procedure TFrmPrImport.ProcessImport1Click(Sender: TObject);
begin
  FGLPrepostId := 0;
  FGLPrepostCycleId := 0;
  ProcessImport;
end;

procedure TFrmPrImport.ProcessImport;
var
  ATab:TUniTabSheet;
begin
  CheckAll;
  GetFileSize;
  FProcessedSize := 0;
  FRecords       := 0;
  FAbort         := False;
  PB.Max := FFileSize;
  UpdateGauge;
  try
    FBadList     := TStringList.Create;
    FInProcess := True;
    ATab := PCFile.ActivePage;
    PCFile.ActivePage := TabEmpty;
    Panel1.Enabled := False;
    PnlEmptyCarrier.Visible := True;
    PnlEmptyDefault.Visible := False;
    sbStop.Enabled := True;
    FDBF := False;
    if      (tblHeader.FieldByname('TABLE_TYPE').asString = 'DBF') then ProcessDBF
    else if (tblHeader.FieldByname('TABLE_TYPE').asString = 'AFL') then ProcessFlat_CRLF
    else if (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANC') then ProcessFlat_NO_CRLF
    else if (tblHeader.FieldByname('TABLE_TYPE').asString = 'ADL') then ProcessFlat_CRLF
    else if (tblHeader.FieldByname('TABLE_TYPE').asString = 'AXL') then ProcessFlat_CRLF
    else if (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANL') then ProcessDelim_NO_CRLF;
    IqConfirm(Format('Done. %d records appended', [FRecords]));

    if FBadList.Count > 0 then
      DoShowBadEdiOrds( FBadList );    {in edbadord.pas}

  finally
    FBadList          := nil;
    FBadList.Free;
    FInProcess        := False;
    Panel1.Enabled    := True;
    PnlEmptyCarrier.Visible   := False;
    PnlEmptyDefault.Visible := True;
    PCFile.ActivePage := ATab;
    Screen.Cursor     := crDefault;
  end;
end;


procedure TFrmPrImport.CheckAll;
begin
  tblHeader.CheckBrowseMode;
  FFieldDel := '';
  FCharDel  := '';

  if FFile = '' then raise Exception.Create('No Import file specified');

  if PC2.ActivePage <> TabBudget then
  if ( (PCFile.ActivePage = TabDBF) and (tblHeader.FieldByname('TABLE_TYPE').asString <> 'DBF') ) or
     ( (PCFile.ActivePage <> TabDBF) and (tblHeader.FieldByname('TABLE_TYPE').asString = 'DBF') ) then
     raise Exception.Create('Opened file and File Type are incompatible');

  if PC2.ActivePage <> TabBudget then
  if TblFields.Eof and TblFields.Bof then raise Exception.Create('No conversion fields specified');

  if PC2.ActivePage <> TabBudget then
  if SelectValueFmtAsFloat('select count(m.id) from pr_fields_match m, iq_import_tables i ' +
               'where m.iq_import_tables_id = i.id and i.pr_import_tables_id = %f ' +
               'and NVL(m.literal, ''N'') = ''Y'' and NVL(m.field_name, ''~'') = ''~''',
               [tblHeader.FieldByname('ID').asFloat]) <> 0 then
    raise Exception.Create('Literal Field(s) missing Field Name(s).');

  if tblHeader.FieldByname('TABLE_TYPE').asString = 'DBF' then
    if SelectValueFmtAsFloat('select count(m.id) from pr_fields_match m, iq_import_tables i ' +
                 'where m.iq_import_tables_id = i.id and i.pr_import_tables_id = %f ' +
                 'and TrimLeft(RTrim(NVL(m.field_name, ''~''))) = ''~''',
                 [tblHeader.FieldByname('ID').asFloat]) <> 0 then
      raise Exception.Create('For DBF format conversion, not all fields have the ''DBF Field Name'' filled in.');

  if (tblHeader.FieldByname('TABLE_TYPE').asString = 'AFL') or
     (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANC') then
    if SelectValueFmtAsFloat('select count(m.id) from pr_fields_match m, iq_import_tables i ' +
                 'where m.iq_import_tables_id = i.id and i.pr_import_tables_id = %f ' +
                 'and (NVL(m.start_pos, 0) = 0 or NVL(m.field_length, 0) = 0) and NVL(m.literal, ''N'') = ''N''',
                 [tblHeader.FieldByname('ID').asFloat]) <> 0 then
      raise Exception.Create('For Flat ASCII format conversion,'#13 +
                             'not all fields have the ''Flat Start Pos.'' and ''Flat Field Length'' filled in.');

  if (tblHeader.FieldByname('TABLE_TYPE').asString = 'ADL') or
     (tblHeader.FieldByname('TABLE_TYPE').asString = 'AXL') or
     (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANL') then
    if SelectValueFmtAsFloat('select count(m.id) from pr_fields_match m, iq_import_tables i ' +
                 'where m.iq_import_tables_id = i.id and i.pr_import_tables_id = %f ' +
                 'and NVL(m.seq, 0) = 0',
                 [tblHeader.FieldByname('ID').asFloat]) <> 0 then
      raise Exception.Create('For ASCII Delimited conversion,'#13 +
                             'not all fields have the ''Delimited Sequence'' filled in.');

  if (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANC') and
     (tblHeader.FieldByname('RECORD_LENGTH').asInteger = 0) then
      raise Exception.Create('For Flat ASCII format conversion, no record lenght specified.');

  if  ((tblHeader.FieldByname('TABLE_TYPE').asString = 'ADL') or (tblHeader.FieldByname('TABLE_TYPE').asString = 'AXL')) and
      (Trim(tblHeader.FieldByname('FIELD_DELIMITER').asString) = '')  then
      raise Exception.Create('For ASCII Delimited conversion (CR+LF), no field delimiter specified');

   if  (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANL') and
     ( (Trim(tblHeader.FieldByname('RECORD_DELIMITERS').asString) = '') or
       (Trim(tblHeader.FieldByname('FIELD_DELIMITER').asString) = '') ) then
      raise Exception.Create('For ASCII Delimited conversion, no field or record delimiters specified');

end;


procedure TFrmPrImport.ProcessDBF;
var
  ASkip:Integer;
  I:Integer;
begin
  FDbf := True;
  try
    TblDbf.First;
    ASkip := TblHeaderRECS_TO_SKIP.asInteger;
    if PC2.ActivePage = TabBudget then
    begin
      FAccountList := TStringList.Create;
      FPeriodList  := TStringList.Create;
      PopulateAccountListDBF;
      PopulatePeriodListDBF;
      FStopProcessing := False;
    end;

    with TblDbf do
    begin
      for I := 1 to ASkip do
      begin
        Next;
        if eof then exit;
      end;
      while not eof do
      begin
        ProcessRecords;
        Next;
        Inc(FProcessedSize);
        UpdateGauge;
      end;
    end;

  finally
    if PC2.ActivePage = TabBudget then
    begin
      FAccountList := nil;
      FPeriodList  := nil;
      FAccountList.Free;
      FPeriodList.Free;
    end;
  end;

end;

procedure TFrmPrImport.ProcessFlat_CRLF;
var
  AFile:TextFile;
  ASkip:Integer;
  I:Integer;
begin
  try
    if PC2.ActivePage = TabBudget then
    begin
      FAccountList := TStringList.Create;
      FPeriodList  := TStringList.Create;
      PopulateAccountList;
      PopulatePeriodList;
      FStopProcessing := False;
    end;
    FLine := '';
    AssignFile(AFile, FFile);
    Reset(AFile);
    ASkip := TblHeaderRECS_TO_SKIP.asInteger;
    try
      for I := 1 to ASkip do
      begin
        ReadLn(AFile, FLine);
        if eof(AFile) then Exit;
      end;

      while not eof(AFile) do
      begin
        ReadLn(AFile, FLine);
        if (tblHeader.FieldByname('TABLE_TYPE').asString = 'ADL') or (tblHeader.FieldByname('TABLE_TYPE').asString = 'AXL') then ChangeSeparators;
        ProcessRecords;
        if FStopProcessing then Exit;
        FProcessedSize := FProcessedSize + Length(FLine);
        UpdateGauge;
      end;
    finally
      CloseFile(AFile);
    end;
  finally
    if PC2.ActivePage = TabBudget then
    begin
      FAccountList := nil;
      FPeriodList  := nil;
      FAccountList.Free;
      FPeriodList.Free;
    end;
  end;
end;

procedure TFrmPrImport.ProcessFlat_NO_CRLF;
var
  AChr: Ansichar;
  ARead:Integer;
  AFile:Integer;
begin

  AFile := FileOpen(FFile, fmOpenRead);
  FLine := '';
  try

    while True do
    begin
      ARead := FileRead(AFile, AChr, 1);
      if (ARead <> 1) then Exit;
      FLine := FLine + AChr;
      if Length(FLine) = TblHeader.FieldByName('RECORD_LENGTH').asInteger then
      begin
        ProcessRecords;
        FProcessedSize := FProcessedSize + Length(FLine);
        UpdateGauge;
        FLine := '';
      end;
    end;
  finally
    FileClose(AFile);
  end;
end;

procedure TFrmPrImport.ProcessDelim_NO_CRLF;
var
  AChr: Ansichar;
  ARead:Integer;
  AFile:Integer;
begin
  GetRecordDelimiters;
  AFile := FileOpen(FFile, fmOpenRead);
  FLine := '';
  try
    while True do
    begin
      ARead := FileRead(AFile, AChr, 1);
      Application.ProcessMessages;
      if (ARead <> 1) then Exit;
      FLine := FLine + AChr;
      if Pos(FRecDel, FLine) <> 0 then
      begin
        FLine := StrTran(FLine, FRecDel, '');
        ChangeSeparators;
        ProcessRecords;
        FProcessedSize := FProcessedSize + Length(FLine);
        UpdateGauge;
        FLine := '';
      end;
    end;
  finally
    FileClose(AFile);
  end;
end;

procedure TFrmPrImport.ProcessRecords;
var
  AQry:TFDQuery;
begin
  if PC2.ActivePage = TabBudget then
  begin
    ProcessBudget;
  end
  else
  begin
    AQry := TFDQuery.Create(nil);
    try
      AQry.ConnectionName := cnstFDConnectionName;
      AQry.Sql.Add(IqFormat('select * from IQ_IMPORT_TABLES where pr_import_tables_id = %f order by import_seq', [TblHeaderID.asFloat]));
      AQry.Open;
      while not AQry.Eof do
      begin
        TblTables.Locate('ID', AQry.FieldByName('ID').asFloat, []);
        if TblTables.FieldByName('SQL_STATEMENT').asString <> '' then
          ExecuteCommand(TblTables.FieldByName('SQL_STATEMENT').asString);
        FDoNotAppend := False;
        CreateSQL_Header;
        TblFields.First;
        while not TblFields.Eof do
        begin
          Application.ProcessMessages;
          AppendRecord;
          TblFields.Next;
        end;
        CreateSQL_Trailer;
        if not FDoNotAppend then InsertRecord;
        AQry.Next;
      end;
    finally
      AQry.Free;
    end;
{
    TblTables.First;
    while not TblTables.Eof do
    begin
      if TblTables.FieldByName('SQL_STATEMENT').asString <> '' then
        ExecuteCommand(TblTables.FieldByName('SQL_STATEMENT').asString);
      FDoNotAppend := False;
      CreateSQL_Header;
      TblFields.First;
      while not TblFields.Eof do
      begin
        Application.ProcessMessages;
        AppendRecord;
        TblFields.Next;
      end;
      CreateSQL_Trailer;
      if not FDoNotAppend then InsertRecord;
      TblTables.Next;
    end;
}
  end;
end;

procedure TFrmPrImport.InsertRecord;
begin
  if FAbort then
    if IQConfirmYN('Do you wish to abort importing?') then
      raise Exception.Create('Import aborted by user.')
    else FAbort := False;
  Inc(FRecords);
  SbRecords.Panels[0].Text := Format('Appended %d records', [FRecords]);
  Application.ProcessMessages;
  ExecuteCommand(FSQL);
end;

procedure TFrmPrImport.AppendRecord;
var
  AValue:String;
  ASql, AStr, Astatment:String;

begin
  AValue := GetFieldValue;
  if (TblFields.FieldByName('DO_NOT_APPEND_IF_ZERO').asString = 'Y') and
     IsBlank(AValue) then FDoNotAppend := True;
  if (Trim(tblFields.FieldByName('LOOKUP_TABLE').asString) <> '') then
     AValue := GetMatchValue(AValue);

  if (FGLPrepostCycleId <> 0 ) and
     (TblFields.FieldByName('IqFieldName').asString = 'GLPREPOST_CYCLE_ID') and
     (TblFields.FieldByName('SQL_STATEMENT').asString <> '') then
     begin
       Astatment := Trim(StrTran(StrTran(TblFields.FieldByName('SQL_STATEMENT').AsString, #13, ' '), #10, ' '));
       AValue := SelectValueFmtAsString(Astatment, [FGLPrepostCycleId])
     end
  else if
     (FExpHeaderId <> 0 ) and
     (TblFields.FieldByName('IqFieldName').asString = 'EXP_HEADER_ID') and
     (TblFields.FieldByName('SQL_STATEMENT').asString <> '') then
     begin
       Astatment := Trim(StrTran(StrTran(TblFields.FieldByName('SQL_STATEMENT').AsString, #13, ' '), #10, ' '));
       AValue := SelectValueFmtAsString(Astatment, [FExpHeaderId])
//       AValue := SelectValueFmtAsString(Astatment, [FGLPrepostCycleId])
     end

//      AValue := SelectValueFmtAsString(TblFields.FieldByName('SQL_STATEMENT').asString, [FExpHeaderId])
  else if TblFields.FieldByName('SQL_STATEMENT').asString <> '' then
  begin
      Astatment := Trim(StrTran(StrTran(TblFields.FieldByName('SQL_STATEMENT').AsString, #13, ' '), #10, ' '));
      if Copy(Uppercase(Astatment), 1, 6) = 'SELECT' then
        AValue := SelectValueFmtAsString(Astatment, [AValue, AValue, AValue, AValue, AValue])
      else
        ExecuteCommandFmt(Astatment, [AValue, AValue, AValue, AValue, AValue]);
  end;
  AppendValueToSQL(StrTran(AValue, '''', ''''''));
end;

function TFrmPrImport.IsBlank(AValue:String):Boolean;
var
  ANum:Real;
begin
  Result := False;
  if Trim(AValue) = '' then
  begin
    Result := True;
    Exit;
  end;
  try
    ANum := StrToFloat(AValue);
    if Abs(ANum) < 0.0000000001 then
    begin
      Result := True;
      Exit;
    end;
  except
  end;
end;


function TFrmPrImport.GetFieldValue:String;
begin
  if      (tblHeader.FieldByname('TABLE_TYPE').asString = 'DBF') then
    Result := tblDbf.FieldByName(tblFields.FieldByName('FIELD_NAME').asString).AsString
  else if (tblHeader.FieldByname('TABLE_TYPE').asString = 'AFL') or
          (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANC') then
    Result := Copy(FLine, tblFields.FieldByName('START_POS').asInteger, tblFields.FieldByName('FIELD_LENGTH').asInteger)
  else if (tblHeader.FieldByname('TABLE_TYPE').asString = 'ADL') or
          (tblHeader.FieldByname('TABLE_TYPE').asString = 'AXL') or
          (tblHeader.FieldByname('TABLE_TYPE').asString = 'ANL') then Result := GetDelimitedFieldValue;
end;

function TFrmPrImport.GetDelimitedFieldValue:String;
begin
  Result := GetToken(FLine,
                     Chr(12),
                     tblFields.FieldByname('SEQ').asInteger);
  if FCharDel <> '' then
    Result := StrTran(Result, FCharDel, '');
end;

function TFrmPrImport.GetMatchValue(AValue:String):String;
var
  i:Integer;
  APick :TIQWebHPick;
  ATable:TFDTable;
  AID:Real;
  ALiteral:String;
begin
  if tblFields.FieldByName('LITERAL').asString = 'Y'
  then Result := tblFields.FieldByName('FIELD_NAME').asString
  else Result := AValue;
  ALiteral    := Result;
  if Result = '' then raise Exception.Create('If Field is ''Literal'' then Field Name must be present');
  AID :=  SelectValueFmtAsFloat('select lookup_value from iq_mapping where pr_import_tables_id = %f ' +
               'and user_value = ''%s'' and lookup_table = ''%s''',
               [tblHeader.FieldByName('ID').asFloat,
               Result,
               tblFields.FieldByName('LOOKUP_TABLE').asString]);
  if AID = 0 then
  begin
    if tblFields.FieldByName('LOOKUP_TABLE').asString = 'PR_EMP' then
    begin
      APick := PKEmp;
      APick.Title := Format('Please select employee for the %s code', [Result]);
    end
    else if tblFields.FieldByName('LOOKUP_TABLE').asString = 'PR_PAYTYPE' then
    begin
      APick := PKPayType;
      APick.Title := Format('Please select paytype for the %s code', [Result]);
    end
    else if tblFields.FieldByName('LOOKUP_TABLE').asString = 'GLACCT' then
    begin
      APick := PkAcct;
      APick.Title := Format('Please select GLAcct for the %s code', [Result]);
    end
    else exit;
    with APick do
    if Execute then
    begin
      Result := GetValue('ID');
      ExecuteCommandFmt('insert into iq_mapping (pr_import_tables_id, lookup_table, lookup_value, user_value) ' +
                'values (%f, ''%s'', %f, ''%s'')',
                [tblHeader.FieldByName('ID').asFloat,
                 tblFields.FieldByName('LOOKUP_TABLE').asString,
                 StrToFloat(Result),
                 ALiteral]);
    end;
  end
  else  Result := IntToStr(Trunc(AID));
end;

procedure TFrmPrImport.CreateSQL_Header;
begin
  FSql := '';
  FSql := Format('insert into %s ( ', [TblTables.FieldByName('IQ_TABLE_NAME').asString]);
  TblFields.First;
  with TblFields do
  while not Eof do
  begin
    FSql := FSql + Format('%s, ', [FieldByName('IQ_FIELD_NAME').asString]);
    Next;
  end;
  FSql := Copy(FSql, 1, Length(FSql) - 2) + ') values ( ';
end;

procedure TFrmPrImport.CreateSQL_Trailer;
begin
  FSql := Copy(FSql, 1, Length(FSql) - 2) + ')';
end;

procedure TFrmPrImport.AppendValueToSQL(AValue:String);
var
  aType:String;
begin
  aType := SelectValueFmtAsString('select data_type from all_tab_columns where ' +
                        'table_name = ''%s'' and column_name = ''%s'' and owner = ''IQMS''',
                        [TblTables.FieldByName('IQ_TABLE_NAME').asString,
                         TblFields.FieldByName('IQ_FIELD_NAME').asString]);
  if AType = '' then raise Exception.Create('Unknown field type.');
  if (AType = 'DATE') and (TblFields.FieldByName('DATE_FORMAT').asString = '') then
    raise Exception.Create('Date format missing.');
  if AType = 'NUMBER' then FSQL := FSQL + Format('%s, ', [AValue])
  else if AType = 'DATE' then FSQL := FSQL + Format('To_Date(''%s'', ''%s''), ',
                                      [AValue,
                                       TblFields.FieldByName('DATE_FORMAT').asString])
  else FSQL := FSQL + Format('''%s'', ', [AValue]);
end;

procedure TFrmPrImport.ChangeSeparators;
var
  i:Integer;
  ABetweenCharDel:Boolean;
begin
  if FFieldDel = '' then GetFieldDelimiters;
  if FCharDel  = '' then GetCharDelimiters;

  ABetweenCharDel := False;
  for i := 1 to Length(FLine) do
  begin
    if FLine[i] = FCharDel then
      ABetweenCharDel := not ABetweenCharDel;
    if (not ABetweenCharDel) and (FLine[i] = FFieldDel)
      then FLine[i] := Chr(12);
  end;
end;

procedure TFrmPrImport.dbCharDelimDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = RE) and
     ((TblHeader.FieldByName('TABLE_TYPE').asString = 'ADL') or
      (TblHeader.FieldByName('TABLE_TYPE').asString = 'AXL') or
      (TblHeader.FieldByName('TABLE_TYPE').asString = 'ANL') ) then Accept := True
  else Accept := False;
end;

procedure TFrmPrImport.dbRecordDelimDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  ADelim, AStr:String;
  i:Integer;
begin
  with tblHeader do
  begin
    ADelim := '';
//    AStr := RE.SelText;
    for i := 1 to Length(AStr) do
      ADelim := ADelim + IntToStr(Ord(AStr[i])) + ',';
    ADelim := Copy(ADelim, 1, Length(ADelim) - 1);
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName(TUniDBEdit(Sender).DataField).asString := ADelim;
    Post;
  end;
end;

procedure TFrmPrImport.SBSearchClick(Sender: TObject);
var
  APk:TIQWebHPick;
begin
  if FExp_user_id = 0 then
    APk := PKImport
  else
    APk := PkImportExp;

  with APk do
  if Execute then
    TblHeader.Locate('ID', GetValue('ID'), [])
  else Abort;
end;

procedure TFrmPrImport.GetFileSize;
begin
  if PCFile.ActivePage = TabDBF then
  begin
    TblDbf.Last;
    FFileSize := TblDbf.Recno;
    TblDbf.First;
  end
  else FFileSize := GetASCIIFileSize;
end;


function TFrmPrImport.GetASCIIFileSize:Integer;
var
   f: file of Byte;
begin
  AssignFile(f, FFile);
  try
    Reset(f);
    Result := FileSize(f);
  finally
    CloseFile(f);
  end;
end;

procedure TFrmPrImport.UpdateGauge;
begin
  PB.Position := FProcessedSize;
  Application.ProcessMessages;
end;

procedure TFrmPrImport.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FInProcess then Abort;
end;

procedure TFrmPrImport.PKImportIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, wm_Command, self.NewSchema1.Command, 0 );
end;

procedure TFrmPrImport.NewSchema1Click(Sender: TObject);
begin
  TblHeader.CheckBrowseMode;
  TblHeader.Insert;
end;

procedure TFrmPrImport.SBGLClick(Sender: TObject);
begin
  if not DoGetGLPrepostDate(FGLDate) then exit; {PRGLDate.pas}
  FGLPrepostId := GetNextID('GLPREPOST');
  FGLPrepostCycleId := GetNextID('GLPREPOST_CYCLE');
  ExecuteCommandFmt('insert into glprepost (id, ' +
                                   'type, ' +
                                   'total_cycles, ' +
                                   'start_date) ' +
                           'values (%f, ''FREE FORM'', 1, To_Date(''%s'', ''MM/DD/RRRR''))',
                           [FGLPrepostId, FormatDateTime('mm/dd/yyyy', FGLDate)]);

  ExecuteCommandFmt('insert into glprepost_cycle (id, ' +
                                         'glprepost_id, ' +
                                         'cycle_date,  ' +
                                         'cycle_number) ' +
                                 'values (%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), 1)',
                                 [FGLPrepostCycleId, FGLPrepostId, FormatDateTime('mm/dd/yyyy', FGLDate)]);
  ProcessImport;
end;

procedure TFrmPrImport.SBExpClick(Sender: TObject);
begin
  FExpHeaderId := GetNextID('exp_header');

  ExecuteCommandFmt('insert into exp_header (id, ' +
                                    ' exp_user_id, '   +
                                    ' entered_by, '   +
                                    ' description, '   +
                                    ' eplant_id)   '   +
                              ' values( %f, %f, ''%s'', ''Import'', misc.GetEplantId)',
                              [FExpHeaderId, Fexp_user_id, FEnteredBy]);
  ProcessImport;
end;


procedure TFrmPrImport.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
//  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_TC{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPrImport.CopyRecord1Click(Sender: TObject);
begin
  FID := TblFieldsID.asFloat;
end;

procedure TFrmPrImport.PasteRecord1Click(Sender: TObject);
begin
  ExecuteCommandFmt('insert into PR_FIELDS_MATCH (iq_import_tables_id,     ' +
                                          'iq_field_name,          ' +
                                          'lookup_table,           ' +
                                          'seq,                    ' +
                                          'start_pos,              ' +
                                          'field_length,           ' +
                                          'field_name,             ' +
                                          'descrip,                ' +
                                          'sql_statement,          ' +
                                          'date_format,            ' +
                                          'literal,                ' +
                                          'do_not_append_if_zero)  ' +
                                  'select %f,                      ' +
                                          'iq_field_name,          ' +
                                          'lookup_table,           ' +
                                          'seq,                    ' +
                                          'start_pos,              ' +
                                          'field_length,           ' +
                                          'field_name,             ' +
                                          'descrip,                ' +
                                          'sql_statement,          ' +
                                          'date_format,            ' +
                                          'literal,                ' +
                                          'do_not_append_if_zero   ' +
                                   ' from PR_FIELDS_MATCH where id = %f',
                                   [TblTablesID.asFloat, FID]);

  TblFields.Refresh;
end;

procedure TFrmPrImport.CopyAllRecords1Click(Sender: TObject);
begin
  FIDS := '';
  TblFields.First;
  with TblFields do
  while not eof do
  begin
    FIDS := FIDS + TblFieldsID.asString + ', ';
    Next;
  end;

  FIDS := '(' + Copy(FIDS, 1, Length(FIDS) - 2) + ')';

end;

procedure TFrmPrImport.PasteAllRecords1Click(Sender: TObject);
begin
  ExecuteCommandFmt('insert into PR_FIELDS_MATCH (iq_import_tables_id,     ' +
                                          'iq_field_name,          ' +
                                          'lookup_table,           ' +
                                          'seq,                    ' +
                                          'start_pos,              ' +
                                          'field_length,           ' +
                                          'field_name,             ' +
                                          'descrip,                ' +
                                          'sql_statement,          ' +
                                          'date_format,            ' +
                                          'literal,                ' +
                                          'do_not_append_if_zero)  ' +
                                  'select %f,                      ' +
                                          'iq_field_name,          ' +
                                          'lookup_table,           ' +
                                          'seq,                    ' +
                                          'start_pos,              ' +
                                          'field_length,           ' +
                                          'field_name,             ' +
                                          'descrip,                ' +
                                          'sql_statement,          ' +
                                          'date_format,            ' +
                                          'literal,                ' +
                                          'do_not_append_if_zero   ' +
                                   ' from PR_FIELDS_MATCH where id in %s',
                                   [TblTablesID.asFloat, FIDS]);

  TblFields.Close;
  TblFields.Open;

end;

procedure TFrmPrImport.ExportSchematoDBF1Click(Sender: TObject);
var
  Schema_FName       :String;
  SchemaFile_FName   :String;
  SchemaFields_FName :String;
  SchemaBudget_FName :String;
  S                  :String;
  aSqlLiteExport:TIQSqlLiteExport;
begin

  if not OpenDialog3.Execute then exit;

  AssignSelection(QrySqlShema, TblHeaderID.AsFloat, SqlShema);
  AssignSelection(QrySqlFiles, TblHeaderID.AsFloat, SqlFiles);
  AssignSelection(QrySqlFields, TblHeaderID.AsFloat, SqlFields);
  AssignSelection(QrySqlBudgetFields, TblHeaderID.AsFloat, SqlBudgetFields);

  aSqlLiteExport := TIQSqlLiteExport.Create(OpenDialog3.FileName,
                                            [QrySqlShema, QrySqlFiles, QrySqlFields, QrySqlBudgetFields],
                                            ['ImpSchma', 'ImpFiles', 'ImpFilds', 'ImpBudgt']);
  try
    aSqlLiteExport.Execute;
  finally
    aSqlLiteExport.Free;
  end;


  IqConfirm('Tables exported successfully');

// waiting for X10 to fix the batchmove March 2 2016
{
  if not DirBrowse( s ) then exit;
  Schema_FName       := StrTran( S + '\ImpSchma.DBF' , '\\', '\' );
  SchemaFile_FName   := StrTran( S + '\ImpFiles.DBF', '\\', '\' );
  SchemaFields_FName := StrTran( S + '\ImpFilds.DBF', '\\', '\' );
  SchemaBudget_FName := StrTran( S + '\ImpBudgt.DBF', '\\', '\' );

//  if not GetEdiDBFNames( self, EdiTS_FName, EdiSeg_FName, EdiToken_FName, EdiValue_FName ) then Exit;

  Screen.Cursor:= crHourGlass;
  try
    AssignSelection(QryBatchMove, TblHeaderID.AsFloat, SqlShema);
    BatchCopyTableToDBF( Schema_FName, QryBatchMove);

    AssignSelection(QryBatchMove, TblHeaderID.AsFloat, SqlFiles);
    BatchCopyTableToDBF( SchemaFile_FName, QryBatchMove);

    AssignSelection(QryBatchMove, TblHeaderID.AsFloat, SqlFields);
    BatchCopyTableToDBF( SchemaFields_FName, QryBatchMove);

    AssignSelection(QryBatchMove, TblHeaderID.AsFloat, SqlBudgetFields);
    BatchCopyTableToDBF( SchemaBudget_FName, QryBatchMove);


    with TFDTable.Create(self) do
    try
      DataBaseName := S;
      TableName := 'ImpFiles.DBF';
      Open;
      while not eof do
      begin
        if Pos('''', FieldByName('sql_statem').asString) <> 0 then
        begin
          Edit;
          FieldByName('sql_statem').asString := Strtran(FieldByName('sql_statem').asString, '''', '''''');
          Post;
        end;
        Next;
      end;
    finally
      Free;
    end;

    with TFDTable.Create(self) do
    try
      DataBaseName := S;
      TableName := 'ImpFilds.DBF';
      Open;
      while not eof do
      begin
        if Pos('''', FieldByName('sql_statem').asString) <> 0 then
        begin
          Edit;
          FieldByName('sql_statem').asString := Strtran(FieldByName('sql_statem').asString, '''', '''''');
          Post;
        end;
        Next;
      end;
    finally
      Free;
    end;

    with TFDTable.Create(self) do
    try
      DataBaseName := S;
      TableName := 'ImpBudgt.DBF';
      Open;
      while not eof do
      begin
        if Pos('''', FieldByName('sql_statem').asString) <> 0 then
        begin
          Edit;
          FieldByName('sql_statem').asString := Strtran(FieldByName('sql_statem').asString, '''', '''''');
          Post;
        end;
        Next;
      end;
    finally
      Free;
    end;


  finally
    IqConfirm(Format('Tables exported successfully. Three export files are:'#13 +
                     '%s'#13 +
                     '%s'#13 +
                     '%s'#13 +
                     '%s', [Schema_FName, SchemaFile_FName, SchemaFields_FName, SchemaBudget_FName]));
    Screen.Cursor:= crDefault;
  end;
}
end;

procedure TFrmPrImport.BatchCopyTableToDBF( const AFileName:String; SourceTableName : TFDQuery );
var
  dbfTable:TFDTable;
begin
// waiting for X10 to fix the batchmove March 2 2016

{
  dbfTable := TFDTable.Create(self);
  try
    dbfTable.TableType := ttDbase;
    dbfTable.DataBaseName:= ExtractFilePath( AFileName );
    dbfTable.TableName   := ExtractFileName( AFileName );
    with BatchMove1 do
    begin
      Mode       := dmAlwaysInsert;
      Destination:= dbfTable;
      Source     := SourceTableName;
      Execute;
    end;
  finally
    dbfTable.Free;
  end;
 }
end;

procedure TFrmPrImport.AssignSelection(Qry:TFDQuery; AID:Real; ASql:String);
begin
  Qry.Close;
  Qry.Sql.Clear;
  Qry.Sql.Add(ASql + IntToStr(Trunc(AID)));
  Qry.Open;
end;

procedure TFrmPrImport.ImportSchemafromDBF1Click(Sender: TObject);
var
  S:string;
begin
  if not OpenDialog3.Execute then exit;


  FSqlLiteConnection := TFDConnection.Create(nil);
  FSqlLiteConnection.DriverName := 'SQLITE';
  FSqlLiteConnection.Params.Values['Database'] := OpenDialog3.FileName;
  try
    // Establish the connection.
    FSqlLiteConnection.Open;
  except
      on E: EDatabaseError do
      begin
        FSqlLiteConnection.Close;
        FSqlLiteConnection.Free;
        raise exception.Create('File is encrypted or is not a database');
      end;
  end;
  InsertShemaRecord;
  IQSetTablesActive( FALSE, self );
  IQSetTablesActive( TRUE, self );
  IQConfirm('Import completed');

  exit;

{
  if DirBrowse( s ) then
  begin
    FSchema_FName_IN          := StrTran( S + '\ImpSchma.DBF' , '\\', '\' );
    FSchemaFile_FName_IN      := StrTran( S + '\ImpFiles.DBF', '\\', '\' );
    FSchemaFields_FName_IN    := StrTran( S + '\ImpFilds.DBF', '\\', '\' );
    FSchemaFile_FName_INDBT   := StrTran( S + '\ImpFiles.DBT', '\\', '\' );
    FSchemaFields_FName_INDBT := StrTran( S + '\ImpFilds.DBT', '\\', '\' );
    FSchemaBudget_FName_IN    := StrTran( S + '\ImpBudgt.DBF' , '\\', '\' );
    FSchemaBudget_FName_INDBT := StrTran( S + '\ImpBudgt.DBT' , '\\', '\' );

    if not    FileExists( FSchema_FName_IN        )
       or not FileExists( FSchemaFile_FName_IN    )
       or not FileExists( FSchemaFields_FName_IN  ) then
       raise Exception.Create( 'Can not find all the Import files' );

    InsertShemaRecord;
    IQSetTablesActive( FALSE, self );
    IQSetTablesActive( TRUE, self );
    IQConfirm('Import completed');
  end;
}
end;

procedure TFrmPrImport.InsertShemaRecord;
var
  AID:Real;
begin

  with TFDQuery.Create(self) do
  try
    Connection := FSqlLiteConnection;
    Sql.Add('select * from ImpSchma');
    Open;
    while not eof do
    begin
      AID := GetNextID('PR_IMPORT_TABLES');

        ExecuteCommandFmt('insert into PR_IMPORT_TABLES (id,                   ' +
                  '                              import_code,          ' +
                  '                              descrip,              ' +
                  '                              import_table_name,    ' +
                  '                              table_type,           ' +
                  '                              budget_code,          ' +
                  '                              field_delimiter,      ' +
                  '                              record_delimiters,    ' +
                  '                              record_length,        ' +
                  '                              character_delimiters)  ' +
                  ' values(%f, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')',
                  [AId,
                   FieldByName('import_cod').AsString,
                   FieldByName('descrip').AsString,
                   FieldByName('import_tab').AsString,
                   FieldByName('table_type').AsString,
                   FieldByName('budget_cod').asString,
                   FieldByName('field_deli').AsString,
                   FieldByName('record_del').AsString,
                   FieldByName('record_len').AsString,
                   FieldByName('character_').AsString]);

      if FEXP_USER_ID <> 0 then
        ExecuteCommandFmt('update PR_IMPORT_TABLES set EXP_USER_ID  = %f where id = %f', [FEXP_USER_ID, AId]);
      InsertFiles(AID);
      InsertBudgt(AID);
      Next;
    end;
  finally
    Free;
  end;

end;

procedure TFrmPrImport.InsertFiles(AID:Real);
var
  AId1:Real;
begin
  with TFDQuery.Create(self) do
  try
    Connection := FSqlLiteConnection;
    Sql.Add(Format('select * from ImpFiles order by id', [AID]));
    Open;
    while not eof do
    begin
      AId1 := GetNextID('IQ_IMPORT_TABLES');
      ExecuteCommandFmt('insert into IQ_IMPORT_TABLES (id, ' +
                                              'pr_import_tables_id, ' +
                                              'iq_table_name,       ' +
                                              'import_seq,          ' +
                                              'sql_statement)        ' +
                                             'values ' +
                                             '(%f, ' +
                                             ' %f, ' +
                                             '''%s'', ' +
                                             '%d, ' +
                                             '''%s'')',
                                             [AId1,
                                              AID,
                                              FieldByName('iq_table_n').asString,
                                              FieldByName('import_seq').asInteger,
                                              FieldByName('sql_statem').asString]);
      InsertFields(AID1, FieldByName('id').asFloat);
      Next;
    end;
  finally
    Free;
  end;

end;

procedure TFrmPrImport.InsertBudgt(AID:Real);
var
  AId1:Real;
  AGlyearId:Real;
begin
 if SelectValueFmtAsString('select budget_code from pr_import_tables where id = %f', [AID]) = 'BUDGET' then
  with PkGlYear do
  if Execute then
  begin
    AGlyearId := GetValue('ID');
    if not (TblHeader.State in [dsEdit, dsInsert]) then
      ExecuteCommandFmt('update pr_import_tables set glyear_id = %f where id = %f', [AGlyearId, AID]);
  end;

  with TFDQuery.Create(self) do
  try
    Connection := FSqlLiteConnection;
    Sql.Add(Format('select * from ImpBudgt order by id', [AID]));
    Open;
    while not eof do
    begin
      AId1 := GetNextID('BUDGET_FIELDS_MATCH');
      ExecuteCommandFmt('insert into BUDGET_FIELDS_MATCH (id, ' +
                                                 'pr_import_tables_id, ' +
                                                 'seq,                 ' +
                                                 'start_pos,           ' +
                                                 'field_length,        ' +
                                                 'field_name,          ' +
                                                 'descrip,             ' +
                                                 'sql_statement,       ' +
                                                 'field_type,          ' +
                                                 'acct_seq)            ' +
                                             'values ' +
                                             '(%f, ' +
                                             ' %f, ' +
                                             '%d, ' +
                                             '%d, ' +
                                             '%d, ' +
                                             '''%s'', ' +
                                             '''%s'', ' +
                                             '''%s'', ' +
                                             '''%s'', ' +
                                             '%d)',
                                             [AId1,
                                              AID,
                                              FieldByName('seq').asInteger,
                                              FieldByName('start_pos').asInteger,
                                              FieldByName('field_leng').asInteger,
                                              FieldByName('field_name').asString,
                                              FieldByName('descrip').AsString,
                                              FieldByName('sql_statem').AsString,
                                              FieldByName('field_type').AsString,
                                              FieldByName('acct_seq').asInteger]);
      Next;
    end;
  finally
    Free;
  end;

end;


procedure TFrmPrImport.InsertFields(ANewID, AOldID:Real);
begin
  with TFDQuery.Create(self) do
  try
    Connection := FSqlLiteConnection;
    Sql.Add(Format('select * from ImpFilds where iq_import_ = %f', [AOldID]));
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('insert into PR_FIELDS_MATCH (iq_import_tables_id,    ' +
                                              'iq_field_name,         ' +
                                              'lookup_table,          ' +
                                              'seq,                   ' +
                                              'start_pos,             ' +
                                              'field_length,          ' +
                                              'field_name,            ' +
                                              'descrip,               ' +
                                              'sql_statement,         ' +
                                              'date_format,           ' +
                                              'literal,               ' +
                                              'do_not_append_if_zero) '  +
                                      'values (%f, ''%s'', ''%s'',               ' +
                                               'decode(%d, 0, null, %d), ' +
                                               'decode(%d, 0, null, %d), ' +
                                               'decode(%d, 0, null, %d), ' +
                                               '''%s'',                      ' +
                                               '''%s'',                      ' +
                                               '''%s'',                      ' +
                                               'trim(''%s''),                ' +
                                               '''%s'',                      ' +
                                               '''%s'')',
                                            [ANewID,
                                             FieldByName('iq_field_n').AsString,
                                             FieldByName('lookup_tab').AsString,
                                             FieldByName('seq').asInteger,
                                             FieldByName('seq').asInteger,
                                             FieldByName('start_pos').asInteger,
                                             FieldByName('start_pos').asInteger,
                                             FieldByName('field_leng').asInteger,
                                             FieldByName('field_leng').asInteger,
                                             FieldByName('field_name').AsString,
                                             FieldByName('descrip').AsString,
                                             StrTran(StrTran(FieldByName('sql_statem').AsString, #13, ' '), #10, ' '),
                                             FieldByName('date_forma').AsString,
                                             FieldByName('literal').AsString,
                                             FieldByName('do_not_app').AsString]);
      Next;
    end;
  finally
    Free;
  end;

end;


procedure TFrmPrImport.TblHeaderCalcFields(DataSet: TDataSet);
begin
  TblHeaderGLYear.asString := SelectValueFmtAsString('select descrip from glyear where id = %f',
                                           [TblHeaderGLYEAR_ID.asFloat]);
end;

procedure TFrmPrImport.dbCodeDblClick(Sender: TObject);
begin
  with PkBudgets do
  if Execute then
  begin
    if not (TblHeader.State in [dsEdit, dsInsert]) then
      TblHeader.Edit;
      TblHeaderBUDGET_CODE.asString := GetValue('CODE');
  end;
end;

procedure TFrmPrImport.dbYearDblClick(Sender: TObject);
begin
  with PkGlYear do
  if Execute then
  begin
    if not (TblHeader.State in [dsEdit, dsInsert]) then
      TblHeader.Edit;
      TblHeaderGLYEAR_ID.asFloat := GetValue('ID');
  end;
end;

procedure TFrmPrImport.ClearBudgetCode1Click(Sender: TObject);
begin
    if not (TblHeader.State in [dsEdit, dsInsert]) then
      TblHeader.Edit;
      TblHeaderBUDGET_CODE.Clear;
end;

procedure TFrmPrImport.ClearFiscalYear1Click(Sender: TObject);
begin
    if not (TblHeader.State in [dsEdit, dsInsert]) then
      TblHeader.Edit;
      TblHeaderGLYEAR_ID.Clear;
end;

procedure TFrmPrImport.TblHeaderAfterScroll(DataSet: TDataSet);
begin
  if (TblHeaderGLYEAR_ID.asFloat <> 0) and (TblHeaderBUDGET_CODE.asString <> '') then
    PC2.ActivePage := TabBudget
  else
    PC2.ActivePage := TabGeneral;

end;

procedure TFrmPrImport.TblBudgetFieldsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmPrImport.TblBudgetFieldsBeforePost(DataSet: TDataSet);
begin
  with TFDTable(DataSet) do
  begin
    if MasterSource <> nil then
      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
        raise Exception.Create('Parent record not found, cannot post');
  end;
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmPrImport.GridBudgetDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source = GridDbf then Accept := True
  else if (Source = RE) and
          (TblHeader.FieldByName('TABLE_TYPE').asString = 'AFL')
           then Accept := True
  else Accept := False;
end;

procedure TFrmPrImport.GridBudgetDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
//     TIqDBGrid(GridBudget).MouseDown( mbLeft, [ssLeft], X, Y );
    if Source = GridDbf then AcceptFromDBF2
    else if Source = RE then AcceptFromRE2;
end;

procedure TFrmPrImport.AcceptFromDBF2;
begin
  with TblBudgetFields do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
//    FieldByName('FIELD_NAME').asString := GridDbf.SelectedField.FieldName;
    Post;
  end;
end;

procedure TFrmPrImport.AcceptFromRE2;
begin
  CheckSelText;
  with TblBudgetFields do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName('START_POS').asInteger := FCol;
//    FieldByName('FIELD_LENGTH').asInteger := RE.SelLength;
    Post;
  end;
end;

procedure TFrmPrImport.dbPeriodsCustomDlg(Sender: TObject);
var
  AId:Real;
begin
  with PkPeriods do
  if Execute then
  begin
    AId := GetValue('ID');
    if SelectValueFmtAsFloat('select id from BUDGET_FIELDS_MATCH where PR_IMPORT_TABLES_ID = %f and GLPERIODS_ID = %f',
                 [TblHeaderID.asFloat, AId]) <> 0 then
      raise exception.create('GL period already assigned');
    with TblBudgetFields do
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      TblBudgetFieldsGLPERIODS_ID.asFloat := AId;
      Post;
    end;
  end;
end;

procedure TFrmPrImport.PkPeriodsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AId', TblHeaderGLYEAR_ID.asFloat);
//  TFDQuery(DataSet).ParamByName('AId').Value := TblHeaderGLYEAR_ID.asFloat;
end;

procedure TFrmPrImport.TblBudgetFieldsCalcFields(DataSet: TDataSet);
begin
  TblBudgetFieldsPeriod.asString := SelectValueFmtAsString('select period from glperiods where id = %f',
                                                 [TblBudgetFieldsGLPERIODS_ID.asFloat]);
end;

procedure TFrmPrImport.ProcessBudget;
var
  ABudgetId:Real;
  AGlBudgetId:Real;
  AAccountId:Real;
  I:Integer;
  APeriodId:Integer;
  APeriodSeq:Integer;
  APeriodValue:Real;
  ATotal:Real;
  ABudgetsFYId:Real;
  AGLBudgetsId:Real;
  Aglacct_fyId:Real;
  Acct:String;
  APeriodField:String;
begin
  AAccountId := GetAccountId(Acct);
  Inc(FRecords);
  SbRecords.panels[0].Text := Format('Processed %d records', [FRecords]);
  Application.ProcessMessages;


  for I := 0 to FPeriodList.Count - 1 do
  try
    APeriodId    := Trunc(StrToFloat(Copy(FPeriodList[I], 1, Pos(',', FPeriodList[I]) - 1)));
    if FDbf then
    begin
      APeriodField := Copy(FPeriodList[I], Pos(',', FPeriodList[I]) + 1, Length(FPeriodList[I]));
      APeriodValue := tblDbf.FieldByName(APeriodField).AsFloat;
    end
    else
    begin
      APeriodSeq   := Trunc(StrToFloat(Copy(FPeriodList[I], Pos(',', FPeriodList[I]) + 1, Length(FPeriodList[I]))));
      APeriodValue := StrToFloat(GetBudgetDelimitedFieldValue(APeriodSeq));
    end;

    Aglacct_fyId := SelectValueFmtAsFloat('select id from glacct_fy where glacct_id = %f and glyear_id = %f',
                               [AAccountId, TblHeaderGLYEAR_ID.asFloat]);

    if Aglacct_fyId = 0 then
    begin
      Aglacct_fyId := GetNextID('GLACCT_FY');
      ExecuteCommandFmt('insert into glacct_fy (id, glacct_id, glyear_id) values (%f, %f, %f)',
                [Aglacct_fyId, AAccountId, TblHeaderGLYEAR_ID.asFloat]);
    end;

    ABudgetsFYId := SelectValueFmtAsFloat('select b.id from BUDGETS_FY b, budgets c, glacct_fy f where b.budgets_id = c.id ' +
                              'and c.code = ''%s'' and b.glacct_fy_id = f.id and f.glacct_id = %f and f.glyear_id = %f',
                              [TblHeaderBUDGET_CODE.asString,
                               AAccountId,
                               TblHeaderGLYEAR_ID.asFloat]);

    if ABudgetsFYId = 0 then
    begin
      ABudgetsFYId := GetNextID('BUDGETS_FY');
      ABudgetId    := SelectValueFmtAsFloat('select id from budgets where code = ''%s''', [TblHeaderBUDGET_CODE.asString]);
      ExecuteCommandFmt('insert into BUDGETS_FY (id, budgets_id, glacct_fy_id) values (%f, %f, %f)',
                [ABudgetsFYId, ABudgetId, Aglacct_fyId]);
    end;

//    Aglacct_fyId := SelectValueFmtAsFloat('select glacct_fy_id from BUDGETS_FY where id = %f', [ABudgetsFYId]);

//    AGLBudgetsId := SelectValueFmtAsFloat('select id from GLBUDGET where glacct_fy_id = %f and glperiods_id = %d and budgets_fy_id = %f',
//                              [Aglacct_fyId, APeriodId, ABudgetsFYId]);

    AGLBudgetsId := SelectValueFmtAsFloat('select id from GLBUDGET where glperiods_id = %d and budgets_fy_id = %f',
                              [APeriodId, ABudgetsFYId]);

    if (AGLBudgetsId = 0) and (Aglacct_fyId <> 0) and (APeriodId <> 0) then
    begin
      AGLBudgetsId := GetNextID('GLBUDGET');
      ExecuteCommandFmt('insert into GLBUDGET (id, glacct_fy_id, glperiods_id, budgets_fy_id) ' +
                'values (%f, %f, %d, %f)', [AGLBudgetsId, Aglacct_fyId, APeriodId, ABudgetsFYId]);
    end;
    if (AGLBudgetsId <> 0) then
      ExecuteCommandFmt('update GLBUDGET set BUDAMOUNT = %f where id = %f', [APeriodValue, AGLBudgetsId])
    else
      if FBadList.IndexOf(Format('Could not match info for Acct# %s', [Acct])) < 0 then
        FBadList.Add(Format('Could not match info for Acct# %s', [Acct]));
  except
    FStopProcessing := True;
    FBadList.Add(Format('General error for Acct# %s', [Acct]));
    Exit;
  end;
  if (ABudgetsFYId <> 0) then
  begin
    ATotal := SelectValueFmtAsFloat('select sum(BUDAMOUNT) from GLBUDGET where BUDGETS_FY_ID = %f', [ABudgetsFYId]);
    ExecuteCommandFmt('update BUDGETS_FY set YTDBUDGET = %f where id = %f', [ATotal, ABudgetsFYId]);
  end;
end;

function TFrmPrImport.GetAccountId(var Acct:string):Real;
var
  I:Integer;
  AAcct:String;
  AStr:String;
begin
  AAcct := '';
  for I := 0 to FAccountList.Count - 1 do
  begin
    if FDbf then
      AStr := tblDbf.FieldByName(FAccountList[I]).AsString
    else
      AStr := GetBudgetDelimitedFieldValue(Trunc(StrToFloat(FAccountList[I])));

    AAcct := AAcct + AStr;
  end;
  Acct := AAcct;
  Result := SelectValueFmtAsFloat('select id from glacct where acct = ''%s'' and misc.eplant_filter(eplant_id) = 1', [AAcct]);
  if Result = 0 then
   Result := StrToFloat(GetMatchValueBudget(AAcct));
end;

function TFrmPrImport.GetBudgetDelimitedFieldValue(ASeq:Integer):String;
begin
  Result := GetToken(FLine,
                     Chr(12),
                     ASeq);
  if FCharDel <> '' then
    Result := StrTran(Result, FCharDel, '');
end;

procedure TFrmPrImport.PopulateAccountList;
begin
  with TFDQuery.Create(self) do
  try
    ConnectionName := cnstFDConnectionName;
    Sql.Add(IqFormat('select seq from BUDGET_FIELDS_MATCH where PR_IMPORT_TABLES_ID = %f ' +
                     'and FIELD_TYPE = ''ACCOUNT'' order by ACCT_SEQ', [TblHeaderID.asFloat]));
    open;
    while not eof do
    begin
      FAccountList.Add(IntToStr(FieldByName('seq').asInteger));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmPrImport.PopulateAccountListDBF;
begin
  with TFDQuery.Create(self) do
  try
    ConnectionName := cnstFDConnectionName;
    Sql.Add(IqFormat('select field_name from BUDGET_FIELDS_MATCH where PR_IMPORT_TABLES_ID = %f ' +
                     'and FIELD_TYPE = ''ACCOUNT'' order by ACCT_SEQ', [TblHeaderID.asFloat]));
    open;
    while not eof do
    begin
      FAccountList.Add(FieldByName('field_name').asString);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmPrImport.PopulatePeriodListDBF;
var
  AId:Real;
  APeriod:Integer;
begin
  with TFDQuery.Create(self) do
  try
    ConnectionName := cnstFDConnectionName;
    Sql.Add(IqFormat('select id, GLPERIODS_ID, field_name from BUDGET_FIELDS_MATCH where PR_IMPORT_TABLES_ID = %f ' +
                     'and FIELD_TYPE = ''PERIOD''', [TblHeaderID.asFloat]));
    open;
    while not eof do
    begin
      AId := 0;
      if SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and id = %f',
                   [TblHeaderGLYEAR_ID.asFloat, FieldByName('GLPERIODS_ID').asFloat]) = 0 then
      begin
        APeriod := Trunc(SelectValueFmtAsFloat('select period from glperiods where id = %f', [FieldByName('GLPERIODS_ID').asFloat]));
        AId := SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and period = %d',
                         [TblHeaderGLYEAR_ID.asFloat, APeriod]);
        if AId = 0 then
          raise exception.create(Format('Please assign period %d to a corresponding period within the %s year',
                                        [FieldByName('field_name').asString, dbYear.Text]));

        ExecuteCommandFmt('update BUDGET_FIELDS_MATCH set glperiods_id = %f where id = %f',
                  [AId, FieldByName('id').asFloat]);
      end;
      if AId <> 0 then
        FPeriodList.Add(Format('%d,%s', [Trunc(AId), FieldByName('field_name').asString]))
      else
        FPeriodList.Add(Format('%d,%s', [FieldByName('GLPERIODS_ID').asInteger, FieldByName('field_name').asString]));
      Next;
    end;
  finally
    Free;
  end;
end;



procedure TFrmPrImport.PopulatePeriodList;
var
  AId:Real;
  APeriod:Integer;
begin
  with TFDQuery.Create(self) do
  try
    ConnectionName := cnstFDConnectionName;
    Sql.Add(IqFormat('select id, GLPERIODS_ID, seq from BUDGET_FIELDS_MATCH where PR_IMPORT_TABLES_ID = %f ' +
                     'and FIELD_TYPE = ''PERIOD''', [TblHeaderID.asFloat]));
    open;
    while not eof do
    begin
      AId := 0;
      if SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and id = %f',
                   [TblHeaderGLYEAR_ID.asFloat, FieldByName('GLPERIODS_ID').asFloat]) = 0 then
      begin
        APeriod := Trunc(SelectValueFmtAsFloat('select period from glperiods where id = %f', [FieldByName('GLPERIODS_ID').asFloat]));
        AId := SelectValueFmtAsFloat('select id from glperiods where glyear_id = %f and period = %d',
                         [TblHeaderGLYEAR_ID.asFloat, APeriod]);
        if AId = 0 then
          raise exception.create(Format('Please assign period %d to a corresponding period within the %s year',
                                        [FieldByName('seq').asInteger, dbYear.Text]));

        ExecuteCommandFmt('update BUDGET_FIELDS_MATCH set glperiods_id = %f where id = %f',
                  [AId, FieldByName('id').asFloat]);
      end;
      if AId <> 0 then
        FPeriodList.Add(Format('%d,%d', [Trunc(AId), FieldByName('seq').asInteger]))
      else
        FPeriodList.Add(Format('%d,%d', [FieldByName('GLPERIODS_ID').asInteger, FieldByName('seq').asInteger]));
      Next;
    end;
  finally
    Free;
  end;
end;

function TFrmPrImport.GetMatchValueBudget(AValue:String):String;
var
  i:Integer;
  APick :TIQWebHPick;
  ATable:TFDTable;
  AID:Real;
  ALiteral:String;
begin
  Result := AValue;
  ALiteral    := Result;
  AID :=  SelectValueFmtAsFloat('select lookup_value from iq_mapping where pr_import_tables_id = %f ' +
               'and user_value = ''%s'' and lookup_table = ''%s''',
               [tblHeader.FieldByName('ID').asFloat,
               Result,
               'GLACCT']);
  if AId = 0 then
  begin
    APick := PkAcct;
    APick.Title := Format('Please select GLAcct for the %s code', [Result]);
    with APick do
    if Execute then
    begin
      Result := GetValue('ID');
      ExecuteCommandFmt('insert into iq_mapping (pr_import_tables_id, lookup_table, lookup_value, user_value) ' +
                'values (%f, ''%s'', %f, ''%s'')',
                [tblHeader.FieldByName('ID').asFloat,
                 'GLACCT',
                 StrToFloat(Result),
                 ALiteral]);
    end;
  end
  else  Result := IntToStr(Trunc(AID));
end;

procedure TFrmPrImport.ClearPeriod1Click(Sender: TObject);
begin
  if not (TblBudgetFields.State in [dsEdit, dsInsert]) then
    TblBudgetFields.Edit;
    TblBudgetFieldsGLPERIODS_ID.Clear;
end;

procedure TFrmPrImport.EditMappingTable1Click(Sender: TObject);
begin
  DoEditMap(TblHeaderID.asFloat); {in EditMap.pas}
end;

procedure TFrmPrImport.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmPrImport.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmPrImport.PkImportExpBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AId', FExp_user_id);
//  TFDQuery(DataSet).ParamByName('AId').Value := FExp_user_id;
end;

procedure TFrmPrImport.TblHeaderNewRecord(DataSet: TDataSet);
begin
  if FExp_user_id <> 0 then
    TblHeaderEXP_USER_ID.asFloat := FExp_user_id;
end;


procedure TFrmPrImport.AssociateschemawithExpUser1Click(Sender: TObject);
var
  AId:Real;
begin
  with PKAssoc do
  if Execute then
  begin
    AId := GetValue('ID');
    ExecuteCommandFmt('update PR_IMPORT_TABLES set exp_user_id = %f where id = %f', [FExp_user_id, AId]);
    TblHeader.Close;
    TblHeader.Open;
    TblHeader.Locate('ID', AId, [])
  end
  else Abort;

end;

procedure TFrmPrImport.TblHeaderFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if FExp_user_id <> 0 then
    Accept := TblHeaderEXP_USER_ID.asFloat = FExp_user_id
  else
    Accept := TblHeaderEXP_USER_ID.asFloat = 0;
end;

procedure TFrmPrImport.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPrImport.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.


