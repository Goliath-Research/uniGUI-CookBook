unit Mccqttot;
{Used in CRMQuote.pas}
interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Mcfrmbas,
  Wwtable,
  FireDAC.Comp.Client,
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
  Data.DB,
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
  TFrmMCCRMQuoteTotals = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblTotalPrice: TUniLabel;
    lblTotalTax: TUniLabel;
    lblGrandTotal: TUniLabel;
    edtTotalPrice: TUniEdit;
    edtTotalTax: TUniEdit;
    edtGrandTotal: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.McRscstr;

{ TFrmMCCRMQuoteTotals }

procedure TFrmMCCRMQuoteTotals.Recalculate;
begin
  if FDataSet.State <> dsInactive then
     with TFDTable(FDataSet) do
          begin
               edtTotalPrice.Text      := FormatFloat('###,##0.000000;; ', FieldByName('TOTAL_PRICE').asFloat * Factor);
               edtTotalTax.Text        := FormatFloat('###,###,##0.00;; ', FieldByName('TOTAL_TAX').asFloat * Factor);
               edtGrandTotal.Text      := FormatFloat('###,###,##0.00;; ', FieldByName('GRAND_TOTAL').asFloat * Factor);
               Caption := IQMS.Common.McRscstr.cTXT0000003; // 'Sales Quotation Totals'
          end;
end;

end.
