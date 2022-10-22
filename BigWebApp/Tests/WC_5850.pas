unit WC_5850;

interface

implementation

uses
  TestReg,
  crmword_opendoc_options,
  Dialogs,
  System.SysUtils;

procedure Test1;
var
  CRMWordDocID: Real;
  Options: TFilterOptions;
  CampaignID: Int64;
begin
  CRMWordDocID := 19;
  if DoMailMergeOpenWordDocOptions(CRMWordDocID, Options, CampaignID) then
    Showmessage('CampaignID: ' + Floattostr(CampaignID));
end;

initialization

  TTestRepo.RegisterTest('WC-5850', 'CRM_Word', 'crmword_opendoc_options', 'DoMailMergeOpenWordDocOptions', Test1);

end.
