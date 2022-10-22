unit crm_ccshare;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Variants,
  crm_ccconst,
//  IQMS_CallerID_TLB,
  MainModule;

// NOTE: This will return only one record.  Potentially, there could be
// multiple results for one telephone number
// procedure LookupTelephone(const TelephoneNumber: String; var CallerRec: TCallerRec);
procedure AddCallToHistory(const ACallerRec: TCallerRec;
  var ANewID: Real); overload;
procedure AddCallToHistory(const ACallerRec: TCallerRec;
  const AfterAddCallHistory: TAfterAddCallHistory); overload;
procedure GetTAPIDriverList(var AList: TStringList);

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager;

procedure AddCallToHistory(const ACallerRec: TCallerRec; var ANewID: Real);
var
  APrEmpID: Real;
begin
  ANewID := 0;
  APrEmpID := SelectValueFmtAsFloat('SELECT pr_emp_id FROM s_user_general ' +
    'WHERE UPPER(TRIM(user_name)) = ''%s''', [SecurityManager.UserName]);

  ANewID := GetNextID('CRM_CALLHIST');
  ExecuteCommandParam(
    Format(
    'INSERT INTO crm_callhist '#13 +
    '  (id, datetime_stamp, phone_number, callername,'#13 +
    '   direction, userid, pr_emp_id)'#13 +
    'VALUES (:ID, to_date(''%s'', ''MM/DD/RRRR HH24:MI''), :PHONE_NUMBER, '#13 +
    ':CALLERNAME, :DIRECTION, :USERID, :PR_EMP_ID)',
    [FormatDateTime('mm/dd/yyyy hh:nn', IQOracleAdjustedDateTime)]),
    ['ID', 'PHONE_NUMBER', 'CALLERNAME', 'DIRECTION', 'USERID', 'PR_EMP_ID'],
    [ANewID, ACallerRec.CallerNumber, ACallerRec.CallerName,
    crm_ccconst.dirCallIn, SecurityManager.UserName,
    IQMS.Common.Numbers.IIf(APrEmpID = 0, NULL, APrEmpID)]);

end;

procedure AddCallToHistory(const ACallerRec: TCallerRec;
  const AfterAddCallHistory: TAfterAddCallHistory);
var
  ACRMCallHistID: Real;
begin
  AddCallToHistory(ACallerRec, ACRMCallHistID);
  if Assigned(AfterAddCallHistory) then
    AfterAddCallHistory(ACRMCallHistID);
end;

procedure GetTAPIDriverList(var AList: TStringList);
var
//  ACallerID: TCallerID;
  ACount, i: Integer;
  s: string;
begin
  if not Assigned(AList) then
    Exit;
  AList.Clear;
//  ACallerID := TCallerID.Create(nil);
//  try
//    ACount := ACallerID.GetDeviceCount;
//    for i := 0 to ACount - 1 do
//      begin
//        s := ACallerID.GetDeviceName(i);
//        AList.Add(s);
//      end;
//  finally
//    if Assigned(ACallerID) then
//      FreeAndNil(ACallerID);
//  end;
end;

end.
