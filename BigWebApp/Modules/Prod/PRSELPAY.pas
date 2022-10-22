unit PRSelPay;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
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
  uniDBNavigator,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPrSelPayGroup = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    sbSelectAll: TUniSpeedButton;
    sbDeselectAll: TUniSpeedButton;
    tblControl: TFDTable;
    tblControlPR_PAYGROUP_ID: TBCDField;
    tblControlPAYPERIOD_ENDING_DATE: TDateTimeField;
    tblControlWORK_PERIOD_BEGIN: TDateTimeField;
    tblControlWORK_PERIOD_END: TDateTimeField;
    tblControlPAYDATE: TDateTimeField;
    tblControlPayGroup: TStringField;
    SrcControl: TDataSource;
    QryPayGroup: TFDQuery;
    grid: TIQUniGridControl;
    tblControlBANKINFO_DTL_ID: TBCDField;
    edAcct: TUniEdit;
    Label1: TUniLabel;
    PKBankInfo: TIQWebHPick;
    PKBankInfoNAME: TStringField;
    PKBankInfoADDR1: TStringField;
    PKBankInfoADDR2: TStringField;
    PKBankInfoCITY: TStringField;
    PKBankInfoSTATE: TStringField;
    PKBankInfoZIP: TStringField;
    PKBankInfoBANKINFO_DTL_ID: TBCDField;
    PKBankInfoACCOUNT_NUMBER: TStringField;
    PKBankInfoDESCRIPTION: TStringField;
    PKBankInfoLAST_CHECKNO: TBCDField;
    PKBankInfoACCT: TStringField;
    PKBankInfoGLACCT_ID_CASH: TBCDField;
    tblControlID: TBCDField;
    tblControlGLPERIODS_ID_PR: TBCDField;
    tblControlPR_TYPE: TStringField;
    SR: TIQWebSecurityRegister;
    IQAbout1: TIQWebAbout;
    tblBankInfoDtl: TFDTable;
    tblControlCashAccount: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    tblControlPRENOTE: TStringField;
    procedure sbDeselectAllClick(Sender: TObject);
    procedure sbSelectAllClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure tblControlFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    ABankInfoDtlId:Real;
    function GetReportName(AIDS:String):String;
    function GetReportNameDD(AIDS:String):String;
  public
    { Public declarations }
  end;

function PRSelectPayGroups:Boolean;

implementation
uses
  IQMS.Common.DataLib,
  PRPrintC,
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns, }
  PRShare,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  IQMS.WebVcl.SecurityManager;
{$R *.DFM}

function PRSelectPayGroups:Boolean;
begin
  with TFrmPrSelPayGroup.Create(uniGUIApplication.UniApplication) do
  try
    ShowModal;
    Result := ModalResult = mrOk;
  finally
    free;
  end;
end;

procedure TFrmPrSelPayGroup.sbDeselectAllClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'UnSelectAll'
  grid.UnSelectAll; }
end;

procedure TFrmPrSelPayGroup.sbSelectAllClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectAll'
  grid.SelectAll; }
end;

procedure TFrmPrSelPayGroup.btnOkClick(Sender: TObject);
var
  i:integer;
  AIDs:string;
  AReport, AReportDD:String;
  ABankId:Real;
begin
  AIDs := '';
//  if ABankInfoDtlId = 0 then
//    raise Exception.Create('No bank account assigned, cannot continue.');
  (*TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedList'
  if grid.SelectedList.Count = 0 then
    raise Exception.Create('No paygroups selected, cannot continue.');
   with grid, grid.datasource.dataset do
   begin
     for i:= 0 to SelectedList.Count-1 do
     begin
       GotoBookmark(SelectedList.items[i]);
       if SelectValueFmtAsFloat('select payroll_misc.CheckValidGlAccounts(%f) from dual', [FieldByName('ID').asFloat]) = 1 then
//       if SelectValueFmtAsFloat('select count(t.id) from pr_prepost_taxes t, pr_prepost_employee e where t.pr_prepost_employee_id = e.id ' +
//                    ' and e.pr_prepost_control_id = %f and t.glacct_id is null', [FieldByName('ID').asFloat]) <> 0 then
        raise Exception.Create('One or more checks is missing a GL Account.  Please correct and try again.');

//       ExecuteCommandFmt('update PR_PREPOST_CONTROL set bankinfo_dtl_id = %f where id = %f',
//              [ABankInfoDtlId, FieldByName('ID').asFloat]);
       AIDs := IntToStr(TRunc(FieldByName('ID').asFloat)) + ', ' + AIDs;
       ABankId := FieldByname('BANKINFO_DTL_ID').asFloat;
     end;
     Refresh;
     AIDs := Format('(%s)', [Copy(AIDs, 1, Length(AIDs) - 2)]);
     if SelectValueFmtAsFloat('select count(distinct BANKINFO_DTL_ID) from pr_prepost_control ' +
        'where id in %s', [AIDs]) <> 1 then
       raise Exception.Create('Cash account not assigned or control records with different cash accounts were selected, cannot continue');

     AReport := GetReportName(AIDS);
     AReportDD := GetReportNameDD(AIDS);
     PrintPRChecks(self, AIDs, ABankId, AReport, AReportDD);     {in PRPrintC.pas}
//     PrintPRChecks(self, AIDs, ABankInfoDtlId, AReport);     {in PRPrintC.pas}
     ModalResult := mrOk;
     Close;
   end;    *)
