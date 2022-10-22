unit IQMS.WebVcl.ResourceStrings;

{ Purpose:  Contains resource string constants to be used for all VCL units.

  Note:     If you modify a VCL unit (.pas) by adding an embedded string
            (such as for a prompt or error), update this unit also and call the
            resourcestring constant instead.

            Also, before changing a string here, search \IQWin directories for
            areas it may already be used.  If you change it here, you change it
            everywhere. }

interface

resourcestring
   cTXT0000001 = 'Procedure not found.';
   cTXT0000002 = 'CType: %s, '; // BOM Tree: abbreviation for "Center Type"
   cTXT0000003 = ' (Qty: %s )'; // BOM Tree
   cTXT0000004 = ' [uom: %s] '; // BOM Tree
   cTXT0000005 = ':  %s%s per pkg';  // BOM Tree
   cTXT0000006 = ':  %s%s per item'; // BOM Tree
   cTXT0000007 = 'Unable to calculate main material required.'#13#13'%s';
   cTXT0000008 = ', Req: %s, Non-Cmt: %s';
   cTXT0000009 = ', Ext Cost: %.6f';

   cTXT0000010 = 'BOM_Tree.doc';
   cTXT0000011 = 'Date:'; // with colon
   cTXT0000012 = 'Date';  // no colon
   cTXT0000013 = 'BOM Tree Mfg # %s';
   cTXT0000014 = 'Printing, please wait...';
   cTXT0000015 = 'Change Description';
   cTXT0000016 = 'Change Description / Sequence';
   cTXT0000017 = 'Unable to find a document ID, %.0f';
   cTXT0000018 = 'Delete %s'; // refers to document
   cTXT0000019 = 'No documents found.  Cannot delete.';

   cTXT0000020 = 'Are you sure you want to delete (detach) this document?';
   cTXT0000021 = 'Are you sure you want to remove this document completely from the system?';
   cTXT0000022 = 'The Excel pivot table is being created.  Do not change the ' +
                 'export method during processing.  Please note that in design ' +
                 'mode calculated fields are not calculated.';
   cTXT0000023 = 'Output dataset does not contain any data. Operation aborted.';
   cTXT0000024 = 'Building Microsoft Excel PivotTable.  Please wait ...'; // note:  the spelling for PivotTable is from Microsoft help file
   cTXT0000025 = 'Data';      // Excel PivotTable sheet name
   cTXT0000026 = 'Analysis';  // Excel PivotTable sheet name
   cTXT0000027 = 'Microsoft Office Files (*.doc; *.xls; *.ppt; *.pps; *.mdb)|*.doc; *.xls; *.ppt; *.pps; *.mdb|';
   cTXT0000028 = 'Internet Files (*.htm; *.html; *.mhtml; *.mht; *.txt)|*.htm; *.html; *.txt;  *.mhtml; *.mht|';
   cTXT0000029 = 'Microsoft Word Documents (*.doc)|*.doc|';

   cTXT0000030 = 'Rich Text Format (*.rtf)|*.rtf|Text Files (*.txt)|*.txt|';
   cTXT0000031 = 'HTML Help Files (*.chm; *.html)|*.chm; *.html|';
   cTXT0000032 = 'Microsoft Excel Workbooks (*.xls)|*.xls|';
   cTXT0000033 = 'Microsoft Powerpoint Presentations (*.ppt; *.pps)|*.ppt; *.pps|';
   cTXT0000034 = 'All Graphics Files (*.jpg; *.jpeg; *.gif; *.bmp; *.tiff)|*.jpg; *.jpeg; *.gif; *.bmp; *.tiff|';
   cTXT0000035 = 'Video Files (*.idv; *.avi; *.m3u; *.mmm; *.m1v; *.mp2; *.mpa; *.mpe; *.mpeg; *.ra; *.ram; *.rm; *.asf; *.lsf; *.mov; *.qt)|*.idv; *.avi; *.m3u; *.mmm;  *.m1v; *.mp2; *.mpa; *.mpe; *.mpeg; *.ra; *.ram; *.rm;  *.asf; *.lsf; *.mov; *.qt|';
   cTXT0000036 = 'Sound Files (*.wav)|*.wav';
   cTXT0000037 = 'All Files (*.*)|*.*|';
   cTXT0000038 = 'Cannot find default Internet browser.';
   cTXT0000039 = 'You must enter a location to create a hyperlink.';
   
   cTXT0000040 = 'Remove hyperlink?';
   cTXT0000041 = 'Unable to parse SQL statement for SELECT..FROM..WHERE';
   cTXT0000042 = 'Found: %d';
   cTXT0000043 = 'Row Count: %s';
   cTXT0000044 = 'Showing inactive only.'#13'Click to toggle.';
   cTXT0000045 = 'Showing active only.'#13'Click to toggle.';
   cTXT0000046 = 'Click to change sort. '#13'Current sort: '#13;
   cTXT0000047 = 'Insert Hyperlink';
   cTXT0000048 = 'No enterprise plants found';
   cTXT0000049 = 'User is not assigned EPlant';

   cTXT0000050 = 'Cannot query EPlant table';
   cTXT0000051 = 'N/A';
   cTXT0000052 = 'Session has been altered.';
   cTXT0000053 = 'All Rights Reserved 1989 - %s';
