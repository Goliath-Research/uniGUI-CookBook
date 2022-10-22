unit sched_rscstr;

interface

// sched_rscstr.cTXT0000029

resourcestring

   cTXT0000001 = 'Mfg#';
   cTXT0000002 = 'Tool#';
   cTXT0000003 = 'Customer';
   cTXT0000004 = 'Material';
   cTXT0000005 = 'Material Color Group';
   cTXT0000006 = 'Labor';
   cTXT0000007 = 'Accessing Scheduling.  Please wait.';
   cTXT0000008 = 'Scheduling - Center %s - %s';
   cTXT0000009 = 'Scheduling';
   cTXT0000010 = 'Mfg Description'; 
   cTXT0000011 = 'Process#'; 
   cTXT0000012 = 'Process Description'; 
   cTXT0000013 = 'WO#'; 
   cTXT0000014 = 'Item#'; 
   cTXT0000015 = 'To edit a work order please schedule one first';
   cTXT0000016 = 'No work orders have been scheduled.  There is nothing to remove.';
   cTXT0000017 = 'Remove Process # %s, WO # %.0f, MFG # %s from the schedule?';
   cTXT0000018 = 'Remove WO # %.0f, MFG # %s (%d) from the schedule?'; 
   cTXT0000019 = 'Remove WO # %s, sequence # %d, from the schedule?'; 
   cTXT0000020 = 'Set up process # %s, WO # %.0f, on work center %s?';
   cTXT0000021 = 'Set up WO # %.0f on work center %s?'; 
   cTXT0000022 = 'Set up next work order on work center %s?'; 
   cTXT0000023 = 'Center ID %.0f: Scanning scheduled work orders ...';
   cTXT0000024 = 'The Work Center is currently in production.  Setting up a '+
     'different work order is NOT allowed until the machine is down.' + #13+
     'If the WRONG work order is scheduled, choose SUSPEND to force the '+
     'work order change.' + #13+#13+
     'Do you want to SUSPEND the machine?';
   cTXT0000025 = 'The Work Center is NOT in the RealTime table. The setup did NOT go into the RealTime.'; 
   cTXT0000026 = 'Work center %s is currently flagged, ''Inactive''. By scheduling a ' +
     'work order, the work center will be toggled to ''Active''.'#13#13+
     'Do you want to continue?';
   // cTXT0000027 = 'MFG # %s - Schedule Information'; 
   cTXT0000027 = 'MFG # %s'; 
   cTXT0000028 = 'Please note: %s is not directly ordered item. It is required to satisfy sales order %s.';
   cTXT0000029 = 'Last Recalc:';
   cTXT0000030 = 'Work Order # %.0f is on a Run Hold - do you want to continue?'; 
   cTXT0000031 = 'Mfg# %s will be applied to WO # %.0f - please confirm to continue.'; 
   cTXT0000032 = 'About to assign Group ID = %d for selected Work Order(s).'#13#13+
                 // 'Total quantity assigned to the group: %s'#13#13+
                 'Are you sure you want to continue?'; 
   cTXT0000033 = 'About to unassign Group IDs from selected Work Order(s).'#13#13'Are you sure you want to continue?'; 
   cTXT0000034 = 'Finished processing selected work orders.'; 
   cTXT0000035 = 'About to remove selected work orders from Group ID %d. Work Orders scheduled in Assembly Track will not be removed.'#13#13'Are you sure you want to continue?'; 
   cTXT0000036 = 'Work Order %d is currently in Assembly Track - operation aborted'; 
   cTXT0000037 = 'Group ID %d is currently in Assembly Track - operation aborted'; 
   cTXT0000038 = 'Finished processing selected work orders.'#13#13'New Group ID = %d.'; 
   cTXT0000039 = 'About to re-sequence by must start date. Please confirm to continue.'; 
   cTXT0000040 = 'Planned center type must be assigned and be the same for all the work orders in the group - operation aborted.'; 
   cTXT0000041 = 'You must be associated with an existing EPlant in order to proceed - operation aborted.';
   cTXT0000042 = 'Are you sure you want to run Net Change Schedule?'; 
   cTXT0000043 = 'Finished running Net Change Schedule.';
   cTXT0000044 = 'Please be advised update schedule is currently running, this form must be closed.';
   cTXT0000045 = '';
   cTXT0000046 = ''; 
   cTXT0000047 = ''; 
   cTXT0000048 = ''; 
   cTXT0000049 = ''; 
   cTXT0000050 = ''; 


implementation

end.
