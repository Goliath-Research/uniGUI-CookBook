unit CostHist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.DBGrids,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
//  Mask,
  IQMS.WebVcl.UDComboBox,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.DataConst,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  Vcl.DBCtrls, //TNavigateBtn
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
  uniDBNavigator, uniMainMenu, uniMultiItem, uniComboBox, uniDBComboBox,
  IQUniGrid, uniGUIFrame;

type
  TFrmCostHist = class(TUniForm)
    SrcHist_Elements_Distinct: TDataSource;
    QryHist_Elements_Distinct: TFDQuery;
    SrcHist_Elements: TDataSource;
    QryHist_Elements: TFDQuery;
    Splitter1: TUniSplitter;
    DBGrid2: TUniDBGrid;
    QryHist_Elements_DistinctARCHIVE_DATE: TDateTimeField;
    QryHist_ElementsELEM_TYPE: TStringField;
    QryHist_ElementsSTD_COST: TFMTBCDField;
    QryHist_ElementsELEM_DESCRIP: TStringField;
    QryHist_Elements_DistinctID: TBCDField;
    QryHist_Elements_DistinctCALC_DATE: TDateTimeField;
    QryHist_Elements_DistinctMFGNO: TStringField;
    QryHist_Elements_DistinctDESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Content1: TUniMenuItem;
    QryHist_Elements_DistinctTYPE: TStringField;
    DBGrid1: TIQUniGridControl;
    UpdateSQLHist_Arinvt_Elem_Calc: TFDUpdateSQL;
    IQUDComboBoxType: TIQWebUDComboBox;
    Bevel1: TUniPanel;
    QryHist_Elements_DistinctTotalCost: TFloatField;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryHist_Elements_DistinctBeforeOpen(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Content1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure ApplyUpdatesToTable(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryHist_Elements_DistinctCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
    class procedure DoShow(AArinvt_ID: Real );
  end;

var
  FrmCostHist: TFrmCostHist;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.NLS,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  IQMS.Common.HelpHook,
  IQMS.Common.Dialogs,
  inv_rscstr;

class procedure TFrmCostHist.DoShow( AArinvt_ID: Real );
var
  frm: TFrmCostHist;
begin
  frm := TFrmCostHist.Create(uniGUIApplication.UniApplication);
  frm.FArinvt_ID := AArinvt_ID;
  frm.ShowModal;
end;

procedure TFrmCostHist.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, DBGrid1, DBGrid2 ]);
  Caption:= IQFormat(inv_rscstr.cTXT0000030 {'Archived Cost Elements for %s'}, [ SelectValueFmtAsString('select class || '' '' || RTrim(itemno) || '' '' || Rtrim(rev) from arinvt where id = %f', [ FArinvt_ID ]) ]);

  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmCostHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, DBGrid1, DBGrid2 ]);
end;

procedure TFrmCostHist.QryHist_Elements_DistinctBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('arinvt_id').Value := FArinvt_ID;
end;

procedure TFrmCostHist.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCostHist.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmCostHist.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmCostHist.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCostHist.Content1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmCostHist.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT {CHM}, iqhtmCosting6 {HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCostHist.AbortOnInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmCostHist.ApplyUpdatesToTable(DataSet: TDataSet);
begin
  try
    (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection).ApplyUpdates([ TFDQuery( DataSet )]);
//    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;
end;

procedure TFrmCostHist.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;

procedure TFrmCostHist.QryHist_Elements_DistinctCalcFields(DataSet: TDataSet);
begin
  QryHist_Elements_DistinctTotalCost.asFloat := SelectValueFmtAsFloat('select sum(std_cost) from hist_arinvt_elements where hist_arinvt_elem_calc_id = %f', [QryHist_Elements_DistinctID.asFloat]);
end;

procedure TFrmCostHist.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

end.
