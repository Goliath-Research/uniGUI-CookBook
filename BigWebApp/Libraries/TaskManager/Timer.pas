unit Timer;

interface

type

  //
  // Timer de Windows, para utilizar su Handle en un hilo concentrador
  // de múltiples eventos.
  //

  TTimer =
    class(TObject)

      constructor Create;
      destructor  Destroy; override;

      procedure   SetTime(aNextTime : TDateTime);
      procedure   ClearTime;
    private
      hTimer   : THandle;
      NextTime : TDateTime;
    public
      property Handle : THandle read hTimer;
    end;

implementation

uses SysUtils, DateUtils, Windows;

  function DateTimeToFILETIME(t : TDateTime) : TLargeInteger;
  var
    SysTime   : TSystemTime;
    LocalTime : FileTime;
    UTCTime   : FileTime;
    Value     : TLargeInteger absolute UTCTime;
  begin
    DateTimeToSystemTime   ( t        , SysTime   );
    SystemTimeToFileTime   ( SysTime  , LocalTime );
    LocalFileTimeToFileTime( LocalTime, UTCTime   );

    Result := Value;
  end;

  // TTimer

  constructor TTimer.Create;
  begin
    inherited Create;

    hTimer   := CreateWaitableTimer(nil, false, nil);
    NextTime := 0;
  end;

  destructor  TTimer.Destroy;
  begin
    CloseHandle(hTimer);

    inherited Destroy;
  end;

  procedure   TTimer.SetTime(aNextTime : TDateTime);
  var
    dt : TLargeInteger;
  begin
    NextTime := aNextTime;
    dt := DateTimeToFILETIME(NextTime);
    if not SetWaitableTimer(hTimer, dt, 0, nil, nil, true)
      then raise Exception.Create('Past Time');
  end;

  procedure   TTimer.ClearTime;
  begin
    CancelWaitableTimer(hTimer);
    NextTime := 0;
  end;

end.
