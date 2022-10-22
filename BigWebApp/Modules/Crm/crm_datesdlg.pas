unit crm_datesdlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
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
  uniMainMenu,
  uniLabel;

type
  TFrmCRMDatesDialog = class(TUniForm)
    Panel1: TUniPanel;
    PnlMain: TUniPanel;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    dtpStartDate: TUniDateTimePicker;
    dtpEndDate: TUniDateTimePicker;
    dtpStartTime: TUniDateTimePicker;
    dtpEndTime: TUniDateTimePicker;
    btnToday: TUniButton;
    lblCRMTodayDateRange: TUniLabel;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    Panel2: TUniPanel;
    btnNone: TUniButton;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnTodayClick(Sender: TObject);
    procedure btnNoneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetStartDateTime: TDateTime;
    function GetEndDateTime: TDateTime;
    procedure SetStartDateTime(const Value: TDateTime);
    procedure SetEndDateTime(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    FTodayOnly: Boolean;
    FByRange: Boolean;
    constructor Create(AOwner: TComponent; AStartDateTime,
      AEndDateTime: TDateTime);

    property StartDateTime: TDateTime read GetStartDateTime
      write SetStartDateTime;
    property EndDateTime: TDateTime read GetEndDateTime write SetEndDateTime;

  end;

function DoCRMDatesDialog(AOwner: TComponent;
  var AStartDateTime, AEndDateTime: TDateTime): Boolean;
function DoCRMTodayDatesDialog(AOwner: TComponent; var AStartDateTime,
  AEndDateTime: TDateTime; var ATodayOnly: Boolean;
  var AByRange: Boolean): Boolean;

var
  FrmCRMDatesDialog: TFrmCRMDatesDialog;

implementation

{$R *.DFM}


uses
  crm_context,
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.HelpHook,
  IQMS.Common.RegFrm;

function DoCRMDatesDialog(AOwner: TComponent;
  var AStartDateTime, AEndDateTime: TDateTime): Boolean;
begin
  with TFrmCRMDatesDialog.Create(AOwner, AStartDateTime, AEndDateTime) do
    try
      Result := ShowModal = mrOK;
      if Result then
        begin
          AStartDateTime := StartDateTime;
          AEndDateTime := EndDateTime;
        end;
    finally
      Free;
    end
end;

function DoCRMTodayDatesDialog(AOwner: TComponent; var AStartDateTime,
  AEndDateTime: TDateTime; var ATodayOnly: Boolean;
  var AByRange: Boolean): Boolean;
begin
  with TFrmCRMDatesDialog.Create(AOwner, AStartDateTime, AEndDateTime) do
    try
      Result := ShowModal = mrOK;
      if Result then
        begin
          AStartDateTime := StartDateTime;
          AEndDateTime := EndDateTime;
          ATodayOnly := FTodayOnly;
          AByRange := FByRange;
        end;
    finally
      Free;
    end
end;

constructor TFrmCRMDatesDialog.Create(AOwner: TComponent;
  AStartDateTime, AEndDateTime: TDateTime);
begin
  inherited Create(AOwner);
  if Trunc(AStartDateTime) > 0 then
    StartDateTime := AStartDateTime
  else
    btnTodayClick(NIL);

  if Trunc(AEndDateTime) > 0 then
    EndDateTime := AEndDateTime
  else
    EndDateTime := StartDateTime;
  CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
  if CRMContext.CRMToday.ByRange then
    lblCRMTodayDateRange.Caption :=
      Format('%s %s', [crm_rscstr.cTXT0000109 { Date Range } ,
      crm_rscstr.cTXT0000146 { 'By Range' } ])
  else if CRMContext.CRMToday.TodayOnly then
    lblCRMTodayDateRange.Caption :=
      Format('%s %s', [crm_rscstr.cTXT0000109 { Date Range } ,
      crm_rscstr.cTXT0000144 { Today only } ])
  else
    lblCRMTodayDateRange.Caption :=
      Format('%s %s', [crm_rscstr.cTXT0000109 { Date Range } ,
      crm_rscstr.cTXT0000145 { No Filter } ]);
end;

procedure TFrmCRMDatesDialog.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMDatesDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // IQMS.Common.RegFrm.pas
  Action := caFree;
end;

procedure TFrmCRMDatesDialog.btnOKClick(Sender: TObject);
begin
  if StartDateTime > EndDateTime then
    begin
      ModalResult := mrNone;
      raise Exception.Create
        ('Invalid date range.  Your end date is before your start date.  Please check your dates.');
    end;
  FTodayOnly := FALSE;
  FByRange := TRUE;
  ModalResult := mrOK;
end;

// Property StartDateTime
function TFrmCRMDatesDialog.GetStartDateTime: TDateTime;
begin
  Result := Trunc(dtpStartDate.Date) + Frac(dtpStartTime.Time);
end;

procedure TFrmCRMDatesDialog.SetStartDateTime(const Value: TDateTime);
begin
  dtpStartDate.Date := Value;
  dtpStartTime.Time := Value;
end;

// Property EndDateTime
function TFrmCRMDatesDialog.GetEndDateTime: TDateTime;
begin
  Result := Trunc(dtpEndDate.Date) + Frac(dtpEndTime.Time);
end;

procedure TFrmCRMDatesDialog.SetEndDateTime(const Value: TDateTime);
begin
  dtpEndDate.Date := Value;
  dtpEndTime.Time := Value;
end;

procedure TFrmCRMDatesDialog.btnTodayClick(Sender: TObject);
var
  AStart, AEnd: TDateTime;
begin
  StartDateTime := IQOracleAdjustedDate + TIME_800AM;
  EndDateTime := IQOracleAdjustedDate + TIME_500PM;
  FTodayOnly := TRUE;
  FByRange := FALSE;
  ModalResult := mrOK;
end;

procedure TFrmCRMDatesDialog.btnNoneClick(Sender: TObject);
begin
  FTodayOnly := FALSE;
  FByRange := FALSE;
  ModalResult := mrOK;
end;

procedure TFrmCRMDatesDialog.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

end.
