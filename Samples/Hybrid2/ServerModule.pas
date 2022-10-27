unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client;

type
  TUniServerModule = class(TUniGUIServerModule)
    FDManager1: TFDManager;

    procedure UniGUIServerModuleCreate(Sender: TObject);
  private
    FConnString : string;

  protected

    procedure FirstInit; override;
  public

    property ConnString : string read FConnString;
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

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  FDManager1.Active := True;

  FConnString := 'DriverID=SQLite;Database=' + FilesFolderPath + 'SQLite_Sales.db';
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
