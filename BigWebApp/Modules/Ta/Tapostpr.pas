unit TAPostPR;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Spin,
  ComCtrls,
  Buttons,
  ExtCtrls,
  Db,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

const cSql = 'select l.pr_emp_id,                      ' +
             '       p.pr_paytype_id,                  ' +
             '       p.comment1,                       ' +
             '       l.prod_date,                      ' +
             '       Sum(p.tot_hours) as tot_hours     ' +
             ' from ta_prepost_paytype p,              ' +
             '      ta_prepost_log l,                  ' +
             '      pr_emp e                           ' +
             ' where p.ta_prepost_log_id = l.id        ' +
             '   and l.pr_emp_id = e.id                ';

const cSqlSum = 'select l.pr_emp_id,                      ' +
                 '       p.pr_paytype_id,                  ' +
                 '       Sum(p.tot_hours) as tot_hours     ' +
                 ' from ta_prepost_paytype p,              ' +
                 '      ta_prepost_log l,                  ' +
                 '      pr_emp e                           ' +
                 ' where p.ta_prepost_log_id = l.id        ' +
                 '   and l.pr_emp_id = e.id                ';


const cSql2 = 'select i.clock_in_out_id                ' +
             ' from ta_prepost_log l,                  ' +
             '      ta_prepost_io i,                   ' +
             '      pr_emp e                           ' +
             ' where l.pr_emp_id = e.id                ' +
             '   and i.ta_prepost_log_id = l.id        ';

const cSql3 = 'select l.id                             ' +
             ' from ta_prepost_log l,                  ' +
             '      pr_emp e                           ' +
             ' where l.pr_emp_id = e.id                ';

const cGroupBy    = ' group by l.pr_emp_id, l.prod_date, p.pr_paytype_id, p.comment1   ';
const cGroupBySum = ' group by l.pr_emp_id, p.pr_paytype_id   ';

type
  TFrmTAPostPayroll = class(TUniForm)
    Panel4: TUniPanel;
    SbEmp: TUniSpeedButton;
    SbDept: TUniSpeedButton;
    sbAll: TUniSpeedButton;
    StatusBar1: TUniStatusBar;
    PkShift: TIQWebHPick;
    PkShiftID: TBCDField;
    PkShiftDESCRIP: TStringField;
    PkDept: TIQWebHPick;
    PkDeptID: TBCDField;
    PkDeptDESCRIPTION: TStringField;
    SR: TIQWebSecurityRegister;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    dtDate: TUniDateTimePicker;
    lblTimeCardDate: TUniLabel;
    Panel1: TUniPanel;
    RBIncremental: TUniRadioButton;
    RBSummary: TUniRadioButton;
    procedure SbEmpClick(Sender: TObject);
    procedure sbAllClick(Sender: TObject);
    procedure SbDeptClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RBIncrementalClick(Sender: TObject);
    procedure RBSummaryClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FQry:TFDQuery;
    procedure ProcessSelectedEmployees;
    procedure UpdateStatusbar(AStr:String; ATag:integer);
    procedure InsertTimeCard(AEmpId, APaytypeId, ATotHours:Real; AProdDate:TDateTime; AComment:String = '');
    procedure SetControlIDList(const Value: String);
  public
    { Public declarations }
    FControlIDList:String;
    FEmplList:TStringList;
    FDeptId:Real;
    property ControlIDList : String write SetControlIDList;
  end;

procedure DoTAPostPR(AControlIDList:String);

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  iqsecins,  }
  ta_rscstr,
  taemppr;

procedure DoTAPostPR(AControlIDList:String);
var
  LFrmTAPostPayroll : TFrmTAPostPayroll;
begin
  LFrmTAPostPayroll := TFrmTAPostPayroll.Create(UniGUIApplication.UniApplication);
  LFrmTAPostPayroll.ControlIDList := AControlIDList;
  LFrmTAPostPayroll.ShowModal;
end;

procedure TFrmTAPostPayroll.SbEmpClick(Sender: TObject);
var
  aSel:Integer;
begin
  FEmplList.Clear;
  aSel := DoTAEmpPR(); {in TAEmpPR.pas}
  if aSel = 0 then
    sbAllClick(nil)
  else
    UpdateStatusbar(Format(ta_rscstr.cTXT0000085{'%d employees selected'}, [ASel]), 1);
end;

procedure TFrmTAPostPayroll.SetControlIDList(const Value: String);
begin
  FControlIDList := Value;
end;

procedure TFrmTAPostPayroll.sbAllClick(Sender: TObject);
begin
  UpdateStatusbar(ta_rscstr.cTXT0000086{'All employees selected'}, 4);
end;

