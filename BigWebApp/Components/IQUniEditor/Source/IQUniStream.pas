unit IQUniStream;

interface

uses
  Classes;

type
  TIQUniReader = class(TReader)
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

{ TIQUniReader }

constructor TIQUniReader.Create(Stream: TStream; BufSize: Integer);
begin
  inherited;
  OnFindComponentClass := _OnFindComponentClass;
  OnFindComponentInstance := _OnFindComponentInstance;
end;

destructor TIQUniReader.Destroy;
begin

  inherited;
end;

procedure TIQUniReader.SetUniRoot(const Value: TComponent);
begin
  FUniRoot := Value;
end;

procedure TIQUniReader._OnFindComponentClass(Reader: TReader; const ClassName: string; var ComponentClass: TComponentClass);
begin

end;

procedure TIQUniReader._OnFindComponentInstance(Reader: TReader; const Name: string; var Instance: Pointer);
begin
  if UniRoot <> nil then
    Instance := FindNestedComponent(UniRoot, Name);
end;

end.
