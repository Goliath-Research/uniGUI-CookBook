unit AssyTrack_Dispatch;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  //WEB_CONVERT IQMS.Common.UserMessages,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
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
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TCargoDispatch = record
    Sndop_Dispatch_ID: Real;
  end;

  TFrmAssyTrackDispatch = class(TUniForm)
    pnlLeft01: TUniPanel;
    pnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    IQSearch1: TIQUniGridControl;
    Panel1: TUniPanel;
    wwDBGridDispatch: TIQUniGridControl;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    sbtnInsert: TUniSpeedButton;
    sbtnRemove: TUniSpeedButton;
    Panel5: TUniPanel;
    Bevel2: TUniPanel;
    SrcWorkCenter: TDataSource;
    QryWorkCenter: TFDQuery;
    SrcSndop_Dispatch: TDataSource;
    QrySndop_Dispatch: TFDQuery;
    QryWorkCenterID: TBCDField;
    QryWorkCenterEQNO: TStringField;
    QryWorkCenterCNTR_DESC: TStringField;
    QryWorkCenterCNTR_TYPE: TStringField;
    QryWorkCenterMFGCELL: TStringField;
    QryWorkCenterEPLANT_ID: TBCDField;
    QrySndop_DispatchID: TBCDField;
    QrySndop_DispatchSNDOP_ID: TBCDField;
    QrySndop_DispatchSEQ: TBCDField;
    QrySndop_DispatchWORKORDER_ID: TBCDField;
    QrySndop_DispatchPARTNO_ID: TBCDField;
    QrySndop_DispatchWORK_CENTER_ID: TBCDField;
    QrySndop_DispatchOPNO: TStringField;
    QrySndop_DispatchOPDESC: TStringField;
    SrcPtOrder: TDataSource;
    QryPtOrder: TFDQuery;
    QryPtOrderID: TBCDField;
    QryPtOrderWORKORDER_ID: TBCDField;
    QryPtOrderPARTNO_ID: TBCDField;
    QryPtOrderREL_DATE: TDateTimeField;
    QryPtOrderREL_QUAN: TBCDField;
    QryPtOrderORDERNO: TStringField;
    QryPtOrderPONO: TStringField;
    QryPtOrderPTALLOCATE_ID: TBCDField;
    QryPtOrderARINVT_ID: TBCDField;
    QryPtOrderCLASS: TStringField;
    QryPtOrderITEMNO: TStringField;
    QryPtOrderREV: TStringField;
    QryPtOrderDESCRIP: TStringField;
    QryPtOrderDESCRIP2: TStringField;
    QryPtOrderUNIT: TStringField;
    QryPtOrderCOMPANY: TStringField;
    QryPtOrderPROMISE_DATE: TDateTimeField;
    QryPtOrderREQUEST_DATE: TDateTimeField;
    QryPtOrderREL_QUAN_DISP: TFMTBCDField;
    QryPtOrderORDERS_ID: TBCDField;
    QryPtOrderSTANDARD_ID: TBCDField;
    QryPtOrderORD_DETAIL_ID: TBCDField;
    Splitter2: TUniSplitter;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QrySndop_DispatchHoursToGo: TFloatField;
    wwDBGrid2: TIQUniGridControl;
    QrySndop_DispatchPartsToGo: TFloatField;
    QrySndop_DispatchPTORDER_ID: TFMTBCDField;
    SecurityRegister1: TIQWebSecurityRegister;
    QrySndop_DispatchRejects: TFloatField;
    QrySndop_DispatchPTOPER_ID: TBCDField;
    QryPtOrderFG_LOTNO: TStringField;
    QrySndop_DispatchPRIORITY_NOTE: TStringField;
    QrySndop_DispatchPRIORITY_NOTE2: TStringField;
    QryPtOrderJOB_SEQ: TBCDField;
    pnlLegend: TUniPanel;
    Panel9: TUniPanel;
    Shape8: TUniPanel;
    QrySndop_DispatchCNTR_SCHED_ID: TFMTBCDField;
    popmDisptachList: TUniPopupMenu;
    JumpToWorkOrder1: TUniMenuItem;
    JumpToSchedule1: TUniMenuItem;
    JumpToProcessMaintenance1: TUniMenuItem;
    JumpToBOM1: TUniMenuItem;
    QrySndop_DispatchSTANDARD_ID: TBCDField;
    IQJumpWorkOrder: TIQWebJump;
    QrySndop_DispatchLOOKUP_MFGTYPE: TStringField;
    IQJumpBOM: TIQWebJump;
    popmOrderDtl: TUniPopupMenu;
    JumpToSalesOrder1: TUniMenuItem;
    JumpToInventory1: TUniMenuItem;
    IQJumpOE: TIQWebJump;
    IQJumpInv: TIQWebJump;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure QrySndop_DispatchUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TNavigateBtn'
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);}
    procedure sbtnInsertClick(Sender: TObject);
    procedure sbtnRemoveClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QrySndop_DispatchCalcFields(DataSet: TDataSet);
    procedure wwDBGridDispatchMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure wwDBGridDispatchDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure wwDBGridDispatchDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure QryWorkCenterBeforeOpen(DataSet: TDataSet);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
    procedure wwDBGridDispatchCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure JumpToWorkOrder1Click(Sender: TObject);
    procedure JumpToSchedule1Click(Sender: TObject);
    procedure JumpToProcessMaintenance1Click(Sender: TObject);
    procedure JumpToBOM1Click(Sender: TObject);
    procedure popmDisptachListPopup(Sender: TObject);
    procedure JumpToSalesOrder1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure QryWorkCenterAfterScroll(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDragDropPoint: TPoint;
    FLikeMfgType: string;
    FFilterWork_CenterMfgType: string;
    FWorkCenterHasProcessesScheduled: Boolean;

    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
      TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_RefreshDataSets'
    procedure IQNotifyMessage( var Msg: TMessage ); message iq_Notify;
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;}
    procedure AssignHasProcessesScheduled;
  protected
    procedure InsertProcessIntoDispatchList( AWork_Center_ID: Real; ASndop_Dispatch_List: TStringList; ASeq: Real ); overload;
    procedure InsertProcessIntoDispatchList( AWork_Center_ID, ASndop_Dispatch_ID, ASeq: Real ); overload;
    procedure DragDropItem; virtual;
    procedure CheckWorkCenterHasProcessesScheduled(AWork_Center_ID: Real);
    procedure CheckIsProcessFiniteScheduled(ASndOp_Dispatch_ID: Real);
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  assy_data_share,
  AssyTrack_Const,
  //WEB_CONVERT AssyTrack_Main,
  //WEB_CONVERT AssyTrack_PickToDispatch,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare,
  snd_link;


