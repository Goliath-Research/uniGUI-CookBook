unit WC_7785;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  pm_classfilter;

procedure TestTFrmPMClassFilter;
var
  AClass : String;
begin
  AClass := 'TEST';
  SetPMClassFilter(AClass);
end;

initialization

  TTestRepo.RegisterTest('WC-7785', 'PM', 'pm_classfilter', 'SetPMClassFilter', TestTFrmPMClassFilter);

end.
