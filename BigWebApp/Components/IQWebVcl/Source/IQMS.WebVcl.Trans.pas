unit IQMS.WebVcl.Trans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys,
  FireDAC.Phys.Intf, FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  IQMS.PackSlip.VMIShared;

const
  TRAN_IN  = 'IN';
  TRAN_OUT = 'OUT';

  TRAN_TYPE_CONFORM           = 'CONFORM';
  TRAN_TYPE_MANUAL            = 'MANUAL';
  TRAN_TYPE_MOVE_LOC          = 'MOVE_LOCATION';
  TRAN_TYPE_PACKSLIP          = 'PACKING SLIP';
  TRAN_TYPE_PACKSLIP_VOID     = 'VOID PACKING SLIP';
  TRAN_TYPE_RMA               = 'RMA';
  TRAN_TYPE_RMA_VOID          = 'VOID RMA';
  TRAN_TYPE_PO                = 'PO';
  TRAN_TYPE_PO_VOID           = 'VOID PO';
  TRAN_TYPE_PO_REJECTED_VOID  = 'VOID REJECTED PO';
  TRAN_TYPE_PO_RECEIVED_VOID  = 'VOID RECEIVED PO';
  TRAN_TYPE_PO_REJECT         = 'REJECT PO';
  TRAN_TYPE_DISPO             = 'DISPOSITION';
  TRAN_TYPE_MANUAL_WITH_BF    = 'MANUAL/BACKFLUSH';
  TRAN_TYPE_FLOOR_DISPO       = 'DISPOSITION';        // 'FLOOR DISPO';
  TRAN_TYPE_MANUAL_ASSOCIATED = 'MANUAL/ASSOCIATED';
  TRAN_TYPE_PHYS_INV          = 'PHYSICAL INVENTORY';
  TRAN_TYPE_OH                = 'OVERHEAD';
  TRAN_TYPE_LABOR             = 'LABOR';
  TRAN_TYPE_PM                = 'PM';
  TRAN_TYPE_TOOLING           = 'TOOLING';
  TRAN_TYPE_INV_SCRAP         = 'INVENTORY SCRAP';  {No corresponding component}
  TRAN_TYPE_VEND_RMA          = 'VENDOR RMA';
  TRAN_TYPE_VEND_RMA_VOID     = 'VOID VENDOR RMA';
  TRAN_TYPE_VMI_CONSUME       = 'CONSUME VMI SHIPMENT';
  TRAN_TYPE_VMI_MOVE_LOC      = 'VMI MOVE_LOCATION';
  TRAN_TYPE_INTERPLANT        = 'INTERPLANT XFER';
  TRAN_TYPE_INTERPLANT_VMI    = 'VMI INTERPLANT XFER';
  TRAN_TYPE_REPAIR            = 'REPAIR';
  TRAN_TYPE_REPAIR_FINISHED   = 'REPAIR FINISHED';
  TRAN_TYPE_VMI_RETURN        = 'VMI RETURN';
  TRAN_TYPE_IN_TRANSIT_MOVE   = 'MOVE IN-TRANSIT';
  TRAN_TYPE_PO_NON_INV        = 'PO-NON INVENTORY';  // 'PO_NON_INV';
  TRAN_TYPE_PO_NON_INV_VOID   = 'PO_NON_INV_VOID';
  TRAN_TYPE_REWORK            = 'REWORK';
  TRAN_TYPE_REWORK_FINISHED   = 'REWORK FINISHED';
  TRAN_TYPE_RETURN_IN_TRANSIT = 'RETURN IN-TRANSIT';
  TRAN_TYPE_PROCESS_WIP       = 'PROCESS WIP';
  TRAN_TYPE_FINISH_PROCESS_WIP= 'FINISH PROCESS WIP';   // both 'FINISH PROCESS WIP' and 'FINISH ASSEMBLY' are used during final assembly.
  TRAN_TYPE_FINISH_ASSEMBLY   = 'FINISH ASSEMBLY';      // 'FINISH PROCESS WIP' is used when backflush each process is ON and 'FINISH ASSEMBLY' is when OFF
  TRAN_TYPE_REVERSE_BACKFLUSH = 'REVERSE_BACKFLUSH';    // used in voiding assy1 mfg parts rejects and voiding assy1 good parts. there is no OUT - just IN trans of components.
  TRAN_TYPE_ADJUST_WIP        = 'ADJUST WIP';
  TRAN_TYPE_PO_VMI            = 'PO_VMI';               // receive VMI po detail
  TRAN_TYPE_PO_VMI_CONSUME    = 'CONSUME PO_VMI';
  TRAN_TYPE_PO_VMI_VOID       = 'VOID PO_VMI';
  TRAN_TYPE_ICA               = 'ICA';                  // Inventory Cost Adjustment
  TRAN_TYPE_LANDED_COST       = 'LANDED COST';          // Landed Cost i.e. freight (used in receiving)
  TRAN_TYPE_NON_INV_VEND_RMA  = 'NON_INV_VEND_RMA';
  TRAN_TYPE_NON_INV_VEND_RMA_VOID     = 'VOID_NON_INV_VEND_RMA';


  // Reminder: add new trans_type to PopulateTransTypeList procedure in this unit and also trans_share package

