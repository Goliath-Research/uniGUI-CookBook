unit oe_rscstr;

interface

resourcestring

  // oe_rscstr.cTXT0000130

  cTXT0000001 = 'Item #';
  cTXT0000002 = 'Description';
  cTXT0000003 = 'Class';
  cTXT0000004 = 'Revision';
  cTXT0000005 = 'Cannot find selected Sales Order among current or archived Orders [Order Detail ID: %.0f]';
  cTXT0000006 = 'Updating blanket quantity ...';
  cTXT0000007 = 'Appending Releases ...';
  cTXT0000008 = 'Creating Sales Order...';
  cTXT0000009 = 'Creating Sales Order:'#13'Adding requested item.';
  cTXT0000010 = 'Creating Sales Order:'#13'Updating ...';
  cTXT0000011 = 'Tax Components:';
  cTXT0000012 = 'Calculate aggregated pricing based on Product Code';
  cTXT0000013 = 'Calculate aggregated pricing based on Tier Discount';
  cTXT0000014 = 'Attached credit card: %s';
  cTXT0000015 = 'None';
  cTXT0000016 = 'Warehouse/Division: %s';
  cTXT0000017 = 'N/A';
  cTXT0000018 = 'Customer Status Exception Authorization:'#13#13'%s';
  cTXT0000019 = 'Sales Order Information';
  cTXT0000020 = 'Sales Order Documents';
  cTXT0000021 = 'Do you wish to create an invoice?';
  cTXT0000022 = 'Add or edit miscellaneous item';
  cTXT0000023 = 'Select an Inventory item';
  cTXT0000024 = 'Select an AKA Inventory item';
  cTXT0000025 = 'Edit Cumulative Quantity (currently off).'#13'Click to turn on.';
  cTXT0000026 = 'Edit Cumulative Quantity (currently on).'#13'Click to turn off.';
  cTXT0000027 = 'Request Date';
  cTXT0000028 = 'Please enter Request Date';
  cTXT0000029 = 'Invalid date';
  cTXT0000030 = 'Update %s column title';
  cTXT0000031 = 'Releases with known Ship Dates are hidden.'#13'Click to show.';
  cTXT0000032 = 'Hide releases with known Ship Dates.';
  cTXT0000033 = 'Updating Releases.  Please wait.';
  cTXT0000034 = 'Shipping Partner information is unavailable for %s';
  cTXT0000035 = 'A Transaction 855 has already been created for this Sales Order. Do you wish to create another one?';
  cTXT0000036 = 'Checking availability.  Please wait.';
  cTXT0000037 = 'Cannot create pick ticket.'#13 +
    'Either there are no outstanding releases available for the shipment, Ship To address is not assigned, Item is on Ship Hold'+
    ' or a pick ticket already exists for these releases.';
  cTXT0000038 = 'The release quantity, %f, does not conform to the container (multiples of) release quantity, %f,' +
    ' for Inventory item, %s.'#13'Would you like to change it to the suggested quantity of, %f?';
  cTXT0000039 = 'Missing Purchase Order number.  Cannot group Sales Orders by Customer Purchase Order.';
  cTXT0000040 = 'No system-generated Work Orders found.';
  cTXT0000041 = 'Aggregate pricing has already been calculated for this Sales Order.  Override it?';
  cTXT0000042 = 'Calculate aggregate pricing?';
  cTXT0000043 = 'An aggregate discount has already been calculated for this Sales Order.  Override it?';
  cTXT0000044 = 'Calculate the aggregate discount?';
  cTXT0000045 = 'Update sales price based on the selected release quantity?';
  cTXT0000046 = 'Update unit price for selected item?';
  cTXT0000047 = 'Update unit price for all Sales Order items?';
  cTXT0000048 = 'Total on Order for %s is %.0f.';
  cTXT0000049 = 'The Customer has already been charged for the full amount of this order. Continue?';
  cTXT0000050 = 'The Customer has already been overcharged for this order.  Continue?.';
  cTXT0000051 = 'An invoice has already been charged for this Sales Order.  Continue?';
  cTXT0000052 = 'Default Division: %s';
  cTXT0000053 = 'N/A';
  cTXT0000054 = 'Updating Sales Order:'#13'Adding item %s...';
  cTXT0000055 = 'Intercompany Order';
  cTXT0000056 = 'Update the linked Service Labor Meeting in CRM?';
  cTXT0000057 = 'CRM Service Labor Meetings are linked to this Sales Order.  Cannot delete.';
  cTXT0000058 = 'Accessing Sales Orders.  Please wait.';
  cTXT0000059 = 'Outsource Order';
  cTXT0000060 = 'Compressing tables.  Please wait...';
  cTXT0000061 = 'Do you want to modify commissions on all detail items?';
  cTXT0000062 = 'Error updating records.';
  cTXT0000063 = 'Accessing Archived Sales Orders. Please wait.';
  cTXT0000064 = 'This customer is over the credit limit. Continue?';
  cTXT0000065 = 'This customer is over the credit limit.';
  cTXT0000066 = 'Sales Order Extended Note';
  cTXT0000067 = 'Release shipped in full.  Continue?';
  cTXT0000068 = 'Release shipped in full.  Cannot delete.';
  cTXT0000069 = 'Delete selected record(s)?';
  cTXT0000070 = 'Cannot convert pending order.';
  cTXT0000071 = 'Do you wish to convert to Sales Orders?';
  cTXT0000072 = 'Processing.  Please wait...';
  cTXT0000073 = 'Do you wish to send acknowledgment e-mail(s)?';
  cTXT0000074 = 'Web Order Ref # %s';
  cTXT0000075 = 'Creating report (%s).  Please wait...';
  cTXT0000076 = 'Web Order Reference number, %s, was processed successfully on %s';
  cTXT0000077 = 'Web Order Acknowledgment';
  cTXT0000078 = 'Web Sales Order Processing';
  cTXT0000079 = 'Web Sales Order Processing (%s)';
  cTXT0000080 = 'C.O.D.';
  cTXT0000081 = 'Prepaid';
  cTXT0000082 = 'On Account';
  cTXT0000083 = 'Credit Card';
  cTXT0000084 = 'Sales Order for %s (Customer # %s)';
  cTXT0000085 = 'PO # %s is already assigned to the selected customer. Proceed?';
  cTXT0000086 = 'PO # %s is already assigned to the selected customer - operation aborted.';
  cTXT0000087 = 'A Shipping address has not been assigned to the Sales Order.';
  cTXT0000088 = 'Sales Order Deleted';
  cTXT0000089 = 'Sales Order Archived and Deleted';
  cTXT0000090 = 'Module: Sales Orders, Sales Order #: %s, Action: %s';
  cTXT0000091 = 'Please enter an item description.';
  cTXT0000092 = 'Item %s has a setup charge of %s';
  cTXT0000093 = 'Total:  %m'      ;
  cTXT0000094 = 'Current:  %m'    ;
  cTXT0000095 = 'Credit Limit: %m';
  cTXT0000096 = 'Open to buy: %m' ;
  cTXT0000097 = 'The blanket quantity has changed. Update the unit price?';
  cTXT0000098 = 'Please create an order line item before trying to add releases.';
  cTXT0000099 = 'The release you are editing has been shipped in full. Shipment History ' +
      'information will NOT be updated with your changes. To affect shipment ' +
      'information, changes must be made to the release prior to packing slip generation.'#13#13 +
      'Do you want to cancel the changes?';
  cTXT0000100 = 'The total release quantity for item, %s, is greater than the blanket quantity.';
  cTXT0000101 = 'Please enter a release quantity.';
  cTXT0000102 = 'The release quantity must be greater than 0.';
  cTXT0000103 = 'Sales Order Item Information'; 
  cTXT0000104 = 'Parent record not found.  Cannot post.'; 
  cTXT0000105 = 'The total commission is greater than 100%.  Cannot post.'; 
  cTXT0000106 = 'Misc. Item'; // Miscellaneous Item
  cTXT0000107 = 'The order line is linked to a pick ticket with assigned inventory locations (PT# %.0f) - operation aborted.'; 
  cTXT0000108 = 'GL Account requires entry of a Cost Source.'; 
  cTXT0000109 = 'The order line is linked to a pick ticket (PT# %.0f) - operation aborted.'; 
  cTXT0000110 = 'Please enter Orders#';
  cTXT0000111 = 'Sales Order Cloned.';
  cTXT0000112 = 'Total on Sales order:  %m' ;
  cTXT0000113 = 'Customer Status was changed to %s';
  cTXT0000114 = 'Clear the Campaign Code?';
  cTXT0000115 = 'Sales Order %s for %s (Customer # %s)';
  cTXT0000116 = 'Freight Quote# %s';
  cTXT0000117 = 'Are you sure you want to mark all items ''On Hold''?';
  cTXT0000118 = 'Are you sure you want to unmark all items as being ''On Hold''?';
  cTXT0000119 = 'Release partially shipped.  Continue?';
  cTXT0000120 = 'Release partially shipped.  Cannot delete.';
  cTXT0000121 = 'Get freight estimate from Web service';
  cTXT0000122 = 'Would you like shipping rate and class to be calculated based on user assigned values?';
  cTXT0000123 = 'Would you like shipping rate and class to be calculated for you?';
  cTXT0000124 = 'Finished calculating shipping rate and class.';
  cTXT0000125 = 'BOL information is unavailable.';
  cTXT0000126 = 'This option calculates shipping rate and class for each item based on user assigned values.  Please confirm to continue.';
  cTXT0000127 = 'This option calculates default shipping rate and class for each item - please confirm to continue.';
  cTXT0000128 = 'Finished calculating shipping rates and classes for all items.';
  cTXT0000129 = 'One or more items had no BOL information available.';
  cTXT0000130 = 'Calculated Freight Quote #%s.'; 
  cTXT0000131 = 'Order detail line is marked ''Drop-Ship'' - operation is not supported.'; 
  cTXT0000132 = 'Unarchive the selected Sales Orders?';
  cTXT0000133 = 'Are you sure you want to hide this line item with existing backlog?'; 
  cTXT0000134 = 'Ship To Address has changed to a different tax code or salesperson.  Update order details to new tax code or salesperson?'; 
  cTXT0000135 = 'The quantity, %f, does not conform to the container (multiples of) quantity, %f,' +
    ' for Inventory item, %s.'#13'Would you like to change it to the suggested quantity of, %f?';
  cTXT0000136 = 'Calculate aggregated pricing based on AKA/Product Code';
  cTXT0000137 = 'Do you wish to update the Date for every sales order line item with the Delivery Date?'; 
  cTXT0000138 = 'This option is not available on a Misc. or Non-Material Item'; 
  cTXT0000139 = 'A Transaction 865 has already been created for this Sales Order. Do you wish to create another one?';
  cTXT0000140 = 'Cannot toggle Expedited to ''Y'' for a shipped in full release.'; 
  cTXT0000141 = 'The Must Ship Date + Std Lead Days is equal to or greater than the Promise Date'; 
  cTXT0000142 = 'Please enter a description.';
  cTXT0000143 = 'Campaign codes assigned to detail items will be cleared.  ' +
   'Do you wish to continue?';
  cTXT0000144 = 'Miscellaneous item description required.';
  cTXT0000145 = 'Cannot delete a shipped item.';
  cTXT0000146 = 'The requested date and/or promised date occurs in the past.'#13#13'Are you sure you want to continue?';
  cTXT0000147 = 'Item# %s: '#13#13;
  cTXT0000148 = 'The release quantity, %f, is less than the Minimum Selling ' +
    'quantity, %f, for Inventory Item, %s.  Would you like to change it to ' +
    'the Minimum Selling quantity of, %f?';
  cTXT0000149 = 'The selected quantity (%f %s) is less than the minimum ' +
      'quantity (%f %s) in the Quantity/Price breaks table (%s).  Do you ' +
      'want to continue?';
  cTXT0000150 = 'Are you sure you want to delete and/or archive the Auto ' +
    'MRP Sales Order # %s';
  cTXT0000151 = 'Customer Bill To Status Exception Authorization:'#13#13'%s';
  cTXT0000152 = 'Would you like to recalculate CTP?';
  cTXT0000153 = 'Ship In Full CTP date is undefined';
  cTXT0000154 = 'Assign all promise dates Ship In Full CTP date?';
  cTXT0000155 = 'Assign line item CTP to the Sales Order?';
  cTXT0000156 = 'Manual Outsource Order';
    
  cTXT0000157 = 'Sales order pricing has expired. Inventory Default Standard ' +
    'Item Price will be used instead. Continue?';
  cTXT0000158 = 'Cannot change Ship Hold for CIA customer';
  cTXT0000159 = 'The quantity, %f, is less than the Minimum Selling ' +
    'quantity, %f, for Inventory Item, %s.  Would you like to change it to ' +
    'the Minimum Selling quantity of, %f?';
  cTXT0000160 = 'Outsource details for OE# %s, Item# %s';
  cTXT0000161 = 'Multiselect is unavailable for miscellaneous items.  ' +
    'Please use the "insert" button.';
  cTXT0000162 = 'Please select an Inventory item.';
  cTXT0000163 = 'Sales Order PO number has changed. Update Order Detail PO Info?';
  cTXT0000164 = 'AKA Revision';
  cTXT0000165 = 'AKA Description';
  cTXT0000166 = 'AKA Item #';
  cTXT0000167 = 'AKA Extended Description';
  cTXT0000168 = 'Ship To has changed, taxes will need to be recalculated.';
  cTXT0000169 = 'Changes have been made since taxes were last calculated. Recalculate now?';
  cTXT0000170 = 'Direct modification of phantom component is not allowed.  Operation aborted.';
  cTXT0000171 = 'An invoice exists against this CIA Order.  Cannot modify or delete.';
  cTXT0000172 = 'C.O.D.';
  cTXT0000173 = 'Prepaid';
  cTXT0000174 = 'On Account';
  cTXT0000175 = 'Credit Card';
  cTXT0000176 = 'A shipment exists against this CIA Order.  Cannot modify or delete.';
  cTXT0000177 = 'A cash receipt exists against this CIA Order.  Cannot modify or delete.';
  cTXT0000178 = 'This order contains ship-to addresses on the release level. A single pickticket '+
                'cannot be created for multiple ship-to addresses.';
  cTXT0000180 = 'Please select a customer.';
  cTXT0000181 = 'Please select a PO';
  cTXT0000182 = 'Please assign a Vendor.';
  cTXT0000183 = 'Please select one or more Sales Orders.';
  cTXT0000184 = 'Child of BOGO Item, cannot edit';
//  cTXT0000185 = '';
//  cTXT0000186 = '';
//  cTXT0000187 = '';
//  cTXT0000188 = '';
//  cTXT0000189 = '';
//  cTXT0000190 = '';
//  cTXT0000191 = '';
//  cTXT0000192 = '';
//  cTXT0000193 = '';
//  cTXT0000194 = '';
//  cTXT0000195 = '';
//  cTXT0000196 = '';
//  cTXT0000197 = '';
//  cTXT0000198 = '';
//  cTXT0000199 = '';
//  cTXT0000200 = '';


implementation

end.
