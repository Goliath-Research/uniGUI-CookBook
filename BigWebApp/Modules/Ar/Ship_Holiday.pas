unit Ship_Holiday;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Mask,
  Vcl.Buttons,
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
  uniMainMenu,
  uniGUIFrame,
  IQUniGrid;

type
  TFrmShipHoliday = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    SrcShip_Calendar: TDataSource;
    TblShip_Calendar: TFDQuery;
    TblShip_CalendarID: TBCDField;
    TblShip_CalendarDESCRIP: TStringField;
    TblShip_CalendarSTART_TIME: TDateTimeField;
    TblShip_CalendarEND_TIME: TDateTimeField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    TblShip_CalendarEXCLUDE_TRANSIT: TStringField;
    TblShip_CalendarEPLANT_ID: TBCDField;
    wwDBComboDlgEPlant: TUniEdit;
    sbtnRecalcMustShipDate: TUniSpeedButton;
    Bevel1: TUniPanel;
    Contents1: TUniMenuItem;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure TblShip_CalendarBeforePost(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure sbtnRecalcMustShipDateClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TblShip_CalendarNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

var
  FrmShipHoliday: TFrmShipHoliday;

implementation

{$R *.DFM}

uses
  ar_rscstr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  oe_misc;
  //setplant;


class procedure TFrmShipHoliday.DoShowModal;
var
  aFrmShipHoliday : TFrmShipHoliday;
begin
  aFrmShipHoliday := TFrmShipHoliday.Create(UniGUIApplication.UniApplication);
  aFrmShipHoliday.ShowModal;
end;

procedure TFrmShipHoliday.TblShip_CalendarBeforePost(DataSet: TDataSet);
var
  S: string;
begin
  IQAssignIDBeforePost( DataSet );

  {validate interval}
  IQAssert( TblShip_CalendarSTART_TIME.asDateTime < TblShip_CalendarEND_TIME.asDateTime, 'Invalid ''From'' - ''To'' period specified' );

  {start_time within other period}
  S:= SelectValueFmtAsString('select descrip from ship_calendar where to_date(''%s'', ''mm/dd/yy hh24:mi:ss'') between start_time+1/86400 and end_time-1/86400 and rownum < 2 and id <> %f '+
                   '   and NVL(eplant_id,0) = %f',
                   [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblShip_CalendarSTART_TIME.asDateTime ),
                     TblShip_CalendarID.asFloat,
                     TblShip_CalendarEPLANT_ID.asFloat ]);
  // 'Cross reference detected.  Holiday period %s start time is within %s period'
  IQAssert( S = '', Format( ar_rscstr.cTXT0000083, [ TblShip_CalendarDESCRIP.asString, S ]));

  {end_time within other period}
  S:= SelectValueFmtAsString('select descrip from ship_calendar where to_date(''%s'', ''mm/dd/yy hh24:mi:ss'') between start_time+1/86400 and end_time-1/86400 and rownum < 2 and id <> %f ' +
                   '   and NVL(eplant_id,0) = %f',
                   [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblShip_CalendarEND_TIME.asDateTime ),
                     TblShip_CalendarID.asFloat,
                     TblShip_CalendarEPLANT_ID.asFloat ]);
  // 'Cross reference detected.  Holiday period %s end time is within %s period.'
  IQAssert( S = '', Format(ar_rscstr.cTXT0000084, [ TblShip_CalendarDESCRIP.asString, S ]));

  {start_time of other period within current period}
  S:= SelectValueFmtAsString('select descrip from ship_calendar where start_time between '+
                   '       to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')+1/86400 and to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')-1/86400 and id <> %f '+
                   '   and NVL(eplant_id,0) = %f',
                   [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblShip_CalendarSTART_TIME.asDateTime ),
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblShip_CalendarEND_TIME.asDateTime ),
                     TblShip_CalendarID.asFloat,
                     TblShip_CalendarEPLANT_ID.asFloat ]);
  // 'Cross reference detected.  Holiday period %s start time is within %s period.'
  IQAssert( S = '', Format(ar_rscstr.cTXT0000083, [ S, TblShip_CalendarDESCRIP.asString ]));

  {end_time of other period within current period}
  S:= SelectValueFmtAsString('select descrip from ship_calendar where end_time between '+
                   '       to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')+1/86400 and to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')-1/86400 and id <> %f '+
                   '   and NVL(eplant_id,0) = %f',
                   [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblShip_CalendarSTART_TIME.asDateTime ),
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', TblShip_CalendarEND_TIME.asDateTime ),
                     TblShip_CalendarID.asFloat,
                     TblShip_CalendarEPLANT_ID.asFloat ]);
  // 'Cross reference detected.  Holiday period %s end time is within %s period.'
  IQAssert( S = '', Format(ar_rscstr.cTXT0000084, [ S, TblShip_CalendarDESCRIP.asString ]));
end;

procedure TFrmShipHoliday.TblShip_CalendarNewRecord(DataSet: TDataSet);
begin
  TblShip_CalendarID.AsLargeInt := GetNextID('SHIP_CALENDAR');
end;

procedure TFrmShipHoliday.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmShipHoliday.UniFormDestroy(Sender: TObject);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ])
end;

procedure TFrmShipHoliday.FormShow(Sender: TObject);
begin
  IQSetTablesActiveEx( TRUE, self, '');
end;

procedure TFrmShipHoliday.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipHoliday.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmShipHoliday.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
begin
  //DoChangePlantID( self, TblShip_Calendar ); { SetPlant.pas}
end;

procedure TFrmShipHoliday.sbtnRecalcMustShipDateClick(Sender: TObject);
begin
  ConfirmRecalcOEMustShipDate; {oe_misc.pas}
end;

procedure TFrmShipHoliday.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUPch4{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmShipHoliday.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
