unit IQCore.PickQuery;

interface

uses
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQPickQuery = class(TIQObj, IIQPickQuery)
  private
    FQuery      : IIQQuery;
    FListField  : IIQField;

    function  GetQuery     : IIQQuery;
    function  GetListField : IIQField;
    procedure SetQuery     (val : IIQQuery);
    procedure SetListField (val : IIQField);
  end;

implementation

{ TIQPickQuery }

function TIQPickQuery.GetListField: IIQField;
begin
  Result := FListField;
end;

function TIQPickQuery.GetQuery: IIQQuery;
begin
  Result := FQuery;
end;

procedure TIQPickQuery.SetListField(val: IIQField);
begin
  FListField := val;
end;

procedure TIQPickQuery.SetQuery(val: IIQQuery);
begin
  FQuery := val;
end;

end.
