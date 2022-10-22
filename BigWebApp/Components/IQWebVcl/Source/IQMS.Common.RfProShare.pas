unit IQMS.Common.RfProShare;

interface
(*=======================================================
  Reminder: When adding new switches to IQRF/WMSIQ
            please also update the view V_RF_PROFILE.sql
 ========================================================*)
const

   PRO_MOVE         = 'MOVE';
   PRO_SEARCH       = 'SEARCH';
   PRO_DISPO        = 'DISPO';
   PRO_GENERIC      = 'GENERIC';
   PRO_LABELS       = 'LABELS';
   PRO_VMI          = 'VMI';
   PRO_PK_TKT       = 'PK_TKT';
   PRO_RECEIVE      = 'RECEIVE';
   PRO_PRINCIPLE    = 'PRINCIPLE';        {reserved by web}
   PRO_CENTRAL_CUST = 'CUST_CNTR';        {reserved by web}
   PRO_CENTRAL_VEND = 'VEND_CNTR';        {reserved by web}
   PRO_CENTRAL_PART = 'PART_CNTR';        {reserved by web}
   PRO_CRW_LABEL    = 'CRW_LABEL';
   PRO_TRANSACTIONS = 'TRANSACTION';
   PRO_RECEIVING    = 'RECEIVING';
   PRO_LM_LABEL     = 'LM_LABEL';
   PRO_EXT_CONTAINER= 'EXT_CONTAINER';
   PRO_USER_ZONES   = 'USER_ZONES';

   {Topics}
   PRO_QTY          = 'QTY';
   PRO_LOCATION     = 'LOCATION';
   PRO_CONFIRM      = 'CONFIRM';
   PRO_STRIP_ITEM   = 'STRIP_ITEM';
   PRO_USE_SN_LOC   = 'USE_SN_LOC';
   PRO_SOURCE_ID    = 'SOURCE_ID';
   PRO_PREVENT_DBL  = 'PREVENTDBL';
   PRO_DISPO_MODE   = 'DISPOMODE';
   PRO_BY_CARTON    = 'BY_CARTON';
   PRO_VERIFY_QTY   = 'VERIFY_QTY';
   PRO_PRINTER      = 'PRINTER';
   PRO_BUILD_PALLET = 'BUILDPALET';
   PRO_DISPO_PALLET = 'DISPOPALET';
   PRO_SCAN_MODE    = 'SCAN_MODE';
   PRO_PKLIST_SEQ   = 'PKLIST_SEQ';
   PRO_FILTER       = 'FILTER';           {reserved by web}
   PRO_CALLS        = 'CALLS';            {reserved by web}
   PRO_TASKS        = 'TASKS';            {reserved by web}
   PRO_MEETINGS     = 'MEETINGS';         {reserved by web}
   PRO_NOTES        = 'NOTES';            {reserved by web}
   PRO_SUPPORT      = 'SUPPORT';          {reserved by web}
   PRO_CONV_PS      = 'CONVERT_PS';
   PRO_ALLOW_NON_PROD_SCAN = 'OK_NP_SCN';
   PRO_TRANS_CODE   = 'TRANS_CODE';
   PRO_PRINT_OFF    = 'NO_PRINT';         {Do not Print Packslip on Convert}
   PRO_NON_CONF_CODE= 'NC_TR_CODE';       {prompt non-conf code}
   PRO_ITEM_LABEL   = 'ITEM-LABEL';       {what label assigned to the item}
   PRO_NO_PRINT_BOL = 'NO_PRN_BOL';       {Do not print BOL on Convert to Packslip}
   PRO_OVERSHIP     = 'OVERSHIP';         {allow to oveship}
   PRO_NEW_ON_TKT   = 'NEW_ON_TKT';       {new serial goes onto pk ticket}
   PRO_UNDERSHIP    = 'UNDERSHIP';        {allow to undership}
   PRO_PROMPT_SEQ   = 'PROMPT_SEQ';       {if same arinvt pk_ticket dtl lines - allow prompt - default Y}
   PRO_VERIFY_ORDER = 'VERIFY_ORD';       {verify sales order}
   PRO_PALLET_PREFIX= 'PLT_PREFIX';       {pallet prefix}
   PRO_PO_RECV_USE_LOT_PREFIX= 'RCVLOTPRFX';  {po receiving - use lot prefix}
   PRO_VERIFY_REPRINT = 'VERIFY_REP';     {verify reprint}
   PRO_SCAN_TO_MIXED= 'SCAN2MIXED';       {scan to mixed pallet}
   PRO_DISPO_PALLET_TO_PALLET = 'DISPOP2P'; {dispo pallet to pallet}
   PRO_DISPO_SERVER = 'DISPOSVR';         {use dispo server}
   PRO_WO_MUST_BE_SCHED = 'WOMUSTSCHD';
   PRO_NEW_PROD_REP_ON_CAV_CHANGE = 'PRODONCAV'; {create new prod rep entry on cav/multiplier change}
   PRO_USE_PICK_LOGIC = 'PICK_LOGIC';     {use pick logic}
   PRO_USE_PO_UOM     = 'USE_PO_UOM';     {Use PO UOM during receiving}
   PRO_BACKFLUSH_REJECTS = 'BKFLUSHREJ';  {backflush rejects}
   PRO_CHECK_DUP_SCAN = 'CHKDUPSCAN';
   PRO_PO_RECV_USE_LOT_DATE= 'RCVLOTDATE';  {po receiving - use lot date}
   PRO_ON_PRINT_DISPO_MFG_LABEL = 'PRNDSPMFGL'; {dispo mfg label on label print}
   PRO_MOVE_VERIFY_TRG_LOC = 'VERTRGLOC';   {on move by serial # suppress Y/N prompt "Create new location"}
   PRO_TRANS_BY_SERIAL  = 'TRANSERIAL';   {Transactions by Serial Y/N (as oppose by item)}
   PRO_ON_PRINT_DISPO_MAT_LABEL = 'PRNDSPMATL'; {dispo raw material label on label print}
   PRO_CHK_CROSS_DIV = 'CHKCROSDIV';        {check crossing divisions during inventory move}
   PRO_AUTO_EDI_856 = 'AUTOEDI856';
   PRO_PROMPT_MTO_WO = 'PRM_MTO_WO';      {prompt for MTO workorder}
   PRO_MENU_ACCESS = 'MENUACCESS';
   PRO_VERIFY_ITEM = 'VERIFY_ITM';        {pktkt by item - verify item}
   PRO_OVERRIDE_CR_HOLD = 'OVRDCRHOLD';    {override cr 05-19-2010 check // hold}
   PRO_RMA_RECV_BY_SERIAL = 'RMA_RCV_SR';  {RMA receiving by serial}
   PRO_VERIFY_INV_ID = 'VERIFY_INV'; {Verify Inventory Arinvt ID}
   PRO_HARD_ALLOC_ON_WO_MOVE = 'HA_WOMOVE';  {Hard Allocate materials on Direct Move or Batch Transfer WO}
   PRO_OVERRIDE_CR_LIMT = 'OVRDCRLIMT';     {override cr limit}
   PRO_VERIFY_SCANS = 'VERIFYSCAN'; {verify scans}
   PRO_NEW_IGNORE_PREFIX = 'IGNOREPFIX'; {ignore, do not validate label prefix on scan}
   PRO_RECV_ASN_BY_SHIP = 'RCVASNSHIP'; {recv ASN by Ship#, default N. N stands for by Serial}
   PRO_CONFIRM_DISPO = 'CONF_DISPO'; {confirm dispo}
   PRO_PROMPT_REALLOC_ON_WO_MOVE = 'PRMREALLOC';  {prompt reallocate hard allocated material on wo move}
   PRO_RMA_RECV_USE_LABEL_LOTNO =  'RMARCV_LOT'; {for serialized items only controls whether user can override labels lotno during rma receipt}
   PRO_REPACK_PRINT_ORIG = 'RPKPRNORIG'; {on repacking print original label w/o prompt}
   PRO_REPACK_PRINT_NEW = 'RPKPRNNEW';   {on repacking print new label w/o prompt}
   PRO_BATCH_TRANS_MULTI_ITEMS = 'BTCHTRMLTI';  {Batch Transfer SN multiple items}
   PRO_PROMPT_RELEASE_HARD_ALLOC_ON_WO_MOVE = PRO_PROMPT_REALLOC_ON_WO_MOVE;  {prompt reallocate hard allocated material on wo move}
   PRO_PALLET_MIXED_LOTS = 'PLTMIXLOTS'; {pallet mixed lots}
   PRO_FOREIGN_PROMPT_ITEM = 'FRGNPRMITM';  {prompt for item# for validation purposes during receipt of foreign label. default = Y}
   PRO_OVERRIDE_LOT_FIFO = 'OVRLOTFIFO'; {Override Lot# Based FIFO}
   PRO_VERIFY_SRC_LOC = 'VERSRCLOC';  {Verify Source Location during direct move by serial}
   PRO_CHANGE_QTY_ON_REPACK = 'CHGQTYRPCK';   {change qty on repack}
   PRO_UPDATE_ON_VERIFY_ORDER = 'UPDVRFYORD'; {update Y/N on verify sales order}
   PRO_DIRECTED_PUT_AWAY = 'DIRPUTAWAY'; {directed put away (receiving) }
   PRO_DIRECTED_PICK = 'DIRECTPICK'; {directed pick (pick ticket)}
   PRO_ALLOW_ITEM_SKIP = 'ALLWITMSKP';  {Sequential Pick Ticket Option without Reverting Back to Skipped Items}
   PRO_PHYS_REPRINT_ON_EDIT = 'PHSPRNEDIT'; {Reprint Label on Qty Edit during Physical Inventory}
   // PRO_SKIP_FA_SERIAL_VALIDATION = 'SKIPFA#VAL';
   PRO_SILENT_VERIFY_ORDER = 'SLNTVERIFY';  {EIQ-831 WMS User Profile -> Pick Ticket -> Verify Order (Silent)}
   PRO_OVERRIDE_NON_CONFORM_INSPECTION = 'OVRDNCINSP';  {EIQ-929 SER #4495 Receiving / Non-Conform Inventory Inspection}
   PRO_RECV_IN_BATCH = 'RECVBATCH'; {EIQ-304 SER# 04437 - Give an option to print Receiving Ticket after all line items of a PO are received}
   PRO_USE_LBL_LOT   = 'USELBLLOT'; { EIQ-1275 RF and WMSIQ - add new dispo profile that doesn't require scanned label lot # to match currently running lot # Mullinix 871806}
   PRO_PK_TKT_MATCH_ORD_DETAIL = 'TKTMTCHORD'; {match pickticket detail based on master_label ord_detail}
   PRO_DIRECTED_MOVE = 'DIRECTMOVE'; {directed move - i.e. directed put away during move}
   PRO_FA_SCAN_BY_NUM = 'FASCNBYNUM'; {Scan Fixed Asset by Number}
   PRO_DONOT_USE_LBL_WO = 'USELBLWO'; {EIQ-3678 IQRF / WMS User Profile -> Disposition -> Add new user profile "Do Not Require Label WO# to match Production Report}
   PRO_DIRECT_TASK_ORDER = 'DIRTASKORD'; {RE: EIQ-5252: Advanced WMS -> Interleave (Directed Task) order by }
   PRO_PROMPT_TRANS_REASON = 'TRNSREASON';  {EIQ-5935 IQRF / WMS -> Move -> add User Profile for "Transaction Reason}
   PRO_SILENT_REPRINT = 'SLNTRPRINT';  {If Verify Order is Silent then allow reprint without prompt}
   PRO_MOVE_TO_SHIP_LOC = 'MOVSHIPLOC'; {Move to Ship Designated Location. EIQ-6862 Use Ship Default Designator for Scanning to a Pick Ticket }
   PRO_NO_REPRINT_SILENT = 'NORPNTSLNT'; {EIQ-7223 - This option will not ask whether or not to reprint, and will NOT preprint the label. Note: ("Reprint Silent" has no prompt but DOES reprint the label).}
   PRO_DIRECTED_PK_TKT_SORT = 'DIRPKTKSRT'; {EIQ-8939 Phoenix Closures - Directed Pick is sorting by location - CRM# 1347942 }
   PRO_MOVE_INV_BY_SN = 'MOVINVBYSN'; {EIQ-9629 IQRF / WMS -> 4. Ship -> Ship Menu -> Move PT Inv add ability to scan individual SNs during Move.}
   PRO_DIRECTED_DISPO = 'DIRCTDISPO'; {EIQ-10397: SER# 08040 - Phoenix Closures - AWMS - Directed Disposition Rule}
   PRO_RTI_TRANS_CODE = 'RTITRANCOD'; {EIQ-11836: Phoenix Closures - Return to Inventory Transaction from F2 in IQRF}

   {Source}
   PRO_MANUFACTURED = 'MANUFACTURED';
   PRO_PURCHASED    = 'PURCHASED';
   PRO_PALLET       = 'PALLET';
   PRO_RF           = 'RF';

   {Sub Menus}
   //Pick Tickets
   PRO_PK_TKT_SUB   = 'PK_TKT_SUB';
   PRO_MOVE_SUB     = 'MOVE_SUB';
   //Move
   PRO_MOVE_SUB_CNFMLOC    = '1'; //To Conform Loc
   PRO_MOVE_SUB_NONCNFMLOC = '2'; //To Non Conform Loc

   {Menu option count}
   PRO_MOVE_MENU_COUNT = 11;
   PRO_DISPO_MENU_COUNT = 7;
   PRO_SHIP_MENU_COUNT = 5;
   PRO_TRANS_MENU_COUNT = 8;
   PRO_RECV_MENU_COUNT = 7;
   PRO_RECV_DIRECT_PUTAWAY_MENU_COUNT = 4;
   PRO_SHIP_DIRECT_PICK_MENU_COUNT = 6;
   {Sub Menu option count}
   PRO_PK_TKT_SUB_MENU_COUNT = 8;
   PRO_MOVE_SUB_MENU_COUNT = 2;

   {Sub Menu Numbers}
   //Pick Ticket Submenu
   PRO_PK_TKT_SUB_ADD = '1'; //Add Release
   PRO_PK_TKT_SUB_SUB = '2'; //Subtract Release
   PRO_PK_TKT_SUB_EDT = '3'; //Edit Ticket Line
   PRO_PK_TKT_SUB_CAP = '4'; //Cancel All Picks
   PRO_PK_TKT_SUB_MXD = '5'; //Mixed Label
   PRO_PK_TKT_SUB_PKS = '6'; //Pick Status
   PRO_PK_TKT_SUB_MOV = '7'; //Verify Scans
   PRO_PK_TKT_SUB_VFY = '8'; //Verify Scans
   PRO_PK_TKT_SUB_PLN = '9'; //Recalc Plan


   {EIQ WMS Profile Dataset Names - components in \\Profile\DM_Profile.pas}
   WMS_PRO_DATASET_MOVE = 'wwQryMove';           //Move
   WMS_PRO_DATASET_DISP = 'wwQryDispo';          //Dispo
   WMS_PRO_DATASET_GNRC = 'wwQryGeneric';        //Generic
   WMS_PRO_DATASET_LBLS = 'wwQryLabels';         //Labels
   WMS_PRO_DATASET_CVMI = 'wwQryVMI';            //Consume VMI
   WMS_PRO_DATASET_PKTK = 'wwQryPk_tkt';         //Pick Ticket
   WMS_PRO_DATASET_PKDT = 'wwQryPk_tktDetails';  //Pick Ticket Details
   WMS_PRO_DATASET_PRNT = 'wwQryPrinter';        //Printer
   WMS_PRO_DATASET_TRAN = 'wwQryTransactions';   //Transactions
   WMS_PRO_DATASET_RECV = 'wwQryReceiving';      //Receiving
   WMS_PRO_DATASET_MENU = 'wwQryMenuAccess';     //Menu Access
   WMS_PRO_DATASET_ZONE = 'wwQryUserZones';      //User Zones

   {EIQ WMS Profile Form Name}
   c_WMS_PROFILE_APP_ID = 'FRMPROFILE_MAIN';

function GetProSwitch( AModule, ATopic: string; ADefault: string = ''): string;
function ProfileGetLMPrinterAsAttribute: string;
function Profile_Get_AttachmentAsReal( const AModule, ATopic, ASource: string; ASource_ID: Real ): Real;
function Profile_Get_Attachment( const AModule, ATopic, ASource: string; ASource_ID: Real ): string;
function Profile_Get_Source_ID( const AModule, ATopic, ASource: string ): Real;
function To_Prompt( const AModule, ATopic: string ): Boolean;
function Is_True( const AModule, ATopic: string ): Boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  SysUtils,
  Classes,
  Windows;


function GetProSwitch( AModule, ATopic: string; ADefault: string = ''): string;
begin
  try
    Result:= SelectValueFmtAsString('select rf.get_pro_switch( ''%s'', ''%s'', ''%s'', ''%s'' ) from dual',
                         [ SecurityManager.UserName,
                           AModule,
                           ATopic,
                           ADefault ]);
  except
    // 12/16/2014 (Byron) Do not display an exception.  Instead, return
    // the default value.
    Result := ADefault;
  end;
end;

function ProfileGetLMPrinterAsAttribute: string;
begin
  Result:= SelectValueFmtAsString('select attribute from rf_profile '+
                        ' where userid = ''%s'' and module_name = ''%s'' and topic = ''%s''',
                        [ SecurityManager.UserName, PRO_LM_LABEL, PRO_PRINTER ]);
end;


function Profile_Get_AttachmentAsReal( const AModule, ATopic, ASource: string; ASource_ID: Real ): Real;
begin
  try
    Result:= StrToFloat( Profile_Get_Attachment( AModule, ATopic, ASource, ASource_ID ));
  except
    Result:= 0;
  end;
end;

function Profile_Get_Attachment( const AModule, ATopic, ASource: string; ASource_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select attribute from rf_profile               '+
                        ' where userid = ''%s''                         '+
                        '   and module_name = ''%s'' and topic = ''%s'' '+
                        '   and source = ''%s'' and source_id = %f',
                        [ SecurityManager.UserName, AModule, ATopic, ASource, ASource_ID ]);
end;

function Profile_Get_Source_ID( const AModule, ATopic, ASource: string ): Real;
var
  S: string;
begin
  Result:= SelectValueFmtAsFloat('select source_id from rf_profile where userid = ''%s'' and module_name = ''%s'' and topic = ''%s'' and source = ''%s''',
                     [ SecurityManager.UserName, AModule, ATopic, ASource ]);
end;

function To_Prompt( const AModule, ATopic: string ): Boolean;
var
  S: string;
begin
  S:= SelectValueFmtAsString('select to_prompt from rf_profile where userid = ''%s'' and module_name = ''%s'' and topic = ''%s''',
                   [ SecurityManager.UserName, AModule, ATopic ]);
  if (CompareText( AModule, PRO_GENERIC ) = 0) then
     Result:= (S = 'Y')
  else
     Result:= (S = '') or (S = 'Y');
end;

function Is_True( const AModule, ATopic: string ): Boolean;
begin
  Result:= To_Prompt( AModule, ATopic );
end;


end.
