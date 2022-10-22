unit disposvr_rscstr;

interface

resourcestring

  //  disposvr_rscstr.cTXT0000056

  cTXT0000001 = 'Disposition Server';
  cTXT0000002 = '';
  cTXT0000003 = 'Disposition Server'#13'Processing serial files ...';
  cTXT0000004 = 'Disposition Server'#13'Waiting ...';
{  cTXT0000004 = 'Disposition Server'#13 +
                 ' User Name: %s'#13 +
                 ' Alias: %s'#13 +
                 ' Eplant Name: %s'#13 +
                 'Waiting ...'; }

  cTXT0000005 = 'Disposition Server'#13'Currently idle.';
  cTXT0000006 = 'Disposition Server'#13'There are errors.  Please view log.';
  cTXT0000007 = 'Database connected.';
  cTXT0000008 = 'Database disconnected.';
  cTXT0000009 = 'Directory';
  cTXT0000010 = 'History Log';
  cTXT0000011 = 'Error Log';
  cTXT0000012 = 'Unprocessed Files';
  cTXT0000013 = 'Cannot create directory, %s.';
  cTXT0000014 = 'Cannot copy file, %s, to %s.';
  cTXT0000015 = 'Exit Disposition Server?';
  cTXT0000016 = 'Serial List';
  cTXT0000017 = 'Stop';
  cTXT0000018 = 'Start';
  cTXT0000019 = 'Error processing serial number.';
  cTXT0000020 = 'Clear errors?';
  cTXT0000021 = 'Processing serial # %s';
  cTXT0000022 = 'The "Unprocessed Files" directory contains files.'#13 +
                'Please review the "Unprocessed Files" directory.';
  cTXT0000023 = 'Some serial numbers had errors and could not be processed.'#13 +
                'Please review the "Unprocessed Files" directory.';
  cTXT0000024 = 'Log\serial_%s.log';
  cTXT0000025 = 'Log\history_%s.log';
  cTXT0000026 = 'Idle.';
  cTXT0000027 = 'Running ...';
  cTXT0000028 = 'Waiting ...';
  cTXT0000029 = 'Paused.';
  cTXT0000030 = 'FAULTS';
  cTXT0000031 = 'The file, %s, was copied successfully.  But the original file could not be removed.';
  cTXT0000032 = 'Non-production scan: %s';
  cTXT0000033 = 'The associated Inventory item, %s, is not currently running on a press.  ' +
                'Cannot disposition this part.';
  cTXT0000034 = 'Cannot find Inventory item for Serial number.';
  cTXT0000035 = 'Serial #:  %s'#13'MASTER_LABEL.ID = %.0f';
  cTXT0000036 = 'Invalid Serial # %s.  Not a valid number.';
  cTXT0000037 = 'Serial # %s belongs to pallet.';
  cTXT0000038 = 'Quantity is 0 for Serial # %s';
  cTXT0000039 = 'Invalid Serial # %s.  Data not found.';
  cTXT0000040 = 'Inventory Item, passed to disposition routine, could not be found.';
  cTXT0000041 = 'Attempted to disposition, with backflush, ' +
                'the Inventory item [ARINVT.ID=%.0f] associated with Serial # %s.';
  cTXT0000042 = 'Serial # %s bypassed as a duplicate scan.';
  cTXT0000043 = 'Inconsistent Inventory Item in list: %s.';
  cTXT0000044 = 'The serial number either does not exist in the database, or it has no associated inventory item.';
  cTXT0000045 = 'Stop processing?';
  cTXT0000046 = '';
  cTXT0000047 = 'Serial # %s - Non-production item dispositioned successfully, with backflush.';
  cTXT0000048 = 'Serial # %s - Non-production item floor-dispositioned successfully.';
  cTXT0000049 = 'Serial # %s - Dispositioned successfully, with backflush.';
  cTXT0000050 = 'Serial # %s - Floor-dispositioned successfully.';
  cTXT0000051 = 'Paused.';
  cTXT0000052 = 'Started [Version %s].';
  cTXT0000053 = 'Stopped.';
  cTXT0000054 = 'Inconsistent EPlant for Serial # %s.';
  cTXT0000055 = '(None)';
  cTXT0000056 = 'Serial list empty.  Disposition has not taken place.';
  cTXT0000057 = 'Internal Connection Data:  User Name=%s, EPlant Name=%s [%.0f].';
  cTXT0000058 = 'Database Disconnected.  User Name=%s, Alias=%s, EPlant=%s [%.0f].';
  cTXT0000059 = 'Database Connected.  User Name=%s, Alias=%s, EPlant=%s [%.0f].';
  cTXT0000060 = 'Serial list empty.  Disposition has not taken place.';
  cTXT0000061 = 'Encountered errors.  Disposition has not taken place [Serial #: %s].';
  cTXT0000062 = 'Disposition method entry.';
  cTXT0000063 = 'Disposition method entry.';
  cTXT0000064 = 'Disposition method entry.';
  cTXT0000065 = 'Updating master label parent/child disposition fields [UpdateMasterLabel].';
  cTXT0000066 = 'Master Label Location description not updated (LOC_ID=0, FGMULTI_ID=%.0f).';
  cTXT0000067 = 'Updating location description (LOC_DESC=%s, ID=%.0f) for master label parent/child (ID=%.0f).';
  cTXT0000068 = '<Unassigned Serial Number>';
  cTXT0000069 = 'Cannot move serial file, %s, which may be in use.  Processing will continue.';
  cTXT0000070 = 'Disposition Server application closed.';
  cTXT0000071 = 'Disposition Server application opened.';
  cTXT0000072 = 'Cannot move serial file, %s, to the faults directory.  Processing will continue.';
  cTXT0000073 = 'Cannot move serial file, %s. File does not exist.  Processing will continue.';
  cTXT0000074 = 'Updating XDAY_PART floor disposition quantity.';
  cTXT0000075 = 'XDAYPART floor disposition quantity not updated.';
  cTXT0000076 = 'Begin processing Serial # %s';
  cTXT0000077 = 'Creating query ILLUM_PART, used for dispositioning.';
  cTXT0000078 = 'Purging log records.  Please wait.';
  cTXT0000079 = 'There is no XML to save.';
  cTXT0000080 = 'View XML Text';
  cTXT0000081 = 'Start Date';
  cTXT0000082 = 'Date';
  cTXT0000083 = 'The Start Date must precede the End Date.';
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

  // disposvr_rscstr.cTXT0000083

implementation

end.
