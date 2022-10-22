unit SU_Shift;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Spin,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBGrid,
  uniButton,

  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB;

type
  TFrmShopSU_Shift = class(TUniForm)
    Panel1: TUniPanel;
    StatusBar1: TUniStatusBar;
    Label5: TUniLabel;
    Label4: TUniLabel;
    chkShift1: TUniCheckBox;
    chkShift2: TUniCheckBox;
    chkShift3: TUniCheckBox;
    edDaysWeek: TUniEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    DateTimePicker2: TUniDateTimePicker;
    Bevel1: TUniPanel;
    procProd_Date: TFDStoredProc;
    lblSelected: TUniLabel;
    pnlBtnBottm: TUniPanel;
    pnlBtnRight: TUniPanel;
    btnApply: TUniButton;
    btnCancel: TUniButton;
    chkShift4: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FWork_Center_ID: Real;
    FMfgCell_ID    : Real;
    FwwGridWrkCntr : TUniDbGrid;
    FEqNo          : string;
    Duration1      : Real;
    Duration2      : Real;
    Duration3      : Real;
    Duration4      : Real;
    Shifts         : Integer;
    Days_Week      : Integer;
    Work1, Work2, Work3, Work4: Boolean;

    procedure AssignDefaultValues;
    procedure Validate;
    procedure DeleteInCalendarForWorkCenter;
    procedure SetStatus( const S: string );
    procedure InitFromParams;
    function GetProdDateStart1stShift( ADay: TDateTime ): TDateTime;
    procedure CheckDayOff( ADay:TDateTime  );
    procedure ProcessTimeOffForWorkCenter;
  public
    { Public declarations }
    property Status: string write SetStatus;
  end;

