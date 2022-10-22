unit prn_cc_receipt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
  Data.DB,
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
  UniGUIApplication,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Buttons,
  Vcl.wwdblook, uniGUIBaseClasses, uniGUIClasses, uniImageList, uniMainMenu,
  uniButton, uniTabControl, Vcl.ComCtrls, uniMemo, uniComboBox, uniBitBtn,
  uniSpeedButton, uniCheckBox, uniMultiItem, uniDBComboBox, uniDBLookupComboBox,
  uniEdit, uniLabel, uniPanel, uniPageControl, uniSplitter;

type
  TFrmPrintDocsCCReceipt = class(TFrmPrintDocsCustom)
    QryMainID: TBCDField;
    QryMainMFG_TYPE: TStringField;
  private
    { Private declarations }
  protected
    { Protected declarations }
    function GetReportName(const AMfgType: string): string; override;
    function GetBeforeReport(const AMfgType: string): string; override;
    procedure AssignCriteria(SelectionList: TStringList); override;
    function GetReportSubject: string; override;
  public
    { Public declarations }
  end;

procedure DoCreditCardReceipt(const AFrom, ATo: string);

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.ResStrings;

procedure DoCreditCardReceipt(const AFrom, ATo: string);
var
  LFrmPrintDocsCCReceipt : TFrmPrintDocsCCReceipt;
begin
  LFrmPrintDocsCCReceipt := TFrmPrintDocsCCReceipt.create(UniGUIApplication.UniApplication);
  with LFrmPrintDocsCCReceipt do
  begin
    DoShow(AFrom, ATo);
  end;
end;

{ TFrmPrintDocsCCReceipt }

procedure TFrmPrintDocsCCReceipt.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add(Format('{CREDIT_CARD_TRANS.ID} = %.0f', [FieldByName('id').AsFloat]));
  end;
end;

function TFrmPrintDocsCCReceipt.GetBeforeReport(const AMfgType: string): string;
begin
  Result := SelectValueAsString('SELECT before_cc_receipt_report FROM iqsys2 ' +
    'WHERE ROWNUM < 2');
end;

function TFrmPrintDocsCCReceipt.GetReportName(const AMfgType: string): string;
begin
  Result := SelectValueAsString('SELECT cc_receipt_report FROM iqsys2 ' +
    'WHERE ROWNUM < 2');
  if (Result = '') then
    // 'No default report assigned in System Parameters. Please assign default report.'
    raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160);
end;

function TFrmPrintDocsCCReceipt.GetReportSubject: string;
begin
  Result := Format('Credit Card Receipt - Transaction %s',
    [QryMainID.AsString]);
end;

end.
