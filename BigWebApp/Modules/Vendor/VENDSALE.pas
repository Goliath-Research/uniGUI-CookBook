unit VENDSALE;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
//  Vcl.DBGrids,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
//  Mask,
  VclTee.TeeGDIPlus,
  VclTee.TeEngine,
  VclTee.Series,
  VclTee.TeeProcs,
  VclTee.Chart,
  VclTee.DBChart,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, Vcl.Controls, Vcl.ExtCtrls,
  uniComboBox, uniDBComboBox;

type
  TFrmVendSalesAnalysis = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    GridPeriod: TUniDBGrid;
    PnlDetailToolbar: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    SrcV_APINVOICE_VEND_PERIOD_YTD: TDataSource;
    QryV_APInvoice_Vend_Period_Ytd: TFDQuery;
    DBChart1: TDBChart;
    Series1: TAreaSeries;
    Splitter1: TUniSplitter;
    GridDetail: TUniDBGrid;
    PnlYearToolbar: TUniPanel;
    DBNavigator2: TUniDBNavigator;
    SrcPeriodDtl: TDataSource;
    QryPeriodDtl: TFDQuery;
    QryV_APInvoice_Vend_Period_YtdPERIOD: TBCDField;
    QryV_APInvoice_Vend_Period_YtdSTART_DATE: TDateTimeField;
    QryV_APInvoice_Vend_Period_YtdEND_DATE: TDateTimeField;
    QryV_APInvoice_Vend_Period_YtdTOTAL: TFMTBCDField;
    QryV_APInvoice_Vend_Period_YtdYTD: TFMTBCDField;
    QryV_APInvoice_Vend_Period_YtdGLPERIODS_ID_AP: TBCDField;
    QryV_APInvoice_Vend_Period_YtdVENDOR_ID: TBCDField;
    QryPeriodDtlITEMNO: TStringField;
    QryPeriodDtlDESCRIPTION: TStringField;
    QryPeriodDtlINVOICE_QTY: TBCDField;
    QryPeriodDtlTOTAL: TFMTBCDField;
    QryPeriodDtlAMOUNT_DISTRIBUTED: TBCDField;
    wwQryGLYear: TFDQuery;
    wwQryGLYearID: TBCDField;
    wwQryGLYearDESCRIP: TStringField;
    wwQryGLYearSTART_DATE: TDateTimeField;
    wwQryGLYearEND_DATE: TDateTimeField;
    wwComboGLYear: TUniDBLookupComboBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    SetupPrinter1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Contents1: TUniMenuItem;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edTotalInv: TUniDBEdit;
    edAvrg: TUniDBEdit;
    SrcAvrg: TDataSource;
    QryAvrg: TFDQuery;
    QryAvrgAVERAGE: TFMTBCDField;
    QryAvrgDIFFERENCE: TFMTBCDField;
    QryAvrgNO_OF_INVOICES: TFMTBCDField;
    QryAvrgVENDOR_ID: TBCDField;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    QryPeriodDtlDESCRIP2: TStringField;
    SR: TIQWebSecurityRegister;
    ds_GLYear: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwComboGLYearCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure SetupPrinter1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FApvendor_ID: Real;
    procedure ReOpenQuery;
    procedure SetApvendor_ID(const Value:Real);
    function GetApvendor_ID: Real;
  public
    { Public declarations }
    property Apvendor_ID: Real read GetApvendor_ID write SetApvendor_ID;
  end;

procedure DoVendSalesAnalysis(AApvendor_ID: Real);


implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oLema : Dependent on IQSecIns }
//  iqsecins,
  vendor_rscstr;

procedure DoVendSalesAnalysis(AApvendor_ID: Real);
var
  frm : TFrmVendSalesAnalysis;
begin
  frm := TFrmVendSalesAnalysis.Create(uniGUIApplication.UniApplication);
  frm.Apvendor_ID := AApvendor_ID;
  frm.ShowModal;
end;

procedure TFrmVendSalesAnalysis.UniFormCreate(Sender: TObject);
begin
  //vendor_rscstr.cTXT0000023 =
  //'Accessing Current Year Vendor Sales Analysis.  Please wait...';
  IQSetTablesActiveEx(TRUE, self, vendor_rscstr.cTXT0000023);

{ TODO -oLema : Need to find alternative for LookupValue }
//  wwComboGLYear.LookupValue := SelectValueAsString(
//    'select glyear.descrip from glyear, iqsys where glyear.id = iqsys.glyear_id');
//  wwQryGLYear.Locate('DESCRIP', wwComboGLYear.LookupValue, []);

  ReOpenQuery;

  CheckVistaMove([edTotalInv, edAvrg]);

end;


procedure TFrmVendSalesAnalysis.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, GridPeriod, GridDetail]);
//  iqsecins.EnsureSecurityInspectorOnTopOf(self);
end;


procedure TFrmVendSalesAnalysis.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmACCT{CHM}, iqhtmAP{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmVendSalesAnalysis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, GridPeriod, GridDetail]);
end;

procedure TFrmVendSalesAnalysis.ReOpenQuery;
begin
  with QryV_APInvoice_Vend_Period_Ytd do
  begin
    Close;
    ParamByName('vendor_id').Value := FApvendor_ID;
    ParamByName('glyear_id').Value := wwQryGLYearID.AsLargeInt;
    Open;
  end;
  with QryAvrg do
  begin
    Close;
    ParamByName('vendor_id').Value := FApvendor_ID;
    Open;
  end;
end;

procedure TFrmVendSalesAnalysis.wwComboGLYearCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  ReOpenQuery;
end;

procedure TFrmVendSalesAnalysis.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendSalesAnalysis.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

function TFrmVendSalesAnalysis.GetApvendor_ID: Real;
begin
  result := FApvendor_ID;
end;

procedure TFrmVendSalesAnalysis.SetApvendor_ID(const Value: Real);
begin
  FApvendor_ID := Value;
end;

procedure TFrmVendSalesAnalysis.SetupPrinter1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;


procedure TFrmVendSalesAnalysis.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmVendSalesAnalysis.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext);
end;

end.
