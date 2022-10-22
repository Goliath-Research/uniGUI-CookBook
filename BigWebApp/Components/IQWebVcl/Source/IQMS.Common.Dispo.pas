unit IQMS.Common.Dispo;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.Forms, FireDAC.Comp.Client, FireDAC.Phys,IQMS.Common.TransMisc;

const
    cnstEXCL_TYPES0 = ' exists (select 1 from locations where id = fgmulti.loc_id and NVL(VMI,''N'') <> ''Y'')' ;

    cnstEXCL_TYPES0_A = ' (fgmulti.non_conform_id is NULL or fgmulti.non_conform_id is not null and fgmulti.non_conform_allocatable = ''Y'') and ' +
                        cnstEXCL_TYPES0;

    cnstEXCL_TYPES1 = ' (fgmulti.non_conform_id is NULL or fgmulti.non_conform_id is not null and fgmulti.non_conform_allocatable = ''Y'') and ' +
                      ' exists (select 1 from locations where id = fgmulti.loc_id and NVL(no_backflush,''N'') <> ''Y'') and ' +
                       cnstEXCL_TYPES0;

    cnstEXCL_HARD_ALLOC_0 = ' and not exists (select 1 from workorder_bom_mat_loc where fgmulti_id = fgmulti.id) ';

    cnstEXCL_HARD_ALLOC = ' not exists (select 1 from workorder_bom_mat_loc where fgmulti_id = fgmulti.id) '+
                          ' and mto.is_relieve_location_valid( %f, fgmulti.id ) = 1 ';

    cnstCHECK_EXCL_IN_TRANSIT = 'decode( %f, 0, 0, 1 ) = decode( nvl(in_transit_origin, 0), 0, 0, 1 )';

    cnstEXCL_IN_TRANSIT = ' and nvl(in_transit_origin, 0) = 0 ';

var
  // before calling the wrappers under inv trans control assign these vars and reset back in the try-finally
  // using EnableInvTransPlan/DisableInvTransPlan procs
  UseInvTransPlan         : Boolean;
  InvTransPlanLocations_ID: Real;
  InvTransPlanLotNo       : string;
  InvTransPlanExcludeList : TStringList;
  procedure AddToExcludeList( AFGMulti_ID: Real );

// inv trans plan
procedure ActivateInvTransPlan( ALocations_ID: Real; ALotNo: string );
procedure DeactivateInvTransPlan;

type
  // 12-02-2014 same as in Trans_Share. Reintroduced here to avoid linking in trans_share due to ComServ restriction in IQVCL
  TOnHandTransConsumedEx = procedure( AFGMulti_ID: Real; var AOnHand, ARgOnHand: Real) of object;

type
  TFGMultiFIFO = class
    FGMulti_ID: Real;
    Qty       : Real;
    RG_Qty    : Real;
    constructor Create( AID, AQty, ARG_Qty: Real );
  end;

type
  TArinvtCargo = record
    Arinvt_ID: Real;
    IsPhantom: Boolean;
    IsDrivePhantomNegative: Boolean;
    constructor Create(AArinvt_ID: Real);
  end;

function GetAutoDispoFGMultiID( AArinvt_ID,
                                AStandard_ID: Real;
                                ADefaultLocation,
                                ALot: string;
                                AWork_Center_ID: Real;
                                ADivision_ID: Real = 0;
                                AWorkorder_ID: Real = 0;
                                AOrd_Detail_ID: Real = 0;
                                ASub_Batch: Real = 0 ): Real;

function GetAutoDispo_Default_FGMultiID( AArinvt_ID,
                                         AStandard_ID: Real;
                                         ADefaultLocation,
                                         ALotNo: string;
                                         AWork_Center_ID: Real;
                                         ADivision_ID: Real = 0;
                                         AOrd_Detail_ID: Real = 0;
                                         ASub_Batch: Real = 0 ): Real;

procedure GetAutoDispoFGMultiFIFO( AList: TList;
                                   AQty, ARG_Qty, AArinvt_ID, AStandard_ID: Real;
                                   ADefaultLocation: string;
                                   AWork_Center_ID: Real;
                                   ADivision_ID: Real = 0;
                                   AInclude_All_Locations: Boolean = FALSE;
                                   AMandatoryLotNo: string = '';
                                   AShipment_Dtl_ID_In_Transit: Real = 0;
                                   AWorkorder_ID: Real = 0;
                                   AOnHandTransConsumed: TOnHandTransConsumedEx = nil;  // same as in trans_share.pas
                                   AInTransitArcusto_ID: Real = 0 );

procedure GetAutoShipFGMultiFIFO( AList: TList; AQty, ARG_Qty, AArinvt_ID: Real; ADivision_ID: Real; AMake_To_Order_Detail_ID: Real = 0 );

procedure GetReworkFGMultiFIFO( AList: TList; AQty, ARG_Qty, AArinvt_ID, APtorder_ID, ADivision_ID: Real );

// Adds a new location. ADivisionID and AEplantID may be 0.
procedure AddLocation(const ALocDesc: String; const ADivisionID,
 AEplantID: Real; var ANewLocationID: Real);

// returns location ID value
function GetLocationsID(const ALocDesc: String; const ADivisionID: Real = 0; AEplantID: Real = 0; ASuggestedLocations_ID: Real = 0): Real;

// raises exception if location exists
procedure CheckLocationExists(const ALocDesc: String; const ADivisionID,
 AEplantID: Real);

function GetMfgType_Locations_ID( AKind: string; AStandard_ID, AArinvt_ID,  AWorkorder_ID: Real ): Real;
function GetMfgCell_Locations_ID( AKind: string; AStandard_ID: Real ): Real;

function EnsureMasterLocationExists( ALoc_Desc: string; ADivision_ID: Real = 0; AEPlant_ID: Real = 0): Real;
function EnsureNonConformCodeExists( ACode: string; ADescrip: string = ''): Real;
function HasWorkorderBOM( AWorkorder_ID: Real ): Boolean;
procedure CheckDeleteEmptyFgmultiUsingSubBatch( AFGMulti_ID, ASub_Batch: Real );
function IsFloorDispoOutAddedToCalcUsage( AWorkorder_ID: Real ): Boolean;
procedure AppendToListFromQueryEx( AList: TList;
                                   ACount,
                                   AQty,
                                   ARG_Qty: Real;
                                   AQuery: TFDQuery;
                                   AInclude_All_Locations: Boolean = FALSE;
                                   AOnHandTransConsumed: TOnHandTransConsumedEx = nil );   // same as in trans_share.pas
implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  System.Variants;

const
    cnstDEF_DISPO_Y = 'Y';
    cnstDEF_DISPO_N = 'N';

{Aux functions}
// moved to IQLib
// function Where( S: string; const Params: array of variant ): string; forward;
// function GetValFmtWhere( SQL: string; const Params: array of variant): Real; forward;
function NVL( S, ADefault: string ): string; forward;
procedure AppendToListFromQuery( AList: TList;
                                 ACount,
                                 AQty,
                                 ARG_Qty: Real;
                                 S: string;
                                 AInclude_All_Locations: Boolean = FALSE;
                                 AOnHandTransConsumed: TOnHandTransConsumedEx = nil ); forward;  // same as in trans_share.pas
procedure AssignPotentialMakeToOrderDetail_ID( AWorkorder_ID: Real; var AOrd_Detail_ID: Real ); forward;

function _CheckRestrictToInvTransPlan: string; forward;
function _ChecRestrictLocationToInvTransPlan( AControling_Locations_ID: Real): Real; forward;
function _CheckIncludePhantom( AArinvtCargo: TArinvtCargo ): string; forward;


