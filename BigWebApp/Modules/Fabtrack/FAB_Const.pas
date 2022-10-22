unit FAB_Const;

interface

const
   FAB_START_MAINT = 0;   {obsolete}
   FAB_TRACK_MAINT = 1;
   FAB_SNDOP_MAINT = 2;
   FAB_TRACK_MAINT_BY_WORKORDER = 3;


   TXT_MAT_EXCEP                = 'Material exception';
   TXT_LOT_NOT_ASSIGNED         = 'Lot is not assigned';
   TXT_LOC_NOT_ASSIGNED         = 'Primary Material Location is not assigned';
   TXT_ATT_MAT_LOC_NOT_ASSIGNED = 'Attached Material Location is not assigned';
   TXT_QTY_MISMATCH             = 'WO/Lot qty mismatch';
   TXT_READY                    = 'Ready';
   TXT_NOT_APPLICABLE           = 'N/A';
   
resourcestring
   fab_msg1000 = 'Split qty must be less than original lot qty';
   fab_msg1001 = 'Material is not allocated';
   fab_msg1002 = 'Lot # is not assigned';
implementation

end.
