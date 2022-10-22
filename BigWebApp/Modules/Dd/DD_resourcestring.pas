unit DD_resourcestring;

//  These are strings used in Data Dictionary.  The make text available to
// translators for localized versions of DD.EXE.  If you need to embed text
// in the application, please add it here and reference in the code.

interface

// DD_resourcestring.cTXT0000125

resourcestring

   cTXT0000001 = 'EnterpriseIQ Data Dictionary'; // main form caption
   cTXT0000002 = 'User:';
   cTXT0000003 = 'Server Name:';
   cTXT0000004 = 'Check this box to run scripts. '#13'Use [+] button to add a script'#13'and [-] to remove one';
   cTXT0000005 = 'Sub-Item(s)';
   cTXT0000006 = 'Clearing Items List';
   cTXT0000007 = '%d Items Loaded...'; // i.e., '123 Items Loaded...'  [see UpdateViewPanel() in dd_main.pas]
   cTXT0000008 = 'Are you sure you want to continue?';
   cTXT0000009 = 'Cannot find directory ';
   cTXT0000010 = 'Please re-enter.';
   cTXT0000011 = ' - Unable to acquire exclusive lock. Use the "Options" menu to determine who is currently logged in.';
   cTXT0000012 = 'DD Update Structure - Executed on %s, Ver: N/A';
   cTXT0000013 = 'Company Name       : %s';
   cTXT0000014 = 'DD Update Structure - Executed on %s, Ver: N/A';
   cTXT0000015 = 'Saving Log File.  Please Wait ...';
   cTXT0000016 = 'Failed to create DD Update Structure Log file.';
   cTXT0000017 = 'Database update process finished with %d error(s).';
   cTXT0000018 = 'Database update process finished successfully.';
   cTXT0000019 = 'Proceeding without creating the dedicated RB_DD Rollback Segment';
   cTXT0000020 = 'Processing Synonyms';
   cTXT0000021 = 'Processing Sequences';
   cTXT0000022 = 'Processing Triggers';
   cTXT0000023 = 'Processing E-Triggers';
