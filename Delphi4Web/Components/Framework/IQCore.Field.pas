unit IQCore.Field;

interface

uses
  Classes,
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQFields = class(TIQObjs<IIQField>, IIQFields)
  end;

  TIQField = class(TIQNamedObj, IIQField)
  private
    FDisplayLabel : string;
    FDisplayWidth : integer;
    FSize         : integer;
    FPrecision    : integer;
    FFixedChar    : boolean;
    FDataType     : TIQDataType;
    FFieldType    : TIQFieldType;
    FFieldTypeID  : integer;
    FOwner        : IIQDataSet;
    FEditor       : IIQEditor;

    function  GetDisplayLabel : string;
    function  GetDisplayWidth : integer;
    function  GetSize         : integer;
    function  GetPrecision    : integer;
    function  GetFixedChar    : boolean;
    function  GetDataType     : TIQDataType;
    function  GetFieldType    : TIQFieldType;
    function  GetFieldTypeID  : integer;
    function  GetEditor       : IIQEditor;
    function  GetOwner        : IIQDataSet;
    procedure SetDisplayLabel (val : string);
    procedure SetDisplayWidth (val : integer);
    procedure SetSize         (val : integer);
    procedure SetPrecision    (val : integer);
    procedure SetFixedChar    (val : boolean);
    procedure SetDataType     (val : TIQDataType);
    procedure SetFieldType    (val : TIQFieldType);
    procedure SetFieldTypeID  (val : integer);
    procedure SetEditor       (val : IIQEditor);
    procedure SetOwner        (val : IIQDataSet);
  public
    class function  GetFields(aDataSetID : integer) : IList<IIQField>;
    class procedure DelField (aFieldID   : integer);
  end;

implementation

{ TIQField }

class procedure TIQField.DelField(aFieldID: integer);
begin

end;

function TIQField.GetDataType: TIQDataType;
begin
  Result := FDataType;
end;

function TIQField.GetDisplayLabel: string;
begin
  Result := FDisplayLabel;
end;

function TIQField.GetDisplayWidth: integer;
begin
  Result := FDisplayWidth;
end;

function TIQField.GetEditor: IIQEditor;
begin
  Result := FEditor;
end;

class function TIQField.GetFields(aDataSetID: integer): IList<IIQField>;
begin

end;

function TIQField.GetFieldType: TIQFieldType;
begin
  Result := FFieldType;
end;

function TIQField.GetFieldTypeID: integer;
begin
  Result := FFieldTypeID;
end;

function TIQField.GetFixedChar: boolean;
begin
  Result := FFixedChar;
end;

function TIQField.GetOwner: IIQDataSet;
begin
  Result := FOwner;
end;

function TIQField.GetPrecision: integer;
begin
  Result := FPrecision;
end;

function TIQField.GetSize: integer;
begin
  Result := FSize;
end;

procedure TIQField.SetDataType(val: TIQDataType);
begin
  FDataType := val;
end;

procedure TIQField.SetDisplayLabel(val: string);
begin
  FDisplayLabel := val;
end;

procedure TIQField.SetDisplayWidth(val: integer);
begin
  FDisplayWidth := val;
end;

procedure TIQField.SetEditor(val: IIQEditor);
begin
  FEditor := val;
end;

procedure TIQField.SetFieldType(val: TIQFieldType);
begin
  FFieldType := val;
end;

procedure TIQField.SetFieldTypeID(val: integer);
begin
  FFieldTypeID := val;
end;

procedure TIQField.SetFixedChar(val: boolean);
begin
  FFixedChar := val;
end;

procedure TIQField.SetOwner(val: IIQDataSet);
begin
  FOwner := val;
end;

procedure TIQField.SetPrecision(val: integer);
begin
  FPrecision := val;
end;

procedure TIQField.SetSize(val: integer);
begin
  FSize := val;
end;

end.

