unit secured_confirm_sched_run_hold;

interface

uses
  //secured_confirm,
  IQMS.Common.SecuredConfirm, uniLabel, Vcl.Graphics, uniImage,
  uniButton, System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, IQSecReg;

type
  TFrmSecuredConfirmSchedRunHold = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmSecuredConfirmSchedRunHold.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.
