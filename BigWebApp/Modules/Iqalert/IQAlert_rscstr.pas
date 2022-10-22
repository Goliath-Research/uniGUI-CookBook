unit IQAlert_rscstr;

interface

// IQAlert_rscstr.cRsc000001

resourcestring
  c_IQAlert_DataPump_Dirname = 'IQMS_IQALERT_DP_BACKUP';

  cRsc000001 =
    'Check this box to send email regardless of the SQL Statement above.'#13+
    'Uncheck the box if you wish to send email only if SQL Statement returned one or more rows.'#13+
    'Note that if there is no SQL Statement defined, email will be always sent.';
  cRsc000002 = 'Check this box to send email using plain/raw text.'#13 +
    'Uncheck the box to send email using HTML formatting (default).';
  cRsc000003 = 'This action already has an existing param file, %s.  ' +
    'Would you like to maintain export arguments on the export action level ' +
    'instead of an external param file?';
  cRsc000004 = 'Oracle export executable file name.';
  cRsc000005 = 'Backup file path';
  cRsc000006 = 'Maintained in param file %s.';
  cRsc000007 = 'The system has identified and skipped %d blank email addresses.';
  cRsc000008 = 'Unable to perform export.  No arguments were found either in ' +
    'a corresponding param file nor in the database.  Please review the ' +
    'export action setup.';
  cRsc000009 = 'HubSpot sync action ID %d, Description %s failed!';
  cRsc000010 = 'Encountered errors while syncing HubSpot:';
  cRsc000011 = 'Failed to send sync failure notification Email! Error: %s';
  cRsc000012 = 'Click to archive uploaded files before deleting them';
  cRsc000013 = 'Archive uploaded files';
  cRsc000014 = 'Delete from FTP downloaded files';
  cRsc000015 = 'Click to delete from FTP downloaded files(s)';
  cRsc000016 = 'Please enter a value for ''%s''.';
  cRsc000017 = 'Invalid Oracle export executable file name.';
  cRsc000018 = 'Please find attached %s';
  cRsc000019 = 'Please enter a Repository Alias.';
  cRsc000020 = 'Polled directory';
  cRsc000021 = 'Directory in field, ''%s,'' not found:  %s';
  cRsc000022 = 'File, ''%s,'' not found:  %s';
  cRsc000023 = 'Invalid number for field, ''%s''';
  cRsc000024 = 'Please enter a positive value for field, ''%s.''';
  cRsc000025 = 'Please enter a value greater than zero for field, ''%s''';
  cRsc000026 = 'Please select a work order creation method.';
  cRsc000027 = 'params.txt';
  cRsc000028 = 'logexp.txt';
  cRsc000029 = 'The following parameter file was created:';
  cRsc000030 = 'Review Example';
  cRsc000031 = 'Name1@something.com; Name2@something.com';
  cRsc000032 = 'Review';
  cRsc000033 = 'List of people to be reviewed';
  cRsc000034 = 'Executable files (*.exe)|*.exe|All files (*.*)|*.*';
  cRsc000035 = 'Dmp files (*.dmp)|*.dmp|All files (*.*)|*.*';
  cRsc000036 = 'Select Polled Directory';
  cRsc000037 = 'Select Directory';
  cRsc000038 = 'IIS Server settings have not been configured in System ' +
    'Parameters.  Cannot display page.';
  cRsc000039 = 'Would you like the system to generate the default export ' +
    'command arguments  based on your selected settings?';
  cRsc000040 = 'Action is undefined.';
  cRsc000041 = 'Clone Action';
  cRsc000042 = 'New action description';
  cRsc000043 = 'Event is undefined.';
  cRsc000044 = 'Select Archive Directory';
  cRsc000045 = 'EPlants have been detected.  Please specify an EPlant.';
  cRsc000046 = 'Mfg Cell ''%s'' does not belong to EPlant ''%s''.  Please revise.';
  cRsc000047 = '<Assigned>';
  cRsc000048 = 'Condition statements require comments to be written using ' +
    'the following format:'#13#13'   /* COMMENT GOES HERE */'#13#13 +
    'Please do not use double dashes.';
  cRsc000049 = 'SQL statement must evaluate to a single numeric column ' +
    'which returns 0 or greater.';
  cRsc000050 = 'Condition Statement';
  cRsc000051 = 'Action Detail Note';
  cRsc000052 = 'Note';
  cRsc000053 = 'Select External Labels Directory';
  cRsc000054 = 'Finished successfully';
  cRsc000055 = 'Export file:';
  cRsc000056 = 'Export Log:';
  cRsc000057 = 'IQAlert Host:';
  cRsc000058 = 'Export timed out ( 2 hour max )';
  cRsc000059 = 'Export aborted';
  cRsc000060 = 'Export Failed! (error: %d)';
  cRsc000061 = 'IQAlert';
  cRsc000062 = 'Export successful';
  cRsc000063 = 'Error encountered during export';
  cRsc000064 = 'EXPORT LOG ATTACHED!';
  cRsc000065 = 'Please review the log to determine the error.  Contact IQMS ' +
    'technical support for assistance if needed.';
  cRsc000066 = 'Failed to create Repository Data Pump Directory for Alias ' +
    '%s!  Export failed!';
  cRsc000067 = 'Encountered errors while downloading spot rates.';
  cRsc000068 = 'Encountered errors while downloading tax codes.';
  cRsc000069 = 'EMail ''%s''';
  cRsc000070 = 'Warning! Unable to print specified report(s).  Please check ' +
    'report settings, user access rights etc.';
  cRsc000071 = 'Invalid Polled Directory';
  cRsc000072 = 'Polled COM Server name is missing';
  cRsc000073 = 'Poll Directory';
  cRsc000074 = 'Finished successfully with warning. %d files skipped. Check IQCheckPointList.txt';
  cRsc000075 = 'Host Name is not assigned';
  cRsc000076 = 'Login Name is not assigned';
  cRsc000077 = 'Password is not assigned';
  cRsc000078 = 'Invalid Local Directory';
  cRsc000079 = 'Unable to move file %s to %s. Error Code = %d';
  cRsc000080 = 'Web Service URI is not assigned';
  cRsc000081 = 'Web Service Login Name is not assigned';
  cRsc000082 = 'Web Service Password is not assigned';
  cRsc000083 = 'FTP URI is not assigned';
  cRsc000084 = 'FTP Login Name is not assigned';
  cRsc000085 = 'FTP Password is not assigned';
  cRsc000086 = 'Company Name is not assigned';
  cRsc000087 = 'Encountered errors while performing MSDS Sync. Please ' +
    'check EVENT_LOG entries with class ''MSDSError'' for details.';
  cRsc000088 = 'URI is not assigned';
  cRsc000089 = 'Invalid Output Directory';
  cRsc000090 = 'Finished with errors. Check IQCheckPointList.txt';
  cRsc000091 = 'Export Type (FIXED, DELIMITED, XML) is missing';
  cRsc000092 = 'Delimiter is missing';
  cRsc000093 = 'Separator is missing';
  cRsc000094 = 'Unable to delete file %s. Error Code = %d';
  cRsc000095 = 'Invalid Export Type: %s';
  cRsc000096 = 'EMail address is not assigned';
  cRsc000097 = 'List of files in %s';
  cRsc000098 = 'List of files as of %s';
  cRsc000099 = 'List of files older than %.2f minutes as of %s';
  cRsc000100 = 'Invalid Sent Directory';
  cRsc000101 = '%s Exception';
  cRsc000102 = 'Failed processing %s:';
  cRsc000103 = 'Error: '#13'%s';
  cRsc000104 = 'Action: %s';
  cRsc000105 = 'Thank you.';
  cRsc000106 = 'Finished successfully with warning. [%s - skipped due to specified condition]';
  cRsc000107 = 'Error encountered while attempting to convert file ''%s'' to PDF format.'#13'Error: %s';
  cRsc000108 = 'Customer Statement for Customer # %s';

  cRsc000109 = 'None';
  cRsc000110 = 'Announce';
  cRsc000111 = 'Auto Disposition';
  cRsc000112 = 'Auto Eform';
  cRsc000113 = 'Auto Eform Vendor';
  cRsc000114 = 'Auto Email Expense Reports';
  cRsc000115 = 'Auto Load';
  cRsc000116 = 'Create Production Backup';
  cRsc000117 = 'Create Production Backup-DP';
  cRsc000118 = 'Create Repository Backup';
  cRsc000119 = 'Create Repository Backup-DP';
  cRsc000120 = 'Credit Card Retention Purge';
  cRsc000121 = 'CRM Mass Mailing';
  cRsc000122 = 'CRM Notifications';
  cRsc000123 = 'EDI Auto Outbound';
  cRsc000124 = 'Email';
  cRsc000125 = 'Email File List';
  cRsc000126 = 'Email Files';
  cRsc000127 = 'Evaluate Workflow';
  cRsc000128 = 'Evaluate Credit Status';
  cRsc000129 = 'Export To File';
  cRsc000130 = 'FTP Download';
  cRsc000131 = 'FTP Upload';
  cRsc000132 = 'HTTPS Upload';
  cRsc000133 = 'Hubspot Download';
  cRsc000134 = 'Hubspot Upload';
  cRsc000135 = 'Import Toyota Labels';
  cRsc000136 = 'IQGate Export';
  cRsc000137 = 'IQMS Password Expired Grace';
  cRsc000138 = 'MRO Activity Summary';
  cRsc000139 = 'MSDS Synchronization';
  cRsc000140 = 'Outbound Customer Statement';
  cRsc000141 = 'PIT';
  cRsc000142 = 'Poll Directory';
  cRsc000143 = 'Populate Data For SSS';
  cRsc000144 = 'Project Activity Summary';
  cRsc000145 = 'Reindex Documents';
  cRsc000146 = 'Reindex Knowledge Center';
  cRsc000147 = 'Report';
  cRsc000148 = 'Run Executable File';
  cRsc000149 = 'Spot Rate Synchronization';
  cRsc000150 = 'Tax Code Synchronization';
  cRsc000151 = 'Update FRL';
  cRsc000152 = 'Update MRO Capacity';
  cRsc000153 = 'Update Schedule';
  cRsc000154 = 'Vendor EDI';
  cRsc000155 = 'Vendor EDI Report';
  cRsc000156 = 'MRO Work Orders';

  cRsc000157 = 'MRO Work Order';
  
  cRsc000158 = 'Accrued Freight';
  cRsc000159 = 'Cost Calculations - MFG Items';
  cRsc000160 = 'Roll All Temp Items to Standard Cost';
  cRsc000161 = '';
  cRsc000162 = '';
  cRsc000163 = 'Salesforce Sync';
  cRsc000164 = 'Salesforce sync action ID %d, Description %s failed!';
  cRsc000165 = 'Encountered Errors While Syncing Salesforce';
  cRsc000166 = 'eServer [Full License]';
  cRsc000167 = 'eServer [Module Based License]';
  cRsc000168 = 'Unable to locate export log. The file was not found on the server, but no error was reported from EXPDP.';
  cRsc000169 = '';
  cRsc000170 = '';
  cRsc000171 = '';
  cRsc000172 = '';
  cRsc000173 = '';
  cRsc000174 = '';
  cRsc000175 = '';
  cRsc000176 = '';
  cRsc000177 = '';
  cRsc000178 = '';
  cRsc000179 = '';
  cRsc000180 = '';
  cRsc000181 = '';
  cRsc000182 = '';
  cRsc000183 = '';
  cRsc000184 = '';
  cRsc000185 = '';
  cRsc000186 = '';
  cRsc000187 = '';
  cRsc000188 = '';
  cRsc000189 = '';
  cRsc000190 = '';
  cRsc000191 = '';
  cRsc000192 = '';
  cRsc000193 = '';
  cRsc000194 = '';
  cRsc000195 = '';
  cRsc000196 = '';
  cRsc000197 = '';
  cRsc000198 = '';
  cRsc000199 = '';
  cRsc000200 = '';


implementation

end.
