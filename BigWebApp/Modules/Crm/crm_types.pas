unit crm_types;

(* *** CRM Types and Constants ***
 *
 *  This unit can be safely called outside of CRM.
 *  It contains enumerated type declarations and related constants.
 *)

interface

uses
  System.Classes, crm_rscstr;

{ Local resource strings }
resourcestring
  RSC0000001 = 'Customer';
  RSC0000002 = 'Vendor';
  RSC0000003 = 'Partner';
  RSC0000004 = 'Employee';
  RSC0000005 = 'Pending';
  RSC0000006 = 'Accepted';
  RSC0000007 = 'Tentative';
  RSC0000008 = 'Declined';

{ Type declarations }
type
    // Prospect filtering enumerated types
    TProspectType = ( ptDontCare, ptNoProspects, ptOnlyProspects );

    // Global Source dataset enumerated types
    // TSourceType = ( srctNone, srctCustomer, srctVendor,
    //                srctPartner, srctEmployee );

    TActivityType = (atNone, atCall, atTask, atMeeting, atSupport, atNote,
      atSalesStage, atHistory);
    TActivityTypes = set of TActivityType;

    // CRM Today
    TCRMTodayType = ( ctNone, ctCalls, ctTasks, ctMeetings, ctSupport, ctNotes,
                      ctCRMQuotes, ctBOMQuotes, ctOutlookCalendar, ctOutlookTasks );
    TCRMTodayTypes = set of TCRMTodayType;

    // Record or activity status
    TRecordStatus = (rsEither, rsOpen, rsClosed);

    TPriorityType = (imUnknown, imHigh, imNormal, imLow);

    // Schedule Request
    TScheduleRequestStatus = (rsUnknown, rsPending, rsAccept, rsTentative, rsReject);

type
  TLocalAssignmentFilter = record
   AssignedTo: String;
   Index: Integer;
end;

{ Constants }
const
     cMeetingResponseList : array[TScheduleRequestStatus] of string =
      ('', // rsUnknown
       RSC0000005, // rsPending
       RSC0000006, // rsAccept
       RSC0000007, // rsTentative
       RSC0000008  // rsReject
       );

  CRMTodayTypeName : array[TCRMTodayType] of string =
   ('CRMToday_None', 'CRMToday_Calls', 'CRMToday_Tasks', 'CRMToday_Meetings',
   'CRMToday_Support', 'CRMToday_Notes', 'CRMToday_CRMQuotes',
   'CRMToday_BOMQuotes', 'CRMToday_OutlookCalendar', 'CRMToday_OutlookTasks');

   CRMActivityTypeName: array[TActivityType] of string =
    (
      '',
      crm_rscstr.cTXT0000304, // 'Call'
      crm_rscstr.cTXT0000305, // 'Task'
      crm_rscstr.cTXT0000306, // 'Meeting'
      crm_rscstr.cTXT0000307, // 'Support Issue'
      crm_rscstr.cTXT0000308, // 'Note'
      crm_rscstr.cTXT0001946, // 'Sales Stage'
      crm_rscstr.cTXT0001947 // 'History'
    );

   PriorityTypeName: array[TPriorityType] of string =
   ('',
    crm_rscstr.cTXT0001093, // High
    crm_rscstr.cTXT0001094, // Medium
    crm_rscstr.cTXT0001095 // Low
   );

implementation

end.
