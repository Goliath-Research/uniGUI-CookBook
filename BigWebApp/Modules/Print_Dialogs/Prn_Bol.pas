unit Prn_BOL;

interface

uses
  Winapi.Windows,
  System.SysUtils,
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
  uniCheckBox,
  uniEdit,
  uniLabel, uniImageList, uniMainMenu, uniButton, uniTabControl, Vcl.ComCtrls,
  uniMemo, uniComboBox, uniBitBtn, uniSpeedButton, uniMultiItem, uniDBComboBox,
  uniDBLookupComboBox, uniPanel, uniPageControl, uniSplitter;

type
  TFrmPrintBOL = class(TFrmPrintDocsCustom)
    cbPrintOnly: TUniCheckBox;
    cbAutoEmail: TUniCheckBox;
    lblEplant: TUniLabel;
    wwDBComboDlgEPlant: TUniEdit;
    procedure BtnPropClick(Sender: TObject);
    procedure cbAutoEmailClick(Sender: TObject);
    procedure cbPrintOnlyClick(Sender: TObject);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure popmEmailPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReportSubject: string; override;
    procedure DoAfterCRWPrint( Sender: TObject;  AReportName: string; ASelectionList, AExternalDocsList: TStringList; AFileName: string ); override;
    procedure CheckShowEPlant; override;
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  end;

procedure DoPrintPS_BOL( const AFrom, ATo: string );

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  IQMS.Common.PrintDialogsShare,
  IQMS.Common.RegFrm,
  UniGUIApplication;

{$R *.DFM}

procedure DoPrintPS_BOL( const AFrom, ATo: string );
var
  LFrm: TFrmPrintBOL;
begin
  LFrm:= TFrmPrintBOL.Create(UniGUIApplication.UniApplication);
  LFrm.ToTxt:= ATo;
  LFrm.From:= AFrom;
  LFrm.Show;
end;

procedure TFrmPrintBOL.AssignCriteria( SelectionList: TStringList );
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{SHIPMENTS.ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintBOL.GetReportName( const AMfgType: string ): string;
begin
  // Result:= SelectValueFmtAsString('select %s from %s', ['BOL_REPORT', 'IQSys' ]);
  Result:= GetReportNameEx( 'BOL_REPORT', [ 'ship_to', QryMain.FieldByName('ship_to_id').asFloat,
                                            'arcusto', QryMain.FieldByName('arcusto_id').asFloat ]);
  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;

function TFrmPrintBOL.GetBeforeReport( const AMfgType: string ): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', [ 'BEFORE_BOL_REPORT', 'IQSys' ]);
end;

function TFrmPrintBOL.GetReportSubject: string;
begin
  with QryMain do
    Result:= Format(IQMS.Common.ResStrings.cTXT0000227 {'Packing Slip # %s'}, [ FieldByName('packslipno').asString ]);
end;

procedure TFrmPrintBOL.popmEmailPopup(Sender: TObject);
begin
  ThisArcusto_ID:= SelectValueFmtAsFloat('select arcusto_id from shipments where rtrim(packslipno) = ''%s'' ', [ wwcombFrom.Text ]);
  inherited;
end;

procedure TFrmPrintBOL.BtnPropClick(Sender: TObject);
begin
  DoReportProperties('BOL_REPORT');
end;

procedure TFrmPrintBOL.DoAfterCRWPrint( Sender: TObject;  AReportName: string; ASelectionList, AExternalDocsList: TStringList; AFileName: string );
var
  AArcusto_ID: Real;
  AShip_To_ID: Real;
  ABill_To_ID: Real;
begin
  inherited;  {n}

  {AUTO_EFORM}
  AArcusto_ID:= SelectValueByID('arcusto_id', 'shipments', QryMain.FieldByName('id').asFloat);
  AShip_To_ID:= SelectValueByID('ship_to_id', 'shipments', QryMain.FieldByName('id').asFloat);
  ABill_To_ID:= SelectValueByID('bill_to_id', 'shipments', QryMain.FieldByName('id').asFloat);

  TAutoEForm.Create( 'BOL',
                     AArcusto_ID,
                     AShip_To_ID,
                     ABill_To_ID,
                     AReportName,
                     ASelectionList,
                     Format('BOL PS# %s', [ QryMain.FieldByName('packslipno').asString ]),
                     '',
                     'SHIPMENTS',
                     QryMain.FieldByName('id').asFloat,
                     AExternalDocsList,
                     AFileName ).Execute;   {Prn_Share.pas}
end;


procedure TFrmPrintBOL.FormShow(Sender: TObject);
var
  AType:Integer;
begin
  inherited;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'BOL_AUTO_EMAIL_ONLY', AType ) then
  begin
    FSendAutoEmailOnly := AType = 1;
    cbAutoEmail.checked := AType = 1;
    if AType = 1 then
      IQRegIntegerScalarWrite( self, 'BOL_AUTO_PRINT_ONLY', 0);
  end
  else
  begin
    FSendAutoEmailOnly := false;
    cbAutoEmail.checked := false;
    IQRegIntegerScalarWrite( self, 'BOL_AUTO_EMAIL_ONLY', 0);
  end;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'BOL_AUTO_PRINT_ONLY', AType ) then
  begin
    FPrintOnlyNoEmail := AType = 1;
    cbPrintOnly.checked := AType = 1;
  end
  else
  begin
    FPrintOnlyNoEmail := false;
    cbPrintOnly.checked := false;
    IQRegIntegerScalarWrite( self, 'BOL_AUTO_PRINT_ONLY', 0);
  end;

  FPrintFileNameFormatElementsUsed:= Format('%s;%s;%s;%s',
                                            [ GetFileFormatElementName('type'),
                                              GetFileFormatElementName('number'),
                                              GetFileFormatElementName('date'),
                                              GetFileFormatElementName('company')] );
end;

procedure TFrmPrintBOL.cbAutoEmailClick(Sender: TObject);
begin
  FSendAutoEmailOnly := cbAutoEmail.checked;
  if FSendAutoEmailOnly then
  begin
    IQRegIntegerScalarWrite( self, 'BOL_AUTO_EMAIL_ONLY', 1);
    cbPrintOnly.checked := false;
    cbPrintOnlyClick(nil);
  end
  else
    IQRegIntegerScalarWrite( self, 'BOL_AUTO_EMAIL_ONLY', 0);
end;

procedure TFrmPrintBOL.cbPrintOnlyClick(Sender: TObject);
begin
  FPrintOnlyNoEmail := cbPrintOnly.checked;
  if FPrintOnlyNoEmail then
  begin
    IQRegIntegerScalarWrite( self, 'BOL_AUTO_PRINT_ONLY', 1);
    cbAutoEmail.checked := false;
    cbAutoEmailClick(nil);
  end
  else
    IQRegIntegerScalarWrite( self, 'BOL_AUTO_PRINT_ONLY', 0);
end;

procedure TFrmPrintBOL.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
begin
  inherited;
  if SoftEPlant1.ChangeEPlantView then
     CheckShowEPlant;
end;

procedure TFrmPrintBOL.CheckShowEPlant;
begin
  AssignEPlantDialogVisible( lblEplant, wwDBComboDlgEPlant );
end;

end.
