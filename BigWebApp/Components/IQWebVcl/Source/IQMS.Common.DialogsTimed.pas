unit IQMS.Common.DialogsTimed;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  System.Math,
  Consts,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel, System.Classes;

type
  TFrmIQTimedMessageDlg = class(TUniForm)
    CloseTimer: TUniTimer;
    lblMsgText: TUniLabel;
    btnOk: TUniBitBtn;
    procedure CloseTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetText(AText: String);
  end;

  // see IQMesg.pas for wrapper


implementation

{$R *.dfm}

uses
  IQMS.Common.Controls;

{ TFrmIQTimedMessageDlg }

procedure TFrmIQTimedMessageDlg.SetText(AText: String);
const
   cCaptionBuffer = 42; // compensates for any size of form caption height, border width, etc.
   cButtonBuffer = 42;
var
   H1: Integer;
begin

  // Set the caption text and force the TLabel to autosize
  lblMsgText.AutoSize := FALSE;
  lblMsgText.Caption := WrapText(AText, #10, ['.', ' ', #9, '-'], 500);
  lblMsgText.Width := 500;
  lblMsgText.AutoSize := TRUE;
  lblMsgText.Update;
  Self.ClientWidth := lblMsgText.Width + 8;

  // Set form height
  H1 := Max(lblMsgText.Height, 18) + 16;
  H1 := Min(H1, Screen.DesktopHeight-60); // but not bigger than the desktop
  Self.Height := H1 + cButtonBuffer + cCaptionBuffer;

  // now center the form
  //IQMS.Common.Controls.CenterForm(Self);

  // Position the button
  btnOk.Caption := consts.SMsgDlgOK;
  btnOk.Top  := (Self.ClientHeight - btnOk.Height) - 8; ///lblMsgText.Top + lblMsgText.Height + 16;
  btnOk.Left := (Self.ClientWidth div 2) - (btnOk.Width div 2);
end;

procedure TFrmIQTimedMessageDlg.CloseTimerTimer(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
