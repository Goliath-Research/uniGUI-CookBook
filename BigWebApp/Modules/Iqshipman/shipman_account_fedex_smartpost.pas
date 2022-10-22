unit shipman_account_fedex_smartpost;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  shipman_account_fedex,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSplitter, System.Classes, Vcl.Controls,
  Vcl.Forms, uniPanel;

type
  TFrmShipManAccountFedExSmartPost = class(TFrmShipManAccountFedEx)
    Label1: TUniLabel;
    edtHubID: TUniEdit;
  private
    procedure LoadOptions; override;
    procedure SaveOptions; override;
    procedure ValidateOptions; override;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmShipManAccountFedExSmartPost.LoadOptions;
begin
  inherited;
  edtHubID.Text := CarrierOptions.ParamByName('HubID').AsString;
end;

procedure TFrmShipManAccountFedExSmartPost.SaveOptions;
begin
  inherited;
  CarrierOptions.ParamByName('HubID').AsString := edtHubID.Text;
  CarrierOptions.ParamByName('SmartPost').AsBoolean := True;
end;

procedure TFrmShipManAccountFedExSmartPost.ValidateOptions;
begin
  inherited;

  if Trim(edtHubID.Text) = '' then
     raise Exception.Create('Please enter a Hub ID.');
end;

end.
