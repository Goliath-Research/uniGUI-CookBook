unit CDConfAmount;

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
  TCheckAmountPaid = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    procedure BtnYesClick(Sender: TObject);
 //   procedure UniFormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure SetKey(const Value: String);
  public
    { Public declarations }
    FResult : Integer;
    property Key : String write SetKey;

  end;

var
  CheckAmountPaid: TCheckAmountPaid;

implementation

{$R *.dfm}



procedure TCheckAmountPaid.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;


procedure TCheckAmountPaid.BtnYesClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
