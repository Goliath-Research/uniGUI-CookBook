unit oe_estimate_bol_crmquote;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  oe_estimate_bol_base,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  Vcl.wwDataInspector,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniDBNavigator, uniMainMenu, uniEdit, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, IQUniGrid, Vcl.Forms, uniGUIFrame,
  Vcl.Grids, uniButton, uniBitBtn, uniSpeedButton, uniPanel, uniSplitter;

type
  TFrmEstimateBOLCRMQuote = class(TFrmEstimateBOLBase)
    QryHeaderRFQ: TStringField;
    QryHeaderFREIGHT_CHARGE: TFMTBCDField;
    QryHeaderFREIGHT_QUOTENO: TStringField;
    QryItemCRM_QUOTE_ID: TBCDField;
    QryItemSEQ: TBCDField;
    QryItemQTY: TBCDField;
    QryItemSOURCE_DISPLAY: TStringField;
    QryItemDESCRIP2: TStringField;
    QryItemUNIT: TStringField;
    NavHeader: TUniDBNavigator;
    QryItemSOURCE_DESCRIP: TStringField;
    QryHeaderFREIGHT_ID: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure QryHeaderAfterPost(DataSet: TDataSet);
    procedure QryHeaderUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure QryHeaderBeforeOpen(DataSet: TDataSet);
    procedure sbtnRequestEstimateClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure PopulateVars; override;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

procedure TFrmEstimateBOLCRMQuote.FormCreate(Sender: TObject);
begin
  FSource := 'CRM_QUOTE_DETAIL';
  inherited;
end;

procedure TFrmEstimateBOLCRMQuote.PopulateVars;
var
  A: Variant;
begin
  inherited PopulateVars;

  A := SelectValueArrayFmt(
    'SELECT b.id, b.web_srvc_url        '#13 +
    '  FROM crm_quote a, freight b      '#13 +
    ' WHERE a.freight_id = b.id AND     '#13 +
    '       a.id = %.0f                 ',
    [FHeader_ID]);

  FWebSrvcURL := '';
  FFreight_ID := 0;
  if VarArrayDimCount(A) > 0 then
    begin
      FFreight_ID := A[0];
      FWebSrvcURL := A[1];
    end;
end;

procedure TFrmEstimateBOLCRMQuote.QryHeaderAfterPost(DataSet: TDataSet);
begin
  inherited;

  with DataSet as TFDRDBMSDataSet do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
end;

procedure TFrmEstimateBOLCRMQuote.QryHeaderUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  // inherited; // nothing
  if ARequest = arUpdate then
    begin
      ExecuteCommandFmt(
        'UPDATE crm_quote SET       '#13 +
        '  freight_charge = %.2f,   '#13 +
        '  freight_quoteno = ''%s'' '#13 +
        'WHERE id = %d              ',
        [QryHeaderFREIGHT_CHARGE.AsFloat,
        IQMS.Common.StringUtils.FixStr(QryHeaderFREIGHT_QUOTENO.AsString),
        QryHeaderID.AsInteger]);
      {
        ExecuteCommandParamDataSet(
        'UPDATE crm_quote SET'#13 +
        '  freight_charge = :FREIGHT_CHARGE,'#13 +
        '  freight_quoteno = :FREIGHT_QUOTENO'#13 +
        'WHERE id = :ID',
        QryHeader);
      }
    end;
  AAction := eaApplied;
end;

procedure TFrmEstimateBOLCRMQuote.QryHeaderBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  TFDQuery(DataSet).ParamByName('ID').AsFloat := FHeader_ID;
end;

procedure TFrmEstimateBOLCRMQuote.sbtnRequestEstimateClick(
  Sender: TObject);
begin
  inherited;

  if FCalcQuoteNo <> '' then
    begin
      Reopen(QryHeader);
      QryHeader.Edit;
      QryHeaderFREIGHT_QUOTENO.AsString := FCalcQuoteNo;
      QryHeaderFREIGHT_CHARGE.AsFloat := FCalcQuoteTotal;
      QryHeaderFREIGHT_ID.AsFloat := FNewFreight_ID;
      QryHeader.Post;
    end;

end;

end.