type
  TInvTranClass = class of TIQWebInvTranBase;
  TNotifyTranExecute = procedure (Sender:TObject) of object;

  TTransTypeSkin = (ttsNone, ttsFloorDispo);

  TTransMissingLotExpiryDateAction = (meaNone, meaPrompt, meaRaiseException);

  TMissingLotExpiryDate = class(Exception);

  TCrossArinvtCargo = record
    SrcArinvt_ID: Real;
    TrgArinvt_ID: Real;
    TrgDivision_ID: Real;
    Act_Cost: Real;
    constructor Create( ASrcArinvt_ID: Real );
  end;

  TMasterLabelInfoCargo = record
    ID: Real;
    Serial: string;
    FGMulti_ID: Real;
    constructor Create( AMaster_Label_ID: Real; ADB: string = 'IQFD' );
  end;

  { Base Transaction with a Batch #}

  TIQWebTranBase = class( TComponent )
  private
    FID               : Real;
    FTrans_Type       : string;
    FTrans_Batch      : Real;
    FTransBatchAutoInc: Boolean;
    FAfterTranExecute : TNotifyTranExecute;
    FBeforeTranExecute: TNotifyTranExecute;
    FTrans_Date       : TDateTime;
    FUserID           : string;
    FConfirmError     : Boolean;
    FDay_Part_ID      : Double;
    FTrans_Reason     : string;
    FTrans_in_out     : string;
    FParent_Arinvt_ID : Double;

    FTrans_Source     : string;
    FTrans_Source_ID  : Double;

    FAct_Cost         : Extended;
    FAct_Qty          : Extended;
    FOrderNo          : string;
    FMfgNo            : string;
    FStandard_ID      : Real;
    FRECEIPTNO        : string;
    FTrackNo          : string;
    FCheckForChangingSkid: Boolean;
    FTrans_Code_ID    : Real;
    FWorkOrder_ID     : Real;
    FRma_Detail_ID    : Real;        {used in Repair type}
    FRework_ID        : Real;        {this is wf_deviation_item_id}
    FTransErrCode     : Integer;
    FFab_Lot_ID       : Real;
    FRecv_Date        : TDateTime;

    FAllowMoveInTransit: Boolean;
    FAllowZeroQty      : Boolean;
    FIs_Labels_Updated: string;
    FAllowHardAllocatedTrans: Boolean;
    FAllowMakeToOrderTrans: Boolean;
    FAllowGoingNegative: Boolean;
    FAllowVMIMove      : Boolean;

    FTransTypeSkin: TTransTypeSkin;
    FAttribute: string;
    FTrans_Note: string;
    FReceipt_Comment: string;

    FForce_EPlant_ID: Real; // 10-07-2010
    FPtoper_ID: Real;  // 03-14-2012

    FWork_Center_ID: Real;
    FSkipEmptyFGMultiDelete: Boolean;
    FTa_Labor_id:Real;
    FDataBaseName: string;
    FRaiseExceptionOnError: Boolean;

    procedure SetWorkOrder_ID( AValue: Real ); virtual;
    procedure SetFab_Lot_ID(const Value: Real); virtual;
    procedure SetRework_ID(Value: Real); virtual;
    class procedure ExecuteCrossArinvtMove( ATrans: TIQWebTranBase; ACargo: TCrossArinvtCargo; ADB: string = 'IQFD' );

  protected
    FSub_Batch        : Real;
    FAssociatedTransList: TList;   // 12-08-2014 optional. designed for landed cost during ICT move

    procedure SetRma_Detail_ID( Value: Real ); virtual;
    procedure SetDay_Part_ID( AValue: Double ); virtual;
    property TransBatchAutoInc : Boolean read FTransBatchAutoInc write FTransBatchAutoInc;
    property ID : Real read FID write FID ;
    property Trans_Reason  : string  read FTrans_Reason  write FTrans_Reason ;
    property Parent_Arinvt_ID: Double    read FParent_Arinvt_ID  write FParent_Arinvt_ID;
    property OrderNo: string  read FOrderNo write FOrderNo;
    property MfgNo  : string  read FMfgNo   write FMfgNo;
    property RECEIPTNO : string  read FRECEIPTNO   write FRECEIPTNO;
    property TrackNo: string read FTrackNo write FTrackNo;

    property Trans_Source  : string  read FTrans_Source  write FTrans_Source ;
    property Trans_Source_ID : Double  read FTrans_Source_ID  write FTrans_Source_ID ;

    procedure PrepareTransaction; virtual;
    procedure RemoveLeftInInvTransSameTransBatch;
    procedure SetStandard_ID(const Value: Real); virtual;
    procedure CheckApplyCrossArinvtMove; virtual;
    function IsTollItemDefined: Boolean;

  public
    KeepMixedPalletReference: Boolean;
    KeepPalletReference: Boolean;

    property Trans_Code_ID: Real read FTrans_Code_ID     write FTrans_Code_ID;
    property Trans_Batch : Real      read FTrans_Batch   write FTrans_Batch;
    property Sub_Batch   : Real      read FSub_Batch     write FSub_Batch;
    property Trans_Date  : TDateTime read FTrans_Date    write FTrans_Date;
    property UserID      : string    read FUserID        write FUserID ;
    property Day_Part_ID : Double    read FDay_Part_ID   write SetDay_Part_ID;
    property WorkOrder_ID: Real      read FWorkOrder_ID  write SetWorkOrder_ID;
    property Rma_Detail_ID: Real     read FRma_Detail_ID write SetRma_Detail_ID;
    property Rework_ID: Real         read FRework_ID     write SetRework_ID;
    property Trans_in_out: string    read FTrans_in_out  write FTrans_in_out ;
    property Act_Cost    : Extended  read FAct_Cost      write FAct_Cost     ;
    property Act_Qty    : Extended   read FAct_Qty       write FAct_Qty     ;
    property CheckForChangingSkid: Boolean read FCheckForChangingSkid write FCheckForChangingSkid;
    property TransErrCode: Integer   read FTransErrCode  write FTransErrCode;
    property Fab_Lot_ID  : Real      read FFab_Lot_ID    write SetFab_Lot_ID;
    property AllowMoveInTransit: Boolean read FAllowMoveInTransit write FAllowMoveInTransit;
    property AllowMakeToOrderTrans: Boolean read FAllowMakeToOrderTrans write FAllowMakeToOrderTrans;
    property AllowHardAllocatedTrans: Boolean read FAllowHardAllocatedTrans write FAllowHardAllocatedTrans;
    property AllowGoingNegative: Boolean read FAllowGoingNegative write FAllowGoingNegative;
    property AllowVMIMove      : Boolean read FAllowVMIMove write FAllowVMIMove;
    property TA_Labor_Id: Real    read FTA_Labor_id  write FTA_Labor_id ;

    property AllowZeroQty: Boolean read FAllowZeroQty write FAllowZeroQty;
    property Standard_ID   : Real read FStandard_ID  write SetStandard_ID  ;

    property Is_Labels_Updated: string read FIs_Labels_Updated write FIs_Labels_Updated;
    property Recv_Date  : TDateTime read FRecv_Date    write FRecv_Date;
    property TransTypeSkin: TTransTypeSkin read FTransTypeSkin write FTransTypeSkin;
    property Attribute: string read FAttribute write FAttribute;
    property Trans_Note: string read FTrans_Note write FTrans_Note;
    property Receipt_Comment: string read FReceipt_Comment write FReceipt_Comment;
    property Ptoper_ID: Real read FPtoper_ID write FPtoper_ID;
    property Work_Center_ID: Real read FWork_Center_ID write FWork_Center_ID;
    property SkipEmptyFGMultiDelete: Boolean read FSkipEmptyFGMultiDelete write FSkipEmptyFGMultiDelete;
    property TransDataBaseName      : string    read FDataBaseName        write FDataBaseName ;
    property RaiseExceptionOnError: Boolean read FRaiseExceptionOnError write FRaiseExceptionOnError;

    constructor Create( AComponent:TComponent ); override;
    destructor Destroy; override;
    procedure CreateTransactionRecord; virtual; abstract;
    procedure Execute; virtual;
    function PostTransaction: Integer; virtual;
    procedure ValidateTransaction; virtual;
    procedure AssignFields( DataSet:TDataSet ); virtual;
    procedure DoInternalAfterTranExecute; virtual;
    class procedure CheckAssignAutoDispo( AFGMulti_ID, ATrg_FGMulti_ID: Real; DB:String = 'IQFD' );
    procedure AppendAttribute( Value: string );
    procedure AddLandedCost( ACost: Real; AElement: string; AIn_Out: string );
    procedure AddAssociatedTrans( AChild: TIQWebTranBase );  // 12-08-2014 optional. designed for landed cost during ICT move
    procedure CreateAssociatedTransactionRecord;
    function FgMultiArinvt_ID( AFGMuti_ID: Real ): Real;
    procedure DeleteEmptyLocations( ATrans_Batch: Real; ADB: string = 'IQFD' );

  published
    property Trans_Type: string read FTrans_Type write FTrans_Type;
    property ConfirmError : Boolean read FConfirmError write FConfirmError;
    property AfterTranExecute : TNotifyTranExecute read FAfterTranExecute  write FAfterTranExecute ;
    property BeforeTranExecute: TNotifyTranExecute read FBeforeTranExecute write FBeforeTranExecute;
  end;


  { Base Inventory Transaction }

  TIQWebInvTranBase = class(TIQWebTranBase)
  private
    FArinvt_ID            : Double;
    FTrans_Quan           : Extended;
    FTrans_rg_quan        : Extended;
    FLocations_ID         : Real;
    FLotNo                : string;
    FFG_LotNo             : string;
    FReject_Code          : string;
    FFGMulti_ID           : Double;
    FCUser1               : string;
    FCUser2               : string;
    FCUser3               : string;
    FCost_Element         : string;
    FTop_Phantom_Arinvt_ID: Real;
    FLot_Date             : TDateTime;
    procedure CheckHardAllocatedMaterialToWorkOrder;
    procedure CheckMakeToOrder;
    procedure SetFGMulti_ID(const Value: Double);
  protected
    property Arinvt_ID            : Double    read FArinvt_ID             write FArinvt_ID    ;
    property Trans_Quan           : Extended  read FTrans_Quan            write FTrans_Quan   ;
    property Trans_Rg_Quan        : Extended  read FTrans_rg_quan         write FTrans_rg_quan;
    property Locations_ID         : Real      read FLocations_ID          write FLocations_ID ;
    property Reject_Code          : string    read FReject_Code           write FReject_Code  ;
    property FGMulti_ID           : Double    read FFGMulti_ID            write SetFGMulti_ID   ;
    property Cost_Element         : string    read FCost_Element          write FCost_Element ;
    property Top_Phantom_Arinvt_ID: Real      read FTop_Phantom_Arinvt_ID write FTop_Phantom_Arinvt_ID;
    property LotNo                : string    read FLotNo                 write FLotNo        ;
    property FG_LotNo             : string    read FFG_LotNo              write FFG_LotNo     ;
    property Lot_Date             : TDateTime read FLot_Date              write FLot_Date     ;

    procedure ValidateMakeToOrderOnMoveBetweenShipmentToFromInventory( ATransactionSource: string = '*'; ATransactionSource_ID: Real = -1);
    function GetTollItemInfo( var ACargo: TCrossArinvtCargo ): Boolean;

  public
    property CUser1          : string    read FCUser1         write FCUser1;
    property CUser2          : string    read FCUser2         write FCUser2;
    property CUser3          : string    read FCUser3         write FCUser3;

    constructor Create( AComponent:TComponent ); override;
    procedure AssignFields( DataSet:TDataSet ); override;
    procedure CreateTransactionRecord; override;
    procedure ValidateTransaction; override;
    class function GetMakeToOrderDetail_ID_FromShipmentDetail_ID( AShipment_Dtl_ID: Real; DB:String = 'IQFD' ): Real;
  end;


  { TIQWebInvTranBaseCustom }

  TIQWebInvTranBaseCustom = class(TIQWebInvTranBase)
  private
    FMaster_Label_List: TStringList;                {normally is not created in this unit - always populated and passed from outside}
    FIsMasterLabelListCreatedInternally: Boolean;   {example when created internally - prod dispo of consumed serialized items}
    FSkipMasterLabelUpdate: Boolean;
    FSkipTranslogMasterLabelUpdate: Boolean;
    FOverrideMasterLabelQty: Boolean;
    FSkipMasterLabelLocationIntegrityCheck : Boolean;
    FMissingLotExpiryDateAction: TTransMissingLotExpiryDateAction; // (meaNone, meaPrompt, meaRaiseException);
    procedure AssignCUserFields( DataSet:TDataSet );
    procedure AssignDivisionInfo(DataSet:TDataSet);
    procedure AssignTransCode( DataSet: TDataSet );
    procedure CheckMandatoryLotNo;
    procedure CheckMandatoryLotExpiryDate;
    procedure CheckWorkCenterDispoOutQty;
  protected
    property Master_Label_List: TStringList read FMaster_Label_List write FMaster_Label_List;
    procedure ClearNeedCycleCount;
    procedure CheckAppendToInvtrans_Master_Label;
    procedure UpdateMasterLabelDuringPhysicalAdjustment( AQty: Real );
    procedure UpdateNon_Conform( ANon_Conform_ID: Real; ANon_Conform_Allocatable: string = '');
  public
    property SkipMasterLabelUpdate: Boolean read FSkipMasterLabelUpdate write FSkipMasterLabelUpdate;
    property SkipTranslogMasterLabelUpdate: Boolean read FSkipTranslogMasterLabelUpdate write FSkipTranslogMasterLabelUpdate;
    property MissingLotExpiryDateAction: TTransMissingLotExpiryDateAction read FMissingLotExpiryDateAction write FMissingLotExpiryDateAction;
    property SkipMasterLabelLocationIntegrityCheck: Boolean read FSkipMasterLabelLocationIntegrityCheck write FSkipMasterLabelLocationIntegrityCheck;

    procedure AssignFields( DataSet:TDataSet ); override;
    procedure CheckAppendTo_Translog_Master_Label; virtual;
    procedure CreateInternalMasterLabelListWithLabels( AList: TStringList );
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
    procedure CreateTransactionRecord; override;
    destructor Destroy; override;
  published
    property FGMulti_ID;
    property Trans_Quan;
    property Trans_RG_Quan;
    property Trans_Reason;
    property Trans_Source;
    property Trans_Source_ID;
    property Act_Cost;
    property Act_Qty;
  end;

  {predeclare the TIQWebTransOut so we could have this type variable in TIQWebTransIn}
  TIQWebTransOut = class;

  { IN Transaction }

  TIQWebTransIn = class(TIQWebInvTranBaseCustom )
  private
    FParentTrans: TIQWebTransOut;  // used in OUT to many IN move transaction
    FPreserveDispoDate: Boolean;
    procedure CheckConsumeLabelToCoverNegatative(var AQtyToConsume: Real;  AMaster_Label_ID: Real);
    function CheckIsMoveValidateCounterpartIntegrity(AFGMulti_ID, AMaster_Label_ID: Real): Boolean;
  protected
    procedure CheckApplyCrossArinvtMove; override;
  public
    property ParentTrans: TIQWebTransOut read FParentTrans write FParentTrans;
    property Lot_Date;
    property Master_Label_List;
    property FG_LotNo;
    constructor Create( AComponent:TComponent ); override;
    procedure AssignFields( DataSet:TDataSet ); override;
    function PostTransaction:Integer; override;
    procedure UpdateMasterLabelLocation( APreserveDispoDate: Boolean = FALSE ); virtual;
    procedure UpdateMasterLabelLocationInReverse;
    procedure CheckDuplicateDispoScan;
    procedure CheckMasterLabelLocationIntegrity( AFGMulti_ID, AMaster_Label_ID: Real );
  end;


  { OUT Transaction }

  TIQWebTransOut = class(TIQWebInvTranBaseCustom )
  private
    FParentTrans: TIQWebTransIn;  // used in many OUT to IN move transaction
  protected
    procedure CheckApplyCrossArinvtMove; override;
  public
    property ParentTrans: TIQWebTransIn read FParentTrans write FParentTrans;
    property Lot_Date;
    property Parent_Arinvt_ID;
    property Master_Label_List;
    property FG_LotNo;
    constructor Create( AComponent:TComponent ); override;
    procedure AssignFields( DataSet:TDataSet ); override;
    function PostTransaction:Integer; override;
    procedure UpdateMasterLabelLocation; virtual;
    procedure UpdateMasterLabelLocationInReverse;
    procedure CheckMasterLabelLocationIntegrity( AFGMulti_ID, AMaster_Label_ID: Real );
  end;

  { TIQWebTranOverhead }

  TIQWebTranOverhead = class( TIQWebInvTranBaseCustom )
  private
    FFixed_Overhead: string;  // Y/N
  public
    property FG_LotNo;
    property Fixed_Overhead: string read FFixed_Overhead write FFixed_Overhead;
    property Parent_Arinvt_ID;
    property Mfgno;
    property Cost_Element;
    procedure AssignFields( DataSet:TDataSet ); override;
    constructor Create( AComponent:TComponent ); override;
  end;


  { TIQWebTranLabor }

  TIQWebTranLabor = class(TIQWebInvTranBaseCustom )
  public
    property FG_LotNo;
    property Parent_Arinvt_ID;
    property Mfgno;
    property Cost_Element;
    procedure AssignFields( DataSet:TDataSet ); override;
    constructor Create( AComponent:TComponent ); override;
  end;

  { Location to Location Transaction}

  TIQWebTransMove = class(TIQWebTranBase)
  private
    FTransIn  : TIQWebTransIn;
    FTransOut : TIQWebTransOut;
    FEnforceUniqueDispoLocation: Boolean;
    FIsMoveToActCostAssigned: Boolean;

    function GetMoveFrom_FGMulti_ID : Double;
    function GetMoveTo_FGMulti_ID   : Double;
    function GetMoveFrom_Act_Cost   : Extended;
    function GetMoveTo_Trans_Quan   : Extended;
    function GetMoveTo_Trans_rg_quan: Extended;
    function GetMoveTo_Trans_Reason : string;
    function GetMoveTo_Trans_Source : string;
    function GetMoveTo_Trans_Source_ID : Double;
    procedure SetMoveFrom_FGMulti_ID ( AValue : Double );
    procedure SetMoveTo_FGMulti_ID   ( AValue : Double );
    procedure SetMoveFrom_Act_Cost   ( AValue : Extended );
    procedure SetMoveTo_Trans_Quan   ( AValue : Extended );
    procedure SetMoveTo_Trans_RG_Quan( AValue : Extended );
    procedure SetMoveTo_Trans_Reason ( AValue : string );
    procedure SetMoveTo_Trans_Source ( AValue : string );
    procedure SetMoveTo_Trans_Source_ID ( AValue : Double );
    procedure CheckHardAllocatedMove;
    procedure CheckMakeToOrderMove;
    procedure CheckNonConformStatusChangePopulateReason;
    function GetMoveTo_Act_Cost: Extended;
    procedure SetMoveTo_Act_Cost(const Value: Extended);

  protected
    FSkipCheckCrossArinvtMove: Boolean;
    property MoveFrom_Act_Cost : Extended read GetMoveFrom_Act_Cost  write SetMoveFrom_Act_Cost;
    property SkipCheckCrossArinvtMove: Boolean read FSkipCheckCrossArinvtMove write FSkipCheckCrossArinvtMove;
    procedure CheckApplyCrossArinvtMove; override;

  public
    property TrackNo;
    property TransIn  : TIQWebTransIn  read FTransIn;
    property TransOut : TIQWebTransOut read FTransOut;
    property EnforceUniqueDispoLocation: Boolean read FEnforceUniqueDispoLocation write FEnforceUniqueDispoLocation;
    property MoveTo_Act_Cost: Extended read GetMoveTo_Act_Cost write SetMoveTo_Act_Cost;
    property IsMoveToActCostAssigned: Boolean read FIsMoveToActCostAssigned write FIsMoveToActCostAssigned;

    constructor Create( AComponent:TComponent ); override;
    destructor Destroy; override;
    procedure CreateTransactionRecord; override;
    procedure DoInternalAfterTranExecute; override;
    procedure ValidateTransaction; override;
    class function CheckEnforceUniqueDispoLocation( var ATo_FGMulti_ID_Proposed: Real; AFrom_FGMulti_ID: Real = 0; DB:String = 'IQFD'): Boolean;
  published
    property MoveFrom_FGMulti_ID: Double   read GetMoveFrom_FGMulti_ID  write SetMoveFrom_FGMulti_ID;
    property MoveTo_FGMulti_ID  : Double   read GetMoveTo_FGMulti_ID    write SetMoveTo_FGMulti_ID;
    property Trans_Quan         : Extended read GetMoveTo_Trans_Quan    write SetMoveTo_Trans_Quan;
    property Trans_RG_Quan      : Extended read GetMoveTo_Trans_rg_quan write SetMoveTo_Trans_rg_quan;
    property Trans_Reason       : string read GetMoveTo_Trans_Reason    write SetMoveTo_Trans_Reason;
    property Trans_Source       : string read GetMoveTo_Trans_Source    write SetMoveTo_Trans_Source;
    property Trans_Source_ID    : Double read GetMoveTo_Trans_Source_ID write SetMoveTo_Trans_Source_ID;
  end;

  {Extended Move: source location to multiple targets}
  TIQWebTransMoveMulti = class(TIQWebTranBase)
  private
    FTransObjects : TList;
    FEnforceUniqueDispoLocation: Boolean;
    FTransOutObjects: TList;
    FTransInObjects: TList;
    procedure PropogateOwnerDataTo(AChild: TIQWebInvTranBaseCustom);
    procedure CheckHardAllocatedMove( AFgmulti_ID1, AFgmulti_ID2:Real );
    procedure CheckMakeToOrderMove( AFgmulti_ID1, AFgmulti_ID2:Real );
  protected
    procedure PrepareTransaction; override;
    procedure ValidateTransaction; override;
    procedure DoInternalAfterTranExecute; override;
    procedure CreateTransactionRecord; override;
  public
    KeepPalletReference: Boolean;
    property Trans_Reason;
    property TransBatchAutoInc;
    property EnforceUniqueDispoLocation: Boolean read FEnforceUniqueDispoLocation write FEnforceUniqueDispoLocation;
    constructor Create( AComponent:TComponent ); override;
    destructor Destroy; override;

    property TransObjects : TList read FTransObjects write FTransObjects;
    property TransInObjects : TList read FTransInObjects write FTransInObjects;
    property TransOutObjects : TList read FTransOutObjects write FTransOutObjects;
    function AddInTran( AQty, AFGMulti_ID: Real; AMaster_Label_List: TStringList = nil; AParentTransOut: TIQWebTransOut = nil ): TIQWebTransIn;
    function AddOutTran( AQty, AFGMulti_ID: Real; AMaster_Label_List: TStringList = nil; AParentTransIn: TIQWebTransIn = nil ): TIQWebTransOut;

    procedure Execute; override;
  end;


  {Move to VMI Location}

  TIQWebTransMoveVMI = class( TIQWebTransMove )
    constructor Create( AComponent:TComponent ); override;
  end;


  { TIQWebTransMoveCrossArinvt - move from one arinvt over to another }

  TIQWebTransMoveCrossArinvt = class( TIQWebTransMove )
    procedure DoInternalAfterTranExecute; override;
    procedure CheckApplyUOMConversion;
    constructor Create( AComponent:TComponent ); override;
    class procedure EnforceTargetItemDataInMasterLabel( AArinvt_ID_Trg, AMaster_Label_ID: Real; DB:String = 'IQFD'); virtual;
    function CheckApplyCurrencyConversion( Value: Real ): Real;
  end;


  {InterPlant Transfer}

  TIQWebTransMoveInterPlant = class( TIQWebTransMoveCrossArinvt )
    constructor Create( AComponent:TComponent ); override;
    class procedure EnforceTargetItemDataInMasterLabel( AArinvt_ID_Trg, AMaster_Label_ID: Real; DB:String = 'IQFD'); override;
    procedure AssignActCost;
  end;

  {InterPlant Transfer VMI}

  TIQWebTransMoveInterPlantVMI = class( TIQWebTransMove )
    constructor Create( AComponent:TComponent ); override;
  end;

  { Packing Slip (OUT) Transaction }

  TIQWebTransPackSlip = class( TIQWebTransOut )
  public
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
  end;

  { Conform (IN) Transaction }

  TIQWebTransConform = class(TIQWebTransIn )
  public
    constructor Create( AComponent:TComponent; AID:Real );
    function PostTransaction:Integer; override;
  end;

  { NonConform (IN) Transaction }

  TIQWebTransNonConform = class(TIQWebTransOut )
  public
    FNon_Conform_ID: Real;
    FNon_Conform_Allocatable: string;
    FIgnoreAlreadyMarkedNCError : Boolean;
    constructor Create( AComponent:TComponent; AID:Real; ANon_Conform_ID: Real = 0; ANon_Conform_Allocatable: string = '' );
    function PostTransaction:Integer; override;
  end;


  { Void Packing Slip (IN) Transaction }

  TIQWebTransPackSlipVoid = class(TIQWebTransIn )
  public
    VoidShipment_Dtl_ID: Real;
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
    procedure AssignFields( DataSet:TDataSet ); override;
    procedure UpdateMasterLabelLocation( APreserveDispoDate: Boolean = FALSE ); override;
  end;        

  { RMA (IN) Transaction }

  TIQWebTransRMA = class( TIQWebTransIn )
  public
    VoidShipment_Dtl_ID: Real;
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
  end;

  { Void RMA (OUT) Transaction }

  TIQWebTransRMAVoid = class(TIQWebTransOut )
  public
    Shipment_Dtl_ID: Real;
    constructor Create( AComponent:TComponent ); override;
    procedure UpdateMasterLabelLocation; override;
  end;

  { RMA (IN) Transaction }

  TIQWebTransVendRMA = class( TIQWebTransOut )
  public
    constructor Create( AComponent:TComponent ); override;
  end;

  TIQWebTransVendRMANonInv = class( TIQWebTransOut )
  public
    constructor Create( AComponent:TComponent ); override;
  end;


  { Void RMA (OUT) Transaction }

  TIQWebTransVendRMAVoid = class(TIQWebTransIn )
  public
    constructor Create( AComponent:TComponent ); override;
  end;

  TIQWebTransVendRMANonInvVoid = class(TIQWebTransIn )
  public
    constructor Create( AComponent:TComponent ); override;
  end;

  { PO (IN) Transaction }

  TIQWebTransPO = class( TIQWebTransIn )
  private
  public
    constructor Create( AComponent:TComponent ); override;
  end;

  { Void PO (OUT) Transaction }

  TIQWebTransPOVoid = class(TIQWebTransOut )
  public
    constructor Create( AComponent:TComponent ); override;
  end;

  { Phys. Inventory (IN) Transaction }

  TIQWebTransPhysInvIN = class( TIQWebTransIn )
  public
    property OverrideMasterLabelQty: Boolean read FOverrideMasterLabelQty write FOverrideMasterLabelQty;  // 06-23-2011 - used when new label is found and need to accept scanned qty
    constructor Create( AComponent:TComponent ); override;
    function PostTransaction:Integer; override;
    procedure UpdateMasterLabelLocation( APreserveDispoDate: Boolean = FALSE ); override;
  end;

  { Phys. Inventory (OUT) Transaction }

  TIQWebTransPhysInvOUT = class(TIQWebTransOut )
  public
    property OverrideMasterLabelQty: Boolean read FOverrideMasterLabelQty write FOverrideMasterLabelQty;  // 06-23-2011 - future use
    constructor Create( AComponent:TComponent ); override;
    function PostTransaction:Integer; override;
    procedure UpdateMasterLabelLocation; override;
  end;

  { VMI - Relieve Inventory }

  TIQWebTransVMIConsume = class(TIQWebTransOut )
  private
    FVMI_TransMode: TVMI_TransMode;
  public
    property VMI_TransMode: TVMI_TransMode read FVMI_TransMode write FVMI_TransMode;
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
    procedure UpdateMasterLabelLocation; override;
  end;


  { PO VMI - Move out of PO VMI location}

  TIQWebTransPO_VMIConsume = class(TIQWebTransOut )
  public
    constructor Create( AComponent:TComponent ); override;
  end;


  TIQWebTransPONonInv = class(TIQWebTransIn )
  public
    property ReceiptNo;
    constructor Create( AComponent:TComponent ); override;
  end;

  TIQWebTransPONonInvVoid = class(TIQWebTransOut )
  public
    property ReceiptNo;
    constructor Create( AComponent:TComponent ); override;
  end;


  { Dispo/Backflush Transaction Base class }

  TIQWebTransDispoBase = class(TIQWebTranBase)
  private
    FTransObjects : TList;
    FForceParent_Arinvt_ID: Real;
    FIsParent_Arinvt_Assigned: Boolean;
    FForceParent_FGLotNo: string;

    function FindLotNo( const ATranIn_Out: string; var AFG_LotNo:string ): Boolean;
    function FindParent_Arinvt_ID( const ATranIn_Out: string; var AParent_Arinvt_ID: Real ): Boolean;
    function FindParent_Arinvt_ID_By_Batch( const ATranIn_Out: string; var AParent_Arinvt_ID: Real ): Boolean;
    function FindParent_Arinvt_ID_By_Day_Part_ID( const ATranIn_Out: string; var AParent_Arinvt_ID: Real ): Boolean;
    procedure UpdateParent_Arinvt_ID( const ATranIn_Out: string; AParent_Arinvt_ID: Real );
    procedure SetWorkOrder_ID( AValue: Real ); override;
    procedure SetFab_Lot_ID(const Value: Real); override;

  protected
    function PostTransaction:Integer; override;
    procedure PrepareTransaction; override;
    function GetParent_Arinvt_ID: Real;
    procedure CheckApplyCrossArinvtMove; override;
  public
    property TransBatchAutoInc;
    property OrderNo;
    property MfgNo;
    // 09-19-2008 Sometimes (shopdata component rejects) we do not have the IN side but still need parent_arinvt_id being assigned. See GetParent_Arinvt_ID
    property ForceParent_Arinvt_ID: Real read FForceParent_Arinvt_ID write FForceParent_Arinvt_ID;
    // 10/31/2014 EIQ-4816 Floor Disposition - Dispo Out - SIC components not writing parent FG Lot # to Translog
    property ForceParent_FGLotNo: string read FForceParent_FGLotNo write FForceParent_FGLotNo;
    // 03-26-2009 When dispo phantom in-out on fly we manually assign parent_arinvt_id
    property IsParent_Arinvt_Assigned: Boolean read FIsParent_Arinvt_Assigned write FIsParent_Arinvt_Assigned;

    property Force_EPlant_ID: Real read FForce_EPlant_ID write FForce_EPlant_ID;
    property Work_Center_ID;

    constructor Create( AComponent:TComponent ); override;
    destructor Destroy; override;

    procedure UpdateFG_LotNo( const ATranIn_Out, AFG_LotNo: string );
    procedure CreateTransactionRecord; override;
    procedure ClearTransObjectsList;
    procedure AddInTran( AQty, ARgQty, AFGMulti_ID, AAct_Cost : Real; ATop_Phantom_Arinvt_ID: Real = 0; AMaster_Label_List: TStringList = nil );
    procedure AddOutTran( AQty, ARgQty, AFGMulti_ID : Real; ATop_Phantom_Arinvt_ID: Real = 0; AMaster_Label_List: TStringList = nil ); virtual;

    procedure AddOverhead( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real; AFixed_Overhead: string = ''; AStoreInMatprod: Boolean = FALSE );
    procedure AddFixedOverhead( AArinvt_ID, AQty: Real; AStoreInMatprod: Boolean = FALSE );
    procedure AddAuxOverhead( AStandard_ID, AProdHrs: Real; AStoreInMatprod: Boolean = FALSE );

    procedure AddLabor( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real ); overload; virtual;
    procedure AddLabor( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real; AStoreInMatprod: Boolean ); overload;
    procedure Execute; override;
    function TotalQty( const ATran_In_Out:string ): Real;
    procedure PropogateOwnerDataTo( AChild: TIQWebInvTranBaseCustom );
    procedure DoInternalAfterTranExecute; override;
    procedure StoreInMatprod(AAct_Cost, AAct_Qty: Real; ACost_Element, AKind: string);

    procedure AddLandedCost(AArinvt_ID, AQty: Real; ATran_In_Out: string);

  published
    property Trans_Code_ID;
    property TransObjects : TList read FTransObjects write FTransObjects;
    property Trans_Reason;
    property Trans_Source;
    property Trans_Source_ID;
  end;

  { Labor/Overhead }

  TIQWebLaborOverhead = class(TIQWebTransDispoBase)
  public
    procedure AddOverhead( AAct_Cost: Real; const ATran_In_Out:string; AParentArinvtId:Real; AAct_Qty: Real);
    procedure AddLabor( AAct_Cost: Real; const ATran_In_Out:string; AParentArinvtId:Real; AAct_Qty: Real);
  end;


  {Disposition}

  TIQWebTransDispo = class(TIQWebTransDispoBase)
  protected
    procedure ValidateTransaction; override;
  end;

  { Backflush }

  TIQWebTransBackFlush = class(TIQWebTransDispoBase)
  private
  protected
    procedure CheckRemoveLaborWhenPostedByTimeAttendance;
  public
    property ReceiptNo;
    property TrackNo;
    constructor Create( AComponent:TComponent ); override;
    procedure PrepareTransaction; override;
  end;

  { TIQWebTransFloorDispo }

  TIQWebTransFloorDispo = class(TIQWebTransBackFlush)
  public
    constructor Create( AComponent:TComponent ); override;
    procedure PrepareTransaction; override;
  end;


  { TIQWebTransAssoc }

  TIQWebTransAssoc = class(TIQWebTransBackFlush)       { TIQWebTransDispoBase }
  public
    Parent_ID: Real;
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
    procedure PrepareTransaction; override;
  end;

  { TIQWebTransRepair }

  TIQWebTransRepair = class(TIQWebTransDispoBase)
  protected
    procedure SetRma_Detail_ID( Value: Real ); override;
  public
    constructor Create( AComponent:TComponent ); override;
    procedure DoInternalAfterTranExecute; override;
    procedure ValidateTransaction; override;
    procedure AddOutTran( AQty, ARgQty, AFGMulti_ID : Real; ATop_Phantom_Arinvt_ID: Real = 0; AMaster_Label_List: TStringList = nil ); override;
    procedure AddLabor( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real); override;
  end;


  { TIQWebTransRepairFinished }

  TIQWebTransRepairFinished = class(TIQWebInvTranBaseCustom )
  public
    constructor Create( AComponent:TComponent ); override;
    procedure DoInternalAfterTranExecute; override;
    procedure ValidateTransaction; override;
    procedure SetRma_Detail_ID( Value: Real ); override;
  end;


  { TIQWebTransRework }

  TIQWebTransRework = class(TIQWebTransDispoBase)
  protected
    procedure SetRework_ID( Value: Real ); override;
  public
    constructor Create( AComponent:TComponent ); override;
    procedure DoInternalAfterTranExecute; override;
    procedure ValidateTransaction; override;
    procedure AddOutTran( AQty, ARgQty, AFGMulti_ID : Real; ATop_Phantom_Arinvt_ID: Real = 0; AMaster_Label_List: TStringList = nil ); override;
    procedure AddLabor( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real); override;
  end;


  { TIQWebTransReworkFinished }

  TIQWebTransReworkFinished = class(TIQWebInvTranBaseCustom )
  public
    constructor Create( AComponent:TComponent ); override;
    procedure DoInternalAfterTranExecute; override;
    procedure ValidateTransaction; override;
    procedure SetRework_ID( Value: Real ); override;
  end;


  { VMI Return }

  TIQWebTransVMI_Return = class(TIQWebTransDispoBase)
  public
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
  end;


  { TIQWebTransInTransitMove }

  TIQWebTransInTransitMove = class(TIQWebTransDispoBase)
  public
    SkipMTOVerification: Boolean;
    constructor Create( AComponent:TComponent ); override;
    procedure ValidateTransaction; override;
  end;

  { TIQWebTransReject }
  TIQWebTransReject = class(TIQWebTransOut)
    // written for Assy1Data rejects of hardallocated materials
    property FG_LotNo;
  end;


  { TIQWebTransReturnInTransitToInventory }
  TIQWebTransReturnInTransitToInventory = class( TIQWebTransMove )
  public
    constructor Create( AComponent:TComponent ); override;
  end;

  //{ Inventory Scrap Transaction }
  //
  //TTransInvScrap = class(TIQWebTransOut )
  //public
  //  constructor Create( AComponent:TComponent ); override;
  //  procedure ValidateTransaction; override;
  //end;

  { TIQWebTranLabor }

  TIQWebTranAdjustWIP = class(TIQWebInvTranBaseCustom )
  public
    property Arinvt_ID;
    procedure AssignFields( DataSet:TDataSet ); override;
    property Parent_Arinvt_ID;
    constructor Create( AComponent:TComponent ); override;
  end;

  { TIQWebTransICA }
  TIQWebTransICA = class(TIQWebTransIn )
  public
    constructor Create( AComponent:TComponent ); override;
  end;

  TIQWebTransLandedCost = class( TIQWebInvTranBaseCustom )
  private
  public
    property Parent_Arinvt_ID;
    property Cost_Element;
    procedure AssignFields( DataSet:TDataSet ); override;
    constructor Create( AComponent:TComponent ); override;
  end;


  procedure PopulateTransTypeList( ATransTypeList: TStrings );
  function BelongsToMixedPallet( AMaster_Label_ID: Real; ADB: string = 'IQFD'): Boolean;
  function BelongsToMixedLotPallet( AMaster_Label_ID: Real; ADB: string = 'IQFD'): Boolean;
  function IsMixedLotPallet( AMaster_Label_ID: Real; ADB: string = 'IQFD'): Boolean;
           

implementation

uses
  System.Variants,
//  HardAllocMatChk,
 // inv_chk_negative_onhand,
 // Inv_Misc,
  IQMS.Common.Applications,
  IQMS.Common.Controls,
  IQMS.Common.Dispo,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Proc,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
//  iqskconf,
  IQMS.Common.StringUtils,
  IQMS.Common.TransError,
  IQMS.Common.UOM,
//  ps_share,
//  Trans_Misc,
  IQMS.WebVcl.ResourceStrings;


//  iqskconf,
//  HardAllocMatChk,
//  inv_chk_negative_onhand,
//  Inv_Misc,
//  IQApps,
//  IQDispo,
//  iqmesg,
//  IQMisc,
//  iqproc,
//  iqtraner,
//  IQUom,
//  ps_share,
//  trans_lot_exp_date_dlg,
//  Trans_Misc,



procedure PopulateTransTypeList( ATransTypeList: TStrings );
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    AList.Add( TRAN_TYPE_CONFORM           );
    AList.Add( TRAN_TYPE_MANUAL            );
    AList.Add( TRAN_TYPE_MOVE_LOC          );
    AList.Add( TRAN_TYPE_PACKSLIP          );
    AList.Add( TRAN_TYPE_PACKSLIP_VOID     );
    AList.Add( TRAN_TYPE_RMA               );
    AList.Add( TRAN_TYPE_RMA_VOID          );
    AList.Add( TRAN_TYPE_PO                );
    AList.Add( TRAN_TYPE_PO_VOID           );
    AList.Add( TRAN_TYPE_PO_REJECTED_VOID  );
    AList.Add( TRAN_TYPE_PO_RECEIVED_VOID  );
    AList.Add( TRAN_TYPE_PO_REJECT         );
    AList.Add( TRAN_TYPE_DISPO             );
    AList.Add( TRAN_TYPE_MANUAL_WITH_BF    );
    // AList.Add( TRAN_TYPE_FLOOR_DISPO       );  this is DISPOSITION
    AList.Add( TRAN_TYPE_MANUAL_ASSOCIATED );
    AList.Add( TRAN_TYPE_PHYS_INV          );
    AList.Add( TRAN_TYPE_OH                );
    AList.Add( TRAN_TYPE_LABOR             );
    AList.Add( TRAN_TYPE_PM                );
    AList.Add( TRAN_TYPE_TOOLING           );
    AList.Add( TRAN_TYPE_INV_SCRAP         );
    AList.Add( TRAN_TYPE_VEND_RMA          );
    AList.Add( TRAN_TYPE_VEND_RMA_VOID     );
    AList.Add( TRAN_TYPE_VMI_CONSUME       );
    AList.Add( TRAN_TYPE_VMI_MOVE_LOC      );
    AList.Add( TRAN_TYPE_INTERPLANT        );
    AList.Add( TRAN_TYPE_INTERPLANT_VMI    );
    AList.Add( TRAN_TYPE_REPAIR            );
    AList.Add( TRAN_TYPE_REPAIR_FINISHED   );
    AList.Add( TRAN_TYPE_VMI_RETURN        );
    AList.Add( TRAN_TYPE_IN_TRANSIT_MOVE   );
    AList.Add( TRAN_TYPE_PO_NON_INV        );
    AList.Add( TRAN_TYPE_PO_NON_INV_VOID   );
    AList.Add( TRAN_TYPE_REWORK            );
    AList.Add( TRAN_TYPE_REWORK_FINISHED   );
    AList.Add( TRAN_TYPE_RETURN_IN_TRANSIT );
    AList.Add( TRAN_TYPE_PROCESS_WIP       );
    AList.Add( TRAN_TYPE_FINISH_PROCESS_WIP);
    AList.Add( TRAN_TYPE_FINISH_ASSEMBLY   );
    AList.Add( TRAN_TYPE_REVERSE_BACKFLUSH );
    AList.Add( TRAN_TYPE_ADJUST_WIP        );
    AList.Add( TRAN_TYPE_PO_VMI            );
    AList.Add( TRAN_TYPE_PO_VMI_CONSUME    );
    AList.Add( TRAN_TYPE_PO_VMI_VOID       );
    AList.Add( TRAN_TYPE_ICA               );
    AList.Add( TRAN_TYPE_LANDED_COST       );
    AList.Add( TRAN_TYPE_NON_INV_VEND_RMA  );
    AList.Add( TRAN_TYPE_NON_INV_VEND_RMA_VOID  );


    AList.Sort;
    ATransTypeList.Assign( AList );
 finally
    AList.Free;
 end;
end;



{ TIQWebTranBase }

class procedure TIQWebTranBase.CheckAssignAutoDispo(AFGMulti_ID, ATrg_FGMulti_ID: Real; DB:String = 'IQFD');
begin
  ExecuteCommandFmt( 'declare                                                         '+
             '  v_rec fgmulti%%rowtype;                                       '+
             'begin                                                           '+
             '  select * into v_rec from fgmulti where id = %f;               '+
             '                                                                '+
             '  update fgmulti                                                '+
             '     set auto_dispo_default_loc = v_rec.auto_dispo_default_loc, '+
             '         auto_dispo_standard_id = v_rec.auto_dispo_standard_id  '+
             '   where id = %f;                                               '+
             '                                                                '+
             '   delete fgmulti_dispo_bom where fgmulti_id = %f;              '+
             '                                                                '+
             '  insert into fgmulti_dispo_bom                                 '+
             '       ( fgmulti_id, standard_id )                              '+
             '  select %f, standard_id                                        '+
             '    from fgmulti_dispo_bom                                      '+
             '   where fgmulti_id = %f;                                       '+
             'end;                                                            ',
             [ AFGMulti_ID,
               ATrg_FGMulti_ID,
               ATrg_FGMulti_ID,
               ATrg_FGMulti_ID,
               AFGMulti_ID ], 
             DB);
end;

constructor TIQWebTranBase.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FDataBaseName := 'IQFD';
  FTrans_Batch:= 0;
  FTrans_Date:= 0;
  if not (csDesigning in ComponentState)  then
     FTrans_Date:= SelectValueAsFloat('select sysdate from dual', FDataBaseName);
  FTransBatchAutoInc:= TRUE;
  FConfirmError:= TRUE;
  FUserID:= '';
  FAct_Cost:= 0;
  FAct_Qty:= 0;
  OrderNo:= '';
  MfgNo  := '';
  FWorkOrder_ID:= 0;
  FTransErrCode:= -1;
  FAssociatedTransList:= TList.Create;   // 12-08-2014 optional. designed for landed cost during ICT move
end;

destructor TIQWebTranBase.Destroy;
begin
  IQMS.Common.Controls.ClearListOfObjects(FAssociatedTransList);
  FAssociatedTransList.Free;
  inherited;
end;

procedure TIQWebTranBase.CreateAssociatedTransactionRecord;
var
  AChild: TIQWebTranBase;
  I: Integer;
begin
  // introduced in 12-08-2014 to support landed cost during ICT Receiving
  for I:= 0 to FAssociatedTransList.Count - 1 do
  begin
    AChild := TIQWebTranBase( FAssociatedTransList[ I ]);

    // propagate to associated child all the properties
    AChild.Trans_Batch       := self.Trans_Batch;
    AChild.Sub_Batch         := self.Sub_Batch;
    AChild.TransBatchAutoInc := FALSE;
    AChild.FTrans_Code_ID    := self.FTrans_Code_ID;
    AChild.Trans_Reason      := self.FTrans_Reason;
    AChild.Trans_Source      := self.FTrans_Source;
    AChild.Trans_Source_ID   := self.FTrans_Source_ID;
    AChild.UserID            := self.UserID;
    AChild.AllowMoveInTransit:= self.AllowMoveInTransit;
    AChild.AllowVMIMove      := self.AllowVMIMove;
    AChild.AllowZeroQty      := self.AllowZeroQty;
    AChild.Attribute         := self.Attribute;
    AChild.Trans_Date        := self.Trans_Date;

    AChild.ValidateTransaction;
    AChild.CreateTransactionRecord;
  end;
end;


procedure TIQWebTranBase.Execute;
var
  ADB: TFDConnection;
  ExternalStartTran:Boolean;
begin
  if Assigned(FBeforeTranExecute) then
     FBeforeTranExecute(self);

  ADB:= FDManager.FindConnection( FDataBaseName ) as TFDConnection;
  ExternalStartTran:= ADB.InTransaction;

  // prepare
  with ADB do
  try
    if not ExternalStartTran then
       StartTransaction;
    ValidateTransaction;             { assign new batch #        }
    PrepareTransaction;              { usually empty method. used in dispo and backflush }
    CreateTransactionRecord;         { create record in invtrans }
    if not ExternalStartTran then
       Commit;
  finally
    if not ExternalStartTran and InTransaction then
       RollBack;
  end;

  // execute
  if not ExternalStartTran then ADB.StartTransaction;
  try
    TransErrCode:= PostTransaction; { process transaction!      }

    DoInternalAfterTranExecute;

    if (TransErrCode = 0) and IsTollItemDefined() then
       CheckApplyCrossArinvtMove;

    if not ExternalStartTran then
       ADB.Commit;
  finally
    if ADB.InTransaction and not ExternalStartTran then
       ADB.RollBack;
  end;

  if Assigned(FAfterTranExecute) then
     FAfterTranExecute(self);
end;

procedure TIQWebTranBase.ValidateTransaction;
begin
//  if (FUserID = '') and (SecurityManager <> nil) then
//      FUserID:= SecurityManager.UserName;

  if TransBatchAutoInc then
     Trans_Batch:= GetNextSequenceNumber( 'S_INVTRANS_BATCHNO' );
  if Trans_Batch = 0 then
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000214 {'Transaction Batch # is zero.  Unable to execute transaction.'});

  if FSub_Batch = 0 then
     FSub_Batch:= IQMS.Common.Sequence.GetNextSequenceNumber( 'S_TRANSLOG_SUB_BATCH' );

  if FTrans_Date = 0 then
     FTrans_Date:= SelectValueAsFloat('select sysdate from dual', FDataBaseName);
end;

procedure TIQWebTranBase.AddAssociatedTrans( AChild: TIQWebTranBase );
begin
  // 12-08-2014 optional. designed for landed cost during ICT move. see ICT_Receive.pas and procedure TIQWebTransMove.CreateTransactionRecord in this unit
  FAssociatedTransList.Add( AChild );
end;

procedure TIQWebTranBase.AddLandedCost(ACost: Real; AElement, AIn_Out: string);
var
  ALandedCostTrans: TIQWebTransLandedCost;
begin
  ALandedCostTrans:= TIQWebTransLandedCost.Create( nil );
  with ALandedCostTrans do
  begin
    Trans_In_Out:= Ain_Out;
    Act_Cost    := ACost;
    Cost_Element:= AElement;
  end;

  // add to the asspciated list of objects - it will get processed in CreateAssociatedTransactionRecord
  self.AddAssociatedTrans( ALandedCostTrans );
end;

procedure TIQWebTranBase.AppendAttribute(Value: string);
begin
  if Value = '' then
     EXIT;

  if Attribute = '' then
     Attribute:= Value
  else if Pos( Value, Attribute ) = 0 then
     Attribute:= Format('%s;%s', [ Attribute, Value ]);
end;

procedure TIQWebTranBase.AssignFields( DataSet:TDataSet );
begin
  IQAssignIDBeforePost( DataSet );
  FID:= DataSet.FieldByName('ID').asFloat;  {this is a little backwards: id is assigned in IQAssignIDBeforePost and then FID}
  DataSet.FieldByName('Trans_Date').asDateTime:= FTrans_Date;
  DataSet.FieldByName('UserID').asString      := FUserID;
  DataSet.FieldByName('Day_Part_ID').asFloat  := FDay_Part_ID;
  if FWorkOrder_ID > 0 then
     DataSet.FieldByName('Workorder_ID').asFloat:= FWorkOrder_ID;
  if FRma_Detail_ID > 0 then
     DataSet.FieldByName('Rma_Detail_ID').asFloat:= FRma_Detail_ID;
  if FRework_ID > 0 then
     DataSet.FieldByName('rework_id').asFloat:= FRework_ID;
  DataSet.FieldByName('Act_Cost').asFloat    := Act_Cost;
  DataSet.FieldByName('Act_Qty').asFloat     := Act_Qty;
  DataSet.FieldByName('OrderNo').asString    := OrderNo;
  DataSet.FieldByName('MfgNo').asString      := MfgNo;
  DataSet.FieldByName('Attribute').asString  := Attribute;
  DataSet.FieldByName('Trans_Note').asString  := Trans_Note;
  DataSet.FieldByName('Receipt_Comment').asString:= Receipt_Comment;

  if FForce_EPlant_ID > 0 then
     DataSet.FieldByName('force_eplant_id').asFloat:= FForce_EPlant_ID;

  if Ptoper_ID > 0 then
     DataSet.FieldByName('ptoper_id').asFloat:= Ptoper_ID;

  if Work_Center_ID > 0 then
     DataSet.FieldByName('work_center_id').asFloat:= Work_Center_ID;

  if Is_Labels_Updated <> '' then
     DataSet.FieldByName('is_labels_updated').asString:= Is_Labels_Updated
  else
     DataSet.FieldByName('is_labels_updated').Clear;
end;


{Process transactions with the same Trans_Batch #}
function TIQWebTranBase.PostTransaction:Integer;
begin
  Result := 0;
//  try
//    Result:= Dispatch_Trans_Batch( FTrans_Batch, FSub_Batch, FDataBaseName );
//    if ConfirmError then
//       case Result of
//         0: ; { do nothing - successfull transaction }
//         1: IQWarning( IQMS.WebVcl.ResourceStrings.cTXT0000215 {'No pending transactions found.  Nothing has been processed.'} );
//         2: ShowTransError( FTrans_Batch, RaiseExceptionOnError );
//       end;
//  finally
//    if not IsConsole then
//       Screen.Cursor:= crDefault;
//  end;
end;

procedure TIQWebTranBase.PrepareTransaction;
begin
  {usually empty method. used in dispo and backflush }
end;

procedure TIQWebTranBase.SetDay_Part_ID( AValue: Double );
begin
  if AValue <> FDay_Part_ID then
  begin
    FDay_Part_ID:= AValue;

    {Update workorder_id based on day_part_id}
    FWorkOrder_ID:= SelectValueFmtAsFloat('select h.workorder_id from hist_illum_rt h, dayprod d, day_part p '+
                              ' where p.id = %f and d.id = p.dayprod_id and h.id = d.hist_illum_rt_id', [ FDay_Part_ID ], FDataBaseName);

    {Maybe it's pday_part}
    if FWorkOrder_ID = 0 then
       FWorkOrder_ID:= SelectValueFmtAsFloat('select h.workorder_id from hist_illum_rt h, pdayprod d, pday_part p '+
                                 ' where p.id = %f and d.id = p.dayprod_id and h.id = d.hist_illum_rt_id', [ FDay_Part_ID ], FDataBaseName);
  end;
end;

procedure TIQWebTranBase.SetWorkOrder_ID( AValue: Real );
begin
  FWorkOrder_ID:= AValue;
end;

procedure TIQWebTranBase.DoInternalAfterTranExecute;
begin
  if SkipEmptyFGMultiDelete then
     EXIT;

  if TransErrCode = 0 then
  try
    // ExecuteCommandFmt('begin inventory_trans.delete_trans_fgmulti(%f); end;', [ Trans_Batch ], FDataBaseName);
    self.DeleteEmptyLocations( Trans_Batch, FDataBaseName );
  except
    TransErrCode:= 2;
    raise;
  end;
end;

procedure TIQWebTranBase.DeleteEmptyLocations( ATrans_Batch: Real; ADB: string = 'IQFD' );
begin
  ExecuteCommandFmt('begin inventory_trans.delete_trans_fgmulti(%f); end;', [ ATrans_Batch ], ADB);
end;


procedure TIQWebTranBase.SetRma_Detail_ID(Value: Real);
begin
  {assign rma_detail_id and find batch}
  FRma_Detail_ID:= Value;

  Trans_Batch:= SelectValueByID('batch', 'rma_detail', FRma_Detail_ID, FDataBaseName);

  if Trans_Batch = 0 then
     Trans_Batch:= SelectValueByID('batch', 'rma_detail_hist', FRma_Detail_ID, FDataBaseName);
end;

procedure TIQWebTranBase.SetFab_Lot_ID(const Value: Real);
begin
  FFab_Lot_ID := Value;
end;

procedure TIQWebTranBase.RemoveLeftInInvTransSameTransBatch;
begin
  ExecuteCommandFmt('delete from invtrans where trans_batch = %f', [ FTrans_Batch ], FDataBaseName);
end;

procedure TIQWebTranBase.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
end;

procedure TIQWebTranBase.SetRework_ID(Value: Real);
begin
  FRework_ID:= Value;

  Trans_Batch:= SelectValueByID('batch', 'wf_deviation_item', FRework_ID, FDataBaseName);
end;

procedure TIQWebTranBase.CheckApplyCrossArinvtMove;
  {Overriden in TIQWebTransIn, TIQWebTransMove and TransDispo.
   The objective is to check arinvt_id exists in TOLL_ITEM table for IN transaction
   and execute TtranMoveCrossArinvt moving from one arinvt_id to toll_item.target_arinvt_id}
begin
end;


class procedure TIQWebTranBase.ExecuteCrossArinvtMove( ATrans: TIQWebTranBase; ACargo: TCrossArinvtCargo; ADB: string = 'IQFD' );
var
  ALotNo: string;
  ABaseItemFGMulti_ID: Real;
  ATransMove: TIQWebTransMoveCrossArinvt;
  A: Variant;
  ATollItemTrans: TIQWebInvTranBaseCustom;
begin
  if not (ATrans is TIQWebInvTranBaseCustom) then
     EXIT;
  ATollItemTrans:= TIQWebInvTranBaseCustom( ATrans );  // TIQWebTransIn or TIQWebTransOut

  // source
//  A:= SelectValueArrayFmt( 'select arinvt_id, lotno from fgmulti where id = %f', [ ATollItemTrans.FGMulti_ID ], ADB);
//  if VarArrayDimCount( A ) =  0 then
//     EXIT;
//  if ACargo.TrgArinvt_ID = A[ 0 ] then
//     EXIT;
//  ALotNo:= A[ 1 ];
//
//  // target
//  ABaseItemFGMulti_ID:= IQDispo.GetAutoDispoFGMultiID( ACargo.TrgArinvt_ID,         // base item arinvt_id
//                                                       SelectValueByID('standard_id', 'arinvt', ACargo.TrgArinvt_ID, ADB ), // AStandard_ID,
//                                                       'TEMPORARY',                 // DefaultLocation,
//                                                       ALotNo,                      // ALot,
//                                                       0,                           // AWork_Center_ID,
//                                                       ACargo.TrgDivision_ID );     // FDivision_ID
//
//  // execute
//  ATransMove:= TIQWebTransMoveCrossArinvt.Create( nil );
//  with ATransMove do
//  try
//    if ATollItemTrans is TIQWebTransIn then
//       begin
//         MoveFrom_FGMulti_ID := ATollItemTrans.FGMulti_ID;
//         MoveTo_FGMulti_ID   := ABaseItemFGMulti_ID;
//       end
//    else
//       begin
//         MoveFrom_FGMulti_ID := ABaseItemFGMulti_ID;
//         MoveTo_FGMulti_ID   := ATollItemTrans.FGMulti_ID;
//       end;
//    Trans_Quan          := ATollItemTrans.Trans_Quan;
//    Trans_RG_Quan       := ATollItemTrans.Trans_RG_Quan;
//    Trans_Reason        := ATollItemTrans.Trans_Reason;
//    Trans_Code_ID       := ATollItemTrans.Trans_Code_ID;
//
//    {avoid checking and moving toll back to base and vise versa}
//    SkipCheckCrossArinvtMove:= TRUE;
//
//    {reset the master_label}
//    TransOut.Master_Label_List:= ATollItemTrans.Master_Label_List;
//    {reassign master_label - fgmulti_id, loc_desc etc}
//    TransIn.Master_Label_List:= ATollItemTrans.Master_Label_List;
//
//    if ACargo.Act_Cost <> 0 then
//    begin
//      MoveTo_Act_Cost        := ACargo.Act_Cost;
//      IsMoveToActCostAssigned:= TRUE;
//      TransIn.AppendAttribute('OVERWRITE_FGMULTI_ACT_COST');
//    end;
//
//    Execute;
//  finally
//    ATransMove.Free;
//  end;
end;


function TIQWebTranBase.FgMultiArinvt_ID(AFGMuti_ID: Real): Real;
begin
  Result:= SelectValueByID('arinvt_id', 'fgmulti', AFGMuti_ID, FDataBaseName);
end;


function TIQWebTranBase.IsTollItemDefined: Boolean;
begin
  Result:= SelectValueAsFloat('select count(*) from toll_item where rownum < 2', FDataBaseName) > 0;
end;


{ TIQWebInvTranBase }

constructor TIQWebInvTranBase.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FGMulti_ID   := 0;
  FTrans_Quan  := 0;
  FTrans_Reason:= '';
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
  FTrans_Code_ID  := 0;
end;

procedure TIQWebInvTranBase.CreateTransactionRecord;
var
  T:TFDTable;
begin
  T:= TFDTable.Create( self );
  with T do
  try
    ConnectionName:= FDataBaseName;
    TableName   := 'IQMS.INVTRANS';
    UpdateOptions.UpdateMode  := upWhereKeyOnly;
    Open;
    Append;
    AssignFields(T);
    Post;
  finally
    Free;
  end;
end;

procedure TIQWebInvTranBase.AssignFields(DataSet:TDataSet);
begin
  inherited;
  DataSet.FieldByName('TRANS_BATCH').asFloat:= FTrans_Batch;

  if Top_Phantom_Arinvt_ID > 0 then
     DataSet.FieldByName('top_phantom_arinvt_id').asFloat:= FTop_Phantom_Arinvt_ID;

  if Lot_Date > 0 then
     DataSet.FieldByName('lot_date').asDateTime:= Lot_Date;
end;

procedure TIQWebInvTranBase.ValidateTransaction;
var
  IsVMI      : Boolean;
begin
  inherited;

  {VMI}
  IsVMI:= (FGMulti_ID > 0) and ( SelectValueFmtAsString('select l.VMI from locations l, fgmulti f where f.id = %f and f.loc_id = l.id', [ FGMulti_ID ], FDataBaseName) = 'Y');
  if IsVMI then
     if not (( FTrans_Type = TRAN_TYPE_VMI_CONSUME )
             or
             ( FTrans_Type = TRAN_TYPE_VMI_MOVE_LOC )
             or
             ( FTrans_Type = TRAN_TYPE_PO_VMI_VOID )
             or
             ( FTrans_Type = TRAN_TYPE_VMI_RETURN )
             or
             ( FTrans_Type = TRAN_TYPE_PO_VMI)                                        // in during receipt of the PO VMI
             or
             ( FTrans_Type = TRAN_TYPE_PO_VMI_CONSUME )                               // out during move from PO VMI location
             or
             (( FTrans_Type = TRAN_TYPE_PO_RECEIVED_VOID ) and AllowVMIMove )         // void vmi po receipt
             or
             (( FTrans_Type = TRAN_TYPE_PO_REJECT ) and AllowVMIMove )                // reject vmi po receipt
             or
             (( FTrans_Type = TRAN_TYPE_PO_REJECTED_VOID ) and AllowVMIMove )) then   // void reject vmi po receipt
     begin
        // 'VMI location %s cannot be part of the transaction.  Unable to execute transaction.'
        raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000216,
                                  [ SelectValueFmtAsString('select l.loc_desc from locations l, fgmulti f where f.id = %f and f.loc_id = l.id', [ FGMulti_ID ], FDataBaseName)]);
     end;

  {Hard Alloc to Lot}
//  CheckHardAllocatedMaterial( FGMulti_ID, FFab_Lot_ID ); // HardAllocMatChk.pas

  {Hard Alloc to WO}
  CheckHardAllocatedMaterialToWorkOrder;

  {Hard Allocated to OE - Make To Order}
  CheckMakeToOrder;

  {Intercompany In Transit: allow intercompany in-transit transaction only when generating pack slip or special move from in-transit to other location.}
  if not AllowMoveInTransit
     and (SelectValueByID('shipment_dtl_id_in_transit', 'fgmulti', FGMulti_ID, FDataBaseName ) > 0) then
   raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000313 );  // 'In Transit location cannot be part of the transaction.  Unable to execute transaction.';
end;


procedure TIQWebInvTranBase.CheckHardAllocatedMaterialToWorkOrder;
var
  AAllocated_Workorder_ID: Real;

  function check_allow_01: Boolean;
  begin
    Result:= Assigned(self.owner) and ((self.owner is TIQWebTransDispo) or (self.owner is TIQWebTransFloorDispo)) and (TIQWebTransDispo(self.owner).Workorder_ID = AAllocated_Workorder_ID);
  end;

  function check_allow_02: Boolean;
  begin
    Result:= Assigned(self.owner) and (self.owner is TIQWebTransBackFlush) and (TIQWebTransBackFlush(self.owner).Trans_Type = TRAN_TYPE_DISPO) and ( TIQWebTransBackFlush(self.owner).Workorder_ID = AAllocated_Workorder_ID );
  end;

  function check_allow_03: Boolean;
  begin
    Result:= ( self is TIQWebTransReject ) and ( TIQWebTransReject(self).WorkOrder_ID = AAllocated_Workorder_ID )
  end;

  function check_allow_04: Boolean;
  begin
    Result:= ( self.owner is TIQWebTransMove)
  end;

  function check_allow_05: Boolean;
  begin
    Result:= ( self.owner is TIQWebTransBackFlush) and ( self is TIQWebTransIn ) and ( TIQWebTransBackFlush(self.Owner).WorkOrder_ID = AAllocated_Workorder_ID )
  end;

  function check_allow_06: Boolean;
  begin
    // 10-29-2008 check backflushing hard allocated materials in AssyData during logout from a process using TFrmTranDialogSilentAutoBackflush_ExWIP
    Result:= ( self.owner is TIQWebTransBackFlush) and ( self is TIQWebTransOut ) and ( TIQWebTransBackFlush(self.Owner).WorkOrder_ID = AAllocated_Workorder_ID )
  end;

  function check_allow_07: Boolean;
  begin
    // 09-30-2009 allow physical inv to change hard alloc materials
    Result:= ( self is TIQWebTransPhysInvIN ) or ( self is TIQWebTransPhysInvOUT );
  end;

  function check_allow_08: Boolean;
  begin
    // 03-01-2010 check backflushing hard allocated materials in ShopData during reject components TFrmTranDialogSilentAutoBackflush
    Result:= ( self.owner is TIQWebTransAssoc) and ( self is TIQWebTransOut ) and ( TIQWebTransAssoc(self.Owner).WorkOrder_ID = AAllocated_Workorder_ID )
  end;

  function check_allow_09: Boolean;
  begin
    // Result:= ( self.owner is TIQWebTransBackFlush) and ( self is TIQWebTransIn ) and (TIQWebTransBackFlush(self.owner).Trans_Type = TRAN_TYPE_FINISH_PROCESS_WIP);
    // WIP hard allocation error - CRM# 624636. 07-26-2012 request to allow trans-in type regardless of hardallocation
    Result:= ((self.owner is TIQWebTransDispo) or (self.owner is TIQWebTransFloorDispo) or (self.owner is TIQWebTransBackFlush) or (self.owner is TIQWebTransAssoc))
             and
             ( self is TIQWebTransIn );
  end;


begin
  if FGMulti_ID = 0 then EXIT;

  AAllocated_Workorder_ID:= SelectValueFmtAsFloat('select b.workorder_id from workorder_bom_mat_loc m, workorder_bom b where m.fgmulti_id = %f and m.workorder_bom_id = b.id', [ FGMulti_ID  ], FDataBaseName);
  if AAllocated_Workorder_ID = 0 then
     EXIT;

  {allow consumption of allocated fgmulti during prod reporting}
  if check_allow_01() or check_allow_02() or check_allow_03() or check_allow_04() or check_allow_05() or
     check_allow_06() or check_allow_07() or check_allow_08() or check_allow_09()  then
    EXIT;

  {Location is marked as hard allocated to WO# %s. Transaction aborted}
  raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000338, [ FloatToStr(AAllocated_Workorder_ID) ]);
end;


procedure TIQWebInvTranBase.CheckMakeToOrder;
var
  AFGMulti_Make_To_Order_Detail_ID: Real;
  AWorkorder_ID: Real;
  AWO_Make_To_Order_Detail_ID: Real;
  ALoc_Desc: string;

  function GetMTO( AOrd_Detail_ID: Real ): string;
  begin
     Result:= SelectValueFmtAsString('select rtrim(o.orderno)||''/''||d.ord_det_seqno from orders o, ord_detail d where d.id = %f and d.orders_id = o.id', [ AOrd_Detail_ID ], FDataBaseName);
     if Result = '' then
        Result:= 'N/A';
  end;

  procedure CheckMakeToOrderConsumption( AWorkOrder_ID, AOrd_Detail_ID: Real );
  begin
    // if (AOrd_Detail_ID > 0) then
    //    raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000342, {'Cannot consume location %s marked as hard allocated to a sales order (SO/Line: %s). Transaction aborted'}
    //                              [ ALoc_Desc,
    //                                GetMTO( AOrd_Detail_ID )]);
    if SelectValueFmtAsFloat('select mto.is_relieve_location_valid( %f, %f ) from dual', [ AWorkOrder_ID, FGMulti_ID ], FDataBaseName) = 0 then
       raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000406 ); // 'Invalid relieve location due to possible MTO mismath between work order and relieve location.'
  end;

