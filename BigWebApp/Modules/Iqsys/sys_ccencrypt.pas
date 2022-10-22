unit sys_ccencrypt;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.CaptionPanel,
  MainModule,
  uniGUIApplication, //UniApplication
//  WizardBase,
  IQMS.Common.WizardBase,
  IQMS.Common.ProgressDialog,
  IQMS.Common.JumpConstants,
  Vcl.Imaging.pngimage,
  FireDAC.Phys,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.Common.RollbackManager,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniMainMenu,
  IQMS.Common.DataConst,
  uniLabel, uniImage, uniPageControl, uniButton, uniBitBtn, Vcl.ComCtrls,
  uniSpinEdit;

type
  { TRequestedOperation }
  TRequestedOperation = (rqaNone, rqaRemoveOnly, rqaModify);

  { TFrmIQSysCCEncrypt }
  TFrmIQSysCCEncrypt = class(TFrmWizardBase)
    TabOption: TUniTabSheet;
    TabEdit: TUniTabSheet;
    TabRemove: TUniTabSheet;
    PnlOptions: TUniPanel;
    rbEdit: TUniRadioButton;
    rbRemove: TUniRadioButton;
    PnlEditPasswordsEditCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlEditPasswordsEditLeft01: TUniPanel;
    lblPassKey1: TUniLabel;
    lblPassKey2: TUniLabel;
    lblPassKey3: TUniLabel;
    PnlClient02: TUniPanel;
    PnlRemoveEditCarrier: TUniPanel;
    Splitter2: TUniSplitter;
    PnlRemoveEditLeft01: TUniPanel;
    lblPassKeyRemove1: TUniLabel;
    lblPassKeyRemove2: TUniLabel;
    lblPassKeyRemove3: TUniLabel;
    PnlRemoveEditClient01: TUniPanel;
    edtPassKeyRemove1: TUniEdit;
    edtPassKeyRemove2: TUniEdit;
    edtPassKeyRemove3: TUniEdit;
    PnlOldPassword: TUniPanel;
    lblOldPassword: TUniLabel;
    edtOldPassKey1: TUniEdit;
    edtOldPassKey2: TUniEdit;
    edtOldPassKey3: TUniEdit;
    PnlNewPassword: TUniPanel;
    lblNewPassword: TUniLabel;
    edtPassKey1: TUniEdit;
    edtPassKey2: TUniEdit;
    edtPassKey3: TUniEdit;
    PnlIntroduction: TUniPanel;
    Label2: TUniLabel;
    Bevel5: TUniPanel;
    lblPrompt2: TUniLabel;
    Bevel2: TUniPanel;
    lblPrompt3: TUniLabel;
    Bevel3: TUniPanel;
    lblPrompt4: TUniLabel;
    lblPrompt1: TUniLabel;
    Bevel6: TUniPanel;
    PPasswordEdit: TUniPopupMenu;
    Paste1: TUniMenuItem;
    N1: TUniMenuItem;
    Clear1: TUniMenuItem;
    lblConfirm: TUniLabel;
    edtPassKeyConfirm1: TUniEdit;
    edtPassKeyConfirm2: TUniEdit;
    edtPassKeyConfirm3: TUniEdit;
    TabFinish: TUniTabSheet;
    PnlFinish: TUniPanel;
    imgPassKey1Ok: TUniImage;
    imgPassKey1Error: TUniImage;
    imgPassKey2Ok: TUniImage;
    imgPassKey3Ok: TUniImage;
    imgPassKey2Error: TUniImage;
    imgPassKey3Error: TUniImage;
    imgPassKey1MatchOk: TUniImage;
    imgPassKey1MatchError: TUniImage;
    imgPassKey2MatchOk: TUniImage;
    imgPassKey2MatchError: TUniImage;
    imgPassKey3MatchOk: TUniImage;
    imgPassKey3MatchError: TUniImage;
    TabCryptoperiod: TUniTabSheet;
    PnlCryptoperiodEditCarrier: TUniPanel;
    Splitter3: TUniSplitter;
    PnlCryptoperiodEditLeft01: TUniPanel;
    PnlCryptoperiodEditClient01: TUniPanel;
    Label8: TUniLabel;
    lblReminderDate: TUniLabel;
    edtReminderDate: TUniEdit;
    lblDays: TUniLabel;
    PnlCryptoperiod: TUniPanel;
    cpCryptoperiod: TIQWebCaptionPanel;
    PnlRemove: TUniPanel;
    cpRemove: TIQWebCaptionPanel;
    PnlEditPasswords: TUniPanel;
    cpEdit: TIQWebCaptionPanel;
    Bevel1: TUniPanel;
    Bevel4: TUniPanel;
    cpDone: TIQWebCaptionPanel;
    PnlWelcomeCarrier: TUniPanel;
    PnlSideBar: TUniPanel;
    Bevel7: TUniPanel;
    imgWelcome: TUniImage;
    Bevel10: TUniPanel;
    PnlVersionInfo: TUniPanel;
    lblVInfo_Encrypted_Label: TUniLabel;
    lblVInfo_EncryptedVersion_Label: TUniLabel;
    lblVInfo_EncryptedDate_Label: TUniLabel;
    lblVInfo_EncryptedBy_Label: TUniLabel;
    lblVInfo_Encrypted: TUniLabel;
    lblVInfo_EncryptedVersion: TUniLabel;
    lblVInfo_EncryptedDate: TUniLabel;
    lblVInfo_EncryptedBy: TUniLabel;
    edtCryptoperiodDays: TUniSpinEdit;
    procedure DoEditKeyPress(Sender: TObject; var Key: Char);
    procedure Paste1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure DoEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edtCryptoperiodDaysChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private const
    // Current encryption version
    ENCRYPTION_VERSION = 'AES.2012';
    cUpper = ['A' .. 'Z'];
    cLower = ['a' .. 'z'];
    cNumber = ['0' .. '9'];
    cOther = ['_', '-', '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
      '{', '}', '[', ']', '?', '<', '>', #8];
    cValidChar = cUpper + cLower + cNumber + cOther;
    um_updateCryptoperiodDays = 1;
    /// <summary>Merchant Account fields that are encrypted.</summary>
    encryptedMerchantAccountFields: array [0 .. 17] of string =
      ('AGENT_BANK_NUMBER',
      'AGENT_CHAIN_NUMBER',
      'BANK_ID',
      'DATAWIRE_ID',
      'GROUP_ID',
      'HASH_VALUE',
      'LOGIN_NAME',
      'MERCHANT_ID',
      'MERCHANT_NAME',
      'MERCHANTNO',
      'PARTNER',
      'PASSWORD',
      'STORE_NUMBER',
      'TERMINAL',
      'TERMINAL_ID',
      'TRANS_KEY',
      'USERID',
      'VENDOR'
      );
  private
    { Private declarations }
    FOldKey1, FOldKey2, FOldKey3: string;
    FModified, FIsCurrentlyEncrypted: Boolean;
    FOldKeys: TStringList;
//    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    function NewKey: string;
    function OldKey: string;
    procedure FormatPasswordChar;
    procedure PopulateVars;
    function RequestedOperation: TRequestedOperation;
    procedure UpdateData;
    procedure BuildOldKeyList;
    function RemoveEncryption(const RB: TFDRollbackManager;
      const APrg: TIQWebProgressDialog; var AErrorMsg: string): Boolean;
    function AddEncryption(const RB: TFDRollbackManager; const APrg: TIQWebProgressDialog;
      var AErrorMsg: string): Boolean;
    procedure ValidateNewPasswords;
    procedure SaveOldPasswords;
    procedure CheckUniquePasswords(const APassword1, APassword2,
      APassword3: string);
    procedure EnableTriggersAndConstraints(AEnabled: Boolean);
    function GetMaxCount: Integer;
    procedure UpdateEncryptionVersion;
    function IsStrongPassword(const AValue: string): Boolean;
    procedure UpdateCryptoperiodDaysDisplay;
    function IsOldKey(const AValue: string): Boolean;
    procedure UpdateVersionInfo;
  protected
    { Protected declarations }
    procedure DoButtonClick(AWizardButton: TWizardBtn); override;
    procedure DoFinishAction; override;
    procedure SetButtons; override;
    procedure SetImages;
  public
    { Public declarations }
    destructor Destroy; override;
    function ValidateEntries: Boolean;
    procedure ProcessExec;
  end;

function DoCCEncryptionKey: Boolean;


implementation

{$R *.dfm}


uses
  cc_const,
  cc_encrypt,
  Character,
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  iqsys_rscstr,
  System.Math;

function DoCCEncryptionKey: Boolean;
var
  frm: TFrmIQSysCCEncrypt;
begin
  if not SecurityManager.IsUserDBA then
    raise Exception.Create
      (iqsys_rscstr.cTXT0000032 { 'Access denied.  DBA status required.' } );

  frm := TFrmIQSysCCEncrypt.Create(uniGUIApplication.UniApplication);
  if frm.ShowModal = mrOk then
    frm.ProcessExec;

end;

{ TFrmIQSysCCEncrypt }

procedure TFrmIQSysCCEncrypt.FormCreate(Sender: TObject);
begin
//  inherited;
{ TODO -oLema : Removed the inherited Create.
  The AdjustPageControlToParent doesn't seem to work as expected.
  The problem is when the TabSheet.TabVisible is FALSE. Need to revisit.}

  pcMain.ActivePageIndex := 0;
  pcMain.TabBarVisible := False;

  IQMS.Common.Screen.ApplySystemFont(Self);
  FOldKeys := TStringList.Create;
  cc_encrypt.ResetPackage;
  FormatPasswordChar;
  PopulateVars;
  rbRemove.Enabled := OldKey > '';
  SetButtons;
  SetImages;

end;

procedure TFrmIQSysCCEncrypt.FormShow(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  UpdateVersionInfo;
end;

destructor TFrmIQSysCCEncrypt.Destroy;
begin
  if Assigned(FOldKeys) then
    FreeAndNil(FOldKeys);
  inherited Destroy;
end;


procedure TFrmIQSysCCEncrypt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
  // Rem this line: we do not want caFree to be applied.  Since we
  // hide this form during ProcessExec and then free it from the
  // wrapper, calling caFree only creates problems.  An AV may display.
  // inherited
end;


procedure TFrmIQSysCCEncrypt.FormActivate(Sender: TObject);
begin
  inherited;
  FormatPasswordChar;
end;

procedure TFrmIQSysCCEncrypt.FormatPasswordChar;

// --------------------------------------------------------------------------
  procedure _Proc(AEdit: TUniEdit);
  begin
    // Set the password character
    if Assigned(AEdit) and (Screen.Fonts.IndexOf('Symbol') >= 0) then
      with AEdit do
        begin
          Font.Name := 'Symbol';
          Font.Size := 9;
          Font.Style := [fsBold];
          PasswordChar := #183; // bullet
        end;
  end;
// --------------------------------------------------------------------------

begin
  // 05/08/2015 The "old password" list will never be visible.
  // EIQ-7075 Credit Card - clear encryption passwords CRM 1261004 Tailor Made
  // _Proc(edtOldPassKey1);
  // _Proc(edtOldPassKey2);
  // _Proc(edtOldPassKey3);

  _Proc(edtPassKey1);
  _Proc(edtPassKey2);
  _Proc(edtPassKey3);

  _Proc(edtPassKeyConfirm1);
  _Proc(edtPassKeyConfirm2);
  _Proc(edtPassKeyConfirm3);

  _Proc(edtPassKeyRemove1);
  _Proc(edtPassKeyRemove2);
  _Proc(edtPassKeyRemove3);

end;

procedure TFrmIQSysCCEncrypt.DoFinishAction;
begin
  inherited;

  // if ValidateEntries then
  ModalResult := mrOk;

end;

procedure TFrmIQSysCCEncrypt.edtCryptoperiodDaysChange(Sender: TObject);
begin
//  Application.ProcessMessages;
//  PostMessage(Handle, iq_Notify, um_updateCryptoperiodDays, 0);
  UpdateCryptoperiodDaysDisplay;
end;

procedure TFrmIQSysCCEncrypt.PopulateVars;
begin
  // get the separate key values
  cc_encrypt.GetEncryptionKeys(FOldKey1, FOldKey2, FOldKey3);
  // update the edit controls
  { edtPassKey1.Text := FOldKey1;
    edtPassKey2.Text := FOldKey2;
    edtPassKey3.Text := FOldKey3; }
  FIsCurrentlyEncrypted := cc_encrypt.HasEncryption;
  // 05/08/2015 Never show the "old password" list.  We want to allow
  // customer administrators just to replace the passwords without
  // knowing the old passwords.
  // EIQ-7075 Credit Card - clear encryption passwords CRM 1261004 Tailor Made
  PnlOldPassword.Visible := False; // OldKey > '';
  // lblNewPassword.Visible := PnlOldPassword.Visible;
  // IQMS.Common.Controls.IQEnableControl(edtOldPassKey1, FOldKey1 > '');
  // IQMS.Common.Controls.IQEnableControl(edtOldPassKey2, FOldKey2 > '');
  // IQMS.Common.Controls.IQEnableControl(edtOldPassKey3, FOldKey3 > '');
  edtCryptoperiodDays.Value := SelectValueAsInteger(
    'SELECT NVL(cryptoperiod_days, 0) FROM credit_card_setting ' +
    'WHERE ROWNUM < 2');
  UpdateCryptoperiodDaysDisplay;
  BuildOldKeyList;
end;

function TFrmIQSysCCEncrypt.ValidateEntries: Boolean;
begin
  Result := False;

  // For add and edit; not removing encryption.
  if RequestedOperation = rqaModify then
    begin
      // Ensure that user has entered the new passwords
      if (edtPassKey1.Text = '') then
        begin
          if edtPassKey1.CanFocus then
            edtPassKey1.SetFocus;
          // 'Please enter a New Password value for Password %d.'
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000046, [1]);
        end;
      if (edtPassKey2.Text = '') then
        begin
          if edtPassKey2.CanFocus then
            edtPassKey2.SetFocus;
          // 'Please enter a New Password value for Password %d.'
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000046, [2]);
        end;
      if (edtPassKey3.Text = '') then
        begin
          if edtPassKey3.CanFocus then
            edtPassKey3.SetFocus;
          // 'Please enter a New Password value for Password %d.'
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000046, [3]);
        end;

      // Ensure that user has entered the new passwords
      if (edtPassKeyConfirm1.Text = '') then
        begin
          if edtPassKeyConfirm1.CanFocus then
            edtPassKeyConfirm1.SetFocus;
          // 'Please confirm the value for Password %d.';
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000047, [1]);
        end;
      if (edtPassKeyConfirm2.Text = '') then
        begin
          if edtPassKeyConfirm2.CanFocus then
            edtPassKeyConfirm2.SetFocus;
          // 'Please confirm the value for Password %d.';
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000047, [2]);
        end;
      if (edtPassKeyConfirm3.Text = '') then
        begin
          if edtPassKeyConfirm3.CanFocus then
            edtPassKeyConfirm3.SetFocus;
          // 'Please confirm the value for Password %d.';
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000047, [3]);
        end;

      // If we are changing keys...
      // Ensure that the user has confirmed the new passwords correctly
      if (edtPassKeyConfirm1.Text <> edtPassKey1.Text) then
        begin
          if edtPassKeyConfirm1.CanFocus then
            edtPassKeyConfirm1.SetFocus;
          { 'New Password %d is incorrect.  ' +
            'It is not the same as your confirmation password.' }
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000048, [1]);
        end;
      if (edtPassKeyConfirm2.Text <> edtPassKey2.Text) then
        begin
          if edtPassKeyConfirm2.CanFocus then
            edtPassKeyConfirm2.SetFocus;
          { 'New Password %d is incorrect.  ' +
            'It is not the same as your confirmation password.' }
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000048, [2]);
        end;
      if (edtPassKeyConfirm3.Text <> edtPassKey3.Text) then
        begin
          if edtPassKeyConfirm3.CanFocus then
            edtPassKeyConfirm3.SetFocus;
          { 'New Password %d is incorrect.  ' +
            'It is not the same as your confirmation password.' }
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000048, [3]);
        end;

      // 05/08/2015 Do not evaluate the "old password" list.  We want to allow
      // customer administrators just to replace the passwords without
      // knowing the old passwords.
      // EIQ-7075 Credit Card - clear encryption passwords CRM 1261004 Tailor Made
      // Ensure that the user has entered the old passwords correctly
      { if (FOldKey1 > '') and (edtOldPassKey1.Text <> FOldKey1) then
        begin
        if edtOldPassKey1.CanFocus then
        edtOldPassKey1.SetFocus;
        // 'Entry for Old Password %d does not match the recorded password.'
        raise Exception.CreateFmt(iqsys_rscstr.cTXT0000049, [1]);
        end;
        if (FOldKey2 > '') and (edtOldPassKey2.Text <> FOldKey2) then
        begin
        if edtOldPassKey2.CanFocus then
        edtOldPassKey2.SetFocus;
        // 'Entry for Old Password %d does not match the recorded password.'
        raise Exception.CreateFmt(iqsys_rscstr.cTXT0000049, [2]);
        end;
        if (FOldKey3 > '') and (edtOldPassKey3.Text <> FOldKey3) then
        begin
        if edtOldPassKey3.CanFocus then
        edtOldPassKey3.SetFocus;
        // 'Entry for Old Password %d does not match the recorded password.'
        raise Exception.CreateFmt(iqsys_rscstr.cTXT0000049, [3]);
        end; }

      // If there is no change, then prompt user
      if (OldKey > '') and (OldKey = NewKey) then
        { 'The key values have not changed.  Please either ' +
          'set new key values, or click Cancel.' }
        raise Exception.Create(iqsys_rscstr.cTXT0000033);

      // Ensure each password is unique
      CheckUniquePasswords(edtPassKey1.Text, edtPassKey2.Text,
        edtPassKey3.Text);

      // Ensure the passwords are new
      ValidateNewPasswords;

    end
  else
    begin
      // We are planning on removing encryption.  Check the password values
      // for removing encryption.  Do they match the old passwords?
      if (FOldKey1 > '') and (edtPassKeyRemove1.Text <> FOldKey1) then
        begin
          if edtPassKeyRemove1.CanFocus then
            edtPassKeyRemove1.SetFocus;
          // 'Entry for Old Password %d does not match the recorded password.'
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000049, [1]);
        end;
      if (FOldKey2 > '') and (edtPassKeyRemove2.Text <> FOldKey2) then
        begin
          if edtPassKeyRemove2.CanFocus then
            edtPassKeyRemove2.SetFocus;
          // 'Entry for Old Password %d does not match the recorded password.'
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000049, [2]);
        end;
      if (FOldKey3 > '') and (edtPassKeyRemove3.Text <> FOldKey3) then
        begin
          if edtPassKeyRemove3.CanFocus then
            edtPassKeyRemove3.SetFocus;
          // 'Entry for Old Password %d does not match the recorded password.'
          raise Exception.CreateFmt(iqsys_rscstr.cTXT0000049, [3]);
        end;

      // Ensure each password is unique
      CheckUniquePasswords(edtPassKeyRemove1.Text, edtPassKeyRemove2.Text,
        edtPassKeyRemove3.Text);

    end;

  Result := True;
