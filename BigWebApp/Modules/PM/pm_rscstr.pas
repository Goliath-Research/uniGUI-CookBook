unit pm_rscstr;

{ Lists strings for messages used in MRO }

interface

resourcestring

  // pm_rscstr.cTXT0000355

  cTXT0000001 = 'MRO';
  cTXT0000002 = 'The Task UOM is different from the Equipment UOM.';
  cTXT0000003 = 'Updating.  Please wait.';
  cTXT0000004 = 'Close Work Order Task';
  cTXT0000005 = 'Calculating totals.  Please wait';
  cTXT0000006 = 'Equipment #';
  cTXT0000007 = 'Equipment Count: %d';
  cTXT0000008 = 'Equipment and Tasks';
  cTXT0000009 = 'Class';
  cTXT0000010 = 'Applying Filter.  Please Wait.';
  cTXT0000011 = 'Miscellaneous';
  cTXT0000012 = 'MISC';
  cTXT0000013 = 'Miscellaneous Task';
  cTXT0000014 = 'Hiding Miscellaneous.';
  cTXT0000015 = 'Showing Miscellaneous.';
  cTXT0000016 = 'Hide miscellaneous tasks';
  cTXT0000017 = 'Show miscellaneous tasks';
  cTXT0000018 = 'Hiding Archived.';
  cTXT0000019 = 'Showing Archived.';
  cTXT0000020 = 'Show or Hide Miscellaneous and Archived Tasks:';
  cTXT0000021 = 'Yes';
  cTXT0000022 = 'No';
  cTXT0000023 = 'Do you wish to delete current record?';
  cTXT0000024 = 'Existing Purchase Orders [%s-%s-%s]';
  cTXT0000025 = 'Existing Purchase Orders by Vendor [%s-%s-%s]';
  cTXT0000026 = 'Free Form';
  cTXT0000027 = 'Free Form Part';
  cTXT0000028 = 'Comment';
  cTXT0000029 = 'Quantity';
  cTXT0000030 = 'Parent task not found.  Please enter a task and try again.';
  cTXT0000031 = 'Tasks';
  cTXT0000032 = 'No Employee assigned.  Please select an employee.';
  cTXT0000033 = 'A value for Hours is required.'#13#13'Please enter employee ' +
    'hours before trying to save the record.';
  cTXT0000034 = 'Cannot change employee: %s';
  // cTXT0000035    = 'MRO - All Work Orders';
  cTXT0000036 = 'MRO - Open Work Orders';
  cTXT0000037 = 'MRO - Closed Work Orders';
  cTXT0000038 = 'Create separate work orders for each date range?'#13#13 +
    'This action will create separate work orders for each of the date ' +
    'ranges in the list.  When the process is finished, this batch will be ' +
    'deleted.'#13#13'Press Yes to create the work orders.  Press No to abort ' +
    'this process.';
  cTXT0000039 = 'Clear the date list for this Task?';
  cTXT0000040 = 'Work Orders Associated with Equipment # %s';
  // cTXT0000041    = '';
  cTXT0000042 = 'Could not add Work Order breaks.';
  cTXT0000043 = 'No text assigned.';
  cTXT0000044 = 'Detail information is unavailable for this bucket.';
  cTXT0000045 = 'No Work Order Generated';
  cTXT0000046 = 'Select from MRO Work Orders';
  cTXT0000047 = 'Select from Open Work Orders';
  cTXT0000048 = 'Select from Closed Work Orders';
  cTXT0000049 = 'The End Date has been set before the Start Date.  The End ' +
    'Date must be greater than the Start Date.  Please recheck your dates.';
  cTXT0000050 = 'This Work Order Task has no attached inventory to disposion ' +
    'or is a miscellaneous task.';
  cTXT0000051 = 'Your End Date must be greater than your Start Date.';
  cTXT0000052 = 'Start Date is required.  Please choose a Start Date.';
  cTXT0000053 = 'End Date is required.  Please choose an End Date.';
  cTXT0000054 = 'Beak Quantity must be greater than or equal to 2.';
  cTXT0000055 = 'There are not enough days in the date range to create %d ' +
    'work orders.';
  cTXT0000056 = 'Cannot find Work Center.';
  cTXT0000057 = 'Closed PO for Equipment';
  cTXT0000058 = 'Open PO for Equipment';
  cTXT0000059 = 'Archived PO for Equipment';
  cTXT0000060 = 'Posted AP Invoices for Equipment';
  cTXT0000061 = 'Unposted AP Invoices for Equipment';
  cTXT0000062 = 'Cash Disbursements for Equipment';
  cTXT0000063 = 'Posted AR Invoices for Equipment';
  cTXT0000064 = 'Unposted AR Invoices for Equipment';
  cTXT0000065 = 'Cash Received for Equipment';
  cTXT0000066 = 'Labor for Equipment';
  cTXT0000067 = 'Consumed Inventory for Equipment';
  cTXT0000068 = 'Closed PO for Job';
  cTXT0000069 = 'Open PO for Job';
  cTXT0000070 = 'Archived PO for Job';
  cTXT0000071 = 'Posted AP Invoices for Job';
  cTXT0000072 = 'Unposted AP Invoices for Job';
  cTXT0000073 = 'Cash Disbursements for Job';
  cTXT0000074 = 'Posted AR Invoices for Job';
  cTXT0000075 = 'Unposted AR Invoices for Job';
  cTXT0000076 = 'Cash Received for Job';
  cTXT0000077 = 'Invalid service date range. The Out of Service Date must ' +
    'be before (less than) than the In Service date.'#13'Please enter ' +
    'different dates, or cancel your changes.';
  cTXT0000078 = 'MRO References';
  cTXT0000079 = 'The following fields are required:'#13'%s'#13'Please enter ' +
    'the required values and try again.';
  cTXT0000080 = 'The following field is required: %s'#13'Please enter the ' +
    'required value and try again.';
  cTXT0000081 = 'Hours';
  cTXT0000082 = 'Days';
  // cTXT0000083   = 'Weeks';
  // cTXT0000084   = 'Months';
  cTXT0000085 = 'Cycles';
  cTXT0000086 = 'Accessing database.  Please wait.';
  cTXT0000087 = 'Closing MRO.  Please wait.';
  cTXT0000088 = 'Accessing MRO.  Please wait.';
  cTXT0000089 = 'Accessing MRO Work Orders.';
  cTXT0000090 = 'Accessing MRO Skills.';
  cTXT0000091 = 'Accessing MRO Tasks.';
  cTXT0000092 = 'Accessing Work Order Planner.';
  // cTXT0000093   = '';
  cTXT0000094 = 'Adding Work Centers.  Please wait.';
  cTXT0000095 = 'Adding Work Center: %s';
  cTXT0000096 = 'Work Centers Appended: %d';
  cTXT0000097 = 'Adding task to Work Order.  Please wait.';
  cTXT0000098 = 'Apply Task';
  cTXT0000099 = 'Apply Task to MRO Equipment Job';
  cTXT0000100 = 'Apply Task to MRO Template';
  cTXT0000101 = 'Creating date value: %s';
  cTXT0000102 = 'Please enter the Miscellaneous Task description:';
  cTXT0000103 = 'Recalculate now?';
  cTXT0000104 = 'Please enter a description:';
  cTXT0000105 = 'Restore this task?'#13#13'You have chosen to restore this ' +
    'task from an archived state.'#13#13'Do you wish to continue?';
  cTXT0000106 = 'Archive this task?'#13#13'You have chosen to archive this ' +
    'task.  This will clear any accumulated units and will remove it from ' +
    'the list of tasks that can be added to a work order.'#13#13'Do you wish ' +
    'to continue?';
  cTXT0000107 = 'Enter the projected quantity for the inventory item';
  cTXT0000108 = 'Do you wish to open the file for viewing?';
  cTXT0000109 = 'The value for Class is empty.  Do you want to continue?';
  cTXT0000110 = 'There are no Jobs for this equipment.';
  cTXT0000111 = 'No Task is selected.  Please select a task.';
  cTXT0000112 = 'There are no tasks selected.  Please select equipment ' +
    'tasks to be added to each work order.';
  cTXT0000113 = 'Encountered one or more problems attempting to jump to ' +
    'MRO record:'#13#13'%s';
  cTXT0000114 = 'Encountered one or more problems attempting to jump to ' +
    'MRO Work Orders:'#13#13'%s';
  cTXT0000115 = 'Encountered one or more problems attempting to jump to ' +
    'MRO Tasks:'#13#13'%s';
  cTXT0000116 = 'A MRO record has not been created or ' +
    'associated with this work center.';
  cTXT0000117 = 'Cannot create new record.';
  cTXT0000118 = 'Cannot delete record.';
  cTXT0000119 = 'Could not find selected equipment';
  cTXT0000120 = 'Invalid relationship: same equipment.  Cannot link same ' +
    'equipment.';
  cTXT0000121 = 'Save changes?';
  cTXT0000122 = 'Equipment already in list.  Cannot add.';
  cTXT0000123 = 'Refresh list now?';
  cTXT0000124 = 'Where Used';
  cTXT0000125 = 'Circular link found.  Cannot add.';
  cTXT0000126 = 'Miscellaneous item description required.';
  cTXT0000127 = 'Miscellaneous Task Description';
  cTXT0000128 = 'Delete record?';
  cTXT0000129 = 'Delete';
  cTXT0000130 = 'MRO Equipment record required.';
  cTXT0000131 = 'The following error occurred: '#13#13'%s'#13#13'Normal ' +
    'execution will continue.';
  cTXT0000132 = 'Enter labor hours';
  cTXT0000133 = 'Labor Hours';
  cTXT0000134 = 'Enter quantity';
  cTXT0000135 = 'Installation Date';
  cTXT0000136 = 'An Installation Date is required before updating this ' +
    'equipment.';
  cTXT0000137 = 'Service Dates - In Service';
  cTXT0000138 = 'Service Dates - Out of Service';
  cTXT0000139 = 'When the job task is added to a MRO ' +
    'Work Order, the value will be reset to zero (0).  Note:  The value ' +
    'will not be reset simply by re-opening a closed work order task.';
  cTXT0000140 = 'When the job task is closed on a MRO ' +
    'Work Order, Total Units will be set to the Current Total Units (as ' +
    'seen on the main screen) minus the Starting Total Units (when the ' +
    'task was added to the work order).';
  cTXT0000141 = 'Miscellaneous tasks are currently filtered from the list.  ' +
    'This new miscellaneous task will not be visible.  ' +
    'Do you want to remove the filter that hides miscellaneous tasks?';
  cTXT0000142 = 'This equipment is inactive and cannot be updated.';
  cTXT0000143 = 'This equipment is out of service and cannot be updated.';
  cTXT0000144 = 'This equipment was installed after it was scheduled back ' +
    'in service.  Please check your dates.';
  cTXT0000145 = 'The UOM has not been set.';
  cTXT0000146 = 'Cannot delete Job record because it is referenced by MRO ' +
    'Work Orders.  First remove all references to this MRO Job from MRO Work ' +
    'Orders, then try again.';
  cTXT0000147 = 'When the job task is closed on a MRO ' +
    'Work Order, Total Units will be set to zero (0).';
  cTXT0000148 = 'Parent record not found.';
  cTXT0000149 = 'No Task description entered.  Cannot create record.';
  cTXT0000150 = 'Cannot delete this task.  It is currently referenced by ' +
    'equipment.';
  cTXT0000151 = 'Cannot delete this task.  It is currently referenced by ' +
    'templates.';
  cTXT0000152 = 'Cannot delete MRO record because ' +
    'it is referenced by Work Centers.';
  cTXT0000153 = 'Cannot delete MRO record because ' +
    'it is referenced by Project Manager.';
  cTXT0000154 = 'Cannot delete MRO record because ' +
    'it is referenced by one or more Bills of Manufacturing.';
  cTXT0000155 = 'Please add a Job Task before trying to assign Inventory.';
  cTXT0000156 = 'The quantity must be greater than 0';
  cTXT0000157 = 'Cannot display Work Order # %d within the current filter.';
  cTXT0000158 = 'Cannot find Work Order %d. The process will continue, but ' +
    'the selected work order will not display.';
  cTXT0000159 = 'The Task is already assigned to the Work Order. It cannot ' +
    'be added more than once.';
  cTXT0000160 = 'Task %s already assigned to MRO Work ' +
    'Order # %d.'#13#13'Do you still want to append the task to this Work '
    + 'Order?';
  cTXT0000161 = 'The Task is already assigned to the Template. It cannot ' +
    'be added more than once.';
  cTXT0000162 = 'The Skill is already assigned.  It cannot be added more ' +
    'than once.';
  cTXT0000163 = 'The Training item is already assigned.  It cannot be added ' +
    'more than once.';
  cTXT0000164 = 'Task number is required.  Please enter a task number.';
  cTXT0000165 = 'The Work Order header has not been defined.  Cannot add task.';
  cTXT0000166 = 'Could not find selected MRO Work Order.';
  cTXT0000167 = 'An equipment with this number and class already exists.  ' +
    'Please enter a unique equipment number and class.';
  cTXT0000168 = 'Open';
  cTXT0000169 = 'Closed';
  cTXT0000170 = 'Incomplete';
  cTXT0000171 = 'MISC';
  cTXT0000172 = 'When adding a new miscellaneous MRO Work Order item, update ' +
    'the comment field with the task description.';
  cTXT0000173 = 'Associated equipment has not been selected.  Continue?';
  cTXT0000174 = 'Error updating record';
  cTXT0000175 = '%s is not a value quantity.';
  cTXT0000176 = 'Total quantity consumed for Work Order item: %.0f';
  cTXT0000177 = 'Total quantity consumed for task-tool combination: %.0f';
  cTXT0000178 = 'Attached Inventory';
  cTXT0000179 = 'Disposition Attached Inventory';
  cTXT0000180 = 'Cannot show attached inventory.   ' +
    'Please close and reopen MRO Work Orders, then try again.';
  cTXT0000181 = 'Initializing ...';
  cTXT0000182 = 'Loading Equipment:';
  cTXT0000183 = 'Unloading Equipment:';
  cTXT0000184 = 'Please wait...';
  cTXT0000185 = 'Unloading Equipment.  Please wait.';
  cTXT0000186 = 'No class found';
  cTXT0000187 = 'Maintenance';
  cTXT0000188 = 'Tools';
  cTXT0000189 = 'Gages/Devices';
  cTXT0000190 = 'Class, %s, is currently referenced by Equipment # %s.  ' +
    'Cannot delete.';
  cTXT0000191 = 'Automatically create all pending MRO ' +
    'Work Orders now?  This process will take several minutes.';
  cTXT0000192 = 'Update the total units for this equipment, where the unit ' +
    'of measure is in "Days"?';
  cTXT0000193 = 'Update the total units for all equipment, where the unit ' +
    'of measure is in "Days"?  This process will take several minutes.';
  cTXT0000194 = 'Add all tasks?';
  cTXT0000195 = 'Remove all tasks?';
  cTXT0000196 = 'Adding tasks. Please wait.';
  cTXT0000197 = 'Process complete.';
  cTXT0000198 = 'Loading Equipment.  Please wait.';
  cTXT0000199 = 'Select';
  cTXT0000200 = 'There are no tasks pending work orders.';
  cTXT0000201 = 'There are no tasks pending work orders for class, %s.';
  cTXT0000202 = 'There are no tasks pending work orders for Equipment # %s.';
  cTXT0000203 = 'Pending Equipment: %d';
  cTXT0000204 = 'Selected Tasks: %d';
  cTXT0000205 = 'Selected Equipment: %d';
  cTXT0000206 = 'Abort processing?';
  cTXT0000207 = 'Create one Work Order for every Equipment #?  %s Work ' +
    'Orders will be created.';
  cTXT0000208 = 'Create one Work Order for all Tasks together?  The Work ' +
    'Order will contain %s tasks.';
  cTXT0000209 = 'Create separate Work Orders for each Task?  %s Work Orders ' +
    'will be created.';
  cTXT0000210 = 'Create MRO Work Orders';
  cTXT0000211 = 'Create MRO Work Orders [%s]';
  cTXT0000212 = 'Clearing batch.  Please wait.';
  cTXT0000213 = 'Creating pending work orders.  Please wait.';
  cTXT0000214 = 'Done.';
  cTXT0000215 = 'Update the number of people required to perform this task?';
  cTXT0000216 = 'This equipment will be out of service on %s.';
  cTXT0000217 = 'This equipment has been out of service since %s.';
  cTXT0000218 = 'This equipment is currently out of service.';
  cTXT0000219 = 'This equipment will be out of service from %s to %s ' +
    '(%d days).';
  cTXT0000220 = 'This equipment was out of service between %s and %s ' +
    '(%d days).';
  cTXT0000221 = 'This equipment is in service.';
  cTXT0000222 = 'Could not change inventory:  ';
  cTXT0000223 = 'Accessing Internal Documents.  Please wait.';
  cTXT0000224 = 'Accessing External Documents.  Please wait.';
  cTXT0000225 = 'Updated All MRO Equipment of Class %s having UOM of "Days".';
  cTXT0000226 = 'Updated All MRO Equipment having UOM of "Days".';
  cTXT0000227 = 'Updated "Days" unit for MRO Equipment %s [PMEQMT.ID=%d].';
  cTXT0000228 = 'Cannot change Code: %s';
  cTXT0000229 = 'Refreshing Work Order data.  Please wait...';
  cTXT0000230 = 'Repeat on these days:';
  cTXT0000231 = 'Occurrence of:';
  cTXT0000232 = 'Building List for: %s';
  cTXT0000233 = 'Sorting list...';
  cTXT0000234 = 'Building table list (record %d of %d).  Please wait.';
  cTXT0000235 = 'Could not append work order breaks.';
  cTXT0000236 = 'Building List for First Week';
  cTXT0000237 = 'Building List for Second Week';
  cTXT0000238 = 'Building List for Third Week';
  cTXT0000239 = 'Building List for Fourth Week';
  cTXT0000240 = 'Building List for Last Week';
  cTXT0000241 = 'Creating work orders (%d of %d)';
  cTXT0000242 = 'Process complete.'#13#13 +
    'Work orders have been created. The current batch will now be deleted.';
  cTXT0000243 = 'There is no date list.  '#13#13 +
    'Please generate a list of work order date ranges before attempting to create work orders.';
  cTXT0000244 = 'MRO Equipment has not been selected.  Please choose and ' +
    'equipment number before selecting a task.';
  cTXT0000245 = 'The Task is already assigned to the detail. Cannot append.';
  cTXT0000246 = 'Task, %s, already exists.  Please enter a unique Task name.';
  cTXT0000247 = 'Equipment number is required.  Please enter a value.';
  cTXT0000248 = 'Equipment description is required.  Please enter a value.';
  cTXT0000249 = 'This Equipment number is already used.  Please enter a ' +
    'unique value.';
  cTXT0000250 = 'Cloning Equipment.  Please wait.';
  cTXT0000251 = 'An error occurred while attempting to clone this ' +
    'equipment:'#13#13'%s'#13#13'Clone operation aborted.';
  cTXT0000252 = 'MRO Work Orders';
  cTXT0000253 = 'MRO Work Orders [ARCHIVED]';
  cTXT0000254 = 'Archive';
  cTXT0000255 = 'Restore from Archive';
  cTXT0000256 = 'This work order has open tasks.  Please close all tasks ' +
    'before attempting to archive.';
  cTXT0000257 = 'This work order has open tasks.  Please close all tasks ' +
    'before attempting to archive.';
  cTXT0000258 = 'Archive current work order?';
  cTXT0000259 = 'Restore archived work order?';
  cTXT0000260 = 'Change the MRO Equipment associated with this task?';
  cTXT0000261 = 'Archive Task';
  cTXT0000262 = 'Restore Archived Task';
  cTXT0000263 = 'Enter a new template description:';
  cTXT0000264 = 'New template record not found.  Clone failed.';
  cTXT0000265 = 'A new description is required.';
  cTXT0000266 = 'Text Length: %d / %d';
  cTXT0000267 = 'Modified';
  cTXT0000268 = 'Word Count: %d';
  cTXT0000269 = 'At least one of the tasks in the Template ' +
    'matched an existing task of the tool.  ' + 'It was not appended.';
  cTXT0000270 = 'The task is already assigned to the tool.';
  cTXT0000271 = 'The selected skill already exists for this task.';
  cTXT0000272 = 'The MRO Equipment ID is 0.  Operation aborted.';
  cTXT0000273 = 'The "From Date" is greater than the "To Date."  Please ' +
    'select different values.';
  cTXT0000274 = '"%s" is not a valid number.  Please enter only numbers, ' +
    'no text.';
  cTXT0000275 = 'Cannot edit description for a standard, job task.  Only ' +
    'miscellaneous tasks may be edited.';
  cTXT0000276 = 'Attempted to add the Task to the Work Order, but could not ' +
    'find the MRO Work Order (ID value %.0f)';
  cTXT0000277 = 'Remove the selected link?';
  cTXT0000278 = 'Abort processing?';
  cTXT0000279 = 'MRO Templates';
  cTXT0000280 = 'Failed to acquire shared lock.'#13#13 +
    'Update Capacity Schedule process is currently in progress. Please try ' +
    'again later';
  cTXT0000281 = 'Cannot unlock existing lock. Please terminate this ' +
    'application to give other users access.';
  cTXT0000282 = 'Req';
  cTXT0000283 = 'Avail';
  cTXT0000284 = 'From %s~Through %s';
  cTXT0000285 = 'Please specify a Start Date.';
  cTXT0000286 = 'Please select a View type.';
  cTXT0000287 = 'This option updates MRO Capacity Schedule. Are you sure ' +
    'you want to continue?';
  cTXT0000288 = 'Failed to acquire exclusive lock. Possible cause:  someone ' +
    'else (%s) is using MRO Capacity Schedule module. '#13'Please try ' +
    'again later.';
  cTXT0000289 = 'Failed to acquire exclusive lock. Possible cause:  someone ' +
    'else is using MRO Capacity Schedule module. '#13'Please try again later.';
  cTXT0000290 = 'Cannot to release exclusive lock. Terminate to allow other ' +
    'users to run MRO Capacity Schedule module';
  cTXT0000291 = 'Processing Work Order # %s ...';
  cTXT0000292 = 'The period is undefined.  Please click inside the grid to select a period.';
  cTXT0000293 = '<None>';
  cTXT0000294 = 'Please enter a Start Date.';
  cTXT0000295 = 'The Start Date must precede the End Date.';
  cTXT0000296 = 'Add employee to open MRO Work Orders for this job task?';
  cTXT0000297 = 'Modify employee on open MRO Work Orders for this job task?';
  cTXT0000298 = 'Delete employee from open MRO Work Orders for this job task?';
  cTXT0000299 = 'Service Work Order';
  cTXT0000300 = 'This MRO Work Order detail item is referenced by ' +
    'one or more CRM Support issues.  Cannot delete.';
  cTXT0000301 = 'Cannot show attached inventory.   ' +
    'Please close and reopen MRO Work Orders, then try again.';
  cTXT0000302 = 'Disposition Attached Inventory [%s : %s]';
  cTXT0000303 = 'Attached Inventory [%s : %s]';
  cTXT0000304 = 'Calculating disposition data.  Please wait.';
  cTXT0000305 = 'Service Date Out:  %s';
  cTXT0000306 = 'Service Date In:  %s';
  cTXT0000307 = 'Please select one or more Work Orders to archive.';
  cTXT0000308 = 'You are about to archive %d MRO ' +
    'work orders.  Are you sure you want to continue?';
  cTXT0000309 = 'Archiving MRO work order # %s';
  cTXT0000310 = 'Failed to Archive MRO work order # %s'#13 +
    'System is currently busy compressing a table ' +
    'and rebuilding associated indexes.  Please ' +
    'wait and try again later.'#13#13 + '%s';
  cTXT0000311 = 'Failed to Archive MRO work order # %s'#13#13'%s';
  cTXT0000312 = 'Posted General Journal';
  cTXT0000313 = 'Unposted General Journal';
  cTXT0000314 = 'On Order';
  cTXT0000315 = 'Order History';
  cTXT0000316 = 'MRO Work Orders';
  cTXT0000317 = 'Work Center References';
  cTXT0000318 = 'BOM References';
  cTXT0000319 = 'Project Manager References';
  cTXT0000320 = 'MRO Work Orders for Equipment Task';
  cTXT0000321 = 'SPC Gage/Device References';
  cTXT0000322 = 'Existing Purchase Orders';
  cTXT0000323 = 'Existing Purchase Orders by Vendor';
  cTXT0000324 = 'Activity Summary - %s.txt';
  cTXT0000325 = 'Please select a Work Order before choosing a Work Order task.';
  cTXT0000326 = 'Could not display Quick Add Labor:  %s';
  cTXT0000327 = 'This action will post the current batch to the system ' +
    'labor tables.  This batch will be deleted when the process finishes ' +
    'successfully.  This action is irreversible.'#13#13 +
    'Do you wish to continue?';
  cTXT0000328 = 'Press the Insert key (Ins) to add another record.';
  cTXT0000329 = 'The Batch header has not been created.'#13#13 +
    'You are trying to add detail for a batch that does not exist.  ' +
    'Please create a new batch first before adding labor information.';
  cTXT0000330 = 'Employee Number is required.  '#13#13 +
    'Please select an employee before trying to save this record.';
  cTXT0000331 = 'Work Order Number is required.  '#13#13 +
    'Please select a Work Order Number before trying to save this record.';
  cTXT0000332 = 'Work Order Task is required.  '#13#13 +
    'Please select a Work Order Task before trying to save this record.';
  cTXT0000333 = 'A value for Hours is required.  '#13#13 +
    'Please enter the employee''s hours before trying to save this record.';
  cTXT0000334 = 'The Work Order has changed.  Please select another Work ' +
    'Order Task before trying to save this record.';
  cTXT0000335 = 'Could not change Work Order task:  %s';
  cTXT0000336 = 'Encountered error posting batch # %d';
  cTXT0000337 = 'Restore the selected tasks?'#13#13'You have chosen to ' +
    'restore the selected tasks from an archived state.'#13#13'Do you ' +
    'wish to continue?';
  cTXT0000338 = 'Archive the selected tasks?'#13#13'You have chosen to ' +
    'archive the selected tasks.  This will clear any accumulated units ' +
    'and will remove them from the list of tasks that can be added to a ' +
    'work order.'#13#13'Do you wish to continue?';
  cTXT0000339 = 'Adding MRO records from Work Centers.  ' +
    'Please wait ...';
  cTXT0000340 = 'This Work order task has a Cost Source linked to a PO.  ' +
    'Would you like to continue?';
  cTXT0000341 = 'This Work order has one or more Cost Sources linked to a PO.  ' +
    'Would you like to continue?';
  cTXT0000342 = 'Open all tasks on the work order?';
  cTXT0000343 = 'Close all tasks on the work order?';
  cTXT0000344 = 'Delete (%d) records?';
  cTXT0000345 = 'One or more tasks could not be deleted because they are ' +
   'referenced by MRO Work Orders.';
  cTXT0000346 = 'A checklist has not been assigned to this task.';
  cTXT0000347 = 'A checklist cannot be assigned to this task.';
  cTXT0000348 = 'Do you wish to reload the checklist?  All modifications ' +
    'will be reset.';
  cTXT0000349 = 'Checklist has incomplete critical items.  Cannot close ' +
    'this task.';
  cTXT0000350 = 'Work Order contains open tasks that have incomplete ' +
    'critical items.  Cannot close tasks.';
  cTXT0000351 = 'Select from All Equipment';
  cTXT0000352 = 'Select from Associated Equipment';
  cTXT0000353 = 'Showing all equipment.  Click to show associated equipment.';
  cTXT0000354 = 'Showing associated equipment.  Click to show all equipment.';
  cTXT0000355 = 'Please select MRO Equipment.';
  cTXT0000356 = 'Calculating disposition data.  Please wait.';
  cTXT0000357 = 'Please enter a labor quantity:';
  cTXT0000358 = 'Selected Work Center %s will be linked to MRO ' +
    'Equipment %s.  Are you sure you want to continue?';
  cTXT0000359 = 'Do you want to update the MRO Equipment Task description?';
  cTXT0000360 = 'Update activity totals for all equipment?'#13 +
    'Although this process may take hours to complete, you may continue ' +
    'working or even close EnterpriseIQ while it runs in the background.';
  cTXT0000361 = 'Apply the date range (%s - %s) to all projects?';
  cTXT0000362 = 'WO Creation Threshold must be less than Perform Every (Actual).';
  cTXT0000363 = 'Item already exists.';
  cTXT0000364 = 'Clear checklist?';
  cTXT0000365 = 'Please enter a value greater than zero for Available Threshold.';
  cTXT0000366 = 'Please enter a value greater than zero for Booked Threshold.';
  cTXT0000367 = 'Please select a Work Order.';
  cTXT0000368 = 'Please select a Start Date.';
  cTXT0000369 = 'Are you sure you want to remove Work Order # %d from Capacity Schedule?';
  cTXT0000370 = '%s [ From %s To %s ]';
  cTXT0000371 = 'Please enter a quantity.';
  cTXT0000372 = 'Updated all MRO Equipment having UOM of "Days".';
  cTXT0000373 = 'SPC Inspection References';
  cTXT0000374 = '';
  cTXT0000375 = '';
  cTXT0000376 = '';
  cTXT0000377 = '';
  cTXT0000378 = '';
  cTXT0000379 = '';
  cTXT0000380 = '';
  cTXT0000381 = '';
  cTXT0000382 = '';
  cTXT0000383 = '';
  cTXT0000384 = '';
  cTXT0000385 = '';
  cTXT0000386 = '';
  cTXT0000387 = '';
  cTXT0000388 = '';
  cTXT0000389 = '';
  cTXT0000390 = '';
  cTXT0000391 = '';
  cTXT0000392 = '';
  cTXT0000393 = '';
  cTXT0000394 = '';
  cTXT0000395 = '';
  cTXT0000396 = '';
  cTXT0000397 = '';
  cTXT0000398 = '';
  cTXT0000399 = '';
  cTXT0000400 = '';

implementation

end.
