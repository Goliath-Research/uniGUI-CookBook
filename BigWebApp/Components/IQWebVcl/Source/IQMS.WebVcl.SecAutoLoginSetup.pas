unit IQMS.WebVcl.SecAutoLoginSetup;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  DB,
  FireDAC.Comp.Client,
  SqlExpr,
  IQMS.Common.JumpConstants,
  IQMS.Common.DataConst,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmSecInsAutoLoginSetup = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    edUserName: TUniEdit;
    edPassword: TUniEdit;
    edAliasName: TUniEdit;
    wwDBComboDlgEplant_ID: TUniEdit;
    Panel6: TUniPanel;
    chkEnableAutoLogin: TUniCheckBox;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    SQLConnection1: TSQLConnection;
    procedure wwDBComboDlgEplant_IDCustomDlg(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkEnableAutoLoginClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetEPlant_ID: string;
    procedure SetEplant_ID( AValue: string );

    property EPlant_ID: string read GetEPlant_ID write SetEplant_ID;
    procedure UpdateRegistry;
    procedure Validate;
    procedure RestoreFromRegistry;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public             
    { Public declarations }
    class procedure DoShowModal;
    class procedure EnableAutoLogin(AValue: Boolean);
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.PlantBase,
  IQMS.WebVcl.ResourceStrings,
  IQMS.DBTrans.dbtdbexp;

{ TFrmSecInsAutoLoginSetup }

class procedure TFrmSecInsAutoLoginSetup.DoShowModal;
begin
  self.Create(uniGUIApplication.UniApplication).ShowModal
end;

procedure TFrmSecInsAutoLoginSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]) ;
end;

procedure TFrmSecInsAutoLoginSetup.FormShow(Sender: TObject);
begin
  PostMessage( self.Handle, iq_Notify, 0, 0 );   {set focus to chkEnableAutoLogin}
end;

procedure TFrmSecInsAutoLoginSetup.RestoreFromRegistry;
var
  S: string;
  ADB: TFDCustomConnection;

  function CheckDecryptValue( S: string ): string;
  begin
    if S = '' then
       Result:= S
    else
       Result:= CharXOR(S)
  end;

begin
  // eplant
  // EPlant_ID:= SecurityManager.EPlant_ID;

  if IQRegStringScalarRead( Application, 'AutoLogin_Enabled', S, TRUE ) then
     chkEnableAutoLogin.Checked:= (S = 'Y');

  if IQRegStringScalarRead( Application, 'AutoLogin_Resource1', S,  TRUE ) then   // user name
     edUserName.Text:= CheckDecryptValue( S );

  if IQRegStringScalarRead( Application, 'AutoLogin_Resource2', S,  TRUE ) then   // password
     edPassword.Text:= CheckDecryptValue( S );

  if IQRegStringScalarRead( Application, 'AutoLogin_Resource3', S,  TRUE ) then   // eplant
     EPlant_ID:= CheckDecryptValue( S );

  ADB := FDManager.FindConnection(cnstFDConnectionName);
  if Assigned(ADB) then
    edAliasName.Text:= ADB.ConnectionName;
end;


procedure TFrmSecInsAutoLoginSetup.wwDBComboDlgEplant_IDCustomDlg(Sender: TObject);
var
  AEPlant_ID: string;
begin
  if DoPickEPlant(  AEPlant_ID ) then  // plnt_bas.pas
     EPlant_ID:= AEPlant_ID
end;


procedure TFrmSecInsAutoLoginSetup.chkEnableAutoLoginClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl( [ edUserName, edPassword, wwDBComboDlgEPlant_ID ],  chkEnableAutoLogin.Checked );
end;

function TFrmSecInsAutoLoginSetup.GetEPlant_ID: string;
begin
  Result:= wwDBComboDlgEplant_ID.Text;
end;

procedure TFrmSecInsAutoLoginSetup.IQNotify(var Msg: TMessage);
begin
  chkEnableAutoLogin.SetFocus;
end;

procedure TFrmSecInsAutoLoginSetup.SetEplant_ID(AValue: string);
begin
  if AValue = 'NULL' then
     wwDBComboDlgEplant_ID.Text:= ''
  else
     wwDBComboDlgEplant_ID.Text:= AValue;
end;

procedure TFrmSecInsAutoLoginSetup.btnOKClick(Sender: TObject);
begin
  Validate;
  UpdateRegistry;
  ModalResult:= mrOK;
end;

procedure TFrmSecInsAutoLoginSetup.Validate;
begin
  if chkEnableAutoLogin.Checked then
  begin
    IQAssert( edUserName.Text > '',  IQMS.WebVcl.ResourceStrings.cTXT0000378 ); //  'User ID must be entered.';
    IQAssert( edPassword.Text > '',  IQMS.WebVcl.ResourceStrings.cTXT0000379 ); //  'Password must be entered.';
    try
      SQLConnection1.Connected := False;
      DBX_ConfigureSQLConnection( SQLConnection1,
                                  edUserName.Text,
                                  edPassword.Text );
      SQLConnection1.Connected:= True;
    except on E: Exception do
      raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000380, {'%s - operation aborted.'} [ E.Message ]);
    end;
  end;
end;


procedure TFrmSecInsAutoLoginSetup.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);

  RestoreFromRegistry;
  chkEnableAutoLoginClick(nil);
end;

procedure TFrmSecInsAutoLoginSetup.UpdateRegistry;
  function CheckEncryptValue( S:string ): string;
  begin
    if chkEnableAutoLogin.Checked then
       Result:= CharXOR( S )
    else
       Result:= '';
  end;
begin
  IQRegStringScalarWrite( Application, 'AutoLogin_Enabled',   IQMS.Common.StringUtils.BoolToYN( chkEnableAutoLogin.Checked ), TRUE );   // auto login enabled Y/N
  IQRegStringScalarWrite( Application, 'AutoLogin_Resource1', CheckEncryptValue( edUserName.Text ),  TRUE );   // user name
  IQRegStringScalarWrite( Application, 'AutoLogin_Resource2', CheckEncryptValue( edPassword.Text ),  TRUE );   // password
  IQRegStringScalarWrite( Application, 'AutoLogin_Resource3', CheckEncryptValue( EPlant_ID ),        TRUE );   // eplant
  IQRegStringScalarWrite( Application, 'AutoLogin_Resource4', CheckEncryptValue( edAliasName.Text ), TRUE );   // alias
end;

class procedure TFrmSecInsAutoLoginSetup.EnableAutoLogin( AValue: Boolean );
begin
  IQRegStringScalarWrite( Application, 'AutoLogin_Enabled',  IQMS.Common.StringUtils.BoolToYN( AValue ), TRUE );   // auto login enabled Y/N
end;

end.
