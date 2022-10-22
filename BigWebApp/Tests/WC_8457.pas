unit WC_8457;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  SI_Dialog;

procedure test1;
var
AParams:TScanParamCargo;
begin
  AParams.Doc_Library_ID := 1234;
  AParams.CanChangeLib := true;
  AParams.FileName := 'test';
   TFrmScanImageDialog.DoShowModal(AParams);
end;

initialization
  TTestRepo.RegisterTest('WC-8457', 'Scan_Image',  'SI_Dialog', 'DoShowModal', test1);
end.
