unit MCPoDet;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  MCFrmBas,
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
  TFrmMCPODetails = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label4: TUniLabel;
    Label3: TUniLabel;
    eUnitPrice: TUniEdit;
    ePricePer1000: TUniEdit;
    eTotal: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation
{$R *.DFM}

procedure TFrmMCPODetails.Recalculate;
begin
  if FDataSet.State <> dsInactive then
  with TFDTable(FDataSet) do
  begin
    eUnitPrice.Text    := FormatFloat('###,##0.000000;; ',  FieldByName('UNIT_PRICE').asFloat * Factor);
    ePriceper1000.Text := FormatFloat('###, ###,##0.00;; ', FieldByName('PRICE_PER_1000').asFloat * Factor);
    eTotal.Text        := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTAL').asFloat * Factor);
    Caption := FieldByName('Disp_Descript').asString;
  end;
end;


end.