end;

procedure TFrmIQSysCCEncrypt.CheckUniquePasswords(const APassword1, APassword2,
  APassword3: string);
var
  AError: string;
  AList: TStringList;
begin

  AList := nil;

  if (APassword1 = '') or (APassword2 = '') or (APassword3 = '') then
    { 'Application Error: Validation for uniqueness ' +
      'encountered empty password value.' }
    raise Exception.Create(iqsys_rscstr.cTXT0000077);

  try
    AList := TStringList.Create;
    try
      AList.Sorted := True;
      AList.Duplicates := dupError; // yes, raise error

      AError := iqsys_rscstr.cTXT0000078; // 'Unknown error.'
      AList.Add(APassword1);

      AError := Format
        (iqsys_rscstr.cTXT0000050 { 'Password %d is not unique.' } , [2]);
      AList.Add(APassword2);

      AError := Format
        (iqsys_rscstr.cTXT0000050 { 'Password %d is not unique.' } , [3]);
      AList.Add(APassword3);

    except
      on E: Exception do
        raise Exception.Create(AError);
    end;
  finally
    if Assigned(AList) then
      AList.Free;
  end;
end;

function TFrmIQSysCCEncrypt.NewKey: string;
begin
  Result := edtPassKey1.Text + edtPassKey2.Text + edtPassKey3.Text;
