unit Lab_Shft;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Lab_Dtl,
  Data.DB,
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
  Vcl.DBGrids,
  System.Classes,
  uniGUIApplication,
  Vcl.Controls, uniGUIClasses, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel;

type
  TFrmLabor_Shift = class(TFrmLabor_Details_Base)
    Query1SHIFT: TBCDField;
    Query1SHIFT_HRS: TFMTBCDField;
    Query1LABOR_HRS: TFMTBCDField;
    Query1SETUPHRS: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowLaborCap_Shift_Details( ADataSource: TDataSource );

implementation

{$R *.DFM}

procedure DoShowLaborCap_Shift_Details( ADataSource: TDataSource );
var
  LFrmLabor_Shift: TFrmLabor_Shift;
begin
  LFrmLabor_Shift := TFrmLabor_Shift.Create( uniGUIApplication.UniApplication);
  LFrmLabor_Shift.ADataSource := ADataSource;
  LFrmLabor_Shift.Show;
end;

end.
