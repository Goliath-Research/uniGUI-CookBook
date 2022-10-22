unit Orders_FRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Orders_DM, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TOrdersForm = class(TForm)
    pnlTop: TPanel;
    navItems: TDBNavigator;
    grdItems: TDBGrid;
    Splitter1: TSplitter;
    pnlClient: TPanel;
    pnlTopItems: TPanel;
    dbnvgrProducts: TDBNavigator;
    dbgrdProducts: TDBGrid;
    btnProducts: TBitBtn;
    btnCustomers: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

{$R *.dfm}

end.