begin
  if FGMulti_ID = 0 then EXIT;

  ALoc_Desc:= SelectValueFmtAsString('select rtrim(loc_desc) from v_fgmulti_locations where id = %f', [  FGMulti_ID ], FDataBaseName);
  AFGMulti_Make_To_Order_Detail_ID:= SelectValueByID('make_to_order_detail_id', 'fgmulti', FGMulti_ID, FDataBaseName);
  AWorkorder_ID:= 0;

  // produced items - for certain in transactions get workorder_id and from there the associated make_to_order_detail_id
  if  Assigned(self.owner) and ((self.owner is TIQWebTransDispo) or (self.owner is TIQWebTransFloorDispo)) then
       begin
          {06-02-2008 we toggle AllowMakeToOrderTrans to true for IN and OUT transactions for on-fly in/out dispo of the phantom items}
          if TIQWebInvTranBaseCustom( self ).AllowMakeToOrderTrans then
             EXIT;

          AWorkOrder_ID:= TIQWebTransDispo(self.owner).Workorder_ID;

          if self is TIQWebTransOut then
          begin
             CheckMakeToOrderConsumption( AWorkOrder_ID, AFGMulti_Make_To_Order_Detail_ID );
             EXIT;
          end;
       end

  else if Assigned(self.owner) and (self.owner is TIQWebTransBackFlush)
          and ((TIQWebTransBackFlush(self.owner).Trans_Type = TRAN_TYPE_DISPO)
                or
               (TIQWebTransBackFlush(self.owner).Trans_Type = TRAN_TYPE_PROCESS_WIP)) then
       begin
          AWorkOrder_ID:= TIQWebTransBackFlush(self.owner).Workorder_ID;

          if self is TIQWebTransOut then
          begin
             CheckMakeToOrderConsumption( AWorkOrder_ID, AFGMulti_Make_To_Order_Detail_ID );
             EXIT;
          end;
       end

  else if Assigned(self.owner) and (self.owner is TIQWebTransBackFlush) and (TIQWebTransBackFlush(self.owner).Trans_Type = TRAN_TYPE_PO) then
       begin
          if TIQWebTransBackFlush(self.owner).AllowMakeToOrderTrans then
             EXIT;
       end

  else if Assigned(self.owner) and ((self.owner is TIQWebTransBackFlush) or (self.owner is TIQWebTransAssoc)) and (self is TIQWebTransIn) and TIQWebTransIn(self).AllowMakeToOrderTrans then
       EXIT

  else if Assigned(self.owner) and ((self.owner is TIQWebTransBackFlush) or (self.owner is TIQWebTransAssoc)) and (self is TIQWebTransOut) and TIQWebTransOut(self).AllowMakeToOrderTrans then
       EXIT

  else if Assigned(self.owner) and (self.owner is TIQWebTransBackFlush) and TIQWebTransBackFlush(self.owner).AllowMakeToOrderTrans and (self is TIQWebTransIn) then
       AWorkOrder_ID:= TIQWebTransBackFlush(self.owner).Workorder_ID

  else if self is TIQWebTransReject then
       AWorkOrder_ID:= TIQWebTransReject(self).WorkOrder_ID

  else if self.owner is TIQWebTransMove then
       EXIT  // verified in the TIQWebTransMove.ValidateTransaction

  else if self is TIQWebTransPackSlip then
       EXIT  // verified in the TIQWebTransPackSlip.ValidateTransaction

  else if Assigned(self.Owner) and (self.Owner is TIQWebTransInTransitMove) then
       EXIT  // verified in the TIQWebTransInTransitMove.ValidateTransaction

  else if Assigned(self.Owner) and (self.Owner is TIQWebTransInTransitMove) then
       EXIT  // verified in TIQWebTransInTransitMove.ValidateTransaction;

  else if self is TIQWebTransPackSlipVoid then
       EXIT  // verified in the TIQWebTransPackSlipVoid.ValidateTransaction

  else if self is TIQWebTransRMA then
       EXIT  // verified in the TIQWebTransRMA.ValidateTransaction;

  else if self is TIQWebTransPhysInvIN then
       EXIT

  else if self is TIQWebTransPhysInvOUT then
       EXIT

  else if self is TIQWebTransVMIConsume then
       EXIT  // verified in the TIQWebTransVMIConsume.ValidateTransaction

  else if Assigned(self.owner) and (self.owner is TIQWebTransVMI_Return) and TIQWebTransVMI_Return(self.owner).AllowMakeToOrderTrans then
       EXIT

  else
       AWorkOrder_ID:= 0;

  // get make_to_order_detail_id based on workorder
  if AWorkOrder_ID > 0 then
     AWO_Make_To_Order_Detail_ID:= SelectValueFmtAsFloat('select mto.get_ord_detail( %f ) from dual', [ AWorkorder_ID ], FDataBaseName)
  else
     AWO_Make_To_Order_Detail_ID:= 0;

  // fgmulti must belong to item that is on this MTO sales order
  if (AFGMulti_Make_To_Order_Detail_ID = 0) and (SelectValueFmtAsFloat('select MTO.is_item_matching_ord_detail( %f, %f ) from dual', [ AWO_Make_To_Order_Detail_ID, FGMulti_ID ], FDataBaseName) = 0) then
     EXIT;

  if IsSIC( SelectValueByID('arinvt_id', 'fgmulti', FGMulti_ID, FDataBaseName )) and (GetSwitch('labels_control_mto_dispo', 'iqsys2', FDataBaseName) = 'Y') then
     EXIT;

  // the make_to_order_detail_id must match
  if AFGMulti_Make_To_Order_Detail_ID <> AWO_Make_To_Order_Detail_ID then
     raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000343, {'Make-To-Order mismatch of WO# %.0f (SO/Line: %s) and Location ''%s'' (SO/Line: %s). Transaction aborted.'}
                                [ AWorkOrder_ID,
                                  GetMTO( AWO_Make_To_Order_Detail_ID ),
                                  ALoc_Desc,
                                  GetMTO( AFGMulti_Make_To_Order_Detail_ID )]);
end;


class function TIQWebInvTranBase.GetMakeToOrderDetail_ID_FromShipmentDetail_ID( AShipment_Dtl_ID: Real; DB:String = 'IQFD' ): Real;
begin
  Result:= SelectValueFmtAsFloat('select decode(d.is_make_to_order, ''Y'', d.id, 0) from shipment_dtl s, ord_detail d where s.id = %f and s.order_dtl_id = d.id',
                     [ AShipment_Dtl_ID ], DB);  // FTrans_Source_ID = shipment_dtl_id
end;


function TIQWebInvTranBase.GetTollItemInfo(var ACargo: TCrossArinvtCargo): Boolean;
var
  AArinvt_ID: Real;
  A: Variant;
begin
  Result:= FALSE;

  if FGMulti_ID = 0 then
     EXIT;

  AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', FGMulti_ID, FDataBaseName );
  if AArinvt_ID = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select target_arinvt_id, division_id from toll_item where arinvt_id = %f', [ AArinvt_ID ], FDataBaseName);
  if (VarArrayDimCount( A ) = 0) or (A[ 0 ] = 0) then
     EXIT;

  ACargo:= TCrossArinvtCargo.Create( AArinvt_ID );
  ACargo.TrgArinvt_ID:= A[ 0 ];
  ACargo.TrgDivision_ID:= A[ 1 ];

  Result:= TRUE;
