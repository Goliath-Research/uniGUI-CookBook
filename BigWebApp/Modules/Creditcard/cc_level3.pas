unit cc_level3;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  iqcc_utils,
  MainModule,
  cc_types,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt.Intf;

type
  { Forwards }
  TLevel3Items = class;
  TLevel3Item = class;

  { TLevel3Items }
  TLevel3Items = class(TCollection)
  private
    { Private declarations }
    FSource: TChargePostingSource;
    FLocalTaxAmount: Real;
    FLocalTaxExempt: Boolean;
    FNationalTaxAmount: Real;
    FDutyAmount: Real;
    FCustomerTaxID: string;
    FCommodityCode: string;
    FSenderPostalCode: string;
    FMerchantTaxID: string;
    FDestinationPostalCode: string;
    FProcessingClass: TProcessingClass;
    FDestinationCountryCode: string;
    FFreightAmount: Real;
    FPONumber: string;
    function GetItems(index: Integer): TLevel3Item;
    procedure SetItems(index: Integer; const Value: TLevel3Item);
    function AddItem: TLevel3Item;
  public
    { Public declarations }
    constructor Create;
    // destructor Destroy; override;
    procedure Reset;
    procedure CopyFrom(ALevel3Items: TLevel3Items);
    procedure LoadFromTransaction(const ATransactionID: Int64);
    procedure LoadFromTestTransaction(const ACreditCardTestDetailID: Int64);
    procedure SaveToTransaction(const ATransactionID: Int64);
    procedure SaveToTestTransaction(const ACreditCardTestDetailID: Int64);
    function Add: TLevel3Item;
    function IndexOf(const AID: Real): Integer;
    function FindItem(const index: Real): TLevel3Item;
    // Source: Indicates the item source: Sales Order detail, or
    // AR Prepost Invoice detail
    property Source: TChargePostingSource read FSource write FSource;
    property ProcessingClass: TProcessingClass read FProcessingClass
      write FProcessingClass;
    property LocalTaxAmount: Real read FLocalTaxAmount write FLocalTaxAmount;
    property LocalTaxExempt: Boolean read FLocalTaxExempt
      write FLocalTaxExempt;
    property NationalTaxAmount: Real read FNationalTaxAmount
      write FNationalTaxAmount;
    property FreightAmount: Real read FFreightAmount write FFreightAmount;
    property DutyAmount: Real read FDutyAmount write FDutyAmount;
    property MerchantTaxID: string read FMerchantTaxID write FMerchantTaxID;
    property CustomerTaxID: string read FCustomerTaxID write FCustomerTaxID;
    property PurchaseOrderNumber: string read FPONumber write FPONumber;
    property CommodityCode: string read FCommodityCode write FCommodityCode;
    property SenderPostalCode: string read FSenderPostalCode
      write FSenderPostalCode;
    property DestinationPostalCode: string read FDestinationPostalCode
      write FDestinationPostalCode;
    property DestinationCountryCode: string read FDestinationCountryCode
      write FDestinationCountryCode;
    property Items[index: Integer]: TLevel3Item read GetItems
      write SetItems; default;
  end;

  { TLevel3Item }
  TLevel3Item = class(TCollectionItem)
  private
    { Private declarations }
    FRowNum: Integer;
    FID: Real;
    FQuantity: Integer;
    FTaxAmount: Real;
    FUnitPrice: Real;
    FDiscount: Real;
    FArinvtID: Real;
    FInventoryItemDescrip: string;
    FMiscItem: string;
    FInventoryItemClass: string;
    FItemno: string;
    FInventoryItemRev: string;
    FCommodityCode: string;
    FExclude: Boolean;
    FUOM: string;
    FTaxRate: Real;
    function GetDiscountAmount: Real;
    function GetTotalAmount: Real;
    procedure SetArinvtID(const Value: Real);
    procedure SetMiscItem(const Value: string);
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
  published
    { Published declarations }
    property Index: Integer read FRowNum write FRowNum;
    property ID: Real read FID write FID;
    property ArinvtID: Real read FArinvtID write SetArinvtID;
    property MiscItem: string read FMiscItem write SetMiscItem;
    property InventoryItemno: string read FItemno;
    property InventoryItemDescrip: string read FInventoryItemDescrip;
    property InventoryItemClass: string read FInventoryItemClass;
    property InventoryItemRev: string read FInventoryItemRev;
    property Quantity: Integer read FQuantity write FQuantity;
    property UnitPrice: Real read FUnitPrice write FUnitPrice;
    property UOM: string read FUOM write FUOM;
    property Discount: Real read FDiscount write FDiscount;
    property DiscountAmount: Real read GetDiscountAmount;
    property TaxAmount: Real read FTaxAmount write FTaxAmount;
    property TaxRate: Real read FTaxRate write FTaxRate;
    property TotalAmount: Real read GetTotalAmount;
    property CommodityCode: string read FCommodityCode write FCommodityCode;
    property Exclude: Boolean read FExclude write FExclude;
  end;

