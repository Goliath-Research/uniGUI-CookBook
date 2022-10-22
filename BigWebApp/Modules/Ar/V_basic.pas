unit V_Basic;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBGrids,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.Documents,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniPageControl, uniMainMenu;

type
  TFrmViewBasic = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    All1: TUniMenuItem;
    ByCustomer1: TUniMenuItem;
    ByPeriod1: TUniMenuItem;
    Original1: TUniMenuItem;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    N2: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    SrcQryDetail: TDataSource;
    QryDetail: TFDQuery;
    SrcQryHeader: TDataSource;
    QryHeader: TFDQuery;
    IQRepDef1: TIQWebRepDef;
    PC: TUniPageControl;
    TabDoc: TUniTabSheet;
    TabMain: TUniTabSheet;
    Panel2: TUniPanel;
    NavDetail: TUniDBNavigator;
    Panel1: TUniPanel;
    SBToggle: TUniSpeedButton;
    SBSearch: TUniSpeedButton;
    SBCustomer: TUniSpeedButton;
    SBPeriod: TUniSpeedButton;
    SBAll: TUniSpeedButton;
    SBOriginal: TUniSpeedButton;
    NavHeader: TUniDBNavigator;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    GridDetail: TUniDBGrid;
    PageControl1: TUniPageControl;
    TabGrid: TUniTabSheet;
    GridHeader: TUniDBGrid;
    TabForm: TUniTabSheet;
    PageControl3: TUniPageControl;
    TabSheet6: TUniTabSheet;
    TabSheet7: TUniTabSheet;
    Bevel2: TUniPanel;
    procedure SBToggleClick(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBCustomerClick(Sender: TObject);virtual;
    procedure SBAllClick(Sender: TObject);virtual;
    procedure SBPeriodClick(Sender: TObject);virtual;
    procedure SBOriginalClick(Sender: TObject);virtual;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  protected
    procedure ExecuteAllSearch;virtual;abstract;
    procedure ExecutePeriodSearch;virtual;abstract;
    procedure ExecuteCustomerSearch;virtual;abstract;
  private
    { Private declarations }
  public
    { Public declarations }
    GlBatchId_Id:Real;
    FHeaderId:Real;
    nArcustoId:Real;
    nGlPeriodId:Real;
    PrevButtonClicked :TUniSpeedButton;
  end;

{var
  FrmViewBasic: TFrmViewBasic;}

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm
  { TODO -oSanketG -cWebConvert : Needt to revisit }
  //IQSecIns
  ;

procedure TFrmViewBasic.SBToggleClick(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridHeader.DataSource:= NIL;
    PageControl1.ActivePage := TabForm;
  end
  else
  begin
    GridHeader.DataSource  := SrcQryHeader;
    PageControl1.ActivePage := TabGrid;
  end;

end;

procedure TFrmViewBasic.UniFormCreate(Sender: TObject);
begin
  PC.ActivePage := TabMain;
end;

procedure TFrmViewBasic.SBSearchClick(Sender: TObject);
begin
  if (PrevButtonClicked = SBOriginal) or (PrevButtonClicked = SBAll) then ExecuteAllSearch
  else if PrevButtonClicked = SBCustomer then ExecuteCustomerSearch
  else if PrevButtonClicked = SBPeriod then ExecutePeriodSearch;
end;

procedure TFrmViewBasic.Exit1Click(Sender: TObject);
begin
  Close;
end;


procedure TFrmViewBasic.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmViewBasic.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmViewBasic.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmViewBasic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //IQSetTablesActive( FALSE, self );
  IQRegFormWrite( self, [ self, GridDetail, PageControl1 ]);
end;


procedure TFrmViewBasic.SBCustomerClick(Sender: TObject);
begin
//
end;

procedure TFrmViewBasic.SBAllClick(Sender: TObject);
begin
//
end;

procedure TFrmViewBasic.SBPeriodClick(Sender: TObject);
begin
//
end;

procedure TFrmViewBasic.SBOriginalClick(Sender: TObject);
begin
//
end;

procedure TFrmViewBasic.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Needt to revisit, dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmViewBasic.FormDestroy(Sender: TObject);
begin
  Application.OnShowHint:= NIL;
end;

end.

