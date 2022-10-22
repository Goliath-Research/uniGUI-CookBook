unit prod_conf_archive;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  IQMS.Common.Confbas,
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, IQMS.WebVcl.SecurityRegister, uniCheckBox, uniLabel;

type
  TFrmProdRepConfirmArchive = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetKey(const Value: String);
  public
    { Public declarations }
    FResult : Integer;
    procedure AssignText( S: string ); override;
    property Key : String write SetKey;

  end;

  {to allow to differentiate between close and archive}
  TFrmProdRepConfirmClose = class(TFrmProdRepConfirmArchive)
  end;
  

var
  FrmProdRepConfirmArchive: TFrmProdRepConfirmArchive;

implementation

{$R *.dfm}

{ TIQDialogCheckBox1 }

procedure TFrmProdRepConfirmArchive.AssignText(S: string);
begin
  lblConfBasMsgText.Caption:= S;
end;

procedure TFrmProdRepConfirmArchive.btnYesClick(Sender: TObject);
begin
  FResult:= TUniButton(Sender).Tag;
  Close;
end;

procedure TFrmProdRepConfirmArchive.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

end.
