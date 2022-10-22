unit M_Type;

interface

type
  TMeterFilterMode = ( mfOvervall, mfEPlant, mfMfgCell, mfWorkCenter );

type
  TMeterFilter = record
    Mode          : TMeterFilterMode;
    MfgType       : string;
    MfgCell       : string;
    EPlant_ID     : Real;
    Work_Center_ID: Real;
end;

implementation

end.
