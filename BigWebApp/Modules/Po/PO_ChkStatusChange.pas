unit PO_ChkStatusChange;

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
  uniButton,
  uniLabel, uniCheckBox, uniGUIApplication;

type
  TFrmPOChkStatusChange = class(TIQDialogCheckBox)
    Label1: TUniLabel;
    Panel3: TUniPanel;
    btnContinue: TUniButton;
    btnCancel: TUniButton;
  private
    { Private declarations }
  protected
    procedure AssignText( S: string ); override;
  public
    { Public declarations }
  end;

  function DoShowModalPOChkStatusChange(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
implementation

{$R *.DFM}

{ TFrmPOChkStatusChange }

function DoShowModalPOChkStatusChange(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TFrmPOChkStatusChange;
begin
  frm := TFrmPOChkStatusChange.Create(UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TFrmPOChkStatusChange.AssignText(S: string);
begin
  Label1.Caption:= S;
end;

end.
