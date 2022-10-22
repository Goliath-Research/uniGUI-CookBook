unit UOM_Conv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Mask,
  Data.DB,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
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
  uniLabel,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmArinvt_UOM = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    SrcArinvt_UOM_Conv: TDataSource;
    TblArinvt_UOM_Conv: TFDTable;
    TblArinvt_UOM_ConvID: TBCDField;
    TblArinvt_UOM_ConvARINVT_ID: TBCDField;
    TblArinvt_UOM_ConvUOM: TStringField;
    TblArinvt_UOM_ConvCONV_VALUE: TFMTBCDField;
    QryArinvt_UOM: TFDQuery;
    QryArinvt_UOMUOM: TStringField;
    TblArinvt_UOM_ConvUOM_Lookup: TStringField;
    sbtnArinvt_UOM: TUniSpeedButton;
    Grid: TIQUniGridControl;
    TblArinvt_UOM_ConvDEFAULT_OE: TStringField;
    TblArinvt_UOM_ConvDEFAULT_PO: TStringField;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    TblArinvt_UOM_ConvOPERATOR_KIND: TStringField;
    wwDBComboBoxOperator: TUniDBComboBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label1: TUniLabel;
    PnlClient02: TUniPanel;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    TblArinvt_UOM_ConvOnHand: TFloatField;
    wwDBComboDlgFactor: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblArinvt_UOM_ConvBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure sbtnArinvt_UOMClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TblArinvt_UOM_ConvCalcFields(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] UOM_Conv.pas(89): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);}
    procedure wwDBComboDlgFactorCustomDlg(Sender: TObject);
    procedure TblArinvt_UOM_ConvAfterPost(DataSet: TDataSet);
    procedure TblArinvt_UOM_ConvBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FMasterDataSource: TDataSource;
    FArinvtFieldsGotChanged: Boolean;
    FSomeFactorChanged: Boolean;
    FDataSource: TDataSource;
    function IsFactorInvolvedInOpMat(AArinvt_ID: Real; AUOM: string): Boolean;
    function IsFactorInvolvedInOE(AArinvt_ID: Real; AUOM: string): Boolean;
    function IsFactorInvolvedInPO(AArinvt_ID: Real; AUOM: string): Boolean;
    procedure CheckFactorChangedPromptToContinue( AIsDeleteMode: Boolean = FALSE );
    procedure SetDataSource(const Value: TDataSource);
  public
    { Public declarations }
    class function ConstructMessageUsedInModules( ABomInvolved, AOEInvolved, APOInvolved: Boolean ): string;
    property DataSource: TDataSource write SetDataSource;
  end;

procedure DoAssign_Arinvt_UOM_Conv( ADataSource: TDataSource );


implementation

{$R *.DFM}

uses
  inv_calc_uom_factor,
  inv_rscstr,
  { TODO -oSanketG -cWC : Need to revisit }
  //InvtShel,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.UOM,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  System.Variants,
  { TODO -oSanketG -cWC : Need to revisit }
  //Uom_Lst
  IQMS.Common.JumpConstants;

procedure DoAssign_Arinvt_UOM_Conv( ADataSource: TDataSource );
var
  AForm: TUniForm;
begin
  // AForm:= FindFormByClassName( 'TFrmArinvt_UOM' );
  // if Assigned( AForm ) and (AForm.Owner = AOwner ) then
  //    AForm.BringToFront
  // else
  //    TFrmArinvt_UOM.Create( AOwner, ADataSource ).Show;

  AForm := TFrmArinvt_UOM.Create( uniGUIApplication.UniApplication );
  with AForm as TFrmArinvt_UOM do
  begin
    DataSource := ADataSource;
    ShowModal;
  end;
end;

procedure TFrmArinvt_UOM.FormCreate(Sender: TObject);
begin
  FMasterDataSource:= FDataSource;
  TblArinvt_UOM_Conv.MasterSource:= FDataSource;
  DBEdit1.DataSource:= FDataSource;
  DBEdit2.DataSource:= FDataSource;
  DBEdit3.DataSource:= FDataSource;
  {'Divide:'#13+
   '   Factor of custom UOM = 1 of native UOM. This is a default.'#13+
   'Multiply:'#13+
   '   1 of custom UOM = Factor of native UOM'}
  wwDBComboBoxOperator.Hint:= inv_rscstr.cTXT0000119;
  IQRegFormRead( self, [ self, Grid, PnlLeft01 ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmArinvt_UOM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Grid, PnlLeft01 ]);

  if FSomeFactorChanged then
    //PostMessage( TInvt_Shell(Owner).Handle, iq_AfterPost, 0, FMasterDataSource.DataSet.FieldByName('ID').asInteger);  // prompt for BOM uom change