procedure CheckAssignWorkCenterDivision_ID( var ADivision_ID: Real; AWork_Center_ID: Real ); forward;



function AssignNewFgMulti( AArinvt_ID,
                           ALoc_ID: Real;
                           const ALot: string;
                           AIsDefaultDispo: string = 'N';
                           AOrd_Detail_ID: Real = 0;
                           ASub_Batch: Real = 0 ): Real;
begin
  Result:= GetNextID('fgmulti');
  ExecuteCommandFmt('insert into fgmulti (id, arinvt_id, loc_id, lotno, auto_dispo_default_loc, created_by_sub_batch) '+
            'values( %f, %f, %f, ''%s'', ''%s'', %s)',
            [ Result,
              AArinvt_ID,
              ALoc_ID,
              ALot,
              AIsDefaultDispo,
              IQMS.Common.StringUtils.FloatToStr0asNull( ASub_Batch, 'null')]);

  if AOrd_Detail_ID > 0 then
     AssignFGMultiMakeToOrderDetailFromOrdDetailEx( Result, AOrd_Detail_ID );
end;

function AssignNewFgMultiLike( AArinvt_ID,
                               ALoc_ID: Real;
                               const ALot: string;
                               ALikeFGMulti_ID: Real;
                               AOrd_Detail_ID: Real = 0;
                               ASub_Batch: Real = 0 ): Real;
var
  A: Variant;
begin
  Result:= GetNextID('fgmulti');
  ExecuteCommandFmt('insert into fgmulti (id, arinvt_id, loc_id, lotno, auto_dispo_default_loc, auto_dispo_standard_id, ship_default, created_by_sub_batch ) '+
            'select  %f, %f, %f, ''%s'', auto_dispo_default_loc, auto_dispo_standard_id, ship_default, %s ' +
            '  from fgmulti where id = %f',
            [ Result,
              AArinvt_ID,
              ALoc_ID,
              ALot,
              IQMS.Common.StringUtils.FloatToStr0asNull( ASub_Batch, 'null'),
              ALikeFGMulti_ID ]);

  if AOrd_Detail_ID > 0 then
     AssignFGMultiMakeToOrderDetailFromOrdDetailEx( Result, AOrd_Detail_ID );

  {kill new (empty) fgmulti if we need to replicate it}
  if ASub_Batch > 0 then
     CheckDeleteEmptyFgmultiUsingSubBatch( ALikeFGMulti_ID, ASub_Batch );
end;

function SelectControllingLocation( AWork_Center_Loc_ID, AMfgCell_Locations_ID, AMfgType_Locations_ID: Real ): Real; forward;


//procedure CheckAvoidVMI( var AFGMulti_ID: Real );
//begin
//  if SelectValueFmtAsString('select l.VMI from locations l, fgmulti f where f.id = %f and f.loc_id = l.id', [ AFGMulti_ID ]) = 'Y' then
//     AFGMulti_ID:= 0;
//end;

{ ----------------------------------------------------------------------------- }
{ For IN Transaction                                                            }
{ ----------------------------------------------------------------------------- }

{Called from AutoDispo for IN trans}
function GetAutoDispoFGMultiID( AArinvt_ID,
                                AStandard_ID: Real;
                                ADefaultLocation,
                                ALot: string;
                                AWork_Center_ID: Real;
                                ADivision_ID: Real = 0;
                                AWorkorder_ID: Real = 0;
                                AOrd_Detail_ID: Real = 0;
                                ASub_Batch: Real = 0 ): Real;
var
  ALoc_ID    : Real;
  AUniqueDate: string;
  APossibleFGMulti_ID: Real;
  AMake_To_Order_Detail_ID: Real;
begin
  {between passed AWorkorder_ID and AOrd_Detail_ID figure out the Make_To_Order_Detail_ID. Normally we either pass Workorder_id or Ord_detail_id}
  AssignPotentialMakeToOrderDetail_ID( AWorkorder_ID, AOrd_Detail_ID );

  {GetFGMultiID}
  APossibleFGMulti_ID:= GetAutoDispo_Default_FGMultiID( AArinvt_ID,
                                                        AStandard_ID,
                                                        ADefaultLocation,
                                                        ALot,
                                                        AWork_Center_ID,
                                                        ADivision_ID,
                                                        AOrd_Detail_ID,
                                                        ASub_Batch );
  Result:= APossibleFGMulti_ID;

  {Location ID}
  ALoc_ID:= SelectValueFmtAsFloat('select loc_id from fgmulti where id = %f', [ Result ]);

  // if (ALot > '') then
  if CompareText(ALot, SelectValueFmtAsString('select lotno from fgmulti where id = %f', [ APossibleFGMulti_ID ])) <> 0 then
  begin
    {Does this location+lot already exists}
    if ALot > '' then
       Result:= SelectValue( Where( Format( 'select id from fgmulti where RTrim(lotno) = ''%s'' and '+ cnstEXCL_TYPES0, [Trim( ALot )] ),  [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'loc_id', ALoc_ID ]))
    else
       Result:= SelectValue( Where( 'select id from fgmulti where lotno is NULL and '+ cnstEXCL_TYPES0,  [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'loc_id', ALoc_ID ]));

    if Result = 0 then
    begin
       Result:= AssignNewFgMultiLike( AArinvt_ID, ALoc_ID, ALot, APossibleFGMulti_ID, AOrd_Detail_ID, ASub_Batch );
       EXIT;
    end;
  end;

  {Unique Date}
  AUniqueDate:= SelectValueFmtAsString('select unque_date_in from arinvt where id = %f', [ AArinvt_ID ]);

  {If Unique is turned ON - create new locaiton if OnHand > 0}
  if (AUniqueDate = 'Y') and ( SelectValueFmtAsFloat('select onhand from fgmulti where id = %f', [ Result ]) <> 0 ) then
     Result:= AssignNewFgMultiLike( AArinvt_ID, ALoc_ID, ALot, Result, AOrd_Detail_ID, ASub_Batch );
end;


{Called from GetAutoDispoFGMultiID}
function GetAutoDispo_Default_FGMultiID( AArinvt_ID,
                                         AStandard_ID: Real;
                                         ADefaultLocation,
                                         ALotNo: string;
                                         AWork_Center_ID: Real;
                                         ADivision_ID: Real = 0;
                                         AOrd_Detail_ID: Real = 0;
                                         ASub_Batch: Real = 0 ): Real;
var
  ALoc_ID                : Real;
  S                      : string;
  AWork_Center_Loc_ID    : Real;
  AMfgType_Locations_ID  : Real;
  AControling_Locations_ID: Real;
  AMfgCell_Locations_ID  : Real;
