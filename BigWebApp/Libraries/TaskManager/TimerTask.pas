unit TimerTask;

interface

uses
  Task,
  Timer;

type

  //
  // Periodical thread, running OnTimer every Interval ms or until it finishes.
  //

  TTimerTask =
    class(TTask)
    protected
      FTick       : Cardinal;
      FInterval   : Cardinal;
      FTimer      : TTimer;

      procedure   DoOnStart; override;
      function    OnEvent(idx : integer; aHandle : THandle) : boolean; override;
      procedure   DoOnStop;  override;

      procedure   SetInterval(aInterval : Cardinal);
      function    OnTimer(Tick : Cardinal) : boolean; virtual; abstract;
    public

      constructor Create(aName : string; aInterval : Cardinal);

      property    Tick     : Cardinal read FTick;
      property    Interval : Cardinal read FInterval write SetInterval;
    end;

implementation

uses
  DateUtils,
  SysUtils;

  constructor TTimerTask.Create(aName : string; aInterval : Cardinal);
  begin
    inherited Create(aName);

    FTick     := 0;
    FInterval := aInterval;
  end;

  procedure TTimerTask.DoOnStart;
  begin
    inherited DoOnStart;

    FTimer    := TdgTimer.Create;
    AddHandle(FTimer.Handle);

    FTimer.SetTime(Now + FInterval * OneMillisecond);
  end;

  procedure TTimerTask.DoOnStop;
  begin
    DelHandle(FTimer.Handle);
    FTimer.Free;

    inherited DoOnStop;
  end;

  function TTimerTask.OnEvent(idx : integer; aHandle : THandle) : boolean;
  begin
    Inc(FTick);
    Result := OnTimer(FTick);
    if Result
      then FTimer.ClearTime
      else FTimer.SetTime(Now + FInterval * OneMillisecond);
  end;

  procedure TTimerTask.SetInterval(aInterval: Cardinal);
  begin
    if aInterval = 0
      then FTimer.ClearTime
      else
        begin
          FInterval := aInterval;
          FTimer.SetTime(Now + FInterval * OneMillisecond);
        end;
  end;

end.
