unit sys_ccmerchant_base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  // Vcl.Wwdatsrc,
  // Mask,
  cc_params,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu;

type
  TFrmIQSysMerchantBase = class(TUniForm)
    PnlBottom: TUniPanel;
    PnlButtons: TUniPanel;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    PkCurrencyCode: TIQWebHPick;
    PkCountryCode: TIQWebHPick;
    PkCurrencyCodeDIGIT3: TStringField;
    PkCountryCodeCHR2: TStringField;
    PkCountryCodeCHR3: TStringField;
    PkCountryCodeDIGIT3: TStringField;
    PkCountryCodeCOUNTRY: TStringField;
    PkCurrencyCodeCHR3: TStringField;
    PkCurrencyCodeDESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    PkCurrencyCodeNATIVE_CURR: TStringField;
    PkCurrencyISO: TIQWebHPick;
    PkCurrencyISODESCRIP: TStringField;
    PkCurrencyISOCHR3: TStringField;
    PkCurrencyISODIGIT3: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOKClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCreditCardAccountID: Int64;
    { TODO -oLema : need to revisit - TWinControl }
    procedure ClearEditBoxes(const AOwner: TWinControl);
  protected
    { Protected declarations }
    FCreditCardParams: TCreditCardParams;

    procedure ValidateBeforeClose; virtual;
    procedure StartUp; virtual;
    procedure AfterShow; virtual;

    procedure EncryptToTable(const AEdit: TUniEdit; const ACode: String);
    procedure DecryptToScreen(const AEdit: TUniEdit; const ACode: String);

    procedure GetEncryptedValues; virtual; abstract;
    procedure SetEncryptedValues; virtual; abstract;

    function MultiCurrencyEnabled: Boolean;
    procedure WarnInvalidCurrencyCode(ACurrCode: String);
  public
    { Public declarations }
    property CreditCardAccountID: Int64 read FCreditCardAccountID write FCreditCardAccountID;
  end;

implementation

{$R *.dfm}

uses
  cc_encrypt,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  iqsys_rscstr,
  IQMS.Common.Mcshare,
  // mcshare,
  uniScrollBox;

{ TFrmIQSysMerchantBase }

procedure TFrmIQSysMerchantBase.StartUp;
begin
  IQMS.Common.Screen.ApplySystemFont(Self);
  ClearEditBoxes(Self);
  // CenterForm(Self);

  // 06/20/2012 Update the package encryption keys so that
  // we can see data.
  cc_encrypt.ResetPackage;

  try
    FCreditCardParams := TCreditCardParams.Create(Self, CreditCardAccountID);
    GetEncryptedValues;
  except
    on E: Exception do
    begin
      // display trapped error
      IQMS.Common.Dialogs.IQError(E.Message);
      // close the form
      // PostMessage(Handle, WM_COMMAND, Close1.Command, 0);
      Close1Click(nil);
      // raise;
    end;
  end;
end;

procedure TFrmIQSysMerchantBase.UniFormCreate(Sender: TObject);
begin
  //  nothing
end;

procedure TFrmIQSysMerchantBase.FormShow(Sender: TObject);
begin
  StartUp;
  IQRegFormRead(Self, [Self]);
  // PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
  AfterShow;
end;

procedure TFrmIQSysMerchantBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmIQSysMerchantBase.AfterShow;
begin
  // Provided by descendent
end;

procedure TFrmIQSysMerchantBase.bbtnOKClick(Sender: TObject);
begin
  ValidateBeforeClose;
  SetEncryptedValues;
  ModalResult := mrOk;
//  Close;
end;

procedure TFrmIQSysMerchantBase.DecryptToScreen(const AEdit: TUniEdit; const ACode: String);
var
  AValue: String;
begin
  AValue := FCreditCardParams.ParamByName(ACode).AsString;
  AEdit.Text := cc_encrypt.CCKeyDecrypt(AValue);
end;

procedure TFrmIQSysMerchantBase.EncryptToTable(const AEdit: TUniEdit; const ACode: String);
begin
  FCreditCardParams.ParamByName(ACode).AsString := cc_encrypt.CCKeyEncrypt(AEdit.Text);
end;

procedure TFrmIQSysMerchantBase.ClearEditBoxes(const AOwner: TWinControl);
var
  i: Integer;
begin
  // Clear the TEdit boxes
  for i := 0 to AOwner.ControlCount - 1 do
    if (AOwner.Controls[i] is TUniEdit) then
      TUniEdit(AOwner.Controls[i]).Clear
    else if (AOwner.Controls[i] is TUniPanel) then
      ClearEditBoxes(TUniPanel(AOwner.Controls[i])) // recursion
    else if (AOwner.Controls[i] is TUniScrollBox) then
      ClearEditBoxes(TUniScrollBox(AOwner.Controls[i])) // recursion
    else
      Continue;
end;

function TFrmIQSysMerchantBase.MultiCurrencyEnabled: Boolean;
begin
  Result := IsMultiCurrencyEnabled;
end;

procedure TFrmIQSysMerchantBase.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQSysMerchantBase.WarnInvalidCurrencyCode(ACurrCode: String);
var
  A3Chr, S: String;
  ACurrencyID: Real;
begin

  { Note:  It would be easier to use a combo box and force users to select
    from the list of records in table CURRENCY.  However, not all
    customers use multicurrency, so the table could potentially be
    empty.  So, we allow users to enter a value from their settings
    printout, but we verify that a CURRENCY record exists here first. }

  if (ACurrCode = '') then
    Exit;

  // get 3-character code
  A3Chr := GetISO3CharCurrencyCode(ACurrCode);

  // raise exception if not a valid ISO code
  if (A3Chr = '') then
    { Invalid currency code.  Please select a currency code from the list. }
    raise Exception.Create(iqsys_rscstr.cTXT0000083);

  if IsMultiCurrencyEnabled then
  begin
    // get string for the message
    if CompareStr(A3Chr, ACurrCode) <> 0 then
      S := Format('%s [%s]', [A3Chr, ACurrCode])
    else
      S := A3Chr;

    // Check existance of record
    ACurrencyID := GetCurrencyIDForCode(A3Chr);

    // Inform user of problem
    if ACurrencyID = 0 then
      { 'Currency record not found.  Multicurrency is enabled, but a corresponding
        record was not found for currency code, %s.  Please create a
        multicurrency record, or you will not be able to convert credit card
        charges made in a foreign currency.' }
      raise Exception.CreateFmt(iqsys_rscstr.cTXT0000082, [S]);
  end;

end;

procedure TFrmIQSysMerchantBase.ValidateBeforeClose;
begin
  //
end;

end.
