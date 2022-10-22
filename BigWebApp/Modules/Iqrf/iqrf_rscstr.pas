unit iqrf_rscstr;

interface

// NOTE:  Each line on the IQRF screen can only be 20 characters long.
//        Translated text may need to remove leading or trailing spaces.

// Abbreviations:
// RG = Regrind
// TGT = Target
// SRC = Source
// Qty = Quantity
// SN = Serial Number


resourcestring

   cTXT0000001 = 'Processing ...';         // [20]
   cTXT0000002 = 'Please Wait';            // [20]
   cTXT0000003 = 'Picking an Item';        // [20]
   cTXT0000004 = 'Scan Location';          // [20]
   cTXT0000005 = 'Location Not Found';     // [20]
   cTXT0000006 = 'Press Enter ...';        // standard prompt to press Enter or any key
   cTXT0000007 = 'Add it? (Y/N):';         // add location?
   cTXT0000008 = 'Enter Lot Number';        // [20]
   cTXT0000009 = 'This is Non-Conf Loc';   // Non-Conform Location

   cTXT0000010 = 'Non-conform code must be entered. Transaction cancelled.';
   cTXT0000011 = 'Enter Non-Conf Code';    // [20]
   cTXT0000012 = 'Code must be entered';   // [20]
   cTXT0000013 = 'Cancel Trans? (Y/N)';    // [19]
   cTXT0000014 = 'Invalid code';           // [20]
   cTXT0000015 = 'Not a Quantity Scan';    // [20]
   cTXT0000016 = 'None found in this location [%.0f]';  // [Wrapped]
   cTXT0000017 = 'Cannot enter more than default quantity.'; // [Wrapped]
   cTXT0000018 = 'Loc Qty:'; // [12] Means: Location Qty, Loc Quantity, Location Quantity
   cTXT0000019 = 'Scan Serial #';          // [20]

   cTXT0000020 = 'Invalid scan: Serial# must have prefix, %s'; // [Wrapped]
   cTXT0000021 = 'Invalid code-Reenter';   // [20]
   cTXT0000022 = 'Receive : ';             // [20]
   cTXT0000023 = '* Access Denied *';      // [20]
   cTXT0000024 = 'Security Code:';         // [20]
   cTXT0000025 = 'Component Name:';        // [20]
   cTXT0000026 = 'Time Left: ';            // [12]
   cTXT0000027 = 'Date: ';                 // [12]
   cTXT0000028 = 'Time: ';                 // [12]
   cTXT0000029 = 'Shift: ';                // [12]

   cTXT0000030 = 'Please Confirm:';        // [20]
   cTXT0000031 = 'Remove From Pallet';     // [20]
   cTXT0000032 = 'Label # %s belongs to Pallet Label # %s';  // [Wrapped]
   cTXT0000033 = 'Virg Qty'; // [20] *no* colon; = Virgin Qty, Virgin Quantity
   cTXT0000034 = 'RG Qty'; // [20] *no* colon
   cTXT0000035 = 'Continue? (Y/N):';      // [19]
   cTXT0000036 = 'Unable to Continue';    // [20]
   cTXT0000037 = 'Cartons ';              // [20]
   cTXT0000038 = 'Floor Dispositions';    // [20]
   cTXT0000039 = 'NonRT RF Disposition';  // [20]

   cTXT0000040 = '1. RT Scan to Inv'   ;  // [20]
   cTXT0000041 = '2. Scan / Backflush' ;  // [20]
   cTXT0000042 = '3. Enter Rejects'    ;  // [20]
   cTXT0000043 = '4. RG to Inventory'  ;  // [20]
   cTXT0000044 = '5. Query Shift Time' ;  // [20]
   cTXT0000045 = '6. RT Scan to Inv '  ;  // [20]
   cTXT0000046 = 'Pick Qty';              // [20] no colon; = pick quantity
   cTXT0000047 = '7. Prompt Qty';         // [14] it will be followed by ' (Y/N)'
   cTXT0000048 = 'Select (0-8): ';        // [19]
   cTXT0000049 = 'Select (0-6): ';        // [19]

   cTXT0000050 = 'Floor Dispo By SN#';    // [20]
   cTXT0000051 = '1. Dispo By Serial';    // [20]
   cTXT0000052 = '2. Dispo To Pallet';    // [20]
   cTXT0000053 = '<Current Shift Only>';  // [20]
   cTXT0000054 = 'Select (0-2): ';        // [19]
   cTXT0000055 = 'Warning!';              // [20]
   cTXT0000056 = 'You are attempting to disposition more than has been produced.'; // [Wrapped]
   cTXT0000057 = 'Scanner Pick Items';    // [20]
   cTXT0000058 = 'Pick for Store';        // [20]
   cTXT0000059 = 'Nothing to store for %s'; // [Wrapped] nothing to store for location

   cTXT0000060 = 'Pick Item to Store';    // [20]
   cTXT0000061 = 'ScanInv CurrShift';     // [20]
   cTXT0000062 = 'Scan To Inventory';     // [20]
   cTXT0000063 = 'P:Partial is Enabled';  // [20]
   cTXT0000064 = 'Invalid Serial #';      // [20]
   cTXT0000065 = 'Duplicate Scan';        // [20]
   cTXT0000066 = 'SN: ';                  // [12]
   cTXT0000067 = 'Item #/Description:';   // [20]
   cTXT0000068 = 'Rev/Class: ';           // [12]
   cTXT0000069 = 'FG Lot #: ';            // [12]

