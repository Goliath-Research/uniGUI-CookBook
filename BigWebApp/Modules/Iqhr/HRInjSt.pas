unit HRInjSt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
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
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniDateTimePicker,
  uniDBDateTimePicker, Vcl.Controls;

type
  TFrmInjStats = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    SR: TIQWebSecurityRegister;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel3: TUniPanel;
    Nav: TUniDBNavigator;
    Panel1: TUniPanel;
    GroupBox1: TUniGroupBox;
    IQSearch1: TIQUniGridControl;
    SrcStat: TDataSource;
    QryStat: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryStatID: TBCDField;
    QryStatEPLANT_ID: TBCDField;
    QryStatDIVISION_ID: TBCDField;
    QryStatEIN_ID: TBCDField;
    QryStatBEGIN_DATE: TDateTimeField;
    QryStatEND_DATE: TDateTimeField;
    QryStatAVG_NUM_EMPLOYEES: TBCDField;
    QryStatTOTAL_HRS_WORKED: TBCDField;
    QryStatINCIDENT_RATE_TOTAL: TBCDField;
    QryStatINCIDENT_RATE_DART: TBCDField;
    QryStatEIN: TStringField;
    QryStatDIVISION: TStringField;
    DBEIN: TUniDBEdit;
    DBEPlant: TUniDBEdit;
    DBDivision: TUniDBEdit;
    DbBegDate: TUniDBDateTimePicker;
    DBEndDate: TUniDBDateTimePicker;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    sbEINSearch: TUniSpeedButton;
    SbEplantSearch: TUniSpeedButton;
    SbDivisionSearch: TUniSpeedButton;
    BtnCalc: TUniButton;
    PkEin: TIQWebHPick;
    PkEplant: TIQWebHPick;
    PkDivision: TIQWebHPick;
    PkEinID: TBCDField;
    PkEinDESCRIP: TStringField;
    PkEplantID: TBCDField;
    PkEplantNAME: TStringField;
    PkDivisionID: TBCDField;
    PkDivisionDESCRIP: TStringField;
    PopupMenu1: TUniPopupMenu;
    PopupMenu2: TUniPopupMenu;
    PopupMenu3: TUniPopupMenu;
    Clear1: TUniMenuItem;
    Clear2: TUniMenuItem;
    Clear3: TUniMenuItem;
    PkDivisionNAME: TStringField;
    PopupMenu4: TUniPopupMenu;
    CalcAvgofemployees1: TUniMenuItem;
    CalcTotalHrsWorked1: TUniMenuItem;
    CalcIncidentRateTotal1: TUniMenuItem;
    CalcIncidentRateDART1: TUniMenuItem;
    N1: TUniMenuItem;
    CalcAll1: TUniMenuItem;
    Contents1: TUniMenuItem;
    QryStatFINALIZED: TStringField;
    N2: TUniMenuItem;
    FinalizeCalculations1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryStatBeforePost(DataSet: TDataSet);
    procedure QryStatAfterPost(DataSet: TDataSet);
    { TODO : TNavigateBtn not converted yet }
    //procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QryStatNewRecord(DataSet: TDataSet);
    procedure sbEINSearchClick(Sender: TObject);
    procedure SbEplantSearchClick(Sender: TObject);
    procedure SbDivisionSearchClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Clear2Click(Sender: TObject);
    procedure Clear3Click(Sender: TObject);
    procedure BtnCalcClick(Sender: TObject);
    procedure CalcAvgofemployees1Click(Sender: TObject);
    procedure CalcTotalHrsWorked1Click(Sender: TObject);
    procedure CalcIncidentRateTotal1Click(Sender: TObject);
    procedure CalcIncidentRateDART1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FinalizeCalculations1Click(Sender: TObject);
    procedure QryStatAfterScroll(DataSet: TDataSet);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoHRInjuryStats;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoHRInjuryStats;
var
  LFrmInjStats : TFrmInjStats;
begin
  LFrmInjStats := TFrmInjStats.Create(UniGUIApplication.UniApplication);
  with LFrmInjStats do
  begin
    show;
  end;
end;

procedure TFrmInjStats.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self ]);
end;

procedure TFrmInjStats.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInjStats.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmInjStats.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmInjStats.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmInjStats.QryStatBeforePost(DataSet: TDataSet);
begin
  if QryStatID.asFloat = 0 then
    QryStatID.asFloat := GetNextID('HR_INJURY_STATS');
end;