//   cTXT0000054 = 'This option resets the form to the original settings. You will have to close the form to have the default settings restored.'#13#13+
//                 'Are you sure you want to reset the form to its default settings?';
   cTXT0000054 = 'This option resets the form to the original settings.  You must close and reopen the form to restore the default settings.'#13#13+
                 'Are you sure you want to reset the form to its default settings?';
   cTXT0000055 = 'N/A (Security Manager is Unavailable)';
   cTXT0000056 = 'IQ Replication Manager Status:'#13+
                 'Licensed: %s'#13 +
                 'Active (Del Log Enabled): %s';
   cTXT0000057 = 'The current default time zone difference between this workstation and the server is %f hour(s).'#13#10+
                 'Please note: this number is used only when the operating system fails to calculate the time zone difference.';
   cTXT0000058 = 'Fax must be entered';
   cTXT0000059 = 'None';

   cTXT0000060 = 'Launch Document Control';
   cTXT0000061 = 'Execute';
   cTXT0000062 = 'Print';
   cTXT0000063 = ' #'; // used to abbreviate sequence number
   cTXT0000064 = 'Library'; // document library
   cTXT0000065 = 'Document Description';
   cTXT0000066 = 'File Name';
   cTXT0000067 = 'Print With';
   cTXT0000068 = 'Status';
   cTXT0000069 = 'Revision';

   cTXT0000070 = 'File does not exist';
   cTXT0000071 = 'Document is checked out';
   cTXT0000072 = 'Document is pending authorization / review / effective date';
   cTXT0000073 = 'Document is released';
   cTXT0000074 = 'Doc ID';
   cTXT0000075 = 'The document is in the Pending Review/Authorization stage.'#13'Unable to proceed';
   cTXT0000076 = 'File %s not found'; // see IQMS.Common.ResourceStrings.cTXT0000125
   cTXT0000077 = 'Released';
   cTXT0000078 = 'Library must be selected';
   cTXT0000079 = 'Document must be selected';
   
   cTXT0000080 = 'Document file must be selected';
   cTXT0000081 = 'Add';
   cTXT0000082 = 'Edit';
   cTXT0000083 = 'Delete';
   cTXT0000084 = 'Print';
   cTXT0000085 = 'Stretch';
   cTXT0000086 = 'Sequence #';
   cTXT0000087 = 'Description';
   cTXT0000088 = 'Print With';
   cTXT0000089 = 'Changed On';
   cTXT0000090 = 'User Name';

   cTXT0000091 = 'Document Class Field cannot be greater than 2 characters long.';
   //cTXT0000092 = 'Document Class must be assigned a code or you cannot append documents.';
   cTXT0000092 = 'Document Class required.  Please assign a Document Class before adding documents.';
   cTXT0000093 = 'Document Description:';
   cTXT0000094 = 'Shrink Image';
   cTXT0000095 = 'Stretch Image';
   cTXT0000096 = 'Unable to rename directory %s to %s. Error Code = %d';
   cTXT0000097 = 'Unable to move generated report file %s to %s. Error Code = %d';
   cTXT0000098 = 'Unable to copy %s to %s. Error Code: %d'; // see IQMS.Common.ResourceStrings.cTXT0000065
   cTXT0000099 = 'Application: %s'#13'Owner Name: %s'#13'Component Name: %s';

   cTXT0000100 = 'Value cannot be blank.';
   cTXT0000101 = 'Jump information is unavailable'; // #13#13'[ DataSet: %s,  Field: %s = NULL ]';
   cTXT0000102 = 'Jump information is unavailable'; // #13#13'[ Unassigned DataSource and/or DataField ]';
   cTXT0000103 = 'Jump information is unavailable'; // #13#13'[ ID = NULL ]';
   cTXT0000104 = 'Select from Pick List';
   cTXT0000105 = 'Unknown or undetermined data type. Please contact IQMS.';
   cTXT0000106 = 'Unable to identify field, %s, in the Picklist dataset.';
   cTXT0000107 = 'Label Matrix Labels directory is undefined.  Please specify a Labels directory in System Parameters.';
   cTXT0000108 = 'Label Matrix EXE directory is undefined.  Please specify a Label Matrix EXE directory in System Parameters.';
   cTXT0000109 = 'Print Label for %s, %s';

   cTXT0000110 = 'Label Matrix directory is undefined. Unable to copy image to Label Matrix directory.';
   cTXT0000111 = 'IQMS Images directory is undefined. Unable to copy image to Label Matrix directory';
   cTXT0000112 = 'Valid quantity must be entered.';
   cTXT0000113 = 'Valid Labels Quantity must be entered';
   cTXT0000114 = 'Label Matrix directory is undefined.';
   cTXT0000115 = 'Incomplete Label Information.  ' + #13 +
                 'Please execute the Create DBF File option ' +
                 '(when positioned on that label) in the Label Maintenance form.';
   cTXT0000116 = 'Class %s of ARINVT ID, %.0f, does not match the internal value, %s.';
   cTXT0000117 = 'Item # %s of ARINVT ID, %.0f, does not match the internal value, %s.';
   cTXT0000118 = 'Revision %s of ARINVT ID, %.0f, does not match the internal value, %s.';
   cTXT0000119 = 'Description %s of ARINVT ID, %.0f, does not match the internal value, %s.';

   cTXT0000120 = 'MFG # %s does not belong to Item # %s of ARINVT ID, %.0f.';
   cTXT0000121 = 'Field, %s, not found.'#13 +
                 'Please rerun Label Edit routine and recreate the label.';
   cTXT0000122 = 'Unable to set current directory to %s.';
   cTXT0000123 = 'Unable to delete file, %s.';
   cTXT0000124 = 'Unable to rename %s to %s.';
   cTXT0000125 = 'Error Executing Label Matrix.'#13#13+
                 'Error Code: %d'#13+
                 'Labels Directory: %s'#13+
                 'Label Matrix EXE Directory: %s';
   cTXT0000126 = 'Not a Finish Goods item (ARINVT_ID = %.0f).';
   cTXT0000127 = 'Item is not found in inventory.';
   cTXT0000128 = '(Lbs.)';
   cTXT0000129 = '(Gr.)';
   
   cTXT0000130 = 'Please enter a valid Box Quantity.';
   cTXT0000131 = 'Please enter a valid Box Number.';
   cTXT0000132 = 'Please enter a valid Weight.';
   cTXT0000133 = 'The first Box Number is editable.'#13'Click to swich to Read Only.';
   cTXT0000134 = 'The first Box Number is Read Only.'#13'Click to edit.';
   cTXT0000135 = 'Failed to locate label ID = %.0f. Check selected label';
   cTXT0000136 = 'Would you like to print another label?';
   cTXT0000137 = 'Error';
   cTXT0000138 = '%s and %s are mutually exclusive.  Please choose one or the other.';
   cTXT0000139 = 'Please choose either %s or %s or %s.';

   cTXT0000140 = 'Invalid file name.';
   cTXT0000141 = 'Do you wish to overwrite the existing template?';
   cTXT0000142 = 'The Actual Width cannot be greater then the default width.';
   cTXT0000143 = 'The Actual Width cannot be zero.';
   cTXT0000144 = 'Defaults have been reset.';
   cTXT0000145 = 'Cannot proceed.  Please copy this report into the EnterpriseIQ subdirectory, %s.';
   cTXT0000146 = 'DBF file created.';
   cTXT0000147 = 'Could not locate SQL statement.';
   cTXT0000148 = 'No parameter records defined in Segment Params Table.';
   cTXT0000149 = 'Error %s'#13 +
                 'Token Code          %s'#13 +
                 'Form Name           %s'#13 +
                 'DataSet             %s'#13 +
                 'Parameter           %s'#13 +
                 'Data Set Field Name %s'#13 +
                 'SQL : %s'#13;

   cTXT0000150 = 'Registered Reports (ID: %s)'; // RepDef form caption
   cTXT0000151 = 'Registered Reports - Database is Unavailable';
   cTXT0000152 = 'Invalid character found in the file name.'#13#13 +
                 'The following characters are not supported: '#13'%s';
   cTXT0000153 = 'Creating report.  Please wait...';

   cTXT0000154 = 'Executing %s ...'; // refers to storec procedure
   cTXT0000155 = 'Parent App ID   : %s'+#10#13+
                 'Report File Name: %s';
   cTXT0000156 = 'You must upgrade your list of Registered Reports. Would you like to do it now?';
   cTXT0000157 = 'Unable to locate field %s or %s in the DBF file. The field is going to be skipped.';
   cTXT0000158 = 'Importing %s.  Please wait...';
   cTXT0000159 = '%s.'#13#13' Upgrade failed on %s. You will be able to proceed now ' +
                 'and upgrade Registered Reports next time you click on Reports.';

   //cTXT0000160 = 'Unable to Delete (imported - OK) File %s. ' +
   //              'Please check your access rights and/or file''s ReadOnly property';
   cTXT0000160 = 'The file, %s, was imported successfully but it could not be deleted.' +
                 'Please verify your access rights and/or the file''s ReadOnly property';
   cTXT0000161 = 'Please enter valid unary operator: ''='', ''NOT'' ';
   cTXT0000162 = 'Please enter valid binary operator: ''OR'', ''AND'' ';
   cTXT0000163 = 'Are you sure you want to clear Selection Criteria?';
   cTXT0000164 = 'Attention! Email address is blank.';
   cTXT0000165 = 'Report Description';
   cTXT0000166 = 'Hidden';
   cTXT0000167 = 'This option clears ''Hidden'' flag for ALL the reports on this menu. Continue?';
   cTXT0000168 = 'Show/hide user-defined record view';
   cTXT0000169 = 'Filter dataset';

   cTXT0000170 = 'Toggle selected';
   cTXT0000171 = 'Select all';
   cTXT0000172 = 'Sorting Dataset ...';
   cTXT0000173 = 'Sorting is not available on column, %s.';
   cTXT0000174 = 'No Security Inspector selected.';
   cTXT0000175 = 'Security Manager is not assigned.';
   cTXT0000176 = 'Insufficient rights.  Access denied. [%s, %s]';
   cTXT0000177 = 'Proceeding with no registered licensed modules.';
   cTXT0000178 = 'The following components have not been found on %s and ' +
                 'have been removed from the Registered Security Components list:'; // refers to form name
   cTXT0000179 = 'Save Components Names';
   
   cTXT0000180 = 'Insufficient rights.  Access denied. [%s]';
   cTXT0000181 = 'Insufficient rights.  Access denied.';
   cTXT0000182 = 'You must have DBA rights or security role granted along with allowed access in order to invoke Security Inspector.';
   cTXT0000183 = 'Click to view Hierarchical Tree of users'#13'that can be approved by the user';
   {cTXT0000184 = 'A WebMaster can access any WebDirect module provided '#13+
                 '(s)he is a customer who is granted access to these'#13+
                 'modules.'#13#13+
                 'See Customer Maintenance, Contact tab.';}
   cTXT0000184 = 'WebMasters can open any WebDirect module, provided '#13 +
                 'they have access rights to the module '#13 +
                 '(see Customer Maintenance, Contact tab).';
   cTXT0000185 = 'EnterpriseIQ Security Inspector: No Form is Focused';
   cTXT0000186 = 'EnterpriseIQ Security Inspector: %s (Code: %s)';
   cTXT0000187 = 'EnterpriseIQ Security Inspector: %s';
   cTXT0000188 = 'Undefined Security: %s (%s)';
   cTXT0000189 = 'Item: %s (%s)';

   cTXT0000190 = 'Form is not secured.';
   cTXT0000191 = 'Grant all rights to a form?';
   cTXT0000192 = 'Revoke all rights from a form?';
   cTXT0000193 = 'No roles found to be cloned.';
   cTXT0000194 = 'Clone Existing Role'; // input query form caption
   cTXT0000195 = 'Enter new role name'; // input query prompt
   cTXT0000196 = 'Are you sure you want to exit Security Inspector?';
   cTXT0000197 = 'Security Register has not been assigned to this window.';
   cTXT0000198 = 'This operation is not allowed.';
   cTXT0000199 = 'Circular reference detected!  User, %s, cannot have PO Approver, %s.'#13#13+
                 'PO Approver, %s, is reverted to %s'#13#13'%s';

   cTXT0000200 = 'Auto Shutdown Threshold must be at least 60 seconds. Assign 0 to turn off Auto-Shutdown.';
   cTXT0000201 = 'Existing roles will be deleted. Do you wish to continue?';
   cTXT0000202 = 'Focus:'; // followed by space character
   cTXT0000203 = 'Do you wish to deny access system-wide %s?'#13 +
                 '''Deny system-wide %s'' will override the setting of the component for any role'#13 +
                 'as opposed to regular %s that is only applicable to this role.';
   cTXT0000204 = 'Deny system wide %s';
   cTXT0000205 = 'Email Address';
   cTXT0000206 = 'Enter Email address';
   cTXT0000207 = 'Transaction is canceled.';
   cTXT0000208 = 'Execution Timing'; //IQMS.WebVcl.Time
   cTXT0000209 = '&File';

   cTXT0000210 = '&Save to Text File';
   cTXT0000211 = '&Save to Bitmap File';
   cTXT0000212 = 'hits'; // IQTiming:  refers to how many times a method is called
   cTXT0000213 = 'Text Files (*.txt)|*.txt';
   cTXT0000214 = 'Transaction Batch # is zero.  Unable to execute transaction.';
   cTXT0000215 = 'No pending transactions found.  Nothing has been processed.';
   cTXT0000216 = 'VMI location %s cannot be part of the transaction.  Unable to execute transaction.';
   cTXT0000217 = 'FGMulti ID is zero.  Unable to execute transaction.';
   cTXT0000218 = 'Transaction Quantity is zero.  Unable to execute transaction.';
   cTXT0000219 = 'Toggle to Conform'; // FTrans_Reason

   cTXT0000220 = 'Toggle to Non Conform'; // FTrans_Reason
   cTXT0000221 = 'Day_Part ID is zero.  Unable to execute transaction.';
   cTXT0000222 = 'No associated transaction has been selected.'; 
   cTXT0000223 = 'RMA Detail ID is zero.  Unable to execute transaction.';
   cTXT0000224 = 'Repair Finished'; // FTrans_Reason
   cTXT0000225 = 'Close';
   cTXT0000226 = 'Click to change record view layout';
   cTXT0000227 = 'Application Error:';
   cTXT0000228 = 'User Defined Item'; // UDSelGridField caption
   cTXT0000229 = 'Are you sure you want to delete all items?';

   cTXT0000230 = 'Unknown customer.  This report requires formula for WEB_ARCUSTO_ID.  Unable to continue.';
   cTXT0000231 = 'Item already exists in the sort list.';
   cTXT0000232 = 'Query Information (ID = %.0f)'; // form caption, qryinfo.pas
   cTXT0000233 = 'Parameter';
   cTXT0000234 = 'Value';
   cTXT0000235 = 'Filter: %s';
   cTXT0000236 = 'Cannot connect to server, %s.'#13#13'Error Message: %s';
   cTXT0000237 = 'Cannot connect to server, %s.';
   cTXT0000238 = 'Executing replication between multiple sites';
   cTXT0000239 = 'Finished successfully';

   cTXT0000240 = 'Finished with %d warning(s)';
   cTXT0000241 = 'Terminated with %d exception(s)';
   cTXT0000242 = '%s. Time = %s';
   cTXT0000243 = 'No replication modules specified';
   cTXT0000244 = 'No replicated tables specified for module, %s.';
   cTXT0000245 =  'Failed to verify/update company code %s in the system table of server %s'#13#13 +
                  '%s'#13#13'Abort processing?';
   cTXT0000246 = 'Check alias, %s.  Missing GL Plug-In value.';
   cTXT0000247 = 'Failed to update company code %s in table %s using dblink = %s'#13#13 +
                 '%s'#13#13'Abort processing?';
   cTXT0000248 = 'Error deleting from table %s on %s from %s: ''%s''';
   cTXT0000249 = 'Table %s on %s had EID(s) = NULL. IQRepMng attempted to populate EID(s) using: %s';

   cTXT0000250 = 'Table %s on %s has EID(s) = NULL.';
   cTXT0000251 = 'Error replicating table %s on %s from %s: ''%s''';
   cTXT0000252 = '%s PO Approver Tree'; // form caption; refers to user name
   cTXT0000253 = 'Are you sure you want to clear variables?'; // report params
   cTXT0000254 = 'Include %s'; // refers to table name
   cTXT0000255 = 'Missing Current Record Column Name Indentifier or Matching CRW Column Name Indentifier';
   cTXT0000256 = 'Missing Operator.  Please Check AND/OR column in Selection Criteria Grid.';
   cTXT0000257 = 'Item, %s, already selected.';
   cTXT0000258 = 'Nothing is selected.';
   cTXT0000259 = '';
   cTXT0000260 = 'Recipient name must be entered';
   cTXT0000261 = 'Missing recipient name.';
   cTXT0000262 = 'Missing recipient fax number.';
   
   cTXT0000263 = 'Location ''%s'' is allocated to Lot# %s of Item# %s, WO# %.0f and cannot be part of the transaction.';
   cTXT0000264 = 'Unable to verify material allocation for fgmulti_id = %f';
   cTXT0000265 = 'Unable to move %s to %s. Error Code: %d'; 
   
   cTXT0000266 = 'Propagate sort is currently supported only for associated dataset of TTable type';
   cTXT0000267 = 'Unable to propagate sort or scope - Associated DataSet is not assigned';
   cTXT0000268 = 'Unable to propagate the sort - sorting column ''%s'' is not available in %s dataset.'#13+
                 'Execution will continue normally using current sorting criteria by ''%s''';
   cTXT0000269 = 'Sorting by %s ...';
   cTXT0000270 = 'Unable to propagate scope - ID is not available in the picklist dataset';
   cTXT0000271 = 'Unable to propagate scope - ID is not available in the %s dataset';
   cTXT0000272 = 'Assigning Scope ...';
   cTXT0000273 = 'Cannot point to itself - select TDataSource with TTable dataset to be controled based on picklist sort and scope';
   cTXT0000274 = 'Unable to propagate sort - Associated DataSet has IndexFieldNames or IndexName already assigned';
   
   cTXT0000275 = 'Edit User Defined List';
   cTXT0000276 = 'Property KeyTableName is not assigned ( %s on %s )';
   cTXT0000277 = 'Property KeyFieldName is not assigned ( %s on %s )';
   cTXT0000278 = 'Passed owner must be of class TIQWebUDComboBox';
   cTXT0000279 = 'KeyTableName or KeyFieldName is undefined';
   cTXT0000280 = 'Owner is NIL';
   cTXT0000281 = 'Table: %s';
   cTXT0000282 = 'Field: %s';
   cTXT0000283 = 'ID: %.0f';
   cTXT0000284 = 'Right click to edit the list';

   cTXT0000285 = 'All';                         // For Int/Ext Doc "Print With" field
   cTXT0000286 = 'BOM';                         // For Int/Ext Doc "Print With" field
   cTXT0000287 = 'Inspection Receipt';          // For Int/Ext Doc "Print With" field
   cTXT0000288 = 'Invoice';                     // For Int/Ext Doc "Print With" field
   cTXT0000289 = 'Packing Slip';                // For Int/Ext Doc "Print With" field
   cTXT0000290 = 'MRO Work Order';               // For Int/Ext Doc "Print With" field
   cTXT0000291 = 'PO';                          // For Int/Ext Doc "Print With" field
   cTXT0000292 = 'Project';                     // For Int/Ext Doc "Print With" field
   cTXT0000293 = 'Project Work Order';          // For Int/Ext Doc "Print With" field
   cTXT0000294 = 'RFQ';                         // For Int/Ext Doc "Print With" field
   cTXT0000295 = 'Sales Order';                 // For Int/Ext Doc "Print With" field
   cTXT0000296 = 'Sales Order Acknowledgement'; // For Int/Ext Doc "Print With" field
   cTXT0000297 = 'Web';                         // For Int/Ext Doc "Print With" field
   cTXT0000298 = 'Work Order';                  // For Int/Ext Doc "Print With" field
   cTXT0000299 = 'Sales Quotation';               // For Int/Ext Doc "Print With" field
   cTXT0000300 = 'About %s';
   
   cTXT0000301 = 'The document is not available - it is expired and requires review.';
   
   cTXT0000302 = 'Document has expired';
   
   cTXT0000303 = 'This report is based on a Stored Procedure, but the input parameters are incorrectly named.  Correct the Procedure & Report before attempting to add this report.';
   cTXT0000304 = 'Value';
   cTXT0000305 = 'From';
   
   cTXT0000306 = 'Unable to continue - missing mandatory field ''Lot #''.';
   
   cTXT0000307 = 'Qty 0 is about to be printed on label %d. Continue printing this label?';
   
   cTXT0000308 = ':  %.6f%s per pkg';  // BOM Tree
   cTXT0000309 = ':  %.6f%s per item'; // BOM Tree
   
   cTXT0000310 = ', On Hand: %s';
   
   cTXT0000311 = 'Unable to propagate the sort - sorting column ''%s'' is not available in %s dataset.';
   cTXT0000312 = 'Unable to propagate the sort - key words HPICK_PROPAGATE_SORT_START or HPICK_PROPAGATE_SORT_END is not available in %s dataset.';
   
   cTXT0000313 = 'In Transit location cannot be part of the transaction.  Unable to execute transaction.';
   
   cTXT0000314 = 'Missing file %s - unable to continue.';
   cTXT0000315 = 'The associated BOM is marked inactive (ARINVT_ID = %.0f) - unable to proceed.';
   cTXT0000316 = 'About to apply "Create DBF File" to every label - are you sure you wish to continue?';
   cTXT0000317 = 'DBF files created successfully';
   cTXT0000318 = 'My Documents';
   cTXT0000319 = 'My Network Places';
   cTXT0000320 = 'Desktop Documents';
   cTXT0000321 = 'My Computer';
   cTXT0000322 = 'Desktop';

   cTXT0000323 = 'IQMS and RTBOX security profile must be DEFAULT.';
   
   cTXT0000324 = 'Unable to prompt for date value. '#13+
                 '%s';
   cTXT0000325 = 'Start Date';
   cTXT0000326 = 'End Date';
   cTXT0000327 = 'Valid Volume must be entered.';
   
   cTXT0000328 = 'Certificate of Conformance';
   cTXT0000329 = 'View email';
   cTXT0000330 = 'Please select at least one item from the list.';
   cTXT0000331 = 'Execute all actions now?';
   cTXT0000332 = 'Report name cannot exceed 50 chars.'; 
   cTXT0000333 = 'Routing Packet'; 
   cTXT0000334 = 'Parent record has not been assigned.  The document cannot ' +
     'be associated with an undefined parent.';
   
   cTXT0000335 = 'Place Shortcut'; 
   cTXT0000336 = 'Shortcut Seq'; 
   
   cTXT0000337 = 'Entry length exceeds the field length of '; 
   cTXT0000338 = 'Location is marked as hard allocated to WO# %s. Transaction aborted'; 
   cTXT0000339 = 'Hard allocated inventory is only allowed to be moved between locations allocated to the same WO#'; 
   cTXT0000340 = 'Copy';
   cTXT0000341 = 'Cannot open file (Error Code = %d).';
   
   cTXT0000342 = 'Cannot consume location ''%s'' marked as hard allocated to a sales order (SO/Line: %s). Transaction aborted.'; 
   cTXT0000343 = 'Make-To-Order mismatch of WO# %.0f (SO/Line: %s) and Location ''%s'' (SO/Line: %s). Transaction aborted.';
   cTXT0000344 = 'MakeToOrder hard allocated inventory is only allowed to be moved between locations allocated to the same SO#'; 
   cTXT0000345 = 'MakeToOrder hard allocated inventory violation. Transaction aborted'; 
   cTXT0000346 = 'Sorting is not available on field ''%s'''; 
   cTXT0000347 = 'Rework ID is zero.  Unable to execute transaction.';
   cTXT0000348 = 'Rework'; 
   cTXT0000349 = 'Rework Finished'; 
   cTXT0000350 = 'Please note DBA user is always granted unconditional access to the Security Inspector regardless of the field ''%s'' setting.'; 
   cTXT0000351 = 'Label(s) with 0 qty is about to be printed. Continue printing?';
   cTXT0000352 = 'You must have DBA rights - operation aborted.';
   cTXT0000353 = 'Operation is not allowed for user RTBOX.';
   cTXT0000354 = 'This is a read-only, informational dataset.  Operation is not applicable.';
   cTXT0000355 = 'Vendor RFQ'; 
   cTXT0000356 = 'Add Security Items [ %s ]';
   cTXT0000357 = 'No item selected - operation aborted.'; 
   cTXT0000358 = 'Missing mandatory field ''Lot #'' and/or insufficient qty in dispo out location during disposition. [ Item: %s, Loc: %s ]';
   cTXT0000359 = 'No records found.'; 
   cTXT0000360 = 'Cannot find internal documents table, %s, on database, %s.  ' +
    'Processing will continue, but you will not be able to view internal ' +
    'documents using this table.';
   cTXT0000361 = 'Due to existing filter condition the count may take ' +
    'several minutes. Are you sure you want to continue?';
   cTXT0000362 = 'Adjust Process WIP'; 
   cTXT0000363 = 'Missing mandatory field ''Lot Date''. [ Item: %s, Loc: %s ]';
   cTXT0000364 = 'Scan Document'; 
   cTXT0000365 = 'This option scans document and appends the scanned image to ' +
    'the library. Are you sure you want to continue?';
   cTXT0000366 = 'EIQ Mobile license agreement is exceeded - operation aborted';
   cTXT0000367 = 'The Box Quantity you entered is greater than the standard ' +
    'box quantity.  Continue?';
   cTXT0000368 = 'Proceeding with no registered licensed modules.'#13#13'%s';
   cTXT0000369 = 'Rework Work Order'; 
   cTXT0000370 = 'Move To Non-Conform';
   cTXT0000371 = 'Move From Non-Conform';  
   cTXT0000372 = 'Error - Duplicate Scan';
   cTXT0000373 = 'Duplicated security role.  Operation aborted';
   cTXT0000374 = 'Duplicated security group.  Operation aborted';
   cTXT0000375 = 'SIC Inventory item - negative qty is not allowed. Operation aborted.';
   cTXT0000376 = 'PickTicket';
   cTXT0000377 = 'Remove Filter'; 
   cTXT0000378 = 'User ID must be entered.';
   cTXT0000379 = 'Password must be entered.'; 
   cTXT0000380 = '%s - operation aborted.'; 
   cTXT0000381 = 'Selected settings such as roles, memberships etc will be reset to match %s settings. Do you wish to continue?';
   cTXT0000382 = 'User Name must be specified - operation aborted';
   cTXT0000383 = 'This option allows to append a new document to the %s library and select the document in one step. Are you sure you want to continue?';
   cTXT0000384 = 'Your changes will be cancelled.';
   cTXT0000385 = 'Missing SQL statement.';
   cTXT0000386 = 'MasterSource has been provided, but parent/child field names have not be supplied (MasterFields and IndexFieldNames).';
   cTXT0000387 = 'Encountered error opening cursor';
   cTXT0000388 = 'Doc #'; 
   cTXT0000389 = 'Owner'; 
   cTXT0000390 = 'Expired'; 
   cTXT0000391 = 'Adding files to Email Correspondence ...';
   cTXT0000392 = 'In Transit Location - negative qty is not allowed. Operation aborted.';
