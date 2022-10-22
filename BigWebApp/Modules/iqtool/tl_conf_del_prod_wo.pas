unit tl_conf_del_prod_wo;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmTlConfDelProdWo = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    lblPrompt: TUniLabel;
    PnlCheckBox: TUniPanel;
    chkDeleteFromSystem: TUniCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
      { Private declarations }
      FWorkOrderID: Real;
      procedure ProcessExec;
    procedure CheckDeleteWorkorder;
    public
      { Public declarations }
      class function DoShowModal( AWorkOrderID: Real ): Boolean;
      property WorkOrderID: Real read FWorkOrderID;
  end;

function CheckDeleteProductionWorkOrder(AWorkOrderID: Real): Boolean;

var
  FrmTlConfDelProdWo: TFrmTlConfDelProdWo;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
//  iqsecins,
  iqtool_rscstr;

function CheckDeleteProductionWorkOrder(AWorkOrderID: Real): Boolean;
begin
  Result :=TFrmTlConfDelProdWo.DoShowModal(AWorkOrderID);
end;

{ TFrmTlConfDelProdWo }

class function TFrmTlConfDelProdWo.DoShowModal(AWorkOrderID: Real): Boolean;
var
  frm : TFrmTlConfDelProdWo;
begin
   frm := TFrmTlConfDelProdWo.Create(uniGUIApplication.UniApplication);

   frm.FWorkOrderID      := AWorkOrderID;
   frm.lblPrompt.Caption := iqtool_rscstr.cTXT0000234;
   Result := frm.ShowModal = mrOk;
end;

procedure TFrmTlConfDelProdWo.FormShow(Sender: TObject);
begin
  //EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmTlConfDelProdWo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTlConfDelProdWo.btnOkClick(Sender: TObject);
begin
  ProcessExec;
  ModalResult := mrOk;
end;

procedure TFrmTlConfDelProdWo.ProcessExec;
begin
  if chkDeleteFromSystem.Checked then
    // Delete
    CheckDeleteWorkorder
  else
    // Unlink
    ExecuteCommandFmt('UPDATE workorder SET tool_task_information_id = NULL ' +
      'WHERE id = %.0f', [FWorkOrderID])
end;

procedure TFrmTlConfDelProdWo.CheckDeleteWorkorder;
var
  AEqNo: string;
begin
  // check wo is running
  AEqNo := Trim(SelectValueFmtAsString('select c.eqno from v_running_wo_all w, ' +
    'work_center c where w.workorder_id = %f and w.work_center_id = c.id',
    [FWorkOrderID]));
  // iqtool_rscstr.cTXT0000235 =
  // 'Work order # %.0f is currently running on work center ' +
  // '''%s''. Cannot delete the work order.';
  IQAssert(AEqNo = '', Format(iqtool_rscstr.cTXT0000235,
    [FWorkOrderID, AEqNo]));

  try
    // delete work order
    ExecuteCommandFmt(
      'declare                                                           ' +
      '  v_workorder_id number::= %f;                                    ' +
      'begin                                                             ' +
      '  delete from cntr_sched where workorder_id = v_workorder_id;     ' +
      '  delete from ptorder where workorder_id = v_workorder_id;        ' +
      '  delete from workorder where id = v_workorder_id;                ' +
      '  delete from wo_depend where workorder_id = v_workorder_id;      ' +
      '  delete from wo_depend_flat where workorder_id = v_workorder_id; ' +
      'end;                                                              ',
      [FWorkOrderID]);
  except
    on E: Exception do
      raise Exception.CreateFmt
        ('Failed to delete work order # %.0f from the system. Error: %s',
        [FWorkOrderID, E.Message]);
  end;
end;

end.
