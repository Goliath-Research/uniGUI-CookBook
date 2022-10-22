unit AssyTrack_ConfirmDel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  MainModule,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniImage;

type
  TFrmAssyTrackConfirmDelete = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    chkDelete: TUniCheckBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Bevel3: TUniPanel;
    Panel5: TUniPanel;
    SR: TIQWebSecurityRegister;
    Image1: TUniImage;
    Bevel4: TUniPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FWorkorder_ID: Real;
    procedure DoFinalAssembyQtyCheck;
    procedure CreateSilentHist_Illum_RT;
    procedure SetWorkorder_ID(const Value: Real);
  public
    { Public declarations }
    class function DoShowModal(AWorkorder_ID: Real): Boolean;
    class procedure DoExecuteSilent(AWorkorder_ID: Real);
    property Workorder_ID: Real write SetWorkorder_ID;
  end;

implementation

uses
  //WEB_CONVERT assy_share,
  //WEB_CONVERT AssyTrack_CheckFinalAssyQty,
  EdiConfDel,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  //WEB_CONVERT IQSecIns,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.MfgShare,
  ProdAdd;
  //WEB_CONVERT wo_chk_assy_pit_pending,
  //WEB_CONVERT wo_chk_jobshop2,
  //WEB_CONVERT wo_conf_del,
  //WEB_CONVERT wo_dm;

{$R *.dfm}


{ TFrmAssyTrackConfirmDelete }

class function TFrmAssyTrackConfirmDelete.DoShowModal(AWorkorder_ID: Real): Boolean;
begin
  with self.Create( UniGuiApplication.UniApplication ) do
  begin
    Workorder_ID:= AWorkorder_ID;
    Result:= ShowModal = mrOK;
  end;
end;

class procedure TFrmAssyTrackConfirmDelete.DoExecuteSilent(AWorkorder_ID: Real);
begin
  with self.Create(UniGuiApplication.UniApplication) do
  begin
    Workorder_ID:= AWorkorder_ID;
    chkDelete.Checked:= FALSE;
    btnOK.Click;
  end;
end;

procedure TFrmAssyTrackConfirmDelete.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID:= Value;
end;

procedure TFrmAssyTrackConfirmDelete.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  Caption:= Format('Confirmation required [WO# %.0f]', [ FWorkorder_ID ]);

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'EnsureSecurityInspectorOnTopOf'
  EnsureSecurityInspectorOnTopOf( self );}
end;

procedure TFrmAssyTrackConfirmDelete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmAssyTrackConfirmDelete.btnOKClick(Sender: TObject);
label end_of_proc;
var
  ADeleteArchiveMode: TConfrimDeleteArchive;
  AValue: Boolean;
begin
  // 04-07-2015 EIQ-6681 AssyTrack - Security - FrmProdManual security required to delete work orders
  AValue:= SecurityManager.HasUnrestrictedAccess;
  SecurityManager.HasUnrestrictedAccess:= TRUE;
  try
    CreateSilentHist_Illum_RT;
  finally
    SecurityManager.HasUnrestrictedAccess:= AValue;
  end;

  {02-24-2014 move to hist_sndop_dispatch and delete from sndop_dispatch}
  if not chkDelete.Checked then
  begin
    ExecuteCommandFmt('begin assy1_misc.remove_from_sndop_dispatch( %f, TRUE ); end;',
               [ FWorkorder_ID ]);   // workorder_id
               // IQString.BoolToStr( assy_share.WorkorderLinkedToJobShop( FWorkorder_ID )) ]);  // archive
    goto end_of_proc;
  end;

  // check total qty against final assy
  DoFinalAssembyQtyCheck;

  { TODO -oBantuK -cWEB_CONVERT : To many compile time errors.
  // check all records posted in PIT
  wo_chk_assy_pit_pending.CheckAssyPendingProcessingInPIT( FWorkorder_ID );

  // check jobshop
  wo_chk_jobshop2.CheckWorkorderInJobshop2( FWorkorder_ID );

  ADeleteArchiveMode:= TFrmWOConfDel.DoShowModal( FWorkorder_ID );  // wo_conf_del.pas
  if ADeleteArchiveMode = daNone then
     ABORT;
  try
    // ExecuteCommandFmt('delete from workorder where id = %f', [ FWorkorder_ID ]);
    TWoDm.DeleteWorkorder( FWorkorder_ID, ADeleteArchiveMode = daDeleteArchive );
  except on E: Exception do
    raise Exception.CreateFmt('Failed to delete WO# %.0f from the system. Error: %s', [ FWorkorder_ID, E.Message ]);
  end;
  }

  end_of_proc:
  ModalResult:= mrOK;
end;

procedure  TFrmAssyTrackConfirmDelete.DoFinalAssembyQtyCheck;
var
  AMfgType: string;
  ALookupMfgType: string;
begin
  AMfgType:= SelectValueFmtAsString('select s.mfg_type from workorder w, standard s where w.id = %f and w.standard_id = s.id', [ FWorkorder_ID ]);
  ALookupMfgType:= IQMS.Common.MfgShare.lookup_mfgtype( AMfgType );

  { TODO -oBantuK -cWEB_CONVERT : assy_share not yet converted.
  if  not ((ALookupMfgType = 'ASSY3') and not assy_share.IsAssy3BackflushEachProcess( AMfgType )) then
      TFrmAssyTrackFinalAssembyQtyCheck.DoShowModal( FWorkorder_ID, SelectValueFmtAsFloat('select partno_id from ptorder where workorder_id = %f', [ FWorkorder_ID ]));  // grab first partno. AssyTrack_CheckFinalAssyQty.pas}
end;


procedure TFrmAssyTrackConfirmDelete.CreateSilentHist_Illum_RT;
var
  AParams: TManualProdParams; // declared in ProdAdd.pas
  AArcustoID: Real;
  AHist_Illum_RT_ID: Real;
begin
  AArcustoID:= SelectValueByID('arcusto_id', 'workorder', FWorkOrder_ID);
  AParams:= TManualProdParams.Create( FWorkOrder_ID );

  // Fill params
  AParams.Custno     := SelectValueFmtAsString('select custno from arcusto where id = %.0f',[AArcustoID]);
  AParams.DayProd_ID := 0;
  AParams.Eqno       := '';
  AParams.MfgCell    := '';
  AParams.OrderNo    := '';
  AParams.ProdDate   := SelectValueAsFloat('select prod_date from params');
  AParams.Shift      := Trunc(SelectValueAsFloat('select prod_shift from params'));
  AParams.Standard_ID:= SelectValueByID('standard_id', 'workorder', FWorkOrder_ID);
  AParams.Arinvt_ID  := SelectValueFmtAsFloat('select arinvt_id from v_workorder_partno where workorder_id = %f', [ FWorkOrder_ID ]);

  DoAppendSilentHist_Illum_RT( self, AParams, AHist_Illum_RT_ID );   // ProdAdd.pas

  ExecuteCommandFmt('update hist_illum_rt                                                     '+
            '   set setup_time = (select assy_run_date from workorder where id = %f), '+
            '       actual_end_time = sysdate                                         '+
            ' where id = %f                                                           ',
            [ FWorkorder_ID, AHist_Illum_RT_ID ]);

  ExecuteCommandFmt('update hist_illum_part set reconcile_wo = ''Y'' where hist_illum_rt_id = %f',
            [ AHist_Illum_RT_ID ]);
end;


end.
