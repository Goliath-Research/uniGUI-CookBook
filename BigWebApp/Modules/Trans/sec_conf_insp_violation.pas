unit sec_conf_insp_violation;

interface

uses
  Winapi.Windows,
  IQMS.Common.SecuredConfirm,
  pngimage,
  MainModule, IQMS.WebVcl.SecurityRegister, uniLabel, uniImage, uniButton,
  System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses, uniGUIClasses,
  uniPanel;

type
  TFrmSecConfInspectionViolation = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmSecConfInspectionViolation.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.
