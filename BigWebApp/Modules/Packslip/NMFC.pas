unit NMFC;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBGrids,
  Data.DB,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
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
  TFrmNMFC = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    PageControl1: TUniPageControl;
    Splitter1: TUniSplitter;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    PnlToolbarStandard: TUniPanel;
    DBNavigator2: TUniDBNavigator;
    PnlToolbarBumped: TUniPanel;
    DBNavigator3: TUniDBNavigator;
    gridSTD: TUniDBGrid;
    gridBump: TUniDBGrid;
    SrcNMFC: TDataSource;
    TblNMFC: TFDTable;
    SrcNMFCClass: TDataSource;
    TblNMFCClass: TFDTable;
    pnlNMFC: TUniPanel;
    SrcNMFCBump: TDataSource;
    TblNMFCBump: TFDTable;
    gridNMFC: TUniDBGrid;
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
    TblNMFCID: TBCDField;
    TblNMFCCODE: TStringField;
    TblNMFCDESCRIP: TStringField;
    TblNMFCClassID: TBCDField;
    TblNMFCClassNMFC_ID: TBCDField;
    TblNMFCClassLBS_CU_FT: TFMTBCDField;
    TblNMFCClassCLASS: TBCDField;
    TblNMFCClassDESCRIP: TStringField;
    TblNMFCBumpID: TBCDField;
    TblNMFCBumpNMFC_ID: TBCDField;
    TblNMFCBumpLBS_CU_FT_FROM: TFMTBCDField;
    TblNMFCBumpLBS_CU_FT_TO: TFMTBCDField;
    TblNMFCBumpBUMPED_LBS_CU_FT: TFMTBCDField;
    TblNMFCBumpBUMPED_CLASS: TBCDField;
    TblNMFCBumpDESCRIP: TStringField;
    Contents1: TUniMenuItem;
    TblNMFCClassSUBCODE: TStringField;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Print1Click(Sender: TObject);
    procedure SetupPrinter1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TblNMFCBeforePost(DataSet: TDataSet);
    procedure TblNMFCClassBeforeEdit(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure TblNMFCBumpAfterPost(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoNMFC;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure DoNMFC;
var
  LFrmNMFC : TFrmNMFC;
begin
  LFrmNMFC := TFrmNMFC.Create(UniGUIApplication.UniApplication);
  LFrmNMFC.Show;
end;

procedure TFrmNMFC.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmNMFC.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, pnlNMFC, gridNMFC, gridSTD, gridBump]);
end;

procedure TFrmNMFC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlNMFC, gridNMFC, gridSTD, gridBump]);
end;

procedure TFrmNMFC.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmNMFC.SetupPrinter1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmNMFC.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmNMFC.TblNMFCBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmNMFC.TblNMFCClassBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet);
end;

procedure TFrmNMFC.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmNMFC.TblNMFCBumpAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TFrmNMFC.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext);
end;

procedure TFrmNMFC.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG{CHM}, iqhtmSHIP{HTM} ); {IQMS.Common.HelpHook.pas}
end;

end.
