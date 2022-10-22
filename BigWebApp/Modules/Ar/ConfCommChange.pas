unit ConfCommChange;

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
  uniButton, uniCheckBox, uniLabel;

type
  TFrmConfCommChange = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    procedure BtnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfCommChange: TFrmConfCommChange;

implementation

{$R *.dfm}

procedure TFrmConfCommChange.BtnYesClick(Sender: TObject);
begin
  Close;
end;

end.
