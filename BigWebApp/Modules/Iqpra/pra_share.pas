unit pra_share;

interface

uses
  Winapi.Windows,
  Data.DB,
  MainModule;

type
  // 09-24-2014 used (optional) in iqpra_html.AddHTMLDBGrid to tweak
  // column value written to the html page
  TAssignHtmlColumnText = procedure(Sender: TObject; AField: TField;
    var AFieldText: string) of object;

function GetFGMulti_ID(const AArinvt_ID, ALoc_ID: Real;
  const ALotNo: string): Real;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;

function GetFGMulti_ID(const AArinvt_ID, ALoc_ID: Real;
  const ALotNo: string): Real;
begin
  Result := 0;

  { Is Unique date is turned on }
  if SelectValueFmtAsFloat(
    'select 1 from arinvt where id = %f and NVL(onhand,0) <> 0 and ' +
    'NVL(unque_date_in, ''N'') = ''Y''',
    [AArinvt_ID]) = 1 then
    Result := 0
  else
    { Get FGMulti with the same Loc_ID and Lot# }
    Result := SelectValueFmtAsFloat(
      'select f.id from fgmulti f where f.arinvt_id = %f and ' +
      'f.loc_id = %f and NVL(RTrim(f.lotno), ''@'') = ''%s''',
      [AArinvt_ID, ALoc_ID, IIf(ALotNo = '', '@', ALotNo)]);

  { No FGMulti found - create one }
  if Result <= 0 then
    begin
      Result := GetNextID('FGMULTI');
      ExecuteCommandFmt(
        'insert into fgmulti (id, arinvt_id, loc_id, lotno) ' +
        'values ( %f, %f, %f, ''%s'' )',
        [Result, AArinvt_ID, ALoc_ID, ALotNo]);
    end;
end;

end.
