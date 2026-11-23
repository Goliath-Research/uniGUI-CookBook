unit uniGUIServer;

interface

uses
  Classes;

type
  TUniGUIServerModule = class(TComponent)
  protected
    procedure FirstInit; virtual;
  end;

procedure InitServerModule(Module: TUniGUIServerModule);

var
  UniGUIServerInstance: TUniGUIServerModule;

implementation

procedure TUniGUIServerModule.FirstInit;
begin
end;

procedure InitServerModule(Module: TUniGUIServerModule);
begin
end;

end.
