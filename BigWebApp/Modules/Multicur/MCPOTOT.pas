unit MCPOTot;

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
  TFrmMCPOTotals = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    eSubTotal: TUniEdit;
    eGrand: TUniEdit;
    eTax: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation
{$R *.DFM}

procedure TFrmMCPOTotals.Recalculate;
begin
  if FDataSet.State <> dsInactive then
  with TFDTable(FDataSet) do
  begin
    eSubTotal.Text := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTAL').asFloat * Factor);
    eTax.Text      := FormatFloat('###, ###,##0.00;; ', FieldByName('TAX').asFloat * Factor);
    eGrand.Text    := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTAL_AFTER_TAX').asFloat * Factor);
  end;
end;


end.
