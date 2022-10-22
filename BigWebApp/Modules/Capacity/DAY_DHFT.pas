unit Day_Dhft;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmProjectedHoursShift = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1SHIFT: TBCDField;
    Query1SHIFT_HRS: TFMTBCDField;
    Query1SETUPHRS: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
	
	procedure SetDay_Hrs_ID(Value : Real);
  public
    { Public declarations }
	
	property Day_Hrs_ID : Real write SetDay_Hrs_ID;
  end;

procedure DoProjectedHrsShift( ADay_Hrs_ID: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure DoProjectedHrsShift( ADay_Hrs_ID: Real );
var
  aFrmProjectedHoursShift : TFrmProjectedHoursShift;
begin
  aFrmProjectedHoursShift := TFrmProjectedHoursShift.Create(uniGUIApplication.UniApplication);
  aFrmProjectedHoursShift.Day_Hrs_ID := ADay_Hrs_ID;
  aFrmProjectedHoursShift.ShowModal;
end;

procedure TFrmProjectedHoursShift.SetDay_Hrs_ID(Value : Real);
begin
  with Query1 do
  begin
    Close;
    ParamByName('day_hrs_id').Value:= Value;
    Open;
  end;
end;

procedure TFrmProjectedHoursShift.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmProjectedHoursShift.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

end.
