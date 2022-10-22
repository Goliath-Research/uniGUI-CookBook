unit IQMS.Common.MsgFrmTm;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  System.Classes,
  IQMS.Common.MsgFrm,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniTimer,
  uniImageList,
  uniCheckBox,
  uniButton,
  uniMemo,
  uniHTMLMemo;

type
  TFrmShowStrTimed = class(TFrmShowStr)
    Timer1: TUniTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
      { Private declarations }
      FCount: Integer;
      FKey: string;
    public
      { Public declarations }
      property CheckBoxVisible;
      property CheckBoxChecked;
      property MessageText;

      class procedure IQShowStrTimed(ACaption, AMesg: string;
              ADlgType: TMsgDlgType = mtInformation);
  end;

  procedure IQShowStrTimedChk(ACaption, AMesg, AKey: string;
              ADlgType: TMsgDlgType = mtInformation);




implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings;

const
  cSHUT_DOWN_TIME = 45;

class procedure TFrmShowStrTimed.IQShowStrTimed(ACaption, AMesg: string;
  ADlgType: TMsgDlgType = mtInformation);
begin
  TFrmShowStrTimed.DoShowModal(ACaption,AMesg,ADlgType);
end;

procedure IQShowStrTimedChk(ACaption, AMesg, AKey: string;
  ADlgType: TMsgDlgType = mtInformation);
var
  AChecked, AShowDialog: Boolean;
  AModalResult: TModalResult;
  MessageText: string;
begin
  TFrmShowStrTimed.DoShowModal(ACaption,AMesg);
//  with TFrmShowStrTimed do
//  begin
//    FKey := AKey;
//    CheckBoxVisible := True;
//    CheckBoxChecked := AChecked;
//  end;
end;

{ TFrmShowStrTimed }

procedure TFrmShowStrTimed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if CheckBoxVisible then
    IQMS.Common.RegFrm.SetDialogCheckBoxResult(FKey, CheckBoxChecked, Self.ModalResult,
      Self.MessageText);
end;

procedure TFrmShowStrTimed.Timer1Timer(Sender: TObject);
begin
  inherited; { nothing }

  Inc(FCount);
  btnOK.Caption := Format('%s (%d)', [IQMS.Common.ResStrings.cTXT0000004 { '&OK' } ,
    cSHUT_DOWN_TIME - FCount]);

  if cSHUT_DOWN_TIME - FCount <= 0 then
    btnOK.Click;
end;

end.
