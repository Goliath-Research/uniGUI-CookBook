unit pc_share;

interface

type
  TSelectedItemCargo = record
    Workorder_ID  : Real;
    Partno_ID     : Real;
//    Work_Center_ID: Real;
    Arinvt_ID     : Real;
    Standard_ID   : Real;
  end;

type
  TMasterLabelRec = record
    ID:Real;
    ItemClass:String;
    Itemno:String;
    Rev:String;
    ArinvtID:Real;
    ParentID:Real;
    FG_lotno:string;
    PS_Tckt_Dtl_ID:Real;
    Serial:String;
  end;

// TCOMProperties
type
  TCOMProperties = class
  private
    function GetRegPath: String;
    function GetBaud:Integer;
    function GetPort: Integer;
    function GetDTR: Boolean;
    function GetRTS: Boolean;

    procedure SetBaud(const Value: Integer);
    procedure SetPort(const Value: Integer);
    procedure SetDTR(const Value: Boolean);
    procedure SetRTS(const Value: Boolean);
    function GetDataBits: Integer;
    function GetParity: String;
    procedure SetDataBits(const Value: Integer);
    procedure SetParity(const Value: String);
    function NVL_DATABITS(Value: Integer): Integer;
    function NVL_DTR(Value: String): String;
    function NVL_PARITY(Value: String): String;
    function NVL_RTS(Value: String): String;
    function NVL_BAUD(Value: Integer): Integer;
  public
    property Port:Integer read GetPort write SetPort;
    property Baud:Integer read GetBaud write SetBaud;
    property Parity:String read GetParity write SetParity;
    property DataBits:Integer read GetDataBits write SetDataBits;
    property DTR:Boolean read GetDTR write SetDTR;
    property RTS:Boolean read GetRTS write SetRTS;
  end;


// TPCSettings

  TPCSettings = class
  private
    FPCID,
    FPCWorkCenterID: Real;
    FCOMProperties : TCOMProperties;
    FSelectedItem: TSelectedItemCargo;

    function GetPCID: Real;
    procedure SetPCID(const Value: Real);
    procedure SetWorkCenterID(const Value: Real);
    function GetWorkCenterID:Real;
    procedure ClearSelectedItemCargoRecord;
    function GetWorkCenter: String;
  public
    function GetSelectItem:Boolean;

    constructor Create;
    property PC_ID:Real read GetPCID write SetPCID;
    property FloorScale:TCOMProperties read FCOMProperties write FCOMProperties;
    property WorkCenterID:Real read GetWorkCenterID write SetWorkCenterID;
    property WorkCenter:String read GetWorkCenter;
    property SelectedItem:TSelectedItemCargo read FSelectedItem write FSelectedItem;
  end;

// Global

  function Settings : TPCSettings;

  procedure ReprintLabel( AMaster_Label_ID:Real; AIsPallet: Boolean; AShowPrinterDialog:Boolean = TRUE );
  procedure DbgLog( AMsg:String );
  procedure ShowErrAndLogEvent( AMsg:String );
  procedure LogEvent( AMsg:String );
  function GetSerialInfo(ASerialno:String; var AMasterLabelRec:TMasterLabelRec):Boolean;
  function IsSerialMatching(var AErrMsg: String; AMasterLabelRec: TMasterLabelRec; AArinvt_ID: Real; ALotno: String ):Boolean;


implementation

uses
  IQLib, System.SysUtils, Vcl.Forms, IQRgstry, Winapi.Windows, IQMS.Common.ResourceStrings,
  IQLMBom, IQMisc, System.Variants, IQMS.Common.Numbers, RF_Share, PanelMsg, pc_dm,
  IQMS.Common.CheckPoint, TouchScrn, iqstring, iqsecman, pc_rscstr;

const
    cPC_RowID = 'PC_RowID';
    cPC_WorkCenterID = 'PC_WorkCenterID';
    cDTR  = 'DTR';
    cRTS  = 'RTS';
    cPort = 'Port';
    cBaud = 'Baud';
    cDATABITS = 'DataBits';
    cParity = 'Parity';
    cFloorScale = 'FloorScale';

var
  varPC_Settings : TPCSettings;

