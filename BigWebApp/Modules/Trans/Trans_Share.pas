unit Trans_Share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

//type TransOrigin = (ADD, SUBTRUCT, MOVE, CONFORM, ALLOCATE, CLEAR, DELETE);

type
  // used when we need to acccount for the same fgmulti being consumed multiple times in the same backflush transaction
  TOnHandTransConsumed = procedure( AFGMulti_ID: Real; var AOnHand, ARgOnHand: Real) of object;

procedure AssignFGMultiMakeToOrderDetailFromWorkorder( AFGMulti_ID, AWorkorder_ID: Real );
procedure AssignFGMultiMakeToOrderDetailFromShipmentDtl( AFGMulti_ID, AShipment_Dtl_ID: Real );
procedure AssignFGMultiMakeToOrderDetailFromOrdDetail( AFGMulti_ID, AOrd_Detail_ID: Real );
function CloneLocationMoveQty( AFGMulti_ID, AQty: Real; AReason: string; AMaster_Label_List: TStringList; AAffected_PS_Ticket_Rel_ID: Real = 0; AKeepPalletReference: Boolean = FALSE ): Real;
function FindExistingMakeToOrderFGMultiAsSource( ASrcFGMulti_ID, AOrd_Detail_ID: Real ): Real;
function CheckExistingMTO_CloneLocationMoveQty( ASrcFGMulti_ID, AOrd_Detail_ID, AQty: Real; AReason: string; AMaster_Label_List: TStringList; AAffected_PS_Ticket_Rel_ID: Real ): Real;
procedure ToggletoConf(AOwner:TComponent; ArinvtID, AFgMultiID:Real);
procedure ToggletoNonConf(AOwner:TComponent; AFgMultiID:Real; AIgnoreAlreadyMarkedNCError : Boolean = false);
procedure ToggletoNonConf2(AOwner:TComponent; AFgMultiList:TStringList; ANonConformId:Real; ANon_Conform_Allocatable: string = 'N'; AIgnoreAlreadyMarkedNCError : Boolean = false);
procedure CheckAskToCreateMRBForNonConf( AFGMultiID, ATransLogID : Real );
procedure ToggleToShip(AFgMultiID:Real);
procedure ToggleToNoShip(AFgMultiID:Real);
procedure ToggleToAlloc(AFgMultiID:Real);
procedure ToggleToNonAlloc(AOwner:TComponent; AFgMultiID:Real);
procedure ReleaseWOHardAllocation(AFgMultiID:Real);
procedure ReleaseMakeToOrderAllocation(AFgMultiID:Real);
function ReallocatePortionOf( AFGMulti_ID: Real ): Real;
procedure PrintLabels_Shared(AFgMultiID, AStandardID:Real);


procedure CheckLocationForVMI( AGMultiID: Real );
procedure CheckLocationForInTransit( AGMultiID: Real );
procedure CheckLocationForPickTicket( AGMultiID: Real );
/// <summary> Determine if a location is flagged for VMI. </summary>
function  IsVMI( ALocation_ID: Real ): Boolean;
/// <summary> Determine if a warehouse location is flagged for VMI. </summary>
function  IsFgmultiVMI( AFGMultiID: Real ): Boolean;
procedure CheckSICItemLocationAssignedPickTicket( AFGMulti_ID, AMaster_Label_ID: Real );

procedure ClearDispoDesignator( AFGMulti_ID: Real );
procedure AssignDispoDesignator( AFGMulti_ID: Real; AStandard_ID: Real = 0 );
function ConformStateChange( AFrom_FGMulti_ID, ATo_FGMulti_ID: Real ): Integer;  // 0 - no change, 1 - conform to non-conform, 2 - non-conform to conform
function IsUniqueDispoLocOnMove(AArinvt_ID: Real): Boolean;

function IsCascadeParentMTO(AArinvt_ID: Real): Boolean;
procedure CheckPropagateMTO( AWorkorder_ID, AFGMulti_ID: Real );

function IsFgMultiSIC( AFGMulti_ID: Real ): Boolean;
procedure CheckInspectionStatus( AFgMulti_ID: Real );

