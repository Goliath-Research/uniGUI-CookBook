unit trans_conf_move;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  IQMS.Common.Confbas,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, IQMS.WebVcl.SecurityRegister, uniCheckBox, uniLabel,
  System.Classes, Vcl.Controls;

type
  TFrmTransConfMove = class(TIQDialogCheckBox)
    Panel4: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssignText( S: string ); override;
  end;


implementation

{$R *.dfm}

{ TIQDialogCheckBox1 }

procedure TFrmTransConfMove.AssignText(S: string);
begin
  lblConfBasMsgText.Caption:= S;
end;

end.