procedure TFrmInjStats.QryStatAfterPost(DataSet: TDataSet);
begin
{
  try
    QryStat.DataBase.ApplyUpdates( [ QryStat ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryStat.Close;
      QryStat.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

{ TODO : TNavigateBtn not converted yet }
{procedure TFrmInjStats.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if button = nbRefresh then
  begin
    AId := QryStatID.asFloat;
    QryStat.Close;
    QryStat.Open;
    QryStat.Locate('ID', AId, []);
    Abort;
  end;
end;      }

procedure TFrmInjStats.QryStatNewRecord(DataSet: TDataSet);
var
  AEplantId, AEin_Id:Real;
  AId:Real;
begin
  AEplantId := SelectValueAsFloat('select misc.geteplantid from dual');
  if AEplantId <> 0 then
    QryStatEPLANT_ID.asFloat := AEplantId;


  if AEplantId <> 0 then
  begin
    if SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2') = 'Y' then
    begin
      AEin_Id := SelectValueFmtAsFloat('select ein_id from eplant where id = %f', [AEplantId]);
      if AEin_ID <> 0 then
      begin
        QryStatEIN_ID.asFloat := AEin_ID;
        QryStatEIN.asString := SelectValueFmtAsString('select descrip from ein where id = %f', [AEin_ID]);
      end
    end;
  end;

  QryStatBEGIN_DATE.asDateTime := SelectValueAsFloat('select to_date(''01/01/'' || to_char(trunc(sysdate), ''RRRR''), ''DD/MM/RRRR'') from dual');
  QryStatEND_DATE.asDateTime := SelectValueAsFloat('select to_date(''31/12/'' || to_char(trunc(sysdate), ''RRRR''), ''DD/MM/RRRR'') from dual');
  QryStatID.asFloat := GetNextID('HR_INJURY_STATS');
  AId := QryStatID.asFloat;
  QryStat.Post;
  QryStat.Locate('ID', AId, []);

end;

procedure TFrmInjStats.sbEINSearchClick(Sender: TObject);
var
  AEinId:Real;
begin
  with PkEIN do
  if execute then
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
    AEinId := GetValue('ID');
    QryStatEIN_ID.asFloat := AEinID;
    QryStatEIN.asString := SelectValueFmtAsString('select descrip from ein where id = %f', [AEinID]);
  end;
end;

procedure TFrmInjStats.SbEplantSearchClick(Sender: TObject);
begin
  with PkEPlant do
  if execute then
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
    QryStatEPLANT_ID.asFloat := GetValue('ID');
  end;

end;

procedure TFrmInjStats.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( Self, [ Self ]);
end;

procedure TFrmInjStats.SbDivisionSearchClick(Sender: TObject);
var
  ADivisionId:Real;
begin
  with PkDivision do
  if execute then
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
    ADivisionId := GetValue('ID');
    QryStatDIVISION_ID.asFloat := ADivisionId;
    QryStatDIVISION.asString := SelectValueFmtAsString('select descrip from division where id = %f', [ADivisionId]);
  end;

end;

procedure TFrmInjStats.Clear1Click(Sender: TObject);
begin
  if not (QryStat.State in [dsEdit, dsInsert])
    then QryStat.Edit;
  QryStatEIN_ID.Clear;
  QryStatEIN.Clear;
end;

procedure TFrmInjStats.Clear2Click(Sender: TObject);
begin
  if not (QryStat.State in [dsEdit, dsInsert])
    then QryStat.Edit;
  QryStatEPLANT_ID.Clear;
end;

procedure TFrmInjStats.Clear3Click(Sender: TObject);
begin
  if not (QryStat.State in [dsEdit, dsInsert])
    then QryStat.Edit;
  QryStatDIVISION_ID.Clear;
  QryStatDIVISION.Clear;
end;

procedure TFrmInjStats.BtnCalcClick(Sender: TObject);
begin
  QryStat.CheckBrowseMode;
  if QryStatID.asFloat = 0 then
    QryStat.Insert
  else
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
  end;

  QryStatAVG_NUM_EMPLOYEES.asFloat   := SelectValueFmtAsFloat('select hr_misc.Arg_num_employees(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat]);

  QryStatTOTAL_HRS_WORKED.asFloat    := SelectValueFmtAsFloat('select hr_misc.Total_Hrs_Worked(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat]);

  QryStatINCIDENT_RATE_TOTAL.asFloat := SelectValueFmtAsFloat('select hr_misc.Incident_Rate_Total(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat]);

  QryStatINCIDENT_RATE_DART.asFloat  := SelectValueFmtAsFloat('select hr_misc.Incident_Rate_DART(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat]);
  QryStat.Post;
  { TODO : TNavigateBtn not converted yet }
  //NavBeforeAction(nil, nbRefresh);
end;

procedure TFrmInjStats.CalcAvgofemployees1Click(Sender: TObject);
begin
  QryStat.CheckBrowseMode;
  if QryStatID.asFloat = 0 then
    QryStat.Insert
  else
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
  end;

  QryStatAVG_NUM_EMPLOYEES.asFloat   := SelectValueFmtAsFloat('select hr_misc.Arg_num_employees(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat]);
  QryStat.Post;
  { TODO : TNavigateBtn not converted yet }
  //NavBeforeAction(nil, nbRefresh);
end;

procedure TFrmInjStats.CalcTotalHrsWorked1Click(Sender: TObject);
begin
  QryStat.CheckBrowseMode;
  if QryStatID.asFloat = 0 then
    QryStat.Insert
  else
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
  end;

  QryStatTOTAL_HRS_WORKED.asFloat    := SelectValueFmtAsFloat('select hr_misc.Total_Hrs_Worked(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat]);
  QryStat.Post;
  { TODO : TNavigateBtn not converted yet }
  //NavBeforeAction(nil, nbRefresh);
end;

procedure TFrmInjStats.CalcIncidentRateTotal1Click(Sender: TObject);
begin
  QryStat.CheckBrowseMode;
  if QryStatID.asFloat = 0 then
    QryStat.Insert
  else
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
  end;

  QryStatINCIDENT_RATE_TOTAL.asFloat := SelectValueFmtAsFloat('select hr_misc.Incident_Rate_Total(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat,
                                                   QryStatID.asFloat]);
  QryStat.Post;
  { TODO : TNavigateBtn not converted yet }
  //NavBeforeAction(nil, nbRefresh);
end;

procedure TFrmInjStats.CalcIncidentRateDART1Click(Sender: TObject);
begin
  QryStat.CheckBrowseMode;
  if QryStatID.asFloat = 0 then
    QryStat.Insert
  else
  begin
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;
  end;

  QryStatINCIDENT_RATE_DART.asFloat  := SelectValueFmtAsFloat('select hr_misc.Incident_Rate_DART(To_Date(''%s'', ''MM/DD/RRRR''),  ' +
                                                  ' To_Date(''%s'', ''MM/DD/RRRR''), %f, %f, %f, %f) from dual',
                                                  [FormatDateTime('mm/dd/yyyy', QryStatBEGIN_DATE.asDateTime),
                                                   FormatDateTime('mm/dd/yyyy', QryStatEND_DATE.asDateTime),
                                                   QryStatEIN_ID.asFloat,
                                                   QryStatEPLANT_ID.asFloat,
                                                   QryStatDIVISION_ID.asFloat,
                                                   QryStatID.asFloat]);
  QryStat.Post;
  { TODO : TNavigateBtn not converted yet }
  //NavBeforeAction(nil, nbRefresh);
end;

procedure TFrmInjStats.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1011175 );
end;

procedure TFrmInjStats.FinalizeCalculations1Click(Sender: TObject);
begin
  try
    QryStatFINALIZED.ReadOnly := false;
    if not (QryStat.State in [dsEdit, dsInsert])
      then QryStat.Edit;

    if QryStatFINALIZED.asString = 'Y' then
      QryStatFINALIZED.asString := 'N'
    else
      QryStatFINALIZED.asString := 'Y';

    QryStat.Post;
  finally
    QryStatFINALIZED.ReadOnly := true;
    QryStatAfterScroll(nil);
  end;
end;

procedure TFrmInjStats.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmWorkForce{CHM}, iqhtmWorkForce{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInjStats.QryStatAfterScroll(DataSet: TDataSet);
begin
  QryStatAVG_NUM_EMPLOYEES.ReadOnly    := (QryStatFINALIZED.asString = 'Y');
  QryStatTOTAL_HRS_WORKED.ReadOnly     := (QryStatFINALIZED.asString = 'Y');
  QryStatINCIDENT_RATE_TOTAL.ReadOnly  := (QryStatFINALIZED.asString = 'Y');
  QryStatINCIDENT_RATE_DART.ReadOnly   := (QryStatFINALIZED.asString = 'Y');
  QryStatFINALIZED.ReadOnly            := true;
  BtnCalc.Enabled                      := (QryStatFINALIZED.asString <> 'Y') and SR.Enabled['BtnCalc'] ;
end;


procedure TFrmInjStats.PopupMenu4Popup(Sender: TObject);
   // --------------------------------------------------------------------------
   procedure _ApplyEnabled(AMenuItem: TUniMenuItem; AEnabled: Boolean);
   begin
     { TODO : IQSearch1 does not have a property FindMenuItem }
     {with IqSearch1 do
     if FindMenuItem(AMenuItem) <> NIL then
        FindMenuItem(AMenuItem).Enabled := AEnabled; }
   end;
   // --------------------------------------------------------------------------
begin
  _ApplyEnabled(FinalizeCalculations1, SR.Enabled['FinalizeCalculations1']);

  _ApplyEnabled(CalcAll1,               (SR.Enabled['CalcAll1']               and (QryStatFINALIZED.asString <> 'Y')));
  _ApplyEnabled(CalcAvgofemployees1,    (SR.Enabled['CalcAvgofemployees1']    and (QryStatFINALIZED.asString <> 'Y')));
  _ApplyEnabled(CalcTotalHrsWorked1,    (SR.Enabled['CalcTotalHrsWorked1']    and (QryStatFINALIZED.asString <> 'Y')));
  _ApplyEnabled(CalcIncidentRateTotal1, (SR.Enabled['CalcIncidentRateTotal1'] and (QryStatFINALIZED.asString <> 'Y')));
  _ApplyEnabled(CalcIncidentRateDART1,  (SR.Enabled['CalcIncidentRateDART1']  and (QryStatFINALIZED.asString <> 'Y')));
end;


end.
