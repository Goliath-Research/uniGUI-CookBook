unit oe_estimate_bol_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.About,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TCalculateBOL = procedure( Sender: TObject ) of object;

  TFrmEstimateBOLBase = class(TUniForm)
    pnlHeader: TUniPanel;
    Splitter1: TUniSplitter;
    pnlClient01: TUniPanel;
    Panel1: TUniPanel;
    sbtnCalculateBOL: TUniSpeedButton;
    popmCalculateDropDownAll: TUniPopupMenu;
    CalculateByUserDefinedWeightAndVolumeForAllItems1: TUniMenuItem;
    CalculateByDefaultSystemValuesForAllItems1: TUniMenuItem;
    popmCalculateDropDownSelected: TUniPopupMenu;
    CalculateByUserDefinedWeightAndVolumeSelectedItem1: TUniMenuItem;
    CalculateByDefaultSystemValuesForSelectedItem1: TUniMenuItem;
    pnlHdrLeft01: TUniPanel;
    Splitter2: TUniSplitter;
    NavBOL: TUniDBNavigator;
    pnlHdrClient01: TUniPanel;
    wwDBGridItem: TIQUniGridControl;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    wwDataInspector1: TwwDataInspector;
    NavItem: TUniDBNavigator;
    sbtnCalculateBOL_All: TUniSpeedButton;
    Bevel5: TUniPanel;
    sbtnRequestEstimate: TUniSpeedButton;
    SrcHeader: TDataSource;
    SrcItem: TDataSource;
    QryHeader: TFDQuery;
    QryItem: TFDQuery;
    SrcEstimate_Bol: TDataSource;
    QryItemSource: TStringField;
    QryItemSource_ID: TFloatField;
    QryHeaderID: TBCDField;
    QryItemID: TBCDField;
    QryNMFC: TFDQuery;
    QryNMFCID: TBCDField;
    QryNMFCCODE: TStringField;
    QryNMFCDESCRIP: TStringField;
    wwDBGridBol: TIQUniGridControl;
    QryEstimate_Bol: TFDQuery;
    QryEstimate_BolVOLUME: TFMTBCDField;
    QryEstimate_BolCLASS: TBCDField;
    QryEstimate_BolBUMPED: TStringField;
    QryEstimate_BolNMFC_CODE: TStringField;
    QryEstimate_BolCOMMENT1: TStringField;
    QryEstimate_BolLBS_CU_FT: TFMTBCDField;
    QryEstimate_BolLbs_Cu_Ft_Std: TFloatField;
    QryEstimate_BolWEIGHT: TFMTBCDField;
    QryEstimate_BolTOTAL_BOXES: TFMTBCDField;
    QryEstimate_BolBOX_QTY: TFMTBCDField;
    QryEstimate_BolID: TBCDField;
    QryEstimate_BolSOURCE: TStringField;
    QryEstimate_BolSOURCE_ID: TBCDField;
    QryEstimate_BolCHARGE: TFMTBCDField;
    UpdateSQLEstimateBOL: TFDUpdateSQL;
    wwDBLookupComboNMFC: TUniDBLookupComboBox;
    wwDBComboDlgWeight: TUniEdit;
    PopupMenuBol: TUniPopupMenu;
    CalculateBOLWeight1: TUniMenuItem;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    miTroubleshooting1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryItemCalcFields(DataSet: TDataSet);
    procedure QryEstimate_BolCalcFields(DataSet: TDataSet);
    procedure QryEstimate_BolBeforePost(DataSet: TDataSet);
    procedure QryEstimate_BolNewRecord(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn); }
    procedure wwDBComboDlgWeightCustomDlg(Sender: TObject);
    procedure sbtnCalculateBOLClick(Sender: TObject);
    procedure sbtnCalculateBOL_AllClick(Sender: TObject);
    procedure CalculateByUserDefinedWeightAndVolumeSelectedItem1Click(
      Sender: TObject);
    procedure CalculateByDefaultSystemValuesForSelectedItem1Click(
      Sender: TObject);
    procedure CalculateByUserDefinedWeightAndVolumeForAllItems1Click(
      Sender: TObject);
    procedure CalculateByDefaultSystemValuesForAllItems1Click(
      Sender: TObject);
    procedure wwDBGridBolCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure sbtnRequestEstimateClick(Sender: TObject);
    procedure miTroubleshooting1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CheckReportBOLRecordsUnAvailabulityToUser;
    procedure SetHeader_ID(const Value: Real);
  protected
    FHeader_ID: Real;
    FFreight_ID, FNewFreight_ID: Real;
    FWebSrvcURL,
    FSource: string;
    FIsBOL_Calc_Individual: Boolean;
    FCalcQuoteNo: string;
    FCalcQuoteTotal: Real;
    FShop: Boolean;
    procedure PopulateVars; virtual;
    procedure DoCalculateBOL_User(Sender: TObject);
    procedure DoCalculateBOL_System(Sender: TObject);
    procedure DoCalculateBOL_AllItems( Sender: TObject; ACalculateBOL: TCalculateBOL );
  public
    { Public declarations }
    property Header_ID: Real write SetHeader_ID;
    class procedure DoShowModal(AHeader_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.Applications,
  IQMS.Common.COMExe,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  oe_estimate_bol_weight,
  oe_rscstr,
  IQMS.Common.PanelMsg,
  shipman_const;

{ TFrmEstimateBOLBase }

class procedure TFrmEstimateBOLBase.DoShowModal(AHeader_ID: Real);
var
  LFrmEstimateBOLBase : TFrmEstimateBOLBase;
begin
  LFrmEstimateBOLBase := TFrmEstimateBOLBase.Create(uniGUIApplication.UniApplication);
  LFrmEstimateBOLBase.Header_ID := AHeader_ID;
  LFrmEstimateBOLBase.FIsBOL_Calc_Individual:= SelectValueAsString('select bol_calc_individual from params') = 'Y';
  LFrmEstimateBOLBase.ShowModal;
end;

procedure TFrmEstimateBOLBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlHdrLeft01, pnlHeader, wwDBGridItem, wwDBGridBOL, miTroubleshooting1 ]);
end;

