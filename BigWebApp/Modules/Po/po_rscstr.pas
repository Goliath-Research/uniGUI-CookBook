unit po_rscstr;

interface

resourcestring

   // po_rscstr.cTXT0000051
   // po_rscstr.cTXT0000045 {'Accessing Purchase Orders.  Please wait.'}
   cTXT0000001 = 'PO not found.  Cannot create new record';
   cTXT0000002 = 'PO Status: Not Approved.'#13'Click to Approve or Deny.';
   cTXT0000003 = 'PO Status: Denied.'#13'Click to Approve or Revert to Unapproved.';
   cTXT0000004 = 'PO Status: Approved.'#13'Click to Unapprove or Deny.';
   cTXT0000005 = 'Tax Components:';
   cTXT0000006 = 'Record was not archived';
   cTXT0000007 = 'Record archived successfully';
   cTXT0000008 = 'Some items are not closed.  Cannot archive.';
   cTXT0000009 = 'Archive PO # %s?';
   cTXT0000010 = 'The Note field exceeded 2000 characters and has been truncated.';
   cTXT0000011 = 'Miscellaneous Item - No price breaks';
   cTXT0000012 = 'Price List for Item %s, Revision %s';
   cTXT0000013 = 'Blanket Quantity has changed. Update the Unit Price?';
   cTXT0000014 = 'Multiple rows are selected.  Do you wish to unassign the cost source for all the selected records?';

   cTXT0000015 = 'User Name: %s';
   cTXT0000016 = 'PO Total : %m';
   cTXT0000017 = 'PO Cost Limits:';
   cTXT0000018 = 'Raw Material: %m ';
   cTXT0000019 = 'Capital: %m';
   cTXT0000020 = 'Expense: %m';
   cTXT0000021 = 'Cost increase: Not Authorized';

   cTXT0000022 = 'Cannot change EPlant. PO Detail Item and Inventory Item must have the same EPlant.';
   cTXT0000023 = 'Please post changes before repeating.';
   cTXT0000024 = 'Form View';
   cTXT0000025 = 'Updating PO Receipts.  Please wait...';
   cTXT0000026 = 'Attempt to re-evaluate PO Receipts against PO Releases failed because of the following error:';
   cTXT0000027 = 'Failed to change the status to %s.'#13#13'%s';
   cTXT0000028 = 'Releases received in full are hidden.'#13'Click to show.';
   cTXT0000029 = 'Hide releases received in full.';

   cTXT0000030 = 'Multiple rows are selected.  Do you wish to reassign the cost source of the selected records?';
   cTXT0000031 = 'Compressing tables, please wait...';
   cTXT0000032 = 'Update %s column title';
   cTXT0000033 = 'Nothing to Adjust';
   cTXT0000034 = 'Invalid Qty.';
   cTXT0000035 = 'Check to display Purchase Orders for %s';
   cTXT0000036 = 'Check to display Purchase Orders below limit for %s';
   cTXT0000037 = 'User ID: %s';
   cTXT0000038 = 'Mode: %s';
   cTXT0000039 = 'Click to view hierarchical tree of users who can be approved by %s';
   cTXT0000040 = 'Evaluation completed.';
   cTXT0000041 = 'This option clears PO Rejection so that the next time ' +
    'Evaluate Workflow runs it will be resubmitted for approval.'#13#13 +
    'Are you sure you want to continue?';
   cTXT0000042 = 'If this option is checked, once PO Workflow is rejected and ' +
    'restarted, the entire Workflow process will be re-applied in full.'#13#13 +
    'Are you sure you want to activate this setting?';
   cTXT0000043 = 'This option ensures that once PO Workflow is rejected and ' +
    'restarted, the entire Workflow process will be re-applied in full.'#13#13 +
    'The setting is currently on. Are you sure you want to turn off this setting?';
   cTXT0000044 = 'Purchase Order # %s';
   cTXT0000045 = 'Accessing Purchase Orders.  Please wait.'; 
   cTXT0000046 = 'Vendor Filter is off.  Click to turn on.'; 
   cTXT0000047 = 'Vendor Filter is on. Click to turn off.'; 
   cTXT0000048 = 'Vendor not found.'; 
   cTXT0000049 = 'Purchase Order cloned successfully.'#13 +
    'One or more items were not found in Inventory and could not be cloned.'#13 +
    'New Purchase Order #:  %s';
   cTXT0000050 = 'Purchase Order cloned successfully.'#13 +
    'New Purchase Order #:  %s';
   cTXT0000051 = 'Purchase Order could not be cloned.'; 
   cTXT0000052 = 'Do you wish to UnArchive selected POs?';
   cTXT0000053 = 'Processing.  Please wait.';
   cTXT0000054 = 'Process Complete.'; 
   cTXT0000055 = 'Invalid Starting Year.  Cannot continue.';
   cTXT0000056 = 'Please select an Inventory item.  Cannot continue.';
   cTXT0000057 = 'Please select a Vendor.  Cannot continue.';
   cTXT0000058 = 'GL Account requires entry of a Cost Source.'; 
   cTXT0000059 = 'Unit price has changed.  Update uninvoiced receipts?'; 
   cTXT0000060 = 'Standard Cost is not assigned.';
   cTXT0000061 = 'Purchase Order %s for %s (Vendor # %s)'; 
   cTXT0000062 = 'Requisition %s for %s (Vendor # %s)'; 
   cTXT0000063 = 'Unit Price is greater than Standard Item Price. Continue?';
   cTXT0000064 = 'Unit Price is greater than Standard Item Price.'; 
   cTXT0000065 = 'Unable to locate requisition %d.  The first available ' +
     'record has been selected.';
   cTXT0000066 = 'Items marked Closed are hidden.'; 
   cTXT0000067 = 'Press to hide Items marked Closed.'; 
   cTXT0000068 = 'Reviewer: '; 
   cTXT0000069 = 'Authorizer: '; 
   cTXT0000070 = 'Sign Off Date: '; 
   cTXT0000071 = 'Sign Off Notes: '; 
   cTXT0000072 = 'PO Status: Denied.';
   cTXT0000073 = 'Click to Approve or Deny.'; 
   cTXT0000074 = 'PO Status: ';
   cTXT0000075 = 'Click to Deny or Revert to Unapproved.'; 
   cTXT0000076 = 'Click to Approve or Revert to Unapproved.'; 
   cTXT0000077 = 'Buyer is not assigned - operation aborted';
   cTXT0000078 = 'Cannot delete a received item - operation aborted';
   cTXT0000079 = 'Warning!'#13'Release received in full or Release partially received.'#13#13'Are you sure you want to continue?';
   cTXT0000080 = 'This is a full or partial received release - operation aborted per user instruction.';
   cTXT0000081 = 'Enable Workflow?';
   cTXT0000082 = 'Are you sure you want to delete Purchase Order # %s?';
   cTXT0000083 = 'Transaction location plan needs to be recalculated';
   cTXT0000084 = 'System parameters prevent modifying a closed PO line. Check with your DBA.';
   cTXT0000085 = 'Not Approved.';
   cTXT0000086 = 'Standard Cost is not assigned. Do you wish to Continue?';
   cTXT0000087 = 'Use for customer supplied materials.';
   cTXT0000088 = 'PO Item %s Information';
   cTXT0000089 = 'Approved';
   cTXT0000090 = 'Status';
   cTXT0000091 = 'PO# %s status is ''%s''.'#13#13 +
     'About to attempt to approve the PO.';
   cTXT0000092 = 'This is a drop ship PO associated with a sales order # %s.'#13+
     'Direct PO modifications or receipts are not allowed.'#13+
     'Changes must be made to the associated sales order.';
   cTXT0000093 = 'This is a drop ship PO associated with a sales order # %s.'#13 +
     'Modifications should be made to the associated sales order.'#13#13+
     'Are you sure you want to continue?';
   cTXT0000094 = 'Misc. Item';
   cTXT0000095 = 'PO # %s status is ''%s''.'#13#13 +
     'About to attempt to approve the PO.';
   cTXT0000096 = 'No PO Workflow exists.  Operation aborted.';
   cTXT0000097 = 'Is this a purchase order revision?';
   cTXT0000098 = 'The total quantity of the releases (%.4f) for %s is greater ' +
     'than the blanket quantity (%.4f).  This may affect PO approval.  What ' +
     'do you want to do?';
   cTXT0000099 = 'A release must be attached to a PO line';
   cTXT0000100 = 'Over receipt on purchase order message';
   cTXT0000101 = 'Please enter a Request Date.';
   cTXT0000102 = 'Please enter a Promise Date.';
   cTXT0000103 = 'Release quantity must be greater than 0.00.';
   cTXT0000104 = 'A Shipping address has not been assigned to the Purchase Order.';
   cTXT0000105 = 'Please enter a PO number.';
   cTXT0000106 = 'This PO number %s already exists in the history table.  ' +
     'Please enter a different PO number.';
   cTXT0000107 = 'Unable to locate requested record [ID = %.0f].';
   cTXT0000108 = 'Originated under EPlant, %s.';
   cTXT0000109 = 'Jump to PO Workflow';
   cTXT0000110 = 'The selected quantity (%f %s) is less than the minimum ' +
     'quantity (%f %s) in the Quantity/Price breaks table (%s).';
   cTXT0000111 = 'No PO Workflow exists for PO # %s.';
   cTXT0000112 = 'No PO Workflow exists for %s.';
   cTXT0000113 = 'Unknown PO Status: %s';
   cTXT0000114 = 'Requisition #';
   cTXT0000115 = 'PO #';
   cTXT0000116 = 'This option will update the unit price for the selected ' +
     'item on all purchase orders.'#13#13'Do you wish to continue?';
   cTXT0000117 = 'This option will update the unit price for all items on ' +
     'all purchase orders.'#13#13'Do you wish to continue?';
   cTXT0000118 = 'Delete the current record?';
   cTXT0000119 = 'Are you sure you want to rewind/reset the Workflow ' +
     'approval process?';
   cTXT0000120 = 'Unable to archive the PO because the total VMI Received ' +
     'Quantity is greater than total Quantity Received. Please see the ' +
     'Receipt Information in order to determine the necessary corrections.';
   cTXT0000121 = 'Requisition # %.0f';
   cTXT0000122 = 'PO # %s';
   cTXT0000123 = 'PO # %s %s';
   cTXT0000124 = 'Row cannot be left blank.';
   cTXT0000125 = 'Please select a GL Account.';
   cTXT0000126 = 'Receipts have been created for this PO line item. Changing ' +
    'the Item # is not permitted.';
   cTXT0000127 = 'Start Date is less than Lead Time.'#13#13'Is this correct?';
   cTXT0000128 =  'Multiselect is unavailable for miscellaneous items.  ' +
    'Please use the "insert" button.';
   cTXT0000129 = 'There is no template based Workflow associated with %s.';
   cTXT0000130 = 'None of the team members assigned to this Workflow have a PO Limit greater or equal '+
     'to this requisition amount. '#13#13+
     'Please include a team member with a PO Limit sufficient to approve this requisition.';
   cTXT0000131 = 'Please check your date value.';
   cTXT0000132 = 'Changes have been made since taxes were last calculated. Recalculate now?';
   cTXT0000133 = 'PO not found.  Please check your EPlant filter.';
   cTXT0000134 = 'Processing PO header rec # %d';
   cTXT0000135 = 'Failed to Archive PO ID = %s'#13 +
    'System is currently busy compressing a table and rebuilding ' +
    'associated indexes.  Please wait and try again later.'#13#13'%s';
   cTXT0000136 = 'Failed to Archive PO # = %s'#13'%s';
   cTXT0000137 = 'Marking purchased orders.  Please wait ...';
   cTXT0000138 = 'Finished marking purchase orders.'#13#13'Number of records marked: %d.';
   cTXT0000139 = 'About to archive and delete %d purchased order(s). Please confirm to continue.';