type
   TwwLocalDBGrid = class( TIQUniGridControl )    {so we could surface MouseDown event}
   public
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
   end;

{ TwwLocalDBGrid }
procedure TwwLocalDBGrid.MouseDown(Button: TMouseButton;  Shift: TShiftState; X, Y: integer);
begin
  inherited MouseDown( Button, Shift, X, Y );
end;


{ TFrmAssyTrackDispatch }
class procedure TFrmAssyTrackDispatch.DoShow;
begin
  self.Create( UniGuiApplication.UniApplication ).Show;
end;

procedure TFrmAssyTrackDispatch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGridDispatch ]);
end;

procedure TFrmAssyTrackDispatch.AbortOnInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmAssyTrackDispatch.QrySndop_DispatchUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  AAction := eaApplied;
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TNavigateBtn'
procedure TFrmAssyTrackDispatch.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;}

procedure TFrmAssyTrackDispatch.sbtnInsertClick(Sender: TObject);
var
  ASeq: Real;
  ASndop_Dispatch_List: TStringList;
begin
  IQAssert(  QryWorkCenterID.asFloat > 0, 'Undefined Work Center - operation aborted.' );

  CheckWorkCenterHasProcessesScheduled( QryWorkCenterID.asFloat );

  ASndop_Dispatch_List:= TStringList.Create;
  try
    { TODO -oBantuK -cWEB_CONVERT : Dependency on AssyTrack_PickToDispatch
    if TFrmAssyTrackPickToDispatch.DoShowModal( self, QryWorkCenterID.asFloat, ASndop_Dispatch_List, ASeq ) then   // AssyTrack_PickToDispatch
       InsertProcessIntoDispatchList( QryWorkCenterID.asFloat, ASndop_Dispatch_List, ASeq );}
  finally
    ASndop_Dispatch_List.Free;
  end;

  AssignHasProcessesScheduled;
end;

procedure TFrmAssyTrackDispatch.InsertProcessIntoDispatchList( AWork_Center_ID: Real; ASndop_Dispatch_List: TStringList; ASeq: Real );
var
  I: Integer;
