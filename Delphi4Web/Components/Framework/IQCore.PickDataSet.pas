unit IQCore.PickDataSet;

interface

uses
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQPickDataSets = class(TIQObjs<IIQPickDataSet>, IIQPickDataSets)
  end;

  TIQPickDataSet = class(TIQNamedObj, IIQPickDataSet)
  private
    FDataSet    : IIQDataSet;
    FListField  : IIQField;

    function  GetDataSet   : IIQDataSet;
    function  GetListField : IIQField;
    procedure SetDataSet   (val : IIQDataSet);
    procedure SetListField (val : IIQField);
  public
    procedure Load(aDataSet : TDataSet = nil); override;
    procedure Save(aDataSet : TDataSet = nil; aProc : TAssignFieldValuesProc = nil); override;
  end;

implementation

uses
  SysUtils,
  MainModule,
  System.Generics.Defaults,
  IQCore.DataSet;

{ TIQPickDataSet }

function TIQPickDataSet.GetDataSet: IIQDataSet;
begin
  Result := FDataSet;
end;

function TIQPickDataSet.GetListField: IIQField;
begin
  Result := FListField;
end;

procedure TIQPickDataSet.Load(aDataSet: TDataSet);
var
  IQDataSetID : integer;
  ListFieldID : integer;
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.PickDataSetDS;

  inherited Load(aDataSet);

  IQDataSetID := aDataSet.FieldByName('IQDataSet_ID').AsInteger;
  ListFieldID := aDataSet.FieldByName('ListField_ID').AsInteger;

  FDataSet   := TIQDataSet.GetDataSet(IQDataSetID);
  FListField := FDataSet.Fields[ListFieldID];
end;

procedure TIQPickDataSet.Save(aDataSet: TDataSet = nil; aProc : TAssignFieldValuesProc = nil);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.PickDataSetDS;

  inherited Save
  (
    aDataSet,
    procedure
    begin
      aDataSet.FieldByName('IQDataSet_ID').AsInteger := FDataSet.ID;
      aDataSet.FieldByName('ListField_ID').AsInteger := FListField.ID;
    end
  );
end;

procedure TIQPickDataSet.SetDataSet(val: IIQDataSet);
begin
  FDataSet := val;
end;

procedure TIQPickDataSet.SetListField(val: IIQField);
begin
  FListField := val;
end;

end.
