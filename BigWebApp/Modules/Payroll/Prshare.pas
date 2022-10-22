unit PRShare;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;


const
   iq_PR_General    = 0;
   iq_PR_TimeCard   = 1;

var
  FDir:String;
  FQry:TFDQuery;
  FDDFileName:String;
  FBankID:Real;
  FDDFile:TextFile;
  FHash  :Int64;
  FCounter :Integer;
  FBlocks :Integer;
  FCredit:Real;
  FDebit :Real;

  FUseTemplate:Boolean;
  FTransSetId:String;

procedure OpenDDFile(AFiles:TStringList);
procedure CloseDDFile;
procedure WriteDetailRecord;
function CreateDDOutput(AQry:TFDQuery; AFiles:TStringList; ATemplate:String):Boolean;
function GetPayGroupFilter:String;
function GetPayGroupFilterWithID:String;
procedure CheckAccruedQty(APrEmpId, APrPayTypeId, AHrsQty:Real; ADate:TDateTime);
function CheckAccruedQty2(APrEmpId, APrPayTypeId, AHrsQty:Real; ADate:TDateTime; ATableName:String = 'TA_EMP_CALENDAR'; AId:Real = 0):boolean;
function IdentifyPayrollLicense: Integer;

function GetSqlValue(ASql:String; AId:Real):String;
procedure WriteTemplate(AType:String);


implementation
uses
  IQMS.Common.Directory,
(*UG_rem_AMB*)
//iqdir has not been converted yet.
//  IqDir,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.WebVcl.SecurityManager,
  CheckNegativeAlert;


function IdentifyPayrollLicense: Integer;
var
  ACAN, AUSA:Boolean;
begin
  ACAN := SecurityManager.IsModuleLicensed('CANPayroll');
  AUSA := SecurityManager.IsModuleLicensed('Payroll');

  if ACAN and AUSA then
    Result := 0           //both
  else if AUSA then
    Result := 1
  else if ACAN then
    Result := 2
  else
    Result := -1;        // none
end;


function CreateDDOutput(AQry:TFDQuery; AFiles:TStringList; ATemplate:String):Boolean;
begin
  Result := False;
  if not DirBrowse( FDir ) then exit;
   FQry := AQry;

  FTransSetId := ATemplate;
  FUseTemplate := ATemplate <> '';

  with Fqry do
  begin
    Close;
    Open;
    FBankId := 0;
    while not eof do
    begin
      if FieldByName('bankinfo_id').asFloat <> FBankId then
      begin
        if FBankId <> 0 then
        begin
          Prior;
          CloseDDFile;
          Next;
        end;
        FBankId := FieldByName('bankinfo_id').asFloat;
        OpenDDFile(AFiles);
      end;
      WriteDetailRecord;
      Next;
    end;
    CloseDDFile;
  end;
  Result := True;
end;

procedure OpenDDFile(AFiles:TStringList);
var
  i:Integer;
  ALine:String;
begin
  i := 0;
  repeat
    Inc(i);
    if i > 99 then
      raise Exception.Create('Too many files created today please delete some');
    FDDFileName := SelectValueFmtAsString('select ''%s\'' || SubStr(LPad(To_Char(%f), 15, ''0''), 14, 2) || ' +
                          'To_Char(sysdate, ''MMDDYY'') || ''.'' || LPad(To_Char(%d), 3, ''0'') from dual',
                          [FDir, FBankId, i]);
  until not FileExists(FDDFileName);
  FDDFileName := StrTran(FDDFileName, '\\', '\');
  AFiles.Add(FDDFileName);
  AssignFile(FDDFile, FDDFileName);
  Rewrite(FDDFile);

  if FUseTemplate then
    WriteTemplate('HEADER')
  else
  begin
    ALine := SelectValueAsString('select RTrim(PR_DD_HEADER) from iqsys');
    if ALine <> '' then
      WriteLn(FDDFile, ALine);
    with FQry do
    begin
      ALine := '101' +
               FieldByName('bank_imm_destin').asString +
               FieldByName('bank_imm_origin').asString +
               FieldByName('file_creation_date').asString +
               FieldByName('file_creation_time').asString +
               '1094101' +
               FieldByName('bank_imm_destin_name').asString +
               FieldByName('bank_imm_origin_name').asString +
               '        ';
      WriteLn(FDDFile, ALine);

      ALine := '5200' +
               FieldByName('company_name').asString +
               '                    ' +
               FieldByName('company_number').asString +
               'PPD' +
               'PAYROLL   ' +
               FieldByName('file_creation_date').asString +
               FieldByName('effective_date').asString +
               '   1' +
               FieldByName('bank_aba').asString +
               '0000001';
      WriteLn(FDDFile, ALine);
    end;
  end;

  FHash    := 0;
  FCredit  := 0;
  FDebit   := 0;
  FCounter := 0;
end;

procedure WriteTemplate(AType:String);
var
  ALine:String;
begin
  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select s.sql_statement, s.id from segment_tokens s, master_segments m ' +
                     ' where s.master_segments_id = m.id and m.transaction_set_unique_id = ''%s'' ' +
                     'and m.seg_level = ''%s'' order by m.seq', [FTransSetId, AType]));
    Open;
    while not eof do
    begin
      ALine := GetSqlValue(UpperCase(FieldByName('sql_statement').asString), FieldByName('id').asFloat);
      if ALine <> '' then
      begin
        WriteLn(FDDFile, ALine);
        if aType =  'DETAIL' then
          Inc(FCounter);
      end;
      Next;
    end;
  finally
    Free;
  end;
