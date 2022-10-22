unit Prn_PS;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
  Data.DB,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.Hpick,
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
  IQMS.WebVcl.SoftEPlant,
  System.ImageList,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.Dialogs,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniLabel, uniImageList, uniMainMenu, uniTabControl, Vcl.ComCtrls, uniMemo,
  uniComboBox, uniMultiItem, uniDBComboBox, uniDBLookupComboBox, uniPanel,
  uniPageControl, uniSplitter;

type
  TFrmPrintDocsPS = class(TFrmPrintDocsCustom)
    PkPackSlip: TIQWebHPick;
    PkPackSlipCLASS: TStringField;
    PkPackSlipITEMNO: TStringField;
    PkPackSlipREV: TStringField;
    PkPackSlipDESCRIP: TStringField;
    PkPackSlipPACKSLIPNO: TStringField;
    sbtnPickPS1: TUniSpeedButton;
    sbtnPickPS2: TUniSpeedButton;
    cbAutoEmail: TUniCheckBox;
    cbPrintOnly: TUniCheckBox;
    lblEplant: TUniLabel;
    wwDBComboDlgEPlant: TUniEdit;
    chkIncludeAttachedRecords: TUniCheckBox;
    chkSilentPrintAutoEmail: TUniCheckBox;
    procedure BtnPropClick(Sender: TObject);
    procedure DoPSPickList(Sender: TObject);
    procedure cbAutoEmailClick(Sender: TObject);
    procedure cbPrintOnlyClick(Sender: TObject);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure chkIncludeAttachedRecordsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popmEmailPopup(Sender: TObject);
    procedure chkSilentPrintAutoEmailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReportSubject: string; override;
    function GetTableNameForUpdatePrintCount: string; override;
    function AssignPrinterSettingsInternal( AComponent: TComponent; const AReportName: string; var ACopies: Integer;  var ACollated: Boolean; var AStartPage: Integer; var AStopPage: Integer ): Boolean; override;
    procedure CheckShowEPlant; override;
    procedure AssignParams; override;

  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
    procedure DoAfterCRWPrint( Sender: TObject;  AReportName: string; ASelectionList, AExternalDocsList: TStringList; AFileName: string ); override;
  end;

