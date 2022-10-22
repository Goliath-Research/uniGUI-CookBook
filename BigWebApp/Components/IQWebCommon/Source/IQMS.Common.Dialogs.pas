unit IQMS.Common.Dialogs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Dialogs, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls;


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
function IQDialogChkEx( AFormClass: TFormClass; AMsg:String = ''; AKey: string = '' ): Integer;
function IQConfirmExChk(const AMessageText: string; AKey: string; AButtons: array of TMsgDlgBtn ) : TModalResult;

procedure IQDialogTimed(ACaption, AMessage: String; ASeconds: Integer = 5);


implementation

uses
   uniGUIDialogs;
//  ConfirmWithSecurity,
//  IQAppSet,
//  IQMsgDlgTimed,
//  IQRegFrm,
//  IQMS.Common.ResourceStrings,
//  IQString,
//  IQUsrMSg,
//  touchscrn;

{$REGION 'Internal'}

function CustomMessageDialog(const AMessage : string; const ADlgType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn): TForm;
begin
  Result := nil;
//  Result := CreateMessageDialog(AMessage, ADlgType, AButtons, ADefaultButton);
//  with Result do
//    begin
//      SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or
//        WS_EX_APPWINDOW or WS_EX_TOPMOST);
//      SetWindowLong(Handle, GWL_HWNDPARENT, GetDesktopwindow);
//      FormStyle := fsStayOnTop;
//      BringToFront;
//    end;
end;

function CustomMessageDlg(const AMsg: string; ADlgType: TMsgDlgType;
  AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn): Integer;
begin
  Result := 0;
//  with CustomMessageDialog(AMsg, ADlgType, AButtons, ADefaultButton) do
//  try
//    Application.BringToFront;
//    Result := ShowModal;
//  finally
//    Release;
//  end;
end;

{$ENDREGION 'Internal'}

function IQConfirmYN( const AMessageText: string ):boolean;
var
  aResult:Boolean;
begin
   uniGUIDialogs.MessageDlg(AMessageText, mtConfirmation, mbYesNo,
   procedure(Sender: TComponent; Res: Integer) //callback
    begin
      case Res of
        mrYes : aResult:=True;
        mrNo  : aResult:=False;
      end;
    end);
    Result:=aResult;
end;

function IQConfirm( const AMessageText: string ):Word;
begin
  Result := 0;
  Result :=uniGUIDialogs.MessageDlg(AMessageText, mtConfirmation, [mbOK])
end;

function IQWarning( const AMessageText: string ):Word;
begin
  Result := 0;
// try
//  if not IsConsole and not IsCGI then
//    begin
//      if Assigned(Application.MainForm) then
//         PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//     if IQAppSet.IsTouchScreen then
//       begin
//           touchscrn.TouchScreen_Msg_Warning(AMessageText);
//           Result := mrOk;
//       end
//     else
//       Result := MessageDlg(AMessageText, mtWarning, [mbOK], 0 )
//    end
//  else
//    raise Exception.Create(AMessageText);
// finally
//   Screen.Cursor:= crDefault;
// end;
end;

function IQWarningYN( const AMessageText: string ):boolean;
begin
  Result := uniGUIDialogs.MessageDlg(AMessageText, mtWarning, [mbYes, mbNo]) = mrYes;
//  if not IsConsole and not IsCGI then
//     begin
//       if Assigned(Application.MainForm) then
//          PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//       if IQAppSet.IsTouchScreen then
//         Result := touchscrn.TouchScreen_Msg_WarningYN(AMessageText)
//       else
//         Result := MessageDlg(AMessageText, mtWarning, [mbYes, mbNo], 0 ) = mrYes
//     end
//  else
//     Result:= TRUE;
end;

function IQError( const AMessageText: string ):Word;
begin
  Result := 0;
// try
//  if not IsConsole and not IsCGI then
//     begin
//       if Assigned(Application.MainForm) then
//          PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//     if IQAppSet.IsTouchScreen then
//       begin
//         touchscrn.TouchScreen_Msg_Error(AMessageText);
//         Result := mrOk;
//       end
//     else
////        09/08/2014 CustomMessageDlg (this unit, above) ensures the error
////        message displays on top of the calling form, even if it is called
////        through DCOM and the main form is a hidden launcher. (Byron)
////        Made for YouTrack issue:
////        EIQ-3999 Receiving - Jump to SPC, insufficient rights AV and error  - internal
//       Result := CustomMessageDlg(AMessageText, mtError, [mbOK], mbOK)
//     end
//  else
//    raise Exception.Create(AMessageText);
// finally
//   Screen.Cursor:= crDefault;
// end;
end;

