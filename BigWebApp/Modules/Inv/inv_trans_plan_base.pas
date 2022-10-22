unit inv_trans_plan_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  inv_trans_share,
  Mask,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, Vcl.Grids, IQUniGrid, uniGUIFrame, uniGUIFont;

type
  TInvTransPlanClass = class of TFrmInvTransPlanBase;

  TFrmInvTransPlanBase = class(TUniForm)
    Panel1: TUniPanel;
    pnlItem: TUniPanel;
    Panel3: TUniPanel;
    pnlDetails: TUniPanel;
    pnlPlan: TUniPanel;
    diPlan: TwwDataInspector;
    gridInvPlanItem: TIQUniGridControl;
    Panel7: TUniPanel;
    Splitter1: TUniSplitter;
    Panel8: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    QryInvTransPlan: TFDQuery;
    QryInvTransItem: TFDQuery;
    QryInvTransDetail: TFDQuery;
    QryInvTransLoc: TFDQuery;
    IQAbout1: TIQWebAbout;
    FlowPanel1: TUniPanel;
    sbtnRecalculate: TUniSpeedButton;
    NavInvTransItem: TUniDBNavigator;
    NavInvTransDetail: TUniDBNavigator;
    gridDetails: TIQUniGridControl;
    SrcInvTransPlan: TDataSource;
    SrcInvTransItem: TDataSource;
    SrcInvTransDetail: TDataSource;
    SrcInvTransLoc: TDataSource;
    QryInvTransPlanID: TBCDField;
    QryInvTransPlanSOURCE_MODULE: TStringField;
    QryInvTransPlanSOURCE: TStringField;
    QryInvTransPlanSOURCE_ID: TBCDField;
    QryInvTransPlanKIND: TStringField;
    QryInvTransPlanLAST_UPDATE: TDateTimeField;
    QryInvTransItemID: TBCDField;
    QryInvTransItemINV_TRANS_PLAN_ID: TBCDField;
    QryInvTransItemARINVT_ID: TBCDField;
    QryInvTransItemITEMNO: TStringField;
    QryInvTransItemDESCRIP: TStringField;
    QryInvTransItemREV: TStringField;
    QryInvTransItemCLASS: TStringField;
    QryInvTransItemDESCRIP2: TStringField;
    QryInvTransItemQTY: TFMTBCDField;
    QryInvTransItemPK_UNIT_TYPE: TStringField;
    QryInvTransItemINV_MOVE_CLASS_ID: TBCDField;
    QryInvTransItemINV_TRANS_RULE_ID: TBCDField;
    QryInvTransItemDIVISION_ID: TBCDField;
    QryInvTransItemNOTE1: TStringField;
    QryInvTransItemDivisionName: TStringField;
    QryInvTransItemTransRule: TStringField;
    QryInvTransDetailID: TBCDField;
    QryInvTransDetailINV_TRANS_ITEM_ID: TBCDField;
    QryInvTransDetailSOURCE: TStringField;
    QryInvTransDetailSOURCE_ID: TBCDField;
    QryInvTransDetailLOTNO: TStringField;
    QryInvTransLocID: TBCDField;
    QryInvTransLocINV_TRANS_ITEM_ID: TBCDField;
    QryInvTransLocLOCATIONS_ID: TBCDField;
    QryInvTransLocLocDesc: TStringField;
    QryInvTransDetailSOURCE_NAME: TStringField;
    QryInvTransDetailSOURCE_DESCRIP: TStringField;
    QryInvTransLocINV_TRANS_RULE_DETAIL_ID: TBCDField;
    QryInvTransLocTransRuleDetailSeq: TFloatField;
    InventoryTransactionRules1: TUniMenuItem;
    N1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    popmPlanItem: TUniPopupMenu;
    JumpToInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    QryInvTransLocUNITS: TBCDField;
    QryInvTransLocCAPACITY: TBCDField;
    QryInvTransItemUNITS: TBCDField;
    QryInvTransItemPK_UNIT_TYPE_DISP: TStringField;
    wwDBComboDlgNote: TUniEdit;
    QryInvTransDetailQTY: TFMTBCDField;
    QryInvTransLocINV_TRANS_DETAIL_ID: TBCDField;
    QryInvTransLocQTY: TFMTBCDField;
    Panel13: TUniPanel;
    Panel2: TUniPanel;
    Panel5: TUniPanel;
    Panel4: TUniPanel;
    pgctrlPlanLoc: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Panel9: TUniPanel;
    NavInvPlanLocations: TUniDBNavigator;
    gridLoc: TIQUniGridControl;
    wwDBComboBoxPlanSrcModule: TUniDBComboBox;
    pnlInvPlanItem: TUniPanel;
    pnlInvPlanItemRight: TUniPanel;
    diItem: TwwDataInspector;
    QryInvTransItemMOVE_CLASS_DESCRIP: TStringField;
    QryInvTransItemPTSPER: TFMTBCDField;
    QryInvTransItemVOLUME: TFMTBCDField;
    Splitter4: TUniSplitter;
    popmItemDetails: TUniPopupMenu;
    BOLDataMovementClass1: TUniMenuItem;
    popmMasterLocation: TUniPopupMenu;
    JumptoInventoryByLocation1: TUniMenuItem;
    JumptoInventoryRuleSet1: TUniMenuItem;
    QryInvTransItemARINVT_GROUP_NAME: TStringField;
    QryInvTransItemWMS_GROUP_CODE: TStringField;
    JumptoLocation1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure AppyUpdate(DataSet: TDataSet);
    procedure QryInvTransPlanBeforeOpen(DataSet: TDataSet);
    procedure sbtnRecalculateClick(Sender: TObject);
    procedure InventoryTransactionRules1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure QryInvTransDetailUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure gridInvPlanItemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure wwDBComboDlgNoteCustomDlg(Sender: TObject);
    procedure gridLocCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TUniFont; ABrush: TUniCellAttribs);
    procedure diItemDrawCaptionCell(Sender: TwwDataInspector;
      ObjItem: TwwInspectorItem; ASelected: Boolean; ACellRect: TRect;
      var ACaptionRect: TRect; var DefaultTextDrawing: Boolean);
    procedure BOLDataMovementClass1Click(Sender: TObject);
    procedure JumptoInventoryByLocation1Click(Sender: TObject);
    procedure JumptoInventoryRuleSet1Click(Sender: TObject);
    procedure JumptoLocation1Click(Sender: TObject);
    procedure QryInvTransItemCalcFields(DataSet: TDataSet);
    procedure QryInvTransLocCalcFields(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    FIsTemporaryPlan: Boolean;
    FCargo: TInvTransPlanCargo;
    procedure EnsurePlanInputDataExists(ACargo: TInvTransPlanCargo);
    procedure CheckMismatchBetweenUnitTypeMoveClass(DataSet: TDataSet);
    procedure RefreshDatasets;
    procedure CheckTransAlertAssigned(ACargo: TInvTransPlanCargo);
    function IsPlanReserved(AInvTransPlan_ID: Real): Boolean;
    class procedure AssignTransAlert_PO_Detail(ACargo: TInvTransPlanCargo); static;
    class procedure AssignTransAlert_Rma_Detail(ACargo: TInvTransPlanCargo); static;
    procedure SetCargo(const Value: TInvTransPlanCargo);
  protected
    FInvTransPlan_ID: Real;
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent; ACargo: TInvTransPlanCargo ); virtual;
    procedure SetReadOnly;

    class procedure DoShow( ACargo: TInvTransPlanCargo );  overload;
    class procedure DoShow( AInvTransPlan_ID: Real ); overload;
    class procedure DoShowViewOnly(AInvTransPlan_ID: Real );

    class function GeneratePlan( ACargo: TInvTransPlanCargo) : Real;
    class function GeneratePlanEx(ACargo: TInvTransPlanCargo): Real; static;
    class function ReGeneratePlanEx( var ACargo: TInvTransPlanCargo): Real;

    class procedure CreatePlanHeader( var ACargo: TInvTransPlanCargo; var AInvTransPlan_ID: Real );

    class procedure GeneratePlanLocations( AInvTransPlan_ID: Real ); virtual;
    class procedure GeneratePlanLocationsEx( AInvTransPlan_ID: Real );

    class procedure LoadPlanInputData( AInvTransPlan_ID: Real );
    class procedure PreparePlanLocations( AInvTransPlan_ID: Real; ARedoUnprocessed: Boolean = FALSE );
    class procedure PrepareTransLocations(AInvTransPlan_ID: Real);
    class function FindInvTransPlan_ID(ACargo: TInvTransPlanCargo): Real; static;

    class procedure EnsureTransAlertAssigned( ACargo: TInvTransPlanCargo); static;
    class procedure AssignTransAlert_Expected_Receipt( ACargo: TInvTransPlanCargo); static;
    class procedure AssignTransAlert_Move_Out( ACargo: TInvTransPlanCargo); static;
    class procedure AssignTransAlert_PickTicket( ACargo: TInvTransPlanCargo); static;
    class procedure AssignTransAlert_Staging( ACargo: TInvTransPlanCargo); static;
    class procedure AssignTransAlert_Move_Out_Master_Label(ACargo: TInvTransPlanCargo); static;
    property Cargo: TInvTransPlanCargo write SetCargo;

  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.EditMemoStr,
  Inv_Bol_Params,
  inv_trans_alert_misc,
  inv_trans_plan_dm,

  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO -ombaral -cWebIQ : Resolve depemdency
  inv_trans_rules,
  iqrf.share,
  IQMS.Common.UserMessages,
  }
  IQMS.Common.Screen,
  IQMS.Common.StringUtils,

  IQMS.Common.SysShare;

