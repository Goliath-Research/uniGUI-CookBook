unit wc_sec_conf_exceed_rt_lic;

interface

uses
  Winapi.Windows,
  IQMS.Common.SecuredConfirm,
  //MainModule,
  IQMS.WebVcl.SecurityRegister, uniLabel, Vcl.Graphics, uniImage,
  uniButton, System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses,
  uniGUIClasses, uniPanel;

type
  TFrmSecConfExceedRTLic = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmSecConfExceedRTLic.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= False;
end;

end.
