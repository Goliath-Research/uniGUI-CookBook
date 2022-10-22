unit wo_conf_del_sched;

interface

uses
  Vcl.Forms,
  wo_conf_del,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton, IQMS.WebVcl.SecurityRegister, uniButton, uniGroupBox,
  System.Classes, Vcl.Controls, uniPanel;

type
  TFrmWOConfDelSched = class(TFrmWOConfDel)
    rbReturnToPool: TUniRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  EdiConfDel;

procedure TFrmWOConfDelSched.Button1Click(Sender: TObject);
begin
  if rbReturnToPool.Checked then
  begin
     nConfirmDelete:= EdiConfDel.daSkip;
     Close;
     EXIT;
  end;

  inherited;
end;

end.
