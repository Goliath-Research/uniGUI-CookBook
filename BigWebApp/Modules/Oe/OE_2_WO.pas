unit OE_2_WO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu;

type
  TFrmOE2WO = class(TUniForm)
    SrcOe2Wo: TDataSource;
    QryOe2Wo: TFDQuery;
    QryOe2WoARINVT_ID: TBCDField;
    QryOe2WoITEMNO: TStringField;
    QryOe2WoDESCRIP: TStringField;
    QryOe2WoMFGNO: TStringField;
    QryOe2WoORD_DETAIL_ID: TBCDField;
    QryOe2WoSTART_TIME: TDateTimeField;
    QryOe2WoEND_TIME: TDateTimeField;
    QryOe2WoSTANDARD_ID: TBCDField;
    QryOe2WoBUCKET: TBCDField;
    QryOe2WoPTALLOCATE_ID: TBCDField;
    QryOe2WoPRODHRS: TFMTBCDField;
    QryOe2WoCYCLES_REQ: TBCDField;
    QryOe2WoMFG_QUAN: TBCDField;
    QryOe2WoPARENT_ID: TFMTBCDField;
    QryOe2WoCNTR_SEQ: TBCDField;
    QryOe2WoEQNO: TStringField;
    QryOe2WoWORK_CENTER_ID: TBCDField;
    QryOe2WoCNTR_SCHED_ID: TBCDField;
    QryOe2WoPROD_START_TIME: TDateTimeField;
    QryOe2WoPROD_END_TIME: TDateTimeField;
    PopupMenu1: TUniPopupMenu;
    IQJumpInv: TIQWebJump;
    IQJumpBom: TIQWebJump;
    IQJumpWO: TIQWebJump;
    JumptoWorkOrder1: TUniMenuItem;
    JumptoBOM1: TUniMenuItem;
    N1: TUniMenuItem;
    QryOe2WoINDENTED_WO_ID: TStringField;
    QryOe2WoWORKORDER_ID: TBCDField;
    N2: TUniMenuItem;
    QryOe2WoROUTE_SEQ: TBCDField;
    SchedulingWindow1: TUniMenuItem;
    N3: TUniMenuItem;
    GanttChart1: TUniMenuItem;
    IQJumpSched: TIQWebJump;
    JumptoScheduling1: TUniMenuItem;
    pnlGrid: TUniPanel;
    DBGrid1: TUniDBGrid;
    Splitter1: TUniSplitter;
    pnlCarrier: TUniPanel;
    N4: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryOe2WoPTORDER_REL_ID: TBCDField;
    QryOe2WoFIRM: TStringField;
    SecurityRegister1: TIQWebSecurityRegister;
    QryOe2WoASSY_RUN: TStringField;
    JumptoAssyTrack1: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumptoWorkOrder1Click(Sender: TObject);
    procedure JumptoBOM1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure QryOe2WoBeforeOpen(DataSet: TDataSet);
    procedure VisualWorkorderRouting1Click(Sender: TObject);
    procedure SchedulingWindow1Click(Sender: TObject);
    procedure GanttChart1Click(Sender: TObject);
    procedure JumptoScheduling1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SrcOe2WoDataChange(Sender: TObject; Field: TField);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure JumptoAssyTrack1Click(Sender: TObject);
  private
    { Private declarations }
    FAll_Dates_Switch: Real;
    FJobShop_Rfq_ID  : Real;
    FChild: TUniForm;
    FDataSource: TDataSource;
    procedure CreateEmbededWORoutingDiagram;
    procedure FrmCreate( ADataSource:TDataSource );
    procedure FrmCreateFromJobShop( AJobShop_Rfq_ID: Real );
    procedure SetDataSource(const Value: TDataSource);
    procedure SetJobShop_Rfq_ID(const Value: Real);
  public
    { Public declarations }
    //constructor CreateEx( AOwner: TComponent ); virtual;
    //constructor Create( AOwner: TComponent; ADataSource:TDataSource );
    //constructor CreateFromJobShop( AOwner: TComponent; AJobShop_Rfq_ID: Real );
    property DataSource:TDataSource write SetDataSource;
    property JobShop_Rfq_ID: Real write SetJobShop_Rfq_ID;
  end;

procedure DoOrderEntry2WorkOrderInfo(ADataSource:TDataSource );
procedure DoJobShop2WorkOrderInfo( AJobShop_Rfq_ID: Real );



implementation

{$R *.DFM}

uses
  { TODO -oSanketG -cWC : Need to revisit }
  //assytrack_main,
  IQMS.Common.Cursor,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWC : Need to revisit }
  {RD_WO_Main,
  Sched_mn,}
  WO_Gantt;

procedure DoOrderEntry2WorkOrderInfo( ADataSource:TDataSource );
var
  FrmOE2WO: TFrmOE2WO;
begin
  FrmOE2WO := TFrmOE2WO.Create(UniGUIApplication.uniApplication);
  with FrmOE2WO do
  begin
    DataSource:= ADataSource;
    FrmCreate(FDataSource);
    Show;
  end;
end;

procedure DoJobShop2WorkOrderInfo( AJobShop_Rfq_ID: Real );
var
  FrmOE2WO: TFrmOE2WO;
