unit Products_FRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Products_DM, Data.DB,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TProductsForm = class(TForm)
    grdProducts: TDBGrid;
    pnlTop: TPanel;
    navProducts: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProductsForm: TProductsForm;

implementation

{$R *.dfm}

end.
