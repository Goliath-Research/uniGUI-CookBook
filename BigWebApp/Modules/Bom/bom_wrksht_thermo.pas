unit bom_wrksht_thermo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmBOMWeightWorkSheetThermo = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SrcArinvt: TDataSource;
    SrcResultsLength: TDataSource;
    QryResultsLength: TFDQuery;
    QryResultsLengthUP_COUNT: TFMTBCDField;
    QryResultsLengthPart_Length: TFloatField;
    SrcResultsWidth: TDataSource;
    QryResultsWidth: TFDQuery;
    QryResultsWidthPart_Width: TFloatField;
    QryResultsWidthUP_COUNT: TFMTBCDField;
    Panel3: TUniPanel;
    Splitter5: TUniSplitter;
    Splitter3: TUniSplitter;
    Panel11: TUniPanel;
    Splitter4: TUniSplitter;
    Panel13: TUniPanel;
    sbtnVolume: TUniSpeedButton;
    lblVolumeUOM: TUniLabel;
    DBEdit1: TUniDBEdit;
    edVolume: TUniEdit;
    DBEdit2: TUniDBEdit;
    Panel14: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    PnlSPGCaption: TUniPanel;
    lblSPGLabel: TUniLabel;
    pnlDim: TUniPanel;
    Splitter1: TUniSplitter;
    pnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    pnlClient03: TUniPanel;
    edSpaceTrimWidth: TUniEdit;
    edSpaceEdgeWidth: TUniEdit;
    Panel9: TUniPanel;
    Bevel4: TUniPanel;
    edWidth: TUniEdit;
    pnlLeft03: TUniPanel;
    edSpaceTrimLength: TUniEdit;
    edSpaceEdgeLength: TUniEdit;
    Panel8: TUniPanel;
    Bevel3: TUniPanel;
    edLength: TUniEdit;
    pnlLeft01: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    PnlDimensionsCaption: TUniPanel;
    lblDimensions: TUniLabel;
    pnlResults: TUniPanel;
    ScrollBox1: TUniScrollBox;
    wwDBGridLength: TIQUniGridControl;
    wwDBGridWidth: TIQUniGridControl;
    PnlResultsCaption: TUniPanel;
    lblResultsLabel: TUniLabel;
    Label9: TUniLabel;
    lblResults: TUniLabel;
    QryArinvt: TFDQuery;
    QryArinvtSPG: TFMTBCDField;
    QryArinvtGAUGE: TFMTBCDField;
    QryArinvtID: TBCDField;
    wwDataSource1: TDataSource;
    QryPartNo: TFDQuery;
    QryPartNoID: TBCDField;
    QryPartNoSTANDARD_ID: TBCDField;
    QryPartNoARINVT_ID: TBCDField;
    QryPartNoSTDCAV: TFMTBCDField;
    QryPartNoACTCAV: TFMTBCDField;
    QryPartNoPTWT_THERMO_DISP: TFMTBCDField;
    QryPartNoSPACE_TRIM_LENGTH: TFMTBCDField;
    QryPartNoSPACE_TRIM_WIDTH: TFMTBCDField;
    QryPartNoSPACE_EDGE_LENGTH: TFMTBCDField;
    QryPartNoSPACE_EDGE_WIDTH: TFMTBCDField;
    QryPartNoITEMNO: TStringField;
    QryPartNoDESCRIP: TStringField;
    QryPartNoREV: TStringField;
    QryPartNoLENGTH: TFMTBCDField;
    QryPartNoWIDTH: TFMTBCDField;
    QryArinvtEPLANT_ID: TBCDField;
    UpdateSQLArinvt: TFDUpdateSQL;
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure QryPartNoBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryResultsLengthCalcFields(DataSet: TDataSet);
    procedure QryResultsWidthCalcFields(DataSet: TDataSet);
    procedure UpdateResults(Sender: TObject);
    procedure sbtnVolumeClick(Sender: TObject);
    procedure UpdateResultPanel(Sender: TObject; Field: TField);
    procedure btnOKClick(Sender: TObject);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FMetricUOM: Boolean;
    FArinvt_ID_Mat: Real;
    FPartno_ID: Real;
    FArinvt_ID: Real;
    FWeight: Real;
    function GetVol: Real;
    procedure SetVol(const Value: Real);
    function CalcToolLength(AUp_Count: Real): Real;
    function CalcToolWidth(AUp_Count: Real): Real;
    procedure SetArinvt_ID_Mat(const Value: Real);
    procedure SetPartno_ID(const Value: Real);
  public
    { Public declarations }
    property Weight: Real read FWeight write FWeight;
    property Vol:Real read GetVol write SetVol;

    property Arinvt_ID_Mat: Real read FArinvt_ID_Mat write SetArinvt_ID_Mat;
    property Partno_ID: Real read FPartno_ID write SetPartno_ID;

    class function DoShowModal( AArinvt_ID_Mat, APartno_ID: Real;
                                var AWeight, AVol, APartLength, APartWidth, AToolLength, AToolWidth, AUpCount,
                                ASpaceTrimLength, ASpaceTrimWidth, ASpaceEdgeLength, ASpaceEdgeWidth: Real ): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.UOM,
  Q_WrkSht;

