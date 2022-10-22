unit tl_param;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  Vcl.Buttons,
  Shop_Shr,
  FireDAC.UI.Intf,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmTlParam = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Calendar1: TUniMenuItem;
    SetDefaultCalendar1: TUniMenuItem;
    AddHolidays1: TUniMenuItem;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    SecurityRegister1: TIQWebSecurityRegister;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PnlParams: TUniPanel;
    SrcParam: TDataSource;
    QryParam: TFDQuery;
    FDUpdateSQL_Param: TFDUpdateSQL;
    QryParamID: TBCDField;
    QryParamDESCRIP: TStringField;
    QryParamSHIFTS: TBCDField;
    QryParamSHIFT_START1: TStringField;
    QryParamSHIFT_START2: TStringField;
    QryParamSHIFT_START3: TStringField;
    QryParamSHIFT_START4: TStringField;
    QryParamHRS_DAY: TBCDField;
    QryParamDAYS_WEEK: TBCDField;
    gbCalendar: TUniGroupBox;
    gbShifts: TUniGroupBox;
    PnlCalendarClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCalendarLeft01: TUniPanel;
    PnlCalendarClient02: TUniPanel;
    PnlShiftsClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlShiftsLeft01: TUniPanel;
    PnlShiftsClient02: TUniPanel;
    Label1: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    dbeNumberOfShifts: TUniDBEdit;
    dbeHrsPerDay: TUniDBEdit;
    dbeDaysPerWeek: TUniDBEdit;
    dbeShift1Start: TUniDBEdit;
    dbeShift2Start: TUniDBEdit;
    dbeShift3Start: TUniDBEdit;
    dbeShift4Start: TUniDBEdit;
    lblShift1Start: TUniLabel;
    lblShift2Start: TUniLabel;
    lblShift3Start: TUniLabel;
    lblShift4Start: TUniLabel;
    bvSpacer1: TUniPanel;
    QryParamDuration1: TFloatField;
    QryParamDuration2: TFloatField;
    QryParamDuration3: TFloatField;
    QryParamDuration4: TFloatField;
    Label11: TUniLabel;
    Label10: TUniLabel;
    dbeShift1Duration: TUniDBEdit;
    dbeShift2Duration: TUniDBEdit;
    dbeShift3Duration: TUniDBEdit;
    dbeShift4Duration: TUniDBEdit;
    PnlEPlant: TUniPanel;
    Splitter3: TUniSplitter;
    SrcOrigin: TDataSource;
    QryOrigin: TFDQuery;
    QryOriginORIGIN: TStringField;
    QryOriginSOURCE: TStringField;
    QryOriginID: TFMTBCDField;
    QryOriginSORT: TFMTBCDField;
    wwDBGridOrigin: TIQUniGridControl;
    sbtnDaysPerWeek: TUniSpeedButton;
    PnlToolbar: TUniPanel;
    NavMainDefault: TUniDBNavigator;
    Panel12: TUniPanel;
    Shape3: TUniPanel;
    sbtnCopyFromDefault: TUniSpeedButton;
    PnlDataControls: TUniPanel;
    pcMain: TUniPageControl;
    TabParams: TUniTabSheet;
    TabTimeOff: TUniTabSheet;
    SrcDates: TDataSource;
    QryDates: TFDQuery;
    QryDatesSTART_TIME: TDateTimeField;
    QryDatesEND_TIME: TDateTimeField;
    QryDatesDAY_OFF_TYPE: TBCDField;
    QryDatesID: TBCDField;
    QryDatesEPLANT_ID: TBCDField;
    FDUpdateSQL_Dates: TFDUpdateSQL;
    PGridDaysOff: TUniPopupMenu;
    EditStartandEndTime1: TUniMenuItem;
    AddHoliday1: TUniMenuItem;
    N1: TUniMenuItem;
    SelectAll1: TUniMenuItem;
    UnselectAll1: TUniMenuItem;
    Panel1: TUniPanel;
    sbtnEditPeriod: TUniSpeedButton;
    sbtnMultiSelect: TUniSpeedButton;
    sbtnHolidays: TUniSpeedButton;
    sbtnSelectAll: TUniSpeedButton;
    sbtnUnselectAll: TUniSpeedButton;
    Panel6: TUniPanel;
    shpHolidays: TUniPanel;
    PnlGrid: TUniPanel;
    GridDates: TIQUniGridControl;
    cmbGridDayOffType: TUniDBComboBox;
    QryOriginPARAMS_ID: TFMTBCDField;
    QryParamEPLANT_ID: TBCDField;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryParamCalcFields(DataSet: TDataSet);
    procedure QryParamBeforePost(DataSet: TDataSet);
    procedure SrcParamDataChange(Sender: TObject; Field: TField);
    procedure dbeNumberOfShiftsChange(Sender: TObject);
    procedure sbtnDaysPerWeekClick(Sender: TObject);
    procedure SetDefaultCalendar1Click(Sender: TObject);
    procedure SrcOriginDataChange(Sender: TObject; Field: TField);
    procedure sbtnCopyFromDefaultClick(Sender: TObject);
    procedure EditStartandEndTime1Click(Sender: TObject);
    procedure AddHoliday1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure UnselectAll1Click(Sender: TObject);
    procedure QryDatesBeforeEdit(DataSet: TDataSet);
    procedure QryDatesBeforePost(DataSet: TDataSet);
    procedure QryDatesNewRecord(DataSet: TDataSet);
    procedure sbtnMultiSelectClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryParamAfterPost(DataSet: TDataSet);
    procedure DoSetCheckAssignDefaultDays(Sender: TField);
    procedure DoValidateShiftField(Sender: TField);