function IsOverrideSIC( AFGMulti_ID: Real ): Boolean;
procedure CheckLocationsOverrideSIC( AFGMulti_ID1, AFGMulti_ID2: Real);
function MatchingOverrideSIC( AFGMulti_ID1, AFGMulti_ID2: Real ): Boolean;
function IsShipToOverrideSIC( AShip_To_ID: Real ): Boolean;
function IsPickTicketOverrideSIC( ATicket_ID: Real ): Boolean;
function ExpandRejectCodeToAttribute( ARejectCode: string ): string;
procedure UpdateTranslogCommentWithRejectReason( ARejectReason: string; ASub_Batch: Real );
function IsMixedPallet(AMaster_Label_ID: Real): Boolean;
procedure LoadConformingTransLocationsUsingLotNo( AList: TStringList; AArinvt_ID: Real; ALotNo: string );
function IsLocationCycleCounted
  ( ALocations_ID: Real; 
    ASource: string = 'LOCATIONS';  
    ATaginvMethod: string = 'WS-CLASS/LOC' ): Boolean;
procedure CheckLocationCycleCounted
  ( ALocations_ID: Real; 
    ASource: string = 'LOCATIONS';  
    ATaginvMethod: string = 'WS-CLASS/LOC' );
procedure CheckFGMultiCycleCounted
  ( AFGMulti_ID: Real; 
    ASource: string = 'LOCATIONS';  
    ATaginvMethod: string = 'WS-CLASS/LOC' );
                      

implementation

uses
  CheckMrb,
  ConfAloc,
  IQMS.Common.Applications,
  IQMS.Common.COMExe,
  IQMS.Common.DataLib,
  {
  IQLMBomEx,
  IQLMRawEx,
  iqrf.rf_pro_share,
  QC_Const,
  Rma_Const,
  LocWOHardAllocChk,
  TranMain,
  }
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,

  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.Trans,
  IQMS.Common.JumpDispatcher,
  sec_conf_insp_violation,
  System.Variants,

  IQMS.Common.TransMisc,
  trans_non_conf_dispo_designated_chk,
  trans_rscstr,
  IQMS.Common.NLS;

procedure CheckCascadeParentMTO_ToFGMulti( AWorkorder_ID, AArinvt_ID, AFGMulti_ID: Real ); forward;


procedure AssignFGMultiMakeToOrderDetailFromWorkorder( AFGMulti_ID, AWorkorder_ID: Real );
begin
  ExecuteCommandFmt('update fgmulti set make_to_order_detail_id = (select mto.get_ord_detail( %f ) from dual ) where id = %f',
            [ AWorkorder_ID, AFGMulti_ID]);
end;


procedure AssignFGMultiMakeToOrderDetailFromShipmentDtl( AFGMulti_ID, AShipment_Dtl_ID: Real );
var
  AMAkeToOrderDetail_ID: Real;
begin
  AMakeToOrderDetail_ID:= TIQWebInvTranBase.GetMakeToOrderDetail_ID_FromShipmentDetail_ID( AShipment_Dtl_ID ); {IQMS.WebVcl.Trans.pas}
  if AMakeToOrderDetail_ID > 0 then
     ExecuteCommandFmt('update fgmulti set make_to_order_detail_id = %f where id = %f', [ AMakeToOrderDetail_ID, AFGMulti_ID ]);
end;


procedure AssignFGMultiMakeToOrderDetailFromOrdDetail( AFGMulti_ID, AOrd_Detail_ID: Real );
begin
  IQMS.Common.TransMisc.AssignFGMultiMakeToOrderDetailFromOrdDetailEx( AFGMulti_ID, AOrd_Detail_ID );
end;


function CloneLocationMoveQty( AFGMulti_ID, AQty: Real; AReason: string; AMaster_Label_List: TStringList; AAffected_PS_Ticket_Rel_ID: Real = 0; AKeepPalletReference: Boolean = FALSE ): Real;
var
  ATransMove: TIQWebTransMove;
begin
  // Clone FgMulti
  Result:= GetNextID('fgmulti');
  ExecuteCommandFmt('insert into fgmulti                                                             '+
            '     ( id, arinvt_id, loc_id, lotno, eplant_id, division_id, lot_date, in_date, '+
            '       make_to_order_detail_id, containerno )                                   '+
            'select %f, arinvt_id, loc_id, lotno, eplant_id, division_id, lot_date, in_date, '+
            '       make_to_order_detail_id, containerno                                     '+
            '  from fgmulti where id = %f                                                    ',
            [ Result, AFGMulti_ID ]);

  if AAffected_PS_Ticket_Rel_ID > 0 then
     ExecuteCommandFmt('update ps_ticket_rel set fgmulti_id = %f where id = %f', [ Result, AAffected_PS_Ticket_Rel_ID ]);

  ATransMove:= TIQWebTransMove.Create(nil);
  with ATransMove do
  try
    MoveFrom_FGMulti_ID := AFGMulti_ID;
    MoveTo_FGMulti_ID   := Result;
    Trans_Quan          := AQty;
    Trans_Reason        := AReason;
    KeepPalletReference := AKeepPalletReference; // in case of mixed labels keep master_label.parent_id pointing to the original pallet

    {reset the master_label}
    TransOut.Master_Label_List:= AMaster_Label_List;
    {reassign master_label - fgmulti_id, loc_desc etc}
    TransIn.Master_Label_List:= AMaster_Label_List;

    Execute;
  finally
    ATransMove.Free;
  end;
