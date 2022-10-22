unit RTDwnQry;

{ Form descendents:
  If a change is made to the form design, please also check the
  touch-screen version, and modify as need.

  [+] TRTDwnQryEntry
      -> TSDDwnQryEntry [SDDwnQry.pas]

}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  RtTypes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker;

type
  { TRTDwnQryEntry }
  TRTDwnQryEntry = class(TUniForm)
    cboxInterval: TUniComboBox;
    cboxMach: TUniComboBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    eMfgNo: TUniEdit;
    sbtnSelectMfgNo: TUniSpeedButton;
    eShift: TUniEdit;
    QryParams: TFDQuery;
    rbtnMach: TUniCheckBox;
    rbtnProdDate: TUniCheckBox;
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    Timer1: TUniTimer;
    PkMfgID: TBCDField;
    eProdDate: TUniDateTimePicker;
    rbtnShift: TUniCheckBox;
    rbtnMfgNo: TUniCheckBox;
    Label6: TUniLabel;
    wwDBComboBoxMfgType: TUniDBLookupComboBox;
    chkMfgType: TUniCheckBox;
    QryMfgType: TFDQuery;
    QryMfgTypeMFGTYPE: TStringField;
    QryMfgTypeDESCRIP: TStringField;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    BitBtn1: TUniBitBtn;
    BitBtn2: TUniBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cboxIntervalChange(Sender: TObject);
    procedure eShiftExit(Sender: TObject);
    procedure cboxMachChange(Sender: TObject);
    procedure rbtnMachClick(Sender: TObject);
    procedure eProdDateChange(Sender: TObject);
    procedure rbtnProdDateClick(Sender: TObject);
    procedure eShiftChange(Sender: TObject);
    procedure rbtnShiftClick(Sender: TObject);
    procedure eMfgNoChange(Sender: TObject);
    procedure rbtnMfgNoClick(Sender: TObject);
    procedure sbtnSelectMfgNoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkMfgTypeClick(Sender: TObject);
    procedure wwDBComboBoxMfgTypeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ResetTimer;
    function GetWork_Center_ID: Real;
    function GetStandard_ID: Real;
    procedure Validate;
    procedure SetWork_Center_ID(const Value: Real);
    function GetMfgType: string;
    function GetShowAllWorkCenters: Boolean;
    procedure SetShowAllWorkCenters(const Value: Boolean);
    function GetMFGNo: string;
    function GetProdDate: TDateTime;
    function GetProdShift: Integer;
    function GetWorkCenterName: string;
    function GetInterval: TDownTimeInterval;
    procedure SetCurrentProdDate(const Value: TDateTime);
    procedure SetCurrentShift(const Value: Integer);
  public
    { Public declarations }
    FCurrentShift: Integer;
    FCurrentProdDate: TDateTime;

    property Work_Center_ID: Real read GetWork_Center_ID write SetWork_Center_ID;
    property WorkCenterName: string read GetWorkCenterName;
    property Standard_ID: Real read GetStandard_ID;
    property MfgType: string read GetMfgType;
    property ShowAllWorkCenters: Boolean read GetShowAllWorkCenters write SetShowAllWorkCenters;
    property ProductionDate: TDateTime read GetProdDate;
    property ProductionShift: Integer read GetProdShift;
    property MFGNo: string read GetMFGNo;
    property Interval: TDownTimeInterval read GetInterval;
    property CurrentShift: Integer write SetCurrentShift;
    property CurrentProdDate: TDateTime write SetCurrentProdDate;
  end;

  { TRTDwnQryEntryClass }
  TRTDwnQryEntryClass = class of TRTDwnQryEntry;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;

{ TRTDwnQryEntry }

procedure TRTDwnQryEntry.SetCurrentProdDate(const Value: TDateTime);
begin
  FCurrentProdDate:= Value;
end;

procedure TRTDwnQryEntry.SetCurrentShift(const Value: Integer);
begin
  FCurrentShift   := Value;
end;

procedure TRTDwnQryEntry.FormCreate(Sender: TObject);
begin
  cboxInterval.ItemIndex:= 0;
  cboxIntervalChange(Sender);

  with TFDQuery.Create(self) do
  try
    ConnectionName:= 'IQFD';
    SQL.Add('Select eqno, id from work_center where is_rt = ''Y'' and misc.eplant_filter( eplant_id ) = 1 order by EqNo');
    Open;
    cboxMach.Items.Clear;
    while not Eof do
    begin
      cboxMach.Items.AddObject( Fields[0].asString, Pointer( FieldByName('id').asInteger ));
      Next;
    end;
    cboxMach.ItemIndex:= -1;
  finally
    Close; Free;
  end;

  Timer1.Interval:= GetEscGridTime;
  ResetTimer;
