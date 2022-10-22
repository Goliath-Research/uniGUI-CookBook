unit spc_const;

interface

const
  // Last value: 81

  SHOW_SPC_INPROCLOG              = 1;   //  AID = ARINVT.ID
  SHOW_SPC_GAGEMNGR               = 2;

  SHOW_CONTROL_PLAN               = 3;
  SHOW_FMEA                       = 4;
  SHOW_FMEA_MEDICAL               = 5;

  SHOW_SPC_SETUP                  = 10;  //  Will prompt user for values
  SHOW_SPC_PART_SETUP             = 11;  //  AID = ARINVT.ID
  SHOW_SPC_SNDOP_SETUP            = 12;  //  AID = SNDOP.ID
  SHOW_SPC_WORKCENTER_SETUP       = 13;  //  AID = WORK_CENTER.ID
  SHOW_SPC_PLM_SETUP              = 66;  //  AID = PLM_LINKS.ID
  SHOW_SPC_PMEQMT_SETUP           = 68;  //  AID = PMEQMT.ID
  SHOW_SPC_QINVT_SETUP            = 79;  //  AID = QINVT.ID
  SHOW_SPC_CRM_OPPORTUNITY_SETUP  = 80;  //  AID = CRM_OPPORTUNITY.ID

  // SPC Quality Projects
  SHOW_SPC_PROCESS                = 20;  //  AID = SPC_PROCESS.ID
  SHOW_SPC_PROCESS_APQP           = 21;  //  AID = APQP.ID
  SHOW_SPC_PROCESS_CAR            = 22;  //  AID = CAR_ITEM.ID
  SHOW_SPC_PROCESS_PPAP           = 23;  //  AID = PPAP.ID

  // SPC (main)
  SHOW_SPC_SPCMAIN                = 30;  // AID = ARINVT.ID
  SHOW_SPCMAIN_ARINVT             = 31;  // AID is assumed to be ARINVT.ID
  SHOW_SPCMAIN_SNDOP              = 32;  // AID is assumed to be SNDOP.ID
  SHOW_SPCMAIN_WORKCENTER         = 33;  // AID is assumed to be WORK_CENTER.ID
  SHOW_SPCMAIN_PMEQMT             = 69;  // AID is assumed to be PMEQMT.ID
  SHOW_SPCMAIN_QINVT              = 73;  // AID is assumed to be QINVT.ID
  SHOW_SPCMAIN_CRM_OPPORTUNITY    = 74;  // AID is assumed to be CRM_OPPORTUNITY.ID
  SHOW_SPCMAIN_SUBGROUP           = 81;  // AID is assumed to be SPC_SUBGROUP.ID

  // Quick Inspection
  SHOW_SPCQK                      = 40;
  SHOW_SPCQK_ARINVT               = 41;  // AID is assumed to be ARINVT.ID
  SHOW_SPCQK_SNDOP                = 42;  // AID is assumed to be SNDOP.ID
  SHOW_SPCQK_WORKCENTER           = 43;  // AID is assumed to be WORK_CENTER.ID
  SHOW_SPCQK_PMEQMT               = 70;  // AID is assumed to be PMEQMT.ID
  SHOW_SPCQK_QINVT                = 75;  // AID is assumed to be QINVT.ID
  SHOW_SPCQK_CRM_OPPORTUNITY      = 76;  // AID is assumed to be CRM_OPPORTUNITY.ID

  // Touchscreen Quick Inspection
  SHOW_SPCQK_SD                   = 50;
  SHOW_SPCQK_ARINVT_SD            = 51;  // AID is assumed to be ARINVT.ID
  SHOW_SPCQK_SNDOP_SD             = 52;  // AID is assumed to be SNDOP.ID
  SHOW_SPCQK_WORKCENTER_SD        = 53;  // AID is assumed to be WORK_CENTER.ID
  SHOW_SPCQK_PMEQMT_SD            = 71;  // AID is assumed to be PMEQMT.ID
  SHOW_SPCQK_QINVT_SD             = 77;  // AID is assumed to be QINVT.ID
  SHOW_SPCQK_CRM_OPPORTUNITY_SD   = 78;  // AID is assumed to be CRM_OPPORTUNITY.ID

  SHOW_INSPECTION_APPROVAL        = 67;

  NEW_CONTROL_PLAN                = 61;
  NEW_FMEA                        = 62;
  NEW_FMEA_MEDICAL                = 63;

  JUMP_SPC_SUBGROUP               = 64;  // AID is assumed to be SPC_SAMPLE.ID
  JUMP_SPC_SAMPLE                 = 65;  // AID is assumed to be SPC_SAMPLE.ID

  SPC_AUTOCHART_ARINVT            = 72;  // AID is assumed to be ARINVT.ID

  // Message
  UM_RefreshDisplay               = 500;
  UM_CanCloseForm                 = 501;

implementation

end.