end;

function TFrmIQSysCCEncrypt.OldKey: string;
var
  AKey1, AKey2, AKey3, AKey4: string;
begin
  cc_encrypt.GetEncryptionKeys(AKey1, AKey2, AKey3);
  Result := AKey1 + AKey2 + AKey3;
end;

procedure TFrmIQSysCCEncrypt.ProcessExec;
begin

  case RequestedOperation of
    rqaModify:
      begin
        { 'Have you stored your passwords in a secure location?  ' +
          'You will not be able to access them from this screen.' }
        if not IQConfirmYN(iqsys_rscstr.cTXT0000051) then
          Exit;

        // 'Begin encryption process now?'
//        Winapi.Windows.MessageBeep(MB_ICONQUESTION);
        if not IQMS.Common.Dialogs.IQConfirmYN(iqsys_rscstr.cTXT0000036) then
          Exit;

        UpdateData;
      end;
    rqaRemoveOnly:
      begin
//        Winapi.Windows.MessageBeep(MB_ICONQUESTION);
        { 'Encrypted values will now be decrypted.  This will ' +
          'present a serious security hazard.  Continue?' }
        if not IQConfirmYN(iqsys_rscstr.cTXT0000043) then
          Exit;
        UpdateData;
      end;
  end;
end;

procedure TFrmIQSysCCEncrypt.EnableTriggersAndConstraints(AEnabled: Boolean);
var
  AErrorMsg: string;
