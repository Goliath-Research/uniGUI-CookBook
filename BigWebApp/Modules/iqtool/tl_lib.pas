unit tl_lib;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

{ Parameters:
  ARFQ = The Project # (optional)
  AProject = The Project name or description (optional)
  AArcustoID = Customer ID (required)
  ANewID = New TOOL_RFQ.ID.  Note: If a value is supplied, it will be used.
}
function CreateToolingProject(ARFQ, AProject: String; const AArcustoID: Int64;
  var ANewID: Int64): Boolean;

procedure GetDurationFromFloat(ADurationValue: Real; var ADuration: Real;
  var ADurationUnit: Integer);

procedure GetDurationFromDates(AStart, AFinish: TDateTime; AEPlantID: Int64;
  var ADuration: Real; var ADurationUnit: Integer);

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  iqtool_rscstr;

function CreateToolingProject(ARFQ, AProject: String; const AArcustoID: Int64;
  var ANewID: Int64): Boolean;
begin
  // Validate params
  if (AArcustoID = 0) then
    // 'A Customer is required.  Please select a Customer before attempting to create a new Project.'
    raise Exception.Create(iqtool_rscstr.cTXT0000126);

  if ANewID = 0 then
    ANewID := GetNextID('TOOL_RFQ');
  if Trim(ARFQ) = '' then
    ARFQ := FloatToStr(ANewID);
  if Trim(AProject) = '' then
    AProject := ARFQ;

  // Insert record
  try
    with TFDStoredProc.Create(NIL) do
      try
        Connection := UniMainModule.FDConnection1;
        StoredProcName := 'IQMS.PROJECT.ADD_PROJECT';
        Prepare;
        ParamByName('p_arcusto_id').Value := AArcustoID;
        ParamByName('p_rfq').Value := ARFQ;
        ParamByName('p_project').Value := AProject;
        ParamByName('p_new_id').Value := ANewID;
        ExecProc;
        ANewID := ParamByName('p_new_id').AsLargeInt;
      finally
        Free;
      end;

    Result := ANewID > 0;

  except
    on E: Exception do
      IQError(E.Message); // handle error here
  end;
end;

procedure GetDurationFromFloat(ADurationValue: Real; var ADuration: Real;
  var ADurationUnit: Integer);
begin
  try
    with TFDStoredProc.Create(NIL) do
      try
        Connection := UniMainModule.FDConnection1;
        StoredProcName := 'IQMS.PROJECT_CALENDAR.GET_DURATION_FROM_FLOAT';
        Prepare;
        ParamByName('p_duration_asfloat').Value := ADurationValue;
        ExecProc;
        ADuration := ParamByName('p_duration').AsFloat;
        ADurationUnit := ParamByName('p_duration_unit').AsInteger;
      finally
        Free;
      end;
  except
    on E: Exception do
      IQError(E.Message); // handle error here
  end;
end;

procedure GetDurationFromDates(AStart, AFinish: TDateTime; AEPlantID: Int64;
  var ADuration: Real; var ADurationUnit: Integer);
var
  ADurationValue: Real;
begin
  ADurationValue := SelectValueFmtAsFloat(
    'SELECT iqms.project_calendar.get_duration_from_dates(    '#13 +
    '          TO_DATE(''%s'',                  '#13 +
    '                  ''MM/DD/RRRR HH24:MI:SS''), '#13 +
    '          TO_DATE(''%s'', '#13 +
    '                  ''MM/DD/RRRR HH24:MI:SS''), '#13 +
    '          %d) '#13 +
    '          AS VALUE '#13 +
    '  FROM DUAL',
    [FormatDateTime('mm/dd/yyyy hh:nn:ss', AStart),
    FormatDateTime('mm/dd/yyyy hh:nn:ss', AFinish),
    AEPlantID]);
  GetDurationFromFloat(ADurationValue, ADuration, ADurationUnit);
end;

end.