end;

function GetSqlValue(ASql:String; AId:Real):String;
var
  MainQry:TFDQuery;
  DS:TDataSet;
  AFormName, ADataSet, AParamName, ADataSetFieldName, AToken_Code:String;
  ASqlText:String;
  ACount:Integer;
  I:Integer;
begin
  ASql := StrTran(aSql, 'FCOUNTER', Format('%d', [FCounter]));
  ASql := StrTran(aSql, 'FHASH',    Format('%d', [FHash]));
  ASql := StrTran(aSql, 'FBLOCKS',  Format('%d', [FBlocks]));
  ASql := StrTran(aSql, 'FDEBIT',   Format('%f', [FDebit]));
  ASql := StrTran(aSql, 'FCREDIT',  Format('%f', [FCredit]));
  Result := '';
  try
    try
      MainQry := TFDQuery.Create(Application);
      MainQry.Connection := UniMainModule.FDConnection1;
      MainQry.Sql.Add(ASql);

      ASqlText := MainQry.Sql.Text;
      with TFDQuery.Create(Application) do
      try
        Connection := UniMainModule.FDConnection1;
        Sql.Add(IQFormat('select * from %s where %s_id = %f order by seq',
                        ['SEGMENT_PARAMS', 'SEGMENT_TOKENS', AID]));
        Open;

        if (MainQry.ParamCount > 0) then
        begin
          if Eof then
             raise Exception.Create('No parameter records defined in Segment Params Table');

          while not eof do
          begin
            AParamName := FieldByName('PARAM_NAME').asString;
            ADataSetFieldName := FieldByName('DATASET_FIELD_NAME').asString;


            with MainQry.ParamByName(FieldByName('PARAM_NAME').asString) do
            begin
              DataType:= FQry.FieldByName(FieldByName('DATASET_FIELD_NAME').asString).DataType;
              AsString := FQry.FieldByName(FieldByName('DATASET_FIELD_NAME').asString).asString;
            end;

            if Copy(UpperCase(TrimLeft(MainQry.Sql.Text)), 1, 6) <> 'SELECT' then
              MainQry.Sql.Text := StrTran(MainQry.Sql.Text,
                                          ':' + FieldByName('PARAM_NAME').asString,
                                          MainQry.ParamByName(FieldByName('PARAM_NAME').asString).asString);


            Next;
          end;
        end;
      finally
        Free;
      end;

      MainQry.Sql.Text := TrimLeft(MainQry.Sql.Text);
      ExecuteCommand('begin edi_misc.arr_clear; end;');

      if Copy(UpperCase(MainQry.Sql.Text), 1, 6) = 'SELECT' then
      begin
        MainQry.Open;
        Result := MainQry.Fields[0].asString;
      end
      else
      begin
        ExecuteCommand(MainQry.Sql.Text);
        Result := SelectValueAsString('select EDI.EDI_String from dual');
      end;

      if Trim(Result) = 'USE_ARRAY' then
      begin
        Result := '';
        ACount := Trunc(SelectValueAsFloat('select edi_misc.arr_count from dual'));
        for I := 1 to ACount do
          Result := Result + SelectValueFmtAsString('select edi_misc.arr_get(%d) from dual', [I]);
      end;

    except on e:exception do
      begin
        raise Exception.Create(Format('Error %s'#13 +
                                      'Token Code          %s'#13 +
                                      'Form Name           %s'#13 +
                                      'DataSet             %s'#13 +
                                      'Parameter           %s'#13 +
                                      'Data Set Field Name %s'#13 +
                                      'Sql : %s'#13,
                                      [e.message, AToken_Code, AFormName, ADataSet, AParamName,
                                       ADataSetFieldName, ASqlText]));
      end;
    end;

  finally
    MainQry.Free;
  end;
