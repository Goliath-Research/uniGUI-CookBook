unit IQCore.Query;

interface

uses
  Spring,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.DataSet;

type

  TIQQuery = class(TIQDataSet, IIQQuery)
  private
    FQuery    : string;

    function  GetSQL : string;
    procedure SetSQL(val : string);
  end;

implementation

function TIQQuery.GetSQL: string;
begin
  Result := FQuery;
end;

procedure TIQQuery.SetSQL(val: string);
begin
  FQuery := val;
end;

end.
