unit prod_assoc_workcenters;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  Grids,
  ExtCtrls,
  DBCtrls,
  IQMS.WebVcl.AppDef,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmProdAssociatedWorkcenters = class(TUniForm)
    SrcV_DayProd: TDataSource;
    QryV_DayProd: TFDQuery;
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    DBNavigator1: TUniDBNavigator;
    AppDef1: TIQWebAppDef;
    QryV_DayProdMFG_TYPE: TStringField;
    procedure QryV_DayProdBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FParent_ID: Real;
    FIsArchivedView:Boolean;
    procedure AssignLabels;
    procedure AssignSQL;
  public
    { Public declarations }
    class procedure DoShowModal( AParent_ID: Real;AIsArchived:Boolean );
  end;

var
  FrmProdAssociatedWorkcenters: TFrmProdAssociatedWorkcenters;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmProdAssociatedWorkcenters }

class procedure TFrmProdAssociatedWorkcenters.DoShowModal( AParent_ID: Real; AIsArchived:Boolean);
var
   form : TFrmProdAssociatedWorkcenters;
begin
  form := TFrmProdAssociatedWorkcenters.Create(uniGUIApplication.UniApplication);

  form.FParent_ID := AParent_ID;
  form.FIsArchivedView := AIsArchived;
  form.AssignSQL;
  IQSetTablesActive(TRUE, form);
  form.AssignLabels;

  form.ShowModal;
end;

procedure TFrmProdAssociatedWorkcenters.AssignSQL;
var
  ADayprodName,
  ADaypartName:String;
begin
  ADayprodName:= 'dayprod';
  ADaypartName:= 'day_part';

  if FIsArchivedView then
  begin
    ADayprodName:= 'pdayprod';
    ADaypartName:= 'pday_part';
  end;

  QryV_DayProd.SQL.Text := Format( QryV_DayProd.SQL.Text, [ ADayprodName, ADaypartName ] )
end;

procedure TFrmProdAssociatedWorkcenters.QryV_DayProdBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue( DataSet, 'parent_id', FParent_ID);
end;

procedure TFrmProdAssociatedWorkcenters.AssignLabels;
begin
  with AppDef1 do
  begin                                                                      // MfgType added as an arguement for SLITTING mfg type
//    QryV_DayProdTOTAL_CYCLES_DISP.DisplayLabel:= Execute( 'lbl_total_cycles',[ MfgType ]).asString;
//    QryV_DayProdGOOD_PTS.DisplayLabel         := Execute( 'lbl_good_pts',    [ MfgType ]).asString;
  end;
end;

end.
