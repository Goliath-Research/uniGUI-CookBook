unit cd_rscstr;

interface

// cd_rscstr.cTXT0000081

resourcestring
   cTXT0000001 = 'One check in this group was printed and will be void if ' +
    'deleted.  Proceed with deletion?';
   cTXT0000002 = '%d checks in this group were printed and will be void if ' +
    'deleted.  Proceed with deletion?';
   cTXT0000003 = 'Parent record not found.  Please assign a parent record.';
   cTXT0000004 = 'Cannot add or modify invoices of a printed check.';
   cTXT0000005 = 'An expense account must be assigned to the discount.';
   cTXT0000006 = 'An expense account must be assigned to the miscellaneous disbursement.'; 
   cTXT0000007 = 'Cannot delete invoices from a printed check.'; 
   cTXT0000008 = 'Cannot delete.  Vendor has printed checks.';
   cTXT0000009 = 'Default Cash account not assigned.  Please assign in System Parameters.';
   cTXT0000010 = 'Default AP Discount account not assigned.  Please assign System Parameters.';
   cTXT0000011 = 'Bank information unavailable.  Please assign.'; 
   cTXT0000012 = 'Vendor already exists in the batch.';
   cTXT0000013 = 'Vendor already exists in the prepost table.';
   cTXT0000014 = 'The invoice is on hold.  Do you still want to use it?'; 
   cTXT0000015 = 'Invoice %s already exists in the check'; 
   cTXT0000016 = 'Rejected Vendors';
   cTXT0000017 = 'The sum of the amount of outstanding invoices from this ' +
    'vendor is less than zero.';
   cTXT0000018 = 'Manual Check must have a check number.';
   cTXT0000019 = 'Cannot add invoices to a printed check.';
   cTXT0000020 = 'Cannot accept.  Amount suggested for payment is greater ' +
    'than the amount left to pay.';
   cTXT0000021 = 'Cannot accept.  An expense account is not assigned to the ' +
    'discount.';
   cTXT0000022 = 'Cannot accept.  An expense account is not assigned to the ' +
    'miscellaneous disbursement.';
   cTXT0000023 = 'One invoice was not accepted because its currency differs ' +
    'from the check''s currency.';
   cTXT0000024 = '%d invoices where not accepted because their currency ' +
    'differs from the check''s currency';
   cTXT0000025 = 'Records assigned.'; 
   cTXT0000026 = 'Records assigned. One invoice is on hold.  It was not processed.'; 
   cTXT0000027 = 'Records assigned. %d invoices are on hold.  They were not processed.'; 
   cTXT0000028 = 'No Records assigned. All invoices are on hold.'; 
   cTXT0000029 = 'No records assigned.'; 
   cTXT0000030 = 'The Vendor "Remit To" is different from the Invoice ' +
    '"Remit To."  Do you want to keep the assigned remittance address?'#13 +
    'Pressing, "No," will overwrite the assigned remittance address with ' +
    'the remittance address on the Invoice.';
   cTXT0000031 = 'Printing has been bypassed. Are you sure payments are ready to post?'; 
   cTXT0000032 = 'Batch Date';
   cTXT0000033 = 'At least one of the checks was not printed.  Cannot post.';
   cTXT0000034 = 'Group %d, Batch %d has been posted.  Do you want to print ' +
    'the AfterPost report?';
   cTXT0000035 = 'Batch # %d was not posted.';
   cTXT0000036 = 'Currency has not been assigned.'; 
   cTXT0000037 = 'Sorting.  Please wait.'; 
   cTXT0000038 = 'Sort By %s'; 
   cTXT0000039 = 'Cannot change EPlant.  Detail records were found.'; 
   cTXT0000040 = 'This group has details.  Cannot edit currency.'; 
   cTXT0000041 = 'Please assign a currency.'; 
   cTXT0000042 = 'The Check date (%s) does not fall within the Period dates (%s - %s)'; 
   cTXT0000043 = 'This group has details.  Cannot edit Remittance Type.'; 
   cTXT0000044 = 'Foreign Exchange account not assigned.'#13 +
       'Proceeding with current discount account as a default account.';
   cTXT0000045 = 'View Cash Disbursements';
   cTXT0000046 = 'From: %s'#13'To: %s';
   cTXT0000047 = 'View Cash Disbursements (All)'; 
   cTXT0000048 = 'View Cash Disbursements (Vendor: %s)';
   cTXT0000049 = 'View Cash Disbursements (Period #: %d, %s - %s)'; 
   cTXT0000050 = 'View Cash Disbursements (Original)';
   cTXT0000051 = 'The Check has been cleared.  Cannot void.'; 
   cTXT0000052 = 'The Check is already void.'; 
   cTXT0000053 = 'Void the current check(s)?';
   cTXT0000054 = 'Checks voided successfully.  Do you want to print the AfterPost report?'; 
   cTXT0000055 = 'Check voided successfully.  Do you want to print the AfterPost report?';
   cTXT0000056 = 'Check was not posted.'; 
   cTXT0000057 = '%s is not a valid check number.'; 
   cTXT0000058 = 'Check #';
   cTXT0000059 = 'Remit To';
   cTXT0000060 = 'Check';
   cTXT0000061 = 'Another user is printing checks from this cash account.  ' +
     'If you continue, you risk duplicating check numbers.'#13#13 +
     'Do you want to stop printing?';
   cTXT0000062 = 'Nothing to print.'; 
   cTXT0000063 = 'The following check(s) require a Remittance Advisor ' +
    'Report:'#13#13 +
    '%s'#13#13 +
    'Do you want to print the report now?'#13 +
    'If you choose to print the report later, you ' +
    'will have to specify the checks manually.';
   cTXT0000064 = 'One or more checks to be printed are reprints.' + #13 +
     'Checks previously printed will be marked as, ''VOID.''  Continue?';
   cTXT0000065 = 'You are about to void a check.  This change is irreversible.'#13 +
    'Do you want to continue?';
   cTXT0000066 = 'Start Date: %s'#13'End Date: %s';
   cTXT0000067 = 'Please enter a value for, ''Voided By.''';
   cTXT0000068 = 'When button is down, all invoices are displayed regardless ' +
    'of date.'#13'When button is up, invoices are displayed within the ' +
    'specified date range.';
   cTXT0000069 = '(Exists in the prepost table)'; 
   cTXT0000070 = 'Please select one or more records.';
   cTXT0000071 = 'No records selected.  Do you want to process all?'; 
   cTXT0000072 = 'Cannot find file, %s.'; 
   cTXT0000073 = 'The SQL window is empty.  Cannot export an empty file.'; 
   cTXT0000074 = 'File, %s, exported successfully.'; 
   cTXT0000075 = 'Accessing database.  Please wait.';
   cTXT0000076 = 'Accessing Cash Disbursements.  Please wait.';
   cTXT0000077 = 'At least one of the Vendors has no check assigned.  ' +
    'Cannot post.';
   cTXT0000078 = 'Current GL period is unavailable.  Please assign.';
   cTXT0000079 = 'A default Foreign Exchange account value has not been ' +
    'assigned.  Please assign in System Parameters.';
   cTXT0000080 = 'A GL Account Structure Foreign Currency Segment Name has ' +
    'not been assigned.  Please assign in System Parameters.';
   cTXT0000081 = 'Vendor already exists in the batch.';
   cTXT0000082 = 'This group has details.  Cannot edit EFT Pay. Type.';
   cTXT0000083 = 'Cannot assign Remit To, EFT Payment. Types do not match.';
   cTXT0000084 = 'Amount paid exceeds balance due.  Continue?';
   cTXT0000085 = 'Amount paid exceeds balance due.'; 
   cTXT0000086 = 'This check has been applied to another check. Cannot void.'; 
   cTXT0000087 = 'Pending Balance Due is 0. Do you still wish to apply it?'; 
   cTXT0000088 = 'At least one EFT amount is less than or equal to zero. Continue?'; 
   cTXT0000089 = 'At least one EFT amount is less than or equal to zero. Cannot Post.'; 
   cTXT0000090 = 'At least one EFT amount for %s is less than or equal to zero. Continue?'; 
   cTXT0000091 = 'Vendor %s, Check# %s has a custom report assigned on the vendor record. Would you like to remove the vendor from the the batch print group so you can print the check separately on the vendor''s custom check report?'; 
   cTXT0000092 = ''; 
   cTXT0000093 = ''; 
   cTXT0000094 = ''; 
   cTXT0000095 = ''; 
   cTXT0000096 = ''; 
   cTXT0000097 = ''; 
   cTXT0000098 = ''; 
   cTXT0000099 = ''; 
   cTXT0000100 = ''; 


implementation

end.
