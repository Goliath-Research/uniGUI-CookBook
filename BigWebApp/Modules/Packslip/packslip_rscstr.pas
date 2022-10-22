unit packslip_rscstr;

interface

resourcestring

   // packslip_rscstr.cTXT0000042

   cTXT0000001 = 'Order #';
   cTXT0000002 = 'Item #/Description';
   cTXT0000003 = 'UOM';
   cTXT0000004 = 'Quantity';
   cTXT0000005 = 'Order Number %f does not exists.';
   cTXT0000006 = 'Open Orders for %s';
   cTXT0000007 = 'Accessing Packing Slips.  Please wait...';
   cTXT0000008 = 'Cannot find selected Packing Slip [ID = %.0f]';
   cTXT0000009 = 'Packing Slip # %s';
   cTXT0000010 = 'Reprint the packing slip?';
   cTXT0000011 = 'Cannot find selected customer (Customer # %s).';
   cTXT0000012 = 'Would you like shipping rate and class to be calculated for you?';
   cTXT0000013 = 'No Bill of Lading (BOL) information could be found.  No calculations were made.';
   //cTXT0000014 = 'This option calculates the shipping rate and class for all ' +
   //              'the items on the packing slip.'#13#13'Continue?';
   cTXT0000015 = 'This option calculates shipping rate and class for each item on the Packing Slip.  Continue?';
   cTXT0000016 = 'Finished calculating shipping rate and class.';
   cTXT0000017 = 'Finished calculating shipping rates and classes for all Packing Slip items.';
   cTXT0000018 = 'One or more items had no BOL information available.';
   cTXT0000019 = 'Archive this Packing Slip?';
   cTXT0000020 = 'Archive the selected Packing Slips?';
   cTXT0000021 = 'Restore this archived Packing Slip?';
   cTXT0000022 = ' VMI Packing Slip # ';
   cTXT0000023 = ' Packing Slip # ';
   cTXT0000024 = '%s (Archived) ';
   cTXT0000025 = 'This option calculates summary BOL for all items on the packing slip.'#13#13 +
                 'Continue?';
   cTXT0000026 = 'Finished calculating summary BOL.';
   cTXT0000027 = 'Please select a Freight company.';
   cTXT0000028 = 'Billing Address';
   cTXT0000029 = 'Customer Address';
   cTXT0000030 = 'Accessing BOL.  Please wait.';
   cTXT0000031 = 'Accessing Pick Tickets.  Please wait.';
   cTXT0000032 = 'For special processing: '#13'Pick items directly from production floor';
   cTXT0000033 = 'Orphaned pick ticket detail.'#13+
                 'Synchronize with Sales Orders using'#13+
                 '"Synchronize/Merge orphaned pick ticket'#13+
                 'details with SO" button or menu option.';
   cTXT0000034 = 'Accessing database.  Please wait.';
   cTXT0000035 = 'Processing pick ticket details...';
   cTXT0000036 = 'This is a MakeToOrder sales order - on fly allocation is not supported.';
   cTXT0000037 = 'This is a MakeToOrder sales order - nothing has been allocated. Operation aborted.';
   cTXT0000038 = 'This option prepares the staging list. Are you sure you want to continue?';
   cTXT0000039 = 'This option clears the staging list. Are you sure you want to continue?';
   cTXT0000040 = 'Synchronize Orphaned Pick Ticket %.0f Releases';
   cTXT0000041 = 'Append new Pick Ticket line?';
   cTXT0000042 = 'No orphaned Pick Ticket releases found.';
   cTXT0000043 = 'No available Sales Order releases found.';
   cTXT0000044 = 'Ticket %.0f, line # %.0f: mismatch detected between pick ticket releases and printed labels. Operation aborted.';
   cTXT0000045 = 'Location not associated to Shipment - Continue?' ;
   cTXT0000046 = 'Are you sure you want to archive current BOL?';
   cTXT0000047 = 'Are you sure you want to restore from archived BOL?';
   cTXT0000048 = 'Voided Packing Slip # %s';
   cTXT0000049 = 'Overshipment is cancelled - operation aborted.';
   cTXT0000050 = 'Errors detected, transaction not posted';
   cTXT0000051 = 'Phantom components cannot be split - operation aborted';
   cTXT0000052 = 'Would you like to update the Ship Date on the sales order release?';
   cTXT0000053 = 'Packing slip %s has not been verified. Would you like to continue?';
   cTXT0000054 = 'Out of %d selected packing slips, %d has not been verified. Would you like to continue?';
   cTXT0000055 = 'VMI consumption quantity is greater than the shipped quantity. Do you wish to continue?';
   cTXT0000056 = 'Voiding Packslip#%s line item %d of %d, Item #%s' ;
   cTXT0000057 = 'Voiding Packslip#%s failed!  Transaction quantity mismatch or transaction process encountered an error.  Operation aborted.';
   cTXT0000058 = 'Lot Expiration Date is Mandatory - operation aborted';
   cTXT0000059 = 'Lot Expiration Date is Mandatory, Missing Lot# - operation aborted';
   cTXT0000060 = 'Void Qty must be greater than zero';
   cTXT0000061 = 'Void Qty cannot exceed Available to Void.';
   cTXT0000062 = 'Void Qty must be equal to Consumption Qty.';
   cTXT0000063 = 'Are you sure you want to abort?';
   cTXT0000064 = 'Assign Quantity';
   cTXT0000065 = 'Unable to proceed.  Original VMI location is no longer in the system.';
   cTXT0000066 = 'The quantity entered %f does not correspond to the assigned total %f';
   cTXT0000067 = 'The sum of the picked releases quantity (%s) does not ' +
     'equal the ship quantity #%s (%s).'#13#13'Please confirm to continue.';
   cTXT0000068 = 'Please enter a lot expiration date.';
   cTXT0000069 = 'This item is part of a Ship Complete order. Are you sure you want to continue?';
   cTXT0000070 = 'Unable to convert pickticket to packslip.  Please ensure ' +
     'the pick ticket details and the associated sales order exist, and then ' +
     'try again.';
   cTXT0000071 = 'Unable to locate the pick ticket [ID = %d]';
   cTXT0000072 = 'Ticket # %d: Load Default Shipping Locations...';
   cTXT0000073 = 'Cannot convert Ticket # %d to a Packing Slip.'#13 +
     'Please check detail # %d for Relieve Inventory information such as ' +
     'location, quantity, and the like. If you are expecting to use a ' +
     'Default Shipping Designator, please verify that one is assigned.';
   cTXT0000074 = 'The pick ticket release is missing the Relieve Inventory ' +
     'quantity. Unable to continue.';
   cTXT0000075 = 'Cannot find ticket %.0f, %s = %s, Ship_To_ID = %.0f';
   cTXT0000076 = 'Processing Ticket # %d.  Please wait...';
   cTXT0000077 = 'Unable to locate the pick ticket release [ID = %d]';
   cTXT0000078 = 'Please select a location.';
   cTXT0000079 = 'Assign Quantity for %s/%s';
   cTXT0000080 = 'This is a serialized item.  In order to maintain the ' +
     'association with serial numbers, cancel here and apply using the ' +
     'right-click option for ''Serial # VMI'' in top grid of this form.';
   cTXT0000081 = 'Cannot consume directly phantom component.  Operation aborted';
   cTXT0000082 = 'Consumed quantity must be greater than 0.';
   cTXT0000083 = 'Consumed quantity must be less than or equal to VMI Non Consumed';
   cTXT0000084 = 'Please specify a VMI location.';
   cTXT0000085 =  'The original location associated with the VMI shipment is ' +
     'no longer attached to Inventory item, %s %s %s.'#13 +
     'Unable to substitute with another VMI location.  No associated VMI ' +
     'locations could be found for Customer # %s [SHIP_TO.ID = %d]';
   cTXT0000086 = 'Unable to locate Shipment Detail in history ' +
     'table.  Transaction aborted';
   cTXT0000087 = 'The original location associated with the VMI shipment ' +
     'is no longer attached to Inventory item, %s %s %s.'#13 +
     'The following substitute location was used instead: %s';
   cTXT0000088 = 'Change Unit Price';
   cTXT0000089 = 'Enter a new unit price (this will affect all VMI ' +
     'non-consumed quantities):';
   cTXT0000090 = 'Invalid number.';
   cTXT0000091 = 'Invoice # %s created';
   cTXT0000092 = 'Reference #';
   cTXT0000093 = 'Unable to establish default BOM.  Operation aborted';
   cTXT0000094 = 'Component consumed quantity must be greater than 0.';
   cTXT0000095 = 'Component consumed quantity must be less than or equal to ' +
     'VMI Consumed';
   cTXT0000096 = 'Component consumed quantity must be less than or equal to ' +
     'VMI Non Consumed';
   cTXT0000097 = 'Failed to process component, %s: %s';
   cTXT0000098 = 'Consume VMI Shipment';
   cTXT0000099 = 'Finished calculating shipping rate and class for all the ' +
     'items for the BOL.';
   cTXT0000100 = 'One or more items had no BOL information available.';
   cTXT0000101 = 'This option calculates the shipping rate and class for ' +
     'all the items for this BOL.'#13#13'Are you sure you wish to continue?';
   cTXT0000102 = 'Shipping Note';
   cTXT0000103 = 'Would you like the system to calculate the shipping rate ' +
     'and class for you?';
   cTXT0000104 = 'No BOL information is available.';
   cTXT0000105 = 'Shipping address not found.';
   cTXT0000106 = 'Distribution center not found.';
   cTXT0000107 = 'This option will override the shipment to be "Expedited".  ' +
     'It will be sent directly to the end destination. ' +
     'Please be aware that this action is irreversible.'#13#13 +
     'Are you sure you want to expedite this shipment?';
   cTXT0000108 = 'This BOL must contain exactly one final destination ' +
     'shipping address among all the packing slips in order to be ' +
     'expedited.'#13#13'The number of shipping addresses found: %d';
   cTXT0000109 = 'You are attempting to add one or more packing slips with ' +
     'multiple shipping methods (ship via).';
   cTXT0000110 = 'This option assigns a shipping address based on the ' +
     'earliest BOL packing slip. Are you sure you want to continue?';
   cTXT0000111 = 'An EDI 211 for this BOL exists.  Do you wish to create another?';
   cTXT0000112 = 'Do you wish to create an EDI 211 file?';
   cTXT0000113 = 'Division Filter:';
   cTXT0000114 = 'Division Filter: Not assigned';
   cTXT0000115 = 'Tablet is ready to capture signature for this BOL.';
   cTXT0000116 = 'Device, %s, is ready to capture signature for this BOL.';
   cTXT0000117 = 'This option relieves the associated IN-TRANSIT inventory ' +
     'for all associated packing slips. Are you sure you want to continue?';
   cTXT0000118 = 'BOL Date On/Before';
   cTXT0000119 = 'Processing %d/%d.  Please wait ...';
   cTXT0000120 = 'Finished archiving %d record(s).';
   cTXT0000121 = 'Invalid date range';
   cTXT0000122 = 'BOL Packing Slips Picklist (Ship To: %s)';
   cTXT0000123 = 'Please select a shipping address.';
   cTXT0000124 = 'No shipments found';
   cTXT0000125 = 'A device has not been selected.  Please select a device ' +
     'to use this option.';
   cTXT0000126 = 'Unable to locate release.';
   cTXT0000127 = 'The following forecast release needs an authorization: '#13#13 +
    '   Order #: %s'#13 +
    '   Item #: %s'#13 +
    '   Description: %s'#13 +
    '   Request Date: %s'#13 +
    '   Promise Date: %s'#13 +
    '   Release Quantity: %s';
   cTXT0000128 = 'A forecast release must be authorized to proceed.';
   cTXT0000129 = 'Order line includes one or more forecast releases and ' +
     'must be authorized in order to proceed.';
   cTXT0000130 = 'One of the Mandatory Columns was not entered. Do you ' +
     'still want to close the form?';
   cTXT0000131 = 'Add entire order to the packing slip based on item ' +
     'location Shipping Designator with location quantity';
   cTXT0000132 = 'Add entire order to the packing slip based on item ' +
     'location Shipping Designator with order quantity';
   cTXT0000133 = 'You are about to post a packing slip.  Continue?';
   cTXT0000134 = 'Order # %s (Row: %d), Qty is Zero. Do you wish to create a packing slip with Zero entry?';
   cTXT0000135 = 'Packing Slip Number is empty.';
   cTXT0000136 = 'Packing slip is empty.';
   cTXT0000137 = 'The packing slip is not empty.  Close anyway?';
   cTXT0000138 = 'Only one PO # per Packing Slip is allowed for this customer.';
   cTXT0000139 = 'Only one SO # per Packing Slip is allowed for this customer.';
   cTXT0000140 = 'This is a miscellaneous item. No location has been assigned.';
   cTXT0000141 = '%s is a non-material item.  No location has been assigned.';
   cTXT0000142 = 'The quantity is 0 for Order # %s.';
   cTXT0000143 = '%s is a phantom item.  No location has been assigned.';
   cTXT0000144 = 'Order # %s';
   cTXT0000145 = 'Unable to locate Sales Order.';
   cTXT0000146 = 'Unable to locate Sales Order detail.';
   cTXT0000147 = 'Record not found.';
   cTXT0000148 = 'The packing slip is not empty.  Do you wish to select all items?';
   cTXT0000149 = 'Cannot change from VMI shipping address to Non-VMI shipping address.';
   cTXT0000150 = 'Do you wish to change the shipping address in the order (Order # %s)?';
   cTXT0000151 = 'The sales order contains release-based shipping addresses and ' +
     'cannot be updated automatically.  Change the shipping address anyway?';
   cTXT0000152 =  'Overshipping sales order blanket quantity by %f.' + #13#13 +
     'Order: %s' + #13 +
     'Line : %d' + #13 +
     'Item : %s' + #13#13 +
     'Blanket Quantity: %f' + #13 +
     'Cumm Shipped: %f' + #13 +
     'This Packing Slip Quantity: %f';
   cTXT0000153 = 'Pack Slip # is generated based on EPlant = %s';
   cTXT0000154 = 'Yellow color indicates VMI shipping address';
   cTXT0000155 = 'Search by Order #';
   cTXT0000156 = 'Search by Item #';
   cTXT0000157 = 'Search by Purchase Order';
   cTXT0000158 = 'Search by Sequence #';
   cTXT0000159 = 'No sales order is selected.  Unable to continue.';
   cTXT0000160 = 'Module: Create New Packing Slip, Sales Order #: %s, Action: %s';
   cTXT0000161 = 'No details were found for the selected order.';
   cTXT0000162 = 'Misc. Item';
   cTXT0000163 = 'Billing and/or shipping addresses have changed';
   cTXT0000164 = 'Current bill-to: %s'#13'New bill-to: %s';
   cTXT0000165 = 'Current ship-to: %s'#13'New ship-to: %s';
   cTXT0000166 = 'Continue?';
   cTXT0000167 = 'The new shipping address is a VMI and the Packing slip ' +
     'will be assigned to it.  Continue?';
   cTXT0000168 = 'Cannot change from VMI to Non-VMI shipping address.  Continue?';
   cTXT0000169 = 'Customer Status Exception Authorization:';
   cTXT0000170 = 'Release # %d';
   cTXT0000171 = 'Unable to create Shipment header. Please check passed parameters and try again'#13 +
     'Shipment ID: %d'#13 +
     'BillTo ID: %d'#13 +
     'ShipTo ID: %d'#13 +
     'Order ID: %d';
   cTXT0000172 = 'Location is not provided.  Unable to create packing slip.'#13#13 +
    '[ORD_DETAIL_id:  %d, FGMULTI_ID: %d]';
   cTXT0000173 = 'Shipment detail has been posted. However, while trying to evaluate ' +
     'Shipment Details against Order Releases, the system failed because of the ' +
     'following error:';
   cTXT0000174 = 'Change release quantity based on overshipment?'#13#13 +
    'Release #: %d'#13 +
    'Requested: %s'#13 +
    'Promised: %s'#13 +
    'Release Quantity: %s'#13 +
    'Cumm Quantity: %s'#13 +
    'Cumm Ship: %s'#13#13 +
    'Increase Release by %s?';
   cTXT0000175 = 'Packing Slip # %s PO # %s';
   cTXT0000176 = 'Packing Slip # %s';
   cTXT0000177 = 'VMI Packing Slip # %s PO # %s';
   cTXT0000178 = 'VMI Packing Slip # %s';
   cTXT0000179 = 'Intercompany Transit Packing Slip # %s';
   cTXT0000180 = 'Invalid Ship-To ID %f while attempting to establish InTransit master location eplant id';
   cTXT0000181 = 'Invalid shipping address.  An EPlant has not been associated ' +
     'with the customer shipping address. Could not establish in-transit ' +
     'master location EPlant.';
   cTXT0000182 = 'Invalid shipping address.  Could not establish in-transit ' +
     'master location.';
   cTXT0000183 = 'Invalid source inventory item. Could not establish in-transit ' +
    'inventory item.';
   cTXT0000184 = 'Outsource Transit Packing Slip # %s';
   cTXT0000185 = 'Invalid shipping address.  Could not establish in-transit ' +
     'master location EPlant.';
   cTXT0000186 = 'Shipment detail has been posted. However, while trying to ' +
     'fix an exceeded release, the system failed because of the following ' +
     'error:';
   cTXT0000187 = 'Shipment exceeded credit limit';
   cTXT0000188 = 'Please select a packing slip.';
   cTXT0000189 = 'This process will archive %d packing slips.'#13#13'Do you want to continue?';
   cTXT0000190 = 'Total quantity (%f) must be equal to this shipment quantity (%f)';
   cTXT0000191 = 'Certificate of Conformance is required. The system will ' +
     'attempt to calculate and print CoC now.';
   cTXT0000192 = 'The original sales order lines have been archived or ' +
     'deleted.  The pick ticket will not be reconstructed.';
   cTXT0000193 = 'The total selected label quantity, including Pallet %s, ' +
    'exceeds the associated voided quantity of, %.6f. Switching to box labels.';
   cTXT0000194 = 'Processing Ticket # %.0f ...';
   cTXT0000195 = 'Order detail list is empty.  Unable to continue.';
   cTXT0000196 = 'Multiple Vendors and/or shipping addresses are selected.  Operation is not supported.';
   cTXT0000197 = 'Order releases list is empty.  Unable to continue.';
   cTXT0000198 = 'Pick Ticket # %.0f Picking';
   cTXT0000199 = 'Pick Ticket [Sales Orders Mode]';
   cTXT0000200 = 'Pick Ticket [Inventory Availability Mode]';
   cTXT0000201 = 'Division Filter: Null Division';
   cTXT0000202 = 'Shipping dock max pallet count: %d';
   cTXT0000203 = 'Release to stage';
   cTXT0000204 = 'Unstage';
   cTXT0000205 = 'Ticket # %.0f, Item # %s';
   cTXT0000206 = 'Error:  %s'#13 +
     'Ignore and continue processing?'#13#13 +
     'Item #: %s'#13 +
     '[Order Detail ID: %d]'#13 +
     '[Release ID: %d]';
   cTXT0000207 = 'Error:  %s'#13 +
     'Ignore and continue processing?'#13#13 +
     '[Order Detail ID: %d]'#13 +
     '[Release ID: %d]';
   cTXT0000208 = 'Please note that neither the inventory location nor production floor ' +
     'work center have been specified.';
   cTXT0000209 = 'Please note that the option, ''Prod Floor Pickup'', has been selected. ' +
     'However, no work center has been entered.';
   cTXT0000210 = 'This customer requires one (1) Purchase Order per Packing Slip. Please ' +
     'check your ticket items.  You have some items belonging to two or more different ' +
     'Purchase Orders.  Operation aborted.';
   cTXT0000211 = 'One or more pick ticket detail items have not been assigned an ' +
     'inventory location.'#13#13'Do you want to delete the ticket items that do not ' +
     'have an inventory location?';
   cTXT0000212 = 'Item # %d. %s: Shipping quantity is greater than backlog quantity';
   cTXT0000213 = 'This is a Cash In Advance order and over shipping is not allowed.';
   cTXT0000214 = 'Total:';
   cTXT0000215 = 'This is a serialized item.  You must use WMS or RF scanner.';
   cTXT0000216 = 'No pick tickets found.';
   cTXT0000217 = 'Sort by MSD, RAN # and Sales Order sequence #';
   cTXT0000218 = 'Sort by Item #';
   cTXT0000219 = 'Sort by AKA Item #';
   cTXT0000220 = 'Delete record?';
   cTXT0000221 = 'Container Volume';
   cTXT0000222 = 'Container Weight Capacity';
   cTXT0000223 = 'The assigned quantity and the associated labels total quantity do ' +
     'not match.'#13#13'Please correct the problem and try again.';
   cTXT0000224 = 'Unable to process Packslip Quick Void.  The selected Shipment was not found.';
   cTXT0000225 = 'There are labels associated to this shipment that should be ' +
     'associated to the void. Are you sure you want to void without label association?';
   cTXT0000226 = 'Please select a label record.';
   cTXT0000227 = 'Processing Serial # %s ...';
   cTXT0000228 = 'This option relieves the associated in-transit inventory. Are you sure ' +
     'you want to continue?';
   cTXT0000229 = 'Do you wish to create an invoice?';
   cTXT0000230 = 'One or more items are already in the prepost table and could not be transferred.';
   cTXT0000231 = 'One or more items have already been invoiced and could not be transferred.';
   cTXT0000232 = 'Do you want to calculate and print the Certificate of Conformance?';
   cTXT0000233 = 'Add to ICT Ticket # %d [On/Before: %s, Ship-To: %s]';
   cTXT0000234 = 'Add to Ticket # %d [On/Before: %s, Ship-To: %s]';
   cTXT0000235 = 'Date: None (all records shown)';
   cTXT0000236 = 'Date: On/before ship date';
   cTXT0000237 = 'None (all records shown)';
   cTXT0000238 = 'You are about to print batch of labels. Do you want to continue?';
   cTXT0000239 = 'Processing.  Please wait.';
   cTXT0000240 = 'Processing # %d, Item # %s...';
   cTXT0000241 = 'Please assign a MFG #.';
   cTXT0000242 = 'Please assign packaging.';
   cTXT0000243 = 'Please select a record.';
   cTXT0000244 = 'Are you sure you want to calculate all the labels quantities?';
   cTXT0000245 = 'Unable to void packing slip.  There are shipped packages for this ' +
     'shipment. Please archive the packing slip instead of deleting it.';
   cTXT0000246 = 'Do you want to archive this Packing Slip?';
   cTXT0000247 = 'IIS Server settings have not been configured in System Parameters.  ' +
     'Cannot display page.';
   cTXT0000248 = 'Archived';
   cTXT0000249 = 'Active';
   cTXT0000250 = '';
   cTXT0000251 = '';
   cTXT0000252 = '';
   cTXT0000253 = '';
   cTXT0000254 = '';
