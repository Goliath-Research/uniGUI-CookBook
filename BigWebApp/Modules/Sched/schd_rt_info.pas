unit schd_rt_info;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  uniGUIFrame, Vcl.Controls, Vcl.Grids;

type
  TFrmSchedRTInfo = class(TUniForm)
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    wwDataInspector1: TwwDataInspector;
    wwDBGrid1: TIQUniGridControl;
    SrcSingleMachine: TDataSource;
    QrySingleMachine: TFDQuery;
    QrySingleMachineEQNO: TStringField;
    QrySingleMachineMFGNO: TStringField;
    QrySingleMachineBUCKET: TBCDField;
    QrySingleMachineWORK_CENTER_ID: TBCDField;
    QrySingleMachineCUSTNO: TStringField;
    QrySingleMachineCOMPANY: TStringField;
    QrySingleMachineSTD_CYCLE: TFMTBCDField;
    QrySingleMachineLAST_CYCLE: TFMTBCDField;
    QrySingleMachineAVG_CYCLE: TFMTBCDField;
    QrySingleMachineCYCLES_SHFT: TFMTBCDField;
    QrySingleMachineCYCLES_DAY: TFMTBCDField;
    QrySingleMachineCYCLES_TOTAL: TFMTBCDField;
    QrySingleMachineCYCLESREQ: TFMTBCDField;
    QrySingleMachineCYCLES_LEFT: TFMTBCDField;
    QrySingleMachineEFF_PRCNT: TFMTBCDField;
    QrySingleMachineSHIFT_UP: TFMTBCDField;
    QrySingleMachineSHIFT_DWN: TFMTBCDField;
    QrySingleMachineHOURS_LEFT: TFMTBCDField;
    QrySingleMachineDOWN_CODE: TStringField;
    QrySingleMachineDWN_ST_TIME: TDateTimeField;
    QrySingleMachineMFGCELL: TStringField;
    QrySingleMachineMFG_TYPE: TStringField;
    QrySingleMachineNEXT_MFGNO: TStringField;
    QrySingleMachineNEXT_MATERIAL_ITEMNO: TStringField;
    QrySingleMachineNEXT_MATERIAL_DESCRIP: TStringField;
    QrySingleMachineILLUM_RT_ID: TBCDField;
    QrySingleMachineDOWN_DESCRIP: TStringField;
    QrySingleMachineORIG_DWN_ST_TIME: TDateTimeField;
    QrySingleMachineJob_Down_Time: TFloatField;
    QrySingleMachineORDERNO: TStringField;
    QrySingleMachineNEXT_ORDERNO: TStringField;
    QrySingleMachinePRIORITY_NOTE: TStringField;
    QrySingleMachineNEXT_PRIORITY_NOTE: TStringField;
    QrySingleMachineCNTR_DESC: TStringField;
    QrySingleMachineCNTR_SCHED_ID: TBCDField;
    QrySingleMachineWORKORDER_ID: TBCDField;
    QrySingleMachineRTSERVER_NOT_SIGNALED: TStringField;
    QrySingleMachineEPLANT_ID: TBCDField;
    QrySingleMachineOPERATOR: TBCDField;
    QrySingleMachinePK_HIDE: TStringField;
    QrySingleMachineMFGNO_DISP: TStringField;
    QrySingleMachineFORCE_REASON: TStringField;
    QrySingleMachinePMWO_ID: TBCDField;
    QrySingleMachineIS_VIRTUAL: TStringField;
    QrySingleMachinePARENT_WORK_CENTER_ID: TBCDField;
    QrySingleMachineLOOKUP_MFGTYPE: TStringField;
    QrySingleMachineCYCLES_PLANNED: TBCDField;
    SrcParts: TDataSource;
    QryParts: TFDQuery;
    QryPartsITEMNO: TStringField;
    QryPartsDESCRIP: TStringField;
    QryPartsTOTAL_QTY: TFMTBCDField;
    QryPartsFLOOR_DISPO_QTY: TFMTBCDField;
    QryPartsSHIFT_QTY: TFMTBCDField;
    QryPartsDAY_QTY: TFMTBCDField;
    QryPartsPARTSTOGO: TFMTBCDField;
    QryPartsACTCAV: TFMTBCDField;
    QryPartsSTDCAV: TFMTBCDField;
    QryPartsHOURSTOGO: TFMTBCDField;
    QryPartsBADPARTS: TFMTBCDField;
    QryPartsSCRAP_PRCNT: TFMTBCDField;
    QryPartsPlanned_Qty: TFloatField;
    QrySingleMachinePRIORITY_NOTE2: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrySingleMachineBeforeOpen(DataSet: TDataSet);
    procedure QrySingleMachineCalcFields(DataSet: TDataSet);
    procedure QryPartsCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FWork_Center_ID: Real;
    procedure SetWork_Center_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal( AWork_Center_ID: Real );
    property Work_Center_ID: Real write SetWork_Center_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmSchedRTInfo }

class procedure TFrmSchedRTInfo.DoShowModal( AWork_Center_ID: Real );
var
  LFrmSchedRTInfo : TFrmSchedRTInfo;
begin
  LFrmSchedRTInfo := TFrmSchedRTInfo.Create(uniGUIApplication.UniApplication);
  LFrmSchedRTInfo.Work_Center_ID := AWork_Center_ID;
  LFrmSchedRTInfo.ShowModal;
end;

procedure TFrmSchedRTInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmSchedRTInfo.QrySingleMachineBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('work_center_id').asFloat:= FWork_Center_ID;
  AssignQueryParamValue(DataSet, 'work_center_id', FWork_Center_ID)
end;

procedure TFrmSchedRTInfo.QrySingleMachineCalcFields(DataSet: TDataSet);
var
  D: TDateTime;
begin
  D:= DataSet.FieldByName('ORIG_DWN_ST_TIME').asDateTime;

  {This shouldn't happen - trigger suppose to fill in orig_dwn_st_time.}
  if (D = 0 ) and (DataSet.FieldByName('DWN_ST_TIME').asDateTime > 0) then
     D:= DataSet.FieldByName('DWN_ST_TIME').asDateTime;

  if (D > Now) then    {in case RtServer is ahead of this station}
     D:= Now;

  {Calculated field}
  if D > 0 then
    DataSet.FieldByName('Job_Down_Time').AsFloat:= 24 * ( Now - D )
  else
    DataSet.FieldByName('Job_Down_Time').AsFloat:= 0;
end;

procedure TFrmSchedRTInfo.SetWork_Center_ID(const Value: Real);
begin
  FWork_Center_ID := Value;
end;

procedure TFrmSchedRTInfo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmSchedRTInfo.QryPartsCalcFields(DataSet: TDataSet);
begin
  QryPartsPlanned_Qty.asFloat:= QrySingleMachineCYCLES_PLANNED.asFloat * QryPartsSTDCAV.asFloat;
end;

end.
