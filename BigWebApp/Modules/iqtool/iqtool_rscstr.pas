unit iqtool_rscstr;

interface

// iqtool_rscstr.cTXT0000001

resourcestring

   cTXT0000001 = 'Parent record not found';
   cTXT0000002 = 'Projects %s - %s : %s';
   cTXT0000003 = 'MISC';
   cTXT0000004 = 'New Task';
   cTXT0000005 = 'Error inserting default values.';
   cTXT0000006 = 'The Project Number you entered is already in use.  Please enter a unique value.';
   cTXT0000007 = 'The Customer field is required.  Please select a customer.';
   cTXT0000008 = 'Project Number is required.  Please enter a project number.';
   cTXT0000009 = 'Project Name is required.  Please enter a project name.';

   cTXT0000010 = 'Error posting labor changes.';
   cTXT0000011 = 'Delete project?';
   cTXT0000012 = 'Archive project?';
   cTXT0000013 = 'Archiving project.  Please wait.';
   cTXT0000014 = 'Project archived successfully.';
   cTXT0000015 = 'Project %s';
   cTXT0000016 = 'Select Project Task [%s : "%s"]';
   cTXT0000017 = 'Task name is required.  Please enter a name for this task or click the "Cancel edit" button on the toolbar to roll back your changes.';
   cTXT0000018 = 'Closed';
   cTXT0000019 = 'Open';

   cTXT0000020 = 'Creating new project.';
   cTXT0000021 = 'Include %s output'; // refers to file name
   cTXT0000022 = 'Include %s output (not found)'; // refers to file name
   cTXT0000023 = 'Include report %s output'; // refers to Crystal report file
   cTXT0000024 = 'Include report %s output (not found)'; // refers to Crystal report file
   cTXT0000025 = 'Generate from %s template';  // refers to file name
   cTXT0000026 = 'Generate from %s template (not found)';  // refers to file name
   cTXT0000027 = 'Report %s not found. Please use Setup to assign report';
   cTXT0000028 = 'Created on %s'; // date
   cTXT0000029 = 'A Microsoft Word template has not been specified.';

   cTXT0000030 = 'Microsoft Word template, %s, cannot be found.  Operation aborted.';
   cTXT0000031 = 'Closed PO for Project';
   cTXT0000032 = 'Open PO for Project';
   cTXT0000033 = 'Archived PO for Project';
   cTXT0000034 = 'Posted AP Invoices for Project';
   cTXT0000035 = 'Unposted AP Invoices for Project';
   cTXT0000036 = 'Cash Disbursements for Project';
   cTXT0000037 = 'Posted AR Invoices for Project';
   cTXT0000038 = 'Unposted AR Invoices for Project';
   cTXT0000039 = 'Cash Received for Project';

   cTXT0000040 = 'Attached Labor for Project';
   cTXT0000041 = 'Orders for Project';
   cTXT0000042 = 'Archived Orders for Project';
   cTXT0000043 = 'Closed PO for Task';
   cTXT0000044 = 'Open PO for Task';
   cTXT0000045 = 'Archived PO for Task';
   cTXT0000046 = 'Posted AP Invoices for Task';
   cTXT0000047 = 'Unposted AP Invoices for Task';
   cTXT0000048 = 'Cash Disbursements for Task';
   cTXT0000049 = 'Posted AR Invoices for Task';

   cTXT0000050 = 'Unposted AR Invoices for Task';
   cTXT0000051 = 'Cash Received for Task';
   cTXT0000052 = 'Detail information is unavailable for this bucket.';
   cTXT0000053 = 'Invalid number';
   cTXT0000054 = 'The link has either been broken or no longer exists.  Please verify the link.';
   cTXT0000055 = 'Archived Projects %s - %s : %s';
   cTXT0000056 = 'Copy this archived project? '#13#13 +
                 'This action will copy this archived project ' +
                 'to the primary tables.  Some information, ' +
                 'such as Cost Elements, Inventory and Labor, cannot be ' +
                 'included.';
   cTXT0000057 = 'Customer is required.  Operation aborted.';
   cTXT0000058 = 'Copying project, %s. Please wait.';
   cTXT0000059 = 'Could not generate project: %s';

   cTXT0000060 = 'Could not display Quick Add Labor:  %s';
   cTXT0000061 = 'This action will post the current batch to the system labor tables.  ' +
                 'This batch will be deleted when the process finishes successfully.  ' +
                 'This action is irreversible.'#13#13 +
                 'Do you wish to continue?';
   cTXT0000062 = 'Press the Insert key (Ins) to add another record.';
   cTXT0000063 = 'Could not find project [%d].';
   cTXT0000064 = 'Could not find task [%d].';
   cTXT0000065 = 'Please select a Project Work Order before choosing a task.';
   cTXT0000066 = 'Select Project Task [%s : "%s"]';
   cTXT0000067 = 'The Batch header has not been created.'#13#13 +
                 'You are trying to add detail for a batch that does not exist.  ' +
                 'Please create a new batch first before adding labor information.';
   cTXT0000068 = 'Employee Number is required.  '#13#13 +
                 'Please select an employee before trying to save this record.';
   cTXT0000069 = 'Work Order Number is required.  '#13#13 +
                 'Please select a Work Order Number before trying to save this record.';

   cTXT0000070 = 'Task Outline Number is required.  '#13#13 +
                 'Please select a Task Number before trying to save this record.';
   cTXT0000071 = 'A value for Hours is required.  '#13#13 +
                 'Please enter the employee''s hours before trying to save this record.';
   cTXT0000072 = 'The Work Order has changed.  Please select a new Task Number before trying to save this record.';
   cTXT0000073 = 'Could not change task number:  %s';
   cTXT0000074 = 'Apply Standard Cost';
   cTXT0000075 = 'Apply Default Labor Rate';
   cTXT0000076 = 'Save change to task structure?';
   cTXT0000077 = 'Select Task [Template : "%s"]';
   cTXT0000078 = 'Delete task, %s, and all subtasks?';
   cTXT0000079 = 'Deleting task.  Please wait.';

   cTXT0000080 = 'Delete task, %s?';
   cTXT0000081 = 'Updating.  Please wait.';
   cTXT0000082 = 'You cannot insert a task until you have created ' +
                 'a template record and given it a name.  Please ' +
                 'create a template.';
   cTXT0000083 = 'This template does not have a name.  ' +
                 'Please assign a name to the template before ' +
                 'inserting tasks.';
   cTXT0000084 = 'Enter a name for the new task:';
   cTXT0000085 = 'Inserting task.  Please wait.';
   cTXT0000086 = 'New Subtask';
   cTXT0000087 = 'Enter a name for the new subtask:';
   cTXT0000088 = 'The standard cost for this item is 0.00.  ' +
                 'Do you want to set the Standard Cost to 0.00?';
   cTXT0000089 = 'Enter free form item description:';

   cTXT0000090 = 'Project Templates [%s]';
   cTXT0000091 = 'The default labor rate set in Project Options is 0.00.  ' +
                 'Do you want to set the Standard Cost to 0.00?';
   cTXT0000092 = 'Save change to task structure?';
   cTXT0000093 = 'Appending tasks from template.  Please wait.';
   cTXT0000094 = 'Updating database.  Please wait.';
   cTXT0000095 = 'Delete all tasks, and subtasks, from this template?  ' +
                 'You will not be able to undo this action.';
   cTXT0000096 = 'All tasks will be permanently deleted.  Are you sure you want to continue?  ' +
                 'You will not be prompted again.';
   cTXT0000097 = 'Disabled drag-and-drop for the Task tree?'#13#13 +
     'You can reenable drag-and-drop by clicking this option again.';
   cTXT0000098 = 'Enabled drag-and-drop for the Task tree?';
   cTXT0000099 = 'Accessing Project Manager.  Please wait.';

   cTXT0000100 = 'Closing Project Manager.  Please wait.';
   cTXT0000101 = 'A BOM Quotation is linked to this Project:  '#13#10 +
                 '     The additional quoted costs of manufacturing can also appear on the Quote Letter,' +
                 '     if desired.';
   cTXT0000102 = 'Task Cost Element:'#13 +
                 '   Element Name: %s'#13 +
                 '   Element Type: %s'#13 +
                 '   Can Change? %s %s';
   cTXT0000103 = 'Task Cost Element:'#13 +
                 '   None assigned'#13 +
                 '   Can Change? %s %s';
   cTXT0000104 = 'The previous task, "%s," has quantity and cost values. ' +
                 'By demoting "%s", you will clear the actual values in ' +
                 '"%s."  You will not be able to undo this action.'#13#13 +
                 'Do wish to continue?';
   cTXT0000105 = 'Save change to task structure?';
   cTXT0000106 = 'Calculating totals.  Please wait.';
   cTXT0000107 = 'Existing PO for <%s-%s-%s>';
   cTXT0000108 = 'Unable to add item to Purchase Order:  %s';
   cTXT0000109 = 'Existing PO based on vendor(s) for <%s-%s-%s>';

   cTXT0000110 = '%s Days';
   cTXT0000111 = '(Calculated)';
   cTXT0000112 = 'A Duration value will be calculated from child task dates ' +
                 'after it has been added to a project.';
   cTXT0000113 = 'Estimated duration of the task';
   cTXT0000114 = '%d Days';
   cTXT0000115 = 'Clear associated PLM item?';
   cTXT0000116 = 'Update activity totals for all projects?'#13 +
     'Although this process may take hours to complete, you may continue ' +
     'working or even close EnterpriseIQ while it runs in the background.';
   cTXT0000117 = 'Update project labor first?';
   cTXT0000118 = 'Process complete.';
   cTXT0000119 = 'Switch to tree view and view the task?';

   cTXT0000120 = 'PLM Item linked to this project:'#13 +
                 'Item #:  %s'#13 +
                 'Description: %s'#13 +
                 'Class: %s'#13 +
                 'Revision: %s';
   cTXT0000121 = 'PLM Item linked to this project.';
   cTXT0000122 = 'Recalculate now?';
   cTXT0000123 = 'Apply the date range (%s - %s) to all projects?';
   cTXT0000124 = 'Update Project Activity';
   cTXT0000125 = 'Updating activity totals for projects ...';
   cTXT0000126 = 'A Customer is required.  Please select a Customer before attempting to create a new Project.';
   cTXT0000127 = '%d Day'; // singular
   cTXT0000128 = 'Customer not specified.';
   cTXT0000129 = 'The Project Number, %s, is already in use.  Please enter a unique value.';

   cTXT0000130 = 'Please enter a Project number.';
   cTXT0000131 = 'Do you want to calculate Activity Summary totals for this new project?';
   cTXT0000132 = 'Project contains one or more tasks with no name.  ' +
    'Cannot clone project with empty tasks.';
   cTXT0000133 = 'Accessing Internal Documents.  Please wait.';
   cTXT0000134 = 'Accessing External Documents.  Please wait.';
   cTXT0000135 = 'The default Project report has not been assigned in System ' +
    'Parameters. Please assign default report for Project.';
   cTXT0000136 = 'Cannot find the Project report:'#13'%s'#13 +
    'Ensure that this file exists and that the setting for REPORTS in ' +
    'IQStatus is correct.';
   cTXT0000137 = 'The default Project Work Order report has not been ' +
   'assigned in System Parameters. Please assign default report for ' +
   'Project Work Order.';
   cTXT0000138 = 'Cannot find the Project Work Order report:'#13'%s'#13 +
    'Ensure that this file exists and that the setting for REPORTS in ' +
    'IQStatus is correct.';
   cTXT0000139 = 'Cannot find the Project report:'#13'%s'#13 +
    'Ensure that this file exists and that the setting for REPORTS in ' +
    'IQStatus is correct.';

   cTXT0000140 = 'Accessing Email Correspondance.  Please wait.';
   cTXT0000141 = '%s [ From %s To %s ]';
   cTXT0000142 = 'Delete task?';
   cTXT0000143 = '%.0f Days';
   cTXT0000144 = 'The start date for %s is adjacent the finish date of %s';
   cTXT0000145 = 'Link the tasks.  %s will follow %s.';
   cTXT0000146 = 'Change the date without adding a link.';
   cTXT0000147 = 'The start date for ? is adjacent the finish date of ?.';
   cTXT0000148 = 'Reset flow chart objects to default positions?';
   cTXT0000149 = 'Save changes first?';
   cTXT0000150 = 'Apply calculated project price as the default project price?';
   cTXT0000151 = 'Clearing MRO information will ' +
     'clear the existing link between this Project and ' +
     'Preventative Maintance.  You will not be able to undo ' +
     'this action.' +
     #13#13 +
     'Do you wish to continue?';
   cTXT0000152 = 'Clear link to Engineering Quote?';
   cTXT0000153 = 'Accessing Internal Documents.  Please wait.';
   cTXT0000154 = 'Accessing External Documents.  Please wait.';
   cTXT0000155 = 'Inserting task.  Please wait.';
   cTXT0000156 = 'Task inserted.  Updating project.';
   cTXT0000157 = 'Delete task, %s?';
   cTXT0000158 = 'Do you wish to link this Project Work Order ' +
     'to MRO?';
   cTXT0000159 = 'Could not open Cost Elements:'; 
   cTXT0000160 = 'New Task';
   cTXT0000161 = 'New Subtask';
   cTXT0000162 = 'Enter a name for the new task:';
   cTXT0000163 = 'Enter a name for the new subtask:'; 
   cTXT0000164 = 'The previous task, "%s," has quantity and dollar values. ' +
     'By inserting a subtask, you will clear the actual values in ' +
     '"%s."  You will not be able to undo this action.'#13#13 +
     'Do wish to continue?';
   cTXT0000165 = 'The standard cost for this item is 0.00.  ' +
     'Do you want to set the Standard Cost to 0.00?';
   cTXT0000166 = 'Do you want to recalculate the current project activity totals?';
   cTXT0000167 = 'This action will update Actual Hours and Actual Dollars for Labor Tasks in this project.'#13#13 +
     'Do you wish to continue?';
   cTXT0000168 = 'Updating Actual values.  Please wait.';
   cTXT0000169 = 'The link has either been broken or no longer exists.  ' +
    'Please verify the link and try again.';
   cTXT0000170 = 'Insert';
   cTXT0000171 = 'Edit';
   cTXT0000172 = 'Insert Hyperlink';
   cTXT0000173 = 'Edit Hyperlink';
   cTXT0000174 = 'Could not create Sales Order:';
   cTXT0000175 = 'There are currently %d sales orders created for this ' +
     'Project.  Do you wish to create another Sales Order for this project?';
   cTXT0000176 = 'Create a miscellaneous Sales Order for this project?'; 
   cTXT0000177 = 'The project name is blank.'#13#13'Please enter a project ' +
    'name before attempting to create a miscellaneous sales order.';
   cTXT0000178 = 'Hide Details';
   cTXT0000179 = 'Show Details';
   cTXT0000180 = 'Project Start:';
   cTXT0000181 = '<No Task Dates Assigned>';
   cTXT0000182 = 'Date: %s';
   cTXT0000183 = 'Time: %s';
   cTXT0000184 = 'Project Start:';
   cTXT0000185 = 'Project Finish:'; 
   cTXT0000186 = 'Convert this Project to a work order?';
   cTXT0000187 = 'Replace the current values for ' +
     'Actual Hours and Actual Dollars?';
   cTXT0000188 = 'Unable to show drill-down summary screen:';
   cTXT0000189 = 'The Customer field is required.  Please select a customer before inserting tasks.';
   cTXT0000190 = 'The standard cost for this item is 0.00.  ' +
     'Do you want to set the Standard Cost to 0.00?';
   cTXT0000191 = 'The default labor rate set in Options is 0.00.  ' +
     'Do you want to set the Standard Cost to 0.00?';
   cTXT0000192 = 'Apply Standard Cost';
   cTXT0000193 = 'Apply Default Labor Rate';
   cTXT0000194 = 'Delete all tasks, and subtasks, from this project?  ' +
    'You will not be able to undo this action.';
   cTXT0000195 = 'All tasks will be permanently deleted.  Are you sure you ' +
    'want to continue?  You will not be prompted again.';
   cTXT0000196 = 'Paste Task "%s" (current project)?';
   cTXT0000197 = 'Paste Task "%s" from Project "%s"?';
   cTXT0000198 = 'The project price is 0.00.  Do you wish to create a sales order anyway?';
   cTXT0000199 = 'Free Form Item';
   cTXT0000200 = 'Enter free form item description:';
   cTXT0000201 = 'This action will scan this project and automatically ' +
    'correct potential anomalies.  Do you wish to continue?';
   cTXT0000202 = 'Correcting task sequences.'; 
   cTXT0000203 = ''; 
   cTXT0000204 = 'Tasks repaired successfully.'; 
   cTXT0000205 = 'Posted General Journal';
   cTXT0000206 = 'Unposted General Journal';
   cTXT0000207 = 'Add default predecessor?';
   cTXT0000208 = 'Cannot add predecessor.  The selected predecessor is ' +
    'already using this task as a predecessor.';
   cTXT0000209 = 'Continuing with this action will re-assign all default ' +
   'predecessors according to the current task structure for this template.  ' +
   'Do you want to continue?';
   cTXT0000210 = 'The Labor Rate is not a valid number.';
   cTXT0000211 = 'The Mark Up Rate is not a valid number.';
   cTXT0000212 = 'Cancel update?';
   cTXT0000213 = 'This action will update Actual Hours and Actual Dollars ' +
    'for Labor Tasks for all projects.'#13#13 +
    'Do you wish to continue?';
   cTXT0000214 = 'Updating Actual values.  Please wait.';
   cTXT0000215 = 'Do you wish to link this Project Work Order '#13 +
     'to MRO?';
   cTXT0000216 = 'Could not create link to MRO:';
   cTXT0000217 = 'This action will scan this template and automatically ' +
    'correct potential anomalies.  Do you wish to continue?';
   cTXT0000218 = 'Delete archived project?';
   cTXT0000219 = 'New Template';
   cTXT0000220 = 'Enter a name for the new template:';
   cTXT0000221 = 'Edit Task Name';
   cTXT0000222 = 'Edit task name:';
   cTXT0000223 = 'Rename Hyperlink';
   cTXT0000224 = 'Enter new name:';
   cTXT0000225 = 'The link has either been broken or no longer exists.  ' +
    'Please verify the link and try again.';
   cTXT0000226 = 'Saving Project as new Tooling Template.  Please wait.';
   cTXT0000227 = 'Attempt to delete dependent records for (%s) failed for value %.0f';
   cTXT0000228 = 'Are you sure you want to remove the link?';
   cTXT0000229 = 'Apply Standard Cost';
   cTXT0000230 = 'Apply Default Labor Rate';
   cTXT0000231 = 'Search Project Work Orders';
   cTXT0000232 = 'Search Projects';
   cTXT0000233 = 'This project has unposted labor hours.  Do you wish to continue?';
   cTXT0000234 = 'You are about to unlink the project task from this work ' +
    'order.  Do you want to continue?';
   cTXT0000235 = 'Work order # %.0f is currently running on work center ' +
    '''%s''. Cannot delete the work order.';
   cTXT0000236 = 'Inactive';
   cTXT0000237 = 'Pending';
   cTXT0000238 = 'Approved';
   cTXT0000239 = 'Clear link GL Account?';
   cTXT0000240 = 'Clear Assigned To?';
   cTXT0000241 = 'Please enter a positive value for the number of shifts.';
   cTXT0000242 = 'Please enter a value from 1 to 4 for the number of shifts.';
   // cTXT0000243 = '';
   cTXT0000244 = 'Multi-Select is ON'#13'Click to turn it off';
   cTXT0000245 = 'Multi-Select is OFF'#13'Click to turn it on';
   cTXT0000246 = 'Would you like to delete obsolete scheduled days-off from ' +
     'the previous year(s)?';
   cTXT0000247 = 'Delete record(s)?';
   cTXT0000248 = 'Please enter valid dates.';
   cTXT0000249 = 'Are you sure you wish to copy from the Default Schedule?';
   cTXT0000250 = 'This option recreates and stores weekends/off shift ' +
     'information according to the Project Manager Calendar Setup parameters.';
   cTXT0000251 = 'Invalid Time Specification. Please enter the time in ' +
    '"HH:MM:SS" format.';
   cTXT0000252 = 'Done.';
   cTXT0000253 = 'Delete Assigned To record?';
   cTXT0000254 = 'Shift # must be between 1 to 4';
   cTXT0000255 = 'Shift Labor Hours';
   cTXT0000256 = 'Please enter labor hours';
   cTXT0000257 = 'Standard labor is up-to-date.  Nothing needs to be added.';
   cTXT0000258 = 'Loading Employees and Shifts:'#13'%s, Shift %d';
   cTXT0000259 = 'Load all available employees and shifts?';
   cTXT0000260 = 'Req.';
   cTXT0000261 = 'Avail.';
   cTXT0000262 = 'From %s~To %s';
   cTXT0000263 = 'Please select a Begin Date.';
   cTXT0000264 = 'Please select a View type.';
   cTXT0000265 = 'Shift';
   cTXT0000266 = 'Please select a shift:';
   cTXT0000267 = 'The Employee and Shift already exist in the table.';
   cTXT0000268 = 'Would you like to calculate labor capacity?  The ' +
     'whiteboard must be calculated to show recent changes to project ' +
     'labor assignment.';
   cTXT0000269 = 'About to post entered labor hours. Continue?';
   cTXT0000270 = 'Finished posting labor hours. %d record(s) added.';
   cTXT0000271 = 'Labor Reporting by %s';
   cTXT0000272 = 'Accessing database.  Please wait...';
   cTXT0000273 = 'Project Type Description: %s';
   cTXT0000274 = 'Project Type: Not Assigned';
   cTXT0000275 = 'Attached Inventory [%s: %s]';
   cTXT0000276 = 'Calculating disposition data.  Please wait.';
   cTXT0000277 = 'Existing PO for, %s-%s-%s';
   cTXT0000278 = 'Unable to add item to Purchase Order:';
   cTXT0000279 = 'Existing PO based on vendor(s) for %s-%s-%s';
   cTXT0000280 = 'This project contains circular predecessor links.  ' +
      'Please fix the task predecessor relationships before proceeding.';
   cTXT0000281 = 'You have been assigned to Project Manager # %s, Task %s';
   cTXT0000282 = 'Project #: %s'#13'Task: %s';
   cTXT0000283 = '';
   cTXT0000284 = '';
   cTXT0000285 = '';
   cTXT0000286 = '';
   cTXT0000287 = '';
   cTXT0000288 = '';
   cTXT0000289 = '';
   cTXT0000290 = '';
   cTXT0000291 = '';
   cTXT0000292 = '';
   cTXT0000293 = '';
//   cTXT0000294 = '';
//   cTXT0000295 = '';
//   cTXT0000296 = '';
//   cTXT0000297 = '';
//   cTXT0000298 = '';
//   cTXT0000299 = '';
//   cTXT0000300 = '';

   // iqtool_rscstr.cTXT0000233
               
implementation
               
end.
