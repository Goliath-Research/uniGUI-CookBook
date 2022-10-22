unit inv_trans_plan_dm;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  inv_trans_share,
  trans_share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt;

type
  TInvTransPlanDM = class(TDataModule)
    QryTransAlertMove: TFDQuery;
    QryTransAlertMoveLOTNO: TStringField;
    QryTransAlertMoveQTY: TFMTBCDField;
    QryTransAlertMoveINV_TRANS_ITEM_PTSPER: TFMTBCDField;
    QryTransAlertMoveFGMULTI_ID: TBCDField;
    QryTransAlertMoveMASTER_LABEL_ID: TBCDField;
    QryTransAlertMoveID: TBCDField;
    QryTransAlertMoveTRANS_ALERT_ID: TBCDField;
    QryTransAlertMoveINV_TRANS_DETAIL_ID: TBCDField;
    QryTransAlertMoveINV_TRANS_ITEM_ID: TBCDField;
    QryTransAlertMoveINV_TRANS_ITEM_DIVISION_ID: TBCDField;
    QryTransAlertMoveTRANS_ALERT_LOCATIONS_ID: TBCDField;
    QryTransLocMove: TFDQuery;
    QryTransLocMoveQTY: TFMTBCDField;
    QryTransLocMoveUNITS: TBCDField;
    QryTransLocMoveID: TBCDField;
    QryTransLocMoveINV_TRANS_DETAIL_ID: TBCDField;
    QryTransLocMoveLOCATIONS_ID: TBCDField;
    QryTransLocMoveINV_TRANS_ITEM_ID: TBCDField;
    SrcTransAlertMove: TDataSource;
    QryTransAlertMoveARINVT_ID: TBCDField;
    QryTransAlertMoveSTANDARD_ID: TFMTBCDField;
    QryTransAlertMoveWORKORDER_ID: TBCDField;
    QryTransLocMoveLOTNO: TStringField;
    procedure QryTransAlertMoveBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FCargo: TInvTransPlanCargo;
    function IsTransAlertMove( AInOut: string ): Boolean;
    procedure DeleteInvTransLocDetail(AInv_Trans_Item_ID: Real);
    procedure CheckAddToExcludeList(AFGMultiExcludeList: TStringList);

    procedure PrepareTransAlertMoveOut;
    procedure PrepareTransAlertMoveIn;

    procedure AssignDefaultFGMulti( var AFGMulti_ID    : Real;
                             AArinvt_ID         : Real;
                             ALocations_ID      : Real;
                             ALotNo             : string;
                             AStandard_ID       : Real;
                             ADivision_ID       : Real;
                             AWorkorder_ID      : Real;
                             AFGMultiExcludeList: TStringList );

    procedure AssignDefaultFGMultiFIFO( AList        : TList;
                                        AQty         : Real;
                                        ARG_Qty      : Real;
                                        AArinvt_ID   : Real;
                                        ALocations_ID: Real;
                                        ALotNo       : string;
                                        AStandard_ID : Real;
                                        ADivision_ID : Real = 0;
                                        AInclude_All_Locations: Boolean = FALSE;
                                        AMandatoryLotNo: string = '';
                                        AShipment_Dtl_ID_In_Transit: Real = 0;
                                        AWorkorder_ID: Real = 0;
                                        AOnHandTransConsumed: TOnHandTransConsumed = nil;  // trans_share.pas
                                        AFGMultiExcludeList: TStringList = nil );
  public
    { Public declarations }
    constructor Create( AOwner: TComponent;  ACargo: TInvTransPlanCargo );
    procedure PrepareTransactionLocations;
  end;

var
  InvTransPlanDM: TInvTransPlanDM;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dispo,
  IQMS.Common.Controls;


{ TInvTransPlanDM }

constructor TInvTransPlanDM.Create(AOwner: TComponent;  ACargo: TInvTransPlanCargo);
begin
  FCargo:= ACargo;
  inherited Create(AOwner);
end;

// -----------------------------------------------------------------------------
// MAIN Dispatcher
// -----------------------------------------------------------------------------
procedure TInvTransPlanDM.PrepareTransactionLocations;
begin
  if IsTransAlertMove('OUT') then
     PrepareTransAlertMoveOut

  else if IsTransAlertMove('IN') then
     PrepareTransAlertMoveIn

end;


