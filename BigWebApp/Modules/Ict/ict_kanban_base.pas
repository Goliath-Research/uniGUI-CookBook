unit ict_kanban_base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Vcl.wwDataInspector,
  IQMS.WebVcl.Search,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TFrmKanban_Base = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    NavChild: TUniDBNavigator;
    Panel3: TUniPanel;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtDESCRIP2: TStringField;
    SrcChild: TDataSource;
    QryArinvtMULTIPLE: TBCDField;
    UpdateSQLArinvt: TFDUpdateSQL;
    IQSearchArinvt: TIQUniGridControl;
    TblChild: TFDQuery;
    SR: TIQWebSecurityRegister;
    PkReplenishSrc: TIQWebHPick;
    PkReplenishSrcSHIP_TO: TStringField;
    PkReplenishSrcDIVISION_NAME: TStringField;
    PkReplenishSrcEPLANT_ID: TBCDField;
    PkReplenishSrcMASTER_DISTRIBUTION: TStringField;
    PkReplenishSrcSHIP_TO_ID: TBCDField;
    Splitter1: TUniSplitter;
    sbtnCreateOrder: TUniSpeedButton;
    PkReplenishSrcEPLANT_NAME: TStringField;
    popmDataIns: TUniPopupMenu;
    JumptoSalesOrder1: TUniMenuItem;
    IQJumpSO: TIQWebJump;
    QryArinvtONHAND: TFMTBCDField;
    JumpToInventory1: TUniMenuItem;
    JumptoTransactionsLocations1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    JumptoPhantomBOM1: TUniMenuItem;
    JumptoAutoMRP1: TUniMenuItem;
    QryArinvtAUTO_MRP_REORD_POINT: TBCDField;
    QryArinvtAUTO_MRP_ORDER_QTY: TBCDField;
    QryArinvtAUTO_MRP_LEAD_DAYS: TBCDField;
    QryArinvtAUTO_MRP_FIRM_WO: TStringField;
    QryArinvtAUTO_MRP_INCLUDE_VMI: TStringField;
    QryArinvtAUTO_MRP_INCLUDE_VMI_MFG_CALC: TStringField;
    QryArinvtAUTO_MRP_APPLY_TO_SCHED_ALLOC: TStringField;
    QryArinvtPROCESS_SAFETY_STOCK: TStringField;
    QryArinvtAUTO_MRP_KANBAN_LOT_SIZE: TFMTBCDField;
    QryArinvtAUTO_MRP_EXCLUDE_HARD_ALLOC: TStringField;
    wwDataInspector1: TwwDataInspector;
    wwDBEditQty: TUniDBEdit;
    wwDBEditScope: TUniDBEdit;
    wwDBEditLeadDays: TUniDBEdit;
    wwDBComboDlgReplenishmentSource: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure QryArinvtNewRecord(DataSet: TDataSet);
    procedure ApplyUpdateToTable(DataSet: TDataSet);
    procedure wwDBComboDlgReplenishmentSourceCustomDlg(Sender: TObject);
    procedure sbtnCreateOrderClick(Sender: TObject);
    procedure JumptoSalesOrder1Click(Sender: TObject);
    procedure TblChildAfterPost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure JumptoTransactionsLocations1Click(Sender: TObject);
    procedure popmDataInsPopup(Sender: TObject);
    procedure JumptoPhantomBOM1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    function SiblingItemExistsInOtherEplant( AOtherEplant_ID: Real): Boolean;
    function GetSiblingItemInOtherEplant(AOtherEplant_ID: Real): Real;
    function GetEPlant_ID_Src: Real;
    function ConfirmAddingPhantomBOM: Boolean;
    procedure SetDivision_ID(const Value: Real);
    procedure SetEplant_ID(const Value: Real);
    procedure SetKind(const Value: String);
 protected
    FKind       : string;
    FEplant_ID  : Real;
    FDivision_ID: Real;
    FShip_To_ID_Master_Distribution: Real;
    FOldTriggerQty: Real;

    procedure AssignCaption;
    procedure AssignReplenishFromShip_To_ID(AShip_To_ID: Real); virtual;
    procedure ValidateReplenishFrom(AShip_To_ID: Real);
    procedure AssignShipFromInfo(AShip_to_ID_From: Real; var A: Variant);
    procedure AssignSalesOrderInfo(AShip_to_ID_From: Real; var A: Variant); overload;
    procedure AssignSalesOrderInfo(var A: Variant); overload; virtual; abstract;
    function TriggerQtyExceedsOnHand: Boolean; virtual;
    function ConfirmAddingAutoMRP: Boolean;
    function CreatePhantomBOM: Real;
    property EPlant_ID_Src: Real read GetEPlant_ID_Src;
  public
    { Public declarations }
    property Kind : String write SetKind;
    property Eplant_ID : Real write SetEplant_ID;
    property Division_ID : Real write SetDivision_ID;
    class procedure DoShow( AKind: string; AEplant_ID, ADivision_ID: Real );
    class function SiblingItemInOtherEplant(AClass, AItemno, ARev: string; AOtherEplant_ID: Real): Real; static;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.SysShare,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  ict_share,
  IQMS.Common.HelpHook,
  ict_rscstr;

