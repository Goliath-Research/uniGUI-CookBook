unit CDConfEFT;

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
  TFrmCDConfEFT = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    procedure BtnYesClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetKey(const Value: String);
  public
    { Public declarations }
    FResult : Integer;
    property Key : String write SetKey;

  end;

var
  FrmCDConfEFT: TFrmCDConfEFT;

implementation

{$R *.dfm}



procedure TFrmCDConfEFT.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;


procedure TFrmCDConfEFT.BtnYesClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