function TInvTransPlanDM.IsTransAlertMove( AInOut: string ): Boolean;
begin
  if AInOut = 'OUT' then with FCargo do
     Result:= (SourceModule = inv_trans_share.LocatingSrcModuleList[ inv_trans_share.lsmMove ].Value)  // MOVE
              and
              (Source = 'trans_alert')
              and
              (Kind = inv_trans_share.cnstLocatingKind) // LOCATE
              and
              (SelectValueByID('trans_in_out', 'trans_alert', Source_ID) = AInOut )

  else if AInOut = 'IN' then with FCargo do
     Result:= (SourceModule = inv_trans_share.PickingSrcModuleList[ inv_trans_share.psmStaging ].Value)  // STAGING
              and
              (Source = 'trans_alert')
              and
              (Kind = inv_trans_share.cnstPickingKind)  // PICK
              and
              (SelectValueByID('trans_in_out', 'trans_alert', Source_ID) = AInOut );
end;

procedure TInvTransPlanDM.QryTransAlertMoveBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('trans_alert_id').Value := FCargo.Source_ID;
    ParamByName('inv_trans_plan_id').Value := FCargo.InvTransPlan_ID;
  end;
end;

procedure TInvTransPlanDM.DeleteInvTransLocDetail( AInv_Trans_Item_ID: Real );
begin
  ExecuteCommandFmt('delete from inv_trans_loc_detail                                         '+
            ' where inv_trans_locations_id in                                         '+
            '       (select id from inv_trans_locations where inv_trans_item_id = %f) ',
            [ AInv_Trans_Item_ID ]);
end;

procedure TInvTransPlanDM.CheckAddToExcludeList( AFGMultiExcludeList: TStringList );
var
  i: Integer;
begin
  if not Assigned(AFGMultiExcludeList) or (AFGMultiExcludeList.Count = 0) then
     EXIT;
  for i:= 0 to AFGMultiExcludeList.Count -  1 do
    IQMS.Common.Dispo.AddToExcludeList( StrToFloat(AFGMultiExcludeList[ i ] ));
end;


procedure TInvTransPlanDM.AssignDefaultFGMulti( var AFGMulti_ID    : Real;
                                         AArinvt_ID         : Real;
                                         ALocations_ID      : Real;
                                         ALotNo             : string;
                                         AStandard_ID       : Real;
                                         ADivision_ID       : Real;
                                         AWorkorder_ID      : Real;
                                         AFGMultiExcludeList: TStringList );
begin
  IQMS.Common.Dispo.ActivateInvTransPlan( ALocations_ID, ALotNo );
  try
    // exclude fgmulti if passed
    CheckAddToExcludeList(AFGMultiExcludeList);

    // find the fgmulti
    AFGMulti_ID:= IQMS.Common.Dispo.GetAutoDispoFGMultiID( AArinvt_ID,
                                                 AStandard_ID,
                                                 '',                            // ADefaultLocation, not used since we EnableInvTransPlan with Locations_ID
                                                 ALotNo,
                                                 0,                             // AWork_center_id
                                                 ADivision_ID,
                                                 AWorkorder_ID,
                                                 0 );                           // AOrd_Detail_ID
  finally
    IQMS.Common.Dispo.DeactivateInvTransPlan;
  end;
end;


procedure TInvTransPlanDM.AssignDefaultFGMultiFIFO( AList        : TList;
                                                    AQty         : Real;
                                                    ARG_Qty      : Real;
                                                    AArinvt_ID   : Real;
                                                    ALocations_ID: Real;
                                                    ALotNo       : string;
                                                    AStandard_ID : Real;
                                                    ADivision_ID : Real = 0;
                                                    AInclude_All_Locations: Boolean = FALSE;
                                                    AMandatoryLotNo: string = '';
                                                    AShipment_Dtl_ID_In_Transit: Real = 0;
                                                    AWorkorder_ID: Real = 0;
                                                    AOnHandTransConsumed: TOnHandTransConsumed = nil;  // trans_share.pas
                                                    AFGMultiExcludeList: TStringList = nil );
begin
  IQMS.Common.Dispo.ActivateInvTransPlan( ALocations_ID, ALotNo );
  try
    // exclude fgmulti if passed
    CheckAddToExcludeList(AFGMultiExcludeList);

    // find the fgmulti
    IQMS.Common.Dispo.GetAutoDispoFGMultiFIFO( AList,
                                     AQty,
                                     ARG_Qty,
                                     AArinvt_ID,
                                     AStandard_ID,
                                     '',                            // ADefaultLocation, not used since we EnableInvTransPlan with Locations_ID
                                     0,                             // AWork_center_id
                                     ADivision_ID,
                                     AInclude_All_Locations,
                                     AMandatoryLotNo,
                                     AShipment_Dtl_ID_In_Transit,
                                     AWorkorder_ID,
                                     AOnHandTransConsumed );

  finally
    IQMS.Common.Dispo.DeactivateInvTransPlan;
  end;
