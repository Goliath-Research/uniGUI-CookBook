unit WC_6771;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ImpInput;

procedure Test1;
begin
  DoViewParsedFile;
end;

initialization

  TTestRepo.RegisterTest('WC-6771', 'Iqimp', 'ImpInput', 'DoViewParsedFile', Test1);

end.
