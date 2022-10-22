unit PSConfDelEmpty;

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
  uniLabel;

type
  TFrmPSConfDelEmptyTktLine = class(TIQDialogCheckBox)
    Label1: TUniLabel;
    pnlButtons: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssignText( S: string ); override;
  end;

var
  FrmPSConfDelEmptyTktLine: TFrmPSConfDelEmptyTktLine;

implementation

{$R *.DFM}

procedure TFrmPSConfDelEmptyTktLine.AssignText( S: string );
begin
  Label1.Caption:= S;
end;

procedure TFrmPSConfDelEmptyTktLine.btnYesClick(Sender: TObject);
begin
  inherited; {nothing}
//  FResult:= TUniButton(Sender).Tag;
  Close;
end;

end.
