unit Fore_Calc;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DB,
  StdCtrls,
  DBCtrls,
  ExtCtrls,
  Wwdatsrc,
  Buttons,
  Menus,
  IQMS.WebVcl.About,
  ComCtrls,
  IQMS.WebVcl.RepDef,
  IQMS.Common.JumpConstants,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.DBChart,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TFrmForeCalc = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    SrcFore_Calc: TDataSource;
    QryFore_Calc: TFDQuery;
    QryFore_CalcID: TBCDField;
    QryFore_CalcFORE_ITEM_ID: TBCDField;
    QryFore_CalcDESCRIP: TStringField;
    QryFore_CalcTIMESTAMP: TDateTimeField;
    QryFore_CalcFORE_FORMULA_ID_BEST: TBCDField;
    gridForeCalc: TIQUniGridControl;
    Panel4: TUniPanel;
    gridForeEval: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel6: TUniPanel;
    SrcFore_Eval: TDataSource;
    QryFore_Eval: TFDQuery;
    QryFore_EvalID: TBCDField;
    QryFore_EvalFORE_CALC_ID: TBCDField;
    QryFore_EvalFORE_FORMULA_ID: TBCDField;
    QryFore_EvalRESULT_VALUE: TFMTBCDField;
    QryFore_EvalTEXT_LOG: TStringField;
    QryFore_EvalFormula_Descrip: TStringField;
    sbtnRecalc: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    N1: TUniMenuItem;
    ForecastFormulas1: TUniMenuItem;
    UpdateSQLForeCalc: TFDUpdateSQL;
    QryFore_EvalFormula_Name: TStringField;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    DBMemo1: TUniDBMemo;
    QryFore_CalcQTR_START: TDateTimeField;
    QryFore_CalcQTR_END: TDateTimeField;
    QryFore_CalcACT_VALUE: TFMTBCDField;
    QryFore_EvalDeviation: TFloatField;
    QryFore_CalcBest_Formula_Name: TStringField;
    sbtnForecastFormulas: TUniSpeedButton;
    Splitter2: TUniSplitter;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    wwDBLookupComboBestFormula: TUniDBLookupComboBox;
    QryFormulas: TFDQuery;
    QryFormulasID: TBCDField;
    QryFormulasNAME: TStringField;
    QryFormulasDESCRIP: TStringField;
    QryFormulasINFIX: TStringField;
    QryFore_CalcARCUSTO_ID: TBCDField;
    QryFore_CalcCustNo: TStringField;
    wwDBLookupComboCust: TUniDBLookupComboBox;
    QryArcusto: TFDQuery;
    QryArcustoID: TBCDField;
    QryArcustoCUSTNO: TStringField;
    QryArcustoCOMPANY: TStringField;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    SecurityRegister1: TIQWebSecurityRegister;
    SrcFormulas: TDataSource;
    SrcArcusto: TDataSource;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryFore_CalcBeforeOpen(DataSet: TDataSet);
    procedure sbtnRecalcClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ForecastFormulas1Click(Sender: TObject);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdateToDataSet(DataSet: TDataSet);
    procedure AvoidAppend(DataSet: TDataSet);
    procedure QryFore_EvalUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure QryFore_EvalCalcFields(DataSet: TDataSet);
    procedure gridForeEvalCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QryFore_CalcAfterScroll(DataSet: TDataSet);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure QryFore_CalcBeforePost(DataSet: TDataSet);
    procedure gridForeCalcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QryFore_CalcAfterInsert(DataSet: TDataSet);
    procedure QryFore_CalcUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);

  private
    { Private declarations }
    FFore_Item_ID: Real;
    FArinvt_ID   : Real;
    FForecastType: string;
    procedure AssignCaption;
    procedure IQAfterPost( var Msg: TMessage ); message iq_AfterPost;
    procedure RecalcBestFormula(AFore_Calc_ID: Real);
    procedure SetFore_Item_ID(const Value: Real);
    procedure SetForecastType(const Value: string);
  public
    { Public declarations }
    class procedure DoShow(AFore_Item_ID: Real; AForecastType: string );
    property Fore_Item_ID: Real write SetFore_Item_ID;
    property ForecastType: string write SetForecastType;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  FR_Formulas,
  IQMS.Common.Numbers,
  Math;

{ TFrmForeCalc }

class procedure TFrmForeCalc.DoShow( AFore_Item_ID: Real; AForecastType: string );
var
  FrmForeCalc: TFrmForeCalc;
begin
  FrmForeCalc := TFrmForeCalc.Create(uniGUIApplication.UniApplication);
  FrmForeCalc.Fore_Item_ID:= AFore_Item_ID;
  FrmForeCalc.FArinvt_ID   := SelectValueByID('arinvt_id', 'fore_item', FrmForeCalc.FFore_Item_ID);
  FrmForeCalc.ForecastType:= AForecastType;
  FrmForeCalc.Show;
end;

procedure TFrmForeCalc.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, gridForeCalc, gridForeEval, Panel4 ]);
end;

procedure TFrmForeCalc.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  AssignCaption;
end;

procedure TFrmForeCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, gridForeCalc, gridForeEval, Panel4 ])
end;

procedure TFrmForeCalc.QryFore_CalcBeforeOpen(DataSet: TDataSet);
begin
//   with DataSet as TFDQuery do
//     ParamByName('fore_item_id').asFloat:= FFore_Item_ID;
   AssignQueryParamValue(DataSet, 'fore_item_id', FFore_Item_ID);
end;

procedure TFrmForeCalc.AssignCaption;
var
  A: Variant;
  S: string;
