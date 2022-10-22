unit JPrePost;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSpinEdit,
  uniRadioButton,
  uniMultiItem,
  uniListBox,
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, uniDateTimePicker, uniDBDateTimePicker, Vcl.ComCtrls;

type
  TFrmPrePost = class(TUniForm)
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    PnlHeader: TUniPanel;
    ListBoxType: TUniListBox;
    Label1: TUniLabel;
    Panel2: TUniPanel;
    PageControl1: TUniPageControl;
    TabFreeForm: TUniTabSheet;
    TabRecurring: TUniTabSheet;
    PageControl2: TUniPageControl;
    TabPeriod: TUniTabSheet;
    TabMonth: TUniTabSheet;
    TabQuarter: TUniTabSheet;
    TabBiWeekly: TUniTabSheet;
    TabNth: TUniTabSheet;
    SrcGlYear: TDataSource;
    TblGlYear: TFDTable;
    SrcGlPeriods: TDataSource;
    SrcGlPrePost: TDataSource;
    TblGlPrePost: TFDTable;
    Panel5: TUniPanel;
    GridPeriod1: TUniDBGrid;
    TblGlYearID: TBCDField;
    TblGlYearDESCRIP: TStringField;
    TblGlYearSTART_DATE: TDateTimeField;
    TblGlYearEND_DATE: TDateTimeField;
    TblGlPrePostID: TBCDField;
    TblGlPrePostTYPE: TStringField;
    TblGlPrePostTOTAL_CYCLES: TBCDField;
    TblGlPrePostFREQUENCY: TStringField;
    TblGlPrePostSTART_DATE: TDateTimeField;
    DBGridPeriod2: TUniDBGrid;
    SrcGlPrePostCycle: TDataSource;
    TblGlPrePostCycle: TFDTable;
    TblGlPrePostCycleID: TBCDField;
    TblGlPrePostCycleGLPREPOST_ID: TBCDField;
    TblGlPrePostCycleCYCLE_DATE: TDateTimeField;
    TblGlPrePostCycleCYCLE_NUMBER: TBCDField;
    Panel6: TUniPanel;
    GridYear1: TUniDBGrid;
    Splitter1: TUniSplitter;
    Panel7: TUniPanel;
    Splitter2: TUniSplitter;
    GridYear2: TUniDBGrid;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    Panel10: TUniPanel;
    lblNumberOfPeriods: TUniLabel;
    EditPeriods: TUniEdit;
    TblGlPrePostEPLANT_ID: TBCDField;
    TblGlYearEPLANT_ID: TBCDField;
    TblGlPeriods: TFDQuery;
    TblGlPeriodsID: TBCDField;
    TblGlPeriodsGLYEAR_ID: TBCDField;
    TblGlPeriodsPERIOD: TBCDField;
    TblGlPeriodsSTART_DATE: TDateTimeField;
    TblGlPeriodsEND_DATE: TDateTimeField;
    TblGlPeriodsSTATUS: TStringField;
    Label16: TUniLabel;
    PnlMonthlyLeft1: TUniPanel;
    Splitter3: TUniSplitter;
    PnlMonthlyLeft2: TUniPanel;
    PnlClient02: TUniPanel;
    Label8: TUniLabel;
    EditMonthlyYear: TUniSpinEdit;
    Splitter4: TUniSplitter;
    Panel4: TUniPanel;
    Splitter5: TUniSplitter;
    PnlMonthlyLeft3: TUniPanel;
    Panel12: TUniPanel;
    Label9: TUniLabel;
    Label3: TUniLabel;
    Label2: TUniLabel;
    EditMonthlyMonth: TUniSpinEdit;
    RBMonth1st: TUniRadioButton;
    RBMonth15th: TUniRadioButton;
    PnlQuarterlyLeft1: TUniPanel;
    Splitter6: TUniSplitter;
    PnlQuarterlyLeft2: TUniPanel;
    Panel11: TUniPanel;
    Label14: TUniLabel;
    EditQuarterYear: TUniSpinEdit;
    Splitter7: TUniSplitter;
    Panel13: TUniPanel;
    Splitter8: TUniSplitter;
    PnlQuarterlyLeft3: TUniPanel;
    Panel15: TUniPanel;
    Label15: TUniLabel;
    Label13: TUniLabel;
    Label6: TUniLabel;
    EditQuarterMonth: TUniSpinEdit;
    //UpDownQuarterMonth: TUpDown;
    RBQuarter1st: TUniRadioButton;
    RBQuarter15th: TUniRadioButton;
    PnlBiWeekly: TUniPanel;
    Splitter9: TUniSplitter;
    PnlBiWeeklyLeft1: TUniPanel;
    Panel14: TUniPanel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    EditBiWeeklyDate: TUniDBDateTimePicker;
    PnlClient01: TUniPanel;
    Splitter10: TUniSplitter;
    PnlEveryNLeft1: TUniPanel;
    Panel16: TUniPanel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    EditNthDate: TUniDBDateTimePicker;
    bvTopBuffer: TUniPanel;
    bvBottomBuffer: TUniPanel;
    EditMonthlyCycle: TUniSpinEdit;
    EditQuarterCycle: TUniSpinEdit;
    EditBiWeeklyCycles: TUniSpinEdit;
    EditNthCycles: TUniSpinEdit;
    EditNthDays: TUniSpinEdit;
    procedure ListBoxTypeClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure TblGlPrePostBeforePost(DataSet: TDataSet);
    procedure TblGlPrePostCycleBeforePost(DataSet: TDataSet);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDownQuarterMonthClick(Sender: TObject; Button: TUDBtnType);
    procedure FormActivate(Sender: TObject);
    procedure EditPeriodsKeyPress(Sender: TObject; var Key: Char);
    procedure TblGlYearFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FId : Real;
    procedure ProcessFreeFormAndReversing;
    procedure ProcessRecurring;
    function  FindDate:TDateTime;
    function  FindType:String;
    procedure ProcessPeriod;
    procedure ProcessMonth;
    procedure ProcessQuarter;
    procedure ProcessBiWeekly;
    procedure ProcessNthDay;
    procedure FindCurrentGlYear;
    function  FindNumberOfPeriods:Integer;
    procedure AssignPrePostCycle(PrePostId:Real; dDate:TDateTime; nCycle:Integer);
    procedure AssignPrePost(cFrequency, cType:String; dDate:TDateTime; nCycles:Integer);
    procedure AssignPeriodsToPrePostCycle(nPeriods:Integer; AAcrossYears:Boolean);
    function  FindDatefromString(cDate:String):TDateTime;
    function  FindGlYear(dDate:TDateTime):Real;
    function  FindStartDate(dDate:TDateTime; nStart:Integer):TDateTime;
    function  FindNextMonth(dDate:TDateTime; Months, Days:Integer):TDateTime;
    function  FindGlYearCycles(dDate:TDateTime; nGlYearId:Real; Months, Days:Integer):Integer;
    function  FindGlYearEndDate(nGlYearId:Real):TDateTime;
    function GetId: Real;
    procedure SetId(const Value: Real);
  public
    { Public declarations }
    nId:Real;
    class function DoPrePost:Real;
    property Id : Real read GetId write SetId;
  end;



