unit crm_rscstr;

{ These are strings used in CRM that can be changed by localization}

interface

// crm_rscstr.cTXT0001816

resourcestring

     // Tree View Descriptions
     cMNU_MyCRMToday = 'Your current CRM activity, regardless of any CRM ' +
      'filter which might be set.';
     cMNU_CRMToday = 'CRM Today displays activities which ' +
      'match the current Assignment and Principal filter.';

     cMNU_MySupport = 'Open Support Issues assigned to you';
     cMNU_Support = 'Provide help desk and support services by answering ' +
      'questions, addressing concerns and solving problems.'; // Support Issues

     cMNU_SupportAll = 'Access all issues (open or closed) and help desk utilities';
     cMNU_SupportOpen = 'Access only open issues.';
     cMNU_SupportClosed = 'Access only closed issues.';
     //cMNU_SupportNew  = 'Begin a new issue';
     cMNU_SupportQueueView = 'View service and support statistics by queue.';
     cMNU_SearchSupport = 'Search the history of service and support issues.';


     cMNU_MyCalls       = 'Open Calls assigned to you.';
     cMNU_Calls         = 'Both open and closed calls.';
     cMNU_CallNew       = 'Create a new Call.';
     cMNU_CallAll       = 'Access all calls, open and closed.';
     cMNU_CallClosed    = 'Access only closed Calls.';
     cMNU_CallOpen      = 'Access only open Calls.';


     cMNU_MyTasks       = 'Open Tasks assigned to you.';
     cMNU_Tasks         = 'Both open and closed Tasks.';
     cMNU_TaskNew       = 'Create a new Task.';
     cMNU_TaskAll       = 'Access all Tasks, open and closed.';
     cMNU_TaskClosed    = 'Access only closed Tasks.';
     cMNU_TaskOpen      = 'Access only open Tasks.';

     cMNU_MyMeetings    = 'Open Meetings assigned to you.';
     cMNU_Meetings      = 'Both open and closed Meetings.';
     cMNU_MeetingNew    = 'Create a new Meeting.';
     cMNU_MeetingAll    = 'Access all Meetings, open and closed.';
     cMNU_MeetingClosed = 'Access only closed Meetings.';
     cMNU_MeetingOpen   = 'Access only open Meetings.';

     cMNU_MyNotes       = 'Open Notes assigned to you.';
     cMNU_Notes         = 'Both open and closed Notes.';
     cMNU_NoteNew       = 'Create a new Note.';
     cMNU_NoteAll       = 'Access all Notes, open and closed.';
     cMNU_NoteClosed    = 'Access only closed Notes.';
     cMNU_NoteOpen      = 'Access only open Notes.';


     // Main Form Hints and List View Descriptions.  These are displayed only in the
     // Details view of a TListView.
     // Keep the length down to 50 characters or less.  This way the text is
     // visible in the list view, with a form set to default.
     // Use one complete sentence.
     cMNU_Activities            = 'Select a management activity.';
     cMNU_ActivityAssignment    = 'View activies by assignment ("Assigned To").';
     cMNU_AlertMsg = 'Alerts keep users informed with important messages.  ' +
      'Alerts will display when activities are created or accessed for the ' +
      'associated customer, partner or vendor.';
     cMNU_AnswerBook = 'Document topics and solutions.';
     cMNU_AnswerBookNew = 'Create a new Answer Book.';
     cMNU_Calendar = 'View your Activity Calendar.';

     //cMNU_Campaign              = 'Campaign management.';
     cMNU_ContAlerts = 'Edit Contact Alert Messages.';
     cMNU_CRMQuoteNew = 'Create a new Sales Quotation.';
     cMNU_CRMQuotes  = 'Combine items and pricing on one quotation.';
     cMNU_SalesConfigTemplates  = 'Configure reusable templates, containing ' +
       'groups of options, choices and Inventory items, which can then be ' +
       'used to build Sales Quotations.';
     cMNU_CustBOMQuotes = 'A list of Engineering Quotes by Customer.';
     cMNU_CustContacts = 'A list of Customer contacts for quick access to ' +
      'contact information.';
     cMNU_CustCRMQuotes = 'A list of Sales Quotations for a selected Customer.';
     cMNU_CustInvAvail = 'Inventory Availability shows the quantity on ' +
      'hand, and both current and projected activity for each Inventory item.';
     cMNU_RMA = 'Create a Returned Material Authorization (RMA) for ' +
      'a rejected shipment.';
     cMNU_CustInventory = 'A list of Inventory items by Customer.';
     cMNU_CustMaint = 'Customer Maintenance provides access to ' +
      'all information about each customer in EnterpriseIQ.';
     cMNU_CustomerCentral = 'View Customer Calls, Meetings, Tasks, ' +
      'Support Issues, and other important information.';
     cMNU_CustOrders = 'A list of both current and past Sales ' +
      'Orders for a selected Customer.';
     cMNU_CustShipments = 'A list of both current and past shipments ' +
      'for a selected Customer.';
     cMNU_CustStatus  = 'Customer Status shows the account status and credit ' +
      'limit for each customer, along with a list of open items, and total ' +
      'amount past due.';
     cMNU_CustWebOrder = 'Use Web Order Import to verify orders entered by ' +
      'customers through the Web, and then convert them to EnterpriseIQ ' +
      'Sales Orders.';
     cMNU_EnterpriseIQ = 'Shortcuts to essential EnterpriseIQ modules.';
     cMNU_GroupAndMailing  = 'Grouping and Mass Mailing';
     cMNU_Groups = 'Create groups that combine different sources.';
     cMNU_MassMail = 'Create and send a mass mailing.';
     cMNU_KeywordSearch = 'Search the Answer Book.';
     cMNU_MailMerge             = 'Create, print or preview Mail Merge documents.';
     cMNU_MailingHistory        = 'View a history of mass mailings (email) and mail merge printing (Microsoft Word).';
     cMNU_Marketing             = 'Manage sales and marketing activities.';
     cMNU_Outlook               = 'Select from your personal Microsoft Outlook folders.';
     cMNU_OutlookCalendar       = 'Microsoft Outlook Calendar Appointments';
     cMNU_OutlookDeleted        = 'Microsoft Outlook Deleted Items';
     cMNU_OutlookDrafts         = 'Microsoft Outlook Drafts';
     cMNU_OutlookInbox          = 'Microsoft Outlook Inbox';
     cMNU_OutlookJournal        = 'Microsoft Outlook Journal';
     cMNU_OutlookNotes          = 'Microsoft Outlook Notes';
     cMNU_OutlookOutbox         = 'Microsoft Outlook Outbox';
     cMNU_OutlookSent           = 'Microsoft Outlook Sent Items';
     cMNU_OutlookTasks          = 'Microsoft Outlook Tasks';
     cMNU_Partners              = 'Partner Central allows you add, edit and manage ' +
      'business contacts that fall outside of the usual customer and vendor relationships.';
     cMNU_PartnerAlerts         = 'Edit Partner Alert Messages.';
     cMNU_PartnerContAlerts     = 'Edit Partner Contact Alert Messages.';
     cMNU_PartnerNew            = 'Create a new Partner.';
     cMNU_ScheduleCoordinator   = 'Coordinate schedules among employees.';
     cMNU_VendorAlerts          = 'Edit Vendor Alert Messages.';
     cMNU_VendorContactAlerts   = 'Edit Vendor Contact Alert Messages.';
     cMNU_VendorMaint           = 'Vendor Maintenance provides access to ' +
      'all information about each vendor in EnterpriseIQ.';
     cMNU_VendorStatus          = 'Vendor Status shows the account status ' +
      'and credit limit for each vendor, along with a list of open items, ' +
      'and total amount past due.';
     //cMNU_Warranty              = 'Service Central';
     cMNU_WorkFlow              = 'Workflow improves efficiency by ' +
      'simplifying business processes, and by automating internal ' +
      'business operations and tasks.';

   cTXT0000001 = 'Clone process unsuccessful.';
   cTXT0000002 = 'Please assign a Customer record.';
   cTXT0000003 = 'Read Only';
   cTXT0000004 = 'Sales Quotations';
   // cTXT0000005 = 'Archived Sales Quotations';
   cTXT0000006 = 'Select Archived Sales Quotation';
   cTXT0000007 = 'Restore this Sales Quotation?';
   cTXT0000008 = 'Delete record?  This action will permanently delete the ' +
    'selected quotation.';
   cTXT0000009 = 'This order contains "Ship To" addresses on the release ' +
    'level. A single pick ticket cannot be created for multiple "Ship To" ' +
    'addresses.';
   cTXT0000010 = 'Unable to create pick ticket because either there are ' +
    'no outstanding releases available for shipment, or a pick ticket ' +
    'already exists for these releases.';
   cTXT0000011 = 'Parent record not found.  Cannot post changes.';
   cTXT0000012 = 'Total commissions greater than 100%, cannot post';
   cTXT0000013 = 'Please choose an item before trying to save this record.';
   cTXT0000014 = 'The selected Inventory Item has a setup charge';
   cTXT0000015 = 'Code:  %s'#13'Description:  %s';
   cTXT0000016 = 'Please post changes before repeating.';
//   cTXT0000017 = 'Selected Quantity:';
//   cTXT0000018 = 'Minimum Quantity:';
   cTXT0000019 = 'Created Sales Quotation for customer.  RFQ#: ';
   cTXT0000020 = 'Inventory Item Alert';
   cTXT0000021 = 'Customer Alert';
   cTXT0000022 = 'Customer Contact Alert';
   cTXT0000023 = 'Cannot jump.  The target record may have been deleted.';
   cTXT0000024 = 'Edit Alert Message';
   cTXT0000025 = 'Partner Alert';
   cTXT0000026 = 'Partner Contact Alert';
//   cTXT0000027 = 'Internal Application Error: Alert Message Object has not ' +
//    'been created.';
   cTXT0000028 = 'Since this Sales Quotation already has details, you cannot ' +
    'edit currency.';
   cTXT0000029 = 'The Customer field is required.  Please select a customer ' +
    'first, before choosing a contact.';
   cTXT0000030 = 'No source assigned.';
   cTXT0000031 = 'Could not find the Engineering Quote Inventory item.  ' +
    'The original item may have been deleted.';
   cTXT0000032 = 'Could not find the inventory item.  The original item may ' +
    'have been deleted.';
   cTXT0000033 = 'Could not find the tooling project.  The original project ' +
    'may have been deleted.';
   cTXT0000034 = 'There are no detail items.';
   cTXT0000035 = 'Please enter Quotation details before trying to create a ' +
    'Sales Order from this Quotation.';
   cTXT0000036 = 'Some Quotation detail items refer to sources which have ' +
    'been deleted from the database.  Please remove or change these items ' +
    'before continuing.';
   cTXT0000037 = 'Multiple records are selected.  Customer will be assigned ' +
     'to the current record only.';
   cTXT0000038 = 'Assigned By: %s';
   cTXT0000039 = 'Assigned Date: %s';
   cTXT0000040 = 'Subject: %s';
   cTXT0000041 = 'Regarding: %s';
   cTXT0000042 = 'Do you want to print a pick ticket for Sales Order # %s?';
   cTXT0000043 = 'Attempted to display new Sales Order, but could not find ' +
    'the database record.  Do you want to find this record yourself?';
   cTXT0000044 = 'Clear values on all selected records?';
   cTXT0000045 = 'Do you want to replace the Engineering Quote Inventory ' +
    'item with the Master Inventory item?';
   cTXT0000046 = 'This will change the Sales Quotation detail.  You will not ' +
    'be able to undo this action, except by choosing the Engineering Quote ' +
    'Inventory item again in the usual manner.';
   cTXT0000047 = 'The Engineering Quote Inventory item appears already to have ' +
    'been converted to Finished Goods Inventory:';
   cTXT0000048 = 'Item #:';
   cTXT0000049 = 'Description:';
   cTXT0000050 = 'Do you want to use this item instead?';
   cTXT0000051 = 'Convert Engineering Quote Inventory item to ' +
    'Master Inventory item?';
   cTXT0000052 = 'The Engineering Quote was not converted.';
   cTXT0000053 = 'The process will continue, but the Engineering Quote ' +
    'Inventory item will not appear on the Sales Order.';
   cTXT0000054 = 'Although the Engineering Quote Inventory item was converted, ' +
    'Sales Quotations cannot find the new inventory item.  ' +
    'It is possible that some items were not reviewed properly, ' +
    'major field values were changed, or information was not supplied on ' +
    'the conversion screen.';
   cTXT0000055 = 'Do you wish to see a list of Master Inventory items that ' +
    'are associated with the converted RFQ?';

   cTXT0000056 = 'Jump to BOM';
   cTXT0000057 = 'Jump to RFQ';
   cTXT0000058 = 'Jump to Master Inventory';
   cTXT0000059 = 'Jump to Project';
   cTXT0000060 = 'Jump to Customer Maintenance';
   cTXT0000061 = 'Jump to Vendor Maintenance';
   cTXT0000062 = 'Jump to Customer Central';
   cTXT0000063 = 'Jump to Partner Central';
   cTXT0000064 = 'Jump to Vendor Central';
   //cTXT0000065 = 'Jump to Employee';
   //cTXT0000066 = 'Jump to RMA';
   //cTXT0000067 = 'Jump to Sales Order';

   cTXT0000070 = 'Sales Order, "%s," created, based on Sales Quotation, "%s."';
   cTXT0000071 = 'Sales Quotations could not find the specified Engineering ' +
    'Quote Inventory item in the database.';
   cTXT0000072 = 'It is possible that this Engineering Quote Inventory Item, ' +
   'or the entire RFQ, has been deleted since it was added to the Sales Quotation.';

   cTXT0000073 = 'The Customer field is required.  Please select a customer ' +
    'first, before choosing a "Bill To" address.';
   cTXT0000074 = 'The Customer field is required.  Please select a customer ' +
    'first, before choosing a "Ship To" address.';
   cTXT0000075 = 'Checking availability.  Please wait.';
   cTXT0000076 = 'Archive this Sales Quotation?';

   cTXT0000077 = 'Contact';

   cTXT0000078 = 'A default Sales Quotation report has not been specified.  ' +
    'Please specify a default "Sales Quotation" report in System Parameters.';

   cTXT0000079 = 'Cannot find the Sales Quotation report:'#13#10'%s'#13#10 +
     'Ensure that this file exists and that the "Reports" directory in ' +
     'IQStatus is set correctly.';

   cTXT0000080 = 'Accessing Internal Documents.';
   cTXT0000081 = 'Accessing External Documents.';

   cTXT0000082 = 'Mass Mail Sent:';
   cTXT0000083 = 'Sender:';
   cTXT0000084 = 'Sender';
   cTXT0000085 = 'Subject:';
   cTXT0000086 = 'Subject';
   cTXT0000087 = 'Sending Mass Mail';
   cTXT0000088 = 'Preparing mail messages ... ';
   cTXT0000089 = 'Done.';
   cTXT0000090 = 'FAILED';
   cTXT0000091 = 'Sent';
   cTXT0000092 = 'Process complete.';
   cTXT0000093 = 'Double-click the attached EnterpriseIQ bookmark file to ' +
    'display the record in CRM.  ' +
    'If you are prompted to Open or Save the file, select Open.  EnterpriseIQ will ' +
    'open and you will be prompted to log in.  After you log in, the CRM record will display.';
   cTXT0000094 = 'Retrieving HTML source from the Internet...';
   cTXT0000095 = 'Please enter a valid email address for the Sender.  ' +
    'Cannot send test email.';
   cTXT0000096 = 'A test email will be sent to the Sender address:'#13#13 +
                 '%s'#13#13 +
                 'Do you want to send a test email now?';
   cTXT0000097 = 'A test email has been sent.';

   cTXT0000098 = 'Please enter a subject.';
   cTXT0000099 = 'Please enter a body text.';
   cTXT0000100 = 'Navigation is disabled in this wizard.';
   cTXT0000101 = 'Please add recipients.';
   cTXT0000102 = 'You have already selected recipients.  The current list will be cleared.';
   cTXT0000103 = 'Do you want to continue?';
   cTXT0000104 = 'Please enter an email address.';
   cTXT0000105 = 'The SMTP Server value has not been set in System Parameters.'#13#13 +
                 'Please notify your system administrator.';

   cTXT0000106 = 'Loading Email Preview...';
   cTXT0000107 = 'Invalid file.';

   //cTXT0000108 = 'Date Range';
   cTXT0000109 = 'Date Range:'; // with colon
   cTXT0000110 = 'Start Date';
   cTXT0000111 = 'Start Date:'; // with colon
   cTXT0000112 = 'End Date';
   cTXT0000113 = 'End Date:';   // with colon
   cTXT0000114 = 'Click to set date range.';
   cTXT0000115 = 'Access Denied.  You do not have permission to delete Sales Stage change notes.';
   cTXT0000116 = 'Create CRM Notes for history?';

   cTXT0000117 = 'Show Record View';
   cTXT0000118 = 'Hide Record View';

   cTXT0000119 = 'Undefined';
   cTXT0000120 = '<Email Body Text>';
   cTXT0000121 = '<Undefined>';
   cTXT0000122 = 'Cannot find file.';
   cTXT0000123 = 'Body text is undefined.  Cannot display.';

   cTXT0000124 = 'Do you wish to view stored email text for this record, or attempt to view the original file or URL?'#13#13 +
                 'Click "Yes" to view the stored email text.'#13 +
                 'Click "No" to attempt to view the file or URL.';

   cTXT0000125 = 'Mass Mailer';

   // This list is used in crm_massmail for the recipient type
   cTXT0000130 = 'CRM Groups';
   cTXT0000131 = 'Customer Contacts';
   cTXT0000132 = 'Partner Contacts';
   cTXT0000133 = 'Vendor Contacts';
   cTXT0000134 = 'Employees';
   cTXT0000135 = 'Microsoft Outlook Contacts';
   cTXT0000136 = 'External File';

   cTXT0000137 = 'If Windows prompts you for the host application, you need to ' +
      'establish the file association in IQStatus for bookmark files.  Open IQStatus.  ' +
      'On the Bookmarks page, check the "Associate bookmark files" checkbox and click ' +
      'Apply.  After creating the file association you will be able to use EnterpriseIQ ' +
      'bookmark files.';
   cTXT0000138 = 'Email alert failed.';
   cTXT0000139 = 'CRM attempted send user, %s, an email noting that the assignment has changed. Errors were encountered.';
   cTXT0000140 = 'The following CRM record has been assigned to you:';

   // CRM Shortcuts
   cTXT0000142 = 'Global';
   cTXT0000143 = 'Favorites';

   // CRM Options
   cTXT0000144 = 'Currently showing activities for today only.';
   cTXT0000145 = 'Currently showing all activities.  No range has been applied.';
   cTXT0000146 = 'Currently showing activities for the specified range.';

   cTXT0000147 = 'Cannot show summary.';

   cTXT0000148 = 'This contact already exists for this vendor:'#13#13 +
                 '%s %s ';


   cTXT0000149 = 'The Employee record for the selected login name could not be found.';
