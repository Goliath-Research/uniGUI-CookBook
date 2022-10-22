unit WC_5669;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_pick_source,
  IQMS.Common.PrincipalSourceTypes;

procedure Test1;
var ASource: TPrincipalSourceType;
    ASourceID, AContactID: Real;
    ASourceDisplay:String;
begin
//  ASource := srctCustomer;
  DoSelectPrinciple(ASource,ASourceID,AContactID,ASourceDisplay);
end;
//
//procedure Test2;
//begin
//  SetGlobalFilter;
//end;


initialization

  TTestRepo.RegisterTest('WC-5669', 'CRM', 'crm_pick_source', 'DoSelectPrinciple', Test1);
//  TTestRepo.RegisterTest('WC-5669', 'CRM', 'crm_pick_source', 'SetGlobalFilter', Test2);
end.
