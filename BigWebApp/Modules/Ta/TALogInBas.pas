unit TALogInBas;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  Buttons,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  IQMS.WebVcl.Hpick,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl;

type
  TFrmLogInBas = class(TUniForm)
    PkEmployee: TIQWebHPick;
    PkEmployeeEMPNO: TStringField;
    PkEmployeeFIRST_NAME: TStringField;
    PkEmployeeMIDDLE_NAME: TStringField;
    PkEmployeeLAST_NAME: TStringField;
    PkEmployeeBADGENO: TStringField;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Panel1: TUniPanel;
    SBSearch: TUniSpeedButton;
    BitBtnOk: TUniSpeedButton;
    Label1: TUniLabel;
    edEmpNo: TUniEdit;
    PkEmployeeID: TBCDField;
    procedure edEmpNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBSearchClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FEmpField :String;
    function DoGetTAEmpNo: String;
    procedure AssignGlobalParams;
  protected
    FId:Real;
    FEmpString, FInvalidNumberMsg:String;
    procedure ProcessINOUT; virtual;
    procedure ResetQuery;virtual;
    procedure CloseQuery;virtual;
    procedure ClearEdits;virtual;
  public
    { Public declarations }
  end;

function LogINTAEmployee:Real;

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.LGMSG2,
  ta_rscstr;
  { TODO : touchscrn not yet converted }
  //touchscrn;

{$R *.dfm}

function LogINTAEmployee:Real;
var
  LFrmLogInBas : TFrmLogInBas;
begin
  LFrmLogInBas := TFrmLogInBas.Create(UniGUIApplication.UniApplication);
  with LFrmLogInBas do
  begin
    ShowModal;
    Result := FId;
  end;
end;


procedure TFrmLogInBas.edEmpNoKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    ProcessINOUT;
    Key:= 0;
  end
end;

procedure TFrmLogInBas.ProcessINOUT;
var
  AName: String;
  ALoginData: Variant;
  ATerdate:TDateTime;
  AStatus, AHide :String;
begin
  ClearEdits;
  FId := 0;
  try
    if edEmpNo.Text = '' then
       edEmpNo.Text := DoGetTAEmpNo;
    if edEmpNo.Visible then edEmpNo.SetFocus;
    if edEmpNo.Text = '' then Exit;
    ALoginData  := SelectValueArrayFmt(FEmpString, [FEmpField, Trim(edEmpNo.Text)]);
    FID      := ALoginData[0];
    AName    := ALoginData[1] + ' ' + ALoginData[2];
    ATerdate := ALoginData[3];
    AStatus  := ALoginData[4];
    AHide    := ALoginData[5];
  except
    on EVariantError do
    begin
      edEmpNo.Text := '';     {Clear the box}
      if edEmpNo.Visible then edEmpNo.SetFocus;
      LrgMsgBox_TA( FInvalidNumberMsg, ta_rscstr.cTXT0000017 {'Error'}, 0 );
      CloseQuery;
      Exit;
    end;
  end;

  if (ATerdate < IQOracleAdjustedDate) or (AStatus = 'INACTIVE') or (AHide = 'Y') then
  begin
    FId := 0;
    LrgMsgBox_TA( ta_rscstr.cTXT0000008 {'Cannot log in.  Inactive or terminated employee'},
                  ta_rscstr.cTXT0000017 {'Error'}, 0 );
    CloseQuery;
    Exit;
  end;
  ResetQuery;
end;

procedure TFrmLogInBas.ResetQuery;
begin
  Close;
end;

procedure TFrmLogInBas.CloseQuery;
begin
//
end;

function TFrmLogInBas.DoGetTAEmpNo: String;
begin
  if not SBSearch.Visible or not SBSearch.Enabled then exit;
  with PkEmployee do
   if Execute then
      begin
        if SelectValueAsString('select NVL(use_emp_badgeno, ''N'') from iqsys where rownum < 2') = 'Y' then
           Result := GetValue('BADGENO')
        else
           Result := GetValue('EMPNO');
      end;
end;

procedure TFrmLogInBas.AssignGlobalParams;
  function _ParamVal(AParamName: String; ADefaultValue: String = 'N'): String;
  begin
    try
       Result := SelectValueFmtAsString('select NVL(%s,''N'') as v_value from iqsys where rownum < 2',[AParamName]);
    except on E:Exception do
     begin
       Result := ADefaultValue;
     end;
    end;
  end;
var
   AUse_Emp_Badgeno,
   AUse_Clock_IO_Masking: Boolean;
begin
  // Get param values
  AUse_Emp_Badgeno := _ParamVal('USE_EMP_BADGENO') = 'Y';

  // Badge Number
  if AUse_Emp_Badgeno then
     begin
       FEmpField := 'BADGENO';
       FInvalidNumberMsg := ta_rscstr.cTXT0000006; // 'Invalid badge number.'
     end
  else
     begin
       FEmpField := 'EMPNO';
       FInvalidNumberMsg := ta_rscstr.cTXT0000007; // 'Invalid employee number.'
     end;
end;


procedure TFrmLogInBas.SBSearchClick(Sender: TObject);
begin
  edEmpNo.Text := '';
  ProcessINOUT;
end;

procedure TFrmLogInBas.UniFormShow(Sender: TObject);
begin
  AssignGlobalParams;
  FEmpString := 'select e.id, e.first_name, e.last_name, ' +
                'NVL(e.termination_date, sysdate + 40000) as termination_date, ' +
                'NVL(s.descrip, ''ACTIVE'') as emp_status, NVL(e.pk_hide, ''N'') as pkhide from pr_emp e, emp_status s ' +
                'where e.%s = LTrim(RTrim(''%s'')) and e.emp_status_id = s.id(+)';
end;

procedure TFrmLogInBas.BitBtnOkClick(Sender: TObject);
begin
  ProcessINOUT;
end;

procedure TFrmLogInBas.ClearEdits;
begin
//
end;


end.
