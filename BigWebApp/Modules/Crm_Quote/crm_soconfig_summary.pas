unit crm_soconfig_summary;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.wwDataInspector,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, Vcl.Grids;

type
  TFrmCRMSoConfigSummary = class(TUniForm)
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataID: TFloatField;
    QryDataRFQ: TStringField;
    QryDataPROJECT: TStringField;
    QryDataQUOTE_DATE: TDateTimeField;
    QryDataEXPIRATION_DATE: TDateTimeField;
    QryDataARCUSTO_COMPANY: TStringField;
    QryDataCRM_QUOTE_DETAIL_ID: TFloatField;
    QryDataSOURCE_ID: TFloatField;
    QryDataSOURCE_DISPLAY: TStringField;
    QryDataTotalConfigPrice: TFloatField;
    QryDataTotalUnitCost: TFloatField;
    QryDataTotalGrossProfit: TFloatField;
    QryDataTotalGrossProfitPercent: TFloatField;
    QryDataGrandTotalConfigPrice: TFloatField;
    QryDataGrandTotalCost: TFloatField;
    QryDataGrandTotalProfit: TFloatField;
    QryDataGrandTotalProfitPercent: TFloatField;
    QryDataREV: TFloatField;
    PMain: TUniPopupMenu;
    CopySummarytoClipboard1: TUniMenuItem;
    diSummary: TwwDataInspector;
    procedure QryDataBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryDataCalcFields(DataSet: TDataSet);
    procedure CopySummarytoClipboard1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCRMQuoteDetailID: Real;
    FSalesConfigID: Real;
    FCRMQuoteID: Real;
    FCanShow: Boolean;
    FQuoteTotalPrice: Real;
    FQuoteTotalTax: Real;
    FQuoteGrandTotal: Real;
    function InitVars: Boolean;
    procedure InitQuoteTotals;
    function GetTotalUnitConfigPrice: Real;
    function GetTotalUnitCost: Real;
    function GetGrandTotalCost: Real;
    function Divide(const Numerator, Denominator: Real): Real;
    procedure SetCRMQuoteDetailID(const Value: Real);
  public
    { Public declarations }
    property SalesConfigID: Real read FSalesConfigID;
    property CRMQuoteID: Real read FCRMQuoteID;
    property CRMQuoteDetailID: Real read FCRMQuoteDetailID write SetCRMQuoteDetailID;
    property CanShow: Boolean read FCanShow;
  end;

  // Params:
  //   ACRMQuoteDetailID = CRM_QUOTE_DETAIL.ID or CRM_QUOTE_DETAIL.PARENT_ID
  //     for the 'SALES_CONFIG' item. The detail record must be the main
  //     detail item for the Sales Configuration.
  procedure ShowSalesConfigSummary(ACRMQuoteDetailID: Real);



implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.DBTrans.dbtdbexp;

procedure ShowSalesConfigSummary( ACRMQuoteDetailID: Real);
var
  FrmCRMSoConfigSummary: TFrmCRMSoConfigSummary;
begin
  FrmCRMSoConfigSummary := TFrmCRMSoConfigSummary.Create( uniGUIApplication.UniApplication);
  with FrmCRMSoConfigSummary do
  begin
    CRMQuoteDetailID := ACRMQuoteDetailID;
    if CanShow then
      Show
    else
      //Release;
  end;
end;

{ TFrmCRMSoConfigSummary }

procedure TFrmCRMSoConfigSummary.FormShow(Sender: TObject);
begin
  if FCanShow then
    IQMS.Common.RegFrm.IQRegFormRead(Self,[Self]);
end;

procedure TFrmCRMSoConfigSummary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FCanShow then
    IQMS.Common.RegFrm.IQRegFormWrite(Self,[Self]);
end;

