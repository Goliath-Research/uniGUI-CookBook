unit scanline_rscstr;

interface

resourcestring

   cTXT0000001 = 'Log All Activity Invoked';
   cTXT0000002 = 'Logging Only Errors';
   cTXT0000003 = 'Time out interval (%d seconds) exceeded.';
   cTXT0000004 = 'Could not find file.';
   cTXT0000005 = 'Processing %s ... ';
   //cTXT0000006 = 'Invalid Serial #';
   cTXT0000007 = 'Duplicate scan.  The item has already been scanned and dispositioned.';
   cTXT0000008 = 'Belongs to pallet.';
   cTXT0000009 = 'Quantity is zero.';
   cTXT0000010 = 'Non-production scan.';
   cTXT0000011 = 'Unable to locate associated Inventory';
   cTXT0000012 = 'Begin scanning';
   cTXT0000013 = 'Stop scanning';
   cTXT0000014 = 'COM Port settings require a Packet Stop Character.  Please specify a Packet Stop Character.';
   cTXT0000015 = 'Duplicate scan.  The serial number has already been scanned.';
   cTXT0000016 = '[Serial #: %s] %s';
   cTXT0000017 = 'Status: %s';
   cTXT0000018 = 'Stop scanning?';
   cTXT0000019 = 'Could not close port.' ;
   cTXT0000020 = 'This demo is for IQMS Development and Testing use only.  ' +
                 'Items will be dispositioned.  Are you sure you want to continue?';
   cTXT0000021 = 'No item selected.';
   cTXT0000022 = 'Sequence # 1 packaging is not assigned.';
   cTXT0000023 = 'Sequence # 2 packaging is not assigned.';
   cTXT0000024 = 'No packaging is assigned.';
   cTXT0000025 = 'The label for Sequence # 2 was not generated.';
   cTXT0000026 = 'The label for Sequence # 1 was not generated.';
   cTXT0000027 = 'You are about to stop the scanning process. Print partial pallet label now?';
   cTXT0000028 = 'Duplicate Serial Number Scanned:  %s [Current packaging item].';
   cTXT0000029 = 'Duplicate Serial Number Scanned:  %s. ' +
                 '[Master Label Serial Number:  %s] [Inventory Item #: %s, %s]' +
                 '[FG Lot #:  %s]';

   cTXT0000030 = 'ScanLine Mode 1 - %s [%s, %s]';
   cTXT0000031 = 'ScanLine Mode 1 - %s [%s]';
   cTXT0000032 = 'Time out interval exceeded.';
   cTXT0000033 = 'The required value for pallet (sequence 1) is zero.';
   cTXT0000034 = 'The required value for box (sequence 2 ) is zero.';
   cTXT0000035 = 'The required value for pallet (sequence 1) is less than the required value for box (sequence 2 ).';
   cTXT0000036 = 'None'; // parity
   cTXT0000037 = 'Odd';  // parity
   cTXT0000038 = 'Even'; // parity
   cTXT0000039 = 'Mark'; // parity

   cTXT0000040 = 'Space'; // parity
   cTXT0000041 = 'COM%d';
   cTXT0000042 = 'The value, %s, is an invalid baud rate.';
   cTXT0000043 = 'The value, %s, is an invalid data bit.';
   cTXT0000044 = 'The value, %s, is an invalid stop bit.';
   cTXT0000045 = 'Error reading setting for %s:'#13#13'%s';
   cTXT0000046 = 'ScanLineLogMode1.txt';
   cTXT0000047 = 'ScanLineLogMode2.txt';
   cTXT0000048 = 'Reopen Pallet';
   cTXT0000049 = 'Enter serial number of pallet to reopen:';

   cTXT0000050 = 'Reopen pallet %s?';
   cTXT0000051 = 'No box labels found for pallet.';
   cTXT0000052 = 'Pallet %s uses BOM number, %s.  Load this BOM?';
   cTXT0000053 = 'Could not locate BOM.';
   cTXT0000054 = 'No label associated with sequence 1 packaging item.';
   cTXT0000055 = 'No label associated with sequence 2 packaging item.';
   cTXT0000056 = 'The selected part has warnings:'#13#13'%s';
   cTXT0000057 = 'This action will discard current scans for this pallet.  Do you want to continue?';
   cTXT0000058 = 'Discarding current scan.  Please wait...';
   cTXT0000059 = 'No box labels found for pallet.';

   cTXT0000060 = 'Are you sure you want to discard the selected pallet?  This action is irreversible.';
   cTXT0000061 = 'Discard Pallet';
   cTXT0000062 = 'Enter serial number of pallet to discard:';
   cTXT0000063 = 'Exit Scanline?';
   cTXT0000064 = 'Invalid Serial # %s';
   cTXT0000065 = 'Serial # %s, Item # %s belongs to PS# %s';
   // scanline_rscstr.cTXT0000064 {'Enter serial number of pallet to discard:'}

implementation

end.