end;

procedure TRTDwnQryEntry.FormShow(Sender: TObject);
begin
  // 07/10/2014 Restore check box from Registry.
  // EIQ-3642 SER# 05718 - Remove automatic filter on Work Center# in Down Time screen
  { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TRTDwnQryEntry'
  IQMS.Common.Controls.CenterForm(Self, True);}
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, rbtnMach]);
  IQSetTablesActive( TRUE, self );
end;

procedure TRTDwnQryEntry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // 07/10/2014 Restore check box from Registry.
  // EIQ-3642 SER# 05718 - Remove automatic filter on Work Center# in Down Time screen
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, rbtnMach]);
end;

procedure TRTDwnQryEntry.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TRTDwnQryEntry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ResetTimer;
end;

procedure TRTDwnQryEntry.cboxIntervalChange(Sender: TObject);
begin
  eProdDate.Enabled  := cboxInterval.ItemIndex = Ord( inPastShift ) - 1;
  eShift.Enabled     := cboxInterval.ItemIndex = Ord( inPastShift ) - 1;

  rbtnProdDate.Enabled:= cboxInterval.ItemIndex = Ord( inPastShift ) - 1;
  if not rbtnProdDate.Enabled then
     rbtnProdDate.Checked:= FALSE;

  rbtnShift.Enabled   := cboxInterval.ItemIndex = Ord( inPastShift ) - 1;
  if not rbtnShift.Enabled then
     rbtnShift.Checked:= FALSE;

  if cboxInterval.ItemIndex < Ord(inPastShift) - 1 then {current prod date & shift}
  begin
    if (FCurrentShift > 0) and (FCurrentProdDate > 0) then
       begin
         eProdDate.DateTime:= FCurrentProdDate;
         eShift.Text   := IntToStr( FCurrentShift );
       end

    else with QryParams do  // s/n happen
       try
         QryParams.Open;
         eProdDate.Text:= FieldByName('PROD_DATE').asString;
         eShift.Text   := FieldByName('PROD_SHIFT').asString;
       finally
         QryParams.Close;
       end;
  end;
end;

procedure TRTDwnQryEntry.eShiftExit(Sender: TObject);
begin
  if StrToIntDef(eShift.Text, 0) > 4 then
     raise Exception.Create('Shift must be from 1 to 4, or be empty to include all shifts.')
end;

procedure TRTDwnQryEntry.cboxMachChange(Sender: TObject);
begin
  rbtnMach.Checked:= Trim(cboxMach.Text) = ''; // (cBoxMach.ItemIndex < 0) and (Trim(cboxMach.Text) = '');
end;

procedure TRTDwnQryEntry.chkMfgTypeClick(Sender: TObject);
begin
  if chkMfgType.Checked then
     wwDBComboBoxMfgType.Text:= '';
end;

procedure TRTDwnQryEntry.rbtnMachClick(Sender: TObject);
begin
  if rbtnMach.Checked then cBoxMach.ItemIndex:= -1;
end;

procedure TRTDwnQryEntry.eProdDateChange(Sender: TObject);
var
  ANotifyEvent: TNotifyEvent;
begin
  // rbtnProdDate.Checked:= eProdDate.Text = '  /  /  ';
  ANotifyEvent:= rbtnProdDate.OnClick;
  try
    rbtnProdDate.OnClick:= nil;
    rbtnProdDate.Checked:= eProdDate.DateTime = 0;
  finally
    rbtnProdDate.OnClick:= ANotifyEvent;
  end;
end;

procedure TRTDwnQryEntry.rbtnProdDateClick(Sender: TObject);
var
  ANotifyEvent: TNotifyEvent;
begin
  // if rbtnProdDate.Checked then eProdDate.Text:= '  /  /  ';
  ANotifyEvent:= eProdDate.OnChange;
  try
    eProdDate.OnChange:= nil;
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'Clear'
    if rbtnProdDate.Checked then
       eProdDate.Clear;}
  finally
    eProdDate.OnChange:= ANotifyEvent
  end;
end;

procedure TRTDwnQryEntry.eShiftChange(Sender: TObject);
begin
  rbtnShift.Checked:= StrToIntDef(eShift.Text,0) = 0;
end;

procedure TRTDwnQryEntry.rbtnShiftClick(Sender: TObject);
begin
  if rbtnShift.Checked then eShift.Text:= '';
