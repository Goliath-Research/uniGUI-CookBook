unit WCPltBldr_rscstr;

interface
// WCPltBldr_rscstr.cTXT000004
resourcestring
  cTXT000001 = 'No serial selected.'#13#10#13#10 +
    'Please select a serial to print.';
  cTXT000002 = 'Reprint Serial # %s?';
  cTXT000003 = 'No pallet label to print.'#13#10#13#10'Please load a ' +
    'pallet or scan a serial number to create a new pallet.';
  cTXT000004 = 'Pallet Complete';
  cTXT000005 = 'Pallet Quantity Exceeded';
  cTXT000006 = '%s [%d carton(s)]';
  cTXT000007 = 'The current pallet must be completed before editing ' +
   'another pallet.';
  cTXT000008 = 'Unable to locate serial # %s';
  cTXT000009 = 'The pallet is full.'#13#10'Do you wish to continue?';
  cTXT000010 = 'Pallet completed.';
  cTXT000011 = 'Pallet completed.  Do you wish to print pallet serial # %s?';
  cTXT000012 = 'The scanned item is not setup on this Work Center.';
  cTXT000013 = 'Application Error:  No active item.';
  cTXT000014 = 'This label belongs to a pallet.';
  cTXT000015 = 'Cannot scan a pallet to a pallet.';
  cTXT000016 = 'This label is used by the Pick Ticket system.';
  // Non-production scans are not permitted under your WMS profile.
  cTXT000017 = 'Non-production scans are not allowed. Please change your WMS Profile if this should be allowed.';
  cTXT000018 = 'Invalid scan: BOM # Mismatch. [ Label Standard ID = %.0f, Work Order Standard ID = %.0f ]';
  cTXT000019 = 'Serial #%s, Lot #%s, does not match Lot #%s';
  cTXT000020 = 'Insufficient rights. Access denied. [%s, %s]';
  cTXT000021 = 'Print pallet serial # %s?';
  cTXT000022 = 'No items have been selected.  Cannot proceed.';
  cTXT000023 = 'The pallet(s) for this Work Center must be completed.';
  cTXT000024 = 'Load the currently running item(s) for this Work Center?';
  cTXT000025 = 'Unable to locate Master Label ID = %.0f';
  cTXT000026 = 'Printing label...';
  cTXT000027 = 'RF default label not found.';
  cTXT000028 = 'Invalid serial # %s';
  cTXT000029 = 'Unable to locate pallet ID %.0f';
  cTXT000030 = 'Unable to proceed - Scanned serial is either not a pallet label or has not been scanned to a pallet.';
  cTXT000031 = 'Unable to proceed - No label has been selected for removal.';
  cTXT000032 = 'Unable to proceed - Unable to determine parent pallet label for Serial# %s.';
  cTXT000033 = '%s from pallet?';
  cTXT000034 = 'Unable to determine FGMulti ID from master label id:%.0f, Unable to remove carton!';
  cTXT000035 = 'Serial #%s is in a Non-Conforming location.'#13#13'Continue?';
  cTXT000036 = 'Non-Conforming serial #%s was prevented from being scanned to the pallet.';
  cTXT000037 = 'There were no child serials found for pallet serial %s! Unable to continue!';
  cTXT000038 = 'Enter total pallet quantity...';
  cTXT000039 = 'Dispositioned on Pallet Complete. %d labels with %.6f quantity for item %s.';
  cTXT000040 = 'Failed to Disposition on Pallet Complete for item %s.  Labels to dispo: %d Qty Per: %.6f';
  cTXT000041 = 'Unable to continue without a total pallet quantity.';
  cTXT000042 = 'This option is only available for dispositioned labels.';
  cTXT000043 = 'Adjust (Out Transaction)';
  cTXT000044 = 'Scrap (Out Transaction)';
  cTXT000045 = 'Disassociate (No inventory transaction)';
  cTXT000046 = '%s for serial [#%s]';
  cTXT000047 = 'Item %s is marked ''Lot # is mandatory'' on the master inventory record.  Unable to add child serial %s to pallet without a Lot #.';
  cTXT000048 = 'The scanned item can go to more than one pallet. Select one and try again.';
  cTXT000049 = 'empty';
  cTXT000050 = 'Pallet # %s %s';
  cTXT000051 = 'Warning: The current Pallet Builder configuration has pallet(s) in progress.'#13+
               'Do you want to force ''Get Current BOM'' and apply the next configuration?'+#13#13+

               'Current Configuration: [ WC#: %s, BOM#: %s, Item#(s): %s ]'+#13#13+
               'Next Configuration: [ WC#: %s, BOM#: %s, Item#(s): %s ]'+#13#13;

  cTXT000052 = 'Warning! The BOM loaded in Pallet Builder for this Work Center '+#13+
               'does not match the current BOM scheduled for this Work Center. '#13+
               'Click to update.';
  cTXT000053 = 'The BOM loaded in Pallet Builder for this Work Center matches '#13+
               'the current BOM scheduled.';
  cTXT000054 = '';
  cTXT000055 = '';
  cTXT000056 = '';
  cTXT000057 = '';
  cTXT000058 = '';
  cTXT000059 = '';
  cTXT000060 = '';
  cTXT000061 = '';
  cTXT000062 = '';
  cTXT000063 = '';
  cTXT000064 = '';
  cTXT000065 = '';
  cTXT000066 = '';
  cTXT000067 = '';
  cTXT000068 = '';
  cTXT000069 = '';
  cTXT000070 = '';
  cTXT000071 = '';
  cTXT000072 = '';
  cTXT000073 = '';
  cTXT000074 = '';
  cTXT000075 = '';
  cTXT000076 = '';
  cTXT000077 = '';
  cTXT000078 = '';
  cTXT000079 = '';
  cTXT000080 = '';
  cTXT000081 = '';
  cTXT000082 = '';
  cTXT000083 = '';
  cTXT000084 = '';
  cTXT000085 = '';
  cTXT000086 = '';
  cTXT000087 = '';
  cTXT000088 = '';
  cTXT000089 = '';
  cTXT000090 = '';
  cTXT000091 = '';
  cTXT000092 = '';
  cTXT000093 = '';
  cTXT000094 = '';
  cTXT000095 = '';
  cTXT000096 = '';
  cTXT000097 = '';
  cTXT000098 = '';
  cTXT000099 = '';
  cTXT000100 = '';

implementation

end.