//   cTXT0000150 = 'The Microsoft Word document is currently opened.  ' +
//                 'Please close the document before merging records.';
//   cTXT0000151 = 'The Mail Merge query contains no SQL.  Operation aborted.';
//   cTXT0000152 = 'Creating Microsoft Access database...';
//   cTXT0000153 = 'Creating temporary Oracle view...';
//   cTXT0000154 = 'Retrieving data to merge...';
//   cTXT0000155 = 'There are no records to import.  Operation aborted.';
//   cTXT0000156 = '%d records will be exported.  Do you want to continue?';
//   cTXT0000157 = 'Retrieving table definition...';
//   cTXT0000158 = 'Removing old merge dataset...';
//   cTXT0000159 = 'Creating new merge dataset...';
//   cTXT0000160 = 'Exporting records...';
//   cTXT0000161 = 'Done merging records.';
//   cTXT0000162 = 'Could not create ODBC Datasource (DSN).';
//   cTXT0000163 = 'Test Data created by IQMS';
//   cTXT0000164 = 'Could not create Microsoft Access Database:';
//   cTXT0000165 = 'The field, "%s," is of an unknown type.';
//   cTXT0000166 = 'The field, "%s," is of an unknown type.  Import process aborted.';
   cTXT0000167 = 'Current version of Microsoft Word not supported.';
   cTXT0000168 = 'Connecting to Microsoft Word ...';
   cTXT0000169 = 'Creating Microsoft Word Mail Merge document...';
   cTXT0000170 = 'Updating Microsoft Word Mail Merge document...';
   cTXT0000171 = 'Saving and closing Mail Merge document...';
   cTXT0000172 = 'Almost done...';
   cTXT0000173 = 'Could not connect to Microsoft Word.';
//   cTXT0000174 = 'Abort export?';
   cTXT0000175 = 'Creating Mailing History.  Please wait.';
//   cTXT0000176 = 'Could not connect to Microsoft Excel.';
//   cTXT0000177 = 'Group Members';

   cTXT0000178 = 'Shutting down CRM.  Please wait.';
   cTXT0000179 = 'See also:';
   cTXT0000180 = 'Pick Lists';

   cTXT0000181 = 'Loading Microsoft Outlook Calendar items.  Please wait.';
   cTXT0000182 = 'Loading Microsoft Outlook Contacts.  Please wait.';
   cTXT0000183 = 'Loading Microsoft Outlook Deleted Items.  Please wait.';
   cTXT0000184 = 'Loading Microsoft Outlook Draft items.  Please wait.';
   cTXT0000185 = 'Loading Microsoft Outlook Inbox items.  Please wait.';
   cTXT0000186 = 'Loading Microsoft Outlook Journal items.  Please wait.';
   cTXT0000187 = 'Loading Microsoft Outlook Outbox items.  Please wait.';
   cTXT0000188 = 'Loading Microsoft Outlook Sent Items.  Please wait.';
   cTXT0000189 = 'Loading Microsoft Outlook Tasks.  Please wait.';

   cTXT0000190 = 'Delete this Answer Book?  This action is irreversible.';
   cTXT0000191 = 'Please select a UOM.';
//   cTXT0000192 = 'Error inserting record.';
   cTXT0000193 = 'Error updating record.';
   cTXT0000194 = 'Updating.  Please wait...';
   cTXT0000195 = 'Rename Answer Book';
   cTXT0000196 = 'Enter a new name for the answer book:';

   cTXT0000197 = 'No Filter Set';
   cTXT0000198 = '<Show All>';
   cTXT0000199 = '<My Records>';

   cTXT0000200 = 'To continue running CRM you must be logged onto a database. Would you like to login now?';
   cTXT0000201 = 'All CRM forms must be closed before attempting to login. Please try again.';

   cTXT0000202 = 'Customer Relationship Management [%s, %s]'; // caption
   cTXT0000203 = 'Customer Relationship Management [%s, %s, %s]';

   cTXT0000204 = 'There are CRM Notification errors.  View the Error Log for details.';

   cTXT0000205 = 'Name';
   cTXT0000206 = 'Email Address';
   cTXT0000207 = 'From'; // Sender of email
   cTXT0000208 = 'Received';


   cTXT0000209 = 'None';

   cTXT0000210 = 'Encountered error while creating Appointment Item:'#13#13'%s';
   cTXT0000211 = 'Encountered error while creating Task:'#13#13'%s';
   cTXT0000212 = 'To'; // Recipient of email
   cTXT0000213 = 'Recipient Count';
//   cTXT0000214 = 'Enter the name of the User Profile';
//   cTXT0000215 = 'Password';
//   cTXT0000216 = 'Enter the profile password';
//   cTXT0000217 = 'Invalid user profile or password.  Outlook is not connected.';
   cTXT0000218 = '%s and %s'; // used for Principal Context
//   cTXT0000219 = 'Outlook is either not installed or is in an invalid state.  Operation aborted.';

   cTXT0000220 = 'Encountered error while attempting to load CRM Today: '#13#13'%s';
   cTXT0000221 = 'Encountered error attempting to create a new activity [NewCRMTodayActivity1Click()]:'#13#13'%s';
   cTXT0000222 = 'Principal Contact';
   cTXT0000223 = 'Encountered an error while attempting to select the first menu item in the tree:'#13#13'%s';
   cTXT0000224 = 'CRM Assignment Change [%s %s]';
   cTXT0000225 = 'Your security rights do not permit you to view the error log.';
   cTXT0000226 = 'This action will update the display for all Principal Sources.'#13#13+
                 'Do you want to continue?';
   cTXT0000227 = 'Approximately %d records will be updated.  ' +
                 'The process will take roughly %d minutes, depending upon network and other issues.'#13#13 +
                 'Click Yes to continue.';
   cTXT0000228 = 'Updating record %d of %d.';
   cTXT0000229 = '%s (%s - %s)'; // used for the caption on main screen, see SetMyCRMCaption()

   cTXT0000230 = 'Answer Book Topic';
   cTXT0000231 = 'Attachments';
   cTXT0000232 = 'Internal Application Error:';
//   cTXT0000233 = '%sActivity Information%s';
//   cTXT0000234 = ' Activity #: %.0f';
//   cTXT0000235 = ' Contact: %s %s';
//   cTXT0000236 = ' Company: %s';
//   cTXT0000237 = ' Address: %s ';
   cTXT0000238 = ' Company:  None Assigned';
//   cTXT0000239 = ' Telephone: %s';

//   cTXT0000240 = ' Extension: %s';
//   cTXT0000241 = ' Telephone: None Listed';
//   cTXT0000242 = ' Email: %s';
//   cTXT0000243 = ' Email:  None Listed';
//   cTXT0000244 = ' Telephone: %s';
//   cTXT0000245 = ' Telephone: None Listed';
   //cTXT0000246 = ' %s Date: %s';  // obsolete?
   cTXT0000247 = 'Reminder:  %s';
   cTXT0000248 = 'Reset reminders to default?';
   cTXT0000249 = 'New Engineering Quote created by %s.';

   cTXT0000250 = 'Rename Folder';
   cTXT0000251 = 'Modify caption text:';
   cTXT0000252 = 'Hide folder, %s?';
   cTXT0000253 = 'Rename folder, %s';
   cTXT0000254 = 'Hide folder, %s';
   cTXT0000255 = 'Reset all items in the tree view to the default settings?';
   cTXT0000256 = 'Recipient:';
   cTXT0000257 = 'Description: %s';
   cTXT0000258 = 'Document printed: %s (file name, %s)';
   cTXT0000259 = 'Printed by: %s';

   cTXT0000260 = 'Please enter a valid number, from 0 to 3000.';
//   cTXT0000261 = 'Remove checked items?';
   cTXT0000262 = ' <Not filtered> ';
   cTXT0000263 = 'Class Filter'; // Inventory Class, i.e., "FG", "PL", etc.
   cTXT0000264 = 'Edit AKA Assignment for %s'; // For Company
   cTXT0000265 = 'Adding multiple items...';
//   cTXT0000266 = 'Building AKA List.';
   cTXT0000267 = 'Accessing AKA Information.  Please wait.';
   cTXT0000268 = 'Remove all items from the list?';
   cTXT0000269 = 'Add all of Master Inventory to this customer''s AKA list?'#13#13 +
                 'This could take a few minutes.';

   cTXT0000270 = 'Operation cancelled.';
   cTXT0000271 = 'Delete selected items (%d)?';
   cTXT0000272 = 'Delete selected items?';
   cTXT0000273 = 'Refreshing Master Inventory list.  Please wait.';
   cTXT0000274 = 'Filtering by Class, %s.  Please wait.';
   cTXT0000275 = 'Delete selected item?';
   cTXT0000276 = 'All selected Inventory items will be applied to all selected customers.'#13#13 +
                 'Do you want to continue?';
   cTXT0000277 = 'This action will affect multiple customers.'#13#13'Are you sure you want to continue?';
   cTXT0000278 = 'Adding items.  Please wait.';
   cTXT0000279 = 'Adding AKA items to %s'; // to Customer

   cTXT0000280 = '<No Customer Selected>';
   cTXT0000281 = 'Multiple Customers Selected';
   cTXT0000282 = 'Add all customers to the list?'#13#13'This could take a few minutes.';
   cTXT0000283 = 'Remove all customers from the list?';
   cTXT0000284 = 'Please select a user.';
   cTXT0000285 = 'Show All';
   cTXT0000286 = 'My Records';
   cTXT0000287 = 'Selected User';
   cTXT0000288 = 'Assign to me';
   cTXT0000289 = 'Selected User';

   cTXT0000290 = 'There is already an auto hidden window on this edge.'#13 +
                 'Only one auto hidden window is allowed on an edge.';
   cTXT0000291 = 'Error reading setting for %s:'#13#13'%s';
   cTXT0000292 = 'No CRM Prospects'; // filter caption
   cTXT0000293 = 'Only CRM Prospects'; // filter caption
   cTXT0000294 = 'Removing multiple items...';
   cTXT0000295 = 'Sales Order # %s cannot be displayed under the current EPlant filter.';
   //cTXT0000296 = 'The user list is empty.  Please create a user list.';
   //cTXT0000297 = 'There are no selected (checked) users.  Please select users to include.';
   //cTXT0000298 = 'The Start date and time must precede the End Date.  Please check your dates.';
   cTXT0000299 = 'The Start time must precede the End time.  Please check your time values.';

   //cTXT0000300 = 'The Daily Start time must precede the Daily End time.  ' +
   //              'Please check your Daily Time Range values.';
   //cTXT0000301 = 'The Start date and time is before the current date.  ' +
   //              'The process will continue, but past dates will also display';
   //cTXT0000302 = 'Selected Date: None';
   //cTXT0000303 = 'Please select an available time block from the results list.';
   cTXT0000304 = 'Call'; // singular
   cTXT0000305 = 'Task';
   cTXT0000306 = 'Meeting';
   cTXT0000307 = 'Support Issue';
   cTXT0000308 = 'Note';
   cTXT0000309 = 'Modified';

   //cTXT0000310 = 'Selected Date: %s';
   //cTXT0000311 = 'Participant:  %s'#13+
   //              'Start:  %s'#13 +
   //              'Finish:  %s';
   //cTXT0000312 = 'Selected Users: %d'; // How many users are selected?
   cTXT0000313 = 'Jump to %s'; // .. Inventory, etc.
   cTXT0000314 = 'Jump to %s Central';
   cTXT0000315 = 'New %s'; // Support Issue, Call, Task, etc.
   cTXT0000316 = 'Error adding attachment to mailing history.';
   cTXT0000317 = 'Attachment #: %d'#13'File Name: %s';
   cTXT0000318 = 'Error adding HTML text to mailing history.';
//   cTXT0000319 = 'Line: %d'#13'Line Text: %s';

   cTXT0000320 = 'Error adding recipient to mailing history.';
   cTXT0000321 = 'CRM Mailing Record ID [CRM_MAILING.ID]: %.0f'#13'Source: %s'#13'Source ID: %.0f'#13'Contact ID: %.0f';
   cTXT0000322 = 'CRM Mailing Record ID [CRM_MAILING.ID]: %.0f'#13'Caption: %s'#13'Email: %s';
   cTXT0000323 = 'Delete mailing history record?';
   cTXT0000324 = 'References';
   cTXT0000325 = 'OK';
   cTXT0000326 = 'Cancel';
   cTXT0000327 = 'Parent RMA not supplied.  Cannot add detail item.';
   cTXT0000328 = 'Parent RMA not found.  Cannot add detail item.';
   cTXT0000329 = 'Success!  There are no broken links.';

   cTXT0000330 = 'Error adding shortcut for %s:'#13#13'%s';
   cTXT0000331 = 'Error renaming shortcut, %s:'#13#13'%s';
   cTXT0000332 = 'Error updating shortcut for %s:'#13#13'%s';
   cTXT0000333 = 'Rename';
   cTXT0000334 = 'Enter the new caption:';
   cTXT0000335 = 'The file is already in this folder.  Please choose another file.';
   cTXT0000336 = 'The file is already in the list.';
   cTXT0000337 = 'New Folder';
   cTXT0000338 = 'Delete item?';
   cTXT0000339 = 'The CRM Shortcuts form is currently being viewed.'#13#13+
                 'Please close this window before opening this administration screen.';

   cTXT0000340 = 'The Shortcuts Organizer is currently opened.'#13#13+
                 'Please close this window before opening this screen.';
   cTXT0000341 = 'CRM Shortcuts';
   cTXT0000342 = '[Server Time Stamp: %s][Machine Time Stamp: %s]';
   cTXT0000343 = 'Error.txt'; // text file containing errors
   cTXT0000344 = 'Could not locate the selected record.' ;
   cTXT0000345 = 'Nothing Assigned to Employee';
   cTXT0000346 = 'The contact you entered already exists for this customer.';
   cTXT0000347 = '%s Summary for %s'; // source type (call, task, etc) for 'Joe Bloe'
   cTXT0000348 = '%s Summary'; // Call Summary
   cTXT0000349 = 'Clear the alert message?';

   cTXT0000350 = 'Save changes?';
   cTXT0000351 = 'There is no message to display.  Please enter an alert message.';
//   cTXT0000352 = 'Contact Alert';
   cTXT0000353 = 'Delete this alert message?';
//   cTXT0000354 = 'Activity Type not supplied.  Please select an Activity Type and try again.';
   cTXT0000355 = 'Call Types'; // form caption
   cTXT0000356 = 'Task Types'; // form caption
   cTXT0000357 = 'Meeting Types'; // form caption
   cTXT0000358 = 'Support Status'; // form caption
//   cTXT0000359 = 'Customer Alert Message'; // form caption

//   cTXT0000360 = 'Contact Alert Message'; // form caption
//   cTXT0000361 = 'Partner Alert Message'; // form caption
//   cTXT0000362 = 'Partner Contact Alert Message'; // form caption
   cTXT0000363 = 'You have not selected a customer.'#13#10 +
                 'A customer is required for this module.';
   cTXT0000364 = 'Customer Shipments [%s]';
   cTXT0000365 = 'Customer Sales Quotation [%s]';
   cTXT0000366 = 'Customer Inventory [%s]';
   cTXT0000367 = 'Customer Orders [%s]';
   cTXT0000368 = 'The requested Sales Order is not available under the current Eplant filter.';
   cTXT0000369 = 'Customer Engineering Quotes [%s]';

   cTXT0000370 = 'New Engineering Quote created by %s.';
   cTXT0000371 = 'Cannot open the file:'#13#13 +
                 '"%s"'#13#13 +
                 'It may already be open. CRM will skip this file, and continue searching.';
   cTXT0000372 = 'The file, %s, could not be opened.'#13 +
                 'CRM will skip this file, and continue searching.';
//   cTXT0000373 = '"%s" is not a valid number.';
//   cTXT0000374 = 'The beginning date must precede the ending date.  Please check your dates.';
   //cTXT0000375 = 'Select';
   //cTXT0000376 = 'Search %s';
//   cTXT0000377 = 'Customer';
//   cTXT0000378 = 'Vendor';
//   cTXT0000379 = 'Partner';
//   cTXT0000380 = 'Employee';
   cTXT0000381 = 'Clear link to Support Issue?';
   cTXT0000382 = 'The record has already been linked to this issue.';
   cTXT0000383 = 'The record is already linked to another issue.';
//   cTXT0000384 = 'Partner Contact Alert';
   //cTXT0000385 = 'You have chosen to interface with Microsoft Outlook, but the ' +
   //              'version installed on this machine is invalid.  This option will be reset to False.';
   //cTXT0000386 = 'Click to set a date range for CRM Today.'#13+
   //              '   Start Date: %s'#13 +
   //              '   End Date: %s';
   cTXT0000387 = 'You cannot add or edit user options for user, %s, at this time.';
   cTXT0000388 = 'Access denied.  DBA rights are required to edit CRM User Parameters.';
