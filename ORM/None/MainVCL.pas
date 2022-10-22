unit MainVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MainModule, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Menus;

type
  TMainForm = class(TForm)
    btnProducts: TBitBtn;
    btnCustomers: TBitBtn;
    btnOpenOrdersForm: TBitBtn;
    mmMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Actions1: TMenuItem;
    EditProducts1: TMenuItem;
    EditCustomers1: TMenuItem;
    EditOrders1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

end.