{ TODO -oGPatil -cWebConvert : TGridDrawState and TNavigateBtn not present in UniGui
    procedure GridDatesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure NavDatesBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBGridOriginCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure NavMainDefaultBeforeAction(Sender: TObject; Button: TNavigateBtn); }

    procedure QryParamAfterDelete(DataSet: TDataSet);
    procedure QryParamNewRecord(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
  private
    { Private declarations }
    FCheckAssignDefaultDays: Boolean;
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);
    procedure CheckSystemDefaultRowAdded;
    procedure ValidateAllFields; overload;
    procedure ValidateAllFields(var ADuration1, ADuration2, ADuration3,
      ADuration4: Real ); overload;
    procedure SetControls;
    procedure ResetUnusedStartTimes;
    procedure SetDefaultCalendar(const AYear: Integer);
    procedure CreateCalendarRecords(const AYear: Integer;
      const AParamsID, AEPlantID: LargeInt);
    procedure CopyFromDefaultParams(const AEPlantID: Real);
    procedure CopyFromDefaultCalendar;
    procedure AssignShopCalendarWeek(var AShopCalendarWeek: TShopCalendarWeek;
      ASource: string; ASource_ID: Real);
    procedure ResetWorkingDaysShifts(var AShopWeekCalendar: TShopCalendarWeek;
      AValue: Boolean);
    procedure CheckForObsoleteData;
    procedure DeleteObsolete;
    procedure SetButtons;
    function GetDefaultParamsID: LongInt;
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.DATESDLG,
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  iqsecins,  }
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  iqtool_rscstr,
  IQMS.Common.PanelMsg,
  Shop_Cal,
  Shop_Dlg,
  Shop_SU_rscstr,
  IQMS.Common.TimeDlg;

{ TFrmTlParam }

procedure TFrmTlParam.DoSetCheckAssignDefaultDays(Sender: TField);
begin
  FCheckAssignDefaultDays := True;
end;

class procedure TFrmTlParam.DoShowModal;
var
  LFrmTlParam : TFrmTlParam;
begin
  LFrmTlParam := TFrmTlParam.Create(UniGUIApplication.UniApplication);
  LFrmTlParam.ShowModal;
end;

procedure TFrmTlParam.FormCreate(Sender: TObject);
begin
  CheckSystemDefaultRowAdded;
  ReOpen(QryOrigin);
  ReOpen(QryParam);
  ReOpen(QryDates);
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmTlParam'
  IQMS.Common.Controls.CenterForm(Self, True); }

{ TODO -oGPatil -cWebConvert :  Incompatible types: 'TDBNavigator' and 'TUniDBNavigator'
  IQMS.Common.Controls.AutoSizeNavBar(NavMainDefault); }
  pcMain.ActivePageIndex := 0;
end;

procedure TFrmTlParam.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlCalendarLeft01, PnlShiftsLeft01,
    GridDates]);
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  iqsecins.EnsureSecurityInspectorOnTopOf(Self); }
end;

procedure TFrmTlParam.FormActivate(Sender: TObject);
begin
  Application.OnShowHint := DoOnShowHint;
end;

procedure TFrmTlParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnShowHint := NIL;
  if (QryParam.State in [dsEdit]) then
    QryParam.Post;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlCalendarLeft01, PnlShiftsLeft01]);
end;

procedure TFrmTlParam.DoOnShowHint(var HintStr: string; var CanShow: Boolean;
  var HintInfo: THintInfo);
begin
  with HintInfo do
    if HintControl = sbtnMultiSelect then
      begin
        if sbtnMultiSelect.Down then
          // iqtool_rscstr.cTXT0000244 =
          // 'Multi-Select is ON'#13'Click to turn it off';
          HintStr := iqtool_rscstr.cTXT0000244
        else
          // iqtool_rscstr.cTXT0000245 =
          // 'Multi-Select is OFF'#13'Click to turn it on';
          HintStr := iqtool_rscstr.cTXT0000245;
      end;
end;

procedure TFrmTlParam.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTlParam.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmTlParam.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmTlParam.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmTlParam.SetButtons;
begin
{ TODO -oGPatil -cWebConvert : GridDates does not contain Options
  sbtnMultiSelect.Down := (dgMultiSelect in GridDates.Options); }
  sbtnSelectAll.Enabled := sbtnMultiSelect.Down;
  sbtnUnselectAll.Enabled := sbtnMultiSelect.Down;
