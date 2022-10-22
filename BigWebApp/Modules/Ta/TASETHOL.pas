unit TaSetHol;

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
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmTaSetHol = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft3: TUniPanel;
    PnlClient3: TUniPanel;
    PnlLeft1: TUniPanel;
    Splitter2: TUniSplitter;
    PnlClient1: TUniPanel;
    PnlLeft2: TUniPanel;
    Splitter3: TUniSplitter;
    PnlClient2: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    dtStartdate: TUniDateTimePicker;
    dtEnddate: TUniDateTimePicker;
    Label3: TUniLabel;
    Label4: TUniLabel;
    dtStartTime: TUniDateTimePicker;
    dtEndTime: TUniDateTimePicker;
    procedure BtnCancelClick(Sender: TObject);
    procedure dtStartdateCloseUp(Sender: TObject);
    procedure dtStartTimeChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FStartDate : TDateTime;
    FEndDate : TDateTime;
    procedure SetEnddate(const Value: TDateTime);
    procedure SetStartDate(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    property StartDate : TDateTime write SetStartDate;
    property EndDate : TDateTime write SetEndDate;
  end;

function DoTAAssignHolidayDates(var AStartdate, AEnddate:TDateTime):Boolean;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  ta_rscstr;

{$R *.DFM}

function DoTAAssignHolidayDates(var AStartdate, AEnddate:TDateTime):Boolean;
var
  LFrmTaSetHol : TFrmTaSetHol;
begin
   LFrmTaSetHol := TFrmTaSetHol.Create(UniGUIApplication.UniApplication);
   LFrmTaSetHol.StartDate := AStartdate;
   LFrmTaSetHol.EndDate := AEnddate;
   LFrmTaSetHol.ShowModal;
   AStartDate := Trunc(LFrmTaSetHol.dtStartDate.Datetime) + Frac(LFrmTaSetHol.dtStartTime.DateTime);
   AEndDate := Trunc(LFrmTaSetHol.dtEndDate.Datetime) + Frac(LFrmTaSetHol.dtEndTime.Datetime);
   Result := LFrmTaSetHol.ModalResult = mrOk;
end;

procedure TFrmTaSetHol.UniFormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient2);
end;

procedure TFrmTaSetHol.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, PnlLeft1, PnlLeft2, PnlLeft3]);
  if FStartdate = 0 then
  begin
    dtStartDate.Datetime := Date;
    dtStartTime.Datetime := Frac(Date);
  end
  else
  begin
    dtStartDate.Datetime := FStartDate;
    dtStartTime.DateTime := Frac(FStartDate);
  end;

  if FEnddate = 0 then
  begin
    dtEndDate.Datetime := Date + 1;
    dtEndTime.Datetime := dtStartTime.DateTime;
  end
  else
  begin
    dtEndDate.Datetime := FEndDate;
    dtEndTime.Datetime := Frac(FEndDate);
  end;
end;

procedure TFrmTaSetHol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlLeft1, PnlLeft2, PnlLeft3]);
end;

procedure TFrmTaSetHol.SetEnddate(const Value: TDateTime);
begin
  FEndDate := Value;
end;

procedure TFrmTaSetHol.SetStartDate(const Value: TDateTime);
begin
  FStartDate := Value;
end;

procedure TFrmTaSetHol.BtnCancelClick(Sender: TObject);
begin
  Close;       
end;

procedure TFrmTaSetHol.dtStartdateCloseUp(Sender: TObject);
begin
  dtEndDate.Datetime := dtStartdate.Datetime + 1;
end;

procedure TFrmTaSetHol.dtStartTimeChange(Sender: TObject);
begin
  dtEndTime.Datetime := dtStartTime.Datetime;
end;

procedure TFrmTaSetHol.BtnOkClick(Sender: TObject);
begin
  if Trunc(dtEndDate.Datetime) + Frac(dtEndTime.Datetime) <=
     Trunc(dtStartDate.Datetime) + Frac(dtStartTime.Datetime) then
     { 'The Start date and time must precede the End date and time.
       Please check your date and time range.'}
     raise Exception.Create(ta_rscstr.cTXT0000184);

  ModalResult := mrOk;
end;

end.
