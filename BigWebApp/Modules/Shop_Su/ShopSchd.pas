unit ShopSchd;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Wwdatsrc,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmShopSchedHolidays = class(TUniForm)
    PageControl1: TUniPageControl;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    TabSheet1: TUniTabSheet;
    pnlWorkCenters: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    sbtnPkCenter: TUniSpeedButton;
    TabSheet2: TUniTabSheet;
    SrcCalendar: TDataSource;
    TblCalendar: TFDTable;
    TblCalendarID: TBCDField;
    TblCalendarWORK_CNTR_ID: TBCDField;
    TblCalendarSTART_TIME: TDateTimeField;
    TblCalendarEND_TIME: TDateTimeField;
    TblCalendarDAY_OFF_TYPE: TBCDField;
    SrcGeneralCenterType: TDataSource;
    QryGeneralCenterType: TFDQuery;
    SrcDefault_Calendar: TDataSource;
    TblDefault_Calendar: TFDTable;
    QryGeneralCenterTypeCENTER_TYPE: TStringField;
    TblDefault_CalendarASY_MACH: TStringField;
    TblDefault_CalendarSTART_TIME: TDateTimeField;
    TblDefault_CalendarEND_TIME: TDateTimeField;
    TblDefault_CalendarDAY_OFF_TYPE: TBCDField;
    pnlCenterType: TUniPanel;
    dbgridCenterType: TUniDBGrid;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    SR: TIQWebSecurityRegister;
    PkWorkCenter: TIQWebHPick;
    PkWorkCenterID: TBCDField;
    PkWorkCenterEQNO: TStringField;
    PkWorkCenterCNTR_TYPE: TStringField;
    PkWorkCenterMFG_TYPE: TStringField;
    PkWorkCenterMFGCELL: TStringField;
    StatusBar1: TUniStatusBar;
    sbtnShifts: TUniSpeedButton;
    sbtnHolidays: TUniSpeedButton;
    PopupMenu1: TUniPopupMenu;
    AssignTimeOffByShift1: TUniMenuItem;
    AssignHolidayToWorkCenters1: TUniMenuItem;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Calendar1: TUniMenuItem;
    AssignTimeOffbyShift2: TUniMenuItem;
    AssignHolidaytoworkcenters2: TUniMenuItem;
    N1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    wwSrcWorkCenter: TDataSource;
    wwQryWorkCenter: TFDQuery;
    wwQryWorkCenterID: TBCDField;
    wwQryWorkCenterEQNO: TStringField;
    wwQryWorkCenterCNTR_TYPE: TStringField;
    wwQryWorkCenterMFG_TYPE: TStringField;
    wwQryWorkCenterMFGCELL: TStringField;
    wwGridWorkCenter: TIQUniGridControl;
    QryGeneralCenterTypeMFGCELL_ID: TBCDField;
    TblDefault_CalendarID: TBCDField;
    TblDefault_CalendarMFGCELL_ID: TBCDField;
    Contents1: TUniMenuItem;
    QryGeneralCenterTypeDESCRIP: TStringField;
    Panel2: TUniPanel;
    sbtnMultiSelect: TUniSpeedButton;
    gridCalendar: TIQUniGridControl;
    sbtnEditPeriod: TUniSpeedButton;
    wwgridDefault_Calendar: TIQUniGridControl;
    wwQryWorkCenterCNTR_DESC: TStringField;
    popmWorkCenter: TUniPopupMenu;
    ByWorkCenter1: TUniMenuItem;
    ByWorkCenterDescription1: TUniMenuItem;
    Panel4: TUniPanel;
    chkPropagate: TUniCheckBox;
    PkWorkCenterPK_HIDE: TStringField;
    Panel6: TUniPanel;
    Shape1: TUniPanel;
    procedure gridWorkCenterEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblCalendarBeforePost(DataSet: TDataSet);
    procedure sbtnPkCenterClick(Sender: TObject);
    procedure sbtnHolidaysClick(Sender: TObject);
    procedure sbtnShiftsClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gridCalendarEnter(Sender: TObject);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure sbtnMultiSelectClick(Sender: TObject);
    procedure TblCalendarAfterPost(DataSet: TDataSet);
    procedure TblCalendarBeforeEdit(DataSet: TDataSet);
    procedure TblCalendarNewRecord(DataSet: TDataSet);
    procedure sbtnEditPeriodClick(Sender: TObject);
    procedure ByWorkCenter1Click(Sender: TObject);
    procedure ByWorkCenterDescription1Click(Sender: TObject);
    procedure TblDefault_CalendarAfterPost(DataSet: TDataSet);
    procedure TblDefault_CalendarBeforeDelete(DataSet: TDataSet);
    procedure wwgridDefault_CalendarDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure TblCalendarBeforeDelete(DataSet: TDataSet);
    procedure gridCalendarDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FSortFieldName: string;

    procedure SetSortFieldName( AValue: string );
    procedure CheckForObsoleteData;
    procedure DeleteObsolete( ATableName: string );
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo );
    procedure CheckChangeSortField(AQuery: TFDQuery);
  public
    { Public declarations }
    property SortFieldName: string read FSortFieldName write SetSortFieldName;
  end;