//   cTXT0000389 = 'Partner Alert';
   cTXT0000390 = 'Retrieving Reminders...';

   cTXT0000391 = 'CRM %s Reminder (%s Priority)';  // used in crm signal as the subject for the email
   cTXT0000392 = 'This message generated from CRM on %s.';
   cTXT0000393 = 'Principal: %s';
   cTXT0000394 = 'Type: %s';
   cTXT0000395 = 'Activity Number:  %.0f';
   cTXT0000396 = 'Priority:  %s';
   cTXT0000397 = 'Failed to display notification.';
   cTXT0000398 = 'Failed to display notification summary.';
   cTXT0000399 = 'Date';

   cTXT0000400 = 'Time';
   cTXT0000401 = '- Customers Only (No Prospects)';
   cTXT0000402 = '- Prospects Only';
   cTXT0000403 = '- Showing Records only for %s';
   cTXT0000404 = '- Showing Records only for User: %s';
   cTXT0000405 = 'Cannot display the selected record under the current filter.';
   cTXT0000406 = 'To view this record, you will need to change the global filter.';
   cTXT0000407 = 'Delete this item? This is a permanent and irreversible action.'; // call, task, etc.
   cTXT0000408 = 'Continue';
   cTXT0000409 = 'Customer Status Exception Authorization:';

   cTXT0000410 = 'This customer is on credit hold.  Additional activity is forbidden.';
   cTXT0000411 = 'You already have this record open for editing.';
   cTXT0000412 = 'This record is currently opened by user, %s.'#13#13'Do you want to view the issue Summary?';
   cTXT0000413 = 'CRM failed to access Microsoft Outlook data.  ' +
                 'Here are known causes for connection errors:'#13#13 +
                 '  -  You have chosen to deny access to Microsoft Outlook data.'#13 +
                 '  -  Microsoft Outlook is not installed or has not been installed correctly.'#13 +
                 '  -  Microsoft Outlook has been installed but has not been configured.'#13 +
                 '  -  The MAPI32.DLL is corrupted or out-dated.'#13 +
                 '  -  You are running Outlook97 or earlier.  Only Outlook98 and above are supported.'#13 +
                 '  -  An instance of Outlook is already running, but is an invalid state.  Verify this by checking the workstation processes.'#13#13 +
                 'CRM will continue, but will no longer attempt to access Outlook folders for this session.';
   //cTXT0000414 = 'CRM Schedule [%s] - %s'; // form caption
   //cTXT0000415 = 'CRM Schedule - %s'; // form caption
   //cTXT0000416 = 'Customer:';
   //cTXT0000417 = 'Contact:';
   //cTXT0000418 = 'Filter: %s';
   cTXT0000419 = 'Do you want to check the schedules of others involved for conflicts?';

   //cTXT0000420 = 'You can show or hide the Outlook Tasks any time by selecting ' +
   //              'Microsoft Outlook Appointments from the View menu.';
   //cTXT0000421 = 'Encountered Error while trying to load Microsoft Outlook Tasks [LoadOutlookTasks]:'#13#13'%s';
   cTXT0000422 = 'Encountered Error while trying to load Microsoft Outlook Appointment Items [LoadOutlookObjectsOnCalendar]:'#13#13'%s';
   cTXT0000423 = 'Could not display Microsoft Outlook Appointment:'#13#13'%s';
   cTXT0000424 = 'Edit';
   cTXT0000425 = 'Edit contact email address:';
   cTXT0000426 = 'Vendor Contacts  [%s]';
   cTXT0000427 = 'Please supply required header information before entering detail.';
   cTXT0000428 = 'EnterpriseIQ Information';
   cTXT0000429 = 'Alert Messages';

   cTXT0000430 = 'Web Site URL:';
   cTXT0000431 = 'Company Telephone:';
   cTXT0000432 = 'Company Extension:';
   cTXT0000433 = 'Company Fax:';
   cTXT0000434 = 'Contact:';
   cTXT0000435 = 'Contact Telephone:';
   cTXT0000436 = 'Contact Extension:';
   cTXT0000437 = 'Extension';
   cTXT0000438 = 'Contact Fax:';
   cTXT0000439 = 'Contact Email:';

   cTXT0000440 = 'Contact Title:';
   cTXT0000441 = 'My CRM Today';
   cTXT0000442 = 'CRM Today';
   cTXT0000443 = 'Activities';
   cTXT0000444 = 'Sales and Marketing';
   cTXT0000445 = 'Answer Book';
   cTXT0000446 = 'Outlook Tasks';
   cTXT0000447 = 'Outlook Calendar';
   cTXT0000448 = 'My Outlook Folders';
   cTXT0000449 = 'Calendar';

   cTXT0000450 = 'Contacts';
   cTXT0000451 = 'Deleted Items';
   cTXT0000452 = 'Drafts';
   cTXT0000453 = 'Inbox';
   cTXT0000454 = 'Journal';
   cTXT0000455 = 'Notes';
   cTXT0000456 = 'Outbox';
   cTXT0000457 = 'Sent Items';
   cTXT0000458 = 'Tasks';
   cTXT0000459 = 'Calls';

   cTXT0000460 = 'Meetings';
   cTXT0000461 = 'Support';
   cTXT0000462 = 'New Task';
   cTXT0000463 = 'Open Tasks';
   cTXT0000464 = 'Closed Tasks';
   cTXT0000465 = 'All Tasks';
   cTXT0000466 = 'New Call';
   cTXT0000467 = 'Open Calls';
   cTXT0000468 = 'Closed Calls';
   cTXT0000469 = 'All Calls';

   cTXT0000470 = 'New Meeting';
   cTXT0000471 = 'Open Meetings';
   cTXT0000472 = 'Closed Meetings';
   cTXT0000473 = 'All Meetings';
   cTXT0000474 = 'New Note';
   cTXT0000475 = 'Open Notes';
   cTXT0000476 = 'Closed Notes';
   cTXT0000477 = 'All Notes';
//   cTXT0000478 = 'Total commissions is greater that 100 percent. Cannot assign.';
   cTXT0000479 = 'Open Support Issues';

   cTXT0000480 = 'Closed Support Issues';
   cTXT0000481 = 'All Support Issues';
   cTXT0000482 = 'Queue View';
   cTXT0000483 = 'Customer Central';
//   cTXT0000484 = 'Customer Alert Messages';
   cTXT0000485 = 'Edit Customer Alert Messages.';
   //cTXT0000486 = 'Partner Alert Messages';
   //cTXT0000487 = 'Partner Contact Alert Messages';
   cTXT0000488 = 'Mail Merge';
   //cTXT0000489 = 'Customer Maintenance';

   //cTXT0000490 = 'Customer Status';
   //cTXT0000491 = 'Customer Contacts';
   //cTXT0000492 = 'Inventory';
   //cTXT0000493 = 'Sales Orders';
   //cTXT0000494 = 'Shipments';
   cTXT0000495 = 'Engineering Quotes';
   cTXT0000496 = 'Sales Quotations';
   cTXT0000497 = 'Sales Quotation'; // singular
   cTXT0000498 = 'Record';
   //cTXT0000499 = 'Web Order Import';

   //cTXT0000500 = 'New Sales Quotation';
   cTXT0000501 = 'Grouping and Mailing';
   cTXT0000502 = 'Partner Central'; // also used as a form caption
   //cTXT0000503 = 'New Partner';
   //cTXT0000504 = 'New Answer Book';
   //cTXT0000505 = 'Search Answer Book';
   //cTXT0000506 = 'Activity Calendar';
   //cTXT0000507 = 'View Activity "Assigned To"';
   //cTXT0000508 = 'Schedule Coordinator';
   cTXT0000509 = 'Centrally manage Vendor activity.  View Vendor Calls, Meetings, Tasks, and Support Issues.';

   //cTXT0000510 = 'Vendor Maintenance';
   //cTXT0000511 = 'Vendor Status';
   //cTXT0000512 = 'Work Flow';
   //cTXT0000513 = 'Loading page (%s) ...';
   //cTXT0000514 = 'Loading page...';
   cTXT0000515 = 'Accessing Answer Book.';
   cTXT0000516 = 'Could not open Answer Book.';
   cTXT0000517 = 'Could not find Answer Book Topic.';
   cTXT0000518 = 'Save change to task structure?';
   cTXT0000519 = 'Delete selected topic and all subtopics?';

   cTXT0000520 = 'Delete topic?';
   cTXT0000521 = 'Print this topic and all attachments?';
   cTXT0000522 = 'Print this topic?';
   cTXT0000523 = 'The file is already in this topic''s list.  Please choose another file.';
   cTXT0000524 = 'Searching for text.  Please wait.';
   cTXT0000525 = 'Found %d items for "%s."';
   cTXT0000526 = 'Your search returned 0 results.';
   cTXT0000527 = 'Could not find the specified file:'#13#13'%s';
   cTXT0000528 = 'Your search returned 1 record.';   // singular
   cTXT0000529 = 'Your search returned %d records.'; // plural

   cTXT0000530 = 'Answer Book not found.';
   cTXT0000531 = 'Answer Book: "%s"';
   cTXT0000532 = 'Please add a topic before attempting attach files.';
   cTXT0000533 = 'The file is already in the list for this topic.  Please choose another file.';
   cTXT0000534 = 'File name is required.  Please select a file.';
   cTXT0000535 = 'A file description is required.  Please enter a brief description of this file.';
   cTXT0000536 = 'Opening page...';
   cTXT0000537 = 'Accessing Customer Contacts...';
   cTXT0000538 = 'Accessing Partner Contacts...';
   cTXT0000539 = 'Accessing Vendor Contacts...';

   cTXT0000540 = 'Accessing Employees...';
   cTXT0000541 = 'Invalid email address:  %s';
   cTXT0000542 = 'Outlook is either not installed or is in an invalid state.  This list is unavailable.';
   cTXT0000543 = 'Your Microsoft Outlook Contacts';
   cTXT0000544 = 'Accessing %s data.  Please wait.';
   cTXT0000545 = 'Group Name';
   cTXT0000546 = 'Description';
   cTXT0000547 = 'First Name';
   cTXT0000548 = 'Last Name';
   cTXT0000549 = 'Company';

   cTXT0000550 = 'Address 1';
   cTXT0000551 = 'City';
   cTXT0000552 = 'State or Region';
   cTXT0000553 = 'Postal Code';
   cTXT0000554 = 'Telephone #';
   cTXT0000555 = 'Contact Telephone #';
   cTXT0000556 = 'Email';
   cTXT0000557 = 'Title';
   cTXT0000558 = 'Country';
   cTXT0000559 = 'Employee #';

   cTXT0000560 = '%s'#13'Contact: %s';
   //cTXT0000561 = 'Outlook is either not installed or is invalid, ' +
   //              'or the user option, "Use Microsoft Outlook" has been ' +
   //              'set to False.'#13#13'Cannot load Outlook contacts.';
   cTXT0000562 = 'Outlook is either not installed or is in an invalid state.  Cannot load Outlook contacts.';
   cTXT0000563 = 'The user option, Use Microsoft Outlook, has been set to false.  Cannot load Outlook contacts.';
   cTXT0000564 = 'Ln %d';  // Line number for status bar
   cTXT0000565 = 'Col %d'; // Column number for status bar
   cTXT0000566 = 'Cannot build recipient list.';
   cTXT0000567 = 'Clear body text?';
//   cTXT0000568 = 'A CRM Group has not been specified.';
   cTXT0000569 = 'Please select a category and group members to add.';

   cTXT0000570 = 'Customers';
   cTXT0000571 = 'Partners';
   cTXT0000572 = 'Vendors';
//   cTXT0000573 = 'Accessing Customers.  Please wait.';
//   cTXT0000574 = 'Accessing Customer Contacts.  Please wait.';
   cTXT0000575 = 'Accessing Partners.  Please wait.';
//   cTXT0000576 = 'Accessing Partner Contacts.  Please wait.';
//   cTXT0000577 = 'Accessing Vendors.  Please wait.';
//   cTXT0000578 = 'Accessing Vendor Contacts.  Please wait.';
//   cTXT0000579 = 'Accessing Employees.  Please wait.';

   //cTXT0000580 = 'Fax #:'; // with colon
//   cTXT0000581 = 'Fax #';
   //cTXT0000582 = 'Pager #:'; // with colon
   //cTXT0000583 = 'Pager #';
   //cTXT0000584 = 'Salutation:'; // with colon
//   cTXT0000585 = 'Salutation';
   //cTXT0000586 = 'Customer #:'; // with colon
//   cTXT0000587 = 'Customer #';
//   cTXT0000588 = 'Address 2';
//   cTXT0000589 = 'Address 3';

   //cTXT0000590 = 'Vendor #:'; // with colon
//   cTXT0000591 = 'Vendor #';
   //cTXT0000592 = 'Attention:'; // with colon
//   cTXT0000593 = 'Attention';
   //cTXT0000594 = 'Fax # 1:'; // with colon
//   cTXT0000595 = 'Fax # 1';
   //cTXT0000596 = 'Fax # 2:'; // with colon
//   cTXT0000597 = 'Fax # 2';
   //cTXT0000598 = 'Partner #:'; // with colon
//   cTXT0000599 = 'Partner #';

   //cTXT0000600 = 'Prime Contact:'; // with colon
//   cTXT0000601 = 'Prime Contact';
   cTXT0000602 = 'Adding Group Members. Please wait.';
   cTXT0000603 = 'Refreshing Group Data.  Please wait.' ;
//   cTXT0000604 = 'User Text %d'; // User Text 1, User Text 2, ...  Refers to user defined fields
//   cTXT0000605 = 'User Numeric %d'; // User Numeric 1, User Numeric 2, ...  Refers to user defined fields
   cTXT0000606 = 'Cannot locate selected Customer.  Please check your filtering options.';
   //cTXT0000607 = 'Convert this CRM Prospect to a Partner?';
   cTXT0000608 = 'The contact you entered already exists for this Partner.'; // first name, last name
   cTXT0000609 = 'Refreshing data.  Please wait.';

   cTXT0000610 = 'CRM encountered problems while trying ' +
                 'to copy this customer record to the partner ' +
                 'database.';
   cTXT0000611 = 'The Partner Number field is required.  Please enter a unique Partner Number.';
   cTXT0000612 = 'The Partner Number you entered is already used.  Please enter a different Partner Number.';
   cTXT0000613 = 'The Web Site URL has an invalid format.  Please check the URL text for invalid characters.';
   cTXT0000614 = 'Activity Summary'; // title inside summary text
   cTXT0000615 = 'Adding information for Activity # %.0f';
   cTXT0000616 = 'Assigned To:  %s';
   cTXT0000617 = 'Company: %s';
   cTXT0000618 = 'Priority: %s';
   cTXT0000619 = 'Status: Closed';

   cTXT0000620 = 'Status: Open';
   cTXT0000621 = 'Convert this CRM Prospect to a Customer?';
   cTXT0000622 = 'This contact already exists for this Customer:'#13#13'%s %s';
   cTXT0000623 = 'The Customer Number field is required.  Please enter a unique Customer Number.';
   cTXT0000624 = 'The Customer Number you entered is already used.  Please enter a different Customer Number.';
   cTXT0000625 = 'The Web Site URL has an invalid format.  Please check the URL text for invalid characters.';
   cTXT0000626 = 'The global CRM Context has been set to exclude prospects.  ' +
                 'Since the current Customer is a prospect, saving your changes ' +
                 'will hide this record from view.  To view it, you will need ' +
                 'to change the global CRM Context to include CRM prospects.';
   cTXT0000627 = 'Yes';
   cTXT0000628 = 'No';
   cTXT0000629 = 'Cannot locate selected Partner.';

   cTXT0000630 = 'Cannot locate selected Vendor.';
   cTXT0000631 = 'The Vendor Number field is required.  Please enter a unique Vendor Number.';
   cTXT0000632 = 'The Vendor Number you entered is already used.  Please enter a different Vendor Number.';
   cTXT0000633 = 'Delete record?';
   cTXT0000634 = 'Please create a group before attaching group members.';
   cTXT0000635 = 'Cannot locate selected CRM Group.';
   cTXT0000636 = 'Accessing Sales Quotations.  Please wait.';
   cTXT0000637 = 'Could not find the manufacturing configuration.  ' +
                 'The original configuration may have been deleted.';
   cTXT0000638 = 'Could not find the Engineering Quote.  The original quotation may have been deleted.';
   cTXT0000639 = 'Unit Price'            ;
   cTXT0000640 = 'List Unit Price'       ;
   cTXT0000641 = 'Price / 1000'          ;
   cTXT0000642 = 'Discount(%)'           ;
   cTXT0000643 = 'Tax Code'              ;
   cTXT0000644 = 'Tax Rate'              ;
   cTXT0000645 = 'Total Taxes'           ;
   cTXT0000646 = 'Total Price (with Tax)';
   cTXT0000647 = 'Salesperson(s)'          ;
   cTXT0000648 = 'Commission %'          ;
   cTXT0000649 = 'Total Commissions'     ;
   //cTXT0000650 = 'Discounted Unit Price' ;
   //cTXT0000651 = 'Discounted Price'      ;
   cTXT0000652 = 'Ship To'               ;
   cTXT0000653 = 'Request Date'          ;
   cTXT0000654 = 'Promise Date'          ;
   cTXT0000655 = 'Probability'           ;
   cTXT0000656 = 'SO Item Information'   ;
   cTXT0000657 = 'Comment'               ;
   cTXT0000658 = 'Added By'              ;
   cTXT0000659 = 'Eplant Name';

   cTXT0000660 = 'Price Breaks';
   cTXT0000661 = 'AKA Breaks';
   cTXT0000662 = 'Price Breaks (AKA)';
   cTXT0000663 = 'Price Breaks (Inventory)';
   cTXT0000664 = 'Price Breaks (BOM RFQ)';
   cTXT0000665 = 'BOM';
   cTXT0000666 = 'Engineering Quote';
   cTXT0000667 = 'Quote Inventory';
   cTXT0000668 = 'Master Inventory';
   cTXT0000669 = 'Project Manager';

   cTXT0000670 = 'Miscellaneous';
   cTXT0000671 = 'You (%s) have set the User Context filter to another user (%s).  ' +
                 'You cannot create a Sales Quotation with the User Context set to another user.  ' +
                 'Please reset this filter to "My Records" or "Show All" first before trying to create a new Sales Quotation.';
   cTXT0000672 = 'Creating Sales Quotation.  Please wait.';
   cTXT0000673 = 'The RFQ Number you entered is already used.  Please enter a different RFQ Number.';
   cTXT0000674 = 'The quantity has changed. Do you want to update the Unit Price?';
   cTXT0000675 = 'AKA Inventory';
   cTXT0000676 = 'Edit Note';
   cTXT0000677 = 'This action will copy all subqueues for %s and paste them to another queue.'#13#13 +
                 'Do you wish to continue?';
   cTXT0000678 =  'A Queue has not been created.  Please select a Queue before attempting to add Subqueues.';
   cTXT0000679 = 'Please enter a queue before adding subqueues.';

