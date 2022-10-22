unit crmlist;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.DBExpress,
  IQMS.WebVcl.Search,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  dbctrls,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  { TFrmCRMList }
  TFrmCRMList = class(TUniForm)
    Panel2: TUniPanel;
    Grid: TIQUniGridControl;
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DoAfterApplyUpdates(DataSet: TFDDataSet; AErrors: Integer);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure AssignID(ADataSet: TDataSet; ATableName: string);
  public
    { Public declarations }
  end;



implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.DBTrans.dbtdbexp;

procedure TFrmCRMList.FormCreate(Sender: TObject);
begin
  IQMS.DBTrans.dbtdbexp.AssignSQLConnections(Self);
 
end;

procedure TFrmCRMList.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
end;

procedure TFrmCRMList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
end;

procedure TFrmCRMList.AssignID(ADataSet: TDataSet; ATableName: string);
var
  AField: TField;
begin
  if not Assigned(ADataSet) or not (ADataSet.State in [dsEdit, dsInsert]) then
    Exit;
  AField := ADataSet.FindField('ID');
  if not Assigned(AField) then
    Exit;
  AField.AsLargeInt := GetNextID(ATableName);
end;

procedure TFrmCRMList.DoAfterApplyUpdates(DataSet: TFDDataSet;
  AErrors: Integer);
begin
  // Refresh required
  RefreshDataSetByID(DataSet);
  // IQMS.DBTrans.dbtdbexp.DBX_RefreshDataSet(TDbxQuery(Sender));
end;

end.
