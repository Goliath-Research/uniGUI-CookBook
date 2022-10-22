unit POConf;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Confbas,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TFrm_POReceivedReleasesConfirm = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
  private
    { Private declarations }
  protected
    procedure SetKey(const Value: string); override;
  public
    { Public declarations }
  end;

  function DoShowModalPOReceivedReleasesConfirm(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  uniGUIApplication;

function DoShowModalPOReceivedReleasesConfirm(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrm_POReceivedReleasesConfirm;
begin
  frm := TFrm_POReceivedReleasesConfirm.Create(UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TFrm_POReceivedReleasesConfirm.SetKey(const Value: string);
begin
  inherited;

  if Value <> '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

end.