//   cTXT0000393 = '';
//   cTXT0000394 = '';
//   cTXT0000395 = '';
//   cTXT0000396 = '';
   cTXT0000397 = 'Assign ''Print With'' ...';
   cTXT0000398 = 'Item # %s is no longer the current job.  Please confirm to continue.';
   cTXT0000399 = 'Vendor RFQ'; 
   cTXT0000400 = 'Auto-EForm'; 
   cTXT0000401 = 'Warning!'#13#13'IQMS user is assigned security profile with Password Life Time set to %s.';
   cTXT0000402 = 'Encountered error saving email body text.';
   cTXT0000403 = 'Do you wish to grant Web Direct Access to %s?';
   cTXT0000404 = 'Continue';
   cTXT0000405 = 'Unable to find appended email with the subject line ''%s'' - check your filter settings.';
   cTXT0000406 = 'Invalid relieve location due to possible MTO mismatch between work order and relieve location.';
   cTXT0000407 = 'Search';
   cTXT0000408 = ':  %.6f (%s%%) %s per item'; // BOM Tree, mfgtype = COMPOUND1
   cTXT0000409 = 'Show Revisions';
   cTXT0000410 = 'Sort Criteria.'#13'Click to review ...';
   cTXT0000411 = 'No Training Req ';
   cTXT0000412 = 'This option resequences the records alpha numerically. Do you wish to continue?';
   cTXT0000413 = 'There are no active windows containing security items.  Cannot launch Security Inspector.';
   cTXT0000414 = 'Expired';
   cTXT0000415 = 'User Text 7';
   cTXT0000416 = 'Last Modified';
   cTXT0000417 = 'File Name cannot be blank.  Please revise.';
   cTXT0000418 = 'You are about to void a packing slip.';
   cTXT0000419 = 'Please select a voiding method before continuing.';
   cTXT0000420 = 'Access denied.  You are not licensed to use this module.';
   cTXT0000421 = 'Access denied.  You are not licensed to use %s.';
   cTXT0000422 = 'Unable to propagate scope - %s is not available in the picklist dataset';
   cTXT0000423 = 'Unable to propagate scope - %s is not available in the %s dataset';
   cTXT0000424 = 'Lot # is Mandatory for %s.'#13#13'Continue?';
   cTXT0000425 = 'Lot # is Mandatory for %s - operation aborted.';
   cTXT0000426 = 'The IQWIN95 BDE Alias is incompatible with Service User authentication.  '+
                 'Please delete the IQWIN95 Alias from the BDE Database Aliases list, '+
                 'from within the BDE administrator.';
   cTXT0000427 = 'User Text 1';
   cTXT0000428 = 'User Text 2';
   cTXT0000429 = 'User Text 3';
   cTXT0000430 = 'User Text 4';
   cTXT0000431 = 'User Text 5';
   cTXT0000432 = 'User Text 6';
   cTXT0000433 = 'Unknown vendor.  This report requires formula for WEB_VENDOR_ID.  Unable to continue.';
   cTXT0000434 = 'Scan';
   cTXT0000435 = 'Access Denied.'#13#13'Editing User Defined Label captions has been restricted by your security profile.';
   cTXT0000436 = 'Are you sure you wish to remove %s?';
   cTXT0000437 = 'Missing mandatory lot expiration date - operation aborted';
   cTXT0000438 = 'Clone Security Group?';
   cTXT0000439 = 'Security group name must be specified - operation aborted';
   cTXT0000440 = 'Security group description must be specified - operation aborted';
   cTXT0000441 = 'Clone Security Group [ %s ]';
   cTXT0000442 = 'File does not exist';
   cTXT0000443 = 'Label with the same kind and type already exists';
   cTXT0000444 = 'All (*.jpg;*.jpeg;*.bmp;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.emf;*.' +
    'wmf|JPEG Image File (*.jpg;*.jpeg)|*.jpg;jpeg|Bitmaps (*.bmp)|*.' +
    'bmp|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf';
   cTXT0000445 = 'No image loaded.';
   cTXT0000446 = 'Image File Created';
   cTXT0000447 = 'What do you want to do?';
   cTXT0000448 = 'Open image file';
   cTXT0000449 = 'Open file location';
   cTXT0000450 = 'Error inserting image record:';
   cTXT0000451 = 'Replace current image?';
   cTXT0000452 = 'Unsupported image file type.  Cannot add:';
   cTXT0000453 = 'Add Image';
   cTXT0000454 = 'Do you want to add or replace an image?';
   cTXT0000455 = 'Add a new image';
   cTXT0000456 = 'Update the current image';
   cTXT0000457 = 'Edit Description';
   cTXT0000458 = 'Delete label record?';
   cTXT0000459 = 'Inactive Document';
   cTXT0000460 = 'Select Image';
   cTXT0000461 = 'Image #';
   cTXT0000462 = 'Is Default?';
   cTXT0000463 = 'Added';
   cTXT0000464 = 'Added By';
   cTXT0000465 = 'Delete image?';
   cTXT0000466 = 'Open';
   cTXT0000467 = 'Edit';
   cTXT0000468 = 'Rename';
   cTXT0000469 = 'Remove';
   cTXT0000470 = 'The selected file, %s, is a local file and will not be ' +
     'accessible to network users.  Do you still wish to attach the file?';
   cTXT0000471 = 'The link has either been broken or no longer exists.  ' +
     'Please verify the link.';
   cTXT0000472 = 'Remove link?';
   cTXT0000473 = 'Rename Hyperlink';
   cTXT0000474 = 'Enter new name:';
   cTXT0000475 = 'Copy Link Address';
   cTXT0000476 = 'Save selection criteria?';
   cTXT0000477 = 'Selection criteria description';
   cTXT0000478 = 'Enter description';
   cTXT0000479 = 'Are you sure you want to remove this selection criteria?';
   cTXT0000480 = 'Selection criteria description must be entered - operation aborted.';
   cTXT0000481 = 'Summary';
   cTXT0000482 = 'Scope';
   cTXT0000483 = 'Last SQL';
   cTXT0000484 = 'SQL information is unavailable.';
   cTXT0000485 = 'Delete record?';
   cTXT0000486 = 'Accessing data.  Please wait...';
   cTXT0000487 = 'The document is in the Pending Review/Authorization stage.'#13'Unable to proceed';
   cTXT0000488 = 'No previous version was found – unable to proceed.'#13'Document must have ''Released'' status.';
   cTXT0000489 = 'Revision identified by ID %.0f was not found – unable to proceed.';
   cTXT0000490 = 'Evaluating selected filter - please wait...';
   cTXT0000491 = 'Filter settings are incomplete - unable to proceed.';
   cTXT0000492 = 'Component Where Used Search/Filter: OFF. '#13'Click to Select Filter ';
   cTXT0000493 = 'Component Where Used Search/Filter: ON. '#13'Filter Description:'#13'%s';
   cTXT0000494 = '''%s'' is a required dimension for this inventory item that has not been populated';
   cTXT0000495 = 'Component Where Used Search/Filter';
   cTXT0000496 = 'Application Error:  The key field name could not be determined.';
   cTXT0000497 = 'Application Error:  A document has not been assigned.';
   cTXT0000498 = 'Application Error:  The document table could not be determined.';
   cTXT0000499 = 'Application Error:  The key field name could not be determined.';
   cTXT0000500 = 'Application Error:  The master field value could not be determined.';
   cTXT0000501 = 'The selected document has already been assigned.';
   cTXT0000502 = 'Insufficient component quantity in Dispo Out location. '#13#13 +
     'Item #: %s'#13 +
     'Transaction Quantity:  %f'#13 +
     'Location: %s'#13 +
     'On Hand:  %f';
   cTXT0000503 = 'Unable to extract ''Received'' date from ''%s''';
   cTXT0000504 = 'Delete Email Correspondence record?';
   cTXT0000505 = 'Library Description';
   cTXT0000506 = 'Encountered error assigning AKA information:';
   cTXT0000507 = 'Cannot locate selected record.';
   cTXT0000508 = 'Cannot locate selected record.  Please check EPlant filter.';
   cTXT0000509 = 'Could not calculate field value for UOM, %s. Encountered ' +
     'error: %s';
   cTXT0000510 = 'Non-Conforming ID must be provided.  Operation aborted.';
   cTXT0000511 = 'Location has already been flagged as non-conforming.  Operation aborted.';
   cTXT0000512 = 'Location has already been set to conforming.  Operation aborted.';
   cTXT0000513 = 'Delete %d records?';
   cTXT0000514 = '(Not Available)';
   cTXT0000515 = 'Are you sure you want to lock account, ''%s''?';
   cTXT0000516 = 'Are you sure you want to unlock account, ''%s''?';
   cTXT0000517 = 'Duplicate Pay Group.  Operation aborted.';
   cTXT0000518 = 'Would you like to copy the employee''s email address to this user?';
   cTXT0000519 = 'Profile name, ''Default,'' is an Oracle reserved name.  Operation is not allowed.';
   cTXT0000520 = 'Spaces are not allowed in the security profile name.  Operation aborted.' ;
   cTXT0000521 = 'Another user has already been assigned this profile.  Operation is not allowed.';
   cTXT0000522 = '%d users have already been assigned this profile.  Operation is not allowed.';
   cTXT0000523 = 'Failed login attempts before the account is locked';
   cTXT0000524 =  'Limits the number of days the same password can be used for authentication';
   cTXT0000525 = 'Number of days before a password can be reused';
   cTXT0000526 = 'Number of password changes required before the current password can be reused';
   cTXT0000527 = 'Password complexity verification script';
   cTXT0000528 = 'Number of days an account will be locked after maximum failed login attempts';
   cTXT0000529 = 'Number of days after the grace period begins during which a warning is issued and login is allowed';
   cTXT0000530 = 'Define title for column, %s';
   cTXT0000531 = 'The security option, ''DBA Needs Application Roles,'' has ' +
     'been changed.  DBA users must exit and log back in for the change to ' +
     'take effect.';
   cTXT0000532 = 'Are you sure you want to delete the role, ''%s''?';
   cTXT0000533 = 'The following user(s) are assign to the role:';
   cTXT0000534 = 'The role is assigned to the following group(s):';
   cTXT0000535 = 'Invalid option for user, RTBOX.  Operation aborted.';
   cTXT0000536 = 'Unable to locate username, %s.  Operation aborted.';
   cTXT0000537 = 'Delete selected record(s)?';
   cTXT0000538 = 'Default';
   cTXT0000539 = 'Unlimited';
   cTXT0000540 = 'Unable to remove filter record.  Operation aborted.';
   cTXT0000541 = 'Please assign an Advanced Filter.';
   cTXT0000542 = 'Add Filter';
   cTXT0000543 = 'Enter the filter name';
   cTXT0000544 = 'Filter name, %s, already exists.  Please enter a unique name.';
   cTXT0000545 = 'Please enter a sort criteria.';
   cTXT0000546 = 'Add Sort Criteria';
   cTXT0000547 = 'Enter the criteria name';
   cTXT0000548 = 'Criteria name, %s, already exists.  Please enter a unique name.';
   cTXT0000549 = 'XML files (*.xml)|*.XML|Any file (*.*)|*.*';
   cTXT0000550 = 'Excel files (*.xls)|*.XLS|Any file (*.*)|*.*';
   cTXT0000551 = 'Export finished successfully.';
   cTXT0000552 = 'Record count: %s';
   cTXT0000553 = 'Division';
   cTXT0000554 = 'Propagate the sort to the associated table %s.'#13+
     'Currently sorted by: %s';
   cTXT0000555 = 'Propagate the scope to the associated table %s.';
   cTXT0000556 = 'Warehouse';
   cTXT0000557 = 'Filter: %s';
   cTXT0000558 = 'Advanced Search Filter: %s';
   cTXT0000559 = 'XML Format';
   cTXT0000560 = 'Excel Format';
   cTXT0000561 = 'Export Data';
   cTXT0000562 = 'Copy Cell to Clipboard';
   cTXT0000563 = 'User Date 1';
   cTXT0000564 = 'User Date 2';
   cTXT0000565 = 'User Date 3';
   cTXT0000566 = 'User Date 4';
   cTXT0000567 = 'User Date 5';
   cTXT0000568 = 'User Date 6';
   cTXT0000569 = 'User Numeric 1';
   cTXT0000570 = 'User Numeric 2';
   cTXT0000571 = 'User Numeric 3';
   cTXT0000572 = 'User Numeric 4';
   cTXT0000573 = 'User Numeric 5';
   cTXT0000574 = 'User Numeric 6';
   cTXT0000575 = 'User Numeric 7';
   cTXT0000576 = 'User Numeric 8';
   cTXT0000577 = 'User Numeric 9';
   cTXT0000578 = 'User Numeric 10';
   cTXT0000579 = 'AR Invoice';
   cTXT0000580 = 'User Text %d';
   cTXT0000581 = 'User Numeric %d';
   cTXT0000582 = 'User Date %d';
   cTXT0000583 = 'Add this record to favorites';
   cTXT0000584 = 'Added to favorites!';
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

   //  IQMS.WebVcl.ResourceStrings.cTXT0000402

implementation

end.


