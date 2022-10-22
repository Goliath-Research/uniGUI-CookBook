unit Prn_CoC;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
  Mask,
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
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  IQMS.WebVcl.SoftEPlant,
  System.ImageList,
  Vcl.Controls,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Dialogs,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox, uniImageList, uniMainMenu, uniButton, uniTabControl,
  Vcl.ComCtrls, uniMemo, uniComboBox, uniBitBtn, uniSpeedButton, uniMultiItem,
  uniDBComboBox, uniDBLookupComboBox, uniEdit, uniLabel, uniPanel,
  uniPageControl, uniSplitter;

type
  TFrmPrintCoC = class(TFrmPrintDocsCustom)
    cbAutoEmail: TUniCheckBox;
    cbPrintOnly: TUniCheckBox;
    procedure BtnPropClick(Sender: TObject);
    procedure cbAutoEmailClick(Sender: TObject);
    procedure cbPrintOnlyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FlTo: String;
    FFrom: String;
    procedure SetFrom(const Value: String);
    procedure SetlTo(const Value: String);
    { Private declarations }
  protected
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
    procedure DoAfterCRWPrint( Sender: TObject;  AReportName: string; ASelectionList, AExternalDocsList: TStringList; AFileName: string ); override;
    property From : String write SetFrom;
    property lTo : String write SetlTo;
  end;

procedure DoPrint_COC( const AFrom, ATo: string; ASilentExec: Boolean = FALSE );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.PrintDialogsShare,
  UniGUIApplication,
  IQMS.Common.RepProps;

{ TFrmPrintCoC }

procedure DoPrint_COC( const AFrom, ATo: string; ASilentExec: Boolean = FALSE );
var
  LFrmPrintCoC : TFrmPrintCoC;
begin
  LFrmPrintCoC := TFrmPrintCoC.Create(UniGUIApplication.UniApplication);
  with LFrmPrintCoC do
  begin
    From := AFrom;
    lTo := ATo;
    if not ASilentExec then
       Show
    else
       btnOK.Click;
  end;
end;

