unit RtdwnAdd;

{ ------------------------------------------------------------------------------
  Developer Notes:

  If adding label and edit controls, assign the FocusControl property
  of the label.  The touchscreen form adjust controls at startup,
  and relies on the FocusControl property for pairing.  Please verify
  that there are no anomolies when called as a touch-screen form.

  ------------------------------------------------------------------------------ }

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Mask,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  Vcl.StdCtrls,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmRTDwnAdd = class(TUniForm)
    PnlLabels: TUniPanel;
    PnlEditControls: TUniPanel;
    PnlButtons: TUniPanel;
    Splitter1: TUniSplitter;
    PnlModalButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    lblWorkCenterNumber: TUniLabel;
    lblMfgNumber: TUniLabel;
    lblEPlantID: TUniLabel;
    lblIntervalStart: TUniLabel;
    lblIntervalEnd: TUniLabel;
    lblDownTimeCode: TUniLabel;
    lblCodeDescription: TUniLabel;
    PkDownCode: TIQWebHPick;
    PkDownCodeDOWN_CODE: TStringField;
    PkDownCodeDOWN_DESCRIP: TStringField;
    PkDownCodeEPLANT_ID: TBCDField;
    PkDownCodeSOURCE: TStringField;
    PnlEditControlsClient: TUniPanel;
    edEqNo: TUniEdit;
    edMfgNo: TUniEdit;
    edEPlant: TUniEdit;
    cmbIntervalStart: TUniDBDateTimePicker;
    cmbIntervalEnd: TUniDBDateTimePicker;
    cmbDownCodeDlg: TUniEdit;
    edDownDescrip: TUniEdit;
    PnlEditControlButtons: TUniPanel;
    sbtnIntervalStart: TUniSpeedButton;
    sbtnIntervalEnd: TUniSpeedButton;
    sbtnDownTimeCode: TUniSpeedButton;
    PkDownCodeCUSER1: TStringField;
    PkDownCodeCUSER2: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbDownCodeDlgCustomDlg(Sender: TObject);
    procedure cmbDownCodeDlgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PkDownCodeBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnIntervalStartClick(Sender: TObject);
    procedure sbtnIntervalEndClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FWork_Center_ID: Real;
    FProd_Date: TDateTime;
    FShift: Real;
    FIllum_RT_ID: Real;
    FDownCode: string;
    FStandard_ID: Real;
    procedure SetWork_Center_ID(const Value: Real);
    procedure SetDownCode(const Value: string);
    function GetEndTime: TDateTime;
    function GetStartTime: TDateTime;
    procedure CreateIllm_Drt;
    procedure CreateIllm_Dwn;
    procedure Validate;
  protected
    { Protected declarations }
    procedure CheckApplyTouchScreenFormat;
  public
    { Public declarations }
    class function DoShowModal(AWork_Center_ID: Real; AProd_Date: TDateTime;
      AShift: Real): Boolean;
    property Work_Center_ID: Real read FWork_Center_ID write SetWork_Center_ID;
    property DownCode: string read FDownCode write SetDownCode;
    property StartTime: TDateTime read GetStartTime;
    property EndTime: TDateTime read GetEndTime;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  RT_rscstr,
  System.Math,
  tchscrn_const;
{ TODO -omugdha -cWEBIQ : Dependancy on touchscrn
  touchscrn; }

{ TFrmRTDwnAdd }

class function TFrmRTDwnAdd.DoShowModal(AWork_Center_ID: Real;
  AProd_Date: TDateTime; AShift: Real): Boolean;
var
  LFrmRTDwnAdd: TFrmRTDwnAdd;
begin
  LFrmRTDwnAdd := TFrmRTDwnAdd.Create(uniGUIApplication.UniApplication);
  with LFrmRTDwnAdd do
  begin
    Work_Center_ID := AWork_Center_ID;
    FProd_Date := AProd_Date;
    FShift := AShift;
    Result := ShowModal = mrOK;
  end;
end;

procedure TFrmRTDwnAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQRegFormWrite(self, [self]);
end;

