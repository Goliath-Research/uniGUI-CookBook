unit sdshare;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Variants,
  Vcl.Menus,
  MainModule,
  uniMainMenu;

procedure GetProdDateAndShift(const ACell: string; var AProdShift: Integer;
  var AProdDate: TDateTime);
procedure HideMenus(APopup: TUniPopupMenu);
function IsFamilyMold(const AStandardID: Real): Boolean;

var
  { These values are used when working with data on an inherited module that
    needs to know what the current values are.  We do this because we also
    allow the user to change which work center has the focus. }
  hWorkCenterID: Real; { work center id }
  // 12/22/2009 remmed these because they are unused
  // hEqno           : String       ; {equipment number}
  // hDescription    : String       ; {equipment description}
  hIllum_RT_ID: Real; { ILLUM_RT.ID }
  //DisableChildMove: Boolean;
  { if RTMonitor moves to the next record - update ShopData }
  { worklist pointer but do not move RTMonitor again to prevent }
  { circular update. Used in sd_main.DoModuleRefresh }

  HideMouseCursor: Boolean; // Hide the mouse cursor

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  shopdata_rscstr
  { TODO -oSanketG -cWC : Need to revisit }
  //touchscrn
  ;

procedure GetProdDateAndShift(const ACell: string; var AProdShift: Integer;
  var AProdDate: TDateTime);
var
  ASuccess: Boolean;

  function _getCellParams: Boolean;
  var
    A: Variant;
  begin
    A := SelectValueArrayFmt(
      'SELECT prod_shift, prod_date '#13 +
      '  FROM v_mfgcell_param_all '#13 +
      ' WHERE NVL(TRIM(mfgcell),''~'') = ''%s'' ',
      [ACell]);
    Result := (System.Variants.VarArrayDimCount(A) > 0) and
               not System.Variants.VarIsNull(A[0]) and
               not System.Variants.VarIsNull(A[1]);
    if Result then
       begin
         AProdShift := A[0];
         AProdDate := A[1];
       end;
  end;

  function _getParams: Boolean;
  var
    A: Variant;
  begin
    A := SelectValueArray(
      'SELECT prod_shift, prod_date '#13 +
      '  FROM params '#13 +
      ' WHERE ROWNUM < 2');
    Result := (System.Variants.VarArrayDimCount(A) > 0) and
               not System.Variants.VarIsNull(A[0]) and
               not System.Variants.VarIsNull(A[1]);
    if Result then
       begin
         AProdShift := A[0];
         AProdDate := A[1];
       end;
  end;

begin
  AProdShift := 1;
  AProdDate := IQMS.Common.Dates.IQOracleAdjustedDate;

  ASuccess := False;
  if Length(Trim(ACell)) > 0 then
     ASuccess := _getCellParams;
  if not ASuccess then
     ASuccess := _getParams;

  if not ASuccess then
    begin
      // 'Cannot determine current production date and shift.'
      { TODO -oSanketG -cWC : Need to revisit, dependent on touchscrn }
      //touchscrn.TouchScreen_Msg_Error(shopdata_rscstr.cTXT0000043);
      System.SysUtils.Abort;
    end;
end;

procedure HideMenus(APopup: TUniPopupMenu);
var
  i: Integer;
begin
  if not Assigned(APopup) then
    Exit;

  for i := 0 to APopup.Items.Count - 1 do
    APopup.Items[i].Visible := False;

  APopup.OnPopup := nil;

end;

function IsFamilyMold(const AStandardID: Real): Boolean;
begin
  Result := SelectValueFmtAsFloat('SELECT COUNT(id) AS v_count'#13 + 'FROM partno'#13
    + 'WHERE standard_id = %.0f', [AStandardID]) > 1;
end;

end.