procedure TFrmTAPostPayroll.SbDeptClick(Sender: TObject);
begin
  with PkDept do
  if execute then
  begin
    FDeptId := GetValue('ID');
    UpdateStatusbar(Format(ta_rscstr.cTXT0000089{'%s department selected'},
     [GetValue('DESCRIPTION')]), 3);
  end
end;

procedure TFrmTAPostPayroll.UniFormCreate(Sender: TObject);
begin
//  CreateComponentsList(self, 'c:\iqwin\CompList\');

  FEmplList := TStringList.Create;
  dtDate.DateTime := Date;
  RBIncrementalClick(nil);
end;

procedure TFrmTAPostPayroll.UpdateStatusbar(AStr:String; ATag:integer);
begin
{ TODO -oGPatil -cWebConvert : TUniStatusBar does not contain a member named SimpleText
  StatusBar1.SimpleText := AStr;  }
  StatusBar1.Tag := ATag;
  StatusBar1.Update;
end;

procedure TFrmTAPostPayroll.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTAPostPayroll.BtnOkClick(Sender: TObject);
var
  ASql:String;
  ASql1, AGroupBy:String;
begin
  if StatusBar1.Tag = 1 then                 //  Selected employees
  begin
    ProcessSelectedEmployees;
  end
  else
  begin
    FQry := TFDQuery.Create(self);
    with FQry do
    try
      Connection := UniMainModule.FDConnection1;
      if RBIncremental.Checked then
      begin
        ASql1    := cSql;
        AGroupBy := cGroupBy;
      end
      else
      begin
        ASql1    := cSqlSum;
        AGroupBy := cGroupBySum;
      end;
      Sql.Add(Format(ASql1 + ' and l.ta_prepost_control_id in %s ', [FControlIDList]));
      if StatusBar1.Tag = 3 then                 //  Selected departments
        Sql.Add(IQFormat(' and e.pr_department_id = %f ', [FDeptId]));
      Sql.Add(AGroupBy);
      Open;
      while not eof do
      begin
        if RBIncremental.Checked then
          InsertTimeCard(FieldByName('PR_EMP_ID').asFloat,
                         FieldByName('pr_paytype_id').asFloat,
                         FieldByName('tot_hours').asFloat,
                         FieldByName('prod_date').asDateTime,
                         FieldByName('comment1').asString)
        else
          InsertTimeCard(FieldByName('PR_EMP_ID').asFloat,
                         FieldByName('pr_paytype_id').asFloat,
                         FieldByName('tot_hours').asFloat,
                         dtDate.Datetime);
        Next;
      end;

      ASql := Format(cSql2 + ' and l.ta_prepost_control_id in %s ', [FControlIDList]);
      if StatusBar1.Tag = 3 then                 //  Selected departments
        ASql := IQFormat(ASql + ' and e.pr_department_id = %f ', [FDeptId]);

      ASql := Format('update clock_in_out set processed = ''Y'' where id in (%s)', [ASql]);
      ExecuteCommand(ASql);


      ASql := 'update ta_emp_calendar set processed = ''Y'' ' +
                     ' where id in (select v.ta_emp_calendar_id from v_ta_prepost_combined v, ta_prepost_log t, pr_emp p ' +
                                       ' where v.ta_prepost_log_id = t.id and v.pr_emp_id = p.id ';


      if StatusBar1.Tag = 3 then                 //  Selected departments
        ASql := IQFormat(ASql + ' and p.pr_department_id = %f ', [FDeptId]);

      ASql := IQFormat(ASql + ' and t.ta_prepost_control_id in %s)', [FControlIDList]);

      ExecuteCommand(ASql);

      ASql := Format(cSql3 + ' and l.ta_prepost_control_id in %s ', [FControlIDList]);
      if StatusBar1.Tag = 3 then                 //  Selected departments
        ASql := IQFormat(ASql + ' and e.pr_department_id = %f ', [FDeptId]);

      ExecuteCommandFmt('begin for v in (select To_Char(l.id) as id from ta_prepost_log l where id in (%s)) ' +
                ' loop ta_misc.Archive_ta_prepost_log(v.id); end loop; end;', [ASql]);
      ExecuteCommandFmt('delete from ta_prepost_log where id in (%s)', [ASql]);
    finally
      Free;
    end;
  end;
  Close;
end;

procedure TFrmTAPostPayroll.ProcessSelectedEmployees;
var
  i:integer;
