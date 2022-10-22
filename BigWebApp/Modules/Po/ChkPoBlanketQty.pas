unit ChkPoBlanketQty;

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
  TCheckPoBlanketQty = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnUpdate: TUniButton;
    BtnContinue: TUniButton;
  private
    { Private declarations }
  protected
    procedure SetKey(const Value: string); override;
  public
    { Public declarations }
  end;

  function DoShowModalCheckPoBlanketQty(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  uniGUIApplication;

function DoShowModalCheckPoBlanketQty(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TCheckPoBlanketQty;
begin
  frm := TCheckPoBlanketQty.Create(UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TCheckPoBlanketQty.SetKey(const Value: string);
begin
  inherited;

  if Value <> '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

end.
