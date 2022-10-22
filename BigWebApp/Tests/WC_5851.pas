unit WC_5851;

interface

implementation

uses
  TestReg,
  System.Variants,
  crmword_options;

procedure Test1;
begin
  DoMailMergeOptions;
end;

initialization

  TTestRepo.RegisterTest('WC-5851', 'Crm_Word', 'FrmCRMWordOption', 'DoMailMergeOptions', Test1);
end.