end;

procedure TFrmArinvt_UOM.TblArinvt_UOM_ConvBeforePost(DataSet: TDataSet);
begin
  //TblArinvt_Uom_ConvUOM.asString:= UpperCase( TblArinvt_uomUOM.asString );
  IQAssignIDBeforePost( DataSet );
  if TblArinvt_UOM_ConvDEFAULT_OE.asString = 'Y' then
    if SelectValueFmtAsFloat('select count(*) from arinvt_uom_conv where NVL(default_oe, ''N'') = ''Y'' and id <> %f ' +
                 'and arinvt_id = %f',
                 [TblArinvt_UOM_ConvID.asFloat, TblArinvt_UOM_ConvARINVT_ID.asFloat]) <> 0 then
      raise exception.create(inv_rscstr.cTXT0000120 {'Only one OE default allowed'});

  if TblArinvt_UOM_ConvDEFAULT_PO.asString = 'Y' then
    if SelectValueFmtAsFloat('select count(*) from arinvt_uom_conv where NVL(default_po, ''N'') = ''Y'' and id <> %f ' +
                 'and arinvt_id = %f',
                 [TblArinvt_UOM_ConvID.asFloat, TblArinvt_UOM_ConvARINVT_ID.asFloat]) <> 0 then
      raise exception.create(inv_rscstr.cTXT0000121 {'Only one PO default allowed'});

  CheckFactorChangedPromptToContinue;
end;


procedure TFrmArinvt_UOM.CheckFactorChangedPromptToContinue( AIsDeleteMode: Boolean = FALSE );
var
  AThisFactorChanged: Boolean;
  A: Variant;
  ABomInvolved: Boolean;
  AOEInvolved: Boolean;
  APOInvolved: Boolean;