end;


procedure TIQWebInvTranBase.ValidateMakeToOrderOnMoveBetweenShipmentToFromInventory( ATransactionSource: string = '*'; ATransactionSource_ID: Real = -1);
var
  AMakeToOrder_ID1: Real;
  AMakeToOrder_ID2: Real;
begin
  if ATransactionSource = '*' then
     ATransactionSource:= FTrans_Source;

  if ATransactionSource_ID = -1 then
     ATransactionSource_ID:= FTrans_Source_ID;

  if ATransactionSource <> 'SHIPMENT_DTL' then
     EXIT;
// if  VMI location allow MakeToOrder to proceed YT- EIQ-11752
  if SelectValueFmtAsString('select NVL(l.vmi, ''N'') from locations l, fgmulti f where f.loc_id = l.id and f.id = %f', [FGMulti_ID ], FDataBaseName) = 'Y' then exit;
  
  // based on Trans_Source_ID that is shipment_dtl_id find out if we need to validate the make_to_order_detail_id of fgmulti involved
  AMakeToOrder_ID1:= SelectValueFmtAsFloat('select make_to_order_detail_id from fgmulti where id = %f', [ FGMulti_ID ], FDataBaseName);
  AMakeToOrder_ID2:= GetMakeToOrderDetail_ID_FromShipmentDetail_ID( ATransactionSource_ID );  // FTrans_Source_ID = shipment_dtl_id
//  IQAssert( AMakeToOrder_ID1 = AMakeToOrder_ID2, IQMS.WebVcl.ResourceStrings.cTXT0000345 ); {'MakeToOrder hard allocated inventory violation. Transaction aborted'}
end;



procedure TIQWebInvTranBase.SetFGMulti_ID(const Value: Double);
begin
  FFGMulti_ID := Value;
end;



{TIQWebInvTranBaseCustom }

constructor TIQWebInvTranBaseCustom.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type := TRAN_TYPE_MANUAL;
  CheckForChangingSkid:= TRUE;
  CUser1:= '';
  CUser2:= '';
  CUser3:= '';
  FMissingLotExpiryDateAction:= meaNone; // (meaNone, meaPrompt, meaRaiseException);
end;

procedure TIQWebInvTranBaseCustom.AssignFields( DataSet:TDataSet );
begin
  inherited;
  DataSet.FieldByName('Trans_in_out').asString   := FTrans_in_out;
  DataSet.FieldByName('Trans_Type').asString     := FTrans_Type;
  DataSet.FieldByName('FGMulti_ID').asFloat      := FGMulti_ID;
  DataSet.FieldByName('Trans_Quan').asFloat      := Trans_Quan;
  DataSet.FieldByName('RG_quan').asFloat         := Trans_RG_quan;
  DataSet.FieldByName('Trans_Reason').asString   := Trans_Reason;
  DataSet.FieldByName('FG_Lotno').asString       := FG_LotNo;
  DataSet.FieldByName('Parent_Arinvt_id').asFloat:= Parent_Arinvt_ID;
  DataSet.FieldByName('RECEIPTNO').asString      := FRECEIPTNO;
  DataSet.FieldByName('TrackNo').asString        := TrackNo;
  if SelectValueFmtAsFloat('select id from ta_labor where id = %f', [FTA_Labor_id], FDataBaseName) <> 0 then
    DataSet.FieldByName('Ta_labor_id').asFloat   := FTA_Labor_id;

  if Trim(Trans_Source) <> '' then
    DataSet.FieldByName('Source').asString   := Trans_Source;

  if Trans_Source_ID <> 0 then
    DataSet.FieldByName('Source_ID').asFloat   := Trans_Source_ID;

  AssignDivisionInfo(DataSet);
  AssignCUserFields(DataSet);
  AssignTransCode(DataSet);
end;

procedure TIQWebInvTranBaseCustom.AssignTransCode( DataSet: TDataSet );
begin
  if FTrans_Code_ID > 0 then
     with TFDQuery.Create(self) do
     try
       ConnectionName := FDataBaseName;
       SQL.Add(IQFormat('select code, descrip from trans_code where id = %f', [ FTrans_Code_ID ]));
       Open;
       if Eof and Bof then
          EXIT;
       DataSet.FieldByName('trans_code').asString   := FieldByName('code').asString;
       DataSet.FieldByName('trans_descrip').asString:= FieldByName('descrip').asString;
     finally
       Free;
     end;
end;

procedure TIQWebInvTranBaseCustom.AssignDivisionInfo(DataSet:TDataSet);
begin
  with TFDQuery.Create(self) do
  try
    ConnectionName := FDataBaseName;
    Sql.Add(IQFormat('select f.division_id, d.name from fgmulti f, division d where f.id = %f and f.division_id = d.id',
                      [ FGMulti_ID ]));
    Open;
    if Eof and Bof then Exit;
    if FieldByName('DIVISION_ID').asFloat <> 0 then
      DataSet.FieldByName('DIVISION_ID').asFloat := FieldByName('DIVISION_ID').asFloat;
    if FieldByName('NAME').asString <> '' then
      DataSet.FieldByName('DIVISION_NAME').asString := FieldByName('NAME').asString;
  finally
    Free;
  end
end;


procedure TIQWebInvTranBaseCustom.AssignCUserFields( DataSet:TDataSet );
var
  A:Variant;
begin
  A:= SelectValueArrayFmt( 'select cuser1, cuser2, cuser3 from fgmulti where id = %f', [ FGMulti_ID ], FDataBaseName);
  if VarArrayDimCount( A ) > 0 then
  begin
    if CUser1 = '' then CUser1:= A[ 0 ];
    if CUser2 = '' then CUser2:= A[ 1 ];
    if CUser3 = '' then CUser3:= A[ 2 ];
  end;
  DataSet.FieldByName('fgmulti_cuser1').asString:= CUser1;
  DataSet.FieldByName('fgmulti_cuser2').asString:= CUser2;
  DataSet.FieldByName('fgmulti_cuser3').asString:= CUser3;
end;

procedure TIQWebInvTranBaseCustom.ValidateTransaction;
begin
  inherited;
  if (ClassType = TIQWebTranOverhead) or  (ClassType = TIQWebTranLabor) or (ClassType = TIQWebTransRepairFinished)
     or (ClassType = TIQWebTransReworkFinished) or (ClassType = TIQWebTranAdjustWIP) or (ClassType = TIQWebTransLandedCost) then
    EXIT;


  if (FGMulti_ID = 0) and
  not ((Ftrans_type = TRAN_TYPE_PO_NON_INV) or
       (Ftrans_type = TRAN_TYPE_PO_NON_INV_VOID) or
       (Ftrans_type = TRAN_TYPE_NON_INV_VEND_RMA) or
       (Ftrans_type = TRAN_TYPE_NON_INV_VEND_RMA_VOID) or
       (Ftrans_type = TRAN_TYPE_ICA)) then

     // 'FGMulti ID is zero.  Unable to Execute Transaction.'
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000217);

  if (FTrans_Quan = 0) and (FTrans_RG_Quan = 0)
      and (Ftrans_type <> TRAN_TYPE_CONFORM)
      and (Ftrans_type <> TRAN_TYPE_DISPO )
      and (Ftrans_type <> TRAN_TYPE_ICA )
      and (Ftrans_type <> TRAN_TYPE_PHYS_INV) then
  begin
    // 'Trans Quantity is zero.  Unable to Execute Transaction'
    if not AllowZeroQty then
       raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000218);
  end;

//  if CheckForChangingSkid then
//     CheckLocationInSkid( FGMulti_ID );  {IQSkConf.pas}


  // 07/10/2015 EIQ-7781 RT Scan to Inventory - component backflushed is
  // Lot # Mandatory - change error message when material not in Dispo Out
  // location

  // 07/30/2015 reverted
  // CheckWorkCenterDispoOutQty;

  // if (SelectValueFmtAsFloat('select 1 from fgmulti f, arinvt a where f.id = %f and rtrim(f.lotno) is NULL ' +
  //               '   and f.arinvt_id = a.id and a.is_lot_mandatory = ''Y''', [ FGMulti_ID ]) = 1)
  //    and
  //    (FTrans_Quan <> 0) then
  //   raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000358,  {'Missing mandatory field ''Lot #''. [Item# %s, Loc: %s]'}
  //                             [ SelectValueFmtAsString('select itemno from arinvt a, fgmulti f where f.id = %f and f.arinvt_id = a.id', [ FGMulti_ID ]),
  //                               SelectValueByID('loc_desc', 'v_fgmulti_locations', FGMulti_ID)]);
  // 02-07-2014
  CheckMandatoryLotNo;

  CheckMandatoryLotExpiryDate;
end;

procedure TIQWebInvTranBaseCustom.CheckWorkCenterDispoOutQty;
var
  i: Integer;

  procedure _Check(const AArinvtID, APtsPer: Real; ALotNo: string);
  var
    AOnHand, ATotalQty: Real;
    AItemno, ALocDesc: string;
    ADispoOut_FGMultiID: Real;
  begin
    // Initialize
    AOnHand := 0;
    ATotalQty := 0;
    ADispoOut_FGMultiID := 0;
    ALocDesc := '(None found)';

    if AArinvtID = 0 then
      Exit;

    // Parts Per coming in comes from OPMAT.  Multiply by the label quantity.
    if APtsPer = 0 then
      ATotalQty := FTrans_Quan
    else
      ATotalQty := FTrans_Quan * APtsPer;

    // If not dispo OUT location is assigned to the work center,
    // then exit.
    if SelectValueFmtAsFloat(
      'SELECT 1'#13 +
      '  FROM work_center a, locations b'#13 +
      ' WHERE a.id = %.0f AND'#13 +
      '       a.locations_id = b.id',
      [Work_Center_ID]) = 0 then
      Exit;

    // Get the dispo OUT location
    with TFDQuery.Create(nil) do
    try
      ConnectionName:= FDataBaseName;
      SQL.Add('SELECT b.id,');
      SQL.Add('       a.locations_id,');
      SQL.Add('       c.loc_desc,');
      SQL.Add('       b.onhand');
      SQL.Add('  FROM work_center a, fgmulti b, locations c');
      SQL.Add(Format(' WHERE a.id = %.0f AND',[Work_Center_ID]));
      SQL.Add(Format('       b.arinvt_id = %.0f AND',[AArinvtID]));
      SQL.Add('       c.id = a.locations_id AND');
      SQL.Add('       b.loc_id = c.id');
      Open;
      if not (Bof and Eof) then
        begin
          ADispoOut_FGMultiID := Fields[0].AsFloat;
          ALocDesc :=  Fields[2].AsString;
          AOnHand := Fields[3].AsFloat;
        end;
    finally
      Free;
    end;

    // Compare requested disposition amount to what is on hand.
    // If on hand is less than can be taken out, then raise an
    // exception.
//    if iqnumber.LessThan(AOnHand, ATotalQty) then
//      begin
//        // Get Item # for message
//        AItemno := SelectValueFmtAsString(
//        'SELECT itemno                      '#13 +
//        '  FROM arinvt                      '#13 +
//        ' WHERE id = %.0f                   ',
//        [AArinvtID]);
//      // Raise the exception
//      // IQMS.WebVcl.ResourceStrings. cTXT0000502 =
//      // 'Insufficient component quantity in Dispo Out location. '#13#13 +
//      // 'Item #: %s'#13 +
//      // 'Transaction Quantity:  %f'#13 +
//      // 'Location: %s'#13 +
//      // 'On Hand:  %f';
//      raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings. cTXT0000502,
//        [iqstring.FixStr(AItemno), ATotalQty,
//         iqstring.FixStr(ALocDesc), AOnHand]);
//      end;
  end;

  procedure _ProcLabel(const AMasterLabelID: Real);
  begin
    // Loop the attached components for the Inventory item on
    // this label.
    with TFDQuery.Create(nil) do
    try
      ConnectionName:= FDataBaseName;
      SQL.Add('SELECT d.arinvt_id,');
      SQL.Add('       d.ptsper,');
      SQL.Add('       f.fg_lotno');
      SQL.Add('  FROM partno a, ptoper b, sndop c, opmat d, master_label f');
      SQL.Add(Format(' WHERE f.id = %.0f AND',[AMasterLabelID]));
      SQL.Add('       a.arinvt_id = f.arinvt_id AND');
      SQL.Add('       b.partno_id(+) = a.id AND');
      SQL.Add('       c.id(+) = b.sndop_id AND');
      SQL.Add('       c.op_class = ''IN'' AND');
      SQL.Add('       d.sndop_id(+) = c.id');
      Open;
      while not Eof do
        begin
          // Process this component
          _Check(Fields[0].AsFloat, Fields[1].AsFloat, Fields[2].AsString);
          Next;
        end;
    finally
      Free;
    end;
  end;

  procedure _ProcFGMulti;
  var
    AArinvtID: Real;
    ALotNo: string;
  begin
    AArinvtID := SelectValueFmtAsFloat(
      'SELECT arinvt_id FROM fgmulti WHERE id = %.0f', [FGMulti_ID],
      FDataBaseName );

    ALotNo := SelectValueFmtAsString(
      'SELECT trim(lotno) FROM fgmulti WHERE id = %.0f', [FGMulti_ID],
      FDataBaseName );

    with TFDQuery.Create(nil) do
    try
      ConnectionName:= FDataBaseName;
      SQL.Add('SELECT d.arinvt_id,');
      SQL.Add('       d.ptsper');
      SQL.Add('  FROM partno a, ptoper b, sndop c, opmat d');
      SQL.Add(Format(' WHERE a.arinvt_id = %.0f AND',[AArinvtID]));
      SQL.Add('       b.partno_id(+) = a.id AND');
      SQL.Add('       c.id(+) = b.sndop_id AND');
      SQL.Add('       c.op_class = ''IN'' AND');
      SQL.Add('       d.sndop_id(+) = c.id');
      Open;
      while not Eof do
        begin
          // Process this component
          _Check(Fields[0].AsFloat, Fields[1].AsFloat, ALotNo);
          Next;
        end;
    finally
      Free;
    end;
  end;

begin
  // Check the production reporting setting first
  if SelectValueAsString(
    'SELECT backflush_on_scan_to_inv FROM params WHERE ROWNUM < 2',
    FDataBaseName ) <> 'Y' then
    Exit;

  if not (FTrans_in_out = 'IN') then
    Exit;

  if Assigned(Master_Label_List) and (Master_Label_List.Count > 0) then
    begin
      // Process each label
      for I:= 0 to Master_Label_List.Count - 1 do
        _ProcLabel( StrToFloat(Master_Label_List[ I ]));
    end
  else
    _ProcFGMulti;
end;

procedure TIQWebInvTranBaseCustom.CheckMandatoryLotNo;
var
  I: Integer;
  AArinvt_ID: Real;

  // ---------------------------------------------------------------------------
  procedure _raise_exception_mandatory_lot_missing( AMaster_Label_ID: Real = 0 );
  var
    AText: string;
  begin
    AText:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000358,  {'Missing mandatory field ''Lot #''. [Item# %s, Loc: %s]'}
                    [ SelectValueByID('itemno', 'arinvt', AArinvt_ID, FDataBaseName),
                      SelectValueByID('loc_desc', 'v_fgmulti_locations', FGMulti_ID, FDataBaseName)]);
    if AMaster_Label_ID > 0 then
       AText:= Format( '%s. Master Label ID = %.0f', [ AText, AMaster_Label_ID ]);
    raise Exception.Create( AText );
  end;


  // ---------------------------------------------------------------------------
  procedure _CheckMandatoryLotNoInFGMulti( AMaster_Label_ID: Real = 0 );
  begin
    if SelectValueByID('rtrim(lotno)', 'fgmulti', FGMulti_ID, FDataBaseName) = '' then
       _raise_exception_mandatory_lot_missing( AMaster_Label_ID );
  end;


  // ---------------------------------------------------------------------------
  procedure _CheckMandatoryLotNoInMasterLabel( AMaster_Label_ID: Real );
  var
    AIsPallet: Boolean;
    I: Integer;
    AList: TStringList;
  begin
    // pallet or single label
    AIsPallet:= SelectValueByID('is_pallet', 'master_label', AMaster_Label_ID, FDataBaseName) = 'Y';
    if not AIsPallet then
    begin
      if SelectValueByID('rtrim(fg_lotno)', 'master_label', AMaster_Label_ID, FDataBaseName) = '' then
         _raise_exception_mandatory_lot_missing( AMaster_Label_ID );
      EXIT;
    end;

    AList:= TStringList.Create;
    try
      LoadColumnValueIntoStringList( AList, Format('select id from master_label where parent_id = %.0f', [ AMaster_Label_ID ]));
      for I:= 0 to AList.Count - 1 do
        _CheckMandatoryLotNoInMasterLabel( StrToFloat(AList[ I ]));
    finally
      AList.Free;
    end;
  end;


// -----------------------------------------------------------------------------
begin
  if FTrans_Quan = 0 then
     EXIT;

  AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', FGMulti_ID, FDataBaseName );
  if SelectValueByID('is_lot_mandatory', 'arinvt', AArinvt_ID, FDataBaseName ) <> 'Y' then
     EXIT;

  if Assigned(Master_Label_List) and (Master_Label_List.Count > 0)
     and not (self is TIQWebTransRMA) then  //  EIQ-10257: Phoenix Closures - RMA Return - Missing mandatory field 'Lot#' error
     // for pallets check each box
    for I:= 0 to Master_Label_List.Count - 1 do
       _CheckMandatoryLotNoInMasterLabel( StrToFloat(Master_Label_List[ I ]))
  else
     _CheckMandatoryLotNoInFGMulti;
end;



procedure TIQWebInvTranBaseCustom.CheckMandatoryLotExpiryDate;
var
  AArinvt_ID: Real;
  ALotNo: string;
begin
  if FTrans_Quan = 0 then
     EXIT;

  if MissingLotExpiryDateAction = meaNone then
     EXIT;

  AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', FGMulti_ID, FDataBaseName );
//  if not inv_misc.GetIsLotExpiryDateMandatory( AArinvt_ID ) then
//     EXIT;
//
//  ALotNo:= SelectValueByID('rtrim(lotno)', 'fgmulti', FGMulti_ID, FDataBaseName);
//  if inv_misc.GetLotExpiryDate( AArinvt_ID, ALotNo ) > 0 then
//     EXIT;
//
//  if MissingLotExpiryDateAction = meaRaiseException then
//     raise TMissingLotExpiryDate.Create( IQMS.WebVcl.ResourceStrings.cTXT0000437 ); // 'Missing mandatory lot expiration date - operation aborted';
//
//  inv_misc.PromptUpdateLotExpiryDate( AArinvt_ID, ALotNo );
end;



procedure TIQWebInvTranBaseCustom.ClearNeedCycleCount;
begin
  ExecuteCommandFmt('update fgmulti set need_cycle_count = ''N'' where id = %f', [ FGMulti_ID ], FDataBaseName);
end;


destructor TIQWebInvTranBaseCustom.Destroy;
begin
  if FIsMasterLabelListCreatedInternally then
  begin
    ClearStringListOfObjects( FMaster_Label_List );  {IQMS.Common.Controls.pas}
    FMaster_Label_List.Free;
  end;

  inherited;
end;

procedure TIQWebInvTranBaseCustom.CreateInternalMasterLabelListWithLabels(AList: TStringList);
begin
  if not (Assigned(AList) and (AList.Count > 0)) then
     EXIT;

  FMaster_Label_List:= TStringList.Create;
  FIsMasterLabelListCreatedInternally:= TRUE;
  FMaster_Label_List.Assign( AList );
end;


procedure TIQWebInvTranBaseCustom.CreateTransactionRecord;
begin
  inherited;
  // check assign labels to invtrans_master_label
  CheckAppendToInvtrans_Master_Label;
end;


procedure TIQWebInvTranBaseCustom.CheckAppendToInvtrans_Master_Label;
var
  I: Integer;
begin
  // this procedure must be executed after AssignFields in order to ensure FID is populated
  // 08-08-2011 SkipTranslogMasterLabelUpdate for now is skipped only when we ADJUST label qty in iqrf - See \iqrf\Dispo.pas RF_DoTransIn and RF_DoTransOut
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) or SkipTranslogMasterLabelUpdate then
     EXIT;

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    ExecuteCommandFmt(
      'insert into invtrans_master_label         '+
      '    ( invtrans_id, master_label_id, qty ) '+
      'select                                    '+
      '      %f,                                 '+
      '      %s,                                 '+
      '      qty                                 '+
      ' from master_label where id = %s          ',
      [ ID,
      Master_Label_List[ I ],
      Master_Label_List[ I ]], FDataBaseName);  // Trans_Quan
  end;
end;


procedure TIQWebInvTranBaseCustom.UpdateMasterLabelDuringPhysicalAdjustment(AQty: Real);
var
  A        : Variant;
  ALoc_Desc: string;
  AFGLotNo : string;
  AParent_ID: Real;
begin
  inherited;

  {note support for SIC and non-SIC inventory}
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  A:= SelectValueArrayFmt( 'select v.loc_desc, v.lotno from v_fgmulti_locations v, arinvt a where v.id = %f and v.arinvt_id = a.id', [ FGMulti_ID ], FDataBaseName);
  if VarArrayDimCount( A ) = 0 then
     EXIT;
  ALoc_Desc:= FixStr(A[ 0 ]);
  AFGLotNo := FixStr(A[ 1 ]);

  // in physical inventory we always process 1 label at a time
  ExecuteCommandFmt('update master_label                        '+
            '   set loc_desc = ''%s'',                  '+
            '       fg_lotno = ''%s'',                  '+
            IfThen( FOverrideMasterLabelQty,                   // 06-23-2011 for now applies only to IN transactions
            '       qty = %.6f                          ',
            '       qty = nvl(qty,0) + %.6f             ' )+
            ' where id = %s                             ',
            [ ALoc_Desc,
              AFGLotNo,
              AQty,                     // "+" for in and "-" for out
              Master_Label_List[ 0 ]], FDataBaseName);

  ExecuteCommandFmt( 'begin RF.update_pallet_children( %s ); end;', [ Master_Label_List[ 0 ]], FDataBaseName);

  // 11-01-2012 if we updated a child of a pallet - make sure the pallet is up to date
  // Physical Inventory - non-sic pallet serial, locations counted separately - CRM #662292
  AParent_ID:= SelectValueFmtAsFloat('select parent_id from master_label where id = %s', [ Master_Label_List[ 0 ], FDataBaseName ]);
  if AParent_ID > 0 then
     ExecuteCommandFmt( 'begin RF.update_pallet_label_qty( %f ); end;', [ AParent_ID ], FDataBaseName);
end;


procedure TIQWebInvTranBaseCustom.UpdateNon_Conform( ANon_Conform_ID: Real; ANon_Conform_Allocatable: string = '');
//var
//  AArinvt_ID: Real;
begin
  // 07/24/2015 (Byron, EIQ-7964).  Added package procedure based on the
  // original PL-SQL block.  Added a check to exclude VMI FGMULTI locations
  // from being updated with a NON_CONFORM_ID value.
  // 11/09/2015 (Byron, EIQ-9341) Ensured record is locked, and check current
  // value first before updating.
  ExecuteCommandFmt(
    'DECLARE                                                              '#13 +
    '   l_non_conform_id   NUMBER;                                        '#13 +
    '   l_fgmulti_id       NUMBER;                                        '#13 +
    'BEGIN                                                                '#13 +
    '       SELECT id, non_conform_id                                     '#13 +
    '         INTO l_fgmulti_id, l_non_conform_id                         '#13 +
    '         FROM fgmulti                                                '#13 +
    '        WHERE id = %.0f                                              '#13 +
    '   FOR UPDATE;                                                       '#13 +
    '                                                                     '#13 +
    '   IF NVL(l_non_conform_id, 0) <> %.0f THEN                          '#13 +
    '      iqms.inventory_trans.update_non_conform(l_fgmulti_id,          '#13 +
    '                                              %.0f,                  '#13 +
    '                                              ''%s'');               '#13 +
    '   END IF;                                                           '#13 +
    '                                                                     '#13 +
    '   COMMIT;                                                           '#13 +
    'EXCEPTION                                                            '#13 +
    '   WHEN OTHERS THEN                                                  '#13 +
    '      ROLLBACK;                                                      '#13 +
    'END;                                                                 ',
    [FGMulti_ID, ANon_Conform_ID, ANon_Conform_ID, ANon_Conform_Allocatable]);

(* 07/24/2015 Moved to back end
  AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', FGMulti_ID, FDataBaseName );

  ExecuteCommandFmt('declare                                                                                '+
            '  v_arinvt_id               number::= %f;                                              '+
            '  v_fgmulti_id              number::= %f;                                              '+
            '  v_non_conform_id          number::= %s;                                              '+
            '  v_non_conform_allocatable varchar2(15)::= ''%s'';                                    '+
            '  v_onhand                  number;                                                    '+
            'begin                                                                                  '+
            '  select onhand into v_onhand from arinvt where id = v_arinvt_id for update of onhand; '+
            '  update fgmulti set non_conform_id = v_non_conform_id,                                '+
            '         non_conform_allocatable = v_non_conform_allocatable                           '+
            '   where id = v_fgmulti_id;                                                            '+
            'end;                                                                                   ',
            [ AArinvt_ID,
              FGMulti_ID,
              IQString.FloatToStr0asNull( ANon_Conform_ID, 'NULL' ),
              ANon_Conform_Allocatable ], FDataBaseName);
*)
end;

procedure TIQWebInvTranBaseCustom.CheckAppendTo_Translog_Master_Label;
var
  ATranslog_ID: Real;
  AArinvt_ID: Real;
  I: Integer;
begin
  (* 05-11-2009 called from floor dispo after main transaction is executed
     to record fgmulti and associated master_label in translog_master_label
  *)
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  if FGMulti_ID = 0 then
     EXIT;

  AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', FGMulti_ID, FDataBaseName );
  if AArinvt_ID = 0 then
     EXIT;

  ATranslog_ID:= SelectValueFmtAsFloat('select id from translog where sub_batch = %f and arinvt_id = %f and rtrim(trans_in_out) = ''%s'' ', [ FSub_Batch, AArinvt_ID, FTrans_In_Out ], FDataBaseName);

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    ExecuteCommandFmt( 'insert into translog_master_label         '+
               '    ( translog_id, master_label_id, qty ) '+
               'select                                    '+
               '      %f,                                 '+
               '      %s,                                 '+
               '      qty                                 '+
               ' from master_label where id = %s          ',
               [ ATranslog_ID,
                 Master_Label_List[ I ],
                 Master_Label_List[ I ]], FDataBaseName);   // self.Trans_Quan
  end;
