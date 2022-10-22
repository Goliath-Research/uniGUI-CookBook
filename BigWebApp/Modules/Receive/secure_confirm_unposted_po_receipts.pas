unit secure_confirm_unposted_po_receipts;

interface

uses
  { TODO -ohphadke -cWEBIQ a: Dependecy
  secured_confirm,
  }
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel, IQMS.Common.SecuredConfirm, uniLabel, Vcl.Graphics, uniImage,
  uniButton, System.Classes, Vcl.Controls, Vcl.Forms;

type
  TFrmSecuredConfirmUnPostedPOReceipt = class(TFrmSecuredConfirm)
    Bevel4: TUniPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmSecuredConfirmUnPostedPOReceipt.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible := FALSE;

end;

end.
