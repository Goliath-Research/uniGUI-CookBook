unit UnitPriceAcctSplit;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  inv_main,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniComboBox, uniDBComboBox, uniGUIFrame,
  IQUniGrid;

type
  TFrmUnitPriceAcctSplit = class(TUniForm)
    Panel1: TUniPanel;
    Grid: TIQUniGridControl;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    wwGlAcct: TUniDBLookupComboBox;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridUpdateFooter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FTotal:Real;
    procedure SetTotal(const Value: Real);
  public
    { Public declarations }
    property Total : Real write SetTotal;
  end;

procedure DoUnitPriceAmountSplit(ATotal:Real);

implementation
uses
  IQMS.Common.RegFrm,
  ar_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoUnitPriceAmountSplit(ATotal:Real);
var
  LFrmUnitPriceAcctSplit : TFrmUnitPriceAcctSplit;
begin
  LFrmUnitPriceAcctSplit := TFrmUnitPriceAcctSplit.Create( UniGUIApplication.UniApplication);
  with LFrmUnitPriceAcctSplit do
  begin
    Total := ATotal;
    ShowModal;
  end;
end;

procedure TFrmUnitPriceAcctSplit.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUnitPriceAcctSplit.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmUnitPriceAcctSplit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmUnitPriceAcctSplit.GridUpdateFooter(Sender: TObject);
var
  ATotal:Real;
begin
  ATotal := SelectValueFmtAsFloat('select sum(SPLIT_AMOUNT) ' +
                          '  from ARPREPOST_DETAIL_SALES    ' +
                          ' where arprepost_detail_id = %f', [TFrmInvoice(Owner).QryARPrepostDetailID.asFloat]);
  { TODO : TIQUniGridControl has no member ColumnByName }
 // Grid.ColumnByName('SPLIT_AMOUNT').FooterValue := FloatToStr(ATotal);

end;

procedure TFrmUnitPriceAcctSplit.SetTotal(const Value: Real);
begin
  FTotal := Value;
end;

procedure TFrmUnitPriceAcctSplit.UniFormShow(Sender: TObject);
begin
  Caption := Format('Unit Price Account Split (Total Amount: %m)', [FTotal]);
  IQRegFormRead( self, [self, Grid]);
end;

procedure TFrmUnitPriceAcctSplit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  ATotal:Real;
  ACount:Real;
begin
  TFrmInvoice(Owner).TblDtlAcctSplit.CheckBrowseMode;
  ACount := SelectValueFmtAsFloat('select count(id) ' +
                          '  from ARPREPOST_DETAIL_SALES    ' +
                          ' where arprepost_detail_id = %f', [TFrmInvoice(Owner).QryARPrepostDetailID.asFloat]);

  if ACount <> 0 then
  begin
    ATotal := SelectValueFmtAsFloat('select sum(SPLIT_AMOUNT) ' +
                            '  from ARPREPOST_DETAIL_SALES    ' +
                            ' where arprepost_detail_id = %f', [TFrmInvoice(Owner).QryARPrepostDetailID.asFloat]);

    if ATotal <> FTotal then
      raise exception.create(ar_rscstr.cTXT0000094);

    ExecuteCommandFmt('update ARPREPOST_DETAIL_SALES set percentage = split_amount* 100/%.6f where arprepost_detail_id = %f', [FTotal, TFrmInvoice(Owner).QryARPrepostDetailID.asFloat]);

    TFrmInvoice(Owner).TblDtlAcct.Refresh;
  end;


end;

procedure TFrmUnitPriceAcctSplit.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmUnitPriceAcctSplit.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
