unit TextLogger;

interface

uses
  GenericQueue,
  GenericPusher,
  GenericPopper;

type

  // Un objeto para cada mensaje al Log

  TTextLogger =
    class(TObject)
    private
      theMsg : WideString;
    public

      constructor Create(aMsg : WideString);

      property Msg : WideString read theMsg;
    end;

  // Cada mensaje disponible será almacenado en el TextLog

  TdgLogConsumer =
    class(TGenericPopper<TTextLogger>)

      constructor Create(aName : string; aQueue : TdgGenericQueue<TTextLogger>; aLogFile : WideString);

      procedure UsePoppedObj(aObj : TTextLogger); override;
      procedure DoOnStop; override;
    private
      LogFileHandle : THandle;
    end;

  //
  //
  //

  TdgTextLog =
    class(TObject)

      constructor Create;
      destructor  Destroy; override;

      procedure   Log(aText : WideString);
      procedure   SetLevel(aLevel : integer);
    private
      Queue     : TGenericQueue<TTextLogger>;
      Consumer  : TdgLogConsumer;
      Level     : integer;
      Indent    : integer;
    end;

  procedure LogStr(str : WideString);
  procedure LogFmt(const aFormat: WideString; const aArgs: array of const);

var
  Logger : TdgTextLog;

implementation

uses
  SysUtils,
  Windows;

  procedure LogStr(str : WideString);
  begin
    if Assigned(Logger) and (Logger.Level > 0)
      then Logger.Log(str);
  end;

  procedure LogFmt(const aFormat: WideString; const aArgs: array of const);
  begin
    if Assigned(Logger) and (Logger.Level > 0)
      then Logger.Log(Format(aFormat, aArgs));
  end;

  // TTextLogger

  constructor TTextLogger.Create(aMsg : WideString);
  begin
    inherited Create;

    theMsg := aMsg;
  end;

  // TdgLogConsumer

  constructor TdgLogConsumer.Create(aName : string; aQueue : TdgGenericQueue<TTextLogger>; aLogFile : WideString);
  begin
    inherited Create('TextLogConsumer', aQueue);

    LogFileHandle :=
      CreateFile
        (
          PChar(aLogFile),
          GENERIC_WRITE,
          FILE_SHARE_READ or FILE_SHARE_WRITE,
          nil,
          OPEN_ALWAYS,
          0,
          0
        );

    if LogFileHandle = INVALID_HANDLE_VALUE
      then Abort;
  end;

  procedure TdgLogConsumer.UsePoppedObj(aObj : TTextLogger);
  var
    a : AnsiString;
    l : Cardinal;
    i : AnsiString;
    n : integer;
  begin
    try
      SetFilePointer(LogFileHandle, 0, nil, FILE_END);

      // Update indentation level according to this message

      a := AnsiString(aObj.Msg);

      // First, process "exit" because indentation change is immediate

      if (Pos('«', a) = 1) or (Pos('<<', a) = 1)
        then Dec(Logger.Indent);

      // Create indentation

      i := '';
      for n := 1 to Logger.Indent do
        i := i + '  ';

      // Finally, process "enter" because indentation change is delayed

      if (Pos('»', a) = 1) or (Pos('>>', a) = 1)
        then Inc(Logger.Indent);

      if Logger.Level = 0
        then Exit;

      // Print this line with previous indentation level

      a :=
        Format
          (
            '%s --> %s%s',
            [
              FormatDateTime('yyyy-mm-dd HH:nn:ss.zzz', Now),
              i,
              a
            ]
          ) + #13#10;

      l := Length(a);

      WriteFile(LogFileHandle, PAnsiChar(a)^, l, l, nil);
    finally
      aObj.Free;
    end;
  end;

  procedure TdgLogConsumer.DoOnStop;
  begin
    if LogFileHandle <> INVALID_HANDLE_VALUE
      then CloseHandle(LogFileHandle);

    inherited DoOnStop;
  end;

  // TdgTextLog

  constructor TdgTextLog.Create;
  var
    LogFile : WideString;
    PushControl : TCapacityQueuePushControl<TTextLogger>;
    PopControl  : TAvailableQueuePopControl<TTextLogger>;
    dir      : string;
    filename : string;
  begin
    inherited Create;

    LogFile   := StringOfChar(' ', MAX_PATH + 1);
    SetLength(LogFile, GetModuleFileName(hInstance, PChar(LogFile), MAX_PATH));
    LogFile   := ChangeFileExt(LogFile, '.LOG');

    dir      := ExtractFilePath(LogFile) + '\Logs\';
    filename := ExtractFileName(LogFile);

    if not DirectoryExists(dir)
      then CreateDir(dir);

    LogFile  := dir + filename;

    Level    := 0;
    Indent   := 0;

    PushControl := TCapacityQueuePushControl<TTextLogger>.Create(0);
    PopControl  := TAvailableQueuePopControl<TTextLogger>.Create;
    Queue       := TGenericQueue<TTextLogger>.Create(PushControl, PopControl);

    Consumer  := TdgLogConsumer.Create('LogConsumer', Queue, LogFile);
    Consumer.Start;
  end;

  destructor  TdgTextLog.Destroy;
  begin
    Consumer.SafeStop(Consumer);
    Queue.Free;

    inherited Destroy;
  end;

  procedure   TdgTextLog.Log(aText : WideString);
  begin
    Queue.Push(TTextLogger.Create(aText));
  end;

  procedure TdgTextLog.SetLevel(aLevel: integer);
  begin
    Level := aLevel;
  end;

end.