end;

procedure TFrmTlParam.CheckForObsoleteData;
begin
  // iqtool_rscstr.cTXT0000246 =
  // 'Would you like to delete obsolete scheduled days-off from ' +
  // 'the previous year(s)?';
  if (SelectValue(
    'SELECT 1 FROM tool_calendar WHERE end_time < TO_DATE(' +
    'TRUNC(SYSDATE, ''YEAR'')) AND misc.eplant_filter(eplant_id) = 1 ' +
    'AND ROWNUM < 2') = 1)
    and IQWarningYN(iqtool_rscstr.cTXT0000246)
  then
    begin
      DeleteObsolete;
    end;
end;

procedure TFrmTlParam.DeleteObsolete;
var
  hMsg: TPanelMesg;
begin
  hMsg := hPleaseWait('');
  try
    ExecuteCommand(
      'BEGIN                                                            '#13 +
      '   FOR ds IN (SELECT id                                          '#13 +
      '               FROM tool_calendar                                '#13 +
      '              WHERE end_time < TO_DATE(TRUNC(SYSDATE,            '#13 +
      '                                             ''YEAR'')) AND      '#13 +
      '                    misc.eplant_filter(eplant_id) = 1)           '#13 +
      '   LOOP                                                          '#13 +
      '      DELETE FROM tool_calendar                                  '#13 +
      '            WHERE id = ds.id;                                    '#13 +
      '                                                                 '#13 +
      '      COMMIT;                                                    '#13 +
      '   END LOOP;                                                     '#13 +
      'END;                                                             ');
  finally
    FreeAndNil(hMsg);
  end;
end;

procedure TFrmTlParam.CheckSystemDefaultRowAdded;
var
  s: string;
  AID: Real;
begin
  if SelectValueAsInteger(
    'SELECT COUNT(*) FROM tool_params WHERE eplant_id IS NULL') = 0 then
    begin
      AID := GetNextID('tool_params');
      ExecuteCommandFmt(
        'INSERT INTO tool_params(id,                    '#13 +
        '                        shifts,                '#13 +
        '                        shift_start1,          '#13 +
        '                        shift_start2,          '#13 +
        '                        shift_start3,          '#13 +
        '                        shift_start4,          '#13 +
        '                        hrs_day,               '#13 +
        '                        days_week,             '#13 +
        '                        eplant_id)             '#13 +
        '    VALUES (%.0f,                              '#13 +
        '            1,                                 '#13 +
        '            ''00:00:00'',                      '#13 +
        '            NULL,                              '#13 +
        '            NULL,                              '#13 +
        '            NULL,                              '#13 +
        '            24,                                '#13 +
        '            5,                                 '#13 +
        '            NULL)                              ',
        [AID]);
      TFrmShopCalendar.DoAssignDefaultShiftSilent(Self, Shop_Shr.TOOL_PARAMS,
        AID);
    end;
end;

procedure TFrmTlParam.ValidateAllFields;
var
  ADuration1, ADuration2, ADuration3, ADuration4: Real;
begin
   ValidateAllFields(ADuration1, ADuration2, ADuration3, ADuration4);
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmTlParam.wwDBGridOriginCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if (Field = QryOriginSOURCE) and
    (CompareText(QryOriginORIGIN.AsString, 'EPlant') = 0) and
    (QryOriginPARAMS_ID.AsLargeInt > 0) then
    begin
      if Highlight then
        begin
          ABrush.Color := clBlack;
          AFont.Color := clYellow;
        end
      else
        begin
          ABrush.Color := clWindow;
          AFont.Color := clRed;
        end;
    end;
end; }

procedure TFrmTlParam.SetControls;
begin
  IQMS.Common.Controls.IQEnableControl([lblShift1Start, dbeShift1Start],
    QryParamSHIFTS.AsInteger > 0);
  IQMS.Common.Controls.IQEnableControl([lblShift2Start, dbeShift2Start],
    QryParamSHIFTS.AsInteger > 1);
  IQMS.Common.Controls.IQEnableControl([lblShift3Start, dbeShift3Start],
    QryParamSHIFTS.AsInteger > 2);
  IQMS.Common.Controls.IQEnableControl([lblShift4Start, dbeShift4Start],
    QryParamSHIFTS.AsInteger > 3);
end;

procedure TFrmTlParam.ResetUnusedStartTimes;
var
  ev: TDataSetNotifyEvent;
begin
  try
    ev := QryParam.OnCalcFields;
    QryParam.OnCalcFields := NIL;
    if QryParam.State in [dsEdit, dsInsert] then
      case QryParamSHIFTS.AsInteger of
        1:
          begin
            QryParamSHIFT_START2.AsString := '00:00:00';
            QryParamSHIFT_START3.AsString := '00:00:00';
            QryParamSHIFT_START4.AsString := '00:00:00';
          end;
        2:
          begin
            QryParamSHIFT_START3.AsString := '00:00:00';
            QryParamSHIFT_START4.AsString := '00:00:00';
          end;
        3:
          begin
            QryParamSHIFT_START4.AsString := '00:00:00';
          end;
      end;
  finally
    QryParam.OnCalcFields := ev;
  end;

