unit Snd_DB;

interface

uses
  Winapi.Windows, System.Classes,

  FireDAC.Comp.Client,


  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB;

type
  TSndDB = class(TDataModule)
    Database1: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SndDB: TSndDB;

implementation

{$R *.DFM}

end.