implementation

uses
  cc_trans,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

{$REGION 'TLevel3Items'}

{ TLevel3Items }

constructor TLevel3Items.Create;
begin
  inherited Create(TLevel3Item);
  Reset;
end;

function TLevel3Items.Add: TLevel3Item;
begin
  Result := AddItem;
end;

function TLevel3Items.AddItem: TLevel3Item;
begin
  Result := TLevel3Item(inherited Add);
end;

function TLevel3Items.GetItems(index: Integer): TLevel3Item;
begin
  Result := TLevel3Item(inherited Items[index]);
end;

procedure TLevel3Items.SetItems(index: Integer; const Value: TLevel3Item);
begin
  inherited Items[index] := Value;
end;

function TLevel3Items.FindItem(const index: Real): TLevel3Item;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if (TLevel3Item(Items[i]).index = Index) then
      begin
        Result := TLevel3Item(Items[i]);
        Break;
      end;
end;

function TLevel3Items.IndexOf(const AID: Real): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if (TLevel3Item(Items[i]).ID = AID) then
      begin
        Result := i;
        Break;
      end;
end;

procedure TLevel3Items.LoadFromTestTransaction(
  const ACreditCardTestDetailID: Int64);
var
  ACreditCardTestID: Integer;
  AValue: Real;
begin
  if (ACreditCardTestDetailID = 0) then
    Exit;
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT a.credit_card_test_id,');
      SQL.Add('       a.arcusto_id,');
      SQL.Add('       a.amount,');
      SQL.Add('       a.invoiceno,');
      SQL.Add('       a.orderno,');
      SQL.Add('       a.tax_amount,');
      SQL.Add('       a.freight,');
      SQL.Add('       a.pono,');
      SQL.Add('       a.tax_exempt,');
      SQL.Add('       a.discount,');
      SQL.Add('       a.duty_amount,');
      SQL.Add('       a.processing_level,');
      SQL.Add('       a.curr_code,');
      SQL.Add('       a.auth_code,');
      SQL.Add('       a.credit_card_descrip');
      SQL.Add('  FROM credit_card_test_dtl a');
      SQL.Add(Format(' WHERE a.id = %d', [ACreditCardTestDetailID]));
      Open;
      ACreditCardTestID := FieldByName('CREDIT_CARD_TEST_ID').AsLargeInt;
      Source := TChargePostingSource(0);
      ProcessingClass := pclLevel3;
      LocalTaxAmount := 0;
      if FieldByName('TAX_EXEMPT').AsString = 'Y' then
        LocalTaxExempt := True
      else
        LocalTaxAmount := FieldByName('TAX_AMOUNT').AsFloat;
      NationalTaxAmount := 0;
      DutyAmount := FieldByName('DUTY_AMOUNT').AsFloat;
      FreightAmount := FieldByName('FREIGHT').AsFloat;

      // NOTE: SenderPostalCode, DestinationPostalCode, and
      // DestinationCountryCode are provided by the calling screen.

      MerchantTaxID := SelectValueAsString(
        'SELECT fed_id FROM iqsys WHERE ROWNUM < 2');
      CustomerTaxID := SelectValueFmtAsString(
        'SELECT tax_id FROM arcusto WHERE id = %.0f',
        [FieldByName('ARCUSTO_ID').AsFloat]);
      CommodityCode := 'AAA'; // ParamByName('COMMODITY_CODE').AsString;
      PurchaseOrderNumber := FieldByName('PONO').AsString;
    finally
      Free;
    end;

  // Itemization
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('  SELECT id, seq,');
      SQL.Add('         arinvt_id, misc_item, quantity,');
      SQL.Add('         unit_price, unit, discount,');
      SQL.Add('         list_unit_price, tax_code_id,');
      SQL.Add('         tax_amount, tax_rate, code');
      SQL.Add('    FROM credit_card_test_item');
      SQL.Add(Format('   WHERE credit_card_test_dtl_id = %d',
        [ACreditCardTestDetailID]));
      SQL.Add('ORDER BY seq');
      Open;
      while not EOF do
        begin
          with AddItem do
            begin
              ArinvtID := FieldByName('arinvt_id').AsLargeInt;
              MiscItem := FieldByName('misc_item').AsString;
              Quantity := FieldByName('quantity').AsInteger;
              UnitPrice := FieldByName('unit_price').AsFloat;
              UOM := FieldByName('unit').AsString;
              Discount := FieldByName('discount').AsFloat;
              TaxAmount := FieldByName('tax_amount').AsFloat;
              TaxRate := FieldByName('tax_rate').AsFloat;
              CommodityCode := FieldByName('code').AsString;
            end;
          Next;
        end;
    finally
      Free;
    end;
