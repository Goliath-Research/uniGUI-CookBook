unit edi_rscstr;

interface

// edi_rscstr.cTXT0000294 {'Parent record must be assigned.'}

resourcestring
   cTXT0000001 = 'File %s written to %s, %s was not found or could not be created';
   cTXT0000002 = 'File %s written to edi_hist, %s was not found';
   cTXT0000003 = 'Cannot move file, %s';
   cTXT0000004 = 'File not found';
   cTXT0000005 = 'Cannot lock temporary EDI Tables. Process is locked either by ' +
    'EServer or by another Compress session.';
   cTXT0000006 = 'Cannot unlock existing Compress Temporary EDI Tables lock. ' +
    'Terminate to allow other users to run the same application.';
   cTXT0000007 = 'Reading the text file (%s):';
   cTXT0000008 = 'File does not conform to the EDIFACT standards.  Cannot load file.';
   cTXT0000009 = 'Processing segments';
   cTXT0000010 = 'File, %s, is already loaded and parsed.'#13#13 +
    'In order to reload the file, it must first be deleted from the temporary table.' + #13 +
    'Do you want to continue?';
   cTXT0000011 = 'File does not  conform to the ASC X12 standards.  Cannot load file.';
   cTXT0000012 = 'File, %s, has been loaded and parsed.' + #13 +
    'There were errors.' + #13 +
    'Do you want to view error log?';
   cTXT0000013 = 'File, %s, has been loaded and parsed.  Do you want to ' +
    'create an outbound Functional Acknowledgement?';
   cTXT0000014 = 'File, %s, has been loaded and parsed.';
   cTXT0000015 = 'Segment: %s';
   cTXT0000016 = 'Processing segments for ISA ID Code: %s';
   cTXT0000017 = 'Parsing error.  Wrong date format (%s).';
   cTXT0000018 = 'Invalid date format.';
   cTXT0000019 = 'Records Appended: %d';
   cTXT0000020 = 'Doc # %s';
   cTXT0000021 = 'Damaged product or container';
   cTXT0000022 = 'Quantity short';
   cTXT0000023 = 'Quantity over';
   cTXT0000024 = 'Quality problem';
   cTXT0000025 = 'Incorrect Product';
   cTXT0000026 = 'Non-Standard Container';
   cTXT0000027 = 'Good Condition';
   cTXT0000028 = 'Rejected';
   cTXT0000029 = 'Hold';
   cTXT0000030 = 'Adjust the supplier''''s YTD cum shipped';
   cTXT0000031 = 'Quantity over - Returned';
   cTXT0000032 = 'Receipt without a matching ASN.';
   cTXT0000033 = 'Scrapped.';
   cTXT0000034 = 'Printer Notification for %s';
   cTXT0000035 = 'Outbound Control #  %s';
   cTXT0000036 = 'Outbound File Name: %s';
   cTXT0000037 = 'Outbound File Date: %s';
   cTXT0000038 = 'Inbound File Name:  %s';
   cTXT0000039 = 'Inbound File Date:  %s';
   cTXT0000040 = '%s Control #       %s';
   cTXT0000041 = 'Document #          %s';
   cTXT0000042 = 'Rejected codes:'; 
   cTXT0000043 = 'Printer Notification';
   cTXT0000044 = 'AKA Ship To not matched. Inventory Item (%s) not assigned.'; 
   cTXT0000045 = 'No inventory item found for AKA Part # %s, PO # %s ISA %s'; 
   cTXT0000046 = 'Trimmed Interchange code (%s) was matched to %s. Do you want to accept this match?'; 
   cTXT0000047 = 'New Interchange Code (%s).  Please assign customer.'; 
   cTXT0000048 = 'File does not conform to the X12 or EDIFACT standards.'; 
   cTXT0000049 = 'Ship to Matching form closed without selecting a shipping ' +
    'address. No SHIP_TO_ID Assigned [EDI_ORD_DETAIL_ID = %f].';
   cTXT0000050 = 'EDI Codes Exported to %s'; 
   cTXT0000051 = 'Cannot find EDI code import files.';
   cTXT0000052 = 'Import completed';
   cTXT0000053 = 'Abort processing?';
   cTXT0000054 = 'Accepted';
   cTXT0000055 = 'Rejected';
   cTXT0000056 = 'Partially Accepted.  At Least One Transaction Set Was Rejected.';
   cTXT0000057 = 'Accepted, But Errors Were Noted'; 
   cTXT0000058 = 'Transaction Set Not Supported';
   cTXT0000059 = 'Transaction Set Trailer Missing'; 
   cTXT0000060 = 'Control Number in Header and Trailer Do Not Match'; 
   cTXT0000061 = 'Number of Included Segments Does Not Match Actual Count'; 
   cTXT0000062 = 'One or More Segments In Error'; 
   cTXT0000063 = 'Missing or Invalid Transaction Set Identifier'; 
   cTXT0000064 = 'Missing or Invalid Transaction Set Control Number'; 
   cTXT0000065 = 'Mandatory data element missing';
   cTXT0000066 = 'Conditional required data element missing.';
   cTXT0000067 = 'Too many data elements.';
   cTXT0000068 = 'Data element too short.';
   cTXT0000069 = 'Data element too long.';
   cTXT0000070 = 'Invalid character/value in data element.';
   cTXT0000071 = 'Invalid code value.';
   cTXT0000072 = 'Invalid date';
   cTXT0000073 = 'Invalid time';
   cTXT0000074 = 'Exclusion condition violated';
   cTXT0000075 = 'Too many repetitions';
   cTXT0000076 = 'Too many components'; 
   cTXT0000077 = 'Element # %s %s %s';
   cTXT0000078 = 'Segment: %s,  Number: %s';
   cTXT0000079 = 'Accepted with Errors';
   cTXT0000080 = 'Functional Group Not Supported';
   cTXT0000081 = 'Functional Group Version Not Supported';
   cTXT0000082 = 'Functional Group Trailer Missing';
   cTXT0000083 = 'Group Control Number in the Functional Group Header and Trailer Do Not Agree';
   cTXT0000084 = 'Number of Included Transactions Sets Does Not Match Actual Count';
   cTXT0000085 = 'Missing or Invalid Transaction Set Identifier';
   cTXT0000086 = 'Missing or Invalid Transaction Set Control Number';
   cTXT0000087 = 'Cannot find file, %s'; 
   cTXT0000088 = 'Processing Custom SQL Script...';
   cTXT0000089 = 'Processing SQL Script...';
   cTXT0000090 = 'Interchange Code %s is not set up to process 820s'; 
   cTXT0000091 = 'Cash Rec. Control # %f'; 
   cTXT0000092 = 'No details processed'; 
   cTXT0000093 = 'Do you want to delete all error messages?'; 
   cTXT0000094 = 'Do you want to delete error messages for this entry?'; 
   cTXT0000095 = 'Failed to acquire shared lock.'#13#13'Please try again later.'; 
   cTXT0000096 = 'Unable to unlock semafore'; 
   cTXT0000097 = 'Part #: %s'; 
   cTXT0000098 = 'Do you want to compress temporary EDI tables?'; 
   cTXT0000099 = 'Cannot compress temporary EDI Tables. Process is locked either by ' +
    'EServer or by another Compress session.';
   cTXT0000100 = 'Open and parse X12 file'; 
   cTXT0000101 = 'Open and parse EDIFACT file';
   cTXT0000102 = 'Determine file type';
   cTXT0000103 = 'Open and parse file with both X12 and Edifact';
   cTXT0000104 = 'View EDI Orders for selected file(s)'; 
   cTXT0000105 = 'Reset "SQL Script to process" to NULL?'; 
   cTXT0000106 = 'Processing using Oracle';
   cTXT0000107 = 'Processing using Delphi'; 
   cTXT0000108 = 'Template for the %s transaction is not assigned to that partner'; 
   cTXT0000109 = 'Cannot create %s directory. Error Code = %d'; 
   cTXT0000110 = '[%s] This field cannot be left empty.';
   cTXT0000111 = '[%s] [%s] A value must be selected from the drop-down list.';
   cTXT0000112 = 'Empty string'; 
   cTXT0000113 = '[%s] The date field cannot be left empty.'; 
   cTXT0000114 = '[%s] [%s] A valid date (in a YYMMDD or YYYYMMDD format) must be entered.';
   cTXT0000115 = '[%s] The time field cannot be left empty.'; 
   cTXT0000116 = '[%s] [%s] A valid time (using a 24-hour clock in an HHMM format) must be entered.';
   cTXT0000117 = 'The length of the entered value exceeds the maximum limit of %d.  [form name %s]'; 
   cTXT0000118 = 'Invalid number.';
   cTXT0000119 = 'Do you want to create an output file?';
   cTXT0000120 = 'Outbound EDI file complete.'; 
   cTXT0000121 = 'Do you want to clear the temporary tables?'; 
   cTXT0000122 = 'Do you want to exit without finishing the process?  Changes will not be saved.'; 
   cTXT0000123 = 'EDI Transaction (211) BOL # %s';
   cTXT0000124 = 'Populating temporary tables.  Please wait.';
   cTXT0000125 = 'No details found.  Pprobable cause: Freight not configured.'; 
   cTXT0000126 = 'Enter date format as, ''YYMMDD'''; 
   cTXT0000127 = 'Enter time format as, ''HHMM'' (use twenty-four hour clock)';
   cTXT0000128 = 'Validation complete.  Create output file?';
   cTXT0000129 = 'Creating text file.  Please wait.'; 
   cTXT0000130 = 'Invalid token length'; 
   cTXT0000131 = 'Output directory not assigned';
   cTXT0000132 = 'Invoice #'; 
   cTXT0000133 = 'Cannot create directory, %s.';
   cTXT0000134 = 'No Ship To partner information found.'; 
   cTXT0000135 = 'No Ship To partner information for %s'; 
   cTXT0000136 = 'Transaction 855/ORDRSP for Sales Order, %s, has already been created.  ' +
    'Do you want to create another?';
   cTXT0000137 = 'EDI Transaction (855)'; 
   cTXT0000138 = 'EDI Transaction (865)'; 
   cTXT0000139 = '%s, Order # %s';
   cTXT0000140 = 'Transaction 856/DESADV for packslip, %s, has already been created.  ' +
           'Do you want to create another?';
   cTXT0000141 = 'Invalid file name: %s';
   cTXT0000142 = 'Packing Slip #'; 
   cTXT0000143 = 'EDI Transaction (856), Packing Slip # %s';
   cTXT0000144 = 'No details found.  Probable cause: Ship To not configured in AKA Selling.'; 
   cTXT0000145 = 'Do you want to load the Edit table?'; 
   cTXT0000146 = 'You are about to delete an IQMS internal record.  ' +
     'Are you sure you want to continue?';
   cTXT0000147 = 'No records selected'; 
   cTXT0000148 = 'Could not find the required EDI Import files while ' +
     'processing directory, %s.';
   cTXT0000149 = 'Importing from %s...'; 
   cTXT0000150 = 'Clone Transaction Set';
   cTXT0000151 = 'Please enter TS Unique ID';
   cTXT0000152 = 'Invalid ID'; 
   cTXT0000153 = 'ID, %s, already exists.'; 
   cTXT0000154 = 'Processing %s ...'; 
   cTXT0000155 = 'Extracting files to %s...'; 
   cTXT0000156 = 'Deleting %s...'; 
   cTXT0000157 = 'File, %s, already exists. Please specify a new archive file.'; 
   cTXT0000158 = 'Copying Transaction Sets Table to %s.  Please Wait.';
   cTXT0000159 = 'Copying Transaction Sets SQL Table to %s.  Please Wait.'; 
   cTXT0000160 = 'Copying Qry Segments SQL Table to %s.  Please Wait.'; 
   cTXT0000161 = 'Copying Segments to %s.  Please Wait.'; 
   cTXT0000162 = 'Copying XML Header to %s.  Please Wait.'; 
   cTXT0000163 = 'Copying XML Detail to %s.  Please Wait.'; 
   cTXT0000164 = 'Copying Segment Tokens to %s.  Please Wait.'; 
   cTXT0000165 = 'Copying Token Values to %s.  Please Wait.'; 
   cTXT0000166 = 'Copying TParameters to %s.  Please Wait.'; 
   cTXT0000167 = 'Tables zipped to file, %s'; 
   cTXT0000168 = 'Tables exported successfully.'; 
   cTXT0000169 = 'Available Keywords';
   cTXT0000170 = 'Keyword';
   cTXT0000171 = 'Description';
   cTXT0000172 = 'Please assign Form Name first.'; 
   cTXT0000173 = 'Please assign Dataset first.'; 
   cTXT0000174 = 'Do you want to clear custom query?'; 
   cTXT0000175 = 'Do you want to overwrite existing query?'; 
   cTXT0000176 = 'Please assign a Customer.'; 
   cTXT0000177 = 'Parent record must be assigned.'; 
   cTXT0000178 = 'Ship To is already assigned.  Do you want to reassign?'; 
   cTXT0000179 = 'Please assign Trading partner before proceeding.'; 
   cTXT0000180 = 'Bill To is already assigned.  Do you want to reassign?'; 
   cTXT0000181 = 'Please enter all file names.'; 
   cTXT0000182 = 'Inbound Transaction Options - %s (%s)'; 
   cTXT0000183 = 'Jump to Packing Slip # %s';
   cTXT0000184 = 'Jump to Invoice # %s';
   cTXT0000185 = 'Jump to PO # %s';
   cTXT0000186 = 'Jump to Document';
   cTXT0000187 = 'Cannot jump to an adjustment';
   cTXT0000188 = 'Do you wish to acknowledge transaction manually?'; 
   cTXT0000189 = 'Manual Acknowledgement'; 
   cTXT0000190 = 'Manual Acknowledgement by user, %s - Accepted';
   cTXT0000191 = 'Match Billing Address [ISA Code: %s]'; 
   cTXT0000192 = 'Bill To ID Code';
   cTXT0000193 = 'Bill To Name';
   cTXT0000194 = 'Bill To Addr1';
   cTXT0000195 = 'Bill To Addr2';
   cTXT0000196 = 'Bill To Addr3';
   cTXT0000197 = 'Bill To City';
   cTXT0000198 = 'Bill To State or Region';
   cTXT0000199 = 'Bill To Postal Code';
   cTXT0000200 = 'Match Shipping Address [ISA Code: %s]';
   cTXT0000201 = 'Ship To ID Code'; 
   cTXT0000202 = 'Ship To Name'; 
   cTXT0000203 = 'Ship To Addr1'; 
   cTXT0000204 = 'Ship To Addr2'; 
   cTXT0000205 = 'Ship To Addr3'; 
   cTXT0000206 = 'Ship To City';
   cTXT0000207 = 'Ship To State or Region';
   cTXT0000208 = 'Ship To Postal Code';
   cTXT0000209 = 'Nothing to match.';
   cTXT0000210 = 'Please assign Trading partner.'; 
   cTXT0000211 = '''%s'', Item #, %s, not found in the specified order.'; 
   cTXT0000212 = 'Orders are assigned to the customer.  ' +
     'By changing the customer you will invalidate them.  Continue?';
   cTXT0000213 = 'Please select a Customer.'; 
   cTXT0000214 = 'Multiple records in the detail table can ' +
              'only be processed for one selection in the header.  '#13#13  +
              'If you wish to process multiple header records, then ' +
              'all the details for those records will be processed.'#13#13 +
              'Do you wish to continue?';
   cTXT0000215 = 'Do you wish to convert marked Inbound Transactions?'; 
   cTXT0000216 = '(Transaction must be processed manually)'; 
   cTXT0000217 = '(Transaction skipped)'; 
   cTXT0000218 = '(Transaction set not assigned)'; 
   cTXT0000219 = '(Transaction not converted)'; 
   cTXT0000220 = 'Rejected Transactions'; 
   cTXT0000221 = 'Conversion complete.'; 
   cTXT0000222 = 'No customer assigned.  Cannot continue.'; 
   cTXT0000223 = 'Order # %s, Item # %s: Sum of all releases must be greater than 0'; 
   cTXT0000224 = 'Cannot locate EDI_TS_HDR ID, %f'; 
   cTXT0000225 = 'Attempt to recover form the Max. cursors overflow (procedure PopulateIdsList)'; 
   cTXT0000226 = 'Cannot locate EDI_ORD_DETAIL ID, %f'; 
   cTXT0000227 = 'No inventory item assigned.  Cannot continue.'; 
   cTXT0000228 = 'No shipping address assigned.  Cannot continue.'; 
   cTXT0000229 = 'Order# %s, Item # %s did not pass flexibility rules (%s)'; 
   cTXT0000230 = 'Negative release quantity on Order# %s, Item # %s';
   cTXT0000231 = 'Validation completed.'; 
   cTXT0000232 = 'Cumulative Processing (OFF)'#13'Click to turn ON';
   cTXT0000233 = 'Cumulative Processing (ON)'#13'Click to turn OFF';
   cTXT0000234 = 'Adjust first release (OFF)'#13'Click to turn ON';
   cTXT0000235 = 'Adjust first release (ON)'#13'Click to turn OFF';
   cTXT0000236 = 'This option is unavailable for archived records.'; 
   cTXT0000237 = 'This option is  valid only for Transaction Set 860 or CHG.'; 
   cTXT0000238 = 'Days interval (%d) is less than the minimum of %d'; 
   cTXT0000239 = 'Del. Date: %s.  Did not find flex rules.'; 
   cTXT0000240 = 'Del. Date: %s.  The percentage (%f) is over the upper limit of %f.'; 
   cTXT0000241 = 'Del. Date: %s.  The percentage (%f) is over the lower limit of %f.'; 
   cTXT0000242 = 'This order was not marked by Flexibility Rules.'; 
   cTXT0000243 = 'Do you want to print report(s) for selected record(s)?';
   cTXT0000244 = 'Converting records %d';
   cTXT0000245 = 'Warehouse';
   cTXT0000246 = 'Division';
   cTXT0000247 = '[%s] No Serial # assigned'; 
   cTXT0000248 = 'AKA item %s, VMI serial number, %s.  No quantity assigned.';
   cTXT0000249 = 'AKA %s VMI serial number %s previously processed'; 
   cTXT0000250 = 'EDI Consume VMI';
   cTXT0000251 = 'AKA %s VMI serial number %s FGMULTI ID not found or no C_SHIP_HIST match found';
   cTXT0000252 = 'AKA %s VMI serial number %s On Hand Quantity is zero.'; 
   cTXT0000253 = 'AKA %s VMI serial number %s Quantity is greater than the non consumed quantity.'; 
   cTXT0000254 = '[%s %s] Quantity is greater than the On Hand quantity.'; 
   cTXT0000255 = 'AKA %s VMI serial number %s VMI Transaction encountered and error and did not complete'; 
   cTXT0000256 = 'Invalid action name %s [ApplyActionToDataSet]'; 
   cTXT0000257 = 'Use ORACLE procedures to convert';
   cTXT0000258 = 'Use DELPHI procedures to convert';
   cTXT0000259 = 'Invalid hexidecimal character'; 
   cTXT0000260 = 'Element Separator';
   cTXT0000261 = 'Segment Terminator';
   cTXT0000262 = 'Sub-Element Separator';
   cTXT0000263 = 'Component:  %s';
   cTXT0000264 = 'Invalid character length';
   cTXT0000265 = 'Invalid character range';
   cTXT0000266 = 'Code, %s, already exists.'; 
   cTXT0000267 = 'Please assign either a Customer, Vendor, Freight or Bank.'; 
   cTXT0000268 = 'Hide Separator Setup'; 
   cTXT0000269 = 'Show Separator Setup';
   cTXT0000270 = 'All shipping addresses for the old Trading Partner will be deleted.  Continue?';
   cTXT0000271 = 'Transaction Set must be filled'; 
   cTXT0000272 = 'Are you sure you wish to delete this Trading Partner?'; 
   cTXT0000273 = 'Vendor not assigned'; 
   cTXT0000274 = 'Please enter a Receiver Code.'; 
   cTXT0000275 = 'Duplicate Receiver Code.'; 
   cTXT0000276 = 'Duplicate Receiver Code / Supplier Code combination.'; 
   cTXT0000277 = 'Duplicate Receiver Code / Supplier Code / EPlant combination.'; 
   cTXT0000278 = 'Please assign a Vendor.'; 
   cTXT0000279 = 'Please select a shipping address.'; 
   cTXT0000280 = 'Nothing to process'; 
   cTXT0000281 = 'No XML template assigned';
   cTXT0000282 = 'Do you want to create an XML file?';
   cTXT0000283 = 'XML file, %s, created.'; 
   cTXT0000284 = 'Accessing database.  Please wait.';
   cTXT0000285 = 'Building Tree View ...'; 
   cTXT0000286 = 'Please select a tree view node.'; 
   cTXT0000287 = 'No header record.  Cannot continue.'; 
   cTXT0000288 = 'Add Node'; 
   cTXT0000289 = 'Enter a tag name'; 
   cTXT0000290 = 'Change Sequence #';
   cTXT0000291 = 'Enter sequence #';
   cTXT0000292 = 'Change Tag';
   cTXT0000293 = 'Enter tag';
   cTXT0000294 = 'Do you want to delete node, %s?';
   cTXT0000295 = 'Fully Received POs hidden. Click to show.';
   cTXT0000296 = 'Hide Fully Received POs.';
   cTXT0000297 = 'ISA Code';
   cTXT0000298 = 'already exists for';
   cTXT0000299 = 'Enter new ISA Code or leave blank to skip.';
   cTXT0000300 = 'Trading Partner Cloned.';
   cTXT0000301 = 'The transaction is already assigned to the trading partner.';
   cTXT0000302 = 'New Interchange Code (%s).  Please assign Freight Carrier.';
   cTXT0000303 = 'Jump to SO # %s';
   cTXT0000304 = 'Segment Token Id';
   cTXT0000305 = 'Enter Segment Token Id';
   cTXT0000306 = 'Reassign Seq.';
   cTXT0000307 = 'Enter New Seq.';
   cTXT0000308 = 'Locate Sequence';
   cTXT0000309 = 'Enter Sequence';
   cTXT0000310 = 'Assign Segment Token ID';
   cTXT0000311 = 'Enter Segment Token ID';
   cTXT0000312 = 'Reassign Parent ID';
   cTXT0000313 = 'Enter New Parent ID';
   cTXT0000314 = 'Open and parse file'; 
   cTXT0000315 = 'Copying Sql Files...';
   cTXT0000316 = 'Copying Sql File...';
   cTXT0000317 = '[%s] [%s] Token length exceeds the maximum limit of %d.'; 
   cTXT0000318 = 'Customer must be assigned.';
   cTXT0000319 = 'GL Account must me assigned.';
   cTXT0000320 = 'Sequence must be assigned.';
   cTXT0000321 = 'Discount Code must be assigned.';
   cTXT0000322 = 'Default Discount must be assigned.';
   cTXT0000323 = 'Percentage/Flat must be assigned';
   cTXT0000324 = 'Invalid Sequence';
   cTXT0000325 = 'Applying this Sequence will result in skipping.';
   cTXT0000326 = 'Template(s) Exported.';   
   
                            


implementation

end.
