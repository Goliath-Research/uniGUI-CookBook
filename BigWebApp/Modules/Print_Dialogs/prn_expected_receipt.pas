unit prn_expected_receipt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
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
  uniEdit, uniLabel, uniPanel, uniPageControl, uniSplitter,
  uniGUIApplication;

type
  TFrmPrintDocsExpectedReceipt = class(TFrmPrintDocsCustom)
    QryMainRECEIPTNO: TStringField;
    QryMainID: TBCDField;
    QryMainMFG_TYPE: TStringField;
    wwQryLookupID: TBCDField;
    wwQryLookupRECEIPTNO: TStringField;
    procedure BtnPropClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ValidateRange; override;
  public
    { Public declarations }
    procedure AssignCriteria( SelectionList: TStringList ); override;
    function GetReportName( const AMfgType: string ): string;  override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    class procedure DoShowModal( AFrom, ATo: string );
    class procedure DoShow( AFrom, ATo: string );
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings;

{ TFrmPrintDocsExpectedReceipt }

procedure TFrmPrintDocsExpectedReceipt.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{PO_EXPECTED_RECEIPT.RECEIPTNO} = ''%s''', [ FieldByName('receiptno').asString ]));
  end;
end;

procedure TFrmPrintDocsExpectedReceipt.BtnPropClick(Sender: TObject);
begin
  // inherited;
  DoReportProperties('EXPECTED_RECEIPT_REPORT', 'IQSYS2');
end;

class procedure TFrmPrintDocsExpectedReceipt.DoShowModal(AFrom, ATo: string);
var
  FrmPrintDocsExpectedReceipt: TFrmPrintDocsExpectedReceipt;
begin
  FrmPrintDocsExpectedReceipt := self.Create(uniGUIApplication.UniApplication );
  with FrmPrintDocsExpectedReceipt do
  begin
    try
      ToTxt := Ato;
      From := AFrom;
      if not IsConsole then
         ShowModal
      else
         btnOK.Click;
    finally
      //Free;
    end;
  end;
end;


class procedure TFrmPrintDocsExpectedReceipt.DoShow(AFrom, ATo: string );
var
  FrmPrintDocsExpectedReceipt: TFrmPrintDocsExpectedReceipt;
begin
  FrmPrintDocsExpectedReceipt := TFrmPrintDocsExpectedReceipt.Create( uniGUIApplication.UniApplication );
  with FrmPrintDocsExpectedReceipt do
  begin
    ToTxt := Ato;
    From := AFrom;
    if not IsConsole then
       Show
    else
       btnOK.Click;
  end;
end;


function TFrmPrintDocsExpectedReceipt.GetBeforeReport(
  const AMfgType: string): string;
begin
  Result:= SelectValueAsString('select BEFORE_EXPECTED_RECEIPT_REPORT from iqsys2');
end;

function TFrmPrintDocsExpectedReceipt.GetReportName(
  const AMfgType: string): string;
begin
  Result:= SelectValueAsString('select EXPECTED_RECEIPT_REPORT from iqsys2');
  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;

procedure TFrmPrintDocsExpectedReceipt.ValidateRange;
var
  AFrom, ATo:String;
begin
  { TODO -oSanketG -cWC : Need to find alternative for DisplayValue in TUniDBLookupComboBox}
  {AFrom := SelectValueFmtAsString('select LPad( ''%s'', 50, ''0'') from dual', [wwcombFrom.DisplayValue]);
  ATo   := SelectValueFmtAsString('select LPad( ''%s'', 50, ''0'') from dual', [wwcombTo.DisplayValue]);}


  if AFrom > ATo then
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000209);  // 'Invalid range: ''From'' must not be greater than ''To'' (character based)'
end;

end.
