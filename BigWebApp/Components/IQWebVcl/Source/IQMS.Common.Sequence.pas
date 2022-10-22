unit IQMS.Common.Sequence;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Variants;


function SequenceExists(SequenceName: string): Boolean;
function GetNextSequenceNumber(SequenceName: string; DB: string = 'IQFD'): Real; overload;
procedure SetNextSequenceNumber(ANewValue:Real; SequenceName: string );
procedure SetCurrentSequenceNumber(ANewValue:Real; SequenceName: string );
function GetCurrentSequenceNumber(SequenceName: string): UInt64;
function IsLastSequence(ATableName, AFieldName: string; ATableID: Int64):Boolean;
procedure ResetSequence(ATableName, AFieldName, ASequenceName: string; AMaxID, ACurrentSequence: Real);
function GetEPlantSequenceName( const AEPlant_ID, AModule, ADefaultName: string ): string;
function GetEPlantNextSequenceNumber ( var AEPlant_ID: string; AModuleCode, ADefaultSeqName: string ): string;
function GetEPlantNextSequenceNumberA( var AEPlant_ID: string; AModuleCode, ADefaultSeqName: string ): string;
function GetEPlantNextSequenceNumberB( AEPlant_ID: string; AModuleCode, ADefaultSeqName: string ): string;
function GetEPlantNextSequenceNumberC( AEPlant_ID: string; ASeqName: string ): string;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.SecurityManager;
  //Plnt_Bas;

function SequenceExists(SequenceName: string): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1                                         '#13 +
    '  FROM all_sequences                             '#13 +
    ' WHERE sequence_owner = ''IQMS'' AND             '#13 +
    '       UPPER(sequence_name) = UPPER(''%s'') AND  '#13 +
    '       ROWNUM < 2                                ',
    [Trim(SequenceName)]) = 1;
end;

function GetNextSequenceNumber( SequenceName: string; DB: string = 'IQFD'):Real;
var
  IQLockHandle: string;
begin
  if not SequenceExists(SequenceName) then
  try
//    IQLockSemaphor( IQLockHandle, 'IQMS-'+SequenceName );
    ExecuteCommandFmt('create sequence %s start with 1 NoCache NoCycle', [ SequenceName ]);
  finally
//    IQReleaseSemaphor( IQLockHandle );
  end;

  Result:= SelectValueFmtAsInt64('select %s.NEXTVAL from dual', [ SequenceName ]);
end;

procedure SetNextSequenceNumber(ANewValue: Real; SequenceName: string );
begin
  SetCurrentSequenceNumber(ANewValue + 1, SequenceName);
end;

procedure SetCurrentSequenceNumber(ANewValue:Real; SequenceName: string );
var
  IQLockHandle: string;
  AMinValue, AMaxValue, AIncrementBy, ACacheSize,
  ACycleFlag, AOrderFlag, CYCLEParam: string;
  AData: Variant;
begin
  // Initialize to defaults
  AMinValue := '1';
  AMaxValue := '999999999999999999999999999';
  AIncrementBy := '1';
  ACycleFlag := 'N';
  AOrderFlag := 'N';
  ACacheSize := '20';
  CYCLEParam := 'NOCYCLE';

//  IQLockSemaphor( IQLockHandle, 'IQMS-'+SequenceName  );
  try
    AData := SelectValueArrayFmt(
      'SELECT min_value, max_value, increment_by,                   '#13 +
      '       cycle_flag, order_flag, cache_size                    '#13 +
      '  FROM dba_sequences                                         '#13 +
      ' WHERE sequence_owner = ''IQMS'' AND                         '#13 +
      '       sequence_name = UPPER(TRIM(''%s''))                   ',
      [SequenceName]);

    if System.Variants.VarArrayDimCount(AData) > 0 then
      begin
        AMinValue := System.Variants.VarToStr(AData[0]);
        AMaxValue := System.Variants.VarToStr(AData[1]);
        AIncrementBy := System.Variants.VarToStr(AData[2]);
        ACycleFlag := System.Variants.VarToStr(AData[3]);
        AOrderFlag := System.Variants.VarToStr(AData[4]);
        ACacheSize := System.Variants.VarToStr(AData[5]);
      end;

    if ACycleFlag = 'Y' then
      CYCLEParam := 'CYCLE';

    try
      ExecuteCommand(Format('DROP SEQUENCE %s', [SequenceName]));
    except
    end;

    ExecuteCommandFmt(
      'CREATE SEQUENCE %s            '#13 +
      '   INCREMENT BY %s            '#13 +
      '   START WITH %.0f            '#13 +
      '   MINVALUE %s                '#13 +
      '   MAXVALUE %s                '#13 +
      '   %s                         '#13 +
      '   NOCACHE                    ',
      [SequenceName,
       AIncrementBy,
       ANewValue,
       AMinValue,
       AMaxValue,
       CYCLEParam]);
  finally
