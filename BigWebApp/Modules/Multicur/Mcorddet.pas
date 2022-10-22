unit MCOrddet;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Wwtable,
  McFrmBas,
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
  TFrmMCOrdDetail = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label6: TUniLabel;
    eUnitPrice: TUniEdit;
    eTotalPrice: TUniEdit;
    ePricePer1000: TUniEdit;
    eListUnitPrice: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation
{$R *.DFM}

procedure TFrmMCOrdDetail.Recalculate;
begin
  if FDataSet.State <> dsInactive then
  with TFDTable(FDataSet) do
  begin
    eUnitPrice.Text     := FormatFloat('###,##0.000000;; ',  FieldByName('UNIT_PRICE').asFloat * Factor);
    eTotalPrice.Text    := FormatFloat('###, ###,##0.00;; ', FieldByName('TOTALPRICE').asFloat * Factor);
    ePricePer1000.Text  := FormatFloat('###,##0.000000;; ',  FieldByName('PRICE_PER_1000').asFloat * Factor);
    eListUnitPrice.Text := FormatFloat('###,##0.000000;; ',  FieldByName('LIST_UNIT_PRICE').asFloat * Factor);
    Caption := FieldByName('Disp_Descript').asString;
  end;
end;

end.