end;

procedure TFrmTlParam.sbtnDaysPerWeekClick(Sender: TObject);
begin
  if (QryParam.State in [dsEdit]) then
    QryParam.Post;

  if QryParamID.AsLargeInt = 0 then
    Exit;

  TFrmShopCalendar.DoShowModal(Self, Shop_Shr.TOOL_PARAMS,
    QryParamID.AsLargeInt);
end;

procedure TFrmTlParam.dbeNumberOfShiftsChange(Sender: TObject);
begin
  ResetUnusedStartTimes;
  SetControls;
end;

procedure TFrmTlParam.SrcOriginDataChange(Sender: TObject; Field: TField);
begin
  sbtnCopyFromDefault.Visible := CompareText(QryOriginORIGIN.AsString,
    'EPLANT') = 0;
{ TODO -oGPatil -cWebConvert : nbDelete undeclared identifier
  if CompareText(QryOriginORIGIN.AsString, 'System') = 0 then
    NavMainDefault.VisibleButtons := NavMainDefault.VisibleButtons - [nbDelete]
  else
    NavMainDefault.VisibleButtons := NavMainDefault.VisibleButtons + [nbDelete]; }
end;

procedure TFrmTlParam.SrcParamDataChange(Sender: TObject; Field: TField);
begin
  SetControls;
end;

procedure TFrmTlParam.QryParamAfterDelete(DataSet: TDataSet);
begin
  RefreshDataSetByID(QryOrigin);
end;

procedure TFrmTlParam.QryParamAfterPost(DataSet: TDataSet);
begin
  if FCheckAssignDefaultDays or
    (SelectValueFmtAsInteger(
    'SELECT 1 FROM shop_calendar WHERE source = ''TOOL_PARAMS'' AND ' +
    'source_id = %.0f', [QryParamID.AsFloat]) = 0) then
    begin
      FCheckAssignDefaultDays := False;
      TFrmShopCalendar.DoAssignDefaultShiftSilent(Self, Shop_Shr.TOOL_PARAMS,
        QryParamID.AsFloat);
      RefreshDataSetByID(QryOrigin);
    end;
  // Ensure there are no extraneous records
  if QryParamEPLANT_ID.IsNull then
    ExecuteCommandFmt(
      'DELETE FROM tool_params WHERE eplant_id IS NULL and id <> %.0f',
      [QryParamID.AsFloat])
  else
    ExecuteCommandFmt(
      'DELETE FROM tool_params WHERE eplant_id = %.0f and id <> %.0f',
      [QryParamEPLANT_ID.AsFloat, QryParamID.AsFloat]);
end;

procedure TFrmTlParam.QryParamBeforePost(DataSet: TDataSet);
begin
  ValidateAllFields;
end;

procedure TFrmTlParam.QryParamCalcFields(DataSet: TDataSet);
var
  ADuration1, ADuration2, ADuration3, ADuration4: Real;
begin
  ValidateAllFields(ADuration1, ADuration2, ADuration3, ADuration4);

  QryParamDuration1.AsFloat := ADuration1;
  QryParamDuration2.AsFloat := ADuration2;
  QryParamDuration3.AsFloat := ADuration3;
  QryParamDuration4.AsFloat := ADuration4;
end;

procedure TFrmTlParam.QryParamNewRecord(DataSet: TDataSet);
begin
  QryParamID.AsLargeInt := GetNextID('TOOL_PARAMS');
  QryParamEPLANT_ID.AsLargeInt := QryOriginID.AsLargeInt;
end;

procedure TFrmTlParam.DoValidateShiftField(Sender: TField);
begin
  try
    StrToTime(Sender.AsString) // see if you can convert it
  except
    // iqtool_rscstr.cTXT0000251 =
    // 'Invalid Time Specification. Please enter the time in ' +
    // '"HH:MM:SS" format.';
    raise Exception.Create(Sender.DisplayLabel + ' : ' + Sender.AsString +
      ' - ' + iqtool_rscstr.cTXT0000251)
  end;
end;

procedure TFrmTlParam.SetDefaultCalendar1Click(Sender: TObject);
var
  AYear: Integer;
begin
  // Prompt:
  // iqtool_rscstr.cTXT0000250 =
  // 'This option recreates and stores weekends/off shift ' +
  // 'information according to the Project Manager Calendar Setup parameters.';
  if Shop_Dlg.AskYearToSetup(AYear, '', iqtool_rscstr.cTXT0000250) then
    begin
      SetDefaultCalendar(AYear);
      // iqtool_rscstr.cTXT0000252 = 'Done.';
      IQInformation(iqtool_rscstr.cTXT0000252);
    end;
end;

