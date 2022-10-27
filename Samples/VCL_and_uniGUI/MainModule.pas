unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes,
  Spring.Container;

type
  TUniMainModule = class(TUniGUIMainModule)
  private
    FContainer : TContainer;
  public
    property Container : TContainer read FContainer;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
