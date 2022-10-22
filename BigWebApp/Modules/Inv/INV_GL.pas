unit INV_GL;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.About,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
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
  uniPageControl, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmInvGLAcct = class(TUniForm)
    Panel1: TUniPanel;
    PC: TUniPageControl;
    TabGrid: TUniTabSheet;
    TabForm: TUniTabSheet;
    Grid: TIQUniGridControl;
    sbToggle: TUniSpeedButton;
    sbSearch: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    SrcArInvt: TDataSource;
    DBAcctSalesGrid: TUniDBLookupComboBox;
    DBAcctInvGrid: TUniDBLookupComboBox;
    IQAbout1: TIQWebAbout;
    PKArinvt: TIQWebHPick;
    PKArinvtITEMNO: TStringField;
    PKArinvtDESCRIP: TStringField;
    PKArinvtCLASS: TStringField;
    PKArinvtREV: TStringField;
    PKArinvtID: TBCDField;
    wwQryGLAcctInv1: TFDQuery;
    wwQryGlAcctInv2: TFDQuery;
    wwQryGLAcctInv1ID: TBCDField;
    wwQryGLAcctInv1ACCT: TStringField;
    wwQryGLAcctInv1DESCRIP: TStringField;
    wwQryGlAcctInv2ID: TBCDField;
    wwQryGlAcctInv2ACCT: TStringField;
    wwQryGlAcctInv2DESCRIP: TStringField;
    PKArinvtEPLANT_ID: TBCDField;
    wwQryGlAcctInv2EPLANT_ID: TBCDField;
    wwQryGLAcctInv1EPLANT_ID: TBCDField;
    Contents1: TUniMenuItem;
    wwQryGlAcctInv3: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TBCDField;
    FloatField2: TBCDField;
    wwQryGLAcctInv4: TFDQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField3: TBCDField;
    FloatField4: TBCDField;
    wwQryGLAcctInv1PK_HIDE: TStringField;
    wwQryGlAcctInv2PK_HIDE: TStringField;
    wwQryGLAcctInv4PK_HIDE: TStringField;
    wwQryGlAcctInv3PK_HIDE: TStringField;
    wwQryGLAcctInv5: TFDQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField5: TBCDField;
    FloatField6: TBCDField;
    StringField7: TStringField;
    wwQryGLAcctInv6: TFDQuery;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField7: TBCDField;
    FloatField8: TBCDField;
    StringField10: TStringField;
    DBAcctProdGrid: TUniDBLookupComboBox;
    PopupMenu1: TUniPopupMenu;
    SalesAccountsSplit1: TUniMenuItem;
    UpdateSQL3: TFDUpdateSQL;
    SrcDtlAcct: TDataSource;
    TblDtlAcct: TFDTable;
    TblDtlAcctAcct: TStringField;
    TblDtlAcctID: TBCDField;
    TblDtlAcctGLACCT_ID: TBCDField;
    wwQryGLAcctDtlSales: TFDQuery;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField18: TBCDField;
    FloatField26: TBCDField;
    TblDtlAcctARINVT_ID: TBCDField;
    PnlFormCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    DBItemNo: TUniDBEdit;
    DBDescrip: TUniDBEdit;
    DBClass: TUniDBEdit;
    DBRev: TUniDBEdit;
    DBAcctSales: TUniDBLookupComboBox;
    lblInvGLAccount: TUniLabel;
    lblProdVarAccount: TUniLabel;
    DBAcctInv: TUniDBLookupComboBox;
    DBAcctProd: TUniDBLookupComboBox;
    lbWIPGLAccont: TUniLabel;
    DBAcctWIP: TUniDBLookupComboBox;
    wwQryGlAcctInv7: TFDQuery;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField9: TBCDField;
    FloatField10: TBCDField;
    StringField13: TStringField;
    lblItrPlantAccount: TUniLabel;
    lblPPVAccount: TUniLabel;
    DBAcctINTR: TUniDBLookupComboBox;
    DBAcctPPV: TUniDBLookupComboBox;
    wwQryGlAcctInv8: TFDQuery;
    StringField14: TStringField;
    StringField15: TStringField;
    FloatField11: TBCDField;
    FloatField12: TBCDField;
    StringField16: TStringField;
    wwQryGlAcctInv9: TFDQuery;
    StringField17: TStringField;
    StringField18: TStringField;
    FloatField13: TBCDField;
    FloatField14: TBCDField;
    StringField19: TStringField;
    wwQryGlAcctInv10: TFDQuery;
    StringField20: TStringField;
    StringField23: TStringField;
    FloatField15: TBCDField;
    FloatField16: TBCDField;
    StringField24: TStringField;
    wwQryGlAcctInv11: TFDQuery;
    StringField25: TStringField;
    StringField26: TStringField;
    FloatField17: TBCDField;
    FloatField19: TBCDField;
    StringField27: TStringField;
    wwQryGlAcctInv12: TFDQuery;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField20: TBCDField;
    FloatField21: TBCDField;
    StringField30: TStringField;
    DBAcctWIPGrid: TUniDBLookupComboBox;
    DBAcctInterGrid: TUniDBLookupComboBox;
    DBAcctPPVGrid: TUniDBLookupComboBox;
    TblDtlAcctDescrip: TStringField;
    TblDtlAcctPERCENTAGE: TFMTBCDField;
    dbePhysVar: TUniDBLookupComboBox;
    dbeInvCostRev: TUniDBLookupComboBox;
    lblPhysVar: TUniLabel;
    lblInvCostRev: TUniLabel;
    wwQryGlAcctInv13: TFDQuery;
    StringField31: TStringField;
    StringField32: TStringField;
    FloatField22: TBCDField;
    FloatField23: TBCDField;
    StringField33: TStringField;
    wwQryGlAcctInv14: TFDQuery;
    StringField34: TStringField;
    StringField35: TStringField;
    FloatField24: TBCDField;
    FloatField25: TBCDField;
    StringField36: TStringField;
    wwQryGlAcctInv15: TFDQuery;
    StringField37: TStringField;
    StringField38: TStringField;
    FloatField27: TBCDField;
    FloatField28: TBCDField;
    StringField39: TStringField;
    DBAcctShipment: TUniDBLookupComboBox;
    LblShip: TUniLabel;
    DBAcctShipGrid: TUniDBLookupComboBox;
    qryArInvt: TFDQuery;
    qryArInvtDESCRIP: TStringField;
    qryArInvtITEMNO: TStringField;
    qryArInvtCLASS: TStringField;
    qryArInvtREV: TStringField;
    qryArInvtAcctSales: TStringField;
    qryArInvtAcctInv: TStringField;
    qryArInvtAcctProd: TStringField;
    qryArInvtEPLANT_ID: TBCDField;
    qryArInvtAcctIdWIP: TStringField;
    qryArInvtAcctInter: TStringField;
    qryArInvtAcctPPV: TStringField;
    qryArInvtAcctShipment: TStringField;
    qryArInvtSTANDARD_ID: TBCDField;
    qryArInvtID: TBCDField;
    qryArInvtDESCRIP2: TStringField;
    qryArInvtACCT_ID_SALES: TBCDField;
    qryArInvtACCT_ID_INV: TBCDField;
    qryArInvtACCT_ID_PRODVAR: TBCDField;
    qryArInvtACCT_ID_WIP: TBCDField;
    qryArInvtACCT_ID_PPV: TBCDField;
    qryArInvtACCT_ID_INTPLANT_SALES: TBCDField;
    qryArInvtACCT_ID_PHYS_VAR: TBCDField;
    qryArInvtACCT_ID_INV_COST_REV: TBCDField;
    qryArInvtNON_MATERIAL: TStringField;
    qryArInvtACCT_ID_SHIPMENT: TBCDField;
    SrcwwQryGlAcctInv3: TDataSource;
    SrcwwQryGLAcctInv1: TDataSource;
    SrcwwQryGlAcctInv10: TDataSource;
    SrcwwQryGlAcctInv11: TDataSource;
    SrcwwQryGlAcctInv12: TDataSource;
    SrcwwQryGlAcctInv15: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure sbToggleClick(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);   }
    procedure About1Click(Sender: TObject);
    procedure sbSearchClick(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure DBAcctSalesCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBAcctSalesDropDown(Sender: TObject);
    procedure DBAcctSalesGridDropDown(Sender: TObject);
    procedure DBAcctInvGridDropDown(Sender: TObject);
    procedure DBAcctProdGridDropDown(Sender: TObject);
    procedure wwQryGLAcctDtlSalesBeforeOpen(DataSet: TDataSet);
    procedure SalesAccountsSplit1Click(Sender: TObject);
    procedure TblDtlAcctBeforeEdit(DataSet: TDataSet);
    procedure TblDtlAcctBeforePost(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SrcDtlAcctDataChange(Sender: TObject; Field: TField);
    procedure DBAcctWIPGridDropDown(Sender: TObject);
    procedure DBAcctInterGridDropDown(Sender: TObject);
    procedure DBAcctPPVGridDropDown(Sender: TObject);
    procedure qryArInvtAfterScroll(DataSet: TDataSet);
    procedure qryArInvtBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FFilter:String;
    procedure QueryLookUp(Sender:TUniDBLookupComboBox; AField:Real);
    procedure SetId(const Value: Real);
  public
    { Public declarations }
    property Id:Real write SetId;
  end;

procedure DoINVGL(AId:Real);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency
  ArAcSplt, }
  IQMS.Common.HelpHook;

procedure DoINVGL(AId:Real);
var
  LFrmInvGLAcct : TFrmInvGLAcct;
begin
  LFrmInvGLAcct := TFrmInvGLAcct.Create(UniGUIApplication.UniApplication);
  LFrmInvGLAcct.Id := AId;
  LFrmInvGLAcct.ShowModal;
end;

procedure TFrmInvGLAcct.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Grid, PnlLeft01]);
  IQSetTablesActive( TRUE, self );

  Grid.DataSource := nil;
  PC.ActivePage := TabForm;
