unit PRDedUpd;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmPrDeductUpdate = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnCancel: TUniButton;
    btnApply: TUniButton;
    cbCeiling: TUniCheckBox;
    cbAmount: TUniCheckBox;
    cbPercentage: TUniCheckBox;
    cbBack: TUniCheckBox;
    cbSeq: TUniCheckBox;
    cbBasedOn: TUniCheckBox;
    cbNottoexceed: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations}
    FID:Real;
  public
    { Public declarations }
  end;

procedure DoUpdateDefaultDeductions(AID:Real);

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.HelpHook,
  IQMS.Common.NLS;

procedure DoUpdateDefaultDeductions(AID:Real);
var
  frm : TFrmPrDeductUpdate;
begin
  frm := TFrmPrDeductUpdate.Create(uniGUIApplication.UniApplication);
  frm.FID := AID;
  if frm.FID = 0 then
     frm.Helpcontext := 1004481
  else
    frm.Helpcontext :=999164;
  frm.ShowModal;
end;

procedure TFrmPrDeductUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmPrDeductUpdate.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmPrDeductUpdate.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrDeductUpdate.btnApplyClick(Sender: TObject);
var
  ASql1, ASql2, AIdStr : String;
begin
  AIDStr := '';
  if FID <> 0 then AIdStr := IQFormat(' and a.pr_deduction_id = %f ', [FID]);
  ASql1 := 'update (select a.%s as target, b.%s as source from ' +
                  'pr_emp_deductions a, pr_deduction b where a.pr_deduction_id = b.id ' + AIDStr +
                  ') set target = source';

  ASql2 := 'update (select a.%s as target, b.%s as source from ' +
                  'pr_deduction_match a, pr_deduction b where a.pr_deduction_id = b.id ' + AIDStr +
                  ') set target = source';

  if cbCeiling.Checked then
    ExecuteCommandFmt(ASql1, ['CEILING', 'DEFAULT_CEILING']);
//  if cbPCeiling.Checked then
//    ExecuteCommandFmt(ASql2, ['PERCENT_CEILING', 'DEFAULT_PERCENT_CEILING']);
  if cbAmount.Checked then
    ExecuteCommandFmt(ASql1, ['FLAT_AMOUNT', 'DEFAULT_AMOUNT']);
  if cbPercentage.Checked then
    ExecuteCommandFmt(ASql1, ['PERCENTAGE', 'DEFAULT_PERCENTAGE']);
  if cbBack.Checked then
    ExecuteCommandFmt(ASql1, ['BACK_DED_MULT', 'DEFAULT_BACK_DED_MULT']);
  if cbSeq.Checked then
    ExecuteCommandFmt(ASql1, ['SEQ', 'DEFAULT_SEQ']);
  if cbBasedOn.Checked then
    ExecuteCommandFmt(ASql1, ['BASED_ON_NET_PAY', 'BASED_ON_NET_PAY']);
  if cbNottoexceed.Checked then
    ExecuteCommandFmt(ASql1, ['CEILING_PERCENTAGE', 'CEILING_PERCENTAGE']);
  IqConfirm('Update Completed.');
  Close;
end;

procedure TFrmPrDeductUpdate.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_DE{HTM} )  {IQMS.Common.HelpHook.pas}
end;

end.