// iqrf_rscstr.cTXT0000073 {'Quantity: '}

   cTXT0000070 = 'Default Qty:';          // [12]
   cTXT0000071 = 'Scan Qty';              // [16]
   cTXT0000072 = 'Trans Cancelled';       // [20]
   cTXT0000073 = 'Quantity: ';            // [16]
   cTXT0000074 = 'Scan Inv Curr Shift';   // [20]
   cTXT0000075 = 'Scan to Inv';           // [20]
   cTXT0000076 = 'Error: Non-production scan! Please try again.';  // [Wrapped]
   cTXT0000077 = ' of '; // record 1 of 5
   cTXT0000078 = 'Virgin Qty:';   // [20] with colon; = Virgin Qty, Virgin Quantity; see cTXT0000033
   cTXT0000079 = 'Work Center:';  // [14]
   cTXT0000080 = 'Prod Date:';    // [12]
   cTXT0000081 = 'Shift:';        // [12]
   cTXT0000082 = '2-Next, 3-Previous';  // [20]
   cTXT0000083 = '1-Disposition: ';     // [20]
   cTXT0000084 = 'Dispo Location';      // [20]
   cTXT0000085 = 'Item #: ';            // [9]
   cTXT0000086 = 'Pick Quantity: ';     // [20] with colon; = pick quantity; see cTXT0000046
   cTXT0000087 = 'Pick Qty: ';          // [20] with colon; = pick quantity; see cTXT0000046 and cTXT0000087
   cTXT0000088 = 'Partial quantity cannot exceed label printed quantity.';  // [Wrapped]
   cTXT0000089 = 'Floor Disposition';   // [20]

   cTXT0000090 = 'Enter Reject';        // [20]
   cTXT0000091 = 'Scan Item #';         // [20]
   cTXT0000092 = 'Item # is NOT running currently or is pending dispo'; // [Wrapped]
   cTXT0000093 = 'Storing an Item';
   cTXT0000094 = 'Store Qty'; // prompt, no colon
   cTXT0000095 = 'WorkCenter:';
   cTXT0000096 = 'Prod Date   Shift';
   cTXT0000097 = 'Status: ';
   cTXT0000098 = '0-Cancel, 1-Select:'; // [19]
   cTXT0000099 = 'Rev  : ';

   cTXT0000100 = 'Class: ';
   cTXT0000101 = 'Reject Qty';
   cTXT0000102 = 'Reject Code';
   cTXT0000103 = 'Floor RG Disposition';
   cTXT0000104 = 'RG to Inventory';
   cTXT0000105 = 'Cont. Anyway? (Y/N)'; // [19]
   cTXT0000106 = 'Bad Scan';
   cTXT0000107 = 'Must be a PL Class';
   cTXT0000108 = 'Serial# %s or associated inventory item not found';
   cTXT0000109 = 'Serial# %s - Duplicate Scan';

   cTXT0000110 = 'Wrong Scan! This batch is for %s';
   cTXT0000111 = 'Scan / Backflush';
   cTXT0000112 = 'Starting New Scan';
   cTXT0000113 = 'Scanned this batch:';  // begins message
   cTXT0000114 = '# of labels: ';
   cTXT0000115 = 'Total Qty: ';
   cTXT0000116 = 'Label has been already scanned and quantity moved into the above location.';
   cTXT0000117 = 'Description: ';
   cTXT0000118 = 'Class/Rev: ';      // [12]
   cTXT0000119 = 'Scan / Backflush';

   cTXT0000120 = 'Confirm Scan Batch:';
   cTXT0000121 = 'Backflush: ';
   cTXT0000122 = '0-Cancel, 1-Accept:';
   cTXT0000123 = 'Trans in process ...';
   cTXT0000124 = 'Marking Scanned ...';
   cTXT0000125 = 'Profile Disposition ';
   cTXT0000126 = 'Mode: By Serial #   ';
   cTXT0000127 = 'Prompt QTY';
   cTXT0000128 = 'Interplant transaction - item does not exist in current eplant';
   cTXT0000129 = 'Custom Codes';

   cTXT0000130 = '1. Error Code';
   cTXT0000131 = '2. Test Codes';
   cTXT0000132 = 'Enter a selection:';
   cTXT0000133 = 'Error Code';
   cTXT0000134 = 'Modify? (Y/N):';
   cTXT0000135 = 'Enter the Error Code';
   cTXT0000136 = 'Test Codes';
   cTXT0000137 = 'Database Error test';
   cTXT0000138 = 'Pick Location';
   cTXT0000139 = 'Enter Location';
   
   cTXT0000140 = 'Location: '; // [10]

   cTXT0000141 = 'Enter Item #'; // no colon
   cTXT0000142 = 'On Hand: %s';
   cTXT0000143 = 'From Location?';
   cTXT0000144 = 'Virg Qty: ';
   cTXT0000145 = 'Regrind (PL only):';
   cTXT0000146 = 'Direct Move';
   cTXT0000147 = 'Enter Serial #';  // no colon
   cTXT0000148 = 'Serial #:';
   cTXT0000149 = '1-OK,2-Next,3-Prev:'; // [19] '1-Sel 2-Nxt 3-Prv:'
   cTXT0000150 = 'Scan To Pallet';
   cTXT0000151 = 'Count: %d';
   cTXT0000152 = 'Total Qty: %s';

   cTXT0000153 = 'This serial number is part of a shipment. Move is not allowed.';
   cTXT0000154 = 'Direct Move - SOURCE';
   cTXT0000155 = 'Direct Move - TARGET';
   cTXT0000156 = 'Cartons: %.0f';
   cTXT0000157 = 'Total Qty: %f';
   cTXT0000158 = 'Unable to find fgmulti identified by id = %f';
   cTXT0000159 = '0-Continue, 1-Edit:';

   cTXT0000160 = '2-Add';
   cTXT0000161 = 'Loc: ';
   cTXT0000162 = 'Lot #: ';
   cTXT0000163 = 'NC: ';
   cTXT0000164 = 'TGT Loc: %s'; // "Target Location"
   cTXT0000165 = 'Pick Lot #';
   cTXT0000166 = 'Non-Conf: '; // [10] non-conforming
   cTXT0000167 = 'SRC Loc: %s';
   cTXT0000168 = '    Lot: %s';
   cTXT0000169 = 'Pick Item? (Y/N):'; // [19]

   cTXT0000170 = 'Scanned Qty: ';
   cTXT0000171 = 'Scan Vrg Qty'; // scan virgin quantity
   cTXT0000172 = 'Scan Qty:'; // scan quantity with a colon
   cTXT0000173 = 'Scan RG Qty'; // scan regrind quantity
   cTXT0000174 = 'Qty Exceeds On Hand';
   cTXT0000175 = 'Store Item? (Y/N):';  // [19]
   cTXT0000176 = 'Source Location:';
   cTXT0000177 = 'Enter Trans Code';
   cTXT0000178 = 'Code Not Found';
   cTXT0000179 = 'On Hand: '; // [12]

   // iqrf_rscstr.cTXT0000179 {'On Hand: '}

   cTXT0000180 = 'RG Qty:'; // with colon
   cTXT0000181 = 'NonConf:';
   cTXT0000182 = 'Misc Item';
   cTXT0000183 = '  Fixed Asset Inv   ';
   cTXT0000184 = '1. Scan Fixed Assets';
   cTXT0000185 = 'Select (0-1): ';       // [19]
   cTXT0000186 = 'Scan Fixed Assets';
   cTXT0000187 = 'Scanner Move';
   cTXT0000188 = 'Missing Location';
   cTXT0000189 = 'Unable to locate Locations ID = %f';

   cTXT0000190 = 'Serial #';
   cTXT0000191 = 'Serial #: ';
   cTXT0000192 = 'SN: %s';  // 'Serial #: %s';
   cTXT0000193 = 'Serial # %s';
   cTXT0000194 = 'Asset #/Description';
   cTXT0000195 = 'Loc: %s';
   cTXT0000196 = 'You are logged into';
   cTXT0000197 = 'All EPlants';
   cTXT0000198 = 'Repeated Location';
   cTXT0000199 = 'Exit? (Y/N):';  // [19]

   cTXT0000200 = 'WMS Main Menu (%d/%d)';
   cTXT0000201 = '1. Search'     ;
   cTXT0000202 = '2. Move'       ;
   cTXT0000203 = '3. Receive'    ;
   cTXT0000204 = '4. Ship'       ;
   cTXT0000205 = '5. Disposition';
   cTXT0000206 = '6. Transactions' ;
   cTXT0000207 = '7. Physical Inv.';
   cTXT0000208 = '8. More ...';
   cTXT0000209 = 'Select (0-8): ';  // [19]
   
   cTXT0000210 = '1. Print Labels'    ;
   cTXT0000211 = '2. Realtime Info'   ;
   cTXT0000212 = '3. Consume VMI'     ;
   cTXT0000213 = '4. Fixed Asset Inv.';
   cTXT0000214 = '6. User Profile'    ;
   cTXT0000215 = '7. Custom Codes'    ;
   cTXT0000216 = 'Print Label? (Y/N):';  // [19]
   cTXT0000217 = 'Invalid Serial # %s';  // [Wrapped]
   cTXT0000218 = 'Invalid Serial # %.0f'; // [Wrapped]
   cTXT0000219 = 'Unable to locate Arinvt ID = %.0f';    // [Wrapped]

   cTXT0000220 = '0-Cancel:'; // [19]
   cTXT0000221 = 'Print Labels';
   cTXT0000222 = '1.MFG Item'          ;
   cTXT0000223 = '2.Raw Material'      ;
   cTXT0000224 = '3.Re-Label Inventory';
   cTXT0000225 = '4.Pallet';
   cTXT0000226 = 'Select (0-4): ';   // [19]
   cTXT0000227 = 'Select (0-3): ';   // [19]
   cTXT0000228 = 'MFG Item Labels';
   cTXT0000229 = 'From:';

   cTXT0000230 = '1. Sales Order';
   cTXT0000231 = '2. Work Order' ;
   cTXT0000232 = '3. Item Number';
   cTXT0000233 = '4. RealTime'   ;
   cTXT0000234 = 'Work Cntr:';
   cTXT0000235 = 'Re-Label Inv';
   cTXT0000236 = '1.Manufactured';
   cTXT0000237 = '2.Pallet'      ;
   cTXT0000238 = 'Scanned label has been already dispositioned';
   cTXT0000239 = 'Pallet Label';
   
   cTXT0000240 = 'Raw Mtrl Label';
   cTXT0000241 = 'Enter Item Number';
   cTXT0000242 = 'Inventory Item';
   cTXT0000243 = 'Not found <Enter>';  // [20]
   cTXT0000244 = 'Print Labels by Item';
   cTXT0000245 = 'Label belongs to Packing Slip';
   cTXT0000246 = '1-Accept, 2-Edit';  // [20]
   cTXT0000247 = 'Scan Qty (%f)';
   cTXT0000248 = 'Scan RG Qty (%f)';
   cTXT0000249 = 'Cartons/Pallet: '; // [16]
   cTXT0000250 = 'Pieces/Carton: ';  // [16]
   cTXT0000251 = 'Label Qty: ';      // [16]
   cTXT0000252 = 'New Value';        // [20]
   //cTXT0000253 = '';
   cTXT0000254 = '2-Edit, 3-Label Qty'; // [19]
   cTXT0000255 = 'This box is part of a pallet. All the other boxes on the pallet will have to be scanned individually.';
   cTXT0000256 = 'Label Quantity';
   cTXT0000257 = 'Label Cancelled';
   cTXT0000258 = 'Pick Tickets By SN';
   cTXT0000259 = 'How Many? ';
   cTXT0000260 = 'RF Default Label';
   cTXT0000261 = '2-Set Printer ';
   cTXT0000262 = '0-Cancel, 1-OK:'; // [19]
   cTXT0000263 = 'MFG Item Label';
   cTXT0000264 = 'Pk Ticket # ';
   cTXT0000265 = 'MFG #:';  // [12]
   cTXT0000266 = 'Invalid Mode: ';
   cTXT0000267 = 'No Default MFG #'    ;
   cTXT0000268 = 'Unable to Print MFG' ;
   cTXT0000269 = 'Label - Use Raw Mtrl';
   cTXT0000270 = 'Label'               ;
   cTXT0000271 = 'Package Qty';
   cTXT0000272 = 'Scan Mode: %s';
   cTXT0000273 = '2-Set Printer 3-Edit'; // 11-21 = '2-Set Printer'
   cTXT0000274 = 'Last Scan (%s)';
   cTXT0000275 = 'IQ WMS - LOGON ';
   cTXT0000276 = 'Ver: ';
   cTXT0000277 = 'User Name: ';
   cTXT0000278 = 'Password : ';
   cTXT0000279 = 'Processing Login...';
   cTXT0000280 = 'Failed to lock IQMS-IQWin32 handle in shared mode. You are logged as IQMS - proceed with caution';
   cTXT0000281 = 'Unable to run application.'#13#13'Possible cause - database is exclusively locked by a DBA for data structure modifications.';
   cTXT0000282 = 'Please contact      IQ Management System Inc to verify the  license agreement.';
   cTXT0000283 = '    Move Material   ';
   cTXT0000284 = '1. Pick Item by Item#';
   cTXT0000285 = '2. Pick Item by SN';
   cTXT0000286 = '4. Put Away Items';
   cTXT0000287 = '5. Direct Move Item #';
   cTXT0000288 = '6. Direct Move SN';
   cTXT0000289 = '9. Edit Pallet';

   // iqrf_rscstr.cTXT0000292 {'Item not found'}

   cTXT0000290 = 'Select (0-11): '; // [19]
   cTXT0000291 = 'Pick for Move';
   cTXT0000292 = 'Item not found';
   cTXT0000293 = 'Pick Item to Move';
   cTXT0000294 = 'Virgin: ';
   cTXT0000295 = 'Regrind: ';
   cTXT0000296 = 'Move Item? (Y/N): '; // [19]
   cTXT0000297 = 'Loc: %s';
   cTXT0000298 = 'Lot #: %s';
   cTXT0000299 = 'InterPlant Move Conf';
   cTXT0000300 = 'Direct Move Confirm';
   cTXT0000301 = 'Source ';
   cTXT0000302 = 'Target ';
   cTXT0000303 = 'Quantity: %f';
   cTXT0000304 = 'RG Qty: %f';
   cTXT0000305 = 'Boxes: %f';
   cTXT0000306 = 'Serial # %s has not been dispositioned yet.';
   cTXT0000307 = 'From: %s';
   cTXT0000308 = 'Unable to locate FGMulti = %.0f';
   cTXT0000309 = 'Scanner Direct Move';
   cTXT0000310 = 'Scan Pallet Serial #';
   cTXT0000311 = '<Current Shift Only>';
   cTXT0000312 = 'Serial # %s belongs to Pallet# %s';
   cTXT0000313 = 'Serial # %s was used by Pick Ticket System';
   cTXT0000314 = 'Pallet Serial #';
   cTXT0000315 = 'Print Pallet';
   cTXT0000316 = 'Current Shift';
   cTXT0000317 = 'Select Prod';
   cTXT0000318 = '1. New Pallet';
   cTXT0000319 = '2. Edit/Print';

   cTXT0000320 = 'Scanned label does not match first scanned item #: %s';
   cTXT0000321 = 'Duplicated Scan!';
   cTXT0000322 = 'Circular reference. Pallet cannot contain itself.';
   cTXT0000323 = 'This label is used by Pick Ticket System';
   cTXT0000324 = 'Scanned label belongs to pallet serial #, %s';
   cTXT0000325 = 'Replace? (Y/N)';
   cTXT0000326 = 'Cannot proceed.  Serial #, %s, has not been dispositioned yet.';
   cTXT0000327 = 'Cannot proceed.  Serial #, %s, has been dispositioned.';
   cTXT0000328 = 'Serial # %s has no associated scanned labels.';
   cTXT0000329 = 'Del %s (Y/N)';
   cTXT0000330 = 'Pick Pallet';
   cTXT0000331 = 'Edit Existing Pallet';
   cTXT0000332 = '1.Add to Pallet';
   cTXT0000333 = '2.Edit Pallet'  ;
   cTXT0000334 = '3.Print Pallet' ;
   cTXT0000335 = 'Scan to Exist Pallet';
   cTXT0000336 = 'Descrip:';
   cTXT0000337 = 'Edit Pallet Quantity';
   cTXT0000338 = 'Cannot find master label [ID: %.0f]';
   cTXT0000339 = 'Edit Label Quantity';
   cTXT0000340 = 'Label Qty: ';
   cTXT0000341 = 'Enter Qty';
   cTXT0000342 = 'Serial# %s lot#, %s, does not match pallet lot#, %s';
   cTXT0000343 = 'Dispo To Pallet/Curr'; // Dispo Current Pallet
   cTXT0000344 = 'Dispo To Pallet';
   cTXT0000345 = 'Physical Inventory';
   cTXT0000346 = '1. Maintain Tags';
   cTXT0000347 = 'Maintain Tags';
   cTXT0000348 = 'Missing quantity and/or location';
   cTXT0000349 = 'Current State: ADJUSTED.  Must run: Begin Count.';
   cTXT0000350 = 'You must be associated with one of the existing EPlants in order to proceed';
   cTXT0000351 = '%s or does not belong to EPlant = %s';
   cTXT0000352 = 'Item not found in Master Inventory';
   cTXT0000353 = 'Qty: %f';
   cTXT0000354 = '1. Add Release'     ;
   cTXT0000355 = '2. Subtract Release';
   cTXT0000356 = '3. Edit Ticket Line';
   cTXT0000357 = '4. Cancel All Picks';
   cTXT0000358 = 'Revision: %s';
   cTXT0000359 = 'Serial # %s, location %s is marked non-conform';

   // iqrf_rscstr.cTXT0000378

   cTXT0000360 = 'Ship Qty: %f';
   cTXT0000361 = 'Picked  : %f';
   cTXT0000362 = 'Balance : %f';
   cTXT0000363 = 'Serial # %s, Item # %s belongs to PS# %s';
   cTXT0000364 = 'Serial # %s, Item # %s does not belong to Pick Ticket # %.0f';
   cTXT0000365 = 'Serial # %s - duplicated scan.';
   cTXT0000366 = 'Location description in Master Label is empty.  Cannot continue.';
   cTXT0000367 = 'Cannot subtract.  Serial # %s has no associated pick ticket release.';
   cTXT0000368 = 'Cannot subtract from ticket # %.0f.  Serial# %s is associated with ticket # %.0f.';
   cTXT0000369 = 'This option resets associated labels with the pick ticket %.0f and also deletes its picks';
   cTXT0000370 = '1-Del,2-Ship=Pick:';  // [19] NOTE: "Ship=Pick" means overwrite order quantity with shipped quantity;
                                        //            The pick ticket ships the quantity picked, not what has been backlogged.
   cTXT0000371 = 'Tkt# %.0f Item'; // Tkt# 12345 Item
   cTXT0000372 = 'Must Ship On: ';
   cTXT0000373 = 'Ship Qty: ';    // [16]
   cTXT0000374 = 'Picked Qty: ';  // [16]
   cTXT0000375 = 'Unable to locate Ticket_Detail_ID = %.0f';
   cTXT0000376 = 'This option deletes pick ticket detail record';
   cTXT0000377 = 'This option sets Ship qty = Pick qty';
   cTXT0000378 = 'Assigned quantity must be greater than 0';
   cTXT0000379 = '0-Cancel, 2-ShipVia';
   cTXT0000380 = '1-Convert to PS:';
   cTXT0000381 = 'Tkt# %0.f Ship Via';
   cTXT0000382 = 'Current Ship Via: ';
   cTXT0000383 = 'Ship Via';
   cTXT0000384 = 'Pick Ticket';
   cTXT0000385 = 'Enter Ticket #';
   cTXT0000386 = 'Ticket ID: ';
   cTXT0000387 = 'Customer #: ';
   cTXT0000388 = 'Address: ';
   cTXT0000389 = 'Ship On: ';
   cTXT0000390 = 'Picked Qty: '; // past tense
   cTXT0000391 = 'Tkt# %0.f Loc';
   cTXT0000392 = 'Enter Location:';
   cTXT0000393 = 'Default: ';
   cTXT0000394 = 'Qty to Pick: ';
   cTXT0000395 = 'Per Carton ';
   cTXT0000396 = 'Tkt# %0.f Scan Qty';
   cTXT0000397 = 'Left to Pick:';
   cTXT0000398 = 'Confirm Qty? (Y/N)'; // [19]
   cTXT0000399 = 'User Profile';
   cTXT0000400 = '1. Move Items';
   cTXT0000401 = '2. Disposition';
   cTXT0000402 = '3. Generic';
   cTXT0000403 = '4. Labels';
   cTXT0000404 = '5. Consume VMI';
   cTXT0000405 = '6. Pick Tickets';
   cTXT0000406 = '7. Setup Printer';
   cTXT0000407 = '8. Search';
   cTXT0000408 = 'User: ';
   cTXT0000409 = 'Profile Move Items';
   cTXT0000410 = 'Sort Loc Piklist by:';
   cTXT0000411 = 'Location (L) ';
   cTXT0000412 = 'Lot #    (N) ';
   cTXT0000413 = 'In Date  (D) ';
   cTXT0000414 = 'Pick Mode L/N/D';
   cTXT0000415 = 'Mode: By Serial #';
   cTXT0000416 = 'Available Modes: ';
   cTXT0000417 = 'By Serial (S)  ';
   cTXT0000418 = 'By Item # (I)  ';
   cTXT0000419 = 'Pick Mode S/I';
   cTXT0000420 = 'Dispo Pallet';
   cTXT0000421 = 'Allow Non-Prod';
   cTXT0000422 = 'Mode: By Item #';
   cTXT0000423 = 'By Carton Qty';
   cTXT0000424 = 'Verify Qty';
   cTXT0000425 = 'Consume  VMI Profile';
   cTXT0000426 = 'Prevent DblScan';
   cTXT0000427 = 'Profile Pick Tickets';
   cTXT0000428 = 'Convert to PS';  // Convert Packing Slip
   cTXT0000429 = 'No Prn on Conv'; // No Print on Convert (to Packing Slip)

   // iqrf_rscstr.cTXT0000438

   cTXT0000430 = 'No Prn BOL';
   cTXT0000431 = 'Generic Profile';
   cTXT0000432 = 'Strip Item #';
   cTXT0000433 = 'Show Confirm';
   cTXT0000434 = 'Use SN From Loc';
   cTXT0000435 = 'Prompt TranCode';
   cTXT0000436 = 'Prompt NC Code';
   cTXT0000437 = 'P Prefix';  // literally, "P" Prefix
   cTXT0000438 = 'Labels Profile';
   cTXT0000439 = '1.MFG Pallet        ';
   cTXT0000440 = '2.MFG RF            ';
   cTXT0000441 = '3.Purchased Pallet  ';
   cTXT0000442 = '4.Purchased RF      ';
   cTXT0000443 = '5.Pallet Creation   ';
   cTXT0000444 = '6.Attach to Inv Item';
   cTXT0000445 = 'Set Labels Profile';
   cTXT0000446 = 'Type: ';
   cTXT0000447 = 'Kind: ';
   cTXT0000448 = 'Currently Selected';
   cTXT0000449 = 'Menu Title: ';

   // iqrf_rscstr.cTXT0000469 {'2-Clear'}

   cTXT0000450 = 'File Name: ';
   cTXT0000451 = 'Customer: '; // may refer to Company name
   cTXT0000452 = '0-Cancel, 1-Edit:';
   cTXT0000453 = '0-Cancel, 1-Post:';
   cTXT0000454 = 'Edit Labels Profile';
   cTXT0000455 = 'Enter Menu Title';
   cTXT0000456 = 'Profile Pallet';
   cTXT0000457 = 'Pallet Label   (P)';
   cTXT0000458 = 'Scan to Pallet (S)';
   cTXT0000459 = 'Pick Mode P/S';
   cTXT0000460 = 'Profile Inv Label';
   cTXT0000461 = 'Inventory Label: ';
   cTXT0000462 = 'Profile Label:';
   cTXT0000463 = '2-Clear';
   cTXT0000464 = 'Select Item';
   cTXT0000465 = 'Printer Profile';
   cTXT0000466 = '1. Receive PO';
   cTXT0000467 = '2. Packing Slip';
   cTXT0000468 = '3. Crystal Labels';
   cTXT0000469 = 'Receive PO';

   // iqrf_rscstr.cTXT0000485

   cTXT0000470 = 'Packing Slip';
   cTXT0000471 = 'No default report assigned in System Parameters [%s]';
   cTXT0000472 = 'Report Descrip:';
   cTXT0000473 = 'Current Printer:';
   cTXT0000474 = 'Select Printer';
   cTXT0000475 = '0-Esc 1/%d-Select';
   cTXT0000476 = 'Select Printer:';
   cTXT0000477 = 'CRW Labels';
   cTXT0000478 = 'Profile Search Items';
   cTXT0000479 = 'Sort Loc Piklist by:';
   cTXT0000480 = 'Location (L)';
   cTXT0000481 = 'Lot #    (N)';
   cTXT0000482 = 'In Date  (D)';
   cTXT0000483 = 'RealTime Information';
   cTXT0000484 = 'Enter WorkCenter';
   cTXT0000485 = 'Center Not Found';
   cTXT0000486 = 'WC #: ';   // [7] This can stretch to 9 or 10, so let me know...
   cTXT0000487 = 'MFG #: ';  // [7] ...
   cTXT0000488 = 'Up: ';     // [7] ...
   cTXT0000489 = 'Dn: ';     // [7] ...
   cTXT0000490 = 'Std    Last    Avg'; // [20] Do your best with this: Standard, Last, Average
   cTXT0000491 = 'To Run: ';   // [15]
   cTXT0000492 = 'Hrs Left: '; // [15]
   cTXT0000493 = '5-DT';
   cTXT0000494 = 'DT-N/A';
   cTXT0000495 = '1-Setup, 4-FG Lot#:'; // [19]
   cTXT0000496 = 'Next Lot #: ';
   cTXT0000497 = 'Unknown BOM #.  Cannot continue.';
   cTXT0000498 = 'Change FG Lot #';
   cTXT0000499 = 'This MFG #: '; // [12]
   cTXT0000500 = '1-Next, 2-Scan: ';
   cTXT0000501 = 'RealTime Setup';
   cTXT0000502 = 'Work Center not found.'; // wrap
   cTXT0000503 = 'Pick Skid #';
   cTXT0000504 = 'Cancel All Picks: ';
   cTXT0000505 = 'Skid Serial #';
   cTXT0000506 = 'Receive Menu'; // or just "Receiving"
   cTXT0000507 = '1. PO'            ;
   cTXT0000508 = '2. Without PO'    ;
   cTXT0000509 = '3. Search/Recv PO';
   cTXT0000510 = 'Search PO';
   cTXT0000511 = 'PO #:'; // [12]
   cTXT0000512 = 'Pick for Receive'; // [20]
   cTXT0000513 = 'None';             // [20]
   cTXT0000514 = 'Add';              // [20]
   cTXT0000515 = 'Subtract';         // [20]
   cTXT0000516 = 'EditLine';         // [20]
   cTXT0000517 = 'CancelPicks';      // [20]
   cTXT0000518 = 'Pick Item to Receive';
   cTXT0000519 = 'Receiving an Item';
   cTXT0000520 = 'Post Receipt (Y/N):'; // [19]
   cTXT0000521 = 'Receiving Without PO';
   cTXT0000522 = 'Start Setup? (Y/N):';  // [19]
   cTXT0000523 = '%s day, %s'; // i.e., "1 day, 5 hours"
   cTXT0000524 = '%s days'; // i.e., "3 days"
   cTXT0000525 = 'Scan Code';
   cTXT0000526 = 'Edit Down Code';
   cTXT0000527 = ' (Y/N): '; // [8] Partial.  Usage:  AMsg + ' (Y/N): '.  This is used in a function.
   cTXT0000528 = 'Current: '; // [20]
   cTXT0000529 = 'Next: ';    // [20]
   cTXT0000530 = 'Cannot find ILLM_DWN record. WC # %s.'; // [wrapped] application error; users may/should never encounter this
   cTXT0000531 = 'Downtime Info'; // [20]
   cTXT0000532 = 'Open Interval'; // [20]
   cTXT0000533 = 'Down Since:';   // [20]
   cTXT0000534 = 'Down Time: ';   // [12]
   cTXT0000535 = 'Down Code: ';   // [12]
   cTXT0000536 = '1-Edit Code 3-Closed'; // [20]
   cTXT0000537 = '1-Edit Code';          // [20]  Shorter version of cTXT0000536
   cTXT0000538 = '2-Close/Reopen';       // [20]
   cTXT0000539 = 'Reopen Int?';          // [11] // important:  keep <= 11
   cTXT0000540 = 'Cannot find ILLM_DRT record. WC # %s.'; // [wrapped] application error; users may/should never encounter this;
   cTXT0000541 = 'Shift Closed Int'; // [20] "Shift Closed" Interval
   cTXT0000542 = 'Down Start/End:';  // [20]
   cTXT0000543 = '1-Edit Code, 4-Split';  // [20]
   cTXT0000544 = 'Closed Interval'; // [20]
   cTXT0000545 = 'Split Down Time';
   cTXT0000546 = 'Invalid Data Entry';
   cTXT0000547 = 'Enter Hours: '; // [18]
   cTXT0000548 = 'Enter Minutes: '; // [18]
   cTXT0000549 = 'Split Out Hours: '; // [17]
   cTXT0000550 = 'Enter Seconds: '; // [18]
   cTXT0000551 = 'Seconds: '; // [18]
   cTXT0000552 = 'Accept?'; // [11] = "Do you accept the value?"; this will be followed by ' (Y/N) '
   cTXT0000553 = 'Invalid Range Entry'; // [20]
   cTXT0000554 = 'Cannot find ILLM_DRT record.'; // [wrapped] application error; users may/should never encounter this;
   cTXT0000555 = 'Enter PO #';     // [20]
   cTXT0000556 = 'PO not found';  // [20]
   cTXT0000557 = 'PO not found ...'; // [20]
   cTXT0000558 = 'Receive Line Item';
   cTXT0000559 = 'Vendor: '; // [20]
   cTXT0000560 = 'Left to Recv: '; // [16] = "Left to Receive: "
   cTXT0000561 = 'Receive '; // [20] no colon
   cTXT0000562 = '2-Comment, 3-Track #'; // [20]
   cTXT0000563 = 'Receipt #:'; // [20]
   cTXT0000564 = 'Print Rec Tkt(Y/N):'; // [19]
   cTXT0000565 = 'Enter Trans Code'; // [20] = transaction code
   cTXT0000566 = 'Invalid Trans Code!'; // [20] = transaction code; can eliminate "!"
   cTXT0000567 = '0-Cancel,1-Retry:'; // [19] = Abort/cancel, or try again
   cTXT0000568 = 'Enter Comment:'; // [20]
   cTXT0000569 = 'Enter Track #:'; // [20] enter tracking number
   cTXT0000570 = 'Select Trans Type'; // [20] = "Select a Transaction Type"
   cTXT0000571 = '1. In  (Add)';     // [20] = "Transaction Type = IN (we are adding material)"
   cTXT0000572 = '2. Out (Scrap)';   // [20] = "Transaction Type = OUT (we are scrapping material)"
   cTXT0000573 = 'Transaction'; // [20]
   cTXT0000574 = 'Backflush'; // [20]
   cTXT0000575 = 'Header=';  //
   cTXT0000576 = 'Item #'; // no colon
   cTXT0000577 = 'This option removes item # %s from the pallet';
   cTXT0000578 = 'Location'; // [20]
   cTXT0000579 = 'Lot #'; // [10] no colon
   cTXT0000580 = 'Quantity'; // [20] no colon
   cTXT0000581 = 'Reason';  // [20]
   cTXT0000582 = 'Scan Lot #'; // 20
   cTXT0000583 = 'Confirm IN Trans';  // [20] = "Confirm IN Transaction"
   cTXT0000584 = 'Confirm OUT Trans'; // [20] = "Confirm OUT Transaction"
   cTXT0000585 = 'Header';
   cTXT0000586 = '3-Edit';
   cTXT0000587 = 'Unable to locate item ID = %.0f';
   cTXT0000588 = 'OUT Transaction';
   cTXT0000589 = 'Backflush Component';
   cTXT0000590 = 'IN Transaction';
   cTXT0000591 = 'Invalid Reject Code';
   cTXT0000592 = 'Use Picklist? (Y/N)';
   cTXT0000593 = 'Enter Reject Code';
   cTXT0000594 = 'Reject Code: '; // with colon
   cTXT0000595 = 'Item# (IN)';
   cTXT0000596 = 'Backflush (%d/%d)';
   cTXT0000597 = 'Item #: %s';
   cTXT0000598 = 'Search Menu';
   cTXT0000599 = '1. Find Item'       ;
   cTXT0000600 = '2. Find Item by AKA';
   cTXT0000601 = '4. Locations'       ;
   cTXT0000602 = '5. Query Label'     ;
   cTXT0000603 = 'Search by Item #';
   cTXT0000604 = '1-Locations: '; // [13]
   cTXT0000605 = 'Search Item by AKA';
   cTXT0000606 = 'Enter Cust Item #';
   cTXT0000607 = 'Not found'; // [20]
   cTXT0000608 = 'Cust Item #/Descrip:'; // [20]
   cTXT0000609 = 'Attn: %s';
   cTXT0000610 = 'Class/Rev: %s/%s';
   cTXT0000611 = 'Virgin: %s';
   cTXT0000612 = 'Packing Slip Label';
   cTXT0000613 = '0-Cancel,5-Reprint:'; // [19]
   cTXT0000614 = '0-Cancel, 5-Reprint'; // [20]
   cTXT0000615 = '2-Loc 1-Clr Pallet:'; // [19]
   cTXT0000616 = 'Belongs to a Pallet!'; // [20]
