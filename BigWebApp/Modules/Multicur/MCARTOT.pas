unit MCARTot;

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
  TFrmMCARTotals = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    eSubTotal: TUniEdit;
    eFreight: TUniEdit;
    eTax: TUniEdit;
    eTotal: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation
{$R *.DFM}

procedure TFrmMCARTotals.Recalculate;
begin
  if FDataSet.State <> dsInactive then
  with TFDTable(FDataSet) do
  begin
    eSubTotal.Text := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTAL_BEFORE_TAX').asFloat * Factor);
    eFreight.Text  := FormatFloat('###, ###,##0.00;; ', FieldByName('FREIGHT').asFloat * Factor);
    eTax.Text      := FormatFloat('###, ###,##0.00;; ', FieldByName('NET_TAX').asFloat * Factor);
    eTotal.Text    := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTAL').asFloat * Factor);
  end;
end;


end.
