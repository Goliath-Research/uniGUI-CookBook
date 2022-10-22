unit AssyTrack_Schedule_WO_OnWorkCenter;

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
  //WEB_CONVERT IQMS.Common.UserMessages,
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
  TFrmAssyTrack_Schedule_WO_OnWorkCenter = class(TUniForm)
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
    QryWorkCenterDATE_1ST_JOB: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkorder_ID     : Real;
    FPartno_ID        : Real;
    FSndop_ID         : Real;
    FSndop_Dispatch_ID: Real;
    procedure SetSndop_Dispatch_ID(const Value: Real);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;}

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

procedure TFrmAssyTrack_Schedule_WO_OnWorkCenter.SetSndop_Dispatch_ID(
  const Value: Real);
begin
  FSndop_Dispatch_ID:= Value;
end;


class function TFrmAssyTrack_Schedule_WO_OnWorkCenter.DoShowModal(ASndop_Dispatch_ID: Real): Boolean;
begin
  with self.Create(UniGUIApplication.UniApplication) do
  begin
    Sndop_Dispatch_ID:= ASndop_Dispatch_ID;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmAssyTrack_Schedule_WO_OnWorkCenter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmAssyTrack_Schedule_WO_OnWorkCenter.UniFormShow(Sender: TObject);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select workorder_id, partno_id, sndop_id from sndop_dispatch where id = %f', [ FSndop_Dispatch_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Invalid sndop_dispatch_id = %.0f', [ FSndop_Dispatch_ID ]));
  FSndop_Dispatch_ID:= FSndop_Dispatch_ID;
  FWorkorder_ID     := A[ 0 ];
  FPartno_ID        := A[ 1 ];
  FSndop_ID         := A[ 2 ];


  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
  PostMessage( Handle, iq_Notify, 0, 0 );}   {update work centers start/end}
end;

procedure TFrmAssyTrack_Schedule_WO_OnWorkCenter.btnOKClick(Sender: TObject);
begin
  IQAssert( QryWorkCenterID.asFloat > 0, 'Work Center is undefined - operation aborted');

  DoAddWorkorderToSchedule( FWorkorder_ID, QryWorkCenterID.asFloat );   // sched_mn.pas

  ModalResult:= mrOK;
end;

(* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
procedure TFrmAssyTrack_Schedule_WO_OnWorkCenter.IQNotify(var Msg: TMessage);
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


