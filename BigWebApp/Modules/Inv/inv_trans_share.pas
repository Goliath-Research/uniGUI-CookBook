unit inv_trans_share;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Wwdbcomb,
  IQMS.Common.Applications,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox;

type
  TPriorityLevel = (plLow, plMed, plHigh);

type
  TInvTransPlanCargo = record
    SourceModule: string;
    Source: string;
    Source_ID: Real;
    Kind: string;
    InvTransPlan_ID: Real;
    Trans_Alert_ID : Real;
    IsTemporaryPlan: Boolean;
    ClearCargoParams: Boolean;

    constructor Create( AInvTransPlan_ID: Real );
    procedure AddToTemporaryMasterLabelList( AMaster_Label_ID: Real; ATruncate: Boolean = TRUE );
    procedure ClearTemporaryMasterLabelList;
  end;

  TTransRequestParam = record
    Locations_ID: Real;
    Workorder_ID: Real;
    Sndop_Dispatch_ID: Real;
    Inv_Zone_ID: Real;
    Parent_Arinvt_ID: Real;
  end;

type
  TValueCaption = record
    Value  : string;
    Caption: string;
  end;

  // TLocatingSrcModule = (lsmReceive, lsmRMA, lsmDispo, lsmMove, lsmInterCompany, lsmXDock );
  TLocatingSrcModule = (lsmReceive, lsmDispo, lsmMove, lsmStaging, lsmRMA );

  // TPickingSrcModule  = (psmShipment, psmDispo, psmStaging, psmInterCompany );
  TPickingSrcModule = (psmShipment, psmStaging );

  function GetPriorityLevel( APriority: Real ): TPriorityLevel;
  procedure AssignPriorityLevelColor( APriority: Real; AFont: TFont; ABrush: TBrush );
  function GetDefaultPriority( ASource_Module: string ): Real;
  procedure AssignTransAlertStatusColor( AInProcess, ASuspended: Boolean; AFont: TFont; ABrush: TBrush );
  function IsPlanReserved( AInvTransPlan_ID: Real ): Boolean;
  procedure CheckDeleteTransAlert( ATrans_Alert_ID: Real; AIncludeShuttleChildren: Boolean = FALSE );
  procedure CheckDeleteTransAlertUsingPlan( AInvTransPlanID: Real; AIncludeShuttleChildren: Boolean = FALSE );


  function TransRuleExists( AArinvt_ID: Real; ASourceModule, AKind: string; ADivision_ID: Real ): Boolean;

  {shortcut functions}
  function LocateRecvSourceModuleValue: string;
  function LocateKindValue: string;

  function IsWMS2Licensed: Boolean;

  procedure AssignPlanParamsMoveOut(var ACargo: TInvTransPlanCargo; ATrans_Alert_ID: Real);
  procedure AssignPlanParamsStaging( var ACargo: TInvTransPlanCargo; ATrans_Alert_ID: Real);

  function IsPlanSuccessful( AInvTransPlan_ID, AArinvt_ID: Real ): Boolean;
  function GetPlanFailureNote( AInvTransPlan_ID, AArinvt_ID: Real ): string;


const
  LocatingSrcModuleList: array [ TLocatingSrcModule ] of TValueCaption = ((Value: 'RECV';         Caption: 'Receiving'     ),
                                                                          (Value: 'DISPO';        Caption: 'Disposition In'),
                                                                          (Value: 'MOVE';         Caption: 'Moves'         ),
                                                                          (Value: 'STAGING';      Caption: 'Stage for Shipping'),
                                                                          (Value: 'RMA';          Caption: 'RMA'        )
                                                                          // (Value: 'INTERCOMPANY'; Caption: 'Inter Company' ),
                                                                          // (Value: 'XDOCK';        Caption: 'Cross Dock' )
                                                                          );

  PickingSrcModuleList : array [TPickingSrcModule] of TValueCaption    = ((Value: 'SHIPMENT';     Caption: 'Pick Tickets / Pack Slips'),
                                                                          // (Value: 'DISPO';        Caption: 'Disposition Out'       ),
                                                                          (Value: 'STAGING';      Caption: 'Work Order Staging'       )
                                                                          // (Value: 'INTERCOMPANY'; Caption: 'Inter Company'         )
                                                                          );

  procedure LoadSrcModulesInto( AwwDBComboBox: TUniDBComboBox; AKind: string );

const
  cnstLocatingKind = 'LOCATE';
  cnstPickingKind  = 'PICK';

