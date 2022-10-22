unit dbtlogin;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Graphics,
  Forms,
  Controls,
  StdCtrls,
  Buttons,
  ExtCtrls,
  DB,
  SqlExpr,
  DBClient,
  IQMS.WebVcl.DBExpress,
  DBXOracle,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniComboBox, uniDBComboBox, uniImage;

type
  TFrmDBTLogin = class(TUniForm)
    PnlMain: TUniPanel;
    PnlButtons: TUniPanel;
    PnlPrompt: TUniPanel;
    PnlFields: TUniPanel;
    lblUserName: TUniLabel;
    edtUserName: TUniEdit;
    lblPassword: TUniLabel;
    Panel3: TUniPanel;
    lblPrompt: TUniLabel;
    Image1: TUniImage;
    edtPassword: TUniEdit;
    QryEmployee: TIQWebDbxQuery;
    QryEmployeeDISPLAY_NAME: TWideStringField;
    QryEmployeeUSER_NAME: TWideStringField;
    cmbEmployee: TUniDBLookupComboBox;
    QryEmployeeEMPNO: TWideStringField;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    bvSpacer: TUniPanel;
    TestConnection: TSQLConnection;
    SQLConnection: TSQLConnection;
    QryEmployeePR_EMP_ID: TFMTBCDField;
    PnlGroupControls: TUniPanel;
    PnlGroupTouchScreenControls: TUniPanel;
    sbtnUserName: TUniSpeedButton;
    sbtnPassword: TUniSpeedButton;
    SrcEmployee: TDataSource;
    procedure edtUserNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoOKClick(Sender: TObject);
    procedure cmbEmployeeBeforeDropDown(Sender: TObject);
    procedure DoSilenceKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbEmployeeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnUserNameClick(Sender: TObject);
    procedure sbtnPasswordClick(Sender: TObject);
  private
    { Private declarations }
    FCheckLogin: Boolean;
    FAliasName: String;
    function GetPassword: String;
    function GetUserName: String;
    function GetEmployeeID: Real;
    procedure setUserName(const Value:string);
    procedure setPassword(const Value:string);
    procedure CheckApplyTouchScreen;
  public
    { Public declarations }


    function CheckLogin: Boolean;
    function CreateForm(APrompt, AUserName, APassword: String): Boolean;
    function CreateFormA(APrompt, AUserName, AAliasName: String): Boolean;
    function CreateFormB(APrompt, AUserName, AAliasName: String): Boolean;
    property UserName: String read GetUserName write setUserName;
    property Password: String read GetPassword write setPassword;
    property EmployeeID: Real read GetEmployeeID;
  end;

  // Basic login screen; returns user name and password.
function GetLoginIn(var AUserName, APassword: String;
  APrompt: String = ''): Boolean;

// Basic login screen, but with a password check.  Returns user name and
// password, but validates user/password with the alias.
function GetLoginInWithCheckA(const AAliasName: String;
  var AUserName, APassword: String; APrompt: String = ''): Boolean;

// Employee login screen, with a password check.  Returns user name, password,
// and PR_EMP_ID, and also validates user/password with the alias.
// Instead of a simple edit box for the user name, the user must select a
// name from a combo box.  The combo box lists Employees linked to Oracle
// login names through the Security Inspector.
function GetLoginInWithCheckB(const AAliasName: String;
  var AUserName, APassword: String; var AEmployeeID: Real;
  APrompt: String = ''): Boolean;



implementation

{$R *.dfm}


uses
  IQMS.Common.ApplicationSet,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtdbexp,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //touchscrn
  ;

function GetLoginIn(var AUserName, APassword: String;
  APrompt: String = ''): Boolean;
var
  FrmDBTLogin: TFrmDBTLogin;
begin
  FrmDBTLogin := TFrmDBTLogin.Create(uniGUIApplication.UniApplication);
  with FrmDBTLogin do
  begin
    try
      Result := CreateForm(APrompt, AUserName, APassword);
      if Result then
        begin
          AUserName := UserName;
          APassword := Password;
        end;
    finally
      //Release;
    end;
  end;
end;

function GetLoginInWithCheckA(const AAliasName: String;
  var AUserName, APassword: String; APrompt: String = ''): Boolean;
var
  FrmDBTLogin: TFrmDBTLogin;
