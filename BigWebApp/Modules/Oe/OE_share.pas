unit OE_share;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  oe_rscstr;

  // Displays ARCUSTO.INFO_SO text, if it exists
  procedure PopupSOInfo( const AArcustoID: Real );
  procedure PopupInventoryItemInfo( const AArcustoID, AShipToID, AArinvtID: Real );
  function  GetTierDiscount2(const ADiscount, AArcustoId, AArinvtId, AQty: Real;
    var FBASED_ON_STD_PRICE:String; var FAR_DISCOUNT_TIERS_ID:Real;
    var FDISCOUNT_PRICE:Real; AkaPrice:Real = 0; AShipToId:Real = 0; APromiseDate:TDateTime = -1 ):Real;
  function GetTierDiscountByItemType(AItemTypeID, AArcustoID: Real): Real;
  function Check_AR_DISCOUNT_TIERS_PriceBreaks(AOrdersUOM:String; APriceBreak, ADtlDiscount, AQty, FAR_DISCOUNT_TIERS_ID:Real; AkaPrice:Real = 0;
                                               AArcustoID:Real = 0; AArinvtID: Real = 0; 
                                               AShip_To_ID:Real = 0; APromiseDate:TDateTime = -1; ABlanketQty:Real = 0):Real;

  function Check_AR_DISCOUNT_TIERS_PriceBreaksExp(AOrdersUOM:String; APriceBreak, ADtlDiscount, AQty, FAR_DISCOUNT_TIERS_ID:Real; AkaPrice:Real = 0;
                                               AArcustoID:Real = 0; AArinvtID: Real = 0; 
                                               AShip_To_ID:Real = 0; APromiseDate:TDateTime = -1; ABlanketQty:Real = 0):Real;
                                               
  function Check_USE_DISCOUNT_TIER(AArcustoId, ADiscount:Real):Real;
  function Check_aka_price_over_tier:Boolean;
  function Overwrite_Customer_Discount: Boolean;
  function CheckCreditLimit(Arcusto_id, AOrderAmount:Real; AProcOverdue, AProcOverdueInv:TFDStoredProc): Boolean;

  // Returns true if Multicurrency is enabled in System Parameters
  function MultiCurrencyEnabled: Boolean;
  function CustomerDiscountComparison: Boolean;

  // Checks quantity values and informs user of problems.
  procedure CheckMinOrderQty(AArcustoID, AArinvtId, ACurrencyID,
    AARDiscountTeirsID: Real; Qty_Ord: Real; const cTable, cIdField: string;
    nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real);
  procedure CheckMinOrderQtyAggr(AArcustoID, AARDiscountTeirsID: Real;
    Qty_Ord: Real; const cTable, cIdField: string; nId: Real;
    Act_UOM, Std_UOM: string; AArinvt_ID: Real);

/// <summary>Prompt:  "The quantity has changed.  Update the unit price?".
/// This dialog is used in Sales Orders and CRM Sales Quotations.
/// </summary>
function PromptChangeUnitPrice(const AKey: string = 'FRMOEBLANKETQTY'): Boolean;
// Determine if the "Use Lot Charge" flag has been set.
function GetLotCharge(const AArcustoID, AShipToID, AArinvtId,
  AAkaID: Real): Real;
function IsLotCharge(ArcustoId, AShip_To_ID, ArinvtId: Real;
  var ALotCharge: Real): Boolean;

// 05/12/2014 Added method as part of EIQ-2979 SER# 05281
/// <summary>
///  Get the "multiples of" quantity value if it is available.
///  The function returns True if a value is available.
/// </summary>
/// <param name="AArinvtId">The ARINVT.ID to evaluate.
/// </param>
/// <param name="AQuantityEntered">The quantity entered by the user.
/// </param>
/// <param name="AUOMFactor">The UOM Factor entered by the user, if any.
/// </param>
/// <param name="AMultiplesOf">The "multiples of" value.
/// </param>
/// <param name="ASuggestedQuantity">Returns the suggested quantity.
/// </param>
function GetSuggestedMultipleOfQuantity(const AArcustoID, AArinvtId,
  AQuantityEntered, AUOMFactor: Real; var AMultiplesOf,
  ASuggestedQuantity: Real): Boolean;

// 05/12/2014 Added method as part of EIQ-2979 SER# 05281
/// <summary>
///  Determine of the "multiples of" quantity value needs to be updated,
///  and prompt the user to update, if required.
///  The function returns True if the value should be modified.
///  The function returns False if no action is required.
/// </summary>
/// <param name="AArinvtId">The ARINVT.ID to evaluate.
/// </param>
/// <param name="AQuantityEntered">The quantity entered by the user.
/// </param>
/// <param name="AUOMFactor">The UOM Factor entered by the user, if any.
/// </param>
/// <param name="ASuggestedQuantity">Returns the suggested quantity.
/// </param>
function CheckModifyMultipleOfQuantity(const AArcustoID, AArinvtId, AQuantityEntered,
  AUOMFactor: Real; var ASuggestedQuantity: Real): Boolean;

function GetAggregateDiscountPercent(AItemtypeId, ACustTypeId, AQuan:Real; AShipToId:Real = 0):Real;

function GetSuggestedFreightID(const AArcustoID, AShipToID: Int64;
  var AFreightID: Int64; var ACarrierAccountNumber: string): Boolean;
function GetCarrierAccountNumber(const AArcustoID, AShipToID,
  AFreightID: Real): string;

function GetUOMQty(AQty: Real; ArinvtId:Real; ADetailOUM: string): Real;

/// <summary>Get the minimum selling quantity for an Inventory item.</summary>
function GetMinSellQty(const AArinvtID, AArcustoID: Real): Real;

/// <summary> Get the Sales Margin for the given unit price and
/// Inventory item. </summary>
function GetSalesMargin(const AUnitPrice: Real; const AArinvtID: Real): Real;

/// <summary> Mark up the price by the given percentage. </summary>
function MarkupPrice(const AListUnitPrice, APrice: Real; const AMarkupPercentage: Real): Real;

/// <summary> Discount (mark down) the price by the given percentage. </summary>
function DiscountPrice(const AListUnitPrice, APrice: Real; const ADiscountPercentage: Real): Real;

type
 TWebPaymentType = (None, COD, Prepaid, OnAccount, CreditCard);

const
  WebPaymentTypeText: array[TWebPaymentType] of string =
   ('', // None
    oe_rscstr.cTXT0000172, // 'C.O.D.'
    oe_rscstr.cTXT0000173, // 'Prepaid'
    oe_rscstr.cTXT0000174, // 'On Account'
    oe_rscstr.cTXT0000175); // 'Credit Card'

/// <summary> Get the display text for the payment type, used on a Web order.
/// </summary>
function WebPaymentTypeDisplay(const APaymentType: Integer): string;

/// <summary> Determine whether the sales order ship via on the header has a release with a different ship via.
/// </summary>
function OrderHasConflictingShipViaInReleases(AOrdersID: Real): Boolean;

{$REGION 'TInventoryItemPricing type declaration'}

type
  { TInventoryItemPricingOptions }
  TInventoryItemPricingOption = (ipoPriceCheck, ipoDiscountCheck,
    ipoUseParentDiscount, ipoPromptIfQtyChanged);
  /// <summary>Pricing options</summary>
  TInventoryItemPricingOptions = set of TInventoryItemPricingOption;

  { TInventoryItemPricingParentRecord }
  /// <summary>Parent record values</summary>
  /// <comments>Used by TInventoryItemPricing to store the parent
  /// record field values.</comments>
  TInventoryItemPricingParentRecord = class(TComponent)
    private
      { Private declarations }
      FArcustoID: Real;
      FShipToID: Real;
      FCurrencyID: Real;
      FDiscount: Real;
    public
      { Public declarations }
      constructor Create(AOwner: TComponent);
    published
      { Published declarations }
      property ArcustoId: Real read FArcustoID write FArcustoID;
      property ShipToID: Real read FShipToID write FShipToID;
      property Discount: Real read FDiscount write FDiscount;
      property CurrencyID: Real read FCurrencyID write FCurrencyID;
  end;

  { TInventoryItemPricingDetailRecord }
  /// <summary>Detail record values</summary>
  /// <comments>Used by TInventoryItemPricing to store the detail
  /// record field values.</comments>
  TInventoryItemPricingDetailRecord = class(TComponent)
    private
      { Private declarations }
      FArinvtID: Real;
      FAKAID: Real;
      FListUnitPrice: Real;
      FUnitPrice: Real;
      FUOM: string;
      FQuantity: Real;
      FPriorQuantity: Real;
      FAKA_Kind: string;
      FRequestedDate: TDateTime;
      FPromisedDate: TDateTime;
      FMarkupPercentage: Real;
      procedure SetAKAID(const Value: Real);
    public
      { Public declarations }
      constructor Create(AOwner: TComponent);
    published
      { Published declarations }
      property ArinvtId: Real read FArinvtID write FArinvtID;
      property AKAID: Real read FAKAID write SetAKAID;
      property AKA_Kind: string read FAKA_Kind write FAKA_Kind;
      property Quantity: Real read FQuantity write FQuantity;
      property PriorQuantity: Real read FPriorQuantity write FPriorQuantity;
      property UOM: string read FUOM write FUOM;
      property ListUnitPrice: Real read FListUnitPrice write FListUnitPrice;
      property UnitPrice: Real read FUnitPrice write FUnitPrice;
      property RequestedDate: TDateTime read FRequestedDate
        write FRequestedDate;
      property PromisedDate: TDateTime read FPromisedDate
        write FPromisedDate;
      property MarkupPercentage: Real read FMarkupPercentage write FMarkupPercentage;
  end;

  { TInventoryItemPricing }
  /// <summary>Calculate Inventory item pricing</summary>
  /// <comments>Used by Sales Orders and CRM Sales Quotations
  /// to return Inventory item pricing.</comments>
  TInventoryItemPricing = class(TComponent)
    private
      { Private declarations }
      FParentRecord: TInventoryItemPricingParentRecord;
      FDetailRecord: TInventoryItemPricingDetailRecord;
      FPriceBreakPer1000: Real;
      FPriceDiscount: Real;
      FListPriceBreak: Real;
      FOptions: TInventoryItemPricingOptions;
      FPriceBreak: Real;
      FArinvtBreaksPriceBreak: Real;
    protected
      { Protected declarations }
      function ProcessExec(var APriceBreak: Real; var AListPriceBreak: Real;
        var APriceBreakPer1000: Real; var ADiscount: Real): Boolean; virtual;
    public
      { Public declarations }
      constructor Create(AOwner: TComponent);
      destructor Destroy; override;
      function Execute: Boolean; overload;
      function Execute(var APriceBreak: Real; var AListPriceBreak: Real;
        var APriceBreakPer1000: Real; var ADiscount: Real): Boolean; overload;
    published
      { Published declarations }
      // Parent record fields (example: ORDERS, CRM_QUOTES)
      property ParentRecord: TInventoryItemPricingParentRecord
        read FParentRecord;
      // Detail record fields (example: ORD_DETAIL, CRM_QUOTE_DETAIL):
      property DetailRecord: TInventoryItemPricingDetailRecord
        read FDetailRecord;
      // Options:
      property Options: TInventoryItemPricingOptions read FOptions
        write FOptions;
      // Returned values (read-only):
      property PriceBreak: Real read FPriceBreak;
      property ListPriceBreak: Real read FListPriceBreak;
      property PriceBreakPer1000: Real read FPriceBreakPer1000;
      property PriceDiscount: Real read FPriceDiscount;
  end;

{$ENDREGION 'TInventoryItemPricing type declaration'}

type
  TMiscOrderCargo = class
    Misc_item     : string;
    Unit_price    : Real;
    Arcusto_ID    : Real;
    Blanket_Qty   : Real;
    Rma_Detail_ID : Real;
    constructor Create( AMisc_Item: string; AUnit_price, AArcusto_ID,
      ABlanket_Qty, ARma_detail_ID : Real );
  end;


implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.MsgFrm,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.UOM,
  IQMS.Common.Mcshare;
  { TODO : oe_conf_multiples_of_violation and OECheckCrLimit have a no web conversion tag }
 // oe_conf_multiples_of_violation,
 // OECheckCrLimit;

{$REGION 'TMiscOrderCargo'}

{ TMiscOrderCargo }

constructor TMiscOrderCargo.Create( AMisc_item: string; AUnit_price, AArcusto_ID, ABlanket_Qty, ARma_detail_ID : Real );
begin
  Misc_item    := AMisc_item    ;
  Unit_price   := AUnit_price   ;
  Arcusto_ID   := AArcusto_ID   ;
  Blanket_qty  := ABlanket_qty  ;
  Rma_detail_ID:= ARma_detail_ID;
end;

{$ENDREGION 'TMiscOrderCargo'}

procedure PopupSOInfo( const AArcustoID: Real );
var S: String;
begin
     S := Trim( SelectValueFmtAsString( 'select info_so from arcusto where id = %.0f', [AArcustoID] ));
     if ( S > '' ) then
        begin
             Beep;
             IQShowStrModal(S); // iqmsgfrm
        end;
end;

procedure PopupInventoryItemInfo(const AArcustoID, AShipToID, AArinvtID: Real);
var
  S, S1, S2: string;
  LCaption : String;
