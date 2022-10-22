unit IQMS.Common.ResStrings;

{ Purpose:  Contains resource string constants to be used for all IQShare units.

  Note:     If you modify an IQShare unit (.pas) by adding an embedded string
            (such as for a prompt or error), update this unit also and call the
            resourcestring constant instead.

            Also, before changing a string here, search \IQWin directories for
            areas it may already be used.  If you change it here, you change it
            everywhere. }
            

interface

// iqshare_rscstr.cTXT0000411

resourcestring
   cTXT0000001 = 'Unable to hook to Windows mouse and/or keyboard events.';
   cTXT0000002 = 'Select Directory';
   cTXT0000003 = 'Delete'; // no punctuation; begins prompt "Delete" + some text + "?"
   cTXT0000004 = '&OK';
   cTXT0000005 = 'Invalid Number';
   cTXT0000006 = 'Cannot log in. Inactive or terminated employee.';
   cTXT0000007 = 'Inactive or terminated employee.';
   cTXT0000008 = 'There are %d task(s) which have not been closed yet.'#13 +
                 'Do you wish to clock out, closing all of them?';
   cTXT0000009 = 'You have not clocked out.';
   cTXT0000010 = 'Not all parts are dispositioned against work order tasks. You have not clocked out.';
   cTXT0000011 = 'The "clock in" time was greater than the "clock out" time.';
   cTXT0000012 = 'Employee:';
   cTXT0000013 = 'Employee'; // no colon
   cTXT0000014 = 'Time Clock Summary';
   cTXT0000015 = 'Invalid badge number.';
   cTXT0000016 = 'Invalid employee number.';

   cTXT0000017 = 'DARTNET Viewer Name is not setup - unable to continue';
   cTXT0000018 = 'DARTNET command line parameter is not setup - unable to continue';
   cTXT0000019 = 'DARTNET status file parameter is not setup - unable to continue';
   cTXT0000020 = 'DARTNET Graphic Name parameter is not setup - unable to continue';
   cTXT0000021 = 'Unable to start up %s. Error Code = %d'; // refers to DartWin
   cTXT0000022 = 'Unable to establish collector name for work center %s in the DART Status File';
   cTXT0000023 = 'Unable to establish collector name for the work center.'#13#13+
                 'Need to add Machine Name = %s to DartNet System. (Use WorkCenter Information)';
   cTXT0000024 = 'Cannot find work center %s in the RealTime table';
   cTXT0000025 = 'Cannot find the work center in the RealTime table [work center ID = %.0f]';
   cTXT0000026 = 'Cannot establish collector name for work center %s in the DART Status File.';
   cTXT0000027 = 'Cannot establish collector name for the work center.'#13#13+
                 'Need to add Machine Name = %s to DartNet System. (Use WorkCenter Information)';
   cTXT0000028 = 'Unable to establish collector name for configuration# %s in the DART Status File';

   cTXT0000029 = 'Invalid scope.  Please re-enter.';
   cTXT0000030 = 'The "From Date" is greater than the "To Date."  Please select different values.';

   cTXT0000031 = 'Failed to acquire exclusive lock on %s resource. Please try again later.';
   cTXT0000032 = ' - Unable to release previously acquired resource lock. Please terminate the application and try again';
   cTXT0000033 = 'Table/View - Access Denied.';
   cTXT0000034 = 'Table/View - Insufficient Rights.';
   cTXT0000035 = 'Failed to lock application handle in shared mode.'#13#13'You are logged as IQMS.  Proceed with caution.';
   cTXT0000036 = 'Unable to run application.'#13#13'The database may be locked exclusively by a DBA for data structure modifications.';
   cTXT0000037 = 'Table/View - Duplicated Key.  Re-enter a unique key.';
   cTXT0000038 = 'Abort changes?';
   cTXT0000039 = 'Please contact IQMS, Inc. to verify the license agreement.';
   cTXT0000040 = 'Please run Update from IQStatus.'#13'IQStatus can be found in the EnterpriseIQ Program Group.';
   cTXT0000041 = '%s must be invoked from the local home directory, %s.'#13#13+
                 'You attempted to invoke the program from %s';
   cTXT0000042 = ' - Unable to proceed';

   cTXT0000043 = 'Edit';
   cTXT0000044 = 'View Text (Read Only)';
   cTXT0000045 = 'Text Length: %d / %d ';
   cTXT0000046 = 'Memo';
   cTXT0000047 = 'Modified';
   cTXT0000048 = 'Word Count: %d';
   cTXT0000049 = 'Do you want to open the new file now?';
   cTXT0000050 = 'Append file contents?'#13#13 +
                 'Click "Yes" to append file contents as text.'#13 +
                 'Click "No" to append the file name(s).'#13 +
                 'Click "Cancel" to abort the process.';
   cTXT0000051 = 'User ''%s'' Login in Progress ...';
   cTXT0000052 = 'Authenticating User, %s ...';
   cTXT0000053 = 'Access denied. Cannot log into %s.'#13#13'Please check your user name or password.';
   cTXT0000054 = 'Access denied. Please have your DBA grant you appropriate access roles and rights.';
   cTXT0000055 = 'Insufficient Rights. Please have your DBA grant you appropriate access roles and rights.';
   cTXT0000056 = 'Unable to log in.  Invalid username or password.'#13 +
                 'Contact Database Administrator to verify or refresh log in information.';
   cTXT0000057 = 'Unable to login using alias, %s';
   cTXT0000058 = 'Your EnterpriseIQ password expires in %d day(s). '+
                 'You need to change the password before the expiration date.'#13#13+
                 'Would you like to change your password now?';

   cTXT0000059 = 'Update finished with errors.';
   cTXT0000060 = 'Update finished with %d files successfully updated.';
   cTXT0000061 = 'Update finished with no out-of-date executables or DLLs found.';
   cTXT0000062 = 'Unable to locate IQMS Master Home directory, %s. Check your network and drive mappings.';
   cTXT0000063 = 'Unable to locate IQMS Local Home directory, %s. Check your network and drive mappings.';
   cTXT0000064 = 'Unable to locate main executable file, IQWIN32.EXE.';
   cTXT0000065 = 'Unable to copy %s to %s. Error Code: %d';
   cTXT0000066 = 'Abort update?';
   cTXT0000067 = 'The Registry Key, %s, has not been created. Would you like to create it now?';
   cTXT0000068 = 'IQMS Directories';
   cTXT0000069 = 'Enter a value for key, %s';
   cTXT0000070 = 'The Registry key, %s, has not been configured. Use the current directory, %s, instead?';

   cTXT0000071 = 'Cannot post to a closed period.'#13 +
                 'Use the Define Periods option on the GL Account Maintenance '#13 +
                 'form to change the period status.';

   cTXT0000072 = 'Unrecognized image.  Cannot print.';
   cTXT0000073 = 'Check Point List (%s)';
   cTXT0000074 = 'Are you sure you want to clear log file?';
   cTXT0000075 = 'Unable to write to file, %s. Encountered Error: %s';
   cTXT0000076 = 'Log file, %s, was renamed to, %s';
   cTXT0000077 = 'Unable to rename log file %s to %s';

   cTXT0000078 = 'Executing.  Please wait...';
   cTXT0000079 = 'Unable to change directory to %s. ErrCode = %d.'#13#13'Program execution will continue in %s.';
   cTXT0000080 = 'Accessing %s.%s.  Please wait...';
   cTXT0000081 = 'Unable to synchronize %s with master home directory. Aborting operation ...';
   cTXT0000082 = 'Please note:  The current Security Inspector is going to be closed ' +
                 'and %s is going to be assigned its own Security Inspector.'#13#13 +
                 'You will need to re-select the security role before making changes.';
   cTXT0000083 = 'Unable to install OLE Automation Server, %s. Error Code = %d';
   cTXT0000084 = 'Unable to find master file %s to create a local copy of %s';
   cTXT0000085 = 'Copying %s from master directory.  Please wait...';
   cTXT0000086 = 'Unable to find the file, %s, to invoke or register the OLE Automation Server, %s';

   cTXT0000087 = 'While processing item, %s, (IN-Tran) the following mismatch occured:'#13#13 +
                 'Work Center, %s, is assigned default dispo location, %s.   However, ' +
                 'this location is not available for division, %s.  '#13#13 +
                 'Work Center default dispo location is ignored and default '+
                 'location, %s, based on division mentioned above is used instead';
   cTXT0000088 = 'While processing item, %s, (OUT-Tran) the following mismatch occured:'#13+
                 'Work Center, %s, is assigned default dispo location, %s.  However, ' +
                 'this location is not available for division, %s.'#13#13+
                 'Work Center default dispo location is ignored and default ' +
                 'location, %s, based on division mentioned above is used instead.';
   cTXT0000089 = 'No default shipping location found in Master Location table. Operation aborted.';
   cTXT0000090 = 'Unable to set local time. Error Code = %d';

   cTXT0000091 = '%d day, '; // used as part of datetime string in IQDate
   cTXT0000092 = 'The Days field is empty for the Terms Code used.  Please correct and retry.';
   cTXT0000093 = 'Your time zone %s could not be located in the Oracle Time Zone list. '  +
                 'Your local date and time will be used for all changes to the database. '+
                 'Processes will now continue normally.';
   cTXT0000094 = 'Unable to determine Time Zone Information. Error Code = %d';

   cTXT0000095 = 'Email address required.';
   cTXT0000096 = 'Invalid Path: %s';
   cTXT0000097 = 'Unable to Create Directory: %s';
   cTXT0000098 = 'Unable to delete file, %s. Error Code: %d';
   cTXT0000099 = 'Unable to copy %s to %s. Error Code: %d';
   cTXT0000100 = 'Copy to %s Failed. Please retry later.';
   cTXT0000101 = 'No files copied to %s';
   cTXT0000102 = '%d files have been copied to %s.';
   cTXT0000103 = 'Unable to resolve directory, %s.';
   cTXT0000104 = 'Unable to Create directory, %s.';
   cTXT0000105 = 'Unable to change %s timestamp. Error Code = %d';
   cTXT0000106 = 'Unable to open file %s';

   cTXT0000107 = 'Edit Document';
   cTXT0000108 = 'Save your changes?';
   cTXT0000109 = 'Document';
   cTXT0000110 = 'Save changes to %s?';
   cTXT0000111 = 'Clear current document?';
   cTXT0000112 = 'Overwrite current document?';
   cTXT0000113 = 'Internal Documents should not exceed 30 Kilobytes if running ' +
                 'Oracle 7.3.4 on Windows NT server.'#13#13'Do you wish to continue?';
   cTXT0000114 = 'Do you wish to overwrite %s?';
   cTXT0000115 = 'Cannot insert a bitmap file into an open text document.'#13 +
                 'Use Open File instead.';
   cTXT0000116 = '%s not found.';
   cTXT0000117 = 'Shrink Image';
   cTXT0000118 = 'Stretch Image';
   cTXT0000119 = 'Word Count: %d';
   cTXT0000120 = 'IQEditor has completed its search of the document and has made %d replacements.';

   cTXT0000122 = 'Information'; // must be the same as IQInfoBox default param for ACaption
   cTXT0000123 = 'Name';     // must be the same as IQInfoBox default param
   cTXT0000124 = 'Value';    // must be the same as IQInfoBox default param

   cTXT0000125 = 'File, %s, not found';
   cTXT0000126 = 'Abort processing?';
   cTXT0000127 = '%d Records Appended';

   cTXT0000128 = 'Unable to get next ID key for table, %s.';
   // cTXT0000129 = 'Unable to open Query. SQL expression: ';
   cTXT0000129 = 'SQL expression: '#13;
   cTXT0000130 = 'Unable to open Quantity Price Breaks query.';
   cTXT0000131 = 'Unable to open Standard Operation Labor query.';
   cTXT0000132 = 'Unable to open Standard Operation OH query.';
   cTXT0000133 = 'Unable to open Standard Operation Material query.';
   cTXT0000134 = 'Unable to open Standard Operation Outsourced query.';
   cTXT0000135 = 'Unable to get default Quantity/Price Breaks.';

   cTXT0000136 = 'Accessing database.  Please wait ...';
   cTXT0000137 = 'Accessing database (%s) ...';

   cTXT0000138 = 'The table, %s, is inactive.';
   cTXT0000139 = 'The table, %s, is unavailable';
   cTXT0000140 = 'Cannot refresh dataset.';
   cTXT0000141 = 'Please note: EPlant suffix is not assigned for EPlant, %s [%.0f]'#13#13'Abort processing?';

   cTXT0000142 = 'The name of the executable file, %s, has been altered.  Terminating the program...';
   cTXT0000143 = 'You are licensed to use %0.f EPlants; however, %0.f are found to be in use by the system.'#13#13+
                 'To avoid future interruption and continue using the software please contact IQMS, Inc. to ' +
                 'verify the license agreement.';

   cTXT0000144 = 'Do not show next time';
   cTXT0000145 = 'SQL Query'; // form caption
   cTXT0000146 = 'Table = %s, ID = %.0f';

   cTXT0000147 = 'Launching application.  Please wait...';
   cTXT0000148 = 'Time expired waiting for application %s to setup mutex %s handshake.';
   cTXT0000149 = 'A valid user name must be selected.';
   cTXT0000150 = 'Cannot delete yourself while logged on.';
   cTXT0000151 = 'Are you sure you want to delete user, %s?';

   cTXT0000152 = 'Unable to determine Application Server.  The URL, %s, is an unknown database name.';
   cTXT0000153 = 'The Application Server URL is unassigned';
   cTXT0000154 = 'Unable to find database alias %s';
   // cTXT0000155 = 'Database connection was closed and reopen to reset open cursors. Dataset count: %d';
   cTXT0000155 = 'Database connection was closed and reopened. Dataset count: %d';

   cTXT0000156 = 'Invalid email address: %s';
   cTXT0000157 = 'Accessing application, %s ...';

   cTXT0000158 = 'Abort?';
   cTXT0000159 = 'Close';

   cTXT0000160 = 'No default report assigned in System Parameters. Please assign a default report.';
   cTXT0000161 = 'Report, %s, not found. Please check the report name.';

   cTXT0000162 = 'Encountered error while retrieving record count [IQRecordCount()]:'#13#13'%s';
   cTXT0000163 = 'Error executing procedure, CloseRBS:  %s';
   cTXT0000164 = 'Terminating RB Segment, %s...';
   cTXT0000165 = 'Error executing procedure, DropRBS:  %s';
   cTXT0000166 = 'Error executing procedure, OpenRBS:  %s';
   cTXT0000167 = 'Creating RB Segment, %s...';
   cTXT0000168 = 'Error executing procedure, CreateRBS:  %s';
   cTXT0000169 = 'Error executing procedure, OnLine:  %s';
   cTXT0000170 = 'Unable to associate the current transaction with the RB name, %s.'#13#13'%s';
   cTXT0000171 = 'Unable to find database, %s';

   cTXT0000172 = 'Unable to open or create the Registry Key, %s.';

   cTXT0000173 = 'User, %s, login failed.';

   cTXT0000174 = 'Unable to trace a column that is more than 60 characters long. Table Name = %s, Column Name = %s';
   cTXT0000175 = 'Unable to compile trigger.';

   cTXT0000176 = 'Line:'; // Line number; used in IQTrace
   cTXT0000177 = 'Error compiling trigger.';
   cTXT0000178 = 'The trigger has been dropped because of a compilation error.  See detail section.';

   cTXT0000180 = 'The version has changed.  It is recommended that your ' +
                 'personal settings now be cleared to improve performance.  ' +
                 'Clicking the "Yes" button will restore settings to the default values.  ' +
                 'This will not affect other users or interfere with security.'#13#13 +
                 'Do you want to reset now?';
   cTXT0000181 = 'An unexpected exception has occurred. '; // KrnlObjs.pas
   cTXT0000182 = 'Kernel Objects Exception Manager';
   cTXT0000183 = 'Error Message:';
   cTXT0000184 = 'WARNING! An Unexpected Error has been detected';
   cTXT0000185 = 'Error at line number:';
   cTXT0000186 = 'Kernel Object Instance:';
   cTXT0000187 = 'Kernel Object Type:';
   cTXT0000188 = 'Kernel Object Function:';
   cTXT0000189 = 'Procedure Name:';

   cTXT0000190 = 'KOC Class Type:';
   cTXT0000191 = 'KOC Class Parent:';
   cTXT0000192 = 'Error Code:';
   cTXT0000193 = 'Acknowledge'; // button caption
   cTXT0000194 = 'Failed to open or create file. Error Code = %d';
   cTXT0000195 = 'Failed to create file mapping. Error Code = %d';
   cTXT0000196 = 'Failed to map view of file. Error Code = %d';
   cTXT0000197 = 'Generic - All Customers';
   cTXT0000198 = 'Not Selected';
   cTXT0000199 = 'Registry Key, %s, is empty.  Unable to continue.';

   cTXT0000200 = 'Unable to create the directory, %s.';
   cTXT0000201 = 'The file, %s, has been updated successfully.';
   cTXT0000202 = 'Unable to override file, %s.';
   cTXT0000203 = 'Unknown field type. Field name: %s';
   cTXT0000204 = 'Default: None'; // Plnt_Bas
   cTXT0000205 = 'Default: %s [ %s ]';
   cTXT0000206 = 'User: SecMan N/A';
   cTXT0000207 = 'Default: N/A';
   cTXT0000208 = 'Please select an EPlant';
   cTXT0000209 = 'Invalid range: ''From'' must not be greater than ''To'' (character based)';

   cTXT0000210 = 'This report';
   cTXT0000211 = '%s has been printed %.0f time(s)'#13#13'Last printed on %s by %s'#13#13'Abort printing?';
   cTXT0000212 = 'No records found based on entered criteria.  Please check From and To values.';
   cTXT0000213 = 'Running %s...'; // refers to Oracle procedure BEFORE or AFTER report
   cTXT0000214 = 'Report - %s [%s = %s]';
   cTXT0000215 = 'Internal Document - %s';
   cTXT0000216 = 'External Document - %s';
   cTXT0000217 = 'Attention! Email address is blank.';
   cTXT0000218 = 'Unable to process external documents.  Library path is undefined [Prn_Doc].';
   cTXT0000219 = 'Unable to process external documents.  Filename is undefined [Prn_Doc]';

   cTXT0000221 = 'Work Order # %s Route';
   cTXT0000222 = 'The %s BOM report is not assigned in Mfg Types. Please assign a report name.';
   cTXT0000223 = 'Work Order # %s';
   cTXT0000224 = 'Overlay Label Report name is not assigned in the customer table. Please assign a report name.';
   cTXT0000225 = 'Invalid report specification.';
   cTXT0000226 = 'The %s Work Order report is not assigned in Mfg Types. Please assign a report name.';
   cTXT0000227 = 'Packing Slip # %s';
   cTXT0000228 = 'Sending email to %s ...';
   cTXT0000229 = 'Operation has been canceled.';

   cTXT0000230 = 'Transfer in Progress. Click Cancel button first.'; // refers to email
   cTXT0000231 = 'Connecting ...';
   cTXT0000232 = 'Connection closed';
   cTXT0000233 = 'Sending message';
   cTXT0000234 = 'Message has been sent';
   cTXT0000235 = '%s Properties'; // Refers to component: Form.Caption Properties
   cTXT0000236 = 'Do you wish to assign default report?';
   cTXT0000237 = 'There is no default report assigned to %s'; // ... Field, see RepProps
   cTXT0000238 = 'An empty field list was created.  No fields where Tag = 1 were found.';
   cTXT0000239 = 'The item has already been selected.';

   cTXT0000240 = 'Copyright © 1989-%s IQMS.  All rights reserved.'; // used on splash
   cTXT0000241 = 'Could not display help file:'#13#13'%s';
   cTXT0000242 = '%s is an undefined source.';
   cTXT0000243 = 'Assign EPlant [%s]'; // used in SetPlant
   cTXT0000244 = 'Trace on %s, ID = %.0f';
   cTXT0000245 = 'Unable to locate UD_Tables ID = %.0f'; // Usr_stru.pas
   cTXT0000246 = 'Unable to create view %s'#13#13'%s';
   cTXT0000247 = 'You have reached the maximum of 30 workable fields per form';
   cTXT0000248 = 'Please check user defined structure.'#13#13'Unable to open %s'#13#13'%s';
   cTXT0000249 = 'Enter %s';   // used in UomConv, "Enter <Type>"

   cTXT0000250 = 'System UOM';
   cTXT0000251 = 'User: %s';
   cTXT0000252 = 'Error:';
   cTXT0000253 = 'Microsoft Outlook is not installed or is unrecognized.'; // Outlook not installed
   cTXT0000254 = 'The current version of Microsoft Outlook is unsupported.'; // Outlook version
   
   cTXT0000255 = 'Failed to reset database connection. %s';
   cTXT0000256 = 'IQMS applications are protected under United States and international copyright laws.'; // used on splash