end;


function FindExistingMakeToOrderFGMultiAsSource( ASrcFGMulti_ID, AOrd_Detail_ID: Real ): Real;

begin
  Result:= SelectValueFmtAsFloat('select f.id                                  '+
                     '  from v_fgmulti_ex f                        '+
                     ' where                                       '+
                     '       ( arinvt_id,                          '+
                     '         loc_id,                             '+
                     '         nvl(rtrim(lotno), ''*''),           '+
                     '         nvl(lot_date, sysdate-1000) )       '+
                     '       in                                    '+
                     '       ( select arinvt_id,                   '+
                     '                loc_id,                      '+
                     '                nvl(rtrim(lotno), ''*''),    '+
                     '                nvl(lot_date, sysdate-1000)  '+
                     '           from fgmulti                      '+
                     '          where id = %f )                    '+

                     '   and misc.eplant_filter( f.eplant_id ) = 1 '+
                     '   and (non_conform_id is NULL or non_conform_id is not null and non_conform_allocatable = ''Y'') '+
                     '   and non_allocate_id is null               '+
                     '   and make_to_order_detail_id = %f          '+
                     '   and id <> %f                              '+
                     ' order by f.id                               ',
                     [ ASrcFGMulti_ID,
                       AOrd_Detail_ID,
                       ASrcFGMulti_ID ]);
end;


function CheckExistingMTO_CloneLocationMoveQty( ASrcFGMulti_ID, AOrd_Detail_ID, AQty: Real; AReason: string; AMaster_Label_List: TStringList; AAffected_PS_Ticket_Rel_ID: Real ): Real;
var
  ATransMove: TIQWebTransMove;
begin
  Result:= FindExistingMakeToOrderFGMultiAsSource( ASrcFGMulti_ID, AOrd_Detail_ID );

  if Result = 0 then
  begin
    Result:= CloneLocationMoveQty( ASrcFGMulti_ID, AQty, AReason, AMaster_Label_List, AAffected_PS_Ticket_Rel_ID, TRUE );
    EXIT;
  end;

  if AAffected_PS_Ticket_Rel_ID > 0 then
     ExecuteCommandFmt('update ps_ticket_rel set fgmulti_id = %f where id = %f', [ Result, AAffected_PS_Ticket_Rel_ID ]);

  ATransMove:= TIQWebTransMove.Create(nil);
  with ATransMove do
  try
    MoveFrom_FGMulti_ID := ASrcFGMulti_ID;
    MoveTo_FGMulti_ID   := Result;
    Trans_Quan          := AQty;
    Trans_Reason        := AReason;
    KeepPalletReference := TRUE;  // in case of mixed labels keep master_label.parent_id pointing to the original pallet

    {reset the master_label}
    TransOut.Master_Label_List:= AMaster_Label_List;
    {reassign master_label - fgmulti_id, loc_desc etc}
    TransIn.Master_Label_List:= AMaster_Label_List;

    AllowMakeToOrderTrans:= TRUE;

    Execute;
  finally
    ATransMove.Free;
  end;
end;

procedure CheckLocationForVMI( AGMultiID: Real );
var
  ALocation_ID: Real;
begin
  ALocation_ID:= SelectValueByID('loc_id', 'fgmulti', AGMultiID );
  if IsVMI( ALocation_ID ) then
     raise Exception.CreateFmt(trans_rscstr.cTXT0000021 {'Location %s is marked as VMI. Transaction aborted'}, [ SelectValueByID('loc_desc', 'locations', ALocation_ID) ]);
end;

function IsVMI( ALocation_ID: Real ): Boolean;
begin
  Result:= SelectValueByID( 'vmi', 'locations', ALocation_ID ) = 'Y';
end;

function IsFgmultiVMI( AFGMultiID: Real ): Boolean;
begin
  Result := SelectValueFmtAsString(
    'SELECT NVL(b.vmi, ''N'')         '#13 +
    '  FROM fgmulti a, locations b    '#13 +
    ' WHERE a.loc_id = b.id AND       '#13 +
    '       a.id = %.0f               ',
    [AFGMultiID]) = 'Y';
