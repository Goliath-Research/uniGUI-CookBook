unit inv_rscstr;

interface

resourcestring

   // inv_rscstr.cTXT0000078

   cTXT0000001 = 'Cancel Changes?';
   cTXT0000002 = 'Sum of Split-Mfg percentage must equal 100%';
   cTXT0000003 = 'This item is associated with blend operation # %s. Please delete blend operation first.';
   cTXT0000004 = 'There are locations with non-zero quantities for this inventory item.';
   cTXT0000005 = 'Inventory item %s is associated with existing BOM # %s.  Cannot delete.'; 
   cTXT0000006 = 'Auto-MRP quantity to manufacture must be greater than the manufacturing order point.'; 
   cTXT0000007 = 'Please enter a class.'; 
   cTXT0000008 = 'The Commission percentage  specified by the user (%f%%) does not equal the total commissions in the %s';
   cTXT0000009 = 'You have assigned commission percentage without selecting the commission group or person.';
   cTXT0000010 = 'This is an inherited or calculated cost element.'#13 +
                 'Any changes will not be included in higher level item cost element calculation.'#13#13 +
                 'Cost element: %s'#13#13'Are you sure you want to continue?';
   cTXT0000011 = 'Net change of %.6f will be propagated to all consuming items.'#13+
                 'Extra cost will be added to BOMs consuming this item as a primary material and requesting start-up material being added to the std cost calculations.'#13#13+
                 'For standard costing, changes made here will not update the general ledger. '+
                 'Perpetual inventory and GL may become out of balance.'#13#13+
                 'Are you sure you want to continue?';
   cTXT0000012 = 'All forecast releases for this item will be deleted. Are you sure you wish to continue?';
   cTXT0000013 = 'Warehouse';
   cTXT0000014 = 'Division';
   cTXT0000015 = 'Application Error:  Master Inventory is inactive.';
   cTXT0000016 = 'Application Error:  Master Inventory is unvailable.';
   cTXT0000017 = 'This is a non-material item. Inventory transactions are not allowed.'; 
   cTXT0000018 = 'Cannot edit. The commission group contains more than one salesperson.'; 
   cTXT0000019 = 'This inventory item is not among the projected material requirements.';
   cTXT0000020 = 'Edit Item Information'; 
