unit taginv_rscstr;

interface

// taginv_rscstr.cTXT0000052

resourcestring

   cTXT0000001 = 'MISSING';         // [20]
   cTXT0000002 = 'Every Sales Rank % must be assigned and the total must equal 100.';
   cTXT0000003 = 'Calculate and assign inventory items cycle count code based on rank percentage?';
   cTXT0000004 = 'Processing.  Please wait...';
   cTXT0000005 = 'Available locations for: %s'#13'Item#: %s';
   cTXT0000006 = 'Please assign a location.';
   cTXT0000007 = 'Please specify a Reason.';
   cTXT0000008 = 'Please enter a positive amount for Quantity.';
   cTXT0000009 = 'The Nonconforming specification in the following Tag(s) (%s)' + #13 +
     'differs from your current specification.' + #13 +
     'Since there can be only one Nonconforming specification per location,' + #13 +
     'do you wish to override those tags with your current selection for Nonconforming?';
   cTXT0000010 = 'Accessing database.  Please wait.';
   cTXT0000011 = 'Accessing Physical Inventory.  Please wait.';
   cTXT0000012 = 'When button is up, record Inventory Adjustments for changed quantity only.'#13 +
                 'When button is down, record Inventory Adjustments for all tags.';
   cTXT0000013 = 'Current State [ %s ] - ';
   cTXT0000014 = 'You must be associated with an existing EPlant in order to proceed';
   cTXT0000015 = 'This option clears the Tag Worksheet table.'#13#13'Proceed?';
   cTXT0000016 = 'Are you sure you want to continue?';
   cTXT0000017 = 'Last chance! Continue?';
   cTXT0000018 = 'Done.';
   cTXT0000019 = 'This option clears the Tag Worksheet table for all EPlants.'#13#13'Proceed?';
   cTXT0000020 = 'This option clears the Tag Worksheet table for EPlant, %s'#13#13'Proceed?';
   cTXT0000021 = 'Clearing Tag Worksheet table';
   cTXT0000022 = 'This option creates Inventory Image and clears the Tag Worksheet table.'#13'Proceed?';
   cTXT0000023 = 'Done processing tags.';
   cTXT0000024 = 'Done processing worksheet.';
   cTXT0000025 = 'Worksheet: populating tags table';
   cTXT0000026 = 'Creating locations mirror image';
   cTXT0000027 = 'WorkSheet: Clearing locations mirror image.';
   cTXT0000028 = 'Current State: %s'#13'The Begin Count process must be run before proceeding.';
   cTXT0000029 = 'This option prepares the adjustment table that will be used for the inventory update.'#13'Proceed?';
   cTXT0000030 = 'Resetting image inventory';
   cTXT0000031 = 'Comparison done.';
   cTXT0000032 = 'Comparing record %d';
   cTXT0000033 = 'This is a serialized inventory controlled item.  The total scanned ' +
      'labels quantity must match the total tags quantity.';
   cTXT0000034 = 'Current State: %s'#13'The Prepare Adjustment File process must be run before proceeding.';
   cTXT0000035 = 'This option writes the Inventory Adjustments to the actual inventory table for all EPlants.';
   cTXT0000036 = 'This option writes the Inventory Adjustments to the actual inventory table for EPlant, %s.';
   cTXT0000037 = 'This option writes the Inventory Adjustments to the actual inventory table.';
   cTXT0000038 = 'Select Transaction Date';
   cTXT0000039 = 'Adjusting record %d';
   cTXT0000040 = 'Adjustments done. Do you want to clear all Physical Inventory Count tables (recommended)?' + #13 +
         'If you do not clear this table, you may experience difficulties deleting ' +
         'records from Inventory or the Nonconform tables.';
   cTXT0000041 = 'Tag Worksheet table cleared.';
   cTXT0000042 = 'Physical Inventory, Adjustment.';
   cTXT0000043 = 'Physical Inventory, New Location.';
   cTXT0000044 = 'Delete record?';
   cTXT0000045 = 'Please enter a Cycle Count Code.';
   cTXT0000046 = 'Please select locations.';
   cTXT0000047 = 'Tag Inventory: locations mirror image created; Tag Worksheet table cleared.';
   cTXT0000048 = 'WorkSheet: Locations mirror image created; tags table populated.';
   cTXT0000049 = 'Adjustment table prepared.';
   cTXT0000050 = 'Adjustments posted.';
   cTXT0000051 = 'Tag Worksheet table modified (Maintain Count Entries).';
   cTXT0000052 = 'Please enter a Tag number.';
   cTXT0000053 = 'No Cycle Codes records selected.';
   cTXT0000054 = 'This is a serialized inventory controlled item - operation is not permitted.';
   cTXT0000055 = 'Verifying Serialized Inventory Controlled on-hand qty';
   cTXT0000056 = 'Do you want to write Physical Inventory data to history tables?';
   cTXT0000057 = 'Every %s Rank %% must be assigned a positive number and the total must equal 100.';
   cTXT0000058 = 'A method must be selected to continue.';
   cTXT0000059 = 'This option clears the Tag Worksheet ID ''%.0f''.'#13#13'Proceed?';
   cTXT0000060 = 'Unable to locate or create TAGHEAD record';
   cTXT0000061 = 'Found conflicting Cycle Count ID ''%.0f'' in progress - unable to begin new Cycle Count.';
   cTXT0000062 = 'Cycle count is in progress - are you sure you want to delete this record?';
   cTXT0000063 = 'Delete record?';
   cTXT0000064 = 'This option clears the Tag Worksheet ID ''%.0f'' and Cancels the Cycle Count.'#13#13'Are you sure you want to continue?';
   cTXT0000065 = 'Cycle Count is about to be cancelled.'#13#13'Are you sure you want to continue?';
   cTXT0000066 = 'Cycle Count is cancelled.';
   cTXT0000067 = 'This option writes the Inventory Adjustments to the actual inventory table for Cycle Count ID ''%.0f''.'#13#13'Please confirm to continue.';
   cTXT0000068 = 'Location %s is associated to a pick ticket. Are you sure you want to continue?';
   cTXT0000069 = 'Recording of Inventory Adjustments started';
   cTXT0000070 = '';
   cTXT0000071 = '';
   cTXT0000072 = '';
   cTXT0000073 = '';
   cTXT0000074 = '';
   cTXT0000075 = '';
   cTXT0000076 = '';
   cTXT0000077 = '';
   cTXT0000078 = '';
   cTXT0000079 = '';
   cTXT0000080 = '';
   cTXT0000081 = '';
   cTXT0000082 = '';
   cTXT0000083 = '';
   cTXT0000084 = '';
   cTXT0000085 = '';
   cTXT0000086 = '';
   cTXT0000087 = '';
   cTXT0000088 = '';
   cTXT0000089 = '';
   cTXT0000090 = '';
   cTXT0000091 = '';
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

