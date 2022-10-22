unit IQMS.Common.DateRangeDlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Math,
  IQMS.WebVcl.DateControls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TDateRangeRec = record
   ByRange: Boolean;
   TodayOnly: Boolean;
   StartDateTime: TDateTime;
   EndDateTime: TDateTime;
  end;

  TFrmDatesRangeDialog = class(TUniForm)
    Panel1: TUniPanel;
    PnlMain: TUniPanel;
    gbDateRange: TUniGroupBox;
    lblFrom: TUniLabel;
    lblTo: TUniLabel;
    dtpStartDate: TUniDateTimePicker;
    dtpEndDate: TUniDateTimePicker;
    btnToday: TUniButton;
    lblSummary: TUniLabel;
    Panel2: TUniPanel;
    btnNone: TUniButton;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    dtpStartTime: TIQWebTimeComboBox;
    dtpEndTime: TIQWebTimeComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnTodayClick(Sender: TObject);
    procedure btnNoneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FTodayOnly: Boolean;
    FByRange: Boolean;
    function GetStartDateTime: TDateTime;
    function GetEndDateTime: TDateTime;
    procedure SetStartDateTime(const Value: TDateTime);
    procedure SetEndDateTime(const Value: TDateTime);
    procedure PositionControls;
    procedure ShowRangeControls(const AVisible: Boolean);
    procedure GetRec(var ARec: TDateRangeRec);
  public
    { Public declarations }
    procedure xCreate( AStartDateTime,AEndDateTime: TDateTime);
    procedure xCreateEx( ADateRangeRec: TDateRangeRec);

    property StartDateTime: TDateTime read GetStartDateTime write SetStartDateTime;
    property EndDateTime: TDateTime read GetEndDateTime write SetEndDateTime;
    property ByRange: Boolean read FByRange;
    property TodayOnly: Boolean read FTodayOnly;
  end;

function DoDateRangeDialog(var AStartDateTime,
                              AEndDateTime: TDateTime): Boolean; overload;

function DoDateRangeDialog(var AStartDateTime,
                              AEndDateTime: TDateTime;
                          var ATodayOnly: Boolean;
                          var AByRange: Boolean): Boolean; overload;

function DoDateRangeDialog(var ADateRangeRec: TDateRangeRec): Boolean; overload;


resourcestring
   cTXT000001 = 'Date Range';
   cTXT000002 = 'By Range';
   cTXT000003 = 'Today only';
   cTXT000004 = 'No filter';
   cTXT000005 = 'Invalid date range.  Your end date is before your start ' +
    'date.  Please check your dates.';


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.Miscellaneous;

function DoDateRangeDialog(var AStartDateTime,
                              AEndDateTime: TDateTime): Boolean; overload;
var
  FrmDatesRangeDialog: TFrmDatesRangeDialog;
begin
  FrmDatesRangeDialog:= TFrmDatesRangeDialog.Create(uniGUIApplication.UniApplication);
  with FrmDatesRangeDialog do
  begin
     xCreate(AStartDateTime, AEndDateTime);
     Result:= ShowModal = mrOK;
     if Result then
     begin
       AStartDateTime:= StartDateTime;
       AEndDateTime  := EndDateTime;
     end;
  end
end;

function DoDateRangeDialog(var AStartDateTime,
                              AEndDateTime: TDateTime;
                          var ATodayOnly: Boolean;
                          var AByRange: Boolean): Boolean; overload;
var
  FrmDatesRangeDialog: TFrmDatesRangeDialog;
begin
  FrmDatesRangeDialog:= TFrmDatesRangeDialog.Create(uniGUIApplication.UniApplication);
  with FrmDatesRangeDialog do
  begin
     xCreate(AStartDateTime, AEndDateTime);
     ShowRangeControls(True);
     Result:= ShowModal = mrOK;
     if Result then
     begin
       AStartDateTime:= StartDateTime;
       AEndDateTime  := EndDateTime;
       ATodayOnly    := FTodayOnly;
       AByRange      := FByRange;
     end;
  end
end;

function DoDateRangeDialog(var ADateRangeRec: TDateRangeRec): Boolean;
var
  FrmDatesRangeDialog: TFrmDatesRangeDialog;
begin
  FrmDatesRangeDialog:= TFrmDatesRangeDialog.Create(uniGUIApplication.UniApplication);
  with FrmDatesRangeDialog do
  begin
     xCreateEx(ADateRangeRec);
     Result:= ShowModal = mrOK;
     if Result then
        GetRec(ADateRangeRec);
  end
end;

{ TFrmDatesRangeDialog }

procedure TFrmDatesRangeDialog.xCreate(AStartDateTime,
 AEndDateTime: TDateTime);