//   cTXT0000024 = 'Processing E-DelTriggers';
   cTXT0000025 = 'Processing EPlant-Triggers';
   cTXT0000026 = 'Processing Dependencies';
   cTXT0000027 = 'Unable to Resolve Dependencies.'#13#13 +
                 'Please EMail this log file to your IQMS Representative.';
   cTXT0000028 = 'Are you sure you want to stop the Database Update?';
   cTXT0000029 = 'Manual SQL Statement';
   cTXT0000030 = 'DDL statement finished with %d error(s).';
   cTXT0000031 = 'Copying RepDef_Formulas to %s.  Please Wait...';
   cTXT0000032 = 'RepDef, RepDef_Criteria, RepDef_Formulas, RepDef_Cat tables have been successfully copied';
   cTXT0000033 = 'Are you sure you want to exit Data Dictionary?';
   cTXT0000034 = 'Processing %s.  Please wait...';
   cTXT0000035 = 'Go To Line ...';
   cTXT0000036 = 'Enter line number';
   cTXT0000037 = 'Type = %s, line # = %s, not found.';
   cTXT0000038 = '"%s" is not found in %s';
   cTXT0000039 = 'Change Sort By.'#13'Current Sort: %s';
   cTXT0000040 = 'None';
   cTXT0000041 = 'File(s) are saved to %s';
   cTXT0000042 = 'Copying %s';
   cTXT0000043 = 'This option creates public synonyms for every IQMS object. Are you sure you want to continue?';
   cTXT0000044 = 'Finished updating Synonyms with %d error(s).';
   cTXT0000045 = 'Finished updating Synonyms successfully.';
   cTXT0000046 = 'Processing Auto FK-Indexes';
   cTXT0000047 = 'Exporting %s to %s.  Please wait...';
   cTXT0000048 = 'All tables have been successfully copied.';
   cTXT0000049 = 'Cannot find file %s';
   cTXT0000050 = 'Importing %s from %s.  Please wait ...';
   cTXT0000051 = 'Import finished successfully.';
   cTXT0000052 = 'Unable to import file(s). Error: %s';
   cTXT0000053 = 'Compiling %s trigger.  Please wait ...';
   cTXT0000054 = 'Search string "%s" not found';
   cTXT0000055 = 'Unable to find object "%s"';
   cTXT0000056 = 'This option creates a script that rebuilds user indexes in user selected tablespace.'#13#13+
                 ' Are you sure you want to continue?';
   cTXT0000057 = 'Invalid control structure. Missing closing tag for %s';
   cTXT0000058 = 'Existing version %s is not compatible with this upgrade. Operation aborted.';
   cTXT0000059 = 'Object "%s" is not of type TABLE or VIEW.';
   cTXT0000060 = '%s record count: %.0f';
   cTXT0000061 = 'No objects found.';
   cTXT0000062 = 'No items in the buffer.';
   cTXT0000063 = 'Password confirmation failed. Please correct the Password or Confirm Password';
   cTXT0000064 = 'Copying RepDef to %s.  Please Wait...';
   cTXT0000065 = 'Copying RepDef_Criteria to %s. Please Wait...';
   cTXT0000066 = 'Do you wish to delete the selected items?';
   cTXT0000067 = 'A valid user name must be selected';
   cTXT0000068 = 'Authorization Key is wrong';
   cTXT0000069 = 'Save to file, %s?';
   cTXT0000070 = 'Assigning text to memo ...';
   cTXT0000071 = 'Please Enter ALL File Names';
   cTXT0000072 = 'User Name must be entered';
   cTXT0000073 = 'Default Tablespace must be entered';
   cTXT0000074 = 'Temporary Tablespace must be entered';
   cTXT0000075 = 'Invalid User Name: "%s"';
   cTXT0000076 = 'Granting access.  Please wait ...';
   cTXT0000077 = 'Revoking access.  Please wait ...';
   cTXT0000078 = 'Field is Missing';
   cTXT0000079 = 'Field %s not found in IQLicense file';
   cTXT0000080 = 'License information was updated successfully.';
   cTXT0000081 = 'Unable to Import IQLicense file. Error: %s';
   cTXT0000082 = 'Loading data.  Please wait...';
   cTXT0000083 = '&Proceed';
   cTXT0000084 = '&OK';
   cTXT0000085 = 'Time:';
   cTXT0000086 = 'Output set has been saved to file, %s';
   cTXT0000087 = 'Record Count = %d'#13'[Fetch Time: %7.4f sec]';
   cTXT0000088 = 'Field Name';
   cTXT0000089 = 'Value';
   cTXT0000090 = '#'; // Column caption for string grid in DDViewSQL
   cTXT0000091 = 'Tablespace must be specified.';
   cTXT0000092 = 'Valid script name must be entered';
   cTXT0000093 = 'Saving to file, %s ...';
   cTXT0000094 = 'Aborted by User!';
   cTXT0000095 = 'OK'; // this is also the text that displays after SQL is completed: '-- OK'
   cTXT0000096 = 'sec'; // abbreviation for "seconds." Used after executing SQL.
   cTXT0000097 = 'Failed:'; // used when SQL fails
   cTXT0000098 = 'WEB server/support is not installed.  Skipping WEB package';
   cTXT0000099 = '-- Object %s already exists.  No changes applied';
   cTXT0000100 = ' -> Finished with %d error(s).';
   cTXT0000101 = ' -> Finished Successfully.';
   cTXT0000102 = 'ATTENTION: The following objects are in invalid state';
   cTXT0000103 = '   Error Description: %s';

   cTXT0000104 = 'Connection was reset to reinitialize application';
   cTXT0000105 = 'Sequence generators are checked.';

   cTXT0000106 = 'Version check is added to the stack for evaluation.';
   cTXT0000107 = 'Version check is removed from the stack.';
   cTXT0000108 = 'The block has been excluded from execution due to version check incompatibility.';
   
   cTXT0000109 = 'Are you sure you want to kill process %s?';
   cTXT0000110 = 'Process is killed';

   cTXT0000111 = 'Cannot load file contents into SQL window.';
   cTXT0000112 = 'Copying RepDef_Cat to %s.  Please Wait...'; 
   cTXT0000113 = 'No language selected!'; 
   
   cTXT0000114 = 'Purging RecycleBin'; 
   cTXT0000115 = '"%s" is not found in %s. Similar values will be highlighted in bold.';
   cTXT0000116 = 'Running scripts...';
   cTXT0000117 = 'Processing Sequences (PK) ...';
   cTXT0000118 = 'Processing ID Triggers ...'; 