{ TFrmKanban_Base }

class procedure TFrmKanban_Base.DoShow( AKind: string; AEPlant_ID, ADivision_ID: Real );
var
  LFrmKanban_Base : TFrmKanban_Base;
begin
  LFrmKanban_Base := TFrmKanban_Base.Create(UniGUIApplication.UniApplication);
  with LFrmKanban_Base do
  begin
    Kind := AKind;
    Eplant_ID := AEplant_ID;
    Division_ID := ADivision_ID;
    Show;
  end;
end;

procedure TFrmKanban_Base.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmKanban_Base.AssignCaption;
var
  S1, S2, X: string;
begin
  S1:= ''; S2:= '';
  if FEPlant_ID > 0  then {should be}
     S1:= Format( 'EPlant: %s ',  [SelectValueByID('name', 'eplant', FEPlant_ID)]);

  if FDivision_ID > 0 then
     S2:= 'Division: ' + SelectValueByID('name', 'division', FDivision_ID);

  if S2 > '' then S1:= S1 + ', ';

  Caption:= CheckReplaceDivisionCaption( Format('Setup eKanban %s Trigger [ %s ]', [ FKind, S1 + S2 ]));  {IQMS.Common.SysShare.pas} // Setup Kanban Division Trigger [ Eplant: PASO, Division: WH1 ]
end;

procedure TFrmKanban_Base.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'eplant_id', FEPlant_ID);
end;

