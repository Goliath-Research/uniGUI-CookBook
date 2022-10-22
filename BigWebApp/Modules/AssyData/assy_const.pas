unit assy_const;

interface

type
  TAccessDocsBy = (ldmNone, ldmByTaLabor, ldmByWorkorder);

const
  SCROLL_LEFT  = 1;
  SCROLL_RIGHT = 2;

  NONE         = 0;
  CLOCK        = 1;     // Time Clock
  REJECTS      = 2;     // Rejects
  INT_DOCS     = 3;     // Internal Docs
  EXT_DOCS     = 4;     // External Docs
  INV_LM       = 5;     // Inventory Label Matrix
  SPCQUICKADD  = 6;     // SPC Quick Add Inspection
  PM           = 7;     // MRO
  LINE_CLR     = 8;     // Line Clearance
  FINAL_ASSY   = 9;     // Final Assembly
  REJECTS_EX   = 10;    // Rejects with known TA_LABOR_ID
  INCOMPLETE_ASSY = 11; // Incomplete Assembly
  DISPATCH_LIST= 12;    // Dispatch List
  INVTRANSLOC  = 13;    // Inventory and Transactions
  HEIJUNKA     = 14;    // Heijunka Box
  KANBAN       = 15;    // Kanban
  WO_MATERIALS = 16;    // Workorder Materials
  SERIAL_TRACKING = 17; // Serial # Tracking
  PALLET_BUILDER  = 18; // Pallet Builder
  INVENTORY_AVAIL = 28; // Inventory Availability
  REWORK_REPORT = 29;   // Rework Reporting (based on PRW with mfgtype limited to REWORK)
  DISPATCH_LIST_BY_GROUP = 30;    // Dispatch List By Group
                
  // Additional - These are used by the Assembly Data menu
  CONFIGURE_ASSEMBLY_DATA = 19;
  SECURITY_INSPECTOR = 20;
  LOGIN = 21;
  HELP_CONTENTS = 22;
  HELP_KNOWLEDGE_CENTER = 23;
  HELP_WIKI = 24;
  HELP_ABOUT = 25;
  REPORTS = 26;
  WHOISLOGGEDIN = 27;

  NOTIFY_CREATE_CHILD = 1;
  NOTIFY_RESIZE_CHILD_TIME_CLOCK = 2;
  NOTIFY_CREATE_CHILD_REJECTS = 3;
  NOTIFY_REFRESH_COLOR = 4;
  NOTIFY_FIT_INSIDE_MAIN_PANEL = 5;


  INVTRANSLOC_BY_ID = 30;

  AssemblyDataChildForms =
  [NONE         ,
   CLOCK            ,
   REJECTS          ,
   INT_DOCS         ,
   EXT_DOCS         ,
   INV_LM           ,
   SPCQUICKADD      ,
   PM               ,
   LINE_CLR         ,
   FINAL_ASSY       ,
   REJECTS_EX       ,
   INCOMPLETE_ASSY  ,
   DISPATCH_LIST    ,
   INVTRANSLOC      ,
   HEIJUNKA         ,
   KANBAN           ,
   WO_MATERIALS     ,
   SERIAL_TRACKING  ,
   PALLET_BUILDER   ,
   INVENTORY_AVAIL  ,
   REWORK_REPORT    ,
   DISPATCH_LIST_BY_GROUP
  ];

resourcestring
  assy_msg0000 = 'Exit AssemblyData?';
  assy_msg0001 = 'Exit AssemblyData';
  assy_msg0002 = 'Processing.  Please wait.';
  assy_msg0003 = 'Closing active module';
  assy_msg0004 = 'Error';
  assy_msg0005 = 'Accessing';
  assy_msg0006 = 'Employee %s is not assigned job description and/or certification level to run process # %s and/or the certification level of the employee has expired';

  assy_msg0007 = 'Time Clock';
  assy_msg0008 = 'Line Clearance';
  assy_msg0009 = 'Final Assembly';
  assy_msg0010 = 'Pallet Builder';
  assy_msg0011 = 'Internal Documents';
  assy_msg0012 = 'External Documents';
  assy_msg0013 = 'Inventory Transactions and Locations';
  assy_msg0014 = 'Work Order Materials && Components';
  assy_msg0015 = 'Quick Inspection';
  assy_msg0016 = 'MRO Work Order';
  assy_msg0017 = 'Barcoded Labels';
  assy_msg0018 = 'Serial # Tracking';
  assy_msg0019 = 'Rejects';
  assy_msg0020 = 'Dispatch List';
  assy_msg0021 = 'Kanban Supermarket';
  assy_msg0022 = 'Heijunka Box Load Leveling';

  assy_msg0023 = 'Cannot Report Quantity. Process # %s was not completed.';
  assy_msg0024 = 'Inventory Availability';
  assy_msg0025 = 'Dispatch List By Group ID';
  assy_msg0026 = 'Invalid or inactive employee - operation aborted';
  assy_msg0027 = 'Employee is terminated - operation aborted';
  assy_msg0028 = 'Employee is inactive - operation aborted';
  assy_msg0029 = 'Exit Dispatch List By Group?';
  assy_msg0030 = 'Employee# is missing - operation aborted.';
  assy_msg0031 = 'Unable to establish logged in task for work order %d - operation aborted';
  assy_msg0032 = 'Unable to establish grouping process task for workorder %d - operation aborted';
  assy_msg0033 = 'Unknown Task ID - operation aborted';
  assy_msg0034 = 'Not tasked in - operation aborted';
  assy_msg0035 = 'Parts to go must be greater than 0 - operation aborted.';
  assy_msg0036 = 'Inventory ID is undefined. Unable to continue.';
  assy_msg0037 = 'BOM ID is undefined. Unable to continue.';
  assy_msg0038 = 'Sequential task in/out is violated - operation aborted.';
  assy_msg0039 = '';
  assy_msg0040 = '';
  assy_msg0041 = '';
  assy_msg0042 = '';
  assy_msg0043 = '';
  assy_msg0044 = '';
  assy_msg0045 = '';
  assy_msg0046 = '';
  assy_msg0047 = '';
  assy_msg0048 = '';
  assy_msg0049 = '';
  assy_msg0050 = '';

  assy_txt1000 = 'Hide Module Toolbar';
  assy_txt1001 = 'Show Module Toolbar (Currently Hidden)';
                  
implementation

end.