end;



procedure CloseDDFile;
var
  ALine:String;
//  ABlocks:Integer;
  ARecNum, i:Integer;
  AHashStr:String;
  AHash:Int64;
  ALength:Integer;
begin
  with FQry do
  begin
    ARecNum :=0;
    if ((FCounter + 4) mod 10) = 0 then
      FBlocks := Trunc((FCounter + 4)/ 10)
    else
    begin
      FBlocks := Trunc((FCounter + 4)/10) + 1;
      ARecNum := FBlocks  * 10 - FCounter - 4;
    end;

    AHashStr := IntToStr(FHash);
    ALength  := Length(AHashStr);
    if ALength > 10 then
    begin
      AHashStr := Copy(AHashStr, ALength - 9, 10);
      AHash := StrToInt(AHashStr);
    end
    else
      AHash := FHash;

    if FUseTemplate then
      WriteTemplate('SUMMARY')
    else
    begin
      ALine := '8200' +
               SelectValueFmtAsString('select LPad(To_Char(%d), 6, ''0'') from dual', [FCounter]) +
               SelectValueFmtAsString('select LPad(To_Char(%d), 10, ''0'') from dual', [AHash]) +
               SelectValueFmtAsString('select LPad(To_Char(Round(%f * 100, 0)), 12, ''0'') from dual', [FDebit]) +
               SelectValueFmtAsString('select LPad(To_Char(Round(%f * 100, 0)), 12, ''0'') from dual', [FCredit]) +
               FieldByName('company_number').asString +
               Repl(' ', 25) +
               FieldByName('bank_aba').asString +
               '0000001';
      WriteLn(FDDFile, ALine);

      ALine := '9' +
               SelectValueFmtAsString('select LPad(To_Char(%d), 6, ''0'') from dual', [1]) +
               SelectValueFmtAsString('select LPad(To_Char(%d), 6, ''0'') from dual', [FBlocks]) +
               SelectValueFmtAsString('select LPad(To_Char(%d), 8, ''0'') from dual', [FCounter]) +
               SelectValueFmtAsString('select LPad(To_Char(%d), 10, ''0'') from dual', [AHash]) +
               SelectValueFmtAsString('select LPad(To_Char(Round(%f * 100, 0)), 12, ''0'') from dual', [FDebit]) +
               SelectValueFmtAsString('select LPad(To_Char(Round(%f * 100, 0)), 12, ''0'') from dual', [FCredit]) +
               Repl(' ', 39);
      WriteLn(FDDFile, ALine);
    end;
    ALine := Repl(' ', 94);
    if SelectValueAsString('select NVL(PR_DD_USE_PADDING_LINES, ''Y'') from iqsys') = 'Y' then
    for i := 1 to ARecNum
      do WriteLn(FDDFile, ALine);
  end;
  CloseFile(FDDFile);
end;

procedure WriteDetailRecord;
var
  ALine:String;
  AHash:Int64;
begin
  with FQry do
  begin
    if Trim(FieldByName('recip_bank_no').asString) = ''
      then AHash := 0
    else AHash := Trunc(StrToFloat(FieldByName('recip_bank_no').asString));
    FHash := FHash + AHash;
    if FieldByName('num_amount').asFloat > 0 then
      FCredit  := FCredit + FieldByName('num_amount').asFloat
    else
      FDebit   := FDebit + Abs(FieldByName('num_amount').asFloat);

    if FUseTemplate then
      WriteTemplate('DETAIL')
    else
    begin
      ALine := '6' +
               FieldByName('trans_code').asString +
               FieldByName('recip_bank_no').asString +
               FieldByName('recip_bank_no_check_digit').asString +
               FieldByName('recip_bank_account').asString +
               FieldByName('amount').asString +
               FieldByName('empno').asString +
               FieldByName('emp_name').asString +
               '  0' +
               FieldByName('bank_aba').asString +
               SelectValueFmtAsString('select LPad(%d, 7, ''0'') from dual', [FCounter]);
      WriteLn(FDDFile, ALine);
      Inc(FCounter);
    end;
  end;

end;