end;


{ TIQWebTransIn }

procedure TIQWebTransIn.AssignFields(DataSet: TDataSet);
begin
  {Apr-7-2006 Set to Y if we taking care of updating master_label on the front end}
  if Assigned( Master_Label_List ) and ( Master_Label_List.Count > 0 ) then
     Is_Labels_Updated:= 'Y';
  inherited;
end;

constructor TIQWebTransIn.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_in_out:= TRAN_IN;
  MissingLotExpiryDateAction:= meaPrompt;
end;


function TIQWebTransIn.PostTransaction: Integer;
begin
  Result:= inherited PostTransaction;

  {support for serialized inventory}
  UpdateMasterLabelLocation( FPreserveDispoDate );
end;


procedure TIQWebTransIn.UpdateMasterLabelLocation( APreserveDispoDate: Boolean = FALSE );
var
  I: Integer;
  A: Variant;
  ALoc_Desc: string;
  AFGLotNo : string;
  AOnHandBefore: Real;
  AOnHandAfter : Real;
  AQtyToConsume: Real;
  AQty         : Real;
  ADispo_Date  : TDateTime;
  AIsSerialized: Boolean;
  AInTransitOrigin: Real;
  AShipment_Dtl_ID_InTransit: Real;
  AParent_ID: Real;
begin
  if SkipMasterLabelUpdate then
     EXIT;

  {support for serialized inventory}
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  A:= SelectValueArrayFmt( 'select v.loc_desc, v.lotno, v.onhand, a.is_linked_to_serial, v.in_transit_origin, v.shipment_dtl_id_in_transit from v_fgmulti_locations v, arinvt a where v.id = %f and v.arinvt_id = a.id', [ FGMulti_ID ], FDataBaseName);
  if VarArrayDimCount( A ) = 0 then
     EXIT;
  ALoc_Desc    := FixStr(A[ 0 ]);
  AFGLotNo     := FixStr(A[ 1 ]);
  AOnHandAfter := A[ 2 ];
  AIsSerialized:= A[ 3 ] = 'Y';
  AInTransitOrigin:= A[ 4 ];
  AShipment_Dtl_ID_InTransit:= A[ 5 ];

  {prepare qty if negative to be consumed}
  AOnHandBefore:= AOnHandAfter - Trans_Quan;
//  if AOnHandBefore < 0 then
//     AQtyToConsume:= fMin( 0, AOnHandAfter ) - AOnHandBefore
//  else
//     AQtyToConsume:= 0;

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    if StrToFloatDef(Master_Label_List[ I ], 0) = 0 then
       Continue;

    if APreserveDispoDate then
       ADispo_Date:= SelectValueFmtAsFloat('select dispo_date from master_label where id = %s', [ Master_Label_List[ I ], FDataBaseName ]);

    // 07-15-2013 for outsource move transaction ensure the correct shipment_dtl_id is in the master_label. Leave ps_ticket_dtl and rel alone for now
    if AInTransitOrigin = 2 then
       ExecuteCommandFmt('begin ship_misc.chk_update_label_shipment_dtl( %s, %f ); end;', [ Master_Label_List[ I ], AShipment_Dtl_ID_InTransit ], FDataBaseName);

    CheckMasterLabelLocationIntegrity( FGMulti_ID, StrToFloat(Master_Label_List[ I ]));

    ExecuteCommandFmt('update master_label set loc_desc = ''%s'', fgmulti_id = %f, dispo_scan = ''Y'' where id = %s',
              [ ALoc_Desc,
                FGMulti_ID,
                Master_Label_List[ I ]], FDataBaseName);

    {10-09-2007 update lotno for serialized only, skip non serialized.
     01-04-2013 update both SIC & non SIC. RMA - receiving serial/lot into a location with a different lot - CRM# 462486 and CRM# 561024 }
    // if AIsSerialized then
    ExecuteCommandFmt('update master_label set fg_lotno = ''%s'' where id = %s', [ AFGLotNo, Master_Label_List[ I ]], FDataBaseName);

    {restore dispo_date that may get re-assigned by the trigger}
    if APreserveDispoDate and (ADispo_Date > 0) then
       ExecuteCommandFmt('update master_label set dispo_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') where id = %s',
                 [ FormatDateTime('mm/dd/yyyy hh:nn:ss', ADispo_Date ),
                   Master_Label_List[ I ] ], FDataBaseName);

    {09-11-2006 when floor dispo and we have labels attached - populate day_part_id}
    if Day_Part_ID > 0 then
       ExecuteCommandFmt('update master_label set day_part_id = %f where id = %s', [ Day_Part_ID, Master_Label_List[ I ] ], FDataBaseName);

    {01-20-2010 apply to serialized only}
    if AIsSerialized then
       CheckConsumeLabelToCoverNegatative( AQtyToConsume, StrToFloat(Master_Label_List[ I ]));

    // ExecuteCommandFmt( 'begin RF.update_pallet_children( %s, %f ); end;', [ Master_Label_List[ I ], FGMulti_ID ], FDataBaseName);
    ExecuteCommandFmt('declare                                                                     '+
              '  v_master_label_id     number::= %s;                                       '+
              '  v_fgmulti_id          number::= %.0f;                                     '+
              '  v_preserve_dispo_date varchar2(1)::= ''%s'';                              '+
              'begin                                                                       '+
              '  rf.delete_cargo_params;                                                   '+
              '  rf.add_to_cargo_cparam(''v_preserve_dispo_date'', v_preserve_dispo_date); '+
              '  rf.update_pallet_children( v_master_label_id, v_fgmulti_id );             '+
              '  rf.delete_cargo_params;                                                   '+
              'end;                                                                        ',
              [ Master_Label_List[ I ],
                FGMulti_ID,
                BoolToYN( APreserveDispoDate )],
              FDataBaseName);

    {04-09-2007 reset pallet fgmulti_id to null to prevent the pallet label showing up in the fgmulti associated labels list}
    if SelectValueFmtAsFloat('select id from master_label where parent_id = %s and rownum < 2', [ Master_Label_List[ I ] ], FDataBaseName) > 0 then  {found children - it is a pallet}
       ExecuteCommandFmt('update master_label set fgmulti_id = NULL where id = %s', [ Master_Label_List[ I ] ], FDataBaseName);                    {reset fgmulti_id of the pallet }

    // 02-08-2016 EIQ-10529 Pick Tickets and WMS - Retain parent_id at pick and conversion to pack slip when shipping mixed lot pallet.
    // update master_label location description for mixed lot pallet labels
    if BelongsToMixedLotPallet( StrToFloat( Master_Label_List[ 0 ])) and (I = 0) then
    begin
       AParent_ID:= SelectValueByID('parent_id', 'master_label', StrToFloat( Master_Label_List[ 0 ]), FDataBaseName );
       ExecuteCommandFmt('update master_label set loc_desc = (select loc_desc from master_label where id = %s) where id = %f', 
                         [ Master_Label_List[ 0 ],  
                           AParent_ID ],
                         FDataBaseName);
    end;
       
    {05-03-2013 update VIN_HISTORY}
//    if SecurityManager.IsModuleLicensed( iqapps.IQAppsNames[ apVINGen ]) then
//       ExecuteCommandFmt('declare                                                               '+
//                 '  v_master_label_id  number:= %s;                                     '+
//                 '  v_rec              master_label%%rowtype;                           '+
//                 'begin                                                                 '+
//                 '  select * into v_rec from master_label where id = v_master_label_id; '+
//                 '  update vin_history                                                  '+
//                 '     set dispo_date = v_rec.dispo_date                                '+
//                 '   where serial = v_rec.serial;                                       '+
//                 'exception when no_data_found then                                     '+
//                 '  return;                                                             '+
//                 'end;                                                                  ',
//                 [ Master_Label_List[ I ] ], FDataBaseName);
  end;
end;


procedure TIQWebTransIn.UpdateMasterLabelLocationInReverse;
var
  I: Integer;
begin
  if SkipMasterLabelUpdate then
     EXIT;

  {support for serialized inventory}
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    if StrToFloatDef(Master_Label_List[ I ], 0) = 0 then
       Continue;

    {May-9-2006 nullify loc_desc}
    ExecuteCommandFmt('update master_label set fgmulti_id = NULL, loc_desc = NULL where id = %s',
              [ Master_Label_List[ I ]], FDataBaseName);

    ExecuteCommandFmt('update master_label set dispo_scan = ''N'' where id = %s',
              [ Master_Label_List[ I ]], FDataBaseName);

    {update children}
    ExecuteCommandFmt('begin rf.update_pallet_children_ex( %s, ''rf.reset_master_label_location( :1 )''); end;',
              [ Master_Label_List[ I ]], FDataBaseName);
  end;
end;


procedure TIQWebTransIn.CheckDuplicateDispoScan;
var
  I: Integer;
  A: Variant;
  ADispo_Scan: string;
  ASys_Date: TDateTime;
  ACurr_Date: TDateTime;
begin
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  ACurr_Date:= SelectValueAsFloat('select sysdate from dual', FDataBaseName);

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    if StrToFloatDef(Master_Label_List[ I ], 0) = 0 then
       Continue;

    A:= SelectValueArrayFmt( 'select dispo_scan, sys_date from master_label where id = %s', [ Master_Label_List[ I ]], FDataBaseName);
    if VarArrayDimCount( A ) = 0 then
       Continue;

    ADispo_Scan:= A[ 0 ];
    ASys_Date:= 0;
    if not VarIsNull(A[ 1 ]) then
       ASys_Date:= A[ 1 ];
//    if (ADispo_Scan = 'Y') and (ASys_Date > 0) and ( IQRound(Abs(ACurr_Date - ASys_Date)*86400, 0) <= 3) then  // within 3 secs
//       raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000372 {'Error - Duplicate Scan'} );
  end;
end;


procedure TIQWebTransIn.CheckMasterLabelLocationIntegrity( AFGMulti_ID, AMaster_Label_ID: Real);
var
  A: Variant;
  ACargo: TMasterLabelInfoCargo;
begin
  if SkipMasterLabelLocationIntegrityCheck then
    EXIT; //EIQ-7322 IQRF/WMSIQ - Query Label, Edit Qty error w/ SIC quantity increase - Spencer Industries CRM #1237324

  A:= SelectValueArrayFmt( 'select arinvt_id, fgmulti_id, is_pallet, shipment_dtl_id from master_label where id = %f', [ AMaster_Label_ID ], FDataBaseName);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  {check for null fgmulti_id}
  if (A[ 1 ] = 0) or (A[ 2 ] = 'Y') then
     EXIT;

  if SelectValueByID('is_linked_to_serial', 'arinvt', A[ 0 ], FDataBaseName) <> 'Y' then
     EXIT;

  {Sometimes when this is a part of a MOVE trans the out counterpart is not being updated (i.e fgmulti_id reset to null).
   Check & allow through when the counterpart is valid i.e master_label.fgmulti_id is still pointing to the correct record}
  if CheckIsMoveValidateCounterpartIntegrity( AFGMulti_ID, AMaster_Label_ID ) then
     EXIT;

  ACargo:= TMasterLabelInfoCargo.Create( AMaster_Label_ID, FDataBaseName );

  // 12-09-2015 EIQ-9159 - allow fgmulti_id > 0 when label is being received via RMA and hasnt been processed yet (shipment_dtl_id > 0)
  if ( self is TIQWebTransRMA ) and (A[ 3 ] {shipment_dtl_id} > 0)  then
       EXIT;

//  IQAssert( A[ 1 ] = 0, Format('The label(s) in this transaction are already associated to a location - operation aborted.'#13#13+
//                               'Serial#: %s'#13+
//                               'Master Label Location ID: %.0f (expected null)'#13+
//                               'Inventory Location ID: %.0f'#13+
//                               'Trans: IN',
//                               [ ACargo.Serial,
//                                 DtoF(A[ 1 ]),
//                                 AFGMulti_ID ]));
end;

function TIQWebTransIn.CheckIsMoveValidateCounterpartIntegrity( AFGMulti_ID, AMaster_Label_ID: Real ): Boolean;
var
  ATransOut: TIQWebTransOut;
begin
  Result:= FALSE;

  if not (self.Owner is TIQWebTransMove) then
     EXIT;

  ATransOut:= TIQWebTransMove(self.Owner).TransOut;

  ATransOut.CheckMasterLabelLocationIntegrity( ATransOut.FGMulti_ID, AMaster_Label_ID );

  Result:= TRUE;
end;

procedure TIQWebTransIn.CheckApplyCrossArinvtMove;
var
  ACargo: TCrossArinvtCargo;
begin
  if not GetTollItemInfo( ACargo ) then
     EXIT;

  ACargo.Act_Cost:= SelectValueFmtAsFloat('select std_cost from arinvt where id = %f', [ ACargo.SrcArinvt_ID ], FDataBaseName);

  TIQWebTranBase.ExecuteCrossArinvtMove( self, ACargo, FDataBaseName );
end;


procedure TIQWebTransIn.CheckConsumeLabelToCoverNegatative( var AQtyToConsume: Real; AMaster_Label_ID: Real );
var
  ALabelQty: Real;
  AQty: Real;
begin
  if AQtyToConsume = 0 then EXIT;

  ALabelQty:= SelectValueFmtAsFloat('select qty from master_label where id = %f', [ AMaster_Label_ID ], FDataBaseName);

  if AQtyToConsume <= ALabelQty then
     AQty:= AQtyToConsume
  else
     AQty:= ALabelQty;

  ExecuteCommandFmt('update master_label set qty = nvl(qty,0) - %.6f where id = %f', [ AQty, AMaster_Label_ID ], FDataBaseName);

  AQtyToConsume:= AQtyToConsume - AQty;
end;


{TIQWebTransOut}

procedure TIQWebTransOut.AssignFields(DataSet: TDataSet);
begin
  {Apr-7-2006 Set to Y if we taking care of updating master_label on the front end}
  if Assigned( Master_Label_List ) and ( Master_Label_List.Count > 0 ) then
     Is_Labels_Updated:= 'Y';
  inherited;
end;

procedure TIQWebTransOut.CheckApplyCrossArinvtMove;
var
  ACargo: TCrossArinvtCargo;
begin
  if not GetTollItemInfo( ACargo ) then
     EXIT;

  ACargo.Act_Cost:= SelectValueFmtAsFloat('select std_cost from arinvt where id = %f', [ ACargo.SrcArinvt_ID ]);

  TIQWebTranBase.ExecuteCrossArinvtMove( self, ACargo, FDataBaseName);
end;


procedure TIQWebTransOut.CheckMasterLabelLocationIntegrity(AFGMulti_ID,  AMaster_Label_ID: Real);
var
  A: Variant;
  ACargo: TMasterLabelInfoCargo;
begin
  if AFGMulti_ID = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select arinvt_id, fgmulti_id, is_pallet from master_label where id = %f', [ AMaster_Label_ID ], FDataBaseName);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  if (A[ 2 ] = 'Y') or (A[ 1 ] = AFGMulti_ID) then
     EXIT;

  if SelectValueByID('is_linked_to_serial', 'arinvt', A[ 0 ], FDataBaseName) <> 'Y' then
     EXIT;

  ACargo:= TMasterLabelInfoCargo.Create( AMaster_Label_ID, FDataBaseName );

//  IQAssert( A[ 1 ] = AFGMulti_ID, Format('The location(s) associated with the label(s) in this transaction are no longer current - operation aborted.'#13#13+
//                                         'Serial#: %s'#13+
//                                         'Master Label Location ID: %.0f'#13+
//                                         'Inventory Location ID: %.0f'#13+
//                                         'Trans: OUT',
//                                         [ ACargo.Serial,
//                                           DtoF(A[ 1 ]),
//                                           AFGMulti_ID ]));
end;

constructor TIQWebTransOut.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_in_out:= TRAN_OUT;
end;

function TIQWebTransOut.PostTransaction: Integer;
begin
  Result:= inherited PostTransaction;

  {support for serialized inventory}
  UpdateMasterLabelLocation;
end;

procedure TIQWebTransOut.UpdateMasterLabelLocation;
var
  I: Integer;
  AParent_ID: Real;
  ACheckResetPalletReference: Boolean;
  AKeepPalletReference: Boolean;
  AResetDispoScan: Boolean;
  ARelievingInventoryUsingMixedPallet: Boolean;
begin
  // 01-06-2010 sometimes like during move we need to assign the master_label_list so it will make it to the translog_master_label but we don't want any updates to be performed
  // for code example see FAB_Alloc.pas, procedure TFrmFAB_Allocate.CreateFabLocationMoveFromSelected
  if SkipMasterLabelUpdate then
     EXIT;

  {support for serialized inventory}
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  AResetDispoScan:=   (not (self is TIQWebTransPackSlip))
                    or
                      ((self is TIQWebTransPackSlip) and (SelectValueAsString('select donot_reset_dispo_scan_on_ship from params', FDataBaseName) <> 'Y'));

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    if StrToFloatDef(Master_Label_List[ I ], 0) = 0 then
       Continue;

    CheckMasterLabelLocationIntegrity( FGMulti_ID, StrToFloat(Master_Label_List[ I ]));

    {May-9-2006 nullify loc_desc}
    ARelievingInventoryUsingMixedPallet:= (self is TIQWebTransPackSlip)
                                          and 
                                          (SelectFuncValueFmtAsString('rf.get_master_label_type( %s )', 
                                                                      [  Master_Label_List[I]], FDataBaseName ) = 'PALLET MIXED LOT');
    
    if not ARelievingInventoryUsingMixedPallet then
    begin
      ExecuteCommandFmt('update master_label set fgmulti_id = NULL, loc_desc = NULL where id = %s',
                [ Master_Label_List[ I ]], FDataBaseName);

      if AResetDispoScan then
         ExecuteCommandFmt('update master_label set dispo_scan = ''N'' where id = %s',
                   [ Master_Label_List[ I ]], FDataBaseName);
    end;

    {update children}
    // ExecuteCommandFmt('update master_label set fgmulti_id = NULL, loc_desc = NULL, dispo_scan = ''N'' where parent_id = %s',
    //           [ Master_Label_List[ I ]]);
    // 10-03-2011 note how we pass hardcoded backend procedure to be called for each master_label with a placeholder parameter --> rf.rf.reset_master_label_location( :1 )
    ExecuteCommandFmt('declare                                                                     '+
              '  v_master_label_id  number::= %s;                                          '+
              '  v_reset_dispo_scan varchar2(1)::= ''%s'';                                 '+
              'begin                                                                       '+
              '  rf.delete_cargo_params;                                                   '+
              '  rf.add_to_cargo_cparam( ''v_reset_dispo_scan'', v_reset_dispo_scan  );    '+
              '  rf.update_pallet_children_ex( v_master_label_id,                          '+
              '                                ''rf.reset_master_label_location( :1 )'' ); '+
              '  rf.delete_cargo_params;                                                   '+
              'end;                                                                        ',
              [ Master_Label_List[ I ],
                BoolToYN( AResetDispoScan )],
              FDataBaseName);

    {03-09-2009 sometimes during move we want to keep the parent_id pointing to the parent pallet like in case of hardallocating psticket releases on-fly}
    {12-14-2009 same as above for mixed pallet labels when converting to PS}
    AKeepPalletReference:= self.KeepMixedPalletReference and BelongsToMixedPallet( StrToFloat(Master_Label_List[ I ]))
                           or
                           self.KeepMixedPalletReference and BelongsToMixedLotPallet( StrToFloat(Master_Label_List[ I ]))
                           or
                           Assigned(self.owner) and (self.owner is TIQWebTransMove) and TIQWebTransMove(self.owner).KeepPalletReference
                           or
                           Assigned(self.owner) and TIQWebTranBase(self.owner).KeepPalletReference;

    if not AKeepPalletReference then
    begin
      {04-09-2007 if we broke a pallet}
      AParent_ID:= SelectValueFmtAsFloat('select parent_id from master_label where id = %s', [ Master_Label_List[ I ] ], FDataBaseName);
      if AParent_ID > 0 then
      begin
        ExecuteCommandFmt('update master_label set parent_id = null where id = %s', [ Master_Label_List[ I ] ], FDataBaseName);
        ExecuteCommandFmt( 'begin RF.update_pallet_label_qty( %f ); end;', [ AParent_ID ], FDataBaseName);
      end;
    end;

  end;
end;


procedure TIQWebTransOut.UpdateMasterLabelLocationInReverse;
var
  I: Integer;
  A: Variant;
  ALoc_Desc: string;
  AFGLotNo : string;
  AOnHandBefore: Real;
  AOnHandAfter : Real;
  AQtyToConsume: Real;
  AQty         : Real;
  AIsSerialized: Boolean;
  AInTransitOrigin: Real;
  AShipment_Dtl_ID_InTransit: Real;
begin
  if SkipMasterLabelUpdate then
     EXIT;

  {support for serialized inventory}
  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  A:= SelectValueArrayFmt( 'select v.loc_desc, v.lotno, v.onhand, a.is_linked_to_serial, v.in_transit_origin, v.shipment_dtl_id_in_transit from v_fgmulti_locations v, arinvt a where v.id = %f and v.arinvt_id = a.id', [ FGMulti_ID ], FDataBaseName);
  if VarArrayDimCount( A ) = 0 then
     EXIT;
  ALoc_Desc    := FixStr(A[ 0 ]);
  AFGLotNo     := FixStr(A[ 1 ]);
  AOnHandAfter := A[ 2 ];
  AIsSerialized:= A[ 3 ] = 'Y';
  AInTransitOrigin:= A[ 4 ];
  AShipment_Dtl_ID_InTransit:= A[ 5 ];

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    if StrToFloatDef(Master_Label_List[ I ], 0) = 0 then
       Continue;

    ExecuteCommandFmt('update master_label set loc_desc = ''%s'', fgmulti_id = %f, dispo_scan = ''Y'' where id = %s',
              [ ALoc_Desc,
                FGMulti_ID,
                Master_Label_List[ I ]], FDataBaseName);

    ExecuteCommandFmt('update master_label set fg_lotno = ''%s'' where id = %s', [ AFGLotNo, Master_Label_List[ I ]], FDataBaseName);

    if Day_Part_ID > 0 then
       ExecuteCommandFmt('update master_label set day_part_id = %f where id = %s', [ Day_Part_ID, Master_Label_List[ I ] ], FDataBaseName);

    ExecuteCommandFmt( 'begin RF.update_pallet_children( %s, %f ); end;', [ Master_Label_List[ I ], FGMulti_ID ], FDataBaseName);
  end;
end;


{  TIQWebTranOverhead }

constructor TIQWebTranOverhead.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type  := TRAN_TYPE_OH;
  FTrans_in_out:= TRAN_OUT;
  Cost_Element := 'Overhead';
end;


procedure TIQWebTranOverhead.AssignFields( DataSet:TDataSet );
begin
  inherited;
  DataSet.FieldByName('cost_element').asString:= Cost_Element;
  DataSet.FieldByName('fixed_overhead').asString:= Fixed_Overhead;
end;

{  TIQWebTranLabor }

constructor TIQWebTranLabor.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type  := TRAN_TYPE_LABOR;
  FTrans_in_out:= TRAN_OUT;
  Cost_Element := 'Labor';
end;


procedure TIQWebTranLabor.AssignFields( DataSet:TDataSet );
begin
  inherited;
  DataSet.FieldByName('cost_element').asString:= Cost_Element;
end;


{ TIQWebTransMove }

constructor TIQWebTransMove.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_MOVE_LOC;

  { Local Tran IN component }
  FTransIn:= TIQWebTransIn.Create( self );
  with FTransIn do
  begin
    Trans_Type          := TRAN_TYPE_MOVE_LOC;
    TransBatchAutoInc   := FALSE;
  end;

  { Local Tran OUT component }
  FTransOut:= TIQWebTransOut.Create( self );
  with FTransOut do
  begin
    Trans_Type:= TRAN_TYPE_MOVE_LOC;
    TransBatchAutoInc:= FALSE;
  end;
end;

destructor TIQWebTransMove.Destroy;
begin
  FTransIn.Free;
  FTransOut.Free;
  inherited;
end;

procedure TIQWebTransMove.CreateTransactionRecord;
begin
  MoveFrom_Act_Cost:= SelectValueFmtAsFloat('select act_cost from fgmulti where id = %f', [ MoveFrom_FGMulti_ID ], FDataBaseName);

  RemoveLeftInInvTransSameTransBatch;

  CheckNonConformStatusChangePopulateReason;

  with FTransOut do
  begin
    Trans_Batch         := self.Trans_Batch;
    FTrans_Code_ID      := self.FTrans_Code_ID;
    CheckForChangingSkid:= self.CheckForChangingSkid;
    TrackNo             := self.TrackNo;
    AllowMoveInTransit  := self.AllowMoveInTransit;
    Sub_Batch           := self.Sub_Batch;
    if Attribute = '' then
       Attribute:= self.Attribute;
    Trans_Date          := self.Trans_Date;
    Trans_Source        := self.Trans_Source;
    Trans_Source_ID     := self.Trans_Source_ID;
    AllowZeroQty        := self.AllowZeroQty;

    ValidateTransaction;
    CreateTransactionRecord;
  end;

  with FTransIn do
  begin
    Trans_Batch         := self.Trans_Batch;
    FTrans_Code_ID      := self.FTrans_Code_ID;
    CheckForChangingSkid:= self.CheckForChangingSkid;
    TrackNo             := self.TrackNo;
    AllowMoveInTransit  := self.AllowMoveInTransit;
    Sub_Batch           := self.Sub_Batch;
    if Attribute = '' then
       Attribute:= self.Attribute;
    Trans_Date          := self.Trans_Date;
    Trans_Source        := self.Trans_Source;
    Trans_Source_ID     := self.Trans_Source_ID;
    AllowZeroQty        := self.AllowZeroQty;

    ValidateTransaction;
    CreateTransactionRecord;
  end;

  // 12-08-2014 call to process (optional) associated children
  FTransOut.CreateAssociatedTransactionRecord;   // nothing for now - the list is empty
  FTransIn.CreateAssociatedTransactionRecord;    // may have landed cost for ICT Receiving
end;

procedure TIQWebTransMove.CheckNonConformStatusChangePopulateReason;
var
  ANonConformMoveType: Integer;
  ATrans_Source_ID   : Real;
begin
  ATrans_Source_ID:= 0;