function IQErrorYN( const AMessageText: string ):boolean;
begin
  Result := False;
//  if not IsConsole and not IsCGI then
//     begin
//       if Assigned(Application.MainForm) then
//          PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//       if IQAppSet.IsTouchScreen then
//         Result := touchscrn.TouchScreen_Msg_ErrorYN(AMessageText)
//       else
//         Result :=  MessageDlg(AMessageText, mtError, [mbYes, mbNo], 0 ) = mrYes
//     end
//  else
//     Result:= FALSE;
end;

function IQConfirmEx(const AMessageText: string; AButtons: array of TMsgDlgBtn ) : TModalResult;
//const
//  ButtonNames: array[TMsgDlgBtn] of string = (
//    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
//    'YesToAll', 'Help', 'Close');
//var
//  I          : Integer;
//  DefBtnName : string;
//  AControl   : TComponent;
//  AButtonSet : TMsgDlgButtons;
begin
  Result := mrOk;
//  if IsConsole or IsCGI then
//    Exit(mrOk);
//
//  AButtonSet:= [];
//  for I:= 0 to High(AButtons) do
//  begin
//    if I = 0 then
//       DefBtnName:= ButtonNames[ AButtons[ 0 ]];
//    AButtonSet:= AButtonSet + [ AButtons[ I ]];
//  end;
//
//  with CreateMessageDialog(AMessageText, mtConfirmation, AButtonSet) do
//  try
//    AControl:= FindComponent( DefBtnName );
//    if Assigned( AControl ) and (AControl is TWinControl) then
//       ActiveControl:= TWinControl( AControl );
//    if Assigned(Application.MainForm) then
//       PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//    Result:= ShowModal;
//  finally
//    Free;
//  end;
end;


function IQDialogChk( const AMessageText, AKey: string; ADialogType: TMsgDlgType; AButtons: TMsgDlgButtons ): TModalResult;
//var
//  AForm     : TForm;
//  AChkBox   : TCheckBox;
//  LastResult: Integer;
//
//  AChecked, AShowDialog: Boolean;
//  AModalResult: TModalResult;
//  AForceAppName: string;
//  APriorMessageText: string;
begin
  Result := mrOk;
//  if IsConsole or IsCGI then
//    Exit(mrOk);
//
//  AForm:= CreateMessageDialog( AMessageText, ADialogType, AButtons);
//  AForceAppName := TIQRegForm.GetForceAppName;
//  {10-26-2011 some exes have dialog check boxes "do not show again" maintained by iqwin32 - force record the settings under iqwin32}
//  if    (CompareText( ExtractFileName( Application.ExeName ), 'IQQC.exe') = 0)
//     or (CompareText( ExtractFileName( Application.ExeName ), 'IQTA.exe') = 0)
//     or (CompareText( ExtractFileName( Application.ExeName ), 'CREDITCARD.exe') = 0)
//   then
//     TIQRegForm.SetForceAppName('IQWin32.exe');           // 10-06-2011 note how we record the settings under IQWin32 so Vcl.Dialogs in IQQC can be reset in SU_DoNot maintenance form
//
//  try
//    AForm.Name    := 'IQDialogCheckBox';
//    AForm.Position:= poDefaultPosOnly;
//    AForm.Height  := AForm.Height + 12;
//    AForm.Tag     := LongInt( AKey );  {Store the key in the tag}
//
//    AChkBox:= TCheckBox.Create( AForm );
//    with AChkBox do
//    begin
//      Name   := 'CheckBox';
//      Parent := AForm;
//      Caption:= IQMS.Common.ResourceStrings.cTXT0000144; {'Do not show next time'}
//      Left   := 12;
//      Top    := AForm.ClientHeight - 17;
//      Width  := AForm.ClientWidth - Left;
//      Checked:= FALSE;
//    end;
//
//    IQRegFormRead(AForm, [AForm]);
//
//    iqregfrm.GetDialogCheckBoxResult(AKey, {var} AChecked, {var} AModalResult,
//      {var} APriorMessageText, {var} AShowDialog);
//
//    if Assigned(Application.MainForm) then
//       PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//
//    if AShowDialog then
//       begin
//         Result:= AForm.ShowModal;
//         // 12/16/2013 Moved these 2 lines here.  Save the dialog only if
//         // we need to save it in order to avoid hits to the Registry.
//         IQRegFormWrite(AForm, [AForm]);
//         iqregfrm.SetDialogCheckBoxResult(AKey, AChkBox.Checked, Result, AMessageText);
//       end
//    else
//      Result:= AModalResult;
//
//  finally
//    TIQRegForm.SetForceAppName(AForceAppName);
//    FreeAndNil(AForm);
//  end;
end;

