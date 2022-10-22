unit Prn_tl;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Prn_Doc,
  Data.DB,
  Mask,
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
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.SoftEPlant,
  System.ImageList,
  Vcl.Controls,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Dialogs,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Buttons, uniGUIBaseClasses, uniGUIClasses, uniImageList, uniMainMenu,
  uniButton, uniTabControl, Vcl.ComCtrls, uniMemo, uniComboBox, uniBitBtn,
  uniSpeedButton, uniCheckBox, uniMultiItem, uniDBComboBox, uniDBLookupComboBox,
  uniEdit, uniLabel, uniPanel, uniPageControl, Vcl.Forms, uniSplitter;

type
  { TProjectManagerReport }
  TProjectManagerReport = (pmrProjectQuote, pmrProjectWorkOrder,
    pmrProjectReport);

  { TFrmPrintDocsTooling }
  TFrmPrintDocsTooling = class(TFrmPrintDocsCustom)
    wwQryLookupID: TBCDField;
    wwQryLookupRFQ: TStringField;
    wwQryLookupPROJECT: TStringField;
    wwQryLookupCREATE_DATE: TDateTimeField;
    QryMainID: TBCDField;
    QryDocsExtFILENAME: TStringField;
    QryDocsID: TBCDField;
    QryDocsDOCSEQ: TBCDField;
    QryDocsDESCRIP: TStringField;
    QryDocsDOC_BLOB: TBlobField;
    QryMainmfg_type: TStringField;
    QryMainprn_type: TIntegerField;
    QryDocsExtLIB_PATH: TStringField;
    QryDocsExtSEQ: TBCDField;
    procedure BtnPropClick(Sender: TObject);
    procedure QryMainCalcFields(DataSet: TDataSet);
  private
    procedure SetProjectManagerReport(const Value: TProjectManagerReport);
    { Private declarations }
  public
    { Public declarations }
    FReport: TProjectManagerReport;
    function GetReportFieldName: string;
    function GetReportName(const AMfgType: string): string; override;
    function GetBeforeReport(const AMfgType: string): string; override;
    procedure AssignCriteria(SelectionList: TStringList); override;
    class procedure DoShow(AFrom, ATo: string; AReport: TProjectManagerReport);
    property Report: TProjectManagerReport write SetProjectManagerReport;
  end;

procedure DoPrintTooling(const AFrom, ATo: string;
  AReport: TProjectManagerReport = pmrProjectReport);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.ResStrings,
  IQMS.Common.RepProps,
  UniGUIApplication;

procedure DoPrintTooling(const AFrom, ATo: string;
  AReport: TProjectManagerReport);
begin
  TFrmPrintDocsTooling.DoShow(AFrom, ATo, AReport);
end;

class procedure TFrmPrintDocsTooling.DoShow(AFrom, ATo: string;
  AReport: TProjectManagerReport);
var
  LFrm: TFrmPrintDocsTooling;
begin
  LFrm:= Self.Create(UniGUIApplication.UniApplication);
  LFrm.From:= AFrom;
  LFrm.ToTxt:= ATo;
  LFrm.Report:= AReport;
  LFrm.Show();
end;

procedure TFrmPrintDocsTooling.AssignCriteria(SelectionList: TStringList);
begin
  with SelectionList do
  begin
    Clear;
    Add(Format('{V_TOOL_RFQ.ID} = %.0f', [QryMain.FieldByName('ID').AsFloat]));
  end;
end;

function TFrmPrintDocsTooling.GetReportFieldName: string;
begin
  case FReport of
    pmrProjectQuote:
      Result := 'TL_RFQ_REPORT';
    pmrProjectWorkOrder:
      Result := 'TL_WO_REPORT';
    pmrProjectReport:
      Result := 'TL_PRJ_REPORT'; // Project printout
  end;
end;

function TFrmPrintDocsTooling.GetReportName(const AMfgType: string): string;
begin
  Result := SelectValueFmtAsString('SELECT %s FROM iqsys WHERE ROWNUM < 2',
    [GetReportFieldName]);
end;

function TFrmPrintDocsTooling.GetBeforeReport(const AMfgType: string): string;
begin
  Result := SelectValueFmtAsString
    ('SELECT BEFORE_%s FROM iqsys WHERE ROWNUM < 2', [GetReportFieldName]);
end;

procedure TFrmPrintDocsTooling.BtnPropClick(Sender: TObject);
begin
  inherited;
  try
    DoReportProperties(GetReportFieldName); // RepProps.pas
  except
    on Exception do
      // 'No default report assigned in System Parameters.
      // Please assign default report.'
      raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160);
  end
end;

procedure TFrmPrintDocsTooling.QryMainCalcFields(DataSet: TDataSet);
begin
  QryMainmfg_type.AsString := GetReportName('');
  // If we are printing the work order report, then pass 1 as the type;
  // for all others, pass 0.
  AssignQueryParamValue(DataSet, 'prn_type',
    IQMS.Common.Numbers.iIIf(FReport = pmrProjectWorkOrder, 1, 0));
end;

procedure TFrmPrintDocsTooling.SetProjectManagerReport
  (const Value: TProjectManagerReport);
begin
  FReport := Value;
end;

end.
