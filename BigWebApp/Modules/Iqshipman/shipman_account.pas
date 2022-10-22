unit shipman_account;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  System.SysUtils,
  shipman_common,
  shipman_account_base,
  UniGUIApplication,
  MainModule;

type
  TAccountFormClass = class of TFrmShipManAccountBase;

function DoEditAccount(ACarrierID: Real; ACarrierType: TCarrierType): Boolean;

implementation

uses
  IQMS.Common.DataLib,
  shipman_account_fedex,
  shipman_account_fedex_express,
  shipman_account_fedex_smartpost,
  shipman_account_ups,
  shipman_account_usps,
  IQMS.Common.Dialogs;

function DoEditAccount(ACarrierID: Real; ACarrierType: TCarrierType): Boolean;
var
  AReference: TAccountFormClass;
  ADefault: Boolean;
  AParams: TStringList;
  AParamStr: String;
  ADefaultCarrierID: Real;
begin
  AReference := NIL;
  ADefaultCarrierID := 0;
  ADefault := SelectValueFmtAsString
    ('select isdefault from freight_carrier where id = %.0f',
    [ACarrierID]) = 'Y';

  try
    AParams := TStringList.Create;
    // get form reference
    case ACarrierType of

      ctUPS:
        AReference := TAccountFormClass(TFrmShipManAccountUPS);
      ctFedExGround:
        AReference := TAccountFormClass(TFrmShipManAccountFedEx);
      ctFedExExpress:
        AReference := TAccountFormClass(TFrmShipManAccountFedExExpress);
      ctFedExSmartPost:
        AReference := TAccountFormClass(TFrmShipManAccountFedExSmartPost);
      ctUSPS:
        AReference := TAccountFormClass(TFrmShipManAccountUSPS);

    else
      Exit;
    end;
    with AReference.Create(UniGUIApplication.UniApplication) do
    begin
      CarrierID := ACarrierID;
      IsDefault := ADefault;
      Result := ShowModal = mrOk;
      if Result and Modified then
        Beep;
    end;
  finally
    if Assigned(AParams) then
      AParams.Free;
  end;

end;

end.