//   cTXT0000680 = 'Subqueues not included.';
//   cTXT0000681 = 'Double-click Queue Grid to show data.';
//   cTXT0000682 = 'Double-click Queue Grid to show data.';
//   cTXT0000683 = 'Double-click SubQueue Grid to show data.';
   //cTXT0000684 = 'There are no subqueues for this queue.';
//   cTXT0000685 = 'There are no Support Issues to display for this queue.';
//   cTXT0000686 = 'There are no Support Issues to display for this subqueue.';
   //cTXT0000687 = 'There are no Support Issues to display (no subqueues for queue).';
   cTXT0000688 = 'Queue View (%s - %s)';
   cTXT0000689 = 'Set Context.'#13 +
                 '     Assignment Context:  %s'#13 +
                 '     Principal Context:  %s';
//   cTXT0000690 = 'Save As';
//   cTXT0000691 = 'Properties';
//   cTXT0000692 = 'Page %d of %d';
//   cTXT0000693 = 'Please enter text to search.';
//   cTXT0000694 = 'Please select a Support Queue.';
   cTXT0000695 = 'Search Results';
//   cTXT0000696 = 'Support Event';
   cTXT0000697 = 'Please select a Support Queue first before trying to add a Subqueue.';
   cTXT0000698 = 'Close this issue?'; // prompt
   cTXT0000699 = 'Open this issue?';  // prompt
   
   cTXT0000700 = 'Close this support issue'; // hint
   cTXT0000701 = 'A Support issue has not been created.  '#13#13 +
                 'Please create a Support Issue first before attempting to add Support events.';
   cTXT0000702 = 'Encountered Error:';
   cTXT0000703 = 'Open';
   cTXT0000704 = 'Closed';
   //cTXT0000705 = 'All (Open and Closed)';
   cTXT0000706 = 'Select from Open Support Issues %s';
   cTXT0000707 = 'Select from Closed Support Issues %s';
   cTXT0000708 = 'Select from All Support Issues %s';
   cTXT0000709 = 'Open this support issue';

   cTXT0000710 = 'Attached Source Documents (%d attached)';
//   cTXT0000711 = 'There are no Support Events to summarize.  Display summary anyway?';
   cTXT0000712 = '%s CRM # %s [%s]'; // support issue title for Summary
//   cTXT0000713 = 'Support Issue # %s';
//   cTXT0000714 = 'Summary: %s';
   cTXT0000715 = 'Created By: %s';
   cTXT0000716 = 'Assigned To: %s';
   cTXT0000717 = 'Start Date: %s';
   cTXT0000718 = 'Finish Date: %s';
//   cTXT0000719 = 'Closed By: %s';
//   cTXT0000720 = 'Time Elapsed: %s';
//   cTXT0000721 = 'Principal: %s';
//   cTXT0000722 = 'Queue: %s'; // support queue
//   cTXT0000723 = 'Caller: %s';
   cTXT0000724 = 'Support Issue %.0f [%s]';
   cTXT0000725 = 'Internal Application Error:  Insert operation failed because the Record ID ' +
                 'for this Support Issue could not be found [Record ID:  %.0f].  ' +
                 'The Support Event cannot be added.';
   cTXT0000726 = 'Please create a Support Issue first before attempting to enter events.';
//   cTXT0000727 = 'Method of Contact is required.  Please enter a Method of Contact before saving your changes.';
//   cTXT0000728 = 'Incoming/Outgoing is required.  Please enter a Incoming/Outgoing before saving your changes.';
   cTXT0000729 = 'The length of the field, "Regarding," must be 4000 characters or less.'#13#13 +
                 'Do you wish to continue and truncate it?';

//   cTXT0000730 = 'Customer=%s'; // status bar text identifying CRM filter
//   cTXT0000731 = 'Customers Only'; // status bar text identifying CRM filter
//   cTXT0000732 = 'Prospects Only'; // status bar text identifying CRM filter
   cTXT0000733 = 'Assigned To=<Showing All>'; // status bar text identifying CRM filter
   cTXT0000734 = 'Assigned To=%s'; // status bar text identifying CRM filter
   cTXT0000735 = 'Showing only "My Records"'; // status bar text identifying CRM filter
//   cTXT0000736 = 'Status=Open'; // status bar text identifying CRM filter
//   cTXT0000737 = 'Status=Closed'; // status bar text identifying CRM filter
//   cTXT0000738 = 'Status=<Showing All>'; // status bar text identifying CRM filter
   cTXT0000739 = '%d day(s), %s'; // support issue age

   cTXT0000740 = '0 Days, 00:00:00'; // support issue age
   cTXT0000741 = 'Accessing Internal Documents.  Please wait.';
   cTXT0000742 = 'Accessing External Documents.  Please wait.';
   cTXT0000743 = 'The link is already in the list.';
   cTXT0000744 = 'The length of the field, "Notes," must be 255 characters or less.'#13#13 +
                 'Do you wish to continue and truncate it?';
   cTXT0000745 = 'A Support event has not been created.'#13#13 +
                 'Please create a Support event first before attempting to add Support events.';
   cTXT0000746 = 'A Support event has not been created.'#13#13 +
                 'Please create a Support event first before attaching files.';
   cTXT0000747 = 'Cannot locate record.';
   cTXT0000748 = 'Accessing CRM Support.  Please wait.';
   cTXT0000749 = 'Since you have applied a CRM Context filter, this record will no longer be visible.';

   cTXT0000750 = 'Support Issue not created.  Cannot add item information.'; // RMA tab
   cTXT0000751 = 'The inventory item is already in the list.';
   cTXT0000752 = 'The shipment is already in the list.';
   cTXT0000753 = '%s is a CRM Prospect.  Do you want to continue?'; // refers to customer
   cTXT0000754 = 'Edit Merge Document';
   cTXT0000755 = 'New Merge Document';
   cTXT0000756 = 'The Mail Merge document has not been created.'#13 +
                 'Are you sure you want to exit?';
   cTXT0000757 = 'The "Selected Fields" list is empty.  Please select fields.';
   cTXT0000758 = 'You have not specified a Microsoft Word document.  ' +
                 'Do you want to exit without creating a mail merge document?';
   cTXT0000759 = 'The Microsoft Word document already exists.  ' +
                 'Overwrite the current document?';
   cTXT0000760 = 'Retrieving field list.';
   cTXT0000761 = 'Clear the "To" and "From" values?';
   cTXT0000762 = 'Select Template';
   cTXT0000763 = 'You have not added filtering options.  ' +
                 'Filtering allows you to specify which records you want to see. ' +
                 'Without setting a filter, all records will be displayed (not recommended).'#13#13 +
                 'Do you want to add filtering options now?';
   cTXT0000764 = 'You have not specified any starting or ending values for your selection criteria.  ' +
                 'Currently, all records will be displayed (not recommended).'#13#13 +
                 'Do you want to specify selection criteria now?';
   cTXT0000765 = 'Save Document';
   cTXT0000766 = 'Merge fields are required.  Please select one or more fields to merge.';
   cTXT0000767 = 'You have not specified a Microsoft Word document.  ' +
                 'Do you want to continue anyway?';
   cTXT0000768 = 'Select Data';           // CRM mail merge tree view, edit screen
   cTXT0000769 = 'Mail Merge Document';   // CRM mail merge tree view, edit screen
   cTXT0000770 = 'Finalization';          // CRM mail merge tree view, edit screen
   cTXT0000771 = 'The directory does not exist:'#13#13'%s';
   cTXT0000772 = 'A file name cannot contain any of the following characters:'#13#13'%s';
   cTXT0000773 = 'Remove this mail merge document record?  ' +
                 'You will not be able to undo this action.';
   cTXT0000774 = 'Delete file from hard disk also?';
   cTXT0000775 = 'Preparing to delete file.  You will not be prompted for confirmation again.  '#13 +
                 'Are you sure you want to continue?';
   cTXT0000776 = 'Encountered errors attempting to delete the ' +
                 'Microsoft Word document.  The file could not be deleted.';
   cTXT0000777 = 'Please select an entry to edit.';
//   cTXT0000778 = 'Cannot verify database for document because the database does not exist.  ' +
//                 'Do you want to attempt to create the database now?';
   cTXT0000779 = 'Do you want to merge only the "current record"?'#13#13 +
                 'Click "No," if you want to merge all records.';

   cTXT0000780 = 'The Microsoft Word document used for this Mail Merge cannot be found:'#13#13 +
                 '     "%s"'#13#13 +
                 'This file has either not been created yet, or it has been deleted, renamed or moved to a different directory.';
   cTXT0000781 = 'The Microsoft Word document for this entry has not been created yet.';
   //cTXT0000782 = 'Insufficient access rights.';
   cTXT0000783 = 'Edit Note Text'; // used in mail merge for notes and history, similar to cTXT0000676 but different
   cTXT0000784 = 'Updating activity event.  Please wait.';
   cTXT0000785 = 'Updating CRM Notes.  Please wait.';
   cTXT0000786 = 'Could not find document properties';
   cTXT0000787 = 'Could not find the file.  Do you want to find the file yourself?';
   cTXT0000788 = 'Please select a document.';
   cTXT0000789 = 'Modify filter and update the merge data';

   cTXT0000790 = 'Update the merge data using previous filter';
   cTXT0000791 = 'Update the merge data';
   cTXT0000792 = 'Do not update data';
   cTXT0000793 = 'There are no fields to display.  Cannot create mail merge dataset.';
//   cTXT0000794 = 'Problems were encountered whil attempting to update notes and history.';
//   cTXT0000795 = 'Building query.  Please wait.';
   cTXT0000796 = 'A problem has occurred while trying to build the query WHERE clause.  ' +
                 'The Master DataSet ID was 0, while the Contact DataSet ID was supplied.  ' +
                 'Operation aborted.' ;
   cTXT0000797 = 'A problem has occurred while trying to build the merge dataset.  ' +
                 'Operation aborted.';
//   cTXT0000798 = 'Building query (adding filtering).  Please wait.';
   cTXT0000799 = 'The datatype for column, "%s," ' +
                 'used in the Selection Criteria could not be determined.  ' +
                 'It cannot be used to filter the merge dataset.';
   //cTXT0000800 = 'CRM';
   //cTXT0000801 = 'FOB';
   //cTXT0000802 = 'YTD';
   //cTXT0000803 = 'EIC';
   //cTXT0000804 = 'or';
   //cTXT0000805 = 'Tax ID';
   //cTXT0000806 = 'QA Rating';
   //cTXT0000807 = 'USA';
   cTXT0000808 = 'Cannot find the template file: "%s."  A blank document will be used instead.';
   cTXT0000809 = 'The Document Name is required.  ' +
                 'Please enter a document name that should appear on lists and pick lists.';

   cTXT0000810 = '<My New Document>';
   cTXT0000811 = 'The Label value for this filter record is empty.  Please enter a Label.';
   cTXT0000812 = 'Customers and Prospects';
   cTXT0000813 = 'Contacts';
   cTXT0000814 = 'Vendors';
   cTXT0000815 = 'Vendor Contacts';
   cTXT0000816 = 'Partners';
   cTXT0000817 = 'Partner Contacts';
   cTXT0000818 = 'Employees';
   cTXT0000819 = 'CRM Group';

   cTXT0000820 = 'Address 1';
   cTXT0000821 = 'Address 2';
   cTXT0000822 = 'Badge Number';
   cTXT0000823 = 'Birth Date';
   cTXT0000824 = 'City';
   cTXT0000825 = 'Company';
   cTXT0000826 = 'Company Address 1';
   cTXT0000827 = 'Company Address 2';
   cTXT0000828 = 'Company Address 3';
   cTXT0000829 = 'Company City';

   cTXT0000830 = 'Company Country';
   cTXT0000831 = 'Company Fax Number';
   cTXT0000832 = 'Company Postal Code';
   cTXT0000833 = 'Company State Or Region';
   cTXT0000834 = 'Company Telephone Ext';
   cTXT0000835 = 'Company Telephone Number';
   cTXT0000836 = 'Company Web Site';
   cTXT0000837 = 'Contact Email';
   cTXT0000838 = 'Calendar is unavailable for user, %s.';
   cTXT0000839 = 'Contact Fax Number';

   cTXT0000840 = 'Contact First Name';
   cTXT0000841 = 'Contact Last Name';
   cTXT0000842 = 'Contact Mobile Telephone';
   cTXT0000843 = 'Contact Pager';
   cTXT0000844 = 'Contact Salutation';
   cTXT0000845 = 'Contact Telephone Extension';
   cTXT0000846 = 'Contact Telephone Number';
   cTXT0000847 = 'Contact Text Field 1';
   cTXT0000848 = 'Contact Text Field 2';
   cTXT0000849 = 'Contact Title';

   cTXT0000850 = 'Contact Type';
   cTXT0000851 = 'Contact Web User Name';
   cTXT0000852 = 'Country';
   cTXT0000853 = 'CRM Number Field 1';
   cTXT0000854 = 'CRM Number Field 10';
   cTXT0000855 = 'CRM Number Field 2';
   cTXT0000856 = 'CRM Number Field 3';
   cTXT0000857 = 'CRM Number Field 4';
   cTXT0000858 = 'CRM Number Field 5';
   cTXT0000859 = 'CRM Number Field 6';

   cTXT0000860 = 'CRM Number Field 7';
   cTXT0000861 = 'CRM Number Field 8';
   cTXT0000862 = 'CRM Number Field 9';
   cTXT0000863 = 'CRM Prospect';
   cTXT0000864 = 'CRM Text Field 1';
   cTXT0000865 = 'CRM Text Field 10';
   cTXT0000866 = 'CRM Text Field 2';
   cTXT0000867 = 'CRM Text Field 3';
   cTXT0000868 = 'CRM Text Field 4';
   cTXT0000869 = 'CRM Text Field 5';

   cTXT0000870 = 'CRM Text Field 6';
   cTXT0000871 = 'CRM Text Field 7';
   cTXT0000872 = 'CRM Text Field 8';
   cTXT0000873 = 'CRM Text Field 9';
   cTXT0000874 = 'Customer Address 1';
   cTXT0000875 = 'Customer Address 2';
   cTXT0000876 = 'Customer Address 3';
   cTXT0000877 = 'Customer City';
   cTXT0000878 = 'Customer Commission';
   cTXT0000879 = 'Customer Company';

   cTXT0000880 = 'Customer Country';
   cTXT0000881 = 'Customer Credit Limit';
   cTXT0000882 = 'Customer Discount';
   cTXT0000883 = 'Customer Fax Number';
   cTXT0000884 = 'Customer Finance Charge';
   cTXT0000885 = 'Customer Group';
   cTXT0000886 = 'Customer Highest Balance';
   cTXT0000887 = 'Customer Industry';
   cTXT0000888 = 'Customer Is Inactive';
   cTXT0000889 = 'Customer Note';

   cTXT0000890 = 'Customer Number';
   cTXT0000891 = 'Customer Number Field 1';
   cTXT0000892 = 'Customer Number Field 2';
   cTXT0000893 = 'Customer Number Field 3';
   cTXT0000894 = 'Customer Number Field 4';
   cTXT0000895 = 'Customer Number Field 5';
   cTXT0000896 = 'Customer Postal Code';
   cTXT0000897 = 'Customer Prime Contact';
   cTXT0000898 = 'Customer Safety Lead Time';
   cTXT0000899 = 'Customer Shipment Forecast';

   cTXT0000900 = 'Customer Since Date';
   cTXT0000901 = 'Customer State Or Region';
   cTXT0000902 = 'Customer Status';
   cTXT0000903 = 'Customer Status Date';
   cTXT0000904 = 'Customer Telephone Extension';
   cTXT0000905 = 'Customer Telephone Number';
   cTXT0000906 = 'Customer Territory';
   cTXT0000907 = 'Customer Text Field 1';
   cTXT0000908 = 'Customer Text Field 2';
   cTXT0000909 = 'Customer Text Field 3';

   cTXT0000910 = 'Customer Text Field 4';
   cTXT0000911 = 'Customer Text Field 5';
   cTXT0000912 = 'Customer Text Field 6';
   cTXT0000913 = 'Customer Web Site';
   cTXT0000914 = 'Customer Ytd Sales';
   cTXT0000915 = 'Date Hired';
   cTXT0000916 = 'Department';
   cTXT0000917 = 'EIC';
   cTXT0000918 = 'EIC Married Status';
   cTXT0000919 = 'Employee Level Code';

   cTXT0000920 = 'Employee Level Description';
   cTXT0000921 = 'Employee Number';
   cTXT0000922 = 'First Name';
   cTXT0000923 = 'Freight Description';
   cTXT0000924 = 'Group Description';
   cTXT0000925 = 'Group Name';
   cTXT0000926 = 'Is Citizen?';
   cTXT0000927 = 'Is Default Contact?';
   cTXT0000928 = 'Is Inactive?';
   cTXT0000929 = 'Job Description';

   cTXT0000930 = 'Job Title';
   cTXT0000931 = 'Last Finance Charge Date';
   cTXT0000932 = 'Last Name';
   cTXT0000933 = 'Last Review Date';
   cTXT0000934 = 'Marital Status';
   cTXT0000935 = 'Middle Name';
   cTXT0000936 = 'Minimum Change Interval';
   cTXT0000937 = 'Next Review Date';
   cTXT0000938 = 'Partner Address 1';
   cTXT0000939 = 'Partner Address 2';

   cTXT0000940 = 'Partner Address 3';
   cTXT0000941 = 'Partner City';
   cTXT0000942 = 'Partner Company';
   cTXT0000943 = 'Partner Country';
   cTXT0000944 = 'Partner Created';
   cTXT0000945 = 'Partner Fax Number';
   cTXT0000946 = 'Partner Group';
   cTXT0000947 = 'Partner Industry';
   cTXT0000948 = 'Partner Is Inactive?';
   cTXT0000949 = 'Partner Note';

   cTXT0000950 = 'Partner Number';
   cTXT0000951 = 'Partner Number Field 1';
   cTXT0000952 = 'Partner Number Field 2';
   cTXT0000953 = 'Partner Number Field 3';
   cTXT0000954 = 'Partner Number Field 4';
   cTXT0000955 = 'Partner Number Field 5';
   cTXT0000956 = 'Partner Postal Code';
   cTXT0000957 = 'Partner Prime Contact';
   cTXT0000958 = 'Partner State Or Region';
   cTXT0000959 = 'Partner Status';

   cTXT0000960 = 'Partner Status Date';
   cTXT0000961 = 'Partner Telephone Ext';
   cTXT0000962 = 'Partner Telephone Number';
   cTXT0000963 = 'Partner Territory';
   cTXT0000964 = 'Partner Text Field 1';
   cTXT0000965 = 'Partner Text Field 2';
   cTXT0000966 = 'Partner Text Field 3';
   cTXT0000967 = 'Partner Text Field 4';
   cTXT0000968 = 'Partner Text Field 5';
   cTXT0000969 = 'Partner Text Field 6';

   cTXT0000970 = 'Partner Web Site';
   cTXT0000971 = 'Postal Code';
   cTXT0000972 = 'Race';
   cTXT0000973 = 'Reset Benefits Date';
   cTXT0000974 = 'Sex/Gender';
   cTXT0000975 = 'Source';
   cTXT0000976 = 'State or Region';
   cTXT0000977 = 'Status Code';
   cTXT0000978 = 'Tax Code';
   cTXT0000979 = 'Tax Code Description';

   cTXT0000980 = 'Tax Rate';
   cTXT0000981 = 'Telephone Number';
   cTXT0000982 = 'Termination Date';
   cTXT0000983 = 'Use USA Mask (Telephone/Fax)';
   cTXT0000984 = 'Vendor Address 1';
   cTXT0000985 = 'Vendor Address 2';
   cTXT0000986 = 'Vendor Address 3';
   cTXT0000987 = 'Vendor Attention';
   cTXT0000988 = 'Vendor Bank Account Number';
   cTXT0000989 = 'Vendor City';

   cTXT0000990 = 'Vendor Company';
   cTXT0000991 = 'Vendor Country';
   cTXT0000992 = 'Vendor Credit Limit';
   cTXT0000993 = 'Vendor Email';
   cTXT0000994 = 'Vendor EMarket Place';
   cTXT0000995 = 'Vendor Fax Number';
   cTXT0000996 = 'Vendor Fax Number 2';
   cTXT0000997 = 'Vendor Federal Tax ID';
   cTXT0000998 = 'Vendor FOB';
   cTXT0000999 = 'Vendor Include in 1099';

   cTXT0001000 = 'Vendor Is Inactive';
   cTXT0001001 = 'Vendor Number';
   cTXT0001002 = 'Vendor Number Field 1';
   cTXT0001003 = 'Vendor Number Field 2';
   cTXT0001004 = 'Vendor Postal Code';
   cTXT0001005 = 'Vendor Prime Contact';
   cTXT0001006 = 'Vendor QA Rating';
   cTXT0001007 = 'Vendor Rating';
   cTXT0001008 = 'Vendor State or Region';
   cTXT0001009 = 'Vendor Statement Date';

   cTXT0001010 = 'Vendor Status';
   cTXT0001011 = 'Vendor Subject To Rating';
   cTXT0001012 = 'Vendor Tax Rate';
   cTXT0001013 = 'Vendor Taxable';
   cTXT0001014 = 'Vendor Telephone Number';
   cTXT0001015 = 'Vendor Text Field 1';
   cTXT0001016 = 'Vendor Text Field 2';
   cTXT0001017 = 'Vendor Text Field 3';
   cTXT0001018 = 'Vendor Web Site';
   cTXT0001019 = 'Vendor YTD Purchases';

   cTXT0001020 = 'Wage Basis';
   cTXT0001021 = 'Web User Name';