begin
  FrmDBTLogin := TFrmDBTLogin.Create(uniGUIApplication.UniApplication);
  with FrmDBTLogin do
  begin
    try
      Result := CreateFormA(APrompt, AUserName, AAliasName);
      if Result then
        begin
          AUserName := UserName;
          APassword := Password;
        end;
    finally
      //Release;
    end;
  end;
end;

function GetLoginInWithCheckB(const AAliasName: String;
  var AUserName, APassword: String; var AEmployeeID: Real;
  APrompt: String = ''): Boolean;
var
  FrmDBTLogin: TFrmDBTLogin;
begin
  AEmployeeID := 0;
  FrmDBTLogin := TFrmDBTLogin.Create(uniGUIApplication.UniApplication);
  with FrmDBTLogin do
  begin
    try
      Result := CreateFormB( APrompt, AUserName, AAliasName);
      if Result then
        begin
          // pass values
          AUserName := UserName;
          APassword := Password;
          AEmployeeID := EmployeeID;
          // final check
          Result := (AUserName > '') and (AEmployeeID > 0);
        end;
    finally
      //Release;
    end;
  end;
end;

{ TFrmDBTLogin }

function TFrmDBTLogin.CreateForm(APrompt, AUserName, APassword: String): Boolean;
begin
  FCheckLogin := FALSE;
  edtUserName.Text := AUserName;
  edtPassword.Text := APassword;
  if APrompt > '' then
    lblPrompt.Caption := APrompt;
  Result := ShowModal = mrOk;
end;

function TFrmDBTLogin.CreateFormA(APrompt, AUserName,
  AAliasName: String): Boolean;
begin
  edtUserName.Text := AUserName;
  if APrompt > '' then
    lblPrompt.Caption := APrompt;

  // Additional, for the check
  FCheckLogin := TRUE;
  FAliasName := AAliasName;
  Result := ShowModal = mrOk;
end;

function TFrmDBTLogin.CreateFormB( APrompt, AUserName,
  AAliasName: String): Boolean;
begin

  IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(SQLConnection);
  SQLConnection.Connected := TRUE;
  ReOpen(QryEmployee);

  edtUserName.Text := AUserName;
  if APrompt > '' then
    lblPrompt.Caption := APrompt;
  if (AUserName > '') and
    QryEmployee.Locate('USER_NAME', AUserName, [loCaseInsensitive]) then
    cmbEmployee.Text := QryEmployeeDISPLAY_NAME.AsString;
  cmbEmployee.Visible := TRUE;
  edtUserName.Visible := FALSE;
  // Additional, for the check
  FCheckLogin := TRUE;
  FAliasName := AAliasName;
  Result := ShowModal = mrOk;
end;

procedure TFrmDBTLogin.FormCreate(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] dbtlogin.pas(255): E2010 Incompatible types: 'TForm' and 'TFrmDBTLogin'}
  //IQMS.Common.Controls.CenterForm(Self, TRUE);
end;

procedure TFrmDBTLogin.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlGroupControls);

  CheckApplyTouchScreen;
  { TODO -oSanketG -cWebConvert : Need to revisit,
  [dcc32 Error] dbtlogin.pas(264): E2010 Incompatible types: 'TCustomEdit' and 'TUniEdit' }
  //IQMS.Common.Controls.SetPasswordCharBullet(edtPassword);

  // 06/20/2014 Set initial control focus
  if edtUserName.Visible and not edtUserName.ReadOnly and
    edtUserName.Enabled and edtUserName.CanFocus then
    edtUserName.SetFocus
  else if cmbEmployee.Visible and cmbEmployee.Enabled and
    cmbEmployee.CanFocus then
    cmbEmployee.SetFocus;
end;


procedure TFrmDBTLogin.FormActivate(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] dbtlogin.pas(286): E2010 Incompatible types: 'TCustomEdit' and 'TUniEdit'}
  //IQMS.Common.Controls.SetPasswordCharBullet(edtPassword);
end;

function TFrmDBTLogin.CheckLogin: Boolean;
begin
  // Tests connection to the current IQMS Oracle instance.
  Result := FALSE;
  try
    try
      IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(TestConnection, UserName, Password);
      TestConnection.Connected := TRUE;
      Result := TestConnection.Connected;
    except
      on E: Exception do
        // 11/05/2013 Do not display "password expired" errors.
        // These are handled by IQWIN32.EXE.
        // For: EIQ-1481  Password Expiration and Access to Quick Inspection
        if (Pos('ORA-28002', E.Message) > 0) then
          begin
            Result := TRUE;
          end
        else
          begin
            IQError(E.Message);
            Result := FALSE;
          end;
    end;
  finally
    if TestConnection.Connected then
      TestConnection.Connected := FALSE;
  end;
