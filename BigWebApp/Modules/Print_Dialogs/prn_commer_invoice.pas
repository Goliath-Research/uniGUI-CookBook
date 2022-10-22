unit prn_commer_invoice;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
  Data.DB,
  vcl.wwdblook,
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
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox, uniImageList, uniMainMenu, uniButton, uniTabControl,
  Vcl.ComCtrls, uniMemo, uniComboBox, uniBitBtn, uniSpeedButton, uniMultiItem,
  uniDBComboBox, uniDBLookupComboBox, uniEdit, uniLabel, uniPanel,
  uniPageControl, uniSplitter;

type
  TFrmPrintCommerInvoice = class(TFrmPrintDocsCustom)
    cbAutoEmail: TUniCheckBox;
    cbPrintOnly: TUniCheckBox;
    wwQryLookupPACKSLIPNO: TStringField;
    wwQryLookupCLASS: TStringField;
    wwQryLookupITEMNO: TStringField;
    wwQryLookupREV: TStringField;
    wwQryLookupDESCRIP: TStringField;
    procedure BtnPropClick(Sender: TObject);
    procedure cbAutoEmailClick(Sender: TObject);
    procedure cbPrintOnlyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  end;

procedure DoPrintCommercialInvoice( const AFrom, ATo: string; ASilentExec: Boolean = FALSE );


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  uniGUIApplication;

procedure DoPrintCommercialInvoice( const AFrom, ATo: string; ASilentExec: Boolean = FALSE );
begin
  with TFrmPrintCommerInvoice.Create(uniGUIApplication.UniApplication ) do
  begin
    if not ASilentExec then
    begin
       ToTxt := ATo;
       From := AFrom;
       Show
    end
    else
       btnOK.Click;
  end;
end;

procedure TFrmPrintCommerInvoice.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{SHIPMENTS.ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;


function TFrmPrintCommerInvoice.GetBeforeReport(const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', [ 'BEFORE_COMMER_INVOICE_REPORT', 'IQSys2' ]);
end;


function TFrmPrintCommerInvoice.GetReportName(const AMfgType: string): string;
var
  AShip_To_ID:Real;
begin
  AShip_To_ID:= QryMain.FieldByName('ship_to_id').asFloat;
  Result:= SelectValueFmtAsString('select COMMER_INVOICE_REPORT from ship_to where id = %f', [AShip_To_ID]);

  if Empty( Result ) then
    Result:= SelectValueFmtAsString('select a.COMMER_INVOICE_REPORT from arcusto a, ship_to s where s.id = %f and s.arcusto_id = a.id', [AShip_To_ID]);

  if Empty( Result ) then
    Result:= SelectValueAsString('select COMMER_INVOICE_REPORT from iqsys2');

  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;


procedure TFrmPrintCommerInvoice.BtnPropClick(Sender: TObject);
begin
  DoReportProperties('COMMER_INVOICE_REPORT', 'IQSYS2');
end;

procedure TFrmPrintCommerInvoice.cbAutoEmailClick(Sender: TObject);
begin
  FSendAutoEmailOnly := cbAutoEmail.checked;
  if FSendAutoEmailOnly then
  begin
    IQRegIntegerScalarWrite( self, 'COMMER_INVOICE_AUTO_EMAIL_ONLY', 1);
    cbPrintOnly.checked := false;
    cbPrintOnlyClick(nil);
  end
  else
    IQRegIntegerScalarWrite( self, 'COMMER_INVOICE_AUTO_EMAIL_ONLY', 0);
end;

procedure TFrmPrintCommerInvoice.cbPrintOnlyClick(Sender: TObject);
begin
  FPrintOnlyNoEmail := cbPrintOnly.checked;
  if FPrintOnlyNoEmail then
  begin
    IQRegIntegerScalarWrite( self, 'COMMER_INVOICE_AUTO_PRINT_ONLY', 1);
    cbAutoEmail.checked := false;
    cbAutoEmailClick(nil);
  end
  else
    IQRegIntegerScalarWrite( self, 'COMMER_INVOICE_AUTO_PRINT_ONLY', 0);
end;

procedure TFrmPrintCommerInvoice.FormCreate(Sender: TObject);
var
  AType:Integer;
begin
  inherited;
  AType := 0;

  if IQRegIntegerScalarRead( self, 'COMMER_INVOICE_AUTO_EMAIL_ONLY', AType ) then
  begin
    FSendAutoEmailOnly := AType = 1;
    cbAutoEmail.checked := AType = 1;
    if AType = 1 then
      IQRegIntegerScalarWrite( self, 'COMMER_INVOICE_AUTO_PRINT_ONLY', 0);
  end
  else
  begin
    FSendAutoEmailOnly := false;
    cbAutoEmail.checked := false;
    IQRegIntegerScalarWrite( self, 'COMMER_INVOICE_AUTO_EMAIL_ONLY', 0);
  end;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'COMMER_INVOICE_AUTO_PRINT_ONLY', AType ) then
  begin
    FPrintOnlyNoEmail := AType = 1;
    cbPrintOnly.checked := AType = 1;
  end
  else
  begin
    FPrintOnlyNoEmail := false;
    cbPrintOnly.checked := false;
    IQRegIntegerScalarWrite( self, 'COMMER_INVOICE_AUTO_PRINT_ONLY', 0);
  end;


end;

end.