procedure TFrmTlParam.SetDefaultCalendar(const AYear: Integer);
begin
  CreateCalendarRecords(AYear, GetDefaultParamsID, 0);
  // Loop eplants
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT id, ');
      SQL.Add('       eplant_id ');
      SQL.Add('  FROM tool_params');
      SQL.Add(' WHERE eplant_id IS NOT NULL');
      Open;
      while not Eof do
        begin
          // Create the TOOL_PARAMS record for this EPlant
          // CopyFromDefaultParams(Fields[0].AsFloat);
          // Create calendar for this EPlant
          CreateCalendarRecords(AYear, Fields[0].AsLargeInt,
            Fields[1].AsLargeInt);
          Next;
        end;
      ReOpen(QryParam);
      ReOpen(QryDates);
    finally
      Free;
    end;
end;

procedure TFrmTlParam.CreateCalendarRecords(const AYear: Integer;
  const AParamsID, AEPlantID: LargeInt);
var
  AStartDate, AEndDate, ADay: TDateTime;
  AShiftStart1: string;
  ADuration1, ADuration2, ADuration3, ADuration4: Real;
  ACalendarWeek: TShopCalendarWeek;
begin
  AShiftStart1 := dbeShift1Start.Text;
  AStartDate := IQStrToDateTime(IQFormat('01/01/%d %s', [AYear, AShiftStart1]));
  AEndDate := IQStrToDateTime(IQFormat('01/01/%d %s',
    [AYear + 1, AShiftStart1]));

  AssignShopCalendarWeek(ACalendarWeek, 'TOOL_PARAMS', AParamsID);

  ExecuteCommandParam(
    'DELETE FROM tool_calendar                                      '#13 +
    '      WHERE start_time BETWEEN :start_date AND :end_date AND   '#13 +
    '            NVL(eplant_id, 0) = NVL(:EPLANT_ID, 0)             ',
    ['START_DATE;DATE', 'END_DATE;DATE', 'EPLANT_ID;INT64'],
    [AStartDate, AEndDate, AEPlantID]);

  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Text := QryParam.SQL.Text;
      Params.ParamByName('ID').AsFMTBCD := AEPlantID;
      Open;
      if (Bof and Eof) then
        Exit;
      Shop_Shr.IQSetDurationsEx(
        ADuration1,
        ADuration2,
        ADuration3,
        ADuration4,
        FieldByName('SHIFTS').AsFloat,
        FieldByName('SHIFT_START1').AsString,
        FieldByName('SHIFT_START2').AsString,
        FieldByName('SHIFT_START3').AsString,
        FieldByName('SHIFT_START4').AsString,
        FieldByName('HRS_DAY').AsFloat);
    finally
      Free;
    end;

  ADay := AStartDate;
  while ADay < AEndDate do
    begin
      with TFDStoredProc.Create(nil) do
        try
          Connection := UniMainModule.FDConnection1;
          StoredProcName := 'IQMS.PROJECT_CALENDAR.CHECK_WORKING_CREATE_TIME_OFF';
          Prepare;
          ParamByName('p_start_date').Value := ADay;
          ParamByName('p_eplant_id').Value := AEPlantID;
          ParamByName('p_day_off_type').Value := Shop_Shr.SHIFT_OFF;
          ParamByName('p_shifts_count').Value := QryParamSHIFTS.AsInteger;
          ParamByName('p_duration1').Value := ADuration1;
          ParamByName('p_duration2').Value := ADuration2;
          ParamByName('p_duration3').Value := ADuration3;
          ParamByName('p_duration4').Value := ADuration4;
          ParamByName('p_work1').Value := IQMS.Common.Boolean.BoolToYN(ACalendarWeek[DayOfWeek(ADay)].Mfg1);
          ParamByName('p_work2').Value := IQMS.Common.Boolean.BoolToYN(ACalendarWeek[DayOfWeek(ADay)].Mfg2);
          ParamByName('p_work3').Value := IQMS.Common.Boolean.BoolToYN(ACalendarWeek[DayOfWeek(ADay)].Mfg3);
          ParamByName('p_work4').Value := IQMS.Common.Boolean.BoolToYN(ACalendarWeek[DayOfWeek(ADay)].Mfg4);
          Execute;
        finally
          Free;
        end;
      // increment the day
      ADay := ADay + 1;
    end;
end;

procedure TFrmTlParam.AssignShopCalendarWeek(
  var AShopCalendarWeek: TShopCalendarWeek; ASource: string; ASource_ID: Real);