var
  FrmPrePost: TFrmPrePost;

implementation

{$R *.DFM}

uses
  gj_rscstr,
  IQMS.Common.Dates,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager;


class function TFrmPrePost.DoPrePost:Real;
var
  Year, Month, Day: Word;
  ListBoxTypeIndex:Integer;
  PeriodID,YearID : Integer;
  frm : TFrmPrePost;
begin
  frm := TFrmPrePost.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    PageControl2.ActivePage := TabPeriod;
    PageControl1.ActivePage := TabFreeForm;
    ListBoxType.ItemIndex := 0;
    TblGlYear.Open;
    TblGlPeriods.Open;
    TblGlPrePost.Open;
    TblGlPrePostCycle.Open;
    FindCurrentGlYear;
    RbMonth1st.Checked := True;
    RbQuarter1st.Checked := True;
    Id := 0;
    DecodeDate(Now, Year, Month, Day);

    EditQuarterYear.Text := IntToStr(Year);
    EditMonthlyYear.Text := IntToStr(Year);

    EditQuarterMonth.Text := IntToStr(Month); //MonthLong(Month);
    EditMonthlyMonth.Text := IntToStr(Month); //MonthLong(Month);
    EditBiWeeklyDate.DateTime := Now;
    EditNthDate.DateTime     := Now;

    IQRegFormRead( frm, [ frm, Panel6, Panel7, GridYear1, GridYear2,
     PnlMonthlyLeft1, PnlMonthlyLeft2, PnlMonthlyLeft3,
     PnlQuarterlyLeft1, PnlQuarterlyLeft2, PnlQuarterlyLeft3,
     PnlBiWeeklyLeft1, PnlEveryNLeft1 ]);

    if (Frm.Name = 'FrmTransAcct') or (Frm.Name = 'FrmActPit') then
       ListBoxType.ItemIndex:= 0
    else
    begin
    if IQRegIntegerScalarRead( frm, 'ListBoxTypeIndex', ListBoxTypeIndex ) then
         ListBoxType.ItemIndex:= ListBoxTypeIndex;
    end;

    ListBoxTypeClick(NIL);

    if IQRegIntegerScalarRead( frm, 'YearID', YearID ) then
    try
      TblGlYear.Locate('ID', YearID, []);
    except
    end;

    if IQRegIntegerScalarRead( frm, 'PeriodID', PeriodID ) then
    try
      TblGlPeriods.Locate('ID', PeriodID, []);
    except
    end;

  end;

  if frm.ShowModal = mrOk then
     Result := frm.Id;
