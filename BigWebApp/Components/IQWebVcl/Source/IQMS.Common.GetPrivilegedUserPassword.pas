unit IQMS.Common.GetPrivilegedUserPassword;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.GetPassword,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniLabel, uniButton, uniPanel;

type
  TFrmPrivilegedUserPassword = class(TFrmSystemPassword)
    edtUserName: TUniEdit;
    lblUser: TUniLabel;
    procedure EditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetUserName: string;
  protected
    { Protected declarations }
    procedure SetButtons; override;
    procedure Validate; override;
  public
    { Public declarations }
    class function RequestSecuredUserLogin: Boolean;
    class function RequestSecuredUserLogin2: Boolean;
    property UserName: string read GetUserName;
    property Password;
  end;

implementation

{$R *.dfm}

uses
//  IQ_Login,
  IQMS.Common.Dialogs,
  IQMS.Common.ResStrings,
  IQMS.Common.DataLib;
//  IQMS.Data.Users;
//  IQSecIns;

{ TFrmSystemPassword1 }

procedure TFrmPrivilegedUserPassword.FormCreate(Sender: TObject);
begin
  inherited;

  btnOK.Enabled := True; // Override parent action of disabling this button
end;

procedure TFrmPrivilegedUserPassword.FormShow(Sender: TObject);
begin
  inherited;

//  EnsureSecurityInspectorOnTopOf( self );
end;

class function TFrmPrivilegedUserPassword.RequestSecuredUserLogin: Boolean;
begin
  Result := False;

  with self.Create(Application) do
  try
    Result:= (ShowModal = mrOK) and
             not String.IsNullOrWhiteSpace(UserName) and
             not String.IsNullOrWhiteSpace(Password)
//          and   SilentLogOntoEx(dbaseElecSign,
//                             UserName,
//                             Password,
//                             False,             // RaiseExceptionOnCheckLogin
//                             False);           // ARebuildSecurityManager

    // Additional - if logged in successfully, verify that user has rights
//    Result := Result and TDatabaseUser.IsDBA(UserName);

  finally
    Release;
  end;
end;

class function TFrmPrivilegedUserPassword.RequestSecuredUserLogin2: Boolean;
begin
  Result := False;

  with self.Create(Application) do
  try
    Result:= (ShowModal = mrOK) and
             not String.IsNullOrWhiteSpace(UserName) and
             not String.IsNullOrWhiteSpace(Password)
//             and SilentLogOntoEx(dbaseElecSign,
//                             UserName,
//                             Password,
//                             False,             // RaiseExceptionOnCheckLogin
//                             False);           // ARebuildSecurityManager
//
//    // Additional - if logged in successfully, verify that user has rights
//    if Result and not (TDatabaseUser.IsDBA(UserName) or TDatabaseUser.IsPowerUser(UserName)) then
//    begin
//      // IQMS.Common.ResStrings.cTXT0000546 = 'Insufficient rights.';
//      raise Exception.Create(IQMS.Common.ResStrings.cTXT0000546);
//    end;

  finally
    Release;
  end;
end;

procedure TFrmPrivilegedUserPassword.SetButtons;
begin
  // Override with nothing
  // inherited;
end;

procedure TFrmPrivilegedUserPassword.Validate;
begin
  if string.IsNullOrWhiteSpace(Username) then
    // IQMS.Common.ResStrings.cTXT0000545 = 'Please enter a user name.';
    raise Exception.Create(IQMS.Common.ResStrings.cTXT0000545);

  inherited;

end;

procedure TFrmPrivilegedUserPassword.EditChange(Sender: TObject);
begin
 ; // dont enable based on input
end;

function TFrmPrivilegedUserPassword.GetUserName: string;
begin
  Result := Trim(UpperCase(edtUserName.Text));
end;

end.