{silent execution}
class function TFrmInvTransPlanBase.GeneratePlan( ACargo: TInvTransPlanCargo ): Real;
begin
  // 0. create inv_trans_plan header table
  // 1. populate inv_trans_item and inv_trans_detail
  // 2. recalc and populate inv_trans_locations [planned locations]
  // 3. populate inv_trans_loc_detail - this should have fgmulti assigned and ready for transaction
  CreatePlanHeader( ACargo, Result );
  GeneratePlanLocations( Result );
end;

{silent execution}
class function TFrmInvTransPlanBase.GeneratePlanEx( ACargo: TInvTransPlanCargo ): Real;
begin
  CreatePlanHeader( ACargo, Result );
  GeneratePlanLocationsEx( Result );
end;

class function TFrmInvTransPlanBase.ReGeneratePlanEx( var ACargo: TInvTransPlanCargo ): Real;
begin
  // find plan if exists
  Result:= ACargo.InvTransPlan_ID;
  if Result = 0 then
     Result:= FindInvTransPlan_ID( ACargo );

  // create new one if not found
  if Result = 0 then
     CreatePlanHeader( ACargo, Result );

  if ACargo.InvTransPlan_ID = 0 then
     ACargo.InvTransPlan_ID:= Result;

  // generate locations
  GeneratePlanLocationsEx( Result );
