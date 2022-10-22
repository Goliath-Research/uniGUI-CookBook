unit PrChkTax;

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
  TFrmPrCheckTaxes = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    procedure BtnYesClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
     procedure SetKey(const Value: String);
  public
    { Public declarations }
    FResult : Integer;

  end;

var
  FrmPrCheckTaxes: TFrmPrCheckTaxes;

implementation

{$R *.dfm}



procedure TFrmPrCheckTaxes.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;


procedure TFrmPrCheckTaxes.BtnYesClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

procedure TFrmPrCheckTaxes.UniFormCreate(Sender: TObject);
begin
  inherited;
      CheckBox.Visible := false;
end;

end.
