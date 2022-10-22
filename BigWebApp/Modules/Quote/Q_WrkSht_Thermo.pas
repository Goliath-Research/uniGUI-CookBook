unit Q_WrkSht_Thermo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Q_WrkSht,
  Data.DB,
  Mask,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniBitBtn,
  uniSpeedButton, uniButton,UniGUIApplication;

type
  TFrmWeightWorkSheetThermo = class(TFrmWeightWorkSheet)
    TblQinvtLENGTH: TFMTBCDField;
    TblQinvtWIDTH: TFMTBCDField;
    Splitter5: TUniSplitter;
    pnlDim: TUniPanel;
    Splitter1: TUniSplitter;
    pnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    pnlClient03: TUniPanel;
    edSpaceTrimWidth: TUniEdit;
    edSpaceEdgeWidth: TUniEdit;
    Panel9: TUniPanel;
    pnlLeft03: TUniPanel;
    edSpaceTrimLength: TUniEdit;
    edSpaceEdgeLength: TUniEdit;
    Panel8: TUniPanel;
    pnlLeft01: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    pnlResults: TUniPanel;
    Splitter3: TUniSplitter;
    SrcResultsLength: TDataSource;
    QryResultsLength: TFDQuery;
    QryResultsLengthUP_COUNT: TFMTBCDField;
    QryResultsLengthPart_Length: TFloatField;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    Label3: TUniLabel;
    DBEdit2: TUniDBEdit;
    TblQinvtGAUGE: TFMTBCDField;
    edLength: TUniEdit;
    edWidth: TUniEdit;
    SrcResultsWidth: TDataSource;
    QryResultsWidth: TFDQuery;
    QryResultsWidthUP_COUNT: TFMTBCDField;
    QryResultsWidthPart_Width: TFloatField;
    ScrollBox1: TUniScrollBox;
    TblQinvtSPACE_TRIM_LENGTH: TFMTBCDField;
    TblQinvtSPACE_TRIM_WIDTH: TFMTBCDField;
    TblQinvtSPACE_EDGE_LENGTH: TFMTBCDField;
    TblQinvtSPACE_EDGE_WIDTH: TFMTBCDField;
    PnlSPGCaption: TUniPanel;
    lblSPGLabel: TUniLabel;
    PnlDimensionsCaption: TUniPanel;
    lblDimensions: TUniLabel;
    PnlResultsCaption: TUniPanel;
    lblResultsLabel: TUniLabel;
    Label9: TUniLabel;
    lblResults: TUniLabel;
    procedure QryResultsLengthCalcFields(DataSet: TDataSet);
    procedure UpdateResults(Sender: TObject);
    procedure sbtnVolumeClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure QryResultsWidthCalcFields(DataSet: TDataSet);
    procedure UpdateResultPanel(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FQuote_ID: Real;
    FQInvt_ID: Real;
    FAQinvt_ID: Real;
    FAQuote_ID: Real;
    function CalcToolLength(AUp_Count: Real): Real;
    function CalcToolWidth(AUp_Count: Real): Real;
    function GetGauge: Real;
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( AQuote_ID, AQinvt_Mat_ID, AQinvt_ID: Real; var AWeight, AVol, APartLength, APartWidth, AToolLength, AToolWidth, AUpCount,
                                ASpaceTrimLength, ASpaceTrimWidth, ASpaceEdgeLength, ASpaceEdgeWidth: Real ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  quote_rscstr;

class function TFrmWeightWorkSheetThermo.DoShowModal( AQuote_ID, AQinvt_Mat_ID, AQinvt_ID: Real; var AWeight, AVol, APartLength, APartWidth, AToolLength, AToolWidth, AUpCount,
                                                      ASpaceTrimLength, ASpaceTrimWidth, ASpaceEdgeLength, ASpaceEdgeWidth: Real ): Boolean;
var
  LFrmWeightWorkSheetThermo : TFrmWeightWorkSheetThermo;
begin
  LFrmWeightWorkSheetThermo := TFrmWeightWorkSheetThermo.Create(UniGUIApplication.UniApplication);
  LFrmWeightWorkSheetThermo.Quote_ID := AQuote_ID;
  LFrmWeightWorkSheetThermo.Qinvt_ID := AQinvt_ID;
  LFrmWeightWorkSheetThermo.Qinvt_Mat_ID := AQinvt_Mat_ID;
    Result:= LFrmWeightWorkSheetThermo.ShowModal = mrOK;
    if Result then
    begin
       AWeight         := LFrmWeightWorkSheetThermo.Weight;
       AVol            := LFrmWeightWorkSheetThermo.Vol;
       APartLength     := StrToFloatSafe(LFrmWeightWorkSheetThermo.edLength.Text);
       APartWidth      := StrToFloatSafe(LFrmWeightWorkSheetThermo.edWidth.Text);
       AToolLength     := LFrmWeightWorkSheetThermo.QryResultsLengthPart_Length.asFloat;
       AToolWidth      := LFrmWeightWorkSheetThermo.QryResultsWidthPart_Width.asFloat;
       AUpCount        := LFrmWeightWorkSheetThermo.QryResultsLengthUP_COUNT.asFloat * LFrmWeightWorkSheetThermo.QryResultsWidthUP_COUNT.asFloat;
       ASpaceTrimLength:= StrToFloatSafe( LFrmWeightWorkSheetThermo.edSpaceTrimLength.Text );
       ASpaceTrimWidth := StrToFloatSafe( LFrmWeightWorkSheetThermo.edSpaceTrimWidth.Text );
       ASpaceEdgeLength:= StrToFloatSafe( LFrmWeightWorkSheetThermo.edSpaceEdgeLength.Text );
       ASpaceEdgeWidth := StrToFloatSafe( LFrmWeightWorkSheetThermo.edSpaceEdgeWidth.Text );
    end;
end;

procedure TFrmWeightWorkSheetThermo.FormCreate(Sender: TObject);
var
  A: Variant;
begin
    inherited;

  // 'Thermoform Weight WorkSheet (%s %s)'
  Caption:= Format(quote_rscstr.cTXT000000186,
   [ Trim(TblQinvtITEMNO.asString), Trim(TblQinvtREV.asString)]);

  QryResultsLength.Open;
  QryResultsWidth.Open;

//  wwDBGridWidth.Left:= wwDBGridWidth.Left - 1;
end;

procedure TFrmWeightWorkSheetThermo.QryResultsLengthCalcFields( DataSet: TDataSet);
begin
  // inherited; {n}
  QryResultsLengthPart_Length.asFloat:= CalcToolLength( QryResultsLengthUP_COUNT.asFloat );
end;

procedure TFrmWeightWorkSheetThermo.QryResultsWidthCalcFields(DataSet: TDataSet);
begin
  // inherited; {n}
  QryResultsWidthPart_Width.asFloat := CalcToolWidth( QryResultsWidthUP_COUNT.asFloat );
end;


function TFrmWeightWorkSheetThermo.CalcToolLength( AUp_Count: Real ): Real;
begin
  Result:= StrToFloatSafe( edLength.Text ) * AUp_Count
           +
           StrToFloatSafe( edSpaceTrimLength.Text ) * (AUp_Count - 1)
           +
           StrToFloatSafe( edSpaceEdgeLength.Text ) * 2;
end;


function TFrmWeightWorkSheetThermo.CalcToolWidth( AUp_Count: Real ): Real;
begin
  Result:= StrToFloatSafe( edWidth.Text ) * AUp_Count
           +
           StrToFloatSafe( edSpaceTrimWidth.Text ) * (AUp_Count - 1)
           +
           StrToFloatSafe( edSpaceEdgeWidth.Text ) * 2;
end;



procedure TFrmWeightWorkSheetThermo.UpdateResults(Sender: TObject);
begin
  inherited;
  RefreshDataSetByID( QryResultsLength, 'UP_COUNT' );
  RefreshDataSetByID( QryResultsWidth, 'UP_COUNT' );
end;

procedure TFrmWeightWorkSheetThermo.sbtnVolumeClick(Sender: TObject);
begin
  // inherited;
  edVolume.Text:= FloatToStr(StrToFloatSafe( edLength.Text ) * StrToFloatSafe( edWidth.Text ) * GetGauge()); // TblQinvtGAUGE.asFloat);
end;

procedure TFrmWeightWorkSheetThermo.btnOKClick(Sender: TObject);
begin
  if StrToFloatSafe( edVolume.Text ) = 0 then
     sbtnVolume.Click;

  {validate}
  IQAssert( StrToFloatSafe( edLength.Text ) > 0, quote_rscstr.cTXT000000187); // 'Please enter a value for Part Length.'
  IQAssert( StrToFloatSafe( edWidth.Text ) > 0,  quote_rscstr.cTXT000000188); // 'Please enter a value for Part Width.'

  {process}
  inherited;
end;


procedure TFrmWeightWorkSheetThermo.UniFormShow(Sender: TObject);
var
  A : Variant;
begin
  inherited;
  A:= SelectValueArrayFmt( 'select length, width, space_trim_length, space_trim_width, space_edge_length, space_edge_width from qinvt where id = %f', [ Qinvt_Mat_ID ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    edLength.Text         := A[ 0 ];
    edWidth.Text          := A[ 1 ];
    edSpaceTrimLength.Text:= A[ 2 ];
    edSpaceTrimWidth.Text := A[ 3 ];
    edSpaceEdgeLength.Text:= A[ 4 ];
    edSpaceEdgeWidth.Text := A[ 5 ];
  end;
end;

procedure TFrmWeightWorkSheetThermo.UpdateResultPanel(Sender: TObject;
  Field: TField);
begin
  inherited; {n}

  lblResults.Caption:= Format('  ' + quote_rscstr.cTXT000000189, // '%d ups, %s x %s'
                                [ QryResultsLengthUP_COUNT.asInteger * QryResultsWidthUP_COUNT.asInteger,
                                  QryResultsLengthPart_Length.asString,
                                  QryResultsWidthPart_Width.asString ]);
end;

function TFrmWeightWorkSheetThermo.GetGauge: Real;
begin
  Result:= SelectValueByID('gauge', 'quote', FQuote_ID );
  if Result = 0 then
     Result:= SelectValueByID('gauge', 'qinvt', FQInvt_ID );
end;

end.
