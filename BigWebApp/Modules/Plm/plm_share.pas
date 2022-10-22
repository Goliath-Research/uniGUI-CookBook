unit plm_share;

interface

const
  cPLM_KIND_RFQ = 0;
  cPLM_KIND_SOURCED = 1;

type
  TPLM_Param_Record = record
    Parent_ID  : Real;
    ItemNo     : string;
    Descrip    : string;
    Rev        : string;
    Kind       : Integer;
    MfgType    : string;
    FClass     : string;
    Is_Prim_Mat: string;
  end;

implementation

end.
