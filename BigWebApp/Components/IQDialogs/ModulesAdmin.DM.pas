unit ModulesAdmin.DM;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmModulesAdmin = class(TDataModule)
    dsIQModules: TDataSource;
    IQModules: TFDQuery;
    IQModulesID: TBCDField;
    IQModulesNAME: TStringField;
    IQModulesROWID: TStringField;
    dsIQForms: TDataSource;
    dsQryForms: TDataSource;
    QryForms: TFDQuery;
    QryFormsID: TBCDField;
    QryFormsNAME: TStringField;
    IQForms: TFDQuery;
    IQFormsID: TBCDField;
    IQFormsNAME: TStringField;
    IQFormsPARENT_ID: TBCDField;
    IQFormsMODULE_ID: TBCDField;
    IQFormsROWID: TStringField;
    IQFormsPARENT: TStringField;
    IQFormsSINGLETON: TStringField;
    IQFormsDATAMODULE_ID: TBCDField;
    IQFormsDEFAULTDESIGN_ID: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure IQDataSetAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDataSetAdmin: TdmModulesAdmin;

implementation

{$R *.dfm}


procedure TdmModulesAdmin.DataModuleCreate(Sender: TObject);
begin
  IQModules.Open;
  IQForms.Open;
  QryForms.Open;
end;

procedure TdmModulesAdmin.DataModuleDestroy(Sender: TObject);
begin
  QryForms.Close;
  IQForms.Close;
  IQModules.Close;
end;

procedure TdmModulesAdmin.IQDataSetAfterPost(DataSet: TDataSet);
var
  RowID : string;
begin
  RowID := DataSet.FieldByName('ROWID').AsString;
  DataSet.Refresh;
  DataSet.Locate('ROWID', RowID, []);
end;

end.
