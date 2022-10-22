unit IQCore.DataSet;

interface

uses
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQDataSets = class(TIQObjs<IIQDataSet>, IIQDataSets)
  end;

  TIQDataSet = class(TIQNamedObj, IIQDataSet)
  private
    FSQL          : string;
    FTableName    : string;
    FMaster       : IIQDataSet;
    FKeyField     : IIQField;
    FDetailField  : IIQField;
    FDataModule   : IIQDataModule;

    function  GetFields      : IList<IIQField>;

    function  GetSQL         : string;
    function  GetTableName   : string;
    function  GetMaster      : IIQDataSet;
    function  GetKeyField    : IIQField;
    function  GetDetailField : IIQField;
    function  GetDataModule  : IIQDataModule;

    procedure SetSQL         (val : string);
    procedure SetTableName   (val : string);
    procedure SetMaster      (val : IIQDataSet);
    procedure SetKeyField    (val : IIQField);
    procedure SetDetailField (val : IIQField);
    procedure SetDataModule  (val : IIQDataModule);

    procedure Load           (aDataSet : TDataSet = nil); override;
    procedure Save           (aDataSet : TDataSet = nil; aProc : TAssignFieldValuesProc = nil); override;
  public
    function  GetNewField : IIQField;

    class function  GetDataSets(aDataModuleID : integer = 0) : IList<IIQDataSet>;
    class function  GetDataSet (aDataSetID : integer) : IIQDataSet;
  end;

implementation

uses
  SysUtils,
  Variants,
  IQCore.Field,
  MainModule;

{ TIQDataSet }

function TIQDataSet.GetDataModule: IIQDataModule;
begin
  Result := FDataModule;
end;

class function TIQDataSet.GetDataSet(aDataSetID: integer): IIQDataSet;
var
  ds : TIQDataSet;
begin
  Result := nil;

  with UniMainModule.UserIQModel do
  begin
    DataSetDS.Open;
    try
      if DataSetDS.Locate('ID', aDataSetID, []) then
      begin
        ds := TIQDataSet.Create;
        ds.Load(DataSetDS);

        Result := ds;
      end;
    finally
      DataSetDS.Close;
    end;
  end;
end;

class function TIQDataSet.GetDataSets(aDataModuleID: integer): IList<IIQDataSet>;
var
  ds : TIQDataSet;
begin
  Result := TCollections.CreateList<IIQDataSet>;

  with UniMainModule.UserIQModel do
  begin
    DataSetDS.Filtered := false;
    if aDataModuleID <> 0 then
    begin
      DataSetDS.Filter   := Format('DataModule_ID = %d', [aDataModuleID]);
      DataSetDS.Filtered := true;
    end;

    DataSetDS.Open;
    try
      while not DataSetDS.Eof do
      begin
        ds := TIQDataSet.Create;
        ds.Load(DataSetDS);

        Result.Add(ds);

        DataSetDS.Next;
      end;
    finally
      DataSetDS.Close;
      DataSetDS.Filtered := false;
    end;
  end;
end;

function TIQDataSet.GetDetailField: IIQField;
begin
  Result := FDetailField;
end;

function TIQDataSet.GetFields: IList<IIQField>;
begin
  Result := TIQField.GetFields(GetID);
end;

function TIQDataSet.GetKeyField: IIQField;
begin
  Result := FKeyField;
end;

function TIQDataSet.GetMaster: IIQDataSet;
begin
  Result := FMaster;
end;

function TIQDataSet.GetNewField: IIQField;
begin
  Result := TIQField.Create;
  Result.Owner := Self;
end;

function TIQDataSet.GetSQL: string;
begin
  Result := FSQL;
end;

function TIQDataSet.GetTableName: string;
begin
  Result := FTableName;
end;

procedure TIQDataSet.Load(aDataSet: TDataSet);
var
  fields : IList<IIQField>;

  MasterDataSetID : Variant;
  KeyFieldID      : Variant;
  DetailFieldID   : Variant;
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.DataSetDS;

  // Load ID and Name
  inherited Load(aDataSet);

  // After having the ID it is possible to load all its fields (with IQDataSet_ID = ID)
  fields := GetFields;

  MasterDataSetID := aDataSet.FieldByName('MasterDataSet_ID').Value;
  KeyFieldID      := aDataSet.FieldByName('KeyField_ID'     ).Value;
  DetailFieldID   := aDataSet.FieldByName('DetailField_ID'  ).Value;

  if VarIsNull(MasterDataSetID) then
    FMaster := nil
  else
    FMaster := FDataModule.DataSets[MasterDataSetID];
    //UniMainModule.UserIQModel.DataSets[MasterDataSetID];

  FKeyField := nil;
  if VarIsNull(KeyFieldID) then
    fields.TryGetFirst(FKeyField,
      function(const f : IIQField) : boolean
      begin
        Result := AnsiUpperCase(f.Name) = 'ID';
      end
    )
  else
    FKeyField := fields[integer(KeyFieldID)];

  if VarIsNull(DetailFieldID) then
    FDetailField := nil
  else
    FDetailField := fields[integer(DetailFieldID)];
end;

procedure TIQDataSet.Save(aDataSet: TDataSet = nil; aProc : TAssignFieldValuesProc = nil);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.DataSetDS;

  inherited Save
  (
    aDataSet,
    procedure
    begin
      if FMaster <> nil then
        aDataSet.FieldByName('MasterDataSet_ID').Value := FMaster.ID;
      if FKeyField <> nil then
        aDataSet.FieldByName('KeyField_ID').Value := FKeyField.ID;
      if FDetailField <> nil then
        aDataSet.FieldByName('DetailField_ID').Value := FDetailField.ID;
    end
  );
end;

procedure TIQDataSet.SetDataModule(val: IIQDataModule);
begin
  FDataModule := val;
end;

procedure TIQDataSet.SetDetailField(val: IIQField);
begin
  FDetailField := val;
end;

procedure TIQDataSet.SetKeyField(val: IIQField);
begin
  FKeyField := val;
end;

procedure TIQDataSet.SetMaster(val: IIQDataSet);
begin
  FMaster := val;
end;

procedure TIQDataSet.SetSQL(val: string);
begin
  FSQL := val;
end;

procedure TIQDataSet.SetTableName(val: string);
begin
  FTableName := val;
end;

end.
