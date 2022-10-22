unit SalesPiv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.ExcelTbl,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmSalesPivot = class(TUniForm)
    QryAllSales: TFDQuery;
    QryCurrentSales: TFDQuery;
    PivotTable1: TIQWebPivotTable;
    QryAllSalesORDERNO: TStringField;
    QryAllSalesORD_DATE_TAKEN: TDateTimeField;
    QryAllSalesITEMNO: TStringField;
    QryAllSalesDESCRIP: TStringField;
    QryAllSalesREL_QUAN: TBCDField;
    QryAllSalesREL_REQUEST_DATE: TDateTimeField;
    QryAllSalesREL_PROMISE_DATE: TDateTimeField;
    QryAllSalesUNIT_PRICE: TFMTBCDField;
    QryAllSalesCUSTNO: TStringField;
    QryAllSalesCOMPANY: TStringField;
    QryAllSalesEXTENDED_PRICE: TFMTBCDField;
    QryAllSalesORDER_TYPE: TStringField;
    QryCurrentSalesORDERNO: TStringField;
    QryCurrentSalesORD_DATE_TAKEN: TDateTimeField;
    QryCurrentSalesITEMNO: TStringField;
    QryCurrentSalesDESCRIP: TStringField;
    QryCurrentSalesREL_QUAN: TBCDField;
    QryCurrentSalesREL_REQUEST_DATE: TDateTimeField;
    QryCurrentSalesREL_PROMISE_DATE: TDateTimeField;
    QryCurrentSalesUNIT_PRICE: TFMTBCDField;
    QryCurrentSalesCUSTNO: TStringField;
    QryCurrentSalesCOMPANY: TStringField;
    QryCurrentSalesEXTENDED_PRICE: TFMTBCDField;
    QryCurrentSalesORDER_TYPE: TStringField;
    SR: TIQWebSecurityRegister;
    QryAllSalesEPLANT_ID: TBCDField;
    QryCurrentSalesEPLANT_ID: TBCDField;
    IQAbout1: TIQWebAbout;
    PopupMenu1: TUniPopupMenu;
    About1: TUniMenuItem;
    QryCurrentSalesFX_RATE: TFMTBCDField;
    QryAllSalesFX_RATE: TFMTBCDField;
    QryCurrentSalesUNIT: TStringField;
    QryCurrentSalesCLASS: TStringField;
    QryCurrentSalesTERRITORY: TStringField;
    QryCurrentSalesINDUSTRY: TStringField;
    QryCurrentSalesPROD_CODE: TStringField;
    QryCurrentSalesWEEK: TFMTBCDField;
    QryCurrentSalesCURR_CODE: TStringField;
    QryCurrentSalesSALESPERSON: TStringField;
    QryCurrentSalesFORECAST: TStringField;
    QryCurrentSalesSHIP_DATE: TDateTimeField;
    QryAllSalesUNIT: TStringField;
    QryAllSalesCLASS: TStringField;
    QryAllSalesTERRITORY: TStringField;
    QryAllSalesINDUSTRY: TStringField;
    QryAllSalesPROD_CODE: TStringField;
    QryAllSalesWEEK: TFMTBCDField;
    QryAllSalesCURR_CODE: TStringField;
    QryAllSalesSALESPERSON: TStringField;
    QryAllSalesFORECAST: TStringField;
    QryAllSalesSHIP_DATE: TDateTimeField;
    QryCurrentSalesPERIOD: TFMTBCDField;
    QryAllSalesPERIOD: TFMTBCDField;
    QryCurrentSalesDESCRIP2: TStringField;
    QryAllSalesDESCRIP2: TStringField;
    SaveDialog1: TSaveDialog;
    Panel1: TUniPanel;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    Label2: TUniLabel;
    DateTimePicker2: TUniDateTimePicker;
    Label3: TUniLabel;
    wwDBComboDlgFileName: TUniEdit;
    GroupBox2: TUniGroupBox;
    Bevel1: TUniPanel;
    rbtnDefault: TUniRadioButton;
    rbtnUserDefined: TUniRadioButton;
    CheckBox1: TUniCheckBox;
    wwDBComboDlgUserDefinedQuery: TUniEdit;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    popmUserDefinedQuery: TUniPopupMenu;
    SelectUserDefinedQuery1: TUniMenuItem;
    N1: TUniMenuItem;
    EditUserDefinedQuery1: TUniMenuItem;
    PkUD_QUery: TIQWebHPick;
    PkUD_QUeryNAME: TStringField;
    PkUD_QUeryDESCRIP: TStringField;
    PkUD_QUeryID: TBCDField;
    QryUD: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QryAllSalesBeforeOpen(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure wwDBComboDlgFileNameCustomDlg(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EnableComponents(Sender: TObject);
    procedure EditUserDefinedQuery1Click(Sender: TObject);
    procedure wwDBComboDlgUserDefinedQueryCustomDlg(Sender: TObject);
    procedure SelectUserDefinedQuery1Click(Sender: TObject);
    procedure wwDBComboDlgUserDefinedQueryKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FUD_Query_ID: Real;
    function FormatTitle( ATitle: string ): string;
    procedure PrepareDefaultSalesAnalysis;
    procedure PrepareUserDefinedSalesAnalysis;
    procedure SetFUD_Query_ID(const Value: Real);

    property UD_Query_ID: Real read FUD_Query_ID write SetFUD_Query_ID;
  public
    { Public declarations }
  end;

procedure DoSalesAnalysisViaPivotTable;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : Depends on ud_query_sales_analysis
  ud_query_sales_analysis; }

procedure DoSalesAnalysisViaPivotTable;
begin
  TFrmSalesPivot.Create(uniGUIApplication.UniApplication).Show;
end;

procedure TFrmSalesPivot.FormCreate(Sender: TObject);
var
  ADate: TDateTime;
  S    : string;
  B    : Boolean;
begin
  wwDBComboDlgUserDefinedQuery.Text:= '';

  if IQRegDateTimeScalarRead( self, 'DateTimePicker1', ADate ) then
     DateTimePicker1.DateTime := ADate
  else
     DateTimePicker1.DateTime:= Date;

  if IQRegDateTimeScalarRead( self, 'DateTimePicker2', ADate ) then
     DateTimePicker2.DateTime:= ADate
  else
     DateTimePicker2.DateTime:= Date;

  IQRegFormRead( self, [ CheckBox1 ]);

  if IQRegStringScalarRead( self, 'TempWorkArea', S ) then
     wwDBComboDlgFileName.Text:= S;
  if Trim(wwDBComboDlgFileName.Text) = '' then
     wwDBComboDlgFileName.Text:= 'c:\temp.txt';

  if IQRegBooleanScalarRead( self, 'UserDefinedQuery', B ) and B then
     rbtnUserDefined.Checked:= TRUE;
  EnableComponents(nil);
end;


procedure TFrmSalesPivot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ CheckBox1 ]);
  IQRegDateTimeScalarWrite( self, 'DateTimePicker1',  DateTimePicker1.DateTime );
  IQRegDateTimeScalarWrite( self, 'DateTimePicker2',  DateTimePicker2.DateTime );
  IQRegStringScalarWrite  ( self, 'TempWorkArea',     wwDBComboDlgFileName.Text );
  IQRegBooleanScalarWrite ( self, 'UserDefinedQuery', rbtnUserDefined.Checked );
