unit crm_addholiday;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmCRMAddHoliday = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    PnlButtonsRight: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    edtHoliday: TUniEdit;
    cmbStart: TUniDateTimePicker;
    cmbEnd: TUniDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure InsertHolidayValues;
  public
    { Public declarations }
  end;

function AddCRMHoliday(var AName: String; var AStartDate, AEndDate: TDateTime)
  : Boolean; overload;
function AddCRMHoliday: Boolean; overload;

var
  FrmCRMAddHoliday: TFrmCRMAddHoliday;

implementation

{$R *.dfm}


uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

function AddCRMHoliday: Boolean; overload;
var
  AName: String;
  AStartDate, AEndDate: TDateTime;
begin
  AStartDate := Date;
  AEndDate := Date + 1;
  Result := AddCRMHoliday(AName, AStartDate, AEndDate);
end;

function AddCRMHoliday(var AName: String;
  var AStartDate, AEndDate: TDateTime): Boolean;
begin
  with TFrmCRMAddHoliday.Create(Application) do
    try
      // Adjust dates as needed
      if AStartDate < 60 then
        begin
          AStartDate := Date;
          AEndDate := Date + 1;
        end;
      if AEndDate < 60 then
        AEndDate := AStartDate + 1;

      // pre-populate data values
      cmbStart.Date := AStartDate;
      cmbEnd.Date := AEndDate;

      Result := ShowModal = mrOk;
      if Result then
        begin
          AName := edtHoliday.Text;
          AStartDate := Trunc(cmbStart.Date);
          AEndDate := Trunc(cmbEnd.Date);
        end;
    finally
      Free;
    end;
end;

procedure TFrmCRMAddHoliday.FormCreate(Sender: TObject);
begin
  CenterForm(Self);
end;

procedure TFrmCRMAddHoliday.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01]);
end;

procedure TFrmCRMAddHoliday.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01]);
  Action := caFree;
end;

procedure TFrmCRMAddHoliday.btnOkClick(Sender: TObject);
var
  AStart, AEnd: TDateTime;
begin

  AStart := Trunc(cmbStart.Date);
  AEnd := Trunc(cmbEnd.Date);

  // Is Start Date provided?
  if AStart < 60 then
    raise Exception.Create
      (crm_rscstr.cTXT0001379 { 'Please enter a start date.' } );

  // Is End Date provided?
  if AEnd < 60 then
    begin
      AEnd := Trunc(cmbStart.Date) + 1;
      cmbEnd.Date := AEnd;
    end;

  // Is End Date after Start Date?
  if AStart > AEnd then
    raise Exception.Create
      (crm_rscstr.
      cTXT0001381 { 'The End Date preceeds the Start Date.  Please check your dates.' } );

  // Does End Date equal Start Date?  Increment End Date.
  if AStart = AEnd then
    begin
      // 'The Start and End Dates are equal.
      // The system will increment your End Date by one day so that it displays on the CRM Calendar.'
      IQWarning(crm_rscstr.cTXT0001382);
      cmbEnd.Date := Trunc(cmbEnd.Date) + 1;
    end;

  InsertHolidayValues;

  // if we get here, then we are OK
  ModalResult := mrOk;

end;

procedure TFrmCRMAddHoliday.InsertHolidayValues;
var
  ASeq: Integer;
  AStart, AEnd: TDateTime;
  AErrDtl, AName: String;
begin
  try
    AErrDtl := 'Retrieving values.';
    ASeq := Trunc(SelectValueAsFloat
      ('select max( distinct seq ) from crm_holidays')) + 1;
    AStart := Trunc(cmbStart.Date);
    AEnd := Trunc(cmbEnd.Date);
    AName := IQMS.Common.StringUtils.FixStr(edtHoliday.Text);

    AErrDtl := Format('insert into crm_holidays '#13 +
      ' (id, seq, name, start_date, end_date) '#13 +
      'values '#13 +
      ' (s_crm_holidays.nextval, %d, ''%s'', ' +
      '  to_date(''%s'', ''MM/DD/RRRR''), ' +
      '  to_date(''%s'', ''MM/DD/RRRR''))',
      [ASeq, AName,
      FormatDateTime('mm/dd/yyyy', AStart),
      FormatDateTime('mm/dd/yyyy', AEnd)]);
    ExecuteCommand(AErrDtl);
  except
    on E: Exception do
      ShowIQErrorMessage('Error adding holiday.', E.Message, AErrDtl);
  end;
end;

end.
