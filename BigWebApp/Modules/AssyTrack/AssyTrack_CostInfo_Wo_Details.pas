unit AssyTrack_CostInfo_Wo_Details;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  IQUniGrid, uniGUIFrame;

type
  TFrmAccyTrackCostInfoWoDetails = class(TUniForm)
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    SrcTranslog: TDataSource;
    QryTranslog: TFDQuery;
    QryTranslogID: TBCDField;
    QryTranslogARINVT_ID: TBCDField;
    QryTranslogCLASS: TStringField;
    QryTranslogITEMNO: TStringField;
    QryTranslogREV: TStringField;
    QryTranslogDESCRIP: TStringField;
    QryTranslogUNIT: TStringField;
    QryTranslogTRANS_IN_OUT: TStringField;
    QryTranslogTRANS_DATE: TDateTimeField;
    QryTranslogTRANS_QUAN: TFMTBCDField;
    QryTranslogACT_COST: TFMTBCDField;
    QryTranslogLOC_DESC: TStringField;
    QryTranslogLOTNO: TStringField;
    QryTranslogFG_LOTNO: TStringField;
    QryTranslogTRANS_REASON: TStringField;
    QryTranslogBATCH: TBCDField;
    QryTranslogCOST_ELEMENT: TStringField;
    QryTranslogPARENT_ARINVT_ID: TBCDField;
    QryTranslogSOURCE: TStringField;
    QryTranslogSOURCE_ID: TBCDField;
    QryTranslogTRANS_CODE: TStringField;
    QryTranslogTRANS_DESCRIP: TStringField;
    QryTranslogLOCATION_DESCRIP: TStringField;
    QryTranslogWORKORDER_ID: TBCDField;
    QryTranslogEPLANT_ID: TBCDField;
    QryTranslogFGMULTI_ID: TBCDField;
    QryTranslogTOP_PHANTOM_ARINVT_ID: TBCDField;
    QryTranslogSUB_BATCH: TBCDField;
    wwDBGrid1: TIQUniGridControl;
    SrcTALabor: TDataSource;
    QryTALabor: TFDQuery;
    QryTALaborTA_LABOR_ID: TBCDField;
    QryTALaborELEMENTS_ID: TFMTBCDField;
    QryTALaborTIME_SPENT: TFMTBCDField;
    QryTALaborCHARGE_RATE: TFMTBCDField;
    QryTALaborElem_Descrip: TStringField;
    wwDBGrid2: TIQUniGridControl;
    QryTranslogWIP_QUAN: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignParamsBeforeOpen(DataSet: TDataSet);
    procedure QryTALaborCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FBatch: Real;
    FWorkorder_ID: Real;
    FPartno_ID   : Real;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure SetABatch(const Value: Real);
    procedure SetAWorkorder_ID(const Value: Real);
    procedure SetAPartno_ID(const Value: Real);
    procedure SetBatch(const Value: Real);
    procedure SetPartno_ID(const Value: Real);
    procedure SetWorkorder_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(ABatch, AWorkorder_ID, APartno_ID: Real );
    property Batch: Real  write SetBatch;
    property Workorder_ID: Real write SetWorkorder_ID;
    property Partno_ID: Real write SetPartno_ID;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmAccyTrackCostInfoDetails }

class procedure TFrmAccyTrackCostInfoWoDetails.DoShowModal(ABatch, AWorkorder_ID, APartno_ID: Real);
var
  FrmAccyTrackCostInfoWoDetails: TFrmAccyTrackCostInfoWoDetails;
begin
    FrmAccyTrackCostInfoWoDetails := TFrmAccyTrackCostInfoWoDetails.Create(UniGUIApplication.UniApplication);
    FrmAccyTrackCostInfoWoDetails.Batch := ABatch;
    FrmAccyTrackCostInfoWoDetails.Workorder_ID := AWorkorder_ID;
    FrmAccyTrackCostInfoWoDetails.Partno_ID := APartno_ID;
    FrmAccyTrackCostInfoWoDetails.ShowModal;
end;


procedure TFrmAccyTrackCostInfoWoDetails.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1, wwDBGrid2 ]);
end;

procedure TFrmAccyTrackCostInfoWoDetails.UniFormShow(Sender: TObject);
begin
   IQSetTablesActive( TRUE, self );
   {recalc cost elements and reopen table}
   //PostMessage( Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmAccyTrackCostInfoWoDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, wwDBGrid2 ]);
end;

procedure TFrmAccyTrackCostInfoWoDetails.AssignParamsBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   if Params.FindParam('batch') <> nil then
  //     ParamByName('batch').Value := FBatch;
  //  if Params.FindParam('workorder_id') <> nil then
  //     ParamByName('workorder_id').Value := FWorkorder_ID;
  //  if Params.FindParam('partno_id') <> nil then
  //     ParamByName('partno_id').Value := FPartno_ID;
  // end;
  AssignQueryParamValue(DataSet, 'batch',       FBatch );
  AssignQueryParamValue(DataSet, 'workorder_id',FWorkorder_ID );
  AssignQueryParamValue(DataSet, 'partno_id',   FPartno_ID );
end;

procedure TFrmAccyTrackCostInfoWoDetails.IQAfterShowMessage(
  var Msg: TMessage);
begin
  Reopen( QryTranslog );
  Reopen( QryTALabor );
end;

procedure TFrmAccyTrackCostInfoWoDetails.QryTALaborCalcFields(DataSet: TDataSet);
begin
  QryTALaborElem_Descrip.asString:= SelectValueByID('elem_descrip', 'elements', QryTALaborELEMENTS_ID.asFloat );
end;

procedure TFrmAccyTrackCostInfoWoDetails.SetABatch(const Value: Real);
begin
  FBatch := Value;
end;

procedure TFrmAccyTrackCostInfoWoDetails.SetAPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmAccyTrackCostInfoWoDetails.SetAWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmAccyTrackCostInfoWoDetails.SetBatch(const Value: Real);
begin
  FBatch := Value;
end;

procedure TFrmAccyTrackCostInfoWoDetails.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmAccyTrackCostInfoWoDetails.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

end.