end;

procedure TFrmInvGLAcct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid, PnlLeft01]);
end;

procedure TFrmInvGLAcct.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvGLAcct.sbToggleClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    IQRegFormWrite( self, [self, Grid]);
    Grid.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    Grid.DataSource  := SrcArInvt;
    IQRegFormRead( self, [self, Grid]);
    PC.ActivePage := TabGrid;
  end;

end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmInvGLAcct.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (UpperCase(Field.FieldName) = 'ACCTSALES') and not Highlight then
     ABrush.Color := clWindow
  else if ( (UpperCase(Field.FieldName) = 'ACCTSHIPMENT') or (UpperCase(Field.FieldName) = 'ACCTIDWIP') or (UpperCase(Field.FieldName) = 'ACCTINTER') or (UpperCase(Field.FieldName) = 'ACCTINV') or  (UpperCase(Field.FieldName) = 'ACCTPROD') ) and not Highlight and (qryArInvtSTANDARD_ID.asFloat > 0) then
     ABrush.Color := clWindow
  else if ( (UpperCase(Field.FieldName) = 'ACCTINV')  and not Highlight) then
  begin
    if (qryArInvtNON_MATERIAL.asString = 'Y') or (qryArInvtSTANDARD_ID.asFloat > 0) then
     ABrush.Color := clWindow
  end
  else if ( (UpperCase(Field.FieldName) = 'ACCTPPV') ) and not Highlight and (qryArInvtSTANDARD_ID.asFloat = 0) then
     ABrush.Color := clWindow;


  if (SelectValueFmtAsFloat('select count(*) from ARINVT_SALES_SPLIT where arinvt_id = %f', [qryArInvtID.asFloat]) <> 0) and
     (UpperCase(Field.FieldName) = 'ACCTSALES')
  then if (not Highlight) then ABrush.Color := clAqua;


