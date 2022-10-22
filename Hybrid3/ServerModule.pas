unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client,
  FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI;

type
  TUniServerModule = class(TUniGUIServerModule)
    FDManager1: TFDManager;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;

    procedure UniGUIServerModuleCreate(Sender: TObject);
  protected

    procedure FirstInit; override;
  public

  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars,
  IOUtils;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  FDManager1.Active := True;
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
