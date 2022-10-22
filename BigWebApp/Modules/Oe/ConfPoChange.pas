unit ConfPoChange;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Confbas,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TFrmConfPOChange = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
    procedure btnYesClick(Sender: TObject);
  private
    procedure SetKey(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    FResult: Integer;
    property Key : String write SetKey;
  end;

implementation

{$R *.dfm}

procedure TFrmConfPOChange.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

procedure TFrmConfPOChange.btnYesClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
