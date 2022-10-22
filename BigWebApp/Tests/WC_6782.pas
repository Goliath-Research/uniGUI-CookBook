unit WC_6782;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  XMLSetUp;

procedure Test1;
begin
      DoXMLSetUp;
end;

initialization

  TTestRepo.RegisterTest('WC-6782', 'Iqimp', 'XMLSetUp', 'DoXMLSetUp', Test1);

end.
