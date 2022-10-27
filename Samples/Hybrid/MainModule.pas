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
  Vcl.ImgList, uniImageList, uniGUIBaseClasses, uniGUIClasses, frxClass;

type
  TUniMainModule = class(TUniGUIMainModule)
    dsOrders: TDataSource;
    dsItems: TDataSource;
    Conn: TFDConnection;
    tblCustomers: TFDTable;
    tblCustomersID: TIntegerField;
    tblCustomersName: TStringField;
    tblProducts: TFDTable;
    tblProductsID: TIntegerField;
    tblProductsDescription: TStringField;
    tblProductsPrice: TCurrencyField;
    tblOrders: TFDTable;
    tblOrdersID: TIntegerField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersCustomer: TStringField;
    tblOrdersPosted: TDateTimeField;
    tblItems: TFDTable;
    tblItemsOrderID: TIntegerField;
    tblItemsProductID: TIntegerField;
    tblItemsProduct: TStringField;
    tblItemsQuantity: TIntegerField;
    tblItemsPrice: TCurrencyField;
    tblItemsTotal: TCurrencyField;
    dsCustomers: TDataSource;
    dsProducts: TDataSource;
    dsUsers: TDataSource;
    tblUsers: TFDTable;
    qrySales: TFDQuery;
    dsSales: TDataSource;
    tblUsersUsername: TStringField;
    tblUsersPassword: TStringField;
    tblUsersAdmin: TBooleanField;
    ActionList1: TActionList;
    actEditUsers: TAction;
    actEditOrders: TAction;
    UniNativeImageList1: TUniNativeImageList;
    UniImageListAdapter1: TUniImageListAdapter;
    actMarkAsPaid: TAction;
    actToggleAdmin: TAction;
    tblOrdersPaid: TDateTimeField;
    actReportSales: TAction;
    tblOrdersTotal: TCurrencyField;
    FDQuery1: TFDQuery;

    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
    procedure tblItemsCalcFields(DataSet: TDataSet);
    procedure actEditUsersExecute(Sender: TObject);
    procedure actEditOrdersExecute(Sender: TObject);
    procedure actMarkAsPaidExecute(Sender: TObject);
    procedure actToggleAdminExecute(Sender: TObject);
    procedure actReportSalesExecute(Sender: TObject);
    procedure UniGUIMainModuleNewComponent(AComponent: TComponent);
    procedure tblOrdersCalcFields(DataSet: TDataSet);
    procedure tblItemsAfterPost(DataSet: TDataSet);
  private
    FServices : IServices;
    FUsername : string;
    FPassword : string;
    FIsAdmin  : boolean;

    procedure SetAsMobile;
    procedure SetAsDesktop;
  public
    function Login(aUsername, aPassword : string; aDesktop : boolean) : boolean;

    procedure OnCreateOrdersEditor (Sender: TObject);
    procedure OnDestroyOrdersEditor(Sender: TObject);

    procedure OnCreateUsersEditor (Sender: TObject);
    procedure OnDestroyUsersEditor(Sender: TObject);

    function  ExportSalesReportToPDF : string;

    property Services : IServices read FServices;
    property Username : string    read FUsername;
    property Password : string    read FPassword;
    property IsAdmin  : boolean   read FIsAdmin;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  Variants,
  UniGUIVars, ServerModule, uniGUIApplication,
  Messages,
  uniGUIDialogs,
  dServices, mServices, reportDM;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

{ TUniMainModule }

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  Conn.ConnectionString := UniServerModule.ConnString;
  Conn.Open;
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  Conn.Close;
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
    FPassword := aPassword;

    FIsAdmin := not VarIsNull(IsAdmin) and IsAdmin;

    actEditUsers.Visible := FIsAdmin;

    if aDesktop then
      SetAsDesktop
    else
      SetAsMobile;

    Result := true;
  end;
end;

{ Platform selection }

procedure TUniMainModule.SetAsDesktop;
begin
  FServices := TdServices.Create;
end;

procedure TUniMainModule.SetAsMobile;
begin
  FServices := TmServices.Create;
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
var
  PDFUrl : string;
begin
  PDFUrl := ExportSalesReportToPDF;
  if PDFUrl <> '' then
    Services.ReportSales(PDFUrl);
end;

function TUniMainModule.ExportSalesReportToPDF : string;
var
  dm : TfrDataModule;
begin
  dm := TfrDataModule.Create(nil);
  try
    Result := dm.ExportReport;
  finally
    dm.Free;
  end;
end;

procedure TUniMainModule.UniGUIMainModuleNewComponent(AComponent: TComponent);
begin
  if AComponent is TfrxReport then
    (AComponent as TfrxReport).EngineOptions.UseGlobalDataSetList := False;
end;

{ Resource handling for forms }

procedure TUniMainModule.OnCreateOrdersEditor(Sender: TObject);
begin
  tblCustomers.Open;
  tblProducts.Open;
  tblOrders.Open;
  tblItems.Open;
end;

procedure TUniMainModule.OnDestroyOrdersEditor(Sender: TObject);
begin
  tblItems.Close;
  tblOrders.Close;
  tblProducts.Close;
  tblCustomers.Close;
end;

procedure TUniMainModule.OnCreateUsersEditor(Sender: TObject);
begin
  tblUsers.Open;
end;

procedure TUniMainModule.OnDestroyUsersEditor(Sender: TObject);
begin
  tblUsers.Close;
end;

{ Data access event handlers }

procedure TUniMainModule.tblItemsAfterPost(DataSet: TDataSet);
begin
  // After posting a change in items, force a recalculation of the order

  tblOrders.Edit;
  tblOrdersCalcFields(tblOrders);
  tblOrders.Post;
end;

procedure TUniMainModule.tblItemsCalcFields(DataSet: TDataSet);
begin
  if Conn.Connected and not tblItemsQuantity.IsNull and not tblItemsPrice.IsNull then
    tblItemsTotal.Value := tblItemsQuantity.Value * tblItemsPrice.Value;
end;

procedure TUniMainModule.tblOrdersCalcFields(DataSet: TDataSet);
var
  t : Variant;
begin
  t :=
    Conn.ExecSQLScalar
    (
      Format
      (
        'SELECT' +
        '  sum(i.Quantity * p.Price) ' +
        'FROM' +
        '  Orders o' +
        '    INNER JOIN Items    i ON o.ID = i.OrderID' +
        '    INNER JOIN Products p ON i.ProductID = p.ID ' +
        'WHERE o.ID = %d',
        [tblOrdersID.Value]
      )
    );


  if VarIsNull(t) then
    t := 0;

  tblOrdersTotal.Value := t;
end;

{ Business logic actions }

procedure TUniMainModule.actMarkAsPaidExecute(Sender: TObject);
begin
  if tblOrders.State = dsBrowse then
    tblOrders.Edit;

  tblOrdersPaid.Value := Now;
  tblOrders.Post;
end;

procedure TUniMainModule.actToggleAdminExecute(Sender: TObject);
var
  AdminQty : integer;
begin
  if tblUsers.State <> dsBrowse then
    ShowMessage('Commit any pending udpate before requesting admin status changes!')
  else
  begin
    AdminQty := Conn.ExecSQLScalar('SELECT count(*) FROM Users WHERE Admin = 1');
    if tblUsersAdmin.Value and (AdminQty = 1) then
      ShowMessage('You need at least one admin account!')
    else
    begin
      tblUsers.Edit;
      tblUsersAdmin.Value := tblUsersAdmin.IsNull or not tblUsersAdmin.Value;
      tblUsers.Post;
    end;
  end;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
