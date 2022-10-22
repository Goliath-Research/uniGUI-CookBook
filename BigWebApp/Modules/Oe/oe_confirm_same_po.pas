unit oe_confirm_same_po;

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
  TFrmOEConfirmSameP0 = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FResult : Integer;
    procedure AssignText( S: string ); override;
  end;

implementation

{$R *.dfm}

procedure TFrmOEConfirmSameP0.AssignText(S: string);
begin
  lblConfBasMsgText.Caption:= S;
end;

procedure TFrmOEConfirmSameP0.btnYesClick(Sender: TObject);
begin
  inherited; // n
  FResult:= TUniButton(Sender).Tag;
  Close;
end;

end.
