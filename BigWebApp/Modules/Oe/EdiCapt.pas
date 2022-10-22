unit EdiCapt;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  //OE_Main, Dependency
  //OE_Hist,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, vcl.wwdbgrid, IQUniGrid, uniGUIFrame;

type
  TFrmEdiCap = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DataSource1: TDataSource;
    QryCurr: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    QryCurrSEG: TStringField;
    QryCurrTRANSACTION_SET_CODE: TStringField;
    QryHist: TFDQuery;
    StringField1: TStringField;
    StringField3: TStringField;
    QryCurrTIMESTAMP: TDateTimeField;
    QryHistTIMESTAMP: TDateTimeField;
    QryCurrSeg_String_Disp: TStringField;
    QryCurrID: TBCDField;
    wwMemoDialog1: TwwMemoDialog;
    QryHistID: TBCDField;
    QryHistSeg_String_Disp: TStringField;
    QryCurrFILE_NAME: TStringField;
    QryHistFILE_NAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCurrCalcFields(DataSet: TDataSet);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure QryHistCalcFields(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    FCallForm: TUniForm;
    procedure SetCallForm(const Value: TUniForm);
    { Private declarations }
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent);override;
    property CallForm : TUniForm  write SetCallForm;
  end;

procedure DoViewCapturedEdiSegments(ACallForm : TUniForm);


implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;
{$R *.DFM}

procedure DoViewCapturedEdiSegments(ACallForm : TUniForm);
begin
  with TFrmEdiCap.Create(UniGuiApplication.UniApplication) do
  begin
    CallForm := ACallForm;
    Show;
  end;
end;


procedure TFrmEdiCap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);

end;

procedure TFrmEdiCap.QryCurrCalcFields(DataSet: TDataSet);
begin
  QryCurrSEG_STRING_DISP.asString := SelectValueFmtAsString('select substr(SEG_STRING, 1, 250) from ord_detail_seg where id = %f', [QryCurrID.asFloat]);
end;

procedure TFrmEdiCap.QryHistCalcFields(DataSet: TDataSet);
begin
  QryHistSEG_STRING_DISP.asString := SelectValueFmtAsString('select substr(SEG_STRING, 1, 250) from hist_ord_detail_seg where id = %f', [QryHistID.asFloat]);
end;

procedure TFrmEdiCap.SetCallForm(const Value: TUniForm);
begin
  FCallForm := Value;
end;

procedure TFrmEdiCap.UniFormShow(Sender: TObject);
begin
   IQRegFormRead( self, [ self, wwDBGrid1 ]);
  { TODO : Dependency
  if FCallForm is TFrmMainOrder then
  begin
    DataSource1.DataSet := QryCurr;
    QryCurr.Close;
    QryCurr.dataSource := TFrmMainOrder(FCallForm).DM.SrcOrd_Detail;
    QryCurr.Open;
  end
  else
  begin
    DataSource1.DataSet := QryHist;
    QryHist.Close;
    QryHist.dataSource := TFrmOeHist(FCallForm).SrcHistOrdDet;
    QryHist.Open;
  end; }

end;

procedure TFrmEdiCap.wwDBGrid1DblClick(Sender: TObject);
begin
  wwMemoDialog1.Lines.Clear;
  if DataSource1.DataSet = QryCurr then
    wwMemoDialog1.Lines.Add(SelectValueFmtAsString('select SEG_STRING from ord_detail_seg where id = %f', [QryCurrID.asFloat]))
  else
    wwMemoDialog1.Lines.Add(SelectValueFmtAsString('select SEG_STRING from hist_ord_detail_seg where id = %f', [QryHistID.asFloat]));
  wwMemoDialog1.Execute;

end;

end.
