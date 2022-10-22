unit GenericPusher;

interface

uses
  Task,
  GenericQueue;

type

  //
  // A Feeder / Pusher will wait until Queue has enough capacity for receiving new objects
  // Objects come for the overridden method GetObjToPush or from the equivalent
  // anonymous method (I'm keeping the virtual method for backward compatibility)
  //

  TGenericPusher<T : class> =
    class(TTask)
    type
      TFuncGetObjToPush = reference to function : T;
    protected
      FQueue  : TGenericQueue<T>;
      FHandle : THandle;
      FFuncGetObjToPush : TFuncGetObjToPush;

      procedure DoOnStart; override;
      function  OnEvent(idx : integer; aHandle : THandle) : boolean; override;
      procedure DoOnStop;  override;
    public
      constructor Create(aName : string; aQueue : TGenericQueue<T>; aFuncGetObjToPush : TFuncGetObjToPush = nil);

      function  GetObjToPush : T; virtual;
    end;

implementation

  { TGenericPusher<T> }

  constructor TGenericPusher<T>.Create(aName : string; aQueue : TGenericQueue<T>; aFuncGetObjToPush : TFuncGetObjToPush = nil);
  begin
    inherited Create(aName);

    FQueue := aQueue;
    FFuncGetObjToPush := aFuncGetObjToPush;
  end;

  procedure TGenericPusher<T>.DoOnStart;
  begin
    inherited DoOnStart;

    FHandle := FQueue.PushingHandle;
    AddHandle(FHandle);
  end;

  function TGenericPusher<T>.OnEvent(idx : integer; aHandle : THandle) : boolean;
  var
    aObj : T;
  begin
    aObj := GetObjToPush;
    if aObj = Default(T) then
      begin
        // No more objects available. Stop asking for them

        Result := true;
      end
    else
      begin
        // Continue asking for objects to Push
        Result := false;

        try
          FQueue.Push(aObj);
        except
          aObj.Free;
        end;
      end;
  end;

  procedure TGenericPusher<T>.DoOnStop;
  begin
    DelHandle(FHandle);

    inherited DoOnStop;
  end;

  function TGenericPusher<T>.GetObjToPush: T;
  begin
    if Assigned(@FFuncGetObjToPush) then
      Result := FFuncGetObjToPush()
    else
      Result := Default(T);
  end;

end.
