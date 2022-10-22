unit tl_rep_labor_by_emp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  vcl.Wwdbdatetimepicker,
  FireDAC.Stan.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Buttons,
  vcl.wwdblook,
  IQMS.WebVcl.Hpick,
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
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, uniMainMenu, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  TFrmToolingReportLaborByEmployee = class(TUniForm)
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel6: TUniPanel;
    QryEmp: TFDQuery;
    QryEmpEMPNO: TStringField;
    QryEmpFIRST_NAME: TStringField;
    QryEmpLAST_NAME: TStringField;
    QryEmpLabor: TFDQuery;
    SrcEmpLabor: TDataSource;
    QryEmpLaborID: TBCDField;
    QryEmpLaborTOOL_TASK_INFORMATION_ID: TBCDField;
    QryEmpLaborLABOR_HRS: TFMTBCDField;
    QryEmpLaborPROJECT: TStringField;
    QryEmpLaborWORKORDERNO: TStringField;
    QryEmpLaborOUTLINENUMBER: TStringField;
    QryEmpLaborTASK_NAME: TStringField;
    Label2: TUniLabel;
    sbtnSelectEmployee: TUniSpeedButton;
    Label1: TUniLabel;
    wwDBDateTimePickerLaborDate: TUniDBDateTimePicker;
    cmbEmp: TUniDBLookupComboBox;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpEMPNO: TStringField;
    PkEmpFIRST_NAME: TStringField;
    PkEmpLAST_NAME: TStringField;
    wwDBComboDlgNote: TUniEdit;
    QryEmpID: TBCDField;
    QryEmpLaborNOTES: TStringField;
    QryEmpLaborCOMPLETED: TStringField;
    QryEmpLaborTOTAL_LABOR_HRS: TFMTBCDField;
    SrcQryEmp: TDataSource;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure QryEmpBeforeOpen(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure sbtnSelectEmployeeClick(Sender: TObject);
    procedure QryEmpLaborUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);


    procedure wwDBComboDlgNoteCustomDlg(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cmbEmpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure CheckAbortInsert(DataSet: TDataSet);
    procedure QryEmpLaborBeforeOpen(DataSet: TDataSet);
    procedure cmbEmpDropDown(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FPR_Emp_ID: Integer;
    procedure PostChanges( var ACount: Integer );
    procedure SetPR_Emp_ID(const Value: Integer);
    property PR_Emp_ID: Integer read FPR_Emp_ID write SetPR_Emp_ID;
  public
    { Public declarations }
    class function DoShowModal : Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  iqtool_rscstr,
  tl_settings;

class function TFrmToolingReportLaborByEmployee.DoShowModal: Boolean;
var
  LFrmToolingReportLaborByEmployee : TFrmToolingReportLaborByEmployee;
begin
  LFrmToolingReportLaborByEmployee := TFrmToolingReportLaborByEmployee.Create( UniGUIApplication.UniApplication );
  Result:= LFrmToolingReportLaborByEmployee.ShowModal = mrOK;
end;

procedure TFrmToolingReportLaborByEmployee.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmToolingReportLaborByEmployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
  IQRegIntegerScalarWrite( self, 'PR_EMP_ID', PR_Emp_ID );
end;

procedure TFrmToolingReportLaborByEmployee.QryEmpBeforeOpen(DataSet: TDataSet);
begin
{ TODO -oGPatil -cWebConvert : Access Violation Error
  AssignQueryParamValue(DataSet, 'project_manager',
    Trunc(BoolToNum( ToolingSettings.FilterProjectManagerEmployees )));  }
end;

procedure TFrmToolingReportLaborByEmployee.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmToolingReportLaborByEmployee.btnOKClick(Sender: TObject);
var
  ACount: Integer;
begin
  if PR_Emp_ID = 0 then
     ABORT;
  QryEmpLabor.CheckBrowseMode;

  if not IQConfirmYN(iqtool_rscstr.cTXT0000269 {'About to post entered labor hours. Continue?'}) then
     EXIT;

  PostChanges(ACount);
  IQConfirm(Format(iqtool_rscstr.cTXT0000270, [ ACount ])); //  'Finished posting labor hours. %d record(s) added.';

  ModalResult:= mrOK;
end;

procedure TFrmToolingReportLaborByEmployee.CheckAbortInsert(DataSet: TDataSet);
begin
  if QryEmpLabor.Eof and QryEmpLabor.Bof then
     ABORT;
end;

procedure TFrmToolingReportLaborByEmployee.cmbEmpCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  PR_Emp_ID:= LookupTable.FieldByName('id').asInteger;
end;


procedure TFrmToolingReportLaborByEmployee.cmbEmpDropDown(Sender: TObject);
begin
  Reopen(QryEmp)
end;

procedure TFrmToolingReportLaborByEmployee.QryEmpLaborBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'pr_emp_id', PR_Emp_ID);
end;

procedure TFrmToolingReportLaborByEmployee.QryEmpLaborUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);