begin
  if ASndop_Dispatch_List.Count = 0 then
     EXIT;

  for I:= 0 to ASndop_Dispatch_List.Count - 1 do
  begin
    InsertProcessIntoDispatchList( AWork_Center_ID, StrToFloat(ASndop_Dispatch_List[ I ]), ASeq );
    ASeq:= ASeq + 1;
  end;

  Reopen(QrySndop_Dispatch);
  QrySndop_Dispatch.Locate('ID', ASndop_Dispatch_List[ 0 ], []);
end;


procedure TFrmAssyTrackDispatch.InsertProcessIntoDispatchList( AWork_Center_ID, ASndop_Dispatch_ID, ASeq: Real );
begin
    ExecuteCommandFmt('declare                                                                     '+
              '  v_work_center_id number::= %f;                                            '+
              '  v_sndop_dispatch_id number::= %f;                                         '+
              '  v_seq number::= %f;                                                       '+
              'begin                                                                       '+
              '  update sndop_dispatch                                                     '+
              '     set work_center_id = v_work_center_id,                                 '+
              '         seq = v_seq                                                        '+
              '   where id = v_sndop_dispatch_id;                                          '+
              '                                                                            '+
              '  assy1_misc.recalc_center( v_work_center_id, v_sndop_dispatch_id, v_seq ); '+
              'end;                                                                        ',
              [ AWork_Center_ID,
                ASndop_Dispatch_ID,
                ASeq ]);
end;


procedure TFrmAssyTrackDispatch.sbtnRemoveClick(Sender: TObject);
var
  APriorID, ANextID: Real;
begin
  if QrySndop_DispatchID.asFloat = 0 then
     EXIT;

  if QrySndop_DispatchCNTR_SCHED_ID.asFloat > 0 then
     CheckWorkCenterHasProcessesScheduled( QryWorkCenterID.asFloat );  // this should popup exception since QrySndop_DispatchCNTR_SCHED_ID.asFloat > 0

  if not IQConfirmYN('Remove process from the dispatch list?') then
     EXIT;

  APriorID:= SelectValueFmtAsFloat('select id from sndop_dispatch where work_center_id = %f and seq < %f order by seq desc', [ QryWorkCenterID.asFloat, QrySndop_DispatchSEQ.asFloat ]);
  ANextID := SelectValueFmtAsFloat('select id from sndop_dispatch where work_center_id = %f and seq > %f order by seq', [ QryWorkCenterID.asFloat, QrySndop_DispatchSEQ.asFloat ]);

  ExecuteCommandFmt('declare                                                      '+
            '  v_work_center_id number::= %f;                             '+
            '  v_sndop_dispatch_id number::= %f;                          '+
            'begin                                                        '+
            '  update sndop_dispatch                                      '+
            '     set work_center_id = null,                              '+
            '         seq = null                                          '+
            '   where id = v_sndop_dispatch_id;                           '+
            '                                                             '+
            '  assy1_misc.recalc_center( v_work_center_id, null, null );  '+
            'end;                                                         ',
            [ QryWorkCenterID.asFloat,
              QrySndop_DispatchID.asFloat  ]);

  Reopen(QrySndop_Dispatch);

  if ANextID > 0 then
     QrySndop_Dispatch.Locate('ID', ANextID, [])
  else if APriorID > 0 then
     QrySndop_Dispatch.Locate('ID', APriorID, []);

  AssignHasProcessesScheduled;
end;

procedure TFrmAssyTrackDispatch.UniFormShow(Sender: TObject);
begin

  { TODO -oBantuK -cWEB_CONVERT : Dependency on AssyTrack_Main
  if AOwner is TFrmAssyTrackMain then
     FLikeMfgType:= IQMS.Common.MfgShare.Lookup_MfgType( TFrmAssyTrackMain(AOwner).FViewFilter.MfgType )
  else
     FLikeMfgType:= 'ASSY1';}  // s/n happen

  FFilterWork_CenterMfgType:= FLikeMfgType;
  if FFilterWork_CenterMfgType = 'ASSY2' then
     FFilterWork_CenterMfgType:= 'ASSY1';

  IQSetTablesActive( TRUE, self );
  Reopen(QryWorkCenter);

  IQRegFormRead( self, [ self, wwDBGridDispatch ]);
end;

procedure TFrmAssyTrackDispatch.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssyTrackDispatch.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAssyTrackDispatch.QrySndop_DispatchCalcFields(DataSet: TDataSet);
var
  ATotalReleaseQty  : Real;
  AGoodPartsProduced: Real;
  AProgress         : Real;
  AHoursToGo        : Real;
  ActHrsPart        : Real;
  ARejects          : Real;
  APartsToGo        : Real;