begin
  ALotNo:= Trim(ALotNo);    // 01-21-2014

  {Designated Location_ID in Work_Center}
  AWork_Center_Loc_ID     := SelectValueByID('locations_id_in', 'work_center', AWork_Center_ID);
  AMfgCell_Locations_ID   := GetMfgCell_Locations_ID( 'IN', AStandard_ID );
  AMfgType_Locations_ID   := GetMfgType_Locations_ID( 'IN', AStandard_ID, AArinvt_ID, 0 {AWorkorder_ID} );
  AControling_Locations_ID:= SelectControllingLocation( AWork_Center_Loc_ID, AMfgCell_Locations_ID, AMfgType_Locations_ID );
  CheckAssignWorkCenterDivision_ID( ADivision_ID, AWork_Center_ID );

  // 05-06-2013 inv_trans_plan
  AControling_Locations_ID:= _ChecRestrictLocationToInvTransPlan( AControling_Locations_ID );

  {Modify default Location 'Temporary' to reflect Designated Location_ID in Work_Center or MfgType}
  if AControling_Locations_ID > 0 then
     ADefaultLocation:= SelectValueByID( 'loc_desc', 'locations', AControling_Locations_ID );

  // 04-08-2016 EIQ-11593 Assembly Track - New locations being created per final assembly transaction - Amesbury Group
  // Find AControling_Locations_ID taking into account logged-in eplant
  if AControling_Locations_ID > 0 then
    AControling_Locations_ID:= GetLocationsID( ADefaultLocation, ADivision_ID, SecurityManager.EPlant_ID_AsFloat, AControling_Locations_ID );

  {designated standard_id and lotno match}
  Result:= SelectValueAsFloat(   Where('select id from v_fgmulti_ex fgmulti where '+ cnstEXCL_TYPES0,  ['arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'NVL(RTrim(lotno),''*'')', NVL(ALotNo, '*')]) // cnstEXCL_TYPES0_A 08-02-2010
                   +       '   and exists ('
                   + Where('select 1 from fgmulti_dispo_bom where fgmulti_id = fgmulti.id', [ 'standard_id', AStandard_ID ])
                   + ')'
                   + IQFormat('  and MTO.is_dispo_location_valid_ex( %f, id ) = 1', [ AOrd_Detail_ID ])
                   + cnstEXCL_IN_TRANSIT
                   + cnstEXCL_HARD_ALLOC_0
                   + _CheckRestrictToInvTransPlan());
  if Result > 0 then EXIT;

  {just designated standard_id - ignore lotno - if any fgmulti is found it is going to be used to create new fgmulti - see caller GetAutoDispoFGMultiID}
  Result:= SelectValueAsFloat(   Where('select id from v_fgmulti_ex fgmulti where '+ cnstEXCL_TYPES0,  ['arinvt_id', AArinvt_ID, 'division_id', ADivision_ID ])  // cnstEXCL_TYPES0_A 08-02-2010
                   +       '   and exists ('
                   + Where('select 1 from fgmulti_dispo_bom where fgmulti_id = fgmulti.id', [ 'standard_id', AStandard_ID ])
                   + ')'
                   + IQFormat('  and MTO.is_dispo_location_valid_ex( %f, id ) = 1', [ AOrd_Detail_ID ])
                   + cnstEXCL_IN_TRANSIT
                   + cnstEXCL_HARD_ALLOC_0
                   + _CheckRestrictToInvTransPlan());
  if Result > 0 then EXIT;

  {designated default_loc and lot#}
  Result:= SelectValueAsFloat( Where( 'select id from v_fgmulti_ex fgmulti where auto_dispo_default_loc = ''Y'' and '+ cnstEXCL_TYPES0  // cnstEXCL_TYPES0_A 07-22-2010 - allow non_conform
                 + IQFormat('   and MTO.is_dispo_location_valid_ex( %.0f, id ) = 1', [ AOrd_Detail_ID ])
                 + cnstEXCL_IN_TRANSIT
                 + cnstEXCL_HARD_ALLOC_0
                 + _CheckRestrictToInvTransPlan(),
                 [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'NVL(RTrim(lotno),''*'')', NVL(ALotNo, '*') ]));
  if Result > 0 then EXIT;

  {designated default_loc in fifo order (ignore lot# for now - we will create later new fgmulti with exact lot# if needed) }
  Result:= SelectValueAsFloat( Where('select id from v_fgmulti_ex fgmulti where auto_dispo_default_loc = ''Y'' and '+ cnstEXCL_TYPES0  // cnstEXCL_TYPES0_A 07-22-2010 - allow non_conform
                 + IQFormat('   and MTO.is_dispo_location_valid_ex( %.0f, id ) = 1', [ AOrd_Detail_ID ])
                 + cnstEXCL_IN_TRANSIT
                 + cnstEXCL_HARD_ALLOC_0
                 + _CheckRestrictToInvTransPlan(),
                 [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID  ]) + ' order by in_date' );
  if Result > 0 then EXIT;

  {designated location_id in Work_Center or mfgtype}
  Result:= SelectValueAsFloat( Where( 'select id from v_fgmulti_ex fgmulti where '
                 // Unknown Date: cnstEXCL_TYPES1 replaced with cnstEXCL_TYPES0_A to exclude non-conforming but allow no_backflush
                 // 01-04-2011  : cnstEXCL_TYPES0_A is replaced with cnstEXCL_TYPES0 if AControling_Locations_ID > 0. CRM #478273
                 + IIf( AControling_Locations_ID > 0, cnstEXCL_TYPES0, cnstEXCL_TYPES0_A )
                 + IQFormat('   and MTO.is_dispo_location_valid_ex( %.0f, id ) = 1', [ AOrd_Detail_ID ])
                 + cnstEXCL_IN_TRANSIT
                 + cnstEXCL_HARD_ALLOC_0
                 + _CheckRestrictToInvTransPlan(),
                 [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'loc_id', AControling_Locations_ID, 'NVL(RTrim(lotno),''*'')', NVL(ALotNo, '*') ]));
  if Result > 0 then EXIT;

  {in fifo order}
  Result:= SelectValueAsFloat( Where( 'select id from v_fgmulti_ex fgmulti where rownum < 2 and ' + cnstEXCL_TYPES0_A
                 + IQFormat('   and MTO.is_dispo_location_valid_ex( %.0f, id ) = 1', [ AOrd_Detail_ID ])
                 + cnstEXCL_IN_TRANSIT
                 + cnstEXCL_HARD_ALLOC_0
                 + _CheckRestrictToInvTransPlan(),
                 [ 'arinvt_id', AArinvt_ID, 'loc_id', AControling_Locations_ID, 'division_id', ADivision_ID, 'NVL(RTrim(lotno),''*'')', NVL(ALotNo, '*') ]) + ' order by in_date' );
  if Result > 0 then EXIT;

  {No locations found - try default location description}
  //ALoc_ID:= GetValFmtWhere( Format('select id from v_locations where loc_desc = ''%s''', [ ADefaultLocation ]), [ 'division_id', ADivision_ID ]);
  ALoc_ID := GetLocationsID( ADefaultLocation, ADivision_ID, SecurityManager.EPlant_ID_AsFloat, AControling_Locations_ID );

  if ALoc_ID = 0 then
  begin
     if ADivision_ID > 0 then
        ADefaultLocation:= UpperCase( Copy( Format('%s-%s',
         [IQMS.Common.StringUtils.FixStr(ADefaultLocation), SelectValueByID( 'name', 'division', ADivision_ID )]), 1, 30));

     if (ADivision_ID > 0) and (AControling_Locations_ID > 0) then
        {  'While processing item, %s, (IN-Tran) the following mismatch occured:'#13#13 +
           'Work Center, %s, is assigned default dispo location, %s.   However, ' +
           'this location is not available for division, %s.  '#13#13 +
           'Work Center default dispo location is ignored and default '+
           'location, %s, based on division mentioned above is used instead';  }
        IQWarning(Format( IQMS.Common.ResStrings.cTXT0000087,
                         [ SelectValueByID( 'RTrim(itemno) || '' ( Rev: '' || RTrim(rev) || '' )''', 'arinvt', AArinvt_ID ),
                           SelectValueByID( 'eqno',     'work_center', AWork_Center_ID     ),
                           SelectValueByID( 'loc_desc', 'locations',   AControling_Locations_ID ),
                           SelectValueByID( 'name',     'division',    ADivision_ID        ),
                           IQMS.Common.StringUtils.FixStr(ADefaultLocation)]));

     {now check without AControling_Locations_ID or Division_ID}
     //ALoc_ID := iqlib.SelectValueParam('select id from v_locations where loc_desc = :LOC_DESC',
     //  ['LOC_DESC'],[ADefaultLocation]);
     ALoc_ID := GetLocationsID(ADefaultLocation, 0 {ADivision_ID}, SecurityManager.EPlant_ID_AsFloat, AControling_Locations_ID);
  end;

  {create location in the master locations table}
  if ALoc_ID = 0 then
     AddLocation(ADefaultLocation, ADivision_ID,
       SecurityManager.EPlant_ID_AsFloat, ALoc_ID); // see below

  {Create fgmulti location}
  Result:= AssignNewFgMulti( AArinvt_ID, ALoc_ID, ALotNo, cnstDEF_DISPO_N, AOrd_Detail_ID, ASub_Batch );
end;

procedure CheckLocationExists(const ALocDesc: String; const ADivisionID,
 AEplantID: Real);
var
   ASQL, ADivisionName, AEPlantName: String;
begin
  if GetLocationsID(ALocDesc, ADivisionID, AEplantID) > 0 then
     begin
       ADivisionName := Trim(SelectValueFmtAsString('select name from division where id = %.0f',[ADivisionID]));
       if ADivisionName = '' then ADivisionName := IQMS.Common.ResStrings.cTXT0000355; // '(None)';
       AEPlantName := Trim(SelectValueFmtAsString('select name from eplant where id = %.0f',[AEplantID]));
       if AEPlantName = '' then AEPlantName := IQMS.Common.ResStrings.cTXT0000355; // '(None)';

       {'Location already exists.  Cannot add location.'#13#13 +
        ' Location Description:  %s'#13 +
        ' Division: %s [%.0f]'#13 +
        ' EPlant: %s [%.0f]'}
       raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000354        ,
        [ALocDesc,
         ADivisionName,ADivisionID,
         AEPlantName,AEplantID]);
      end;
end;

function GetLocationsID(const ALocDesc: String; const ADivisionID: Real = 0; AEplantID: Real = 0; ASuggestedLocations_ID: Real = 0): Real;

var
   ASQL: TStringList;
   A: Variant;
begin
  // if we know the exact id - validate and accept it
  if ASuggestedLocations_ID > 0 then
  begin
    A:= SelectValueArrayFmt( 'select loc_desc, division_id, eplant_id from locations where id = %f', [ ASuggestedLocations_ID ]);
    if (VarArrayDimCount( A ) > 0)
       and
       (ALocDesc = A[ 0 ])
       and
       (( ADivisionID = 0 ) or (ADivisionID > 0) and (ADivisionID = A[ 1 ]))
       and
       (( AEPlantID = 0 ) or (AEPlantID > 0) and (AEPlantID = A[ 2 ])) then
    begin
      Result:= ASuggestedLocations_ID;
      EXIT;
    end;
  end;

  try
     try
        ASQL := TStringList.Create;

        // Get the SQL
        ASQL.Add('select id from locations');
        //ASQL.Add('where loc_desc = :LOC_DESC');
        ASQL.Add(Format('where loc_desc = ''%s''',[IQMS.Common.StringUtils.FixStr(ALocDesc)]));
        if ADivisionID > 0 then
           ASQL.Add(Format('and division_id = %.0f',[ADivisionID]));
        if AEplantID > 0 then
           ASQL.Add(Format('and eplant_id = %.0f',[AEplantID]));

        // Run SQL - add new location
        //Result := SelectValueParam(ASQL.Text,['LOC_DESC'],[ALocDesc]);
        Result := SelectValueAsFloat(ASQL.Text);
     finally
       if Assigned(ASQL) then ASQL.Free;
     end;
  except on E:Exception do
   // 'Encountered error retrieving location:'#13'%s'
   raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000353,[E.Message]);
  end;
end;

procedure AddLocation(const ALocDesc: String; const ADivisionID,
 AEplantID: Real; var ANewLocationID: Real);
var
   ASQL: String;
begin

  // check if location exists, or we will hit an ugly constraint
  CheckLocationExists(ALocDesc, ADivisionID, AEplantID); // see above

  try
     // get new ID
     ANewLocationID:= GetNextID('LOCATIONS');

     // Get the SQL
     ASQL := Format('insert into locations (id, loc_desc, division_id, eplant_id) '#13 +
      'values (%.0f, :LOC_DESC, decode(NVL(%.0f,0),0,NULL,%.0f), ' +
      'decode(NVL(%.0f,0),0,NULL,%.0f))',
      [ANewLocationID, ADivisionID, ADivisionID, AEplantID, AEplantID]);

     // Run SQL - add new location
     ExecuteCommandParam(ASQL,['LOC_DESC'],[ALocDesc]);

  except on E:Exception do
   // 'Encountered error adding new location:'#13'%s'
   raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000352,[E.Message]);
  end;
end;

{ ----------------------------------------------------------------------------- }

{ TFGMultiFIFO }

constructor TFGMultiFIFO.Create( AID, AQty, ARG_Qty: Real );
begin
  FGMulti_ID:= AID;
  Qty       := AQty;
  RG_Qty    := ARG_Qty;
end;


{ ---------------------------------------------------------------------------- }
{ For OUT transaction                                                          }
{ ---------------------------------------------------------------------------- }

function NVL( S, ADefault: string ): string;
begin
  if S > '' then
     Result:= S
  else
     Result:= ADefault
end;

procedure CheckProcessNegativeBackflush( AList: TList; var AQty, ARG_Qty: Real; AFGMulti_ID: Real );
begin
  if AQty < 0 then
  begin
     AList.Add( TFGMultiFIFO.Create( AFGMulti_ID, AQty, 0 ));
     AQty:= 0;
  end;

  if ARG_Qty < 0 then
  begin
     AList.Add( TFGMultiFIFO.Create( AFGMulti_ID, 0, ARG_Qty ));
     ARG_Qty:= 0;
  end;
end;

procedure GetAutoDispoFGMultiFIFO( AList: TList;
                                   AQty, ARG_Qty, AArinvt_ID, AStandard_ID: Real;
                                   ADefaultLocation: string;
                                   AWork_Center_ID: Real;
                                   ADivision_ID: Real = 0;
                                   AInclude_All_Locations: Boolean = FALSE;
                                   AMandatoryLotNo: string = '';
                                   AShipment_Dtl_ID_In_Transit: Real = 0;
                                   AWorkorder_ID: Real = 0;
                                   AOnHandTransConsumed: TOnHandTransConsumedEx = nil;  // same as in trans_share.pas
                                   AInTransitArcusto_ID: Real = 0 );                    // arcusto we ship to in case of outsource
var
  S                       : string;
  ALoc_ID                 : Real;
  ACount                  : Real;
  I                       : Real;
  AWork_Center_Loc_ID     : Real;
  AMfgType_Locations_ID   : Real;
  AMfgCell_Locations_ID   : Real;
  AControling_Locations_ID: Real;
  // AInTransitWorkorder_ID  : Real;
  // AInTransitPartno_ID     : Real;
  A                       : Variant;
  AUniqueDispoLoc         : Boolean;
  AOrd_Detail_ID          : Real;
  AArinvtCargo            : TArinvtCargo;
  AAcceptInTransit        : Real;

  function _order_by: string;
  begin
    if AUniqueDispoLoc then
      Result:= ' order by id'
    else
      Result:= ' order by in_date';
  end;

begin
  {Designated Location_ID in Work_Center}
  AWork_Center_Loc_ID     := SelectValueByID('locations_id', 'work_center', AWork_Center_ID);
  AMfgCell_Locations_ID   := GetMfgCell_Locations_ID( 'OUT', AStandard_ID );
  AMfgType_Locations_ID   := GetMfgType_Locations_ID( 'OUT', AStandard_ID, AArinvt_ID,  AWorkorder_ID );
  AControling_Locations_ID:= SelectControllingLocation( AWork_Center_Loc_ID, AMfgCell_Locations_ID, AMfgType_Locations_ID );
  AUniqueDispoLoc         := IsUniqueDispoLocOnMoveEx(AArinvt_ID); // SelectValueFmtAsString('select unique_dispo_loc from arinvt where id = %f', [ AArinvt_ID ]) = 'Y';
  AOrd_Detail_ID          := 0;
  CheckAssignWorkCenterDivision_ID( ADivision_ID, AWork_Center_ID );

  // 05-06-2013 inv_trans_plan
  AControling_Locations_ID:= _ChecRestrictLocationToInvTransPlan( AControling_Locations_ID );

  {Modify default Location 'Temporary' to reflect Designated Location_ID in Work_Center or MfgType}
  if AControling_Locations_ID > 0 then
     ADefaultLocation:= SelectValueByID('loc_desc', 'locations', AControling_Locations_ID);

  // 04-08-2016 EIQ-11593 Assembly Track - New locations being created per final assembly transaction - Amesbury Group
  // Find AControling_Locations_ID taking into account logged-in eplant
  if AControling_Locations_ID > 0 then
    AControling_Locations_ID:= GetLocationsID( ADefaultLocation, ADivision_ID, SecurityManager.EPlant_ID_AsFloat, AControling_Locations_ID );

   if (AInTransitArcusto_ID = 0) and (AShipment_Dtl_ID_In_Transit > 0) then
      AInTransitArcusto_ID:= SelectValueFmtAsFloat('select trans_share.get_shipment_arcusto_id( %f ) from dual', [ AShipment_Dtl_ID_In_Transit ]);
   AAcceptInTransit:= BoolToNum( (AInTransitArcusto_ID > 0) or (AShipment_Dtl_ID_In_Transit > 0));

  AArinvtCargo:= TArinvtCargo.Create( AArinvt_ID );

  {Get in transit workorder_id and in transit partno_id}
  // 10-17-2014 EIQ-4388 commented out to support the same outsource vendor as oppose to same workorder.
  //                     oe_drop_ship.same_in_transit_workorder is replaced with trans_share.same_in_transit_vendor
  // AInTransitWorkorder_ID:= 0;
  // AInTransitPartno_ID   := 0;
  // if AShipment_Dtl_ID_In_Transit > 0 then
  // begin
  //   A:= SelectValueArrayFmt( 'select od.in_transit_workorder_id, od.in_transit_partno_id from shipment_dtl sd, ord_detail od where sd.id = %f and sd.order_dtl_id = od.id', [ AShipment_Dtl_ID_In_Transit ]);
  //   if VarArrayDimCount( A ) > 0 then
  //   begin
  //     AInTransitWorkorder_ID:= A[ 0 ];
  //     AInTransitPartno_ID   := A[ 1 ];
  //   end;
  // end;

  {08-11-2010 Comment inre transit shipment_dtl_id and Outsource BOM with drop ship:
    Ship 2 parts A and B to vendor and receive back X.
    The 2 parts A & B are on diffetent shipment_dtl thus when receiving part X and trying to consume A & B the passed shipment_dtl_id_in_transit belongs to A or B.
    To allow consuming both parts A & B I wrote a special backend function oe_drop_ship.same_in_transit_workorder that compares the workorder_id in transit and
    allows to consume both parts A & B even though the shipment_dtl_id_in_transit of one of them does NOT match the passed shipment_dtl_id_in_transit.
    Since both parts are for the same workorder it should be allowed.}

  {hard allocation}
  if (AWorkorder_ID > 0) and (SelectValueFmtAsFloat( 'select wo_bom.is_anything_allocated( %f, %f ) from dual', [ AWorkorder_ID, AArinvt_ID ]) = 1) then
  begin
    ACount:= SelectValueAsFloat( Where( 'select count(*) from v_fgmulti_ex fgmulti where '
                            + IQFormat(' wo_bom.filter_hard_alloc_fgmulti( %f, %f, fgmulti.id ) = 1 ', [ AWorkorder_ID, AArinvt_ID ])
                            + _CheckIncludePhantom( AArinvtCargo )
                            + _CheckRestrictToInvTransPlan(),
                            [ 'arinvt_id', AArinvt_ID ]));

    S:= Where( 'select id, onhand, rg_onhand from v_fgmulti_ex fgmulti where '
               + IQFormat(' wo_bom.filter_hard_alloc_fgmulti( %f, %f, fgmulti.id ) = 1 ', [ AWorkorder_ID, AArinvt_ID ])
               + _CheckIncludePhantom( AArinvtCargo )
               + _CheckRestrictToInvTransPlan(),
               [ 'arinvt_id', AArinvt_ID ])
               + _order_by; // ' order by in_date';
  end;

  {Designated Standard_id}
  if ACount = 0 then
  begin
    ACount:= SelectValueAsFloat(   Where('select count(*) from v_fgmulti_ex fgmulti where ' + cnstEXCL_TYPES1, ['arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ])  // , 'shipment_dtl_id_in_transit', AShipment_Dtl_ID_In_Transit ])
                     +       '   and exists ('
                     + Where('select 1 from fgmulti_dispo_bom where fgmulti_id = fgmulti.id', [ 'standard_id', AStandard_ID ])
                     +       ') and '
                     + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
                  // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
                     + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ',  [ AInTransitArcusto_ID ]) + ' and '
                     + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ])
                     + _CheckIncludePhantom( AArinvtCargo )
                     + _CheckRestrictToInvTransPlan());

    S:=   Where('select id, onhand, rg_onhand from v_fgmulti_ex fgmulti where '  + cnstEXCL_TYPES1,  ['arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ]) // , 'shipment_dtl_id_in_transit', AShipment_Dtl_ID_In_Transit ])
        +       '   and exists ('
        + Where('select 1 from fgmulti_dispo_bom where fgmulti_id = fgmulti.id', [ 'standard_id', AStandard_ID ])
        + ') and '
        + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
     // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
        + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ',  [ AInTransitArcusto_ID ]) + ' and '
        + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ])
        + _CheckIncludePhantom( AArinvtCargo )
        + _CheckRestrictToInvTransPlan()
        + _order_by();  // ' order by in_date';
  end;

  {Designated Default Location}
  if ACount = 0 then
  begin
    ACount:= SelectValue( Where('select count(*) from v_fgmulti_ex fgmulti where auto_dispo_default_loc = ''Y'' and '
                            + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ]) + ' and '
                            + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
                         // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
                            + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ', [ AInTransitArcusto_ID ]) + ' and '
                            + cnstEXCL_TYPES1
                            + _CheckIncludePhantom( AArinvtCargo )
                            + _CheckRestrictToInvTransPlan(),
                            [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ]));  // , 'shipment_dtl_id_in_transit', AShipment_Dtl_ID_In_Transit ]);

    S:= Where( 'select id, onhand, rg_onhand from v_fgmulti_ex fgmulti where auto_dispo_default_loc = ''Y'' and '
               + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ]) + ' and '
               + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
            // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
               + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ',  [ AInTransitArcusto_ID ]) + ' and '
               + cnstEXCL_TYPES1
               + _CheckIncludePhantom( AArinvtCargo )
               + _CheckRestrictToInvTransPlan(),
               [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ])
               + _order_by();  // ' order by in_date';
  end;

  {Designated Workcenter Location or MfgType location}
  if ACount = 0 then
  begin
    ACount:= SelectValue( Where('select count(*) from v_fgmulti_ex fgmulti where '
                            + IQFormat( ' loc_id in (%f, %f) ', [ AWork_Center_Loc_ID, AMfgType_Locations_ID ]) + ' and '
                            + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ]) + ' and '
                            + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
                         // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
                            + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ',  [ AInTransitArcusto_ID ]) + ' and '
                            + cnstEXCL_TYPES1
                            + _CheckIncludePhantom( AArinvtCargo )
                            + _CheckRestrictToInvTransPlan(),
                            [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ])); // 'loc_id', AControling_Locations_ID, , 'shipment_dtl_id_in_transit', AShipment_Dtl_ID_In_Transit  ]);

    S:= Where( 'select id, onhand, rg_onhand from v_fgmulti_ex fgmulti where '
               + IQFormat( ' loc_id in (%f, %f) ', [ AWork_Center_Loc_ID, AMfgType_Locations_ID ]) + ' and '
               + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ]) + ' and '
               + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
            // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
               + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ',  [ AInTransitArcusto_ID ]) + ' and '
               + cnstEXCL_TYPES1
               + _CheckIncludePhantom( AArinvtCargo )
               + _CheckRestrictToInvTransPlan(),
               [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ])  // 'loc_id', AControling_Locations_ID,
               + ' order by fgmulti.id '; // + _order_by();  01-26-2016 EIQ-10158
  end;

  {Normal - not designated location}
  if ACount = 0 then
  begin
    ACount:= SelectValue( Where( 'select count(*) from v_fgmulti_ex fgmulti where '
                            + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ]) + ' and '
                            + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
                         // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
                            + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ',  [ AInTransitArcusto_ID ]) + ' and '
                            + cnstEXCL_TYPES1
                         // + _CheckIncludePhantom( AArinvtCargo )  // EIQ-12093
                            + _CheckRestrictToInvTransPlan(),
                            [ 'arinvt_id', AArinvt_ID, 'loc_id', AControling_Locations_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ])); // , 'shipment_dtl_id_in_transit', AShipment_Dtl_ID_In_Transit  ]);

    S:= Where( 'select id, onhand, rg_onhand from v_fgmulti_ex fgmulti where '
               + IQFormat( cnstEXCL_HARD_ALLOC, [ AWorkorder_ID ]) + ' and '
               + IQFormat( cnstCHECK_EXCL_IN_TRANSIT, [ AAcceptInTransit ]) + ' and '
            // + IQFormat( 'oe_drop_ship.same_in_transit_workorder( fgmulti.id, %f, %f ) = 1 ', [ AInTransitWorkorder_ID, AInTransitPartno_ID ]) + ' and '
               + IQFormat( 'trans_share.same_in_transit_vendor_ex( fgmulti.id, %f ) = 1 ',  [ AInTransitArcusto_ID ]) + ' and '
               + cnstEXCL_TYPES1
            // + _CheckIncludePhantom( AArinvtCargo )   // EIQ-12093
               + _CheckRestrictToInvTransPlan(),
               [ 'arinvt_id', AArinvt_ID, 'loc_id', AControling_Locations_ID, 'division_id', ADivision_ID, 'rtrim(lotno)', AMandatoryLotNo ])
               + _order_by(); // ' order by in_date';  // ,'shipment_dtl_id_in_transit', AShipment_Dtl_ID_In_Transit
  end;

  {No locations found? }
  if ACount = 0 then
  begin
     // 11/12/2008 (Byron)
     //ALoc_ID:= GetValFmtWhere( Format('select id from v_locations where loc_desc = ''%s''', [ ADefaultLocation ]), [ 'division_id', ADivision_ID ]);
     ALoc_ID:= GetLocationsID(ADefaultLocation,ADivision_ID,SecurityManager.EPlant_ID_AsFloat, AControling_Locations_ID);

     if (ALoc_ID = 0) then
     begin
       if ADivision_ID > 0 then
          ADefaultLocation:= UpperCase( Copy( Format('%s-%s', [ ADefaultLocation, SelectValueByID( 'name', 'division', ADivision_ID )]), 1, 30));

       if (ADivision_ID > 0) and (AControling_Locations_ID > 0) then
       { 'While processing item, %s, (OUT-Tran) the following mismatch occured:'#13+
         'Work Center, %s, is assigned default dispo location, %s.  However, ' +
         'this location is not available for division, %s.'#13#13+
         'Work Center default dispo location is ignored and default ' +
         'location, %s, based on division mentioned above is used instead.' }
          IQWarning(Format( IQMS.Common.ResStrings.cTXT0000088,
                           [ SelectValueByID( 'RTrim(itemno) || '' ( Rev: '' || RTrim(rev) || '' )''', 'arinvt', AArinvt_ID ),
                             SelectValueByID( 'eqno',     'work_center', AWork_Center_ID     ),
                             SelectValueByID( 'loc_desc', 'locations',   AControling_Locations_ID ),
                             SelectValueByID( 'name',     'division',    ADivision_ID        ),
                             ADefaultLocation ]));

       {now check without AControling_Locations_ID or Division_ID}
       //11/12/2008 (Byron)
       //ALoc_ID:= SelectValueFmtAsFloat( 'select id from v_locations where loc_desc = ''%s''', [ ADefaultLocation ]);
       ALoc_ID:= GetLocationsID(ADefaultLocation,0,SecurityManager.EPlant_ID_AsFloat, AControling_Locations_ID);
     end;

     if ALoc_ID = 0 then
     begin
       ALoc_ID:= GetNextID('locations');
       if ADivision_ID > 0 then
          ExecuteCommandFmt('insert into locations (id, loc_desc, division_id, eplant_id) values( %f, ''%s'', %f, %s )', [ ALoc_ID, ADefaultLocation, ADivision_ID, SecurityManager.EPlant_ID ])
       else
          ExecuteCommandFmt('insert into locations (id, loc_desc, eplant_id) values( %f, ''%s'', %s )', [ ALoc_ID, ADefaultLocation, SecurityManager.EPlant_ID ]);
     end;

     if IsCascadeParentMTOEx( AArinvt_ID ) then
        AssignPotentialMakeToOrderDetail_ID( AWorkorder_ID, AOrd_Detail_ID );

     AList.Add( TFGMultiFIFO.Create( AssignNewFgMulti( AArinvt_ID, ALoc_ID, AMandatoryLotNo{lotno}, 'N' {AIsDefaultDispo}, AOrd_Detail_ID ),
                                     AQty, ARG_Qty ));
     EXIT;
  end;

  AppendToListFromQuery( AList, ACount, AQty, ARG_Qty, S, AInclude_All_Locations, AOnHandTransConsumed ); {down below}
