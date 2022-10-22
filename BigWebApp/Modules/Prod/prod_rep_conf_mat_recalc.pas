unit prod_rep_conf_mat_recalc;

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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, IQMS.WebVcl.SecurityRegister, uniCheckBox, uniLabel;

type
  TFrmProdRepConfMatRecalc = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     FResult : Integer;
  end;

var
  FrmProdRepConfMatRecalc: TFrmProdRepConfMatRecalc;

implementation

{$R *.dfm}

procedure TFrmProdRepConfMatRecalc.btnYesClick(Sender: TObject);
begin
  inherited;
  FResult:= TUniButton(Sender).Tag;
  Close;
end;

end.