end;

procedure CheckLocationForInTransit( AGMultiID: Real );
begin
  {check in-transit}
  if SelectValueByID('shipment_dtl_id_in_transit', 'fgmulti', AGMultiID) > 0 then
     raise Exception.Create(trans_rscstr.cTXT0000034 {'Location is marked as IN TRANSIT. Transaction aborted'});
end;

procedure ToggletoConf(AOwner:TComponent; ArinvtID, AFgMultiID:Real);
begin
  if IQConfirmYN(trans_rscstr.cTXT0000013 {'Convert On-Hand quantity to Conforming?'}) then
  begin
    // 05-09-2011 Moved to TTransConform
    // ExecuteCommandFmt('update fgmulti set non_conform_id = NULL, non_conform_allocatable = null where id = %f', [AFgMultiID]);

    CheckInspectionStatus( AFgMultiID );

    with TIQWebTransConform.Create(AOwner, AFgMultiID) do
    try
      Execute;

//      DoLaborOverhead( DM.TblFGMultiARINVT_ID.asFloat, Trans_Batch );    {LbrOvrHd}
      // Com_Exec( 'IQRMA', [ Rma_Const.RMA_LABOR_OVERHEAD,  DM.TblFGMultiARINVT_ID.asFloat, Trans_Batch]);    {Rma_Const, IQMS.Common.COMExe.pas}
      { TODO -ombaral -cWebIQ : Resolve depemdency
      IQMS.Common.JumpDispatcher.DoCOMJump( 'IQRMA', [ Rma_Const.RMA_LABOR_OVERHEAD, ArinvtID, Trans_Batch ]);
      }

    finally
      Free;
    end;
  end;
end;

procedure ToggletoNonConf(AOwner:TComponent; AFgMultiID:Real; AIgnoreAlreadyMarkedNCError : Boolean = false);
begin
  CheckLocationForVMI( AFgMultiID );
  CheckLocationForInTransit( AFgMultiID );
  CheckLocationNonConformDispoDesignated( AFgMultiID, tntLocationToNonConform ); // trans_non_conf_dispo_designated_chk.pas
  CheckLocationForPickTicket( AFgMultiID );
  { TODO -ombaral -cWebIQ : Resolve depemdency
  DoConfAlloc(AOwner, AFgMultiID, CONFORM, AIgnoreAlreadyMarkedNCError);
  }
end;

procedure ToggletoNonConf2(AOwner:TComponent; AFgMultiList:TStringList; ANonConformId:Real; ANon_Conform_Allocatable: string = 'N'; AIgnoreAlreadyMarkedNCError : Boolean = false);
var
  i:integer;
  AConfirm:integer;
  AFgMultiID:Real;
  ALocation_ID:Real;
  Awf_deviation_item_id:Real;
  AProcessedFgMultiList:TStringList;
  ATranslog_ID: Real;
begin
  AProcessedFgMultiList := TStringList.Create;
  try
    for i := 0 to AFgMultiList.Count - 1 do
    begin
      AFgMultiID := StrToFloat(AFgMultiList[i]);
//      CheckLocationForVMI
      ALocation_ID:= SelectValueByID('loc_id', 'fgmulti', AFgMultiID );
      if IsVMI( ALocation_ID ) then Continue;
//      CheckLocationForInTransit
      if SelectValueByID('shipment_dtl_id_in_transit', 'fgmulti', AFgMultiID) > 0 then Continue;
//      CheckLocationNonConformDispoDesignated
      if SelectValueFmtAsFloat('select decode(auto_dispo_standard_id, null, 0, 1) + decode( auto_dispo_default_loc, null, 0, ''Y'', 1, 0) '+
                   '  from fgmulti where id = %f ', [ AFgMultiID ]) <> 0 then Continue;

      with TIQWebTransNonConform.Create( Application, AFgMultiID, ANonConformId, ANon_Conform_Allocatable ) do
      try
        FIgnoreAlreadyMarkedNCError:= AIgnoreAlreadyMarkedNCError;
        Execute;
        AProcessedFgMultiList.Add(AFgMultiList[i]);
        ATranslog_ID:= SelectValueFmtAsFloat('select id from translog where sub_batch = %f and fgmulti_id = %f', [ Sub_Batch, AFgMultiID ]);
      finally
        Free;
      end;
    end;

    if AProcessedFgMultiList.Count <> 0 then
    begin
      AFgMultiID := StrToFloat(AProcessedFgMultiList[0]);
      CheckAskToCreateMRBForNonConf( AFgMultiID, ATranslog_ID );
      Awf_deviation_item_id := SelectValueFmtAsFloat('select wf_deviation_item_id from fgmulti where id = %f', [AFgMultiID]);
      if Awf_deviation_item_id <> 0 then
      for i := 1 to AProcessedFgMultiList.Count - 1 do
      begin
        AFgMultiID := StrToFloat(AProcessedFgMultiList[i]);
        ExecuteCommandFmt('update fgmulti set wf_deviation_item_id = %f where id = %f', [Awf_deviation_item_id, AFgMultiID]);
      end;

    end;
  finally
    AProcessedFgMultiList.Free;
  end;