function IQDialogChkEx( AFormClass: TFormClass; AMsg:String = ''; AKey: string = '' ): Integer;
//var
//  AForm: TIQDialogCheckBox;
//  AChecked, AShowDialog: Boolean;
//  AModalResult: TModalResult;
//  AMessageText: string;
//  AForceAppName: string;
begin
  Result := 0;
//  if IsConsole or IsCGI then
//    Exit(0);
//
//  AForm:= AFormClass.Create( AMsg, AKey );
//  try
//    AForceAppName := TIQRegForm.GetForceAppName;
//    if  (CompareText( ExtractFileName( Application.ExeName ), 'IQTA.exe') = 0)
//      or (CompareText( ExtractFileName( Application.ExeName ), 'IQPR.exe') = 0)
//      or (CompareText( ExtractFileName( Application.ExeName ), 'CREDITCARD.exe') = 0)
//      then
//      TIQRegForm.SetForceAppName('IQWin32.exe');
//
//    IQRegFormRead(AForm, [AForm]);
//
//    iqregfrm.GetDialogCheckBoxResult(AKey, {var} AChecked, {var} AModalResult,
//      {var} AMessageText, {var} AShowDialog);
//
//    with AForm do
//    try
//      CheckBox.Checked := AChecked;
//
//      if AShowDialog then
//       begin
//         if Assigned(Application.MainForm) then
//            PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//         ShowModal;
//         Result := FResult;
//         // 12/16/2013 Moved these 2 lines here.  Save the dialog only if
//         // we need to save it in order to avoid hits to the Registry.
//         IQRegFormWrite(AForm, [AForm]);
//         iqregfrm.SetDialogCheckBoxResult(AKey, CheckBox.Checked, TModalResult(Result), AMsg);
//       end
//      else
//       Result := Ord(AModalResult);
//    finally
//      TIQRegForm.SetForceAppName(AForceAppName);
//    end;
//  finally
//    AForm.Free;
//  end;
end;

function IQWarningChk( const AMessageText, AKey: string ):Word;
begin
  Result := 0;
//  if IsConsole or IsCGI then
//    Exit(0);
//  Result := IQDialogChk( AMessageText, AKey, mtWarning, [ mbOK ]);
end;

function IQWarningYNChk( const AMessageText, AKey: string ):Boolean;
begin
  Result := False;
//  if IsConsole or IsCGI then
//    Exit(True);
//
//  {Ex:  IQWarningYNChk( 'Abort?', 'Prod_Rep_Remove_Hist') then ...  }
//  if IQAppSet.IsTouchScreen then
//    Result := touchscrn.TouchScreen_Msg_Chk(AMessageText, mtWarning, [ mbYes, mbNo ], AKey, True)
//  else
//    Result:= IQDialogChk( AMessageText, AKey, mtWarning, [ mbYes, mbNo ]) = mrYes;
end;

function IQConfirmYNChk( const AMessageText, AKey: string ):Boolean;
begin
  Result := False;
//  if IsConsole or IsCGI then
//    Exit(True);
//
//  {Ex:  IQConfirmYNChk( 'Total Qty Changed. Update Unit Price?', 'OE_Change_Unit_Price_On_Qty_Change') then ...  }
//  if IQAppSet.IsTouchScreen then
//    Result := touchscrn.TouchScreen_Msg_ConfirmYNChk(AMessageText, AKey, True)
//  else
//    Result:= IQDialogChk( AMessageText, AKey, mtConfirmation, [ mbYes, mbNo ]) = mrYes;
end;

function IQConfirmYNWithSecurity( const AMessageText, AKey: string;
  const AShowCheckBox: Boolean ):Boolean;
begin
  Result := False;
//  if IsConsole or IsCGI then
//    Exit(True);
//
//  if IQAppSet.IsTouchScreen then
//    Result := touchscrn.TouchScreen_Msg_ConfirmYNChk(AMessageText, AKey, AShowCheckBox)
//  else
//    Result := TFrmConfirmWithSecurity.DoShowModal(AMessageText, AKey, AShowCheckBox);
end;

function IQConfirmYNWithSecurity2( const AMessageText, AKey: string;
  const AShowCheckBox: Boolean ):Boolean;
begin
  Result := False;
//  if IsConsole or IsCGI then
//    Exit(True);
//
//  if IQAppSet.IsTouchScreen then
//    Result := touchscrn.TouchScreen_Msg_ConfirmYNChk(AMessageText, AKey, AShowCheckBox)
//  else
//    Result := TFrmConfirmWithSecurity.DoShowModal2(AMessageText, AKey, AShowCheckBox);
end;


