unit rma_rscstr;

interface

// rma_rscstr.cTXT0000072

resourcestring
   cTXT0000001 = 'Accessing RMA.  Please wait.'; 
   cTXT0000002 = 'RMA has details. Cannot change customer';
   cTXT0000003 = 'The quantity returned exceeds quantity shipped. Continue?';
   cTXT0000004 = 'Do you want to apply restocking charges?';
   cTXT0000005 = 'The quantity received is zero. Do you still wish to issue a credit memo?';
   cTXT0000006 = 'A credit memo has already been issued. Do you want to create another?'; 
   cTXT0000007 = 'Do you want to issue a credit memo?';
   cTXT0000008 = 'Incompatible Eplants. Cannot create Credit Memo.';
   cTXT0000009 = 'RMA # assigned based on generic sequence';
   cTXT0000010 = 'RMA # assigned based on %s EPlant sequence';
   cTXT0000011 = 'Not Approved';
   cTXT0000012 = 'RMA # State: Not Approved.'#13'Click to Approve';
   cTXT0000013 = 'RMA # State: Approved.'#13'Click to Unapprove';
   cTXT0000014 = '%s # is not assigned'#13 +
     'Use Click or drop-down arrow to associate or create a new %s';
   cTXT0000015 = '%s #: %s'#13'Click to view or edit';
   cTXT0000016 = 'This RMA is associated with a %s ' +
                 'that is no longer available.'#13#13 +
                 'Use the Detach From drop-down option ' +
                 'to clear and then select new %s.';
   cTXT0000017 = 'Show CAR/CAPA/MRB history for this item';
   cTXT0000018 = 'Show CAR history for this item';
   cTXT0000019 = 'Show CAPA history for this item';
   cTXT0000020 = 'Failed to approve RMA.';
   cTXT0000021 = 'Failed to unapprove RMA.';
   cTXT0000022 = 'User Name:  %s'#13+
                 'RMA Total Amount: %m'#13+
                 'RMA Limit Amount: %m';
   cTXT0000023 = 'RMA has details. Cannot change customer.';
   cTXT0000024 = 'Order information is unavailable.';
   cTXT0000025 = 'PO #: %s'; 
   cTXT0000026 = 'Do you want to adjust the Sales Order based on the Quantity to Return?';
   cTXT0000027 = 'Rejected Detail Records';
   cTXT0000028 = 'Detail record for Item # %s has receipts against it.';
   cTXT0000029 = 'Detail record for Item # %s has already been updated.';
   cTXT0000030 = 'Work order must be open to perform this operation.';
   cTXT0000031 = 'This work order was closed and converted to a sales order.';
   cTXT0000032 = 'Are you sure you want to close the work order, and create a sales order?';
   cTXT0000033 = 'Repair of %s';
   cTXT0000034 = 'Item # %s - some material and/or labor has not been posted.'#13#13+
          'Would you like to post outstanding items now before ' +
          'proceeding to close the work order?';
   cTXT0000035 = 'Close all work orders for this RMA and create a sales order?';
   cTXT0000036 = 'Processing.  Please wait.';
   cTXT0000037 = 'Item # %s - Quantity must be entered.';
   cTXT0000038 = 'Item # %s - Location must be entered.';
   cTXT0000039 = 'Invalid Work Order number.';
   cTXT0000040 = 'Order #';
   cTXT0000041 = 'PO #';
   cTXT0000042 = 'Packing Slip #';
   cTXT0000043 = 'Sales Order Update';
   cTXT0000044 = 'The quantity entered does not correspond to the assigned total.';
   cTXT0000045 = 'Order Information'; 
   cTXT0000046 = 'Property';
   cTXT0000047 = 'Value';
   cTXT0000048 = 'RMA Transaction, RMA # %s';
   cTXT0000049 = 'This is a serialized item. The associated labels quantity ' +
    'must match the assigned total quantity.';
   cTXT0000050 = 'The Shipments table has been updated.  Cannot abort.'; 
   cTXT0000051 = 'Do you wish to spread evenly selected location RMA quantity over a number of labels?'; 
   cTXT0000052 = 'Quantity';
   cTXT0000053 = 'How many boxes or packages?';
   cTXT0000054 = 'The number of labels must be a number greater than 0.'; 
   cTXT0000055 = 'The RMA assigned quantity and the Associated Labels total quantity ' +
       'do not match.  Please adjust your quantity values, and try again.';
   cTXT0000056 = 'Show associated labels: On'#13'Click to turn it off.';
   cTXT0000057 = 'Show associated labels: Off'#13'Click to turn it on.'; 
   cTXT0000058 = 'Parent record not found';
   cTXT0000059 = 'Please specify a Due Date.';
   cTXT0000060 = 'Please enter a Quantity.'; 
   cTXT0000061 = 'The Due Date must be on or after the Created On date.'; 
   cTXT0000062 = 'Please select valid Inventory item first.';
   cTXT0000063 = 'This record has been posted.  Cannot delete or change.';
   cTXT0000064 = 'This record has been posted.  Changes are not allowed.';
   cTXT0000065 = 'The quantity entered does not equal the total.';
   cTXT0000066 = 'Repair Item Lookup List is on.'#13'Click to turn off.';
   cTXT0000067 = 'Repair Item Lookup List is off'#13'Click to turn on.';
   cTXT0000068 = 'Please select an item.';
   cTXT0000069 = 'View RMA (All RMA''s)';
   cTXT0000070 = 'View RMA (for Customer: %s)';
   cTXT0000071 = 'View RMA (Original RMA)';
   cTXT0000072 = 'Processing RMA header record # %d';
   cTXT0000073 = 'Cannot adjust the Sales Order, Sales Order no longer available.';
   cTXT0000074 = 'Cannot adjust the Sales Order for Item # %s, Sales Order no longer available.';
   cTXT0000075 = 'Cannot adjust the sales order - order has been archived';
   cTXT0000076 = 'Are you sure you want to close the work order?'; 
   cTXT0000077 = 'Credit memo for RMA# ''%s'' does not exist';
   cTXT0000078 = 'A Credit memo has not been issued - do you still want to close the RMA?';
   cTXT0000079 = 'A Credit memo has not been issued, cannot close.'; 
   cTXT0000080 = 'Add new row to sales order for return?'; 
   cTXT0000081 = 'The order has been archived. Cannot adjust SO.'; 
   cTXT0000082 = 'Cannot receive a Zero qty. for a SIC item';
   cTXT0000083 = 'Qty. is Zero. Do you wish to receive a Zero qty?';
   cTXT0000084 = 'Cannot receive a Zero qty.';
   cTXT0000085 = 'Pending transactions have not been processed. Are you sure you want to Delete?'; 
   cTXT0000086 = 'Unposted Journal transactions have not been processed. Are you sure you want to Delete?'; 
   cTXT0000087 = 'Cannot receive against a Misc. Charge Item.'; 
   cTXT0000088 = 'Create New Sales Order for Item?'; 
   cTXT0000089 = 'Sales Order %s has been created'; 
   cTXT0000090 = 'Show MRB history for this item';
   cTXT0000091 = 'Nothing selected.';
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