procedure TFrmRTDwnAdd.SetWork_Center_ID(const Value: Real);
begin
  FWork_Center_ID := Value;
  edEqNo.Text := SelectValueFmtAsString
    ('select eqno from work_center where id = %f', [FWork_Center_ID]);
  FIllum_RT_ID := SelectValueFmtAsFloat
    ('select id from illum_rt where work_center_id = %f', [FWork_Center_ID]);
  edMfgNo.Text := SelectValueFmtAsString
    ('select mfgno from illum_rt where id = %f', [FIllum_RT_ID]);
  edEPlant.Text := SelectValueFmtAsString
    ('select eplant_id from work_center where id = %f', [FWork_Center_ID]);
  FStandard_ID := SelectValueByID('standard_id', 'hist_illum_rt', FIllum_RT_ID);
end;

procedure TFrmRTDwnAdd.UniFormCreate(Sender: TObject);
begin
  cmbIntervalStart.DateTime := SelectValueAsFloat('select sysdate from dual');

  // If we are in touch-screen mode, the following will modify the
  // screen.  This includes font, screen size, and control size and position.
  CheckApplyTouchScreenFormat;

  if IQMS.Common.ApplicationSet.IsTouchScreen then
    { TODO -omugdha -cWEBIQ : [dcc32 Error] RtdwnAdd.pas(187): E2010 Incompatible types: 'TForm' and 'TFrmRTDwnAdd'
      IQMS.Common.Controls.CenterForm(self, True) }

  else
    IQRegFormRead(self, [self]);
end;

procedure TFrmRTDwnAdd.cmbDownCodeDlgCustomDlg(Sender: TObject);
begin
  with PkDownCode do
  begin
    TouchScreen := IQMS.Common.ApplicationSet.IsTouchScreen;
    if Execute then
      DownCode := GetValue('DOWN_CODE');
  end;
end;

procedure TFrmRTDwnAdd.SetDownCode(const Value: string);
begin
  FDownCode := Value;
  cmbDownCodeDlg.Text := FDownCode;
  edDownDescrip.Text := SelectValueFmtAsString
    ('select down_descrip from down_code where down_code = ''%s''',
    [FDownCode]);
end;

procedure TFrmRTDwnAdd.cmbDownCodeDlgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    DownCode := '';
    Key := 0;
  end;
end;

procedure TFrmRTDwnAdd.PkDownCodeBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  // ParamByName('standard_id').Value := FStandard_ID;
  // ParamByName('work_center_id').Value := Work_Center_ID;
  // end;
  AssignQueryParamValue(DataSet, 'standard_id', FStandard_ID);
  AssignQueryParamValue(DataSet, 'work_center_id', Work_Center_ID);
end;

procedure TFrmRTDwnAdd.sbtnIntervalStartClick(Sender: TObject);
var
  ADateTime: TDateTime;
begin
  ADateTime := cmbIntervalStart.DateTime;
  if not IQMS.Common.Dates.ValidDate(ADateTime) then
    ADateTime := IQMS.Common.Dates.IQOracleAdjustedDate;
  (* TODO -omugdha -cWEBIQ : Dependancy on tchscreen
    if touchscrn.TouchScreen_DateTime(self,
    tchscrn_const.TDateTimeType.dtsDateTime, { var } ADateTime) then
    cmbIntervalStart.DateTime := ADateTime; *)
end;

procedure TFrmRTDwnAdd.sbtnIntervalEndClick(Sender: TObject);
var
  ADateTime: TDateTime;
begin
  ADateTime := cmbIntervalEnd.DateTime;
  if not IQMS.Common.Dates.ValidDate(ADateTime) then
    ADateTime := cmbIntervalStart.DateTime;
  if not IQMS.Common.Dates.ValidDate(ADateTime) then
    ADateTime := IQMS.Common.Dates.IQOracleAdjustedDate;
  (* TODO -omugdha -cWEBIQ : Dependancy on tchscreen
    if touchscrn.TouchScreen_DateTime(self,
    tchscrn_const.TDateTimeType.dtsDateTime, { var } ADateTime) then
    cmbIntervalEnd.DateTime := ADateTime; *)
end;

function TFrmRTDwnAdd.GetEndTime: TDateTime;
begin
  if cmbIntervalEnd.Text = '' then
    Result := 0
  else
    Result := cmbIntervalEnd.DateTime;
end;

function TFrmRTDwnAdd.GetStartTime: TDateTime;
begin
  if cmbIntervalStart.Text = '' then
    Result := 0
  else
    Result := cmbIntervalStart.DateTime;
