unit shopdata_rscstr;

interface

// shopdata_rscstr.cTXT0000126

resourcestring

   cTXT0000001 = 'Error';
   cTXT0000002 = 'Information';
   cTXT0000003 = 'Confirm';
   cTXT0000004 = 'Internal Documents for BOM';
   cTXT0000005 = 'Internal Documents for Inventory';
   cTXT0000006 = 'Internal Documents for Customer';
   cTXT0000007 = 'External Documents for BOM';
   cTXT0000008 = 'External Documents for Inventory';
   cTXT0000009 = 'External Documents for Customer';
   cTXT0000010 = 'Exit ShopData?';
   cTXT0000011 = 'Exit ShopData';
   cTXT0000012 = 'Quantity';
   cTXT0000013 = 'Reason';
   cTXT0000014 = 'The quantity you entered (%f) will be rounded to the nearest whole value.  ' +
                 'Do you wish to continue and apply %d instead?';
   cTXT0000015 = 'Delete current reject?';
   cTXT0000016 = 'Could not find item.  DataSource was unassigned.';
   cTXT0000017 = 'Delete location from list?';
   cTXT0000018 = 'Exit without saving changes?';
   cTXT0000019 = 'Clear selected work center?';
   cTXT0000020 = 'Quantity is zero.  Do you wish to continue?';
   cTXT0000021 = 'Delete record?';
   cTXT0000022 = 'Please enter a valid quantity.';
   cTXT0000023 = 'Last change has not been saved. Save now?';
   cTXT0000024 = 'There are no registered work centers.  ' +
                 'Create work center entries in EnterpriseIQ Work Centers.'#13 +
                 'Access to ShopData modules cannot be granted.';
   cTXT0000025 = 'Accessing Downtime data.  Please wait.';
   cTXT0000026 = 'Accessing Rejects data.  Please wait.';
   cTXT0000027 = 'Accessing RealTime data.  Please wait.';
   cTXT0000028 = 'Accessing Floor Disposition data.  Please wait.';
   cTXT0000029 = 'Accessing Label Matrix data.  Please wait.';
   cTXT0000030 = 'Accessing Time Clock.  Please wait.';
   cTXT0000031 = 'Processing.  Please wait.';
   cTXT0000032 = 'Closing active module';
   cTXT0000033 = 'Backflush is ON under the following conditions: '#13+
                 '- Work center is connected to RT Server'#13+
                 '- RealTime Server is not signaled'#13+
                 '- Floor backflush is checked';
   cTXT0000034 = 'Current'#13'Lot #';
   cTXT0000035 = '<No Item Selected>';
   cTXT0000036 = 'RT Quick Reject Entry for Machine # %s';
   cTXT0000037 = 'Show Module Toolbar';
   cTXT0000038 = 'Show Module Toolbar (Currently Hidden)';
   cTXT0000039 = 'Hide Module Toolbar';
   cTXT0000040 = 'Include All';
   cTXT0000041 = 'Print Labels for %s';
   cTXT0000042 = 'Accessing MRO.  Please wait.';
   cTXT0000043 = 'Cannot determine current production date and shift.';
   cTXT0000044 = 'A MRO record has not been created or associated with this work center.';
   cTXT0000045 = 'Could not find work center.';
   cTXT0000046 = 'Please note: %s is not directly ordered item. It is required to satisfy sales order %s';
   cTXT0000047 = 'Not a Finish Goods item.';
   cTXT0000048 = 'Location not provided.  Operation aborted.';
   cTXT0000049 = 'Search Work Centers'#13'Work Centers must be connected to RealTime.';
   cTXT0000050 = 'Work Center:  %s %s';
   cTXT0000051 = 'Type: %s';
   cTXT0000052 = 'Manufacturing Type: %s';
   cTXT0000053 = 'Manufacturing Cell: %s';
   cTXT0000054 = 'Capacity: %s';
   cTXT0000055 = 'The Windows Task Bar options are currently set so it will overlap the ShopData window.  ' +
     'To correct this, either set the AutoHide option or unset the Always On Top option.';
   cTXT0000056 = 'Processing.  Please wait.';
   cTXT0000057 = 'Please enter a valid number.';
   cTXT0000058 = '(None)';
   cTXT0000059 = 'Cavity is zero.  Do you wish to continue?';
   cTXT0000060 = 'Enter Lot #';
   cTXT0000061 = 'Please select an item before entering a quantity.';
   cTXT0000062 = 'Please enter a valid number for quantity.';
   cTXT0000063 = 'Please enter a valid number for quantity.';
   cTXT0000064 = 'Is Virtual: %s';
   cTXT0000065 = 'Yes';
   cTXT0000066 = 'No';
   cTXT0000067 = 'There are no labels selected.  Please select a label.';
   cTXT0000068 = 'The selected labels must have the same lot number.  Cannot continue.';
   cTXT0000069 = 'Please select a location.';
   cTXT0000070 = 'Application Error:  Could not apply Location to selected inventory item ' +
        'because the Inventory Item was not supplied.';
   cTXT0000071 = 'Exit without processing the rejects?'; 
   cTXT0000072 = 'Rejects Reason'; 
   cTXT0000073 = 'Unable to report rejects.  Selected operation has no attached components.'; 
   cTXT0000074 = 'Some rejects records are missing either quantity and/or reject code.'; 
   cTXT0000075 = 'Please enter a Reject Code.'; 
   cTXT0000076 = 'No operation selected.  Cannot continue.'; 
   cTXT0000077 = 'Cut-Off Operation: %s, %s'; 
   cTXT0000078 = 'Rejected Item #: %s %s [%s]'; 
   cTXT0000079 = 'Rejected Quantity: %f'; 
   cTXT0000080 = 'No rejects are entered.'; 
   cTXT0000081 = 'Exit without processing the rejects?';
   cTXT0000082 = 'Reject Reason'; 
   cTXT0000083 = 'Unable to report rejects.  Selected operation has no attached components.'; 
   cTXT0000084 = 'No rejects have been entered.  Please enter rejects.'; 
   cTXT0000085 = 'Some reject records are missing either quantity and/or reject code.'; 
   cTXT0000086 = 'Please enter a Reject Quantity.';
   cTXT0000087 = 'Please enter a Reject Code.';
   cTXT0000088 = 'Please enter both a Reject Quantity and a Reject Code.';
   cTXT0000089 = 'Delete record?';
   cTXT0000090 = 'No operation selected.  Cannot continue.' ;
   cTXT0000091 = 'Cut-Off Operation: %s, %s';
   cTXT0000092 = 'Rejected Item #: %s %s [%s]';
   cTXT0000093 = 'Rejected Quantity: %f';
   cTXT0000094 = '<no default transaction code selected>';
   cTXT0000095 = '<no default work center selected>';
   cTXT0000096 = 'Clear the default component reject transaction code?';
   cTXT0000097 = 'Internal Documents for Work Center';
   cTXT0000098 = 'External Documents for Work Center'; 
   cTXT0000099 = 'Do you want to make this location a Disposition designated location?';
   cTXT0000100 = 'To continue running ShopData you must be logged onto a ' +
    'database. Would you like to login now?';
   cTXT0000101 = 'All ShopData forms must be closed before attempting to ' +
    'login. Please try again.';
   cTXT0000102 = 'IIS Server settings have not ' +
    'been configured in System Parameters.  Cannot ' +
    'display page.';
   cTXT0000103 = 'Clear default Quick Inspection source?';
   cTXT0000104 = 'Parts';
   cTXT0000105 = 'Processes';
   cTXT0000106 = 'Work Centers';
   cTXT0000107 = '<None>'; 
   cTXT0000108 = 'Show MRO Equipment for Work Center only?  If you select No, ' +
     'MRO will be shown for BOM Equipment.';
   cTXT0000109 = 'Transaction Code must be entered.'; 
   cTXT0000110 = 'Delete location?'; 
   cTXT0000111 = 'The pallet label is currently being dispositioned.  Do you want to continue?';
   cTXT0000112 = 'Invalid serial number.';
   cTXT0000113 = 'The label is marked as shipped.';
   cTXT0000114 = 'The quantity is zero (0).  Do you want to assign the default quantity?';
   cTXT0000115 = 'You are attempting to disposition more than has been ' +
    'produced.  Do you want to continue?';
   cTXT0000116 = 'Lot number is mandatory.  You will be now prompted to ' +
    'enter a lot number.';
   cTXT0000117 = 'Lot number is mandatory.  Operation aborted.';
   cTXT0000118 = 'Enter Lot #'; 
   cTXT0000119 = 'Selected:  %d';
   cTXT0000120 = 'Your current selection will be cleared.  Do you want to continue?'; 
   cTXT0000121 = 'Clear Location?'; 
   cTXT0000122 = 'A Target location has not been selected. Process aborted.';
   cTXT0000123 = 'Cannot move to same location.';
   cTXT0000124 = 'Please select one or more labels.';
   cTXT0000125 = 'The selected labels must all have the same lot number.  Cannot continue.';
   cTXT0000126 = 'Downtime Comment';
   cTXT0000127 = 'Backflush Materials: ON';
   cTXT0000128 = 'Backflush Materials: OFF';
   cTXT0000129 = 'Materials Involved [Hard Alloc Based]';
   cTXT0000130 = 'Materials Involved [BOM Based]';

   cTXT0000131 = 'Time Clock';
   cTXT0000132 = 'RT Scan to Inventory';
   cTXT0000133 = 'Floor Disposition';
   cTXT0000134 = 'Pallet Builder';
   cTXT0000135 = 'RT Work Center';
   cTXT0000136 = 'RT Monitor';
   cTXT0000137 = 'Process Monitor';
   cTXT0000138 = 'Plant Layout';
   cTXT0000139 = 'Inventory Transactions and Locations';
   cTXT0000140 = 'Work Order Materials && Components';
   cTXT0000141 = 'Kanban Supermarket';
   cTXT0000142 = 'Heijunka Box Load Leveling';
   cTXT0000143 = 'Rejects';
   cTXT0000144 = 'Reject Reporting';
   cTXT0000145 = 'Downtime';
   cTXT0000146 = 'Internal Documents';
   cTXT0000147 = 'External Documents';
   cTXT0000148 = 'Print RealTime Labels';
   cTXT0000149 = 'Print Sales Order Labels';
   cTXT0000150 = 'Print Inventory Labels';
   cTXT0000151 = 'Serial # Tracking';
   cTXT0000152 = 'Quick Inspection';
   cTXT0000153 = 'MRO Work Order';
   cTXT0000154 = 'Submit an Announcement';
   cTXT0000155 = 'Popup Form Timer Interval Setup';
   cTXT0000156 = 'Configure ShopData';
   cTXT0000157 = 'Dialog Check Boxes';
   cTXT0000158 = 'Login';
   cTXT0000159 = 'Login into Enterprise Plant';
   cTXT0000160 = 'Security Inspector';
   cTXT0000161 = 'Help Contents';
   cTXT0000162 = 'Knowledge Center';
   cTXT0000163 = 'Wiki/SOP';
   cTXT0000164 = 'About';
   cTXT0000165 = 'Who is Logged In';
   cTXT0000166 = 'Unable to add itself to the consumed items list - operation aborted.'; 
   cTXT0000167 = 'Report Production By Work Order';
   cTXT0000168 = 'Select from Labels Linked to Location';
   cTXT0000169 = 'Select from Labels Linked to Inventory Item';
   cTXT0000170 = 'Record marked as floor dispositioned - operation not supported.';
   cTXT0000171 = 'Invalid Repack Qty - operation aborted.';
   cTXT0000172 = 'Repack Qty must be above zero and less than consumed qty.'; 
   cTXT0000173 = 'Reprint Label?';
   cTXT0000174 = 'Floor Dispo Out Qty [Added to Calculated Usage]'; 
   cTXT0000175 = 'Floor Dispo Out Qty [Overrides Calculated Usage]'; 
   cTXT0000176 = 'An item is currently not running on this work center.  Cannot disposition.';
   cTXT0000177 = 'The location(s) associated with the label in this ' +
     'transaction are no longer current.  Operation aborted.';
   cTXT0000178 = 'Serial #:';
   cTXT0000179 = 'Master Label Location:  Unassigned';
   cTXT0000180 = 'Inventory Location ID: Unassigned';
   cTXT0000181 = 'Trans: OUT';
   cTXT0000182 = 'Please select an item before entering a quantity.';
   cTXT0000183 = 'The production date and shift have changed.  Please verify your selection.';
   cTXT0000184 = 'Invalid serial number prefix.';
   cTXT0000185 = 'Could not locate running part (ILLUM_PART ID = %.0f).';
   cTXT0000186 = 'Clear scanned serials for Item # %s';
   cTXT0000187 = 'Please select an item.';
   cTXT0000188 = 'The total relieved quantity (%f) must equal the ' +
     'quantity (%f) of backflushed materials.'#13#13 +
     'Please check the quantity values.';
   cTXT0000189 = 'Out of Balance';
   cTXT0000190 = 'Complete';
   cTXT0000191 = 'A non-conform code must be entered.';
   cTXT0000192 = 'Non-Conforming Location - Select Non-Conform Code';
   cTXT0000193 = 'This location is inactive.  Do you wish to continue?';
   cTXT0000194 = 'Could not determine location associated with serial number, %s';
   cTXT0000195 = 'Please enter a quantity value less than %.6f.';
   cTXT0000196 = 'Set quantity to zero?';
   cTXT0000197 = ''; 
   cTXT0000198 = ''; 
   cTXT0000199 = ''; 
   cTXT0000200 = ''; 

   // shopdata_rscstr.cTXT0000118

implementation

end.
