unit IQMS.Common.Console;

(* TProcessConsole:

   Pass a commands to be processed.  The process thread return Finished = TRUE
   when the command finishes executing.

   Code Sample:

   var
      ACommand: String;  // the command to be processed
      AHideCmd: Boolean; // hide the command prompt window
   begin
     ...

   // Execute command
   with TProcessConsole.Create( ACommand, AHideCmd ) do
     try
        while not Finished do
           Application.ProcessMessages;
        if HasErrors then Inc(AErrorCount);
     finally Free;
     end;

*)


interface

uses
  Winapi.Windows, Vcl.Forms, System.Classes, Winapi.Messages;

type
  TProcessConsole = class(TThread)
  private
    { Private declarations }
    FCommand: String; // the command to be processed
    FHide: Boolean;
    FLastErrorCode: Real;
  protected
    procedure Execute; override;
  public
    Finished: Boolean;  // returns TRUE when the process is completed
    HasErrors: Boolean; // returns TRUE if there were errors
    constructor Create(ACommand: String; AHide: Boolean);
    destructor Destroy; override;

    property LastErrorCode:Real read FLastErrorCode write FLastErrorCode;
  end;

//API function reference
function CreateProcessWithLogonW(
                                 lpUsername,
                                 lpDomain,
                                 lpPassword:PWideChar;
                                 dwLogonFlags:dword;
                                 lpApplicationName: PWideChar;
                                 lpCommandLine: PWideChar;
                                 dwCreationFlags: DWORD;
                                 lpEnvironment: Pointer;
                                 lpCurrentDirectory: PWideChar;
                                 const lpStartupInfo: tSTARTUPINFO;
                                 var lpProcessInformation: TProcessInformation
                                ): BOOL; stdcall; external 'advapi32.dll'

implementation

{ TProcessConsole }

constructor TProcessConsole.Create(ACommand: String; AHide: Boolean);
begin
     FCommand:=ACommand;
     FHide:=AHide;
     Finished := FALSE;
     FreeOnTerminate := False;
     inherited Create(FALSE);
end;

destructor TProcessConsole.Destroy;
begin
  inherited Destroy;
end;

procedure TProcessConsole.Execute;
var
  start: TStartupInfo;
  procInfo: TProcessInformation;
  AReturnCode: Longword;
begin
  try
    FillChar(start, SizeOf(start), #0);
    start.cb          := SizeOf(start);
    start.dwFlags     := STARTF_USESHOWWINDOW;
    if FHide then
       start.wShowWindow := SW_HIDE
    else
       start.wShowWindow := SW_MINIMIZE;

    Application.ProcessMessages;
    if CreateProcess(nil, PChar( FCommand ), nil, nil, True,
                     CREATE_SEPARATE_WOW_VDM, nil, nil, start, procInfo) then
    begin
      Application.ProcessMessages;
      SetPriorityClass(procInfo.hProcess, HIGH_PRIORITY_CLASS);
      WaitForSingleObject(procInfo.hProcess, INFINITE);
      GetExitCodeProcess(procInfo.hProcess, AReturnCode);
      FLastErrorCode:= AReturnCode;
      HasErrors := FLastErrorCode <> 0;
      CloseHandle(procInfo.hThread);
      CloseHandle(procInfo.hProcess);
    end
    else
      begin
        FLastErrorCode:= WAIT_FAILED;
        HasErrors:= true;
      end;
  finally
     Finished := TRUE;
     Application.ProcessMessages;
  end;
end;


end.