function Settings:TPCSettings;
begin
  if not Assigned( varPC_Settings ) then
    varPC_Settings:= TPCSettings.Create;

  Result:= varPC_Settings;
end;


procedure SaveIntToCurrentUserRegistry( const APath, AKey:String; Value: Integer );
begin
  with TIQRegistry.Create do
  try
    RootKey:= HKEY_CURRENT_USER;
    if not OpenKey( APath, TRUE ) then
       // 'Unable to open or create the Registry Key, %s.'
       raise Exception.CreateFmt(IQMS.Common.ResourceStrings.cTXT0000172, [ APath ]);

    WriteInteger( AKey, Value );
  finally
    Free;
  end;
end;


function LoadIntFromCurrentUserRegistry( const APath, AKey: string; var AValue:Integer ):Boolean;
begin
  Result:= FALSE;
  with TIQRegistry.Create do
  try
    try
      RootKey:= HKEY_CURRENT_USER;
      if OpenKey( APath, FALSE ) and ValueExists( AKey ) then
      begin
        AValue:= ReadInteger( AKey );
        Result:= TRUE;
      end;
    except
      ; //suppress exception
    end;
  finally
    Free;
  end;
end;


function GetSerialInfo(ASerialno:String; var AMasterLabelRec:TMasterLabelRec):Boolean;
var
  A:Variant;
begin
  Result:= FALSE;

  A:= SelectValueArrayFmt( 'select id, parent_id, class, itemno, rev, arinvt_id, fg_lotno, ps_ticket_dtl_id, serial from master_label where serial = ''%s''', [ ASerialno ] );
  if VarArrayDimCount( A ) = 0 then
    EXIT;

  AMasterLabelRec.ID       := A[ 0 ];
  AMasterLabelRec.ParentID := A[ 1 ];
  AMasterLabelRec.ItemClass:= A[ 2 ];
  AMasterLabelRec.Itemno   := A[ 3 ];
  AMasterLabelRec.Rev      := A[ 4 ];
  AMasterLabelRec.ArinvtID := A[ 5 ];
  AMasterLabelRec.FG_lotno := A[ 6 ];
  AMasterLabelRec.PS_Tckt_Dtl_ID:= A[ 7 ];
  AMasterLabelRec.Serial   := A[ 8 ];

  Result   := TRUE;
end;


function IsSerialMatching(
 var AErrMsg        : String;
     AMasterLabelRec: TMasterLabelRec;
     AArinvt_ID     : Real;
     ALotno         : String ):Boolean;
begin
  Result:= FALSE;

  if AMasterLabelRec.ArinvtID <> AArinvt_ID then
  begin
    AErrMsg:= pc_rscstr.cTXT0000007; // 'Item # Mismatch!'
    EXIT;
  end;

  if AMasterLabelRec.PS_Tckt_Dtl_ID > 0 then
  begin
    AErrMsg:= pc_rscstr.cTXT0000008; // 'This Label is used by Pick Ticket System!'
    EXIT;
  end;

  if CompareStr( Trim(AMasterLabelRec.FG_lotno), Trim(ALotno) ) <> 0  then
  begin
    AErrMsg:= Format( pc_rscstr.cTXT0000009, // 'Serial #%s, Lot #%s, Does Not Match Lot #%s'
                      [ AMasterLabelRec.Serial, Trim(AMasterLabelRec.FG_lotno), Trim(ALotno) ]);
    EXIT;
  end;

  Result:= TRUE;
end;

procedure TPCSettings.ClearSelectedItemCargoRecord;
begin
  with FSelectedItem do
  begin
    Workorder_ID:= 0;
    Partno_ID:= 0;
    //Work_Center_ID:= 0;
    Arinvt_ID:= 0;
    Standard_ID:= 0;
  end;
end;


function GetSettingsRegPath(ASettingName:String):String;
begin
  Result:= Format( '\Software\IQMS\IQWin32\%s\Settings\%s\',
                   [ ExtractFileName(Application.ExeName), ASettingName ] );
end;

//  TPCSettings

constructor TPCSettings.Create;
begin
  FPCID:= 0;
  FPCWorkCenterID:= 0;
  ClearSelectedItemCargoRecord;
end;

