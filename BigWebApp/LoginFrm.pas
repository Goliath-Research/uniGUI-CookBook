unit LoginFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniEdit,
  Vcl.Imaging.pngimage, uniImage, uniButton, uniBitBtn, uniImageList,
  uniMultiItem, uniComboBox, uniTimer;

type
  TUniLoginForm1 = class(TUniLoginForm)
    UserNameEdit: TUniEdit;
    PasswordEdit: TUniEdit;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    UniImage2: TUniImage;
    UniNativeImageList1: TUniNativeImageList;
    KeepAliveTimer: TUniTimer;
    procedure UniLoginFormCreate(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure PasswordEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UserNameEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  strict private
    { Private declarations }
    FLoginAttemptsCounter : Integer;
  public
    { Public declarations }
  end;

function UniLoginForm1: TUniLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, IQMS.Common.Login;

function UniLoginForm1: TUniLoginForm1;
begin
  Result := TUniLoginForm1(UniMainModule.GetFormInstance(TUniLoginForm1));
end;

procedure TUniLoginForm1.PasswordEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    UniBitBtn1Click(Sender);
end;

procedure TUniLoginForm1.UniBitBtn1Click(Sender: TObject);
begin
  Inc(FLoginAttemptsCounter);
  if (FLoginAttemptsCounter < 3) and (UniMainModule.Login(UserNameEdit.Text, PasswordEdit.Text, DatabaseComboBox.Text)) then
    ModalResult := mrOk
  else if (FLoginAttemptsCounter >= 3) then
    begin
      TLogin.CheckRecordFailedLogin( UserNameEdit.Text, DatabaseComboBox.Text );
      ModalResult:= mrCancel;
    end
  else
    MessageDlg('Invalid Credentials!', mtError, [mbOK]);
end;

procedure TUniLoginForm1.UniLoginFormCreate(Sender: TObject);
begin
  FLoginAttemptsCounter := 0;
  UserNameEdit.Text := UniApplication.Parameters.Values['username'];
  PasswordEdit.Text := UniApplication.Parameters.Values['password'];
end;

procedure TUniLoginForm1.UserNameEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    ActiveControl := PasswordEdit;
end;

initialization
  RegisterAppFormClass(TUniLoginForm1);

end.
