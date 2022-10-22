unit ConfNetChange;

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
  uniButton;

type
  TFrmConfNetChange = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    procedure BtnYesClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetKey(const Value: String);
  public
    { Public declarations }
    FResult : Integer;
    property Key : String write SetKey;

  end;

var
  FrmConfNetChange: TFrmConfNetChange;

implementation

{$R *.dfm}

procedure TFrmConfNetChange.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;




procedure TFrmConfNetChange.BtnYesClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
