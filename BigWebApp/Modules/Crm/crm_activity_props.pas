unit crm_activity_props;

{ Shows record properties (data) for an activity }

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.wwDataInspector,
  Vcl.Menus,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, Vcl.Grids;

type
  TFrmCRMActivityProperties = class(TUniForm)
    SrcActivity: TDataSource;
    QryActivity: TFDQuery;
    QryActivityID: TBCDField;
    QryActivityALERT_DATETIME: TDateTimeField;
    QryActivitySTARTDATE: TDateTimeField;
    QryActivityFINISHDATE: TDateTimeField;
    QryActivityTIME_ELAPSED: TFMTBCDField;
    QryActivityPR_EMP_ID: TBCDField;
    QryActivityUSER_ID: TStringField;
    QryActivityASSIGNEDTO: TStringField;
    QryActivityASSIGNEDBY: TStringField;
    QryActivityASSIGNEDDATE: TDateTimeField;
    QryActivityCLOSEDBY: TStringField;
    QryActivityCLOSED_DATETIME: TDateTimeField;
    QryActivityTYPE: TBCDField;
    QryActivityACTIVITY_TYPE_ID: TBCDField;
    QryActivityQUEUE_TYPE_ID: TBCDField;
    QryActivityQUEUE_ID: TBCDField;
    QryActivityREGARDING: TStringField;
    QryActivitySETALARM: TStringField;
    QryActivityEMAIL: TStringField;
    QryActivitySEND_MAIL: TStringField;
    QryActivityMAIL_SENT_DATE: TDateTimeField;
    QryActivityLEADDURATION: TBCDField;
    QryActivityLEADDISPLAYUNITS: TBCDField;
    QryActivityTOSCREEN: TStringField;
    QryActivityPRIORITY: TBCDField;
    QryActivitySOURCE_DISPLAY: TStringField;
    QryActivitySOURCE_ID: TBCDField;
    QryActivitySOURCE: TStringField;
    QryActivityARCHIVED: TStringField;
    QryActivityHYPERLINK: TStringField;
    QryActivityHYPERLINKADDRESS: TStringField;
    QryActivityHYPERLINKSUBADDRESS: TStringField;
    QryActivityEPLANT_ID: TBCDField;
    QryActivityPRINCIPLE_SOURCE: TStringField;
    QryActivityPRINCIPLE_SOURCE_ID: TBCDField;
    QryActivityPRINCIPLE_SOURCE_DISP: TStringField;
    QryActivityLOCKED: TStringField;
    QryActivityLOCKEDBY: TStringField;
    QryActivityLOCKEDDATETIME: TDateTimeField;
    QryActivityLOCKISMANUAL: TStringField;
    QryActivityPRINCIPLE_FIRST_NAME: TStringField;
    QryActivityPRINCIPLE_LAST_NAME: TStringField;
    QryActivityPRINCIPLE_TITLE: TStringField;
    QryActivityPRINCIPLE_CONTACT_PHONE: TStringField;
    QryActivityPRINCIPLE_CONTACT_FAX: TStringField;
    QryActivityPRINCIPLE_CONTACT_EXT: TStringField;
    QryActivityPRINCIPLE_CONTACT_EMAIL: TStringField;
    QryActivityPRINCIPLE_COMPANY: TStringField;
    QryActivityPRINCIPLE_ADDR1: TStringField;
    QryActivityPRINCIPLE_ADDR2: TStringField;
    QryActivityPRINCIPLE_ADDR3: TStringField;
    QryActivityPRINCIPLE_CITY: TStringField;
    QryActivityPRINCIPLE_STATE: TStringField;
    QryActivityPRINCIPLE_ZIP: TStringField;
    QryActivityPRINCIPLE_COMPANY_PHONE: TStringField;
    QryActivityPRINCIPLE_COMPANY_FAX: TStringField;
    QryActivityPRINCIPLE_COMPANY_EXT: TStringField;
    QryActivityPRINCIPLE_CRM_PROSPECT: TStringField;
    QryActivityPRINCIPLE_PK_HIDE: TStringField;
    QryActivityPRINCIPLE_COMPANY_URL: TStringField;
    QryActivityPRINCIPLE_COUNTRY: TStringField;
    QryActivityUSE_USA_MASK: TStringField;
    QryActivityARCUSTO_CREDIT_CARD_ID: TBCDField;
    QryActivitySHIP_TO_ID: TBCDField;
    QryActivityBILL_TO_ID: TBCDField;
    QryActivityFREIGHT_ID: TBCDField;
    QryActivityFOB: TStringField;
    QryActivityPRINCIPLE_COMPANYNO: TStringField;
    QryActivityPERSONAL: TStringField;
    QryActivityALLDAY: TStringField;
    QryActivityTIME_AS: TBCDField;
    QryActivityLOCATION: TStringField;
    QryActivitySUBJECT: TStringField;
    QryActivityCAMPAIGN_ID: TBCDField;
    QryActivityCRM_WARRANTY_ID: TBCDField;
    QryActivityCRM_OPPORTUNITY_ID: TBCDField;
    QryActivityASSIGNEDTO_FLAG: TBCDField;
    QryActivityORDER_DTL_ID: TBCDField;
    QryActivityPARENT_ID: TBCDField;
    QryActivityCONTACT_ID: TBCDField;
    QryActivityCREATED: TDateTimeField;
    PMain: TUniPopupMenu;
    Refresh1: TUniMenuItem;
    N1: TUniMenuItem;
    ExpandAll1: TUniMenuItem;
    CollapseAll1: TUniMenuItem;
    N2: TUniMenuItem;
    CopytoClipboard1: TUniMenuItem;
    QryActivityCRM_QUOTE_ID: TBCDField;
    QryActivityDUSER1: TDateTimeField;
    QryActivityQC_AUDIT_ID: TBCDField;
    QryActivityPRINCIPLE_CONTACT_CELL: TStringField;
    QryActivityCUSER1: TStringField;
    QryActivityNUSER1: TFMTBCDField;
    QryActivityHTML_SUMMARY: TMemoField;
    QryActivityPUBLISH: TStringField;
    QryActivityCHANGED: TDateTimeField;
    QryActivityCHANGEDBY: TStringField;
    QryActivityASSIGNEDTO_DISPLAY: TStringField;
    QryActivityCUSER2: TStringField;
    QryActivityCUSER3: TStringField;
    QryActivityCUSER4: TStringField;
    QryActivityCUSER5: TStringField;
    QryActivityCUSER6: TStringField;
    QryActivityNUSER2: TFMTBCDField;
    QryActivityNUSER3: TFMTBCDField;
    QryActivityNUSER4: TFMTBCDField;
    QryActivityNUSER5: TFMTBCDField;
    QryActivityNUSER6: TFMTBCDField;
    QryActivityPRINCIPLE_MIDDLE_NAME: TStringField;
    QryActivityPRINCIPLE_NICKNAME: TStringField;
    QryActivityASSIGNEDBY_DISPLAY: TStringField;
    diData: TwwDataInspector;
    procedure Refresh1Click(Sender: TObject);
    procedure QryActivityBeforeOpen(DataSet: TDataSet);
    procedure ExpandAll1Click(Sender: TObject);
    procedure CollapseAll1Click(Sender: TObject);
    procedure CopytoClipboard1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FActivityID: Real;
    procedure SetActivityID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshData;
  published
    property ActivityID: Real read FActivityID write SetActivityID;
  end;

