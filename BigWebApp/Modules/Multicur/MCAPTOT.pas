unit MCAPTot;

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
  TFrmMCAPTotals = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    eInvAmount: TUniEdit;
    eBalance: TUniEdit;
    eDistributed: TUniEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Recalculate;override;
  end;

implementation
{$R *.DFM}

procedure TFrmMCAPTotals.Recalculate;
begin
  if FDataSet.State <> dsInactive then
  with TFDTable(FDataSet) do
  begin
    eInvAmount.Text   := FormatFloat('###, ###,##0.00;; ', FieldByName('INVOICE_AMOUNT').asFloat * Factor);
    eDistributed.Text := FormatFloat('###, ###,##0.00;; ', FieldByName('AMOUNT_DISTRIBUTED').asFloat * Factor);
    eBalance.Text     := FormatFloat('###, ###,##0.00;; ', FieldByName('BALANCE').asFloat * Factor);
  end;
end;

end.
