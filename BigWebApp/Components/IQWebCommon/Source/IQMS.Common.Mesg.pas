unit IQMS.Common.Mesg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Consts,
  Vcl.Dialogs,
  Vcl.Forms,
  ConfBas,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIBaseClasses,
  uniGUIDialogs,
  uniCheckBox,
  uniGUIForm,
  uniGUIApplication,
  uniPanel,
  uniButton;


function IQConfirm( const AMessageText: string ):Word;
function IQConfirmYN( const AMessageText: string ):boolean;
function IQConfirmYNChk( const AMessageText, AKey: string ):Boolean;
function IQConfirmYNWithSecurity( const AMessageText, AKey: string;
  const AShowCheckBox: Boolean ):Boolean;

function IQConfirmYNWithSecurity2( const AMessageText, AKey: string;
  const AShowCheckBox: Boolean ):Boolean;


function IQWarning( const AMessageText: string ):Word;
function IQWarningYN( const AMessageText: string ):boolean;
function IQWarningChk( const AMessageText, AKey: string ):Word;
function IQWarningYNChk( const AMessageText, AKey: string ):Boolean;

function IQError( const AMessageText: string ):Word;
function IQErrorYN( const AMessageText: string ):boolean;

function IQInformation( const AMessageText: string ):Word;

function IQConfirmEx(const AMessageText: string; AButtons: array of TMsgDlgBtn ) : TModalResult;
function IQDialogChk( const AMessageText, AKey: string; ADialogType: TMsgDlgType; AButtons: TMsgDlgButtons): TModalResult;
function IQDialogChkEx( AFormClass: TIQDialogCheckBoxClass; AMsg:String = ''; AKey: string = '' ): Integer;
function IQConfirmExChk(const AMessageText: string; AKey: string; AButtons: array of TMsgDlgBtn ) : TModalResult;

procedure IQDialogTimed(ACaption, AMessage: String; ASeconds: Integer = 5);

implementation

uses
  ConfirmWithSecurity,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.JumpConstants,
  IQMS.Common.DialogsTimed;


{$REGION 'Internal'}

function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons): TUniForm;
const
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help', 'Close');
 Captions: array[TMsgDlgType] of string = (SMsgDlgWarning, SMsgDlgError,
    SMsgDlgInformation, SMsgDlgConfirm, '');

var
  DefaultButton : TMsgDlgBtn;
  btn:TUniButton;
  btnconst:TMsgDlgBtn;
  pnlButtons,pnlMsg,pnlIcon:TUniPanel;
  frm:TUniForm;
  I:Integer;

begin
  frm:=TUniForm.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    BorderStyle := bsDialog;
    Height      := 230;
    Width       := 350;
    Position    := poScreenCenter;
    KeyPreview  := True;
    Caption     := Captions[DlgType];
    pnlButtons:=TUniPanel.Create(frm);
    pnlButtons.Parent:=frm;
    pnlButtons.Layout:='fit';
    pnlButtons.Align:=alBottom;
    pnlButtons.Height:=40;

    pnlMsg:=TUniPanel.Create(frm);
    pnlMsg.Parent:=frm;
    pnlMsg.Align:=alClient;
    pnlMsg.Caption:=Msg;

    for btnconst in Buttons do
    begin
        btn:=TUniButton.Create(frm);
        btn.Parent:=pnlButtons;
        btn.ModalResult:= TModalResult(pnlButtons);
        btn.Align:=alRight;
        btn.Caption:=ButtonNames[btnconst];
    end;

  end;
  if mbOk in Buttons then DefaultButton := mbOk else
    if mbYes in Buttons then DefaultButton := mbYes else
      DefaultButton := mbRetry;
  Result:=frm;
end;

function CustomMessageDlg(const AMsg: string; ADlgType: TMsgDlgType;
  AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn): Integer;
begin
  Result:=uniGUIDialogs.MessageDlg(AMsg, ADlgType, AButtons);
end;

{$ENDREGION 'Internal'}

function IQConfirmYN( const AMessageText: string ):boolean;
begin
     Result:=UniGUIDialogs.MessageDlg(AMessageText, mtConfirmation,
        [mbYes, mbNo])=mrYes
end;

function IQConfirm( const AMessageText: string ):Word;
begin
   Result:=uniGUIDialogs.MessageDlg(AMessageText, mtConfirmation, [mbOK]);
end;

function IQWarning( const AMessageText: string ):Word;
begin
  uniGUIDialogs.MessageDlg(AMessageText, mtWarning, [mbOK]);
end;

function IQWarningYN( const AMessageText: string ):boolean;
begin
    Result:=uniGUIDialogs.MessageDlg(AMessageText, mtWarning, [mbYes, mbNo])=mrYes;
end;

function IQError( const AMessageText: string ):Word;
begin
  Result := CustomMessageDlg(AMessageText, mtError, [mbOK], mbOK)
end;