end;


procedure AppendToListFromQuery( AList: TList;
                                 ACount,
                                 AQty,
                                 ARG_Qty: Real;
                                 S: string;
                                 AInclude_All_Locations: Boolean = FALSE;
                                 AOnHandTransConsumed: TOnHandTransConsumedEx = nil );   // same as in trans_share.pas
var
  AQuery: TFDQuery;
begin
  AQuery:= TFDQuery.Create( Application );
  with AQuery do
  try
    ConnectionName := 'IQFD';
    SQL.Add( S );

    AppendToListFromQueryEx( AList,
                             ACount,
                             AQty,
                             ARG_Qty,
                             AQuery,
                             AInclude_All_Locations,
                             AOnHandTransConsumed );
  finally
    Free;
  end;
end;


procedure AppendToListFromQueryEx( AList: TList;
                                   ACount,
                                   AQty,
                                   ARG_Qty: Real;
                                   AQuery: TFDQuery;
                                   AInclude_All_Locations: Boolean = FALSE;
                                   AOnHandTransConsumed: TOnHandTransConsumedEx = nil );   // same as in trans_share.pas
var
  I      : Integer;
  ATmp   : Real;
  ARG_Tmp: Real;
  AOnHand: Real;
  ARgOnHand: Real;
begin
  with AQuery do
  begin
    Open;

    if not Eof then
       CheckProcessNegativeBackflush( AList, AQty, ARG_Qty, FieldByName('id').asFloat );

    I:= 1;
    while not Eof
          and ( AInclude_All_Locations
                or
                ((AQty > 0.0000001) or ( ARG_Qty > 0.0000001 ))) do
    begin
      ATmp   := 0;
      ARG_Tmp:= 0;

      AOnHand  := FieldByName('onhand').asFloat;
      ARgOnHand:= FieldByName('rg_onhand').asFloat;

      // 11-02-2010 check if this fgmulti is already part of this transaction and adjust the onhand qty by reducing the consumed qty
      if Assigned(AOnHandTransConsumed) then
         AOnHandTransConsumed( FieldByName('id').asFloat, AOnHand, ARgOnHand );

      {Virgin Qty}
      if (AQty > 0) and ((AOnHand > 0) or (I = ACount)) then
      begin
         if I = ACount then
            ATmp:= AQty
         else
            ATmp:= fMin( AQty, AOnHand );

         AQty:= AQty - ATmp;
      end;

      {RG Qty}
      if (ARG_Qty > 0) and ((ARgOnHand > 0) or (I = ACount)) then
      begin
         if I = ACount then
            ARG_Tmp:= ARG_Qty
         else
            ARG_Tmp:= fMin( ARG_Qty, ARgOnHand );

         ARG_Qty:= ARG_Qty - ARG_Tmp;
      end;

      {Append to AList if any of the Qty or RG_Qty greater than 0}
      if AInclude_All_Locations or ((ATmp > 0) or (ARG_Tmp > 0)) then
         AList.Add( TFGMultiFIFO.Create( FieldByName('id').asFloat, ATmp, ARG_Tmp ));

      I:= I + 1;
      Next;
    end;
  end;
