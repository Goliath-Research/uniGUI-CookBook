unit ship_hours;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.About,
  Vcl.Menus,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniGUIFrame, IQUniGrid,
  Vcl.Controls;

type
  TFrmShipHours = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    sbtnRecalcMustShipDate: TUniSpeedButton;
    wwDBGrid1: TIQUniGridControl;
    SrcShipHours: TDataSource;
    QryShipHours: TFDQuery;
    QryShipHoursID: TBCDField;
    QryShipHoursWEEK_DAY: TBCDField;
    QryShipHoursSTART_TIME: TStringField;
    QryShipHoursEND_TIME: TStringField;
    QryShipHoursEPLANT_ID: TBCDField;
    cmbWeekDay: TUniDBComboBox;
    QryShipHoursWEEK_DAY_STR: TStringField;
    QryShipHoursWeekDayDisp: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    FDStoredProc1: TFDStoredProc;
    FDUpdateSQL_ShipHours: TFDUpdateSQL;
    procedure sbtnRecalcMustShipDateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryShipHoursBeforePost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryShipHoursCalcFields(DataSet: TDataSet);
    procedure QryShipHoursBeforeOpen(DataSet: TDataSet);
    procedure QryShipHoursNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEPlant_ID: Real;
    procedure Validate;
    procedure SetEPlant_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow( AEPlant_ID: Real );
    property EPlant_ID: Real write SetEPlant_ID;
  end;

implementation

{$R *.dfm}

uses
  oe_misc,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  iqsys_rscstr;

class procedure TFrmShipHours.DoShow( AEPlant_ID: Real );
var
  LFrm: TFrmShipHours;
begin
  LFrm:= self.Create( UniGuiApplication.UniApplication );
  LFrm.EPlant_ID:= AEPlant_ID;
  LFrm.Show;
end;

procedure TFrmShipHours.FormShow(Sender: TObject);
var
  S: string;
begin
  IQSetTablesActive( TRUE, self );

  if FEPlant_ID = 0 then
     S:= iqsys_rscstr.cTXT0000123 {'System Default'}
  else
     S:= SelectValueByID('name', 'eplant', FEPlant_ID);
  Caption:= Format( iqsys_rscstr.cTXT0000122, [ S ]);   // 'Shipping Hours [EPlant: %s]';

  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmShipHours.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmShipHours.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmShipHours.sbtnRecalcMustShipDateClick(Sender: TObject);
begin
  ConfirmRecalcOEMustShipDate; {oe_misc.pas}
end;

procedure TFrmShipHours.SetEPlant_ID(const Value: Real);
begin
  FEPlant_ID:= Value;
end;

procedure TFrmShipHours.Validate;
var
  S: string;