procedure TFrmEstimateBOLBase.PopulateVars;
var
  A:Variant;
begin

  A:= SelectValueArrayFmt( 'select f.id, f.web_srvc_url from orders o, freight f where o.freight_id = f.id and o.id = %.0f',
                      [ FHeader_ID ] );

  FWebSrvcURL:= '';
  FFreight_ID:= 0;
  if VarArrayDimCount(A) > 0 then
  begin
    FFreight_ID:= A[ 0 ];
    FWebSrvcURL:= A[ 1 ];
  end;
end;

procedure TFrmEstimateBOLBase.QryItemCalcFields(DataSet: TDataSet);
begin
  QryItemSource.asString:= FSource;                              // Example: ORD_DETAIL
  QryItemSource_ID.asFloat:= QryItem.FieldByName('ID').asFloat;  // ORD_DETAIL.ID
end;

procedure TFrmEstimateBOLBase.QryEstimate_BolCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  try
    // if FIsBOL_Calc_Individual then
    //    FieldByName('Lbs_Cu_Ft_Std').asFloat:= (FieldByName('WEIGHT').asFloat / FieldByName('TOTAL_BOXES').asFloat) / FieldByName('VOLUME').asFloat
    // else
    //    FieldByName('Lbs_Cu_Ft_Std').asFloat:= FieldByName('WEIGHT').asFloat / FieldByName('VOLUME').asFloat;
    FieldByName('Lbs_Cu_Ft_Std').asFloat:= FieldByName('WEIGHT').asFloat / FieldByName('TOTAL_BOXES').asFloat / FieldByName('VOLUME').asFloat;
  except
    FieldByName('Lbs_Cu_Ft_Std').Clear;
  end;
end;

procedure TFrmEstimateBOLBase.QryEstimate_BolBeforePost(DataSet: TDataSet);
begin
  if QryEstimate_Bol.FieldByName('id').asFloat = 0 then
     QryEstimate_Bol.FieldByName('id').asFloat:= GetNextID('estimate_bol');
end;

procedure TFrmEstimateBOLBase.QryEstimate_BolNewRecord(DataSet: TDataSet);
begin
  QryEstimate_BolSOURCE.asString  := QryItemSource.asString;
  QryEstimate_BolSOURCE_ID.asFloat:= QryItemSource_ID.asFloat;
end;

procedure TFrmEstimateBOLBase.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

{ TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
procedure TFrmEstimateBOLBase.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end; }

