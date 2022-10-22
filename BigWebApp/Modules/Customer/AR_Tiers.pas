unit AR_Tiers;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Variants,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.Hpick,
  Datasnap.DBClient,
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
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, Vcl.ExtCtrls, IQUniGrid, uniGUIFrame;

const
  ASql = ' select a.id,                                ' +
    '        a.cust_type_id,                      ' +
    '        a.item_type_id,                      ' +
    '        a.discount,                          ' +
    '        a.based_on_std_price,                ' +
    '        NVL(a.aggregate, ''N'') as aggregate,  ' +
    '        r.id as arcusto_id,                  ' +
    '        r.custno as custno,                  ' +
    '        r.company as customer,               ' +
    '        t.id as arinvt_id,                   ' +
    '        t.class,                             ' +
    '        t.itemno,                            ' +
    '        t.rev,                               ' +
    '        t.descrip,                           ' +
    '        t.descrip2,                          ' +
    '        a.discount_price,                    ' +
    '        ct.descrip as CustType,              ' +
    '        it.descrip as ItemType,              ' +
    '        a.use_waterfall,                     ' +
    '        s.attn,                              ' +
    '       a.ship_to_id,                         ' +
    '       a.LESS_THAN_MIN_UPCHARGE,             ' +
    '       a.bogo                                ' +
    '   from AR_DISCOUNT_TIERS a,                 ' +
    '        cust_type c,                         ' +
    '        item_type i,                         ' +
    '        arcusto r,                           ' +
    '        arinvt t,                            ' +
    '        cust_type ct,                        ' +
    '        item_type it,                        ' +
    '        ship_to s                            ' +
    '  where a.cust_type_id = c.id(+)             ' +
    '    and a.item_type_id = i.id(+)             ' +
    '    and a.arinvt_id = t.id(+)                ' +
    '    and a.arcusto_id = r.id(+)               ' +
    '    and a.ship_to_id = s.id(+)               ' +
    '    and a.cust_type_id = ct.id(+)            ' +
    '    and a.item_type_id = it.id(+)            ';

