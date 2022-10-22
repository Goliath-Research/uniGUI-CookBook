unit IQMS.WebVcl.RepDefParamPkListCols;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls,
  uniMultiItem, uniComboBox;

type
  TFrmRepDefParamPkListCols = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    SrcCols: TDataSource;
    QryCols: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryColsAPP_ID: TStringField;
    QryColsREPNAME: TStringField;
    QryColsCRW_COL_NAME: TStringField;
    QryColsCOLUMN_NAME: TStringField;
    QryColsCAPTION: TStringField;
    QryColsWIDTH: TBCDField;
    QryColsSEQ: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryColsBeforeOpen(DataSet: TDataSet);
    procedure QryColsNewRecord(DataSet: TDataSet);
    procedure QryColsBeforeRefresh(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure wwDBGrid1wwDBComboDlgColumnNameDropDown(Sender: TObject);
  private
    { Private declarations }
    FApp_ID: string;
    FRepName: string;
    FCrw_Col_Name: string;
    FTableName: string;
    FColumnName: string;
    procedure SetCrw_Col_Name(Value: string);
  public
    { Public declarations }
    class procedure DoShowModal(AOwner: TComponent; AApp_ID, ARepName, ACrw_Col_Name: string );

    property Crw_Col_Name: string read FCrw_Col_Name write SetCrw_Col_Name;
    property App_ID :string read FApp_ID write FApp_ID;
    property RepName :string read FRepName write FRepName;
  end;

var
  FrmRepDefParamPkListCols: TFrmRepDefParamPkListCols;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  IQMS.Common.Numbers;

class procedure TFrmRepDefParamPkListCols.DoShowModal(AOwner: TComponent;  AApp_ID, ARepName, ACrw_Col_Name: string);
begin
  with self.Create( uniGUIApplication.UniApplication) do
  begin
    App_ID := AApp_ID;
    RepName:= ARepName;
    Crw_Col_Name:= ACrw_Col_Name;
    ShowModal;
  end;
end;

procedure TFrmRepDefParamPkListCols.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmRepDefParamPkListCols.SetCrw_Col_Name(Value: string);
begin
  FCrw_Col_Name:= Value;
  FTableName := SelectValueFmtAsString('select repdef_misc.table_name_of_crw_col(''%s'') from dual', [ FCrw_Col_Name ]);
  FColumnName:= SelectValueFmtAsString('select repdef_misc.column_name_of_crw_col(''%s'') from dual', [ FCrw_Col_Name ]);
  Caption:= Format('%s: picklist optional column(s)', [ FCrw_Col_Name ]);
end;

procedure TFrmRepDefParamPkListCols.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE,  self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);

  IQAssert( (FTableName > '') and (FColumnName > ''), 'Invalid CRW Table/Column - operation aborted.' );
end;

procedure TFrmRepDefParamPkListCols.QryColsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'app_id', FApp_ID);
  AssignQueryParamValue(DataSet, 'repname', FRepName);
  AssignQueryParamValue(DataSet, 'crw_col_name', CRW_Col_name);
  AssignQueryParamValue(DataSet, 'column_name', FColumnName);
  AssignQueryParamValue(DataSet, 'table_name', FTableName);
end;

procedure TFrmRepDefParamPkListCols.QryColsBeforeRefresh(DataSet: TDataSet);
begin
  RefreshDataSetByID( QryCols, 'COLUMN_NAME');
  ABORT;
end;

procedure TFrmRepDefParamPkListCols.QryColsNewRecord(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'app_id', FApp_ID);
  AssignQueryParamValue(DataSet, 'repname', FRepName);
  AssignQueryParamValue(DataSet, 'crw_col_name', CRW_Col_name);
  AssignQueryParamValue(DataSet, 'seq',
    SelectValueFmtAsFloat(
      'select max(seq) from  repdef_criteria_picklist '+
      ' where app_id = ''%s'' and repname = ''%s'' and crw_col_name = ''%s''',
      [FApp_ID, FRepName, Crw_Col_Name ]) + 1);
end;

procedure TFrmRepDefParamPkListCols.wwDBGrid1wwDBComboDlgColumnNameDropDown(
  Sender: TObject);
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select column_name as column_name, '+
                      ' data_type as data_type, '+
                      ' data_length as data_length '+
                      ' from '+
                      ' user_tab_columns c '+
                      ' where '+
                      ' c.table_name = :table_name '+
                      ' and c.column_name <> :column_name '+
                      ' and c.column_name not in ( select column_name '+
                      ' from repdef_criteria_picklist '+
                      ' where app_id = :app_id '+
                      ' and repname = :repname '+
                      ' and crw_col_name = :crw_col_name )');
  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);
      QryCols.Edit;
      QryColsCOLUMN_NAME.asString:= Qry.FieldByName('column_name').AsString;
      QryColsCAPTION.asString    := IQMS.Common.StringUtils.ProperCase( Qry.FieldByName('column_name').AsString);
      if (Qry.FieldByName('data_type').AsString = 'VARCHAR2') or (Qry.FieldByName('data_type').AsString = 'CHAR')  then
         QryColsWIDTH.asFloat:= iMin( Qry.FieldByName('DATA_LENGTH').AsFloat, 30)
      else
         QryColsWIDTH.asFloat:= 10;
  finally
    Qry.Free;
  end;
end;

end.
