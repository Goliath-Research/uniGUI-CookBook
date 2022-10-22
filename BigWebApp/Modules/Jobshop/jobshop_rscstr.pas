unit jobshop_rscstr;

interface

resourcestring

   // jobshop_rscstr.cTXT0000063

   cTXT0000001 = 'Started';
   cTXT0000002 = 'Pending';
   cTXT0000003 = 'Started, WO not found or archived';
   cTXT0000004 = 'This option creates a backup of currently scheduled workorders, ' +
                 'deletes all of them outside the time fence and reloads all outstanding '+
                 'workorders back based on Runs The Best information'#13#13+
                 'Do you wish to run Auto Load now?';
   cTXT0000005 = 'Auto Load in progress. Please wait...';
   cTXT0000006 = 'This option creates a backup of currently scheduled workorders starting from pos 2 and on'#13#13+
                 'Do you wish to continue?';
   cTXT0000007 = 'This option restores previously backedup scheduled workorders starting from pos 2 and on'#13#13+
                 'Do you wish to continue?';
   cTXT0000008 = 'Do you want to delete routing steps associated with this project?';
   cTXT0000009 = 'Picklist';
   cTXT0000010 = 'Project must be associated with a routing diagram';
   cTXT0000011 = 'You must detach the project from associated sales order before unassigning Routing Diagram';
   cTXT0000012 = 'Please note that during roll over, the Standard Price (%.6f) will be set to the Quote Total (%.6f).';
   cTXT0000013 = 'Future Cost has not been rolled over to the Standard Cost.';
   cTXT0000014 = 'Would you like to roll over calculated Future Cost now?';
   cTXT0000015 = 'This JobShop Quote must first be converted to an Open Project before associating it with a Sales Order. Would you like to convert it now?';
   cTXT0000016 = 'Quote was not converted to an Open Project';
   cTXT0000017 = 'Closed PO Information'         ;
   cTXT0000018 = 'Open PO Information'           ;
   cTXT0000019 = 'Archived PO Information'       ;
   cTXT0000020 = 'Posted AP Information'         ;
   cTXT0000021 = 'Unposted AP Information'       ;
   cTXT0000022 = 'Cash Disbursements Information';
   cTXT0000023 = 'Posted AR Information'         ;
   cTXT0000024 = 'Unposted AR Information'       ;
   cTXT0000025 = 'Cash Received Information'     ;
   cTXT0000026 = 'Edit Note';
   cTXT0000027 = 'Project ID = %.0f was deleted.  Aborting tasks update. Program will continue normally now'; 
   cTXT0000028 = 'Missing Item Information - unable to continue';
   cTXT0000029 = 'Request Date is missing - unable to continue' ;
   cTXT0000030 = 'Qty is missing - unable to continue'          ;
   cTXT0000031 = '     Progress %d%%';
   cTXT0000032 = 'There are no workorders associated with this project';
   cTXT0000033 = 'JobShop - View All Projects';
   cTXT0000034 = 'JobShop - View Open Projects';
   cTXT0000035 = 'JobShop - View Archived Projects';
   cTXT0000036 = 'JobShop - View Quote Projects';
   cTXT0000037 = 'JobShop - View Started Projects';
   cTXT0000038 = 'Archive this JobShop project?';
   cTXT0000039 = 'Restore this archived JobShop project?';
   cTXT0000040 = 'Convert this JobShop Quote to an Open Project?';
   cTXT0000041 = 'Status';
   cTXT0000042 = 'This option checks and creates new workorders, or associates existing workorders and toggles them to FIRM. ' +
                 'This action is irreversible.'#13#13'Are you sure you wish to start this project? ';
   cTXT0000043 = 'Missing sales order information';
   cTXT0000044 = 'No sales order releases found';
   cTXT0000045 = 'Detail information is unavailable for this bucket.';
   cTXT0000046 = 'Select Task for Project # %s';
   cTXT0000047 = '"Not Filtered"';
   cTXT0000048 = 'Please select a Project# before choosing a task.';
   cTXT0000049 = 'Cannot find selected record.';
   cTXT0000050 = 'Employee Number is required.  '#13#13 +
                 'Please select an employee before trying to save this record.';
   cTXT0000051 = 'Employee Number was specified. A value for labor hours is required.  '#13#13 +
                 'Please enter labor hours before trying to save this record.';
   cTXT0000052 = 'Project# is required.  '#13#13 +
                 'Please select a Project# before trying to save this record.';
   cTXT0000053 = 'Task is required.  '#13#13 +
                 'Please select a Task before trying to save this record.';
   cTXT0000054 = 'A value for labor or workcenter hours is required.  '#13#13 +
                 'Please enter labor and/or workcenter hours before trying to save this record.';
   cTXT0000055 = 'Project # and Task selected do not match.'; 
   cTXT0000056 = 'Percent of completed work must be an Integer number'; 
   cTXT0000057 = 'The Batch header has not been created.'#13#13 +
                 'You are trying to add detail for a batch that does not exist.  ' +
                 'Please create a new batch first before adding labor information.';
   cTXT0000058 = 'Please select a Project # before choosing a task.';
   cTXT0000059 = 'Select Task for Project # %s';
   cTXT0000060 = 'This action will post the current batch to the system labor tables.  ' +
                 'This batch will be deleted when the process finishes successfully.  ' +
                 'This action is irreversible.'#13#13 +
                 'Do you wish to continue?';
   cTXT0000061 = 'This action will post all batches to the system labor tables.  ' +
                  'Each batch will be deleted when the process finishes successfully.  ' +
                  'This action is irreversible.'#13#13 +
                  'Do you wish to continue?';
   cTXT0000062 = 'Processing Batch ID = %.0f';
   cTXT0000063 = 'Enter work center hours. Based on selected '#13+
                 'task the work center rate is: %.2f / hr';
   cTXT0000064 = 'This option allows to restart the project by picking/creating a new workorder.'#13#13+
                 'Are you sure you want to continue?';
   cTXT0000065 = 'Missing Qty and/or Release Date'; 
   cTXT0000066 = ''; 
   cTXT0000067 = ''; 
   cTXT0000068 = ''; 
   cTXT0000069 = ''; 
   cTXT0000070 = ''; 
   cTXT0000071 = ''; 
   cTXT0000072 = ''; 
   cTXT0000073 = ''; 
   cTXT0000074 = ''; 
   cTXT0000075 = ''; 
   cTXT0000076 = ''; 
   cTXT0000077 = ''; 
   cTXT0000078 = ''; 
   cTXT0000079 = ''; 
   cTXT0000080 = ''; 


implementation

end.
