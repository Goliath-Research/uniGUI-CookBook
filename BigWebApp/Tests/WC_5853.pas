unit WC_5853;

interface

implementation

uses
  TestReg,
  crmword_qkfilter,
  Dialogs,
  System.SysUtils;

procedure Test1;
var
  CRMWordID: Real;
  CurRecSource: String;
  CurRecSourceID, CurRecContactID: Real;
  CurrentRecord: Boolean;
begin
  if DoQuickFilter( CRMWordID , CurRecSource, CurRecSourceID, CurRecContactID, CurrentRecord)then
    if CurrentRecord then
      Showmessage('Current Record Contact ID: ' + Floattostr(CurRecContactID));
end;

initialization

  TTestRepo.RegisterTest('WC-5853', 'CRM_Quote', 'crmword_qkfilter', 'DoQuickFilter', Test1);

end.