begin

  if Trunc(AStartDateTime) > 0 then StartDateTime:= AStartDateTime
  else btnTodayClick(NIL);

  if Trunc(AEndDateTime) > 0 then EndDateTime := AEndDateTime
  else EndDateTime   := StartDateTime;

  ShowRangeControls(False);

//  CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
  //IQRegFormRead(Self, [Self]); // iqregfrm.pas

end;

procedure TFrmDatesRangeDialog.xCreateEx(
  ADateRangeRec: TDateRangeRec);
begin
  xCreate(ADateRangeRec.StartDateTime,
   ADateRangeRec.EndDateTime); // call constructor above

  if ADateRangeRec.ByRange then
     lblSummary.Caption := Format('%s: %s',
       [cTXT000001 {Date Range}, cTXT000002 {'By Range'}])
  else if ADateRangeRec.TodayOnly then
     lblSummary.Caption := Format('%s: %s',
       [cTXT000001 {Date Range}, cTXT000003 {Today only}])
  else lblSummary.Caption := Format('%s: %s',
    [cTXT000001 {Date Range}, cTXT000004 {No Filter}]);

  ShowRangeControls(True);
end;

procedure TFrmDatesRangeDialog.FormShow(Sender: TObject);
begin
  PositionControls;
end;

procedure TFrmDatesRangeDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IQRegFormWrite(Self, [Self]); // iqregfrm.pas
end;

procedure TFrmDatesRangeDialog.PositionControls;
var
   l: Integer;
begin
  // Get the maximum left for the controls
  l := Max(lblFrom.Left + lblFrom.Width + 16,
           lblTo.Left + lblTo.Width + 16);

  // Position start date controls
  dtpStartDate.Left := l;
  dtpStartTime.Left := dtpStartDate.Left + dtpStartDate.Width + 4;

  // Align end date controls so they are equal
  dtpEndDate.Left := dtpStartDate.Left;
  dtpEndTime.Left := dtpStartTime.Left;
  btnToday.Left := dtpStartDate.Left;
end;

procedure TFrmDatesRangeDialog.ShowRangeControls(const AVisible: Boolean);
begin
  lblSummary.Visible := AVisible;
  btnNone.Visible := AVisible;
  btnToday.Visible := AVisible;
end;

procedure TFrmDatesRangeDialog.GetRec(var ARec: TDateRangeRec);
begin
  with ARec do
  begin
   ByRange := Self.ByRange;
   TodayOnly := Self.TodayOnly;
   StartDateTime := Self.StartDateTime;
   EndDateTime := Self.EndDateTime;
  end;
end;

procedure TFrmDatesRangeDialog.btnOKClick(Sender: TObject);
begin
  if StartDateTime > EndDateTime then
     begin
       ModalResult := mrNone;
       {'Invalid date range.  Your end date is before your start ' +
        'date.  Please check your dates.'}
       raise Exception.Create(cTXT000005);
     end;
  FTodayOnly:= FALSE;
  FByRange:= TRUE;
  ModalResult:= mrOK;
end;

// Property StartDateTime
function TFrmDatesRangeDialog.GetStartDateTime: TDateTime;
begin
  Result := Trunc(dtpStartDate.DateTime) + Frac(dtpStartTime.Time);
end;

procedure TFrmDatesRangeDialog.SetStartDateTime(const Value: TDateTime);
begin
  dtpStartDate.DateTime := Trunc(Value);
  dtpStartTime.Time := Frac(Value);
end;

// Property EndDateTime
function TFrmDatesRangeDialog.GetEndDateTime: TDateTime;
begin
  Result := Trunc(dtpEndDate.DateTime) + Frac(dtpEndTime.Time);
end;

procedure TFrmDatesRangeDialog.SetEndDateTime(const Value: TDateTime);
begin
  dtpEndDate.DateTime := Trunc(Value);
  dtpEndTime.Time := Frac(Value);
end;

procedure TFrmDatesRangeDialog.btnTodayClick(Sender: TObject);
var
   AStart, AEnd: TDateTime;
begin
  if IQMS.Common.Miscellaneous.EnsureConnectionExists() then
     begin
      StartDateTime := IQOracleAdjustedDate + IQMS.Common.Dates.TIME_800;
      EndDateTime := IQOracleAdjustedDate + IQMS.Common.Dates.TIME_1700;
     end
  else
     begin
      StartDateTime := Date() + IQMS.Common.Dates.TIME_800;
      EndDateTime := Date() + IQMS.Common.Dates.TIME_1700;
     end;
  FTodayOnly:= TRUE;
  FByRange:= FALSE;
  ModalResult := mrOk;
end;

procedure TFrmDatesRangeDialog.btnNoneClick(Sender: TObject);
begin
  FTodayOnly:= FALSE;
  FByRange:= FALSE;
  ModalResult := mrOk;
end;

end.