{ TFrmBOMWeightWorkSheetThermo }

class function TFrmBOMWeightWorkSheetThermo.DoShowModal( AArinvt_ID_Mat, APartno_ID: Real;
                                                         var AWeight, AVol, APartLength, APartWidth,
                                                         AToolLength, AToolWidth, AUpCount, ASpaceTrimLength, ASpaceTrimWidth,
                                                         ASpaceEdgeLength, ASpaceEdgeWidth: Real): Boolean;
var
  LFrmBOMWeightWorkSheetThermo : TFrmBOMWeightWorkSheetThermo;
begin
  LFrmBOMWeightWorkSheetThermo := TFrmBOMWeightWorkSheetThermo.Create( uniGuiApplication.UniApplication);

  LFrmBOMWeightWorkSheetThermo.Arinvt_ID_Mat := AArinvt_ID_Mat;
  LFrmBOMWeightWorkSheetThermo.Partno_ID     := APartno_ID;
  LFrmBOMWeightWorkSheetThermo.Vol           := AVol;

  Result := LFrmBOMWeightWorkSheetThermo.ShowModal = mrOK;
  if Result then
  begin
    AWeight := LFrmBOMWeightWorkSheetThermo.Weight;
    AVol := LFrmBOMWeightWorkSheetThermo.Vol;
    APartLength := StrToFloatSafe(LFrmBOMWeightWorkSheetThermo.edLength.Text);
    APartWidth := StrToFloatSafe(LFrmBOMWeightWorkSheetThermo.edWidth.Text);
    AToolLength := LFrmBOMWeightWorkSheetThermo.QryResultsLengthPart_Length.asFloat;
    AToolWidth := LFrmBOMWeightWorkSheetThermo.QryResultsWidthPart_Width.asFloat;
    AUpCount := LFrmBOMWeightWorkSheetThermo.QryResultsLengthUP_COUNT.asFloat * LFrmBOMWeightWorkSheetThermo.QryResultsWidthUP_COUNT.asFloat;
    ASpaceTrimLength := StrToFloatSafe(LFrmBOMWeightWorkSheetThermo.edSpaceTrimLength.Text);
    ASpaceTrimWidth := StrToFloatSafe(LFrmBOMWeightWorkSheetThermo.edSpaceTrimWidth.Text);
    ASpaceEdgeLength := StrToFloatSafe(LFrmBOMWeightWorkSheetThermo.edSpaceEdgeLength.Text);
    ASpaceEdgeWidth := StrToFloatSafe(LFrmBOMWeightWorkSheetThermo.edSpaceEdgeWidth.Text);
  end;
end;

procedure TFrmBOMWeightWorkSheetThermo.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;


function TFrmBOMWeightWorkSheetThermo.GetVol: Real;
begin
  try
    Result:= StrToFloat( edVolume.Text );
  except
    Result:= 0;
  end;
end;

procedure TFrmBOMWeightWorkSheetThermo.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('arinvt_id').Value := FArinvt_ID_Mat;
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID_Mat);
end;

procedure TFrmBOMWeightWorkSheetThermo.QryPartNoBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('partno_id').Value := FPartno_ID;
  AssignQueryParamValue(DataSet, 'partno_id', FPartno_ID);
end;


procedure TFrmBOMWeightWorkSheetThermo.SetArinvt_ID_Mat(const Value: Real);
begin
  FArinvt_ID_Mat := Value;
end;

procedure TFrmBOMWeightWorkSheetThermo.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmBOMWeightWorkSheetThermo.SetVol(const Value: Real);
begin
  edVolume.Text:= Format( '%.8f', [ Value ]);
end;

procedure TFrmBOMWeightWorkSheetThermo.QryResultsLengthCalcFields(DataSet: TDataSet);
begin
  QryResultsLengthPart_Length.asFloat:= CalcToolLength( QryResultsLengthUP_COUNT.asFloat );
end;

procedure TFrmBOMWeightWorkSheetThermo.QryResultsWidthCalcFields(
  DataSet: TDataSet);