end;


procedure TFrmPrePost.FormShow(Sender: TObject);
begin
  // compensate for localization; this eliminates the need for a sizing panel
  EditPeriods.Left := lblNumberOfPeriods.Left + lblNumberOfPeriods.Width + 32;

end;

function TFrmPrePost.GetId: Real;
begin
  Result := FId;
end;

procedure TFrmPrePost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel6, Panel7, GridYear1, GridYear2,
   PnlMonthlyLeft1, PnlMonthlyLeft2, PnlMonthlyLeft3,
   PnlQuarterlyLeft1, PnlQuarterlyLeft2, PnlQuarterlyLeft3,
   PnlBiWeeklyLeft1, PnlEveryNLeft1 ]);
  if not((Owner.Name = 'FrmTransAcct') or (Owner.Name = 'FrmActPit')) then
    IQRegIntegerScalarWrite( self, 'ListBoxTypeIndex', ListBoxType.ItemIndex );
  IQRegIntegerScalarWrite( self, 'YearID', TblGLYearID.asInteger );
  IQRegIntegerScalarWrite( self, 'PeriodID', TblGlPeriodsID.asInteger );

  Action := caFree;
end;

procedure TFrmPrePost.ListBoxTypeClick(Sender: TObject);
begin
  if ListBoxType.Selected[0] or ListBoxType.Selected[2] or ListBoxType.Selected[3] then
  begin
     PageControl1.ActivePage := TabFreeForm;
     if ListBoxType.Selected[0]  then
       PageControl1.ActivePage.HelpContext := 1007630
     else
       PageControl1.ActivePage.HelpContext := 1011476;
  end
  else
  begin
     PageControl1.ActivePage := TabRecurring;
     PageControl1.ActivePage.HelpContext := 1011066;
  end;
end;

