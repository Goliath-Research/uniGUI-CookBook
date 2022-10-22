unit GenericPopper;

interface

uses
  Task,
  GenericQueue;

type

  //
  // Un consumidor se activa cuando la cola tiene elementos y los extrae
  // para ser procesados a la mayor velocidad posible mientras la cola
  // actúa como un buffer.
  //

  TGenericPopper<T : class> =
    class(TTask)
    type
      TProcUsePoppedObj = reference to procedure(aObj : T);
    protected
      FQueue  : TGenericQueue<T>;
      FHandle : THandle;
      FProcUsePoppedObj: TProcUsePoppedObj;

      procedure DoOnStart; override;
      function  OnEvent(idx : integer; aHandle : THandle) : boolean; override;
      procedure DoOnStop;  override;
    public

      constructor Create(aName : string; aQueue : TGenericQueue<T>; aProcUsePoppedObj : TProcUsePoppedObj = nil);

      procedure UsePoppedObj(aObj : T); virtual;
    end;

implementation

  { TGenericPopper }

  constructor TGenericPopper<T>.Create(aName : string; aQueue : TGenericQueue<T>; aProcUsePoppedObj : TProcUsePoppedObj = nil);
  begin
    inherited Create(aName);

    FQueue := aQueue;
    FProcUsePoppedObj := aProcUsePoppedObj;
  end;

  procedure TGenericPopper<T>.DoOnStart;
  begin
    inherited DoOnStart;

    FHandle := FQueue.PoppingHandle;
    AddHandle(FHandle);
  end;

  function TGenericPopper<T>.OnEvent(idx : integer; aHandle : THandle) : boolean;
  var
    aObj : T;
  begin
    aObj := FQueue.Pop;
    try
      UsePoppedObj(aObj);
    except
      aObj.Free;
    end;

    Result := false;
  end;

  procedure TGenericPopper<T>.DoOnStop;
  begin
    DelHandle(FHandle);

    inherited DoOnStop;
  end;

  procedure TGenericPopper<T>.UsePoppedObj(aObj: T);
  begin
    if Assigned(@FProcUsePoppedObj) then
      FProcUsePoppedObj(aObj);
  end;

end.
