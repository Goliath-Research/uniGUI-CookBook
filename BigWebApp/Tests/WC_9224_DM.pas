unit WC_9224_DM;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModuleWC_9224 = class(TDataModule)
    mt1: TFDMemTable;
    mt1ID: TIntegerField;
    mt1Name: TStringField;
    mt1EPLANT_ID: TFloatField;
    mt1EPLANT_NAME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TDataModuleWC_9224.DataModuleCreate(Sender: TObject);
begin
  mt1.Open;
end;

procedure TDataModuleWC_9224.DataModuleDestroy(Sender: TObject);
begin
  mt1.Close;
end;

end.
