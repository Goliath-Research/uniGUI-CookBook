unit WC_5680;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  sysutils,
  uniGUIApplication,
  crm_recurrence;

procedure Test1;
 var OpenThisID: Real;
  AOpenedSeries: Boolean;
begin
 if CheckRecurrenceStatus(1,OpenThisID,AOpenedSeries) then
   ShowMessage(Floattostr(OpenThisID));
end;

procedure Test2;
 var
  AOpenedSeries: Boolean;
begin
  EditRecurrenceOptions(1,AOpenedSeries);
end;

procedure Test3;
begin
  if CanEditRecurrenceOptions(1) then
    ShowMessage('True')
  else
    ShowMessage('False')
end;

procedure Test4;
begin
  if HasRecurrenceSettings(1) then
    ShowMessage('True')
  else
    ShowMessage('False')
end;

procedure Test5;
 var
 OpenThisID: Real;
begin
  if HasRecurrence(1,OpenThisID) then
    ShowMessage('True')
  else
    ShowMessage('False')
end;

procedure Test6;
begin
  if CheckedRecurrentItemsChanged(1) then
    ShowMessage('True')
  else
    ShowMessage('False')
end;

procedure Test7;
 var
 AStartDateTime, AEndDateTime: TDateTime;
 AOpenedSeries: Boolean;
begin
  if GetRecurrenceParentDates(1,AStartDateTime, AEndDateTime,AOpenedSeries) then
    ShowMessage(datetimetostr(AStartDateTime)+' '+datetimetostr(AEndDateTime));
end;

procedure Test8;
begin
    ShowMessage(GetRecurrenceSummaryText(1))
end;

procedure Test9;
begin
  if CreateRecurrentActivities(1) then
    ShowMessage('True')
  else
    ShowMessage('False')
end;

procedure Test10;
begin
  UpdateRecurrences(1);
end;

procedure Test11;
begin
  RemoveRecurrences(1);
end;

procedure Test12;
begin
  UpdateSummaryText(1,'test');
end;

initialization

  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'CheckRecurrenceStatus', Test1,1);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'EditRecurrenceOptions', Test2,2);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'CanEditRecurrenceOptions', Test3,3);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'HasRecurrenceSettings', Test4,4);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'HasRecurrence', Test5,5);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'CheckedRecurrentItemsChanged', Test6,6);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'GetRecurrenceParentDates', Test7,7);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'GetRecurrenceSummaryText', Test8,8);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'CreateRecurrentActivities', Test9,9);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'UpdateRecurrences', Test10,10);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'RemoveRecurrences', Test11,11);
  TTestRepo.RegisterTest('WC-5680', 'CRM', 'crm_recurrence', 'UpdateSummaryText', Test12,12);

end.
