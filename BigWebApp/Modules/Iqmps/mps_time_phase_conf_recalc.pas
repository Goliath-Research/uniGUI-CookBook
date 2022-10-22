unit mps_time_phase_conf_recalc;

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
  IQMS.Common.ConfBas,
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton,
  IQMS.WebVcl.SecurityRegister,
  uniCheckBox,
  uniLabel;

type
  TFrmMPSTimePhaseConfirmRecalc = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TIQDialogCheckBox1 }

end.
