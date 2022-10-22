unit Task;

interface

uses
  Classes, SyncObjs;

type

  TThreadState =
    (
      tsCreated,
      tsRunning,
      tsPaused ,
      tsStopped,
      tsChanging
    );

  TThreadRequest =
    (
      trStart,
      trStop,
      trPause,
      trContinue
    );

  TTask =
    class(TThread)
    type
      TdgDelegate = procedure of object;
    private
      FName     : string;
      Handles   : array of THandle;
      FCount    : integer;
      evtBreak  : TSimpleEvent;
      FState    : TThreadState;
      Request   : TThreadRequest;
      evtDone   : TEvent;
      fTimeOut  : Cardinal;

      procedure ExecCatchingExceptions(aProc : TdgDelegate; aName : string);
    protected

      procedure Execute; override;

      procedure DoOnStart; virtual;
      procedure DoOnPause; virtual;
      function  OnEvent(idx : integer; aHandle : THandle) : boolean; virtual; abstract;
      procedure DoOnContinue; virtual;
      procedure DoOnStop;  virtual;
    public

      constructor Create(aName : string); overload;
      constructor Create(aName : string; aDone : TEvent); overload;

      class procedure SafeStop(aTask : TTask);
      procedure SafePause;//(aThread : TThread);

      function  AddHandle(aHandle : THandle) : integer;
      procedure DelHandle(aHandle : THandle);

      procedure Start;
      procedure Stop;

      procedure Pause;
      procedure Continue;

      property  Name    : string        read FName;
      property  State   : TThreadState  read FState;
      property  Signal  : TSimpleEvent  read evtBreak;
      property  OnDone  : TEvent                      write evtDone;
      property  TimeOut : Cardinal      read fTimeOut write fTimeOut;
    end;

implementation

