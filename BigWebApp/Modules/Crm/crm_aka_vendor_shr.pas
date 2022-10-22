unit crm_aka_vendor_shr;

interface

uses
  MainModule;

procedure AddToAka(AArinvtID, AVendorID: Real);
procedure AddToAkaEx(AArinvtID, AVendorID: Real; var ANewID: Real);
// Deletes an AKA permanently
procedure RemoveFromAka(AArinvtID, AVendorID: Real);
// Clear Vendor AKA
procedure ClearVendorAka(AVendorID: Real);
// Item already exists
function ItemAlreadyInVendorAKA(AArinvtID, AVendorID: Real): Boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

procedure AddToAka(AArinvtID, AVendorID: Real);
var
  ANewID: Real;
begin
  AddToAkaEx(AArinvtID, AVendorID, ANewID);
end;

procedure AddToAkaEx(AArinvtID, AVendorID: Real; var ANewID: Real);
begin
  // 10/24/2011 Added package procedure
  ANewID := GetNextID('arinvt_vendors');
  ExecuteCommandFmt(
    'BEGIN iqms.aka_vendor_misc.add_aka(%.0f, %.0f, %.0f); END;',
    [ANewID, AArinvtID, AVendorID]);
end;

procedure RemoveFromAka(AArinvtID, AVendorID: Real);
begin
  // 10/24/2011 Added package procedure
  ExecuteCommandFmt(
    'BEGIN iqms.aka_vendor_misc.remove_aka(%.0f, %.0f); END;',
    [AArinvtID, AVendorID]);
end;

procedure ClearVendorAka(AVendorID: Real);
begin
  // 10/24/2011 Added package procedure
  ExecuteCommandFmt(
    'BEGIN iqms.aka_vendor_misc.clear_vendor_aka(%.0f); END;',
    [AVendorID]);
end;

function ItemAlreadyInVendorAKA(AArinvtID, AVendorID: Real): Boolean;
begin
  // 10/24/2011 Added package procedure
  Result := SelectValueFmtAsInteger(
    'SELECT iqms.aka_vendor_misc.aka_exists(%.0f, %.0f) FROM DUAL',
    [AArinvtID, AVendorID]) = 1;
end;

end.
