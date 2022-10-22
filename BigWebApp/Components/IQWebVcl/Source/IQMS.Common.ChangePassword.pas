unit IQMS.Common.ChangePassword;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmChangePassword = class(TUniForm)
    lblNewPassword: TUniLabel;
    lblConfirmPassword: TUniLabel;
    edNew: TUniEdit;
    edConfirm: TUniEdit;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlClient01: TUniPanel;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSkipEnsureSecurityInspectorOnTop: Boolean;
    FUserName: string;
    procedure SetUserName(const AUserName: string);
  protected
    procedure ConfirmPasswordChange;
    procedure RecordNewPassword; virtual;
  public
    { Public declarations }
    class procedure ValidateNewPassword(ANewPassword, AConfirmPassword: string);
    class procedure ValidateNewPasswordOracleProfile(AUserName, ANewPassword: string);
    class procedure RaiseStandardError( E: Exception = nil);
    property UserName: string read FUserName write SetUserName;
    property SkipEnsureSecurityInspectorOnTop: boolean read FSkipEnsureSecurityInspectorOnTop write FSkipEnsureSecurityInspectorOnTop;
  end;

  TFrmGetChangePassword = class(TFrmChangePassword)
  protected
    procedure RecordNewPassword; override;
  end;

{just get the value of the new pwd - do not update oracle}
function DoGetNewPassword( var ANewPassword: string ):Boolean;

{update oracle}
function DoChangeUserPassword( AUserName: string = ''; ASkipEnsureSecurityInspectorOnTop: Boolean = FALSE ): Boolean;

var
  FrmChangePassword: TFrmChangePassword;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.ErrorDialog,
  IQMS.Common.HelpHook,
  IQMS.Common.DataConst,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
//  IQSecIns,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.iqwin32Rscstr,
  System.Math,
  System.StrUtils;

{$REGION 'Wrappers'}

function DoGetNewPassword( var ANewPassword: string ):Boolean;
begin
  with TFrmGetChangePassword.Create(uniGUIApplication.UniApplication) do
  begin
    Result:= ShowModal = mrOK;
    if Result then
       ANewPassword:= edNew.Text;
  end;
end;

function DoChangeUserPassword( AUserName: string = ''; ASkipEnsureSecurityInspectorOnTop: Boolean = FALSE ): Boolean;
begin
  with TFrmChangePassword.Create( uniGUIApplication.UniApplication) do
  begin
    UserName:= AUserName;
    SkipEnsureSecurityInspectorOnTop:=ASkipEnsureSecurityInspectorOnTop;
    Result:= ShowModal = mrOK;
  end;
end;

{$ENDREGION 'Wrappers'}

{$REGION 'TFrmChangePassword'}

{ TFrmChangePassword }

class procedure TFrmChangePassword.RaiseStandardError( E: Exception = nil);
var
  Msg: string;
  S: string;
  ANativeError: Integer;
  AIsFatalError: Boolean;
begin
  // iqwin32_rscstr.cTXT0000009 = 'Invalid password.'#13#13 +
  //  '1. Passwords must be from 1 to 30 characters long.'#13+
  //  '2. A password must begin with an alphabetic character.'#13+
  //  '3. Passwords can contain only alphanumeric characters, the ' +
  //  'underscore (_), dollar sign ($), and pound sign (#).')
  //  '4. A password cannot be an Oracle reserved word.'
  S:= IQMS.Common.iqwin32Rscstr.cTXT0000009;

  if Assigned( E ) then
  begin
//    IQParseDBEngineError( nil,  // DataSet: TDataSet;
//                                E,
//                                Msg,
//                                ANativeError,
//                                AIsFatalError );
    S:= Msg + #13 + S;
  end;

  raise Exception.Create( S );
end;

class procedure TFrmChangePassword.ValidateNewPassword(ANewPassword, AConfirmPassword: string);
const
  c_alpha = ['a'..'z','A'..'Z'];
  c_numeric = ['0'..'9'];
  c_symbol = ['_','$','#'];
  c_valid_char = c_alpha + c_numeric + c_symbol;
var
  AValid: Boolean;
  c: char;
  i: Integer;
begin
  // Check for sameness
  if CompareText(ANewPassword, AConfirmPassword) <> 0 then
    // iqwin32_rscstr.cTXT0000010 =
    // 'Password confirmation failed. Please correct New Password or
    // Confirm Password'
     raise Exception.Create(IQMS.Common.iqwin32Rscstr.cTXT0000010);

  // Length
  AValid := Length(ANewPassword) in [1..30];

  // First character
  if AValid then
    AValid := System.SysUtils.CharInSet(ANewPassword[1], c_alpha);

  // Characters and symbols
  if AValid then
    begin
      for i := 1 to Length(ANewPassword) do
        begin
          AValid  := System.SysUtils.CharInSet(ANewPassword[i], c_valid_char);
          if not AValid then
            Break;
        end;
    end;

  // If the password did not pass the test, then raise the standard
  // exception message.
  if not AValid then
    RaiseStandardError;
