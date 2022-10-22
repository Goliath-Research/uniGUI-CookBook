unit WC_6120;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  System.Generics.Collections,
  Frlpost;

procedure Test;
begin
  DoShowUnpostedBatches;
end;

initialization

  TTestRepo.RegisterTest('WC-6120', 'Frx', 'Frlpost', 'DoShowUnpostedBatches', Test);

end.