function DoShopSetUpByShift( wwGridWorkCenter: TUniDbGrid  ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  Shop_Shr,
  System.Variants;

function DoShopSetUpByShift( wwGridWorkCenter: TUniDbGrid  ): Boolean;
var
    form : TFrmShopSU_Shift;
begin

  form := TFrmShopSU_Shift.Create(uniGUIApplication.UniApplication);
  form.FWork_Center_ID:= 0;
  form.FwwGridWrkCntr := wwGridWorkCenter;

  Result := form.ShowModal = mrOK;
end;

procedure TFrmShopSU_Shift.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmShopSU_Shift.AssignDefaultValues;
var
  A: Variant;
  AMfgType: string;
begin
  lblSelected.Caption:= Format('Selected Work Centers: %d', [ FwwGridWrkCntr.SelectedRows.Count ]);

  {Period}
  DateTimePicker1.DateTime:= Date;
  DateTimePicker2.DateTime:= IQEoY( Date );

  A:= SelectValueArray( 'select NVL(mfg_days_week,5), NVL(shifts,3) from params' );

  if VarArrayDimCount( A ) > 0 then
  begin
    edDaysWeek.Text  := FloatToStr( A[ 0 ]);
    chkShift1.Visible:= A[ 1 ] >= 1;
    chkShift2.Visible:= A[ 1 ] >= 2;
    chkShift3.Visible:= A[ 1 ] >= 3;
    chkShift4.Visible:= A[ 1 ] = 4;
    Shifts           := Trunc(A[ 1 ]);
  end;
end;

procedure TFrmShopSU_Shift.SetStatus( const S: string );
begin
  with StatusBar1 do
  begin
    Caption:=S;
    Update;
  end;
end;

procedure TFrmShopSU_Shift.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  AssignDefaultValues;
end;

procedure TFrmShopSU_Shift.btnApplyClick(Sender: TObject);
var
  I: Integer;
begin
  Validate;
  with FDManager.FindConnection('IQFD') do
  try
    StartTransaction;

    with FwwGridWrkCntr, FwwGridWrkCntr.Datasource.Dataset do
    try
    DisableControls;
      for I:= 0 to SelectedRows.Count - 1 do
      begin
        GotoBookmark( SelectedRows.Items[ I ]);

        FWork_Center_ID:= FieldByName('ID').asFloat;
        FEqNo          := FieldByName('EQNO').asString;
        FMfgCell_ID    := SelectValueFmtAsFloat('select mfgcell_id from work_center where id = %f', [ FWork_Center_ID ]);

        InitFromParams;
        ProcessTimeOffForWorkCenter;

      end;
    finally
      EnableControls;
  end;

    Commit;
    ModalResult:= mrOK;
  except
    RollBack;
    raise;
  end;
end;

procedure TFrmShopSU_Shift.Validate;
var
  Days_Week: Integer;
begin
  if FwwGridWrkCntr.SelectedRows.Count = 0 then
     raise Exception.Create( 'No work centers selected' );

  if DateTimePicker1.DateTime > DateTimePicker2.DateTime then
     raise Exception.Create( 'Invalid FROM - TO dates range' );

  Days_Week:= StrToInt( edDaysWeek.Text );
  if not( Days_Week in [1..7]) then
     raise Exception.Create( 'Working days per week must be between 1 and 7' );
end;

procedure TFrmShopSU_Shift.InitFromParams;
var
  AShifts     : Real;
  AShiftStart1: string;
  AShiftStart2: string;
  AShiftStart3: string;
  AShiftStart4: string;
  AHrsDay     : Real;
begin
  if not IQGetParamFromMfgCell( FMfgCell_ID, AShifts, AShiftStart1, AShiftStart2, AShiftStart3, AShiftStart4, AHrsDay ) then     {Shop_Shr.pas}
     raise Exception.Create('Unable to determine shop schedule parameters');

  IQSetDurationsEx( Duration1, Duration2, Duration3, Duration4, AShifts, AShiftStart1, AShiftStart2, AShiftStart3, AShiftStart4, AHrsDay ); {Shop_Shr.pas}

  Days_Week:= StrToInt( edDaysWeek.Text );
  Work1    := chkShift1.Checked;
  Work2    := chkShift2.Checked;
  Work3    := chkShift3.Checked;
  Work4    := chkShift4.Checked;
  Shifts   := Trunc(AShifts);
end;

procedure TFrmShopSU_Shift.ProcessTimeOffForWorkCenter;
var
  ADay    : TDateTime;
  AEndDate: TDateTime;
begin
  DeleteInCalendarForWorkCenter;

  ADay    := GetProdDateStart1stShift( DateTimePicker1.DateTime );
  AEndDate:= GetProdDateStart1stShift( DateTimePicker2.DateTime );
  while ADay <= AEndDate do
  begin
    Status:= Format('Time off for %s. Processing %s', [ FEqNo, DateToStr( ADay )]);
    CheckDayOff( ADay );
    ADay:= ADay + 1;
  end;
end;

function TFrmShopSU_Shift.GetProdDateStart1stShift( ADay: TDateTime ): TDateTime;
begin
  with procProd_Date do
  begin
    ParamByName('v_calendar_date').asDateTime:= ADay;
    ParamByName('v_mfgcell_id').Value:= FMfgCell_ID;

    ExecProc;
    Result:= ParamByName('result').asDateTime;
  end;
end;


procedure TFrmShopSU_Shift.DeleteInCalendarForWorkCenter;
var
  AFrom, ATo: string;
begin
  AFrom:= DateTimeToStr( GetProdDateStart1stShift( DateTimePicker1.DateTime ));
  ATo  := DateTimeToStr( GetProdDateStart1stShift( DateTimePicker2.DateTime ) + 1 - 1/86400 );

  Status:= Format('Removing %s calendar data between %s and %s ...', [ FEqNo, AFrom, ATo ]);
  ExecuteCommandFmt('delete from calendar where work_cntr_id = %f and '+
            'start_time between to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS'') and to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS'')',
            [ FWork_Center_ID,
              FormatDateTime('mm/dd/yyyy hh:nn:ss', StrToDateTime( AFrom )),
              FormatDateTime('mm/dd/yyyy hh:nn:ss', StrToDateTime( ATo   ))]);
end;

{passed ADay represents production date starting with the time of shift# 1}
procedure TFrmShopSU_Shift.CheckDayOff( ADay:TDateTime  );
var
  AShift1, AShift2, AShift3, AShift4: Boolean;
  ADoW: Integer;
begin
  {calc day of week. Make Mon = 1}
  ADoW:= IQDoW(ADay) - 1;
  if ADow = 0 then ADow := 7;

  AShift1:= Work1 and (ADow <= Days_Week);
  AShift2:= Work2 and (ADow <= Days_Week);
  AShift3:= Work3 and (ADow <= Days_Week);
  AShift4:= Work4 and (ADow <= Days_Week);

  CheckCreateTimeOff( ADay,
                      Days_Week,
                      Shifts,
                      AShift1, AShift2, AShift3, AShift4,
                      FloatToStr(FWork_Center_ID),
                      Duration1, Duration2, Duration3, Duration4,
                      FMfgCell_ID )
end;

end.


