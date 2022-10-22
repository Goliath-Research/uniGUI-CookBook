unit prn_crm_quote;

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
  TFrmPrintDocsCRMQuote = class(TFrmPrintDocsCustom)
    wwQryLookupID: TBCDField;
    wwQryLookupRFQ: TStringField;
    wwQryLookupPROJECT: TStringField;
    wwQryLookupQUOTE_DATE: TDateTimeField;
    procedure BtnPropClick(Sender: TObject);
    procedure popmEmailPopup(Sender: TObject);
    private
      { Private declarations }
      FArcustoID: Real;
    protected
      { Protected declarations }
      function GetTableNameForUpdatePrintCount: string; override;
      function GetPKFieldNameForUpdatePrintCount: string; override;
      function GetReportName(const AMfgType: string): string; override;
      function GetBeforeReport(const AMfgType: string): string; override;
      procedure AssignCriteria(SelectionList: TStringList); override;
    public
      { Public declarations }
      class procedure DoShow(const AArcustoID: Real;
                             const AFrom, ATo: string);

      property ArcustoID: Real read FArcustoID write FArcustoID;
  end;

procedure DoPrintCRMQuote(const AArcustoID: Real; const AFrom, ATo: string);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RepProps,
  uniGUIApplication;

procedure DoPrintCRMQuote(const AArcustoID: Real; const AFrom, ATo: string);
begin
  TFrmPrintDocsCRMQuote.DoShow(AArcustoID, AFrom, ATo);
end;

{ TFrmPrintDocsCRMQuote }

class procedure TFrmPrintDocsCRMQuote.DoShow(const AArcustoID: Real; const AFrom, ATo: string);
begin
  with TFrmPrintDocsCRMQuote.Create(uniGUIApplication.UniApplication) do
    begin
      ReOpen(wwQryLookup);
      ToTxt := ATo;
      From := AFrom;
      ArcustoID := AArcustoID;
      Show;
    end;
end;

procedure TFrmPrintDocsCRMQuote.AssignCriteria(SelectionList: TStringList);
begin
  with SelectionList do
    begin
      Clear;
      Add(IQFormat('{CRM_QUOTE.ID} = %.0f',
        [QryMain.FieldByName('ID').AsFloat]));
    end;
end;

function TFrmPrintDocsCRMQuote.GetBeforeReport(const AMfgType: string): string;
begin
  Result := SelectValueAsString('SELECT before_crm_quote_report FROM iqsys');
end;

function TFrmPrintDocsCRMQuote.GetReportName(const AMfgType: string): string;
begin
  // Initialize
  Result := '';
  // 07/02/2010 If customer is assigned, attempt to get report assigned
  // in Customer Maintenance.
  if ArcustoID > 0 then
    Result := SelectValueFmtAsString('SELECT crm_quote_report FROM arcusto ' +
      'WHERE id = %.0f', [ArcustoID]);
  // Default report name from System Parameters
  if Result = '' then
    Result := SelectValueAsString('SELECT crm_quote_report FROM iqsys WHERE ROWNUM < 2');
end;

procedure TFrmPrintDocsCRMQuote.popmEmailPopup(Sender: TObject);
begin
  ThisArcusto_ID :=
    SelectValueFmtAsFloat('select arcusto_id from crm_quote where rfq = ''%s''',
    [wwcombFrom.Text]);
  inherited;
end;

procedure TFrmPrintDocsCRMQuote.BtnPropClick(Sender: TObject);
begin
  DoReportProperties('CRM_QUOTE_REPORT');
end;

function TFrmPrintDocsCRMQuote.GetTableNameForUpdatePrintCount: string;
begin
  Result := 'crm_quote';
end;

function TFrmPrintDocsCRMQuote.GetPKFieldNameForUpdatePrintCount: string;
begin
  Result := 'id';
end;

end.
