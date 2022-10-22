unit GLPeriod;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  Calendar,
  Vcl.Menus,
  Data.DB,
  DM_GL,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  wwcheckbox,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame, uniDateTimePicker,
  uniDBDateTimePicker;

const
  cWarning = 'Changing existing G/L year and/or period may' + #13 +
             'affect G/L transactions assigned to that G/L year and/or period' + #13 +
             'Cancel the change?';


type
  TFrmDefPeriods = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BitBtnOk: TUniBitBtn;
    Panel6: TUniPanel;
    Panel5: TUniPanel;
    NavYear: TUniDBNavigator;
    IQAbout1: TIQWebAbout;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    HelpContents1: TUniMenuItem;
    About1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    PnlLeft01: TUniPanel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label6: TUniLabel;
    Label1: TUniLabel;
    lblEPlant: TUniLabel;
    Splitter1: TUniSplitter;
    PnlClient02: TUniPanel;
    sbtnEPlant: TUniSpeedButton;
    DBEditDescrip: TUniDBEdit;
    DBFiscalYear: TUniDBEdit;
    dbePlant: TUniDBEdit;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    Panel4: TUniPanel;
    PageControlPeriod: TUniPageControl;
    TabSheetGrid: TUniTabSheet;
    TabSheetEdit: TUniTabSheet;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    lblPeriod: TUniLabel;
    lblStartDate: TUniLabel;
    lblEndDate: TUniLabel;
    lblStatus: TUniLabel;
    DBEditPeriod: TUniDBEdit;
    BtnCreatePeriods: TUniButton;
    Label2: TUniLabel;
    Label3: TUniLabel;
    SBSearchPurch: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    DBGridPeriods: TIQUniGridControl;
    wwDBAP: TUniDBComboBox;
    wwDBAR: TUniDBComboBox;
    wwDBGL: TUniDBComboBox;
    wwDBINV: TUniDBComboBox;
    DBEditYStartDate: TUniDBDateTimePicker;
    DBEditYEndDate: TUniDBDateTimePicker;
    DBEditStartDate: TUniDBDateTimePicker;
    DBEditEndDate: TUniDBDateTimePicker;
    wwCBAPClosed: TUniCheckBox;
    wwCBAPFinal: TUniCheckBox;
    wwCBAPNO: TUniCheckBox;
    wwCBAPOpen: TUniCheckBox;
    wwCBGLClosed: TUniCheckBox;
    wwCBGLFinal: TUniCheckBox;
    wwCBGLNO: TUniCheckBox;
    wwCBGLOpen: TUniCheckBox;
    wwCBARFinal: TUniCheckBox;
    wwCBARNO: TUniCheckBox;
    wwCBAROpen: TUniCheckBox;
    wwCBARClosed: TUniCheckBox;
    wwCBInvClosed: TUniCheckBox;
    Label4: TUniLabel;
    New1: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DBEditYEndDateEnter(Sender: TObject);
    procedure SBGridViewClick(Sender: TObject);
    procedure BtnCreatePeriodsClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    { TODO -oathite -cWebConvert :  Undeclared identifier: 'TNavigateBtn'
    procedure NavYearBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure NavPeriodBeforeAction(Sender: TObject;
      Button: TNavigateBtn); }
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure HelpContents1Click(Sender: TObject);
    procedure sbtnEPlantClick(Sender: TObject);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure ClearINVStatus1Click(Sender: TObject);
    procedure wwCBAPClosedClick(Sender: TObject);
    procedure wwCBAPFinalClick(Sender: TObject);
    procedure wwCBAPNOClick(Sender: TObject);
    procedure wwCBAPOpenClick(Sender: TObject);
    procedure wwCBGLClosedClick(Sender: TObject);
    procedure wwCBGLFinalClick(Sender: TObject);
    procedure wwCBGLNOClick(Sender: TObject);
    procedure wwCBGLOpenClick(Sender: TObject);
    procedure wwCBARClosedClick(Sender: TObject);
    procedure wwCBARFinalClick(Sender: TObject);
    procedure wwCBARNOClick(Sender: TObject);
    procedure wwCBAROpenClick(Sender: TObject);
    procedure wwCBInvClosedClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  protected
    procedure GlPeriodsDataChange(Sender: TObject; Field: TField); virtual;
    procedure GlYearNewRecord(DataSet: TDataSet);virtual;
    procedure EnterYStartDate(Sender: TObject);virtual;
    procedure GlYearDataChange(Sender: TObject; Field: TField); virtual;
    procedure PStartDateChange(Sender: TField); virtual;
    procedure PEndDateChange(Sender: TField); virtual;
    procedure YStartDateChange(Sender: TField); virtual;
    procedure YEndDateChange(Sender: TField); virtual;

    procedure GlYearBeforePost(DataSet: TDataSet);virtual;
    procedure GlYearBeforeDelete(DataSet: TDataSet);virtual;
    procedure GlPeriodsBeforePost(DataSet: TDataSet);virtual;
    procedure GlPeriodsBeforeDelete(DataSet: TDataSet);virtual;

    procedure TblGlPeriodsINV_STATUSValidate(Sender: TField);
    procedure TblGlPeriodsAP_STATUSValidate(Sender: TField);
    procedure TblGlPeriodsAR_STATUSValidate(Sender: TField);
    procedure TblGlPeriodsGL_STATUSValidate(Sender: TField);
    procedure PKGLYearIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
  private
    { Private declarations }
    function  RedisplayCalendar(fField:TField; cFormName:String; MySelf:TComponent):Boolean;
    function  FindCalenderForm(cFormName:String; MySelf:TComponent):TUniForm;
    procedure RefreshCalendar(fField:TField; cCalender:TUniForm);
    procedure CheckFiscalYearDates(dStart, dEnd:TdateTime; nPeriods:Integer);
    procedure AssignPeriods(dStart, dEnd:TdateTime; nPeriods:Integer);
    procedure AssignMonthlyPeriods(dStart, dEnd:TdateTime; nPeriods:Integer);
    function  CalculateNumOfDays(dStart, dEnd:TdateTime; nPeriods:Integer):Integer;
    function  ProperInterval(nNumOfDays, nPeriods:Integer; dStart, dEnd:TdateTime):Boolean;
    procedure FreeCalender;
    procedure CheckAndAssignNumberOfPerods;
    function  GetPeriods:Integer;
    procedure CheckPeriodsValues;
    function  GetMonths(dStart, dEnd:TDateTime):Integer;
    procedure RemoveExistingPeriods;
    procedure CheckOverlappingGlYears(dStart, dEnd:TDateTime; AID:Real);
    procedure GetAllExistingGlYears;
    procedure CheckUnpostedAP;
    procedure CheckUnpostedAR;
    procedure CheckUnpostedGL;
