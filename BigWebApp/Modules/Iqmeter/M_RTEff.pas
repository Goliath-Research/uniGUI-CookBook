unit M_RTEff;

// NOTE:  Default form size should be as follows:
// Height = 273
// Width =  562

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
  Buttons,
  Menus,
  IQMS.WebVcl.About,
  Db,
  M_Type,
  IQMS.Common.UserMessages,
  AdvSmoothGauge,
  { TODO -omugdha -cWEBIQ : dependency on M_MeterProgressBar
  M_MeterProgressBar, }
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu;

type
  TFrmM_RTEff = class(TUniForm)
    tmRefresh: TUniTimer;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    N1: TUniMenuItem;
    Filter1: TUniMenuItem;
    Panel1: TUniPanel;
    PageControl1: TUniPageControl;
    tabAnalog: TUniTabSheet;
    tabDigital: TUniTabSheet;
    lblDigitalMachineUtilization: TUniLabel;
    lblDigitalUnscheduledDown: TUniLabel;
    lblDigitalEffectiveCycle: TUniLabel;
    lblDigitalAverageScrap: TUniLabel;
    lblUtilization: TUniLabel;
    lblUnsched: TUniLabel;
    lblEffCycle: TUniLabel;
    lblAvgScrap: TUniLabel;
    lblUtilThr: TUniLabel;
    lblUnschedThr: TUniLabel;
    lblEffThr: TUniLabel;
    lblAvgThr: TUniLabel;
    Label5: TUniLabel;
    Analog1: TUniMenuItem;
    Digital1: TUniMenuItem;
    N2: TUniMenuItem;
    Panel2: TUniPanel;
    bbtnFilter: TUniBitBtn;
    StatusBar1: TUniStatusBar;
    IQAbout1: TIQWebAbout;
    procRT_EFF_MONITOR: TFDStoredProc;
    Contents1: TUniMenuItem;
    pnlCarrier: TUniPanel;
    PnlMachineUtilization: TUniPanel;
    PnlMachineUtilizationCaption: TUniPanel;
    lblMachineUtilizationCaption: TUniLabel;
    GaugeMachineUtilization: TAdvSmoothGauge;
    PnlUnscheduledDown: TUniPanel;
    PnlUnscheduledDownCaption: TUniPanel;
    lblUnscheduledDownCaption: TUniLabel;
    GaugeUnscheduledDown: TAdvSmoothGauge;
    PnlEffectiveCycle: TUniPanel;
    PnlEffectiveCycleCaption: TUniPanel;
    lblEffectiveCycleCaption: TUniLabel;
    GaugeEffectiveCycle: TAdvSmoothGauge;
    PnlAverageScrap: TUniPanel;
    PnlAverageScrapCaption: TUniPanel;
    lblAverageScrapCaption: TUniLabel;
    GaugeAverageScrap: TAdvSmoothGauge;
    PnlMachineUtilizationThreshold: TUniPanel;
    lblMachineUtilizationThreshold: TUniLabel;
    PnlUnscheduledDownThreshold: TUniPanel;
    lblUnscheduledDownThreshold: TUniLabel;
    PnlEffectiveCycleThreshold: TUniPanel;
    lblEffectiveCycleThreshold: TUniLabel;
    PnlAverageScrapThreshold: TUniPanel;
    lblAverageScrapThreshold: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure SelectView(Sender: TObject);
    procedure bbtnFilterClick(Sender: TObject);
    procedure tmRefreshTimer(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlCarrierResize(Sender: TObject);
  private
    { Private declarations }
    FUtilThr     : Integer;
    FUnschedThr  : Integer;
    FEffThr      : Integer;
    FAvgThr      : Integer;
    FRefresh_Time: Integer;
    FSize: TSize;
    { TODO -omugdha -cWEBIQ : dependency on TMeterProgressBar
    gUtilization: TMeterProgressBar;
    gUnsched: TMeterProgressBar;
    gEffCycle: TMeterProgressBar;
    gAvgScrap: TMeterProgressBar;  }

    procedure SetUtilThr(AValue:Integer);
    procedure SetUnschedThr(AValue:Integer);
    procedure SetEffThr(AValue:Integer);
    procedure SetAvgThr(AValue:Integer);
    procedure SetRefresh_Time(AValue: Integer);

    procedure UpdateTimerStatus;
    procedure InitThresholds;

    procedure CreateProgressBarControls;
    procedure UpdateGaugeValues;
    { TODO -omugdha -cWEBIQ : dependency on TMeterProgressBar
    procedure SetGauge( AGauge: TMeterProgressBar; AMeter: TAdvSmoothGauge;
      AValue: Integer; ALabel: TUniLabel; AGoesRed: Boolean); }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
 protected
    FFilter: TMeterFilter;
    FAdjustingSizes: Boolean;
    procedure UpdateFilterStatus;
    procedure EnableTimer( AValue: Boolean );
    procedure AdjustGuageSizes; virtual;
  public
    { Public declarations }
    Util       :Integer;
    UnSched    :Integer;
    Eff_Cycle  :Integer;
    Avg_Scrap  :Integer;

   // constructor Create( AOwner: TComponent; AID: Real );
    class procedure DoShow( AID: Real );                {M_RTEff.pas}

    property Refresh_Time: Integer read FRefresh_Time write SetRefresh_Time;
    property UtilThr     : Integer read FUtilThr      write SetUtilThr     ;
    property UnschedThr  : Integer read FUnschedThr   write SetUnschedThr  ;
    property EffThr      : Integer read FEffThr       write SetEffThr      ;
    property AvgThr      : Integer read FAvgThr       write SetAvgThr      ;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  M_Filter,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  Variants,
  M_rscstr;

const
  c_color_needle_green = 2179584;
  c_color_needle_red = clMaroon;

class procedure TFrmM_RTEff.DoShow( AID: Real );
var
  AForm: TUniForm;
begin
  AForm:= FindFormByClassName( 'TFrmM_RTEff' );
  if not Assigned( AForm ) then
     AForm:= TFrmM_RTEff.Create(uniGUIApplication.UniApplication);
  AForm.Show;
end;

//constructor TFrmM_RTEff.Create( AOwner: TComponent; AID: Real );  {AID - is not in use}
//
//begin
//  inherited Create( AOwner );
//
//end;

procedure TFrmM_RTEff.FormCreate(Sender: TObject);
var
  AMfgType: string;
begin
  CreateProgressBarControls;

  PageControl1.ActivePageIndex:= 0;
  FSize.cx := 21;
  FSize.cy := 33;
  IQMS.Common.Controls.AdjustPageControlToParent( PageControl1 );
  IQRegStringScalarRead( self, 'FilterMfgType', AMfgType );
  if Trim(AMfgType) = '' then
     AMfgType:= 'INJECTION';
  with FFilter do
  begin
    Mode          := mfOvervall; // mfOvervall, mfEPlant, mfMfgCell, mfWorkCenter
    MfgType       := AMfgType;   // 'INJECTION';
    MfgCell       := '';
    EPlant_ID     := 0;
    Work_Center_ID:= 0;
    UpdateFilterStatus;
  end;
  {Init}
  InitThresholds;
  {Refresh display}
  tmRefreshTimer( NIL );
  {Unleash timer}
  EnableTimer(TRUE);
end;

procedure TFrmM_RTEff.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
  AdjustGuageSizes;
end;

procedure TFrmM_RTEff.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EnableTimer( FALSE );
  IQRegFormWrite( self, [ self ]);
  IQRegStringScalarWrite( self, 'FilterMfgType', FFilter.MfgType );
end;

procedure TFrmM_RTEff.CreateProgressBarControls;
begin
  // Note: the TMeterProgressBar class is declared in unit,
  // M_MeterProgressBar.pas
  { TODO -omugdha -cWEBIQ : dependency on M_MeterProgressBar
  if not Assigned(gUtilization) then
    begin
      gUtilization := TMeterProgressBar.Create(Self);
      with gUtilization do
        begin
          Parent := tabDigital;
          Left := 164;
          Top := 8;
          Width := 300;
          Value := 0;
        end;
    end;

  if not Assigned(gUnsched) then
    begin
      gUnsched := TMeterProgressBar.Create(Self);
      with gUnsched do
        begin
          Parent := tabDigital;
          Left := 164;
          Top := 41;
          Width := 300;
          Value := 0;
        end;
    end;

  if not Assigned(gEffCycle) then
    begin
      gEffCycle := TMeterProgressBar.Create(Self);
      with gEffCycle do
        begin
          Parent := tabDigital;
          Left := 164;
          Top := 73;
          Width := 300;
          Value := 0;
        end;
    end;

  if not Assigned(gAvgScrap) then
    begin
      gAvgScrap := TMeterProgressBar.Create(Self);
      with gAvgScrap do
        begin
          Parent := tabDigital;
          Left := 164;
          Top := 104;
          Width := 300;
          Value := 0;
        end;
    end; }
end;

procedure TFrmM_RTEff.SetUtilThr(AValue:Integer);
begin
  if AValue > 0 then
     FUtilThr:= AValue
  else
     FUtilThr:= 50;

  lblUtilThr.Caption:= Format( '%3d', [FUtilThr] );

  // M_rscstr.cRsc000001 = 'Threshold %s';
  lblMachineUtilizationThreshold.Caption := Format(M_rscstr.cRsc000001, [lblUtilThr.Caption]);
  // Gauge upper/lower limits
  GaugeMachineUtilization.MinimumValue := 0;
  GaugeMachineUtilization.MaximumValue := 100;
  // Red section
  GaugeMachineUtilization.Sections.Items[0].StartValue := GaugeMachineUtilization.MinimumValue;
  GaugeMachineUtilization.Sections.Items[0].EndValue := UtilThr;
  // Green section
  GaugeMachineUtilization.Sections.Items[1].StartValue := GaugeMachineUtilization.Sections.Items[0].EndValue;
  GaugeMachineUtilization.Sections.Items[1].EndValue := GaugeMachineUtilization.MaximumValue;
end;

procedure TFrmM_RTEff.SetUnschedThr(AValue:Integer);
begin
  if AValue > 0 then
     FUnschedThr:= AValue
  else
     FUnschedThr:= 20;

  lblUnschedThr.Caption:= Format( '%3d', [FUnschedThr] );

  // M_rscstr.cRsc000001 = 'Threshold %s';
  lblUnscheduledDownThreshold.Caption := Format(M_rscstr.cRsc000001, [lblUnschedThr.Caption]);
  // Gauge upper/lower limits
  GaugeUnscheduledDown.MinimumValue := 0;
  GaugeUnscheduledDown.MaximumValue := 100;
  // Red section
  GaugeUnscheduledDown.Sections.Items[0].StartValue := GaugeUnscheduledDown.MinimumValue;
  GaugeUnscheduledDown.Sections.Items[0].EndValue := UnschedThr;
  // Green section
  GaugeUnscheduledDown.Sections.Items[1].StartValue := GaugeUnscheduledDown.Sections.Items[0].EndValue;
  GaugeUnscheduledDown.Sections.Items[1].EndValue := GaugeUnscheduledDown.MaximumValue;

end;

procedure TFrmM_RTEff.SetEffThr(AValue:Integer);
begin
  if AValue > 0 then
     FEffThr:= AValue
  else
     FEffThr:= 80;

  lblEffThr.Caption:= Format( '%3d', [FEffThr] );

  // M_rscstr.cRsc000001 = 'Threshold %s';
  lblEffectiveCycleThreshold.Caption := Format(M_rscstr.cRsc000001, [lblEffThr.Caption]);
  // Gauge upper/lower limits
  GaugeEffectiveCycle.MinimumValue := 0;
  GaugeEffectiveCycle.MaximumValue := 100;
  // Red section
  GaugeEffectiveCycle.Sections.Items[0].StartValue := GaugeEffectiveCycle.MinimumValue;
  GaugeEffectiveCycle.Sections.Items[0].EndValue := EffThr;
  // Green section
  GaugeEffectiveCycle.Sections.Items[1].StartValue := GaugeEffectiveCycle.Sections.Items[0].EndValue;
  GaugeEffectiveCycle.Sections.Items[1].EndValue := GaugeEffectiveCycle.MaximumValue;

end;

procedure TFrmM_RTEff.SetAvgThr(AValue:Integer);
begin
  if AValue > 0 then
     FAvgThr:= AValue
  else
     FAvgThr:= 5;

  lblAvgThr.Caption:= Format( '%3d', [FAvgThr] );

  // M_rscstr.cRsc000001 = 'Threshold %s';
  lblAverageScrapThreshold.Caption := Format(M_rscstr.cRsc000001, [lblAvgThr.Caption]);
  // Gauge upper/lower limits
  GaugeAverageScrap.MinimumValue := 0;
  GaugeAverageScrap.MaximumValue := 100;
  // Red section
  GaugeAverageScrap.Sections.Items[0].StartValue := GaugeAverageScrap.MinimumValue;
  GaugeAverageScrap.Sections.Items[0].EndValue := AvgThr;
  // Green section
  GaugeAverageScrap.Sections.Items[1].StartValue := GaugeAverageScrap.Sections.Items[0].EndValue;
  GaugeAverageScrap.Sections.Items[1].EndValue := GaugeAverageScrap.MaximumValue;

end;

procedure TFrmM_RTEff.SetRefresh_Time(AValue: Integer );
begin
  FRefresh_Time:= AValue;
  if FRefresh_Time < 15 then
     FRefresh_Time:= 15;

  tmRefresh.Interval:= FRefresh_Time * 1000;
end;

procedure TFrmM_RTEff.InitThresholds;
var
  A: Variant;
begin
  A:= SelectValueArray( 'select RT_Refresh_Time, RT_Util_Thrshld, RT_Unsched_Down_Thrshld, RT_Eff_Cycle_Thrshld, RT_Avg_Scrap_Thrshld from params' );
  IQAssert( VarArrayDimCount( A ) > 0, 'Params table is empty');

  Refresh_Time:= A[ 0 ]; // RT_Refresh_Time
  UtilThr     := A[ 1 ]; // RT_Util_Thrshld
  UnschedThr  := A[ 2 ]; // RT_Unsched_Down_Thrshld
  EffThr      := A[ 3 ]; // RT_Eff_Cycle_Thrshld
  AvgThr      := A[ 4 ]; // RT_Avg_Scrap_Thrshld
end;

procedure TFrmM_RTEff.EnableTimer( AValue: Boolean );
begin
  tmRefresh.Enabled:= AValue;
  UpdateTimerStatus;
end;

procedure TFrmM_RTEff.UpdateTimerStatus;
begin
  StatusBar1.Panels[ 0 ].Text:= Format('Status: %s', [ IIf( tmRefresh.Enabled, 'Active', 'Inactive' )]);
end;

procedure TFrmM_RTEff.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmM_RTEff.SelectView(Sender: TObject);
begin
  with (Sender as TUniMenuItem) do
  begin
    PageControl1.ActivePageIndex:= Tag;
    Analog1.Checked := (Tag = 0);
    Digital1.Checked:= (Tag = 1);
  end;
end;

procedure TFrmM_RTEff.tmRefreshTimer(Sender: TObject);
begin
  with procRT_EFF_MONITOR do
  begin
    Prepare;
    ParamByName('v_mode_in').Value := Ord(FFilter.Mode);
    ParamByName('v_mfg_type_in').Value := FFilter.MfgType;
    ParamByName('v_mfgcell_in' ).Value := FFilter.MfgCell;
    ParamByName('v_eplant_id_in').Value := FFilter.EPlant_ID;
    ParamByName('v_work_center_id_in').Value:= FFilter.Work_Center_ID;
    ParamByName('v_utilization' ).Clear;
    ParamByName('v_unsched_down').Clear;
    ParamByName('v_eff_cycle'   ).Clear;
    ParamByName('v_avg_scrap'   ).Clear;
    ExecProc;
    Util      := ParamByName('v_utilization' ).AsInteger;
    UnSched   := ParamByName('v_unsched_down').AsInteger;
    Eff_Cycle := ParamByName('v_eff_cycle'   ).AsInteger;
    Avg_Scrap := ParamByName('v_avg_scrap'   ).AsInteger;
  end;

  UpdateGaugeValues;
end;

procedure TFrmM_RTEff.UpdateGaugeValues;
begin
{ TODO -omugdha -cWEBIQ : Undeclared identifier: 'SetGauge'
  CreateProgressBarControls;
  SetGauge( gUtilization, GaugeMachineUtilization,     Util     , lblUtilization, Util      <= UtilThr    );
  SetGauge( gUnsched    , GaugeUnscheduledDown,  UnSched  , lblUnsched,     UnSched   >= UnschedThr );
  SetGauge( gEffCycle   , GaugeEffectiveCycle, Eff_Cycle, lblEffCycle,    Eff_Cycle <= EffThr     );
  SetGauge( gAvgScrap   , GaugeAverageScrap, Avg_Scrap, lblAvgScrap,    Avg_Scrap >= AvgThr     );
  }
  end;
{ TODO -omugdha -cWEBIQ : dependency on TMeterProgressBar
procedure TFrmM_RTEff.SetGauge( AGauge: TMeterProgressBar; AMeter: TAdvSmoothGauge; AValue:Integer; ALabel:TUniLabel; AGoesRed:Boolean);
begin
  // Progress bar style
  with AGauge do
  begin
    Value := AValue;
    ColorRed := AGoesRed;
  end;

  // Gauge style
  with AMeter do
  begin
    Value := AValue;
    if AGoesRed then
      Needle.Color:= c_color_needle_red
    else
      Needle.Color:= c_color_needle_green;
  end;

  ALabel.Visible:= AValue > 100;
  if AValue > 100 then
     ALabel.Caption:= Format('[%4d%s]', [AValue, '%'] );
end;
  }
procedure TFrmM_RTEff.AdjustGuageSizes;
var
  AWidth, i: Integer;
begin
  if FAdjustingSizes then
    Exit;
  FAdjustingSizes := True;
  try
  // AWidth := (tabAnalog.ClientWidth div 4) - 2;
  AWidth := GaugeMachineUtilization.Width - 1;
  PnlMachineUtilization.Width := AWidth;
  PnlUnscheduledDown.Width := AWidth;
  PnlEffectiveCycle.Width := AWidth;
  PnlAverageScrap.Width := AWidth;
  //ClientWidth := (AWidth * 4) + 8;
  finally
    FAdjustingSizes := False;
  end;
end;

procedure TFrmM_RTEff.bbtnFilterClick(Sender: TObject);
begin
  EnableTimer(FALSE);
  try
    if TFrmM_Filter.DoShowModal( FFilter ) then  {M_Filter.pas}
    begin
      UpdateFilterStatus;
      // tmRefreshTimer( NIL );
    end;
  finally
    EnableTimer(TRUE);
  end;
end;

procedure TFrmM_RTEff.IQNotify( var Msg: TMessage );
begin
end;

procedure TFrmM_RTEff.pnlCarrierResize(Sender: TObject);
begin
  AdjustGuageSizes;
end;

procedure TFrmM_RTEff.UpdateFilterStatus;
var
  S: string;
begin
  with FFilter do
    case Mode of
      mfOvervall  : S:= Format('Overall view. MfgType = %s',     [ MfgType  ]);
      mfEPlant    : S:= Format('EPlant ID = %.0f, MfgType = %s', [ EPlant_ID, MfgType ]);
      mfMfgCell   : S:= Format('MfgCell = %s',                   [ MfgCell ]);
      mfWorkCenter: S:= Format('Work Center = %s',               [ SelectValueByID('eqno', 'work_center', Work_Center_ID) ]);
  end;
  StatusBar1.Panels[ 1 ].Text:= Format('        Filter: %s', [ S ]);
end;

procedure TFrmM_RTEff.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmM_RTEff.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmM_RTEff.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext )
end;


end.