function IQErrorYN( const AMessageText: string ):boolean;
begin
    Result:=uniGUIDialogs.MessageDlg(AMessageText, mtError, [mbYes, mbNo])=mrYes;
end;

function IQConfirmEx(const AMessageText: string; AButtons: array of TMsgDlgBtn ) : TModalResult;
const
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help', 'Close');
var
  I          : Integer;
  DefBtnName : string;
  AControl   : TComponent;
  AButtonSet : TMsgDlgButtons;
begin
  AButtonSet:= [];
  for I:= 0 to High(AButtons) do
  begin
    if I = 0 then
       DefBtnName:= ButtonNames[ AButtons[ 0 ]];
    AButtonSet:= AButtonSet + [ AButtons[ I ]];
  end;

  with CreateMessageDialog(AMessageText, mtConfirmation, AButtonSet) do
  try
    AControl:= FindComponent( DefBtnName );
    if Assigned( AControl ) and (AControl is TWinControl) then
       ActiveControl:= TWinControl( AControl );
    Result:= ShowModal;
  finally
    Free;
  end;
end;


function IQDialogChk( const AMessageText, AKey: string; ADialogType: TMsgDlgType; AButtons: TMsgDlgButtons ): TModalResult;
var
  AForm     : TUniForm;
  AChkBox   : TUniCheckBox;
  LastResult: Integer;

  AChecked, AShowDialog: Boolean;
  AModalResult: TModalResult;
  AForceAppName: string;
  APriorMessageText: string;
begin

  AForm:= CreateMessageDialog( AMessageText, ADialogType, AButtons);
  AForceAppName := TIQRegForm.GetForceAppName;
  {10-26-2011 some exes have dialog check boxes "do not show again" maintained by iqwin32 - force record the settings under iqwin32}
  if    (CompareText( ExtractFileName( Application.ExeName ), 'IQQC.exe') = 0)
     or (CompareText( ExtractFileName( Application.ExeName ), 'IQTA.exe') = 0)
     or (CompareText( ExtractFileName( Application.ExeName ), 'CREDITCARD.exe') = 0)
   then
     TIQRegForm.SetForceAppName('IQWin32.exe');           // 10-06-2011 note how we record the settings under IQWin32 so Vcl.Dialogs in IQQC can be reset in SU_DoNot maintenance form

  try
    AForm.Name    := 'IQDialogCheckBox';
    AForm.Position:= poDefaultPosOnly;
    AForm.Height  := AForm.Height + 12;
    AForm.Tag     := LongInt( AKey );  {Store the key in the tag}

    AChkBox:= TUniCheckBox.Create( AForm );
    with AChkBox do
    begin
      Name   := 'CheckBox';
      Parent := AForm;
      Caption:= IQMS.Common.ResStrings.cTXT0000144; {'Do not show next time'}
      Left   := 12;
      Top    := AForm.ClientHeight - 17;
      Width  := AForm.ClientWidth - Left;
      Checked:= FALSE;
    end;

    IQRegFormRead(AForm, [AForm]);

    IQMS.Common.RegFrm.GetDialogCheckBoxResult(AKey, {var} AChecked, {var} AModalResult,
      {var} APriorMessageText, {var} AShowDialog);

    if Assigned(Application.MainForm) then
       PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);

    if AShowDialog then
       begin
         Result:= AForm.ShowModal;
         // 12/16/2013 Moved these 2 lines here.  Save the dialog only if
         // we need to save it in order to avoid hits to the Registry.
         IQRegFormWrite(AForm, [AForm]);
         IQMS.Common.RegFrm.SetDialogCheckBoxResult(AKey, AChkBox.Checked, Result, AMessageText);
       end
    else
      Result:= AModalResult;

  finally
    TIQRegForm.SetForceAppName(AForceAppName);
    FreeAndNil(AForm);
  end;
end;

function IQDialogChkEx( AFormClass: TIQDialogCheckBoxClass; AMsg:String = ''; AKey: string = '' ): Integer;
var
  AForm: TIQDialogCheckBox;
  AChecked, AShowDialog: Boolean;
  AModalResult: TModalResult;
  AMessageText: string;
  AForceAppName: string;
begin

  AForm:= AFormClass.Create( AMsg, AKey );
  try
    AForceAppName := TIQRegForm.GetForceAppName;
    if  (CompareText( ExtractFileName( Application.ExeName ), 'IQTA.exe') = 0)
      or (CompareText( ExtractFileName( Application.ExeName ), 'IQPR.exe') = 0)
      or (CompareText( ExtractFileName( Application.ExeName ), 'CREDITCARD.exe') = 0)
      then
      TIQRegForm.SetForceAppName('IQWin32.exe');

    IQRegFormRead(AForm, [AForm]);

    IQMS.Common.RegFrm.GetDialogCheckBoxResult(AKey, {var} AChecked, {var} AModalResult,
      {var} AMessageText, {var} AShowDialog);

    with AForm do
    try
      CheckBox.Checked := AChecked;

      if AShowDialog then
       begin
         if Assigned(Application.MainForm) then
            PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
         ShowModal;
         Result := FResult;
         // 12/16/2013 Moved these 2 lines here.  Save the dialog only if
         // we need to save it in order to avoid hits to the Registry.
         IQRegFormWrite(AForm, [AForm]);
         IQMS.Common.RegFrm.SetDialogCheckBoxResult(AKey, CheckBox.Checked, TModalResult(Result), AMsg);
       end
      else
       Result := Ord(AModalResult);
    finally
      TIQRegForm.SetForceAppName(AForceAppName);
    end;
  finally
    AForm.Free;
  end;
