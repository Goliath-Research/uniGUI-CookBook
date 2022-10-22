unit Qk_Inv;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniDBNavigator,
  uniLabel,
  uniComboBox,
  uniDBComboBox, IQMS.Common.QuickAddBase, IQUniGrid, uniGUIFrame,
  uniPageControl, uniButton;

type
  TQuickAddRawArinvt = class(TQuickAddBase)
    Table1ID: TBCDField;
    Table1CLASS: TStringField;
    Table1ITEMNO: TStringField;
    Table1REV: TStringField;
    Table1DESCRIP: TStringField;
    Table1UNIT: TStringField;
    TabVendor: TUniTabSheet;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField1: TBCDField;
    PkVendorPK_HIDE: TStringField;
    wwQryVendorLookupVENDORNO: TStringField;
    wwQryVendorLookupCOMPANY: TStringField;
    wwQryVendorLookupCITY: TStringField;
    wwQryVendorLookupSTATE: TStringField;
    wwQryVendorLookupCOUNTRY: TStringField;
    wwQryVendorLookupID: TBCDField;
    wwQryVendorLookup: TFDQuery;
    wwSrcArinvt_Vendors: TDataSource;
    wwTblArinvt_Vendors: TFDQuery;
    wwTblArinvt_VendorsARINVT_ID: TBCDField;
    wwTblArinvt_VendorsVENDOR_ID: TBCDField;
    wwTblArinvt_VendorsVEND_ITEMNO: TStringField;
    wwTblArinvt_VendorsVEND_DESCRIP: TStringField;
    wwTblArinvt_VendorsID: TBCDField;
    wwTblArinvt_VendorsVendorCompany: TStringField;
    wwTblArinvt_VendorsVendorNo: TStringField;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboDlgVendor: TUniEdit;
    Table1LEAD_TIME: TStringField;
    Table1LEAD_DAYS: TBCDField;
    TabCostElem: TUniTabSheet;
    wwQryElements: TFDQuery;
    wwQryElementsELEM_DESCRIP: TStringField;
    wwQryElementsID: TBCDField;
    pnlStdCostGrid: TUniPanel;
    Panel9: TUniPanel;
    wwDBGridCostElem: TIQUniGridControl;
    comboElement: TUniDBLookupComboBox;
    wwDBEAdd_To_Rollup: TUniDBEdit;
    SrcArinvt_Elements: TDataSource;
    TblArinvt_Elements: TFDTable;
    TblArinvt_ElementsDescription: TStringField;
    TblArinvt_ElementsSTD_COST: TFMTBCDField;
    TblArinvt_ElementsDEFAULT_COST_ELEMENT: TStringField;
    TblArinvt_ElementsADD_TO_ROLLUP: TFMTBCDField;
    TblArinvt_ElementsARINVT_ID: TBCDField;
    TblArinvt_ElementsELEMENTS_ID: TBCDField;
    TblArinvt_ElementsID: TBCDField;
    Table1NON_MATERIAL: TStringField;
    Panel3: TUniPanel;
    chkNonMaterial: TUniDBCheckBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label9: TUniLabel;
    PnlClient02: TUniPanel;
    dbcCLASS: TUniDBComboBox;
    EditITEMNO: TUniDBEdit;
    EditREV: TUniDBEdit;
    EditDESCRIP: TUniDBEdit;
    dbcUNIT: TUniDBComboBox;
    dbeLeadTime: TUniDBEdit;
    chkBlend: TUniCheckBox;
    Table1DESCRIP2: TStringField;
    dbeExtDescription: TUniDBEdit;
    lblExtendedDescription: TUniLabel;
    FDUpdateSQL_Arinvt_Vendors: TFDUpdateSQL;
    FDUpdateSQLArinvt: TFDUpdateSQL;
    SR: TIQWebSecurityRegister;
    SrcElements: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure wwTblArinvt_VendorsNewRecord(DataSet: TDataSet);
    procedure wwDBComboDlgVendorCustomDlg(Sender: TObject);
    procedure PkVendorIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure Table1BeforePost(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TGridDrawState'
    procedure wwDBGridCostElemCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush); }
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TblArinvt_ElementsCalcFields(DataSet: TDataSet);
    procedure SRAfterApply(Sender: TObject);
    procedure TblArinvt_ElementsBeforePost(DataSet: TDataSet);
    procedure TblArinvt_ElementsNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  protected
    procedure CheckBlendAndClass; virtual;
    procedure CallAddQuickBlend( AARinvt_ID:Real ); virtual;
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses
  ClassLst,
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  Qk_Plast,
  { TODO -oathite -cWebConvert : Dependent on Qk_vend
  Qk_vend, }
  { TODO -oathite -cWebConvert : Dependent on Snd_BLQ
  Snd_BLQ, }
  System.Variants;
  { TODO -oathite -cWebConvert : Dependent on UOM_Lst
  UOM_Lst; }

