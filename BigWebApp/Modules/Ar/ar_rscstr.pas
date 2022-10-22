unit ar_rscstr;

interface

resourcestring


  cTXT0000001 = 'The Customer has already been charged for the full amount of this invoice.  Continue?';
  cTXT0000002 = 'The Customer has already been overcharged for this invoice.  Continue?';
  cTXT0000003 = 'Multiple rows are selected.  Do you wish to reassign the cost source of the selected records?';
  cTXT0000004 = 'Appending Financing Charge record...';
  cTXT0000005 = 'Appending Accounts Receivable record...';
  cTXT0000006 = 'Inserting detail records...';
  cTXT0000007 = 'One or more items have already been invoiced and could not be transferred.';
  cTXT0000008 = 'Updating record %d of %d';
  cTXT0000009 = '(Incompatible Currency)';
  cTXT0000010 = 'Rejected RMA Details';
  cTXT0000011 = 'Credit: RMA # %s';
  cTXT0000012 = '(Prior Entries)';
  cTXT0000013 = 'Invoice header missing';
  cTXT0000014 = 'Item %s already exists on the invoice.';
  cTXT0000015 = 'The Invoice billing information differs from the billing information you selected. ' +
                'Do you wish to change the Invoice billing address?';
  cTXT0000016 = 'Please enter a GL Account.';
  cTXT0000017 = 'No selection was made';
  cTXT0000018 = 'No customer selected';
  cTXT0000019 = 'There are no details on the invoice.  Cannot post.';
  cTXT0000020 = 'A Sales Account is missing on one of the detail records.  Cannot post.'; 
  cTXT0000021 = 'A Tax Code is missing on one of the detail records';
  cTXT0000022 = 'Invoice is on hold.  Cannot post.';
  cTXT0000023 = 'Post current invoice?';
  cTXT0000024 = 'Please select a Foreign Currency account.';
  cTXT0000025 = 'Invoice posted.  Print the After Post report?';
  cTXT0000026 = 'Invoice posted.';
  cTXT0000027 = 'The Invoice was not posted.';
  cTXT0000028 = 'The batch is out of balance. There is a problem with the cost of goods sold.';
  cTXT0000029 = 'There is nothing to post.';
  cTXT0000030 = 'GL Batch Date';
  cTXT0000031 = 'Post the current batch?';
  cTXT0000032 = 'Print the After Post report?';
  cTXT0000033 = 'Batch posted.  Print the After Post report?';
  cTXT0000034 = 'Batch posted.';
  cTXT0000035 = 'The Invoice was not posted.';
  cTXT0000036 = 'Unable to acquire lock (%s)';
  cTXT0000037 = 'Start Date: %s'#13'End Date: %s';
  cTXT0000038 = 'Application Error:  Cannot find invoice [ID = %.0f].';
  cTXT0000039 = 'This invoice has been printed %.0f time(s).'#13#13'Last printed on %s by %s.'#13#13'Abort printing?';
  cTXT0000040 = 'No default report assigned in System Parameters. Please assign default report.';
  cTXT0000041 = 'No Packing Slip is associated with this item.';
  cTXT0000042 = 'No Sales Order is associated with this item';
  cTXT0000043 = 'AMORTIZATION';
  cTXT0000044 = 'A default Amortization GL Account has not assigned in the system parameters. No account has been assigned to this amortization item.';
  cTXT0000045 = 'AutoInvoice Date';
  cTXT0000046 = 'Select a maximum AutoInvoice date:';
  cTXT0000047 = 'Processing.  Please wait...';
  cTXT0000048 = 'No Eplant';
  cTXT0000049 = 'Eplant %s';
  cTXT0000050 = 'Batch Date';
  cTXT0000051 = 'Please select a batch date:';
  cTXT0000052 = 'Auto Invoicing complete';
  cTXT0000053 = 'Miscellaneous Description';
  cTXT0000054 = 'Credit Memos may not be edited';
  cTXT0000055 = 'For a Credit Memo, the Invoice quantity must be 1.';
  cTXT0000056 = 'Please select a Freight company.';
  cTXT0000057 = 'Please assign a GL account to the freight company.';
  cTXT0000058 = 'Only one detail record is allowed in a Credit Memo.';
  cTXT0000059 = 'Invoice # %s already exists.';
  cTXT0000060 = 'The Invoice date (%s) does not fall within the Period dates (%s - %s)';
  cTXT0000061 = 'Customer supplied material.  Available to credit.';
  cTXT0000062 = 'No Customer supplied material available to credit';
  cTXT0000063 = 'Surcharge/Discount';
  cTXT0000064 = 'Enter percent of the Surcharge/Discount';
  cTXT0000065 = 'Total percentage must amount to 100%';
  cTXT0000066 = 'Do you wish to update the settings in the inventory?';
  cTXT0000067 = 'Invalid amount';
  cTXT0000068 = 'Absolute amount must not be greater than %m';
  cTXT0000069 = 'The amount must be negative';
  cTXT0000070 = 'Invalid entry';
  cTXT0000071 = 'Invoice Items - %s, %s';
  cTXT0000072 = 'Shipped so far: %f';
  cTXT0000073 = 'Consumed so far: %f';
  cTXT0000074 = 'View Voided Invoices (All Invoices)';
  cTXT0000075 = 'View Voided Invoices - %s, %s';
  cTXT0000076 = 'View Voided Invoices - Period # %d (%s - %s)';
  cTXT0000077 = 'View Voided Invoices - Original Invoice';
  cTXT0000078 = 'You are about to VOID an Invoice.  ' + 
                'This change is irreversible.' + #13 +
                'Do you wish to continue?';
  cTXT0000079 = 'Entry for this invoice is found in the Cash Receipts PrePost Table.' + #13 +
                'In order to void the invoice this entry (or entries) must be deleted.' + #13 +
                'Do you wish to continue and delete those entries or quit the voiding?';
  cTXT0000080 = 'Record for the invoice was posted to the Cash receipts AfterPost table.  Cannot void.';
  cTXT0000081 = 'Invoice Voided. Print the AfterPost report?';
  cTXT0000082 = 'Cannot obtain lock on the AR AfterPost table.  ' +
                'It may be locked by another user.' + #13 +
                'Please try again later.';
  cTXT0000083 = 'Cross reference detected.  Holiday period %s start time is within %s period.';
  cTXT0000084 = 'Cross reference detected.  Holiday period %s end time is within %s period.';
  cTXT0000085 = 'Invoice Information';
  cTXT0000086 = 'Invoice Notes';
  cTXT0000087 = 'Accessing Accounts Receivable Invoices.  Please wait.';
  cTXT0000088 = 'Accessing Invoice Codes.  Please wait.';
  cTXT0000089 = 'Accessing Archived Accounts Receivable Invoices.  Please wait.';
  cTXT0000090 = 'Wrong Customer Statement Date'; 
  cTXT0000091 = 'Customer pick list Date';
  cTXT0000092 = 'Please select Customer pick list Date';
  cTXT0000093 = 'GL Account requires entry of a Cost Source.';
  cTXT0000094 = 'Sum of Split Amounts does not match the Total Amount.';
  cTXT0000095 = 'Please assign Unit Price.';
  cTXT0000096 = 'Commissions Amount recalculated.';
  cTXT0000097 = 'One or more items are already in the prepost table and could not be transferred.';
  cTXT0000098 = 'Calculating Taxes.  Please wait...';
  cTXT0000099 = 'Unable to create Invoice. Bill To address not assigned.';
  cTXT0000100 = 'Invoice # %s for your PO # %s';
  cTXT0000101 = 'Invoice # %s';
  cTXT0000102 = 'Invoice # %s %s';
  cTXT0000103 = 'Invoice cannot be voided. Associated Credit Memo(s) must be voided first.';
  cTXT0000104 = 'Posting an additional Credit memo could result in an over credit. Please adjust unit prices in the Credit Memo according to the Balance Due on the original Invoice.';
  cTXT0000105 = 'Credit Memo was not created.  Balance Due is %m.';
  cTXT0000106 = 'Only one Credit Memo is allowed in the Prepost table.  The existing Credit Memo in the Prepost table must be posted or deleted.';
  cTXT0000107 = '';
  cTXT0000108 = '';
  cTXT0000109 = '';
  cTXT0000110 = '';
  cTXT0000111 = '';
  cTXT0000112 = '';
  cTXT0000113 = '';
  cTXT0000114 = '';
  cTXT0000115 = '';
  cTXT0000116 = '';
  cTXT0000117 = '';
  cTXT0000118 = '';
  cTXT0000119 = '';
  cTXT0000120 = '';
  cTXT0000121 = '';
  cTXT0000122 = '';
  cTXT0000123 = '';
  cTXT0000124 = '';
  cTXT0000125 = '';
  cTXT0000126 = '';
  cTXT0000127 = '';
  cTXT0000128 = '';
  cTXT0000129 = '';
  cTXT0000130 = '';
  cTXT0000131 = '';
  cTXT0000132 = '';
  cTXT0000133 = '';
  cTXT0000134 = '';
  cTXT0000135 = '';
  cTXT0000136 = '';
  cTXT0000137 = '';
  cTXT0000138 = '';
  cTXT0000139 = '';
  cTXT0000140 = '';
  cTXT0000141 = '';
  cTXT0000142 = '';
  cTXT0000143 = '';
  cTXT0000144 = '';
  cTXT0000145 = '';
  cTXT0000146 = '';
  cTXT0000147 = '';
  cTXT0000148 = '';
  cTXT0000149 = '';
  cTXT0000150 = '';

  // ar_rscstr.cTXT0000084


implementation

end.