end;


procedure GetAutoShipFGMultiFIFO( AList: TList; AQty, ARG_Qty, AArinvt_ID: Real; ADivision_ID: Real; AMake_To_Order_Detail_ID: Real = 0 );
var
  ACount : Real;
  ALoc_ID: Real;
  S      : string;
begin
  {Empty List}
  ClearListOfObjects( AList );

  {Designated Default Location}
  ACount:= SelectValue( Where('select count(*) from v_fgmulti_ex fgmulti where ship_default = ''Y'' and '
                 + Format(' nvl(make_to_order_detail_id,0) = %.0f and ', [ AMake_To_Order_Detail_ID ])
                 + cnstEXCL_TYPES1, [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID ]));

  S:= Where( 'select id, onhand, rg_onhand from v_fgmulti_ex fgmulti where ship_default = ''Y'' and '
      + Format(' nvl(make_to_order_detail_id,0) = %.0f and ', [ AMake_To_Order_Detail_ID ])
      + cnstEXCL_TYPES1, [ 'arinvt_id', AArinvt_ID, 'division_id', ADivision_ID ]) + ' order by in_date';

  {No locations found? }
  if ACount = 0 then
  begin
     if AMake_To_Order_Detail_ID > 0 then
     begin
       IQWarning( IQMS.Common.ResStrings.cTXT0000037 ); {'This is a MakeToOrder sales order - nothing has been allocated. Operation aborted.'}
       EXIT;
     end;

     {Default shipping location in the master table}
     ALoc_ID:= SelectValueFmtAsFloat('select id from v_locations where ship_default = ''Y'' and eplant_id %s', [ IIf( SecurityManager.EPlant_ID = 'NULL', ' is NULL', ' = ' + SecurityManager.EPlant_ID )]);

     if ALoc_ID = 0 then
     begin
       IQWarning( IQMS.Common.ResStrings.cTXT0000089 {'No default shipping location found in Master Location table. Operation aborted' } );
       EXIT;
     end;

     AList.Add( TFGMultiFIFO.Create( AssignNewFgMulti( AArinvt_ID, ALoc_ID, '' ), AQty, ARG_Qty ));
     EXIT;
  end;

  AppendToListFromQuery( AList, ACount, AQty, ARG_Qty, S );
