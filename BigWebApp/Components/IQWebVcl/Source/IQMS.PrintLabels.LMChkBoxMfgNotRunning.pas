unit IQMS.PrintLabels.LMChkBoxMfgNotRunning;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  IQMS.Common.ConfBas,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TFrmIQLMChkBoxMfgNotRunning = class(TIQDialogCheckBox)
    pnlButtons: TUniPanel;
    btnContinue: TUniButton;
    btnCancel: TUniButton;
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  end;

  function DoShowModalIQLMChkBoxMfgNotRunning(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  uniGUIApplication;

{ TFrmIQLMChkBoxMfgNotRunning }

function DoShowModalIQLMChkBoxMfgNotRunning(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmIQLMChkBoxMfgNotRunning;
begin
  frm := TFrmIQLMChkBoxMfgNotRunning.Create(uniGUIApplication.UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

end.
