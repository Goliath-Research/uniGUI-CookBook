unit Master_Detail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.StorageBin,
  Master_DetailDM;

type
  TMaster_DetailForm = class(TForm)
    dbgOrders: TDBGrid;
    dbnOrders: TDBNavigator;
    pnlOrders: TPanel;
    Splitter1: TSplitter;
    pnlMasterGrid: TPanel;
    dbnItems: TDBNavigator;
    pnlItems: TPanel;
    pnlDetailGrid: TPanel;
    dbgItems: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Master_DetailForm: TMaster_DetailForm;

implementation

{$R *.dfm}

end.