//   cTXT0000255 = '';
//   cTXT0000256 = '';
//   cTXT0000257 = '';
//   cTXT0000258 = '';
//   cTXT0000259 = '';
//   cTXT0000260 = '';
//   cTXT0000261 = '';
//   cTXT0000262 = '';
//   cTXT0000263 = '';
//   cTXT0000264 = '';
//   cTXT0000265 = '';
//   cTXT0000266 = '';
//   cTXT0000267 = '';
//   cTXT0000268 = '';
//   cTXT0000269 = '';
//   cTXT0000270 = '';
//   cTXT0000271 = '';
//   cTXT0000272 = '';
//   cTXT0000273 = '';
//   cTXT0000274 = '';
//   cTXT0000275 = '';
//   cTXT0000276 = '';
//   cTXT0000277 = '';
//   cTXT0000278 = '';
//   cTXT0000279 = '';
//   cTXT0000280 = '';
//   cTXT0000281 = '';
//   cTXT0000282 = '';
//   cTXT0000283 = '';
//   cTXT0000284 = '';
//   cTXT0000285 = '';
//   cTXT0000286 = '';
//   cTXT0000287 = '';
//   cTXT0000288 = '';
//   cTXT0000289 = '';
//   cTXT0000290 = '';
//   cTXT0000291 = '';
//   cTXT0000292 = '';
//   cTXT0000293 = '';
//   cTXT0000294 = '';
//   cTXT0000295 = '';
//   cTXT0000296 = '';
//   cTXT0000297 = '';
//   cTXT0000298 = '';
//   cTXT0000299 = '';
//   cTXT0000300 = '';
//   cTXT0000301 = '';
//   cTXT0000302 = '';
//   cTXT0000303 = '';
//   cTXT0000304 = '';
//   cTXT0000305 = '';
//   cTXT0000306 = '';
//   cTXT0000307 = '';
//   cTXT0000308 = '';
//   cTXT0000309 = '';
//   cTXT0000310 = '';
//   cTXT0000311 = '';
//   cTXT0000312 = '';
//   cTXT0000313 = '';
//   cTXT0000314 = '';
//   cTXT0000315 = '';
//   cTXT0000316 = '';
//   cTXT0000317 = '';
//   cTXT0000318 = '';
//   cTXT0000319 = '';
//   cTXT0000320 = '';
//   cTXT0000321 = '';
//   cTXT0000322 = '';
//   cTXT0000323 = '';
//   cTXT0000324 = '';
//   cTXT0000325 = '';
//   cTXT0000326 = '';
//   cTXT0000327 = '';
//   cTXT0000328 = '';
//   cTXT0000329 = '';
//   cTXT0000330 = '';
//   cTXT0000331 = '';
//   cTXT0000332 = '';
//   cTXT0000333 = '';
//   cTXT0000334 = '';
//   cTXT0000335 = '';
//   cTXT0000336 = '';
//   cTXT0000337 = '';
//   cTXT0000338 = '';
//   cTXT0000339 = '';
//   cTXT0000340 = '';
//   cTXT0000341 = '';
//   cTXT0000342 = '';
//   cTXT0000343 = '';
//   cTXT0000344 = '';
//   cTXT0000345 = '';
//   cTXT0000346 = '';
//   cTXT0000347 = '';
//   cTXT0000348 = '';
//   cTXT0000349 = '';
//   cTXT0000350 = '';
//   cTXT0000351 = '';
//   cTXT0000352 = '';
//   cTXT0000353 = '';
//   cTXT0000354 = '';
//   cTXT0000355 = '';
//   cTXT0000356 = '';
//   cTXT0000357 = '';
//   cTXT0000358 = '';
//   cTXT0000359 = '';
//   cTXT0000360 = '';
//   cTXT0000361 = '';
//   cTXT0000362 = '';
//   cTXT0000363 = '';
//   cTXT0000364 = '';
//   cTXT0000365 = '';
//   cTXT0000366 = '';
//   cTXT0000367 = '';
//   cTXT0000368 = '';
//   cTXT0000369 = '';
//   cTXT0000370 = '';
//   cTXT0000371 = '';
//   cTXT0000372 = '';
//   cTXT0000373 = '';
//   cTXT0000374 = '';
//   cTXT0000375 = '';
//   cTXT0000376 = '';
//   cTXT0000377 = '';
//   cTXT0000378 = '';
//   cTXT0000379 = '';
//   cTXT0000380 = '';
//   cTXT0000381 = '';
//   cTXT0000382 = '';
//   cTXT0000383 = '';
//   cTXT0000384 = '';
//   cTXT0000385 = '';
//   cTXT0000386 = '';
//   cTXT0000387 = '';
//   cTXT0000388 = '';
//   cTXT0000389 = '';
//   cTXT0000390 = '';
//   cTXT0000391 = '';
//   cTXT0000392 = '';
//   cTXT0000393 = '';
//   cTXT0000394 = '';
//   cTXT0000395 = '';
//   cTXT0000396 = '';
//   cTXT0000397 = '';
//   cTXT0000398 = '';
//   cTXT0000399 = '';
//   cTXT0000400 = '';




implementation

end.