end;

procedure CheckAskToCreateMRBForNonConf( AFGMultiID, ATransLogID : Real );
var
  AConfirm: Integer;
begin
  if SecurityManager.IsModuleLicensed( apIQMRB  ) then
  begin
    (* TODO -ombaral -cWebIQ : Resolve depemdency
    AConfirm := IQDialogChkEx( TFrmCheckMrb, trans_rscstr.cTXT0000076 {'Would you like to create an MRB?'}, 'Trans_ConfirmMRB' );
    if AConfirm = 1 then
    try

      Com_Exec( 'IQQC', [ QC_Const.QC_MRB_INSERT_NEW_EX,                        { IQMS.Common.COMExe.pas }
                          0,                                                    { wf_header_id }
                          SelectValueByID( 'arinvt_id', 'fgmulti', AFgMultiID ),{ arinvt_id    }
                          AFGMultiID,
                          ATransLogID ]);

    except on E:Exception do                                                     // in case Cancel was clicked
      if not E.ClassNameIs( 'EAbort' ) and not E.ClassNameIs( 'EOleException' ) then raise;
    end;
    *)
  end;
end;

procedure ToggleToShip(AFgMultiID:Real);
begin
  if IQConfirmYN(trans_rscstr.cTXT0000044 {'Convert To Ship?'}) then
    ExecuteCommandFmt('update fgmulti set no_ship = ''N'' where id = %f', [AFgMultiID]);
end;

procedure ToggleToNoShip(AFgMultiID:Real);
begin
  if IQConfirmYN(trans_rscstr.cTXT0000045 {'Convert To No_Ship?'}) then
    ExecuteCommandFmt('update fgmulti set no_ship = ''Y'' where id = %f', [AFgMultiID]);
end;

procedure ToggleToAlloc(AFgMultiID:Real);
begin
  CheckLocationForVMI( AFgMultiID );
  CheckLocationForInTransit( AFgMultiID );
  if IQConfirmYN(trans_rscstr.cTXT0000014 {'Convert On-Hand quantity to Allocatable?'}) then
    ExecuteCommandFmt('update fgmulti set non_allocate_id = NULL where id = %f', [ AFgMultiID ]);
end;

procedure ToggleToNonAlloc(AOwner:TComponent; AFgMultiID:Real);
begin
  DoConfAlloc(AFgMultiID, ALLOCATE);
end;

procedure ReleaseWOHardAllocation(AFgMultiID:Real);
begin
  (* Reslolve dependencies
  CheckLocationWorkOrderHardAllocated( AFgMultiID ); {LocWOHardAllocChk.pas}
  *)
  ExecuteCommandFmt('delete from workorder_bom_mat_loc where fgmulti_id = %f', [ AFgMultiID ]);
  ClearDispoDesignator( AFgMultiID );
end;

procedure ReleaseMakeToOrderAllocation(AFgMultiID:Real);
begin
  if not IQConfirmYN('Are you sure you want to deallocate MakeToOrder inventory location?') then
     EXIT;

  ReallocatePortionOf( AFgMultiID);

end;

function ReallocatePortionOf( AFGMulti_ID: Real ): Real;
begin
  { TODO -ombaral -cWebIQ : Resolve depemdency
  TFrmTranMain.ReallocatePortionOfMTO( AFGMulti_ID );
  }
//  RefreshDataSetByID( DM.TblFGMulti );
end;

procedure PrintLabels_Shared(AFgMultiID, AStandardID:Real);
begin
  if AFgMultiID = 0 then
     EXIT;
  (* TODO -ombaral -cWebIQ : Resolve depemdency
  if AStandardID = 0 then
     DoPrintLMRawMaterialFromFGMulti( AFgMultiID ) {IQLMRawEx.pas}
  else
     DoPrintLMBomMaterialFromFGMulti( AFgMultiID ) {IQLMBomEx.pas}
  *)