procedure TFrmPrePost.BtnOkClick(Sender: TObject);
begin
  if PageControl1.ActivePage = TabFreeForm
    then ProcessFreeFormAndReversing
    else ProcessRecurring;
  Id := TblGlPrePost.FieldByName('ID').asFloat;
  Close;
end;


procedure TFrmPrePost.ProcessFreeFormAndReversing;
var
  nCycles:Integer;
  cType:String;
  AAcrossYears:Boolean;
begin
  cType := FindType;
  if cType = 'REVERSING' then nCycles := 2 else nCycles := 1;
  AAcrossYears := False;
  if nCycles = 2 then
    if FindNumberOfPeriods < 2 then
    begin
      // 'There are not enough periods in the GL year. Reverse across years?'
      if not IqConfirmYN(gj_rscstr.cTXT0000013) then Exit;
      AAcrossYears := True;
    end;
//      then raise Exception.Create('Not enough periods in the GL year to create Reverse transaction');
  AssignPrePost('', cType, FindDate, nCycles);
  AssignPeriodsToPrePostCycle(nCycles, AAcrossYears);
end;

procedure TFrmPrePost.ProcessRecurring;
begin
  with PageControl2 do
    if      ActivePage = TabPeriod   then ProcessPeriod
    else if ActivePage = TabMonth    then ProcessMonth
    else if ActivePage = TabQuarter  then ProcessQuarter
    else if ActivePage = TabBiWeekly then ProcessBiWeekly
    else ProcessNthDay;
end;


