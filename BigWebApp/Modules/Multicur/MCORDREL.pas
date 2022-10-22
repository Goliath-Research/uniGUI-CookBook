unit MCOrdRel;

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
  TFrmMCOrdReleases = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    eUnitPrice: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate; override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.McRscstr;

procedure TFrmMCOrdReleases.Recalculate;
begin
  if FDataSet.State <> dsInactive then
    with TFDQuery(FDataSet) do
    begin
      eUnitPrice.Text := FormatFloat('###,##0.000000;; ',
        FieldByName('UNIT_PRICE').asFloat * Factor);
    end;
  Caption := cTXT0000011; // 'Releases Unit Price';
end;

end.
