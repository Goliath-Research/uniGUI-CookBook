unit ForeGrph;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  FR_Grph,
  DBCtrls,
  Mask,
  Db,
  CheckLst,
  StdCtrls,
  ComCtrls,
  Buttons,
  ExtCtrls,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, VCLTee.TeeEdit, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniMultiItem, uniListBox, uniButton, uniBitBtn,
  uniSpeedButton, uniChart, uniSplitter;

type
  TFrmForeGraph = class(TFrmForeGraphBase)
    NavMain: TUniDBNavigator;
    pnlItemDescrip: TUniPanel;
    DBEdit1: TUniDBEdit;
    Label4: TUniLabel;
  private
    FDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    {constructor Create( AOwner: TComponent; ADataSource: TDataSource );}
    property DataSource: TDataSource write SetDataSource;
  end;

procedure DoShowForecastGraph(  ADataSource: TDataSource );


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

procedure DoShowForecastGraph( ADataSource: TDataSource );
var
  AForm: TUniForm;
  FrmForeGraph: TFrmForeGraph;
begin
  AForm:= IQMS.Common.Controls.FindFormByClassName('TFrmForeGraph');
  if not Assigned( AForm ) then
  begin
    AForm:= TFrmForeGraph.Create( uniGUIApplication.uniApplication );
    TFrmForeGraph(AForm).DataSource := ADataSource;
  end;
  AForm.Show;
end;

{constructor TFrmForeGraph.Create( AOwner: TComponent; ADataSource: TDataSource );
begin
  inherited Create( AOwner, ADataSource );
  NavMain.DataSource:= ADataSource;
end;}

{ TFrmForeGraph }

procedure TFrmForeGraph.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

end.