procedure TFrmEstimateBOLBase.wwDBComboDlgWeightCustomDlg(Sender: TObject);
begin
  QryEstimate_Bol.CheckBrowseMode;

  // 03/08/2010 Don't allow changing until record exists (Byron).
  if (QryEstimate_Bol.BOF and QryEstimate_Bol.EOF) then
     System.SysUtils.Abort;

  if TFrmEstimateBOLWeight.DoShowModal( QryEstimate_BolID.asFloat ) then // oe_estimate_bol_weight.pas
  begin
    ExecuteCommandFmt( 'begin bol_calc.update_bol_weight( %f ); end;', [ QryEstimate_BolID.asFloat ]);
    RefreshDataSetByID( QryEstimate_Bol );

    DoCalculateBOL_User(Sender);
  end;
end;

procedure TFrmEstimateBOLBase.sbtnCalculateBOLClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : There is no overloaded version of 'PopupMenuFor' that can be called with these arguments
  IQMS.Common.Controls.PopupMenuFor(sbtnCalculateBol, popmCalculateDropDownSelected);  }
end;

procedure TFrmEstimateBOLBase.sbtnCalculateBOL_AllClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : There is no overloaded version of 'PopupMenuFor' that can be called with these arguments
  IQMS.Common.Controls.PopupMenuFor(sbtnCalculateBol_All, popmCalculateDropDownAll); }
end;

procedure TFrmEstimateBOLBase.CalculateByUserDefinedWeightAndVolumeSelectedItem1Click(Sender: TObject);
begin
  // 'Would you like shipping rate and class to be calculated based on user assigned values?'
  if not IQConfirmYN(oe_rscstr.cTXT0000122) then
     EXIT;

  DoCalculateBOL_User(Sender);
  CheckReportBOLRecordsUnAvailabulityToUser;
end;

procedure TFrmEstimateBOLBase.CalculateByDefaultSystemValuesForSelectedItem1Click(Sender: TObject);
begin
  // 'Would you like shipping rate and class to be calculated for you?'
  if not IQConfirmYN(oe_rscstr.cTXT0000123) then
     EXIT;

  DoCalculateBOL_System(Sender);
  CheckReportBOLRecordsUnAvailabulityToUser;
end;

