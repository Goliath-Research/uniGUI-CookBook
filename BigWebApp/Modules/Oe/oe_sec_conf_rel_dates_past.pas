unit oe_sec_conf_rel_dates_past;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  IQMS.Common.SecuredConfirm,
  StdCtrls,
  ExtCtrls,
  IQMS.WebVcl.SecurityRegister, uniLabel, uniImage, uniButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmSecuredConfirmReleaseDatesPast = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmSecuredConfirmReleaseDatesPast.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.
