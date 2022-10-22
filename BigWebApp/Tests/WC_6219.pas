unit WC_6219;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  ict_diagram;

procedure Test1;
var
  LFrmICTDiagram : TFrmICTDiagram;

begin
  LFrmICTDiagram := TFrmICTDiagram.Create(uniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-6219', 'Ict', 'ict_diagram', 'create', Test1);
end.