//  if (SelectValueFmtAsFloat('select id from arinvt_sales_split where arinvt_id = %f', [TblArInvtID.asFloat]) <> 0) and
//     (UpperCase(Field.FieldName) = 'ACCTSALES')
//  then if (not Highlight) then ABrush.Color := clAqua;

end;   }

procedure TFrmInvGLAcct.qryArInvtAfterScroll(DataSet: TDataSet);
begin
  qryArInvtACCT_ID_INV.ReadOnly:= qryArInvtSTANDARD_ID.asFloat = 0;
  if qryArInvtACCT_ID_INV.ReadOnly and (qryArInvtNON_MATERIAL.asString = 'Y') then
    qryArInvtACCT_ID_INV.ReadOnly := false;

  qryArInvtACCT_ID_PRODVAR.ReadOnly:= qryArInvtSTANDARD_ID.asFloat = 0;
  qryArInvtACCT_ID_WIP.ReadOnly:= qryArInvtSTANDARD_ID.asFloat = 0;

  // Set Inventory GL Account Visibility
  if qryArInvtNON_MATERIAL.asString = 'Y' then
  begin
    lblInvGLAccount.Visible := true;
    DBAcctInv.Visible       := true;
  end
  else
  begin
    lblInvGLAccount.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;
    DBAcctInv.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;
  end;

  // Set Production Variance Account Visibility
  lblProdVarAccount.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;
  DBAcctProd.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;

  lbWIPGLAccont.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;
  DBAcctWIP.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;

  lblPhysVar.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;
  dbePhysVar.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;

  lblInvCostRev.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;
  dbeInvCostRev.Visible:= qryArInvtSTANDARD_ID.asFloat > 0;