end;

procedure TLevel3Items.LoadFromTransaction(const ATransactionID: Int64);
var
  AValue: Real;
begin
  if (ATransactionID = 0) then
    Exit;
  // 1.) Update the credit card addendum record
  with TTransactionAddendumTable.Create(nil, ATransactionID) do
    try
      WriteImmediate := False;
      Refresh;
      Source := TChargePostingSource(ParamByName('POSTING_SOURCE').AsInteger);
      ProcessingClass := TProcessingClass(ParamByName('PROCESSING_CLASS')
        .AsInteger);
      LocalTaxAmount := 0;
      if ParamByName('LOCAL_TAX').AsString = 'EXEMPT' then
        LocalTaxExempt := True
      else if IQMS.Common.Numbers.IsStringValidFloat(ParamByName('LOCAL_TAX').AsString,
        AValue) then
        LocalTaxAmount := AValue;
      NationalTaxAmount := ParamByName('NATIONAL_TAX').AsFloat;
      DutyAmount := ParamByName('DUTY_AMOUNT').AsFloat;
      FreightAmount := ParamByName('FREIGHT').AsFloat;
      // Update the "address" fields.  This are provided by the charge
      // screen because the user can select whatever he wants.  This
      // should not be based on the Sales Order or Invoice.
      // See UpdateCountryCodeVars (below) for the country code value.
      DestinationPostalCode := ParamByName('RECIPIENT_POSTALCODE').AsString;
      DestinationCountryCode := ParamByName('RECIPIENT_COUNTRY').AsString;
      SenderPostalCode := ParamByName('SENDER_POSTALCODE').AsString;
      MerchantTaxID := ParamByName('MERCHANT_TAX_ID').AsString;
      if MerchantTaxID = '' then
        MerchantTaxID := SelectValueAsString(
          'SELECT fed_id FROM iqsys WHERE ROWNUM < 2');
      CustomerTaxID := ParamByName('CUSTOMER_TAX_ID').AsString;
      CommodityCode := ParamByName('COMMODITY_CODE').AsString;
      PurchaseOrderNumber := ParamByName('PO_NO').AsString;
    finally
      Free;
    end;
  // Itemization
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('  SELECT id, credit_card_trans_id, seq,');
      SQL.Add('         arinvt_id, misc_item, quantity,');
      SQL.Add('         unit_price, unit, discount,');
      SQL.Add('         list_unit_price, tax_code_id,');
      SQL.Add('         tax_amount, tax_rate, code');
      SQL.Add('    FROM credit_card_item');
      SQL.Add(Format('   WHERE credit_card_trans_id = %d', [ATransactionID]));
      SQL.Add('ORDER BY seq');
      Open;
      while not EOF do
        begin
          with AddItem do
            begin
              ArinvtID := FieldByName('arinvt_id').AsLargeInt;
              MiscItem := FieldByName('misc_item').AsString;
              Quantity := FieldByName('quantity').AsInteger;
              UnitPrice := FieldByName('unit_price').AsFloat;
              UOM := FieldByName('unit').AsString;
              Discount := FieldByName('discount').AsFloat;
              TaxAmount := FieldByName('tax_amount').AsFloat;
              TaxRate := FieldByName('tax_rate').AsFloat;
              CommodityCode := FieldByName('code').AsString;
            end;
          Next;
        end;
    finally
      Free;
    end;
