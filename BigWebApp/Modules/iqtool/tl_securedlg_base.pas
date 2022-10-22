unit tl_securedlg_base;

interface

uses
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, System.Classes, Vcl.Controls;

type
  TFrmTLSecureDlgBase = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    lblPrompt: TUniLabel;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTLSecureDlgBase: TFrmTLSecureDlgBase;

implementation

{$R *.dfm}

//uses
//  iqsecins;

procedure TFrmTLSecureDlgBase.FormShow(Sender: TObject);
begin
//  iqsecins.EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmTLSecureDlgBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
