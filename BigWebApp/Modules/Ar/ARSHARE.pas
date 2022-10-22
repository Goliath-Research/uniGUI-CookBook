unit ArShare;

interface

uses
  db;

procedure AssignMCAccount(AID:Real; AField:TField);
procedure AssignMCAccountX(AID:Real; var AAcctId:Real);
procedure CheckPostDate(ADate:TDateTime; aPeriodsId:Real; AKey:String);


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  SysUtils,
  ap_rscstr;

procedure AssignMCAccount(AID:Real; AField:TField);
var
  AGLValue:String;
  AGLAcct, aNewGLAcct:String;
  I, nStart, nLength:Integer;
  nID:Real;
begin
  AGLValue := SelectValueFmtAsString('select glvalue from currency where id = %f', [AId]);
  AGLAcct := SelectValueFmtAsString('select acct from glacct where id = %f', [AField.asFloat]);
  aNewGLAcct := AGLAcct;
  nStart  := Trunc(SelectValueAsFloat('select group_start from glacct_def where group_name = ' +
                       '(select FX_SEGMENT_NAME from iqsys)'));
  nLength  := Trunc(SelectValueAsFloat('select group_length from glacct_def where group_name = ' +
                       '(select FX_SEGMENT_NAME from iqsys)'));
  if Length(aNewGLAcct) < (nStart + nLength - 1) then
    ANewGLAcct := AGLAcct
  else
  begin
    try
      for I:= nStart to (nStart + nLength - 1) do
        ANewGLAcct[ I ] := AGLValue[ I - nStart + 1 ];
    except
      ANewGLAcct := AGLAcct;
    end;
  end;
  nID := SelectValueFmtAsFloat('select id from glacct where acct = ''%s''', [ANewGLAcct]);
  if nID = 0 then
  begin
    nID := AField.asFloat;
  end;
  AField.asFloat := nID;
end;

procedure AssignMCAccountX(AID:Real; var AAcctId:Real);
var
  AGLValue:String;
  AGLAcct, aNewGLAcct:String;
  I, nStart, nLength:Integer;
  nID:Real;
begin
  AGLValue := SelectValueFmtAsString('select glvalue from currency where id = %f', [AId]);
  AGLAcct := SelectValueFmtAsString('select acct from glacct where id = %f', [AAcctId]);
  aNewGLAcct := AGLAcct;
  nStart  := Trunc(SelectValueAsFloat('select group_start from glacct_def where group_name = ' +
                       '(select FX_SEGMENT_NAME from iqsys)'));
  nLength  := Trunc(SelectValueAsFloat('select group_length from glacct_def where group_name = ' +
                       '(select FX_SEGMENT_NAME from iqsys)'));
  if Length(aNewGLAcct) < (nStart + nLength - 1) then
    ANewGLAcct := AGLAcct
  else
  begin
    try
      for I:= nStart to (nStart + nLength - 1) do
        ANewGLAcct[ I ] := AGLValue[ I - nStart + 1 ];
    except
      ANewGLAcct := AGLAcct;
    end;
  end;
  nID := SelectValueFmtAsFloat('select id from glacct where acct = ''%s''', [ANewGLAcct]);
  if nID = 0 then
  begin
    nID := AAcctId;
  end;
  AAcctId := nID;
end;

procedure CheckPostDate(ADate:TDateTime; aPeriodsId:Real; AKey:String);
var
  aDateStr1, aDateStr2, aDateStr3:String;
begin
  if SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and id = %f',
     [FormatDateTime('mm/dd/yyyy', aDate), aPeriodsId]) <> 0 then exit;

 aDateStr1 := FormatDateTime('mm/dd/yyyy', aDate);
 aDateStr2 := FormatDateTime('mm/dd/yyyy', SelectValueFmtAsFloat('select start_date from glperiods where id = %f', [aPeriodsId]));
 aDateStr3 := FormatDateTime('mm/dd/yyyy', SelectValueFmtAsFloat('select end_date from glperiods where id = %f', [aPeriodsId]));

 if not IQWarningYNChk(Format(ap_rscstr.cTXT0000142, [aDateStr1, aDateStr2, aDateStr3]), AKey) then Abort;
end;

end.

