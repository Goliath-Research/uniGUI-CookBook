unit SimpleTask;

interface

uses
  SyncObjs,
  Task;

type

  //
  // This "simple" thread will run some code (OnRun) one or more times until
  // it returns "true" (meaning, it already finished the task).
  // The code in OnRun will have to keep its own state for running in steps.
  // In this way, the process could be controlled when pausing.
  //

  TSimpleTask =
    class(TTask)
    protected
      FEvent      : TSimpleEvent;

      procedure   DoOnStart; override;
      function    OnEvent(idx : integer; aHandle : THandle) : boolean; override;
      procedure   DoOnStop;  override;
    public
      function    OnRun : boolean; virtual; abstract;
    end;

implementation

  procedure TSimpleTask.DoOnStart;
  begin
    inherited DoOnStart;

    FEvent    := TSimpleEvent.Create;
    AddHandle(FEvent.Handle);
    FEvent.SetEvent;
  end;

  procedure TSimpleTask.DoOnStop;
  begin
    DelHandle(FEvent.Handle);
    FEvent.Free;

    inherited DoOnStop;
  end;

  function TSimpleTask.OnEvent(idx : integer; aHandle : THandle) : boolean;
  begin
    Result := OnRun;
    // If task will be continued, it is necessary to signal that request
    // If not, thread cycle will stop

    if Result
      then FEvent.SetEvent;
  end;

end.
