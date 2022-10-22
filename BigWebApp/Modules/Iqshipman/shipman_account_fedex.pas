unit shipman_account_fedex;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  shipman_account_base,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSplitter, System.Classes, Vcl.Controls,
  Vcl.Forms, uniPanel;

type
  TFrmShipManAccountFedEx = class(TFrmShipManAccountBase)
    edtAccountNumber: TUniEdit;
    edtMeterNumber: TUniEdit;
    lblAccountNumber: TUniLabel;
    lblMeterNumber: TUniLabel;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure LoadOptions; override;
    procedure SaveOptions; override;
    procedure ValidateOptions; override;
  public
    { Public declarations }
  end;

implementation

uses
  IQMS.Common.DataLib;

{$R *.dfm}

procedure TFrmShipManAccountFedEx.LoadOptions;
begin
  // inherited; // nothing
  edtAccountNumber.Text := CarrierOptions.ParamByName('AccountNumber').AsString;
  edtMeterNumber.Text := CarrierOptions.ParamByName('MeterNumber').AsString;
end;

procedure TFrmShipManAccountFedEx.SaveOptions;
begin
  // inherited; // nothing
  CarrierOptions.ParamByName('AccountNumber').AsString := edtAccountNumber.Text;
  ExecuteCommandFmt('update freight_carrier set acct = ''%s'' where id = %.0f', [edtAccountNumber.Text, FCarrierID]);
  CarrierOptions.ParamByName('MeterNumber').AsString := edtMeterNumber.Text;
end;

procedure TFrmShipManAccountFedEx.ValidateOptions;
begin
  inherited;

  if Trim(edtAccountNumber.Text) = '' then
     raise Exception.Create('Please enter an Account number.');
end;

end.