procedure TFrmCRMSoConfigSummary.UniFormCreate(Sender: TObject);
begin
  FCanShow := InitVars;
  if FCanShow then
    begin
      IQSetTablesActive(True, Self);
      { TODO -oSanketG -cWebConvert : Need to revisit ,
      [dcc32 Error] crm_soconfig_summary.pas(143): E2010 Incompatible types: 'TForm' and 'TFrmCRMSoConfigSummary'}
      //IQMS.Common.Controls.CenterForm(Self);
    end;
end;

function TFrmCRMSoConfigSummary.InitVars: Boolean;
var
  AData: Variant;
begin
  Result := False;
  AData := Unassigned;
  FCRMQuoteID := 0;
  FSalesConfigID := 0;
  if Trunc(FCRMQuoteDetailID) = 0 then Exit;

  // CRM_QUOTE.ID
  FCRMQuoteID := SelectValueFmtAsFloat('SELECT crm_quote_id FROM crm_quote_detail ' +
    'WHERE id = %.0f', [FCRMQuoteDetailID]);

  // Get a valid SALES_CONFIG.ID
  // If this Quote Detail record represents a Sales Configuration item,
  // then get the Sales Configuration ID directly from the SOURCE_ID field,
  // but at the same time ensure the Sales Configuration exists by using a
  // "hard" SQL link.
  FSalesConfigID := SelectValueFmtAsFloat(
    'SELECT b.id'#13 +
    '  FROM crm_quote_detail a, sales_config b'#13 +
    ' WHERE a.id = %.0f AND'#13 +
    '       a.source = ''SALES_CONFIG'' AND'#13 +
    '       b.id = a.source_id',
    [FCRMQuoteDetailID]);
  // If this is a "detail" record -- meaning, it represents a Sales Choice item,
  // and not a Sales Configuration item -- then obtain the SalesConfigID by
  // accessing the parent and ensuring the Sales Configuration exists by
  // using a "hard" SQL link.
  if (FSalesConfigID = 0) then
    try
      AData := SelectValueArrayFmt(
        'SELECT c.id AS sales_config_id, b.id AS crm_quote_detail_id'#13 +
        '  FROM crm_quote_detail a, crm_quote_detail b, sales_config c'#13 +
        ' WHERE a.id = %.0f AND'#13 +
        '       a.source = ''SALES_CONFIG_OPTION'' AND'#13 +
        '       b.id = a.parent_id AND'#13 +
        '       b.source = ''SALES_CONFIG'' AND'#13 +
        '       c.id = b.source_id',
        [FCRMQuoteDetailID]);
      if System.Variants.VarArrayDimCount(AData) > 0 then
        begin
          FSalesConfigID := AData[0]; // sales_config.id
          // Note:  We overwrite the crm_quote_detail.id that was passed to
          //   the unit wrapper or constructor here.  We do not want the
          //   detail ID for the Sales Choice; we want the main Sales Config
          //   detail record.
          FCRMQuoteDetailID := AData[1]; // crm_quote_detail.id
        end;
    finally
      AData := Unassigned;
    end;

  // Note:  If by this point we do not have a valid Sales Configuration ID,
  // CRM Quote ID, or CRM Quote Detail ID, then there is no need to show
  // this form.  Return fals so that the calling method can close
  // this form and not display it.
  Result := (FCRMQuoteID > 0) and (FCRMQuoteDetailID > 0) and
    (FSalesConfigID > 0);
end;

procedure TFrmCRMSoConfigSummary.InitQuoteTotals;
var
  AData: Variant;