end;

function TFrmDBTLogin.GetPassword: String;
begin
  Result := edtPassword.Text;
end;

function TFrmDBTLogin.GetUserName: String;
begin
  if cmbEmployee.Visible then
    Result := QryEmployeeUSER_NAME.AsString
  else
    Result := edtUserName.Text;
end;

procedure TFrmDBTLogin.edtUserNameChange(Sender: TObject);
begin
  btnOk.Enabled := edtUserName.Text > '';
end;

procedure TFrmDBTLogin.DoOKClick(Sender: TObject);
begin
  if FCheckLogin and not CheckLogin then
    try
      IQError(IQMS.DBTrans.dbtrscstr.cTXT0000148 { 'Invalid user name or password.' } );
    finally
      ModalResult := mrNone;
    end
  else
    ModalResult := mrOk;
end;

procedure TFrmDBTLogin.cmbEmployeeBeforeDropDown(Sender: TObject);
begin
  ReOpen(QryEmployee);
end;

procedure TFrmDBTLogin.cmbEmployeeCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  Application.ProcessMessages;
  if edtPassword.CanFocus then
    edtPassword.SetFocus;
end;

function TFrmDBTLogin.GetEmployeeID: Real;
begin
  if QryEmployee.Active then
    Result := QryEmployeePR_EMP_ID.AsFloat
  else
    Result := 0;
end;

procedure TFrmDBTLogin.DoSilenceKeyPress(Sender: TObject; var Key: Char);
begin
  // 05/31/2007 prevents beep
  if Key = #13 then
    Key := #0;
end;

procedure TFrmDBTLogin.CheckApplyTouchScreen;
begin
  if IQMS.Common.ApplicationSet.IsTouchScreen then
    begin
      // Form
      Self.Width := 468;
      Self.Height := 258;
      { TODO -oSanketG -cWebConvert : Need to revisit ,
      [dcc32 Error] dbtlogin.pas(381): E2010 Incompatible types: 'TForm' and 'TFrmDBTLogin'}
      //IQMS.Common.Controls.CenterForm(Self, TRUE);
      { TODO -oSanketG -cWebConvert : Need to revisit , dependent on touchscrn}
      //touchscrn.ApplyTouchscreenFont(Self);

      // Edit controls
      PnlGroupTouchScreenControls.Visible := TRUE;
      PnlFields.Height := 118;
      cmbEmployee.Height := 25;
      edtUserName.Height := 25;
      IQMS.Common.Controls.IQAlignControls([sbtnUserName, cmbEmployee, edtUserName,
        lblUserName], acVerticalCenters);
      IQMS.Common.Controls.IQAlignControls([sbtnPassword, edtPassword, lblPassword],
        acVerticalCenters);

      // Modal Buttons
      PnlButtons.Height := 62;
      PnlButtonsInner.Width := 260;
      btnOk.Width := 120;
      btnOk.Height := 40;
      btnCancel.Width := 120;
      btnCancel.Height := 40;
      StackUpControlsLeft(1, 4, [btnOk, btnCancel]);
    end;
end;

procedure TFrmDBTLogin.sbtnUserNameClick(Sender: TObject);
var
  AText: string;
begin
  if cmbEmployee.Visible then
    AText := cmbEmployee.Text
  else if edtUserName.Visible then
    AText := edtUserName.Text;

    { TODO -oSanketG -cWebConvert : Need to revisit , dependent on touchscrn}
  (*if touchscrn.TouchScreen_KeyboardSimple(Self, { var } AText, 30,
    lblUserName.Caption) then
    begin
      if cmbEmployee.Visible then
        cmbEmployee.Text := AText
      else if edtUserName.Visible then
        edtUserName.Text := AText;
    end;*)
end;

procedure TFrmDBTLogin.setPassword(const Value: string);
begin
  edtPassword.Text := Value;
end;

procedure TFrmDBTLogin.setUserName(const Value: string);
begin
  edtUserName.Text := Value;
end;

procedure TFrmDBTLogin.sbtnPasswordClick(Sender: TObject);
var
  AText: string;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on touchscrn}
  (*if touchscrn.TouchScreen_KeyboardSimple(Self, { var } AText, 30,
    lblPassword.Caption) then
    edtPassword.Text := AText;*)
end;

end.