begin
  ResetWorkingDaysShifts(AShopCalendarWeek, False);

  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('  SELECT working,');
      SQL.Add('         shift,');
      SQL.Add('         week_day');
      SQL.Add('    FROM shop_calendar');
      SQL.Add(Format('   WHERE source = ''%s'' AND', [ASource]));
      SQL.Add(Format('         source_id = %.0f', [ASource_ID]));
      SQL.Add('ORDER BY shift');
      Open;
      while not Eof do
        begin
          if (FieldByName('week_day').AsInteger >= 1) and
            (FieldByName('week_day').AsInteger <= 7) then
            case FieldByName('shift').AsInteger of
              1:
                AShopCalendarWeek[FieldByName('week_day').AsInteger].Mfg1 :=
                  FieldByName('working').AsString = 'Y';
              2:
                AShopCalendarWeek[FieldByName('week_day').AsInteger].Mfg2 :=
                  FieldByName('working').AsString = 'Y';
              3:
                AShopCalendarWeek[FieldByName('week_day').AsInteger].Mfg3 :=
                  FieldByName('working').AsString = 'Y';
              4:
                AShopCalendarWeek[FieldByName('week_day').AsInteger].Mfg4 :=
                  FieldByName('working').AsString = 'Y';
            end;
          Next;
        end;
    finally
      Free;
    end;
end;

procedure TFrmTlParam.ResetWorkingDaysShifts(
  var AShopWeekCalendar: TShopCalendarWeek; AValue: Boolean);
var
  i: Integer;
begin
  for i := 1 to 7 do
    with AShopWeekCalendar[i] do
      begin
        Mfg1 := AValue;
        Mfg2 := AValue;
        Mfg3 := AValue;
        Mfg4 := AValue;
      end;
end;

procedure TFrmTlParam.CopyFromDefaultParams(const AEPlantID: Real);
var
  ADefaultParamsID, AID: Real;
begin
  ADefaultParamsID := GetDefaultParamsID;
  if ADefaultParamsID = 0 then
    Exit;

  // Copy the default params (EPLANT_ID = NULL) to the EPlant
  // 1.) delete the old record
  ExecuteCommandFmt(
    'DELETE FROM shop_calendar WHERE source = ''TOOL_PARAMS'' AND ' +
    'source_id IN (SELECT id FROM tool_params WHERE eplant_id = %.0f)',
    [AEPlantID]);
  ExecuteCommandFmt(
    'DELETE FROM tool_params WHERE eplant_id = %.0f',
    [AEPlantID]);
  // 2.) add the new record
  AID := GetNextID('tool_params');
  ExecuteCommandFmt(
    'INSERT INTO tool_params(id,                   '#13 +
    '                        descrip,              '#13 +
    '                        shifts,               '#13 +
    '                        shift_start1,         '#13 +
    '                        shift_start2,         '#13 +
    '                        shift_start3,         '#13 +
    '                        shift_start4,         '#13 +
    '                        hrs_day,              '#13 +
    '                        days_week,            '#13 +
    '                        eplant_id)            '#13 +
    '   SELECT %.0f,                               '#13 +
    '          descrip,                            '#13 +
    '          shifts,                             '#13 +
    '          shift_start1,                       '#13 +
    '          shift_start2,                       '#13 +
    '          shift_start3,                       '#13 +
    '          shift_start4,                       '#13 +
    '          hrs_day,                            '#13 +
    '          days_week,                          '#13 +
    '          %.0f                                '#13 +
    '     FROM tool_params                         '#13 +
    '    WHERE id = %.0f                           ',
    [AID, AEPlantID, ADefaultParamsID]);

  // 3.) Copy the shop_calendar params
  ExecuteCommandFmt(
    'INSERT INTO shop_calendar(id,                 '#13 +
    '                          source,             '#13 +
    '                          source_id,          '#13 +
    '                          week_day,           '#13 +
    '                          shift,              '#13 +
    '                          working)            '#13 +
    '   SELECT s_shop_calendar.NEXTVAL,            '#13 +
    '          source,                             '#13 +
    '          %.0f,                               '#13 +
    '          week_day,                           '#13 +
    '          shift,                              '#13 +
    '          working                             '#13 +
    '     FROM shop_calendar                       '#13 +
    '    WHERE source = ''TOOL_PARAMS'' AND        '#13 +
    '          source_id = %.0f                    ',
    [AID, ADefaultParamsID]);
end;

procedure TFrmTlParam.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmTOOLING { CHM } , iqhtmTOOLING { HTM } );
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmTlParam.CopyFromDefaultCalendar;
begin
  ExecuteCommandFmt(
    'INSERT INTO tool_calendar(id,                 '#13 +
    '                          eplant_id,          '#13 +
    '                          start_time,         '#13 +
    '                          end_time,           '#13 +
    '                          day_off_type)       '#13 +
    '   SELECT s_tool_calendar.NEXTVAL,            '#13 +
    '          %.0f,                               '#13 +
    '          start_time,                         '#13 +
    '          end_time,                           '#13 +
    '          day_off_type                        '#13 +
    '     FROM tool_calendar                       '#13 +
    '    WHERE eplant_id IS NULL                   ',
    [QryOriginID.AsFloat]);
  ReOpen(QryParam);
end;

procedure TFrmTlParam.sbtnCopyFromDefaultClick(Sender: TObject);
begin
  // iqtool_rscstr.cTXT0000249 =
  // 'Are you sure you wish to copy from the Default Schedule?';
  if IQConfirmYN(iqtool_rscstr.cTXT0000249) then
    begin
      CopyFromDefaultParams(QryOriginID.AsFloat);
      RefreshDataSetByID(QryOrigin);
      ReOpen(QryParam);
      ReOpen(QryDates);
    end;
