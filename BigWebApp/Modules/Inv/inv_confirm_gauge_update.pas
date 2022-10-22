unit inv_confirm_gauge_update;

interface

uses
  Vcl.Forms,
  IQMS.Common.Confbas,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton;

type
  TFrmInvConfirmGaugeUpdate = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnNo: TUniButton;
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FResult : Integer;
  end;

var
  FrmInvConfirmGaugeUpdate: TFrmInvConfirmGaugeUpdate;

implementation

{$R *.dfm}

procedure TFrmInvConfirmGaugeUpdate.btnYesClick(Sender: TObject);
begin
  inherited; {nothing}
  FResult:= TUniButton(Sender).Tag;
  Close;
end;

end.
