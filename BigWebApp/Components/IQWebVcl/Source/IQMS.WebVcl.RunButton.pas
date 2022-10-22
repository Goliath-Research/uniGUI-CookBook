unit IQMS.WebVcl.RunButton;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  WinTypes,
  WinProcs,
  uniSpeedButton;

type

  TCommandLine = type String;

  TIQWebRunButton = class(TUniSpeedButton)
  private
    FCommandLine: TCommandLine;
    FCaption: TCaption;
    FAllowAllUp: Boolean;
    FFont: TFont;
    FGroupIndex: Integer;
    FLayOut: TButtonLayout;
    FWait: Boolean;
    procedure SetCommandLine(Value: TCommandLine);
    function GetCommandLineX: TCommandLine;
  protected
    procedure Click; override;
    function ProcessExecute(CommandLine: TCommandLine; cShow: Word): Integer;
    function IsExecutableFile(Value: TCommandLine): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    property CommandLineX: TCommandLine read GetCommandLineX;
  published
    property CommandLine: TCommandLine read FCommandLine write SetCommandLine;
    property AllowAllUp: Boolean read FAllowAllUp;
    property Caption: TCaption read FCaption;
    property Font: TFont read FFont;
    property GroupIndex: Integer read FGroupIndex;
    property LayOut: TButtonLayout read FLayOut;
    property Wait: Boolean read FWait write FWait;

  end;

implementation

uses
  ShellAPI;

const
  EXEExtension = '.EXE';

constructor TIQWebRunButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FWait := FALSE;
end;

function TIQWebRunButton.ProcessExecute(CommandLine: TCommandLine;
  cShow: Word): Integer;
var
  Rslt: LongBool;
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
begin
  FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);
  with StartUpInfo do
  begin
    cb := SizeOf(TStartUpInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := cShow
  end;

  Rslt := CreateProcess(PChar(CommandLineX), nil, nil, nil, FALSE,
    NORMAL_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);

  if Rslt then
    with ProcessInfo do
    begin
      if Wait then
      begin
        WaitForInputIdle(hProcess, INFINITE);
        // Wait until the process is in idle
        CloseHandle(hThread); // Free the hThread  handle
        CloseHandle(hProcess); // Free the hProcess handle
      end;
      Result := 0; // Set Result to 0, meaning successful
    end
  else
    Result := GetLastError; // Set result to the error code.
end;

function TIQWebRunButton.GetCommandLineX: TCommandLine;
var
  FileName: array [0 .. 255] of char;
  R: TWin32FindData;
  H: Word;
begin
  { Temporary solution }
  Result := FCommandLine;
  if FileExists(Result) then
    EXIT;
  Result := Format('C:\WINNT\%s', [FCommandLine]);
  if FileExists(Result) then
    EXIT;
  Result := Format('C:\Windows\%s', [FCommandLine]);
  if FileExists(Result) then
    EXIT;
  Result := Format('C:\WINNT\system32\%s', [FCommandLine]);
  if FileExists(Result) then
    EXIT;
  raise Exception.Create('The file: ' + FCommandLine + ' cannot be found.');
end;

function TIQWebRunButton.IsExecutableFile(Value: TCommandLine): Boolean;
var
  Ext: String[4];
begin
  Ext := ExtractFileExt(ExtractFileName(Value));
  Result := (UpperCase(Ext) = EXEExtension);
end;

procedure TIQWebRunButton.SetCommandLine(Value: TCommandLine);
var
  Icon: TIcon;
begin
  if (Value <> '') and not IsExecutableFile(Value) then
    raise Exception.Create(Value + ' is not an executable file.');

  FCommandLine := Value;

end;

procedure TIQWebRunButton.Click;
var
  WERetVal: Word;
begin
  inherited Click;
  WERetVal := ProcessExecute(FCommandLine, sw_ShowNormal);
  if WERetVal <> 0 then
  begin
    raise Exception.Create('Error executing program. Error Code:; ' +
      IntToStr(WERetVal));
  end;
end;

end.