end;

procedure TFrmTlParam.QryDatesBeforeEdit(DataSet: TDataSet);
begin
  if sbtnMultiSelect.Down then
    begin
      sbtnMultiSelect.Down := False;
      sbtnMultiSelectClick(NIL);
    end;
end;

procedure TFrmTlParam.QryDatesBeforePost(DataSet: TDataSet);
begin
  if (QryDatesSTART_TIME.AsFloat < 1) or
    (QryDatesEND_TIME.AsFloat < 1) then
    // iqtool_rscstr.cTXT0000248 = 'Please enter valid dates.';
    raise Exception.Create(iqtool_rscstr.cTXT0000248);

  if SelectValueFmtAsInteger(
    'SELECT project_calendar.start_time_has_overlaps(       '#13 +
    '       id,                                   '#13 +
    '       eplant_id,                            '#13 +
    '       start_time,                           '#13 +
    '       TO_DATE(''%s'',                       '#13 +
    '               ''MM-DD-RRRR HH24:MI:SS''))   '#13 +
    '       AS n                                  '#13 +
    '  FROM tool_calendar                         '#13 +
    ' WHERE id = %d                               ',
    [FormatDateTime('mm/dd/yyyy hh:nn:ss', QryDatesSTART_TIME.AsDateTime),
    QryDatesID.AsLargeInt]) = 1 then
    raise Exception.Create('Start date overlaps with another period.');

  if SelectValueFmtAsInteger(
    'SELECT project_calendar.end_time_has_overlaps(         '#13 +
    '       id,                                   '#13 +
    '       eplant_id,                            '#13 +
    '       start_time,                           '#13 +
    '       TO_DATE(''%s'',                       '#13 +
    '               ''MM-DD-RRRR HH24:MI:SS''))   '#13 +
    '       AS n                                  '#13 +
    '  FROM tool_calendar                         '#13 +
    ' WHERE id = %d                               ',
    [FormatDateTime('mm/dd/yyyy hh:nn:ss', QryDatesEND_TIME.AsDateTime),
    QryDatesID.AsLargeInt]) = 1 then
    raise Exception.Create('End date overlaps with another period.');

end;

procedure TFrmTlParam.QryDatesNewRecord(DataSet: TDataSet);
begin
  QryDatesID.AsFloat := GetNextID('TOOL_CALENDAR');
  if SecurityManager.EPlant_ID_AsFloat > 0 then
    QryDatesEPLANT_ID.AsFloat := SecurityManager.EPlant_ID_AsFloat;
  QryDatesSTART_TIME.AsDateTime := Now;
  QryDatesEND_TIME.AsDateTime := Now + 1 / 86400;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState and TNavigateBtn not present in UniGui
procedure TFrmTlParam.NavDatesBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
var
  i: Integer;
begin
  if (Button = nbDelete) then
    begin
      if GridDates.SelectedList.Count = 0 then
        GridDates.SelectRecord;
      if GridDates.SelectedList.Count = 0 then
        Exit;
      // iqtool_rscstr.cTXT0000247 = 'Delete record(s)?';
      if not IQMS.Common.Dialogs.IQConfirmYN(iqtool_rscstr.cTXT0000247) then
        System.SysUtils.Abort;

      with GridDates, GridDates.datasource.DataSet do
        for i := 0 to SelectedList.Count - 1 do
          begin
            GotoBookmark(SelectedList.items[i]);
            ExecuteCommandFmt('DELETE FROM tool_calendar WHERE id = %.0f',
              [QryDatesID.AsFloat]);
          end;
      GridDates.UnSelectAll;
      QryDates.Refresh;
      System.SysUtils.Abort;
    end;
end;

procedure TFrmTlParam.NavMainDefaultBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
    begin
      RefreshDataSetByID(QryOrigin);
      ReOpen(QryParam);
      ReOpen(QryDates);
      System.SysUtils.Abort;
    end;
end;  }

function TFrmTlParam.GetDefaultParamsID: LongInt;
begin
  Result := SelectValueAsInt64(
    'SELECT MIN(id) FROM tool_params WHERE eplant_id IS NULL');
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState and TNavigateBtn not present in UniGui
procedure TFrmTlParam.GridDatesCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;
  if QryDatesDAY_OFF_TYPE.AsInteger = 3 then
    begin
      AFont.Color := clWhite;
      ABrush.Color := clGreen;
    end
  else
    begin
      AFont.Color := clBlack;
      ABrush.Color := clWhite;
    end;
end;    }

