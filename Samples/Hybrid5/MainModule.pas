unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes,
  Services, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, uniImageList, uniGUIBaseClasses, uniGUIClasses, frxClass,
  Spring.Container, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TUniMainModule = class(TUniGUIMainModule)
    Conn: TFDConnection;
    ActionList1: TActionList;
    actEditUsers: TAction;
    actEditOrders: TAction;
    UniNativeImageList1: TUniNativeImageList;
    UniImageListAdapter1: TUniImageListAdapter;
    actReportSales: TAction;

    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
    procedure actEditUsersExecute(Sender: TObject);
    procedure actEditOrdersExecute(Sender: TObject);
    procedure actReportSalesExecute(Sender: TObject);
    procedure UniGUIMainModuleNewComponent(AComponent: TComponent);
  private
    FContainer  : TContainer;
    FServices   : TServices;
    FUsername   : string;
    FIsAdmin    : boolean;

    procedure SetPlatform(aDesktop: Boolean);
  public
    function Login(aUsername, aPassword : string; aDesktop : boolean) : boolean;

    property Container  : TContainer  read FContainer;
    property Services   : TServices   read FServices;
    property Username   : string      read FUsername;
    property IsAdmin    : boolean     read FIsAdmin;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  Variants,
  UniGUIVars, ServerModule, uniGUIApplication,
  Messages,
  uniGUIDialogs,
  Registration;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

{ TUniMainModule }

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  FContainer := TContainer.Create;

  Conn.Open;
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  Conn.Close;

  FContainer.Free;
end;

{ Login validation and session platform selection }

function TUniMainModule.Login(aUsername, aPassword: string; aDesktop : boolean): boolean;
var
  UserFound : boolean;
  IsAdmin   : Variant;
begin
  Result := false;

  IsAdmin :=
    Conn.ExecSQLScalar
    (
      Format
      (
        'SELECT Admin FROM Users WHERE Username = ''%s'' AND Password = ''%s''',
        [aUserName, aPassword]
      )
    );

  UserFound := not VarIsClear(IsAdmin);
  if UserFound then
  begin
    FUsername := aUsername;

    FIsAdmin := not VarIsNull(IsAdmin) and IsAdmin;

    actEditUsers.Visible := FIsAdmin;

    Result := true;

    SetPlatform(aDesktop);
  end;
end;

{ Platform selection }

procedure TUniMainModule.SetPlatform(aDesktop: Boolean);
begin
  if aDesktop then
    RegisterTypesForDesktop(Container)
  else
    RegisterTypesForMobile(Container);

  FServices := TServices.Create;
end;

{ Launching pad business logic actions }

procedure TUniMainModule.actEditOrdersExecute(Sender: TObject);
begin
  Services.EditOrders;
end;

procedure TUniMainModule.actEditUsersExecute(Sender: TObject);
begin
  Services.EditUsers;
end;

procedure TUniMainModule.actReportSalesExecute(Sender: TObject);
begin
  Services.ReportSales;
end;

procedure TUniMainModule.UniGUIMainModuleNewComponent(AComponent: TComponent);
begin
  if AComponent is TfrxReport then
    (AComponent as TfrxReport).EngineOptions.UseGlobalDataSetList := False;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
