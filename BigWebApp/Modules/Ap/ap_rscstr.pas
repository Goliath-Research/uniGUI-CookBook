unit ap_rscstr;

interface

// ap_rscstr.cTXT0000090

resourcestring

   cTXT0000001 = 'PO vendor may not match AP vendor. Continue?';
   cTXT0000002 = 'PO vendor does not match AP vendor.';
   cTXT0000003 = 'Delete the 1099 year?';
   cTXT0000004 = 'Please enter a Vendor Federal Tax ID.'; 
   cTXT0000005 = 'Year %d already exists';
   cTXT0000006 = 'Default AP account value not assigned.  Please assign an ' +
    'AP account in System Parameters.';
   cTXT0000007 = 'Default COGS account value not assigned.  Please assign a ' +
    'COGS account in System Parameters';
   cTXT0000008 = 'The current GL period is unavailable.  Please assign a ' +
    'GL period.';
   cTXT0000009 = 'Default Foreign Exchange account value not assigned.  ' +
    'Please assign  a Foreign Exchange account in System Parameters.';
   cTXT0000010 = 'GL Account structure Foreign Currency segment not assigned.  ' +
    'Please assign a value in System Parameters.';
   cTXT0000011 = '(Prior Entries)';
   cTXT0000012 = 'Cannot find selected invoice.'; 
   cTXT0000013 = 'The reference or check record is missing.'; 
   cTXT0000014 = 'Purchase Orders for Vendor: %s';
   cTXT0000015 = 'Processing Purchase Order ...'; 
   cTXT0000016 = 'Refreshing AP Invoice data ...'; 
   cTXT0000017 = 'There is nothing to append.';
   cTXT0000018 = 'The receipt has not been posted.  Continue?';
   cTXT0000019 = 'The receipt has not been posted.  The Purchase Order was not appended.'; 
   cTXT0000020 = 'The Vendor remittance address is different from the Purchase Order remittance address.  ' +
    'Do you want to keep the assigned "Remit To" address?'#13#13 +
    'Pressing No will override the assigned address with the Purchase Order address.';
   cTXT0000021 = 'Nothing has been received against the selected item.'; 
   cTXT0000022 = 'There is nothing to post.'; 
   cTXT0000023 = 'Batch Date'; 
   cTXT0000024 = 'Do you want to post the current batch?'; 
   cTXT0000025 = 'Do you want to print the AfterPost report?';
   cTXT0000026 = 'Batch posted.'; 
   cTXT0000027 = 'Header record not found.';
   cTXT0000028 = 'Invoice # %s, contains no details.  Cannot post invoice.'; 
   cTXT0000029 = 'Tax Code is missing in one of the detail records.'; 
   cTXT0000030 = 'This Invoice is on hold.  Cannot post invoice.'; 
   cTXT0000031 = 'Do you want to post the current invoice?'; 
   cTXT0000032 = 'A foreign currency account has not been assigned.'; 
   cTXT0000033 = 'One or more GL Accounts is blank.  Cannot post.'; 
   cTXT0000034 = 'The invoice is out of balance.  Cannot post.';
   cTXT0000035 = 'Invoice posted.  Do you want to print the AfterPost report?'; 
   cTXT0000036 = 'Invoice posted.';
   cTXT0000037 = 'The invoice was not posted.';
   cTXT0000038 = 'Start Date: %s'#13'End Date: %s'; 
   cTXT0000039 = 'Currency has not been assigned.  Please select a currency.'; 
   cTXT0000040 = 'Please enter an Invoice number.'; 
   cTXT0000041 = 'GL periods must be assigned, starting on %s. Please assign GL periods.'; 
   cTXT0000042 = 'Invoice number %s is already in use.  Cannot continue.'; 
   cTXT0000043 = 'Invoice replicated successfully.'; 
   cTXT0000044 = 'You have selected multiple rows.  Do you want to unassign ' +
    'the cost source for the selected records?';
   cTXT0000045 = 'You have selected multiple rows.  Do you want to assign ' +
    'the cost source for the selected records?';
   cTXT0000046 = 'The discount amount based on the detail items is, %.2f.';
   cTXT0000047 = 'The quantity invoiced is greater than the quantity received.'; 
   cTXT0000048 = 'Please select a Vendor.  Cannot post invoice.'; 
   cTXT0000049 = 'Please select a remittance address. Cannot post invoice.'; 
   cTXT0000050 = 'No tax code assigned.  Cannot include on 1099 form.'; 
   cTXT0000051 = 'The invoice number, %s, already exists for the selected vendor.'; 
   cTXT0000052 = 'The invoice date (%s) does not fall within the period dates, %s through %s.'; 
   cTXT0000053 = 'Insufficient rights. Cannot update Quantity.'; 
   cTXT0000054 = 'Please select a freight company.'; 
   cTXT0000055 = 'Cannot post PPV for items that did not come from the Purchase Order.'; 
   cTXT0000056 = 'The invoice is out of balance.'; 
   cTXT0000057 = 'The total percentage must equal 100 %.'; 
   cTXT0000058 = 'Create invoices now?'; 
   cTXT0000059 = 'Invoices created.'; 
   cTXT0000060 = 'Creating invoice %s';
   cTXT0000061 = 'The freight amount is incorrect.'; 
   cTXT0000062 = 'The freight amount must be greater than zero.  Please specify a freight amount.'; 
   cTXT0000063 = 'Please select a value for Ship Via.'; 
   cTXT0000064 = 'Please select a Cost Allocation Technique.';
   cTXT0000065 = 'No records were found to process.'; 
   cTXT0000066 = 'Cannot find Invoice number, %s'; 
   cTXT0000067 = 'Accessing Accounts Payable Invoices.  Please wait.'; 
   cTXT0000068 = 'Unassign cost source?'; 
   cTXT0000069 = 'Cannot delete individual tax element. Do you want to delete the whole tax code?';
   cTXT0000070 = 'The existing tax elements will be deleted, and then replaced ' +
    'with the tax elements belonging to the new tax code. Do you want to continue?';
   cTXT0000071 = 'View Voided AP Invoices (All Invoices)';
   cTXT0000072 = 'View Voided AP Invoices (for Vendor: %s)';
   cTXT0000073 = 'View Voided AP Invoices (Period#: %d, %s - %s)';
   cTXT0000074 = 'View Voided AP Invoices (Original Invoice)'; 
   cTXT0000075 = 'Vendor Status for %s, Vendor # %s';
   cTXT0000076 = 'There is no aging information for vendor, %s, %s'; 
   cTXT0000077 = 'Running Total: %m'; 
   cTXT0000078 = 'View AP Invoices (All Invoices)'; 
   cTXT0000079 = 'View AP Invoices (for Vendor: %s)';
   cTXT0000080 = 'View AP Invoices (Period #: %d, %s - %s)'; 
   cTXT0000081 = 'View AP Invoices (Original Invoice)'; 
   cTXT0000082 = 'Void the current invoice?'; 
   cTXT0000083 = 'Please enter a name for Voided By.'; 
   cTXT0000084 = 'An entry for this invoice was found in the Cash ' +
    'Disbursements prepost table.'#13#13 +
    'In order to void the invoice, this entry (or entries) must first ' +
    'be deleted.';
   cTXT0000085 = 'You are about to void an invoice.'#13#13 +
    'This change is irreversible.  Do you want to continue?';
   cTXT0000086 = 'Invoice voided. Do you want to print the AfterPost report?';
   cTXT0000087 = 'Cannot void.  This invoice has already been posted to the ' +
    'Cash Disbursements AfterPost table.';
   cTXT0000088 = 'Cannot acquire lock on the Cash Disbursements AfterPost table. ' +
    'It may be locked by another user.'#13#13 +
    'Please try again later.';
   cTXT0000089 = 'Value cannot exceed 31'; 
   cTXT0000090 = 'Vendor #:  %s'; 
   cTXT0000091 = 'Telephone #: %s';
   cTXT0000092 = 'Invoice Information';
   cTXT0000093 = 'Invoice Notes'; 
   cTXT0000094 = 'Po Receipt Hold.  Cannot post invoice.'; 
   cTXT0000095 = 'GL Account requires entry of a Cost Source.';
   cTXT0000096 = 'The discount amount (excluding taxes and freight) based on the detail items is, %.2f.';
   cTXT0000097 = 'Credit Memos may not be edited';
   cTXT0000098 = 'Edit Item Information';
   cTXT0000099 = 'View Item Information';
   cTXT0000100 = 'Invoice Cloned';
   cTXT0000101 = 'Invalid Range.';
   cTXT0000102 = 'Nothing selected.';
   cTXT0000103 = 'Delete selected records?';
   cTXT0000104 = 'Would you like to open salesperson commission?';
   cTXT0000105 = 'This invoice is on vendor hold. Cannot post invoice.';
   cTXT0000106 = 'No Records in DataSet.';
   cTXT0000107 = 'No Allocation Technique Assigned.';
   cTXT0000108 = 'No Records in the Detail DataSet.';
   cTXT0000109 = 'Cost has been allocated, do you wish to reallocate?';
   cTXT0000110 = 'Do you wish to Allocate Cost?';
   cTXT0000111 = 'This Record was already posted to GL.';
   cTXT0000112 = 'Do you wish to Post Inventory Cost Adjustment to General Journal?';
   cTXT0000113 = 'Delete All Records?';
   cTXT0000114 = 'Do you wish to delete and reinsert all records?';
   cTXT0000115 = 'GL Account(s) on a detail level not assigned.';
   cTXT0000116 = 'Total Amount Allocated on a detail level not assigned.';
   cTXT0000117 = 'Unit Cost Adjustment on a detail level not assigned.';
   cTXT0000118 = 'Expense Account not assigned.';
   cTXT0000119 = 'GL Account(s) on a split level not assigned.';
   cTXT0000120 = 'Total Amount Allocated on a split level not assigned.';
   cTXT0000121 = 'Unit Cost Adjustment on a split level not assigned.';
   cTXT0000122 = 'Invalid GL Period.';
   cTXT0000123 = 'Cannot delete a posted to GL entry.';
   cTXT0000124 = 'Cannot edit a posted to GL entry.';
   cTXT0000125 = 'Do you wish to Void Inventory Cost Adjustment posting to GL?';
   cTXT0000126 = 'This Record is already in the General Journal table.';
   cTXT0000127 = 'Cannot delete an entry that exists in the General Journal table.';
   cTXT0000128 = 'Cannot edit an entry that exists in the General Journal table.';
   cTXT0000129 = 'Still in prepost – cannot void.';
   cTXT0000130 = 'Still in prepost – cannot recalculate.';
   cTXT0000131 = 'Cannot recalculate a posted to GL entry.';
   cTXT0000132 = 'Cost Allocation was recalculated to reflect the change in distribution amount.';
   cTXT0000133 = 'ICA Amount updated to reflect the change in distribution amount.';
   cTXT0000134 = 'Delete Record?';
   cTXT0000135 = 'Amount not assigned.';
   cTXT0000136 = 'Do you wish to insert a Purchased Item that is resold/shipped?';
   cTXT0000137 = 'No WorkFlow Templates found';
   cTXT0000138 = 'Allow edit of AP Invoice quantity from PO?';
   cTXT0000139 = 'Insufficient rights. Cannot update Unit Cost.';
   cTXT0000140 = 'Cannot post unapproved invoice.';
   cTXT0000141 = 'Running Total: %m'#13'Total eligible discounts: %m'; 
   cTXT0000142 = 'The Batch date (%s) does not fall within the Period dates (%s – %s), Continue posting?'; 
                                                               
                                                                       
implementation

end.