// cTXT0000257 = '"The More Intelligent Way'#13'to do Business"';
   cTXT0000257 = '"By Your Side, Every Step of the Way,'#13'From Start to Finish"';
   cTXT0000258 = 'EnterpriseIQ';
   cTXT0000259 = 'Data Dictionary';
   cTXT0000260 = 'FABData';
   cTXT0000261 = 'FABTrack';
   cTXT0000262 = 'IQActive';
   cTXT0000263 = 'IQAlert';
   cTXT0000264 = 'Configurator';
   cTXT0000265 = 'Costing';
   cTXT0000266 = 'Customer Relationship Management';
   cTXT0000267 = 'eCommerce';
   cTXT0000268 = 'Fixed Assets';
   cTXT0000269 = 'IQFax';
   cTXT0000270 = 'Forecast';
   cTXT0000271 = 'IQGate';
   cTXT0000272 = 'Human Resources';
   cTXT0000273 = 'Data Import';
   cTXT0000274 = 'Installer';
   cTXT0000275 = 'IQMatrix';
   cTXT0000276 = 'RT Meter';
   cTXT0000277 = 'Master Production Schedule';
   cTXT0000278 = 'MRO';
   cTXT0000279 = 'Payroll';
   cTXT0000280 = 'IQPurge';
   cTXT0000281 = 'Quality';
   cTXT0000282 = 'Warehouse Management';
   cTXT0000283 = 'Return Authorizations';
   cTXT0000284 = 'IQSPC';
   cTXT0000285 = 'IQStatus';
   cTXT0000286 = 'Time and Attendance';
   cTXT0000287 = 'Project Manager';
   cTXT0000288 = 'IQVoice';
   cTXT0000289 = 'WorkFlow';
   cTXT0000290 = 'IQClock';
   cTXT0000291 = 'RTServer';
   cTXT0000292 = 'Watch Dog';
   cTXT0000293 = 'ScanLine';
   cTXT0000294 = 'ScanID';
   cTXT0000295 = 'ShopData';
   cTXT0000296 = 'UPSLink';
   
   cTXT0000297 = 'eServer';
   cTXT0000298 = 'Unable to execute SafeNext call - ID field is not available';
   cTXT0000299 = 'Failed to locate ID = %.f during SafeNext call';
   
   cTXT0000300 = 'Unable to identify table name referenced in the selection criteria ''%s''';
   cTXT0000301 = 'Unable to match table ''%s'' referenced in the selection criteria ''%s'' against table names %s used in the report ''%s''';

   cTXT0000302 = 'Report name is not assigned.';

   cTXT0000303 = 'Undefined Message ID in EIQJump File %s';
   cTXT0000304 = 'Undefined Target ID in EIQJump File %s';
   cTXT0000305 = 'Zip Code not found.';
   cTXT0000306 = 'Exporting.  Please wait.';
   cTXT0000307 = 'Export complete.';
   cTXT0000308 = 'Import Zip Code Lookup records?  This will replace your existing data.';
   cTXT0000309 = 'Importing.  Please wait.';

   cTXT0000310 = 'Import complete.';
   cTXT0000311 = 'Missing field(s).';
   cTXT0000312 = 'Potential index conflict:  Field ID found in DBF.';
   cTXT0000313 = 'Invalid Zip Code file:'#13#13'%s';
   cTXT0000314 = 'Application Error:  Cannot save changes.';
   cTXT0000315 = 'Select Record by Zip Code - %s';
   cTXT0000316 = 'Select Zip Code';

   cTXT0000317 = 'Some EnterpriseIQ files were found to be out of date.  They must be updated based on Master Home directory content.'#13#13 +
    'Would you like the system to update these files for you now?';
   cTXT0000318 = 'Unable to register DCOM IQStatus.';
   
   cTXT0000319 = 'Alias: ';

   cTXT0000320 = 'The attached document ''%s'' is not available - it is expired and requires review.';
   
   cTXT0000321 = 'Cannot create directory, %s';
   cTXT0000322 = 'Cannot copy file, %s, to %s';
   cTXT0000323 = 'The file, %s, was copied successfully.  But the original file could not be removed.';
   
   cTXT0000324 = 'Column name may not contain space(s)';
   cTXT0000325 = 'Column name must start with a letter';
   cTXT0000326 = 'Maximum number of supported columns (30) has been exceeded';
   cTXT0000327 = 'Column name may only contain letters, digits and underscore';
   cTXT0000328 = 'Column name length cannot exceed 30';
   cTXT0000329 = 'Please select a document source from the list.';

   cTXT0000330 = 'Unable to determine month number of %s';
   cTXT0000331 = 'Utilize .NET Printing (Not Assigned)';
   cTXT0000332 = 'Utilize .NET Printing';
   
   cTXT0000333 = 'Windows security restrictions have prohibited this module from launching.  Please have your Administrator launch this module one time to make it available.';
   cTXT0000334 = 'Validation failed with out of sequence error. Expected sequence # %d, found # %d.';
   cTXT0000335 = 'Please enter a valid number.';
   cTXT0000336 = 'Your password has expired. Since the grace period is set to UNLIMITED you will be allowed to proceed.'+
                 'Nevertheless it is recommended to change the password. Would you like to change your password now?';

   cTXT0000337 = 'You must change the password in order to continue.';
   cTXT0000338 = 'Password change is required - unable to continue.';
   
   cTXT0000339 = 'System is currently busy compressing a table and rebuilding associated indexes and is in unstable state. Please exit the system until the compression is complete.';
   cTXT0000340 = 'Total time worked: ';
   cTXT0000341 = 'days';

   cTXT0000342 = 'User %s has exceeded max allowed failed login attempts. Access denied...';
   cTXT0000343 = 'User %s is already logged in - cannot log in the same user more than once. Access denied...';
   cTXT0000344 = 'The temporary 24hr password for user %s has expired. Access denied...';
   cTXT0000345 = 'Printer not found.'; //  'No compatible printers available'
   cTXT0000346 = '&Yes';
   cTXT0000347 = '&No';
   cTXT0000348 = 'A structure has not yet been defined.  To define a structure click the Define Structure button.'; 
   cTXT0000349 = 'User-Defined Form'; 
   cTXT0000350 = 'Yes';
   cTXT0000351 = 'No';
   cTXT0000352 = 'Encountered error adding new location:'#13'%s'; 
   cTXT0000353 = 'Encountered error retrieving location:'#13'%s'; 
   cTXT0000354 = 'Location already exists.  Cannot add location.'#13#13 +
        ' Location Description:  %s'#13 +
        ' Division: %s [%.0f]'#13 +
        ' EPlant: %s [%.0f]';
   cTXT0000355 = '(None)';

   cTXT0000356 = '%d years';
   cTXT0000357 = '1 year';
   cTXT0000358 = '%d months';
   cTXT0000359 = '1 month';
   cTXT0000360 = '%d days';
   cTXT0000361 = '1 day';
   cTXT0000362 = '%d hours';
   cTXT0000363 = '1 hour';
   cTXT0000364 = '%d minutes';
   cTXT0000365 = '1 minute';
   cTXT0000366 = '%d seconds';
   cTXT0000367 = '1 second';
   cTXT0000368 = ', and ';

   cTXT0000369 = '%d yrs';
   cTXT0000370 = '1 yr';
   cTXT0000371 = '%d mos';
   cTXT0000372 = '1 mo';
   cTXT0000373 = '%d days';
   cTXT0000374 = '1 day';
   cTXT0000375 = '%d hrs';
   cTXT0000376 = '1 hr';
   cTXT0000377 = '%d mins';
   cTXT0000378 = '1 min';
   cTXT0000379 = '%d secs';
   cTXT0000380 = '1 sec';
   cTXT0000381 = 'Security credentials violation, user name mismatch detected. Operation aborted.';
   cTXT0000382 = 'Security credentials violation, password mismatch detected. Operation aborted.';
   cTXT0000383 = 'Security credentials violation, database alias mismatch detected. Operation aborted.';
   cTXT0000384 = 'Invalid interval between Clock IN/OUTs.';
   cTXT0000385 = 'Warning'; 
   cTXT0000386 = 'The system has identified and skipped %d blank email address(es).';
   cTXT0000387 = 'Cannot archive or delete PO linked to Kanban Control. Update Kanban Control by removing link to PO and try again.';
   cTXT0000388 = 'Undefined EPlant selection - operation aborted.';
   cTXT0000389 = 'Contents';
   cTXT0000390 = 'Knowledge Center';
   cTXT0000391 = 'Wiki/SOP';
   cTXT0000392 = 'Telephone';
   cTXT0000393 = 'Fax';
   cTXT0000394 = 'Cell Telephone';
   cTXT0000395 = 'Email';
   cTXT0000396 = 'Web Site';
   cTXT0000397 = 'A description is required.'; 
   cTXT0000398 = 'EACH'; 
   cTXT0000399 = 'Misc. Item'; 
   cTXT0000400 = 'No records found.  Please select records using filter to set Date Scope and Transaction Type, then try again.'; 

   cTXT0000401 = 'Your password has expired. Since the grace period is set to UNLIMITED you will be allowed to proceed. Nevertheless it is recommended to change the password.';
   cTXT0000402 = 'Your password expires in %d day(s). You need to change the password before the expire date.';
   cTXT0000403 = 'Password has expired';
   cTXT0000404 = 'Password is about to expire. You need to change the password before the expire date.';
   cTXT0000405 = 'Undefined Wiki/SOP link.  Operation aborted.';
   cTXT0000406 = 'The Application Server URL has not been assigned.';
   cTXT0000407 = 'Unable to identify the form requesting the Wiki page.  Operation aborted.';
   cTXT0000408 = 'Unable to establish help conext ID of the form requesting the Wiki page.';
   cTXT0000409 = 'Unable to continue running application - correct the problem and try again.';
   cTXT0000410 = 'MyIQMS';
   cTXT0000411 = 'Encountered error attempting to save the document:';
   
   cTXT0000412 = 'Type';
   cTXT0000413 = 'Number';
   cTXT0000414 = 'Date';
   cTXT0000415 = 'Company';
   cTXT0000416 = 'Undefined filename - operation aborted';
   cTXT0000417 = 'The version has changed.  Personal settings have been ' +
                 'cleared to improve performance.';
   cTXT0000418 = 'User defined file name formatting is found.'#13'Click the button to review the formatting...';
   cTXT0000419 = 'Click the button to specify file name formatting or enter the file name directly';
   cTXT0000420 = 'Add from ''%s''';
   cTXT0000421 = 'Cancel changes?';
   // Regions of Austria
   cTXT0000422 = 'Burgenland';
   cTXT0000423 = 'Carinthia'; // 'Kärnten'
   cTXT0000424 = 'Lower Austria'; // 'Niederösterreich';
   cTXT0000425 = 'Upper Austria'; // 'Oberösterreich';
   cTXT0000426 = 'Salzburg';
   cTXT0000427 = 'Styria'; // 'Steiermark';
   cTXT0000428 = 'Tyrol'; // 'Tirol';
   cTXT0000429 = 'Vorarlberg';
   cTXT0000430 = 'Vienna'; // 'Wien';
   // Regions of Belgium
   cTXT0000431 = 'Antwerp';
   cTXT0000432 = 'East Flanders';
   cTXT0000433 = 'Flemish Brabant';
   cTXT0000434 = 'Hainaut';
   cTXT0000435 = 'Liège';
   cTXT0000436 = 'Limburg';
   cTXT0000437 = 'Luxembourg';
   cTXT0000438 = 'Namur';
   cTXT0000439 = 'Walloon Brabant';
   cTXT0000440 = 'West Flanders';
   cTXT0000441 = 'Email';
   cTXT0000442 = 'Append user defined columns to the group box';
   cTXT0000443 = 'Edit email address:';
   cTXT0000444 = 'Processing. Please Wait ...';
   cTXT0000445 = 'Enter Quantity';
   cTXT0000446 = 'Received Quantity';
   cTXT0000447 = 'Not all good parts have been reported against the process. You have not clocked out.';
   cTXT0000448 = 'Unable to determine current shift and prod date.';
   cTXT0000449 = 'User Defined Form';
   cTXT0000450 = 'This is a Confidential library.  Assigning document from a confidential library will make it '+
                 'viewable for non Library Team members.'+#13#13+'Continue?';
   cTXT0000451 = 'Employee is not set up as an Oracle user.';
   cTXT0000452 = 'Customer Summary';
   cTXT0000453 = 'Vendor Summary';
   cTXT0000454 = 'Partner Summary';
   cTXT0000455 = 'Employee Summary';
   cTXT0000456 = 'Summary';
   cTXT0000457 = 'Web Site URL:';
   cTXT0000458 = 'Company Telephone:';
   cTXT0000459 = 'Company Extension:';
   cTXT0000460 = 'Company Fax:';
   cTXT0000461 = 'Contact Cell Telephone:';
   cTXT0000462 = 'Contact Telephone:';
   cTXT0000463 = 'Contact Extension:';
   cTXT0000464 = 'Extension';
   cTXT0000465 = 'Contact Fax:';
   cTXT0000466 = 'Contact Email:';
   cTXT0000467 = 'Contact Title:';
   cTXT0000468 = 'Contact Pager:';
   cTXT0000469 = '%s, Ext. %s';
   cTXT0000470 = 'Customer';
   cTXT0000471 = 'Vendor';
   cTXT0000472 = 'Partner';
   cTXT0000473 = 'Employee';
   cTXT0000474 = 'Error';
   cTXT0000475 = 'Running multiple instances of %s on the same machine could cause '+
                 'unexpected program errors due to memory usage constraints.  '+
                 'IQMS recommends that only a single instance of %s run on a '+
                 'single Windows instance.';
   cTXT0000476 = 'Component name may not contain space(s)';
   cTXT0000477 = 'Component name must start with a letter or underscore';
   cTXT0000478 = 'Component name may only contain letters, digits and underscore';
   cTXT0000479 = 'Please wait while the application is reset.';
   cTXT0000480 = 'This will only take a moment ...';
   cTXT0000481 = 'You Have A New Version!';
   cTXT0000482 = 'Unable to reset dependent user defined drop-down boxes';
   cTXT0000483 = 'Tax Reporting Tool';
   cTXT0000484 = 'Terminating Idle';
   cTXT0000485 = 'Auto Login in %d seconds ...';
   cTXT0000486 = 'Auto Shut Down in %d seconds ...';
   cTXT0000487 = 'Shutting down...';
   cTXT0000488 = 'True';
   cTXT0000489 = 'False';
   cTXT0000490 = 'Missing expression.';
   cTXT0000491 = 'Invalid parameter: %d';
   cTXT0000492 = 'Please select a Lot number.';
   //cTXT0000493 = '';
   //cTXT0000494 = '';
   //cTXT0000495 = '';
   // cTXT0000496 = '';
   // cTXT0000497 = '';
   cTXT0000498 = 'PDF File (*.pdf)';
   cTXT0000499 = 'Gage/Device Bias Study # %s';

   cTXT0000500 = 'Crystal Report';
   cTXT0000501 = 'Rich Text Format';
   cTXT0000502 = 'Microsoft Word for Windows';
   cTXT0000503 = 'Microsoft Excel';
   cTXT0000504 = 'Adobe Acrobat PDF';
   cTXT0000505 = 'HTML';
   cTXT0000506 = 'HTML 4';
   cTXT0000507 = 'Microsoft Excel - Data Only';
   cTXT0000508 = 'Plain Text Format (ASCII)';
   cTXT0000509 = 'Comma Separated Values (CSV)';
   cTXT0000510 = 'Tab Separated Values';
   cTXT0000511 = 'Microsoft Word';

   cTXT0000512 = 'Any File (*.*)|*.*|';
   cTXT0000513 = 'Crystal Report (*.rpt)|*.rpt|';
   cTXT0000514 = 'Rich Text Format (*.rtf)|*.rtf|';
   cTXT0000515 = 'Microsoft Word Document (*.doc)|*.doc|';
   cTXT0000516 = 'Microsoft Excel (*.xls)|*.xls|';
   cTXT0000517 = 'Adobe Acrobat PDF (*.pdf)|*.pdf|';
   cTXT0000518 = 'HTML (*.htm)|*.htm|';
   cTXT0000519 = 'HTML 4 (*.htm)|*.htm|';
   cTXT0000520 = 'Microsoft Excel (Data Only) (*.xls)|*.xls|';
   cTXT0000521 = 'Plain Text Format (*.txt)|*.txt|';
   cTXT0000522 = 'Comma Separated Values (.csv)|*.csv|';
   cTXT0000523 = 'Tab Separated Values (*.txt)|*.txt|';
   cTXT0000524 = 'Microsoft Word (*.doc)|*.doc|';

   cTXT0000525 = 'A fatal error has occurred.';

   cTXT0000526 = 'Please enter your Badge #';
   cTXT0000527 = 'Please enter your Employee #';
   cTXT0000528 = 'Badge #';
   cTXT0000529 = 'Employee #';
   cTXT0000530 = 'Parameters';
   cTXT0000531 = 'Returns a number that is the absolute value of the number ' +
    'passed to the function.';
   cTXT0000532 = 'Returns a number that is the arccosine of the number ' +
    'passed to the function.';
   cTXT0000533 = 'Returns a number that is the arcsine of the number passed ' +
    'to the function.';
   cTXT0000534 = 'Returns a number that is the arctangent of the number ' +
    'passed to the function.';
   cTXT0000535 = 'Returns a number between -pi and pi representing the ' +
    'angle of the point, x and y.';
   cTXT0000536 = 'Sorry, that number cannot fit in the field.  Please enter a number within the acceptable range.';
   cTXT0000537 = 'IQMS system changes';
   cTXT0000538 = 'IQMS system settings have been modified by the system administrator - please restart the application to avoid unexpected errors.';
   cTXT0000539 = 'View All';
   cTXT0000540 = 'View Active';
   cTXT0000541 = 'View Inactive';
   cTXT0000542 = 'About';
   cTXT0000543 = 'Unable to define connections list.  Either the system was unable to locate the Oracle Home or '+
                 'no connections have been defined in IQStatus.';
   cTXT0000544 = '';
   cTXT0000545 = '';
   cTXT0000546 = '';
   cTXT0000547 = '';
   cTXT0000548 = '';
   cTXT0000549 = '';
   cTXT0000550 = '';
   cTXT0000551 = '';
   cTXT0000552 = '';
   cTXT0000553 = '';
   cTXT0000554 = '';
   cTXT0000555 = '';
   cTXT0000556 = '';
   cTXT0000557 = '';
   cTXT0000558 = '';
   cTXT0000559 = '';
   cTXT0000560 = '';
   cTXT0000561 = '';
   cTXT0000562 = '';
   cTXT0000563 = '';
   cTXT0000564 = '';
//   cTXT0000565 = '';
//   cTXT0000566 = '';
//   cTXT0000567 = '';
//   cTXT0000568 = '';
//   cTXT0000569 = '';
//   cTXT0000570 = '';
//   cTXT0000571 = '';
//   cTXT0000572 = '';
//   cTXT0000573 = '';
//   cTXT0000574 = '';
//   cTXT0000575 = '';
//   cTXT0000576 = '';
//   cTXT0000577 = '';
//   cTXT0000578 = '';
//   cTXT0000579 = '';
//   cTXT0000580 = '';
//   cTXT0000581 = '';
//   cTXT0000582 = '';
//   cTXT0000583 = '';
//   cTXT0000584 = '';
//   cTXT0000585 = '';
//   cTXT0000586 = '';
//   cTXT0000587 = '';
//   cTXT0000588 = '';
//   cTXT0000589 = '';
//   cTXT0000590 = '';
//   cTXT0000591 = '';
//   cTXT0000592 = '';
//   cTXT0000593 = '';
//   cTXT0000594 = '';
//   cTXT0000595 = '';
//   cTXT0000596 = '';
//   cTXT0000597 = '';
//   cTXT0000598 = '';
//   cTXT0000599 = '';
//   cTXT0000600 = '';


implementation

end.

