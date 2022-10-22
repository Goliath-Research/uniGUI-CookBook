unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes,
  IQWeb.Server.Registration,
  IQMS.Common.Params;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
    procedure UniGUIServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FServerRegistration     : TIQServerRegistration;
    FIQMS_Params            : TIQMS_Params;
    FDbfConnectionString    : string;
    FSQLiteConnectionString : string;
//    FDFMFolder              : string;

  protected
    procedure FirstInit; override;
  public
    { Public declarations }

    property ServerRegistration     : TIQServerRegistration read FServerRegistration;
    property Iqms_Params            : TIQMS_Params          read FIQMS_Params;
    property DbfConnectionString    : string                read FDbfConnectionString;
    property SQLiteConnectionString : string                read FSQLiteConnectionString;
//    property DFMFolder              : string                read FDFMFolder;
  end;

function UniServerModule : TUniServerModule;

implementation

{$R *.dfm}

uses
  Spring.Services,
  UniGUIVars,
  System.IniFiles;

{ TUniServerModule }

function UniServerModule: TUniServerModule;
begin
  // This call happens everytime anyone needs access to this server singleton
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  // This call happens at the very beginning, as soon as the application starts in the server
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
begin
  // This call happens immediately after calling InitServerModule

  { GlobalContainer Initialization }

  FServerRegistration := TIQServerRegistration.Create;
  FServerRegistration.RegServerWeb;

//  FIqms_Services := ServiceLocator.GetService<IIQServices>;

  FIQMS_Params := ServiceLocator.GetService<TIQMS_Params>;

  Port := IQMS_Params.WebIQServerPort;

//  FDbfConnectionString    := Ini.ReadString('DBF'   , 'ConnectionString', '');
//  FSQLiteConnectionString := Ini.ReadString('SQLite', 'ConnectionString', '');
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  // This call happens after everything is initialized and the ServerModule is created
  MimeTable.AddMimeType('xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', False);


  MimeTable.AddMimeType('ttf', 'application/font', False);
  MimeTable.AddMimeType('woff', 'application/font', False);

//  FDFMFolder := StartPath + 'DFM\';
//  if not DirectoryExists(FDFMFolder) then
//    CreateDir(FDFMFolder);
end;

procedure TUniServerModule.UniGUIServerModuleDestroy(Sender: TObject);
begin
  FIQMS_Params := nil;
  FServerRegistration.Free;
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
