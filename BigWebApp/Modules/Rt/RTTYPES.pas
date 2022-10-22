unit RtTypes;

interface

type
  TCellOrMfgType = ( cmNone, cmCell, cmMfgType, cmUnAssigned );


type
  TCellMfgType = record
    CellOrMfgType : TCellOrMfgType;
    Cell          : string;
    MfgCell_ID    : Real;
    MfgType       : string;
    Lookup_MfgType: string;
    UseBaseMfgType: Boolean;
  end;

  TJumpToSchedCargo = class
    Filter: TCellMfgType;
    Cntr_Sched_ID: Real;
    Work_Center_ID: Real;
  end;

type
  TDownTimeInterval = (inNone, inCurrentShift, inCurrentShiftOpen, inCurrentShiftClosed, inPastShift);


implementation

end.
