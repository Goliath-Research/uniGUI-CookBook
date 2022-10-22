unit IQMS.Common.ConfBas;

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
  TIQDialogCheckBoxClass = class of TIQDialogCheckBox;

  TIQDialogCheckBox = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    CheckBox: TUniCheckBox;
    SR: TIQWebSecurityRegister;
    Bevel1: TUniPanel;
    lblConfBasMsgText: TUniLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    strict private
      { Private declarations }
      procedure FixHeight;
      function GetShowCheckBox: Boolean;
    protected
      procedure SetShowCheckBox(const Value: Boolean); virtual;
      procedure SetKey(const Value: string); virtual;
      procedure AssignText(S: string); virtual;
    public
      { Public declarations }

      property MsgText      : string                       write AssignText;
      property Key          : string                       write SetKey;
      property ShowCheckBox : Boolean read GetShowCheckBox write SetShowCheckBox;
  end;

  function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
//  IQSecIns,
  IQMS.Common.StringUtils;

function DoShowModalDialogCheckBox(AStr, AKey : string; AShowCheckBox : boolean = false) : boolean;
var
  frm : TIQDialogCheckBox;
begin
  frm := TIQDialogCheckBox.Create(uniGUIApplication.UniApplication);

  frm.MsgText       := AStr;
  frm.Key           := AKey;
  frm.ShowCheckBox  := AShowCheckBox;

  Result := frm.ShowModal = mrOk;
end;

procedure TIQDialogCheckBox.FormShow(Sender: TObject);
begin
//  IQMS.Common.Controls.ResizeCheckBoxes(Self, Panel2);
  // IQMS.Common.Controls.CenterForm(Self); // center the form
//  EnsureSecurityInspectorOnTopOf(Self);

  if   (CompareText(ExtractFileName(Application.ExeName), 'IQQC.exe') = 0)
    or (CompareText(ExtractFileName(Application.ExeName), 'IQTA.exe') = 0)
    or (CompareText(ExtractFileName(Application.ExeName), 'IQPR.exe') = 0)
    or (CompareText(ExtractFileName(Application.ExeName), 'CREDITCARD.exe') = 0)
  then
    TIQRegForm.SetForceAppName('IQWin32.exe');

  IQRegFormRead(Self, [Self]);

  FixHeight;
end;

procedure TIQDialogCheckBox.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TIQDialogCheckBox.AssignText(S: string);
begin
  if S <> '' then
    lblConfBasMsgText.Caption := S;
end;

function TIQDialogCheckBox.GetShowCheckBox: Boolean;
begin
  Result := Self.CheckBox.Visible;
end;

procedure TIQDialogCheckBox.SetKey(const Value: string);
begin
  if Value <> '' then
    Self.Name := IQMS.Common.StringUtils.StrTran(Value, ' ', '_');
end;

procedure TIQDialogCheckBox.SetShowCheckBox(const Value: Boolean);
begin
  Self.CheckBox.Visible := Value;
end;

procedure TIQDialogCheckBox.FixHeight;
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

end.