//   cTXT0001022 = 'Opening exported dataset.  Please wait.';
   cTXT0001023 = 'Record Count: %d';
//   cTXT0001024 = 'TableType:  %s';
//   cTXT0001025 = 'dBASE';     // refers to table type or database format
//   cTXT0001026 = 'Paradox';   // refers to table type or database format
//   cTXT0001027 = 'FoxPro';    // refers to table type or database format
//   cTXT0001028 = 'Text File'; // refers to table type or database format
//   cTXT0001029 = 'Opening query.  Please wait.';
//
//   cTXT0001030 = 'Unknown';       // refers to field type for display purposes
//   cTXT0001031 = 'Integer';       // refers to field type for display purposes
//   cTXT0001032 = 'Yes/No';        // refers to field type for display purposes
//   cTXT0001033 = 'Number';        // refers to field type for display purposes
//   cTXT0001034 = 'Date and Time'; // refers to field type for display purposes
//   cTXT0001035 = 'Text';          // refers to field type for display purposes
//   cTXT0001036 = 'Blob';          // refers to field type for display purposes
//   cTXT0001037 = 'Table not found: %s [GetDataTypeStringIQ()]';
//   cTXT0001038 = 'Unknown or invalid data type [Field name: %s][Type: %s]';
//   cTXT0001039 = 'Error Log';

   //cTXT0001040 = 'Database not assigned.  Please set the database.';
   //cTXT0001041 = 'Microsoft Access object already created.';
   //cTXT0001042 = 'Microsoft Access object not created.';
   //cTXT0001043 = 'Could not connect to Microsoft Access.';
   cTXT0001044 = 'Do you want to link fields automatically that appear to match?';
   cTXT0001045 = 'There were no fields found that appear to match.  Please match fields manually.';
//   cTXT0001046 = 'Master dataset records processed:';
//   cTXT0001047 = 'Detail dataset records processed:';
//   cTXT0001048 = 'Total dataset records processed:';
   cTXT0001049 = 'You have selected a dataset that requires two primary keys:  '#13#13 +
                 '   1.  One field from each table must be part of the list of linked fields. '#13 +
                 '   2.  One primary key is required for the each of the tables in the target list.'#13#13 +
                 'Do you want automatically to apply the default primary keys now?';

   //cTXT0001050 = 'Could not find the DBF file:'#13#13'%s';
   cTXT0001051 = 'Importing';
   //cTXT0001052 = 'Building temporary table...';
   cTXT0001053 = 'Deleting schema files...' ;
   //cTXT0001054 = 'Could not create temporary table.  Encountered the following error:'#13#13 +
   //              '%s'#13#13 +
   //              'You may click Execute and attempt to run the import a second time.  ' +
   //              'If you still encounter this error, please delete schema files using IQStatus and try again.';
   cTXT0001055 = 'Accessing external data...';
//   cTXT0001056 = 'Processing records for import:';
//   cTXT0001057 = 'CRM encountered %d error(s) during the import process.  ' +
//                 'Some records may not be included in the import.  ' +
//                 'Do you want to continue with the import?'#13#13 +
//                 'Click "Yes" to import good records.'#13 +
//                 'Click "No" if you do not want to import any records.';
   cTXT0001058 = 'You are about to import %d records.'#13#13 +
                 'Are you sure you want to import the records?';
   cTXT0001059 = 'A fatal error has occurred in the import process.  No records were imported.';

   cTXT0001060 = 'Operation aborted.  No records were imported.';
   cTXT0001061 = 'Import completed with %d record(s) imported.';
   cTXT0001062 = 'Please select fields to export.';
   //cTXT0001063 = 'Please select a file location.';
   cTXT0001064 = 'Please select fields to export.';
   cTXT0001065 = 'Exporting data.  Please wait.';
   //cTXT0001066 = 'Export completed with %d record(s) exported.';
   cTXT0001067 = 'You have linked fields to the current dataset.  ' +
                 'Changing the dataset now will clear your selection list.'#13#13 +
                 'Do you want to continue?';
   //cTXT0001068 = 'Cannot retrieve table names from source file:'#13'%s'#13#13'%s';
   cTXT0001069 = 'Please select items to link.';

   cTXT0001070 = 'This link has already been established.';
   cTXT0001071 = 'Field already used: %s';  // refers to selected field name
//   cTXT0001072 = 'Field size mismatch.  The source field is too large for the target field.';
   cTXT0001073 = 'You have linked a number field to a text field.';
//   cTXT0001074 = 'The datatypes on these two fields do not match:'#13#13 +
//                 '   · %s (%s)'#13 +
//                 '   · %s (%s)'#13#13 +
//                 'Please choose fields that have matching datatypes.';
   cTXT0001075 = 'Please select an item from the list.';
   cTXT0001076 = 'Date and time fields cannot be used as primary keys.';
   cTXT0001077 = 'Clear all linked fields?';
   cTXT0001078 = 'This action will search for fields that appear to match ' +
                 'and add them to your list of linked fields.'#13#13 +
                 'Do you want to continue?';
   cTXT0001079 = 'There were no fields found that appear to match.  Please match fields manually.';
               
   cTXT0001080 = 'Found %d matching fields.  Do you want to set default primary keys now?';
   cTXT0001081 = 'Rename DBF Field';
   cTXT0001082 = 'Enter a name for the DBF field:';
//   cTXT0001083 = 'Field names must be eight characters or less.';
   cTXT0001084 = 'That field name is already used.  Enter a different name.';
   cTXT0001085 = 'There are no CRM Group members to export.';
   cTXT0001086 = 'The Sales Quotation Eplant (%s) and the Shipping Eplant (%s) do not match.';
   cTXT0001087 = 'Mass Mailer supports Text and HTML files only.  The file you selected may not load properly.';
   cTXT0001088 = 'Could not load file.';
//   cTXT0001089 = 'Errors:';

//   cTXT0001090 = 'Blob fields are unsupported.  Cannot import.';
   cTXT0001091 = 'Notification Errors';
   cTXT0001092 = 'Error log is attached.';
   cTXT0001093 = 'High';
   cTXT0001094 = 'Medium';
   cTXT0001095 = 'Low';
   cTXT0001096 = 'Email List (Read Only)';
   cTXT0001097 = 'Building list.  Please wait.';
   cTXT0001098 = 'Add all recipients?';
   cTXT0001099 = 'The selected file (%s) is a local file and will not be accessible ' +
                 'to network users.  Do you still wish to attach the file?';

   cTXT0001100 = 'Local File';
   cTXT0001101 = 'Opening page %s';
   cTXT0001102 = 'Application Error:  Could not insert topic.  Topic data not found.';
   cTXT0001103 = 'Opening attachment.  Please wait.';
   cTXT0001104 = 'Click the insert button to add a topic.';
   cTXT0001105 = 'No topic selected.';
   cTXT0001106 = 'Summary:';
   cTXT0001107 = '[Answer Book: %s]';
   cTXT0001108 = 'No date range applied.';
   cTXT0001109 = 'Date Range: %s to %s';

   cTXT0001110 = 'Include History: Yes';
   cTXT0001111 = 'Include History: No';
   cTXT0001112 = 'Record not found.';
//   cTXT0001113 = 'Microsoft Word not installed.';
   cTXT0001114 = 'Microsoft Word version invalid.';
//   cTXT0001115 = 'Microsoft Access not installed.';
//   cTXT0001116 = 'Microsoft Access version invalid.';
   cTXT0001117 = 'The following Microsoft applications are required for CRM Mail Merge to function properly:';
   cTXT0001118 = 'My Mail Merge Documents';
   cTXT0001119 = 'CRM must now close and reopen to refresh login information.';

   cTXT0001120 = 'Refreshing login information.  Please wait.';
   cTXT0001121 = 'Could not find Answer Book.';
   cTXT0001122 = 'Application Error:  Record ID not supplied.';
   cTXT0001123 = 'Error loading CRM shortcuts:  %s';
   cTXT0001124 = 'Expand list';
   cTXT0001125 = ' Date: %s';
//   cTXT0001126 = '%sSales Quotation Information%s';
//   cTXT0001127 = ' Quotation #: %.0f';
   cTXT0001128 = 'Email could not be sent.';
//   cTXT0001129 = '<Unknown error>';

   cTXT0001130 = 'Failed to send notification email.';
   cTXT0001131 = 'Customer not specified.';
   cTXT0001132 = 'Could not create default "Ship To" and "Bill To" addresses.  Could not find customer ID.';
   cTXT0001133 = 'Could not create activity record.  Process aborted.' ;
   //cTXT0001134 = 'New %s [ %s ]'; // i.e., "New Call [JOHN]"
   cTXT0001135 = 'You have not set an alarm.  Do you wish to do so now?';
   cTXT0001136 = 'Cancel this mass activity?';
   cTXT0001137 = 'Call Type';
   cTXT0001138 = 'Task Type';
   cTXT0001139 = 'Meeting Type';

   cTXT0001140 = 'Note Types';
   cTXT0001141 = 'Please select an activity type first before accessing this feature.';
   cTXT0001142 = 'Support Issues';
   //cTXT0001143 = 'Activity Type';
   cTXT0001144 = 'Select from Closed Calls';
   cTXT0001145 = 'Select from Closed Tasks';
   cTXT0001146 = 'Select from Closed Meetings';
   cTXT0001147 = 'Select from Closed Notes';
   cTXT0001148 = 'Select from Closed Support Issues';
   cTXT0001149 = 'Select from Open Calls';
   cTXT0001150 = 'Select from Open Tasks';
   cTXT0001151 = 'Select from Open Meetings';
   cTXT0001152 = 'Select from Open Support Issues';
   cTXT0001153 = 'Select from Open Notes';
   cTXT0001154 = 'Select from All Calls';
   cTXT0001155 = 'Select from All Tasks';
   cTXT0001156 = 'Select from All Meetings';
   cTXT0001157 = 'Select from All Notes';
   cTXT0001158 = 'Select from All Support Issues';
   cTXT0001159 = 'Select from Activities';
   cTXT0001160 = 'Regarding';
   cTXT0001161 = 'Call Reminder!  %s';  // form caption for notification
   cTXT0001162 = 'Task Reminder! %s';   // form caption for notification
   cTXT0001163 = 'Meeting Reminder! %s';// form caption for notification
   cTXT0001164 = 'Note Reminder! %s';   // form caption for notification
   cTXT0001165 = 'Reminder!';           // this caption should never be used
   cTXT0001166 = 'Attempted to display reminder, but the record could not be found.';
   cTXT0001167 = 'New Call [%s]';         // form caption for new activity
   cTXT0001168 = 'New Task [%s]';         // form caption for new activity
   cTXT0001169 = 'New Meeting [%s]';      // form caption for new activity
   cTXT0001170 = 'New Note [%s]';         // form caption for new activity
   cTXT0001171 = 'New Activity';          // this caption should never be used
   cTXT0001172 = 'Call %d';          // form caption
   cTXT0001173 = 'Task %d';          // form caption
   cTXT0001174 = 'Meeting %d';       // form caption
   cTXT0001175 = 'Note %d';          // form caption
   cTXT0001176 = 'A Notification Alert was displayed.'#13 +
                 '  Scheduled to display:  %s'#13 +
                 '  Actually displayed:  %s';
   cTXT0001177 = 'Attached Source Documents (%d attached)';
   cTXT0001178 = 'Do you wish to save changes?'#13#13 +
                 'Before opening your Mail Merge documents, all changes to this activity must be saved.';
   cTXT0001179 = 'You have chosen to set the Alarm for this activity, but you do not have the "Show Notifications" option set in Parameters.  ' +
                 'Do you want to enable this option now?';
   cTXT0001180 = 'A reminder has been set for %s'; // refers to date and time
//   cTXT0001181 = 'Creating Activities.  Please wait.'; // used by the schedule coordinator when creating multiple activities
   cTXT0001182 = 'Since you have applied a CRM Context filter, this record will not be visible.';
   cTXT0001183 = 'Issue Start';
   cTXT0001184 = 'Issue Finish';
   //cTXT0001185 = 'Event Created';
   cTXT0001186 = 'RMA not created.';
   cTXT0001187 = 'UOM'; // = unit of measure
   cTXT0001188 = 'CRM has encountered the following error during startup and needs to close:'#13#13'%s'#13#13 +
                 'Please check version compatibility.  We are sorry for the inconvenience.';
   cTXT0001189 = 'Please select an item in the list.';
   cTXT0001190 = 'Filter Field: %s'; // used by crm_dbtrans_qkfilter
   cTXT0001191 = '<Default>';
   cTXT0001192 = '<Dataset unassigned>';
   cTXT0001193 = '<Document name and path unassigned>';
   cTXT0001194 = '<Template name unassigned>';
   cTXT0001195 = '<No merge fields selected>';
   //cTXT0001196 = '';
   cTXT0001197 = 'Others Involved';
   cTXT0001198 = 'Results';
   //cTXT0001199 = 'Alarm';
   cTXT0001200 = 'Check this option if you want all CRM users '#13'to view and use this Mail Merge record';