begin
  EnableTrigger('TUA_IQSYS_CRM', AEnabled, AErrorMsg);
  EnableTrigger('TU_IQSYS_ICT', AEnabled, AErrorMsg);
  EnableConstraints('CREDIT_CARD_ACCOUNT', AEnabled, AErrorMsg);
  EnableTrigger('T2_ARCUSTO_CREDIT_CARD', AEnabled, AErrorMsg);
  EnableConstraints('ARCUSTO_CREDIT_CARD', AEnabled, AErrorMsg);
  EnableTrigger('T2_CREDIT_CARD_TRANS', AEnabled, AErrorMsg);
  EnableConstraints('CREDIT_CARD_TRANS', AEnabled, AErrorMsg);
  EnableConstraints('CREDIT_CARD_LOG', AEnabled, AErrorMsg);

  ResolveDependencies;
end;

function TFrmIQSysCCEncrypt.GetMaxCount: Integer;
begin
  Result := 0;
  Result := Trunc(SelectValueAsFloat('SELECT COUNT(*) FROM credit_card_trans'));
  Result := Result + Trunc(SelectValueAsFloat('SELECT COUNT(*) FROM arcusto_credit_card'));
  Result := Result + Trunc(SelectValueAsFloat('SELECT COUNT(*) FROM credit_card_log'));
  Result := Result + Trunc(SelectValueAsFloat('SELECT COUNT(*) FROM credit_card_account'));
  Result := Result + Trunc(SelectValueAsFloat('SELECT COUNT(*) FROM credit_card_account_dtl'));
end;

function TFrmIQSysCCEncrypt.IsOldKey(const AValue: string): Boolean;
begin
  if not Assigned(FOldKeys) then
    Exit(False);
  Result := FOldKeys.IndexOf(AValue) > - 1;
end;

procedure TFrmIQSysCCEncrypt.BuildOldKeyList;
var
  ALine, AKey1, AKey2, AKey3: string;