begin
  // 01/15/2015 (Byron) Added this shared method based on the method in
  // DM_OR.pas in order to make it available to other areas.
  // EIQ-5618.
  LCaption := SelectValueFmtAsString(
              'SELECT TRIM(itemno) || '' - '' || TRIM(descrip) FROM arinvt ' +
              'WHERE id = %.0f', [AArinvtID]);
  if AArinvtID > 0 then
    begin
      S1:= SelectValueFmtAsString(
        'SELECT TRIM(info_so) FROM arinvt WHERE id = %.0f',
        [AArinvtID]);
      S2:= SelectValueFmtAsString(
        'SELECT TRIM(info_so)                               '#13 +
        '  FROM aka                                         '#13 +
        ' WHERE arinvt_id = %.0f AND                        '#13 +
        '       arcusto_id = %.0f AND                       '#13 +
        '       misc.aka_ship_to_filter(%.0f,               '#13 +
        '                               arinvt_id,          '#13 +
        '                               %.0f,               '#13 +
        '                               ship_to_id) = 1     ',
      [ AArinvtID, AArcustoID, AArcustoID, AShipToID ]);

      if (S1 = '') and (S2 = '') then
        Exit
      else if (S1 > '') and (S2 = '') then
        S := S1
      else if (S1 = '') and (S2 > '') then
        S := S2
      else
        S := S1 + #13#10#13#10 + S2;

      if Trim(S) > '' then
        begin
        // Note: In DM_OR.pas, the editmemostr.DoViewMemoStr was used.
        // I (Byron) changed it to the IQMsgFrm.pas call in order to
        // be consistent with the Sales Order Information popup.
        // EIQ-5618.
        // IQMsgFrm.IQShowStrModal(S); // iqmsgfrm
        // 10/07/2015 (Byron, EIQ-8991) Show the Inventory item #

            TFrmShowStr.DoShowModal(LCaption,s);
        end;
    end;
end;

function Check_aka_price_over_tier:Boolean;
begin
  Result := SelectValueAsString('select NVL(aka_price_over_tier, ''N'') ' +
    'from iqsys2 where rownum < 2') = 'Y';
end;

function Overwrite_Customer_Discount: Boolean;
begin
  Result := SelectValueAsString('select NVL(overwrite_cust_disc, ''N'') ' +
    'from iqsys where rownum < 2') = 'Y';
end;

function GetTierDiscount2(const ADiscount, AArcustoId, AArinvtId, AQty:Real;
                              var FBASED_ON_STD_PRICE:String; var FAR_DISCOUNT_TIERS_ID:Real;
                              var FDISCOUNT_PRICE:Real; AkaPrice:Real = 0;
                              AShipToId:Real = 0; APromiseDate:TDateTime = -1 ):Real;
var
  AResult:Real;
  AQry: TFDQuery;
  AUseThisDiscount: Real;
  AFound:Boolean;
  AWaterfallId:Real;
  AUseWaterfall:Boolean;
  Acust_type_id:Real;
  ADate:TDateTime;
begin
  // Initialize
  Result := 0;
  // Initialize this variable to the parameter coming into the method.
  AUseThisDiscount := ADiscount;
  Acust_type_id := SelectValueFmtAsFloat('select cust_type_id from ship_to where id = %f', [AShipToId]);

  // 12/07/2015 (Byron, EIQ-9698) Check two System Parameter settings:
  // If "Overwrite Header Discount" is true and "AKA pricing override Tier
  // discount pricing" is also true, then do not apply the discount.
  // Clear the variable so that it is zero and will not be used.
  if Overwrite_Customer_Discount and Check_aka_price_over_tier then
    AUseThisDiscount := 0;

  // If discount value is provided, and the system is set not to overwrite
  // the customer discount, then just return the discount.
  if (AUseThisDiscount > 0) and not Overwrite_Customer_Discount then
    Exit(AUseThisDiscount);

//  if ADiscount > 0 then
//    if SelectValueAsString('select NVL(overwrite_cust_disc, ''N'') from iqsys') = 'N' then
//    begin
//      Result := ADISCOUNT;
//      Exit;
//    end;


  ADate := APromiseDate;
  if ADate < 0 then
    ADate := Date;
  with TFDStoredProc.Create( nil ) do
  try
    Connection := UniMainModule.FDConnection1;
    StoredProcName:= 'IQMS.OE_MISC.GETTIERDISCOUNT2';
    Prepare;
    ParamByName('v_discount').Value := AUseThisDiscount;
    ParamByName('v_arcusto_id').Value := AArcustoId;
    ParamByName('v_arinvt_id').Value := AArinvtId;
    ParamByName('v_qty').Value := AQty;
    ParamByName('v_default_cust_type_id').Value := AShipToId;
    ParamByName('v_promise_date').Value := ADate;
    ExecProc;

    Result:= Params.ParamByName( 'Result' ).asFloat;
    if Check_aka_price_over_tier and (AkaPrice <> 0) then Result := AUseThisDiscount;

    FBASED_ON_STD_PRICE   := Params.ParamByName('v_based_on_std_price').asString;
    FAR_DISCOUNT_TIERS_ID := Params.ParamByName('v_ar_discount_tiers_id').asFloat;
    if SelectValueFmtAsString('select decode(min(discount_price), null, ''Y'', ''N'') from ar_discount_tiers where id = %f', [FAR_DISCOUNT_TIERS_ID]) = 'Y' then
      FDISCOUNT_PRICE       := -10000000000
    else
      FDISCOUNT_PRICE       := Params.ParamByName('v_discount_price').asFloat;
  finally
    Free;
  end;
  Exit;
(*


  AWaterfallId := SelectValueFmtAsFloat ('select ar_discount_waterfall_id from arinvt where id = %.0f', [AArinvtID]);

  if Check_aka_price_over_tier then
  begin
    Result := AUseThisDiscount;

     FBASED_ON_STD_PRICE:= 'X';
     FAR_DISCOUNT_TIERS_ID := 0;
     FDISCOUNT_PRICE := -10000000000;

      AQry := TFDQuery.Create(NIL);
      with AQry do
      try
        Connection := MainModule.FDConnection;
        Sql.Add(IQFormat(  'select discount, id, NVL(discount_price, -10000000000) as discount_price,   '+
                         '       NVL(BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                         '  from ar_discount_tiers tiers                                   '+
                         ' where arinvt_id = %f                                             '+
                         '   and arcusto_id = %f                                            '+
                         '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                         '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                         [ AArinvtID, AArcustoID, AWaterfallId, AWaterfallId ]));
        Open;
        if not (eof and bof) then
        begin
          AFound := True;
          Result              := FieldByName('discount').asFloat;
          FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
          FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
          FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
        end;
      finally
        Free;
      end;

      if not AFound then
      begin
        AQry := TFDQuery.Create(nil);
        with AQry do
        try
          Connection := MainModule.FDConnection;
          Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                           '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                           '  from ar_discount_tiers tiers,                                   '+
                           '       arcusto                                                    '+
                           ' where tiers.arinvt_id = %f                                       '+
                           '   and arcusto.id = %f                                            '+
                           '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                           '   and %f = tiers.cust_type_id                                    '+
                           '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                           '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                           [ AArinvtID, AArcustoID, Acust_type_id, AWaterfallId, AWaterfallId ]));
          Open;
          if not (eof and bof) then
          begin
            AFound := True;
            Result              := FieldByName('discount').asFloat;
            FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
            FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
            FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
          end;
        finally
          Free;
        end;
      end;


      if not AFound then
      begin
        AQry := TFDQuery.Create(nil);
        with AQry do
        try
          Connection := MainModule.FDConnection;
          Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                           '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                           '  from ar_discount_tiers tiers,                                   '+
                           '       arcusto                                                    '+
                           ' where tiers.arinvt_id = %f                                       '+
                           '   and arcusto.id = %f                                            '+
                           '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                           '   and arcusto.cust_type_id = tiers.cust_type_id                  '+
                           '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                           '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                           [ AArinvtID, AArcustoID, AWaterfallId, AWaterfallId ]));
          Open;
          if not (eof and bof) then
          begin
            AFound := True;
            Result              := FieldByName('discount').asFloat;
            FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
            FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
            FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
          end;
        finally
          Free;
        end;
      end;

      if not AFound then
      begin
        AQry := TFDQuery.Create(nil);
        with AQry do
        try
          Connection := MainModule.FDConnection;
          Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                           '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                           '  from ar_discount_tiers tiers,                                   '+
                           '       arinvt,                                                    '+
                           '       arcusto                                                    '+
                           ' where arinvt.id = %f                                             '+
                           '   and arcusto.id = %f                                            '+
                           '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                           '   and %f = tiers.cust_type_id                                    '+
                           '   and arinvt.item_type_id  = tiers.item_type_id(+)               '+
                           '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                           '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                           [ AArinvtID, AArcustoID, Acust_type_id, AWaterfallId, AWaterfallId ]));
          Open;
          if not (eof and bof) then
          begin
            AFound := True;
            Result              := FieldByName('discount').asFloat;
            FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
            FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
            FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
          end;
        finally
          Free;
        end;
      end;


      if not AFound then
      begin
        AQry := TFDQuery.Create(nil);
        with AQry do
        try
          Connection := MainModule.FDConnection;
          Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                           '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                           '  from ar_discount_tiers tiers,                                   '+
                           '       arinvt,                                                    '+
                           '       arcusto                                                    '+
                           ' where arinvt.id = %f                                             '+
                           '   and arcusto.id = %f                                            '+
                           '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                           '   and arcusto.cust_type_id = tiers.cust_type_id                  '+
                           '   and arinvt.item_type_id  = tiers.item_type_id(+)               '+
                           '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                           '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                           [ AArinvtID, AArcustoID, AWaterfallId, AWaterfallId ]));
          Open;
          if not (eof and bof) then
          begin
            AFound := True;
            Result              := FieldByName('discount').asFloat;
            FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
            FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
            FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
          end;
        finally
          Free;
        end;
      end;
      Exit;
  end;

  Result:= 0;
  FBASED_ON_STD_PRICE:= 'X';
  FAR_DISCOUNT_TIERS_ID := 0;
  FDISCOUNT_PRICE := -10000000000;

// locate by arcusto_id, arinvt_id
  AQry := TFDQuery.Create(NIL);
  with AQry do
  try
    Connection := MainModule.FDConnection;
    Sql.Add(IQFormat(  'select discount, id, NVL(discount_price, -10000000000) as discount_price,   '+
                     '       NVL(BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                     '  from ar_discount_tiers tiers                                   '+
                     ' where arinvt_id = %f                                             '+
                     '   and arcusto_id = %f                                            '+
                     '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                     '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                     [ AArinvtID, AArcustoID, AWaterfallId, AWaterfallId ]));
    Open;
    if not (eof and bof) then
    begin
      Result              := FieldByName('discount').asFloat;
      FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
      FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
      FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
    end;
  finally
    Free;
  end;



  if FAR_DISCOUNT_TIERS_ID = 0 then
// locate by arcusto_id, item_type
  begin
    AQry := TFDQuery.Create(nil);
    with AQry do
    try
      Connection := MainModule.FDConnection;
      Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                       '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                       '  from ar_discount_tiers tiers,                                   '+
                       '       arinvt                                                    '+
                       ' where arinvt.id = %f                                             '+
                       '   and tiers.arcusto_id = %f                                      '+
                       '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                       '   and arinvt.item_type_id  = tiers.item_type_id                  '+
                       '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                       '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                       [ AArinvtID, AArcustoID, AWaterfallId, AWaterfallId ]));
      Open;
      if not (eof and bof) then
      begin
        Result              := FieldByName('discount').asFloat;
        FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
        FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
        FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
      end;
    finally
      Free;
    end;
  end;

  if FAR_DISCOUNT_TIERS_ID = 0 then
// locate by cust_type, arinvt_id
  begin
    AFound := false;
    if AFound then
    begin
      AQry := TFDQuery.Create(nil);
      with AQry do
      try
        Connection := MainModule.FDConnection;
        Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                         '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                         '  from ar_discount_tiers tiers,                                   '+
                         '       arcusto                                                    '+
                         ' where tiers.arinvt_id = %f                                       '+
                         '   and arcusto.id = %f                                            '+
                         '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                         '   and %f = tiers.cust_type_id                                    '+
                         '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                         '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                         [ AArinvtID, AArcustoID, Acust_type_id, AWaterfallId, AWaterfallId ]));
        Open;
        if not (eof and bof) then
        begin
          Result              := FieldByName('discount').asFloat;
          FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
          FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
          FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
        end;
      finally
        Free;
      end;
    end;
    
    if AFound then
    begin
    AQry := TFDQuery.Create(nil);
      with AQry do
      try
        Connection := MainModule.FDConnection;
        Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                         '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                         '  from ar_discount_tiers tiers,                                   '+
                         '       arcusto                                                    '+
                         ' where tiers.arinvt_id = %f                                       '+
                         '   and arcusto.id = %f                                            '+
                         '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                         '   and arcusto.cust_type_id = tiers.cust_type_id                  '+
                         '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                         '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                         [ AArinvtID, AArcustoID, AWaterfallId, AWaterfallId ]));
        Open;
        if not (eof and bof) then
        begin
          Result              := FieldByName('discount').asFloat;
          FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
          FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
          FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
        end;
      finally
        Free;
      end;
    end;
  end;

// locate by cust_type, item_type
  if FAR_DISCOUNT_TIERS_ID = 0 then
  begin
    AFound := false;
    if not AFound then
    begin
      AQry := TFDQuery.Create(nil);
      with AQry do
      try
        Connection := MainModule.FDConnection;
        Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                         '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                         '  from ar_discount_tiers tiers,                                   '+
                         '       arinvt,                                                    '+
                         '       arcusto                                                    '+
                         ' where arinvt.id = %f                                             '+
                         '   and arcusto.id = %f                                            '+
                         '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                         '   and %f = tiers.cust_type_id                                    '+
                         '   and arinvt.item_type_id  = tiers.item_type_id(+)               '+
                         '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                         '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                         [ AArinvtID, AArcustoID, Acust_type_id, AWaterfallId, AWaterfallId ]));
        Open;
        if not (eof and bof) then
        begin
          Result              := FieldByName('discount').asFloat;
          FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
          FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
          FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
        end;
      finally
        Free;
      end;
    
    end;
    
    if not AFound then
    begin
      AQry := TFDQuery.Create(nil);
      with AQry do
      try
        Connection := MainModule.FDConnection;
        Sql.Add(IQFormat(  'select tiers.discount, tiers.id, NVL(tiers.discount_price, -10000000000) as discount_price, '+
                         '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
                         '  from ar_discount_tiers tiers,                                   '+
                         '       arinvt,                                                    '+
                         '       arcusto                                                    '+
                         ' where arinvt.id = %f                                             '+
                         '   and arcusto.id = %f                                            '+
                         '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        '+
                         '   and arcusto.cust_type_id = tiers.cust_type_id                  '+
                         '   and arinvt.item_type_id  = tiers.item_type_id(+)               '+
                         '   and ((nvl(use_waterfall, ''N'') = ''Y'' and  %.0f > 0)         '+
                         '        or (nvl(use_waterfall, ''N'') = ''N'' and  %.0f = 0))    ',
                         [ AArinvtID, AArcustoID, AWaterfallId, AWaterfallId ]));
        Open;
        if not (eof and bof) then
        begin
          Result              := FieldByName('discount').asFloat;
          FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
          FAR_DISCOUNT_TIERS_ID := FieldByName('id').asFloat;
          FDISCOUNT_PRICE := FieldByName('discount_price').asFloat;
        end;
      finally
        Free;
      end;
    end;
  end;