procedure TPCSettings.SetPCID(const Value: Real);
begin
  // registry
  SaveIntToCurrentUserRegistry( Format( '\Software\IQMS\IQWin32\%s\Settings\',
                               [ ExtractFileName( Application.ExeName ) ]),
                                 cPC_RowID,
                                 trunc(Value) );
  FPCID:= Value;
end;

function TPCSettings.GetPCID: Real;
var
  AResult:Integer;
begin
  Result:= FPCID;
  if Result <> 0 then
    Exit;

  // get from registry
  if LoadIntFromCurrentUserRegistry( Format( '\Software\IQMS\IQWin32\%s\Settings\',
                                             [ ExtractFileName( Application.ExeName ) ] ),
                                     cPC_RowID,
                                     AResult )
  then
    Result:= AResult;

  if 1 = SelectValueFmtAsFloat( 'select 1 from PALLET_CONSTRUCTOR where id = %.0f', [ Result ] ) then
    EXIT;

  Result:= GetNextID( 'PALLET_CONSTRUCTOR' );
  ExecuteCommandFmt( 'insert into PALLET_CONSTRUCTOR(id) values (%.0f)', [ Result ] );
  FPCID := Result;
  SetPCID( Result );
end;

function TPCSettings.GetWorkCenterID: Real;
var
  AResult:Integer;
begin
  Result:= FPCWorkCenterID;
  if Result <> 0 then
    Exit;

  // get from registry
 if LoadIntFromCurrentUserRegistry( Format( '\Software\IQMS\IQWin32\%s\Settings\',
                                      [ ExtractFileName( Application.ExeName ) ] ),
                                    cPC_WorkCenterID,
                                    AResult ) then
  Result:= AResult;

  FPCWorkCenterID:= Result;
end;

procedure TPCSettings.SetWorkCenterID(const Value: Real);
begin
  // registry
  SaveIntToCurrentUserRegistry( Format( '\Software\IQMS\IQWin32\%s\Settings\',
                               [ ExtractFileName( Application.ExeName ) ]),
                                 cPC_WorkCenterID,
                                 trunc(Value) );
  FPCWorkCenterID:= Value;
end;

procedure DbgLog( AMsg:String );
begin
  TFrmCheckPointList.Add( AMsg, ExtractFileName( Application.ExeName ) + '_CheckPointList.txt' );
end;

procedure ShowErrAndLogEvent( AMsg:String );
begin
  LogEvent( AMsg );

  TouchScreen_Msg_Error( AMsg );
end;


procedure LogEvent( AMsg:String );
begin
  try
   ExecuteCommandFmt( 'Insert into EventLog( event_time, userid, text, class ) '+
              'values ( sysdate, ''%s'', ''%s'', ''%s'' )',
              [ FixStr(SecurityManager.UserName),
                ExtractFileName( Application.ExeName ),
                FixStr(AMsg) ] );
  except on E:Exception do
    // if we loose connection to db, then log to checkpoint list.
    DbgLog( Format( '%s [%s]', [ AMsg, E.Message ] ))
  end;
end;

function TPCSettings.GetWorkCenter: String;
begin
  Result:= SelectValueByID( 'EQNO', 'WORK_CENTER', WorkCenterID );
end;

function TPCSettings.GetSelectItem:Boolean;
var
  A : Variant;
