unit Taprshft;

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
  Grids,
  DBGrids,
  DBCtrls,
  ExtCtrls,
  StdCtrls,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmEmpPrePostShiftSched = class(TUniForm)
    Panel6: TUniPanel;
    Src: TDataSource;
    Qry: TFDQuery;
    QryID: TBCDField;
    QrySTART_DATE: TDateTimeField;
    QryTA_SHIFT_ID: TFMTBCDField;
    QryEND_DATE: TDateTimeField;
    QryDESCRIP: TStringField;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    gridSched: TUniDBGrid;
    SrcSched: TDataSource;
    QrySched: TFDQuery;
    QrySHIFT_ID: TBCDField;
    SrcSet: TDataSource;
    QrySet: TFDQuery;
    QrySetID: TBCDField;
    QrySetPAYOT: TStringField;
    QrySetROUNDTM: TFMTBCDField;
    QrySetPAYBREAKTM: TFMTBCDField;
    QrySetDESCRIP: TStringField;
    QrySetPAYNS: TStringField;
    QrySetCLOCK_IN_BREAK: TStringField;
    GroupBox1: TUniGroupBox;
    QryPROD_DATE: TDateTimeField;
    PnlSchedule: TUniPanel;
    grid: TUniDBGrid;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    PnlToolbarInner: TUniPanel;
    Nav: TUniDBNavigator;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    Label7: TUniLabel;
    Panel7: TUniPanel;
    NavSched: TUniDBNavigator;
    PnlSettingsInner: TUniPanel;
    Splitter2: TUniSplitter;
    PnlSettingsLeft2: TUniPanel;
    PnlSettingsClient3: TUniPanel;
    PnlSettingsLeft1: TUniPanel;
    Splitter3: TUniSplitter;
    PnlSettingsClient1: TUniPanel;
    PnlSettingsLeft3: TUniPanel;
    Splitter4: TUniSplitter;
    PnlSettingsClient2: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    dbDescrip: TUniDBEdit;
    dbRoundTm: TUniDBEdit;
    dbBreak: TUniDBEdit;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    dbPayNS: TUniDBEdit;
    dbOt: TUniDBEdit;
    dbClockInBreaks: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDate:TDateTime;
    FID : Real;
    procedure SetDate(const Value: TDateTime);
    procedure SetID(const Value: Real);
  public
    { Public declarations }
    property ID : Real write SetID;
    property Date : TDateTime write SetDate;
  end;

procedure DoShowEmplPrepostShiftSched(AID:Real; ADate:TDateTime);

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Controls;

procedure DoShowEmplPrepostShiftSched(AID:Real; ADate:TDateTime);
var
  LFrmEmpPrePostShiftSched : TFrmEmpPrePostShiftSched;
begin
  LFrmEmpPrePostShiftSched := TFrmEmpPrePostShiftSched.Create(UniGUIApplication.UniApplication);
  LFrmEmpPrePostShiftSched.ID := AID;
  LFrmEmpPrePostShiftSched.Date := ADate;
  LFrmEmpPrePostShiftSched.ShowModal;
end;

procedure TFrmEmpPrePostShiftSched.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid, gridSched, PnlSettingsLeft1,
   PnlSettingsLeft2, PnlSettingsLeft3,PnlSchedule]);
end;

procedure TFrmEmpPrePostShiftSched.QryCalcFields(DataSet: TDataSet);
begin
  QryPROD_DATE.AsDateTime := FDate;
end;

procedure TFrmEmpPrePostShiftSched.SetDate(const Value: TDateTime);
begin
  FDate := Value;
end;

procedure TFrmEmpPrePostShiftSched.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmEmpPrePostShiftSched.UniFormCreate(Sender: TObject);
var
  ATaSettingsId:Real;
begin
  with Qry do
  begin
    Close;
    ParamByName('nId').Value := FId;
    ParamByName('dDate').asDateTime := FDate;
    Open;
  end;
  ATaSettingsId := SelectValueFmtAsFloat('select ta_settings_id from pr_emp where id = %f', [FId]);
  if ATaSettingsId = 0 then
  begin
    ATaSettingsId := SelectValueFmtAsFloat('select ta_settings_id from ta_shift where id = (select min(ta_shift_id) ' +
                     'from TA_EMP_SHIFT_SCHED ' +
                     'where pr_emp_id = %f    ' +
                     'and trunc(sysdate) between NVL(start_date, sysdate - 40000) ' +
                     'and NVL(end_date, sysdate + 40000) )', [FID]);
    if ATaSettingsId = 0 then
      ATaSettingsId := SelectValueFmtAsFloat('select t.id from ta_settings t, ta_shift s, pr_emp e where e.id = %f ' +
                     'and e.ta_shift_id = s.id and s.ta_settings_id = t.id', [FID]);
  end;
  with QrySet do
  begin
    Close;
    ParamByName('nId').Value := ATaSettingsId;
    Open;
  end;

  QrySched.Open;
  IQRegFormRead( self, [self, grid, gridSched, PnlSettingsLeft1,
   PnlSettingsLeft2, PnlSettingsLeft3, PnlSchedule]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlSettingsLeft1);
end;

end.
