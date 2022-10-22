unit RD_Share;

interface

const
   cnstRD_CONSTRAINT_RM = 'Purch Mtrl';
   cnstRD_CONSTRAINT_MC = 'Machine Cap';
   cnstRD_CONSTRAINT_IS = 'In Service';
   cnstRD_CONSTRAINT_LC = 'Labor Cap';
   cnstRD_CONSTRAINT_TL = 'Tooling';

   cnst1ST_NODE_MARGIN         = 9;
   cnstSPACE_BETWEEN_NODES     = 25; // 18;
   cnstMFG_ITEMS               = TRUE;
   cnstSPACE_BETWEEN_MFG_NODES = 35;

type
  TRDDispOptions = record
    ShowOnHand     : Boolean;
    ShowNonComitted: Boolean;
    ShowStdCost    : Boolean;
    ShowExtCost    : Boolean;

    ShowLeadTime   : Boolean;

    ShowCTP        : Boolean;
    ShowCTP_Date   : Boolean;
  end;

  TOnAssignTextMfgItem = procedure( Sender: TObject ) of object;

function IsRawMatUsingATPCalc: Boolean;



implementation

uses
  IQMS.Common.DataLib;

function IsRawMatUsingATPCalc: Boolean;
begin
  Result:= SelectValueAsString('select ctp_use_raw_mat_atp from params') = 'Y';
end;

end.