begin
  ATotalReleaseQty:= SelectValueFmtAsFloat('select sum(nvl(rel_quan_origin,rel_quan)) from ptorder_rel where ptorder_id = %f',
                               [ QrySndop_DispatchPTORDER_ID.asFloat ]);

  assy_data_share.CalculateProcessProgress( QrySndop_DispatchWORKORDER_ID.asFloat,  // AWorkorder_ID
                                            QrySndop_DispatchPARTNO_ID.asFloat,     // APartno_ID
                                            QrySndop_DispatchSNDOP_ID.asFloat,      // ASndop_ID
                                            QrySndop_DispatchPTOPER_ID.asFloat,     // APtoper_ID
                                            ATotalReleaseQty,                       // ATotalReleaseQty
                                            AGoodPartsProduced,                     // AGoodPartsProduced
                                            ARejects,                               // Rejected Mfg Parts
                                            AProgress,                              // AProgress
                                            AHoursToGo,                             // AHoursToGo
                                            APartsToGo,                             // APartsToGo
                                            ActHrsPart );                           // ActHrsPart

  QrySndop_DispatchHoursToGo.asFloat:= AHoursToGo;
  QrySndop_DispatchPartsToGo.asFloat:= APartsToGo;
end;

procedure TFrmAssyTrackDispatch.wwDBGridDispatchMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'RowHeights'
  if (Shift = [ssLeft]) and (Y > wwDBGridDispatch.RowHeights[ 0 ]) and not (QrySndop_Dispatch.Eof and QrySndop_Dispatch.Bof)
     and not FWorkCenterHasProcessesScheduled then
  begin
    wwDBGridDispatch.BeginDrag(FALSE);
  end;}
end;

procedure TFrmAssyTrackDispatch.wwDBGridDispatchDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Source = wwDBGridDispatch)
           and
           (Sender = wwDBGridDispatch)
           and not (QrySndop_Dispatch.Eof and QrySndop_Dispatch.Bof);
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
procedure TFrmAssyTrackDispatch.wwDBGridDispatchCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if (QrySndop_DispatchCNTR_SCHED_ID.asFloat > 0)
     and
     ((Field = QrySndop_DispatchWORKORDER_ID) or (Field = QrySndop_DispatchOPNO))then
  begin
    AFont.Style:= AFont.Style + [fsBold];
  end;
end;}

procedure TFrmAssyTrackDispatch.wwDBGridDispatchDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  FDragDropPoint:= Point(X,Y);
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
  PostMessage( Handle, iq_Notify, 1, 0 );}
end;

{TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
procedure TFrmAssyTrackDispatch.IQNotifyMessage(var Msg: TMessage);
begin
  case Msg.WParam of
    1: DragDropItem;
  end;
end;}

{TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_RefreshDataSets'
procedure TFrmAssyTrackDispatch.IQRefreshDataSets(var Msg: TMessage);
begin
  case Msg.WParam of
     AssyTrack_Const.cRefreshDataSet: RefreshDataSetByID( QryWorkCenter );
  end;
end;}

procedure TFrmAssyTrackDispatch.JumpToBOM1Click(Sender: TObject);
begin
  IQJumpBOM.Execute;
end;

procedure TFrmAssyTrackDispatch.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute
end;

procedure TFrmAssyTrackDispatch.JumpToProcessMaintenance1Click(Sender: TObject);
begin
  ShowSndOperModaless( QrySndop_DispatchSNDOP_ID.asFloat, 'AS' );  {snd_link.pas}
end;

procedure TFrmAssyTrackDispatch.JumpToSalesOrder1Click(Sender: TObject);
begin
  IQJumpOE.Execute;
end;

procedure TFrmAssyTrackDispatch.JumpToSchedule1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : 'UserMessages' is not the name of a unit
  if StrInList(QrySndop_DispatchLOOKUP_MFGTYPE.asString, ['ASSY1', 'ASSY2']) then
     JumpDirect( IQMS.Common.UserMessages.iq_JumpToScheduleBySndop_Dispatch_ID, Trunc(QrySndop_DispatchID.asFloat))
  else
     JumpDirect( IQMS.Common.UserMessages.iq_JumpToScheduleByWorkorder, Trunc(QrySndop_DispatchWORKORDER_ID.asFloat))
  }
end;

procedure TFrmAssyTrackDispatch.JumpToWorkOrder1Click(Sender: TObject);
begin
  IQJumpWorkOrder.Execute;
