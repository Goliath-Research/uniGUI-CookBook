unit JS2_secured_confirm_archive;

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
  //secured_confirm,
  StdCtrls,
  pngimage,
  ExtCtrls,
  IQMS.WebVcl.SecurityRegister, IQMS.Common.SecuredConfirm, uniLabel, uniImage,
  uniButton, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmJS2SecuredConfirmArchive = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmJS2SecuredConfirmArchive.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.
