unit APRepl;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Spin,
  Mask,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniRadioButton,
  uniSpinEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDateTimePicker;

type
  TFrmAPReplicate = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    GroupBox1: TUniGroupBox;
    seDay: TUniSpinEdit;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    seRepl: TUniSpinEdit;
    RbDom: TUniRadioButton;
    RbEveryNth: TUniRadioButton;
    dbEveryNth: TUniDateTimePicker;
    Label2: TUniLabel;
    Label3: TUniLabel;
    RbByWeeky: TUniRadioButton;
    Label4: TUniLabel;
    dbBiWeekly: TUniDateTimePicker;
    RbQuaterly: TUniRadioButton;
    Label5: TUniLabel;
    sbDaysInCycle: TUniSpinEdit;
    dbQuaterly: TUniDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RbEveryNthClick(Sender: TObject);
    procedure RbDomClick(Sender: TObject);
    procedure RbByWeekyClick(Sender: TObject);
    procedure RbQuaterlyClick(Sender: TObject);
    procedure sbDaysInCycleExit(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FRepType : string;

    function  GetTimes   : integer;
    function  GetDay     : integer;
    function  GetDate    : TDateTime;
  public
    { Public declarations }

    property Times    : integer   read GetTimes;
    property RepType  : string    read FRepType;
    property Day      : integer   read GetDay;
    property Date     : TDateTime read GetDate;
  end;

function GetAPReplicate(var ATimes: Integer; var ADay: Integer; var ARepType: string; var AStartDate: TDateTime):Boolean;

implementation

uses
  MainModule,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ap_rscstr;

{$R *.DFM}

function GetAPReplicate(var ATimes: Integer; var ADay: Integer; var ARepType: string; var AStartDate: TDateTime):Boolean;
var
  aFrmAPReplicate : TFrmAPReplicate;
begin
  aFrmAPReplicate := TFrmAPReplicate.Create(UniApplication);

  Result := aFrmAPReplicate.ShowModal = mrOk;
  if Result then
    with aFrmAPReplicate do
    begin
      ATimes   := Times;
      ARepType := RepType;

      if ARepType = 'DAYOFMONTH' then
      begin
        ADay := Day;
      end
      else if ARepType = 'NTHDAY' then
      begin
        AStartDate := Date;
        ADay  := Day;
      end
      else if ARepType = 'BIWEEKLY'   then
      begin
        AStartDate := Date;
      end
      else if ARepType = 'QUARTERLY'  then
      begin
        AStartDate := Date;
      end;
    end;
end;

procedure TFrmAPReplicate.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);

  RbDom.Checked := true;
  seDay.Enabled := true;
  dbEveryNth.Enabled := false;
  sbDaysInCycle.Enabled := false;
  dbBiWeekly.Enabled := false;
  dbQuaterly.Enabled := false;
  dbEveryNth.DateTime := Date;
  dbBiWeekly.DateTime := Date;
  dbQuaterly.DateTime := Date;
  FRepType := 'DAYOFMONTH';

  IQSetTablesActive( TRUE, self );
end;

procedure TFrmAPReplicate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmAPReplicate.RbEveryNthClick(Sender: TObject);
begin
 if RbEveryNth.Checked then
 begin
  FRepType := 'NTHDAY';
  seDay.Enabled         := false;
  dbEveryNth.Enabled    := true;
  sbDaysInCycle.Enabled := true;
  dbBiWeekly.Enabled    := false;
  dbQuaterly.Enabled    := false;
 end;
end;

procedure TFrmAPReplicate.RbDomClick(Sender: TObject);
begin
 if RbDom.Checked then
 begin
  FRepType := 'DAYOFMONTH';
  seDay.Enabled         := true;
  dbEveryNth.Enabled    := false;
  sbDaysInCycle.Enabled := false;
  dbBiWeekly.Enabled    := false;
  dbQuaterly.Enabled    := false;
 end;
end;

procedure TFrmAPReplicate.RbByWeekyClick(Sender: TObject);
begin
 if RbByWeeky.Checked then
 begin
  FRepType := 'BIWEEKLY';
  seDay.Enabled         := false;
  dbEveryNth.Enabled    := false;
  sbDaysInCycle.Enabled := false;
  dbBiWeekly.Enabled    := true;
  dbQuaterly.Enabled    := false;
 end;
end;

procedure TFrmAPReplicate.RbQuaterlyClick(Sender: TObject);
begin
 if RbQuaterly.Checked then
 begin
  FRepType := 'QUARTERLY';
  seDay.Enabled         := false;
  dbEveryNth.Enabled    := false;
  sbDaysInCycle.Enabled := false;
  dbBiWeekly.Enabled    := false;
  dbQuaterly.Enabled    := true;
 end;
end;

procedure TFrmAPReplicate.sbDaysInCycleExit(Sender: TObject);
var
  ADay : integer;
begin
  ADay   := sbDaysInCycle.Value;
  if ADay > 31 then
  begin
    sbDaysInCycle.SetFocus;
    raise exception.Create(ap_rscstr.cTXT0000089);
  end;
end;

function TFrmAPReplicate.GetDate: TDateTime;
begin
  if FRepType = 'NTHDAY' then
    Result := dbEveryNth.DateTime
  else if FRepType = 'BIWEEKLY' then
    Result := dbBiWeekly.DateTime
  else if FRepType = 'QUARTERLY' then
    Result := dbQuaterly.DateTime
  else
    Result := 0;
end;

function TFrmAPReplicate.GetDay: integer;
begin
  if FRepType = 'DAYOFMONTH' then
    Result := seDay.Value
  else if FRepType = 'NTHDAY' then
    Result := sbDaysInCycle.Value
  else
    Result := 1;
end;

function TFrmAPReplicate.GetTimes: integer;
begin
  Result := seRepl.Value;
end;

end.
