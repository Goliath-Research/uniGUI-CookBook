unit WC_6118;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  System.Generics.Collections,
  FrlCtrl;

procedure Test;
begin
  DoFrlSysCtrl;
end;

initialization

  TTestRepo.RegisterTest('WC-6118', 'Frx', 'FrlCtrl', 'DoFrlSysCtrl', Test);

end.