end;

procedure TFrmAssyTrackDispatch.popmDisptachListPopup(Sender: TObject);
begin
  JumpToSchedule1.Enabled:= (QrySndop_DispatchCNTR_SCHED_ID.asFloat > 0)
                            and
                            SecurityRegister1.Enabled['JumpToSchedule1'];
end;

procedure TFrmAssyTrackDispatch.DragDropItem;
var
  AOnMouseDown: TMouseEvent;
  ACargo: TCargoDispatch;
begin
  {save source id}
  ACargo.Sndop_Dispatch_ID:= QrySndop_DispatchID.asFloat;

  {make to go to the target}
  AOnMouseDown:= wwDBGridDispatch.OnMouseDown;
  wwDBGridDispatch.OnMouseDown:= NIL;
  try
    TwwLocalDBGrid(wwDBGridDispatch).MouseDown( mbLeft, [ssLeft], FDragDropPoint.X, FDragDropPoint.Y );
  finally
    wwDBGridDispatch.OnMouseDown:= AOnMouseDown;
  end;

  {Update Seq. Note we will also update work_center which is redandant since we are moving within the same work center}
  InsertProcessIntoDispatchList( QrySndop_DispatchWORK_CENTER_ID.asFloat, ACargo.Sndop_Dispatch_ID, QrySndop_DispatchSEQ.asFloat );

  Reopen(QrySndop_Dispatch);
  QrySndop_Dispatch.Locate('ID', ACargo.Sndop_Dispatch_ID, []);
end;

procedure TFrmAssyTrackDispatch.QryWorkCenterAfterScroll(DataSet: TDataSet);
begin
  AssignHasProcessesScheduled;
end;

procedure TFrmAssyTrackDispatch.AssignHasProcessesScheduled;
begin
  FWorkCenterHasProcessesScheduled:= SelectValueFmtAsFloat('select count(*) from cntr_sched where work_center_id = %f and sndop_dispatch_id is not null and rownum < 2', [ QryWorkCenterID.asFloat ]) > 0;
end;

procedure TFrmAssyTrackDispatch.QryWorkCenterBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do ParamByName('like_mfg_type').asString:= FFilterWork_CenterMfgType;
  AssignQueryParamValue(DataSet, 'like_mfg_type', FFilterWork_CenterMfgType);
end;

procedure TFrmAssyTrackDispatch.CheckWorkCenterHasProcessesScheduled( AWork_Center_ID: Real );
var
  AEqNo: string;
begin
  // if SelectValueFmtAsFloat('select count(*) from cntr_sched where work_center_id = %f and sndop_dispatch_id is not null and rownum < 2', [ AWork_Center_ID ]) = 0 then
  if not FWorkCenterHasProcessesScheduled then
     EXIT;

  AEqNo:= Trim(SelectValueByID('eqno', 'work_center', AWork_Center_ID));
  raise Exception.CreateFmt('Work Center %s has processes scheduled in Finite Schedule.'+
                            #13#13'Jump to Schedule to make changes to the Finite Schedule.',
                            [ AEqNo ]);
end;


procedure TFrmAssyTrackDispatch.CheckIsProcessFiniteScheduled( ASndOp_Dispatch_ID: Real );
var
  ACntr_Sched_ID: Real;
  AOpNo: string;
  AWorkorder_ID: Real;
  A: Variant;
begin
  if ASndOp_Dispatch_ID = 0 then EXIT;

  ACntr_Sched_ID:= SelectValueFmtAsFloat('select id from cntr_sched where sndop_dispatch_id = %f', [ ASndOp_Dispatch_ID ]);

  if ACntr_Sched_ID > 0 then
  begin
    A:= SelectValueArrayFmt( 'select s.opno,                   '+
                        '       d.workorder_id            '+
                        '  from sndop_dispatch d, sndop s '+
                        ' where d.id = %f                 '+
                        '   and d.sndop_id = s.id         ',
                      [ ASndOp_Dispatch_ID ]);
    IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to locate Disptach ID %f - operation aborted', [ ASndOp_Dispatch_ID ]));
    AOpNo        := A[ 0 ];
    AWorkorder_ID:= A[ 1 ];

    raise Exception.CreateFmt('Process %s [Work Order %.0f, Dispatch ID %.0f] is in Finite Schedule.'+
                              #13#13'Jump to Schedule to make changes to the Finite Schedule.',
                              [ AOpNo,
                                AWorkorder_ID,
                                ASndOp_Dispatch_ID ]);
  end;
end;



end.
