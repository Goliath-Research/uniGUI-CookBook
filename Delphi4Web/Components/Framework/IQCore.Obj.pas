unit IQCore.Obj;

interface

uses
  DB,
  Spring,
  Spring.Collections,
  IQCore.Interfaces;

type

  TIQObj = class(TInterfacedObject, IIQObj)
  private
    FID       : integer;
  protected
    function  GetID : integer;
    procedure SetID(val : integer);
    procedure Load  (aDataSet : TDataSet); virtual;
    procedure Save  (aDataSet : TDataSet; aProc : TAssignFieldValuesProc = nil); virtual;
    procedure Delete(aDataSet : TDataSet = nil); virtual;
  end;

  TIQNamedObj = class(TIQObj, IIQNamedObj)
  private
    FName     : string;
  protected
    function  GetName : string;
    procedure SetName(val : string);

    procedure Load(aDataSet : TDataSet); override;
    procedure Save(aDataSet : TDataSet; aProc : TAssignFieldValuesProc = nil); override;
  end;

  TIQObjs<I : IIQNamedObj> = class(TInterfacedObject, IIQObjs<I>)
  private
    function  GetNewObj   : I;
    function  GetObjByID  (aID   : integer) : I;
    function  GetObjByName(aName : string ) : I;
  public
    function  GetObjs     : IList<I>;

    property  NewObj          : I            read GetNewObj;
    property  ObjByID  [aID   : integer] : I read GetObjByID; default;
    property  ObjByName[aName : string ] : I read GetObjByName;
  end;

implementation

uses
  SysUtils,
  Spring.Services,
  MainModule;

{ TIQObj }

function TIQObj.GetID: integer;
begin
  Result := FID;
end;

procedure TIQObj.SetID(val: integer);
begin
  FID := val;
end;

procedure TIQObj.Load(aDataSet: TDataSet);
var
  ReleaseOnExit : boolean;
begin
  ReleaseOnExit := aDataSet = nil;
  try
    if ReleaseOnExit then
      aDataSet := UniMainModule.UserIQModel.GetDataSet(Self, FID);

    if not aDataSet.Active then
    begin
      aDataSet.Open;
      aDataSet.Locate('ID', FID, []);
    end
    else
    begin
      if aDataSet.FieldByName('ID').IsNull then
        UniMainModule.UserIQModel.DataServices.RefreshRecord(aDataSet);

      FID := aDataSet.FieldByName('ID').AsInteger;
    end;
  finally
    if ReleaseOnExit then
      aDataSet.Free;
  end;
end;

procedure TIQObj.Save(aDataSet : TDataSet; aProc : TAssignFieldValuesProc = nil);
var
  ReleaseOnExit : boolean;
begin
  ReleaseOnExit := aDataSet = nil;
  try
    if ReleaseOnExit then
      aDataSet := UniMainModule.UserIQModel.GetDataSet(Self, FID);

    if not aDataSet.Active then
    begin
      aDataSet.Open;
      aDataSet.Locate('ID', FID, []);
    end;

    if not (aDataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
      if FID = 0 then
        aDataSet.Append
      else
      begin
        if not aDataSet.Locate('ID', FID, []) then
          Exit;

        aDataSet.Edit;
      end;

    if Assigned(aProc) then
      aProc;

    aDataSet.Post;

    if FID = 0 then
    begin
      UniMainModule.UserIQModel.DataServices.RefreshRecord(aDataSet);
      Load(aDataSet);
    end;
  finally
    if ReleaseOnExit then
      aDataSet.Free;
  end;
end;

procedure TIQObj.Delete(aDataSet: TDataSet = nil);
begin
  if Assigned(aDataSet) and
    not (aDataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert])
    and (FID <> 0)
    and aDataSet.Locate('ID', FID, []) then
    aDataSet.Delete;
end;

{ TIQNamedObj }

function TIQNamedObj.GetName: string;
begin
  Result := FName;
end;

procedure TIQNamedObj.SetName(val: string);
begin
  FName := val;
end;

procedure TIQNamedObj.Load(aDataSet: TDataSet);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.GetDataSet(Self, FID);

  inherited Load(aDataSet);

  FName := aDataSet.FieldByName('Name').AsString;
end;

procedure TIQNamedObj.Save(aDataSet: TDataSet; aProc: TAssignFieldValuesProc);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.GetDataSet(Self, FID);

  inherited Save
  (
    aDataSet,
    procedure
    begin
      aDataSet.FieldByName('Name').AsString := FName;
    end
  );
end;

{ TIQObjs<I> }

function TIQObjs<I>.GetNewObj : I;
begin
  Result := ServiceLocator.GetService<I>;
end;

function TIQObjs<I>.GetObjByID(aID : integer) : I;
var
  objs : IList<I>;
begin
  Result := nil;

  objs := GetObjs;

  if Assigned(objs) then
    objs.TryGetFirst
    (
      Result,
      function(const obj : I) : boolean
      begin
        Result := obj.ID = aID;
      end
    );
end;

function TIQObjs<I>.GetObjByName(aName : string) : I;
var
  objs : IList<I>;
begin
  Result := nil;

  objs := GetObjs;

  if Assigned(objs) then
    objs.TryGetFirst
    (
      Result,
      function(const obj : I) : boolean
      begin
        Result := AnsiUpperCase(obj.Name) = AnsiUpperCase(aName);
      end
    );
end;

function TIQObjs<I>.GetObjs : IList<I>;
var
  obj : I;
  ds  : TDataSet;
begin
  Result := TCollections.CreateList<I>;

  with UniMainModule.UserIQModel do
  begin
    obj := GetNewObj;
    ds  := GetDataSet(obj);
    ds.Open;
    try
      while not ds.Eof do
      begin
        obj.Load(ds);
        Result.Add(obj);

        obj := GetNewObj;
        ds.Next;
      end;
    finally
      ds.Free;
    end;
  end;
end;

end.