//  LblShip.Visible:= TblArInvtSTANDARD_ID.asFloat > 0;
//  DBAcctShipment.Visible:= TblArInvtSTANDARD_ID.asFloat > 0;

  LblShip.Visible:= (qryArInvtNON_MATERIAL.asString = 'Y') or (qryArInvtSTANDARD_ID.asFloat > 0);
  DBAcctShipment.Visible:= (qryArInvtNON_MATERIAL.asString = 'Y') or (qryArInvtSTANDARD_ID.asFloat > 0);


  if qryArInvtSTANDARD_ID.asFloat = 0 then
  begin
    qryArInvtACCT_ID_INTPLANT_SALES.ReadOnly := true;
    qryArInvtACCT_ID_PPV.ReadOnly := false;
    lblItrPlantAccount.Visible := false;
    DBAcctINTR.Visible := false;

    lblPPVAccount.Visible := true;
    DBAcctPPV.Visible := true;
    DBAcctPPV.Color := clWindow;

    lblPPVAccount.Top := Label5.Top + Label5.Height + 12;
    DBAcctPPV.Top := DBAcctSales.Top + DBAcctSales.Height + 4;

  end
  else
  begin
    qryArInvtACCT_ID_INTPLANT_SALES.ReadOnly := false;
    lblItrPlantAccount.Visible := true;
    DBAcctINTR.Visible := true;
    if qryArInvtACCT_ID_PPV.asFloat <> 0 then
    begin
      qryArInvtACCT_ID_PPV.ReadOnly := false;
      lblPPVAccount.Visible := true;
      DBAcctPPV.Visible := true;
      DBAcctPPV.Color := clBtnFace;

      lblPPVAccount.Top := LblShip.Top + lblInvCostRev.Height + 12;
      DBAcctPPV.Top := DBAcctShipment.Top + dbeInvCostRev.Height + 4;
    end
    else
    begin
      qryArInvtACCT_ID_PPV.ReadOnly := true;
      lblPPVAccount.Visible := false;
      DBAcctPPV.Visible := false;
    end;
  end;
end;

procedure TFrmInvGLAcct.qryArInvtBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmInvGLAcct.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmInvGLAcct.sbSearchClick(Sender: TObject);
begin
  with PKArinvt do
    if Execute then qryArInvt.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmInvGLAcct.AssignEPlantFilter(DataSet: TDataSet);
begin
//  IQAssignEPlantFilter( DataSet );
//  FFilter := DataSet.Filter;
end;

procedure TFrmInvGLAcct.DBAcctSalesCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
//    TFDQuery(LookupTable).Filter := FFilter;
end;

procedure TFrmInvGLAcct.DBAcctSalesDropDown(Sender: TObject);
begin
//  if FFilter = '' then
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
//  else
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= Format('(%s) and (PK_HIDE = NULL or PK_HIDE = ''N'')', [FFilter]);

{ TODO -oGPatil -cWebConvert : TUniDBLookupComboBox does not contain Lookuptable
  TUniDBLookupComboBox(Sender).LookupTable.Locate('ID', TUniDBLookupComboBox(Sender).DataSource.DataSet.FieldByName(TUniDBLookupComboBox(Sender).DataField).asFloat, []);
}
end;

procedure TFrmInvGLAcct.DBAcctSalesGridDropDown(Sender: TObject);
begin
//  if FFilter = '' then
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
//  else
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= Format('(%s) and (PK_HIDE = NULL or PK_HIDE = ''N'')', [FFilter]);
  QueryLookUp((Sender as TUniDBLookupComboBox), qryArInvtACCT_ID_SALES.asFloat);