type
  TFrmAR_Tiers = class(TUniForm)
    SrcAR_Discount_Tiers: TDataSource;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    N1: TUniMenuItem;
    CustomerTypes1: TUniMenuItem;
    ItemsTypes1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    wwQryCust_Type: TFDQuery;
    wwQryCust_TypeID: TBCDField;
    wwQryCust_TypeDESCRIP: TStringField;
    wwQryItem_Type: TFDQuery;
    FloatField1: TBCDField;
    StringField1: TStringField;
    QryAR_Discount_Tiers: TFDQuery;
    QryAR_Discount_TiersCUST_TYPE_ID: TBCDField;
    QryAR_Discount_TiersITEM_TYPE_ID: TBCDField;
    QryAR_Discount_TiersDISCOUNT: TBCDField;
    QryAR_Discount_TiersBASED_ON_STD_PRICE: TStringField;
    IQSearch1: TIQUniGridControl;
    UpdateSQL1: TFDUpdateSQL;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    wwDBComboBox1: TUniDBComboBox;
    QryAR_Discount_TiersAGGREGATE: TStringField;
    QryAR_Discount_TiersID: TBCDField;
    Splitter1: TUniSplitter;
    SrcAggregate: TDataSource;
    TblAggregate: TFDTable;
    TblAggregateID: TBCDField;
    TblAggregateAR_DISCOUNT_TIERS_ID: TBCDField;
    TblAggregateQUAN: TBCDField;
    TblAggregateDISCOUNT: TFMTBCDField;
    QryAR_Discount_TiersARCUSTO_ID: TBCDField;
    QryAR_Discount_TiersCUSTNO: TStringField;
    QryAR_Discount_TiersCUSTOMER: TStringField;
    QryAR_Discount_TiersARINVT_ID: TBCDField;
    QryAR_Discount_TiersCLASS: TStringField;
    QryAR_Discount_TiersITEMNO: TStringField;
    QryAR_Discount_TiersREV: TStringField;
    QryAR_Discount_TiersDESCRIP: TStringField;
    wwDBCustomer: TUniEdit;
    wwDBItem: TUniEdit;
    PkCustomer: TIQWebHPick;
    PkCustomerARCUSTO_ID: TBCDField;
    PkCustomerCUSTNO: TStringField;
    PkCustomerCOMPANY: TStringField;
    PkCustomerADDR1: TStringField;
    PkCustomerADDR2: TStringField;
    PkCustomerCITY: TStringField;
    PkCustomerSTATE: TStringField;
    PkCustomerZIP: TStringField;
    PkCustomerCUST_GROUP: TStringField;
    PkCustomerPK_HIDE: TStringField;
    PopupMenu1: TUniPopupMenu;
    ClearCustomer1: TUniMenuItem;
    ClearItem1: TUniMenuItem;
    PkArInvt: TIQWebHPick;
    PkArInvtID: TBCDField;
    PkArInvtITEMNO: TStringField;
    PkArInvtDESCRIP: TStringField;
    PkArInvtREV: TStringField;
    PkArInvtCLASS: TStringField;
    PkArInvtDESCRIP2: TStringField;
    PkArInvtCUSTNO: TStringField;
    PkArInvtCOMPANY: TStringField;
    PkArInvtECODE: TStringField;
    PkArInvtUSER1: TStringField;
    PkArInvtUSER2: TStringField;
    PkArInvtEPLANT_ID: TBCDField;
    PkArInvtPK_HIDE: TStringField;
    ClearItemType1: TUniMenuItem;
    ClearCustomerType1: TUniMenuItem;
    QryAR_Discount_TiersDISCOUNT_PRICE: TFMTBCDField;
    TblAggregateDISCOUNT_PRICE: TFMTBCDField;
    QryAR_Discount_TiersCustTypeExists: TBooleanField;
    QryAR_Discount_TiersItemTypeExists: TBooleanField;
    QryAR_Discount_TiersArinvtIdExists: TBooleanField;
    TblAggregatePRICE_DATE: TDateTimeField;
    TblAggregateEFFECT_DATE: TDateTimeField;
    TblAggregateDEACTIVE_DATE: TDateTimeField;
    QryAR_Discount_TiersCUSTTYPE: TStringField;
    QryAR_Discount_TiersITEMTYPE: TStringField;
    QryAR_Discount_TiersDESCRIP2: TStringField;
    QryCurr: TFDQuery;
    QryCurrID: TBCDField;
    QryCurrCURR_CODE: TStringField;
    QryCurrDESCRIP: TStringField;
    QryCurrNATIVE_CURR: TStringField;
    TblAggregateCURRENCY_ID: TBCDField;
    Options1: TUniMenuItem;
    AssignNativeCurrencytoAllUnassignedPriceBreaks1: TUniMenuItem;
    Waterfalls1: TUniMenuItem;
    QryAR_Discount_TiersArcustoIdExists: TBooleanField;
    TblAggregateQUAN_LEVEL: TBCDField;
    wwQryWaterfallLevel: TFDQuery;
    wwQryWaterfallLevelQUAN_LEVEL: TBCDField;
    ClearWaterfall1: TUniMenuItem;
    TblAggregateLevelExists: TBooleanField;
    PopupMenuAggregate: TUniPopupMenu;
    AddAllLevels1: TUniMenuItem;
    QryAR_Discount_TiersUSE_WATERFALL: TStringField;
    QryAR_Discount_TiersATTN: TStringField;
    wwDBShipTo: TUniEdit;
    PkShipTo: TIQWebHPick;
    PkShipToID: TBCDField;
    PkShipToPRIME_CONTACT: TStringField;
    PkShipToATTN: TStringField;
    PkShipToADDR1: TStringField;
    PkShipToADDR2: TStringField;
    PkShipToADDR3: TStringField;
    PkShipToCITY: TStringField;
    PkShipToSTATE: TStringField;
    PkShipToCOUNTRY: TStringField;
    PkShipToZIP: TStringField;
    PkShipToPHONE_NUMBER: TStringField;
    PkShipToEXT: TStringField;
    PkShipToFAX: TStringField;
    PkShipToECODE: TStringField;
    PkShipToEPLANT_ID: TBCDField;
    PkShipToSHIP_VIA: TStringField;
    PkShipToDIVISION_NAME: TStringField;
    PkShipToPK_HIDE: TStringField;
    QryAR_Discount_TiersSHIP_TO_ID: TBCDField;
    ClearShipTo1: TUniMenuItem;
    StoredProc1: TFDStoredProc;
    QryAR_Discount_TiersLESS_THAN_MIN_UPCHARGE: TBCDField;
    TblAggregateWEBDIRECT_SHOW: TStringField;
    SrcBogo: TDataSource;
    QryBogo: TFDQuery;
    QryAR_Discount_TiersBOGO: TStringField;
    Panel2: TUniPanel;
    PC: TUniPageControl;
    TabTier: TUniTabSheet;
    TabBogo: TUniTabSheet;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    LblSellCurr: TUniLabel;
    dbSellCurr: TUniDBLookupComboBox;
    GridAggregate: TIQUniGridControl;
    cmbWaterfallLevel: TUniDBLookupComboBox;
    QryBogoID: TBCDField;
    QryBogoAR_DISCOUNT_TIERS_ID: TBCDField;
    QryBogoPURCHASE_QTY: TBCDField;
    QryBogoDISCOUNT_QTY: TBCDField;
    QryBogoMAX_QTY: TBCDField;
    QryBogoDISCOUNT_PERCENTAGE: TBCDField;
    QryBogoINACTIVE_DATE: TDateTimeField;
    QryBogoEFFECTIVE_DATE: TDateTimeField;
    FDUpdateSQL1: TFDUpdateSQL;
    IQSearch2: TIQUniGridControl;
    Panel5: TUniPanel;
    Shape9: TUniPanel;
    dsWaterfallLevel: TDataSource;
    dsCust_Type: TDataSource;
    dsItem_Type: TDataSource;
    dsCurr: TDataSource;
    SR: TIQWebSecurityRegister;

    procedure CustomerTypes1Click(Sender: TObject);
    procedure ItemsTypes1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryAR_Discount_TiersAfterDelete(DataSet: TDataSet);
    procedure QryAR_Discount_TiersBeforePost(DataSet: TDataSet);
    // procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure TblAggregateBeforeEdit(DataSet: TDataSet);
    procedure TblAggregateBeforePost(DataSet: TDataSet);
    procedure wwDBCustomerCustomDlg(Sender: TObject);
    procedure ClearCustomer1Click(Sender: TObject);
    procedure ClearItem1Click(Sender: TObject);
    procedure wwDBItemCustomDlg(Sender: TObject);
    procedure SrcAR_Discount_TiersDataChange(Sender: TObject; Field: TField);
    // procedure IQSearch1CalcCellColors(Sender: TObject; Field: TField;
    // State: TGridDrawState; Highlight: Boolean; AFont: TFont;
    // ABrush: TBrush);
    // procedure ClearCustomerType1Click(Sender: TObject);
    procedure ClearItemType1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure wwDBLookupCombo1CloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure QryAR_Discount_TiersCalcFields(DataSet: TDataSet);
    procedure QryAR_Discount_TiersAfterInsert(DataSet: TDataSet);
    procedure wwDBLookupCombo1DropDown(Sender: TObject);
    procedure wwDBLookupCombo2CloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dbSellCurrCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure TblAggregateFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure AssignNativeCurrencytoAllUnassignedPriceBreaks1Click
      (Sender: TObject);
    procedure Waterfalls1Click(Sender: TObject);
    procedure cmbWaterfallLevelCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cmbWaterfallLevelDropDown(Sender: TObject);
    procedure QryAR_Discount_TiersAfterScroll(DataSet: TDataSet);
    // procedure GridAggregateCalcCellColors(Sender: TObject; Field: TField;
    // State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure TblAggregateCalcFields(DataSet: TDataSet);
    procedure AddAllLevels1Click(Sender: TObject);
    procedure wwDBShipToCustomDlg(Sender: TObject);
    procedure PkShipToBeforeOpen(DataSet: TDataSet);
    procedure ClearShipTo1Click(Sender: TObject);
    procedure QryAR_Discount_TiersBeforeScroll(DataSet: TDataSet);
    procedure QryBogoBeforeOpen(DataSet: TDataSet);
    procedure QryBogoBeforePost(DataSet: TDataSet);
    procedure QryBogoBeforeEdit(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArcustoId, FArinvtId: Real;
    procedure Startup;
    procedure SetWaterfallFields;
    procedure CheckTabBogo;
    procedure setArcustoId(const Value: Real);
    procedure SetArinvtId(const Value: Real);
  public
    { Public declarations }
    property ArcustoId: Real write setArcustoId;
    property ArinvtId: Real write SetArinvtId;
  end;

procedure DoAR_Tiers;
procedure DoJumpFromCustomer(AId: Real);
procedure DoJumpFromInv(AId: Real);

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.JumpConstants;

{ TODO -ombaral -cwebconvert : Un comment when dependency resolved
  ,CustType
  ,ItemType
  Waterfall;
}
procedure DoAR_Tiers;
var
  LFrmAR_Tiers: TFrmAR_Tiers;
begin
  LFrmAR_Tiers := TFrmAR_Tiers.Create(uniGUIApplication.UniApplication);
  LFrmAR_Tiers.Show;
end;

procedure DoJumpFromCustomer(AId: Real);
var
  LFrmAR_Tiers: TFrmAR_Tiers;
begin
  LFrmAR_Tiers := TFrmAR_Tiers.Create(uniGUIApplication.UniApplication);
  LFrmAR_Tiers.ArinvtId := 0;
  LFrmAR_Tiers.ArcustoId := AId;
end;

procedure DoJumpFromInv(AId: Real);
var
  LFrmAR_Tiers: TFrmAR_Tiers;
begin
  LFrmAR_Tiers := TFrmAR_Tiers.Create(uniGUIApplication.UniApplication);
  LFrmAR_Tiers.ArcustoId := 0;
  LFrmAR_Tiers.ArinvtId := AId;
end;

{ TFrmAR_Tiers }

procedure TFrmAR_Tiers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, Panel2, GridAggregate]);
end;

