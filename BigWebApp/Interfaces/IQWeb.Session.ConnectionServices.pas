unit IQWeb.Session.ConnectionServices;

interface

uses
  Data.DB;

type

  IIQConnectionProvider = interface
    ['{A6AEAC73-143A-4ED2-9D8D-FAF4ABBAEF53}']

    function GetConnection : TCustomConnection;
  end;

  TIQConnectionService = class
    class function GetConnection : TCustomConnection;
  end;

implementation

uses
  Classes,
  SysUtils,
  UniGUIApplication,
  UniGUIMainModule;

{ IIQConnectionService }

class function TIQConnectionService.GetConnection: TCustomConnection;
var
  aMainModule         : TUniGUIMainModule;
  aConnectionProvider : IIQConnectionProvider;
begin
  aMainModule := UniSession.UniMainModule;
  if Supports(aMainModule, IIQConnectionProvider, aConnectionProvider) then
    Result := aConnectionProvider.GetConnection
  else
    Result := nil;
end;

end.