begin
  // factor or uom changed?
  A:= SelectValueArrayFmt( 'select conv_value, uom, operator_kind from arinvt_uom_conv where id = %f', [ TblArinvt_UOM_ConvID.asFloat ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT; // s/n happen

  ABomInvolved:= IsFactorInvolvedInOpMat( TblArinvt_UOM_ConvARINVT_ID.asFloat, A[ 1 ]); // TblArinvt_UOM_ConvUOM.asString );
  AOEInvolved := IsFactorInvolvedInOE   ( TblArinvt_UOM_ConvARINVT_ID.asFloat, A[ 1 ]); // TblArinvt_UOM_ConvUOM.asString );
  APOInvolved := IsFactorInvolvedInPO   ( TblArinvt_UOM_ConvARINVT_ID.asFloat, A[ 1 ]); // TblArinvt_UOM_ConvUOM.asString );

  if ABomInvolved or AOEInvolved or APOInvolved then
  begin
    if not AIsDeleteMode then
       AThisFactorChanged:= (A[ 0 ] <> TblArinvt_UOM_ConvCONV_VALUE.asFloat)
                             or
                            (Trim(A[ 1 ]) <> Trim(TblArinvt_UOM_ConvUOM.asString))
                            or
                            (A[ 2 ] <> TblArinvt_UOM_ConvOPERATOR_KIND.asString)
    else
       AThisFactorChanged:= TRUE;

    if AThisFactorChanged then
       if not IQWarningYN( ConstructMessageUsedInModules( ABomInvolved, AOEInvolved, APOInvolved )) then
          ABORT;

    FSomeFactorChanged:= FSomeFactorChanged or (AThisFactorChanged and ABomInvolved);  // Track FSomeFactorChanged for BOMs only
  end;
end;


class function TFrmArinvt_UOM.ConstructMessageUsedInModules( ABomInvolved, AOEInvolved, APOInvolved: Boolean ): string;
begin
   Result:= inv_rscstr.cTXT0000139;                   //  'Please note this item is consumed in the following modules: '
   if ABomInvolved then
      Result:= Result + #13 + inv_rscstr.cTXT0000140; // 'BOM Configuration';
   if AOEInvolved then
      Result:= Result + #13 + inv_rscstr.cTXT0000141; // 'Sales Orders';
   if APOInvolved then
      Result:= Result + #13 + inv_rscstr.cTXT0000142; // 'Purchase Orders';

   // Changes made to inventory UOM must be propagated to the BOM Configuration, Sales Orders and Purchase Orders.'#13#13+
   // If you continue you will be prompted to update each individual BOM consuming this item. Sales and Purchase Orders need to be revised manually.
   // Are you sure you want to continue?';
   Result:= Result + #13#13 + inv_rscstr.cTXT0000143;
end;


procedure TFrmArinvt_UOM.sbtnArinvt_UOMClick(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on Uom_Lst}
  //DoUOMList;   {Uom_Lst.pas}
  with QryArinvt_UOM do
  begin
    Close; Open;
  end;
end;

procedure TFrmArinvt_UOM.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TFrmArinvt_UOM.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmArinvt_UOM.TblArinvt_UOM_ConvCalcFields(DataSet: TDataSet);
begin
  if Assigned(FMasterDataSource) and Assigned(FMasterDataSource.DataSet {arinvt}) then
     TblArinvt_UOM_ConvOnHand.asFloat:= IQConvertUom( FMasterDataSource.DataSet.FieldByName('onhand').asFloat,
                                                      FMasterDataSource.DataSet.FieldByName('unit').asString,
                                                      TblArinvt_UOM_ConvUOM.asString,
                                                      FMasterDataSource.DataSet.FieldByName('ID').asFloat {arinvt_id});  {in IQMS.Common.UOM.pas}
end;

{ TODO -oSanketG -cWC : Need to revisit ,[dcc32 Error] UOM_Conv.pas(286): E2003 Undeclared identifier: 'GridCalcCellColors'}
{procedure TFrmArinvt_UOM.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.ReadOnly then ABrush.Color:= clBtnFace;
end;}

procedure TFrmArinvt_UOM.wwDBComboDlgFactorCustomDlg(Sender: TObject);
var
  A: Variant;
begin
  if TFrmCalcUOMFactor.DoShowModal( FMasterDataSource ) then  {inv_calc_uom_factor.pas}
  begin
    if not (TblArinvt_UOM_Conv.State in [dsEdit, dsInsert]) then
       TblArinvt_UOM_Conv.Edit;

    TblArinvt_UOM_ConvOPERATOR_KIND.asString:= 'D';
    TblArinvt_UOM_ConvCONV_VALUE.asFloat    := 0;

    A:= SelectValueArrayFmt( 'select length, width, gauge, spg from arinvt where id = %f', [ FMasterDataSource.DataSet.FieldByName('id').asFloat ]);
    if VarArrayDimCount( A ) > 0 then
        TblArinvt_UOM_ConvCONV_VALUE.asFloat:= A[ 0 ]  * A[ 1 ] * A[ 2 ] * A[ 3 ] * 0.0361;

    FArinvtFieldsGotChanged:= TRUE;
  end;
end;

procedure TFrmArinvt_UOM.TblArinvt_UOM_ConvAfterPost(DataSet: TDataSet);
begin
  if FArinvtFieldsGotChanged then
     PostMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0 );
  FArinvtFieldsGotChanged:= FALSE;
end;

function TFrmArinvt_UOM.IsFactorInvolvedInOpMat( AArinvt_ID: Real; AUOM: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from opmat where arinvt_id = %f and rtrim(unit) = rtrim(''%s'')', [ AArinvt_ID, AUOM ]) > 0;
end;

procedure TFrmArinvt_UOM.TblArinvt_UOM_ConvBeforeDelete(DataSet: TDataSet);
begin
  // factor or uom changed?
  CheckFactorChangedPromptToContinue( TRUE );
end;

function TFrmArinvt_UOM.IsFactorInvolvedInOE(AArinvt_ID: Real; AUOM: string): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from ord_detail where arinvt_id = %f and rtrim(unit) = rtrim(''%s'')', [ AArinvt_ID, AUOM ]) > 0;
end;

function TFrmArinvt_UOM.IsFactorInvolvedInPO(AArinvt_ID: Real; AUOM: string): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from po_detail where arinvt_id = %f and rtrim(unit) = rtrim(''%s'') and nvl(closed, ''N'') <> ''Y''', [ AArinvt_ID, AUOM ]) > 0;
end;

end.
