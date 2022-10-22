unit IQCore.Table;

interface

uses
  Spring,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.DataSet;

type

  TIQTable = class(TIQDataSet, IIQTable)
  private
    FTableName  : string;

    function  GetTableName : string;
    procedure SetTableName(val : string);
  end;

implementation

function TIQTable.GetTableName: string;
begin
  Result := FTableName;
end;

procedure TIQTable.SetTableName(val: string);
begin
  FTableName := val;
end;

end.
