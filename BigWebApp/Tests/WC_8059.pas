unit WC_8059;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  System.Generics.Collections,
  DocLbr;

procedure Test;
begin
  DoDocLibrary;
end;

initialization

  TTestRepo.RegisterTest('WC-8059', 'Qc_Doc', 'DocLbr', 'DoDocLibrary', Test);

end.
