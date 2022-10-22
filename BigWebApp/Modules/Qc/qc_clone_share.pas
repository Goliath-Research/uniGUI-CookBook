unit qc_clone_share;

interface
  uses
  SysUtils,
  Db,
  Classes;

type
  TCloneParams = record
    NewHeader_ID   : Real;
    OldHeader_ID   : Real;
    HeaderTableName: string;      // APQP, PPAP, ECO, CAR, WF_HEADER
    Kind           : string;      // APQP, CAR, CAPA, DEV etc
    ModuleName     : string;      // APQP, CAR, ECO, PPAP, WORKFLOW
  end;                

implementation

end.