end;

class procedure TFrmChangePassword.ValidateNewPasswordOracleProfile(
  AUserName, ANewPassword: string);

  function _GetParsedMessage(const AValue: string): string;
  var
    i, j: Integer;
    s: string;
    sl: TStringList;
  begin
    Result := AValue;
    sl := TStringList.Create;
    try
      sl.Text := AValue;
      for i := 0 to sl.Count - 1 do
        begin
          s := Trim(sl.Strings[i]);

          j := Pos('ORA-20001:', s);
          if j > 0 then
            begin
              Result := Trim(Copy(s, j + Length('ORA-20001:') + 1, Length(s)));
              Break;
            end;

          if j = 0 then j := Pos('ORA-20002:', s);
          if j > 0 then
            begin
              Result := Trim(Copy(s, j + Length('ORA-20002:') + 1, Length(s)));
              Break;
            end;

          if j = 0 then j := Pos('ORA-20003:', s);
          if j > 0 then
            begin
              Result := Trim(Copy(s, j + Length('ORA-20003:') + 1, Length(s)));
              Break;
            end;
        end;
    finally
      sl.Free;
    end;
  end;

begin
  try
    with TFDQuery.Create(nil) do
    try
      ConnectionName := 'IQFD';
      SQL.Add('BEGIN');
      SQL.Add(Format('      eiq_check_password(''%s'', ''%s'', ''%s''); ',
        [AUserName, ANewPassword, SecurityManager.Password]));
      SQL.Add('END;');
      ExecSQL;
    finally
      Free;
    end;
  except on E:Exception do
    begin
      IQMS.Common.Dialogs.IQError('Invalid password:'#13#13 + _GetParsedMessage(E.Message));
      System.SysUtils.Abort;
    end;
  end;
end;
procedure TFrmChangePassword.FormShow(Sender: TObject);
begin
  // 04/23/2014 Adjust controls
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02, 16);
  PnlLeft01.Width := System.Math.MaxIntValue([lblNewPassword.Width,
    lblConfirmPassword.Width]) + 24;
  // 04/23/2014 Set initial focus
  if edNew.CanFocus then
    edNew.SetFocus;
  // Security inspector
//  if not FSkipEnsureSecurityInspectorOnTop then
//     EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmChangePassword.FormActivate(Sender: TObject);
begin
  if Assigned(IQHelp) then
     IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch6{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmChangePassword.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmChangePassword.btnOKClick(Sender: TObject);
begin
  ValidateNewPassword(Trim(edNew.Text), Trim(edConfirm.Text));
  ValidateNewPasswordOracleProfile(FUserName, Trim(edNew.Text));
  ConfirmPasswordChange;
  RecordNewPassword;
  ModalResult:= mrOK;
end;

procedure TFrmChangePassword.ConfirmPasswordChange;
begin
  if not IQWarningYN('About to change the password. Are you sure you want to continue?'#13#13+
                     'Note: if user is setup for Auto Login and changing to a different password, '+
                     'please contact Database Administrator to re-configure Auto Login Setup with '+
                     'the new password on any applicable workstations.') then
     System.SysUtils.ABORT;
end;

procedure TFrmChangePassword.RecordNewPassword;
var
  AField: TField;
  ANativeError: Integer;
begin
  ANativeError:= 0;
  try
    ExecuteCommandFmt('ALTER USER "%s" IDENTIFIED BY %s', [ FUserName, edNew.Text ]);
  except on E: Exception do
    begin
      RaiseStandardError( E );
    end;
  end;

  if CompareText(SecurityManager.UserName, FUserName) = 0 then
     SecurityManager.Password:= edNew.Text;

//  if (CompareText(FUserName, 'IQMS') = 0) and (MainModule.FDConnection <> NIL) then
//  with MainModule.FDConnection do
//  begin
//    Connected:= FALSE;
//    Params.Values[cnstFDPasswordParam]:= edNew.Text;
//    Connected:= TRUE;
//
//    {Save Password in IQOrder2}
//    with TFDTable.Create(nil) do
//    try
//      Connection := MainModule.FDConnection;
//      TableName   := 'IQORDER2';
//      Open;
//      Edit;
//      AField := FindField('IQMS_Log');
//      if Assigned( AField ) then
//         AField.AsString:= CharXOR( edNew.Text );
//      CheckBrowseMode;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TFrmChangePassword.SetUserName(const AUserName: string);
begin
  FUserName:= UpperCase( AUserName );
  if FUserName = '' then
     FUserName:= UpperCase( SecurityManager.UserName );
  Caption:= Format('User %s - IQMS Password Change', [ FUserName  ]);
end;

procedure TFrmChangePassword.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
end;

{$ENDREGION 'TFrmChangePassword'}

{$REGION 'TFrmGetChangePassword'}

{ TFrmGetChangePassword }

procedure TFrmGetChangePassword.RecordNewPassword;
begin
end;

{$ENDREGION 'TFrmGetChangePassword'}


end.