begin
  if not Assigned(FOldKeys) then
    FOldKeys := TStringList.Create;
  FOldKeys.Clear;
  with TFDQuery.Create(nil) do
    try
        ConnectionName := cnstFDConnectionName;
        SQL.Add('SELECT key');
        SQL.Add('  FROM (  SELECT iqms.iqcrypto.get_decrypted(:PASSWORD, key) AS key');
        SQL.Add('            FROM credit_card_key');
        SQL.Add('        ORDER BY id DESC)');
        SQL.Add(' WHERE ROWNUM < 5');
        ParamByName('PASSWORD').Value := cc_const.CCENCRYPT_PASSWORD;
        Open;
        while not EOF do
          begin
            ALine := Fields[0].AsString;
            AKey1 := IQMS.Common.StringUtils.GetToken(ALine, #13, 1);
            AKey2 := IQMS.Common.StringUtils.GetToken(ALine, #13, 2);
            AKey3 := IQMS.Common.StringUtils.GetToken(ALine, #13, 3);
            if not IQMS.Common.StringUtils.IsEmpty(AKey1) then
              FOldKeys.Add(AKey1);
            if not IQMS.Common.StringUtils.IsEmpty(AKey2) then
              FOldKeys.Add(AKey2);
            if not IQMS.Common.StringUtils.IsEmpty(AKey3) then
              FOldKeys.Add(AKey3);
            Next;
          end;
    finally
      Free;
    end;
end;

procedure TFrmIQSysCCEncrypt.UpdateData;
var
  hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
  i, AMax, ATime: Integer;
  q: TFDQuery;
  RB: TFDRollbackManager;
  ASuccess: Boolean;
  AErrorMsg, ADebugMsg: string;

  procedure _resetPackage;
  begin
    RB.ExecuteCommandParam(
      'BEGIN'#13 +
      '   iqms.cc_encrypt.reset;'#13 +
      '   iqms.cc_encrypt.set_iqms_hash_secret('#13 +
      '      :HASH_SECRET);'#13 +
      'END;',
      ['HASH_SECRET;S'],
      [cc_const.CC_ENCRYPT_HASH_KEY]);
  end;

begin

  // Initialization
  ASuccess := True;
  hPrg := nil;

  // Get the max value.  If we have nothing to modify,
  // then exit early.
  AMax := GetMaxCount;

  // If we're encrypting, let the user know how long it will take
  if (AMax > 0) and (RequestedOperation = rqaModify) then
    begin
      // If we are both removing and encrypting, then double the count.
      if FIsCurrentlyEncrypted then
        AMax := AMax * 2;

      // Get the time this process will take (yawn)
      ATime := ((AMax div 100) * 5) div 60;
      if ATime = 0 then
        ATime := 1;

//      Winapi.Windows.MessageBeep(MB_ICONQUESTION);
      { 'The encryption process will now begin.  The ' +
        'process will take approximately %d minute(s) with %d records modified.  It ' +
        'is recommended that users stay out of areas where credit card data might ' +
        'be modified, such as Accounts Receivable, Sales Orders, Credit Card ' +
        'Charges, Customer Credit Cards and Credit Card Settlements.  Continue?' }
      if not IQConfirmYN(Format(iqsys_rscstr.cTXT0000038, [ATime, AMax])) then
        Exit;
    end;

  try
    try
      RB := TFDRollbackManager.Create('RB_CCENCRYPT');
      RB.Associate(True);
      ADebugMsg := '';

      // Create the Progress Dialog box
      if RequestedOperation = rqaModify then
        // iqsys_rscstr.cTXT0000044 = 'Encrypting data.  Please wait.'
        hPrg := hProgressDlg(AMax, iqsys_rscstr.cTXT0000044)
      else
        // iqsys_rscstr.cTXT0000045 = 'Decrypting data.  Please wait.'
        hPrg := hProgressDlg(AMax, iqsys_rscstr.cTXT0000045);
      // No cancel button allowed
      hPrg.CancelBtn.Enabled := False;
//      Application.ProcessMessages;

      // Disable relevant triggers and constraints
      // Note:  We must do this before calling StartTransaction below.
      // If we modify Oracle objects like this, then Commit is
      // immediately called; we will not be able to roll back.
      EnableTriggersAndConstraints(False);
      AErrorMsg := '';

      RB.StartTransaction;

      // 03/05/2012 Refresh the cipher objects; make sure we have most
      // recent changes.
      _resetPackage;

      // Save the old passwords to the database for future reference
      if RequestedOperation = rqaModify then
        SaveOldPasswords;

      // 01/03/2013 Update the cryptoperiod
      if RequestedOperation = rqaModify then
        RB.ExecuteCommandFmt('UPDATE credit_card_setting SET cryptoperiod_days = %d ' +
          'WHERE ROWNUM < 2', [edtCryptoperiodDays.Value]);

      // Hide the main form
      Self.Hide;

      // Always remove encryption.  If we are changing the passwords,
      // we must first remove the old encryption
      if FIsCurrentlyEncrypted then
        begin
          ASuccess := RemoveEncryption(RB, hPrg, ADebugMsg);
          // If the only thing we are doing is removing encryption,
          // then reset the hash key, and we are done.
          if ASuccess and (RequestedOperation = rqaRemoveOnly) then
            begin
              RB.ExecuteCommand('UPDATE credit_card_setting SET hash_key = NULL ' +
                'WHERE ROWNUM < 2');
              // Save all changes
              RB.Commit;
              _resetPackage;
              UpdateEncryptionVersion;
//              Beep;
              // 'Process completed successfully.'
              IQInformation(iqsys_rscstr.cTXT0000039);
              // Done, and we're out of here.
              Exit;
            end;
        end;

      // If we are setting new keys, then we save the new key within the
      // transaction and re-encrypt
      if ASuccess then
        begin
          cc_encrypt.SaveEncryptionKeys(edtPassKey1.Text, edtPassKey2.Text,
            edtPassKey3.Text);

          // Now that we have saved the new keys to the database, we're
          // ready encrypt.  Remember, at this point, all of the data is
          // wide open.  We have to save the keys to the database first,
          // reset the package, and then the go from there because the
          // package does the work of encryption.
          _resetPackage;

          ASuccess := AddEncryption(RB, hPrg, ADebugMsg);
        end;

      ADebugMsg := '';
      if ASuccess then
        begin
          RB.Commit;
          UpdateEncryptionVersion;
        end;

    finally
      ASuccess := not RB.InTransaction;
      RB.CheckRollBack;

      if Assigned(q) then
        FreeAndNil(q);
      if Assigned(RB) then
        FreeAndNil(RB);

      // Restore database objects
      // Note: This must be called last, after the Transaction checks.
      EnableTriggersAndConstraints(True);

      if Assigned(hPrg) then
        FreeAndNil(hPrg);
    end;
  except
    on E: Exception do
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise Exception.CreateFmt('%s'#13'%s', [ADebugMsg, E.Message]);
  end;

  Beep;

  if ASuccess then
    // 'Process completed successfully.'
    IQInformation(iqsys_rscstr.cTXT0000039)
  else
    // 'Operation cancelled.'
    IQInformation(iqsys_rscstr.cTXT0000040);

end;

procedure TFrmIQSysCCEncrypt.UpdateEncryptionVersion;
begin
  ExecuteCommand('BEGIN iqms.cc_encrypt.update_encryption_version; END;');
end;

procedure TFrmIQSysCCEncrypt.UpdateVersionInfo;
var
  ALeft: Integer;
  ASystemFontName: string;
begin
  if TableFieldExists('credit_card_setting', 'encrypted_version') then
    try
      with TFDQuery.Create(nil) do
      try
        ConnectionName := cnstFDConnectionName;
        SQL.Add('SELECT encrypted,');
        SQL.Add('       encrypted_version,');
        SQL.Add('       encrypted_date,');
        SQL.Add('       encrypted_by');
        SQL.Add('  FROM credit_card_setting');
        SQL.Add(' WHERE ROWNUM < 2');
        Open;
        if not (Bof and Eof) then
          begin
            // Assign version data to labels
            lblVInfo_Encrypted.Caption := IQMS.Common.Boolean.TIQBoolean.AsYesNo(Fields[0].AsString = 'Y');
            lblVInfo_EncryptedVersion.Caption := Fields[1].AsString;
            lblVInfo_EncryptedDate.Caption := FormatDateTime('ddddd tt',Fields[2].AsDateTime);
            lblVInfo_EncryptedBy.Caption := Fields[3].AsString;

            // Get the system font name for re-use
            ASystemFontName := IQMS.Common.Screen.SystemFontName;

            // Ensure system font is assigned
            lblVInfo_Encrypted.Font.Name := ASystemFontName;
            lblVInfo_EncryptedVersion.Font.Name := ASystemFontName;
            lblVInfo_EncryptedDate.Font.Name := ASystemFontName;
            lblVInfo_EncryptedBy.Font.Name := ASystemFontName;
            lblVInfo_Encrypted_Label.Font.Name := ASystemFontName;
            lblVInfo_EncryptedVersion_Label.Font.Name := ASystemFontName;
            lblVInfo_EncryptedDate_Label.Font.Name := ASystemFontName;
            lblVInfo_Encrypted_Label.Font.Name := ASystemFontName;

            // Get the left position of the field labels.  This compensates
            // for localization, in case the text length changed.
            ALeft := System.Math.MaxIntValue([
             lblVInfo_Encrypted_Label.Width,
             lblVInfo_EncryptedVersion_Label.Width,
             lblVInfo_EncryptedDate_Label.Width,
             lblVInfo_EncryptedBy_Label.Width]) +
             lblVInfo_Encrypted_Label.Left + 16;

            // Set the spacing
            lblVInfo_Encrypted.Left := ALeft;
            lblVInfo_EncryptedVersion.Left := ALeft;
            lblVInfo_EncryptedDate.Left := ALeft;
            lblVInfo_EncryptedBy.Left := ALeft;

            // Label visibility
            lblVInfo_EncryptedDate.Visible := Fields[0].AsString = 'Y';
            lblVInfo_EncryptedBy.Visible := Fields[0].AsString = 'Y';
            lblVInfo_EncryptedVersion.Visible := Fields[0].AsString = 'Y';

            // Show the panel
            PnlVersionInfo.Visible := True;
          end;
      finally
        Free;
      end;
    except
      // Suppress any uncaught errors, in case of version
      // differences.  Not all versions will have these fields.
      PnlVersionInfo.Visible := False;
    end;
end;

function TFrmIQSysCCEncrypt.RemoveEncryption(const RB: TFDRollbackManager;
  const APrg: TIQWebProgressDialog; var AErrorMsg: string): Boolean;
var
  q: TFDQuery;
begin
  Result := False;
  try
    try
      q := TFDQuery.Create(nil);
      q.ConnectionName := cnstFDConnectionName;

      // CREDIT_CARD_ACCOUNT_DTL
      AErrorMsg := 'Error modifying System Parameters.';
      q.SQL.Add('SELECT id, code, value');
      q.SQL.Add('FROM credit_card_account_dtl');
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg := Format('Error modifying System Parameters. ' +
            '[Code: %s]', [q.FieldByName('CODE').AsString]);
          // Encrypt only these code values
          if IQMS.Common.StringUtils.StrInList(q.FieldByName('CODE').AsString,
            encryptedMerchantAccountFields) then
            RB.ExecuteCommandFmt('UPDATE credit_card_account_dtl ' +
              'SET value = iqms.cc_encrypt.get_decrypted(value) ' +
              'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      // ARCUSTO_CREDIT_CARD
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT id FROM arcusto_credit_card ORDER BY id');
      AErrorMsg := 'Error modifying Customer Credit Card.';
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg :=
            Format('Error modifying Customer Credit Card [Record ID = %d]',
            [q.FieldByName('ID').AsInteger]);
          RB.ExecuteCommandFmt('UPDATE arcusto_credit_card SET '#13 +
            'acctno = iqms.cc_encrypt.get_decrypted(acctno), ' +
            'name_on = iqms.cc_encrypt.get_decrypted(name_on), ' +
            'exp_mmyy = iqms.cc_encrypt.get_decrypted(exp_mmyy) ' +
            'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          // Next record
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      // CREDIT_CARD_TRANS
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT id FROM credit_card_trans ORDER BY id');
      AErrorMsg := 'Error modifying Credit Card Transactions.';
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg :=
            Format('Error modifying Credit Card Transactions [Record ID = %d]',
            [q.FieldByName('ID').AsInteger]);
          // Encrypt data
          RB.ExecuteCommandFmt('UPDATE credit_card_trans SET ' +
            'card_number = iqms.cc_encrypt.get_decrypted(card_number), ' +
            'card_exp = iqms.cc_encrypt.get_decrypted(card_exp), ' +
            'card_addr = iqms.cc_encrypt.get_decrypted(card_addr), ' +
            'card_zip = iqms.cc_encrypt.get_decrypted(card_zip), ' +
            'response_data = iqms.cc_encrypt.get_decrypted_clob(response_data) ' +
            'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          // Next record
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      // CREDIT_CARD_LOG
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT id FROM credit_card_log ORDER BY ID');
      AErrorMsg := 'Error modifying Credit Card Log.';
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg :=
            Format('Error modifying Credit Card Log [Record ID = %d]',
            [q.FieldByName('ID').AsInteger]);
          RB.ExecuteCommandFmt('UPDATE credit_card_log SET ' +
            'text = iqms.cc_encrypt.get_decrypted_clob(text), ' +
            'requestdata = iqms.cc_encrypt.get_decrypted_clob(REQUESTDATA), ' +
            'responsedata = iqms.cc_encrypt.get_decrypted_clob(RESPONSEDATA), ' +
            'merchantdata = iqms.cc_encrypt.get_decrypted_clob(MERCHANTDATA) ' +
            'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      AErrorMsg := '';
      Result := True;
    finally
      if Assigned(q) then
        FreeAndNil(q);
    end;
  except
    on E: Exception do
      begin
        raise Exception.CreateFmt('%s'#13'%s', [AErrorMsg, E.Message]);
      end;
  end;
end;

function TFrmIQSysCCEncrypt.AddEncryption(const RB: TFDRollbackManager;
  const APrg: TIQWebProgressDialog; var AErrorMsg: string): Boolean;
var
  q: TFDQuery;
begin
  Result := False;
  try
    try
      q := TFDQuery.Create(nil);
      q.ConnectionName := cnstFDConnectionName;

      // CREDIT_CARD_ACCOUNT_DTL
      AErrorMsg := 'Error modifying System Parameters.';
      q.SQL.Add('SELECT id, code, value');
      q.SQL.Add('FROM credit_card_account_dtl');
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg := Format('Error modifying System Parameters. ' +
            '[Code: %s]', [q.FieldByName('CODE').AsString]);
          // Encrypt only these code values
          if IQMS.Common.StringUtils.StrInList(q.FieldByName('CODE').AsString,
            encryptedMerchantAccountFields) then
            RB.ExecuteCommandFmt('UPDATE credit_card_account_dtl ' +
              'SET value = iqms.cc_encrypt.get_encrypted(value) ' +
              'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      // ARCUSTO_CREDIT_CARD
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT id FROM arcusto_credit_card ORDER BY id');
      AErrorMsg := 'Error modifying Customer Credit Card.';
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg :=
            Format('Error modifying Customer Credit Card [Record ID = %d]',
            [q.FieldByName('ID').AsInteger]);
          // 12/27/2012 Encrypt only the PAN.  Do not encrypt the
          // card holder name or expiration date.
          RB.ExecuteCommandFmt('UPDATE arcusto_credit_card SET '#13 +
            'acctno = iqms.cc_encrypt.get_encrypted(acctno) ' +
            'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          // Next record
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      // CREDIT_CARD_TRANS
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT id FROM credit_card_trans ORDER BY id');
      AErrorMsg := 'Error modifying Credit Card Transactions.';
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg :=
            Format('Error modifying Credit Card Transactions [Record ID = %d]',
            [q.FieldByName('ID').AsInteger]);
          // Encrypt data
          // 12/27/2012 Encrypt only the PAN.  Do not encrypt the
          // card holder name or expiration date.
          RB.ExecuteCommandFmt('UPDATE credit_card_trans SET ' +
            'card_number = iqms.cc_encrypt.get_encrypted(card_number), ' +
            'response_data = iqms.cc_encrypt.get_encrypted_clob(response_data) ' +
            'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          // Next record
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      // CREDIT_CARD_LOG
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('SELECT id FROM credit_card_log ORDER BY ID');
      AErrorMsg := 'Error modifying Credit Card Log.';
      q.Open;
      while not q.EOF do
        begin
          AErrorMsg :=
            Format('Error modifying Credit Card Log [Record ID = %d]',
            [q.FieldByName('ID').AsInteger]);
          RB.ExecuteCommandFmt('UPDATE credit_card_log SET ' +
            'text = iqms.cc_encrypt.get_encrypted_clob(text), ' +
            'requestdata = iqms.cc_encrypt.get_encrypted_clob(REQUESTDATA), ' +
            'responsedata = iqms.cc_encrypt.get_encrypted_clob(RESPONSEDATA), ' +
            'merchantdata = iqms.cc_encrypt.get_encrypted_clob(MERCHANTDATA) ' +
            'WHERE id = %d', [q.FieldByName('ID').AsInteger]);
          q.Next;
          // Step progress bar
          APrg.StepProgress;
//          Application.ProcessMessages;
        end;

      AErrorMsg := '';
      Result := True;
    finally
      if Assigned(q) then
        FreeAndNil(q);
    end;
  except
    on E: Exception do
      begin
        raise Exception.CreateFmt('%s'#13'%s', [AErrorMsg, E.Message]);
      end;
  end;
end;

procedure TFrmIQSysCCEncrypt.SetButtons;
var
  AEnabled: Boolean;
begin
  inherited;

  case RequestedOperation of
    rqaModify:
      AEnabled := (edtPassKey1.Text > '') and (edtPassKey2.Text > '') and
        (edtPassKey2.Text > '');
    rqaRemoveOnly:
      AEnabled := (edtPassKeyRemove1.Text > '') and
        (edtPassKeyRemove2.Text > '') and (edtPassKeyRemove3.Text > '');
  end; // end case

  btnFinish.Enabled := AEnabled and (pcMain.ActivePage = TabFinish);

  // Display the appropriate prompt
  // iqsys_rscstr.cTXT0000115 =
  // 'Enter the passwords that will be used for encryption.  ' +
  // 'Be sure to record the passwords in a secure location because you will ' +
  // 'need them if you wish to change them or remove encryption at a later ' +
  // 'date.';
  // iqsys_rscstr.cTXT0000116 =
  // 'Enter the old passwords, and the new passwords.  The old ' +
  // 'passwords must be entered correctly before new passwords will be ' +
  // 'applied.  Be sure to record the new passwords in a secure location ' +
  // 'because you will need them if you wish to change them or remove ' +
  // 'encryption at a later date.';
  // iqsys_rscstr.cTXT0000117 =
  // 'Note:  Passwords are case-sensitive.  They must be from ' +
  // '7 to 30  characters long, and contain both characters and numbers.';
  // if Trim(FOldKey1 + FOldKey2 + FOldKey3) = '' then
  // cpEdit.Text := iqsys_rscstr.cTXT0000115
  // else
  // cpEdit.Text := iqsys_rscstr.cTXT0000116;
  // cpEdit.Text := cpEdit.Text + #13#13 + iqsys_rscstr.cTXT0000117;
end;

procedure TFrmIQSysCCEncrypt.SetImages;
var
  ALeft, ATop: Integer;
begin
  IQMS.Common.Controls.IQHideControls([imgPassKey1Ok, imgPassKey1Error,
    imgPassKey2Ok, imgPassKey2Error, imgPassKey3Ok, imgPassKey3Error,
    imgPassKey1MatchOk, imgPassKey1MatchError,
    imgPassKey2MatchOk, imgPassKey2MatchError,
    imgPassKey3MatchOk, imgPassKey3MatchError]);
  // Password 1
  imgPassKey1Ok.Left := edtPassKey1.Left + edtPassKey1.Width + 2;
  imgPassKey1Ok.Top := edtPassKey1.Top + 2;
  imgPassKey1Error.Left := imgPassKey1Ok.Left;
  imgPassKey1Error.Top := imgPassKey1Ok.Top;
  imgPassKey1Ok.Visible := not IQMS.Common.StringUtils.IsEmpty(edtPassKey1.Text) and
    IsStrongPassword(edtPassKey1.Text);
  imgPassKey1Error.Visible := not IQMS.Common.StringUtils.IsEmpty(edtPassKey1.Text) and
    not imgPassKey1Ok.Visible;
  // Password 2
  imgPassKey2Ok.Left := edtPassKey2.Left + edtPassKey2.Width + 2;
  imgPassKey2Ok.Top := edtPassKey2.Top + 2;
  imgPassKey2Error.Left := imgPassKey2Ok.Left;
  imgPassKey2Error.Top := imgPassKey2Ok.Top;
  imgPassKey2Ok.Visible := not IQMS.Common.StringUtils.IsEmpty(edtPassKey2.Text) and
    IsStrongPassword(edtPassKey2.Text);
  imgPassKey2Error.Visible := not IQMS.Common.StringUtils.IsEmpty(edtPassKey2.Text) and
    not imgPassKey2Ok.Visible;
  // Password 3
  imgPassKey3Ok.Left := edtPassKey3.Left + edtPassKey3.Width + 2;
  imgPassKey3Ok.Top := edtPassKey3.Top + 2;
  imgPassKey3Error.Left := imgPassKey3Ok.Left;
  imgPassKey3Error.Top := imgPassKey3Ok.Top;
  imgPassKey3Ok.Visible := not IQMS.Common.StringUtils.IsEmpty(edtPassKey3.Text) and
    IsStrongPassword(edtPassKey3.Text);
  imgPassKey3Error.Visible := not IQMS.Common.StringUtils.IsEmpty(edtPassKey3.Text) and
    not imgPassKey3Ok.Visible;

  // Confirm Password 1
  imgPassKey1MatchOk.Left := edtPassKeyConfirm1.Left +
    edtPassKeyConfirm1.Width + 2;
  imgPassKey1MatchOk.Top := edtPassKeyConfirm1.Top + 2;
  imgPassKey1MatchError.Left := imgPassKey1MatchOk.Left;
  imgPassKey1MatchError.Top := imgPassKey1MatchOk.Top;
  imgPassKey1MatchOk.Visible := edtPassKeyConfirm1.Visible and
    not IQMS.Common.StringUtils.IsEmpty(edtPassKeyConfirm1.Text) and
    (edtPassKey1.Text = edtPassKeyConfirm1.Text);
  imgPassKey1MatchError.Visible := edtPassKeyConfirm1.Visible and
    not IQMS.Common.StringUtils.IsEmpty(edtPassKeyConfirm1.Text)
    and not imgPassKey1MatchOk.Visible;
  // Confirm Password 2
  imgPassKey2MatchOk.Left := edtPassKeyConfirm2.Left +
    edtPassKeyConfirm2.Width + 2;
  imgPassKey2MatchOk.Top := edtPassKeyConfirm2.Top + 2;
  imgPassKey2MatchError.Left := imgPassKey2MatchOk.Left;
  imgPassKey2MatchError.Top := imgPassKey2MatchOk.Top;
  imgPassKey2MatchOk.Visible := edtPassKeyConfirm2.Visible and
    not IQMS.Common.StringUtils.IsEmpty(edtPassKeyConfirm2.Text)
    and (edtPassKey2.Text = edtPassKeyConfirm2.Text);
  imgPassKey2MatchError.Visible := edtPassKeyConfirm2.Visible and
    not IQMS.Common.StringUtils.IsEmpty(edtPassKeyConfirm2.Text)
    and not imgPassKey2MatchOk.Visible;
  // Confirm Password 3
  imgPassKey3MatchOk.Left := edtPassKeyConfirm3.Left +
    edtPassKeyConfirm3.Width + 2;
  imgPassKey3MatchOk.Top := edtPassKeyConfirm3.Top + 2;
  imgPassKey3MatchError.Left := imgPassKey3MatchOk.Left;
  imgPassKey3MatchError.Top := imgPassKey3MatchOk.Top;
  imgPassKey3MatchOk.Visible := edtPassKeyConfirm3.Visible and
    not IQMS.Common.StringUtils.IsEmpty(edtPassKeyConfirm3.Text)
    and (edtPassKey3.Text = edtPassKeyConfirm3.Text);
  imgPassKey3MatchError.Visible := edtPassKeyConfirm3.Visible and
    not IQMS.Common.StringUtils.IsEmpty(edtPassKeyConfirm3.Text)
    and not imgPassKey3MatchOk.Visible;
end;

procedure TFrmIQSysCCEncrypt.UpdateCryptoperiodDaysDisplay;
begin
  edtReminderDate.Text := '';
  if edtCryptoperiodDays.Value > 0 then
    edtReminderDate.Text := FormatDateTime('ddddd',
      Date + edtCryptoperiodDays.Value);
end;

procedure TFrmIQSysCCEncrypt.DoButtonClick(AWizardButton: TWizardBtn);
var
  i: Integer;
begin
  // Each wizard button calls this, pass the appropriate TWizardBtn value
//  Application.ProcessMessages; // let the button click finish
  case AWizardButton of
    wbPrior: // Prior
      begin
        // i := pcMain.ActivePageIndex - 1;
        // if i >= 0 then pcMain.ActivePageIndex := i;

        if (pcMain.ActivePage = TabEdit) or (pcMain.ActivePage = TabRemove) then
          pcMain.ActivePage := TabOption

        else if (pcMain.ActivePage = TabCryptoperiod) then
          case RequestedOperation of
            rqaModify:
              pcMain.ActivePage := TabEdit;
            rqaRemoveOnly:
              pcMain.ActivePage := TabRemove;
          end

        else if (pcMain.ActivePage = TabFinish) then
          case RequestedOperation of
            rqaModify:
              pcMain.ActivePage := TabCryptoperiod;
            rqaRemoveOnly:
              pcMain.ActivePage := TabRemove;
          end;
      end;
    wbNext: // Next
      begin
        if pcMain.ActivePage = TabOption then
          begin
            case RequestedOperation of
              rqaModify:
                pcMain.ActivePage := TabEdit;
              rqaRemoveOnly:
                pcMain.ActivePage := TabRemove;
            end;
          end

        else if (pcMain.ActivePage = TabEdit) or
          (pcMain.ActivePage = TabRemove) then
          begin
            // Note:  This is the only place we validate the entries!
            ValidateEntries;
            // pcMain.ActivePage := TabFinish;
            case RequestedOperation of
              rqaModify:
                pcMain.ActivePage := TabCryptoperiod;
              rqaRemoveOnly:
                pcMain.ActivePage := TabFinish;
            end;
          end

        else if (pcMain.ActivePage = TabCryptoperiod) then
          pcMain.ActivePage := TabFinish;

        // i := pcMain.ActivePageIndex + 1; // next index
        // if i < pcMain.PageCount then pcMain.ActivePageIndex := i;
      end;
    wbFinish: // Finish
      DoFinishAction; // see virtual method below
  end;

  SetButtons;

  // Set focus controls
  if (pcMain.ActivePage = TabEdit) then
    begin
      // 05/08/2015 Never show the "old password" list.  We want to allow
      // customer administrators just to replace the passwords without
      // knowing the old passwords.
      // EIQ-7075 Credit Card - clear encryption passwords CRM 1261004 Tailor Made
      // if PnlOldPassword.Visible and edtOldPassKey1.CanFocus then
      // edtOldPassKey1.SetFocus
      // else
      if edtPassKey1.CanFocus then
        edtPassKey1.SetFocus;
    end
  else if (pcMain.ActivePage = TabRemove) then
    begin
      if edtPassKeyRemove1.CanFocus then
        edtPassKeyRemove1.SetFocus;
    end;
end;

function TFrmIQSysCCEncrypt.RequestedOperation: TRequestedOperation;
begin
  Result := rqaNone;
  if rbEdit.Checked then
    Result := rqaModify
  else
    Result := rqaRemoveOnly;
end;

procedure TFrmIQSysCCEncrypt.DoEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in cValidChar) then
    begin
      Beep;
      Key := #0;
    end;
end;

procedure TFrmIQSysCCEncrypt.Paste1Click(Sender: TObject);
var
  S, AValue: string;
  i: Integer;
  AEdit: TUniEdit;
begin
  AValue := '';

  if (TComponent(PPasswordEdit.PopupComponent) = nil) and
    (Self.ActiveControl is TUniEdit) then
    AEdit := (Self.ActiveControl as TUniEdit)

  else if (TComponent(PPasswordEdit.PopupComponent) is TUniEdit) then
    AEdit := (TComponent(PPasswordEdit.PopupComponent) as TUniEdit)

  else
    Exit;

  if AEdit = nil then
    Exit;

  with AEdit do
    begin
      S := IQMS.Common.StringUtils.PasteStrFromClipbrd;
      for i := 1 to Length(S) do
        if (S[i] in cValidChar) then
          AValue := AValue + S[i]
        else
          // 'Invalid character in password text.'
          raise Exception.Create(iqsys_rscstr.cTXT0000052);
      Text := AValue;
//      SelText := AValue;
    end;
end;

procedure TFrmIQSysCCEncrypt.Clear1Click(Sender: TObject);
begin
  if (TComponent(PPasswordEdit.PopupComponent) is TUniEdit) then
    with (TComponent(PPasswordEdit.PopupComponent) as TUniEdit) do
      Clear;
end;

procedure TFrmIQSysCCEncrypt.DoEditChange(Sender: TObject);
begin
  if not Self.Showing then
    Exit;
//  Application.ProcessMessages;
  SetButtons;
  SetImages;
end;

procedure TFrmIQSysCCEncrypt.ValidateNewPasswords;
var
  hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
  AList, AWeakList: TStringList;
begin

  // Initialize
  AList := nil;
  hPrg := nil;

  try
    AList := TStringList.Create;
    try
      AWeakList := TStringList.Create;
      try
        // Create the Progress Dialog box
        hPrg := hProgressDlg(3 { Max Value } ,
          iqsys_rscstr.
          cTXT0000053 { 'Validating new passwords.  Please wait.' } );
//        Application.ProcessMessages;
        Sleep(500);

        // Password 1
        if Self.IsOldKey(edtPassKey1.Text) then
          AList.Add(' - ' + lblPassKey1.Caption);
        if not IsStrongPassword(edtPassKey1.Text) then
          AWeakList.Add(' - ' + lblPassKey1.Caption);
        hPrg.StepProgress; // Step progress bar

        // Password 2
        if Self.IsOldKey(edtPassKey2.Text) then
          AList.Add(' - ' + lblPassKey2.Caption);
        if not IsStrongPassword(edtPassKey2.Text) then
          AWeakList.Add(' - ' + lblPassKey2.Caption);
        hPrg.StepProgress; // Step progress bar

        // Password 2
        if Self.IsOldKey(edtPassKey3.Text) then
          AList.Add(' - ' + lblPassKey3.Caption);
        if not IsStrongPassword(edtPassKey3.Text) then
          AWeakList.Add(' - ' + lblPassKey3.Caption);
        hPrg.StepProgress; // Step progress bar

        // For visual effect only
        Sleep(500);

      finally
        // Free the Progress Dialog box
        if Assigned(hPrg) then
          FreeAndNil(hPrg);
      end;

      if AList.Count > 0 then
        { 'The following passwords have already been ' +
          'used, and have been revoked.  Please select different passwords:' }
        raise Exception.CreateFmt(iqsys_rscstr.cTXT0000054 + #13 + '%s',
          [AList.Text]);
      if AWeakList.Count > 0 then
        { iqsys_rscstr.cTXT0000107 =
          'Passwords must be at least 7 characters long and ' +
          'include both numeric and alphabetic characters.  The following are ' +
          'not strong passwords:' }
        raise Exception.CreateFmt(iqsys_rscstr.cTXT0000107 + #13 + '%s',
          [AWeakList.Text]);
    finally
      if Assigned(AList) then
        AList.Free;
    end;
  finally
    if Assigned(AWeakList) then
      AWeakList.Free;
  end;
end;

procedure TFrmIQSysCCEncrypt.SaveOldPasswords;
var
  S: string;
begin
  // Save the old keys for later reference
  S := edtPassKey1.Text + #13 + edtPassKey2.Text + #13 + edtPassKey3.Text;
  if (Trim(S) > '') then
    cc_encrypt.SaveAsOldKey(S);
end;

(*
procedure TFrmIQSysCCEncrypt.IQNotify(var Msg: TMessage);
begin
  // um_updateCryptoperiodDays
  UpdateCryptoperiodDaysDisplay;
end;
*)

function TFrmIQSysCCEncrypt.IsStrongPassword(const AValue: string): Boolean;
var
  i, n: Integer;
  bHasNumbers, bHasChar: Boolean;
begin
  Result := False;
  // Passwords must be at least 7 characters.
  if Length(AValue) < 7 then
    Exit(False);
  // Passwords must include both numeric and alphabetic characters.
  bHasNumbers := False;
  bHasChar := False;
  for i := 1 to Length(AValue) do
    begin
      if Winapi.Windows.IsCharAlphaW(AValue[i]) then
        bHasChar := True;
      if IQMS.Common.Numbers.IsStringValidInteger(AValue[i], n) then
        bHasNumbers := True;
      if bHasNumbers and bHasChar then
        begin
          Result := True;
          Break;
        end;
    end;
end;

end.