procedure TFrmKanban_Base.QryArinvtNewRecord(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmKanban_Base.ApplyUpdateToTable(DataSet: TDataSet);
begin
  try
    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;
end;

procedure TFrmKanban_Base.IQAfterShowMessage(var Msg: TMessage);
begin
  FShip_To_ID_Master_Distribution:= SelectValueAsFloat('select s.id from arcusto a, ship_to s where a.is_intercomp = ''Y'' and a.id = s.arcusto_id and s.default_ship_to = ''Y''');
  if FShip_To_ID_Master_Distribution = 0 then
     IQWarning('Default Master Distribution address is not assigned. This address is used as a default for Replenishment Source. '#13#13'Please use ICT Setup form to assign one.');
end;

procedure TFrmKanban_Base.wwDBComboDlgReplenishmentSourceCustomDlg( Sender: TObject);
begin
  with PkReplenishSrc do
    if Execute then
       AssignReplenishFromShip_To_ID( GetValue('ship_to_id'));
end;

procedure TFrmKanban_Base.AssignReplenishFromShip_To_ID(AShip_To_ID: Real);
begin
 // place holder
end;

procedure TFrmKanban_Base.sbtnCreateOrderClick(Sender: TObject);
begin
  TblChild.CheckBrowseMode;
end;

procedure TFrmKanban_Base.ValidateReplenishFrom( AShip_To_ID: Real );
var
  A: Variant;
begin
  IQAssert( AShip_To_ID > 0, 'Please assign Replenishment Source.');

  A:= SelectValueArrayFmt( 'select eplant_id, division_id from ship_to where id = %f', [ AShip_To_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, 'Invalid Replenishment Source.');

  if (A[ 0 ] = FEplant_ID) and (A[ 1 ] = FDivision_ID) then
     raise Exception.Create('Replenishment Source cannot be the same as target item eKanban trigger is set on.');

  if A[ 0 ] <> FEplant_ID then
     IQAssert( SiblingItemExistsInOtherEplant( A[ 0 ] ), 'This item# is not found in the selected EPlant inventory.' );
end;

procedure TFrmKanban_Base.SetDivision_ID(const Value: Real);
begin
  FDivision_ID := Value;
end;

procedure TFrmKanban_Base.SetEplant_ID(const Value: Real);
begin
  FEplant_ID := Value;
end;

procedure TFrmKanban_Base.SetKind(const Value: String);
begin
  FKind := Value;
end;

function TFrmKanban_Base.SiblingItemExistsInOtherEplant( AOtherEplant_ID: Real ): Boolean;
begin
  Result:= GetSiblingItemInOtherEplant( AOtherEplant_ID ) > 0;
end;

function TFrmKanban_Base.GetSiblingItemInOtherEplant( AOtherEplant_ID: Real ): Real;
begin
  Result:= TFrmKanban_Base.SiblingItemInOtherEplant( QryArinvtCLASS.asString,
                                                     QryArinvtITEMNO.asString,
                                                     QryArinvtREV.asString,
                                                     AOtherEplant_ID );
end;


class function TFrmKanban_Base.SiblingItemInOtherEplant( AClass, AItemno, ARev: string; AOtherEplant_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select id from arinvt where class = ''%s'' and itemno = ''%s'' and NVL(rtrim(rev), '' '') = NVL(''%s'', '' '') '+
                     '   and NVL(eplant_id,0) = NVL(%f,0)',
                     [ AClass, AItemno, ARev, AOtherEplant_ID ]);
end;


procedure TFrmKanban_Base.JumptoSalesOrder1Click(Sender: TObject);
begin
  IQJumpSO.Execute;
end;


procedure TFrmKanban_Base.AssignShipFromInfo( AShip_to_ID_From: Real;  var A: Variant );
begin
  A:= SelectValueArrayFmt( 'select s.attn,                '+
                      '       s.addr1,               '+
                      '       s.addr2,               '+
                      '       s.addr3,               '+
                      '       s.city,                '+
                      '       s.state,               '+
                      '       s.zip,                 '+
                      '       s.country,             '+
                      '       s.default_ship_to,     '+
                      '       s.eplant_id,           '+
                      '       d.name,                '+
                      '       d.id                   '+
                      '  from                        '+
                      '       ship_to s, division d  '+
                      ' where                        '+
                      '       s.id = %f              '+
                      '   and s.division_id = d.id(+)',
                      [ AShip_to_ID_From ]);
end;


procedure TFrmKanban_Base.AssignSalesOrderInfo( AShip_To_ID_From: Real;  var A: Variant );
var
  AShip_To_ID_Trg: Real;
  AArcusto_ID    : Real;
  AEplant_ID_From: Real;
begin
  A:= SelectValueArrayFmt( 'select s.id, a.id from arcusto a, ship_to s           '+
                      ' where s.arcusto_id = a.id and a.is_intercomp = ''Y'' '+
                      '   and NVL(s.eplant_id,0) = NVL(%f,0)                 '+
                      '   and NVL(s.division_id, 0) = NVL(%f, 0)             '+
                      '   and ict_pull.eplant_name_matches_arcusto(%f, a.company ) = 1 '+
                      '   and rownum < 2                                     ',
                      [ FEPlant_ID,
                        FDivision_ID,
                        FEPlant_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  AShip_To_ID_Trg:= A[ 0 ];
  AArcusto_ID    := A[ 1 ];
  EnsureTargetShipToEPlantIsSameAsSource( AArcusto_ID, AShip_To_ID_From, AShip_To_ID_Trg );  {ict_share.pas}

  AEPlant_ID_From:= SelectValueByID('eplant_id', 'ship_to', AShip_To_ID_From );
  A:= SelectValueArrayFmt( 'select o.id, o.orderno, d.id            '+
                      '  from orders o,                        '+
                      '       ord_detail d,                    '+
                      '       arcusto a                        '+
                      ' where                                  '+
                      '       o.arcusto_id = a.id              '+
                      '   and a.is_intercomp = ''Y''           '+
                      '                                        '+
                      '   and o.id = d.orders_id               '+
                      '   and d.ship_to_id_from = %f           '+
                      '                                        '+
                      '   and NVL(o.ship_to_id, 0) = NVL(%f,0) '+
                      '   and d.arinvt_id = %f                 '+
                      '   and nvl(o.type, ''*'')<>''AUTO-MRP'' '+
                      '   and rownum < 2                       ',
                       [ AShip_To_ID_From,
                         AShip_To_ID_Trg,
                         GetSiblingItemInOtherEplant( AEPlant_ID_From )]);
end;


procedure TFrmKanban_Base.TblChildAfterPost(DataSet: TDataSet);
begin
  if TriggerQtyExceedsOnHand then
  begin
    IQConfirm('New Pull Trigger Qty exceeds the OnHand quantity. Trigger will be applied now.');
    sbtnCreateOrder.Click;
  end;
end;

function TFrmKanban_Base.TriggerQtyExceedsOnHand: Boolean;
begin
 Result:= FALSE;  // overwritten in ict_kanban_eplant and ict_kanban_division
end;

procedure TFrmKanban_Base.UniFormShow(Sender: TObject);
begin
   { TODO : 'TIQUniGridControl does not contain a member DBNav' }
   //IQSearchArinvt.DBNav.VisibleButtons:= IQSearchArinvt.DBNav.VisibleButtons + [ nbCancel, nbPost ];

   IQSetTablesActive( TRUE, self );
   IQRegFormRead( self, [ self ]);

   AssignCaption;
   PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmKanban_Base.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmICT{CHM}, iqhtmICT{HTM - obsolete} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmKanban_Base.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;


procedure TFrmKanban_Base.JumptoTransactionsLocations1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToInvTransLocs, QryArinvtID.asInteger );
end;

function TFrmKanban_Base.GetEPlant_ID_Src: Real;
var
  AICT_Ship_To_ID: Real;
begin
  Result:= -1;  // not assigned

  AICT_Ship_To_ID:= 0;

  if TblChild.FindField('ICT_SHIP_TO_ID') <> nil then
     AICT_Ship_To_ID:= TblChild.FieldByName('ICT_SHIP_TO_ID').asFloat

  else if TblChild.FindField('SHIP_TO_ID') <> nil then
     AICT_Ship_To_ID:= TblChild.FieldByName('SHIP_TO_ID').asFloat;

  if AICT_Ship_To_ID = 0 then
     EXIT;

  Result:= SelectValueByID('eplant_id','ship_to', AICT_Ship_To_ID);
end;


procedure TFrmKanban_Base.popmDataInsPopup(Sender: TObject);
begin
  JumptoAutoMRP1.Enabled:= SR.Enabled['JumptoAutoMRP1']
                           and
                           (SelectValueByID('standard_id', 'arinvt', QryArinvtID.asFloat) > 0);

  JumptoPhantomBOM1.Enabled:= SR.Enabled['JumptoPhantomBOM1']
                              and
                              (EPlant_ID_Src > 0) and (FEPlant_ID > 0) and (EPlant_ID_Src <> FEPlant_ID);
end;

function TFrmKanban_Base.ConfirmAddingAutoMRP: Boolean;
begin
  Result:= IQConfirmYNWithSecurity( ict_rscstr.cTXT000001, {'Would you like to create an AutoMRP setup?'}
                                    'ICTSetupConfirmAddingAutoMRP',
                                    TRUE );
end;

function TFrmKanban_Base.ConfirmAddingPhantomBOM: Boolean;
begin
  Result:= IQConfirmYNWithSecurity( ict_rscstr.cTXT000003, {'Would you like to create Phantom BOM?'}
                                    'ICTSetupConfirmAddingPhantomBOM',
                                    TRUE );
end;


procedure TFrmKanban_Base.JumptoPhantomBOM1Click(Sender: TObject);
var
  AStandard_ID: Real;
begin
  AStandard_ID:= SelectValueByID('standard_id', 'arinvt', QryArinvtID.asFloat);

  if (AStandard_ID = 0) and ConfirmAddingPhantomBOM() then
     AStandard_ID:= CreatePhantomBOM;

  if (AStandard_ID = 0) then
     EXIT;

  JumpDirect( iq_JumpToBom, Trunc(AStandard_ID));
end;


function TFrmKanban_Base.CreatePhantomBOM: Real;
var
  ASrcArinvt_ID: Real;  // source, replenishment arinvt
begin
  ASrcArinvt_ID:= SelectValueFmtAsFloat('select ict_pull.get_sibling_arinvt_of( %f, %f ) from dual',
                            [ QryArinvtID.asFloat,      // target arinvt_id
                              EPlant_ID_Src  ]);        // replenishment eplant
  IQAssert( ASrcArinvt_ID > 0, ict_rscstr.cTXT000002 ); // 'Unable to find corresponding item in the replenishment source eplant';

  Result:= GetNextID( 'standard' );
  ExecuteCommandFmt('declare                                           '+
            '  v_trg_standard_id  number::= %f;                '+
            '  v_trg_arinvt_id    number::= %f;                '+
            '  v_src_arinvt_id    number::= %f;                '+
            'begin                                             '+
            '  ict_pull.create_phantom_bom( v_trg_standard_id, '+
            '                               v_trg_arinvt_id,   '+
            '                               v_src_arinvt_id ); '+
            'end;                                              ',
            [ Result,
              QryArinvtID.asFloat,
              ASrcArinvt_ID  ]);

end;


end.
