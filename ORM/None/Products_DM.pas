unit Products_DM;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, MainModule;

type
  TProductsDM = class(TDataModule)
    tblProducts: TFDTable;
    dsProducts: TDataSource;
    procedure tblProductsAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProductsDM: TProductsDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TProductsDM.DataModuleCreate(Sender: TObject);
begin
  tblProducts.Open;
end;

procedure TProductsDM.DataModuleDestroy(Sender: TObject);
begin
  tblProducts.Close;
end;

procedure TProductsDM.tblProductsAfterPost(DataSet: TDataSet);
begin
    DataSet.Refresh;
end;

end.