//  ANonConformMoveType := Trans_Misc.GetConformStateChange( MoveFrom_FGMulti_ID, MoveTo_FGMulti_ID );
//  case ANonConformMoveType of
//    0: ; // no change
//    1: ATrans_Source_ID:= SelectValueByID('WF_DEVIATION_ITEM_ID', 'fgmulti', MoveTo_FGMulti_ID, FDataBaseName   );  {'Move To Non-Conform'}
//    2: ATrans_Source_ID:= SelectValueByID('WF_DEVIATION_ITEM_ID', 'fgmulti', MoveFrom_FGMulti_ID, FDataBaseName );  {'Move From Non-Conform'}
//  end;
//
//  if (ATrans_Source_ID > 0) and (FTrans_Source_ID = 0) then
//  begin
//    FTrans_Source   := 'WF_DEVIATION_ITEM';
//    FTrans_Source_ID:= ATrans_Source_ID;
//  end;

  if Trans_Reason <> '' then
     EXIT;

//  ANonConformMoveType:= Trans_Misc.GetConformStateChange( MoveFrom_FGMulti_ID, MoveTo_FGMulti_ID );
//  case ANonConformMoveType of
//    0: ; // no change
//    1: Trans_Reason:= IQMS.WebVcl.ResourceStrings.cTXT0000370; {'Move To Non-Conform'}
//    2: Trans_Reason:= IQMS.WebVcl.ResourceStrings.cTXT0000371; {'Move From Non-Conform'}
//  end;
end;

function TIQWebTransMove.GetMoveFrom_FGMulti_ID : Double;
begin
  Result:= FTransOut.FGMulti_ID;
end;

function TIQWebTransMove.GetMoveTo_Act_Cost: Extended;
begin
  Result:= FTransIn.Act_Cost;
end;

function TIQWebTransMove.GetMoveTo_FGMulti_ID : Double;
begin
  Result:= FTransIn.FGMulti_ID;
end;

function TIQWebTransMove.GetMoveFrom_Act_Cost : Extended;
begin
  Result:= FTransOut.Act_Cost;
end;

function TIQWebTransMove.GetMoveTo_Trans_Quan : Extended;
begin
  Result:= FTransIn.Trans_Quan;
end;

function TIQWebTransMove.GetMoveTo_Trans_RG_Quan : Extended;
begin
  Result:= FTransIn.Trans_RG_Quan;
end;

function TIQWebTransMove.GetMoveTo_Trans_Reason : string;
begin
  Result:= FTransIn.Trans_Reason;
end;

function TIQWebTransMove.GetMoveTo_Trans_Source : string;
begin
  Result:= FTransIn.Trans_Source;
end;

function TIQWebTransMove.GetMoveTo_Trans_Source_ID : Double;
begin
  Result:= FTransIn.Trans_Source_ID;
end;


procedure TIQWebTransMove.SetMoveFrom_FGMulti_ID( AValue : Double  );
begin
  FTransOut.FGMulti_ID:= AValue;
end;

procedure TIQWebTransMove.SetMoveTo_Act_Cost(const Value: Extended);
begin
  FTransIn.Act_Cost:= Value;
end;

procedure TIQWebTransMove.SetMoveTo_FGMulti_ID ( AValue : Double  );
begin
  FTransIn.FGMulti_ID:= AValue;
end;

procedure TIQWebTransMove.SetMoveFrom_Act_Cost ( AValue : Extended  );
begin
  FTransOut.Act_Cost:= AValue;

  if not IsMoveToActCostAssigned  and not (self.trans_type = TRAN_TYPE_INTERPLANT) then
     FTransIn.Act_Cost := AValue;
end;

procedure TIQWebTransMove.SetMoveTo_Trans_Quan ( AValue : Extended  );
begin
  FTransIn.Trans_Quan:= AValue;
  FTransOut.Trans_Quan:= AValue;
end;

procedure TIQWebTransMove.SetMoveTo_Trans_RG_Quan ( AValue : Extended  );
begin
  FTransIn.Trans_RG_Quan := AValue;
  FTransOut.Trans_RG_Quan:= AValue;
end;

procedure TIQWebTransMove.SetMoveTo_Trans_Reason( AValue : string);
begin
  FTransIn.Trans_Reason := AValue;
  FTransOut.Trans_Reason:= AValue;
end;

procedure TIQWebTransMove.SetMoveTo_Trans_Source( AValue : string);
begin
  FTrans_Source:= AValue;
  FTransIn.Trans_Source  := AValue;
  FTransOut.Trans_Source := AValue;
end;

procedure TIQWebTransMove.SetMoveTo_Trans_Source_ID( AValue : Double);
begin
  FTrans_Source_ID:= AValue;
  FTransIn.Trans_Source_ID  := AValue;
  FTransOut.Trans_Source_ID := AValue;
end;

procedure TIQWebTransMove.DoInternalAfterTranExecute;
var
  I: Integer;
  AParent_ID      : Real;
  ALoc_Desc_Pallet: string;
  ALoc_Desc_New   : string;
begin
  if TransErrCode > 0 then EXIT;

  FTransOut.UpdateMasterLabelLocation;
  FTransIn.UpdateMasterLabelLocation( TRUE );

  {support for serialized inventory}
  if  Assigned( FTransIn.Master_Label_List ) and ( FTransIn.Master_Label_List.Count > 0 ) then
  begin
    {disconnect from pallet if moved to another location}
    for I:= 0 to FTransIn.Master_Label_List.Count - 1 do
    begin
      AParent_ID:= SelectValueFmtAsFloat('select parent_id from master_label where id = %s', [ FTransIn.Master_Label_List[ I ]], FDataBaseName);
      // 12-14-2011 if we created new mixed pallet and reassign labels from another mixed pallet do not reset parent_id because it points to the new mixed pallet
      if (AParent_ID = 0) or KeepPalletReference then
         Continue;

      ALoc_Desc_Pallet:= SelectValueFmtAsString('select loc_desc from master_label where id = %f', [ AParent_ID ], FDataBaseName);
      ALoc_Desc_New   := SelectValueFmtAsString('select loc_desc from master_label where id = %s', [ FTransIn.Master_Label_List[ I ]], FDataBaseName);
      if ALoc_Desc_Pallet <> ALoc_Desc_New then
      begin
        ExecuteCommandFmt('update master_label set parent_id = NULL where id = %s', [ FTransIn.Master_Label_List[ I ]], FDataBaseName);
        // resinstated on Feb-28-06 - recalc pallet qty
        // commented out on Feb-14-06 - if fgmulti_id from pallet was NULL it was setting children to NULL - disassociating children from the pallet
        // ExecuteCommandFmt('begin RF.update_pallet_children( %f ); end;', [ AParent_ID ]);
        ExecuteCommandFmt('begin RF.update_master_label_qty ( %f ); end;', [ AParent_ID ], FDataBaseName);
      end;
    end;
  end;

  inherited;   {delete empty fgmulti locations}
end;


procedure TIQWebTransMove.ValidateTransaction;
var
  AFGMulti_ID: Real;
begin
  if EnforceUniqueDispoLocation then
  begin
     AFGMulti_ID:= FTransIn.FGMulti_ID;
     TIQWebTransMove.CheckEnforceUniqueDispoLocation( AFGMulti_ID, FTransOut.FGMulti_ID );
     FTransIn.FGMulti_ID:= AFGMulti_ID;
  end;

  // check for inventory going negative (allow when converting to PT to PS)
//  if not AllowGoingNegative then
//     TFrmNegativeOnHandTransException.DoShowModal( TransOut.FGMulti_ID, TransOut.Trans_Quan );  // inv_chk_negative_onhand.pas

  inherited;

  {Moving between hardallocated locations}
  CheckHardAllocatedMove;

  {Moving between hardallocated to MakeToOrder Sales Order}
  CheckMakeToOrderMove;
end;

class function TIQWebTransMove.CheckEnforceUniqueDispoLocation( var ATo_FGMulti_ID_Proposed: Real; AFrom_FGMulti_ID: Real = 0; DB:String = 'IQFD'): Boolean;
var
  ATo_FGMulti_ID_Final: Real;
begin
  Result:= FALSE;

  // 11-02-2011 if arinvt marked unique_dispo_loc on move and target fgmulti is marked as auto_dispo_default_loc then create a new fgmulti
  if SelectValueFmtAsFloat('select 1 from fgmulti f, arinvt a       '+
               ' where f.id = %f                        '+
               '   and f.arinvt_id = a.id               '+
               '   and a.unique_dispo_loc = ''Y''       '+
               '   and f.auto_dispo_default_loc = ''Y'' ',
               [ ATo_FGMulti_ID_Proposed ], DB) = 0 then
     EXIT;

  // Clone FgMulti
  ATo_FGMulti_ID_Final:= GetNextID('fgmulti');
  ExecuteCommandFmt('insert into fgmulti                                                             '+
            '     ( id, arinvt_id, loc_id, lotno, eplant_id, division_id, lot_date, in_date, '+
            '       make_to_order_detail_id )                                                '+
            'select %f, arinvt_id, loc_id, lotno, eplant_id, division_id, lot_date, in_date, '+
            '       make_to_order_detail_id                                                  '+
            '  from fgmulti where id = %f                                                    ',
            [ ATo_FGMulti_ID_Final, ATo_FGMulti_ID_Proposed ], DB);

  TIQWebTranBase.CheckAssignAutoDispo( ATo_FGMulti_ID_Proposed, ATo_FGMulti_ID_Final );

  if AFrom_FGMulti_ID > 0 then
     ExecuteCommandFmt('update fgmulti set in_date = (select in_date from fgmulti where id = %f) where id = %f',
               [ AFrom_FGMulti_ID, ATo_FGMulti_ID_Final ], DB);

  ATo_FGMulti_ID_Proposed:= ATo_FGMulti_ID_Final;

  Result:= TRUE;
end;

procedure TIQWebTransMove.CheckHardAllocatedMove;
var
  AAllocated_Workorder_ID1: Real;
  AAllocated_Workorder_ID2: Real;
begin
  if AllowHardAllocatedTrans then
     EXIT;

  AAllocated_Workorder_ID1:= SelectValueFmtAsFloat('select b.workorder_id from workorder_bom_mat_loc m, workorder_bom b where m.fgmulti_id = %f and m.workorder_bom_id = b.id', [ TransIn.FGMulti_ID  ], FDataBaseName);
  AAllocated_Workorder_ID2:= SelectValueFmtAsFloat('select b.workorder_id from workorder_bom_mat_loc m, workorder_bom b where m.fgmulti_id = %f and m.workorder_bom_id = b.id', [ TransOut.FGMulti_ID ], FDataBaseName);

//  IQAssert( AAllocated_Workorder_ID1 = AAllocated_Workorder_ID2, IQMS.WebVcl.ResourceStrings.cTXT0000339 {'Hard allocated inventory is only allowed to be moved between locations allocated to the same WO#'}) ;
end;


procedure TIQWebTransMove.CheckMakeToOrderMove;
var
  AMakeToOrder_ID1: Real;
  AMakeToOrder_ID2: Real;
begin
  if AllowMakeToOrderTrans then   {when deallocating from MTO to a regular location. See TranMain.pas}
     EXIT;

  AMakeToOrder_ID1:= SelectValueFmtAsFloat('select make_to_order_detail_id from fgmulti where id = %f', [ TransIn.FGMulti_ID ], FDataBaseName);
  AMakeToOrder_ID2:= SelectValueFmtAsFloat('select make_to_order_detail_id from fgmulti where id = %f', [ TransOut.FGMulti_ID ], FDataBaseName);
//  IQAssert( AMakeToOrder_ID1 = AMakeToOrder_ID2, IQMS.WebVcl.ResourceStrings.cTXT0000344 {'MakeToOrder hard allocated inventory is only allowed to be moved between locations allocated to the same SO#'});
end;


procedure TIQWebTransMove.CheckApplyCrossArinvtMove;
begin
  inherited;  // nothing

  if not SkipCheckCrossArinvtMove then
  begin
    FTransIn.CheckApplyCrossArinvtMove;
    FTransOut.CheckApplyCrossArinvtMove;
  end;
end;



{ TIQWebTransMoveVMI - Move to VMI Location}

constructor TIQWebTransMoveVMI.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_VMI_MOVE_LOC;

  with FTransIn do
    Trans_Type:= self.FTrans_Type;

  with FTransOut do
    Trans_Type:= self.FTrans_Type;
end;


{ TIQWebTransMoveCrossArinvt }

constructor TIQWebTransMoveCrossArinvt.Create(AComponent:TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_MOVE_LOC;

  with FTransIn do
    Trans_Type:= self.FTrans_Type;

  with FTransOut do
    Trans_Type:= self.FTrans_Type;
end;

procedure TIQWebTransMoveCrossArinvt.DoInternalAfterTranExecute;
var
  I: Integer;
  AArinvt_ID: Real;
begin
  {support for serialized inventory}
  if  Assigned( FTransIn.Master_Label_List ) and ( FTransIn.Master_Label_List.Count > 0 ) then
  begin
    AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', MoveTo_FGMulti_ID, FDataBaseName);
    // ensure during move master_label.arinvt_id gets changed to the arinvt_id pointed to by master_label.fgmulti_id
    for I:= 0 to FTransIn.Master_Label_List.Count - 1 do
    begin
      // AArinvt_ID:= SelectValueFmtAsFloat('select f.arinvt_id from fgmulti f, master_label m where m.id = %s and rf.get_master_label_fgmulti_id( m.id ) = f.id', [ FTransIn.Master_Label_List[ I ]]);
      EnforceTargetItemDataInMasterLabel( AArinvt_ID, StrToFloat(FTransIn.Master_Label_List[ I ]));
    end;
  end;

  inherited;   {delete empty fgmulti locations}
end;


class procedure TIQWebTransMoveCrossArinvt.EnforceTargetItemDataInMasterLabel( AArinvt_ID_Trg, AMaster_Label_ID: Real; DB:String = 'IQFD' );
begin
  if AArinvt_ID_Trg > 0 then
     ExecuteCommandFmt('update master_label    '+
               '   set arinvt_id = %f  '+
               ' where id = %f or parent_id = %f',
               [ AArinvt_ID_Trg,
                 AMaster_Label_ID,
                 AMaster_Label_ID ],
               DB)
end;


procedure TIQWebTransMoveCrossArinvt.CheckApplyUOMConversion;
var
  ASrc_Arinvt_ID: Real;
  ATrg_Arinvt_ID: Real;
  ASrc_UOM      : string;
  ATrg_UOM      : string;
  I             : Integer;
  AFactor       : Real;
  AParent_ID    : Real;
begin
  ASrc_Arinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', MoveFrom_Fgmulti_ID, FDataBaseName);
  ATrg_Arinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', MoveTo_Fgmulti_ID, FDataBaseName  );
  ASrc_UOM      := SelectValueByID('unit', 'arinvt', ASrc_Arinvt_ID, FDataBaseName );
  ATrg_UOM      := SelectValueByID('unit', 'arinvt', ATrg_Arinvt_ID, FDataBaseName );

//  AFactor:= IQUom.IQConvertUom( 1,                  // AQty
//                                ASrc_UOM,           // AFromUOM
//                                ATrg_UOM,           // AToUOM
//                                ATrg_Arinvt_ID,     // AArinvt_ID
//                                TRUE );             // AIgnoreError
  if AFactor = 1 then
     EXIT;

  TransIn.Trans_Quan:= TransIn.Trans_Quan * AFactor;

  if Assigned( FTransIn.Master_Label_List ) and ( FTransIn.Master_Label_List.Count > 0 ) then
    for I:= 0 to FTransIn.Master_Label_List.Count - 1 do
    begin
      // ExecuteCommandFmt('update master_label set qty = qty * %.6f where id = %s', [ AFactor, FTransIn.Master_Label_List[ I ]], FDataBaseName);
      ExecuteCommandFmt('begin                             '+
                '  rf.apply_uom_conversion(%s,     '+   // v_master_label_id
                '                          ''%s'', '+   // v_src_uom
                '                          ''%s'', '+   // v_trg_uom
                '                          %f );   '+   // v_arinvt_id
                'end;                              ',
                [ FTransIn.Master_Label_List[ I ],
                  ASrc_UOM,
                  ATrg_UOM,
                  ATrg_Arinvt_ID ],
                FDataBaseName);

      AParent_ID:= SelectValueFmtAsFloat('select parent_id from master_label where id = %s', [ FTransIn.Master_Label_List[ I ]], FDataBaseName);
      if AParent_ID > 0 then
         ExecuteCommandFmt('begin RF.update_master_label_qty ( %f ); end;', [ AParent_ID ], FDataBaseName);
    end;
end;


function TIQWebTransMoveCrossArinvt.CheckApplyCurrencyConversion( Value: Real ): Real;
var
  ASrc_EPlant_ID: Real;
  ATrg_EPlant_ID: Real;

  function _GetEPlant_ID( AFGMulti_ID: Real ): Real;
  begin
    Result:= SelectValueFmtAsFloat('select a.eplant_id from arinvt a, fgmulti f where f.id = %f and f.arinvt_id = a.id', [ AFGMulti_ID ],  FDataBaseName);
  end;

  function _GetFromEPlant_ID( AFGMulti_ID: Real ): Real;
  begin
    Result:= SelectValueFmtAsFloat('select s.eplant_id from shipments s, fgmulti f, shipment_dtl d ' +
            ' where f.id = %f and f.shipment_dtl_id_in_transit = d.id and d.shipments_id = s.id', [ AFGMulti_ID ],  FDataBaseName);

    if Result = 0 then
      Result:= SelectValueFmtAsFloat('select a.eplant_id from arinvt a, fgmulti f where f.id = %f and f.arinvt_id = a.id', [ AFGMulti_ID ],  FDataBaseName);
  end;


begin
  Result:= Value;

  ASrc_EPlant_ID:= _GetFromEPlant_ID( MoveFrom_Fgmulti_ID );
  ATrg_EPlant_ID:= _GetEPlant_ID( MoveTo_Fgmulti_ID );

  if (ASrc_EPlant_ID = 0) or (ATrg_EPlant_ID = 0) or (ASrc_EPlant_ID = ATrg_EPlant_ID) then
     EXIT;

   Result := Value * SelectValueFmtAsFloat('select gl.GetEplantToEplantSpotrate(%f, %f) from dual', [ASrc_EPlant_ID, ATrg_EPlant_ID]);


end;



{InterPlant Transfer}

constructor TIQWebTransMoveInterPlant.Create(AComponent:TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_INTERPLANT;

  with FTransIn do
    Trans_Type:= self.FTrans_Type;

  with FTransOut do
    Trans_Type:= self.FTrans_Type;
end;

class procedure TIQWebTransMoveInterPlant.EnforceTargetItemDataInMasterLabel( AArinvt_ID_Trg, AMaster_Label_ID: Real; DB:String = 'IQFD' );
begin
//  if AArinvt_ID_Trg > 0 then
//  begin
//    if Inv_Misc.GetKeepLabelBOMInfoInInterplantTrans( AArinvt_ID_Trg ) then
//      ExecuteCommandFmt('update master_label    '+
//                '   set arinvt_id = %f  '+
//                ' where id = %f or parent_id = %f',
//                [ AArinvt_ID_Trg,
//                  AMaster_Label_ID,
//                  AMaster_Label_ID ], DB)
//
//    else
//      ExecuteCommandFmt('update master_label                                                           '+
//                '   set (arinvt_id, standard_id, mfgno) = (select a.id, a.standard_id, s.mfgno '+
//                '                                            from arinvt a,                    '+
//                '                                                 standard s                   '+
//                '                                           where a.id = %f                    '+
//                '                                             and a.standard_id = s.id(+)),    '+
//                '       lm_labels_id = null                                                    '+
//                ' where id = %f or parent_id = %f',
//                [ AArinvt_ID_Trg,
//                  AMaster_Label_ID,
//                  AMaster_Label_ID ], DB);
//  end;
end;


procedure TIQWebTransMoveInterPlant.AssignActCost;
var
  ABaseItemArinvt_ID: Real;
  ADivision_ID: Real;
  ATollItemArinvt_ID: Real;
begin
  ABaseItemArinvt_ID:= FgMultiArinvt_ID( MoveTo_Fgmulti_ID );
  ADivision_ID      := SelectValueByID('division_id', 'fgmulti', MoveTo_Fgmulti_ID, FDataBaseName);
  ATollItemArinvt_ID:= SelectValueFmtAsFloat('select arinvt_id from toll_item where target_arinvt_id = %f and nvl(division_id,0) = %f',
                                 [ ABaseItemArinvt_ID,
                                   ADivision_ID ],
                                 FDataBaseName);
  if ATollItemArinvt_ID = 0 then
     EXIT;

  MoveTo_Act_Cost:= SelectValueFmtAsFloat('select std_cost from arinvt where id = %f', [ ATollItemArinvt_ID ], FDataBaseName);
  IsMoveToActCostAssigned:= TRUE;            // 12-08-2014 prevent IN act cost being overwritten by OUT act cost
  // TransIn.AppendAttribute('OVERWRITE_FGMULTI_ACT_COST');
end;


{InterPlant Transfer VMI}

constructor TIQWebTransMoveInterPlantVMI.Create(AComponent:TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_INTERPLANT_VMI;

  with FTransIn do
    Trans_Type:= self.FTrans_Type;

  with FTransOut do
    Trans_Type:= self.FTrans_Type;
end;



{ Packing Slip (OUT) Transaction }

constructor TIQWebTransPackSlip.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PACKSLIP;
end;

procedure TIQWebTransPackSlip.ValidateTransaction;
begin
  ValidateMakeToOrderOnMoveBetweenShipmentToFromInventory;
  inherited;
end;

{ Void Packing Slip (IN) Transaction }

procedure TIQWebTransPackSlipVoid.AssignFields(DataSet: TDataSet);
begin
//  if ps_share.UseShipDateInPackslipTransaction and (VoidShipment_Dtl_ID > 0) then
//     FTrans_Date:= SelectValueFmtAsFloat('select s.shipdate from shipments s, shipment_dtl d where d.id = %f and d.shipments_id = s.id', [ VoidShipment_Dtl_ID ], FDataBaseName);
  inherited;
end;

constructor TIQWebTransPackSlipVoid.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PACKSLIP_VOID;
  FPreserveDispoDate:= TRUE;
end;

procedure TIQWebTransPackSlipVoid.UpdateMasterLabelLocation( APreserveDispoDate: Boolean);
begin
  if SkipMasterLabelUpdate then
     EXIT;

  inherited;

  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) then
     EXIT;

  ExecuteCommandFmt('update master_label set shipment_releases_id = null where id in (%s)',
                    [ StringListToStr( Master_Label_List, ',')], FDataBaseName);
end;

procedure TIQWebTransPackSlipVoid.ValidateTransaction;
begin
  // note VoidShipment_Dtl_ID must be assigned to allow Make-To-Order verification
  ValidateMakeToOrderOnMoveBetweenShipmentToFromInventory( 'SHIPMENT_DTL', VoidShipment_Dtl_ID );
  inherited;
end;


{ TIQWebTransConform }

constructor TIQWebTransConform.Create( AComponent:TComponent; AID:Real );
begin
  inherited Create( AComponent );
  FTrans_Type   := TRAN_TYPE_CONFORM;
  FTrans_Quan   := 0;
  FTrans_RG_Quan:= 0;
  FGMulti_ID := AID;
  FTrans_Reason := IQMS.WebVcl.ResourceStrings.cTXT0000219; // 'Toggle to Conform'
  FTrans_Source := '';
  FTrans_Source_ID:= SelectValueByID('WF_DEVIATION_ITEM_ID', 'fgmulti', FGMulti_ID, FDataBaseName);
  if FTrans_Source_ID > 0 then
     FTrans_Source:= 'WF_DEVIATION_ITEM'
end;

function TIQWebTransConform.PostTransaction: Integer;
var
  ADB: TFDConnection;
  AWasInTrans: Boolean;
begin
  ADB:= FDManager.FindConnection( FDataBaseName ) as TFDConnection;
  AWasInTrans:= ADB.InTransaction;

  // start transaction and lock arinvt so we can update the non_conform_id
  if not AWasInTrans then
     ADB.StartTransaction;
  try
    if SelectValueFmtAsFloat(
      'SELECT non_conform_id FROM fgmulti WHERE id = %.0f',
      [FGMulti_ID]) <> 0 then
      UpdateNon_Conform( 0 ) // assign null to non_conform
    else
      // IQMS.WebVcl.ResourceStrings.cTXT0000512 =
      // 'Location has already been set to conforming.  Operation aborted.';
      raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000512);

    // Transaction!
    Result:= inherited PostTransaction;

    if not AWasInTrans then
      ADB.Commit;
  finally
    if ADB.InTransaction and not AWasInTrans then
       ADB.RollBack;
  end;
end;


{ TIQWebTransNonConform }

constructor TIQWebTransNonConform.Create( AComponent:TComponent; AID:Real; ANon_Conform_ID: Real = 0; ANon_Conform_Allocatable: string = '' );
begin
  inherited Create( AComponent );
  FTrans_Type   := TRAN_TYPE_CONFORM;
  FTrans_Quan   := 0;
  FTrans_RG_Quan:= 0;
  FGMulti_ID := AID;
  FTrans_Reason := IQMS.WebVcl.ResourceStrings.cTXT0000220; // 'Toggle to Non Conform'
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
  FNon_Conform_ID:= ANon_Conform_ID;
  FNon_Conform_Allocatable:= ANon_Conform_Allocatable;
end;

function TIQWebTransNonConform.PostTransaction: Integer;
var
  ADB: TFDConnection;
  AWasInTrans: Boolean;
begin
  // IQMS.WebVcl.ResourceStrings.cTXT0000510 =
  // 'Non-Conforming ID must be provided.  Operation aborted.'
//  IQAssert( FNon_Conform_ID > 0, IQMS.WebVcl.ResourceStrings.cTXT0000510);

  ADB:= FDManager.FindConnection( FDataBaseName ) as TFDConnection;
  AWasInTrans:= ADB.InTransaction;

  // start transaction and lock arinvt so we can update the non_conform_id
  if not AWasInTrans then
     ADB.StartTransaction;
  try
    if SelectValueFmtAsFloat(
      'SELECT non_conform_id FROM fgmulti WHERE id = %.0f',
      [FGMulti_ID]) = 0 then
      UpdateNon_Conform( FNon_Conform_ID, FNon_Conform_Allocatable )
    else if FIgnoreAlreadyMarkedNCError then
      {EIQ-11508 - allow new locations to prompt for MRB, NC reason}
      UpdateNon_Conform( FNon_Conform_ID, FNon_Conform_Allocatable )
    else
      // IQMS.WebVcl.ResourceStrings.cTXT0000511 =
      // 'Location has already been flagged as non-conforming.  Operation aborted.';
      raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000511);

    // Transaction!
    Result:= inherited PostTransaction;

    if not AWasInTrans then
      ADB.Commit;
  finally
    if ADB.InTransaction and not AWasInTrans then
       ADB.RollBack;
  end;
