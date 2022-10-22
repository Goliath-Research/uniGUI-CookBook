unit Lab_WO;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Lab_Dtl,
  Data.DB,
  Vcl.DBGrids,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Controls, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniPanel, uniGUIApplication, uniGUIBaseClasses, uniGUIClasses;

type
  TFrmLabor_WO = class(TFrmLabor_Details_Base)
    Query1DAY_HRS_ID: TBCDField;
    Query1PROD_DATE: TDateTimeField;
    Query1WORKORDER_ID: TBCDField;
    Query1MFGNO: TStringField;
    Query1SHIFT_HRS: TFMTBCDField;
    Query1LABOR_HRS: TFMTBCDField;
    Query1SETUPHRS: TFMTBCDField;
    Query1Sched_Only: TStringField;
    Query1EMP_LEVEL_ID: TBCDField;
    procedure gridDayDblClick(Sender: TObject);
    procedure Query1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowLaborCap_WO_Details( ADataSource: TDataSource );


implementation

{$R *.DFM}

uses
  Lab_Shft,
  IQMS.Common.Cursor;

procedure DoShowLaborCap_WO_Details( ADataSource: TDataSource );
var
  LFrmLabor_WO : TFrmLabor_WO;
begin
  LFrmLabor_WO := TFrmLabor_WO.Create( uniGUIApplication.UniApplication );
  LFrmLabor_WO.ADataSource := ADataSource;
  LFrmLabor_WO.DBGrid1.Cursor:= crDrill;
  LFrmLabor_WO.Show;
end;

procedure TFrmLabor_WO.gridDayDblClick(Sender: TObject);
begin
  DoShowLaborCap_Shift_Details( DBGrid1.DataSource ); {Lab_Shft.pas}
end;

procedure TFrmLabor_WO.Query1CalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Sched_Only').asString:= DataSet.DataSource.DataSet.FieldByName('Sched_Only').asString;
end;

end.
