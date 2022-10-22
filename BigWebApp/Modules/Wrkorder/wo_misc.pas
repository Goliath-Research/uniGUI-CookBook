unit wo_misc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  MainModule;

type
  TWOReleaseCargo = class
    Rel_Quan: Real;
    Rel_Date: TDateTime;
    Must_Ship_Date: TDateTime;
    Ship_To_ID: Real;
  end;

  {Hard allocated materials filtering}
  TAllocFilterType = (aftNone, aftDivision, aftWorkZoneLoc);

  TWOHardAllocCargo = record
    FilterType: TAllocFilterType;
    Division_ID: Real;
    Qty: Real;
    DirectedFGMulti_ID: Real;
    Work_Center_ID: Real;
    constructor Create(ADirectedFGMulti_ID: Real);
  end;

procedure CheckDeleteChildernOfComplexWorkorder(AWorkorder_ID: Real);
function IsWorkorderHardAlloc(AWorkorder_ID: Real): Real; // 1 or 0
function GetTotalMaterialsAllocated(AWorkorder_ID, ATopItemWorkorder_BOM_ID
  : Real): Real;
function GetTotalMaterialsPercent(AWorkorder_ID, ATopItemWorkorder_BOM_ID
  : Real): Real;
procedure EnsureExistsWorkorder_BOM(AWorkorder_ID: Real);
procedure UpdateDayUseAlternateItem(AWorkorder_ID, AArinvt_Alternate_ID: Real;
  AFirstMustArriveDate: TDateTime); overload;
procedure UpdateDayUseAlternateItem(AWorkorder_ID, AOrigArinvt_ID,
  AAlternateArinvt_ID: Real; AFirstMustArriveDate: TDateTime); overload;
function IsAlternateAppliedToWorkorder: Boolean;
function IsPrimaryMaterialBlendComponent(AWorkorder_ID,
  AArinvt_ID: Real): Boolean;

implementation

uses
  IQMS.Common.DataLib,
  System.Variants;

procedure CheckDeleteChildernOfComplexWorkorder(AWorkorder_ID: Real);
begin
  if SelectValueFmtAsString(
    'select rtrim(nvl( m.standard_mfgtype, m.mfgtype )) ' +
    '  from workorder w, standard s, mfgtype m          ' +
    ' where w.id = %f                                   ' +
    '   and w.standard_id = s.id                        ' +
    '   and rtrim(s.mfg_type) = rtrim(m.mfgtype)        ',
    [AWorkorder_ID]) <> 'COMPLEX' then
    Exit;

  ExecuteCommandFmt(
    'begin workorder_misc.delete_children_of_complex_wo( %f ); end;',
    [AWorkorder_ID]);
end;

function IsWorkorderHardAlloc(AWorkorder_ID: Real): Real; // 1 or 0
begin
  Result := SelectValueFmtAsFloat(
    'select prod_rep.has_workorder_bom_assigned( %f ) from dual',
    [AWorkorder_ID]);
end;

function GetTotalMaterialsAllocated(AWorkorder_ID, ATopItemWorkorder_BOM_ID
  : Real): Real;
begin
  // 01-02-2015 causing Oracle to disconnect the session
  // Result:= SelectValueFmtAsFloat('select sum( (select sum(f.onhand)                                    '+    <=== THIS INNER SUM
  //                    '              from workorder_bom_mat_loc w,                          '+         Replaced with a func call
  //                    '                   fgmulti f                                         '+
  //                    '             where w.workorder_bom_id = b.id                         '+
  //                    '               and w.fgmulti_id = f.id))                             '+
  //                    '  from workorder_bom b                                               '+
  //                    ' where workorder_id = %f                                             '+
  //                    '   and kind = ''COMPONENT''                                          '+
  //                    '   and (b.sndop_id is null and nvl(b.class, ''*'') <> ''PK''         '+
  //                    '        or                                                           '+
  //                    '       (select op_class from sndop where id = b.sndop_id) = ''IN'')  '+
  //                    '  start with id = %f                                                 '+
  //                    ' connect by parent_id = prior id                                     ',
  //                    [ AWorkorder_ID ,
  //                      ATopItemWorkorder_BOM_ID ]);

  Result := SelectValueFmtAsFloat(
    'select sum( wo_bom.workorder_bom_alloc_quan( b.id ))                 ' +
    '  from workorder_bom b                                               ' +
    ' where workorder_id = %f                                             ' +
    '   and kind = ''COMPONENT''                                          ' +
    '   and (b.sndop_id is null and nvl(b.class, ''*'') <> ''PK''         ' +
    '        or                                                           ' +
    '       (select op_class from sndop where id = b.sndop_id) = ''IN'')  ' +
    '  start with id = %f                                                 ' +
    ' connect by parent_id = prior id                                     ',
    [AWorkorder_ID,
    ATopItemWorkorder_BOM_ID]);
end;

function GetTotalMaterialsPercent(AWorkorder_ID, ATopItemWorkorder_BOM_ID
  : Real): Real;
var
  AMfgtype_Lookup: string;
  ATopArinvt_ID: Real;