//    Result := GetTierDiscount(AARCUSTOID, AARINVTID);

  AResult := Result;

  if FAR_DISCOUNT_TIERS_ID = 0 then
    Result := AUseThisDiscount
  else
  begin

    // Added by PC on 12-16-13 for waterfall pricing
    AUseWaterfall := SelectValueFmtAsString('select nvl(use_waterfall, ''N'') from ar_discount_tiers where id = %.0f', [FAR_DISCOUNT_TIERS_ID]) = 'Y';
    if (AUseWaterfall) then
      with TFDQuery.Create(nil) do
      try
         Connection := MainModule.FDConnection;
         SQL.Add( 'select NVL(B1.discount, -10000000000) '                                      );
         SQL.Add( 'from AR_DISCOUNT_AGGREGATE B1,'      );
         SQL.Add(     ' AR_DISCOUNT_WATERFALL_LEVELS L1,'      );
         SQL.Add(     ' AR_DISCOUNT_TIERS T1'      );
         SQL.Add(IQFormat( ' where T1.ID = %f', [FAR_DISCOUNT_TIERS_ID]));
         SQL.Add(          ' and sysdate between NVL(b1.effect_date, sysdate - 36500) and NVL(b1.deactive_date, sysdate + 36500) ');
         SQL.Add(IQFormat( ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b1.id) = 1 ' , [AArcustoId]));
         SQL.Add(          ' and B1.AR_DISCOUNT_TIERS_ID = T1.ID' );
         SQL.Add(IQFormat( ' and L1.AR_DISCOUNT_WATERFALL_ID = %.0f', [AWaterfallId]));
         SQL.Add(          ' and L1.QUAN_LEVEL = B1.QUAN_LEVEL' );
         SQL.Add(          ' and L1.quan = ('                                              );
         SQL.Add(                'select Max(L2.QUAN) '                                      );
         SQL.Add(                'from AR_DISCOUNT_AGGREGATE B2,' );
         SQL.Add(                    ' AR_DISCOUNT_WATERFALL_LEVELS L2,' );
         SQL.Add(                    ' AR_DISCOUNT_TIERS T2' );
         SQL.Add(               ' where T2.ID = B1.AR_DISCOUNT_TIERS_ID ');
         SQL.Add(               ' and sysdate between NVL(b2.effect_date, sysdate - 36500) and NVL(b2.deactive_date, sysdate + 36500) ');
         SQL.Add(IQFormat(      ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b2.id) = 1 ' , [AArcustoId]));
         SQL.Add(               ' and B2.AR_DISCOUNT_TIERS_ID = T2.ID');
         SQL.Add(IQFormat(      ' and L2.AR_DISCOUNT_WATERFALL_ID = %.0f', [AWaterfallId]));
         SQL.Add(               ' and L2.QUAN_LEVEL = B2.QUAN_LEVEL');
         SQL.Add( IQFormat(     'and (L2.QUAN <= %f', [AQty]));
         SQL.Add(                    'or L2.QUAN ='                                     );
         SQL.Add(                           '(select Min( L3.QUAN ) '                        );
         SQL.Add(                           'from AR_DISCOUNT_AGGREGATE B3,'    );
         SQL.Add(                               ' AR_DISCOUNT_WATERFALL_LEVELS L3,'    );
         SQL.Add(                               ' AR_DISCOUNT_TIERS T3'    );
         SQL.Add(                          ' where T3.ID = B1.AR_DISCOUNT_TIERS_ID ');
         SQL.Add(                          ' and sysdate between NVL(b3.effect_date, sysdate - 36500) and NVL(b3.deactive_date, sysdate + 36500) ');
         SQL.Add(IQFormat(                 ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1 ' , [AArcustoId]));
         SQL.Add(                          ' and B3.AR_DISCOUNT_TIERS_ID = T3.ID');
         SQL.Add(IQFormat(                 ' and L3.AR_DISCOUNT_WATERFALL_ID = %.0f', [AWaterfallId]));
         SQL.Add(                          ' and L3.QUAN_LEVEL = B3.QUAN_LEVEL)))');
         Open;
         Result:= 0;
         if not Eof then
         begin
           if Fields[ 0 ].asFloat <> -10000000000 then
           begin
             Result := Fields[ 0 ].asFloat;
             Result := Check_USE_DISCOUNT_TIER(AArcustoId, Result);
             Exit;
           end;
         end;
      finally
        Free;
      end;

    AQry := TFDQuery.Create(nil);
    with AQry do
    try
       Connection := MainModule.FDConnection;
       SQL.Add( 'select NVL(B1.discount_price, -10000000000) '                                      );
       SQL.Add( 'from AR_DISCOUNT_AGGREGATE B1'      );
       SQL.Add(            ' where sysdate between NVL(b1.effect_date, sysdate - 36500) and NVL(b1.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b1.id) = 1 ' , [AArcustoId]));      
       SQL.Add( IQFormat( ' and B1.AR_DISCOUNT_TIERS_ID = %f', [FAR_DISCOUNT_TIERS_ID]));
       SQL.Add(            'and B1.quan = ('                                              );
       SQL.Add(                'select Max(B2.QUAN)'                                      );
       SQL.Add(                'from AR_DISCOUNT_AGGREGATE B2' );
       SQL.Add(            ' where sysdate between NVL(b2.effect_date, sysdate - 36500) and NVL(b2.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b2.id) = 1 ' , [AArcustoId]));      
       SQL.Add(               ' and B1.AR_DISCOUNT_TIERS_ID = B2.AR_DISCOUNT_TIERS_ID');
       SQL.Add( IQFormat(         'and (B2.QUAN <= %f', [AQty]));
       SQL.Add(                        'or B2.QUAN ='                                     );
       SQL.Add(                           '(select Min( B3.QUAN )'                        );
       SQL.Add(                           'from AR_DISCOUNT_AGGREGATE B3'    );
       SQL.Add(            ' where sysdate between NVL(b3.effect_date, sysdate - 36500) and NVL(b3.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1 ' , [AArcustoId]));      
       SQL.Add(                      ' and B1.AR_DISCOUNT_TIERS_ID = B3.AR_DISCOUNT_TIERS_ID)))');
  //     SQL.Add( IqFormat('and %f >= (select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f)', [AQty, FAR_DISCOUNT_TIERS_ID]));
       Open;
       Result:= 0;
       if not Eof then
       begin
         if Fields[ 0 ].asFloat <> -10000000000 then
         begin
           FDISCOUNT_PRICE := Fields[ 0 ].asFloat;
           Result := Check_USE_DISCOUNT_TIER(AArcustoId, Result);
           Exit;
         end
         else
         begin
           Result:= AResult;
         end
       end
       else
       begin
         Result:= AResult;
       end;
    finally
      Free;
    end;

    AQry := TFDQuery.Create(nil);
    with AQry do
    try
       Connection := MainModule.FDConnection;
       SQL.Add( 'select NVL(B1.discount, -10000000000) '                                      );
       SQL.Add( 'from AR_DISCOUNT_AGGREGATE B1'      );
       SQL.Add(            ' where sysdate between NVL(b1.effect_date, sysdate - 36500) and NVL(b1.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b1.id) = 1 ' , [AArcustoId]));      
       SQL.Add( IQFormat( ' and B1.AR_DISCOUNT_TIERS_ID = %f', [FAR_DISCOUNT_TIERS_ID]));
       SQL.Add(            'and B1.quan = ('                                              );
       SQL.Add(                'select Max(B2.QUAN)'                                      );
       SQL.Add(                'from AR_DISCOUNT_AGGREGATE B2' );
       SQL.Add(            ' where sysdate between NVL(b2.effect_date, sysdate - 36500) and NVL(b2.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b2.id) = 1 ' , [AArcustoId]));      
       SQL.Add(               ' and B1.AR_DISCOUNT_TIERS_ID = B2.AR_DISCOUNT_TIERS_ID');
       SQL.Add( IQFormat(         'and (B2.QUAN <= %f', [AQty]));
       SQL.Add(                        'or B2.QUAN ='                                     );
       SQL.Add(                           '(select Min( B3.QUAN )'                        );
       SQL.Add(                           'from AR_DISCOUNT_AGGREGATE B3'    );
       SQL.Add(            ' where sysdate between NVL(b3.effect_date, sysdate - 36500) and NVL(b3.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1 ' , [AArcustoId]));      
       SQL.Add(                      ' and B1.AR_DISCOUNT_TIERS_ID = B3.AR_DISCOUNT_TIERS_ID)))');
//       SQL.Add( IqFormat('and %f >= (select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f)', [AQty, FAR_DISCOUNT_TIERS_ID]));
       Open;
       Result:= 0;
       if not Eof then
       begin
         Result := Fields[ 0 ].asFloat;
         Result := Check_USE_DISCOUNT_TIER(AArcustoId, Result);
         Exit;
       end
       else
         Result:= AResult;
    finally
      Free;
    end;
  end;
  Result := Check_USE_DISCOUNT_TIER(AArcustoId, Result);
*)
end;

function Check_USE_DISCOUNT_TIER(AArcustoId, ADiscount:Real):Real;
var
  ACustDiscount:Real;
begin
  Result := ADiscount;
  if SelectValueFmtAsString('select NVL(USE_DISCOUNT_TIER, ''N'') from arcusto where id = %f', [AArcustoId]) = 'Y' then
  begin
    ACustDiscount := SelectValueFmtAsFloat('select NVL(DISCOUNT, -100000000) from arcusto where id = %f', [AArcustoId]);
    if ACustDiscount > -100000000 then
      Result := ACustDiscount;
  end;

end;

function Check_AR_DISCOUNT_TIERS_PriceBreaksExp(AOrdersUOM:String; APriceBreak, ADtlDiscount, AQty, FAR_DISCOUNT_TIERS_ID:Real; AkaPrice:Real = 0;
                                             AArcustoID:Real = 0; AArinvtID: Real = 0; 
                                             AShip_To_ID:Real = 0; APromiseDate:TDateTime = -1; ABlanketQty:Real = 0):Real;
var
  aDiscount:Real;
  aDiscount_price:Real;
  aMinQty:Real;
  aWaterfallId: Real;
  aUseWaterfall: Boolean;
  ADate:TDateTime;
begin
  if FAR_DISCOUNT_TIERS_ID <> 0 then
  begin
    ADate := APromiseDate;
    if Adate < 0 then
      ADate := Date;
    Result := SelectValueFmtAsFloat('select oe_misc.ChkAR_DISCOUNT_TIERSPriceBrksE(%.6f, %.6f, %.6f, %f, %f, %f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ' +
                        'null, %f) from dual',
    [APriceBreak,
     ADtlDiscount, 
     AQty, 
     FAR_DISCOUNT_TIERS_ID,
     AArcustoID,
     AArinvtID,
     AShip_To_ID,
     FormatDateTime('mm/dd/yyyy', ADate),
     ABlanketQty]);
     if (Abs(APriceBreak - Result) > 0.000001) and (ADtlDiscount = 0) then
       Result := GetUOMQty(Result, AArinvtID, AOrdersUOM);
  end
  else
    Result := APriceBreak * (1 - ADtlDiscount / 100);
end;


function Check_AR_DISCOUNT_TIERS_PriceBreaks(AOrdersUOM:String; APriceBreak, ADtlDiscount, AQty, FAR_DISCOUNT_TIERS_ID:Real; AkaPrice:Real = 0;
                                             AArcustoID:Real = 0; AArinvtID: Real = 0; 
                                             AShip_To_ID:Real = 0; APromiseDate:TDateTime = -1; ABlanketQty:Real = 0):Real;
var
  aDiscount:Real;
  aDiscount_price:Real;
  aMinQty:Real;
  aWaterfallId: Real;
  aUseWaterfall: Boolean;
  ADate:TDateTime;