end;

procedure TLevel3Items.Reset;
begin
  FSource := TChargePostingSource(0);
  FLocalTaxAmount := 0;
  FLocalTaxExempt := False;
  FNationalTaxAmount := 0;
  FDutyAmount := 0;
  FCustomerTaxID := '';
  FCommodityCode := '';
  FSenderPostalCode := '';
  FMerchantTaxID := '';
  FDestinationPostalCode := '';
  FProcessingClass := TProcessingClass(0);
  FDestinationCountryCode := '';
  FFreightAmount := 0;
  FPONumber := '';
  Clear;
end;

procedure TLevel3Items.SaveToTestTransaction(
  const ACreditCardTestDetailID: Int64);
var
  ASQL: TStringList;
  i: Integer;
begin
  if (ACreditCardTestDetailID = 0) then
    Exit;

  // Clear old records first
  ExecuteCommandFmt(
    'DELETE FROM credit_card_test_item WHERE credit_card_test_dtl_id = %d',
    [ACreditCardTestDetailID]);

  // Itemization
  ASQL := TStringList.Create;
  try
    ASQL.Add('INSERT INTO credit_card_test_item(id,');
    ASQL.Add('                             credit_card_test_dtl_id,');
    ASQL.Add('                             seq,');
    ASQL.Add('                             arinvt_id,');
    ASQL.Add('                             misc_item,');
    ASQL.Add('                             quantity,');
    ASQL.Add('                             unit_price,');
    ASQL.Add('                             unit,');
    ASQL.Add('                             discount,');
    ASQL.Add('                             tax_amount,');
    ASQL.Add('                             tax_rate,');
    ASQL.Add('                             code)');
    ASQL.Add('    VALUES (s_credit_card_test_item.NEXTVAL, ');
    ASQL.Add('            :credit_card_test_dtl_id, :seq, ');
    ASQL.Add('            :arinvt_id, :misc_item, :quantity,');
    ASQL.Add('            :unit_price, :unit, :discount, ');
    ASQL.Add('            :tax_amount, :tax_rate, :code)');
    // 2.) Add the itemization
    for i := 0 to Count - 1 do
      begin
        if Items[i].Exclude then
          Continue;
        ExecuteCommandParam(ASQL.Text,
          ['CREDIT_CARD_TEST_DTL_ID;INT64', 'SEQ;INT', 'ARINVT_ID;INT64',
          'MISC_ITEM;S', 'QUANTITY;I', 'UNIT_PRICE;F', 'UNIT;S', 'DISCOUNT;F',
          'TAX_AMOUNT;F', 'TAX_RATE;F', 'CODE;S'],
          [ACreditCardTestDetailID, i,
          IQMS.Common.Numbers.NullIfZero(Trunc(Items[i].ArinvtID)), Items[i].MiscItem,
          Items[i].Quantity, Items[i].UnitPrice, Items[i].UOM,
          Items[i].Discount, Items[i].TaxAmount, Items[i].TaxRate,
          Items[i].CommodityCode]);
      end; // end loop
  finally
    if Assigned(ASQL) then
      FreeAndNil(ASQL);
  end;
