unit shipman_account_ups;

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
  TFrmShipManAccountUPS = class(TFrmShipManAccountBase)
    Label2: TUniLabel;
    edtAccount: TUniEdit;
    edtMyUPSID: TUniEdit;
    edtPassword: TUniEdit;
    lblAccountNumber: TUniLabel;
    lblMyUPSID: TUniLabel;
    procedure FormShow(Sender: TObject);
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

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  shipman_rscstr,
  IQMS.Common.Controls;

procedure TFrmShipManAccountUPS.FormShow(Sender: TObject);
begin
  inherited;

  //IQMS.Common.Controls.SetPasswordCharBullet(edtPassword); // in base class

  if IsDefault then
     Caption := shipman_rscstr.cTXT000073 // 'Default UPS Account'
  else
     Caption := shipman_rscstr.cTXT000074; // 'UPS Account'
end;


procedure TFrmShipManAccountUPS.LoadOptions;
begin
  // inherited; // nothing
  edtAccount.Text := CarrierOptions.ParamByName('AccountNumber').AsString;
  edtMyUPSID.Text := CarrierOptions.ParamByName('Username').AsString;
  edtPassword.Text := CarrierOptions.ParamByName('Password').AsString;
  //txtAccount.Text := CarrierOptions.ParamByName('Status').AsString;
end;

procedure TFrmShipManAccountUPS.SaveOptions;
begin
  // inherited; // nothing
  CarrierOptions.ParamByName('AccountNumber').AsString := edtAccount.Text;
  ExecuteCommandFmt('update freight_carrier set acct = ''%s'' where id = %.0f', [edtAccount.Text, FCarrierID]);
  CarrierOptions.ParamByName('Username').AsString := edtMyUPSID.Text;
  CarrierOptions.ParamByName('Password').AsString := edtPassword.Text;
end;

procedure TFrmShipManAccountUPS.ValidateOptions;
begin
  inherited;

  if Trim(edtAccount.Text) = '' then
     raise Exception.Create('Please enter an Account number.');

end;

end.
