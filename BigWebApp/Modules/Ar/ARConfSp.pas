unit ARConfSp;

interface

uses
  Vcl.Forms,
  IQMS.Common.Confbas,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  System.Classes,
  uniGUIClasses,
  uniButton,
  uniGUIBaseClasses,
  uniLabel,
  uniCheckBox,
  uniPanel,
  uniGUIApplication;

type
  TFrmConfirmArinvtSalesAccountSplit = class(TIQDialogCheckBox)
    btnYes: TUniButton;
    btnNo: TUniButton;
    Label1: TUniLabel;
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FResult : Integer;
    procedure AssignText( S: string ); override;
  end;

  function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.DFM}

function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmConfirmArinvtSalesAccountSplit;
begin
  frm := TFrmConfirmArinvtSalesAccountSplit.Create(uniGUIApplication.UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TFrmConfirmArinvtSalesAccountSplit.AssignText( S: string );
begin
  Label1.Caption:= S;
end;


procedure TFrmConfirmArinvtSalesAccountSplit.btnYesClick(Sender: TObject);
begin
  inherited; {nothing}
  FResult:= TUniButton(Sender).Tag;
  Close;
end;

end.