begin
  {validate interval}
  IQAssert( QryShipHoursSTART_TIME.asDateTime < QryShipHoursEND_TIME.asDateTime, 'Invalid ''From'' - ''To'' period specified' );

  {start_time within other period}
  S:= SelectValueFmtAsString('select iqcalendar.week_day_name( week_day ) from ship_hours '+
                   ' where week_day = %f                                          '+
                   '   and to_date(''%s'', ''hh24:mi:ss'') between to_date(start_time, ''hh24:mi:ss'') and to_date(end_time, ''hh24:mi:ss'') '+
                   '   and id <> %f                                               '+
                   '   and NVL(eplant_id,0) = %f                                  '+
                   '   and rownum < 2                                             ',
                   [ QryShipHoursWEEK_DAY.asFloat,
                     FormatDateTime( 'hh:nn:ss', QryShipHoursSTART_TIME.asDateTime ),
                     QryShipHoursID.asFloat,
                     QryShipHoursEPLANT_ID.asFloat ]);
  // 'Cross reference detected. Weekday period %s start time is within another %s period'
  IQAssert( S = '', Format( iqsys_rscstr.cTXT0000118, [ QryShipHoursWeekDayDisp.asString, S ]));

  {end_time within other period}
  S:= SelectValueFmtAsString('select iqcalendar.week_day_name( week_day ) from ship_hours '+
                   ' where week_day = %f                                          '+
                   '   and to_date(''%s'', ''hh24:mi:ss'') between to_date(start_time, ''hh24:mi:ss'') and to_date(end_time, ''hh24:mi:ss'') '+
                   '   and id <> %f                                               '+
                   '   and NVL(eplant_id,0) = %f                                  '+
                   '   and rownum < 2                                             ',
                   [ QryShipHoursWEEK_DAY.asFloat,
                     FormatDateTime( 'hh:nn:ss', QryShipHoursEND_TIME.asDateTime ),
                     QryShipHoursID.asFloat,
                     QryShipHoursEPLANT_ID.asFloat ]);
  // 'Cross reference detected. Weekday period %s end time is within another %s period.'
  IQAssert( S = '', Format(iqsys_rscstr.cTXT0000119, [ QryShipHoursWeekDayDisp.asString, S ]));

  {start_time of other period within current period}
  S:= SelectValueFmtAsString('select iqcalendar.week_day_name( week_day ) from ship_hours '+
                   ' where week_day = %f                                          '+
                   '   and to_date(start_time, ''hh24:mi:ss'') between            '+
                   '       to_date(''%s'', ''hh24:mi:ss'') and to_date(''%s'', ''hh24:mi:ss'') '+
                   '   and id <> %f                                               '+
                   '   and NVL(eplant_id,0) = %f                                  '+
                   '   and rownum < 2                                             ',
                   [ QryShipHoursWEEK_DAY.asFloat,
                     FormatDateTime( 'hh:nn:ss', QryShipHoursSTART_TIME.asDateTime ),
                     FormatDateTime( 'hh:nn:ss', QryShipHoursEND_TIME.asDateTime ),
                     QryShipHoursID.asFloat,
                     QryShipHoursEPLANT_ID.asFloat ]);
  // 'Cross reference detected. Weekday period %s start time is within another %s period.'
  IQAssert( S = '', Format(iqsys_rscstr.cTXT0000120, [ S, QryShipHoursWeekDayDisp.asString ]));

  {end_time of other period within current period}
  S:= SelectValueFmtAsString('select iqcalendar.week_day_name( week_day ) from ship_hours '+
                   ' where week_day = %f                                          '+
                   '   and to_date(end_time, ''hh24:mi:ss'') between              '+
                   '       to_date(''%s'', ''hh24:mi:ss'') and to_date(''%s'', ''hh24:mi:ss'') '+
                   '   and id <> %f                                               '+
                   '   and NVL(eplant_id,0) = %f                                  '+
                   '   and rownum < 2                                             ',
                   [ QryShipHoursWEEK_DAY.asFloat,
                     FormatDateTime( 'hh:nn:ss', QryShipHoursSTART_TIME.asDateTime ),
                     FormatDateTime( 'hh:nn:ss', QryShipHoursEND_TIME.asDateTime ),
                     QryShipHoursID.asFloat,
                     QryShipHoursEPLANT_ID.asFloat ]);
  // 'Cross reference detected. Weekday period %s end time is within another %s period.'
  IQAssert( S = '', Format(iqsys_rscstr.cTXT0000121, [ S, QryShipHoursWeekDayDisp.asString ]));
end;

procedure TFrmShipHours.QryShipHoursBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'eplant_id', FEplant_ID);
end;

procedure TFrmShipHours.QryShipHoursBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'ship_hours');

  IQAssert( QryShipHoursWEEK_DAY_STR.asString > '', iqsys_rscstr.cTXT0000124 {'Day must be assigned - operation aborted'});
  QryShipHoursWEEK_DAY.asFloat:= StrToFloat(QryShipHoursWEEK_DAY_STR.asString);

  Validate;
end;

procedure TFrmShipHours.QryShipHoursCalcFields(DataSet: TDataSet);
begin
  if QryShipHoursWEEK_DAY_STR.asString > '' then
  begin
    FDStoredProc1.ParamByName('v_day').Value:= StrToFloat(QryShipHoursWEEK_DAY_STR.asString);
    FDStoredProc1.Execute;
    QryShipHoursWeekDayDisp.asString:= FDStoredProc1.ParamByName('result').asString;
  end;
end;

procedure TFrmShipHours.QryShipHoursNewRecord(DataSet: TDataSet);
begin
  QryShipHoursID.AsLargeInt := GetNextID('SHIP_HOURS');
  QryShipHoursEPLANT_ID.AsLargeInt := Trunc(FEPlant_ID);  // not if System Default then we assign 0 to get NULL into the eplant_id
end;

procedure TFrmShipHours.Exit1Click(Sender: TObject);
begin
  Close
end;



end.
