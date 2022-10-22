unit oe_confirm_rel_dates_past;

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
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniCheckBox, uniLabel;

type
  TFrmOEConfirmReleaseDateInPast = class(TIQDialogCheckBox)
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnAbort: TUniButton;
    procedure btnYesClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetKey(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    FResult : Integer;
    procedure AssignText( S: string ); override;
    property Key : String write SetKey;

  end;

implementation

{$R *.dfm}

procedure TFrmOEConfirmReleaseDateInPast.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     SR.SecurityCode := UpperCase(Value);
     SR.Refresh;
  end;
end;

procedure TFrmOEConfirmReleaseDateInPast.UniFormCreate(Sender: TObject);
begin
  inherited;
  CheckBox.Visible := TRUE; //EIQ-3113 SER# 05523 - Add do not show functionality to requested/promised date occurs in the past confirmation in Sales Orders
end;

procedure TFrmOEConfirmReleaseDateInPast.AssignText(S: string);
begin
  lblConfBasMsgText.Caption:= S;
end;

procedure TFrmOEConfirmReleaseDateInPast.btnYesClick(Sender: TObject);
begin
  inherited;
  FResult:= TUniButton(Sender).Tag;
  Close;
end;

end.