end;

procedure AssignPotentialMakeToOrderDetail_ID( AWorkorder_ID: Real; var AOrd_Detail_ID: Real );
begin
  if (AOrd_Detail_ID > 0) and IsMTO( AOrd_Detail_ID ) then
     EXIT;

  AOrd_Detail_ID:= 0;

  if AWorkorder_ID > 0 then
     AOrd_Detail_ID:= SelectValueFmtAsFloat('select MTO.get_ord_detail( %f ) from dual', [ AWorkorder_ID ]);
end;

function GetMfgType_Locations_ID( AKind: string; AStandard_ID, AArinvt_ID,  AWorkorder_ID: Real ): Real;
var
  AMfgType: string;
begin
  Result:= 0;
  AMfgType:= '';

  if AStandard_ID > 0 then
     AMfgType:= SelectValueByID('mfg_type', 'standard', AStandard_ID);

  if (AMfgType = '') and (AArinvt_ID > 0) then
     AMfgType:= Trim(SelectValueFmtAsString('select s.mfg_type from standard s, arinvt a where a.id = %f and a.standard_id = s.id', [ AArinvt_ID ]));

  if (AMfgType = '') and (AWorkorder_ID > 0) then
     AMfgType:= Trim(SelectValueFmtAsString('select s.mfg_type from standard s, workorder w where w.id = %f and w.standard_id = s.id', [ AWorkorder_ID ]));

  if (AMfgType = '') then
     EXIT;

  if UpperCase(AKind) = 'IN' then
     Result:= SelectValueFmtAsFloat('select locations_id_in from mfgtype where rtrim(mfgtype) = ''%s''', [ AMfgType ])
  else if UpperCase(AKind) = 'OUT' then
     Result:= SelectValueFmtAsFloat('select locations_id_out from mfgtype where rtrim(mfgtype) = ''%s''', [ AMfgType ])