// cTXT0000617 = '3-Qty, 2-Pallet Loc'; // [20]
   cTXT0000617 = '3-Qty, 2-Loc, 6-UDef';
   cTXT0000618 = '4-Del, 5-Reprint: '; // [19] = 4-Delete, 5-Reprint
   cTXT0000619 = '2-Loc 3-Edit Qty: '; // [19] = 2-Location, 3-Edit Quantity
   cTXT0000620 = 'Query Label';
   cTXT0000621 = 'This option resets the pallet and all associated pallets';
   cTXT0000622 = 'Qty: '; // [9]
   cTXT0000623 = 'Date'; // [10] no colon
   cTXT0000624 = 'Loc'; // [10] = Location.  No colon.
   cTXT0000625 = 'Date In: ';
   cTXT0000626 = 'Search Location';
   cTXT0000627 = '3-Add, 0-Cancel:'; // [19]
   cTXT0000628 = '2-Pk List, 1-Retry:'; // [19]
   cTXT0000629 = 'Field %s - N/A';
   cTXT0000630 = 'Delete Rec? (Y/N): '; // [19]
   cTXT0000631 = '1-Select, 4-Delete:'; // [19]
   cTXT0000632 = '1-Select: '; // [19]
   cTXT0000633 = '%s - N/A';
   cTXT0000634 = 'Enter Search Value';
   cTXT0000635 = 'Items by %s '; // 
   cTXT0000636 = 'Clear Pallet:'; // [20]
   cTXT0000637 = 'Regrind: %s'; // regrind quantity
   cTXT0000638 = 'Packing Slips';
   cTXT0000639 = 'Pick from:';  // packing slips picklist
   cTXT0000640 = '1. Today''s date'   ;
   cTXT0000641 = '2. Tomorrow''s date';
   cTXT0000642 = '3. Enter Date'      ;
   cTXT0000643 = 'Pick List Date';
   cTXT0000644 = 'Enter MMDDYY'; // keep this date format
   cTXT0000645 = 'Nothing to Ship!';
   cTXT0000646 = 'Ship Destination';
   cTXT0000647 = '1-Ship It: '; // [19]
   cTXT0000648 = 'Process Packing Slip';
   cTXT0000649 = 'Order #: ';
   cTXT0000650 = 'To Ship: ';
   cTXT0000651 = '1-Pick, 4-Print: '; // [19]
   cTXT0000652 = '1-Pick: '; // [19]
   cTXT0000653 = 'No default ship location setup for this item';
   cTXT0000654 = 'Default Shipping Loc';
   cTXT0000655 = 'Go To Location';
   cTXT0000656 = 'Scan Serial # of Package/Skid Labels';
   cTXT0000657 = 'Belongs to Load';
   cTXT0000658 = 'Ship Anyway (Y/N):';
   cTXT0000659 = 'Creating PackSlip...';
   cTXT0000660 = 'Adding BOL Info...';
   cTXT0000661 = 'Printing PackSlip...';
   cTXT0000662 = 'Printing BOL...';
   cTXT0000663 = ' Consume VMI by S/N ';
   cTXT0000664 = '1. Express Mode     ';
   cTXT0000665 = '2. Confirm Mode     ';
   cTXT0000666 = 'Express'; // used in "VMI consume"
   cTXT0000667 = 'Confirm'; // used in "VMI consume"
   cTXT0000668 = 'marked as consumed.'; // = part of a screen, "Serial # XYZ marked as consumed"
   cTXT0000669 = 'Operation Aborted.';
   cTXT0000670 = 'Consume VMI %s'; // %s = Mode, "Express" or "Consume"
   cTXT0000671 = 'Error! Unable to locate serial # %s';
   cTXT0000672 = 'Last Processed';
   cTXT0000673 = 'Confirm Scan';
   cTXT0000674 = '2-Edit Quantity'; // [20]
   cTXT0000675 = 'New Quantity: '; // [19]
   cTXT0000676 = 'Received quantity exceeds release quantity';
   cTXT0000677 = '1. Change PO release';
   cTXT0000678 = '2. Add PO release(s)';
   cTXT0000679 = '1-Change';
   cTXT0000680 = '2-Add       0-Esc: ';
   cTXT0000681 = 'PO not approved ...';
   
   cTXT0000682 = 'D-PgDwn   U-PgUp ';
   cTXT0000683 = '0-Esc     Line#: ';
   cTXT0000684 = 'X-Del,    Line#: ';
   cTXT0000685 = 'Item #:';
   cTXT0000686 = 'Location';
   cTXT0000687 = 'Qty'; // no colon
   cTXT0000688 = 'Item/Location:';
   cTXT0000689 = 'Location/Item:';
   cTXT0000690 = 'Pick Item';
   cTXT0000691 = '8. Batch Transfer SN';
   cTXT0000692 = 'Batch Transfer';
   cTXT0000693 = 'Serial # %s not found';
   cTXT0000694 = 'Arinvt_ID is not assigned';
   cTXT0000695 = ''; {not in use. can be reused}
   cTXT0000696 = '# Labels: %d';
   cTXT0000697 = 'Item #  : %s';
   cTXT0000698 = 'Qty     : %f';
   cTXT0000699 = 'Confirm Transfer';
   
   cTXT0000700 = '  Target Loc: ';
   cTXT0000701 = '  # Labels  : ';
   cTXT0000702 = '  Item/Desc : ';
   cTXT0000703 = '  Class/Rev : ';
   cTXT0000704 = '  Total Qty : ';
   
   cTXT0000705 = 'Batch Transfer';
   cTXT0000706 = 'Item # mismatch';
   cTXT0000707 = 'Target Location'; // no colon
   
   cTXT0000708 = 'Printed: ';

   cTXT0000709 = 'Overlay Mode:';
   cTXT0000710 = 'None   (N)'   ;
   cTXT0000711 = 'Single (S)'   ;
   cTXT0000712 = 'Batch  (B)'   ;
   cTXT0000713 = 'Pick Mode N/S/B';
   
   cTXT0000714 = 'Confirm (Y/N):';
   cTXT0000715 = 'About to print label';

   cTXT0000716 = 'Error! Duplicate scan or Partial is disabled';
   
   cTXT0000717 = 'Allow Overship';
   cTXT0000718 = 'Overshipping';
   cTXT0000719 = 'ShipQty: %s';
   cTXT0000720 = 'Picked : %s';
   cTXT0000721 = '1-Repack 0-Cancel:';
   cTXT0000722 = 'Repacked labels';
   cTXT0000723 = 'Original : updated';
   cTXT0000724 = 'New label: created';
   cTXT0000725 = 'Print new label';
   cTXT0000726 = 'Repack Container';
   cTXT0000727 = 'Qty to Ship';
   cTXT0000728 = 'Scanned: %s';
   
   cTXT0000729 = 'Verify Order #';
   // cTXT0000730 = 'Sales Order# mismatch.'#13#13'Master Label:'#13'%s'#13'Pick Ticket:'#13'%s';
   
   cTXT0000731 = 'Re-Print original';
   
   cTXT0000732 = 'Mixed Label';
   cTXT0000733 = '1. Create New';
   cTXT0000734 = '2. Edit Existing';
   cTXT0000735 = 'Select (0-4): ';
   
   cTXT0000736 = 'SO/EDI info mismatch';
   cTXT0000737 = 'Master Label SO#: ';
   cTXT0000738 = 'Pick Ticket SO# : ';
   cTXT0000739 = 'Update Master Label SO/EDI data to match SO# %s?';
   cTXT0000740 = '1-Update 0-Cancel: ';

   cTXT0000741 = 'W/C:';
   
   cTXT0000742 = '5. Mixed Label';
   cTXT0000743 = 'Select (0-5): ';
   cTXT0000744 = 'Pk Mix Label';  
   cTXT0000745 = 'Serial #:';  
   cTXT0000746 = '';
   
   cTXT0000747 = 'Edit Mixed Label';  
   cTXT0000748 = '1. Add';  
   cTXT0000749 = '2. Delete';  

   cTXT0000750 = 'Scan Mode: %s';  
   //cTXT0000751 = '';  
   cTXT0000752 = 'Pk Ticket: %.0f';  
   cTXT0000753 = 'Labels Scan''d: %0.f';  
   
   cTXT0000754 = 'Scanned label already belongs to a pallet.';
   cTXT0000755 = 'Scanned label does not belong to pick ticket %.0f';
   cTXT0000756 = 'Scanned label is not marked ''dispositioned''.';
   cTXT0000757 = 'Package location does not match pallet.';
   cTXT0000758 = 'Scanned label does not belong to the mixed label.';
   cTXT0000759 = 'Scanned label location is empty.';
   
   //cTXT0000760 = 'Print Pallet(Y/N):';
   
   cTXT0000761 = 'New Ser# on Tkt';
   
   cTXT0000762 = 'Serial# %s location %s does not match pallet location %s';
   cTXT0000763 = 'Location not entered - Please enter location';                          

   cTXT0000764 = '2-Next 3-Prev';
   
   cTXT0000765 = 'Item# %s: more than one ticket line is found.';
   cTXT0000766 = 'Scan Seq #: ';
   cTXT0000767 = 'Seq# must be greater than 0.';
   cTXT0000768 = 'Error - Invalid Seq# entered.'; 

   cTXT0000769 = '8. Transactions'; 
   cTXT0000770 = 'Profile Transactions'; 
   cTXT0000771 = '3. Out (Adjust)';
   cTXT0000772 = 'OUT Adjust Trans';
   cTXT0000773 = 'Trans Code';
   
   cTXT0000774 = 'Allow Undership';
   cTXT0000775 = 'Undershipping';
   cTXT0000776 = 'Convert to PS failed';
   cTXT0000777 = 'Seq     : %s';
   cTXT0000778 = 'Ship Qty: %s';
   cTXT0000779 = 'Picked  : %s'; 

   cTXT0000780 = 'Prompt Seq';

   cTXT0000781 = 'Printer Name';
   
   cTXT0000782 = 'Pallet Prefix';
   cTXT0000783 = 'Old: ';
   cTXT0000784 = 'New: ';

   cTXT0000785 = 'Verify Reprint';
   cTXT0000786 = 'Verify Serial #';
   cTXT0000787 = 'Wrong Serial #!';
   cTXT0000788 = 'Press enter...';
   cTXT0000789 = 'Failed to verify Serial #';

   cTXT0000790 = 'Verify Pallet Count';
   cTXT0000791 = 'Pallet Count';
   cTXT0000792 = 'Current: %.0f';
   cTXT0000793 = 'New    : ';
   cTXT0000794 = 'This Pallet Qty' ;
   cTXT0000795 = 'Boxes Count';

   cTXT0000796 = 'Undefined RF Default Label';
   
   cTXT0000797 = 'This is a serialized inventory item with unknown location ID - unable to continue';
   cTXT0000798 = 'This pickticket includes serialized inventory controlled item and can be processed by Serial# only. Please change user profile and try again.';   
   
   cTXT0000799 = 'Unable to create list of required labels.';
   cTXT0000800 = 'There is 0 qty left to be picked for this pickticket.';
   cTXT0000801 = 'Note - there is an insufficient qty to cover the pickticket shipping balance.';
   cTXT0000802 = 'Note - there are no more labels to scan in current mode of operation (''%s'').';
   
   cTXT0000803 = '1. Print Label';
   cTXT0000804 = '2. Foreign Label';
   cTXT0000805 = 'Scan Foreign Serial#';
   cTXT0000806 = 'Serial # %s already exists - unable to continue';
   cTXT0000807 = 'Serial # %s exceeds 9 characters';
    
   cTXT0000808 = 'This is a serialized inventory item - the requested operation is not supported';
   cTXT0000809 = 'Serialized Serial # %.0f is not associated with any item';
   cTXT0000810 = 'Serialized Serial # %.0f qty is 0';
   cTXT0000811 = 'Serialized Serial # %.0f is assigned invalid fgmulti_id';

   // cTXT0000812 = '6-UDef';
   cTXT0000812 = '6-User Defined';
   
   cTXT0000813 = '1-Select, 5-Add:';
   cTXT0000814 = '1-Edit 4-Del 5-Add:';

   // cTXT0000815 = 'User Defined Fields';
   cTXT0000815 = 'UD Fields';
   cTXT0000816 = 'User Field 1:';
   cTXT0000817 = 'User Field 2:';
   cTXT0000818 = 'User Field 3:';
   cTXT0000819 = 'User Field 4:';
   cTXT0000820 = 'ID          :';
   
   cTXT0000821 = 'Scan to Mixed';
   cTXT0000822 = 'Mixed Label & PkTkt';

   cTXT0000823 = 'Serialized Item.';
   cTXT0000824 = 'No labels found.';

   cTXT0000825 = 'Label belongs to P/S %s - unable to continue';
   
   cTXT0000826 = 'WARNING! Picked location is marked as non conformed';

   cTXT0000827 = 'SHIPPED:';
   
   cTXT0000828 = 'Serial # %s, location %s is marked no-ship';
   
   cTXT0000829 = 'Physical Location';
   cTXT0000830 = 'You must select physical location that is about to be processed.';

   cTXT0000831 = 'Failed to initialize DispoServer.'#13'Correct the problem and restart IQRF.'#13;
   cTXT0000832 = 'This session has failed to communicate with DispoServer.'#13'Correct the problem and restart IQRF.';
   cTXT0000833 = 'This session is not communicating with DispoServer.'#13'Correct the problem and restart IQRF.';

   cTXT0000834 = 'Inv Location ID: ';
   
   cTXT0000835 = 'Invalid scan: %s must have prefix %s';
   cTXT0000836 = '4-Vendor Lbl, 5-Note'; // '4-Vendor Labels' ; // '4-Foreign Labels';
   
   cTXT0000837 = 'Select (0-1): ';    
   cTXT0000838 = 'Vendor Labels';  // 'Foreign Labels';
   cTXT0000839 = 'Labels Scanned: ';
   cTXT0000840 = 'Qty Scanned: ';
   cTXT0000841 = 'Balance    : ';
   // cTXT0000842 = 'Mismatch detected between entered receiving qty and total foreign labels qty. The receiving qty will be adjusted to match foreign labels.';
   cTXT0000842 = 'Mismatch between recv qty and total foreign labels qty.';
   cTXT0000843 = 'PO #';
   cTXT0000844 = 'Wrong label - Item # mismatch!';
   cTXT0000845 = 'RF Default label not found.';
   cTXT0000846 = 'Print Rec Lbl(Y/N):';
   
   cTXT0000847 = 'Initiating communication with DispoServer. Please wait...';
   cTXT0000848 = 'Cannot Ship a No-Ship Label.';

   cTXT0000849 = 'Pallet 2 Pallet';
   cTXT0000850 = 'Pallet cannot be dispositioned to a pallet.';

   cTXT0000851 = '10.Direct Move WO';
   cTXT0000852 = '11.Batch Transfer WO';
   cTXT0000853 = 'Direct Move WO';
   cTXT0000854 = 'Enter Workorder #';
   cTXT0000855 = 'Invalid Workorder #!';
   cTXT0000856 = 'Item does not belong to WO!';
   cTXT0000857 = 'Batch Transfer WO';
   
   cTXT0000858 = '4. Repack By SN';
   cTXT0000859 = 'Repack By SN';
   cTXT0000860 = 'Pallet cannot be repacked';
   cTXT0000861 = 'Location/Lot #: ';
   cTXT0000862 = 'Repack Qty';
   cTXT0000863 = 'How Many  ';
   cTXT0000864 = 'Qty must be greater than 0';
   cTXT0000865 = 'Repack count must greater than 0';
   cTXT0000866 = '1. Reprint Original';
   cTXT0000867 = '2. Print Repacked';  
   cTXT0000868 = '3. Set Printer';
   cTXT0000869 = 'Unable to print - RF default label not found';

   cTXT0000870 = 'Lot # is mandatory';
   cTXT0000871 = 'Unable to continue - missing mandatory field ''Lot #''.';

   cTXT0000872 = 'Entered qty exceeds label qty - unable to continue.'; 

   cTXT0000873 = 'This is a serialized inventory item - the label must be printed';
   
   cTXT0000874 = 'Use Dispo Svr';
   cTXT0000875 = 'Repack qty cannot exceed original qty';

   cTXT0000876 = 'PO Receiving';
   cTXT0000877 = 'Lot Prefix=L';
   cTXT0000878 = 'Missing mandatory lot prefix "L"';
   cTXT0000879 = 'Receipt Inspection Due!';
   cTXT0000880 = 'Attention';
   cTXT0000881 = '1-Reset Counter: ';
   cTXT0000882 = '0-Esc          : ';
   cTXT0000883 = 'Dispo Scan flag mismatch.';

   cTXT0000884 = 'Move By Workorder';
   cTXT0000885 = 'Workorder';
   cTXT0000886 = 'Must Be Sched';
   cTXT0000887 = 'Workorder must be scheduled!';
   cTXT0000888 = 'This serial number is scanned to pickticket - cannot repack';
   cTXT0000889 = 'Print Label';
   cTXT0000890 = 'Undefined target location';
   cTXT0000891 = '7. ICT Receiving';
   cTXT0000892 = 'ICT Receiving';
   cTXT0000893 = 'Confirm ICT Recv';
   cTXT0000894 = 'Serial# %s is not associated with any location';
   cTXT0000895 = 'Serial# %s is not in transit';
   cTXT0000896 = 'Serial# %s must point to a valid location id';                
   cTXT0000897 = 'Target location cannot be TRANSIT';
   cTXT0000898 = '2-Reprint SO Based';
   cTXT0000899 = 'Reprint SO Based';
   cTXT0000900 = 'Enter Sales Order#';
   cTXT0000901 = 'Item is not on the sales order';
   cTXT0000902 = 'Sales order not found';
   cTXT0000903 = 'On Cavity Change';
   cTXT0000904 = 'Generic (Continue)';
   cTXT0000905 = 'New Prod Rep';
   cTXT0000906 = 'RT Info (%d of %d)';
   cTXT0000907 = '6-Change Cavity';
   cTXT0000908 = '6-Change Multiplier';
   cTXT0000909 = 'Change Act Cavity';
   cTXT0000910 = 'Change Multiplier';
   cTXT0000911 = 'Current  : %.0f';
   cTXT0000912 = 'Change To: ';
   cTXT0000913 = 'Reset to zero?';
   cTXT0000914 = 'Value cannot be negative.';
   cTXT0000915 = 'Arinvt_ID = %.0f not found';
   
   cTXT0000916 = 'The following item does not exist in current eplant:'#13'Item#: %s'#13'Rev: %s'#13'Class: %s';

   cTXT0000917 = 'Encountered error while matching item eplant: invalid arinvt_id = %.0f. Unable to continue.';
   cTXT0000918 = 'EPlant mismatch - unable to continue.';

   cTXT0000919 = '3. Pick Item by UPC';
   cTXT0000920 = '7. Direct Move UPC';
   cTXT0000921 = 'Scan UPC Code';
   cTXT0000922 = 'Unable to locate UPC based arinvt_id = %.0f';
   cTXT0000923 = 'Enter UPC:'; // with colon
   cTXT0000924 = 'UPC Qty:';
   cTXT0000925 = 'UPC:';
   cTXT0000926 = '3. Find Item by UPC';
   cTXT0000927 = 'Select (0-5): ';
   cTXT0000928 = 'Search by UPC';
   cTXT0000929 = 'By UPC Code (U)';
   cTXT0000930 = 'Pick Mode S/I/D';

   cTXT0000931 = 'Use Pick Logic'; 
   cTXT0000932 = 'Ticket By Pick Logic';
   cTXT0000933 = 'Generated Pick Plan is empty. There is either insufficient inventory or no more outstanding pick ticket ship qty vs pick ticket releases.';
   
   cTXT0000934 = 'Tkt# %.0f';   // 'Ticket# %.0f';
   cTXT0000935 = 'Pick: %d/%d'; // 'Pick Step: %d/%d';
   cTXT0000936 = 'Go To Location:';
   cTXT0000937 = 'Lot#:';
   cTXT0000938 = 'OnHand:';
   cTXT0000939 = 'Pick:';
   cTXT0000940 = '1-Picked 2-Unable:';
   cTXT0000941 = '3-Loc OnHand 0-Esc';
   cTXT0000942 = 'Warning! %.0f pick ticket details do not have sufficient inventory to be picked from.';
   cTXT0000943 = 'Confirm Unable Y/N:';

   cTXT0000944 = '9. Receiving ';
   cTXT0000945 = 'Select (0-9): ';     
   cTXT0000946 = 'Profile Receiving';
   cTXT0000947 = 'Use PO UOM';

   cTXT0000948 = 'This is a serialized item. All labels on a pallet must be in the same location.';
   cTXT0000949 = 'Label %s has already been dispositioned and cannot be a pallet label.';
                                       
   cTXT0000950 = 'Invalid master label id = %.0f.';
   cTXT0000951 = 'Bkflush Rejects';

   cTXT0000952 = 'Check Dup Scan';
   
   cTXT0000953 = 'Ship Menu';
   cTXT0000954 = '1. PickTicket';
   cTXT0000955 = '4. Relieve PS Inv';
   cTXT0000956 = 'Enter PS#:';
   cTXT0000957 = 'Relieve PS Inv';
   cTXT0000958 = 'Invalid PS# %s';
   cTXT0000959 = 'PS# %s does not have any pending relieve inventory locations';
   cTXT0000960 = 'Relieve Inv?(Y/N):';

   cTXT0000961 = 'Item Loc not found';
   
   cTXT0000962 = '5. Scan Kanban Card';
   cTXT0000963 = 'Scan Kanban Card';
   cTXT0000964 = 'Scan Card';
   cTXT0000965 = 'Invalid Kanban Card %s';
   cTXT0000966 = 'Invalid Card Scan! The Kanban Card %s is already on order.';

   cTXT0000967 = 'Card #   :';
   cTXT0000968 = 'Qty      :';
   cTXT0000969 = 'Status   :';
   cTXT0000970 = 'Item/Desc:';
   
   cTXT0000971 = 'Inactive';
   cTXT0000972 = '1-OnHand 2-OnOrder:';
   cTXT0000973 = '1-OnHand          :';
   cTXT0000974 = '2-OnOrder         :';
   cTXT0000975 = '0-Esc';
   cTXT0000976 = 'Set Status To:';

   cTXT0000977 = 'Prompt LotDate';
   cTXT0000978 = 'Lot Date(MMDDYY)';  
   cTXT0000979 = 'Enter 6 digits representing date in the following format: MMDDYY.';  
   cTXT0000980 = '1-Accept 2-Edit:';
   cTXT0000981 = 'Confirm Date:';
   cTXT0000982 = 'Error encountered while processing Lot Date. ';
                            
   cTXT0000983 = 'Kanban Card %s is not assigned a PO';
   
   cTXT0000984 = 'StatusException';
   cTXT0000985 = 'Complete';
   cTXT0000986 = 'Overshipment';
   cTXT0000987 = 'Undershipment';
   cTXT0000988 = 'Seq#      :';
   cTXT0000989 = 'Ship Qty  :';
   cTXT0000990 = 'Picked Qty:';
   cTXT0000991 = 'Status    :';
   cTXT0000992 = 'Class/Rev :';
   cTXT0000993 = 'Pick Complete.';
   cTXT0000994 = '6. Pick Status';
   cTXT0000995 = 'Item #    :';

   cTXT0000996 = '7.Disposition Rules ';
   cTXT0000997 = 'Select (0-7): '; 
   cTXT0000998 = 'Profile Dispo Rules'; 
   cTXT0000999 = 'Dispo Mfg Label'; 
   cTXT0001000 = 'Verify Trg Loc'; 
   cTXT0001001 = 'Trans By Serial'; 
   cTXT0001002 = 'Serial#';
   cTXT0001003 = 'This label is associated with location %s';
   cTXT0001004 = 'IN/OUT pallet transactions are not supported';
   cTXT0001005 = 'Dispo Mat Label'; 
   cTXT0001006 = 'Hard Alloc To WO#:';
   cTXT0001007 = 'Alloc WO#: ';
   cTXT0001008 = 'Lot #: ';

   cTXT0001009 = 'Warning!';
   cTXT0001010 = 'Crossing Divisions';
   cTXT0001011 = 'From: '; 
   cTXT0001012 = 'To  : ';
   cTXT0001013 = '(N/A)';
   cTXT0001014 = 'Check Cross Div';
   cTXT0001015 = 'Auto Create EDI';
   cTXT0001016 = '5. Create EDI (ASN)';
   cTXT0001017 = 'Invalid Shipments ID %.0f. Unable to establish PS #';
   cTXT0001018 = 'Create EDI (ASN)';
   cTXT0001019 = 'PS#: ';
   cTXT0001020 = 'Enter PS#';
   cTXT0001021 = 'Invalid PS# %s.';
   cTXT0001022 = '[Item #]';
   cTXT0001023 = '[Segment]';
   cTXT0001024 = '[Value]';
   cTXT0001025 = 'Abort? (Y/N)';
   cTXT0001026 = '1-Next 0-Esc: ';
   cTXT0001027 = '2-Edit';
   cTXT0001028 = 'EDI (ASN) was not created due to runtime errors.';
   cTXT0001029 = 'Processing, please wait...';
   cTXT0001030 = 'Creating EDI file, please wait...';
   cTXT0001031 = 'No Template assigned, cannot continue';
   cTXT0001032 = 'No Outbound folder assigned, cannot continue';
   cTXT0001033 = 'Invalid Token Length';
   cTXT0001034 = 'No Ship To assigned, cannot continue';
   cTXT0001035 = 'ASN already created.';
   cTXT0001036 = 'Create another?';
   // cTXT0001037 = 'Not authorized to exceed production.';
   cTXT0001037 = 'Not authorized to proceed.';
   cTXT0001038 = 'Dispo By Item';

   cTXT0001039 = 'Prompt MTO WO';
   cTXT0001040 = '(Scan/Bkflush)';
   cTXT0001041 = 'MTO: ';
   
   cTXT0001042 = 'Define Menu Access';
   cTXT0001043 = 'Menu Option %s';
   cTXT0001044 = 'Access denied by your user profile';
   cTXT0001045 = 'MakeToOrder hard allocated inventory violation.  Transaction aborted.';

   cTXT0001046 = 'Label location is undefined and/or serialized item is not dispositioned, move is not allowed...';
   cTXT0001047 = 'Query Label(Dispo:%s)';

   cTXT0001048 = 'Label is marked as shipped - operation aborted.';
   cTXT0001049 = '5. Equip/Tool Loc';
   cTXT0001050 = 'Select (0-7): ';
   cTXT0001051 = 'Equip/Tool Loc';
   cTXT0001052 = 'Equip/Tool #';
   cTXT0001053 = 'Invalid Equip/Tool #';
   cTXT0001054 = 'Current Location';
   cTXT0001055 = '2. By Worksheet';
   cTXT0001056 = 'Physical Inventory must be based on a worksheet - unable to continue';
   cTXT0001057 = 'By Worksheet';
   cTXT0001058 = '1-New Tag   0-Esc:';
   cTXT0001059 = 'Not in Worksheet';
   cTXT0001060 = 'Master Locations';
   cTXT0001061 = 'Scan Item #:';
   cTXT0001062 = 'Select Tag';
   cTXT0001063 = 'Tag#: ';
   cTXT0001064 = 'Location/Lot#:';
   cTXT0001065 = 'Counted: ';
   cTXT0001066 = 'New Tag!';
   cTXT0001067 = 'Tag#: (counted)';
   cTXT0001068 = 'Scan Lot #:';
   cTXT0001069 = 'Whs:'; 
   cTXT0001070 = 'Div:';
   cTXT0001071 = 'Multiple Processes';
   cTXT0001072 = 'Pick Process';
   cTXT0001073 = 'Process#:';
   cTXT0001074 = 'Description:';
   cTXT0001075 = 'Item %s is consumed by multiple processes.';
                           
   cTXT0001076 = '1.Edit Ticket Line';
   cTXT0001077 = '3.Cancel All Picks';
   cTXT0001078 = '4.Pick Status';     

   cTXT0001079 = 'Missing mandatory field ''Lot Date''. [Item: %s, Loc: %s]';
   cTXT0001080 = 'Pallet Label Being Dispositioned!!';
   cTXT0001081 = 'Mfg Item#:';
   cTXT0001082 = 'Operation#:';
   cTXT0001083 = 'Item %s is consumed by multiple operations.';
   cTXT0001084 = 'Select ';
   cTXT0001085 = '3. Delete Tags';
   cTXT0001086 = 'Delete Tags';
   cTXT0001087 = '1-Delete   0-Esc: ';
   cTXT0001088 = 'No tag found associated with the scanned label.';
   cTXT0001089 = 'Missing mandatory lot number - operation aborted.';
   cTXT0001090 = '1. By Serial';
   cTXT0001091 = '2. By Item #';
   cTXT0001092 = 'In-Transit Src';
   cTXT0001093 = 'PS#: ';
   cTXT0001094 = 'Target Loc';
   cTXT0001095 = '  Qty:';
   cTXT0001096 = '  Source Loc:'; 
   cTXT0001097 = '  Target Loc:'; 
   cTXT0001098 = 'ICT Recv By Item';
   cTXT0001099 = 'Verify Item';
   cTXT0001100 = 'Item Verification';
   cTXT0001101 = 'Add New Tag(Y/N): ';
   cTXT0001102 = 'Box Count: %.0f';
   cTXT0001103 = 'Scan kind interference - operation aborted';
   cTXT0001104 = 'Process Dispatch %s not found';
   cTXT0001105 = 'Workorder %s not found';
   cTXT0001106 = 'Serial/Process/WO';
   cTXT0001107 = 'WO # %s has not been dispatched - operation aborted';
   cTXT0001108 = '%s Reporting';
   cTXT0001109 = 'WO#: ';
   cTXT0001110 = 'Process#: ';
   cTXT0001111 = 'Unknown or invalid inventory location';
   cTXT0001112 = 'Good Parts ';
   cTXT0001113 = 'Labor Hrs  ';
   cTXT0001114 = 'Lot #      ';
   cTXT0001115 = 'Comment    ';
   cTXT0001116 = 'Enter valid (0 or greater) number.';
   cTXT0001117 = 'Unknown employee - operation aborted';
   cTXT0001118 = 'Not ASSY1 or WO# %.0f not found';
   cTXT0001119 = 'Final Assembly';
   cTXT0001120 = 'Item #';

   cTXT0001121 = 'Override CrHold';

   cTXT0001122 = '1.Add by Item  (In)';
   cTXT0001123 = '2.Add by SN    (In)';    
   cTXT0001124 = '3.Scrap by Item(Out)';
   cTXT0001125 = '4.Scrap by SN  (Out)';  
   cTXT0001126 = '5.Adj by Item  (Out)';
   cTXT0001127 = '6.Adj by SN    (Out)';    
   cTXT0001128 = '7.Repack By SN';
   cTXT0001129 = '8.Scan Kanban Card';
                      
   cTXT0001130 = 'RMA By Serial#';
   cTXT0001131 = '5. RMA Return';
   cTXT0001132 = 'Receive RMA %s';
   cTXT0001133 = 'Enter RMA #';
   cTXT0001134 = 'Invalid RMA # - unable to continue';
   cTXT0001135 = 'Item # mismatch - operation aborted';
   cTXT0001136 = 'Item # does not belong to the RMA';
   cTXT0001137 = 'Item # is undefined';
   cTXT0001138 = 'Labels Count: %d';
   cTXT0001139 = 'Total Qty   : %f';
   cTXT0001140 = 'Total scanned qty exceeds RMA qty';
   cTXT0001141 = 'Receive RMA Item#:';
   cTXT0001142 = 'Lot# :';
   cTXT0001143 = 'Enter Qty';
   cTXT0001144 = 'Affect SO (Y/N): ';
   cTXT0001145 = '0-Esc            ';   
   cTXT0001146 = '1-PgUp 2-PgDown: ';
   cTXT0001147 = 'Verify Inv ID';
   cTXT0001148 = 'Scan Inventory ID';
   cTXT0001149 = 'Inventory ID Verification failed - operation aborted';
   cTXT0001150 = 'Inventory ID Verification failed - enter matching Inventory ID.';
   cTXT0001151 = 'Belongs to %s';
   cTXT0001152 = '7-Box #s  5-Reprint';
   cTXT0001153 = '6-User Defined 0-Esc';
   cTXT0001154 = 'Pallet Boxes';
   cTXT0001155 = 'Make-To-Order mismatch - operation aborted.';
   cTXT0001156 = 'Your password has expired. Since the grace period is set to UNLIMITED you will be allowed to proceed. Nevertheless it is recommended to change the password.';
   cTXT0001157 = 'Your EnterpriseIQ password expires in %d day(s). You need to change the password before the expire date.';
   
   cTXT0001158 = 'Hard Alloc';
   cTXT0001159 = 'InDate';
   cTXT0001160 = 'This is a serialized item. Receiving option in user profile must be by serial for return of a serialized item - operation aborted.';
   cTXT0001161 = 'You must print the label by selecting 1 - please try again';
   cTXT0001162 = 'This is a serialized item - you must print the label(s).';
   cTXT0001163 = 'This is a serialized item - total labels qty must be the same as qty received [ %f ]';
   
   cTXT0001164 = '1-Accept 2-Edit:';
   cTXT0001165 = 'Invalid or not supported option for ASSY3 MfgType - operation aborted.';
   cTXT0001166 = '2.Search Ticket Item';
   cTXT0001167 = 'Override CrLimt'; // 05-19-2010 'Override CrHold';
   cTXT0001168 = 'WO# and Item# mismatch - operation aborted';
   cTXT0001169 = 'Some EnterpriseIQ files were found to be out of date. They must be updated based on Master Home directory content.';
   cTXT0001170 = 'View note? (Y/N): ';
   cTXT0001171 = 'Location is occupied and does not support multiple pallets!';
   cTXT0001172 = 'Pallet Ser#';

   cTXT0001173 = 'Location is marked NO-SHIP - operation aborted';
   cTXT0001174 = 'Verify Scans';
   cTXT0001175 = '4. Verify Scans';
   cTXT0001176 = '8. Verify Scans';
   cTXT0001177 = 'Error: Pick Ticket mismatch!';
   cTXT0001178 = 'Verify Summary';
   cTXT0001179 = '1. Print Report';
   cTXT0001180 = '2. Clear All';
   cTXT0001181 = 'Clear (Y/N): ';
   cTXT0001182 = 'No more jobs found.';
   cTXT0001183 = 'Scanner Direct Move - Move To Non-Conform';
   cTXT0001184 = 'Scanner Direct Move - Move From Non-Conform';
   cTXT0001185 = 'Serial number is not found in inventory';

   cTXT0001186 = 'Ignore Prefix';
   cTXT0001187 = 'ASN By Ship#';
   cTXT0001199 = '6. Receive ASN';
   cTXT0001200 = 'Receive ASN';
   cTXT0001201 = 'Enter Shipment#';
   cTXT0001202 = 'Shipment# not found - unable to continue';
   cTXT0001203 = 'Serial# not found - unable to continue';

   cTXT0001204 = 'Shipment#: ';
   cTXT0001205 = 'Vendor#: ';
   cTXT0001206 = '# Cartons: ';
   cTXT0001207 = 'Supplier Ref: ';
   cTXT0001208 = 'Location: ';

   cTXT0001209 = 'PO#: ';
   cTXT0001210 = 'Item#/Description:';

   cTXT0001211 = 'Invalid Card Scan! The Kanban Card status is ''Pending Accumulation''.';
   cTXT0001212 = 'Show Confirm';
   cTXT0001213 = 'Confirm Scan To Inv';
   cTXT0001214 = 'Repacking';
   cTXT0001215 = 'Original: %s';
   cTXT0001216 = 'Entered : %s';
   cTXT0001217 = '1-Repack 0-Esc: ';
   cTXT0001218 = '1-Reprint 0-Esc: ';
   
   cTXT0001219 = 'Prompt Rel HA';
   cTXT0001220 = 'Existing Hard Alloc';
   cTXT0001221 = 'Found %.0f existing hard allocations.';
   cTXT0001222 = '1-Realloc 0-Esc: ';
   cTXT0001223 = 'RMA Serial Lot';

   cTXT0001224 = 'Mixed Pallet Label'; 
   cTXT0001225 = 'Repack Prn Orig';
   cTXT0001226 = 'Repack Prn New';
   cTXT0001227 = 'Tran Multi Item';
   
   cTXT0001228 = '# Items : %d';   
   cTXT0001229 = 'Last    : %s';   
   cTXT0001230 = 'Trg Loc : ';
   
   cTXT0001231 = '5. Verify Scans';
   cTXT0001232 = '4. LM Labels';
   cTXT0001233 = 'LM Labels';

   cTXT0001234 = 'Expecting:';
   cTXT0001235 = 'Found:';
   cTXT0001236 = '1-Release 0-Cancel:';
   cTXT0001237 = '2-Continue';
   cTXT0001238 = 'Location Mismatch';
   cTXT0001239 = 'Receive ASN';
   cTXT0001240 = '1. ASN By Shipment';
   cTXT0001241 = '2. ASN By Serial';
   cTXT0001242 = '2-Edit Qty';
   cTXT0001243 = 'Qty: %s';
   cTXT0001244 = 'Recv ASN By Serial';
   cTXT0001245 = 'Receive ASN By:';
   cTXT0001246 = 'Serial#   (N)';
   cTXT0001247 = 'Shipment# (Y)';
   cTXT0001248 = 'Both      (B)';
   cTXT0001249 = 'Pick Mode N/Y/B';
   cTXT0001250 = 'Mixed Lots';
   cTXT0001251 = 'You must change the password in order to continue. Please contact DBA for system access.';
   cTXT0001252 = 'Prompt Item#';
   cTXT0001253 = '1-Match Foreign: ';
   cTXT0001254 = '2-Delete 3-Add';
   cTXT0001255 = '4-Cancel Scans';
   cTXT0001256 = 'Del Foreign Label';
   cTXT0001257 = 'Serial# is not in this session list of scanned foreign labels.';
   cTXT0001258 = 'Serial# is not found in Master Label.';
   cTXT0001259 = 'Delete Label?(Y/N):';
   cTXT0001260 = 'This option deletes all foreign labels scanned in this session';
   cTXT0001261 = 'Repack?(Y/N) ';
   cTXT0001262 = 'Pick By UPC';
   cTXT0001263 = 'Ovrd Lot# FIFO';
   cTXT0001264 = 'Lot# FIFO Violation';
   cTXT0001265 = 'Must Use Lot#:';
   cTXT0001266 = '1-Ignore 0-Cancel: ';
   cTXT0001267 = '0-Cancel: ';
   cTXT0001268 = '8. Enterprise Plant';
   cTXT0001269 = 'Select (0-8): ';
   cTXT0001270 = 'Enterprise Plant';
   cTXT0001271 = 'Enterprise Plants are not set up - operation aborted.';
   cTXT0001272 = 'EPlant Name';
   cTXT0001273 = 'Location/OnHand:';
   cTXT0001274 = 'Verify Src Loc'; 
   cTXT0001275 = 'Label location is undefined and/or item is not dispositioned. Move is not allowed.';
   cTXT0001276 = '4. Receipt#';
   cTXT0001277 = 'Receive Receipt#';
   cTXT0001278 = 'Enter Receipt#';
   cTXT0001279 = 'Receipt#:';
   cTXT0001280 = 'Receipt Date:';
   cTXT0001281 = 'Vendor:';
   cTXT0001282 = 'Line#:';
   cTXT0001283 = 'No outstanding receipts found for Receipt# %s.';
   cTXT0001284 = 'Select Receipt';
   cTXT0001285 = 'Receipt# %s';
   cTXT0001286 = 'Receipt Qty:';
   cTXT0001287 = 'Promise Date:';
   cTXT0001288 = 'Chg Qty Rpck=N';
   cTXT0001289 = 'Update Label';
   cTXT0001290 = 'Insufficient rights - operation aborted.';
   cTXT0001291 = 'Direct Put Away';
   cTXT0001292 = '1. PO Directed';
   cTXT0001293 = '2. Receipt# Directed';
   cTXT0001294 = 'Go to Location:';
   cTXT0001295 = 'Scan Verification:';
   cTXT0001296 = 'Direct Put Away';
   cTXT0001297 = 'Invalid verification scan - please try again.';
   cTXT0001298 = 'Scan %d Labels';
   cTXT0001299 = 'Lot# mismatch';
   cTXT0001300 = 'Mismatch between recv qty and total put away labels qty.';
   cTXT0001301 = '1-Del 2-Add  ';
   cTXT0001302 = '0-Cancel   : ';
   cTXT0001303 = 'Cancel PutAway Label';
   cTXT0001304 = 'Cancel Label?(Y/N):';
   cTXT0001305 = '1. Print Labels';
   cTXT0001306 = 'Unable to find a location based on existing inventory rule sets';
   cTXT0001307 = 'Directed Pick (D)';
   cTXT0001308 = 'Directed Pick Ticket';
   cTXT0001309 = '5. Pick Status';
   cTXT0001310 = 'Direct Picking';
   cTXT0001311 = 'Case    : %s of %s';
   cTXT0001312 = 'Pallet  : %s of %s';
   cTXT0001313 = 'Label does not belong to the directed location';
   cTXT0001314 = 'Label does not belong to the directed transaction location';
   cTXT0001315 = '1. Add Release'     ;
   cTXT0001316 = '3. Cancel All Picks';
   cTXT0001317 = '4. Pick Status';
   cTXT0001318 = 'Allow Item Skip';
   cTXT0001319 = 'Reprint On Edit';
   cTXT0001320 = 'Maintain Tags';
   cTXT0001321 = '';  // 'FA# as Serial';  08-28-2103 obsolete
   cTXT0001322 = 'Verify (Silent)';
   cTXT0001323 = 'Ovrd NC Insp';
   cTXT0001324 = 'Recv In Batch';
   cTXT0001325 = 'Location/Lot#';
   cTXT0001326 = 'The location associated with the label in this transaction is no longer current - operation aborted.';
   cTXT0001327 = '9. Directed Task';
   cTXT0001328 = 'Directed Task';
   cTXT0001329 = 'Interleave';
   cTXT0001330 = 'Source: ';
   cTXT0001331 = 'Transaction#: ';
   cTXT0001332 = 'From: ';
   cTXT0001333 = 'To: ';
   cTXT0001334 = 'UOM       : ';
   cTXT0001335 = 'Start Location: ';
   cTXT0001336 = 'End Location: ';
   cTXT0001337 = 'Direct Pick';
   cTXT0001338 = 'There is a Remaining Balance'; 
   cTXT0001339 = 'Cancel Scanned Label';
   cTXT0001340 = 'Put Away?(Y/N): ';
   cTXT0001341 = 'Directed Put Away';
   cTXT0001342 = '0-Cancel   : ';
   cTXT0001343 = '0-Esc  1-OK: ';
   cTXT0001344 = '2-Add  3-Del ';
   cTXT0001345 = 'Direct Put Away';
   cTXT0001346 = 'Directed Task list has changed - please select another task';
   cTXT0001347 = 'Scan %d %s';
   cTXT0001348 = 'Total Qty: %.4f';
   cTXT0001349 = 'Qty   : %.4f';
   cTXT0001350 = 'RG Qty: %.4f';
   cTXT0001351 = 'Labels Scanned: ';
   cTXT0001352 = 'Qty Scanned: ';
   cTXT0001353 = 'Balance    : ';
   cTXT0001354 = 'The location selected ''%s'' does not match the assigned VMI Location ''%s'' - operation aborted.';
   cTXT0001355 = '0-Cancel  1-OK: ';
   cTXT0001356 = 'T-Trouble';
   cTXT0001357 = 'Trouble';
   cTXT0001358 = 'Trouble Put Away';
   cTXT0001359 = 'Location Inactive - Transaction Not Allowed.';
   cTXT0001360 = 'Pick Mode S/I';
   cTXT0001361 = 'Location is marked Inactive.';
   cTXT0001362 = 'Inactive Code.';
   cTXT0001363 = 'Not Lot# = Prod';
   cTXT0001364 = 'Zero Qty Entered';
   cTXT0001365 = '1-Retry    0-Esc: ';
   cTXT0001366 = '2-Continue';       
   cTXT0001367 = 'Label %s is missing mandatory lot number - operation aborted.';
   cTXT0001368 = 'Auto Match SO';
   cTXT0001369 = 'Mixed Pallet';
   cTXT0001370 = 'From: Mixed Pallet';
   cTXT0001371 = 'OutOfService(MMDDYY)';
   cTXT0001372 = 'OutOfService Reason';
   cTXT0001373 = 'Scan Shuttle';
   cTXT0001374 = 'Not a shuttle - unable to continue';
   cTXT0001375 = 'Not Found';
   cTXT0001376 = 'EPlant mismatch';
   cTXT0001377 = 'belongs to';
   cTXT0001378 = '%s (%s)';
   cTXT0001379 = 'Enforce Target Loc';
   cTXT0001380 = '1. Conform';
   cTXT0001381 = '2. Non Conform';
   cTXT0001382 = 'Master location is marked Non Conform - unable to continue';
   cTXT0001383 = 'Toggle to Conform';
   cTXT0001384 = 'Directed Move';
   cTXT0001385 = '2-Override T-Trouble';
   cTXT0001386 = 'FA Scan By Num';
   cTXT0001387 = 'Scan Fixed Asset #';
   cTXT0001388 = 'Invalid Serial # / Asset #';
   cTXT0001389 = 'Mixed Lot Pallet';
   cTXT0001390 = 'Not WO# = Prod';
   cTXT0001391 = '2-Override ';
   cTXT0001392 = 'Undef Trouble Loc';
   cTXT0001393 = 'Dimensional Inv';
   cTXT0001394 = 'Abort? (Y/N): ';
   cTXT0001395 = 'Date Out: ';
   cTXT0001396 = 'OutOfService Reason';
   cTXT0001397 = 'Reject To NonConform';
   cTXT0001398 = 'Scan/Add Labels';
   cTXT0001399 = '1-Scan  2-Add';
   cTXT0001400 = '3-Clear 0-Esc: ';
   cTXT0001401 = '4-Skip';
   cTXT0001402 = 'Scan Labels';
   cTXT0001403 = 'Qty: ';
   cTXT0001404 = 'Shuttle %s - unable to find serial# %s';
   cTXT0001405 = 'Label Qty';
   cTXT0001406 = 'Expected PO Receipt found. Please use Receipt# Directed';
   cTXT0001407 = 'Scanned serial# %s will be removed from pallet# %s';
   cTXT0001408 = 'Directed Batch Move';
   cTXT0001409 = 'Scan sample label to identify the item and source location.';
   cTXT0001410 = 'Missing location - operation aborted.';
   cTXT0001411 = 'Pallet type %s is not supported - operation aborted.';
   cTXT0001412 = 'Unable to find arinvt id = %.0f';
   cTXT0001413 = 'Total Batch Qty';
   cTXT0001414 = 'Unable to find location ID - operation aborted';
   cTXT0001415 = 'Unable to generate pending task list - operation aborted';
   cTXT0001416 = 'Insufficient rights - operation aborted.'#13#13'Form: %s'#13#13'Item: %s';
   cTXT0001417 = 'Lot Exp. Date';
   cTXT0001418 = 'Missing mandatory lot expiry date. Enter Exp. Date to continue.';
   cTXT0001419 = 'Item #:';
   cTXT0001420 = 'Lot #:';
   cTXT0001421 = 'Enter Exp. MMDDYYYY';
   cTXT0001452 = '0-Cancel, 1-OK:';
   cTXT0001453 = '2-Edit';
   cTXT0001454 = 'Change WMS Team';
   cTXT0001455 = 'Current Code/Descrip';
   cTXT0001456 = 'Select WMS Team';
   cTXT0001457 = 'Code/Descrip';
   cTXT0001458 = '9. Change WMS Team';
   cTXT0001459 = 'New Code/Descrip';
   cTXT0001460 = 'Qty: ';
   cTXT0001461 = 'Ret Code: ';
   cTXT0001462 = 'PS#: ';
   cTXT0001463 = 'RMA Detail';
   cTXT0001464 = 'Directed Task By:';
   cTXT0001465 = 'Priority  (P)';
   cTXT0001466 = 'Proximity (X)';
   cTXT0001467 = 'Select P/X';
   cTXT0001468 = 'Lot Mismatch!'#13+'Expected: %s'#13+'Scanned: %s';
   cTXT0001469 = 'Pick Cycle Count';
   cTXT0001470 = 'Cycle Count ID:';
   cTXT0001471 = 'Method:';
   cTXT0001472 = 'EPlant:';
   cTXT0001473 = 'Division:';
   cTXT0001474 = 'You must select Cycle Count ID - operation aborted.';
   cTXT0001475 = 'Current State: %s.  Must run: Begin Count.';
   cTXT0001476 = 'Current State:';
   cTXT0001477 = 'Prompt Reason';
   cTXT0001478 = 'Enter Trans Reason';
   cTXT0001479 = 'Unable to determine Vendor VMI Location associated to PO Detail ID %.0f';
   cTXT0001480 = 'VMI Locations';
   cTXT0001481 = 'Location:';
   cTXT0001482 = 'Description:';
   cTXT0001483 = 'Division/Warehouse:';               
   cTXT0001484 = 'Unable to determine single Vendor VMI Location associated to PO Detail ID %.0f';
   cTXT0001485 = 'Pallets';               
   cTXT0001486 = 'Cases';               
   cTXT0001487 = 'Eaches';               
   cTXT0001488 = 'Enter Total %s';               
   cTXT0001489 = 'Reprint Silent';
   cTXT0001490 = 'Hard allocated labels must be scanned first.';
   cTXT0001491 = 'User is not associated to work zone - operation aborted';
   cTXT0001492 = 'Unable to determine scanner location and transaction id';
   cTXT0001493 = 'Receipt Qty:%8.2f';
   cTXT0001494 = 'Labels Qty :%8.2f';
   cTXT0001495 = '1-Edit      0-Esc: ';
   cTXT0001496 = '2-Continue';
   cTXT0001497 = 'MoveTo Ship Loc';
   cTXT0001498 = 'Move SN to Ship Loc'; //  on Pick Ticket Scan
   cTXT0001499 = 'No Rprnt Silent';
   cTXT0001500 = 'Label does not belong to the directed location/lot #';
   cTXT0001501 = 'Print Label?';
   cTXT0001502 = '1-Print 0-Esc  : ';
   cTXT0001503 = '2-Print & Dispo';
   cTXT0001504 = '4.Print/Dispo Pallet';
   cTXT0001505 = '2-Continue  3-Add';
   cTXT0001506 = 'Label belongs to VMI location - operation cancelled.';
   cTXT0001507 = '3. RMA Return';
   cTXT0001508 = '4. ICT Receiving';
   cTXT0001509 = 'Cartons : %s';
   cTXT0001510 = 'Staging Location:';
   cTXT0001511 = '<Unknown>';
   cTXT0001512 = '0-Cancel 1-OK: ';
   cTXT0001513 = '2-Change';
   cTXT0001514 = 'No location assigned - unable to continue';
   cTXT0001515 = '7. Move Picked Inv';
   cTXT0001516 = '5. Move Picked Inv';
   cTXT0001517 = 'Move';
   cTXT0001518 = 'Move PT %d Inv';
   cTXT0001519 = 'Nothing found to be moved - operation cancelled';
   cTXT0001520 = '2. Move PT Inv';
   cTXT0001521 = '3. Move PS Inv';
   cTXT0001522 = 'Move PT Inv';
   cTXT0001523 = 'Enter PT#:';
   cTXT0001524 = 'Invalid PT# - please try again';
   cTXT0001525 = 'Move PS %d Inv';
   cTXT0001526 = 'Move PS Inv';
   cTXT0001527 = 'Enter PS#:';
   cTXT0001528 = 'Invalid PS# - please try again';
   cTXT0001529 = 'Pack Slip has no inventory to be verified';
   cTXT0001530 = 'Direct Pick - ';
   cTXT0001531 = 'Loc: %s';
   cTXT0001532 = 'Lot: %s';
   cTXT0001533 = '0-Esc   1-Print: ';
   cTXT0001534 = '2-Foreign Label ';
   cTXT0001535 = 'How Many? :';
   cTXT0001536 = 'Scanned : ';
   cTXT0001537 = 'Insufficient label count.'#13'Scanned : %d Required: %d';
   cTXT0001538 = '1-Cancel 2-Add: ';
   cTXT0001539 = 'Required: ';
   cTXT0001540 = 'Foreign Labels';
   cTXT0001541 = '4.Foreign Labels';
   cTXT0001542 = '5.Pallet';
   cTXT0001543 = 'User: ';      
   cTXT0001544 = '4-Foreign Labels';
   cTXT0001545 = '3. Foreign Labels';
   cTXT0001546 = 'Sort Pick By Loc/Seq';
   cTXT0001547 = 'By Loc (L)';
   cTXT0001548 = 'By Seq (S)';
   cTXT0001549 = 'Select (L/S)';
   cTXT0001550 = 'Repack/Merge';
   cTXT0001551 = '1. Repack';
   cTXT0001552 = '2. Merge';
   cTXT0001553 = 'Repack';
   cTXT0001554 = 'Merge';
   cTXT0001555 = 'Repack Single Case';
   cTXT0001556 = 'Repack Pallet';
   cTXT0001557 = 'Merge Full Case';
   cTXT0001558 = 'Merge Full Pallet';
   cTXT0001559 = 'Loc: ';
   cTXT0001560 = 'Lot#: ';
   cTXT0001561 = 'Qty: ';
   cTXT0001562 = 'Cases: ';
   cTXT0001563 = 'Pack: ';
   cTXT0001564 = 'Item/Desc/Class/Rev:'; 
   cTXT0001565 = '1-Reprint 0-Esc : ';
   cTXT0001566 = '2-Print 3-Foreign ';
   cTXT0001567 = 'Repack: ';
   cTXT0001568 = 'Reprint option with updated qty will be available once repacking is complete';
   cTXT0001569 = 'Serial# %s does not belong to the pallet %s';
   cTXT0001570 = 'Merge To';
   cTXT0001571 = 'Merge To: ';
   cTXT0001572 = 'Item# mismatch - operation aborted';
   cTXT0001573 = 'Lot# mismatch - operation aborted';
   cTXT0001574 = 'Cases';
   cTXT0001575 = 'Partial';
   cTXT0001576 = 'Pack (%s)';
   cTXT0001577 = 'Merge labels';
   cTXT0001578 = '0-Esc  1-Full: ';
   cTXT0001579 = '2-Partial';
   cTXT0001580 = 'Merge Partial Case';
   cTXT0001581 = 'Merge Partial Pallet';
   cTXT0001582 = 'Merge Qty';
   cTXT0001583 = 'Merge qty must be greater than 0';
   cTXT0001584 = 'Metge qty cannot exceed original qty';
   cTXT0001585 = 'Merge Single Case';
   cTXT0001586 = 'Merge Pallet';
   cTXT0001587 = 'Merge Qty: ';
   cTXT0001588 = '1-RePrn Trg 0-Esc: ';
   cTXT0001589 = '2-RePrn Src';
   cTXT0001590 = 'Merge: ';
   cTXT0001591 = 'Partial pallet merge';
   cTXT0001592 = 'Staging Locations';
   cTXT0001593 = 'Location';
   cTXT0001594 = 'Pk Unit';
   cTXT0001595 = 'Enter Location';
   cTXT0001596 = 'Planned Location';
   cTXT0001597 = 'Change Staging Loc';
   cTXT0001598 = '0-Esc  Edit Line#: ';
   cTXT0001599 = 'Last SN: %s'; 
   cTXT0001600 = 'Qty exceeds transit amount - unable to continue'; 
   cTXT0001601 = '1-Dealloc  0-Skip: '; 
   cTXT0001602 = 'Hard Allocated To WO'; 
   cTXT0001603 = 'WO#: '; 
   cTXT0001604 = 'Deallocate on repack'; 
   cTXT0001605 = '0-Esc   1-Foreign: '; 
   cTXT0001606 = 'Foreign Label'; 
   cTXT0001607 = 'Locate Plan #:'; 
   cTXT0001608 = 'Shipping Dock';
   cTXT0001609 = 'Default Shipping Loc';
   cTXT0001610 = '1-Change    0-Esc: ';
   cTXT0001611 = 'Failed to regenerate replacement for location %s. %s';
   cTXT0001612 = 'Back In Srvc(MMDDYY)';
   cTXT0001613 = 'Back In Service Date must be later than Out of Service';
   cTXT0001614 = 'Back In: ';
   cTXT0001615 = 'Repack';
   cTXT0001616 = 'Merge';
   cTXT0001617 = 'MTO hard allocated inventory violation, SN %s - operation aborted.';
   cTXT0001618 = 'MTO hard allocated inventory violation, SN %s on Pallet SN %s, Sales Order/Seq: %s not on Pick Ticket, Sequence # %s - operation aborted.';
   cTXT0001619 = 'Move PT By SN';
   cTXT0001620 = 'SN %s does not belong to the PT or has been already scanned.';
   cTXT0001621 = 'Scanned     : ';
   cTXT0001622 = 'Required    : ';
   cTXT0001623 = 'In Location : ';
   cTXT0001624 = 'Total Labels: ';
   cTXT0001625 = 'Move PT Inventory By SN';
   cTXT0001626 = 'Move To: ';
   cTXT0001627 = '# Labels: ';
   cTXT0001628 = 'On Scanner  : ';
   cTXT0001629 = 'Non-conform status mismatch - operation aborted';
   cTXT0001630 = 'Non-allocate status mismatch - operation aborted';
   cTXT0001631 = '2-Change ';
   cTXT0001632 = '0-Esc       1-OK: ';
   cTXT0001633 = '0-Esc            :';
   cTXT0001634 = '1-Print 2-Foreign ';
   cTXT0001635 = '0-Esc   1-Reprint:';
   cTXT0001636 = '# Partials: ';
   cTXT0001637 = 'Total Quan: ';
   cTXT0001638 = 'Non-Conform Status';
   cTXT0001639 = 'Non-Conform Reason';
   cTXT0001640 = 'Non-Allocate Status';
   cTXT0001641 = 'Non-Allocate Reason';
   cTXT0001642 = 'Violation';
   cTXT0001643 = 'Source:';
   cTXT0001644 = 'Target:';
   cTXT0001645 = 'CONFORMING';
   cTXT0001646 = 'NON-CONFORMING';
   cTXT0001647 = 'ALLOCATABLE';
   cTXT0001648 = 'NON-ALLOCATABLE';
   cTXT0001649 = 'Backflush';
   cTXT0001650 = 'Required:';
   cTXT0001651 = 'Scanned:';
   cTXT0001652 = '# of Labels: ';
   cTXT0001653 = 'Wrong item # ';
   cTXT0001654 = 'Scanned label belongs to a pallet.';
   cTXT0001655 = '0-Esc    1-Add: ';
   cTXT0001656 = '2-Del    3-Clear';
   cTXT0001657 = 'Clear %s scanned labels?';
   cTXT0001658 = 'Out of Balance';
   cTXT0001659 = 'Backflush (Add)';
   cTXT0001660 = 'Backflush (Del)';
   cTXT0001661 = 'The label is not in the list of scanned labels for selected item.';
   cTXT0001662 = '0-Cancel  1-Edit: ';
   cTXT0001663 = 'Required   : ';
   cTXT0001664 = 'Backflush information is complete.';
   cTXT0001665 = '2-Edit';
   cTXT0001666 = 'The label(s) in this transaction are already associated to a location - operation aborted.';
   cTXT0001667 = 'This serial number is scanned to pickticket - continue repack?';
   cTXT0001668 = 'Warning';
   cTXT0001669 = 'Overship Not Allowed';
   cTXT0001670 = 'Directed Dispo';
   cTXT0001671 = '6. Recalc Plan';
   cTXT0001672 = 'Recalc Trans Plan';
   cTXT0001673 = 'This option recalculates transaction plan for unprocessed picks for ticket %.0f';
   cTXT0001674 = 'Deallocate on move out'; 
   cTXT0001675 = 'Pallet Stack: ';
   cTXT0001676 = 'Deallocate on subtract pickticket release';
   cTXT0001677 = '7. Verify Scans';
   cTXT0001678 = 'Verify Scans';
   cTXT0001679 = 'Select MfgCell';
   cTXT0001680 = 'RTI Trans Code';
   cTXT0001681 = 'Pick RTI Trans Code';
   cTXT0001682 = 'Trans Code:';
   cTXT0001683 = 'Code Description:';
   cTXT0001684 = 'EPlant ID:';
   cTXT0001685 = 'Enter RTI Trans Code';
   cTXT0001686 = '1-Edit  0-Continue:';
   cTXT0001687 = '<Not Assigned>';
   cTXT0001688 = 'RTI';
   cTXT0001689 = 'Return To Inventory';
   cTXT0001690 = 'Return Qty';
   cTXT0001691 = 'Return qty must be greater than 0';
   cTXT0001692 = 'Return Qty: ';
   cTXT0001693 = '3. RTI';
   cTXT0001694 = 'Unable to find original hard allocation transaction - operation cancelled';
   cTXT0001695 = '4. Bulk Repack';
   cTXT0001696 = 'Bulk Repack';
   cTXT0001697 = 'Scanned serial must not be a pallet - operation aborted.';
   cTXT0001698 = 'Not a bulk pallet - operation aborted.';
   cTXT0001699 = 'Total Bulk Labels:';
   cTXT0001700 = 'Total Cases:';
   cTXT0001701 = 'Select Pallet';
   cTXT0001702 = 'No bulk pallets are available for pick list - operation aborted';
   cTXT0001703 = 'Bulk SN#';
   cTXT0001704 = 'Total labels qty cannot exceed bulk pallet qty - operation aborted';
   cTXT0001705 = 'Scan Bulk Pallet SN#';
   cTXT0001706 = 'Reprint Original SN#';
   cTXT0001707 = 'Total Qty:';
   cTXT0001708 = 'Pallets Scanned';
   cTXT0001709 = 'Print Box Labels';
   cTXT0001710 = 'Print Pallet';
   cTXT0001711 = 'Serial # %s exceeds %d characters';
   cTXT0001712 = 'One or more inventory locations associated to this PT are marked non-conform.  Operation Aborted.';
   cTXT0001713 = 'Serial # %s is not in the list of consumable serials or has already been consumed.';
   cTXT0001714 = 'Create Target Pallet';
   cTXT0001715 = 'This location is linked to another MRB - transaction cancelled.';
   cTXT0001716 = 'Serial # %s is part of an outsource process or is pending verification for Packing Slip # %s';
   cTXT0001717 = 'Serial number has already been allocated to the workorder, operation aborted.';
   cTXT0001718 = 'Another user is currently processing this release.';
   cTXT0001719 = 'Ship Qty  : ';
   cTXT0001720 = 'Labels Qty: ';

implementation

end.
