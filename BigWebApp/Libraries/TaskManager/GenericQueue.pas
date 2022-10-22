unit GenericQueue;

interface

uses
  Contnrs,
  SyncObjs,
  Timer,
  Generics.Collections;

type

  ILockable = interface
    ['{C6AE1F9A-4B68-4E4D-9556-439C8E90CE30}']

    procedure Lock;
    procedure Unlock;
  end;

  TLockableObject = class(TInterfacedObject, ILockable)
  protected
    CS: TCriticalSection;
  public
    constructor Create;
    destructor  Destroy; override;

    procedure Lock;
    procedure Unlock;
  end;

  //
  // External Controller for Queue Operation
  //

  TQueueControl<T : class> =
    class(TObject)
    protected

      function    GetHandle : THandle;              virtual; abstract;
    public

      procedure   OnPush (Queue : TObjectQueue<T>); virtual; abstract;
      procedure   OnPop  (Queue : TObjectQueue<T>); virtual; abstract;
      function    WaitFor(Timeout : Cardinal) : TWaitResult; virtual; abstract;
      procedure   Stop   ; virtual; abstract;

      property Handle : THandle read GetHandle;
    end;

  //
  // Push Control by Capacity. If Capacity = 0 there is no limit.
  //

  TCapacityQueuePushControl<T : class> =
    class(TQueueControl<T>)
    protected
      fCapacity   : integer;
      ReadyToPush : TSimpleEvent;

      function    GetHandle : THandle;                  override;
    public

      constructor Create(aCapacity : integer = 0);
      destructor  Destroy; override;

      procedure   OnPush (Queue : TObjectQueue<T>); override;
      procedure   OnPop  (Queue : TObjectQueue<T>); override;
      function    WaitFor(Timeout : Cardinal) : TWaitResult; override;
      procedure   Stop   ; override;

      property Capacity : integer read fCapacity write fCapacity;
    end;

  //
  // Pop Control by Availability
  //

  TAvailableQueuePopControl<T : class> =
    class(TQueueControl<T>)
    protected
      ReadyToPop  : TSimpleEvent;

      function    GetHandle : THandle;                  override;
    public

      constructor Create;
      destructor  Destroy; override;

      procedure   OnPush (Queue : TObjectQueue<T>); override;
      procedure   OnPop  (Queue : TObjectQueue<T>); override;
      function    WaitFor(Timeout : Cardinal) : TWaitResult; override;
      procedure   Stop   ; override;
    end;

  //
  // Pop Control by Time Synchronization (each object in Queue will be
  // delivered according to its timestamp)
  //

  ITimeStamped =
    interface
      ['{B0DCF931-5AC2-4EF6-827D-583748193909}']

      function Time : TDateTime;
    end;

  TTimeSyncQueuePopControl<T : class, ITimeStamped> =
    class(TQueueControl<T>)
    protected
      ReadyToPop  : TTimer;

      function    GetHandle   : THandle;                        override;
      function    GetTimeToPop(aTime : TDateTime) : TDateTime;  virtual;
    public

      constructor Create;
      destructor  Destroy; override;

      procedure   OnPush (Queue : TObjectQueue<T>); override;
      procedure   OnPop  (Queue : TObjectQueue<T>); override;
      function    WaitFor(Timeout : Cardinal) : TWaitResult; override;
      procedure   Stop   ; override;
    end;

  //
  // GenericQueue
  //

  TGenericQueue<T : class> =
    class(TObjectQueue<T>)
    protected
      FCS          : TCriticalSection;
      FPushControl : TQueueControl<T>;
      FPopControl  : TQueueControl<T>;

      procedure   Lock;
      procedure   Unlock;

      function    GetPoppingHandle : THandle;
      function    GetPushingHandle : THandle;

      procedure   OnPush;
      procedure   OnPop;

      procedure SetPopControl(const Value: TQueueControl<T>);
      procedure SetPushControl(const Value: TQueueControl<T>);
    public
      constructor Create(aPushControl, aPopControl : TQueueControl<T>);
      destructor  Destroy; override;

      procedure   Push(aObj : T);
      function    Pop : T;

      function    WaitForPopping(Timeout : Cardinal) : TWaitResult;
      function    WaitForPushing(Timeout : Cardinal) : TWaitResult;

      property    PoppingHandle : THandle read GetPoppingHandle;
      property    PushingHandle : THandle read GetPushingHandle;

      property    PushControl : TQueueControl<T> read FPushControl write SetPushControl;
      property    PopControl  : TQueueControl<T> read FPopControl  write SetPopControl;
    end;

