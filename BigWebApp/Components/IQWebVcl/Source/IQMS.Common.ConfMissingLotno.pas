unit IQMS.Common.ConfMissingLotno;

interface

uses
  Vcl.Forms,
  IQMS.Common.ConfBas,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, IQMS.WebVcl.SecurityRegister, uniCheckBox, uniLabel,
  System.Classes, Vcl.Controls;

type
  TFrmConfirmMissingLotNo = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoShowModalConfirmMissingLotNo(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.dfm}

uses
  uniGUIApplication;

{ TFrmConfirmMissingLotNo }

function DoShowModalConfirmMissingLotNo(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmConfirmMissingLotNo;
begin
  frm := TFrmConfirmMissingLotNo.Create(uniGUIApplication.UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

end.
