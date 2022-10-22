unit CheckClosed;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Confbas,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, IQMS.WebVcl.SecurityRegister, uniCheckBox, uniLabel, Vcl.Controls;

type
  TCheckPostReceived = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    procedure BtnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;



implementation

{$R *.dfm}



procedure TCheckPostReceived.BtnYesClick(Sender: TObject);
begin
  //Result := TUniButton(Sender).Tag;
  Close;
end;

end.