//   cTXT0001201 = 'Replace current text with file contents?';
//   cTXT0001202 = 'The text is longer than the allowable length.  The text will be truncated.';
//   cTXT0001203 = 'Could not connect to Microsoft Excel.';
   cTXT0001204 = 'Social Security Number';
   cTXT0001205 = 'Current Status';
   cTXT0001206 = 'Resident Visa Expires';
   cTXT0001207 = 'Referral Source';
   cTXT0001208 = 'Relocation';
   cTXT0001209 = 'Do you want all CRM users to view and use this Mail Merge record?';

   cTXT0001210 = 'Do you want to hide this Mail Merge record from other users?';
   cTXT0001211 = 'Publish Selected Document';
   cTXT0001212 = 'Unpublish Selected Document';
   cTXT0001213 = 'The attached credit card does not belong to this company.  ' +
                 'Please either remove it, or assign another credit card.';
   cTXT0001214 = 'Open Issues for %s'; // refers to Company or Contact Name
   cTXT0001215 = 'One or more items do not have quantity values.  Please specify a quantity to return for each item.';
   cTXT0001216 = '%s has open issues.  Do you want to view a list?';
   cTXT0001217 = 'Are you sure you want to close CRM?';
   cTXT0001218 = 'Support Issue Summary';
//   cTXT0001219 = 'Added By %s';
//   cTXT0001220 = 'Contact Method: %s';
//   cTXT0001221 = 'Incoming/Outgoing: %s';
//   cTXT0001222 = 'Activity Link: %s [%.0f]';
//   cTXT0001223 = 'Subqueue:  %s';
   cTXT0001224 = 'Service Labor - %s';
   cTXT0001225 = 'Incoming';
   cTXT0001226 = 'Outgoing';
   cTXT0001227 = 'There are no items.  Please add items before attempting to create an RMA.';
//   cTXT0001228 = 'Send Support Issue Summary to Distribution List?';
   cTXT0001229 = 'There are no recipients.  Cannot send email.';
//   cTXT0001230 = 'Application Error: Could not send email.';
   cTXT0001231 = 'Check this option if you want to be prompted each time '#13 +
                 'you open CRM to roll overdue calls, tasks and meetings '#13 +
                 'to the current date.';
   cTXT0001232 = 'Calls: %d';
   cTXT0001233 = 'Tasks: %d';
   cTXT0001234 = 'Meetings: %d';
   cTXT0001235 = 'There are no overdue activities.';
   cTXT0001236 = 'A description is required.';
   cTXT0001237 = 'Please select at least one person from the list.';
   cTXT0001238 = 'Please select an activity type.';
   cTXT0001239 = 'Loading ...';
   //cTXT0001240 = 'Updating...';
   cTXT0001241 = '%s (%s)';
   cTXT0001242 = 'Assigned by %s on %s'; // name and date
   cTXT0001243 = '(Unassigned)';
   cTXT0001244 = 'The reminder for this activity has been scheduled for immediate display.'#13#13 +
                 'Please schedule the reminder message for a future date and time.';
   cTXT0001245 = 'The End Time preceeds the Start Time.';
   cTXT0001246 = 'Message was sent on %s';
   cTXT0001247 = 'Reminder [%s]';
   cTXT0001248 = 'Schedule a Meeting for %s';
   cTXT0001249 = 'Schedule Coordinator - %s';
   cTXT0001250 = 'Schedule Coordinator';
   cTXT0001251 = 'Conflicts with another activity on the calendar.';
   cTXT0001252 = 'This call occurs in the past.';
   cTXT0001253 = 'This task occurs in the past.';
   cTXT0001254 = 'This meeting occurs in the past.';
   cTXT0001255 = 'Adjacent to another activity on the calendar.';
   cTXT0001256 = 'Some activities could not be rolled over because of schedule conflicts.';
   cTXT0001257 = '%d Calls';
   cTXT0001258 = '%d Tasks';
   cTXT0001259 = '%d Meetings';
   cTXT0001260 = 'These activities occur either immediately before or immediately after the current call.';
   cTXT0001261 = 'These activities occur either immediately before or immediately after the current task.';
   cTXT0001262 = 'These activities occur either immediately before or immediately after the current meeting.';
   cTXT0001263 = 'Scheduling Conflict';
   cTXT0001264 = 'Adjacent Activities';
   cTXT0001265 = 'Please select a Principal company or contact.';
   cTXT0001266 = 'User name and password required.';
   cTXT0001267 = 'Connection failed.';
   cTXT0001268 = 'Connected successfully.';
   cTXT0001269 = 'There are no employees in the Others Involved list.  Cannot display schedules.';
   cTXT0001270 = 'Company name field required.';
   cTXT0001271 = 'Prefix value required.';
   cTXT0001272 = 'Please select a target database.';
   cTXT0001273 = 'Please select a source database.';
   cTXT0001274 = '%s, %s,';
   cTXT0001275 = '%s,';
   cTXT0001276 = 'Service Central';
   cTXT0001277 = 'Implement and oversee your marketing campaign.';
   cTXT0001278 = 'The item Eplant (%s) and the Shipping Eplant (%s) do not match.';
//   cTXT0001279 = 'Code %s already has a warranty record.';
   cTXT0001280 = 'Project is already linked to this campaign.';
   cTXT0001281 = 'The Project is currently linked to Campaign # %.0f.'#13#13 +
                 'Redirect the link to this campaign?';
   cTXT0001282 = 'Remove link to selected Project?';
   cTXT0001283 = 'Duplicate serial number.  Serial # %s already has a service record.  Please enter a unique serial number.';
   cTXT0001284 = 'New Sales Quotation created by %s.';
//   cTXT0001285 = 'Mass Mailing sent by %s';
   cTXT0001286 = 'Mail Merge printed by %s';
   cTXT0001287 = 'Sales Order generated from CRM Quotatation by %s';
   cTXT0001288 = 'Subject: %s';
   cTXT0001289 = 'The mailing is currently linked with a campaign.  Continue?';
   cTXT0001290 = 'Filtered by Principal Context.';
   cTXT0001291 = 'The item is already in the list';
   cTXT0001292 = 'Minutes';
   cTXT0001293 = 'Hours';
   cTXT0001294 = 'Days';
   cTXT0001295 = 'Weeks';
   cTXT0001296 = 'Remove link?';
//   cTXT0001297 = 'Connection string too long.';
//   cTXT0001298 = 'The connection string used to connect to Microsoft Word ' +
//    'and establish its datasource is too long.  Please choose a shorter document path.';
   cTXT0001299 = 'The user name, %s, must first be associated with an ' +
                 'employee record.'#13#13 +
                 'Please ask your Database Administrator to associate your ' +
                 'Oracle login name to your employee record in the ' +
                 'Security Inspector.';
   cTXT0001300 = 'Cannot display the calendar.';
   
   cTXT0001301 = 'Your user name is not associated with an employee record.';
   cTXT0001302 = 'Cannot edit CRM options.';
   cTXT0001303 = 'Unrecognized User.';
   cTXT0001304 = 'Cannot add or edit CRM activities.';
   cTXT0001305 = 'Accessing Schedule Coordinator.  Please wait...';
   cTXT0001306 = 'Each';
   cTXT0001307 = 'Sales Configuration Item';
   cTXT0001308 = 'Sales Choice Item';
   cTXT0001309 = 'Jump to Sales Configuration';
//   cTXT0001310 = 'Could not find the Sales Configuration. The original record may have been deleted.';
   cTXT0001311 = 'Select a Sales Choice Item - %s';
   cTXT0001312 = 'No Sales Configuration Templates have been created.';
   cTXT0001313 = 'Are the Requested Date and the Promised Date correct?';
   cTXT0001314 = 'Your Promised Date is set to today.  Is this correct?';
   cTXT0001315 = 'Remove all items from this quote?';
   cTXT0001316 = 'This action is irreversible.  Continue?';
   cTXT0001317 = 'Manage service contracts and warranties.';
   cTXT0001318 = 'Scanning activities...';
   cTXT0001319 = 'Initializing notifications...';
//   cTXT0001320 = 'That Sales Configuration Template has already been added.';
   cTXT0001321 = 'Invalid serial number: %s';
   cTXT0001322 = 'New Service Contract';
   cTXT0001323 = 'Enter a new serial number';
   cTXT0001324 = 'Clear link?';
   cTXT0001325 = 'Accessing Service Central.  Please wait...';
   cTXT0001326 = 'Clone Template';
   cTXT0001327 = 'Enter a new description';
   cTXT0001328 = 'Cloning Template.  Please wait...';
   cTXT0001329 = 'Sales Configuration Templates';
   cTXT0001330 = 'Cannot delete.  This customer is referenced by a Sales Quotation.';
   cTXT0001331 = 'Creating Sales Order.  Please wait...';
   cTXT0001332 = 'Clear Inventory Item?';
   cTXT0001333 = '%d of %d';
   cTXT0001334 = 'Users';
   cTXT0001335 = 'Count';
   cTXT0001336 = 'Importing temporary data...';
   cTXT0001337 = 'Application Error: Temporary table could not be created.';
//   cTXT0001338 = 'Application Error: Cannot retrieve table names.';
   cTXT0001339 = '%d items found.';
   cTXT0001340 = 'Clear list?';
   cTXT0001341 = 'Track products from the design and quoting process, ' +
    'through production, to the end of the life of the product.';
   cTXT0001342 = 'Save as a Support Issue?';
//   cTXT0001343 = 'Archive this Sales Quotation?';
//   cTXT0001344 = 'Convert this CRM Prospect to a standard Customer?';
//   cTXT0001345 = 'Archive Sales Quotation';
//   cTXT0001346 = 'Convert CRM Prospect';
   cTXT0001347 = 'Do you want to view the new Service Contract?';
   cTXT0001348 = 'Accessing database.  Please wait.';
   cTXT0001349 = 'Support Issue %.0f';
//   cTXT0001350 = 'Mass Mailing is restricted to DBA users.';
   cTXT0001351 = 'Customer Relationship Management [%s, %s, %s (%s)]';
   cTXT0001352 = 'Opportunity Central';
   cTXT0001353 = 'Cannot find record.';
   cTXT0001354 = 'The contact is already in the list.';
   cTXT0001355 = 'The Serial Number you entered is already used.';
   cTXT0001356 = 'Closing CRM Support.  Please wait.';

   cTXT0001357 = 'Summary';
   cTXT0001358 = 'Created By';
   cTXT0001359 = 'Assigned To';
   cTXT0001360 = 'Start Date';
   cTXT0001361 = 'Finish Date';
   cTXT0001362 = 'Closed By';
   cTXT0001363 = 'Days Elapsed';
   cTXT0001364 = 'Principal';
   cTXT0001365 = 'Queue'; // support queue
//   cTXT0001366 = 'Caller';

   cTXT0001367 = 'Subqueue';
   cTXT0001368 = 'Support Issue #';
   cTXT0001369 = 'Added By';
   cTXT0001370 = 'Activity Link';
   cTXT0001371 = 'Status';
   cTXT0001372 = 'Open';
   cTXT0001373 = 'Closed';
   cTXT0001374 = 'Caller';
   cTXT0001375 = 'Contact Method';
   cTXT0001376 = 'Incoming/Outgoing';
   cTXT0001377 = 'Increment the year value for all holidays?';
   cTXT0001378 = 'Increment the year value for the current holiday?';
   cTXT0001379 = 'Please enter a start date.';
//   cTXT0001380 = 'Please enter a end date.';
   cTXT0001381 = 'The End Date preceeds the Start Date.  Please check your dates.';
   cTXT0001382 = 'The Start and End Dates are equal.  The system will increment your End Date by one day so that it displays on the CRM Calendar.';
//   cTXT0001383 = 'CRM must close all open forms to apply the Eplant filter.  Continue?';
   cTXT0001384 = 'Attempted to display notification.';
   cTXT0001385 = 'Record already opened by another user: %s';
//   cTXT0001386 = 'Forecast';
   cTXT0001387 = 'Create, modify and analyze sales trends.  From Forecasting ' +
                 'you have access to current orders, past shipments and forecasted ' +
                 'quantities for all manufactured items.';
   cTXT0001388 = 'Cannot find selected Service Contract.';
   cTXT0001389 = 'Cannot find selected Registered Customer.'; 
   cTXT0001390 = '%s %s has been assigned to you by %s'; 
   cTXT0001391 = 'Building summary.  Please wait...';