begin
  ClearSelectedItemCargoRecord;

  // see if they were working on something
  with SelectedItem do
  begin
      A:= SelectValueArrayFmt( 'select a.id,                  '+
                          '       a.standard_id          '+
                          '  from pallet_constructor pc, '+
                          '       master_label m,        '+
                          '       arinvt a,              '+
                          '       standard s             '+
                          ' where pc.id = %.0f           '+
                          '   and pc.pallet_id = m.id    '+
                          '   and m.arinvt_id = a.id     '+
                          '   and a.standard_id = s.id(+)', [ Settings.PC_ID ] );

      Result:= VarArrayDimCount( A ) > 0;
      if Result then
      begin
        Arinvt_ID  := A[ 0 ];
        Standard_ID:= A[ 1 ];
        EXIT;
      end;


      // if work center is assigned, pull first item from currently running work order
      if Settings.WorkCenterID > 0 then
      begin
        A:= SelectValueArrayFmt( 'select pno.arinvt_id,                  '+
                            '       wo.standard_id,                 '+
                            '       wo.id,                          '+
                            '       pno.id                          '+
                            '  from cntr_sched cs,                  '+
                            '       work_center wc,                 '+
                            '       workorder wo,                   '+
                            '       standard s,                     '+
                            '       partno pno                      '+
                            ' where wc.parent_id is null            '+
                            '   and cs.cntr_seq = 1                 '+
                            '   and cs.work_center_id = wc.id       '+
                            '   and cs.workorder_id = wo.id         '+
                            '   and wo.standard_id = s.id           '+
                            '   and s.id = pno.standard_id          '+
                            '   and cs.work_center_id = %.0f'+
                            ' order by pno.mfg_seq', [ Settings.WorkCenterID ] );

        if VarArrayDimCount( A ) > 0 then
        begin
          Arinvt_ID     := A[ 0 ];
          Standard_ID   := A[ 1 ];
          Workorder_ID  := A[ 2 ];
          Partno_ID     := A[ 3 ];
        end;

        // let them do a setup
        Result:= TRUE;
        EXIT;
      end;


      with DM_PC.pkItem do
        if Execute then
        begin
          IQAssert( GetValue( 'PK_PTSPER' )     > 0, 'Items Per Package in Inventory, BOL Data Must be Greater than Zero!' );
          IQAssert( GetValue( 'PALLET_PTSPER' ) > 0, 'Items Per Pallet in Inventory, BOL Data Must be Greater than Zero!' );

          Arinvt_ID  := GetValue( 'ARINVT_ID'   );
          Standard_ID:= GetValue( 'STANDARD_ID' );
          Result:= TRUE;
        end;
  end;
end;


procedure ReprintLabel( AMaster_Label_ID:Real; AIsPallet: Boolean; AShowPrinterDialog:Boolean = TRUE );
var
  AArinvt_ID,
  AArcusto_ID,
  AStandard_ID,
  AQty,
  ALMLabels_ID : Real;

  AOrderNo,
  APono,
  ALotNo,
  AMfgNo,
  ALabelKind : string;

      //---- local procs
      procedure AssignVariables;
      var AMfgNo: string;
      begin
        if AStandard_ID = 0 then
          AStandard_ID:= SelectValueFmtAsFloat ( 'select id from standard where mfgno = ''%s''', [ AMfgNo ]);

        if (AArcusto_ID = 0) and (AOrderNo > '') then
          AArcusto_ID:= SelectValueFmtAsFloat( 'select arcusto_id from orders where orderno = ''%s''', [ AOrderNo ]);
      end;

      procedure FetchMasterLabelData;
      var
        A: Variant;
      begin
        A:= SelectValueArrayFmt('select qty, fg_lotno, arinvt_id, rtrim(mfgno), orderno, pono, standard_id, arcusto_id '+
                             'from master_label where id = %f', [ AMaster_Label_ID ] );

        // 'Unable to locate %s = %f'
        IQAssert( VarArrayDimCount( A ) <> 0, Format( pc_rscstr.cTXT0000010, [ 'Master Label ID', AMaster_Label_ID ] ) );

        AQty        := A[ 0 ];
        ALotNo      := A[ 1 ];
        AArinvt_ID   := A[ 2 ];
        AMfgNo      := A[ 3 ];
        AOrderNo    := A[ 4 ];
        APono       := A[ 5 ];
        AStandard_ID:= A[ 6 ];
        AArcusto_ID := A[ 7 ];
      end;
      //---- end local procs
