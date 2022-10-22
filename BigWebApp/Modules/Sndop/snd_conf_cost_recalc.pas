unit snd_conf_cost_recalc;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  IQMS.Common.ConfBas,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton,
  IQMS.WebVcl.SecurityRegister,
  uniCheckBox,
  uniLabel,
  System.Classes,
  Vcl.Controls;

type
  TFrmSndOpConfirmCostRecalc = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
  public
    { Public declarations }
  end;

  function DoShowModalSndOpConfirmCostRecalc(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  uniGUIApplication;

function DoShowModalSndOpConfirmCostRecalc(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmSndOpConfirmCostRecalc;
begin
  frm := TFrmSndOpConfirmCostRecalc.Create(UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

end.
