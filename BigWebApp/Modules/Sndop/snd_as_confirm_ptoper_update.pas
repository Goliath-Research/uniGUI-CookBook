unit snd_as_confirm_ptoper_update;

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
  TFrmSndAssy1ConfirmPtoperUpdate = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnNo: TUniButton;
  end;

implementation

{$R *.dfm}

{ TIQDialogCheckBox1 }
end.