//    function CheckListOfGlYearId:Boolean;
  public
    { Public declarations }
    lShowCalender:Boolean;
    lOkPressed :Boolean;
    cHasFocus:String;
    MyDataBase:TFDConnection;
    ListOfGlYearId:TList;
    DM:TGL_DM;
    ePeriodOnDataChange :TDataChangeEvent;
    eYearOnDataChange   :TDataChangeEvent;
    eOnNewRecord        :TDataSetNotifyEvent;
    eOnEnter            :TNotifyEvent;

    ePStartDateChange   :TFieldNotifyEvent;
    ePEndDateChange     :TFieldNotifyEvent;
    eYStartDateChange   :TFieldNotifyEvent;
    eYEndDateChange     :TFieldNotifyEvent;

//    procedure RemoveListofGlYearIds;
  end;

//procedure DoPeriods(AOwner:TComponent);
procedure DoPeriods;
procedure DoPeriodsFromIqSys;

implementation
{$R *.DFM}
uses
  gl_rscstr,
  { TODO -oathite -cWebConvert : Depend on glcalend
  glcalend, }
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.HelpHook,
  IQMS.Common.InputQuery,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Depend on IQSecIns
  IQSecIns, }
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.COmmon.SetPlant;

(*
procedure DoPeriods( AOwner:TComponent);
var
  lOk:Boolean;
//  MyForm : TFrmDefPeriods;
begin
//  MyForm := TFrmDefPeriods.Create( AOwner );
//  with MyForm do
  with TFrmDefPeriods.Create(AOwner) do
//  try
//    MyDataBase := FDManager.FindConnection('IQFD');
//    MyDataBase.StartTransaction;
    try
      ShowModal;
      lOk := lOkPressed;
    finally
//      RemoveListofGlYearIds;
      ListofGlYearId.Free;
      Free;
    end;
//    if lOk then
//       MyDataBase.Commit;
//  finally
//    if MyDataBase.InTransaction then
//       MyDataBase.RollBack;
//
//    with TFrmGLMain(AOwner).DM do
//    begin
//      TblGLPeriods.Cancel;
//      TblGLYear.Cancel;
//      TblGLYear.Refresh;
//    end;
//  end;
end;
*)

procedure DoPeriods;
begin
  TFrmDefPeriods.Create(UniApplication).Show;
end;

procedure DoPeriodsFromIqSys;
begin
  with TFrmDefPeriods.Create(UniApplication) do
  begin
    ShowModal;
  end;
end;

procedure TFrmDefPeriods.FormCreate(Sender: TObject);
var
  AGlyearId:Real;