//   cTXT0000119 = 'Processing EID Triggers ...';
   cTXT0000120 = 'Processing EPlant Triggers ...';
   cTXT0000121 = 'Processing Foreign Key Indexes ...';
   cTXT0000122 = 'Processing Web Packages ...';
   cTXT0000123 = 'Checking Web Roles ...'; 
   cTXT0000124 = 'Resolving dependencies ...'; 
   cTXT0000125 = 'Loading script.  Please wait.'; 
   cTXT0000126 = 'RT Auto Labels are checked.'; 
   cTXT0000127 = 'The log file has not been created.  Cannot open.'; 
   cTXT0000128 = 'Repairing Sequences ...'; 
   cTXT0000129 = 'Repairing Sequences'; 
   cTXT0000130 = 'Version updated'; 
   cTXT0000131 = 'Export finished successfully.';
   cTXT0000132 = 'Running script, %s...';
   cTXT0000133 = 'Apply user assigned mandatory columns.';
   cTXT0000134 = 'Existing enforcing trigger name: %s';
   cTXT0000135 = 'This option checks if any column is tagged ''Mandatory'' and creates appropriate enforcing trigger.'#13+
                 'In case no column is checked as ''Mandatory'' associated enforcing trigger will be dropped.'#13+
                 'It is recommended all previously entered records with null data be populated before installing '+
                 'this trigger to prevent performance issues.'#13#13+
                 'Are you sure you want to continue?';
   cTXT0000136 = 'Done. Enforcing trigger name: %s';
   cTXT0000137 = 'Done.  Please restart the Oracle instance.';
   cTXT0000138 = 'Do you want to enable Oracle Audit Logging?';
   cTXT0000139 = 'Saved to file ''%s''.';
   cTXT0000140 = 'Do you want to disable Oracle Audit Logging?  Disabling ' +
     'auditing will violate company compliance with the PCI Data Security ' +
     'Standard.';
   cTXT0000141 = 'Done.  Oracle audit logging is now disabled.';
   cTXT0000142 = 'Non-IQMS Schema';
   cTXT0000143 = 'Cancel running job, %s?';
   cTXT0000144 = 'Stopping scheduled job.  Please wait...';
   cTXT0000145 = 'Run job, %s, now?';
   cTXT0000146 = 'Executing scheduled job.  Please wait...';
   cTXT0000147 = 'Cancel all pending jobs?';
   cTXT0000148 = 'Purge log of all history?';
   cTXT0000149 = 'Purge Log Greater Than N Days';
   cTXT0000150 = 'Enter the interval in days:';
   cTXT0000151 = 'Are you sure you want to clear metadata?';
   cTXT0000152 = 'No metadata found';
   cTXT0000153 = 'Are you sure you want to propagate %s metadata?';
   cTXT0000154 = 'Accessing object, %s.  Please wait...';
   cTXT0000155 = 'Adding files to list ...';
   cTXT0000156 = 'Purging Recycle Bin';
   cTXT0000157 = 'Cancel all scheduled jobs?';
   // cTXT0000158 = '';
   cTXT0000159 = 'Count: %d';
   cTXT0000160 = 'ERROR:  Unable to resolve dependencies.';
   cTXT0000161 = 'Encountered %d unresolved database dependencies.';
   cTXT0000162 = 'Please email this log file to your IQMS representative.';
   cTXT0000163 = 'You are about to update database, %s. Do you want to continue?';
   cTXT0000164 = 'Processing locale country triggers';
   cTXT0000165 = 'Processing locale subdivision triggers';
   cTXT0000166 = '';
   cTXT0000167 = '';
   cTXT0000168 = '';
   cTXT0000169 = '';
   cTXT0000170 = '';
   cTXT0000171 = '';
   cTXT0000172 = '';
   cTXT0000173 = '';
   cTXT0000174 = '';
   cTXT0000175 = '';
   cTXT0000176 = '';
   cTXT0000177 = '';
   cTXT0000178 = '';
   cTXT0000179 = '';
   cTXT0000180 = '';
   cTXT0000181 = '';
   cTXT0000182 = '';
   cTXT0000183 = '';
   cTXT0000184 = '';
   cTXT0000185 = '';
   cTXT0000186 = '';
   cTXT0000187 = '';
   cTXT0000188 = '';
   cTXT0000189 = '';
   cTXT0000190 = '';
   cTXT0000191 = '';
   cTXT0000192 = '';
   cTXT0000193 = '';
   cTXT0000194 = '';
   cTXT0000195 = '';
   cTXT0000196 = '';
   cTXT0000197 = '';
   cTXT0000198 = '';
   cTXT0000199 = '';
   cTXT0000200 = '';
   cTXT0000201 = 'Start Time: %s';
   cTXT0000202 = 'End Time: %s';
   cTXT0000203 = 'Company Phone: %s';
   cTXT0000204 = 'Version: %s';
   cTXT0000205 = 'DD Mode: Update Structure';
   cTXT0000206 = 'Company Name: %s';
  //  DD_resourcestring.cTXT0000127


implementation

end.