//   cTXT0001392 = 'Could not send email.';
   cTXT0001393 = 'Either CRM could not connect to Microsoft Outlook, or errors were encountered during send.';
   cTXT0001394 = 'The tree menu has been customized to hide some of the items.  '#13#13 +
                 'To show additional tree nodes, right-click to display the popup menu.  ' +
                 'Then either choose "Customize" or click "Reset All to Default."';
   cTXT0001395 = 'This record is currently opened by user, %s.';
   cTXT0001396 = 'Error deleting subitems.';
   cTXT0001397 = 'Error checking existance of keyword.';
   cTXT0001398 = '(View Event)';
   cTXT0001399 = '(View Summary)';
   cTXT0001400 = 'Record not found.  Cannot display Support Summary.';
   cTXT0001401 = 'This record is currently opened by user, %s.'#13#13 +
                 'To view a summary of the Support Issue, click the View Summary link.';
   cTXT0001402 = 'Campaign Management';
   cTXT0001403 = 'Sending email alert ...';
   cTXT0001404 = 'The Eplant will be changed to match the Shipping Address for this item.';
   cTXT0001405 = 'Eplant:';
   cTXT0001406 = 'Class:';
   cTXT0001407 = 'Revision:';
   cTXT0001408 = 'Unassigned'; // no parentheses
   cTXT0001409 = '(%d days)';
   cTXT0001410 = '(%d+ days)';
   cTXT0001411 = 'Cannot delete.  This type is referenced by another record.';
   cTXT0001412 = 'Service Labor';
   cTXT0001413 = 'Update the linked Sales Order release?';
   cTXT0001414 = 'There are no all-day events listed for %s.'; 
   cTXT0001415 = 'All-Day Events (%s)';
   cTXT0001416 = 'Default choice cannot be marked inactive';
   cTXT0001417 = 'The clone operation did not complete successfully.';
   cTXT0001418 = 'Accessing Email Correspondance.  Please wait.';
   cTXT0001419 = 'Body Text';
   cTXT0001420 = '0 minutes before start';
   cTXT0001421 = '5 minutes';
   cTXT0001422 = '10 minutes';
   cTXT0001423 = '15 minutes';
   cTXT0001424 = '30 minutes';
   cTXT0001425 = '1 hour';
   cTXT0001426 = '2 hours';
   cTXT0001427 = '4 hours';
   cTXT0001428 = '8 hours';
   cTXT0001429 = '0.5 days';
   cTXT0001430 = '1 day';
   cTXT0001431 = '2 days';
   cTXT0001432 = '3 days';
   cTXT0001433 = '4 days';
   cTXT0001434 = '1 week';
   cTXT0001435 = '2 weeks';
   cTXT0001436 = '5 minutes before start';
   cTXT0001437 = 'Others Involved:';
   cTXT0001438 = 'Location: %s'; 
   cTXT0001439 = 'No items are visible in this view.  Customize the tree view items to show or hide icons.';
   cTXT0001440 = 'No items are visible in this view because of security restrictions.';
   cTXT0001441 = 'No items are visible in this view either because of security restrictions ' +
    'or customization.  You can customize the tree view items to show or hide icons.';
   cTXT0001442 = 'No items are visible in this view either because of security restrictions ' +
    'or no Answer Books have been created.';
   cTXT0001443 = '"%s" is a recurring item.  Do you want to open only this occurrence or the series?'; 
   cTXT0001444 = 'Delete this item?  Deleting this item will also delete ' +
    'recurrences.  This is a permanent and irreversible action.';
   cTXT0001445 = 'Remove all recurrent items?';
   cTXT0001446 = 'Please enter a value for day.';
   cTXT0001447 = 'Please enter a value for month.';
   cTXT0001448 = 'Please enter a value for occurrance.'; 
   cTXT0001449 = 'Recurrence settings have been applied.'; 
   cTXT0001450 = 'and'; 
   cTXT0001451 = 'Occurs every %d days(s)';
   cTXT0001452 = 'Occurs every weekday';
   cTXT0001453 = 'Occurs every %d week(s) on';
   cTXT0001454 = 'Occurs day %s of every %d month(s)';
   cTXT0001455 = 'Occurs the %s %s of every %d month(s)';
   cTXT0001456 = 'first';
   cTXT0001457 = 'second';
   cTXT0001458 = 'third';
   cTXT0001459 = 'fourth';
   cTXT0001460 = 'last';
   cTXT0001461 = 'day';
   cTXT0001462 = 'weekday';
   cTXT0001463 = 'weekend day';
   cTXT0001464 = 'Sunday';
   cTXT0001465 = 'Monday';
   cTXT0001466 = 'Tuesday';
   cTXT0001467 = 'Wednesday';
   cTXT0001468 = 'Thursday';
   cTXT0001469 = 'Friday';
   cTXT0001470 = 'Saturday';
   cTXT0001471 = 'Occurs every %s %d';
   cTXT0001472 = 'Occurs the %s %s of %s'; 
   cTXT0001473 = 'effective %s until %s from %s to %s.';
   cTXT0001474 = 'effective %s until %s';
   cTXT0001475 = 'effective %s until %s from %s for %d day(s).';
   cTXT0001476 = 'weeks';
   cTXT0001477 = 'days';
   cTXT0001478 = 'hours';
   cTXT0001479 = 'minutes'; 
   cTXT0001480 = 'day';
   cTXT0001481 = 'week day';
   cTXT0001482 = 'weekend day';
   cTXT0001483 = 'The recurrence pattern is invalid.';
   cTXT0001484 = 'Some months have fewer than %s days.  For these months, ' +
     'the occurrence will fall on the last day of the month.';
   cTXT0001485 = 'The recurrence start date must be greater than or equal to today.';
   cTXT0001486 = 'The recurrence scheme has changed.  To preserve history, ' +
    'activities before %s will not be changed.  Continue?';
   cTXT0001487 = 'Recurrent items scheduled after %s will be updated to match your changes.  Continue?';
   cTXT0001488 = 'Recurrent items will be removed.  Continue?';
   cTXT0001489 = 'The CAR/CAPA record you selected (%s) is different from the CAR/CAPA record currently ' +
    'linked to the RMA (%s).  Do you want to change the link?';
   cTXT0001490 = 'CAR History';
   cTXT0001491 = 'CAPA History';
   cTXT0001492 = 'CAR History (Unavailable)';
   cTXT0001493 = 'Select CAR';
   cTXT0001494 = 'Select CAPA';
   cTXT0001495 = 'Jump to CAR';
   cTXT0001496 = 'Jump to CAPA'; 
   cTXT0001497 = 'There is no link.  History unavailable.';
   cTXT0001498 = 'Remove link?  This action is irreversible.'; 
   cTXT0001499 = 'Occurs all day for %d days(s).';
   cTXT0001500 = 'The duration of the activity must be shorter than how ' +
    'frequently it occurs.  Shorten the duration, or change the recurrence pattern.';
   cTXT0001501 = 'The recurrence must end either on today or in some future date.  ' +
    'Please specify a valid end date.';
   cTXT0001502 = 'Caller ID is inactive. The TAPI/IP protocol, %s, could not be found.  Please select a driver in CRM Parameters.'; 
   cTXT0001503 = 'There was a problem setting your TAPI/IP driver.  Caller ID is inactive.';
   cTXT0001504 = 'Blocked'; // Caller ID
   cTXT0001505 = 'Out of area'; // Caller ID
   cTXT0001506 = 'Your telephony settings have changed.  CRM must be restarted for your changes to take effect.';
   cTXT0001507 = 'Close CRM Call Center?';
   cTXT0001508 = 'CRM Call Center';
   cTXT0001509 = 'Caller Unknown'; 
   cTXT0001510 = 'Save current call to history?'; 
   cTXT0001511 = 'Regarding (New Result)'; 
   cTXT0001512 = 'Which Principal do you want to assign?'; 
   cTXT0001513 = 'The contact you entered already exists for this vendor.';
   cTXT0001514 = 'Vendor Alert';
   cTXT0001515 = 'Vendor Contact Alert';
   cTXT0001516 = 'The customer you selected is inactive.  Continue?';
   cTXT0001517 = 'Record ID: %.0f';
   cTXT0001518 = 'This Customer is Inactive.';
   cTXT0001519 = 'Confirm';
   cTXT0001520 = 'The following customers cannot be deleted after the merge because they have references.  ' +
                 'Do you want to continue with the merge?';
   cTXT0001521 = 'Checking references to %s.';
   cTXT0001522 = 'The company you are trying to add is the same as your primary customer:';
   cTXT0001523 = 'The company you are trying to add is the same as your primary customer:';
   cTXT0001524 = 'Please select a primary customer first, before making a list of duplicates.';
   cTXT0001525 = 'Clear the list of duplicate customers?';
   cTXT0001526 = 'Please add customers to the list of duplicates.';
   cTXT0001527 = 'Merge records?';
   cTXT0001528 = 'Merge';
   cTXT0001529 = 'Merging customer records:';
   cTXT0001530 = 'Merging record %d of %d';
   cTXT0001531 = 'Process aborted'; 
   cTXT0001532 = 'Abort operation?';
   cTXT0001533 = 'Reassign';
   cTXT0001534 = 'Reassigning CRM records ...';
   cTXT0001535 = 'Please select the current (original) user.';
   cTXT0001536 = 'Please select the new (target) user.';
   cTXT0001537 = 'Please select at least one option.'; 
   cTXT0001538 = 'Reassigning Sales Quotations ...';
   cTXT0001539 = 'Process complete. Reassigned %d records:'#13 +
                 '  %d Call(s)'#13 +
                 '  %d Task(s)'#13 +
                 '  %d Meeting(s)'#13 +
                 '  %d Note(s)'#13 +
                 '  %d Support Issue(s)'#13 +
                 '  %d Sales Quotation(s)';
   cTXT0001540 = 'Reassign the selected record types now?'; 
   cTXT0001541 = 'Modify commissions on all detail items?';
   cTXT0001542 = 'There are no activities linked to this customer.';
   cTXT0001543 = 'There are no activities linked to this vendor.';
   cTXT0001544 = 'There are no activities linked to this partner.';
   cTXT0001545 = 'There are no activities to display for this filter.';
   cTXT0001546 = 'There are no activities linked to this service.'; 
   cTXT0001547 = 'Capable to Promise'; 
   cTXT0001548 = 'That is all the information required to create the mail merge document.  ' +
    'Click Finish to complete the process.';
   cTXT0001549 = 'There are errors.  Please see the red items listed in the summary.';
   cTXT0001550 = 'Pending';
   cTXT0001551 = 'Accepted';
   cTXT0001552 = 'Declined'; 
   cTXT0001553 = 'You have been requested by %s to attend a meeting, starting at %s and ending %s on %s.';
   cTXT0001554 = 'To accept or reject the request, log into CRM.  ' +
    'If you are not automatically prompted to respond to the request, ' +
    'select Reminders, Pending Activity Requests.';
   cTXT0001555 = 'Requested By: %s';
   cTXT0001556 = 'A Meeting Request has been issued.'; 
   cTXT0001557 = 'No email addresses were selected.  Do you still want to create an email?';
   cTXT0001558 = 'Tentative'; 
   cTXT0001559 = 'Regarding:  ';
   cTXT0001560 = 'Meeting Request - %s'; 
   cTXT0001561 = '%s has responded to your meeting request for %s.';
   cTXT0001562 = 'Response:  %s';
   cTXT0001563 = 'Meeting Response - %s';
   cTXT0001564 = 'You have chosen to decline this meeting request.  ' +
    'An email response will be sent automatically to %s.  If you would like to include a ' +
    'comment with the email response, please enter it below.';
   cTXT0001565 = 'Comment:';
   cTXT0001566 = 'Do you want to open the restored Sales Quotation now?';
   cTXT0001567 = 'Please enter a value for weekly recurrence.';
   cTXT0001568 = 'Please select days for weekly recurrence.'; 
   cTXT0001569 = 'Do you want to change the response status for user, %s?';
   cTXT0001570 = 'Do you want to change the response status for the selected user?';
   cTXT0001571 = 'Do you want to clear the response status for user, %s?';
   cTXT0001572 = 'Do you want to clear the response status for the selected user?'; 
   cTXT0001573 = 'Delete record?  This action will permanently delete the selected campaign.';
   cTXT0001574 = 'Archived Campaign'; 
   cTXT0001575 = 'Restore selected Campaign?';
   cTXT0001576 = 'Pager:';
   cTXT0001577 = 'Cell Telephone:';
   cTXT0001578 = 'Cannot find file, %s.'; 
   cTXT0001579 = 'CRM Merge Record not found.'; 
   cTXT0001580 = 'Accessing CRM Mail Merge.  Please wait.'; 
   cTXT0001581 = 'Mail merge record has not been completely set up.  Please run the CRM ' +
       'mail merge wizard for this merge record.';
   cTXT0001582 = 'Cannot find the data file, %s.  Operation aborted.'; 
   cTXT0001583 = 'Archive current campaign?'; 
   cTXT0001584 = '%s, Ext. %s';
   cTXT0001585 = 'DCOM has not been enabled on this machine.  Do you want ' +
            'to enable DCOM?  If you answer Yes, you will need to reboot your ' +
            'computer for the setting to apply.  If you choose No, you will ' +
            'encounter errors attempting to open mail merge documents.';
   cTXT0001586 = 'Please close all applications and reboot for the setting to take effect.';
   cTXT0001587 = 'Cannot delete.  This Opportunity is referenced by one or ' +
    'more activity records.';
   cTXT0001588 = 'Customer is required.';
   cTXT0001589 = 'Meeting Request';
   cTXT0001590 = 'Whom do you want to receive a meeting request?';
   cTXT0001591 = 'All employees listed';
   cTXT0001592 = 'Selected employees only';
   cTXT0001593 = 'Send a meeting request to all listed employees?';
   cTXT0001594 = 'Encountered error attempting to send the request email:';
   cTXT0001595 = 'You have been requested by %s to participate in a call, starting at %s and ending %s on %s';
   cTXT0001596 = 'You have been requested by %s to attend a task, starting at %s and ending %s on %s';
   cTXT0001597 = 'Call Request - %s';
   cTXT0001598 = 'Task Request - %s';
   cTXT0001599 = 'Call Request';
   cTXT0001600 = 'Task Request';
   cTXT0001601 = 'Whom do you want to receive a call request?';
   cTXT0001602 = 'Whom do you want to receive a task request?';
   cTXT0001603 = 'Send a call request to all listed employees?';
   cTXT0001604 = 'Send a task request to all listed employees?';
   cTXT0001605 = 'Send call request';
   cTXT0001606 = 'Send task request';
   cTXT0001607 = 'Send meeting request';
   cTXT0001608 = 'A Call Request has been issued.';
   cTXT0001609 = 'A Task Request has been issued.';
   cTXT0001610 = 'CAR #';
   cTXT0001611 = 'CAPA #';
   cTXT0001612 = 'CAR History - %s';
   cTXT0001613 = 'CAPA History - %s';
   cTXT0001614 = 'Select CAR';
   cTXT0001615 = 'Select CAPA';
   cTXT0001616 = 'You have not selected any recipients.  You must click the ' +
    'Add button to include a selected recipient in your list.  Do you want ' +
    'to close this form without adding recipients?';
   cTXT0001617 = '%s # is not assigned'#13 +
     'Either click or use the drop-down arrow to associate or create a new %s';
   cTXT0001618 = '%s #: %s'#13'Click to view or edit';
   cTXT0001619 = 'This item is associated with a %s ' +
                 'that is no longer available.'#13#13 +
                 'Use the Detach From drop-down option ' +
                 'to clear and then select new %s.';
   cTXT0001620 = 'Show CAR/CAPA history for this item';
   cTXT0001621 = 'Show CAR history for this item';
   cTXT0001622 = 'Show CAPA history for this item';
   cTXT0001623 = 'CAR';
   cTXT0001624 = 'CAPA';
   cTXT0001625 = 'CAR/CAPA';
   cTXT0001626 = 'Field type mismatch.  You must assign a text field.'; 
   cTXT0001627 = 'Microsoft Outlook';
   cTXT0001628 = 'IBM Lotus Notes';
   cTXT0001629 = 'Novell GroupWise';
   cTXT0001630 = 'Lotus Notes is either not installed or is in an invalid state.  This list is unavailable.'; 
   cTXT0001631 = 'Sales Configuration Option Alert'; 
   cTXT0001632 = 'Clear user alert?'; 
   cTXT0001633 = 'No choice items have been created for this option.';
   cTXT0001634 = 'The selected Choice item is referenced in the ' +
    'Dependencies.  Clear Dependencies of any reference to this Choice ' +
    'item before attempting to delete it.';
   cTXT0001635 = 'Clear link to Sales Quotation?';
   cTXT0001636 = 'Select from your personal Lotus Notes folders.';
   cTXT0001637 = 'Lotus Notes Calendar Appointments';
   cTXT0001638 = 'Lotus Notes Deleted Items';
   cTXT0001639 = 'Lotus Notes Drafts';
   cTXT0001640 = 'Lotus Notes Inbox';
   cTXT0001641 = 'Lotus Notes Personal Journal';
   cTXT0001642 = 'Lotus Notes Notes';
   cTXT0001643 = 'Lotus Notes Outbox';
   cTXT0001644 = 'Lotus Notes Sent Items';
   cTXT0001645 = 'Lotus Notes To Do Items';
   cTXT0001646 = 'Lotus Notes Contacts';
   cTXT0001647 = 'Personal Journal'; 
   cTXT0001648 = 'To Do'; 
   cTXT0001649 = 'My Lotus Notes Folders'; 
   cTXT0001650 = 'Select from your personal Lotus Notes folders.'; 
   cTXT0001651 = 'Trash'; 
   cTXT0001652 = 'Loading Lotus Notes Calendar items.  Please wait.'; 
   cTXT0001653 = 'Loading Lotus Notes Contacts.  Please wait.';
   cTXT0001654 = 'Loading Lotus Notes Deleted items.  Please wait.';
   cTXT0001655 = 'Loading Lotus Notes Draft items.  Please wait.'; 
   cTXT0001656 = 'Loading Lotus Notes Inbox items.  Please wait.'; 
   cTXT0001657 = 'Loading Lotus Notes Journal items.  Please wait.';
   cTXT0001658 = 'Loading Lotus Notes Sent items.  Please wait.';
   cTXT0001659 = 'Loading Lotus Notes To Do items.  Please wait.';
   cTXT0001660 = 'Microsoft Outlook Inbox';
   cTXT0001661 = 'Lotus Notes Inbox';
   cTXT0001662 = 'Clear link to Opportunity?'; 
   cTXT0001663 = 'Click to show inactives.';
   cTXT0001664 = 'Click to hide inactives.';
   cTXT0001665 = 'The body text has not been entered.  ' +
      'Please enter body text for this mailing.';
   cTXT0001666 = 'Select MRB';
   cTXT0001667 = 'The MRB record you selected (%s) is different from the MRB record currently ' +
      'linked to the RMA (%s).  Do you want to change the link?';
   cTXT0001668 = 'A list of Vendor contacts for quick access to contact information.'; 
   cTXT0001669 = 'Opportunity Central provides a workspace for tracking, ' +
    'managing and discussing all facets of a marketing opportunity.';
   cTXT0001670 = 'Remove contacts that have been excluded from Emailings?';
   cTXT0001671 = 'Removing excluded contacts.  Please wait.'; 
   cTXT0001672 = 'Showing only contacts that are excluded from Emailings.'#13'Click to toggle.';
   cTXT0001673 = 'Showing only contacts that are not excluded from Emailings.'#13'Click to toggle.';
   cTXT0001674 = 'By Customers';
   cTXT0001675 = 'By Vendors';
   cTXT0001676 = 'By Partners';
   cTXT0001677 = 'By Employees';
   cTXT0001678 = 'By Category';
   cTXT0001679 = 'To view the results of this setting, click the Apply button.'; 
   cTXT0001680 = 'Create RMA for the all items?';
   cTXT0001681 = 'Create RMA for the current item?';
   cTXT0001682 = 'Unable to locate Sales Quotation ID = %.0f';
   cTXT0001683 = 'Unable to locate Sales Quotation Detail ID = %.0f';
   cTXT0001684 = 'Updating Sales Order.  Please wait...';
   cTXT0001685 = 'Clear tier type?'; 
   cTXT0001686 = 'Clear Sales option choice?';
   cTXT0001687 = 'Customer Tiers';
   cTXT0001688 = 'Tier Type';
   cTXT0001689 = 'Errors (%d)';
   cTXT0001690 = 'Master Records Skipped (%d)';
   cTXT0001691 = 'Child Records Skipped (%d)';
   cTXT0001692 = '%d source records processed.';
   cTXT0001693 = 'Encountered %d error(s).'; 
   cTXT0001694 = '%d master record(s) and %d child record(s) were successfully imported.'; 
   cTXT0001695 = '%d master record(s) and %d child record(s) could not be imported.';
   cTXT0001696 = 'Do you want to import %d record(s)?'; 
   cTXT0001697 = 'No records were imported.  The import operation will be aborted.';
   cTXT0001698 = 'Any File (*.*)|*.*|%s Files (*%s)|*%s'; 
   cTXT0001699 = 'Verification Date'; 
   cTXT0001700 = 'Sales Order references to this campaign will be cleared.  Do you want to continue?'; 
   cTXT0001701 = 'This Service Contract is referenced by other records:'#13#13 +
    '%s'#13#13'Cannot delete.';
   cTXT0001702 = 'The Assigned To user is different from the CRM Context ' +
    'filter.  Do you want to change the Assigned To filter?';
   cTXT0001703 = 'Since this record is assigned to %s, it will no longer be ' +
    'visible under the CRM Context filter.  Do you want to continue?';
   cTXT0001704 = 'Customer record not provided.  Cannot add contact.';
   cTXT0001705 = 'Total Configuration Price'; 
   cTXT0001706 = 'How Many';
   cTXT0001707 = 'Enter the number to clone';
   cTXT0001708 = 'Invalid number.  Operation aborted';
   cTXT0001709 = 'A Resolution Event has not been entered.  Close support issue anyway?';
   cTXT0001710 = 'Contact Address:';
   cTXT0001711 = 'Open';
   cTXT0001712 = 'Call # %d';
   cTXT0001713 = 'Task # %d';
   cTXT0001714 = 'Meeting # %d';
   cTXT0001715 = 'Note # %d';
   cTXT0001716 = 'Support Issue # %d';
   cTXT0001717 = 'Sales Quotation # %d';
   cTXT0001718 = '(No Principal Assigned)';
   cTXT0001719 = 'Exclude from Emailings';
   cTXT0001720 = 'Cannot delete.  This Sales Configuration is currently referenced on a Sales Quotation.';
   cTXT0001721 = 'Please select a Sales Option.';
   cTXT0001722 = 'To select a tier type, the option "Discount choices" must be selected (True).';
   cTXT0001723 = 'Cannot delete Support Queue.  It is referenced by one or more Support Issues.';
   cTXT0001724 = 'Search Contacts for %s';
   cTXT0001725 = 'Search Customer Contacts';
   cTXT0001726 = 'MassMailerLog.txt';
   cTXT0001727 = 'This Campaign has references and cannot be deleted.  Do you want to archive it instead?';
   cTXT0001728 = 'This Campaign has references and cannot be deleted.';
   cTXT0001729 = 'Scanning activity types ...';
   cTXT0001730 = 'None';
   cTXT0001731 = 'Encountered an error attempting to access Outlook items:';
   cTXT0001732 = 'Encountered an error attempting to list ' +
     'items in the selected Outlook folder:';
   cTXT0001733 = 'CRM Call Center [User Name: %s]';
   cTXT0001734 = 'Some of the group members do not have email addresses.';
   cTXT0001735 = 'Email Exception:  %s %s';
   cTXT0001736 = 'Email Correspondence %s';
   cTXT0001737 = 'User-Defined Form';
   cTXT0001738 = 'Lotus Notes Contacts';
   cTXT0001739 = 'Customers';
   cTXT0001740 = 'Contacts';
   cTXT0001741 = 'Partners';
   cTXT0001742 = 'Partner Contacts';
   cTXT0001743 = 'Vendors';
   cTXT0001744 = 'Vendor Contacts';
   cTXT0001745 = 'Customer Calls';
   cTXT0001746 = 'Customer Tasks';
   cTXT0001747 = 'Customer Meetings';
   cTXT0001748 = 'Customer Notes';
   cTXT0001749 = 'Partner Calls';
   cTXT0001750 = 'Partner Tasks';
   cTXT0001751 = 'Partner Meetings';
   cTXT0001752 = 'Partner Notes';
   cTXT0001753 = 'Vendor Calls';
   cTXT0001754 = 'Vendor Tasks';
   cTXT0001755 = 'Vendor Meetings';
   cTXT0001756 = 'Vendor Notes';
   cTXT0001757 = 'Employee Calls';
   cTXT0001758 = 'Employee Tasks';
   cTXT0001759 = 'Employee Meetings';
   cTXT0001760 = 'Employee Notes';
   cTXT0001761 = 'Unique number';
   cTXT0001762 = 'Field text (such as Company name) plus a unique number';
   cTXT0001763 = 'Preceding characters from a field (such as Company name)';
   cTXT0001764 = 'Prefix plus a unique number';
   cTXT0001765 = 'Encountered error attempting to verify a unique company number.';
   cTXT0001766 = 'Please verify that fields were correctly mapped.';
   cTXT0001767 = 'Field type mismatch.';
   cTXT0001768 = 'The target dataset has no data to import.';
   cTXT0001769 = 'The source data length may be too long for the target ' +
     'field.  The fields will be matched, but data may be truncated.';
   cTXT0001770 = 'Could not open intermediate dataset.';
   cTXT0001771 = 'Cannot connect to database, %s';
   cTXT0001772 = 'Building query ...';
   cTXT0001773 = 'Building field list ...';
   cTXT0001774 = 'Preparing to export ...';
   cTXT0001775 = 'Field type mismatch.  You must assign a numeric field.';
   cTXT0001776 = 'No Opportunities have been created for this customer.';
   cTXT0001777 = 'No Opportunities have been created for this vendor.';
   cTXT0001778 = 'No Opportunities have been created for this partner.';
   cTXT0001779 = 'No Opportunities have been created.';
   cTXT0001780 = 'Processing.  Please wait.';
   cTXT0001781 = '%d master record(s) could not be imported.';
   cTXT0001782 = '%d child record(s) could not be imported.';
   cTXT0001783 = '%d record(s) were successfully imported.';
   cTXT0001784 = 'Jump to Call';
   cTXT0001785 = 'Jump to Task';
   cTXT0001786 = 'Jump to Meeting';
   cTXT0001787 = 'Jump to Note';
   cTXT0001788 = 'Jump to Support Issue';
   cTXT0001789 = 'Accessing Sales Configuration Templates.  Please wait...';
   cTXT0001790 = 'Inventory has not been allocated. Please allocate ' +
    'inventory from sales order.';
   cTXT0001791 = 'Error adding Sales Configuration items.';
   cTXT0001792 = 'Work Order # %.0f is in Assembly Track.  Cannot update ' +
    'the Workorder/BOM.  Operation aborted.';
   cTXT0001793 = 'Search Partner Contacts';
   cTXT0001794 = 'Search Vendor Contacts';
   cTXT0001795 = 'Could not connect to Microsoft Outlook:';
   cTXT0001796 = 'Contact Is Inactive?';
   cTXT0001797 = 'Delete (%d) records?';
   cTXT0001798 = 'To view records in CRM, the following fields ' +
     'should be mapped:'#13'STARTDATE'#13'FINISHDATE'#13'ASSIGNEDTO'#13#13 +
     'Do you wish to continue?';
   cTXT0001799 = 'Quantity is required.';
   cTXT0001800 = 'This action will affect multiple vendors.'#13#13 +
    'Are you sure you want to continue?';
   cTXT0001801 = '<No Vendor Selected>';
   cTXT0001802 = 'Multiple Customers Selected';
   cTXT0001803 = 'Add all of Master Inventory to this vendor''s AKA ' +
    'list?'#13#13 + 'This could take a few minutes.';
   cTXT0001804 = 'All selected Inventory items will be applied to all ' +
    'selected vendors.'#13#13 + 'Do you want to continue?';
   cTXT0001805 = 'Add all vendors to the list?'#13#13'This could ' +
    'take a few minutes.';
   cTXT0001806 = 'Remove all vendors from the list?';
   cTXT0001807 = 'CRM Assignment Change [%s][%s %s]';
   cTXT0001808 = 'Please enter room name.';
   cTXT0001809 = 'This room has been scheduled.  Removing it will also ' +
    'remove it from the schedule.  Do you want to continue?';
   cTXT0001810 = 'A room has been scheduled, but the activity dates have ' +
    'changed.  Do you want to continue?';
   cTXT0001811 = 'Clear room assignment?';
   cTXT0001812 = 'Customer Contacts [%s]';
   cTXT0001813 = 'The body text contains HTML tags, but the email format ' +
    'has been set to Plain Text.  Do you want to continue?';
   cTXT0001814 = 'Tier Type: ';
   cTXT0001815 = 'The specified commission percentage (%.6f%%) ' +
    'does not equal the total commissions in %s';
   cTXT0001816 = 'Mass Mailings are configured to be tracked.  In order to ' +
    'be tracked, the message format must be set to HTML and the body text ' +
    'must contain valid HTML tags.  Do you want to continue?';
   cTXT0001817 = 'Cannot change dates because of a room scheduling conflict.';
   cTXT0001818 = 'Campaign code %s is already in use.  Please enter a unique campaign code.';
   cTXT0001819 = 'Pending';
   cTXT0001820 = 'Sent';
   cTXT0001821 = 'Has Errors';
   cTXT0001822 = 'Error Text';
   cTXT0001823 = 'Resume mass mailing?  The mailing will resume, and send to ' +
    'pending recipients.';
   cTXT0001824 = 'Operation failed.';
   cTXT0001825 = 'Create a new mass mailing and send to pending recipients?  ' +
     'A new mailing will be created containing only pending recipients form this mailing.';
   cTXT0001826 = 'Building recipient list.  Please wait...';
   cTXT0001827 = 'Principal Contact:  %s';
   cTXT0001828 = 'Created By:  %s';
   cTXT0001829 = 'Assigned To:  %s (%s)';
   cTXT0001830 = 'Start Date:  %s';
   cTXT0001831 = 'Finish Date:  %s';
   cTXT0001832 = 'All-day:  %s';
   cTXT0001833 = 'Principal:  %s';
   cTXT0001834 = 'Regarding:  %s';
   cTXT0001835 = 'Closed By:  %s';
   cTXT0001836 = 'Time Elapsed:  %d';
   cTXT0001837 = 'Queue:  %s';
   cTXT0001838 = 'Subqueue:  %s';
   cTXT0001839 = 'Summary:  %s';
   cTXT0001840 = 'Created in %s[Page=%s]';
   cTXT0001841 = 'Created in %s';
   cTXT0001842 = 'Displaying %d out of %d records.  Please refine your ' +
     'search criteria to narrow your results.';
   cTXT0001843 = 'Remove from selected CRM Group?';
   cTXT0001844 = 'No production information is available for this serial ' +
    'number.';
   cTXT0001845 = 'Done.  This mailing has been added to the IQAlert queue.';
   cTXT0001846 = '0 Minutes';
   cTXT0001847 = '5 Minutes';
   cTXT0001848 = '10 Minutes';
   cTXT0001849 = '15 Minutes';
   cTXT0001850 = '30 Minutes';
   cTXT0001851 = '1 Hour';
   cTXT0001852 = '2 Hours';
   cTXT0001853 = '3 Hours';
   cTXT0001854 = '4 Hours';
   cTXT0001855 = '5 Hours';
   cTXT0001856 = '6 Hours';
   cTXT0001857 = '7 Hours';
   cTXT0001858 = '8 Hours';
   cTXT0001859 = '9 Hours';
   cTXT0001860 = '10 Hours';
   cTXT0001861 = '11 Hours';
   cTXT0001862 = '0.5 Days';
   cTXT0001863 = '18 Hours';
   cTXT0001864 = '1 Day';
   cTXT0001865 = '2 Days';
   cTXT0001866 = '3 Days';
   cTXT0001867 = '4 Days';
   cTXT0001868 = '1 Week';
   cTXT0001869 = '2 Weeks';
   cTXT0001870 = 'Attempt to resend failed emails?';
   cTXT0001871 = 'CRM Opportunity';
   cTXT0001872 = 'Delete Sales Stage?';
   cTXT0001873 = 'Please enter a value for Code.';
   cTXT0001874 = 'Please enter a value for Access Level.';
   cTXT0001875 = '%s "%s"';
   cTXT0001876 = 'Sales Stage set to %s (Level %d)';
   cTXT0001877 = 'Sales Stage changed from %s (Level %d) to %s (Level %d)';
   cTXT0001878 = 'Access denied.  Cannot modify Sales Stage level.';
   cTXT0001879 = 'Sales Stage Change Note';
   cTXT0001880 = 'Sales Stage Change Note:  %s';
   cTXT0001881 = 'Sales Stage Change Note [%s]';
   cTXT0001882 = 'Select from Closed Sales Stage Change Notes';
   cTXT0001883 = 'Select from Open SSales Stage Change Notes';
   cTXT0001884 = 'Select from All Sales Stage Change Notes';
   cTXT0001885 = 'Sales Stage Change Note %d';
   cTXT0001886 = 'Code:';
   cTXT0001887 = 'Description:';
   cTXT0001888 = 'Access Level:';
   cTXT0001889 = 'Cannot delete.  This Opportunity is referenced by a ' +
     'customer record.';
   cTXT0001890 = 'Import leads and activity from your automated, inbound ' +
     'marketing provider.';
   cTXT0001891 = 'Clear resolution type?';
   cTXT0001892 = 'A Resolution Type has not been entered.  Close support issue anyway?';
   cTXT0001893 = 'Save As Text File';
   cTXT0001894 = 'Text Files (*.txt)|*.txt';
   cTXT0001895 = 'Save As Document';
   cTXT0001896 = 'Documents (*.doc)|*.doc';
   cTXT0001897 = 'Save As Web Page';
   cTXT0001898 = 'Web Documents (*.htm; *.html)|*.htm; *.html';
   cTXT0001899 = 'Close or Delete';
   cTXT0001900 = 'Would you like to close or delete the selected CRM ' +
     'Support Issues?';
   cTXT0001901 = 'Close';
   cTXT0001902 = 'Delete';
   cTXT0001903 = 'Support issue Assigned To was changed from %s (%s) to %s (%s).';
   cTXT0001904 = 'Support issue was closed by %s (%s)';
   cTXT0001905 = 'Support issue was reopened by %s (%s)';
   cTXT0001906 = 'RFQ #: %s'#13'Description: %s'#13'Date: %s';
   cTXT0001907 = 'None';
   cTXT0001908 = 'Please assign a location.';
   cTXT0001909 = 'Ship-In-Full CTP includes ship time of %s day(s)';
   cTXT0001910 = 'Would you like to calculate CTP?';
   cTXT0001911 = 'Please assign the Ship-In-Full CTP date.';
   cTXT0001912 = 'Assign all promise dates Ship In Full CTP date?';
   cTXT0001913 = 'Sales Margin %';
   cTXT0001914 = '%s must be between %.6f and %.6f';
   cTXT0001915 = 'Please enter a value';
   cTXT0001916 = 'Not all values have been entered.  Are you sure you want to exit?';
   cTXT0001917 = 'The mass mailing is now processing.  You may continue ' +
     'working while this operation runs.  This screen will now close.';
   cTXT0001918 = 'Preparing mass mailing.  Please wait...';
   cTXT0001919 = 'The mass mailing will be scheduled by IQAlert. This screen will now close.';
   cTXT0001920 = 'The job has not started yet.  No action was taken.';
   cTXT0001921 = 'Stop the mass mailing?';
   cTXT0001922 = 'File data could not be updated.';
   cTXT0001923 = 'File data was successfully updated.';
   cTXT0001924 = 'This action will update record data used internally when ' +
     'sending mass mailings.  If file contents have changed, updating the ' +
     'file data is recommended.  Do you want to continue?';

   cTXT0001925 = 'The body text contains merge tags for Campaign, but no ' +
    'campaign has been selected.  Some tags will not be merged.  Do you ' +
    'want to continue?';
   cTXT0001926 = 'First Name';
   cTXT0001927 = 'Last Name';
   cTXT0001928 = 'Full Name';
   cTXT0001929 = 'Email';
   cTXT0001930 = 'Company';
   cTXT0001931 = 'Telephone';
   cTXT0001932 = 'Full Address';
   // cTXT0001933 = '';
   cTXT0001934 = 'Address Line 1';
   cTXT0001935 = 'City';
   cTXT0001936 = 'State or Region';
   cTXT0001937 = 'Postal Code';
   cTXT0001938 = 'Country';
   cTXT0001939 = 'Date (Short Date Format)';
   cTXT0001940 = 'Date (Long Date Format)';
   cTXT0001941 = 'Date (Year)';
   cTXT0001942 = 'Date (Month)';

   cTXT0001943 = 'Campaign Description';
   cTXT0001944 = 'Campaign Number';
   cTXT0001945 = 'Campaign Code';

   cTXT0001946 = 'Sales Stage';
   cTXT0001947 = 'History';
   cTXT0001948 = 'Choice Attribute High and Low ranges';
   cTXT0001949 = 'Markup Percentage';
   cTXT0001950 = 'Flat Markup Amount';
   cTXT0001951 = 'Invalid number';
   cTXT0001952 = 'Access denied.  Cannot add customer.';
   cTXT0001953 = 'One or more Sales Configuration items do not have ' +
     'Attribute values assigned.  Please assign Attribute values.';
   cTXT0001954 = 'Sales Option "%s" is of type, Primary Material, but ' +
     'MFG # %s cannot be assigned a primary material.';
   cTXT0001955 = 'Only one Sales Option of type, Primary Material, may be ' +
     'added to the template.';
   cTXT0001956 = 'Select Inventory Item';
   cTXT0001957 = 'Select Inventory Item [Primary Material]';
   cTXT0001958 = 'Select Inventory Item [Packaging]';
   cTXT0001959 = 'Only one inventory item may be added for Primary Material options.';
   cTXT0001960 = 'Encountered error adding operation or material to BOM:';
   cTXT0001961 = 'Importing.  Please wait...';
   cTXT0001962 = 'Updating.  Please wait...';
   cTXT0001963 = 'An RMA cannot be created for a prospect.  Operation aborted.';
   cTXT0001964 = 'Replace RMA reference with the selected RMA?';
   cTXT0001965 = 'Scheduled Start:  %s'#13 +
     'Scheduled Finish:  %s'#13 +
     'All Day:  %s';
   cTXT0001966 = 'You have already sent a meeting request to one or more participants. ' +
    'Sending another meeting request may overwrite your previous request.  Do you want to continue?';
   cTXT0001967 = 'Change the start date to %s?';
   cTXT0001968 = 'Please enter a code.';
   cTXT0001969 = 'Sales Orders could not be created for Sales ' +
     'Configuration templates flagged to generate a new BOM, but ' +
     'which have not been assigned a base Inventory item.';
   cTXT0001970 = 'Where Used - %s%s%s';
   cTXT0001971 = 'Clear all links to RMA?';
   cTXT0001972 = 'Clear link to RMA?';
//   cTXT0001973 = '';
//   cTXT0001974 = '';
//   cTXT0001975 = '';
//   cTXT0001976 = '';
//   cTXT0001977 = '';
//   cTXT0001978 = '';
//   cTXT0001979 = '';
//   cTXT0001980 = '';
//   cTXT0001981 = '';
//   cTXT0001982 = '';
//   cTXT0001983 = '';
//   cTXT0001984 = '';
//   cTXT0001985 = '';
//   cTXT0001986 = '';
//   cTXT0001987 = '';
//   cTXT0001988 = '';
//   cTXT0001989 = '';
//   cTXT0001990 = '';
//   cTXT0001991 = '';
//   cTXT0001992 = '';
//   cTXT0001993 = '';
//   cTXT0001994 = '';
//   cTXT0001995 = '';
//   cTXT0001996 = '';
//   cTXT0001997 = '';
//   cTXT0001998 = '';
//   cTXT0001999 = '';
//   cTXT0002000 = '';

   //  crm_rscstr.cTXT0001799


implementation

end.
