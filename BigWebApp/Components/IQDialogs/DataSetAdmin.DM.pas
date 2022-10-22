unit DataSetAdmin.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MainModule,
  IQCore.Interfaces,
  IQCore.DataSet;

type
  TdmDataSetAdmin = class(TDataModule)
    dsIQDataSets: TDataSource;
    IQDataSets: TFDQuery;
    IQDataSetsID: TBCDField;
    IQDataSetsNAME: TStringField;
    IQDataSetsKEYFIELD_ID: TBCDField;
    IQDataSetsMASTERDATASET_ID: TBCDField;
    IQDataSetsDETAILFIELD_ID: TBCDField;
    IQDataSetsTABLENAME: TStringField;
    IQDataSetsSQLQUERY: TStringField;
    IQDataSetsDATAMODULE_ID: TBCDField;
    IQDataSetsROWID: TStringField;
    procedure IQDataSetsAfterPost(DataSet: TDataSet);
    procedure IQDataSetsAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FDataSet : IIQDataSet;
  public
    { Public declarations }
  end;

var
  dmDataSetAdmin: TdmDataSetAdmin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDataSetAdmin.DataModuleCreate(Sender: TObject);
begin
  IQDataSets.Open;
end;

procedure TdmDataSetAdmin.DataModuleDestroy(Sender: TObject);
begin
  IQDataSets.Close;
end;

procedure TdmDataSetAdmin.IQDataSetsAfterPost(DataSet: TDataSet);
var
  RowID : string;
begin
  RowID := DataSet.FieldByName('ROWID').AsString;
  DataSet.Refresh;
  DataSet.Locate('ROWID', RowID, []);
end;

procedure TdmDataSetAdmin.IQDataSetsAfterScroll(DataSet: TDataSet);
begin
  if (DataSet.State = dsBrowse) and not (DataSet.Bof and DataSet.Eof) then
  begin
//    FDataSet := UniMainModule.UserIQModel.DataSets.NewObj;
//    FDataSet.Load(DataSet);

//    FPickTree.LoadTreeNodes(UniTreeView);
  end;
end;

end.