end;




// -----------------------------------------------------------------------------
//  MOVE OUT to multiple locations
// -----------------------------------------------------------------------------
procedure TInvTransPlanDM.PrepareTransAlertMoveOut;
var
  AFGMulti_ID: Real;
  AFGMultiExcludeList: TStringList;

  // ---------------------------------------------------------------------------
  procedure _PrepareOut;
  label
    next_rec;
  begin
    with QryTransAlertMove do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('FGMULTI_ID').asFloat > 0 then
        begin
          AFGMulti_ID:= FieldByName('FGMULTI_ID').asFloat;
          goto next_rec;
        end;
        // for this location and lotno ensure fgmulti is assigned
        AssignDefaultFGMulti( AFGMulti_ID,
                              QryTransAlertMoveARINVT_ID.asFloat,
                              QryTransAlertMoveTRANS_ALERT_LOCATIONS_ID.asFloat,
                              QryTransAlertMoveLOTNO.asString,
                              QryTransAlertMoveSTANDARD_ID.asFloat,
                              QryTransAlertMoveINV_TRANS_ITEM_DIVISION_ID.asFloat,
                              QryTransAlertMoveWORKORDER_ID.asFloat,
                              nil );                                             // AFGMultiExcludeList

        ExecuteCommandFmt('update trans_alert_detail set fgmulti_id = %f where id = %f', [ AFGMulti_ID, FieldByName('id').asFloat ]);

        next_rec:
        AFGMultiExcludeList.Add( FloatToStr( AFGMulti_ID ));
        Next;
      end;
    end;
  end;

  // ---------------------------------------------------------------------------
  procedure _PrepareIn;
  label
    next_rec;
  begin
    with QryTransLocMove do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('locations_id').asFloat = 0 then
           goto next_rec;

        // for this location and lotno ensure fgmulti is assigned
        AssignDefaultFGMulti( AFGMulti_ID,
                              QryTransAlertMoveARINVT_ID.asFloat,
                              QryTransLocMoveLOCATIONS_ID.asFloat,
                              QryTransAlertMoveLOTNO.asString,
                              QryTransAlertMoveSTANDARD_ID.asFloat,
                              QryTransAlertMoveINV_TRANS_ITEM_DIVISION_ID.asFloat,
                              QryTransAlertMoveWORKORDER_ID.asFloat,
                              AFGMultiExcludeList );

        // append to inv_trans_loc_detail
        ExecuteCommandFmt('insert into inv_trans_loc_detail                               '+
                  '     ( inv_trans_locations_id, fgmulti_id, qty, units, lotno ) '+
                  'values                                                         '+
                  '     ( %f, %f, %.6f, %f, ''%s'' )                              ',
                  [ QryTransLocMoveID.asFloat,
                    AFGMulti_ID,
                    QryTransLocMoveQTY.asFloat,
                    QryTransLocMoveUNITS.asFloat,
                    QryTransAlertMoveLOTNO.asString ]);

        next_rec:
        Next;
      end;
    end;
  end;

begin
  // reopen parent - child queries
  Reopen( QryTransAlertMove );
  Reopen( QryTransLocMove );

  // reset inv_trans_loc_detail
  DeleteInvTransLocDetail( QryTransAlertMoveINV_TRANS_ITEM_ID.asFloat );

  AFGMultiExcludeList:= TStringList.Create;
  try
    _PrepareOut;
    _PrepareIn;
  finally
    AFGMultiExcludeList.Free;
  end;

  // reopen parent - child queries
  Reopen( QryTransAlertMove );
  Reopen( QryTransLocMove );
end;



