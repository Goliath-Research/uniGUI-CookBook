unit MCARDet;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  MCFrmBas,
  Wwtable,
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
  TFrmMCARDetails = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label6: TUniLabel;
    Label5: TUniLabel;
    eUnitPrice: TUniEdit;
    eFreightPrice: TUniEdit;
    ePricePer1000: TUniEdit;
    eTotalAfterTax: TUniEdit;
    eTotalBeforeTax: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation
{$R *.DFM}

procedure TFrmMCARDetails.Recalculate;
begin
  if FDataSet.State <> dsInactive then
  with TFDTable(FDataSet) do
  begin
    eUnitPrice.Text      := FormatFloat('###,##0.000000;; ',  FieldByName('UNIT_PRICE').asFloat * Factor);
    eTotalBeforeTax.Text := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTAL_BEFORE_TAX').asFloat * Factor);
    eTotalAfterTax.Text  := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTAL_AFTER_TAX').asFloat * Factor);
    ePricePer1000.Text   := FormatFloat('###, ###,##0.00;; ',  FieldByName('PRICE_PER_1000').asFloat * Factor);
    eFreightPrice.Text   := FormatFloat('###, ###,##0.00;; ',  FieldByName('FREIGHT_PRICE').asFloat * Factor);
    if Trim(FieldByName('Description').asString)  = '' then
      Caption := FieldByName('MISC_COMMENT').asString
    else Caption := FieldByName('Description').asString;
  end;
end;

end.
