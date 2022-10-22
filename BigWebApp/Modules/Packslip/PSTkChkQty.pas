unit PSTkChkQty;

interface

uses
  Vcl.Forms,
  IQMS.Common.Confbas,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton,
  uniLabel, uniCheckBox;

type
  TFrmPSTkChkQty = class(TIQDialogCheckBox)
    Label1: TUniLabel;
    pnlButtons: TUniPanel;
    btnContinue: TUniButton;
    btnCancel: TUniButton;
    procedure btnContinueClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure AssignText( S: string ); override;
  public
    { Public declarations }
     FResult : Integer;
  end;

var
  FrmPSTkChkQty: TFrmPSTkChkQty;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

procedure TFrmPSTkChkQty.btnContinueClick(Sender: TObject);
begin
  inherited; {nothing}
  FResult:= TUniButton(Sender).Tag;
  Close;
end;

procedure TFrmPSTkChkQty.AssignText( S: string );
begin
  Label1.Caption:= S;
end;

end.
