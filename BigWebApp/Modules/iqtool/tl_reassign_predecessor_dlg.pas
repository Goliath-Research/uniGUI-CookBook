unit tl_reassign_predecessor_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  tl_securedlg_base,
  MainModule, IQMS.WebVcl.SecurityRegister, uniLabel, uniButton, Vcl.Forms,
  uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmTLReassignPredecessorDlg = class(TFrmTLSecureDlgBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function PromptReassignDefaultPredecessors(AOwner: TComponent): Boolean;

var
  FrmTLReassignPredecessorDlg: TFrmTLReassignPredecessorDlg;

implementation

{$R *.dfm}

function PromptReassignDefaultPredecessors(AOwner: TComponent): Boolean;
begin
  with TFrmTLReassignPredecessorDlg.Create(AOwner) do
  try
     Result := ShowModal = mrOk;
  finally
     Free;
  end;
end;

end.