end;


{ -- TFrmInvTransPlanBase ---------------------------------------------------- }
{ Interactive execution }
class procedure TFrmInvTransPlanBase.DoShow(ACargo: TInvTransPlanCargo);
begin
  TFrmInvTransPlanBase.Create(uniGUIApplication.UniApplication).Show;
end;

class procedure TFrmInvTransPlanBase.DoShow(AInvTransPlan_ID: Real );
var
  ACargo: TInvTransPlanCargo;
begin
  IQAssert( AInvTransPlan_ID > 0, 'WMS Inventory Location Plan ID is not assigned - unable to display Inventory Location Plan' );

  ACargo:= TInvTransPlanCargo.Create( 0 );
  ACargo.InvTransPlan_ID:= AInvTransPlan_ID;

  TFrmInvTransPlanBase.DoShow( ACargo );
end;

class procedure TFrmInvTransPlanBase.DoShowViewOnly( AInvTransPlan_ID: Real );
var
  ACargo: TInvTransPlanCargo;
begin
  IQAssert( AInvTransPlan_ID > 0, 'WMS Inventory Location Plan ID is not assigned - unable to display Inventory Location Plan' );

  ACargo:= TInvTransPlanCargo.Create( 0 );
  ACargo.InvTransPlan_ID:= AInvTransPlan_ID;

  with TFrmInvTransPlanBase.Create(uniGUIApplication.UniApplication) do
  begin
    Cargo:=ACargo;
    SetReadOnly;
    Show;
  end;
end;
{
constructor TFrmInvTransPlanBase.Create(AOwner: TComponent; ACargo: TInvTransPlanCargo );
begin
  inherited Create(AOwner);

  EnsurePlanInputDataExists( ACargo );

  // if requested as a temporary plan and reserved one for this criteria does not exist - flag it as a temporary so it will be deleted upon leaving the form
  FIsTemporaryPlan:= ACargo.IsTemporaryPlan
                     and
                     not IsPlanReserved( FInvTransPlan_ID );
  sbtnRecalculate.Enabled:= not IsPlanReserved( FInvTransPlan_ID );

  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self, pnlPlan, pnlItem, pnlDetails, gridInvPlanItem, gridDetails, pnlInvPlanItemRight ]);
  pgctrlPlanLoc.ActivePageIndex:= 0;

  diPlan.GetItemByFieldName('source_module').CustomControl:= wwDBComboBoxPlanSrcModule;
  inv_trans_share.LoadSrcModulesInto( wwDBComboBoxPlanSrcModule, ACargo.Kind );  // kind = LOCATE or PICK

  with gridInvPlanItem do CheckReplaceDivisionOfWWSelected( Selected );
end;
}
procedure TFrmInvTransPlanBase.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ATRans_Alert_ID: Real;
begin
  if FIsTemporaryPlan then
  begin
    ATrans_Alert_ID:= SelectValueFmtAsFloat('select id from trans_alert where inv_trans_plan_id = %f', [ FInvTransPlan_ID ]);
    if ATrans_Alert_ID > 0 then
       ExecuteCommandFmt('delete from trans_alert where id = %f', [ ATrans_Alert_ID ])     // preferred method to delete trans_alert along with the inv_trans_plan including shuttle children
    else
       ExecuteCommandFmt('delete from inv_trans_plan where id = %f', [ FInvTransPlan_ID ]);
  end;

  Action:= caFree;
  IQRegFormwrite(self, [ self, pnlPlan, pnlItem, pnlDetails, gridInvPlanItem, gridDetails, pnlInvPlanItemRight ]);
end;

procedure TFrmInvTransPlanBase.EnsurePlanInputDataExists( ACargo: TInvTransPlanCargo );
begin
  FInvTransPlan_ID:= ACargo.InvTransPlan_ID;
  try
    if FInvTransPlan_ID = 0 then
    begin
       FInvTransPlan_ID:= TFrmInvTransPlanBase.FindInvTransPlan_ID( ACargo );
       ACargo.InvTransPlan_ID:= FInvTransPlan_ID;
    end;

    if FInvTransPlan_ID > 0 then
       EXIT;
  finally
    CheckTransAlertAssigned( ACargo );
  end;

  CreatePlanHeader( ACargo, FInvTransPlan_ID );
  GeneratePlanLocations( FInvTransPlan_ID );

  RefreshDataSets;
end;