end;

procedure TRTDwnQryEntry.eMfgNoChange(Sender: TObject);
begin
  rbtnMfgNo.Checked:= Trim(eMfgNo.Text) = '';

  if Trim(eMfgNo.Text) = '' then
    eMfgNo.Tag:= 0;
end;

procedure TRTDwnQryEntry.rbtnMfgNoClick(Sender: TObject);
begin
  if rbtnMfgNo.Checked then eMfgNo.Text:= '';

  if Trim(eMfgNo.Text) = '' then
    eMfgNo.Tag:= 0;
end;

procedure TRTDwnQryEntry.sbtnSelectMfgNoClick(Sender: TObject);
begin
  if PkMfg.Execute then
  begin
    eMfgNo.Text:= PkMfg.GetValue('MFGNO');
    eMfgNo.Tag := PkMfg.GetValue('ID');
  end;
end;

function TRTDwnQryEntry.GetInterval: TDownTimeInterval;
begin
  Result := TDownTimeInterval(cBoxInterval.ItemIndex + 1);
end;

function TRTDwnQryEntry.GetMFGNo: string;
begin
  // rbtnMfgNo ?
  Result := eMfgNo.Text;
end;

function TRTDwnQryEntry.GetMfgType: string;
begin
  if chkMfgType.Checked then
     Result:= ''
  else
     Result:= wwDBComboBoxMfgType.Text;
end;

function TRTDwnQryEntry.GetProdDate: TDateTime;
begin
  Result := eProdDate.DateTime;
end;

function TRTDwnQryEntry.GetProdShift: Integer;
var
  i: Integer;
begin
  Result := 0;
  if IQMS.Common.Numbers.IsStringValidInteger(eShift.Text, i) then
    Result := i;
end;

function TRTDwnQryEntry.GetStandard_ID: Real;
begin
  Result:= 0;
  if eMfgNo.Text > '' then
     Result:= eMfgNo.Tag;
end;

function TRTDwnQryEntry.GetWorkCenterName: string;
begin
  Result := cboxMach.Text;
end;

function TRTDwnQryEntry.GetWork_Center_ID: Real;
begin
  Result:= 0;
  if not rbtnMach.Checked and (cboxMach.Text > '') then
     Result:= LongInt(cboxMach.Items.Objects[ cboxMach.ItemIndex ]);
end;

procedure TRTDwnQryEntry.SetWork_Center_ID(const Value: Real);
var
  i: Integer;
begin
  if Value < 0 then
    cboxMach.ItemIndex := -1
  else
    begin
      for I := 0 to cboxMach.Items.Count do
        if LongInt(cboxMach.Items.Objects[i]) = Value then
          begin
            cboxMach.ItemIndex := i;
            rbtnMach.Checked := False;
            Break;
          end;
    end;
end;

procedure TRTDwnQryEntry.Timer1Timer(Sender: TObject);
begin
  //Close;
end;

procedure TRTDwnQryEntry.ResetTimer;
begin
  //Timer1.Enabled:= FALSE;
  //if Timer1.Interval > 0 then
  //  Timer1.Enabled:= TRUE;
end;

procedure TRTDwnQryEntry.BitBtn1Click(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TRTDwnQryEntry.Validate;
begin
  if not chkMfgType.Checked then
     IQAssert( wwDBComboBoxMfgType.Text > '', 'Mfg Type is not assigned - operation aborted' );

  if not rbtnMach.Checked then
     IQAssert( cboxMach.Text > '', 'Work center is not assigned - operation aborted' );

  if not rbtnProdDate.Checked then
     IQAssert( eProdDate.DateTime > 0, 'Prod Date is not assigned - operation aborted' );

  if not rbtnShift.Checked then
     IQAssert( StrToIntDef(eShift.Text, 0) > 0, 'Shift is not assigned - operation aborted' );

  if not rbtnMfgNo.Checked then
     IQAssert( eMfgNo.Text > '', 'Mfg# is not assigned - operation aborted' );
end;

procedure TRTDwnQryEntry.wwDBComboBoxMfgTypeChange(Sender: TObject);
begin
  chkMfgType.Checked:= Trim(wwDBComboBoxMfgType.Text) = '';
end;

function TRTDwnQryEntry.GetShowAllWorkCenters: Boolean;
begin
  Result := rbtnMach.Checked;
end;

procedure TRTDwnQryEntry.SetShowAllWorkCenters(const Value: Boolean);
begin
  rbtnMach.Checked := Value;
  rbtnMachClick(rbtnMach);
end;

end.
