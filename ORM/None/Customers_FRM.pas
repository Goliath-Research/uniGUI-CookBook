unit Customers_FRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Forms, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Controls, MainModule;

type
  TCustomersForm = class(TForm)
    navCustomers: TDBNavigator;
    pnlTop: TPanel;
    grdCustomers: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomersForm: TCustomersForm;

implementation

{$R *.dfm}

end.