class function TFrmInvTransPlanBase.FindInvTransPlan_ID( ACargo: TInvTransPlanCargo ): Real;
begin
  // check if this is a master label move and we have a reserved plan for it
  if (ACargo.Source = 'master_label')
      and (
      ACargo.Kind = inv_trans_share.cnstLocatingKind)  // LOCATE
      and
      (ACargo.SourceModule = inv_trans_share.LocatingSrcModuleList[ inv_trans_share.lsmMove ].Value) then  // MOVE
  begin
    (*  TODO -ombaral -cWebIQ : Resolve depemdency
    Result:= iqrf.share.FindWorkorderReservedInvTransPlan( ACargo.Source_ID{master_label_id});
    *)
    if Result > 0 then
       EXIT;
  end;

  // normal execution
  Result:= SelectValueFmtAsFloat('select id from inv_trans_plan '+
                     ' where source_module = ''%s'' '+
                     '   and source = ''%s''        '+
                     '   and source_id = %f         '+
                     '   and kind = ''%s''          ',
                     [ ACargo.SourceModule,
                       ACargo.Source,
                       ACargo.Source_ID,
                       ACargo.Kind ]);
end;


procedure TFrmInvTransPlanBase.sbtnRecalculateClick(Sender: TObject);
begin
  if not IQConfirmYN('Are you sure you want to recalculate the location plan?') then
     EXIT;

  GeneratePlanLocations(FInvTransPlan_ID);
  RefreshDataSets;
end;

procedure TFrmInvTransPlanBase.SetCargo(const Value: TInvTransPlanCargo);
begin
  FCargo := Value;
end;

procedure TFrmInvTransPlanBase.SetReadOnly;
begin
  sbtnRecalculate.Enabled:= FALSE;
  QryInvTransItem.CachedUpdates:= FALSE;
  QryInvTransDetail.CachedUpdates:= FALSE;
end;

procedure TFrmInvTransPlanBase.UniFormShow(Sender: TObject);
begin
   EnsurePlanInputDataExists( FCargo );
   FIsTemporaryPlan:= FCargo.IsTemporaryPlan
                     and
                     not IsPlanReserved( FInvTransPlan_ID );
  sbtnRecalculate.Enabled:= not IsPlanReserved( FInvTransPlan_ID );

  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self, pnlPlan, pnlItem, pnlDetails, gridInvPlanItem, gridDetails, pnlInvPlanItemRight ]);
  pgctrlPlanLoc.ActivePageIndex:= 0;

  diPlan.GetItemByFieldName('source_module').CustomControl:= wwDBComboBoxPlanSrcModule;
  inv_trans_share.LoadSrcModulesInto( wwDBComboBoxPlanSrcModule, FCargo.Kind );  // kind = LOCATE or PICK

  //with gridInvPlanItem do CheckReplaceDivisionOfWWSelected( Selected );

end;

class procedure TFrmInvTransPlanBase.GeneratePlanLocations( AInvTransPlan_ID: Real );
begin
  GeneratePlanLocationsEx( AInvTransPlan_ID );
  PrepareTransLocations( AInvTransPlan_ID );
end;

class procedure TFrmInvTransPlanBase.GeneratePlanLocationsEx( AInvTransPlan_ID: Real );
begin
  LoadPlanInputData( AInvTransPlan_ID );
  PreparePlanLocations( AInvTransPlan_ID );
end;

class procedure TFrmInvTransPlanBase.PrepareTransLocations( AInvTransPlan_ID: Real );
var
  DM    : TInvTransPlanDM;
  ACargo: TInvTransPlanCargo;
  A     : Variant;
