unit IQMS.Common.WebRevoke;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmWebRevoke = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlClient: TUniPanel;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    chkRemove: TUniCheckBox;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FUserName: string;
    procedure SetUserName(const AUserName: string);
  public
    { Public declarations }
    property Username:string read FUsername write SetUserName;
  end;

function DoWebRevoke( AUserName: string ): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.ResStrings,
  IQMS.Common.DataLib;

function DoWebRevoke( AUserName: string ): Boolean;
var
  FrmWebRevoke: TFrmWebRevoke;
begin
  FrmWebRevoke:= TFrmWebRevoke.Create(uniGUIApplication.UniApplication);
  with FrmWebRevoke do
  begin
    Username:=AUserName;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmWebRevoke.SetUserName(const AUserName: string);
begin
  FUserName:= AUserName;
  btnOK.Enabled:= FUserName > '';
  Caption:= Format(IQMS.Common.ResStrings.cTXT0000251 {'User: %s'}, [ FUserName ]);
end;

procedure TFrmWebRevoke.btnOKClick(Sender: TObject);
begin
   (*AB 11-13-13 EIQ-1465 Customer, Contacts, B2C user access/security
     This update stat't must take place before IQWebGrant(false) and IQDeleteUser,
     because we null the contact.web_userid in those procedures!*)
  try
    ExecuteCommandFmt('update contact set web_userlog = null where web_userid = ''%s''',[ FUserName ]);
  except
  {make it compatible so if web_userid does not exist - we will keep going}
  end;

  IQWebGrant( FUserName, '', FALSE ); {IQMS.Common.Miscellaneous. Revoke Access}
  if chkRemove.Checked then
     IQDeleteUser( FUserName );         {IQMisc}
  ModalResult:= mrOK;
end;

end.