begin
  //  Fake update
end;

procedure TFrmToolingReportLaborByEmployee.sbtnSelectEmployeeClick(
  Sender: TObject);
begin
  if PkEmp.Execute then
     PR_Emp_ID:= PkEmp.GetValue('id');
end;

procedure TFrmToolingReportLaborByEmployee.SetPR_Emp_ID(const Value: Integer);
begin
  FPR_Emp_ID := Value;
  cmbEmp.Text:= SelectValueByID('empno', 'pr_emp', FPR_Emp_ID);
  Caption:= Format(iqtool_rscstr.cTXT0000271,  // 'Labor Reporting by %s';
                   [ SelectValueByID('substrb(misc.format_name2(first_name, last_name),1,255)', 'pr_emp',  FPR_Emp_ID )]);
  Reopen(QryEmpLabor)
end;

procedure TFrmToolingReportLaborByEmployee.UniFormCreate(Sender: TObject);
var
  APr_Emp_ID: Integer;
begin
  inherited;
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  wwDBDateTimePickerLaborDate.Datetime:= Date;

  QryEmp.Close;
  IQSetTablesActive( TRUE, self );
{ TODO -oGPatil -cWebConvert : Could not convert variant of type null into OleStr
  if IQRegIntegerScalarRead( self, 'PR_EMP_ID', APr_Emp_ID ) and (APR_Emp_ID > 0) then
     PR_Emp_ID:= APr_Emp_ID;  }
end;

procedure TFrmToolingReportLaborByEmployee.wwDBComboDlgNoteCustomDlg(
  Sender: TObject);
var
  S: string;
begin
  S:= QryEmpLaborNOTES.asString;
  if DoEditMemoStr(S, 4000 ) then    {IQMS.Common.EditMemoStr.pas}
  begin
    QryEmpLabor.Edit;
    QryEmpLaborNOTES.asString:= S;
  end;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmToolingReportLaborByEmployee.wwDBGrid1CalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
  AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
     EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end;   }

procedure TFrmToolingReportLaborByEmployee.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmToolingReportLaborByEmployee.PostChanges( var ACount: Integer );
var
  AChargeRate: Real;

  procedure _AppendEmpLabor;
  begin
    ExecuteCommandFmt('insert into emp_labor                   '+
                            '     ( source,                          '+
                            '       source_id,                       '+
                            '       pr_emp_id,                       '+
                            '       labor_hrs,                       '+
                            '       charge_rate,                     '+
                            '       created,                         '+
                            '       notes,                           '+
                         // '       detailno,                        '+
                            '       posting_source )                 '+
                            'values                                  '+
                            '     ( ''TOOL_TASK_INFORMATION'',       '+
                            '       %f,                              '+   // tool_task_info_id,
                            '       %d,                              '+   // pr_emp_id,
                            '       %.6f,                            '+   // hours,
                            '       %.6f,                            '+   // charge_rate,
                            '       to_date(''%s'', ''mm/dd/yyyy''), '+   // created,
                            '       ''%s'',                          '+   // notes,
                         // '       ''%s'',                          '+   // detailno,
                            '       ''TL'' )                         ',
                            [ QryEmpLaborTOOL_TASK_INFORMATION_ID.asFloat,
                              PR_Emp_ID,
                              QryEmpLaborLABOR_HRS.asFloat,
                              AChargeRate,
                              FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerLaborDate.DateTime),
                              FixStr(QryEmpLaborNOTES.asString) ]);
  end;


  procedure _MarkTaskCompleted;
  begin
     ExecuteCommandFmt('update tool_task_information                                       '+
                       '   set actual_finish = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+
                       '       percentcomplete = 100,                                      '+
                       '       completed = ''Y''                                           '+
                       ' where id = %d                                                     ',
                       [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', Now ),
                         QryEmpLaborTOOL_TASK_INFORMATION_ID.asInteger ]);
  end;

begin
  ACount:= 0;
  AChargeRate:= SelectValueByID('charge_rate', 'pr_emp', PR_Emp_ID);

  with QryEmpLabor do
  begin
    First;
    while not Eof do
    begin
      if QryEmpLaborLABOR_HRS.asFLoat > 0 then
      begin
         _AppendEmpLabor;
         Inc(ACount);
      end;

      if QryEmpLaborCOMPLETED.asString = 'Y' then
        _MarkTaskCompleted;

      Next;
    end;
  end;
end;


end.
