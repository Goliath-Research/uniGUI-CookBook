unit crm_aka_shr;

interface

uses
  MainModule;

// Adds item permanently to database
procedure AddToAka(AArinvtID, AArcustoID: Int64);

procedure AddToAkaEx(AArinvtID, AArcustoID: Int64; var ANewID: Int64);
// Deletes an AKA permanently
procedure RemoveFromAka(AArinvtID, AArcustoID: Int64);
// Clear Customer AKA
procedure ClearCustomerAka(AArcustoID: Int64);
// Item already exists
function ItemAlreadyInCustomerAKA(AArinvtID, AArcustoID: Int64): Boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;


procedure AddToAka(AArinvtID, AArcustoID: Int64);
var
  ANewID: Int64;
begin
  AddToAkaEx(AArinvtID, AArcustoID, ANewID);
end;

procedure AddToAkaEx(AArinvtID, AArcustoID: Int64; var ANewID: Int64);
begin
  // 10/24/2011 Added package procedure
  ANewID := GetNextID('aka');
  ExecuteCommandFmt(
    'BEGIN iqms.aka_misc.add_customer_aka(%d, %d, %d); END;',
    [ANewID, AArinvtID, AArcustoID]);
end;

procedure RemoveFromAka(AArinvtID, AArcustoID: Int64);
begin
  // 10/24/2011 Added package procedure
  ExecuteCommandFmt(
    'BEGIN iqms.aka_misc.remove_customer_aka(%d, %d); END;',
    [AArinvtID, AArcustoID]);
end;

procedure ClearCustomerAka(AArcustoID: Int64);
begin
  // 10/24/2011 Added package procedure
  ExecuteCommandFmt(
    'BEGIN iqms.aka_misc.clear_customer_aka(%d); END;',
    [AArcustoID]);
end;

function ItemAlreadyInCustomerAKA(AArinvtID, AArcustoID: Int64): Boolean;
begin
  // 10/24/2011 Added package procedure
  Result := SelectValueFmtAsInteger(
    'SELECT iqms.aka_misc.customer_aka_exists(%d, %d) FROM DUAL',
    [AArinvtID, AArcustoID]) = 1;
end;

end.
