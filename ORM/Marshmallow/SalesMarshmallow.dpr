program SalesMarshmallow;

uses
  Vcl.Forms,
  Customers_FRM in 'Customers_FRM.pas' {CustomersForm},
  MainModule in 'MainModule.pas' {MainDM: TDataModule},
  Customers_DM in 'Customers_DM.pas' {CustomersDM: TDataModule},
  Products_DM in 'Products_DM.pas' {ProductsDM: TDataModule},
  Products_FRM in 'Products_FRM.pas' {ProductsForm},
  Orders_DM in 'Orders_DM.pas' {OrdersDM: TDataModule},
  Orders_FRM in 'Orders_FRM.pas' {OrdersForm},
  MainVCL in 'MainVCL.pas' {MainForm},
  SalesModel in 'SalesModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainDM, MainDM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TOrdersDM, OrdersDM);
  Application.CreateForm(TOrdersForm, OrdersForm);
  Application.CreateForm(TCustomersDM, CustomersDM);
  Application.CreateForm(TCustomersForm, CustomersForm);
  Application.CreateForm(TProductsDM, ProductsDM);
  Application.CreateForm(TProductsForm, ProductsForm);
  Application.Run;
end.
