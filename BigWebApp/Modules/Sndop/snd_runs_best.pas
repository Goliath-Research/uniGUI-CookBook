unit snd_runs_best;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.About,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.DBChart,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniComboBox, uniDBComboBox,
  IQUniGrid, uniGUIFrame, Vcl.Controls, Vcl.ExtCtrls;

type
  TFrmSndRunsBest = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    IQSearch1: TIQUniGridControl;
    Panel4: TUniPanel;
    btnLog: TUniButton;
    SrcRunsBest: TDataSource;
    QryRunsBest: TFDQuery;
    QryRunsBestSEQ: TBCDField;
    QryRunsBestEQNO_CALC: TStringField;
    QryRunsBestCNTR_DESC_CALC: TStringField;
    QryRunsBestCNTR_TYPE: TStringField;
    QryRunsBestPERFORMANCE: TBCDField;
    QryRunsBestEQNO_ACT: TStringField;
    QryRunsBestCNTR_DESC_ACT: TStringField;
    QryRunsBestCOMMENT1: TStringField;
    QryRunsBestID: TBCDField;
    QryRunsBestWORK_CENTER_ID_CALC: TBCDField;
    QryRunsBestWORK_CENTER_ID_ACT: TBCDField;
    QryRunsBestSNDOP_ID: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    wwDBLookupComboWorkCenter: TUniDBLookupComboBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    wwQryWorkCenter: TFDQuery;
    wwQryWorkCenterEQNO: TStringField;
    wwQryWorkCenterCNTR_DESC: TStringField;
    wwQryWorkCenterCNTR_TYPE: TStringField;
    wwQryWorkCenterEPLANT_ID: TBCDField;
    wwQryWorkCenterID: TBCDField;
    SrcWorkCenter: TDataSource;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    procedure QryRunsBestNewRecord(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLogClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwDBLookupComboWorkCenterDropDown(Sender: TObject);
  private
    { Private declarations }
    FParentOnDataChange: TDataChangeEvent;
    FSndop_ID: Real;
    FDataSource: TDataSource;
    procedure LocalParentRunsBestDataChange(Sender: TObject;  Field: TField);

    procedure StartUp;
    { TODO -oSanketG -cWebConvert : Need to find the suitable UniGUI component TNavigateBtn }
    //procedure IQSearchDBNavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure RefreshCaption;
    function GetSndop_ID: Real;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetSndop_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow( ADataSource: TDataSource );
    class procedure DoShowModal( ASndop_ID: Real );
    property Sndop_ID: Real read GetSndop_ID write SetSndop_ID;
    property DataSource: TDataSource write SetDataSource;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQLog
  ;

{ TFrmSndRunsBest }

{constructor TFrmSndRunsBest.Create(AOwner: TComponent; ADataSource: TDataSource);
begin
  inherited Create( AOwner );
  QryRunsBest.DataSource:= ADataSource;
  StartUp;
end;

constructor TFrmSndRunsBest.Create(AOwner: TComponent; ASndop_ID: Real);
begin
  FSndop_ID:= ASndop_ID;
  inherited Create( AOwner );
  QryRunsBest.ParamByName('sndop_id').Value := FSndop_ID;
  StartUp;
end;}

class procedure TFrmSndRunsBest.DoShow(ADataSource: TDataSource);
var
  FrmSndRunsBest: TFrmSndRunsBest;
begin
  {ADataSource is expected to have sndop_id}
  FrmSndRunsBest := TFrmSndRunsBest.Create( uniGUIApplication.UniApplication );
  FrmSndRunsBest.DataSource := ADataSource;
  FrmSndRunsBest.Show;
end;

class procedure TFrmSndRunsBest.DoShowModal(ASndop_ID: Real);
var
  FrmSndRunsBest: TFrmSndRunsBest;
begin
  FrmSndRunsBest := TFrmSndRunsBest.Create(uniGUIApplication.UniApplication);
  FrmSndRunsBest.Sndop_ID:= ASndop_ID;
  FrmSndRunsBest.ShowModal;
end;

procedure TFrmSndRunsBest.ApplyUpdates(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable(DataSet);
  DBChart1.RefreshData;
end;

procedure TFrmSndRunsBest.SetDataSource(const Value: TDataSource);
begin
  QryRunsBest.DataSource:= Value;
  StartUp;
end;

procedure TFrmSndRunsBest.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
  QryRunsBest.ParamByName('sndop_id').Value := FSndop_ID;
  StartUp;
end;

procedure TFrmSndRunsBest.StartUp;
begin
  IQRegFormRead( self, [ self ]);
  FormStyle:= fsNormal;

  IQSetTablesActive( TRUE, self );
  { TODO -oSanketG -cWebConvert : Need to revisit after finding alternative for IQSearch1.wwDbGrid and IQSearch1.DBNav  }
  {IQSearch1.DBNav.VisibleButtons:= [ nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh ];
  IQSearch1.DBNav.BeforeAction  := IQSearchDBNavBeforeAction;
  IQSearch1.wwDBGrid.SetControlType('EqNo_Act', fctCustom, 'wwDBLookupComboWorkCenter');
  IQSearch1.wwDBGrid.Color:= clBtnFace;}

  if Assigned(QryRunsBest.DataSource) then
  begin
    FParentOnDataChange:= QryRunsBest.DataSource.OnDataChange;
    QryRunsBest.DataSource.OnDataChange:= LocalParentRunsBestDataChange;
  end;

  RefreshCaption;
  DBChart1.RefreshData;
end;

{ TODO -oSanketG -cWebConvert : Need to revisit
[dcc32 Error] snd_runs_best.pas(209): E2003 Undeclared identifier: 'IQSearchDBNavBeforeAction'}
{procedure TFrmSndRunsBest.IQSearchDBNavBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( QryRunsBest );
    DBChart1.RefreshData;
    ABORT;
  end;
end;}

procedure TFrmSndRunsBest.QryRunsBestNewRecord(DataSet: TDataSet);
begin
  QryRunsBestSNDOP_ID.asFloat:= FSndop_ID; // QryRunsBest.DataSource.DataSet.FieldByName( 'SNDOP_ID' ).asFloat;
  QryRunsBestID.asFloat:= GetNextID( 'SNDOP_RUNS_BEST' );
end;

procedure TFrmSndRunsBest.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  if Assigned(QryRunsBest.DataSource) then
    QryRunsBest.DataSource.OnDataChange:= FParentOnDataChange;
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSndRunsBest.LocalParentRunsBestDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(FParentOnDataChange) then
     FParentOnDataChange(Sender, Field);

  RefreshCaption;
  DBChart1.RefreshData;
end;

procedure TFrmSndRunsBest.RefreshCaption;
var
  S: string;
begin
  //if Assigned(QryRunsBest.DataSource) then
  //begin
  S:= SelectValueByID('opno', 'sndop', FSndop_ID);   //  QryRunsBest.DataSource.DataSet.FieldByName('sndop_id').asFloat);
  Caption:= Format('Runs the best for Process# %s', [ S ]);
  //end;
end;

procedure TFrmSndRunsBest.btnLogClick(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //DoIQLogModal( self, [ QryRunsBestWORK_CENTER_ID_ACT.asInteger ] );  {IQLog.pas}
end;

procedure TFrmSndRunsBest.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSndRunsBest.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmSndRunsBest.wwDBLookupComboWorkCenterDropDown(
  Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative property for PerformSearch in TUniDBLookupComboBox }
  //wwDBLookupComboWorkCenter.PerformSearch;
end;

(*procedure TFrmSndRunsBest.wwDBLookupComboWorkCenterCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  QryRunsBest.Edit;
  QryRunsBestWORK_CENTER_ID_ACT.asFloat:= wwQryWorkCenterID.asFloat;

  {Lookup/jointed fields in the query - assign them here}
  QryRunsBestEQNO_ACT.asString     := wwQryWorkCenterEQNO.asString;
  QryRunsBestCNTR_DESC_ACT.asString:= wwQryWorkCenterCNTR_DESC.asString;

  {Text gets blanked out - restore it here}
  wwDBLookupComboWorkCenter.Text:= QryRunsBestEQNO_ACT.asString;
end;*)

{ TODO -oSanketG -cWebConvert : Need to revisit
[dcc32 Error] snd_runs_best.pas(306): E2003 Undeclared identifier: 'IQSearch1CalcCellColors'}
{procedure TFrmSndRunsBest.IQSearch1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight and not Field.ReadOnly then
     ABrush.Color:= clWindow
end;}

function TFrmSndRunsBest.GetSndop_ID: Real;
begin
  if Assigned(QryRunsBest.DataSource) then
    Result:= QryRunsBest.DataSource.DataSet.FieldByName( 'SNDOP_ID' ).asFloat
  else
    Result:= FSndop_ID;
end;



end.