end;


procedure TFrmSalesPivot.EnableComponents(Sender: TObject);
begin
  IQEnableControl( CheckBox1, rbtnDefault.Checked );
  IQEnableControl( wwDBComboDlgUserDefinedQuery, rbtnUserDefined.Checked );
end;

function TFrmSalesPivot.FormatTitle( ATitle: string ): string;
begin
  Result:= Format('%s %s - %s', [ ATitle,
                                  FormatDateTime('mm/dd/yyyy', DateTimePicker1.DateTime),
                                  FormatDateTime('mm/dd/yyyy', DateTimePicker2.DateTime)]);
end;

procedure TFrmSalesPivot.btnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmSalesPivot.QryAllSalesBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    if Params.FindParam('date1') <> nil then
       ParamByName('date1').asDateTime:= Trunc(DateTimePicker1.DateTime);
    if Params.FindParam('date2') <> nil then
       ParamByName('date2').asDateTime:= Trunc(DateTimePicker2.DateTime +1) - 1/86400;
  end;
  IQAssignEPlantFilter(DataSet);
end;

procedure TFrmSalesPivot.SelectUserDefinedQuery1Click(Sender: TObject);
begin
  with PkUD_Query do
    if Execute then
       UD_Query_ID:= GetValue('ID');
end;

