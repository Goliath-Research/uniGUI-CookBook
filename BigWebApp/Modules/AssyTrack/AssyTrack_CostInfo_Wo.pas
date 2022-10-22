unit AssyTrack_CostInfo_Wo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.wwDataInspector,
  IQMS.WebVcl.About,
  IQMS.Common.JumpConstants,
  Vcl.Buttons,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TFrmAssyTrackCostingWO = class(TUniForm)
    SrcMain: TDataSource;
    QryMain: TFDQuery;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryMainID: TBCDField;
    QryMainWORKORDER_ID: TBCDField;
    QryMainPARTNO_ID: TBCDField;
    QryMainITEMNO: TStringField;
    QryMainDESCRIP: TStringField;
    QryMainREV: TStringField;
    QryMainCLASS: TStringField;
    SrcCostElements: TDataSource;
    QryCostElements: TFDQuery;
    QryCostElementsID: TBCDField;
    QryCostElementsELEMENTS_ID: TBCDField;
    QryCostElementsELEM_DESCRIP: TStringField;
    QryCostElementsACT_COST: TFMTBCDField;
    QryCostElementsSTD_COST: TFMTBCDField;
    QryCostElementsVARIANCE: TFMTBCDField;
    PopupMenu1: TUniPopupMenu;
    Details1: TUniMenuItem;
    pnlCarrier: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Panel4: TUniPanel;
    sbtnRecalc: TUniSpeedButton;
    QryMainDESCRIP2: TStringField;
    sbtnSaveToHist: TUniSpeedButton;
    wwDataInspector1: TwwDataInspector;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMainBeforeOpen(DataSet: TDataSet);
    procedure sbtnRecalcClick(Sender: TObject);
    procedure Details1Click(Sender: TObject);
    procedure wwDBGrid1UpdateFooter(Sender: TObject);
    procedure sbtnSaveToHistClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FNewHdr_ID   : Real;
    FWorkorder_ID: Real;
    FPartno_ID   : Real;

    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure RefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
    procedure SaveCostingInfo;
    procedure SetPartno_ID(const Value: Real);
    procedure SetWorkorder_ID(const Value: Real);

  public
    { Public declarations }
    //constructor Create( AOwner: TComponent; AWorkorder_ID, APartno_ID: Real);
    class procedure DoShow(AWorkorder_ID, APartno_ID: Real );
    //destructor Destroy; override;
    function ActualCost: Real;
    procedure ReCalculateCostingInfo;
    //constructor CreateEx(AOwner: TComponent; AWorkorder_ID, APartno_ID: Real);
    property Workorder_ID : Real write SetWorkorder_ID;
    property Partno_ID : Real write SetPartno_ID;
  end;

implementation

{$R *.dfm}

uses
  AssyTrack_CostInfo_Wo_Details,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  PanelMsg;

class procedure TFrmAssyTrackCostingWO.DoShow(AWorkorder_ID, APartno_ID: Real);
var
  LFrmAssyTrackCostingWO : TFrmAssyTrackCostingWO;
begin
  LFrmAssyTrackCostingWO := TFrmAssyTrackCostingWO.Create(UniGUIApplication.UniApplication);
  with LFrmAssyTrackCostingWO do
  begin
    Workorder_ID:= AWorkorder_ID;
    Partno_ID   := APartno_ID;
    FNewHdr_ID   := GetNextID('c_assy1_proc_cost');
  end;
  LFrmAssyTrackCostingWO.Show;
end;

(*constructor TFrmAssyTrackCostingWO.Create(AOwner: TComponent; AWorkorder_ID, APartno_ID: Real);
begin
  FWorkorder_ID:= AWorkorder_ID;
  FPartno_ID   := APartno_ID;
  FNewHdr_ID   := GetNextID('c_assy1_proc_cost');

  inherited Create(AOwner);
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);

  {recalc cost elements and reopen table}
  PostMessage( Handle, iq_AfterShowMessage, 0, 0);
end;


constructor TFrmAssyTrackCostingWO.CreateEx(AOwner: TComponent; AWorkorder_ID, APartno_ID: Real);
begin
  FWorkorder_ID:= AWorkorder_ID;
  FPartno_ID   := APartno_ID;
  FNewHdr_ID   := GetNextID('c_assy1_proc_cost');

  inherited Create(AOwner);
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

