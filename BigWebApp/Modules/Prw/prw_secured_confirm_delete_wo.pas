unit prw_secured_confirm_delete_wo;

interface

uses
  Winapi.Windows,
  //secured_confirm,
  IQMS.Common.SecuredConfirm,
  MainModule, IQMS.WebVcl.SecurityRegister, uniLabel, Vcl.Graphics, uniImage,
  uniButton, System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses,
  uniGUIClasses, uniPanel;

type
  TFrmPRWSecuredConfirmDeleteWO = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmPRWSecuredConfirmDeleteWO.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.
