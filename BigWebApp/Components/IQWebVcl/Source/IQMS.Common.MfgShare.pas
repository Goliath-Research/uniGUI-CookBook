unit IQMS.Common.MfgShare;

interface

uses
  System.SysUtils, Winapi.Windows, System.Classes, FireDAC.Comp.Client,
  FireDAC.Phys;  // ,   db_dm;

const
  // see how we populate grid drop down with predefined MfgTypes
  IQPredefinedMfgType: array[ 0..28 ] of string = ( 'BLOWMOLD',
                                                    'DIECAST',
                                                    'EXTRUSION',
                                                    'EXTRUSION2',
                                                    'EXTRUSION3',
                                                    'GENERIC',
                                                    'INJECTION',
                                                    'OUTSOURCE',
                                                    'ROTATIONAL',
                                                    'THERMOSET',
                                                    'JOBSHOP',
                                                    'STAMPING',
                                                    'FAB',
                                                    'THERMOFORM',
                                                    'MBATCH',
                                                    'TFORM2',
                                                    'ASSY1',
                                                    'ASSY2',
                                                    'RIM',
                                                    'PM',
                                                    'REWORK',
                                                    'SFOAM',
                                                    'ASSY3',
                                                    'ASSEMBLY',
                                                    'COMPLEX',
                                                    'COMPOUND1',
                                                    'SLITTING',
                                                    'TREATMENT',
                                                    'MBATCH2');


function IsPredefinedMfgType(AMfgType: string): Boolean;
function Lookup_MfgType( AMfgType: string ): string;
function IsMfgTypePM( AMfgType: string ): Boolean;
function IsMfgTypeRework( AMfgType: string ): Boolean;
function GetAssy1ProcessCertification: string;
function IsMfgTypeSimilarToASSY1( AMfgType: string ): Boolean;
function WorkCenterBelongsToComplex( AWork_Center_ID: Real ): Boolean;
function IsComplexWorkorder( AWorkorder_ID: Real ): Boolean;
function IsUsingMfgType( AMfgType: string ): Boolean;
procedure AssignDefaultShiftBackflushRule( AMfg_Type: string; var AReuse, AReuseSprue: string );
function ReassignSequenceOfChildRecords( ATableName, AParentFKName: string; AParent_ID, AID: Real; AUpDown: Integer {+1 or -1}): Boolean;
function IsWorkorderPRW( AWorkorder_ID: Real ): Boolean;
function IsDefaultUomWeight( AMfgtype: string ): Boolean;
function CompareMfgType( AMfgtype: string; AStandard_ID: Real ): Boolean;
function IsOverheadPostedFromTA( AMfgType: string ): Boolean;
function IsMfgTypeByWeight( AMfgType: string ): Boolean;

implementation

uses IQMS.Common.DataLib,
     IQMS.Common.StringUtils,
     IQMS.Common.NLS;

function IsPredefinedMfgType(AMfgType: string): Boolean;
var
  I: Integer;
begin
  for I:= 0 to High(IQPredefinedMfgType) do
    if IQPredefinedMfgType[ I ] = AMfgType then
    begin
      Result:= TRUE;
      EXIT;
    end;
  Result:= FALSE;
end;


function Lookup_MfgType( AMfgType: string ): string;
begin
  Result:= SelectValueFmtAsString('select mfg.lookup_mfgtype( ''%s'' ) from dual', [ FixStr(AMfgType) ]);
end;


