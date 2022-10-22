unit CDConf;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Confbas,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TFrmCDConf = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    btnPeriod: TUniButton;
    BtnDate: TUniButton;
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     FResult : Integer;
  end;

implementation

{$R *.dfm}


procedure TFrmCDConf.BtnOkClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