end;

function TFrmPrSelPayGroup.GetReportName(AIDS:String):String;
var
  i:Integer;
begin
  i := Trunc(SelectValueFmtAsFloat('select count(rpt) from (select distinct paycheck_rpt as rpt ' +
                                         'from pr_paygroup p, ' +
                                               'pr_prepost_control c ' +
                                        'where c.pr_paygroup_id = p.id ' +
                                          'and c.id in %s)', [AIDS]));
  if i = 1 then
    Result :=  SelectValueFmtAsString('select distinct paycheck_rpt as rpt ' +
                              'from pr_paygroup p, ' +
                              'pr_prepost_control c ' +
                              'where c.pr_paygroup_id = p.id ' +
                              'and c.id in %s', [AIDS])
  else Result := SelectValueAsString('select pr_check_repname from iqsys');
  if Trim(Result) = '' then
    raise Exception.Create('No reports assigned, cannot print checks');
end;

function TFrmPrSelPayGroup.GetReportNameDD(AIDS:String):String;
var
  i:Integer;
begin
  i := Trunc(SelectValueFmtAsFloat('select count(rpt) from (select distinct paycheck_rpt as rpt ' +
                                         'from pr_paygroup p, ' +
                                               'pr_prepost_control c ' +
                                        'where c.pr_paygroup_id = p.id ' +
                                          'and c.id in %s)', [AIDS]));
  if i = 1 then
    Result :=  SelectValueFmtAsString('select distinct dd_rpt as rpt ' +
                              'from pr_paygroup p, ' +
                              'pr_prepost_control c ' +
                              'where c.pr_paygroup_id = p.id ' +
                              'and c.id in %s', [AIDS])
  else Result := SelectValueAsString('select PR_DD_REPNAME from iqsys');
  if Trim(Result) = '' then
    raise Exception.Create('No DD reports assigned, cannot print checks');
end;



procedure TFrmPrSelPayGroup.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );  }
end;

procedure TFrmPrSelPayGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
end;

procedure TFrmPrSelPayGroup.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrSelPayGroup.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPrSelPayGroup.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_RV{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPrSelPayGroup.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 9987 );
//  IQHelp.HelpContext( 1005234 );
end;

procedure TFrmPrSelPayGroup.tblControlFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
var
  AEplantId:Real;
begin
//  PR_TYPE<>'PRIOR' AND PR_TYPE<>'MANUAL'

  Accept := (DataSet.FieldByName('PR_TYPE').asString <> 'PRIOR') AND (DataSet.FieldByName('PR_TYPE').asString <> 'MANUAL')AND (DataSet.FieldByName('PRENOTE').asString <> 'Y');

  if not Accept then exit;

  if SecurityManager.EPlantsExist then
  begin
    if SecurityManager.EPlant_ID <> 'NULL' then
    begin
      AEplantId := SelectValueFmtAsFloat('select eplant_id from pr_paygroup where id = %f', [DataSet.FieldByName('pr_paygroup_Id').AsFloat]);
      Accept := AEplantId = StrToFloat(SecurityManager.EPlant_ID)
    end
    else
      Accept := True;
  end
  else Accept := True;
end;

procedure TFrmPrSelPayGroup.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, grid]);
//  CreateComponentsList(self, 'c:\out\');
  IQSetTablesActive( TRUE, self );
  if SelectValueAsFloat('select count(distinct BANKINFO_DTL_ID) from pr_prepost_control') = 1 then
    sbSelectAll.Click;
//  ABankInfoDtlId := 0;
//  ABankInfoDtlId := tblControl.FieldByName('BANKINFO_DTL_ID').asFloat;
//  edAcct.Text := SelectValueFmtAsString('select account_number from bankinfo_dtl where id = %f',
//                              [ABankInfoDtlId]);

  tblControl.Filter := Format('(PR_TYPE<>''PRIOR'' AND PR_TYPE<>''MANUAL'') AND (%s)', [GetPayGroupFilter]); {in PRShare.pas}
end;

end.
