unit WC_6678;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  ediXMLShare;

procedure TestCreateXMLfile;
begin
  CreateXMLfile(25,true);
end;

initialization

  TTestRepo.RegisterTest('WC-6678', 'Iqedi', 'ediXMLShare', 'CreateXMLfile', TestCreateXMLfile);

end.
