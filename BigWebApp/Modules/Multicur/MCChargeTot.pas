unit MCChargeTot;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Mcfrmbas,
  Wwtable,
  FireDAC.Comp.DataSet,
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
  FireDAC.Comp.Client,
  Vcl.Menus,
  Vcl.Controls,
  UniGUIApplication,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniLabel, uniMainMenu, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, Vcl.Forms;

type
  TFrmMCChargeTotals = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    edtAmount: TUniEdit;
    edtFreight: TUniEdit;
    edtTax: TUniEdit;
    lblAmount: TUniLabel;
    lblTax: TUniLabel;
    lblFreight: TUniLabel;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FFreight: Real;
    FTax: Real;
    FAmount: Real;
    FBaseCurrencyID : Real;
    procedure SetBaseCurrencyID(const Value: Real);
  public
    { Public declarations }
    procedure Recalculate;override;
  published
    { Published declarations }
    property BaseCurrencyID: Real write SetBaseCurrencyID;
    property Amount: Real write FAmount;
    property Tax: Real write FTax;
    property Freight: Real write FFreight;
  end;

  procedure DoMCChargeTotals(const ABaseCurrencyID: Real;
   const AAmount, ATax, AFreight: Real);


implementation

{$R *.dfm}

uses
  IQMS.Common.Mcshare;

procedure DoMCChargeTotals(const ABaseCurrencyID: Real;
 const AAmount, ATax, AFreight: Real);
var
   ACurrencyID: Real;
   LFrmMCChargeTotals : TFrmMCChargeTotals;
begin

  ACurrencyID := ABaseCurrencyID;

  if ACurrencyID = 0 then
     ACurrencyID := IQMS.Common.Mcshare.GetDefaultCurrencyID;

  if ACurrencyID = 0 then
     Exit;

  LFrmMCChargeTotals := TFrmMCChargeTotals.Create( UniGUIApplication.UniApplication );
  with LFrmMCChargeTotals do
  begin
    BaseCurrencyID := ABaseCurrencyID;
    Amount := AAmount;
    Tax := ATax;
    Freight := AFreight;
    ShowModal;
  end;
end;

{ TFrmMCChargeTotals }

procedure TFrmMCChargeTotals.Recalculate;
begin
  edtAmount.Text := FormatFloat('#,##0.00;; ',  FAmount * Factor);
  edtTax.Text    := FormatFloat('#,##0.00;; ', FTax * Factor);
  edtFreight.Text   := FormatFloat('#,##0.00;; ', FFreight / tblCurrency.FieldByName('SPOT_RATE').asFloat);
end;

procedure TFrmMCChargeTotals.SetBaseCurrencyID(const Value: Real);
begin
  FBaseCurrencyID := Value;
end;

procedure TFrmMCChargeTotals.UniFormShow(Sender: TObject);
begin
  inherited;
  tblCurrency.Locate('ID', FBaseCurrencyID, []);
  cbCurrency.Text := tblCurrency.FieldByName('Descrip').asString;
  { TODO : TUniDBLookupComboBox has no member LookUpValue }
 // cbCurrency.LookUpValue := IntToStr(Trunc(FBaseCurrencyID));
  FRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
  FBanchRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
  Factor := 1;


  Recalculate;
end;

end.