procedure DoShopSchedHolidays;

var
  FrmShopSchedHolidays: TFrmShopSchedHolidays;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  Shop_Hol,
  SU_Shift,
  IQMS.Common.TimeDlg;

procedure DoShopSchedHolidays;
begin
  TFrmShopSchedHolidays.Create( uniGUIApplication.UniApplication ).Show;
end;

procedure TFrmShopSchedHolidays.FormCreate(Sender: TObject);
var
  S: string;
begin
  CheckForObsoleteData;
  IQRegFormRead( self, [self, pnlWorkCenters, wwGridWorkCenter, gridCalendar, wwgridDefault_Calendar, pnlCenterType, dbgridCenterType, chkPropagate ]);
  IQSetTablesActive( TRUE, self );
  PageControl1.ActivePageIndex:= 0;

  {Restore Sort-By field }
  IQRegStringScalarRead( self, 'SortFieldName', S, TRUE {Permanent});
  if S = '' then
     S:= 'CNTR_DESC';
  SortFieldName:= S;

  // compensate for security changes
//  IQMS.Common.Controls.ResizeNavBar(NavMain);
end;

procedure TFrmShopSchedHolidays.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite( self, [self, pnlWorkCenters, wwGridWorkCenter, gridCalendar, wwgridDefault_Calendar, pnlCenterType, dbgridCenterType, chkPropagate ]);
  IQRegStringScalarWrite( self, 'SortFieldName', FSortFieldName, TRUE {Permanent});
  Application.OnShowHint:= NIL;
end;


procedure TFrmShopSchedHolidays.gridWorkCenterEnter(Sender: TObject);
begin
  NavMain.DataSource:= (Sender as TUniDBGrid).DataSource;
end;

procedure TFrmShopSchedHolidays.TblCalendarBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('day_off_type').asInteger:= 3;
  with DataSet do
    IQAssert( FieldByName('end_time').asDateTime > FieldByName('start_time').asDateTime, 'Invalid time period');
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmShopSchedHolidays.sbtnPkCenterClick(Sender: TObject);
begin
  with PkWorkCenter do
    if Execute then
       wwQryWorkCenter.Locate('ID', GetValue('ID'), [])
end;

procedure TFrmShopSchedHolidays.sbtnHolidaysClick(Sender: TObject);
begin
  DoShopHoliday;  {Shop_Hol.pas}
  wwQryWorkCenter.Close; wwQryWorkCenter.Open;
  QryGeneralCenterType.Close; QryGeneralCenterType.Open;
end;

procedure TFrmShopSchedHolidays.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShopSchedHolidays.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmShopSchedHolidays.sbtnShiftsClick(Sender: TObject);
begin
  if DoShopSetUpByShift( wwGridWorkCenter.DBGrid ) then
     TblCalendar.Refresh;
end;

procedure TFrmShopSchedHolidays.CheckForObsoleteData;
begin
  if (SelectValueAsFloat('select 1 from CALENDAR where end_time < to_date(trunc(sysdate, ''YEAR'')) and rownum < 2') = 1)
     or (SelectValueAsFloat('select 1 from DEFAULT_CALENDAR where end_time < to_date(trunc(sysdate, ''YEAR'')) and rownum < 2') = 1) then
       if IQWarningYN('Would you like to delete obsolete scheduled days-off from the previous year(s)?') then
       begin
         DeleteObsolete( 'CALENDAR' );
         DeleteObsolete( 'DEFAULT_CALENDAR' );
       end;
end;

procedure TFrmShopSchedHolidays.DeleteObsolete( ATableName: string );
var
  hMsg: TPanelMEsg;
begin
  hMsg:= hPleaseWait(Format('Processing table %s ...', [ ATableName ]));
  try
    ExecuteCommandFmt('begin                                                            ' +
              '  for v in (select rowid as row_id                               ' +
              '              from %s                                            ' +
              '             where end_time < to_date(trunc(sysdate, ''YEAR''))) ' +
              '  loop                                                           ' +
              '    delete from %s where rowid = v.row_id;                       ' +
              '    COMMIT;                                                      ' +
              '  end loop;                                                      ' +
              'end;                                                             ', [ ATableName, ATableName ]);
  finally
    hMsg.Free;
  end;