begin
  DM:= TGL_DM.Create( self );

  DM.Name:= '';              // Makes the form to look at Local DM

  New1.Visible := false;
  DM.PKGLYear.OnIqModify := PKGLYearIQModify;

  //TFrmGLMain(AOwner).DM.Name:= '';

  try
    SBSearchPurchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      //SysUtils.ABORT;
    end;
  end;

  IQRegFormRead( self, [ self, PnlLeft01 ]);

  AGlyearId := SelectValueAsFloat('select glyear_id from iqsys where rownum < 2');
  if AGlyearId <> 0 then
    DM.TblGlYear.Locate('ID', AGlyearId, []);
  lOkPressed := False;
  //DM:= TFrmGLMain(Owner).DM;
  lShowCalender := False;
  cHasFocus := 'START_DATE';
  PageControlPeriod.ActivePage  := TabSheetGrid;
  ePeriodOnDataChange := DM.SrcGLPeriods.OnDataChange;
  eYearOnDataChange   := DM.SrcGLYear.OnDataChange;
  eOnNewRecord        := DM.TblGlYear.OnNewRecord;
  eOnEnter            := DBEditYStartDate.OnEnter;
  DM.SrcGLPeriods.OnDataChange  := GlPeriodsDataChange;
  DM.SrcGLYear.OnDataChange     := GlYearDataChange;
  DM.TblGlYear.OnNewRecord      := GlYearNewRecord;
  DBEditYStartDate.OnEnter      := EnterYStartDate;

  DM.TblGlYear.BeforePost           := GlYearBeforePost;
  DM.TblGlYear.BeforeDelete         := GlYearBeforeDelete;
  DM.TblGlPeriods.BeforePost        := GlPeriodsBeforePost;
  DM.TblGlPeriods.BeforeDelete      := GlPeriodsBeforeDelete;


  ePStartDateChange := DM.TblGlPeriodsSTART_DATE.OnChange;
  ePEndDateChange   := DM.TblGlPeriodsEND_DATE.OnChange  ;
  eYStartDateChange := DM.TblGlYearSTART_DATE.OnChange   ;
  eYEndDateChange   := DM.TblGlYearEND_DATE.OnChange     ;

  DM.TblGlPeriodsSTART_DATE.OnChange := PStartDateChange;
  DM.TblGlPeriodsEND_DATE.OnChange   := PEndDateChange;
  DM.TblGlYearSTART_DATE.OnChange    := YStartDateChange;
  DM.TblGlYearEND_DATE.OnChange      := YEndDateChange;


  DM.TblGlPeriodsINV_STATUS.OnValidate := TblGlPeriodsINV_STATUSValidate;
  DM.TblGlPeriodsAP_STATUS.OnValidate := TblGlPeriodsAP_STATUSValidate;
  DM.TblGlPeriodsAR_STATUS.OnValidate := TblGlPeriodsAR_STATUSValidate;
  DM.TblGlPeriodsGL_STATUS.OnValidate := TblGlPeriodsGL_STATUSValidate;

  ListOfGlYearID := Tlist.Create;
  GetAllExistingGlYears;

  GlYearDataChange(self, nil);

  { TODO -oathite -cWebConvert :  Incompatible types: 'TDBNavigator' and 'TUniDBNavigator'
  IQMS.Common.Controls.ResizeNavBar(NavYear);
  IQMS.Common.Controls.ResizeNavBar(NavPeriod); }
  IQMS.Common.Controls.AdjustPageControlToParent(PageControlPeriod);

  wwDBAP.Items.Clear;
  wwDBAP.Items.Add(gl_rscstr.cTXT0000100 + #9 + 'CLOSED');
  wwDBAP.Items.Add(gl_rscstr.cTXT0000101 + #9 + 'FINAL');
  wwDBAP.Items.Add(gl_rscstr.cTXT0000102 + #9 + 'N/O');
  wwDBAP.Items.Add(gl_rscstr.cTXT0000103 + #9 + 'OPEN');

  wwDBAR.Items.Clear;
  wwDBAR.Items.Add(gl_rscstr.cTXT0000100 + #9 + 'CLOSED');
  wwDBAR.Items.Add(gl_rscstr.cTXT0000101 + #9 + 'FINAL');
  wwDBAR.Items.Add(gl_rscstr.cTXT0000102 + #9 + 'N/O');
  wwDBAR.Items.Add(gl_rscstr.cTXT0000103 + #9 + 'OPEN');

  wwDBGL.Items.Clear;
  wwDBGL.Items.Add(gl_rscstr.cTXT0000100 + #9 + 'CLOSED');
  wwDBGL.Items.Add(gl_rscstr.cTXT0000101 + #9 + 'FINAL');
  wwDBGL.Items.Add(gl_rscstr.cTXT0000102 + #9 + 'N/O');
  wwDBGL.Items.Add(gl_rscstr.cTXT0000103 + #9 + 'OPEN');

  wwDBINV.Items.Clear;
  wwDBINV.Items.Add(gl_rscstr.cTXT0000100 + #9 + 'CLOSED');

end;


procedure TFrmDefPeriods.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.SrcGLPeriods.OnDataChange := ePeriodOnDataChange;
  DM.SrcGLYear.OnDataChange    := eYearOnDataChange  ;
  DM.TblGlYear.OnNewRecord     := eOnNewRecord       ;
  DBEditYStartDate.OnEnter     := eOnEnter           ;

  DM.TblGlPeriodsSTART_DATE.OnChange := ePStartDateChange;
  DM.TblGlPeriodsEND_DATE.OnChange   := ePEndDateChange  ;
  DM.TblGlYearSTART_DATE.OnChange    := eYStartDateChange;
  DM.TblGlYearEND_DATE.OnChange      := eYEndDateChange  ;
  IQRegFormWrite( self, [ self, PnlLeft01 ]);

  ListOfGlYearID.Free;
  Action:= caFree;
end;

procedure TFrmDefPeriods.BitBtnOkClick(Sender: TObject);
begin
//  if (DM.TblGlYear.State in [dsEdit, dsInsert]) then DM.TblGlYear.Post;
//  CheckPeriodsValues;
  //CheckAndAssignNumberOfPerods;
//  lOkPressed := True;
  Close;
end;


function TFrmDefPeriods.RedisplayCalendar(fField:TField; cFormName:String; MySelf:TComponent):Boolean;
var
  Form:TUniForm;
begin
  Result := False;
  Form := FindCalenderForm(cFormName, MySelf);
  if Form <> nil then
  begin
    Result := True;
    try
      RefreshCalendar(fField, Form);
    except
      // 'The date is incorrect.  Please enter a valid date.'
      raise Exception.Create(gl_rscstr.cTXT0000062);
    end;
  end;
end;

procedure TFrmDefPeriods.RefreshCalendar(fField:TField; cCalender:TUniForm);
var
  cFieldName:String;
  dDate: TDateTime;
  Year, Month, Day: Word;

begin
  cFieldName := fField.Name;

  if  (Pos('START_DATE', cFieldName) = 0) and
           (Pos('END_DATE', cFieldName) = 0) then Exit;

  dDate := fField.AsDateTime;

  if dDate = 0 then Exit;
  DecodeDate(dDate, Year, Month, Day);
  { TODO -oathite -cWebConvert :  Undeclared identifier: 'Glcalend'
  with TGLCalender(cCalender) do
  begin
    Calendar1.CalendarDate:= dDate;

    //Calendar1.Year  := Year;
    //Calendar1.Month := Month;
    //Calendar1.Day   := Day;

    EditMonth.Text       := MonthLong(Month);
    UpDownYear.Position  := Year;
    UpDownMonth.Position := Month;
  end;  }
end;


procedure TFrmDefPeriods.EnterYStartDate(Sender: TObject);
var
  fField:TField;
begin
  DM.SrcGLYear.OnDataChange  := Nil;
  DM.SrcGLPeriods.OnDataChange  := Nil;
  cHasFocus := 'YSTART_DATE';
  fField := DBEditYStartDate.DataSource.DataSet.FieldByName('START_DATE');
  if lShowCalender then RedisplayCalendar(fField, 'GLCalender', self);
//  if lShowCalender then
//    RedisplayCalendar(fField, 'GLCalender', self)
//  else Calender1.Click;
  DM.SrcGLPeriods.OnDataChange  := GlPeriodsDataChange;
  DM.SrcGLYear.OnDataChange  := GlYearDataChange;
end;

procedure TFrmDefPeriods.DBEditYEndDateEnter(Sender: TObject);
var
  fField:TField;
begin
  DM.SrcGLYear.OnDataChange  := Nil;
  DM.SrcGLPeriods.OnDataChange  := Nil;
  cHasFocus := 'YEND_DATE';
  fField := DBEditYEndDate.DataSource.DataSet.FieldByName('END_DATE');
  if lShowCalender then RedisplayCalendar(fField, 'GLCalender', self);
//  if lShowCalender then
//    RedisplayCalendar(fField, 'GLCalender', self)
//  else Calender1.Click;
  DM.SrcGLPeriods.OnDataChange  := GlPeriodsDataChange;
  DM.SrcGLYear.OnDataChange  := GlYearDataChange;
end;

procedure TFrmDefPeriods.SBGridViewClick(Sender: TObject);
begin
  if PageControlPeriod.ActivePage = TabSheetGrid
    then PageControlPeriod.ActivePage := TabSheetEdit
  else PageControlPeriod.ActivePage := TabSheetGrid;
end;


procedure TFrmDefPeriods.GlPeriodsDataChange(Sender: TObject; Field: TField);
var
  fField:Tfield;
  cFieldName:String;
begin
  { TODO -oathite -cWebConvert :  Undeclared identifier: 'SelectedField'
  fField:= DbGridPeriods.SelectedField; }
  cFieldName := fField.Name;
  if ((cFieldName = 'TblGlPeriodsSTART_DATE') or
     (cFieldName = 'TblGlPeriodsEND_DATE'))
     then
  begin
    cHasFocus := Copy(cFieldName, 13, 10);
    RedisplayCalendar(fField, 'GLCalender', self);
  end;
end;

procedure TFrmDefPeriods.GlYearDataChange(Sender: TObject; Field: TField);
begin
end;

procedure TFrmDefPeriods.GlYearNewRecord(DataSet: TDataSet);
begin
    {DM.TblGlYearSTART_DATE.AsDateTime := Date;
    EnterYStartDate(self);
    DM.TblGlYearDESCRIP.AsString := ' ';}
end;


procedure TFrmDefPeriods.BtnCreatePeriodsClick(Sender: TObject);
var
  dStart, dEnd :TDateTime;
  nPeriods, nMonths:Integer;
begin
  //FreeCalender;
  nPeriods := GetPeriods;
  if (DM.TblGlYear.State in [dsEdit, dsInsert]) then DM.TblGlYear.Post;
  DM.TblGlPeriods.Cancel;
  if nPeriods <> 0 then
  begin
    with DM.TblGlYear do
    begin
      dStart   := FieldByName('START_DATE').AsDateTime;
      dEnd     := FieldByName('END_DATE').AsDateTime;
    end;
    CheckFiscalYearDates(dStart, dEnd, nPeriods);
//    CheckOverlappingGlYears(dStart, dEnd);
    nMonths  := GetMonths(dStart, dEnd);
    RemoveExistingPeriods;
    if (nPeriods - nMonths) = 0
      then AssignMonthlyPeriods(dStart, dEnd, nPeriods)
      else AssignPeriods(dStart, dEnd, nPeriods);
  end;
end;

procedure TFrmDefPeriods.CheckFiscalYearDates(dStart, dEnd:TdateTime; nPeriods:Integer);
begin
//  if Empty(DBEditDescrip.Text) then
//    raise Exception.Create('Description field is empty');

//  if ( dStart = 0) or ( dEnd = 0) then
//    raise Exception.Create('Both Start and End Dates of the fiscal year must be filled up');

//  if dStart > dEnd then
//    raise Exception.Create('End date must be greater then the Start date');

  if nPeriods = 0 then
    raise Exception.Create(gl_rscstr.cTXT0000063 {'The number of periods must be greater than zero.'});

  if (dEnd - dStart + 1)/nPeriods < 1 then
    // 'There are not enough days in the fiscal year to divide into %d periods'
    raise Exception.Create(Format(gl_rscstr.cTXT0000064,[nPeriods]));
end;

procedure TFrmDefPeriods.CheckOverlappingGlYears(dStart, dEnd:TDateTime; AID:Real);
var
  ACount:Real;
  ADate:TDateTime;
  nId:Real;
begin
  nId := SelectValueFmtAsFloat('select id ' +
                   'from glyear ' +
                   'where (To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date ' +
                   'or To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date) and id <> %f and NVL(eplant_id, 0) = %f'
                    ,[FormatDateTime('mm/dd/yyyy', dStart),
                      FormatDateTime('mm/dd/yyyy', dEnd),
                      AId,
                      DM.TblGlYearEPLANT_ID.asFloat]);
  if nId <> 0 then
//    if nId <> DM.TblGlYear.FieldByName('ID').AsFloat then
     raise Exception.Create('Start and End dates overlap with another G/L year');

  ACount := SelectValueFmtAsFloat('select count(id) from glyear ' +
                      'where end_date < To_Date(''%s'', ''MM/DD/RRRR'') and NVL(eplant_id, 0) = %f',
                      [FormatDateTime('mm/dd/yyyy', dStart),
                       DM.TblGlYearEPLANT_ID.asFloat]);

  if ACount <> 0 then
  begin
    ADate := SelectValueFmtAsFloat('select max(end_date) ' +
                       'from glyear ' +
                       'where end_date < To_Date(''%s'', ''MM/DD/RRRR'')',
                       [FormatDateTime('mm/dd/yyyy', dStart)]);

    if Trunc(ADate) + 1  < dStart then
       // 'The GL year must start one day after the previous GL year ended'
       raise Exception.Create(gl_rscstr.cTXT0000065);
  end;

end;


procedure TFrmDefPeriods.AssignPeriods(dStart, dEnd:TdateTime; nPeriods:Integer);
var
  nNumOfDays, i:Integer;
begin
  nNumOfDays := Trunc((dEnd - dStart)/nPeriods);
  //nNumOfDays := CalculateNumOfDays(dStart, dEnd, nPeriods);
  with DM.TblGlPeriods do
  begin
    for i := 1 to nPeriods do
    begin
      Insert;
      FieldByName('PERIOD').AsInteger := i;

      FieldByName('START_DATE').AsDateTime := dStart;
      if i = nPeriods then
        FieldByName('END_DATE').AsDateTime := dEnd
      else
        FieldByName('END_DATE').AsDateTime := dStart + nNumOfDays - 1;

      FieldByName('GLYEAR_ID').AsFloat := DM.TblGlYear.FieldByName('ID').AsFloat;
      Post;
      dStart := dStart + nNumOfDays;
    end;
  end;
end;

function TFrmDefPeriods.CalculateNumOfDays(dStart, dEnd:TdateTime; nPeriods:Integer):Integer;
var
  nNumOfDays, i:Integer;
begin
  {nNumOfDays := Trunc((dEnd - dStart)/nPeriods);
  while not ProperInterval(nNumOfDays, nPeriods, dStart, dEnd) do nNumOfDays := nNumOfDays - 1;
  Result := nNumOfDays;}
end;

function TFrmDefPeriods.ProperInterval(nNumOfDays, nPeriods:Integer; dStart, dEnd:TdateTime):Boolean;
var
  i:integer;
begin
{  if nNumOfDays < 1 then
    raise Exception.Create(Format('There is not enough days in the fiscal year to divide properly into %d periods',[nPeriods]));
  Result := True;
    for i := 1 to nPeriods do
    begin
      dStart := dStart + nNumOfDays + 1;
      if i = nPeriods then
        if dStart >= dEnd then Result := False;
    end;}
end;



function TFrmDefPeriods.FindCalenderForm(cFormName:String; MySelf:TComponent):TUniForm;
var
  i:Integer;
begin
  Result := nil;
  for i := 0 to Screen.FormCount - 1 do
    if (Screen.Forms[i].Name = cFormName) then
      if (Myself.Owner = Screen.Forms[i].Owner.Owner) then
      begin
        { TODO -oathite -cWebConvert :  Incompatible types: 'TUniForm' and 'TForm'
        Result := Screen.Forms[i]; }
        Exit;
      end;
end;

procedure TFrmDefPeriods.FreeCalender;
var
  Form:TUniForm;
begin
  Form := FindCalenderForm('GLCalender', self);
  if Form <> nil then
  begin
    { TODO -oathite -cWebConvert : Depends on Glcalend
    TGLCalender(Form).Free; }
    lShowCalender := False;
  end;
end;

procedure TFrmDefPeriods.CheckPeriodsValues;
var
  nId:Real;
  dStart:TDateTime;
  i, nPeriods:Integer;
begin
  with DM.TblGlPeriods do
    if (State in [dsEdit, dsInsert]) then Post;
  dStart   := 0;
  i        := 0;
  nPeriods := Trunc(SelectValueAsFloat(IQFormat('select Count(id) from glperiods where glyear_id = %f', [DM.TblGLYearID.AsFloat])));
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select period, ' +
                   'start_date, ' +
                   'end_date ' +
                   'from glperiods ' +
                   'where glyear_id = %f ' +
                   'order by period', [DM.TblGLYearID.AsFloat]));
    Open;
    while not Eof do
    begin
      Inc(i);
      if i = 1 then
        if FieldByName('START_DATE').asDateTime <> DM.TblGlYearSTART_DATE.asDateTime
          // 'First period must start with the start date of the fiscal year'
          then raise Exception.Create(gl_rscstr.cTXT0000066);


      if FieldByName('START_DATE').asDateTime > FieldByName('END_DATE').asDateTime
        then raise Exception.Create(Format(gl_rscstr.cTXT0000067, // 'Dates mismatch at period, %s'
                                           [FieldByName('PERIOD').asString]));
      if i <> 1 then
        if (FieldByName('START_DATE').asDateTime - dStart) <> 1
          {'The Start Date of period, %s, must be 1 day greater than ' +
           'the End Date of the prior period.'}
          then raise Exception.Create(Format(gl_rscstr.cTXT0000068,
                                             [FieldByName('PERIOD').asString]));
      dStart := FieldByName('END_DATE').asDateTime;

      if i = nPeriods then
        if FieldByName('END_DATE').asDateTime <> DM.TblGlYearEND_DATE.asDateTime
          // 'The last period must end with the end date of the fiscal year.'
          then raise Exception.Create(gl_rscstr.cTXT0000069);

      Next;
    end;
  finally
    free;
  end;
end;

procedure TFrmDefPeriods.CheckAndAssignNumberOfPerods;
var
  nNumOfPeriods:Integer;
  nId:Real;
begin
  {nId := DM.TblGLYearID.AsFloat;
  nNumOfPeriods := Trunc(SelectValueAsFloat(Format('select Count(id) ' +
                   'from glperiods ' +
                   'where glyear_id = %f' , [nId])));

  if nNumOfPeriods = 0 then
    raise Exception.Create('Number of periods cannot be zero.');

  ExecuteCommand(Format('update glyear set num_periods = %d where id = %f', [nNumOfPeriods, nId]));}
end;

function TFrmDefPeriods.GetPeriods:Integer;
var
  Value:String;
begin
  Result := 0;
  Value := '12';
  while Result = 0 do
    try
      if not IqInputQuery(gl_rscstr.cTXT0000070, // 'Periods'
        gl_rscstr.cTXT0000071, // 'Please enter number of periods'
        Value) then Exit;
      Result := StrToInt(Value);
    except
      // 'Number of periods must be a numeric value between 1 and 99.'
      IQMS.Common.Dialogs.IQError(gl_rscstr.cTXT0000072);
      Result := 0;
    end;
end;

function TFrmDefPeriods.GetMonths(dStart, dEnd:TDateTime):Integer;
var
  sYear, sMonth, sDay: Word;
  eYear, eMonth, eDay: Word;
  nAdditionalMonth:Integer;
begin
  nAdditionalMonth := 0;
  Result := 0;
  DecodeDate(dStart, sYear, sMonth, sDay);
  DecodeDate(dEnd, eYear, eMonth, eDay);

  if (sMonth = 12) then
  begin
    sMonth := 1;
    sYear := sYear + 1;
    nAdditionalMonth := 1;
  end;
//  else sMonth := sMonth + 1;

  if eYear = sYear then
    Result := eMonth - sMonth + 1
  else
    Result := (12 - sMonth + 1) + (eYear - sYear - 1) * 12 + eMonth;

  Result := Result + nAdditionalMonth;

end;

procedure TFrmDefPeriods.AssignMonthlyPeriods(dStart, dEnd:TdateTime; nPeriods:Integer);
var
  i:integer;
  dDate: TDateTime;
  sYear, sMonth, sDay: Word;
begin
  dDate  := dStart;
  try
    with DM.TblGlPeriods do
      for i := 1 to nPeriods do
      begin
        Insert;
        FieldByName('PERIOD').AsInteger := i;

        FieldByName('START_DATE').AsDateTime := dStart;
        DecodeDate(dStart, sYear, sMonth, sDay);
        if (sMonth = 12) then
        begin
          sMonth := 1;
          sYear := sYear + 1;
        end
        else sMonth := sMonth + 1;
        dDate := EncodeDate(sYear, sMonth, 1);
        if i = nPeriods then
          FieldByName('END_DATE').AsDateTime := dEnd
        else
          FieldByName('END_DATE').AsDateTime := (dDate - 1);

        dStart := dDate;
        FieldByName('GLYEAR_ID').AsFloat := DM.TblGlYear.FieldByName('ID').AsFloat;
        Post;
      end;
//      ListOfGlYearId.Add
    except
      raise Exception.Create(gl_rscstr.cTXT0000073 {'Could not append periods'});
    end;
end;

procedure TFrmDefPeriods.RemoveExistingPeriods;
begin
  ExecuteCommand(IQFormat('delete from glperiods where glyear_id = %f', [DM.TblGLYearID.AsFloat]));
  DM.TblGlPeriods.Refresh;
end;

procedure TFrmDefPeriods.PStartDateChange(Sender: TField);
begin
  if lShowCalender then RedisplayCalendar(Sender, 'GLCalender', self);
end;

procedure TFrmDefPeriods.PEndDateChange(Sender: TField);
begin
  if lShowCalender then RedisplayCalendar(Sender, 'GLCalender', self);
end;

procedure TFrmDefPeriods.YStartDateChange(Sender: TField);
begin
  if lShowCalender then RedisplayCalendar(Sender, 'GLCalender', self);
end;

procedure TFrmDefPeriods.YEndDateChange(Sender: TField);
begin
  if lShowCalender then RedisplayCalendar(Sender, 'GLCalender', self);
end;

procedure TFrmDefPeriods.GetAllExistingGlYears;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add('Select id from glyear');
    Open;
    while not eof do
    begin
      ListOfGlYearId.Add( Pointer(FieldByName('ID').AsInteger) );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmDefPeriods.GlYearBeforePost(DataSet: TDataSet);
var
  dStart, dEnd :TDateTime;
begin
  with DM.TblGlYear do
  begin
    dStart   := FieldByName('START_DATE').AsDateTime;
    dEnd     := FieldByName('END_DATE').AsDateTime;
  end;

  if DM.TblGlYearEPLANT_ID.AsFloat = 0 then
    if SecurityManager.EPlantsExist then
    begin
      if SecurityManager.EPlant_ID <> 'NULL' then
      begin
        if SelectValueFmtAsString('select NVL(SEPARATE_FISCAL_YEAR, ''N'') from eplant where id = %f', [StrToFloat(SecurityManager.EPlant_ID)]) = 'Y' then
          DM.TblGlYearEPLANT_ID.AsFloat := StrToFloat(SecurityManager.EPlant_ID);
      end;
    end;


  CheckOverlappingGlYears(dStart, dEnd, DM.TblGlYearID.asFloat);

  if Empty(DBEditDescrip.Text) then
    raise Exception.Create(gl_rscstr.cTXT0000074 {'Please enter value for Description.'});

  if ( dStart = 0) or ( dEnd = 0) then
    // 'Both Start and End Dates of the fiscal year must be provided.'
    raise Exception.Create(gl_rscstr.cTXT0000075);

  if dStart > dEnd then
    // 'The End Date must be greater then the Start Date.'
    raise Exception.Create(gl_rscstr.cTXT0000076);

  IQAssignIDBeforePost(DataSet);
{  if not CheckListOfGlYearId then
    if IqConfirmYN(cWarning) then
    begin
      DataSet.Cancel;
      Abort
    end;}
end;

procedure TFrmDefPeriods.GlYearBeforeDelete(DataSet: TDataSet);
begin
 { if not CheckListOfGlYearId then
    if IqConfirmYN(cWarning) then
    begin
      DataSet.Cancel;
      Abort
    end;}
end;

procedure TFrmDefPeriods.GlPeriodsBeforePost(DataSet: TDataSet);
begin
{  if not CheckListOfGlYearId then
    if IqConfirmYN(cWarning) then
    begin
      DataSet.Cancel;
      Abort
    end;}
//  if SelectValueFmtAsFloat('select count(id) from glbatchid where glperiods_id = %f',
//              [DM.TblGlPeriods.FieldByName('ID').asFloat]) <> 0 then
//    raise Exception.Create('Cannot change period, there are postings against it.');

  with DM.TblGLPeriods do
  begin
    if (FieldByName('PERIOD').asFloat <> DM.Period) or
       (FieldByName('START_DATE').asDateTime <> DM.StartDate) or
       (FieldByName('END_DATE').asDateTime <> DM.EndDate) then
      if SelectValueFmtAsFloat('select count(id) from glbatchid where glperiods_id = %f',
                  [FieldByName('ID').asFloat]) <> 0 then
        // 'There are postings against the selected period.  It cannot be changed.'
        raise Exception.Create(gl_rscstr.cTXT0000077);

      if FieldByName('AP_STATUS').asString = 'False' then
        FieldByName('AP_STATUS').asString := 'N/O';

      if FieldByName('AR_STATUS').asString = 'False' then
        FieldByName('AR_STATUS').asString := 'N/O';

      if FieldByName('GL_STATUS').asString = 'False' then
        FieldByName('GL_STATUS').asString := 'N/O';

      if FieldByName('INV_STATUS').asString = 'False' then
        FieldByName('INV_STATUS').asString := '';


    if ((FieldByName('AP_STATUS').asString = 'FINAL') and (FieldByName('AP_STATUS').asString <> DM.ApStatus)) or
       ((FieldByName('AR_STATUS').asString = 'FINAL') and (FieldByName('AR_STATUS').asString <> DM.ArStatus)) or
       ((FieldByName('GL_STATUS').asString = 'FINAL') and (FieldByName('GL_STATUS').asString <> DM.GlStatus)) then
       // 'Setting the status to FINAL is irreversable.  Do you want to continue?'
      if not IQConfirmYN(gl_rscstr.cTXT0000078) then Abort;
    CheckUnpostedGL;
    CheckUnpostedAP;
    CheckUnpostedAR;
  end;
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmDefPeriods.CheckUnpostedAP;
var
  AStatus:String;
  ACDCount, AAPCount:Integer;
  AModules: TStringList;
  AStr:String;
begin
  AModules := NIL;
  with DM.TblGLPeriods do
  try
    AModules := TStringList.Create;

    AStatus := SelectValueFmtAsString('select ap_status from glperiods where id = %f', [FieldByName('ID').AsFloat]);

    if ((AStatus = 'OPEN') or (AStatus = '')) and
       ((FieldByName('AP_STATUS').asString = 'CLOSED') or (FieldByName('AP_STATUS').asString = 'FINAL')) then
    begin
      ACDCount := Trunc(SelectValueFmtAsFloat('select count(id) from cdprepost_control where glperiods_id = %f',
                            [FieldByName('ID').asFloat]));
      AAPCount := Trunc(SelectValueFmtAsFloat('select count(id) from apprepost where glperiods_id_ap = %f',
                            [FieldByName('ID').asFloat]));

      if ACDCount <> 0 then
         AModules.Add(gl_rscstr.cTXT0000081 {'Cash Disbursements'});

      if AAPCount <> 0 then
         AModules.Add(gl_rscstr.cTXT0000082 {'Accounts Payable Invoices'});

      if AModules.Count > 0 then
      begin
        AStr := gl_rscstr.cTXT0000079 + #13#13 + // 'The following module(s) have unposted entries for this period:'
                           AModules.Text + #13#13 +
                           gl_rscstr.cTXT0000080;
        if not IQConfirmYNWithSecurity( AStr, 'GLperiods_Setup', false) then
          FieldByName('AP_STATUS').asString := Astatus;
      end;
//        if not IQConfirmYN(gl_rscstr.cTXT0000079 + #13#13 + // 'The following module(s) have unposted entries for this period:'
//                           AModules.Text + #13#13 +
//                           gl_rscstr.cTXT0000080 // 'Do you wish to continue?'
//                           ) then
//          FieldByName('AP_STATUS').asString := Astatus;
    end;
  finally
    if Assigned(AModules) then AModules.Free;
  end;
end;

procedure TFrmDefPeriods.CheckUnpostedAR;
var
  AStatus:String;
  AModules: TStringList;
  ACRCount, AARCount:Integer;
  AStr:String;
begin
  AModules := NIL;
  with DM.TblGLPeriods do
  try
     AModules := TStringList.Create;

    AStatus := SelectValueFmtAsString('select ar_status from glperiods where id = %f', [FieldByName('ID').AsFloat]);

    if ((AStatus = 'OPEN') or (AStatus = '')) and
       ((FieldByName('AR_STATUS').asString = 'CLOSED') or (FieldByName('AR_STATUS').asString = 'FINAL')) then
    begin

      ACRCount := Trunc(SelectValueFmtAsFloat('select count(id) from crprepost_control where glperiods_id = %f',
                            [FieldByName('ID').asFloat]));
      AARCount := Trunc(SelectValueFmtAsFloat('select count(id) from arprepost where glperiods_id_ar = %f',
                            [FieldByName('ID').asFloat]));

      if ACRCount <> 0 then
         AModules.Add(gl_rscstr.cTXT0000083 {'Cash Receipts'});

      if AARCount <> 0 then
         AModules.Add(gl_rscstr.cTXT0000084 {'Invoicing'});

      if AModules.Count > 0 then
      begin
        AStr := gl_rscstr.cTXT0000079 + #13#13 + // 'The following module(s) have unposted entries for this period:'
                           AModules.Text + #13#13 +
                           gl_rscstr.cTXT0000080;
        if not IQConfirmYNWithSecurity( AStr, 'GLperiods_Setup', false) then
          FieldByName('AP_STATUS').asString := Astatus;

      end;
//        if not IQConfirmYN(gl_rscstr.cTXT0000079 + #13#13 + // 'The following module(s) have unposted entries for this period:'
//                           AModules.Text + #13#13 +
//                           gl_rscstr.cTXT0000080 // 'Do you wish to continue?'
//                           ) then
//          FieldByName('AR_STATUS').asString := Astatus;
    end;
  finally
    if Assigned(AModules) then AModules.Free;
  end;
end;

procedure TFrmDefPeriods.CheckUnpostedGL;
var
  AStatus:String;
  AGLCount, APRCount:Integer;
  AModules: TStringList;
  AStr:String;
begin
  with DM.TblGLPeriods do
  try
     AModules := TStringList.Create;
    AStatus := SelectValueFmtAsString('select gl_status from glperiods where id = %f', [FieldByName('ID').AsFloat]);

    if ((AStatus = 'OPEN') or (AStatus = '')) and
       ((FieldByName('GL_STATUS').asString = 'CLOSED') or (FieldByName('GL_STATUS').asString = 'FINAL')) then
    begin
      AGLCount := Trunc(SelectValueFmtAsFloat('select count(id) from v_glprepost_cycle where period_id = %f',
                            [FieldByName('ID').asFloat]));
      APRCount := Trunc(SelectValueFmtAsFloat('select count(id) from PR_PREPOST_CONTROL where GLPERIODS_ID_PR = %f',
                            [FieldByName('ID').asFloat]));

      if AGLCount <> 0 then
         AModules.Add(gl_rscstr.cTXT0000085 {'General Journal'});

      if APRCount <> 0 then
         AModules.Add(gl_rscstr.cTXT0000086 {'Payroll'});

      if AModules.Count > 0 then
      begin
        AStr := gl_rscstr.cTXT0000079 + #13#13 + // 'The following module(s) have unposted entries for this period:'
                           AModules.Text + #13#13 +
                           gl_rscstr.cTXT0000080;
        if not IQConfirmYNWithSecurity( AStr, 'GLperiods_Setup', false) then
          FieldByName('AP_STATUS').asString := Astatus;

      end;


//      if AModules.Count > 0 then
//        if not IQConfirmYN(gl_rscstr.cTXT0000079 + #13#13 + // 'The following module(s) have unposted entries for this period:'
//                           AModules.Text + #13#13 +
//                           gl_rscstr.cTXT0000080 // 'Do you wish to continue?'
//                           ) then
//          FieldByName('GL_STATUS').asString := Astatus;
    end;
  finally
     if Assigned(AModules) then AModules.Free;
  end;
end;



procedure TFrmDefPeriods.GlPeriodsBeforeDelete(DataSet: TDataSet);
begin
{  if not CheckListOfGlYearId then
    if IqConfirmYN(cWarning) then
    begin
      DataSet.Cancel;
      Abort
    end;}
end;

{function TFrmDefPeriods.CheckListOfGlYearId:Boolean;
begin
  Result := True;
  if ListOfGlYearId <> nil then
    if ListOfGlYearId.IndexOf(Pointer(DM.TblGlYear.FieldByName('ID').asInteger)) >= 0 then
    begin
      Result := False;
      Exit;
    end;
end;}


procedure TFrmDefPeriods.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   DM.TblGlYear.CheckBrowseMode;
   DM.TblGlPeriods.CheckBrowseMode;
  CheckPeriodsValues;
end;

(*procedure TFrmDefPeriods.NavYearBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button in  [nbFirst, nbPrior, nbNext, nbLast] then CheckPeriodsValues;
end;

procedure TFrmDefPeriods.NavPeriodBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    with DM.tblGlPeriods do
    begin
      Append;
      ABORT;
    end;
end;   *)

procedure TFrmDefPeriods.TblGlPeriodsINV_STATUSValidate(Sender: TField);
begin
  with DM.TblGlPeriods do
    if not ((FieldByName('INV_STATUS').asString = 'CLOSED') or
            (FieldByName('INV_STATUS').asString = '')) then
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
      DBGridPeriods.EditorMode := false; }
      raise Exception.Create('Invalid value for the ''INV Status'' field');
    end;
end;


procedure TFrmDefPeriods.TblGlPeriodsAP_STATUSValidate(Sender: TField);
var
  AStatus, AModules:String;
  ACDCount, AAPCount:Integer;
begin
  with DM.TblGlPeriods do
  begin
    AStatus := SelectValueFmtAsString('select ap_status from glperiods where id = %f', [FieldByName('ID').AsFloat]);
    if AStatus = 'FINAL' then
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
      DBGridPeriods.EditorMode := false; }
      raise Exception.Create(gl_rscstr.cTXT0000087 {'Cannot reverse FINAL status'});
    end;

    if FieldByName('AP_STATUS').asString = 'False' then
      FieldByName('AP_STATUS').asString := '';

    if not ((FieldByName('AP_STATUS').asString = 'CLOSED') or
            (FieldByName('AP_STATUS').asString = 'FINAL') or
            (FieldByName('AP_STATUS').asString = 'N/O') or
            (FieldByName('AP_STATUS').asString = 'OPEN') or
            (FieldByName('AP_STATUS').asString = '')) then
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
      DBGridPeriods.EditorMode := false; }
      raise Exception.Create('Invalid value for the ''AP Status'' field');
    end;

    if (FieldByName('AP_STATUS').asString = 'OPEN') and
       (FieldByName('GL_STATUS').asString <> 'OPEN') then
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
      DBGridPeriods.EditorMode := false; }
      raise Exception.Create(gl_rscstr.cTXT0000088 {'Cannot open since GL Status is not opened'});
    end;
  end;
end;

procedure TFrmDefPeriods.TblGlPeriodsAR_STATUSValidate(Sender: TField);
begin
  with DM.TblGlPeriods do
  begin
    if SelectValueFmtAsString('select ar_status from glperiods where id = %f', [FieldByName('ID').AsFloat]) = 'FINAL' then
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
      DBGridPeriods.EditorMode := false; }
      raise Exception.Create(gl_rscstr.cTXT0000087 {'Cannot reverse FINAL status'});
    end;

    if FieldByName('AR_STATUS').asString = 'False' then
      FieldByName('AR_STATUS').asString := '';

    if not ((FieldByName('AR_STATUS').asString = 'CLOSED') or
            (FieldByName('AR_STATUS').asString = 'FINAL') or
            (FieldByName('AR_STATUS').asString = 'N/O') or
            (FieldByName('AR_STATUS').asString = 'OPEN') or
            (FieldByName('AR_STATUS').asString = '')) then
            begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
              DBGridPeriods.EditorMode := false; }
              raise Exception.Create(gl_rscstr.cTXT0000089 {'Invalid value for the AR Status.'});
            end;
    if (FieldByName('AR_STATUS').asString = 'OPEN') and
       (FieldByName('GL_STATUS').asString <> 'OPEN') then
       begin
         { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
         DBGridPeriods.EditorMode := false; }
         raise Exception.Create(gl_rscstr.cTXT0000090 {'Cannot open since GL Status is not opened'});
       end;
  end;
end;

procedure TFrmDefPeriods.TblGlPeriodsGL_STATUSValidate(Sender: TField);
begin
  with DM.TblGlPeriods do
  begin
    if SelectValueFmtAsString('select gl_status from glperiods where id = %f', [FieldByName('ID').AsFloat]) = 'FINAL' then
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
      DBGridPeriods.EditorMode := false; }
      raise Exception.Create(gl_rscstr.cTXT0000087 {'Cannot reverse FINAL status'});
    end;

    if FieldByName('GL_STATUS').asString = 'False' then
      FieldByName('GL_STATUS').asString := '';


    if not ((FieldByName('GL_STATUS').asString = 'CLOSED') or
            (FieldByName('GL_STATUS').asString = 'FINAL') or
            (FieldByName('GL_STATUS').asString = 'N/O') or
            (FieldByName('GL_STATUS').asString = 'OPEN') or
            (FieldByName('GL_STATUS').asString = '')) then
            begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
              DBGridPeriods.EditorMode := false; }
              raise Exception.Create(gl_rscstr.cTXT0000091 {'Invalid value for GL Status.'});
            end;

    if ((FieldByName('GL_STATUS').asString = 'CLOSED') or
        (FieldByName('GL_STATUS').asString = 'FINAL') or
        (FieldByName('GL_STATUS').asString = '')) and
        ((FieldByName('AR_STATUS').asString = 'OPEN') or
         (FieldByName('AP_STATUS').asString = 'OPEN'))
        then
        begin
          { TODO -oathite -cWebConvert : Undeclared identifier: 'EditorMode'
          DBGridPeriods.EditorMode := false; }
          // 'Cannot close GL status when AP or AR are not closed'
          raise Exception.Create(gl_rscstr.cTXT0000092);
        end;
  end;
end;


procedure TFrmDefPeriods.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDefPeriods.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmDefPeriods.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmDefPeriods.HelpContents1Click(Sender: TObject);
begin
//  Application.HelpContext(6);
  IQHelp.HelpContext( 1056572 );
end;

procedure TFrmDefPeriods.sbtnEPlantClick(Sender: TObject);
begin
  DoChangePlantID( DM.TblGlYear ); {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmDefPeriods.SBSearchPurchClick(Sender: TObject);
begin
  with DM.PKGLYear do
    if Execute then
      DM.TblGlYear.Locate('ID', GetValue('ID'), [])
    else
      Abort;

end;

procedure TFrmDefPeriods.ClearINVStatus1Click(Sender: TObject);
begin
  with DM.TblGlPeriods do
    if not (State in [dsEdit, dsInsert]) then Edit;

  DM.TblGlPeriods.FieldByName('INV_STATUS').asString := '';

end;


procedure TFrmDefPeriods.wwCBAPClosedClick(Sender: TObject);
begin
  if wwCBAPClosed.Checked then
  begin
    wwCBAPFinal.Checked := false;
    wwCBAPNO.Checked := false;
    wwCBAPOpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBAPFinalClick(Sender: TObject);
begin
  if wwCBAPFinal.Checked then
  begin
    wwCBAPClosed.Checked := false;
    wwCBAPNO.Checked := false;
    wwCBAPOpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBAPNOClick(Sender: TObject);
begin
  if wwCBAPNO.Checked then
  begin
    wwCBAPClosed.Checked := false;
    wwCBAPFinal.Checked := false;
    wwCBAPOpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBAPOpenClick(Sender: TObject);
begin
  if wwCBAPOpen.Checked then
  begin
    wwCBAPClosed.Checked := false;
    wwCBAPFinal.Checked := false;
    wwCBAPNO.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBGLClosedClick(Sender: TObject);
begin
  if wwCBGLClosed.Checked then
  begin
    wwCBGLFinal.Checked := false;
    wwCBGLNO.Checked := false;
    wwCBGLOpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBGLFinalClick(Sender: TObject);
begin
  if wwCBGLFinal.Checked then
  begin
    wwCBGLClosed.Checked := false;
    wwCBGLNO.Checked := false;
    wwCBGLOpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBGLNOClick(Sender: TObject);
begin
  if wwCBGLNO.Checked then
  begin
    wwCBGLClosed.Checked := false;
    wwCBGLFinal.Checked := false;
    wwCBGLOpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBGLOpenClick(Sender: TObject);
begin
  if wwCBGLOpen.Checked then
  begin
    wwCBGLClosed.Checked := false;
    wwCBGLFinal.Checked := false;
    wwCBGLNO.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBInvClosedClick(Sender: TObject);
begin
  if not wwCBINVClosed.Checked then
  begin
    with DM.TblGlPeriods do
      if not (State in [dsEdit, dsInsert]) then Edit;

    DM.TblGlPeriods.FieldByName('INV_STATUS').asString := '';
  end;
end;

procedure TFrmDefPeriods.wwCBARClosedClick(Sender: TObject);
begin
  if wwCBARClosed.Checked then
  begin
    wwCBARFinal.Checked := false;
    wwCBARNO.Checked := false;
    wwCBAROpen.Checked := false;
  end;
end;



procedure TFrmDefPeriods.wwCBARFinalClick(Sender: TObject);
begin
  if wwCBARFinal.Checked then
  begin
    wwCBARClosed.Checked := false;
    wwCBARNO.Checked := false;
    wwCBAROpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBARNOClick(Sender: TObject);
begin
  if wwCBARNO.Checked then
  begin
    wwCBARClosed.Checked := false;
    wwCBARFinal.Checked := false;
    wwCBAROpen.Checked := false;
  end;
end;

procedure TFrmDefPeriods.wwCBAROpenClick(Sender: TObject);
begin
  if wwCBAROpen.Checked then
  begin
    wwCBARClosed.Checked := false;
    wwCBARFinal.Checked := false;
    wwCBARNO.Checked := false;
  end;
end;

procedure TFrmDefPeriods.PKGLYearIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmDefPeriods.New1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'BtnClick'
  NavYear.BtnClick(nbInsert); }
end;

procedure TFrmDefPeriods.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depend on IQSecIns
  EnsureSecurityInspectorOnTopOf( self ); }
end;



end.