procedure TQuickAddRawArinvt.FormCreate(Sender: TObject);
begin
  // inherited;
  IQRegFormRead( self, [self]);

  with Table1 do
  begin
    // attempt to prevent FireDAC error openning large tables using TFDTable
    UpdateOptions.RequestLive:= FALSE;
    Open;
    UpdateOptions.RequestLive:= TRUE;

    Append;
  end;

  PageControl1.ActivePage:= TabSheet1;
  { TODO -oathite -cWebConvert : Dependent on UOM_Lst
  PopulateUOMs( dbcUNIT.Items ); }
  PopulateInvClass( dbcCLASS.Items, (self is TQuickAddPlastic {filter prim material if TQuickAddPlastic } ));
  { TODO -oathite -cWebConvert :
Need to change defination in IQMS.Common.Controls
Incompatible type TForm and TQuickAddRawArinvt
  CenterForm(Self); //IQMS.Common.Controls.pas; default position }
  IQRegFormRead(Self, [Self, PnlLeft01]);
  CheckVistaAdjustSize( [EditITEMNO, EditREV, EditDESCRIP, dbcUNIT, dbeLeadTime]);
end;

procedure TQuickAddRawArinvt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlLeft01]);
  inherited;
end;

procedure TQuickAddRawArinvt.TblArinvt_ElementsBeforePost(DataSet: TDataSet);
begin
  inherited;
  IQAssignIDBeforePost( DataSet);
end;

procedure TQuickAddRawArinvt.TblArinvt_ElementsCalcFields(DataSet: TDataSet);
begin
  inherited;
  TblArinvt_ElementsDescription.AsString := SelectValueFmtAsString(
    'SELECT elem_descrip FROM elements WHERE id = %d',
    [TblArinvt_ElementsELEMENTS_ID.AsLargeInt]);
end;

procedure TQuickAddRawArinvt.TblArinvt_ElementsNewRecord(DataSet: TDataSet);
begin
  inherited;
  TblArinvt_ElementsID.asFloat:= 0;
end;

procedure TQuickAddRawArinvt.btnOKClick(Sender: TObject);
begin
  CheckBlendAndClass;

  inherited;

  if wwTblArinvt_Vendors.State in [dsEdit, dsInsert] then
     wwTblArinvt_Vendors.CheckBrowseMode;

  if chkBlend.Checked and ( VarAsType( ResultValue, varDouble ) > 0 ) then
     CallAddQuickBlend( VarAsType( ResultValue, varDouble ));

  {update arinvt std_cost}
  ExecuteCommandFmt(
    'update arinvt set std_cost = (select Sum(std_cost) from arinvt_elements where arinvt_id = %f) where id = %f',
    [ DtoF(VarAsType( ResultValue, varDouble )),
      DtoF(VarAsType( ResultValue, varDouble )) ]);
end;

procedure TQuickAddRawArinvt.CheckBlendAndClass;
begin
  with Table1 do
  begin
    if chkBlend.Checked then
      if FieldByName('CLASS').asString <> 'PL' then
         raise Exception.Create(inv_rscstr.cTXT0000116 {'Blend item class must be PL'});
    if (FieldByName('CLASS').asString = 'PL') and (Pos( FieldByName('UNIT').asString , '_LBS_GR_OZ_KG_MG_MCG_' ) = 0) then
         raise Exception.Create(inv_rscstr.cTXT0000117 {'PL item Unit must be LBS, GR, KG or OZ'});
  end;
end;

procedure TQuickAddRawArinvt.CallAddQuickBlend( AARinvt_ID:Real );
begin
  { TODO -oathite -cWebConvert : Dependent on Snd_BLQ
  DefineQuickBlendID( self, AARinvt_ID );  }
end;

procedure TQuickAddRawArinvt.IQNotify( var Msg: TMessage );
begin
  {comes from the base IQMS.Common.QuickAddBase.pas unit that posts the message in case we want ChkBlend hidden}
  chkBlend.Visible:= FALSE;
end;


procedure TQuickAddRawArinvt.PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
var
  I: Integer;
