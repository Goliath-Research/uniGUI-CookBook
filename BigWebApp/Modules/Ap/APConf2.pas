unit APConf2;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  ConfBas,
 // IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIClasses,
  uniButton, uniCheckBox, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TFrmAPARConf = class(TIQDialogCheckBox)
    BtnOk: TUniButton;
    btnPeriod: TUniButton;
    BtnDate: TUniButton;
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AStr, AKey :String);override;
  end;

var
  FrmAPARConf: TFrmAPARConf;

implementation
{$R *.DFM}


constructor TFrmAPARConf.Create(AStr, AKey :String);
begin
  inherited Create(AStr, AKey);
  if AKey > '' then
  begin
     //SR.SecurityCode := UpperCase(AKey);
     //SR.Refresh;
  end;
end;


procedure TFrmAPARConf.BtnOkClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
