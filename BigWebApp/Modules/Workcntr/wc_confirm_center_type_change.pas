unit wc_confirm_center_type_change;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmWorkCenterConfirmCenterTypeChange = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnAbort: TUniButton;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    edBOMsCount: TUniEdit;
    Label2: TUniLabel;
    edProcCount: TUniEdit;
    chkUpdateAffected: TUniCheckBox;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FBOMCount: Real;
    FProcCount: Real;
    procedure SetBOMCount(const Value: Real);
    procedure SetProcCount(const Value: Real);
  public
    { Public declarations }
    property BOMCount: Real write SetBOMCount;
    property ProcCount: Real write SetProcCount;
    class function DoShowModal(AWork_Center_ID: Real; AOldCntrType, ANewCntrType: string): Integer;
    //0-abort, 1-continue, 2-continue and update boms/processes
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Numbers,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  IQMS.Common.StringUtils;


class function TFrmWorkCenterConfirmCenterTypeChange.DoShowModal(AWork_Center_ID: Real; AOldCntrType, ANewCntrType: string): Integer;
//0-abort, 1-continue, 2-continue and update boms/processes
var
  ABOMsCount: Real;
  AProcCount: Real;
  AEPlant_ID: Real;
  frm: TFrmWorkCenterConfirmCenterTypeChange;
begin
{ ANewCntrType not used !}
  result := 0;


  AEPlant_ID := SelectValueByID('eplant_id', 'work_center', AWork_Center_ID);
  ABOMsCount := SelectValueFmtAsFloat(
    'select count(*) from standard where rtrim(cntr_type) = ''%s'' and nvl(eplant_id, 0) = %f',
    [FixStr(Trim(AOldCntrType)), AEPlant_ID]);
  AProcCount := SelectValueFmtAsFloat(
    'select count(*) from sndop where rtrim(cntr_type) = ''%s'' and nvl(eplant_id, 0) = %f',
    [FixStr(Trim(AOldCntrType)), AEPlant_ID]);

  if (ABOMsCount = 0) and (AProcCount = 0) then
    EXIT;

  frm := TFrmWorkCenterConfirmCenterTypeChange.Create(uniGUIApplication.UniApplication);
  frm.BOMCount := ABOMsCount;
  frm.ProcCount := AProcCount;


  if (frm.ShowModal = mrOK) then
    Result := iIIf(frm.chkUpdateAffected.Checked, 2, 1)
  else
    Result := 0;

end;

procedure TFrmWorkCenterConfirmCenterTypeChange.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self, chkUpdateAffected]);
end;

procedure TFrmWorkCenterConfirmCenterTypeChange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, chkUpdateAffected]);
end;

procedure TFrmWorkCenterConfirmCenterTypeChange.FormShow(Sender: TObject);
begin
  edBOMsCount.Text := FloatToStr(FBOMCount);
  edProcCount.Text := FloatToStr(FProcCount);

  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf(self); //IQSecIns.pas
end;

procedure TFrmWorkCenterConfirmCenterTypeChange.SetBOMCount(const Value: Real);
begin
  FBOMCount := Value;
end;

procedure TFrmWorkCenterConfirmCenterTypeChange.SetProcCount(const Value: Real);
begin
  FProcCount := Value;
end;


end.
