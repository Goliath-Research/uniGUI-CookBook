unit IQMS.WebVcl.Jump;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBCtrls, IQMS.Common.JumpConstants, IQMS.Common.JumpDispatcher,
  TypInfo;


type
  { TIQWebJump }
  TIQWebJump = class(TComponent)
  private
    { Private declarations }
    FDataLink: TFieldDataLink;
    FJumpTo  : TJumpTo;

    function  GetDataField:string;
    procedure SetDataField(AValue:string);
    function  GetDataSource : TDataSource;
    procedure SetDataSource(AValue:TDataSource);

  protected
    { Protected declarations }

  public
    { Public declarations }
    constructor Create( AOwner:TComponent ); override;
    destructor Destroy; override;
    procedure Execute; virtual;
    class function GetJumpDescription( AJumpTo: TJumpTo  ): string;
  published
    { Published declarations }
    property DataField:string        read GetDataField  write SetDataField;
    property DataSource:TDataSource  read GetDataSource write SetDataSource;
    property JumpTo : TJumpTo read FJumpTo write FJumpTo;
  end;

procedure JumpDirect( AMessageID, AID: Integer; AUsePostMessage: Boolean = TRUE );

/// <summary> Determine if a jump target record exists. Raise a standard, system
/// exception if the target is not found. EPlant filtering will be checked,
/// if the filter is enabled.
/// </summary>
/// <param name="ATableName">The Oracle table name of the target jump record.
/// </param>
/// <param name="ATableID">The ID field value of the target jump record.
/// </param>
/// <param name="AIncludeNullEplant">Set to True to include NULL EPlant records,
/// if an EPlant filter is applied.
/// </param>
/// <param name="ARaiseException">Set to True to raise the standard
/// exception if not found.  Otherwise, the function returns False if not found.
/// </param>
/// <remarks>Tablename and ID must be provided, or the function returns
/// False without raising an error. </remarks>
/// <returns>True if the jump target was found; False if the jump target was
/// not found.
/// </returns>
function CheckJumpTargetExists(const ATableName: string; const ATableID: Real;
  const AIncludeNullEplant: Boolean = False;
  const ARaiseException: Boolean = True): Boolean;

implementation

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.WebVcl.ResourceStrings;

{$REGION 'Global methods'}

procedure JumpDirect( AMessageID, AID: Integer; AUsePostMessage: Boolean = TRUE );
begin
  if AID <> 0 then
    TIQWebJumpDispatcher.Jump(AMessageID, AID)
  // Don't display this message unless we are actually jumping
  else if (AMessageID <> IQMS.Common.JumpConstants.iq_NotifySetForegroundWindow) then
     IQConfirm( IQMS.WebVcl.ResourceStrings.cTXT0000103 {'Jump information is unavailable'} );
end;

function CheckJumpTargetExists(const ATableName: string; const ATableID: Real;
  const AIncludeNullEplant, ARaiseException: Boolean): Boolean;
var
  AHasEplantID: Boolean;
begin
  // Initialization
  Result := False;

  // If values are provided, check record existence
  if (ATableName > '') and (ATableID > 0) then
    begin
      // Check EPlant also?
      if (SecurityManager.EPlant_ID_AsFloat > 0) and
        TableFieldExists(ATableName, 'EPLANT_ID') then
        begin
          if AIncludeNullEplant then
            Result := SelectValueFmtAsInteger(
              'SELECT 1 FROM %s WHERE id = %.0f AND ' +
              'misc.eplant_filter_include_nulls(eplant_id) = 1',
              [ATableName, ATableID]) > 0
          else
            Result := SelectValueFmtAsInteger(
              'SELECT 1 FROM %s WHERE id = %.0f AND ' +
              'misc.eplant_filter(eplant_id) = 1',
              [ATableName, ATableID]) > 0;
        end
      else if TableExists(ATableName) then
        // Default check
        Result := SelectValueFmtAsInteger(
          'SELECT 1 FROM %s WHERE id = %.0f',
          [ATableName, ATableID]) > 0
      else
        // This should never happen except through programmer error.
        // Do not translate this message.
        raise Exception.CreateFmt(
          'Application Error:  Table, %s, does not exist.',
         [ATableName]);
    end
  else
    // If values are not provided, exit now without raising an error
    Exit(False);

  // If not found and raising exception, show standard error.
  if not Result and ARaiseException then
    begin
      if SecurityManager.EPlant_ID_AsFloat > 0 then
        // IQMS.WebVcl.ResourceStrings.cTXT0000508 = 'Cannot locate selected record.  Please check EPlant filter.';
        raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000508)
      else
        // IQMS.WebVcl.ResourceStrings.cTXT0000507 = 'Cannot locate selected record.';
        raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000507);
    end;