// -----------------------------------------------------------------------------
//  MOVE IN --------------------------------------------------------------------
// -----------------------------------------------------------------------------
procedure TInvTransPlanDM.PrepareTransAlertMoveIn;
var
  AFGMulti_ID: Real;
  AList      : TList;
  AFGMultiExcludeList: TStringList;

  // ---------------------------------------------------------------------------
  procedure _PrepareOut;
  label
    next_rec;
  var
    I: Integer;
  begin
    ClearListOfObjects( AList );
    with QryTransLocMove do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('locations_id').asFloat = 0 then
           goto next_rec;

        // for this location and lotno ensure fgmulti is assigned
        AssignDefaultFGMultiFIFO( AList,
                                  QryTransLocMoveQTY.asFloat,
                                  0,                                 // ARG_Qty
                                  QryTransAlertMoveARINVT_ID.asFloat,
                                  QryTransLocMoveLOCATIONS_ID.asFloat,
                                  QryTransLocMoveLOTNO.asString,
                                  QryTransAlertMoveSTANDARD_ID.asFloat,
                                  0,                                 // division_id
                                  FALSE,                             // AInclude_All_Locations
                                  '',                                // AMandatoryLotNo
                                  0,                                 // AShipment_Dtl_ID_In_Transit
                                  QryTransAlertMoveWORKORDER_ID.asFloat,
                                  nil,                               // TOnHandTransConsumed = nil  // trans_share.pas
                                  AFGMultiExcludeList );             // AFGMultiExcludeList

        IQAssert( AList.Count > 0, 'Failed to determine OUT location/lotno (fgmulti)');  // s/n happen

        // append to inv_trans_loc_detail
        for i:= 0 to AList.Count - 1 do
          ExecuteCommandFmt('insert into inv_trans_loc_detail                               '+
                    '     ( inv_trans_locations_id, fgmulti_id, qty, units, lotno ) '+
                    'values                                                         '+
                    '     ( %f, %f, %.6f, %d, ''%s'' )                              ',
                    [ QryTransLocMoveID.asFloat,
                      TFGMultiFIFO( AList[ i ]).FGMulti_ID,
                      TFGMultiFIFO( AList[ i ]).Qty,
                      Trunc((TFGMultiFIFO( AList[ i ]).Qty / QryTransAlertMoveINV_TRANS_ITEM_PTSPER.asFloat) + 0.999999),  // units
                      QryTransLocMoveLOTNO.asString ]);

        next_rec:
        Next;
      end;
    end;
  end;


  // ---------------------------------------------------------------------------
  procedure _PrepareIn;
  label
    next_rec;
  begin
    ClearListOfObjects( AList );
    with QryTransAlertMove do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('FGMULTI_ID').asFloat > 0 then
        begin
          AFGMulti_ID:= FieldByName('FGMULTI_ID').asFloat;
          goto next_rec;
        end;

        // for this location and lotno ensure fgmulti is assigned
        AssignDefaultFGMultiFIFO( AList,
                                  QryTransAlertMoveQTY.asFloat,
                                  0,                                 // ARG_Qty
                                  QryTransAlertMoveARINVT_ID.asFloat,
                                  QryTransAlertMoveTRANS_ALERT_LOCATIONS_ID.asFloat,
                                  QryTransAlertMoveLOTNO.asString,
                                  QryTransAlertMoveSTANDARD_ID.asFloat,
                                  QryTransAlertMoveINV_TRANS_ITEM_DIVISION_ID.asFloat,
                                  FALSE,                             // AInclude_All_Locations
                                  '',                                //  AMandatoryLotNo
                                  0,                                 // AShipment_Dtl_ID_In_Transit
                                  QryTransAlertMoveWORKORDER_ID.asFloat,
                                  nil,                               // TOnHandTransConsumed = nil  // trans_share.pas
                                  nil );                             // AFGMultiExcludeList

        IQAssert( AList.Count > 0, 'Failed to determine IN location/lotno (fgmulti)');  // s/n happen

        // for now grab the 1st location found
        AFGMulti_ID:= TFGMultiFIFO( AList[ 0 ]).FGMulti_ID;

        ExecuteCommandFmt('update trans_alert_detail set fgmulti_id = %f where id = %f', [ AFGMulti_ID, FieldByName('id').asFloat ]);

        next_rec:
        AFGMultiExcludeList.Add( FloatToStr( AFGMulti_ID ));
        Next;
      end;
    end;
  end;


begin
  // reopen parent - child queries
  Reopen( QryTransAlertMove );
  Reopen( QryTransLocMove );

  // reset inv_trans_loc_detail
  DeleteInvTransLocDetail( QryTransAlertMoveINV_TRANS_ITEM_ID.asFloat );

  AFGMultiExcludeList:= TStringList.Create;
  AList:= TList.Create;
  try
    _PrepareIn;
    _PrepareOut;
  finally
    AFGMultiExcludeList.Free;
    ClearListOfObjects( AList );
    AList.Free;
  end;

  // reopen parent - child queries
  Reopen( QryTransAlertMove );
  Reopen( QryTransLocMove );
end;


end.