procedure TFrmEstimateBOLBase.CheckReportBOLRecordsUnAvailabulityToUser;
begin
  IQInformation(//'Finished calculating shipping rate and class.'
                oe_rscstr.cTXT0000124
                +
                sIIf( not (QryEstimate_Bol.Eof and QryEstimate_Bol.Bof), '',
                      // 'BOL information is unavailable.'
                      #13#13 + oe_rscstr.cTXT0000125));
end;

procedure TFrmEstimateBOLBase.DoCalculateBOL_User(Sender: TObject);
begin
  ExecuteCommandFmt('begin BOL_Calc.Calc_User_Assigned_BOL( %f ); end;', [ QryEstimate_BolID.asFloat ]);
  Reopen(QryEstimate_Bol);
end;

procedure TFrmEstimateBOLBase.DoCalculateBOL_System(Sender: TObject);
begin
  ExecuteCommandFmt('begin BOL_Calc.Calc_System_Assigned_BOL( ''%s'', %f ); end;', [ QryItemSource.asString, QryItemSource_ID.asFloat ]);
  Reopen(QryEstimate_Bol);
end;

procedure TFrmEstimateBOLBase.CalculateByUserDefinedWeightAndVolumeForAllItems1Click(Sender: TObject);
begin
  // 'This option calculates shipping rate and class for each item based on user assigned values.  Please confirm to continue.'
  if IQConfirmYN(oe_rscstr.cTXT0000126) then
     DoCalculateBOL_AllItems( Sender, DoCalculateBOL_User );
end;

procedure TFrmEstimateBOLBase.CalculateByDefaultSystemValuesForAllItems1Click(Sender: TObject);
begin
  // 'This option calculates default shipping rate and class for each item - please confirm to continue.'
  if IQConfirmYN(oe_rscstr.cTXT0000127) then
     DoCalculateBOL_AllItems( Sender, DoCalculateBOL_System );
end;


procedure TFrmEstimateBOLBase.DoCalculateBOL_AllItems( Sender: TObject; ACalculateBOL: TCalculateBOL );
var
   AInfoAvail: Boolean;
begin
  Reopen(QryItem);
  AInfoAvail:= TRUE;
  while not QryItem.Eof do
  begin
    ACalculateBOL( Sender );
    AInfoAvail:= AInfoAvail and not (QryEstimate_Bol.Eof and QryEstimate_Bol.Bof);

    QryItem.Next;
  end;

  Reopen(QryEstimate_Bol);

  IQInformation(//'Finished calculating shipping rates and System.Classes for all items.'
                oe_rscstr.cTXT0000128
                +
                sIIf( AInfoAvail, '',
                // 'One or more items had no BOL information available.'
                #13#13 + oe_rscstr.cTXT0000129));
end;


procedure TFrmEstimateBOLBase.wwDBGridBolCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Field.ReadOnly then
     if (not Highlight) then ABrush.Color := clWindow;
end;

procedure TFrmEstimateBOLBase.sbtnRequestEstimateClick(Sender: TObject);
const
  ASSEMBLY_NAME = 'IQMS.IQShipman';
  NAMESPACE     = 'IQMS.IQShipman';
  _CLASS        = 'BolEstimateInterface';
var
  ADNetObject: Variant;
  CW         : Word;
  AShopRequestID, AWeight: Real;
  ASource: String;
  HMsg: TPanelMesg;
begin

  // .net BolEstimateWebServices
  DisableFPUExceptions(CW);
  try
     CreateDNetCom( ADNetObject, ASSEMBLY_NAME,
                    Format('%s.%s', [ NAMESPACE, _CLASS ]));
     try
       HMsg:= hPleaseWait('Shopping Rates...');
       ADNetObject.Initialize(SecurityManager.UserName, SecurityManager.Password, SecurityManager.ServerName, SecurityManager.EPlant_ID);
       AShopRequestID := ADNetObject.ExecuteShop(FSource, QryHeaderID.AsFloat);
     finally
       FreeDNetObject( ADNetObject );
       if Assigned(HMsg) then
         HMsg.Free;
     end;
  finally
    RestoreFPU(CW);
  end;
  // end .net BolEstimateWebServices

  Application.ProcessMessages; // allow button to repaint
  try
     Com_Exec( 'IQSHIPMAN', [shipman_const.SHIP_SHOP, AShopRequestID, 'SHIPMAN_SHOP_REQUEST', FFreight_ID ]); // IQMS.Common.COMExe.pas
     FNewFreight_ID := SelectValueFmtAsFloat('select freight_id from shipman_shop_rate where shipman_shop_request_id = %.0f and nvl(selected, ''N'') = ''Y''', [AShopRequestID]);
     if (FNewFreight_ID > 0) then
      begin
        FCalcQuoteTotal := SelectValueFmtAsFloat('select total_cost from shipman_shop_rate where shipman_shop_request_id = %.0f and nvl(selected, ''N'') = ''Y''', [AShopRequestID]);
        if (FWebSrvcURL = '') or (FNewFreight_ID <> FFreight_ID) then
          FCalcQuoteNo := FloatToStr(AShopRequestID)
        else
          if (FWebSrvcURL <> '') then
           IQInformation( Format(oe_rscstr.cTXT0000130, [ FCalcQuoteNo ] ) );
      end
     else
       FCalcQuoteNo := '';
  except on E:Exception do // in case Cancel was clicked
     if not E.ClassNameIs( 'EAbort' ) then raise;
  end;

end;

procedure TFrmEstimateBOLBase.SetHeader_ID(const Value: Real);
begin
  FHeader_ID := Value;
end;

procedure TFrmEstimateBOLBase.UniFormCreate(Sender: TObject);
begin
  PopulateVars;

  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self, pnlHdrLeft01, pnlHeader, wwDBGridItem, wwDBGridBOL, miTroubleshooting1 ]);
  FShop := SecurityManager.IsModuleLicensed(IQAppsNames[apShipMan]);
  with sbtnRequestEstimate do
  begin
    Enabled:= (FWebSrvcURL <> '') or FShop;
    // 'Get freight estimate from Web service'
    if Enabled then Hint := oe_rscstr.cTXT0000121;
  end;
end;

procedure TFrmEstimateBOLBase.miTroubleshooting1Click(Sender: TObject);
begin
  miTroubleshooting1.Checked:= not miTroubleshooting1.Checked;
  if miTroubleshooting1.Checked
  then IQInformation('Request and Response data will now be logged in the IQCheckPointList.txt file.')
  else IQInformation('Troubleshooting is now off.')

end;

procedure TFrmEstimateBOLBase.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmEstimateBOLBase.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmEstimateBOLBase.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.



