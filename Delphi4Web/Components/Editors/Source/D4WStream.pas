unit D4WStream;

interface

uses
  Classes;

type
  TD4WReader = class(TReader)
  private
    FUniRoot: TComponent;
  { private declarations }
    procedure _OnFindComponentClass(Reader: TReader; const ClassName: string; var ComponentClass: TComponentClass);
    procedure _OnFindComponentInstance(Reader: TReader; const Name: string; var Instance: Pointer);
    procedure SetUniRoot(const Value: TComponent);
  protected
  { protected declarations }
  public
  { public declarations }
    constructor Create(Stream: TStream; BufSize: Integer);
    destructor Destroy; override;

    property UniRoot: TComponent read FUniRoot write SetUniRoot;
  end;

implementation

{ TD4WReader }

constructor TD4WReader.Create(Stream: TStream; BufSize: Integer);
begin
  inherited;
  OnFindComponentClass := _OnFindComponentClass;
  OnFindComponentInstance := _OnFindComponentInstance;
end;

destructor TD4WReader.Destroy;
begin

  inherited;
end;

procedure TD4WReader.SetUniRoot(const Value: TComponent);
begin
  FUniRoot := Value;
end;

procedure TD4WReader._OnFindComponentClass(Reader: TReader; const ClassName: string; var ComponentClass: TComponentClass);
begin

end;

procedure TD4WReader._OnFindComponentInstance(Reader: TReader; const Name: string; var Instance: Pointer);
begin
  if UniRoot <> nil then
    Instance := FindNestedComponent(UniRoot, Name);
end;

end.
