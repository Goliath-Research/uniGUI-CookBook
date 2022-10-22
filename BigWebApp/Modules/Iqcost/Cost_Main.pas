unit Cost_Main;

interface

procedure DoMain( AKind: Integer; AID: Real; AOptional: array of Variant);

implementation

uses
  Cost_Const;
  { TODO -omugdha -cWEBIQ : Dependancy on  TranAcct,
  JC_Main module.
  TranAcct,
  JC_Main; }

procedure DoMain( AKind: Integer; AID: Real; AOptional: array of Variant);
begin
  (*  { TODO -omugdha -cWEBIQ : Dependancy on  TranAcct,  JC_Main module. }
  case AKind of
    COST_TRANACCT    : DoTransLogAccount; {TranAcct.pas}
    COST_PROCESS_COST: DoJCMain;          {JC_Main.pas}

  end;
  *)
end;


end.