uses
  Windows, SysUtils;

  procedure SetCurrentThreadName(const Name : string);
  type
    TThreadNameInfo =
      record
        RecType   : LongWord;
        Name      : PChar;
        ThreadID  : LongWord;
        Flags     : LongWord;
      end;
  var
    info : TThreadNameInfo;
  begin
    // This code is extremely strange, but it's the documented way of doing it!

    info.RecType  :=$1000;
    info.Name     :=PChar(Name);
    info.ThreadID :=$FFFFFFFF;
    info.Flags    :=0;
    try
      RaiseException($406D1388, 0, SizeOf(info) div SizeOf(LongWord), PUINT_PTR(@info));
    except
    end;
  end;

  constructor TTask.Create(aName : string);
  begin
    inherited Create(true);

    FName     := aName;
    FCount    := 0;
    FState    := tsCreated;
    FreeOnTerminate := true;
    fTimeOut  := INFINITE;
  end;

  constructor TTask.Create(aName : string; aDone : TEvent);
  begin
    Create(aName);

    evtDone := aDone;
  end;

  class procedure TTask.SafeStop(aTask : TTask);
  var
    s : TSimpleEvent;
  begin
    s := TSimpleEvent.Create;
    try
      aTask.OnDone := s;
      aTask.Stop;
      s.WaitFor(INFINITE);
    finally
      s.Free;
    end;
  end;

  procedure TTask.SafePause;
  var
    e : TEvent;
  begin
    e := evtDone;
    evtDone := TSimpleEvent.Create;
    try
      Pause;
      evtDone.WaitFor(INFINITE);
    finally
      evtDone.Free;
      evtDone := e;
    end;
  end;

  function  TTask.AddHandle(aHandle : THandle) : integer;
  begin
    Result := Length(Handles);
    SetLength(Handles, Result + 1);
    Handles[Result] := aHandle;
  end;

  procedure TTask.DelHandle(aHandle : THandle);
  var
    i,j : integer;
  begin
    for i := 0 to Length(Handles) - 1 do
      if Handles[i] = aHandle
        then
          begin
            for j := i + 1 to Length(Handles) - 2 do
              Handles[j] := Handles[j+1];

            SetLength(Handles, Length(Handles) - 1);
            FCount := Length(Handles);
            Exit;
          end;
  end;

  procedure TTask.Start;
  begin
    if State = tsCreated
      then
        begin
          FState := tsRunning;
          Self.Resume;
        end;
  end;

  procedure TTask.Stop;
  begin
    if State in [tsRunning, tsPaused]
      then
        begin
          Request := trStop;
          evtBreak.SetEvent;
        end;
  end;

  procedure TTask.Pause;
  begin
    if State = tsRunning
      then
        begin
          Request := trPause;
          evtBreak.SetEvent;
        end;
  end;

  procedure TTask.Continue;
  begin
    if State = tsPaused
      then
        begin
          Request := trContinue;
          evtBreak.SetEvent;
        end;
  end;

  procedure TTask.ExecCatchingExceptions(aProc : TdgDelegate; aName : string);
  begin
    try
      aProc;
    except
      on E: Exception do
        raise Exception.Create('Exception in ' + aName + ': ' + E.Message);
    end;
  end;

  procedure TTask.Execute;
  var
    r : Cardinal;
  begin
    SetCurrentThreadName(Name);

    // OnStart is the place for any initialization required for executing the thread.
    // In this kind of thread, event-oriented, user will add handles.

    ExecCatchingExceptions(DoOnStart, 'OnStart');

    // This is the main loop.
    // This thread will always wait for a signal, for thread control or related to
    // user tasks.
    // If the user wants to execute its task in one uninterrupted (except for task switching)
    // run, it will have to add a signal and set it before entering this loop.
    // On completion, it will return a code asking for termination.
    // If the user wants to execute its task in several small runs (giving some feedback to
    // any external code), it should also use a signal for starting its task, but every time
    // it finishes a run, it will return a code asking for staying in the loop (while enabling
    // the signal again).
    // If the user scheduled a periodical task, it should add the handle for the timer and
    // its task will be execute periodically until termination is requested.
    try
      FCount := Length(Handles);
      while not Terminated do
        try
          r := WaitForMultipleObjects(FCount, @Handles[0], false, fTimeOut);
          case r of
            WAIT_OBJECT_0 + 0 :
              begin
                // Break requested for a thread control event

                evtBreak.ResetEvent;
                case Request of
                  trStop  :
                    begin
                      // Request Terminate

                      Sleep(10);
                      Terminate;
                    end;
                  trPause :
                    begin
                      // Ignore any user-added event by assigning event count = 1
                      // When requested, signal was activated, and this is the async
                      // result.
                      // After executing OnPause, we will signal evtDone for waking up
                      // any sleeping thread waiting for it.

                      FCount := 1;
                      FState := tsPaused;

                      try
                        ExecCatchingExceptions(DoOnPause, 'OnPause');
                      finally
                        if Assigned(evtDone)
                          then evtDone.SetEvent;
                      end;
                    end;
                  trContinue :
                    begin
                      // Enable user-added events

                      ExecCatchingExceptions(DoOnContinue, 'OnContinue');

                      FCount := Length(Handles);
                      FState := tsRunning;
                    end;
                end;
              end;
            WAIT_TIMEOUT      :
              begin
                // When TimeOut <> INFINITE, it is possible to arrive here without
                // receiving any event. So, we are sending -1 and no handle.

                if OnEvent(-1, 0)
                  then Terminate;
              end;
            WAIT_FAILED       :
              begin
                // This is an unexpected exception

                raise Exception.Create('WaitForMultipleObjects: Invalid Handle on Thread <' + Name + '>');
              end;
            else
              begin
                // Once signaled, user code will be activated.
                // On completion, it should ask for termination or waiting for a new signal.
                // How???

                r := r - WAIT_OBJECT_0;
                try
                  if OnEvent(r, Handles[r])   // if finished, ask for closing the thread
                    then Terminate;
                except
                  // We should log this exception, but it should be handled in OnEvent
                end;
              end;
          end;
        except
          // Here we catch any exception (raised by user code) for logging purposes
          // just before re-raising it.

          raise ;
        end;
    finally
      try
        ExecCatchingExceptions(DoOnStop, 'OnStop');
      finally
        if Assigned(evtDone)
          then evtDone.SetEvent;
      end;
    end;
  end;

  procedure TTask.DoOnStart;
  begin
    evtBreak  := TSimpleEvent.Create;
    SetLength(Handles, 0);
    AddHandle(evtBreak.Handle);
  end;

  procedure TTask.DoOnPause;
  begin
  end;

  procedure TTask.DoOnContinue;
  begin
  end;

  procedure TTask.DoOnStop;
  begin
    SetLength(Handles, 0);
    evtBreak.Free;
  end;

end.
