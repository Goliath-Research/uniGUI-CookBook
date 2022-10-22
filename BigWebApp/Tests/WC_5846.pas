unit WC_5846;

interface

implementation

uses
  TestReg,
  crmword_edit;

procedure TestDoCRMWordEdit;

var AID: Real;
    AOverwriteDoc: Boolean;
begin
  AID:= 123;
  AOverwriteDoc:= True;
  DoCRMWordEdit( AID, AOverwriteDoc );
end;

initialization

  TTestRepo.RegisterTest('WC_5846', 'Crm_Word', 'crmword_edit', 'DoCRMWordEdit', TestDoCRMWordEdit);

end.
