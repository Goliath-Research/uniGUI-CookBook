unit WC_7075;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  precisiondlg;

procedure Test1;
var
 Form: TFrmPrecisionDlg;
begin
   Form := TFrmPrecisionDlg.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7075', 'Iqspc', 'precisiondlg', 'create', Test1);
end.