begin
  for i := 0 to FEmplList.Count - 1 do
  begin
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      if RBIncremental.Checked then
        Sql.Add(Format('select p.pr_paytype_id, l.prod_date, p.comment1, ' +
                       '       Sum(p.tot_hours) as tot_hours  ' +
                       ' from ta_prepost_paytype p,           ' +
                       '      ta_prepost_log l                ' +
                       ' where p.ta_prepost_log_id = l.id     ' +
                       '   and l.pr_emp_id = ''%s''           ' +
                       ' and l.ta_prepost_control_id in %s    ' +
                       '  group by l.prod_date, pr_paytype_id, p.comment1 ', [FEmplList[i], FControlIDList]))
      else
        Sql.Add(Format('select p.pr_paytype_id,               ' +
                       '       Sum(p.tot_hours) as tot_hours  ' +
                       ' from ta_prepost_paytype p,           ' +
                       '      ta_prepost_log l                ' +
                       ' where p.ta_prepost_log_id = l.id     ' +
                       '   and l.pr_emp_id = ''%s''           ' +
                       ' and l.ta_prepost_control_id in %s    ' +
                       '  group by pr_paytype_id              ', [FEmplList[i], FControlIDList]));

       Open;
       while not eof do
       begin
         if RBIncremental.Checked then
           InsertTimeCard(StrToFloat(FEmplList[i]),
                          FieldByName('pr_paytype_id').asFloat,
                          FieldByName('tot_hours').asFloat,
                          FieldByName('prod_date').asDateTime,
                          FieldByName('comment1').asString)
         else
           InsertTimeCard(StrToFloat(FEmplList[i]),
                          FieldByName('pr_paytype_id').asFloat,
                          FieldByName('tot_hours').asFloat,
                          dtDate.Datetime);
         Next;
       end;
       ExecuteCommandFmt('update clock_in_out set processed = ''Y'' where id in ' +
                 '(select i.clock_in_out_id from ta_prepost_io i, ta_prepost_log l ' +
                 'where i.ta_prepost_log_id = l.id and ' +
                 'l.ta_prepost_control_id in %s and l.pr_emp_id = ''%s'')', [FControlIDList, FEmplList[i]]);


      ExecuteCommandFmt('update ta_emp_calendar set processed = ''Y'' ' +
                     ' where id in (select v.ta_emp_calendar_id from v_ta_timecard_current v, ta_prepost_log t ' +
                                       ' where v.pr_emp_id = ''%s'' and v.ta_prepost_log_id = t.id ' +
                     '                 and t.ta_prepost_control_id in %s)', [FEmplList[i], FControlIDList]);



      ExecuteCommandFmt('begin for v in (select To_Char(l.id) as id from ta_prepost_log l where l.ta_prepost_control_id in %s and l.pr_emp_id = ''%s'') ' +
                ' loop ta_misc.Archive_ta_prepost_log(v.id); end loop; end;', [FControlIDList, FEmplList[i]]);

       ExecuteCommandFmt('delete from ta_prepost_log where id in ' +
                 '(select l.id from ta_prepost_log l ' +
                 'where l.ta_prepost_control_id in %s and l.pr_emp_id = ''%s'')', [FControlIDList, FEmplList[i]]);
    finally
      Free;
    end;
  end;
end;

procedure TFrmTAPostPayroll.InsertTimeCard(AEmpId, APaytypeId, ATotHours:Real; Aproddate:TDateTime; AComment:String = '');
var
  AInc, i:Integer;
  AH:Real;
begin
    ExecuteCommandFmt('insert into pr_timecards (pr_emp_id, qty_of_hours, timecard_date, pr_paytype_id, comment1) ' +
              'values (%f, %f, to_date(''%s'', ''MM/DD/RRRR''), %f, ''%s'')',
              [AEmpId, ATotHours, FormatDateTime('mm/dd/yyyy', AProdDate), APaytypeId, AComment])

//  AInc := Trunc(ATotHours/SEHours.Value) + 1;
//  for i := 1 to AInc do
//  begin
//    if i = AInc then
//      aH := ATotHours - (AInc - 1) * SEHours.Value
//    else
//      aH := SEHours.Value;
//    ExecuteCommandFmt('insert into pr_timecards (pr_emp_id, qty_of_hours, timecard_date, pr_paytype_id) ' +
//              'values (%f, %f, to_date(''%s'', ''MM/DD/RRRR''), %f)',
//              [AEmpId, aH, FormatDateTime('mm/dd/yyyy', AProdDate), APaytypeId]);
//  end;

end;

procedure TFrmTAPostPayroll.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  EnsureSecurityInspectorOnTopOf( self );   }
end;

procedure TFrmTAPostPayroll.RBIncrementalClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl([dtDate, lblTimeCardDate], False);
end;

procedure TFrmTAPostPayroll.RBSummaryClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl([dtDate, lblTimeCardDate], True);
end;

end.