begin
  FQuoteTotalPrice := 0;
  FQuoteTotalTax := 0;
  FQuoteGrandTotal := 0;
  AData := SelectValueArrayFmt(
    'SELECT SUM(NVL(d.unit_price, 0) * NVL(d.qty, 0)) AS total_price,'#13 +
    '       SUM((NVL(d.unit_price, 0) * NVL(d.qty, 0))'#13 +
    '           * NVL(t.tax_rate, 0) / 100) AS total_tax,'#13 +
    '       SUM((NVL(d.unit_price, 0) * NVL(d.qty, 0)) +'#13 +
    '           ((NVL(d.unit_price, 0) * NVL(d.qty, 0)) * NVL(t.tax_rate, 0) / 100))'#13 +
    '          AS grand_total'#13 +
    '  FROM crm_quote q, crm_quote_detail d, v_tax_codes t'#13 +
    ' WHERE q.id = %.0f AND'#13 +
    '       d.crm_quote_id = q.id AND'#13 +
    '       t.id(+) = d.tax_code_id AND'#13 +
    '       (d.source = ''SALES_CONFIG'' OR d.source = ''SALES_CONFIG_OPTION'')',
    [FCRMQuoteID]);
  if System.Variants.VarArrayDimCount(AData) > 0 then
    begin
      FQuoteTotalPrice := AData[0];
      FQuoteTotalTax := AData[1];
      FQuoteGrandTotal := AData[2];
    end;
end;

procedure TFrmCRMSoConfigSummary.QryDataBeforeOpen(DataSet: TDataSet);
begin
  // Update the main, CRM Quote information
  InitQuoteTotals;

  // Assign the CRM_QUOTE_DETAIL.ID.
  // Note:  Check InitVars() above.  It is possible that the variable
  // used was overwritten.  It would be if the value passed to the
  // wrapper or constructor was for a Sales Choice item.
  AssignQueryParamValue(DataSet, 'ID', Trunc(FCRMQuoteDetailID));
end;

procedure TFrmCRMSoConfigSummary.QryDataCalcFields(DataSet: TDataSet);
begin
  { Current Configuration Totals }

  // "Total Configuration Unit Price" = qty * unit price for all
  // quote detail records for the current configuration only.
  QryDataTotalConfigPrice.AsFloat := GetTotalUnitConfigPrice;

  // "Total Unit Cost" = Sum of the Cost fields for the currently selected
  // configuration only.
  QryDataTotalUnitCost.AsFloat := GetTotalUnitCost;

  // "Total Gross Profit" = Total Unit Configuration Price - Total Unit Standard Cost
  QryDataTotalGrossProfit.AsFloat := QryDataTotalConfigPrice.AsFloat -
    QryDataTotalUnitCost.AsFloat;

  // "Total Gross Profit %" = Total Unit Gross Profit / Total Unit Configuration Price
  QryDataTotalGrossProfitPercent.AsFloat := Divide(
    QryDataTotalGrossProfit.AsFloat, QryDataTotalConfigPrice.AsFloat);

  { All Quoted Configurations Totals }

  // "Grand Total Price" = qty * unit price for all
  // quote detail records for the all configurations
  QryDataGrandTotalConfigPrice.AsFloat := FQuoteGrandTotal;

  // "Grand Total Cost" = Sum of Total Unit Standard Cost of all configuration items
  QryDataGrandTotalCost.AsFloat := GetGrandTotalCost;

  // "Grand Total Profit" = Grand Total - Grand Total Cost
  QryDataGrandTotalProfit.AsFloat := QryDataGrandTotalConfigPrice.AsFloat -
    QryDataGrandTotalCost.AsFloat;

  // "Grand Total Profit %" = Grand Total Profit / Grand Total
  QryDataGrandTotalProfitPercent.AsFloat := Divide(
    QryDataGrandTotalProfit.AsFloat, FQuoteGrandTotal);
end;

procedure TFrmCRMSoConfigSummary.SetCRMQuoteDetailID(const Value: Real);
begin
  FCRMQuoteDetailID := Value;
end;

