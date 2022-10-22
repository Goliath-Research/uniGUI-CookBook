unit IQMS.Common.TaskBarProgress;

(* ****************************************************************************
  * Windows Taskbar Progress
  *
  * Description:
  * The class, TTaskBarProgress, in this unit allows you to display
  * progress on the Windows Taskbar.
  *
  * Example:
  * var
  *   i: Integer;
  *   AWinTaskBarProg: TTaskBarProgress;
  * begin
  *   // Create the task bar progress
  *   AWinTaskBarProg := TTaskBarProgress.Create;
  *   try
  *     // Initialize
  *     AWinTaskBarProg.Max := ProgressBar1.Max;
  *     for i := 1 to ProgressBar1.Max do
  *       begin
  *         // Increment the progress bar
  *         ProgressBar1.Position := i;
  *         // Display the task bar progress
  *         AWinTaskBarProg.Position := i; // ProgressBar1.Position;
  *         // Allow the progress bar to display update progress
  *         Application.ProcessMessages;
  *         // ...
  *       end;
  *   finally
  *     // Free the task bar progress
  *     FreeAndNil(AWinTaskBarProg);
  *   end;
  *
  **************************************************************************** *)

interface

uses
  Winapi.Windows, Vcl.Forms, Winapi.ActiveX,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf;

type
  ITaskbarList = interface(IUnknown)
    ['{56FDF342-FD6D-11D0-958A-006097C9A090}']
    function HrInit: HRESULT; stdcall;
    function AddTab(hwnd: LongWord): HRESULT; stdcall;
    function DeleteTab(hwnd: LongWord): HRESULT; stdcall;
    function ActivateTab(hwnd: LongWord): HRESULT; stdcall;
    function SetActiveAlt(hwnd: LongWord): HRESULT; stdcall;
  end;

  ITaskbarList2 = interface(ITaskbarList)
    ['{602D4995-B13A-429B-A66E-1935E44F4317}']
    function MarkFullscreenWindow(hwnd: LongWord;
      fFullscreen: LongBool): HRESULT; stdcall;
  end;

  ITaskbarList3 = interface(ITaskbarList2)
    ['{EA1AFB91-9E28-4B86-90E9-9E9F8A5EEFAF}']
    procedure SetProgressValue(hwnd: LongWord; ullCompleted: UInt64;
      ullTotal: UInt64); stdcall;
    procedure SetProgressState(hwnd: LongWord; tbpFlags: Integer); stdcall;
  end;

type
  { TTaskBarProgressStyle }
  TTaskBarProgressStyle = (tbpsNone, tbpsIndeterminate, tbpsNormal, tbpsError,
    tbpsPaused);

  { TTaskBarProgress }
  TTaskBarProgress = class
  strict private
    FHandle: LongWord;
    FMin: Byte;
    FMax: Integer;
    FPosition: Integer;
    FStyle: TTaskBarProgressStyle;
    FVisible: Boolean;
    FMarquee: Boolean;
    FTaskBarInterface: ITaskbarList3;
    procedure SetPosition(const Value: Integer);
    procedure SetMax(const Value: Integer);
    procedure SetStyle(const Style: TTaskBarProgressStyle);
    procedure SetVisible(const IsVisible: Boolean);
    procedure SetMarquee(const IsMarquee: Boolean);
  public
    constructor Create; reintroduce;
    constructor CreateEx(const Handle: LongWord);
    destructor Destroy; override;

    property Max: Integer read FMax write SetMax default 100;
    property Min: Byte read FMin default 0;
    property Position: Integer read FPosition write SetPosition default 0;
    property Marquee: Boolean read FMarquee write SetMarquee default False;
    property Style: TTaskBarProgressStyle read FStyle write SetStyle
      default tbpsNone;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

implementation

constructor TTaskBarProgress.Create;
begin
  if not Application.MainFormOnTaskBar then
    CreateEx(Application.Handle)
  else
    CreateEx(Application.MainForm.Handle);
end;

constructor TTaskBarProgress.CreateEx(const Handle: LongWord);
const
  CLSID_TaskbarList: TGUID = '{56FDF344-FD6D-11d0-958A-006097C9A090}';
var
  OSVersionInfo: TOSVersionInfo;
begin
  FVisible := True;

  OSVersionInfo.dwOSVersionInfoSize := sizeof(TOSVersionInfo);
  if (Handle <> 0) and GetVersionEx(OSVersionInfo) then
    if OSVersionInfo.dwMajorVersion >= 6 then
      try
        FHandle := Handle;
        CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC, ITaskbarList3,
          FTaskBarInterface);

        if (FTaskBarInterface <> nil) then
          FTaskBarInterface.SetProgressState(FHandle, 0);

        FMin := 0;
        FMax := 100;
        FPosition := 10;
        FStyle := tbpsNormal;

        SetStyle(FStyle);
        SetVisible(FVisible);
      except
        FTaskBarInterface := nil;
      end;
end;

destructor TTaskBarProgress.Destroy;
begin
  if (FTaskBarInterface <> nil) then
    begin
      FTaskBarInterface.SetProgressState(FHandle, 0);
      FTaskBarInterface := nil;
    end;
end;

procedure TTaskBarProgress.SetMax(const Value: Integer);
begin
  FMax := Value;
  SetPosition(FPosition);
end;

procedure TTaskBarProgress.SetPosition(const Value: Integer);
begin
  if (FTaskBarInterface <> nil) and (FHandle <> 0) then
    begin
      FPosition := Value;
      if not FMarquee then
        FTaskBarInterface.SetProgressValue(FHandle, UInt64(FPosition),
          UInt64(FMax));
    end;
end;

procedure TTaskBarProgress.SetStyle(const Style: TTaskBarProgressStyle);
const
  Flags: array [TTaskBarProgressStyle] of Cardinal = (0, 1, 2, 4, 8);
begin
  if (FTaskBarInterface <> nil) and (FHandle <> 0) then
    FTaskBarInterface.SetProgressState(FHandle, Flags[Style]);

  FStyle := Style;
end;

procedure TTaskBarProgress.SetVisible(const IsVisible: Boolean);
begin
  if IsVisible then
    begin
      if (FStyle <> tbpsNormal) then
        SetStyle(tbpsNormal)
    end
  else
    SetStyle(tbpsNone);

  FVisible := IsVisible;
end;

procedure TTaskBarProgress.SetMarquee(const IsMarquee: Boolean);
begin
  if IsMarquee then
    SetStyle(tbpsIndeterminate)
  else
    begin
      SetStyle(tbpsNone);
      if FVisible then
        begin
          SetPosition(FPosition);
          SetStyle(tbpsNormal);
        end;
    end;

  FMarquee := IsMarquee;
end;

end.
