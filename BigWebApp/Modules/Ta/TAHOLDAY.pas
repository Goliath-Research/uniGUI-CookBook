unit Taholday;

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
  Db,
  Wwdatsrc,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  Menus,
  ExtCtrls,
  IQMS.WebVcl.About,
  DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
//  Vcl.Menus,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmTAHolidays = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Nav: TUniDBNavigator;
    SrcHolidays: TDataSource;
    TblHoliDays: TFDTable;
    TblHoliDaysID: TBCDField;
    TblHoliDaysSTART_TIME: TDateTimeField;
    TblHoliDaysEND_TIME: TDateTimeField;
    TblHoliDaysDESCRIP: TStringField;
    IQAbout1: TIQWebAbout;
    Grid: TUniDBGrid;
    PopupMenu1: TUniPopupMenu;
    SetHolidaysdatetime1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblHoliDaysBeforePost(DataSet: TDataSet);
    procedure SetHolidaysdatetime1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DOTAHolidays;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  TASetHol,
  ta_rscstr;

procedure DOTAHolidays;
var
  LFrmTAHolidays : TFrmTAHolidays;
begin
  LFrmTAHolidays := TFrmTAHolidays.Create(UniGUIApplication.UniApplication);
  LFrmTAHolidays.Show;
end;

procedure TFrmTAHolidays.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmTAHolidays.TblHoliDaysBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmTAHolidays.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActiveEx( TRUE, self, ta_rscstr.cTXT0000195 {'Accessing Holidays.  Please wait.'});
  IQRegFormRead( self, [self, Grid]);
end;

procedure TFrmTAHolidays.SetHolidaysdatetime1Click(Sender: TObject);
var
  AStartdate, AEnddate:TDateTime;
begin
  with TblHoliDays do
  begin
    if not (State in [dsInsert, dsEdit]) then Edit;
    AStartdate := FieldByname('START_TIME').asDateTime;
    AEnddate   := FieldByname('END_TIME').asDateTime;
    if AStartdate = 0 then AStartDate := Date;
    if AEnddate   = 0 then AEnddate := AStartdate + 1;
    if not DoTAAssignHolidayDates(AStartdate, AEnddate) then {in TASetHol.pas}
    begin
      Cancel;
      Exit;
    end;
    FieldByname('START_TIME').asDateTime := AStartdate;
    FieldByname('END_TIME').asDateTime   := AEnddate  ;
  end;
end;

procedure TFrmTAHolidays.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTAHolidays.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

end.
