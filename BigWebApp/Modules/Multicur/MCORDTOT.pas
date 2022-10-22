unit MCOrdTot;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Wwtable,
  MCFrmBas,
  FireDAC.Comp.Client,
  MainModule,
  Data.db,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniLabel, uniMainMenu, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, Vcl.Forms;

type
  TFrmMCOrdTotals = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    eTotal: TUniEdit;
    eTax: TUniEdit;
    eGrand: TUniEdit;
    eFreight: TUniEdit;
    Label5: TUniLabel;
  private
    { Private declarations }
    procedure Recalculate;override;
    function GetFormattedValueAsString(AValue: Real): String;
  public
    { Public declarations }
  end;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib;

function TFrmMCOrdTotals.GetFormattedValueAsString(AValue: Real): String;
begin
   if AValue < 0 then
      Result := FormatFloat('(###,###,###,##0.00)', Abs(AValue))
   else
      Result := FormatFloat('###,###,###,##0.00', AValue);
end;

procedure TFrmMCOrdTotals.Recalculate;
var
  AFreight:Real;
begin
  if FDataSet.State <> dsInactive then
  with TFDQuery(FDataSet) do
  begin
    AFreight := SelectValueFmtAsFloat('select NVL(freight_charge, 0) from orders where id = %f', [FieldByName('ORDERS_ID').asFloat]);

    eTotal.Text := GetFormattedValueAsString(FieldByName('TOTAL_PRICE').asFloat * Factor);
    eTax.Text   := GetFormattedValueAsString( FieldByName('TOTAL_TAX').asFloat * Factor);
    eFreight.Text := GetFormattedValueAsString( AFreight * Factor);
    eGrand.Text := GetFormattedValueAsString((FieldByName('GRAND_TOTAL').asFloat + AFreight) * Factor);

  end;
  Caption := 'Order Totals';
end;

end.