begin
  if FAR_DISCOUNT_TIERS_ID <> 0 then
  begin
    ADate := APromiseDate;
    if Adate < 0 then
      ADate := Date;
    Result := SelectValueFmtAsFloat('select oe_misc.ChkAR_DISCOUNT_TIERSPriceBrks(%.6f, %.6f, %.6f, %f, %f, %f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ' +
                        'null, %f) from dual',
    [APriceBreak,
     ADtlDiscount, 
     AQty, 
     FAR_DISCOUNT_TIERS_ID,
     AArcustoID,
     AArinvtID,
     AShip_To_ID,
     FormatDateTime('mm/dd/yyyy', ADate),
     ABlanketQty]);
     if (Abs(APriceBreak - Result) > 0.000001) and (ADtlDiscount = 0) then
       Result := GetUOMQty(Result, AArinvtID, AOrdersUOM);
     exit;


  
    aDiscount := 0;
    aDiscount_price := 0;

    // Added by PC on 12-16-13 for waterfall pricing
    aUseWaterfall := SelectValueFmtAsString('select nvl(use_waterfall, ''N'') from ar_discount_tiers where id = %.0f', [FAR_DISCOUNT_TIERS_ID]) = 'Y';
    aWaterfallId := SelectValueFmtAsFloat ('select ar_discount_waterfall_id from arinvt where id = %.0f', [AArinvtID]);
    if (aUseWaterfall) then
      with TFDQuery.Create(nil) do
      try
         Connection := UniMainModule.FDConnection1;
         SQL.Add( 'select NVL(B1.discount, -10000000000) '                                      );
         SQL.Add( 'from AR_DISCOUNT_AGGREGATE B1,'      );
         SQL.Add(     ' AR_DISCOUNT_WATERFALL_LEVELS L1,'      );
         SQL.Add(     ' AR_DISCOUNT_TIERS T1'      );
         SQL.Add(IQFormat( ' where T1.ID = %f', [FAR_DISCOUNT_TIERS_ID]));
         SQL.Add(          ' and sysdate between NVL(b1.effect_date, sysdate - 36500) and NVL(b1.deactive_date, sysdate + 36500) ');
         SQL.Add(IQFormat( ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b1.id) = 1 ' , [AArcustoId]));
         SQL.Add(          ' and B1.AR_DISCOUNT_TIERS_ID = T1.ID' );
         SQL.Add(IQFormat( ' and L1.AR_DISCOUNT_WATERFALL_ID = %.0f', [AWaterfallId]));
         SQL.Add(          ' and L1.QUAN_LEVEL = B1.QUAN_LEVEL' );
         SQL.Add(          ' and L1.quan = ('                                              );
         SQL.Add(                'select Max(L2.QUAN) '                                      );
         SQL.Add(                'from AR_DISCOUNT_AGGREGATE B2,' );
         SQL.Add(                    ' AR_DISCOUNT_WATERFALL_LEVELS L2,' );
         SQL.Add(                    ' AR_DISCOUNT_TIERS T2' );
         SQL.Add(               ' where T2.ID = B1.AR_DISCOUNT_TIERS_ID ');
         SQL.Add(               ' and sysdate between NVL(b2.effect_date, sysdate - 36500) and NVL(b2.deactive_date, sysdate + 36500) ');
         SQL.Add(IQFormat(      ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b2.id) = 1 ' , [AArcustoId]));
         SQL.Add(               ' and B2.AR_DISCOUNT_TIERS_ID = T2.ID');
         SQL.Add(IQFormat(      ' and L2.AR_DISCOUNT_WATERFALL_ID = %.0f', [AWaterfallId]));
         SQL.Add(               ' and L2.QUAN_LEVEL = B2.QUAN_LEVEL');
         SQL.Add( IQFormat(     'and (L2.QUAN <= %f', [AQty]));
         SQL.Add(                    'or L2.QUAN ='                                     );
         SQL.Add(                           '(select Min( L3.QUAN ) '                        );
         SQL.Add(                           'from AR_DISCOUNT_AGGREGATE B3,'    );
         SQL.Add(                               ' AR_DISCOUNT_WATERFALL_LEVELS L3,'    );
         SQL.Add(                               ' AR_DISCOUNT_TIERS T3'    );
         SQL.Add(                          ' where T3.ID = B1.AR_DISCOUNT_TIERS_ID ');
         SQL.Add(                          ' and sysdate between NVL(b3.effect_date, sysdate - 36500) and NVL(b3.deactive_date, sysdate + 36500) ');
         SQL.Add(IQFormat(                 ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1 ' , [AArcustoId]));
         SQL.Add(                          ' and B3.AR_DISCOUNT_TIERS_ID = T3.ID');
         SQL.Add(IQFormat(                 ' and L3.AR_DISCOUNT_WATERFALL_ID = %.0f', [AWaterfallId]));
         SQL.Add(                          ' and L3.QUAN_LEVEL = B3.QUAN_LEVEL)))');
  //       SQL.Add( IqFormat('and %f >= (select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f)', [AQty, FAR_DISCOUNT_TIERS_ID]));
         Open;
         Result:= 0;
         if not Eof then
         begin
           if Fields[ 0 ].asFloat <> -10000000000 then
           begin
             aDiscount := Fields[ 0 ].asFloat;
             Result := APriceBreak * (1 - aDiscount / 100);
             Exit;
           end;
         end;
      finally
        Free;
      end;

    with TFDQuery.Create(nil) do
    try
       Connection := UniMainModule.FDConnection1;
       SQL.Add( 'select NVL(B1.discount_price, -10000000000) '                                      );
       SQL.Add( 'from AR_DISCOUNT_AGGREGATE B1'      );
       SQL.Add(            ' where sysdate between NVL(b1.effect_date, sysdate - 36500) and NVL(b1.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b1.id) = 1 ' , [AArcustoId]));
       SQL.Add( IQFormat( ' and B1.AR_DISCOUNT_TIERS_ID = %f', [FAR_DISCOUNT_TIERS_ID]));
       SQL.Add(            'and B1.quan = ('                                              );
       SQL.Add(                'select Max(B2.QUAN)'                                      );
       SQL.Add(                'from AR_DISCOUNT_AGGREGATE B2' );
       SQL.Add(            ' where sysdate between NVL(b2.effect_date, sysdate - 36500) and NVL(b2.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b2.id) = 1 ' , [AArcustoId]));
       SQL.Add(               ' and B1.AR_DISCOUNT_TIERS_ID = B2.AR_DISCOUNT_TIERS_ID');
       SQL.Add( IQFormat(         'and (B2.QUAN <= %f', [AQty]));
       SQL.Add(                        'or B2.QUAN ='                                     );
       SQL.Add(                           '(select Min( B3.QUAN )'                        );
       SQL.Add(                           'from AR_DISCOUNT_AGGREGATE B3'    );
       SQL.Add(            ' where sysdate between NVL(b3.effect_date, sysdate - 36500) and NVL(b3.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1 ' , [AArcustoId]));
       SQL.Add(                      ' and B1.AR_DISCOUNT_TIERS_ID = B3.AR_DISCOUNT_TIERS_ID)))');
//       SQL.Add( IqFormat('and %f >= (select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f)', [AQty, FAR_DISCOUNT_TIERS_ID]));
       Open;
       Result:= 0;
       if not Eof then
       begin
         if Fields[ 0 ].asFloat <> -10000000000 then
         begin
           aDiscount_price := Fields[ 0 ].asFloat;
           Result := aDiscount_price;
           Exit;
         end;
       end;
    finally
      Free;
    end;

    with TFDQuery.Create(nil) do
    try
       Connection := UniMainModule.FDConnection1;
       SQL.Add( 'select NVL(B1.discount, -10000000000) '                                      );
       SQL.Add( 'from AR_DISCOUNT_AGGREGATE B1'      );
       SQL.Add(            ' where sysdate between NVL(b1.effect_date, sysdate - 36500) and NVL(b1.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b1.id) = 1 ' , [AArcustoId]));
       SQL.Add( IQFormat( ' and B1.AR_DISCOUNT_TIERS_ID = %f', [FAR_DISCOUNT_TIERS_ID]));
       SQL.Add(            'and B1.quan = ('                                              );
       SQL.Add(                'select Max(B2.QUAN)'                                      );
       SQL.Add(                'from AR_DISCOUNT_AGGREGATE B2' );
       SQL.Add(            ' where sysdate between NVL(b2.effect_date, sysdate - 36500) and NVL(b2.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b2.id) = 1 ' , [AArcustoId]));
       SQL.Add(               ' and B1.AR_DISCOUNT_TIERS_ID = B2.AR_DISCOUNT_TIERS_ID');
       SQL.Add( IQFormat(         'and (B2.QUAN <= %f', [AQty]));
       SQL.Add(                        'or B2.QUAN ='                                     );
       SQL.Add(                           '(select Min( B3.QUAN )'                        );
       SQL.Add(                           'from AR_DISCOUNT_AGGREGATE B3'    );
       SQL.Add(            ' where sysdate between NVL(b3.effect_date, sysdate - 36500) and NVL(b3.deactive_date, sysdate + 36500) ');
       SQL.Add(IQFormat(' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1 ' , [AArcustoId]));
       SQL.Add(                      ' and B1.AR_DISCOUNT_TIERS_ID = B3.AR_DISCOUNT_TIERS_ID)))');
//       SQL.Add( IqFormat('and %f >= (select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f)', [AQty, FAR_DISCOUNT_TIERS_ID]));
       Open;
       Result:= 0;
       if not Eof then
       begin
         aDiscount := Fields[ 0 ].asFloat;
         Result := APriceBreak * (1 - aDiscount / 100);
         Exit;
       end
    finally
      Free;
    end;
    Result := APriceBreak * (1 - ADtlDiscount / 100);
  end
  else
    Result := APriceBreak * (1 - ADtlDiscount / 100);
end;

function GetTierDiscountByItemType(AItemTypeID, AArcustoID: Real): Real;
var
  ACust_Type_ID: Real;
begin
  Result := SelectValueFmtAsFloat(
    'SELECT get_item_type_tier_discount(%d, %d) FROM DUAL ',
    [Trunc(AItemTypeID), Trunc(AArcustoID)]);
{
  // first try finding tier by cust# and item type
  Result := SelectValueFmtAsFloat('SELECT a.discount'#13 +
    '  FROM ar_discount_tiers a'#13 +
    ' WHERE a.arcusto_id = %.0f AND'#13 +
    '       NVL(a.aggregate, ''N'') = ''N'' AND'#13 +
    '       a.item_type_id = %.0f AND'#13 +
    '       ROWNUM < 2',
    [AArcustoID, AItemTypeID]);
  if Result > 0 then
    Exit;

  // now try finding the tier by cust type and item type
  ACust_Type_ID := SelectValueByID('cust_type_id', 'arcusto', AArcustoID);
  if ACust_Type_ID = 0 then
    Exit;

  Result := SelectValueFmtAsFloat('SELECT a.discount'#13 +
    '  FROM ar_discount_tiers a'#13 +
    ' WHERE a.cust_type_id = %.0f AND'#13 +
    '       NVL(a.aggregate, ''N'') = ''N'' AND'#13 +
    '       a.item_type_id = %.0f AND'#13 +
    '       ROWNUM < 2',
    [ACust_Type_ID, AItemTypeID]);
}
end;

function CheckCreditLimit(Arcusto_id, AOrderAmount:Real; AProcOverdue, AProcOverdueInv:TFDStoredProc):Boolean;
var
  ADays:Integer;
  APS, ASo:String;
  AQry:TFDQuery;
  APackSlips, AReleases:Real;
  ACurrent:Real;
  ACurrent2:Real;
  AProc:TFDStoredProc;
  ACurr, ATotalToPay, ACreditLimit, AOpenToBuy:Real;
  AType:Integer;
  AConfirm:Integer;
  AStr:String;
  ANotInvoiced:Real;
  ANotInvoiced2:Real;
  ANotInvoiced3:Real;
  APackSlips2:Real;
  APackSlips3:Real;
  i: Integer;