implementation

uses
  SysUtils;

{ TLockableObject }

constructor TLockableObject.Create;
begin
  inherited;

  CS := TCriticalSection.Create;
end;

destructor TLockableObject.Destroy;
begin
  CS.Free;

  inherited;
end;

procedure TLockableObject.Lock;
begin
  CS.Acquire;
end;

procedure TLockableObject.Unlock;
begin
  CS.Release;
end;

  { TCapacityQueuePushControl }

  constructor TCapacityQueuePushControl<T>.Create(aCapacity : integer = 0);
  begin
    inherited Create;

    fCapacity := aCapacity;
    ReadyToPush := TSimpleEvent.Create;
    ReadyToPush.SetEvent;
  end;

  destructor  TCapacityQueuePushControl<T>.Destroy;
  begin
    ReadyToPush.Free;

    inherited Destroy;
  end;

  function TCapacityQueuePushControl<T>.GetHandle : THandle;
  begin
    Result := ReadyToPush.Handle;
  end;

  procedure TCapacityQueuePushControl<T>.OnPush(Queue : TObjectQueue<T>);
  begin
    if (Capacity = 0) or (Queue.Count < Capacity)
      then ReadyToPush.SetEvent
      else ReadyToPush.ResetEvent;
  end;

  procedure TCapacityQueuePushControl<T>.OnPop(Queue : TObjectQueue<T>);
  begin
    if (Capacity = 0) or (Queue.Count < Capacity)
      then ReadyToPush.SetEvent
      else ReadyToPush.ResetEvent;
  end;

  function TCapacityQueuePushControl<T>.WaitFor(Timeout : Cardinal) : TWaitResult;
  begin
    Result := ReadyToPush.WaitFor(Timeout);
  end;

  procedure TCapacityQueuePushControl<T>.Stop;
  begin
    ReadyToPush.ResetEvent;
  end;

  { TAvailableQueuePopControl }

  constructor TAvailableQueuePopControl<T>.Create;
  begin
    inherited Create;

    ReadyToPop := TSimpleEvent.Create;
  end;

  destructor  TAvailableQueuePopControl<T>.Destroy;
  begin
    ReadyToPop.Free;

    inherited Destroy;
  end;

  function TAvailableQueuePopControl<T>.GetHandle : THandle;
  begin
    Result := ReadyToPop.Handle;
  end;

  procedure TAvailableQueuePopControl<T>.OnPush(Queue : TObjectQueue<T>);
  begin
    ReadyToPop.SetEvent;
  end;

  procedure TAvailableQueuePopControl<T>.OnPop(Queue : TObjectQueue<T>);
  begin
    if Queue.Count > 0
      then ReadyToPop.SetEvent
      else ReadyToPop.ResetEvent;
  end;

  function TAvailableQueuePopControl<T>.WaitFor(Timeout : Cardinal) : TWaitResult;
  begin
    Result := ReadyToPop.WaitFor(Timeout);
  end;

  procedure TAvailableQueuePopControl<T>.Stop;
  begin
    ReadyToPop.ResetEvent;
  end;

  { TTimeSyncQueuePopControl }

  constructor TTimeSyncQueuePopControl<T>.Create;
  begin
    inherited Create;

    ReadyToPop := TTimer.Create;
  end;

  destructor  TTimeSyncQueuePopControl<T>.Destroy;
  begin
    ReadyToPop.Free;

    inherited Destroy;
  end;

  function TTimeSyncQueuePopControl<T>.GetHandle : THandle;
  begin
    Result := ReadyToPop.Handle;
  end;

  function  TTimeSyncQueuePopControl<T>.GetTimeToPop(aTime : TDateTime) : TDateTime;
  begin
    Result := aTime;
  end;

  procedure TTimeSyncQueuePopControl<T>.OnPush(Queue : TObjectQueue<T>);
  var
    Time : TDateTime;
  begin
    if Queue.Count = 1
      then
        begin
          Time := GetTimeToPop(Queue.Peek.Time);
          if Time <= Now
            then (Queue as TGenericQueue<T>).Pop.Free
            else ReadyToPop.SetTime(Time);
        end;
  end;

  procedure TTimeSyncQueuePopControl<T>.OnPop(Queue : TObjectQueue<T>);
  var
    Time : TDateTime;
  begin
    if Queue.Count = 0
      then ReadyToPop.ClearTime
      else
        begin
          Time := GetTimeToPop(Queue.Peek.Time);
          if Time <= Now
            then (Queue as TGenericQueue<T>).Pop.Free
            else ReadyToPop.SetTime(Time);
        end;
  end;

  function TTimeSyncQueuePopControl<T>.WaitFor(Timeout : Cardinal) : TWaitResult;
  begin