end;

procedure TLevel3Items.SaveToTransaction(const ATransactionID: Int64);
var
  ASQL: TStringList;
  i: Integer;
begin
  if (ATransactionID = 0) then
    Exit;
  // 1.) Update the credit card addendum record
  with TTransactionAddendumTable.Create(nil, ATransactionID) do
    try
      WriteImmediate := False;
      ParamByName('POSTING_SOURCE').AsInteger := Ord(Source);
      ParamByName('PROCESSING_CLASS').AsInteger := ProcessingClassInt
        [FProcessingClass];
      // This data is redundant, but stored here for convenience during
      // settlement.
      // ParamByName('PO_NO').AsString := Self.PONumber;
      // ParamByName('FREIGHT').Value := Self.Freight;
      if LocalTaxExempt then
        ParamByName('LOCAL_TAX').AsString := 'EXEMPT'
      else
        ParamByName('LOCAL_TAX').Value := Format('%.2f', [LocalTaxAmount]);
      ParamByName('NATIONAL_TAX').Value := Format('%.2f', [NationalTaxAmount]);
      ParamByName('DUTY_AMOUNT').Value := Format('%.2f', [DutyAmount]);
      ParamByName('FREIGHT').Value := Format('%.2f', [FreightAmount]);
      // Update the "address" fields.  This are provided by the charge
      // screen because the user can select whatever he wants.  This
      // should not be based on the Sales Order or Invoice.
      // See UpdateCountryCodeVars (below) for the country code value.
      ParamByName('RECIPIENT_POSTALCODE').AsString := DestinationPostalCode;
      ParamByName('RECIPIENT_COUNTRY').AsString := DestinationCountryCode;
      ParamByName('SENDER_POSTALCODE').AsString := SenderPostalCode;
      ParamByName('MERCHANT_TAX_ID').AsString := MerchantTaxID;
      ParamByName('CUSTOMER_TAX_ID').AsString := CustomerTaxID;
      ParamByName('COMMODITY_CODE').AsString := CommodityCode;
      ParamByName('PO_NO').AsString := PurchaseOrderNumber;
      WriteValues;
    finally
      Free;
    end;
  // Itemization
  ASQL := TStringList.Create;
  try
    ASQL.Add('INSERT INTO credit_card_item(id,');
    ASQL.Add('                             credit_card_trans_id,');
    ASQL.Add('                             seq,');
    ASQL.Add('                             arinvt_id,');
    ASQL.Add('                             misc_item,');
    ASQL.Add('                             quantity,');
    ASQL.Add('                             unit_price,');
    ASQL.Add('                             unit,');
    ASQL.Add('                             discount,');
    ASQL.Add('                             tax_amount,');
    ASQL.Add('                             tax_rate,');
    ASQL.Add('                             code)');
    ASQL.Add('    VALUES (s_credit_card_item.NEXTVAL, ');
    ASQL.Add('            :credit_card_trans_id, :seq, ');
    ASQL.Add('            :arinvt_id, :misc_item, :quantity,');
    ASQL.Add('            :unit_price, :unit, :discount, ');
    ASQL.Add('            :tax_amount, :tax_rate, :code)');
    // 2.) Add the itemization
    for i := 0 to Count - 1 do
      begin
        if Items[i].Exclude then
          Continue;
        ExecuteCommandParam(ASQL.Text,
          ['CREDIT_CARD_TRANS_ID;INT64', 'SEQ;I', 'ARINVT_ID;INT64',
          'MISC_ITEM;S', 'QUANTITY;I', 'UNIT_PRICE;F', 'UNIT;S',
          'DISCOUNT;F', 'TAX_AMOUNT;F', 'TAX_RATE;F', 'CODE;S'],
          [ATransactionID, i,
          IQMS.Common.Numbers.NullIfZero(Trunc(Items[i].ArinvtID)), Items[i].MiscItem,
          Items[i].Quantity, Items[i].UnitPrice, Items[i].UOM,
          Items[i].Discount, Items[i].TaxAmount, Items[i].TaxRate,
          Items[i].CommodityCode]);
      end; // end loop
  finally
    if Assigned(ASQL) then
      FreeAndNil(ASQL);
  end;