begin
  S:= 'N/A';
  A:= SelectValueArrayFmt( 'select class, rtrim(itemno), rtrim(rev) from arinvt where id = %f', [ FArinvt_ID ]);
  if VarArrayDimCount( A ) > 0 then
     S:= Format('%s.%s.%s', [ A[0], A[1], A[2]]);

  Caption:= Format('Best Forecast Formula Evaluation for %s', [ S ]);
end;

procedure TFrmForeCalc.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmForeCalc.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmForeCalc.ForecastFormulas1Click(Sender: TObject);
begin
  TFrmFR_Formulas.DoShowModal; {FR_Formulas.pas}
  RefreshDataSetByID( QryFore_Calc );
  RefreshDataSetByID( QryFore_Eval );
end;

procedure TFrmForeCalc.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;

procedure TFrmForeCalc.sbtnRecalcClick(Sender: TObject);
var
  AFore_Calc_ID: Real;
begin
  if not IQConfirmYN('This option recalculates best forecast formula. Please confirm to continue.') then
     EXIT;

  if QryFore_CalcID.asFloat = 0 then
     QryFore_Calc.Insert;

  RecalcBestFormula( QryFore_CalcID.asFloat );
end;

procedure TFrmForeCalc.SetForecastType(const Value: string);
begin
  FForecastType := Value;
end;

procedure TFrmForeCalc.SetFore_Item_ID(const Value: Real);
begin
  FFore_Item_ID := Value;
end;

procedure TFrmForeCalc.ApplyUpdateToDataSet(DataSet: TDataSet);
begin
  try
    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;
end;

procedure TFrmForeCalc.AvoidAppend(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmForeCalc.QryFore_EvalUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  AAction := eaApplied;  // to allow refresh
end;

procedure TFrmForeCalc.QryFore_EvalCalcFields(DataSet: TDataSet);
begin
  QryFore_EvalDeviation.asFloat:= QryFore_CalcACT_VALUE.asFloat - QryFore_EvalRESULT_VALUE.asFloat
end;

procedure TFrmForeCalc.gridForeEvalCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if (QryFore_EvalFORE_FORMULA_ID.asFloat > 0) and (QryFore_EvalFORE_FORMULA_ID.asFloat = QryFore_CalcFORE_FORMULA_ID_BEST.asFloat) then
     AFont.Style:= AFont.Style + [fsBold]
end;

procedure TFrmForeCalc.QryFore_CalcAfterScroll(DataSet: TDataSet);
begin
  //DBChart1.RefreshData
end;

procedure TFrmForeCalc.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmForeCalc.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmForeCalc.QryFore_CalcBeforePost(DataSet: TDataSet);
var
  AFlag: Boolean;
begin
  AFlag:= QryFore_CalcQTR_END.ReadOnly;
  QryFore_CalcQTR_END.ReadOnly:= FALSE;
  QryFore_CalcQTR_END.asDateTime:= IncMonth( QryFore_CalcQTR_START.AsDateTime, 3 );
  QryFore_CalcQTR_END.ReadOnly:= AFlag;

  if DataSet.State = dsInsert then
     PostMessage( Handle, iq_AfterPost, QryFore_CalcID.asInteger, 0);
end;

procedure TFrmForeCalc.IQAfterPost( var Msg: TMessage );
begin
  RecalcBestFormula( QryFore_CalcID.asFloat );
end;

procedure TFrmForeCalc.RecalcBestFormula( AFore_Calc_ID: Real );
begin
  QryFore_Calc.CheckBrowseMode;
  try
    ExecuteCommandFmt('declare                                                           '+
              '  v_fore_calc_id  number::= %f;                                   '+
              '  v_arcusto_id    number::= %s;                                   '+
              'begin                                                             '+
              '  forecast_calc_best.do_execute( %f,                              '+
              '                                 v_fore_calc_id,                  '+
              '                                 v_arcusto_id,                    '+
              '                                 ''%s'',                          '+
              '                                 to_date(''%s'', ''mm/dd/yy'' )); '+
              'end;                                                              ',
              [ AFore_Calc_ID,
                IIf( QryFore_CalcARCUSTO_ID.asFloat = 0, 'NULL', QryFore_CalcARCUSTO_ID.asString ),
                FFore_Item_ID,
                FForecastType,
                FormatDateTime( 'mm/dd/yyyy', QryFore_CalcQTR_START.asDateTime ) ]);
  finally
    Reopen( QryFore_Calc );
    QryFore_Calc.Locate( 'ID', AFore_Calc_ID, []);
  end;
end;


procedure TFrmForeCalc.gridForeCalcCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end;

procedure TFrmForeCalc.QryFore_CalcAfterInsert(DataSet: TDataSet);
var
  AFlag: Boolean;
begin
  AFlag:= QryFore_CalcID.ReadOnly;
  QryFore_CalcID.ReadOnly:= FALSE;
  QryFore_CalcID.asFloat:= GetNextID('fore_calc');
  QryFore_CalcID.ReadOnly:= AFlag;

  AFlag:= QryFore_CalcQTR_END.ReadOnly;
  QryFore_CalcQTR_END.ReadOnly:= FALSE;
  QryFore_CalcQTR_END.AsDateTime:= Date - 1;
  QryFore_CalcQTR_END.ReadOnly:= AFlag;

  QryFore_CalcQTR_START.AsDateTime:= IncMonth( QryFore_CalcQTR_END.AsDateTime, -3 );
end;

procedure TFrmForeCalc.QryFore_CalcUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  UpdateSQLForeCalc.Apply( ARequest, AAction, AOptions );
//  IQApplyCachedUpdate( UpdateSQLForeCalc, UpdateKind ); {pas}
  AAction := eaApplied;
end;

end.