procedure TFrmTlParam.sbtnMultiSelectClick(Sender: TObject);
begin
  QryDates.CheckBrowseMode;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain options
  if sbtnMultiSelect.Down then
    begin
      GridDates.Options := GridDates.Options + [dgMultiSelect, dgRowSelect];
      GridDates.EditControlOptions := GridDates.EditControlOptions +
        [ecoDisableDateTimePicker];
    end
  else
    begin
      GridDates.Options := GridDates.Options - [dgMultiSelect, dgRowSelect];
      GridDates.EditControlOptions := GridDates.EditControlOptions -
        [ecoDisableDateTimePicker];
    end;
  GridDates.InvalidateCurrentRow;   }
  SetButtons;
end;

procedure TFrmTlParam.EditStartandEndTime1Click(Sender: TObject);
var
  AFrom, ATo: TDateTime;
  ASaveFrom, ASaveTo: TDateTime;
begin
  AFrom := QryDatesSTART_TIME.AsDateTime;
  ATo := QryDatesEND_TIME.AsDateTime;
  ASaveFrom := AFrom;
  ASaveTo := ATo;

  if TFrmTimeDialog.GetDateTimeDialog(AFrom, ATo) and
    ((ASaveFrom <> AFrom) or (ASaveTo <> ATo)) then
    begin
      if not (QryDates.State in [dsEdit, dsInsert]) then
        QryDates.Edit;
      QryDatesSTART_TIME.AsDateTime := AFrom;
      QryDatesEND_TIME.AsDateTime := ATo;
    end;
end;

procedure TFrmTlParam.AddHoliday1Click(Sender: TObject);
var
  AFrom, ATo: TDateTime;
  AID: LargeInt;
begin
  if TFrmDatesDialog.GetDatesDialog(AFrom, ATo) and (AFrom <= ATo) then
    begin
      AID := GetNextID('tool_calendar');
      ExecuteCommandParam(
      'BEGIN                                                '#13 +
      '   PROJECT_CALENDAR.INSERT_CALENDAR(:ID,             '#13 +
      '                                    :EPLANT_ID,      '#13 +
      '                                    :START_TIME,     '#13 +
      '                                    :END_TIME,       '#13 +
      '                                    3);              '#13 +
      'END;                                                 ',
      ['ID;INT64', 'EPLANT_ID;INT64', 'START_TIME;DATE', 'END_TIME;DATE'],
      [AID, IQMS.Common.Numbers.NullIfZero(QryOriginID.AsFloat), AFrom, ATo]);
{
      ExecuteCommandParam(
        'INSERT INTO tool_calendar(id,             '#13 +
        '                          eplant_id,      '#13 +
        '                          start_time,     '#13 +
        '                          end_time,       '#13 +
        '                          day_off_type)   '#13 +
        '    VALUES (:id,                          '#13 +
        '            :eplant_id,                   '#13 +
        '            :start_time,                  '#13 +
        '            :end_time,                    '#13 +
        '            3)                            ',
        ['ID;INT64', 'EPLANT_ID;INT64', 'START_TIME;DATE', 'END_TIME;DATE'],
        [AID, IQMS.Common.Numbers.NullIfZero(QryOriginID.AsFloat), AFrom, ATo]);
}
      ReOpen(QryDates);
      QryDates.Locate('ID', AID, []);
    end;
end;

procedure TFrmTlParam.SelectAll1Click(Sender: TObject);
begin
  // Select All
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain options and UnSelectAll
  if (dgMultiSelect in GridDates.Options) then
    GridDates.SelectAll;   }
end;

procedure TFrmTlParam.UnselectAll1Click(Sender: TObject);
begin
  // Unselect All
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain options and UnSelectAll
  if (dgMultiSelect in GridDates.Options) then
    GridDates.UnSelectAll;  }
end;

procedure TFrmTlParam.ValidateAllFields(var ADuration1, ADuration2, ADuration3,
  ADuration4: Real);
begin
  // iqtool_rscstr.cTXT0000241 = 'Please enter a positive value for the number of shifts.';
  IQMS.Common.Miscellaneous.IQAssert(QryParamSHIFTS.AsFloat > - 1, iqtool_rscstr.cTXT0000241);
  // iqtool_rscstr.cTXT0000242 = 'Please enter a value from 1 to 4 for the number of shifts.';
  IQMS.Common.Miscellaneous.IQAssert(QryParamSHIFTS.AsFloat <= 4, iqtool_rscstr.cTXT0000242);

  Shop_Shr.IQSetDurationsEx(
    ADuration1,
    ADuration2,
    ADuration3,
    ADuration4,
    QryParamSHIFTS.AsFloat,
    QryParamSHIFT_START1.AsString,
    QryParamSHIFT_START2.AsString,
    QryParamSHIFT_START3.AsString,
    QryParamSHIFT_START4.AsString,
    QryParamHRS_DAY.AsFloat);

  if ADuration1 + ADuration2 + ADuration3 + ADuration4 > 24.0000001 then
    // Shop_SU_rscstr.cRsc0000014 = '
    // 'The combined time of Shift 1 + Shift 2 + Shift 3 + Shift 4 ' +
    // 'exceeds 24 hours.  Please check your time values.';
    raise Exception.Create(Shop_SU_rscstr.cRsc0000014);
end;

end.