end;

procedure TFrmRTDwnAdd.btnOKClick(Sender: TObject);
begin
  Validate;

  if EndTime = 0 then
    CreateIllm_Dwn
  else
    CreateIllm_Drt;

  ModalResult := mrOK;
end;

procedure TFrmRTDwnAdd.Validate;
begin
  try
    // RT_rscstr.cTXT000012 = 'Unknown production shift.  Operation aborted.';
    IQAssert(FShift > 0, RT_rscstr.cTXT000012);
    // RT_rscstr.cTXT000013 = 'Unknown production date.  Operation aborted.';
    IQAssert(FProd_Date > 0, RT_rscstr.cTXT000013);
    // RT_rscstr.cTXT000014 = 'Invalid Start and/or End Interval.  Operation aborted.';
    IQAssert((StartTime > 0) and ((EndTime = 0) or (EndTime > StartTime)),
      RT_rscstr.cTXT000014);

    if EndTime = 0 then
      // RT_rscstr.cTXT000015 =
      // 'Open downtime interval already exists for this combination ' +
      // 'of work center, shift and production date.  Operation aborted.';
      IQAssert(SelectValueFmtAsFloat
        ('select 1 from illm_dwn where illum_rt_id = %f ' +
        'and shift = %f and prod_date = to_date(''%s'', ''mm/dd/yyyy'')',
        [FIllum_RT_ID, FShift, FormatDateTime('mm/dd/yyyy', FProd_Date)]) = 0,
        RT_rscstr.cTXT000015);
  except
    on E: Exception do
      if IQMS.Common.ApplicationSet.IsTouchScreen then
      begin
        (* TODO -omugdha -cWEBIQ : Dependancy on tchscreen
          touchscrn.TouchScreen_Msg_Error(E.Message);
          System.SysUtils.Abort; *)
      end
      else
        raise;
  end;
end;

procedure TFrmRTDwnAdd.CreateIllm_Dwn;
begin
  try
    // 06/19/2013 Check before attempting to insert another interval.
    // Part of SER #4286
    if SelectValueFmtAsInteger('SELECT 1 FROM illm_dwn ' +
      'WHERE illum_rt_work_center_id = %.0f AND illum_rt_id = %.0f AND ' +
      'ROWNUM < 2', [Work_Center_ID, FIllum_RT_ID]) = 1 then
      // rt_rscstr.cTXT000022 =
      // 'Only one interval is permitted.  Cannot insert another interval.'
      raise Exception.Create(RT_rscstr.cTXT000022);

    ExecuteCommandFmt('insert into illm_dwn                              ' +
      '     ( illum_rt_work_center_id,                   ' +
      '       illum_rt_id,                               ' +
      '       prod_date,                                 ' +
      '       shift,                                     ' +
      '       dwn_st_time,                               ' +
      '       down_code )                                ' +
      'values                                            ' +
      '     ( %f,                                        ' + // work_center_id,
      '       %f,                                        ' + // illum_rt_id
      '       to_date(''%s'', ''mm/dd/yyyy''),           ' + // prod_date
      '       %f,                                        ' + // prod_shift
      '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),' + // start time
      '       ''%s'' )                                   ', // down code
      [Work_Center_ID, FIllum_RT_ID, FormatDateTime('mm/dd/yyyy', FProd_Date),
      FShift, FormatDateTime('mm/dd/yyyy hh:nn:ss', StartTime), DownCode]);
  except
    on E: Exception do
      if IQMS.Common.ApplicationSet.IsTouchScreen then
      begin
        (* TODO -omugdha -cWEBIQ : Dependancy on tchscreen
          touchscrn.TouchScreen_Msg_Error(E.Message); *)
        System.SysUtils.Abort;
      end
      else
        raise;
  end;
end;

