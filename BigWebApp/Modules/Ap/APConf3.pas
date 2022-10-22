unit APConf3;

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
  uniButton,
  uniCheckBox,
  uniLabel,
  uniGUIApplication;

type
  TFrmOutOfBal = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    btnEdit: TUniButton;
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetKey(const Value: String);
  public
    { Public declarations }
    FResult : Integer;
    property Key : String write SetKey;

  end;

  function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.DFM}

function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmOutOfBal;
begin
  frm := TFrmOutOfBal.Create(uniGUIApplication.UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TFrmOutOfBal.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

procedure TFrmOutOfBal.BtnOkClick(Sender: TObject);
begin
  FResult := TUniButton(Sender).Tag;
  Close;
end;

end.
