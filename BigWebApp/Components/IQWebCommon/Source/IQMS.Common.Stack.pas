unit IQMS.Common.Stack;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes;

type
  TIQStack = class
  private
    { Private declarations }
    FList: TStringList;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure Pop;
    procedure Push( S: string );
    function CallStack: string;
  end;

implementation


{ TIQStack }

constructor TIQStack.Create;
begin
  inherited;
  FList:= TStringList.Create;
end;

destructor TIQStack.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TIQStack.Pop;
begin
  with FList do
    if Count > 0 then
       Delete(Count - 1);
end;

procedure TIQStack.Push( S: string );
begin
  FList.Add( S );
end;

function TIQStack.CallStack: string;
var
  I: Integer;
begin
  Result:= '';
  with FList do
    for I:= Count - 1 downto 0 do
      if Result = '' then
         Result:= FList[ I ]
      else
         Result:= Result + ', ' + FList[ I ];
end;


end.