//    Result := ReadyToPop.WaitFor(Timeout);
  end;

  procedure TTimeSyncQueuePopControl<T>.Stop;
  begin
    ReadyToPop.ClearTime;
  end;

  { TGenericQueue }

  constructor TGenericQueue<T>.Create(aPushControl, aPopControl : TQueueControl<T>);
  begin
    inherited Create;

    FCS := TCriticalSection.Create;
    FPushControl := aPushControl;
    FPopControl  := aPopControl;
  end;

  destructor TGenericQueue<T>.Destroy;
  begin
    FPushControl.Free;
    FPopControl.Free;
    FCS.Free;

    inherited Destroy;
  end;

  function TGenericQueue<T>.GetPoppingHandle : THandle;
  begin
    Result := FPopControl.Handle;
  end;

  function TGenericQueue<T>.GetPushingHandle : THandle;
  begin
    Result := FPushControl.Handle;
  end;

  procedure TGenericQueue<T>.Lock;
  begin
    FCS.Enter;
  end;

  procedure TGenericQueue<T>.Unlock;
  begin
    FCS.Leave;
  end;

  procedure TGenericQueue<T>.OnPush;
  begin
    if Assigned(FPushControl)
      then FPushControl.OnPush(Self);
    if Assigned(FPopControl)
      then FPopControl.OnPush(Self);
  end;

  procedure TGenericQueue<T>.OnPop;
  begin
    if Assigned(FPushControl)
      then FPushControl.OnPop(Self);
    if Assigned(FPopControl)
      then FPopControl.OnPop(Self);
  end;

  procedure TGenericQueue<T>.Push(aObj : T);
  begin
    Lock;
    try
      inherited Enqueue(aObj);

      OnPush;
    finally
      Unlock;
    end;
  end;

  procedure TGenericQueue<T>.SetPopControl(const Value: TQueueControl<T>);
  begin
    FPopControl := Value;
  end;

  procedure TGenericQueue<T>.SetPushControl(const Value: TQueueControl<T>);
  begin
    if Assigned(FPushControl) then
      FPushControl.Free;
    FPushControl := Value;
  end;

  function TGenericQueue<T>.Pop : T;
  begin
    Lock;
    try
      Result := Extract;

      OnPop;
    finally
      Unlock;
    end;
  end;

  function TGenericQueue<T>.WaitForPopping(Timeout : Cardinal) : TWaitResult;
  begin
    if Assigned(FPopControl)
      then Result := FPopControl.WaitFor(Timeout)
      else Result := wrSignaled;
  end;

  function TGenericQueue<T>.WaitForPushing(Timeout : Cardinal) : TWaitResult;
  begin
    if Assigned(FPushControl)
      then Result := FPushControl.WaitFor(Timeout)
      else Result := wrSignaled;
  end;

end.