*)

procedure TFrmAssyTrackCostingWO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
  //Action:= caFree;
end;

{destructor TFrmAssyTrackCostingWO.Destroy;
begin
  ExecuteCommandFmt('delete from c_assy1_proc_cost where id = %f', [ FNewHdr_ID ]);
  inherited;
end;       }


procedure TFrmAssyTrackCostingWO.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssyTrackCostingWO.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAssyTrackCostingWO.IQAfterShowMessage(var Msg: TMessage);
begin
  ReCalculateCostingInfo;
end;


procedure TFrmAssyTrackCostingWO.QryMainBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //  ParamByName('id').Value := FNewHdr_ID;
  AssignQueryParamValue(DataSet, 'id', FNewHdr_ID);
end;


procedure TFrmAssyTrackCostingWO.sbtnRecalcClick(Sender: TObject);
begin
  if not IQConfirmYN('Recalculate Costing Info?') then
     EXIT;

  ReCalculateCostingInfo;
end;

procedure TFrmAssyTrackCostingWO.ReCalculateCostingInfo;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    ExecuteCommandFmt('begin                              '+
              '  proc_cost_assy1_wo.do_main( %f,  '+     // v_new_hdr_id
              '                              %f,  '+     // v_workorder_id
              '                              %f); '+     // v_partno_id
              'end;',
              [ FNewHdr_ID,
                FWorkorder_ID,
                FPartno_ID ]);

  finally
    Reopen(QryMain);
    Reopen(QryCostElements);
    hMsg.Free;
  end;
end;

procedure TFrmAssyTrackCostingWO.Details1Click(Sender: TObject);
var
  ABatch: Real;
begin
  ABatch:= SelectValueFmtAsFloat('select batch from workorder where id = %f', [ FWorkorder_ID ]);  // , FPartno_ID
  TFrmAccyTrackCostInfoWoDetails.DoShowModal( ABatch, FWorkorder_ID, FPartno_ID ); // AssyTrack_CostInfo_Wo_Details.pas
end;

procedure TFrmAssyTrackCostingWO.wwDBGrid1UpdateFooter(Sender: TObject);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt('select sum(act_cost), sum(std_cost), sum((nvl(std_cost,0) - nvl(act_cost,0))) '+
                     ' from c_assy1_proc_cost_elem where c_assy1_proc_cost_id = %f ',
                     [ QryMainID.asFloat ]);
{ TODO -oysingh -cWebConvert : TIQUniGridControl doesn't have the property ColumnByName }
{  wwDBGrid1.ColumnByName('ACT_COST').FooterValue:= A[ 0 ];
  wwDBGrid1.ColumnByName('STD_COST').FooterValue:= A[ 1 ];
  wwDBGrid1.ColumnByName('VARIANCE').FooterValue:= A[ 2 ];     }
end;

function TFrmAssyTrackCostingWO.ActualCost: Real;
begin
  Result:= SelectValueFmtAsFloat('select sum(act_cost) from c_assy1_proc_cost_elem where c_assy1_proc_cost_id = %f', [ FNewHdr_ID ]);
end;

procedure TFrmAssyTrackCostingWO.RefreshDataSets(var Msg: TMessage);
begin
  Reopen(QryMain);
  Reopen(QryCostElements);
end;

procedure TFrmAssyTrackCostingWO.sbtnSaveToHistClick(Sender: TObject);
begin
  if not IQConfirmYN('Save Costing Info?') then
     EXIT;

  SaveCostingInfo;
end;

procedure TFrmAssyTrackCostingWO.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmAssyTrackCostingWO.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmAssyTrackCostingWO.UniFormDestroy(Sender: TObject);
begin
  ExecuteCommandFmt('delete from c_assy1_proc_cost where id = %f', [ FNewHdr_ID ]);
end;

procedure TFrmAssyTrackCostingWO.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmAssyTrackCostingWO.SaveCostingInfo;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    ExecuteCommandFmt('begin                               '+
              '  proc_cost_assy1_wo.do_save( %f,   '+     // v_header_id
              '                              %f,   '+     // v_workorder_id
              '                              %f ); '+     // v_partno_id
              'end;',
              [ FNewHdr_ID,
                FWorkorder_ID,
                FPartno_ID ]);

  finally
    hMsg.Free;
  end;
end;


end.