procedure TFrmRTDwnAdd.CreateIllm_Drt;
begin
  try
    ExecuteCommandFmt('insert into illm_drt                              ' +
      '     ( hist_illum_rt_id,                          ' +
      '       prod_date,                                 ' +
      '       shift,                                     ' +
      '       dwn_st_time,                               ' +
      '       dwn_end_time,                              ' +
      '       down_code )                                ' +
      'values                                            ' +
      '     ( %f,                                        ' + // illum_rt_id
      '       to_date(''%s'', ''mm/dd/yyyy''),           ' + // prod_date
      '       %f,                                        ' + // prod_shift
      '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),' + // start time
      '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),' + // end time
      '       ''%s'' )                                   ', // down code
      [FIllum_RT_ID, FormatDateTime('mm/dd/yyyy', FProd_Date), FShift,
      FormatDateTime('mm/dd/yyyy hh:nn:ss', StartTime),
      FormatDateTime('mm/dd/yyyy hh:nn:ss', EndTime), DownCode]);
  except
    on E: Exception do
      if IQMS.Common.ApplicationSet.IsTouchScreen then
      begin
        (* TODO -omugdha -cWEBIQ : Dependancy on tchscreen
          touchscrn.TouchScreen_Msg_Error(E.Message); *)
        System.SysUtils.Abort;
      end
      else
        raise;
  end;
end;

procedure TFrmRTDwnAdd.CheckApplyTouchScreenFormat;
const
  c_vertical_buffer: Integer = 16;
  c_horizontal_buffer: Integer = 8;
var
  i, ATop, AWidth: Integer;
begin
  if IQMS.Common.ApplicationSet.IsTouchScreen then
  begin
    self.Width := 644;
    self.Height := 446;

    // Adjust font and controls
    (* TODO -omugdha -cWEBIQ : Dependancy on tchscreen
      touchscrn.ApplyTouchscreenFont(self); *)

    // Adjust the edit controls on the right
    ATop := c_vertical_buffer;
    for i := 0 to (PnlEditControlsClient.ControlCount - 1) do
    begin

      if (PnlEditControlsClient.Controls[i] is TCustomEdit) or
        (PnlEditControlsClient.Controls[i] is TUniEdit) or
        (PnlEditControlsClient.Controls[i] is TCustomComboBox) or
        (PnlEditControlsClient.Controls[i] is TUniEdit) or
        (PnlEditControlsClient.Controls[i] is TUniDBDateTimePicker) then
        with PnlEditControlsClient.Controls[i] do
        begin
          Top := ATop;
          Left := 1;
          Width := PnlEditControlsClient.ClientWidth - c_horizontal_buffer;
          Anchors := [akLeft, akTop, akRight];
          Inc(ATop, Height + c_vertical_buffer);

          // Adjust the TwwDBComboDlg button width
          if (PnlEditControlsClient.Controls[i] is TUniEdit) then
            { TODO -omugdha -cWEBIQ : need to find alternative for buttonwidth
              TUniEdit(PnlEditControlsClient.Controls[i]).ButtonWidth := 40; }

        end;
    end;

    // Align labels to their focus control
    AWidth := 160;
    for i := 0 to (PnlLabels.ControlCount - 1) do
    begin
      if (PnlLabels.Controls[i] is TUniLabel) or
        (PnlLabels.Controls[i] is TIQWebUserDefLabel) then
        with TUniLabel(PnlLabels.Controls[i]) do
        begin
          { TODO -omugdha -cWEBIQ : need to find alternative for TCustomEdit
            IQMS.Common.Controls.CenterLabel(FocusControl as TCustomEdit,
            TUniLabel(PnlLabels.Controls[i])); }
          Left := 8;
          AWidth := Max(AWidth, Width + 16);

        end;
    end;
    PnlLabels.Width := AWidth;

    // Touch-screen edit controls
    IQMS.Common.Controls.IQAlignControls([cmbIntervalStart, sbtnIntervalStart],
      acVerticalCenters);
    IQMS.Common.Controls.IQAlignControls([cmbIntervalEnd, sbtnIntervalEnd],
      acVerticalCenters);
    (* TODO -omugdha -cWEBIQ : Dependancy on tchscreen
      cmbDownCodeDlg.ShowButton := False; *)
    IQMS.Common.Controls.IQAlignControls([cmbDownCodeDlg, sbtnDownTimeCode],
      acVerticalCenters);
    PnlEditControlButtons.Visible := True;

    // Modal Vcl.Buttons
    PnlButtons.Height := 60;
    PnlModalButtons.Width := 260;
    btnOK.Height := 40;
    btnOK.Width := 120;
    btnCancel.Height := 40;
    btnCancel.Width := 120;
    btnCancel.Left := btnOK.Left + btnOK.Width + 8;
  end;
end;

end.