//   cTXT0000140 = '';
//   cTXT0000141 = '';
//   cTXT0000142 = '';
//   cTXT0000143 = '';
//   cTXT0000144 = '';
//   cTXT0000145 = '';
//   cTXT0000146 = '';
//   cTXT0000147 = '';
//   cTXT0000148 = '';
//   cTXT0000149 = '';
//   cTXT0000150 = '';
//   cTXT0000151 = '';
//   cTXT0000152 = '';
//   cTXT0000153 = '';
//   cTXT0000154 = '';
//   cTXT0000155 = '';
//   cTXT0000156 = '';
//   cTXT0000157 = '';
//   cTXT0000158 = '';
//   cTXT0000159 = '';
//   cTXT0000160 = '';
//   cTXT0000161 = '';
//   cTXT0000162 = '';
//   cTXT0000163 = '';
//   cTXT0000164 = '';
//   cTXT0000165 = '';
//   cTXT0000166 = '';
//   cTXT0000167 = '';
//   cTXT0000168 = '';
//   cTXT0000169 = '';
//   cTXT0000170 = '';
//   cTXT0000171 = '';
//   cTXT0000172 = '';
//   cTXT0000173 = '';
//   cTXT0000174 = '';
//   cTXT0000175 = '';
//   cTXT0000176 = '';
//   cTXT0000177 = '';
//   cTXT0000178 = '';
//   cTXT0000179 = '';
//   cTXT0000180 = '';
//   cTXT0000181 = '';
//   cTXT0000182 = '';
//   cTXT0000183 = '';
//   cTXT0000184 = '';
//   cTXT0000185 = '';
//   cTXT0000186 = '';
//   cTXT0000187 = '';
//   cTXT0000188 = '';
//   cTXT0000189 = '';
//   cTXT0000190 = '';
//   cTXT0000191 = '';
//   cTXT0000192 = '';
//   cTXT0000193 = '';
//   cTXT0000194 = '';
//   cTXT0000195 = '';
//   cTXT0000196 = '';
//   cTXT0000197 = '';
//   cTXT0000198 = '';
//   cTXT0000199 = '';
//   cTXT0000200 = '';

implementation

end.
