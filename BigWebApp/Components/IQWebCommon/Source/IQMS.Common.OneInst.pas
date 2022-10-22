unit IQMS.Common.OneInst;

interface

uses Vcl.Forms, Winapi.Windows, System.SysUtils, IQMS.Common.ResStrings;
  // db_dm;

const
  MI_NO_ERROR          = 0;
  MI_FAIL_SUBCLASS     = 1;
  MI_FAIL_CREATE_MUTEX = 2;

function ForceOneInstance( S:PChar; ASendFocusMessage : boolean = TRUE; AWarnMultiInstanceAppName : string = '' ) : integer;

{ Query this function to determine if error occurred in startup. }
{ Value will be one or more of the MI_* error flags. }
function GetMIError: Integer;

implementation

// uses IQJump, IQJumpFile, IQMisc, IQMesg;

function BroadcastSystemMessage(Flags: DWORD; Recipients: PDWORD;
  uiMessage: UINT; wParam: WPARAM; lParam: LPARAM): Longint; stdcall;
    external 'user32.dll' name 'BroadcastSystemMessage';

var
  UniqueAppStr : PChar = 'I am the Eggman!';
  MessageId: Integer;
  WM_GET_IN_FOCUS: DWORD;
  WProc: TFNWndProc = Nil;
  MutHandle: THandle = 0;
  MIError: Integer = 0;
  SendFocusMessage : Boolean;
  WarnMultiInstanceAppName : String;

function GetMIError: Integer;
begin
  Result := MIError;
end;

function NewWndProc(Handle: HWND; Msg: Integer; wParam,  lParam: Longint): Longint; StdCall;
begin

  // If this is the registered message, or the user is activiting the
  // window, then restore the application.
  if (Msg = MessageID) then
     begin
       { if main form is minimized, normalize it set focus to application }
       if IsIconic(Application.Handle) then
       begin
         Application.Restore;
         //Application.MainForm.WindowState := wsNormal;
         //ShowWindow(Application.Mainform.Handle, sw_restore);
       end;

       if Assigned(Application.MainForm) then
         SetForegroundWindow(Application.MainForm.Handle);

       //{check if a COM sent deactivation message}
       //if wParam = iq_NotifyCOMIsDeactivated then
       //   IQComSrvList.CheckTerminateApplication(nil)

       {check if jump file involved}
       if (Msg = MessageID) and (wParam > 0) then                                //  and (lParam > 0) then
//           JumpDirect( wParam {jumpID}, lParam {AID})      {IQJump.pas}
       ;

       //{make sure main window is visible even if originally it was launched as hidden from smart_page}
       //else if not Application.MainForm.Visible then
       //   Application.MainForm.Visible:= TRUE;

     end

  // {smart page has asked to get in focus}
  //else if Msg = WM_GET_IN_FOCUS then
  //   begin
  //     if IsIconic(Application.Handle) then
  //        Application.Restore;
  //     SetForegroundWindow(Application.Handle);
  //   end

  else
    { Otherwise, pass message on to old window proc }
    Result := CallWindowProc(WProc, Handle, Msg, wParam, lParam);
end;

procedure SubClassApplication;
begin
  { We subclass Application window procedure so that }
  { Application.OnMessage remains available for user. }
  WProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC,
                                    Longint(@NewWndProc)));
  { Set appropriate error flag if error condition occurred }
  if WProc = Nil then
    MIError := MIError or MI_FAIL_SUBCLASS;
end;

procedure DoFirstInstance;
begin
  SubClassApplication;
  MutHandle := CreateMutex(Nil, False, UniqueAppStr);
  if MutHandle = 0 then
    MIError := MIError or MI_FAIL_CREATE_MUTEX;
end;

procedure BroadcastFocusMessage;
{ This is called when there is already an instance running. }
var
  BSMRecipients: DWORD;
  AJumpID: Integer;
  AID    : Integer;
  I      : Integer;
begin
  { Don't flash main form }
  Application.ShowMainForm := False;

  { Post message and inform other instance to focus itself }
  BSMRecipients := BSM_APPLICATIONS;

  { Check for jump file as inline param }
  AJumpID:= 0;  AID:= 0;
  for I:= 1 to ParamCount do
    if (CompareText( ExtractFileExt(ParamStr( I )), '.EIQ' ) = 0) then       {check if jump file was passed}
    begin
//       ExtractFromEIQJumpFile( ParamStr( I ), AJumpID, AID );                {IQJumpFile.pas - get IDs}
       BREAK;
    end;

  BroadCastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE, @BSMRecipients, MessageID, AJumpID, AID);

  Application.Terminate;
end;

function InitInstance : integer;
begin
  Result:= 0;
  MutHandle := OpenMutex(MUTEX_ALL_ACCESS, False, UniqueAppStr);
  if MutHandle = 0 then
    { Mutex object has not yet been created, meaning that no previous }
    { instance has been created. }
    DoFirstInstance
  else
  begin
    BroadcastFocusMessage;
    Result:= 1;
  end;
end;

function InitInstanceEx : integer;
var
  CallingAppisbeingchecked : boolean;
begin
  Result:= 0;
  CallingAppisbeingchecked:= (Format('%s.exe',[Application.Title]) = UniqueAppStr); {the app calling this is the one we're checking}
  MutHandle := OpenMutex(MUTEX_ALL_ACCESS, False, UniqueAppStr);
  if ( MutHandle = 0 ) and ( CallingAppisbeingchecked ) then
    { Mutex object has not yet been created, meaning that no previous }
    { instance has been created. }
    { We also check the Application.Title so that we DoFirstInstance for the }
    { correct app if checking mutually warned apps ie; IQAlert/EServer warn if either is already running }
    DoFirstInstance
  else if ( not SendFocusMessage ) and ( MutHandle <> 0 ) then {we only want to warn, and we have found an instance}
  begin
//    IQWarning(Format(IQMS.Common.ResourceStrings.cTXT0000475,[ WarnMultiInstanceAppName, WarnMultiInstanceAppName ]));
    Result:= 2;
  end;
end;

function ForceOneInstance( S:PChar; ASendFocusMessage : boolean = TRUE; AWarnMultiInstanceAppName : string = '' ) : integer;
begin
  (*Result of 0 = DoFirstInstance
    Result of 1 = Sent Focus Message to calling App window
    Result of 2 = Found instance of calling App, and issued warning that it is already running*)
  Result:= 0; //no mutex

//  UniqueAppStr:= S;
//  MessageID := RegisterWindowMessage( UniqueAppStr );
//  SendFocusMessage:= ASendFocusMessage;
//  WarnMultiInstanceAppName:= AWarnMultiInstanceAppName;
//
//  {Smart Page asking to get in focus}
//  // WM_GET_IN_FOCUS:= RegisterWindowMessage('IQMS - get application in focus');
//
//  if SendFocusMessage then
//    Result:= InitInstance //force one instance of the application
//  else
//    Result:= InitInstanceEx; //allow >1 instance of the application, but give a warning
end;


initialization

finalization
//  if WProc <> Nil then
//    { Restore old window procedure }
//    SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(WProc));
//
//  if MutHandle > 0 then
//  begin
//    ReleaseMutex( MutHandle );
//    CloseHandle ( MutHandle );
//  end;
end.

