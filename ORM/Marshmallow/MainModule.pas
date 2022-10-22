unit MainModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.Controls, System.Actions, Vcl.ActnList, Vcl.StdActns,
  SQLiteTable3,
  Spring.Persistence.Adapters.SQLite,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.Session;
//  Spring.Persistence.Core.DatabaseManager;

type
  TMainDM = class(TDataModule)
    FDManager1: TFDManager;
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    MainActionList: TActionList;
    actOpenProductsForm: TAction;
    actOpenCustomersForm: TAction;
    ImageList1: TImageList;
    actOpenOrdersForm: TAction;
    FileExit1: TFileExit;
    procedure actOpenProductsFormExecute(Sender: TObject);
    procedure actOpenCustomersFormExecute(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure actOpenOrdersFormExecute(Sender: TObject);
  private
    FDatabase   : TSQLiteDatabase;
    FConnection : IDBConnection;
    FSession    : TSession;

  public
    { Public declarations }

    property Database   : TSQLiteDatabase read FDatabase;
    property Connection : IDBConnection   read FConnection;
    property Session    : TSession        read FSession;
  end;

var
  MainDM: TMainDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Forms,
  Spring.Persistence.Core.DatabaseManager,
  Spring.Persistence.Core.ConnectionFactory,
  Spring.Collections,
  Customers_FRM,
  Products_FRM,
  Orders_FRM;

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
  FDatabase := TSQLiteDatabase.Create(Self);
  FDatabase.Filename := ExtractFilePath(Application.ExeName) + 'SQLite_Sales.db';;
  FConnection := TSQLiteConnectionAdapter.Create(FDatabase);

  FConnection.AutoFreeConnection := True;
  FConnection.Connect;

  FSession  := TSession.Create(FConnection);
end;

procedure TMainDM.DataModuleDestroy(Sender: TObject);
begin
  FSession.Free;

  inherited;
end;

procedure TMainDM.actOpenCustomersFormExecute(Sender: TObject);
var
  frm : TCustomersForm;
begin
  frm := TCustomersForm.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TMainDM.actOpenOrdersFormExecute(Sender: TObject);
var
  frm : TOrdersForm;
begin
  frm := TOrdersForm.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TMainDM.actOpenProductsFormExecute(Sender: TObject);
var
  frm : TProductsForm;
begin
  frm := TProductsForm.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;
end.