function IsMfgTypePM( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.is_mfgtype_pm( ''%s'' ) from dual', [ FixStr(AMfgType) ]) = 1;
end;

function IsMfgTypeRework( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.is_mfgtype_rework( ''%s'' ) from dual', [ FixStr(AMfgType) ]) = 1;
end;

function IsMfgTypeSimilarToASSY1( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.is_similar_to_assy1( ''%s'' ) from dual', [ FixStr(AMfgType) ]) = 1;
end;

function GetAssy1ProcessCertification: string;
begin
  Result:= SelectValueAsString('select assy1_process_certification from mfgtype where mfgtype = ''ASSY1''');  // return J (Cerified Jobs) or E (Cerifired Employees)
  if Result = '' then
     Result:= 'J';  // default to Cerified Jobs
end;

function WorkCenterBelongsToComplex( AWork_Center_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.work_center_belong_to_complex( %f ) from dual', [ AWork_Center_ID ]) = 1;
end;

function IsComplexWorkorder( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat( 'select workorder_misc.is_complex_workorder(%f) from dual', [ AWorkorder_ID ]) = 1;
end;

function IsUsingMfgType( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from mfgtype where rtrim(mfgtype) = ''%s'' or rtrim(standard_mfgtype) = ''%s''',
                     [ FixStr(AMfgType), FixStr(AMfgType) ]) = 1;
end;

procedure AssignDefaultShiftBackflushRule( AMfg_Type: string; var AReuse, AReuseSprue: string );
var
  AFlag: string;
begin
  AFlag:= SelectValueFmtAsString('select shift_backflush_rule from mfgtype where rtrim(mfgtype) = ''%s''', [ FixStr(Trim( AMfg_Type ))]);

  if AFlag = 'S' then
     begin
        AReuse:= 'N';
        AReuseSprue:= 'N';
     end

  else if AFlag = 'P' then
     begin
        AReuse:= 'N';
        AReuseSprue:= 'Y';
     end

  else if AFlag = 'G' then
     begin
        AReuse:= 'Y';
        AReuseSprue:= 'N';
     end

  else
     begin
        AReuse:= 'N';
        AReuseSprue:= 'N';
     end;
end;


function ReassignSequenceOfChildRecords( ATableName, AParentFKName: string; AParent_ID, AID: Real; AUpDown: Integer {+1 or -1}): Boolean;
var
  I, J: Integer;
  AList: TStringList;

  procedure LoadExistingIntoList;
  begin
//    with TFDQuery.Create( nil ) do
//    try
//      Connection := db_dm.FDConnection;
//      SQL.Add(IQFormat('select id, seq from %s where %s = %f order by seq', [ ATableName, AParentFKName, AParent_ID ]));
//      Open;
//      while not Eof do
//      begin
//        AList.AddObject( Fields[ 0 ].asString, Pointer( Fields[ 1 ].asInteger ));
//        Next;
//      end;
//    finally
//      Free;
//    end;
  end;


begin
  Result:= FALSE;

  AList:= TStringList.Create;
  try
    // load existing
    LoadExistingIntoList;

    // fix based on the new seq
    if (AID > 0) and (AUpDown <> 0) then
    begin
      I:= AList.IndexOf( FloatToStr( AID ));
      J:= I + AUpDown;
      if (J >= 0) and (J <= AList.Count - 1) then
        AList.Move( I, J );
    end;

    // ensure seq up to date
    for I:= 0 to AList.Count - 1 do
      if LongInt( AList.Objects[ I ]) <> (I + 1) then
      begin
         Result:= TRUE;
         ExecuteCommandFmt('update %s set seq = %d where id = %s',
                   [ ATableName,
                     I + 1,
                     AList[ I ]]);
      end;
  finally
    AList.Free;
  end;
end;

function IsWorkorderPRW( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.is_workorder_prw( %f ) from dual', [ AWorkorder_ID ]) = 1;
end;

function IsDefaultUomWeight( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.is_weight(''%s'') from dual', [AMfgType]) = 1;
end;

function CompareMfgType( AMfgtype: string; AStandard_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.compare_mfgtype( ''%s'', %f ) from dual', [ Trim(AMfgtype), AStandard_ID ]) = 1;
end;

function IsOverheadPostedFromTA( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsString('select overhead_posted_by_ta from mfgtype where rtrim(mfgtype) = ''%s''', [ Trim(AMfgType) ]) = 'Y';
end;

function IsMfgTypeByWeight( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select mfg.is_weight( ''%s'' ) from dual', [ AMfgType ]) = 1;
end;

end.



