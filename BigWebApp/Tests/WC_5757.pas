unit WC_5757;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  crm_ccud;

procedure TestDoCustomCallList;
begin
    DoCustomCallList;
end;

procedure TestAddToCustomCallList;
var
  ATelephone, ACaller: string;
begin
    AddToCustomCallList( ATelephone, ACaller );
end;


initialization
  TTestRepo.RegisterTest('WC-5757', 'Crm_Callcenter', 'crm_ccud', 'DoCustomCallList', TestDoCustomCallList);
  TTestRepo.RegisterTest('WC-5757', 'Crm_Callcenter', 'crm_ccud', 'AddToCustomCallList', TestAddToCustomCallList);
end.
