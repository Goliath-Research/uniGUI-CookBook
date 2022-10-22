unit crm_dbtrans_shr;

interface

uses
  System.SysUtils;

//const
//  ForbiddenFieldsArray: array [0 .. 7] of string = ('', 'ID', 'EID', 'ECOPY',
//    'EDATE_TIME', 'ECODE', 'PRINCIPLE_SOURCE', 'PRINCIPLE_SOURCE_ID');

function IsForbiddenField(const AFieldName: string): Boolean;
function PrettyTableName(const ATableName: string): String;

implementation

uses
  crm_dbtrans_const,
  IQMS.DBTrans.dbtfields,
  IQMS.Common.StringUtils;

function IsForbiddenField(const AFieldName: string): Boolean;
begin
  Result := False;

  //Allow ID field.  Requested by Bob Gee, approved by Randy.
  if CompareText(AFieldName, 'ID') = 0 then
    Exit;

  Result := IQMS.DBTrans.dbtfields.IsForbiddenFieldName(AFieldName);
end;

function PrettyTableName(const ATableName: string): String;
begin
 if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_ARCUSTO) = 0 then
   Result := 'Customer'
 else if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_CONTACT) = 0 then
   Result := 'Contact'
 else if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_VENDOR) = 0 then
   Result := 'Vendor'
 else if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_VENDOR_CONTACT) = 0 then
   Result := 'Vendor Contact'
 else if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_PARTNER) = 0 then
   Result := 'Partner'
 else if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_PARTNER_CONTACT) = 0 then
   Result := 'Partner Contact'
 else if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_CRM_ACTIVITY) = 0 then
   Result := 'CRM'
 else if CompareText(ATableName, crm_dbtrans_const.FIELD_LIST_CRM_ACTIVITY) = 0 then
   Result := 'CRM'
 else if CompareText(ATableName, crm_dbtrans_const.FIELD_LIST_CRM_CALLS) = 0 then
   Result := 'CRM'
 else if CompareText(ATableName, crm_dbtrans_const.FIELD_LIST_CRM_TASKS) = 0 then
   Result := 'CRM'
 else if CompareText(ATableName, crm_dbtrans_const.FIELD_LIST_CRM_MEETINGS) = 0 then
   Result := 'CRM'
 else if CompareText(ATableName, crm_dbtrans_const.FIELD_LIST_CRM_NOTES) = 0 then
   Result := 'CRM'
 else if CompareText(ATableName, crm_dbtrans_const.TABLE_NAME_CRM_USER_DEFINED) = 0 then
   Result := 'CRM User-Defined'
 else
   Result := ATableName;
end;

end.
