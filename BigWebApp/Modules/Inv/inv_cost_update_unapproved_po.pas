unit inv_cost_update_unapproved_po;

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
  TFrmCostUpdateUnapprovedPO = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    btnCancel: TUniButton;
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
  FrmCostUpdateUnapprovedPO: TFrmCostUpdateUnapprovedPO;

implementation

{$R *.dfm}

{ TFrmCostUpdateUnapprovedPO }

procedure TFrmCostUpdateUnapprovedPO.BtnYesClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;


procedure TFrmCostUpdateUnapprovedPO.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

end.
