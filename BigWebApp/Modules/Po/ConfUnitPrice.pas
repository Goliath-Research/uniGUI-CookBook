unit ConfUnitPrice;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Confbas,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TFrmConfUnitPrice = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
  private
    { Private declarations }
  protected
    procedure SetKey(const Value: string); override;
  public
    { Public declarations }
  end;

  function DoShowModalConfUnitPrice(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
implementation

{$R *.dfm}

uses
  uniGUIApplication;

function DoShowModalConfUnitPrice(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmConfUnitPrice;
begin
  frm := TFrmConfUnitPrice.Create(UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TFrmConfUnitPrice.SetKey(const Value: string);
begin
  inherited;

  if Value <> '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

end.
