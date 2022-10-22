unit CheckMrb;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Confbas,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, IQMS.WebVcl.SecurityRegister, uniCheckBox, uniLabel, Vcl.Controls, uniGUIApplication;

type
  TFrmCheckMrb = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
  private
    { Private declarations }
  protected
    procedure SetKey(const Value: string); override;
  public
    { Public declarations }
  end;

  function DoShowModalCheckMrb(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
implementation

{$R *.dfm}

function DoShowModalCheckMrb(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  LFrmCheckMrb : TFrmCheckMrb;
begin
  LFrmCheckMrb := TFrmCheckMrb.Create(uniGUIApplication.UniApplication);

  LFrmCheckMrb.MsgText      := AStr;
  LFrmCheckMrb.Key          := AKey;
  LFrmCheckMrb.ShowCheckBox := false;

  Result := LFrmCheckMrb.ShowModal = mrOk;
end;
{ TFrmCheckMrb }

procedure TFrmCheckMrb.SetKey(const Value: string);
begin
  inherited;
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

end.
