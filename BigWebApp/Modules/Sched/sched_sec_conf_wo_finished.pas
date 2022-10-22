unit sched_sec_conf_wo_finished;

interface

uses IQMS.Common.SecuredConfirm, IQMS.WebVcl.SecurityRegister, uniLabel,
  Vcl.Graphics, uniImage, uniButton, System.Classes, Vcl.Controls, Vcl.Forms,
  uniGUIBaseClasses, uniGUIClasses, uniPanel;
  //secured_confirm;


type
  TFrmSecuredConfirmWoFinished = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmSecuredConfirmWoFinished.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.