procedure ShowActivityProperties(AActivityID: Real);


implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Controls;

procedure ShowActivityProperties(AActivityID: Real);
var
  FrmCRMActivityProperties: TFrmCRMActivityProperties;
begin
  FrmCRMActivityProperties := TFrmCRMActivityProperties.Create(uniGUIApplication.uniApplication);
  FrmCRMActivityProperties.ActivityID := AActivityID;
  FrmCRMActivityProperties.ShowModal;
end;

{ TFrmCRMActivityProperties }

procedure TFrmCRMActivityProperties.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
end;

procedure TFrmCRMActivityProperties.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmCRMActivityProperties.RefreshData;
begin
  ReOpen(QryActivity);
  diData.Refresh;
end;

procedure TFrmCRMActivityProperties.SetActivityID(const Value: Real);
begin
  FActivityID := Value;
  RefreshData;
end;

procedure TFrmCRMActivityProperties.Refresh1Click(Sender: TObject);
begin
  RefreshData;
end;

procedure TFrmCRMActivityProperties.QryActivityBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', ActivityID);
end;

procedure TFrmCRMActivityProperties.ExpandAll1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] crm_activity_props.pas(231): E2003 Undeclared identifier: 'ExpandDataInspector'}
  //IQMS.Common.Controls.ExpandDataInspector(diData, TRUE);
end;

procedure TFrmCRMActivityProperties.CollapseAll1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] crm_activity_props.pas(236): E2003 Undeclared identifier: 'ExpandDataInspector'}
  //IQMS.Common.Controls.ExpandDataInspector(diData, FALSE);
end;

procedure TFrmCRMActivityProperties.CopytoClipboard1Click(Sender: TObject);
var
  AList: TStringList;
begin
  try
    AList := TStringList.Create;
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] crm_activity_props.pas(245): E2003 Undeclared identifier: 'DataInspectorAsText'}
    //IQMS.Common.Controls.DataInspectorAsText(diData, AList);
    IQMS.Common.StringUtils.CopyStrToClipbrd(AList.Text);
  finally
    if Assigned(AList) then
      AList.Free;
  end;
end;

end.