begin
  AMfgtype_Lookup := SelectValueFmtAsString(
    'select mfg.lookup_mfgtype(s.mfg_type) from workorder w, standard s where w.id = %f and w.standard_id = s.id',
    [AWorkorder_ID]);
  ATopArinvt_ID := SelectValueFmtAsFloat
    ('select arinvt_id from workorder_bom where id = %f',
    [ATopItemWorkorder_BOM_ID]);

  if AMfgtype_Lookup = 'MBATCH' then
    Result := SelectValueFmtAsFloat(
      'select sum(ptsper_internal)                                         ' +
      '  from workorder_bom b                                              ' +
      ' where workorder_id = %f                                            ' +
      '   and kind = ''COMPONENT''                                         ' +
      '   and parent_arinvt_id = %f                                        ' +
      // grab only directly attached, skip phantom or blend components ptsper
      '   and (b.sndop_id is null and nvl(b.class, ''*'') <> ''PK''        ' +
      '        or                                                          ' +
      '       (select op_class from sndop where id = b.sndop_id) = ''IN'') ' +
      '  start with id = %f                                                ' +
      ' connect by parent_id = prior id                                    ',
      [AWorkorder_ID,
      ATopArinvt_ID,
      ATopItemWorkorder_BOM_ID]) * 100
  else
    Result := SelectValueFmtAsFloat(
      'select sum(percent)                                                 ' +
      '  from workorder_bom b                                              ' +
      ' where workorder_id = %f                                            ' +
      '   and kind = ''COMPONENT''                                         ' +
      '   and (b.sndop_id is null and nvl(b.class, ''*'') <> ''PK''         ' +
      '        or                                                          ' +
      '       (select op_class from sndop where id = b.sndop_id) = ''IN'') ' +
      '  start with id = %f                                                ' +
      ' connect by parent_id = prior id                                    ',
      [AWorkorder_ID,
      ATopItemWorkorder_BOM_ID]);
end;

procedure EnsureExistsWorkorder_BOM(AWorkorder_ID: Real);
begin
  if SelectValueByID('firm', 'workorder', AWorkorder_ID) <> 'Y' then
    ExecuteCommandFmt('begin irv32.Convert_To_Firm( %f, ''Y'' ); end;',
      [AWorkorder_ID]);

  if SelectValueFmtAsFloat
    ('select count(*) from workorder_bom where workorder_id = %f',
    [AWorkorder_ID]) = 0 then
  begin
    ExecuteCommandFmt('begin wo_bom.populate_workorder_bom( %f ); end;',
      [AWorkorder_ID]);
    ExecuteCommandFmt
      ('update workorder set is_hard_allocated = ''Y'' where id = %f',
      [AWorkorder_ID]);
  end;
end;

procedure UpdateDayUseAlternateItem(AWorkorder_ID, AArinvt_Alternate_ID: Real;
  AFirstMustArriveDate: TDateTime);
var
  AOrigArinvt_ID: Real;
  AAlternateArinvt_ID: Real;
  A: Variant;
begin
  A := SelectValueArrayFmt
    ('select parent_arinvt_id, arinvt_id from arinvt_alternate where id = %f',
    [AArinvt_Alternate_ID]);
  if VarArrayDimCount(A) = 0 then
    EXIT;
  AOrigArinvt_ID := A[0];
  AAlternateArinvt_ID := A[1];
  // overloaded
  UpdateDayUseAlternateItem(AWorkorder_ID, AOrigArinvt_ID, AAlternateArinvt_ID,
    AFirstMustArriveDate);
end;

procedure UpdateDayUseAlternateItem(AWorkorder_ID, AOrigArinvt_ID,
  AAlternateArinvt_ID: Real; AFirstMustArriveDate: TDateTime);
begin
  ExecuteCommandFmt(
    'declare                                                  ' +
    '  v_workorder_id number::= %f;                           ' +
    '  v_must_arrive date::= to_date(''%s'', ''mm/dd/yyyy''); ' +
    '  v_exist_arinvt_id number::= %f;                        ' +
    '  v_alt_arinvt_id number::= %f;                          ' +
    'begin                                                    ' +
    '  for v in (select u.id                                  ' +
    '             from day_hrs h, day_pts p, day_use u        ' +
    '            where h.workorder_id = v_workorder_id        ' +
    '              and h.id = p.day_hrs_id                    ' +
    '              and p.id = u.day_pts_id                    ' +
    '              and u.arinvt_id = v_exist_arinvt_id        ' +
    '              and u.prod_date >= v_must_arrive )         ' +
    '  loop                                                   ' +
    '    update day_use                                       ' +
    '       set tot_mat_qty = 0,                              ' +
    '           alternate_arinvt_id = v_alt_arinvt_id,        ' +
    '           alternate_qty = tot_mat_qty                   ' +
    '     where id = v.id;                                    ' +
    '  end loop;                                              ' +
    'end;                                                     ',
    [AWorkorder_ID,
    FormatDateTime('mm/dd/yyyy', AFirstMustArriveDate),
    AOrigArinvt_ID,
    AAlternateArinvt_ID]);
end;

function IsAlternateAppliedToWorkorder: Boolean;
begin
  Result := SelectValueAsString
    ('select apply_alternate_item_to_wo from params') = 'Y'
end;

function IsPrimaryMaterialBlendComponent(AWorkorder_ID,
  AArinvt_ID: Real): Boolean;
var
  ASndop_ID: Real;
  AMatArinvt_ID: Real;
begin
  Result := False;
  if AArinvt_ID = 0 then
    EXIT;
  AMatArinvt_ID := SelectValueByID('arinvt_id_mat', 'v_workorder_standard',
    AWorkorder_ID);
  if AMatArinvt_ID = 0 then
    EXIT;

  ASndop_ID := SelectValueFmtAsFloat
    ('select id from sndop where arinvt_id = %f', [AMatArinvt_ID]);
  Result := (ASndop_ID > 0)
    and
    (SelectValueFmtAsFloat
    ('select 1 from opmat where sndop_id = %f and arinvt_id = %f',
    [ASndop_ID, AArinvt_ID]) = 1);
end;

{ TWOHardAllocCargo }

constructor TWOHardAllocCargo.Create(ADirectedFGMulti_ID: Real);
begin
  FilterType := aftNone;
  Division_ID := 0;
  Qty := 0;
  Work_Center_ID := 0;
  DirectedFGMulti_ID := ADirectedFGMulti_ID;
end;

end.
