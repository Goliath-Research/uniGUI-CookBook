unit IQCore.Widget;

interface

uses
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQWidget = class(TIQNamedObj, IIQWidget)
  private
    FMaster       : IIQDataSet;
    FDetailField  : IIQField;

    function  GetMaster      : IIQDataSet;
    function  GetDetailField : IIQField;
    procedure SetMaster      (val : IIQDataSet);
    procedure SetDetailField (val : IIQField);
  end;

implementation

function TIQWidget.GetDetailField: IIQField;
begin
  Result := FDetailField;
end;

function TIQWidget.GetMaster: IIQDataSet;
begin
  Result := FMaster;
end;

procedure TIQWidget.SetDetailField(val: IIQField);
begin
  FDetailField := val;
end;

procedure TIQWidget.SetMaster(val: IIQDataSet);
begin
  FMaster := val;
end;

end.
