unit Analysis;

interface

Uses
  Winapi.Windows, 
  System.SysUtils, 
  System.Classes, 
  Vcl.Forms, 
  Data.DB, 
  Vcl.DBGrids, 
  Vcl.Menus, 
  IQMS.WebVcl.About, 
  Vcl.Wwdbigrd, 
  Vcl.Wwdbgrid, 
  FireDAC.Comp.Client, 
  FireDAC.Comp.DataSet, 
  FireDAC.Phys, 
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
  uniSplitter, 
  uniPanel, 
  uniMainMenu, 
  uniGUITypes, 
  uniGUIAbstractClasses, 
  uniGUIForm, 
  uniGUIApplication, 
  uniDBNavigator, 
  uniBasicGrid, 
  uniDBGrid, IQUniGrid, uniGUIFrame;

type
  TFrmAnalysis = class(TUniForm)
    Panel2: TUniPanel;
    Splitter2: TUniSplitter;
    gridRates: TUniDBGrid;
    pnlElements: TUniPanel;
    gridElements: TUniDBGrid;
    Splitter1: TUniSplitter;
    pnlModules: TUniPanel;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    SrcAnalysis: TDataSource;
    SrcAnalysis_Dtl: TDataSource;
    SrcAnalysis_Rate: TDataSource;
    TblAnalysis: TFDTable;
    TblAnalysis_Dtl: TFDTable;
    TblAnalysis_Rate: TFDTable;
    TblAnalysisID: TBCDField;
    TblAnalysisMODULE: TStringField;
    TblAnalysis_DtlID: TBCDField;
    TblAnalysis_DtlANALYSIS_ID: TBCDField;
    TblAnalysis_DtlELEMENT: TStringField;
    TblAnalysis_DtlWEIGHT: TBCDField;
    TblAnalysis_RateANALYSIS_DTL_ID: TBCDField;
    TblAnalysis_RateFROM_VAL: TBCDField;
    TblAnalysis_RateTO_VAL: TBCDField;
    TblAnalysis_RateRATE: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Defaults1: TUniMenuItem;
    VendorModule1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    TblAnalysis_RateID: TBCDField;
    gridModules: TIQUniGridControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblAnalysisMODULESetText(Sender: TField; const Text: String);
    procedure TblAnalysisBeforePost(DataSet: TDataSet);
    procedure TblAnalysis_DtlBeforeInsert(DataSet: TDataSet);
    procedure SetNavDataSource(Sender: TObject);
    procedure TblAnalysisBeforeScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure VendorModule1Click(Sender: TObject);
    procedure TblAnalysisBeforeDelete(DataSet: TDataSet);
    procedure TblAnalysisAfterDelete(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure TblAnalysis_RateBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    CheckBeforeScroll:Boolean;
    procedure DeleteAnalysis( const ModuleName: string );
    function  AddAnalysis( const ModuleName: string ):Real;
    function  AddAnalysisDtl( AnalysID: Real; const AElement:string; AWeight:Real):Real;
    procedure AddAnalysisRate( Element_ID:Real;  AFrom, ATo, ARate:Real );
  public
    { Public declarations }
  end;

procedure DoSetupPerformanceAnaysis;

var
  FrmAnalysis: TFrmAnalysis;

implementation

{$R *.DFM}

uses
  analysis_rscstr,
//  iqhelphk,
  iqmesg,

  IQMS.Common.DataLib,
  iqregfrm;

procedure DoSetupPerformanceAnaysis;
begin
  TFrmAnalysis.Create(Application).Show;
end;

procedure TFrmAnalysis.FormCreate(Sender: TObject);
begin
  CheckBeforeScroll:= TRUE;
  IQRegFormRead( self, [ self, pnlModules, pnlElements, gridModules, gridElements, gridRates ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmAnalysis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlModules, pnlElements, gridModules, gridElements, gridRates ]);
  Action:= caFree;
end;

procedure TFrmAnalysis.TblAnalysisMODULESetText(Sender: TField;
  const Text: String);
begin
  Sender.asString:= UpperCase( Text );
end;

procedure TFrmAnalysis.TblAnalysisBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmAnalysis.TblAnalysis_DtlBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet );
end;

procedure TFrmAnalysis.SetNavDataSource(Sender: TObject);
begin
  with Sender as TUniDBGrid do
    NavMain.DataSource:= DataSource;
end;