begin
  Result := True;
  if SelectValueFmtAsString('select NVL(CREDIT_LIMIT_AUTOCALC, ''N'') from arcusto where id = %f', [Arcusto_id]) = 'Y' then
  try
    AQry := TFDQuery.Create(nil);
    try
      AQry.Connection := UniMainModule.FDConnection1;
      AQry.Sql.Add(IqFormat('select NVL(CUST_CREDIT_DAYS, 0) as CUST_CREDIT_DAYS, NVL(credit_limit, 0) as credit_limit, decode(credit_limit, null, ''N'', ''Y'') as credit_limit_exists, ' +
                   ' NVL(CUST_CREDIT_INCL_SHIP, ''N'') as CUST_CREDIT_INCL_SHIP, NVL(CUST_CREDIT_INCL_SO, ''N'') as CUST_CREDIT_INCL_SO ' +
                   ' from arcusto where id = %f', [Arcusto_id]));
      AQry.Open;
      if Aqry.FieldByName('credit_limit_exists').asString = 'N' then exit;
      ACreditLimit := AQry.FieldByName('CREDIT_LIMIT').asFloat;
      ADays := Trunc(AQry.FieldByName('CUST_CREDIT_DAYS').asFloat);
      APS   := AQry.FieldByName('CUST_CREDIT_INCL_SHIP').asString;
      ASO   := AQry.FieldByName('CUST_CREDIT_INCL_SO').asString;
    finally
      AQry.Free;
    end;



    //AProcOverdue.CopyParams(AProcOverdueInv.Params);
    AProcOverdue.Prepare;
    CopyParams(AProcOverdueInv, AProcOverdue);
    AType := 0;
    if IQRegIntegerScalarRead( nil, 'CUSTAT_AGING', AType ) then
    begin
      if AType = 0 then
        AProc := AProcOverdue
      else
        AProc := AProcOverdueInv;
    end
    else
      AProc := AProcOverdue;

    with AProc do
    begin
      Prepare;
      ParamByName('v_arcusto_id').Value := Arcusto_id;
      ExecProc;

      ACurr     := ParamByName('v_current').asFloat;
      ATotalToPay  := ParamByName('v_total_to_pay').asFloat;
    end;

    APackSlips := 0;
    ANotInvoiced := 0;
    APackSlips2 := 0;
    APackSlips3 := 0;
    ANotInvoiced2 := 0;
    ANotInvoiced3 := 0;
    if APS = 'Y' then
    begin

      APackSlips3 := SelectValueFmtAsFloat('select Sum(NVL(qtyshipped, 0) * NVL(unit_price, 0)) ' +
                              '  from c_ship_hist                              ' +
                              ' where sign( case when vmi = ''Y'' and vmi_invoice_on_ship = ''Y'' then nvl(vmi_consumed, 0) ' +
                              '       else nvl(qtyshipped, 0) ' +
                              '       end                     ' +
                              '  - nvl(invoiced_qty, 0) - nvl(pending_invoiced_qty, 0)) = 1 ' +
                              '   and NVL(to_invoice, ''Y'') = ''Y''                 ' +
                              '   and NVL(pending_invoiced_qty, 0) = 0               ' +
                              '   and arcusto_id = %f                                ' +
                              '   and not exists(select id from arprepost_detail where shipment_dtl_id = shipment_dtl_id) ' +
                              '   and not exists(select id from arinvoice_detail where shipment_dtl_id = shipment_dtl_id) ' +
                              '   and not exists(select id from arprepost_detail where ord_detail_id = ord_detail_id) ' +
                             '   and not exists(select id from arinvoice_detail where ord_detail_id = ord_detail_id) ' +
                              '   and (vmi = ''N'' or (vmi = ''Y'' and NVL(vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                              [Arcusto_id]);


        APackSlips := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(a.unit_price, 0)) ' +
                              '  from c_ship_hist v,                             ' +
                              '       arinvoice_detail a                          ' +
                              ' where sign( case when v.vmi = ''Y'' and v.vmi_invoice_on_ship = ''Y'' then nvl(v.vmi_consumed, 0) ' +
                              '       else nvl(v.qtyshipped, 0) ' +
                              '       end                     ' +
                              '  - nvl(v.invoiced_qty, 0) - nvl(v.pending_invoiced_qty, 0)) = 1 ' +
                              '   and NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                              '   and v.shipment_dtl_id = a.shipment_dtl_id         ' +
                              '   and NVL(v.pending_invoiced_qty, 0) = 0               ' +
                              '   and v.arcusto_id = %f                                ' +
                              '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(v.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                              [Arcusto_id]);


        ANotInvoiced := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(pa.unit_price, 0)) ' +
                                '  from v_shipments_short v,                             ' +
                                '       ship_to s,                                       ' +
                                '       arprepost_detail pa                              ' +
                                ' where NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                                '   and v.shipment_dtl_id = pa.shipment_dtl_id           ' +
                                '   and v.arcusto_id = %f                                ' +
                                '   and v.ship_to_id = s.id(+)                           ' +
                                '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                                [Arcusto_id]);

        APackSlips2 := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(a.unit_price, 0)) ' +
                              '  from c_ship_hist v,                             ' +
                              '       arinvoice_detail a                          ' +
                              ' where sign( case when v.vmi = ''Y'' and v.vmi_invoice_on_ship = ''Y'' then nvl(v.vmi_consumed, 0) ' +
                              '       else nvl(v.qtyshipped, 0) ' +
                              '       end                     ' +
                              '  - nvl(v.invoiced_qty, 0) - nvl(v.pending_invoiced_qty, 0)) = 1 ' +
                              '   and NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                              '   and v.ord_detail_id = a.ord_detail_id                ' +
                              '   and a.shipment_dtl_id is null                        ' +
                              '   and NVL(v.pending_invoiced_qty, 0) = 0               ' +
                              '   and v.arcusto_id = %f                                ' +
                              '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(v.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                              [Arcusto_id]);


        ANotInvoiced2 := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(pa.unit_price, 0)) ' +
                                '  from v_shipments_short v,                             ' +
                                '       arprepost_detail pa                              ' +
                                ' where NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                                '   and v.ord_detail_id = pa.ord_detail_id               ' +
                                '   and pa.shipment_dtl_id is null                        ' +
                                '   and v.arcusto_id = %f                                ' +
                                '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(v.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                                [Arcusto_id]);

        ANotInvoiced3 := SelectValueFmtAsFloat('select Sum(NVL(pa.invoice_qty, 0) * NVL(pa.unit_price, 0)) ' +
                                '  from arprepost v,                                 ' +
                                '       arprepost_detail pa                          ' +
                                ' where NVL(pa.shipment_dtl_id, 0) = 0               ' +
                                '   and NVL(pa.ord_detail_id, 0) = 0                 ' +
                                '   and v.arcusto_id = %f                            ' +
                                '   and v.id = pa.arprepost_id(+)',
                                [Arcusto_id]);

    end;

    AReleases := 0;
    if ASO = 'Y' then
    begin
      AReleases := SelectValueFmtAsFloat('select sum((NVL(r.quan, 0) - NVL(shipped_quan, 0)) * NVL(r.unit_price, d.unit_price)) ' +
                             '   from releases r,                                  ' +
                             '        ord_detail d,                                ' +
                             '        orders o                                     ' +
                             '  where r.ord_detail_id = d.id                       ' +
                             '    and d.orders_id = o.id                           ' +
                             '    and o.arcusto_id = %f                            ' +
                             '    and NVL(r.shipped_quan, 0) < NVL(r.quan, 0)      ' +
                             '    and r.request_date <= trunc(sysdate) + %d',
                             [Arcusto_id, ADays]);
    end;


    ACurrent2 := AOrderAmount;


    ACurrent := AReleases + ATotalToPay + APackSlips + ANotInvoiced + APackSlips3 + APackSlips2 + ANotInvoiced2 + ANotInvoiced3 + ACurrent2;
    AOpenToBuy := ACreditLimit - ACurrent;
    if SelectValueFmtAsString('select status_id from arcusto where id = %f', [Arcusto_id]) <> 'Cr Hold' then
      if (AOpenToBuy < 0) then
      begin
        AStr := oe_rscstr.cTXT0000065 + #13#13 +
                Format(cTXT0000093 {'Total:  %m'}       , [ATotalToPay + APackSlips + ANotInvoiced + APackSlips3 + APackSlips2 + ANotInvoiced2 + ANotInvoiced3]) + #13 +
                Format(cTXT0000112, [ACurrent2]) + #13 +
                Format(cTXT0000095 {'Credit Limit: %m'} , [ACreditLimit]) + #13 +
                Format(cTXT0000096 {'Open to buy: %m'}  , [AOpenToBuy]);
      { TODO : OECheckCrLimit has a no web conversion tag }
      //  AConfirm := IQDialogChkEx( TCheckOECreditLimit, AStr, 'OE_CreditLimitCheck' ); // IQMS.Common.Dialogs.pas


        if AConfirm = 2 then
        begin
          ExecuteCommandFmt('update arcusto set status_id = ''Cr Hold'' where id = %f', [Arcusto_id]);
          IQWarning( Format(oe_rscstr.cTXT0000113, ['Cr Hold']) );
        end;

        Result := (AConfirm = 1);

      end;
  except;
    Result := False;
    raise;
  end;
end;

function MultiCurrencyEnabled: Boolean;
begin
  Result := SelectValueAsString('SELECT NVL(multicurrency, ''N'') ' +
    'FROM iqsys WHERE ROWNUM < 2') = 'Y';
end;

function CustomerDiscountComparison: Boolean;
begin
  try
    Result := SelectValueAsString('SELECT NVL(cust_disc_perc_comp, ''N'') ' +
     'FROM iqsys2 WHERE ROWNUM < 2') = 'Y';
  except
    Result := False;
  end;
end;

procedure CheckMinOrderQty(AArcustoID, AArinvtId, ACurrencyID,
  AARDiscountTeirsID: Real; Qty_Ord: Real; const cTable, cIdField: string;
  nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real);
var
  nMinQty, aMinQtyAggr: Real;
  AQty: Real;
  AItemInfo: string;
begin
  if Qty_Ord = 0 then
    Exit;

  AQty := Trunc(IQConvertUOM(Qty_Ord, Act_UOM, Std_UOM, AArinvt_ID) * 100) /
    100; { IQProc }

  AItemInfo:= Format(oe_rscstr.cTXT0000147, [SelectValueByID('rtrim(itemno)', 'arinvt', AArinvt_ID)]);  // 'Item #: %s'#13#13;

  if cTable = 'ARINVT_BREAKS' then
    begin
      if MultiCurrencyEnabled then
        begin
          if SelectValueFmtAsFloat
            ('select id from arinvt_breaks where arinvt_id = %f and ' +
            'currency_id = %f and NVL(buying, ''N'') = ''N'' ' +
            'and sysdate between NVL(effect_date, sysdate - 36500) and ' +
            'NVL(deactive_date, sysdate + 36500)',
            [AArinvtId, ACurrencyID]) <> 0 then
            nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
              'and sysdate between NVL(effect_date, sysdate - 36500) and ' +
              'NVL(deactive_date, sysdate + 36500) ' +
              'and NVL(buying, ''N'') = ''N'' and currency_id = %f',
              [cTable, cIdField, nId, ACurrencyID])
          else
            nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
              'and sysdate between NVL(effect_date, sysdate - 36500) and ' +
              'NVL(deactive_date, sysdate + 36500) ' +
              'and NVL(buying, ''N'') = ''N''', [cTable, cIdField, nId]);
        end
      else
        nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
          'and sysdate between NVL(effect_date, sysdate - 36500) and ' +
          'NVL(deactive_date, sysdate + 36500) ' +
          'and NVL(buying, ''N'') = ''N''', [cTable, cIdField, nId]);
    end
  else begin
      nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
        'and sysdate between NVL(effect_date, sysdate - 36500) and ' +
        'NVL(deactive_date, sysdate + 36500)',
        [cTable, cIdField, nId]);
    end;

  aMinQtyAggr := SelectValueFmtAsFloat
    ('select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where ' +
    'B3.AR_DISCOUNT_TIERS_ID = %f ' +
    ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1',
    [AARDiscountTeirsID, AArcustoID]);

  // 11/04/2014 (Byron) Modified the confirmation Vcl.Dialogs.  The Vcl.Dialogs
  // must have security (no checkbox). If cancelled, processing is aborted.
  // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
  // 12/02/2014 (Byron) Structured the "if" statements so that if the user
  // answers OK to the dialog, even if the second condiction is met
  // (aMinQtyAggr), the prompt will not display a second time.
  if (AQty < nMinQty) then
    begin
      // oe_rscstr.cTXT0000149 =
      // 'The selected quantity (%f %s) is less than the minimum ' +
      // 'quantity (%f %s) in the Quantity/Price breaks table (%s).  Do you ' +
      // 'want to continue?';
      if not IQMS.Common.Dialogs.IQConfirmYNWithSecurity(
        AItemInfo +
        Format(oe_rscstr.cTXT0000149,
        [Qty_Ord, Act_UOM, nMinQty, Std_UOM, cTable]),
        'OE_SelQty_Less_Than_MinQty', False) then
        System.SysUtils.Abort;
    end
  else if (AQty < aMinQtyAggr) then
    begin
      // oe_rscstr.cTXT0000149 =
      // 'The selected quantity (%f %s) is less than the minimum ' +
      // 'quantity (%f %s) in the Quantity/Price breaks table (%s).  Do you ' +
      // 'want to continue?';
      if not IQMS.Common.Dialogs.IQConfirmYNWithSecurity(
        AItemInfo +
        Format(oe_rscstr.cTXT0000149,
        [Qty_Ord, Act_UOM, aMinQtyAggr, Std_UOM, 'AR_DISCOUNT_AGGREGATE']),
        'OE_SelQty_Less_Than_MinQty', False) then
        System.SysUtils.Abort;
    end;
end;

procedure CheckMinOrderQtyAggr(AArcustoID, AARDiscountTeirsID: Real;
  Qty_Ord: Real; const cTable, cIdField: string; nId: Real;
  Act_UOM, Std_UOM: string; AArinvt_ID: Real);
var
  aMinQtyAggr: Real;
  AQty: Real;
  AItemInfo: string;
begin
  if Qty_Ord = 0 then
    Exit;

  AQty := Trunc(IQConvertUOM(Qty_Ord, Act_UOM, Std_UOM, AArinvt_ID) * 100) /
    100; { IQProc }

  AItemInfo:= Format(oe_rscstr.cTXT0000147, [SelectValueByID('rtrim(itemno)', 'arinvt', AArinvt_ID)]);  // 'Item #: %s'#13#13;

  aMinQtyAggr := SelectValueFmtAsFloat(
    'select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 ' +
    'where B3.AR_DISCOUNT_TIERS_ID = %f ' +
    ' and oe_misc.Filter_Tier_Based_On_Currency(%f, b3.id) = 1',
    [AARDiscountTeirsID, AArcustoID]);


  // aMinQtyAggr := SelectValueFmtAsFloat('select Min(B3.QUAN) from AR_DISCOUNT_AGGREGATE B3 where B3.AR_DISCOUNT_TIERS_ID = %f', [FAR_DISCOUNT_TIERS_ID]);

  // 11/04/2014 (Byron) Modified the confirmation Vcl.Dialogs.  The Vcl.Dialogs
  // must have security (no checkbox). If cancelled, processing is aborted.
  // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
  if (AQty < aMinQtyAggr) and
    // oe_rscstr.cTXT0000149 =
    // 'The selected quantity (%f %s) is less than the minimum ' +
    // 'quantity (%f %s) in the Quantity/Price breaks table (%s).  Do you ' +
    // 'want to continue?';
    not IQMS.Common.Dialogs.IQConfirmYNWithSecurity(
    AItemInfo +
    Format(oe_rscstr.cTXT0000149,
    [Qty_Ord, Act_UOM, aMinQtyAggr, Std_UOM, 'AR_DISCOUNT_AGGREGATE']),
    'OE_SelQty_Less_Than_MinQty', False) then
    System.SysUtils.Abort;
end;

function PromptChangeUnitPrice(const AKey: string): Boolean;
begin
  // oe_rscstr.cTXT0000097 =
  // 'The blanket quantity has changed. Update the unit price?'
  Result := IQMS.Common.Dialogs.IQConfirmYNWithSecurity(oe_rscstr.cTXT0000097, AKey, True);
end;

function GetLotCharge(const AArcustoID, AShipToID, AArinvtID, AAkaID: Real): Real;
begin
  Result := SelectValueFmtAsFloat(
    'SELECT oe_misc.get_lot_charge(%.0f, %.0f, %.0f, %.0f) AS l_val FROM DUAL',
    [AArcustoID, AShipToID, AArinvtID, AAkaID]);
end;

function IsLotCharge(ArcustoId, AShip_To_ID, ArinvtId: Real;
  var ALotCharge: Real): Boolean;
var
  AkaId: Real;
begin
  // Note:  If changes are made to the business rules in this method,
  // also check GetLotCharge, which uses package procedure,
  // OE_MISC.GET_LOT_CHARGE.

  Result := False;
  ALotCharge := 0;
  AkaId := SelectValueFmtAsFloat
    ('select id from aka where arcusto_id = %f and arinvt_id = %f ' +
    '   and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
    [ArcustoId, ArinvtId, ArcustoId, AShip_To_ID]);

  if AkaId = 0 then
    begin
      Result := SelectValueFmtAsString
        ('select NVL(use_lot_charge, ''N'') from arinvt where id = %f',
        [ArinvtId]) = 'Y';
      if Result then
        ALotCharge := SelectValueFmtAsFloat('select lot_charge from arinvt where id = %f',
          [ArinvtId]);
    end
  else begin
      Result := SelectValueFmtAsString
        ('select NVL(use_lot_charge, ''N'') from aka where id = %f',
        [AkaId]) = 'Y';
      if not Result then
        begin
          Result := SelectValueFmtAsString
            ('select NVL(use_lot_charge, ''N'') from arinvt where id = %f',
            [ArinvtId]) = 'Y';
          if Result then
            ALotCharge :=
              SelectValueFmtAsFloat('select lot_charge from arinvt where id = %f',
              [ArinvtId]);
        end
      else begin
          ALotCharge :=
            SelectValueFmtAsFloat('select lot_charge from aka where id = %f', [AkaId]);
          if ALotCharge = 0 then
            ALotCharge :=
              SelectValueFmtAsFloat('select lot_charge from arinvt where id = %f',
              [ArinvtId]);
        end;
    end;