end;


procedure TFrmShopSchedHolidays.PageControl1Change(Sender: TObject);
begin
  sbtnShifts.Enabled:= PageControl1.ActivePage = TabSheet1;
end;

procedure TFrmShopSchedHolidays.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmShopSchedHolidays.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch5{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmShopSchedHolidays.gridCalendarDBGridDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
begin
  // EIQ-5451
  if TblCalendar.FieldByName('day_off_type').AsInteger = 3 then // 3 = holiday
  begin
    Attribs.Font.Color := clWhite;
    Attribs.Color := clGreen;
  end
  else
  begin
    Attribs.Font.Color := clBlack;
    Attribs.Color := clWhite;
  end;
end;

procedure TFrmShopSchedHolidays.gridCalendarEnter(Sender: TObject);
begin
  NavMain.DataSource:= (Sender as TIQUniGridControl).DataSource;
end;

procedure TFrmShopSchedHolidays.wwDBComboDlg1CustomDlg(Sender: TObject);
var
  AFrom, ATo: TDateTime;
  ASaveFrom, ASaveTo: TDateTime;
begin
  with gridCalendar.DataSource.DataSet as TFDTable do
  begin
    AFrom    := FieldByName('start_time').asDateTime;
    ATo      := FieldByName('end_time').asDateTime;
    ASaveFrom:= AFrom;
    ASaveTo  := ATo;
    if TFrmTimeDialog.GetDateTimeDialog( AFrom, ATo ) and ((ASaveFrom <> AFrom) or (ASaveTo <> ATo)) then
    begin
      Edit;
      FieldByName('start_time').asDateTime:= AFrom;
      FieldByName('end_time').asDateTime  := ATo;
    end;
  end;
end;

procedure TFrmShopSchedHolidays.wwgridDefault_CalendarDBGridDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
begin
  // EIQ-5451
  if TblDefault_Calendar.FieldByName('day_off_type').AsInteger = 3 then // 3 = holiday
  begin
    Attribs.Font.Color := clWhite;
    Attribs.Color := clGreen;
  end
  else
  begin
    Attribs.Font.Color := clBlack;
    Attribs.Color := clWhite;
  end;
end;

procedure TFrmShopSchedHolidays.TblCalendarAfterPost(DataSet: TDataSet);
begin
  TblCalendar.Refresh; {duplicated line after post}
end;

procedure TFrmShopSchedHolidays.sbtnMultiSelectClick(Sender: TObject);
begin
  TblCalendar.CheckBrowseMode;
  if sbtnMultiSelect.Down then
     begin
       gridCalendar.DBGrid.Options := gridCalendar.DBGrid.Options + [dgMultiSelect, dgRowSelect];
//       gridCalendar.EditControlOptions:= gridCalendar.EditControlOptions + [ ecoDisableDateTimePicker ];
     end
  else
     begin
       gridCalendar.DBGrid.Options:= gridCalendar.DBGrid.Options - [dgMultiSelect, dgRowSelect];
//       gridCalendar.EditControlOptions:= gridCalendar.EditControlOptions - [ ecoDisableDateTimePicker ];
     end;
//  gridCalendar.InvalidateCurrentRow;
end;

procedure TFrmShopSchedHolidays.TblCalendarBeforeDelete(DataSet: TDataSet);
var
i:integer;
begin
//  if gridCalendar.DBGrid.SelectedRows.Count = 0 then
//       gridCalendar.SelectRecord;
    if gridCalendar.DBGrid.SelectedRows.Count = 0 then
       Exit;
    if not IqConfirmYN('Delete record(s)?') then
       Abort;

    with gridCalendar, gridCalendar.datasource.dataset do
    for i:= 0 to DBGrid.SelectedRows.Count-1 do
    begin
      GotoBookmark(DBGrid.SelectedRows.items[i]);
      ExecuteCommandFmt('delete from CALENDAR where id = %f', [TblCalendarID.asFloat]);
    end;
//    gridCalendar.UnSelectAll;
    TblCalendar.Refresh;
    Abort;
end;

procedure TFrmShopSchedHolidays.TblCalendarBeforeEdit(DataSet: TDataSet);
begin
  if sbtnMultiSelect.Down then
  begin
    sbtnMultiSelect.Down:= FALSE;
    sbtnMultiSelectClick( NIL );
  end;
end;

procedure TFrmShopSchedHolidays.DoOnShowHint( var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo );
begin
  with HintInfo do
    if HintControl = sbtnMultiSelect then
    begin
      if sbtnMultiSelect.Down then
         HintStr:= 'Multi-Select is ON'#13'Click to turn it OFF'
      else
         HintStr:= 'Multi-Select is OFF'#13'Click to turn it ON'
    end;
end;

procedure TFrmShopSchedHolidays.TblCalendarNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID').asFloat:= 0;
  DataSet.FieldByName('START_TIME').asDateTime:= Now;
  DataSet.FieldByName('END_TIME').asDateTime  := Now + 1/86400;
end;

procedure TFrmShopSchedHolidays.sbtnEditPeriodClick(Sender: TObject);
begin
  wwDBComboDlg1CustomDlg( NIL );
end;

procedure TFrmShopSchedHolidays.SetSortFieldName(AValue: string);
begin
  FSortFieldName:= AValue;
  ByWorkCenter1.Checked           := FSortFieldName = 'EQNO';
  ByWorkCenterDescription1.Checked:= FSortFieldName = 'CNTR_DESC';
  CheckChangeSortField( wwQryWorkCenter );
end;

procedure TFrmShopSchedHolidays.CheckChangeSortField( AQuery: TFDQuery );
var
  I: Integer;
begin
  IQRegFormWrite( self, [ wwGridWorkCenter ]);

  AQuery.Close;
  try
    I:= Pos( ' order by ', AQuery.SQL.Text );
    if I > 0 then
       AQuery.SQL.Text:= Copy( AQuery.SQL.Text, 1, I-1 );

    AQuery.SQL.Add(' order by ' + FSortFieldName );
  finally
    AQuery.Open;
  end;

  IQRegFormRead( self, [ wwGridWorkCenter ]);
end;


procedure TFrmShopSchedHolidays.ByWorkCenter1Click(Sender: TObject);
begin
  SortFieldName:= 'EQNO';
end;

procedure TFrmShopSchedHolidays.ByWorkCenterDescription1Click(Sender: TObject);
begin
  SortFieldName:= 'CNTR_DESC';
end;

procedure TFrmShopSchedHolidays.TblDefault_CalendarAfterPost(DataSet: TDataSet);
begin
  if not chkPropagate.Checked then
     EXIT;

  if TblDefault_CalendarMFGCELL_ID.asFloat = 0 then
     EXIT;

  // ExecuteCommandFmt('insert into calendar                                      '+
  //           '     ( work_cntr_id, start_time, end_time, day_off_type ) '+
  //           'select w.id,                                              '+
  //           '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),        '+
  //           '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),        '+
  //           '       %f                                                 '+
  //           ' from work_center w                                       '+
  //           'where w.mfgcell_id = %f                                   ',
  //           [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblDefault_CalendarSTART_TIME.asDateTime ),
  //             FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblDefault_CalendarEND_TIME.asDateTime ),
  //             TblDefault_CalendarDAY_OFF_TYPE.asFloat,
  //             TblDefault_CalendarMFGCELL_ID.asFloat ]);

  ExecuteCommandFmt('declare                                                                 '+
            '  v_mfgcell_id    number::= %f;                                         '+
            '  v_start_time    date::= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'');   '+
            '  v_end_time      date::= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'');   '+
            '  v_day_off_type  number::= %f;                                         '+
            'begin                                                                   '+
            '  for v in (select id from work_center where mfgcell_id = v_mfgcell_id) '+
            '  loop                                                                  '+
            '    shop.save_to_workcenter_calendar( v.id,                             '+
            '                                      v_start_time,                     '+
            '                                      v_end_time,                       '+
            '                                      v_day_off_type );                 '+
            '  end loop;                                                             '+
            'end;                                                                    ',
            [ TblDefault_CalendarMFGCELL_ID.asFloat,
              FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblDefault_CalendarSTART_TIME.asDateTime ),
              FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblDefault_CalendarEND_TIME.asDateTime ),
              TblDefault_CalendarDAY_OFF_TYPE.asFloat  ]);
end;

procedure TFrmShopSchedHolidays.TblDefault_CalendarBeforeDelete(DataSet: TDataSet);
begin
  if not chkPropagate.Checked then
     EXIT;

  if TblDefault_CalendarMFGCELL_ID.asFloat = 0 then
     EXIT;

  ExecuteCommandFmt('delete from calendar                                                                      '+
            ' where start_time = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'')                            '+
            '   and end_time = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'')                              '+
            '   and %f = (select nvl(mfgcell_id, 0) from work_center where id = calendar.work_cntr_id) ',
            [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblDefault_CalendarSTART_TIME.asDateTime ),
              FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblDefault_CalendarEND_TIME.asDateTime ),
              TblDefault_CalendarMFGCELL_ID.asFloat ]);
end;

end.