end;

{$ENDREGION 'Global methods'}

{$REGION 'TIQWebJump'}

constructor TIQWebJump.Create( AOwner:TComponent );
begin
  inherited Create( AOwner );
  FDataLink:= TFieldDataLink.Create;
  FJumpTo  := TJumpTo( 0 );
end;

destructor TIQWebJump.Destroy;
begin
  FDataLink.OnDataChange:= NIL;
  FDataLink.Free;
  inherited Destroy;
end;

class function TIQWebJump.GetJumpDescription( AJumpTo: TJumpTo  ): string;
begin
  case AJumpTo of
    jtInventory           : Result:= 'Inventory';
    jtBom                 : Result:= 'BOM';
    jtPO                  : Result:= 'PO';
    jtPOReceipts          : Result:= 'PO Receipt';
    jtWorkOrder           : Result:= 'Work Order';
    jtSalesOrder          : Result:= 'Sales Order';
    jtSalesOrderDetail    : Result:= 'Sales Order Detail';
    jtCustomer            : Result:= 'Customer';
    jtWorkCenter          : Result:= 'Work Center';
    jtVendor              : Result:= 'Vendor';
    jtPM                  : Result:= 'PM';
    jtARInvoice           : Result:= 'AR Invoice';
    jtAPInvoice           : Result:= 'AP Invoice';
    jtSchedule            : Result:= 'Schedule';
    jtTooling             : Result:= 'Project Manager';
    jtAvailability        : Result:= 'Availability';
    jtJumpToPackSlip      : Result:= 'PS';
    jtVendorRMADetail     : Result:= 'Vendor RMA Detail';
    jtHistSalesOrderDetail: Result:= 'History Sales Order Detail';
    jtHistTooling         : Result:= 'History Tooling';
    jtQuote               : Result:= 'Estimate';
    jtPO_Header           : Result:= 'PO';
    jtCRMActivity         : Result:= 'CRM Activity';
    jtCRMSupport          : Result:= 'CRM Support';
    jtCRMQuote            : Result:= 'CRM Quotation';
    jtCustomerCentral     : Result:= 'Customer Central';
    jtVendorCentral       : Result:= 'Vendor Central';
    jtPartnerCentral      : Result:= 'Partner Central';
    jtJumpToJobShop       : Result:= 'JobShop';
    jtRTWorkCenter        : Result:= 'RT Work Center';
    jtEmployeeMaint       : Result:= 'Employee Maint.';
    jtProcessCost         : Result:= 'Process Cost';
    jtMasterLocation      : Result:= 'Master Location';
    jtCustomerShipTo      : Result:= 'Customer ShipTo';
    jtJumpHREmpTraining  : Result:= 'HR Employee Training';
  else
    Result:= Copy( GetEnumName( TypeInfo( TJumpTo ), Ord( AJumpTo )), 3, 255 );
  end;

end;

function TIQWebJump.GetDataField:string;
begin
  Result:= FDataLink.FieldName;
end;

procedure TIQWebJump.SetDataField( AValue:string );
begin
  FDataLink.FieldName:= AValue;
end;

function TIQWebJump.GetDataSource : TDataSource;
begin
  Result:= FDataLink.DataSource;
end;

procedure TIQWebJump.SetDataSource( AValue:TDataSource );
begin
  FDataLink.DataSource:= AValue;
end;

procedure TIQWebJump.Execute;
begin
  if Assigned(FDataLink.Field) and Assigned(FDataLink.DataSource) then
  begin
    if (FDataLink.Field.asInteger > 0) then
      TIQWebJumpDispatcher.Jump(JumpTo, FDataLink.Field.asInteger)
    else
      IQConfirm( IQMS.WebVcl.ResourceStrings.cTXT0000101 {'Jump information unavailable'});
  end
  else
    IQConfirm( IQMS.WebVcl.ResourceStrings.cTXT0000102 {'Jump information unavailable'} )
end;

{$ENDREGION 'TIQWebJump'}

end.