begin
  FrmOE2WO := TFrmOE2WO.Create(UniGUIApplication.uniApplication);
  with FrmOE2WO do
  begin
    JobShop_Rfq_ID:= AJobShop_Rfq_ID;
    FrmCreateFromJobShop(FJobShop_Rfq_ID);
    Show;
  end;
end;

{constructor TFrmOE2WO.CreateEx( AOwner: TComponent );
begin
  inherited Create(AOwner);
end;}


procedure TFrmOE2WO.FrmCreate(ADataSource: TDataSource);
begin
  FAll_Dates_Switch:= 0;
  with QryOe2Wo do
  begin
    Close;
    DataSource:= ADataSource;
    Open;
  end;

  // CreateEmbededWORoutingDiagram;
end;

procedure TFrmOE2WO.FrmCreateFromJobShop(AJobShop_Rfq_ID: Real);
begin
  FJobShop_Rfq_ID:= AJobShop_Rfq_ID;

  FAll_Dates_Switch:= 1;
  with QryOe2Wo do
  begin
    Close;
    ParamByName('ord_detail_id').Value := SelectValueFmtAsFloat('select ord_detail_id from jobshop_rfq where id = %f', [ FJobShop_Rfq_ID ]);
    ParamByName('ptorder_id').Value := 0;
    Open;
  end;

  // CreateEmbededWORoutingDiagram;
end;

procedure TFrmOE2WO.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGrid1, pnlGrid ]);
  DBGrid1.Cursor:= crJump;
end;

procedure TFrmOE2WO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FChild) then
     FChild.Close;

  IQRegFormWrite( self, [ self, DBGrid1, pnlGrid ]);
end;

procedure TFrmOE2WO.JumptoWorkOrder1Click(Sender: TObject);
begin
  IQJumpWO.Execute;
end;

procedure TFrmOE2WO.JumptoBOM1Click(Sender: TObject);
begin
  IQJumpBOM.Execute;
end;

procedure TFrmOE2WO.N1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmOE2WO.QryOe2WoBeforeOpen(DataSet: TDataSet);
begin
  // 08-05-2009
  // with TFDQuery(DataSet) do
  //   ParamByName('all_dates').Value := FAll_Dates_Switch;
end;

procedure TFrmOE2WO.VisualWorkorderRouting1Click(Sender: TObject);
begin
  if QryOe2WoWORKORDER_ID.asFloat > 0 then
     { TODO -oSanketG -cWC : Need to revisit , depends on RD_WO_Main}
     (*ShowWO_RoutingDiagram( self,                                                { RD_WO_Main.pas }
                            QryOe2WoWORKORDER_ID.asFloat,
                            QryOe2WoARINVT_ID.asFloat,
                            QryOe2WoSTANDARD_ID.asFloat,
                            FJobShop_Rfq_ID );*)
end;

procedure TFrmOE2WO.SchedulingWindow1Click(Sender: TObject);
begin
  if QryOe2WoWORKORDER_ID.asFloat > 0 then
     { TODO -oSanketG -cWC : Need to revisit ,depends on sched_mn}
     //DoIQSchedWindowJobShop( QryOe2WoWORKORDER_ID.asFloat );  {sched_mn}
end;

procedure TFrmOE2WO.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TFrmOE2WO.SetJobShop_Rfq_ID(const Value: Real);
begin
  FJobShop_Rfq_ID := Value;
end;

procedure TFrmOE2WO.GanttChart1Click(Sender: TObject);
begin
  DoShowItemGantt( SrcOe2Wo );  {WO_Gantt.pas}
end;

procedure TFrmOE2WO.JumptoScheduling1Click(Sender: TObject);
begin
  IQJumpSched.Execute;
end;

procedure TFrmOE2WO.CreateEmbededWORoutingDiagram;
begin
  if not (Assigned(QryOe2Wo) and (QryOe2Wo.State = dsBrowse)) then
     EXIT;

  if Assigned(FChild) then
     FreeAndNil(FChild);
  { TODO -oSanketG -cWC : Need to revisit , depends on RD_WO_Main}
  (*FChild:= ShowWO_RoutingDiagramEmbeded( self,                                                { RD_WO_Main.pas }
                                         pnlCarrier,
                                         QryOe2WoWORKORDER_ID.asFloat,
                                         QryOe2WoARINVT_ID.asFloat,
                                         QryOe2WoSTANDARD_ID.asFloat,
                                         FJobShop_Rfq_ID );*)
end;

procedure TFrmOE2WO.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmOE2WO.SrcOe2WoDataChange(Sender: TObject; Field: TField);
begin
  CreateEmbededWORoutingDiagram;
end;


procedure TFrmOE2WO.PopupMenu1Popup(Sender: TObject);
begin
  JumptoAssyTrack1.Enabled:= QryOe2WoASSY_RUN.asString = 'Y';
end;


procedure TFrmOE2WO.JumptoAssyTrack1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to revisit , depends on assytrack_main}
  //TFrmAssyTrackMain.DoShow( Application, QryOe2WoWORKORDER_ID.asFloat );  // assytrack_main.pas
end;


end.