end;

function GetSuggestedMultipleOfQuantity(const AArcustoID, AArinvtId,
  AQuantityEntered, AUOMFactor: Real; var AMultiplesOf,
  ASuggestedQuantity: Real): Boolean;
var
  S: string;
  AMod: Real;
  AFactor: Real;
  AItemno: string;
  AAkaID: Real;
  AMinSellQty: Real;
begin
  AMultiplesOf := 0;
  ASuggestedQuantity := AQuantityEntered;

  AMinSellQty := GetMinSellQty(AArinvtId, AArcustoID);
  if ASuggestedQuantity < AMinSellQty then
     ASuggestedQuantity := AMinSellQty;

  AAkaID := SelectValueFmtAsFloat(
    'SELECT id FROM aka WHERE arcusto_id = %.0f AND arinvt_id = %.0f',
    [AArcustoID, AArinvtId]);

  if AAkaID > 0 then
    AMultiplesOf := SelectValueFmtAsFloat('SELECT multiple FROM aka WHERE id = %.0f',
      [AAkaID]);

  if AMultiplesOf = 0 then
    AMultiplesOf := SelectValueFmtAsFloat('SELECT multiple FROM arinvt WHERE id = %.0f',
      [AArinvtId]);

  if (AMultiplesOf = 0) and (AQuantityEntered = ASuggestedQuantity) then
    Exit(False);

  AFactor := AUOMFactor;
  if AFactor = 0 then
    AFactor := 1;
  AMultiplesOf := AMultiplesOf / AFactor;
  AMod := Frac(ASuggestedQuantity / AMultiplesOf);
  Result := AMod <> 0;
  if Result then
    begin
      ASuggestedQuantity := (Trunc(ASuggestedQuantity / AMultiplesOf) + 1) *
        AMultiplesOf;
    end;
end;

function CheckModifyMultipleOfQuantity(const AArcustoID, AArinvtId, AQuantityEntered,
  AUOMFactor: Real; var ASuggestedQuantity: Real): Boolean;
var
  AMultiplesOf: Real;
  S: string;
  AMod: Real;
  AFactor: Real;
  AItemno: string;
begin
  // Get the suggested "multiples of" quanity value
  Result := GetSuggestedMultipleOfQuantity(AArcustoID, AArinvtId,
    AQuantityEntered, AUOMFactor, {var} AMultiplesOf,
    {var } ASuggestedQuantity);

  if Result then
    begin
      AItemno := SelectValueFmtAsString('SELECT itemno FROM arinvt WHERE id = %.0f',
        [AArinvtId]);
      // oe_rscstr.cTXT0000038 =
      // 'The release quantity, %f, does not conform to the container
      // (multiples of) release quantity, %f, for Inventory item, %s.'#13
      // 'Would you like to change it to the suggested quantity of, %f?';
      S := Format(oe_rscstr.cTXT0000038, [AQuantityEntered, AMultiplesOf,
        AItemno, ASuggestedQuantity]);
      // IQDialogChkEx is defined in IQMS.Common.Dialogs.
      // TFrmOEConfMultiplesOfViolation is in oe_conf_multiples_of_violation.pas

      { TODO : oe_conf_multiples_of_violation has a no web conversion tag }
     { Result := IQMS.Common.Dialogs.IQDialogChkEx(TFrmOEConfMultiplesOfViolation, S,
        'FrmOEConfMultiplesOfViolation') = 1;    }
    end;
end;

function GetAggregateDiscountPercent(AItemtypeId, ACustTypeId, AQuan:Real; AShipToId:Real = 0):Real;
//var
//  AId:Real;
//  AQty:Real;
//  ACUST_TYPE_ID:Real;
begin
  (* EIQ-6532 Various SQL logic moved out of front end GUI to Oracle stored procedure AMB 03-27-15 *)
  Result:= SelectValueFmtAsFloat('select oe_misc.Get_Aggregate_Discount_Percent( %f, %f, %.6f, %f ) from dual',
           [ AItemtypeId,
             ACustTypeId,
             AQuan,
             AShipToId ]);

(*

  ACUST_TYPE_ID := SelectValueFmtAsFloat('select CUST_TYPE_ID from ship_to where id = %f', [AShipToId]);
  AId := SelectValueFmtAsFloat('select min(id) from AR_DISCOUNT_TIERS where CUST_TYPE_ID = %f ' +
                   'and ITEM_TYPE_ID = %f and NVL(AGGREGATE, ''N'') = ''Y''', [ACUST_TYPE_ID, AItemtypeId]);

  if aId = 0 then
    AId := SelectValueFmtAsFloat('select min(id) from AR_DISCOUNT_TIERS where CUST_TYPE_ID = %f ' +
                     'and ITEM_TYPE_ID = %f and NVL(AGGREGATE, ''N'') = ''Y''', [ACustTypeId, AItemtypeId]);
  if aId = 0 then
  begin
    Result := 0;
    Exit;
  end;

  with TFDQuery.Create(NIL) do
  try
     Connection := MainModule.FDConnection;
     SQL.Add( 'select B1.discount '                                      );
     SQL.Add( 'from AR_DISCOUNT_AGGREGATE B1'      );
     SQL.Add(            ' where sysdate between NVL(b1.effect_date, sysdate - 36500) and NVL(b1.deactive_date, sysdate + 36500) ');
     SQL.Add( IQFormat( ' and B1.AR_DISCOUNT_TIERS_ID = %f', [AID]));
     SQL.Add(            'and B1.quan = ('                                              );
     SQL.Add(                'select Max(B2.QUAN)'                                      );
     SQL.Add(                'from AR_DISCOUNT_AGGREGATE B2' );
     SQL.Add(            ' where sysdate between NVL(b2.effect_date, sysdate - 36500) and NVL(b2.deactive_date, sysdate + 36500) ');
     SQL.Add(               ' and B1.AR_DISCOUNT_TIERS_ID = B2.AR_DISCOUNT_TIERS_ID');
     SQL.Add( IQFormat(         'and (B2.QUAN <= %f', [AQuan]));
     SQL.Add(                        'or B2.QUAN ='                                     );
     SQL.Add(                           '(select Min( B3.QUAN )'                        );
     SQL.Add(                           'from AR_DISCOUNT_AGGREGATE B3'    );
     SQL.Add(            ' where sysdate between NVL(b3.effect_date, sysdate - 36500) and NVL(b3.deactive_date, sysdate + 36500) ');
     SQL.Add(                      ' and B1.AR_DISCOUNT_TIERS_ID = B3.AR_DISCOUNT_TIERS_ID)))');
     SQL.Add( IqFormat('and %f >= (select Min(B4.QUAN) from AR_DISCOUNT_AGGREGATE B4 where B4.AR_DISCOUNT_TIERS_ID = %f and sysdate between NVL(b4.effect_date, sysdate - 36500) and NVL(b4.deactive_date, sysdate + 36500))', [AQuan, AID]));
     Open;
     Result:= 0;
     if not Eof then
        Result:= Fields[ 0 ].asFloat;
  finally
    Free; // free TFDQuery
  end;
  *)
end;

function GetSuggestedFreightID(const AArcustoID, AShipToID: Int64;
  var AFreightID: Int64; var ACarrierAccountNumber: string): Boolean;
begin
  Result := False;
  AFreightID := 0;
  ACarrierAccountNumber := '';
  with TFDStoredProc.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      StoredProcName := 'IQMS.OE_MISC.GET_SUGGESTED_FREIGHT_ID';
      // Get values
      Prepare;
      ParamByName('p_arcusto_id').Value := AArcustoID;
      ParamByName('p_ship_to_id').Value := AShipToID;
      ExecProc;
      // Apply values
      AFreightID := ParamByName('p_freight_id').AsLargeInt;
      ACarrierAccountNumber := ParamByName('p_carrier_account').AsString;
    finally
      Free;
    end;
  Result := (AFreightID > 0);
end;

function GetCarrierAccountNumber(const AArcustoID, AShipToID,
  AFreightID: Real): string;
begin
  Result := SelectValueFmtAsString(
    'SELECT oe_misc.get_carrier_account_number(%.0f, %.0f, %.0f) ' +
    'FROM DUAL', [AArcustoID, AShipToID, AFreightID]);
end;

function GetUOMQty(AQty: Real; ArinvtId:Real; ADetailOUM: string):Real;
var
  AArinvtUOM: string;
begin
  AArinvtUOM := SelectValueFmtAsString('select unit from arinvt where id = %f', [ArinvtId]);

  Result := IQConvertUOM(AQty, ADetailOUM, AArinvtUOM, ArinvtId);

//  result := SelectValueFmtAsFloat('select oe_misc.GetUOMQty(%.6f, %f, %f) from dual', [AQty, AOrd_detail_id, ArinvtId]);
end;

function GetSalesMargin(const AUnitPrice: Real; const AArinvtID: Real): Real;
var
  AStdCost: Real;
begin
  Result := 0;
  if AUnitPrice > 0 then
    begin
      AStdCost := SelectValueFmtAsFloat(
              'SELECT std_cost FROM arinvt WHERE id = %.0f',
              [AArinvtID]);
      Result := ((AUnitPrice - AStdCost) / AUnitPrice) * 100;
    end;
end;

function MarkupPrice(const AListUnitPrice, APrice: Real; const AMarkupPercentage: Real): Real;
begin
  Result := APrice;
  if AMarkupPercentage > 0 then
    Result := APrice +  (AListUnitPrice * (AMarkupPercentage / 100));
end;

function DiscountPrice(const AListUnitPrice, APrice: Real; const ADiscountPercentage: Real): Real;
begin
  Result := APrice;
  if ADiscountPercentage > 0 then
    Result := APrice -  (AListUnitPrice * (ADiscountPercentage / 100));
end;

function GetMinSellQty(const AArinvtID, AArcustoID: Real): Real;
begin
  // Get the min_sell_qty value, first from AKA, and then if that
  // value is NULL, then get it from ARINVT.
  Result := SelectValueFmtAsFloat(
    'SELECT COALESCE(aka.min_sell_qty,        '#13 +
    '                arinvt.min_sell_qty)     '#13 +
    '          AS min_sell_qty                '#13 +
    '  FROM arinvt, aka                       '#13 +
    ' WHERE arinvt.id = %.0f AND              '#13 +
    '       aka.arinvt_id(+) = arinvt.id AND  '#13 +
    '       aka.arcusto_id(+) = %.0f             ',
    [AArinvtID, AArcustoID]);
end;

function WebPaymentTypeDisplay(const APaymentType: Integer): string;
begin
  Result := '';
  if (APaymentType in [Ord(Low(TWebPaymentType))..Ord(High(TWebPaymentType))]) then
    Result := WebPaymentTypeText[TWebPaymentType(APaymentType)];
end;

function OrderHasConflictingShipViaInReleases(AOrdersID: Real): Boolean;
begin
  Result:=
    SelectValueFmtAsInteger
      ('select pk_tkt_misc.chk_SO_has_shipvia_conflict( %d ) from dual',
        [ Trunc(AOrdersID) ]) > 0;
end;

{$REGION 'TInventoryItemPricing implementation'}

{ TInventoryItemPricingParentRecord }

constructor TInventoryItemPricingParentRecord.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FArcustoID := 0;
  FShipToID := 0;
  FCurrencyID := 0;
  FDiscount := 0;
end;

{ TInventoryItemPricingDetailRecord }

constructor TInventoryItemPricingDetailRecord.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FArinvtID := 0;
  FAKAID := 0;
  FListUnitPrice := 0;
  FUnitPrice := 0;
  FUOM := '';
  FQuantity := 0;
  FAKA_Kind := '';
  FRequestedDate := IQMS.Common.Dates.MinValue;
  FPromisedDate := IQMS.Common.Dates.MinValue;
  FMarkupPercentage := 0;
end;

procedure TInventoryItemPricingDetailRecord.SetAKAID(const Value: Real);
begin
  FAKAID := Value;
  if (FAKA_Kind = '') and (FAKAID > 0) then
    FAKA_Kind := SelectValueFmtAsString('SELECT kind FROM aka WHERE id = %.0f',
      [FAKAID]);
end;

{ TInventoryItemPricing }

constructor TInventoryItemPricing.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FParentRecord := TInventoryItemPricingParentRecord.Create(Self);
  FDetailRecord := TInventoryItemPricingDetailRecord.Create(Self);
  FPriceBreakPer1000 := 0;
  FPriceDiscount := 0;
  FListPriceBreak := 0;
  FPriceBreak := 0;
  FOptions := [ipoPriceCheck, ipoDiscountCheck, ipoPromptIfQtyChanged];
end;

destructor TInventoryItemPricing.Destroy;
begin
  if Assigned(FParentRecord) then
    FreeAndNil(FParentRecord);
  if Assigned(FDetailRecord) then
    FreeAndNil(FDetailRecord);
  inherited Destroy;
end;

function TInventoryItemPricing.Execute: Boolean;
var
  APriceBreak, AListPriceBreak, APriceBreakPer1000, ADiscount: Real;
begin
  Result := Execute(APriceBreak, AListPriceBreak, APriceBreakPer1000, ADiscount);
end;

function TInventoryItemPricing.Execute(var APriceBreak, AListPriceBreak,
  APriceBreakPer1000, ADiscount: Real): Boolean;
begin
  Result := ProcessExec(APriceBreak, AListPriceBreak, APriceBreakPer1000, ADiscount);
end;

function TInventoryItemPricing.ProcessExec(var APriceBreak: Real;
  var AListPriceBreak: Real; var APriceBreakPer1000: Real; var ADiscount: Real): Boolean;