end;

procedure ClearDispoDesignator( AFGMulti_ID: Real );
begin
  ExecuteCommandFmt( 'declare                                                         '+
             '  v_fgmulti_id number::= %f;                                    '+
             'begin                                                           '+
             '  update fgmulti                                                '+
             '     set auto_dispo_default_loc = null,                         '+
             '         auto_dispo_standard_id = null                          '+
             '   where id = v_fgmulti_id;                                     '+
             '                                                                '+
             '   delete fgmulti_dispo_bom where fgmulti_id = v_fgmulti_id;    '+
             'end;                                                            ',
             [ AFGMulti_ID ]);
end;


procedure AssignDispoDesignator( AFGMulti_ID: Real; AStandard_ID: Real = 0 );
begin
  ExecuteCommandFmt( 'declare                                                    '+
             '  v_fgmulti_id  number::= %f;                              '+
             '  v_standard_id number::= %f;                              '+
             '  v_count       number;                                    '+
             'begin                                                      '+
             '  update fgmulti                                           '+
             '     set auto_dispo_default_loc = ''Y''                    '+
             '   where id = v_fgmulti_id;                                '+
             '                                                           '+
             '  if v_standard_id > 0 then                                '+
             '     update fgmulti                                        '+
             '        set auto_dispo_standard_id = v_standard_id         '+
             '      where id = v_fgmulti_id;                             '+
             '  end if;                                                  '+
             '                                                           '+
             '  if v_standard_id > 0 then                                '+
             '     select count(*) into v_count from fgmulti_dispo_bom   '+
             '      where fgmulti_id = v_fgmulti_id                      '+
             '        and standard_id = v_standard_id;                   '+
             '                                                           '+
             '     if v_count = 0 then                                   '+
             '       insert into fgmulti_dispo_bom                       '+
             '            ( fgmulti_id, standard_id )                    '+
             '       values                                              '+
             '            ( v_fgmulti_id, v_standard_id );               '+
             '     end if;                                               '+
             '  end if;                                                  '+
             'end;                                                       ',
             [ AFGMulti_ID,
               AStandard_ID ]);
end;

procedure CheckSICItemLocationAssignedPickTicket( AFGMulti_ID, AMaster_Label_ID: Real );
var
  AArinvt_ID: Real;
begin
  if SelectValueFmtAsString('select a.is_linked_to_serial from arinvt a, fgmulti f where f.id = %f and f.arinvt_id = a.id', [ AFGMulti_ID ]) <> 'Y' then
     EXIT;

  // if SelectValueFmtAsFloat('select 1 from ps_ticket_rel where fgmulti_id = %f and rownum < 2', [ AFGMulti_ID ]) = 1 then
  if SelectValueFmtAsFloat('select 1 from master_label a, ps_ticket_rel b where a.id = %f and a.ps_ticket_rel_id = b.id', [ AMaster_Label_ID ]) = 1 then
     raise Exception.CreateFmt( trans_rscstr.cTXT0000047, [ FloatToStr( AMaster_Label_ID )]); {'Serial# %s is assigned to a pickticket - transaction aborted'}
end;

function ConformStateChange( AFrom_FGMulti_ID, ATo_FGMulti_ID: Real ): Integer;  // 0 - no change, 1 - conform to non-conform, 2 - non-conform to conform
begin
  Result:= IQMS.Common.TransMisc.GetConformStateChange( AFrom_FGMulti_ID, ATo_FGMulti_ID );  // 0 - no change, 1 - conform to non-conform, 2 - non-conform to conform
end;

function IsUniqueDispoLocOnMove(AArinvt_ID: Real): Boolean;
begin
  Result:= IQMS.Common.TransMisc.IsUniqueDispoLocOnMoveEx(AArinvt_ID);
end;

function IsCascadeParentMTO(AArinvt_ID: Real): Boolean;
begin
  IQMS.Common.TransMisc.IsCascadeParentMTOEx(AArinvt_ID);
end;

procedure CheckCascadeParentMTO_ToFGMulti( AWorkorder_ID, AArinvt_ID, AFGMulti_ID: Real );
var
  AMake_To_Order_Detail_ID: Real;
begin
  if AWorkorder_ID = 0 then
     EXIT;

  if not trans_share.IsCascadeParentMTO( AArinvt_ID ) then
     EXIT;

  AMake_To_Order_Detail_ID:= SelectValueFmtAsFloat('select mto.get_ord_detail( %f ) from dual ',[ AWorkorder_ID ]);
  if AMake_To_Order_Detail_ID > 0 then
     ExecuteCommandFmt('update fgmulti set make_to_order_detail_id = %f where id = %f', [ AMake_To_Order_Detail_ID, AFGMulti_ID ]);