procedure TFrmPrintCoC.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;

    {Aug-09-2006 composite table must be populated before we print report along with the ext docs}
    if SelectValueFmtAsFloat('select 1 from c_ship_bom where shipment_dtl_id = %f', [ FieldByName('id').asFloat ]) = 0 then
    begin
       ExecuteCommandFmt( 'begin ship_bom.populate_ship_bom( %f ); end;', [ FieldByName('id').asFloat ]);
       ReOpen(QryDocs);
       ReOpen(QryDocsExt);
    end;

    Add( IQFormat('{C_SHIP_BOM.SHIPMENT_DTL_ID} = %.0f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintCoC.GetBeforeReport(const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', [ 'BEFORE_COC_REPORT', 'IQSys' ]);
end;

function TFrmPrintCoC.GetReportName(const AMfgType: string): string;
var
  AShip_To_ID:Real;
begin

  AShip_To_ID:= QryMain.FieldByName('ship_to_id').asFloat;
  Result:= SelectValueFmtAsString('select COC_REPORT from ship_to where id = %f', [AShip_To_ID]);

  if Empty( Result ) then
    Result:= SelectValueFmtAsString('select a.COC_REPORT from arcusto a, ship_to s where s.id = %f and s.arcusto_id = a.id', [AShip_To_ID]);

  if Empty( Result ) then
    Result:= SelectValueAsString('select COC_REPORT from iqsys');
  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;


procedure TFrmPrintCoC.SetFrom(const Value: String);
begin
  FFrom := Value;
end;

procedure TFrmPrintCoC.SetlTo(const Value: String);
begin
  FlTo := Value;
end;

procedure TFrmPrintCoC.BtnPropClick(Sender: TObject);
begin
  DoReportProperties('COC_REPORT');
end;

procedure TFrmPrintCoC.cbAutoEmailClick(Sender: TObject);
begin
  FSendAutoEmailOnly := cbAutoEmail.checked;
  if FSendAutoEmailOnly then
  begin
    IQRegIntegerScalarWrite( self, 'COC_AUTO_EMAIL_ONLY', 1);
    cbPrintOnly.checked := false;
    cbPrintOnlyClick(nil);
  end
  else
    IQRegIntegerScalarWrite( self, 'COC_AUTO_EMAIL_ONLY', 0);
end;

procedure TFrmPrintCoC.cbPrintOnlyClick(Sender: TObject);
begin
  FPrintOnlyNoEmail := cbPrintOnly.checked;
  if FPrintOnlyNoEmail then
  begin
    IQRegIntegerScalarWrite( self, 'COC_AUTO_PRINT_ONLY', 1);
    cbAutoEmail.checked := false;
    cbAutoEmailClick(nil);
  end
  else
    IQRegIntegerScalarWrite( self, 'COC_AUTO_PRINT_ONLY', 0);
end;

procedure TFrmPrintCoC.DoAfterCRWPrint(Sender: TObject; AReportName: string;
  ASelectionList, AExternalDocsList: TStringList; AFileName: string);
var
  AArcusto_ID: Real;
  AShip_To_ID: Real;
  ABill_To_ID: Real;
  AList      : TStringList;
  ABody      : string;
  ACustNo    : string;
  APackslipNo: string;
  AItemNo    : string;
  A          : Variant;
begin
  A:= SelectValueArrayFmt('select arcusto_id, ship_to_id, bill_to_id, '+
                     '       packslipno                          '+
                     '  from shipment_dtl d, shipments s         '+
                     ' where d.id = %f and d.shipments_id = s.id ',
                     [ QryMain.FieldByName('id').asFloat ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  // AUTO_EFORM
  AArcusto_ID:= A[0];
  AShip_To_ID:= A[1];
  ABill_To_ID:= A[2];
  APackslipNo:= A[3];
  ACustNo    := SelectValueByID('custno', 'arcusto', AArcusto_ID );
  AItemNo    := SelectValueFmtAsString('select rtrim(itemno) from c_ship_hist where shipment_dtl_id = %f', [ QryMain.FieldByName('id').asFloat ]);

  ABody:= Format('COC PS# %s %s, %s', [ APackslipNo, ACustNo, AItemNo ]);

  // construct body
  TAutoEForm.Create( 'COC',
                     AArcusto_ID,
                     AShip_To_ID,
                     ABill_To_ID,
                     AReportName,
                     ASelectionList,
                     Format('COC PS# %s %s, %s', [ APackslipNo, ACustNo, AItemNo ]),
                     ABody,
                     'SHIPMENT_DTL',
                     QryMain.FieldByName('id').asFloat, // shipment_dtl_id
                     AExternalDocsList,
                     AFileName ).Execute;   {IQMS.Common.PrintDialogsShare.pas}
end;

procedure TFrmPrintCoC.FormShow(Sender: TObject);
var
  AType:Integer;
begin
  inherited;
  AType := 0;

  if IQRegIntegerScalarRead( self, 'COC_AUTO_EMAIL_ONLY', AType ) then
  begin
    FSendAutoEmailOnly := AType = 1;
    cbAutoEmail.checked := AType = 1;
    if AType = 1 then
      IQRegIntegerScalarWrite( self, 'COC_AUTO_PRINT_ONLY', 0);
  end
  else
  begin
    FSendAutoEmailOnly := false;
    cbAutoEmail.checked := false;
    IQRegIntegerScalarWrite( self, 'COC_AUTO_EMAIL_ONLY', 0);
  end;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'COC_AUTO_PRINT_ONLY', AType ) then
  begin
    FPrintOnlyNoEmail := AType = 1;
    cbPrintOnly.checked := AType = 1;
  end
  else
  begin
    FPrintOnlyNoEmail := false;
    cbPrintOnly.checked := false;
    IQRegIntegerScalarWrite( self, 'COC_AUTO_PRINT_ONLY', 0);
  end;
end;

end.