type
  TPriceKind = (pkAKA, pkArinvt, pkDefault);
var
  AUseThisAKAID: Real;
  AUseThisID: Real;
  AFieldName: string;
  ATableName: string;
  APriceKind: TPriceKind;
  APer1000TableName: string;
  ATierDiscount: Real;
  ARate: Real;
  ATempCurrencyID: Real;
  AStdPrice: Real;
  ADetailCurrencyID: Real;
  AAKAPrice: Real;
  ADetailQuantity: Real;

  AArcustoQuantityPriceBreak: Real;
  AUseArcustoQuantity: Boolean;
  ALotCharge: Real;

  AIsBasedOnStandardPrice: string;
  AARDiscountTiersID: Real;
  ADiscountPrice: Real;

  ACalcDetailDiscount: Real;
  AArcustoDiscount: Real;
  AUsingCUST_DISC_PERC_COMP: Boolean;
  ACUST_DISC_PERC_COMPPrice: Real;
  AAKAKind: string;
  AMultiCurrencyEnabled: Boolean;
  ACustomerDiscountComparisonSetting: Boolean;
  AArinvtUOM: string;
  ADialogResult: Boolean;

  aTmpPrice:Real;
  aTmpPrice2:Real;
  ATiersExpired:boolean;
  aTmpAKAId:Real;
  aAKAExpired:boolean;
  aArinvtPriceExpired:boolean;
  ATmpPrice4, ATmpPrice3:Real;

  function _SpotRate(const nCurrencyID: Real): Real;
  begin
    Result := SelectValueFmtAsFloat('select decode(NVL(spot_rate, 0), 0, 1, spot_rate) ' +
      'from currency where id = %.0f', [FParentRecord.CurrencyID]);
    if Result = 0 then
      Result := 1;
  end;

  function _FixDate(const ADateTime: TDateTime): TDateTime;
  begin
    Result := ADateTime;
    if not IQMS.Common.Dates.ValidDate(FDetailRecord.PromisedDate) then
      Result := IQMS.Common.Dates.IQOracleAdjustedDate;
  end;