end;


function GetMfgCell_Locations_ID( AKind: string; AStandard_ID: Real ): Real;
var
  AMfgcell_ID: Real;
begin
  Result:= 0;
  AMfgcell_ID:= SelectValueByID('mfgcell_id', 'standard', AStandard_ID);

  if AMfgcell_ID = 0 then
     EXIT;

  if UpperCase(AKind) = 'IN' then
     Result:= SelectValueFmtAsFloat('select locations_id_in from mfgcell where id = %f', [ AMfgcell_ID ])
  else if UpperCase(AKind) = 'OUT' then
     Result:= SelectValueFmtAsFloat('select staging_locations_id from mfgcell where id = %f', [ AMfgcell_ID ])
end;


function EnsureMasterLocationExists( ALoc_Desc: string; ADivision_ID: Real = 0; AEPlant_ID: Real = 0): Real;
begin
  Result:= GetLocationsID( ALoc_Desc, ADivision_ID, AEPlant_ID );
  if Result > 0 then
     EXIT;

  AddLocation( ALoc_Desc, ADivision_ID, AEPlant_ID, Result);
end;

function EnsureNonConformCodeExists( ACode: string; ADescrip: string = ''): Real;
begin
  Result:= SelectValueFmtAsFloat('select id from non_conform where upper(rtrim(code)) = ''%s''', [ ACode ]);
  if Result > 0 then
     EXIT;

  if ADescrip = '' then
     ADescrip:= ACode;

  Result:= GetNextID('non_conform');
  ExecuteCommandFmt('insert into non_conform( id, code, descrip ) values( %.0f, ''%s'', ''%s'')', [ Result, ACode, ADescrip ]);
