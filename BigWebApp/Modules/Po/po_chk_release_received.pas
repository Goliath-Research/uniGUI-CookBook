unit po_chk_release_received;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  IQMS.Common.Confbas,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TFrmPOChkReleaseReceived = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoShowModalPOChkReleaseReceived(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  uniGUIApplication;

function DoShowModalPOChkReleaseReceived(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmPOChkReleaseReceived;
begin
  frm := TFrmPOChkReleaseReceived.Create(UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

end.
