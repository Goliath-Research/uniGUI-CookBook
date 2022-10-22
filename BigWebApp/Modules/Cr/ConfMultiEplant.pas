unit ConfMultiEplant;

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
  TFrmConfMultiEplant = class(TIQDialogCheckBox)
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

  function DoShowModalConfMultiEplant(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
implementation

{$R *.dfm}

uses
  uniGUIApplication;

function DoShowModalConfMultiEplant(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmConfMultiEplant;
begin
  frm := TFrmConfMultiEplant.Create(UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TFrmConfMultiEplant.SetKey(const Value: string);
begin
  inherited;

  if Value <> '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

end.