end;

function IQWarningChk( const AMessageText, AKey: string ):Word;
begin
  Result := IQDialogChk( AMessageText, AKey, mtWarning, [ mbOK ]);
end;

function IQWarningYNChk( const AMessageText, AKey: string ):Boolean;
begin
  Result:= IQDialogChk( AMessageText, AKey, mtWarning, [ mbYes, mbNo ]) = mrYes;
end;

function IQConfirmYNChk( const AMessageText, AKey: string ):Boolean;
begin
  Result:= IQDialogChk( AMessageText, AKey, mtConfirmation, [ mbYes, mbNo ]) = mrYes;
end;

function IQConfirmYNWithSecurity( const AMessageText, AKey: string;
  const AShowCheckBox: Boolean ):Boolean;
begin
  Result := TFrmConfirmWithSecurity.DoShowModal(AMessageText, AKey, AShowCheckBox);
end;

function IQConfirmYNWithSecurity2( const AMessageText, AKey: string;  const AShowCheckBox: Boolean ):Boolean;
var
  AAns:TModalResult;
begin
  AAns := IQDialogChk(AMessageText, 'ISECINS_DENY_ACCESS', TMsgDlgType.mtConfirmation,  mbYesNo);
  Result := (AAns = mrYes);
end;


function IQInformation( const AMessageText: string ):Word;
begin
  Result := uniGUIDialogs.MessageDlg(AMessageText, mtInformation, [mbOK]);
end;

function IQConfirmExChk(const AMessageText: string; AKey: string; AButtons: array of TMsgDlgBtn ) : TModalResult;
const
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help', 'Close');
var
  AChkBox   : TUniCheckBox;
  LastResult: Integer;
  AForm     : TUniForm;
  I          : Integer;
  DefBtnName : string;
  AControl   : TComponent;
  AButtonSet : TMsgDlgButtons;

  AChecked, AShowDialog: Boolean;
  AModalResult: TModalResult;
  APriorMessageText: string;
begin
  AButtonSet:= [];
  for I:= 0 to High(AButtons) do
  begin
    if I = 0 then
       DefBtnName:= ButtonNames[ AButtons[ 0 ]];
    AButtonSet:= AButtonSet + [ AButtons[ I ]];
  end;

  AForm:= CreateMessageDialog(AMessageText, mtConfirmation, AButtonSet);

  AForm.Name    := 'IQDialogCheckBox';
  AForm.Position:= poDefaultPosOnly;
  AForm.Height  := AForm.Height + 12;
  AForm.Tag     := LongInt( AKey );  {Store the key in the tag}

  AChkBox:= TUniCheckBox.Create( AForm );
  with AChkBox do
  begin
    Name   := 'CheckBox';
    Parent := AForm;
    Caption:= IQMS.Common.ResStrings.cTXT0000144; {'Do not show next time'}
    Left   := 12;
    Top    := AForm.ClientHeight - 17;
    Width  := AForm.ClientWidth - Left;
    Checked:= FALSE;
  end;

  IQRegFormRead(AForm, [AForm]);
//  IQMS.Common.RegFrm.GetDialogCheckBoxResult(AKey, {var} AChecked, {var} AModalResult,
//    {var} APriorMessageText, {var} AShowDialog);

  AControl:= AForm.FindComponent( DefBtnName );
  if Assigned( AControl ) and (AControl is TWinControl) then
     AForm.ActiveControl:= TWinControl( AControl );

  if AShowDialog then
     Result:= AForm.ShowModal
  else
     Result:= AModalResult;

  //IQRegFormWrite(AForm, [AForm]);
  if AShowDialog then
    IQMS.Common.RegFrm.SetDialogCheckBoxResult(AKey, AChkBox.Checked, Result, AMessageText);


end;

procedure IQDialogTimed(ACaption, AMessage: String; ASeconds: Integer);
var
  frm : TFrmIQTimedMessageDlg;
begin
  frm := TFrmIQTimedMessageDlg.Create(uniGUIApplication.UniApplication);
  frm.Caption := ACaption;
  frm.SetText(AMessage);
  frm.CloseTimer.Interval := ASeconds * 1000;
  frm.CloseTimer.Enabled  := True;
  frm.ShowModal;
end;

end.