end;

procedure TFrmInvGLAcct.DBAcctInvGridDropDown(Sender: TObject);
begin
//  if FFilter = '' then
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
//  else
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= Format('(%s) and (PK_HIDE = NULL or PK_HIDE = ''N'')', [FFilter]);
  QueryLookUp((Sender as TUniDBLookupComboBox), qryArInvtACCT_ID_INV.asFloat);
end;

procedure TFrmInvGLAcct.DBAcctProdGridDropDown(Sender: TObject);
begin
//  if FFilter = '' then
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
//  else
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= Format('(%s) and (PK_HIDE = NULL or PK_HIDE = ''N'')', [FFilter]);
  QueryLookUp((Sender as TUniDBLookupComboBox), qryArInvtACCT_ID_PRODVAR.asFloat);
end;

procedure TFrmInvGLAcct.DBAcctWIPGridDropDown(Sender: TObject);
begin
//  if FFilter = '' then
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
//  else
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= Format('(%s) and (PK_HIDE = NULL or PK_HIDE = ''N'')', [FFilter]);
  QueryLookUp((Sender as TUniDBLookupComboBox), qryArInvtACCT_ID_WIP.asFloat);
end;

procedure TFrmInvGLAcct.DBAcctInterGridDropDown(Sender: TObject);
begin
//  if FFilter = '' then
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
//  else
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= Format('(%s) and (PK_HIDE = NULL or PK_HIDE = ''N'')', [FFilter]);
  QueryLookUp((Sender as TUniDBLookupComboBox), qryArInvtACCT_ID_INTPLANT_SALES.asFloat);
end;

procedure TFrmInvGLAcct.DBAcctPPVGridDropDown(Sender: TObject);
begin
//  if FFilter = '' then
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
//  else
//    (Sender as TwwDBLookupCombo).LookupTable.Filter:= Format('(%s) and (PK_HIDE = NULL or PK_HIDE = ''N'')', [FFilter]);
  QueryLookUp((Sender as TUniDBLookupComboBox), qryArInvtACCT_ID_PPV.asFloat);
end;


procedure TFrmInvGLAcct.QueryLookUp(Sender:TUniDBLookupComboBox; AField:Real);
begin
{ TODO -oGPatil -cWebConvert : TUniDBLookupComboBox does not contain Lookuptable
  TUniDBLookupComboBox(Sender).LookupTable.Locate('ID', AField, []);
}
end;

procedure TFrmInvGLAcct.wwQryGLAcctDtlSalesBeforeOpen(DataSet: TDataSet);
begin
//  IQAssignEPlantFilter( DataSet );
//  FFilter := DataSet.Filter;
end;

procedure TFrmInvGLAcct.SalesAccountsSplit1Click(Sender: TObject);
begin
  if qryArInvtID.asFloat = 0 then Exit;
  if (SelectValueFmtAsFloat('select count(*) from arinvt_sales_split where arinvt_id = %f', [qryArInvtID.asFloat]) = 0) and
     (qryArInvtACCT_ID_SALES.asFloat <> 0) then
  begin
    ExecuteCommandFmt('insert into arinvt_sales_split (glacct_id, percentage, arinvt_id) values (%f, 100, %f)',
              [qryArInvtACCT_ID_SALES.asFloat, qryArInvtID.asFloat]);
  end;

  TblDtlAcct.Close;
  TblDtlAcct.Open;
{ TODO -oGPatil -cWebConvert : Dependency
  DoSalesAccountsSplit(self); {in ArAcSplt.pas}
end;

procedure TFrmInvGLAcct.TblDtlAcctBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmInvGLAcct.TblDtlAcctBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmInvGLAcct.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvGLAcct.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvGLAcct.SetId(const Value: Real);
begin
  qryArInvt.Locate('ID', Value, []);
end;

procedure TFrmInvGLAcct.SrcDtlAcctDataChange(Sender: TObject; Field: TField);
begin
  if (SelectValueFmtAsFloat('select count(*) from ARINVT_SALES_SPLIT where arinvt_id = %f', [qryArInvtID.asFloat]) <> 0)
  then DBAcctSales.Color := clAqua
  else DBAcctSales.Color := clWhite;
end;

end.
