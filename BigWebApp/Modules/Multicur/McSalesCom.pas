unit McSalesCom;

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
  TFrmMCSalesman = class(TFrmMCFormBasic)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    lblTotalPrice: TUniLabel;
    Label2: TUniLabel;
    PnlClient02: TUniPanel;
    edtComm: TUniEdit;
    EdtTotalComm: TUniEdit;
    Edipaid: TUniEdit;
    Edamount: TUniEdit;
    Label3: TUniLabel;
    Label4: TUniLabel;
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmMCSalesman.Recalculate;
begin
  if FDataSet.State <> dsInactive then
     with TFDTable(FDataSet) do
          begin
            if FindField('StillToPay') <> nil then
               edtComm.Text       := FormatFloat('###,###,##0.00;; ', FieldByName('StillToPay').asFloat * Factor);
            if FindField('TOTAL_COMMISSIONS') <> nil then
               EdtTotalComm.Text  := FormatFloat('###,###,##0.00;; ', FieldByName('TOTAL_COMMISSIONS').asFloat * Factor);
            if FindField('TotalComm') <> nil then
               EdtTotalComm.Text  := FormatFloat('###,###,##0.00;; ', FieldByName('TotalComm').asFloat * Factor);
            if FindField('TotalPaid') <> nil then
               Edipaid.Text       := FormatFloat('###,###,##0.00;; ', FieldByName('TotalPaid').asFloat * Factor);
            if FindField('amount_to_pay') <> nil then
               Edamount.Text      := FormatFloat('###,###,##0.00;; ', FieldByName('amount_to_pay').asFloat * Factor);

          end;
end;

end.
