unit AssyTrack_ScheduleOnWorkCenter;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  //IQMS.Common.UserMessages,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TFrmAssyTrack_ScheduleOnWorkCenter = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    SrcWorkCenter: TDataSource;
    QryWorkCenter: TFDQuery;
    IQSearch1: TIQUniGridControl;
    QryWorkCenterID: TBCDField;
    QryWorkCenterEQNO: TStringField;
    QryWorkCenterCNTR_DESC: TStringField;
    QryWorkCenterCNTR_TYPE: TStringField;
    QryWorkCenterMFGCELL: TStringField;
    QryWorkCenterEPLANT_ID: TBCDField;
    QryWorkCenterDATE_AVAILABLE: TDateTimeField;
    QryWorkCenterRUNS_BEST_SEQ: TFMTBCDField;
    QryWorkCenterRUNS_BEST_PERFORMANCE: TFMTBCDField;
    QryWorkCenterMFG_TYPE: TStringField;
    QryWorkCenterDATE_1ST_JOB: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryWorkCenterBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkorder_ID     : Real;
    FPartno_ID        : Real;
    FSndop_ID         : Real;
    FSndop_Dispatch_ID: Real;
    FAssyLine_Work_Center_ID: Real;
    procedure SetSndop_Dispatch_ID(const Value: Real);
    //procedure IQNotify( var Msg: TMessage ); message iq_Notify;

  public
    { Public declarations }
    class function DoShowModal(ASndop_Dispatch_ID: Real): Boolean;
    property Sndop_Dispatch_ID: Real write SetSndop_Dispatch_ID;
  end;

implementation

{$R *.dfm}

uses
  AssyTrack_Const,
  //WEB_CONVERT AssyTrack_Main,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Proc,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  sched_mn;


{ TFrmAssyTrack_ScheduleOnWorkCenter }
class function TFrmAssyTrack_ScheduleOnWorkCenter.DoShowModal(ASndop_Dispatch_ID: Real): Boolean;
begin
  with self.Create(UniGUIApplication.UniApplication) do
  begin
    Sndop_Dispatch_ID:= ASndop_Dispatch_ID;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmAssyTrack_ScheduleOnWorkCenter.SetSndop_Dispatch_ID(
  const Value: Real);
begin
  FSndop_Dispatch_ID:= Value;
end;

procedure TFrmAssyTrack_ScheduleOnWorkCenter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmAssyTrack_ScheduleOnWorkCenter.QryWorkCenterBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('sndop_id').Value := FSndop_ID;
  //   ParamByName('assyline_work_center_id').Value := FAssyLine_Work_Center_ID;
  // end;
  AssignQueryParamValue(DataSet, 'sndop_id', FSndop_ID);
  AssignQueryParamValue(DataSet, 'assyline_work_center_id', FAssyLine_Work_Center_ID);
end;

procedure TFrmAssyTrack_ScheduleOnWorkCenter.UniFormShow(Sender: TObject);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select workorder_id, partno_id, sndop_id from sndop_dispatch where id = %f', [ FSndop_Dispatch_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Invalid sndop_dispatch_id = %.0f', [ FSndop_Dispatch_ID ]));
  FSndop_Dispatch_ID:= FSndop_Dispatch_ID;
  FWorkorder_ID     := A[ 0 ];
  FPartno_ID        := A[ 1 ];
  FSndop_ID         := A[ 2 ];

  // 02-08-2010 ASSY2 only: check if anything is scheduled for that workorder and stick with this assyline
  FAssyLine_Work_Center_ID:= SelectValueFmtAsFloat('select assy1_misc.get_assyline_of_workorder( %f ) from dual', [ FWorkorder_ID ]);

  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);

  Caption:= Format('Finite Schedule Process# %s', [ SelectValueByID('opno', 'sndop', FSndop_ID)]);

  //PostMessage( Handle, iq_Notify, 0, 0 );   {update work centers start/end}
end;

procedure TFrmAssyTrack_ScheduleOnWorkCenter.btnOKClick(Sender: TObject);
begin
  IQAssert( QryWorkCenterID.asFloat > 0, 'Work Center is undefined - operation aborted');

  //DoASSY1AddToScheduleSndop_Dispatch_ID( FSndop_Dispatch_ID, QryWorkCenterID.asFloat );  // sched_mn.pas

  ModalResult:= mrOK;
end;

(*
procedure TFrmAssyTrack_ScheduleOnWorkCenter.IQNotify(var Msg: TMessage);
var
  hMsg: TPanelMesg;
  AIsRecalculated: Boolean;
begin
  AIsRecalculated:= FALSE;
  hMsg:= IQMS.Common.PanelMsg.hPleaseWait('');
  try
    QryWorkCenter.DisableControls;

    while not QryWorkCenter.Eof and (QryWorkCenterID.asFloat > 0) do
    begin
      if (Now - QryWorkCenterDATE_1ST_JOB.asDateTime) * 86400 >= 15 * 60 then  // more than 15 min diff
      begin
        hMsg.Mesg:= Format('Evaluating Work Center %s ...', [ QryWorkCenterEQNO.asString ]);
        Recalc_Center( QryWorkCenterID.asFloat, 0{nSchedID}, 0 {nSeq});   // IQMS.Common.Proc. (stored proc)
        AIsRecalculated:= TRUE;
      end;
      QryWorkCenter.Next;
    end;

    if AIsRecalculated then
       IQMS.Common.Controls.PostMessageToForm( TFrmAssyTrackMain, iq_RefreshDataSets, AssyTrack_Const.cRefreshDataSet_Process, 0 );

  finally
    if AIsRecalculated then
       Reopen(QryWorkCenter)
    else
       QryWorkCenter.First;
    QryWorkCenter.EnableControls;
    hMsg.Free;
  end;
end;
*)

end.


