unit spcconst;

{ DO NOT USE - RETAINED FOR OLD CODE }

interface

const
    // Constant Name             // Value   // Value for AID Parameter
    SHOW_SPC_INPROCLOG           = 1;       //  AID = ARINVT.ID
    SHOW_SPC_GAGEMNGR            = 2;

    SHOW_CONTROL_PLAN            = 3;
    SHOW_FMEA                    = 4;
    SHOW_FMEA_MEDICAL            = 5;
    SHOW_SPC_VIEW_WORKCENTER     = 8;      //  AID = WORK_CENTER.ID

    SHOW_SPC_SETUP               = 10;     //  Will prompt user for values
    SHOW_SPC_PART_SETUP          = 11;     //  AID = ARINVT.ID
    SHOW_SPC_SNDOP_SETUP         = 12;     //  AID = SNDOP.ID
    SHOW_SPC_WORKCENTER_SETUP    = 13;     //  AID = WORK_CENTER.ID

    // SPC Quality Projects
    SHOW_SPC_PROCESS             = 20;     //  AID = SPC_PROCESS.ID
    SHOW_SPC_PROCESS_APQP        = 21;     //  AID = APQP.ID
    SHOW_SPC_PROCESS_CAR         = 22;     //  AID = CAR.ID
    SHOW_SPC_PROCESS_PPAP        = 23;     //  AID = PPAP.ID

    SHOW_SPC_SPCMAIN             = 30;      // AID = ARINVT.ID
    SHOW_SPCMAIN_ARINVT          = 31;      // AID is assumed to be ARINVT.ID
    SHOW_SPCMAIN_SNDOP           = 32;      // AID is assumed to be SNDOP.ID
    SHOW_SPCMAIN_WORKCENTER      = 33;      // AID is assumed to be WORK_CENTER.ID

    SHOW_SPCQK                   = 40;
    SHOW_SPCQK_ARINVT            = 41;      // AID is assumed to be ARINVT.ID
    SHOW_SPCQK_SNDOP             = 42;      // AID is assumed to be SNDOP.ID
    SHOW_SPCQK_WORKCENTER        = 43;      // AID is assumed to be WORK_CENTER.ID

    // Touchscreen
    SHOW_SPCQK_SD                = 50;
    SHOW_SPCQK_ARINVT_SD         = 51;      // AID is assumed to be ARINVT.ID
    SHOW_SPCQK_SNDOP_SD          = 52;      // AID is assumed to be SNDOP.ID
    SHOW_SPCQK_WORKCENTER_SD     = 53;      // AID is assumed to be WORK_CENTER.ID

    NEW_CONTROL_PLAN             = 61;
    NEW_FMEA                     = 62;
    NEW_FMEA_MEDICAL             = 63;

implementation

end.
