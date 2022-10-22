unit FrcstChk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniDBText,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniImage, IQUniGrid, uniGUIFrame;

type
  TFrmForecastRelExcept = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Shape3: TUniPanel;
    Label5: TUniLabel;
    SrcOrdLine: TDataSource;
    QryOrdLine: TFDQuery;
    QryOrdLineORD_DETAIL_ID: TBCDField;
    QryOrdLineORDERS_ID: TBCDField;
    QryOrdLineITEMNO: TStringField;
    QryOrdLineDESCRIP: TStringField;
    QryOrdLineECODE: TStringField;
    wwSrcReleases: TDataSource;
    wwQryReleases: TFDQuery;
    wwQryReleasesSEQ: TBCDField;
    wwQryReleasesID: TBCDField;
    wwQryReleasesREQUEST_DATE: TDateTimeField;
    wwQryReleasesPROMISE_DATE: TDateTimeField;
    wwQryReleasesQUAN: TBCDField;
    wwQryReleasesFORECAST: TStringField;
    wwQryReleasesCUSER1: TStringField;
    wwDBGrid1: TIQUniGridControl;
    SecurityRegister1: TIQWebSecurityRegister;
    QryOrdLineORDERNO: TStringField;
    PnlPrompt: TUniPanel;
    Panel4: TUniPanel;
    Image1: TUniImage;
    Panel5: TUniPanel;
    Label6: TUniLabel;
    Label1: TUniLabel;
    Edit1: TUniDBText;
    Label3: TUniLabel;
    Edit3: TUniDBText;
    Label4: TUniLabel;
    Edit4: TUniDBText;
{ TODO -oGPatil -cWebConvert : TGridDrawState not present  in unigui
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);   }
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetOrd_Detail_ID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Ord_Detail_ID: Real write SetOrd_Detail_ID;
  end;

procedure CheckOrdLineForForecastReleases(AOrd_Detail_ID: Real);

implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependecny on iqsecins.pas file
  IQSecIns,     }
  packslip_rscstr;

procedure CheckOrdLineForForecastReleases(AOrd_Detail_ID: Real);
var
  LFrmForecastRelExcept : TFrmForecastRelExcept;
begin
  {Is there any forecast releases}
  if SelectValueFmtAsInteger(
    'select 1 from releases    '#13 +
    ' where ord_detail_id = %f '#13 +
    '   and forecast = ''Y''   '#13 +
    '   and rownum < 2         ',
    [AOrd_Detail_ID]) = 0 then
    EXIT;

  {Check arcusto.ship_forecast}
  if SelectValueFmtAsString(
    'select arcusto.ship_forecast       '#13 +
    '  from ord_detail d,               '#13 +
    '       orders o,                   '#13 +
    '       arcusto                     '#13 +
    ' where d.id = %f                   '#13 +
    '   and d.orders_id = o.id          '#13 +
    '   and o.arcusto_id = arcusto.id(+)',
    [AOrd_Detail_ID]) = 'Y' then
    EXIT;

  {get authorization}
  LFrmForecastRelExcept := TFrmForecastRelExcept.Create(UniGUIApplication.UniApplication);
  LFrmForecastRelExcept.Ord_Detail_ID := AOrd_Detail_ID;
  if LFrmForecastRelExcept.ShowModal <> mrOK then
    // packslip_rscstr.cTXT0000129 =
    // 'Order line includes one or more forecast releases and ' +
    // 'must be authorized in order to proceed.';
    raise Exception.Create(packslip_rscstr.cTXT0000129);
end;

procedure TFrmForecastRelExcept.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, wwDBGrid1]);
{ TODO -oGPatil -cWebConvert : Dependecny on iqsecins.pas file
  EnsureSecurityInspectorOnTopOf(self); }
end;

procedure TFrmForecastRelExcept.SetOrd_Detail_ID(const Value: Real);
begin
  with QryOrdLine do
  begin
    Close;
    Params[0].asFloat := Value;
  end;
end;

procedure TFrmForecastRelExcept.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmForecastRelExcept.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, wwDBGrid1]);
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present  in unigui
procedure TFrmForecastRelExcept.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if wwQryReleasesFORECAST.asString = 'Y' then
    if Highlight then
      ABrush.Color := clBlue
    else
      ABrush.Color := clAqua;
end;  }

end.
