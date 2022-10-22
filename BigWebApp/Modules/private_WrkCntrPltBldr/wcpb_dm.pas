unit wcpb_dm;

interface

uses
  System.Classes,
  Data.DB, uniGUIApplication,uniGUIAbstractClasses,UniGUIVars,
  Vcl.Wwdatsrc,
  Vcl.Wwquery,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.Hpick, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TDM_WCPB = class(TDataModule)
    wwQryWorkCenterList: TFDQuery;
    wwQryWorkCenterListEQNO: TStringField;
    wwQryWorkCenterListCNTR_DESC: TStringField;
    wwQryWorkCenterListCNTR_TYPE: TStringField;
    wwQryWorkCenterListMFGCELL: TStringField;
    wwQryWorkCenterListMFG_TYPE: TStringField;
    wwQryWorkCenterListEPLANT_ID: TBCDField;
    wwSrcWorkCenterList: TDataSource;
    PkWorkCenters: TIQWebHPick;
    PkWorkCentersID: TBCDField;
    PkWorkCentersEQNO: TStringField;
    PkWorkCentersCNTR_DESC: TStringField;
    PkWorkCentersCNTR_TYPE: TStringField;
    PkWorkCentersEPLANT_ID: TBCDField;
    PkWorkCentersWORKORDER_ID: TBCDField;
    PkWorkCentersITEMNO: TStringField;
    PkWorkCentersDESCRIP: TStringField;
    PkWorkCentersCLASS: TStringField;
    PkWorkCentersREV: TStringField;
    PkWorkCentersMFGCELL: TStringField;
    qryBOM: TFDQuery;
    wwQryWorkCenterListWORK_CENTER_ID: TBCDField;
    qryBOMSTANDARD_ID: TBCDField;
    qryBOMMFGNO: TStringField;
    qryBOMCLASS: TStringField;
    qryBOMITEMNO: TStringField;
    qryBOMREV: TStringField;
    srcBOM: TDataSource;
    qryBOMARINVT_ID: TBCDField;
    wwQryWorkCenterListCENTER_SCAN_CONFIG_ID: TBCDField;
    wwQryWorkCenterListSTANDARD_ID: TBCDField;
    wwQryWorkCenterListCSC_STANDARD_ID: TBCDField;
    qryPallets: TFDQuery;
    qryPalletsID: TBCDField;
    qryPalletsCUSER1: TStringField;
    srcPallets: TDataSource;
    wwQryWorkCenterListSTANDARD_MFGNO: TStringField;
    wwQryWorkCenterListCSC_STANDARD_MFGNO: TStringField;
    procedure qryBOMBeforeOpen(DataSet: TDataSet);
    procedure wwQryWorkCenterListBeforeOpen(DataSet: TDataSet);
    procedure PkWorkCentersBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshwwQryWorkCenterList;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;

procedure TDM_WCPB.qryBOMBeforeOpen(DataSet: TDataSet);
var
  AStandard_ID:Real;
begin
  (*Check if the work center has a standard_id in center_scan_config first,
    then load it.  If there isn't a standard_id, pull it from illum_part,
    which is the current running WO on the workcenter AMB 11-06-15 *)
  AStandard_ID:=
    IQMS.Common.Numbers.IIIF( wwQryWorkCenterListCSC_STANDARD_ID.AsFloat = 0,
                   wwQryWorkCenterListSTANDARD_ID.AsFloat,
                   wwQryWorkCenterListCSC_STANDARD_ID.AsFloat );
  AssignQueryParamValue(DataSet, 'STANDARD_ID', AStandard_ID);
end;

procedure TDM_WCPB.RefreshwwQryWorkCenterList;
var
  AWorkCenterID:Real;
begin
  AWorkCenterID:= wwQryWorkCenterListWORK_CENTER_ID.AsFloat;

  ReOpen( wwQryWorkCenterList );

  wwQryWorkCenterList.Locate( 'WORK_CENTER_ID', AWorkCenterID, [ loCaseInsensitive ] );
end;


procedure TDM_WCPB.wwQryWorkCenterListBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TDM_WCPB.PkWorkCentersBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

initialization
  RegisterModuleClass(TDM_WCPB)

end.
