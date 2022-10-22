unit MCAPDet;

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
  TFrmMCAPDetails = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label4: TUniLabel;
    Label3: TUniLabel;
    eUnitPrice: TUniEdit;
    eAmount: TUniEdit;
    eStdCost: TUniEdit;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrmMCAPDetails.Recalculate;
begin
  if FDataSet.State <> dsInactive then
  with TFDTable(FDataSet) do
  begin
    eUnitPrice.Text := FormatFloat('###,##0.000000;; ',  FieldByName('UNIT_COST').asFloat * Factor);
    eAmount.Text    := FormatFloat('###, ###,##0.00;; ', FieldByName('AMOUNT_DISTRIBUTED').asFloat * Factor);
    eStdCost.Text   := FormatFloat('###, ###,##0.00;; ', FieldByName('STD_COST').asFloat / tblCurrency.FieldByName('SPOT_RATE').asFloat);
    if Trim(FieldByName('Item_Descrip').asString)  = '' then
      Caption := FieldByName('MISC_COMMENT').asString
    else Caption := FieldByName('Item_Descrip').asString;
  end;
end;


end.