end;


procedure GetReworkFGMultiFIFO( AList: TList; AQty, ARG_Qty, AArinvt_ID, APtorder_ID, ADivision_ID: Real );
var
  ACount: Real;
  S: string;

  procedure CreateNonConformTemporaryLocation;
  var
    ALoc_ID: Real;
    AFGMulti_ID: Real;
    ANon_Conform_ID: Real;
  begin
    ALoc_ID:= EnsureMasterLocationExists( 'TEMPORARY', ADivision_ID, SecurityManager.EPlant_ID_AsFloat );
    ANon_Conform_ID:= EnsureNonConformCodeExists( 'REWORK', 'In Rework' );

    AFGMulti_ID:= GetNextID('fgmulti');
    ExecuteCommandFmt('insert into fgmulti                            '+
              '     ( id, arinvt_id, loc_id, non_conform_id ) '+
              'values                                         '+
              '     ( %f, %f, %f, %f )                        ',
              [ AFGMulti_ID,
                AArinvt_ID,
                ALoc_ID,
                ANon_Conform_ID ]);

    ExecuteCommandFmt('insert into rework_ptorder_fgmulti( ptorder_id, fgmulti_id ) values ( %f, %f )',
              [ APtorder_ID,
                AFGMulti_ID ]);
  end;

begin
  ACount:= SelectValueFmtAsFloat('select count(*) from rework_ptorder_fgmulti where ptorder_id = %f', [ APtorder_ID ]);
  if ACount = 0 then
  begin
    CreateNonConformTemporaryLocation;
    ACount:= 1;
  end;

  ClearListOfObjects( AList );

  S:= IQFormat('select f.id, f.onhand, f.rg_onhand         '+
               '  from rework_ptorder_fgmulti r, fgmulti f '+
               ' where r.ptorder_id = %f                   '+
               '   and r.fgmulti_id = f.id                 '+
               'order by r.id                              ',
               [ APtorder_ID ]);

  AppendToListFromQuery( AList, ACount, AQty, ARG_Qty, S );
end;


function HasWorkorderBOM( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select prod_rep.has_workorder_bom_assigned( %f ) from dual', [ AWorkorder_ID ]) = 1;
end;

function _CheckRestrictToInvTransPlan: string;
var
  S: string;
begin
  Result:= '';
  if not (UseInvTransPlan and (InvTransPlanLocations_ID > 0)) then EXIT;

  if InvTransPlanExcludeList.Count > 0 then
     S:= IQMS.Common.StringUtils.StringListToStr( InvTransPlanExcludeList, ',' )
  else
     S:= '0';  // just stick in something to satisfy the query

  // locations_id and lotno MUST match
  Result:= Format(' and ( fgmulti.loc_id = %.0f                                             '+
                  '       and nvl(rtrim(fgmulti.lotno), ''~'') =  nvl(rtrim(''%s''), ''~'') '+
                  '       and fgmulti.id not in ( %s ))                                     ',
                  [ InvTransPlanLocations_ID,
                    InvTransPlanLotNo,
                    S ]);
end;


function _CheckIncludePhantom( AArinvtCargo: TArinvtCargo ): string;
var
  S: string;
begin
  // Added on 06-01-2015 EIQ-7320 Labor Reporting - Users are getting ORA-01403: no data found when attempting to report labor - Load Trail 1249010
  Result:= '';
  if not AArinvtCargo.IsPhantom then
     EXIT;

  if not AArinvtCargo.IsDrivePhantomNegative then
     Result:= ' and (nvl(fgmulti.onhand,0) >= 0) '
end;


function _ChecRestrictLocationToInvTransPlan( AControling_Locations_ID: Real): Real;
begin
  Result:= AControling_Locations_ID;
  if not (UseInvTransPlan and (InvTransPlanLocations_ID > 0)) then
     EXIT;
  Result:= InvTransPlanLocations_ID;
end;

procedure ActivateInvTransPlan( ALocations_ID: Real; ALotNo: string );
begin
  IQMS.Common.Dispo.UseInvTransPlan         := TRUE;
  IQMS.Common.Dispo.InvTransPlanLocations_ID:= ALocations_ID;
  IQMS.Common.Dispo.InvTransPlanLotNo       := ALotNo;
end;

procedure DeactivateInvTransPlan;
begin
  IQMS.Common.Dispo.UseInvTransPlan         := FALSE;
  IQMS.Common.Dispo.InvTransPlanLocations_ID:= 0;
  IQMS.Common.Dispo.InvTransPlanLotNo       := '';
  InvTransPlanExcludeList.Clear;
end;

procedure AddToExcludeList( AFGMulti_ID: Real );
begin
  InvTransPlanExcludeList.Add( FloatToStr( AFGMulti_ID ))
end;

procedure CheckAssignWorkCenterDivision_ID( var ADivision_ID: Real; AWork_Center_ID: Real );
begin
  if ADivision_ID > 0 then
     EXIT;
  if AWork_Center_ID = 0 then
     EXIT;

  ADivision_ID:= SelectValueFmtAsFloat('select m.division_id            '+
                           '  from work_center w, mfgcell m '+
                           ' where w.id = %f                '+
                           '   and w.mfgcell_id = m.id      ',
                           [ AWork_Center_ID ]);
end;


procedure CheckDeleteEmptyFgmultiUsingSubBatch( AFGMulti_ID, ASub_Batch: Real );
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select created_by_sub_batch, onhand from fgmulti where id = %f', [ AFGMulti_ID ]);
  if (VarArrayDimCount( A ) > 0) then
  begin
    // same sub_batch and 0 onhand - must have been just created - delete it
    if (ASub_Batch = A[ 0 ]) and (A[ 1 ] = 0) then
       ExecuteCommandFmt('delete from fgmulti where id = %f', [ AFGMulti_ID ]);
  end;
end;


function IsFloorDispoOutAddedToCalcUsage( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsString('select m.prod_rep_add_floor_dispo_out       '+
                        '  from v_workorder_standard v,              '+
                        '       mfgtype m                            '+
                        ' where v.id = %f                            '+
                        '   and rtrim(v.mfg_type) = rtrim(m.mfgtype) ',
                        [ AWorkorder_ID ]) = 'Y';
end;


function SelectControllingLocation( AWork_Center_Loc_ID, AMfgCell_Locations_ID, AMfgType_Locations_ID: Real ): Real;
begin
  if AWork_Center_Loc_ID > 0 then
     Result:= AWork_Center_Loc_ID
  else if AMfgCell_Locations_ID > 0 then
     Result:= AMfgCell_Locations_ID
  else if AMfgType_Locations_ID > 0 then
     Result:= AMfgType_Locations_ID
  else
     Result:= 0;
end;


{ TArinvtCargo }

constructor TArinvtCargo.Create(AArinvt_ID: Real);
begin
  Arinvt_ID:= AArinvt_ID;
  IsPhantom:= SelectValueByID('phantom', 'arinvt', Arinvt_ID) = 'Y';
  IsDrivePhantomNegative:= SelectValueByID('drive_phantom_negative', 'arinvt', Arinvt_ID) = 'Y';
end;

initialization
  InvTransPlanExcludeList:= TStringList.Create;

finalization
  if Assigned(InvTransPlanExcludeList) then
     FreeAndNil(InvTransPlanExcludeList);
end.
