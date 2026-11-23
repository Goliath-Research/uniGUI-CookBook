unit uniGUIMainModule;

interface

uses
  Classes;

type
  TUniGUIMainModule = class(TComponent)
  public
    function GetFormInstance(AClass: TClass): TComponent;
  end;

implementation

function TUniGUIMainModule.GetFormInstance(AClass: TClass): TComponent;
begin
  Result := nil;
end;

end.
