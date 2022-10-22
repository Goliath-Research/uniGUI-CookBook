unit inv_trans_new_rule_dlg;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmInvTransNewRuleDlg = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    rbtnLocating: TUniRadioButton;
    rbtnPicking: TUniRadioButton;
    Label1: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( AOwner: TComponent; var AKind: Integer ): TModalResult;
  end;

var
  FrmInvTransNewRuleDlg: TFrmInvTransNewRuleDlg;

implementation

{$R *.dfm}

uses
  IQMS.Common.Numbers;

{ TFrmInvTransNewRuleDlg }

class function TFrmInvTransNewRuleDlg.DoShowModal(AOwner: TComponent; var AKind: Integer): TModalResult;
begin

  FrmInvTransNewRuleDlg := TFrmInvTransNewRuleDlg.Create(UniGUIApplication.UniApplication);

  Result:= FrmInvTransNewRuleDlg.ShowModal;
  if Result = mrOK then
       AKind:= iIIf( FrmInvTransNewRuleDlg.rbtnLocating.Checked, 1, 2 );

end;

end.