begin
  PanelMesg:= hPleaseWait( pc_rscstr.cTXT0000011 ); // 'Printing Pallet Label...'
  try
    FetchMasterLabelData; // local procedure

    {Assign Standard_ID and Arcusto_ID}
    AssignVariables;  // local procedure

    ALabelKind:= sIIf(AIsPallet, 'PALLET', 'RF' );

    ALMLabels_ID:= GetLabelIDEx ( 'MANUFACTURED', ALabelKind, AArinvt_ID );

    IQAssert( ALMLabels_ID <> 0, pc_rscstr.cTXT0000012 ); // 'RF Default Label Not Found!'

    DoPrintLMBomMaterialExC( AArinvt_ID,   // IQLMBom.pas
                             ALMLabels_ID,
                             AStandard_ID,
                             AQty,
                             1, // # of labels
                             ALotNo,
                             AOrderNo,
                             APono,
                             AArcusto_ID,
                             AIsPallet,
                             0, {Cartons_Pallet N/A}
                             0, {Pieces_Carton  N/A}
                             AMaster_Label_ID,  // APrintExist_Master_Label_ID
                             FALSE );           // AShowPrinterDialog
  finally
    if Assigned( PanelMesg ) then
      FreeAndNil( PanelMesg );
  end;
end;

function TCOMProperties.GetRegPath:String;
begin
  Result:= GetSettingsRegPath( cFloorScale );
end;

function TCOMProperties.GetBaud: Integer;
begin
  Result:= 0;

  LoadIntFromCurrentUserRegistry( GetRegPath, cBaud, Result );

  Result:= NVL_BAUD( Result );
end;

function TCOMProperties.GetPort: Integer;
begin
  Result:= 0;

  LoadIntFromCurrentUserRegistry( GetRegPath, cPort, Result );
end;

function TCOMProperties.NVL_DTR(Value:String):String;
begin
  Result:= Value;
  if Result = '' then
    Result:= 'Y';
end;

function TCOMProperties.NVL_RTS(Value:String):String;
begin
  Result:= Value;
  if Result = '' then
    Result:= 'Y';
end;

function TCOMProperties.NVL_PARITY(Value:String):String;
begin
  Result:= Value;
  if Result = '' then
    Result:= 'Even';
end;

function TCOMProperties.NVL_DATABITS(Value:Integer):Integer;
begin
  Result:= Value;
  if not (Result in [ 7, 8 ]) then
    Result:= 7;
end;

function TCOMProperties.NVL_BAUD(Value:Integer):Integer;
begin
  Result:= Value;
  if Result = 0 then
    Result:= 9600;
end;

function TCOMProperties.GetDTR: Boolean;
var
  S:String;
begin
      // registry    LoadStrFromLocalMachineRegistry
  S:= LoadStrFromCurrentUserRegistry( GetRegPath, cDTR );

  Result:= 'Y' = NVL_DTR( S );
end;

function TCOMProperties.GetRTS: Boolean;
var
  S:String;
begin
      // registry LoadStrFromLocalMachineRegistry
  S:= LoadStrFromCurrentUserRegistry( GetRegPath, cRTS );

  Result:= 'Y' = NVL_RTS( S );
end;

procedure TCOMProperties.SetPort(const Value: Integer);
begin
  SaveIntToCurrentUserRegistry( GetRegPath, cPort, Value );
end;

procedure TCOMProperties.SetBaud(const Value: Integer);
begin
  SaveIntToCurrentUserRegistry( GetRegPath, cBaud, Value );
end;

procedure TCOMProperties.SetDTR(const Value: Boolean);
begin
  SaveStrToCurrentUserRegistry( GetRegPath, cDTR, sIIf(Value,'Y','N') );
end;

procedure TCOMProperties.SetRTS(const Value: Boolean);
begin
  SaveStrToCurrentUserRegistry( GetRegPath, cRTS, sIIf(Value,'Y','N') );
end;

function TCOMProperties.GetDataBits: Integer;
begin
  Result:= 0;

  LoadIntFromCurrentUserRegistry( GetRegPath, cDATABITS, Result );

  Result:= NVL_DATABITS( Result );
end;

function TCOMProperties.GetParity: String;
begin
           // registry     LoadStrFromLocalMachineRegistry
  Result:= LoadStrFromCurrentUserRegistry( GetRegPath, cPARITY );

  Result:= NVL_PARITY( Result );
end;

procedure TCOMProperties.SetDataBits(const Value: Integer);
begin
  SaveIntToCurrentUserRegistry( GetRegPath, cDATABITS, Value );
end;

procedure TCOMProperties.SetParity(const Value: String);
begin
  SaveStrToCurrentUserRegistry( GetRegPath, cPARITY, Value );
end;


end.