procedure TFrmAR_Tiers.Startup;
var
  ACurrId: Real;
  AScalarString: String;
begin
  wwDBLookupCombo1.Visible := False;
  wwDBLookupCombo2.Visible := False;
  cmbWaterfallLevel.Visible := False;
  wwDBComboBox1.Visible := False;
  wwDBItem.Visible := False;
  wwDBCustomer.Visible := False;
  wwDBShipTo.Visible := False;
  IQSetTablesActive(TRUE, self);

  wwDBLookupCombo1.Parent := IQSearch1.DBGrid;
  wwDBLookupCombo2.Parent := IQSearch1.DBGrid;
  wwDBComboBox1.Parent := IQSearch1.DBGrid;
  wwDBItem.Parent := IQSearch1.DBGrid;
  wwDBCustomer.Parent := IQSearch1.DBGrid;
  wwDBShipTo.Parent := IQSearch1.DBGrid;

  cmbWaterfallLevel.Parent := GridAggregate;

  AssignNativeCurrencytoAllUnassignedPriceBreaks1.Enabled :=
    SelectValueAsString
    ('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'Y';
  dbSellCurr.Visible := AssignNativeCurrencytoAllUnassignedPriceBreaks1.Enabled;

  if dbSellCurr.Visible then
  begin
    ACurrId := GetNativeCurrencyId;

    if ACurrId <> 0 then
    begin
      if QryCurr.Locate('ID', ACurrId, []) then
      begin
        dbSellCurr.KeyValue := QryCurrDESCRIP.asString;
        dbSellCurr.Text := QryCurrDESCRIP.asString;
        TblAggregate.Refresh;
      end;
    end;
  end;
end;

{
  procedure TFrmAR_Tiers.GridAggregateCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
  begin
  if ((TblAggregateID.AsFloat > 0) and (QryAR_Discount_TiersUSE_WATERFALL.AsString = 'Y') and not TblAggregateLevelExists.AsBoolean) then
  begin
  ABrush.Color:= clYellow;
  AFont.Color := clBlack;
  end;
  end;
}
procedure TFrmAR_Tiers.CustomerTypes1Click(Sender: TObject);
begin
  // DoCustomerTiersType;  {CustType.pas}
  Reopen(wwQryCust_Type);
  if Owner is TUniForm then
    PostMessage(TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0);
end;

procedure TFrmAR_Tiers.ItemsTypes1Click(Sender: TObject);
begin
  // DoItemTiersType;      {ItemType.pas}
  Reopen(wwQryItem_Type);
  if Owner is TUniForm then
    PostMessage(TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0);
end;

procedure TFrmAR_Tiers.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAR_Tiers.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(1463936);
end;

procedure TFrmAR_Tiers.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAR_Tiers.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAR_Tiers.QryAR_Discount_TiersAfterDelete(DataSet: TDataSet);
begin
  CheckTabBogo;
  {
    try
    QryAR_Discount_Tiers.DataBase.ApplyUpdates( [ QryAR_Discount_Tiers ]);
    except on E:Exception do
    begin
    Application.ShowException(E);
    QryAR_Discount_Tiers.Close;
    QryAR_Discount_Tiers.Open;
    System.SysUtils.ABORT;
    end;
    end;
  }
end;

procedure TFrmAR_Tiers.QryAR_Discount_TiersBeforePost(DataSet: TDataSet);
begin
  if QryAR_Discount_TiersID.asFloat = 0 then
    QryAR_Discount_TiersID.asFloat := GetNextID('AR_DISCOUNT_TIERS');
  if (QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y') then
    QryAR_Discount_TiersBASED_ON_STD_PRICE.asString := 'Y';

  if QryAR_Discount_Tiers.FieldByName('BASED_ON_STD_PRICE').asString <> 'Y' then
    QryAR_Discount_Tiers.FieldByName('BASED_ON_STD_PRICE').Clear;

  // if (QryAR_Discount_TiersDISCOUNT.asFloat = 0) and (QryAR_Discount_TiersDISCOUNT_PRICE.asFloat = 0) then
  // raise exception.create('Either Tier Discount % or Discount Price must be filled in');
end;

{
  procedure TFrmAR_Tiers.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
  var
  AId:Real;
  begin
  if Button = nbRefresh then
  begin
  AId := QryAR_Discount_TiersID.asFloat;
  QryAR_Discount_Tiers.Close;
  QryAR_Discount_Tiers.Open;
  QryAR_Discount_Tiers.Locate('ID', AId, []);
  System.SysUtils.ABORT;
  end;
  end;
}
procedure TFrmAR_Tiers.TblAggregateBeforeEdit(DataSet: TDataSet);
begin
  // IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmAR_Tiers.TblAggregateBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  if SelectValueAsString
    ('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'Y' then
  begin
    if not((dbSellCurr.Text = '') or (QryCurrID.asFloat = 0)) then
      TblAggregateCURRENCY_ID.asFloat := QryCurrID.asFloat;
  end

  // if (TblAggregateDISCOUNT.asFloat = 0) and (TblAggregateDISCOUNT_PRICE.asFloat = 0) then
  // raise exception.create('Either Tier Discount % or Discount Price must be filled in');

end;

procedure TFrmAR_Tiers.TblAggregateCalcFields(DataSet: TDataSet);
begin
  TblAggregateLevelExists.AsBoolean :=
    IsFoundFmt
    ('select id from ar_discount_waterfall_levels where quan_level = %d',
    [TblAggregateQUAN_LEVEL.AsInteger]);
end;

procedure TFrmAR_Tiers.wwDBCustomerCustomDlg(Sender: TObject);
begin
  if QryAR_Discount_TiersCUST_TYPE_ID.asFloat = 0 then
    with PkCustomer do
      if Execute then
      begin
        if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then
          QryAR_Discount_Tiers.Edit;
        QryAR_Discount_TiersARCUSTO_ID.asFloat := GetValue('ARCUSTO_ID');
        QryAR_Discount_TiersCUSTNO.asString := GetValue('CUSTNO');
        QryAR_Discount_TiersCUSTOMER.asString := GetValue('COMPANY');
      end;
end;

procedure TFrmAR_Tiers.ClearCustomer1Click(Sender: TObject);
var
  AId: Real;
begin
  if QryAR_Discount_TiersARCUSTO_ID.asFloat <> 0 then
    try
      SrcAR_Discount_Tiers.OnDataChange := nil;
      // if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then QryAR_Discount_Tiers.Edit;
      QryAR_Discount_TiersARCUSTO_ID.ReadOnly := False;
      QryAR_Discount_TiersCUSTNO.ReadOnly := False;
      QryAR_Discount_TiersCUSTOMER.ReadOnly := False;

      AId := QryAR_Discount_TiersID.asFloat;
      ExecuteCommandFmt
        ('update AR_DISCOUNT_TIERS set ARCUSTO_ID = null where id = %f',
        [QryAR_Discount_TiersID.asFloat]);
      QryAR_Discount_Tiers.Close;
      QryAR_Discount_Tiers.Open;
      QryAR_Discount_Tiers.Locate('ID', AId, []);

      // QryAR_Discount_TiersARCUSTO_ID.Clear;
      // QryAR_Discount_TiersCUSTNO.Clear;
      // QryAR_Discount_TiersCUSTOMER.Clear;
    finally
      SrcAR_Discount_Tiers.OnDataChange := SrcAR_Discount_TiersDataChange;
      SrcAR_Discount_TiersDataChange(nil, nil);
    end;
end;

procedure TFrmAR_Tiers.ClearItem1Click(Sender: TObject);
var
  AId: Real;
begin
  if QryAR_Discount_TiersARINVT_ID.asFloat <> 0 then
    try
      SrcAR_Discount_Tiers.OnDataChange := nil;
      // if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then QryAR_Discount_Tiers.Edit;
      QryAR_Discount_TiersARINVT_ID.ReadOnly := False;
      QryAR_Discount_TiersITEMNO.ReadOnly := False;
      QryAR_Discount_TiersCLASS.ReadOnly := False;
      QryAR_Discount_TiersREV.ReadOnly := False;
      QryAR_Discount_TiersDESCRIP.ReadOnly := False;
      QryAR_Discount_TiersDESCRIP2.ReadOnly := False;

      AId := QryAR_Discount_TiersID.asFloat;
      ExecuteCommandFmt
        ('update AR_DISCOUNT_TIERS set ARINVT_ID = null where id = %f',
        [QryAR_Discount_TiersID.asFloat]);
      QryAR_Discount_Tiers.Close;
      QryAR_Discount_Tiers.Open;
      QryAR_Discount_Tiers.Locate('ID', AId, []);

      // QryAR_Discount_TiersARINVT_ID.Clear;
      // QryAR_Discount_TiersITEMNO.Clear;
      // QryAR_Discount_TiersCLASS.Clear;
      // QryAR_Discount_TiersREV.Clear;
      // QryAR_Discount_TiersDESCRIP.Clear;
    finally
      SrcAR_Discount_Tiers.OnDataChange := SrcAR_Discount_TiersDataChange;
      SrcAR_Discount_TiersDataChange(nil, nil);
    end;
end;

procedure TFrmAR_Tiers.wwDBItemCustomDlg(Sender: TObject);
begin
  if QryAR_Discount_TiersITEM_TYPE_ID.asFloat = 0 then
    with PkArInvt do
      if Execute then
      begin
        if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then
          QryAR_Discount_Tiers.Edit;
        QryAR_Discount_TiersARINVT_ID.asFloat := GetValue('ID');
        QryAR_Discount_TiersITEMNO.asString := GetValue('ITEMNO');
        QryAR_Discount_TiersCLASS.asString := GetValue('CLASS');
        QryAR_Discount_TiersREV.asString := GetValue('REV');
        QryAR_Discount_TiersDESCRIP.asString := GetValue('DESCRIP');
        QryAR_Discount_TiersDESCRIP2.asString := GetValue('DESCRIP2');
      end;
end;

procedure TFrmAR_Tiers.SrcAR_Discount_TiersDataChange(Sender: TObject;
  Field: TField);
begin
  // wwDBLookupCombo1.ReadOnly := (QryAR_Discount_TiersARCUSTO_ID.asFloat <> 0);
  wwDBLookupCombo1.Enabled := (QryAR_Discount_TiersARCUSTO_ID.asFloat = 0);
  QryAR_Discount_TiersARCUSTO_ID.ReadOnly :=
    (QryAR_Discount_TiersCUST_TYPE_ID.asFloat <> 0);
  QryAR_Discount_TiersCUST_TYPE_ID.ReadOnly :=
    (QryAR_Discount_TiersARCUSTO_ID.asFloat <> 0);

  QryAR_Discount_TiersARINVT_ID.ReadOnly :=
    (QryAR_Discount_TiersITEM_TYPE_ID.asFloat <> 0);
  QryAR_Discount_TiersITEM_TYPE_ID.ReadOnly :=
    (QryAR_Discount_TiersARINVT_ID.asFloat <> 0);

  // wwDBLookupCombo2.ReadOnly := (QryAR_Discount_TiersARINVT_ID.asFloat <> 0);
  wwDBLookupCombo2.Enabled := (QryAR_Discount_TiersARINVT_ID.asFloat = 0);
  wwDBCustomer.ReadOnly := (QryAR_Discount_TiersCUST_TYPE_ID.asFloat <> 0);
  wwDBShipTo.ReadOnly := (QryAR_Discount_TiersCUST_TYPE_ID.asFloat <> 0);
  wwDBItem.ReadOnly := (QryAR_Discount_TiersITEM_TYPE_ID.asFloat <> 0);

  QryAR_Discount_TiersITEMNO.ReadOnly := QryAR_Discount_TiersARINVT_ID.ReadOnly;
  QryAR_Discount_TiersCLASS.ReadOnly := QryAR_Discount_TiersARINVT_ID.ReadOnly;
  QryAR_Discount_TiersREV.ReadOnly := QryAR_Discount_TiersARINVT_ID.ReadOnly;
  QryAR_Discount_TiersDESCRIP.ReadOnly :=
    QryAR_Discount_TiersARINVT_ID.ReadOnly;
  QryAR_Discount_TiersDESCRIP2.ReadOnly :=
    QryAR_Discount_TiersARINVT_ID.ReadOnly;

  QryAR_Discount_TiersCUSTNO.ReadOnly :=
    QryAR_Discount_TiersARCUSTO_ID.ReadOnly;
  QryAR_Discount_TiersCUSTOMER.ReadOnly :=
    QryAR_Discount_TiersARCUSTO_ID.ReadOnly;

  QryAR_Discount_TiersCUSTTYPE.ReadOnly :=
    QryAR_Discount_TiersCUST_TYPE_ID.ReadOnly;
  QryAR_Discount_TiersITEMTYPE.ReadOnly :=
    QryAR_Discount_TiersITEM_TYPE_ID.ReadOnly;

  wwDBComboBox1.Enabled :=
    not(QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');
  QryAR_Discount_TiersAGGREGATE.ReadOnly :=
    (QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');
  SetWaterfallFields;
end;

{
  procedure TFrmAR_Tiers.IQSearch1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
  begin
  if QryAR_Discount_TiersCustTypeExists.asBoolean and
  ((Field = QryAR_Discount_TiersCUSTNO) or (Field = QryAR_Discount_TiersCUSTOMER)or (Field = QryAR_Discount_TiersATTN)) then
  ABrush.Color := clBtnFace;

  if QryAR_Discount_TiersArcustoIdExists.asBoolean and (Field = QryAR_Discount_TiersCustType) then
  ABrush.Color := clBtnFace;

  if QryAR_Discount_TiersItemTypeExists.asBoolean  and ( (Field = QryAR_Discount_TiersCLASS) or
  (Field = QryAR_Discount_TiersDESCRIP) or
  (Field = QryAR_Discount_TiersDESCRIP2) or
  (Field = QryAR_Discount_TiersREV) or
  (Field = QryAR_Discount_TiersITEMNO) ) then
  ABrush.Color := clBtnFace;

  if QryAR_Discount_TiersArinvtIdExists.asBoolean and (Field = QryAR_Discount_TiersItemType) then
  ABrush.Color := clBtnFace;




  //  if Field.ReadOnly then
  //     ABrush.Color := clBtnFace;
  end;
}
{
  procedure TFrmAR_Tiers.ClearCustomerType1Click(Sender: TObject);
  var
  AId:Real;
  begin
  if QryAR_Discount_TiersCUST_TYPE_ID.asFloat <> 0 then
  try
  QryAR_Discount_Tiers.AfterDelete := nil;
  //    if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then QryAR_Discount_Tiers.Edit;
  QryAR_Discount_TiersCUST_TYPE_ID.ReadOnly := False;
  QryAR_Discount_TiersCustType.ReadOnly := False;

  //    QryAR_Discount_TiersCUST_TYPE_ID.Clear;
  //    QryAR_Discount_TiersCustType.Clear;
  AId := QryAR_Discount_TiersID.asFloat;
  ExecuteCommandFmt('update AR_DISCOUNT_TIERS set CUST_TYPE_ID = null where id = %f', [QryAR_Discount_TiersID.asFloat]);
  QryAR_Discount_Tiers.Close;
  QryAR_Discount_Tiers.Open;
  QryAR_Discount_Tiers.Locate('ID', AId, []);
  finally
  SrcAR_Discount_Tiers.OnDataChange := SrcAR_Discount_TiersDataChange;
  SrcAR_Discount_TiersDataChange(nil, nil);
  end;
  end;
}
procedure TFrmAR_Tiers.ClearItemType1Click(Sender: TObject);
var
  AId: Real;
begin
  if QryAR_Discount_TiersITEM_TYPE_ID.asFloat <> 0 then
    try
      SrcAR_Discount_Tiers.OnDataChange := nil;
      // if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then QryAR_Discount_Tiers.Edit;
      QryAR_Discount_TiersITEM_TYPE_ID.ReadOnly := False;
      QryAR_Discount_TiersITEMTYPE.ReadOnly := False;

      // QryAR_Discount_TiersITEM_TYPE_ID.Clear;
      // QryAR_Discount_TiersItemType.Clear;
      AId := QryAR_Discount_TiersID.asFloat;
      ExecuteCommandFmt
        ('update AR_DISCOUNT_TIERS set ITEM_TYPE_ID = null where id = %f',
        [QryAR_Discount_TiersID.asFloat]);
      QryAR_Discount_Tiers.Close;
      QryAR_Discount_Tiers.Open;
      QryAR_Discount_Tiers.Locate('ID', AId, []);

    finally
      SrcAR_Discount_Tiers.OnDataChange := SrcAR_Discount_TiersDataChange;
      SrcAR_Discount_TiersDataChange(nil, nil);
    end;

end;

procedure TFrmAR_Tiers.cmbWaterfallLevelCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  TblAggregateQUAN_LEVEL.asFloat := wwQryWaterfallLevelQUAN_LEVEL.asFloat;
  cmbWaterfallLevel.Text := TblAggregateQUAN_LEVEL.asString;
end;

procedure TFrmAR_Tiers.cmbWaterfallLevelDropDown(Sender: TObject);
begin
  TblAggregate.Edit;
end;

procedure TFrmAR_Tiers.PopupMenu1Popup(Sender: TObject);
begin
  ClearCustomer1.Enabled := (QryAR_Discount_TiersARCUSTO_ID.asFloat <> 0);
  ClearItem1.Enabled := (QryAR_Discount_TiersARINVT_ID.asFloat <> 0);
  ClearCustomerType1.Enabled := (QryAR_Discount_TiersCUST_TYPE_ID.asFloat <> 0);
  ClearItemType1.Enabled := (QryAR_Discount_TiersITEM_TYPE_ID.asFloat <> 0);
end;

procedure TFrmAR_Tiers.wwDBLookupCombo1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  QryAR_Discount_TiersCUST_TYPE_ID.asFloat := wwQryCust_TypeID.asFloat;
  QryAR_Discount_TiersCUSTTYPE.asString := wwQryCust_TypeDESCRIP.asString;
  wwDBLookupCombo1.Text := QryAR_Discount_TiersCUSTTYPE.asString;
end;

procedure TFrmAR_Tiers.wwDBLookupCombo2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  QryAR_Discount_TiersITEM_TYPE_ID.asFloat := wwQryItem_Type.FieldByName
    ('ID').asFloat;
  QryAR_Discount_TiersITEMTYPE.asString := wwQryItem_Type.FieldByName
    ('DESCRIP').asString;
  wwDBLookupCombo2.Text := QryAR_Discount_TiersITEMTYPE.asString;
end;

procedure TFrmAR_Tiers.QryAR_Discount_TiersCalcFields(DataSet: TDataSet);
begin
  QryAR_Discount_TiersCustTypeExists.AsBoolean :=
    QryAR_Discount_TiersCUST_TYPE_ID.asFloat <> 0;
  QryAR_Discount_TiersArcustoIdExists.AsBoolean :=
    QryAR_Discount_TiersARCUSTO_ID.asFloat <> 0;
  QryAR_Discount_TiersItemTypeExists.AsBoolean :=
    QryAR_Discount_TiersITEM_TYPE_ID.asFloat <> 0;
  QryAR_Discount_TiersArinvtIdExists.AsBoolean :=
    QryAR_Discount_TiersARINVT_ID.asFloat <> 0;
end;

procedure TFrmAR_Tiers.QryAR_Discount_TiersAfterInsert(DataSet: TDataSet);
begin
  if FArcustoId <> 0 then
  begin
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        Sql.Add(IqFormat('select custno, company from arcusto where id = %f',
          [FArcustoId]));
        Open;
        QryAR_Discount_TiersCUSTNO.asString := FieldByName('CUSTNO').asString;
        QryAR_Discount_TiersCUSTOMER.asString := FieldByName('COMPANY')
          .asString;
      finally
        free;
      end;
    QryAR_Discount_TiersARCUSTO_ID.asFloat := FArcustoId;
  end;

  if FArinvtId <> 0 then
  begin
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        Sql.Add(IqFormat
          ('select itemno, class, rev, descrip, descrip2 from arinvt where id = %f',
          [FArinvtId]));
        Open;
        QryAR_Discount_TiersITEMNO.asString := FieldByName('ITEMNO').asString;
        QryAR_Discount_TiersCLASS.asString := FieldByName('CLASS').asString;
        QryAR_Discount_TiersREV.asString := FieldByName('REV').asString;
        QryAR_Discount_TiersDESCRIP.asString := FieldByName('DESCRIP').asString;
        QryAR_Discount_TiersDESCRIP.asString := FieldByName('DESCRIP2')
          .asString;
      finally
        free;
      end;
    QryAR_Discount_TiersARINVT_ID.asFloat := FArinvtId;
  end;
end;

procedure TFrmAR_Tiers.wwDBLookupCombo1DropDown(Sender: TObject);
begin
  QryAR_Discount_Tiers.Edit;
end;

procedure TFrmAR_Tiers.dbSellCurrCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var
  ACurrId: Real;
begin
  TblAggregate.Refresh;
  TblAggregate.Refresh;
  // double refresh seems to help when swiching to diffrerent currency

  if (dbSellCurr.Text = '') or (QryCurrID.asFloat = 0) then
  begin
    ACurrId := GetNativeCurrencyId;

    if ACurrId <> 0 then
    begin
      if QryCurr.Locate('ID', ACurrId, []) then
      begin
        // dbSellCurr.LookUpValue := QryCurrDESCRIP.asString;
        dbSellCurr.Text := QryCurrDESCRIP.asString;
        TblAggregate.Refresh;
      end;
    end;
  end;
end;

procedure TFrmAR_Tiers.TblAggregateFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  ACurrCode, ACurrCode2: String;
begin
  Accept := TRUE;
  if SelectValueAsString
    ('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'N' then
  begin
    Accept := TblAggregateCURRENCY_ID.asFloat = 0;
    exit;
  end;

  if (dbSellCurr.Text = '') or (QryCurrID.asFloat = 0) then
  begin
    Accept := TblAggregateCURRENCY_ID.asFloat = 0;
    exit;
  end;

  ACurrCode := SelectValueFmtAsString
    ('select curr_code from currency where id = %f',
    [TblAggregateCURRENCY_ID.asFloat]);
  ACurrCode2 := SelectValueFmtAsString
    ('select curr_code from currency where id = %f', [QryCurrID.asFloat]);

  if Accept then
    Accept := ACurrCode = ACurrCode2;
  SetWaterfallFields;
end;

procedure TFrmAR_Tiers.UniFormCreate(Sender: TObject);
begin
  FArinvtId := 0;
  FArcustoId := 0;
  Startup;
  IQRegFormRead(self, [self, Panel2, GridAggregate]);
end;

procedure TFrmAR_Tiers.Waterfalls1Click(Sender: TObject);
begin
  // DoSetupWaterfalls;  {Waterfall.pas}
  // Reopen(wwQryCust_Type);
  { TODO -ombaral -cWebIQ : Need to check
  if Owner is TUniForm then
    PostMessage(TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0);
  }
end;

procedure TFrmAR_Tiers.AddAllLevels1Click(Sender: TObject);
var
  ACurrencyId: String;
  AMaxLevel, i: Integer;
begin
  ACurrencyId := 'null';
  if SelectValueAsString
    ('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'Y' then
  begin
    if not((dbSellCurr.Text = '') or (QryCurrID.asFloat = 0)) then
      ACurrencyId := QryCurrID.asString;
  end;

  AMaxLevel := SelectValueAsInteger
    ('select max(quan_level) from ar_discount_waterfall_levels');
  for i := 1 to AMaxLevel do
    if (not IsFoundFmt
      ('select id from ar_discount_aggregate where ar_discount_tiers_id = %.0f and quan_level = %d',
      [QryAR_Discount_TiersID.asFloat, i])) then
      ExecuteCommandFmt
        ('insert into ar_discount_aggregate(ar_discount_tiers_id, quan_level, currency_id) '
        + 'values( %.0f, %d, %s)', [QryAR_Discount_TiersID.asFloat, i,
        ACurrencyId]);
  TblAggregate.Refresh;
end;

procedure TFrmAR_Tiers.AssignNativeCurrencytoAllUnassignedPriceBreaks1Click
  (Sender: TObject);
var
  ACurrId: Real;
begin
  ACurrId := GetNativeCurrencyId;
  if ACurrId <> 0 then
    ExecuteCommandFmt
      ('update AR_DISCOUNT_AGGREGATE set currency_id = %f where currency_id is null',
      [ACurrId]);

  TblAggregate.Refresh;
  IQInformation('Done.');
end;

procedure TFrmAR_Tiers.SetArinvtId(const Value: Real);
begin
  FArinvtId := Value;
  QryAR_Discount_Tiers.Sql.Clear;
  QryAR_Discount_Tiers.Sql.Add(ASql);
  QryAR_Discount_Tiers.Sql.Add(IqFormat(' and a.arinvt_id = %f ', [FArinvtId]));
  Startup;

end;

procedure TFrmAR_Tiers.SetWaterfallFields;
begin
  TblAggregateQUAN.Visible :=
    not(QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');
  TblAggregateQUAN.Required :=
    not(QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');
  TblAggregateQUAN_LEVEL.Visible :=
    (QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');
  TblAggregateQUAN_LEVEL.Required :=
    (QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');
  TblAggregateDISCOUNT_PRICE.Visible :=
    (not(QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y')) and
    (QryAR_Discount_TiersAGGREGATE.asString <> 'Y');
  TblAggregatePRICE_DATE.Visible :=
    not((QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y'));
  TblAggregateWEBDIRECT_SHOW.Visible :=
    (QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');
  Shape9.Visible := (QryAR_Discount_TiersUSE_WATERFALL.asString = 'Y');

  { TODO -ombaral -cWebConvert : PopupMenu property doesn`t exist in TUniGrid. Need to take care later.
    if (QryAR_Discount_TiersUSE_WATERFALL.AsString = 'Y') then
    GridAggregate.PopupMenu := PopupMenuAggregate
    else
    GridAggregate.PopupMenu := nil;

    GridAggregate.RefreshDisplay;
  }

end;

procedure TFrmAR_Tiers.QryAR_Discount_TiersAfterScroll(DataSet: TDataSet);
begin
  SetWaterfallFields;
  TblAggregate.Filtered := TRUE;
  QryBogo.Close;
  QryBogo.Open;
  CheckTabBogo;
end;

procedure TFrmAR_Tiers.wwDBShipToCustomDlg(Sender: TObject);
begin
  if QryAR_Discount_TiersCUST_TYPE_ID.asFloat = 0 then
    with PkShipTo do
      if Execute then
      begin
        if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then
          QryAR_Discount_Tiers.Edit;
        QryAR_Discount_TiersSHIP_TO_ID.asFloat :=
          System.Variants.VarAsType(GetValue('ID'), varInt64);
        QryAR_Discount_TiersATTN.asString :=
          System.Variants.VarToStr(GetValue('ATTN'));
      end;
end;

procedure TFrmAR_Tiers.PkShipToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID',
    QryAR_Discount_TiersARCUSTO_ID.AsLargeInt);
end;

procedure TFrmAR_Tiers.ClearShipTo1Click(Sender: TObject);
begin
  if not(QryAR_Discount_Tiers.State in [dsInsert, dsEdit]) then
    QryAR_Discount_Tiers.Edit;
  QryAR_Discount_TiersSHIP_TO_ID.Clear;
  QryAR_Discount_TiersATTN.Clear;
end;

procedure TFrmAR_Tiers.QryAR_Discount_TiersBeforeScroll(DataSet: TDataSet);
begin
  TblAggregate.Filtered := False;
end;

procedure TFrmAR_Tiers.QryBogoBeforeOpen(DataSet: TDataSet);
begin
  QryBogo.ParamByName('aId').asFloat := QryAR_Discount_TiersID.asFloat;
end;

procedure TFrmAR_Tiers.QryBogoBeforePost(DataSet: TDataSet);
begin
  if QryBogoID.asFloat = 0 then
    QryBogoID.asFloat := GetNextID('BOGO_DISCOUNT_DETAILS');
  QryBogoAR_DISCOUNT_TIERS_ID.asFloat := QryAR_Discount_TiersID.asFloat;
end;

procedure TFrmAR_Tiers.setArcustoId(const Value: Real);
begin
  FArcustoId := Value;
  QryAR_Discount_Tiers.Sql.Clear;
  QryAR_Discount_Tiers.Sql.Add(ASql);
  QryAR_Discount_Tiers.Sql.Add(IqFormat(' and a.arcusto_id = %f ',
    [FArcustoId]));
  Startup;
end;

procedure TFrmAR_Tiers.QryBogoBeforeEdit(DataSet: TDataSet);
begin
  if QryAR_Discount_TiersID.asFloat = 0 then
    Abort;
end;

procedure TFrmAR_Tiers.CheckTabBogo;
begin
  if QryAR_Discount_TiersBOGO.asString <> 'Y' then
  begin
    PC.ActivePage := TabTier;
    QryAR_Discount_TiersUSE_WATERFALL.ReadOnly := False;
    QryAR_Discount_TiersDISCOUNT_PRICE.ReadOnly := False;
    QryAR_Discount_TiersDISCOUNT.ReadOnly := False;
  end
  else
  begin
    PC.ActivePage := TabBogo;
    QryAR_Discount_TiersUSE_WATERFALL.ReadOnly := TRUE;
    QryAR_Discount_TiersDISCOUNT_PRICE.ReadOnly := TRUE;
    QryAR_Discount_TiersDISCOUNT.ReadOnly := TRUE;
  end;
end;

end.
