unit prn_crm_ack;

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
  TFrmPrintDocsCRMAck = class(TFrmPrintDocsCustom)
    wwQryLookupID: TBCDField;
    wwQryLookupRFQ: TStringField;
    wwQryLookupPROJECT: TStringField;
    wwQryLookupQUOTE_DATE: TDateTimeField;
    procedure BtnPropClick(Sender: TObject);
    procedure popmEmailPopup(Sender: TObject);
    private
      { Private declarations }
      FArcustoID: Real;
    public
      { Public declarations }
      class procedure DoShow(const AFrom, ATo: string; const AArcustoID: Real);
      function GetReportName(const AMfgType: string): string; override;
      function GetBeforeReport(const AMfgType: string): string; override;
      procedure AssignCriteria(SelectionList: TStringList); override;
      property ArcustoID: Real read FArcustoID write FArcustoID;
  end;

procedure DoPrintCRMQuoteAck(const AArcustoID: Real; const AFrom, ATo: string);

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RepProps,
  uniGUIApplication;

procedure DoPrintCRMQuoteAck(const AArcustoID: Real; const AFrom, ATo: string);
begin
  TFrmPrintDocsCRMAck.DoShow(AFrom, ATo, AArcustoID);
end;

{ TFrmPrintDocsCRMAck }
class procedure TFrmPrintDocsCRMAck.DoShow(const AFrom, ATo: string;
                                           const AArcustoID: Real);
var
  LFrmPrintDocsCRMAck : TFrmPrintDocsCRMAck;
begin
  LFrmPrintDocsCRMAck := TFrmPrintDocsCRMAck.Create(uniGUIApplication.UniApplication);
  with LFrmPrintDocsCRMAck do
    begin
      ReOpen(wwQryLookup);
      ToTxt := ATo;
      From := AFrom;
      ArcustoID := AArcustoID;
      Show;
    end;
end;

procedure TFrmPrintDocsCRMAck.AssignCriteria(SelectionList: TStringList);
begin
  with SelectionList do
    begin
      Clear;
      Add(Format('{CRM_QUOTE.ID} = %.0f', [QryMain.FieldByName('ID').AsFloat]));
    end;
end;

function TFrmPrintDocsCRMAck.GetBeforeReport(const AMfgType: string): string;
begin
  Result := SelectValueAsString('SELECT before_crm_ack_report FROM iqsys');
end;

function TFrmPrintDocsCRMAck.GetReportName(const AMfgType: string): string;
begin
  Result := SelectValueAsString('SELECT crm_ack_report FROM iqsys ' +
    'WHERE ROWNUM < 2');
end;

procedure TFrmPrintDocsCRMAck.popmEmailPopup(Sender: TObject);
begin
  ThisArcusto_ID := SelectValueFmtAsFloat('SELECT arcusto_id FROM crm_quote ' +
    'WHERE rfq = ''%s''', [wwcombFrom.Text]);
  inherited;
end;

procedure TFrmPrintDocsCRMAck.BtnPropClick(Sender: TObject);
begin
  IQMS.Common.RepProps.DoReportProperties('CRM_ACK_REPORT');
end;

end.
