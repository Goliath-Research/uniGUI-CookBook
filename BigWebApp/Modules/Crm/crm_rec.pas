unit crm_rec;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  crm_types;

type
  TNewActivityRecord = packed record
     ActivityType: TActivityType;
     Source: String;
     SourceID: Real;
     ContactID: Real;
     AssignedTo: String;
     StartDate: TDateTime;
     EndDate: TDateTime;
     AllDay: Boolean;
     SetAlarm: Boolean;
     CampaignID: Real;
     WarrantyID: Real;
     OpportunityID: Real;
     OrderDetailID: Real;
     CRMQuoteID: Real; // 07/07/2009 Requested by Randy.
     Hyperlink: String; // the display will reflect the actual link
     Subject: String[250];
     Regarding: String;
     Archived: Boolean;
     Attachments: TStringList;
end;

  procedure InitActivityRec(var ANewActivityRecord: TNewActivityRecord);

implementation

uses
  crm_context,
  IQMS.Common.Dates,
  IQMS.WebVcl.SecurityManager;

procedure InitActivityRec(var ANewActivityRecord: TNewActivityRecord);
begin
  ZeroMemory(@ANewActivityRecord, SizeOf(TNewActivityRecord));
  crm_context.CheckContextObjectCreated;
  // Initialize record with standard or default values
  ANewActivityRecord.ActivityType := atCall;
  ANewActivityRecord.Source       := CRMContext.GlobalContext.SourceTable;
  ANewActivityRecord.SourceID     := CRMContext.GlobalContext.SourceID;
  ANewActivityRecord.ContactID    := CRMContext.GlobalContext.ContactID;
  ANewActivityRecord.AssignedTo   := SecurityManager.UserName;
  ANewActivityRecord.StartDate    := Trunc(IQOracleAdjustedDate) + IQMS.Common.Dates.TIME_800;
  ANewActivityRecord.EndDate      := Trunc(IQOracleAdjustedDate) + IQMS.Common.Dates.TIME_800 + IQMS.Common.Dates.TIME_30Mins;
  ANewActivityRecord.AllDay       := TRUE;
  ANewActivityRecord.SetAlarm     := FALSE;
end;

end.
