unit crm_mail_resume_dlg;

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
  TFrmCRMMailResumeDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    lblPrompt: TUniLabel;
    chkRemovePending: TUniCheckBox;
    procedure FormShow(Sender: TObject);
  private
    function GetRemovePending: Boolean;
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(var ARemovePending: Boolean): Boolean;
    property RemovePending: Boolean read GetRemovePending;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls;

{ TFrmCRMMailResumeDlg }

class function TFrmCRMMailResumeDlg.DoShowModal(
  var ARemovePending: Boolean): Boolean;
var
  LFrmCRMMailResumeDlg: TFrmCRMMailResumeDlg;
begin
  LFrmCRMMailResumeDlg := TFrmCRMMailResumeDlg(uniGUIApplication.uniApplication);
  Result := LFrmCRMMailResumeDlg.ShowModal = mrOk;
  if Result then
        ARemovePending := LFrmCRMMailResumeDlg.RemovePending;
end;

procedure TFrmCRMMailResumeDlg.FormShow(Sender: TObject);
begin
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

function TFrmCRMMailResumeDlg.GetRemovePending: Boolean;
begin
  Result := chkRemovePending.Checked;
end;

end.