procedure TFrmPrePost.SetId(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmPrePost.TblGlPrePostBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

function TFrmPrePost.FindDate:TDateTime;
begin
  Result := TblGlPeriods.FieldByName('START_DATE').asDateTime;
end;

function TFrmPrePost.FindType:String;
begin
  case ListBoxType.ItemIndex of
    0: Result := 'FREE FORM';
    1: Result := 'RECURRING';
    2: Result := 'REVERSING';
    3: Result := 'STATISTICAL';
  end;
end;

procedure TFrmPrePost.ProcessPeriod;
var
  nPeriods:Integer;
  AAcrossYears:Boolean;
begin
  if Trim(EditPeriods.Text) = '' then
    raise Exception.Create(gj_rscstr.cTXT0000014 {'Please specify the number of periods.'});
  if StrToInt(EditPeriods.Text) < 1 then
    raise Exception.Create(gj_rscstr.cTXT0000015 {'Number of periods must be greater than 0.'});
   nPeriods := FindNumberOfPeriods;
   if StrToInt(EditPeriods.Text) > nPeriods then
   begin
     nPeriods := Trunc(SelectValueAsFloat(IQFormat('select count(id) from glperiods ' +
                                ' where start_date >= To_Date(''%s'', ''MM/DD/RRRR'') ',
                                [FormatDateTime('mm/dd/yyyy', TblGlPeriods.FieldByName('START_DATE').asDateTime),
                                TblGlYear.FieldByName('ID').asFloat])));

     if StrToInt(EditPeriods.Text) > nPeriods then
       {'The number of periods you entered is greater ' +
        'than the available number of periods. Cannot proceed.'}
       raise Exception.Create(gj_rscstr.cTXT0000016);
     AAcrossYears := true;
     nPeriods := StrToInt(EditPeriods.Text);
  end
  else nPeriods := StrToInt(EditPeriods.Text);
  AssignPrePost('PERIOD', 'RECURRING', FindDate, nPeriods);
  AssignPeriodsToPrePostCycle(nPeriods, AAcrossYears);
end;

procedure TFrmPrePost.AssignPeriodsToPrePostCycle(nPeriods:Integer; AAcrossYears:Boolean);
var
  i:Integer;
begin
  i := 0;
  with TFDQuery.Create(self) do
  try
   Connection := UniMainModule.FDConnection1;

//   Sql.Add(IQFormat('select start_date from glperiods ' +
//                  'where id >= %f ' +
//                  'and glyear_id = %f ' +
//                  'order by id',
//                  [TblGlPeriods.FieldByName('ID').asFloat,
//                  TblGlYear.FieldByName('ID').asFloat]));

    if  AAcrossYears then
     Sql.Add(IQFormat('select start_date from glperiods ' +
                    ' where start_date >= To_Date(''%s'', ''MM/DD/RRRR'') and GL.CheckGLYearEplant(id) = 1 ' +
                    'order by start_date',
                    [FormatDateTime('mm/dd/yyyy', TblGlPeriods.FieldByName('START_DATE').asDateTime)]))
    else
     Sql.Add(IQFormat('select start_date from glperiods ' +
                    ' where start_date >= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                    'and glyear_id = %f  and GL.CheckGLYearEplant(id) = 1  ' +
                    'order by start_date',
                    [FormatDateTime('mm/dd/yyyy', TblGlPeriods.FieldByName('START_DATE').asDateTime),
                    TblGlYear.FieldByName('ID').asFloat]));
   Open;
   while not eof do
   begin
     Inc(i);
     if i > nPeriods then Exit;
     AssignPrePostCycle(TblGlPrePost.FieldByName('ID').asFloat,
                        FieldByName('START_DATE').asDateTime, i);
     Next;
   end;
  finally
    Free;
  end;
end;

procedure TFrmPrePost.ProcessMonth;
var
  nGlYearId:Real;
  dDate:TdateTime;
  cDate:String;
  nGLYearMonths, nMonths, i:Integer;
  k:integer;
  aId:Real;
begin
  if StrToInt(EditMonthlyCycle.Text) < 1 then
    // 'The Number of Months must be greater than 0.'
    raise Exception.Create(gj_rscstr.cTXT0000017);

  if RbMonth1st.Checked
    then dDate := EnCodeDate( EditMonthlyYear.Value, EditMonthlyMonth.Value, 1 )
    else dDate := EnCodeDate(EditMonthlyYear.Value, EditMonthlyMonth.Value, 15 );
  nGlYearId := FindGlYear(dDate);
//  nGLYearMonths := FindGlYearCycles(dDate, nGlYearId, 1, 0);
  nGLYearMonths := StrToInt(EditMonthlyCycle.Text);
  if StrToInt(EditMonthlyCycle.Text) > nGLYearMonths then
  begin
    {'The Number of Months you entered is greater than the available number of
     months in the GL year.  Do you want to proceed?  If you choose Yes, then
     only the available months in the GL year will be used.'}
    if not (IqConfirmYN(gj_rscstr.cTXT0000018)) then Abort;
    nMonths := nGLYearMonths;
  end
  else nMonths := StrToInt(EditMonthlyCycle.Text);
  AssignPrePost('MONTH', 'RECURRING', dDate, nMonths);
  k := 0;
  for i := 1 to nMonths do
  begin
     if SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') ' +
                   ' between start_date and end_date and GL.CheckGLYearEplant(id) = 1', [FormatDateTime('mm/dd/yyyy', dDate)]) > 0 then
     begin
       AssignPrePostCycle(TblGlPrePost.FieldByName('ID').asFloat,
                          dDate, i);
       inc(k);
     end;
     dDate := FindNextMonth(dDate, 1, 0);
  end;
  ExecuteCommandFmt('update glprepost set total_cycles = %d where id = %f', [k, TblGlPrePost.FieldByName('ID').asFloat]);
  aId := TblGlPrePost.FieldByName('ID').asFloat;
  TblGlPrePost.Close;
  TblGlPrePost.Open;
  TblGlPrePost.Locate('ID', aId, []);
end;

procedure TFrmPrePost.ProcessQuarter;
var
  nGlYearId:Real;
  dDate:TdateTime;
  nGLYearQuarters, nQuarters, i:Integer;
  k:integer;
  aId:Real;
begin
  if StrToInt(EditQuarterCycle.Text) < 1 then
    // 'The Number of Quarters must be greater than 0.'
    raise Exception.Create(gj_rscstr.cTXT0000019);
  if RbQuarter1st.Checked
    then dDate := EnCodeDate(EditQuarterYear.Value, EditQuarterMonth.Value, 1 )
    else dDate := EnCodeDate(EditQuarterYear.Value, EditQuarterMonth.Value, 15 );
  nGlYearId := FindGlYear(dDate);
//  nGLYearQuarters := FindGlYearCycles(dDate, nGlYearId, 3, 0);
  nGLYearQuarters := StrToInt(EditQuarterCycle.Text);
  if StrToInt(EditQuarterCycle.Text) > nGLYearQuarters then
  begin
    {'The Number of Quarters you entered is greater than the available number of ' +
     'quarters in the GL year.  Do you want to proceed?  If you choose Yes, then ' +
     'only the available quarters in the GL year will be used.'}
    if not (IqConfirmYN(gj_rscstr.cTXT0000020)) then Abort;
    nQuarters := nGLYearQuarters ;
  end
  else nQuarters  := StrToInt(EditQuarterCycle.Text);
  AssignPrePost('QUARTER', 'RECURRING', dDate, nQuarters);
  k := 0;
  for i := 1 to nQuarters do
  begin
     if SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1', [FormatDateTime('mm/dd/yyyy', dDate)]) > 0 then
     begin
       AssignPrePostCycle(TblGlPrePost.FieldByName('ID').asFloat,
                          dDate, i);
       inc(k);
     end;
     dDate := FindNextMonth(dDate, 3, 0);
  end;
  ExecuteCommandFmt('update glprepost set total_cycles = %d where id = %f', [k, TblGlPrePost.FieldByName('ID').asFloat]);
  aId := TblGlPrePost.FieldByName('ID').asFloat;
  TblGlPrePost.Close;
  TblGlPrePost.Open;
  TblGlPrePost.Locate('ID', aId, []);
end;

procedure TFrmPrePost.ProcessBiWeekly;
var
  nGlYearId:Real;
  dDate:TdateTime;
  nGLYearBi, nBi, i:Integer;
  k:integer;
  aId:Real;
begin
  if StrToInt(EditBiWeeklyCycles.Text) < 1 then
    // 'The Number of Cycles has to be greater than 0.'
    raise Exception.Create(gj_rscstr.cTXT0000021);
//  dDate := FindDatefromString(EditBiWeeklyDate.Text);
  dDate := EditBiWeeklyDate.DateTime;
  nGlYearId := FindGlYear(dDate);
//  nGLYearBi := FindGlYearCycles(dDate, nGlYearId, 0, 14);
  nGLYearBi := StrToInt(EditBiWeeklyCycles.Text);
  if StrToInt(EditBiWeeklyCycles.Text) > nGLYearBi then
  begin
    {'The Number of Cycles you entered is greater than the available number of ' +
     'cycles in the GL year.  Do you want to proceed?  If you choose Yes, then ' +
     'only the available cycles in the GL year will be used.'}
    if not (IqConfirmYN(gj_rscstr.cTXT0000022)) then Abort;
    nBi := nGLYearBi ;
  end
  else nBi  := StrToInt(EditBiWeeklyCycles.Text);
  AssignPrePost('BIWEEKLY', 'RECURRING', dDate, nBi);
  k := 0;
  for i := 1 to nBi do
  begin
     if SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1', [FormatDateTime('mm/dd/yyyy', dDate)]) > 0 then
     begin
       AssignPrePostCycle(TblGlPrePost.FieldByName('ID').asFloat,
                          dDate, i);
       inc(k);
     end;
     dDate := FindNextMonth(dDate, 0, 14);
  end;
  ExecuteCommandFmt('update glprepost set total_cycles = %d where id = %f', [k, TblGlPrePost.FieldByName('ID').asFloat]);
  aId := TblGlPrePost.FieldByName('ID').asFloat;
  TblGlPrePost.Close;
  TblGlPrePost.Open;
  TblGlPrePost.Locate('ID', aId, []);
end;

procedure TFrmPrePost.ProcessNthDay;
var
  nGlYearId:Real;
  dDate:TdateTime;
  nGLYearNth, nNth, i:Integer;
  k:integer;
  aId:Real;
begin
  if StrToInt(EditNthCycles.Text) < 1 then
    // 'The Number of Cycles must be greater than 0.'
    raise Exception.Create(gj_rscstr.cTXT0000021);

  if StrToInt(EditNthDays.Text) < 1 then
    // 'The Number of days in a cycles must be greater then 0.'
    raise Exception.Create(gj_rscstr.cTXT0000023);

//  dDate := FindDatefromString(EditNthDate.Text);
  dDate := EditNthDate.DateTime;
  nGlYearId := FindGlYear(dDate);
  nGLYearNth := StrToInt(EditNthCycles.Text);
//  nGLYearNth := FindGlYearCycles(dDate, nGlYearId, 0, StrToInt(EditNthDays.Text));
  if StrToInt(EditNthCycles.Text) > nGLYearNth then
  begin
    {'The Number of Cycles you entered is greater than the available number of ' +
     'cycles in the GL year.  Do you want to proceed?  If you choose Yes, then ' +
     'only the available cycles in the GL year will be used.'}
    if not (IqConfirmYN(gj_rscstr.cTXT0000022)) then Abort;
    nNth := nGLYearNth ;
  end
  else nNth  := StrToInt(EditNthCycles.Text);
  //AssignPrePost('Nth', 'RECURRING', dDate, nNth);
  AssignPrePost( Format('EVERY %s DAYS', [ EditNthDays.Text]), 'RECURRING', dDate, nNth );
  k := 0;
  for i := 1 to nNth do
  begin
     if SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1', [FormatDateTime('mm/dd/yyyy', dDate)]) > 0 then
     begin
       AssignPrePostCycle(TblGlPrePost.FieldByName('ID').asFloat,
                          dDate, i);
       inc(k);
     end;
     dDate := FindNextMonth(dDate, 0, StrToInt(EditNthDays.Text));
  end;
  ExecuteCommandFmt('update glprepost set total_cycles = %d where id = %f', [k, TblGlPrePost.FieldByName('ID').asFloat]);
  aId := TblGlPrePost.FieldByName('ID').asFloat;
  TblGlPrePost.Close;
  TblGlPrePost.Open;
  TblGlPrePost.Locate('ID', aId, []);
end;

procedure TFrmPrePost.FindCurrentGlYear;
var
  nId:Real;
begin
  nId := SelectValueAsFloat('select glyear_id from iqsys');
  TblGlYear.FindKey([nId]);
end;

function TFrmPrePost.FindNumberOfPeriods:Integer;
begin
  Result := Trunc(SelectValueAsFloat(IQFormat('select count(id) from glperiods ' +
                                ' where start_date >= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                'and glyear_id = %f',
                                [FormatDateTime('mm/dd/yyyy', TblGlPeriods.FieldByName('START_DATE').asDateTime),
                                TblGlYear.FieldByName('ID').asFloat])));


//  Result := Trunc(SelectValueAsFloat(IQFormat('select count(id) from glperiods ' +
//                                ' where id >= %f ' +
//                                'and glyear_id = %f',
//                                [TblGlPeriods.FieldByName('ID').asFloat,
//                                TblGlYear.FieldByName('ID').asFloat])));
end;

procedure TFrmPrePost.AssignPrePostCycle(PrePostId:Real; dDate:TDateTime; nCycle:Integer);
begin
  with TblGlPrePostCycle do
  try
    Append;
    FieldByName('GLPREPOST_ID').asFloat   := PrePostId;
    FieldByName('CYCLE_DATE').asDateTime  := dDate;
    FieldByName('CYCLE_NUMBER').AsInteger := nCycle;
    Post;
  finally
    Cancel;
  end;
end;

procedure TFrmPrePost.AssignPrePost(cFrequency, cType:String; dDate:TDateTime; nCycles:Integer);
begin

  with TblGlPrePost do
  try
    Append;

//    if SecurityManager.EPlantsExist then
//    begin
//      if SecurityManager.EPlant_ID <> 'NULL' then
//        TblGlPrePostEPLANT_ID.AsFloat := StrToFloat(SecurityManager.EPlant_ID)
//    end;
    FieldByName('ID').AsFloat             := GetNextID('GLPREPOST');
    FieldByName('FREQUENCY').asString     := cFrequency;
    FieldByName('TYPE').AsString          := cType;
    FieldByName('START_DATE').asDateTime  := dDate;
    FieldByName('TOTAL_CYCLES').asInteger := nCycles;
    Post;
  finally
    Cancel;
  end;
end;


procedure TFrmPrePost.TblGlPrePostCycleBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;


function TFrmPrePost.FindDatefromString(cDate:String):TDateTime;
begin
  try
    Result := StrToDate(cDate)
  except
    raise Exception.Create(gj_rscstr.cTXT0000024 {'Invalid date format.'})
  end;
end;

function TFrmPrePost.FindGlYear(dDate:TDateTime):Real;
begin
  Result := SelectValueAsFloat(Format('select id ' +
                          'from glyear ' +
                          'where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date'
                          , [FormatDateTime('mm/dd/yyyy', dDate)]));
  if Result = 0 then
    // 'There is no corresponding GL Year found for the specified date.'
    raise Exception.Create(gj_rscstr.cTXT0000025);
end;

function TFrmPrePost.FindStartDate(dDate:TDateTime; nStart:Integer):TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(dDate, Year, Month, Day);
  Result := EncodeDate(Year, Month, nStart);
end;

function TFrmPrePost.FindNextMonth(dDate:TDateTime; Months, Days:Integer):TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(dDate, Year, Month, Day);
  if Days <> 0
    then Result := dDate + Days
  else
  begin
    Month := Month + Months;
    if Month > 12 then Year := Year + 1;
    if      Month = 13 then Month := 1
    else if Month = 14 then Month := 2
    else if Month = 15 then Month := 3;
    Result := EncodeDate(Year, Month, Day);
  end;
end;

function TFrmPrePost.FindGlYearCycles(dDate:TDateTime; nGlYearId:Real; Months, Days:Integer):Integer;
var
  dEndDate:TDateTime;
begin
  Result := 1;
  dEndDate := FindGlYearEndDate(nGlYearId);
  while True do
  begin
    dDate := FindNextMonth(dDate, Months, Days);
    if dDate > dEndDate then Exit;
    Inc(Result);
  end;
end;

function TFrmPrePost.FindGlYearEndDate(nGlYearId:Real):TDateTime;
begin
  with TFDQuery.Create(self) do
  try
   Connection := UniMainModule.FDConnection1;
   Sql.Add(IQFormat('select end_date from glyear ' +
                  'where id = %f',[nGlYearId]));
   Open;
   Result := FieldByName('end_date').AsDateTime;
  finally
    Free;
  end;
end;



procedure TFrmPrePost.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrePost.UpDownQuarterMonthClick(Sender: TObject;
  Button: TUDBtnType);
begin
  //EditQuarterMonth.Text := MonthLong(UpDownQuarterMonth.Position);
end;

procedure TFrmPrePost.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQHelpHk.pas}
end;

procedure TFrmPrePost.EditPeriodsKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in [#8,'0'..'9']) then Key := #0;
end;

procedure TFrmPrePost.TblGlYearFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := SelectValueFmtAsFloat('select GL.CheckGLYearEplant(%f, ''GLYEAR'') from dual', [TblGlYearID.asFloat]) = 1;
end;

end.
