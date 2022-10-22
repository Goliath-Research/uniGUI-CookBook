unit ExpConfVend;

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
  TFrmConfVendor = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    btnCancel: TUniButton;
    procedure BtnOkClick(Sender: TObject);

  private
    { Private declarations }
     procedure SetKey(const Value: String);
     procedure SetStr(const Value: String);
  public
    { Public declarations }
     AStr : String ;
     AKey  : String ;
     FResult : Integer;
    property Key : String write SetKey;
    property str : String write SetStr;
  end;

var
  FrmConfVendor: TFrmConfVendor;

implementation

{$R *.dfm}


procedure TFrmConfVendor.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;


procedure TFrmConfVendor.SetStr(const Value: String);
begin
  AStr := Value;
end;


procedure TFrmConfVendor.BtnOkClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;



end.
