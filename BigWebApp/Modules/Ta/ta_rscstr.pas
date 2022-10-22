unit ta_rscstr;

interface

// ta_rscstr.cTXT0000208

resourcestring

   cTXT0000001 = 'You are already logged into the selected process.';
   cTXT0000002 = 'New Time Block for Employee # %s';
   cTXT0000003 = 'Please select a Pay Type.'; 
   cTXT0000004 = 'Total hours must be greater than zero.';
   cTXT0000005 = 'Please specify a value for Incentive Hours.';
   cTXT0000006 = 'Invalid badge number.';
   cTXT0000007 = 'Invalid employee number.';
   cTXT0000008 = 'Cannot log in.  Inactive or terminated employee.';
   cTXT0000009 = 'Inactive or terminated employee.';
   cTXT0000010 = 'Invalid supervisor number.';
   cTXT0000011 = 'Please select a Work Order number.';
   cTXT0000012 = 'Please select an Operation.';
   cTXT0000013 = 'Please select a shift.';
   cTXT0000014 = 'Invalid date range.  The starting date must precede the ending date.';
   cTXT0000015 = 'Invalid dates';
   cTXT0000016 = 'This process does not require Line Clearance.';

   cTXT0000017 = 'Error';
   cTXT0000018 = 'Warning';
   cTXT0000019 = 'Confirmation';
   cTXT0000020 = 'Information';
   
   cTXT0000021 = 'Invalid value for Hours';
   cTXT0000022 = 'Invalid value for Minutes';
   cTXT0000023 = 'Invalid value for Seconds'; 
   cTXT0000024 = 'Punch-In Clock'; 
   cTXT0000025 = 'Please assign a value for Regular or Overtime.'; 
   cTXT0000026 = 'Employee Badge'; 
   cTXT0000027 = 'Enter Employee Badge #'; 
   cTXT0000028 = 'Employee Number';
   cTXT0000029 = 'Enter Employee Number';
   cTXT0000030 = 'Please enter a Start Date.';
   cTXT0000031 = 'Clock OUT date and time must be greater than the Clock IN date and time.';
   cTXT0000032 = 'Cannot clock out in the middle of another interval.'; 
   cTXT0000033 = 'Do you want to delete all the Clock IN/OUTs for the selected employee?';
   cTXT0000034 = 'The employee already exists.'; 
   cTXT0000035 = 'Processed records are hidden. Click to show.'; 
   cTXT0000036 = 'Click to hide processed records.'; 
   cTXT0000037 = 'Please enter reason for the adjustment';
   cTXT0000038 = 'Adjustment Reason';
   cTXT0000039 = '%d days, %d hrs, %f mins'; 
   cTXT0000040 = '%d hrs, %f mins'; 
   cTXT0000041 = '%d hrs, %d:%d mins'; 
   cTXT0000042 = 'Please select an employee.'; 
   cTXT0000043 = 'Load Original SQL'; 
   cTXT0000044 = 'Load original SQL'; 
   cTXT0000045 = 'Execute SQL'; 
   cTXT0000046 = 'No SQL script found.'; 
   cTXT0000047 = 'No control records marked.'; 
   cTXT0000048 = 'Output set is saved to file, %s. Do you wish to mark ' +
     'corresponding  Clock In/Outs as "Processed."';
   cTXT0000049 = 'Clock In/Outs marked'; 
   cTXT0000050 = 'Output set is saved to file, %s'; 
   cTXT0000051 = 'Filter: Shift %s';
   cTXT0000052 = 'Filter: Department %s';
   cTXT0000053 = 'Filter: PayType %s'; 
   cTXT0000054 = 'Filter: PayGroup %s'; 
   cTXT0000055 = 'Production Dates %s - %s'; 
   cTXT0000056 = 'Do you want to mark the selected reviewed records?'; 
   cTXT0000057 = 'Do you want to unmark the selected records?'; 
   cTXT0000058 = 'No default script found.'; 
   cTXT0000059 = 'For %s';
   cTXT0000060 = 'Employee: %s';
   cTXT0000061 = 'Employee #: %s';
   cTXT0000062 = 'Please specify a start time.'; 
   cTXT0000063 = 'Cannot start time block in the middle of another time block.'; 
   cTXT0000064 = 'Delete time block?'; 
   cTXT0000065 = 'Delete all time blocks for this Employee?'; 
   cTXT0000066 = 'Delete Time Blocks Prior to %s';
   cTXT0000067 = 'Delete Time Blocks After %s';
   cTXT0000068 = 'Delete all time blocks for this Employee before %s?'; 
   cTXT0000069 = 'Delete all time blocks for this Employee after %s?';
   cTXT0000070 = 'Exclude weekends for %s?';
   cTXT0000071 = 'Exclude weekends for all employees?';
   cTXT0000072 = 'Exclude holidays for %s?';
   cTXT0000073 = 'Exclude holidays for all amployees?';
   cTXT0000074 = 'No records filtered'; 
   cTXT0000075 = 'Filter: Shift %s'; 
   cTXT0000076 = 'Filter: Department %s'; 
   cTXT0000077 = 'Filter: Pay Type %s'; 
   cTXT0000078 = 'Filter: Pay Group %s'; 
   cTXT0000079 = 'Click Finish to log out.'; 
   cTXT0000080 = 'Total Good Parts and Rejects is less than Work Order quantity. Continue?'; 
   cTXT0000081 = 'Click Finish to update Good Parts and log out.'; 
   cTXT0000082 = 'Please specify a value for Incentive Hours.'; 
   cTXT0000083 = 'Specify a date range by selecting a "From" and "To" date.'; 
   cTXT0000084 = 'The Start date must precede the End date.  Please check your date range.';
   cTXT0000085 = '%d employees selected'; 
   cTXT0000086 = 'All employees selected';
   cTXT0000087 = '%s pay group selected';
   cTXT0000088 = '%s  shift selected';
   cTXT0000089 = '%s department selected';
   cTXT0000090 = 'Update in progress.  Cannot close form.'; 
   cTXT0000091 = '%s pay type selected'; 
   cTXT0000092 = 'Done posting to payroll.  Delete records?'; 
   cTXT0000093 = 'Clock OUT time must be greater than the Clock IN'; 
   cTXT0000094 = 'Invalid Task ID'; 
   cTXT0000095 = 'Processed records are hidden. Click to show.'; 
   cTXT0000096 = 'Click to hide processed records.';
   cTXT0000097 = 'Delete all unposted Tasks Clock IN/OUTs for the selected employee?'; 
   cTXT0000098 = 'Employee already exists.'; 
   cTXT0000099 = 'Please assign Source.'; 
   cTXT0000100 = 'Task ID';
   cTXT0000101 = 'Enter Task ID';
   cTXT0000102 = 'Please assign either a Regular or Overtime Pay Type.'; 
   cTXT0000103 = 'Do you want to calculate Employee/Task hours?'#13#13 +
     'Clock IN/OUTs with differences of less than 2 seconds will be deleted.';
   cTXT0000104 = 'Do you want to calculate Employee/Task hours?'#13 +
     'All manual adjustments will be overridden.  Clock IN/OUTs with ' +
     'differences of less than 2 seconds will be deleted.';
   cTXT0000105 = 'Calculate regular and overtime Employee/Task hours?'; 
   cTXT0000106 = 'User-defined tasks are hidden. Click to show.';
   cTXT0000107 = 'Click to hide user-defined records.';
   cTXT0000108 = 'Tasks Clock IN/OUT %s';
   cTXT0000109 = 'Work order %s is stopped for production. Cannot log in.';
   cTXT0000110 = 'Line is not cleared for this Work Order number, Process number and Shift.'; 
   cTXT0000111 = 'Cannot login. Work Order is not scheduled.';
   cTXT0000112 = 'Cannot login. Process # %s was not completed.';
   cTXT0000113 = 'Document %s. %s ';
   cTXT0000114 = 'You have not clocked IN. Please use the Punch-In Clock to clock in.';
   cTXT0000115 = 'Clock OUT of ALL your tasks?'; 
   cTXT0000116 = 'Please select a task.';
   cTXT0000117 = 'Invalid Source'; 
   cTXT0000118 = 'Do you want to clock out of this task?'; 
   cTXT0000119 = 'Only one global message allowed.';
   cTXT0000120 = 'Please enter a Source ID.'; 
   cTXT0000121 = 'Please check either "On Clock in" or "On Clock out."';
   cTXT0000122 = 'Display Time must be a positive number';
   cTXT0000123 = 'No header record found.  Please assign a header record.';
   cTXT0000124 = 'Edit Shift';
   cTXT0000125 = 'New Shift';
   cTXT0000126 = 'Shift %s already exists'; 
   cTXT0000127 = 'Group Time Blocks [Shift: %s]';
   cTXT0000128 = 'Consider all the hours worked over the regular maximum as ' +
   'overtime, regardless of the number of days in the Weekly/Biweekly ' +
   'setting for the period being calculated.';
   cTXT0000129 = 'Pay Rules for %s %s [%s]'; 
   cTXT0000130 = 'Current Percent Complete for Project Task - %s = %.2f';
   cTXT0000131 = 'Percentage cannot be negative';
   cTXT0000132 = 'Percentage cannot exceed 100.'; 
   cTXT0000133 = 'Do you want to exclude weekends from %s?';
   cTXT0000134 = 'Selected Shift: %s';
   cTXT0000135 = 'Setting: %s'; 
   cTXT0000136 = 'Delete shift %s?'; 
   cTXT0000137 = 'Please specify a start time.'; 
   cTXT0000138 = 'Cannot start shift time block in the middle of another time block'; 
   cTXT0000139 = 'Start Time: %s';
   cTXT0000140 = 'Enter duration of the shift pattern (Shift %s)'; 
   cTXT0000141 = 'Cannot end shift time block in the middle of another time block'; 
   cTXT0000142 = 'Delete shift time block?'; 
   cTXT0000143 = 'No shift time blocks defined.';
   cTXT0000144 = 'No shifts assigned to calendar';
   cTXT0000145 = 'Do you want to exclude weekends from all shifts?'; 
   cTXT0000146 = 'Do you want to exclude holidays from %s?'; 
   cTXT0000147 = 'Do you want to exclude holidays from all shifts?'; 
   cTXT0000148 = 'Do you want to delete shift time blocks?'; 
   cTXT0000149 = '%s paygroup selected';
   cTXT0000150 = '%s shift selected';
   cTXT0000151 = 'List of employees with 0 (zero) Total Hours';
   cTXT0000152 = 'Unassign TA settings';
   cTXT0000153 = 'Unassign shift';
   cTXT0000154 = 'Unassign Pay Groups';
   cTXT0000155 = 'Unassign Pay Types';
   cTXT0000156 = 'Unassign the selected employees?'; 
   cTXT0000157 = 'Vacations and Absences (%s)'; 
   cTXT0000158 = 'Please assign a Start Time';
   cTXT0000159 = 'Please assign an End Time';
   cTXT0000160 = 'The Start or End Time conflicts with other times.'; 
   cTXT0000161 = 'After Process Procedure (Not Assigned)';
   cTXT0000162 = 'After Process Procedure (%s)'; 
   cTXT0000163 = 'Please assign default pay type for regular hours.';
   cTXT0000164 = 'Please assign default pay type for overtime hours';
   cTXT0000165 = 'Total hours must be greater than zero.'; 
   cTXT0000166 = 'Filter: Shift %s';
   cTXT0000167 = 'Filter: Department %s';
   cTXT0000168 = 'Filter: Pay Type %s';
   cTXT0000169 = 'Filter: Pay Group %s'; 
   cTXT0000170 = 'Select Employee(s)'; 
   cTXT0000171 = 'Do you wish to calculate corresponding shifts to clock IN/OUTs?'#13 +
   'Estimated processing time is %f minutes.';
   cTXT0000172 = 'Processing.  Please wait.'; 
   cTXT0000173 = 'Processing %.0f/%.0f.  Please wait.';
   cTXT0000174 = 'After Process Procedure';
   cTXT0000175 = 'Enter a name for the after process procedure';
   cTXT0000176 = 'After Process Procedure (Not Assigned)';
   cTXT0000177 = 'After Process Procedure (%s)';
   cTXT0000178 = 'Calculate';
   cTXT0000179 = 'Calculate Hours';
   cTXT0000180 = 'Please select a production date.';
   cTXT0000181 = 'Please enter holiday hours.';
   cTXT0000182 = 'Please select holiday pay type.';
   cTXT0000183 = 'Employee #'; 
   cTXT0000184 = 'The Start date and time must precede the End date and time.  ' +
    'Please check your date and time range.';
   cTXT0000185 = 'Clock I/O mismatch'; 
   cTXT0000186 = 'Assign Shift Calendar (%s)'; 
   cTXT0000187 = '%s already exists.'#13'Do you want to replace it?'; 
   cTXT0000188 = 'Script saved to file, %s';
   cTXT0000189 = 'Do you want to overwrite the existing script?';
   cTXT0000190 = 'Procedure created';
   cTXT0000191 = 'The first line of each procedure script must begin with, ' +
    'CREATE OR REPLACE TA_VIOL_Name.  The procedure name must be unique, and ' +
    'it must accept three parameters:  (v_emp_id number, v_prod_date date, ' +
    'v_type number).  Once the script is completed, select Create ' +
    'Procedure to update the database.';
   cTXT0000192 = 'Accessing Prepost Log by Employee.  Please wait.';
   cTXT0000193 = 'Accessing Employee Clock IN/OUT.  Please wait.';
   cTXT0000194 = 'Accessing Attendance Violations.  Please wait.';
   cTXT0000195 = 'Accessing Holidays.  Please wait.'; 
   cTXT0000196 = 'Accessing Incentive Pay Selection Criteria.  Please wait.'; 
   cTXT0000197 = 'Accessing Incentive Pay.  Please wait.'; 
   cTXT0000198 = 'Accessing Employee/Task Messages.  Please wait.'; 
   cTXT0000199 = 'Accessing Pay Rules.  Please wait.'; 
   cTXT0000200 = 'Accessing database.  Please wait.';
   cTXT0000201 = 'Accessing Time and Attendance Prepost Log.  Please wait.'; 
   cTXT0000202 = 'Accessing Time and Attendance Settings.  Please wait.'; 
   cTXT0000203 = 'Accessing Shifts.  Please wait.'; 
   cTXT0000204 = 'Accessing Employee/Tasks Clock IN/OUT Maintenance.  Please wait.'; 
   cTXT0000205 = 'Accessing Violations Scripts.  Please wait.'; 
   cTXT0000206 = 'Please choose one of the options to select employees'; 
   cTXT0000207 = 'Unable to proceed'; 
   cTXT0000208 = 'Click Finish to update good parts.';
   cTXT0000209 = 'You are positioned on an Process/Operation (%s) which is not the one you are logging into (%s). Please select the correct process/operation.';
   cTXT0000210 = 'The selection list cannot contain more than a 1000 records. Please refine your selection'; 
   cTXT0000211 = 'Do you wish do delete marked records?';
   cTXT0000212 = 'Total Good Parts is greater than Work Order quantity. Continue?';
   cTXT0000213 = 'Reviewed Violations are hidden. Click to Show';
   cTXT0000214 = 'Click to hide reviewed records';
   cTXT0000215 = 'Execute SQL – Checks Select Statements Only'; 
   cTXT0000216 = 'Employee %s (%s, %s)'; 
   cTXT0000217 = 'Work order is associated to a JobShop project.  You will be clocked into a ‘JS’ task class.  Are you sure you would like to continue?'; 
   cTXT0000218 = 'Editing own time card is not allowed.'; 
   cTXT0000219 = 'This task is associated to a different EPlant than the user clocking into it. Would you like to continue?'; 
   cTXT0000220 = 'This task is associated to a different EPlant than the user clocking into it and was not processed.'; 
   cTXT0000221 = 'Cannot clock into an archived PM Work Order.'; 
   cTXT0000222 = 'This task is associated to an archived PM Work Order. Would you like to continue?'; 
   cTXT0000223 = '%d days, %d hrs, %d mins'; 
   cTXT0000224 = 'There are pending certification training tests required for this %s.  Would you like to take the test now?';
   cTXT0000225 = 'IIS Server settings have not been configured in System Parameters.  Cannot display page.';
   cTXT0000226 = 'Retry Certification Test?';
   cTXT0000227 = 'Work Order';
   cTXT0000228 = 'Process';
   cTXT0000229 = 'User must be selected to proceed.  Operation aborted.';
   cTXT0000230 = '%d hrs, %d mins'; 
   cTXT0000231 = 'Invalid Clock IN/OUT range found - correct or delete the record.'; 
   cTXT0000232 = 'JobShop project %s has been archived - operation aborted.'; 

   cTXT0000233 = 'Do you want to calculate Employee/Task hours?';
   cTXT0000234 = 'Do you want to calculate Employee/Task hours?'#13 +
                 'All manual adjustments will be overridden.';
                 
   cTXT0000235 = 'Invalid Clock IN/OUT range found - correct or delete selected record.';
   cTXT0000236 = 'Invalid number';
   cTXT0000237 = 'Clock In as Setup?';
   cTXT0000238 = 'Sorted by'; 
   cTXT0000239 = 'Please select a record.'; 
   cTXT0000240 = 'Please select a Default Pay Type.'; 
   cTXT0000241 = 'Please select a Pay Type to be assigned'; 
   cTXT0000242 = 'Done.'; 
   cTXT0000243 = 'Report GoodParts/Rejects?'; 
   cTXT0000244 = 'Operator clocked out at %s'; 
   cTXT0000245 = 'Operator clocked out at %s'#13#13 + 'Standard Labor Hours: %s'#13 + 'Actual Labor Hours: %s';
   cTXT0000246 = 'Formula Missing in %s Paytype'; 
   cTXT0000247 = 'Charge Rate missing.  Emp# [%s]'; 
   cTXT0000248 = 'Badge #'; 
   cTXT0000249 = 'Employee #'; 
   cTXT0000250 = 'Invalid Clock IN/OUT range found (click Yes to Delete, Abort to Correct, Ignore - Continue without Correcting or Deleting).'; 
   cTXT0000251 = 'Task ID can not be empty.';

implementation

end.