end;

procedure CheckPropagateMTO( AWorkorder_ID, AFGMulti_ID: Real );
var
  AMake_To_Order_Detail_ID: Real;
  AArinvt_ID              : Real;
begin
  if AWorkorder_ID = 0 then
     EXIT;

  AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', AFGMulti_ID);
  AMake_To_Order_Detail_ID:= SelectValueFmtAsFloat('select mto.get_ord_detail( %f ) from dual ',[ AWorkorder_ID ]);

  if SelectValueFmtAsFloat('select mto.get_arinvt_id_from_ord_detail( %f ) from dual', [ AMake_To_Order_Detail_ID ]) = AArinvt_ID  then
     AssignFGMultiMakeToOrderDetailFromOrdDetail( AFGMulti_ID, AMake_To_Order_Detail_ID )
  else
     CheckCascadeParentMTO_ToFGMulti( AWorkorder_ID, AArinvt_ID, AFGMulti_ID );
end;

function IsFgMultiSIC( AFGMulti_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsString('select a.is_linked_to_serial from arinvt a, fgmulti f where f.id = %f and f.arinvt_id = a.id', [ AFGMulti_ID ]) = 'Y'
end;

procedure CheckInspectionStatus( AFgMulti_ID: Real );
var
  ASpc_Subgroup_ID: Real;
  AStatus: string;
  S: string;
begin
  ASpc_Subgroup_ID:= SelectValueByID('spc_subgroup_id', 'fgmulti', AFgMulti_ID);
  if ASpc_Subgroup_ID = 0 then
     EXIT;

  AStatus:= SelectValueByID('nvl(failed, ''X'')', 'spc_subgroup', ASpc_Subgroup_ID);
  if AStatus = 'Y' then
     S:= 'Location Quantity Inspection has failed.'
  else if Astatus = 'X' then
     S:= 'Location Quantity has not been inspected.'
  else
     EXIT;

  // WMS
  if IsConsole then
  begin
    (* TODO -ombaral -cWebIQ : Resolve depemdency
    if not (iqrf.rf_pro_share.GetProSwitch( PRO_MOVE, PRO_OVERRIDE_NON_CONFORM_INSPECTION, 'N' ) = 'Y') then
       raise Exception.Create( S );
    EXIT;
    *)
  end;

  S:= Trim(S) + ' Are you sure you want to continue?';

  // EIQ
  if TFrmSecConfInspectionViolation.DoShowModal( S ) <> mrYes then  // sec_conf_insp_violation.pas
     ABORT;
end;

function IsOverrideSIC( AFGMulti_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select trans_share.is_override_sic( %f ) from dual', [ AFGMulti_ID ]) = 1;
end;

function MatchingOverrideSIC( AFGMulti_ID1, AFGMulti_ID2: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select trans_share.check_both_override_sic( %f, %f ) from dual', [ AFGMulti_ID1, AFGMulti_ID2 ]) = 1;
end;

procedure CheckLocationsOverrideSIC( AFGMulti_ID1, AFGMulti_ID2: Real);
begin
  if (AFGMulti_ID1 > 0) and (AFGMulti_ID2 > 0) then
     IQAssert( MatchingOverrideSIC( AFGMulti_ID1, AFGMulti_ID2 ),
               trans_rscstr.cTXT0000061 );       // Override SIC Inventory Control mismatch detected - transaction aborted.
end;

function IsShipToOverrideSIC( AShip_To_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select trans_share.is_ship_to_override_sic( %f ) from dual', [ AShip_To_ID ]) = 1;
end;

function IsPickTicketOverrideSIC( ATicket_ID: Real ): Boolean;
var
  ADivsion_ID: Real;
  AShip_To_ID: Real;
  A: Variant;
begin
  Result:= FALSE;
  A:= SelectValueArrayFmt( 'select division_id, ship_to_id from ps_ticket where id =  %f', [ ATicket_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  ADivsion_ID:= A[ 0 ];
  AShip_To_ID:= A[ 1 ];

  Result:= SelectValueByID('override_sic', 'division', ADivsion_ID) = 'Y';
  if Result then
     EXIT;

  Result:= IsShipToOverrideSIC( AShip_To_ID );
end;

function ExpandRejectCodeToAttribute( ARejectCode: string ): string;
var
  A: Variant;
begin
  Result:= ARejectCode;
  A:= SelectValueArrayFmt('select rpad(rtrim(reject_code),6) || RTrim(attribute) from reject_code where rtrim(reject_code) = ''%s''',
                     [IQMS.Common.StringUtils.FixStr(ARejectCode)]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  Result:= A[ 0 ];
end;

procedure UpdateTranslogCommentWithRejectReason( ARejectReason: string; ASub_Batch: Real );
begin
  ExecuteCommandFmt('update translog                 '+
            '   set receipt_comment = ''%s'' '+
            ' where sub_batch = %f           ',
            [ FixStr( ARejectReason ),
              ASub_Batch ]);
end;


function IsMixedPallet( AMaster_Label_ID: Real ): Boolean;
var
  APalletFgLotNo: string;
begin
  Result:= FALSE;
  if AMaster_Label_ID <= 0 then
     EXIT;

  if SelectValueByID('is_pallet', 'master_label', AMaster_Label_ID) <> 'Y' then
     EXIT;

  APalletFgLotNo:= SelectValueByID('fg_lotno', 'master_label', AMaster_Label_ID);
  Result:=  SelectValueFmtAsFloat('select 1 from master_label where parent_id = %f and nvl(fg_lotno, ''*'') <> nvl(''%s'', ''*'') and rownum < 2',
                      [ AMaster_Label_ID, APalletFgLotNo ] ) = 1;
end;


procedure LoadConformingTransLocationsUsingLotNo( AList: TStringList; AArinvt_ID: Real; ALotNo: string );
begin         
  LoadColumnValueIntoStringList( AList,
                                       IQFormat('select f.id                           '+
                                                '  from fgmulti f,                     '+
                                                '       locations l                    '+
                                                ' where f.arinvt_id = %f               '+
                                                '   and rtrim(f.lotno) = rtrim(''%s'') '+
                                                '   and NVL(f.non_conform_id, 0) = 0   '+
                                                '   and f.loc_id = l.id                '+ 
                                                '   and nvl(l.vmi, ''N'') <> ''Y''     ', 
                                                [ AArinvt_ID, ALotNo ]));
end;

    
function IsLocationCycleCounted
  ( ALocations_ID: Real; 
    ASource: string = 'LOCATIONS';  
    ATaginvMethod: string = 'WS-CLASS/LOC' ): Boolean;
begin
  Result:= SelectFuncValueFmtAsFloat('inventory_trans.is_location_cycle_count( %f, ''%s'', ''%s'' )', [ ALocations_ID, ASource, ATaginvMethod ]) = 1;
end;    

procedure CheckLocationCycleCounted
  ( ALocations_ID: Real; 
    ASource: string = 'LOCATIONS';
    ATaginvMethod: string = 'WS-CLASS/LOC' );
var
  ALocDesc: string;    
begin
  if GetSwitch('taginv_freeze_worksheet_locs', 'params') <> 'Y' then
     EXIT;

  if IsLocationCycleCounted( ALocations_ID, ASource, ATaginvMethod ) then
  begin
    ALocDesc:= SelectValueByID('loc_desc', 'locations', ALocations_ID);
    raise Exception.CreateFmt(cTXT0000073, [ALocDesc]); // 'Location %s is part of active physical inventory count - operation aborted';
  end;
end;

procedure CheckFGMultiCycleCounted
  ( AFGMulti_ID: Real;
    ASource: string = 'LOCATIONS';
    ATaginvMethod: string = 'WS-CLASS/LOC' );
begin
  if GetSwitch('taginv_freeze_worksheet_locs', 'params') <> 'Y' then
     EXIT;

  CheckLocationCycleCounted( SelectValueByID('loc_id', 'fgmulti', AFGMulti_ID),
                             ASource,
                             ATaginvMethod );
end;

procedure CheckLocationForPickTicket( AGMultiID: Real );
var
  APSTicket_ID: Real;
begin
  APSTicket_ID:= SelectValueFmtAsFloat( 'select d.ps_ticket_id '+
                                        '  from ps_ticket_dtl d, ps_ticket_rel r '+
                                        ' where r.fgmulti_id = %f '+
                                          ' and r.ps_ticket_dtl_id = d.id', [AGMultiID]);
  if APSTicket_ID > 0 then
  begin
    IQWarning(Format(cTXT0000075, [ FloatToStr( APSTicket_ID )])); // 'This lot is currently associated to Pick Ticket # %s. Please make the necessary adjustments to the Pick Ticket'
  end;
end;


end.