procedure TFrmSalesPivot.SetFUD_Query_ID(const Value: Real);
begin
  FUD_Query_ID:= Value;
  wwDBComboDlgUserDefinedQuery.Text:= SelectValueByID('name', 'ud_query', FUD_Query_ID);
end;

procedure TFrmSalesPivot.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmSalesPivot.wwDBComboDlgFileNameCustomDlg(Sender: TObject);
begin
  with SaveDialog1 do
  begin
    if InitialDir = '' then
       InitialDir:= ExtractFilePath( wwDBComboDlgFileName.Text );
    if Execute then
       wwDBComboDlgFileName.Text:= FileName;
  end;
end;

procedure TFrmSalesPivot.wwDBComboDlgUserDefinedQueryCustomDlg(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Control is converted into TUniEdit so this functionality needs to be implemented
  IQMS.Common.Controls.PopupMenuFor( wwDBComboDlgUserDefinedQuery.Button, popmUserDefinedQuery ); }
end;

procedure TFrmSalesPivot.wwDBComboDlgUserDefinedQueryKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    UD_Query_ID:= 0;
    Key:= 0;
  end;
end;

procedure TFrmSalesPivot.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmSalesPivot.btnOKClick(Sender: TObject);
begin
  // validate
  if DateTimePicker1.DateTime > DateTimePicker2.DateTime then
     raise Exception.Create( 'Invalid date scope - please reenter');

  if rbtnUserDefined.Checked then
     IQAssert( (wwDBComboDlgUserDefinedQuery.Text > '') and (UD_Query_ID > 0), 'Unspecified User Defined Query - operation aborted.');

  if wwDBComboDlgFileName.Text = '' then
     wwDBComboDlgFileName.Text:= 'c:\temp.txt';
  IQAssert( DirectoryExists( ExtractFilePath( wwDBComboDlgFileName.Text)), 'Invalid Temporary Working Area path - unable to continue' );

  // work file
  PivotTable1.ExportFileName:= wwDBComboDlgFileName.Text;

  // assign query
  if rbtnDefault.Checked then
     PrepareDefaultSalesAnalysis
  else
     PrepareUserDefinedSalesAnalysis;

  // finally!
  PivotTable1.Execute;
end;


procedure TFrmSalesPivot.PrepareDefaultSalesAnalysis;
begin
  if CheckBox1.Checked then
  begin
    PivotTable1.ReportTitle:= FormatTitle( 'All Sales Orders Analysis' );
    PivotTable1.DataSet:= QryAllSales;
  end
  else
  begin
    PivotTable1.ReportTitle:= FormatTitle( 'Current Sales Orders Analysis' );
    PivotTable1.DataSet:= QryCurrentSales;
  end;
end;


procedure TFrmSalesPivot.PrepareUserDefinedSalesAnalysis;
var
  I: Integer;
begin
  // clear
  QryUD.Close;
  while QryUD.FieldCount > 0 do QryUD.Fields[ 0 ].Free;

  { TODO -oathite -cWebConvert : Depends on ud_query_sales_analysis
  // load sql
  TFrmUD_QuerySalesAnalysis.LoadSQL( FUD_Query_ID, QryUD.SQL ); }

  // date params
  if QryUD.Params.FindParam('date1') <> nil then
     QryUD.ParamByName('date1').DataType:= ftDateTime;

  if QryUD.Params.FindParam('date2') <> nil then
     QryUD.ParamByName('date2').DataType:= ftDateTime;

  // create fields
  QryUD.FieldDefs.Update;
  for I:= 0 to QryUD.FieldDefs.Count - 1 do
    QryUD.FieldDefs[ I ].CreateField( QryUD );

  // pivot table
  PivotTable1.ReportTitle:= SelectValueByID( 'descrip', 'ud_query', UD_Query_ID );
  PivotTable1.DataSet:= QryUD;
end;


procedure TFrmSalesPivot.EditUserDefinedQuery1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on ud_query_sales_analysis
  TFrmUD_QuerySalesAnalysis.DoShow(self, 'PIVOT SALES ANALYSIS');  // ud_query_sales_analysis.pas  }
end;

end.