//   cTXT0000021 = '';
//   cTXT0000022 = '';
   cTXT0000023 = 'Commodity must be specified';
   cTXT0000024 = 'Manufacturing Order Point must be greater than 0';
   cTXT0000025 = 'Quantity to manufacture must be greater than 0';
   cTXT0000026 = 'Please select a Division.';
   cTXT0000027 = 'Manufacturing Safety Stock is greater than 0. Auto-MRP Safety Stock is disabled.';
   cTXT0000028 = 'Save changes?';
   cTXT0000029 = 'No class found';
   cTXT0000030 = 'Archived Cost Elements for %s'; 
   cTXT0000031 = 'Class';
   cTXT0000032 = 'Item #';
   cTXT0000033 = 'Description';
   cTXT0000034 = 'Rev';
   cTXT0000035 = 'EPlant ID';
   cTXT0000036 = 'Level';
   cTXT0000037 = 'About to recalculate and roll over cost elements of all the items involved or affected by, %s, or its consumed items.'#13#13+
                 'Continue?';
   cTXT0000038 = 'Cannot find Inventory Item [ARINVT_ID=%.0f]'; 
   cTXT0000039 = ' Items Involved (%d) '; 
   cTXT0000040 = 'Calculating future cost of %s ...';
   cTXT0000041 = 'Updating standard cost of %s ...';
   cTXT0000042 = 'Calculating future cost of %s ...';
   cTXT0000043 = 'Item #: %s (%d)'#13'Number of parents: %d';
   cTXT0000044 = 'Clear the Forecast code(s) from the selected inventory items?';
   cTXT0000045 = 'Assign the code, %s, to the selected inventory items?'; 
   cTXT0000046 = 'About to recalculate standard cost of %s and store it temporarily for your review.'+
                 #13#13+'Recalculate now?';
   cTXT0000047 = 'Calculating %s...';
   cTXT0000048 = 'This option recalculates the standard cost of all manufactured and blend inventory items.'#13#13'Continue?';
   cTXT0000049 = 'Calculation of Finished Good item standard cost completed.'; // 'Finished Goods items standard cost recalculation is finished';
   cTXT0000050 = 'This option rolls over (copies) future cost to master inventory standard cost'#13#13+
                 'Continue?';
   cTXT0000051 = 'This option rolls over (copies) future cost to master inventory standard cost for all the items with future cost filled in.'#13#13+
                 'Note that no dependencies are going to be checked during this process. '+
                 'Continue?';
   cTXT0000052 = 'Processing %s';
   cTXT0000053 = 'Cannot find item, %s. Please check the filter and try again'; 
   cTXT0000054 = 'Filter: %s';
   cTXT0000055 = 'Filter: Manufactured Items';
   cTXT0000056 = 'Filter: Purchased Items';
   cTXT0000057 = 'Filter: None';
   cTXT0000058 = 'This option copies Future Cost Elements to the archive table for reporting purposes. Continue?';
   cTXT0000059 = 'Future Cost Elements are copied successfully';
   cTXT0000060 = 'This option clears future cost for ALL items.'#13#13' This action is irreversible.'#13#13'Abort now?';
   cTXT0000061 = 'Last chance!'#13'Are you sure you wish to clear future costs for ALL items?';
   cTXT0000062 = 'Future cost was cleared for all the items';
   cTXT0000063 = 'Cannot populate future cost with last receipt cost for manufactured item.';
   cTXT0000064 = 'Update completed.';
   cTXT0000065 = 'Processing Item #, %s';
   cTXT0000066 = 'No records found in TRANSLOG for this item';
   cTXT0000067 = 'No Acutal Cost found in TRANSLOG';
   cTXT0000068 = 'No Cost Element found in TRANSLOG';
   cTXT0000069 = 'Clone Inventory Item [ ID = %.0f ]';
   cTXT0000070 = 'Please enter an item number.';
   cTXT0000071 = 'Please enter values before attempting to save this record.';
   cTXT0000072 = '%s Costed BOM';
   cTXT0000073 = 'The following Jobshop Projects use this item';
   cTXT0000074 = 'Archived';
   cTXT0000075 = 'Not Archived';
   cTXT0000076 = 'Item or BOM belongs to a JobShop project.  Cannot change field, Inactive.';
   cTXT0000077 = 'You must use the Archive or Restore option in the JobShop Project module to alter the status of this item.';
   cTXT0000078 = 'Image of %s';
   cTXT0000079 = 'There is no image to save.';
   cTXT0000080 = 'Please enter a Master Specification.';
   cTXT0000081 = 'A Master Specification is already assigned to this item.'; 
   cTXT0000082 = 'Item Specification for %s (%s)';
   cTXT0000083 = 'Sorted by';
   cTXT0000084 = 'Please select a record.';
   cTXT0000085 = 'Please select a GL account.';
   cTXT0000086 = 'Please select an Inventory account.';
   cTXT0000087 = 'Some Inventory accounts were not assigned because they belong to non-manufactured items.'; 
   cTXT0000088 = 'Some Production Variance accounts were not assigned because they belong to non-manufactured items'; 
   cTXT0000089 = 'Done';
   cTXT0000090 = 'Please note that a Quantity Per value has already been entered. It will be ignored and the existing Quantity Per on each BOM will be used instead.'; 
   cTXT0000091 = 'Invalid date range';
   cTXT0000092 = 'Please select a Vendor.';
   cTXT0000093 = 'Please select a Customer.'; 
   cTXT0000094 = 'Any';
   cTXT0000095 = 'Purchased';
   cTXT0000096 = 'Manufactured';
   cTXT0000097 = 'Current';
   cTXT0000098 = 'Archived';
   cTXT0000099 = 'Open';
   cTXT0000100 = 'Closed';
   cTXT0000101 = 'Current Filter: '#13+
                 '     Item Type: %s'#13+
                 '     Source: %s'#13+
                 '     Period: %s - %s'#13+
                 '     PO Status: %s'#13+
                 '     Vendor: %s'#13+
                 '     Customer: %s';
   cTXT0000102 = 'Show All';
   cTXT0000103 = 'Items attached to this location will now be assigned to the specified division and warehouse.'#13#13+
                 'Continue?';
   cTXT0000104 = 'Cannot have location marked both VMI and TRANSIT at the same time.';
   cTXT0000105 = 'Cannot have two locations marked TRANSIT for same EPlant or Division.'; 
   cTXT0000106 = 'On Hand';
   cTXT0000107 = 'Regrind On Hand';
   cTXT0000108 = 'EPlant Name';
   cTXT0000109 = 'Item #: %s';
   cTXT0000110 = 'Update current sales orders price to %.6f';
   cTXT0000111 = 'Update marked sales order(s) price?';
   cTXT0000112 = 'Please select one or more records.'; 
   cTXT0000113 = 'Sales orders updated successfully.';
   cTXT0000114 = 'Cannot find Order detail item [ID=%.0f]'; 
   cTXT0000115 = 'Processing Sales Order # %s...'; 
   cTXT0000116 = 'Blend item class must be PL';
   cTXT0000117 = 'PL item Unit must be LBS, GR, KG or OZ';
   cTXT0000118 = 'Skid # %s Contents'; 
   cTXT0000119 = 'Divide:'#13+
                 '   Factor of custom UOM = 1 of native UOM. This is a default.'#13+
                 'Multiply:'#13+
                 '   1 of custom UOM = Factor of native UOM';
   cTXT0000120 = 'Only one OE default allowed';
   cTXT0000121 = 'Only one PO default allowed';
   cTXT0000122 = // 'The following changes will be applied to all selected configuration. Please confirm:'#13#13 +
                 'Mode: '#13             +
                 '   %s '#13             +
                 'Item: '#13             +
                 '%s '#13                +
                 'New Items(s):'#13      +
                 '%s';
   cTXT0000123 = 'Replacement list is empty. Operation aborted';
   cTXT0000124 = 'Where %s is Used';
   cTXT0000125 = 'KGS/K Cycles';
   cTXT0000126 = 'Cannot drill down.  Please select an Inventory item.'; 
   cTXT0000127 = 'Processing %s...';
   cTXT0000128 = 'Where Used Work Orders [MFG # %s]';
   cTXT0000129 = 'Where Used All Work Orders [Item # %s]';
   cTXT0000130 = 'On Hand [Item ID = %.0f]';
   cTXT0000131 = '''Kanban Lot Size'' is not a multiple of ''Multiples Of''.';
   
   cTXT0000132 = 'Unable to set ''Mandatory Lot #'' flag. Some existing location(s) lot # is not assigned - unable to continue.'; 
   cTXT0000133 = 'Unable to set ''Serialized Inventory Control'' flag. Some existing location(s) has on-hand qty - unable to continue.'; 
   
   cTXT0000134 = 'User Defined Form Information';
   cTXT0000135 = 'Include';
   
   cTXT0000136 = 'Sheet UOM must be in EACH'; 
   cTXT0000137 = 'Accessing Master Inventory.  Please wait.';
   cTXT0000138 = 'Accessing database.  Please wait.';
   //cTXT0000139 = 'Please note this item is consumed in BOM configuration(s). '#13+
   //              'Changes made to inventory UOM must be propagated to the BOM configuation. '#13#13+
   //              'If you continue you will be prompted to update each individual BOM consuming this item. Are you sure you want to continue?';

   cTXT0000139 = 'Please note this item is consumed in the following modules: ';
   cTXT0000140 = 'BOM Configuration';
   cTXT0000141 = 'Sales Orders';
   cTXT0000142 = 'Purchase Orders';

   cTXT0000143 = 'Changes made to inventory UOM must be propagated to the BOM Configuration, Sales Orders and Purchase Orders.'#13+
                 'If you continue you will be prompted to update each individual BOM consuming this item. Sales and Purchase Orders need to be revised manually.'#13#13+
                 'Are you sure you want to continue?';

   cTXT0000144 = 'Some WIP accounts were not assigned because they belong to non-manufactured items.';
   cTXT0000145 = 'This option recalculates the budget cost of all manufactured and blend inventory items.'#13#13'Continue?';
   cTXT0000146 = 'This option recalculates the forecast cost of all manufactured and blend inventory items.'#13#13'Continue?';
   cTXT0000147 = 'Calculation of Finished Good items budget cost completed.'; // 'Finished Goods items standard cost recalculation is finished';
   cTXT0000148 = 'Calculation of Finished Good items forecast cost completed.'; // 'Finished Goods items standard cost recalculation is finished';
   cTXT0000149 = 'Click to hide inactive vendors';
   cTXT0000150 = 'Inactive Vendors hidden, click to show';
   cTXT0000151 = 'Click to hide inactive customers';
   cTXT0000152 = 'Inactive Customers hidden, click to show';
   cTXT0000153 = 'No AKA selected, cannot clone.';
   cTXT0000154 = 'Do you wish to clone marked records?';
   cTXT0000155 = 'No records selected.';
   cTXT0000156 = 'Records cloned.';
   cTXT0000157 = 'Edit Comment';
   cTXT0000158 = 'The current GL period is unavailable. Please assign a GL period';
   cTXT0000159 = 'A quantity and record(s) selection is required to continue; either select checkbox to ''Use Existing Qty Per'' or enter value in ''Qty Per'' column.';
   cTXT0000160 = 'AKA Selling must be assigned - operation aborted';
   cTXT0000161 = 'AKA Buying must be assigned - operation aborted';
   cTXT0000162 = 'Nothing is selected - operation aborted';
   cTXT0000163 = '''Where Used'' mass replace';
   cTXT0000164 = 'Effective Date';
   cTXT0000165 = 'This item is associated with a process/operation.'#13#13+
                 'Remove the item from the process/operation and try again:'#13+
                 'Process/Operation #: %s'#13+
                 'Description: %s'#13 +
                 'Class: %s';
   cTXT0000166 = 'If "Disable adjustment for Unposted PIT" option is checked, then rolling of temporary costs should not continue if Disposition and Shipping transactions in PIT have not been made into General Journal entries.'#13+
                 'Do you wish to continue?';
   cTXT0000167 = 'Roll To Standard not confirmed.';
   cTXT0000168 = 'Allowed precision is between 1 and 6.';
   cTXT0000169 = 'Remove this item from the group?';
   cTXT0000170 = 'No item selected - operation aborted.';
   cTXT0000171 = 'View/Edit Configuration Choices';
   cTXT0000172 = 'Do you wish to propagate checkboxes to the selected items additional tab?';
   cTXT0000173 = 'Element already assigned to the group.';
   cTXT0000174 = 'Sequential Where Used View: %s';
   cTXT0000175 = 'Every Transaction Rank % must be assigned and the total must equal 100.';
   cTXT0000176 = 'Every Defined Amount must be assigned';
   cTXT0000177 = 'Are you sure you want to load default transaction types?';
   cTXT0000178 = 'Invalid date or date range.';
   cTXT0000179 = 'No transaction types selected - operation aborted';
   cTXT0000180 = 'No locations found with non zero onhand qty - unable to change location status.';
   cTXT0000181 = 'Unable to change location ''%s'' status.';
   cTXT0000182 = 'Remove ''%s'' from selected ''%s''?';
   cTXT0000183 = 'This location is associated to MRO, do you wish to continue?';
   cTXT0000184 = 'IIS Server settings have not been configured in System Parameters.  Cannot display page.';
   cTXT0000185 = 'Unapproved Purchase Orders exist for this inventory item. Do you wish to update the standard cost on these Purchase Orders?'; 
   cTXT0000186 = 'Roll To Standard not confirmed';
   cTXT0000187 = 'Are you sure you want to reserve the plan?';
   cTXT0000188 = 'Are you sure you want to un-reserve the plan?';
   cTXT0000189 = '%s Class Dimensional Inventory / Characteristics';
   cTXT0000190 = 'Load Default Dimensional Inventory / Characteristics?';
   cTXT0000191 = 'Are you sure you want to delete Inventory Item %s';
   cTXT0000192 = 'Landed Cost type element cannot be the only cost element associated with the item. Add another cost element type and mark it default.';
   cTXT0000193 = 'Missing default cost element type - operation aborted.';
   cTXT0000194 = 'Landed Cost type element cannot be marked as default - operation aborted.';
   cTXT0000195 = 'Please Assign Location';
   cTXT0000196 = 'Please Assign Parent Record';
   cTXT0000197 = 'Cannot assign the same VMI location to the same vendor more than once.';
   cTXT0000198 = 'Cannot assign the same VMI location to multiple vendors.';
   cTXT0000199 = 'Volume';
   cTXT0000200 = 'Loose Weight';
   cTXT0000201 = 'This option rolls over (copies) future cost to master inventory standard cost for all the items with future cost filled in calculated by ''%s''.'#13#13+
                 'Note that no dependencies are going to be checked during this process. '+
                 'Continue?';
   cTXT0000202 = 'This VMI location is already assigned';
   cTXT0000203 = 'Please select a currency when adding Price Breaks';
   cTXT0000204 = 'Inventory Summary [ %s ]';
   cTXT0000205 = 'Location %s is currently attached to item(s) in ' +
     'Transactions and Locations.  Continue?';
   cTXT0000206 = 'Location %s will no longer be marked as a Receive ' +
     'Designator.  Continue?';
   cTXT0000207 = 'Would you like to remove dependencies when inventory item is changed?';
   cTXT0000208 = 'Success!  No errors found.';
   cTXT0000209 = 'Are you sure you would like to stage/pick up this material for WO# %.0f?';
   cTXT0000210 = 'This serial number is scanned to pickticket - operation aborted.';
   cTXT0000211 = 'Please enter a three-character code.';
   cTXT0000212 = 'Child record found.  Engineering Quote # = %s';
   cTXT0000213 = 'Child record found.  Production Code = %s';
   cTXT0000214 = 'Child record found.  Inventory Item # = %s';
   cTXT0000215 = 'Child record found.  MFG # = %s';
   cTXT0000216 = 'Child record found.  PO # = %s';
   cTXT0000217 = 'Child record found.  Quote Inventory Item # = %s';
   cTXT0000218 = 'Child record found in Inventory UOM Conversion tables.';
   cTXT0000219 = 'Recalculating items associated with user name...';
   cTXT0000221 = 'This option rolls over (copies) future cost to master inventory standard cost for all the items with future cost filled in calculated by ''%s''.'#13#13+
                 'Note consuming items are going to be recalculated and rolled over during this process. '+
                 'Continue?';
   cTXT0000222 = 'Processing, please wait... (%d/%d)';
//   cTXT0000223 = '';
//   cTXT0000224 = '';
//   cTXT0000225 = '';
//   cTXT0000226 = '';
//   cTXT0000227 = '';
//   cTXT0000228 = '';
//   cTXT0000229 = '';
//   cTXT0000230 = '';
//   cTXT0000231 = '';
//   cTXT0000232 = '';
//   cTXT0000233 = '';
//   cTXT0000234 = '';
//   cTXT0000235 = '';
//   cTXT0000236 = '';
//   cTXT0000237 = '';
//   cTXT0000238 = '';
//   cTXT0000239 = '';
//   cTXT0000240 = '';
//   cTXT0000241 = '';
//   cTXT0000242 = '';
//   cTXT0000243 = '';
//   cTXT0000244 = '';
//   cTXT0000245 = '';
//   cTXT0000246 = '';
//   cTXT0000247 = '';
//   cTXT0000248 = '';
//   cTXT0000249 = '';
//   cTXT0000250 = '';
//   cTXT0000251 = '';
//   cTXT0000252 = '';
//   cTXT0000253 = '';
//   cTXT0000254 = '';
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


implementation

end.
