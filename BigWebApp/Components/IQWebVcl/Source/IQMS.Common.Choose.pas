unit IQMS.Common.Choose;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  System.Math,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniRadioGroup;

type
  { TFrmIQChoiceSecurity }
  TFrmIQChoiceSecurity = packed record
    SecurityCode: string;
    SecureOKBtn: Boolean;
    SecureCancelBtn: Boolean;
  end;

  { TFrmIQChoice }
  TFrmIQChoice = class(TUniForm)
    PnlOptions: TUniPanel;
    Panel2: TUniPanel;
    rgOptions: TUniRadioGroup;
    PnlPrompt: TUniPanel;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    Panel3: TUniPanel;
    lblPrompt: TUniLabel;
    PnlButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    SR: TIQWebSecurityRegister;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SRAfterApply(Sender: TObject);
    procedure SRBeforeApply(Sender: TObject);
  private
    { Private declarations }
    FSecurityCode: string;
    procedure SetOptionsList(const AOptions: array of String;
      ADefaultIndex: Integer);
    procedure FixCtrls;
    procedure SetSecurityCode(const ASecurityCode: string);
  public
    { Public declarations }
    procedure ApplySecurity(const ASecurity: TFrmIQChoiceSecurity);
    property SecurityCode:string Read FSecurityCode Write SetSecurityCode;
  end;

function DoChoose(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer): Boolean;

function DoChooseEx(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer; const ASecurity: TFrmIQChoiceSecurity): Boolean;

// This method has Yes/No Vcl.Buttons.
function DoChooseYN(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer): Boolean;

function DoChooseYNEx(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer; const ASecurity: TFrmIQChoiceSecurity): Boolean;


implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Screen,
  IQMS.Common.ResStrings;

{$REGION 'Wrappers'}


function DoChoose(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer): Boolean;
begin
  with TFrmIQChoice.Create(uniGUIApplication.UniApplication) do
    begin
      SecurityCode:='';
      Caption := AFormCaption;
      lblPrompt.Caption := APromptText;
      PnlPrompt.Visible := lblPrompt.Caption > '';
      SetOptionsList(AOptions, ADefaultIndex);
      Result := ShowModal = mrOk;
      if Result then
        ASelectedIndex := rgOptions.ItemIndex
      else
        ASelectedIndex := - 1;
    end;
end;

function DoChooseEx(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer; const ASecurity: TFrmIQChoiceSecurity): Boolean;
begin
  with TFrmIQChoice.Create(uniGUIApplication.UniApplication) do
    begin
      SecurityCode:=ASecurity.SecurityCode;
      Caption := AFormCaption;
      lblPrompt.Caption := APromptText;
      PnlPrompt.Visible := lblPrompt.Caption > '';
      SetOptionsList(AOptions, ADefaultIndex);
      ApplySecurity(ASecurity);
      Result := ShowModal = mrOk;
      if Result then
        ASelectedIndex := rgOptions.ItemIndex
      else
        ASelectedIndex := - 1;
    end;
end;

function DoChooseYN(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer): Boolean;
begin
  with TFrmIQChoice.Create(uniGUIApplication.UniApplication) do
    begin
      SecurityCode:='';
      Caption := AFormCaption;
      btnOk.Caption := IQMS.Common.ResStrings.cTXT0000350; // 'Yes'
      btnCancel.Caption := IQMS.Common.ResStrings.cTXT0000351; // 'No'
      lblPrompt.Caption := APromptText;
      PnlPrompt.Visible := lblPrompt.Caption > '';
      SetOptionsList(AOptions, ADefaultIndex);
      Result := ShowModal = mrOk;
      if Result then
        ASelectedIndex := rgOptions.ItemIndex
      else
        ASelectedIndex := - 1;
    end;
end;

function DoChooseYNEx(AFormCaption, APromptText: String;
  const AOptions: array of String; ADefaultIndex: Integer;
  var ASelectedIndex: Integer; const ASecurity: TFrmIQChoiceSecurity): Boolean;
begin
  with TFrmIQChoice.Create(uniGUIApplication.UniApplication) do
    begin
      SecurityCode:=ASecurity.SecurityCode;
      Caption := AFormCaption;
      btnOk.Caption := IQMS.Common.ResStrings.cTXT0000350; // 'Yes'
      btnCancel.Caption := IQMS.Common.ResStrings.cTXT0000351; // 'No'
      lblPrompt.Caption := APromptText;
      PnlPrompt.Visible := lblPrompt.Caption > '';
      SetOptionsList(AOptions, ADefaultIndex);
      ApplySecurity(ASecurity);
      Result := ShowModal = mrOk;
      if Result then
        ASelectedIndex := rgOptions.ItemIndex
      else
        ASelectedIndex := - 1;
    end;
end;

{$ENDREGION 'Wrappers'}

{$REGION 'TFrmIQChoice'}

{ TFrmSIChoice }


procedure TFrmIQChoice.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  FixCtrls;
end;

procedure TFrmIQChoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmIQChoice.SetOptionsList(const AOptions: array of String;
  ADefaultIndex: Integer);
var
  i, L: Integer;
begin
  L := rgOptions.Width;
  rgOptions.Items.Clear;
  for i := 0 to High(AOptions) do
    begin
      rgOptions.Items.Add(AOptions[i]);
      L := Max(GetTextWidthPixels(Self.Font, AOptions[i], Self), L);
    end;
  if (ADefaultIndex > - 1) and (ADefaultIndex < rgOptions.Items.Count) then
    rgOptions.ItemIndex := ADefaultIndex;

  Width :=  L + 32;
end;

procedure TFrmIQChoice.SetSecurityCode(const ASecurityCode: string);
begin
  if ASecurityCode > '' then
    FSecurityCode := ASecurityCode;
end;

procedure TFrmIQChoice.ApplySecurity(const ASecurity: TFrmIQChoiceSecurity);
begin
  if ASecurity.SecurityCode > '' then
    begin
      SR.SecurityCode := ASecurity.SecurityCode;
      if ASecurity.SecureOKBtn then
        SR.SecurityItems.Add(btnOk.Name);
      if ASecurity.SecureCancelBtn then
        SR.SecurityItems.Add(btnCancel.Name);
      SR.Refresh;
    end;
end;

procedure TFrmIQChoice.SRAfterApply(Sender: TObject);
begin
  // If the user is not permitted to cancel the prompt, then
  // remove the "Close" button on the caption bar also.
  if not SR.Enabled['btnCancel'] or
    not SR.Visible['btnCancel'] then
    Self.BorderIcons := Self.BorderIcons - [biSystemMenu];
end;

procedure TFrmIQChoice.SRBeforeApply(Sender: TObject);
begin
  // In order to avoid an "access denied" error at startup, ensure
  // the security items are applied for the given security code.
  if FSecurityCode > '' then
    begin
      SR.SecurityCode := FSecurityCode;
      SR.ReadSecurityData(SecurityManager.UserName);
    end;
end;

procedure TFrmIQChoice.FixCtrls;
begin
  lblPrompt.AutoSize := FALSE;
  lblPrompt.AutoSize := True;
  lblPrompt.Update;
  PnlPrompt.Height := lblPrompt.Height + 8;
end;

{$ENDREGION 'TFrmIQChoice'}

end.
