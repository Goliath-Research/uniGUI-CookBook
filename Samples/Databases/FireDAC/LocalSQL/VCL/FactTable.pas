unit FactTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.StorageBin,
  LocalSQLDM, Vcl.StdCtrls;

type
  TFactTableForm = class(TForm)
    dbgSales: TDBGrid;
    dbnSales: TDBNavigator;
    pnlSales: TPanel;
    pnlToolBar: TPanel;
    btnShowSQLcode: TButton;
    procedure btnShowSQLcodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FactTableForm: TFactTableForm;

implementation

{$R *.dfm}

uses
  FactTableQuery;

procedure TFactTableForm.btnShowSQLcodeClick(Sender: TObject);
var
  FactTableQueryForm : TFactTableQueryForm;
begin
  FactTableQueryForm := TFactTableQueryForm.Create(Self);
  try
    FactTableQueryForm.SQL := DM.qrySales.SQL.Text;
    FactTableQueryForm.ShowModal;
  finally
    FactTableQueryForm.Free;
  end;
end;

end.
