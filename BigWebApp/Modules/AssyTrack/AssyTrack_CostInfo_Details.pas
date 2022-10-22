unit AssyTrack_CostInfo_Details;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
//  IQMS.Common.UserMessages,
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
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmAccyTrackCostInfoDetails = class(TUniForm)
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
    QryTALaborPROCESS_QTY: TFMTBCDField;
    QryTALaborElem_Descrip: TStringField;
    wwDBGrid2: TIQUniGridControl;
    QryTranslogPARENT_WIP_QUAN: TFMTBCDField;
    QryTALaborOH_HRS: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignParamsBeforeOpen(DataSet: TDataSet);
    procedure QryTALaborCalcFields(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkorder_ID: Real;
    FPartno_ID   : Real;
    FSndop_ID    : Real;
    FPtoper_ID   : Real;
    procedure SetWorkorder_ID(const Value:Real);
    procedure SetPartno_ID(const Value:Real);
    procedure SetSndop_ID(const Value:Real);
    procedure SetPtoper_ID(const Value:Real);
//    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  public
    { Public declarations }
    property Workorder_ID: Real write SetWorkorder_ID;
    property Partno_ID: Real write SetPartno_ID;
    property Sndop_ID: Real write SetSndop_ID;
    property Ptoper_ID: Real write SetPtoper_ID;
    class procedure DoShowModal(AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmAccyTrackCostInfoDetails }

class procedure TFrmAccyTrackCostInfoDetails.DoShowModal(AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID: Real);
var
  frm: TFrmAccyTrackCostInfoDetails;
begin
  frm := TFrmAccyTrackCostInfoDetails.Create(uniGUIApplication.UniApplication);
  frm.FWorkorder_ID := AWorkorder_ID;
  frm.FPartno_ID := APartno_ID;
  frm.FSndop_ID := ASndop_ID;
  frm.FPtoper_ID := APtoper_ID;
  frm.ShowModal;
end;

procedure TFrmAccyTrackCostInfoDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, wwDBGrid2 ]);
end;

procedure TFrmAccyTrackCostInfoDetails.AssignParamsBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//  begin
//    if Params.FindParam('workorder_id') <> nil then
//       ParamByName('workorder_id').Value := FWorkorder_ID;
//    if Params.FindParam('partno_id') <> nil then
//       ParamByName('partno_id').Value := FPartno_ID;
//    if Params.FindParam('sndop_id') <> nil then
//       ParamByName('sndop_id').Value := FSndop_ID;
//    if Params.FindParam('ptoper_id') <> nil then
//       ParamByName('ptoper_id').Value := FPtoper_ID;
//  end;


  AssignQueryParamValue(DataSet, 'workorder_id', FWorkorder_ID, ftFloat);
  AssignQueryParamValue(DataSet, 'partno_id'   , FPartno_ID   , ftFloat);
  AssignQueryParamValue(DataSet, 'sndop_id'    , FSndop_ID    , ftFloat);
  AssignQueryParamValue(DataSet, 'ptoper_id'   , FPtoper_ID   , ftFloat);
end;

//procedure TFrmAccyTrackCostInfoDetails.IQAfterShowMessage( var Msg: TMessage);
//begin
//  Reopen( QryTranslog );
//  Reopen( QryTALabor );
//end;

procedure TFrmAccyTrackCostInfoDetails.QryTALaborCalcFields(
  DataSet: TDataSet);
begin
  QryTALaborElem_Descrip.asString:= SelectValueByID('elem_descrip', 'elements', QryTALaborELEMENTS_ID.asFloat );
end;

procedure TFrmAccyTrackCostInfoDetails.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmAccyTrackCostInfoDetails.SetPtoper_ID(const Value: Real);
begin
  FPtoper_ID := Value;
end;

procedure TFrmAccyTrackCostInfoDetails.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

procedure TFrmAccyTrackCostInfoDetails.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmAccyTrackCostInfoDetails.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1, wwDBGrid2 ]);

  {recalc cost elements and reopen table}
//  PostMessage( Handle, iq_AfterShowMessage, 0, 0);
  Reopen( QryTranslog );
  Reopen( QryTALabor );

end;

end.