procedure DoPrintPS( const AFrom, ATo: string );
procedure DoPrintPS_Silent( const AFrom, ATo: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.PrintDialogsShare,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  uniListBox,
  uniGUIApplication;

procedure DoPrintPS( const AFrom, ATo: string );
begin
  TFrmPrintDocsPS.DoShow(AFrom, ATo );
end;

procedure DoPrintPS_Silent( const AFrom, ATo: string );
begin
  with TFrmPrintDocsPS.Create(uniGUIApplication.UniApplication) do
  begin
    ToTxt := ATo;
    From := AFrom;
    btnOK.Click;
  end;
end;

procedure TFrmPrintDocsPS.AssignCriteria( SelectionList: TStringList );
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{SHIPMENTS.ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintDocsPS.GetReportName( const AMfgType: string ): string;
begin
  // Result:= SelectValueFmtAsString('select %s from %s', ['PACKSLIP_REPORT', 'IQSys' ]);
  Result:= GetReportNameEx( 'PACKSLIP_REPORT', [ 'ship_to', QryMain.FieldByName('ship_to_id').asFloat,
                                                 'arcusto', QryMain.FieldByName('arcusto_id').asFloat ]);
  if Empty( Result ) then
     raise Exception.Create('No default report assigned in System Parameters. Please assign default report');
end;

function TFrmPrintDocsPS.GetBeforeReport( const AMfgType: string ): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', [ 'BEFORE_PACKSLIP_REPORT', 'IQSys' ]);
end;

procedure TFrmPrintDocsPS.BtnPropClick(Sender: TObject);
begin
  DoReportProperties('PACKSLIP_REPORT');
end;

function TFrmPrintDocsPS.GetReportSubject: string;
begin
  with QryMain do
    Result:= Format('PS# %s', [ FieldByName('packslipno').asString ]);
end;

function TFrmPrintDocsPS.GetTableNameForUpdatePrintCount: string;
begin
  Result:= 'shipments';
end;

procedure TFrmPrintDocsPS.popmEmailPopup(Sender: TObject);
begin
  ThisArcusto_ID:= SelectValueFmtAsFloat('select arcusto_id from shipments where rtrim(packslipno) = ''%s'' ', [ wwcombFrom.Text ]);
  inherited;
end;

procedure TFrmPrintDocsPS.DoPSPickList(Sender: TObject);
var
  AWWComb: TUniDBLookupComboBox;
begin
  inherited; {nothing}

  if Sender = sbtnPickPS1 then
     AWWComb:= wwcombFrom
  else if Sender = sbtnPickPS2 then
     AWWComb:= wwcombTo
  else
     ABORT;

  with PkPackSlip do
    if Execute then
       AWWComb.ListField:= GetValue('packslipno');
end;

procedure TFrmPrintDocsPS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  IQRegFormWrite(self, [chkIncludeAttachedRecords, chkSilentPrintAutoEmail ]);
end;

procedure TFrmPrintDocsPS.FormCreate(Sender: TObject);
var
  AType:Integer;
begin
  inherited;

  AType := 0;

  IQRegFormRead(self, [ chkIncludeAttachedRecords ]);

  if IQRegIntegerScalarRead( self, 'PS_AUTO_EMAIL_ONLY', AType ) then
  begin
    FSendAutoEmailOnly := AType = 1;
    cbAutoEmail.checked := AType = 1;
    if AType = 1 then
      IQRegIntegerScalarWrite( self, 'PS_AUTO_PRINT_ONLY', 0);
  end
  else
  begin
    FSendAutoEmailOnly := false;
    cbAutoEmail.checked := false;
    IQRegIntegerScalarWrite( self, 'PS_AUTO_EMAIL_ONLY', 0);
  end;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'PS_AUTO_PRINT_ONLY', AType ) then
  begin
    FPrintOnlyNoEmail := AType = 1;
    cbPrintOnly.checked := AType = 1;
  end
  else
  begin
    FPrintOnlyNoEmail := false;
    cbPrintOnly.checked := false;
    IQRegIntegerScalarWrite( self, 'PS_AUTO_PRINT_ONLY', 0);
  end;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'PS_INCLUDE_ARCHIVED', AType ) then
  begin
    chkIncludeAttachedRecords.checked := AType = 1;
  end
  else
  begin
    chkIncludeAttachedRecords.checked := true;
    IQRegIntegerScalarWrite( self, 'PS_INCLUDE_ARCHIVED', 1);
  end;

  IQRegFormRead(self, [ chkSilentPrintAutoEmail ]);
  FSilentPrintAutoEmail:= chkSilentPrintAutoEmail.Checked;
  chkSilentPrintAutoEmail.Enabled:= FSendAutoEmailOnly;

  FPrintFileNameFormatElementsUsed:= Format('%s;%s;%s;%s',
                                            [ GetFileFormatElementName('type'),
                                              GetFileFormatElementName('number'),
                                              GetFileFormatElementName('date'),
                                              GetFileFormatElementName('company')] );
end;

// allow iqrf/wms to use the same printer setting no matter the name of the report.
// i.e. the customer and the customer ship to can both have their own packing slip reports specified
function TFrmPrintDocsPS.AssignPrinterSettingsInternal( AComponent: TComponent; const AReportName: string; var ACopies: Integer;  var ACollated: Boolean; var AStartPage: Integer; var AStopPage: Integer ): Boolean;
begin
  if IsConsole then
    Result:= inherited AssignPrinterSettingsInternal( AComponent, 'PACKSLIP.RPT', ACopies, ACollated, AStartPage, AStopPage )
  else
    Result:= inherited AssignPrinterSettingsInternal( AComponent, AReportName,    ACopies, ACollated, AStartPage, AStopPage );
end;

procedure TFrmPrintDocsPS.DoAfterCRWPrint( Sender: TObject;  AReportName: string; ASelectionList, AExternalDocsList: TStringList; AFileName: string );
var
  AArcusto_ID: Real;
  AShip_To_ID: Real;
  ABill_To_ID: Real;
  APOs       : string;
  AList      : TStringList;
  ABody      : string;
  I          : Integer;
  ACustNo    : string;
  ASubject   : string;