begin
  //  -----------------------------------------------------------------
  //   DEVELOPER:
  //    This class is used in both Sales Orders and CRM Sales Quotations.
  //
  //    - Please keep this function generic so that it can be used in all areas.
  //    - Do not call SQL that depends on a specific parent or detail table.
  //    - Ensure all areas pass correct values to new properties you may add.
  //  -------------------------------------------------------------------

  // TODO:  For 2016 +, please place most or all of this processing on the
  // back end but without the prompts.  Prompts should be placed first,
  // before any processing.  A separate, dedicated package would be best.

  FPriceBreak := 0;
  FListPriceBreak := 0;
  FPriceBreakPer1000 := 0;
  AAKAPrice := 0;
  FPriceDiscount := 0;
  ADialogResult := True;

  if FDetailRecord.ArinvtId = 0 then
    Exit(False);

  // Populate local variables for reuse.  Some of these query the
  // database, so it is faster to assign local values.
  AMultiCurrencyEnabled := MultiCurrencyEnabled;
  ACustomerDiscountComparisonSetting := CustomerDiscountComparison;
  // Get Inventory item data
  AStdPrice := SelectValueFmtAsFloat('select std_price from arinvt where id = %f',
    [FDetailRecord.ArinvtId]);
  AArinvtUOM := SelectValueFmtAsString('select unit from arinvt where id = %.0f',
    [FDetailRecord.ArinvtId]);

  ADetailQuantity := FDetailRecord.Quantity;

  // 12/07/2015 (Byron, EIQ-8991) Fix null dates.
  FDetailRecord.PromisedDate := _FixDate(FDetailRecord.PromisedDate);
  FDetailRecord.RequestedDate := _FixDate(FDetailRecord.RequestedDate);

  // 10/28/2014 (Byron) Do not exit if quantity is zero because we still
  // need to return the list pricing.  EIQ-4715.
  // if ADetailQuantity = 0 then
  //   Exit;

  { Checl override qty with arcusto.qty_price_break }
  AArcustoQuantityPriceBreak := SelectValueByID('qty_price_break', 'arcusto',
    FParentRecord.ArcustoId);
  AUseArcustoQuantity := False;
  if AArcustoQuantityPriceBreak > 0 then
    begin
      ADetailQuantity := AArcustoQuantityPriceBreak;
      AUseArcustoQuantity := True;
    end;

  ARate := 1;
  ADetailCurrencyID := 0;
  if AMultiCurrencyEnabled then
    if FParentRecord.CurrencyID <> 0 then
      ARate := _SpotRate(FParentRecord.CurrencyID);
  if ARate = 0 then
    ARate := 1;

  AAKAKind := FDetailRecord.AKA_Kind;
  if AAKAKind = '' then
    AAKAKind := '@!@$$^&&^$#**';

  { Determine Unit Price Source - Arinvt or AKA }
  if FDetailRecord.AKAID > 0 then
    AUseThisAKAID := FDetailRecord.AKAID
  else
    AUseThisAKAID := SelectValueFmtAsFloat(
      'select id from aka where arcusto_id = %f and arinvt_id = %f ' +
      ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1 ' +
      ' and NVL(kind, ''@!@$$^&&^$#**'') = ''%s''' ,
      
      [FParentRecord.ArcustoId, FDetailRecord.ArinvtId, FParentRecord.ArcustoId,
      FParentRecord.ShipToID, StrTran(AAKAKind, '''',
      '''''')]);

    aTmpAKAId := SelectValueFmtAsFloat('select aka_id from aka_breaks where aka_id = %.0f', [AUseThisAKAID]);

    if (aTmpAKAId <> 0) and
    (SelectValueFmtAsFloat('select aka_id from aka_breaks where aka_id = %.0f ' +
      ' and TO_DATE(''%s'', ''MM/DD/RRRR'') between NVL(effect_date, sysdate - 36500) and ' +
      ' NVL(deactive_date, sysdate + 36500)',
      [AUseThisAKAID,
      FormatDateTime('mm/dd/yyyy', FDetailRecord.PromisedDate)]) = 0) then
      aAKAExpired := true;
      

  if (AUseThisAKAID <> 0) and
    (SelectValueFmtAsFloat('select aka_id from aka_breaks where aka_id = %.0f ' +
      ' and TO_DATE(''%s'', ''MM/DD/RRRR'') between NVL(effect_date, sysdate - 36500) and ' +
      ' NVL(deactive_date, sysdate + 36500)',
      [AUseThisAKAID,
      FormatDateTime('mm/dd/yyyy', FDetailRecord.PromisedDate)]) = 0) then
    AUseThisAKAID := 0;


  if (AUseThisAKAID <> 0) and
    (SelectValueFmtAsFloat('select aka_id from aka_breaks where aka_id = %.0f ' +
      ' and TO_DATE(''%s'', ''MM/DD/RRRR'') between NVL(effect_date, sysdate - 36500) and ' +
      ' NVL(deactive_date, sysdate + 36500)', [AUseThisAKAID,
      FormatDateTime('mm/dd/yyyy', FDetailRecord.PromisedDate)]) <> 0) then
    begin
      if AMultiCurrencyEnabled then
        begin
          ATempCurrencyID := SelectValueFmtAsFloat('select currency_id from aka where id = %f',
            [AUseThisAKAID]);
          if (ATempCurrencyID <> 0) and (ATempCurrencyID <> FParentRecord.CurrencyID) and (ARate = 1) then //this was probably erroneously introduced in the P4-55582 change
            ARate := ARate / _SpotRate(ATempCurrencyID);

          if ATempCurrencyID = 0 then
          begin
            ATempCurrencyID := IQMS.Common.Mcshare.GetEplantNativeCurrencyId; { in McShare.pas }
            ADetailCurrencyID := FParentRecord.CurrencyID;
          end;  

          // 09/01/2009 Compare currency code
          if IQMS.Common.Mcshare.GetCurrencyCode(ATempCurrencyID) = IQMS.Common.Mcshare.GetCurrencyCode(FParentRecord.CurrencyID) then
            ARate := 1;
        end;

      APriceKind := pkAKA;
      AUseThisID := AUseThisAKAID;
      AFieldName := 'AKA_ID';
      ATableName := 'AKA_BREAKS';
      APer1000TableName := 'AKA';
    end

  else if SelectValueFmtAsFloat('select arinvt_id from arinvt_breaks ' +
    'where arinvt_id = %f and NVL(buying, ''N'') = ''N''',
    [FDetailRecord.ArinvtId]) > 0 then
    begin
      if AMultiCurrencyEnabled then
        begin
          if SelectValueFmtAsFloat('select id from arinvt_breaks where arinvt_id = %.0f ' +
            'and currency_id = %.0f and NVL(buying, ''N'') = ''N'' ' +
            '   and TO_DATE(''%s'', ''MM/DD/RRRR'') between NVL(effect_date, sysdate - 36500) and ' +
            'NVL(deactive_date, sysdate + 36500)',
            [FDetailRecord.ArinvtId, FParentRecord.CurrencyID,
            FormatDateTime('mm/dd/yyyy', FDetailRecord.PromisedDate)]) <> 0 then
            begin
              ARate := 1;
              ADetailCurrencyID := FParentRecord.CurrencyID;
            end
          else
            ADetailCurrencyID := FParentRecord.CurrencyID;
        end;

      APriceKind := pkArinvt;
      AUseThisID := FDetailRecord.ArinvtId;
      AFieldName := 'ARINVT_ID';
      ATableName := 'ARINVT_BREAKS';
      APer1000TableName := 'ARINVT'
    end

  else begin
      APriceKind := pkDefault;
      AUseThisID := FDetailRecord.ArinvtId;
      APer1000TableName := 'ARINVT';
    end;

  AARDiscountTiersID :=
    SelectValueFmtAsFloat('select id from ar_discount_tiers tiers ' +
    'where arinvt_id = %f and arcusto_id = %f and ship_to_id = %f',
    [FDetailRecord.ArinvtId, FParentRecord.ArcustoId, FParentRecord.ShipToId]);

  if AARDiscountTiersID = 0 then
    AARDiscountTiersID :=
      SelectValueFmtAsFloat('select id from ar_discount_tiers tiers ' +
      'where arinvt_id = %f and arcusto_id = %f',
      [FDetailRecord.ArinvtId, FParentRecord.ArcustoId]);
    

  case APriceKind of

    pkAKA, pkArinvt:
      begin
        FPriceBreak := GetPriceBreakUOM(ADetailQuantity, // ADetailQuantity
          AUseThisID, // AFK_ID_Value
          AFieldName, // AFK_ID_FieldName
          ATableName, // ATableName
          FDetailRecord.UOM, AArinvtUOM, FDetailRecord.ArinvtId, 'N',
          ADetailCurrencyID, AUseArcustoQuantity,
          FDetailRecord.PromisedDate, -1);
          
        FArinvtBreaksPriceBreak := FPriceBreak;

        if FPriceBreak = -1 then
        begin

          APriceKind := pkArinvt;
          AUseThisID := FDetailRecord.ArinvtId;
          AFieldName := 'ARINVT_ID';
          ATableName := 'ARINVT_BREAKS';
          APer1000TableName := 'ARINVT';
        

          FPriceBreak := GetPriceBreakUOM(ADetailQuantity, // ADetailQuantity
            AUseThisID, // AFK_ID_Value
            AFieldName, // AFK_ID_FieldName
            ATableName, // ATableName
            FDetailRecord.UOM, AArinvtUOM, FDetailRecord.ArinvtId, 'N',
            ADetailCurrencyID, AUseArcustoQuantity,
            FDetailRecord.RequestedDate, -1);

          aTmpPrice := GetPriceBreakUOMExp(ADetailQuantity, // ADetailQuantity
            AUseThisID, // AFK_ID_Value
            AFieldName, // AFK_ID_FieldName
            ATableName, // ATableName
            FDetailRecord.UOM, AArinvtUOM, FDetailRecord.ArinvtId, 'N',
            ADetailCurrencyID, AUseArcustoQuantity,
            FDetailRecord.RequestedDate, -1);

          aArinvtPriceExpired := (FPriceBreak = -1) and (aTmpPrice <> - 1);
            
          if FPriceBreak = -1 then
          begin
            FPriceBreak := SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [FDetailRecord.ArinvtId]);
            FPriceBreak := IQConvertUom(FPriceBreak, FDetailRecord.UOM, AArinvtUOM, FDetailRecord.ArinvtId);
          end;
        end;
          

        AAKAPrice := FPriceBreak;
        if (AUseThisAKAID = 0) or
          (SelectValueFmtAsFloat('select count(aka_id) from aka_breaks where aka_id = %f',
          [AUseThisAKAID]) = 0) then
          AAKAPrice := 0
        else
          begin
            if FPriceBreak = -1 then
              begin
                AUseThisID := FDetailRecord.ArinvtId;
                AFieldName := 'ARINVT_ID';
                ATableName := 'ARINVT_BREAKS';
                APer1000TableName := 'ARINVT';

                FPriceBreak := GetPriceBreakUOM(ADetailQuantity, // ADetailQuantity
                  AUseThisID, // AFK_ID_Value
                  AFieldName, // AFK_ID_FieldName
                  ATableName, // ATableName
                  FDetailRecord.UOM, AArinvtUOM, FDetailRecord.ArinvtId, 'N',
                  ADetailCurrencyID, AUseArcustoQuantity, 0, -1);

                if FPriceBreak = -1 then
                  begin
                    FPriceBreak :=
                      SelectValueFmtAsFloat('select std_price from arinvt where id = %f',
                      [FDetailRecord.ArinvtId]);
                    FPriceBreak := IQMS.Common.UOM.IQConvertUOM(FPriceBreak,
                      FDetailRecord.UOM,
                      AArinvtUOM, FDetailRecord.ArinvtId);
                  end;
                AAKAPrice := FPriceBreak;
              end;
          end;

        // 11/26/2014 Update the unit price
        if (FDetailRecord.Quantity > 0) and
          (FDetailRecord.Quantity <> FDetailRecord.PriorQuantity) then
          begin
            if (ipoPromptIfQtyChanged in FOptions) then
              ADialogResult := PromptChangeUnitPrice
            else
              ADialogResult := True;
          end;

        if (ipoPriceCheck in FOptions) then
          begin
            // 11/04/2014 Prompt user to change the price here before
            // other prompts.
            // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
            // ADialogResult := PromptChangeUnitPrice;

            // 11/04/2014 If user clicks Cancel on this prompt, then processing
            // is aborted.
            // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
            CheckMinOrderQty(FParentRecord.ArcustoId, FDetailRecord.ArinvtId,
              FParentRecord.CurrencyID,
              AARDiscountTiersID, ADetailQuantity, // Qty_Ord
              ATableName, // ATableName
              AFieldName, // AFieldName
              AUseThisID, // AUseThisID
              FDetailRecord.UOM, AArinvtUOM, FDetailRecord.ArinvtId); // Arinvt_ID
          end;
      end;

    pkDefault:
      begin
        // 11/04/2014 Prompt user to change the price here before
        // other prompts.
        // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
        // 11/26/2014 Update the unit price
        if (FDetailRecord.Quantity > 0) and
          (FDetailRecord.Quantity <> FDetailRecord.PriorQuantity) then
          begin
            if (ipoPromptIfQtyChanged in FOptions) then
              ADialogResult := PromptChangeUnitPrice
            else
              ADialogResult := True;
          end;

        if (ipoPriceCheck in FOptions) then
          begin
            // 11/04/2014 Prompt user to change the price here before
            // other prompts.
            // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
            //ADialogResult := PromptChangeUnitPrice;

            // 11/04/2014 If user clicks Cancel on this prompt, then processing
            // is aborted.
            // EIQ-4722 SO - Security on Sales Order Pop Ups Griffith Rubber CRM#1094446
            CheckMinOrderQtyAggr(FParentRecord.ArcustoId,
              AARDiscountTiersID, ADetailQuantity,
              // Qty_Ord
              ATableName, // ATableName
              AFieldName, // AFieldName
              AUseThisID, // AUseThisID
              FDetailRecord.UOM, // FDetailRecord.UOM
              AArinvtUOM, // AArinvtUOM
              FDetailRecord.ArinvtId); // Arinvt_ID
          end;

        FPriceBreak :=
          IQConvertUOM(SelectValueFmtAsFloat('select std_price from arinvt where id = %f',
          [AUseThisID]), FDetailRecord.UOM, // AFromUOM
          AArinvtUOM, // AToUOM
          FDetailRecord.ArinvtId);
        if (ATiersExpired or aAKAExpired or aArinvtPriceExpired) then
          // oe_rscstr.cTXT0000157 =
          // 'Sales order pricing has expired. Inventory Default Standard ' +
          // 'Item Price will be used instead. Continue?';
          if not IQConfirmYNWithSecurity( oe_rscstr.cTXT0000157,
                                          'OE_PRICE_EXPIRED', true) then
          begin
            FListPriceBreak := 0;
            FPriceBreak := 0;
          end;
          
      end;
  end;

  FListPriceBreak := FPriceBreak;

  AUsingCUST_DISC_PERC_COMP := False;
  if (ipoDiscountCheck in FOptions) and
    (APriceKind in [pkDefault, pkArinvt]) then
    begin
      AArcustoDiscount := SelectValueFmtAsFloat('select discount from arcusto ' +
        'where id = %f', [FParentRecord.ArcustoId]);
      if ACustomerDiscountComparisonSetting and (AArcustoDiscount <> 0) then
        begin
          AUsingCUST_DISC_PERC_COMP := True;
          ACUST_DISC_PERC_COMPPrice :=
            IQConvertUOM(
            SelectValueFmtAsFloat('select std_price - (std_price * %.6f/100) ' +
            'from arinvt where id = %f',
            [AArcustoDiscount, AUseThisID]), FDetailRecord.UOM, // AFromUOM
            AArinvtUOM, // AToUOM
            FDetailRecord.ArinvtId);
          if ACUST_DISC_PERC_COMPPrice < FPriceBreak then
            begin
              FPriceBreak := ACUST_DISC_PERC_COMPPrice;
              FPriceDiscount := AArcustoDiscount;
              // if AArcustoDiscount <> 0 then
              // begin
              // if (ADataSet is TFDQuery) and not TFDQuery(ADataSet).CachedUpdates then
              // ExecuteCommandFmt('update ord_detail set discount = %.6f where id = %f',
              // [ AArcustoDiscount, ADataSet.FieldByName('ID').asFloat ])
              // else
              // ForceValue( ADataSource, ADataSet.FieldByName('DISCOUNT'), AArcustoDiscount );
              // end;
            end;
        end;
    end;

  { Discount }
  AIsBasedOnStandardPrice := 'X';
  AARDiscountTiersID := 0;
  ADiscountPrice := 0;
  ACalcDetailDiscount := 0;

  if not AUsingCUST_DISC_PERC_COMP and
    not ACustomerDiscountComparisonSetting then
    begin
      // If the calling form must use the header (customer) discount,
      // override the calculated value here.  So far, this is only
      // done in CRM Sales Quotations, by request.
      if (ipoUseParentDiscount in Options) and
        (ParentRecord.Discount > 0) then
        ACalcDetailDiscount := ParentRecord.Discount
      // Otherwise, under normal processing, get the tier discount
      else
      begin
        ACalcDetailDiscount := GetTierDiscount2(
          FParentRecord.Discount,
          FParentRecord.ArcustoId,
          FDetailRecord.ArinvtId,
          ADetailQuantity,
          AIsBasedOnStandardPrice,
          AARDiscountTiersID,
          ADiscountPrice,
          AAKAPrice,
          FParentRecord.ShipToId,
          FDetailRecord.PromisedDate); // in oe_share.pas
        end;  
    end;

  // If by this point we have calculated discount, then apply it to
  // the return values.
  if ACalcDetailDiscount <> 0 then
    FPriceDiscount := ACalcDetailDiscount;

  if AIsBasedOnStandardPrice = 'X' then
    begin
      { keep the defaults }
      if FDetailRecord.ListUnitPrice <> 0 then
        begin
          if FPriceBreak = -1 then
            begin
              FListPriceBreak := FDetailRecord.ListUnitPrice;
              FPriceBreak := FDetailRecord.UnitPrice;
            end
          else begin
              if ACalcDetailDiscount <> 0 then
                FPriceBreak := FPriceBreak * (1 - ACalcDetailDiscount / 100);
            end;
        end
      else begin
          // if (ADataSet is TFDQuery) and TFDQuery(ADataSet).CachedUpdates then
          // begin
          if ACalcDetailDiscount <> 0 then
            FPriceBreak := FPriceBreak * (1 - ACalcDetailDiscount / 100);
          // end;
        end
    end

  else if AIsBasedOnStandardPrice = 'Y' then
    begin
      // Feb 1 2007 Z Per Nancy, restored the selection of std_price from
      // arinvt
      AStdPrice := IQConvertUOM(AStdPrice, FDetailRecord.UOM { AFromUOM } ,
        AArinvtUOM { AToUOM } , FDetailRecord.ArinvtId);

      if ADiscountPrice <> - 10000000000 then
        begin
          FListPriceBreak := ADiscountPrice;
          FPriceBreak := ADiscountPrice;
        end
      else begin
       if ACalcDetailDiscount <> 0 then     // The discount came from waterfall
            FListPriceBreak := AStdPrice;
      
{      
          if AStdPrice <> 0 then
            FListPriceBreak := AStdPrice
          else if FListPriceBreak <> 0 then
            AStdPrice := FListPriceBreak;
}
          if not AUsingCUST_DISC_PERC_COMP then
          begin
            ATmpPrice4 := Check_AR_DISCOUNT_TIERS_PriceBreaks(
              FDetailRecord.UOM, AStdPrice,
              ACalcDetailDiscount,
              IQConvertUOM(ADetailQuantity,
                DetailRecord.UOM,
                AArinvtUOM,
                FDetailRecord.ArinvtId),
              AARDiscountTiersID,
              AAKAPrice,
              FParentRecord.ArcustoId,
              FDetailRecord.ArinvtId,
              FParentRecord.ShipToID,
              FDetailRecord.PromisedDate,
              FDetailRecord.Quantity); { in oe_share.pas }

           if ACalcDetailDiscount <> 0 then     // The discount came from waterfall
             FPriceBreak := ATmpPrice4;


            aTmpPrice3 := Check_AR_DISCOUNT_TIERS_PriceBreaksExp(
              FDetailRecord.UOM, AStdPrice,
              ACalcDetailDiscount,
              IQConvertUOM(ADetailQuantity,
                DetailRecord.UOM,
                AArinvtUOM,
                FDetailRecord.ArinvtId),
              AARDiscountTiersID,
              AAKAPrice,
              FParentRecord.ArcustoId,
              FDetailRecord.ArinvtId,
              FParentRecord.ShipToID,
              FDetailRecord.PromisedDate,
              FDetailRecord.Quantity); { in oe_share.pas }

           if ACalcDetailDiscount <> 0 then     // The discount came from waterfall
             ATmpPrice := ATmpPrice3;


//           ATiersExpired := (aTmpPrice <> FPriceBreak);
           ATiersExpired := (aTmpPrice3 <> aTmpPrice4 );
              


              
          end;
        end;
    end

  else begin
      if not AUsingCUST_DISC_PERC_COMP then
      begin
        aTmpPrice2 := FPriceBreak; 
        FPriceBreak := Check_AR_DISCOUNT_TIERS_PriceBreaks(
          FDetailRecord.UOM,
          aTmpPrice2 / ARate,  //pass in currency converted rate for discounting
          ACalcDetailDiscount,
          IQConvertUOM(ADetailQuantity,
            DetailRecord.UOM,
            AArinvtUOM,
            FDetailRecord.ArinvtId),
          AARDiscountTiersID,
          AAKAPrice,
          FParentRecord.ArcustoId,
          FDetailRecord.ArinvtId,
          FParentRecord.ShipToID,
          FDetailRecord.PromisedDate,
          FDetailRecord.Quantity); { in oe_share.pas }

          aTmpPrice := Check_AR_DISCOUNT_TIERS_PriceBreaksExp(
            FDetailRecord.UOM, aTmpPrice2 / ARate,  //pass in currency converted rate for discounting
            ACalcDetailDiscount,
            IQConvertUOM(ADetailQuantity,
              DetailRecord.UOM,
              AArinvtUOM,
              FDetailRecord.ArinvtId),
            AARDiscountTiersID,
            AAKAPrice,
            FParentRecord.ArcustoId,
            FDetailRecord.ArinvtId,
            FParentRecord.ShipToID,
            FDetailRecord.PromisedDate,
            FDetailRecord.Quantity); { in oe_share.pas }

           ATiersExpired := (aTmpPrice <> FPriceBreak);
          
           if not ATiersExpired then
              ARate := 1;  // Rate returned should already be in the correct currency
          
      end;

      if FPriceBreak = - 10000000000 then
        FPriceBreak := FListPriceBreak;
//      else if (ACalcDetailDiscount <> 0) and
//        (SelectValueFmtAsString('select NVL(USE_DISCOUNT_TIER, ''N'') ' +
//        'from arcusto where id = %f',
//        [FParentRecord.ArcustoId]) = 'Y') then
//        FPriceBreak := FPriceBreak * (1 - ACalcDetailDiscount / 100);
    end;

  if IsLotCharge(FParentRecord.ArcustoId, FParentRecord.ShipToID,
    FDetailRecord.ArinvtId, { var } ALotCharge) then
    begin
      FListPriceBreak := 0;
      FPriceBreak := 0;
    end
    else
    begin
      if (not aArinvtPriceExpired) and ATiersExpired and aAKAExpired then
        FPriceBreak := FArinvtBreaksPriceBreak;
      if (FPriceBreak = AStdPrice) and (ATiersExpired or aAKAExpired or aArinvtPriceExpired) then
      begin
        // oe_rscstr.cTXT0000157 =
        // 'Sales order pricing has expired. Inventory Default Standard ' +
        // 'Item Price will be used instead. Continue?';
        if not IQConfirmYNWithSecurity( oe_rscstr.cTXT0000157,
                                        'OE_PRICE_EXPIRED', true) then
        begin
          FListPriceBreak := 0;
          FPriceBreak := 0;
        end;
      end;
    end;

  if DetailRecord.MarkupPercentage > 0 then
    FPriceBreak := MarkupPrice(FListPriceBreak, FPriceBreak, DetailRecord.MarkupPercentage);

  { Per 1000 and List_Unit_Price }
  if SelectValueFmtAsString('select price_per_1000 from %s where id = %f',
    [APer1000TableName, AUseThisID]) = 'Y' then
    begin
      FListPriceBreak := FListPriceBreak / 1000;
      FPriceBreakPer1000 := FPriceBreak;
      FPriceBreak := FPriceBreak / 1000;
    end
  else
    FPriceBreakPer1000 := FPriceBreak * 1000;

  FListPriceBreak := FListPriceBreak / ARate;
  FPriceBreak := FPriceBreak / ARate;
  FPriceBreakPer1000 := FPriceBreakPer1000 / ARate;

  // 05/18/2015 Fix the list price if zero by assigning price value.
  if FListPriceBreak = 0 then
    FListPriceBreak := FPriceBreak;

  // Check the discount for negative
  if (FPriceDiscount < 0) then
    FPriceDiscount := 0
  else if (FListPriceBreak > 0) then
    // 05/18/2015
    //EIQ-5375 SER #6300 - Include the tier Price based on Std. Price to
    // work with the current switch Discount tier price breaks
    FPriceDiscount := Round(( 1 - FPriceBreak / FListPriceBreak ) * 100 * 100) / 100;

  // Check it again for negative
  if (FPriceDiscount < 0) then
    FPriceDiscount := 0;

  // Assign var params from property values
  APriceBreak := FPriceBreak;
  AListPriceBreak := FListPriceBreak;
  APriceBreakPer1000 := FPriceBreakPer1000;
  ADiscount := FPriceDiscount;
  Result := ADialogResult;
end;

{$ENDREGION 'TInventoryItemPricing implementation'}

end.
