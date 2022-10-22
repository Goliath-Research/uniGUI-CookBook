unit pm_bom_pmeqmt_prompt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  { TFrmPMBomEquipPrompt }
  TFrmPMBomEquipPrompt = class(TUniForm)
    SrcPMWODtl: TDataSource;
    QryPMWODtl: TFDQuery;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnContinue: TUniButton;
    btnCancel: TUniButton;
    PnlPrompt: TUniPanel;
    PnlGrid: TUniPanel;
    Grid: TIQUniGridControl;
    QryPMWODtlID: TBCDField;
    QryPMWODtlPMWO_ID: TBCDField;
    QryPMWODtlWO_DATE: TDateTimeField;
    QryPMWODtlWO_START_DATE: TDateTimeField;
    QryPMWODtlWO_END_DATE: TDateTimeField;
    QryPMWODtlWO_CLASS: TStringField;
    QryPMWODtlREQUESTED_BY: TStringField;
    QryPMWODtlDEPARTMENT: TStringField;
    QryPMWODtlSTATUS: TStringField;
    QryPMWODtlPRIORITY: TStringField;
    QryPMWODtlWO_TYPE: TStringField;
    QryPMWODtlPMEQMT_ID: TBCDField;
    QryPMWODtlEQNO: TStringField;
    QryPMWODtlEQUIP_DESCRIP: TStringField;
    QryPMWODtlEQUIP_CLASS: TStringField;
    QryPMWODtlLOCATION: TStringField;
    QryPMWODtlSERIALNO: TStringField;
    QryPMWODtlCRITICAL: TStringField;
    QryPMWODtlARCUSTO_ID: TBCDField;
    QryPMWODtlARCUSTO_CUSTNO: TStringField;
    QryPMWODtlARCUSTO_COMPANY: TStringField;
    QryPMWODtlVENDOR_ID: TBCDField;
    QryPMWODtlVENDOR_VENDORNO: TStringField;
    QryPMWODtlVENDOR_COMPANY: TStringField;
    QryPMWODtlPMJOB_ID: TBCDField;
    QryPMWODtlPMTASKS_ID: TBCDField;
    QryPMWODtlUOM: TStringField;
    QryPMWODtlTASK_NUMBER: TStringField;
    QryPMWODtlTASK_DESCRIPTION: TStringField;
    QryPMWODtlINCOMPLETE: TStringField;
    QryPMWODtlCREATEDBY: TStringField;
    QryPMWODtlCREATED: TDateTimeField;
    QryPMWODtlCODE_ID: TBCDField;
    QryPMWODtlCODE_NAME: TStringField;
    QryPMWODtlCODE_DESCRIP: TStringField;
    QryPMWODtlEPLANT_ID: TBCDField;
    QryPMWODtlEPLANT_NAME: TStringField;
    Label1: TUniLabel;
    PGrid: TUniPopupMenu;
    JumptoMRO1: TUniMenuItem;
    JumptoMROWorkOrder1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    procedure FormShow(Sender: TObject);
    procedure QryPMWODtlBeforeOpen(DataSet: TDataSet);
    procedure JumptoMRO1Click(Sender: TObject);
    procedure JumptoMROWorkOrder1Click(Sender: TObject);
    procedure PGridPopup(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  strict private
    { Private declarations }
    FStandardID: Integer;
    FMROLicensed: Boolean;
  private
    procedure SetStandardID(const Value: Integer);
  public
    { Public declarations }
    class function DoShowModal(AStandardID: Integer): Boolean;
    property StandardID: Integer read FStandardID write SetStandardID;
    /// <summary> Determine if the BOM has open work orders. </summary>
    class function HasOpenWorkOrders(const AStandardID: Integer): Boolean;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.Applications,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -ohphadke : Dependency
  iqsecins, pm_main ,pm_wo    }
  IQMS.WebVcl.SecurityManager
  ;

{ TFrmPMBomEquipPrompt }

class function TFrmPMBomEquipPrompt.HasOpenWorkOrders(const AStandardID: Integer): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT COUNT(*)                                                      '#13 +
    '  FROM DUAL                                                          '#13 +
    ' WHERE EXISTS (SELECT NULL                                           '#13 +
    '                 FROM v_pmwo_dtl_open_jobs a, standard_pmeqmt b      '#13 +
    '                WHERE a.pmeqmt_id = b.pmeqmt_id AND                  '#13 +
    '                      b.standard_id = %d)                            ',
    [AStandardID]) >= 1;
end;

class function TFrmPMBomEquipPrompt.DoShowModal(AStandardID: Integer): Boolean;
  Var
  LFrmPMBomEquipPrompt : TFrmPMBomEquipPrompt;
begin

  Result :=  TFrmPMBomEquipPrompt.HasOpenWorkOrders(AStandardID);
  if Result then
    with TFrmPMBomEquipPrompt.Create(UniGUIApplication.UniApplication) do
      begin
        FStandardID := AStandardID;
         Result := ShowModal = mrOK;
      end;
end;

procedure TFrmPMBomEquipPrompt.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(self, [self]);
  //iqsecins.EnsureSecurityInspectorOnTopOf(self);
end;

procedure TFrmPMBomEquipPrompt.QryPMWODtlBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'STANDARD_ID', Trunc(StandardID));
end;

procedure TFrmPMBomEquipPrompt.SetStandardID(const Value: Integer);
begin
  FStandardID := Value;
end;

procedure TFrmPMBomEquipPrompt.UniFormCreate(Sender: TObject);
begin
  inherited;
  ReOpen(QryPMWODtl);
  FMROLicensed := SecurityManager.IsModuleLicensed(IQAppsNames[IQMS.Common.Applications.apPM]);
end;

procedure TFrmPMBomEquipPrompt.PGridPopup(Sender: TObject);
begin
//  Grid.MenuEnabled(JumptoMRO1, SR.Enabled['JumptoMRO1'] and FMROLicensed);
//  Grid.MenuEnabled(JumptoMROWorkOrder1, SR.Enabled['JumptoMROWorkOrder1'] and
    //FMROLicensed);
end;

procedure TFrmPMBomEquipPrompt.JumptoMRO1Click(Sender: TObject);
begin
  // Jump to MRO
  {TODO -ohphadke : Dependency
  if FMROLicensed and (QryPMWODtlPMEQMT_ID.AsLargeInt > 0) and
    SR.Enabled['JumptoMRO1'] then
    pm_main.DoJumpToPM(Owner, QryPMWODtlPMEQMT_ID.AsLargeInt);   }
end;

procedure TFrmPMBomEquipPrompt.JumptoMROWorkOrder1Click(Sender: TObject);
begin
  // Jump to MRO Work Order
  {TODO -ohphadke : Dependency
  if FMROLicensed and (QryPMWODtlID.AsLargeInt > 0) and
    SR.Enabled['JumptoMROWorkOrder1'] then
    pm_wo.DoJumpToPMWODetail(Owner, QryPMWODtlID.AsLargeInt); }
end;

end.