begin
  QryResultsWidthPart_Width.asFloat := CalcToolWidth( QryResultsWidthUP_COUNT.asFloat );
end;

function TFrmBOMWeightWorkSheetThermo.CalcToolLength(
  AUp_Count: Real): Real;
begin
  Result:= StrToFloatSafe( edLength.Text ) * AUp_Count
           +
           StrToFloatSafe( edSpaceTrimLength.Text ) * (AUp_Count - 1)
           +
           StrToFloatSafe( edSpaceEdgeLength.Text ) * 2;
end;

function TFrmBOMWeightWorkSheetThermo.CalcToolWidth(AUp_Count: Real): Real;
begin
  Result:= StrToFloatSafe( edWidth.Text ) * AUp_Count
           +
           StrToFloatSafe( edSpaceTrimWidth.Text ) * (AUp_Count - 1)
           +
           StrToFloatSafe( edSpaceEdgeWidth.Text ) * 2;
end;

procedure TFrmBOMWeightWorkSheetThermo.UpdateResults(Sender: TObject);
begin
  RefreshDataSetByID( QryResultsLength, 'UP_COUNT' );
  RefreshDataSetByID( QryResultsWidth, 'UP_COUNT' );
end;

procedure TFrmBOMWeightWorkSheetThermo.sbtnVolumeClick(Sender: TObject);
begin
  edVolume.Text:= FloatToStr(StrToFloatSafe( edLength.Text ) * StrToFloatSafe( edWidth.Text ) * QryArinvtGAUGE.asFloat);
end;

procedure TFrmBOMWeightWorkSheetThermo.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQAssert( not(QryArinvt.Eof and  QryArinvt.Bof), Format('Unable to find primary material [ID = %.0f]', [ FArinvt_ID_Mat ]));

  FArinvt_ID:= QryPartNoARINVT_ID.asFloat;
  Caption   := Format('Thermoform Weight WorkSheet (%s %s)', [ Trim(QryPartNoITEMNO.asString), Trim(QryPartNoREV.asString)]);

  edLength.Text         := SelectValueByID('length', 'arinvt', FArinvt_ID);
  edWidth.Text          := SelectValueByID('width',  'arinvt', FArinvt_ID);
  edSpaceTrimLength.Text:= QryPartnoSPACE_TRIM_LENGTH.asString;
  edSpaceTrimWidth.Text := QryPartnoSPACE_TRIM_WIDTH.asString;
  edSpaceEdgeLength.Text:= QryPartnoSPACE_EDGE_LENGTH.asString;
  edSpaceEdgeWidth.Text := QryPartnoSPACE_EDGE_WIDTH.asString;

  FMetricUOM:= IsMetricSys( QryArinvtEPLANT_ID.asFloat );
  if FMetricUOM then
    lblVolumeUOM.Caption:= '(Cu. Cm)'
  else
    lblVolumeUOM.Caption:= '(Cu. In)';

  IQRegFormRead( self, [ self ]);

  QryResultsLength.Open;
  QryResultsWidth.Open;

  wwDBGridWidth.Left:= wwDBGridWidth.Left - 1;
end;

procedure TFrmBOMWeightWorkSheetThermo.UpdateResultPanel(Sender: TObject;
  Field: TField);
begin
  lblResults.Caption:= Format('  ' + '%d ups, %s x %s',
                                [ QryResultsLengthUP_COUNT.asInteger * QryResultsWidthUP_COUNT.asInteger,
                                  QryResultsLengthPart_Length.asString,
                                  QryResultsWidthPart_Width.asString ]);
end;

procedure TFrmBOMWeightWorkSheetThermo.btnOKClick(Sender: TObject);
var
  AVolume: Real;
begin
  if StrToFloatSafe( edVolume.Text ) = 0 then
     sbtnVolume.Click;

  {validate}
  IQAssert( StrToFloatSafe( edLength.Text ) > 0, 'Please enter a value for Part Length.');
  IQAssert( StrToFloatSafe( edWidth.Text ) > 0,  'Please enter a value for Part Width.');

  {process}
  QryArinvt.CheckBrowseMode;
  QryPartno.CheckBrowseMode;

  AVolume:= StrToFloat( edVolume.Text );

  // Formula => PtWt := SpG * .0361 * Pt_Vol * 453.59   for vol in cubic inches.
  Weight:= TFrmWeightWorkSheet.CalcWeight( AVolume, QryArinvtSPG.asFloat, QryArinvtEPLANT_ID.asFloat );  {Q_WrkSht.pas}

  ModalResult:= mrOK;
end;

procedure TFrmBOMWeightWorkSheetThermo.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

end.
