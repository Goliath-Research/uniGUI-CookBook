unit ChkOeBlanketQty;

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
  TCheckOeBlanketQty = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnUpdate: TUniButton;
    BtnContinue: TUniButton;
    procedure BtnUpdateClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
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

procedure TCheckOeBlanketQty.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

procedure TCheckOeBlanketQty.UniFormCreate(Sender: TObject);
begin
  inherited;
  CheckBox.Visible := false;
end;

procedure TCheckOeBlanketQty.BtnUpdateClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
