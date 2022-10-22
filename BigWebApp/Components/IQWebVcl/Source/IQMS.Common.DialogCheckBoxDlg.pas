unit IQMS.Common.DialogCheckBoxDlg;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
  System.Math,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniButton,
  uniBitBtn,
  uniSpeedButton;

type
//TIQDialogCheckBoxClass = class of TIQDialogCheckDlgBox;
  TIQDialogCheckDlgBox = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    CheckBox: TUniCheckBox;
    SR: TIQWebSecurityRegister;
    Bevel1: TUniPanel;
    lblConfBasMsgText: TUniLabel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    BtnCancel: TUniButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnYesClick(Sender: TObject);
    strict private
      { Private declarations }
      FYesBtnText    : String;
      FNoBtnText     : String;
      FCancelBtnText : String;
      FformCaption   : String;
      FModalResults  : TModalResult;
      FModTagResults : Integer;
      FNumButtons    : Integer;
      FShowCheckBox  : Boolean;
      procedure FixHeight;
      function  GetShowCheckBox: Boolean;
      procedure SetYesBtnText( const value : String );
      procedure SetNoBtnText( const value : String );
      procedure SetCancelBtnText( const value : String );
      procedure SetCaptionText( const value : String );
      procedure SetNumberOfButtons( const Value : Integer );
    protected
      procedure SetShowCheckBox(const Value: Boolean); virtual;
      procedure SetKey(const Value: string); virtual;
      procedure AssignText(S: string); virtual;
    public
      { Public declarations }
      property MsgText          : string                       write AssignText;
      property CaptionText      : String  read FformCaption    write SetCaptionText;
      property Key              : string                       write SetKey;
      property YesBtnText       : string  read FYesBtnText     write SetYesBtnText;
      property NoBtnText        : string  read FNoBtnText      write SetNoBtnText;
      property CancelBtnText    : string  read FCancelBtnText  write SetCancelBtnText;
      property ShowCheckBox     : Boolean read GetShowCheckBox write SetShowCheckBox;
      property NumberOfButtons  : Integer Write SetNumberOfButtons;
      property DlgTagModResults : Integer read FModTagResults;
      Property ModalResultsDlg  : TModalResult read FModalResults;
  end;

  function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
//IQSecIns,
  IQMS.Common.StringUtils;

function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TIQDialogCheckDlgBox;
begin
  frm := TIQDialogCheckDlgBox.Create(uniGUIApplication.UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TIQDialogCheckDlgBox.FormShow(Sender: TObject);
begin
  FModalResults := mrCancel;

  if (CompareText(ExtractFileName(Application.ExeName), 'IQQC.exe') = 0)
    or (CompareText(ExtractFileName(Application.ExeName), 'IQTA.exe') = 0)
    or (CompareText(ExtractFileName(Application.ExeName), 'IQPR.exe') = 0)
    or (CompareText(ExtractFileName(Application.ExeName), 'CREDITCARD.exe') = 0)
  then
    TIQRegForm.SetForceAppName('IQWin32.exe');

  IQRegFormRead(Self, [Self]);

   FixHeight;
end;

procedure TIQDialogCheckDlgBox.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TIQDialogCheckDlgBox.AssignText(S: string);
begin
  if S <> '' then
    lblConfBasMsgText.Caption := S;
end;

function TIQDialogCheckDlgBox.GetShowCheckBox: Boolean;
begin
  Result := Self.CheckBox.Visible;
end;

procedure TIQDialogCheckDlgBox.SetKey(const Value: string);
begin
 // if Length(Value) > 35 then
//   IQMS.Common.Dialogs.IQWarning('Application Warning:  Registry key value length is too ' +
//    'long.  Values must be 35 characters or less.');

  CheckBox.Visible := FShowCheckBox;
  if not FShowCheckBox then
    SR.RemoveSecurityItem('CheckBox');

  // if the user does not have rights to click the Yes button,
  // then he doesn't have rights to check the check box.
  if not SR.Enabled['btnYes'] then
  begin
    CheckBox.Checked := FALSE;
    CheckBox.Enabled := FALSE;
  end;

  if FShowCheckBox then
    IQRegFormRead(Self, [CheckBox]);

  if Value <> '' then begin
    Self.Name := IQMS.Common.StringUtils.StrTran(Value, ' ', '_');
    SR.SecurityCode := UpperCase(Value);
    SR.Refresh;
  end;
end;

procedure TIQDialogCheckDlgBox.SetShowCheckBox(const Value: Boolean);
begin
  Self.CheckBox.Visible := Value;
end;

procedure TIQDialogCheckDlgBox.BtnYesClick(Sender: TObject);
begin
  FModTagResults := TuniButton(Sender).Tag;
  FModalResults  := TUniButton(Sender).ModalResult;
end;

procedure TIQDialogCheckDlgBox.FixHeight;
const
  cCaptionBuffer = 42; // compensates for any size of form caption height, border width, etc.
var
  H1: Integer;
begin
  // This is called after the text has been assigned to lblConfBasMsgText.
  // This method resize the form to ensure all of the text displays
  // without the user needing to resize it
  lblConfBasMsgText.AutoSize := FALSE;
  lblConfBasMsgText.AutoSize := TRUE;
  lblConfBasMsgText.Update;
  H1 := Max(lblConfBasMsgText.Height, 90) + 16;
  H1 := Min(H1, Screen.DesktopHeight - 60); // but not bigger than the desktop
  Self.Height := H1 + Panel2.Height + cCaptionBuffer;
  // IQMS.Common.Controls.CenterForm(Self); // now center the form
end;

procedure TIQDialogCheckDlgBox.SetYesBtnText(const Value: string);
begin
  if Value <> '' then begin
    FYesBtnText := Value;
    BtnYes.Caption := FYesBtnText;
  end;
end;

procedure TIQDialogCheckDlgBox.SetNoBtnText(const Value: string);
begin
  if Value <> '' then Begin
    FNoBtnText := Value;
    BtnNo.Caption := FNoBtnText;
  End;
end;

procedure TIQDialogCheckDlgBox.SetCancelBtnText(const Value: string);
begin
  if Value <> '' then Begin
    FCancelBtnText := Value;
    BtnCancel.Caption := FCancelBtnText;
  End;
end;

procedure TIQDialogCheckDlgBox.SetCaptionText(const Value: string);
begin
  if Value <> '' then Begin
    FformCaption := Value;
    Caption := Value;
  End;
end;

procedure TIQDialogCheckDlgBox.SetNumberOfButtons( const Value : Integer );
begin
  FNumButtons := Value;
  if Value = 2 then
    BtnYes.Visible := False
  else if Value = 1 then begin
    BtnYes.Visible := False ;
    BtnNo.Visible := False;
  end;
end;


end.