begin
  A:= SelectValueArrayFmt( 'select source_module, source, source_id, kind from inv_trans_plan where id = %f', [ AInvTransPlan_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unidentified inv_trans_plan_id = %.0f', [ AInvTransPlan_ID ]));
  ACargo.SourceModule:= A[ 0 ];
  ACargo.Source      := A[ 1 ];
  ACargo.Source_ID   := A[ 2 ];
  ACargo.Kind        := A[ 3 ];
  ACargo.InvTransPlan_ID:= AInvTransPlan_ID;

  DM:= TInvTransPlanDM.Create( Application, ACargo );  // inv_trans_plan_dm.pas
  try
    DM.PrepareTransactionLocations;
  finally
    DM.Free;
  end;
end;


procedure TFrmInvTransPlanBase.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmInvTransPlanBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvTransPlanBase.AppyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;
(*
procedure TFrmInvTransPlanBase.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;
*)
procedure TFrmInvTransPlanBase.CheckMismatchBetweenUnitTypeMoveClass( DataSet: TDataSet );
var
  AArinvt_Inv_Move_Class_ID: Real;
  S1, S2: string;
begin
  // OBSOLETE
  AArinvt_Inv_Move_Class_ID:= SelectValueFmtAsFloat('select case nvl(pk_unit_type, ''C'')                 '+
                                        '            when ''E'' then loose_inv_move_class_id  '+
                                        '            when ''C'' then pack_inv_move_class_id   '+
                                        '            when ''P'' then pallet_inv_move_class_id '+
                                        '        end as inv_move_class_id                     '+
                                        '  from arinvt where id = %f                          ',
                                        [ DataSet.FieldByName('arinvt_id').asFloat ]);

  if AArinvt_Inv_Move_Class_ID = 0 then
     EXIT;

  if AArinvt_Inv_Move_Class_ID = DataSet.FieldByName('inv_move_class_id').asFloat then
     EXIT;

  S1:= SelectValueByID('descrip', 'inv_move_class', DataSet.FieldByName('inv_move_class_id').asFloat );
  S2:= SelectValueByID('descrip', 'inv_move_class', AArinvt_Inv_Move_Class_ID);

  if IQConfirmYN(Format('Mismatch detected between ''Unit Type'' and ''Move Class''.'#13#13+
                        'Selected move class: %s.'#13+
                        'Unit type corresponding move class: %s.'#13#13+
                        'Would you like to change to corresponding move class?',
                        [ S1, S2 ])) then
  begin
    DataSet.Edit;
    DataSet.FieldByName('inv_move_class_id').asFloat:= AArinvt_Inv_Move_Class_ID;
  end;
end;

procedure TFrmInvTransPlanBase.QryInvTransDetailUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest = arUpdate then
  begin
    ExecuteCommandFmt('update inv_trans_detail_loc set lotno = ''%s'' where id = %f',
              [ FixStr(ASender.FieldByName('lotno').asString),
                ASender.FieldByName('inv_trans_detail_loc_id').asFloat ]);
  end;

  AAction := eaApplied;
end;

procedure TFrmInvTransPlanBase.QryInvTransPlanBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('id').Value := FInvTransPlan_ID;
end;

class procedure TFrmInvTransPlanBase.CreatePlanHeader( var ACargo: TInvTransPlanCargo; var AInvTransPlan_ID: Real );
begin
  AInvTransPlan_ID:= GetNextID('inv_trans_plan');
  ExecuteCommandFmt('declare                               '+
            '  v_clear_cargo varchar2(1)::= nvl(''%s'', ''Y''); '+
            'begin                                 '+
            '  if v_clear_cargo = ''Y'' then       '+  // this is a default
            '     inv_trans_misc.delete_cargo_params; '+
            '  end if;                             '+
            '  insert into inv_trans_plan          '+
            '        ( id,                         '+
            '          source_module,              '+
            '          source,                     '+
            '          source_id,                  '+
            '          kind )                      '+
            '   values                             '+
            '        ( %f,                         '+
            '          ''%s'',                     '+
            '          ''%s'',                     '+
            '          %f,                         '+
            '          ''%s'');                    '+
            'end;                                  ',
            [ IQMS.Common.StringUtils.BoolToYN(ACargo.ClearCargoParams),
              AInvTransPlan_ID,
              ACargo.SourceModule,
              ACargo.Source,
              ACargo.Source_ID,
              ACargo.Kind ]);

  ACargo.InvTransPlan_ID:= AInvTransPlan_ID;

  TFrmInvTransPlanBase.EnsureTransAlertAssigned( ACargo );  // local
end;


procedure TFrmInvTransPlanBase.diItemDrawCaptionCell(Sender: TwwDataInspector;
  ObjItem: TwwInspectorItem; ASelected: Boolean; ACellRect: TRect;
  var ACaptionRect: TRect; var DefaultTextDrawing: Boolean);

  function _empty( AField: TField ): Boolean;
  begin
    if AField is TStringField then
       Result:= AField.asString = ''
    else if AField is TFloatField then
       Result:= AField.asFloat = 0
    else
       Result:= False;
  end;

begin
  with (Sender as TwwDataInspector) do if Assigned(ObjItem.Field) then
   if StrInList( ObjItem.Field.FieldName, ['MOVE_CLASS_DESCRIP', 'PK_UNIT_TYPE_DISP', 'PTSPER', 'VOLUME']) and _empty( ObjItem.Field ) then
   begin
     Canvas.Font.Color:= clRed;
     Canvas.FillRect(ACaptionRect);
   end;
end;

procedure TFrmInvTransPlanBase.CheckTransAlertAssigned( ACargo: TInvTransPlanCargo );
begin
  if (ACargo.InvTransPlan_ID = 0) then
     EXIT;

  // ACargo.Trans_Alert_ID may be optionally assigned - used it
  if SelectValueByID('inv_trans_plan_id', 'trans_alert', ACargo.Trans_Alert_ID) > 0 then
     EXIT;

  {based on inv_trans_plan cargo find origin trans_alert that could be more than 1 record in case of receiving or pickticket}

  // po_expected_receipt
  if (ACargo.SourceModule = inv_trans_share.LocatingSrcModuleList[ inv_trans_share.lsmReceive ].Value)  // RECV
     and (ACargo.Source = 'po_expected_receipt')
     and (ACargo.Kind = inv_trans_share.cnstLocatingKind) {LOCATE} then
    ExecuteCommandFmt('update trans_alert set inv_trans_plan_id = %f                                     '+
              ' where source_module = ''RECEIVING''                                              '+
              '   and inv_trans_plan_id is null                                                  '+
              '   and source_id in (select id from po_receipts where po_expected_receipt_id = %f)',
              [ ACargo.InvTransPlan_ID,
                ACargo.Source_ID ])

  // pick ticket
  else if (ACargo.SourceModule = inv_trans_share.PickingSrcModuleList[ inv_trans_share.psmShipment ].Value)   // SHIPMENT
     and (ACargo.Source = 'ps_ticket')
     and (ACargo.Kind = inv_trans_share.cnstPickingKind) {PICK} then
    ExecuteCommandFmt('update trans_alert set inv_trans_plan_id = %f                             '+
              ' where source_module = ''PICKING''                                        '+
              '   and inv_trans_plan_id is null                                          '+
              '   and source_id in (select id from ps_ticket_dtl where ps_ticket_id = %f)',
              [ ACargo.InvTransPlan_ID,
                ACargo.Source_ID ])

  // Staging move out
  else if (ACargo.SourceModule = inv_trans_share.LocatingSrcModuleList[ inv_trans_share.lsmMove ].Value)   // MOVE
     and (ACargo.Source = 'trans_alert')
     and (ACargo.Kind = inv_trans_share.cnstLocatingKind)  {LOCATE} then
    ExecuteCommandFmt('update trans_alert set inv_trans_plan_id = %f where id = %f', [ ACargo.InvTransPlan_ID, ACargo.Trans_Alert_ID ])

  // Staging move in
  else if (ACargo.SourceModule = inv_trans_share.PickingSrcModuleList[ inv_trans_share.psmStaging ].Value)   // STAGING
     and (ACargo.Source = 'trans_alert')
     and (ACargo.Kind = inv_trans_share.cnstPickingKind) {PICK} then
    ExecuteCommandFmt('update trans_alert set inv_trans_plan_id = %f where id = %f', [ ACargo.InvTransPlan_ID, ACargo.Trans_Alert_ID ])
end;


class procedure TFrmInvTransPlanBase.EnsureTransAlertAssigned( ACargo: TInvTransPlanCargo );
begin
  if (ACargo.SourceModule = 'RECV') and (ACargo.Kind = 'LOCATE') and (ACargo.Source = 'po_expected_receipt') then
     // po_expected receipts:
     //    trans_alert.source_id    = po_receipts.id
     //    inv_trans_plan.source_id = po_expected_receipts.id
     // assign all the receipts found in the trans_alert for that po_expected_receipts_id
     AssignTransAlert_Expected_Receipt( ACargo )

  else if (ACargo.SourceModule = 'MOVE') and (ACargo.Kind = 'LOCATE') and (ACargo.Source = 'trans_alert') then
     // move out (aka staging out):
     //    trans_alert.source_id    = null
     //    inv_trans_plan.source_id = trans_alert.id
     // assign the trans_alert.inv_trans_plan_id
     AssignTransAlert_Move_Out( ACargo )

  else if (ACargo.SourceModule = 'SHIPMENT') and (ACargo.Kind = 'PICK') and (ACargo.Source = 'ps_ticket') then
     // pick tickets:
     //    trans_alert.source_id    = ps_ticket_dtl.id
     //    inv_trans_plan.source_id = ps_ticket.id
     // assign all the ps_ticket_dtl(s) found in the trans_alert for that ps_ticket.id
     AssignTransAlert_PickTicket( ACargo )

  else if (ACargo.SourceModule = 'STAGING') and (ACargo.Kind = 'PICK') and (ACargo.Source = 'trans_alert') then
     // move in (aka staging in):
     //    trans_alert.source_id    = null
     //    inv_trans_plan.source_id = trans_alert.id
     // assign the trans_alert.inv_trans_plan_id
     AssignTransAlert_Staging( ACargo )
  else if (ACargo.SourceModule = 'MOVE') and (ACargo.Kind = 'LOCATE') and (ACargo.Source = 'master_label') then
     // IQRF directed move:
     //    trans_alert.source_id    = master_label_id
     //    inv_trans_plan.source_id = master_label_id
     // check/create trans_alert and assign inv_trans_plan_id
     AssignTransAlert_Move_Out_Master_Label( ACargo )

  else if (ACargo.SourceModule = 'RECV') and (ACargo.Kind = 'LOCATE') and (ACargo.Source = 'po_detail') then
     // po_detail:
     //    trans_alert.source_id    = po_detail_id
     //    inv_trans_plan.source_id = po_detail_id
     // assign trans alert inv_trans_plan_id
     AssignTransAlert_PO_Detail( ACargo )

  else if (ACargo.SourceModule = 'RMA') and (ACargo.Kind = 'LOCATE') and (ACargo.Source = 'rma_detail') then
     // rma_detail:
     //    trans_alert.source       = 'rma_detail'
     //    trans_alert.source_id    = rma_detail_id
     //    inv_trans_plan.source_id = rma_detail_id
     // assign trans alert inv_trans_plan_id
     AssignTransAlert_Rma_Detail( ACargo )
end;

class procedure TFrmInvTransPlanBase.AssignTransAlert_Expected_Receipt( ACargo: TInvTransPlanCargo );
begin
  // assign all the receipts found in the trans_alert for that po_expected_receipts_id
  ExecuteCommandFmt('update trans_alert                                     '+
            '   set inv_trans_plan_id = %f                          '+
            ' where id in ( select a.id                             '+
            '                 from trans_alert a,                   '+
            '                      po_receipts r                    '+
            '                where source_module = ''RECEIVING''    '+
            '                   and a.source_id = r.id              '+
            '                   and r.po_expected_receipt_id = %f ) '+
            '   and inv_trans_plan_id is null                       ',
            [ ACargo.InvTransPlan_ID,
              ACargo.Source_ID ]);
end;


class procedure TFrmInvTransPlanBase.AssignTransAlert_Move_Out( ACargo: TInvTransPlanCargo );
begin
  // assign the trans_alert.inv_trans_plan_id
  ExecuteCommandFmt('update trans_alert            '+
            '   set inv_trans_plan_id = %f '+
            ' where id = %f                ',
            [ ACargo.InvTransPlan_ID,
              ACargo.Source_ID ]);
end;


class procedure TFrmInvTransPlanBase.AssignTransAlert_PickTicket( ACargo: TInvTransPlanCargo );
begin
  // assign all the ps_ticket_dtl(s) found in the trans_alert for that ps_ticket.id
  ExecuteCommandFmt('update trans_alert                                     '+
            '   set inv_trans_plan_id = %f                          '+
            ' where id in ( select a.id                             '+
            '                 from trans_alert a,                   '+
            '                      ps_ticket_dtl d                  '+
            '                where a.source_module = ''PICKING''    '+
            '                   and a.source_id = d.id              '+
            '                   and d.ps_ticket_id = %f )           '+
            '   and inv_trans_plan_id is null                       ',
            [ ACargo.InvTransPlan_ID,
              ACargo.Source_ID ]);
end;


class procedure TFrmInvTransPlanBase.AssignTransAlert_Staging( ACargo: TInvTransPlanCargo );
begin
  // assign the trans_alert.inv_trans_plan_id
  ExecuteCommandFmt('update trans_alert            '+
            '   set inv_trans_plan_id = %f '+
            ' where id = %f                ',
            [ ACargo.InvTransPlan_ID,
              ACargo.Source_ID ]);
end;


class procedure TFrmInvTransPlanBase.AssignTransAlert_Move_Out_Master_Label( ACargo: TInvTransPlanCargo );
var
  AParams: TTransAlertParams;      // inv_trans_alert_misc.pas
  ATrans_Alert_ID: Real;
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select m.arinvt_id,               '+
                      '       f.loc_id,                  '+
                      '       m.workorder_id,            '+
                      '       m.qty,                     '+
                      '       m.serial                   '+
                      '  from master_label m, fgmulti f  '+
                      ' where m.id = %f                  '+
                      '   and rf.get_master_label_fgmulti_id( m.id ) = f.id(+)',
                      [ ACargo.Source_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unidentified master_label id = %.0f', [ ACargo.Source_ID ]));

  ATrans_Alert_ID:= GetNextID('trans_alert');
  AParams:= TTransAlerTParams.Create(ATrans_Alert_ID);  // inv_trans_alert_misc.pas
  AParams.Workorder_ID     := A[ 2 ];
  AParams.Sndop_dispatch_ID:= 0;
  AParams.Locations_ID     := A[ 1 ];
  AParams.Inv_Zone_ID      := 0;
  AParams.Arinvt_ID        := A[ 0 ];
  AParams.Qty              := A[ 3 ];
  AParams.Start_Time       := SelectValueAsFloat('select sysdate from dual');
  AParams.Trans_In_Out     := 'OUT';
  AParams.Source_Module    := 'MOVE';
  AParams.Trans_Priority   := inv_trans_share.GetDefaultPriority( AParams.Source_Module );
  AParams.Alert_Descrip    := Format('Directed Move of serial# %s', [ A[4] ]);

  inv_trans_alert_misc.AppenToTransAlert( AParams );

  ExecuteCommandFmt('update trans_alert            '+
            '   set inv_trans_plan_id = %f '+
            ' where id = %f                ',
            [ ACargo.InvTransPlan_ID,
              ATrans_Alert_ID ]);
end;


class procedure TFrmInvTransPlanBase.AssignTransAlert_PO_Detail( ACargo: TInvTransPlanCargo );
begin
  ExecuteCommandFmt('update trans_alert                                     '+
            '   set inv_trans_plan_id = %f                          '+
            ' where id in ( select a.id                             '+
            '                 from trans_alert a                    '+
            '                where source_module = ''RECEIVING''    '+
            '                  and nvl(source,''po_detail'') = ''po_detail'' '+
            '                  and a.source_id = %f )               '+  // source_id is po_detail_id
            '   and inv_trans_plan_id is null                       ',
            [ ACargo.InvTransPlan_ID,
              ACargo.Source_ID ]);
end;


class procedure TFrmInvTransPlanBase.AssignTransAlert_Rma_Detail( ACargo: TInvTransPlanCargo );
begin
  ExecuteCommandFmt('update trans_alert                                     '+
            '   set inv_trans_plan_id = %f                          '+
            ' where id in ( select a.id                             '+
            '                 from trans_alert a                    '+
            '                where source_module = ''RECEIVING''    '+
            '                   and source = ''rma_detail''         '+
            '                   and a.source_id = %f )              '+  // source_id is rma_detail_id
            '   and inv_trans_plan_id is null                       ',
            [ ACargo.InvTransPlan_ID,
              ACargo.Source_ID ]);
end;


procedure TFrmInvTransPlanBase.BOLDataMovementClass1Click(Sender: TObject);
begin
  if TFrmInvBOLParams.DoShowModal(QryInvTransItemARINVT_ID.asFloat ) then  {Inv_Bol_Params.pas}
     RefreshDataSetByID( QryInvTransItem );
end;

procedure TFrmInvTransPlanBase.InventoryTransactionRules1Click(Sender: TObject);
begin
  { TODO -ombaral -cWebIQ : Resolve depemdency
  TFrmInvTransRules.DoShow( self );  // inv_trans_rules.pas
  }
end;

procedure TFrmInvTransPlanBase.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

class procedure TFrmInvTransPlanBase.LoadPlanInputData( AInvTransPlan_ID: Real );
begin
  ExecuteCommandFmt('begin inv_trans_misc.load_data(%f); end;', [ AInvTransPlan_ID ]);
end;

class procedure TFrmInvTransPlanBase.PreparePlanLocations( AInvTransPlan_ID: Real; ARedoUnprocessed: Boolean = FALSE );
begin
  ExecuteCommandFmt('declare                                              '+
            '  v_inv_trans_plan_id number:= %f;                   '+
            '  v_redo_unprocessed boolean:= %s;                   '+
            'begin                                                '+
            '  inv_trans_eval.do_execute( v_inv_trans_plan_id,    '+
            '                             v_redo_unprocessed );   '+
            'end;                                                 ',
            [ AInvTransPlan_ID,
              IQMS.Common.Numbers.sIIf( ARedoUnprocessed, 'true', 'false' )]);
end;

procedure TFrmInvTransPlanBase.RefreshDatasets;
begin
  Reopen(QryInvTransPlan);
end;

procedure TFrmInvTransPlanBase.gridInvPlanItemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if (Field = QryInvTransItemNOTE1) and (QryInvTransItemNOTE1.asString > '')  then
  begin
    (* TODO -ombaral -cWebIQ : Resolve depemdency
    if Highlight then
       IQMS.Common.Screen.AssignColorToFontBrush( AFont, ABrush, clYellow, clBlack )
    else
       IQMS.Common.Screen.AssignColorToFontBrush( AFont, ABrush, clRed, clWindow );
    *)
  end;
end;

procedure TFrmInvTransPlanBase.gridLocCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TUniFont;
  ABrush: TUniCellAttribs);
begin
  if (QryInvTransLocLOCATIONS_ID.asFloat = 0) then
  begin
    if Highlight then
       IQMS.Common.Screen.AssignColorToFontBrush( AFont, ABrush, clYellow, clBlack )
    else
       IQMS.Common.Screen.AssignColorToFontBrush( AFont, ABrush, clRed, clWindow );
  end;
end;

procedure TFrmInvTransPlanBase.wwDBComboDlgNoteCustomDlg(Sender: TObject);
begin
  IQMS.Common.EditMemoStr.DoViewMemoStr(IQMS.Common.StringUtils.StrTran( QryInvTransItemNOTE1.asString, '.', #13 ), 'View Note');
end;


procedure TFrmInvTransPlanBase.JumptoInventoryByLocation1Click(Sender: TObject);
begin
  { TODO -ombaral -cWebIQ : Resolve depemdency
  IQMS.WebVcl.Jump.JumpDirect( iq_JumpToInvByLoc, QryInvTransLocLOCATIONS_ID.asInteger );
  }
end;


procedure TFrmInvTransPlanBase.JumptoInventoryRuleSet1Click(Sender: TObject);
begin
  { TODO -ombaral -cWebIQ : Resolve depemdency
  IQMS.WebVcl.Jump.JumpDirect( iq_JumptoTransactionRuleDetail, QryInvTransLocINV_TRANS_RULE_DETAIL_ID.asInteger );
  }
end;


function TFrmInvTransPlanBase.IsPlanReserved( AInvTransPlan_ID: Real ): Boolean;
begin
  // Result:= SelectValueFmtAsFloat('select 1 from ptorder where reserved_inv_trans_plan_id = %f and rownum < 2', [ AInvTransPlan_ID ]) = 1;
  Result:= inv_trans_share.IsPlanReserved( AInvTransPlan_ID );
end;

procedure TFrmInvTransPlanBase.JumptoLocation1Click(Sender: TObject);
begin
  { TODO -ombaral -cWebIQ : Resolve depemdency
  JumpDirect( iq_JumpToMasterLocation, QryInvTransLocLOCATIONS_ID.asInteger );
  }
end;

procedure TFrmInvTransPlanBase.QryInvTransItemCalcFields(DataSet: TDataSet);
begin
  if QryInvTransItemDIVISION_ID.asFloat > 0  then
    QryInvTransItemDivisionName.asString:= SelectValueByID('NAME', 'DIVISION', QryInvTransItemDIVISION_ID.asFloat);

  if QryInvTransItemINV_TRANS_RULE_ID.asFloat <> 0 then
    QryInvTransItemTransRule.asString := SelectValueByID('NAME', 'INV_TRANS_RULE', QryInvTransItemINV_TRANS_RULE_ID.asFloat);

end;

procedure TFrmInvTransPlanBase.QryInvTransLocCalcFields(DataSet: TDataSet);
begin
  if QryInvTransLocLOCATIONS_ID.asFloat <> 0 then
    QryInvTransLocLocDesc.asString := SelectValueByID('LOC_DESC', 'LOCATIONS', QryInvTransLocLOCATIONS_ID.asFloat);
  if QryInvTransLocINV_TRANS_RULE_DETAIL_ID.asFloat <> 0 then
    QryInvTransLocTransRuleDetailSeq.asFloat :=  SelectValueByID('SEQ', 'INV_TRANS_RULE_DETAIL', QryInvTransLocINV_TRANS_RULE_DETAIL_ID.asFloat);
end;

end.