end;

{ RMA Void (OUT) Transaction }

constructor TIQWebTransRMAVoid.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_RMA_VOID;
end;

procedure TIQWebTransRMAVoid.UpdateMasterLabelLocation;
var
  I: Integer;
begin
  inherited;

  if not Assigned( Master_Label_List ) or ( Master_Label_List.Count = 0 ) or (Shipment_Dtl_ID = 0) then
     EXIT;

  for I:= 0 to Master_Label_List.Count - 1 do
  begin
    if StrToFloatDef(Master_Label_List[ I ], 0) = 0 then
       Continue;
    {when voiding RMA - restore shipment_dtl_id in master_label}
    ExecuteCommandFmt('update master_label set shipment_dtl_id = %f where id = %s or parent_id = %s',
              [ Shipment_Dtl_ID,
                Master_Label_List[ I ],
                Master_Label_List[ I ]], FDataBaseName);
  end;
end;


{ RMA (IN) Transaction }

constructor TIQWebTransRMA.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_RMA;
end;

procedure TIQWebTransRMA.ValidateTransaction;
var
  AMakeToOrder_ID1: Real;
begin
  (*  02-13-2013 unable to receive MTO RMA
  // note VoidShipment_Dtl_ID must be assigned to allow Make-To-Order verification
  ValidateMakeToOrderOnMoveBetweenShipmentToFromInventory( 'SHIPMENT_DTL', VoidShipment_Dtl_ID );
  *)

  // 02-13-2013 accept only non MTO fgmulti
  AMakeToOrder_ID1:= SelectValueFmtAsFloat('select make_to_order_detail_id from fgmulti where id = %f', [ FGMulti_ID ], FDataBaseName);
  if AMakeToOrder_ID1 > 0 then
     ValidateMakeToOrderOnMoveBetweenShipmentToFromInventory( 'SHIPMENT_DTL', VoidShipment_Dtl_ID );

  inherited;
end;


{ TIQWebTransVendRMAVoid }

constructor TIQWebTransVendRMAVoid.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_VEND_RMA_VOID;
end;

constructor TIQWebTransVendRMANonInvVoid.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_NON_INV_VEND_RMA_VOID;
end;


{ RMA (IN) Transaction }

constructor TIQWebTransVendRMA.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_VEND_RMA;
end;

constructor TIQWebTransVendRMANonInv.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_NON_INV_VEND_RMA;
end;


{ Phys. Inventory (IN) Transaction }

constructor TIQWebTransPhysInvIN.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PHYS_INV;
end;

function TIQWebTransPhysInvIN.PostTransaction: Integer;
begin
  Result:= inherited PostTransaction;
  ClearNeedCycleCount;
end;

procedure TIQWebTransPhysInvIN.UpdateMasterLabelLocation( APreserveDispoDate: Boolean = FALSE );
begin
  inherited;

  UpdateMasterLabelDuringPhysicalAdjustment( Trans_Quan );
end;


{ Phys. Inventory (OUT) Transaction }

constructor TIQWebTransPhysInvOUT.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PHYS_INV;
end;


function TIQWebTransPhysInvOUT.PostTransaction: Integer;
begin
  Result:= inherited PostTransaction;
  ClearNeedCycleCount;
end;

procedure TIQWebTransPhysInvOUT.UpdateMasterLabelLocation;
begin
  inherited;

  UpdateMasterLabelDuringPhysicalAdjustment( - Trans_Quan );
end;

{ PO Void (OUT) Transaction }

constructor TIQWebTransPOVoid.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PO_VOID;
end;

{ PO (IN) Transaction }

constructor TIQWebTransPO.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PO;
end;


{ TIQWebTransPONonInv }
constructor TIQWebTransPONonInv.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PO_NON_INV;
end;

constructor TIQWebTransPONonInvVoid.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PO_NON_INV_VOID;
end;


{ Dispo Transaction Base class }

constructor TIQWebTransDispoBase.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type  := TRAN_TYPE_DISPO;
  FTrans_Reason:= FTrans_Type;
  FTransObjects:= TList.Create;
  Trans_in_out := TRAN_IN;        {this is used in manual/backflush}
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;

end;

destructor TIQWebTransDispoBase.Destroy;
begin
  ClearTransObjectsList;
  TransObjects.Free;
  inherited;
end;

procedure TIQWebTransDispoBase.ClearTransObjectsList;
var
  I:Integer;
begin
  for I:= TransObjects.Count - 1 downto 0 do
      TIQWebTranBase( TransObjects[ I ] ).Free;
  TransObjects.Clear;
end;

procedure TIQWebTransDispoBase.CreateTransactionRecord;
var
  I:Integer;
begin
  RemoveLeftInInvTransSameTransBatch;

  for I:= 0 to TransObjects.Count - 1 do with TIQWebTranBase( TransObjects[ I ] ) do
  begin
    Trans_Batch:= self.Trans_Batch;
    OrderNo    := self.OrderNo;
    MfgNo      := self.MfgNo;
    RECEIPTNO  := self.RECEIPTNO;
    TrackNo    := self.TrackNo;
    Sub_Batch  := self.Sub_Batch;

     // Propagate shell object attribute down to transobjects only if is not assigned.
     // This allows assigning an attribute to a specific transobject before executing the trans
    if Attribute = '' then
       Attribute:= self.Attribute;

    if Trans_Note = '' then
       Trans_Note:= self.Trans_Note;

    if Receipt_Comment = '' then
       Receipt_Comment:= self.Receipt_Comment;

    if self.Force_EPlant_ID > 0 then
       FForce_EPlant_ID:= self.Force_EPlant_ID;

    if self.Ptoper_ID > 0 then
       Ptoper_ID:= self.Ptoper_ID;

    if self.Work_Center_ID > 0 then
       Work_Center_ID:= self.Work_Center_ID;

    ValidateTransaction;
    CreateTransactionRecord;
  end;
end;


