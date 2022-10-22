unit pm_period_wo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  pm_types,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  Vcl.wwDataInspector,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  { TFrmPMPeriodWorkorders }
  TFrmPMPeriodWorkorders = class(TUniForm)
    pnlWO: TUniPanel;
    IQSearchWO: TIQUniGridControl;
    SrcWO: TDataSource;
    QryWO: TFDQuery;
    QryWOID: TBCDField;
    QryWOWO_DATE: TDateTimeField;
    QryWODEPARTMENT: TStringField;
    QryWOWO_CLASS: TStringField;
    QryWOREQUESTED_BY: TStringField;
    QryWOSTATUS: TStringField;
    QryWOPRIORITY: TStringField;
    QryWOWO_TYPE: TStringField;
    QryWOEQNO: TStringField;
    QryWOEQUIP_DESCRIP: TStringField;
    QryWOEQUIP_CLASS: TStringField;
    QryWOEPLANT_ID: TBCDField;
    Panel2: TUniPanel;
    sbtnRemove: TUniSpeedButton;
    pnlDetails: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    wwDBGridPMDayHrs: TIQUniGridControl;
    SrcPMDayHrs: TDataSource;
    QryPMDayHrs: TFDQuery;
    QryWOMfgcell_ID: TBCDField;
    QryWOPeriod: TBCDField;
    QryWOCapacity_View: TBCDField;
    QryWOWO_START_DATE: TDateTimeField;
    QryWOWO_END_DATE: TDateTimeField;
    QryWOStart_Date: TDateTimeField;
    QryPMDayHrsID: TBCDField;
    QryPMDayHrsPMWO_ID: TBCDField;
    QryPMDayHrsPROD_DATE: TDateTimeField;
    QryPMDayHrsLATE: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    Panel1: TUniPanel;
    pnlClient01: TUniPanel;
    edPMCell: TUniEdit;
    edPeriod: TUniEdit;
    pnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Splitter2: TUniSplitter;
    Bevel1: TUniPanel;
    Contents1: TUniMenuItem;
    QryPMDayHrsPROD_HRS: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryWOBeforeOpen(DataSet: TDataSet);
    procedure QryWOCalcFields(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnRemoveClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FMfgcell_ID: Real;
    FCapacityViewType: TPMCapacityView;
    FCapacityViewStartDate: TDateTime;
    FPeriod: Integer;
    FPeriodTitle: string;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure RefreshDataSets;
    procedure RemoveWorkorderFromCapacitySchedule(APMWO_ID: Real);

  public
    { Public declarations }

    class procedure DoShow(AMfgCell_ID: Real;
      ACapacityViewType: TPMCapacityView; ACapacityViewStartDate: TDateTime;
      APeriod: Integer; APeriodTitle: string);
    procedure AssignCriteria(AMfgCell_ID: Real;
      ACapacityViewType: TPMCapacityView; ACapacityViewStartDate: TDateTime;
      APeriod: Integer; APeriodTitle: string);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  pm_rscstr;

{ TFrmPMPeriodWorkorders }

class procedure TFrmPMPeriodWorkorders.DoShow(AMfgCell_ID: Real; ACapacityViewType: TPMCapacityView;
  ACapacityViewStartDate: TDateTime; APeriod: Integer; APeriodTitle: string);
var
  AForm: TUniForm;
begin
  AForm := FindFormByClassName('TFrmPMPeriodWorkorders');
  if not Assigned(AForm) then
    begin
      AForm := TFrmPMPeriodWorkorders.Create(UniGUIApplication.UniApplication);
    end;

  TFrmPMPeriodWorkorders(AForm).AssignCriteria(AMfgCell_ID, ACapacityViewType,ACapacityViewStartDate, APeriod, APeriodTitle);
  AForm.Show;
end;

procedure TFrmPMPeriodWorkorders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlWO]);
end;

procedure TFrmPMPeriodWorkorders.AssignCriteria(AMfgCell_ID: Real;
  ACapacityViewType: TPMCapacityView; ACapacityViewStartDate: TDateTime;
  APeriod: Integer; APeriodTitle: string);
begin
  FMfgcell_ID := AMfgCell_ID;
  FCapacityViewType := ACapacityViewType;
  FCapacityViewStartDate := ACapacityViewStartDate;
  FPeriod := APeriod;
  FPeriodTitle := APeriodTitle;

//  PostMessage(Handle, iq_AfterShowMessage, 0, 0); // refresh datainspector

  RefreshDataSets;
end;

procedure TFrmPMPeriodWorkorders.RefreshDataSets;
begin
  RefreshDataSetByID(QryWO);
  Reopen(QryPMDayHrs);
end;

procedure TFrmPMPeriodWorkorders.QryWOBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'mfgcell_id', Trunc(FMfgcell_ID));
  AssignQueryParamValue(DataSet, 'period', FPeriod);
  AssignQueryParamValue(DataSet, 'capacity_view', Ord(FCapacityViewType));
  AssignQueryParamValue(DataSet, 'start_date', FCapacityViewStartDate);
end;

procedure TFrmPMPeriodWorkorders.QryWOCalcFields(DataSet: TDataSet);
begin
  QryWOMfgcell_ID.AsLargeInt := Trunc(FMfgcell_ID);
  QryWOPeriod.AsInteger := FPeriod;
  QryWOCapacity_View.AsInteger := Ord(FCapacityViewType);
  QryWOStart_Date.AsDateTime := FCapacityViewStartDate;
end;

procedure TFrmPMPeriodWorkorders.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPMPeriodWorkorders.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPMPeriodWorkorders.IQAfterShowMessage(var Msg: TMessage);
begin
  edPMCell.Text := SelectValueByID('mfgcell', 'mfgcell', FMfgcell_ID);
  edPeriod.Text := FPeriodTitle;
end;

procedure TFrmPMPeriodWorkorders.sbtnRemoveClick(Sender: TObject);
begin
  if QryWOID.asFloat = 0 then
    EXIT;
  //pm_rscstr.cTXT0000369 =
  // 'Are you sure you want to remove Work Order # %d from Capacity Schedule?';
  if not IQWarningYN(Format(pm_rscstr.cTXT0000369, [QryWOID.AsLargeInt])) then
    EXIT;

  RemoveWorkorderFromCapacitySchedule(QryWOID.AsLargeInt);

  RefreshDataSets;
  IQMS.Common.Controls.PostMessageToForm('TFrmPMCapacity', iq_RefreshDataSets, 0, 0);
end;

procedure TFrmPMPeriodWorkorders.UniFormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member ControlType and ApplySelected
  wwDBGridPMDayHrs.ControlType.Clear;
  wwDBGridPMDayHrs.ControlType.Add('LATE;CheckBox;Y;N');
  wwDBGridPMDayHrs.ApplySelected;    }

  IQRegFormRead(self, [self, pnlWO]);
end;

procedure TFrmPMPeriodWorkorders.RemoveWorkorderFromCapacitySchedule
  (APMWO_ID: Real);
begin
  ExecuteCommandFmt(
    'declare                                                                    '#13 +
    '  v_pmwo_id number::= %d;                                                  '#13 +
    'begin                                                                      '#13 +
    '  update pmwo set start_date = null, end_date = null where id = v_pmwo_id; '#13 +
    '  delete from pm_day_hrs where pmwo_id = v_pmwo_id;                        '#13 +
    'end;                                                                       ',
    [Trunc(APMWO_ID)]);
end;

procedure TFrmPMPeriodWorkorders.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext)
end;

end.