procedure TFrmAnalysis.TblAnalysisBeforeScroll(DataSet: TDataSet);
var
  A: Real;
begin
  if CheckBeforeScroll and not (TblAnalysis.Eof and TblAnalysis.Eof) and (TblAnalysisID.asFloat <> 0) then
  begin
     A:= SelectValueFmtAsFloat('select sum(NVL(weight,0)) from analysis_dtl where analysis_id = %f', [ TblAnalysisID.asFloat]);
     if A <> 100 then
        // 'The total weight (%s) must equal 100.'
        raise Exception.CreateFmt(analysis_rscstr.cTXT0000002, [ FloatToStr(A)]);
  end;
end;

procedure TFrmAnalysis.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  TblAnalysisBeforeScroll(TblAnalysis);
end;

procedure TFrmAnalysis.VendorModule1Click(Sender: TObject);
var
  Vendor_ID : Real;
  Element_ID: Real;
begin
  // 'Delete the existing module, and create a default vendor performance analysis setup?'
  if IQWarningYN(analysis_rscstr.cTXT0000003) then
  try
     db_dm.FDConnection.starttransaction;

//     TblAnalysis.DataBase.StartTransaction;

     DeleteAnalysis('VENDOR');
     Vendor_ID := AddAnalysis('VENDOR');

     Element_ID:= AddAnalysisDtl( Vendor_ID, 'DELIVERY', 25 );
     AddAnalysisRate( Element_ID, 0, 0, 100 );

     Element_ID:= AddAnalysisDtl( Vendor_ID, 'QUALITY', 25 );
     AddAnalysisRate( Element_ID, 0, 0, 100 );

     Element_ID:= AddAnalysisDtl( Vendor_ID, 'QTY', 25 );
     AddAnalysisRate( Element_ID, 0, 0, 100 );

     Element_ID:= AddAnalysisDtl( Vendor_ID, 'PRICE', 25 );
     AddAnalysisRate( Element_ID, 0, 0, 100 );

//     TblAnalysis.DataBase.Commit;
     db_dm.FDConnection.commit;
  except
//     TblAnalysis.DataBase.RollBack;
     db_dm.FDConnection.Rollback;
     raise;
  end
end;

procedure TFrmAnalysis.DeleteAnalysis( const ModuleName: string );
begin
  with TblAnalysis do
  try
    CheckBeforeScroll:= FALSE;
    if Locate('MODULE', ModuleName, []) then
      Delete;
  finally
    CheckBeforeScroll:= TRUE;
  end;
end;

function TFrmAnalysis.AddAnalysis( const ModuleName: string ):Real;
begin
  with TblAnalysis do
  try
    DisableControls;
    Append;
    FieldByName('MODULE').asString:= ModuleName;
    Post;
    Result:= FieldByName('ID').asFloat;
  finally
    EnableControls;
  end;
end;

function TFrmAnalysis.AddAnalysisDtl( AnalysID: Real; const AElement:string; AWeight:Real):Real;
begin
  with TblAnalysis_Dtl do
  try
    DisableControls;
    Append;
    FieldByName('ANALYSIS_ID').asFloat:= AnalysID;
    FieldByName('ELEMENT').asString    := AElement;
    FieldByName('WEIGHT').asFloat     := AWeight;
    Post;
    Result:= FieldByName('ID').asFloat;
  finally
    EnableControls;
  end;
end;

procedure TFrmAnalysis.AddAnalysisRate( Element_ID:Real;  AFrom, ATo, ARate:Real );
begin
  with TblAnalysis_Rate do
  try
    DisableControls;
    Append;
    FieldByName('ANALYSIS_DTL_ID').asFloat:= Element_ID;
    FieldByName('FROM_VAL').asFloat       := AFrom;
    FieldByName('TO_VAL').asFloat         := ATo;
    FieldByName('RATE').asFloat           := ARate;
    Post;
  finally
    EnableControls;
  end;
end;


procedure TFrmAnalysis.TblAnalysisBeforeDelete(DataSet: TDataSet);
begin
  CheckBeforeScroll:= FALSE;
end;

procedure TFrmAnalysis.TblAnalysisAfterDelete(DataSet: TDataSet);
begin
    CheckBeforeScroll:= TRUE;
end;

procedure TFrmAnalysis.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAnalysis.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAnalysis.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQHelpHk.pas}
end;

procedure TFrmAnalysis.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1101892 );
end;

procedure TFrmAnalysis.TblAnalysis_RateBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

end.