begin
  APOs:= '';
  inherited;  {n}

  {AUTO_EFORM}
  AArcusto_ID:= SelectValueByID('arcusto_id', 'shipments', QryMain.FieldByName('id').asFloat);
  AShip_To_ID:= SelectValueByID('ship_to_id', 'shipments', QryMain.FieldByName('id').asFloat);
  ABill_To_ID:= SelectValueByID('bill_to_id', 'shipments', QryMain.FieldByName('id').asFloat);
  ACustNo    := SelectValueByID('custno', 'arcusto', AArcusto_ID );

  // Get all the POs
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, Format('select distinct pono from c_ship_hist where shipments_id = %.0f and rtrim(pono) is not null', [  QryMain.FieldByName('id').asFloat ]));
    for I:= 0 to AList.Count - 1 do
    begin
       if I > 0 then
          APOs:= APOs + ', ';
       APOs:= APOs + AList[ I ]
    end;
  finally
    AList.Free;
  end;

  // construct body
  if APOs > '' then
     ABody:= Format('Packing Slip %s for your PO# %s', [ QryMain.FieldByName('packslipno').asString, APOs ])
  else
     ABody:= Format('Packing Slip %s', [ QryMain.FieldByName('packslipno').asString ]);

  // subject
  if APOs > '' then
     ASubject:= Format('Packing Slip# %s %s, PO# %s', [ QryMain.FieldByName('packslipno').asString, ACustNo, APOs ])
  else
     ASubject:= Format('Packing Slip# %s %s', [ QryMain.FieldByName('packslipno').asString, ACustNo ]);

  TAutoEForm.Create( 'PS',
                     AArcusto_ID,
                     AShip_To_ID,
                     ABill_To_ID,
                     AReportName,
                     ASelectionList,
                     ASubject,      // Format('Packing Slip# %s %s', [ QryMain.FieldByName('packslipno').asString, ACustNo ]),
                     ABody,
                     'SHIPMENTS',
                      QryMain.FieldByName('id').asFloat,
                      AExternalDocsList,
                      AFileName ).Execute;   {Prn_Share.pas}
end;

procedure TFrmPrintDocsPS.cbAutoEmailClick(Sender: TObject);
begin
  FSendAutoEmailOnly := cbAutoEmail.checked;
  if FSendAutoEmailOnly then
     begin
       IQRegIntegerScalarWrite( self, 'PS_AUTO_EMAIL_ONLY', 1);
       cbPrintOnly.checked := false;
       cbPrintOnlyClick(nil);
     end
  else
     begin
       IQRegIntegerScalarWrite( self, 'PS_AUTO_EMAIL_ONLY', 0);

       chkSilentPrintAutoEmail.Checked:= False;
       chkSilentPrintAutoEmailClick(nil);
     end;

  chkSilentPrintAutoEmail.Enabled:= FSendAutoEmailOnly;
end;

procedure TFrmPrintDocsPS.cbPrintOnlyClick(Sender: TObject);
begin
  FPrintOnlyNoEmail := cbPrintOnly.checked;
  if FPrintOnlyNoEmail then
  begin
    IQRegIntegerScalarWrite( self, 'PS_AUTO_PRINT_ONLY', 1);
    cbAutoEmail.checked := false;
    cbAutoEmailClick(nil);
  end
  else
    IQRegIntegerScalarWrite( self, 'PS_AUTO_PRINT_ONLY', 0);
end;

procedure TFrmPrintDocsPS.CheckShowEPlant;
begin
  AssignEPlantDialogVisible( lblEplant, wwDBComboDlgEPlant );
end;



procedure TFrmPrintDocsPS.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
begin
  inherited;
  if SoftEPlant1.ChangeEPlantView then
     CheckShowEPlant;
end;

procedure TFrmPrintDocsPS.chkIncludeAttachedRecordsClick(Sender: TObject);
begin
  if chkIncludeAttachedRecords.checked then
    IQRegIntegerScalarWrite( self, 'PS_INCLUDE_ARCHIVED', 1)
  else
    IQRegIntegerScalarWrite( self, 'PS_INCLUDE_ARCHIVED', 0);
end;

procedure TFrmPrintDocsPS.chkSilentPrintAutoEmailClick(Sender: TObject);
begin
  IQRegFormWrite(self, [ chkSilentPrintAutoEmail ]);
  FSilentPrintAutoEmail:= chkSilentPrintAutoEmail.Checked;
end;

procedure TFrmPrintDocsPS.AssignParams;
begin
  FDefaultPrinterIndex:= IQMS.Common.Miscellaneous.FPrinterIndexOnStartUp;
  QryMain.Close;
  AssignQueryParamValue(QryMain, 'param1', wwcombFrom.ListField);
  AssignQueryParamValue(QryMain, 'param2', wwcombTo.ListField);
  AssignQueryParamValue(QryMain, 'ADummy', Integer(chkIncludeAttachedRecords.Checked));
  QryMain.Open;
  ReOpen(QryDocs);
  ReOpen(QryDocsExt);
end;



end.
