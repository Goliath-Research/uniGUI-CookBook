unit wo_rscstr;

interface

// wo_rscstr.cTXT0000001

resourcestring

   cTXT0000001 = 'Accessing Work Orders.  Please wait.';
   cTXT0000002 = 'You are attempting to change the Mfg# of this workorder to a different Mfg Type. Release(s) will be automatically deleted. Do you wish to proceed?';
   cTXT0000003 = 'Delete record?'; 
   cTXT0000004 = 'Hard Allocation'; 
   cTXT0000005 = 'BOM'; 
   cTXT0000006 = 'You have under/over-allocated material. Would you like to recalculate the Percent and Parts Per columns based on the Total Allocated?'; 
   cTXT0000007 = 'Changing work order quantity will reset the original work order quantity.  Continue?';
   cTXT0000008 = 'Update schedule is currently running.  Firming this planned workorder while the MRP engine '+
                 'is processing can affect allocation and generate duplicate demand.'+#13#13'Proceed?';
   cTXT0000009 = 'Could not locate inventory location, %s [FGMULTI.ID=%.0f]%s';
   cTXT0000010 = '(Not found)';
   cTXT0000011 = ', Inventory Item # %s';
   cTXT0000012 = 'Update schedule is currently running. Editing this planned workorder while the MRP engine is processing can affect allocation and generate duplicate demand.'#13'Continue?';
   cTXT0000013 = '%s, Pos: %d';
   cTXT0000014 = 'Please select a Division.';
   cTXT0000015 = 'WO # %.0f Allocated Materials';
   cTXT0000016 = 'This options recalculates the BOM tree and hard allocation ' +
     'requirements.'#13#13'Are you sure you want to continue?';
   cTXT0000017 = 'Not all of the required materials have been allocated in ' +
     'full. Would you like to correct it now?';
   cTXT0000018 = 'Remove or edit hard allocation?';
   cTXT0000019 = 'An available inventory location could not be found.';
   cTXT0000020 = 'Location is already hard allocated to WO# %.0f';
   cTXT0000021 = 'No items found.  Cannot allocate materials.';
   cTXT0000022 = 'Cannot hard allocate to a "No Backflush" location.';
   cTXT0000023 = 'Could not add record.';
   cTXT0000024 = 'Allocate all transaction locations?';
   cTXT0000025 = 'Allocate and move all transaction locations to disposition locations?';
   cTXT0000026 = 'A workorder must be toggled to "Firm" before proceeding with ' +
     'materials hard allocation.'#13#13'Toggle WO # %.0f to "Firm"?';
   cTXT0000027 = 'Unable to find Work Order'#13#13'[WORKORDER_BOM_ID = %.0f]';
   cTXT0000028 = 'Unable to find Inventory Item.'#13#13'[ARINVT_ID = %f]';
   cTXT0000029 = 'Please select an Inventory item.';
   cTXT0000030 = 'Circular reference detected.  Operation aborted.';
   cTXT0000031 = '(%.0f-N/A)';
   cTXT0000032 = 'Firm Work Order %.0f Allocation';
   cTXT0000033 = 'Calculated:';
   cTXT0000034 = 'WorkOrder: %s'#13 +
     'Mfg #: %s'#13 +
     'Start: %s'#13 +
     'Finish: %s'#13 +
     'Prod Hrs: %-6.2f';
   cTXT0000035 = 'MTO ALLOCATION, SO # %s';
   cTXT0000036 = 'HARD MATERIAL ALLOCATION, SO # %s';
   cTXT0000037 = 'Please select a Sales Order.';
   cTXT0000038 = 'Print With Document Status - WO # %.0f';
   cTXT0000039 = 'Original Mfg #: %s';
   cTXT0000040 = 'Checked by %s on %s';
   cTXT0000041 = 'Unchecked by %s on %s';
   cTXT0000042 = '(Ship To ID: %.0f)';
   cTXT0000043 = 'Unable to locate Work Order # %.0f.';
   cTXT0000044 = 'Unable to locate Inventory Item, %s, in Work Order # %d';
   cTXT0000045 = 'Firm Work Orders:';
   cTXT0000046 = 'When set to Yes, this workorder, after completed ' +
     'and removed from the schedule, will be deleted ' +
     'during update schedule';
   cTXT0000047 = '%s Work Order';
   cTXT0000048 = 'Work order has allocated material.  Please remove ' +
     'allocation if you wish to select an alternate manufacturing number.';
   cTXT0000049 = 'Do you wish to assign customer, %s, to the work order?';
   cTXT0000050 = 'Please select a Manufacturing #';
   cTXT0000051 = 'Are you sure you want to substitute Manufacturing # %s?';
   cTXT0000052 = 'WO # %s is scheduled in Assembly Tracking.  Cannot substitute BOM.';
   cTXT0000053 = 'A Manufacturing # could be found for the Work Order %.0f.  ' +
     'The BOM cannot be cloned.';
   cTXT0000054 = 'The work order must be set to "Firm" in order to be ' +
     'manually associated with a Make To Order sales order line.';
   cTXT0000055 = 'Jump To Assembly Track';
   cTXT0000056 = 'Jump To Schedule';
   cTXT0000057 = 'No transactions were found for the work order.';
   cTXT0000058 = 'Planned';
   cTXT0000059 = 'Delete Work Order # %d';
   cTXT0000060 = ''; 
   cTXT0000061 = ''; 
   cTXT0000062 = ''; 
   cTXT0000063 = ''; 
   cTXT0000064 = ''; 
   cTXT0000065 = ''; 
   cTXT0000066 = ''; 
   cTXT0000067 = ''; 
   cTXT0000068 = ''; 
   cTXT0000069 = ''; 
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
