unit MCQte_br;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  MCBasic,
  Data.DB,
  Vcl.DBGrids,
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
  FireDAC.Comp.DataSet,
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniDBNavigator, uniMainMenu, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniLabel, uniPanel;

type
  TFrmMCGridBasic = class(TFrmMCBasic)
    grid: TUniDBGrid;
    Src: TDataSource;
    Qry: TFDQuery;
    nav: TUniDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbCurrencyCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);override;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Recalculate;override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure TFrmMCGridBasic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
  inherited;
end;

procedure TFrmMCGridBasic.Recalculate;
begin
{  with Qry do
  begin
    Close;
    ParamByName('nFactor').Value := Factor;
    Open;
  end;}
end;

procedure TFrmMCGridBasic.UniFormShow(Sender: TObject);
begin
  inherited;
  IQRegFormRead( self, [self, grid]);
//  Factor := 1;
  Factor := 1/tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  Factor := tblCurrency.FieldByName('SPOT_RATE').asFloat;
end;

procedure TFrmMCGridBasic.cbCurrencyCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
//  Factor := FBanchRate/tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  Factor := FRate/tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  Factor := 1/FRate;
//  FRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
  Factor := 1/tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  Factor := tblCurrency.FieldByName('SPOT_RATE').asFloat;
  Recalculate;
end;

end.