begin
  inherited; {nothing}

  if PageControl1.ActivePage <> TabSheet1 then
     EXIT;

  with Table1 do
    if State in [dsInsert, dsEdit] then
    begin
       try
         {Attempt to post and toggle to readonly}
         Post;
         for I:= 0 to FieldCount - 1 do
            Fields[ I ].ReadOnly:= TRUE;

         {Make std cost panel grid invisible for non-material items}
         pnlStdCostGrid.Visible:= FieldByName('NON_MATERIAL').asString <> 'Y'
       except on E: Exception do
         begin
           AllowChange:= FALSE;
           Application.ShowException( E );
           EXIT;
         end;
       end;
    end;
end;

procedure TQuickAddRawArinvt.wwTblArinvt_VendorsNewRecord(DataSet: TDataSet);
begin
  inherited; {nothing}
  wwTblArinvt_VendorsID.AsLargeInt := GetNextID('arinvt_vendors');
  wwTblArinvt_VendorsVEND_ITEMNO.asString := Table1ITEMNO.asString;
  wwTblArinvt_VendorsVEND_DESCRIP.asString:= Table1DESCRIP.asString;
end;

procedure TQuickAddRawArinvt.wwDBComboDlgVendorCustomDlg(Sender: TObject);
var
  AVendorID: Int64;
begin
  inherited; {nothing}
  with PkVendor do
    if Execute then
    begin
       AVendorID := System.Variants.VarAsType(GetValue('ID'), varInt64);
       wwTblArinvt_Vendors.Edit;
       wwTblArinvt_VendorsVENDOR_ID.asFloat:= AVendorID;
       wwTblArinvt_VendorsVendorNo.AsString := SelectValueFmtAsString(
        'SELECT vendorno FROM vendor WHERE id = %d',
        [AVendorID]);
       wwTblArinvt_VendorsVendorCompany.AsString := SelectValueFmtAsString(
        'SELECT company FROM vendor WHERE id = %d',
        [AVendorID]);
    end;
end;

procedure TQuickAddRawArinvt.PkVendorIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  inherited; {nothing}
  { TODO -oathite -cWebConvert : Dependent on Qk_vend
  Action:= DoQuickAppend( TQuickAddVendor, ResultValue ); }
end;

procedure TQuickAddRawArinvt.SRAfterApply(Sender: TObject);
begin
  inherited;

  // Hide grid controls
  wwDBComboDlgVendor.Visible := False;
  comboElement.Visible := False;
  wwDBEAdd_To_Rollup.Visible := False;
end;

procedure TQuickAddRawArinvt.Table1BeforePost(DataSet: TDataSet);
var
   ASecuredClass: string;
begin
  inherited;

  // Verify rights to create inventory item of selected Class
  if Trim( dbcCLASS.Text ) > '' then
  begin
      {figure out inv security class}
      if StrInList( dbcCLASS.Text, ['FG','PL','IN','PK','TL','MT']) then
         ASecuredClass:= dbcCLASS.Text
      else
         ASecuredClass:= 'UD';

      {IQMS.WebVcl.SecurityManager.pas}
      TSecurityManager.CheckSecuredComponentEnabled( 'ALL_INV',                              {App_ID}
                                    Format('%s_Inv', [ ASecuredClass ] ));  {Component Name}
  end;

  if Table1.FieldByName('REV').asString = '' then
     Table1.FieldByName('REV').asString:= ' ';  // Mar-09-2004
end;

{ TODO -oathite -cWebConvert : Undeclared identifier: 'TGridDrawState'
procedure TQuickAddRawArinvt.wwDBGridCostElemCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if not Highlight then
     ABrush.Color:= IIf( Field.ReadOnly, clBtnFace, clWindow );
end;   }

procedure TQuickAddRawArinvt.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  for I:= 0 to ControlCount - 1 do
    if ((Controls[ I ] is TUniDBEdit) or (Controls[ I ] is TUniDBComboBox)) and (akRight in Controls[ I ].Anchors) then
       CheckVistaAdjustSize( [Controls[ I ]]);
end;

procedure TQuickAddRawArinvt.PageControl1Change(Sender: TObject);
begin
  inherited;  {n}

  case PageControl1.ActivePage.PageIndex of
    1: begin
         wwTblArinvt_Vendors.Open;
         wwQryVendorLookup.Open;
       end;
    2: begin
         TblArinvt_Elements.Open;
         wwQryElements.Open;
       end;
  end;
end;

end.
