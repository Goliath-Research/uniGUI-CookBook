unit oe_conf_lead_days;

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
  IQMS.Common.Confbas,
  StdCtrls,
  ExtCtrls,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TOEConfirmLeadDays = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnOK: TUniButton;
  private
    { Private declarations }
    procedure AssignText( S: string ); override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TIQDialogCheckBox1 }

procedure TOEConfirmLeadDays.AssignText(S: string);
begin
  lblConfBasMsgText.Caption:= S;
end;

end.
