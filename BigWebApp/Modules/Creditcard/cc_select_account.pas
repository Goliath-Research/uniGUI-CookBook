unit cc_select_account;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  { TFrmCCSelectAccount }
  TFrmCCSelectAccount = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    PnlCarrier: TUniPanel;
    GroupBox1: TUniGroupBox;
    PnlOptions: TUniPanel;
    rbSelected: TUniRadioButton;
    rbAll: TUniRadioButton;
    PnlClient01: TUniPanel;
    PnlCreditCardAccountLabel: TUniPanel;
    lblCreditCardAccount: TUniLabel;
    PnlClient02: TUniPanel;
    PnlButtonsRight: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    PnlCtrls: TUniPanel;
    edtAccount: TUniEdit;
    PkCreditCardAccount: TIQWebHPick;
    PkCreditCardAccountID: TBCDField;
    PkCreditCardAccountDESCRIPTION: TStringField;
    PkCreditCardAccountGATEWAY: TBCDField;
    PkCreditCardAccountGATEWAY_DESCRIP: TStringField;
    PkCreditCardAccountBANKINFO_DTL_ID: TBCDField;
    PkCreditCardAccountBANK_ACCOUNT_NUMBER: TStringField;
    PkCreditCardAccountBANK_ACCOUNT_DESCRIPTION: TStringField;
    PkCreditCardAccountEPLANT_ID: TBCDField;
    PkCreditCardAccountEPLANT_NAME: TStringField;
    PkCreditCardAccountIS_DEFAULT: TStringField;
    PkCreditCardAccountARCHIVED: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure DoRBClick(Sender: TObject);
  private
    { Private declarations }
    FCreditCardAccountID: Int64;
    procedure SetControls;
  public
    { Public declarations }
  end;

function SelectCreditCardAccountID(var ACreditCardAccountID: Int64;var AAllAccounts: Boolean): Boolean;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;

function SelectCreditCardAccountID(var ACreditCardAccountID: Int64;var AAllAccounts: Boolean): Boolean;
var
  AGatewayCount: Integer;
  LFrmCCSelectAccount : TFrmCCSelectAccount;
begin
  Result := False;
  ACreditCardAccountID := 0;
  AAllAccounts := False;

  //To test it commented out the below sql
  AGatewayCount := SelectValueAsInteger(
    'SELECT COUNT(id) AS count_id                                '#13 +
    'FROM (SELECT DISTINCT id                                    '#13 +
    '      FROM credit_card_account                              '#13 +
    '      WHERE id IN (SELECT DISTINCT credit_card_account_id   '#13 +
    '                   FROM credit_card_trans                   '#13 +
    '                   WHERE status IN (0, 4)) AND              '#13 +
    '            iqms.misc.eplant_filter(eplant_id) = 1)         ');

    { TODO : for rendering had commented it out }
  if AGatewayCount = 0 then
    Exit;

  if AGatewayCount = 1 then
    begin
      ACreditCardAccountID := SelectValueAsInt64(
        'SELECT DISTINCT id                                    '#13 +
        'FROM credit_card_account                              '#13 +
        'WHERE id IN (SELECT DISTINCT credit_card_account_id   '#13 +
        '             FROM credit_card_trans                   '#13 +
        '             WHERE status IN (0, 4)) AND              '#13 +
        '      iqms.misc.eplant_filter(eplant_id) = 1 AND      '#13 +
        '      ROWNUM < 2                                      ');
      Result := ACreditCardAccountID > 0;
      Exit;
    end;

  LFrmCCSelectAccount := TFrmCCSelectAccount.Create(UniGUIApplication.UniApplication);
  with LFrmCCSelectAccount do
  begin
    Result := ShowModal = mrOk;
    if Result then
      begin
        ACreditCardAccountID := FCreditCardAccountID;
        AAllAccounts := rbAll.Checked;
      end;
  end;
end;

procedure TFrmCCSelectAccount.FormCreate(Sender: TObject);
begin
  FCreditCardAccountID := 0;
  rbSelected.Checked := True;
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlOptions);
  PnlCreditCardAccountLabel.Width := lblCreditCardAccount.Left +
    lblCreditCardAccount.Width + 32;
  SetControls;
end;

procedure TFrmCCSelectAccount.sbtnSearchClick(Sender: TObject);
begin
  // Select account
  with PkCreditCardAccount do
    begin
      if Execute then
        begin
          FCreditCardAccountID := System.Variants.VarAsType(GetValue('ID'),
            varInt64);
          edtAccount.Text := System.Variants.VarToStr(GetValue('DESCRIPTION'));
          edtAccount.Font.Color := clBlack;
          SetControls;
        end;
    end;
end;

procedure TFrmCCSelectAccount.SetControls;
begin
  btnOk.Enabled := (rbSelected.Checked and (FCreditCardAccountID > 0)) or
    rbAll.Checked;
  IQMS.Common.Controls.IQEnableControl([lblCreditCardAccount, sbtnSearch],
    rbSelected.Checked);
end;

procedure TFrmCCSelectAccount.DoRBClick(Sender: TObject);
begin
  SetControls;
end;

end.
