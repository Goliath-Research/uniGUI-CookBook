unit SchdPmeqmt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  MainModule, IQMS.Common.GridBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.Jump,
  Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IQUniGrid,
  uniGUIFrame, uniDBNavigator, Vcl.Controls, uniGUIBaseClasses, uniGUIClasses,
  uniPanel;

type
  TFrmSchdPmeqmt = class(TFrmIQGridBase)
    Query1ID: TBCDField;
    Query1EQNO: TStringField;
    Query1LOCATION: TStringField;
    Query1DESCRIP: TStringField;
    Query1SERVICE_DATE_OUT: TDateTimeField;
    Query1SERVICE_DATE_IN: TDateTimeField;
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FStandard_ID: Real;
    procedure SetStandard_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal( AStandard_ID: Real );
    property Standard_ID: Real write SetStandard_ID;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  uniGUIApplication;

class procedure TFrmSchdPmeqmt.DoShowModal( AStandard_ID: Real );
var
  LFrmSchdPmeqmt : TFrmSchdPmeqmt;
begin
  LFrmSchdPmeqmt :=  TFrmSchdPmeqmt.Create( uniGUIApplication.UniApplication);
  LFrmSchdPmeqmt.Standard_ID := AStandard_ID;
  LFrmSchdPmeqmt.ShowModal;
end;

procedure TFrmSchdPmeqmt.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited; {nothing}
  // with Dataset as TFDQuery do
  //   ParamByName('standard_id').asFloat:= FStandard_ID;
  AssignQueryParamValue( DataSet, 'standard_id', FStandard_ID);
end;

procedure TFrmSchdPmeqmt.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
  Caption:= Format('Tool equipment associated with %s', [ SelectValueByID( 'mfgno', 'standard', FStandard_ID ) ]);
end;

end.