procedure TIQWebTransDispoBase.PropogateOwnerDataTo( AChild: TIQWebInvTranBaseCustom );
begin
  with AChild do
  begin
    TransBatchAutoInc := FALSE;
    Trans_Reason      := self.FTrans_Reason;
    Trans_Source      := self.FTrans_Source;
    Trans_Source_ID   := self.FTrans_Source_ID;
    UserID            := self.UserID;
    AllowMoveInTransit:= self.AllowMoveInTransit;
    AllowVMIMove      := self.AllowVMIMove;

    Day_Part_ID:= self.Day_Part_ID;
    Fab_Lot_ID := self.Fab_Lot_ID;

    {if we couldn't associate workorder_id with the day_part_id - assign owner workorder_id}
    if WorkOrder_ID = 0 then
       WorkOrder_ID:= self.WorkOrder_ID;

    AllowZeroQty:= self.AllowZeroQty;
  end;
end;

procedure TIQWebTransDispoBase.AddInTran( AQty, ARgQty, AFGMulti_ID, AAct_Cost : Real; ATop_Phantom_Arinvt_ID: Real = 0; AMaster_Label_List: TStringList = nil );
begin
  TransObjects.Add( TIQWebTransIn.Create( self ));
  PropogateOwnerDataTo( TIQWebTransIn( TransObjects[ TransObjects.Count - 1 ]));
  with TIQWebTransIn( TransObjects[ TransObjects.Count - 1 ]) do
  begin
    Trans_Type           := self.FTrans_Type;
    FGMulti_ID           := AFGMulti_ID;
    Trans_Quan           := AQty;
    Trans_RG_Quan        := ARgQty;
    Act_Cost             := AAct_Cost;
    Top_Phantom_Arinvt_ID:= ATop_Phantom_Arinvt_ID;

    if Assigned(AMaster_Label_List) and (AMaster_Label_List.Count > 0) then
       CreateInternalMasterLabelListWithLabels( AMaster_Label_List );
  end;
end;

procedure TIQWebTransDispoBase.AddOutTran( AQty, ARgQty, AFGMulti_ID : Real; ATop_Phantom_Arinvt_ID: Real = 0; AMaster_Label_List: TStringList = nil );
begin
  TransObjects.Add( TIQWebTransOut.Create( self ));
  PropogateOwnerDataTo( TIQWebTransOut( TransObjects[ TransObjects.Count - 1 ]));
  with TIQWebTransOut( TransObjects[ TransObjects.Count - 1 ]) do
  begin
    Trans_Type           := self.FTrans_Type;
    FGMulti_ID           := AFGMulti_ID;
    Trans_Quan           := AQty;
    Trans_RG_Quan        := ARgQty;
    Top_Phantom_Arinvt_ID:= ATop_Phantom_Arinvt_ID;

    if Assigned(AMaster_Label_List) and (AMaster_Label_List.Count > 0) then
       CreateInternalMasterLabelListWithLabels( AMaster_Label_List );
  end;
end;

procedure TIQWebTransDispoBase.AddOverhead( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real; AFixed_Overhead: string = ''; AStoreInMatprod: Boolean = FALSE );
begin
  TransObjects.Add( TIQWebTranOverhead.Create( self ));
  PropogateOwnerDataTo( TIQWebTranOverhead( TransObjects[ TransObjects.Count - 1 ]));
  with TIQWebTranOverhead( TransObjects[ TransObjects.Count - 1 ]) do
  begin
    Trans_In_Out:= ATran_In_Out;          {overwrite what PropogateOwnerDataTo assigns above}
    Act_Cost    := AAct_Cost;
    Cost_Element:= ACost_Element;
    Act_Qty := AAct_Qty;
    Fixed_Overhead:= AFixed_Overhead;
  end;

  if AStoreInMatprod then
     StoreInMatprod( AAct_Cost, AAct_Qty, ACost_Element, IfThen(AFixed_Overhead = 'Y', 'OVERHEADF', 'OVERHEAD' ));
end;


procedure TIQWebTransDispoBase.AddLabor( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real );
begin
  AddLabor( AAct_Cost, ATran_In_Out, ACost_Element, AAct_Qty, FALSE {AStoreInMatprod} );
end;

procedure TIQWebTransDispoBase.AddLabor( AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real; AStoreInMatprod: Boolean );
begin
  TransObjects.Add( TIQWebTranLabor.Create( self ));
  PropogateOwnerDataTo( TIQWebTranLabor( TransObjects[ TransObjects.Count - 1 ]));
  with TIQWebTranLabor( TransObjects[ TransObjects.Count - 1 ]) do
  begin
    Trans_In_Out:= ATran_In_Out;          {overwrite what PropogateOwnerDataTo assigns above}
    Act_Cost    := AAct_Cost;
    Cost_Element:= ACost_Element;
    Act_Qty := AAct_Qty;
  end;

  if AStoreInMatprod then
     StoreInMatprod( AAct_Cost, AAct_Qty, ACost_Element, 'LABOR');
end;

procedure TIQWebTransDispoBase.AddFixedOverhead( AArinvt_ID, AQty: Real; AStoreInMatprod: Boolean = FALSE );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDataBaseName;
    SQL.Add(Format('select e.elem_descrip,                                       '+
                   '        NVL(a.std_cost,0) - NVL(r.std_cost,0) as std_cost    '+
                   '   from arinvt_elements a, arinvt_rollup r, elements e       '+
                   ' where a.arinvt_id = %.0f                                    '+
                   '   and a.arinvt_id = r.arinvt_id(+)                          '+
                   '   and a.elements_id = r.elements_id(+)                      '+
                   '   and a.elements_id = e.id                                  '+
                   '   and rtrim(e.elem_type) = ''OVERHEADF''                    '+
                   '   and abs(NVL(a.std_cost,0) - NVL(r.std_cost,0)) > 0.000001 ',
                   [ AArinvt_ID ]));
    Open;
    while not Eof do
    begin
      if FieldByName('std_cost').asFloat * AQty <> 0 then
         self.AddOverhead( FieldByName('std_cost').asFloat * AQty,  // cost
                           'OUT',                                   // tran_in_out,
                           FieldByName('elem_descrip').asString,
                           0,                                       // prod hrs
                           'Y',                                     // fixed_overhead flag
                           AStoreInMatprod );
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TIQWebTransDispoBase.AddAuxOverhead( AStandard_ID, AProdHrs: Real; AStoreInMatprod: Boolean = FALSE );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDataBaseName;
    SQL.Add(Format('select sum(m.how_many * a.aux_rate) as std_cost, '+
                   '       e.elem_descrip                            '+
                   '  from mfg_aux m,                                '+
                   '       aux a,                                    '+
                   '       elements e                                '+
                   ' where                                           '+
                   '       m.standard_id = %.0f                      '+
                   '   and m.aux_id = a.id                           '+
                   '   and a.elements_id = e.id                      '+
                   ' group by e.elem_descrip                         ',
                   [ AStandard_ID ]));
    Open;
    while not Eof do
    begin
      if FieldByName('std_cost').asFloat * AProdHrs <> 0 then
         self.AddOverhead( FieldByName('std_cost').asFloat * AProdHrs,  // cost
                           'OUT',                                       // tran_in_out,
                           FieldByName('elem_descrip').asString,
                           AProdHrs,                                    // prod hrs
                           'N',                                         // fixed_overhead flag
                           AStoreInMatprod );

      // have trans_note updated just in case
      with TIQWebTranOverhead( TransObjects[ TransObjects.Count - 1 ]) do
          Trans_Note:= 'AUX OVERHEAD';

      Next;
    end;
  finally
    Free;
  end;
end;


procedure TIQWebTransDispoBase.StoreInMatprod( AAct_Cost, AAct_Qty: Real; ACost_Element, AKind: string);
begin
  if Day_Part_ID = 0 then
     EXIT;

  if (AAct_Cost = 0) and (AAct_Qty = 0) then
     EXIT;

  ExecuteCommandFmt('insert into matprod                                         '+
            '     ( day_part_id, kind, act_cost, elem_descrip, prodhrs ) '+
            'values                                                      '+
            '     ( %f, ''%s'', %.6f, ''%s'', %.6f )                     ',
            [ Day_Part_ID,
              AKind,
              AAct_Cost,
              ACost_Element,
              AAct_Qty ], FDataBaseName);
end;


procedure TIQWebTransDispoBase.Execute;
begin
  try
     inherited;
  finally
     ClearTransObjectsList;
  end;
end;

function TIQWebTransDispoBase.PostTransaction:Integer;        { process transaction! }
begin
  Result:= inherited PostTransaction;
  if Result <> 0 then
     System.SysUtils.ABORT;
end;

procedure TIQWebTransDispoBase.DoInternalAfterTranExecute;
var
  I: Integer;
begin
  for I:= 0 to TransObjects.Count - 1 do
    if (TIQWebInvTranBase( TransObjects[ I ]) is TIQWebTransIn) and StrInList(self.Trans_Note, ['Reverse Disposition', 'Reverse Floor Disposition']) then
       TIQWebTransIn( TransObjects[ I ]).UpdateMasterLabelLocationInReverse

    else if (TIQWebInvTranBase( TransObjects[ I ]) is TIQWebTransIn) then
       TIQWebTransIn(TransObjects[ I ]).UpdateMasterLabelLocation

    else if (TIQWebInvTranBase( TransObjects[ I ]) is TIQWebTransOut) and StrInList(self.Trans_Note, ['Reverse Disposition', 'Reverse Floor Disposition'])  then
       TIQWebTransOut(TransObjects[ I ]).UpdateMasterLabelLocationInReverse

    else if (TIQWebInvTranBase( TransObjects[ I ]) is TIQWebTransOut) then
       TIQWebTransOut( TransObjects[ I ]).UpdateMasterLabelLocation;

  {05-11-2009 add record to translog_master_label}
  {12-12-2009 commented out since we add to translog_master_label in TIQWebInvTranBaseCustom.CheckAppendToInvtrans_Master_Label for every IN or OUT transaction}
  // if (TransErrCode = 0) and
  //    ((self is TIQWebTransFloorDispo)
  //       or
  //     (TransTypeSkin = ttsFloorDispo)) then
  //   for I:= 0 to TransObjects.Count - 1 do
  //     if TIQWebInvTranBase( TransObjects[ I ]) is TIQWebTransIn then
  //        TIQWebTransIn( TransObjects[ I ] ).CheckAppendTo_Translog_Master_Label();

  inherited;   {delete empty fgmulti locations}
end;


function TIQWebTransDispoBase.FindLotNo( const ATranIn_Out: string; var AFG_LotNo:string ): Boolean;
var
  I: Integer;
begin
  // 10/31/2014 If a lot number is specifically assigned, then pass that
  // value back to the variable, and don't bother searching.
  // Added for EIQ-4816 (Byron).
  if ForceParent_FGLotNo > '' then
    begin
      AFG_LotNo := ForceParent_FGLotNo;
      Exit(True);
    end;
  {Find first not empty ATranIN_OUT transaction in the list}
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
    if Trans_in_out = ATranIn_Out then
    begin
       AFG_LotNo:= Trim( SelectValueFmtAsString('select lotno from fgmulti where id = %f', [ FGMulti_ID ], FDataBaseName));
       if AFG_LotNo <> '' then
       begin
          Result:= TRUE;
          EXIT;
       end;
    end;
  Result:= FALSE;
end;

procedure TIQWebTransDispoBase.UpdateParent_Arinvt_ID( const ATranIn_Out: string; AParent_Arinvt_ID: Real );
var
  I: Integer;
begin
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
    if Trans_in_out = ATranIn_Out then
    begin
      if Parent_Arinvt_ID = 0 then              // 11-19-2014 switched to assigning parent_arinvt_id based on work_mat_req
         Parent_Arinvt_ID:= AParent_Arinvt_ID;  // in orde to accomodate phantom consumed (same) components belonging to different parents
    end;
end;

function TIQWebTransDispoBase.FindParent_Arinvt_ID( const ATranIn_Out: string; var AParent_Arinvt_ID: Real ): Boolean;
var
  I: Integer;
begin
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
    if (Trans_in_out = ATranIn_Out) and (FGMulti_ID <> 0) then
    begin
       AParent_Arinvt_ID:= SelectValueFmtAsFloat('select arinvt_id from fgmulti where id = %f', [ FGMulti_ID ], FDataBaseName);
       if AParent_Arinvt_ID <> 0 then
       begin
          Result:= TRUE;
          EXIT;
       end;
    end;
  Result:= FALSE;
end;

function TIQWebTransDispoBase.FindParent_Arinvt_ID_By_Batch( const ATranIn_Out: string; var AParent_Arinvt_ID: Real ): Boolean;
begin
  AParent_Arinvt_ID:= 0;
  if Trans_Batch > 0 then
     AParent_Arinvt_ID:= SelectValueFmtAsFloat('select arinvt_id from translog where batch = %f and RTrim(trans_in_out) = ''%s'' and rownum < 2', [ Trans_Batch, ATranIn_Out ], FDataBaseName);
  Result:= AParent_Arinvt_ID > 0;
end;

function TIQWebTransDispoBase.FindParent_Arinvt_ID_By_Day_Part_ID( const ATranIn_Out: string; var AParent_Arinvt_ID: Real ): Boolean;
begin
  AParent_Arinvt_ID:= 0;
  if Day_Part_ID > 0 then
     AParent_Arinvt_ID:= SelectValueFmtAsFloat('select partno.arinvt_id from day_part d, hist_illum_part h, partno           '+
                                   ' where d.hist_illum_part_id = h.id and h.partno_id = partno.id and d.id = %f ',
                                   [ Day_Part_ID ], FDataBaseName);
  Result:= AParent_Arinvt_ID > 0;
end;


procedure TIQWebTransDispoBase.UpdateFG_LotNo( const ATranIn_Out, AFG_LotNo: string );
var
  I: Integer;
begin
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
    if Trans_in_out = ATranIn_Out then
       FG_LotNo:= AFG_LotNo;
end;

procedure TIQWebTransDispoBase.SetWorkOrder_ID( AValue: Real );
var
  I: Integer;
begin
  FWorkOrder_ID:= AValue;
  {Propagate workorder_id to all the objects in the list}
  for I:= 0 to TransObjects.Count - 1 do with TIQWebTranBase( TransObjects[ I ] ) do
     FWorkOrder_ID:= self.FWorkOrder_ID;
end;

procedure TIQWebTransDispoBase.SetFab_Lot_ID(const Value: Real);
var
  I: Integer;
begin
  inherited;
  {Propagate workorder_id to all the objects in the list}
  for I:= 0 to TransObjects.Count - 1 do with TIQWebTranBase( TransObjects[ I ] ) do
     FFab_Lot_ID:= self.FFab_Lot_ID;
end;


procedure TIQWebTransDispoBase.PrepareTransaction;
var
  I                : Integer;
  AFG_LotNo        : string;
  AParent_Arinvt_ID: Real;
begin
  {Propagate trans_date to all the objects in the list}
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
     FTrans_Date:= self.FTrans_Date;

  {FG_Lot#}
  if FindLotNo( Trans_in_out, AFG_LotNo ) then   {for dispo the Trans_in_out always = IN}
     if Trans_in_out = TRAN_IN then
        UpdateFG_LotNo( TRAN_OUT, AFG_LotNo )
     else
        UpdateFG_LotNo( TRAN_IN, AFG_LotNo );

  // normally IsParent_Arinvt_Assigned is false. But when we process phantom in-out on-fly we assign parent_arinvt in TransDlg. Avoid reassigning it here.
  if not IsParent_Arinvt_Assigned then
  begin
    AParent_Arinvt_ID:= GetParent_Arinvt_ID();
    if AParent_Arinvt_ID > 0 then
       if Trans_in_out = TRAN_IN then
          UpdateParent_Arinvt_ID( TRAN_OUT, AParent_Arinvt_ID )
       else
          UpdateParent_Arinvt_ID( TRAN_IN, AParent_Arinvt_ID );
  end;
end;


function TIQWebTransDispoBase.GetParent_Arinvt_ID: Real;
begin
  {Get Parent Arinvt ID. There is no really any loop - just something to trick compiler in order to use BREAK stat}
  Result:= 0;
  repeat
     // 09-19-2008 if we do not have the IN side but still need parent_arinvt_id being assigned (shopdata component rejects)
     if ForceParent_Arinvt_ID > 0 then
     begin
        Result:= ForceParent_Arinvt_ID;
        BREAK;
     end;

     {Try finding parent_arinvt_id in current in/out objects}
     if FindParent_Arinvt_ID( Trans_in_out, Result ) then
        BREAK;

     {if item was floor dispositioned we process only OUT objects during prod rep - try day_part_id}
     if FindParent_Arinvt_ID_By_Day_Part_ID( Trans_in_out, Result ) then
        BREAK;

     {just in case if everything else failed try using batch }
     if FindParent_Arinvt_ID_By_Batch( Trans_in_out, Result ) then
        BREAK;
  until TRUE;
end;


function TIQWebTransDispoBase.TotalQty( const ATran_In_Out:string ):Real;
var
  I: Integer;
  A: Real;
begin
  A:= 0;
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
    if Trans_in_out = ATran_In_Out then
       A:= A + Trans_Quan;
  Result:= A;
end;

procedure TIQWebTransDispoBase.AddLandedCost( AArinvt_ID, AQty: Real; ATran_In_Out: string );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDataBaseName;
    SQL.Add(Format('select e.elem_descrip,                    '+
                   '       NVL(a.std_cost,0) as std_cost      '+
                   '   from arinvt_elements a, elements e     '+
                   ' where a.arinvt_id = %.0f                 '+
                   '   and a.elements_id = e.id               '+
                   '   and rtrim(e.elem_type) = ''LANDEDCOST''',
                   [ AArinvt_ID ]));
    Open;
    while not Eof do
    begin
      if FieldByName('std_cost').asFloat * AQty <> 0 then
      begin
        TransObjects.Add( TIQWebTransLandedCost.Create( self ));
        PropogateOwnerDataTo( TIQWebTransLandedCost( TransObjects[ TransObjects.Count - 1 ]));
        with TIQWebTransLandedCost( TransObjects[ TransObjects.Count - 1 ]) do
        begin
          Trans_In_Out:= ATran_In_Out;
          Act_Cost    := FieldByName('std_cost').asFloat * AQty;
          Cost_Element:= FieldByName('elem_descrip').asString;
        end;
      end;

      Next;
    end;
  finally
    Free;
  end;
end;


procedure TIQWebTransDispoBase.CheckApplyCrossArinvtMove;
var
  I: Integer;
begin
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
    if Trans_In_Out = 'IN' then
       TIQWebTransIn(TransObjects[ I ]).CheckApplyCrossArinvtMove
    else if Trans_In_Out = 'OUT' then
       TIQWebTransOut(TransObjects[ I ]).CheckApplyCrossArinvtMove
end;


{ TIQWebLaborOverhead }

procedure TIQWebLaborOverhead.AddOverhead( AAct_Cost: Real; const ATran_In_Out:string; AParentArinvtId:Real; AAct_Qty: Real);
var
  ACost_Element: string;
begin
  ACost_Element:= Trim( SelectValueFmtAsString('select e.elem_descrip from arinvt a, standard s, mfgtype m, elements e '+
                                     ' where a.id = %f and a.standard_id = s.id and rtrim(s.mfg_type) = rtrim(m.mfgtype) and m.elements_id_oh = e.id',
                                     [ AParentArinvtId ], FDataBaseName));
  if ACost_Element = '' then
     ACost_Element:= 'Overhead'; {stick in default}

  inherited AddOverhead( AAct_Cost, ATran_In_Out, ACost_Element, AAct_Qty);
  with TIQWebTranOverhead( TransObjects[ TransObjects.Count - 1 ]) do
    Parent_Arinvt_ID := AParentArinvtId;
end;

procedure TIQWebLaborOverhead.AddLabor( AAct_Cost: Real; const ATran_In_Out: string; AParentArinvtId:Real; AAct_Qty: Real);
var
  ACost_Element: string;
begin
  ACost_Element:= Trim( SelectValueFmtAsString('select e.elem_descrip from arinvt a, standard s, mfgtype m, elements e '+
                                     ' where a.id = %f and a.standard_id = s.id and rtrim(s.mfg_type) = rtrim(m.mfgtype) and m.elements_id = e.id',
                                     [ AParentArinvtId ], FDataBaseName));
  if ACost_Element = '' then
     ACost_Element:= 'Labor'; {stick in default}

  inherited AddLabor( AAct_Cost, ATran_In_Out, ACost_Element, AAct_Qty);
  with TIQWebTranLabor( TransObjects[ TransObjects.Count - 1 ]) do
    Parent_Arinvt_ID := AParentArinvtId;
end;

{ TIQWebTransDispo }

procedure TIQWebTransDispo.ValidateTransaction;
begin
  inherited;
  if Day_Part_ID = 0 then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000221 {'Day_Part ID is zero. Unable to Execute Transaction'} );
end;


{ TIQWebTransBackFlush  }

constructor TIQWebTransBackFlush.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_MANUAL_WITH_BF;
  FTrans_Reason:= '';
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
end;


procedure TIQWebTransBackFlush.PrepareTransaction;
var
  A: Variant;
  I: Integer;
begin
  inherited;
  {Propagate trans_code to all the objects in the list}
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
  begin
     FTrans_Code_ID:= self.FTrans_Code_ID;
     // Propagate shell object attribute down to transobjects only if is not assigned.
     // This allows assigning an attribute to a specific transobject before executing the trans
     if Attribute = '' then
        Attribute:= self.FAttribute;
  end;

  {Special case when we floordispo in RF but using backflush transaction}
  if TransTypeSkin = ttsFloorDispo then
     CheckRemoveLaborWhenPostedByTimeAttendance();
end;


procedure TIQWebTransBackFlush.CheckRemoveLaborWhenPostedByTimeAttendance;
var
  I: Integer;
begin
  if Standard_ID = 0 then
     EXIT;

  if SelectValueFmtAsString('select m.labor_posted_by_ta from mfgtype m, standard s where s.id = %f and s.mfg_type = m.mfgtype', [ Standard_ID ], FDataBaseName) <> 'Y' then
     EXIT;


  for I:= TransObjects.Count - 1 downto 0  do
    if TIQWebInvTranBase( TransObjects[ I ] ).ClassType = TIQWebTranLabor then
    begin
       TIQWebTranLabor ( TransObjects[ I ] ).Free;
       TransObjects.Delete(I);
    end;
end;


{ TIQWebTransFloorDispo }

constructor TIQWebTransFloorDispo.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type  := TRAN_TYPE_FLOOR_DISPO;
  FTrans_Reason:= '';
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
end;


procedure TIQWebTransFloorDispo.PrepareTransaction;
var
  I: Integer;
begin
  inherited;

  for I:= 0 to TransObjects.Count - 1 do
    if TIQWebInvTranBase( TransObjects[ I ]) is TIQWebTransIn then
       TIQWebTransIn( TransObjects[ I ] ).CheckDuplicateDispoScan;

  CheckRemoveLaborWhenPostedByTimeAttendance;

  AppendAttribute( 'FLOOR DISPO' );
end;



{ TIQWebTransAssoc  }

constructor TIQWebTransAssoc.Create( AComponent:TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_MANUAL_ASSOCIATED;
  FTrans_Reason:= '';
  FTransBatchAutoInc:= FALSE;
  Parent_ID:= 0;
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
end;

procedure TIQWebTransAssoc.ValidateTransaction;
begin
  if (Parent_ID = 0) and (FTrans_Batch = 0) then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000222 {'No associated transaction has been selected'} );
  if Parent_ID > 0 then
     FTrans_Batch:= SelectValueFmtAsFloat('select batch from translog where id = %f', [ Parent_ID ], FDataBaseName);
  inherited;
end;

procedure TIQWebTransAssoc.PrepareTransaction;
var
  A: Variant;
  I: Integer;
begin
  inherited;
  A:= SelectValueArrayFmt( 'select arinvt_id, lotno from translog where id = %f', [ Parent_ID ], FDataBaseName);
  if VarArrayDimCount( A ) > 0 then
     for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
     begin
       if self.Trans_in_out = Trans_in_out then  {Only associated main item gets parent_arinvt_id changed}
          Parent_Arinvt_ID:= A[ 0 ];
       if not( A[ 1 ] = NULL ) then
          FG_Lotno:= A[ 1 ];
     end;
end;


{ TIQWebTransVMIConsume }

constructor  TIQWebTransVMIConsume.Create( AComponent: TComponent );
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_VMI_CONSUME;
  VMI_TransMode:= vtmUnknown;
end;

procedure TIQWebTransVMIConsume.ValidateTransaction;
begin
  ValidateMakeToOrderOnMoveBetweenShipmentToFromInventory;
  inherited;
end;

procedure TIQWebTransVMIConsume.UpdateMasterLabelLocation;
begin
  case VMI_TransMode of
    vtmVoid:
       self.UpdateMasterLabelLocationInReverse;
    else
       inherited;
  end
end;

//{  TTransInvScrap }
//
//constructor TTransInvScrap.Create( AComponent:TComponent );
//begin
//  inherited Create( AComponent );
//  FTrans_Type  := TRAN_TYPE_INV_SCRAP;
//  FTrans_Reason:= '';
//end;
//
//procedure TTransInvScrap.ValidateTransaction;
//begin
//  if FTrans_Reason = '' then
//     raise Exception.Create('No Reject Code has been selected for this Inventory Scrap transaction');
//end;


{ TIQWebTransRepair }

constructor TIQWebTransRepair.Create(AComponent: TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_REPAIR;
  FTrans_Reason:= 'Repair';
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
end;

procedure TIQWebTransRepair.AddLabor(AAct_Cost: Real; const ATran_In_Out, ACost_Element: string; AAct_Qty: Real);
begin
  inherited;

  with TIQWebTranLabor( TransObjects[ TransObjects.Count - 1 ]) do
    Rma_detail_id:= self.rma_detail_id;
end;

procedure TIQWebTransRepair.AddOutTran( AQty, ARgQty, AFGMulti_ID : Real; ATop_Phantom_Arinvt_ID: Real = 0; AMaster_Label_List: TStringList = nil );
begin
  inherited;

  with TIQWebTransOut( TransObjects[ TransObjects.Count - 1 ]) do
    Rma_detail_id:= self.rma_detail_id;
end;


procedure TIQWebTransRepair.DoInternalAfterTranExecute;
begin
  if TransErrCode = 0 then  {no errors}
     ExecuteCommandFmt('begin                                                      '+
               '  update rma_detail set batch = %f where id = %f;          '+
               '  if SQL%%notfound then                                    '+
               '     update rma_detail_hist set batch = %f where id = %f;  '+
               '  end if;                                                  '+
               'end; ',
               [ Trans_Batch, Rma_Detail_ID, Trans_Batch, Rma_Detail_ID ], FDataBaseName);
  inherited;   {delete empty fgmulti locations}
end;

procedure TIQWebTransRepair.ValidateTransaction;
begin
  inherited;
  if Rma_Detail_ID = 0 then
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000223 {'RMA Detail ID is zero.  Unable to execute transaction.'} );
end;

procedure TIQWebTransRepair.SetRma_Detail_ID(Value: Real);
begin
  inherited;
  TransBatchAutoInc:= Trans_Batch = 0;
end;

{ TIQWebTransRepairFinished }

constructor TIQWebTransRepairFinished.Create(AComponent: TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type     := TRAN_TYPE_REPAIR_FINISHED;
  FTrans_in_out   := TRAN_IN;
  FTrans_Reason   :=  IQMS.WebVcl.ResourceStrings.cTXT0000224; // 'Repair Finished'
  FTrans_Source   := '';
  FTrans_Source_ID:= 0;
end;

procedure TIQWebTransRepairFinished.DoInternalAfterTranExecute;
begin
  if TransErrCode = 0 then  {no errors}
     ExecuteCommandFmt('begin                                                      '+
               '  update rma_detail set batch = %f where id = %f;          '+
               '  if SQL%%notfound then                                    '+
               '     update rma_detail_hist set batch = %f where id = %f;  '+
               '  end if;                                                  '+
               'end; ',
               [ Trans_Batch, Rma_Detail_ID, Trans_Batch, Rma_Detail_ID ], FDataBaseName);
  inherited;   {delete empty fgmulti locations}
end;

procedure TIQWebTransRepairFinished.SetRma_Detail_ID(Value: Real);
begin
  inherited;
  TransBatchAutoInc:= Trans_Batch = 0;
end;

procedure TIQWebTransRepairFinished.ValidateTransaction;
begin
  inherited;
  if Rma_Detail_ID = 0 then
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000223 {'RMA Detail ID is zero.  Unable to execute transaction.'});
end;


{ TVMI_Return }

constructor TIQWebTransVMI_Return.Create(AComponent: TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_VMI_RETURN;
  FTrans_Reason:= '';
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
end;

procedure TIQWebTransVMI_Return.ValidateTransaction;
begin

  inherited;
end;


{ TIQWebTransInTransitMove }

constructor TIQWebTransInTransitMove.Create(AComponent: TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_IN_TRANSIT_MOVE;       //  'MOVE IN-TRANSIT'
  FTrans_Reason:= '';
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
  FAllowMoveInTransit:= TRUE;
end;


procedure TIQWebTransInTransitMove.ValidateTransaction;
var
  I: Integer;
  AMake_To_Order_Detail_ID: Real;
  A1st_Make_To_Order_Detail_ID: Real;
begin
  if Trans_Source <> 'SHIPMENT_DTL' then
     EXIT;

  if not SkipMTOVerification then
  begin
     // based on Trans_Source_ID that is shipment_dtl_id find out if we need to validate the make_to_order_detail_id of fgmultis involved
     for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
       if FGMulti_ID > 0 then
       begin
         AMake_To_Order_Detail_ID:= SelectValueByID('make_to_order_detail_id', 'fgmulti', FGMulti_ID, FDataBaseName);
         if I = 0 then
            A1st_Make_To_Order_Detail_ID:= AMake_To_Order_Detail_ID;

//         IQAssert( AMake_To_Order_Detail_ID = A1st_Make_To_Order_Detail_ID, IQMS.WebVcl.ResourceStrings.cTXT0000345 ); {'MakeToOrder hard allocated inventory violation. Transaction aborted'}
       end;
  end;

  inherited;
end;


{ TIQWebTransRework }
constructor TIQWebTransRework.Create(AComponent: TComponent);
begin
  inherited;
  FTrans_Type:= TRAN_TYPE_REWORK;
  FTrans_Reason:= IQMS.WebVcl.ResourceStrings.cTXT0000348; // 'Rework';
  FTrans_Source:= '';
  FTrans_Source_ID:= 0;
end;


procedure TIQWebTransRework.AddLabor(AAct_Cost: Real; const ATran_In_Out,
  ACost_Element: string; AAct_Qty: Real);
begin
  inherited;

  with TIQWebTranLabor( TransObjects[ TransObjects.Count - 1 ]) do
    Rework_ID:= self.Rework_ID;
end;

procedure TIQWebTransRework.AddOutTran(AQty, ARgQty, AFGMulti_ID, ATop_Phantom_Arinvt_ID: Real; AMaster_Label_List: TStringList);
begin
  inherited;

  with TIQWebTransOut( TransObjects[ TransObjects.Count - 1 ]) do
    Rework_ID:= self.Rework_ID;
end;


procedure TIQWebTransRework.DoInternalAfterTranExecute;
begin
  if TransErrCode = 0 then  {no errors}
     ExecuteCommandFmt('update wf_deviation_item set batch = %f where id = %f', [ Trans_Batch, Rework_ID ], FDataBaseName);
  inherited;   {delete empty fgmulti locations}
end;

procedure TIQWebTransRework.SetRework_ID(Value: Real);
begin
  inherited;

  TransBatchAutoInc:= Trans_Batch = 0;
end;

procedure TIQWebTransRework.ValidateTransaction;
begin
  inherited;
  if Rework_ID = 0 then
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000347 {'Rework ID is zero.  Unable to execute transaction.'} );
end;

{ TIQWebTransReworkFinished }

constructor TIQWebTransReworkFinished.Create(AComponent: TComponent);
begin
  inherited;
  FTrans_Type     := TRAN_TYPE_REWORK_FINISHED;
  FTrans_in_out   := TRAN_IN;
  FTrans_Reason   := IQMS.WebVcl.ResourceStrings.cTXT0000349; //  'Rework Finished';
  FTrans_Source   := '';
  FTrans_Source_ID:= 0;
end;

procedure TIQWebTransReworkFinished.DoInternalAfterTranExecute;
begin
  if TransErrCode = 0 then  {no errors}
     ExecuteCommandFmt('update rma_detail set batch = %f where id = %f', [ Trans_Batch, FRework_ID ], FDataBaseName);
  inherited;   {delete empty fgmulti locations}
end;

procedure TIQWebTransReworkFinished.SetRework_ID(Value: Real);
begin
  inherited;
  TransBatchAutoInc:= Trans_Batch = 0;
end;

procedure TIQWebTransReworkFinished.ValidateTransaction;
begin
  inherited;
  if Rework_ID = 0 then
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000347 {'Rework ID is zero.  Unable to execute transaction.'} );
end;

{ TIQWebTransReturnInTransitToInventory }

constructor TIQWebTransReturnInTransitToInventory.Create(AComponent: TComponent);
begin
  inherited;
  FTrans_Type:= TRAN_TYPE_RETURN_IN_TRANSIT; // 'RETURN IN-TRANSIT';
  FTransIn.Trans_Type:= self.FTrans_Type;
  FTransOut.Trans_Type:= self.FTrans_Type;
end;



{ TIQWebTranAdjustWIP }

constructor TIQWebTranAdjustWIP.Create(AComponent: TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type  := TRAN_TYPE_ADJUST_WIP;
  FTrans_in_out:= TRAN_IN;
  FTrans_Reason:= IQMS.WebVcl.ResourceStrings.cTXT0000362; //  'Adjust Process WIP'; Normaly we adjust wip during Assy1 Mfg Part reject
end;


procedure TIQWebTranAdjustWIP.AssignFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('arinvt_id').asFloat:= Arinvt_ID;
end;


function BelongsToMixedPallet( AMaster_Label_ID: Real; ADB: string = 'IQFD'): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from master_label a, master_label b where a.id = %f and a.arinvt_id is not null and a.parent_id = b.id and b.arinvt_id is null', [ AMaster_Label_ID ], ADB) = 1;
end;

function BelongsToMixedLotPallet( AMaster_Label_ID: Real; ADB: string = 'IQFD'): Boolean;
begin
  Result:= SelectValueFmtAsString('select rf.get_parent_master_label_type( %f ) from dual', [ AMaster_Label_ID ], ADB) = 'PALLET MIXED LOT';
end;

function IsMixedLotPallet( AMaster_Label_ID: Real; ADB: string = 'IQFD'): Boolean;
begin
  Result:= SelectValueFmtAsString('select rf.get_master_label_type( %f ) from dual', [ AMaster_Label_ID ], ADB) = 'PALLET MIXED LOT';
end;

{ TIQWebTransPO_VMIConsume }

constructor TIQWebTransPO_VMIConsume.Create(AComponent: TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_PO_VMI_CONSUME;
end;

{ TIQWebTransMoveMulti }

constructor TIQWebTransMoveMulti.Create(AComponent: TComponent);
begin
  inherited Create( AComponent );
  FTrans_Type:= TRAN_TYPE_MOVE_LOC;
  FTransObjects   := TList.Create;
  FTransOutObjects:= TList.Create;
  FTransInObjects := TList.Create;
end;

destructor TIQWebTransMoveMulti.Destroy;
begin
  IQMS.Common.Controls.ClearListOfObjects( FTransObjects );
  TransObjects.Free;
  FTransOutObjects.Free;
  FTransInObjects.Free;
  inherited;
end;

procedure TIQWebTransMoveMulti.Execute;
begin
  try
     inherited;
  finally
     IQMS.Common.Controls.ClearListOfObjects( FTransObjects );
     FTransOutObjects.Clear;
     FTransInObjects.Clear;
  end;
end;

procedure TIQWebTransMoveMulti.PrepareTransaction;
var
  I: Integer;
begin
  {Propagate trans_date to all the objects in the list}
  for I:= 0 to TransObjects.Count - 1 do with TIQWebInvTranBase( TransObjects[ I ] ) do
     FTrans_Date:= self.FTrans_Date;
  inherited;
end;

procedure TIQWebTransMoveMulti.CreateTransactionRecord;
var
  I:Integer;
begin
  RemoveLeftInInvTransSameTransBatch;

  for I:= 0 to TransObjects.Count - 1 do with TIQWebTranBase( TransObjects[ I ] ) do
  begin
    Trans_Batch:= self.Trans_Batch;
    Sub_Batch  := self.Sub_Batch;

    if Trans_Note = '' then
       Trans_Note:= self.Trans_Note;

    ValidateTransaction;
    CreateTransactionRecord;
  end;
end;

procedure TIQWebTransMoveMulti.PropogateOwnerDataTo( AChild: TIQWebInvTranBaseCustom );
begin
  with AChild do
  begin
    TransBatchAutoInc := FALSE;
    Trans_Reason      := self.FTrans_Reason;
    Trans_Source      := self.FTrans_Source;
    Trans_Source_ID   := self.FTrans_Source_ID;
    UserID            := self.UserID;
    AllowMoveInTransit:= self.AllowMoveInTransit;
    AllowVMIMove      := self.AllowVMIMove;
    AllowZeroQty      := self.AllowZeroQty;
  end;
end;

function TIQWebTransMoveMulti.AddInTran( AQty, AFGMulti_ID: Real; AMaster_Label_List: TStringList = nil; AParentTransOut: TIQWebTransOut = nil): TIQWebTransIn;
begin
  Result:= TIQWebTransIn.Create( self );
  TransObjects.Add( Result );
  PropogateOwnerDataTo( Result );
  with Result do
  begin
    Trans_Type    := self.FTrans_Type;
    FGMulti_ID    := AFGMulti_ID;
    Trans_Quan    := AQty;
    Trans_RG_Quan := 0;
    FParentTrans  := AParentTransOut;

    if Assigned(AMaster_Label_List) and (AMaster_Label_List.Count > 0) then
       CreateInternalMasterLabelListWithLabels( AMaster_Label_List );
  end;

  // keep separate list of INs
  FTransInObjects.Add( Result );
end;

function TIQWebTransMoveMulti.AddOutTran( AQty, AFGMulti_ID: Real; AMaster_Label_List: TStringList = nil; AParentTransIn: TIQWebTransIn = nil ): TIQWebTransOut;
begin
  Result:= TIQWebTransOut.Create( self );
  TransObjects.Add( Result );
  PropogateOwnerDataTo( Result );
  with Result do
  begin
    Trans_Type    := self.FTrans_Type;
    FGMulti_ID    := AFGMulti_ID;
    Trans_Quan    := AQty;
    Trans_RG_Quan := 0;
    FParentTrans  := AParentTransIn;

    if Assigned(AMaster_Label_List) and (AMaster_Label_List.Count > 0) then
       CreateInternalMasterLabelListWithLabels( AMaster_Label_List );
  end;

  // kepp separate list of OUTs
  FTransOutObjects.Add( Result );
end;

procedure TIQWebTransMoveMulti.CheckHardAllocatedMove(AFgmulti_ID1, AFgmulti_ID2: Real);
var
  AAllocated_Workorder_ID1: Real;
  AAllocated_Workorder_ID2: Real;
begin
  if AllowHardAllocatedTrans then
     EXIT;

  AAllocated_Workorder_ID1:= SelectValueFmtAsFloat('select b.workorder_id from workorder_bom_mat_loc m, workorder_bom b where m.fgmulti_id = %f and m.workorder_bom_id = b.id', [ AFgmulti_ID1 ], FDataBaseName);
  AAllocated_Workorder_ID2:= SelectValueFmtAsFloat('select b.workorder_id from workorder_bom_mat_loc m, workorder_bom b where m.fgmulti_id = %f and m.workorder_bom_id = b.id', [ AFgmulti_ID2 ], FDataBaseName);

//  IQAssert( AAllocated_Workorder_ID1 = AAllocated_Workorder_ID2, IQMS.WebVcl.ResourceStrings.cTXT0000339 {'Hard allocated inventory is only allowed to be moved between locations allocated to the same WO#'}) ;
end;

procedure TIQWebTransMoveMulti.CheckMakeToOrderMove(AFgmulti_ID1, AFgmulti_ID2: Real);
var
  AMakeToOrder_ID1: Real;
  AMakeToOrder_ID2: Real;
begin
  if AllowMakeToOrderTrans then   {when deallocating from MTO to a regular location. See TranMain.pas}
     EXIT;

  AMakeToOrder_ID1:= SelectValueFmtAsFloat('select make_to_order_detail_id from fgmulti where id = %f', [ AFgmulti_ID1 ], FDataBaseName);
  AMakeToOrder_ID2:= SelectValueFmtAsFloat('select make_to_order_detail_id from fgmulti where id = %f', [ AFgmulti_ID2 ], FDataBaseName);
//  IQAssert( AMakeToOrder_ID1 = AMakeToOrder_ID2, IQMS.WebVcl.ResourceStrings.cTXT0000344 {'MakeToOrder hard allocated inventory is only allowed to be moved between locations allocated to the same SO#'});
end;

procedure TIQWebTransMoveMulti.ValidateTransaction;
var
  AFGMulti_ID_In : Real;
  AFGMulti_ID_Out: Real;
  I, J: Integer;
  ATransIn : TIQWebTransIn;
  ATransOut: TIQWebTransOut;
begin
  for I:= 0 to TransInObjects.Count - 1 do
    for J:= 0 to TransOutObjects.Count - 1 do
    begin
      // simplify
      ATransIn := TIQWebTransIn( TransInObjects[ I ]);
      ATransOut:= TIQWebTransOut( TransOutObjects[ J ]);

      // corresponding INs and OUTs
      if Assigned( ATransOut.ParentTrans ) then
         begin
           if not (ATransOut.ParentTrans = ATransIn) then Continue;
         end
      else if Assigned( ATransIn.ParentTrans ) then
         begin
           if not (ATransIn.ParentTrans = ATransOut) then Continue;
         end;

      AFGMulti_ID_In := ATransIn.FGMulti_ID;
      AFGMulti_ID_Out:= ATransOut.FGMulti_ID;

      // check EnforceUniqueDispoLocation
      if EnforceUniqueDispoLocation then
      begin
         TIQWebTransMove.CheckEnforceUniqueDispoLocation( AFGMulti_ID_In, AFGMulti_ID_Out );
         ATransIn.FGMulti_ID:= AFGMulti_ID_In;
      end;

      // check for inventory going negative (allow when converting to PT to PS)
//      if not AllowGoingNegative then
//         TFrmNegativeOnHandTransException.DoShowModal( AFGMulti_ID_Out, ATransOut.Trans_Quan );  // inv_chk_negative_onhand.pas

      {Moving between hardallocated locations}
      CheckHardAllocatedMove( AFGMulti_ID_In, AFGMulti_ID_Out );

      {Moving between hardallocated to MakeToOrder Sales Order}
      CheckMakeToOrderMove( AFGMulti_ID_In, AFGMulti_ID_Out );
    end;

  inherited;
end;

procedure TIQWebTransMoveMulti.DoInternalAfterTranExecute;
var
  I, J: Integer;
  AParent_ID      : Real;
  ALoc_Desc_Pallet: string;
  ALoc_Desc_New   : string;
  ATransIn : TIQWebTransIn;
  ATransOut: TIQWebTransOut;
begin
  if TransErrCode > 0 then EXIT;

  for I:= 0 to TransOutObjects.Count - 1 do
    TIQWebTransOut( TransOutObjects[ I ]).UpdateMasterLabelLocation;

  for I:= 0 to TransInObjects.Count - 1 do
    TIQWebTransIn( TransInObjects[ I ]).UpdateMasterLabelLocation( TRUE );

  {support for serialized inventory}
  for J:= 0 to TransInObjects.Count - 1 do
  begin
    ATransIn:= TIQWebTransIn( TransInObjects[ J ]);

    if  Assigned( ATransIn.Master_Label_List ) and ( ATransIn.Master_Label_List.Count > 0 ) then
    begin
      {disconnect from pallet if moved to another location}
      for I:= 0 to ATransIn.Master_Label_List.Count - 1 do
      begin
        AParent_ID:= SelectValueFmtAsFloat('select parent_id from master_label where id = %s', [ ATransIn.Master_Label_List[ I ]], FDataBaseName);
        // 12-14-2011 if we created new mixed pallet and reassign labels from another mixed pallet do not reset parent_id because it points to the new mixed pallet
        if (AParent_ID = 0) or KeepPalletReference then
           Continue;

        ALoc_Desc_Pallet:= SelectValueFmtAsString('select loc_desc from master_label where id = %f', [ AParent_ID ], FDataBaseName);
        ALoc_Desc_New   := SelectValueFmtAsString('select loc_desc from master_label where id = %s', [ ATransIn.Master_Label_List[ I ]], FDataBaseName);
        if ALoc_Desc_Pallet <> ALoc_Desc_New then
        begin
          ExecuteCommandFmt('update master_label set parent_id = NULL where id = %s', [ ATransIn.Master_Label_List[ I ]], FDataBaseName);
          ExecuteCommandFmt('begin RF.update_master_label_qty ( %f ); end;', [ AParent_ID ], FDataBaseName);
        end;
      end;
    end;
  end;

  inherited;   {delete empty fgmulti locations}
end;


{ TIQWebTransICA }

constructor TIQWebTransICA.Create(AComponent: TComponent);
begin
  inherited;
  FTrans_Type  := TRAN_TYPE_ICA;
  FTrans_Reason:= 'Inventory Cost Adjustment';
end;


{ TIQWebTransLandedCost }
constructor TIQWebTransLandedCost.Create(AComponent: TComponent);
begin
  inherited;
  FTrans_Type  := TRAN_TYPE_LANDED_COST;
  FTrans_in_out:= TRAN_OUT;
  FTrans_Reason:= 'Landed Cost';
end;


procedure TIQWebTransLandedCost.AssignFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('cost_element').asString:= Cost_Element;
end;


{ TCrossArinvtCargo - this is record!}

constructor TCrossArinvtCargo.Create(ASrcArinvt_ID: Real);
begin
  SrcArinvt_ID  := ASrcArinvt_ID;
  TrgArinvt_ID  := 0;
  TrgDivision_ID:= 0;
  Act_Cost      := 0;
end;


{ TMasterLabelInfoCargo }

constructor TMasterLabelInfoCargo.Create( AMaster_Label_ID: Real; ADB: string = 'IQFD' );
var
  A: Variant;
begin
  ID:= AMaster_Label_ID;
  Serial    := '';
  FGMulti_ID:= 0;

  A:= SelectValueArrayFmt('select serial, fgmulti_id from master_label where id = %f', [ AMaster_Label_ID ], ADB);
  if VarArrayDimCount( A ) =  0 then
     EXIT;

  Serial    := A[ 0 ];
  FGMulti_ID:= A[ 1 ];
end;

end.