//    IQReleaseSemaphor( IQLockHandle );
  end;
end;

function IsLastSequence(ATableName, AFieldName: string; ATableID: Int64):Boolean;
begin
  Result := ATableID >= SelectValueFmtAsInt64('select max(%s) from %s',
    [AFieldName, ATableName]);
end;

procedure ResetSequence(ATableName, AFieldName, ASequenceName: string; AMaxID,
  ACurrentSequence: Real);
begin
  if IsLastSequence(ATableName, AFieldName, Trunc(AMaxID)) then
     SetNextSequenceNumber(ACurrentSequence - 1, ASequenceName)
end;

function GetEPlantSequenceName( const AEPlant_ID, AModule, ADefaultName: string ): string;
var
  ID: Int64;
begin
  Result:= ADefaultName;

  if Pos( '__'+ AModule+'__',  '__AF__PS__AR__PO__SO__RMA__RFQ__PO_REC__PHYS__MAN_PS__JOBSHOP__CAR__BOL__ECO__APQP__WORKFLOW__PPAP__CD__CR__PR__FA__GJ__FX__BM__AP__AL__') = 0 then
  begin
    // Byron:  Do not internationalize this msg, since it is for developers
    IQWarning(Format('Wrong module name [%s] is passed to GetEPlantSequenceName', [ AModule ]));
    EXIT;
  end;

  if (CompareText(AEPlant_ID, 'NULL') <> 0) and
    TryStrToInt64(AEPlant_ID, ID) and
    (ID > 0) then
  begin
//    try
//      ID:= StrToInt64( AEPlant_ID );
//    except
//      EXIT;
//    end;

    if ID = 0 then
       EXIT;

    if not (
            ((AModule = 'AR') and (SelectValueAsString('select NVL(USE_AR_SEQ_ALL_EPLANTS, ''N'') from iqsys2 where rownum < 2') = 'Y')) or
            ((AModule = 'PS') and (SelectValueAsString('select NVL(USE_PS_SEQ_ALL_EPLANTS, ''N'') from iqsys2 where rownum < 2') = 'Y'))
           ) then
      Result := Format('S_EPLANT_%s_%s', [ AModule, AEPlant_ID ]);  {S_EPLANT_AR_10}
  end;
end;

function GetEPlantNextSequenceNumber( var AEPlant_ID: string; AModuleCode, ADefaultSeqName: string ): string;
begin
  //AEPlant_ID:= SecurityManager.EPlant_ID;
  Result    := GetEPlantNextSequenceNumberA( AEPlant_ID, AModuleCode, ADefaultSeqName );
end;

function GetEPlantNextSequenceNumberA( var AEPlant_ID: string; AModuleCode, ADefaultSeqName: string ): string;
begin
//  if SecurityManager.EPlantsExist and ((AEPlant_ID = 'NULL') or (AEPlant_ID = '') or (AEPlant_ID = '0'))then
//     DoPickEPlant( AEPlant_ID );
  Result:= GetEPlantNextSequenceNumberB( AEPlant_ID, AModuleCode, ADefaultSeqName );
end;

function GetEPlantNextSequenceNumberB( AEPlant_ID: string; AModuleCode, ADefaultSeqName: string ): string;
var
  S: string;
begin
  {Based on EPlant activate sequence and get next orderno}
  S:= GetEPlantSequenceName( AEPlant_ID, AModuleCode, ADefaultSeqName );
  Result:= GetEPlantNextSequenceNumberC( AEPlant_ID, S );
end;

function GetEPlantNextSequenceNumberC( AEPlant_ID: string; ASeqName: string ): string;
begin
  Result:= IntToStr(Trunc(GetNextSequenceNumber(ASeqName)));

  {Append Suffix}
  IQAppend_EPlant_Suffix( AEPlant_ID, Result );
end;


function GetCurrentSequenceNumber(SequenceName:String): UInt64;
begin
  Result := SelectValueFmtAsInt64(
    'select last_number from user_sequences ' +
   'where upper(sequence_name) = ''%s''',
   [UpperCase(SequenceName)]);
end;

end.