end;

procedure TLevel3Items.CopyFrom(ALevel3Items: TLevel3Items);
var
  i: Integer;
begin
  if Assigned(ALevel3Items) then
    begin
      Reset;
      Source := ALevel3Items.Source;
      ProcessingClass := ALevel3Items.ProcessingClass;
      LocalTaxAmount := ALevel3Items.LocalTaxAmount;
      LocalTaxExempt := ALevel3Items.LocalTaxExempt;
      NationalTaxAmount := ALevel3Items.NationalTaxAmount;
      DutyAmount := ALevel3Items.DutyAmount;
      FreightAmount := ALevel3Items.FreightAmount;
      DestinationPostalCode := ALevel3Items.DestinationPostalCode;
      DestinationCountryCode := ALevel3Items.DestinationCountryCode;
      SenderPostalCode := ALevel3Items.SenderPostalCode;
      MerchantTaxID := ALevel3Items.MerchantTaxID;
      CustomerTaxID := ALevel3Items.CustomerTaxID;
      CommodityCode := ALevel3Items.CommodityCode;
      PurchaseOrderNumber := ALevel3Items.PurchaseOrderNumber;
      for i := 0 to ALevel3Items.Count - 1 do
        with Self.Add do
          begin
            ID := ALevel3Items.Items[i].ID;
            ArinvtID := ALevel3Items.Items[i].ArinvtID;
            MiscItem := ALevel3Items.Items[i].MiscItem;
            Quantity := ALevel3Items.Items[i].Quantity;
            UnitPrice := ALevel3Items.Items[i].UnitPrice;
            UOM := ALevel3Items.Items[i].UOM;
            Discount := ALevel3Items.Items[i].Discount;
            TaxAmount := ALevel3Items.Items[i].TaxAmount;
            CommodityCode := ALevel3Items.Items[i].CommodityCode;
            Exclude := ALevel3Items.Items[i].Exclude;
          end;
    end;
end;

{$ENDREGION 'TLevel3Items'}

{$REGION 'TLevel3Item'}

{ TLevel3Item }

constructor TLevel3Item.Create(Collection: TCollection);
begin
  inherited Create(TLevel3Items(Collection));
  FID := 0;
  FQuantity := 0;
  FTaxAmount := 0;
  FUnitPrice := 0;
  FDiscount := 0;
  FArinvtID := 0;
  FInventoryItemDescrip := '';
  FMiscItem := '';
  FInventoryItemClass := '';
  FItemno := '';
  FInventoryItemRev := '';
  FCommodityCode := '';
  FExclude := False;
  FUOM := 'NPT'; // NPT = Number of parts
end;

function TLevel3Item.GetDiscountAmount: Real;
begin
  Result := (Quantity * UnitPrice) * (Discount / 100);
end;

function TLevel3Item.GetTotalAmount: Real;
begin
  Result := ((Quantity * UnitPrice) + TaxAmount) - DiscountAmount;
end;

procedure TLevel3Item.SetArinvtID(const Value: Real);
var
  AData: Variant;
begin
  AData := Unassigned;
  FArinvtID := Value;
  if (Trunc(FArinvtID) > 0) then
    begin
      AData := SelectValueArrayFmt(
        'SELECT itemno, descrip, descrip2,' +
        'class, rev FROM arinvt WHERE id = %d',
        [Trunc(FArinvtID)]);
      FItemno := System.Variants.VarToStr(AData[0]);
      FInventoryItemDescrip := System.Variants.VarToStr(AData[1]);
      FInventoryItemClass := System.Variants.VarToStr(AData[3]);
      FInventoryItemRev := System.Variants.VarToStr(AData[4]);
    end;
end;

procedure TLevel3Item.SetMiscItem(const Value: string);
begin
  FMiscItem := Value;
end;

{$ENDREGION 'TLevel3Item'}

end.
