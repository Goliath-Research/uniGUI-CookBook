unit shipman_account_usps;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  shipman_account_base,
  IQMS.Common.DotNetCOMInterOp,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniButton,
  uniLabel, uniBitBtn, uniSplitter, Vcl.Controls, uniPanel, uniMultiItem,
  uniComboBox;

type
  TFrmShipManAccountUSPS = class(TFrmShipManAccountBase)
    edtUserName: TUniEdit;
    edtPassword: TUniEdit;
    lblUserName: TUniLabel;
    lblPassword: TUniLabel;
    lblPostageBalance: TUniLabel;
    edtPostageBalance: TUniEdit;
    btnCheckBalance: TUniButton;
    btnPurchasePostage: TUniButton;
    procedure FormShow(Sender: TObject);
    procedure btnCheckBalanceClick(Sender: TObject);
    procedure btnPurchasePostageClick(Sender: TObject);
  private
    procedure GetPurchaseStatus;
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
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.PanelMsg,
  shipman_account_usps_postage;

{ TFrmShipManAccountUSPS }

procedure TFrmShipManAccountUSPS.btnCheckBalanceClick(Sender: TObject);
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  hMsg: TPanelMesg;
begin

  if CarrierOptions.ParamByName('PendingTransactionId').AsInteger > 0 then
    GetPurchaseStatus;

  SaveOptions;

  hMsg := NIL;
  try
    hMsg := hPleaseWait('Checking account balance.  Please wait...');
    DisableFPUExceptions( CW );
    try
      CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

      try
        ADotNetObject.USPSGetAccountInfo( SecurityManager.UserName,
                                    SecurityManager.Password,
                                    IQGetServerName( 'IQ' ),
                                    FCarrierID);
      finally
        FreeDNetObject( ADotNetObject );
      end;
    finally
      RestoreFPU( CW );
    end;
  finally
    if Assigned(hMsg) then FreeAndNil(hMsg);
  end;

  CarrierOptions.Refresh;
  LoadOptions;
end;

procedure TFrmShipManAccountUSPS.btnPurchasePostageClick(Sender: TObject);
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  APostageAmount: Real;
  AMessage: String;
  AResponseCode: Integer;
  hMsg: TPanelMesg;
begin
  SaveOptions;

  if GetPostageAmount(APostageAmount) {shipman_account_usps_postage} then
    begin
      hMsg := NIL;
      try
        hMsg := hPleaseWait('Purchasing postage.  Please wait...');
        DisableFPUExceptions( CW );
        try
          CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

          try
            Application.ProcessMessages;
            AResponseCode := ADotNetObject.USPSPurchasePostage( SecurityManager.UserName,
                                        SecurityManager.Password,
                                        IQGetServerName( 'IQ' ),
                                        FCarrierID, APostageAmount, AMessage);
          finally
            FreeDNetObject( ADotNetObject );
          end;
        finally
          RestoreFPU( CW );
        end;
      finally
        if Assigned(hMsg) then FreeAndNil(hMsg);
      end;

      if AResponseCode = 0 then //Error
        IQMS.Common.Dialogs.IQError('Error purchasing postage: '#10#13 + AMessage);
      if AResponseCode = 1 then // Success
        IQMS.Common.Dialogs.IQConfirm('Postage successfully purchased.');
      if AResponseCode = 2 then // Pending
        IQMS.Common.Dialogs.IQWarning('Postage purchase is pending.');


      CarrierOptions.Refresh;
      LoadOptions;
    end;

end;

procedure TFrmShipManAccountUSPS.GetPurchaseStatus;
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.ShipmanInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  ATxId: Real;
  AMessage: String;
  AResponseCode: Integer;
  hMsg: TPanelMesg;
begin
  if not IQMS.Common.Dialogs.IQConfirmYN('There is a postage purchase pending. Would you like to check the status?') then EXIT;

  SaveOptions;
  ATxId := CarrierOptions.ParamByName('PendingTransactionId').AsInteger;

  hMsg := NIL;
  try
    hMsg := hPleaseWait('Checking purchase status.  Please wait...');
    DisableFPUExceptions( CW );
    try
      CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

      try
        AResponseCode := ADotNetObject.USPSGetPurchaseStatus( SecurityManager.UserName,
                                    SecurityManager.Password,
                                    IQGetServerName( 'IQ' ),
                                    FCarrierID, ATxId, AMessage);
      finally
        FreeDNetObject( ADotNetObject );
      end;
    finally
      RestoreFPU( CW );
    end;
  finally
    if Assigned(hMsg) then FreeAndNil(hMsg);
  end;

  if AResponseCode = 0 then //Error
    IQMS.Common.Dialogs.IQError('Error purchasing postage: '#10#13 + AMessage);
  if AResponseCode = 1 then // Success
    IQMS.Common.Dialogs.IQConfirm('Postage successfully purchased.');
  if AResponseCode = 2 then // Pending
    IQMS.Common.Dialogs.IQWarning('Postage purchase is still pending.');


  CarrierOptions.Refresh;
  LoadOptions;

end;
procedure TFrmShipManAccountUSPS.FormShow(Sender: TObject);
begin
  inherited;
  //IQMS.Common.Controls.SetPasswordCharBullet(edtPassword); // in base class
  LoadOptions;
  if CarrierOptions.ParamByName('PendingTransactionId').AsInteger > 0 then
    GetPurchaseStatus;

end;

procedure TFrmShipManAccountUSPS.LoadOptions;
begin
  // inherited; // nothing
  edtUserName.Text := CarrierOptions.ParamByName('UserName').AsString;
  edtPassword.Text := CarrierOptions.ParamByName('Password').AsString;
  if CarrierOptions.ParamByName('PendingTransactionId').AsInteger > 0 then
    begin
      edtPostageBalance.Hint := 'Pending purchase.';
      edtPostageBalance.Font.Color := TColor(clRed);
    end
  else
    begin
      edtPostageBalance.Hint := '';
      edtPostageBalance.Font.Color := TColor(clBlack);
    end;
  edtPostageBalance.Text := CarrierOptions.ParamByName('PostageBalance').AsString;

end;

procedure TFrmShipManAccountUSPS.SaveOptions;
begin
  // inherited; // nothing
  CarrierOptions.ParamByName('UserName').AsString := edtUserName.Text;
  CarrierOptions.ParamByName('Password').AsString := edtPassword.Text;
  ExecuteCommandFmt('update freight_carrier set acct = ''%s'' where id = %.0f', [edtUserName.Text, FCarrierID]);
end;

procedure TFrmShipManAccountUSPS.ValidateOptions;
begin
  inherited;

  if Trim(edtUserName.Text) = '' then
     raise Exception.Create('Please enter a User Name.');
  if Trim(edtPassword.Text) = '' then
     raise Exception.Create('Please enter a Password.');

end;

end.