function TFrmCRMSoConfigSummary.GetGrandTotalCost: Real;
begin
  //Result := FQuoteTotalPrice;
  Result := SelectValueFmtAsFloat(
    'SELECT SUM(result) AS result'#13 +
    '  FROM (SELECT b.id, b.parent_id, b.seq,'#13 +
    '               CASE'#13 +
    '                  WHEN b.source = ''SALES_CONFIG'' THEN'#13 +
    '                     (SELECT arinvt.std_cost'#13 +
    '                        FROM arinvt, sales_config'#13 +
    '                       WHERE sales_config.arinvt_id = arinvt.id AND'#13 +
    '                             sales_config.id = b.source_id)'#13 +
    '                  WHEN b.source = ''SALES_CONFIG_OPTION'' THEN'#13 +
    '                     (SELECT SUM(NVL(arinvt.std_cost, 0) *'#13 +
    '                                 NVL(sales_choice_arinvt.quantity, 0))'#13 +
    '                        FROM arinvt, sales_choice_arinvt'#13 +
    '                       WHERE sales_choice_arinvt.sales_option_choice_id ='#13 +
    '                                b.sales_option_choice_id AND'#13 +
    '                             sales_choice_arinvt.arinvt_id = arinvt.id)'#13 +
    '                  ELSE'#13 +
    '                     NULL'#13 +
    '               END'#13 +
    '                  AS result'#13 +
    '          FROM crm_quote_detail b'#13 +
    '         WHERE crm_quote_id = %.0f)',
    [FCRMQuoteID]);
end;

function TFrmCRMSoConfigSummary.GetTotalUnitConfigPrice: Real;
begin
  Result:= SelectValueFmtAsFloat('SELECT SUM(qty * unit_price) FROM crm_quote_detail ' +
    'WHERE id = %.0f OR parent_id = %.0f',
    [FCRMQuoteDetailID, FCRMQuoteDetailID]);
end;

function TFrmCRMSoConfigSummary.GetTotalUnitCost: Real;
begin
  // Sum of the "Cost" field for all configuration items on the quote detail
  Result := SelectValueFmtAsFloat(
    'SELECT SUM(result) AS result'#13 +
    '  FROM (SELECT b.id, b.parent_id, b.seq,'#13 +
    '               CASE'#13 +
    '                  WHEN b.source = ''SALES_CONFIG'' THEN'#13 +
    '                     (SELECT arinvt.std_cost'#13 +
    '                        FROM arinvt, sales_config'#13 +
    '                       WHERE sales_config.arinvt_id = arinvt.id AND'#13 +
    '                             sales_config.id = b.source_id)'#13 +
    '                  WHEN b.source = ''SALES_CONFIG_OPTION'' THEN'#13 +
    '                     (SELECT SUM(NVL(arinvt.std_cost, 0) *'#13 +
    '                                 NVL(sales_choice_arinvt.quantity, 0))'#13 +
    '                        FROM arinvt, sales_choice_arinvt'#13 +
    '                       WHERE sales_choice_arinvt.sales_option_choice_id ='#13 +
    '                                b.sales_option_choice_id AND'#13 +
    '                             sales_choice_arinvt.arinvt_id = arinvt.id)'#13 +
    '                  ELSE'#13 +
    '                     NULL'#13 +
    '               END'#13 +
    '                  AS result'#13 +
    '          FROM crm_quote_detail b'#13 +
    '         WHERE crm_quote_id = %.0f AND'#13 +
    '               (id = %.0f OR'#13 +
    '                parent_id = %.0f))',
    [FCRMQuoteID, FCRMQuoteDetailID, FCRMQuoteDetailID]);
end;

function TFrmCRMSoConfigSummary.Divide(const Numerator,
  Denominator: Real): Real;
begin
  if (Denominator <> 0) then
    Result := Numerator / Denominator
  else
    Result := 0;
end;

procedure TFrmCRMSoConfigSummary.CopySummarytoClipboard1Click(Sender: TObject);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] crm_soconfig_summary.pas(374): E2003 Undeclared identifier: 'DataInspectorAsText'}
    //IQMS.Common.Controls.DataInspectorAsText(diSummary, {var} sl);
    IQMS.Common.StringUtils.CopyStrToClipbrd(sl.Text);
  finally
    FreeAndNil(sl);
  end;
end;

end.
