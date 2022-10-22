unit WC_9402;

interface

implementation

uses
  TestReg,
  System.Variants,
  IQMS.WebVcl.Documents,
  WC_9402_Frm,
  uniGUIApplication,
  SysUtils,
  uniGUIDialogs;

procedure Test1;
begin
  DoShowModal9402;
end;

procedure Test2;
var
  frm : TWC_9402;
begin
  frm := TWC_9402.Create(UniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-9402', 'IQWebVcl', 'TIQWebDocs', 'DoShowModal9402', Test1, 1);
  TTestRepo.RegisterTest('WC-9402', 'IQWebVcl', 'TIQWebDocs', 'TWC_9402.Create().ShowModal', Test2, 2);

end.
