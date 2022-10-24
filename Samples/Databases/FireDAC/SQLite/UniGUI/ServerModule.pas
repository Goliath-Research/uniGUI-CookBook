unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.UI.Intf,
  FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.SQLite;

type
  TUniServerModule = class(TUniGUIServerModule)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