function IQInformation( const AMessageText: string ):Word;
begin
  Result := 0;
// try
//  if not IsConsole and not IsCGI then
//     begin
//       if Assigned(Application.MainForm) then
//          PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//       if IQAppSet.IsTouchScreen then
//         begin
//           touchscrn.TouchScreen_Msg_Information(AMessageText);
//           Result := mrOk;
//         end
//       else
//         Result := MessageDlg(AMessageText, mtInformation, [mbOK], 0 )
//     end;
////  else
////    raise Exception.Create(AMessageText);
// finally
//   Screen.Cursor:= crDefault;
// end;
end;

function IQConfirmExChk(const AMessageText: string; AKey: string; AButtons: array of TMsgDlgBtn ) : TModalResult;
//const
//  ButtonNames: array[TMsgDlgBtn] of string = (
//    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
//    'YesToAll', 'Help', 'Close');
//var
//  AChkBox   : TCheckBox;
//  LastResult: Integer;
//  AForm     : TForm;
//  I          : Integer;
//  DefBtnName : string;
//  AControl   : TComponent;
//  AButtonSet : TMsgDlgButtons;
//
//  AChecked, AShowDialog: Boolean;
//  AModalResult: TModalResult;
//  APriorMessageText: string;
begin
  Result := mrOk;

//  if IsConsole or IsCGI then
//    Exit(mrOk);
//
//  AButtonSet:= [];
//  for I:= 0 to High(AButtons) do
//  begin
//    if I = 0 then
//       DefBtnName:= ButtonNames[ AButtons[ 0 ]];
//    AButtonSet:= AButtonSet + [ AButtons[ I ]];
//  end;
//
//  AForm:= CreateMessageDialog(AMessageText, mtConfirmation, AButtonSet);
//  try
//    AForm.Name    := 'IQDialogCheckBox';
//    AForm.Position:= poDefaultPosOnly;
//    AForm.Height  := AForm.Height + 12;
//    AForm.Tag     := LongInt( AKey );  {Store the key in the tag}
//
//    AChkBox:= TCheckBox.Create( AForm );
//    with AChkBox do
//    begin
//      Name   := 'CheckBox';
//      Parent := AForm;
//      Caption:= IQMS.Common.ResourceStrings.cTXT0000144; {'Do not show next time'}
//      Left   := 12;
//      Top    := AForm.ClientHeight - 17;
//      Width  := AForm.ClientWidth - Left;
//      Checked:= FALSE;
//    end;
//
//    IQRegFormRead(AForm, [AForm]);
//    iqregfrm.GetDialogCheckBoxResult(AKey, {var} AChecked, {var} AModalResult,
//      {var} APriorMessageText, {var} AShowDialog);
//
//    AControl:= AForm.FindComponent( DefBtnName );
//    if Assigned( AControl ) and (AControl is TWinControl) then
//       AForm.ActiveControl:= TWinControl( AControl );
//
//    if AShowDialog then
//       Result:= AForm.ShowModal
//    else
//       Result:= AModalResult;
//
//    IQRegFormWrite(AForm, [AForm]);
//    if AShowDialog then
//      iqregfrm.SetDialogCheckBoxResult(AKey, AChkBox.Checked, Result, AMessageText);
//
//  finally
//    AForm.Release;
//  end;

end;

procedure IQDialogTimed(ACaption, AMessage: String; ASeconds: Integer);
begin
//  if IsConsole or IsCGI then
//    Exit;
//  {AForm:= CreateMessageDialog(AMessage, mtConfirmation, [mbOk]);
//  with AForm do
//  try
//     Timer := TTimer.Create(Dialog);
//     Timer.Interval := ASeconds * 1000;
//     Timer.OnTimer := CloseDialog; // ???
//     Timer.Enabled := True;
//     ShowModal;
//  finally
//     Free;
//  end;}
//
//  // We have to use a custom form, instead of calling CreateMessageDialog,
//  // because we need to work with a TTimer object, which requires a object
//  // event for OnTimer.
//  with TFrmIQTimedMessageDlg.Create(Application) do // IQMsgDlgTimed.pas
//  try
//     Caption := ACaption;
//     SetText(AMessage);
//     CloseTimer.Interval := ASeconds * 1000;
//     CloseTimer.Enabled := TRUE;
//     if Assigned(Application.MainForm) then
//        PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
//     ShowModal;
//  finally
//     Free;
//  end;
end;

end.
