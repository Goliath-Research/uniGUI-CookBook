unit ven_rfq_share;

interface

uses
  Vcl.Controls;

type
  TVendor_RFQ_Cargo = record
    Source: string;
    Source_ID: Real;
    Arinvt_ID: Real;
    QInvt_ID: Real;
    PMEqmt_ID: Real;
    Qty: Real;     // used when creating an entry originated in material exception
  end;

implementation

end.