implementation

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager;

procedure LoadSrcModulesInto( AwwDBComboBox: TUniDBComboBox; AKind: string );

  procedure _load( AList: array of TValueCaption );
  var
    I: Integer;
  begin
    AwwDBComboBox.Items.Clear;
    for I:= Low( AList ) to High(AList) do
      AwwDBComboBox.Items.Add(Format('%s'#9'%s', [ AList[I].Caption, AList[I].Value ]));
    //AwwDBComboBox.ApplyList;
  end;

begin
  if CompareText(AKind, 'LOCATE') = 0 then
     _load( LocatingSrcModuleList )
  else
     _load( PickingSrcModuleList );
end;

function TransRuleExists( AArinvt_ID: Real; ASourceModule, AKind: string; ADivision_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select inv_trans_eval.rule_exists( %f, ''%s'', ''%s'', %f ) from dual',
                     [ AArinvt_ID,
                       ASourceModule,
                       AKind,
                       ADivision_ID ]) = 1;
end;

{shortcut functions}
function LocateRecvSourceModuleValue: string;
begin
  Result:= LocatingSrcModuleList[ lsmReceive ].Value; {RECV}
end;

function LocateKindValue: string;
begin
  Result:= cnstLocatingKind; {LOCATE}
end;



{ TInvTransPlanCargo }
constructor TInvTransPlanCargo.Create( AInvTransPlan_ID: Real );
begin
  InvTransPlan_ID:= AInvTransPlan_ID;
  SourceModule   := '';
  Source         := '';
  Source_ID      := 0;
  Kind           := '';
  Trans_Alert_ID := 0;
  IsTemporaryPlan:= FALSE;
  ClearCargoParams:= TRUE;
end;

procedure TInvTransPlanCargo.AddToTemporaryMasterLabelList( AMaster_Label_ID: Real; ATruncate: Boolean);
begin
  if ATruncate then
     ClearTemporaryMasterLabelList;
  ExecuteCommandFmt('insert into gtt_inv_trans_master_label( id ) values( %f )', [ AMaster_Label_ID ]);
end;

procedure TInvTransPlanCargo.ClearTemporaryMasterLabelList;
begin
  ExecuteCommand('truncate table gtt_inv_trans_master_label');
end;


{priority support}
function GetPriorityLevel( APriority: Real ): TPriorityLevel;
var
  A: Variant;
begin
  Result:= plLow;

  A:= SelectValueArray( 'select high_priority, med_priority from inv_trans_params');
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  if (A[ 0 ] > 0) and (APriority >= A[ 0 ]) then
     Result:= plHigh
  else if (A[ 1 ] > 0) and (APriority >= A[ 1 ]) then
     Result:= plMed;
end;

procedure AssignPriorityLevelColor( APriority: Real; AFont: TFont; ABrush: TBrush );
  procedure _assign_color( ABrushColor, AFrontColor: TColor );
  begin
    ABrush.Color:= ABrushColor;
    AFont.Color := AFrontColor;
  end;
begin
  case inv_trans_share.GetPriorityLevel( APriority ) of
    plLow : _assign_color( clYellow, clBlack );
    plMed : _assign_color( clSkyBlue, clBlack );
    plHigh: _assign_color( clRed, clWhite );
  end;
end;

function GetDefaultPriority( ASource_Module: string ): Real;
var
  A: Variant;
begin
  Result:= 0;

  A:= SelectValueArray( 'select nvl(pick_ticket_priority, 99), nvl(receiving_priority, 99), nvl(mat_staging_priority, 99) from inv_trans_params');
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  if ASource_Module = 'PICKING' then
     Result:= A[ 0 ]
  else if ASource_Module = 'RECEIVING' then
     Result:= A[ 1 ]
  else if ASource_Module = 'STAGING' then
     Result:= A[ 2 ]
  else if ASource_Module = 'MOVE' then
     Result:= A[ 2 ]
  else if ASource_Module = 'DISPO' then
     Result:= A[ 2 ];
end;


procedure AssignTransAlertStatusColor( AInProcess, ASuspended: Boolean; AFont: TFont; ABrush: TBrush );

  procedure _assign_color( ABrushColor, AFrontColor: TColor );
  begin
    ABrush.Color:= ABrushColor;
    AFont.Color := AFrontColor;
  end;
begin
  if ASuspended  then
     _assign_color( clRed, clWhite )
  else if AInProcess then
     _assign_color( clYellow, clBlack );
end;

function IsWMS2Licensed: Boolean;
begin
  Result:= (SecurityManager <> nil) and SecurityManager.IsModuleLicensed( apWMS2 );
end;

function IsPlanReserved( AInvTransPlan_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from ptorder where reserved_inv_trans_plan_id = %f and rownum < 2', [ AInvTransPlan_ID ]) = 1;
end;

procedure CheckDeleteTransAlertUsingPlan( AInvTransPlanID: Real; AIncludeShuttleChildren: Boolean = FALSE );
var
  ATransAlertID: Real;
begin
  if AInvTransPlanID = 0 then
     Exit;
  ATransAlertID:= SelectValueFmtAsFloat('select id from trans_alert where inv_trans_plan_id = %f', [ AInvTransPlanID ]);

  if ATransAlertID > 0 then
     CheckDeleteTransAlert( ATransAlertID, AIncludeShuttleChildren )
  else
     ExecuteCommandFmt('delete from inv_trans_plan where id = %f', [ AInvTransPlanID ]);
end;


procedure CheckDeleteTransAlert( ATrans_Alert_ID: Real; AIncludeShuttleChildren: Boolean = FALSE );
var
  AInvTransPlan_ID: Real;
begin
  if SelectValueByID('1', 'trans_alert', ATrans_Alert_ID) = 0 then
     EXIT;

  // check if this trans alert is linked to the reserved plan and exit
  AInvTransPlan_ID:= SelectValueByID( 'inv_trans_plan_id', 'trans_alert', ATrans_Alert_ID);
  if IsPlanReserved( AInvTransPlan_ID ) then
     EXIT;

  if AIncludeShuttleChildren then
  begin
     // the trigget will delete everything including the children
     ExecuteCommandFmt('delete from trans_alert where id = %f', [ ATrans_Alert_ID ]);
     EXIT;
  end;

  // delete just that trans_alert - leave the children shuttle plans and trans alert
  ExecuteCommandFmt('declare                                                                       '+
            '  v_trans_alert_id number::= %f;                                              '+
            '  v_inv_trans_plan_id number::= %f;                                           '+
            'begin                                                                         '+
            '  update trans_alert set parent_id = null where parent_id = v_trans_alert_id; '+
         // '  delete from inv_trans_plan where id = v_inv_trans_plan_id;                  '+  // let trigger on trans_alert delete the inv_trans_plan
            '  trans_alert_share.archive_trans_alert( v_trans_alert_id );                  '+
            '  delete from trans_alert where id = v_trans_alert_id;                        '+
            'end;                                                                          ',
            [ ATrans_Alert_ID,
              AInvTransPlan_ID ]);
end;


procedure AssignPlanParamsMoveOut(var ACargo: TInvTransPlanCargo; ATrans_Alert_ID: Real);
begin
  ACargo:= TInvTransPlanCargo.Create( 0 );
  ACargo.SourceModule:= inv_trans_share.LocatingSrcModuleList[ inv_trans_share.lsmMove ].Value;   // MOVE
  ACargo.Source      := 'trans_alert';
  ACargo.Source_ID   := ATrans_Alert_ID;
  ACargo.Kind        := inv_trans_share.cnstLocatingKind;  // LOCATE
  ACargo.Trans_Alert_ID:= ATrans_Alert_ID;
end;


procedure AssignPlanParamsStaging( var ACargo: TInvTransPlanCargo; ATrans_Alert_ID: Real);
begin
  ACargo:= TInvTransPlanCargo.Create( 0 );
  ACargo.SourceModule:= inv_trans_share.PickingSrcModuleList[ inv_trans_share.psmStaging ].Value;   // STAGING
  ACargo.Source      := 'trans_alert';
  ACargo.Source_ID   := ATrans_Alert_ID;
  ACargo.Kind        := inv_trans_share.cnstPickingKind;  // PICK
  ACargo.Trans_Alert_ID:= ATrans_Alert_ID;
end;


function IsPlanSuccessful( AInvTransPlan_ID, AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select inv_trans_misc.failed_find_locations( %f, %f ) from dual', [AInvTransPlan_ID, AArinvt_ID]) = 0;
end;

function GetPlanFailureNote( AInvTransPlan_ID, AArinvt_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select note1                  '+
                        '  from inv_trans_item         '+
                        ' where inv_trans_plan_id = %f '+
                        '   and arinvt_id = %f         ',
                        [ AInvTransPlan_ID,
                          AArinvt_ID ]);
end;



end.