function GetPayGroupFilter:String;
begin
  Result := '';
  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select pr_paygroup_id from s_user_paygroup where user_name = ''%s''', [SecurityManager.UserName]));
    Open;
    while not eof do
    begin
      Result := Format('PR_PAYGROUP_ID=%d OR %s', [Trunc(FieldByName('pr_paygroup_id').asFloat), Result]);
      Next;
    end;
    if Result <> '' then
      Result := Copy(Trim(Result), 1, Length(Trim(Result)) - 3)
    else
      Result := 'PR_PAYGROUP_ID=-1'
  finally
    Free;
  end;
end;


function GetPayGroupFilterWithID:String;
begin
  Result := '';
  with TFDQuery.Create(Application) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select pr_paygroup_id from s_user_paygroup where user_name = ''%s''', [SecurityManager.UserName]));
    Open;
    while not eof do
    begin
      Result := Format('ID=%d OR %s', [Trunc(FieldByName('pr_paygroup_id').asFloat), Result]);
      Next;
    end;
    if Result <> '' then
      Result := Copy(Trim(Result), 1, Length(Trim(Result)) - 3)
    else
      Result := 'ID=-1'
  finally
    Free;
  end;
end;

procedure CheckAccruedQty(APrEmpId, APrPayTypeId, AHrsQty:Real; ADate:TDateTime);
var
  aQry:TFDQuery;
begin
  aQry := TFDQuery.Create(nil);
  try
    aQry.Connection := UniMainModule.FDConnection1;
    aQry.Sql.Add(IQFormat('select p.accrued_qty, ' +
                      't.description, ' +
                      'PAYROLL.IQ_GetEmployeeBenefitTakenQty(%f, %f, to_date(''%s'', ''MM/DD/RRRR'')) as qty_taken, ' +
                      'NVL(accrued_qty, 0) - PAYROLL.IQ_GetEmployeeBenefitTakenQty(%f, %f, to_date(''%s'', ''MM/DD/RRRR'')) - NVL(p.ta_taken, 0) as left_to_take ' +
                      'from PR_PAYTYPE_ACCRUED p, PR_PAYTYPE t where p.PR_PAYTYPE_ID = %f and p.PR_EMP_ID = %f ' +
                      'and t.id = %f ' +
                      'and to_date(''%s'', ''MM/DD/RRRR'') - p.start_date >= 0 ' +
                      'and to_date(''%s'', ''MM/DD/RRRR'') between p.start_date and NVL(p.end_date, sysdate + 40000) ' +
                      'and to_date(''%s'', ''MM/DD/RRRR'') - p.start_date = (select min(to_date(''%s'', ''MM/DD/RRRR'') - start_date) ' +
                                                                            'from PR_PAYTYPE_ACCRUED ' +
                                                                            'where PR_PAYTYPE_ID = %f and PR_EMP_ID = %f ' +
                                                                              'and to_date(''%s'', ''MM/DD/RRRR'') - start_date >= 0)',
                      [APrEmpId,
                       APrPayTypeId,
                       FormatDateTime('mm/dd/yyyy', ADate),
                       APrEmpId,
                       APrPayTypeId,
                       FormatDateTime('mm/dd/yyyy', ADate),
                       APrPayTypeId,
                       APrEmpId,
                       APrPayTypeId,
                       FormatDateTime('mm/dd/yyyy', ADate),
                       FormatDateTime('mm/dd/yyyy', ADate),
                       FormatDateTime('mm/dd/yyyy', ADate),
                       FormatDateTime('mm/dd/yyyy', ADate),
                       APrPayTypeId,
                       APrEmpId,
                       FormatDateTime('mm/dd/yyyy', ADate)]));
    aQry.Open;
    if not aQry.eof and aQry.bof then
    begin
//      if FieldByName('accrued_qty').asFloat - FieldByName('qty_taken').asFloat < AHrsQty then
//        IqWarning(Format('Qty of the %s paytype (%f) is greater than the Left To Take (%.3f)',
//                       [FieldByName('Description').asString,
//                        AHrsQty,
//                        FieldByName('accrued_qty').asFloat - FieldByName('qty_taken').asFloat]));

      if aQry.FieldByName('left_to_take').asFloat < AHrsQty then
        IqWarning(Format('Qty of the %s paytype (%f) is greater than the Left To Take (%.3f)',
                       [aQry.FieldByName('Description').asString,
                        AHrsQty,
                        aQry.FieldByName('left_to_take').asFloat]));

    end;
  finally
    aQry.Free;
  end;
end;

function CheckAccruedQty2(APrEmpId, APrPayTypeId, AHrsQty:Real; ADate:TDateTime; ATableName:String = 'TA_EMP_CALENDAR'; AId:Real = 0):boolean;
begin
  Result := DoCheckNegativeAlert( APrEmpId, APrPayTypeId, AHrsQty, ADate, ATableName, AId); {in CheckNegativeAlert.pas}
end;


end.
