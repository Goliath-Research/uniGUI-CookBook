unit IQMS.Common.prod_date_shift;

interface

uses
  System.SysUtils,
  System.Classes;

/// <summary> Get the current production date and shift.  If work center ID and/or
/// cell are provided, they will be used in the filtering process.
/// </summary>
function GetCurrentProdDateShift(const AWorkCenterID: Real; const ACell: string;
  var AProdShift: Integer; var AProdDate: TDateTime): Boolean;

/// <summary> Get the current production date and shift.  If not found, raise
/// standard exception message.
/// </summary>
function CheckGetCurrentProdDateShift(const AWorkCenterID: Real;
  const ACell: string; var AProdShift: Integer;
  var AProdDate: TDateTime): Boolean;

/// <summary> Raise standard exception if production shift and date are not provided.
/// </summary>
procedure IQAssertProdDateShiftFound(const AProdShift: Integer;
  const AProdDate: TDateTime);

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.ResStrings,
  System.Variants;

function GetCurrentProdDateShift(const AWorkCenterID: Real; const ACell: string;
  var AProdShift: Integer; var AProdDate: TDateTime): Boolean;
var
  A: Variant;
begin
  // Initialize
  AProdShift := 0;
  AProdDate := IQMS.Common.Dates.MinValue;
  Result := False;

  // 10/28/2013 If the work center has a custom calendar shift, then
  // apply it (Byron).  This change was requested by Randy for:
  // EIQ-1357  Downtime - Shop Calendar shift of the Default is displaying
  // instead of for the cell associated with the selected work center.
  if AWorkCenterID > 0 then
  begin
    A := SelectValueArrayFmt('SELECT b.prod_shift, b.prod_date ' +
      'FROM work_center a, v_mfgcell_param b ' +
      'WHERE a.id = %.0f AND b.id = a.mfgcell_id',
      [AWorkCenterID]);
    if System.Variants.VarArrayDimCount(A) > 0 then
    begin
      if not System.Variants.VarIsNull(A[0]) then
        AProdShift := System.Variants.VarAsType(A[0], varInteger);
      if not System.Variants.VarIsNull(A[1]) then
        AProdDate := System.Variants.VarAsType(A[1], varDate);
    end;
  end;

  // If no custom calendar information was found, then proceed
  // as usual.
  if (AProdShift = 0) or (AProdDate = IQMS.Common.Dates.MinValue) then
  begin
    // If cell is provided, then get values based on cell
    if ACell > '' then
      A := SelectValueArrayFmt('select prod_shift, prod_date ' +
        'from v_mfgcell_param_all where NVL(RTrim(mfgcell),''~'') = ''%s'' ',
        [ACell])
    else
      A := SelectValueArray('select prod_shift, prod_date from params');

    if VarArrayDimCount(A) > 0 then
    begin
      if not System.Variants.VarIsNull(A[0]) then
        AProdShift := System.Variants.VarAsType(A[0], varInteger);
      if not System.Variants.VarIsNull(A[1]) then
        AProdDate := System.Variants.VarAsType(A[1], varDate);
    end
  end;

  Result := (AProdShift > 0) and (AProdDate > IQMS.Common.Dates.MinValue);
end;

function CheckGetCurrentProdDateShift(const AWorkCenterID: Real;
  const ACell: string;
  var AProdShift: Integer; var AProdDate: TDateTime): Boolean;
begin
  Result := GetCurrentProdDateShift(AWorkCenterID, ACell, AProdShift,
    AProdDate);
  IQAssertProdDateShiftFound(AProdShift, AProdDate);
end;

procedure IQAssertProdDateShiftFound(const AProdShift: Integer;
  const AProdDate: TDateTime);
begin
  if (AProdShift <= 0) and (AProdDate <= IQMS.Common.Dates.MinValue) then
    // IQMS.Common.ResStrings.cTXT0000448 =
    // 'Unable to determine current shift and prod date.';
    raise Exception.Create(IQMS.Common.ResStrings.cTXT0000448);
end;

end.
